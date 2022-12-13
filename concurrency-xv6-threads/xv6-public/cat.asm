
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 60 0b 00 00       	push   $0xb60
  15:	56                   	push   %esi
  16:	e8 2d 03 00 00       	call   348 <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 60 0b 00 00       	push   $0xb60
  2d:	6a 01                	push   $0x1
  2f:	e8 1c 03 00 00       	call   350 <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 34 07 00 00       	push   $0x734
  43:	6a 01                	push   $0x1
  45:	e8 3b 04 00 00       	call   485 <printf>
      exit();
  4a:	e8 e1 02 00 00       	call   330 <exit>
    }
  }
  if(n < 0){
  4f:	78 07                	js     58 <cat+0x58>
    printf(1, "cat: read error\n");
    exit();
  }
}
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
    printf(1, "cat: read error\n");
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 46 07 00 00       	push   $0x746
  60:	6a 01                	push   $0x1
  62:	e8 1e 04 00 00       	call   485 <printf>
    exit();
  67:	e8 c4 02 00 00       	call   330 <exit>

0000006c <main>:

int
main(int argc, char *argv[])
{
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	push   -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 51 04             	mov    0x4(%ecx),%edx
  88:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  8b:	83 f8 01             	cmp    $0x1,%eax
  8e:	7e 07                	jle    97 <main+0x2b>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  90:	be 01 00 00 00       	mov    $0x1,%esi
  95:	eb 26                	jmp    bd <main+0x51>
    cat(0);
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	6a 00                	push   $0x0
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 8a 02 00 00       	call   330 <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 51 ff ff ff       	call   0 <cat>
    close(fd);
  af:	89 1c 24             	mov    %ebx,(%esp)
  b2:	e8 a1 02 00 00       	call   358 <close>
  for(i = 1; i < argc; i++){
  b7:	83 c6 01             	add    $0x1,%esi
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  c0:	7d 31                	jge    f3 <main+0x87>
    if((fd = open(argv[i], 0)) < 0){
  c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	6a 00                	push   $0x0
  cd:	ff 37                	push   (%edi)
  cf:	e8 9c 02 00 00       	call   370 <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
  e2:	68 57 07 00 00       	push   $0x757
  e7:	6a 01                	push   $0x1
  e9:	e8 97 03 00 00       	call   485 <printf>
      exit();
  ee:	e8 3d 02 00 00       	call   330 <exit>
  }
  exit();
  f3:	e8 38 02 00 00       	call   330 <exit>

000000f8 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	56                   	push   %esi
  fc:	53                   	push   %ebx
  fd:	8b 75 08             	mov    0x8(%ebp),%esi
 100:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 103:	89 f0                	mov    %esi,%eax
 105:	89 d1                	mov    %edx,%ecx
 107:	83 c2 01             	add    $0x1,%edx
 10a:	89 c3                	mov    %eax,%ebx
 10c:	83 c0 01             	add    $0x1,%eax
 10f:	0f b6 09             	movzbl (%ecx),%ecx
 112:	88 0b                	mov    %cl,(%ebx)
 114:	84 c9                	test   %cl,%cl
 116:	75 ed                	jne    105 <strcpy+0xd>
    ;
  return os;
}
 118:	89 f0                	mov    %esi,%eax
 11a:	5b                   	pop    %ebx
 11b:	5e                   	pop    %esi
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    

0000011e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	8b 4d 08             	mov    0x8(%ebp),%ecx
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 127:	eb 06                	jmp    12f <strcmp+0x11>
    p++, q++;
 129:	83 c1 01             	add    $0x1,%ecx
 12c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 12f:	0f b6 01             	movzbl (%ecx),%eax
 132:	84 c0                	test   %al,%al
 134:	74 04                	je     13a <strcmp+0x1c>
 136:	3a 02                	cmp    (%edx),%al
 138:	74 ef                	je     129 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 13a:	0f b6 c0             	movzbl %al,%eax
 13d:	0f b6 12             	movzbl (%edx),%edx
 140:	29 d0                	sub    %edx,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    

00000144 <strlen>:

uint
strlen(const char *s)
{
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 14a:	b8 00 00 00 00       	mov    $0x0,%eax
 14f:	eb 03                	jmp    154 <strlen+0x10>
 151:	83 c0 01             	add    $0x1,%eax
 154:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 158:	75 f7                	jne    151 <strlen+0xd>
    ;
  return n;
}
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    

0000015c <memset>:

void*
memset(void *dst, int c, uint n)
{
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	57                   	push   %edi
 160:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 163:	89 d7                	mov    %edx,%edi
 165:	8b 4d 10             	mov    0x10(%ebp),%ecx
 168:	8b 45 0c             	mov    0xc(%ebp),%eax
 16b:	fc                   	cld    
 16c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 16e:	89 d0                	mov    %edx,%eax
 170:	8b 7d fc             	mov    -0x4(%ebp),%edi
 173:	c9                   	leave  
 174:	c3                   	ret    

00000175 <strchr>:

char*
strchr(const char *s, char c)
{
 175:	55                   	push   %ebp
 176:	89 e5                	mov    %esp,%ebp
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17f:	eb 03                	jmp    184 <strchr+0xf>
 181:	83 c0 01             	add    $0x1,%eax
 184:	0f b6 10             	movzbl (%eax),%edx
 187:	84 d2                	test   %dl,%dl
 189:	74 06                	je     191 <strchr+0x1c>
    if(*s == c)
 18b:	38 ca                	cmp    %cl,%dl
 18d:	75 f2                	jne    181 <strchr+0xc>
 18f:	eb 05                	jmp    196 <strchr+0x21>
      return (char*)s;
  return 0;
 191:	b8 00 00 00 00       	mov    $0x0,%eax
}
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    

00000198 <gets>:

char*
gets(char *buf, int max)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	57                   	push   %edi
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	83 ec 1c             	sub    $0x1c,%esp
 1a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a4:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a9:	89 de                	mov    %ebx,%esi
 1ab:	83 c3 01             	add    $0x1,%ebx
 1ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b1:	7d 2e                	jge    1e1 <gets+0x49>
    cc = read(0, &c, 1);
 1b3:	83 ec 04             	sub    $0x4,%esp
 1b6:	6a 01                	push   $0x1
 1b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1bb:	50                   	push   %eax
 1bc:	6a 00                	push   $0x0
 1be:	e8 85 01 00 00       	call   348 <read>
    if(cc < 1)
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	85 c0                	test   %eax,%eax
 1c8:	7e 17                	jle    1e1 <gets+0x49>
      break;
    buf[i++] = c;
 1ca:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ce:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1d1:	3c 0a                	cmp    $0xa,%al
 1d3:	0f 94 c2             	sete   %dl
 1d6:	3c 0d                	cmp    $0xd,%al
 1d8:	0f 94 c0             	sete   %al
 1db:	08 c2                	or     %al,%dl
 1dd:	74 ca                	je     1a9 <gets+0x11>
    buf[i++] = c;
 1df:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1e1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1e5:	89 f8                	mov    %edi,%eax
 1e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5f                   	pop    %edi
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    

000001ef <stat>:

int
stat(const char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	56                   	push   %esi
 1f3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	6a 00                	push   $0x0
 1f9:	ff 75 08             	push   0x8(%ebp)
 1fc:	e8 6f 01 00 00       	call   370 <open>
  if(fd < 0)
 201:	83 c4 10             	add    $0x10,%esp
 204:	85 c0                	test   %eax,%eax
 206:	78 24                	js     22c <stat+0x3d>
 208:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 20a:	83 ec 08             	sub    $0x8,%esp
 20d:	ff 75 0c             	push   0xc(%ebp)
 210:	50                   	push   %eax
 211:	e8 72 01 00 00       	call   388 <fstat>
 216:	89 c6                	mov    %eax,%esi
  close(fd);
 218:	89 1c 24             	mov    %ebx,(%esp)
 21b:	e8 38 01 00 00       	call   358 <close>
  return r;
 220:	83 c4 10             	add    $0x10,%esp
}
 223:	89 f0                	mov    %esi,%eax
 225:	8d 65 f8             	lea    -0x8(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
    return -1;
 22c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 231:	eb f0                	jmp    223 <stat+0x34>

00000233 <atoi>:

int
atoi(const char *s)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	53                   	push   %ebx
 237:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 23a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 23f:	eb 10                	jmp    251 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 241:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 244:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 247:	83 c1 01             	add    $0x1,%ecx
 24a:	0f be c0             	movsbl %al,%eax
 24d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 251:	0f b6 01             	movzbl (%ecx),%eax
 254:	8d 58 d0             	lea    -0x30(%eax),%ebx
 257:	80 fb 09             	cmp    $0x9,%bl
 25a:	76 e5                	jbe    241 <atoi+0xe>
  return n;
}
 25c:	89 d0                	mov    %edx,%eax
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 26e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 271:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 273:	eb 0d                	jmp    282 <memmove+0x1f>
    *dst++ = *src++;
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	88 02                	mov    %al,(%edx)
 27a:	8d 49 01             	lea    0x1(%ecx),%ecx
 27d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 280:	89 d8                	mov    %ebx,%eax
 282:	8d 58 ff             	lea    -0x1(%eax),%ebx
 285:	85 c0                	test   %eax,%eax
 287:	7f ec                	jg     275 <memmove+0x12>
  return vdst;
}
 289:	89 f0                	mov    %esi,%eax
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    

0000028f <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 295:	68 00 20 00 00       	push   $0x2000
 29a:	e8 0c 04 00 00       	call   6ab <malloc>
  if((uint)(stack) % PGSIZE != 0){
 29f:	83 c4 10             	add    $0x10,%esp
 2a2:	a9 ff 0f 00 00       	test   $0xfff,%eax
 2a7:	74 0a                	je     2b3 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 2a9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 2ae:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 2b3:	50                   	push   %eax
 2b4:	ff 75 10             	push   0x10(%ebp)
 2b7:	ff 75 0c             	push   0xc(%ebp)
 2ba:	ff 75 08             	push   0x8(%ebp)
 2bd:	e8 0e 01 00 00       	call   3d0 <clone>
  return pid;
}
 2c2:	c9                   	leave  
 2c3:	c3                   	ret    

000002c4 <thread_join>:
int
thread_join()
{
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	53                   	push   %ebx
 2c8:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 2cb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2ce:	50                   	push   %eax
 2cf:	e8 04 01 00 00       	call   3d8 <join>
 2d4:	89 c3                	mov    %eax,%ebx
  free(stack);
 2d6:	83 c4 04             	add    $0x4,%esp
 2d9:	ff 75 f4             	push   -0xc(%ebp)
 2dc:	e8 0a 03 00 00       	call   5eb <free>
  return pid;
}
 2e1:	89 d8                	mov    %ebx,%eax
 2e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e6:	c9                   	leave  
 2e7:	c3                   	ret    

000002e8 <lock_init>:
int
lock_init(lock_t * lock){
 2e8:	55                   	push   %ebp
 2e9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2eb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ee:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 2f4:	b8 00 00 00 00       	mov    $0x0,%eax
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret    

000002fb <lock_acquire>:
int
lock_acquire(lock_t * lock){
 2fb:	55                   	push   %ebp
 2fc:	89 e5                	mov    %esp,%ebp
 2fe:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 301:	b8 01 00 00 00       	mov    $0x1,%eax
 306:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 309:	83 f8 01             	cmp    $0x1,%eax
 30c:	74 f3                	je     301 <lock_acquire+0x6>
  {

  }
  return 0;
}
 30e:	b8 00 00 00 00       	mov    $0x0,%eax
 313:	5d                   	pop    %ebp
 314:	c3                   	ret    

00000315 <lock_release>:
int
lock_release(lock_t * lock){
 315:	55                   	push   %ebp
 316:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 318:	8b 45 08             	mov    0x8(%ebp),%eax
 31b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 321:	b8 00 00 00 00       	mov    $0x0,%eax
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    

00000328 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 328:	b8 01 00 00 00       	mov    $0x1,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <exit>:
SYSCALL(exit)
 330:	b8 02 00 00 00       	mov    $0x2,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <wait>:
SYSCALL(wait)
 338:	b8 03 00 00 00       	mov    $0x3,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <pipe>:
SYSCALL(pipe)
 340:	b8 04 00 00 00       	mov    $0x4,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <read>:
SYSCALL(read)
 348:	b8 05 00 00 00       	mov    $0x5,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <write>:
SYSCALL(write)
 350:	b8 10 00 00 00       	mov    $0x10,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <close>:
SYSCALL(close)
 358:	b8 15 00 00 00       	mov    $0x15,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <kill>:
SYSCALL(kill)
 360:	b8 06 00 00 00       	mov    $0x6,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <exec>:
SYSCALL(exec)
 368:	b8 07 00 00 00       	mov    $0x7,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <open>:
SYSCALL(open)
 370:	b8 0f 00 00 00       	mov    $0xf,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <mknod>:
SYSCALL(mknod)
 378:	b8 11 00 00 00       	mov    $0x11,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <unlink>:
SYSCALL(unlink)
 380:	b8 12 00 00 00       	mov    $0x12,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <fstat>:
SYSCALL(fstat)
 388:	b8 08 00 00 00       	mov    $0x8,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <link>:
SYSCALL(link)
 390:	b8 13 00 00 00       	mov    $0x13,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <mkdir>:
SYSCALL(mkdir)
 398:	b8 14 00 00 00       	mov    $0x14,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <chdir>:
SYSCALL(chdir)
 3a0:	b8 09 00 00 00       	mov    $0x9,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <dup>:
SYSCALL(dup)
 3a8:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <getpid>:
SYSCALL(getpid)
 3b0:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <sbrk>:
SYSCALL(sbrk)
 3b8:	b8 0c 00 00 00       	mov    $0xc,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <sleep>:
SYSCALL(sleep)
 3c0:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <uptime>:
SYSCALL(uptime)
 3c8:	b8 0e 00 00 00       	mov    $0xe,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <clone>:
SYSCALL(clone)
 3d0:	b8 16 00 00 00       	mov    $0x16,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <join>:
SYSCALL(join)
 3d8:	b8 17 00 00 00       	mov    $0x17,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	83 ec 1c             	sub    $0x1c,%esp
 3e6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3e9:	6a 01                	push   $0x1
 3eb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3ee:	52                   	push   %edx
 3ef:	50                   	push   %eax
 3f0:	e8 5b ff ff ff       	call   350 <write>
}
 3f5:	83 c4 10             	add    $0x10,%esp
 3f8:	c9                   	leave  
 3f9:	c3                   	ret    

000003fa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3fa:	55                   	push   %ebp
 3fb:	89 e5                	mov    %esp,%ebp
 3fd:	57                   	push   %edi
 3fe:	56                   	push   %esi
 3ff:	53                   	push   %ebx
 400:	83 ec 2c             	sub    $0x2c,%esp
 403:	89 45 d0             	mov    %eax,-0x30(%ebp)
 406:	89 d0                	mov    %edx,%eax
 408:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 40a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 40e:	0f 95 c1             	setne  %cl
 411:	c1 ea 1f             	shr    $0x1f,%edx
 414:	84 d1                	test   %dl,%cl
 416:	74 44                	je     45c <printint+0x62>
    neg = 1;
    x = -xx;
 418:	f7 d8                	neg    %eax
 41a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 41c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 423:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 428:	89 c8                	mov    %ecx,%eax
 42a:	ba 00 00 00 00       	mov    $0x0,%edx
 42f:	f7 f6                	div    %esi
 431:	89 df                	mov    %ebx,%edi
 433:	83 c3 01             	add    $0x1,%ebx
 436:	0f b6 92 cc 07 00 00 	movzbl 0x7cc(%edx),%edx
 43d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 441:	89 ca                	mov    %ecx,%edx
 443:	89 c1                	mov    %eax,%ecx
 445:	39 d6                	cmp    %edx,%esi
 447:	76 df                	jbe    428 <printint+0x2e>
  if(neg)
 449:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 44d:	74 31                	je     480 <printint+0x86>
    buf[i++] = '-';
 44f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 454:	8d 5f 02             	lea    0x2(%edi),%ebx
 457:	8b 75 d0             	mov    -0x30(%ebp),%esi
 45a:	eb 17                	jmp    473 <printint+0x79>
    x = xx;
 45c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 45e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 465:	eb bc                	jmp    423 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 467:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 46c:	89 f0                	mov    %esi,%eax
 46e:	e8 6d ff ff ff       	call   3e0 <putc>
  while(--i >= 0)
 473:	83 eb 01             	sub    $0x1,%ebx
 476:	79 ef                	jns    467 <printint+0x6d>
}
 478:	83 c4 2c             	add    $0x2c,%esp
 47b:	5b                   	pop    %ebx
 47c:	5e                   	pop    %esi
 47d:	5f                   	pop    %edi
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    
 480:	8b 75 d0             	mov    -0x30(%ebp),%esi
 483:	eb ee                	jmp    473 <printint+0x79>

00000485 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 485:	55                   	push   %ebp
 486:	89 e5                	mov    %esp,%ebp
 488:	57                   	push   %edi
 489:	56                   	push   %esi
 48a:	53                   	push   %ebx
 48b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 48e:	8d 45 10             	lea    0x10(%ebp),%eax
 491:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 494:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 499:	bb 00 00 00 00       	mov    $0x0,%ebx
 49e:	eb 14                	jmp    4b4 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4a0:	89 fa                	mov    %edi,%edx
 4a2:	8b 45 08             	mov    0x8(%ebp),%eax
 4a5:	e8 36 ff ff ff       	call   3e0 <putc>
 4aa:	eb 05                	jmp    4b1 <printf+0x2c>
      }
    } else if(state == '%'){
 4ac:	83 fe 25             	cmp    $0x25,%esi
 4af:	74 25                	je     4d6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4b1:	83 c3 01             	add    $0x1,%ebx
 4b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4bb:	84 c0                	test   %al,%al
 4bd:	0f 84 20 01 00 00    	je     5e3 <printf+0x15e>
    c = fmt[i] & 0xff;
 4c3:	0f be f8             	movsbl %al,%edi
 4c6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4c9:	85 f6                	test   %esi,%esi
 4cb:	75 df                	jne    4ac <printf+0x27>
      if(c == '%'){
 4cd:	83 f8 25             	cmp    $0x25,%eax
 4d0:	75 ce                	jne    4a0 <printf+0x1b>
        state = '%';
 4d2:	89 c6                	mov    %eax,%esi
 4d4:	eb db                	jmp    4b1 <printf+0x2c>
      if(c == 'd'){
 4d6:	83 f8 25             	cmp    $0x25,%eax
 4d9:	0f 84 cf 00 00 00    	je     5ae <printf+0x129>
 4df:	0f 8c dd 00 00 00    	jl     5c2 <printf+0x13d>
 4e5:	83 f8 78             	cmp    $0x78,%eax
 4e8:	0f 8f d4 00 00 00    	jg     5c2 <printf+0x13d>
 4ee:	83 f8 63             	cmp    $0x63,%eax
 4f1:	0f 8c cb 00 00 00    	jl     5c2 <printf+0x13d>
 4f7:	83 e8 63             	sub    $0x63,%eax
 4fa:	83 f8 15             	cmp    $0x15,%eax
 4fd:	0f 87 bf 00 00 00    	ja     5c2 <printf+0x13d>
 503:	ff 24 85 74 07 00 00 	jmp    *0x774(,%eax,4)
        printint(fd, *ap, 10, 1);
 50a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 50d:	8b 17                	mov    (%edi),%edx
 50f:	83 ec 0c             	sub    $0xc,%esp
 512:	6a 01                	push   $0x1
 514:	b9 0a 00 00 00       	mov    $0xa,%ecx
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	e8 d9 fe ff ff       	call   3fa <printint>
        ap++;
 521:	83 c7 04             	add    $0x4,%edi
 524:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 527:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 52a:	be 00 00 00 00       	mov    $0x0,%esi
 52f:	eb 80                	jmp    4b1 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 531:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 534:	8b 17                	mov    (%edi),%edx
 536:	83 ec 0c             	sub    $0xc,%esp
 539:	6a 00                	push   $0x0
 53b:	b9 10 00 00 00       	mov    $0x10,%ecx
 540:	8b 45 08             	mov    0x8(%ebp),%eax
 543:	e8 b2 fe ff ff       	call   3fa <printint>
        ap++;
 548:	83 c7 04             	add    $0x4,%edi
 54b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 54e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 551:	be 00 00 00 00       	mov    $0x0,%esi
 556:	e9 56 ff ff ff       	jmp    4b1 <printf+0x2c>
        s = (char*)*ap;
 55b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 55e:	8b 30                	mov    (%eax),%esi
        ap++;
 560:	83 c0 04             	add    $0x4,%eax
 563:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 566:	85 f6                	test   %esi,%esi
 568:	75 15                	jne    57f <printf+0xfa>
          s = "(null)";
 56a:	be 6c 07 00 00       	mov    $0x76c,%esi
 56f:	eb 0e                	jmp    57f <printf+0xfa>
          putc(fd, *s);
 571:	0f be d2             	movsbl %dl,%edx
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	e8 64 fe ff ff       	call   3e0 <putc>
          s++;
 57c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 57f:	0f b6 16             	movzbl (%esi),%edx
 582:	84 d2                	test   %dl,%dl
 584:	75 eb                	jne    571 <printf+0xec>
      state = 0;
 586:	be 00 00 00 00       	mov    $0x0,%esi
 58b:	e9 21 ff ff ff       	jmp    4b1 <printf+0x2c>
        putc(fd, *ap);
 590:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 593:	0f be 17             	movsbl (%edi),%edx
 596:	8b 45 08             	mov    0x8(%ebp),%eax
 599:	e8 42 fe ff ff       	call   3e0 <putc>
        ap++;
 59e:	83 c7 04             	add    $0x4,%edi
 5a1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5a4:	be 00 00 00 00       	mov    $0x0,%esi
 5a9:	e9 03 ff ff ff       	jmp    4b1 <printf+0x2c>
        putc(fd, c);
 5ae:	89 fa                	mov    %edi,%edx
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	e8 28 fe ff ff       	call   3e0 <putc>
      state = 0;
 5b8:	be 00 00 00 00       	mov    $0x0,%esi
 5bd:	e9 ef fe ff ff       	jmp    4b1 <printf+0x2c>
        putc(fd, '%');
 5c2:	ba 25 00 00 00       	mov    $0x25,%edx
 5c7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ca:	e8 11 fe ff ff       	call   3e0 <putc>
        putc(fd, c);
 5cf:	89 fa                	mov    %edi,%edx
 5d1:	8b 45 08             	mov    0x8(%ebp),%eax
 5d4:	e8 07 fe ff ff       	call   3e0 <putc>
      state = 0;
 5d9:	be 00 00 00 00       	mov    $0x0,%esi
 5de:	e9 ce fe ff ff       	jmp    4b1 <printf+0x2c>
    }
  }
}
 5e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e6:	5b                   	pop    %ebx
 5e7:	5e                   	pop    %esi
 5e8:	5f                   	pop    %edi
 5e9:	5d                   	pop    %ebp
 5ea:	c3                   	ret    

000005eb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5eb:	55                   	push   %ebp
 5ec:	89 e5                	mov    %esp,%ebp
 5ee:	57                   	push   %edi
 5ef:	56                   	push   %esi
 5f0:	53                   	push   %ebx
 5f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5f4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f7:	a1 60 0d 00 00       	mov    0xd60,%eax
 5fc:	eb 02                	jmp    600 <free+0x15>
 5fe:	89 d0                	mov    %edx,%eax
 600:	39 c8                	cmp    %ecx,%eax
 602:	73 04                	jae    608 <free+0x1d>
 604:	39 08                	cmp    %ecx,(%eax)
 606:	77 12                	ja     61a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 608:	8b 10                	mov    (%eax),%edx
 60a:	39 c2                	cmp    %eax,%edx
 60c:	77 f0                	ja     5fe <free+0x13>
 60e:	39 c8                	cmp    %ecx,%eax
 610:	72 08                	jb     61a <free+0x2f>
 612:	39 ca                	cmp    %ecx,%edx
 614:	77 04                	ja     61a <free+0x2f>
 616:	89 d0                	mov    %edx,%eax
 618:	eb e6                	jmp    600 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 61a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 61d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 620:	8b 10                	mov    (%eax),%edx
 622:	39 d7                	cmp    %edx,%edi
 624:	74 19                	je     63f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 626:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 629:	8b 50 04             	mov    0x4(%eax),%edx
 62c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 62f:	39 ce                	cmp    %ecx,%esi
 631:	74 1b                	je     64e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 633:	89 08                	mov    %ecx,(%eax)
  freep = p;
 635:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 63a:	5b                   	pop    %ebx
 63b:	5e                   	pop    %esi
 63c:	5f                   	pop    %edi
 63d:	5d                   	pop    %ebp
 63e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 63f:	03 72 04             	add    0x4(%edx),%esi
 642:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 645:	8b 10                	mov    (%eax),%edx
 647:	8b 12                	mov    (%edx),%edx
 649:	89 53 f8             	mov    %edx,-0x8(%ebx)
 64c:	eb db                	jmp    629 <free+0x3e>
    p->s.size += bp->s.size;
 64e:	03 53 fc             	add    -0x4(%ebx),%edx
 651:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 654:	8b 53 f8             	mov    -0x8(%ebx),%edx
 657:	89 10                	mov    %edx,(%eax)
 659:	eb da                	jmp    635 <free+0x4a>

0000065b <morecore>:

static Header*
morecore(uint nu)
{
 65b:	55                   	push   %ebp
 65c:	89 e5                	mov    %esp,%ebp
 65e:	53                   	push   %ebx
 65f:	83 ec 04             	sub    $0x4,%esp
 662:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 664:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 669:	77 05                	ja     670 <morecore+0x15>
    nu = 4096;
 66b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 670:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 677:	83 ec 0c             	sub    $0xc,%esp
 67a:	50                   	push   %eax
 67b:	e8 38 fd ff ff       	call   3b8 <sbrk>
  if(p == (char*)-1)
 680:	83 c4 10             	add    $0x10,%esp
 683:	83 f8 ff             	cmp    $0xffffffff,%eax
 686:	74 1c                	je     6a4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 688:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 68b:	83 c0 08             	add    $0x8,%eax
 68e:	83 ec 0c             	sub    $0xc,%esp
 691:	50                   	push   %eax
 692:	e8 54 ff ff ff       	call   5eb <free>
  return freep;
 697:	a1 60 0d 00 00       	mov    0xd60,%eax
 69c:	83 c4 10             	add    $0x10,%esp
}
 69f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6a2:	c9                   	leave  
 6a3:	c3                   	ret    
    return 0;
 6a4:	b8 00 00 00 00       	mov    $0x0,%eax
 6a9:	eb f4                	jmp    69f <morecore+0x44>

000006ab <malloc>:

void*
malloc(uint nbytes)
{
 6ab:	55                   	push   %ebp
 6ac:	89 e5                	mov    %esp,%ebp
 6ae:	53                   	push   %ebx
 6af:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b2:	8b 45 08             	mov    0x8(%ebp),%eax
 6b5:	8d 58 07             	lea    0x7(%eax),%ebx
 6b8:	c1 eb 03             	shr    $0x3,%ebx
 6bb:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6be:	8b 0d 60 0d 00 00    	mov    0xd60,%ecx
 6c4:	85 c9                	test   %ecx,%ecx
 6c6:	74 04                	je     6cc <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c8:	8b 01                	mov    (%ecx),%eax
 6ca:	eb 4a                	jmp    716 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6cc:	c7 05 60 0d 00 00 64 	movl   $0xd64,0xd60
 6d3:	0d 00 00 
 6d6:	c7 05 64 0d 00 00 64 	movl   $0xd64,0xd64
 6dd:	0d 00 00 
    base.s.size = 0;
 6e0:	c7 05 68 0d 00 00 00 	movl   $0x0,0xd68
 6e7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6ea:	b9 64 0d 00 00       	mov    $0xd64,%ecx
 6ef:	eb d7                	jmp    6c8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6f1:	74 19                	je     70c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6f3:	29 da                	sub    %ebx,%edx
 6f5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6f8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6fb:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6fe:	89 0d 60 0d 00 00    	mov    %ecx,0xd60
      return (void*)(p + 1);
 704:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 707:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 70a:	c9                   	leave  
 70b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 70c:	8b 10                	mov    (%eax),%edx
 70e:	89 11                	mov    %edx,(%ecx)
 710:	eb ec                	jmp    6fe <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 712:	89 c1                	mov    %eax,%ecx
 714:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 716:	8b 50 04             	mov    0x4(%eax),%edx
 719:	39 da                	cmp    %ebx,%edx
 71b:	73 d4                	jae    6f1 <malloc+0x46>
    if(p == freep)
 71d:	39 05 60 0d 00 00    	cmp    %eax,0xd60
 723:	75 ed                	jne    712 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 725:	89 d8                	mov    %ebx,%eax
 727:	e8 2f ff ff ff       	call   65b <morecore>
 72c:	85 c0                	test   %eax,%eax
 72e:	75 e2                	jne    712 <malloc+0x67>
 730:	eb d5                	jmp    707 <malloc+0x5c>
