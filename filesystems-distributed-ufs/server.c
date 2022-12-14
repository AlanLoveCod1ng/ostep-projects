#include <stdio.h>
#include "udp.h"
#include "message.h"
#include "ufs.h"
#include "mfs.h"
#include <assert.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>

#define UPPER_BOUND    (4294967295)

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

int mfs_lookup(message_t *mptr, char *filename){
	int fd = open(filename, O_RDWR);
    assert(fd > -1);

    struct stat sbuf;
    int rc = fstat(fd, &sbuf);
    assert(rc > -1);

    int image_size = (int) sbuf.st_size;

    void *image = mmap(NULL, image_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    assert(image != MAP_FAILED);

    super_t *s = (super_t *) image;
    void * inodeBitMap = (void *)((long)image + s->inode_bitmap_addr * UFS_BLOCK_SIZE );

    unsigned int bit = get_bit(inodeBitMap, mptr->s_inum);
    if (bit == 0)
	{
		return -1;
	}
	
    inode_t *inode = (inode_t *)((long)image + s->inode_region_addr * UFS_BLOCK_SIZE + mptr->s_inum*sizeof(inode_t));
	if (inode->type != UFS_DIRECTORY)
	{
		return -1;
	}
	
	for (int i = 0; i < DIRECT_PTRS; i++)
	{
		if (inode->direct[i] == UPPER_BOUND)
		{
			continue;
		}
		
		dir_ent_t *det = (dir_ent_t *)((long)image + inode->direct[i]*UFS_BLOCK_SIZE);
		if (strcmp(det->name, mptr->s_name) == 0)
		{
			return det->inum;
		}
	}
	close(fd);
    return -1;
}

int mfs_stat(message_t *mptr, char *filename){
	int fd = open(filename, O_RDWR);
    assert(fd > -1);

    struct stat sbuf;
    int rc = fstat(fd, &sbuf);
    assert(rc > -1);

    int image_size = (int) sbuf.st_size;

    void *image = mmap(NULL, image_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    assert(image != MAP_FAILED);

    super_t *s = (super_t *) image;
    void * inodeBitMap = (void *)((long)image + s->inode_bitmap_addr * UFS_BLOCK_SIZE );

    unsigned int bit = get_bit(inodeBitMap, mptr->s_inum);
    if (bit == 0)
	{
		return -1;
	}
	
    inode_t *inode = (inode_t *)((long)image + s->inode_region_addr * UFS_BLOCK_SIZE + mptr->s_inum*sizeof(inode_t));
	mptr->r_mfs_stat.type = inode->type;
	mptr->r_mfs_stat.size = inode->size;
	close(fd);
    return -1;
}

int mfs_read(message_t  *mptr, char *filename){
	int fd = open(filename, O_RDWR);
    assert(fd > -1);

    struct stat sbuf;
    int rc = fstat(fd, &sbuf);
    assert(rc > -1);

    int image_size = (int) sbuf.st_size;

    void *image = mmap(NULL, image_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    assert(image != MAP_FAILED);

    super_t *s = (super_t *) image;
    void * inodeBitMap = (void *)((long)image + s->inode_bitmap_addr * UFS_BLOCK_SIZE );

    unsigned int bit = get_bit(inodeBitMap, mptr->s_inum);
    if (bit == 0)
	{
		return -1;
	}
	
    inode_t *inode = (inode_t *)((long)image + s->inode_region_addr * UFS_BLOCK_SIZE + mptr->s_inum*sizeof(inode_t));
	void * file_start = (void *)((long)image + inode->direct[0]*UFS_BLOCK_SIZE);
	// check if the end position is out of file
	if (inode->size<(mptr->s_offset+mptr->s_nbytes) && mptr->s_nbytes < 4096)
	{
		return -1;
	}
	
	if (inode->type == MFS_DIRECTORY)
	{
		// check if read whole entry and if offset align the entry
		if (mptr->s_nbytes % sizeof(MFS_DirEnt_t) == 0 && mptr->s_offset % sizeof(MFS_DirEnt_t) == 0)
		{
			int index_block = mptr->s_offset/UFS_BLOCK_SIZE;
			int offset_block = mptr->s_offset%UFS_BLOCK_SIZE;
			void *start = (void *)((long)file_start+ (index_block*UFS_BLOCK_SIZE + offset_block));
			memcpy(mptr->r_buffer, start, mptr->s_nbytes);
		}
		else
		{
			return -1;
		}
		
		
	}
	else if(inode->type == MFS_REGULAR_FILE)
	{
		int index_block = mptr->s_offset/UFS_BLOCK_SIZE;
		int offset_block = mptr->s_offset%UFS_BLOCK_SIZE;
		void *start = (void *)((long)file_start+ (index_block*UFS_BLOCK_SIZE + offset_block));
		memcpy(mptr->r_buffer, start, mptr->s_nbytes);
	}
	else
	{
		return -1;
	}
	return 0;
	
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
				m.rc = mfs_lookup(&m, filename);
				break;
			case MFS_STAT:
				m.rc = mfs_stat(&m, filename);
				break;
			case MFS_WRITE:

				break;
			case MFS_READ:
				m.rc = mfs_read(&m, filename);
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



 
