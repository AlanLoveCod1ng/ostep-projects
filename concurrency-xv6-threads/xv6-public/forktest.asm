
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 10             	sub    $0x10,%esp
   7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
   a:	53                   	push   %ebx
   b:	e8 25 01 00 00       	call   135 <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 24 03 00 00       	call   341 <write>
}
  1d:	83 c4 10             	add    $0x10,%esp
  20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  23:	c9                   	leave  
  24:	c3                   	ret    

00000025 <forktest>:

void
forktest(void)
{
  25:	55                   	push   %ebp
  26:	89 e5                	mov    %esp,%ebp
  28:	53                   	push   %ebx
  29:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
  2c:	68 18 05 00 00       	push   $0x518
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
  48:	e8 cc 02 00 00       	call   319 <fork>
    if(pid < 0)
  4d:	85 c0                	test   %eax,%eax
  4f:	78 0c                	js     5d <forktest+0x38>
      break;
    if(pid == 0)
  51:	74 05                	je     58 <forktest+0x33>
  for(n=0; n<N; n++){
  53:	83 c3 01             	add    $0x1,%ebx
  56:	eb e8                	jmp    40 <forktest+0x1b>
      exit();
  58:	e8 c4 02 00 00       	call   321 <exit>
  }

  if(n == N){
  5d:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  63:	74 12                	je     77 <forktest+0x52>
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  65:	85 db                	test   %ebx,%ebx
  67:	7e 3b                	jle    a4 <forktest+0x7f>
    if(wait() < 0){
  69:	e8 bb 02 00 00       	call   329 <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
  7f:	68 58 05 00 00       	push   $0x558
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 91 02 00 00       	call   321 <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 23 05 00 00       	push   $0x523
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 7d 02 00 00       	call   321 <exit>
    }
  }

  if(wait() != -1){
  a4:	e8 80 02 00 00       	call   329 <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	68 4a 05 00 00       	push   $0x54a
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 37 05 00 00       	push   $0x537
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 48 02 00 00       	call   321 <exit>

000000d9 <main>:

int
main(void)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
  df:	e8 41 ff ff ff       	call   25 <forktest>
  exit();
  e4:	e8 38 02 00 00       	call   321 <exit>

000000e9 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	56                   	push   %esi
  ed:	53                   	push   %ebx
  ee:	8b 75 08             	mov    0x8(%ebp),%esi
  f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f4:	89 f0                	mov    %esi,%eax
  f6:	89 d1                	mov    %edx,%ecx
  f8:	83 c2 01             	add    $0x1,%edx
  fb:	89 c3                	mov    %eax,%ebx
  fd:	83 c0 01             	add    $0x1,%eax
 100:	0f b6 09             	movzbl (%ecx),%ecx
 103:	88 0b                	mov    %cl,(%ebx)
 105:	84 c9                	test   %cl,%cl
 107:	75 ed                	jne    f6 <strcpy+0xd>
    ;
  return os;
}
 109:	89 f0                	mov    %esi,%eax
 10b:	5b                   	pop    %ebx
 10c:	5e                   	pop    %esi
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    

0000010f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	8b 4d 08             	mov    0x8(%ebp),%ecx
 115:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 118:	eb 06                	jmp    120 <strcmp+0x11>
    p++, q++;
 11a:	83 c1 01             	add    $0x1,%ecx
 11d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 120:	0f b6 01             	movzbl (%ecx),%eax
 123:	84 c0                	test   %al,%al
 125:	74 04                	je     12b <strcmp+0x1c>
 127:	3a 02                	cmp    (%edx),%al
 129:	74 ef                	je     11a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 12b:	0f b6 c0             	movzbl %al,%eax
 12e:	0f b6 12             	movzbl (%edx),%edx
 131:	29 d0                	sub    %edx,%eax
}
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strlen>:

uint
strlen(const char *s)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 13b:	b8 00 00 00 00       	mov    $0x0,%eax
 140:	eb 03                	jmp    145 <strlen+0x10>
 142:	83 c0 01             	add    $0x1,%eax
 145:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 149:	75 f7                	jne    142 <strlen+0xd>
    ;
  return n;
}
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    

0000014d <memset>:

void*
memset(void *dst, int c, uint n)
{
 14d:	55                   	push   %ebp
 14e:	89 e5                	mov    %esp,%ebp
 150:	57                   	push   %edi
 151:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 154:	89 d7                	mov    %edx,%edi
 156:	8b 4d 10             	mov    0x10(%ebp),%ecx
 159:	8b 45 0c             	mov    0xc(%ebp),%eax
 15c:	fc                   	cld    
 15d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 15f:	89 d0                	mov    %edx,%eax
 161:	8b 7d fc             	mov    -0x4(%ebp),%edi
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	8b 45 08             	mov    0x8(%ebp),%eax
 16c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 170:	eb 03                	jmp    175 <strchr+0xf>
 172:	83 c0 01             	add    $0x1,%eax
 175:	0f b6 10             	movzbl (%eax),%edx
 178:	84 d2                	test   %dl,%dl
 17a:	74 06                	je     182 <strchr+0x1c>
    if(*s == c)
 17c:	38 ca                	cmp    %cl,%dl
 17e:	75 f2                	jne    172 <strchr+0xc>
 180:	eb 05                	jmp    187 <strchr+0x21>
      return (char*)s;
  return 0;
 182:	b8 00 00 00 00       	mov    $0x0,%eax
}
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    

00000189 <gets>:

char*
gets(char *buf, int max)
{
 189:	55                   	push   %ebp
 18a:	89 e5                	mov    %esp,%ebp
 18c:	57                   	push   %edi
 18d:	56                   	push   %esi
 18e:	53                   	push   %ebx
 18f:	83 ec 1c             	sub    $0x1c,%esp
 192:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	bb 00 00 00 00       	mov    $0x0,%ebx
 19a:	89 de                	mov    %ebx,%esi
 19c:	83 c3 01             	add    $0x1,%ebx
 19f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1a2:	7d 2e                	jge    1d2 <gets+0x49>
    cc = read(0, &c, 1);
 1a4:	83 ec 04             	sub    $0x4,%esp
 1a7:	6a 01                	push   $0x1
 1a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1ac:	50                   	push   %eax
 1ad:	6a 00                	push   $0x0
 1af:	e8 85 01 00 00       	call   339 <read>
    if(cc < 1)
 1b4:	83 c4 10             	add    $0x10,%esp
 1b7:	85 c0                	test   %eax,%eax
 1b9:	7e 17                	jle    1d2 <gets+0x49>
      break;
    buf[i++] = c;
 1bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	0f 94 c2             	sete   %dl
 1c7:	3c 0d                	cmp    $0xd,%al
 1c9:	0f 94 c0             	sete   %al
 1cc:	08 c2                	or     %al,%dl
 1ce:	74 ca                	je     19a <gets+0x11>
    buf[i++] = c;
 1d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1d6:	89 f8                	mov    %edi,%eax
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    

000001e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 6f 01 00 00       	call   361 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 24                	js     21d <stat+0x3d>
 1f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1fb:	83 ec 08             	sub    $0x8,%esp
 1fe:	ff 75 0c             	push   0xc(%ebp)
 201:	50                   	push   %eax
 202:	e8 72 01 00 00       	call   379 <fstat>
 207:	89 c6                	mov    %eax,%esi
  close(fd);
 209:	89 1c 24             	mov    %ebx,(%esp)
 20c:	e8 38 01 00 00       	call   349 <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	89 f0                	mov    %esi,%eax
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
    return -1;
 21d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 222:	eb f0                	jmp    214 <stat+0x34>

00000224 <atoi>:

int
atoi(const char *s)
{
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 22b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 230:	eb 10                	jmp    242 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 232:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 235:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 238:	83 c1 01             	add    $0x1,%ecx
 23b:	0f be c0             	movsbl %al,%eax
 23e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 242:	0f b6 01             	movzbl (%ecx),%eax
 245:	8d 58 d0             	lea    -0x30(%eax),%ebx
 248:	80 fb 09             	cmp    $0x9,%bl
 24b:	76 e5                	jbe    232 <atoi+0xe>
  return n;
}
 24d:	89 d0                	mov    %edx,%eax
 24f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 252:	c9                   	leave  
 253:	c3                   	ret    

00000254 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	56                   	push   %esi
 258:	53                   	push   %ebx
 259:	8b 75 08             	mov    0x8(%ebp),%esi
 25c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 25f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 262:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 264:	eb 0d                	jmp    273 <memmove+0x1f>
    *dst++ = *src++;
 266:	0f b6 01             	movzbl (%ecx),%eax
 269:	88 02                	mov    %al,(%edx)
 26b:	8d 49 01             	lea    0x1(%ecx),%ecx
 26e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 271:	89 d8                	mov    %ebx,%eax
 273:	8d 58 ff             	lea    -0x1(%eax),%ebx
 276:	85 c0                	test   %eax,%eax
 278:	7f ec                	jg     266 <memmove+0x12>
  return vdst;
}
 27a:	89 f0                	mov    %esi,%eax
 27c:	5b                   	pop    %ebx
 27d:	5e                   	pop    %esi
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 286:	68 00 20 00 00       	push   $0x2000
 28b:	e8 01 02 00 00       	call   491 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 290:	83 c4 10             	add    $0x10,%esp
 293:	a9 ff 0f 00 00       	test   $0xfff,%eax
 298:	74 0a                	je     2a4 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 29a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 29f:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 2a4:	50                   	push   %eax
 2a5:	ff 75 10             	push   0x10(%ebp)
 2a8:	ff 75 0c             	push   0xc(%ebp)
 2ab:	ff 75 08             	push   0x8(%ebp)
 2ae:	e8 0e 01 00 00       	call   3c1 <clone>
  return pid;
}
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    

000002b5 <thread_join>:
int
thread_join()
{
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	53                   	push   %ebx
 2b9:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 2bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2bf:	50                   	push   %eax
 2c0:	e8 04 01 00 00       	call   3c9 <join>
 2c5:	89 c3                	mov    %eax,%ebx
  free(stack);
 2c7:	83 c4 04             	add    $0x4,%esp
 2ca:	ff 75 f4             	push   -0xc(%ebp)
 2cd:	e8 ff 00 00 00       	call   3d1 <free>
  return pid;
}
 2d2:	89 d8                	mov    %ebx,%eax
 2d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <lock_init>:
int
lock_init(lock_t * lock){
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 2e5:	b8 00 00 00 00       	mov    $0x0,%eax
 2ea:	5d                   	pop    %ebp
 2eb:	c3                   	ret    

000002ec <lock_acquire>:
int
lock_acquire(lock_t * lock){
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 2f2:	b8 01 00 00 00       	mov    $0x1,%eax
 2f7:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 2fa:	83 f8 01             	cmp    $0x1,%eax
 2fd:	74 f3                	je     2f2 <lock_acquire+0x6>
  {

  }
  return 0;
}
 2ff:	b8 00 00 00 00       	mov    $0x0,%eax
 304:	5d                   	pop    %ebp
 305:	c3                   	ret    

00000306 <lock_release>:
int
lock_release(lock_t * lock){
 306:	55                   	push   %ebp
 307:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 309:	8b 45 08             	mov    0x8(%ebp),%eax
 30c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 312:	b8 00 00 00 00       	mov    $0x0,%eax
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    

00000319 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 319:	b8 01 00 00 00       	mov    $0x1,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <exit>:
SYSCALL(exit)
 321:	b8 02 00 00 00       	mov    $0x2,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <wait>:
SYSCALL(wait)
 329:	b8 03 00 00 00       	mov    $0x3,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <pipe>:
SYSCALL(pipe)
 331:	b8 04 00 00 00       	mov    $0x4,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <read>:
SYSCALL(read)
 339:	b8 05 00 00 00       	mov    $0x5,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <write>:
SYSCALL(write)
 341:	b8 10 00 00 00       	mov    $0x10,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <close>:
SYSCALL(close)
 349:	b8 15 00 00 00       	mov    $0x15,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <kill>:
SYSCALL(kill)
 351:	b8 06 00 00 00       	mov    $0x6,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <exec>:
SYSCALL(exec)
 359:	b8 07 00 00 00       	mov    $0x7,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <open>:
SYSCALL(open)
 361:	b8 0f 00 00 00       	mov    $0xf,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <mknod>:
SYSCALL(mknod)
 369:	b8 11 00 00 00       	mov    $0x11,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <unlink>:
SYSCALL(unlink)
 371:	b8 12 00 00 00       	mov    $0x12,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <fstat>:
SYSCALL(fstat)
 379:	b8 08 00 00 00       	mov    $0x8,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <link>:
SYSCALL(link)
 381:	b8 13 00 00 00       	mov    $0x13,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <mkdir>:
SYSCALL(mkdir)
 389:	b8 14 00 00 00       	mov    $0x14,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <chdir>:
SYSCALL(chdir)
 391:	b8 09 00 00 00       	mov    $0x9,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <dup>:
SYSCALL(dup)
 399:	b8 0a 00 00 00       	mov    $0xa,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <getpid>:
SYSCALL(getpid)
 3a1:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <sbrk>:
SYSCALL(sbrk)
 3a9:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <sleep>:
SYSCALL(sleep)
 3b1:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <uptime>:
SYSCALL(uptime)
 3b9:	b8 0e 00 00 00       	mov    $0xe,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <clone>:
SYSCALL(clone)
 3c1:	b8 16 00 00 00       	mov    $0x16,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <join>:
SYSCALL(join)
 3c9:	b8 17 00 00 00       	mov    $0x17,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3d1:	55                   	push   %ebp
 3d2:	89 e5                	mov    %esp,%ebp
 3d4:	57                   	push   %edi
 3d5:	56                   	push   %esi
 3d6:	53                   	push   %ebx
 3d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 3da:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3dd:	a1 6c 08 00 00       	mov    0x86c,%eax
 3e2:	eb 02                	jmp    3e6 <free+0x15>
 3e4:	89 d0                	mov    %edx,%eax
 3e6:	39 c8                	cmp    %ecx,%eax
 3e8:	73 04                	jae    3ee <free+0x1d>
 3ea:	39 08                	cmp    %ecx,(%eax)
 3ec:	77 12                	ja     400 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3ee:	8b 10                	mov    (%eax),%edx
 3f0:	39 c2                	cmp    %eax,%edx
 3f2:	77 f0                	ja     3e4 <free+0x13>
 3f4:	39 c8                	cmp    %ecx,%eax
 3f6:	72 08                	jb     400 <free+0x2f>
 3f8:	39 ca                	cmp    %ecx,%edx
 3fa:	77 04                	ja     400 <free+0x2f>
 3fc:	89 d0                	mov    %edx,%eax
 3fe:	eb e6                	jmp    3e6 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 400:	8b 73 fc             	mov    -0x4(%ebx),%esi
 403:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 406:	8b 10                	mov    (%eax),%edx
 408:	39 d7                	cmp    %edx,%edi
 40a:	74 19                	je     425 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 40c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 40f:	8b 50 04             	mov    0x4(%eax),%edx
 412:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 415:	39 ce                	cmp    %ecx,%esi
 417:	74 1b                	je     434 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 419:	89 08                	mov    %ecx,(%eax)
  freep = p;
 41b:	a3 6c 08 00 00       	mov    %eax,0x86c
}
 420:	5b                   	pop    %ebx
 421:	5e                   	pop    %esi
 422:	5f                   	pop    %edi
 423:	5d                   	pop    %ebp
 424:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 425:	03 72 04             	add    0x4(%edx),%esi
 428:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 42b:	8b 10                	mov    (%eax),%edx
 42d:	8b 12                	mov    (%edx),%edx
 42f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 432:	eb db                	jmp    40f <free+0x3e>
    p->s.size += bp->s.size;
 434:	03 53 fc             	add    -0x4(%ebx),%edx
 437:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 43a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 43d:	89 10                	mov    %edx,(%eax)
 43f:	eb da                	jmp    41b <free+0x4a>

00000441 <morecore>:

static Header*
morecore(uint nu)
{
 441:	55                   	push   %ebp
 442:	89 e5                	mov    %esp,%ebp
 444:	53                   	push   %ebx
 445:	83 ec 04             	sub    $0x4,%esp
 448:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 44a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 44f:	77 05                	ja     456 <morecore+0x15>
    nu = 4096;
 451:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 456:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 45d:	83 ec 0c             	sub    $0xc,%esp
 460:	50                   	push   %eax
 461:	e8 43 ff ff ff       	call   3a9 <sbrk>
  if(p == (char*)-1)
 466:	83 c4 10             	add    $0x10,%esp
 469:	83 f8 ff             	cmp    $0xffffffff,%eax
 46c:	74 1c                	je     48a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 46e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 471:	83 c0 08             	add    $0x8,%eax
 474:	83 ec 0c             	sub    $0xc,%esp
 477:	50                   	push   %eax
 478:	e8 54 ff ff ff       	call   3d1 <free>
  return freep;
 47d:	a1 6c 08 00 00       	mov    0x86c,%eax
 482:	83 c4 10             	add    $0x10,%esp
}
 485:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 488:	c9                   	leave  
 489:	c3                   	ret    
    return 0;
 48a:	b8 00 00 00 00       	mov    $0x0,%eax
 48f:	eb f4                	jmp    485 <morecore+0x44>

00000491 <malloc>:

void*
malloc(uint nbytes)
{
 491:	55                   	push   %ebp
 492:	89 e5                	mov    %esp,%ebp
 494:	53                   	push   %ebx
 495:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 498:	8b 45 08             	mov    0x8(%ebp),%eax
 49b:	8d 58 07             	lea    0x7(%eax),%ebx
 49e:	c1 eb 03             	shr    $0x3,%ebx
 4a1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 4a4:	8b 0d 6c 08 00 00    	mov    0x86c,%ecx
 4aa:	85 c9                	test   %ecx,%ecx
 4ac:	74 04                	je     4b2 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4ae:	8b 01                	mov    (%ecx),%eax
 4b0:	eb 4a                	jmp    4fc <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 4b2:	c7 05 6c 08 00 00 70 	movl   $0x870,0x86c
 4b9:	08 00 00 
 4bc:	c7 05 70 08 00 00 70 	movl   $0x870,0x870
 4c3:	08 00 00 
    base.s.size = 0;
 4c6:	c7 05 74 08 00 00 00 	movl   $0x0,0x874
 4cd:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 4d0:	b9 70 08 00 00       	mov    $0x870,%ecx
 4d5:	eb d7                	jmp    4ae <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 4d7:	74 19                	je     4f2 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 4d9:	29 da                	sub    %ebx,%edx
 4db:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 4de:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 4e1:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 4e4:	89 0d 6c 08 00 00    	mov    %ecx,0x86c
      return (void*)(p + 1);
 4ea:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 4ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4f0:	c9                   	leave  
 4f1:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 4f2:	8b 10                	mov    (%eax),%edx
 4f4:	89 11                	mov    %edx,(%ecx)
 4f6:	eb ec                	jmp    4e4 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4f8:	89 c1                	mov    %eax,%ecx
 4fa:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 4fc:	8b 50 04             	mov    0x4(%eax),%edx
 4ff:	39 da                	cmp    %ebx,%edx
 501:	73 d4                	jae    4d7 <malloc+0x46>
    if(p == freep)
 503:	39 05 6c 08 00 00    	cmp    %eax,0x86c
 509:	75 ed                	jne    4f8 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 50b:	89 d8                	mov    %ebx,%eax
 50d:	e8 2f ff ff ff       	call   441 <morecore>
 512:	85 c0                	test   %eax,%eax
 514:	75 e2                	jne    4f8 <malloc+0x67>
 516:	eb d5                	jmp    4ed <malloc+0x5c>
