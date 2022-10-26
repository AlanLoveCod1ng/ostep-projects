#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "param.h"
#include "pstat.h"
int main(int argc, char const *argv[])
{
    int x = 1;
    if (argc != 3)
    {
        exit();
    }
    settickets(atoi(argv[2]));
    int iteration = atoi(argv[1]);
    for (int i = 0; i < iteration; i++)
    {
        x++;
    }
    
    exit();
    return 0;
}
