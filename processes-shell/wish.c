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
        exit(1);
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
                char *temp = strdup(current_path);
                free(current_path);
                if (strcmp(filename,"") != 0)
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

    int index = 0;
    int redir_count = 0;
    while (buffer[index])
    {
        if (buffer[index] == '>')
        {
            redir_count += 1;
            if (redir_count == 2)
            {
                err(0);
                return 0;
            }
        }
        index++;
    }
    const char redirect[2] = ">";
    char redirect_cmd[256];
    char redirect_file[256];
    char *token;
    token = strtok(buffer, redirect);
    strcpy(redirect_cmd, token);
    token = strtok(NULL, redirect);
    const char space[2] = " ";
    char file[256];
    file[0] = '\000';
    if (token != NULL)
    {
        strcpy(redirect_file,token);
        token = strtok(redirect_file,space);
        strcpy(file,token);
        token = strtok(NULL,space);
        if(token!=NULL){
            err(0);
            return 0;
        }
    }

    if (redir_count == 1 &&file[0] == '\000')
    {
        err(0);
        return 0;
    }
    

    char arg_temp[30][30];
    /* get the first token */
    token = strtok(redirect_cmd, space);
    /* walk through other tokens */
    int num_args = 0;
    while (token != NULL)
    {
        strcpy(arg_temp[num_args], token);
        token = strtok(NULL, space);
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
        int final_args_num = num_args;
        char *final_args[final_args_num + 1];
        for (int i = 0; i < final_args_num; i++)
        {
            final_args[i] = args[i];
        }
        final_args[final_args_num] = NULL;

        execute(final_args_num, final_args, file);
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