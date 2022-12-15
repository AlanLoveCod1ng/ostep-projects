#include <stdio.h>
#include "udp.h"
#include "mfs.h"
#include "message.h"

// client code
// client code
int main(int argc, char *argv[]) {
    int port = atoi(argv[1]);
    int rc;
    if ((rc = MFS_Init("localhost", port))<0) return -1;
    // MFS_DirEnt_t e;
    // e.inum = 0;
    // strcpy(e.name, "537");
    // rc = MFS_Write(0, (char*)&e, 64, 32);
    rc = MFS_Lookup(1, "..");
    // rc = MFS_Creat(0, MFS_DIRECTORY, "537");
    printf("rc:%d\n", rc);
    rc = MFS_Shutdown();
    return 0;
}


