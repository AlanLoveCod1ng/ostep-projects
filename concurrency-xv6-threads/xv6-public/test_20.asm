
_test_20:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:
   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1, void *arg2)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 78 0e 00 00       	push   $0xe78
   b:	e8 b2 05 00 00       	call   5c2 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 63 06 00 00       	call   67f <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 7c 0e 00 00    	cmp    0xe7c,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 fc 09 00 00       	push   $0x9fc
  2e:	68 06 0a 00 00       	push   $0xa06
  33:	6a 01                	push   $0x1
  35:	e8 12 07 00 00       	call   74c <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 0e 0a 00 00       	push   $0xa0e
  42:	68 2c 0a 00 00       	push   $0xa2c
  47:	6a 01                	push   $0x1
  49:	e8 fe 06 00 00       	call   74c <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 40 0a 00 00       	push   $0xa40
  56:	6a 01                	push   $0x1
  58:	e8 ef 06 00 00       	call   74c <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 84 0e 00 00    	push   0xe84
  66:	e8 bc 05 00 00       	call   627 <kill>
  6b:	e8 87 05 00 00       	call   5f7 <exit>
   global++;
  70:	83 05 80 0e 00 00 01 	addl   $0x1,0xe80
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 78 0e 00 00       	push   $0xe78
  7f:	e8 58 05 00 00       	call   5dc <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 74 0e 00 00 	movl   $0xe74,(%esp)
  8b:	e8 32 05 00 00       	call   5c2 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 e3 05 00 00       	call   67f <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 7c 0e 00 00    	cmp    0xe7c,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 fc 09 00 00       	push   $0x9fc
  ae:	68 06 0a 00 00       	push   $0xa06
  b3:	6a 01                	push   $0x1
  b5:	e8 92 06 00 00       	call   74c <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 0e 0a 00 00       	push   $0xa0e
  c2:	68 2c 0a 00 00       	push   $0xa2c
  c7:	6a 01                	push   $0x1
  c9:	e8 7e 06 00 00       	call   74c <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 40 0a 00 00       	push   $0xa40
  d6:	6a 01                	push   $0x1
  d8:	e8 6f 06 00 00       	call   74c <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 84 0e 00 00    	push   0xe84
  e6:	e8 3c 05 00 00       	call   627 <kill>
  eb:	e8 07 05 00 00       	call   5f7 <exit>
   global++;
  f0:	83 05 80 0e 00 00 01 	addl   $0x1,0xe80
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 74 0e 00 00       	push   $0xe74
  ff:	e8 d8 04 00 00       	call   5dc <lock_release>

   
   exit();
 104:	e8 ee 04 00 00       	call   5f7 <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 78 0e 00 00       	push   $0xe78
 114:	e8 96 04 00 00       	call   5af <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 74 0e 00 00 	movl   $0xe74,(%esp)
 120:	e8 8a 04 00 00       	call   5af <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 78 0e 00 00 	movl   $0xe78,(%esp)
 12c:	e8 91 04 00 00       	call   5c2 <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 74 0e 00 00 	movl   $0xe74,(%esp)
 138:	e8 85 04 00 00       	call   5c2 <lock_acquire>

   int nested_thread_id = thread_create(worker2, 0, 0);
 13d:	83 c4 0c             	add    $0xc,%esp
 140:	6a 00                	push   $0x0
 142:	6a 00                	push   $0x0
 144:	68 00 00 00 00       	push   $0x0
 149:	e8 08 04 00 00       	call   556 <thread_create>
    assert(nested_thread_id > 0);
 14e:	83 c4 10             	add    $0x10,%esp
 151:	85 c0                	test   %eax,%eax
 153:	7e 14                	jle    169 <worker+0x60>
   size = (unsigned int)sbrk(0);
 155:	83 ec 0c             	sub    $0xc,%esp
 158:	6a 00                	push   $0x0
 15a:	e8 20 05 00 00       	call   67f <sbrk>
 15f:	a3 7c 0e 00 00       	mov    %eax,0xe7c

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 fc 09 00 00       	push   $0x9fc
 170:	68 06 0a 00 00       	push   $0xa06
 175:	6a 01                	push   $0x1
 177:	e8 d0 05 00 00       	call   74c <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 4d 0a 00 00       	push   $0xa4d
 184:	68 2c 0a 00 00       	push   $0xa2c
 189:	6a 01                	push   $0x1
 18b:	e8 bc 05 00 00       	call   74c <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 40 0a 00 00       	push   $0xa40
 198:	6a 01                	push   $0x1
 19a:	e8 ad 05 00 00       	call   74c <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 84 0e 00 00    	push   0xe84
 1a8:	e8 7a 04 00 00       	call   627 <kill>
 1ad:	e8 45 04 00 00       	call   5f7 <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 78 0e 00 00       	push   $0xe78
 1ba:	e8 1d 04 00 00       	call   5dc <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 bc 04 00 00       	call   687 <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 78 0e 00 00 	movl   $0xe78,(%esp)
 1d2:	e8 eb 03 00 00       	call   5c2 <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 70 0e 00 00       	mov    0xe70,%eax
 1df:	39 05 80 0e 00 00    	cmp    %eax,0xe80
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
 1e7:	c7 05 80 0e 00 00 00 	movl   $0x0,0xe80
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
 1f9:	e8 81 04 00 00       	call   67f <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 75 04 00 00       	call   67f <sbrk>
 20a:	a3 7c 0e 00 00       	mov    %eax,0xe7c
   lock_release(&lock);
 20f:	c7 04 24 78 0e 00 00 	movl   $0xe78,(%esp)
 216:	e8 c1 03 00 00       	call   5dc <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 74 0e 00 00       	push   $0xe74
 228:	e8 af 03 00 00       	call   5dc <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 4e 04 00 00       	call   687 <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 74 0e 00 00 	movl   $0xe74,(%esp)
 240:	e8 7d 03 00 00       	call   5c2 <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 70 0e 00 00       	mov    0xe70,%eax
 24d:	39 05 80 0e 00 00    	cmp    %eax,0xe80
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 74 0e 00 00       	push   $0xe74
 25d:	e8 7a 03 00 00       	call   5dc <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 24 03 00 00       	call   58b <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 84 03 00 00       	call   5f7 <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 fc 09 00 00       	push   $0x9fc
 27a:	68 06 0a 00 00       	push   $0xa06
 27f:	6a 01                	push   $0x1
 281:	e8 c6 04 00 00       	call   74c <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 62 0a 00 00       	push   $0xa62
 28e:	68 2c 0a 00 00       	push   $0xa2c
 293:	6a 01                	push   $0x1
 295:	e8 b2 04 00 00       	call   74c <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 40 0a 00 00       	push   $0xa40
 2a2:	6a 01                	push   $0x1
 2a4:	e8 a3 04 00 00       	call   74c <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 84 0e 00 00    	push   0xe84
 2b2:	e8 70 03 00 00       	call   627 <kill>
 2b7:	e8 3b 03 00 00       	call   5f7 <exit>

000002bc <main>:
{
 2bc:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2c0:	83 e4 f0             	and    $0xfffffff0,%esp
 2c3:	ff 71 fc             	push   -0x4(%ecx)
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	51                   	push   %ecx
 2ca:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
 2cd:	e8 a5 03 00 00       	call   677 <getpid>
 2d2:	a3 84 0e 00 00       	mov    %eax,0xe84
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 90 03 00 00       	call   67f <sbrk>
 2ef:	a3 7c 0e 00 00       	mov    %eax,0xe7c
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2f4:	83 c4 0c             	add    $0xc,%esp
 2f7:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2fa:	50                   	push   %eax
 2fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fe:	50                   	push   %eax
 2ff:	68 09 01 00 00       	push   $0x109
 304:	e8 4d 02 00 00       	call   556 <thread_create>
   assert(thread_pid > 0);
 309:	83 c4 10             	add    $0x10,%esp
 30c:	85 c0                	test   %eax,%eax
 30e:	7e 1d                	jle    32d <main+0x71>
   int join_pid = thread_join();
 310:	e8 76 02 00 00       	call   58b <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 85 0a 00 00       	push   $0xa85
 321:	6a 01                	push   $0x1
 323:	e8 24 04 00 00       	call   74c <printf>
   exit();
 328:	e8 ca 02 00 00       	call   5f7 <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 fc 09 00 00       	push   $0x9fc
 334:	68 06 0a 00 00       	push   $0xa06
 339:	6a 01                	push   $0x1
 33b:	e8 0c 04 00 00       	call   74c <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 76 0a 00 00       	push   $0xa76
 348:	68 2c 0a 00 00       	push   $0xa2c
 34d:	6a 01                	push   $0x1
 34f:	e8 f8 03 00 00       	call   74c <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 40 0a 00 00       	push   $0xa40
 35c:	6a 01                	push   $0x1
 35e:	e8 e9 03 00 00       	call   74c <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 84 0e 00 00    	push   0xe84
 36c:	e8 b6 02 00 00       	call   627 <kill>
 371:	e8 81 02 00 00       	call   5f7 <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 fc 09 00 00       	push   $0x9fc
 37d:	68 06 0a 00 00       	push   $0xa06
 382:	6a 01                	push   $0x1
 384:	e8 c3 03 00 00       	call   74c <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 69 0a 00 00       	push   $0xa69
 391:	68 2c 0a 00 00       	push   $0xa2c
 396:	6a 01                	push   $0x1
 398:	e8 af 03 00 00       	call   74c <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 40 0a 00 00       	push   $0xa40
 3a5:	6a 01                	push   $0x1
 3a7:	e8 a0 03 00 00       	call   74c <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 84 0e 00 00    	push   0xe84
 3b5:	e8 6d 02 00 00       	call   627 <kill>
 3ba:	e8 38 02 00 00       	call   5f7 <exit>

000003bf <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	56                   	push   %esi
 3c3:	53                   	push   %ebx
 3c4:	8b 75 08             	mov    0x8(%ebp),%esi
 3c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3ca:	89 f0                	mov    %esi,%eax
 3cc:	89 d1                	mov    %edx,%ecx
 3ce:	83 c2 01             	add    $0x1,%edx
 3d1:	89 c3                	mov    %eax,%ebx
 3d3:	83 c0 01             	add    $0x1,%eax
 3d6:	0f b6 09             	movzbl (%ecx),%ecx
 3d9:	88 0b                	mov    %cl,(%ebx)
 3db:	84 c9                	test   %cl,%cl
 3dd:	75 ed                	jne    3cc <strcpy+0xd>
    ;
  return os;
}
 3df:	89 f0                	mov    %esi,%eax
 3e1:	5b                   	pop    %ebx
 3e2:	5e                   	pop    %esi
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3ee:	eb 06                	jmp    3f6 <strcmp+0x11>
    p++, q++;
 3f0:	83 c1 01             	add    $0x1,%ecx
 3f3:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3f6:	0f b6 01             	movzbl (%ecx),%eax
 3f9:	84 c0                	test   %al,%al
 3fb:	74 04                	je     401 <strcmp+0x1c>
 3fd:	3a 02                	cmp    (%edx),%al
 3ff:	74 ef                	je     3f0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 401:	0f b6 c0             	movzbl %al,%eax
 404:	0f b6 12             	movzbl (%edx),%edx
 407:	29 d0                	sub    %edx,%eax
}
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <strlen>:

uint
strlen(const char *s)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 411:	b8 00 00 00 00       	mov    $0x0,%eax
 416:	eb 03                	jmp    41b <strlen+0x10>
 418:	83 c0 01             	add    $0x1,%eax
 41b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 41f:	75 f7                	jne    418 <strlen+0xd>
    ;
  return n;
}
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    

00000423 <memset>:

void*
memset(void *dst, int c, uint n)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	57                   	push   %edi
 427:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 42a:	89 d7                	mov    %edx,%edi
 42c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42f:	8b 45 0c             	mov    0xc(%ebp),%eax
 432:	fc                   	cld    
 433:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 435:	89 d0                	mov    %edx,%eax
 437:	8b 7d fc             	mov    -0x4(%ebp),%edi
 43a:	c9                   	leave  
 43b:	c3                   	ret    

0000043c <strchr>:

char*
strchr(const char *s, char c)
{
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
 442:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 446:	eb 03                	jmp    44b <strchr+0xf>
 448:	83 c0 01             	add    $0x1,%eax
 44b:	0f b6 10             	movzbl (%eax),%edx
 44e:	84 d2                	test   %dl,%dl
 450:	74 06                	je     458 <strchr+0x1c>
    if(*s == c)
 452:	38 ca                	cmp    %cl,%dl
 454:	75 f2                	jne    448 <strchr+0xc>
 456:	eb 05                	jmp    45d <strchr+0x21>
      return (char*)s;
  return 0;
 458:	b8 00 00 00 00       	mov    $0x0,%eax
}
 45d:	5d                   	pop    %ebp
 45e:	c3                   	ret    

0000045f <gets>:

char*
gets(char *buf, int max)
{
 45f:	55                   	push   %ebp
 460:	89 e5                	mov    %esp,%ebp
 462:	57                   	push   %edi
 463:	56                   	push   %esi
 464:	53                   	push   %ebx
 465:	83 ec 1c             	sub    $0x1c,%esp
 468:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 46b:	bb 00 00 00 00       	mov    $0x0,%ebx
 470:	89 de                	mov    %ebx,%esi
 472:	83 c3 01             	add    $0x1,%ebx
 475:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 478:	7d 2e                	jge    4a8 <gets+0x49>
    cc = read(0, &c, 1);
 47a:	83 ec 04             	sub    $0x4,%esp
 47d:	6a 01                	push   $0x1
 47f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 482:	50                   	push   %eax
 483:	6a 00                	push   $0x0
 485:	e8 85 01 00 00       	call   60f <read>
    if(cc < 1)
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	85 c0                	test   %eax,%eax
 48f:	7e 17                	jle    4a8 <gets+0x49>
      break;
    buf[i++] = c;
 491:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 495:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 498:	3c 0a                	cmp    $0xa,%al
 49a:	0f 94 c2             	sete   %dl
 49d:	3c 0d                	cmp    $0xd,%al
 49f:	0f 94 c0             	sete   %al
 4a2:	08 c2                	or     %al,%dl
 4a4:	74 ca                	je     470 <gets+0x11>
    buf[i++] = c;
 4a6:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a8:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4ac:	89 f8                	mov    %edi,%eax
 4ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b1:	5b                   	pop    %ebx
 4b2:	5e                   	pop    %esi
 4b3:	5f                   	pop    %edi
 4b4:	5d                   	pop    %ebp
 4b5:	c3                   	ret    

000004b6 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b6:	55                   	push   %ebp
 4b7:	89 e5                	mov    %esp,%ebp
 4b9:	56                   	push   %esi
 4ba:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4bb:	83 ec 08             	sub    $0x8,%esp
 4be:	6a 00                	push   $0x0
 4c0:	ff 75 08             	push   0x8(%ebp)
 4c3:	e8 6f 01 00 00       	call   637 <open>
  if(fd < 0)
 4c8:	83 c4 10             	add    $0x10,%esp
 4cb:	85 c0                	test   %eax,%eax
 4cd:	78 24                	js     4f3 <stat+0x3d>
 4cf:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4d1:	83 ec 08             	sub    $0x8,%esp
 4d4:	ff 75 0c             	push   0xc(%ebp)
 4d7:	50                   	push   %eax
 4d8:	e8 72 01 00 00       	call   64f <fstat>
 4dd:	89 c6                	mov    %eax,%esi
  close(fd);
 4df:	89 1c 24             	mov    %ebx,(%esp)
 4e2:	e8 38 01 00 00       	call   61f <close>
  return r;
 4e7:	83 c4 10             	add    $0x10,%esp
}
 4ea:	89 f0                	mov    %esi,%eax
 4ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret    
    return -1;
 4f3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f8:	eb f0                	jmp    4ea <stat+0x34>

000004fa <atoi>:

int
atoi(const char *s)
{
 4fa:	55                   	push   %ebp
 4fb:	89 e5                	mov    %esp,%ebp
 4fd:	53                   	push   %ebx
 4fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 501:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 506:	eb 10                	jmp    518 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 508:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 50b:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 50e:	83 c1 01             	add    $0x1,%ecx
 511:	0f be c0             	movsbl %al,%eax
 514:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 518:	0f b6 01             	movzbl (%ecx),%eax
 51b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 51e:	80 fb 09             	cmp    $0x9,%bl
 521:	76 e5                	jbe    508 <atoi+0xe>
  return n;
}
 523:	89 d0                	mov    %edx,%eax
 525:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 528:	c9                   	leave  
 529:	c3                   	ret    

0000052a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 52a:	55                   	push   %ebp
 52b:	89 e5                	mov    %esp,%ebp
 52d:	56                   	push   %esi
 52e:	53                   	push   %ebx
 52f:	8b 75 08             	mov    0x8(%ebp),%esi
 532:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 535:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 538:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 53a:	eb 0d                	jmp    549 <memmove+0x1f>
    *dst++ = *src++;
 53c:	0f b6 01             	movzbl (%ecx),%eax
 53f:	88 02                	mov    %al,(%edx)
 541:	8d 49 01             	lea    0x1(%ecx),%ecx
 544:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 547:	89 d8                	mov    %ebx,%eax
 549:	8d 58 ff             	lea    -0x1(%eax),%ebx
 54c:	85 c0                	test   %eax,%eax
 54e:	7f ec                	jg     53c <memmove+0x12>
  return vdst;
}
 550:	89 f0                	mov    %esi,%eax
 552:	5b                   	pop    %ebx
 553:	5e                   	pop    %esi
 554:	5d                   	pop    %ebp
 555:	c3                   	ret    

00000556 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 556:	55                   	push   %ebp
 557:	89 e5                	mov    %esp,%ebp
 559:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 55c:	68 00 20 00 00       	push   $0x2000
 561:	e8 0c 04 00 00       	call   972 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 566:	83 c4 10             	add    $0x10,%esp
 569:	a9 ff 0f 00 00       	test   $0xfff,%eax
 56e:	74 0a                	je     57a <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 570:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 575:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 57a:	50                   	push   %eax
 57b:	ff 75 10             	push   0x10(%ebp)
 57e:	ff 75 0c             	push   0xc(%ebp)
 581:	ff 75 08             	push   0x8(%ebp)
 584:	e8 0e 01 00 00       	call   697 <clone>
  return pid;
}
 589:	c9                   	leave  
 58a:	c3                   	ret    

0000058b <thread_join>:
int
thread_join()
{
 58b:	55                   	push   %ebp
 58c:	89 e5                	mov    %esp,%ebp
 58e:	53                   	push   %ebx
 58f:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 592:	8d 45 f4             	lea    -0xc(%ebp),%eax
 595:	50                   	push   %eax
 596:	e8 04 01 00 00       	call   69f <join>
 59b:	89 c3                	mov    %eax,%ebx
  free(stack);
 59d:	83 c4 04             	add    $0x4,%esp
 5a0:	ff 75 f4             	push   -0xc(%ebp)
 5a3:	e8 0a 03 00 00       	call   8b2 <free>
  return pid;
}
 5a8:	89 d8                	mov    %ebx,%eax
 5aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ad:	c9                   	leave  
 5ae:	c3                   	ret    

000005af <lock_init>:
int
lock_init(lock_t * lock){
 5af:	55                   	push   %ebp
 5b0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 5bb:	b8 00 00 00 00       	mov    $0x0,%eax
 5c0:	5d                   	pop    %ebp
 5c1:	c3                   	ret    

000005c2 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 5c2:	55                   	push   %ebp
 5c3:	89 e5                	mov    %esp,%ebp
 5c5:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5c8:	b8 01 00 00 00       	mov    $0x1,%eax
 5cd:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 5d0:	83 f8 01             	cmp    $0x1,%eax
 5d3:	74 f3                	je     5c8 <lock_acquire+0x6>
  {

  }
  return 0;
}
 5d5:	b8 00 00 00 00       	mov    $0x0,%eax
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    

000005dc <lock_release>:
int
lock_release(lock_t * lock){
 5dc:	55                   	push   %ebp
 5dd:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5df:	8b 45 08             	mov    0x8(%ebp),%eax
 5e2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 5e8:	b8 00 00 00 00       	mov    $0x0,%eax
 5ed:	5d                   	pop    %ebp
 5ee:	c3                   	ret    

000005ef <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ef:	b8 01 00 00 00       	mov    $0x1,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret    

000005f7 <exit>:
SYSCALL(exit)
 5f7:	b8 02 00 00 00       	mov    $0x2,%eax
 5fc:	cd 40                	int    $0x40
 5fe:	c3                   	ret    

000005ff <wait>:
SYSCALL(wait)
 5ff:	b8 03 00 00 00       	mov    $0x3,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret    

00000607 <pipe>:
SYSCALL(pipe)
 607:	b8 04 00 00 00       	mov    $0x4,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret    

0000060f <read>:
SYSCALL(read)
 60f:	b8 05 00 00 00       	mov    $0x5,%eax
 614:	cd 40                	int    $0x40
 616:	c3                   	ret    

00000617 <write>:
SYSCALL(write)
 617:	b8 10 00 00 00       	mov    $0x10,%eax
 61c:	cd 40                	int    $0x40
 61e:	c3                   	ret    

0000061f <close>:
SYSCALL(close)
 61f:	b8 15 00 00 00       	mov    $0x15,%eax
 624:	cd 40                	int    $0x40
 626:	c3                   	ret    

00000627 <kill>:
SYSCALL(kill)
 627:	b8 06 00 00 00       	mov    $0x6,%eax
 62c:	cd 40                	int    $0x40
 62e:	c3                   	ret    

0000062f <exec>:
SYSCALL(exec)
 62f:	b8 07 00 00 00       	mov    $0x7,%eax
 634:	cd 40                	int    $0x40
 636:	c3                   	ret    

00000637 <open>:
SYSCALL(open)
 637:	b8 0f 00 00 00       	mov    $0xf,%eax
 63c:	cd 40                	int    $0x40
 63e:	c3                   	ret    

0000063f <mknod>:
SYSCALL(mknod)
 63f:	b8 11 00 00 00       	mov    $0x11,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret    

00000647 <unlink>:
SYSCALL(unlink)
 647:	b8 12 00 00 00       	mov    $0x12,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret    

0000064f <fstat>:
SYSCALL(fstat)
 64f:	b8 08 00 00 00       	mov    $0x8,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret    

00000657 <link>:
SYSCALL(link)
 657:	b8 13 00 00 00       	mov    $0x13,%eax
 65c:	cd 40                	int    $0x40
 65e:	c3                   	ret    

0000065f <mkdir>:
SYSCALL(mkdir)
 65f:	b8 14 00 00 00       	mov    $0x14,%eax
 664:	cd 40                	int    $0x40
 666:	c3                   	ret    

00000667 <chdir>:
SYSCALL(chdir)
 667:	b8 09 00 00 00       	mov    $0x9,%eax
 66c:	cd 40                	int    $0x40
 66e:	c3                   	ret    

0000066f <dup>:
SYSCALL(dup)
 66f:	b8 0a 00 00 00       	mov    $0xa,%eax
 674:	cd 40                	int    $0x40
 676:	c3                   	ret    

00000677 <getpid>:
SYSCALL(getpid)
 677:	b8 0b 00 00 00       	mov    $0xb,%eax
 67c:	cd 40                	int    $0x40
 67e:	c3                   	ret    

0000067f <sbrk>:
SYSCALL(sbrk)
 67f:	b8 0c 00 00 00       	mov    $0xc,%eax
 684:	cd 40                	int    $0x40
 686:	c3                   	ret    

00000687 <sleep>:
SYSCALL(sleep)
 687:	b8 0d 00 00 00       	mov    $0xd,%eax
 68c:	cd 40                	int    $0x40
 68e:	c3                   	ret    

0000068f <uptime>:
SYSCALL(uptime)
 68f:	b8 0e 00 00 00       	mov    $0xe,%eax
 694:	cd 40                	int    $0x40
 696:	c3                   	ret    

00000697 <clone>:
SYSCALL(clone)
 697:	b8 16 00 00 00       	mov    $0x16,%eax
 69c:	cd 40                	int    $0x40
 69e:	c3                   	ret    

0000069f <join>:
SYSCALL(join)
 69f:	b8 17 00 00 00       	mov    $0x17,%eax
 6a4:	cd 40                	int    $0x40
 6a6:	c3                   	ret    

000006a7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6a7:	55                   	push   %ebp
 6a8:	89 e5                	mov    %esp,%ebp
 6aa:	83 ec 1c             	sub    $0x1c,%esp
 6ad:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6b0:	6a 01                	push   $0x1
 6b2:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6b5:	52                   	push   %edx
 6b6:	50                   	push   %eax
 6b7:	e8 5b ff ff ff       	call   617 <write>
}
 6bc:	83 c4 10             	add    $0x10,%esp
 6bf:	c9                   	leave  
 6c0:	c3                   	ret    

000006c1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6c1:	55                   	push   %ebp
 6c2:	89 e5                	mov    %esp,%ebp
 6c4:	57                   	push   %edi
 6c5:	56                   	push   %esi
 6c6:	53                   	push   %ebx
 6c7:	83 ec 2c             	sub    $0x2c,%esp
 6ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6cd:	89 d0                	mov    %edx,%eax
 6cf:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6d1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6d5:	0f 95 c1             	setne  %cl
 6d8:	c1 ea 1f             	shr    $0x1f,%edx
 6db:	84 d1                	test   %dl,%cl
 6dd:	74 44                	je     723 <printint+0x62>
    neg = 1;
    x = -xx;
 6df:	f7 d8                	neg    %eax
 6e1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6e3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6ea:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6ef:	89 c8                	mov    %ecx,%eax
 6f1:	ba 00 00 00 00       	mov    $0x0,%edx
 6f6:	f7 f6                	div    %esi
 6f8:	89 df                	mov    %ebx,%edi
 6fa:	83 c3 01             	add    $0x1,%ebx
 6fd:	0f b6 92 f4 0a 00 00 	movzbl 0xaf4(%edx),%edx
 704:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 708:	89 ca                	mov    %ecx,%edx
 70a:	89 c1                	mov    %eax,%ecx
 70c:	39 d6                	cmp    %edx,%esi
 70e:	76 df                	jbe    6ef <printint+0x2e>
  if(neg)
 710:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 714:	74 31                	je     747 <printint+0x86>
    buf[i++] = '-';
 716:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 71b:	8d 5f 02             	lea    0x2(%edi),%ebx
 71e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 721:	eb 17                	jmp    73a <printint+0x79>
    x = xx;
 723:	89 c1                	mov    %eax,%ecx
  neg = 0;
 725:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 72c:	eb bc                	jmp    6ea <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 72e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 733:	89 f0                	mov    %esi,%eax
 735:	e8 6d ff ff ff       	call   6a7 <putc>
  while(--i >= 0)
 73a:	83 eb 01             	sub    $0x1,%ebx
 73d:	79 ef                	jns    72e <printint+0x6d>
}
 73f:	83 c4 2c             	add    $0x2c,%esp
 742:	5b                   	pop    %ebx
 743:	5e                   	pop    %esi
 744:	5f                   	pop    %edi
 745:	5d                   	pop    %ebp
 746:	c3                   	ret    
 747:	8b 75 d0             	mov    -0x30(%ebp),%esi
 74a:	eb ee                	jmp    73a <printint+0x79>

0000074c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 74c:	55                   	push   %ebp
 74d:	89 e5                	mov    %esp,%ebp
 74f:	57                   	push   %edi
 750:	56                   	push   %esi
 751:	53                   	push   %ebx
 752:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 755:	8d 45 10             	lea    0x10(%ebp),%eax
 758:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 75b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 760:	bb 00 00 00 00       	mov    $0x0,%ebx
 765:	eb 14                	jmp    77b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 767:	89 fa                	mov    %edi,%edx
 769:	8b 45 08             	mov    0x8(%ebp),%eax
 76c:	e8 36 ff ff ff       	call   6a7 <putc>
 771:	eb 05                	jmp    778 <printf+0x2c>
      }
    } else if(state == '%'){
 773:	83 fe 25             	cmp    $0x25,%esi
 776:	74 25                	je     79d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 778:	83 c3 01             	add    $0x1,%ebx
 77b:	8b 45 0c             	mov    0xc(%ebp),%eax
 77e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 782:	84 c0                	test   %al,%al
 784:	0f 84 20 01 00 00    	je     8aa <printf+0x15e>
    c = fmt[i] & 0xff;
 78a:	0f be f8             	movsbl %al,%edi
 78d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 790:	85 f6                	test   %esi,%esi
 792:	75 df                	jne    773 <printf+0x27>
      if(c == '%'){
 794:	83 f8 25             	cmp    $0x25,%eax
 797:	75 ce                	jne    767 <printf+0x1b>
        state = '%';
 799:	89 c6                	mov    %eax,%esi
 79b:	eb db                	jmp    778 <printf+0x2c>
      if(c == 'd'){
 79d:	83 f8 25             	cmp    $0x25,%eax
 7a0:	0f 84 cf 00 00 00    	je     875 <printf+0x129>
 7a6:	0f 8c dd 00 00 00    	jl     889 <printf+0x13d>
 7ac:	83 f8 78             	cmp    $0x78,%eax
 7af:	0f 8f d4 00 00 00    	jg     889 <printf+0x13d>
 7b5:	83 f8 63             	cmp    $0x63,%eax
 7b8:	0f 8c cb 00 00 00    	jl     889 <printf+0x13d>
 7be:	83 e8 63             	sub    $0x63,%eax
 7c1:	83 f8 15             	cmp    $0x15,%eax
 7c4:	0f 87 bf 00 00 00    	ja     889 <printf+0x13d>
 7ca:	ff 24 85 9c 0a 00 00 	jmp    *0xa9c(,%eax,4)
        printint(fd, *ap, 10, 1);
 7d1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7d4:	8b 17                	mov    (%edi),%edx
 7d6:	83 ec 0c             	sub    $0xc,%esp
 7d9:	6a 01                	push   $0x1
 7db:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7e0:	8b 45 08             	mov    0x8(%ebp),%eax
 7e3:	e8 d9 fe ff ff       	call   6c1 <printint>
        ap++;
 7e8:	83 c7 04             	add    $0x4,%edi
 7eb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7ee:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7f1:	be 00 00 00 00       	mov    $0x0,%esi
 7f6:	eb 80                	jmp    778 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7f8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7fb:	8b 17                	mov    (%edi),%edx
 7fd:	83 ec 0c             	sub    $0xc,%esp
 800:	6a 00                	push   $0x0
 802:	b9 10 00 00 00       	mov    $0x10,%ecx
 807:	8b 45 08             	mov    0x8(%ebp),%eax
 80a:	e8 b2 fe ff ff       	call   6c1 <printint>
        ap++;
 80f:	83 c7 04             	add    $0x4,%edi
 812:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 815:	83 c4 10             	add    $0x10,%esp
      state = 0;
 818:	be 00 00 00 00       	mov    $0x0,%esi
 81d:	e9 56 ff ff ff       	jmp    778 <printf+0x2c>
        s = (char*)*ap;
 822:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 825:	8b 30                	mov    (%eax),%esi
        ap++;
 827:	83 c0 04             	add    $0x4,%eax
 82a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 82d:	85 f6                	test   %esi,%esi
 82f:	75 15                	jne    846 <printf+0xfa>
          s = "(null)";
 831:	be 92 0a 00 00       	mov    $0xa92,%esi
 836:	eb 0e                	jmp    846 <printf+0xfa>
          putc(fd, *s);
 838:	0f be d2             	movsbl %dl,%edx
 83b:	8b 45 08             	mov    0x8(%ebp),%eax
 83e:	e8 64 fe ff ff       	call   6a7 <putc>
          s++;
 843:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 846:	0f b6 16             	movzbl (%esi),%edx
 849:	84 d2                	test   %dl,%dl
 84b:	75 eb                	jne    838 <printf+0xec>
      state = 0;
 84d:	be 00 00 00 00       	mov    $0x0,%esi
 852:	e9 21 ff ff ff       	jmp    778 <printf+0x2c>
        putc(fd, *ap);
 857:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 85a:	0f be 17             	movsbl (%edi),%edx
 85d:	8b 45 08             	mov    0x8(%ebp),%eax
 860:	e8 42 fe ff ff       	call   6a7 <putc>
        ap++;
 865:	83 c7 04             	add    $0x4,%edi
 868:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 86b:	be 00 00 00 00       	mov    $0x0,%esi
 870:	e9 03 ff ff ff       	jmp    778 <printf+0x2c>
        putc(fd, c);
 875:	89 fa                	mov    %edi,%edx
 877:	8b 45 08             	mov    0x8(%ebp),%eax
 87a:	e8 28 fe ff ff       	call   6a7 <putc>
      state = 0;
 87f:	be 00 00 00 00       	mov    $0x0,%esi
 884:	e9 ef fe ff ff       	jmp    778 <printf+0x2c>
        putc(fd, '%');
 889:	ba 25 00 00 00       	mov    $0x25,%edx
 88e:	8b 45 08             	mov    0x8(%ebp),%eax
 891:	e8 11 fe ff ff       	call   6a7 <putc>
        putc(fd, c);
 896:	89 fa                	mov    %edi,%edx
 898:	8b 45 08             	mov    0x8(%ebp),%eax
 89b:	e8 07 fe ff ff       	call   6a7 <putc>
      state = 0;
 8a0:	be 00 00 00 00       	mov    $0x0,%esi
 8a5:	e9 ce fe ff ff       	jmp    778 <printf+0x2c>
    }
  }
}
 8aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ad:	5b                   	pop    %ebx
 8ae:	5e                   	pop    %esi
 8af:	5f                   	pop    %edi
 8b0:	5d                   	pop    %ebp
 8b1:	c3                   	ret    

000008b2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b2:	55                   	push   %ebp
 8b3:	89 e5                	mov    %esp,%ebp
 8b5:	57                   	push   %edi
 8b6:	56                   	push   %esi
 8b7:	53                   	push   %ebx
 8b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8bb:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8be:	a1 88 0e 00 00       	mov    0xe88,%eax
 8c3:	eb 02                	jmp    8c7 <free+0x15>
 8c5:	89 d0                	mov    %edx,%eax
 8c7:	39 c8                	cmp    %ecx,%eax
 8c9:	73 04                	jae    8cf <free+0x1d>
 8cb:	39 08                	cmp    %ecx,(%eax)
 8cd:	77 12                	ja     8e1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8cf:	8b 10                	mov    (%eax),%edx
 8d1:	39 c2                	cmp    %eax,%edx
 8d3:	77 f0                	ja     8c5 <free+0x13>
 8d5:	39 c8                	cmp    %ecx,%eax
 8d7:	72 08                	jb     8e1 <free+0x2f>
 8d9:	39 ca                	cmp    %ecx,%edx
 8db:	77 04                	ja     8e1 <free+0x2f>
 8dd:	89 d0                	mov    %edx,%eax
 8df:	eb e6                	jmp    8c7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8e1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8e4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8e7:	8b 10                	mov    (%eax),%edx
 8e9:	39 d7                	cmp    %edx,%edi
 8eb:	74 19                	je     906 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8f0:	8b 50 04             	mov    0x4(%eax),%edx
 8f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8f6:	39 ce                	cmp    %ecx,%esi
 8f8:	74 1b                	je     915 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8fa:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8fc:	a3 88 0e 00 00       	mov    %eax,0xe88
}
 901:	5b                   	pop    %ebx
 902:	5e                   	pop    %esi
 903:	5f                   	pop    %edi
 904:	5d                   	pop    %ebp
 905:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 906:	03 72 04             	add    0x4(%edx),%esi
 909:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 90c:	8b 10                	mov    (%eax),%edx
 90e:	8b 12                	mov    (%edx),%edx
 910:	89 53 f8             	mov    %edx,-0x8(%ebx)
 913:	eb db                	jmp    8f0 <free+0x3e>
    p->s.size += bp->s.size;
 915:	03 53 fc             	add    -0x4(%ebx),%edx
 918:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 91b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 91e:	89 10                	mov    %edx,(%eax)
 920:	eb da                	jmp    8fc <free+0x4a>

00000922 <morecore>:

static Header*
morecore(uint nu)
{
 922:	55                   	push   %ebp
 923:	89 e5                	mov    %esp,%ebp
 925:	53                   	push   %ebx
 926:	83 ec 04             	sub    $0x4,%esp
 929:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 92b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 930:	77 05                	ja     937 <morecore+0x15>
    nu = 4096;
 932:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 937:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 93e:	83 ec 0c             	sub    $0xc,%esp
 941:	50                   	push   %eax
 942:	e8 38 fd ff ff       	call   67f <sbrk>
  if(p == (char*)-1)
 947:	83 c4 10             	add    $0x10,%esp
 94a:	83 f8 ff             	cmp    $0xffffffff,%eax
 94d:	74 1c                	je     96b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 94f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 952:	83 c0 08             	add    $0x8,%eax
 955:	83 ec 0c             	sub    $0xc,%esp
 958:	50                   	push   %eax
 959:	e8 54 ff ff ff       	call   8b2 <free>
  return freep;
 95e:	a1 88 0e 00 00       	mov    0xe88,%eax
 963:	83 c4 10             	add    $0x10,%esp
}
 966:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 969:	c9                   	leave  
 96a:	c3                   	ret    
    return 0;
 96b:	b8 00 00 00 00       	mov    $0x0,%eax
 970:	eb f4                	jmp    966 <morecore+0x44>

00000972 <malloc>:

void*
malloc(uint nbytes)
{
 972:	55                   	push   %ebp
 973:	89 e5                	mov    %esp,%ebp
 975:	53                   	push   %ebx
 976:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 979:	8b 45 08             	mov    0x8(%ebp),%eax
 97c:	8d 58 07             	lea    0x7(%eax),%ebx
 97f:	c1 eb 03             	shr    $0x3,%ebx
 982:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 985:	8b 0d 88 0e 00 00    	mov    0xe88,%ecx
 98b:	85 c9                	test   %ecx,%ecx
 98d:	74 04                	je     993 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98f:	8b 01                	mov    (%ecx),%eax
 991:	eb 4a                	jmp    9dd <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 993:	c7 05 88 0e 00 00 8c 	movl   $0xe8c,0xe88
 99a:	0e 00 00 
 99d:	c7 05 8c 0e 00 00 8c 	movl   $0xe8c,0xe8c
 9a4:	0e 00 00 
    base.s.size = 0;
 9a7:	c7 05 90 0e 00 00 00 	movl   $0x0,0xe90
 9ae:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9b1:	b9 8c 0e 00 00       	mov    $0xe8c,%ecx
 9b6:	eb d7                	jmp    98f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9b8:	74 19                	je     9d3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9ba:	29 da                	sub    %ebx,%edx
 9bc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9bf:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9c2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9c5:	89 0d 88 0e 00 00    	mov    %ecx,0xe88
      return (void*)(p + 1);
 9cb:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9d1:	c9                   	leave  
 9d2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9d3:	8b 10                	mov    (%eax),%edx
 9d5:	89 11                	mov    %edx,(%ecx)
 9d7:	eb ec                	jmp    9c5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d9:	89 c1                	mov    %eax,%ecx
 9db:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9dd:	8b 50 04             	mov    0x4(%eax),%edx
 9e0:	39 da                	cmp    %ebx,%edx
 9e2:	73 d4                	jae    9b8 <malloc+0x46>
    if(p == freep)
 9e4:	39 05 88 0e 00 00    	cmp    %eax,0xe88
 9ea:	75 ed                	jne    9d9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9ec:	89 d8                	mov    %ebx,%eax
 9ee:	e8 2f ff ff ff       	call   922 <morecore>
 9f3:	85 c0                	test   %eax,%eax
 9f5:	75 e2                	jne    9d9 <malloc+0x67>
 9f7:	eb d5                	jmp    9ce <malloc+0x5c>
