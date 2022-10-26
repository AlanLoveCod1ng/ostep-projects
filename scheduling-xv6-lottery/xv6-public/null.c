#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "param.h"
#include "pstat.h"
int main(int argc, char const *argv[])
{
    int *a = 0;
    int b = *a;
    printf(1,"%d",b);
    int c = b;
    b = c;
    exit();
    return 0;
}
