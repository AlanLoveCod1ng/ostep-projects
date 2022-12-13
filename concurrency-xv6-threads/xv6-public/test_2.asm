
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   7:	8b 55 08             	mov    0x8(%ebp),%edx
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   int tmp1 = *(int*)arg1;
   d:	8b 0a                	mov    (%edx),%ecx
   int tmp2 = *(int*)arg2;
   f:	8b 18                	mov    (%eax),%ebx
   *(int*)arg1 = 44;
  11:	c7 02 2c 00 00 00    	movl   $0x2c,(%edx)
   *(int*)arg2 = 55;
  17:	c7 00 37 00 00 00    	movl   $0x37,(%eax)
   assert(global == 1);
  1d:	a1 40 0d 00 00       	mov    0xd40,%eax
  22:	83 f8 01             	cmp    $0x1,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 38                	push   $0x38
  29:	68 e8 08 00 00       	push   $0x8e8
  2e:	68 f1 08 00 00       	push   $0x8f1
  33:	6a 01                	push   $0x1
  35:	e8 fe 05 00 00       	call   638 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 f9 08 00 00       	push   $0x8f9
  42:	68 05 09 00 00       	push   $0x905
  47:	6a 01                	push   $0x1
  49:	e8 ea 05 00 00       	call   638 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 19 09 00 00       	push   $0x919
  56:	6a 01                	push   $0x1
  58:	e8 db 05 00 00       	call   638 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 4c 0d 00 00    	push   0xd4c
  66:	e8 a8 04 00 00       	call   513 <kill>
  6b:	e8 73 04 00 00       	call   4e3 <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d 40 0d 00 00    	mov    %ecx,0xd40
   exit();
  78:	e8 66 04 00 00       	call   4e3 <exit>

0000007d <main>:
{
  7d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  81:	83 e4 f0             	and    $0xfffffff0,%esp
  84:	ff 71 fc             	push   -0x4(%ecx)
  87:	55                   	push   %ebp
  88:	89 e5                	mov    %esp,%ebp
  8a:	56                   	push   %esi
  8b:	53                   	push   %ebx
  8c:	51                   	push   %ecx
  8d:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  90:	e8 ce 04 00 00       	call   563 <getpid>
  95:	a3 4c 0d 00 00       	mov    %eax,0xd4c
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
  a2:	e8 b7 07 00 00       	call   85e <malloc>
   assert(p != NULL);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	0f 84 a6 00 00 00    	je     158 <main+0xdb>
  b2:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b4:	89 c2                	mov    %eax,%edx
  b6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  bc:	74 09                	je     c7 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  be:	b8 00 10 00 00       	mov    $0x1000,%eax
  c3:	29 d0                	sub    %edx,%eax
  c5:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, (void*)&arg1, (void*)&arg2, stack);
  c7:	50                   	push   %eax
  c8:	68 44 0d 00 00       	push   $0xd44
  cd:	68 48 0d 00 00       	push   $0xd48
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 a7 04 00 00       	call   583 <clone>
  dc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 8e b8 00 00 00    	jle    1a1 <main+0x124>
   while(global != 33);
  e9:	a1 40 0d 00 00       	mov    0xd40,%eax
  ee:	83 f8 21             	cmp    $0x21,%eax
  f1:	75 f6                	jne    e9 <main+0x6c>
   assert(arg1 == 44);
  f3:	a1 48 0d 00 00       	mov    0xd48,%eax
  f8:	83 f8 2c             	cmp    $0x2c,%eax
  fb:	0f 85 e9 00 00 00    	jne    1ea <main+0x16d>
   assert(arg2 == 55);
 101:	a1 44 0d 00 00       	mov    0xd44,%eax
 106:	83 f8 37             	cmp    $0x37,%eax
 109:	0f 84 24 01 00 00    	je     233 <main+0x1b6>
 10f:	6a 28                	push   $0x28
 111:	68 e8 08 00 00       	push   $0x8e8
 116:	68 f1 08 00 00       	push   $0x8f1
 11b:	6a 01                	push   $0x1
 11d:	e8 16 05 00 00       	call   638 <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 49 09 00 00       	push   $0x949
 12a:	68 05 09 00 00       	push   $0x905
 12f:	6a 01                	push   $0x1
 131:	e8 02 05 00 00       	call   638 <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 19 09 00 00       	push   $0x919
 13e:	6a 01                	push   $0x1
 140:	e8 f3 04 00 00       	call   638 <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 4c 0d 00 00    	push   0xd4c
 14e:	e8 c0 03 00 00       	call   513 <kill>
 153:	e8 8b 03 00 00       	call   4e3 <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 e8 08 00 00       	push   $0x8e8
 15f:	68 f1 08 00 00       	push   $0x8f1
 164:	6a 01                	push   $0x1
 166:	e8 cd 04 00 00       	call   638 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 26 09 00 00       	push   $0x926
 173:	68 05 09 00 00       	push   $0x905
 178:	6a 01                	push   $0x1
 17a:	e8 b9 04 00 00       	call   638 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 19 09 00 00       	push   $0x919
 187:	6a 01                	push   $0x1
 189:	e8 aa 04 00 00       	call   638 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 4c 0d 00 00    	push   0xd4c
 197:	e8 77 03 00 00       	call   513 <kill>
 19c:	e8 42 03 00 00       	call   4e3 <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 e8 08 00 00       	push   $0x8e8
 1a8:	68 f1 08 00 00       	push   $0x8f1
 1ad:	6a 01                	push   $0x1
 1af:	e8 84 04 00 00       	call   638 <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 30 09 00 00       	push   $0x930
 1bc:	68 05 09 00 00       	push   $0x905
 1c1:	6a 01                	push   $0x1
 1c3:	e8 70 04 00 00       	call   638 <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 19 09 00 00       	push   $0x919
 1d0:	6a 01                	push   $0x1
 1d2:	e8 61 04 00 00       	call   638 <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 4c 0d 00 00    	push   0xd4c
 1e0:	e8 2e 03 00 00       	call   513 <kill>
 1e5:	e8 f9 02 00 00       	call   4e3 <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 e8 08 00 00       	push   $0x8e8
 1f1:	68 f1 08 00 00       	push   $0x8f1
 1f6:	6a 01                	push   $0x1
 1f8:	e8 3b 04 00 00       	call   638 <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 3e 09 00 00       	push   $0x93e
 205:	68 05 09 00 00       	push   $0x905
 20a:	6a 01                	push   $0x1
 20c:	e8 27 04 00 00       	call   638 <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 19 09 00 00       	push   $0x919
 219:	6a 01                	push   $0x1
 21b:	e8 18 04 00 00       	call   638 <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 4c 0d 00 00    	push   0xd4c
 229:	e8 e5 02 00 00       	call   513 <kill>
 22e:	e8 b0 02 00 00       	call   4e3 <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 54 09 00 00       	push   $0x954
 23b:	6a 01                	push   $0x1
 23d:	e8 f6 03 00 00       	call   638 <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 3e 03 00 00       	call   58b <join>
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
 256:	68 e8 08 00 00       	push   $0x8e8
 25b:	68 f1 08 00 00       	push   $0x8f1
 260:	6a 01                	push   $0x1
 262:	e8 d1 03 00 00       	call   638 <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 61 09 00 00       	push   $0x961
 26f:	68 05 09 00 00       	push   $0x905
 274:	6a 01                	push   $0x1
 276:	e8 bd 03 00 00       	call   638 <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 19 09 00 00       	push   $0x919
 283:	6a 01                	push   $0x1
 285:	e8 ae 03 00 00       	call   638 <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 4c 0d 00 00    	push   0xd4c
 293:	e8 7b 02 00 00       	call   513 <kill>
 298:	e8 46 02 00 00       	call   4e3 <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 f8 04 00 00       	call   79e <free>
   exit();
 2a6:	e8 38 02 00 00       	call   4e3 <exit>

000002ab <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 2ab:	55                   	push   %ebp
 2ac:	89 e5                	mov    %esp,%ebp
 2ae:	56                   	push   %esi
 2af:	53                   	push   %ebx
 2b0:	8b 75 08             	mov    0x8(%ebp),%esi
 2b3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b6:	89 f0                	mov    %esi,%eax
 2b8:	89 d1                	mov    %edx,%ecx
 2ba:	83 c2 01             	add    $0x1,%edx
 2bd:	89 c3                	mov    %eax,%ebx
 2bf:	83 c0 01             	add    $0x1,%eax
 2c2:	0f b6 09             	movzbl (%ecx),%ecx
 2c5:	88 0b                	mov    %cl,(%ebx)
 2c7:	84 c9                	test   %cl,%cl
 2c9:	75 ed                	jne    2b8 <strcpy+0xd>
    ;
  return os;
}
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    

000002d1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d1:	55                   	push   %ebp
 2d2:	89 e5                	mov    %esp,%ebp
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2da:	eb 06                	jmp    2e2 <strcmp+0x11>
    p++, q++;
 2dc:	83 c1 01             	add    $0x1,%ecx
 2df:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2e2:	0f b6 01             	movzbl (%ecx),%eax
 2e5:	84 c0                	test   %al,%al
 2e7:	74 04                	je     2ed <strcmp+0x1c>
 2e9:	3a 02                	cmp    (%edx),%al
 2eb:	74 ef                	je     2dc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2ed:	0f b6 c0             	movzbl %al,%eax
 2f0:	0f b6 12             	movzbl (%edx),%edx
 2f3:	29 d0                	sub    %edx,%eax
}
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    

000002f7 <strlen>:

uint
strlen(const char *s)
{
 2f7:	55                   	push   %ebp
 2f8:	89 e5                	mov    %esp,%ebp
 2fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2fd:	b8 00 00 00 00       	mov    $0x0,%eax
 302:	eb 03                	jmp    307 <strlen+0x10>
 304:	83 c0 01             	add    $0x1,%eax
 307:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 30b:	75 f7                	jne    304 <strlen+0xd>
    ;
  return n;
}
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    

0000030f <memset>:

void*
memset(void *dst, int c, uint n)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	57                   	push   %edi
 313:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 316:	89 d7                	mov    %edx,%edi
 318:	8b 4d 10             	mov    0x10(%ebp),%ecx
 31b:	8b 45 0c             	mov    0xc(%ebp),%eax
 31e:	fc                   	cld    
 31f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 321:	89 d0                	mov    %edx,%eax
 323:	8b 7d fc             	mov    -0x4(%ebp),%edi
 326:	c9                   	leave  
 327:	c3                   	ret    

00000328 <strchr>:

char*
strchr(const char *s, char c)
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 332:	eb 03                	jmp    337 <strchr+0xf>
 334:	83 c0 01             	add    $0x1,%eax
 337:	0f b6 10             	movzbl (%eax),%edx
 33a:	84 d2                	test   %dl,%dl
 33c:	74 06                	je     344 <strchr+0x1c>
    if(*s == c)
 33e:	38 ca                	cmp    %cl,%dl
 340:	75 f2                	jne    334 <strchr+0xc>
 342:	eb 05                	jmp    349 <strchr+0x21>
      return (char*)s;
  return 0;
 344:	b8 00 00 00 00       	mov    $0x0,%eax
}
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    

0000034b <gets>:

char*
gets(char *buf, int max)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	57                   	push   %edi
 34f:	56                   	push   %esi
 350:	53                   	push   %ebx
 351:	83 ec 1c             	sub    $0x1c,%esp
 354:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 357:	bb 00 00 00 00       	mov    $0x0,%ebx
 35c:	89 de                	mov    %ebx,%esi
 35e:	83 c3 01             	add    $0x1,%ebx
 361:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 364:	7d 2e                	jge    394 <gets+0x49>
    cc = read(0, &c, 1);
 366:	83 ec 04             	sub    $0x4,%esp
 369:	6a 01                	push   $0x1
 36b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 36e:	50                   	push   %eax
 36f:	6a 00                	push   $0x0
 371:	e8 85 01 00 00       	call   4fb <read>
    if(cc < 1)
 376:	83 c4 10             	add    $0x10,%esp
 379:	85 c0                	test   %eax,%eax
 37b:	7e 17                	jle    394 <gets+0x49>
      break;
    buf[i++] = c;
 37d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 381:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 384:	3c 0a                	cmp    $0xa,%al
 386:	0f 94 c2             	sete   %dl
 389:	3c 0d                	cmp    $0xd,%al
 38b:	0f 94 c0             	sete   %al
 38e:	08 c2                	or     %al,%dl
 390:	74 ca                	je     35c <gets+0x11>
    buf[i++] = c;
 392:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 394:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 398:	89 f8                	mov    %edi,%eax
 39a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39d:	5b                   	pop    %ebx
 39e:	5e                   	pop    %esi
 39f:	5f                   	pop    %edi
 3a0:	5d                   	pop    %ebp
 3a1:	c3                   	ret    

000003a2 <stat>:

int
stat(const char *n, struct stat *st)
{
 3a2:	55                   	push   %ebp
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	56                   	push   %esi
 3a6:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a7:	83 ec 08             	sub    $0x8,%esp
 3aa:	6a 00                	push   $0x0
 3ac:	ff 75 08             	push   0x8(%ebp)
 3af:	e8 6f 01 00 00       	call   523 <open>
  if(fd < 0)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	85 c0                	test   %eax,%eax
 3b9:	78 24                	js     3df <stat+0x3d>
 3bb:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3bd:	83 ec 08             	sub    $0x8,%esp
 3c0:	ff 75 0c             	push   0xc(%ebp)
 3c3:	50                   	push   %eax
 3c4:	e8 72 01 00 00       	call   53b <fstat>
 3c9:	89 c6                	mov    %eax,%esi
  close(fd);
 3cb:	89 1c 24             	mov    %ebx,(%esp)
 3ce:	e8 38 01 00 00       	call   50b <close>
  return r;
 3d3:	83 c4 10             	add    $0x10,%esp
}
 3d6:	89 f0                	mov    %esi,%eax
 3d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    
    return -1;
 3df:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3e4:	eb f0                	jmp    3d6 <stat+0x34>

000003e6 <atoi>:

int
atoi(const char *s)
{
 3e6:	55                   	push   %ebp
 3e7:	89 e5                	mov    %esp,%ebp
 3e9:	53                   	push   %ebx
 3ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3ed:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3f2:	eb 10                	jmp    404 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3f4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3f7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3fa:	83 c1 01             	add    $0x1,%ecx
 3fd:	0f be c0             	movsbl %al,%eax
 400:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 404:	0f b6 01             	movzbl (%ecx),%eax
 407:	8d 58 d0             	lea    -0x30(%eax),%ebx
 40a:	80 fb 09             	cmp    $0x9,%bl
 40d:	76 e5                	jbe    3f4 <atoi+0xe>
  return n;
}
 40f:	89 d0                	mov    %edx,%eax
 411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	56                   	push   %esi
 41a:	53                   	push   %ebx
 41b:	8b 75 08             	mov    0x8(%ebp),%esi
 41e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 421:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 424:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 426:	eb 0d                	jmp    435 <memmove+0x1f>
    *dst++ = *src++;
 428:	0f b6 01             	movzbl (%ecx),%eax
 42b:	88 02                	mov    %al,(%edx)
 42d:	8d 49 01             	lea    0x1(%ecx),%ecx
 430:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 58 ff             	lea    -0x1(%eax),%ebx
 438:	85 c0                	test   %eax,%eax
 43a:	7f ec                	jg     428 <memmove+0x12>
  return vdst;
}
 43c:	89 f0                	mov    %esi,%eax
 43e:	5b                   	pop    %ebx
 43f:	5e                   	pop    %esi
 440:	5d                   	pop    %ebp
 441:	c3                   	ret    

00000442 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 442:	55                   	push   %ebp
 443:	89 e5                	mov    %esp,%ebp
 445:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 448:	68 00 20 00 00       	push   $0x2000
 44d:	e8 0c 04 00 00       	call   85e <malloc>
  if((uint)(stack) % PGSIZE != 0){
 452:	83 c4 10             	add    $0x10,%esp
 455:	a9 ff 0f 00 00       	test   $0xfff,%eax
 45a:	74 0a                	je     466 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 45c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 461:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 466:	50                   	push   %eax
 467:	ff 75 10             	push   0x10(%ebp)
 46a:	ff 75 0c             	push   0xc(%ebp)
 46d:	ff 75 08             	push   0x8(%ebp)
 470:	e8 0e 01 00 00       	call   583 <clone>
  return pid;
}
 475:	c9                   	leave  
 476:	c3                   	ret    

00000477 <thread_join>:
int
thread_join()
{
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
 47a:	53                   	push   %ebx
 47b:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 47e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 481:	50                   	push   %eax
 482:	e8 04 01 00 00       	call   58b <join>
 487:	89 c3                	mov    %eax,%ebx
  free(stack);
 489:	83 c4 04             	add    $0x4,%esp
 48c:	ff 75 f4             	push   -0xc(%ebp)
 48f:	e8 0a 03 00 00       	call   79e <free>
  return pid;
}
 494:	89 d8                	mov    %ebx,%eax
 496:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 499:	c9                   	leave  
 49a:	c3                   	ret    

0000049b <lock_init>:
int
lock_init(lock_t * lock){
 49b:	55                   	push   %ebp
 49c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 49e:	8b 45 08             	mov    0x8(%ebp),%eax
 4a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 4a7:	b8 00 00 00 00       	mov    $0x0,%eax
 4ac:	5d                   	pop    %ebp
 4ad:	c3                   	ret    

000004ae <lock_acquire>:
int
lock_acquire(lock_t * lock){
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4b4:	b8 01 00 00 00       	mov    $0x1,%eax
 4b9:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 4bc:	83 f8 01             	cmp    $0x1,%eax
 4bf:	74 f3                	je     4b4 <lock_acquire+0x6>
  {

  }
  return 0;
}
 4c1:	b8 00 00 00 00       	mov    $0x0,%eax
 4c6:	5d                   	pop    %ebp
 4c7:	c3                   	ret    

000004c8 <lock_release>:
int
lock_release(lock_t * lock){
 4c8:	55                   	push   %ebp
 4c9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 4d4:	b8 00 00 00 00       	mov    $0x0,%eax
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    

000004db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4db:	b8 01 00 00 00       	mov    $0x1,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <exit>:
SYSCALL(exit)
 4e3:	b8 02 00 00 00       	mov    $0x2,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <wait>:
SYSCALL(wait)
 4eb:	b8 03 00 00 00       	mov    $0x3,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <pipe>:
SYSCALL(pipe)
 4f3:	b8 04 00 00 00       	mov    $0x4,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <read>:
SYSCALL(read)
 4fb:	b8 05 00 00 00       	mov    $0x5,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <write>:
SYSCALL(write)
 503:	b8 10 00 00 00       	mov    $0x10,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <close>:
SYSCALL(close)
 50b:	b8 15 00 00 00       	mov    $0x15,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <kill>:
SYSCALL(kill)
 513:	b8 06 00 00 00       	mov    $0x6,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <exec>:
SYSCALL(exec)
 51b:	b8 07 00 00 00       	mov    $0x7,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <open>:
SYSCALL(open)
 523:	b8 0f 00 00 00       	mov    $0xf,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <mknod>:
SYSCALL(mknod)
 52b:	b8 11 00 00 00       	mov    $0x11,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <unlink>:
SYSCALL(unlink)
 533:	b8 12 00 00 00       	mov    $0x12,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <fstat>:
SYSCALL(fstat)
 53b:	b8 08 00 00 00       	mov    $0x8,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <link>:
SYSCALL(link)
 543:	b8 13 00 00 00       	mov    $0x13,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mkdir>:
SYSCALL(mkdir)
 54b:	b8 14 00 00 00       	mov    $0x14,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <chdir>:
SYSCALL(chdir)
 553:	b8 09 00 00 00       	mov    $0x9,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <dup>:
SYSCALL(dup)
 55b:	b8 0a 00 00 00       	mov    $0xa,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <getpid>:
SYSCALL(getpid)
 563:	b8 0b 00 00 00       	mov    $0xb,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <sbrk>:
SYSCALL(sbrk)
 56b:	b8 0c 00 00 00       	mov    $0xc,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <sleep>:
SYSCALL(sleep)
 573:	b8 0d 00 00 00       	mov    $0xd,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <uptime>:
SYSCALL(uptime)
 57b:	b8 0e 00 00 00       	mov    $0xe,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <clone>:
SYSCALL(clone)
 583:	b8 16 00 00 00       	mov    $0x16,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <join>:
SYSCALL(join)
 58b:	b8 17 00 00 00       	mov    $0x17,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 593:	55                   	push   %ebp
 594:	89 e5                	mov    %esp,%ebp
 596:	83 ec 1c             	sub    $0x1c,%esp
 599:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 59c:	6a 01                	push   $0x1
 59e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5a1:	52                   	push   %edx
 5a2:	50                   	push   %eax
 5a3:	e8 5b ff ff ff       	call   503 <write>
}
 5a8:	83 c4 10             	add    $0x10,%esp
 5ab:	c9                   	leave  
 5ac:	c3                   	ret    

000005ad <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5ad:	55                   	push   %ebp
 5ae:	89 e5                	mov    %esp,%ebp
 5b0:	57                   	push   %edi
 5b1:	56                   	push   %esi
 5b2:	53                   	push   %ebx
 5b3:	83 ec 2c             	sub    $0x2c,%esp
 5b6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b9:	89 d0                	mov    %edx,%eax
 5bb:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5bd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5c1:	0f 95 c1             	setne  %cl
 5c4:	c1 ea 1f             	shr    $0x1f,%edx
 5c7:	84 d1                	test   %dl,%cl
 5c9:	74 44                	je     60f <printint+0x62>
    neg = 1;
    x = -xx;
 5cb:	f7 d8                	neg    %eax
 5cd:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5cf:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5d6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5db:	89 c8                	mov    %ecx,%eax
 5dd:	ba 00 00 00 00       	mov    $0x0,%edx
 5e2:	f7 f6                	div    %esi
 5e4:	89 df                	mov    %ebx,%edi
 5e6:	83 c3 01             	add    $0x1,%ebx
 5e9:	0f b6 92 d8 09 00 00 	movzbl 0x9d8(%edx),%edx
 5f0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5f4:	89 ca                	mov    %ecx,%edx
 5f6:	89 c1                	mov    %eax,%ecx
 5f8:	39 d6                	cmp    %edx,%esi
 5fa:	76 df                	jbe    5db <printint+0x2e>
  if(neg)
 5fc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 600:	74 31                	je     633 <printint+0x86>
    buf[i++] = '-';
 602:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 607:	8d 5f 02             	lea    0x2(%edi),%ebx
 60a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 60d:	eb 17                	jmp    626 <printint+0x79>
    x = xx;
 60f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 611:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 618:	eb bc                	jmp    5d6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 61a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 61f:	89 f0                	mov    %esi,%eax
 621:	e8 6d ff ff ff       	call   593 <putc>
  while(--i >= 0)
 626:	83 eb 01             	sub    $0x1,%ebx
 629:	79 ef                	jns    61a <printint+0x6d>
}
 62b:	83 c4 2c             	add    $0x2c,%esp
 62e:	5b                   	pop    %ebx
 62f:	5e                   	pop    %esi
 630:	5f                   	pop    %edi
 631:	5d                   	pop    %ebp
 632:	c3                   	ret    
 633:	8b 75 d0             	mov    -0x30(%ebp),%esi
 636:	eb ee                	jmp    626 <printint+0x79>

00000638 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 638:	55                   	push   %ebp
 639:	89 e5                	mov    %esp,%ebp
 63b:	57                   	push   %edi
 63c:	56                   	push   %esi
 63d:	53                   	push   %ebx
 63e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 641:	8d 45 10             	lea    0x10(%ebp),%eax
 644:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 647:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 64c:	bb 00 00 00 00       	mov    $0x0,%ebx
 651:	eb 14                	jmp    667 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 653:	89 fa                	mov    %edi,%edx
 655:	8b 45 08             	mov    0x8(%ebp),%eax
 658:	e8 36 ff ff ff       	call   593 <putc>
 65d:	eb 05                	jmp    664 <printf+0x2c>
      }
    } else if(state == '%'){
 65f:	83 fe 25             	cmp    $0x25,%esi
 662:	74 25                	je     689 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 664:	83 c3 01             	add    $0x1,%ebx
 667:	8b 45 0c             	mov    0xc(%ebp),%eax
 66a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 66e:	84 c0                	test   %al,%al
 670:	0f 84 20 01 00 00    	je     796 <printf+0x15e>
    c = fmt[i] & 0xff;
 676:	0f be f8             	movsbl %al,%edi
 679:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 67c:	85 f6                	test   %esi,%esi
 67e:	75 df                	jne    65f <printf+0x27>
      if(c == '%'){
 680:	83 f8 25             	cmp    $0x25,%eax
 683:	75 ce                	jne    653 <printf+0x1b>
        state = '%';
 685:	89 c6                	mov    %eax,%esi
 687:	eb db                	jmp    664 <printf+0x2c>
      if(c == 'd'){
 689:	83 f8 25             	cmp    $0x25,%eax
 68c:	0f 84 cf 00 00 00    	je     761 <printf+0x129>
 692:	0f 8c dd 00 00 00    	jl     775 <printf+0x13d>
 698:	83 f8 78             	cmp    $0x78,%eax
 69b:	0f 8f d4 00 00 00    	jg     775 <printf+0x13d>
 6a1:	83 f8 63             	cmp    $0x63,%eax
 6a4:	0f 8c cb 00 00 00    	jl     775 <printf+0x13d>
 6aa:	83 e8 63             	sub    $0x63,%eax
 6ad:	83 f8 15             	cmp    $0x15,%eax
 6b0:	0f 87 bf 00 00 00    	ja     775 <printf+0x13d>
 6b6:	ff 24 85 80 09 00 00 	jmp    *0x980(,%eax,4)
        printint(fd, *ap, 10, 1);
 6bd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c0:	8b 17                	mov    (%edi),%edx
 6c2:	83 ec 0c             	sub    $0xc,%esp
 6c5:	6a 01                	push   $0x1
 6c7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6cc:	8b 45 08             	mov    0x8(%ebp),%eax
 6cf:	e8 d9 fe ff ff       	call   5ad <printint>
        ap++;
 6d4:	83 c7 04             	add    $0x4,%edi
 6d7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6da:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6dd:	be 00 00 00 00       	mov    $0x0,%esi
 6e2:	eb 80                	jmp    664 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6e4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e7:	8b 17                	mov    (%edi),%edx
 6e9:	83 ec 0c             	sub    $0xc,%esp
 6ec:	6a 00                	push   $0x0
 6ee:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	e8 b2 fe ff ff       	call   5ad <printint>
        ap++;
 6fb:	83 c7 04             	add    $0x4,%edi
 6fe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 701:	83 c4 10             	add    $0x10,%esp
      state = 0;
 704:	be 00 00 00 00       	mov    $0x0,%esi
 709:	e9 56 ff ff ff       	jmp    664 <printf+0x2c>
        s = (char*)*ap;
 70e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 711:	8b 30                	mov    (%eax),%esi
        ap++;
 713:	83 c0 04             	add    $0x4,%eax
 716:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 719:	85 f6                	test   %esi,%esi
 71b:	75 15                	jne    732 <printf+0xfa>
          s = "(null)";
 71d:	be 77 09 00 00       	mov    $0x977,%esi
 722:	eb 0e                	jmp    732 <printf+0xfa>
          putc(fd, *s);
 724:	0f be d2             	movsbl %dl,%edx
 727:	8b 45 08             	mov    0x8(%ebp),%eax
 72a:	e8 64 fe ff ff       	call   593 <putc>
          s++;
 72f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 732:	0f b6 16             	movzbl (%esi),%edx
 735:	84 d2                	test   %dl,%dl
 737:	75 eb                	jne    724 <printf+0xec>
      state = 0;
 739:	be 00 00 00 00       	mov    $0x0,%esi
 73e:	e9 21 ff ff ff       	jmp    664 <printf+0x2c>
        putc(fd, *ap);
 743:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 746:	0f be 17             	movsbl (%edi),%edx
 749:	8b 45 08             	mov    0x8(%ebp),%eax
 74c:	e8 42 fe ff ff       	call   593 <putc>
        ap++;
 751:	83 c7 04             	add    $0x4,%edi
 754:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 757:	be 00 00 00 00       	mov    $0x0,%esi
 75c:	e9 03 ff ff ff       	jmp    664 <printf+0x2c>
        putc(fd, c);
 761:	89 fa                	mov    %edi,%edx
 763:	8b 45 08             	mov    0x8(%ebp),%eax
 766:	e8 28 fe ff ff       	call   593 <putc>
      state = 0;
 76b:	be 00 00 00 00       	mov    $0x0,%esi
 770:	e9 ef fe ff ff       	jmp    664 <printf+0x2c>
        putc(fd, '%');
 775:	ba 25 00 00 00       	mov    $0x25,%edx
 77a:	8b 45 08             	mov    0x8(%ebp),%eax
 77d:	e8 11 fe ff ff       	call   593 <putc>
        putc(fd, c);
 782:	89 fa                	mov    %edi,%edx
 784:	8b 45 08             	mov    0x8(%ebp),%eax
 787:	e8 07 fe ff ff       	call   593 <putc>
      state = 0;
 78c:	be 00 00 00 00       	mov    $0x0,%esi
 791:	e9 ce fe ff ff       	jmp    664 <printf+0x2c>
    }
  }
}
 796:	8d 65 f4             	lea    -0xc(%ebp),%esp
 799:	5b                   	pop    %ebx
 79a:	5e                   	pop    %esi
 79b:	5f                   	pop    %edi
 79c:	5d                   	pop    %ebp
 79d:	c3                   	ret    

0000079e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 79e:	55                   	push   %ebp
 79f:	89 e5                	mov    %esp,%ebp
 7a1:	57                   	push   %edi
 7a2:	56                   	push   %esi
 7a3:	53                   	push   %ebx
 7a4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7aa:	a1 50 0d 00 00       	mov    0xd50,%eax
 7af:	eb 02                	jmp    7b3 <free+0x15>
 7b1:	89 d0                	mov    %edx,%eax
 7b3:	39 c8                	cmp    %ecx,%eax
 7b5:	73 04                	jae    7bb <free+0x1d>
 7b7:	39 08                	cmp    %ecx,(%eax)
 7b9:	77 12                	ja     7cd <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7bb:	8b 10                	mov    (%eax),%edx
 7bd:	39 c2                	cmp    %eax,%edx
 7bf:	77 f0                	ja     7b1 <free+0x13>
 7c1:	39 c8                	cmp    %ecx,%eax
 7c3:	72 08                	jb     7cd <free+0x2f>
 7c5:	39 ca                	cmp    %ecx,%edx
 7c7:	77 04                	ja     7cd <free+0x2f>
 7c9:	89 d0                	mov    %edx,%eax
 7cb:	eb e6                	jmp    7b3 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7cd:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7d0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7d3:	8b 10                	mov    (%eax),%edx
 7d5:	39 d7                	cmp    %edx,%edi
 7d7:	74 19                	je     7f2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7d9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7dc:	8b 50 04             	mov    0x4(%eax),%edx
 7df:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e2:	39 ce                	cmp    %ecx,%esi
 7e4:	74 1b                	je     801 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7e6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7e8:	a3 50 0d 00 00       	mov    %eax,0xd50
}
 7ed:	5b                   	pop    %ebx
 7ee:	5e                   	pop    %esi
 7ef:	5f                   	pop    %edi
 7f0:	5d                   	pop    %ebp
 7f1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7f2:	03 72 04             	add    0x4(%edx),%esi
 7f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f8:	8b 10                	mov    (%eax),%edx
 7fa:	8b 12                	mov    (%edx),%edx
 7fc:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7ff:	eb db                	jmp    7dc <free+0x3e>
    p->s.size += bp->s.size;
 801:	03 53 fc             	add    -0x4(%ebx),%edx
 804:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 807:	8b 53 f8             	mov    -0x8(%ebx),%edx
 80a:	89 10                	mov    %edx,(%eax)
 80c:	eb da                	jmp    7e8 <free+0x4a>

0000080e <morecore>:

static Header*
morecore(uint nu)
{
 80e:	55                   	push   %ebp
 80f:	89 e5                	mov    %esp,%ebp
 811:	53                   	push   %ebx
 812:	83 ec 04             	sub    $0x4,%esp
 815:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 817:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 81c:	77 05                	ja     823 <morecore+0x15>
    nu = 4096;
 81e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 823:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82a:	83 ec 0c             	sub    $0xc,%esp
 82d:	50                   	push   %eax
 82e:	e8 38 fd ff ff       	call   56b <sbrk>
  if(p == (char*)-1)
 833:	83 c4 10             	add    $0x10,%esp
 836:	83 f8 ff             	cmp    $0xffffffff,%eax
 839:	74 1c                	je     857 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 83b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 83e:	83 c0 08             	add    $0x8,%eax
 841:	83 ec 0c             	sub    $0xc,%esp
 844:	50                   	push   %eax
 845:	e8 54 ff ff ff       	call   79e <free>
  return freep;
 84a:	a1 50 0d 00 00       	mov    0xd50,%eax
 84f:	83 c4 10             	add    $0x10,%esp
}
 852:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 855:	c9                   	leave  
 856:	c3                   	ret    
    return 0;
 857:	b8 00 00 00 00       	mov    $0x0,%eax
 85c:	eb f4                	jmp    852 <morecore+0x44>

0000085e <malloc>:

void*
malloc(uint nbytes)
{
 85e:	55                   	push   %ebp
 85f:	89 e5                	mov    %esp,%ebp
 861:	53                   	push   %ebx
 862:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	8d 58 07             	lea    0x7(%eax),%ebx
 86b:	c1 eb 03             	shr    $0x3,%ebx
 86e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 871:	8b 0d 50 0d 00 00    	mov    0xd50,%ecx
 877:	85 c9                	test   %ecx,%ecx
 879:	74 04                	je     87f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87b:	8b 01                	mov    (%ecx),%eax
 87d:	eb 4a                	jmp    8c9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 87f:	c7 05 50 0d 00 00 54 	movl   $0xd54,0xd50
 886:	0d 00 00 
 889:	c7 05 54 0d 00 00 54 	movl   $0xd54,0xd54
 890:	0d 00 00 
    base.s.size = 0;
 893:	c7 05 58 0d 00 00 00 	movl   $0x0,0xd58
 89a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 89d:	b9 54 0d 00 00       	mov    $0xd54,%ecx
 8a2:	eb d7                	jmp    87b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8a4:	74 19                	je     8bf <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8a6:	29 da                	sub    %ebx,%edx
 8a8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ab:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8ae:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8b1:	89 0d 50 0d 00 00    	mov    %ecx,0xd50
      return (void*)(p + 1);
 8b7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8bd:	c9                   	leave  
 8be:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8bf:	8b 10                	mov    (%eax),%edx
 8c1:	89 11                	mov    %edx,(%ecx)
 8c3:	eb ec                	jmp    8b1 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c5:	89 c1                	mov    %eax,%ecx
 8c7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8c9:	8b 50 04             	mov    0x4(%eax),%edx
 8cc:	39 da                	cmp    %ebx,%edx
 8ce:	73 d4                	jae    8a4 <malloc+0x46>
    if(p == freep)
 8d0:	39 05 50 0d 00 00    	cmp    %eax,0xd50
 8d6:	75 ed                	jne    8c5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8d8:	89 d8                	mov    %ebx,%eax
 8da:	e8 2f ff ff ff       	call   80e <morecore>
 8df:	85 c0                	test   %eax,%eax
 8e1:	75 e2                	jne    8c5 <malloc+0x67>
 8e3:	eb d5                	jmp    8ba <malloc+0x5c>
