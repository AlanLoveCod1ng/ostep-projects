
_test_4:     file format elf32-i386


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
   exit();
   6:	e8 90 04 00 00       	call   49b <exit>

0000000b <main>:
{
   b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   f:	83 e4 f0             	and    $0xfffffff0,%esp
  12:	ff 71 fc             	push   -0x4(%ecx)
  15:	55                   	push   %ebp
  16:	89 e5                	mov    %esp,%ebp
  18:	56                   	push   %esi
  19:	53                   	push   %ebx
  1a:	51                   	push   %ecx
  1b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  1e:	e8 f8 04 00 00       	call   51b <getpid>
  23:	a3 18 0d 00 00       	mov    %eax,0xd18
   void *stack, *p = malloc(PGSIZE * 2);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	68 00 20 00 00       	push   $0x2000
  30:	e8 e1 07 00 00       	call   816 <malloc>
   assert(p != NULL);
  35:	83 c4 10             	add    $0x10,%esp
  38:	85 c0                	test   %eax,%eax
  3a:	74 70                	je     ac <main+0xa1>
  3c:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE == 0)
  3e:	a9 ff 0f 00 00       	test   $0xfff,%eax
  43:	75 03                	jne    48 <main+0x3d>
     stack = p + 4;
  45:	8d 40 04             	lea    0x4(%eax),%eax
   assert(clone(worker, 0, 0, stack) == -1);
  48:	50                   	push   %eax
  49:	6a 00                	push   $0x0
  4b:	6a 00                	push   $0x0
  4d:	68 00 00 00 00       	push   $0x0
  52:	e8 e4 04 00 00       	call   53b <clone>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	83 f8 ff             	cmp    $0xffffffff,%eax
  5d:	0f 84 92 00 00 00    	je     f5 <main+0xea>
  63:	6a 21                	push   $0x21
  65:	68 a0 08 00 00       	push   $0x8a0
  6a:	68 a9 08 00 00       	push   $0x8a9
  6f:	6a 01                	push   $0x1
  71:	e8 7a 05 00 00       	call   5f0 <printf>
  76:	83 c4 0c             	add    $0xc,%esp
  79:	68 04 09 00 00       	push   $0x904
  7e:	68 bb 08 00 00       	push   $0x8bb
  83:	6a 01                	push   $0x1
  85:	e8 66 05 00 00       	call   5f0 <printf>
  8a:	83 c4 08             	add    $0x8,%esp
  8d:	68 cf 08 00 00       	push   $0x8cf
  92:	6a 01                	push   $0x1
  94:	e8 57 05 00 00       	call   5f0 <printf>
  99:	83 c4 04             	add    $0x4,%esp
  9c:	ff 35 18 0d 00 00    	push   0xd18
  a2:	e8 24 04 00 00       	call   4cb <kill>
  a7:	e8 ef 03 00 00       	call   49b <exit>
   assert(p != NULL);
  ac:	6a 1b                	push   $0x1b
  ae:	68 a0 08 00 00       	push   $0x8a0
  b3:	68 a9 08 00 00       	push   $0x8a9
  b8:	6a 01                	push   $0x1
  ba:	e8 31 05 00 00       	call   5f0 <printf>
  bf:	83 c4 0c             	add    $0xc,%esp
  c2:	68 b1 08 00 00       	push   $0x8b1
  c7:	68 bb 08 00 00       	push   $0x8bb
  cc:	6a 01                	push   $0x1
  ce:	e8 1d 05 00 00       	call   5f0 <printf>
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	68 cf 08 00 00       	push   $0x8cf
  db:	6a 01                	push   $0x1
  dd:	e8 0e 05 00 00       	call   5f0 <printf>
  e2:	83 c4 04             	add    $0x4,%esp
  e5:	ff 35 18 0d 00 00    	push   0xd18
  eb:	e8 db 03 00 00       	call   4cb <kill>
  f0:	e8 a6 03 00 00       	call   49b <exit>
   stack = sbrk(0);
  f5:	83 ec 0c             	sub    $0xc,%esp
  f8:	6a 00                	push   $0x0
  fa:	e8 24 04 00 00       	call   523 <sbrk>
  ff:	89 c6                	mov    %eax,%esi
   if((uint)stack % PGSIZE)
 101:	83 c4 10             	add    $0x10,%esp
 104:	89 c2                	mov    %eax,%edx
 106:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 10c:	74 09                	je     117 <main+0x10c>
     stack = stack + (PGSIZE - (uint)stack % PGSIZE);
 10e:	b8 00 10 00 00       	mov    $0x1000,%eax
 113:	29 d0                	sub    %edx,%eax
 115:	01 c6                	add    %eax,%esi
   sbrk( ((uint)stack - (uint)sbrk(0)) + PGSIZE/2 );
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	6a 00                	push   $0x0
 11c:	e8 02 04 00 00       	call   523 <sbrk>
 121:	89 c2                	mov    %eax,%edx
 123:	89 f0                	mov    %esi,%eax
 125:	29 d0                	sub    %edx,%eax
 127:	05 00 08 00 00       	add    $0x800,%eax
 12c:	89 04 24             	mov    %eax,(%esp)
 12f:	e8 ef 03 00 00       	call   523 <sbrk>
   assert((uint)stack % PGSIZE == 0);
 134:	83 c4 10             	add    $0x10,%esp
 137:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
 13d:	74 49                	je     188 <main+0x17d>
 13f:	6a 27                	push   $0x27
 141:	68 a0 08 00 00       	push   $0x8a0
 146:	68 a9 08 00 00       	push   $0x8a9
 14b:	6a 01                	push   $0x1
 14d:	e8 9e 04 00 00       	call   5f0 <printf>
 152:	83 c4 0c             	add    $0xc,%esp
 155:	68 dc 08 00 00       	push   $0x8dc
 15a:	68 bb 08 00 00       	push   $0x8bb
 15f:	6a 01                	push   $0x1
 161:	e8 8a 04 00 00       	call   5f0 <printf>
 166:	83 c4 08             	add    $0x8,%esp
 169:	68 cf 08 00 00       	push   $0x8cf
 16e:	6a 01                	push   $0x1
 170:	e8 7b 04 00 00       	call   5f0 <printf>
 175:	83 c4 04             	add    $0x4,%esp
 178:	ff 35 18 0d 00 00    	push   0xd18
 17e:	e8 48 03 00 00       	call   4cb <kill>
 183:	e8 13 03 00 00       	call   49b <exit>
   assert((uint)sbrk(0) - (uint)stack == PGSIZE/2);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	6a 00                	push   $0x0
 18d:	e8 91 03 00 00       	call   523 <sbrk>
 192:	29 f0                	sub    %esi,%eax
 194:	83 c4 10             	add    $0x10,%esp
 197:	3d 00 08 00 00       	cmp    $0x800,%eax
 19c:	74 49                	je     1e7 <main+0x1dc>
 19e:	6a 28                	push   $0x28
 1a0:	68 a0 08 00 00       	push   $0x8a0
 1a5:	68 a9 08 00 00       	push   $0x8a9
 1aa:	6a 01                	push   $0x1
 1ac:	e8 3f 04 00 00       	call   5f0 <printf>
 1b1:	83 c4 0c             	add    $0xc,%esp
 1b4:	68 28 09 00 00       	push   $0x928
 1b9:	68 bb 08 00 00       	push   $0x8bb
 1be:	6a 01                	push   $0x1
 1c0:	e8 2b 04 00 00       	call   5f0 <printf>
 1c5:	83 c4 08             	add    $0x8,%esp
 1c8:	68 cf 08 00 00       	push   $0x8cf
 1cd:	6a 01                	push   $0x1
 1cf:	e8 1c 04 00 00       	call   5f0 <printf>
 1d4:	83 c4 04             	add    $0x4,%esp
 1d7:	ff 35 18 0d 00 00    	push   0xd18
 1dd:	e8 e9 02 00 00       	call   4cb <kill>
 1e2:	e8 b4 02 00 00       	call   49b <exit>
   assert(clone(worker, 0, 0, stack) == -1);
 1e7:	56                   	push   %esi
 1e8:	6a 00                	push   $0x0
 1ea:	6a 00                	push   $0x0
 1ec:	68 00 00 00 00       	push   $0x0
 1f1:	e8 45 03 00 00       	call   53b <clone>
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	83 f8 ff             	cmp    $0xffffffff,%eax
 1fc:	74 49                	je     247 <main+0x23c>
 1fe:	6a 2a                	push   $0x2a
 200:	68 a0 08 00 00       	push   $0x8a0
 205:	68 a9 08 00 00       	push   $0x8a9
 20a:	6a 01                	push   $0x1
 20c:	e8 df 03 00 00       	call   5f0 <printf>
 211:	83 c4 0c             	add    $0xc,%esp
 214:	68 04 09 00 00       	push   $0x904
 219:	68 bb 08 00 00       	push   $0x8bb
 21e:	6a 01                	push   $0x1
 220:	e8 cb 03 00 00       	call   5f0 <printf>
 225:	83 c4 08             	add    $0x8,%esp
 228:	68 cf 08 00 00       	push   $0x8cf
 22d:	6a 01                	push   $0x1
 22f:	e8 bc 03 00 00       	call   5f0 <printf>
 234:	83 c4 04             	add    $0x4,%esp
 237:	ff 35 18 0d 00 00    	push   0xd18
 23d:	e8 89 02 00 00       	call   4cb <kill>
 242:	e8 54 02 00 00       	call   49b <exit>
   printf(1, "TEST PASSED\n");
 247:	83 ec 08             	sub    $0x8,%esp
 24a:	68 f6 08 00 00       	push   $0x8f6
 24f:	6a 01                	push   $0x1
 251:	e8 9a 03 00 00       	call   5f0 <printf>
   free(p);
 256:	89 1c 24             	mov    %ebx,(%esp)
 259:	e8 f8 04 00 00       	call   756 <free>
   exit();
 25e:	e8 38 02 00 00       	call   49b <exit>

00000263 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 26e:	89 f0                	mov    %esi,%eax
 270:	89 d1                	mov    %edx,%ecx
 272:	83 c2 01             	add    $0x1,%edx
 275:	89 c3                	mov    %eax,%ebx
 277:	83 c0 01             	add    $0x1,%eax
 27a:	0f b6 09             	movzbl (%ecx),%ecx
 27d:	88 0b                	mov    %cl,(%ebx)
 27f:	84 c9                	test   %cl,%cl
 281:	75 ed                	jne    270 <strcpy+0xd>
    ;
  return os;
}
 283:	89 f0                	mov    %esi,%eax
 285:	5b                   	pop    %ebx
 286:	5e                   	pop    %esi
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    

00000289 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 292:	eb 06                	jmp    29a <strcmp+0x11>
    p++, q++;
 294:	83 c1 01             	add    $0x1,%ecx
 297:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 29a:	0f b6 01             	movzbl (%ecx),%eax
 29d:	84 c0                	test   %al,%al
 29f:	74 04                	je     2a5 <strcmp+0x1c>
 2a1:	3a 02                	cmp    (%edx),%al
 2a3:	74 ef                	je     294 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2a5:	0f b6 c0             	movzbl %al,%eax
 2a8:	0f b6 12             	movzbl (%edx),%edx
 2ab:	29 d0                	sub    %edx,%eax
}
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    

000002af <strlen>:

uint
strlen(const char *s)
{
 2af:	55                   	push   %ebp
 2b0:	89 e5                	mov    %esp,%ebp
 2b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2b5:	b8 00 00 00 00       	mov    $0x0,%eax
 2ba:	eb 03                	jmp    2bf <strlen+0x10>
 2bc:	83 c0 01             	add    $0x1,%eax
 2bf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2c3:	75 f7                	jne    2bc <strlen+0xd>
    ;
  return n;
}
 2c5:	5d                   	pop    %ebp
 2c6:	c3                   	ret    

000002c7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	57                   	push   %edi
 2cb:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2ce:	89 d7                	mov    %edx,%edi
 2d0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d6:	fc                   	cld    
 2d7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d9:	89 d0                	mov    %edx,%eax
 2db:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2de:	c9                   	leave  
 2df:	c3                   	ret    

000002e0 <strchr>:

char*
strchr(const char *s, char c)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ea:	eb 03                	jmp    2ef <strchr+0xf>
 2ec:	83 c0 01             	add    $0x1,%eax
 2ef:	0f b6 10             	movzbl (%eax),%edx
 2f2:	84 d2                	test   %dl,%dl
 2f4:	74 06                	je     2fc <strchr+0x1c>
    if(*s == c)
 2f6:	38 ca                	cmp    %cl,%dl
 2f8:	75 f2                	jne    2ec <strchr+0xc>
 2fa:	eb 05                	jmp    301 <strchr+0x21>
      return (char*)s;
  return 0;
 2fc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    

00000303 <gets>:

char*
gets(char *buf, int max)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	57                   	push   %edi
 307:	56                   	push   %esi
 308:	53                   	push   %ebx
 309:	83 ec 1c             	sub    $0x1c,%esp
 30c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 30f:	bb 00 00 00 00       	mov    $0x0,%ebx
 314:	89 de                	mov    %ebx,%esi
 316:	83 c3 01             	add    $0x1,%ebx
 319:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31c:	7d 2e                	jge    34c <gets+0x49>
    cc = read(0, &c, 1);
 31e:	83 ec 04             	sub    $0x4,%esp
 321:	6a 01                	push   $0x1
 323:	8d 45 e7             	lea    -0x19(%ebp),%eax
 326:	50                   	push   %eax
 327:	6a 00                	push   $0x0
 329:	e8 85 01 00 00       	call   4b3 <read>
    if(cc < 1)
 32e:	83 c4 10             	add    $0x10,%esp
 331:	85 c0                	test   %eax,%eax
 333:	7e 17                	jle    34c <gets+0x49>
      break;
    buf[i++] = c;
 335:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 339:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 33c:	3c 0a                	cmp    $0xa,%al
 33e:	0f 94 c2             	sete   %dl
 341:	3c 0d                	cmp    $0xd,%al
 343:	0f 94 c0             	sete   %al
 346:	08 c2                	or     %al,%dl
 348:	74 ca                	je     314 <gets+0x11>
    buf[i++] = c;
 34a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 34c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 350:	89 f8                	mov    %edi,%eax
 352:	8d 65 f4             	lea    -0xc(%ebp),%esp
 355:	5b                   	pop    %ebx
 356:	5e                   	pop    %esi
 357:	5f                   	pop    %edi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <stat>:

int
stat(const char *n, struct stat *st)
{
 35a:	55                   	push   %ebp
 35b:	89 e5                	mov    %esp,%ebp
 35d:	56                   	push   %esi
 35e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 35f:	83 ec 08             	sub    $0x8,%esp
 362:	6a 00                	push   $0x0
 364:	ff 75 08             	push   0x8(%ebp)
 367:	e8 6f 01 00 00       	call   4db <open>
  if(fd < 0)
 36c:	83 c4 10             	add    $0x10,%esp
 36f:	85 c0                	test   %eax,%eax
 371:	78 24                	js     397 <stat+0x3d>
 373:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 375:	83 ec 08             	sub    $0x8,%esp
 378:	ff 75 0c             	push   0xc(%ebp)
 37b:	50                   	push   %eax
 37c:	e8 72 01 00 00       	call   4f3 <fstat>
 381:	89 c6                	mov    %eax,%esi
  close(fd);
 383:	89 1c 24             	mov    %ebx,(%esp)
 386:	e8 38 01 00 00       	call   4c3 <close>
  return r;
 38b:	83 c4 10             	add    $0x10,%esp
}
 38e:	89 f0                	mov    %esi,%eax
 390:	8d 65 f8             	lea    -0x8(%ebp),%esp
 393:	5b                   	pop    %ebx
 394:	5e                   	pop    %esi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    
    return -1;
 397:	be ff ff ff ff       	mov    $0xffffffff,%esi
 39c:	eb f0                	jmp    38e <stat+0x34>

0000039e <atoi>:

int
atoi(const char *s)
{
 39e:	55                   	push   %ebp
 39f:	89 e5                	mov    %esp,%ebp
 3a1:	53                   	push   %ebx
 3a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3a5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3aa:	eb 10                	jmp    3bc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3ac:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3af:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3b2:	83 c1 01             	add    $0x1,%ecx
 3b5:	0f be c0             	movsbl %al,%eax
 3b8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3bc:	0f b6 01             	movzbl (%ecx),%eax
 3bf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c2:	80 fb 09             	cmp    $0x9,%bl
 3c5:	76 e5                	jbe    3ac <atoi+0xe>
  return n;
}
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cc:	c9                   	leave  
 3cd:	c3                   	ret    

000003ce <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	56                   	push   %esi
 3d2:	53                   	push   %ebx
 3d3:	8b 75 08             	mov    0x8(%ebp),%esi
 3d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3dc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3de:	eb 0d                	jmp    3ed <memmove+0x1f>
    *dst++ = *src++;
 3e0:	0f b6 01             	movzbl (%ecx),%eax
 3e3:	88 02                	mov    %al,(%edx)
 3e5:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3eb:	89 d8                	mov    %ebx,%eax
 3ed:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3f0:	85 c0                	test   %eax,%eax
 3f2:	7f ec                	jg     3e0 <memmove+0x12>
  return vdst;
}
 3f4:	89 f0                	mov    %esi,%eax
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5d                   	pop    %ebp
 3f9:	c3                   	ret    

000003fa <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 3fa:	55                   	push   %ebp
 3fb:	89 e5                	mov    %esp,%ebp
 3fd:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 400:	68 00 20 00 00       	push   $0x2000
 405:	e8 0c 04 00 00       	call   816 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 40a:	83 c4 10             	add    $0x10,%esp
 40d:	a9 ff 0f 00 00       	test   $0xfff,%eax
 412:	74 0a                	je     41e <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 414:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 419:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 41e:	50                   	push   %eax
 41f:	ff 75 10             	push   0x10(%ebp)
 422:	ff 75 0c             	push   0xc(%ebp)
 425:	ff 75 08             	push   0x8(%ebp)
 428:	e8 0e 01 00 00       	call   53b <clone>
  return pid;
}
 42d:	c9                   	leave  
 42e:	c3                   	ret    

0000042f <thread_join>:
int
thread_join()
{
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	53                   	push   %ebx
 433:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 436:	8d 45 f4             	lea    -0xc(%ebp),%eax
 439:	50                   	push   %eax
 43a:	e8 04 01 00 00       	call   543 <join>
 43f:	89 c3                	mov    %eax,%ebx
  free(stack);
 441:	83 c4 04             	add    $0x4,%esp
 444:	ff 75 f4             	push   -0xc(%ebp)
 447:	e8 0a 03 00 00       	call   756 <free>
  return pid;
}
 44c:	89 d8                	mov    %ebx,%eax
 44e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 451:	c9                   	leave  
 452:	c3                   	ret    

00000453 <lock_init>:
int
lock_init(lock_t * lock){
 453:	55                   	push   %ebp
 454:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 456:	8b 45 08             	mov    0x8(%ebp),%eax
 459:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 45f:	b8 00 00 00 00       	mov    $0x0,%eax
 464:	5d                   	pop    %ebp
 465:	c3                   	ret    

00000466 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 46c:	b8 01 00 00 00       	mov    $0x1,%eax
 471:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 474:	83 f8 01             	cmp    $0x1,%eax
 477:	74 f3                	je     46c <lock_acquire+0x6>
  {

  }
  return 0;
}
 479:	b8 00 00 00 00       	mov    $0x0,%eax
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    

00000480 <lock_release>:
int
lock_release(lock_t * lock){
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 48c:	b8 00 00 00 00       	mov    $0x0,%eax
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    

00000493 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 493:	b8 01 00 00 00       	mov    $0x1,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <exit>:
SYSCALL(exit)
 49b:	b8 02 00 00 00       	mov    $0x2,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <wait>:
SYSCALL(wait)
 4a3:	b8 03 00 00 00       	mov    $0x3,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <pipe>:
SYSCALL(pipe)
 4ab:	b8 04 00 00 00       	mov    $0x4,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <read>:
SYSCALL(read)
 4b3:	b8 05 00 00 00       	mov    $0x5,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <write>:
SYSCALL(write)
 4bb:	b8 10 00 00 00       	mov    $0x10,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <close>:
SYSCALL(close)
 4c3:	b8 15 00 00 00       	mov    $0x15,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <kill>:
SYSCALL(kill)
 4cb:	b8 06 00 00 00       	mov    $0x6,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <exec>:
SYSCALL(exec)
 4d3:	b8 07 00 00 00       	mov    $0x7,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <open>:
SYSCALL(open)
 4db:	b8 0f 00 00 00       	mov    $0xf,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <mknod>:
SYSCALL(mknod)
 4e3:	b8 11 00 00 00       	mov    $0x11,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <unlink>:
SYSCALL(unlink)
 4eb:	b8 12 00 00 00       	mov    $0x12,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <fstat>:
SYSCALL(fstat)
 4f3:	b8 08 00 00 00       	mov    $0x8,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <link>:
SYSCALL(link)
 4fb:	b8 13 00 00 00       	mov    $0x13,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <mkdir>:
SYSCALL(mkdir)
 503:	b8 14 00 00 00       	mov    $0x14,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <chdir>:
SYSCALL(chdir)
 50b:	b8 09 00 00 00       	mov    $0x9,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <dup>:
SYSCALL(dup)
 513:	b8 0a 00 00 00       	mov    $0xa,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <getpid>:
SYSCALL(getpid)
 51b:	b8 0b 00 00 00       	mov    $0xb,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <sbrk>:
SYSCALL(sbrk)
 523:	b8 0c 00 00 00       	mov    $0xc,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <sleep>:
SYSCALL(sleep)
 52b:	b8 0d 00 00 00       	mov    $0xd,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <uptime>:
SYSCALL(uptime)
 533:	b8 0e 00 00 00       	mov    $0xe,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <clone>:
SYSCALL(clone)
 53b:	b8 16 00 00 00       	mov    $0x16,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <join>:
SYSCALL(join)
 543:	b8 17 00 00 00       	mov    $0x17,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 54b:	55                   	push   %ebp
 54c:	89 e5                	mov    %esp,%ebp
 54e:	83 ec 1c             	sub    $0x1c,%esp
 551:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 554:	6a 01                	push   $0x1
 556:	8d 55 f4             	lea    -0xc(%ebp),%edx
 559:	52                   	push   %edx
 55a:	50                   	push   %eax
 55b:	e8 5b ff ff ff       	call   4bb <write>
}
 560:	83 c4 10             	add    $0x10,%esp
 563:	c9                   	leave  
 564:	c3                   	ret    

00000565 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 565:	55                   	push   %ebp
 566:	89 e5                	mov    %esp,%ebp
 568:	57                   	push   %edi
 569:	56                   	push   %esi
 56a:	53                   	push   %ebx
 56b:	83 ec 2c             	sub    $0x2c,%esp
 56e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 571:	89 d0                	mov    %edx,%eax
 573:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 575:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 579:	0f 95 c1             	setne  %cl
 57c:	c1 ea 1f             	shr    $0x1f,%edx
 57f:	84 d1                	test   %dl,%cl
 581:	74 44                	je     5c7 <printint+0x62>
    neg = 1;
    x = -xx;
 583:	f7 d8                	neg    %eax
 585:	89 c1                	mov    %eax,%ecx
    neg = 1;
 587:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 58e:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 593:	89 c8                	mov    %ecx,%eax
 595:	ba 00 00 00 00       	mov    $0x0,%edx
 59a:	f7 f6                	div    %esi
 59c:	89 df                	mov    %ebx,%edi
 59e:	83 c3 01             	add    $0x1,%ebx
 5a1:	0f b6 92 b0 09 00 00 	movzbl 0x9b0(%edx),%edx
 5a8:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5ac:	89 ca                	mov    %ecx,%edx
 5ae:	89 c1                	mov    %eax,%ecx
 5b0:	39 d6                	cmp    %edx,%esi
 5b2:	76 df                	jbe    593 <printint+0x2e>
  if(neg)
 5b4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5b8:	74 31                	je     5eb <printint+0x86>
    buf[i++] = '-';
 5ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5bf:	8d 5f 02             	lea    0x2(%edi),%ebx
 5c2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5c5:	eb 17                	jmp    5de <printint+0x79>
    x = xx;
 5c7:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5c9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5d0:	eb bc                	jmp    58e <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5d2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5d7:	89 f0                	mov    %esi,%eax
 5d9:	e8 6d ff ff ff       	call   54b <putc>
  while(--i >= 0)
 5de:	83 eb 01             	sub    $0x1,%ebx
 5e1:	79 ef                	jns    5d2 <printint+0x6d>
}
 5e3:	83 c4 2c             	add    $0x2c,%esp
 5e6:	5b                   	pop    %ebx
 5e7:	5e                   	pop    %esi
 5e8:	5f                   	pop    %edi
 5e9:	5d                   	pop    %ebp
 5ea:	c3                   	ret    
 5eb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5ee:	eb ee                	jmp    5de <printint+0x79>

000005f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5f9:	8d 45 10             	lea    0x10(%ebp),%eax
 5fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5ff:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 604:	bb 00 00 00 00       	mov    $0x0,%ebx
 609:	eb 14                	jmp    61f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 60b:	89 fa                	mov    %edi,%edx
 60d:	8b 45 08             	mov    0x8(%ebp),%eax
 610:	e8 36 ff ff ff       	call   54b <putc>
 615:	eb 05                	jmp    61c <printf+0x2c>
      }
    } else if(state == '%'){
 617:	83 fe 25             	cmp    $0x25,%esi
 61a:	74 25                	je     641 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 61c:	83 c3 01             	add    $0x1,%ebx
 61f:	8b 45 0c             	mov    0xc(%ebp),%eax
 622:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 626:	84 c0                	test   %al,%al
 628:	0f 84 20 01 00 00    	je     74e <printf+0x15e>
    c = fmt[i] & 0xff;
 62e:	0f be f8             	movsbl %al,%edi
 631:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 634:	85 f6                	test   %esi,%esi
 636:	75 df                	jne    617 <printf+0x27>
      if(c == '%'){
 638:	83 f8 25             	cmp    $0x25,%eax
 63b:	75 ce                	jne    60b <printf+0x1b>
        state = '%';
 63d:	89 c6                	mov    %eax,%esi
 63f:	eb db                	jmp    61c <printf+0x2c>
      if(c == 'd'){
 641:	83 f8 25             	cmp    $0x25,%eax
 644:	0f 84 cf 00 00 00    	je     719 <printf+0x129>
 64a:	0f 8c dd 00 00 00    	jl     72d <printf+0x13d>
 650:	83 f8 78             	cmp    $0x78,%eax
 653:	0f 8f d4 00 00 00    	jg     72d <printf+0x13d>
 659:	83 f8 63             	cmp    $0x63,%eax
 65c:	0f 8c cb 00 00 00    	jl     72d <printf+0x13d>
 662:	83 e8 63             	sub    $0x63,%eax
 665:	83 f8 15             	cmp    $0x15,%eax
 668:	0f 87 bf 00 00 00    	ja     72d <printf+0x13d>
 66e:	ff 24 85 58 09 00 00 	jmp    *0x958(,%eax,4)
        printint(fd, *ap, 10, 1);
 675:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 678:	8b 17                	mov    (%edi),%edx
 67a:	83 ec 0c             	sub    $0xc,%esp
 67d:	6a 01                	push   $0x1
 67f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	e8 d9 fe ff ff       	call   565 <printint>
        ap++;
 68c:	83 c7 04             	add    $0x4,%edi
 68f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 692:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 695:	be 00 00 00 00       	mov    $0x0,%esi
 69a:	eb 80                	jmp    61c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 69c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 69f:	8b 17                	mov    (%edi),%edx
 6a1:	83 ec 0c             	sub    $0xc,%esp
 6a4:	6a 00                	push   $0x0
 6a6:	b9 10 00 00 00       	mov    $0x10,%ecx
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	e8 b2 fe ff ff       	call   565 <printint>
        ap++;
 6b3:	83 c7 04             	add    $0x4,%edi
 6b6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6b9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6bc:	be 00 00 00 00       	mov    $0x0,%esi
 6c1:	e9 56 ff ff ff       	jmp    61c <printf+0x2c>
        s = (char*)*ap;
 6c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c9:	8b 30                	mov    (%eax),%esi
        ap++;
 6cb:	83 c0 04             	add    $0x4,%eax
 6ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6d1:	85 f6                	test   %esi,%esi
 6d3:	75 15                	jne    6ea <printf+0xfa>
          s = "(null)";
 6d5:	be 50 09 00 00       	mov    $0x950,%esi
 6da:	eb 0e                	jmp    6ea <printf+0xfa>
          putc(fd, *s);
 6dc:	0f be d2             	movsbl %dl,%edx
 6df:	8b 45 08             	mov    0x8(%ebp),%eax
 6e2:	e8 64 fe ff ff       	call   54b <putc>
          s++;
 6e7:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6ea:	0f b6 16             	movzbl (%esi),%edx
 6ed:	84 d2                	test   %dl,%dl
 6ef:	75 eb                	jne    6dc <printf+0xec>
      state = 0;
 6f1:	be 00 00 00 00       	mov    $0x0,%esi
 6f6:	e9 21 ff ff ff       	jmp    61c <printf+0x2c>
        putc(fd, *ap);
 6fb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6fe:	0f be 17             	movsbl (%edi),%edx
 701:	8b 45 08             	mov    0x8(%ebp),%eax
 704:	e8 42 fe ff ff       	call   54b <putc>
        ap++;
 709:	83 c7 04             	add    $0x4,%edi
 70c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 70f:	be 00 00 00 00       	mov    $0x0,%esi
 714:	e9 03 ff ff ff       	jmp    61c <printf+0x2c>
        putc(fd, c);
 719:	89 fa                	mov    %edi,%edx
 71b:	8b 45 08             	mov    0x8(%ebp),%eax
 71e:	e8 28 fe ff ff       	call   54b <putc>
      state = 0;
 723:	be 00 00 00 00       	mov    $0x0,%esi
 728:	e9 ef fe ff ff       	jmp    61c <printf+0x2c>
        putc(fd, '%');
 72d:	ba 25 00 00 00       	mov    $0x25,%edx
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	e8 11 fe ff ff       	call   54b <putc>
        putc(fd, c);
 73a:	89 fa                	mov    %edi,%edx
 73c:	8b 45 08             	mov    0x8(%ebp),%eax
 73f:	e8 07 fe ff ff       	call   54b <putc>
      state = 0;
 744:	be 00 00 00 00       	mov    $0x0,%esi
 749:	e9 ce fe ff ff       	jmp    61c <printf+0x2c>
    }
  }
}
 74e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 751:	5b                   	pop    %ebx
 752:	5e                   	pop    %esi
 753:	5f                   	pop    %edi
 754:	5d                   	pop    %ebp
 755:	c3                   	ret    

00000756 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 756:	55                   	push   %ebp
 757:	89 e5                	mov    %esp,%ebp
 759:	57                   	push   %edi
 75a:	56                   	push   %esi
 75b:	53                   	push   %ebx
 75c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 75f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 762:	a1 1c 0d 00 00       	mov    0xd1c,%eax
 767:	eb 02                	jmp    76b <free+0x15>
 769:	89 d0                	mov    %edx,%eax
 76b:	39 c8                	cmp    %ecx,%eax
 76d:	73 04                	jae    773 <free+0x1d>
 76f:	39 08                	cmp    %ecx,(%eax)
 771:	77 12                	ja     785 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 773:	8b 10                	mov    (%eax),%edx
 775:	39 c2                	cmp    %eax,%edx
 777:	77 f0                	ja     769 <free+0x13>
 779:	39 c8                	cmp    %ecx,%eax
 77b:	72 08                	jb     785 <free+0x2f>
 77d:	39 ca                	cmp    %ecx,%edx
 77f:	77 04                	ja     785 <free+0x2f>
 781:	89 d0                	mov    %edx,%eax
 783:	eb e6                	jmp    76b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 785:	8b 73 fc             	mov    -0x4(%ebx),%esi
 788:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78b:	8b 10                	mov    (%eax),%edx
 78d:	39 d7                	cmp    %edx,%edi
 78f:	74 19                	je     7aa <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 791:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 794:	8b 50 04             	mov    0x4(%eax),%edx
 797:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 79a:	39 ce                	cmp    %ecx,%esi
 79c:	74 1b                	je     7b9 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 79e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7a0:	a3 1c 0d 00 00       	mov    %eax,0xd1c
}
 7a5:	5b                   	pop    %ebx
 7a6:	5e                   	pop    %esi
 7a7:	5f                   	pop    %edi
 7a8:	5d                   	pop    %ebp
 7a9:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7aa:	03 72 04             	add    0x4(%edx),%esi
 7ad:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b0:	8b 10                	mov    (%eax),%edx
 7b2:	8b 12                	mov    (%edx),%edx
 7b4:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7b7:	eb db                	jmp    794 <free+0x3e>
    p->s.size += bp->s.size;
 7b9:	03 53 fc             	add    -0x4(%ebx),%edx
 7bc:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7bf:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7c2:	89 10                	mov    %edx,(%eax)
 7c4:	eb da                	jmp    7a0 <free+0x4a>

000007c6 <morecore>:

static Header*
morecore(uint nu)
{
 7c6:	55                   	push   %ebp
 7c7:	89 e5                	mov    %esp,%ebp
 7c9:	53                   	push   %ebx
 7ca:	83 ec 04             	sub    $0x4,%esp
 7cd:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7cf:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7d4:	77 05                	ja     7db <morecore+0x15>
    nu = 4096;
 7d6:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7db:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7e2:	83 ec 0c             	sub    $0xc,%esp
 7e5:	50                   	push   %eax
 7e6:	e8 38 fd ff ff       	call   523 <sbrk>
  if(p == (char*)-1)
 7eb:	83 c4 10             	add    $0x10,%esp
 7ee:	83 f8 ff             	cmp    $0xffffffff,%eax
 7f1:	74 1c                	je     80f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7f3:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7f6:	83 c0 08             	add    $0x8,%eax
 7f9:	83 ec 0c             	sub    $0xc,%esp
 7fc:	50                   	push   %eax
 7fd:	e8 54 ff ff ff       	call   756 <free>
  return freep;
 802:	a1 1c 0d 00 00       	mov    0xd1c,%eax
 807:	83 c4 10             	add    $0x10,%esp
}
 80a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80d:	c9                   	leave  
 80e:	c3                   	ret    
    return 0;
 80f:	b8 00 00 00 00       	mov    $0x0,%eax
 814:	eb f4                	jmp    80a <morecore+0x44>

00000816 <malloc>:

void*
malloc(uint nbytes)
{
 816:	55                   	push   %ebp
 817:	89 e5                	mov    %esp,%ebp
 819:	53                   	push   %ebx
 81a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 81d:	8b 45 08             	mov    0x8(%ebp),%eax
 820:	8d 58 07             	lea    0x7(%eax),%ebx
 823:	c1 eb 03             	shr    $0x3,%ebx
 826:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 829:	8b 0d 1c 0d 00 00    	mov    0xd1c,%ecx
 82f:	85 c9                	test   %ecx,%ecx
 831:	74 04                	je     837 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 833:	8b 01                	mov    (%ecx),%eax
 835:	eb 4a                	jmp    881 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 837:	c7 05 1c 0d 00 00 20 	movl   $0xd20,0xd1c
 83e:	0d 00 00 
 841:	c7 05 20 0d 00 00 20 	movl   $0xd20,0xd20
 848:	0d 00 00 
    base.s.size = 0;
 84b:	c7 05 24 0d 00 00 00 	movl   $0x0,0xd24
 852:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 855:	b9 20 0d 00 00       	mov    $0xd20,%ecx
 85a:	eb d7                	jmp    833 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 85c:	74 19                	je     877 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 85e:	29 da                	sub    %ebx,%edx
 860:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 863:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 866:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 869:	89 0d 1c 0d 00 00    	mov    %ecx,0xd1c
      return (void*)(p + 1);
 86f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 872:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 875:	c9                   	leave  
 876:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 877:	8b 10                	mov    (%eax),%edx
 879:	89 11                	mov    %edx,(%ecx)
 87b:	eb ec                	jmp    869 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87d:	89 c1                	mov    %eax,%ecx
 87f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 881:	8b 50 04             	mov    0x4(%eax),%edx
 884:	39 da                	cmp    %ebx,%edx
 886:	73 d4                	jae    85c <malloc+0x46>
    if(p == freep)
 888:	39 05 1c 0d 00 00    	cmp    %eax,0xd1c
 88e:	75 ed                	jne    87d <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 890:	89 d8                	mov    %ebx,%eax
 892:	e8 2f ff ff ff       	call   7c6 <morecore>
 897:	85 c0                	test   %eax,%eax
 899:	75 e2                	jne    87d <malloc+0x67>
 89b:	eb d5                	jmp    872 <malloc+0x5c>
