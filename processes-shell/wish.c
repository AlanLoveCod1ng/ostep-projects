#include <stdio.h>
#include <unistd.h>
int main(int argc, char const *argv[])
{
    if (argc == 1)
    {
        /* code */
    }
    else if (argc == 0)
    {
        while (1)
        {
            printf("wish>");
        }
        /* code */
    }
    else{
        char error_message[30] = "An error has occurred\n";
        write(STDERR_FILENO, error_message, strlen(error_message)); 
    }
    return 0;
}