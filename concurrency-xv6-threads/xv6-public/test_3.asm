
_test_3:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 0c             	sub    $0xc,%esp
   assert(write(3, "hello\n", 6) == 6);
   6:	6a 06                	push   $0x6
   8:	68 08 09 00 00       	push   $0x908
   d:	6a 03                	push   $0x3
   f:	e8 11 05 00 00       	call   525 <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 0f 09 00 00       	push   $0x90f
  23:	68 18 09 00 00       	push   $0x918
  28:	6a 01                	push   $0x1
  2a:	e8 2b 06 00 00       	call   65a <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 20 09 00 00       	push   $0x920
  37:	68 3c 09 00 00       	push   $0x93c
  3c:	6a 01                	push   $0x1
  3e:	e8 17 06 00 00       	call   65a <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 50 09 00 00       	push   $0x950
  4b:	6a 01                	push   $0x1
  4d:	e8 08 06 00 00       	call   65a <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 a4 0d 00 00    	push   0xda4
  5b:	e8 d5 04 00 00       	call   535 <kill>
  60:	e8 a0 04 00 00       	call   505 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 5d 09 00 00       	push   $0x95d
  72:	e8 ce 04 00 00       	call   545 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 a0 0d 00 00 	lock xchg %eax,0xda0
   exit();
  7e:	e8 82 04 00 00       	call   505 <exit>

00000083 <main>:
{
  83:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  87:	83 e4 f0             	and    $0xfffffff0,%esp
  8a:	ff 71 fc             	push   -0x4(%ecx)
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	51                   	push   %ecx
  93:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  96:	e8 ea 04 00 00       	call   585 <getpid>
  9b:	a3 a4 0d 00 00       	mov    %eax,0xda4
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 d3 07 00 00       	call   880 <malloc>
   assert(p != NULL);
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	85 c0                	test   %eax,%eax
  b2:	74 7d                	je     131 <main+0xae>
  b4:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b6:	25 ff 0f 00 00       	and    $0xfff,%eax
  bb:	0f 84 b9 00 00 00    	je     17a <main+0xf7>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  c1:	be 00 10 00 00       	mov    $0x1000,%esi
  c6:	29 c6                	sub    %eax,%esi
  c8:	01 de                	add    %ebx,%esi
   int fd = open("tmp", O_WRONLY|O_CREATE);
  ca:	83 ec 08             	sub    $0x8,%esp
  cd:	68 01 02 00 00       	push   $0x201
  d2:	68 6c 09 00 00       	push   $0x96c
  d7:	e8 69 04 00 00       	call   545 <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 0f 09 00 00       	push   $0x90f
  ef:	68 18 09 00 00       	push   $0x918
  f4:	6a 01                	push   $0x1
  f6:	e8 5f 05 00 00       	call   65a <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 70 09 00 00       	push   $0x970
 103:	68 3c 09 00 00       	push   $0x93c
 108:	6a 01                	push   $0x1
 10a:	e8 4b 05 00 00       	call   65a <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 50 09 00 00       	push   $0x950
 117:	6a 01                	push   $0x1
 119:	e8 3c 05 00 00       	call   65a <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 a4 0d 00 00    	push   0xda4
 127:	e8 09 04 00 00       	call   535 <kill>
 12c:	e8 d4 03 00 00       	call   505 <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 0f 09 00 00       	push   $0x90f
 138:	68 18 09 00 00       	push   $0x918
 13d:	6a 01                	push   $0x1
 13f:	e8 16 05 00 00       	call   65a <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 62 09 00 00       	push   $0x962
 14c:	68 3c 09 00 00       	push   $0x93c
 151:	6a 01                	push   $0x1
 153:	e8 02 05 00 00       	call   65a <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 50 09 00 00       	push   $0x950
 160:	6a 01                	push   $0x1
 162:	e8 f3 04 00 00       	call   65a <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 a4 0d 00 00    	push   0xda4
 170:	e8 c0 03 00 00       	call   535 <kill>
 175:	e8 8b 03 00 00       	call   505 <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 15 04 00 00       	call   5a5 <clone>
 190:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	7e 73                	jle    20c <main+0x189>
   while(!newfd);
 199:	a1 a0 0d 00 00       	mov    0xda0,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 a0 0d 00 00       	mov    0xda0,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 86 09 00 00       	push   $0x986
 1b1:	50                   	push   %eax
 1b2:	e8 6e 03 00 00       	call   525 <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 0f 09 00 00       	push   $0x90f
 1ca:	68 18 09 00 00       	push   $0x918
 1cf:	6a 01                	push   $0x1
 1d1:	e8 84 04 00 00       	call   65a <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 b4 09 00 00       	push   $0x9b4
 1de:	68 3c 09 00 00       	push   $0x93c
 1e3:	6a 01                	push   $0x1
 1e5:	e8 70 04 00 00       	call   65a <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 50 09 00 00       	push   $0x950
 1f2:	6a 01                	push   $0x1
 1f4:	e8 61 04 00 00       	call   65a <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 a4 0d 00 00    	push   0xda4
 202:	e8 2e 03 00 00       	call   535 <kill>
 207:	e8 f9 02 00 00       	call   505 <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 0f 09 00 00       	push   $0x90f
 213:	68 18 09 00 00       	push   $0x918
 218:	6a 01                	push   $0x1
 21a:	e8 3b 04 00 00       	call   65a <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 78 09 00 00       	push   $0x978
 227:	68 3c 09 00 00       	push   $0x93c
 22c:	6a 01                	push   $0x1
 22e:	e8 27 04 00 00       	call   65a <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 50 09 00 00       	push   $0x950
 23b:	6a 01                	push   $0x1
 23d:	e8 18 04 00 00       	call   65a <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 a4 0d 00 00    	push   0xda4
 24b:	e8 e5 02 00 00       	call   535 <kill>
 250:	e8 b0 02 00 00       	call   505 <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 8f 09 00 00       	push   $0x98f
 25d:	6a 01                	push   $0x1
 25f:	e8 f6 03 00 00       	call   65a <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 3e 03 00 00       	call   5ad <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 0f 09 00 00       	push   $0x90f
 27d:	68 18 09 00 00       	push   $0x918
 282:	6a 01                	push   $0x1
 284:	e8 d1 03 00 00       	call   65a <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 9c 09 00 00       	push   $0x99c
 291:	68 3c 09 00 00       	push   $0x93c
 296:	6a 01                	push   $0x1
 298:	e8 bd 03 00 00       	call   65a <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 50 09 00 00       	push   $0x950
 2a5:	6a 01                	push   $0x1
 2a7:	e8 ae 03 00 00       	call   65a <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 a4 0d 00 00    	push   0xda4
 2b5:	e8 7b 02 00 00       	call   535 <kill>
 2ba:	e8 46 02 00 00       	call   505 <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 f8 04 00 00       	call   7c0 <free>
   exit();
 2c8:	e8 38 02 00 00       	call   505 <exit>

000002cd <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	8b 75 08             	mov    0x8(%ebp),%esi
 2d5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2d8:	89 f0                	mov    %esi,%eax
 2da:	89 d1                	mov    %edx,%ecx
 2dc:	83 c2 01             	add    $0x1,%edx
 2df:	89 c3                	mov    %eax,%ebx
 2e1:	83 c0 01             	add    $0x1,%eax
 2e4:	0f b6 09             	movzbl (%ecx),%ecx
 2e7:	88 0b                	mov    %cl,(%ebx)
 2e9:	84 c9                	test   %cl,%cl
 2eb:	75 ed                	jne    2da <strcpy+0xd>
    ;
  return os;
}
 2ed:	89 f0                	mov    %esi,%eax
 2ef:	5b                   	pop    %ebx
 2f0:	5e                   	pop    %esi
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    

000002f3 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2fc:	eb 06                	jmp    304 <strcmp+0x11>
    p++, q++;
 2fe:	83 c1 01             	add    $0x1,%ecx
 301:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 304:	0f b6 01             	movzbl (%ecx),%eax
 307:	84 c0                	test   %al,%al
 309:	74 04                	je     30f <strcmp+0x1c>
 30b:	3a 02                	cmp    (%edx),%al
 30d:	74 ef                	je     2fe <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 30f:	0f b6 c0             	movzbl %al,%eax
 312:	0f b6 12             	movzbl (%edx),%edx
 315:	29 d0                	sub    %edx,%eax
}
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    

00000319 <strlen>:

uint
strlen(const char *s)
{
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
 31c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 31f:	b8 00 00 00 00       	mov    $0x0,%eax
 324:	eb 03                	jmp    329 <strlen+0x10>
 326:	83 c0 01             	add    $0x1,%eax
 329:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 32d:	75 f7                	jne    326 <strlen+0xd>
    ;
  return n;
}
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    

00000331 <memset>:

void*
memset(void *dst, int c, uint n)
{
 331:	55                   	push   %ebp
 332:	89 e5                	mov    %esp,%ebp
 334:	57                   	push   %edi
 335:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 338:	89 d7                	mov    %edx,%edi
 33a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 33d:	8b 45 0c             	mov    0xc(%ebp),%eax
 340:	fc                   	cld    
 341:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 343:	89 d0                	mov    %edx,%eax
 345:	8b 7d fc             	mov    -0x4(%ebp),%edi
 348:	c9                   	leave  
 349:	c3                   	ret    

0000034a <strchr>:

char*
strchr(const char *s, char c)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 354:	eb 03                	jmp    359 <strchr+0xf>
 356:	83 c0 01             	add    $0x1,%eax
 359:	0f b6 10             	movzbl (%eax),%edx
 35c:	84 d2                	test   %dl,%dl
 35e:	74 06                	je     366 <strchr+0x1c>
    if(*s == c)
 360:	38 ca                	cmp    %cl,%dl
 362:	75 f2                	jne    356 <strchr+0xc>
 364:	eb 05                	jmp    36b <strchr+0x21>
      return (char*)s;
  return 0;
 366:	b8 00 00 00 00       	mov    $0x0,%eax
}
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    

0000036d <gets>:

char*
gets(char *buf, int max)
{
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
 370:	57                   	push   %edi
 371:	56                   	push   %esi
 372:	53                   	push   %ebx
 373:	83 ec 1c             	sub    $0x1c,%esp
 376:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 379:	bb 00 00 00 00       	mov    $0x0,%ebx
 37e:	89 de                	mov    %ebx,%esi
 380:	83 c3 01             	add    $0x1,%ebx
 383:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 386:	7d 2e                	jge    3b6 <gets+0x49>
    cc = read(0, &c, 1);
 388:	83 ec 04             	sub    $0x4,%esp
 38b:	6a 01                	push   $0x1
 38d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 390:	50                   	push   %eax
 391:	6a 00                	push   $0x0
 393:	e8 85 01 00 00       	call   51d <read>
    if(cc < 1)
 398:	83 c4 10             	add    $0x10,%esp
 39b:	85 c0                	test   %eax,%eax
 39d:	7e 17                	jle    3b6 <gets+0x49>
      break;
    buf[i++] = c;
 39f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3a6:	3c 0a                	cmp    $0xa,%al
 3a8:	0f 94 c2             	sete   %dl
 3ab:	3c 0d                	cmp    $0xd,%al
 3ad:	0f 94 c0             	sete   %al
 3b0:	08 c2                	or     %al,%dl
 3b2:	74 ca                	je     37e <gets+0x11>
    buf[i++] = c;
 3b4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3b6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3ba:	89 f8                	mov    %edi,%eax
 3bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bf:	5b                   	pop    %ebx
 3c0:	5e                   	pop    %esi
 3c1:	5f                   	pop    %edi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    

000003c4 <stat>:

int
stat(const char *n, struct stat *st)
{
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	56                   	push   %esi
 3c8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c9:	83 ec 08             	sub    $0x8,%esp
 3cc:	6a 00                	push   $0x0
 3ce:	ff 75 08             	push   0x8(%ebp)
 3d1:	e8 6f 01 00 00       	call   545 <open>
  if(fd < 0)
 3d6:	83 c4 10             	add    $0x10,%esp
 3d9:	85 c0                	test   %eax,%eax
 3db:	78 24                	js     401 <stat+0x3d>
 3dd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3df:	83 ec 08             	sub    $0x8,%esp
 3e2:	ff 75 0c             	push   0xc(%ebp)
 3e5:	50                   	push   %eax
 3e6:	e8 72 01 00 00       	call   55d <fstat>
 3eb:	89 c6                	mov    %eax,%esi
  close(fd);
 3ed:	89 1c 24             	mov    %ebx,(%esp)
 3f0:	e8 38 01 00 00       	call   52d <close>
  return r;
 3f5:	83 c4 10             	add    $0x10,%esp
}
 3f8:	89 f0                	mov    %esi,%eax
 3fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3fd:	5b                   	pop    %ebx
 3fe:	5e                   	pop    %esi
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    
    return -1;
 401:	be ff ff ff ff       	mov    $0xffffffff,%esi
 406:	eb f0                	jmp    3f8 <stat+0x34>

00000408 <atoi>:

int
atoi(const char *s)
{
 408:	55                   	push   %ebp
 409:	89 e5                	mov    %esp,%ebp
 40b:	53                   	push   %ebx
 40c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 40f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 414:	eb 10                	jmp    426 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 416:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 419:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 41c:	83 c1 01             	add    $0x1,%ecx
 41f:	0f be c0             	movsbl %al,%eax
 422:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 426:	0f b6 01             	movzbl (%ecx),%eax
 429:	8d 58 d0             	lea    -0x30(%eax),%ebx
 42c:	80 fb 09             	cmp    $0x9,%bl
 42f:	76 e5                	jbe    416 <atoi+0xe>
  return n;
}
 431:	89 d0                	mov    %edx,%eax
 433:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 436:	c9                   	leave  
 437:	c3                   	ret    

00000438 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	56                   	push   %esi
 43c:	53                   	push   %ebx
 43d:	8b 75 08             	mov    0x8(%ebp),%esi
 440:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 443:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 446:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 448:	eb 0d                	jmp    457 <memmove+0x1f>
    *dst++ = *src++;
 44a:	0f b6 01             	movzbl (%ecx),%eax
 44d:	88 02                	mov    %al,(%edx)
 44f:	8d 49 01             	lea    0x1(%ecx),%ecx
 452:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 455:	89 d8                	mov    %ebx,%eax
 457:	8d 58 ff             	lea    -0x1(%eax),%ebx
 45a:	85 c0                	test   %eax,%eax
 45c:	7f ec                	jg     44a <memmove+0x12>
  return vdst;
}
 45e:	89 f0                	mov    %esi,%eax
 460:	5b                   	pop    %ebx
 461:	5e                   	pop    %esi
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    

00000464 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 46a:	68 00 20 00 00       	push   $0x2000
 46f:	e8 0c 04 00 00       	call   880 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 474:	83 c4 10             	add    $0x10,%esp
 477:	a9 ff 0f 00 00       	test   $0xfff,%eax
 47c:	74 0a                	je     488 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 47e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 483:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 488:	50                   	push   %eax
 489:	ff 75 10             	push   0x10(%ebp)
 48c:	ff 75 0c             	push   0xc(%ebp)
 48f:	ff 75 08             	push   0x8(%ebp)
 492:	e8 0e 01 00 00       	call   5a5 <clone>
  return pid;
}
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <thread_join>:
int
thread_join()
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	53                   	push   %ebx
 49d:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 4a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a3:	50                   	push   %eax
 4a4:	e8 04 01 00 00       	call   5ad <join>
 4a9:	89 c3                	mov    %eax,%ebx
  free(stack);
 4ab:	83 c4 04             	add    $0x4,%esp
 4ae:	ff 75 f4             	push   -0xc(%ebp)
 4b1:	e8 0a 03 00 00       	call   7c0 <free>
  return pid;
}
 4b6:	89 d8                	mov    %ebx,%eax
 4b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4bb:	c9                   	leave  
 4bc:	c3                   	ret    

000004bd <lock_init>:
int
lock_init(lock_t * lock){
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4c0:	8b 45 08             	mov    0x8(%ebp),%eax
 4c3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 4c9:	b8 00 00 00 00       	mov    $0x0,%eax
 4ce:	5d                   	pop    %ebp
 4cf:	c3                   	ret    

000004d0 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("lock; xchgl %0, %1" :
 4d6:	b8 01 00 00 00       	mov    $0x1,%eax
 4db:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 4de:	83 f8 01             	cmp    $0x1,%eax
 4e1:	74 f3                	je     4d6 <lock_acquire+0x6>
  {

  }
  return 0;
}
 4e3:	b8 00 00 00 00       	mov    $0x0,%eax
 4e8:	5d                   	pop    %ebp
 4e9:	c3                   	ret    

000004ea <lock_release>:
int
lock_release(lock_t * lock){
 4ea:	55                   	push   %ebp
 4eb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4ed:	8b 45 08             	mov    0x8(%ebp),%eax
 4f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 4f6:	b8 00 00 00 00       	mov    $0x0,%eax
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    

000004fd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4fd:	b8 01 00 00 00       	mov    $0x1,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <exit>:
SYSCALL(exit)
 505:	b8 02 00 00 00       	mov    $0x2,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <wait>:
SYSCALL(wait)
 50d:	b8 03 00 00 00       	mov    $0x3,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <pipe>:
SYSCALL(pipe)
 515:	b8 04 00 00 00       	mov    $0x4,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <read>:
SYSCALL(read)
 51d:	b8 05 00 00 00       	mov    $0x5,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <write>:
SYSCALL(write)
 525:	b8 10 00 00 00       	mov    $0x10,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <close>:
SYSCALL(close)
 52d:	b8 15 00 00 00       	mov    $0x15,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <kill>:
SYSCALL(kill)
 535:	b8 06 00 00 00       	mov    $0x6,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <exec>:
SYSCALL(exec)
 53d:	b8 07 00 00 00       	mov    $0x7,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <open>:
SYSCALL(open)
 545:	b8 0f 00 00 00       	mov    $0xf,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <mknod>:
SYSCALL(mknod)
 54d:	b8 11 00 00 00       	mov    $0x11,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <unlink>:
SYSCALL(unlink)
 555:	b8 12 00 00 00       	mov    $0x12,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <fstat>:
SYSCALL(fstat)
 55d:	b8 08 00 00 00       	mov    $0x8,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <link>:
SYSCALL(link)
 565:	b8 13 00 00 00       	mov    $0x13,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <mkdir>:
SYSCALL(mkdir)
 56d:	b8 14 00 00 00       	mov    $0x14,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <chdir>:
SYSCALL(chdir)
 575:	b8 09 00 00 00       	mov    $0x9,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <dup>:
SYSCALL(dup)
 57d:	b8 0a 00 00 00       	mov    $0xa,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <getpid>:
SYSCALL(getpid)
 585:	b8 0b 00 00 00       	mov    $0xb,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <sbrk>:
SYSCALL(sbrk)
 58d:	b8 0c 00 00 00       	mov    $0xc,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <sleep>:
SYSCALL(sleep)
 595:	b8 0d 00 00 00       	mov    $0xd,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <uptime>:
SYSCALL(uptime)
 59d:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <clone>:
SYSCALL(clone)
 5a5:	b8 16 00 00 00       	mov    $0x16,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <join>:
SYSCALL(join)
 5ad:	b8 17 00 00 00       	mov    $0x17,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5b5:	55                   	push   %ebp
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	83 ec 1c             	sub    $0x1c,%esp
 5bb:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5be:	6a 01                	push   $0x1
 5c0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5c3:	52                   	push   %edx
 5c4:	50                   	push   %eax
 5c5:	e8 5b ff ff ff       	call   525 <write>
}
 5ca:	83 c4 10             	add    $0x10,%esp
 5cd:	c9                   	leave  
 5ce:	c3                   	ret    

000005cf <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5cf:	55                   	push   %ebp
 5d0:	89 e5                	mov    %esp,%ebp
 5d2:	57                   	push   %edi
 5d3:	56                   	push   %esi
 5d4:	53                   	push   %ebx
 5d5:	83 ec 2c             	sub    $0x2c,%esp
 5d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5db:	89 d0                	mov    %edx,%eax
 5dd:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5df:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5e3:	0f 95 c1             	setne  %cl
 5e6:	c1 ea 1f             	shr    $0x1f,%edx
 5e9:	84 d1                	test   %dl,%cl
 5eb:	74 44                	je     631 <printint+0x62>
    neg = 1;
    x = -xx;
 5ed:	f7 d8                	neg    %eax
 5ef:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5f1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5f8:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5fd:	89 c8                	mov    %ecx,%eax
 5ff:	ba 00 00 00 00       	mov    $0x0,%edx
 604:	f7 f6                	div    %esi
 606:	89 df                	mov    %ebx,%edi
 608:	83 c3 01             	add    $0x1,%ebx
 60b:	0f b6 92 38 0a 00 00 	movzbl 0xa38(%edx),%edx
 612:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 616:	89 ca                	mov    %ecx,%edx
 618:	89 c1                	mov    %eax,%ecx
 61a:	39 d6                	cmp    %edx,%esi
 61c:	76 df                	jbe    5fd <printint+0x2e>
  if(neg)
 61e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 622:	74 31                	je     655 <printint+0x86>
    buf[i++] = '-';
 624:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 629:	8d 5f 02             	lea    0x2(%edi),%ebx
 62c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 62f:	eb 17                	jmp    648 <printint+0x79>
    x = xx;
 631:	89 c1                	mov    %eax,%ecx
  neg = 0;
 633:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 63a:	eb bc                	jmp    5f8 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 63c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 641:	89 f0                	mov    %esi,%eax
 643:	e8 6d ff ff ff       	call   5b5 <putc>
  while(--i >= 0)
 648:	83 eb 01             	sub    $0x1,%ebx
 64b:	79 ef                	jns    63c <printint+0x6d>
}
 64d:	83 c4 2c             	add    $0x2c,%esp
 650:	5b                   	pop    %ebx
 651:	5e                   	pop    %esi
 652:	5f                   	pop    %edi
 653:	5d                   	pop    %ebp
 654:	c3                   	ret    
 655:	8b 75 d0             	mov    -0x30(%ebp),%esi
 658:	eb ee                	jmp    648 <printint+0x79>

0000065a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 65a:	55                   	push   %ebp
 65b:	89 e5                	mov    %esp,%ebp
 65d:	57                   	push   %edi
 65e:	56                   	push   %esi
 65f:	53                   	push   %ebx
 660:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 663:	8d 45 10             	lea    0x10(%ebp),%eax
 666:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 669:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 66e:	bb 00 00 00 00       	mov    $0x0,%ebx
 673:	eb 14                	jmp    689 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 675:	89 fa                	mov    %edi,%edx
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	e8 36 ff ff ff       	call   5b5 <putc>
 67f:	eb 05                	jmp    686 <printf+0x2c>
      }
    } else if(state == '%'){
 681:	83 fe 25             	cmp    $0x25,%esi
 684:	74 25                	je     6ab <printf+0x51>
  for(i = 0; fmt[i]; i++){
 686:	83 c3 01             	add    $0x1,%ebx
 689:	8b 45 0c             	mov    0xc(%ebp),%eax
 68c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 690:	84 c0                	test   %al,%al
 692:	0f 84 20 01 00 00    	je     7b8 <printf+0x15e>
    c = fmt[i] & 0xff;
 698:	0f be f8             	movsbl %al,%edi
 69b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 69e:	85 f6                	test   %esi,%esi
 6a0:	75 df                	jne    681 <printf+0x27>
      if(c == '%'){
 6a2:	83 f8 25             	cmp    $0x25,%eax
 6a5:	75 ce                	jne    675 <printf+0x1b>
        state = '%';
 6a7:	89 c6                	mov    %eax,%esi
 6a9:	eb db                	jmp    686 <printf+0x2c>
      if(c == 'd'){
 6ab:	83 f8 25             	cmp    $0x25,%eax
 6ae:	0f 84 cf 00 00 00    	je     783 <printf+0x129>
 6b4:	0f 8c dd 00 00 00    	jl     797 <printf+0x13d>
 6ba:	83 f8 78             	cmp    $0x78,%eax
 6bd:	0f 8f d4 00 00 00    	jg     797 <printf+0x13d>
 6c3:	83 f8 63             	cmp    $0x63,%eax
 6c6:	0f 8c cb 00 00 00    	jl     797 <printf+0x13d>
 6cc:	83 e8 63             	sub    $0x63,%eax
 6cf:	83 f8 15             	cmp    $0x15,%eax
 6d2:	0f 87 bf 00 00 00    	ja     797 <printf+0x13d>
 6d8:	ff 24 85 e0 09 00 00 	jmp    *0x9e0(,%eax,4)
        printint(fd, *ap, 10, 1);
 6df:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e2:	8b 17                	mov    (%edi),%edx
 6e4:	83 ec 0c             	sub    $0xc,%esp
 6e7:	6a 01                	push   $0x1
 6e9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6ee:	8b 45 08             	mov    0x8(%ebp),%eax
 6f1:	e8 d9 fe ff ff       	call   5cf <printint>
        ap++;
 6f6:	83 c7 04             	add    $0x4,%edi
 6f9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6fc:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6ff:	be 00 00 00 00       	mov    $0x0,%esi
 704:	eb 80                	jmp    686 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 706:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 709:	8b 17                	mov    (%edi),%edx
 70b:	83 ec 0c             	sub    $0xc,%esp
 70e:	6a 00                	push   $0x0
 710:	b9 10 00 00 00       	mov    $0x10,%ecx
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	e8 b2 fe ff ff       	call   5cf <printint>
        ap++;
 71d:	83 c7 04             	add    $0x4,%edi
 720:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 723:	83 c4 10             	add    $0x10,%esp
      state = 0;
 726:	be 00 00 00 00       	mov    $0x0,%esi
 72b:	e9 56 ff ff ff       	jmp    686 <printf+0x2c>
        s = (char*)*ap;
 730:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 733:	8b 30                	mov    (%eax),%esi
        ap++;
 735:	83 c0 04             	add    $0x4,%eax
 738:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 73b:	85 f6                	test   %esi,%esi
 73d:	75 15                	jne    754 <printf+0xfa>
          s = "(null)";
 73f:	be d7 09 00 00       	mov    $0x9d7,%esi
 744:	eb 0e                	jmp    754 <printf+0xfa>
          putc(fd, *s);
 746:	0f be d2             	movsbl %dl,%edx
 749:	8b 45 08             	mov    0x8(%ebp),%eax
 74c:	e8 64 fe ff ff       	call   5b5 <putc>
          s++;
 751:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 754:	0f b6 16             	movzbl (%esi),%edx
 757:	84 d2                	test   %dl,%dl
 759:	75 eb                	jne    746 <printf+0xec>
      state = 0;
 75b:	be 00 00 00 00       	mov    $0x0,%esi
 760:	e9 21 ff ff ff       	jmp    686 <printf+0x2c>
        putc(fd, *ap);
 765:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 768:	0f be 17             	movsbl (%edi),%edx
 76b:	8b 45 08             	mov    0x8(%ebp),%eax
 76e:	e8 42 fe ff ff       	call   5b5 <putc>
        ap++;
 773:	83 c7 04             	add    $0x4,%edi
 776:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 779:	be 00 00 00 00       	mov    $0x0,%esi
 77e:	e9 03 ff ff ff       	jmp    686 <printf+0x2c>
        putc(fd, c);
 783:	89 fa                	mov    %edi,%edx
 785:	8b 45 08             	mov    0x8(%ebp),%eax
 788:	e8 28 fe ff ff       	call   5b5 <putc>
      state = 0;
 78d:	be 00 00 00 00       	mov    $0x0,%esi
 792:	e9 ef fe ff ff       	jmp    686 <printf+0x2c>
        putc(fd, '%');
 797:	ba 25 00 00 00       	mov    $0x25,%edx
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	e8 11 fe ff ff       	call   5b5 <putc>
        putc(fd, c);
 7a4:	89 fa                	mov    %edi,%edx
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	e8 07 fe ff ff       	call   5b5 <putc>
      state = 0;
 7ae:	be 00 00 00 00       	mov    $0x0,%esi
 7b3:	e9 ce fe ff ff       	jmp    686 <printf+0x2c>
    }
  }
}
 7b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7bb:	5b                   	pop    %ebx
 7bc:	5e                   	pop    %esi
 7bd:	5f                   	pop    %edi
 7be:	5d                   	pop    %ebp
 7bf:	c3                   	ret    

000007c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7cc:	a1 a8 0d 00 00       	mov    0xda8,%eax
 7d1:	eb 02                	jmp    7d5 <free+0x15>
 7d3:	89 d0                	mov    %edx,%eax
 7d5:	39 c8                	cmp    %ecx,%eax
 7d7:	73 04                	jae    7dd <free+0x1d>
 7d9:	39 08                	cmp    %ecx,(%eax)
 7db:	77 12                	ja     7ef <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7dd:	8b 10                	mov    (%eax),%edx
 7df:	39 c2                	cmp    %eax,%edx
 7e1:	77 f0                	ja     7d3 <free+0x13>
 7e3:	39 c8                	cmp    %ecx,%eax
 7e5:	72 08                	jb     7ef <free+0x2f>
 7e7:	39 ca                	cmp    %ecx,%edx
 7e9:	77 04                	ja     7ef <free+0x2f>
 7eb:	89 d0                	mov    %edx,%eax
 7ed:	eb e6                	jmp    7d5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ef:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7f5:	8b 10                	mov    (%eax),%edx
 7f7:	39 d7                	cmp    %edx,%edi
 7f9:	74 19                	je     814 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7fb:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fe:	8b 50 04             	mov    0x4(%eax),%edx
 801:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 804:	39 ce                	cmp    %ecx,%esi
 806:	74 1b                	je     823 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 808:	89 08                	mov    %ecx,(%eax)
  freep = p;
 80a:	a3 a8 0d 00 00       	mov    %eax,0xda8
}
 80f:	5b                   	pop    %ebx
 810:	5e                   	pop    %esi
 811:	5f                   	pop    %edi
 812:	5d                   	pop    %ebp
 813:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 814:	03 72 04             	add    0x4(%edx),%esi
 817:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 81a:	8b 10                	mov    (%eax),%edx
 81c:	8b 12                	mov    (%edx),%edx
 81e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 821:	eb db                	jmp    7fe <free+0x3e>
    p->s.size += bp->s.size;
 823:	03 53 fc             	add    -0x4(%ebx),%edx
 826:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 829:	8b 53 f8             	mov    -0x8(%ebx),%edx
 82c:	89 10                	mov    %edx,(%eax)
 82e:	eb da                	jmp    80a <free+0x4a>

00000830 <morecore>:

static Header*
morecore(uint nu)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	53                   	push   %ebx
 834:	83 ec 04             	sub    $0x4,%esp
 837:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 839:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 83e:	77 05                	ja     845 <morecore+0x15>
    nu = 4096;
 840:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 845:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 84c:	83 ec 0c             	sub    $0xc,%esp
 84f:	50                   	push   %eax
 850:	e8 38 fd ff ff       	call   58d <sbrk>
  if(p == (char*)-1)
 855:	83 c4 10             	add    $0x10,%esp
 858:	83 f8 ff             	cmp    $0xffffffff,%eax
 85b:	74 1c                	je     879 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 85d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 860:	83 c0 08             	add    $0x8,%eax
 863:	83 ec 0c             	sub    $0xc,%esp
 866:	50                   	push   %eax
 867:	e8 54 ff ff ff       	call   7c0 <free>
  return freep;
 86c:	a1 a8 0d 00 00       	mov    0xda8,%eax
 871:	83 c4 10             	add    $0x10,%esp
}
 874:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 877:	c9                   	leave  
 878:	c3                   	ret    
    return 0;
 879:	b8 00 00 00 00       	mov    $0x0,%eax
 87e:	eb f4                	jmp    874 <morecore+0x44>

00000880 <malloc>:

void*
malloc(uint nbytes)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	53                   	push   %ebx
 884:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 887:	8b 45 08             	mov    0x8(%ebp),%eax
 88a:	8d 58 07             	lea    0x7(%eax),%ebx
 88d:	c1 eb 03             	shr    $0x3,%ebx
 890:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 893:	8b 0d a8 0d 00 00    	mov    0xda8,%ecx
 899:	85 c9                	test   %ecx,%ecx
 89b:	74 04                	je     8a1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 89d:	8b 01                	mov    (%ecx),%eax
 89f:	eb 4a                	jmp    8eb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8a1:	c7 05 a8 0d 00 00 ac 	movl   $0xdac,0xda8
 8a8:	0d 00 00 
 8ab:	c7 05 ac 0d 00 00 ac 	movl   $0xdac,0xdac
 8b2:	0d 00 00 
    base.s.size = 0;
 8b5:	c7 05 b0 0d 00 00 00 	movl   $0x0,0xdb0
 8bc:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8bf:	b9 ac 0d 00 00       	mov    $0xdac,%ecx
 8c4:	eb d7                	jmp    89d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8c6:	74 19                	je     8e1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8c8:	29 da                	sub    %ebx,%edx
 8ca:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8cd:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8d0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8d3:	89 0d a8 0d 00 00    	mov    %ecx,0xda8
      return (void*)(p + 1);
 8d9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8df:	c9                   	leave  
 8e0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8e1:	8b 10                	mov    (%eax),%edx
 8e3:	89 11                	mov    %edx,(%ecx)
 8e5:	eb ec                	jmp    8d3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e7:	89 c1                	mov    %eax,%ecx
 8e9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8eb:	8b 50 04             	mov    0x4(%eax),%edx
 8ee:	39 da                	cmp    %ebx,%edx
 8f0:	73 d4                	jae    8c6 <malloc+0x46>
    if(p == freep)
 8f2:	39 05 a8 0d 00 00    	cmp    %eax,0xda8
 8f8:	75 ed                	jne    8e7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8fa:	89 d8                	mov    %ebx,%eax
 8fc:	e8 2f ff ff ff       	call   830 <morecore>
 901:	85 c0                	test   %eax,%eax
 903:	75 e2                	jne    8e7 <malloc+0x67>
 905:	eb d5                	jmp    8dc <malloc+0x5c>
