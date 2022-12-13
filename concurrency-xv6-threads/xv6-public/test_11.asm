
_test_11:     file format elf32-i386


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
   assert(global == 1);
   6:	a1 e4 0c 00 00       	mov    0xce4,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 60 08 00 00       	push   $0x860
  17:	68 6a 08 00 00       	push   $0x86a
  1c:	6a 01                	push   $0x1
  1e:	e8 90 05 00 00       	call   5b3 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 72 08 00 00       	push   $0x872
  2b:	68 7e 08 00 00       	push   $0x87e
  30:	6a 01                	push   $0x1
  32:	e8 7c 05 00 00       	call   5b3 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 92 08 00 00       	push   $0x892
  3f:	6a 01                	push   $0x1
  41:	e8 6d 05 00 00       	call   5b3 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 e8 0c 00 00    	push   0xce8
  4f:	e8 3a 04 00 00       	call   48e <kill>
  54:	e8 05 04 00 00       	call   45e <exit>
   global += 4;
  59:	a1 e4 0c 00 00       	mov    0xce4,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 e4 0c 00 00       	mov    %eax,0xce4
   exit();
  66:	e8 f3 03 00 00       	call   45e <exit>

0000006b <main>:
{
  6b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6f:	83 e4 f0             	and    $0xfffffff0,%esp
  72:	ff 71 fc             	push   -0x4(%ecx)
  75:	55                   	push   %ebp
  76:	89 e5                	mov    %esp,%ebp
  78:	56                   	push   %esi
  79:	53                   	push   %ebx
  7a:	51                   	push   %ecx
  7b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  7e:	e8 5b 04 00 00       	call   4de <getpid>
  83:	a3 e8 0c 00 00       	mov    %eax,0xce8
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 e4 0c 00 00 01 	movl   $0x1,0xce4
  9d:	00 00 00 
      thread_pid = thread_create(worker, 0, 0);
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	6a 00                	push   $0x0
  a5:	6a 00                	push   $0x0
  a7:	68 00 00 00 00       	push   $0x0
  ac:	e8 0c 03 00 00       	call   3bd <thread_create>
  b1:	89 c3                	mov    %eax,%ebx
      assert(thread_pid > 0);
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	85 c0                	test   %eax,%eax
  b8:	7e 34                	jle    ee <main+0x83>
      join_pid = thread_join();
  ba:	e8 33 03 00 00       	call   3f2 <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 e4 0c 00 00       	mov    0xce4,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 0b 04 00 00       	call   4e6 <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 60 08 00 00       	push   $0x860
  f5:	68 6a 08 00 00       	push   $0x86a
  fa:	6a 01                	push   $0x1
  fc:	e8 b2 04 00 00       	call   5b3 <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 9f 08 00 00       	push   $0x89f
 109:	68 7e 08 00 00       	push   $0x87e
 10e:	6a 01                	push   $0x1
 110:	e8 9e 04 00 00       	call   5b3 <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 92 08 00 00       	push   $0x892
 11d:	6a 01                	push   $0x1
 11f:	e8 8f 04 00 00       	call   5b3 <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 e8 0c 00 00    	push   0xce8
 12d:	e8 5c 03 00 00       	call   48e <kill>
 132:	e8 27 03 00 00       	call   45e <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 60 08 00 00       	push   $0x860
 13e:	68 6a 08 00 00       	push   $0x86a
 143:	6a 01                	push   $0x1
 145:	e8 69 04 00 00       	call   5b3 <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 ae 08 00 00       	push   $0x8ae
 152:	68 7e 08 00 00       	push   $0x87e
 157:	6a 01                	push   $0x1
 159:	e8 55 04 00 00       	call   5b3 <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 92 08 00 00       	push   $0x892
 166:	6a 01                	push   $0x1
 168:	e8 46 04 00 00       	call   5b3 <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 e8 0c 00 00    	push   0xce8
 176:	e8 13 03 00 00       	call   48e <kill>
 17b:	e8 de 02 00 00       	call   45e <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 60 08 00 00       	push   $0x860
 187:	68 6a 08 00 00       	push   $0x86a
 18c:	6a 01                	push   $0x1
 18e:	e8 20 04 00 00       	call   5b3 <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 c5 08 00 00       	push   $0x8c5
 19b:	68 7e 08 00 00       	push   $0x87e
 1a0:	6a 01                	push   $0x1
 1a2:	e8 0c 04 00 00       	call   5b3 <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 92 08 00 00       	push   $0x892
 1af:	6a 01                	push   $0x1
 1b1:	e8 fd 03 00 00       	call   5b3 <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 e8 0c 00 00    	push   0xce8
 1bf:	e8 ca 02 00 00       	call   48e <kill>
 1c4:	e8 95 02 00 00       	call   45e <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 60 08 00 00       	push   $0x860
 1d0:	68 6a 08 00 00       	push   $0x86a
 1d5:	6a 01                	push   $0x1
 1d7:	e8 d7 03 00 00       	call   5b3 <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 e0 08 00 00       	push   $0x8e0
 1e4:	68 7e 08 00 00       	push   $0x87e
 1e9:	6a 01                	push   $0x1
 1eb:	e8 c3 03 00 00       	call   5b3 <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 92 08 00 00       	push   $0x892
 1f8:	6a 01                	push   $0x1
 1fa:	e8 b4 03 00 00       	call   5b3 <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 e8 0c 00 00    	push   0xce8
 208:	e8 81 02 00 00       	call   48e <kill>
 20d:	e8 4c 02 00 00       	call   45e <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 d1 08 00 00       	push   $0x8d1
 21a:	6a 01                	push   $0x1
 21c:	e8 92 03 00 00       	call   5b3 <printf>
   exit();
 221:	e8 38 02 00 00       	call   45e <exit>

00000226 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	56                   	push   %esi
 22a:	53                   	push   %ebx
 22b:	8b 75 08             	mov    0x8(%ebp),%esi
 22e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 231:	89 f0                	mov    %esi,%eax
 233:	89 d1                	mov    %edx,%ecx
 235:	83 c2 01             	add    $0x1,%edx
 238:	89 c3                	mov    %eax,%ebx
 23a:	83 c0 01             	add    $0x1,%eax
 23d:	0f b6 09             	movzbl (%ecx),%ecx
 240:	88 0b                	mov    %cl,(%ebx)
 242:	84 c9                	test   %cl,%cl
 244:	75 ed                	jne    233 <strcpy+0xd>
    ;
  return os;
}
 246:	89 f0                	mov    %esi,%eax
 248:	5b                   	pop    %ebx
 249:	5e                   	pop    %esi
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    

0000024c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 252:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 255:	eb 06                	jmp    25d <strcmp+0x11>
    p++, q++;
 257:	83 c1 01             	add    $0x1,%ecx
 25a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 25d:	0f b6 01             	movzbl (%ecx),%eax
 260:	84 c0                	test   %al,%al
 262:	74 04                	je     268 <strcmp+0x1c>
 264:	3a 02                	cmp    (%edx),%al
 266:	74 ef                	je     257 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 268:	0f b6 c0             	movzbl %al,%eax
 26b:	0f b6 12             	movzbl (%edx),%edx
 26e:	29 d0                	sub    %edx,%eax
}
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <strlen>:

uint
strlen(const char *s)
{
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 278:	b8 00 00 00 00       	mov    $0x0,%eax
 27d:	eb 03                	jmp    282 <strlen+0x10>
 27f:	83 c0 01             	add    $0x1,%eax
 282:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 286:	75 f7                	jne    27f <strlen+0xd>
    ;
  return n;
}
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    

0000028a <memset>:

void*
memset(void *dst, int c, uint n)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	57                   	push   %edi
 28e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 291:	89 d7                	mov    %edx,%edi
 293:	8b 4d 10             	mov    0x10(%ebp),%ecx
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	fc                   	cld    
 29a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 29c:	89 d0                	mov    %edx,%eax
 29e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2a1:	c9                   	leave  
 2a2:	c3                   	ret    

000002a3 <strchr>:

char*
strchr(const char *s, char c)
{
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ad:	eb 03                	jmp    2b2 <strchr+0xf>
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	0f b6 10             	movzbl (%eax),%edx
 2b5:	84 d2                	test   %dl,%dl
 2b7:	74 06                	je     2bf <strchr+0x1c>
    if(*s == c)
 2b9:	38 ca                	cmp    %cl,%dl
 2bb:	75 f2                	jne    2af <strchr+0xc>
 2bd:	eb 05                	jmp    2c4 <strchr+0x21>
      return (char*)s;
  return 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	57                   	push   %edi
 2ca:	56                   	push   %esi
 2cb:	53                   	push   %ebx
 2cc:	83 ec 1c             	sub    $0x1c,%esp
 2cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7d 2e                	jge    30f <gets+0x49>
    cc = read(0, &c, 1);
 2e1:	83 ec 04             	sub    $0x4,%esp
 2e4:	6a 01                	push   $0x1
 2e6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2e9:	50                   	push   %eax
 2ea:	6a 00                	push   $0x0
 2ec:	e8 85 01 00 00       	call   476 <read>
    if(cc < 1)
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	85 c0                	test   %eax,%eax
 2f6:	7e 17                	jle    30f <gets+0x49>
      break;
    buf[i++] = c;
 2f8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2fc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2ff:	3c 0a                	cmp    $0xa,%al
 301:	0f 94 c2             	sete   %dl
 304:	3c 0d                	cmp    $0xd,%al
 306:	0f 94 c0             	sete   %al
 309:	08 c2                	or     %al,%dl
 30b:	74 ca                	je     2d7 <gets+0x11>
    buf[i++] = c;
 30d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 30f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 313:	89 f8                	mov    %edi,%eax
 315:	8d 65 f4             	lea    -0xc(%ebp),%esp
 318:	5b                   	pop    %ebx
 319:	5e                   	pop    %esi
 31a:	5f                   	pop    %edi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    

0000031d <stat>:

int
stat(const char *n, struct stat *st)
{
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	56                   	push   %esi
 321:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 322:	83 ec 08             	sub    $0x8,%esp
 325:	6a 00                	push   $0x0
 327:	ff 75 08             	push   0x8(%ebp)
 32a:	e8 6f 01 00 00       	call   49e <open>
  if(fd < 0)
 32f:	83 c4 10             	add    $0x10,%esp
 332:	85 c0                	test   %eax,%eax
 334:	78 24                	js     35a <stat+0x3d>
 336:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 338:	83 ec 08             	sub    $0x8,%esp
 33b:	ff 75 0c             	push   0xc(%ebp)
 33e:	50                   	push   %eax
 33f:	e8 72 01 00 00       	call   4b6 <fstat>
 344:	89 c6                	mov    %eax,%esi
  close(fd);
 346:	89 1c 24             	mov    %ebx,(%esp)
 349:	e8 38 01 00 00       	call   486 <close>
  return r;
 34e:	83 c4 10             	add    $0x10,%esp
}
 351:	89 f0                	mov    %esi,%eax
 353:	8d 65 f8             	lea    -0x8(%ebp),%esp
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    
    return -1;
 35a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 35f:	eb f0                	jmp    351 <stat+0x34>

00000361 <atoi>:

int
atoi(const char *s)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	53                   	push   %ebx
 365:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 368:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 36d:	eb 10                	jmp    37f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 36f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 372:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 375:	83 c1 01             	add    $0x1,%ecx
 378:	0f be c0             	movsbl %al,%eax
 37b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 37f:	0f b6 01             	movzbl (%ecx),%eax
 382:	8d 58 d0             	lea    -0x30(%eax),%ebx
 385:	80 fb 09             	cmp    $0x9,%bl
 388:	76 e5                	jbe    36f <atoi+0xe>
  return n;
}
 38a:	89 d0                	mov    %edx,%eax
 38c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38f:	c9                   	leave  
 390:	c3                   	ret    

00000391 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
 396:	8b 75 08             	mov    0x8(%ebp),%esi
 399:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 39c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 39f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3a1:	eb 0d                	jmp    3b0 <memmove+0x1f>
    *dst++ = *src++;
 3a3:	0f b6 01             	movzbl (%ecx),%eax
 3a6:	88 02                	mov    %al,(%edx)
 3a8:	8d 49 01             	lea    0x1(%ecx),%ecx
 3ab:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3ae:	89 d8                	mov    %ebx,%eax
 3b0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3b3:	85 c0                	test   %eax,%eax
 3b5:	7f ec                	jg     3a3 <memmove+0x12>
  return vdst;
}
 3b7:	89 f0                	mov    %esi,%eax
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    

000003bd <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 3bd:	55                   	push   %ebp
 3be:	89 e5                	mov    %esp,%ebp
 3c0:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 3c3:	68 00 20 00 00       	push   $0x2000
 3c8:	e8 0c 04 00 00       	call   7d9 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 3cd:	83 c4 10             	add    $0x10,%esp
 3d0:	a9 ff 0f 00 00       	test   $0xfff,%eax
 3d5:	74 0a                	je     3e1 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 3d7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 3dc:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 3e1:	50                   	push   %eax
 3e2:	ff 75 10             	push   0x10(%ebp)
 3e5:	ff 75 0c             	push   0xc(%ebp)
 3e8:	ff 75 08             	push   0x8(%ebp)
 3eb:	e8 0e 01 00 00       	call   4fe <clone>
  return pid;
}
 3f0:	c9                   	leave  
 3f1:	c3                   	ret    

000003f2 <thread_join>:
int
thread_join()
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	53                   	push   %ebx
 3f6:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 3f9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3fc:	50                   	push   %eax
 3fd:	e8 04 01 00 00       	call   506 <join>
 402:	89 c3                	mov    %eax,%ebx
  free(stack);
 404:	83 c4 04             	add    $0x4,%esp
 407:	ff 75 f4             	push   -0xc(%ebp)
 40a:	e8 0a 03 00 00       	call   719 <free>
  return pid;
}
 40f:	89 d8                	mov    %ebx,%eax
 411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <lock_init>:
int
lock_init(lock_t * lock){
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 419:	8b 45 08             	mov    0x8(%ebp),%eax
 41c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 422:	b8 00 00 00 00       	mov    $0x0,%eax
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    

00000429 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
 42c:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 42f:	b8 01 00 00 00       	mov    $0x1,%eax
 434:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 437:	83 f8 01             	cmp    $0x1,%eax
 43a:	74 f3                	je     42f <lock_acquire+0x6>
  {

  }
  return 0;
}
 43c:	b8 00 00 00 00       	mov    $0x0,%eax
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    

00000443 <lock_release>:
int
lock_release(lock_t * lock){
 443:	55                   	push   %ebp
 444:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 446:	8b 45 08             	mov    0x8(%ebp),%eax
 449:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 44f:	b8 00 00 00 00       	mov    $0x0,%eax
 454:	5d                   	pop    %ebp
 455:	c3                   	ret    

00000456 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 456:	b8 01 00 00 00       	mov    $0x1,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <exit>:
SYSCALL(exit)
 45e:	b8 02 00 00 00       	mov    $0x2,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <wait>:
SYSCALL(wait)
 466:	b8 03 00 00 00       	mov    $0x3,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <pipe>:
SYSCALL(pipe)
 46e:	b8 04 00 00 00       	mov    $0x4,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <read>:
SYSCALL(read)
 476:	b8 05 00 00 00       	mov    $0x5,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <write>:
SYSCALL(write)
 47e:	b8 10 00 00 00       	mov    $0x10,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <close>:
SYSCALL(close)
 486:	b8 15 00 00 00       	mov    $0x15,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <kill>:
SYSCALL(kill)
 48e:	b8 06 00 00 00       	mov    $0x6,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <exec>:
SYSCALL(exec)
 496:	b8 07 00 00 00       	mov    $0x7,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <open>:
SYSCALL(open)
 49e:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <mknod>:
SYSCALL(mknod)
 4a6:	b8 11 00 00 00       	mov    $0x11,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <unlink>:
SYSCALL(unlink)
 4ae:	b8 12 00 00 00       	mov    $0x12,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <fstat>:
SYSCALL(fstat)
 4b6:	b8 08 00 00 00       	mov    $0x8,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <link>:
SYSCALL(link)
 4be:	b8 13 00 00 00       	mov    $0x13,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <mkdir>:
SYSCALL(mkdir)
 4c6:	b8 14 00 00 00       	mov    $0x14,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <chdir>:
SYSCALL(chdir)
 4ce:	b8 09 00 00 00       	mov    $0x9,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <dup>:
SYSCALL(dup)
 4d6:	b8 0a 00 00 00       	mov    $0xa,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <getpid>:
SYSCALL(getpid)
 4de:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <sbrk>:
SYSCALL(sbrk)
 4e6:	b8 0c 00 00 00       	mov    $0xc,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <sleep>:
SYSCALL(sleep)
 4ee:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <uptime>:
SYSCALL(uptime)
 4f6:	b8 0e 00 00 00       	mov    $0xe,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <clone>:
SYSCALL(clone)
 4fe:	b8 16 00 00 00       	mov    $0x16,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <join>:
SYSCALL(join)
 506:	b8 17 00 00 00       	mov    $0x17,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 50e:	55                   	push   %ebp
 50f:	89 e5                	mov    %esp,%ebp
 511:	83 ec 1c             	sub    $0x1c,%esp
 514:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 517:	6a 01                	push   $0x1
 519:	8d 55 f4             	lea    -0xc(%ebp),%edx
 51c:	52                   	push   %edx
 51d:	50                   	push   %eax
 51e:	e8 5b ff ff ff       	call   47e <write>
}
 523:	83 c4 10             	add    $0x10,%esp
 526:	c9                   	leave  
 527:	c3                   	ret    

00000528 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 528:	55                   	push   %ebp
 529:	89 e5                	mov    %esp,%ebp
 52b:	57                   	push   %edi
 52c:	56                   	push   %esi
 52d:	53                   	push   %ebx
 52e:	83 ec 2c             	sub    $0x2c,%esp
 531:	89 45 d0             	mov    %eax,-0x30(%ebp)
 534:	89 d0                	mov    %edx,%eax
 536:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 538:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 53c:	0f 95 c1             	setne  %cl
 53f:	c1 ea 1f             	shr    $0x1f,%edx
 542:	84 d1                	test   %dl,%cl
 544:	74 44                	je     58a <printint+0x62>
    neg = 1;
    x = -xx;
 546:	f7 d8                	neg    %eax
 548:	89 c1                	mov    %eax,%ecx
    neg = 1;
 54a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 551:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 556:	89 c8                	mov    %ecx,%eax
 558:	ba 00 00 00 00       	mov    $0x0,%edx
 55d:	f7 f6                	div    %esi
 55f:	89 df                	mov    %ebx,%edi
 561:	83 c3 01             	add    $0x1,%ebx
 564:	0f b6 92 7c 09 00 00 	movzbl 0x97c(%edx),%edx
 56b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 56f:	89 ca                	mov    %ecx,%edx
 571:	89 c1                	mov    %eax,%ecx
 573:	39 d6                	cmp    %edx,%esi
 575:	76 df                	jbe    556 <printint+0x2e>
  if(neg)
 577:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 57b:	74 31                	je     5ae <printint+0x86>
    buf[i++] = '-';
 57d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 582:	8d 5f 02             	lea    0x2(%edi),%ebx
 585:	8b 75 d0             	mov    -0x30(%ebp),%esi
 588:	eb 17                	jmp    5a1 <printint+0x79>
    x = xx;
 58a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 58c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 593:	eb bc                	jmp    551 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 595:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 59a:	89 f0                	mov    %esi,%eax
 59c:	e8 6d ff ff ff       	call   50e <putc>
  while(--i >= 0)
 5a1:	83 eb 01             	sub    $0x1,%ebx
 5a4:	79 ef                	jns    595 <printint+0x6d>
}
 5a6:	83 c4 2c             	add    $0x2c,%esp
 5a9:	5b                   	pop    %ebx
 5aa:	5e                   	pop    %esi
 5ab:	5f                   	pop    %edi
 5ac:	5d                   	pop    %ebp
 5ad:	c3                   	ret    
 5ae:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5b1:	eb ee                	jmp    5a1 <printint+0x79>

000005b3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5b3:	55                   	push   %ebp
 5b4:	89 e5                	mov    %esp,%ebp
 5b6:	57                   	push   %edi
 5b7:	56                   	push   %esi
 5b8:	53                   	push   %ebx
 5b9:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5bc:	8d 45 10             	lea    0x10(%ebp),%eax
 5bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5c2:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5c7:	bb 00 00 00 00       	mov    $0x0,%ebx
 5cc:	eb 14                	jmp    5e2 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5ce:	89 fa                	mov    %edi,%edx
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
 5d3:	e8 36 ff ff ff       	call   50e <putc>
 5d8:	eb 05                	jmp    5df <printf+0x2c>
      }
    } else if(state == '%'){
 5da:	83 fe 25             	cmp    $0x25,%esi
 5dd:	74 25                	je     604 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5df:	83 c3 01             	add    $0x1,%ebx
 5e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5e9:	84 c0                	test   %al,%al
 5eb:	0f 84 20 01 00 00    	je     711 <printf+0x15e>
    c = fmt[i] & 0xff;
 5f1:	0f be f8             	movsbl %al,%edi
 5f4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5f7:	85 f6                	test   %esi,%esi
 5f9:	75 df                	jne    5da <printf+0x27>
      if(c == '%'){
 5fb:	83 f8 25             	cmp    $0x25,%eax
 5fe:	75 ce                	jne    5ce <printf+0x1b>
        state = '%';
 600:	89 c6                	mov    %eax,%esi
 602:	eb db                	jmp    5df <printf+0x2c>
      if(c == 'd'){
 604:	83 f8 25             	cmp    $0x25,%eax
 607:	0f 84 cf 00 00 00    	je     6dc <printf+0x129>
 60d:	0f 8c dd 00 00 00    	jl     6f0 <printf+0x13d>
 613:	83 f8 78             	cmp    $0x78,%eax
 616:	0f 8f d4 00 00 00    	jg     6f0 <printf+0x13d>
 61c:	83 f8 63             	cmp    $0x63,%eax
 61f:	0f 8c cb 00 00 00    	jl     6f0 <printf+0x13d>
 625:	83 e8 63             	sub    $0x63,%eax
 628:	83 f8 15             	cmp    $0x15,%eax
 62b:	0f 87 bf 00 00 00    	ja     6f0 <printf+0x13d>
 631:	ff 24 85 24 09 00 00 	jmp    *0x924(,%eax,4)
        printint(fd, *ap, 10, 1);
 638:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 63b:	8b 17                	mov    (%edi),%edx
 63d:	83 ec 0c             	sub    $0xc,%esp
 640:	6a 01                	push   $0x1
 642:	b9 0a 00 00 00       	mov    $0xa,%ecx
 647:	8b 45 08             	mov    0x8(%ebp),%eax
 64a:	e8 d9 fe ff ff       	call   528 <printint>
        ap++;
 64f:	83 c7 04             	add    $0x4,%edi
 652:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 655:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 658:	be 00 00 00 00       	mov    $0x0,%esi
 65d:	eb 80                	jmp    5df <printf+0x2c>
        printint(fd, *ap, 16, 0);
 65f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 662:	8b 17                	mov    (%edi),%edx
 664:	83 ec 0c             	sub    $0xc,%esp
 667:	6a 00                	push   $0x0
 669:	b9 10 00 00 00       	mov    $0x10,%ecx
 66e:	8b 45 08             	mov    0x8(%ebp),%eax
 671:	e8 b2 fe ff ff       	call   528 <printint>
        ap++;
 676:	83 c7 04             	add    $0x4,%edi
 679:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 67c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67f:	be 00 00 00 00       	mov    $0x0,%esi
 684:	e9 56 ff ff ff       	jmp    5df <printf+0x2c>
        s = (char*)*ap;
 689:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 68c:	8b 30                	mov    (%eax),%esi
        ap++;
 68e:	83 c0 04             	add    $0x4,%eax
 691:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 694:	85 f6                	test   %esi,%esi
 696:	75 15                	jne    6ad <printf+0xfa>
          s = "(null)";
 698:	be 1c 09 00 00       	mov    $0x91c,%esi
 69d:	eb 0e                	jmp    6ad <printf+0xfa>
          putc(fd, *s);
 69f:	0f be d2             	movsbl %dl,%edx
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	e8 64 fe ff ff       	call   50e <putc>
          s++;
 6aa:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6ad:	0f b6 16             	movzbl (%esi),%edx
 6b0:	84 d2                	test   %dl,%dl
 6b2:	75 eb                	jne    69f <printf+0xec>
      state = 0;
 6b4:	be 00 00 00 00       	mov    $0x0,%esi
 6b9:	e9 21 ff ff ff       	jmp    5df <printf+0x2c>
        putc(fd, *ap);
 6be:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c1:	0f be 17             	movsbl (%edi),%edx
 6c4:	8b 45 08             	mov    0x8(%ebp),%eax
 6c7:	e8 42 fe ff ff       	call   50e <putc>
        ap++;
 6cc:	83 c7 04             	add    $0x4,%edi
 6cf:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6d2:	be 00 00 00 00       	mov    $0x0,%esi
 6d7:	e9 03 ff ff ff       	jmp    5df <printf+0x2c>
        putc(fd, c);
 6dc:	89 fa                	mov    %edi,%edx
 6de:	8b 45 08             	mov    0x8(%ebp),%eax
 6e1:	e8 28 fe ff ff       	call   50e <putc>
      state = 0;
 6e6:	be 00 00 00 00       	mov    $0x0,%esi
 6eb:	e9 ef fe ff ff       	jmp    5df <printf+0x2c>
        putc(fd, '%');
 6f0:	ba 25 00 00 00       	mov    $0x25,%edx
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	e8 11 fe ff ff       	call   50e <putc>
        putc(fd, c);
 6fd:	89 fa                	mov    %edi,%edx
 6ff:	8b 45 08             	mov    0x8(%ebp),%eax
 702:	e8 07 fe ff ff       	call   50e <putc>
      state = 0;
 707:	be 00 00 00 00       	mov    $0x0,%esi
 70c:	e9 ce fe ff ff       	jmp    5df <printf+0x2c>
    }
  }
}
 711:	8d 65 f4             	lea    -0xc(%ebp),%esp
 714:	5b                   	pop    %ebx
 715:	5e                   	pop    %esi
 716:	5f                   	pop    %edi
 717:	5d                   	pop    %ebp
 718:	c3                   	ret    

00000719 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 719:	55                   	push   %ebp
 71a:	89 e5                	mov    %esp,%ebp
 71c:	57                   	push   %edi
 71d:	56                   	push   %esi
 71e:	53                   	push   %ebx
 71f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 722:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 725:	a1 ec 0c 00 00       	mov    0xcec,%eax
 72a:	eb 02                	jmp    72e <free+0x15>
 72c:	89 d0                	mov    %edx,%eax
 72e:	39 c8                	cmp    %ecx,%eax
 730:	73 04                	jae    736 <free+0x1d>
 732:	39 08                	cmp    %ecx,(%eax)
 734:	77 12                	ja     748 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 736:	8b 10                	mov    (%eax),%edx
 738:	39 c2                	cmp    %eax,%edx
 73a:	77 f0                	ja     72c <free+0x13>
 73c:	39 c8                	cmp    %ecx,%eax
 73e:	72 08                	jb     748 <free+0x2f>
 740:	39 ca                	cmp    %ecx,%edx
 742:	77 04                	ja     748 <free+0x2f>
 744:	89 d0                	mov    %edx,%eax
 746:	eb e6                	jmp    72e <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 748:	8b 73 fc             	mov    -0x4(%ebx),%esi
 74b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 74e:	8b 10                	mov    (%eax),%edx
 750:	39 d7                	cmp    %edx,%edi
 752:	74 19                	je     76d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 754:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 757:	8b 50 04             	mov    0x4(%eax),%edx
 75a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 75d:	39 ce                	cmp    %ecx,%esi
 75f:	74 1b                	je     77c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 761:	89 08                	mov    %ecx,(%eax)
  freep = p;
 763:	a3 ec 0c 00 00       	mov    %eax,0xcec
}
 768:	5b                   	pop    %ebx
 769:	5e                   	pop    %esi
 76a:	5f                   	pop    %edi
 76b:	5d                   	pop    %ebp
 76c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 76d:	03 72 04             	add    0x4(%edx),%esi
 770:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 773:	8b 10                	mov    (%eax),%edx
 775:	8b 12                	mov    (%edx),%edx
 777:	89 53 f8             	mov    %edx,-0x8(%ebx)
 77a:	eb db                	jmp    757 <free+0x3e>
    p->s.size += bp->s.size;
 77c:	03 53 fc             	add    -0x4(%ebx),%edx
 77f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 782:	8b 53 f8             	mov    -0x8(%ebx),%edx
 785:	89 10                	mov    %edx,(%eax)
 787:	eb da                	jmp    763 <free+0x4a>

00000789 <morecore>:

static Header*
morecore(uint nu)
{
 789:	55                   	push   %ebp
 78a:	89 e5                	mov    %esp,%ebp
 78c:	53                   	push   %ebx
 78d:	83 ec 04             	sub    $0x4,%esp
 790:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 792:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 797:	77 05                	ja     79e <morecore+0x15>
    nu = 4096;
 799:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 79e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7a5:	83 ec 0c             	sub    $0xc,%esp
 7a8:	50                   	push   %eax
 7a9:	e8 38 fd ff ff       	call   4e6 <sbrk>
  if(p == (char*)-1)
 7ae:	83 c4 10             	add    $0x10,%esp
 7b1:	83 f8 ff             	cmp    $0xffffffff,%eax
 7b4:	74 1c                	je     7d2 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7b6:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7b9:	83 c0 08             	add    $0x8,%eax
 7bc:	83 ec 0c             	sub    $0xc,%esp
 7bf:	50                   	push   %eax
 7c0:	e8 54 ff ff ff       	call   719 <free>
  return freep;
 7c5:	a1 ec 0c 00 00       	mov    0xcec,%eax
 7ca:	83 c4 10             	add    $0x10,%esp
}
 7cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7d0:	c9                   	leave  
 7d1:	c3                   	ret    
    return 0;
 7d2:	b8 00 00 00 00       	mov    $0x0,%eax
 7d7:	eb f4                	jmp    7cd <morecore+0x44>

000007d9 <malloc>:

void*
malloc(uint nbytes)
{
 7d9:	55                   	push   %ebp
 7da:	89 e5                	mov    %esp,%ebp
 7dc:	53                   	push   %ebx
 7dd:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e0:	8b 45 08             	mov    0x8(%ebp),%eax
 7e3:	8d 58 07             	lea    0x7(%eax),%ebx
 7e6:	c1 eb 03             	shr    $0x3,%ebx
 7e9:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7ec:	8b 0d ec 0c 00 00    	mov    0xcec,%ecx
 7f2:	85 c9                	test   %ecx,%ecx
 7f4:	74 04                	je     7fa <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f6:	8b 01                	mov    (%ecx),%eax
 7f8:	eb 4a                	jmp    844 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7fa:	c7 05 ec 0c 00 00 f0 	movl   $0xcf0,0xcec
 801:	0c 00 00 
 804:	c7 05 f0 0c 00 00 f0 	movl   $0xcf0,0xcf0
 80b:	0c 00 00 
    base.s.size = 0;
 80e:	c7 05 f4 0c 00 00 00 	movl   $0x0,0xcf4
 815:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 818:	b9 f0 0c 00 00       	mov    $0xcf0,%ecx
 81d:	eb d7                	jmp    7f6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 81f:	74 19                	je     83a <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 821:	29 da                	sub    %ebx,%edx
 823:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 826:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 829:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 82c:	89 0d ec 0c 00 00    	mov    %ecx,0xcec
      return (void*)(p + 1);
 832:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 835:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 838:	c9                   	leave  
 839:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 83a:	8b 10                	mov    (%eax),%edx
 83c:	89 11                	mov    %edx,(%ecx)
 83e:	eb ec                	jmp    82c <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 840:	89 c1                	mov    %eax,%ecx
 842:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 844:	8b 50 04             	mov    0x4(%eax),%edx
 847:	39 da                	cmp    %ebx,%edx
 849:	73 d4                	jae    81f <malloc+0x46>
    if(p == freep)
 84b:	39 05 ec 0c 00 00    	cmp    %eax,0xcec
 851:	75 ed                	jne    840 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 853:	89 d8                	mov    %ebx,%eax
 855:	e8 2f ff ff ff       	call   789 <morecore>
 85a:	85 c0                	test   %eax,%eax
 85c:	75 e2                	jne    840 <malloc+0x67>
 85e:	eb d5                	jmp    835 <malloc+0x5c>
