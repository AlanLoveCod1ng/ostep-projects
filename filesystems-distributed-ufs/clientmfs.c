#include <stdio.h>
#include "udp.h"
#include "mfs.h"
#include "message.h"

// client code
int main(int argc, char *argv[]) {
    int port = atoi(argv[1]);
    int rc;
    if ((rc = MFS_Init("localhost", port))<0) return -1;
    char buffer[32];
    rc = MFS_Read(123, buffer, 100, 100);
    rc = MFS_Shutdown();
    return 0;
}

