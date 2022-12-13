
_test_19:     file format elf32-i386


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
   assert(arg1_int == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <nested_worker+0x30>
   assert(arg2_int == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <nested_worker+0x79>
   assert(global == 2);
  18:	a1 b0 0f 00 00       	mov    0xfb0,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 b0 0f 00 00       	mov    %eax,0xfb0
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 cc 0a 00 00       	push   $0xacc
  37:	68 d6 0a 00 00       	push   $0xad6
  3c:	6a 01                	push   $0x1
  3e:	e8 dc 07 00 00       	call   81f <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 de 0a 00 00       	push   $0xade
  4b:	68 ed 0a 00 00       	push   $0xaed
  50:	6a 01                	push   $0x1
  52:	e8 c8 07 00 00       	call   81f <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 01 0b 00 00       	push   $0xb01
  5f:	6a 01                	push   $0x1
  61:	e8 b9 07 00 00       	call   81f <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 b4 0f 00 00    	push   0xfb4
  6f:	e8 86 06 00 00       	call   6fa <kill>
  74:	e8 51 06 00 00       	call   6ca <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 cc 0a 00 00       	push   $0xacc
  80:	68 d6 0a 00 00       	push   $0xad6
  85:	6a 01                	push   $0x1
  87:	e8 93 07 00 00       	call   81f <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 0e 0b 00 00       	push   $0xb0e
  94:	68 ed 0a 00 00       	push   $0xaed
  99:	6a 01                	push   $0x1
  9b:	e8 7f 07 00 00       	call   81f <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 01 0b 00 00       	push   $0xb01
  a8:	6a 01                	push   $0x1
  aa:	e8 70 07 00 00       	call   81f <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 b4 0f 00 00    	push   0xfb4
  b8:	e8 3d 06 00 00       	call   6fa <kill>
  bd:	e8 08 06 00 00       	call   6ca <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 cc 0a 00 00       	push   $0xacc
  c9:	68 d6 0a 00 00       	push   $0xad6
  ce:	6a 01                	push   $0x1
  d0:	e8 4a 07 00 00       	call   81f <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 1d 0b 00 00       	push   $0xb1d
  dd:	68 ed 0a 00 00       	push   $0xaed
  e2:	6a 01                	push   $0x1
  e4:	e8 36 07 00 00       	call   81f <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 01 0b 00 00       	push   $0xb01
  f1:	6a 01                	push   $0x1
  f3:	e8 27 07 00 00       	call   81f <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 b4 0f 00 00    	push   0xfb4
 101:	e8 f4 05 00 00       	call   6fa <kill>
 106:	e8 bf 05 00 00       	call   6ca <exit>

0000010b <worker>:

void
worker(void *arg1, void *arg2) {
 10b:	55                   	push   %ebp
 10c:	89 e5                	mov    %esp,%ebp
 10e:	53                   	push   %ebx
 10f:	83 ec 14             	sub    $0x14,%esp
   int tmp1 = *(int*)arg1;
 112:	8b 45 08             	mov    0x8(%ebp),%eax
 115:	8b 00                	mov    (%eax),%eax
 117:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int tmp2 = *(int*)arg2;
 11a:	8b 55 0c             	mov    0xc(%ebp),%edx
 11d:	8b 12                	mov    (%edx),%edx
 11f:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(tmp1 == 42);
 122:	83 f8 2a             	cmp    $0x2a,%eax
 125:	75 60                	jne    187 <worker+0x7c>
   assert(tmp2 == 24);
 127:	83 fa 18             	cmp    $0x18,%edx
 12a:	0f 85 a0 00 00 00    	jne    1d0 <worker+0xc5>
   assert(global == 1);
 130:	a1 b0 0f 00 00       	mov    0xfb0,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 cc 0a 00 00       	push   $0xacc
 145:	68 d6 0a 00 00       	push   $0xad6
 14a:	6a 01                	push   $0x1
 14c:	e8 ce 06 00 00       	call   81f <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 3f 0b 00 00       	push   $0xb3f
 159:	68 ed 0a 00 00       	push   $0xaed
 15e:	6a 01                	push   $0x1
 160:	e8 ba 06 00 00       	call   81f <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 01 0b 00 00       	push   $0xb01
 16d:	6a 01                	push   $0x1
 16f:	e8 ab 06 00 00       	call   81f <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 b4 0f 00 00    	push   0xfb4
 17d:	e8 78 05 00 00       	call   6fa <kill>
 182:	e8 43 05 00 00       	call   6ca <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 cc 0a 00 00       	push   $0xacc
 18e:	68 d6 0a 00 00       	push   $0xad6
 193:	6a 01                	push   $0x1
 195:	e8 85 06 00 00       	call   81f <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 29 0b 00 00       	push   $0xb29
 1a2:	68 ed 0a 00 00       	push   $0xaed
 1a7:	6a 01                	push   $0x1
 1a9:	e8 71 06 00 00       	call   81f <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 01 0b 00 00       	push   $0xb01
 1b6:	6a 01                	push   $0x1
 1b8:	e8 62 06 00 00       	call   81f <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 b4 0f 00 00    	push   0xfb4
 1c6:	e8 2f 05 00 00       	call   6fa <kill>
 1cb:	e8 fa 04 00 00       	call   6ca <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 cc 0a 00 00       	push   $0xacc
 1d7:	68 d6 0a 00 00       	push   $0xad6
 1dc:	6a 01                	push   $0x1
 1de:	e8 3c 06 00 00       	call   81f <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 34 0b 00 00       	push   $0xb34
 1eb:	68 ed 0a 00 00       	push   $0xaed
 1f0:	6a 01                	push   $0x1
 1f2:	e8 28 06 00 00       	call   81f <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 01 0b 00 00       	push   $0xb01
 1ff:	6a 01                	push   $0x1
 201:	e8 19 06 00 00       	call   81f <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 b4 0f 00 00    	push   0xfb4
 20f:	e8 e6 04 00 00       	call   6fa <kill>
 214:	e8 b1 04 00 00       	call   6ca <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 b0 0f 00 00       	mov    %eax,0xfb0

   int nested_thread_pid = thread_create(nested_worker, &tmp1, &tmp2);
 221:	83 ec 04             	sub    $0x4,%esp
 224:	8d 45 f0             	lea    -0x10(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 45 f4             	lea    -0xc(%ebp),%eax
 22b:	50                   	push   %eax
 22c:	68 00 00 00 00       	push   $0x0
 231:	e8 f3 03 00 00       	call   629 <thread_create>
 236:	89 c3                	mov    %eax,%ebx
   assert(nested_thread_pid > 0);
 238:	83 c4 10             	add    $0x10,%esp
 23b:	85 c0                	test   %eax,%eax
 23d:	7e 07                	jle    246 <worker+0x13b>
   for(int j=0;j<10000;j++);
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
 244:	eb 4c                	jmp    292 <worker+0x187>
   assert(nested_thread_pid > 0);
 246:	6a 3c                	push   $0x3c
 248:	68 cc 0a 00 00       	push   $0xacc
 24d:	68 d6 0a 00 00       	push   $0xad6
 252:	6a 01                	push   $0x1
 254:	e8 c6 05 00 00       	call   81f <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 4b 0b 00 00       	push   $0xb4b
 261:	68 ed 0a 00 00       	push   $0xaed
 266:	6a 01                	push   $0x1
 268:	e8 b2 05 00 00       	call   81f <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 01 0b 00 00       	push   $0xb01
 275:	6a 01                	push   $0x1
 277:	e8 a3 05 00 00       	call   81f <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 b4 0f 00 00    	push   0xfb4
 285:	e8 70 04 00 00       	call   6fa <kill>
 28a:	e8 3b 04 00 00       	call   6ca <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 c0 03 00 00       	call   65e <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 cc 0a 00 00       	push   $0xacc
 2b1:	68 d6 0a 00 00       	push   $0xad6
 2b6:	6a 01                	push   $0x1
 2b8:	e8 62 05 00 00       	call   81f <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 a4 0b 00 00       	push   $0xba4
 2c5:	68 ed 0a 00 00       	push   $0xaed
 2ca:	6a 01                	push   $0x1
 2cc:	e8 4e 05 00 00       	call   81f <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 01 0b 00 00       	push   $0xb01
 2d9:	6a 01                	push   $0x1
 2db:	e8 3f 05 00 00       	call   81f <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 b4 0f 00 00    	push   0xfb4
 2e9:	e8 0c 04 00 00       	call   6fa <kill>
 2ee:	e8 d7 03 00 00       	call   6ca <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 cc 0a 00 00       	push   $0xacc
 2fa:	68 d6 0a 00 00       	push   $0xad6
 2ff:	6a 01                	push   $0x1
 301:	e8 19 05 00 00       	call   81f <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 61 0b 00 00       	push   $0xb61
 30e:	68 ed 0a 00 00       	push   $0xaed
 313:	6a 01                	push   $0x1
 315:	e8 05 05 00 00       	call   81f <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 01 0b 00 00       	push   $0xb01
 322:	6a 01                	push   $0x1
 324:	e8 f6 04 00 00       	call   81f <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 b4 0f 00 00    	push   0xfb4
 332:	e8 c3 03 00 00       	call   6fa <kill>
 337:	e8 8e 03 00 00       	call   6ca <exit>
   exit();
 33c:	e8 89 03 00 00       	call   6ca <exit>

00000341 <main>:
{
 341:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 345:	83 e4 f0             	and    $0xfffffff0,%esp
 348:	ff 71 fc             	push   -0x4(%ecx)
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	53                   	push   %ebx
 34f:	51                   	push   %ecx
 350:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 353:	e8 f2 03 00 00       	call   74a <getpid>
 358:	a3 b4 0f 00 00       	mov    %eax,0xfb4
   int arg1 = 42, arg2 = 24;
 35d:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 364:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 36b:	83 ec 04             	sub    $0x4,%esp
 36e:	8d 45 f0             	lea    -0x10(%ebp),%eax
 371:	50                   	push   %eax
 372:	8d 45 f4             	lea    -0xc(%ebp),%eax
 375:	50                   	push   %eax
 376:	68 0b 01 00 00       	push   $0x10b
 37b:	e8 a9 02 00 00       	call   629 <thread_create>
   assert(thread_pid > 0);
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	7e 65                	jle    3ec <main+0xab>
 387:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 389:	e8 d0 02 00 00       	call   65e <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d b0 0f 00 00 03 	cmpl   $0x3,0xfb0
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 cc 0a 00 00       	push   $0xacc
 3aa:	68 d6 0a 00 00       	push   $0xad6
 3af:	6a 01                	push   $0x1
 3b1:	e8 69 04 00 00       	call   81f <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 88 0b 00 00       	push   $0xb88
 3be:	68 ed 0a 00 00       	push   $0xaed
 3c3:	6a 01                	push   $0x1
 3c5:	e8 55 04 00 00       	call   81f <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 01 0b 00 00       	push   $0xb01
 3d2:	6a 01                	push   $0x1
 3d4:	e8 46 04 00 00       	call   81f <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 b4 0f 00 00    	push   0xfb4
 3e2:	e8 13 03 00 00       	call   6fa <kill>
 3e7:	e8 de 02 00 00       	call   6ca <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 cc 0a 00 00       	push   $0xacc
 3f3:	68 d6 0a 00 00       	push   $0xad6
 3f8:	6a 01                	push   $0x1
 3fa:	e8 20 04 00 00       	call   81f <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 52 0b 00 00       	push   $0xb52
 407:	68 ed 0a 00 00       	push   $0xaed
 40c:	6a 01                	push   $0x1
 40e:	e8 0c 04 00 00       	call   81f <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 01 0b 00 00       	push   $0xb01
 41b:	6a 01                	push   $0x1
 41d:	e8 fd 03 00 00       	call   81f <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 b4 0f 00 00    	push   0xfb4
 42b:	e8 ca 02 00 00       	call   6fa <kill>
 430:	e8 95 02 00 00       	call   6ca <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 cc 0a 00 00       	push   $0xacc
 43c:	68 d6 0a 00 00       	push   $0xad6
 441:	6a 01                	push   $0x1
 443:	e8 d7 03 00 00       	call   81f <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 71 0b 00 00       	push   $0xb71
 450:	68 ed 0a 00 00       	push   $0xaed
 455:	6a 01                	push   $0x1
 457:	e8 c3 03 00 00       	call   81f <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 01 0b 00 00       	push   $0xb01
 464:	6a 01                	push   $0x1
 466:	e8 b4 03 00 00       	call   81f <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 b4 0f 00 00    	push   0xfb4
 474:	e8 81 02 00 00       	call   6fa <kill>
 479:	e8 4c 02 00 00       	call   6ca <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 94 0b 00 00       	push   $0xb94
 486:	6a 01                	push   $0x1
 488:	e8 92 03 00 00       	call   81f <printf>
   exit();
 48d:	e8 38 02 00 00       	call   6ca <exit>

00000492 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	56                   	push   %esi
 496:	53                   	push   %ebx
 497:	8b 75 08             	mov    0x8(%ebp),%esi
 49a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 49d:	89 f0                	mov    %esi,%eax
 49f:	89 d1                	mov    %edx,%ecx
 4a1:	83 c2 01             	add    $0x1,%edx
 4a4:	89 c3                	mov    %eax,%ebx
 4a6:	83 c0 01             	add    $0x1,%eax
 4a9:	0f b6 09             	movzbl (%ecx),%ecx
 4ac:	88 0b                	mov    %cl,(%ebx)
 4ae:	84 c9                	test   %cl,%cl
 4b0:	75 ed                	jne    49f <strcpy+0xd>
    ;
  return os;
}
 4b2:	89 f0                	mov    %esi,%eax
 4b4:	5b                   	pop    %ebx
 4b5:	5e                   	pop    %esi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    

000004b8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4b8:	55                   	push   %ebp
 4b9:	89 e5                	mov    %esp,%ebp
 4bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4be:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4c1:	eb 06                	jmp    4c9 <strcmp+0x11>
    p++, q++;
 4c3:	83 c1 01             	add    $0x1,%ecx
 4c6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4c9:	0f b6 01             	movzbl (%ecx),%eax
 4cc:	84 c0                	test   %al,%al
 4ce:	74 04                	je     4d4 <strcmp+0x1c>
 4d0:	3a 02                	cmp    (%edx),%al
 4d2:	74 ef                	je     4c3 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4d4:	0f b6 c0             	movzbl %al,%eax
 4d7:	0f b6 12             	movzbl (%edx),%edx
 4da:	29 d0                	sub    %edx,%eax
}
 4dc:	5d                   	pop    %ebp
 4dd:	c3                   	ret    

000004de <strlen>:

uint
strlen(const char *s)
{
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4e4:	b8 00 00 00 00       	mov    $0x0,%eax
 4e9:	eb 03                	jmp    4ee <strlen+0x10>
 4eb:	83 c0 01             	add    $0x1,%eax
 4ee:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4f2:	75 f7                	jne    4eb <strlen+0xd>
    ;
  return n;
}
 4f4:	5d                   	pop    %ebp
 4f5:	c3                   	ret    

000004f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4f6:	55                   	push   %ebp
 4f7:	89 e5                	mov    %esp,%ebp
 4f9:	57                   	push   %edi
 4fa:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4fd:	89 d7                	mov    %edx,%edi
 4ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
 502:	8b 45 0c             	mov    0xc(%ebp),%eax
 505:	fc                   	cld    
 506:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 508:	89 d0                	mov    %edx,%eax
 50a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 50d:	c9                   	leave  
 50e:	c3                   	ret    

0000050f <strchr>:

char*
strchr(const char *s, char c)
{
 50f:	55                   	push   %ebp
 510:	89 e5                	mov    %esp,%ebp
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 519:	eb 03                	jmp    51e <strchr+0xf>
 51b:	83 c0 01             	add    $0x1,%eax
 51e:	0f b6 10             	movzbl (%eax),%edx
 521:	84 d2                	test   %dl,%dl
 523:	74 06                	je     52b <strchr+0x1c>
    if(*s == c)
 525:	38 ca                	cmp    %cl,%dl
 527:	75 f2                	jne    51b <strchr+0xc>
 529:	eb 05                	jmp    530 <strchr+0x21>
      return (char*)s;
  return 0;
 52b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 530:	5d                   	pop    %ebp
 531:	c3                   	ret    

00000532 <gets>:

char*
gets(char *buf, int max)
{
 532:	55                   	push   %ebp
 533:	89 e5                	mov    %esp,%ebp
 535:	57                   	push   %edi
 536:	56                   	push   %esi
 537:	53                   	push   %ebx
 538:	83 ec 1c             	sub    $0x1c,%esp
 53b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 53e:	bb 00 00 00 00       	mov    $0x0,%ebx
 543:	89 de                	mov    %ebx,%esi
 545:	83 c3 01             	add    $0x1,%ebx
 548:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 54b:	7d 2e                	jge    57b <gets+0x49>
    cc = read(0, &c, 1);
 54d:	83 ec 04             	sub    $0x4,%esp
 550:	6a 01                	push   $0x1
 552:	8d 45 e7             	lea    -0x19(%ebp),%eax
 555:	50                   	push   %eax
 556:	6a 00                	push   $0x0
 558:	e8 85 01 00 00       	call   6e2 <read>
    if(cc < 1)
 55d:	83 c4 10             	add    $0x10,%esp
 560:	85 c0                	test   %eax,%eax
 562:	7e 17                	jle    57b <gets+0x49>
      break;
    buf[i++] = c;
 564:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 568:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 56b:	3c 0a                	cmp    $0xa,%al
 56d:	0f 94 c2             	sete   %dl
 570:	3c 0d                	cmp    $0xd,%al
 572:	0f 94 c0             	sete   %al
 575:	08 c2                	or     %al,%dl
 577:	74 ca                	je     543 <gets+0x11>
    buf[i++] = c;
 579:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 57b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 57f:	89 f8                	mov    %edi,%eax
 581:	8d 65 f4             	lea    -0xc(%ebp),%esp
 584:	5b                   	pop    %ebx
 585:	5e                   	pop    %esi
 586:	5f                   	pop    %edi
 587:	5d                   	pop    %ebp
 588:	c3                   	ret    

00000589 <stat>:

int
stat(const char *n, struct stat *st)
{
 589:	55                   	push   %ebp
 58a:	89 e5                	mov    %esp,%ebp
 58c:	56                   	push   %esi
 58d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 58e:	83 ec 08             	sub    $0x8,%esp
 591:	6a 00                	push   $0x0
 593:	ff 75 08             	push   0x8(%ebp)
 596:	e8 6f 01 00 00       	call   70a <open>
  if(fd < 0)
 59b:	83 c4 10             	add    $0x10,%esp
 59e:	85 c0                	test   %eax,%eax
 5a0:	78 24                	js     5c6 <stat+0x3d>
 5a2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5a4:	83 ec 08             	sub    $0x8,%esp
 5a7:	ff 75 0c             	push   0xc(%ebp)
 5aa:	50                   	push   %eax
 5ab:	e8 72 01 00 00       	call   722 <fstat>
 5b0:	89 c6                	mov    %eax,%esi
  close(fd);
 5b2:	89 1c 24             	mov    %ebx,(%esp)
 5b5:	e8 38 01 00 00       	call   6f2 <close>
  return r;
 5ba:	83 c4 10             	add    $0x10,%esp
}
 5bd:	89 f0                	mov    %esi,%eax
 5bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5c2:	5b                   	pop    %ebx
 5c3:	5e                   	pop    %esi
 5c4:	5d                   	pop    %ebp
 5c5:	c3                   	ret    
    return -1;
 5c6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5cb:	eb f0                	jmp    5bd <stat+0x34>

000005cd <atoi>:

int
atoi(const char *s)
{
 5cd:	55                   	push   %ebp
 5ce:	89 e5                	mov    %esp,%ebp
 5d0:	53                   	push   %ebx
 5d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5d4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5d9:	eb 10                	jmp    5eb <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5db:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5de:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5e1:	83 c1 01             	add    $0x1,%ecx
 5e4:	0f be c0             	movsbl %al,%eax
 5e7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5eb:	0f b6 01             	movzbl (%ecx),%eax
 5ee:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5f1:	80 fb 09             	cmp    $0x9,%bl
 5f4:	76 e5                	jbe    5db <atoi+0xe>
  return n;
}
 5f6:	89 d0                	mov    %edx,%eax
 5f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5fb:	c9                   	leave  
 5fc:	c3                   	ret    

000005fd <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	56                   	push   %esi
 601:	53                   	push   %ebx
 602:	8b 75 08             	mov    0x8(%ebp),%esi
 605:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 608:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 60b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 60d:	eb 0d                	jmp    61c <memmove+0x1f>
    *dst++ = *src++;
 60f:	0f b6 01             	movzbl (%ecx),%eax
 612:	88 02                	mov    %al,(%edx)
 614:	8d 49 01             	lea    0x1(%ecx),%ecx
 617:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 61a:	89 d8                	mov    %ebx,%eax
 61c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 61f:	85 c0                	test   %eax,%eax
 621:	7f ec                	jg     60f <memmove+0x12>
  return vdst;
}
 623:	89 f0                	mov    %esi,%eax
 625:	5b                   	pop    %ebx
 626:	5e                   	pop    %esi
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    

00000629 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 629:	55                   	push   %ebp
 62a:	89 e5                	mov    %esp,%ebp
 62c:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 62f:	68 00 20 00 00       	push   $0x2000
 634:	e8 0c 04 00 00       	call   a45 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 639:	83 c4 10             	add    $0x10,%esp
 63c:	a9 ff 0f 00 00       	test   $0xfff,%eax
 641:	74 0a                	je     64d <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 643:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 648:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 64d:	50                   	push   %eax
 64e:	ff 75 10             	push   0x10(%ebp)
 651:	ff 75 0c             	push   0xc(%ebp)
 654:	ff 75 08             	push   0x8(%ebp)
 657:	e8 0e 01 00 00       	call   76a <clone>
  return pid;
}
 65c:	c9                   	leave  
 65d:	c3                   	ret    

0000065e <thread_join>:
int
thread_join()
{
 65e:	55                   	push   %ebp
 65f:	89 e5                	mov    %esp,%ebp
 661:	53                   	push   %ebx
 662:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 665:	8d 45 f4             	lea    -0xc(%ebp),%eax
 668:	50                   	push   %eax
 669:	e8 04 01 00 00       	call   772 <join>
 66e:	89 c3                	mov    %eax,%ebx
  free(stack);
 670:	83 c4 04             	add    $0x4,%esp
 673:	ff 75 f4             	push   -0xc(%ebp)
 676:	e8 0a 03 00 00       	call   985 <free>
  return pid;
}
 67b:	89 d8                	mov    %ebx,%eax
 67d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 680:	c9                   	leave  
 681:	c3                   	ret    

00000682 <lock_init>:
int
lock_init(lock_t * lock){
 682:	55                   	push   %ebp
 683:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 68e:	b8 00 00 00 00       	mov    $0x0,%eax
 693:	5d                   	pop    %ebp
 694:	c3                   	ret    

00000695 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 695:	55                   	push   %ebp
 696:	89 e5                	mov    %esp,%ebp
 698:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 69b:	b8 01 00 00 00       	mov    $0x1,%eax
 6a0:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 6a3:	83 f8 01             	cmp    $0x1,%eax
 6a6:	74 f3                	je     69b <lock_acquire+0x6>
  {

  }
  return 0;
}
 6a8:	b8 00 00 00 00       	mov    $0x0,%eax
 6ad:	5d                   	pop    %ebp
 6ae:	c3                   	ret    

000006af <lock_release>:
int
lock_release(lock_t * lock){
 6af:	55                   	push   %ebp
 6b0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 6b2:	8b 45 08             	mov    0x8(%ebp),%eax
 6b5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 6bb:	b8 00 00 00 00       	mov    $0x0,%eax
 6c0:	5d                   	pop    %ebp
 6c1:	c3                   	ret    

000006c2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6c2:	b8 01 00 00 00       	mov    $0x1,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <exit>:
SYSCALL(exit)
 6ca:	b8 02 00 00 00       	mov    $0x2,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <wait>:
SYSCALL(wait)
 6d2:	b8 03 00 00 00       	mov    $0x3,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <pipe>:
SYSCALL(pipe)
 6da:	b8 04 00 00 00       	mov    $0x4,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <read>:
SYSCALL(read)
 6e2:	b8 05 00 00 00       	mov    $0x5,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <write>:
SYSCALL(write)
 6ea:	b8 10 00 00 00       	mov    $0x10,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <close>:
SYSCALL(close)
 6f2:	b8 15 00 00 00       	mov    $0x15,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <kill>:
SYSCALL(kill)
 6fa:	b8 06 00 00 00       	mov    $0x6,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <exec>:
SYSCALL(exec)
 702:	b8 07 00 00 00       	mov    $0x7,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <open>:
SYSCALL(open)
 70a:	b8 0f 00 00 00       	mov    $0xf,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <mknod>:
SYSCALL(mknod)
 712:	b8 11 00 00 00       	mov    $0x11,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <unlink>:
SYSCALL(unlink)
 71a:	b8 12 00 00 00       	mov    $0x12,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <fstat>:
SYSCALL(fstat)
 722:	b8 08 00 00 00       	mov    $0x8,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <link>:
SYSCALL(link)
 72a:	b8 13 00 00 00       	mov    $0x13,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <mkdir>:
SYSCALL(mkdir)
 732:	b8 14 00 00 00       	mov    $0x14,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <chdir>:
SYSCALL(chdir)
 73a:	b8 09 00 00 00       	mov    $0x9,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <dup>:
SYSCALL(dup)
 742:	b8 0a 00 00 00       	mov    $0xa,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <getpid>:
SYSCALL(getpid)
 74a:	b8 0b 00 00 00       	mov    $0xb,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <sbrk>:
SYSCALL(sbrk)
 752:	b8 0c 00 00 00       	mov    $0xc,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <sleep>:
SYSCALL(sleep)
 75a:	b8 0d 00 00 00       	mov    $0xd,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <uptime>:
SYSCALL(uptime)
 762:	b8 0e 00 00 00       	mov    $0xe,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <clone>:
SYSCALL(clone)
 76a:	b8 16 00 00 00       	mov    $0x16,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <join>:
SYSCALL(join)
 772:	b8 17 00 00 00       	mov    $0x17,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 77a:	55                   	push   %ebp
 77b:	89 e5                	mov    %esp,%ebp
 77d:	83 ec 1c             	sub    $0x1c,%esp
 780:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 783:	6a 01                	push   $0x1
 785:	8d 55 f4             	lea    -0xc(%ebp),%edx
 788:	52                   	push   %edx
 789:	50                   	push   %eax
 78a:	e8 5b ff ff ff       	call   6ea <write>
}
 78f:	83 c4 10             	add    $0x10,%esp
 792:	c9                   	leave  
 793:	c3                   	ret    

00000794 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 794:	55                   	push   %ebp
 795:	89 e5                	mov    %esp,%ebp
 797:	57                   	push   %edi
 798:	56                   	push   %esi
 799:	53                   	push   %ebx
 79a:	83 ec 2c             	sub    $0x2c,%esp
 79d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7a0:	89 d0                	mov    %edx,%eax
 7a2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7a4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7a8:	0f 95 c1             	setne  %cl
 7ab:	c1 ea 1f             	shr    $0x1f,%edx
 7ae:	84 d1                	test   %dl,%cl
 7b0:	74 44                	je     7f6 <printint+0x62>
    neg = 1;
    x = -xx;
 7b2:	f7 d8                	neg    %eax
 7b4:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7b6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7bd:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7c2:	89 c8                	mov    %ecx,%eax
 7c4:	ba 00 00 00 00       	mov    $0x0,%edx
 7c9:	f7 f6                	div    %esi
 7cb:	89 df                	mov    %ebx,%edi
 7cd:	83 c3 01             	add    $0x1,%ebx
 7d0:	0f b6 92 28 0c 00 00 	movzbl 0xc28(%edx),%edx
 7d7:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7db:	89 ca                	mov    %ecx,%edx
 7dd:	89 c1                	mov    %eax,%ecx
 7df:	39 d6                	cmp    %edx,%esi
 7e1:	76 df                	jbe    7c2 <printint+0x2e>
  if(neg)
 7e3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7e7:	74 31                	je     81a <printint+0x86>
    buf[i++] = '-';
 7e9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7ee:	8d 5f 02             	lea    0x2(%edi),%ebx
 7f1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7f4:	eb 17                	jmp    80d <printint+0x79>
    x = xx;
 7f6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7f8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7ff:	eb bc                	jmp    7bd <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 801:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 806:	89 f0                	mov    %esi,%eax
 808:	e8 6d ff ff ff       	call   77a <putc>
  while(--i >= 0)
 80d:	83 eb 01             	sub    $0x1,%ebx
 810:	79 ef                	jns    801 <printint+0x6d>
}
 812:	83 c4 2c             	add    $0x2c,%esp
 815:	5b                   	pop    %ebx
 816:	5e                   	pop    %esi
 817:	5f                   	pop    %edi
 818:	5d                   	pop    %ebp
 819:	c3                   	ret    
 81a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 81d:	eb ee                	jmp    80d <printint+0x79>

0000081f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 81f:	55                   	push   %ebp
 820:	89 e5                	mov    %esp,%ebp
 822:	57                   	push   %edi
 823:	56                   	push   %esi
 824:	53                   	push   %ebx
 825:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 828:	8d 45 10             	lea    0x10(%ebp),%eax
 82b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 82e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 833:	bb 00 00 00 00       	mov    $0x0,%ebx
 838:	eb 14                	jmp    84e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 83a:	89 fa                	mov    %edi,%edx
 83c:	8b 45 08             	mov    0x8(%ebp),%eax
 83f:	e8 36 ff ff ff       	call   77a <putc>
 844:	eb 05                	jmp    84b <printf+0x2c>
      }
    } else if(state == '%'){
 846:	83 fe 25             	cmp    $0x25,%esi
 849:	74 25                	je     870 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 84b:	83 c3 01             	add    $0x1,%ebx
 84e:	8b 45 0c             	mov    0xc(%ebp),%eax
 851:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 855:	84 c0                	test   %al,%al
 857:	0f 84 20 01 00 00    	je     97d <printf+0x15e>
    c = fmt[i] & 0xff;
 85d:	0f be f8             	movsbl %al,%edi
 860:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 863:	85 f6                	test   %esi,%esi
 865:	75 df                	jne    846 <printf+0x27>
      if(c == '%'){
 867:	83 f8 25             	cmp    $0x25,%eax
 86a:	75 ce                	jne    83a <printf+0x1b>
        state = '%';
 86c:	89 c6                	mov    %eax,%esi
 86e:	eb db                	jmp    84b <printf+0x2c>
      if(c == 'd'){
 870:	83 f8 25             	cmp    $0x25,%eax
 873:	0f 84 cf 00 00 00    	je     948 <printf+0x129>
 879:	0f 8c dd 00 00 00    	jl     95c <printf+0x13d>
 87f:	83 f8 78             	cmp    $0x78,%eax
 882:	0f 8f d4 00 00 00    	jg     95c <printf+0x13d>
 888:	83 f8 63             	cmp    $0x63,%eax
 88b:	0f 8c cb 00 00 00    	jl     95c <printf+0x13d>
 891:	83 e8 63             	sub    $0x63,%eax
 894:	83 f8 15             	cmp    $0x15,%eax
 897:	0f 87 bf 00 00 00    	ja     95c <printf+0x13d>
 89d:	ff 24 85 d0 0b 00 00 	jmp    *0xbd0(,%eax,4)
        printint(fd, *ap, 10, 1);
 8a4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8a7:	8b 17                	mov    (%edi),%edx
 8a9:	83 ec 0c             	sub    $0xc,%esp
 8ac:	6a 01                	push   $0x1
 8ae:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8b3:	8b 45 08             	mov    0x8(%ebp),%eax
 8b6:	e8 d9 fe ff ff       	call   794 <printint>
        ap++;
 8bb:	83 c7 04             	add    $0x4,%edi
 8be:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8c1:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8c4:	be 00 00 00 00       	mov    $0x0,%esi
 8c9:	eb 80                	jmp    84b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8cb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8ce:	8b 17                	mov    (%edi),%edx
 8d0:	83 ec 0c             	sub    $0xc,%esp
 8d3:	6a 00                	push   $0x0
 8d5:	b9 10 00 00 00       	mov    $0x10,%ecx
 8da:	8b 45 08             	mov    0x8(%ebp),%eax
 8dd:	e8 b2 fe ff ff       	call   794 <printint>
        ap++;
 8e2:	83 c7 04             	add    $0x4,%edi
 8e5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8eb:	be 00 00 00 00       	mov    $0x0,%esi
 8f0:	e9 56 ff ff ff       	jmp    84b <printf+0x2c>
        s = (char*)*ap;
 8f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8f8:	8b 30                	mov    (%eax),%esi
        ap++;
 8fa:	83 c0 04             	add    $0x4,%eax
 8fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 900:	85 f6                	test   %esi,%esi
 902:	75 15                	jne    919 <printf+0xfa>
          s = "(null)";
 904:	be c9 0b 00 00       	mov    $0xbc9,%esi
 909:	eb 0e                	jmp    919 <printf+0xfa>
          putc(fd, *s);
 90b:	0f be d2             	movsbl %dl,%edx
 90e:	8b 45 08             	mov    0x8(%ebp),%eax
 911:	e8 64 fe ff ff       	call   77a <putc>
          s++;
 916:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 919:	0f b6 16             	movzbl (%esi),%edx
 91c:	84 d2                	test   %dl,%dl
 91e:	75 eb                	jne    90b <printf+0xec>
      state = 0;
 920:	be 00 00 00 00       	mov    $0x0,%esi
 925:	e9 21 ff ff ff       	jmp    84b <printf+0x2c>
        putc(fd, *ap);
 92a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 92d:	0f be 17             	movsbl (%edi),%edx
 930:	8b 45 08             	mov    0x8(%ebp),%eax
 933:	e8 42 fe ff ff       	call   77a <putc>
        ap++;
 938:	83 c7 04             	add    $0x4,%edi
 93b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 93e:	be 00 00 00 00       	mov    $0x0,%esi
 943:	e9 03 ff ff ff       	jmp    84b <printf+0x2c>
        putc(fd, c);
 948:	89 fa                	mov    %edi,%edx
 94a:	8b 45 08             	mov    0x8(%ebp),%eax
 94d:	e8 28 fe ff ff       	call   77a <putc>
      state = 0;
 952:	be 00 00 00 00       	mov    $0x0,%esi
 957:	e9 ef fe ff ff       	jmp    84b <printf+0x2c>
        putc(fd, '%');
 95c:	ba 25 00 00 00       	mov    $0x25,%edx
 961:	8b 45 08             	mov    0x8(%ebp),%eax
 964:	e8 11 fe ff ff       	call   77a <putc>
        putc(fd, c);
 969:	89 fa                	mov    %edi,%edx
 96b:	8b 45 08             	mov    0x8(%ebp),%eax
 96e:	e8 07 fe ff ff       	call   77a <putc>
      state = 0;
 973:	be 00 00 00 00       	mov    $0x0,%esi
 978:	e9 ce fe ff ff       	jmp    84b <printf+0x2c>
    }
  }
}
 97d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 980:	5b                   	pop    %ebx
 981:	5e                   	pop    %esi
 982:	5f                   	pop    %edi
 983:	5d                   	pop    %ebp
 984:	c3                   	ret    

00000985 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 985:	55                   	push   %ebp
 986:	89 e5                	mov    %esp,%ebp
 988:	57                   	push   %edi
 989:	56                   	push   %esi
 98a:	53                   	push   %ebx
 98b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 98e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 991:	a1 b8 0f 00 00       	mov    0xfb8,%eax
 996:	eb 02                	jmp    99a <free+0x15>
 998:	89 d0                	mov    %edx,%eax
 99a:	39 c8                	cmp    %ecx,%eax
 99c:	73 04                	jae    9a2 <free+0x1d>
 99e:	39 08                	cmp    %ecx,(%eax)
 9a0:	77 12                	ja     9b4 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a2:	8b 10                	mov    (%eax),%edx
 9a4:	39 c2                	cmp    %eax,%edx
 9a6:	77 f0                	ja     998 <free+0x13>
 9a8:	39 c8                	cmp    %ecx,%eax
 9aa:	72 08                	jb     9b4 <free+0x2f>
 9ac:	39 ca                	cmp    %ecx,%edx
 9ae:	77 04                	ja     9b4 <free+0x2f>
 9b0:	89 d0                	mov    %edx,%eax
 9b2:	eb e6                	jmp    99a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9b4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9b7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ba:	8b 10                	mov    (%eax),%edx
 9bc:	39 d7                	cmp    %edx,%edi
 9be:	74 19                	je     9d9 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9c3:	8b 50 04             	mov    0x4(%eax),%edx
 9c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9c9:	39 ce                	cmp    %ecx,%esi
 9cb:	74 1b                	je     9e8 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9cd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9cf:	a3 b8 0f 00 00       	mov    %eax,0xfb8
}
 9d4:	5b                   	pop    %ebx
 9d5:	5e                   	pop    %esi
 9d6:	5f                   	pop    %edi
 9d7:	5d                   	pop    %ebp
 9d8:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9d9:	03 72 04             	add    0x4(%edx),%esi
 9dc:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9df:	8b 10                	mov    (%eax),%edx
 9e1:	8b 12                	mov    (%edx),%edx
 9e3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9e6:	eb db                	jmp    9c3 <free+0x3e>
    p->s.size += bp->s.size;
 9e8:	03 53 fc             	add    -0x4(%ebx),%edx
 9eb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ee:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9f1:	89 10                	mov    %edx,(%eax)
 9f3:	eb da                	jmp    9cf <free+0x4a>

000009f5 <morecore>:

static Header*
morecore(uint nu)
{
 9f5:	55                   	push   %ebp
 9f6:	89 e5                	mov    %esp,%ebp
 9f8:	53                   	push   %ebx
 9f9:	83 ec 04             	sub    $0x4,%esp
 9fc:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9fe:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a03:	77 05                	ja     a0a <morecore+0x15>
    nu = 4096;
 a05:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a0a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a11:	83 ec 0c             	sub    $0xc,%esp
 a14:	50                   	push   %eax
 a15:	e8 38 fd ff ff       	call   752 <sbrk>
  if(p == (char*)-1)
 a1a:	83 c4 10             	add    $0x10,%esp
 a1d:	83 f8 ff             	cmp    $0xffffffff,%eax
 a20:	74 1c                	je     a3e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a22:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a25:	83 c0 08             	add    $0x8,%eax
 a28:	83 ec 0c             	sub    $0xc,%esp
 a2b:	50                   	push   %eax
 a2c:	e8 54 ff ff ff       	call   985 <free>
  return freep;
 a31:	a1 b8 0f 00 00       	mov    0xfb8,%eax
 a36:	83 c4 10             	add    $0x10,%esp
}
 a39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a3c:	c9                   	leave  
 a3d:	c3                   	ret    
    return 0;
 a3e:	b8 00 00 00 00       	mov    $0x0,%eax
 a43:	eb f4                	jmp    a39 <morecore+0x44>

00000a45 <malloc>:

void*
malloc(uint nbytes)
{
 a45:	55                   	push   %ebp
 a46:	89 e5                	mov    %esp,%ebp
 a48:	53                   	push   %ebx
 a49:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a4c:	8b 45 08             	mov    0x8(%ebp),%eax
 a4f:	8d 58 07             	lea    0x7(%eax),%ebx
 a52:	c1 eb 03             	shr    $0x3,%ebx
 a55:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a58:	8b 0d b8 0f 00 00    	mov    0xfb8,%ecx
 a5e:	85 c9                	test   %ecx,%ecx
 a60:	74 04                	je     a66 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a62:	8b 01                	mov    (%ecx),%eax
 a64:	eb 4a                	jmp    ab0 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a66:	c7 05 b8 0f 00 00 bc 	movl   $0xfbc,0xfb8
 a6d:	0f 00 00 
 a70:	c7 05 bc 0f 00 00 bc 	movl   $0xfbc,0xfbc
 a77:	0f 00 00 
    base.s.size = 0;
 a7a:	c7 05 c0 0f 00 00 00 	movl   $0x0,0xfc0
 a81:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a84:	b9 bc 0f 00 00       	mov    $0xfbc,%ecx
 a89:	eb d7                	jmp    a62 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a8b:	74 19                	je     aa6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a8d:	29 da                	sub    %ebx,%edx
 a8f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a92:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a95:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a98:	89 0d b8 0f 00 00    	mov    %ecx,0xfb8
      return (void*)(p + 1);
 a9e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 aa1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aa4:	c9                   	leave  
 aa5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 aa6:	8b 10                	mov    (%eax),%edx
 aa8:	89 11                	mov    %edx,(%ecx)
 aaa:	eb ec                	jmp    a98 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aac:	89 c1                	mov    %eax,%ecx
 aae:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 ab0:	8b 50 04             	mov    0x4(%eax),%edx
 ab3:	39 da                	cmp    %ebx,%edx
 ab5:	73 d4                	jae    a8b <malloc+0x46>
    if(p == freep)
 ab7:	39 05 b8 0f 00 00    	cmp    %eax,0xfb8
 abd:	75 ed                	jne    aac <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 abf:	89 d8                	mov    %ebx,%eax
 ac1:	e8 2f ff ff ff       	call   9f5 <morecore>
 ac6:	85 c0                	test   %eax,%eax
 ac8:	75 e2                	jne    aac <malloc+0x67>
 aca:	eb d5                	jmp    aa1 <malloc+0x5c>
