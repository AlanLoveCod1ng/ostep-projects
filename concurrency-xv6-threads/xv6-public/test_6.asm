
_test_6:     file format elf32-i386


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
  1c:	a1 a4 0e 00 00       	mov    0xea4,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 39                	push   $0x39
  2c:	68 f4 09 00 00       	push   $0x9f4
  31:	68 fd 09 00 00       	push   $0x9fd
  36:	6a 01                	push   $0x1
  38:	e8 0a 07 00 00       	call   747 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 3c 0a 00 00       	push   $0xa3c
  45:	68 10 0a 00 00       	push   $0xa10
  4a:	6a 01                	push   $0x1
  4c:	e8 f6 06 00 00       	call   747 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 24 0a 00 00       	push   $0xa24
  59:	6a 01                	push   $0x1
  5b:	e8 e7 06 00 00       	call   747 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 a8 0e 00 00    	push   0xea8
  69:	e8 b4 05 00 00       	call   622 <kill>
  6e:	e8 7f 05 00 00       	call   5f2 <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 f4 09 00 00       	push   $0x9f4
  7a:	68 fd 09 00 00       	push   $0x9fd
  7f:	6a 01                	push   $0x1
  81:	e8 c1 06 00 00       	call   747 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 05 0a 00 00       	push   $0xa05
  8e:	68 10 0a 00 00       	push   $0xa10
  93:	6a 01                	push   $0x1
  95:	e8 ad 06 00 00       	call   747 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 24 0a 00 00       	push   $0xa24
  a2:	6a 01                	push   $0x1
  a4:	e8 9e 06 00 00       	call   747 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 a8 0e 00 00    	push   0xea8
  b2:	e8 6b 05 00 00       	call   622 <kill>
  b7:	e8 36 05 00 00       	call   5f2 <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 f4 09 00 00       	push   $0x9f4
  c3:	68 fd 09 00 00       	push   $0x9fd
  c8:	6a 01                	push   $0x1
  ca:	e8 78 06 00 00       	call   747 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 31 0a 00 00       	push   $0xa31
  d7:	68 10 0a 00 00       	push   $0xa10
  dc:	6a 01                	push   $0x1
  de:	e8 64 06 00 00       	call   747 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 24 0a 00 00       	push   $0xa24
  eb:	6a 01                	push   $0x1
  ed:	e8 55 06 00 00       	call   747 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 a8 0e 00 00    	push   0xea8
  fb:	e8 22 05 00 00       	call   622 <kill>
 100:	e8 ed 04 00 00       	call   5f2 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 a4 0e 00 00       	mov    %eax,0xea4
   exit();
 10d:	e8 e0 04 00 00       	call   5f2 <exit>

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
 123:	83 ec 28             	sub    $0x28,%esp
   ppid = getpid();
 126:	e8 47 05 00 00       	call   672 <getpid>
 12b:	a3 a8 0e 00 00       	mov    %eax,0xea8
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 30 08 00 00       	call   96d <malloc>
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
 15a:	68 f4 09 00 00       	push   $0x9f4
 15f:	68 fd 09 00 00       	push   $0x9fd
 164:	6a 01                	push   $0x1
 166:	e8 dc 05 00 00       	call   747 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 48 0a 00 00       	push   $0xa48
 173:	68 10 0a 00 00       	push   $0xa10
 178:	6a 01                	push   $0x1
 17a:	e8 c8 05 00 00       	call   747 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 24 0a 00 00       	push   $0xa24
 187:	6a 01                	push   $0x1
 189:	e8 b9 05 00 00       	call   747 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 a8 0e 00 00    	push   0xea8
 197:	e8 86 04 00 00       	call   622 <kill>
 19c:	e8 51 04 00 00       	call   5f2 <exit>
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
 1bf:	e8 ce 04 00 00       	call   692 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 9c 04 00 00       	call   67a <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 90 04 00 00       	call   67a <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 9c 04 00 00       	call   69a <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 f4 09 00 00       	push   $0x9f4
 211:	68 fd 09 00 00       	push   $0x9fd
 216:	6a 01                	push   $0x1
 218:	e8 2a 05 00 00       	call   747 <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 ac 0a 00 00       	push   $0xaac
 225:	68 10 0a 00 00       	push   $0xa10
 22a:	6a 01                	push   $0x1
 22c:	e8 16 05 00 00       	call   747 <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 24 0a 00 00       	push   $0xa24
 239:	6a 01                	push   $0x1
 23b:	e8 07 05 00 00       	call   747 <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 a8 0e 00 00    	push   0xea8
 249:	e8 d4 03 00 00       	call   622 <kill>
 24e:	e8 9f 03 00 00       	call   5f2 <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 f4 09 00 00       	push   $0x9f4
 25a:	68 fd 09 00 00       	push   $0x9fd
 25f:	6a 01                	push   $0x1
 261:	e8 e1 04 00 00       	call   747 <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 52 0a 00 00       	push   $0xa52
 26e:	68 10 0a 00 00       	push   $0xa10
 273:	6a 01                	push   $0x1
 275:	e8 cd 04 00 00       	call   747 <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 24 0a 00 00       	push   $0xa24
 282:	6a 01                	push   $0x1
 284:	e8 be 04 00 00       	call   747 <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 a8 0e 00 00    	push   0xea8
 292:	e8 8b 03 00 00       	call   622 <kill>
 297:	e8 56 03 00 00       	call   5f2 <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 f3 03 00 00       	call   69a <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 f4 09 00 00       	push   $0x9f4
 2c1:	68 fd 09 00 00       	push   $0x9fd
 2c6:	6a 01                	push   $0x1
 2c8:	e8 7a 04 00 00       	call   747 <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 7e 0a 00 00       	push   $0xa7e
 2d5:	68 10 0a 00 00       	push   $0xa10
 2da:	6a 01                	push   $0x1
 2dc:	e8 66 04 00 00       	call   747 <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 24 0a 00 00       	push   $0xa24
 2e9:	6a 01                	push   $0x1
 2eb:	e8 57 04 00 00       	call   747 <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 a8 0e 00 00    	push   0xea8
 2f9:	e8 24 03 00 00       	call   622 <kill>
 2fe:	e8 ef 02 00 00       	call   5f2 <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 f4 09 00 00       	push   $0x9f4
 30a:	68 fd 09 00 00       	push   $0x9fd
 30f:	6a 01                	push   $0x1
 311:	e8 31 04 00 00       	call   747 <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 60 0a 00 00       	push   $0xa60
 31e:	68 10 0a 00 00       	push   $0xa10
 323:	6a 01                	push   $0x1
 325:	e8 1d 04 00 00       	call   747 <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 24 0a 00 00       	push   $0xa24
 332:	6a 01                	push   $0x1
 334:	e8 0e 04 00 00       	call   747 <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 a8 0e 00 00    	push   0xea8
 342:	e8 db 02 00 00       	call   622 <kill>
 347:	e8 a6 02 00 00       	call   5f2 <exit>
   assert(global == 2);
 34c:	83 3d a4 0e 00 00 02 	cmpl   $0x2,0xea4
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 f4 09 00 00       	push   $0x9f4
 35c:	68 fd 09 00 00       	push   $0x9fd
 361:	6a 01                	push   $0x1
 363:	e8 df 03 00 00       	call   747 <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 93 0a 00 00       	push   $0xa93
 370:	68 10 0a 00 00       	push   $0xa10
 375:	6a 01                	push   $0x1
 377:	e8 cb 03 00 00       	call   747 <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 24 0a 00 00       	push   $0xa24
 384:	6a 01                	push   $0x1
 386:	e8 bc 03 00 00       	call   747 <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 a8 0e 00 00    	push   0xea8
 394:	e8 89 02 00 00       	call   622 <kill>
 399:	e8 54 02 00 00       	call   5f2 <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 9f 0a 00 00       	push   $0xa9f
 3a6:	6a 01                	push   $0x1
 3a8:	e8 9a 03 00 00       	call   747 <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 f8 04 00 00       	call   8ad <free>
   exit();
 3b5:	e8 38 02 00 00       	call   5f2 <exit>

000003ba <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	56                   	push   %esi
 3be:	53                   	push   %ebx
 3bf:	8b 75 08             	mov    0x8(%ebp),%esi
 3c2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3c5:	89 f0                	mov    %esi,%eax
 3c7:	89 d1                	mov    %edx,%ecx
 3c9:	83 c2 01             	add    $0x1,%edx
 3cc:	89 c3                	mov    %eax,%ebx
 3ce:	83 c0 01             	add    $0x1,%eax
 3d1:	0f b6 09             	movzbl (%ecx),%ecx
 3d4:	88 0b                	mov    %cl,(%ebx)
 3d6:	84 c9                	test   %cl,%cl
 3d8:	75 ed                	jne    3c7 <strcpy+0xd>
    ;
  return os;
}
 3da:	89 f0                	mov    %esi,%eax
 3dc:	5b                   	pop    %ebx
 3dd:	5e                   	pop    %esi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e6:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3e9:	eb 06                	jmp    3f1 <strcmp+0x11>
    p++, q++;
 3eb:	83 c1 01             	add    $0x1,%ecx
 3ee:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3f1:	0f b6 01             	movzbl (%ecx),%eax
 3f4:	84 c0                	test   %al,%al
 3f6:	74 04                	je     3fc <strcmp+0x1c>
 3f8:	3a 02                	cmp    (%edx),%al
 3fa:	74 ef                	je     3eb <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3fc:	0f b6 c0             	movzbl %al,%eax
 3ff:	0f b6 12             	movzbl (%edx),%edx
 402:	29 d0                	sub    %edx,%eax
}
 404:	5d                   	pop    %ebp
 405:	c3                   	ret    

00000406 <strlen>:

uint
strlen(const char *s)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 40c:	b8 00 00 00 00       	mov    $0x0,%eax
 411:	eb 03                	jmp    416 <strlen+0x10>
 413:	83 c0 01             	add    $0x1,%eax
 416:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 41a:	75 f7                	jne    413 <strlen+0xd>
    ;
  return n;
}
 41c:	5d                   	pop    %ebp
 41d:	c3                   	ret    

0000041e <memset>:

void*
memset(void *dst, int c, uint n)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	57                   	push   %edi
 422:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 425:	89 d7                	mov    %edx,%edi
 427:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42a:	8b 45 0c             	mov    0xc(%ebp),%eax
 42d:	fc                   	cld    
 42e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 430:	89 d0                	mov    %edx,%eax
 432:	8b 7d fc             	mov    -0x4(%ebp),%edi
 435:	c9                   	leave  
 436:	c3                   	ret    

00000437 <strchr>:

char*
strchr(const char *s, char c)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
 43d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 441:	eb 03                	jmp    446 <strchr+0xf>
 443:	83 c0 01             	add    $0x1,%eax
 446:	0f b6 10             	movzbl (%eax),%edx
 449:	84 d2                	test   %dl,%dl
 44b:	74 06                	je     453 <strchr+0x1c>
    if(*s == c)
 44d:	38 ca                	cmp    %cl,%dl
 44f:	75 f2                	jne    443 <strchr+0xc>
 451:	eb 05                	jmp    458 <strchr+0x21>
      return (char*)s;
  return 0;
 453:	b8 00 00 00 00       	mov    $0x0,%eax
}
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <gets>:

char*
gets(char *buf, int max)
{
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	57                   	push   %edi
 45e:	56                   	push   %esi
 45f:	53                   	push   %ebx
 460:	83 ec 1c             	sub    $0x1c,%esp
 463:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 466:	bb 00 00 00 00       	mov    $0x0,%ebx
 46b:	89 de                	mov    %ebx,%esi
 46d:	83 c3 01             	add    $0x1,%ebx
 470:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 473:	7d 2e                	jge    4a3 <gets+0x49>
    cc = read(0, &c, 1);
 475:	83 ec 04             	sub    $0x4,%esp
 478:	6a 01                	push   $0x1
 47a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 47d:	50                   	push   %eax
 47e:	6a 00                	push   $0x0
 480:	e8 85 01 00 00       	call   60a <read>
    if(cc < 1)
 485:	83 c4 10             	add    $0x10,%esp
 488:	85 c0                	test   %eax,%eax
 48a:	7e 17                	jle    4a3 <gets+0x49>
      break;
    buf[i++] = c;
 48c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 490:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 493:	3c 0a                	cmp    $0xa,%al
 495:	0f 94 c2             	sete   %dl
 498:	3c 0d                	cmp    $0xd,%al
 49a:	0f 94 c0             	sete   %al
 49d:	08 c2                	or     %al,%dl
 49f:	74 ca                	je     46b <gets+0x11>
    buf[i++] = c;
 4a1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4a7:	89 f8                	mov    %edi,%eax
 4a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ac:	5b                   	pop    %ebx
 4ad:	5e                   	pop    %esi
 4ae:	5f                   	pop    %edi
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    

000004b1 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b6:	83 ec 08             	sub    $0x8,%esp
 4b9:	6a 00                	push   $0x0
 4bb:	ff 75 08             	push   0x8(%ebp)
 4be:	e8 6f 01 00 00       	call   632 <open>
  if(fd < 0)
 4c3:	83 c4 10             	add    $0x10,%esp
 4c6:	85 c0                	test   %eax,%eax
 4c8:	78 24                	js     4ee <stat+0x3d>
 4ca:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4cc:	83 ec 08             	sub    $0x8,%esp
 4cf:	ff 75 0c             	push   0xc(%ebp)
 4d2:	50                   	push   %eax
 4d3:	e8 72 01 00 00       	call   64a <fstat>
 4d8:	89 c6                	mov    %eax,%esi
  close(fd);
 4da:	89 1c 24             	mov    %ebx,(%esp)
 4dd:	e8 38 01 00 00       	call   61a <close>
  return r;
 4e2:	83 c4 10             	add    $0x10,%esp
}
 4e5:	89 f0                	mov    %esi,%eax
 4e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ea:	5b                   	pop    %ebx
 4eb:	5e                   	pop    %esi
 4ec:	5d                   	pop    %ebp
 4ed:	c3                   	ret    
    return -1;
 4ee:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f3:	eb f0                	jmp    4e5 <stat+0x34>

000004f5 <atoi>:

int
atoi(const char *s)
{
 4f5:	55                   	push   %ebp
 4f6:	89 e5                	mov    %esp,%ebp
 4f8:	53                   	push   %ebx
 4f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4fc:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 501:	eb 10                	jmp    513 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 503:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 506:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 509:	83 c1 01             	add    $0x1,%ecx
 50c:	0f be c0             	movsbl %al,%eax
 50f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 513:	0f b6 01             	movzbl (%ecx),%eax
 516:	8d 58 d0             	lea    -0x30(%eax),%ebx
 519:	80 fb 09             	cmp    $0x9,%bl
 51c:	76 e5                	jbe    503 <atoi+0xe>
  return n;
}
 51e:	89 d0                	mov    %edx,%eax
 520:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 523:	c9                   	leave  
 524:	c3                   	ret    

00000525 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	56                   	push   %esi
 529:	53                   	push   %ebx
 52a:	8b 75 08             	mov    0x8(%ebp),%esi
 52d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 530:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 533:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 535:	eb 0d                	jmp    544 <memmove+0x1f>
    *dst++ = *src++;
 537:	0f b6 01             	movzbl (%ecx),%eax
 53a:	88 02                	mov    %al,(%edx)
 53c:	8d 49 01             	lea    0x1(%ecx),%ecx
 53f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 542:	89 d8                	mov    %ebx,%eax
 544:	8d 58 ff             	lea    -0x1(%eax),%ebx
 547:	85 c0                	test   %eax,%eax
 549:	7f ec                	jg     537 <memmove+0x12>
  return vdst;
}
 54b:	89 f0                	mov    %esi,%eax
 54d:	5b                   	pop    %ebx
 54e:	5e                   	pop    %esi
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret    

00000551 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 551:	55                   	push   %ebp
 552:	89 e5                	mov    %esp,%ebp
 554:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 557:	68 00 20 00 00       	push   $0x2000
 55c:	e8 0c 04 00 00       	call   96d <malloc>
  if((uint)(stack) % PGSIZE != 0){
 561:	83 c4 10             	add    $0x10,%esp
 564:	a9 ff 0f 00 00       	test   $0xfff,%eax
 569:	74 0a                	je     575 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 56b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 570:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 575:	50                   	push   %eax
 576:	ff 75 10             	push   0x10(%ebp)
 579:	ff 75 0c             	push   0xc(%ebp)
 57c:	ff 75 08             	push   0x8(%ebp)
 57f:	e8 0e 01 00 00       	call   692 <clone>
  return pid;
}
 584:	c9                   	leave  
 585:	c3                   	ret    

00000586 <thread_join>:
int
thread_join()
{
 586:	55                   	push   %ebp
 587:	89 e5                	mov    %esp,%ebp
 589:	53                   	push   %ebx
 58a:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 58d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 590:	50                   	push   %eax
 591:	e8 04 01 00 00       	call   69a <join>
 596:	89 c3                	mov    %eax,%ebx
  free(stack);
 598:	83 c4 04             	add    $0x4,%esp
 59b:	ff 75 f4             	push   -0xc(%ebp)
 59e:	e8 0a 03 00 00       	call   8ad <free>
  return pid;
}
 5a3:	89 d8                	mov    %ebx,%eax
 5a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5a8:	c9                   	leave  
 5a9:	c3                   	ret    

000005aa <lock_init>:
int
lock_init(lock_t * lock){
 5aa:	55                   	push   %ebp
 5ab:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5ad:	8b 45 08             	mov    0x8(%ebp),%eax
 5b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 5b6:	b8 00 00 00 00       	mov    $0x0,%eax
 5bb:	5d                   	pop    %ebp
 5bc:	c3                   	ret    

000005bd <lock_acquire>:
int
lock_acquire(lock_t * lock){
 5bd:	55                   	push   %ebp
 5be:	89 e5                	mov    %esp,%ebp
 5c0:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5c3:	b8 01 00 00 00       	mov    $0x1,%eax
 5c8:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 5cb:	83 f8 01             	cmp    $0x1,%eax
 5ce:	74 f3                	je     5c3 <lock_acquire+0x6>
  {

  }
  return 0;
}
 5d0:	b8 00 00 00 00       	mov    $0x0,%eax
 5d5:	5d                   	pop    %ebp
 5d6:	c3                   	ret    

000005d7 <lock_release>:
int
lock_release(lock_t * lock){
 5d7:	55                   	push   %ebp
 5d8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 5e3:	b8 00 00 00 00       	mov    $0x0,%eax
 5e8:	5d                   	pop    %ebp
 5e9:	c3                   	ret    

000005ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ea:	b8 01 00 00 00       	mov    $0x1,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <exit>:
SYSCALL(exit)
 5f2:	b8 02 00 00 00       	mov    $0x2,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <wait>:
SYSCALL(wait)
 5fa:	b8 03 00 00 00       	mov    $0x3,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <pipe>:
SYSCALL(pipe)
 602:	b8 04 00 00 00       	mov    $0x4,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <read>:
SYSCALL(read)
 60a:	b8 05 00 00 00       	mov    $0x5,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <write>:
SYSCALL(write)
 612:	b8 10 00 00 00       	mov    $0x10,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <close>:
SYSCALL(close)
 61a:	b8 15 00 00 00       	mov    $0x15,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <kill>:
SYSCALL(kill)
 622:	b8 06 00 00 00       	mov    $0x6,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <exec>:
SYSCALL(exec)
 62a:	b8 07 00 00 00       	mov    $0x7,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <open>:
SYSCALL(open)
 632:	b8 0f 00 00 00       	mov    $0xf,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <mknod>:
SYSCALL(mknod)
 63a:	b8 11 00 00 00       	mov    $0x11,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <unlink>:
SYSCALL(unlink)
 642:	b8 12 00 00 00       	mov    $0x12,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <fstat>:
SYSCALL(fstat)
 64a:	b8 08 00 00 00       	mov    $0x8,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <link>:
SYSCALL(link)
 652:	b8 13 00 00 00       	mov    $0x13,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <mkdir>:
SYSCALL(mkdir)
 65a:	b8 14 00 00 00       	mov    $0x14,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <chdir>:
SYSCALL(chdir)
 662:	b8 09 00 00 00       	mov    $0x9,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <dup>:
SYSCALL(dup)
 66a:	b8 0a 00 00 00       	mov    $0xa,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <getpid>:
SYSCALL(getpid)
 672:	b8 0b 00 00 00       	mov    $0xb,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <sbrk>:
SYSCALL(sbrk)
 67a:	b8 0c 00 00 00       	mov    $0xc,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <sleep>:
SYSCALL(sleep)
 682:	b8 0d 00 00 00       	mov    $0xd,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <uptime>:
SYSCALL(uptime)
 68a:	b8 0e 00 00 00       	mov    $0xe,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <clone>:
SYSCALL(clone)
 692:	b8 16 00 00 00       	mov    $0x16,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <join>:
SYSCALL(join)
 69a:	b8 17 00 00 00       	mov    $0x17,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6a2:	55                   	push   %ebp
 6a3:	89 e5                	mov    %esp,%ebp
 6a5:	83 ec 1c             	sub    $0x1c,%esp
 6a8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6ab:	6a 01                	push   $0x1
 6ad:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6b0:	52                   	push   %edx
 6b1:	50                   	push   %eax
 6b2:	e8 5b ff ff ff       	call   612 <write>
}
 6b7:	83 c4 10             	add    $0x10,%esp
 6ba:	c9                   	leave  
 6bb:	c3                   	ret    

000006bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6bc:	55                   	push   %ebp
 6bd:	89 e5                	mov    %esp,%ebp
 6bf:	57                   	push   %edi
 6c0:	56                   	push   %esi
 6c1:	53                   	push   %ebx
 6c2:	83 ec 2c             	sub    $0x2c,%esp
 6c5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c8:	89 d0                	mov    %edx,%eax
 6ca:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6cc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6d0:	0f 95 c1             	setne  %cl
 6d3:	c1 ea 1f             	shr    $0x1f,%edx
 6d6:	84 d1                	test   %dl,%cl
 6d8:	74 44                	je     71e <printint+0x62>
    neg = 1;
    x = -xx;
 6da:	f7 d8                	neg    %eax
 6dc:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6de:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6e5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6ea:	89 c8                	mov    %ecx,%eax
 6ec:	ba 00 00 00 00       	mov    $0x0,%edx
 6f1:	f7 f6                	div    %esi
 6f3:	89 df                	mov    %ebx,%edi
 6f5:	83 c3 01             	add    $0x1,%ebx
 6f8:	0f b6 92 38 0b 00 00 	movzbl 0xb38(%edx),%edx
 6ff:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 703:	89 ca                	mov    %ecx,%edx
 705:	89 c1                	mov    %eax,%ecx
 707:	39 d6                	cmp    %edx,%esi
 709:	76 df                	jbe    6ea <printint+0x2e>
  if(neg)
 70b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 70f:	74 31                	je     742 <printint+0x86>
    buf[i++] = '-';
 711:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 716:	8d 5f 02             	lea    0x2(%edi),%ebx
 719:	8b 75 d0             	mov    -0x30(%ebp),%esi
 71c:	eb 17                	jmp    735 <printint+0x79>
    x = xx;
 71e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 720:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 727:	eb bc                	jmp    6e5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 729:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 72e:	89 f0                	mov    %esi,%eax
 730:	e8 6d ff ff ff       	call   6a2 <putc>
  while(--i >= 0)
 735:	83 eb 01             	sub    $0x1,%ebx
 738:	79 ef                	jns    729 <printint+0x6d>
}
 73a:	83 c4 2c             	add    $0x2c,%esp
 73d:	5b                   	pop    %ebx
 73e:	5e                   	pop    %esi
 73f:	5f                   	pop    %edi
 740:	5d                   	pop    %ebp
 741:	c3                   	ret    
 742:	8b 75 d0             	mov    -0x30(%ebp),%esi
 745:	eb ee                	jmp    735 <printint+0x79>

00000747 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 747:	55                   	push   %ebp
 748:	89 e5                	mov    %esp,%ebp
 74a:	57                   	push   %edi
 74b:	56                   	push   %esi
 74c:	53                   	push   %ebx
 74d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 750:	8d 45 10             	lea    0x10(%ebp),%eax
 753:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 756:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 75b:	bb 00 00 00 00       	mov    $0x0,%ebx
 760:	eb 14                	jmp    776 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 762:	89 fa                	mov    %edi,%edx
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	e8 36 ff ff ff       	call   6a2 <putc>
 76c:	eb 05                	jmp    773 <printf+0x2c>
      }
    } else if(state == '%'){
 76e:	83 fe 25             	cmp    $0x25,%esi
 771:	74 25                	je     798 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 773:	83 c3 01             	add    $0x1,%ebx
 776:	8b 45 0c             	mov    0xc(%ebp),%eax
 779:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 77d:	84 c0                	test   %al,%al
 77f:	0f 84 20 01 00 00    	je     8a5 <printf+0x15e>
    c = fmt[i] & 0xff;
 785:	0f be f8             	movsbl %al,%edi
 788:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 78b:	85 f6                	test   %esi,%esi
 78d:	75 df                	jne    76e <printf+0x27>
      if(c == '%'){
 78f:	83 f8 25             	cmp    $0x25,%eax
 792:	75 ce                	jne    762 <printf+0x1b>
        state = '%';
 794:	89 c6                	mov    %eax,%esi
 796:	eb db                	jmp    773 <printf+0x2c>
      if(c == 'd'){
 798:	83 f8 25             	cmp    $0x25,%eax
 79b:	0f 84 cf 00 00 00    	je     870 <printf+0x129>
 7a1:	0f 8c dd 00 00 00    	jl     884 <printf+0x13d>
 7a7:	83 f8 78             	cmp    $0x78,%eax
 7aa:	0f 8f d4 00 00 00    	jg     884 <printf+0x13d>
 7b0:	83 f8 63             	cmp    $0x63,%eax
 7b3:	0f 8c cb 00 00 00    	jl     884 <printf+0x13d>
 7b9:	83 e8 63             	sub    $0x63,%eax
 7bc:	83 f8 15             	cmp    $0x15,%eax
 7bf:	0f 87 bf 00 00 00    	ja     884 <printf+0x13d>
 7c5:	ff 24 85 e0 0a 00 00 	jmp    *0xae0(,%eax,4)
        printint(fd, *ap, 10, 1);
 7cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7cf:	8b 17                	mov    (%edi),%edx
 7d1:	83 ec 0c             	sub    $0xc,%esp
 7d4:	6a 01                	push   $0x1
 7d6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7db:	8b 45 08             	mov    0x8(%ebp),%eax
 7de:	e8 d9 fe ff ff       	call   6bc <printint>
        ap++;
 7e3:	83 c7 04             	add    $0x4,%edi
 7e6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7e9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7ec:	be 00 00 00 00       	mov    $0x0,%esi
 7f1:	eb 80                	jmp    773 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7f6:	8b 17                	mov    (%edi),%edx
 7f8:	83 ec 0c             	sub    $0xc,%esp
 7fb:	6a 00                	push   $0x0
 7fd:	b9 10 00 00 00       	mov    $0x10,%ecx
 802:	8b 45 08             	mov    0x8(%ebp),%eax
 805:	e8 b2 fe ff ff       	call   6bc <printint>
        ap++;
 80a:	83 c7 04             	add    $0x4,%edi
 80d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 810:	83 c4 10             	add    $0x10,%esp
      state = 0;
 813:	be 00 00 00 00       	mov    $0x0,%esi
 818:	e9 56 ff ff ff       	jmp    773 <printf+0x2c>
        s = (char*)*ap;
 81d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 820:	8b 30                	mov    (%eax),%esi
        ap++;
 822:	83 c0 04             	add    $0x4,%eax
 825:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 828:	85 f6                	test   %esi,%esi
 82a:	75 15                	jne    841 <printf+0xfa>
          s = "(null)";
 82c:	be d7 0a 00 00       	mov    $0xad7,%esi
 831:	eb 0e                	jmp    841 <printf+0xfa>
          putc(fd, *s);
 833:	0f be d2             	movsbl %dl,%edx
 836:	8b 45 08             	mov    0x8(%ebp),%eax
 839:	e8 64 fe ff ff       	call   6a2 <putc>
          s++;
 83e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 841:	0f b6 16             	movzbl (%esi),%edx
 844:	84 d2                	test   %dl,%dl
 846:	75 eb                	jne    833 <printf+0xec>
      state = 0;
 848:	be 00 00 00 00       	mov    $0x0,%esi
 84d:	e9 21 ff ff ff       	jmp    773 <printf+0x2c>
        putc(fd, *ap);
 852:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 855:	0f be 17             	movsbl (%edi),%edx
 858:	8b 45 08             	mov    0x8(%ebp),%eax
 85b:	e8 42 fe ff ff       	call   6a2 <putc>
        ap++;
 860:	83 c7 04             	add    $0x4,%edi
 863:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 866:	be 00 00 00 00       	mov    $0x0,%esi
 86b:	e9 03 ff ff ff       	jmp    773 <printf+0x2c>
        putc(fd, c);
 870:	89 fa                	mov    %edi,%edx
 872:	8b 45 08             	mov    0x8(%ebp),%eax
 875:	e8 28 fe ff ff       	call   6a2 <putc>
      state = 0;
 87a:	be 00 00 00 00       	mov    $0x0,%esi
 87f:	e9 ef fe ff ff       	jmp    773 <printf+0x2c>
        putc(fd, '%');
 884:	ba 25 00 00 00       	mov    $0x25,%edx
 889:	8b 45 08             	mov    0x8(%ebp),%eax
 88c:	e8 11 fe ff ff       	call   6a2 <putc>
        putc(fd, c);
 891:	89 fa                	mov    %edi,%edx
 893:	8b 45 08             	mov    0x8(%ebp),%eax
 896:	e8 07 fe ff ff       	call   6a2 <putc>
      state = 0;
 89b:	be 00 00 00 00       	mov    $0x0,%esi
 8a0:	e9 ce fe ff ff       	jmp    773 <printf+0x2c>
    }
  }
}
 8a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8a8:	5b                   	pop    %ebx
 8a9:	5e                   	pop    %esi
 8aa:	5f                   	pop    %edi
 8ab:	5d                   	pop    %ebp
 8ac:	c3                   	ret    

000008ad <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8ad:	55                   	push   %ebp
 8ae:	89 e5                	mov    %esp,%ebp
 8b0:	57                   	push   %edi
 8b1:	56                   	push   %esi
 8b2:	53                   	push   %ebx
 8b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8b6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b9:	a1 ac 0e 00 00       	mov    0xeac,%eax
 8be:	eb 02                	jmp    8c2 <free+0x15>
 8c0:	89 d0                	mov    %edx,%eax
 8c2:	39 c8                	cmp    %ecx,%eax
 8c4:	73 04                	jae    8ca <free+0x1d>
 8c6:	39 08                	cmp    %ecx,(%eax)
 8c8:	77 12                	ja     8dc <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ca:	8b 10                	mov    (%eax),%edx
 8cc:	39 c2                	cmp    %eax,%edx
 8ce:	77 f0                	ja     8c0 <free+0x13>
 8d0:	39 c8                	cmp    %ecx,%eax
 8d2:	72 08                	jb     8dc <free+0x2f>
 8d4:	39 ca                	cmp    %ecx,%edx
 8d6:	77 04                	ja     8dc <free+0x2f>
 8d8:	89 d0                	mov    %edx,%eax
 8da:	eb e6                	jmp    8c2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8dc:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8df:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8e2:	8b 10                	mov    (%eax),%edx
 8e4:	39 d7                	cmp    %edx,%edi
 8e6:	74 19                	je     901 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8e8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8eb:	8b 50 04             	mov    0x4(%eax),%edx
 8ee:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8f1:	39 ce                	cmp    %ecx,%esi
 8f3:	74 1b                	je     910 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8f5:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8f7:	a3 ac 0e 00 00       	mov    %eax,0xeac
}
 8fc:	5b                   	pop    %ebx
 8fd:	5e                   	pop    %esi
 8fe:	5f                   	pop    %edi
 8ff:	5d                   	pop    %ebp
 900:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 901:	03 72 04             	add    0x4(%edx),%esi
 904:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 907:	8b 10                	mov    (%eax),%edx
 909:	8b 12                	mov    (%edx),%edx
 90b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 90e:	eb db                	jmp    8eb <free+0x3e>
    p->s.size += bp->s.size;
 910:	03 53 fc             	add    -0x4(%ebx),%edx
 913:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 916:	8b 53 f8             	mov    -0x8(%ebx),%edx
 919:	89 10                	mov    %edx,(%eax)
 91b:	eb da                	jmp    8f7 <free+0x4a>

0000091d <morecore>:

static Header*
morecore(uint nu)
{
 91d:	55                   	push   %ebp
 91e:	89 e5                	mov    %esp,%ebp
 920:	53                   	push   %ebx
 921:	83 ec 04             	sub    $0x4,%esp
 924:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 926:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 92b:	77 05                	ja     932 <morecore+0x15>
    nu = 4096;
 92d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 932:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 939:	83 ec 0c             	sub    $0xc,%esp
 93c:	50                   	push   %eax
 93d:	e8 38 fd ff ff       	call   67a <sbrk>
  if(p == (char*)-1)
 942:	83 c4 10             	add    $0x10,%esp
 945:	83 f8 ff             	cmp    $0xffffffff,%eax
 948:	74 1c                	je     966 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 94a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 94d:	83 c0 08             	add    $0x8,%eax
 950:	83 ec 0c             	sub    $0xc,%esp
 953:	50                   	push   %eax
 954:	e8 54 ff ff ff       	call   8ad <free>
  return freep;
 959:	a1 ac 0e 00 00       	mov    0xeac,%eax
 95e:	83 c4 10             	add    $0x10,%esp
}
 961:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 964:	c9                   	leave  
 965:	c3                   	ret    
    return 0;
 966:	b8 00 00 00 00       	mov    $0x0,%eax
 96b:	eb f4                	jmp    961 <morecore+0x44>

0000096d <malloc>:

void*
malloc(uint nbytes)
{
 96d:	55                   	push   %ebp
 96e:	89 e5                	mov    %esp,%ebp
 970:	53                   	push   %ebx
 971:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 974:	8b 45 08             	mov    0x8(%ebp),%eax
 977:	8d 58 07             	lea    0x7(%eax),%ebx
 97a:	c1 eb 03             	shr    $0x3,%ebx
 97d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 980:	8b 0d ac 0e 00 00    	mov    0xeac,%ecx
 986:	85 c9                	test   %ecx,%ecx
 988:	74 04                	je     98e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98a:	8b 01                	mov    (%ecx),%eax
 98c:	eb 4a                	jmp    9d8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 98e:	c7 05 ac 0e 00 00 b0 	movl   $0xeb0,0xeac
 995:	0e 00 00 
 998:	c7 05 b0 0e 00 00 b0 	movl   $0xeb0,0xeb0
 99f:	0e 00 00 
    base.s.size = 0;
 9a2:	c7 05 b4 0e 00 00 00 	movl   $0x0,0xeb4
 9a9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9ac:	b9 b0 0e 00 00       	mov    $0xeb0,%ecx
 9b1:	eb d7                	jmp    98a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9b3:	74 19                	je     9ce <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9b5:	29 da                	sub    %ebx,%edx
 9b7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ba:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9bd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9c0:	89 0d ac 0e 00 00    	mov    %ecx,0xeac
      return (void*)(p + 1);
 9c6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9cc:	c9                   	leave  
 9cd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9ce:	8b 10                	mov    (%eax),%edx
 9d0:	89 11                	mov    %edx,(%ecx)
 9d2:	eb ec                	jmp    9c0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d4:	89 c1                	mov    %eax,%ecx
 9d6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9d8:	8b 50 04             	mov    0x4(%eax),%edx
 9db:	39 da                	cmp    %ebx,%edx
 9dd:	73 d4                	jae    9b3 <malloc+0x46>
    if(p == freep)
 9df:	39 05 ac 0e 00 00    	cmp    %eax,0xeac
 9e5:	75 ed                	jne    9d4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9e7:	89 d8                	mov    %ebx,%eax
 9e9:	e8 2f ff ff ff       	call   91d <morecore>
 9ee:	85 c0                	test   %eax,%eax
 9f0:	75 e2                	jne    9d4 <malloc+0x67>
 9f2:	eb d5                	jmp    9c9 <malloc+0x5c>
