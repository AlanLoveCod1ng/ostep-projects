#include "mfs.h"



#define MFS_INIT (1)
#define MFS_LOOKUP (2)
#define MFS_STAT (3)
#define MFS_WRITE (4)
#define MFS_READ (5)
#define MFS_CREAT (6)
#define MFS_UNLINK (7)
#define MFS_SHUTDOWN (8)


typedef struct {
    //before sending to ther server
    int mtype;                  // type of function
    int s_inum;                 // inode number
    int s_name[28];             // name of file/dir
    int s_buffer[4096];         // buffer
    int s_offset;               // offset
    int s_nbytes;               //
    int type;
    int rc;

    //before sending back to the client

    int r_inum;
    int r_buffer[4096];
    int r_bufferSize;

    MFS_Stat_t r_mfs_stat;
    MFS_DirEnt_t r_mfs_dir;


} message_t;