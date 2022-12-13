
_test_13:     file format elf32-i386


Disassembly of section .text:

00000000 <fib>:
   exit(); \
}

void worker(void *arg1, void *arg2);

unsigned int fib(unsigned int n) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if (n == 0) {
   8:	85 db                	test   %ebx,%ebx
   a:	74 05                	je     11 <fib+0x11>
      return 0;
   } else if (n == 1) {
   c:	83 fb 01             	cmp    $0x1,%ebx
   f:	75 09                	jne    1a <fib+0x1a>
      return 1;
   } else {
      return fib(n - 1) + fib(n - 2);
   }
}
  11:	89 d8                	mov    %ebx,%eax
  13:	8d 65 f8             	lea    -0x8(%ebp),%esp
  16:	5b                   	pop    %ebx
  17:	5e                   	pop    %esi
  18:	5d                   	pop    %ebp
  19:	c3                   	ret    
      return fib(n - 1) + fib(n - 2);
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	8d 43 ff             	lea    -0x1(%ebx),%eax
  20:	50                   	push   %eax
  21:	e8 da ff ff ff       	call   0 <fib>
  26:	89 c6                	mov    %eax,%esi
  28:	83 eb 02             	sub    $0x2,%ebx
  2b:	89 1c 24             	mov    %ebx,(%esp)
  2e:	e8 cd ff ff ff       	call   0 <fib>
  33:	83 c4 10             	add    $0x10,%esp
  36:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  39:	eb d6                	jmp    11 <fib+0x11>

0000003b <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
  41:	8b 45 0c             	mov    0xc(%ebp),%eax
  44:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 11);
  46:	8b 45 08             	mov    0x8(%ebp),%eax
  49:	83 38 0b             	cmpl   $0xb,(%eax)
  4c:	75 5f                	jne    ad <worker+0x72>
   assert(tmp2 == 22);
  4e:	83 fa 16             	cmp    $0x16,%edx
  51:	0f 85 9f 00 00 00    	jne    f6 <worker+0xbb>
   assert(global == 1);
  57:	83 3d 20 0f 00 00 01 	cmpl   $0x1,0xf20
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 68 0a 00 00       	push   $0xa68
  6b:	68 72 0a 00 00       	push   $0xa72
  70:	6a 01                	push   $0x1
  72:	e8 42 07 00 00       	call   7b9 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 b1 0a 00 00       	push   $0xab1
  7f:	68 85 0a 00 00       	push   $0xa85
  84:	6a 01                	push   $0x1
  86:	e8 2e 07 00 00       	call   7b9 <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 99 0a 00 00       	push   $0xa99
  93:	6a 01                	push   $0x1
  95:	e8 1f 07 00 00       	call   7b9 <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 24 0f 00 00    	push   0xf24
  a3:	e8 ec 05 00 00       	call   694 <kill>
  a8:	e8 b7 05 00 00       	call   664 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 68 0a 00 00       	push   $0xa68
  b4:	68 72 0a 00 00       	push   $0xa72
  b9:	6a 01                	push   $0x1
  bb:	e8 f9 06 00 00       	call   7b9 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 7a 0a 00 00       	push   $0xa7a
  c8:	68 85 0a 00 00       	push   $0xa85
  cd:	6a 01                	push   $0x1
  cf:	e8 e5 06 00 00       	call   7b9 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 99 0a 00 00       	push   $0xa99
  dc:	6a 01                	push   $0x1
  de:	e8 d6 06 00 00       	call   7b9 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 24 0f 00 00    	push   0xf24
  ec:	e8 a3 05 00 00       	call   694 <kill>
  f1:	e8 6e 05 00 00       	call   664 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 68 0a 00 00       	push   $0xa68
  fd:	68 72 0a 00 00       	push   $0xa72
 102:	6a 01                	push   $0x1
 104:	e8 b0 06 00 00       	call   7b9 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 a6 0a 00 00       	push   $0xaa6
 111:	68 85 0a 00 00       	push   $0xa85
 116:	6a 01                	push   $0x1
 118:	e8 9c 06 00 00       	call   7b9 <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 99 0a 00 00       	push   $0xa99
 125:	6a 01                	push   $0x1
 127:	e8 8d 06 00 00       	call   7b9 <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 24 0f 00 00    	push   0xf24
 135:	e8 5a 05 00 00       	call   694 <kill>
 13a:	e8 25 05 00 00       	call   664 <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 68 0a 00 00       	push   $0xa68
 158:	68 72 0a 00 00       	push   $0xa72
 15d:	6a 01                	push   $0x1
 15f:	e8 55 06 00 00       	call   7b9 <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 bd 0a 00 00       	push   $0xabd
 16c:	68 85 0a 00 00       	push   $0xa85
 171:	6a 01                	push   $0x1
 173:	e8 41 06 00 00       	call   7b9 <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 99 0a 00 00       	push   $0xa99
 180:	6a 01                	push   $0x1
 182:	e8 32 06 00 00       	call   7b9 <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 24 0f 00 00    	push   0xf24
 190:	e8 ff 04 00 00       	call   694 <kill>
 195:	e8 ca 04 00 00       	call   664 <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 68 0a 00 00       	push   $0xa68
 1b3:	68 72 0a 00 00       	push   $0xa72
 1b8:	6a 01                	push   $0x1
 1ba:	e8 fa 05 00 00       	call   7b9 <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 c9 0a 00 00       	push   $0xac9
 1c7:	68 85 0a 00 00       	push   $0xa85
 1cc:	6a 01                	push   $0x1
 1ce:	e8 e6 05 00 00       	call   7b9 <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 99 0a 00 00       	push   $0xa99
 1db:	6a 01                	push   $0x1
 1dd:	e8 d7 05 00 00       	call   7b9 <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 24 0f 00 00    	push   0xf24
 1eb:	e8 a4 04 00 00       	call   694 <kill>
 1f0:	e8 6f 04 00 00       	call   664 <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 68 0a 00 00       	push   $0xa68
 20e:	68 72 0a 00 00       	push   $0xa72
 213:	6a 01                	push   $0x1
 215:	e8 9f 05 00 00       	call   7b9 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 d5 0a 00 00       	push   $0xad5
 222:	68 85 0a 00 00       	push   $0xa85
 227:	6a 01                	push   $0x1
 229:	e8 8b 05 00 00       	call   7b9 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 99 0a 00 00       	push   $0xa99
 236:	6a 01                	push   $0x1
 238:	e8 7c 05 00 00       	call   7b9 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 24 0f 00 00    	push   0xf24
 246:	e8 49 04 00 00       	call   694 <kill>
 24b:	e8 14 04 00 00       	call   664 <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 68 0a 00 00       	push   $0xa68
 26b:	68 72 0a 00 00       	push   $0xa72
 270:	6a 01                	push   $0x1
 272:	e8 42 05 00 00       	call   7b9 <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 e2 0a 00 00       	push   $0xae2
 27f:	68 85 0a 00 00       	push   $0xa85
 284:	6a 01                	push   $0x1
 286:	e8 2e 05 00 00       	call   7b9 <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 99 0a 00 00       	push   $0xa99
 293:	6a 01                	push   $0x1
 295:	e8 1f 05 00 00       	call   7b9 <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 24 0f 00 00    	push   0xf24
 2a3:	e8 ec 03 00 00       	call   694 <kill>
 2a8:	e8 b7 03 00 00       	call   664 <exit>
   exit();
 2ad:	e8 b2 03 00 00       	call   664 <exit>

000002b2 <main>:
{
 2b2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2b6:	83 e4 f0             	and    $0xfffffff0,%esp
 2b9:	ff 71 fc             	push   -0x4(%ecx)
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	53                   	push   %ebx
 2c0:	51                   	push   %ecx
 2c1:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2c4:	e8 1b 04 00 00       	call   6e4 <getpid>
 2c9:	a3 24 0f 00 00       	mov    %eax,0xf24
   assert(fib(28) == 317811);
 2ce:	83 ec 0c             	sub    $0xc,%esp
 2d1:	6a 1c                	push   $0x1c
 2d3:	e8 28 fd ff ff       	call   0 <fib>
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	3d 73 d9 04 00       	cmp    $0x4d973,%eax
 2e0:	75 40                	jne    322 <main+0x70>
   int arg1 = 11, arg2 = 22;
 2e2:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2e9:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   for (int i = 0; i < num_threads; i++) {
 2f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f5:	39 1d 1c 0f 00 00    	cmp    %ebx,0xf1c
 2fb:	0f 8e b3 00 00 00    	jle    3b4 <main+0x102>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 301:	83 ec 04             	sub    $0x4,%esp
 304:	8d 45 f0             	lea    -0x10(%ebp),%eax
 307:	50                   	push   %eax
 308:	8d 45 f4             	lea    -0xc(%ebp),%eax
 30b:	50                   	push   %eax
 30c:	68 3b 00 00 00       	push   $0x3b
 311:	e8 ad 02 00 00       	call   5c3 <thread_create>
      assert(thread_pid > 0);
 316:	83 c4 10             	add    $0x10,%esp
 319:	85 c0                	test   %eax,%eax
 31b:	7e 4e                	jle    36b <main+0xb9>
   for (int i = 0; i < num_threads; i++) {
 31d:	83 c3 01             	add    $0x1,%ebx
 320:	eb d3                	jmp    2f5 <main+0x43>
   assert(fib(28) == 317811);
 322:	6a 28                	push   $0x28
 324:	68 68 0a 00 00       	push   $0xa68
 329:	68 72 0a 00 00       	push   $0xa72
 32e:	6a 01                	push   $0x1
 330:	e8 84 04 00 00       	call   7b9 <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 f1 0a 00 00       	push   $0xaf1
 33d:	68 85 0a 00 00       	push   $0xa85
 342:	6a 01                	push   $0x1
 344:	e8 70 04 00 00       	call   7b9 <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 99 0a 00 00       	push   $0xa99
 351:	6a 01                	push   $0x1
 353:	e8 61 04 00 00       	call   7b9 <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 24 0f 00 00    	push   0xf24
 361:	e8 2e 03 00 00       	call   694 <kill>
 366:	e8 f9 02 00 00       	call   664 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 68 0a 00 00       	push   $0xa68
 372:	68 72 0a 00 00       	push   $0xa72
 377:	6a 01                	push   $0x1
 379:	e8 3b 04 00 00       	call   7b9 <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 03 0b 00 00       	push   $0xb03
 386:	68 85 0a 00 00       	push   $0xa85
 38b:	6a 01                	push   $0x1
 38d:	e8 27 04 00 00       	call   7b9 <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 99 0a 00 00       	push   $0xa99
 39a:	6a 01                	push   $0x1
 39c:	e8 18 04 00 00       	call   7b9 <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 24 0f 00 00    	push   0xf24
 3aa:	e8 e5 02 00 00       	call   694 <kill>
 3af:	e8 b0 02 00 00       	call   664 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d 1c 0f 00 00    	cmp    %ebx,0xf1c
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 32 02 00 00       	call   5f8 <thread_join>
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
 3d1:	68 68 0a 00 00       	push   $0xa68
 3d6:	68 72 0a 00 00       	push   $0xa72
 3db:	6a 01                	push   $0x1
 3dd:	e8 d7 03 00 00       	call   7b9 <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 12 0b 00 00       	push   $0xb12
 3ea:	68 85 0a 00 00       	push   $0xa85
 3ef:	6a 01                	push   $0x1
 3f1:	e8 c3 03 00 00       	call   7b9 <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 99 0a 00 00       	push   $0xa99
 3fe:	6a 01                	push   $0x1
 400:	e8 b4 03 00 00       	call   7b9 <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 24 0f 00 00    	push   0xf24
 40e:	e8 81 02 00 00       	call   694 <kill>
 413:	e8 4c 02 00 00       	call   664 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 1f 0b 00 00       	push   $0xb1f
 420:	6a 01                	push   $0x1
 422:	e8 92 03 00 00       	call   7b9 <printf>
   exit();
 427:	e8 38 02 00 00       	call   664 <exit>

0000042c <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	56                   	push   %esi
 430:	53                   	push   %ebx
 431:	8b 75 08             	mov    0x8(%ebp),%esi
 434:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 437:	89 f0                	mov    %esi,%eax
 439:	89 d1                	mov    %edx,%ecx
 43b:	83 c2 01             	add    $0x1,%edx
 43e:	89 c3                	mov    %eax,%ebx
 440:	83 c0 01             	add    $0x1,%eax
 443:	0f b6 09             	movzbl (%ecx),%ecx
 446:	88 0b                	mov    %cl,(%ebx)
 448:	84 c9                	test   %cl,%cl
 44a:	75 ed                	jne    439 <strcpy+0xd>
    ;
  return os;
}
 44c:	89 f0                	mov    %esi,%eax
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5d                   	pop    %ebp
 451:	c3                   	ret    

00000452 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	8b 4d 08             	mov    0x8(%ebp),%ecx
 458:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 45b:	eb 06                	jmp    463 <strcmp+0x11>
    p++, q++;
 45d:	83 c1 01             	add    $0x1,%ecx
 460:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 463:	0f b6 01             	movzbl (%ecx),%eax
 466:	84 c0                	test   %al,%al
 468:	74 04                	je     46e <strcmp+0x1c>
 46a:	3a 02                	cmp    (%edx),%al
 46c:	74 ef                	je     45d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 46e:	0f b6 c0             	movzbl %al,%eax
 471:	0f b6 12             	movzbl (%edx),%edx
 474:	29 d0                	sub    %edx,%eax
}
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    

00000478 <strlen>:

uint
strlen(const char *s)
{
 478:	55                   	push   %ebp
 479:	89 e5                	mov    %esp,%ebp
 47b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 47e:	b8 00 00 00 00       	mov    $0x0,%eax
 483:	eb 03                	jmp    488 <strlen+0x10>
 485:	83 c0 01             	add    $0x1,%eax
 488:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 48c:	75 f7                	jne    485 <strlen+0xd>
    ;
  return n;
}
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    

00000490 <memset>:

void*
memset(void *dst, int c, uint n)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 497:	89 d7                	mov    %edx,%edi
 499:	8b 4d 10             	mov    0x10(%ebp),%ecx
 49c:	8b 45 0c             	mov    0xc(%ebp),%eax
 49f:	fc                   	cld    
 4a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4a2:	89 d0                	mov    %edx,%eax
 4a4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4a7:	c9                   	leave  
 4a8:	c3                   	ret    

000004a9 <strchr>:

char*
strchr(const char *s, char c)
{
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
 4af:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4b3:	eb 03                	jmp    4b8 <strchr+0xf>
 4b5:	83 c0 01             	add    $0x1,%eax
 4b8:	0f b6 10             	movzbl (%eax),%edx
 4bb:	84 d2                	test   %dl,%dl
 4bd:	74 06                	je     4c5 <strchr+0x1c>
    if(*s == c)
 4bf:	38 ca                	cmp    %cl,%dl
 4c1:	75 f2                	jne    4b5 <strchr+0xc>
 4c3:	eb 05                	jmp    4ca <strchr+0x21>
      return (char*)s;
  return 0;
 4c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    

000004cc <gets>:

char*
gets(char *buf, int max)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	57                   	push   %edi
 4d0:	56                   	push   %esi
 4d1:	53                   	push   %ebx
 4d2:	83 ec 1c             	sub    $0x1c,%esp
 4d5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 4dd:	89 de                	mov    %ebx,%esi
 4df:	83 c3 01             	add    $0x1,%ebx
 4e2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4e5:	7d 2e                	jge    515 <gets+0x49>
    cc = read(0, &c, 1);
 4e7:	83 ec 04             	sub    $0x4,%esp
 4ea:	6a 01                	push   $0x1
 4ec:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ef:	50                   	push   %eax
 4f0:	6a 00                	push   $0x0
 4f2:	e8 85 01 00 00       	call   67c <read>
    if(cc < 1)
 4f7:	83 c4 10             	add    $0x10,%esp
 4fa:	85 c0                	test   %eax,%eax
 4fc:	7e 17                	jle    515 <gets+0x49>
      break;
    buf[i++] = c;
 4fe:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 502:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 505:	3c 0a                	cmp    $0xa,%al
 507:	0f 94 c2             	sete   %dl
 50a:	3c 0d                	cmp    $0xd,%al
 50c:	0f 94 c0             	sete   %al
 50f:	08 c2                	or     %al,%dl
 511:	74 ca                	je     4dd <gets+0x11>
    buf[i++] = c;
 513:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 515:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 519:	89 f8                	mov    %edi,%eax
 51b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <stat>:

int
stat(const char *n, struct stat *st)
{
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
 526:	56                   	push   %esi
 527:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 528:	83 ec 08             	sub    $0x8,%esp
 52b:	6a 00                	push   $0x0
 52d:	ff 75 08             	push   0x8(%ebp)
 530:	e8 6f 01 00 00       	call   6a4 <open>
  if(fd < 0)
 535:	83 c4 10             	add    $0x10,%esp
 538:	85 c0                	test   %eax,%eax
 53a:	78 24                	js     560 <stat+0x3d>
 53c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 53e:	83 ec 08             	sub    $0x8,%esp
 541:	ff 75 0c             	push   0xc(%ebp)
 544:	50                   	push   %eax
 545:	e8 72 01 00 00       	call   6bc <fstat>
 54a:	89 c6                	mov    %eax,%esi
  close(fd);
 54c:	89 1c 24             	mov    %ebx,(%esp)
 54f:	e8 38 01 00 00       	call   68c <close>
  return r;
 554:	83 c4 10             	add    $0x10,%esp
}
 557:	89 f0                	mov    %esi,%eax
 559:	8d 65 f8             	lea    -0x8(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    
    return -1;
 560:	be ff ff ff ff       	mov    $0xffffffff,%esi
 565:	eb f0                	jmp    557 <stat+0x34>

00000567 <atoi>:

int
atoi(const char *s)
{
 567:	55                   	push   %ebp
 568:	89 e5                	mov    %esp,%ebp
 56a:	53                   	push   %ebx
 56b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 56e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 573:	eb 10                	jmp    585 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 575:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 578:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 57b:	83 c1 01             	add    $0x1,%ecx
 57e:	0f be c0             	movsbl %al,%eax
 581:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 585:	0f b6 01             	movzbl (%ecx),%eax
 588:	8d 58 d0             	lea    -0x30(%eax),%ebx
 58b:	80 fb 09             	cmp    $0x9,%bl
 58e:	76 e5                	jbe    575 <atoi+0xe>
  return n;
}
 590:	89 d0                	mov    %edx,%eax
 592:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 595:	c9                   	leave  
 596:	c3                   	ret    

00000597 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	56                   	push   %esi
 59b:	53                   	push   %ebx
 59c:	8b 75 08             	mov    0x8(%ebp),%esi
 59f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5a2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5a5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5a7:	eb 0d                	jmp    5b6 <memmove+0x1f>
    *dst++ = *src++;
 5a9:	0f b6 01             	movzbl (%ecx),%eax
 5ac:	88 02                	mov    %al,(%edx)
 5ae:	8d 49 01             	lea    0x1(%ecx),%ecx
 5b1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5b4:	89 d8                	mov    %ebx,%eax
 5b6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5b9:	85 c0                	test   %eax,%eax
 5bb:	7f ec                	jg     5a9 <memmove+0x12>
  return vdst;
}
 5bd:	89 f0                	mov    %esi,%eax
 5bf:	5b                   	pop    %ebx
 5c0:	5e                   	pop    %esi
 5c1:	5d                   	pop    %ebp
 5c2:	c3                   	ret    

000005c3 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 5c3:	55                   	push   %ebp
 5c4:	89 e5                	mov    %esp,%ebp
 5c6:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 5c9:	68 00 20 00 00       	push   $0x2000
 5ce:	e8 0c 04 00 00       	call   9df <malloc>
  if((uint)(stack) % PGSIZE != 0){
 5d3:	83 c4 10             	add    $0x10,%esp
 5d6:	a9 ff 0f 00 00       	test   $0xfff,%eax
 5db:	74 0a                	je     5e7 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 5dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 5e2:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 5e7:	50                   	push   %eax
 5e8:	ff 75 10             	push   0x10(%ebp)
 5eb:	ff 75 0c             	push   0xc(%ebp)
 5ee:	ff 75 08             	push   0x8(%ebp)
 5f1:	e8 0e 01 00 00       	call   704 <clone>
  return pid;
}
 5f6:	c9                   	leave  
 5f7:	c3                   	ret    

000005f8 <thread_join>:
int
thread_join()
{
 5f8:	55                   	push   %ebp
 5f9:	89 e5                	mov    %esp,%ebp
 5fb:	53                   	push   %ebx
 5fc:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 5ff:	8d 45 f4             	lea    -0xc(%ebp),%eax
 602:	50                   	push   %eax
 603:	e8 04 01 00 00       	call   70c <join>
 608:	89 c3                	mov    %eax,%ebx
  free(stack);
 60a:	83 c4 04             	add    $0x4,%esp
 60d:	ff 75 f4             	push   -0xc(%ebp)
 610:	e8 0a 03 00 00       	call   91f <free>
  return pid;
}
 615:	89 d8                	mov    %ebx,%eax
 617:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 61a:	c9                   	leave  
 61b:	c3                   	ret    

0000061c <lock_init>:
int
lock_init(lock_t * lock){
 61c:	55                   	push   %ebp
 61d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 628:	b8 00 00 00 00       	mov    $0x0,%eax
 62d:	5d                   	pop    %ebp
 62e:	c3                   	ret    

0000062f <lock_acquire>:
int
lock_acquire(lock_t * lock){
 62f:	55                   	push   %ebp
 630:	89 e5                	mov    %esp,%ebp
 632:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 635:	b8 01 00 00 00       	mov    $0x1,%eax
 63a:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 63d:	83 f8 01             	cmp    $0x1,%eax
 640:	74 f3                	je     635 <lock_acquire+0x6>
  {

  }
  return 0;
}
 642:	b8 00 00 00 00       	mov    $0x0,%eax
 647:	5d                   	pop    %ebp
 648:	c3                   	ret    

00000649 <lock_release>:
int
lock_release(lock_t * lock){
 649:	55                   	push   %ebp
 64a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 64c:	8b 45 08             	mov    0x8(%ebp),%eax
 64f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 655:	b8 00 00 00 00       	mov    $0x0,%eax
 65a:	5d                   	pop    %ebp
 65b:	c3                   	ret    

0000065c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 65c:	b8 01 00 00 00       	mov    $0x1,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <exit>:
SYSCALL(exit)
 664:	b8 02 00 00 00       	mov    $0x2,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <wait>:
SYSCALL(wait)
 66c:	b8 03 00 00 00       	mov    $0x3,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <pipe>:
SYSCALL(pipe)
 674:	b8 04 00 00 00       	mov    $0x4,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <read>:
SYSCALL(read)
 67c:	b8 05 00 00 00       	mov    $0x5,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <write>:
SYSCALL(write)
 684:	b8 10 00 00 00       	mov    $0x10,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <close>:
SYSCALL(close)
 68c:	b8 15 00 00 00       	mov    $0x15,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <kill>:
SYSCALL(kill)
 694:	b8 06 00 00 00       	mov    $0x6,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <exec>:
SYSCALL(exec)
 69c:	b8 07 00 00 00       	mov    $0x7,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <open>:
SYSCALL(open)
 6a4:	b8 0f 00 00 00       	mov    $0xf,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <mknod>:
SYSCALL(mknod)
 6ac:	b8 11 00 00 00       	mov    $0x11,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <unlink>:
SYSCALL(unlink)
 6b4:	b8 12 00 00 00       	mov    $0x12,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <fstat>:
SYSCALL(fstat)
 6bc:	b8 08 00 00 00       	mov    $0x8,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <link>:
SYSCALL(link)
 6c4:	b8 13 00 00 00       	mov    $0x13,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <mkdir>:
SYSCALL(mkdir)
 6cc:	b8 14 00 00 00       	mov    $0x14,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <chdir>:
SYSCALL(chdir)
 6d4:	b8 09 00 00 00       	mov    $0x9,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <dup>:
SYSCALL(dup)
 6dc:	b8 0a 00 00 00       	mov    $0xa,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <getpid>:
SYSCALL(getpid)
 6e4:	b8 0b 00 00 00       	mov    $0xb,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <sbrk>:
SYSCALL(sbrk)
 6ec:	b8 0c 00 00 00       	mov    $0xc,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <sleep>:
SYSCALL(sleep)
 6f4:	b8 0d 00 00 00       	mov    $0xd,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <uptime>:
SYSCALL(uptime)
 6fc:	b8 0e 00 00 00       	mov    $0xe,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <clone>:
SYSCALL(clone)
 704:	b8 16 00 00 00       	mov    $0x16,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <join>:
SYSCALL(join)
 70c:	b8 17 00 00 00       	mov    $0x17,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 714:	55                   	push   %ebp
 715:	89 e5                	mov    %esp,%ebp
 717:	83 ec 1c             	sub    $0x1c,%esp
 71a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 71d:	6a 01                	push   $0x1
 71f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 722:	52                   	push   %edx
 723:	50                   	push   %eax
 724:	e8 5b ff ff ff       	call   684 <write>
}
 729:	83 c4 10             	add    $0x10,%esp
 72c:	c9                   	leave  
 72d:	c3                   	ret    

0000072e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 72e:	55                   	push   %ebp
 72f:	89 e5                	mov    %esp,%ebp
 731:	57                   	push   %edi
 732:	56                   	push   %esi
 733:	53                   	push   %ebx
 734:	83 ec 2c             	sub    $0x2c,%esp
 737:	89 45 d0             	mov    %eax,-0x30(%ebp)
 73a:	89 d0                	mov    %edx,%eax
 73c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 73e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 742:	0f 95 c1             	setne  %cl
 745:	c1 ea 1f             	shr    $0x1f,%edx
 748:	84 d1                	test   %dl,%cl
 74a:	74 44                	je     790 <printint+0x62>
    neg = 1;
    x = -xx;
 74c:	f7 d8                	neg    %eax
 74e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 750:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 757:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 75c:	89 c8                	mov    %ecx,%eax
 75e:	ba 00 00 00 00       	mov    $0x0,%edx
 763:	f7 f6                	div    %esi
 765:	89 df                	mov    %ebx,%edi
 767:	83 c3 01             	add    $0x1,%ebx
 76a:	0f b6 92 8c 0b 00 00 	movzbl 0xb8c(%edx),%edx
 771:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 775:	89 ca                	mov    %ecx,%edx
 777:	89 c1                	mov    %eax,%ecx
 779:	39 d6                	cmp    %edx,%esi
 77b:	76 df                	jbe    75c <printint+0x2e>
  if(neg)
 77d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 781:	74 31                	je     7b4 <printint+0x86>
    buf[i++] = '-';
 783:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 788:	8d 5f 02             	lea    0x2(%edi),%ebx
 78b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 78e:	eb 17                	jmp    7a7 <printint+0x79>
    x = xx;
 790:	89 c1                	mov    %eax,%ecx
  neg = 0;
 792:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 799:	eb bc                	jmp    757 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 79b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7a0:	89 f0                	mov    %esi,%eax
 7a2:	e8 6d ff ff ff       	call   714 <putc>
  while(--i >= 0)
 7a7:	83 eb 01             	sub    $0x1,%ebx
 7aa:	79 ef                	jns    79b <printint+0x6d>
}
 7ac:	83 c4 2c             	add    $0x2c,%esp
 7af:	5b                   	pop    %ebx
 7b0:	5e                   	pop    %esi
 7b1:	5f                   	pop    %edi
 7b2:	5d                   	pop    %ebp
 7b3:	c3                   	ret    
 7b4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7b7:	eb ee                	jmp    7a7 <printint+0x79>

000007b9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b9:	55                   	push   %ebp
 7ba:	89 e5                	mov    %esp,%ebp
 7bc:	57                   	push   %edi
 7bd:	56                   	push   %esi
 7be:	53                   	push   %ebx
 7bf:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7c2:	8d 45 10             	lea    0x10(%ebp),%eax
 7c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7c8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7cd:	bb 00 00 00 00       	mov    $0x0,%ebx
 7d2:	eb 14                	jmp    7e8 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7d4:	89 fa                	mov    %edi,%edx
 7d6:	8b 45 08             	mov    0x8(%ebp),%eax
 7d9:	e8 36 ff ff ff       	call   714 <putc>
 7de:	eb 05                	jmp    7e5 <printf+0x2c>
      }
    } else if(state == '%'){
 7e0:	83 fe 25             	cmp    $0x25,%esi
 7e3:	74 25                	je     80a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7e5:	83 c3 01             	add    $0x1,%ebx
 7e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 7eb:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7ef:	84 c0                	test   %al,%al
 7f1:	0f 84 20 01 00 00    	je     917 <printf+0x15e>
    c = fmt[i] & 0xff;
 7f7:	0f be f8             	movsbl %al,%edi
 7fa:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7fd:	85 f6                	test   %esi,%esi
 7ff:	75 df                	jne    7e0 <printf+0x27>
      if(c == '%'){
 801:	83 f8 25             	cmp    $0x25,%eax
 804:	75 ce                	jne    7d4 <printf+0x1b>
        state = '%';
 806:	89 c6                	mov    %eax,%esi
 808:	eb db                	jmp    7e5 <printf+0x2c>
      if(c == 'd'){
 80a:	83 f8 25             	cmp    $0x25,%eax
 80d:	0f 84 cf 00 00 00    	je     8e2 <printf+0x129>
 813:	0f 8c dd 00 00 00    	jl     8f6 <printf+0x13d>
 819:	83 f8 78             	cmp    $0x78,%eax
 81c:	0f 8f d4 00 00 00    	jg     8f6 <printf+0x13d>
 822:	83 f8 63             	cmp    $0x63,%eax
 825:	0f 8c cb 00 00 00    	jl     8f6 <printf+0x13d>
 82b:	83 e8 63             	sub    $0x63,%eax
 82e:	83 f8 15             	cmp    $0x15,%eax
 831:	0f 87 bf 00 00 00    	ja     8f6 <printf+0x13d>
 837:	ff 24 85 34 0b 00 00 	jmp    *0xb34(,%eax,4)
        printint(fd, *ap, 10, 1);
 83e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 841:	8b 17                	mov    (%edi),%edx
 843:	83 ec 0c             	sub    $0xc,%esp
 846:	6a 01                	push   $0x1
 848:	b9 0a 00 00 00       	mov    $0xa,%ecx
 84d:	8b 45 08             	mov    0x8(%ebp),%eax
 850:	e8 d9 fe ff ff       	call   72e <printint>
        ap++;
 855:	83 c7 04             	add    $0x4,%edi
 858:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 85b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 85e:	be 00 00 00 00       	mov    $0x0,%esi
 863:	eb 80                	jmp    7e5 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 865:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 868:	8b 17                	mov    (%edi),%edx
 86a:	83 ec 0c             	sub    $0xc,%esp
 86d:	6a 00                	push   $0x0
 86f:	b9 10 00 00 00       	mov    $0x10,%ecx
 874:	8b 45 08             	mov    0x8(%ebp),%eax
 877:	e8 b2 fe ff ff       	call   72e <printint>
        ap++;
 87c:	83 c7 04             	add    $0x4,%edi
 87f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 882:	83 c4 10             	add    $0x10,%esp
      state = 0;
 885:	be 00 00 00 00       	mov    $0x0,%esi
 88a:	e9 56 ff ff ff       	jmp    7e5 <printf+0x2c>
        s = (char*)*ap;
 88f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 892:	8b 30                	mov    (%eax),%esi
        ap++;
 894:	83 c0 04             	add    $0x4,%eax
 897:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 89a:	85 f6                	test   %esi,%esi
 89c:	75 15                	jne    8b3 <printf+0xfa>
          s = "(null)";
 89e:	be 2c 0b 00 00       	mov    $0xb2c,%esi
 8a3:	eb 0e                	jmp    8b3 <printf+0xfa>
          putc(fd, *s);
 8a5:	0f be d2             	movsbl %dl,%edx
 8a8:	8b 45 08             	mov    0x8(%ebp),%eax
 8ab:	e8 64 fe ff ff       	call   714 <putc>
          s++;
 8b0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8b3:	0f b6 16             	movzbl (%esi),%edx
 8b6:	84 d2                	test   %dl,%dl
 8b8:	75 eb                	jne    8a5 <printf+0xec>
      state = 0;
 8ba:	be 00 00 00 00       	mov    $0x0,%esi
 8bf:	e9 21 ff ff ff       	jmp    7e5 <printf+0x2c>
        putc(fd, *ap);
 8c4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c7:	0f be 17             	movsbl (%edi),%edx
 8ca:	8b 45 08             	mov    0x8(%ebp),%eax
 8cd:	e8 42 fe ff ff       	call   714 <putc>
        ap++;
 8d2:	83 c7 04             	add    $0x4,%edi
 8d5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8d8:	be 00 00 00 00       	mov    $0x0,%esi
 8dd:	e9 03 ff ff ff       	jmp    7e5 <printf+0x2c>
        putc(fd, c);
 8e2:	89 fa                	mov    %edi,%edx
 8e4:	8b 45 08             	mov    0x8(%ebp),%eax
 8e7:	e8 28 fe ff ff       	call   714 <putc>
      state = 0;
 8ec:	be 00 00 00 00       	mov    $0x0,%esi
 8f1:	e9 ef fe ff ff       	jmp    7e5 <printf+0x2c>
        putc(fd, '%');
 8f6:	ba 25 00 00 00       	mov    $0x25,%edx
 8fb:	8b 45 08             	mov    0x8(%ebp),%eax
 8fe:	e8 11 fe ff ff       	call   714 <putc>
        putc(fd, c);
 903:	89 fa                	mov    %edi,%edx
 905:	8b 45 08             	mov    0x8(%ebp),%eax
 908:	e8 07 fe ff ff       	call   714 <putc>
      state = 0;
 90d:	be 00 00 00 00       	mov    $0x0,%esi
 912:	e9 ce fe ff ff       	jmp    7e5 <printf+0x2c>
    }
  }
}
 917:	8d 65 f4             	lea    -0xc(%ebp),%esp
 91a:	5b                   	pop    %ebx
 91b:	5e                   	pop    %esi
 91c:	5f                   	pop    %edi
 91d:	5d                   	pop    %ebp
 91e:	c3                   	ret    

0000091f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 91f:	55                   	push   %ebp
 920:	89 e5                	mov    %esp,%ebp
 922:	57                   	push   %edi
 923:	56                   	push   %esi
 924:	53                   	push   %ebx
 925:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 928:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92b:	a1 28 0f 00 00       	mov    0xf28,%eax
 930:	eb 02                	jmp    934 <free+0x15>
 932:	89 d0                	mov    %edx,%eax
 934:	39 c8                	cmp    %ecx,%eax
 936:	73 04                	jae    93c <free+0x1d>
 938:	39 08                	cmp    %ecx,(%eax)
 93a:	77 12                	ja     94e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 93c:	8b 10                	mov    (%eax),%edx
 93e:	39 c2                	cmp    %eax,%edx
 940:	77 f0                	ja     932 <free+0x13>
 942:	39 c8                	cmp    %ecx,%eax
 944:	72 08                	jb     94e <free+0x2f>
 946:	39 ca                	cmp    %ecx,%edx
 948:	77 04                	ja     94e <free+0x2f>
 94a:	89 d0                	mov    %edx,%eax
 94c:	eb e6                	jmp    934 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 94e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 951:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 954:	8b 10                	mov    (%eax),%edx
 956:	39 d7                	cmp    %edx,%edi
 958:	74 19                	je     973 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 95a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 95d:	8b 50 04             	mov    0x4(%eax),%edx
 960:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 963:	39 ce                	cmp    %ecx,%esi
 965:	74 1b                	je     982 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 967:	89 08                	mov    %ecx,(%eax)
  freep = p;
 969:	a3 28 0f 00 00       	mov    %eax,0xf28
}
 96e:	5b                   	pop    %ebx
 96f:	5e                   	pop    %esi
 970:	5f                   	pop    %edi
 971:	5d                   	pop    %ebp
 972:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 973:	03 72 04             	add    0x4(%edx),%esi
 976:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 979:	8b 10                	mov    (%eax),%edx
 97b:	8b 12                	mov    (%edx),%edx
 97d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 980:	eb db                	jmp    95d <free+0x3e>
    p->s.size += bp->s.size;
 982:	03 53 fc             	add    -0x4(%ebx),%edx
 985:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 988:	8b 53 f8             	mov    -0x8(%ebx),%edx
 98b:	89 10                	mov    %edx,(%eax)
 98d:	eb da                	jmp    969 <free+0x4a>

0000098f <morecore>:

static Header*
morecore(uint nu)
{
 98f:	55                   	push   %ebp
 990:	89 e5                	mov    %esp,%ebp
 992:	53                   	push   %ebx
 993:	83 ec 04             	sub    $0x4,%esp
 996:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 998:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 99d:	77 05                	ja     9a4 <morecore+0x15>
    nu = 4096;
 99f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9a4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9ab:	83 ec 0c             	sub    $0xc,%esp
 9ae:	50                   	push   %eax
 9af:	e8 38 fd ff ff       	call   6ec <sbrk>
  if(p == (char*)-1)
 9b4:	83 c4 10             	add    $0x10,%esp
 9b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ba:	74 1c                	je     9d8 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9bf:	83 c0 08             	add    $0x8,%eax
 9c2:	83 ec 0c             	sub    $0xc,%esp
 9c5:	50                   	push   %eax
 9c6:	e8 54 ff ff ff       	call   91f <free>
  return freep;
 9cb:	a1 28 0f 00 00       	mov    0xf28,%eax
 9d0:	83 c4 10             	add    $0x10,%esp
}
 9d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9d6:	c9                   	leave  
 9d7:	c3                   	ret    
    return 0;
 9d8:	b8 00 00 00 00       	mov    $0x0,%eax
 9dd:	eb f4                	jmp    9d3 <morecore+0x44>

000009df <malloc>:

void*
malloc(uint nbytes)
{
 9df:	55                   	push   %ebp
 9e0:	89 e5                	mov    %esp,%ebp
 9e2:	53                   	push   %ebx
 9e3:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e6:	8b 45 08             	mov    0x8(%ebp),%eax
 9e9:	8d 58 07             	lea    0x7(%eax),%ebx
 9ec:	c1 eb 03             	shr    $0x3,%ebx
 9ef:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9f2:	8b 0d 28 0f 00 00    	mov    0xf28,%ecx
 9f8:	85 c9                	test   %ecx,%ecx
 9fa:	74 04                	je     a00 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9fc:	8b 01                	mov    (%ecx),%eax
 9fe:	eb 4a                	jmp    a4a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a00:	c7 05 28 0f 00 00 2c 	movl   $0xf2c,0xf28
 a07:	0f 00 00 
 a0a:	c7 05 2c 0f 00 00 2c 	movl   $0xf2c,0xf2c
 a11:	0f 00 00 
    base.s.size = 0;
 a14:	c7 05 30 0f 00 00 00 	movl   $0x0,0xf30
 a1b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a1e:	b9 2c 0f 00 00       	mov    $0xf2c,%ecx
 a23:	eb d7                	jmp    9fc <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a25:	74 19                	je     a40 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a27:	29 da                	sub    %ebx,%edx
 a29:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a2c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a2f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a32:	89 0d 28 0f 00 00    	mov    %ecx,0xf28
      return (void*)(p + 1);
 a38:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a3b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a3e:	c9                   	leave  
 a3f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a40:	8b 10                	mov    (%eax),%edx
 a42:	89 11                	mov    %edx,(%ecx)
 a44:	eb ec                	jmp    a32 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a46:	89 c1                	mov    %eax,%ecx
 a48:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a4a:	8b 50 04             	mov    0x4(%eax),%edx
 a4d:	39 da                	cmp    %ebx,%edx
 a4f:	73 d4                	jae    a25 <malloc+0x46>
    if(p == freep)
 a51:	39 05 28 0f 00 00    	cmp    %eax,0xf28
 a57:	75 ed                	jne    a46 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a59:	89 d8                	mov    %ebx,%eax
 a5b:	e8 2f ff ff ff       	call   98f <morecore>
 a60:	85 c0                	test   %eax,%eax
 a62:	75 e2                	jne    a46 <malloc+0x67>
 a64:	eb d5                	jmp    a3b <malloc+0x5c>
