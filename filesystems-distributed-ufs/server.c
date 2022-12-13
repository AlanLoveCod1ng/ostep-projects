#include <stdio.h>
#include "udp.h"
#include "message.h"
#include "ufs.h"
#include <assert.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>

int sd;

unsigned int get_bit(unsigned int *bitmap, int position) {
   int index = position / 32;
   int offset = 31 - (position % 32);
   return (bitmap[index] >> offset) & 0x1;
}

void set_bit(unsigned int *bitmap, int position) {
   int index = position / 32;
   int offset = 31 - (position % 32);
   bitmap[index] |=  0x1 << offset;
}

void intHandler(int dummy) {
    UDP_Close(sd);
    exit(130);
}
// server code
int main(int argc, char *argv[]) {
	signal(SIGINT, intHandler);
	if(argc != 3){
		printf("Usage: server [portnum] [file-system-image]\n");
		exit(1);
	}
	int port = atoi(argv[1]);
	char *filename = argv[2];
    sd = UDP_Open(port);
    assert(sd > -1);
    while (1) {
		struct sockaddr_in addr;

		message_t m;
		
		printf("server:: waiting...\n");
		int rc = UDP_Read(sd, &addr, (char *) &m, sizeof(message_t));
		printf("server:: read message [size:%d contents:(%d)]\n", rc, m.mtype);
		if (rc > 0) {
			switch (m.mtype)
			{
			case MFS_INIT:

				break;
			
			case MFS_LOOKUP:
				lookup(&m, filename);
				break;
			case MFS_STAT:

				break;
			case MFS_WRITE:

				break;
			case MFS_READ:

				break;
			case MFS_CREAT:

				break;
			case MFS_UNLINK:

				break;
			case MFS_SHUTDOWN:

				break;
			default:
				break;
			}


			rc = UDP_Write(sd, &addr, (char *) &m, sizeof(message_t));
			printf("server:: reply\n");
		} 
    }
    return 0; 
}
int lookup(message_t *mptr, char *filename){
	int fd = open(filename, O_RDWR);
	assert(fd > -1);

    struct stat sbuf;
    int rc = fstqat(fd, &sbuf);
    assert(rc > -1);

    int image_size = (int) sbuf.st_size;

    void *image = mmap(NULL, image_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    assert(image != MAP_FAILED);

    super_t *s = (super_t *) image;
    printf("inode bitmap address %d [len %d]\n", s->inode_bitmap_addr, s->inode_bitmap_len);
    printf(" data bitmap address %d [len %d]\n", s->data_bitmap_addr, s->data_bitmap_len);

}


 
