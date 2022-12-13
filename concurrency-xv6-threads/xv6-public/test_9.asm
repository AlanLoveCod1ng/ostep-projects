
_test_9:     file format elf32-i386


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
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
   6:	8d 4d 0c             	lea    0xc(%ebp),%ecx
   9:	8b 45 08             	mov    0x8(%ebp),%eax
   c:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
  12:	39 d1                	cmp    %edx,%ecx
  14:	75 67                	jne    7d <worker+0x7d>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  16:	8d 90 f8 0f 00 00    	lea    0xff8(%eax),%edx
  1c:	8d 4d 08             	lea    0x8(%ebp),%ecx
  1f:	39 d1                	cmp    %edx,%ecx
  21:	0f 85 9f 00 00 00    	jne    c6 <worker+0xc6>
   assert(*((uint*) (arg1 + PGSIZE - 12)) == 0xffffffff);
  27:	83 b8 f4 0f 00 00 ff 	cmpl   $0xffffffff,0xff4(%eax)
  2e:	0f 84 db 00 00 00    	je     10f <worker+0x10f>
  34:	6a 32                	push   $0x32
  36:	68 d8 08 00 00       	push   $0x8d8
  3b:	68 e1 08 00 00       	push   $0x8e1
  40:	6a 01                	push   $0x1
  42:	e8 e1 05 00 00       	call   628 <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 a0 09 00 00       	push   $0x9a0
  4f:	68 e9 08 00 00       	push   $0x8e9
  54:	6a 01                	push   $0x1
  56:	e8 cd 05 00 00       	call   628 <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 fd 08 00 00       	push   $0x8fd
  63:	6a 01                	push   $0x1
  65:	e8 be 05 00 00       	call   628 <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 9c 0d 00 00    	push   0xd9c
  73:	e8 8b 04 00 00       	call   503 <kill>
  78:	e8 56 04 00 00       	call   4d3 <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 d8 08 00 00       	push   $0x8d8
  84:	68 e1 08 00 00       	push   $0x8e1
  89:	6a 01                	push   $0x1
  8b:	e8 98 05 00 00       	call   628 <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 48 09 00 00       	push   $0x948
  98:	68 e9 08 00 00       	push   $0x8e9
  9d:	6a 01                	push   $0x1
  9f:	e8 84 05 00 00       	call   628 <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 fd 08 00 00       	push   $0x8fd
  ac:	6a 01                	push   $0x1
  ae:	e8 75 05 00 00       	call   628 <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 9c 0d 00 00    	push   0xd9c
  bc:	e8 42 04 00 00       	call   503 <kill>
  c1:	e8 0d 04 00 00       	call   4d3 <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 d8 08 00 00       	push   $0x8d8
  cd:	68 e1 08 00 00       	push   $0x8e1
  d2:	6a 01                	push   $0x1
  d4:	e8 4f 05 00 00       	call   628 <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 74 09 00 00       	push   $0x974
  e1:	68 e9 08 00 00       	push   $0x8e9
  e6:	6a 01                	push   $0x1
  e8:	e8 3b 05 00 00       	call   628 <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 fd 08 00 00       	push   $0x8fd
  f5:	6a 01                	push   $0x1
  f7:	e8 2c 05 00 00       	call   628 <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 9c 0d 00 00    	push   0xd9c
 105:	e8 f9 03 00 00       	call   503 <kill>
 10a:	e8 c4 03 00 00       	call   4d3 <exit>
   global = 5;
 10f:	c7 05 98 0d 00 00 05 	movl   $0x5,0xd98
 116:	00 00 00 
   exit();
 119:	e8 b5 03 00 00       	call   4d3 <exit>

0000011e <main>:
{
 11e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 122:	83 e4 f0             	and    $0xfffffff0,%esp
 125:	ff 71 fc             	push   -0x4(%ecx)
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	56                   	push   %esi
 12c:	53                   	push   %ebx
 12d:	51                   	push   %ecx
 12e:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
 131:	e8 1d 04 00 00       	call   553 <getpid>
 136:	a3 9c 0d 00 00       	mov    %eax,0xd9c
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 06 07 00 00       	call   84e <malloc>
   assert(p != NULL);
 148:	83 c4 10             	add    $0x10,%esp
 14b:	85 c0                	test   %eax,%eax
 14d:	0f 84 a8 00 00 00    	je     1fb <main+0xdd>
 153:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 155:	89 c2                	mov    %eax,%edx
 157:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 15d:	74 09                	je     168 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 15f:	b8 00 10 00 00       	mov    $0x1000,%eax
 164:	29 d0                	sub    %edx,%eax
 166:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, stack, 0, stack);
 168:	50                   	push   %eax
 169:	6a 00                	push   $0x0
 16b:	50                   	push   %eax
 16c:	68 00 00 00 00       	push   $0x0
 171:	e8 fd 03 00 00       	call   573 <clone>
 176:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 178:	83 c4 10             	add    $0x10,%esp
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 8e c1 00 00 00    	jle    244 <main+0x126>
   while(global != 5);
 183:	a1 98 0d 00 00       	mov    0xd98,%eax
 188:	83 f8 05             	cmp    $0x5,%eax
 18b:	75 f6                	jne    183 <main+0x65>
   printf(1, "TEST PASSED\n");
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	68 22 09 00 00       	push   $0x922
 195:	6a 01                	push   $0x1
 197:	e8 8c 04 00 00       	call   628 <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 d4 03 00 00       	call   57b <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 d8 08 00 00       	push   $0x8d8
 1b9:	68 e1 08 00 00       	push   $0x8e1
 1be:	6a 01                	push   $0x1
 1c0:	e8 63 04 00 00       	call   628 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 2f 09 00 00       	push   $0x92f
 1cd:	68 e9 08 00 00       	push   $0x8e9
 1d2:	6a 01                	push   $0x1
 1d4:	e8 4f 04 00 00       	call   628 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 fd 08 00 00       	push   $0x8fd
 1e1:	6a 01                	push   $0x1
 1e3:	e8 40 04 00 00       	call   628 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 9c 0d 00 00    	push   0xd9c
 1f1:	e8 0d 03 00 00       	call   503 <kill>
 1f6:	e8 d8 02 00 00       	call   4d3 <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 d8 08 00 00       	push   $0x8d8
 202:	68 e1 08 00 00       	push   $0x8e1
 207:	6a 01                	push   $0x1
 209:	e8 1a 04 00 00       	call   628 <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 0a 09 00 00       	push   $0x90a
 216:	68 e9 08 00 00       	push   $0x8e9
 21b:	6a 01                	push   $0x1
 21d:	e8 06 04 00 00       	call   628 <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 fd 08 00 00       	push   $0x8fd
 22a:	6a 01                	push   $0x1
 22c:	e8 f7 03 00 00       	call   628 <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 9c 0d 00 00    	push   0xd9c
 23a:	e8 c4 02 00 00       	call   503 <kill>
 23f:	e8 8f 02 00 00       	call   4d3 <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 d8 08 00 00       	push   $0x8d8
 24b:	68 e1 08 00 00       	push   $0x8e1
 250:	6a 01                	push   $0x1
 252:	e8 d1 03 00 00       	call   628 <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 14 09 00 00       	push   $0x914
 25f:	68 e9 08 00 00       	push   $0x8e9
 264:	6a 01                	push   $0x1
 266:	e8 bd 03 00 00       	call   628 <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 fd 08 00 00       	push   $0x8fd
 273:	6a 01                	push   $0x1
 275:	e8 ae 03 00 00       	call   628 <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 9c 0d 00 00    	push   0xd9c
 283:	e8 7b 02 00 00       	call   503 <kill>
 288:	e8 46 02 00 00       	call   4d3 <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 f8 04 00 00       	call   78e <free>
   exit();
 296:	e8 38 02 00 00       	call   4d3 <exit>

0000029b <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	56                   	push   %esi
 29f:	53                   	push   %ebx
 2a0:	8b 75 08             	mov    0x8(%ebp),%esi
 2a3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2a6:	89 f0                	mov    %esi,%eax
 2a8:	89 d1                	mov    %edx,%ecx
 2aa:	83 c2 01             	add    $0x1,%edx
 2ad:	89 c3                	mov    %eax,%ebx
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	0f b6 09             	movzbl (%ecx),%ecx
 2b5:	88 0b                	mov    %cl,(%ebx)
 2b7:	84 c9                	test   %cl,%cl
 2b9:	75 ed                	jne    2a8 <strcpy+0xd>
    ;
  return os;
}
 2bb:	89 f0                	mov    %esi,%eax
 2bd:	5b                   	pop    %ebx
 2be:	5e                   	pop    %esi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    

000002c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c1:	55                   	push   %ebp
 2c2:	89 e5                	mov    %esp,%ebp
 2c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2ca:	eb 06                	jmp    2d2 <strcmp+0x11>
    p++, q++;
 2cc:	83 c1 01             	add    $0x1,%ecx
 2cf:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2d2:	0f b6 01             	movzbl (%ecx),%eax
 2d5:	84 c0                	test   %al,%al
 2d7:	74 04                	je     2dd <strcmp+0x1c>
 2d9:	3a 02                	cmp    (%edx),%al
 2db:	74 ef                	je     2cc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2dd:	0f b6 c0             	movzbl %al,%eax
 2e0:	0f b6 12             	movzbl (%edx),%edx
 2e3:	29 d0                	sub    %edx,%eax
}
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    

000002e7 <strlen>:

uint
strlen(const char *s)
{
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ed:	b8 00 00 00 00       	mov    $0x0,%eax
 2f2:	eb 03                	jmp    2f7 <strlen+0x10>
 2f4:	83 c0 01             	add    $0x1,%eax
 2f7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2fb:	75 f7                	jne    2f4 <strlen+0xd>
    ;
  return n;
}
 2fd:	5d                   	pop    %ebp
 2fe:	c3                   	ret    

000002ff <memset>:

void*
memset(void *dst, int c, uint n)
{
 2ff:	55                   	push   %ebp
 300:	89 e5                	mov    %esp,%ebp
 302:	57                   	push   %edi
 303:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 306:	89 d7                	mov    %edx,%edi
 308:	8b 4d 10             	mov    0x10(%ebp),%ecx
 30b:	8b 45 0c             	mov    0xc(%ebp),%eax
 30e:	fc                   	cld    
 30f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 311:	89 d0                	mov    %edx,%eax
 313:	8b 7d fc             	mov    -0x4(%ebp),%edi
 316:	c9                   	leave  
 317:	c3                   	ret    

00000318 <strchr>:

char*
strchr(const char *s, char c)
{
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 322:	eb 03                	jmp    327 <strchr+0xf>
 324:	83 c0 01             	add    $0x1,%eax
 327:	0f b6 10             	movzbl (%eax),%edx
 32a:	84 d2                	test   %dl,%dl
 32c:	74 06                	je     334 <strchr+0x1c>
    if(*s == c)
 32e:	38 ca                	cmp    %cl,%dl
 330:	75 f2                	jne    324 <strchr+0xc>
 332:	eb 05                	jmp    339 <strchr+0x21>
      return (char*)s;
  return 0;
 334:	b8 00 00 00 00       	mov    $0x0,%eax
}
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <gets>:

char*
gets(char *buf, int max)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	57                   	push   %edi
 33f:	56                   	push   %esi
 340:	53                   	push   %ebx
 341:	83 ec 1c             	sub    $0x1c,%esp
 344:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 347:	bb 00 00 00 00       	mov    $0x0,%ebx
 34c:	89 de                	mov    %ebx,%esi
 34e:	83 c3 01             	add    $0x1,%ebx
 351:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 354:	7d 2e                	jge    384 <gets+0x49>
    cc = read(0, &c, 1);
 356:	83 ec 04             	sub    $0x4,%esp
 359:	6a 01                	push   $0x1
 35b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 35e:	50                   	push   %eax
 35f:	6a 00                	push   $0x0
 361:	e8 85 01 00 00       	call   4eb <read>
    if(cc < 1)
 366:	83 c4 10             	add    $0x10,%esp
 369:	85 c0                	test   %eax,%eax
 36b:	7e 17                	jle    384 <gets+0x49>
      break;
    buf[i++] = c;
 36d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 371:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 374:	3c 0a                	cmp    $0xa,%al
 376:	0f 94 c2             	sete   %dl
 379:	3c 0d                	cmp    $0xd,%al
 37b:	0f 94 c0             	sete   %al
 37e:	08 c2                	or     %al,%dl
 380:	74 ca                	je     34c <gets+0x11>
    buf[i++] = c;
 382:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 384:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 388:	89 f8                	mov    %edi,%eax
 38a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38d:	5b                   	pop    %ebx
 38e:	5e                   	pop    %esi
 38f:	5f                   	pop    %edi
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <stat>:

int
stat(const char *n, struct stat *st)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	56                   	push   %esi
 396:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 397:	83 ec 08             	sub    $0x8,%esp
 39a:	6a 00                	push   $0x0
 39c:	ff 75 08             	push   0x8(%ebp)
 39f:	e8 6f 01 00 00       	call   513 <open>
  if(fd < 0)
 3a4:	83 c4 10             	add    $0x10,%esp
 3a7:	85 c0                	test   %eax,%eax
 3a9:	78 24                	js     3cf <stat+0x3d>
 3ab:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3ad:	83 ec 08             	sub    $0x8,%esp
 3b0:	ff 75 0c             	push   0xc(%ebp)
 3b3:	50                   	push   %eax
 3b4:	e8 72 01 00 00       	call   52b <fstat>
 3b9:	89 c6                	mov    %eax,%esi
  close(fd);
 3bb:	89 1c 24             	mov    %ebx,(%esp)
 3be:	e8 38 01 00 00       	call   4fb <close>
  return r;
 3c3:	83 c4 10             	add    $0x10,%esp
}
 3c6:	89 f0                	mov    %esi,%eax
 3c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3cb:	5b                   	pop    %ebx
 3cc:	5e                   	pop    %esi
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret    
    return -1;
 3cf:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d4:	eb f0                	jmp    3c6 <stat+0x34>

000003d6 <atoi>:

int
atoi(const char *s)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	53                   	push   %ebx
 3da:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3dd:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3e2:	eb 10                	jmp    3f4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3e4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3e7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ea:	83 c1 01             	add    $0x1,%ecx
 3ed:	0f be c0             	movsbl %al,%eax
 3f0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3f4:	0f b6 01             	movzbl (%ecx),%eax
 3f7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3fa:	80 fb 09             	cmp    $0x9,%bl
 3fd:	76 e5                	jbe    3e4 <atoi+0xe>
  return n;
}
 3ff:	89 d0                	mov    %edx,%eax
 401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 404:	c9                   	leave  
 405:	c3                   	ret    

00000406 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	56                   	push   %esi
 40a:	53                   	push   %ebx
 40b:	8b 75 08             	mov    0x8(%ebp),%esi
 40e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 411:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 414:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 416:	eb 0d                	jmp    425 <memmove+0x1f>
    *dst++ = *src++;
 418:	0f b6 01             	movzbl (%ecx),%eax
 41b:	88 02                	mov    %al,(%edx)
 41d:	8d 49 01             	lea    0x1(%ecx),%ecx
 420:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 423:	89 d8                	mov    %ebx,%eax
 425:	8d 58 ff             	lea    -0x1(%eax),%ebx
 428:	85 c0                	test   %eax,%eax
 42a:	7f ec                	jg     418 <memmove+0x12>
  return vdst;
}
 42c:	89 f0                	mov    %esi,%eax
 42e:	5b                   	pop    %ebx
 42f:	5e                   	pop    %esi
 430:	5d                   	pop    %ebp
 431:	c3                   	ret    

00000432 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 438:	68 00 20 00 00       	push   $0x2000
 43d:	e8 0c 04 00 00       	call   84e <malloc>
  if((uint)(stack) % PGSIZE != 0){
 442:	83 c4 10             	add    $0x10,%esp
 445:	a9 ff 0f 00 00       	test   $0xfff,%eax
 44a:	74 0a                	je     456 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 44c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 451:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 456:	50                   	push   %eax
 457:	ff 75 10             	push   0x10(%ebp)
 45a:	ff 75 0c             	push   0xc(%ebp)
 45d:	ff 75 08             	push   0x8(%ebp)
 460:	e8 0e 01 00 00       	call   573 <clone>
  return pid;
}
 465:	c9                   	leave  
 466:	c3                   	ret    

00000467 <thread_join>:
int
thread_join()
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	53                   	push   %ebx
 46b:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 46e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 471:	50                   	push   %eax
 472:	e8 04 01 00 00       	call   57b <join>
 477:	89 c3                	mov    %eax,%ebx
  free(stack);
 479:	83 c4 04             	add    $0x4,%esp
 47c:	ff 75 f4             	push   -0xc(%ebp)
 47f:	e8 0a 03 00 00       	call   78e <free>
  return pid;
}
 484:	89 d8                	mov    %ebx,%eax
 486:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 489:	c9                   	leave  
 48a:	c3                   	ret    

0000048b <lock_init>:
int
lock_init(lock_t * lock){
 48b:	55                   	push   %ebp
 48c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 48e:	8b 45 08             	mov    0x8(%ebp),%eax
 491:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 497:	b8 00 00 00 00       	mov    $0x0,%eax
 49c:	5d                   	pop    %ebp
 49d:	c3                   	ret    

0000049e <lock_acquire>:
int
lock_acquire(lock_t * lock){
 49e:	55                   	push   %ebp
 49f:	89 e5                	mov    %esp,%ebp
 4a1:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4a4:	b8 01 00 00 00       	mov    $0x1,%eax
 4a9:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 4ac:	83 f8 01             	cmp    $0x1,%eax
 4af:	74 f3                	je     4a4 <lock_acquire+0x6>
  {

  }
  return 0;
}
 4b1:	b8 00 00 00 00       	mov    $0x0,%eax
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    

000004b8 <lock_release>:
int
lock_release(lock_t * lock){
 4b8:	55                   	push   %ebp
 4b9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4bb:	8b 45 08             	mov    0x8(%ebp),%eax
 4be:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 4c4:	b8 00 00 00 00       	mov    $0x0,%eax
 4c9:	5d                   	pop    %ebp
 4ca:	c3                   	ret    

000004cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4cb:	b8 01 00 00 00       	mov    $0x1,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <exit>:
SYSCALL(exit)
 4d3:	b8 02 00 00 00       	mov    $0x2,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <wait>:
SYSCALL(wait)
 4db:	b8 03 00 00 00       	mov    $0x3,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <pipe>:
SYSCALL(pipe)
 4e3:	b8 04 00 00 00       	mov    $0x4,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <read>:
SYSCALL(read)
 4eb:	b8 05 00 00 00       	mov    $0x5,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <write>:
SYSCALL(write)
 4f3:	b8 10 00 00 00       	mov    $0x10,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <close>:
SYSCALL(close)
 4fb:	b8 15 00 00 00       	mov    $0x15,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <kill>:
SYSCALL(kill)
 503:	b8 06 00 00 00       	mov    $0x6,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <exec>:
SYSCALL(exec)
 50b:	b8 07 00 00 00       	mov    $0x7,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <open>:
SYSCALL(open)
 513:	b8 0f 00 00 00       	mov    $0xf,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <mknod>:
SYSCALL(mknod)
 51b:	b8 11 00 00 00       	mov    $0x11,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <unlink>:
SYSCALL(unlink)
 523:	b8 12 00 00 00       	mov    $0x12,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <fstat>:
SYSCALL(fstat)
 52b:	b8 08 00 00 00       	mov    $0x8,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <link>:
SYSCALL(link)
 533:	b8 13 00 00 00       	mov    $0x13,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <mkdir>:
SYSCALL(mkdir)
 53b:	b8 14 00 00 00       	mov    $0x14,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <chdir>:
SYSCALL(chdir)
 543:	b8 09 00 00 00       	mov    $0x9,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <dup>:
SYSCALL(dup)
 54b:	b8 0a 00 00 00       	mov    $0xa,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <getpid>:
SYSCALL(getpid)
 553:	b8 0b 00 00 00       	mov    $0xb,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <sbrk>:
SYSCALL(sbrk)
 55b:	b8 0c 00 00 00       	mov    $0xc,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <sleep>:
SYSCALL(sleep)
 563:	b8 0d 00 00 00       	mov    $0xd,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <uptime>:
SYSCALL(uptime)
 56b:	b8 0e 00 00 00       	mov    $0xe,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <clone>:
SYSCALL(clone)
 573:	b8 16 00 00 00       	mov    $0x16,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <join>:
SYSCALL(join)
 57b:	b8 17 00 00 00       	mov    $0x17,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	83 ec 1c             	sub    $0x1c,%esp
 589:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 58c:	6a 01                	push   $0x1
 58e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 591:	52                   	push   %edx
 592:	50                   	push   %eax
 593:	e8 5b ff ff ff       	call   4f3 <write>
}
 598:	83 c4 10             	add    $0x10,%esp
 59b:	c9                   	leave  
 59c:	c3                   	ret    

0000059d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 59d:	55                   	push   %ebp
 59e:	89 e5                	mov    %esp,%ebp
 5a0:	57                   	push   %edi
 5a1:	56                   	push   %esi
 5a2:	53                   	push   %ebx
 5a3:	83 ec 2c             	sub    $0x2c,%esp
 5a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a9:	89 d0                	mov    %edx,%eax
 5ab:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ad:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5b1:	0f 95 c1             	setne  %cl
 5b4:	c1 ea 1f             	shr    $0x1f,%edx
 5b7:	84 d1                	test   %dl,%cl
 5b9:	74 44                	je     5ff <printint+0x62>
    neg = 1;
    x = -xx;
 5bb:	f7 d8                	neg    %eax
 5bd:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5bf:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5c6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5cb:	89 c8                	mov    %ecx,%eax
 5cd:	ba 00 00 00 00       	mov    $0x0,%edx
 5d2:	f7 f6                	div    %esi
 5d4:	89 df                	mov    %ebx,%edi
 5d6:	83 c3 01             	add    $0x1,%ebx
 5d9:	0f b6 92 30 0a 00 00 	movzbl 0xa30(%edx),%edx
 5e0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5e4:	89 ca                	mov    %ecx,%edx
 5e6:	89 c1                	mov    %eax,%ecx
 5e8:	39 d6                	cmp    %edx,%esi
 5ea:	76 df                	jbe    5cb <printint+0x2e>
  if(neg)
 5ec:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5f0:	74 31                	je     623 <printint+0x86>
    buf[i++] = '-';
 5f2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5f7:	8d 5f 02             	lea    0x2(%edi),%ebx
 5fa:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5fd:	eb 17                	jmp    616 <printint+0x79>
    x = xx;
 5ff:	89 c1                	mov    %eax,%ecx
  neg = 0;
 601:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 608:	eb bc                	jmp    5c6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 60a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 60f:	89 f0                	mov    %esi,%eax
 611:	e8 6d ff ff ff       	call   583 <putc>
  while(--i >= 0)
 616:	83 eb 01             	sub    $0x1,%ebx
 619:	79 ef                	jns    60a <printint+0x6d>
}
 61b:	83 c4 2c             	add    $0x2c,%esp
 61e:	5b                   	pop    %ebx
 61f:	5e                   	pop    %esi
 620:	5f                   	pop    %edi
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    
 623:	8b 75 d0             	mov    -0x30(%ebp),%esi
 626:	eb ee                	jmp    616 <printint+0x79>

00000628 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 628:	55                   	push   %ebp
 629:	89 e5                	mov    %esp,%ebp
 62b:	57                   	push   %edi
 62c:	56                   	push   %esi
 62d:	53                   	push   %ebx
 62e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 631:	8d 45 10             	lea    0x10(%ebp),%eax
 634:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 637:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 63c:	bb 00 00 00 00       	mov    $0x0,%ebx
 641:	eb 14                	jmp    657 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 643:	89 fa                	mov    %edi,%edx
 645:	8b 45 08             	mov    0x8(%ebp),%eax
 648:	e8 36 ff ff ff       	call   583 <putc>
 64d:	eb 05                	jmp    654 <printf+0x2c>
      }
    } else if(state == '%'){
 64f:	83 fe 25             	cmp    $0x25,%esi
 652:	74 25                	je     679 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 654:	83 c3 01             	add    $0x1,%ebx
 657:	8b 45 0c             	mov    0xc(%ebp),%eax
 65a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 65e:	84 c0                	test   %al,%al
 660:	0f 84 20 01 00 00    	je     786 <printf+0x15e>
    c = fmt[i] & 0xff;
 666:	0f be f8             	movsbl %al,%edi
 669:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 66c:	85 f6                	test   %esi,%esi
 66e:	75 df                	jne    64f <printf+0x27>
      if(c == '%'){
 670:	83 f8 25             	cmp    $0x25,%eax
 673:	75 ce                	jne    643 <printf+0x1b>
        state = '%';
 675:	89 c6                	mov    %eax,%esi
 677:	eb db                	jmp    654 <printf+0x2c>
      if(c == 'd'){
 679:	83 f8 25             	cmp    $0x25,%eax
 67c:	0f 84 cf 00 00 00    	je     751 <printf+0x129>
 682:	0f 8c dd 00 00 00    	jl     765 <printf+0x13d>
 688:	83 f8 78             	cmp    $0x78,%eax
 68b:	0f 8f d4 00 00 00    	jg     765 <printf+0x13d>
 691:	83 f8 63             	cmp    $0x63,%eax
 694:	0f 8c cb 00 00 00    	jl     765 <printf+0x13d>
 69a:	83 e8 63             	sub    $0x63,%eax
 69d:	83 f8 15             	cmp    $0x15,%eax
 6a0:	0f 87 bf 00 00 00    	ja     765 <printf+0x13d>
 6a6:	ff 24 85 d8 09 00 00 	jmp    *0x9d8(,%eax,4)
        printint(fd, *ap, 10, 1);
 6ad:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b0:	8b 17                	mov    (%edi),%edx
 6b2:	83 ec 0c             	sub    $0xc,%esp
 6b5:	6a 01                	push   $0x1
 6b7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6bc:	8b 45 08             	mov    0x8(%ebp),%eax
 6bf:	e8 d9 fe ff ff       	call   59d <printint>
        ap++;
 6c4:	83 c7 04             	add    $0x4,%edi
 6c7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ca:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6cd:	be 00 00 00 00       	mov    $0x0,%esi
 6d2:	eb 80                	jmp    654 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6d4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d7:	8b 17                	mov    (%edi),%edx
 6d9:	83 ec 0c             	sub    $0xc,%esp
 6dc:	6a 00                	push   $0x0
 6de:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e3:	8b 45 08             	mov    0x8(%ebp),%eax
 6e6:	e8 b2 fe ff ff       	call   59d <printint>
        ap++;
 6eb:	83 c7 04             	add    $0x4,%edi
 6ee:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f4:	be 00 00 00 00       	mov    $0x0,%esi
 6f9:	e9 56 ff ff ff       	jmp    654 <printf+0x2c>
        s = (char*)*ap;
 6fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 701:	8b 30                	mov    (%eax),%esi
        ap++;
 703:	83 c0 04             	add    $0x4,%eax
 706:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 709:	85 f6                	test   %esi,%esi
 70b:	75 15                	jne    722 <printf+0xfa>
          s = "(null)";
 70d:	be ce 09 00 00       	mov    $0x9ce,%esi
 712:	eb 0e                	jmp    722 <printf+0xfa>
          putc(fd, *s);
 714:	0f be d2             	movsbl %dl,%edx
 717:	8b 45 08             	mov    0x8(%ebp),%eax
 71a:	e8 64 fe ff ff       	call   583 <putc>
          s++;
 71f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 722:	0f b6 16             	movzbl (%esi),%edx
 725:	84 d2                	test   %dl,%dl
 727:	75 eb                	jne    714 <printf+0xec>
      state = 0;
 729:	be 00 00 00 00       	mov    $0x0,%esi
 72e:	e9 21 ff ff ff       	jmp    654 <printf+0x2c>
        putc(fd, *ap);
 733:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 736:	0f be 17             	movsbl (%edi),%edx
 739:	8b 45 08             	mov    0x8(%ebp),%eax
 73c:	e8 42 fe ff ff       	call   583 <putc>
        ap++;
 741:	83 c7 04             	add    $0x4,%edi
 744:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 747:	be 00 00 00 00       	mov    $0x0,%esi
 74c:	e9 03 ff ff ff       	jmp    654 <printf+0x2c>
        putc(fd, c);
 751:	89 fa                	mov    %edi,%edx
 753:	8b 45 08             	mov    0x8(%ebp),%eax
 756:	e8 28 fe ff ff       	call   583 <putc>
      state = 0;
 75b:	be 00 00 00 00       	mov    $0x0,%esi
 760:	e9 ef fe ff ff       	jmp    654 <printf+0x2c>
        putc(fd, '%');
 765:	ba 25 00 00 00       	mov    $0x25,%edx
 76a:	8b 45 08             	mov    0x8(%ebp),%eax
 76d:	e8 11 fe ff ff       	call   583 <putc>
        putc(fd, c);
 772:	89 fa                	mov    %edi,%edx
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	e8 07 fe ff ff       	call   583 <putc>
      state = 0;
 77c:	be 00 00 00 00       	mov    $0x0,%esi
 781:	e9 ce fe ff ff       	jmp    654 <printf+0x2c>
    }
  }
}
 786:	8d 65 f4             	lea    -0xc(%ebp),%esp
 789:	5b                   	pop    %ebx
 78a:	5e                   	pop    %esi
 78b:	5f                   	pop    %edi
 78c:	5d                   	pop    %ebp
 78d:	c3                   	ret    

0000078e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 78e:	55                   	push   %ebp
 78f:	89 e5                	mov    %esp,%ebp
 791:	57                   	push   %edi
 792:	56                   	push   %esi
 793:	53                   	push   %ebx
 794:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 797:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79a:	a1 a0 0d 00 00       	mov    0xda0,%eax
 79f:	eb 02                	jmp    7a3 <free+0x15>
 7a1:	89 d0                	mov    %edx,%eax
 7a3:	39 c8                	cmp    %ecx,%eax
 7a5:	73 04                	jae    7ab <free+0x1d>
 7a7:	39 08                	cmp    %ecx,(%eax)
 7a9:	77 12                	ja     7bd <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ab:	8b 10                	mov    (%eax),%edx
 7ad:	39 c2                	cmp    %eax,%edx
 7af:	77 f0                	ja     7a1 <free+0x13>
 7b1:	39 c8                	cmp    %ecx,%eax
 7b3:	72 08                	jb     7bd <free+0x2f>
 7b5:	39 ca                	cmp    %ecx,%edx
 7b7:	77 04                	ja     7bd <free+0x2f>
 7b9:	89 d0                	mov    %edx,%eax
 7bb:	eb e6                	jmp    7a3 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7bd:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7c0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7c3:	8b 10                	mov    (%eax),%edx
 7c5:	39 d7                	cmp    %edx,%edi
 7c7:	74 19                	je     7e2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7c9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cc:	8b 50 04             	mov    0x4(%eax),%edx
 7cf:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d2:	39 ce                	cmp    %ecx,%esi
 7d4:	74 1b                	je     7f1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7d6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7d8:	a3 a0 0d 00 00       	mov    %eax,0xda0
}
 7dd:	5b                   	pop    %ebx
 7de:	5e                   	pop    %esi
 7df:	5f                   	pop    %edi
 7e0:	5d                   	pop    %ebp
 7e1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7e2:	03 72 04             	add    0x4(%edx),%esi
 7e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e8:	8b 10                	mov    (%eax),%edx
 7ea:	8b 12                	mov    (%edx),%edx
 7ec:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7ef:	eb db                	jmp    7cc <free+0x3e>
    p->s.size += bp->s.size;
 7f1:	03 53 fc             	add    -0x4(%ebx),%edx
 7f4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7fa:	89 10                	mov    %edx,(%eax)
 7fc:	eb da                	jmp    7d8 <free+0x4a>

000007fe <morecore>:

static Header*
morecore(uint nu)
{
 7fe:	55                   	push   %ebp
 7ff:	89 e5                	mov    %esp,%ebp
 801:	53                   	push   %ebx
 802:	83 ec 04             	sub    $0x4,%esp
 805:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 807:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 80c:	77 05                	ja     813 <morecore+0x15>
    nu = 4096;
 80e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 813:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 81a:	83 ec 0c             	sub    $0xc,%esp
 81d:	50                   	push   %eax
 81e:	e8 38 fd ff ff       	call   55b <sbrk>
  if(p == (char*)-1)
 823:	83 c4 10             	add    $0x10,%esp
 826:	83 f8 ff             	cmp    $0xffffffff,%eax
 829:	74 1c                	je     847 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 82b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 82e:	83 c0 08             	add    $0x8,%eax
 831:	83 ec 0c             	sub    $0xc,%esp
 834:	50                   	push   %eax
 835:	e8 54 ff ff ff       	call   78e <free>
  return freep;
 83a:	a1 a0 0d 00 00       	mov    0xda0,%eax
 83f:	83 c4 10             	add    $0x10,%esp
}
 842:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 845:	c9                   	leave  
 846:	c3                   	ret    
    return 0;
 847:	b8 00 00 00 00       	mov    $0x0,%eax
 84c:	eb f4                	jmp    842 <morecore+0x44>

0000084e <malloc>:

void*
malloc(uint nbytes)
{
 84e:	55                   	push   %ebp
 84f:	89 e5                	mov    %esp,%ebp
 851:	53                   	push   %ebx
 852:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 855:	8b 45 08             	mov    0x8(%ebp),%eax
 858:	8d 58 07             	lea    0x7(%eax),%ebx
 85b:	c1 eb 03             	shr    $0x3,%ebx
 85e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 861:	8b 0d a0 0d 00 00    	mov    0xda0,%ecx
 867:	85 c9                	test   %ecx,%ecx
 869:	74 04                	je     86f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86b:	8b 01                	mov    (%ecx),%eax
 86d:	eb 4a                	jmp    8b9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 86f:	c7 05 a0 0d 00 00 a4 	movl   $0xda4,0xda0
 876:	0d 00 00 
 879:	c7 05 a4 0d 00 00 a4 	movl   $0xda4,0xda4
 880:	0d 00 00 
    base.s.size = 0;
 883:	c7 05 a8 0d 00 00 00 	movl   $0x0,0xda8
 88a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 88d:	b9 a4 0d 00 00       	mov    $0xda4,%ecx
 892:	eb d7                	jmp    86b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 894:	74 19                	je     8af <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 896:	29 da                	sub    %ebx,%edx
 898:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 89b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 89e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8a1:	89 0d a0 0d 00 00    	mov    %ecx,0xda0
      return (void*)(p + 1);
 8a7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ad:	c9                   	leave  
 8ae:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8af:	8b 10                	mov    (%eax),%edx
 8b1:	89 11                	mov    %edx,(%ecx)
 8b3:	eb ec                	jmp    8a1 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b5:	89 c1                	mov    %eax,%ecx
 8b7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8b9:	8b 50 04             	mov    0x4(%eax),%edx
 8bc:	39 da                	cmp    %ebx,%edx
 8be:	73 d4                	jae    894 <malloc+0x46>
    if(p == freep)
 8c0:	39 05 a0 0d 00 00    	cmp    %eax,0xda0
 8c6:	75 ed                	jne    8b5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8c8:	89 d8                	mov    %ebx,%eax
 8ca:	e8 2f ff ff ff       	call   7fe <morecore>
 8cf:	85 c0                	test   %eax,%eax
 8d1:	75 e2                	jne    8b5 <malloc+0x67>
 8d3:	eb d5                	jmp    8aa <malloc+0x5c>
