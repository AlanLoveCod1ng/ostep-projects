#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "ufs.h"

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

int main(int argc, char *argv[]) {
    int fd = open("test.img", O_RDWR);
    assert(fd > -1);

    struct stat sbuf;
    int rc = fstat(fd, &sbuf);
    assert(rc > -1);

    int image_size = (int) sbuf.st_size;

    void *image = mmap(NULL, image_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    assert(image != MAP_FAILED);

    super_t *s = (super_t *) image;
    void * inodeBit = (void *)((long)image + s->inode_bitmap_addr * UFS_BLOCK_SIZE);
    void * dataBit = (void *)((long)image + s->data_bitmap_addr * UFS_BLOCK_SIZE);

    unsigned int bit = get_bit(inodeBit, 0);
    bit = get_bit(inodeBit, 1);
    
    inode_t *node1 = (inode_t *)((long)image + s->inode_region_addr * UFS_BLOCK_SIZE);
    dir_ent_t *det = (dir_ent_t *)((long)image + node1->direct[0]*UFS_BLOCK_SIZE);
    printf("inode bitmap address %d [len %d]\n", s->inode_bitmap_addr, s->inode_bitmap_len);
    printf(" data bitmap address %d [len %d]\n", s->data_bitmap_addr, s->data_bitmap_len);

    // change on-disk format(!)
    // s->inode_bitmap_len = 1;// don't do this ... just an example

    // force change!
    rc = msync(s, sizeof(super_t), MS_SYNC);
    assert(rc > -1);

    

    close(fd);
    return 0;
}

