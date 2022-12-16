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
        rc = MFS_Lookup(0, "537");
    }
    if (op == 2)
    {
        rc = MFS_Unlink(0, "537");
    }
    if (op == 3)
    {
        rc = MFS_Creat(0, MFS_REGULAR_FILE, "537");
    }  
    if (op == 4){
        rc = MFS_Write(1, (char*)&e, 0, 4096);
    }
    if (op == 5){
        rc = MFS_Read(1, (char*)&e, 0, 4096);
    }
    printf("rc:%d\n", rc);
    rc = MFS_Shutdown();
    return 0;
}


