
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 18 07 00 00       	push   $0x718
  19:	e8 37 03 00 00       	call   355 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 5e 03 00 00       	call   38d <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 52 03 00 00       	call   38d <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 18 07 00 00       	push   $0x718
  4c:	e8 0c 03 00 00       	call   35d <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 18 07 00 00       	push   $0x718
  5b:	e8 f5 02 00 00       	call   355 <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 33 07 00 00       	push   $0x733
  6d:	6a 01                	push   $0x1
  6f:	e8 f6 03 00 00       	call   46a <printf>
      exit();
  74:	e8 9c 02 00 00       	call   315 <exit>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 5f 07 00 00       	push   $0x75f
  81:	6a 01                	push   $0x1
  83:	e8 e2 03 00 00       	call   46a <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 8d 02 00 00       	call   31d <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 20 07 00 00       	push   $0x720
  a0:	6a 01                	push   $0x1
  a2:	e8 c3 03 00 00       	call   46a <printf>
    pid = fork();
  a7:	e8 61 02 00 00       	call   30d <fork>
  ac:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
    if(pid == 0){
  b5:	75 d4                	jne    8b <main+0x8b>
      exec("sh", argv);
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 10 0b 00 00       	push   $0xb10
  bf:	68 46 07 00 00       	push   $0x746
  c4:	e8 84 02 00 00       	call   34d <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 49 07 00 00       	push   $0x749
  d1:	6a 01                	push   $0x1
  d3:	e8 92 03 00 00       	call   46a <printf>
      exit();
  d8:	e8 38 02 00 00       	call   315 <exit>

000000dd <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	56                   	push   %esi
  e1:	53                   	push   %ebx
  e2:	8b 75 08             	mov    0x8(%ebp),%esi
  e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e8:	89 f0                	mov    %esi,%eax
  ea:	89 d1                	mov    %edx,%ecx
  ec:	83 c2 01             	add    $0x1,%edx
  ef:	89 c3                	mov    %eax,%ebx
  f1:	83 c0 01             	add    $0x1,%eax
  f4:	0f b6 09             	movzbl (%ecx),%ecx
  f7:	88 0b                	mov    %cl,(%ebx)
  f9:	84 c9                	test   %cl,%cl
  fb:	75 ed                	jne    ea <strcpy+0xd>
    ;
  return os;
}
  fd:	89 f0                	mov    %esi,%eax
  ff:	5b                   	pop    %ebx
 100:	5e                   	pop    %esi
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    

00000103 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	8b 4d 08             	mov    0x8(%ebp),%ecx
 109:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 10c:	eb 06                	jmp    114 <strcmp+0x11>
    p++, q++;
 10e:	83 c1 01             	add    $0x1,%ecx
 111:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 114:	0f b6 01             	movzbl (%ecx),%eax
 117:	84 c0                	test   %al,%al
 119:	74 04                	je     11f <strcmp+0x1c>
 11b:	3a 02                	cmp    (%edx),%al
 11d:	74 ef                	je     10e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 11f:	0f b6 c0             	movzbl %al,%eax
 122:	0f b6 12             	movzbl (%edx),%edx
 125:	29 d0                	sub    %edx,%eax
}
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    

00000129 <strlen>:

uint
strlen(const char *s)
{
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 12f:	b8 00 00 00 00       	mov    $0x0,%eax
 134:	eb 03                	jmp    139 <strlen+0x10>
 136:	83 c0 01             	add    $0x1,%eax
 139:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 13d:	75 f7                	jne    136 <strlen+0xd>
    ;
  return n;
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    

00000141 <memset>:

void*
memset(void *dst, int c, uint n)
{
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
 144:	57                   	push   %edi
 145:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 148:	89 d7                	mov    %edx,%edi
 14a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14d:	8b 45 0c             	mov    0xc(%ebp),%eax
 150:	fc                   	cld    
 151:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 153:	89 d0                	mov    %edx,%eax
 155:	8b 7d fc             	mov    -0x4(%ebp),%edi
 158:	c9                   	leave  
 159:	c3                   	ret    

0000015a <strchr>:

char*
strchr(const char *s, char c)
{
 15a:	55                   	push   %ebp
 15b:	89 e5                	mov    %esp,%ebp
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
 160:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 164:	eb 03                	jmp    169 <strchr+0xf>
 166:	83 c0 01             	add    $0x1,%eax
 169:	0f b6 10             	movzbl (%eax),%edx
 16c:	84 d2                	test   %dl,%dl
 16e:	74 06                	je     176 <strchr+0x1c>
    if(*s == c)
 170:	38 ca                	cmp    %cl,%dl
 172:	75 f2                	jne    166 <strchr+0xc>
 174:	eb 05                	jmp    17b <strchr+0x21>
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	57                   	push   %edi
 181:	56                   	push   %esi
 182:	53                   	push   %ebx
 183:	83 ec 1c             	sub    $0x1c,%esp
 186:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 189:	bb 00 00 00 00       	mov    $0x0,%ebx
 18e:	89 de                	mov    %ebx,%esi
 190:	83 c3 01             	add    $0x1,%ebx
 193:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 196:	7d 2e                	jge    1c6 <gets+0x49>
    cc = read(0, &c, 1);
 198:	83 ec 04             	sub    $0x4,%esp
 19b:	6a 01                	push   $0x1
 19d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	6a 00                	push   $0x0
 1a3:	e8 85 01 00 00       	call   32d <read>
    if(cc < 1)
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	85 c0                	test   %eax,%eax
 1ad:	7e 17                	jle    1c6 <gets+0x49>
      break;
    buf[i++] = c;
 1af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1b6:	3c 0a                	cmp    $0xa,%al
 1b8:	0f 94 c2             	sete   %dl
 1bb:	3c 0d                	cmp    $0xd,%al
 1bd:	0f 94 c0             	sete   %al
 1c0:	08 c2                	or     %al,%dl
 1c2:	74 ca                	je     18e <gets+0x11>
    buf[i++] = c;
 1c4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1c6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1ca:	89 f8                	mov    %edi,%eax
 1cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cf:	5b                   	pop    %ebx
 1d0:	5e                   	pop    %esi
 1d1:	5f                   	pop    %edi
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    

000001d4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	6a 00                	push   $0x0
 1de:	ff 75 08             	push   0x8(%ebp)
 1e1:	e8 6f 01 00 00       	call   355 <open>
  if(fd < 0)
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	85 c0                	test   %eax,%eax
 1eb:	78 24                	js     211 <stat+0x3d>
 1ed:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1ef:	83 ec 08             	sub    $0x8,%esp
 1f2:	ff 75 0c             	push   0xc(%ebp)
 1f5:	50                   	push   %eax
 1f6:	e8 72 01 00 00       	call   36d <fstat>
 1fb:	89 c6                	mov    %eax,%esi
  close(fd);
 1fd:	89 1c 24             	mov    %ebx,(%esp)
 200:	e8 38 01 00 00       	call   33d <close>
  return r;
 205:	83 c4 10             	add    $0x10,%esp
}
 208:	89 f0                	mov    %esi,%eax
 20a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20d:	5b                   	pop    %ebx
 20e:	5e                   	pop    %esi
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
    return -1;
 211:	be ff ff ff ff       	mov    $0xffffffff,%esi
 216:	eb f0                	jmp    208 <stat+0x34>

00000218 <atoi>:

int
atoi(const char *s)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	53                   	push   %ebx
 21c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 21f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 224:	eb 10                	jmp    236 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 226:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 229:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 22c:	83 c1 01             	add    $0x1,%ecx
 22f:	0f be c0             	movsbl %al,%eax
 232:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 236:	0f b6 01             	movzbl (%ecx),%eax
 239:	8d 58 d0             	lea    -0x30(%eax),%ebx
 23c:	80 fb 09             	cmp    $0x9,%bl
 23f:	76 e5                	jbe    226 <atoi+0xe>
  return n;
}
 241:	89 d0                	mov    %edx,%eax
 243:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 246:	c9                   	leave  
 247:	c3                   	ret    

00000248 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	56                   	push   %esi
 24c:	53                   	push   %ebx
 24d:	8b 75 08             	mov    0x8(%ebp),%esi
 250:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 253:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 256:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 258:	eb 0d                	jmp    267 <memmove+0x1f>
    *dst++ = *src++;
 25a:	0f b6 01             	movzbl (%ecx),%eax
 25d:	88 02                	mov    %al,(%edx)
 25f:	8d 49 01             	lea    0x1(%ecx),%ecx
 262:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 265:	89 d8                	mov    %ebx,%eax
 267:	8d 58 ff             	lea    -0x1(%eax),%ebx
 26a:	85 c0                	test   %eax,%eax
 26c:	7f ec                	jg     25a <memmove+0x12>
  return vdst;
}
 26e:	89 f0                	mov    %esi,%eax
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    

00000274 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 27a:	68 00 20 00 00       	push   $0x2000
 27f:	e8 0c 04 00 00       	call   690 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 284:	83 c4 10             	add    $0x10,%esp
 287:	a9 ff 0f 00 00       	test   $0xfff,%eax
 28c:	74 0a                	je     298 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 28e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 293:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 298:	50                   	push   %eax
 299:	ff 75 10             	push   0x10(%ebp)
 29c:	ff 75 0c             	push   0xc(%ebp)
 29f:	ff 75 08             	push   0x8(%ebp)
 2a2:	e8 0e 01 00 00       	call   3b5 <clone>
  return pid;
}
 2a7:	c9                   	leave  
 2a8:	c3                   	ret    

000002a9 <thread_join>:
int
thread_join()
{
 2a9:	55                   	push   %ebp
 2aa:	89 e5                	mov    %esp,%ebp
 2ac:	53                   	push   %ebx
 2ad:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 2b0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2b3:	50                   	push   %eax
 2b4:	e8 04 01 00 00       	call   3bd <join>
 2b9:	89 c3                	mov    %eax,%ebx
  free(stack);
 2bb:	83 c4 04             	add    $0x4,%esp
 2be:	ff 75 f4             	push   -0xc(%ebp)
 2c1:	e8 0a 03 00 00       	call   5d0 <free>
  return pid;
}
 2c6:	89 d8                	mov    %ebx,%eax
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    

000002cd <lock_init>:
int
lock_init(lock_t * lock){
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
 2d3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 2d9:	b8 00 00 00 00       	mov    $0x0,%eax
 2de:	5d                   	pop    %ebp
 2df:	c3                   	ret    

000002e0 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 2e6:	b8 01 00 00 00       	mov    $0x1,%eax
 2eb:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 2ee:	83 f8 01             	cmp    $0x1,%eax
 2f1:	74 f3                	je     2e6 <lock_acquire+0x6>
  {

  }
  return 0;
}
 2f3:	b8 00 00 00 00       	mov    $0x0,%eax
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    

000002fa <lock_release>:
int
lock_release(lock_t * lock){
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2fd:	8b 45 08             	mov    0x8(%ebp),%eax
 300:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 306:	b8 00 00 00 00       	mov    $0x0,%eax
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    

0000030d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 30d:	b8 01 00 00 00       	mov    $0x1,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <exit>:
SYSCALL(exit)
 315:	b8 02 00 00 00       	mov    $0x2,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <wait>:
SYSCALL(wait)
 31d:	b8 03 00 00 00       	mov    $0x3,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <pipe>:
SYSCALL(pipe)
 325:	b8 04 00 00 00       	mov    $0x4,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <read>:
SYSCALL(read)
 32d:	b8 05 00 00 00       	mov    $0x5,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <write>:
SYSCALL(write)
 335:	b8 10 00 00 00       	mov    $0x10,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <close>:
SYSCALL(close)
 33d:	b8 15 00 00 00       	mov    $0x15,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <kill>:
SYSCALL(kill)
 345:	b8 06 00 00 00       	mov    $0x6,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <exec>:
SYSCALL(exec)
 34d:	b8 07 00 00 00       	mov    $0x7,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <open>:
SYSCALL(open)
 355:	b8 0f 00 00 00       	mov    $0xf,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <mknod>:
SYSCALL(mknod)
 35d:	b8 11 00 00 00       	mov    $0x11,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <unlink>:
SYSCALL(unlink)
 365:	b8 12 00 00 00       	mov    $0x12,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <fstat>:
SYSCALL(fstat)
 36d:	b8 08 00 00 00       	mov    $0x8,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <link>:
SYSCALL(link)
 375:	b8 13 00 00 00       	mov    $0x13,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <mkdir>:
SYSCALL(mkdir)
 37d:	b8 14 00 00 00       	mov    $0x14,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <chdir>:
SYSCALL(chdir)
 385:	b8 09 00 00 00       	mov    $0x9,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <dup>:
SYSCALL(dup)
 38d:	b8 0a 00 00 00       	mov    $0xa,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <getpid>:
SYSCALL(getpid)
 395:	b8 0b 00 00 00       	mov    $0xb,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <sbrk>:
SYSCALL(sbrk)
 39d:	b8 0c 00 00 00       	mov    $0xc,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <sleep>:
SYSCALL(sleep)
 3a5:	b8 0d 00 00 00       	mov    $0xd,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <uptime>:
SYSCALL(uptime)
 3ad:	b8 0e 00 00 00       	mov    $0xe,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <clone>:
SYSCALL(clone)
 3b5:	b8 16 00 00 00       	mov    $0x16,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <join>:
SYSCALL(join)
 3bd:	b8 17 00 00 00       	mov    $0x17,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3c5:	55                   	push   %ebp
 3c6:	89 e5                	mov    %esp,%ebp
 3c8:	83 ec 1c             	sub    $0x1c,%esp
 3cb:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3ce:	6a 01                	push   $0x1
 3d0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3d3:	52                   	push   %edx
 3d4:	50                   	push   %eax
 3d5:	e8 5b ff ff ff       	call   335 <write>
}
 3da:	83 c4 10             	add    $0x10,%esp
 3dd:	c9                   	leave  
 3de:	c3                   	ret    

000003df <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3df:	55                   	push   %ebp
 3e0:	89 e5                	mov    %esp,%ebp
 3e2:	57                   	push   %edi
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
 3e5:	83 ec 2c             	sub    $0x2c,%esp
 3e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3eb:	89 d0                	mov    %edx,%eax
 3ed:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3ef:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3f3:	0f 95 c1             	setne  %cl
 3f6:	c1 ea 1f             	shr    $0x1f,%edx
 3f9:	84 d1                	test   %dl,%cl
 3fb:	74 44                	je     441 <printint+0x62>
    neg = 1;
    x = -xx;
 3fd:	f7 d8                	neg    %eax
 3ff:	89 c1                	mov    %eax,%ecx
    neg = 1;
 401:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 408:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 40d:	89 c8                	mov    %ecx,%eax
 40f:	ba 00 00 00 00       	mov    $0x0,%edx
 414:	f7 f6                	div    %esi
 416:	89 df                	mov    %ebx,%edi
 418:	83 c3 01             	add    $0x1,%ebx
 41b:	0f b6 92 c8 07 00 00 	movzbl 0x7c8(%edx),%edx
 422:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 426:	89 ca                	mov    %ecx,%edx
 428:	89 c1                	mov    %eax,%ecx
 42a:	39 d6                	cmp    %edx,%esi
 42c:	76 df                	jbe    40d <printint+0x2e>
  if(neg)
 42e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 432:	74 31                	je     465 <printint+0x86>
    buf[i++] = '-';
 434:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 439:	8d 5f 02             	lea    0x2(%edi),%ebx
 43c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 43f:	eb 17                	jmp    458 <printint+0x79>
    x = xx;
 441:	89 c1                	mov    %eax,%ecx
  neg = 0;
 443:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 44a:	eb bc                	jmp    408 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 44c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 451:	89 f0                	mov    %esi,%eax
 453:	e8 6d ff ff ff       	call   3c5 <putc>
  while(--i >= 0)
 458:	83 eb 01             	sub    $0x1,%ebx
 45b:	79 ef                	jns    44c <printint+0x6d>
}
 45d:	83 c4 2c             	add    $0x2c,%esp
 460:	5b                   	pop    %ebx
 461:	5e                   	pop    %esi
 462:	5f                   	pop    %edi
 463:	5d                   	pop    %ebp
 464:	c3                   	ret    
 465:	8b 75 d0             	mov    -0x30(%ebp),%esi
 468:	eb ee                	jmp    458 <printint+0x79>

0000046a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 46a:	55                   	push   %ebp
 46b:	89 e5                	mov    %esp,%ebp
 46d:	57                   	push   %edi
 46e:	56                   	push   %esi
 46f:	53                   	push   %ebx
 470:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 473:	8d 45 10             	lea    0x10(%ebp),%eax
 476:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 479:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 47e:	bb 00 00 00 00       	mov    $0x0,%ebx
 483:	eb 14                	jmp    499 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 485:	89 fa                	mov    %edi,%edx
 487:	8b 45 08             	mov    0x8(%ebp),%eax
 48a:	e8 36 ff ff ff       	call   3c5 <putc>
 48f:	eb 05                	jmp    496 <printf+0x2c>
      }
    } else if(state == '%'){
 491:	83 fe 25             	cmp    $0x25,%esi
 494:	74 25                	je     4bb <printf+0x51>
  for(i = 0; fmt[i]; i++){
 496:	83 c3 01             	add    $0x1,%ebx
 499:	8b 45 0c             	mov    0xc(%ebp),%eax
 49c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4a0:	84 c0                	test   %al,%al
 4a2:	0f 84 20 01 00 00    	je     5c8 <printf+0x15e>
    c = fmt[i] & 0xff;
 4a8:	0f be f8             	movsbl %al,%edi
 4ab:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4ae:	85 f6                	test   %esi,%esi
 4b0:	75 df                	jne    491 <printf+0x27>
      if(c == '%'){
 4b2:	83 f8 25             	cmp    $0x25,%eax
 4b5:	75 ce                	jne    485 <printf+0x1b>
        state = '%';
 4b7:	89 c6                	mov    %eax,%esi
 4b9:	eb db                	jmp    496 <printf+0x2c>
      if(c == 'd'){
 4bb:	83 f8 25             	cmp    $0x25,%eax
 4be:	0f 84 cf 00 00 00    	je     593 <printf+0x129>
 4c4:	0f 8c dd 00 00 00    	jl     5a7 <printf+0x13d>
 4ca:	83 f8 78             	cmp    $0x78,%eax
 4cd:	0f 8f d4 00 00 00    	jg     5a7 <printf+0x13d>
 4d3:	83 f8 63             	cmp    $0x63,%eax
 4d6:	0f 8c cb 00 00 00    	jl     5a7 <printf+0x13d>
 4dc:	83 e8 63             	sub    $0x63,%eax
 4df:	83 f8 15             	cmp    $0x15,%eax
 4e2:	0f 87 bf 00 00 00    	ja     5a7 <printf+0x13d>
 4e8:	ff 24 85 70 07 00 00 	jmp    *0x770(,%eax,4)
        printint(fd, *ap, 10, 1);
 4ef:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4f2:	8b 17                	mov    (%edi),%edx
 4f4:	83 ec 0c             	sub    $0xc,%esp
 4f7:	6a 01                	push   $0x1
 4f9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4fe:	8b 45 08             	mov    0x8(%ebp),%eax
 501:	e8 d9 fe ff ff       	call   3df <printint>
        ap++;
 506:	83 c7 04             	add    $0x4,%edi
 509:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 50c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 50f:	be 00 00 00 00       	mov    $0x0,%esi
 514:	eb 80                	jmp    496 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 516:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 519:	8b 17                	mov    (%edi),%edx
 51b:	83 ec 0c             	sub    $0xc,%esp
 51e:	6a 00                	push   $0x0
 520:	b9 10 00 00 00       	mov    $0x10,%ecx
 525:	8b 45 08             	mov    0x8(%ebp),%eax
 528:	e8 b2 fe ff ff       	call   3df <printint>
        ap++;
 52d:	83 c7 04             	add    $0x4,%edi
 530:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 533:	83 c4 10             	add    $0x10,%esp
      state = 0;
 536:	be 00 00 00 00       	mov    $0x0,%esi
 53b:	e9 56 ff ff ff       	jmp    496 <printf+0x2c>
        s = (char*)*ap;
 540:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 543:	8b 30                	mov    (%eax),%esi
        ap++;
 545:	83 c0 04             	add    $0x4,%eax
 548:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 54b:	85 f6                	test   %esi,%esi
 54d:	75 15                	jne    564 <printf+0xfa>
          s = "(null)";
 54f:	be 68 07 00 00       	mov    $0x768,%esi
 554:	eb 0e                	jmp    564 <printf+0xfa>
          putc(fd, *s);
 556:	0f be d2             	movsbl %dl,%edx
 559:	8b 45 08             	mov    0x8(%ebp),%eax
 55c:	e8 64 fe ff ff       	call   3c5 <putc>
          s++;
 561:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 564:	0f b6 16             	movzbl (%esi),%edx
 567:	84 d2                	test   %dl,%dl
 569:	75 eb                	jne    556 <printf+0xec>
      state = 0;
 56b:	be 00 00 00 00       	mov    $0x0,%esi
 570:	e9 21 ff ff ff       	jmp    496 <printf+0x2c>
        putc(fd, *ap);
 575:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 578:	0f be 17             	movsbl (%edi),%edx
 57b:	8b 45 08             	mov    0x8(%ebp),%eax
 57e:	e8 42 fe ff ff       	call   3c5 <putc>
        ap++;
 583:	83 c7 04             	add    $0x4,%edi
 586:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 589:	be 00 00 00 00       	mov    $0x0,%esi
 58e:	e9 03 ff ff ff       	jmp    496 <printf+0x2c>
        putc(fd, c);
 593:	89 fa                	mov    %edi,%edx
 595:	8b 45 08             	mov    0x8(%ebp),%eax
 598:	e8 28 fe ff ff       	call   3c5 <putc>
      state = 0;
 59d:	be 00 00 00 00       	mov    $0x0,%esi
 5a2:	e9 ef fe ff ff       	jmp    496 <printf+0x2c>
        putc(fd, '%');
 5a7:	ba 25 00 00 00       	mov    $0x25,%edx
 5ac:	8b 45 08             	mov    0x8(%ebp),%eax
 5af:	e8 11 fe ff ff       	call   3c5 <putc>
        putc(fd, c);
 5b4:	89 fa                	mov    %edi,%edx
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
 5b9:	e8 07 fe ff ff       	call   3c5 <putc>
      state = 0;
 5be:	be 00 00 00 00       	mov    $0x0,%esi
 5c3:	e9 ce fe ff ff       	jmp    496 <printf+0x2c>
    }
  }
}
 5c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cb:	5b                   	pop    %ebx
 5cc:	5e                   	pop    %esi
 5cd:	5f                   	pop    %edi
 5ce:	5d                   	pop    %ebp
 5cf:	c3                   	ret    

000005d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5d9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5dc:	a1 18 0b 00 00       	mov    0xb18,%eax
 5e1:	eb 02                	jmp    5e5 <free+0x15>
 5e3:	89 d0                	mov    %edx,%eax
 5e5:	39 c8                	cmp    %ecx,%eax
 5e7:	73 04                	jae    5ed <free+0x1d>
 5e9:	39 08                	cmp    %ecx,(%eax)
 5eb:	77 12                	ja     5ff <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ed:	8b 10                	mov    (%eax),%edx
 5ef:	39 c2                	cmp    %eax,%edx
 5f1:	77 f0                	ja     5e3 <free+0x13>
 5f3:	39 c8                	cmp    %ecx,%eax
 5f5:	72 08                	jb     5ff <free+0x2f>
 5f7:	39 ca                	cmp    %ecx,%edx
 5f9:	77 04                	ja     5ff <free+0x2f>
 5fb:	89 d0                	mov    %edx,%eax
 5fd:	eb e6                	jmp    5e5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5ff:	8b 73 fc             	mov    -0x4(%ebx),%esi
 602:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 605:	8b 10                	mov    (%eax),%edx
 607:	39 d7                	cmp    %edx,%edi
 609:	74 19                	je     624 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 60b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 60e:	8b 50 04             	mov    0x4(%eax),%edx
 611:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 614:	39 ce                	cmp    %ecx,%esi
 616:	74 1b                	je     633 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 618:	89 08                	mov    %ecx,(%eax)
  freep = p;
 61a:	a3 18 0b 00 00       	mov    %eax,0xb18
}
 61f:	5b                   	pop    %ebx
 620:	5e                   	pop    %esi
 621:	5f                   	pop    %edi
 622:	5d                   	pop    %ebp
 623:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 624:	03 72 04             	add    0x4(%edx),%esi
 627:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 62a:	8b 10                	mov    (%eax),%edx
 62c:	8b 12                	mov    (%edx),%edx
 62e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 631:	eb db                	jmp    60e <free+0x3e>
    p->s.size += bp->s.size;
 633:	03 53 fc             	add    -0x4(%ebx),%edx
 636:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 639:	8b 53 f8             	mov    -0x8(%ebx),%edx
 63c:	89 10                	mov    %edx,(%eax)
 63e:	eb da                	jmp    61a <free+0x4a>

00000640 <morecore>:

static Header*
morecore(uint nu)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	53                   	push   %ebx
 644:	83 ec 04             	sub    $0x4,%esp
 647:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 649:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 64e:	77 05                	ja     655 <morecore+0x15>
    nu = 4096;
 650:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 655:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 65c:	83 ec 0c             	sub    $0xc,%esp
 65f:	50                   	push   %eax
 660:	e8 38 fd ff ff       	call   39d <sbrk>
  if(p == (char*)-1)
 665:	83 c4 10             	add    $0x10,%esp
 668:	83 f8 ff             	cmp    $0xffffffff,%eax
 66b:	74 1c                	je     689 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 66d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 670:	83 c0 08             	add    $0x8,%eax
 673:	83 ec 0c             	sub    $0xc,%esp
 676:	50                   	push   %eax
 677:	e8 54 ff ff ff       	call   5d0 <free>
  return freep;
 67c:	a1 18 0b 00 00       	mov    0xb18,%eax
 681:	83 c4 10             	add    $0x10,%esp
}
 684:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 687:	c9                   	leave  
 688:	c3                   	ret    
    return 0;
 689:	b8 00 00 00 00       	mov    $0x0,%eax
 68e:	eb f4                	jmp    684 <morecore+0x44>

00000690 <malloc>:

void*
malloc(uint nbytes)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	53                   	push   %ebx
 694:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 697:	8b 45 08             	mov    0x8(%ebp),%eax
 69a:	8d 58 07             	lea    0x7(%eax),%ebx
 69d:	c1 eb 03             	shr    $0x3,%ebx
 6a0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6a3:	8b 0d 18 0b 00 00    	mov    0xb18,%ecx
 6a9:	85 c9                	test   %ecx,%ecx
 6ab:	74 04                	je     6b1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6ad:	8b 01                	mov    (%ecx),%eax
 6af:	eb 4a                	jmp    6fb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6b1:	c7 05 18 0b 00 00 1c 	movl   $0xb1c,0xb18
 6b8:	0b 00 00 
 6bb:	c7 05 1c 0b 00 00 1c 	movl   $0xb1c,0xb1c
 6c2:	0b 00 00 
    base.s.size = 0;
 6c5:	c7 05 20 0b 00 00 00 	movl   $0x0,0xb20
 6cc:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6cf:	b9 1c 0b 00 00       	mov    $0xb1c,%ecx
 6d4:	eb d7                	jmp    6ad <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6d6:	74 19                	je     6f1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6d8:	29 da                	sub    %ebx,%edx
 6da:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6dd:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6e0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6e3:	89 0d 18 0b 00 00    	mov    %ecx,0xb18
      return (void*)(p + 1);
 6e9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ef:	c9                   	leave  
 6f0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6f1:	8b 10                	mov    (%eax),%edx
 6f3:	89 11                	mov    %edx,(%ecx)
 6f5:	eb ec                	jmp    6e3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f7:	89 c1                	mov    %eax,%ecx
 6f9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6fb:	8b 50 04             	mov    0x4(%eax),%edx
 6fe:	39 da                	cmp    %ebx,%edx
 700:	73 d4                	jae    6d6 <malloc+0x46>
    if(p == freep)
 702:	39 05 18 0b 00 00    	cmp    %eax,0xb18
 708:	75 ed                	jne    6f7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 70a:	89 d8                	mov    %ebx,%eax
 70c:	e8 2f ff ff ff       	call   640 <morecore>
 711:	85 c0                	test   %eax,%eax
 713:	75 e2                	jne    6f7 <malloc+0x67>
 715:	eb d5                	jmp    6ec <malloc+0x5c>
