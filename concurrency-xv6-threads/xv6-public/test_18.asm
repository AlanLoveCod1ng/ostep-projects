
_test_18:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:

   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1,void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
    int j;
    lock_acquire(&lock);
   6:	68 b4 0d 00 00       	push   $0xdb4
   b:	e8 dc 04 00 00       	call   4ec <lock_acquire>
    for(j=0;j<50;j++);
  10:	83 c4 10             	add    $0x10,%esp
  13:	b8 00 00 00 00       	mov    $0x0,%eax
  18:	eb 03                	jmp    1d <worker2+0x1d>
  1a:	83 c0 01             	add    $0x1,%eax
  1d:	83 f8 31             	cmp    $0x31,%eax
  20:	7e f8                	jle    1a <worker2+0x1a>
    global++;
  22:	83 05 b8 0d 00 00 01 	addl   $0x1,0xdb8
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 b4 0d 00 00       	push   $0xdb4
  31:	e8 d0 04 00 00       	call   506 <lock_release>
    exit();
  36:	e8 e6 04 00 00       	call   521 <exit>

0000003b <worker>:
    
}
void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %ebx
  3f:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
  42:	68 b4 0d 00 00       	push   $0xdb4
  47:	e8 a0 04 00 00       	call   4ec <lock_acquire>
    int j;
    for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb 03                	jmp    59 <worker+0x1e>
  56:	83 c0 01             	add    $0x1,%eax
  59:	83 f8 31             	cmp    $0x31,%eax
  5c:	7e f8                	jle    56 <worker+0x1b>
    global++;
  5e:	83 05 b8 0d 00 00 01 	addl   $0x1,0xdb8
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 b4 0d 00 00       	push   $0xdb4
  6d:	e8 94 04 00 00       	call   506 <lock_release>

    int nested_thread_pid = thread_create(worker2, 0, 0);
  72:	83 c4 0c             	add    $0xc,%esp
  75:	6a 00                	push   $0x0
  77:	6a 00                	push   $0x0
  79:	68 00 00 00 00       	push   $0x0
  7e:	e8 fd 03 00 00       	call   480 <thread_create>
  83:	89 c3                	mov    %eax,%ebx
    assert(nested_thread_pid > 0);
  85:	83 c4 10             	add    $0x10,%esp
  88:	85 c0                	test   %eax,%eax
  8a:	7e 5e                	jle    ea <worker+0xaf>
    int nested_join_pid = thread_join();
  8c:	e8 24 04 00 00       	call   4b5 <thread_join>
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
  a3:	68 24 09 00 00       	push   $0x924
  a8:	68 2e 09 00 00       	push   $0x92e
  ad:	6a 01                	push   $0x1
  af:	e8 c2 05 00 00       	call   676 <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 a8 09 00 00       	push   $0x9a8
  bc:	68 4c 09 00 00       	push   $0x94c
  c1:	6a 01                	push   $0x1
  c3:	e8 ae 05 00 00       	call   676 <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 60 09 00 00       	push   $0x960
  d0:	6a 01                	push   $0x1
  d2:	e8 9f 05 00 00       	call   676 <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 bc 0d 00 00    	push   0xdbc
  e0:	e8 6c 04 00 00       	call   551 <kill>
  e5:	e8 37 04 00 00       	call   521 <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 24 09 00 00       	push   $0x924
  f1:	68 2e 09 00 00       	push   $0x92e
  f6:	6a 01                	push   $0x1
  f8:	e8 79 05 00 00       	call   676 <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 36 09 00 00       	push   $0x936
 105:	68 4c 09 00 00       	push   $0x94c
 10a:	6a 01                	push   $0x1
 10c:	e8 65 05 00 00       	call   676 <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 60 09 00 00       	push   $0x960
 119:	6a 01                	push   $0x1
 11b:	e8 56 05 00 00       	call   676 <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 bc 0d 00 00    	push   0xdbc
 129:	e8 23 04 00 00       	call   551 <kill>
 12e:	e8 ee 03 00 00       	call   521 <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 24 09 00 00       	push   $0x924
 13a:	68 2e 09 00 00       	push   $0x92e
 13f:	6a 01                	push   $0x1
 141:	e8 30 05 00 00       	call   676 <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 6d 09 00 00       	push   $0x96d
 14e:	68 4c 09 00 00       	push   $0x94c
 153:	6a 01                	push   $0x1
 155:	e8 1c 05 00 00       	call   676 <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 60 09 00 00       	push   $0x960
 162:	6a 01                	push   $0x1
 164:	e8 0d 05 00 00       	call   676 <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 bc 0d 00 00    	push   0xdbc
 172:	e8 da 03 00 00       	call   551 <kill>
 177:	e8 a5 03 00 00       	call   521 <exit>

   exit();
 17c:	e8 a0 03 00 00       	call   521 <exit>

00000181 <main>:
{
 181:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 185:	83 e4 f0             	and    $0xfffffff0,%esp
 188:	ff 71 fc             	push   -0x4(%ecx)
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	53                   	push   %ebx
 18f:	51                   	push   %ecx
   ppid = getpid();
 190:	e8 0c 04 00 00       	call   5a1 <getpid>
 195:	a3 bc 0d 00 00       	mov    %eax,0xdbc
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 b4 0d 00 00       	push   $0xdb4
 1a2:	e8 32 03 00 00       	call   4d9 <lock_init>
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	39 1d b0 0d 00 00    	cmp    %ebx,0xdb0
 1ba:	7e 61                	jle    21d <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
 1bc:	83 ec 04             	sub    $0x4,%esp
 1bf:	6a 00                	push   $0x0
 1c1:	6a 00                	push   $0x0
 1c3:	68 3b 00 00 00       	push   $0x3b
 1c8:	e8 b3 02 00 00       	call   480 <thread_create>
      assert(thread_pid > 0);
 1cd:	83 c4 10             	add    $0x10,%esp
 1d0:	85 c0                	test   %eax,%eax
 1d2:	7f dd                	jg     1b1 <main+0x30>
 1d4:	6a 26                	push   $0x26
 1d6:	68 24 09 00 00       	push   $0x924
 1db:	68 2e 09 00 00       	push   $0x92e
 1e0:	6a 01                	push   $0x1
 1e2:	e8 8f 04 00 00       	call   676 <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 3d 09 00 00       	push   $0x93d
 1ef:	68 4c 09 00 00       	push   $0x94c
 1f4:	6a 01                	push   $0x1
 1f6:	e8 7b 04 00 00       	call   676 <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 60 09 00 00       	push   $0x960
 203:	6a 01                	push   $0x1
 205:	e8 6c 04 00 00       	call   676 <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 bc 0d 00 00    	push   0xdbc
 213:	e8 39 03 00 00       	call   551 <kill>
 218:	e8 04 03 00 00       	call   521 <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 b0 0d 00 00       	mov    0xdb0,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 85 02 00 00       	call   4b5 <thread_join>
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
 23b:	68 24 09 00 00       	push   $0x924
 240:	68 2e 09 00 00       	push   $0x92e
 245:	6a 01                	push   $0x1
 247:	e8 2a 04 00 00       	call   676 <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 74 09 00 00       	push   $0x974
 254:	68 4c 09 00 00       	push   $0x94c
 259:	6a 01                	push   $0x1
 25b:	e8 16 04 00 00       	call   676 <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 60 09 00 00       	push   $0x960
 268:	6a 01                	push   $0x1
 26a:	e8 07 04 00 00       	call   676 <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 bc 0d 00 00    	push   0xdbc
 278:	e8 d4 02 00 00       	call   551 <kill>
 27d:	e8 9f 02 00 00       	call   521 <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 b8 0d 00 00    	cmp    0xdb8,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 24 09 00 00       	push   $0x924
 293:	68 2e 09 00 00       	push   $0x92e
 298:	6a 01                	push   $0x1
 29a:	e8 d7 03 00 00       	call   676 <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 81 09 00 00       	push   $0x981
 2a7:	68 4c 09 00 00       	push   $0x94c
 2ac:	6a 01                	push   $0x1
 2ae:	e8 c3 03 00 00       	call   676 <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 60 09 00 00       	push   $0x960
 2bb:	6a 01                	push   $0x1
 2bd:	e8 b4 03 00 00       	call   676 <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 bc 0d 00 00    	push   0xdbc
 2cb:	e8 81 02 00 00       	call   551 <kill>
 2d0:	e8 4c 02 00 00       	call   521 <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 9b 09 00 00       	push   $0x99b
 2dd:	6a 01                	push   $0x1
 2df:	e8 92 03 00 00       	call   676 <printf>
   exit();
 2e4:	e8 38 02 00 00       	call   521 <exit>

000002e9 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	56                   	push   %esi
 2ed:	53                   	push   %ebx
 2ee:	8b 75 08             	mov    0x8(%ebp),%esi
 2f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2f4:	89 f0                	mov    %esi,%eax
 2f6:	89 d1                	mov    %edx,%ecx
 2f8:	83 c2 01             	add    $0x1,%edx
 2fb:	89 c3                	mov    %eax,%ebx
 2fd:	83 c0 01             	add    $0x1,%eax
 300:	0f b6 09             	movzbl (%ecx),%ecx
 303:	88 0b                	mov    %cl,(%ebx)
 305:	84 c9                	test   %cl,%cl
 307:	75 ed                	jne    2f6 <strcpy+0xd>
    ;
  return os;
}
 309:	89 f0                	mov    %esi,%eax
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    

0000030f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	8b 4d 08             	mov    0x8(%ebp),%ecx
 315:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 318:	eb 06                	jmp    320 <strcmp+0x11>
    p++, q++;
 31a:	83 c1 01             	add    $0x1,%ecx
 31d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 320:	0f b6 01             	movzbl (%ecx),%eax
 323:	84 c0                	test   %al,%al
 325:	74 04                	je     32b <strcmp+0x1c>
 327:	3a 02                	cmp    (%edx),%al
 329:	74 ef                	je     31a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 32b:	0f b6 c0             	movzbl %al,%eax
 32e:	0f b6 12             	movzbl (%edx),%edx
 331:	29 d0                	sub    %edx,%eax
}
 333:	5d                   	pop    %ebp
 334:	c3                   	ret    

00000335 <strlen>:

uint
strlen(const char *s)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 33b:	b8 00 00 00 00       	mov    $0x0,%eax
 340:	eb 03                	jmp    345 <strlen+0x10>
 342:	83 c0 01             	add    $0x1,%eax
 345:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 349:	75 f7                	jne    342 <strlen+0xd>
    ;
  return n;
}
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    

0000034d <memset>:

void*
memset(void *dst, int c, uint n)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	57                   	push   %edi
 351:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 354:	89 d7                	mov    %edx,%edi
 356:	8b 4d 10             	mov    0x10(%ebp),%ecx
 359:	8b 45 0c             	mov    0xc(%ebp),%eax
 35c:	fc                   	cld    
 35d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 35f:	89 d0                	mov    %edx,%eax
 361:	8b 7d fc             	mov    -0x4(%ebp),%edi
 364:	c9                   	leave  
 365:	c3                   	ret    

00000366 <strchr>:

char*
strchr(const char *s, char c)
{
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
 369:	8b 45 08             	mov    0x8(%ebp),%eax
 36c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 370:	eb 03                	jmp    375 <strchr+0xf>
 372:	83 c0 01             	add    $0x1,%eax
 375:	0f b6 10             	movzbl (%eax),%edx
 378:	84 d2                	test   %dl,%dl
 37a:	74 06                	je     382 <strchr+0x1c>
    if(*s == c)
 37c:	38 ca                	cmp    %cl,%dl
 37e:	75 f2                	jne    372 <strchr+0xc>
 380:	eb 05                	jmp    387 <strchr+0x21>
      return (char*)s;
  return 0;
 382:	b8 00 00 00 00       	mov    $0x0,%eax
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <gets>:

char*
gets(char *buf, int max)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	57                   	push   %edi
 38d:	56                   	push   %esi
 38e:	53                   	push   %ebx
 38f:	83 ec 1c             	sub    $0x1c,%esp
 392:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 395:	bb 00 00 00 00       	mov    $0x0,%ebx
 39a:	89 de                	mov    %ebx,%esi
 39c:	83 c3 01             	add    $0x1,%ebx
 39f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3a2:	7d 2e                	jge    3d2 <gets+0x49>
    cc = read(0, &c, 1);
 3a4:	83 ec 04             	sub    $0x4,%esp
 3a7:	6a 01                	push   $0x1
 3a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3ac:	50                   	push   %eax
 3ad:	6a 00                	push   $0x0
 3af:	e8 85 01 00 00       	call   539 <read>
    if(cc < 1)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	85 c0                	test   %eax,%eax
 3b9:	7e 17                	jle    3d2 <gets+0x49>
      break;
    buf[i++] = c;
 3bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3c2:	3c 0a                	cmp    $0xa,%al
 3c4:	0f 94 c2             	sete   %dl
 3c7:	3c 0d                	cmp    $0xd,%al
 3c9:	0f 94 c0             	sete   %al
 3cc:	08 c2                	or     %al,%dl
 3ce:	74 ca                	je     39a <gets+0x11>
    buf[i++] = c;
 3d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d6:	89 f8                	mov    %edi,%eax
 3d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5f                   	pop    %edi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e5:	83 ec 08             	sub    $0x8,%esp
 3e8:	6a 00                	push   $0x0
 3ea:	ff 75 08             	push   0x8(%ebp)
 3ed:	e8 6f 01 00 00       	call   561 <open>
  if(fd < 0)
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	85 c0                	test   %eax,%eax
 3f7:	78 24                	js     41d <stat+0x3d>
 3f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3fb:	83 ec 08             	sub    $0x8,%esp
 3fe:	ff 75 0c             	push   0xc(%ebp)
 401:	50                   	push   %eax
 402:	e8 72 01 00 00       	call   579 <fstat>
 407:	89 c6                	mov    %eax,%esi
  close(fd);
 409:	89 1c 24             	mov    %ebx,(%esp)
 40c:	e8 38 01 00 00       	call   549 <close>
  return r;
 411:	83 c4 10             	add    $0x10,%esp
}
 414:	89 f0                	mov    %esi,%eax
 416:	8d 65 f8             	lea    -0x8(%ebp),%esp
 419:	5b                   	pop    %ebx
 41a:	5e                   	pop    %esi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
    return -1;
 41d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 422:	eb f0                	jmp    414 <stat+0x34>

00000424 <atoi>:

int
atoi(const char *s)
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	53                   	push   %ebx
 428:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 42b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 430:	eb 10                	jmp    442 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 432:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 435:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 438:	83 c1 01             	add    $0x1,%ecx
 43b:	0f be c0             	movsbl %al,%eax
 43e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 442:	0f b6 01             	movzbl (%ecx),%eax
 445:	8d 58 d0             	lea    -0x30(%eax),%ebx
 448:	80 fb 09             	cmp    $0x9,%bl
 44b:	76 e5                	jbe    432 <atoi+0xe>
  return n;
}
 44d:	89 d0                	mov    %edx,%eax
 44f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 452:	c9                   	leave  
 453:	c3                   	ret    

00000454 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	56                   	push   %esi
 458:	53                   	push   %ebx
 459:	8b 75 08             	mov    0x8(%ebp),%esi
 45c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 45f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 462:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 464:	eb 0d                	jmp    473 <memmove+0x1f>
    *dst++ = *src++;
 466:	0f b6 01             	movzbl (%ecx),%eax
 469:	88 02                	mov    %al,(%edx)
 46b:	8d 49 01             	lea    0x1(%ecx),%ecx
 46e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 471:	89 d8                	mov    %ebx,%eax
 473:	8d 58 ff             	lea    -0x1(%eax),%ebx
 476:	85 c0                	test   %eax,%eax
 478:	7f ec                	jg     466 <memmove+0x12>
  return vdst;
}
 47a:	89 f0                	mov    %esi,%eax
 47c:	5b                   	pop    %ebx
 47d:	5e                   	pop    %esi
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    

00000480 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 486:	68 00 20 00 00       	push   $0x2000
 48b:	e8 0c 04 00 00       	call   89c <malloc>
  if((uint)(stack) % PGSIZE != 0){
 490:	83 c4 10             	add    $0x10,%esp
 493:	a9 ff 0f 00 00       	test   $0xfff,%eax
 498:	74 0a                	je     4a4 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 49a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 49f:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 4a4:	50                   	push   %eax
 4a5:	ff 75 10             	push   0x10(%ebp)
 4a8:	ff 75 0c             	push   0xc(%ebp)
 4ab:	ff 75 08             	push   0x8(%ebp)
 4ae:	e8 0e 01 00 00       	call   5c1 <clone>
  return pid;
}
 4b3:	c9                   	leave  
 4b4:	c3                   	ret    

000004b5 <thread_join>:
int
thread_join()
{
 4b5:	55                   	push   %ebp
 4b6:	89 e5                	mov    %esp,%ebp
 4b8:	53                   	push   %ebx
 4b9:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 4bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4bf:	50                   	push   %eax
 4c0:	e8 04 01 00 00       	call   5c9 <join>
 4c5:	89 c3                	mov    %eax,%ebx
  free(stack);
 4c7:	83 c4 04             	add    $0x4,%esp
 4ca:	ff 75 f4             	push   -0xc(%ebp)
 4cd:	e8 0a 03 00 00       	call   7dc <free>
  return pid;
}
 4d2:	89 d8                	mov    %ebx,%eax
 4d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d7:	c9                   	leave  
 4d8:	c3                   	ret    

000004d9 <lock_init>:
int
lock_init(lock_t * lock){
 4d9:	55                   	push   %ebp
 4da:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4dc:	8b 45 08             	mov    0x8(%ebp),%eax
 4df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 4e5:	b8 00 00 00 00       	mov    $0x0,%eax
 4ea:	5d                   	pop    %ebp
 4eb:	c3                   	ret    

000004ec <lock_acquire>:
int
lock_acquire(lock_t * lock){
 4ec:	55                   	push   %ebp
 4ed:	89 e5                	mov    %esp,%ebp
 4ef:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4f2:	b8 01 00 00 00       	mov    $0x1,%eax
 4f7:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 4fa:	83 f8 01             	cmp    $0x1,%eax
 4fd:	74 f3                	je     4f2 <lock_acquire+0x6>
  {

  }
  return 0;
}
 4ff:	b8 00 00 00 00       	mov    $0x0,%eax
 504:	5d                   	pop    %ebp
 505:	c3                   	ret    

00000506 <lock_release>:
int
lock_release(lock_t * lock){
 506:	55                   	push   %ebp
 507:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 509:	8b 45 08             	mov    0x8(%ebp),%eax
 50c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 512:	b8 00 00 00 00       	mov    $0x0,%eax
 517:	5d                   	pop    %ebp
 518:	c3                   	ret    

00000519 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 519:	b8 01 00 00 00       	mov    $0x1,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <exit>:
SYSCALL(exit)
 521:	b8 02 00 00 00       	mov    $0x2,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <wait>:
SYSCALL(wait)
 529:	b8 03 00 00 00       	mov    $0x3,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <pipe>:
SYSCALL(pipe)
 531:	b8 04 00 00 00       	mov    $0x4,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <read>:
SYSCALL(read)
 539:	b8 05 00 00 00       	mov    $0x5,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <write>:
SYSCALL(write)
 541:	b8 10 00 00 00       	mov    $0x10,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    

00000549 <close>:
SYSCALL(close)
 549:	b8 15 00 00 00       	mov    $0x15,%eax
 54e:	cd 40                	int    $0x40
 550:	c3                   	ret    

00000551 <kill>:
SYSCALL(kill)
 551:	b8 06 00 00 00       	mov    $0x6,%eax
 556:	cd 40                	int    $0x40
 558:	c3                   	ret    

00000559 <exec>:
SYSCALL(exec)
 559:	b8 07 00 00 00       	mov    $0x7,%eax
 55e:	cd 40                	int    $0x40
 560:	c3                   	ret    

00000561 <open>:
SYSCALL(open)
 561:	b8 0f 00 00 00       	mov    $0xf,%eax
 566:	cd 40                	int    $0x40
 568:	c3                   	ret    

00000569 <mknod>:
SYSCALL(mknod)
 569:	b8 11 00 00 00       	mov    $0x11,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <unlink>:
SYSCALL(unlink)
 571:	b8 12 00 00 00       	mov    $0x12,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <fstat>:
SYSCALL(fstat)
 579:	b8 08 00 00 00       	mov    $0x8,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <link>:
SYSCALL(link)
 581:	b8 13 00 00 00       	mov    $0x13,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <mkdir>:
SYSCALL(mkdir)
 589:	b8 14 00 00 00       	mov    $0x14,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <chdir>:
SYSCALL(chdir)
 591:	b8 09 00 00 00       	mov    $0x9,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <dup>:
SYSCALL(dup)
 599:	b8 0a 00 00 00       	mov    $0xa,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <getpid>:
SYSCALL(getpid)
 5a1:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <sbrk>:
SYSCALL(sbrk)
 5a9:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <sleep>:
SYSCALL(sleep)
 5b1:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <uptime>:
SYSCALL(uptime)
 5b9:	b8 0e 00 00 00       	mov    $0xe,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <clone>:
SYSCALL(clone)
 5c1:	b8 16 00 00 00       	mov    $0x16,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <join>:
SYSCALL(join)
 5c9:	b8 17 00 00 00       	mov    $0x17,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5d1:	55                   	push   %ebp
 5d2:	89 e5                	mov    %esp,%ebp
 5d4:	83 ec 1c             	sub    $0x1c,%esp
 5d7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5da:	6a 01                	push   $0x1
 5dc:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5df:	52                   	push   %edx
 5e0:	50                   	push   %eax
 5e1:	e8 5b ff ff ff       	call   541 <write>
}
 5e6:	83 c4 10             	add    $0x10,%esp
 5e9:	c9                   	leave  
 5ea:	c3                   	ret    

000005eb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5eb:	55                   	push   %ebp
 5ec:	89 e5                	mov    %esp,%ebp
 5ee:	57                   	push   %edi
 5ef:	56                   	push   %esi
 5f0:	53                   	push   %ebx
 5f1:	83 ec 2c             	sub    $0x2c,%esp
 5f4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f7:	89 d0                	mov    %edx,%eax
 5f9:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5fb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5ff:	0f 95 c1             	setne  %cl
 602:	c1 ea 1f             	shr    $0x1f,%edx
 605:	84 d1                	test   %dl,%cl
 607:	74 44                	je     64d <printint+0x62>
    neg = 1;
    x = -xx;
 609:	f7 d8                	neg    %eax
 60b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 60d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 614:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 619:	89 c8                	mov    %ecx,%eax
 61b:	ba 00 00 00 00       	mov    $0x0,%edx
 620:	f7 f6                	div    %esi
 622:	89 df                	mov    %ebx,%edi
 624:	83 c3 01             	add    $0x1,%ebx
 627:	0f b6 92 2c 0a 00 00 	movzbl 0xa2c(%edx),%edx
 62e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 632:	89 ca                	mov    %ecx,%edx
 634:	89 c1                	mov    %eax,%ecx
 636:	39 d6                	cmp    %edx,%esi
 638:	76 df                	jbe    619 <printint+0x2e>
  if(neg)
 63a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 63e:	74 31                	je     671 <printint+0x86>
    buf[i++] = '-';
 640:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 645:	8d 5f 02             	lea    0x2(%edi),%ebx
 648:	8b 75 d0             	mov    -0x30(%ebp),%esi
 64b:	eb 17                	jmp    664 <printint+0x79>
    x = xx;
 64d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 64f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 656:	eb bc                	jmp    614 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 658:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 65d:	89 f0                	mov    %esi,%eax
 65f:	e8 6d ff ff ff       	call   5d1 <putc>
  while(--i >= 0)
 664:	83 eb 01             	sub    $0x1,%ebx
 667:	79 ef                	jns    658 <printint+0x6d>
}
 669:	83 c4 2c             	add    $0x2c,%esp
 66c:	5b                   	pop    %ebx
 66d:	5e                   	pop    %esi
 66e:	5f                   	pop    %edi
 66f:	5d                   	pop    %ebp
 670:	c3                   	ret    
 671:	8b 75 d0             	mov    -0x30(%ebp),%esi
 674:	eb ee                	jmp    664 <printint+0x79>

00000676 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 676:	55                   	push   %ebp
 677:	89 e5                	mov    %esp,%ebp
 679:	57                   	push   %edi
 67a:	56                   	push   %esi
 67b:	53                   	push   %ebx
 67c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 67f:	8d 45 10             	lea    0x10(%ebp),%eax
 682:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 685:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 68a:	bb 00 00 00 00       	mov    $0x0,%ebx
 68f:	eb 14                	jmp    6a5 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 691:	89 fa                	mov    %edi,%edx
 693:	8b 45 08             	mov    0x8(%ebp),%eax
 696:	e8 36 ff ff ff       	call   5d1 <putc>
 69b:	eb 05                	jmp    6a2 <printf+0x2c>
      }
    } else if(state == '%'){
 69d:	83 fe 25             	cmp    $0x25,%esi
 6a0:	74 25                	je     6c7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6a2:	83 c3 01             	add    $0x1,%ebx
 6a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6ac:	84 c0                	test   %al,%al
 6ae:	0f 84 20 01 00 00    	je     7d4 <printf+0x15e>
    c = fmt[i] & 0xff;
 6b4:	0f be f8             	movsbl %al,%edi
 6b7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ba:	85 f6                	test   %esi,%esi
 6bc:	75 df                	jne    69d <printf+0x27>
      if(c == '%'){
 6be:	83 f8 25             	cmp    $0x25,%eax
 6c1:	75 ce                	jne    691 <printf+0x1b>
        state = '%';
 6c3:	89 c6                	mov    %eax,%esi
 6c5:	eb db                	jmp    6a2 <printf+0x2c>
      if(c == 'd'){
 6c7:	83 f8 25             	cmp    $0x25,%eax
 6ca:	0f 84 cf 00 00 00    	je     79f <printf+0x129>
 6d0:	0f 8c dd 00 00 00    	jl     7b3 <printf+0x13d>
 6d6:	83 f8 78             	cmp    $0x78,%eax
 6d9:	0f 8f d4 00 00 00    	jg     7b3 <printf+0x13d>
 6df:	83 f8 63             	cmp    $0x63,%eax
 6e2:	0f 8c cb 00 00 00    	jl     7b3 <printf+0x13d>
 6e8:	83 e8 63             	sub    $0x63,%eax
 6eb:	83 f8 15             	cmp    $0x15,%eax
 6ee:	0f 87 bf 00 00 00    	ja     7b3 <printf+0x13d>
 6f4:	ff 24 85 d4 09 00 00 	jmp    *0x9d4(,%eax,4)
        printint(fd, *ap, 10, 1);
 6fb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6fe:	8b 17                	mov    (%edi),%edx
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	6a 01                	push   $0x1
 705:	b9 0a 00 00 00       	mov    $0xa,%ecx
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	e8 d9 fe ff ff       	call   5eb <printint>
        ap++;
 712:	83 c7 04             	add    $0x4,%edi
 715:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 718:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 71b:	be 00 00 00 00       	mov    $0x0,%esi
 720:	eb 80                	jmp    6a2 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 722:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 725:	8b 17                	mov    (%edi),%edx
 727:	83 ec 0c             	sub    $0xc,%esp
 72a:	6a 00                	push   $0x0
 72c:	b9 10 00 00 00       	mov    $0x10,%ecx
 731:	8b 45 08             	mov    0x8(%ebp),%eax
 734:	e8 b2 fe ff ff       	call   5eb <printint>
        ap++;
 739:	83 c7 04             	add    $0x4,%edi
 73c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 73f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 742:	be 00 00 00 00       	mov    $0x0,%esi
 747:	e9 56 ff ff ff       	jmp    6a2 <printf+0x2c>
        s = (char*)*ap;
 74c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 74f:	8b 30                	mov    (%eax),%esi
        ap++;
 751:	83 c0 04             	add    $0x4,%eax
 754:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 757:	85 f6                	test   %esi,%esi
 759:	75 15                	jne    770 <printf+0xfa>
          s = "(null)";
 75b:	be cb 09 00 00       	mov    $0x9cb,%esi
 760:	eb 0e                	jmp    770 <printf+0xfa>
          putc(fd, *s);
 762:	0f be d2             	movsbl %dl,%edx
 765:	8b 45 08             	mov    0x8(%ebp),%eax
 768:	e8 64 fe ff ff       	call   5d1 <putc>
          s++;
 76d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 770:	0f b6 16             	movzbl (%esi),%edx
 773:	84 d2                	test   %dl,%dl
 775:	75 eb                	jne    762 <printf+0xec>
      state = 0;
 777:	be 00 00 00 00       	mov    $0x0,%esi
 77c:	e9 21 ff ff ff       	jmp    6a2 <printf+0x2c>
        putc(fd, *ap);
 781:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 784:	0f be 17             	movsbl (%edi),%edx
 787:	8b 45 08             	mov    0x8(%ebp),%eax
 78a:	e8 42 fe ff ff       	call   5d1 <putc>
        ap++;
 78f:	83 c7 04             	add    $0x4,%edi
 792:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 795:	be 00 00 00 00       	mov    $0x0,%esi
 79a:	e9 03 ff ff ff       	jmp    6a2 <printf+0x2c>
        putc(fd, c);
 79f:	89 fa                	mov    %edi,%edx
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	e8 28 fe ff ff       	call   5d1 <putc>
      state = 0;
 7a9:	be 00 00 00 00       	mov    $0x0,%esi
 7ae:	e9 ef fe ff ff       	jmp    6a2 <printf+0x2c>
        putc(fd, '%');
 7b3:	ba 25 00 00 00       	mov    $0x25,%edx
 7b8:	8b 45 08             	mov    0x8(%ebp),%eax
 7bb:	e8 11 fe ff ff       	call   5d1 <putc>
        putc(fd, c);
 7c0:	89 fa                	mov    %edi,%edx
 7c2:	8b 45 08             	mov    0x8(%ebp),%eax
 7c5:	e8 07 fe ff ff       	call   5d1 <putc>
      state = 0;
 7ca:	be 00 00 00 00       	mov    $0x0,%esi
 7cf:	e9 ce fe ff ff       	jmp    6a2 <printf+0x2c>
    }
  }
}
 7d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7d7:	5b                   	pop    %ebx
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret    

000007dc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7dc:	55                   	push   %ebp
 7dd:	89 e5                	mov    %esp,%ebp
 7df:	57                   	push   %edi
 7e0:	56                   	push   %esi
 7e1:	53                   	push   %ebx
 7e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7e5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e8:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 7ed:	eb 02                	jmp    7f1 <free+0x15>
 7ef:	89 d0                	mov    %edx,%eax
 7f1:	39 c8                	cmp    %ecx,%eax
 7f3:	73 04                	jae    7f9 <free+0x1d>
 7f5:	39 08                	cmp    %ecx,(%eax)
 7f7:	77 12                	ja     80b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f9:	8b 10                	mov    (%eax),%edx
 7fb:	39 c2                	cmp    %eax,%edx
 7fd:	77 f0                	ja     7ef <free+0x13>
 7ff:	39 c8                	cmp    %ecx,%eax
 801:	72 08                	jb     80b <free+0x2f>
 803:	39 ca                	cmp    %ecx,%edx
 805:	77 04                	ja     80b <free+0x2f>
 807:	89 d0                	mov    %edx,%eax
 809:	eb e6                	jmp    7f1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 80b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 80e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 811:	8b 10                	mov    (%eax),%edx
 813:	39 d7                	cmp    %edx,%edi
 815:	74 19                	je     830 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 817:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 81a:	8b 50 04             	mov    0x4(%eax),%edx
 81d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 820:	39 ce                	cmp    %ecx,%esi
 822:	74 1b                	je     83f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 824:	89 08                	mov    %ecx,(%eax)
  freep = p;
 826:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 830:	03 72 04             	add    0x4(%edx),%esi
 833:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 836:	8b 10                	mov    (%eax),%edx
 838:	8b 12                	mov    (%edx),%edx
 83a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 83d:	eb db                	jmp    81a <free+0x3e>
    p->s.size += bp->s.size;
 83f:	03 53 fc             	add    -0x4(%ebx),%edx
 842:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 845:	8b 53 f8             	mov    -0x8(%ebx),%edx
 848:	89 10                	mov    %edx,(%eax)
 84a:	eb da                	jmp    826 <free+0x4a>

0000084c <morecore>:

static Header*
morecore(uint nu)
{
 84c:	55                   	push   %ebp
 84d:	89 e5                	mov    %esp,%ebp
 84f:	53                   	push   %ebx
 850:	83 ec 04             	sub    $0x4,%esp
 853:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 855:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 85a:	77 05                	ja     861 <morecore+0x15>
    nu = 4096;
 85c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 861:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 868:	83 ec 0c             	sub    $0xc,%esp
 86b:	50                   	push   %eax
 86c:	e8 38 fd ff ff       	call   5a9 <sbrk>
  if(p == (char*)-1)
 871:	83 c4 10             	add    $0x10,%esp
 874:	83 f8 ff             	cmp    $0xffffffff,%eax
 877:	74 1c                	je     895 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 879:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 87c:	83 c0 08             	add    $0x8,%eax
 87f:	83 ec 0c             	sub    $0xc,%esp
 882:	50                   	push   %eax
 883:	e8 54 ff ff ff       	call   7dc <free>
  return freep;
 888:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 88d:	83 c4 10             	add    $0x10,%esp
}
 890:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 893:	c9                   	leave  
 894:	c3                   	ret    
    return 0;
 895:	b8 00 00 00 00       	mov    $0x0,%eax
 89a:	eb f4                	jmp    890 <morecore+0x44>

0000089c <malloc>:

void*
malloc(uint nbytes)
{
 89c:	55                   	push   %ebp
 89d:	89 e5                	mov    %esp,%ebp
 89f:	53                   	push   %ebx
 8a0:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	8d 58 07             	lea    0x7(%eax),%ebx
 8a9:	c1 eb 03             	shr    $0x3,%ebx
 8ac:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8af:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 8b5:	85 c9                	test   %ecx,%ecx
 8b7:	74 04                	je     8bd <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b9:	8b 01                	mov    (%ecx),%eax
 8bb:	eb 4a                	jmp    907 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8bd:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 8c4:	0d 00 00 
 8c7:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 8ce:	0d 00 00 
    base.s.size = 0;
 8d1:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 8d8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8db:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
 8e0:	eb d7                	jmp    8b9 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8e2:	74 19                	je     8fd <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8e4:	29 da                	sub    %ebx,%edx
 8e6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8ec:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8ef:	89 0d c0 0d 00 00    	mov    %ecx,0xdc0
      return (void*)(p + 1);
 8f5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8fb:	c9                   	leave  
 8fc:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8fd:	8b 10                	mov    (%eax),%edx
 8ff:	89 11                	mov    %edx,(%ecx)
 901:	eb ec                	jmp    8ef <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 903:	89 c1                	mov    %eax,%ecx
 905:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 907:	8b 50 04             	mov    0x4(%eax),%edx
 90a:	39 da                	cmp    %ebx,%edx
 90c:	73 d4                	jae    8e2 <malloc+0x46>
    if(p == freep)
 90e:	39 05 c0 0d 00 00    	cmp    %eax,0xdc0
 914:	75 ed                	jne    903 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 916:	89 d8                	mov    %ebx,%eax
 918:	e8 2f ff ff ff       	call   84c <morecore>
 91d:	85 c0                	test   %eax,%eax
 91f:	75 e2                	jne    903 <malloc+0x67>
 921:	eb d5                	jmp    8f8 <malloc+0x5c>
