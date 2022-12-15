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
    char s_name[28];             // name of file/dir
    int s_offset;               // offset
    int s_nbytes;               //
    int file_type;
    
    //before sending back to the client
    int rc;
    char r_buffer[4096];
    MFS_Stat_t r_mfs_stat;


} message_t;