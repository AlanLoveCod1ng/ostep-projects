
_test_1:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   assert(global == 1);
   6:	a1 60 0c 00 00       	mov    0xc60,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 30                	push   $0x30
  12:	68 20 08 00 00       	push   $0x820
  17:	68 29 08 00 00       	push   $0x829
  1c:	6a 01                	push   $0x1
  1e:	e8 50 05 00 00       	call   573 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 31 08 00 00       	push   $0x831
  2b:	68 3d 08 00 00       	push   $0x83d
  30:	6a 01                	push   $0x1
  32:	e8 3c 05 00 00       	call   573 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 51 08 00 00       	push   $0x851
  3f:	6a 01                	push   $0x1
  41:	e8 2d 05 00 00       	call   573 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 64 0c 00 00    	push   0xc64
  4f:	e8 fa 03 00 00       	call   44e <kill>
  54:	e8 c5 03 00 00       	call   41e <exit>
   global = 5;
  59:	c7 05 60 0c 00 00 05 	movl   $0x5,0xc60
  60:	00 00 00 
   exit();
  63:	e8 b6 03 00 00       	call   41e <exit>

00000068 <main>:
{
  68:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6c:	83 e4 f0             	and    $0xfffffff0,%esp
  6f:	ff 71 fc             	push   -0x4(%ecx)
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	56                   	push   %esi
  76:	53                   	push   %ebx
  77:	51                   	push   %ecx
  78:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  7b:	e8 1e 04 00 00       	call   49e <getpid>
  80:	a3 64 0c 00 00       	mov    %eax,0xc64
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 07 07 00 00       	call   799 <malloc>
   assert(p != NULL);
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	0f 84 a9 00 00 00    	je     146 <main+0xde>
  9d:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  9f:	89 c2                	mov    %eax,%edx
  a1:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  a7:	74 09                	je     b2 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  a9:	b8 00 10 00 00       	mov    $0x1000,%eax
  ae:	29 d0                	sub    %edx,%eax
  b0:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, 0, 0, stack);
  b2:	50                   	push   %eax
  b3:	6a 00                	push   $0x0
  b5:	6a 00                	push   $0x0
  b7:	68 00 00 00 00       	push   $0x0
  bc:	e8 fd 03 00 00       	call   4be <clone>
  c1:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 8e c1 00 00 00    	jle    18f <main+0x127>
   while(global != 5);
  ce:	a1 60 0c 00 00       	mov    0xc60,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	75 f6                	jne    ce <main+0x66>
   printf(1, "TEST PASSED\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 76 08 00 00       	push   $0x876
  e0:	6a 01                	push   $0x1
  e2:	e8 8c 04 00 00       	call   573 <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 d4 03 00 00       	call   4c6 <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 20 08 00 00       	push   $0x820
 104:	68 29 08 00 00       	push   $0x829
 109:	6a 01                	push   $0x1
 10b:	e8 63 04 00 00       	call   573 <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 83 08 00 00       	push   $0x883
 118:	68 3d 08 00 00       	push   $0x83d
 11d:	6a 01                	push   $0x1
 11f:	e8 4f 04 00 00       	call   573 <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 51 08 00 00       	push   $0x851
 12c:	6a 01                	push   $0x1
 12e:	e8 40 04 00 00       	call   573 <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 64 0c 00 00    	push   0xc64
 13c:	e8 0d 03 00 00       	call   44e <kill>
 141:	e8 d8 02 00 00       	call   41e <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 20 08 00 00       	push   $0x820
 14d:	68 29 08 00 00       	push   $0x829
 152:	6a 01                	push   $0x1
 154:	e8 1a 04 00 00       	call   573 <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 5e 08 00 00       	push   $0x85e
 161:	68 3d 08 00 00       	push   $0x83d
 166:	6a 01                	push   $0x1
 168:	e8 06 04 00 00       	call   573 <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 51 08 00 00       	push   $0x851
 175:	6a 01                	push   $0x1
 177:	e8 f7 03 00 00       	call   573 <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 64 0c 00 00    	push   0xc64
 185:	e8 c4 02 00 00       	call   44e <kill>
 18a:	e8 8f 02 00 00       	call   41e <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 20 08 00 00       	push   $0x820
 196:	68 29 08 00 00       	push   $0x829
 19b:	6a 01                	push   $0x1
 19d:	e8 d1 03 00 00       	call   573 <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 68 08 00 00       	push   $0x868
 1aa:	68 3d 08 00 00       	push   $0x83d
 1af:	6a 01                	push   $0x1
 1b1:	e8 bd 03 00 00       	call   573 <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 51 08 00 00       	push   $0x851
 1be:	6a 01                	push   $0x1
 1c0:	e8 ae 03 00 00       	call   573 <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 64 0c 00 00    	push   0xc64
 1ce:	e8 7b 02 00 00       	call   44e <kill>
 1d3:	e8 46 02 00 00       	call   41e <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 f8 04 00 00       	call   6d9 <free>
   exit();
 1e1:	e8 38 02 00 00       	call   41e <exit>

000001e6 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	56                   	push   %esi
 1ea:	53                   	push   %ebx
 1eb:	8b 75 08             	mov    0x8(%ebp),%esi
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1f1:	89 f0                	mov    %esi,%eax
 1f3:	89 d1                	mov    %edx,%ecx
 1f5:	83 c2 01             	add    $0x1,%edx
 1f8:	89 c3                	mov    %eax,%ebx
 1fa:	83 c0 01             	add    $0x1,%eax
 1fd:	0f b6 09             	movzbl (%ecx),%ecx
 200:	88 0b                	mov    %cl,(%ebx)
 202:	84 c9                	test   %cl,%cl
 204:	75 ed                	jne    1f3 <strcpy+0xd>
    ;
  return os;
}
 206:	89 f0                	mov    %esi,%eax
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    

0000020c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 20c:	55                   	push   %ebp
 20d:	89 e5                	mov    %esp,%ebp
 20f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 212:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 215:	eb 06                	jmp    21d <strcmp+0x11>
    p++, q++;
 217:	83 c1 01             	add    $0x1,%ecx
 21a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 21d:	0f b6 01             	movzbl (%ecx),%eax
 220:	84 c0                	test   %al,%al
 222:	74 04                	je     228 <strcmp+0x1c>
 224:	3a 02                	cmp    (%edx),%al
 226:	74 ef                	je     217 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 228:	0f b6 c0             	movzbl %al,%eax
 22b:	0f b6 12             	movzbl (%edx),%edx
 22e:	29 d0                	sub    %edx,%eax
}
 230:	5d                   	pop    %ebp
 231:	c3                   	ret    

00000232 <strlen>:

uint
strlen(const char *s)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 238:	b8 00 00 00 00       	mov    $0x0,%eax
 23d:	eb 03                	jmp    242 <strlen+0x10>
 23f:	83 c0 01             	add    $0x1,%eax
 242:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 246:	75 f7                	jne    23f <strlen+0xd>
    ;
  return n;
}
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <memset>:

void*
memset(void *dst, int c, uint n)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	57                   	push   %edi
 24e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 251:	89 d7                	mov    %edx,%edi
 253:	8b 4d 10             	mov    0x10(%ebp),%ecx
 256:	8b 45 0c             	mov    0xc(%ebp),%eax
 259:	fc                   	cld    
 25a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 25c:	89 d0                	mov    %edx,%eax
 25e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <strchr>:

char*
strchr(const char *s, char c)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26d:	eb 03                	jmp    272 <strchr+0xf>
 26f:	83 c0 01             	add    $0x1,%eax
 272:	0f b6 10             	movzbl (%eax),%edx
 275:	84 d2                	test   %dl,%dl
 277:	74 06                	je     27f <strchr+0x1c>
    if(*s == c)
 279:	38 ca                	cmp    %cl,%dl
 27b:	75 f2                	jne    26f <strchr+0xc>
 27d:	eb 05                	jmp    284 <strchr+0x21>
      return (char*)s;
  return 0;
 27f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 284:	5d                   	pop    %ebp
 285:	c3                   	ret    

00000286 <gets>:

char*
gets(char *buf, int max)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	57                   	push   %edi
 28a:	56                   	push   %esi
 28b:	53                   	push   %ebx
 28c:	83 ec 1c             	sub    $0x1c,%esp
 28f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 292:	bb 00 00 00 00       	mov    $0x0,%ebx
 297:	89 de                	mov    %ebx,%esi
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7d 2e                	jge    2cf <gets+0x49>
    cc = read(0, &c, 1);
 2a1:	83 ec 04             	sub    $0x4,%esp
 2a4:	6a 01                	push   $0x1
 2a6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a9:	50                   	push   %eax
 2aa:	6a 00                	push   $0x0
 2ac:	e8 85 01 00 00       	call   436 <read>
    if(cc < 1)
 2b1:	83 c4 10             	add    $0x10,%esp
 2b4:	85 c0                	test   %eax,%eax
 2b6:	7e 17                	jle    2cf <gets+0x49>
      break;
    buf[i++] = c;
 2b8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2bc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2bf:	3c 0a                	cmp    $0xa,%al
 2c1:	0f 94 c2             	sete   %dl
 2c4:	3c 0d                	cmp    $0xd,%al
 2c6:	0f 94 c0             	sete   %al
 2c9:	08 c2                	or     %al,%dl
 2cb:	74 ca                	je     297 <gets+0x11>
    buf[i++] = c;
 2cd:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2cf:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2d3:	89 f8                	mov    %edi,%eax
 2d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
 2da:	5f                   	pop    %edi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    

000002dd <stat>:

int
stat(const char *n, struct stat *st)
{
 2dd:	55                   	push   %ebp
 2de:	89 e5                	mov    %esp,%ebp
 2e0:	56                   	push   %esi
 2e1:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e2:	83 ec 08             	sub    $0x8,%esp
 2e5:	6a 00                	push   $0x0
 2e7:	ff 75 08             	push   0x8(%ebp)
 2ea:	e8 6f 01 00 00       	call   45e <open>
  if(fd < 0)
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	85 c0                	test   %eax,%eax
 2f4:	78 24                	js     31a <stat+0x3d>
 2f6:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2f8:	83 ec 08             	sub    $0x8,%esp
 2fb:	ff 75 0c             	push   0xc(%ebp)
 2fe:	50                   	push   %eax
 2ff:	e8 72 01 00 00       	call   476 <fstat>
 304:	89 c6                	mov    %eax,%esi
  close(fd);
 306:	89 1c 24             	mov    %ebx,(%esp)
 309:	e8 38 01 00 00       	call   446 <close>
  return r;
 30e:	83 c4 10             	add    $0x10,%esp
}
 311:	89 f0                	mov    %esi,%eax
 313:	8d 65 f8             	lea    -0x8(%ebp),%esp
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
    return -1;
 31a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 31f:	eb f0                	jmp    311 <stat+0x34>

00000321 <atoi>:

int
atoi(const char *s)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	53                   	push   %ebx
 325:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 328:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 32d:	eb 10                	jmp    33f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 32f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 332:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 335:	83 c1 01             	add    $0x1,%ecx
 338:	0f be c0             	movsbl %al,%eax
 33b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 33f:	0f b6 01             	movzbl (%ecx),%eax
 342:	8d 58 d0             	lea    -0x30(%eax),%ebx
 345:	80 fb 09             	cmp    $0x9,%bl
 348:	76 e5                	jbe    32f <atoi+0xe>
  return n;
}
 34a:	89 d0                	mov    %edx,%eax
 34c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34f:	c9                   	leave  
 350:	c3                   	ret    

00000351 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 351:	55                   	push   %ebp
 352:	89 e5                	mov    %esp,%ebp
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	8b 75 08             	mov    0x8(%ebp),%esi
 359:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 35c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 35f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 361:	eb 0d                	jmp    370 <memmove+0x1f>
    *dst++ = *src++;
 363:	0f b6 01             	movzbl (%ecx),%eax
 366:	88 02                	mov    %al,(%edx)
 368:	8d 49 01             	lea    0x1(%ecx),%ecx
 36b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 36e:	89 d8                	mov    %ebx,%eax
 370:	8d 58 ff             	lea    -0x1(%eax),%ebx
 373:	85 c0                	test   %eax,%eax
 375:	7f ec                	jg     363 <memmove+0x12>
  return vdst;
}
 377:	89 f0                	mov    %esi,%eax
 379:	5b                   	pop    %ebx
 37a:	5e                   	pop    %esi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    

0000037d <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 37d:	55                   	push   %ebp
 37e:	89 e5                	mov    %esp,%ebp
 380:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 383:	68 00 20 00 00       	push   $0x2000
 388:	e8 0c 04 00 00       	call   799 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 38d:	83 c4 10             	add    $0x10,%esp
 390:	a9 ff 0f 00 00       	test   $0xfff,%eax
 395:	74 0a                	je     3a1 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 397:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 39c:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 3a1:	50                   	push   %eax
 3a2:	ff 75 10             	push   0x10(%ebp)
 3a5:	ff 75 0c             	push   0xc(%ebp)
 3a8:	ff 75 08             	push   0x8(%ebp)
 3ab:	e8 0e 01 00 00       	call   4be <clone>
  return pid;
}
 3b0:	c9                   	leave  
 3b1:	c3                   	ret    

000003b2 <thread_join>:
int
thread_join()
{
 3b2:	55                   	push   %ebp
 3b3:	89 e5                	mov    %esp,%ebp
 3b5:	53                   	push   %ebx
 3b6:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 3b9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3bc:	50                   	push   %eax
 3bd:	e8 04 01 00 00       	call   4c6 <join>
 3c2:	89 c3                	mov    %eax,%ebx
  free(stack);
 3c4:	83 c4 04             	add    $0x4,%esp
 3c7:	ff 75 f4             	push   -0xc(%ebp)
 3ca:	e8 0a 03 00 00       	call   6d9 <free>
  return pid;
}
 3cf:	89 d8                	mov    %ebx,%eax
 3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    

000003d6 <lock_init>:
int
lock_init(lock_t * lock){
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3d9:	8b 45 08             	mov    0x8(%ebp),%eax
 3dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 3e2:	b8 00 00 00 00       	mov    $0x0,%eax
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    

000003e9 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 3e9:	55                   	push   %ebp
 3ea:	89 e5                	mov    %esp,%ebp
 3ec:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3ef:	b8 01 00 00 00       	mov    $0x1,%eax
 3f4:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 3f7:	83 f8 01             	cmp    $0x1,%eax
 3fa:	74 f3                	je     3ef <lock_acquire+0x6>
  {

  }
  return 0;
}
 3fc:	b8 00 00 00 00       	mov    $0x0,%eax
 401:	5d                   	pop    %ebp
 402:	c3                   	ret    

00000403 <lock_release>:
int
lock_release(lock_t * lock){
 403:	55                   	push   %ebp
 404:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 406:	8b 45 08             	mov    0x8(%ebp),%eax
 409:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 40f:	b8 00 00 00 00       	mov    $0x0,%eax
 414:	5d                   	pop    %ebp
 415:	c3                   	ret    

00000416 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 416:	b8 01 00 00 00       	mov    $0x1,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <exit>:
SYSCALL(exit)
 41e:	b8 02 00 00 00       	mov    $0x2,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <wait>:
SYSCALL(wait)
 426:	b8 03 00 00 00       	mov    $0x3,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <pipe>:
SYSCALL(pipe)
 42e:	b8 04 00 00 00       	mov    $0x4,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <read>:
SYSCALL(read)
 436:	b8 05 00 00 00       	mov    $0x5,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <write>:
SYSCALL(write)
 43e:	b8 10 00 00 00       	mov    $0x10,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <close>:
SYSCALL(close)
 446:	b8 15 00 00 00       	mov    $0x15,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <kill>:
SYSCALL(kill)
 44e:	b8 06 00 00 00       	mov    $0x6,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <exec>:
SYSCALL(exec)
 456:	b8 07 00 00 00       	mov    $0x7,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <open>:
SYSCALL(open)
 45e:	b8 0f 00 00 00       	mov    $0xf,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <mknod>:
SYSCALL(mknod)
 466:	b8 11 00 00 00       	mov    $0x11,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <unlink>:
SYSCALL(unlink)
 46e:	b8 12 00 00 00       	mov    $0x12,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <fstat>:
SYSCALL(fstat)
 476:	b8 08 00 00 00       	mov    $0x8,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <link>:
SYSCALL(link)
 47e:	b8 13 00 00 00       	mov    $0x13,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <mkdir>:
SYSCALL(mkdir)
 486:	b8 14 00 00 00       	mov    $0x14,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <chdir>:
SYSCALL(chdir)
 48e:	b8 09 00 00 00       	mov    $0x9,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <dup>:
SYSCALL(dup)
 496:	b8 0a 00 00 00       	mov    $0xa,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <getpid>:
SYSCALL(getpid)
 49e:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <sbrk>:
SYSCALL(sbrk)
 4a6:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <sleep>:
SYSCALL(sleep)
 4ae:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <uptime>:
SYSCALL(uptime)
 4b6:	b8 0e 00 00 00       	mov    $0xe,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <clone>:
SYSCALL(clone)
 4be:	b8 16 00 00 00       	mov    $0x16,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <join>:
SYSCALL(join)
 4c6:	b8 17 00 00 00       	mov    $0x17,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	83 ec 1c             	sub    $0x1c,%esp
 4d4:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4d7:	6a 01                	push   $0x1
 4d9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4dc:	52                   	push   %edx
 4dd:	50                   	push   %eax
 4de:	e8 5b ff ff ff       	call   43e <write>
}
 4e3:	83 c4 10             	add    $0x10,%esp
 4e6:	c9                   	leave  
 4e7:	c3                   	ret    

000004e8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	57                   	push   %edi
 4ec:	56                   	push   %esi
 4ed:	53                   	push   %ebx
 4ee:	83 ec 2c             	sub    $0x2c,%esp
 4f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4f4:	89 d0                	mov    %edx,%eax
 4f6:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4f8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4fc:	0f 95 c1             	setne  %cl
 4ff:	c1 ea 1f             	shr    $0x1f,%edx
 502:	84 d1                	test   %dl,%cl
 504:	74 44                	je     54a <printint+0x62>
    neg = 1;
    x = -xx;
 506:	f7 d8                	neg    %eax
 508:	89 c1                	mov    %eax,%ecx
    neg = 1;
 50a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 511:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 516:	89 c8                	mov    %ecx,%eax
 518:	ba 00 00 00 00       	mov    $0x0,%edx
 51d:	f7 f6                	div    %esi
 51f:	89 df                	mov    %ebx,%edi
 521:	83 c3 01             	add    $0x1,%ebx
 524:	0f b6 92 f8 08 00 00 	movzbl 0x8f8(%edx),%edx
 52b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 52f:	89 ca                	mov    %ecx,%edx
 531:	89 c1                	mov    %eax,%ecx
 533:	39 d6                	cmp    %edx,%esi
 535:	76 df                	jbe    516 <printint+0x2e>
  if(neg)
 537:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 53b:	74 31                	je     56e <printint+0x86>
    buf[i++] = '-';
 53d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 542:	8d 5f 02             	lea    0x2(%edi),%ebx
 545:	8b 75 d0             	mov    -0x30(%ebp),%esi
 548:	eb 17                	jmp    561 <printint+0x79>
    x = xx;
 54a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 54c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 553:	eb bc                	jmp    511 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 555:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 55a:	89 f0                	mov    %esi,%eax
 55c:	e8 6d ff ff ff       	call   4ce <putc>
  while(--i >= 0)
 561:	83 eb 01             	sub    $0x1,%ebx
 564:	79 ef                	jns    555 <printint+0x6d>
}
 566:	83 c4 2c             	add    $0x2c,%esp
 569:	5b                   	pop    %ebx
 56a:	5e                   	pop    %esi
 56b:	5f                   	pop    %edi
 56c:	5d                   	pop    %ebp
 56d:	c3                   	ret    
 56e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 571:	eb ee                	jmp    561 <printint+0x79>

00000573 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 573:	55                   	push   %ebp
 574:	89 e5                	mov    %esp,%ebp
 576:	57                   	push   %edi
 577:	56                   	push   %esi
 578:	53                   	push   %ebx
 579:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 57c:	8d 45 10             	lea    0x10(%ebp),%eax
 57f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 582:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 587:	bb 00 00 00 00       	mov    $0x0,%ebx
 58c:	eb 14                	jmp    5a2 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 58e:	89 fa                	mov    %edi,%edx
 590:	8b 45 08             	mov    0x8(%ebp),%eax
 593:	e8 36 ff ff ff       	call   4ce <putc>
 598:	eb 05                	jmp    59f <printf+0x2c>
      }
    } else if(state == '%'){
 59a:	83 fe 25             	cmp    $0x25,%esi
 59d:	74 25                	je     5c4 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 59f:	83 c3 01             	add    $0x1,%ebx
 5a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5a9:	84 c0                	test   %al,%al
 5ab:	0f 84 20 01 00 00    	je     6d1 <printf+0x15e>
    c = fmt[i] & 0xff;
 5b1:	0f be f8             	movsbl %al,%edi
 5b4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5b7:	85 f6                	test   %esi,%esi
 5b9:	75 df                	jne    59a <printf+0x27>
      if(c == '%'){
 5bb:	83 f8 25             	cmp    $0x25,%eax
 5be:	75 ce                	jne    58e <printf+0x1b>
        state = '%';
 5c0:	89 c6                	mov    %eax,%esi
 5c2:	eb db                	jmp    59f <printf+0x2c>
      if(c == 'd'){
 5c4:	83 f8 25             	cmp    $0x25,%eax
 5c7:	0f 84 cf 00 00 00    	je     69c <printf+0x129>
 5cd:	0f 8c dd 00 00 00    	jl     6b0 <printf+0x13d>
 5d3:	83 f8 78             	cmp    $0x78,%eax
 5d6:	0f 8f d4 00 00 00    	jg     6b0 <printf+0x13d>
 5dc:	83 f8 63             	cmp    $0x63,%eax
 5df:	0f 8c cb 00 00 00    	jl     6b0 <printf+0x13d>
 5e5:	83 e8 63             	sub    $0x63,%eax
 5e8:	83 f8 15             	cmp    $0x15,%eax
 5eb:	0f 87 bf 00 00 00    	ja     6b0 <printf+0x13d>
 5f1:	ff 24 85 a0 08 00 00 	jmp    *0x8a0(,%eax,4)
        printint(fd, *ap, 10, 1);
 5f8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5fb:	8b 17                	mov    (%edi),%edx
 5fd:	83 ec 0c             	sub    $0xc,%esp
 600:	6a 01                	push   $0x1
 602:	b9 0a 00 00 00       	mov    $0xa,%ecx
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	e8 d9 fe ff ff       	call   4e8 <printint>
        ap++;
 60f:	83 c7 04             	add    $0x4,%edi
 612:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 615:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 618:	be 00 00 00 00       	mov    $0x0,%esi
 61d:	eb 80                	jmp    59f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 61f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 622:	8b 17                	mov    (%edi),%edx
 624:	83 ec 0c             	sub    $0xc,%esp
 627:	6a 00                	push   $0x0
 629:	b9 10 00 00 00       	mov    $0x10,%ecx
 62e:	8b 45 08             	mov    0x8(%ebp),%eax
 631:	e8 b2 fe ff ff       	call   4e8 <printint>
        ap++;
 636:	83 c7 04             	add    $0x4,%edi
 639:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 63c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63f:	be 00 00 00 00       	mov    $0x0,%esi
 644:	e9 56 ff ff ff       	jmp    59f <printf+0x2c>
        s = (char*)*ap;
 649:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64c:	8b 30                	mov    (%eax),%esi
        ap++;
 64e:	83 c0 04             	add    $0x4,%eax
 651:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 654:	85 f6                	test   %esi,%esi
 656:	75 15                	jne    66d <printf+0xfa>
          s = "(null)";
 658:	be 99 08 00 00       	mov    $0x899,%esi
 65d:	eb 0e                	jmp    66d <printf+0xfa>
          putc(fd, *s);
 65f:	0f be d2             	movsbl %dl,%edx
 662:	8b 45 08             	mov    0x8(%ebp),%eax
 665:	e8 64 fe ff ff       	call   4ce <putc>
          s++;
 66a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 66d:	0f b6 16             	movzbl (%esi),%edx
 670:	84 d2                	test   %dl,%dl
 672:	75 eb                	jne    65f <printf+0xec>
      state = 0;
 674:	be 00 00 00 00       	mov    $0x0,%esi
 679:	e9 21 ff ff ff       	jmp    59f <printf+0x2c>
        putc(fd, *ap);
 67e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 681:	0f be 17             	movsbl (%edi),%edx
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	e8 42 fe ff ff       	call   4ce <putc>
        ap++;
 68c:	83 c7 04             	add    $0x4,%edi
 68f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 692:	be 00 00 00 00       	mov    $0x0,%esi
 697:	e9 03 ff ff ff       	jmp    59f <printf+0x2c>
        putc(fd, c);
 69c:	89 fa                	mov    %edi,%edx
 69e:	8b 45 08             	mov    0x8(%ebp),%eax
 6a1:	e8 28 fe ff ff       	call   4ce <putc>
      state = 0;
 6a6:	be 00 00 00 00       	mov    $0x0,%esi
 6ab:	e9 ef fe ff ff       	jmp    59f <printf+0x2c>
        putc(fd, '%');
 6b0:	ba 25 00 00 00       	mov    $0x25,%edx
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	e8 11 fe ff ff       	call   4ce <putc>
        putc(fd, c);
 6bd:	89 fa                	mov    %edi,%edx
 6bf:	8b 45 08             	mov    0x8(%ebp),%eax
 6c2:	e8 07 fe ff ff       	call   4ce <putc>
      state = 0;
 6c7:	be 00 00 00 00       	mov    $0x0,%esi
 6cc:	e9 ce fe ff ff       	jmp    59f <printf+0x2c>
    }
  }
}
 6d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6d4:	5b                   	pop    %ebx
 6d5:	5e                   	pop    %esi
 6d6:	5f                   	pop    %edi
 6d7:	5d                   	pop    %ebp
 6d8:	c3                   	ret    

000006d9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d9:	55                   	push   %ebp
 6da:	89 e5                	mov    %esp,%ebp
 6dc:	57                   	push   %edi
 6dd:	56                   	push   %esi
 6de:	53                   	push   %ebx
 6df:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6e2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e5:	a1 68 0c 00 00       	mov    0xc68,%eax
 6ea:	eb 02                	jmp    6ee <free+0x15>
 6ec:	89 d0                	mov    %edx,%eax
 6ee:	39 c8                	cmp    %ecx,%eax
 6f0:	73 04                	jae    6f6 <free+0x1d>
 6f2:	39 08                	cmp    %ecx,(%eax)
 6f4:	77 12                	ja     708 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f6:	8b 10                	mov    (%eax),%edx
 6f8:	39 c2                	cmp    %eax,%edx
 6fa:	77 f0                	ja     6ec <free+0x13>
 6fc:	39 c8                	cmp    %ecx,%eax
 6fe:	72 08                	jb     708 <free+0x2f>
 700:	39 ca                	cmp    %ecx,%edx
 702:	77 04                	ja     708 <free+0x2f>
 704:	89 d0                	mov    %edx,%eax
 706:	eb e6                	jmp    6ee <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	8b 10                	mov    (%eax),%edx
 710:	39 d7                	cmp    %edx,%edi
 712:	74 19                	je     72d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 714:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 717:	8b 50 04             	mov    0x4(%eax),%edx
 71a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 71d:	39 ce                	cmp    %ecx,%esi
 71f:	74 1b                	je     73c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 721:	89 08                	mov    %ecx,(%eax)
  freep = p;
 723:	a3 68 0c 00 00       	mov    %eax,0xc68
}
 728:	5b                   	pop    %ebx
 729:	5e                   	pop    %esi
 72a:	5f                   	pop    %edi
 72b:	5d                   	pop    %ebp
 72c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 72d:	03 72 04             	add    0x4(%edx),%esi
 730:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 733:	8b 10                	mov    (%eax),%edx
 735:	8b 12                	mov    (%edx),%edx
 737:	89 53 f8             	mov    %edx,-0x8(%ebx)
 73a:	eb db                	jmp    717 <free+0x3e>
    p->s.size += bp->s.size;
 73c:	03 53 fc             	add    -0x4(%ebx),%edx
 73f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 742:	8b 53 f8             	mov    -0x8(%ebx),%edx
 745:	89 10                	mov    %edx,(%eax)
 747:	eb da                	jmp    723 <free+0x4a>

00000749 <morecore>:

static Header*
morecore(uint nu)
{
 749:	55                   	push   %ebp
 74a:	89 e5                	mov    %esp,%ebp
 74c:	53                   	push   %ebx
 74d:	83 ec 04             	sub    $0x4,%esp
 750:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 752:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 757:	77 05                	ja     75e <morecore+0x15>
    nu = 4096;
 759:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 75e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 765:	83 ec 0c             	sub    $0xc,%esp
 768:	50                   	push   %eax
 769:	e8 38 fd ff ff       	call   4a6 <sbrk>
  if(p == (char*)-1)
 76e:	83 c4 10             	add    $0x10,%esp
 771:	83 f8 ff             	cmp    $0xffffffff,%eax
 774:	74 1c                	je     792 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 776:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 779:	83 c0 08             	add    $0x8,%eax
 77c:	83 ec 0c             	sub    $0xc,%esp
 77f:	50                   	push   %eax
 780:	e8 54 ff ff ff       	call   6d9 <free>
  return freep;
 785:	a1 68 0c 00 00       	mov    0xc68,%eax
 78a:	83 c4 10             	add    $0x10,%esp
}
 78d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 790:	c9                   	leave  
 791:	c3                   	ret    
    return 0;
 792:	b8 00 00 00 00       	mov    $0x0,%eax
 797:	eb f4                	jmp    78d <morecore+0x44>

00000799 <malloc>:

void*
malloc(uint nbytes)
{
 799:	55                   	push   %ebp
 79a:	89 e5                	mov    %esp,%ebp
 79c:	53                   	push   %ebx
 79d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
 7a3:	8d 58 07             	lea    0x7(%eax),%ebx
 7a6:	c1 eb 03             	shr    $0x3,%ebx
 7a9:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7ac:	8b 0d 68 0c 00 00    	mov    0xc68,%ecx
 7b2:	85 c9                	test   %ecx,%ecx
 7b4:	74 04                	je     7ba <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b6:	8b 01                	mov    (%ecx),%eax
 7b8:	eb 4a                	jmp    804 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7ba:	c7 05 68 0c 00 00 6c 	movl   $0xc6c,0xc68
 7c1:	0c 00 00 
 7c4:	c7 05 6c 0c 00 00 6c 	movl   $0xc6c,0xc6c
 7cb:	0c 00 00 
    base.s.size = 0;
 7ce:	c7 05 70 0c 00 00 00 	movl   $0x0,0xc70
 7d5:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7d8:	b9 6c 0c 00 00       	mov    $0xc6c,%ecx
 7dd:	eb d7                	jmp    7b6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7df:	74 19                	je     7fa <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7e1:	29 da                	sub    %ebx,%edx
 7e3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7e9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7ec:	89 0d 68 0c 00 00    	mov    %ecx,0xc68
      return (void*)(p + 1);
 7f2:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7f8:	c9                   	leave  
 7f9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7fa:	8b 10                	mov    (%eax),%edx
 7fc:	89 11                	mov    %edx,(%ecx)
 7fe:	eb ec                	jmp    7ec <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 800:	89 c1                	mov    %eax,%ecx
 802:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 804:	8b 50 04             	mov    0x4(%eax),%edx
 807:	39 da                	cmp    %ebx,%edx
 809:	73 d4                	jae    7df <malloc+0x46>
    if(p == freep)
 80b:	39 05 68 0c 00 00    	cmp    %eax,0xc68
 811:	75 ed                	jne    800 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 813:	89 d8                	mov    %ebx,%eax
 815:	e8 2f ff ff ff       	call   749 <morecore>
 81a:	85 c0                	test   %eax,%eax
 81c:	75 e2                	jne    800 <malloc+0x67>
 81e:	eb d5                	jmp    7f5 <malloc+0x5c>
