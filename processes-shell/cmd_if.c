#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
int cmd_if(char *str)
{
    if (strcmp(str,"\n"))
    {
        return 0;
    }
    
    char *token;
    const char space[2] = " ";
    char arg_temp[30][30];
    /* get the first token */
    token = strtok(str, space);
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
        //execute
    }  
    else if (strcmp(argv[0], "if")==0 && strcmp(argv[argc-1],"fi")!=0)
    {
        //error
    }
    else if (strcmp(argv[0], "if")!=0 && strcmp(argv[argc-1],"fi")==0)
    {
        //error
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
        if (then_index == 2 ||then_index == argc-2 || then_index == 1)
        {
            printf("error");
        }
        int condition_index = 1;
        int equal = 0;
        for (int i = 1; i < then_index; i++)
        {
            if (strcmp(argv[i],"!=") == 0)
            {
                condition_index = i;
                break;
            }
            else if (strcmp(argv[i],"==") == 0)
            {
                condition_index = i;
                break;
            }
        }
        if (condition_index != then_index-2)
        {
            printf("error");
        }
        char condition_action[256];
        for (int i = 1; i < condition_index; i++)
        {
            strcat(condition_action,argv[i]);
            strcat(condition_action," ");
        }

        char *constant = argv[condition_index+1];

        char result_action[256];
        for (int i = then_index+1; i < argc-1; i++)
        {
            strcat(result_action,argv[i]);
            strcat(result_action," ");
        }
        
        //command process condition_action a
        

    }
    
    return 0;
}
//if a == 1 then if c == 1 then b fi fi
int main(int argc, char const *argv[])
{
    /* code */
    // char str[256];
    // strcpy(str, "if a == 1 then b fi");
    // cmd_if(str);
    return 0;
}
// #include<unistd.h>
// #include<sys/wait.h>
// #include<string.h>
// #include<stdio.h>
// #include<string.h>
// #include<stdlib.h>
// #include<fcntl.h>
// #include<ctype.h>

// int test(){
//     char error_message[30] = "An error has occurred\n";
//     int stat;
//     int rc = fork();
//     int ret = -1;
//     if(rc < 0){
//         write(STDERR_FILENO, error_message, strlen(error_message));
//     }else if(rc == 0){
//         //child process
//         // char *const argv[2] = {"r23", NULL};
//         execl("r23", NULL);
//     }else{
//         //parent process
//         waitpid(rc, &stat, 0);
//         if(WIFEXITED(stat)){
//             ret = WEXITSTATUS(stat);
//             //printf("Child process exit status = %d\n",WEXITSTATUS(stat));
//         }else{
//             printf("Unable to locate exit status\n");
//         }

//     }
//     return ret;
// }

// int main(int argc, char const *argv[])
// {
//     int ret = test();
    
//     printf("%i", ret);

//     return 0;
