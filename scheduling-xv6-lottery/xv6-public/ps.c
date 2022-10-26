#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "param.h"
#include "pstat.h"
int main(int argc, char const *argv[])
{
    struct pstat pstat1;
    getpinfo(&pstat1);
    for (int i = 0; i < NPROC; i++)
    {
        if (!pstat1.inuse[i])
        {
            continue;
        }
        
        printf(1,"pid:%d   tickets:%d   ticks:%d\n",pstat1.pid[i],pstat1.tickets[i],pstat1.ticks[i]);
    }
    exit();
    return 0;
}
