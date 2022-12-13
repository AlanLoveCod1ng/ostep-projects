#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

char **paths;
int path_num = 0;
FILE *fp;
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
        if (fp)
        {
            fclose(fp);
        }
        
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
    if (fp)
    {
        fclose(fp);
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

// int cmd_if(int argc, int *argv[]){

// }


int execute(int argc, char *argv[], char *filename)
{
    int stat;
    int rc = fork();
     int ret = -1;
    // child process
    if (rc == 0)
    {
        for (int i = 0; i < path_num; i++)
        {
            
            char current_path[256];
            strcpy(current_path, paths[i]);
            strcat(current_path, "/");
            strcat(current_path, argv[0]);
            if (access(current_path, X_OK) == 0)
            {
                char *temp = strdup(current_path);
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
        waitpid((pid_t)rc, &stat, WUNTRACED);
        if (WIFEXITED(stat))
        {
            ret = WEXITSTATUS(stat);
        }
        
    }
    else
    {
        printf("error");
    }
    return ret;
}

int command_process(char *buffer)
{
    buffer = strtok(buffer, "\n");
    int index = 0;
    int redir_count = 0;
    int ret = -1;
    if (!buffer)
    {
        return ret;
    }
    
    while (buffer[index])
    {
        if (buffer[index] == '>')
        {
            redir_count += 1;
            if (redir_count == 2)
            {
                err(0);
                return ret;
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
            return ret;
        }
    }

    if (redir_count == 1 &&file[0] == '\000')
    {
        err(0);
        return ret;
    }
    

    char arg_temp[20][256];
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

        ret = execute(final_args_num, final_args, file);
    }
    return ret;
}

int cmd_if(char *str)
{

    str = strtok(str,"\n");
    if (str ==  NULL)
    {
        return 0;
    }
    
    if (strcmp(str,"") == 0)
    {
        return 0;
    }
    
    char *token;
    const char space[2] = " ";
    char arg_temp[20][256];
    /* get the first token */
    token = strtok(str, space);
    if(token == NULL){
        return 0;
    }
    /* walk through other tokens */
    int argc = 0;
    while (token != NULL)
    {
        strcpy(arg_temp[argc], token);
        token = strtok(NULL, space);
        argc++;
    }
    char *argv[argc + 1];
    for (int i = 0; i < argc; i++)
    {
        argv[i] = arg_temp[i];
    }

    if (strcmp(argv[0], "if")!=0 && strcmp(argv[argc-1],"fi")!=0)
    {
        char temp[256];
        strcpy(temp, argv[0]);
        for (int i = 1; i < argc; i++)
        {
            strcat(temp, " ");
            strcat(temp, argv[i]);
        }
        
        command_process(temp);
    }  
    else if (strcmp(argv[0], "if")==0 && strcmp(argv[argc-1],"fi")!=0)
    {
        err(0);
        return 0;
    }
    else if (strcmp(argv[0], "if")!=0 && strcmp(argv[argc-1],"fi")==0)
    {
        err(0);
        return 0;
    }
    else
    {
        int then_index = 1;
        for(int i = 1; i < argc;i++)
        {
            if (strcmp(argv[i],"then") == 0)
            {
                then_index = i;
                break;
            }
              
        }
        if (then_index == argc-2)
        {
            return 0;
        }
        
        if (then_index == 2 || then_index == 1)
        {
            err(0);
            return 0;
        }
        int condition_index = 1;
        int equal = 0;
        for (int i = 1; i < then_index; i++)
        {
            if (strcmp(argv[i],"!=") == 0)
            {
                condition_index = i;
                equal = 0;
                break;
            }
            else if (strcmp(argv[i],"==") == 0)
            {
                condition_index = i;
                equal = 1;
                break;
            }
        }
        if (condition_index != then_index-2)
        {
            err(0);
            return(0);
        }
        char condition_action[256];
        for (int i = 1; i < condition_index; i++)
        {
            if (i == 1)
            {
                strcpy(condition_action,argv[i]);
            }
            else{
                strcat(condition_action,argv[i]);
            }
            strcat(condition_action," ");
        }

        char *constant = argv[condition_index+1];

        char result_action[256];
        for (int i = then_index+1; i < argc-1; i++)
        {
            if (i == then_index+1)
            {
                strcpy(result_action,argv[i]);
            }
            else
            {
                strcat(result_action,argv[i]);
            }
            
            strcat(result_action," ");
        }
        
        int condition_ret = command_process(condition_action);
        if ((equal && condition_ret == atoi(constant))||(!equal && condition_ret!= atoi(constant)))
        {
            cmd_if(result_action);
        }

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



            cmd_if(buffer);
        }
    }

    else if (argc == 2)
    {
        char buffer[256];
        fp = fopen(argv[1], "r");

        if (NULL == fp)
        {
            err(1);
        }

        while (fgets(buffer, 256, fp) != NULL)
        {
            cmd_if(buffer);
        }
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
