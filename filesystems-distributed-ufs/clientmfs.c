#include <stdio.h>
#include "udp.h"
#include "mfs.h"
#include "message.h"

// client code
int main(int argc, char *argv[]) {
    int port = atoi(argv[1]);
    int rc;
    if ((rc = MFS_Init("localhost", port))<0) return -1;
    rc = MFS_Lookup(0, "537");
    printf("rc:%d\n", rc);
    rc = MFS_Shutdown();
    return 0;
}

