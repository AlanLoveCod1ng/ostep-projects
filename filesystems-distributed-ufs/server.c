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
	int inodeBitBlock = mptr->s_inum/(UFS_BLOCK_SIZE*8);
	int inodeBitOffset= mptr->s_inum%(UFS_BLOCK_SIZE*8);
    void * inodeBitMap = (void *)((long)image + (s->inode_bitmap_addr+inodeBitBlock) * UFS_BLOCK_SIZE );

    unsigned int bit = get_bit(inodeBitMap,inodeBitOffset);
    if (bit == 0)
	{
		return -1;
	}
	
    int inodeRegionBlock = mptr->s_inum*sizeof(inode_t)/UFS_BLOCK_SIZE;
	int inodeRegionOffset = mptr->s_inum*sizeof(inode_t)%UFS_BLOCK_SIZE;
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset*sizeof(inode_t));
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
		void *block_start = (void *)((long)image + inode->direct[i]*UFS_BLOCK_SIZE);
		int num_det = UFS_BLOCK_SIZE/sizeof(dir_ent_t);
		for (int j = 0; j < num_det; j++)
		{
			dir_ent_t *det = (dir_ent_t *)((long)block_start + j*sizeof(dir_ent_t));
			if (det->inum == -1)
			{
				continue;
			}
			
			if (strcmp(det->name, mptr->s_name) == 0)
			{
				return det->inum;
			}
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
	int inodeBitBlock = mptr->s_inum/(UFS_BLOCK_SIZE*8);
	int inodeBitOffset= mptr->s_inum%(UFS_BLOCK_SIZE*8);
    void * inodeBitMap = (void *)((long)image + (s->inode_bitmap_addr+inodeBitBlock) * UFS_BLOCK_SIZE );

    unsigned int bit = get_bit(inodeBitMap, inodeBitOffset);
    if (bit == 0)
	{
		return -1;
	}
	
    int inodeRegionBlock = mptr->s_inum*sizeof(inode_t)/UFS_BLOCK_SIZE;
	int inodeRegionOffset = mptr->s_inum*sizeof(inode_t)%UFS_BLOCK_SIZE;
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset*sizeof(inode_t));
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
	int inodeBitBlock = mptr->s_inum/(UFS_BLOCK_SIZE*8);
	int inodeBitOffset= mptr->s_inum%(UFS_BLOCK_SIZE*8);
    void * inodeBitMap = (void *)((long)image + (s->inode_bitmap_addr+inodeBitBlock) * UFS_BLOCK_SIZE );

    unsigned int bit = get_bit(inodeBitMap, inodeBitOffset);
    if (bit == 0)
	{
		return -1;
	}

	int inodeRegionBlock = mptr->s_inum*sizeof(inode_t)/UFS_BLOCK_SIZE;
	int inodeRegionOffset = mptr->s_inum*sizeof(inode_t)%UFS_BLOCK_SIZE;
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset*sizeof(inode_t));
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
			int start_index_block = mptr->s_offset/UFS_BLOCK_SIZE;
			int start_offset_block = mptr->s_offset%UFS_BLOCK_SIZE;
			int end_index_block = (mptr->s_offset+mptr->s_nbytes)/UFS_BLOCK_SIZE;
			int end_offset_block = (mptr->s_offset+mptr->s_nbytes)%UFS_BLOCK_SIZE;
			if (start_index_block == end_index_block)
			{
				void *start = (void *)((long)image + (long)start_offset_block+ inode->direct[start_index_block]*UFS_BLOCK_SIZE);
				memcpy(mptr->r_buffer, start, mptr->s_nbytes);
			}
			else{
				void *start1 = (void *)((long)image + (long)start_offset_block+ inode->direct[start_index_block]*UFS_BLOCK_SIZE);
				memcpy(mptr->r_buffer, start1, UFS_BLOCK_SIZE - start_offset_block);
				void *start2 = (void *)((long)image + inode->direct[end_index_block]*UFS_BLOCK_SIZE);
				memcpy(&mptr->r_buffer[UFS_BLOCK_SIZE - start_offset_block], start2, end_offset_block);
			}
			
		}
		else
		{
			return -1;
		}
		
		
	}
	else if(inode->type == MFS_REGULAR_FILE)
	{
		int start_index_block = mptr->s_offset/UFS_BLOCK_SIZE;
		int start_offset_block = mptr->s_offset%UFS_BLOCK_SIZE;
		int end_index_block = (mptr->s_offset+mptr->s_nbytes)/UFS_BLOCK_SIZE;
		int end_offset_block = (mptr->s_offset+mptr->s_nbytes)%UFS_BLOCK_SIZE;
		if (start_index_block == end_index_block)
		{
			void *start = (void *)((long)image + (long)start_offset_block+ inode->direct[start_index_block]*UFS_BLOCK_SIZE);
			memcpy(mptr->r_buffer, start, mptr->s_nbytes);
		}
		else{
			void *start1 = (void *)((long)image + (long)start_offset_block+ inode->direct[start_index_block]*UFS_BLOCK_SIZE);
			memcpy(mptr->r_buffer, start1, UFS_BLOCK_SIZE - start_offset_block);
			void *start2 = (void *)((long)image + inode->direct[end_index_block]*UFS_BLOCK_SIZE);
			memcpy(&mptr->r_buffer[UFS_BLOCK_SIZE - start_offset_block], start2, end_offset_block);
		}
	}
	else
	{
		return -1;
	}
	close(fd);
	return 0;
	
}

int mfs_write(message_t  *mptr, char *filename){
	int fd = open(filename, O_RDWR);
    assert(fd > -1);

    struct stat sbuf;
    int rc = fstat(fd, &sbuf);
    assert(rc > -1);

    int image_size = (int) sbuf.st_size;

    void *image = mmap(NULL, image_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    assert(image != MAP_FAILED);

    super_t *s = (super_t *) image;
    int inodeBitBlock = mptr->s_inum/(UFS_BLOCK_SIZE*8);
	int inodeBitOffset= mptr->s_inum%(UFS_BLOCK_SIZE*8);
    void * inodeBitMap = (void *)((long)image + (s->inode_bitmap_addr+inodeBitBlock) * UFS_BLOCK_SIZE );

    unsigned int bit = get_bit(inodeBitMap, inodeBitOffset);
    if (bit == 0)
	{
		return -1;
	}
	
    int inodeRegionBlock = mptr->s_inum*sizeof(inode_t)/UFS_BLOCK_SIZE;
	int inodeRegionOffset = mptr->s_inum*sizeof(inode_t)%UFS_BLOCK_SIZE;
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset*sizeof(inode_t));
	// check if the end position is out of file
	if (inode->type !=MFS_REGULAR_FILE)
	{
		return -1;
	}
	
	int end = mptr->s_offset + mptr->s_nbytes;
	if (end > inode->size)
	{
		int new_size = end;
		int new_blocks = new_size/UFS_BLOCK_SIZE + 1;
		if (new_blocks > DIRECT_PTRS)
		{
			return -1;
		}
		
		int old_blocks = inode->size/UFS_BLOCK_SIZE + 1;
		int needed_blocks = new_blocks - old_blocks;
		int inode_dir_index = old_blocks;

		int data_blocks = s->data_region_len;
		void * dataBitMap = (void *)((long)image + s->data_bitmap_addr * UFS_BLOCK_SIZE );
		for (int i = 0; i < data_blocks && needed_blocks > 0; i++)
		{
			void* dataMap = (void *)(i/(UFS_BLOCK_SIZE*8)*UFS_BLOCK_SIZE + (long)dataBitMap);
			int currentNum = i%(UFS_BLOCK_SIZE*8);
			bit = get_bit(dataMap, currentNum);
			if (bit == 0)
			{
				inode->direct[inode_dir_index] = s->data_region_addr + i;
				set_bit(dataMap,currentNum);
			}
			else {
				continue;
			}
		}
		
	}

	int start_index_block = mptr->s_offset/UFS_BLOCK_SIZE;
	int start_offset_block = mptr->s_offset%UFS_BLOCK_SIZE;
	int end_index_block = (mptr->s_offset+mptr->s_nbytes)/UFS_BLOCK_SIZE;
	int end_offset_block = (mptr->s_offset+mptr->s_nbytes)%UFS_BLOCK_SIZE;
	if (start_index_block == end_index_block)
	{
		void *start = (void *)((long)image + (long)start_offset_block+ inode->direct[start_index_block]*UFS_BLOCK_SIZE);
		MFS_DirEnt_t *e = (MFS_DirEnt_t*)mptr->r_buffer;
		printf("%d",e->inum);
		memcpy(start, (void *)mptr->r_buffer, mptr->s_nbytes);
	}
	else{
		void *start1 = (void *)((long)image + (long)start_offset_block+ inode->direct[start_index_block]*UFS_BLOCK_SIZE);
		memcpy(start1, (void *)mptr->r_buffer, UFS_BLOCK_SIZE - start_offset_block);
		void *start2 = (void *)((long)image + inode->direct[end_index_block]*UFS_BLOCK_SIZE);
		memcpy(start2, &mptr->r_buffer[UFS_BLOCK_SIZE - start_offset_block], end_offset_block);
	}

	fsync(fd);
	close(fd);
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
				m.rc = mfs_write(&m, filename);
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



 
