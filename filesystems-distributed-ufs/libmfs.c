#include <stdio.h>
#include "mfs.h"
#include "udp.h"
#include "message.h"


int sd, rc;
struct sockaddr_in addrSnd, addrRcv; // Create client socket for sending, and receiving

// takes a host name and port number and uses those to find the server exporting the file system.
int MFS_Init(char *hostname, int port){
    sd = UDP_Open(20000);   //create the socket (open the client socket in port 20000)
    if (sd < 0) {
        return sd;
    }
    int rc = UDP_FillSockAddr(&addrSnd, hostname, port);
    if (rc < 0) {
        printf("client:: failed to send\n");
        return rc;
    } 
    return 0;
}

int MFS_Lookup(int pinum, char *name){

    // Failure modes: invalid pinum, name does not exist in pinum.
    if(pinum < 0 || name == NULL){
        return -1;
    }

    message_t msg;
    msg.mtype = MFS_LOOKUP;    //MFS_Stat
    msg.s_inum = pinum;
    strcpy(msg.s_name, name);
    
    //file handler

    rc = UDP_Write(sd, &addrSnd, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to send\n");
        return -1;
    }

    rc = UDP_Read(sd, &addrRcv, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to read\n");
        return -1;
    }

    return msg.r_inum;    //return inode number of name
}


int MFS_Stat(int inum, MFS_Stat_t *m){
    //Failure modes: inum does not exist.
    if(inum < 0 || m == NULL){
        return -1;
    }

    message_t msg;
    msg.s_inum = inum;
    msg.mtype = 3;    //MFS_Stat

    rc = UDP_Write(sd, &addrSnd, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to send\n");
        return -1;
    }

    rc = UDP_Read(sd, &addrRcv, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to read\n");
        return -1;
    }

    // The exact info returned is defined by MFS_Stat_t
    m->size = msg.r_mfs_stat.size;
    m->type = msg.r_mfs_stat.type;

    return 0;
}


// “Hello, World!” decode to "Write~Hello, World!~inum~offset~nbytes" .  (in server)
int MFS_Write(int inum, char *buffer, int offset, int nbytes){
    // Failure modes: invalid inum, invalid nbytes, invalid offset, not a regular file (because you can't write to directories).
    if(inum < 0 || buffer == NULL || offset < 0 || nbytes > 4096 || nbytes < 0){
        return -1;
    }

    message_t msg;
    msg.s_inum = inum;
    msg.mtype = 4;  //MFS_WRITE
    strcpy(msg.s_buffer, buffer);
    msg.s_offset = offset;
    msg.s_nbytes = nbytes;

    rc = UDP_Write(sd, &addrSnd, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to send\n");
        return -1;
    }

    rc = UDP_Read(sd, &addrRcv, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to read\n");
        return -1;
    }
    return 0;

}

int MFS_Read(int inum, char *buffer, int offset, int nbytes){
    //  Failure modes: invalid inum, invalid offset, invalid nbytes.
    if(inum < 0 || buffer == NULL || offset < 0 || nbytes > 4096){
        return -1;
    }

    message_t msg;
    msg.s_inum = inum;
    strcpy(msg.s_buffer, buffer);
    msg.s_offset = offset;
    msg.s_nbytes = nbytes;
    msg.mtype = 5;  //MFS_READ

    rc = UDP_Write(sd, &addrSnd, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to send\n");
        return -1;
    }

    rc = UDP_Read(sd, &addrRcv, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to read\n");
        return -1;
    }

    return 0;
}

int MFS_Creat(int pinum, int type, char *name){
    // Failure modes: pinum does not exist, or name is too long.
    if(pinum < 0 || name == NULL || strlen(name) > 28){
        return -1;
    }

    message_t msg;
    msg.s_inum = pinum;
    msg.mtype = type;
    strcpy(msg.s_name, name);
    msg.mtype = 6;   //MFS_CREAT

    rc = UDP_Write(sd, &addrSnd, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to send\n");
        return -1;
    }

    rc = UDP_Read(sd, &addrRcv, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to write\n");
        return -1;
    }
    
    return 0;
}


int MFS_Unlink(int pinum, char *name){
    //Failure modes: pinum does not exist, directory is NOT empty
    if(pinum < 0 || name == NULL){
        return -1;
    }

    message_t msg;
    msg.s_inum = pinum;
    strcpy(msg.s_name, name);
    msg.mtype = 7;   //MFS_UNLINK

    rc = UDP_Write(sd, &addrSnd, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to send\n");
        return -1;
    }

    rc = UDP_Read(sd, &addrRcv, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to write\n");
        return -1;
    }
    return 0;
}


int MFS_Shutdown(){

    message_t msg;
    msg.mtype = 8;   //MFS_SHUTDOWN

    rc = UDP_Write(sd, &addrSnd, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to send\n");
        return -1;
    }

    rc = UDP_Read(sd, &addrRcv, (char*) &msg, sizeof(message_t));
    if(rc < 0){
        printf("client:: failed to write\n");
        return -1;
    }

    return 0;
}
