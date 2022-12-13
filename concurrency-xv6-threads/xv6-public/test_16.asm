
_test_16:     file format elf32-i386


Disassembly of section .text:

00000000 <nested_worker>:
   printf(1, "TEST PASSED\n");
   exit();
}


void nested_worker(void *arg1, void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 23             	cmpl   $0x23,(%eax)
  11:	75 60                	jne    73 <nested_worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <nested_worker+0xbc>
   assert(global == 2);
  1c:	a1 d0 0e 00 00       	mov    0xed0,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 24 0a 00 00       	push   $0xa24
  31:	68 2e 0a 00 00       	push   $0xa2e
  36:	6a 01                	push   $0x1
  38:	e8 3a 07 00 00       	call   777 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 75 0a 00 00       	push   $0xa75
  45:	68 45 0a 00 00       	push   $0xa45
  4a:	6a 01                	push   $0x1
  4c:	e8 26 07 00 00       	call   777 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 59 0a 00 00       	push   $0xa59
  59:	6a 01                	push   $0x1
  5b:	e8 17 07 00 00       	call   777 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 d4 0e 00 00    	push   0xed4
  69:	e8 e4 05 00 00       	call   652 <kill>
  6e:	e8 af 05 00 00       	call   622 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 24 0a 00 00       	push   $0xa24
  7a:	68 2e 0a 00 00       	push   $0xa2e
  7f:	6a 01                	push   $0x1
  81:	e8 f1 06 00 00       	call   777 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 36 0a 00 00       	push   $0xa36
  8e:	68 45 0a 00 00       	push   $0xa45
  93:	6a 01                	push   $0x1
  95:	e8 dd 06 00 00       	call   777 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 59 0a 00 00       	push   $0xa59
  a2:	6a 01                	push   $0x1
  a4:	e8 ce 06 00 00       	call   777 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 d4 0e 00 00    	push   0xed4
  b2:	e8 9b 05 00 00       	call   652 <kill>
  b7:	e8 66 05 00 00       	call   622 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 24 0a 00 00       	push   $0xa24
  c3:	68 2e 0a 00 00       	push   $0xa2e
  c8:	6a 01                	push   $0x1
  ca:	e8 a8 06 00 00       	call   777 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 66 0a 00 00       	push   $0xa66
  d7:	68 45 0a 00 00       	push   $0xa45
  dc:	6a 01                	push   $0x1
  de:	e8 94 06 00 00       	call   777 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 59 0a 00 00       	push   $0xa59
  eb:	6a 01                	push   $0x1
  ed:	e8 85 06 00 00       	call   777 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 d4 0e 00 00    	push   0xed4
  fb:	e8 52 05 00 00       	call   652 <kill>
 100:	e8 1d 05 00 00       	call   622 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 d0 0e 00 00       	mov    %eax,0xed0
   exit();
 10d:	e8 10 05 00 00       	call   622 <exit>

00000112 <worker>:
}

void
worker(void *arg1, void *arg2) {
 112:	55                   	push   %ebp
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	83 ec 14             	sub    $0x14,%esp
   int arg1_int = *(int*)arg1;
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	8b 00                	mov    (%eax),%eax
 11e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int arg2_int = *(int*)arg2;
 121:	8b 55 0c             	mov    0xc(%ebp),%edx
 124:	8b 12                	mov    (%edx),%edx
 126:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(arg1_int == 35);
 129:	83 f8 23             	cmp    $0x23,%eax
 12c:	75 60                	jne    18e <worker+0x7c>
   assert(arg2_int == 42);
 12e:	83 fa 2a             	cmp    $0x2a,%edx
 131:	0f 85 a0 00 00 00    	jne    1d7 <worker+0xc5>
   assert(global == 1);
 137:	a1 d0 0e 00 00       	mov    0xed0,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 24 0a 00 00       	push   $0xa24
 14c:	68 2e 0a 00 00       	push   $0xa2e
 151:	6a 01                	push   $0x1
 153:	e8 1f 06 00 00       	call   777 <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 81 0a 00 00       	push   $0xa81
 160:	68 45 0a 00 00       	push   $0xa45
 165:	6a 01                	push   $0x1
 167:	e8 0b 06 00 00       	call   777 <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 59 0a 00 00       	push   $0xa59
 174:	6a 01                	push   $0x1
 176:	e8 fc 05 00 00       	call   777 <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 d4 0e 00 00    	push   0xed4
 184:	e8 c9 04 00 00       	call   652 <kill>
 189:	e8 94 04 00 00       	call   622 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 24 0a 00 00       	push   $0xa24
 195:	68 2e 0a 00 00       	push   $0xa2e
 19a:	6a 01                	push   $0x1
 19c:	e8 d6 05 00 00       	call   777 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 36 0a 00 00       	push   $0xa36
 1a9:	68 45 0a 00 00       	push   $0xa45
 1ae:	6a 01                	push   $0x1
 1b0:	e8 c2 05 00 00       	call   777 <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 59 0a 00 00       	push   $0xa59
 1bd:	6a 01                	push   $0x1
 1bf:	e8 b3 05 00 00       	call   777 <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 d4 0e 00 00    	push   0xed4
 1cd:	e8 80 04 00 00       	call   652 <kill>
 1d2:	e8 4b 04 00 00       	call   622 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 24 0a 00 00       	push   $0xa24
 1de:	68 2e 0a 00 00       	push   $0xa2e
 1e3:	6a 01                	push   $0x1
 1e5:	e8 8d 05 00 00       	call   777 <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 66 0a 00 00       	push   $0xa66
 1f2:	68 45 0a 00 00       	push   $0xa45
 1f7:	6a 01                	push   $0x1
 1f9:	e8 79 05 00 00       	call   777 <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 59 0a 00 00       	push   $0xa59
 206:	6a 01                	push   $0x1
 208:	e8 6a 05 00 00       	call   777 <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 d4 0e 00 00    	push   0xed4
 216:	e8 37 04 00 00       	call   652 <kill>
 21b:	e8 02 04 00 00       	call   622 <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 d0 0e 00 00       	mov    %eax,0xed0
   int nested_thread_pid = thread_create(nested_worker, &arg1_int, &arg2_int);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 45 f0             	lea    -0x10(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 232:	50                   	push   %eax
 233:	68 00 00 00 00       	push   $0x0
 238:	e8 44 03 00 00       	call   581 <thread_create>
 23d:	89 c3                	mov    %eax,%ebx
   int nested_join_pid = thread_join();
 23f:	e8 72 03 00 00       	call   5b6 <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
 24d:	68 24 0a 00 00       	push   $0xa24
 252:	68 2e 0a 00 00       	push   $0xa2e
 257:	6a 01                	push   $0x1
 259:	e8 19 05 00 00       	call   777 <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 cc 0a 00 00       	push   $0xacc
 266:	68 45 0a 00 00       	push   $0xa45
 26b:	6a 01                	push   $0x1
 26d:	e8 05 05 00 00       	call   777 <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 59 0a 00 00       	push   $0xa59
 27a:	6a 01                	push   $0x1
 27c:	e8 f6 04 00 00       	call   777 <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 d4 0e 00 00    	push   0xed4
 28a:	e8 c3 03 00 00       	call   652 <kill>
 28f:	e8 8e 03 00 00       	call   622 <exit>
   exit();
 294:	e8 89 03 00 00       	call   622 <exit>

00000299 <main>:
{
 299:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 29d:	83 e4 f0             	and    $0xfffffff0,%esp
 2a0:	ff 71 fc             	push   -0x4(%ecx)
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	53                   	push   %ebx
 2a7:	51                   	push   %ecx
 2a8:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2ab:	e8 f2 03 00 00       	call   6a2 <getpid>
 2b0:	a3 d4 0e 00 00       	mov    %eax,0xed4
   int arg1 = 35;
 2b5:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 2bc:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2c3:	83 ec 04             	sub    $0x4,%esp
 2c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2c9:	50                   	push   %eax
 2ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2cd:	50                   	push   %eax
 2ce:	68 12 01 00 00       	push   $0x112
 2d3:	e8 a9 02 00 00       	call   581 <thread_create>
   assert(thread_pid > 0);
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	85 c0                	test   %eax,%eax
 2dd:	7e 65                	jle    344 <main+0xab>
 2df:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 2e1:	e8 d0 02 00 00       	call   5b6 <thread_join>
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
 2ee:	83 3d d0 0e 00 00 03 	cmpl   $0x3,0xed0
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 24 0a 00 00       	push   $0xa24
 302:	68 2e 0a 00 00       	push   $0xa2e
 307:	6a 01                	push   $0x1
 309:	e8 69 04 00 00       	call   777 <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 b3 0a 00 00       	push   $0xab3
 316:	68 45 0a 00 00       	push   $0xa45
 31b:	6a 01                	push   $0x1
 31d:	e8 55 04 00 00       	call   777 <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 59 0a 00 00       	push   $0xa59
 32a:	6a 01                	push   $0x1
 32c:	e8 46 04 00 00       	call   777 <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 d4 0e 00 00    	push   0xed4
 33a:	e8 13 03 00 00       	call   652 <kill>
 33f:	e8 de 02 00 00       	call   622 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 24 0a 00 00       	push   $0xa24
 34b:	68 2e 0a 00 00       	push   $0xa2e
 350:	6a 01                	push   $0x1
 352:	e8 20 04 00 00       	call   777 <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 8d 0a 00 00       	push   $0xa8d
 35f:	68 45 0a 00 00       	push   $0xa45
 364:	6a 01                	push   $0x1
 366:	e8 0c 04 00 00       	call   777 <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 59 0a 00 00       	push   $0xa59
 373:	6a 01                	push   $0x1
 375:	e8 fd 03 00 00       	call   777 <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 d4 0e 00 00    	push   0xed4
 383:	e8 ca 02 00 00       	call   652 <kill>
 388:	e8 95 02 00 00       	call   622 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 24 0a 00 00       	push   $0xa24
 394:	68 2e 0a 00 00       	push   $0xa2e
 399:	6a 01                	push   $0x1
 39b:	e8 d7 03 00 00       	call   777 <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 9c 0a 00 00       	push   $0xa9c
 3a8:	68 45 0a 00 00       	push   $0xa45
 3ad:	6a 01                	push   $0x1
 3af:	e8 c3 03 00 00       	call   777 <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 59 0a 00 00       	push   $0xa59
 3bc:	6a 01                	push   $0x1
 3be:	e8 b4 03 00 00       	call   777 <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 d4 0e 00 00    	push   0xed4
 3cc:	e8 81 02 00 00       	call   652 <kill>
 3d1:	e8 4c 02 00 00       	call   622 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 bf 0a 00 00       	push   $0xabf
 3de:	6a 01                	push   $0x1
 3e0:	e8 92 03 00 00       	call   777 <printf>
   exit();
 3e5:	e8 38 02 00 00       	call   622 <exit>

000003ea <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	56                   	push   %esi
 3ee:	53                   	push   %ebx
 3ef:	8b 75 08             	mov    0x8(%ebp),%esi
 3f2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3f5:	89 f0                	mov    %esi,%eax
 3f7:	89 d1                	mov    %edx,%ecx
 3f9:	83 c2 01             	add    $0x1,%edx
 3fc:	89 c3                	mov    %eax,%ebx
 3fe:	83 c0 01             	add    $0x1,%eax
 401:	0f b6 09             	movzbl (%ecx),%ecx
 404:	88 0b                	mov    %cl,(%ebx)
 406:	84 c9                	test   %cl,%cl
 408:	75 ed                	jne    3f7 <strcpy+0xd>
    ;
  return os;
}
 40a:	89 f0                	mov    %esi,%eax
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5d                   	pop    %ebp
 40f:	c3                   	ret    

00000410 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 4d 08             	mov    0x8(%ebp),%ecx
 416:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 419:	eb 06                	jmp    421 <strcmp+0x11>
    p++, q++;
 41b:	83 c1 01             	add    $0x1,%ecx
 41e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 421:	0f b6 01             	movzbl (%ecx),%eax
 424:	84 c0                	test   %al,%al
 426:	74 04                	je     42c <strcmp+0x1c>
 428:	3a 02                	cmp    (%edx),%al
 42a:	74 ef                	je     41b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 42c:	0f b6 c0             	movzbl %al,%eax
 42f:	0f b6 12             	movzbl (%edx),%edx
 432:	29 d0                	sub    %edx,%eax
}
 434:	5d                   	pop    %ebp
 435:	c3                   	ret    

00000436 <strlen>:

uint
strlen(const char *s)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 43c:	b8 00 00 00 00       	mov    $0x0,%eax
 441:	eb 03                	jmp    446 <strlen+0x10>
 443:	83 c0 01             	add    $0x1,%eax
 446:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 44a:	75 f7                	jne    443 <strlen+0xd>
    ;
  return n;
}
 44c:	5d                   	pop    %ebp
 44d:	c3                   	ret    

0000044e <memset>:

void*
memset(void *dst, int c, uint n)
{
 44e:	55                   	push   %ebp
 44f:	89 e5                	mov    %esp,%ebp
 451:	57                   	push   %edi
 452:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 455:	89 d7                	mov    %edx,%edi
 457:	8b 4d 10             	mov    0x10(%ebp),%ecx
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	fc                   	cld    
 45e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 460:	89 d0                	mov    %edx,%eax
 462:	8b 7d fc             	mov    -0x4(%ebp),%edi
 465:	c9                   	leave  
 466:	c3                   	ret    

00000467 <strchr>:

char*
strchr(const char *s, char c)
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 471:	eb 03                	jmp    476 <strchr+0xf>
 473:	83 c0 01             	add    $0x1,%eax
 476:	0f b6 10             	movzbl (%eax),%edx
 479:	84 d2                	test   %dl,%dl
 47b:	74 06                	je     483 <strchr+0x1c>
    if(*s == c)
 47d:	38 ca                	cmp    %cl,%dl
 47f:	75 f2                	jne    473 <strchr+0xc>
 481:	eb 05                	jmp    488 <strchr+0x21>
      return (char*)s;
  return 0;
 483:	b8 00 00 00 00       	mov    $0x0,%eax
}
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    

0000048a <gets>:

char*
gets(char *buf, int max)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	57                   	push   %edi
 48e:	56                   	push   %esi
 48f:	53                   	push   %ebx
 490:	83 ec 1c             	sub    $0x1c,%esp
 493:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 496:	bb 00 00 00 00       	mov    $0x0,%ebx
 49b:	89 de                	mov    %ebx,%esi
 49d:	83 c3 01             	add    $0x1,%ebx
 4a0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4a3:	7d 2e                	jge    4d3 <gets+0x49>
    cc = read(0, &c, 1);
 4a5:	83 ec 04             	sub    $0x4,%esp
 4a8:	6a 01                	push   $0x1
 4aa:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ad:	50                   	push   %eax
 4ae:	6a 00                	push   $0x0
 4b0:	e8 85 01 00 00       	call   63a <read>
    if(cc < 1)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	85 c0                	test   %eax,%eax
 4ba:	7e 17                	jle    4d3 <gets+0x49>
      break;
    buf[i++] = c;
 4bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4c0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4c3:	3c 0a                	cmp    $0xa,%al
 4c5:	0f 94 c2             	sete   %dl
 4c8:	3c 0d                	cmp    $0xd,%al
 4ca:	0f 94 c0             	sete   %al
 4cd:	08 c2                	or     %al,%dl
 4cf:	74 ca                	je     49b <gets+0x11>
    buf[i++] = c;
 4d1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4d3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4d7:	89 f8                	mov    %edi,%eax
 4d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4dc:	5b                   	pop    %ebx
 4dd:	5e                   	pop    %esi
 4de:	5f                   	pop    %edi
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret    

000004e1 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e1:	55                   	push   %ebp
 4e2:	89 e5                	mov    %esp,%ebp
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e6:	83 ec 08             	sub    $0x8,%esp
 4e9:	6a 00                	push   $0x0
 4eb:	ff 75 08             	push   0x8(%ebp)
 4ee:	e8 6f 01 00 00       	call   662 <open>
  if(fd < 0)
 4f3:	83 c4 10             	add    $0x10,%esp
 4f6:	85 c0                	test   %eax,%eax
 4f8:	78 24                	js     51e <stat+0x3d>
 4fa:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4fc:	83 ec 08             	sub    $0x8,%esp
 4ff:	ff 75 0c             	push   0xc(%ebp)
 502:	50                   	push   %eax
 503:	e8 72 01 00 00       	call   67a <fstat>
 508:	89 c6                	mov    %eax,%esi
  close(fd);
 50a:	89 1c 24             	mov    %ebx,(%esp)
 50d:	e8 38 01 00 00       	call   64a <close>
  return r;
 512:	83 c4 10             	add    $0x10,%esp
}
 515:	89 f0                	mov    %esi,%eax
 517:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51a:	5b                   	pop    %ebx
 51b:	5e                   	pop    %esi
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret    
    return -1;
 51e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 523:	eb f0                	jmp    515 <stat+0x34>

00000525 <atoi>:

int
atoi(const char *s)
{
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	53                   	push   %ebx
 529:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 52c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 531:	eb 10                	jmp    543 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 533:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 536:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 539:	83 c1 01             	add    $0x1,%ecx
 53c:	0f be c0             	movsbl %al,%eax
 53f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 543:	0f b6 01             	movzbl (%ecx),%eax
 546:	8d 58 d0             	lea    -0x30(%eax),%ebx
 549:	80 fb 09             	cmp    $0x9,%bl
 54c:	76 e5                	jbe    533 <atoi+0xe>
  return n;
}
 54e:	89 d0                	mov    %edx,%eax
 550:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 553:	c9                   	leave  
 554:	c3                   	ret    

00000555 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 555:	55                   	push   %ebp
 556:	89 e5                	mov    %esp,%ebp
 558:	56                   	push   %esi
 559:	53                   	push   %ebx
 55a:	8b 75 08             	mov    0x8(%ebp),%esi
 55d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 560:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 563:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 565:	eb 0d                	jmp    574 <memmove+0x1f>
    *dst++ = *src++;
 567:	0f b6 01             	movzbl (%ecx),%eax
 56a:	88 02                	mov    %al,(%edx)
 56c:	8d 49 01             	lea    0x1(%ecx),%ecx
 56f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 572:	89 d8                	mov    %ebx,%eax
 574:	8d 58 ff             	lea    -0x1(%eax),%ebx
 577:	85 c0                	test   %eax,%eax
 579:	7f ec                	jg     567 <memmove+0x12>
  return vdst;
}
 57b:	89 f0                	mov    %esi,%eax
 57d:	5b                   	pop    %ebx
 57e:	5e                   	pop    %esi
 57f:	5d                   	pop    %ebp
 580:	c3                   	ret    

00000581 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 581:	55                   	push   %ebp
 582:	89 e5                	mov    %esp,%ebp
 584:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 587:	68 00 20 00 00       	push   $0x2000
 58c:	e8 0c 04 00 00       	call   99d <malloc>
  if((uint)(stack) % PGSIZE != 0){
 591:	83 c4 10             	add    $0x10,%esp
 594:	a9 ff 0f 00 00       	test   $0xfff,%eax
 599:	74 0a                	je     5a5 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 59b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 5a0:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 5a5:	50                   	push   %eax
 5a6:	ff 75 10             	push   0x10(%ebp)
 5a9:	ff 75 0c             	push   0xc(%ebp)
 5ac:	ff 75 08             	push   0x8(%ebp)
 5af:	e8 0e 01 00 00       	call   6c2 <clone>
  return pid;
}
 5b4:	c9                   	leave  
 5b5:	c3                   	ret    

000005b6 <thread_join>:
int
thread_join()
{
 5b6:	55                   	push   %ebp
 5b7:	89 e5                	mov    %esp,%ebp
 5b9:	53                   	push   %ebx
 5ba:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 5bd:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5c0:	50                   	push   %eax
 5c1:	e8 04 01 00 00       	call   6ca <join>
 5c6:	89 c3                	mov    %eax,%ebx
  free(stack);
 5c8:	83 c4 04             	add    $0x4,%esp
 5cb:	ff 75 f4             	push   -0xc(%ebp)
 5ce:	e8 0a 03 00 00       	call   8dd <free>
  return pid;
}
 5d3:	89 d8                	mov    %ebx,%eax
 5d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d8:	c9                   	leave  
 5d9:	c3                   	ret    

000005da <lock_init>:
int
lock_init(lock_t * lock){
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 5e6:	b8 00 00 00 00       	mov    $0x0,%eax
 5eb:	5d                   	pop    %ebp
 5ec:	c3                   	ret    

000005ed <lock_acquire>:
int
lock_acquire(lock_t * lock){
 5ed:	55                   	push   %ebp
 5ee:	89 e5                	mov    %esp,%ebp
 5f0:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5f3:	b8 01 00 00 00       	mov    $0x1,%eax
 5f8:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 5fb:	83 f8 01             	cmp    $0x1,%eax
 5fe:	74 f3                	je     5f3 <lock_acquire+0x6>
  {

  }
  return 0;
}
 600:	b8 00 00 00 00       	mov    $0x0,%eax
 605:	5d                   	pop    %ebp
 606:	c3                   	ret    

00000607 <lock_release>:
int
lock_release(lock_t * lock){
 607:	55                   	push   %ebp
 608:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 60a:	8b 45 08             	mov    0x8(%ebp),%eax
 60d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 613:	b8 00 00 00 00       	mov    $0x0,%eax
 618:	5d                   	pop    %ebp
 619:	c3                   	ret    

0000061a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 61a:	b8 01 00 00 00       	mov    $0x1,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <exit>:
SYSCALL(exit)
 622:	b8 02 00 00 00       	mov    $0x2,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <wait>:
SYSCALL(wait)
 62a:	b8 03 00 00 00       	mov    $0x3,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <pipe>:
SYSCALL(pipe)
 632:	b8 04 00 00 00       	mov    $0x4,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <read>:
SYSCALL(read)
 63a:	b8 05 00 00 00       	mov    $0x5,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <write>:
SYSCALL(write)
 642:	b8 10 00 00 00       	mov    $0x10,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <close>:
SYSCALL(close)
 64a:	b8 15 00 00 00       	mov    $0x15,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <kill>:
SYSCALL(kill)
 652:	b8 06 00 00 00       	mov    $0x6,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <exec>:
SYSCALL(exec)
 65a:	b8 07 00 00 00       	mov    $0x7,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <open>:
SYSCALL(open)
 662:	b8 0f 00 00 00       	mov    $0xf,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <mknod>:
SYSCALL(mknod)
 66a:	b8 11 00 00 00       	mov    $0x11,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <unlink>:
SYSCALL(unlink)
 672:	b8 12 00 00 00       	mov    $0x12,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <fstat>:
SYSCALL(fstat)
 67a:	b8 08 00 00 00       	mov    $0x8,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <link>:
SYSCALL(link)
 682:	b8 13 00 00 00       	mov    $0x13,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <mkdir>:
SYSCALL(mkdir)
 68a:	b8 14 00 00 00       	mov    $0x14,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <chdir>:
SYSCALL(chdir)
 692:	b8 09 00 00 00       	mov    $0x9,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <dup>:
SYSCALL(dup)
 69a:	b8 0a 00 00 00       	mov    $0xa,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <getpid>:
SYSCALL(getpid)
 6a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <sbrk>:
SYSCALL(sbrk)
 6aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <sleep>:
SYSCALL(sleep)
 6b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <uptime>:
SYSCALL(uptime)
 6ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <clone>:
SYSCALL(clone)
 6c2:	b8 16 00 00 00       	mov    $0x16,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <join>:
SYSCALL(join)
 6ca:	b8 17 00 00 00       	mov    $0x17,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6d2:	55                   	push   %ebp
 6d3:	89 e5                	mov    %esp,%ebp
 6d5:	83 ec 1c             	sub    $0x1c,%esp
 6d8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6db:	6a 01                	push   $0x1
 6dd:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6e0:	52                   	push   %edx
 6e1:	50                   	push   %eax
 6e2:	e8 5b ff ff ff       	call   642 <write>
}
 6e7:	83 c4 10             	add    $0x10,%esp
 6ea:	c9                   	leave  
 6eb:	c3                   	ret    

000006ec <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6ec:	55                   	push   %ebp
 6ed:	89 e5                	mov    %esp,%ebp
 6ef:	57                   	push   %edi
 6f0:	56                   	push   %esi
 6f1:	53                   	push   %ebx
 6f2:	83 ec 2c             	sub    $0x2c,%esp
 6f5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6f8:	89 d0                	mov    %edx,%eax
 6fa:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6fc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 700:	0f 95 c1             	setne  %cl
 703:	c1 ea 1f             	shr    $0x1f,%edx
 706:	84 d1                	test   %dl,%cl
 708:	74 44                	je     74e <printint+0x62>
    neg = 1;
    x = -xx;
 70a:	f7 d8                	neg    %eax
 70c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 70e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 715:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 71a:	89 c8                	mov    %ecx,%eax
 71c:	ba 00 00 00 00       	mov    $0x0,%edx
 721:	f7 f6                	div    %esi
 723:	89 df                	mov    %ebx,%edi
 725:	83 c3 01             	add    $0x1,%ebx
 728:	0f b6 92 50 0b 00 00 	movzbl 0xb50(%edx),%edx
 72f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 733:	89 ca                	mov    %ecx,%edx
 735:	89 c1                	mov    %eax,%ecx
 737:	39 d6                	cmp    %edx,%esi
 739:	76 df                	jbe    71a <printint+0x2e>
  if(neg)
 73b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 73f:	74 31                	je     772 <printint+0x86>
    buf[i++] = '-';
 741:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 746:	8d 5f 02             	lea    0x2(%edi),%ebx
 749:	8b 75 d0             	mov    -0x30(%ebp),%esi
 74c:	eb 17                	jmp    765 <printint+0x79>
    x = xx;
 74e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 750:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 757:	eb bc                	jmp    715 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 759:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 75e:	89 f0                	mov    %esi,%eax
 760:	e8 6d ff ff ff       	call   6d2 <putc>
  while(--i >= 0)
 765:	83 eb 01             	sub    $0x1,%ebx
 768:	79 ef                	jns    759 <printint+0x6d>
}
 76a:	83 c4 2c             	add    $0x2c,%esp
 76d:	5b                   	pop    %ebx
 76e:	5e                   	pop    %esi
 76f:	5f                   	pop    %edi
 770:	5d                   	pop    %ebp
 771:	c3                   	ret    
 772:	8b 75 d0             	mov    -0x30(%ebp),%esi
 775:	eb ee                	jmp    765 <printint+0x79>

00000777 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 777:	55                   	push   %ebp
 778:	89 e5                	mov    %esp,%ebp
 77a:	57                   	push   %edi
 77b:	56                   	push   %esi
 77c:	53                   	push   %ebx
 77d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 780:	8d 45 10             	lea    0x10(%ebp),%eax
 783:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 786:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 78b:	bb 00 00 00 00       	mov    $0x0,%ebx
 790:	eb 14                	jmp    7a6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 792:	89 fa                	mov    %edi,%edx
 794:	8b 45 08             	mov    0x8(%ebp),%eax
 797:	e8 36 ff ff ff       	call   6d2 <putc>
 79c:	eb 05                	jmp    7a3 <printf+0x2c>
      }
    } else if(state == '%'){
 79e:	83 fe 25             	cmp    $0x25,%esi
 7a1:	74 25                	je     7c8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7a3:	83 c3 01             	add    $0x1,%ebx
 7a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 7a9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7ad:	84 c0                	test   %al,%al
 7af:	0f 84 20 01 00 00    	je     8d5 <printf+0x15e>
    c = fmt[i] & 0xff;
 7b5:	0f be f8             	movsbl %al,%edi
 7b8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7bb:	85 f6                	test   %esi,%esi
 7bd:	75 df                	jne    79e <printf+0x27>
      if(c == '%'){
 7bf:	83 f8 25             	cmp    $0x25,%eax
 7c2:	75 ce                	jne    792 <printf+0x1b>
        state = '%';
 7c4:	89 c6                	mov    %eax,%esi
 7c6:	eb db                	jmp    7a3 <printf+0x2c>
      if(c == 'd'){
 7c8:	83 f8 25             	cmp    $0x25,%eax
 7cb:	0f 84 cf 00 00 00    	je     8a0 <printf+0x129>
 7d1:	0f 8c dd 00 00 00    	jl     8b4 <printf+0x13d>
 7d7:	83 f8 78             	cmp    $0x78,%eax
 7da:	0f 8f d4 00 00 00    	jg     8b4 <printf+0x13d>
 7e0:	83 f8 63             	cmp    $0x63,%eax
 7e3:	0f 8c cb 00 00 00    	jl     8b4 <printf+0x13d>
 7e9:	83 e8 63             	sub    $0x63,%eax
 7ec:	83 f8 15             	cmp    $0x15,%eax
 7ef:	0f 87 bf 00 00 00    	ja     8b4 <printf+0x13d>
 7f5:	ff 24 85 f8 0a 00 00 	jmp    *0xaf8(,%eax,4)
        printint(fd, *ap, 10, 1);
 7fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ff:	8b 17                	mov    (%edi),%edx
 801:	83 ec 0c             	sub    $0xc,%esp
 804:	6a 01                	push   $0x1
 806:	b9 0a 00 00 00       	mov    $0xa,%ecx
 80b:	8b 45 08             	mov    0x8(%ebp),%eax
 80e:	e8 d9 fe ff ff       	call   6ec <printint>
        ap++;
 813:	83 c7 04             	add    $0x4,%edi
 816:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 819:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 81c:	be 00 00 00 00       	mov    $0x0,%esi
 821:	eb 80                	jmp    7a3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 823:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 826:	8b 17                	mov    (%edi),%edx
 828:	83 ec 0c             	sub    $0xc,%esp
 82b:	6a 00                	push   $0x0
 82d:	b9 10 00 00 00       	mov    $0x10,%ecx
 832:	8b 45 08             	mov    0x8(%ebp),%eax
 835:	e8 b2 fe ff ff       	call   6ec <printint>
        ap++;
 83a:	83 c7 04             	add    $0x4,%edi
 83d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 840:	83 c4 10             	add    $0x10,%esp
      state = 0;
 843:	be 00 00 00 00       	mov    $0x0,%esi
 848:	e9 56 ff ff ff       	jmp    7a3 <printf+0x2c>
        s = (char*)*ap;
 84d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 850:	8b 30                	mov    (%eax),%esi
        ap++;
 852:	83 c0 04             	add    $0x4,%eax
 855:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 858:	85 f6                	test   %esi,%esi
 85a:	75 15                	jne    871 <printf+0xfa>
          s = "(null)";
 85c:	be f1 0a 00 00       	mov    $0xaf1,%esi
 861:	eb 0e                	jmp    871 <printf+0xfa>
          putc(fd, *s);
 863:	0f be d2             	movsbl %dl,%edx
 866:	8b 45 08             	mov    0x8(%ebp),%eax
 869:	e8 64 fe ff ff       	call   6d2 <putc>
          s++;
 86e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 871:	0f b6 16             	movzbl (%esi),%edx
 874:	84 d2                	test   %dl,%dl
 876:	75 eb                	jne    863 <printf+0xec>
      state = 0;
 878:	be 00 00 00 00       	mov    $0x0,%esi
 87d:	e9 21 ff ff ff       	jmp    7a3 <printf+0x2c>
        putc(fd, *ap);
 882:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 885:	0f be 17             	movsbl (%edi),%edx
 888:	8b 45 08             	mov    0x8(%ebp),%eax
 88b:	e8 42 fe ff ff       	call   6d2 <putc>
        ap++;
 890:	83 c7 04             	add    $0x4,%edi
 893:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 896:	be 00 00 00 00       	mov    $0x0,%esi
 89b:	e9 03 ff ff ff       	jmp    7a3 <printf+0x2c>
        putc(fd, c);
 8a0:	89 fa                	mov    %edi,%edx
 8a2:	8b 45 08             	mov    0x8(%ebp),%eax
 8a5:	e8 28 fe ff ff       	call   6d2 <putc>
      state = 0;
 8aa:	be 00 00 00 00       	mov    $0x0,%esi
 8af:	e9 ef fe ff ff       	jmp    7a3 <printf+0x2c>
        putc(fd, '%');
 8b4:	ba 25 00 00 00       	mov    $0x25,%edx
 8b9:	8b 45 08             	mov    0x8(%ebp),%eax
 8bc:	e8 11 fe ff ff       	call   6d2 <putc>
        putc(fd, c);
 8c1:	89 fa                	mov    %edi,%edx
 8c3:	8b 45 08             	mov    0x8(%ebp),%eax
 8c6:	e8 07 fe ff ff       	call   6d2 <putc>
      state = 0;
 8cb:	be 00 00 00 00       	mov    $0x0,%esi
 8d0:	e9 ce fe ff ff       	jmp    7a3 <printf+0x2c>
    }
  }
}
 8d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8d8:	5b                   	pop    %ebx
 8d9:	5e                   	pop    %esi
 8da:	5f                   	pop    %edi
 8db:	5d                   	pop    %ebp
 8dc:	c3                   	ret    

000008dd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8dd:	55                   	push   %ebp
 8de:	89 e5                	mov    %esp,%ebp
 8e0:	57                   	push   %edi
 8e1:	56                   	push   %esi
 8e2:	53                   	push   %ebx
 8e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8e6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e9:	a1 d8 0e 00 00       	mov    0xed8,%eax
 8ee:	eb 02                	jmp    8f2 <free+0x15>
 8f0:	89 d0                	mov    %edx,%eax
 8f2:	39 c8                	cmp    %ecx,%eax
 8f4:	73 04                	jae    8fa <free+0x1d>
 8f6:	39 08                	cmp    %ecx,(%eax)
 8f8:	77 12                	ja     90c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8fa:	8b 10                	mov    (%eax),%edx
 8fc:	39 c2                	cmp    %eax,%edx
 8fe:	77 f0                	ja     8f0 <free+0x13>
 900:	39 c8                	cmp    %ecx,%eax
 902:	72 08                	jb     90c <free+0x2f>
 904:	39 ca                	cmp    %ecx,%edx
 906:	77 04                	ja     90c <free+0x2f>
 908:	89 d0                	mov    %edx,%eax
 90a:	eb e6                	jmp    8f2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 90c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 90f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 912:	8b 10                	mov    (%eax),%edx
 914:	39 d7                	cmp    %edx,%edi
 916:	74 19                	je     931 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 918:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 91b:	8b 50 04             	mov    0x4(%eax),%edx
 91e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 921:	39 ce                	cmp    %ecx,%esi
 923:	74 1b                	je     940 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 925:	89 08                	mov    %ecx,(%eax)
  freep = p;
 927:	a3 d8 0e 00 00       	mov    %eax,0xed8
}
 92c:	5b                   	pop    %ebx
 92d:	5e                   	pop    %esi
 92e:	5f                   	pop    %edi
 92f:	5d                   	pop    %ebp
 930:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 931:	03 72 04             	add    0x4(%edx),%esi
 934:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 937:	8b 10                	mov    (%eax),%edx
 939:	8b 12                	mov    (%edx),%edx
 93b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 93e:	eb db                	jmp    91b <free+0x3e>
    p->s.size += bp->s.size;
 940:	03 53 fc             	add    -0x4(%ebx),%edx
 943:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 946:	8b 53 f8             	mov    -0x8(%ebx),%edx
 949:	89 10                	mov    %edx,(%eax)
 94b:	eb da                	jmp    927 <free+0x4a>

0000094d <morecore>:

static Header*
morecore(uint nu)
{
 94d:	55                   	push   %ebp
 94e:	89 e5                	mov    %esp,%ebp
 950:	53                   	push   %ebx
 951:	83 ec 04             	sub    $0x4,%esp
 954:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 956:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 95b:	77 05                	ja     962 <morecore+0x15>
    nu = 4096;
 95d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 962:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 969:	83 ec 0c             	sub    $0xc,%esp
 96c:	50                   	push   %eax
 96d:	e8 38 fd ff ff       	call   6aa <sbrk>
  if(p == (char*)-1)
 972:	83 c4 10             	add    $0x10,%esp
 975:	83 f8 ff             	cmp    $0xffffffff,%eax
 978:	74 1c                	je     996 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 97a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 97d:	83 c0 08             	add    $0x8,%eax
 980:	83 ec 0c             	sub    $0xc,%esp
 983:	50                   	push   %eax
 984:	e8 54 ff ff ff       	call   8dd <free>
  return freep;
 989:	a1 d8 0e 00 00       	mov    0xed8,%eax
 98e:	83 c4 10             	add    $0x10,%esp
}
 991:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 994:	c9                   	leave  
 995:	c3                   	ret    
    return 0;
 996:	b8 00 00 00 00       	mov    $0x0,%eax
 99b:	eb f4                	jmp    991 <morecore+0x44>

0000099d <malloc>:

void*
malloc(uint nbytes)
{
 99d:	55                   	push   %ebp
 99e:	89 e5                	mov    %esp,%ebp
 9a0:	53                   	push   %ebx
 9a1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a4:	8b 45 08             	mov    0x8(%ebp),%eax
 9a7:	8d 58 07             	lea    0x7(%eax),%ebx
 9aa:	c1 eb 03             	shr    $0x3,%ebx
 9ad:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9b0:	8b 0d d8 0e 00 00    	mov    0xed8,%ecx
 9b6:	85 c9                	test   %ecx,%ecx
 9b8:	74 04                	je     9be <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ba:	8b 01                	mov    (%ecx),%eax
 9bc:	eb 4a                	jmp    a08 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9be:	c7 05 d8 0e 00 00 dc 	movl   $0xedc,0xed8
 9c5:	0e 00 00 
 9c8:	c7 05 dc 0e 00 00 dc 	movl   $0xedc,0xedc
 9cf:	0e 00 00 
    base.s.size = 0;
 9d2:	c7 05 e0 0e 00 00 00 	movl   $0x0,0xee0
 9d9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9dc:	b9 dc 0e 00 00       	mov    $0xedc,%ecx
 9e1:	eb d7                	jmp    9ba <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9e3:	74 19                	je     9fe <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9e5:	29 da                	sub    %ebx,%edx
 9e7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ea:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9ed:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9f0:	89 0d d8 0e 00 00    	mov    %ecx,0xed8
      return (void*)(p + 1);
 9f6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9fc:	c9                   	leave  
 9fd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9fe:	8b 10                	mov    (%eax),%edx
 a00:	89 11                	mov    %edx,(%ecx)
 a02:	eb ec                	jmp    9f0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a04:	89 c1                	mov    %eax,%ecx
 a06:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a08:	8b 50 04             	mov    0x4(%eax),%edx
 a0b:	39 da                	cmp    %ebx,%edx
 a0d:	73 d4                	jae    9e3 <malloc+0x46>
    if(p == freep)
 a0f:	39 05 d8 0e 00 00    	cmp    %eax,0xed8
 a15:	75 ed                	jne    a04 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a17:	89 d8                	mov    %ebx,%eax
 a19:	e8 2f ff ff ff       	call   94d <morecore>
 a1e:	85 c0                	test   %eax,%eax
 a20:	75 e2                	jne    a04 <malloc+0x67>
 a22:	eb d5                	jmp    9f9 <malloc+0x5c>
