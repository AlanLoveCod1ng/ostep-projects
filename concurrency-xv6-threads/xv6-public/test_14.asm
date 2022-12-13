
_test_14:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
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
  11:	75 1d                	jne    30 <worker+0x30>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <worker+0x79>
   assert(global == 1);
  18:	a1 f8 0c 00 00       	mov    0xcf8,%eax
  1d:	83 f8 01             	cmp    $0x1,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 f8 0c 00 00       	mov    %eax,0xcf8
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(tmp1 == 42);
  30:	6a 2c                	push   $0x2c
  32:	68 98 08 00 00       	push   $0x898
  37:	68 a2 08 00 00       	push   $0x8a2
  3c:	6a 01                	push   $0x1
  3e:	e8 a6 05 00 00       	call   5e9 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 aa 08 00 00       	push   $0x8aa
  4b:	68 b5 08 00 00       	push   $0x8b5
  50:	6a 01                	push   $0x1
  52:	e8 92 05 00 00       	call   5e9 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 c9 08 00 00       	push   $0x8c9
  5f:	6a 01                	push   $0x1
  61:	e8 83 05 00 00       	call   5e9 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 fc 0c 00 00    	push   0xcfc
  6f:	e8 50 04 00 00       	call   4c4 <kill>
  74:	e8 1b 04 00 00       	call   494 <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 98 08 00 00       	push   $0x898
  80:	68 a2 08 00 00       	push   $0x8a2
  85:	6a 01                	push   $0x1
  87:	e8 5d 05 00 00       	call   5e9 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 d6 08 00 00       	push   $0x8d6
  94:	68 b5 08 00 00       	push   $0x8b5
  99:	6a 01                	push   $0x1
  9b:	e8 49 05 00 00       	call   5e9 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 c9 08 00 00       	push   $0x8c9
  a8:	6a 01                	push   $0x1
  aa:	e8 3a 05 00 00       	call   5e9 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 fc 0c 00 00    	push   0xcfc
  b8:	e8 07 04 00 00       	call   4c4 <kill>
  bd:	e8 d2 03 00 00       	call   494 <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 98 08 00 00       	push   $0x898
  c9:	68 a2 08 00 00       	push   $0x8a2
  ce:	6a 01                	push   $0x1
  d0:	e8 14 05 00 00       	call   5e9 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 e1 08 00 00       	push   $0x8e1
  dd:	68 b5 08 00 00       	push   $0x8b5
  e2:	6a 01                	push   $0x1
  e4:	e8 00 05 00 00       	call   5e9 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 c9 08 00 00       	push   $0x8c9
  f1:	6a 01                	push   $0x1
  f3:	e8 f1 04 00 00       	call   5e9 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 fc 0c 00 00    	push   0xcfc
 101:	e8 be 03 00 00       	call   4c4 <kill>
 106:	e8 89 03 00 00       	call   494 <exit>

0000010b <main>:
{
 10b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 10f:	83 e4 f0             	and    $0xfffffff0,%esp
 112:	ff 71 fc             	push   -0x4(%ecx)
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	53                   	push   %ebx
 119:	51                   	push   %ecx
 11a:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 11d:	e8 f2 03 00 00       	call   514 <getpid>
 122:	a3 fc 0c 00 00       	mov    %eax,0xcfc
   int arg1 = 42, arg2 = 24;
 127:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 12e:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 135:	83 ec 04             	sub    $0x4,%esp
 138:	8d 45 f0             	lea    -0x10(%ebp),%eax
 13b:	50                   	push   %eax
 13c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 13f:	50                   	push   %eax
 140:	68 00 00 00 00       	push   $0x0
 145:	e8 a9 02 00 00       	call   3f3 <thread_create>
   assert(thread_pid > 0);
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	85 c0                	test   %eax,%eax
 14f:	7e 65                	jle    1b6 <main+0xab>
 151:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 153:	e8 d0 02 00 00       	call   428 <thread_join>
   assert(join_pid == thread_pid);
 158:	39 c3                	cmp    %eax,%ebx
 15a:	0f 85 9f 00 00 00    	jne    1ff <main+0xf4>
   assert(global == 2);
 160:	83 3d f8 0c 00 00 02 	cmpl   $0x2,0xcf8
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 98 08 00 00       	push   $0x898
 174:	68 a2 08 00 00       	push   $0x8a2
 179:	6a 01                	push   $0x1
 17b:	e8 69 04 00 00       	call   5e9 <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 13 09 00 00       	push   $0x913
 188:	68 b5 08 00 00       	push   $0x8b5
 18d:	6a 01                	push   $0x1
 18f:	e8 55 04 00 00       	call   5e9 <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 c9 08 00 00       	push   $0x8c9
 19c:	6a 01                	push   $0x1
 19e:	e8 46 04 00 00       	call   5e9 <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 fc 0c 00 00    	push   0xcfc
 1ac:	e8 13 03 00 00       	call   4c4 <kill>
 1b1:	e8 de 02 00 00       	call   494 <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 98 08 00 00       	push   $0x898
 1bd:	68 a2 08 00 00       	push   $0x8a2
 1c2:	6a 01                	push   $0x1
 1c4:	e8 20 04 00 00       	call   5e9 <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 ed 08 00 00       	push   $0x8ed
 1d1:	68 b5 08 00 00       	push   $0x8b5
 1d6:	6a 01                	push   $0x1
 1d8:	e8 0c 04 00 00       	call   5e9 <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 c9 08 00 00       	push   $0x8c9
 1e5:	6a 01                	push   $0x1
 1e7:	e8 fd 03 00 00       	call   5e9 <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 fc 0c 00 00    	push   0xcfc
 1f5:	e8 ca 02 00 00       	call   4c4 <kill>
 1fa:	e8 95 02 00 00       	call   494 <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 98 08 00 00       	push   $0x898
 206:	68 a2 08 00 00       	push   $0x8a2
 20b:	6a 01                	push   $0x1
 20d:	e8 d7 03 00 00       	call   5e9 <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 fc 08 00 00       	push   $0x8fc
 21a:	68 b5 08 00 00       	push   $0x8b5
 21f:	6a 01                	push   $0x1
 221:	e8 c3 03 00 00       	call   5e9 <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 c9 08 00 00       	push   $0x8c9
 22e:	6a 01                	push   $0x1
 230:	e8 b4 03 00 00       	call   5e9 <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 fc 0c 00 00    	push   0xcfc
 23e:	e8 81 02 00 00       	call   4c4 <kill>
 243:	e8 4c 02 00 00       	call   494 <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 1f 09 00 00       	push   $0x91f
 250:	6a 01                	push   $0x1
 252:	e8 92 03 00 00       	call   5e9 <printf>
   exit();
 257:	e8 38 02 00 00       	call   494 <exit>

0000025c <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	56                   	push   %esi
 260:	53                   	push   %ebx
 261:	8b 75 08             	mov    0x8(%ebp),%esi
 264:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 267:	89 f0                	mov    %esi,%eax
 269:	89 d1                	mov    %edx,%ecx
 26b:	83 c2 01             	add    $0x1,%edx
 26e:	89 c3                	mov    %eax,%ebx
 270:	83 c0 01             	add    $0x1,%eax
 273:	0f b6 09             	movzbl (%ecx),%ecx
 276:	88 0b                	mov    %cl,(%ebx)
 278:	84 c9                	test   %cl,%cl
 27a:	75 ed                	jne    269 <strcpy+0xd>
    ;
  return os;
}
 27c:	89 f0                	mov    %esi,%eax
 27e:	5b                   	pop    %ebx
 27f:	5e                   	pop    %esi
 280:	5d                   	pop    %ebp
 281:	c3                   	ret    

00000282 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 282:	55                   	push   %ebp
 283:	89 e5                	mov    %esp,%ebp
 285:	8b 4d 08             	mov    0x8(%ebp),%ecx
 288:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 28b:	eb 06                	jmp    293 <strcmp+0x11>
    p++, q++;
 28d:	83 c1 01             	add    $0x1,%ecx
 290:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 293:	0f b6 01             	movzbl (%ecx),%eax
 296:	84 c0                	test   %al,%al
 298:	74 04                	je     29e <strcmp+0x1c>
 29a:	3a 02                	cmp    (%edx),%al
 29c:	74 ef                	je     28d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 29e:	0f b6 c0             	movzbl %al,%eax
 2a1:	0f b6 12             	movzbl (%edx),%edx
 2a4:	29 d0                	sub    %edx,%eax
}
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    

000002a8 <strlen>:

uint
strlen(const char *s)
{
 2a8:	55                   	push   %ebp
 2a9:	89 e5                	mov    %esp,%ebp
 2ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ae:	b8 00 00 00 00       	mov    $0x0,%eax
 2b3:	eb 03                	jmp    2b8 <strlen+0x10>
 2b5:	83 c0 01             	add    $0x1,%eax
 2b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2bc:	75 f7                	jne    2b5 <strlen+0xd>
    ;
  return n;
}
 2be:	5d                   	pop    %ebp
 2bf:	c3                   	ret    

000002c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2c7:	89 d7                	mov    %edx,%edi
 2c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cf:	fc                   	cld    
 2d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d2:	89 d0                	mov    %edx,%eax
 2d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <strchr>:

char*
strchr(const char *s, char c)
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2e3:	eb 03                	jmp    2e8 <strchr+0xf>
 2e5:	83 c0 01             	add    $0x1,%eax
 2e8:	0f b6 10             	movzbl (%eax),%edx
 2eb:	84 d2                	test   %dl,%dl
 2ed:	74 06                	je     2f5 <strchr+0x1c>
    if(*s == c)
 2ef:	38 ca                	cmp    %cl,%dl
 2f1:	75 f2                	jne    2e5 <strchr+0xc>
 2f3:	eb 05                	jmp    2fa <strchr+0x21>
      return (char*)s;
  return 0;
 2f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    

000002fc <gets>:

char*
gets(char *buf, int max)
{
 2fc:	55                   	push   %ebp
 2fd:	89 e5                	mov    %esp,%ebp
 2ff:	57                   	push   %edi
 300:	56                   	push   %esi
 301:	53                   	push   %ebx
 302:	83 ec 1c             	sub    $0x1c,%esp
 305:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 308:	bb 00 00 00 00       	mov    $0x0,%ebx
 30d:	89 de                	mov    %ebx,%esi
 30f:	83 c3 01             	add    $0x1,%ebx
 312:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 315:	7d 2e                	jge    345 <gets+0x49>
    cc = read(0, &c, 1);
 317:	83 ec 04             	sub    $0x4,%esp
 31a:	6a 01                	push   $0x1
 31c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 31f:	50                   	push   %eax
 320:	6a 00                	push   $0x0
 322:	e8 85 01 00 00       	call   4ac <read>
    if(cc < 1)
 327:	83 c4 10             	add    $0x10,%esp
 32a:	85 c0                	test   %eax,%eax
 32c:	7e 17                	jle    345 <gets+0x49>
      break;
    buf[i++] = c;
 32e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 332:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 335:	3c 0a                	cmp    $0xa,%al
 337:	0f 94 c2             	sete   %dl
 33a:	3c 0d                	cmp    $0xd,%al
 33c:	0f 94 c0             	sete   %al
 33f:	08 c2                	or     %al,%dl
 341:	74 ca                	je     30d <gets+0x11>
    buf[i++] = c;
 343:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 345:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 349:	89 f8                	mov    %edi,%eax
 34b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34e:	5b                   	pop    %ebx
 34f:	5e                   	pop    %esi
 350:	5f                   	pop    %edi
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    

00000353 <stat>:

int
stat(const char *n, struct stat *st)
{
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	56                   	push   %esi
 357:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 358:	83 ec 08             	sub    $0x8,%esp
 35b:	6a 00                	push   $0x0
 35d:	ff 75 08             	push   0x8(%ebp)
 360:	e8 6f 01 00 00       	call   4d4 <open>
  if(fd < 0)
 365:	83 c4 10             	add    $0x10,%esp
 368:	85 c0                	test   %eax,%eax
 36a:	78 24                	js     390 <stat+0x3d>
 36c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 36e:	83 ec 08             	sub    $0x8,%esp
 371:	ff 75 0c             	push   0xc(%ebp)
 374:	50                   	push   %eax
 375:	e8 72 01 00 00       	call   4ec <fstat>
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	89 1c 24             	mov    %ebx,(%esp)
 37f:	e8 38 01 00 00       	call   4bc <close>
  return r;
 384:	83 c4 10             	add    $0x10,%esp
}
 387:	89 f0                	mov    %esi,%eax
 389:	8d 65 f8             	lea    -0x8(%ebp),%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    
    return -1;
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb f0                	jmp    387 <stat+0x34>

00000397 <atoi>:

int
atoi(const char *s)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	53                   	push   %ebx
 39b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 39e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3a3:	eb 10                	jmp    3b5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ab:	83 c1 01             	add    $0x1,%ecx
 3ae:	0f be c0             	movsbl %al,%eax
 3b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3b5:	0f b6 01             	movzbl (%ecx),%eax
 3b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3bb:	80 fb 09             	cmp    $0x9,%bl
 3be:	76 e5                	jbe    3a5 <atoi+0xe>
  return n;
}
 3c0:	89 d0                	mov    %edx,%eax
 3c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c5:	c9                   	leave  
 3c6:	c3                   	ret    

000003c7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	56                   	push   %esi
 3cb:	53                   	push   %ebx
 3cc:	8b 75 08             	mov    0x8(%ebp),%esi
 3cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3d7:	eb 0d                	jmp    3e6 <memmove+0x1f>
    *dst++ = *src++;
 3d9:	0f b6 01             	movzbl (%ecx),%eax
 3dc:	88 02                	mov    %al,(%edx)
 3de:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3e4:	89 d8                	mov    %ebx,%eax
 3e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3e9:	85 c0                	test   %eax,%eax
 3eb:	7f ec                	jg     3d9 <memmove+0x12>
  return vdst;
}
 3ed:	89 f0                	mov    %esi,%eax
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    

000003f3 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 3f9:	68 00 20 00 00       	push   $0x2000
 3fe:	e8 0c 04 00 00       	call   80f <malloc>
  if((uint)(stack) % PGSIZE != 0){
 403:	83 c4 10             	add    $0x10,%esp
 406:	a9 ff 0f 00 00       	test   $0xfff,%eax
 40b:	74 0a                	je     417 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 40d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 412:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 417:	50                   	push   %eax
 418:	ff 75 10             	push   0x10(%ebp)
 41b:	ff 75 0c             	push   0xc(%ebp)
 41e:	ff 75 08             	push   0x8(%ebp)
 421:	e8 0e 01 00 00       	call   534 <clone>
  return pid;
}
 426:	c9                   	leave  
 427:	c3                   	ret    

00000428 <thread_join>:
int
thread_join()
{
 428:	55                   	push   %ebp
 429:	89 e5                	mov    %esp,%ebp
 42b:	53                   	push   %ebx
 42c:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 42f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 432:	50                   	push   %eax
 433:	e8 04 01 00 00       	call   53c <join>
 438:	89 c3                	mov    %eax,%ebx
  free(stack);
 43a:	83 c4 04             	add    $0x4,%esp
 43d:	ff 75 f4             	push   -0xc(%ebp)
 440:	e8 0a 03 00 00       	call   74f <free>
  return pid;
}
 445:	89 d8                	mov    %ebx,%eax
 447:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44a:	c9                   	leave  
 44b:	c3                   	ret    

0000044c <lock_init>:
int
lock_init(lock_t * lock){
 44c:	55                   	push   %ebp
 44d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 44f:	8b 45 08             	mov    0x8(%ebp),%eax
 452:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 458:	b8 00 00 00 00       	mov    $0x0,%eax
 45d:	5d                   	pop    %ebp
 45e:	c3                   	ret    

0000045f <lock_acquire>:
int
lock_acquire(lock_t * lock){
 45f:	55                   	push   %ebp
 460:	89 e5                	mov    %esp,%ebp
 462:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 465:	b8 01 00 00 00       	mov    $0x1,%eax
 46a:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 46d:	83 f8 01             	cmp    $0x1,%eax
 470:	74 f3                	je     465 <lock_acquire+0x6>
  {

  }
  return 0;
}
 472:	b8 00 00 00 00       	mov    $0x0,%eax
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    

00000479 <lock_release>:
int
lock_release(lock_t * lock){
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 47c:	8b 45 08             	mov    0x8(%ebp),%eax
 47f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 485:	b8 00 00 00 00       	mov    $0x0,%eax
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    

0000048c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 48c:	b8 01 00 00 00       	mov    $0x1,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <exit>:
SYSCALL(exit)
 494:	b8 02 00 00 00       	mov    $0x2,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <wait>:
SYSCALL(wait)
 49c:	b8 03 00 00 00       	mov    $0x3,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <pipe>:
SYSCALL(pipe)
 4a4:	b8 04 00 00 00       	mov    $0x4,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <read>:
SYSCALL(read)
 4ac:	b8 05 00 00 00       	mov    $0x5,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <write>:
SYSCALL(write)
 4b4:	b8 10 00 00 00       	mov    $0x10,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <close>:
SYSCALL(close)
 4bc:	b8 15 00 00 00       	mov    $0x15,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <kill>:
SYSCALL(kill)
 4c4:	b8 06 00 00 00       	mov    $0x6,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <exec>:
SYSCALL(exec)
 4cc:	b8 07 00 00 00       	mov    $0x7,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <open>:
SYSCALL(open)
 4d4:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <mknod>:
SYSCALL(mknod)
 4dc:	b8 11 00 00 00       	mov    $0x11,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <unlink>:
SYSCALL(unlink)
 4e4:	b8 12 00 00 00       	mov    $0x12,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <fstat>:
SYSCALL(fstat)
 4ec:	b8 08 00 00 00       	mov    $0x8,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <link>:
SYSCALL(link)
 4f4:	b8 13 00 00 00       	mov    $0x13,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <mkdir>:
SYSCALL(mkdir)
 4fc:	b8 14 00 00 00       	mov    $0x14,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <chdir>:
SYSCALL(chdir)
 504:	b8 09 00 00 00       	mov    $0x9,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <dup>:
SYSCALL(dup)
 50c:	b8 0a 00 00 00       	mov    $0xa,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <getpid>:
SYSCALL(getpid)
 514:	b8 0b 00 00 00       	mov    $0xb,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <sbrk>:
SYSCALL(sbrk)
 51c:	b8 0c 00 00 00       	mov    $0xc,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <sleep>:
SYSCALL(sleep)
 524:	b8 0d 00 00 00       	mov    $0xd,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <uptime>:
SYSCALL(uptime)
 52c:	b8 0e 00 00 00       	mov    $0xe,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <clone>:
SYSCALL(clone)
 534:	b8 16 00 00 00       	mov    $0x16,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <join>:
SYSCALL(join)
 53c:	b8 17 00 00 00       	mov    $0x17,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	83 ec 1c             	sub    $0x1c,%esp
 54a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 54d:	6a 01                	push   $0x1
 54f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 552:	52                   	push   %edx
 553:	50                   	push   %eax
 554:	e8 5b ff ff ff       	call   4b4 <write>
}
 559:	83 c4 10             	add    $0x10,%esp
 55c:	c9                   	leave  
 55d:	c3                   	ret    

0000055e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 55e:	55                   	push   %ebp
 55f:	89 e5                	mov    %esp,%ebp
 561:	57                   	push   %edi
 562:	56                   	push   %esi
 563:	53                   	push   %ebx
 564:	83 ec 2c             	sub    $0x2c,%esp
 567:	89 45 d0             	mov    %eax,-0x30(%ebp)
 56a:	89 d0                	mov    %edx,%eax
 56c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 56e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 572:	0f 95 c1             	setne  %cl
 575:	c1 ea 1f             	shr    $0x1f,%edx
 578:	84 d1                	test   %dl,%cl
 57a:	74 44                	je     5c0 <printint+0x62>
    neg = 1;
    x = -xx;
 57c:	f7 d8                	neg    %eax
 57e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 580:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 587:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 58c:	89 c8                	mov    %ecx,%eax
 58e:	ba 00 00 00 00       	mov    $0x0,%edx
 593:	f7 f6                	div    %esi
 595:	89 df                	mov    %ebx,%edi
 597:	83 c3 01             	add    $0x1,%ebx
 59a:	0f b6 92 8c 09 00 00 	movzbl 0x98c(%edx),%edx
 5a1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5a5:	89 ca                	mov    %ecx,%edx
 5a7:	89 c1                	mov    %eax,%ecx
 5a9:	39 d6                	cmp    %edx,%esi
 5ab:	76 df                	jbe    58c <printint+0x2e>
  if(neg)
 5ad:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5b1:	74 31                	je     5e4 <printint+0x86>
    buf[i++] = '-';
 5b3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5b8:	8d 5f 02             	lea    0x2(%edi),%ebx
 5bb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5be:	eb 17                	jmp    5d7 <printint+0x79>
    x = xx;
 5c0:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5c2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5c9:	eb bc                	jmp    587 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5cb:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5d0:	89 f0                	mov    %esi,%eax
 5d2:	e8 6d ff ff ff       	call   544 <putc>
  while(--i >= 0)
 5d7:	83 eb 01             	sub    $0x1,%ebx
 5da:	79 ef                	jns    5cb <printint+0x6d>
}
 5dc:	83 c4 2c             	add    $0x2c,%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5e7:	eb ee                	jmp    5d7 <printint+0x79>

000005e9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e9:	55                   	push   %ebp
 5ea:	89 e5                	mov    %esp,%ebp
 5ec:	57                   	push   %edi
 5ed:	56                   	push   %esi
 5ee:	53                   	push   %ebx
 5ef:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5f2:	8d 45 10             	lea    0x10(%ebp),%eax
 5f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5f8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 602:	eb 14                	jmp    618 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 604:	89 fa                	mov    %edi,%edx
 606:	8b 45 08             	mov    0x8(%ebp),%eax
 609:	e8 36 ff ff ff       	call   544 <putc>
 60e:	eb 05                	jmp    615 <printf+0x2c>
      }
    } else if(state == '%'){
 610:	83 fe 25             	cmp    $0x25,%esi
 613:	74 25                	je     63a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 615:	83 c3 01             	add    $0x1,%ebx
 618:	8b 45 0c             	mov    0xc(%ebp),%eax
 61b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 61f:	84 c0                	test   %al,%al
 621:	0f 84 20 01 00 00    	je     747 <printf+0x15e>
    c = fmt[i] & 0xff;
 627:	0f be f8             	movsbl %al,%edi
 62a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 62d:	85 f6                	test   %esi,%esi
 62f:	75 df                	jne    610 <printf+0x27>
      if(c == '%'){
 631:	83 f8 25             	cmp    $0x25,%eax
 634:	75 ce                	jne    604 <printf+0x1b>
        state = '%';
 636:	89 c6                	mov    %eax,%esi
 638:	eb db                	jmp    615 <printf+0x2c>
      if(c == 'd'){
 63a:	83 f8 25             	cmp    $0x25,%eax
 63d:	0f 84 cf 00 00 00    	je     712 <printf+0x129>
 643:	0f 8c dd 00 00 00    	jl     726 <printf+0x13d>
 649:	83 f8 78             	cmp    $0x78,%eax
 64c:	0f 8f d4 00 00 00    	jg     726 <printf+0x13d>
 652:	83 f8 63             	cmp    $0x63,%eax
 655:	0f 8c cb 00 00 00    	jl     726 <printf+0x13d>
 65b:	83 e8 63             	sub    $0x63,%eax
 65e:	83 f8 15             	cmp    $0x15,%eax
 661:	0f 87 bf 00 00 00    	ja     726 <printf+0x13d>
 667:	ff 24 85 34 09 00 00 	jmp    *0x934(,%eax,4)
        printint(fd, *ap, 10, 1);
 66e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 671:	8b 17                	mov    (%edi),%edx
 673:	83 ec 0c             	sub    $0xc,%esp
 676:	6a 01                	push   $0x1
 678:	b9 0a 00 00 00       	mov    $0xa,%ecx
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	e8 d9 fe ff ff       	call   55e <printint>
        ap++;
 685:	83 c7 04             	add    $0x4,%edi
 688:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 68b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 68e:	be 00 00 00 00       	mov    $0x0,%esi
 693:	eb 80                	jmp    615 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 695:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 698:	8b 17                	mov    (%edi),%edx
 69a:	83 ec 0c             	sub    $0xc,%esp
 69d:	6a 00                	push   $0x0
 69f:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a4:	8b 45 08             	mov    0x8(%ebp),%eax
 6a7:	e8 b2 fe ff ff       	call   55e <printint>
        ap++;
 6ac:	83 c7 04             	add    $0x4,%edi
 6af:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6b2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b5:	be 00 00 00 00       	mov    $0x0,%esi
 6ba:	e9 56 ff ff ff       	jmp    615 <printf+0x2c>
        s = (char*)*ap;
 6bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c2:	8b 30                	mov    (%eax),%esi
        ap++;
 6c4:	83 c0 04             	add    $0x4,%eax
 6c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6ca:	85 f6                	test   %esi,%esi
 6cc:	75 15                	jne    6e3 <printf+0xfa>
          s = "(null)";
 6ce:	be 2c 09 00 00       	mov    $0x92c,%esi
 6d3:	eb 0e                	jmp    6e3 <printf+0xfa>
          putc(fd, *s);
 6d5:	0f be d2             	movsbl %dl,%edx
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	e8 64 fe ff ff       	call   544 <putc>
          s++;
 6e0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6e3:	0f b6 16             	movzbl (%esi),%edx
 6e6:	84 d2                	test   %dl,%dl
 6e8:	75 eb                	jne    6d5 <printf+0xec>
      state = 0;
 6ea:	be 00 00 00 00       	mov    $0x0,%esi
 6ef:	e9 21 ff ff ff       	jmp    615 <printf+0x2c>
        putc(fd, *ap);
 6f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f7:	0f be 17             	movsbl (%edi),%edx
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	e8 42 fe ff ff       	call   544 <putc>
        ap++;
 702:	83 c7 04             	add    $0x4,%edi
 705:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 708:	be 00 00 00 00       	mov    $0x0,%esi
 70d:	e9 03 ff ff ff       	jmp    615 <printf+0x2c>
        putc(fd, c);
 712:	89 fa                	mov    %edi,%edx
 714:	8b 45 08             	mov    0x8(%ebp),%eax
 717:	e8 28 fe ff ff       	call   544 <putc>
      state = 0;
 71c:	be 00 00 00 00       	mov    $0x0,%esi
 721:	e9 ef fe ff ff       	jmp    615 <printf+0x2c>
        putc(fd, '%');
 726:	ba 25 00 00 00       	mov    $0x25,%edx
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	e8 11 fe ff ff       	call   544 <putc>
        putc(fd, c);
 733:	89 fa                	mov    %edi,%edx
 735:	8b 45 08             	mov    0x8(%ebp),%eax
 738:	e8 07 fe ff ff       	call   544 <putc>
      state = 0;
 73d:	be 00 00 00 00       	mov    $0x0,%esi
 742:	e9 ce fe ff ff       	jmp    615 <printf+0x2c>
    }
  }
}
 747:	8d 65 f4             	lea    -0xc(%ebp),%esp
 74a:	5b                   	pop    %ebx
 74b:	5e                   	pop    %esi
 74c:	5f                   	pop    %edi
 74d:	5d                   	pop    %ebp
 74e:	c3                   	ret    

0000074f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 74f:	55                   	push   %ebp
 750:	89 e5                	mov    %esp,%ebp
 752:	57                   	push   %edi
 753:	56                   	push   %esi
 754:	53                   	push   %ebx
 755:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 758:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75b:	a1 00 0d 00 00       	mov    0xd00,%eax
 760:	eb 02                	jmp    764 <free+0x15>
 762:	89 d0                	mov    %edx,%eax
 764:	39 c8                	cmp    %ecx,%eax
 766:	73 04                	jae    76c <free+0x1d>
 768:	39 08                	cmp    %ecx,(%eax)
 76a:	77 12                	ja     77e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76c:	8b 10                	mov    (%eax),%edx
 76e:	39 c2                	cmp    %eax,%edx
 770:	77 f0                	ja     762 <free+0x13>
 772:	39 c8                	cmp    %ecx,%eax
 774:	72 08                	jb     77e <free+0x2f>
 776:	39 ca                	cmp    %ecx,%edx
 778:	77 04                	ja     77e <free+0x2f>
 77a:	89 d0                	mov    %edx,%eax
 77c:	eb e6                	jmp    764 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 77e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 781:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 784:	8b 10                	mov    (%eax),%edx
 786:	39 d7                	cmp    %edx,%edi
 788:	74 19                	je     7a3 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 78a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 78d:	8b 50 04             	mov    0x4(%eax),%edx
 790:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 793:	39 ce                	cmp    %ecx,%esi
 795:	74 1b                	je     7b2 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 797:	89 08                	mov    %ecx,(%eax)
  freep = p;
 799:	a3 00 0d 00 00       	mov    %eax,0xd00
}
 79e:	5b                   	pop    %ebx
 79f:	5e                   	pop    %esi
 7a0:	5f                   	pop    %edi
 7a1:	5d                   	pop    %ebp
 7a2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7a3:	03 72 04             	add    0x4(%edx),%esi
 7a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a9:	8b 10                	mov    (%eax),%edx
 7ab:	8b 12                	mov    (%edx),%edx
 7ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7b0:	eb db                	jmp    78d <free+0x3e>
    p->s.size += bp->s.size;
 7b2:	03 53 fc             	add    -0x4(%ebx),%edx
 7b5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7bb:	89 10                	mov    %edx,(%eax)
 7bd:	eb da                	jmp    799 <free+0x4a>

000007bf <morecore>:

static Header*
morecore(uint nu)
{
 7bf:	55                   	push   %ebp
 7c0:	89 e5                	mov    %esp,%ebp
 7c2:	53                   	push   %ebx
 7c3:	83 ec 04             	sub    $0x4,%esp
 7c6:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7c8:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7cd:	77 05                	ja     7d4 <morecore+0x15>
    nu = 4096;
 7cf:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7d4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7db:	83 ec 0c             	sub    $0xc,%esp
 7de:	50                   	push   %eax
 7df:	e8 38 fd ff ff       	call   51c <sbrk>
  if(p == (char*)-1)
 7e4:	83 c4 10             	add    $0x10,%esp
 7e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ea:	74 1c                	je     808 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7ef:	83 c0 08             	add    $0x8,%eax
 7f2:	83 ec 0c             	sub    $0xc,%esp
 7f5:	50                   	push   %eax
 7f6:	e8 54 ff ff ff       	call   74f <free>
  return freep;
 7fb:	a1 00 0d 00 00       	mov    0xd00,%eax
 800:	83 c4 10             	add    $0x10,%esp
}
 803:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 806:	c9                   	leave  
 807:	c3                   	ret    
    return 0;
 808:	b8 00 00 00 00       	mov    $0x0,%eax
 80d:	eb f4                	jmp    803 <morecore+0x44>

0000080f <malloc>:

void*
malloc(uint nbytes)
{
 80f:	55                   	push   %ebp
 810:	89 e5                	mov    %esp,%ebp
 812:	53                   	push   %ebx
 813:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 816:	8b 45 08             	mov    0x8(%ebp),%eax
 819:	8d 58 07             	lea    0x7(%eax),%ebx
 81c:	c1 eb 03             	shr    $0x3,%ebx
 81f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 822:	8b 0d 00 0d 00 00    	mov    0xd00,%ecx
 828:	85 c9                	test   %ecx,%ecx
 82a:	74 04                	je     830 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82c:	8b 01                	mov    (%ecx),%eax
 82e:	eb 4a                	jmp    87a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 00 0d 00 00 04 	movl   $0xd04,0xd00
 837:	0d 00 00 
 83a:	c7 05 04 0d 00 00 04 	movl   $0xd04,0xd04
 841:	0d 00 00 
    base.s.size = 0;
 844:	c7 05 08 0d 00 00 00 	movl   $0x0,0xd08
 84b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 84e:	b9 04 0d 00 00       	mov    $0xd04,%ecx
 853:	eb d7                	jmp    82c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 855:	74 19                	je     870 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 857:	29 da                	sub    %ebx,%edx
 859:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 85c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 85f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 862:	89 0d 00 0d 00 00    	mov    %ecx,0xd00
      return (void*)(p + 1);
 868:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 86b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 86e:	c9                   	leave  
 86f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 870:	8b 10                	mov    (%eax),%edx
 872:	89 11                	mov    %edx,(%ecx)
 874:	eb ec                	jmp    862 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 876:	89 c1                	mov    %eax,%ecx
 878:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 87a:	8b 50 04             	mov    0x4(%eax),%edx
 87d:	39 da                	cmp    %ebx,%edx
 87f:	73 d4                	jae    855 <malloc+0x46>
    if(p == freep)
 881:	39 05 00 0d 00 00    	cmp    %eax,0xd00
 887:	75 ed                	jne    876 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 889:	89 d8                	mov    %ebx,%eax
 88b:	e8 2f ff ff ff       	call   7bf <morecore>
 890:	85 c0                	test   %eax,%eax
 892:	75 e2                	jne    876 <malloc+0x67>
 894:	eb d5                	jmp    86b <malloc+0x5c>
