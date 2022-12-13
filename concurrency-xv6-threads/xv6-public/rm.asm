
_rm:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 41 04             	mov    0x4(%ecx),%eax
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  1c:	83 ff 01             	cmp    $0x1,%edi
  1f:	7e 07                	jle    28 <main+0x28>
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: rm files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 b0 06 00 00       	push   $0x6b0
  30:	6a 02                	push   $0x2
  32:	e8 c9 03 00 00       	call   400 <printf>
    exit();
  37:	e8 6f 02 00 00       	call   2ab <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(unlink(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 a8 02 00 00       	call   2fb <unlink>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 c4 06 00 00       	push   $0x6c4
  64:	6a 02                	push   $0x2
  66:	e8 95 03 00 00       	call   400 <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 38 02 00 00       	call   2ab <exit>

00000073 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
  73:	55                   	push   %ebp
  74:	89 e5                	mov    %esp,%ebp
  76:	56                   	push   %esi
  77:	53                   	push   %ebx
  78:	8b 75 08             	mov    0x8(%ebp),%esi
  7b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7e:	89 f0                	mov    %esi,%eax
  80:	89 d1                	mov    %edx,%ecx
  82:	83 c2 01             	add    $0x1,%edx
  85:	89 c3                	mov    %eax,%ebx
  87:	83 c0 01             	add    $0x1,%eax
  8a:	0f b6 09             	movzbl (%ecx),%ecx
  8d:	88 0b                	mov    %cl,(%ebx)
  8f:	84 c9                	test   %cl,%cl
  91:	75 ed                	jne    80 <strcpy+0xd>
    ;
  return os;
}
  93:	89 f0                	mov    %esi,%eax
  95:	5b                   	pop    %ebx
  96:	5e                   	pop    %esi
  97:	5d                   	pop    %ebp
  98:	c3                   	ret    

00000099 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  99:	55                   	push   %ebp
  9a:	89 e5                	mov    %esp,%ebp
  9c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  a2:	eb 06                	jmp    aa <strcmp+0x11>
    p++, q++;
  a4:	83 c1 01             	add    $0x1,%ecx
  a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  aa:	0f b6 01             	movzbl (%ecx),%eax
  ad:	84 c0                	test   %al,%al
  af:	74 04                	je     b5 <strcmp+0x1c>
  b1:	3a 02                	cmp    (%edx),%al
  b3:	74 ef                	je     a4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  b5:	0f b6 c0             	movzbl %al,%eax
  b8:	0f b6 12             	movzbl (%edx),%edx
  bb:	29 d0                	sub    %edx,%eax
}
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <strlen>:

uint
strlen(const char *s)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  c5:	b8 00 00 00 00       	mov    $0x0,%eax
  ca:	eb 03                	jmp    cf <strlen+0x10>
  cc:	83 c0 01             	add    $0x1,%eax
  cf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  d3:	75 f7                	jne    cc <strlen+0xd>
    ;
  return n;
}
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    

000000d7 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d7:	55                   	push   %ebp
  d8:	89 e5                	mov    %esp,%ebp
  da:	57                   	push   %edi
  db:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  de:	89 d7                	mov    %edx,%edi
  e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
  e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  e6:	fc                   	cld    
  e7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e9:	89 d0                	mov    %edx,%eax
  eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
  ee:	c9                   	leave  
  ef:	c3                   	ret    

000000f0 <strchr>:

char*
strchr(const char *s, char c)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  fa:	eb 03                	jmp    ff <strchr+0xf>
  fc:	83 c0 01             	add    $0x1,%eax
  ff:	0f b6 10             	movzbl (%eax),%edx
 102:	84 d2                	test   %dl,%dl
 104:	74 06                	je     10c <strchr+0x1c>
    if(*s == c)
 106:	38 ca                	cmp    %cl,%dl
 108:	75 f2                	jne    fc <strchr+0xc>
 10a:	eb 05                	jmp    111 <strchr+0x21>
      return (char*)s;
  return 0;
 10c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    

00000113 <gets>:

char*
gets(char *buf, int max)
{
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	57                   	push   %edi
 117:	56                   	push   %esi
 118:	53                   	push   %ebx
 119:	83 ec 1c             	sub    $0x1c,%esp
 11c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 11f:	bb 00 00 00 00       	mov    $0x0,%ebx
 124:	89 de                	mov    %ebx,%esi
 126:	83 c3 01             	add    $0x1,%ebx
 129:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 12c:	7d 2e                	jge    15c <gets+0x49>
    cc = read(0, &c, 1);
 12e:	83 ec 04             	sub    $0x4,%esp
 131:	6a 01                	push   $0x1
 133:	8d 45 e7             	lea    -0x19(%ebp),%eax
 136:	50                   	push   %eax
 137:	6a 00                	push   $0x0
 139:	e8 85 01 00 00       	call   2c3 <read>
    if(cc < 1)
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	7e 17                	jle    15c <gets+0x49>
      break;
    buf[i++] = c;
 145:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 149:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 14c:	3c 0a                	cmp    $0xa,%al
 14e:	0f 94 c2             	sete   %dl
 151:	3c 0d                	cmp    $0xd,%al
 153:	0f 94 c0             	sete   %al
 156:	08 c2                	or     %al,%dl
 158:	74 ca                	je     124 <gets+0x11>
    buf[i++] = c;
 15a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 15c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 160:	89 f8                	mov    %edi,%eax
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    

0000016a <stat>:

int
stat(const char *n, struct stat *st)
{
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	56                   	push   %esi
 16e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 16f:	83 ec 08             	sub    $0x8,%esp
 172:	6a 00                	push   $0x0
 174:	ff 75 08             	push   0x8(%ebp)
 177:	e8 6f 01 00 00       	call   2eb <open>
  if(fd < 0)
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	85 c0                	test   %eax,%eax
 181:	78 24                	js     1a7 <stat+0x3d>
 183:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 185:	83 ec 08             	sub    $0x8,%esp
 188:	ff 75 0c             	push   0xc(%ebp)
 18b:	50                   	push   %eax
 18c:	e8 72 01 00 00       	call   303 <fstat>
 191:	89 c6                	mov    %eax,%esi
  close(fd);
 193:	89 1c 24             	mov    %ebx,(%esp)
 196:	e8 38 01 00 00       	call   2d3 <close>
  return r;
 19b:	83 c4 10             	add    $0x10,%esp
}
 19e:	89 f0                	mov    %esi,%eax
 1a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a3:	5b                   	pop    %ebx
 1a4:	5e                   	pop    %esi
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    
    return -1;
 1a7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1ac:	eb f0                	jmp    19e <stat+0x34>

000001ae <atoi>:

int
atoi(const char *s)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	53                   	push   %ebx
 1b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1b5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1ba:	eb 10                	jmp    1cc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1bc:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1bf:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1c2:	83 c1 01             	add    $0x1,%ecx
 1c5:	0f be c0             	movsbl %al,%eax
 1c8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1cc:	0f b6 01             	movzbl (%ecx),%eax
 1cf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1d2:	80 fb 09             	cmp    $0x9,%bl
 1d5:	76 e5                	jbe    1bc <atoi+0xe>
  return n;
}
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1dc:	c9                   	leave  
 1dd:	c3                   	ret    

000001de <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	56                   	push   %esi
 1e2:	53                   	push   %ebx
 1e3:	8b 75 08             	mov    0x8(%ebp),%esi
 1e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1e9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1ec:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1ee:	eb 0d                	jmp    1fd <memmove+0x1f>
    *dst++ = *src++;
 1f0:	0f b6 01             	movzbl (%ecx),%eax
 1f3:	88 02                	mov    %al,(%edx)
 1f5:	8d 49 01             	lea    0x1(%ecx),%ecx
 1f8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1fb:	89 d8                	mov    %ebx,%eax
 1fd:	8d 58 ff             	lea    -0x1(%eax),%ebx
 200:	85 c0                	test   %eax,%eax
 202:	7f ec                	jg     1f0 <memmove+0x12>
  return vdst;
}
 204:	89 f0                	mov    %esi,%eax
 206:	5b                   	pop    %ebx
 207:	5e                   	pop    %esi
 208:	5d                   	pop    %ebp
 209:	c3                   	ret    

0000020a <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 20a:	55                   	push   %ebp
 20b:	89 e5                	mov    %esp,%ebp
 20d:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 210:	68 00 20 00 00       	push   $0x2000
 215:	e8 0c 04 00 00       	call   626 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 21a:	83 c4 10             	add    $0x10,%esp
 21d:	a9 ff 0f 00 00       	test   $0xfff,%eax
 222:	74 0a                	je     22e <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 224:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 229:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 22e:	50                   	push   %eax
 22f:	ff 75 10             	push   0x10(%ebp)
 232:	ff 75 0c             	push   0xc(%ebp)
 235:	ff 75 08             	push   0x8(%ebp)
 238:	e8 0e 01 00 00       	call   34b <clone>
  return pid;
}
 23d:	c9                   	leave  
 23e:	c3                   	ret    

0000023f <thread_join>:
int
thread_join()
{
 23f:	55                   	push   %ebp
 240:	89 e5                	mov    %esp,%ebp
 242:	53                   	push   %ebx
 243:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 246:	8d 45 f4             	lea    -0xc(%ebp),%eax
 249:	50                   	push   %eax
 24a:	e8 04 01 00 00       	call   353 <join>
 24f:	89 c3                	mov    %eax,%ebx
  free(stack);
 251:	83 c4 04             	add    $0x4,%esp
 254:	ff 75 f4             	push   -0xc(%ebp)
 257:	e8 0a 03 00 00       	call   566 <free>
  return pid;
}
 25c:	89 d8                	mov    %ebx,%eax
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <lock_init>:
int
lock_init(lock_t * lock){
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 26f:	b8 00 00 00 00       	mov    $0x0,%eax
 274:	5d                   	pop    %ebp
 275:	c3                   	ret    

00000276 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 27c:	b8 01 00 00 00       	mov    $0x1,%eax
 281:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 284:	83 f8 01             	cmp    $0x1,%eax
 287:	74 f3                	je     27c <lock_acquire+0x6>
  {

  }
  return 0;
}
 289:	b8 00 00 00 00       	mov    $0x0,%eax
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    

00000290 <lock_release>:
int
lock_release(lock_t * lock){
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 29c:	b8 00 00 00 00       	mov    $0x0,%eax
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    

000002a3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a3:	b8 01 00 00 00       	mov    $0x1,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <exit>:
SYSCALL(exit)
 2ab:	b8 02 00 00 00       	mov    $0x2,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <wait>:
SYSCALL(wait)
 2b3:	b8 03 00 00 00       	mov    $0x3,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <pipe>:
SYSCALL(pipe)
 2bb:	b8 04 00 00 00       	mov    $0x4,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <read>:
SYSCALL(read)
 2c3:	b8 05 00 00 00       	mov    $0x5,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <write>:
SYSCALL(write)
 2cb:	b8 10 00 00 00       	mov    $0x10,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <close>:
SYSCALL(close)
 2d3:	b8 15 00 00 00       	mov    $0x15,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <kill>:
SYSCALL(kill)
 2db:	b8 06 00 00 00       	mov    $0x6,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <exec>:
SYSCALL(exec)
 2e3:	b8 07 00 00 00       	mov    $0x7,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <open>:
SYSCALL(open)
 2eb:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <mknod>:
SYSCALL(mknod)
 2f3:	b8 11 00 00 00       	mov    $0x11,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <unlink>:
SYSCALL(unlink)
 2fb:	b8 12 00 00 00       	mov    $0x12,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <fstat>:
SYSCALL(fstat)
 303:	b8 08 00 00 00       	mov    $0x8,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <link>:
SYSCALL(link)
 30b:	b8 13 00 00 00       	mov    $0x13,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <mkdir>:
SYSCALL(mkdir)
 313:	b8 14 00 00 00       	mov    $0x14,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <chdir>:
SYSCALL(chdir)
 31b:	b8 09 00 00 00       	mov    $0x9,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <dup>:
SYSCALL(dup)
 323:	b8 0a 00 00 00       	mov    $0xa,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <getpid>:
SYSCALL(getpid)
 32b:	b8 0b 00 00 00       	mov    $0xb,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <sbrk>:
SYSCALL(sbrk)
 333:	b8 0c 00 00 00       	mov    $0xc,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <sleep>:
SYSCALL(sleep)
 33b:	b8 0d 00 00 00       	mov    $0xd,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <uptime>:
SYSCALL(uptime)
 343:	b8 0e 00 00 00       	mov    $0xe,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <clone>:
SYSCALL(clone)
 34b:	b8 16 00 00 00       	mov    $0x16,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <join>:
SYSCALL(join)
 353:	b8 17 00 00 00       	mov    $0x17,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	83 ec 1c             	sub    $0x1c,%esp
 361:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 364:	6a 01                	push   $0x1
 366:	8d 55 f4             	lea    -0xc(%ebp),%edx
 369:	52                   	push   %edx
 36a:	50                   	push   %eax
 36b:	e8 5b ff ff ff       	call   2cb <write>
}
 370:	83 c4 10             	add    $0x10,%esp
 373:	c9                   	leave  
 374:	c3                   	ret    

00000375 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 375:	55                   	push   %ebp
 376:	89 e5                	mov    %esp,%ebp
 378:	57                   	push   %edi
 379:	56                   	push   %esi
 37a:	53                   	push   %ebx
 37b:	83 ec 2c             	sub    $0x2c,%esp
 37e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 381:	89 d0                	mov    %edx,%eax
 383:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 385:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 389:	0f 95 c1             	setne  %cl
 38c:	c1 ea 1f             	shr    $0x1f,%edx
 38f:	84 d1                	test   %dl,%cl
 391:	74 44                	je     3d7 <printint+0x62>
    neg = 1;
    x = -xx;
 393:	f7 d8                	neg    %eax
 395:	89 c1                	mov    %eax,%ecx
    neg = 1;
 397:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 39e:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3a3:	89 c8                	mov    %ecx,%eax
 3a5:	ba 00 00 00 00       	mov    $0x0,%edx
 3aa:	f7 f6                	div    %esi
 3ac:	89 df                	mov    %ebx,%edi
 3ae:	83 c3 01             	add    $0x1,%ebx
 3b1:	0f b6 92 3c 07 00 00 	movzbl 0x73c(%edx),%edx
 3b8:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3bc:	89 ca                	mov    %ecx,%edx
 3be:	89 c1                	mov    %eax,%ecx
 3c0:	39 d6                	cmp    %edx,%esi
 3c2:	76 df                	jbe    3a3 <printint+0x2e>
  if(neg)
 3c4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3c8:	74 31                	je     3fb <printint+0x86>
    buf[i++] = '-';
 3ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3cf:	8d 5f 02             	lea    0x2(%edi),%ebx
 3d2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d5:	eb 17                	jmp    3ee <printint+0x79>
    x = xx;
 3d7:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3d9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3e0:	eb bc                	jmp    39e <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3e2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3e7:	89 f0                	mov    %esi,%eax
 3e9:	e8 6d ff ff ff       	call   35b <putc>
  while(--i >= 0)
 3ee:	83 eb 01             	sub    $0x1,%ebx
 3f1:	79 ef                	jns    3e2 <printint+0x6d>
}
 3f3:	83 c4 2c             	add    $0x2c,%esp
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    
 3fb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3fe:	eb ee                	jmp    3ee <printint+0x79>

00000400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 409:	8d 45 10             	lea    0x10(%ebp),%eax
 40c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 40f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 414:	bb 00 00 00 00       	mov    $0x0,%ebx
 419:	eb 14                	jmp    42f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 41b:	89 fa                	mov    %edi,%edx
 41d:	8b 45 08             	mov    0x8(%ebp),%eax
 420:	e8 36 ff ff ff       	call   35b <putc>
 425:	eb 05                	jmp    42c <printf+0x2c>
      }
    } else if(state == '%'){
 427:	83 fe 25             	cmp    $0x25,%esi
 42a:	74 25                	je     451 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 42c:	83 c3 01             	add    $0x1,%ebx
 42f:	8b 45 0c             	mov    0xc(%ebp),%eax
 432:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 436:	84 c0                	test   %al,%al
 438:	0f 84 20 01 00 00    	je     55e <printf+0x15e>
    c = fmt[i] & 0xff;
 43e:	0f be f8             	movsbl %al,%edi
 441:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 444:	85 f6                	test   %esi,%esi
 446:	75 df                	jne    427 <printf+0x27>
      if(c == '%'){
 448:	83 f8 25             	cmp    $0x25,%eax
 44b:	75 ce                	jne    41b <printf+0x1b>
        state = '%';
 44d:	89 c6                	mov    %eax,%esi
 44f:	eb db                	jmp    42c <printf+0x2c>
      if(c == 'd'){
 451:	83 f8 25             	cmp    $0x25,%eax
 454:	0f 84 cf 00 00 00    	je     529 <printf+0x129>
 45a:	0f 8c dd 00 00 00    	jl     53d <printf+0x13d>
 460:	83 f8 78             	cmp    $0x78,%eax
 463:	0f 8f d4 00 00 00    	jg     53d <printf+0x13d>
 469:	83 f8 63             	cmp    $0x63,%eax
 46c:	0f 8c cb 00 00 00    	jl     53d <printf+0x13d>
 472:	83 e8 63             	sub    $0x63,%eax
 475:	83 f8 15             	cmp    $0x15,%eax
 478:	0f 87 bf 00 00 00    	ja     53d <printf+0x13d>
 47e:	ff 24 85 e4 06 00 00 	jmp    *0x6e4(,%eax,4)
        printint(fd, *ap, 10, 1);
 485:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 488:	8b 17                	mov    (%edi),%edx
 48a:	83 ec 0c             	sub    $0xc,%esp
 48d:	6a 01                	push   $0x1
 48f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 494:	8b 45 08             	mov    0x8(%ebp),%eax
 497:	e8 d9 fe ff ff       	call   375 <printint>
        ap++;
 49c:	83 c7 04             	add    $0x4,%edi
 49f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a2:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4a5:	be 00 00 00 00       	mov    $0x0,%esi
 4aa:	eb 80                	jmp    42c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4ac:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4af:	8b 17                	mov    (%edi),%edx
 4b1:	83 ec 0c             	sub    $0xc,%esp
 4b4:	6a 00                	push   $0x0
 4b6:	b9 10 00 00 00       	mov    $0x10,%ecx
 4bb:	8b 45 08             	mov    0x8(%ebp),%eax
 4be:	e8 b2 fe ff ff       	call   375 <printint>
        ap++;
 4c3:	83 c7 04             	add    $0x4,%edi
 4c6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4cc:	be 00 00 00 00       	mov    $0x0,%esi
 4d1:	e9 56 ff ff ff       	jmp    42c <printf+0x2c>
        s = (char*)*ap;
 4d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4d9:	8b 30                	mov    (%eax),%esi
        ap++;
 4db:	83 c0 04             	add    $0x4,%eax
 4de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4e1:	85 f6                	test   %esi,%esi
 4e3:	75 15                	jne    4fa <printf+0xfa>
          s = "(null)";
 4e5:	be dd 06 00 00       	mov    $0x6dd,%esi
 4ea:	eb 0e                	jmp    4fa <printf+0xfa>
          putc(fd, *s);
 4ec:	0f be d2             	movsbl %dl,%edx
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
 4f2:	e8 64 fe ff ff       	call   35b <putc>
          s++;
 4f7:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4fa:	0f b6 16             	movzbl (%esi),%edx
 4fd:	84 d2                	test   %dl,%dl
 4ff:	75 eb                	jne    4ec <printf+0xec>
      state = 0;
 501:	be 00 00 00 00       	mov    $0x0,%esi
 506:	e9 21 ff ff ff       	jmp    42c <printf+0x2c>
        putc(fd, *ap);
 50b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 50e:	0f be 17             	movsbl (%edi),%edx
 511:	8b 45 08             	mov    0x8(%ebp),%eax
 514:	e8 42 fe ff ff       	call   35b <putc>
        ap++;
 519:	83 c7 04             	add    $0x4,%edi
 51c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 51f:	be 00 00 00 00       	mov    $0x0,%esi
 524:	e9 03 ff ff ff       	jmp    42c <printf+0x2c>
        putc(fd, c);
 529:	89 fa                	mov    %edi,%edx
 52b:	8b 45 08             	mov    0x8(%ebp),%eax
 52e:	e8 28 fe ff ff       	call   35b <putc>
      state = 0;
 533:	be 00 00 00 00       	mov    $0x0,%esi
 538:	e9 ef fe ff ff       	jmp    42c <printf+0x2c>
        putc(fd, '%');
 53d:	ba 25 00 00 00       	mov    $0x25,%edx
 542:	8b 45 08             	mov    0x8(%ebp),%eax
 545:	e8 11 fe ff ff       	call   35b <putc>
        putc(fd, c);
 54a:	89 fa                	mov    %edi,%edx
 54c:	8b 45 08             	mov    0x8(%ebp),%eax
 54f:	e8 07 fe ff ff       	call   35b <putc>
      state = 0;
 554:	be 00 00 00 00       	mov    $0x0,%esi
 559:	e9 ce fe ff ff       	jmp    42c <printf+0x2c>
    }
  }
}
 55e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 561:	5b                   	pop    %ebx
 562:	5e                   	pop    %esi
 563:	5f                   	pop    %edi
 564:	5d                   	pop    %ebp
 565:	c3                   	ret    

00000566 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 566:	55                   	push   %ebp
 567:	89 e5                	mov    %esp,%ebp
 569:	57                   	push   %edi
 56a:	56                   	push   %esi
 56b:	53                   	push   %ebx
 56c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 56f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 572:	a1 8c 0a 00 00       	mov    0xa8c,%eax
 577:	eb 02                	jmp    57b <free+0x15>
 579:	89 d0                	mov    %edx,%eax
 57b:	39 c8                	cmp    %ecx,%eax
 57d:	73 04                	jae    583 <free+0x1d>
 57f:	39 08                	cmp    %ecx,(%eax)
 581:	77 12                	ja     595 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 583:	8b 10                	mov    (%eax),%edx
 585:	39 c2                	cmp    %eax,%edx
 587:	77 f0                	ja     579 <free+0x13>
 589:	39 c8                	cmp    %ecx,%eax
 58b:	72 08                	jb     595 <free+0x2f>
 58d:	39 ca                	cmp    %ecx,%edx
 58f:	77 04                	ja     595 <free+0x2f>
 591:	89 d0                	mov    %edx,%eax
 593:	eb e6                	jmp    57b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 595:	8b 73 fc             	mov    -0x4(%ebx),%esi
 598:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 59b:	8b 10                	mov    (%eax),%edx
 59d:	39 d7                	cmp    %edx,%edi
 59f:	74 19                	je     5ba <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5a1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5a4:	8b 50 04             	mov    0x4(%eax),%edx
 5a7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5aa:	39 ce                	cmp    %ecx,%esi
 5ac:	74 1b                	je     5c9 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5ae:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5b0:	a3 8c 0a 00 00       	mov    %eax,0xa8c
}
 5b5:	5b                   	pop    %ebx
 5b6:	5e                   	pop    %esi
 5b7:	5f                   	pop    %edi
 5b8:	5d                   	pop    %ebp
 5b9:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5ba:	03 72 04             	add    0x4(%edx),%esi
 5bd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5c0:	8b 10                	mov    (%eax),%edx
 5c2:	8b 12                	mov    (%edx),%edx
 5c4:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5c7:	eb db                	jmp    5a4 <free+0x3e>
    p->s.size += bp->s.size;
 5c9:	03 53 fc             	add    -0x4(%ebx),%edx
 5cc:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5cf:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5d2:	89 10                	mov    %edx,(%eax)
 5d4:	eb da                	jmp    5b0 <free+0x4a>

000005d6 <morecore>:

static Header*
morecore(uint nu)
{
 5d6:	55                   	push   %ebp
 5d7:	89 e5                	mov    %esp,%ebp
 5d9:	53                   	push   %ebx
 5da:	83 ec 04             	sub    $0x4,%esp
 5dd:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5df:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5e4:	77 05                	ja     5eb <morecore+0x15>
    nu = 4096;
 5e6:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5eb:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5f2:	83 ec 0c             	sub    $0xc,%esp
 5f5:	50                   	push   %eax
 5f6:	e8 38 fd ff ff       	call   333 <sbrk>
  if(p == (char*)-1)
 5fb:	83 c4 10             	add    $0x10,%esp
 5fe:	83 f8 ff             	cmp    $0xffffffff,%eax
 601:	74 1c                	je     61f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 603:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 606:	83 c0 08             	add    $0x8,%eax
 609:	83 ec 0c             	sub    $0xc,%esp
 60c:	50                   	push   %eax
 60d:	e8 54 ff ff ff       	call   566 <free>
  return freep;
 612:	a1 8c 0a 00 00       	mov    0xa8c,%eax
 617:	83 c4 10             	add    $0x10,%esp
}
 61a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 61d:	c9                   	leave  
 61e:	c3                   	ret    
    return 0;
 61f:	b8 00 00 00 00       	mov    $0x0,%eax
 624:	eb f4                	jmp    61a <morecore+0x44>

00000626 <malloc>:

void*
malloc(uint nbytes)
{
 626:	55                   	push   %ebp
 627:	89 e5                	mov    %esp,%ebp
 629:	53                   	push   %ebx
 62a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 62d:	8b 45 08             	mov    0x8(%ebp),%eax
 630:	8d 58 07             	lea    0x7(%eax),%ebx
 633:	c1 eb 03             	shr    $0x3,%ebx
 636:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 639:	8b 0d 8c 0a 00 00    	mov    0xa8c,%ecx
 63f:	85 c9                	test   %ecx,%ecx
 641:	74 04                	je     647 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 643:	8b 01                	mov    (%ecx),%eax
 645:	eb 4a                	jmp    691 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 647:	c7 05 8c 0a 00 00 90 	movl   $0xa90,0xa8c
 64e:	0a 00 00 
 651:	c7 05 90 0a 00 00 90 	movl   $0xa90,0xa90
 658:	0a 00 00 
    base.s.size = 0;
 65b:	c7 05 94 0a 00 00 00 	movl   $0x0,0xa94
 662:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 665:	b9 90 0a 00 00       	mov    $0xa90,%ecx
 66a:	eb d7                	jmp    643 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 66c:	74 19                	je     687 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 66e:	29 da                	sub    %ebx,%edx
 670:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 673:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 676:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 679:	89 0d 8c 0a 00 00    	mov    %ecx,0xa8c
      return (void*)(p + 1);
 67f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 682:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 685:	c9                   	leave  
 686:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 687:	8b 10                	mov    (%eax),%edx
 689:	89 11                	mov    %edx,(%ecx)
 68b:	eb ec                	jmp    679 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 68d:	89 c1                	mov    %eax,%ecx
 68f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 691:	8b 50 04             	mov    0x4(%eax),%edx
 694:	39 da                	cmp    %ebx,%edx
 696:	73 d4                	jae    66c <malloc+0x46>
    if(p == freep)
 698:	39 05 8c 0a 00 00    	cmp    %eax,0xa8c
 69e:	75 ed                	jne    68d <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6a0:	89 d8                	mov    %ebx,%eax
 6a2:	e8 2f ff ff ff       	call   5d6 <morecore>
 6a7:	85 c0                	test   %eax,%eax
 6a9:	75 e2                	jne    68d <malloc+0x67>
 6ab:	eb d5                	jmp    682 <malloc+0x5c>
