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

void clear_bit(unsigned int *bitmap, int position) {
   int index = position / 32;
   int offset = 31 - (position % 32);
   bitmap[index] &= ~(0x1 << offset);
}

int mfs_lookup(message_t *mptr, void *image){

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
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset);
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
    return -1;
}

int mfs_stat(message_t *mptr, void *image){

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
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset);
	mptr->r_mfs_stat.type = inode->type;
	mptr->r_mfs_stat.size = inode->size;
    return 0;
}

int mfs_read(message_t  *mptr, char *image){

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
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset);
	// check if the end position is out of file
	if (inode->size<(mptr->s_offset+mptr->s_nbytes) && mptr->s_nbytes < 4096)
	{
		return -1;
	}
	int blocks = (mptr->s_offset+mptr->s_nbytes)/UFS_BLOCK_SIZE;
	if((mptr->s_offset+mptr->s_nbytes) % UFS_BLOCK_SIZE != 0){
		blocks += 1;
	}
	if ( blocks > DIRECT_PTRS)
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
			if(end_offset_block == 0){
				end_index_block -= 1;
			}
			if (end_index_block > DIRECT_PTRS)
			{
				return -1;
			}
			if(inode->direct[start_index_block]==UPPER_BOUND || inode->direct[end_index_block] == UPPER_BOUND){
				return -1;
			}
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
		if(end_offset_block == 0){
			end_index_block -= 1;
		}
		if (end_index_block > DIRECT_PTRS)
		{
			return -1;
		}
		if(inode->direct[start_index_block]==UPPER_BOUND || inode->direct[end_index_block] == UPPER_BOUND){
			return -1;
		}
		if (start_index_block == end_index_block)
		{
			void *start = (void *)((long)image + ((long)start_offset_block+ inode->direct[start_index_block])*UFS_BLOCK_SIZE);
			memcpy(mptr->r_buffer, start, mptr->s_nbytes);
		}
		else{
			void *start1 = (void *)((long)image + ((long)start_offset_block+ inode->direct[start_index_block])*UFS_BLOCK_SIZE);
			memcpy(mptr->r_buffer, start1, UFS_BLOCK_SIZE - start_offset_block);
			void *start2 = (void *)((long)image + inode->direct[end_index_block]*UFS_BLOCK_SIZE);
			memcpy(&mptr->r_buffer[UFS_BLOCK_SIZE - start_offset_block], start2, end_offset_block);
		}
	}
	else
	{
		return -1;
	}
	return 0;
	
}

int mfs_write(message_t  *mptr, void *image, int innercall){

    super_t *s = (super_t *) image;
    int inodeBitBlock = mptr->s_inum/(UFS_BLOCK_SIZE*8);
	int inodeBitOffset= mptr->s_inum%(UFS_BLOCK_SIZE*8);
    void * inodeBitMap = (void *)((long)image + (s->inode_bitmap_addr+inodeBitBlock) * UFS_BLOCK_SIZE );
	printf("Here1\n");
	printf("%s\n", mptr->r_buffer);
    unsigned int bit = get_bit(inodeBitMap, inodeBitOffset);
    if (bit == 0)
	{
		return -1;
	}
	printf("Here2\n");
    int inodeRegionBlock = mptr->s_inum*sizeof(inode_t)/UFS_BLOCK_SIZE;
	int inodeRegionOffset = mptr->s_inum*sizeof(inode_t)%UFS_BLOCK_SIZE;
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset);
	// check if the end position is out of file
	if (inode->type != MFS_REGULAR_FILE && innercall == 0)
	{
		return -1;
	}
	printf("Here3\n");

	int end = mptr->s_offset + mptr->s_nbytes;
	if (end > inode->size)
	{
		int new_size = end;
		
		int new_blocks = new_size/UFS_BLOCK_SIZE;
		if(new_size % UFS_BLOCK_SIZE != 0){
			new_blocks += 1;
		}
		if (new_blocks > DIRECT_PTRS)
		{
			return -1;
		}
		
		int old_blocks = inode->size/UFS_BLOCK_SIZE;
		if(inode->size%UFS_BLOCK_SIZE != 0){
			old_blocks ++;
		}
		if(inode->size == 0){
			old_blocks = 1;
		}
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
				needed_blocks --;
			}
			else {
				continue;
			}
		}
		if(needed_blocks != 0){
			return -1;
		}
		inode->size = new_size;
	}

	int start_index_block = mptr->s_offset/UFS_BLOCK_SIZE;
	int start_offset_block = mptr->s_offset%UFS_BLOCK_SIZE;
	int end_index_block = end/UFS_BLOCK_SIZE;
	int end_offset_block = end%UFS_BLOCK_SIZE;
	if(end_offset_block == 0){
		end_index_block -= 1;
	}
	if (start_index_block == end_index_block)
	{
		void *start = (void *)((long)image + (long)start_offset_block+ inode->direct[start_index_block]*UFS_BLOCK_SIZE);
		MFS_DirEnt_t *e = (MFS_DirEnt_t*)mptr->r_buffer;
		printf("%d",e->inum);
		memcpy(start, (void *)mptr->r_buffer, mptr->s_nbytes);
		message_t temp;
		memcpy((void *)temp.r_buffer, start, 4096);
	}
	else{
		void *start1 = (void *)((long)image + (long)start_offset_block+ inode->direct[start_index_block]*UFS_BLOCK_SIZE);
		memcpy(start1, (void *)mptr->r_buffer, UFS_BLOCK_SIZE - start_offset_block);
		void *start2 = (void *)((long)image + inode->direct[end_index_block]*UFS_BLOCK_SIZE);
		memcpy(start2, &mptr->r_buffer[UFS_BLOCK_SIZE - start_offset_block], end_offset_block);
	}
	return 0;
	
}

int mfs_create(message_t  *mptr, char *image){

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
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset);
	if (inode->type != UFS_DIRECTORY)
	{
		return -1;
	}
	
	message_t lookupMessage;
	lookupMessage.mtype = MFS_LOOKUP;
    lookupMessage.s_inum = mptr->s_inum;
    strcpy(lookupMessage.s_name, mptr->s_name);
	if(mfs_lookup(&lookupMessage, image)!=-1){
		return 0;
	}

	int inode_regions = s->inode_region_len*(UFS_BLOCK_SIZE/sizeof(inode_t));
	inodeBitMap = (void *)((long)image + s->inode_bitmap_addr * UFS_BLOCK_SIZE );
	int assignedInode = -1;
	for (int i = 0; i < inode_regions; i++)
	{
		void * inodeMap = (void *)((i/(UFS_BLOCK_SIZE*8))*UFS_BLOCK_SIZE + (long)inodeBitMap);
		int currentInode = i%(UFS_BLOCK_SIZE*8);
		bit = get_bit(inodeMap, currentInode);
		if (bit == 0)
		{
			assignedInode = i;
			set_bit(inodeMap, currentInode);
			break;
		}
		else
		{
			continue;
		}
	}
	// no available inode
	if (assignedInode == -1)
	{
		return -1;
	}
	inode_t *childInode = (inode_t *)((long)image + s->inode_region_addr*UFS_BLOCK_SIZE + assignedInode*sizeof(inode_t));

	int data_blocks = s->data_region_len;
	void * dataBitMap = (void *)((long)image + s->data_bitmap_addr * UFS_BLOCK_SIZE );
	int assignedDataBlock = -1;
	for (int i = 0; i < data_blocks; i++)
	{
		void* dataMap = (void *)((i/(UFS_BLOCK_SIZE*8))*UFS_BLOCK_SIZE + (long)dataBitMap);
		int currentNum = i%(UFS_BLOCK_SIZE*8);
		bit = get_bit(dataMap, currentNum);
		if (bit == 0)
		{
			assignedDataBlock = i;
			set_bit(dataMap,currentNum);
			break;
		}
		else {
			continue;
		}
	}
	// no available data block
	if(assignedDataBlock == -1){
		return -1;
	}

	childInode->type = mptr->file_type;
	childInode->size = 0;
	childInode->direct[0] = s->data_region_addr+assignedDataBlock;
	for (int i = 1; i < DIRECT_PTRS; i++)
	{
		childInode->direct[i] = UPPER_BOUND;
	}
	// check if the end position is out of file
	if (childInode->type ==MFS_REGULAR_FILE)
	{

	}
	else if(childInode->type ==MFS_DIRECTORY){
		message_t temp_m;
		dir_ent_t e;
		e.inum = assignedInode;
		strcpy(e.name, ".");
		memcpy(temp_m.r_buffer, (void *)&e, sizeof(dir_ent_t));
		e.inum = temp_m.s_inum;
		strcpy(e.name, "..");
		memcpy(&temp_m.r_buffer[sizeof(dir_ent_t)], (void *)&e, sizeof(dir_ent_t));
		e.inum = -1;
		strcpy(e.name, "");
		for (int i = 2; i < UFS_BLOCK_SIZE/sizeof(dir_ent_t); i++)
		{
			memcpy(&temp_m.r_buffer[sizeof(dir_ent_t)*i], (void *)&e, sizeof(dir_ent_t));
		}
		temp_m.mtype = MFS_WRITE;
		temp_m.s_inum = assignedInode;
		temp_m.s_offset = 0;
		temp_m.s_nbytes = UFS_BLOCK_SIZE;
		mfs_write(&temp_m, image, 1);
		childInode->size = 2*sizeof(dir_ent_t);
	}
	else
	{
		return -1;
	}
	int parent_last_block = -1;
	int num_block = 0;
	for (int i = 0; i < DIRECT_PTRS; i++)
	{
		if (inode->direct[i] == UPPER_BOUND)
		{
			continue;
		}
		else{
			parent_last_block = inode->direct[i];
			num_block += 1;
		}
	}
	if (parent_last_block == -1)
	{
		return -1;
	}
	void *block_start = (void*)((long)image + parent_last_block*UFS_BLOCK_SIZE);
	int offset = (num_block-1)*UFS_BLOCK_SIZE;
	for (int i = 0; i < UFS_BLOCK_SIZE/sizeof(dir_ent_t); i++)
	{
		dir_ent_t *currentEntry = (dir_ent_t *)((long)block_start + i*sizeof(dir_ent_t));
		if (currentEntry->inum!=-1)
		{
			offset += sizeof(dir_ent_t);
		}
		else
		{
			break;
		}
	}
	dir_ent_t e;
	e.inum = assignedInode;
	strcpy(e.name, mptr->s_name);
	message_t temp_m;
	memcpy(temp_m.r_buffer, &e, sizeof(dir_ent_t));
	temp_m.mtype = MFS_WRITE;
	temp_m.s_inum = mptr->s_inum;
	temp_m.s_offset = offset;
	temp_m.s_nbytes = sizeof(dir_ent_t);
	mfs_write(&temp_m, image, 1);

	return 0;
	
}


int mfs_unlink(message_t  *mptr, char *image){

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
    inode_t *inode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset);
	if (inode->type != UFS_DIRECTORY)
	{
		return -1;
	}
	
	message_t lookupMessage;
	lookupMessage.mtype = MFS_LOOKUP;
    lookupMessage.s_inum = mptr->s_inum;
    strcpy(lookupMessage.s_name, mptr->s_name);
	int childInodeNumber;
	if((childInodeNumber = mfs_lookup(&lookupMessage, image))==-1){
		return 0;
	}
	inodeRegionBlock = childInodeNumber*sizeof(inode_t)/UFS_BLOCK_SIZE;
	inodeRegionOffset = childInodeNumber*sizeof(inode_t)%UFS_BLOCK_SIZE;
	inode_t *childInode = (inode_t *)((long)image + (s->inode_region_addr+inodeRegionBlock) * UFS_BLOCK_SIZE + inodeRegionOffset);
	
	// check if it's a emptry directory
	if(childInode->type == MFS_DIRECTORY){
		void *block_start = (void *)((long)image + childInode->direct[0]*UFS_BLOCK_SIZE);
		int num_det = UFS_BLOCK_SIZE/sizeof(dir_ent_t);
		for (int j = 0; j < num_det; j++)
		{
			dir_ent_t *det = (dir_ent_t *)((long)block_start + j*sizeof(dir_ent_t));
			if (j == 2 && det->inum != -1)
			{
				return -1;
			}
			else if(j == 2 && det->inum == -1){
				break;
			}
			else
			{
				continue;
			}
			
		}
	}

	unsigned int *dir = childInode->direct;
	
	// clear data bitmap bit
	for (int i = 0; i < DIRECT_PTRS; i++)
	{
		if (dir[i] == UPPER_BOUND)
		{
			continue;
		}
		void * dataMap = (void *)((long)(dir[i]-s->data_region_addr)/(UFS_BLOCK_SIZE*8)*UFS_BLOCK_SIZE+ (long)s->data_bitmap_addr*UFS_BLOCK_SIZE + (long) image);
		int currentDataBit = (dir[i]-s->data_region_addr)%(UFS_BLOCK_SIZE*8);
		clear_bit(dataMap, currentDataBit);
	}
	
	// clear inode bitmap bit
	inodeBitBlock = childInodeNumber/(UFS_BLOCK_SIZE*8);
	inodeBitOffset= childInodeNumber%(UFS_BLOCK_SIZE*8);
    inodeBitMap = (void *)((long)image + (s->inode_bitmap_addr+inodeBitBlock) * UFS_BLOCK_SIZE );
    clear_bit(inodeBitMap, inodeBitOffset);

	// delete entry from parent diretory's data region 
	for (int i = 0; i < DIRECT_PTRS; i++)
	{
		if (inode->direct[i] == UPPER_BOUND)
		{
			continue;
		}
		void *block_start = (void *)((long)image + inode->direct[i]*UFS_BLOCK_SIZE);
		int num_det = UFS_BLOCK_SIZE/sizeof(dir_ent_t);
		int found = 0;
		for (int j = 0; j < num_det; j++)
		{
			dir_ent_t *det = (dir_ent_t *)((long)block_start + j*sizeof(dir_ent_t));
			if (det->inum == -1)
			{
				continue;
			}
			
			if (strcmp(det->name, mptr->s_name) == 0)
			{
				dir_ent_t empty;
				empty.inum = -1;
				strcpy(empty.name, "");
				memcpy((void *)det,&empty, sizeof(dir_ent_t));
				found = 1;
				break;
			}
		}
		if (found)
		{
			break;
		}
		
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

	int fd;
    void *image;
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
				fd = open(filename, O_RDWR);
				assert(fd > -1);

				struct stat sbuf;
				int rc = fstat(fd, &sbuf);
				assert(rc > -1);

				int image_size = (int) sbuf.st_size;
				image = mmap(NULL, image_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
				m.rc = 0;
				break;
			case MFS_LOOKUP:
				m.rc = mfs_lookup(&m, image);
				break;
			case MFS_STAT:
				m.rc = mfs_stat(&m, image);
				break;
			case MFS_WRITE:
				printf("Here4\n");
				m.rc = mfs_write(&m, image, 0);
				break;
			case MFS_READ:
				m.rc = mfs_read(&m, image);
				break;
			case MFS_CREAT:
				m.rc = mfs_create(&m, image);
				break;
			case MFS_UNLINK:
				m.rc = mfs_unlink(&m, image);
				break;
			case MFS_SHUTDOWN:
				fsync(fd);
				close(fd);
				rc = UDP_Write(sd, &addr, (char *) &m, sizeof(message_t));
				rc = UDP_Close(sd);
				exit(0);
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



 
