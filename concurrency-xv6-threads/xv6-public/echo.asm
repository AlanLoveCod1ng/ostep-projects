
_echo:     file format elf32-i386


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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	eb 1a                	jmp    3a <main+0x3a>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  20:	ba 8e 06 00 00       	mov    $0x68e,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 90 06 00 00       	push   $0x690
  2e:	6a 01                	push   $0x1
  30:	e8 a9 03 00 00       	call   3de <printf>
  35:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba 8c 06 00 00       	mov    $0x68c,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 38 02 00 00       	call   289 <exit>

00000051 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	56                   	push   %esi
  55:	53                   	push   %ebx
  56:	8b 75 08             	mov    0x8(%ebp),%esi
  59:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  5c:	89 f0                	mov    %esi,%eax
  5e:	89 d1                	mov    %edx,%ecx
  60:	83 c2 01             	add    $0x1,%edx
  63:	89 c3                	mov    %eax,%ebx
  65:	83 c0 01             	add    $0x1,%eax
  68:	0f b6 09             	movzbl (%ecx),%ecx
  6b:	88 0b                	mov    %cl,(%ebx)
  6d:	84 c9                	test   %cl,%cl
  6f:	75 ed                	jne    5e <strcpy+0xd>
    ;
  return os;
}
  71:	89 f0                	mov    %esi,%eax
  73:	5b                   	pop    %ebx
  74:	5e                   	pop    %esi
  75:	5d                   	pop    %ebp
  76:	c3                   	ret    

00000077 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  77:	55                   	push   %ebp
  78:	89 e5                	mov    %esp,%ebp
  7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  80:	eb 06                	jmp    88 <strcmp+0x11>
    p++, q++;
  82:	83 c1 01             	add    $0x1,%ecx
  85:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  88:	0f b6 01             	movzbl (%ecx),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 04                	je     93 <strcmp+0x1c>
  8f:	3a 02                	cmp    (%edx),%al
  91:	74 ef                	je     82 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  93:	0f b6 c0             	movzbl %al,%eax
  96:	0f b6 12             	movzbl (%edx),%edx
  99:	29 d0                	sub    %edx,%eax
}
  9b:	5d                   	pop    %ebp
  9c:	c3                   	ret    

0000009d <strlen>:

uint
strlen(const char *s)
{
  9d:	55                   	push   %ebp
  9e:	89 e5                	mov    %esp,%ebp
  a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  a3:	b8 00 00 00 00       	mov    $0x0,%eax
  a8:	eb 03                	jmp    ad <strlen+0x10>
  aa:	83 c0 01             	add    $0x1,%eax
  ad:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  b1:	75 f7                	jne    aa <strlen+0xd>
    ;
  return n;
}
  b3:	5d                   	pop    %ebp
  b4:	c3                   	ret    

000000b5 <memset>:

void*
memset(void *dst, int c, uint n)
{
  b5:	55                   	push   %ebp
  b6:	89 e5                	mov    %esp,%ebp
  b8:	57                   	push   %edi
  b9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  bc:	89 d7                	mov    %edx,%edi
  be:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  c4:	fc                   	cld    
  c5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  c7:	89 d0                	mov    %edx,%eax
  c9:	8b 7d fc             	mov    -0x4(%ebp),%edi
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strchr>:

char*
strchr(const char *s, char c)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	8b 45 08             	mov    0x8(%ebp),%eax
  d4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  d8:	eb 03                	jmp    dd <strchr+0xf>
  da:	83 c0 01             	add    $0x1,%eax
  dd:	0f b6 10             	movzbl (%eax),%edx
  e0:	84 d2                	test   %dl,%dl
  e2:	74 06                	je     ea <strchr+0x1c>
    if(*s == c)
  e4:	38 ca                	cmp    %cl,%dl
  e6:	75 f2                	jne    da <strchr+0xc>
  e8:	eb 05                	jmp    ef <strchr+0x21>
      return (char*)s;
  return 0;
  ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
  ef:	5d                   	pop    %ebp
  f0:	c3                   	ret    

000000f1 <gets>:

char*
gets(char *buf, int max)
{
  f1:	55                   	push   %ebp
  f2:	89 e5                	mov    %esp,%ebp
  f4:	57                   	push   %edi
  f5:	56                   	push   %esi
  f6:	53                   	push   %ebx
  f7:	83 ec 1c             	sub    $0x1c,%esp
  fa:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 102:	89 de                	mov    %ebx,%esi
 104:	83 c3 01             	add    $0x1,%ebx
 107:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 10a:	7d 2e                	jge    13a <gets+0x49>
    cc = read(0, &c, 1);
 10c:	83 ec 04             	sub    $0x4,%esp
 10f:	6a 01                	push   $0x1
 111:	8d 45 e7             	lea    -0x19(%ebp),%eax
 114:	50                   	push   %eax
 115:	6a 00                	push   $0x0
 117:	e8 85 01 00 00       	call   2a1 <read>
    if(cc < 1)
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	7e 17                	jle    13a <gets+0x49>
      break;
    buf[i++] = c;
 123:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 127:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 12a:	3c 0a                	cmp    $0xa,%al
 12c:	0f 94 c2             	sete   %dl
 12f:	3c 0d                	cmp    $0xd,%al
 131:	0f 94 c0             	sete   %al
 134:	08 c2                	or     %al,%dl
 136:	74 ca                	je     102 <gets+0x11>
    buf[i++] = c;
 138:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 13a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 13e:	89 f8                	mov    %edi,%eax
 140:	8d 65 f4             	lea    -0xc(%ebp),%esp
 143:	5b                   	pop    %ebx
 144:	5e                   	pop    %esi
 145:	5f                   	pop    %edi
 146:	5d                   	pop    %ebp
 147:	c3                   	ret    

00000148 <stat>:

int
stat(const char *n, struct stat *st)
{
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	56                   	push   %esi
 14c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 14d:	83 ec 08             	sub    $0x8,%esp
 150:	6a 00                	push   $0x0
 152:	ff 75 08             	push   0x8(%ebp)
 155:	e8 6f 01 00 00       	call   2c9 <open>
  if(fd < 0)
 15a:	83 c4 10             	add    $0x10,%esp
 15d:	85 c0                	test   %eax,%eax
 15f:	78 24                	js     185 <stat+0x3d>
 161:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 163:	83 ec 08             	sub    $0x8,%esp
 166:	ff 75 0c             	push   0xc(%ebp)
 169:	50                   	push   %eax
 16a:	e8 72 01 00 00       	call   2e1 <fstat>
 16f:	89 c6                	mov    %eax,%esi
  close(fd);
 171:	89 1c 24             	mov    %ebx,(%esp)
 174:	e8 38 01 00 00       	call   2b1 <close>
  return r;
 179:	83 c4 10             	add    $0x10,%esp
}
 17c:	89 f0                	mov    %esi,%eax
 17e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 181:	5b                   	pop    %ebx
 182:	5e                   	pop    %esi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
    return -1;
 185:	be ff ff ff ff       	mov    $0xffffffff,%esi
 18a:	eb f0                	jmp    17c <stat+0x34>

0000018c <atoi>:

int
atoi(const char *s)
{
 18c:	55                   	push   %ebp
 18d:	89 e5                	mov    %esp,%ebp
 18f:	53                   	push   %ebx
 190:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 193:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 198:	eb 10                	jmp    1aa <atoi+0x1e>
    n = n*10 + *s++ - '0';
 19a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 19d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	0f be c0             	movsbl %al,%eax
 1a6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1aa:	0f b6 01             	movzbl (%ecx),%eax
 1ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1b0:	80 fb 09             	cmp    $0x9,%bl
 1b3:	76 e5                	jbe    19a <atoi+0xe>
  return n;
}
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ba:	c9                   	leave  
 1bb:	c3                   	ret    

000001bc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	56                   	push   %esi
 1c0:	53                   	push   %ebx
 1c1:	8b 75 08             	mov    0x8(%ebp),%esi
 1c4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1c7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1ca:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1cc:	eb 0d                	jmp    1db <memmove+0x1f>
    *dst++ = *src++;
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	88 02                	mov    %al,(%edx)
 1d3:	8d 49 01             	lea    0x1(%ecx),%ecx
 1d6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1d9:	89 d8                	mov    %ebx,%eax
 1db:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1de:	85 c0                	test   %eax,%eax
 1e0:	7f ec                	jg     1ce <memmove+0x12>
  return vdst;
}
 1e2:	89 f0                	mov    %esi,%eax
 1e4:	5b                   	pop    %ebx
 1e5:	5e                   	pop    %esi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    

000001e8 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 1ee:	68 00 20 00 00       	push   $0x2000
 1f3:	e8 0c 04 00 00       	call   604 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 1f8:	83 c4 10             	add    $0x10,%esp
 1fb:	a9 ff 0f 00 00       	test   $0xfff,%eax
 200:	74 0a                	je     20c <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 202:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 207:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 20c:	50                   	push   %eax
 20d:	ff 75 10             	push   0x10(%ebp)
 210:	ff 75 0c             	push   0xc(%ebp)
 213:	ff 75 08             	push   0x8(%ebp)
 216:	e8 0e 01 00 00       	call   329 <clone>
  return pid;
}
 21b:	c9                   	leave  
 21c:	c3                   	ret    

0000021d <thread_join>:
int
thread_join()
{
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
 220:	53                   	push   %ebx
 221:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 224:	8d 45 f4             	lea    -0xc(%ebp),%eax
 227:	50                   	push   %eax
 228:	e8 04 01 00 00       	call   331 <join>
 22d:	89 c3                	mov    %eax,%ebx
  free(stack);
 22f:	83 c4 04             	add    $0x4,%esp
 232:	ff 75 f4             	push   -0xc(%ebp)
 235:	e8 0a 03 00 00       	call   544 <free>
  return pid;
}
 23a:	89 d8                	mov    %ebx,%eax
 23c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 23f:	c9                   	leave  
 240:	c3                   	ret    

00000241 <lock_init>:
int
lock_init(lock_t * lock){
 241:	55                   	push   %ebp
 242:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 24d:	b8 00 00 00 00       	mov    $0x0,%eax
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    

00000254 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 25a:	b8 01 00 00 00       	mov    $0x1,%eax
 25f:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 262:	83 f8 01             	cmp    $0x1,%eax
 265:	74 f3                	je     25a <lock_acquire+0x6>
  {

  }
  return 0;
}
 267:	b8 00 00 00 00       	mov    $0x0,%eax
 26c:	5d                   	pop    %ebp
 26d:	c3                   	ret    

0000026e <lock_release>:
int
lock_release(lock_t * lock){
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 27a:	b8 00 00 00 00       	mov    $0x0,%eax
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    

00000281 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 281:	b8 01 00 00 00       	mov    $0x1,%eax
 286:	cd 40                	int    $0x40
 288:	c3                   	ret    

00000289 <exit>:
SYSCALL(exit)
 289:	b8 02 00 00 00       	mov    $0x2,%eax
 28e:	cd 40                	int    $0x40
 290:	c3                   	ret    

00000291 <wait>:
SYSCALL(wait)
 291:	b8 03 00 00 00       	mov    $0x3,%eax
 296:	cd 40                	int    $0x40
 298:	c3                   	ret    

00000299 <pipe>:
SYSCALL(pipe)
 299:	b8 04 00 00 00       	mov    $0x4,%eax
 29e:	cd 40                	int    $0x40
 2a0:	c3                   	ret    

000002a1 <read>:
SYSCALL(read)
 2a1:	b8 05 00 00 00       	mov    $0x5,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <write>:
SYSCALL(write)
 2a9:	b8 10 00 00 00       	mov    $0x10,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <close>:
SYSCALL(close)
 2b1:	b8 15 00 00 00       	mov    $0x15,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <kill>:
SYSCALL(kill)
 2b9:	b8 06 00 00 00       	mov    $0x6,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <exec>:
SYSCALL(exec)
 2c1:	b8 07 00 00 00       	mov    $0x7,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <open>:
SYSCALL(open)
 2c9:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <mknod>:
SYSCALL(mknod)
 2d1:	b8 11 00 00 00       	mov    $0x11,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <unlink>:
SYSCALL(unlink)
 2d9:	b8 12 00 00 00       	mov    $0x12,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <fstat>:
SYSCALL(fstat)
 2e1:	b8 08 00 00 00       	mov    $0x8,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <link>:
SYSCALL(link)
 2e9:	b8 13 00 00 00       	mov    $0x13,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <mkdir>:
SYSCALL(mkdir)
 2f1:	b8 14 00 00 00       	mov    $0x14,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <chdir>:
SYSCALL(chdir)
 2f9:	b8 09 00 00 00       	mov    $0x9,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <dup>:
SYSCALL(dup)
 301:	b8 0a 00 00 00       	mov    $0xa,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <getpid>:
SYSCALL(getpid)
 309:	b8 0b 00 00 00       	mov    $0xb,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <sbrk>:
SYSCALL(sbrk)
 311:	b8 0c 00 00 00       	mov    $0xc,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <sleep>:
SYSCALL(sleep)
 319:	b8 0d 00 00 00       	mov    $0xd,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <uptime>:
SYSCALL(uptime)
 321:	b8 0e 00 00 00       	mov    $0xe,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <clone>:
SYSCALL(clone)
 329:	b8 16 00 00 00       	mov    $0x16,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <join>:
SYSCALL(join)
 331:	b8 17 00 00 00       	mov    $0x17,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 339:	55                   	push   %ebp
 33a:	89 e5                	mov    %esp,%ebp
 33c:	83 ec 1c             	sub    $0x1c,%esp
 33f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 342:	6a 01                	push   $0x1
 344:	8d 55 f4             	lea    -0xc(%ebp),%edx
 347:	52                   	push   %edx
 348:	50                   	push   %eax
 349:	e8 5b ff ff ff       	call   2a9 <write>
}
 34e:	83 c4 10             	add    $0x10,%esp
 351:	c9                   	leave  
 352:	c3                   	ret    

00000353 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	57                   	push   %edi
 357:	56                   	push   %esi
 358:	53                   	push   %ebx
 359:	83 ec 2c             	sub    $0x2c,%esp
 35c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 35f:	89 d0                	mov    %edx,%eax
 361:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 363:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 367:	0f 95 c1             	setne  %cl
 36a:	c1 ea 1f             	shr    $0x1f,%edx
 36d:	84 d1                	test   %dl,%cl
 36f:	74 44                	je     3b5 <printint+0x62>
    neg = 1;
    x = -xx;
 371:	f7 d8                	neg    %eax
 373:	89 c1                	mov    %eax,%ecx
    neg = 1;
 375:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 37c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 381:	89 c8                	mov    %ecx,%eax
 383:	ba 00 00 00 00       	mov    $0x0,%edx
 388:	f7 f6                	div    %esi
 38a:	89 df                	mov    %ebx,%edi
 38c:	83 c3 01             	add    $0x1,%ebx
 38f:	0f b6 92 f4 06 00 00 	movzbl 0x6f4(%edx),%edx
 396:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 39a:	89 ca                	mov    %ecx,%edx
 39c:	89 c1                	mov    %eax,%ecx
 39e:	39 d6                	cmp    %edx,%esi
 3a0:	76 df                	jbe    381 <printint+0x2e>
  if(neg)
 3a2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3a6:	74 31                	je     3d9 <printint+0x86>
    buf[i++] = '-';
 3a8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3ad:	8d 5f 02             	lea    0x2(%edi),%ebx
 3b0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3b3:	eb 17                	jmp    3cc <printint+0x79>
    x = xx;
 3b5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3b7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3be:	eb bc                	jmp    37c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3c0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3c5:	89 f0                	mov    %esi,%eax
 3c7:	e8 6d ff ff ff       	call   339 <putc>
  while(--i >= 0)
 3cc:	83 eb 01             	sub    $0x1,%ebx
 3cf:	79 ef                	jns    3c0 <printint+0x6d>
}
 3d1:	83 c4 2c             	add    $0x2c,%esp
 3d4:	5b                   	pop    %ebx
 3d5:	5e                   	pop    %esi
 3d6:	5f                   	pop    %edi
 3d7:	5d                   	pop    %ebp
 3d8:	c3                   	ret    
 3d9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3dc:	eb ee                	jmp    3cc <printint+0x79>

000003de <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3de:	55                   	push   %ebp
 3df:	89 e5                	mov    %esp,%ebp
 3e1:	57                   	push   %edi
 3e2:	56                   	push   %esi
 3e3:	53                   	push   %ebx
 3e4:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3e7:	8d 45 10             	lea    0x10(%ebp),%eax
 3ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3ed:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3f2:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f7:	eb 14                	jmp    40d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3f9:	89 fa                	mov    %edi,%edx
 3fb:	8b 45 08             	mov    0x8(%ebp),%eax
 3fe:	e8 36 ff ff ff       	call   339 <putc>
 403:	eb 05                	jmp    40a <printf+0x2c>
      }
    } else if(state == '%'){
 405:	83 fe 25             	cmp    $0x25,%esi
 408:	74 25                	je     42f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 40a:	83 c3 01             	add    $0x1,%ebx
 40d:	8b 45 0c             	mov    0xc(%ebp),%eax
 410:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 414:	84 c0                	test   %al,%al
 416:	0f 84 20 01 00 00    	je     53c <printf+0x15e>
    c = fmt[i] & 0xff;
 41c:	0f be f8             	movsbl %al,%edi
 41f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 422:	85 f6                	test   %esi,%esi
 424:	75 df                	jne    405 <printf+0x27>
      if(c == '%'){
 426:	83 f8 25             	cmp    $0x25,%eax
 429:	75 ce                	jne    3f9 <printf+0x1b>
        state = '%';
 42b:	89 c6                	mov    %eax,%esi
 42d:	eb db                	jmp    40a <printf+0x2c>
      if(c == 'd'){
 42f:	83 f8 25             	cmp    $0x25,%eax
 432:	0f 84 cf 00 00 00    	je     507 <printf+0x129>
 438:	0f 8c dd 00 00 00    	jl     51b <printf+0x13d>
 43e:	83 f8 78             	cmp    $0x78,%eax
 441:	0f 8f d4 00 00 00    	jg     51b <printf+0x13d>
 447:	83 f8 63             	cmp    $0x63,%eax
 44a:	0f 8c cb 00 00 00    	jl     51b <printf+0x13d>
 450:	83 e8 63             	sub    $0x63,%eax
 453:	83 f8 15             	cmp    $0x15,%eax
 456:	0f 87 bf 00 00 00    	ja     51b <printf+0x13d>
 45c:	ff 24 85 9c 06 00 00 	jmp    *0x69c(,%eax,4)
        printint(fd, *ap, 10, 1);
 463:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 466:	8b 17                	mov    (%edi),%edx
 468:	83 ec 0c             	sub    $0xc,%esp
 46b:	6a 01                	push   $0x1
 46d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 472:	8b 45 08             	mov    0x8(%ebp),%eax
 475:	e8 d9 fe ff ff       	call   353 <printint>
        ap++;
 47a:	83 c7 04             	add    $0x4,%edi
 47d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 480:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 483:	be 00 00 00 00       	mov    $0x0,%esi
 488:	eb 80                	jmp    40a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 48a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 48d:	8b 17                	mov    (%edi),%edx
 48f:	83 ec 0c             	sub    $0xc,%esp
 492:	6a 00                	push   $0x0
 494:	b9 10 00 00 00       	mov    $0x10,%ecx
 499:	8b 45 08             	mov    0x8(%ebp),%eax
 49c:	e8 b2 fe ff ff       	call   353 <printint>
        ap++;
 4a1:	83 c7 04             	add    $0x4,%edi
 4a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4aa:	be 00 00 00 00       	mov    $0x0,%esi
 4af:	e9 56 ff ff ff       	jmp    40a <printf+0x2c>
        s = (char*)*ap;
 4b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b7:	8b 30                	mov    (%eax),%esi
        ap++;
 4b9:	83 c0 04             	add    $0x4,%eax
 4bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4bf:	85 f6                	test   %esi,%esi
 4c1:	75 15                	jne    4d8 <printf+0xfa>
          s = "(null)";
 4c3:	be 95 06 00 00       	mov    $0x695,%esi
 4c8:	eb 0e                	jmp    4d8 <printf+0xfa>
          putc(fd, *s);
 4ca:	0f be d2             	movsbl %dl,%edx
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
 4d0:	e8 64 fe ff ff       	call   339 <putc>
          s++;
 4d5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4d8:	0f b6 16             	movzbl (%esi),%edx
 4db:	84 d2                	test   %dl,%dl
 4dd:	75 eb                	jne    4ca <printf+0xec>
      state = 0;
 4df:	be 00 00 00 00       	mov    $0x0,%esi
 4e4:	e9 21 ff ff ff       	jmp    40a <printf+0x2c>
        putc(fd, *ap);
 4e9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ec:	0f be 17             	movsbl (%edi),%edx
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
 4f2:	e8 42 fe ff ff       	call   339 <putc>
        ap++;
 4f7:	83 c7 04             	add    $0x4,%edi
 4fa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4fd:	be 00 00 00 00       	mov    $0x0,%esi
 502:	e9 03 ff ff ff       	jmp    40a <printf+0x2c>
        putc(fd, c);
 507:	89 fa                	mov    %edi,%edx
 509:	8b 45 08             	mov    0x8(%ebp),%eax
 50c:	e8 28 fe ff ff       	call   339 <putc>
      state = 0;
 511:	be 00 00 00 00       	mov    $0x0,%esi
 516:	e9 ef fe ff ff       	jmp    40a <printf+0x2c>
        putc(fd, '%');
 51b:	ba 25 00 00 00       	mov    $0x25,%edx
 520:	8b 45 08             	mov    0x8(%ebp),%eax
 523:	e8 11 fe ff ff       	call   339 <putc>
        putc(fd, c);
 528:	89 fa                	mov    %edi,%edx
 52a:	8b 45 08             	mov    0x8(%ebp),%eax
 52d:	e8 07 fe ff ff       	call   339 <putc>
      state = 0;
 532:	be 00 00 00 00       	mov    $0x0,%esi
 537:	e9 ce fe ff ff       	jmp    40a <printf+0x2c>
    }
  }
}
 53c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53f:	5b                   	pop    %ebx
 540:	5e                   	pop    %esi
 541:	5f                   	pop    %edi
 542:	5d                   	pop    %ebp
 543:	c3                   	ret    

00000544 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	57                   	push   %edi
 548:	56                   	push   %esi
 549:	53                   	push   %ebx
 54a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 54d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 550:	a1 44 0a 00 00       	mov    0xa44,%eax
 555:	eb 02                	jmp    559 <free+0x15>
 557:	89 d0                	mov    %edx,%eax
 559:	39 c8                	cmp    %ecx,%eax
 55b:	73 04                	jae    561 <free+0x1d>
 55d:	39 08                	cmp    %ecx,(%eax)
 55f:	77 12                	ja     573 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 561:	8b 10                	mov    (%eax),%edx
 563:	39 c2                	cmp    %eax,%edx
 565:	77 f0                	ja     557 <free+0x13>
 567:	39 c8                	cmp    %ecx,%eax
 569:	72 08                	jb     573 <free+0x2f>
 56b:	39 ca                	cmp    %ecx,%edx
 56d:	77 04                	ja     573 <free+0x2f>
 56f:	89 d0                	mov    %edx,%eax
 571:	eb e6                	jmp    559 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 573:	8b 73 fc             	mov    -0x4(%ebx),%esi
 576:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 579:	8b 10                	mov    (%eax),%edx
 57b:	39 d7                	cmp    %edx,%edi
 57d:	74 19                	je     598 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 57f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 582:	8b 50 04             	mov    0x4(%eax),%edx
 585:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 588:	39 ce                	cmp    %ecx,%esi
 58a:	74 1b                	je     5a7 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 58c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 58e:	a3 44 0a 00 00       	mov    %eax,0xa44
}
 593:	5b                   	pop    %ebx
 594:	5e                   	pop    %esi
 595:	5f                   	pop    %edi
 596:	5d                   	pop    %ebp
 597:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 598:	03 72 04             	add    0x4(%edx),%esi
 59b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 59e:	8b 10                	mov    (%eax),%edx
 5a0:	8b 12                	mov    (%edx),%edx
 5a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5a5:	eb db                	jmp    582 <free+0x3e>
    p->s.size += bp->s.size;
 5a7:	03 53 fc             	add    -0x4(%ebx),%edx
 5aa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5ad:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5b0:	89 10                	mov    %edx,(%eax)
 5b2:	eb da                	jmp    58e <free+0x4a>

000005b4 <morecore>:

static Header*
morecore(uint nu)
{
 5b4:	55                   	push   %ebp
 5b5:	89 e5                	mov    %esp,%ebp
 5b7:	53                   	push   %ebx
 5b8:	83 ec 04             	sub    $0x4,%esp
 5bb:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5bd:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5c2:	77 05                	ja     5c9 <morecore+0x15>
    nu = 4096;
 5c4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5c9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	50                   	push   %eax
 5d4:	e8 38 fd ff ff       	call   311 <sbrk>
  if(p == (char*)-1)
 5d9:	83 c4 10             	add    $0x10,%esp
 5dc:	83 f8 ff             	cmp    $0xffffffff,%eax
 5df:	74 1c                	je     5fd <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5e1:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5e4:	83 c0 08             	add    $0x8,%eax
 5e7:	83 ec 0c             	sub    $0xc,%esp
 5ea:	50                   	push   %eax
 5eb:	e8 54 ff ff ff       	call   544 <free>
  return freep;
 5f0:	a1 44 0a 00 00       	mov    0xa44,%eax
 5f5:	83 c4 10             	add    $0x10,%esp
}
 5f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5fb:	c9                   	leave  
 5fc:	c3                   	ret    
    return 0;
 5fd:	b8 00 00 00 00       	mov    $0x0,%eax
 602:	eb f4                	jmp    5f8 <morecore+0x44>

00000604 <malloc>:

void*
malloc(uint nbytes)
{
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	53                   	push   %ebx
 608:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 60b:	8b 45 08             	mov    0x8(%ebp),%eax
 60e:	8d 58 07             	lea    0x7(%eax),%ebx
 611:	c1 eb 03             	shr    $0x3,%ebx
 614:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 617:	8b 0d 44 0a 00 00    	mov    0xa44,%ecx
 61d:	85 c9                	test   %ecx,%ecx
 61f:	74 04                	je     625 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 621:	8b 01                	mov    (%ecx),%eax
 623:	eb 4a                	jmp    66f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 625:	c7 05 44 0a 00 00 48 	movl   $0xa48,0xa44
 62c:	0a 00 00 
 62f:	c7 05 48 0a 00 00 48 	movl   $0xa48,0xa48
 636:	0a 00 00 
    base.s.size = 0;
 639:	c7 05 4c 0a 00 00 00 	movl   $0x0,0xa4c
 640:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 643:	b9 48 0a 00 00       	mov    $0xa48,%ecx
 648:	eb d7                	jmp    621 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 64a:	74 19                	je     665 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 64c:	29 da                	sub    %ebx,%edx
 64e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 651:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 654:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 657:	89 0d 44 0a 00 00    	mov    %ecx,0xa44
      return (void*)(p + 1);
 65d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 660:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 663:	c9                   	leave  
 664:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 665:	8b 10                	mov    (%eax),%edx
 667:	89 11                	mov    %edx,(%ecx)
 669:	eb ec                	jmp    657 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 66b:	89 c1                	mov    %eax,%ecx
 66d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 66f:	8b 50 04             	mov    0x4(%eax),%edx
 672:	39 da                	cmp    %ebx,%edx
 674:	73 d4                	jae    64a <malloc+0x46>
    if(p == freep)
 676:	39 05 44 0a 00 00    	cmp    %eax,0xa44
 67c:	75 ed                	jne    66b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 67e:	89 d8                	mov    %ebx,%eax
 680:	e8 2f ff ff ff       	call   5b4 <morecore>
 685:	85 c0                	test   %eax,%eax
 687:	75 e2                	jne    66b <malloc+0x67>
 689:	eb d5                	jmp    660 <malloc+0x5c>
