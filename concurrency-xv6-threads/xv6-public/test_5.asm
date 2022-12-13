
_test_5:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 ec 0d 00 00       	mov    0xdec,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 70 09 00 00       	push   $0x970
  31:	68 79 09 00 00       	push   $0x979
  36:	6a 01                	push   $0x1
  38:	e8 86 06 00 00       	call   6c3 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 b8 09 00 00       	push   $0x9b8
  45:	68 8c 09 00 00       	push   $0x98c
  4a:	6a 01                	push   $0x1
  4c:	e8 72 06 00 00       	call   6c3 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 a0 09 00 00       	push   $0x9a0
  59:	6a 01                	push   $0x1
  5b:	e8 63 06 00 00       	call   6c3 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 f0 0d 00 00    	push   0xdf0
  69:	e8 30 05 00 00       	call   59e <kill>
  6e:	e8 fb 04 00 00       	call   56e <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 70 09 00 00       	push   $0x970
  7a:	68 79 09 00 00       	push   $0x979
  7f:	6a 01                	push   $0x1
  81:	e8 3d 06 00 00       	call   6c3 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 81 09 00 00       	push   $0x981
  8e:	68 8c 09 00 00       	push   $0x98c
  93:	6a 01                	push   $0x1
  95:	e8 29 06 00 00       	call   6c3 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 a0 09 00 00       	push   $0x9a0
  a2:	6a 01                	push   $0x1
  a4:	e8 1a 06 00 00       	call   6c3 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 f0 0d 00 00    	push   0xdf0
  b2:	e8 e7 04 00 00       	call   59e <kill>
  b7:	e8 b2 04 00 00       	call   56e <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 70 09 00 00       	push   $0x970
  c3:	68 79 09 00 00       	push   $0x979
  c8:	6a 01                	push   $0x1
  ca:	e8 f4 05 00 00       	call   6c3 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 ad 09 00 00       	push   $0x9ad
  d7:	68 8c 09 00 00       	push   $0x98c
  dc:	6a 01                	push   $0x1
  de:	e8 e0 05 00 00       	call   6c3 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 a0 09 00 00       	push   $0x9a0
  eb:	6a 01                	push   $0x1
  ed:	e8 d1 05 00 00       	call   6c3 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 f0 0d 00 00    	push   0xdf0
  fb:	e8 9e 04 00 00       	call   59e <kill>
 100:	e8 69 04 00 00       	call   56e <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 ec 0d 00 00       	mov    %eax,0xdec
   exit();
 10d:	e8 5c 04 00 00       	call   56e <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 c3 04 00 00       	call   5ee <getpid>
 12b:	a3 f0 0d 00 00       	mov    %eax,0xdf0
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 ac 07 00 00       	call   8e9 <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 70 09 00 00       	push   $0x970
 15f:	68 79 09 00 00       	push   $0x979
 164:	6a 01                	push   $0x1
 166:	e8 58 05 00 00       	call   6c3 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 c4 09 00 00       	push   $0x9c4
 173:	68 8c 09 00 00       	push   $0x98c
 178:	6a 01                	push   $0x1
 17a:	e8 44 05 00 00       	call   6c3 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 a0 09 00 00       	push   $0x9a0
 187:	6a 01                	push   $0x1
 189:	e8 35 05 00 00       	call   6c3 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 f0 0d 00 00    	push   0xdf0
 197:	e8 02 04 00 00       	call   59e <kill>
 19c:	e8 cd 03 00 00       	call   56e <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 4a 04 00 00       	call   60e <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 3d 04 00 00       	call   616 <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 70 09 00 00       	push   $0x970
 1f4:	68 79 09 00 00       	push   $0x979
 1f9:	6a 01                	push   $0x1
 1fb:	e8 c3 04 00 00       	call   6c3 <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 f2 09 00 00       	push   $0x9f2
 208:	68 8c 09 00 00       	push   $0x98c
 20d:	6a 01                	push   $0x1
 20f:	e8 af 04 00 00       	call   6c3 <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 a0 09 00 00       	push   $0x9a0
 21c:	6a 01                	push   $0x1
 21e:	e8 a0 04 00 00       	call   6c3 <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 f0 0d 00 00    	push   0xdf0
 22c:	e8 6d 03 00 00       	call   59e <kill>
 231:	e8 38 03 00 00       	call   56e <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 70 09 00 00       	push   $0x970
 23d:	68 79 09 00 00       	push   $0x979
 242:	6a 01                	push   $0x1
 244:	e8 7a 04 00 00       	call   6c3 <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 ce 09 00 00       	push   $0x9ce
 251:	68 8c 09 00 00       	push   $0x98c
 256:	6a 01                	push   $0x1
 258:	e8 66 04 00 00       	call   6c3 <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 a0 09 00 00       	push   $0x9a0
 265:	6a 01                	push   $0x1
 267:	e8 57 04 00 00       	call   6c3 <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 f0 0d 00 00    	push   0xdf0
 275:	e8 24 03 00 00       	call   59e <kill>
 27a:	e8 ef 02 00 00       	call   56e <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 70 09 00 00       	push   $0x970
 286:	68 79 09 00 00       	push   $0x979
 28b:	6a 01                	push   $0x1
 28d:	e8 31 04 00 00       	call   6c3 <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 dc 09 00 00       	push   $0x9dc
 29a:	68 8c 09 00 00       	push   $0x98c
 29f:	6a 01                	push   $0x1
 2a1:	e8 1d 04 00 00       	call   6c3 <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 a0 09 00 00       	push   $0x9a0
 2ae:	6a 01                	push   $0x1
 2b0:	e8 0e 04 00 00       	call   6c3 <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 f0 0d 00 00    	push   0xdf0
 2be:	e8 db 02 00 00       	call   59e <kill>
 2c3:	e8 a6 02 00 00       	call   56e <exit>
   assert(global == 2);
 2c8:	83 3d ec 0d 00 00 02 	cmpl   $0x2,0xdec
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 70 09 00 00       	push   $0x970
 2d8:	68 79 09 00 00       	push   $0x979
 2dd:	6a 01                	push   $0x1
 2df:	e8 df 03 00 00       	call   6c3 <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 06 0a 00 00       	push   $0xa06
 2ec:	68 8c 09 00 00       	push   $0x98c
 2f1:	6a 01                	push   $0x1
 2f3:	e8 cb 03 00 00       	call   6c3 <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 a0 09 00 00       	push   $0x9a0
 300:	6a 01                	push   $0x1
 302:	e8 bc 03 00 00       	call   6c3 <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 f0 0d 00 00    	push   0xdf0
 310:	e8 89 02 00 00       	call   59e <kill>
 315:	e8 54 02 00 00       	call   56e <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 12 0a 00 00       	push   $0xa12
 322:	6a 01                	push   $0x1
 324:	e8 9a 03 00 00       	call   6c3 <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 f8 04 00 00       	call   829 <free>
   exit();
 331:	e8 38 02 00 00       	call   56e <exit>

00000336 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	56                   	push   %esi
 33a:	53                   	push   %ebx
 33b:	8b 75 08             	mov    0x8(%ebp),%esi
 33e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	89 f0                	mov    %esi,%eax
 343:	89 d1                	mov    %edx,%ecx
 345:	83 c2 01             	add    $0x1,%edx
 348:	89 c3                	mov    %eax,%ebx
 34a:	83 c0 01             	add    $0x1,%eax
 34d:	0f b6 09             	movzbl (%ecx),%ecx
 350:	88 0b                	mov    %cl,(%ebx)
 352:	84 c9                	test   %cl,%cl
 354:	75 ed                	jne    343 <strcpy+0xd>
    ;
  return os;
}
 356:	89 f0                	mov    %esi,%eax
 358:	5b                   	pop    %ebx
 359:	5e                   	pop    %esi
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 362:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 365:	eb 06                	jmp    36d <strcmp+0x11>
    p++, q++;
 367:	83 c1 01             	add    $0x1,%ecx
 36a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 36d:	0f b6 01             	movzbl (%ecx),%eax
 370:	84 c0                	test   %al,%al
 372:	74 04                	je     378 <strcmp+0x1c>
 374:	3a 02                	cmp    (%edx),%al
 376:	74 ef                	je     367 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 378:	0f b6 c0             	movzbl %al,%eax
 37b:	0f b6 12             	movzbl (%edx),%edx
 37e:	29 d0                	sub    %edx,%eax
}
 380:	5d                   	pop    %ebp
 381:	c3                   	ret    

00000382 <strlen>:

uint
strlen(const char *s)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 388:	b8 00 00 00 00       	mov    $0x0,%eax
 38d:	eb 03                	jmp    392 <strlen+0x10>
 38f:	83 c0 01             	add    $0x1,%eax
 392:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 396:	75 f7                	jne    38f <strlen+0xd>
    ;
  return n;
}
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    

0000039a <memset>:

void*
memset(void *dst, int c, uint n)
{
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
 39d:	57                   	push   %edi
 39e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3a1:	89 d7                	mov    %edx,%edi
 3a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a9:	fc                   	cld    
 3aa:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ac:	89 d0                	mov    %edx,%eax
 3ae:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3b1:	c9                   	leave  
 3b2:	c3                   	ret    

000003b3 <strchr>:

char*
strchr(const char *s, char c)
{
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
 3b9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3bd:	eb 03                	jmp    3c2 <strchr+0xf>
 3bf:	83 c0 01             	add    $0x1,%eax
 3c2:	0f b6 10             	movzbl (%eax),%edx
 3c5:	84 d2                	test   %dl,%dl
 3c7:	74 06                	je     3cf <strchr+0x1c>
    if(*s == c)
 3c9:	38 ca                	cmp    %cl,%dl
 3cb:	75 f2                	jne    3bf <strchr+0xc>
 3cd:	eb 05                	jmp    3d4 <strchr+0x21>
      return (char*)s;
  return 0;
 3cf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret    

000003d6 <gets>:

char*
gets(char *buf, int max)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	57                   	push   %edi
 3da:	56                   	push   %esi
 3db:	53                   	push   %ebx
 3dc:	83 ec 1c             	sub    $0x1c,%esp
 3df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3e2:	bb 00 00 00 00       	mov    $0x0,%ebx
 3e7:	89 de                	mov    %ebx,%esi
 3e9:	83 c3 01             	add    $0x1,%ebx
 3ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ef:	7d 2e                	jge    41f <gets+0x49>
    cc = read(0, &c, 1);
 3f1:	83 ec 04             	sub    $0x4,%esp
 3f4:	6a 01                	push   $0x1
 3f6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f9:	50                   	push   %eax
 3fa:	6a 00                	push   $0x0
 3fc:	e8 85 01 00 00       	call   586 <read>
    if(cc < 1)
 401:	83 c4 10             	add    $0x10,%esp
 404:	85 c0                	test   %eax,%eax
 406:	7e 17                	jle    41f <gets+0x49>
      break;
    buf[i++] = c;
 408:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 40c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 40f:	3c 0a                	cmp    $0xa,%al
 411:	0f 94 c2             	sete   %dl
 414:	3c 0d                	cmp    $0xd,%al
 416:	0f 94 c0             	sete   %al
 419:	08 c2                	or     %al,%dl
 41b:	74 ca                	je     3e7 <gets+0x11>
    buf[i++] = c;
 41d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 41f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 423:	89 f8                	mov    %edi,%eax
 425:	8d 65 f4             	lea    -0xc(%ebp),%esp
 428:	5b                   	pop    %ebx
 429:	5e                   	pop    %esi
 42a:	5f                   	pop    %edi
 42b:	5d                   	pop    %ebp
 42c:	c3                   	ret    

0000042d <stat>:

int
stat(const char *n, struct stat *st)
{
 42d:	55                   	push   %ebp
 42e:	89 e5                	mov    %esp,%ebp
 430:	56                   	push   %esi
 431:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 432:	83 ec 08             	sub    $0x8,%esp
 435:	6a 00                	push   $0x0
 437:	ff 75 08             	push   0x8(%ebp)
 43a:	e8 6f 01 00 00       	call   5ae <open>
  if(fd < 0)
 43f:	83 c4 10             	add    $0x10,%esp
 442:	85 c0                	test   %eax,%eax
 444:	78 24                	js     46a <stat+0x3d>
 446:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 448:	83 ec 08             	sub    $0x8,%esp
 44b:	ff 75 0c             	push   0xc(%ebp)
 44e:	50                   	push   %eax
 44f:	e8 72 01 00 00       	call   5c6 <fstat>
 454:	89 c6                	mov    %eax,%esi
  close(fd);
 456:	89 1c 24             	mov    %ebx,(%esp)
 459:	e8 38 01 00 00       	call   596 <close>
  return r;
 45e:	83 c4 10             	add    $0x10,%esp
}
 461:	89 f0                	mov    %esi,%eax
 463:	8d 65 f8             	lea    -0x8(%ebp),%esp
 466:	5b                   	pop    %ebx
 467:	5e                   	pop    %esi
 468:	5d                   	pop    %ebp
 469:	c3                   	ret    
    return -1;
 46a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 46f:	eb f0                	jmp    461 <stat+0x34>

00000471 <atoi>:

int
atoi(const char *s)
{
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	53                   	push   %ebx
 475:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 478:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 47d:	eb 10                	jmp    48f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 47f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 482:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 485:	83 c1 01             	add    $0x1,%ecx
 488:	0f be c0             	movsbl %al,%eax
 48b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 48f:	0f b6 01             	movzbl (%ecx),%eax
 492:	8d 58 d0             	lea    -0x30(%eax),%ebx
 495:	80 fb 09             	cmp    $0x9,%bl
 498:	76 e5                	jbe    47f <atoi+0xe>
  return n;
}
 49a:	89 d0                	mov    %edx,%eax
 49c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49f:	c9                   	leave  
 4a0:	c3                   	ret    

000004a1 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4a1:	55                   	push   %ebp
 4a2:	89 e5                	mov    %esp,%ebp
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	8b 75 08             	mov    0x8(%ebp),%esi
 4a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ac:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4af:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4b1:	eb 0d                	jmp    4c0 <memmove+0x1f>
    *dst++ = *src++;
 4b3:	0f b6 01             	movzbl (%ecx),%eax
 4b6:	88 02                	mov    %al,(%edx)
 4b8:	8d 49 01             	lea    0x1(%ecx),%ecx
 4bb:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4be:	89 d8                	mov    %ebx,%eax
 4c0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4c3:	85 c0                	test   %eax,%eax
 4c5:	7f ec                	jg     4b3 <memmove+0x12>
  return vdst;
}
 4c7:	89 f0                	mov    %esi,%eax
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    

000004cd <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 4cd:	55                   	push   %ebp
 4ce:	89 e5                	mov    %esp,%ebp
 4d0:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 4d3:	68 00 20 00 00       	push   $0x2000
 4d8:	e8 0c 04 00 00       	call   8e9 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 4dd:	83 c4 10             	add    $0x10,%esp
 4e0:	a9 ff 0f 00 00       	test   $0xfff,%eax
 4e5:	74 0a                	je     4f1 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 4e7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 4ec:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 4f1:	50                   	push   %eax
 4f2:	ff 75 10             	push   0x10(%ebp)
 4f5:	ff 75 0c             	push   0xc(%ebp)
 4f8:	ff 75 08             	push   0x8(%ebp)
 4fb:	e8 0e 01 00 00       	call   60e <clone>
  return pid;
}
 500:	c9                   	leave  
 501:	c3                   	ret    

00000502 <thread_join>:
int
thread_join()
{
 502:	55                   	push   %ebp
 503:	89 e5                	mov    %esp,%ebp
 505:	53                   	push   %ebx
 506:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 509:	8d 45 f4             	lea    -0xc(%ebp),%eax
 50c:	50                   	push   %eax
 50d:	e8 04 01 00 00       	call   616 <join>
 512:	89 c3                	mov    %eax,%ebx
  free(stack);
 514:	83 c4 04             	add    $0x4,%esp
 517:	ff 75 f4             	push   -0xc(%ebp)
 51a:	e8 0a 03 00 00       	call   829 <free>
  return pid;
}
 51f:	89 d8                	mov    %ebx,%eax
 521:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 524:	c9                   	leave  
 525:	c3                   	ret    

00000526 <lock_init>:
int
lock_init(lock_t * lock){
 526:	55                   	push   %ebp
 527:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 529:	8b 45 08             	mov    0x8(%ebp),%eax
 52c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 532:	b8 00 00 00 00       	mov    $0x0,%eax
 537:	5d                   	pop    %ebp
 538:	c3                   	ret    

00000539 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 539:	55                   	push   %ebp
 53a:	89 e5                	mov    %esp,%ebp
 53c:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 53f:	b8 01 00 00 00       	mov    $0x1,%eax
 544:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 547:	83 f8 01             	cmp    $0x1,%eax
 54a:	74 f3                	je     53f <lock_acquire+0x6>
  {

  }
  return 0;
}
 54c:	b8 00 00 00 00       	mov    $0x0,%eax
 551:	5d                   	pop    %ebp
 552:	c3                   	ret    

00000553 <lock_release>:
int
lock_release(lock_t * lock){
 553:	55                   	push   %ebp
 554:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 55f:	b8 00 00 00 00       	mov    $0x0,%eax
 564:	5d                   	pop    %ebp
 565:	c3                   	ret    

00000566 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 566:	b8 01 00 00 00       	mov    $0x1,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <exit>:
SYSCALL(exit)
 56e:	b8 02 00 00 00       	mov    $0x2,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <wait>:
SYSCALL(wait)
 576:	b8 03 00 00 00       	mov    $0x3,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <pipe>:
SYSCALL(pipe)
 57e:	b8 04 00 00 00       	mov    $0x4,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <read>:
SYSCALL(read)
 586:	b8 05 00 00 00       	mov    $0x5,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <write>:
SYSCALL(write)
 58e:	b8 10 00 00 00       	mov    $0x10,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <close>:
SYSCALL(close)
 596:	b8 15 00 00 00       	mov    $0x15,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <kill>:
SYSCALL(kill)
 59e:	b8 06 00 00 00       	mov    $0x6,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <exec>:
SYSCALL(exec)
 5a6:	b8 07 00 00 00       	mov    $0x7,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <open>:
SYSCALL(open)
 5ae:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <mknod>:
SYSCALL(mknod)
 5b6:	b8 11 00 00 00       	mov    $0x11,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <unlink>:
SYSCALL(unlink)
 5be:	b8 12 00 00 00       	mov    $0x12,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <fstat>:
SYSCALL(fstat)
 5c6:	b8 08 00 00 00       	mov    $0x8,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <link>:
SYSCALL(link)
 5ce:	b8 13 00 00 00       	mov    $0x13,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <mkdir>:
SYSCALL(mkdir)
 5d6:	b8 14 00 00 00       	mov    $0x14,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <chdir>:
SYSCALL(chdir)
 5de:	b8 09 00 00 00       	mov    $0x9,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <dup>:
SYSCALL(dup)
 5e6:	b8 0a 00 00 00       	mov    $0xa,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <getpid>:
SYSCALL(getpid)
 5ee:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <sbrk>:
SYSCALL(sbrk)
 5f6:	b8 0c 00 00 00       	mov    $0xc,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <sleep>:
SYSCALL(sleep)
 5fe:	b8 0d 00 00 00       	mov    $0xd,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <uptime>:
SYSCALL(uptime)
 606:	b8 0e 00 00 00       	mov    $0xe,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <clone>:
SYSCALL(clone)
 60e:	b8 16 00 00 00       	mov    $0x16,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <join>:
SYSCALL(join)
 616:	b8 17 00 00 00       	mov    $0x17,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 61e:	55                   	push   %ebp
 61f:	89 e5                	mov    %esp,%ebp
 621:	83 ec 1c             	sub    $0x1c,%esp
 624:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 627:	6a 01                	push   $0x1
 629:	8d 55 f4             	lea    -0xc(%ebp),%edx
 62c:	52                   	push   %edx
 62d:	50                   	push   %eax
 62e:	e8 5b ff ff ff       	call   58e <write>
}
 633:	83 c4 10             	add    $0x10,%esp
 636:	c9                   	leave  
 637:	c3                   	ret    

00000638 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 638:	55                   	push   %ebp
 639:	89 e5                	mov    %esp,%ebp
 63b:	57                   	push   %edi
 63c:	56                   	push   %esi
 63d:	53                   	push   %ebx
 63e:	83 ec 2c             	sub    $0x2c,%esp
 641:	89 45 d0             	mov    %eax,-0x30(%ebp)
 644:	89 d0                	mov    %edx,%eax
 646:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 648:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 64c:	0f 95 c1             	setne  %cl
 64f:	c1 ea 1f             	shr    $0x1f,%edx
 652:	84 d1                	test   %dl,%cl
 654:	74 44                	je     69a <printint+0x62>
    neg = 1;
    x = -xx;
 656:	f7 d8                	neg    %eax
 658:	89 c1                	mov    %eax,%ecx
    neg = 1;
 65a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 661:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 666:	89 c8                	mov    %ecx,%eax
 668:	ba 00 00 00 00       	mov    $0x0,%edx
 66d:	f7 f6                	div    %esi
 66f:	89 df                	mov    %ebx,%edi
 671:	83 c3 01             	add    $0x1,%ebx
 674:	0f b6 92 80 0a 00 00 	movzbl 0xa80(%edx),%edx
 67b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 67f:	89 ca                	mov    %ecx,%edx
 681:	89 c1                	mov    %eax,%ecx
 683:	39 d6                	cmp    %edx,%esi
 685:	76 df                	jbe    666 <printint+0x2e>
  if(neg)
 687:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 68b:	74 31                	je     6be <printint+0x86>
    buf[i++] = '-';
 68d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 692:	8d 5f 02             	lea    0x2(%edi),%ebx
 695:	8b 75 d0             	mov    -0x30(%ebp),%esi
 698:	eb 17                	jmp    6b1 <printint+0x79>
    x = xx;
 69a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 69c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6a3:	eb bc                	jmp    661 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6a5:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6aa:	89 f0                	mov    %esi,%eax
 6ac:	e8 6d ff ff ff       	call   61e <putc>
  while(--i >= 0)
 6b1:	83 eb 01             	sub    $0x1,%ebx
 6b4:	79 ef                	jns    6a5 <printint+0x6d>
}
 6b6:	83 c4 2c             	add    $0x2c,%esp
 6b9:	5b                   	pop    %ebx
 6ba:	5e                   	pop    %esi
 6bb:	5f                   	pop    %edi
 6bc:	5d                   	pop    %ebp
 6bd:	c3                   	ret    
 6be:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6c1:	eb ee                	jmp    6b1 <printint+0x79>

000006c3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6c3:	55                   	push   %ebp
 6c4:	89 e5                	mov    %esp,%ebp
 6c6:	57                   	push   %edi
 6c7:	56                   	push   %esi
 6c8:	53                   	push   %ebx
 6c9:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6cc:	8d 45 10             	lea    0x10(%ebp),%eax
 6cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6d2:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6d7:	bb 00 00 00 00       	mov    $0x0,%ebx
 6dc:	eb 14                	jmp    6f2 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6de:	89 fa                	mov    %edi,%edx
 6e0:	8b 45 08             	mov    0x8(%ebp),%eax
 6e3:	e8 36 ff ff ff       	call   61e <putc>
 6e8:	eb 05                	jmp    6ef <printf+0x2c>
      }
    } else if(state == '%'){
 6ea:	83 fe 25             	cmp    $0x25,%esi
 6ed:	74 25                	je     714 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6ef:	83 c3 01             	add    $0x1,%ebx
 6f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 6f5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6f9:	84 c0                	test   %al,%al
 6fb:	0f 84 20 01 00 00    	je     821 <printf+0x15e>
    c = fmt[i] & 0xff;
 701:	0f be f8             	movsbl %al,%edi
 704:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 707:	85 f6                	test   %esi,%esi
 709:	75 df                	jne    6ea <printf+0x27>
      if(c == '%'){
 70b:	83 f8 25             	cmp    $0x25,%eax
 70e:	75 ce                	jne    6de <printf+0x1b>
        state = '%';
 710:	89 c6                	mov    %eax,%esi
 712:	eb db                	jmp    6ef <printf+0x2c>
      if(c == 'd'){
 714:	83 f8 25             	cmp    $0x25,%eax
 717:	0f 84 cf 00 00 00    	je     7ec <printf+0x129>
 71d:	0f 8c dd 00 00 00    	jl     800 <printf+0x13d>
 723:	83 f8 78             	cmp    $0x78,%eax
 726:	0f 8f d4 00 00 00    	jg     800 <printf+0x13d>
 72c:	83 f8 63             	cmp    $0x63,%eax
 72f:	0f 8c cb 00 00 00    	jl     800 <printf+0x13d>
 735:	83 e8 63             	sub    $0x63,%eax
 738:	83 f8 15             	cmp    $0x15,%eax
 73b:	0f 87 bf 00 00 00    	ja     800 <printf+0x13d>
 741:	ff 24 85 28 0a 00 00 	jmp    *0xa28(,%eax,4)
        printint(fd, *ap, 10, 1);
 748:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 74b:	8b 17                	mov    (%edi),%edx
 74d:	83 ec 0c             	sub    $0xc,%esp
 750:	6a 01                	push   $0x1
 752:	b9 0a 00 00 00       	mov    $0xa,%ecx
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	e8 d9 fe ff ff       	call   638 <printint>
        ap++;
 75f:	83 c7 04             	add    $0x4,%edi
 762:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 765:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 768:	be 00 00 00 00       	mov    $0x0,%esi
 76d:	eb 80                	jmp    6ef <printf+0x2c>
        printint(fd, *ap, 16, 0);
 76f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 772:	8b 17                	mov    (%edi),%edx
 774:	83 ec 0c             	sub    $0xc,%esp
 777:	6a 00                	push   $0x0
 779:	b9 10 00 00 00       	mov    $0x10,%ecx
 77e:	8b 45 08             	mov    0x8(%ebp),%eax
 781:	e8 b2 fe ff ff       	call   638 <printint>
        ap++;
 786:	83 c7 04             	add    $0x4,%edi
 789:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 78c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78f:	be 00 00 00 00       	mov    $0x0,%esi
 794:	e9 56 ff ff ff       	jmp    6ef <printf+0x2c>
        s = (char*)*ap;
 799:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79c:	8b 30                	mov    (%eax),%esi
        ap++;
 79e:	83 c0 04             	add    $0x4,%eax
 7a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7a4:	85 f6                	test   %esi,%esi
 7a6:	75 15                	jne    7bd <printf+0xfa>
          s = "(null)";
 7a8:	be 1f 0a 00 00       	mov    $0xa1f,%esi
 7ad:	eb 0e                	jmp    7bd <printf+0xfa>
          putc(fd, *s);
 7af:	0f be d2             	movsbl %dl,%edx
 7b2:	8b 45 08             	mov    0x8(%ebp),%eax
 7b5:	e8 64 fe ff ff       	call   61e <putc>
          s++;
 7ba:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7bd:	0f b6 16             	movzbl (%esi),%edx
 7c0:	84 d2                	test   %dl,%dl
 7c2:	75 eb                	jne    7af <printf+0xec>
      state = 0;
 7c4:	be 00 00 00 00       	mov    $0x0,%esi
 7c9:	e9 21 ff ff ff       	jmp    6ef <printf+0x2c>
        putc(fd, *ap);
 7ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7d1:	0f be 17             	movsbl (%edi),%edx
 7d4:	8b 45 08             	mov    0x8(%ebp),%eax
 7d7:	e8 42 fe ff ff       	call   61e <putc>
        ap++;
 7dc:	83 c7 04             	add    $0x4,%edi
 7df:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7e2:	be 00 00 00 00       	mov    $0x0,%esi
 7e7:	e9 03 ff ff ff       	jmp    6ef <printf+0x2c>
        putc(fd, c);
 7ec:	89 fa                	mov    %edi,%edx
 7ee:	8b 45 08             	mov    0x8(%ebp),%eax
 7f1:	e8 28 fe ff ff       	call   61e <putc>
      state = 0;
 7f6:	be 00 00 00 00       	mov    $0x0,%esi
 7fb:	e9 ef fe ff ff       	jmp    6ef <printf+0x2c>
        putc(fd, '%');
 800:	ba 25 00 00 00       	mov    $0x25,%edx
 805:	8b 45 08             	mov    0x8(%ebp),%eax
 808:	e8 11 fe ff ff       	call   61e <putc>
        putc(fd, c);
 80d:	89 fa                	mov    %edi,%edx
 80f:	8b 45 08             	mov    0x8(%ebp),%eax
 812:	e8 07 fe ff ff       	call   61e <putc>
      state = 0;
 817:	be 00 00 00 00       	mov    $0x0,%esi
 81c:	e9 ce fe ff ff       	jmp    6ef <printf+0x2c>
    }
  }
}
 821:	8d 65 f4             	lea    -0xc(%ebp),%esp
 824:	5b                   	pop    %ebx
 825:	5e                   	pop    %esi
 826:	5f                   	pop    %edi
 827:	5d                   	pop    %ebp
 828:	c3                   	ret    

00000829 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 829:	55                   	push   %ebp
 82a:	89 e5                	mov    %esp,%ebp
 82c:	57                   	push   %edi
 82d:	56                   	push   %esi
 82e:	53                   	push   %ebx
 82f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 832:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 835:	a1 f4 0d 00 00       	mov    0xdf4,%eax
 83a:	eb 02                	jmp    83e <free+0x15>
 83c:	89 d0                	mov    %edx,%eax
 83e:	39 c8                	cmp    %ecx,%eax
 840:	73 04                	jae    846 <free+0x1d>
 842:	39 08                	cmp    %ecx,(%eax)
 844:	77 12                	ja     858 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 846:	8b 10                	mov    (%eax),%edx
 848:	39 c2                	cmp    %eax,%edx
 84a:	77 f0                	ja     83c <free+0x13>
 84c:	39 c8                	cmp    %ecx,%eax
 84e:	72 08                	jb     858 <free+0x2f>
 850:	39 ca                	cmp    %ecx,%edx
 852:	77 04                	ja     858 <free+0x2f>
 854:	89 d0                	mov    %edx,%eax
 856:	eb e6                	jmp    83e <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 858:	8b 73 fc             	mov    -0x4(%ebx),%esi
 85b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 85e:	8b 10                	mov    (%eax),%edx
 860:	39 d7                	cmp    %edx,%edi
 862:	74 19                	je     87d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 864:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 867:	8b 50 04             	mov    0x4(%eax),%edx
 86a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 86d:	39 ce                	cmp    %ecx,%esi
 86f:	74 1b                	je     88c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 871:	89 08                	mov    %ecx,(%eax)
  freep = p;
 873:	a3 f4 0d 00 00       	mov    %eax,0xdf4
}
 878:	5b                   	pop    %ebx
 879:	5e                   	pop    %esi
 87a:	5f                   	pop    %edi
 87b:	5d                   	pop    %ebp
 87c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 87d:	03 72 04             	add    0x4(%edx),%esi
 880:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 883:	8b 10                	mov    (%eax),%edx
 885:	8b 12                	mov    (%edx),%edx
 887:	89 53 f8             	mov    %edx,-0x8(%ebx)
 88a:	eb db                	jmp    867 <free+0x3e>
    p->s.size += bp->s.size;
 88c:	03 53 fc             	add    -0x4(%ebx),%edx
 88f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 892:	8b 53 f8             	mov    -0x8(%ebx),%edx
 895:	89 10                	mov    %edx,(%eax)
 897:	eb da                	jmp    873 <free+0x4a>

00000899 <morecore>:

static Header*
morecore(uint nu)
{
 899:	55                   	push   %ebp
 89a:	89 e5                	mov    %esp,%ebp
 89c:	53                   	push   %ebx
 89d:	83 ec 04             	sub    $0x4,%esp
 8a0:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8a2:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8a7:	77 05                	ja     8ae <morecore+0x15>
    nu = 4096;
 8a9:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8ae:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8b5:	83 ec 0c             	sub    $0xc,%esp
 8b8:	50                   	push   %eax
 8b9:	e8 38 fd ff ff       	call   5f6 <sbrk>
  if(p == (char*)-1)
 8be:	83 c4 10             	add    $0x10,%esp
 8c1:	83 f8 ff             	cmp    $0xffffffff,%eax
 8c4:	74 1c                	je     8e2 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8c6:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8c9:	83 c0 08             	add    $0x8,%eax
 8cc:	83 ec 0c             	sub    $0xc,%esp
 8cf:	50                   	push   %eax
 8d0:	e8 54 ff ff ff       	call   829 <free>
  return freep;
 8d5:	a1 f4 0d 00 00       	mov    0xdf4,%eax
 8da:	83 c4 10             	add    $0x10,%esp
}
 8dd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8e0:	c9                   	leave  
 8e1:	c3                   	ret    
    return 0;
 8e2:	b8 00 00 00 00       	mov    $0x0,%eax
 8e7:	eb f4                	jmp    8dd <morecore+0x44>

000008e9 <malloc>:

void*
malloc(uint nbytes)
{
 8e9:	55                   	push   %ebp
 8ea:	89 e5                	mov    %esp,%ebp
 8ec:	53                   	push   %ebx
 8ed:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f0:	8b 45 08             	mov    0x8(%ebp),%eax
 8f3:	8d 58 07             	lea    0x7(%eax),%ebx
 8f6:	c1 eb 03             	shr    $0x3,%ebx
 8f9:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8fc:	8b 0d f4 0d 00 00    	mov    0xdf4,%ecx
 902:	85 c9                	test   %ecx,%ecx
 904:	74 04                	je     90a <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 906:	8b 01                	mov    (%ecx),%eax
 908:	eb 4a                	jmp    954 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 90a:	c7 05 f4 0d 00 00 f8 	movl   $0xdf8,0xdf4
 911:	0d 00 00 
 914:	c7 05 f8 0d 00 00 f8 	movl   $0xdf8,0xdf8
 91b:	0d 00 00 
    base.s.size = 0;
 91e:	c7 05 fc 0d 00 00 00 	movl   $0x0,0xdfc
 925:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 928:	b9 f8 0d 00 00       	mov    $0xdf8,%ecx
 92d:	eb d7                	jmp    906 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 92f:	74 19                	je     94a <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 931:	29 da                	sub    %ebx,%edx
 933:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 936:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 939:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 93c:	89 0d f4 0d 00 00    	mov    %ecx,0xdf4
      return (void*)(p + 1);
 942:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 945:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 948:	c9                   	leave  
 949:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 94a:	8b 10                	mov    (%eax),%edx
 94c:	89 11                	mov    %edx,(%ecx)
 94e:	eb ec                	jmp    93c <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 950:	89 c1                	mov    %eax,%ecx
 952:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 954:	8b 50 04             	mov    0x4(%eax),%edx
 957:	39 da                	cmp    %ebx,%edx
 959:	73 d4                	jae    92f <malloc+0x46>
    if(p == freep)
 95b:	39 05 f4 0d 00 00    	cmp    %eax,0xdf4
 961:	75 ed                	jne    950 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 963:	89 d8                	mov    %ebx,%eax
 965:	e8 2f ff ff ff       	call   899 <morecore>
 96a:	85 c0                	test   %eax,%eax
 96c:	75 e2                	jne    950 <malloc+0x67>
 96e:	eb d5                	jmp    945 <malloc+0x5c>
