#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
int main(int argc, char const *argv[])
{
    int x = 1;
    if (argc != 2)
    {
        exit();
    }
    
    int iteration = atoi(argv[1]);
    for (int i = 0; i < iteration; i++)
    {
        x++;
    }

    exit();
    return 0;
}
