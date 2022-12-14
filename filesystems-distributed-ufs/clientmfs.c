#include <stdio.h>
#include "udp.h"
#include "mfs.h"
#include "message.h"

// client code
int main(int argc, char *argv[]) {
    int port = atoi(argv[1]);
    int rc;
    if ((rc = MFS_Init("localhost", port))<0) return -1;
    char buffer[sizeof(MFS_DirEnt_t)];
    rc = MFS_Read(0, buffer, 0, 32);
    printf("rc:%d\n", rc);
    MFS_DirEnt_t *temp = (MFS_DirEnt_t *)(buffer);
    printf("name:%s, inum:%d\n", temp->name, temp->inum);
    rc = MFS_Shutdown();
    return 0;
}

