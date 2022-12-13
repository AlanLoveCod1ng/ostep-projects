
_test_8:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 5c 0e 00 00       	mov    0xe5c,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 d4 09 00 00       	push   $0x9d4
  31:	68 dd 09 00 00       	push   $0x9dd
  36:	6a 01                	push   $0x1
  38:	e8 e9 06 00 00       	call   726 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 1c 0a 00 00       	push   $0xa1c
  45:	68 f0 09 00 00       	push   $0x9f0
  4a:	6a 01                	push   $0x1
  4c:	e8 d5 06 00 00       	call   726 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 04 0a 00 00       	push   $0xa04
  59:	6a 01                	push   $0x1
  5b:	e8 c6 06 00 00       	call   726 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 60 0e 00 00    	push   0xe60
  69:	e8 93 05 00 00       	call   601 <kill>
  6e:	e8 5e 05 00 00       	call   5d1 <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 d4 09 00 00       	push   $0x9d4
  7a:	68 dd 09 00 00       	push   $0x9dd
  7f:	6a 01                	push   $0x1
  81:	e8 a0 06 00 00       	call   726 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 e5 09 00 00       	push   $0x9e5
  8e:	68 f0 09 00 00       	push   $0x9f0
  93:	6a 01                	push   $0x1
  95:	e8 8c 06 00 00       	call   726 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 04 0a 00 00       	push   $0xa04
  a2:	6a 01                	push   $0x1
  a4:	e8 7d 06 00 00       	call   726 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 60 0e 00 00    	push   0xe60
  b2:	e8 4a 05 00 00       	call   601 <kill>
  b7:	e8 15 05 00 00       	call   5d1 <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 d4 09 00 00       	push   $0x9d4
  c3:	68 dd 09 00 00       	push   $0x9dd
  c8:	6a 01                	push   $0x1
  ca:	e8 57 06 00 00       	call   726 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 11 0a 00 00       	push   $0xa11
  d7:	68 f0 09 00 00       	push   $0x9f0
  dc:	6a 01                	push   $0x1
  de:	e8 43 06 00 00       	call   726 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 04 0a 00 00       	push   $0xa04
  eb:	6a 01                	push   $0x1
  ed:	e8 34 06 00 00       	call   726 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 60 0e 00 00    	push   0xe60
  fb:	e8 01 05 00 00       	call   601 <kill>
 100:	e8 cc 04 00 00       	call   5d1 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 5c 0e 00 00       	mov    %eax,0xe5c
   exit();
 10d:	e8 bf 04 00 00       	call   5d1 <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 26 05 00 00       	call   651 <getpid>
 12b:	a3 60 0e 00 00       	mov    %eax,0xe60
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 0f 08 00 00       	call   94c <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 d4 09 00 00       	push   $0x9d4
 15f:	68 dd 09 00 00       	push   $0x9dd
 164:	6a 01                	push   $0x1
 166:	e8 bb 05 00 00       	call   726 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 28 0a 00 00       	push   $0xa28
 173:	68 f0 09 00 00       	push   $0x9f0
 178:	6a 01                	push   $0x1
 17a:	e8 a7 05 00 00       	call   726 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 04 0a 00 00       	push   $0xa04
 187:	6a 01                	push   $0x1
 189:	e8 98 05 00 00       	call   726 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 60 0e 00 00    	push   0xe60
 197:	e8 65 04 00 00       	call   601 <kill>
 19c:	e8 30 04 00 00       	call   5d1 <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 ad 04 00 00       	call   671 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 87 04 00 00       	call   661 <sleep>
   assert(wait() == -1);
 1da:	e8 fa 03 00 00       	call   5d9 <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 d4 09 00 00       	push   $0x9d4
 1f2:	68 dd 09 00 00       	push   $0x9dd
 1f7:	6a 01                	push   $0x1
 1f9:	e8 28 05 00 00       	call   726 <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 40 0a 00 00       	push   $0xa40
 206:	68 f0 09 00 00       	push   $0x9f0
 20b:	6a 01                	push   $0x1
 20d:	e8 14 05 00 00       	call   726 <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 04 0a 00 00       	push   $0xa04
 21a:	6a 01                	push   $0x1
 21c:	e8 05 05 00 00       	call   726 <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 60 0e 00 00    	push   0xe60
 22a:	e8 d2 03 00 00       	call   601 <kill>
 22f:	e8 9d 03 00 00       	call   5d1 <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 d4 09 00 00       	push   $0x9d4
 23b:	68 dd 09 00 00       	push   $0x9dd
 240:	6a 01                	push   $0x1
 242:	e8 df 04 00 00       	call   726 <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 32 0a 00 00       	push   $0xa32
 24f:	68 f0 09 00 00       	push   $0x9f0
 254:	6a 01                	push   $0x1
 256:	e8 cb 04 00 00       	call   726 <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 04 0a 00 00       	push   $0xa04
 263:	6a 01                	push   $0x1
 265:	e8 bc 04 00 00       	call   726 <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 60 0e 00 00    	push   0xe60
 273:	e8 89 03 00 00       	call   601 <kill>
 278:	e8 54 03 00 00       	call   5d1 <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 f0 03 00 00       	call   679 <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 d4 09 00 00       	push   $0x9d4
 2a0:	68 dd 09 00 00       	push   $0x9dd
 2a5:	6a 01                	push   $0x1
 2a7:	e8 7a 04 00 00       	call   726 <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 63 0a 00 00       	push   $0xa63
 2b4:	68 f0 09 00 00       	push   $0x9f0
 2b9:	6a 01                	push   $0x1
 2bb:	e8 66 04 00 00       	call   726 <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 04 0a 00 00       	push   $0xa04
 2c8:	6a 01                	push   $0x1
 2ca:	e8 57 04 00 00       	call   726 <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 60 0e 00 00    	push   0xe60
 2d8:	e8 24 03 00 00       	call   601 <kill>
 2dd:	e8 ef 02 00 00       	call   5d1 <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 d4 09 00 00       	push   $0x9d4
 2e9:	68 dd 09 00 00       	push   $0x9dd
 2ee:	6a 01                	push   $0x1
 2f0:	e8 31 04 00 00       	call   726 <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 4d 0a 00 00       	push   $0xa4d
 2fd:	68 f0 09 00 00       	push   $0x9f0
 302:	6a 01                	push   $0x1
 304:	e8 1d 04 00 00       	call   726 <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 04 0a 00 00       	push   $0xa04
 311:	6a 01                	push   $0x1
 313:	e8 0e 04 00 00       	call   726 <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 60 0e 00 00    	push   0xe60
 321:	e8 db 02 00 00       	call   601 <kill>
 326:	e8 a6 02 00 00       	call   5d1 <exit>
   assert(global == 2);
 32b:	83 3d 5c 0e 00 00 02 	cmpl   $0x2,0xe5c
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 d4 09 00 00       	push   $0x9d4
 33b:	68 dd 09 00 00       	push   $0x9dd
 340:	6a 01                	push   $0x1
 342:	e8 df 03 00 00       	call   726 <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 77 0a 00 00       	push   $0xa77
 34f:	68 f0 09 00 00       	push   $0x9f0
 354:	6a 01                	push   $0x1
 356:	e8 cb 03 00 00       	call   726 <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 04 0a 00 00       	push   $0xa04
 363:	6a 01                	push   $0x1
 365:	e8 bc 03 00 00       	call   726 <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 60 0e 00 00    	push   0xe60
 373:	e8 89 02 00 00       	call   601 <kill>
 378:	e8 54 02 00 00       	call   5d1 <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 83 0a 00 00       	push   $0xa83
 385:	6a 01                	push   $0x1
 387:	e8 9a 03 00 00       	call   726 <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 f8 04 00 00       	call   88c <free>
   exit();
 394:	e8 38 02 00 00       	call   5d1 <exit>

00000399 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	56                   	push   %esi
 39d:	53                   	push   %ebx
 39e:	8b 75 08             	mov    0x8(%ebp),%esi
 3a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3a4:	89 f0                	mov    %esi,%eax
 3a6:	89 d1                	mov    %edx,%ecx
 3a8:	83 c2 01             	add    $0x1,%edx
 3ab:	89 c3                	mov    %eax,%ebx
 3ad:	83 c0 01             	add    $0x1,%eax
 3b0:	0f b6 09             	movzbl (%ecx),%ecx
 3b3:	88 0b                	mov    %cl,(%ebx)
 3b5:	84 c9                	test   %cl,%cl
 3b7:	75 ed                	jne    3a6 <strcpy+0xd>
    ;
  return os;
}
 3b9:	89 f0                	mov    %esi,%eax
 3bb:	5b                   	pop    %ebx
 3bc:	5e                   	pop    %esi
 3bd:	5d                   	pop    %ebp
 3be:	c3                   	ret    

000003bf <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3c8:	eb 06                	jmp    3d0 <strcmp+0x11>
    p++, q++;
 3ca:	83 c1 01             	add    $0x1,%ecx
 3cd:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3d0:	0f b6 01             	movzbl (%ecx),%eax
 3d3:	84 c0                	test   %al,%al
 3d5:	74 04                	je     3db <strcmp+0x1c>
 3d7:	3a 02                	cmp    (%edx),%al
 3d9:	74 ef                	je     3ca <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3db:	0f b6 c0             	movzbl %al,%eax
 3de:	0f b6 12             	movzbl (%edx),%edx
 3e1:	29 d0                	sub    %edx,%eax
}
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <strlen>:

uint
strlen(const char *s)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3eb:	b8 00 00 00 00       	mov    $0x0,%eax
 3f0:	eb 03                	jmp    3f5 <strlen+0x10>
 3f2:	83 c0 01             	add    $0x1,%eax
 3f5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3f9:	75 f7                	jne    3f2 <strlen+0xd>
    ;
  return n;
}
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    

000003fd <memset>:

void*
memset(void *dst, int c, uint n)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	57                   	push   %edi
 401:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 404:	89 d7                	mov    %edx,%edi
 406:	8b 4d 10             	mov    0x10(%ebp),%ecx
 409:	8b 45 0c             	mov    0xc(%ebp),%eax
 40c:	fc                   	cld    
 40d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 40f:	89 d0                	mov    %edx,%eax
 411:	8b 7d fc             	mov    -0x4(%ebp),%edi
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <strchr>:

char*
strchr(const char *s, char c)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	8b 45 08             	mov    0x8(%ebp),%eax
 41c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 420:	eb 03                	jmp    425 <strchr+0xf>
 422:	83 c0 01             	add    $0x1,%eax
 425:	0f b6 10             	movzbl (%eax),%edx
 428:	84 d2                	test   %dl,%dl
 42a:	74 06                	je     432 <strchr+0x1c>
    if(*s == c)
 42c:	38 ca                	cmp    %cl,%dl
 42e:	75 f2                	jne    422 <strchr+0xc>
 430:	eb 05                	jmp    437 <strchr+0x21>
      return (char*)s;
  return 0;
 432:	b8 00 00 00 00       	mov    $0x0,%eax
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    

00000439 <gets>:

char*
gets(char *buf, int max)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	83 ec 1c             	sub    $0x1c,%esp
 442:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 445:	bb 00 00 00 00       	mov    $0x0,%ebx
 44a:	89 de                	mov    %ebx,%esi
 44c:	83 c3 01             	add    $0x1,%ebx
 44f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 452:	7d 2e                	jge    482 <gets+0x49>
    cc = read(0, &c, 1);
 454:	83 ec 04             	sub    $0x4,%esp
 457:	6a 01                	push   $0x1
 459:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45c:	50                   	push   %eax
 45d:	6a 00                	push   $0x0
 45f:	e8 85 01 00 00       	call   5e9 <read>
    if(cc < 1)
 464:	83 c4 10             	add    $0x10,%esp
 467:	85 c0                	test   %eax,%eax
 469:	7e 17                	jle    482 <gets+0x49>
      break;
    buf[i++] = c;
 46b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 46f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 472:	3c 0a                	cmp    $0xa,%al
 474:	0f 94 c2             	sete   %dl
 477:	3c 0d                	cmp    $0xd,%al
 479:	0f 94 c0             	sete   %al
 47c:	08 c2                	or     %al,%dl
 47e:	74 ca                	je     44a <gets+0x11>
    buf[i++] = c;
 480:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 482:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 486:	89 f8                	mov    %edi,%eax
 488:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48b:	5b                   	pop    %ebx
 48c:	5e                   	pop    %esi
 48d:	5f                   	pop    %edi
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    

00000490 <stat>:

int
stat(const char *n, struct stat *st)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	56                   	push   %esi
 494:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 495:	83 ec 08             	sub    $0x8,%esp
 498:	6a 00                	push   $0x0
 49a:	ff 75 08             	push   0x8(%ebp)
 49d:	e8 6f 01 00 00       	call   611 <open>
  if(fd < 0)
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	85 c0                	test   %eax,%eax
 4a7:	78 24                	js     4cd <stat+0x3d>
 4a9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4ab:	83 ec 08             	sub    $0x8,%esp
 4ae:	ff 75 0c             	push   0xc(%ebp)
 4b1:	50                   	push   %eax
 4b2:	e8 72 01 00 00       	call   629 <fstat>
 4b7:	89 c6                	mov    %eax,%esi
  close(fd);
 4b9:	89 1c 24             	mov    %ebx,(%esp)
 4bc:	e8 38 01 00 00       	call   5f9 <close>
  return r;
 4c1:	83 c4 10             	add    $0x10,%esp
}
 4c4:	89 f0                	mov    %esi,%eax
 4c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    
    return -1;
 4cd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4d2:	eb f0                	jmp    4c4 <stat+0x34>

000004d4 <atoi>:

int
atoi(const char *s)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	53                   	push   %ebx
 4d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4db:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4e0:	eb 10                	jmp    4f2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4e2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4e5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4e8:	83 c1 01             	add    $0x1,%ecx
 4eb:	0f be c0             	movsbl %al,%eax
 4ee:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4f2:	0f b6 01             	movzbl (%ecx),%eax
 4f5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4f8:	80 fb 09             	cmp    $0x9,%bl
 4fb:	76 e5                	jbe    4e2 <atoi+0xe>
  return n;
}
 4fd:	89 d0                	mov    %edx,%eax
 4ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 502:	c9                   	leave  
 503:	c3                   	ret    

00000504 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	56                   	push   %esi
 508:	53                   	push   %ebx
 509:	8b 75 08             	mov    0x8(%ebp),%esi
 50c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 50f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 512:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 514:	eb 0d                	jmp    523 <memmove+0x1f>
    *dst++ = *src++;
 516:	0f b6 01             	movzbl (%ecx),%eax
 519:	88 02                	mov    %al,(%edx)
 51b:	8d 49 01             	lea    0x1(%ecx),%ecx
 51e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 521:	89 d8                	mov    %ebx,%eax
 523:	8d 58 ff             	lea    -0x1(%eax),%ebx
 526:	85 c0                	test   %eax,%eax
 528:	7f ec                	jg     516 <memmove+0x12>
  return vdst;
}
 52a:	89 f0                	mov    %esi,%eax
 52c:	5b                   	pop    %ebx
 52d:	5e                   	pop    %esi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    

00000530 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 536:	68 00 20 00 00       	push   $0x2000
 53b:	e8 0c 04 00 00       	call   94c <malloc>
  if((uint)(stack) % PGSIZE != 0){
 540:	83 c4 10             	add    $0x10,%esp
 543:	a9 ff 0f 00 00       	test   $0xfff,%eax
 548:	74 0a                	je     554 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 54a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 54f:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 554:	50                   	push   %eax
 555:	ff 75 10             	push   0x10(%ebp)
 558:	ff 75 0c             	push   0xc(%ebp)
 55b:	ff 75 08             	push   0x8(%ebp)
 55e:	e8 0e 01 00 00       	call   671 <clone>
  return pid;
}
 563:	c9                   	leave  
 564:	c3                   	ret    

00000565 <thread_join>:
int
thread_join()
{
 565:	55                   	push   %ebp
 566:	89 e5                	mov    %esp,%ebp
 568:	53                   	push   %ebx
 569:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 56c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 56f:	50                   	push   %eax
 570:	e8 04 01 00 00       	call   679 <join>
 575:	89 c3                	mov    %eax,%ebx
  free(stack);
 577:	83 c4 04             	add    $0x4,%esp
 57a:	ff 75 f4             	push   -0xc(%ebp)
 57d:	e8 0a 03 00 00       	call   88c <free>
  return pid;
}
 582:	89 d8                	mov    %ebx,%eax
 584:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 587:	c9                   	leave  
 588:	c3                   	ret    

00000589 <lock_init>:
int
lock_init(lock_t * lock){
 589:	55                   	push   %ebp
 58a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 58c:	8b 45 08             	mov    0x8(%ebp),%eax
 58f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 595:	b8 00 00 00 00       	mov    $0x0,%eax
 59a:	5d                   	pop    %ebp
 59b:	c3                   	ret    

0000059c <lock_acquire>:
int
lock_acquire(lock_t * lock){
 59c:	55                   	push   %ebp
 59d:	89 e5                	mov    %esp,%ebp
 59f:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5a2:	b8 01 00 00 00       	mov    $0x1,%eax
 5a7:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 5aa:	83 f8 01             	cmp    $0x1,%eax
 5ad:	74 f3                	je     5a2 <lock_acquire+0x6>
  {

  }
  return 0;
}
 5af:	b8 00 00 00 00       	mov    $0x0,%eax
 5b4:	5d                   	pop    %ebp
 5b5:	c3                   	ret    

000005b6 <lock_release>:
int
lock_release(lock_t * lock){
 5b6:	55                   	push   %ebp
 5b7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
 5bc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 5c2:	b8 00 00 00 00       	mov    $0x0,%eax
 5c7:	5d                   	pop    %ebp
 5c8:	c3                   	ret    

000005c9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c9:	b8 01 00 00 00       	mov    $0x1,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <exit>:
SYSCALL(exit)
 5d1:	b8 02 00 00 00       	mov    $0x2,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <wait>:
SYSCALL(wait)
 5d9:	b8 03 00 00 00       	mov    $0x3,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <pipe>:
SYSCALL(pipe)
 5e1:	b8 04 00 00 00       	mov    $0x4,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <read>:
SYSCALL(read)
 5e9:	b8 05 00 00 00       	mov    $0x5,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <write>:
SYSCALL(write)
 5f1:	b8 10 00 00 00       	mov    $0x10,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <close>:
SYSCALL(close)
 5f9:	b8 15 00 00 00       	mov    $0x15,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <kill>:
SYSCALL(kill)
 601:	b8 06 00 00 00       	mov    $0x6,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <exec>:
SYSCALL(exec)
 609:	b8 07 00 00 00       	mov    $0x7,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <open>:
SYSCALL(open)
 611:	b8 0f 00 00 00       	mov    $0xf,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <mknod>:
SYSCALL(mknod)
 619:	b8 11 00 00 00       	mov    $0x11,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <unlink>:
SYSCALL(unlink)
 621:	b8 12 00 00 00       	mov    $0x12,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <fstat>:
SYSCALL(fstat)
 629:	b8 08 00 00 00       	mov    $0x8,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <link>:
SYSCALL(link)
 631:	b8 13 00 00 00       	mov    $0x13,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <mkdir>:
SYSCALL(mkdir)
 639:	b8 14 00 00 00       	mov    $0x14,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <chdir>:
SYSCALL(chdir)
 641:	b8 09 00 00 00       	mov    $0x9,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <dup>:
SYSCALL(dup)
 649:	b8 0a 00 00 00       	mov    $0xa,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <getpid>:
SYSCALL(getpid)
 651:	b8 0b 00 00 00       	mov    $0xb,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <sbrk>:
SYSCALL(sbrk)
 659:	b8 0c 00 00 00       	mov    $0xc,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <sleep>:
SYSCALL(sleep)
 661:	b8 0d 00 00 00       	mov    $0xd,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <uptime>:
SYSCALL(uptime)
 669:	b8 0e 00 00 00       	mov    $0xe,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <clone>:
SYSCALL(clone)
 671:	b8 16 00 00 00       	mov    $0x16,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <join>:
SYSCALL(join)
 679:	b8 17 00 00 00       	mov    $0x17,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 681:	55                   	push   %ebp
 682:	89 e5                	mov    %esp,%ebp
 684:	83 ec 1c             	sub    $0x1c,%esp
 687:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 68a:	6a 01                	push   $0x1
 68c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 68f:	52                   	push   %edx
 690:	50                   	push   %eax
 691:	e8 5b ff ff ff       	call   5f1 <write>
}
 696:	83 c4 10             	add    $0x10,%esp
 699:	c9                   	leave  
 69a:	c3                   	ret    

0000069b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 69b:	55                   	push   %ebp
 69c:	89 e5                	mov    %esp,%ebp
 69e:	57                   	push   %edi
 69f:	56                   	push   %esi
 6a0:	53                   	push   %ebx
 6a1:	83 ec 2c             	sub    $0x2c,%esp
 6a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6a7:	89 d0                	mov    %edx,%eax
 6a9:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6ab:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6af:	0f 95 c1             	setne  %cl
 6b2:	c1 ea 1f             	shr    $0x1f,%edx
 6b5:	84 d1                	test   %dl,%cl
 6b7:	74 44                	je     6fd <printint+0x62>
    neg = 1;
    x = -xx;
 6b9:	f7 d8                	neg    %eax
 6bb:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6bd:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6c4:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6c9:	89 c8                	mov    %ecx,%eax
 6cb:	ba 00 00 00 00       	mov    $0x0,%edx
 6d0:	f7 f6                	div    %esi
 6d2:	89 df                	mov    %ebx,%edi
 6d4:	83 c3 01             	add    $0x1,%ebx
 6d7:	0f b6 92 f0 0a 00 00 	movzbl 0xaf0(%edx),%edx
 6de:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6e2:	89 ca                	mov    %ecx,%edx
 6e4:	89 c1                	mov    %eax,%ecx
 6e6:	39 d6                	cmp    %edx,%esi
 6e8:	76 df                	jbe    6c9 <printint+0x2e>
  if(neg)
 6ea:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6ee:	74 31                	je     721 <printint+0x86>
    buf[i++] = '-';
 6f0:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6f5:	8d 5f 02             	lea    0x2(%edi),%ebx
 6f8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6fb:	eb 17                	jmp    714 <printint+0x79>
    x = xx;
 6fd:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6ff:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 706:	eb bc                	jmp    6c4 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 708:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 70d:	89 f0                	mov    %esi,%eax
 70f:	e8 6d ff ff ff       	call   681 <putc>
  while(--i >= 0)
 714:	83 eb 01             	sub    $0x1,%ebx
 717:	79 ef                	jns    708 <printint+0x6d>
}
 719:	83 c4 2c             	add    $0x2c,%esp
 71c:	5b                   	pop    %ebx
 71d:	5e                   	pop    %esi
 71e:	5f                   	pop    %edi
 71f:	5d                   	pop    %ebp
 720:	c3                   	ret    
 721:	8b 75 d0             	mov    -0x30(%ebp),%esi
 724:	eb ee                	jmp    714 <printint+0x79>

00000726 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 726:	55                   	push   %ebp
 727:	89 e5                	mov    %esp,%ebp
 729:	57                   	push   %edi
 72a:	56                   	push   %esi
 72b:	53                   	push   %ebx
 72c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 72f:	8d 45 10             	lea    0x10(%ebp),%eax
 732:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 735:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 73a:	bb 00 00 00 00       	mov    $0x0,%ebx
 73f:	eb 14                	jmp    755 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 741:	89 fa                	mov    %edi,%edx
 743:	8b 45 08             	mov    0x8(%ebp),%eax
 746:	e8 36 ff ff ff       	call   681 <putc>
 74b:	eb 05                	jmp    752 <printf+0x2c>
      }
    } else if(state == '%'){
 74d:	83 fe 25             	cmp    $0x25,%esi
 750:	74 25                	je     777 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 752:	83 c3 01             	add    $0x1,%ebx
 755:	8b 45 0c             	mov    0xc(%ebp),%eax
 758:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 75c:	84 c0                	test   %al,%al
 75e:	0f 84 20 01 00 00    	je     884 <printf+0x15e>
    c = fmt[i] & 0xff;
 764:	0f be f8             	movsbl %al,%edi
 767:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 76a:	85 f6                	test   %esi,%esi
 76c:	75 df                	jne    74d <printf+0x27>
      if(c == '%'){
 76e:	83 f8 25             	cmp    $0x25,%eax
 771:	75 ce                	jne    741 <printf+0x1b>
        state = '%';
 773:	89 c6                	mov    %eax,%esi
 775:	eb db                	jmp    752 <printf+0x2c>
      if(c == 'd'){
 777:	83 f8 25             	cmp    $0x25,%eax
 77a:	0f 84 cf 00 00 00    	je     84f <printf+0x129>
 780:	0f 8c dd 00 00 00    	jl     863 <printf+0x13d>
 786:	83 f8 78             	cmp    $0x78,%eax
 789:	0f 8f d4 00 00 00    	jg     863 <printf+0x13d>
 78f:	83 f8 63             	cmp    $0x63,%eax
 792:	0f 8c cb 00 00 00    	jl     863 <printf+0x13d>
 798:	83 e8 63             	sub    $0x63,%eax
 79b:	83 f8 15             	cmp    $0x15,%eax
 79e:	0f 87 bf 00 00 00    	ja     863 <printf+0x13d>
 7a4:	ff 24 85 98 0a 00 00 	jmp    *0xa98(,%eax,4)
        printint(fd, *ap, 10, 1);
 7ab:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ae:	8b 17                	mov    (%edi),%edx
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	6a 01                	push   $0x1
 7b5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7ba:	8b 45 08             	mov    0x8(%ebp),%eax
 7bd:	e8 d9 fe ff ff       	call   69b <printint>
        ap++;
 7c2:	83 c7 04             	add    $0x4,%edi
 7c5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7c8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7cb:	be 00 00 00 00       	mov    $0x0,%esi
 7d0:	eb 80                	jmp    752 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7d2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7d5:	8b 17                	mov    (%edi),%edx
 7d7:	83 ec 0c             	sub    $0xc,%esp
 7da:	6a 00                	push   $0x0
 7dc:	b9 10 00 00 00       	mov    $0x10,%ecx
 7e1:	8b 45 08             	mov    0x8(%ebp),%eax
 7e4:	e8 b2 fe ff ff       	call   69b <printint>
        ap++;
 7e9:	83 c7 04             	add    $0x4,%edi
 7ec:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7ef:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7f2:	be 00 00 00 00       	mov    $0x0,%esi
 7f7:	e9 56 ff ff ff       	jmp    752 <printf+0x2c>
        s = (char*)*ap;
 7fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ff:	8b 30                	mov    (%eax),%esi
        ap++;
 801:	83 c0 04             	add    $0x4,%eax
 804:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 807:	85 f6                	test   %esi,%esi
 809:	75 15                	jne    820 <printf+0xfa>
          s = "(null)";
 80b:	be 90 0a 00 00       	mov    $0xa90,%esi
 810:	eb 0e                	jmp    820 <printf+0xfa>
          putc(fd, *s);
 812:	0f be d2             	movsbl %dl,%edx
 815:	8b 45 08             	mov    0x8(%ebp),%eax
 818:	e8 64 fe ff ff       	call   681 <putc>
          s++;
 81d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 820:	0f b6 16             	movzbl (%esi),%edx
 823:	84 d2                	test   %dl,%dl
 825:	75 eb                	jne    812 <printf+0xec>
      state = 0;
 827:	be 00 00 00 00       	mov    $0x0,%esi
 82c:	e9 21 ff ff ff       	jmp    752 <printf+0x2c>
        putc(fd, *ap);
 831:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 834:	0f be 17             	movsbl (%edi),%edx
 837:	8b 45 08             	mov    0x8(%ebp),%eax
 83a:	e8 42 fe ff ff       	call   681 <putc>
        ap++;
 83f:	83 c7 04             	add    $0x4,%edi
 842:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 845:	be 00 00 00 00       	mov    $0x0,%esi
 84a:	e9 03 ff ff ff       	jmp    752 <printf+0x2c>
        putc(fd, c);
 84f:	89 fa                	mov    %edi,%edx
 851:	8b 45 08             	mov    0x8(%ebp),%eax
 854:	e8 28 fe ff ff       	call   681 <putc>
      state = 0;
 859:	be 00 00 00 00       	mov    $0x0,%esi
 85e:	e9 ef fe ff ff       	jmp    752 <printf+0x2c>
        putc(fd, '%');
 863:	ba 25 00 00 00       	mov    $0x25,%edx
 868:	8b 45 08             	mov    0x8(%ebp),%eax
 86b:	e8 11 fe ff ff       	call   681 <putc>
        putc(fd, c);
 870:	89 fa                	mov    %edi,%edx
 872:	8b 45 08             	mov    0x8(%ebp),%eax
 875:	e8 07 fe ff ff       	call   681 <putc>
      state = 0;
 87a:	be 00 00 00 00       	mov    $0x0,%esi
 87f:	e9 ce fe ff ff       	jmp    752 <printf+0x2c>
    }
  }
}
 884:	8d 65 f4             	lea    -0xc(%ebp),%esp
 887:	5b                   	pop    %ebx
 888:	5e                   	pop    %esi
 889:	5f                   	pop    %edi
 88a:	5d                   	pop    %ebp
 88b:	c3                   	ret    

0000088c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 88c:	55                   	push   %ebp
 88d:	89 e5                	mov    %esp,%ebp
 88f:	57                   	push   %edi
 890:	56                   	push   %esi
 891:	53                   	push   %ebx
 892:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 895:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 898:	a1 64 0e 00 00       	mov    0xe64,%eax
 89d:	eb 02                	jmp    8a1 <free+0x15>
 89f:	89 d0                	mov    %edx,%eax
 8a1:	39 c8                	cmp    %ecx,%eax
 8a3:	73 04                	jae    8a9 <free+0x1d>
 8a5:	39 08                	cmp    %ecx,(%eax)
 8a7:	77 12                	ja     8bb <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a9:	8b 10                	mov    (%eax),%edx
 8ab:	39 c2                	cmp    %eax,%edx
 8ad:	77 f0                	ja     89f <free+0x13>
 8af:	39 c8                	cmp    %ecx,%eax
 8b1:	72 08                	jb     8bb <free+0x2f>
 8b3:	39 ca                	cmp    %ecx,%edx
 8b5:	77 04                	ja     8bb <free+0x2f>
 8b7:	89 d0                	mov    %edx,%eax
 8b9:	eb e6                	jmp    8a1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8bb:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8be:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8c1:	8b 10                	mov    (%eax),%edx
 8c3:	39 d7                	cmp    %edx,%edi
 8c5:	74 19                	je     8e0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8c7:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ca:	8b 50 04             	mov    0x4(%eax),%edx
 8cd:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8d0:	39 ce                	cmp    %ecx,%esi
 8d2:	74 1b                	je     8ef <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8d4:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8d6:	a3 64 0e 00 00       	mov    %eax,0xe64
}
 8db:	5b                   	pop    %ebx
 8dc:	5e                   	pop    %esi
 8dd:	5f                   	pop    %edi
 8de:	5d                   	pop    %ebp
 8df:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8e0:	03 72 04             	add    0x4(%edx),%esi
 8e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e6:	8b 10                	mov    (%eax),%edx
 8e8:	8b 12                	mov    (%edx),%edx
 8ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8ed:	eb db                	jmp    8ca <free+0x3e>
    p->s.size += bp->s.size;
 8ef:	03 53 fc             	add    -0x4(%ebx),%edx
 8f2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8f8:	89 10                	mov    %edx,(%eax)
 8fa:	eb da                	jmp    8d6 <free+0x4a>

000008fc <morecore>:

static Header*
morecore(uint nu)
{
 8fc:	55                   	push   %ebp
 8fd:	89 e5                	mov    %esp,%ebp
 8ff:	53                   	push   %ebx
 900:	83 ec 04             	sub    $0x4,%esp
 903:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 905:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 90a:	77 05                	ja     911 <morecore+0x15>
    nu = 4096;
 90c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 911:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 918:	83 ec 0c             	sub    $0xc,%esp
 91b:	50                   	push   %eax
 91c:	e8 38 fd ff ff       	call   659 <sbrk>
  if(p == (char*)-1)
 921:	83 c4 10             	add    $0x10,%esp
 924:	83 f8 ff             	cmp    $0xffffffff,%eax
 927:	74 1c                	je     945 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 929:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 92c:	83 c0 08             	add    $0x8,%eax
 92f:	83 ec 0c             	sub    $0xc,%esp
 932:	50                   	push   %eax
 933:	e8 54 ff ff ff       	call   88c <free>
  return freep;
 938:	a1 64 0e 00 00       	mov    0xe64,%eax
 93d:	83 c4 10             	add    $0x10,%esp
}
 940:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 943:	c9                   	leave  
 944:	c3                   	ret    
    return 0;
 945:	b8 00 00 00 00       	mov    $0x0,%eax
 94a:	eb f4                	jmp    940 <morecore+0x44>

0000094c <malloc>:

void*
malloc(uint nbytes)
{
 94c:	55                   	push   %ebp
 94d:	89 e5                	mov    %esp,%ebp
 94f:	53                   	push   %ebx
 950:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 953:	8b 45 08             	mov    0x8(%ebp),%eax
 956:	8d 58 07             	lea    0x7(%eax),%ebx
 959:	c1 eb 03             	shr    $0x3,%ebx
 95c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 95f:	8b 0d 64 0e 00 00    	mov    0xe64,%ecx
 965:	85 c9                	test   %ecx,%ecx
 967:	74 04                	je     96d <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 969:	8b 01                	mov    (%ecx),%eax
 96b:	eb 4a                	jmp    9b7 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 96d:	c7 05 64 0e 00 00 68 	movl   $0xe68,0xe64
 974:	0e 00 00 
 977:	c7 05 68 0e 00 00 68 	movl   $0xe68,0xe68
 97e:	0e 00 00 
    base.s.size = 0;
 981:	c7 05 6c 0e 00 00 00 	movl   $0x0,0xe6c
 988:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 98b:	b9 68 0e 00 00       	mov    $0xe68,%ecx
 990:	eb d7                	jmp    969 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 992:	74 19                	je     9ad <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 994:	29 da                	sub    %ebx,%edx
 996:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 999:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 99c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 99f:	89 0d 64 0e 00 00    	mov    %ecx,0xe64
      return (void*)(p + 1);
 9a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9ab:	c9                   	leave  
 9ac:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9ad:	8b 10                	mov    (%eax),%edx
 9af:	89 11                	mov    %edx,(%ecx)
 9b1:	eb ec                	jmp    99f <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b3:	89 c1                	mov    %eax,%ecx
 9b5:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9b7:	8b 50 04             	mov    0x4(%eax),%edx
 9ba:	39 da                	cmp    %ebx,%edx
 9bc:	73 d4                	jae    992 <malloc+0x46>
    if(p == freep)
 9be:	39 05 64 0e 00 00    	cmp    %eax,0xe64
 9c4:	75 ed                	jne    9b3 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9c6:	89 d8                	mov    %ebx,%eax
 9c8:	e8 2f ff ff ff       	call   8fc <morecore>
 9cd:	85 c0                	test   %eax,%eax
 9cf:	75 e2                	jne    9b3 <malloc+0x67>
 9d1:	eb d5                	jmp    9a8 <malloc+0x5c>
