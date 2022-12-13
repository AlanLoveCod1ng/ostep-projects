
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   
   exit();
}


void worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 28 0f 00 00       	push   $0xf28
   b:	e8 61 06 00 00       	call   671 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 12 07 00 00       	call   72e <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 2c 0f 00 00    	cmp    0xf2c,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 a8 0a 00 00       	push   $0xaa8
  2e:	68 b2 0a 00 00       	push   $0xab2
  33:	6a 01                	push   $0x1
  35:	e8 c1 07 00 00       	call   7fb <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 ba 0a 00 00       	push   $0xaba
  42:	68 d8 0a 00 00       	push   $0xad8
  47:	6a 01                	push   $0x1
  49:	e8 ad 07 00 00       	call   7fb <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 ec 0a 00 00       	push   $0xaec
  56:	6a 01                	push   $0x1
  58:	e8 9e 07 00 00       	call   7fb <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 34 0f 00 00    	push   0xf34
  66:	e8 6b 06 00 00       	call   6d6 <kill>
  6b:	e8 36 06 00 00       	call   6a6 <exit>
   global++;
  70:	83 05 30 0f 00 00 01 	addl   $0x1,0xf30
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 28 0f 00 00       	push   $0xf28
  7f:	e8 07 06 00 00       	call   68b <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
  8b:	e8 e1 05 00 00       	call   671 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 92 06 00 00       	call   72e <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 2c 0f 00 00    	cmp    0xf2c,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 a8 0a 00 00       	push   $0xaa8
  ae:	68 b2 0a 00 00       	push   $0xab2
  b3:	6a 01                	push   $0x1
  b5:	e8 41 07 00 00       	call   7fb <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 ba 0a 00 00       	push   $0xaba
  c2:	68 d8 0a 00 00       	push   $0xad8
  c7:	6a 01                	push   $0x1
  c9:	e8 2d 07 00 00       	call   7fb <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 ec 0a 00 00       	push   $0xaec
  d6:	6a 01                	push   $0x1
  d8:	e8 1e 07 00 00       	call   7fb <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 34 0f 00 00    	push   0xf34
  e6:	e8 eb 05 00 00       	call   6d6 <kill>
  eb:	e8 b6 05 00 00       	call   6a6 <exit>
   global++;
  f0:	83 05 30 0f 00 00 01 	addl   $0x1,0xf30
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 2a 06 00 00       	call   72e <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 1e 06 00 00       	call   72e <sbrk>
 110:	a3 2c 0f 00 00       	mov    %eax,0xf2c
   lock_release(&lock2);
 115:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 11c:	e8 6a 05 00 00       	call   68b <lock_release>



   exit();
 121:	e8 80 05 00 00       	call   6a6 <exit>

00000126 <main>:
{
 126:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 12a:	83 e4 f0             	and    $0xfffffff0,%esp
 12d:	ff 71 fc             	push   -0x4(%ecx)
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	51                   	push   %ecx
 135:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 138:	e8 e9 05 00 00       	call   726 <getpid>
 13d:	a3 34 0f 00 00       	mov    %eax,0xf34
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 28 0f 00 00       	push   $0xf28
 158:	e8 01 05 00 00       	call   65e <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 164:	e8 f5 04 00 00       	call   65e <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 28 0f 00 00 	movl   $0xf28,(%esp)
 170:	e8 fc 04 00 00       	call   671 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 17c:	e8 f0 04 00 00       	call   671 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d 20 0f 00 00    	cmp    %ebx,0xf20
 194:	7e 65                	jle    1fb <main+0xd5>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 196:	83 ec 04             	sub    $0x4,%esp
 199:	8d 45 f0             	lea    -0x10(%ebp),%eax
 19c:	50                   	push   %eax
 19d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	68 00 00 00 00       	push   $0x0
 1a6:	e8 5a 04 00 00       	call   605 <thread_create>
      assert(thread_pid > 0);
 1ab:	83 c4 10             	add    $0x10,%esp
 1ae:	85 c0                	test   %eax,%eax
 1b0:	7f d9                	jg     18b <main+0x65>
 1b2:	6a 28                	push   $0x28
 1b4:	68 a8 0a 00 00       	push   $0xaa8
 1b9:	68 b2 0a 00 00       	push   $0xab2
 1be:	6a 01                	push   $0x1
 1c0:	e8 36 06 00 00       	call   7fb <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 f9 0a 00 00       	push   $0xaf9
 1cd:	68 d8 0a 00 00       	push   $0xad8
 1d2:	6a 01                	push   $0x1
 1d4:	e8 22 06 00 00       	call   7fb <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 ec 0a 00 00       	push   $0xaec
 1e1:	6a 01                	push   $0x1
 1e3:	e8 13 06 00 00       	call   7fb <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 34 0f 00 00    	push   0xf34
 1f1:	e8 e0 04 00 00       	call   6d6 <kill>
 1f6:	e8 ab 04 00 00       	call   6a6 <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 29 05 00 00       	call   72e <sbrk>
 205:	a3 2c 0f 00 00       	mov    %eax,0xf2c
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 20 0f 00 00       	mov    0xf20,%eax
 212:	39 05 30 0f 00 00    	cmp    %eax,0xf30
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 28 0f 00 00       	push   $0xf28
 222:	e8 64 04 00 00       	call   68b <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 03 05 00 00       	call   736 <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 28 0f 00 00 	movl   $0xf28,(%esp)
 23a:	e8 32 04 00 00       	call   671 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 30 0f 00 00 00 	movl   $0x0,0xf30
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 d3 04 00 00       	call   72e <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 c7 04 00 00       	call   72e <sbrk>
 267:	a3 2c 0f 00 00       	mov    %eax,0xf2c
   lock_release(&lock);
 26c:	c7 04 24 28 0f 00 00 	movl   $0xf28,(%esp)
 273:	e8 13 04 00 00       	call   68b <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 20 0f 00 00       	mov    0xf20,%eax
 280:	39 05 30 0f 00 00    	cmp    %eax,0xf30
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 24 0f 00 00       	push   $0xf24
 290:	e8 f6 03 00 00       	call   68b <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 95 04 00 00       	call   736 <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 2a8:	e8 c4 03 00 00       	call   671 <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 24 0f 00 00       	push   $0xf24
 2ba:	e8 cc 03 00 00       	call   68b <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d 20 0f 00 00    	cmp    %ebx,0xf20
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 66 03 00 00       	call   63a <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 a8 0a 00 00       	push   $0xaa8
 2e4:	68 b2 0a 00 00       	push   $0xab2
 2e9:	6a 01                	push   $0x1
 2eb:	e8 0b 05 00 00       	call   7fb <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 08 0b 00 00       	push   $0xb08
 2f8:	68 d8 0a 00 00       	push   $0xad8
 2fd:	6a 01                	push   $0x1
 2ff:	e8 f7 04 00 00       	call   7fb <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 ec 0a 00 00       	push   $0xaec
 30c:	6a 01                	push   $0x1
 30e:	e8 e8 04 00 00       	call   7fb <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 34 0f 00 00    	push   0xf34
 31c:	e8 b5 03 00 00       	call   6d6 <kill>
 321:	e8 80 03 00 00       	call   6a6 <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 15 0b 00 00       	push   $0xb15
 32e:	6a 01                	push   $0x1
 330:	e8 c6 04 00 00       	call   7fb <printf>
   exit();
 335:	e8 6c 03 00 00       	call   6a6 <exit>

0000033a <worker2>:
{
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
 33d:	83 ec 08             	sub    $0x8,%esp
   int arg2_int = *(int*)arg2;
 340:	8b 45 0c             	mov    0xc(%ebp),%eax
 343:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 11);
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	83 38 0b             	cmpl   $0xb,(%eax)
 34b:	75 52                	jne    39f <worker2+0x65>
   assert(arg2_int == 22);
 34d:	83 fa 16             	cmp    $0x16,%edx
 350:	0f 84 92 00 00 00    	je     3e8 <worker2+0xae>
 356:	6a 4d                	push   $0x4d
 358:	68 a8 0a 00 00       	push   $0xaa8
 35d:	68 b2 0a 00 00       	push   $0xab2
 362:	6a 01                	push   $0x1
 364:	e8 92 04 00 00       	call   7fb <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 31 0b 00 00       	push   $0xb31
 371:	68 d8 0a 00 00       	push   $0xad8
 376:	6a 01                	push   $0x1
 378:	e8 7e 04 00 00       	call   7fb <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 ec 0a 00 00       	push   $0xaec
 385:	6a 01                	push   $0x1
 387:	e8 6f 04 00 00       	call   7fb <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 34 0f 00 00    	push   0xf34
 395:	e8 3c 03 00 00       	call   6d6 <kill>
 39a:	e8 07 03 00 00       	call   6a6 <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 a8 0a 00 00       	push   $0xaa8
 3a6:	68 b2 0a 00 00       	push   $0xab2
 3ab:	6a 01                	push   $0x1
 3ad:	e8 49 04 00 00       	call   7fb <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 22 0b 00 00       	push   $0xb22
 3ba:	68 d8 0a 00 00       	push   $0xad8
 3bf:	6a 01                	push   $0x1
 3c1:	e8 35 04 00 00       	call   7fb <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 ec 0a 00 00       	push   $0xaec
 3ce:	6a 01                	push   $0x1
 3d0:	e8 26 04 00 00       	call   7fb <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 34 0f 00 00    	push   0xf34
 3de:	e8 f3 02 00 00       	call   6d6 <kill>
 3e3:	e8 be 02 00 00       	call   6a6 <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 24 0f 00 00       	push   $0xf24
 3f0:	e8 7c 02 00 00       	call   671 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 2d 03 00 00       	call   72e <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 2c 0f 00 00    	cmp    0xf2c,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 a8 0a 00 00       	push   $0xaa8
 413:	68 b2 0a 00 00       	push   $0xab2
 418:	6a 01                	push   $0x1
 41a:	e8 dc 03 00 00       	call   7fb <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 ba 0a 00 00       	push   $0xaba
 427:	68 d8 0a 00 00       	push   $0xad8
 42c:	6a 01                	push   $0x1
 42e:	e8 c8 03 00 00       	call   7fb <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 ec 0a 00 00       	push   $0xaec
 43b:	6a 01                	push   $0x1
 43d:	e8 b9 03 00 00       	call   7fb <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 34 0f 00 00    	push   0xf34
 44b:	e8 86 02 00 00       	call   6d6 <kill>
 450:	e8 51 02 00 00       	call   6a6 <exit>
   global++;
 455:	83 05 30 0f 00 00 01 	addl   $0x1,0xf30
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 24 0f 00 00       	push   $0xf24
 464:	e8 22 02 00 00       	call   68b <lock_release>
   exit();
 469:	e8 38 02 00 00       	call   6a6 <exit>

0000046e <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	56                   	push   %esi
 472:	53                   	push   %ebx
 473:	8b 75 08             	mov    0x8(%ebp),%esi
 476:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 479:	89 f0                	mov    %esi,%eax
 47b:	89 d1                	mov    %edx,%ecx
 47d:	83 c2 01             	add    $0x1,%edx
 480:	89 c3                	mov    %eax,%ebx
 482:	83 c0 01             	add    $0x1,%eax
 485:	0f b6 09             	movzbl (%ecx),%ecx
 488:	88 0b                	mov    %cl,(%ebx)
 48a:	84 c9                	test   %cl,%cl
 48c:	75 ed                	jne    47b <strcpy+0xd>
    ;
  return os;
}
 48e:	89 f0                	mov    %esi,%eax
 490:	5b                   	pop    %ebx
 491:	5e                   	pop    %esi
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    

00000494 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	8b 4d 08             	mov    0x8(%ebp),%ecx
 49a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 49d:	eb 06                	jmp    4a5 <strcmp+0x11>
    p++, q++;
 49f:	83 c1 01             	add    $0x1,%ecx
 4a2:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4a5:	0f b6 01             	movzbl (%ecx),%eax
 4a8:	84 c0                	test   %al,%al
 4aa:	74 04                	je     4b0 <strcmp+0x1c>
 4ac:	3a 02                	cmp    (%edx),%al
 4ae:	74 ef                	je     49f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4b0:	0f b6 c0             	movzbl %al,%eax
 4b3:	0f b6 12             	movzbl (%edx),%edx
 4b6:	29 d0                	sub    %edx,%eax
}
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    

000004ba <strlen>:

uint
strlen(const char *s)
{
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4c0:	b8 00 00 00 00       	mov    $0x0,%eax
 4c5:	eb 03                	jmp    4ca <strlen+0x10>
 4c7:	83 c0 01             	add    $0x1,%eax
 4ca:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4ce:	75 f7                	jne    4c7 <strlen+0xd>
    ;
  return n;
}
 4d0:	5d                   	pop    %ebp
 4d1:	c3                   	ret    

000004d2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4d2:	55                   	push   %ebp
 4d3:	89 e5                	mov    %esp,%ebp
 4d5:	57                   	push   %edi
 4d6:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4d9:	89 d7                	mov    %edx,%edi
 4db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4de:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e1:	fc                   	cld    
 4e2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4e4:	89 d0                	mov    %edx,%eax
 4e6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4e9:	c9                   	leave  
 4ea:	c3                   	ret    

000004eb <strchr>:

char*
strchr(const char *s, char c)
{
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4f5:	eb 03                	jmp    4fa <strchr+0xf>
 4f7:	83 c0 01             	add    $0x1,%eax
 4fa:	0f b6 10             	movzbl (%eax),%edx
 4fd:	84 d2                	test   %dl,%dl
 4ff:	74 06                	je     507 <strchr+0x1c>
    if(*s == c)
 501:	38 ca                	cmp    %cl,%dl
 503:	75 f2                	jne    4f7 <strchr+0xc>
 505:	eb 05                	jmp    50c <strchr+0x21>
      return (char*)s;
  return 0;
 507:	b8 00 00 00 00       	mov    $0x0,%eax
}
 50c:	5d                   	pop    %ebp
 50d:	c3                   	ret    

0000050e <gets>:

char*
gets(char *buf, int max)
{
 50e:	55                   	push   %ebp
 50f:	89 e5                	mov    %esp,%ebp
 511:	57                   	push   %edi
 512:	56                   	push   %esi
 513:	53                   	push   %ebx
 514:	83 ec 1c             	sub    $0x1c,%esp
 517:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 51a:	bb 00 00 00 00       	mov    $0x0,%ebx
 51f:	89 de                	mov    %ebx,%esi
 521:	83 c3 01             	add    $0x1,%ebx
 524:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 527:	7d 2e                	jge    557 <gets+0x49>
    cc = read(0, &c, 1);
 529:	83 ec 04             	sub    $0x4,%esp
 52c:	6a 01                	push   $0x1
 52e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 531:	50                   	push   %eax
 532:	6a 00                	push   $0x0
 534:	e8 85 01 00 00       	call   6be <read>
    if(cc < 1)
 539:	83 c4 10             	add    $0x10,%esp
 53c:	85 c0                	test   %eax,%eax
 53e:	7e 17                	jle    557 <gets+0x49>
      break;
    buf[i++] = c;
 540:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 544:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 547:	3c 0a                	cmp    $0xa,%al
 549:	0f 94 c2             	sete   %dl
 54c:	3c 0d                	cmp    $0xd,%al
 54e:	0f 94 c0             	sete   %al
 551:	08 c2                	or     %al,%dl
 553:	74 ca                	je     51f <gets+0x11>
    buf[i++] = c;
 555:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 557:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 55b:	89 f8                	mov    %edi,%eax
 55d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 560:	5b                   	pop    %ebx
 561:	5e                   	pop    %esi
 562:	5f                   	pop    %edi
 563:	5d                   	pop    %ebp
 564:	c3                   	ret    

00000565 <stat>:

int
stat(const char *n, struct stat *st)
{
 565:	55                   	push   %ebp
 566:	89 e5                	mov    %esp,%ebp
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 56a:	83 ec 08             	sub    $0x8,%esp
 56d:	6a 00                	push   $0x0
 56f:	ff 75 08             	push   0x8(%ebp)
 572:	e8 6f 01 00 00       	call   6e6 <open>
  if(fd < 0)
 577:	83 c4 10             	add    $0x10,%esp
 57a:	85 c0                	test   %eax,%eax
 57c:	78 24                	js     5a2 <stat+0x3d>
 57e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 580:	83 ec 08             	sub    $0x8,%esp
 583:	ff 75 0c             	push   0xc(%ebp)
 586:	50                   	push   %eax
 587:	e8 72 01 00 00       	call   6fe <fstat>
 58c:	89 c6                	mov    %eax,%esi
  close(fd);
 58e:	89 1c 24             	mov    %ebx,(%esp)
 591:	e8 38 01 00 00       	call   6ce <close>
  return r;
 596:	83 c4 10             	add    $0x10,%esp
}
 599:	89 f0                	mov    %esi,%eax
 59b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 59e:	5b                   	pop    %ebx
 59f:	5e                   	pop    %esi
 5a0:	5d                   	pop    %ebp
 5a1:	c3                   	ret    
    return -1;
 5a2:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5a7:	eb f0                	jmp    599 <stat+0x34>

000005a9 <atoi>:

int
atoi(const char *s)
{
 5a9:	55                   	push   %ebp
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	53                   	push   %ebx
 5ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5b0:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5b5:	eb 10                	jmp    5c7 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5b7:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5ba:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5bd:	83 c1 01             	add    $0x1,%ecx
 5c0:	0f be c0             	movsbl %al,%eax
 5c3:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5c7:	0f b6 01             	movzbl (%ecx),%eax
 5ca:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5cd:	80 fb 09             	cmp    $0x9,%bl
 5d0:	76 e5                	jbe    5b7 <atoi+0xe>
  return n;
}
 5d2:	89 d0                	mov    %edx,%eax
 5d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d7:	c9                   	leave  
 5d8:	c3                   	ret    

000005d9 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5d9:	55                   	push   %ebp
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	56                   	push   %esi
 5dd:	53                   	push   %ebx
 5de:	8b 75 08             	mov    0x8(%ebp),%esi
 5e1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5e4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5e7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5e9:	eb 0d                	jmp    5f8 <memmove+0x1f>
    *dst++ = *src++;
 5eb:	0f b6 01             	movzbl (%ecx),%eax
 5ee:	88 02                	mov    %al,(%edx)
 5f0:	8d 49 01             	lea    0x1(%ecx),%ecx
 5f3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5f6:	89 d8                	mov    %ebx,%eax
 5f8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5fb:	85 c0                	test   %eax,%eax
 5fd:	7f ec                	jg     5eb <memmove+0x12>
  return vdst;
}
 5ff:	89 f0                	mov    %esi,%eax
 601:	5b                   	pop    %ebx
 602:	5e                   	pop    %esi
 603:	5d                   	pop    %ebp
 604:	c3                   	ret    

00000605 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 605:	55                   	push   %ebp
 606:	89 e5                	mov    %esp,%ebp
 608:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 60b:	68 00 20 00 00       	push   $0x2000
 610:	e8 0c 04 00 00       	call   a21 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 615:	83 c4 10             	add    $0x10,%esp
 618:	a9 ff 0f 00 00       	test   $0xfff,%eax
 61d:	74 0a                	je     629 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 61f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 624:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 629:	50                   	push   %eax
 62a:	ff 75 10             	push   0x10(%ebp)
 62d:	ff 75 0c             	push   0xc(%ebp)
 630:	ff 75 08             	push   0x8(%ebp)
 633:	e8 0e 01 00 00       	call   746 <clone>
  return pid;
}
 638:	c9                   	leave  
 639:	c3                   	ret    

0000063a <thread_join>:
int
thread_join()
{
 63a:	55                   	push   %ebp
 63b:	89 e5                	mov    %esp,%ebp
 63d:	53                   	push   %ebx
 63e:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 641:	8d 45 f4             	lea    -0xc(%ebp),%eax
 644:	50                   	push   %eax
 645:	e8 04 01 00 00       	call   74e <join>
 64a:	89 c3                	mov    %eax,%ebx
  free(stack);
 64c:	83 c4 04             	add    $0x4,%esp
 64f:	ff 75 f4             	push   -0xc(%ebp)
 652:	e8 0a 03 00 00       	call   961 <free>
  return pid;
}
 657:	89 d8                	mov    %ebx,%eax
 659:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 65c:	c9                   	leave  
 65d:	c3                   	ret    

0000065e <lock_init>:
int
lock_init(lock_t * lock){
 65e:	55                   	push   %ebp
 65f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 661:	8b 45 08             	mov    0x8(%ebp),%eax
 664:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 66a:	b8 00 00 00 00       	mov    $0x0,%eax
 66f:	5d                   	pop    %ebp
 670:	c3                   	ret    

00000671 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 671:	55                   	push   %ebp
 672:	89 e5                	mov    %esp,%ebp
 674:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 677:	b8 01 00 00 00       	mov    $0x1,%eax
 67c:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 67f:	83 f8 01             	cmp    $0x1,%eax
 682:	74 f3                	je     677 <lock_acquire+0x6>
  {

  }
  return 0;
}
 684:	b8 00 00 00 00       	mov    $0x0,%eax
 689:	5d                   	pop    %ebp
 68a:	c3                   	ret    

0000068b <lock_release>:
int
lock_release(lock_t * lock){
 68b:	55                   	push   %ebp
 68c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 68e:	8b 45 08             	mov    0x8(%ebp),%eax
 691:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 697:	b8 00 00 00 00       	mov    $0x0,%eax
 69c:	5d                   	pop    %ebp
 69d:	c3                   	ret    

0000069e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 69e:	b8 01 00 00 00       	mov    $0x1,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret    

000006a6 <exit>:
SYSCALL(exit)
 6a6:	b8 02 00 00 00       	mov    $0x2,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret    

000006ae <wait>:
SYSCALL(wait)
 6ae:	b8 03 00 00 00       	mov    $0x3,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret    

000006b6 <pipe>:
SYSCALL(pipe)
 6b6:	b8 04 00 00 00       	mov    $0x4,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret    

000006be <read>:
SYSCALL(read)
 6be:	b8 05 00 00 00       	mov    $0x5,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret    

000006c6 <write>:
SYSCALL(write)
 6c6:	b8 10 00 00 00       	mov    $0x10,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret    

000006ce <close>:
SYSCALL(close)
 6ce:	b8 15 00 00 00       	mov    $0x15,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <kill>:
SYSCALL(kill)
 6d6:	b8 06 00 00 00       	mov    $0x6,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <exec>:
SYSCALL(exec)
 6de:	b8 07 00 00 00       	mov    $0x7,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <open>:
SYSCALL(open)
 6e6:	b8 0f 00 00 00       	mov    $0xf,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <mknod>:
SYSCALL(mknod)
 6ee:	b8 11 00 00 00       	mov    $0x11,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <unlink>:
SYSCALL(unlink)
 6f6:	b8 12 00 00 00       	mov    $0x12,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <fstat>:
SYSCALL(fstat)
 6fe:	b8 08 00 00 00       	mov    $0x8,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <link>:
SYSCALL(link)
 706:	b8 13 00 00 00       	mov    $0x13,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret    

0000070e <mkdir>:
SYSCALL(mkdir)
 70e:	b8 14 00 00 00       	mov    $0x14,%eax
 713:	cd 40                	int    $0x40
 715:	c3                   	ret    

00000716 <chdir>:
SYSCALL(chdir)
 716:	b8 09 00 00 00       	mov    $0x9,%eax
 71b:	cd 40                	int    $0x40
 71d:	c3                   	ret    

0000071e <dup>:
SYSCALL(dup)
 71e:	b8 0a 00 00 00       	mov    $0xa,%eax
 723:	cd 40                	int    $0x40
 725:	c3                   	ret    

00000726 <getpid>:
SYSCALL(getpid)
 726:	b8 0b 00 00 00       	mov    $0xb,%eax
 72b:	cd 40                	int    $0x40
 72d:	c3                   	ret    

0000072e <sbrk>:
SYSCALL(sbrk)
 72e:	b8 0c 00 00 00       	mov    $0xc,%eax
 733:	cd 40                	int    $0x40
 735:	c3                   	ret    

00000736 <sleep>:
SYSCALL(sleep)
 736:	b8 0d 00 00 00       	mov    $0xd,%eax
 73b:	cd 40                	int    $0x40
 73d:	c3                   	ret    

0000073e <uptime>:
SYSCALL(uptime)
 73e:	b8 0e 00 00 00       	mov    $0xe,%eax
 743:	cd 40                	int    $0x40
 745:	c3                   	ret    

00000746 <clone>:
SYSCALL(clone)
 746:	b8 16 00 00 00       	mov    $0x16,%eax
 74b:	cd 40                	int    $0x40
 74d:	c3                   	ret    

0000074e <join>:
SYSCALL(join)
 74e:	b8 17 00 00 00       	mov    $0x17,%eax
 753:	cd 40                	int    $0x40
 755:	c3                   	ret    

00000756 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 756:	55                   	push   %ebp
 757:	89 e5                	mov    %esp,%ebp
 759:	83 ec 1c             	sub    $0x1c,%esp
 75c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 75f:	6a 01                	push   $0x1
 761:	8d 55 f4             	lea    -0xc(%ebp),%edx
 764:	52                   	push   %edx
 765:	50                   	push   %eax
 766:	e8 5b ff ff ff       	call   6c6 <write>
}
 76b:	83 c4 10             	add    $0x10,%esp
 76e:	c9                   	leave  
 76f:	c3                   	ret    

00000770 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 2c             	sub    $0x2c,%esp
 779:	89 45 d0             	mov    %eax,-0x30(%ebp)
 77c:	89 d0                	mov    %edx,%eax
 77e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 780:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 784:	0f 95 c1             	setne  %cl
 787:	c1 ea 1f             	shr    $0x1f,%edx
 78a:	84 d1                	test   %dl,%cl
 78c:	74 44                	je     7d2 <printint+0x62>
    neg = 1;
    x = -xx;
 78e:	f7 d8                	neg    %eax
 790:	89 c1                	mov    %eax,%ecx
    neg = 1;
 792:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 799:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 79e:	89 c8                	mov    %ecx,%eax
 7a0:	ba 00 00 00 00       	mov    $0x0,%edx
 7a5:	f7 f6                	div    %esi
 7a7:	89 df                	mov    %ebx,%edi
 7a9:	83 c3 01             	add    $0x1,%ebx
 7ac:	0f b6 92 a0 0b 00 00 	movzbl 0xba0(%edx),%edx
 7b3:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7b7:	89 ca                	mov    %ecx,%edx
 7b9:	89 c1                	mov    %eax,%ecx
 7bb:	39 d6                	cmp    %edx,%esi
 7bd:	76 df                	jbe    79e <printint+0x2e>
  if(neg)
 7bf:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7c3:	74 31                	je     7f6 <printint+0x86>
    buf[i++] = '-';
 7c5:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7ca:	8d 5f 02             	lea    0x2(%edi),%ebx
 7cd:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7d0:	eb 17                	jmp    7e9 <printint+0x79>
    x = xx;
 7d2:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7d4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7db:	eb bc                	jmp    799 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7dd:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7e2:	89 f0                	mov    %esi,%eax
 7e4:	e8 6d ff ff ff       	call   756 <putc>
  while(--i >= 0)
 7e9:	83 eb 01             	sub    $0x1,%ebx
 7ec:	79 ef                	jns    7dd <printint+0x6d>
}
 7ee:	83 c4 2c             	add    $0x2c,%esp
 7f1:	5b                   	pop    %ebx
 7f2:	5e                   	pop    %esi
 7f3:	5f                   	pop    %edi
 7f4:	5d                   	pop    %ebp
 7f5:	c3                   	ret    
 7f6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7f9:	eb ee                	jmp    7e9 <printint+0x79>

000007fb <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7fb:	55                   	push   %ebp
 7fc:	89 e5                	mov    %esp,%ebp
 7fe:	57                   	push   %edi
 7ff:	56                   	push   %esi
 800:	53                   	push   %ebx
 801:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 804:	8d 45 10             	lea    0x10(%ebp),%eax
 807:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 80a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 80f:	bb 00 00 00 00       	mov    $0x0,%ebx
 814:	eb 14                	jmp    82a <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 816:	89 fa                	mov    %edi,%edx
 818:	8b 45 08             	mov    0x8(%ebp),%eax
 81b:	e8 36 ff ff ff       	call   756 <putc>
 820:	eb 05                	jmp    827 <printf+0x2c>
      }
    } else if(state == '%'){
 822:	83 fe 25             	cmp    $0x25,%esi
 825:	74 25                	je     84c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 827:	83 c3 01             	add    $0x1,%ebx
 82a:	8b 45 0c             	mov    0xc(%ebp),%eax
 82d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 831:	84 c0                	test   %al,%al
 833:	0f 84 20 01 00 00    	je     959 <printf+0x15e>
    c = fmt[i] & 0xff;
 839:	0f be f8             	movsbl %al,%edi
 83c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 83f:	85 f6                	test   %esi,%esi
 841:	75 df                	jne    822 <printf+0x27>
      if(c == '%'){
 843:	83 f8 25             	cmp    $0x25,%eax
 846:	75 ce                	jne    816 <printf+0x1b>
        state = '%';
 848:	89 c6                	mov    %eax,%esi
 84a:	eb db                	jmp    827 <printf+0x2c>
      if(c == 'd'){
 84c:	83 f8 25             	cmp    $0x25,%eax
 84f:	0f 84 cf 00 00 00    	je     924 <printf+0x129>
 855:	0f 8c dd 00 00 00    	jl     938 <printf+0x13d>
 85b:	83 f8 78             	cmp    $0x78,%eax
 85e:	0f 8f d4 00 00 00    	jg     938 <printf+0x13d>
 864:	83 f8 63             	cmp    $0x63,%eax
 867:	0f 8c cb 00 00 00    	jl     938 <printf+0x13d>
 86d:	83 e8 63             	sub    $0x63,%eax
 870:	83 f8 15             	cmp    $0x15,%eax
 873:	0f 87 bf 00 00 00    	ja     938 <printf+0x13d>
 879:	ff 24 85 48 0b 00 00 	jmp    *0xb48(,%eax,4)
        printint(fd, *ap, 10, 1);
 880:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 883:	8b 17                	mov    (%edi),%edx
 885:	83 ec 0c             	sub    $0xc,%esp
 888:	6a 01                	push   $0x1
 88a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 88f:	8b 45 08             	mov    0x8(%ebp),%eax
 892:	e8 d9 fe ff ff       	call   770 <printint>
        ap++;
 897:	83 c7 04             	add    $0x4,%edi
 89a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 89d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8a0:	be 00 00 00 00       	mov    $0x0,%esi
 8a5:	eb 80                	jmp    827 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8aa:	8b 17                	mov    (%edi),%edx
 8ac:	83 ec 0c             	sub    $0xc,%esp
 8af:	6a 00                	push   $0x0
 8b1:	b9 10 00 00 00       	mov    $0x10,%ecx
 8b6:	8b 45 08             	mov    0x8(%ebp),%eax
 8b9:	e8 b2 fe ff ff       	call   770 <printint>
        ap++;
 8be:	83 c7 04             	add    $0x4,%edi
 8c1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8c4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8c7:	be 00 00 00 00       	mov    $0x0,%esi
 8cc:	e9 56 ff ff ff       	jmp    827 <printf+0x2c>
        s = (char*)*ap;
 8d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8d4:	8b 30                	mov    (%eax),%esi
        ap++;
 8d6:	83 c0 04             	add    $0x4,%eax
 8d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8dc:	85 f6                	test   %esi,%esi
 8de:	75 15                	jne    8f5 <printf+0xfa>
          s = "(null)";
 8e0:	be 40 0b 00 00       	mov    $0xb40,%esi
 8e5:	eb 0e                	jmp    8f5 <printf+0xfa>
          putc(fd, *s);
 8e7:	0f be d2             	movsbl %dl,%edx
 8ea:	8b 45 08             	mov    0x8(%ebp),%eax
 8ed:	e8 64 fe ff ff       	call   756 <putc>
          s++;
 8f2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8f5:	0f b6 16             	movzbl (%esi),%edx
 8f8:	84 d2                	test   %dl,%dl
 8fa:	75 eb                	jne    8e7 <printf+0xec>
      state = 0;
 8fc:	be 00 00 00 00       	mov    $0x0,%esi
 901:	e9 21 ff ff ff       	jmp    827 <printf+0x2c>
        putc(fd, *ap);
 906:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 909:	0f be 17             	movsbl (%edi),%edx
 90c:	8b 45 08             	mov    0x8(%ebp),%eax
 90f:	e8 42 fe ff ff       	call   756 <putc>
        ap++;
 914:	83 c7 04             	add    $0x4,%edi
 917:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 91a:	be 00 00 00 00       	mov    $0x0,%esi
 91f:	e9 03 ff ff ff       	jmp    827 <printf+0x2c>
        putc(fd, c);
 924:	89 fa                	mov    %edi,%edx
 926:	8b 45 08             	mov    0x8(%ebp),%eax
 929:	e8 28 fe ff ff       	call   756 <putc>
      state = 0;
 92e:	be 00 00 00 00       	mov    $0x0,%esi
 933:	e9 ef fe ff ff       	jmp    827 <printf+0x2c>
        putc(fd, '%');
 938:	ba 25 00 00 00       	mov    $0x25,%edx
 93d:	8b 45 08             	mov    0x8(%ebp),%eax
 940:	e8 11 fe ff ff       	call   756 <putc>
        putc(fd, c);
 945:	89 fa                	mov    %edi,%edx
 947:	8b 45 08             	mov    0x8(%ebp),%eax
 94a:	e8 07 fe ff ff       	call   756 <putc>
      state = 0;
 94f:	be 00 00 00 00       	mov    $0x0,%esi
 954:	e9 ce fe ff ff       	jmp    827 <printf+0x2c>
    }
  }
}
 959:	8d 65 f4             	lea    -0xc(%ebp),%esp
 95c:	5b                   	pop    %ebx
 95d:	5e                   	pop    %esi
 95e:	5f                   	pop    %edi
 95f:	5d                   	pop    %ebp
 960:	c3                   	ret    

00000961 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 961:	55                   	push   %ebp
 962:	89 e5                	mov    %esp,%ebp
 964:	57                   	push   %edi
 965:	56                   	push   %esi
 966:	53                   	push   %ebx
 967:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 96a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96d:	a1 38 0f 00 00       	mov    0xf38,%eax
 972:	eb 02                	jmp    976 <free+0x15>
 974:	89 d0                	mov    %edx,%eax
 976:	39 c8                	cmp    %ecx,%eax
 978:	73 04                	jae    97e <free+0x1d>
 97a:	39 08                	cmp    %ecx,(%eax)
 97c:	77 12                	ja     990 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 97e:	8b 10                	mov    (%eax),%edx
 980:	39 c2                	cmp    %eax,%edx
 982:	77 f0                	ja     974 <free+0x13>
 984:	39 c8                	cmp    %ecx,%eax
 986:	72 08                	jb     990 <free+0x2f>
 988:	39 ca                	cmp    %ecx,%edx
 98a:	77 04                	ja     990 <free+0x2f>
 98c:	89 d0                	mov    %edx,%eax
 98e:	eb e6                	jmp    976 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 990:	8b 73 fc             	mov    -0x4(%ebx),%esi
 993:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 996:	8b 10                	mov    (%eax),%edx
 998:	39 d7                	cmp    %edx,%edi
 99a:	74 19                	je     9b5 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 99c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 99f:	8b 50 04             	mov    0x4(%eax),%edx
 9a2:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9a5:	39 ce                	cmp    %ecx,%esi
 9a7:	74 1b                	je     9c4 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9a9:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9ab:	a3 38 0f 00 00       	mov    %eax,0xf38
}
 9b0:	5b                   	pop    %ebx
 9b1:	5e                   	pop    %esi
 9b2:	5f                   	pop    %edi
 9b3:	5d                   	pop    %ebp
 9b4:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9b5:	03 72 04             	add    0x4(%edx),%esi
 9b8:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9bb:	8b 10                	mov    (%eax),%edx
 9bd:	8b 12                	mov    (%edx),%edx
 9bf:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9c2:	eb db                	jmp    99f <free+0x3e>
    p->s.size += bp->s.size;
 9c4:	03 53 fc             	add    -0x4(%ebx),%edx
 9c7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ca:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9cd:	89 10                	mov    %edx,(%eax)
 9cf:	eb da                	jmp    9ab <free+0x4a>

000009d1 <morecore>:

static Header*
morecore(uint nu)
{
 9d1:	55                   	push   %ebp
 9d2:	89 e5                	mov    %esp,%ebp
 9d4:	53                   	push   %ebx
 9d5:	83 ec 04             	sub    $0x4,%esp
 9d8:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9da:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9df:	77 05                	ja     9e6 <morecore+0x15>
    nu = 4096;
 9e1:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9e6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9ed:	83 ec 0c             	sub    $0xc,%esp
 9f0:	50                   	push   %eax
 9f1:	e8 38 fd ff ff       	call   72e <sbrk>
  if(p == (char*)-1)
 9f6:	83 c4 10             	add    $0x10,%esp
 9f9:	83 f8 ff             	cmp    $0xffffffff,%eax
 9fc:	74 1c                	je     a1a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9fe:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a01:	83 c0 08             	add    $0x8,%eax
 a04:	83 ec 0c             	sub    $0xc,%esp
 a07:	50                   	push   %eax
 a08:	e8 54 ff ff ff       	call   961 <free>
  return freep;
 a0d:	a1 38 0f 00 00       	mov    0xf38,%eax
 a12:	83 c4 10             	add    $0x10,%esp
}
 a15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a18:	c9                   	leave  
 a19:	c3                   	ret    
    return 0;
 a1a:	b8 00 00 00 00       	mov    $0x0,%eax
 a1f:	eb f4                	jmp    a15 <morecore+0x44>

00000a21 <malloc>:

void*
malloc(uint nbytes)
{
 a21:	55                   	push   %ebp
 a22:	89 e5                	mov    %esp,%ebp
 a24:	53                   	push   %ebx
 a25:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a28:	8b 45 08             	mov    0x8(%ebp),%eax
 a2b:	8d 58 07             	lea    0x7(%eax),%ebx
 a2e:	c1 eb 03             	shr    $0x3,%ebx
 a31:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a34:	8b 0d 38 0f 00 00    	mov    0xf38,%ecx
 a3a:	85 c9                	test   %ecx,%ecx
 a3c:	74 04                	je     a42 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3e:	8b 01                	mov    (%ecx),%eax
 a40:	eb 4a                	jmp    a8c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a42:	c7 05 38 0f 00 00 3c 	movl   $0xf3c,0xf38
 a49:	0f 00 00 
 a4c:	c7 05 3c 0f 00 00 3c 	movl   $0xf3c,0xf3c
 a53:	0f 00 00 
    base.s.size = 0;
 a56:	c7 05 40 0f 00 00 00 	movl   $0x0,0xf40
 a5d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a60:	b9 3c 0f 00 00       	mov    $0xf3c,%ecx
 a65:	eb d7                	jmp    a3e <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a67:	74 19                	je     a82 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a69:	29 da                	sub    %ebx,%edx
 a6b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a6e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a71:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a74:	89 0d 38 0f 00 00    	mov    %ecx,0xf38
      return (void*)(p + 1);
 a7a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a7d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a80:	c9                   	leave  
 a81:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a82:	8b 10                	mov    (%eax),%edx
 a84:	89 11                	mov    %edx,(%ecx)
 a86:	eb ec                	jmp    a74 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a88:	89 c1                	mov    %eax,%ecx
 a8a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a8c:	8b 50 04             	mov    0x4(%eax),%edx
 a8f:	39 da                	cmp    %ebx,%edx
 a91:	73 d4                	jae    a67 <malloc+0x46>
    if(p == freep)
 a93:	39 05 38 0f 00 00    	cmp    %eax,0xf38
 a99:	75 ed                	jne    a88 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a9b:	89 d8                	mov    %ebx,%eax
 a9d:	e8 2f ff ff ff       	call   9d1 <morecore>
 aa2:	85 c0                	test   %eax,%eax
 aa4:	75 e2                	jne    a88 <malloc+0x67>
 aa6:	eb d5                	jmp    a7d <malloc+0x5c>
