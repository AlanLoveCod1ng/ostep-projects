
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 48 02 00 00       	call   25e <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 47 02 00 00       	call   266 <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 cd 02 00 00       	call   2f6 <sleep>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	eb ec                	jmp    1a <main+0x1a>

0000002e <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
  2e:	55                   	push   %ebp
  2f:	89 e5                	mov    %esp,%ebp
  31:	56                   	push   %esi
  32:	53                   	push   %ebx
  33:	8b 75 08             	mov    0x8(%ebp),%esi
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  39:	89 f0                	mov    %esi,%eax
  3b:	89 d1                	mov    %edx,%ecx
  3d:	83 c2 01             	add    $0x1,%edx
  40:	89 c3                	mov    %eax,%ebx
  42:	83 c0 01             	add    $0x1,%eax
  45:	0f b6 09             	movzbl (%ecx),%ecx
  48:	88 0b                	mov    %cl,(%ebx)
  4a:	84 c9                	test   %cl,%cl
  4c:	75 ed                	jne    3b <strcpy+0xd>
    ;
  return os;
}
  4e:	89 f0                	mov    %esi,%eax
  50:	5b                   	pop    %ebx
  51:	5e                   	pop    %esi
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    

00000054 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	8b 4d 08             	mov    0x8(%ebp),%ecx
  5a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  5d:	eb 06                	jmp    65 <strcmp+0x11>
    p++, q++;
  5f:	83 c1 01             	add    $0x1,%ecx
  62:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  65:	0f b6 01             	movzbl (%ecx),%eax
  68:	84 c0                	test   %al,%al
  6a:	74 04                	je     70 <strcmp+0x1c>
  6c:	3a 02                	cmp    (%edx),%al
  6e:	74 ef                	je     5f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  70:	0f b6 c0             	movzbl %al,%eax
  73:	0f b6 12             	movzbl (%edx),%edx
  76:	29 d0                	sub    %edx,%eax
}
  78:	5d                   	pop    %ebp
  79:	c3                   	ret    

0000007a <strlen>:

uint
strlen(const char *s)
{
  7a:	55                   	push   %ebp
  7b:	89 e5                	mov    %esp,%ebp
  7d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  80:	b8 00 00 00 00       	mov    $0x0,%eax
  85:	eb 03                	jmp    8a <strlen+0x10>
  87:	83 c0 01             	add    $0x1,%eax
  8a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8e:	75 f7                	jne    87 <strlen+0xd>
    ;
  return n;
}
  90:	5d                   	pop    %ebp
  91:	c3                   	ret    

00000092 <memset>:

void*
memset(void *dst, int c, uint n)
{
  92:	55                   	push   %ebp
  93:	89 e5                	mov    %esp,%ebp
  95:	57                   	push   %edi
  96:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  99:	89 d7                	mov    %edx,%edi
  9b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  a1:	fc                   	cld    
  a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  a4:	89 d0                	mov    %edx,%eax
  a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
  a9:	c9                   	leave  
  aa:	c3                   	ret    

000000ab <strchr>:

char*
strchr(const char *s, char c)
{
  ab:	55                   	push   %ebp
  ac:	89 e5                	mov    %esp,%ebp
  ae:	8b 45 08             	mov    0x8(%ebp),%eax
  b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  b5:	eb 03                	jmp    ba <strchr+0xf>
  b7:	83 c0 01             	add    $0x1,%eax
  ba:	0f b6 10             	movzbl (%eax),%edx
  bd:	84 d2                	test   %dl,%dl
  bf:	74 06                	je     c7 <strchr+0x1c>
    if(*s == c)
  c1:	38 ca                	cmp    %cl,%dl
  c3:	75 f2                	jne    b7 <strchr+0xc>
  c5:	eb 05                	jmp    cc <strchr+0x21>
      return (char*)s;
  return 0;
  c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  cc:	5d                   	pop    %ebp
  cd:	c3                   	ret    

000000ce <gets>:

char*
gets(char *buf, int max)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	57                   	push   %edi
  d2:	56                   	push   %esi
  d3:	53                   	push   %ebx
  d4:	83 ec 1c             	sub    $0x1c,%esp
  d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  da:	bb 00 00 00 00       	mov    $0x0,%ebx
  df:	89 de                	mov    %ebx,%esi
  e1:	83 c3 01             	add    $0x1,%ebx
  e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  e7:	7d 2e                	jge    117 <gets+0x49>
    cc = read(0, &c, 1);
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	6a 01                	push   $0x1
  ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
  f1:	50                   	push   %eax
  f2:	6a 00                	push   $0x0
  f4:	e8 85 01 00 00       	call   27e <read>
    if(cc < 1)
  f9:	83 c4 10             	add    $0x10,%esp
  fc:	85 c0                	test   %eax,%eax
  fe:	7e 17                	jle    117 <gets+0x49>
      break;
    buf[i++] = c;
 100:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 104:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c2             	sete   %dl
 10c:	3c 0d                	cmp    $0xd,%al
 10e:	0f 94 c0             	sete   %al
 111:	08 c2                	or     %al,%dl
 113:	74 ca                	je     df <gets+0x11>
    buf[i++] = c;
 115:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 117:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 11b:	89 f8                	mov    %edi,%eax
 11d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 120:	5b                   	pop    %ebx
 121:	5e                   	pop    %esi
 122:	5f                   	pop    %edi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <stat>:

int
stat(const char *n, struct stat *st)
{
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	56                   	push   %esi
 129:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 12a:	83 ec 08             	sub    $0x8,%esp
 12d:	6a 00                	push   $0x0
 12f:	ff 75 08             	push   0x8(%ebp)
 132:	e8 6f 01 00 00       	call   2a6 <open>
  if(fd < 0)
 137:	83 c4 10             	add    $0x10,%esp
 13a:	85 c0                	test   %eax,%eax
 13c:	78 24                	js     162 <stat+0x3d>
 13e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 140:	83 ec 08             	sub    $0x8,%esp
 143:	ff 75 0c             	push   0xc(%ebp)
 146:	50                   	push   %eax
 147:	e8 72 01 00 00       	call   2be <fstat>
 14c:	89 c6                	mov    %eax,%esi
  close(fd);
 14e:	89 1c 24             	mov    %ebx,(%esp)
 151:	e8 38 01 00 00       	call   28e <close>
  return r;
 156:	83 c4 10             	add    $0x10,%esp
}
 159:	89 f0                	mov    %esi,%eax
 15b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 15e:	5b                   	pop    %ebx
 15f:	5e                   	pop    %esi
 160:	5d                   	pop    %ebp
 161:	c3                   	ret    
    return -1;
 162:	be ff ff ff ff       	mov    $0xffffffff,%esi
 167:	eb f0                	jmp    159 <stat+0x34>

00000169 <atoi>:

int
atoi(const char *s)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	53                   	push   %ebx
 16d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 170:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 175:	eb 10                	jmp    187 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 177:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 17a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 17d:	83 c1 01             	add    $0x1,%ecx
 180:	0f be c0             	movsbl %al,%eax
 183:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 187:	0f b6 01             	movzbl (%ecx),%eax
 18a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 18d:	80 fb 09             	cmp    $0x9,%bl
 190:	76 e5                	jbe    177 <atoi+0xe>
  return n;
}
 192:	89 d0                	mov    %edx,%eax
 194:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	8b 75 08             	mov    0x8(%ebp),%esi
 1a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1a9:	eb 0d                	jmp    1b8 <memmove+0x1f>
    *dst++ = *src++;
 1ab:	0f b6 01             	movzbl (%ecx),%eax
 1ae:	88 02                	mov    %al,(%edx)
 1b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 1b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1b6:	89 d8                	mov    %ebx,%eax
 1b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1bb:	85 c0                	test   %eax,%eax
 1bd:	7f ec                	jg     1ab <memmove+0x12>
  return vdst;
}
 1bf:	89 f0                	mov    %esi,%eax
 1c1:	5b                   	pop    %ebx
 1c2:	5e                   	pop    %esi
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    

000001c5 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 1c5:	55                   	push   %ebp
 1c6:	89 e5                	mov    %esp,%ebp
 1c8:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 1cb:	68 00 20 00 00       	push   $0x2000
 1d0:	e8 0c 04 00 00       	call   5e1 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 1d5:	83 c4 10             	add    $0x10,%esp
 1d8:	a9 ff 0f 00 00       	test   $0xfff,%eax
 1dd:	74 0a                	je     1e9 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 1df:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 1e4:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 1e9:	50                   	push   %eax
 1ea:	ff 75 10             	push   0x10(%ebp)
 1ed:	ff 75 0c             	push   0xc(%ebp)
 1f0:	ff 75 08             	push   0x8(%ebp)
 1f3:	e8 0e 01 00 00       	call   306 <clone>
  return pid;
}
 1f8:	c9                   	leave  
 1f9:	c3                   	ret    

000001fa <thread_join>:
int
thread_join()
{
 1fa:	55                   	push   %ebp
 1fb:	89 e5                	mov    %esp,%ebp
 1fd:	53                   	push   %ebx
 1fe:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 201:	8d 45 f4             	lea    -0xc(%ebp),%eax
 204:	50                   	push   %eax
 205:	e8 04 01 00 00       	call   30e <join>
 20a:	89 c3                	mov    %eax,%ebx
  free(stack);
 20c:	83 c4 04             	add    $0x4,%esp
 20f:	ff 75 f4             	push   -0xc(%ebp)
 212:	e8 0a 03 00 00       	call   521 <free>
  return pid;
}
 217:	89 d8                	mov    %ebx,%eax
 219:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 21c:	c9                   	leave  
 21d:	c3                   	ret    

0000021e <lock_init>:
int
lock_init(lock_t * lock){
 21e:	55                   	push   %ebp
 21f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 22a:	b8 00 00 00 00       	mov    $0x0,%eax
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    

00000231 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 231:	55                   	push   %ebp
 232:	89 e5                	mov    %esp,%ebp
 234:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 237:	b8 01 00 00 00       	mov    $0x1,%eax
 23c:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 23f:	83 f8 01             	cmp    $0x1,%eax
 242:	74 f3                	je     237 <lock_acquire+0x6>
  {

  }
  return 0;
}
 244:	b8 00 00 00 00       	mov    $0x0,%eax
 249:	5d                   	pop    %ebp
 24a:	c3                   	ret    

0000024b <lock_release>:
int
lock_release(lock_t * lock){
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 257:	b8 00 00 00 00       	mov    $0x0,%eax
 25c:	5d                   	pop    %ebp
 25d:	c3                   	ret    

0000025e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 25e:	b8 01 00 00 00       	mov    $0x1,%eax
 263:	cd 40                	int    $0x40
 265:	c3                   	ret    

00000266 <exit>:
SYSCALL(exit)
 266:	b8 02 00 00 00       	mov    $0x2,%eax
 26b:	cd 40                	int    $0x40
 26d:	c3                   	ret    

0000026e <wait>:
SYSCALL(wait)
 26e:	b8 03 00 00 00       	mov    $0x3,%eax
 273:	cd 40                	int    $0x40
 275:	c3                   	ret    

00000276 <pipe>:
SYSCALL(pipe)
 276:	b8 04 00 00 00       	mov    $0x4,%eax
 27b:	cd 40                	int    $0x40
 27d:	c3                   	ret    

0000027e <read>:
SYSCALL(read)
 27e:	b8 05 00 00 00       	mov    $0x5,%eax
 283:	cd 40                	int    $0x40
 285:	c3                   	ret    

00000286 <write>:
SYSCALL(write)
 286:	b8 10 00 00 00       	mov    $0x10,%eax
 28b:	cd 40                	int    $0x40
 28d:	c3                   	ret    

0000028e <close>:
SYSCALL(close)
 28e:	b8 15 00 00 00       	mov    $0x15,%eax
 293:	cd 40                	int    $0x40
 295:	c3                   	ret    

00000296 <kill>:
SYSCALL(kill)
 296:	b8 06 00 00 00       	mov    $0x6,%eax
 29b:	cd 40                	int    $0x40
 29d:	c3                   	ret    

0000029e <exec>:
SYSCALL(exec)
 29e:	b8 07 00 00 00       	mov    $0x7,%eax
 2a3:	cd 40                	int    $0x40
 2a5:	c3                   	ret    

000002a6 <open>:
SYSCALL(open)
 2a6:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ab:	cd 40                	int    $0x40
 2ad:	c3                   	ret    

000002ae <mknod>:
SYSCALL(mknod)
 2ae:	b8 11 00 00 00       	mov    $0x11,%eax
 2b3:	cd 40                	int    $0x40
 2b5:	c3                   	ret    

000002b6 <unlink>:
SYSCALL(unlink)
 2b6:	b8 12 00 00 00       	mov    $0x12,%eax
 2bb:	cd 40                	int    $0x40
 2bd:	c3                   	ret    

000002be <fstat>:
SYSCALL(fstat)
 2be:	b8 08 00 00 00       	mov    $0x8,%eax
 2c3:	cd 40                	int    $0x40
 2c5:	c3                   	ret    

000002c6 <link>:
SYSCALL(link)
 2c6:	b8 13 00 00 00       	mov    $0x13,%eax
 2cb:	cd 40                	int    $0x40
 2cd:	c3                   	ret    

000002ce <mkdir>:
SYSCALL(mkdir)
 2ce:	b8 14 00 00 00       	mov    $0x14,%eax
 2d3:	cd 40                	int    $0x40
 2d5:	c3                   	ret    

000002d6 <chdir>:
SYSCALL(chdir)
 2d6:	b8 09 00 00 00       	mov    $0x9,%eax
 2db:	cd 40                	int    $0x40
 2dd:	c3                   	ret    

000002de <dup>:
SYSCALL(dup)
 2de:	b8 0a 00 00 00       	mov    $0xa,%eax
 2e3:	cd 40                	int    $0x40
 2e5:	c3                   	ret    

000002e6 <getpid>:
SYSCALL(getpid)
 2e6:	b8 0b 00 00 00       	mov    $0xb,%eax
 2eb:	cd 40                	int    $0x40
 2ed:	c3                   	ret    

000002ee <sbrk>:
SYSCALL(sbrk)
 2ee:	b8 0c 00 00 00       	mov    $0xc,%eax
 2f3:	cd 40                	int    $0x40
 2f5:	c3                   	ret    

000002f6 <sleep>:
SYSCALL(sleep)
 2f6:	b8 0d 00 00 00       	mov    $0xd,%eax
 2fb:	cd 40                	int    $0x40
 2fd:	c3                   	ret    

000002fe <uptime>:
SYSCALL(uptime)
 2fe:	b8 0e 00 00 00       	mov    $0xe,%eax
 303:	cd 40                	int    $0x40
 305:	c3                   	ret    

00000306 <clone>:
SYSCALL(clone)
 306:	b8 16 00 00 00       	mov    $0x16,%eax
 30b:	cd 40                	int    $0x40
 30d:	c3                   	ret    

0000030e <join>:
SYSCALL(join)
 30e:	b8 17 00 00 00       	mov    $0x17,%eax
 313:	cd 40                	int    $0x40
 315:	c3                   	ret    

00000316 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 316:	55                   	push   %ebp
 317:	89 e5                	mov    %esp,%ebp
 319:	83 ec 1c             	sub    $0x1c,%esp
 31c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 31f:	6a 01                	push   $0x1
 321:	8d 55 f4             	lea    -0xc(%ebp),%edx
 324:	52                   	push   %edx
 325:	50                   	push   %eax
 326:	e8 5b ff ff ff       	call   286 <write>
}
 32b:	83 c4 10             	add    $0x10,%esp
 32e:	c9                   	leave  
 32f:	c3                   	ret    

00000330 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
 336:	83 ec 2c             	sub    $0x2c,%esp
 339:	89 45 d0             	mov    %eax,-0x30(%ebp)
 33c:	89 d0                	mov    %edx,%eax
 33e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 340:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 344:	0f 95 c1             	setne  %cl
 347:	c1 ea 1f             	shr    $0x1f,%edx
 34a:	84 d1                	test   %dl,%cl
 34c:	74 44                	je     392 <printint+0x62>
    neg = 1;
    x = -xx;
 34e:	f7 d8                	neg    %eax
 350:	89 c1                	mov    %eax,%ecx
    neg = 1;
 352:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 359:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 35e:	89 c8                	mov    %ecx,%eax
 360:	ba 00 00 00 00       	mov    $0x0,%edx
 365:	f7 f6                	div    %esi
 367:	89 df                	mov    %ebx,%edi
 369:	83 c3 01             	add    $0x1,%ebx
 36c:	0f b6 92 c8 06 00 00 	movzbl 0x6c8(%edx),%edx
 373:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 377:	89 ca                	mov    %ecx,%edx
 379:	89 c1                	mov    %eax,%ecx
 37b:	39 d6                	cmp    %edx,%esi
 37d:	76 df                	jbe    35e <printint+0x2e>
  if(neg)
 37f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 383:	74 31                	je     3b6 <printint+0x86>
    buf[i++] = '-';
 385:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 38a:	8d 5f 02             	lea    0x2(%edi),%ebx
 38d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 390:	eb 17                	jmp    3a9 <printint+0x79>
    x = xx;
 392:	89 c1                	mov    %eax,%ecx
  neg = 0;
 394:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 39b:	eb bc                	jmp    359 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 39d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3a2:	89 f0                	mov    %esi,%eax
 3a4:	e8 6d ff ff ff       	call   316 <putc>
  while(--i >= 0)
 3a9:	83 eb 01             	sub    $0x1,%ebx
 3ac:	79 ef                	jns    39d <printint+0x6d>
}
 3ae:	83 c4 2c             	add    $0x2c,%esp
 3b1:	5b                   	pop    %ebx
 3b2:	5e                   	pop    %esi
 3b3:	5f                   	pop    %edi
 3b4:	5d                   	pop    %ebp
 3b5:	c3                   	ret    
 3b6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3b9:	eb ee                	jmp    3a9 <printint+0x79>

000003bb <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3bb:	55                   	push   %ebp
 3bc:	89 e5                	mov    %esp,%ebp
 3be:	57                   	push   %edi
 3bf:	56                   	push   %esi
 3c0:	53                   	push   %ebx
 3c1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3c4:	8d 45 10             	lea    0x10(%ebp),%eax
 3c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3ca:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3cf:	bb 00 00 00 00       	mov    $0x0,%ebx
 3d4:	eb 14                	jmp    3ea <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3d6:	89 fa                	mov    %edi,%edx
 3d8:	8b 45 08             	mov    0x8(%ebp),%eax
 3db:	e8 36 ff ff ff       	call   316 <putc>
 3e0:	eb 05                	jmp    3e7 <printf+0x2c>
      }
    } else if(state == '%'){
 3e2:	83 fe 25             	cmp    $0x25,%esi
 3e5:	74 25                	je     40c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3e7:	83 c3 01             	add    $0x1,%ebx
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3f1:	84 c0                	test   %al,%al
 3f3:	0f 84 20 01 00 00    	je     519 <printf+0x15e>
    c = fmt[i] & 0xff;
 3f9:	0f be f8             	movsbl %al,%edi
 3fc:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3ff:	85 f6                	test   %esi,%esi
 401:	75 df                	jne    3e2 <printf+0x27>
      if(c == '%'){
 403:	83 f8 25             	cmp    $0x25,%eax
 406:	75 ce                	jne    3d6 <printf+0x1b>
        state = '%';
 408:	89 c6                	mov    %eax,%esi
 40a:	eb db                	jmp    3e7 <printf+0x2c>
      if(c == 'd'){
 40c:	83 f8 25             	cmp    $0x25,%eax
 40f:	0f 84 cf 00 00 00    	je     4e4 <printf+0x129>
 415:	0f 8c dd 00 00 00    	jl     4f8 <printf+0x13d>
 41b:	83 f8 78             	cmp    $0x78,%eax
 41e:	0f 8f d4 00 00 00    	jg     4f8 <printf+0x13d>
 424:	83 f8 63             	cmp    $0x63,%eax
 427:	0f 8c cb 00 00 00    	jl     4f8 <printf+0x13d>
 42d:	83 e8 63             	sub    $0x63,%eax
 430:	83 f8 15             	cmp    $0x15,%eax
 433:	0f 87 bf 00 00 00    	ja     4f8 <printf+0x13d>
 439:	ff 24 85 70 06 00 00 	jmp    *0x670(,%eax,4)
        printint(fd, *ap, 10, 1);
 440:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 443:	8b 17                	mov    (%edi),%edx
 445:	83 ec 0c             	sub    $0xc,%esp
 448:	6a 01                	push   $0x1
 44a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 44f:	8b 45 08             	mov    0x8(%ebp),%eax
 452:	e8 d9 fe ff ff       	call   330 <printint>
        ap++;
 457:	83 c7 04             	add    $0x4,%edi
 45a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 45d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 460:	be 00 00 00 00       	mov    $0x0,%esi
 465:	eb 80                	jmp    3e7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 467:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 46a:	8b 17                	mov    (%edi),%edx
 46c:	83 ec 0c             	sub    $0xc,%esp
 46f:	6a 00                	push   $0x0
 471:	b9 10 00 00 00       	mov    $0x10,%ecx
 476:	8b 45 08             	mov    0x8(%ebp),%eax
 479:	e8 b2 fe ff ff       	call   330 <printint>
        ap++;
 47e:	83 c7 04             	add    $0x4,%edi
 481:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 484:	83 c4 10             	add    $0x10,%esp
      state = 0;
 487:	be 00 00 00 00       	mov    $0x0,%esi
 48c:	e9 56 ff ff ff       	jmp    3e7 <printf+0x2c>
        s = (char*)*ap;
 491:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 494:	8b 30                	mov    (%eax),%esi
        ap++;
 496:	83 c0 04             	add    $0x4,%eax
 499:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 49c:	85 f6                	test   %esi,%esi
 49e:	75 15                	jne    4b5 <printf+0xfa>
          s = "(null)";
 4a0:	be 68 06 00 00       	mov    $0x668,%esi
 4a5:	eb 0e                	jmp    4b5 <printf+0xfa>
          putc(fd, *s);
 4a7:	0f be d2             	movsbl %dl,%edx
 4aa:	8b 45 08             	mov    0x8(%ebp),%eax
 4ad:	e8 64 fe ff ff       	call   316 <putc>
          s++;
 4b2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4b5:	0f b6 16             	movzbl (%esi),%edx
 4b8:	84 d2                	test   %dl,%dl
 4ba:	75 eb                	jne    4a7 <printf+0xec>
      state = 0;
 4bc:	be 00 00 00 00       	mov    $0x0,%esi
 4c1:	e9 21 ff ff ff       	jmp    3e7 <printf+0x2c>
        putc(fd, *ap);
 4c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4c9:	0f be 17             	movsbl (%edi),%edx
 4cc:	8b 45 08             	mov    0x8(%ebp),%eax
 4cf:	e8 42 fe ff ff       	call   316 <putc>
        ap++;
 4d4:	83 c7 04             	add    $0x4,%edi
 4d7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4da:	be 00 00 00 00       	mov    $0x0,%esi
 4df:	e9 03 ff ff ff       	jmp    3e7 <printf+0x2c>
        putc(fd, c);
 4e4:	89 fa                	mov    %edi,%edx
 4e6:	8b 45 08             	mov    0x8(%ebp),%eax
 4e9:	e8 28 fe ff ff       	call   316 <putc>
      state = 0;
 4ee:	be 00 00 00 00       	mov    $0x0,%esi
 4f3:	e9 ef fe ff ff       	jmp    3e7 <printf+0x2c>
        putc(fd, '%');
 4f8:	ba 25 00 00 00       	mov    $0x25,%edx
 4fd:	8b 45 08             	mov    0x8(%ebp),%eax
 500:	e8 11 fe ff ff       	call   316 <putc>
        putc(fd, c);
 505:	89 fa                	mov    %edi,%edx
 507:	8b 45 08             	mov    0x8(%ebp),%eax
 50a:	e8 07 fe ff ff       	call   316 <putc>
      state = 0;
 50f:	be 00 00 00 00       	mov    $0x0,%esi
 514:	e9 ce fe ff ff       	jmp    3e7 <printf+0x2c>
    }
  }
}
 519:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5f                   	pop    %edi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret    

00000521 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 521:	55                   	push   %ebp
 522:	89 e5                	mov    %esp,%ebp
 524:	57                   	push   %edi
 525:	56                   	push   %esi
 526:	53                   	push   %ebx
 527:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 52a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 52d:	a1 0c 0a 00 00       	mov    0xa0c,%eax
 532:	eb 02                	jmp    536 <free+0x15>
 534:	89 d0                	mov    %edx,%eax
 536:	39 c8                	cmp    %ecx,%eax
 538:	73 04                	jae    53e <free+0x1d>
 53a:	39 08                	cmp    %ecx,(%eax)
 53c:	77 12                	ja     550 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 53e:	8b 10                	mov    (%eax),%edx
 540:	39 c2                	cmp    %eax,%edx
 542:	77 f0                	ja     534 <free+0x13>
 544:	39 c8                	cmp    %ecx,%eax
 546:	72 08                	jb     550 <free+0x2f>
 548:	39 ca                	cmp    %ecx,%edx
 54a:	77 04                	ja     550 <free+0x2f>
 54c:	89 d0                	mov    %edx,%eax
 54e:	eb e6                	jmp    536 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 550:	8b 73 fc             	mov    -0x4(%ebx),%esi
 553:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 556:	8b 10                	mov    (%eax),%edx
 558:	39 d7                	cmp    %edx,%edi
 55a:	74 19                	je     575 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 55c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 55f:	8b 50 04             	mov    0x4(%eax),%edx
 562:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 565:	39 ce                	cmp    %ecx,%esi
 567:	74 1b                	je     584 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 569:	89 08                	mov    %ecx,(%eax)
  freep = p;
 56b:	a3 0c 0a 00 00       	mov    %eax,0xa0c
}
 570:	5b                   	pop    %ebx
 571:	5e                   	pop    %esi
 572:	5f                   	pop    %edi
 573:	5d                   	pop    %ebp
 574:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 575:	03 72 04             	add    0x4(%edx),%esi
 578:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 57b:	8b 10                	mov    (%eax),%edx
 57d:	8b 12                	mov    (%edx),%edx
 57f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 582:	eb db                	jmp    55f <free+0x3e>
    p->s.size += bp->s.size;
 584:	03 53 fc             	add    -0x4(%ebx),%edx
 587:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 58a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 58d:	89 10                	mov    %edx,(%eax)
 58f:	eb da                	jmp    56b <free+0x4a>

00000591 <morecore>:

static Header*
morecore(uint nu)
{
 591:	55                   	push   %ebp
 592:	89 e5                	mov    %esp,%ebp
 594:	53                   	push   %ebx
 595:	83 ec 04             	sub    $0x4,%esp
 598:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 59a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 59f:	77 05                	ja     5a6 <morecore+0x15>
    nu = 4096;
 5a1:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5ad:	83 ec 0c             	sub    $0xc,%esp
 5b0:	50                   	push   %eax
 5b1:	e8 38 fd ff ff       	call   2ee <sbrk>
  if(p == (char*)-1)
 5b6:	83 c4 10             	add    $0x10,%esp
 5b9:	83 f8 ff             	cmp    $0xffffffff,%eax
 5bc:	74 1c                	je     5da <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5be:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5c1:	83 c0 08             	add    $0x8,%eax
 5c4:	83 ec 0c             	sub    $0xc,%esp
 5c7:	50                   	push   %eax
 5c8:	e8 54 ff ff ff       	call   521 <free>
  return freep;
 5cd:	a1 0c 0a 00 00       	mov    0xa0c,%eax
 5d2:	83 c4 10             	add    $0x10,%esp
}
 5d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d8:	c9                   	leave  
 5d9:	c3                   	ret    
    return 0;
 5da:	b8 00 00 00 00       	mov    $0x0,%eax
 5df:	eb f4                	jmp    5d5 <morecore+0x44>

000005e1 <malloc>:

void*
malloc(uint nbytes)
{
 5e1:	55                   	push   %ebp
 5e2:	89 e5                	mov    %esp,%ebp
 5e4:	53                   	push   %ebx
 5e5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5e8:	8b 45 08             	mov    0x8(%ebp),%eax
 5eb:	8d 58 07             	lea    0x7(%eax),%ebx
 5ee:	c1 eb 03             	shr    $0x3,%ebx
 5f1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5f4:	8b 0d 0c 0a 00 00    	mov    0xa0c,%ecx
 5fa:	85 c9                	test   %ecx,%ecx
 5fc:	74 04                	je     602 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5fe:	8b 01                	mov    (%ecx),%eax
 600:	eb 4a                	jmp    64c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 602:	c7 05 0c 0a 00 00 10 	movl   $0xa10,0xa0c
 609:	0a 00 00 
 60c:	c7 05 10 0a 00 00 10 	movl   $0xa10,0xa10
 613:	0a 00 00 
    base.s.size = 0;
 616:	c7 05 14 0a 00 00 00 	movl   $0x0,0xa14
 61d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 620:	b9 10 0a 00 00       	mov    $0xa10,%ecx
 625:	eb d7                	jmp    5fe <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 627:	74 19                	je     642 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 629:	29 da                	sub    %ebx,%edx
 62b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 62e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 631:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 634:	89 0d 0c 0a 00 00    	mov    %ecx,0xa0c
      return (void*)(p + 1);
 63a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 63d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 640:	c9                   	leave  
 641:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 642:	8b 10                	mov    (%eax),%edx
 644:	89 11                	mov    %edx,(%ecx)
 646:	eb ec                	jmp    634 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 648:	89 c1                	mov    %eax,%ecx
 64a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 64c:	8b 50 04             	mov    0x4(%eax),%edx
 64f:	39 da                	cmp    %ebx,%edx
 651:	73 d4                	jae    627 <malloc+0x46>
    if(p == freep)
 653:	39 05 0c 0a 00 00    	cmp    %eax,0xa0c
 659:	75 ed                	jne    648 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 65b:	89 d8                	mov    %ebx,%eax
 65d:	e8 2f ff ff ff       	call   591 <morecore>
 662:	85 c0                	test   %eax,%eax
 664:	75 e2                	jne    648 <malloc+0x67>
 666:	eb d5                	jmp    63d <malloc+0x5c>
