
_test_7:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   exit(); \
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  11:	e8 dd 03 00 00       	call   3f3 <getpid>
  16:	a3 88 0b 00 00       	mov    %eax,0xb88

   int fork_pid = fork();
  1b:	e8 4b 03 00 00       	call   36b <fork>
   if(fork_pid == 0) {
  20:	85 c0                	test   %eax,%eax
  22:	74 63                	je     87 <main+0x87>
     exit();
   }
   assert(fork_pid > 0);
  24:	7e 66                	jle    8c <main+0x8c>

   void *join_stack;
   int join_pid = join(&join_stack);
  26:	83 ec 0c             	sub    $0xc,%esp
  29:	8d 45 f4             	lea    -0xc(%ebp),%eax
  2c:	50                   	push   %eax
  2d:	e8 e9 03 00 00       	call   41b <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 78 07 00 00       	push   $0x778
  45:	68 81 07 00 00       	push   $0x781
  4a:	6a 01                	push   $0x1
  4c:	e8 77 04 00 00       	call   4c8 <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 b7 07 00 00       	push   $0x7b7
  59:	68 96 07 00 00       	push   $0x796
  5e:	6a 01                	push   $0x1
  60:	e8 63 04 00 00       	call   4c8 <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 aa 07 00 00       	push   $0x7aa
  6d:	6a 01                	push   $0x1
  6f:	e8 54 04 00 00       	call   4c8 <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 88 0b 00 00    	push   0xb88
  7d:	e8 21 03 00 00       	call   3a3 <kill>
  82:	e8 ec 02 00 00       	call   373 <exit>
     exit();
  87:	e8 e7 02 00 00       	call   373 <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 78 07 00 00       	push   $0x778
  93:	68 81 07 00 00       	push   $0x781
  98:	6a 01                	push   $0x1
  9a:	e8 29 04 00 00       	call   4c8 <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 89 07 00 00       	push   $0x789
  a7:	68 96 07 00 00       	push   $0x796
  ac:	6a 01                	push   $0x1
  ae:	e8 15 04 00 00       	call   4c8 <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 aa 07 00 00       	push   $0x7aa
  bb:	6a 01                	push   $0x1
  bd:	e8 06 04 00 00       	call   4c8 <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 88 0b 00 00    	push   0xb88
  cb:	e8 d3 02 00 00       	call   3a3 <kill>
  d0:	e8 9e 02 00 00       	call   373 <exit>

   assert(wait() > 0);
  d5:	e8 a1 02 00 00       	call   37b <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 d1 07 00 00       	push   $0x7d1
  e6:	6a 01                	push   $0x1
  e8:	e8 db 03 00 00       	call   4c8 <printf>
   exit();
  ed:	e8 81 02 00 00       	call   373 <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 78 07 00 00       	push   $0x778
  f9:	68 81 07 00 00       	push   $0x781
  fe:	6a 01                	push   $0x1
 100:	e8 c3 03 00 00       	call   4c8 <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 c6 07 00 00       	push   $0x7c6
 10d:	68 96 07 00 00       	push   $0x796
 112:	6a 01                	push   $0x1
 114:	e8 af 03 00 00       	call   4c8 <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 aa 07 00 00       	push   $0x7aa
 121:	6a 01                	push   $0x1
 123:	e8 a0 03 00 00       	call   4c8 <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 88 0b 00 00    	push   0xb88
 131:	e8 6d 02 00 00       	call   3a3 <kill>
 136:	e8 38 02 00 00       	call   373 <exit>

0000013b <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	56                   	push   %esi
 13f:	53                   	push   %ebx
 140:	8b 75 08             	mov    0x8(%ebp),%esi
 143:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 146:	89 f0                	mov    %esi,%eax
 148:	89 d1                	mov    %edx,%ecx
 14a:	83 c2 01             	add    $0x1,%edx
 14d:	89 c3                	mov    %eax,%ebx
 14f:	83 c0 01             	add    $0x1,%eax
 152:	0f b6 09             	movzbl (%ecx),%ecx
 155:	88 0b                	mov    %cl,(%ebx)
 157:	84 c9                	test   %cl,%cl
 159:	75 ed                	jne    148 <strcpy+0xd>
    ;
  return os;
}
 15b:	89 f0                	mov    %esi,%eax
 15d:	5b                   	pop    %ebx
 15e:	5e                   	pop    %esi
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret    

00000161 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 161:	55                   	push   %ebp
 162:	89 e5                	mov    %esp,%ebp
 164:	8b 4d 08             	mov    0x8(%ebp),%ecx
 167:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 16a:	eb 06                	jmp    172 <strcmp+0x11>
    p++, q++;
 16c:	83 c1 01             	add    $0x1,%ecx
 16f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 172:	0f b6 01             	movzbl (%ecx),%eax
 175:	84 c0                	test   %al,%al
 177:	74 04                	je     17d <strcmp+0x1c>
 179:	3a 02                	cmp    (%edx),%al
 17b:	74 ef                	je     16c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 17d:	0f b6 c0             	movzbl %al,%eax
 180:	0f b6 12             	movzbl (%edx),%edx
 183:	29 d0                	sub    %edx,%eax
}
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    

00000187 <strlen>:

uint
strlen(const char *s)
{
 187:	55                   	push   %ebp
 188:	89 e5                	mov    %esp,%ebp
 18a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 18d:	b8 00 00 00 00       	mov    $0x0,%eax
 192:	eb 03                	jmp    197 <strlen+0x10>
 194:	83 c0 01             	add    $0x1,%eax
 197:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 19b:	75 f7                	jne    194 <strlen+0xd>
    ;
  return n;
}
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    

0000019f <memset>:

void*
memset(void *dst, int c, uint n)
{
 19f:	55                   	push   %ebp
 1a0:	89 e5                	mov    %esp,%ebp
 1a2:	57                   	push   %edi
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a6:	89 d7                	mov    %edx,%edi
 1a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ae:	fc                   	cld    
 1af:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b1:	89 d0                	mov    %edx,%eax
 1b3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b6:	c9                   	leave  
 1b7:	c3                   	ret    

000001b8 <strchr>:

char*
strchr(const char *s, char c)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1c2:	eb 03                	jmp    1c7 <strchr+0xf>
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	0f b6 10             	movzbl (%eax),%edx
 1ca:	84 d2                	test   %dl,%dl
 1cc:	74 06                	je     1d4 <strchr+0x1c>
    if(*s == c)
 1ce:	38 ca                	cmp    %cl,%dl
 1d0:	75 f2                	jne    1c4 <strchr+0xc>
 1d2:	eb 05                	jmp    1d9 <strchr+0x21>
      return (char*)s;
  return 0;
 1d4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    

000001db <gets>:

char*
gets(char *buf, int max)
{
 1db:	55                   	push   %ebp
 1dc:	89 e5                	mov    %esp,%ebp
 1de:	57                   	push   %edi
 1df:	56                   	push   %esi
 1e0:	53                   	push   %ebx
 1e1:	83 ec 1c             	sub    $0x1c,%esp
 1e4:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e7:	bb 00 00 00 00       	mov    $0x0,%ebx
 1ec:	89 de                	mov    %ebx,%esi
 1ee:	83 c3 01             	add    $0x1,%ebx
 1f1:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f4:	7d 2e                	jge    224 <gets+0x49>
    cc = read(0, &c, 1);
 1f6:	83 ec 04             	sub    $0x4,%esp
 1f9:	6a 01                	push   $0x1
 1fb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1fe:	50                   	push   %eax
 1ff:	6a 00                	push   $0x0
 201:	e8 85 01 00 00       	call   38b <read>
    if(cc < 1)
 206:	83 c4 10             	add    $0x10,%esp
 209:	85 c0                	test   %eax,%eax
 20b:	7e 17                	jle    224 <gets+0x49>
      break;
    buf[i++] = c;
 20d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 211:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 214:	3c 0a                	cmp    $0xa,%al
 216:	0f 94 c2             	sete   %dl
 219:	3c 0d                	cmp    $0xd,%al
 21b:	0f 94 c0             	sete   %al
 21e:	08 c2                	or     %al,%dl
 220:	74 ca                	je     1ec <gets+0x11>
    buf[i++] = c;
 222:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 224:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 228:	89 f8                	mov    %edi,%eax
 22a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22d:	5b                   	pop    %ebx
 22e:	5e                   	pop    %esi
 22f:	5f                   	pop    %edi
 230:	5d                   	pop    %ebp
 231:	c3                   	ret    

00000232 <stat>:

int
stat(const char *n, struct stat *st)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	56                   	push   %esi
 236:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 237:	83 ec 08             	sub    $0x8,%esp
 23a:	6a 00                	push   $0x0
 23c:	ff 75 08             	push   0x8(%ebp)
 23f:	e8 6f 01 00 00       	call   3b3 <open>
  if(fd < 0)
 244:	83 c4 10             	add    $0x10,%esp
 247:	85 c0                	test   %eax,%eax
 249:	78 24                	js     26f <stat+0x3d>
 24b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24d:	83 ec 08             	sub    $0x8,%esp
 250:	ff 75 0c             	push   0xc(%ebp)
 253:	50                   	push   %eax
 254:	e8 72 01 00 00       	call   3cb <fstat>
 259:	89 c6                	mov    %eax,%esi
  close(fd);
 25b:	89 1c 24             	mov    %ebx,(%esp)
 25e:	e8 38 01 00 00       	call   39b <close>
  return r;
 263:	83 c4 10             	add    $0x10,%esp
}
 266:	89 f0                	mov    %esi,%eax
 268:	8d 65 f8             	lea    -0x8(%ebp),%esp
 26b:	5b                   	pop    %ebx
 26c:	5e                   	pop    %esi
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    
    return -1;
 26f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 274:	eb f0                	jmp    266 <stat+0x34>

00000276 <atoi>:

int
atoi(const char *s)
{
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	53                   	push   %ebx
 27a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 27d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 282:	eb 10                	jmp    294 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 284:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 287:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 28a:	83 c1 01             	add    $0x1,%ecx
 28d:	0f be c0             	movsbl %al,%eax
 290:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 294:	0f b6 01             	movzbl (%ecx),%eax
 297:	8d 58 d0             	lea    -0x30(%eax),%ebx
 29a:	80 fb 09             	cmp    $0x9,%bl
 29d:	76 e5                	jbe    284 <atoi+0xe>
  return n;
}
 29f:	89 d0                	mov    %edx,%eax
 2a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	56                   	push   %esi
 2aa:	53                   	push   %ebx
 2ab:	8b 75 08             	mov    0x8(%ebp),%esi
 2ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2b4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2b6:	eb 0d                	jmp    2c5 <memmove+0x1f>
    *dst++ = *src++;
 2b8:	0f b6 01             	movzbl (%ecx),%eax
 2bb:	88 02                	mov    %al,(%edx)
 2bd:	8d 49 01             	lea    0x1(%ecx),%ecx
 2c0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2c3:	89 d8                	mov    %ebx,%eax
 2c5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2c8:	85 c0                	test   %eax,%eax
 2ca:	7f ec                	jg     2b8 <memmove+0x12>
  return vdst;
}
 2cc:	89 f0                	mov    %esi,%eax
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5d                   	pop    %ebp
 2d1:	c3                   	ret    

000002d2 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 2d8:	68 00 20 00 00       	push   $0x2000
 2dd:	e8 0c 04 00 00       	call   6ee <malloc>
  if((uint)(stack) % PGSIZE != 0){
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	a9 ff 0f 00 00       	test   $0xfff,%eax
 2ea:	74 0a                	je     2f6 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 2ec:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 2f1:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 2f6:	50                   	push   %eax
 2f7:	ff 75 10             	push   0x10(%ebp)
 2fa:	ff 75 0c             	push   0xc(%ebp)
 2fd:	ff 75 08             	push   0x8(%ebp)
 300:	e8 0e 01 00 00       	call   413 <clone>
  return pid;
}
 305:	c9                   	leave  
 306:	c3                   	ret    

00000307 <thread_join>:
int
thread_join()
{
 307:	55                   	push   %ebp
 308:	89 e5                	mov    %esp,%ebp
 30a:	53                   	push   %ebx
 30b:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 30e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 311:	50                   	push   %eax
 312:	e8 04 01 00 00       	call   41b <join>
 317:	89 c3                	mov    %eax,%ebx
  free(stack);
 319:	83 c4 04             	add    $0x4,%esp
 31c:	ff 75 f4             	push   -0xc(%ebp)
 31f:	e8 0a 03 00 00       	call   62e <free>
  return pid;
}
 324:	89 d8                	mov    %ebx,%eax
 326:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 329:	c9                   	leave  
 32a:	c3                   	ret    

0000032b <lock_init>:
int
lock_init(lock_t * lock){
 32b:	55                   	push   %ebp
 32c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 337:	b8 00 00 00 00       	mov    $0x0,%eax
 33c:	5d                   	pop    %ebp
 33d:	c3                   	ret    

0000033e <lock_acquire>:
int
lock_acquire(lock_t * lock){
 33e:	55                   	push   %ebp
 33f:	89 e5                	mov    %esp,%ebp
 341:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 344:	b8 01 00 00 00       	mov    $0x1,%eax
 349:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 34c:	83 f8 01             	cmp    $0x1,%eax
 34f:	74 f3                	je     344 <lock_acquire+0x6>
  {

  }
  return 0;
}
 351:	b8 00 00 00 00       	mov    $0x0,%eax
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    

00000358 <lock_release>:
int
lock_release(lock_t * lock){
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 35b:	8b 45 08             	mov    0x8(%ebp),%eax
 35e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 364:	b8 00 00 00 00       	mov    $0x0,%eax
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    

0000036b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 36b:	b8 01 00 00 00       	mov    $0x1,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <exit>:
SYSCALL(exit)
 373:	b8 02 00 00 00       	mov    $0x2,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <wait>:
SYSCALL(wait)
 37b:	b8 03 00 00 00       	mov    $0x3,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <pipe>:
SYSCALL(pipe)
 383:	b8 04 00 00 00       	mov    $0x4,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <read>:
SYSCALL(read)
 38b:	b8 05 00 00 00       	mov    $0x5,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <write>:
SYSCALL(write)
 393:	b8 10 00 00 00       	mov    $0x10,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <close>:
SYSCALL(close)
 39b:	b8 15 00 00 00       	mov    $0x15,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <kill>:
SYSCALL(kill)
 3a3:	b8 06 00 00 00       	mov    $0x6,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <exec>:
SYSCALL(exec)
 3ab:	b8 07 00 00 00       	mov    $0x7,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <open>:
SYSCALL(open)
 3b3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <mknod>:
SYSCALL(mknod)
 3bb:	b8 11 00 00 00       	mov    $0x11,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <unlink>:
SYSCALL(unlink)
 3c3:	b8 12 00 00 00       	mov    $0x12,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <fstat>:
SYSCALL(fstat)
 3cb:	b8 08 00 00 00       	mov    $0x8,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <link>:
SYSCALL(link)
 3d3:	b8 13 00 00 00       	mov    $0x13,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <mkdir>:
SYSCALL(mkdir)
 3db:	b8 14 00 00 00       	mov    $0x14,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <chdir>:
SYSCALL(chdir)
 3e3:	b8 09 00 00 00       	mov    $0x9,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <dup>:
SYSCALL(dup)
 3eb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <getpid>:
SYSCALL(getpid)
 3f3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <sbrk>:
SYSCALL(sbrk)
 3fb:	b8 0c 00 00 00       	mov    $0xc,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <sleep>:
SYSCALL(sleep)
 403:	b8 0d 00 00 00       	mov    $0xd,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <uptime>:
SYSCALL(uptime)
 40b:	b8 0e 00 00 00       	mov    $0xe,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <clone>:
SYSCALL(clone)
 413:	b8 16 00 00 00       	mov    $0x16,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <join>:
SYSCALL(join)
 41b:	b8 17 00 00 00       	mov    $0x17,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	83 ec 1c             	sub    $0x1c,%esp
 429:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 42c:	6a 01                	push   $0x1
 42e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 431:	52                   	push   %edx
 432:	50                   	push   %eax
 433:	e8 5b ff ff ff       	call   393 <write>
}
 438:	83 c4 10             	add    $0x10,%esp
 43b:	c9                   	leave  
 43c:	c3                   	ret    

0000043d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	57                   	push   %edi
 441:	56                   	push   %esi
 442:	53                   	push   %ebx
 443:	83 ec 2c             	sub    $0x2c,%esp
 446:	89 45 d0             	mov    %eax,-0x30(%ebp)
 449:	89 d0                	mov    %edx,%eax
 44b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 44d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 451:	0f 95 c1             	setne  %cl
 454:	c1 ea 1f             	shr    $0x1f,%edx
 457:	84 d1                	test   %dl,%cl
 459:	74 44                	je     49f <printint+0x62>
    neg = 1;
    x = -xx;
 45b:	f7 d8                	neg    %eax
 45d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 45f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 466:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 46b:	89 c8                	mov    %ecx,%eax
 46d:	ba 00 00 00 00       	mov    $0x0,%edx
 472:	f7 f6                	div    %esi
 474:	89 df                	mov    %ebx,%edi
 476:	83 c3 01             	add    $0x1,%ebx
 479:	0f b6 92 40 08 00 00 	movzbl 0x840(%edx),%edx
 480:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 484:	89 ca                	mov    %ecx,%edx
 486:	89 c1                	mov    %eax,%ecx
 488:	39 d6                	cmp    %edx,%esi
 48a:	76 df                	jbe    46b <printint+0x2e>
  if(neg)
 48c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 490:	74 31                	je     4c3 <printint+0x86>
    buf[i++] = '-';
 492:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 497:	8d 5f 02             	lea    0x2(%edi),%ebx
 49a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 49d:	eb 17                	jmp    4b6 <printint+0x79>
    x = xx;
 49f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4a1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4a8:	eb bc                	jmp    466 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4aa:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4af:	89 f0                	mov    %esi,%eax
 4b1:	e8 6d ff ff ff       	call   423 <putc>
  while(--i >= 0)
 4b6:	83 eb 01             	sub    $0x1,%ebx
 4b9:	79 ef                	jns    4aa <printint+0x6d>
}
 4bb:	83 c4 2c             	add    $0x2c,%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    
 4c3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4c6:	eb ee                	jmp    4b6 <printint+0x79>

000004c8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4c8:	55                   	push   %ebp
 4c9:	89 e5                	mov    %esp,%ebp
 4cb:	57                   	push   %edi
 4cc:	56                   	push   %esi
 4cd:	53                   	push   %ebx
 4ce:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4d1:	8d 45 10             	lea    0x10(%ebp),%eax
 4d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4d7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4dc:	bb 00 00 00 00       	mov    $0x0,%ebx
 4e1:	eb 14                	jmp    4f7 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4e3:	89 fa                	mov    %edi,%edx
 4e5:	8b 45 08             	mov    0x8(%ebp),%eax
 4e8:	e8 36 ff ff ff       	call   423 <putc>
 4ed:	eb 05                	jmp    4f4 <printf+0x2c>
      }
    } else if(state == '%'){
 4ef:	83 fe 25             	cmp    $0x25,%esi
 4f2:	74 25                	je     519 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4f4:	83 c3 01             	add    $0x1,%ebx
 4f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fa:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4fe:	84 c0                	test   %al,%al
 500:	0f 84 20 01 00 00    	je     626 <printf+0x15e>
    c = fmt[i] & 0xff;
 506:	0f be f8             	movsbl %al,%edi
 509:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 50c:	85 f6                	test   %esi,%esi
 50e:	75 df                	jne    4ef <printf+0x27>
      if(c == '%'){
 510:	83 f8 25             	cmp    $0x25,%eax
 513:	75 ce                	jne    4e3 <printf+0x1b>
        state = '%';
 515:	89 c6                	mov    %eax,%esi
 517:	eb db                	jmp    4f4 <printf+0x2c>
      if(c == 'd'){
 519:	83 f8 25             	cmp    $0x25,%eax
 51c:	0f 84 cf 00 00 00    	je     5f1 <printf+0x129>
 522:	0f 8c dd 00 00 00    	jl     605 <printf+0x13d>
 528:	83 f8 78             	cmp    $0x78,%eax
 52b:	0f 8f d4 00 00 00    	jg     605 <printf+0x13d>
 531:	83 f8 63             	cmp    $0x63,%eax
 534:	0f 8c cb 00 00 00    	jl     605 <printf+0x13d>
 53a:	83 e8 63             	sub    $0x63,%eax
 53d:	83 f8 15             	cmp    $0x15,%eax
 540:	0f 87 bf 00 00 00    	ja     605 <printf+0x13d>
 546:	ff 24 85 e8 07 00 00 	jmp    *0x7e8(,%eax,4)
        printint(fd, *ap, 10, 1);
 54d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 550:	8b 17                	mov    (%edi),%edx
 552:	83 ec 0c             	sub    $0xc,%esp
 555:	6a 01                	push   $0x1
 557:	b9 0a 00 00 00       	mov    $0xa,%ecx
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
 55f:	e8 d9 fe ff ff       	call   43d <printint>
        ap++;
 564:	83 c7 04             	add    $0x4,%edi
 567:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 56a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 56d:	be 00 00 00 00       	mov    $0x0,%esi
 572:	eb 80                	jmp    4f4 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 574:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 577:	8b 17                	mov    (%edi),%edx
 579:	83 ec 0c             	sub    $0xc,%esp
 57c:	6a 00                	push   $0x0
 57e:	b9 10 00 00 00       	mov    $0x10,%ecx
 583:	8b 45 08             	mov    0x8(%ebp),%eax
 586:	e8 b2 fe ff ff       	call   43d <printint>
        ap++;
 58b:	83 c7 04             	add    $0x4,%edi
 58e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 591:	83 c4 10             	add    $0x10,%esp
      state = 0;
 594:	be 00 00 00 00       	mov    $0x0,%esi
 599:	e9 56 ff ff ff       	jmp    4f4 <printf+0x2c>
        s = (char*)*ap;
 59e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a1:	8b 30                	mov    (%eax),%esi
        ap++;
 5a3:	83 c0 04             	add    $0x4,%eax
 5a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5a9:	85 f6                	test   %esi,%esi
 5ab:	75 15                	jne    5c2 <printf+0xfa>
          s = "(null)";
 5ad:	be de 07 00 00       	mov    $0x7de,%esi
 5b2:	eb 0e                	jmp    5c2 <printf+0xfa>
          putc(fd, *s);
 5b4:	0f be d2             	movsbl %dl,%edx
 5b7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ba:	e8 64 fe ff ff       	call   423 <putc>
          s++;
 5bf:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5c2:	0f b6 16             	movzbl (%esi),%edx
 5c5:	84 d2                	test   %dl,%dl
 5c7:	75 eb                	jne    5b4 <printf+0xec>
      state = 0;
 5c9:	be 00 00 00 00       	mov    $0x0,%esi
 5ce:	e9 21 ff ff ff       	jmp    4f4 <printf+0x2c>
        putc(fd, *ap);
 5d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5d6:	0f be 17             	movsbl (%edi),%edx
 5d9:	8b 45 08             	mov    0x8(%ebp),%eax
 5dc:	e8 42 fe ff ff       	call   423 <putc>
        ap++;
 5e1:	83 c7 04             	add    $0x4,%edi
 5e4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5e7:	be 00 00 00 00       	mov    $0x0,%esi
 5ec:	e9 03 ff ff ff       	jmp    4f4 <printf+0x2c>
        putc(fd, c);
 5f1:	89 fa                	mov    %edi,%edx
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	e8 28 fe ff ff       	call   423 <putc>
      state = 0;
 5fb:	be 00 00 00 00       	mov    $0x0,%esi
 600:	e9 ef fe ff ff       	jmp    4f4 <printf+0x2c>
        putc(fd, '%');
 605:	ba 25 00 00 00       	mov    $0x25,%edx
 60a:	8b 45 08             	mov    0x8(%ebp),%eax
 60d:	e8 11 fe ff ff       	call   423 <putc>
        putc(fd, c);
 612:	89 fa                	mov    %edi,%edx
 614:	8b 45 08             	mov    0x8(%ebp),%eax
 617:	e8 07 fe ff ff       	call   423 <putc>
      state = 0;
 61c:	be 00 00 00 00       	mov    $0x0,%esi
 621:	e9 ce fe ff ff       	jmp    4f4 <printf+0x2c>
    }
  }
}
 626:	8d 65 f4             	lea    -0xc(%ebp),%esp
 629:	5b                   	pop    %ebx
 62a:	5e                   	pop    %esi
 62b:	5f                   	pop    %edi
 62c:	5d                   	pop    %ebp
 62d:	c3                   	ret    

0000062e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 62e:	55                   	push   %ebp
 62f:	89 e5                	mov    %esp,%ebp
 631:	57                   	push   %edi
 632:	56                   	push   %esi
 633:	53                   	push   %ebx
 634:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 637:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63a:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 63f:	eb 02                	jmp    643 <free+0x15>
 641:	89 d0                	mov    %edx,%eax
 643:	39 c8                	cmp    %ecx,%eax
 645:	73 04                	jae    64b <free+0x1d>
 647:	39 08                	cmp    %ecx,(%eax)
 649:	77 12                	ja     65d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64b:	8b 10                	mov    (%eax),%edx
 64d:	39 c2                	cmp    %eax,%edx
 64f:	77 f0                	ja     641 <free+0x13>
 651:	39 c8                	cmp    %ecx,%eax
 653:	72 08                	jb     65d <free+0x2f>
 655:	39 ca                	cmp    %ecx,%edx
 657:	77 04                	ja     65d <free+0x2f>
 659:	89 d0                	mov    %edx,%eax
 65b:	eb e6                	jmp    643 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 65d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 660:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 663:	8b 10                	mov    (%eax),%edx
 665:	39 d7                	cmp    %edx,%edi
 667:	74 19                	je     682 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 669:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 66c:	8b 50 04             	mov    0x4(%eax),%edx
 66f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 672:	39 ce                	cmp    %ecx,%esi
 674:	74 1b                	je     691 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 676:	89 08                	mov    %ecx,(%eax)
  freep = p;
 678:	a3 8c 0b 00 00       	mov    %eax,0xb8c
}
 67d:	5b                   	pop    %ebx
 67e:	5e                   	pop    %esi
 67f:	5f                   	pop    %edi
 680:	5d                   	pop    %ebp
 681:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 682:	03 72 04             	add    0x4(%edx),%esi
 685:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 688:	8b 10                	mov    (%eax),%edx
 68a:	8b 12                	mov    (%edx),%edx
 68c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 68f:	eb db                	jmp    66c <free+0x3e>
    p->s.size += bp->s.size;
 691:	03 53 fc             	add    -0x4(%ebx),%edx
 694:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 697:	8b 53 f8             	mov    -0x8(%ebx),%edx
 69a:	89 10                	mov    %edx,(%eax)
 69c:	eb da                	jmp    678 <free+0x4a>

0000069e <morecore>:

static Header*
morecore(uint nu)
{
 69e:	55                   	push   %ebp
 69f:	89 e5                	mov    %esp,%ebp
 6a1:	53                   	push   %ebx
 6a2:	83 ec 04             	sub    $0x4,%esp
 6a5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6a7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6ac:	77 05                	ja     6b3 <morecore+0x15>
    nu = 4096;
 6ae:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6b3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6ba:	83 ec 0c             	sub    $0xc,%esp
 6bd:	50                   	push   %eax
 6be:	e8 38 fd ff ff       	call   3fb <sbrk>
  if(p == (char*)-1)
 6c3:	83 c4 10             	add    $0x10,%esp
 6c6:	83 f8 ff             	cmp    $0xffffffff,%eax
 6c9:	74 1c                	je     6e7 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6cb:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6ce:	83 c0 08             	add    $0x8,%eax
 6d1:	83 ec 0c             	sub    $0xc,%esp
 6d4:	50                   	push   %eax
 6d5:	e8 54 ff ff ff       	call   62e <free>
  return freep;
 6da:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 6df:	83 c4 10             	add    $0x10,%esp
}
 6e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6e5:	c9                   	leave  
 6e6:	c3                   	ret    
    return 0;
 6e7:	b8 00 00 00 00       	mov    $0x0,%eax
 6ec:	eb f4                	jmp    6e2 <morecore+0x44>

000006ee <malloc>:

void*
malloc(uint nbytes)
{
 6ee:	55                   	push   %ebp
 6ef:	89 e5                	mov    %esp,%ebp
 6f1:	53                   	push   %ebx
 6f2:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	8d 58 07             	lea    0x7(%eax),%ebx
 6fb:	c1 eb 03             	shr    $0x3,%ebx
 6fe:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 701:	8b 0d 8c 0b 00 00    	mov    0xb8c,%ecx
 707:	85 c9                	test   %ecx,%ecx
 709:	74 04                	je     70f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 70b:	8b 01                	mov    (%ecx),%eax
 70d:	eb 4a                	jmp    759 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 70f:	c7 05 8c 0b 00 00 90 	movl   $0xb90,0xb8c
 716:	0b 00 00 
 719:	c7 05 90 0b 00 00 90 	movl   $0xb90,0xb90
 720:	0b 00 00 
    base.s.size = 0;
 723:	c7 05 94 0b 00 00 00 	movl   $0x0,0xb94
 72a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 72d:	b9 90 0b 00 00       	mov    $0xb90,%ecx
 732:	eb d7                	jmp    70b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 734:	74 19                	je     74f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 736:	29 da                	sub    %ebx,%edx
 738:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 73b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 73e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 741:	89 0d 8c 0b 00 00    	mov    %ecx,0xb8c
      return (void*)(p + 1);
 747:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 74a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 74d:	c9                   	leave  
 74e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 74f:	8b 10                	mov    (%eax),%edx
 751:	89 11                	mov    %edx,(%ecx)
 753:	eb ec                	jmp    741 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 755:	89 c1                	mov    %eax,%ecx
 757:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 759:	8b 50 04             	mov    0x4(%eax),%edx
 75c:	39 da                	cmp    %ebx,%edx
 75e:	73 d4                	jae    734 <malloc+0x46>
    if(p == freep)
 760:	39 05 8c 0b 00 00    	cmp    %eax,0xb8c
 766:	75 ed                	jne    755 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 768:	89 d8                	mov    %ebx,%eax
 76a:	e8 2f ff ff ff       	call   69e <morecore>
 76f:	85 c0                	test   %eax,%eax
 771:	75 e2                	jne    755 <malloc+0x67>
 773:	eb d5                	jmp    74a <malloc+0x5c>
