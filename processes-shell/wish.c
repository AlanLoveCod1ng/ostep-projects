#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

char **paths;
int path_num = 0;
int err(int ifexit)
{
    char error_message[30] = "An error has occurred\n";
    write(STDERR_FILENO, error_message, strlen(error_message));

    if (ifexit)
    {
        for (int i = 0; i < path_num; i++)
        {
            free(paths[i]);
        }
        free(paths);
        exit(0);
    }
    return 0;
}

int path(int argc, char *argv[])
{

    for (int i = 0; i < path_num; i++)
    {
        free(paths[i]);
    }
    free(paths);
    paths = malloc((argc - 1) * sizeof(char *));
    for (int i = 0; i < argc - 1; i++)
    {
        paths[i] = malloc(sizeof(char) * 256);
    }
    for (int i = 0; i < argc - 1; i++)
    {
        strcpy(paths[i], argv[i + 1]);
    }
    path_num = argc - 1;

    return 0;
}

int cmd_exit(int argc, char *argv[])
{
    if (argc != 1)
    {
        err(0);
        return 0;
    }
    for (int i = 0; i < path_num; i++)
    {
        free(paths[i]);
    }
    free(paths);
    exit(0);
    return 0;
}

int cmd_cd(int argc, char *argv[])
{
    if (argc != 2)
    {
        err(0);
        return 0;
    }
    int res = chdir(argv[1]);
    if (res != 0)
    {
        err(0);
        return 0;
    }
    return 0;
}

int execute(int argc, char *argv[], char *filename)
{
    int rc = fork();
    // child process
    if (rc == 0)
    {
        for (int i = 0; i < path_num; i++)
        {
            char *current_path;
            current_path = malloc(sizeof(char) * 50);
            strcpy(current_path, paths[i]);
            strcat(current_path, "/");
            strcat(current_path, argv[0]);
            if (access(current_path, X_OK) == 0)
            {
                char*temp = strdup(current_path);
                free(current_path);
                if (filename != NULL)
                {
                    (void)close(STDOUT_FILENO);
                    open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
                }
                execv(temp, argv);
            }
        }
        err(1);
    }
    else if (rc > 0)
    {
        waitpid((pid_t)rc, NULL, WUNTRACED);
    }
    else
    {
        printf("error");
    }
    return 0;
}

int command_process(char *buffer)
{
    const char s[2] = " ";

    char arg_temp[30][30];

    char *token;

    /* get the first token */
    token = strtok(buffer, s);

    /* walk through other tokens */
    int num_args = 0;
    while (token != NULL)
    {
        strcpy(arg_temp[num_args], token);
        token = strtok(NULL, s);
        num_args++;
    }
    char *args[num_args + 1];
    for (int i = 0; i < num_args; i++)
    {
        args[i] = arg_temp[i];
    }
    if (strcmp(args[0], "path") == 0)
    {
        path(num_args, args);
    }
    else if (strcmp(args[0], "cd") == 0)
    {
        cmd_cd(num_args, args);
    }
    else if (strcmp(args[0], "exit") == 0)
    {
        cmd_exit(num_args, args);
    }
    else
    {
        // count number of redirection
        int redirection_index = -1;
        char *filename = NULL;
        int redirecion_wrong = 0;
        for (int i = 0; i < num_args; i++)
        {
            if (strcmp(args[i], ">") != 0)
            {
                continue;
            }
            
            if (i + 1 == num_args-1)
            {
                if (redirection_index != -1)
                {
                    redirecion_wrong = 1;
                    break;
                }
                redirection_index = i;
                filename = args[i + 1];
            }
            else{
                redirecion_wrong = 1;
            }
        }
        int final_args_num = 0;
        if (redirecion_wrong)
        {
            err(0);
            return 0;
        }
        else if (redirection_index == -1)
        {
            final_args_num = num_args;
        }
        else
        {
            final_args_num = redirection_index;
        }
        char *final_args[final_args_num + 1];
        for (int i = 0; i < final_args_num; i++)
        {
            final_args[i] = args[i];
        }
        final_args[final_args_num] = NULL;

        execute(final_args_num, final_args, filename);
    }
    return 0;
}

int main(int argc, char const *argv[])
{
    paths = malloc(sizeof(char *));
    paths[0] = malloc(sizeof(char) * 256);
    strcpy(paths[0], "/bin");
    path_num = 1;
    if (argc == 1)
    {
        while (1)
        {
            printf("wish> ");
            char buffer[256];
            char *b = buffer;
            size_t buffer_size = 256;
            size_t length = getline(&b, &buffer_size, stdin);
            buffer[length - 1] = '\0';

            command_process(buffer);
        }
    }

    else if (argc == 2)
    {
        char buffer[256];
        FILE *fp = fopen(argv[1], "r");

        if (NULL == fp)
        {
            err(1);
        }

        while (fgets(buffer, 256, fp) != NULL)
        {
            command_process(strtok(buffer, "\n"));
        }
        fclose(fp);
    }
    else
    {
        err(1);
    }

    for (int i = 0; i < path_num; i++)
    {
        free(paths[i]);
    }
    free(paths);
    return 0;
}