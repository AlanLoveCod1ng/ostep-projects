
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  16:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1d:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  24:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2a:	68 58 07 00 00       	push   $0x758
  2f:	6a 01                	push   $0x1
  31:	e8 73 04 00 00       	call   4a9 <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 34 01 00 00       	call   180 <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 ee 02 00 00       	call   34c <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 6b 07 00 00       	push   $0x76b
  70:	6a 01                	push   $0x1
  72:	e8 32 04 00 00       	call   4a9 <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 09 03 00 00       	call   394 <open>
  8b:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  8d:	83 c4 10             	add    $0x10,%esp
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 1b                	jmp    b2 <main+0xb2>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  97:	83 ec 04             	sub    $0x4,%esp
  9a:	68 00 02 00 00       	push   $0x200
  9f:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a5:	50                   	push   %eax
  a6:	56                   	push   %esi
  a7:	e8 c8 02 00 00       	call   374 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 bc 02 00 00       	call   37c <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 75 07 00 00       	push   $0x775
  c8:	6a 01                	push   $0x1
  ca:	e8 da 03 00 00       	call   4a9 <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 b7 02 00 00       	call   394 <open>
  dd:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 1b                	jmp    104 <main+0x104>
    read(fd, data, sizeof(data));
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	68 00 02 00 00       	push   $0x200
  f1:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	56                   	push   %esi
  f9:	e8 6e 02 00 00       	call   36c <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 6a 02 00 00       	call   37c <close>

  wait();
 112:	e8 45 02 00 00       	call   35c <wait>

  exit();
 117:	e8 38 02 00 00       	call   354 <exit>

0000011c <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	56                   	push   %esi
 120:	53                   	push   %ebx
 121:	8b 75 08             	mov    0x8(%ebp),%esi
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 127:	89 f0                	mov    %esi,%eax
 129:	89 d1                	mov    %edx,%ecx
 12b:	83 c2 01             	add    $0x1,%edx
 12e:	89 c3                	mov    %eax,%ebx
 130:	83 c0 01             	add    $0x1,%eax
 133:	0f b6 09             	movzbl (%ecx),%ecx
 136:	88 0b                	mov    %cl,(%ebx)
 138:	84 c9                	test   %cl,%cl
 13a:	75 ed                	jne    129 <strcpy+0xd>
    ;
  return os;
}
 13c:	89 f0                	mov    %esi,%eax
 13e:	5b                   	pop    %ebx
 13f:	5e                   	pop    %esi
 140:	5d                   	pop    %ebp
 141:	c3                   	ret    

00000142 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	8b 4d 08             	mov    0x8(%ebp),%ecx
 148:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14b:	eb 06                	jmp    153 <strcmp+0x11>
    p++, q++;
 14d:	83 c1 01             	add    $0x1,%ecx
 150:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 153:	0f b6 01             	movzbl (%ecx),%eax
 156:	84 c0                	test   %al,%al
 158:	74 04                	je     15e <strcmp+0x1c>
 15a:	3a 02                	cmp    (%edx),%al
 15c:	74 ef                	je     14d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 15e:	0f b6 c0             	movzbl %al,%eax
 161:	0f b6 12             	movzbl (%edx),%edx
 164:	29 d0                	sub    %edx,%eax
}
 166:	5d                   	pop    %ebp
 167:	c3                   	ret    

00000168 <strlen>:

uint
strlen(const char *s)
{
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
 16b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 16e:	b8 00 00 00 00       	mov    $0x0,%eax
 173:	eb 03                	jmp    178 <strlen+0x10>
 175:	83 c0 01             	add    $0x1,%eax
 178:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 17c:	75 f7                	jne    175 <strlen+0xd>
    ;
  return n;
}
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	89 d7                	mov    %edx,%edi
 189:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18c:	8b 45 0c             	mov    0xc(%ebp),%eax
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	89 d0                	mov    %edx,%eax
 194:	8b 7d fc             	mov    -0x4(%ebp),%edi
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <strchr>:

char*
strchr(const char *s, char c)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1a3:	eb 03                	jmp    1a8 <strchr+0xf>
 1a5:	83 c0 01             	add    $0x1,%eax
 1a8:	0f b6 10             	movzbl (%eax),%edx
 1ab:	84 d2                	test   %dl,%dl
 1ad:	74 06                	je     1b5 <strchr+0x1c>
    if(*s == c)
 1af:	38 ca                	cmp    %cl,%dl
 1b1:	75 f2                	jne    1a5 <strchr+0xc>
 1b3:	eb 05                	jmp    1ba <strchr+0x21>
      return (char*)s;
  return 0;
 1b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    

000001bc <gets>:

char*
gets(char *buf, int max)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	57                   	push   %edi
 1c0:	56                   	push   %esi
 1c1:	53                   	push   %ebx
 1c2:	83 ec 1c             	sub    $0x1c,%esp
 1c5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c8:	bb 00 00 00 00       	mov    $0x0,%ebx
 1cd:	89 de                	mov    %ebx,%esi
 1cf:	83 c3 01             	add    $0x1,%ebx
 1d2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d5:	7d 2e                	jge    205 <gets+0x49>
    cc = read(0, &c, 1);
 1d7:	83 ec 04             	sub    $0x4,%esp
 1da:	6a 01                	push   $0x1
 1dc:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1df:	50                   	push   %eax
 1e0:	6a 00                	push   $0x0
 1e2:	e8 85 01 00 00       	call   36c <read>
    if(cc < 1)
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	85 c0                	test   %eax,%eax
 1ec:	7e 17                	jle    205 <gets+0x49>
      break;
    buf[i++] = c;
 1ee:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f2:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1f5:	3c 0a                	cmp    $0xa,%al
 1f7:	0f 94 c2             	sete   %dl
 1fa:	3c 0d                	cmp    $0xd,%al
 1fc:	0f 94 c0             	sete   %al
 1ff:	08 c2                	or     %al,%dl
 201:	74 ca                	je     1cd <gets+0x11>
    buf[i++] = c;
 203:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 205:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 209:	89 f8                	mov    %edi,%eax
 20b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20e:	5b                   	pop    %ebx
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <stat>:

int
stat(const char *n, struct stat *st)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	56                   	push   %esi
 217:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 218:	83 ec 08             	sub    $0x8,%esp
 21b:	6a 00                	push   $0x0
 21d:	ff 75 08             	push   0x8(%ebp)
 220:	e8 6f 01 00 00       	call   394 <open>
  if(fd < 0)
 225:	83 c4 10             	add    $0x10,%esp
 228:	85 c0                	test   %eax,%eax
 22a:	78 24                	js     250 <stat+0x3d>
 22c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	push   0xc(%ebp)
 234:	50                   	push   %eax
 235:	e8 72 01 00 00       	call   3ac <fstat>
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	89 1c 24             	mov    %ebx,(%esp)
 23f:	e8 38 01 00 00       	call   37c <close>
  return r;
 244:	83 c4 10             	add    $0x10,%esp
}
 247:	89 f0                	mov    %esi,%eax
 249:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb f0                	jmp    247 <stat+0x34>

00000257 <atoi>:

int
atoi(const char *s)
{
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	53                   	push   %ebx
 25b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 25e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 263:	eb 10                	jmp    275 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 265:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 268:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 26b:	83 c1 01             	add    $0x1,%ecx
 26e:	0f be c0             	movsbl %al,%eax
 271:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	8d 58 d0             	lea    -0x30(%eax),%ebx
 27b:	80 fb 09             	cmp    $0x9,%bl
 27e:	76 e5                	jbe    265 <atoi+0xe>
  return n;
}
 280:	89 d0                	mov    %edx,%eax
 282:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	56                   	push   %esi
 28b:	53                   	push   %ebx
 28c:	8b 75 08             	mov    0x8(%ebp),%esi
 28f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 292:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 295:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 297:	eb 0d                	jmp    2a6 <memmove+0x1f>
    *dst++ = *src++;
 299:	0f b6 01             	movzbl (%ecx),%eax
 29c:	88 02                	mov    %al,(%edx)
 29e:	8d 49 01             	lea    0x1(%ecx),%ecx
 2a1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2a4:	89 d8                	mov    %ebx,%eax
 2a6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2a9:	85 c0                	test   %eax,%eax
 2ab:	7f ec                	jg     299 <memmove+0x12>
  return vdst;
}
 2ad:	89 f0                	mov    %esi,%eax
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    

000002b3 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 2b3:	55                   	push   %ebp
 2b4:	89 e5                	mov    %esp,%ebp
 2b6:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 2b9:	68 00 20 00 00       	push   $0x2000
 2be:	e8 0c 04 00 00       	call   6cf <malloc>
  if((uint)(stack) % PGSIZE != 0){
 2c3:	83 c4 10             	add    $0x10,%esp
 2c6:	a9 ff 0f 00 00       	test   $0xfff,%eax
 2cb:	74 0a                	je     2d7 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 2cd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 2d2:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 2d7:	50                   	push   %eax
 2d8:	ff 75 10             	push   0x10(%ebp)
 2db:	ff 75 0c             	push   0xc(%ebp)
 2de:	ff 75 08             	push   0x8(%ebp)
 2e1:	e8 0e 01 00 00       	call   3f4 <clone>
  return pid;
}
 2e6:	c9                   	leave  
 2e7:	c3                   	ret    

000002e8 <thread_join>:
int
thread_join()
{
 2e8:	55                   	push   %ebp
 2e9:	89 e5                	mov    %esp,%ebp
 2eb:	53                   	push   %ebx
 2ec:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 2ef:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2f2:	50                   	push   %eax
 2f3:	e8 04 01 00 00       	call   3fc <join>
 2f8:	89 c3                	mov    %eax,%ebx
  free(stack);
 2fa:	83 c4 04             	add    $0x4,%esp
 2fd:	ff 75 f4             	push   -0xc(%ebp)
 300:	e8 0a 03 00 00       	call   60f <free>
  return pid;
}
 305:	89 d8                	mov    %ebx,%eax
 307:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 30a:	c9                   	leave  
 30b:	c3                   	ret    

0000030c <lock_init>:
int
lock_init(lock_t * lock){
 30c:	55                   	push   %ebp
 30d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 318:	b8 00 00 00 00       	mov    $0x0,%eax
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret    

0000031f <lock_acquire>:
int
lock_acquire(lock_t * lock){
 31f:	55                   	push   %ebp
 320:	89 e5                	mov    %esp,%ebp
 322:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 325:	b8 01 00 00 00       	mov    $0x1,%eax
 32a:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 32d:	83 f8 01             	cmp    $0x1,%eax
 330:	74 f3                	je     325 <lock_acquire+0x6>
  {

  }
  return 0;
}
 332:	b8 00 00 00 00       	mov    $0x0,%eax
 337:	5d                   	pop    %ebp
 338:	c3                   	ret    

00000339 <lock_release>:
int
lock_release(lock_t * lock){
 339:	55                   	push   %ebp
 33a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 345:	b8 00 00 00 00       	mov    $0x0,%eax
 34a:	5d                   	pop    %ebp
 34b:	c3                   	ret    

0000034c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34c:	b8 01 00 00 00       	mov    $0x1,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <exit>:
SYSCALL(exit)
 354:	b8 02 00 00 00       	mov    $0x2,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <wait>:
SYSCALL(wait)
 35c:	b8 03 00 00 00       	mov    $0x3,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <pipe>:
SYSCALL(pipe)
 364:	b8 04 00 00 00       	mov    $0x4,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <read>:
SYSCALL(read)
 36c:	b8 05 00 00 00       	mov    $0x5,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <write>:
SYSCALL(write)
 374:	b8 10 00 00 00       	mov    $0x10,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <close>:
SYSCALL(close)
 37c:	b8 15 00 00 00       	mov    $0x15,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <kill>:
SYSCALL(kill)
 384:	b8 06 00 00 00       	mov    $0x6,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <exec>:
SYSCALL(exec)
 38c:	b8 07 00 00 00       	mov    $0x7,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <open>:
SYSCALL(open)
 394:	b8 0f 00 00 00       	mov    $0xf,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <mknod>:
SYSCALL(mknod)
 39c:	b8 11 00 00 00       	mov    $0x11,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <unlink>:
SYSCALL(unlink)
 3a4:	b8 12 00 00 00       	mov    $0x12,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <fstat>:
SYSCALL(fstat)
 3ac:	b8 08 00 00 00       	mov    $0x8,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <link>:
SYSCALL(link)
 3b4:	b8 13 00 00 00       	mov    $0x13,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <mkdir>:
SYSCALL(mkdir)
 3bc:	b8 14 00 00 00       	mov    $0x14,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <chdir>:
SYSCALL(chdir)
 3c4:	b8 09 00 00 00       	mov    $0x9,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <dup>:
SYSCALL(dup)
 3cc:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <getpid>:
SYSCALL(getpid)
 3d4:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <sbrk>:
SYSCALL(sbrk)
 3dc:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <sleep>:
SYSCALL(sleep)
 3e4:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <uptime>:
SYSCALL(uptime)
 3ec:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <clone>:
SYSCALL(clone)
 3f4:	b8 16 00 00 00       	mov    $0x16,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <join>:
SYSCALL(join)
 3fc:	b8 17 00 00 00       	mov    $0x17,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	83 ec 1c             	sub    $0x1c,%esp
 40a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 40d:	6a 01                	push   $0x1
 40f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 412:	52                   	push   %edx
 413:	50                   	push   %eax
 414:	e8 5b ff ff ff       	call   374 <write>
}
 419:	83 c4 10             	add    $0x10,%esp
 41c:	c9                   	leave  
 41d:	c3                   	ret    

0000041e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	57                   	push   %edi
 422:	56                   	push   %esi
 423:	53                   	push   %ebx
 424:	83 ec 2c             	sub    $0x2c,%esp
 427:	89 45 d0             	mov    %eax,-0x30(%ebp)
 42a:	89 d0                	mov    %edx,%eax
 42c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 42e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 432:	0f 95 c1             	setne  %cl
 435:	c1 ea 1f             	shr    $0x1f,%edx
 438:	84 d1                	test   %dl,%cl
 43a:	74 44                	je     480 <printint+0x62>
    neg = 1;
    x = -xx;
 43c:	f7 d8                	neg    %eax
 43e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 440:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 447:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 44c:	89 c8                	mov    %ecx,%eax
 44e:	ba 00 00 00 00       	mov    $0x0,%edx
 453:	f7 f6                	div    %esi
 455:	89 df                	mov    %ebx,%edi
 457:	83 c3 01             	add    $0x1,%ebx
 45a:	0f b6 92 dc 07 00 00 	movzbl 0x7dc(%edx),%edx
 461:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 465:	89 ca                	mov    %ecx,%edx
 467:	89 c1                	mov    %eax,%ecx
 469:	39 d6                	cmp    %edx,%esi
 46b:	76 df                	jbe    44c <printint+0x2e>
  if(neg)
 46d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 471:	74 31                	je     4a4 <printint+0x86>
    buf[i++] = '-';
 473:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 478:	8d 5f 02             	lea    0x2(%edi),%ebx
 47b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 47e:	eb 17                	jmp    497 <printint+0x79>
    x = xx;
 480:	89 c1                	mov    %eax,%ecx
  neg = 0;
 482:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 489:	eb bc                	jmp    447 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 48b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 490:	89 f0                	mov    %esi,%eax
 492:	e8 6d ff ff ff       	call   404 <putc>
  while(--i >= 0)
 497:	83 eb 01             	sub    $0x1,%ebx
 49a:	79 ef                	jns    48b <printint+0x6d>
}
 49c:	83 c4 2c             	add    $0x2c,%esp
 49f:	5b                   	pop    %ebx
 4a0:	5e                   	pop    %esi
 4a1:	5f                   	pop    %edi
 4a2:	5d                   	pop    %ebp
 4a3:	c3                   	ret    
 4a4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4a7:	eb ee                	jmp    497 <printint+0x79>

000004a9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	57                   	push   %edi
 4ad:	56                   	push   %esi
 4ae:	53                   	push   %ebx
 4af:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4b2:	8d 45 10             	lea    0x10(%ebp),%eax
 4b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4b8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4bd:	bb 00 00 00 00       	mov    $0x0,%ebx
 4c2:	eb 14                	jmp    4d8 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4c4:	89 fa                	mov    %edi,%edx
 4c6:	8b 45 08             	mov    0x8(%ebp),%eax
 4c9:	e8 36 ff ff ff       	call   404 <putc>
 4ce:	eb 05                	jmp    4d5 <printf+0x2c>
      }
    } else if(state == '%'){
 4d0:	83 fe 25             	cmp    $0x25,%esi
 4d3:	74 25                	je     4fa <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4d5:	83 c3 01             	add    $0x1,%ebx
 4d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4db:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4df:	84 c0                	test   %al,%al
 4e1:	0f 84 20 01 00 00    	je     607 <printf+0x15e>
    c = fmt[i] & 0xff;
 4e7:	0f be f8             	movsbl %al,%edi
 4ea:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4ed:	85 f6                	test   %esi,%esi
 4ef:	75 df                	jne    4d0 <printf+0x27>
      if(c == '%'){
 4f1:	83 f8 25             	cmp    $0x25,%eax
 4f4:	75 ce                	jne    4c4 <printf+0x1b>
        state = '%';
 4f6:	89 c6                	mov    %eax,%esi
 4f8:	eb db                	jmp    4d5 <printf+0x2c>
      if(c == 'd'){
 4fa:	83 f8 25             	cmp    $0x25,%eax
 4fd:	0f 84 cf 00 00 00    	je     5d2 <printf+0x129>
 503:	0f 8c dd 00 00 00    	jl     5e6 <printf+0x13d>
 509:	83 f8 78             	cmp    $0x78,%eax
 50c:	0f 8f d4 00 00 00    	jg     5e6 <printf+0x13d>
 512:	83 f8 63             	cmp    $0x63,%eax
 515:	0f 8c cb 00 00 00    	jl     5e6 <printf+0x13d>
 51b:	83 e8 63             	sub    $0x63,%eax
 51e:	83 f8 15             	cmp    $0x15,%eax
 521:	0f 87 bf 00 00 00    	ja     5e6 <printf+0x13d>
 527:	ff 24 85 84 07 00 00 	jmp    *0x784(,%eax,4)
        printint(fd, *ap, 10, 1);
 52e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 531:	8b 17                	mov    (%edi),%edx
 533:	83 ec 0c             	sub    $0xc,%esp
 536:	6a 01                	push   $0x1
 538:	b9 0a 00 00 00       	mov    $0xa,%ecx
 53d:	8b 45 08             	mov    0x8(%ebp),%eax
 540:	e8 d9 fe ff ff       	call   41e <printint>
        ap++;
 545:	83 c7 04             	add    $0x4,%edi
 548:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 54b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 54e:	be 00 00 00 00       	mov    $0x0,%esi
 553:	eb 80                	jmp    4d5 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 555:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 558:	8b 17                	mov    (%edi),%edx
 55a:	83 ec 0c             	sub    $0xc,%esp
 55d:	6a 00                	push   $0x0
 55f:	b9 10 00 00 00       	mov    $0x10,%ecx
 564:	8b 45 08             	mov    0x8(%ebp),%eax
 567:	e8 b2 fe ff ff       	call   41e <printint>
        ap++;
 56c:	83 c7 04             	add    $0x4,%edi
 56f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 572:	83 c4 10             	add    $0x10,%esp
      state = 0;
 575:	be 00 00 00 00       	mov    $0x0,%esi
 57a:	e9 56 ff ff ff       	jmp    4d5 <printf+0x2c>
        s = (char*)*ap;
 57f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 582:	8b 30                	mov    (%eax),%esi
        ap++;
 584:	83 c0 04             	add    $0x4,%eax
 587:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 58a:	85 f6                	test   %esi,%esi
 58c:	75 15                	jne    5a3 <printf+0xfa>
          s = "(null)";
 58e:	be 7b 07 00 00       	mov    $0x77b,%esi
 593:	eb 0e                	jmp    5a3 <printf+0xfa>
          putc(fd, *s);
 595:	0f be d2             	movsbl %dl,%edx
 598:	8b 45 08             	mov    0x8(%ebp),%eax
 59b:	e8 64 fe ff ff       	call   404 <putc>
          s++;
 5a0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5a3:	0f b6 16             	movzbl (%esi),%edx
 5a6:	84 d2                	test   %dl,%dl
 5a8:	75 eb                	jne    595 <printf+0xec>
      state = 0;
 5aa:	be 00 00 00 00       	mov    $0x0,%esi
 5af:	e9 21 ff ff ff       	jmp    4d5 <printf+0x2c>
        putc(fd, *ap);
 5b4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5b7:	0f be 17             	movsbl (%edi),%edx
 5ba:	8b 45 08             	mov    0x8(%ebp),%eax
 5bd:	e8 42 fe ff ff       	call   404 <putc>
        ap++;
 5c2:	83 c7 04             	add    $0x4,%edi
 5c5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5c8:	be 00 00 00 00       	mov    $0x0,%esi
 5cd:	e9 03 ff ff ff       	jmp    4d5 <printf+0x2c>
        putc(fd, c);
 5d2:	89 fa                	mov    %edi,%edx
 5d4:	8b 45 08             	mov    0x8(%ebp),%eax
 5d7:	e8 28 fe ff ff       	call   404 <putc>
      state = 0;
 5dc:	be 00 00 00 00       	mov    $0x0,%esi
 5e1:	e9 ef fe ff ff       	jmp    4d5 <printf+0x2c>
        putc(fd, '%');
 5e6:	ba 25 00 00 00       	mov    $0x25,%edx
 5eb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ee:	e8 11 fe ff ff       	call   404 <putc>
        putc(fd, c);
 5f3:	89 fa                	mov    %edi,%edx
 5f5:	8b 45 08             	mov    0x8(%ebp),%eax
 5f8:	e8 07 fe ff ff       	call   404 <putc>
      state = 0;
 5fd:	be 00 00 00 00       	mov    $0x0,%esi
 602:	e9 ce fe ff ff       	jmp    4d5 <printf+0x2c>
    }
  }
}
 607:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60a:	5b                   	pop    %ebx
 60b:	5e                   	pop    %esi
 60c:	5f                   	pop    %edi
 60d:	5d                   	pop    %ebp
 60e:	c3                   	ret    

0000060f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 60f:	55                   	push   %ebp
 610:	89 e5                	mov    %esp,%ebp
 612:	57                   	push   %edi
 613:	56                   	push   %esi
 614:	53                   	push   %ebx
 615:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 618:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 61b:	a1 28 0b 00 00       	mov    0xb28,%eax
 620:	eb 02                	jmp    624 <free+0x15>
 622:	89 d0                	mov    %edx,%eax
 624:	39 c8                	cmp    %ecx,%eax
 626:	73 04                	jae    62c <free+0x1d>
 628:	39 08                	cmp    %ecx,(%eax)
 62a:	77 12                	ja     63e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62c:	8b 10                	mov    (%eax),%edx
 62e:	39 c2                	cmp    %eax,%edx
 630:	77 f0                	ja     622 <free+0x13>
 632:	39 c8                	cmp    %ecx,%eax
 634:	72 08                	jb     63e <free+0x2f>
 636:	39 ca                	cmp    %ecx,%edx
 638:	77 04                	ja     63e <free+0x2f>
 63a:	89 d0                	mov    %edx,%eax
 63c:	eb e6                	jmp    624 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 63e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 641:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 644:	8b 10                	mov    (%eax),%edx
 646:	39 d7                	cmp    %edx,%edi
 648:	74 19                	je     663 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 64a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 64d:	8b 50 04             	mov    0x4(%eax),%edx
 650:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 653:	39 ce                	cmp    %ecx,%esi
 655:	74 1b                	je     672 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 657:	89 08                	mov    %ecx,(%eax)
  freep = p;
 659:	a3 28 0b 00 00       	mov    %eax,0xb28
}
 65e:	5b                   	pop    %ebx
 65f:	5e                   	pop    %esi
 660:	5f                   	pop    %edi
 661:	5d                   	pop    %ebp
 662:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 663:	03 72 04             	add    0x4(%edx),%esi
 666:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 669:	8b 10                	mov    (%eax),%edx
 66b:	8b 12                	mov    (%edx),%edx
 66d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 670:	eb db                	jmp    64d <free+0x3e>
    p->s.size += bp->s.size;
 672:	03 53 fc             	add    -0x4(%ebx),%edx
 675:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 678:	8b 53 f8             	mov    -0x8(%ebx),%edx
 67b:	89 10                	mov    %edx,(%eax)
 67d:	eb da                	jmp    659 <free+0x4a>

0000067f <morecore>:

static Header*
morecore(uint nu)
{
 67f:	55                   	push   %ebp
 680:	89 e5                	mov    %esp,%ebp
 682:	53                   	push   %ebx
 683:	83 ec 04             	sub    $0x4,%esp
 686:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 688:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 68d:	77 05                	ja     694 <morecore+0x15>
    nu = 4096;
 68f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 694:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 69b:	83 ec 0c             	sub    $0xc,%esp
 69e:	50                   	push   %eax
 69f:	e8 38 fd ff ff       	call   3dc <sbrk>
  if(p == (char*)-1)
 6a4:	83 c4 10             	add    $0x10,%esp
 6a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6aa:	74 1c                	je     6c8 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6af:	83 c0 08             	add    $0x8,%eax
 6b2:	83 ec 0c             	sub    $0xc,%esp
 6b5:	50                   	push   %eax
 6b6:	e8 54 ff ff ff       	call   60f <free>
  return freep;
 6bb:	a1 28 0b 00 00       	mov    0xb28,%eax
 6c0:	83 c4 10             	add    $0x10,%esp
}
 6c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6c6:	c9                   	leave  
 6c7:	c3                   	ret    
    return 0;
 6c8:	b8 00 00 00 00       	mov    $0x0,%eax
 6cd:	eb f4                	jmp    6c3 <morecore+0x44>

000006cf <malloc>:

void*
malloc(uint nbytes)
{
 6cf:	55                   	push   %ebp
 6d0:	89 e5                	mov    %esp,%ebp
 6d2:	53                   	push   %ebx
 6d3:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d6:	8b 45 08             	mov    0x8(%ebp),%eax
 6d9:	8d 58 07             	lea    0x7(%eax),%ebx
 6dc:	c1 eb 03             	shr    $0x3,%ebx
 6df:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6e2:	8b 0d 28 0b 00 00    	mov    0xb28,%ecx
 6e8:	85 c9                	test   %ecx,%ecx
 6ea:	74 04                	je     6f0 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6ec:	8b 01                	mov    (%ecx),%eax
 6ee:	eb 4a                	jmp    73a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6f0:	c7 05 28 0b 00 00 2c 	movl   $0xb2c,0xb28
 6f7:	0b 00 00 
 6fa:	c7 05 2c 0b 00 00 2c 	movl   $0xb2c,0xb2c
 701:	0b 00 00 
    base.s.size = 0;
 704:	c7 05 30 0b 00 00 00 	movl   $0x0,0xb30
 70b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 70e:	b9 2c 0b 00 00       	mov    $0xb2c,%ecx
 713:	eb d7                	jmp    6ec <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 715:	74 19                	je     730 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 717:	29 da                	sub    %ebx,%edx
 719:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 71c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 71f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 722:	89 0d 28 0b 00 00    	mov    %ecx,0xb28
      return (void*)(p + 1);
 728:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 72b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 72e:	c9                   	leave  
 72f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 730:	8b 10                	mov    (%eax),%edx
 732:	89 11                	mov    %edx,(%ecx)
 734:	eb ec                	jmp    722 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 736:	89 c1                	mov    %eax,%ecx
 738:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 73a:	8b 50 04             	mov    0x4(%eax),%edx
 73d:	39 da                	cmp    %ebx,%edx
 73f:	73 d4                	jae    715 <malloc+0x46>
    if(p == freep)
 741:	39 05 28 0b 00 00    	cmp    %eax,0xb28
 747:	75 ed                	jne    736 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 749:	89 d8                	mov    %ebx,%eax
 74b:	e8 2f ff ff ff       	call   67f <morecore>
 750:	85 c0                	test   %eax,%eax
 752:	75 e2                	jne    736 <malloc+0x67>
 754:	eb d5                	jmp    72b <malloc+0x5c>
