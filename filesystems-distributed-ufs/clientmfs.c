#include <stdio.h>
#include "udp.h"
#include "mfs.h"
#include "message.h"

// client code
// client code
int main(int argc, char *argv[]) {
    int port = atoi(argv[1]);
    int op = atoi(argv[2]);
    int rc;
    if ((rc = MFS_Init("localhost", port))<0) return -1;
    char e[4096];
    memcpy((void *)e, (void *)"START BLOCK 1",13);
    memcpy((void *)&e[4095-11], (void *)"END BLOCK 1",11);

   
    if (op == 1)
    {
        printf("lookup\n");
        rc = MFS_Lookup(0, "537");
    }
    if (op == 2)
    {
        printf("unlink\n");
        rc = MFS_Unlink(0, "537");
    }
    if (op == 3)
    {        
        printf("create\n");
        rc = MFS_Creat(0, MFS_REGULAR_FILE, "537");
    }  
    if (op == 4){
        printf("write\n");
        for (int i = 0; i < 30; i++)
        {
            rc = MFS_Write(1, (char*)&e, i*4096, 4096);
        }
        
        
    }
    if (op == 5){
        printf("read\n");
        rc = MFS_Read(1, (char*)&e, 0, 4096);
    }
    if (op == 6){
        printf("stat\n");
        MFS_Stat_t stat;
        rc = MFS_Stat(1, &stat);
        printf("type:%d\nsize:%d\n",stat.type,stat.size);
    }
    printf("rc:%d\n", rc);
    rc = MFS_Shutdown();
    return 0;
}


