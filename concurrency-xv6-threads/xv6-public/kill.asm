
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 07                	jle    25 <main+0x25>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 2d                	jmp    52 <main+0x52>
    printf(2, "usage: kill pid...\n");
  25:	83 ec 08             	sub    $0x8,%esp
  28:	68 98 06 00 00       	push   $0x698
  2d:	6a 02                	push   $0x2
  2f:	e8 b4 03 00 00       	call   3e8 <printf>
    exit();
  34:	e8 5a 02 00 00       	call   293 <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	push   (%edi,%ebx,4)
  3f:	e8 52 01 00 00       	call   196 <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 77 02 00 00       	call   2c3 <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 38 02 00 00       	call   293 <exit>

0000005b <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
  5b:	55                   	push   %ebp
  5c:	89 e5                	mov    %esp,%ebp
  5e:	56                   	push   %esi
  5f:	53                   	push   %ebx
  60:	8b 75 08             	mov    0x8(%ebp),%esi
  63:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  66:	89 f0                	mov    %esi,%eax
  68:	89 d1                	mov    %edx,%ecx
  6a:	83 c2 01             	add    $0x1,%edx
  6d:	89 c3                	mov    %eax,%ebx
  6f:	83 c0 01             	add    $0x1,%eax
  72:	0f b6 09             	movzbl (%ecx),%ecx
  75:	88 0b                	mov    %cl,(%ebx)
  77:	84 c9                	test   %cl,%cl
  79:	75 ed                	jne    68 <strcpy+0xd>
    ;
  return os;
}
  7b:	89 f0                	mov    %esi,%eax
  7d:	5b                   	pop    %ebx
  7e:	5e                   	pop    %esi
  7f:	5d                   	pop    %ebp
  80:	c3                   	ret    

00000081 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  81:	55                   	push   %ebp
  82:	89 e5                	mov    %esp,%ebp
  84:	8b 4d 08             	mov    0x8(%ebp),%ecx
  87:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  8a:	eb 06                	jmp    92 <strcmp+0x11>
    p++, q++;
  8c:	83 c1 01             	add    $0x1,%ecx
  8f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  92:	0f b6 01             	movzbl (%ecx),%eax
  95:	84 c0                	test   %al,%al
  97:	74 04                	je     9d <strcmp+0x1c>
  99:	3a 02                	cmp    (%edx),%al
  9b:	74 ef                	je     8c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  9d:	0f b6 c0             	movzbl %al,%eax
  a0:	0f b6 12             	movzbl (%edx),%edx
  a3:	29 d0                	sub    %edx,%eax
}
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    

000000a7 <strlen>:

uint
strlen(const char *s)
{
  a7:	55                   	push   %ebp
  a8:	89 e5                	mov    %esp,%ebp
  aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  ad:	b8 00 00 00 00       	mov    $0x0,%eax
  b2:	eb 03                	jmp    b7 <strlen+0x10>
  b4:	83 c0 01             	add    $0x1,%eax
  b7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bb:	75 f7                	jne    b4 <strlen+0xd>
    ;
  return n;
}
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <memset>:

void*
memset(void *dst, int c, uint n)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	57                   	push   %edi
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c6:	89 d7                	mov    %edx,%edi
  c8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ce:	fc                   	cld    
  cf:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d1:	89 d0                	mov    %edx,%eax
  d3:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d6:	c9                   	leave  
  d7:	c3                   	ret    

000000d8 <strchr>:

char*
strchr(const char *s, char c)
{
  d8:	55                   	push   %ebp
  d9:	89 e5                	mov    %esp,%ebp
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  e2:	eb 03                	jmp    e7 <strchr+0xf>
  e4:	83 c0 01             	add    $0x1,%eax
  e7:	0f b6 10             	movzbl (%eax),%edx
  ea:	84 d2                	test   %dl,%dl
  ec:	74 06                	je     f4 <strchr+0x1c>
    if(*s == c)
  ee:	38 ca                	cmp    %cl,%dl
  f0:	75 f2                	jne    e4 <strchr+0xc>
  f2:	eb 05                	jmp    f9 <strchr+0x21>
      return (char*)s;
  return 0;
  f4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <gets>:

char*
gets(char *buf, int max)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	57                   	push   %edi
  ff:	56                   	push   %esi
 100:	53                   	push   %ebx
 101:	83 ec 1c             	sub    $0x1c,%esp
 104:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 107:	bb 00 00 00 00       	mov    $0x0,%ebx
 10c:	89 de                	mov    %ebx,%esi
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 114:	7d 2e                	jge    144 <gets+0x49>
    cc = read(0, &c, 1);
 116:	83 ec 04             	sub    $0x4,%esp
 119:	6a 01                	push   $0x1
 11b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11e:	50                   	push   %eax
 11f:	6a 00                	push   $0x0
 121:	e8 85 01 00 00       	call   2ab <read>
    if(cc < 1)
 126:	83 c4 10             	add    $0x10,%esp
 129:	85 c0                	test   %eax,%eax
 12b:	7e 17                	jle    144 <gets+0x49>
      break;
    buf[i++] = c;
 12d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 131:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 134:	3c 0a                	cmp    $0xa,%al
 136:	0f 94 c2             	sete   %dl
 139:	3c 0d                	cmp    $0xd,%al
 13b:	0f 94 c0             	sete   %al
 13e:	08 c2                	or     %al,%dl
 140:	74 ca                	je     10c <gets+0x11>
    buf[i++] = c;
 142:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 144:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 148:	89 f8                	mov    %edi,%eax
 14a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    

00000152 <stat>:

int
stat(const char *n, struct stat *st)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	56                   	push   %esi
 156:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 157:	83 ec 08             	sub    $0x8,%esp
 15a:	6a 00                	push   $0x0
 15c:	ff 75 08             	push   0x8(%ebp)
 15f:	e8 6f 01 00 00       	call   2d3 <open>
  if(fd < 0)
 164:	83 c4 10             	add    $0x10,%esp
 167:	85 c0                	test   %eax,%eax
 169:	78 24                	js     18f <stat+0x3d>
 16b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 16d:	83 ec 08             	sub    $0x8,%esp
 170:	ff 75 0c             	push   0xc(%ebp)
 173:	50                   	push   %eax
 174:	e8 72 01 00 00       	call   2eb <fstat>
 179:	89 c6                	mov    %eax,%esi
  close(fd);
 17b:	89 1c 24             	mov    %ebx,(%esp)
 17e:	e8 38 01 00 00       	call   2bb <close>
  return r;
 183:	83 c4 10             	add    $0x10,%esp
}
 186:	89 f0                	mov    %esi,%eax
 188:	8d 65 f8             	lea    -0x8(%ebp),%esp
 18b:	5b                   	pop    %ebx
 18c:	5e                   	pop    %esi
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
    return -1;
 18f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 194:	eb f0                	jmp    186 <stat+0x34>

00000196 <atoi>:

int
atoi(const char *s)
{
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 19d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1a2:	eb 10                	jmp    1b4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1a4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1aa:	83 c1 01             	add    $0x1,%ecx
 1ad:	0f be c0             	movsbl %al,%eax
 1b0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1b4:	0f b6 01             	movzbl (%ecx),%eax
 1b7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1ba:	80 fb 09             	cmp    $0x9,%bl
 1bd:	76 e5                	jbe    1a4 <atoi+0xe>
  return n;
}
 1bf:	89 d0                	mov    %edx,%eax
 1c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c4:	c9                   	leave  
 1c5:	c3                   	ret    

000001c6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	56                   	push   %esi
 1ca:	53                   	push   %ebx
 1cb:	8b 75 08             	mov    0x8(%ebp),%esi
 1ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1d4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1d6:	eb 0d                	jmp    1e5 <memmove+0x1f>
    *dst++ = *src++;
 1d8:	0f b6 01             	movzbl (%ecx),%eax
 1db:	88 02                	mov    %al,(%edx)
 1dd:	8d 49 01             	lea    0x1(%ecx),%ecx
 1e0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1e3:	89 d8                	mov    %ebx,%eax
 1e5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1e8:	85 c0                	test   %eax,%eax
 1ea:	7f ec                	jg     1d8 <memmove+0x12>
  return vdst;
}
 1ec:	89 f0                	mov    %esi,%eax
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    

000001f2 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 1f8:	68 00 20 00 00       	push   $0x2000
 1fd:	e8 0c 04 00 00       	call   60e <malloc>
  if((uint)(stack) % PGSIZE != 0){
 202:	83 c4 10             	add    $0x10,%esp
 205:	a9 ff 0f 00 00       	test   $0xfff,%eax
 20a:	74 0a                	je     216 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 20c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 211:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 216:	50                   	push   %eax
 217:	ff 75 10             	push   0x10(%ebp)
 21a:	ff 75 0c             	push   0xc(%ebp)
 21d:	ff 75 08             	push   0x8(%ebp)
 220:	e8 0e 01 00 00       	call   333 <clone>
  return pid;
}
 225:	c9                   	leave  
 226:	c3                   	ret    

00000227 <thread_join>:
int
thread_join()
{
 227:	55                   	push   %ebp
 228:	89 e5                	mov    %esp,%ebp
 22a:	53                   	push   %ebx
 22b:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 22e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 231:	50                   	push   %eax
 232:	e8 04 01 00 00       	call   33b <join>
 237:	89 c3                	mov    %eax,%ebx
  free(stack);
 239:	83 c4 04             	add    $0x4,%esp
 23c:	ff 75 f4             	push   -0xc(%ebp)
 23f:	e8 0a 03 00 00       	call   54e <free>
  return pid;
}
 244:	89 d8                	mov    %ebx,%eax
 246:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 249:	c9                   	leave  
 24a:	c3                   	ret    

0000024b <lock_init>:
int
lock_init(lock_t * lock){
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 257:	b8 00 00 00 00       	mov    $0x0,%eax
 25c:	5d                   	pop    %ebp
 25d:	c3                   	ret    

0000025e <lock_acquire>:
int
lock_acquire(lock_t * lock){
 25e:	55                   	push   %ebp
 25f:	89 e5                	mov    %esp,%ebp
 261:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 264:	b8 01 00 00 00       	mov    $0x1,%eax
 269:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 26c:	83 f8 01             	cmp    $0x1,%eax
 26f:	74 f3                	je     264 <lock_acquire+0x6>
  {

  }
  return 0;
}
 271:	b8 00 00 00 00       	mov    $0x0,%eax
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    

00000278 <lock_release>:
int
lock_release(lock_t * lock){
 278:	55                   	push   %ebp
 279:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 284:	b8 00 00 00 00       	mov    $0x0,%eax
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret    

0000028b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28b:	b8 01 00 00 00       	mov    $0x1,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <exit>:
SYSCALL(exit)
 293:	b8 02 00 00 00       	mov    $0x2,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <wait>:
SYSCALL(wait)
 29b:	b8 03 00 00 00       	mov    $0x3,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <pipe>:
SYSCALL(pipe)
 2a3:	b8 04 00 00 00       	mov    $0x4,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <read>:
SYSCALL(read)
 2ab:	b8 05 00 00 00       	mov    $0x5,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <write>:
SYSCALL(write)
 2b3:	b8 10 00 00 00       	mov    $0x10,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <close>:
SYSCALL(close)
 2bb:	b8 15 00 00 00       	mov    $0x15,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <kill>:
SYSCALL(kill)
 2c3:	b8 06 00 00 00       	mov    $0x6,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <exec>:
SYSCALL(exec)
 2cb:	b8 07 00 00 00       	mov    $0x7,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <open>:
SYSCALL(open)
 2d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <mknod>:
SYSCALL(mknod)
 2db:	b8 11 00 00 00       	mov    $0x11,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <unlink>:
SYSCALL(unlink)
 2e3:	b8 12 00 00 00       	mov    $0x12,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <fstat>:
SYSCALL(fstat)
 2eb:	b8 08 00 00 00       	mov    $0x8,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <link>:
SYSCALL(link)
 2f3:	b8 13 00 00 00       	mov    $0x13,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <mkdir>:
SYSCALL(mkdir)
 2fb:	b8 14 00 00 00       	mov    $0x14,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <chdir>:
SYSCALL(chdir)
 303:	b8 09 00 00 00       	mov    $0x9,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <dup>:
SYSCALL(dup)
 30b:	b8 0a 00 00 00       	mov    $0xa,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <getpid>:
SYSCALL(getpid)
 313:	b8 0b 00 00 00       	mov    $0xb,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <sbrk>:
SYSCALL(sbrk)
 31b:	b8 0c 00 00 00       	mov    $0xc,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <sleep>:
SYSCALL(sleep)
 323:	b8 0d 00 00 00       	mov    $0xd,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <uptime>:
SYSCALL(uptime)
 32b:	b8 0e 00 00 00       	mov    $0xe,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <clone>:
SYSCALL(clone)
 333:	b8 16 00 00 00       	mov    $0x16,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <join>:
SYSCALL(join)
 33b:	b8 17 00 00 00       	mov    $0x17,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 343:	55                   	push   %ebp
 344:	89 e5                	mov    %esp,%ebp
 346:	83 ec 1c             	sub    $0x1c,%esp
 349:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 34c:	6a 01                	push   $0x1
 34e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 351:	52                   	push   %edx
 352:	50                   	push   %eax
 353:	e8 5b ff ff ff       	call   2b3 <write>
}
 358:	83 c4 10             	add    $0x10,%esp
 35b:	c9                   	leave  
 35c:	c3                   	ret    

0000035d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 35d:	55                   	push   %ebp
 35e:	89 e5                	mov    %esp,%ebp
 360:	57                   	push   %edi
 361:	56                   	push   %esi
 362:	53                   	push   %ebx
 363:	83 ec 2c             	sub    $0x2c,%esp
 366:	89 45 d0             	mov    %eax,-0x30(%ebp)
 369:	89 d0                	mov    %edx,%eax
 36b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 36d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 371:	0f 95 c1             	setne  %cl
 374:	c1 ea 1f             	shr    $0x1f,%edx
 377:	84 d1                	test   %dl,%cl
 379:	74 44                	je     3bf <printint+0x62>
    neg = 1;
    x = -xx;
 37b:	f7 d8                	neg    %eax
 37d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 37f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 386:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 38b:	89 c8                	mov    %ecx,%eax
 38d:	ba 00 00 00 00       	mov    $0x0,%edx
 392:	f7 f6                	div    %esi
 394:	89 df                	mov    %ebx,%edi
 396:	83 c3 01             	add    $0x1,%ebx
 399:	0f b6 92 0c 07 00 00 	movzbl 0x70c(%edx),%edx
 3a0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3a4:	89 ca                	mov    %ecx,%edx
 3a6:	89 c1                	mov    %eax,%ecx
 3a8:	39 d6                	cmp    %edx,%esi
 3aa:	76 df                	jbe    38b <printint+0x2e>
  if(neg)
 3ac:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3b0:	74 31                	je     3e3 <printint+0x86>
    buf[i++] = '-';
 3b2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3b7:	8d 5f 02             	lea    0x2(%edi),%ebx
 3ba:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3bd:	eb 17                	jmp    3d6 <printint+0x79>
    x = xx;
 3bf:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3c1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3c8:	eb bc                	jmp    386 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3ca:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3cf:	89 f0                	mov    %esi,%eax
 3d1:	e8 6d ff ff ff       	call   343 <putc>
  while(--i >= 0)
 3d6:	83 eb 01             	sub    $0x1,%ebx
 3d9:	79 ef                	jns    3ca <printint+0x6d>
}
 3db:	83 c4 2c             	add    $0x2c,%esp
 3de:	5b                   	pop    %ebx
 3df:	5e                   	pop    %esi
 3e0:	5f                   	pop    %edi
 3e1:	5d                   	pop    %ebp
 3e2:	c3                   	ret    
 3e3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3e6:	eb ee                	jmp    3d6 <printint+0x79>

000003e8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	57                   	push   %edi
 3ec:	56                   	push   %esi
 3ed:	53                   	push   %ebx
 3ee:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3f1:	8d 45 10             	lea    0x10(%ebp),%eax
 3f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3f7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3fc:	bb 00 00 00 00       	mov    $0x0,%ebx
 401:	eb 14                	jmp    417 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 403:	89 fa                	mov    %edi,%edx
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	e8 36 ff ff ff       	call   343 <putc>
 40d:	eb 05                	jmp    414 <printf+0x2c>
      }
    } else if(state == '%'){
 40f:	83 fe 25             	cmp    $0x25,%esi
 412:	74 25                	je     439 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 414:	83 c3 01             	add    $0x1,%ebx
 417:	8b 45 0c             	mov    0xc(%ebp),%eax
 41a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 41e:	84 c0                	test   %al,%al
 420:	0f 84 20 01 00 00    	je     546 <printf+0x15e>
    c = fmt[i] & 0xff;
 426:	0f be f8             	movsbl %al,%edi
 429:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 42c:	85 f6                	test   %esi,%esi
 42e:	75 df                	jne    40f <printf+0x27>
      if(c == '%'){
 430:	83 f8 25             	cmp    $0x25,%eax
 433:	75 ce                	jne    403 <printf+0x1b>
        state = '%';
 435:	89 c6                	mov    %eax,%esi
 437:	eb db                	jmp    414 <printf+0x2c>
      if(c == 'd'){
 439:	83 f8 25             	cmp    $0x25,%eax
 43c:	0f 84 cf 00 00 00    	je     511 <printf+0x129>
 442:	0f 8c dd 00 00 00    	jl     525 <printf+0x13d>
 448:	83 f8 78             	cmp    $0x78,%eax
 44b:	0f 8f d4 00 00 00    	jg     525 <printf+0x13d>
 451:	83 f8 63             	cmp    $0x63,%eax
 454:	0f 8c cb 00 00 00    	jl     525 <printf+0x13d>
 45a:	83 e8 63             	sub    $0x63,%eax
 45d:	83 f8 15             	cmp    $0x15,%eax
 460:	0f 87 bf 00 00 00    	ja     525 <printf+0x13d>
 466:	ff 24 85 b4 06 00 00 	jmp    *0x6b4(,%eax,4)
        printint(fd, *ap, 10, 1);
 46d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 470:	8b 17                	mov    (%edi),%edx
 472:	83 ec 0c             	sub    $0xc,%esp
 475:	6a 01                	push   $0x1
 477:	b9 0a 00 00 00       	mov    $0xa,%ecx
 47c:	8b 45 08             	mov    0x8(%ebp),%eax
 47f:	e8 d9 fe ff ff       	call   35d <printint>
        ap++;
 484:	83 c7 04             	add    $0x4,%edi
 487:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 48a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 48d:	be 00 00 00 00       	mov    $0x0,%esi
 492:	eb 80                	jmp    414 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 494:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 497:	8b 17                	mov    (%edi),%edx
 499:	83 ec 0c             	sub    $0xc,%esp
 49c:	6a 00                	push   $0x0
 49e:	b9 10 00 00 00       	mov    $0x10,%ecx
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	e8 b2 fe ff ff       	call   35d <printint>
        ap++;
 4ab:	83 c7 04             	add    $0x4,%edi
 4ae:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4b1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4b4:	be 00 00 00 00       	mov    $0x0,%esi
 4b9:	e9 56 ff ff ff       	jmp    414 <printf+0x2c>
        s = (char*)*ap;
 4be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4c1:	8b 30                	mov    (%eax),%esi
        ap++;
 4c3:	83 c0 04             	add    $0x4,%eax
 4c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4c9:	85 f6                	test   %esi,%esi
 4cb:	75 15                	jne    4e2 <printf+0xfa>
          s = "(null)";
 4cd:	be ac 06 00 00       	mov    $0x6ac,%esi
 4d2:	eb 0e                	jmp    4e2 <printf+0xfa>
          putc(fd, *s);
 4d4:	0f be d2             	movsbl %dl,%edx
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	e8 64 fe ff ff       	call   343 <putc>
          s++;
 4df:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4e2:	0f b6 16             	movzbl (%esi),%edx
 4e5:	84 d2                	test   %dl,%dl
 4e7:	75 eb                	jne    4d4 <printf+0xec>
      state = 0;
 4e9:	be 00 00 00 00       	mov    $0x0,%esi
 4ee:	e9 21 ff ff ff       	jmp    414 <printf+0x2c>
        putc(fd, *ap);
 4f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4f6:	0f be 17             	movsbl (%edi),%edx
 4f9:	8b 45 08             	mov    0x8(%ebp),%eax
 4fc:	e8 42 fe ff ff       	call   343 <putc>
        ap++;
 501:	83 c7 04             	add    $0x4,%edi
 504:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 507:	be 00 00 00 00       	mov    $0x0,%esi
 50c:	e9 03 ff ff ff       	jmp    414 <printf+0x2c>
        putc(fd, c);
 511:	89 fa                	mov    %edi,%edx
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	e8 28 fe ff ff       	call   343 <putc>
      state = 0;
 51b:	be 00 00 00 00       	mov    $0x0,%esi
 520:	e9 ef fe ff ff       	jmp    414 <printf+0x2c>
        putc(fd, '%');
 525:	ba 25 00 00 00       	mov    $0x25,%edx
 52a:	8b 45 08             	mov    0x8(%ebp),%eax
 52d:	e8 11 fe ff ff       	call   343 <putc>
        putc(fd, c);
 532:	89 fa                	mov    %edi,%edx
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	e8 07 fe ff ff       	call   343 <putc>
      state = 0;
 53c:	be 00 00 00 00       	mov    $0x0,%esi
 541:	e9 ce fe ff ff       	jmp    414 <printf+0x2c>
    }
  }
}
 546:	8d 65 f4             	lea    -0xc(%ebp),%esp
 549:	5b                   	pop    %ebx
 54a:	5e                   	pop    %esi
 54b:	5f                   	pop    %edi
 54c:	5d                   	pop    %ebp
 54d:	c3                   	ret    

0000054e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 54e:	55                   	push   %ebp
 54f:	89 e5                	mov    %esp,%ebp
 551:	57                   	push   %edi
 552:	56                   	push   %esi
 553:	53                   	push   %ebx
 554:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 557:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 55a:	a1 5c 0a 00 00       	mov    0xa5c,%eax
 55f:	eb 02                	jmp    563 <free+0x15>
 561:	89 d0                	mov    %edx,%eax
 563:	39 c8                	cmp    %ecx,%eax
 565:	73 04                	jae    56b <free+0x1d>
 567:	39 08                	cmp    %ecx,(%eax)
 569:	77 12                	ja     57d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 56b:	8b 10                	mov    (%eax),%edx
 56d:	39 c2                	cmp    %eax,%edx
 56f:	77 f0                	ja     561 <free+0x13>
 571:	39 c8                	cmp    %ecx,%eax
 573:	72 08                	jb     57d <free+0x2f>
 575:	39 ca                	cmp    %ecx,%edx
 577:	77 04                	ja     57d <free+0x2f>
 579:	89 d0                	mov    %edx,%eax
 57b:	eb e6                	jmp    563 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 57d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 580:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 583:	8b 10                	mov    (%eax),%edx
 585:	39 d7                	cmp    %edx,%edi
 587:	74 19                	je     5a2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 589:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 58c:	8b 50 04             	mov    0x4(%eax),%edx
 58f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 592:	39 ce                	cmp    %ecx,%esi
 594:	74 1b                	je     5b1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 596:	89 08                	mov    %ecx,(%eax)
  freep = p;
 598:	a3 5c 0a 00 00       	mov    %eax,0xa5c
}
 59d:	5b                   	pop    %ebx
 59e:	5e                   	pop    %esi
 59f:	5f                   	pop    %edi
 5a0:	5d                   	pop    %ebp
 5a1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5a2:	03 72 04             	add    0x4(%edx),%esi
 5a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5a8:	8b 10                	mov    (%eax),%edx
 5aa:	8b 12                	mov    (%edx),%edx
 5ac:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5af:	eb db                	jmp    58c <free+0x3e>
    p->s.size += bp->s.size;
 5b1:	03 53 fc             	add    -0x4(%ebx),%edx
 5b4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5b7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5ba:	89 10                	mov    %edx,(%eax)
 5bc:	eb da                	jmp    598 <free+0x4a>

000005be <morecore>:

static Header*
morecore(uint nu)
{
 5be:	55                   	push   %ebp
 5bf:	89 e5                	mov    %esp,%ebp
 5c1:	53                   	push   %ebx
 5c2:	83 ec 04             	sub    $0x4,%esp
 5c5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5c7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5cc:	77 05                	ja     5d3 <morecore+0x15>
    nu = 4096;
 5ce:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5d3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5da:	83 ec 0c             	sub    $0xc,%esp
 5dd:	50                   	push   %eax
 5de:	e8 38 fd ff ff       	call   31b <sbrk>
  if(p == (char*)-1)
 5e3:	83 c4 10             	add    $0x10,%esp
 5e6:	83 f8 ff             	cmp    $0xffffffff,%eax
 5e9:	74 1c                	je     607 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5eb:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5ee:	83 c0 08             	add    $0x8,%eax
 5f1:	83 ec 0c             	sub    $0xc,%esp
 5f4:	50                   	push   %eax
 5f5:	e8 54 ff ff ff       	call   54e <free>
  return freep;
 5fa:	a1 5c 0a 00 00       	mov    0xa5c,%eax
 5ff:	83 c4 10             	add    $0x10,%esp
}
 602:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 605:	c9                   	leave  
 606:	c3                   	ret    
    return 0;
 607:	b8 00 00 00 00       	mov    $0x0,%eax
 60c:	eb f4                	jmp    602 <morecore+0x44>

0000060e <malloc>:

void*
malloc(uint nbytes)
{
 60e:	55                   	push   %ebp
 60f:	89 e5                	mov    %esp,%ebp
 611:	53                   	push   %ebx
 612:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 615:	8b 45 08             	mov    0x8(%ebp),%eax
 618:	8d 58 07             	lea    0x7(%eax),%ebx
 61b:	c1 eb 03             	shr    $0x3,%ebx
 61e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 621:	8b 0d 5c 0a 00 00    	mov    0xa5c,%ecx
 627:	85 c9                	test   %ecx,%ecx
 629:	74 04                	je     62f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 62b:	8b 01                	mov    (%ecx),%eax
 62d:	eb 4a                	jmp    679 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 62f:	c7 05 5c 0a 00 00 60 	movl   $0xa60,0xa5c
 636:	0a 00 00 
 639:	c7 05 60 0a 00 00 60 	movl   $0xa60,0xa60
 640:	0a 00 00 
    base.s.size = 0;
 643:	c7 05 64 0a 00 00 00 	movl   $0x0,0xa64
 64a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 64d:	b9 60 0a 00 00       	mov    $0xa60,%ecx
 652:	eb d7                	jmp    62b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 654:	74 19                	je     66f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 656:	29 da                	sub    %ebx,%edx
 658:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 65b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 65e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 661:	89 0d 5c 0a 00 00    	mov    %ecx,0xa5c
      return (void*)(p + 1);
 667:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 66a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 66d:	c9                   	leave  
 66e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 66f:	8b 10                	mov    (%eax),%edx
 671:	89 11                	mov    %edx,(%ecx)
 673:	eb ec                	jmp    661 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 675:	89 c1                	mov    %eax,%ecx
 677:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 679:	8b 50 04             	mov    0x4(%eax),%edx
 67c:	39 da                	cmp    %ebx,%edx
 67e:	73 d4                	jae    654 <malloc+0x46>
    if(p == freep)
 680:	39 05 5c 0a 00 00    	cmp    %eax,0xa5c
 686:	75 ed                	jne    675 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 688:	89 d8                	mov    %ebx,%eax
 68a:	e8 2f ff ff ff       	call   5be <morecore>
 68f:	85 c0                	test   %eax,%eax
 691:	75 e2                	jne    675 <malloc+0x67>
 693:	eb d5                	jmp    66a <malloc+0x5c>
