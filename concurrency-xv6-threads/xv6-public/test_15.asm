
_test_15:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   int i, j, tmp;
   for (i = 0; i < loops; i++) {
   7:	bb 00 00 00 00       	mov    $0x0,%ebx
   c:	eb 23                	jmp    31 <worker+0x31>
      lock_acquire(&lock);
      tmp = global;
      for(j = 0; j < 50; j++); // take some time
   e:	83 c0 01             	add    $0x1,%eax
  11:	83 f8 31             	cmp    $0x31,%eax
  14:	7e f8                	jle    e <worker+0xe>
      global = tmp + 1;
  16:	8d 42 01             	lea    0x1(%edx),%eax
  19:	a3 50 0c 00 00       	mov    %eax,0xc50
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 4c 0c 00 00       	push   $0xc4c
  26:	e8 ba 03 00 00       	call   3e5 <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d 44 0c 00 00    	cmp    %ebx,0xc44
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 4c 0c 00 00       	push   $0xc4c
  41:	e8 85 03 00 00       	call   3cb <lock_acquire>
      tmp = global;
  46:	8b 15 50 0c 00 00    	mov    0xc50,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 a5 03 00 00       	call   400 <exit>

0000005b <main>:
{
  5b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  5f:	83 e4 f0             	and    $0xfffffff0,%esp
  62:	ff 71 fc             	push   -0x4(%ecx)
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	53                   	push   %ebx
  69:	51                   	push   %ecx
   ppid = getpid();
  6a:	e8 11 04 00 00       	call   480 <getpid>
  6f:	a3 54 0c 00 00       	mov    %eax,0xc54
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 4c 0c 00 00       	push   $0xc4c
  7c:	e8 37 03 00 00       	call   3b8 <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d 48 0c 00 00    	cmp    %ebx,0xc48
  94:	7e 61                	jle    f7 <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
  96:	83 ec 04             	sub    $0x4,%esp
  99:	6a 00                	push   $0x0
  9b:	6a 00                	push   $0x0
  9d:	68 00 00 00 00       	push   $0x0
  a2:	e8 b8 02 00 00       	call   35f <thread_create>
      assert(thread_pid > 0);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	7f dd                	jg     8b <main+0x30>
  ae:	6a 25                	push   $0x25
  b0:	68 04 08 00 00       	push   $0x804
  b5:	68 0e 08 00 00       	push   $0x80e
  ba:	6a 01                	push   $0x1
  bc:	e8 94 04 00 00       	call   555 <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 16 08 00 00       	push   $0x816
  c9:	68 25 08 00 00       	push   $0x825
  ce:	6a 01                	push   $0x1
  d0:	e8 80 04 00 00       	call   555 <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 39 08 00 00       	push   $0x839
  dd:	6a 01                	push   $0x1
  df:	e8 71 04 00 00       	call   555 <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 54 0c 00 00    	push   0xc54
  ed:	e8 3e 03 00 00       	call   430 <kill>
  f2:	e8 09 03 00 00       	call   400 <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 48 0c 00 00       	mov    0xc48,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 8a 02 00 00       	call   394 <thread_join>
      assert(join_pid > 0);
 10a:	85 c0                	test   %eax,%eax
 10c:	7e 05                	jle    113 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	eb e9                	jmp    fc <main+0xa1>
      assert(join_pid > 0);
 113:	6a 2a                	push   $0x2a
 115:	68 04 08 00 00       	push   $0x804
 11a:	68 0e 08 00 00       	push   $0x80e
 11f:	6a 01                	push   $0x1
 121:	e8 2f 04 00 00       	call   555 <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 46 08 00 00       	push   $0x846
 12e:	68 25 08 00 00       	push   $0x825
 133:	6a 01                	push   $0x1
 135:	e8 1b 04 00 00       	call   555 <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 39 08 00 00       	push   $0x839
 142:	6a 01                	push   $0x1
 144:	e8 0c 04 00 00       	call   555 <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 54 0c 00 00    	push   0xc54
 152:	e8 d9 02 00 00       	call   430 <kill>
 157:	e8 a4 02 00 00       	call   400 <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 44 0c 00 00 	imul   0xc44,%eax
 163:	3b 05 50 0c 00 00    	cmp    0xc50,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 04 08 00 00       	push   $0x804
 172:	68 0e 08 00 00       	push   $0x80e
 177:	6a 01                	push   $0x1
 179:	e8 d7 03 00 00       	call   555 <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 53 08 00 00       	push   $0x853
 186:	68 25 08 00 00       	push   $0x825
 18b:	6a 01                	push   $0x1
 18d:	e8 c3 03 00 00       	call   555 <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 39 08 00 00       	push   $0x839
 19a:	6a 01                	push   $0x1
 19c:	e8 b4 03 00 00       	call   555 <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 54 0c 00 00    	push   0xc54
 1aa:	e8 81 02 00 00       	call   430 <kill>
 1af:	e8 4c 02 00 00       	call   400 <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 71 08 00 00       	push   $0x871
 1bc:	6a 01                	push   $0x1
 1be:	e8 92 03 00 00       	call   555 <printf>
   exit();
 1c3:	e8 38 02 00 00       	call   400 <exit>

000001c8 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	56                   	push   %esi
 1cc:	53                   	push   %ebx
 1cd:	8b 75 08             	mov    0x8(%ebp),%esi
 1d0:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d3:	89 f0                	mov    %esi,%eax
 1d5:	89 d1                	mov    %edx,%ecx
 1d7:	83 c2 01             	add    $0x1,%edx
 1da:	89 c3                	mov    %eax,%ebx
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	0f b6 09             	movzbl (%ecx),%ecx
 1e2:	88 0b                	mov    %cl,(%ebx)
 1e4:	84 c9                	test   %cl,%cl
 1e6:	75 ed                	jne    1d5 <strcpy+0xd>
    ;
  return os;
}
 1e8:	89 f0                	mov    %esi,%eax
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret    

000001ee <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1f7:	eb 06                	jmp    1ff <strcmp+0x11>
    p++, q++;
 1f9:	83 c1 01             	add    $0x1,%ecx
 1fc:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ff:	0f b6 01             	movzbl (%ecx),%eax
 202:	84 c0                	test   %al,%al
 204:	74 04                	je     20a <strcmp+0x1c>
 206:	3a 02                	cmp    (%edx),%al
 208:	74 ef                	je     1f9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 20a:	0f b6 c0             	movzbl %al,%eax
 20d:	0f b6 12             	movzbl (%edx),%edx
 210:	29 d0                	sub    %edx,%eax
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    

00000214 <strlen>:

uint
strlen(const char *s)
{
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
 21f:	eb 03                	jmp    224 <strlen+0x10>
 221:	83 c0 01             	add    $0x1,%eax
 224:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 228:	75 f7                	jne    221 <strlen+0xd>
    ;
  return n;
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    

0000022c <memset>:

void*
memset(void *dst, int c, uint n)
{
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	57                   	push   %edi
 230:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 233:	89 d7                	mov    %edx,%edi
 235:	8b 4d 10             	mov    0x10(%ebp),%ecx
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	fc                   	cld    
 23c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 23e:	89 d0                	mov    %edx,%eax
 240:	8b 7d fc             	mov    -0x4(%ebp),%edi
 243:	c9                   	leave  
 244:	c3                   	ret    

00000245 <strchr>:

char*
strchr(const char *s, char c)
{
 245:	55                   	push   %ebp
 246:	89 e5                	mov    %esp,%ebp
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 24f:	eb 03                	jmp    254 <strchr+0xf>
 251:	83 c0 01             	add    $0x1,%eax
 254:	0f b6 10             	movzbl (%eax),%edx
 257:	84 d2                	test   %dl,%dl
 259:	74 06                	je     261 <strchr+0x1c>
    if(*s == c)
 25b:	38 ca                	cmp    %cl,%dl
 25d:	75 f2                	jne    251 <strchr+0xc>
 25f:	eb 05                	jmp    266 <strchr+0x21>
      return (char*)s;
  return 0;
 261:	b8 00 00 00 00       	mov    $0x0,%eax
}
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    

00000268 <gets>:

char*
gets(char *buf, int max)
{
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	57                   	push   %edi
 26c:	56                   	push   %esi
 26d:	53                   	push   %ebx
 26e:	83 ec 1c             	sub    $0x1c,%esp
 271:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 274:	bb 00 00 00 00       	mov    $0x0,%ebx
 279:	89 de                	mov    %ebx,%esi
 27b:	83 c3 01             	add    $0x1,%ebx
 27e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 281:	7d 2e                	jge    2b1 <gets+0x49>
    cc = read(0, &c, 1);
 283:	83 ec 04             	sub    $0x4,%esp
 286:	6a 01                	push   $0x1
 288:	8d 45 e7             	lea    -0x19(%ebp),%eax
 28b:	50                   	push   %eax
 28c:	6a 00                	push   $0x0
 28e:	e8 85 01 00 00       	call   418 <read>
    if(cc < 1)
 293:	83 c4 10             	add    $0x10,%esp
 296:	85 c0                	test   %eax,%eax
 298:	7e 17                	jle    2b1 <gets+0x49>
      break;
    buf[i++] = c;
 29a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	0f 94 c2             	sete   %dl
 2a6:	3c 0d                	cmp    $0xd,%al
 2a8:	0f 94 c0             	sete   %al
 2ab:	08 c2                	or     %al,%dl
 2ad:	74 ca                	je     279 <gets+0x11>
    buf[i++] = c;
 2af:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2b1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2b5:	89 f8                	mov    %edi,%eax
 2b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ba:	5b                   	pop    %ebx
 2bb:	5e                   	pop    %esi
 2bc:	5f                   	pop    %edi
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret    

000002bf <stat>:

int
stat(const char *n, struct stat *st)
{
 2bf:	55                   	push   %ebp
 2c0:	89 e5                	mov    %esp,%ebp
 2c2:	56                   	push   %esi
 2c3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c4:	83 ec 08             	sub    $0x8,%esp
 2c7:	6a 00                	push   $0x0
 2c9:	ff 75 08             	push   0x8(%ebp)
 2cc:	e8 6f 01 00 00       	call   440 <open>
  if(fd < 0)
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	85 c0                	test   %eax,%eax
 2d6:	78 24                	js     2fc <stat+0x3d>
 2d8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2da:	83 ec 08             	sub    $0x8,%esp
 2dd:	ff 75 0c             	push   0xc(%ebp)
 2e0:	50                   	push   %eax
 2e1:	e8 72 01 00 00       	call   458 <fstat>
 2e6:	89 c6                	mov    %eax,%esi
  close(fd);
 2e8:	89 1c 24             	mov    %ebx,(%esp)
 2eb:	e8 38 01 00 00       	call   428 <close>
  return r;
 2f0:	83 c4 10             	add    $0x10,%esp
}
 2f3:	89 f0                	mov    %esi,%eax
 2f5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f8:	5b                   	pop    %ebx
 2f9:	5e                   	pop    %esi
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    
    return -1;
 2fc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 301:	eb f0                	jmp    2f3 <stat+0x34>

00000303 <atoi>:

int
atoi(const char *s)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	53                   	push   %ebx
 307:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 30a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 30f:	eb 10                	jmp    321 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 311:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 314:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 317:	83 c1 01             	add    $0x1,%ecx
 31a:	0f be c0             	movsbl %al,%eax
 31d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 321:	0f b6 01             	movzbl (%ecx),%eax
 324:	8d 58 d0             	lea    -0x30(%eax),%ebx
 327:	80 fb 09             	cmp    $0x9,%bl
 32a:	76 e5                	jbe    311 <atoi+0xe>
  return n;
}
 32c:	89 d0                	mov    %edx,%eax
 32e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 331:	c9                   	leave  
 332:	c3                   	ret    

00000333 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	56                   	push   %esi
 337:	53                   	push   %ebx
 338:	8b 75 08             	mov    0x8(%ebp),%esi
 33b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 33e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 341:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 343:	eb 0d                	jmp    352 <memmove+0x1f>
    *dst++ = *src++;
 345:	0f b6 01             	movzbl (%ecx),%eax
 348:	88 02                	mov    %al,(%edx)
 34a:	8d 49 01             	lea    0x1(%ecx),%ecx
 34d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 350:	89 d8                	mov    %ebx,%eax
 352:	8d 58 ff             	lea    -0x1(%eax),%ebx
 355:	85 c0                	test   %eax,%eax
 357:	7f ec                	jg     345 <memmove+0x12>
  return vdst;
}
 359:	89 f0                	mov    %esi,%eax
 35b:	5b                   	pop    %ebx
 35c:	5e                   	pop    %esi
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret    

0000035f <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 365:	68 00 20 00 00       	push   $0x2000
 36a:	e8 0c 04 00 00       	call   77b <malloc>
  if((uint)(stack) % PGSIZE != 0){
 36f:	83 c4 10             	add    $0x10,%esp
 372:	a9 ff 0f 00 00       	test   $0xfff,%eax
 377:	74 0a                	je     383 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 379:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 37e:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 383:	50                   	push   %eax
 384:	ff 75 10             	push   0x10(%ebp)
 387:	ff 75 0c             	push   0xc(%ebp)
 38a:	ff 75 08             	push   0x8(%ebp)
 38d:	e8 0e 01 00 00       	call   4a0 <clone>
  return pid;
}
 392:	c9                   	leave  
 393:	c3                   	ret    

00000394 <thread_join>:
int
thread_join()
{
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	53                   	push   %ebx
 398:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 39b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 39e:	50                   	push   %eax
 39f:	e8 04 01 00 00       	call   4a8 <join>
 3a4:	89 c3                	mov    %eax,%ebx
  free(stack);
 3a6:	83 c4 04             	add    $0x4,%esp
 3a9:	ff 75 f4             	push   -0xc(%ebp)
 3ac:	e8 0a 03 00 00       	call   6bb <free>
  return pid;
}
 3b1:	89 d8                	mov    %ebx,%eax
 3b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b6:	c9                   	leave  
 3b7:	c3                   	ret    

000003b8 <lock_init>:
int
lock_init(lock_t * lock){
 3b8:	55                   	push   %ebp
 3b9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3bb:	8b 45 08             	mov    0x8(%ebp),%eax
 3be:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 3c4:	b8 00 00 00 00       	mov    $0x0,%eax
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    

000003cb <lock_acquire>:
int
lock_acquire(lock_t * lock){
 3cb:	55                   	push   %ebp
 3cc:	89 e5                	mov    %esp,%ebp
 3ce:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3d1:	b8 01 00 00 00       	mov    $0x1,%eax
 3d6:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 3d9:	83 f8 01             	cmp    $0x1,%eax
 3dc:	74 f3                	je     3d1 <lock_acquire+0x6>
  {

  }
  return 0;
}
 3de:	b8 00 00 00 00       	mov    $0x0,%eax
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <lock_release>:
int
lock_release(lock_t * lock){
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3e8:	8b 45 08             	mov    0x8(%ebp),%eax
 3eb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 3f1:	b8 00 00 00 00       	mov    $0x0,%eax
 3f6:	5d                   	pop    %ebp
 3f7:	c3                   	ret    

000003f8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f8:	b8 01 00 00 00       	mov    $0x1,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <exit>:
SYSCALL(exit)
 400:	b8 02 00 00 00       	mov    $0x2,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <wait>:
SYSCALL(wait)
 408:	b8 03 00 00 00       	mov    $0x3,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <pipe>:
SYSCALL(pipe)
 410:	b8 04 00 00 00       	mov    $0x4,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <read>:
SYSCALL(read)
 418:	b8 05 00 00 00       	mov    $0x5,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <write>:
SYSCALL(write)
 420:	b8 10 00 00 00       	mov    $0x10,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <close>:
SYSCALL(close)
 428:	b8 15 00 00 00       	mov    $0x15,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <kill>:
SYSCALL(kill)
 430:	b8 06 00 00 00       	mov    $0x6,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <exec>:
SYSCALL(exec)
 438:	b8 07 00 00 00       	mov    $0x7,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <open>:
SYSCALL(open)
 440:	b8 0f 00 00 00       	mov    $0xf,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <mknod>:
SYSCALL(mknod)
 448:	b8 11 00 00 00       	mov    $0x11,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <unlink>:
SYSCALL(unlink)
 450:	b8 12 00 00 00       	mov    $0x12,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <fstat>:
SYSCALL(fstat)
 458:	b8 08 00 00 00       	mov    $0x8,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <link>:
SYSCALL(link)
 460:	b8 13 00 00 00       	mov    $0x13,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <mkdir>:
SYSCALL(mkdir)
 468:	b8 14 00 00 00       	mov    $0x14,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <chdir>:
SYSCALL(chdir)
 470:	b8 09 00 00 00       	mov    $0x9,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <dup>:
SYSCALL(dup)
 478:	b8 0a 00 00 00       	mov    $0xa,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <getpid>:
SYSCALL(getpid)
 480:	b8 0b 00 00 00       	mov    $0xb,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <sbrk>:
SYSCALL(sbrk)
 488:	b8 0c 00 00 00       	mov    $0xc,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <sleep>:
SYSCALL(sleep)
 490:	b8 0d 00 00 00       	mov    $0xd,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <uptime>:
SYSCALL(uptime)
 498:	b8 0e 00 00 00       	mov    $0xe,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <clone>:
SYSCALL(clone)
 4a0:	b8 16 00 00 00       	mov    $0x16,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <join>:
SYSCALL(join)
 4a8:	b8 17 00 00 00       	mov    $0x17,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	83 ec 1c             	sub    $0x1c,%esp
 4b6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4b9:	6a 01                	push   $0x1
 4bb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4be:	52                   	push   %edx
 4bf:	50                   	push   %eax
 4c0:	e8 5b ff ff ff       	call   420 <write>
}
 4c5:	83 c4 10             	add    $0x10,%esp
 4c8:	c9                   	leave  
 4c9:	c3                   	ret    

000004ca <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ca:	55                   	push   %ebp
 4cb:	89 e5                	mov    %esp,%ebp
 4cd:	57                   	push   %edi
 4ce:	56                   	push   %esi
 4cf:	53                   	push   %ebx
 4d0:	83 ec 2c             	sub    $0x2c,%esp
 4d3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4d6:	89 d0                	mov    %edx,%eax
 4d8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4da:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4de:	0f 95 c1             	setne  %cl
 4e1:	c1 ea 1f             	shr    $0x1f,%edx
 4e4:	84 d1                	test   %dl,%cl
 4e6:	74 44                	je     52c <printint+0x62>
    neg = 1;
    x = -xx;
 4e8:	f7 d8                	neg    %eax
 4ea:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4ec:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4f3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4f8:	89 c8                	mov    %ecx,%eax
 4fa:	ba 00 00 00 00       	mov    $0x0,%edx
 4ff:	f7 f6                	div    %esi
 501:	89 df                	mov    %ebx,%edi
 503:	83 c3 01             	add    $0x1,%ebx
 506:	0f b6 92 e0 08 00 00 	movzbl 0x8e0(%edx),%edx
 50d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 511:	89 ca                	mov    %ecx,%edx
 513:	89 c1                	mov    %eax,%ecx
 515:	39 d6                	cmp    %edx,%esi
 517:	76 df                	jbe    4f8 <printint+0x2e>
  if(neg)
 519:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 51d:	74 31                	je     550 <printint+0x86>
    buf[i++] = '-';
 51f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 524:	8d 5f 02             	lea    0x2(%edi),%ebx
 527:	8b 75 d0             	mov    -0x30(%ebp),%esi
 52a:	eb 17                	jmp    543 <printint+0x79>
    x = xx;
 52c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 52e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 535:	eb bc                	jmp    4f3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 537:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 53c:	89 f0                	mov    %esi,%eax
 53e:	e8 6d ff ff ff       	call   4b0 <putc>
  while(--i >= 0)
 543:	83 eb 01             	sub    $0x1,%ebx
 546:	79 ef                	jns    537 <printint+0x6d>
}
 548:	83 c4 2c             	add    $0x2c,%esp
 54b:	5b                   	pop    %ebx
 54c:	5e                   	pop    %esi
 54d:	5f                   	pop    %edi
 54e:	5d                   	pop    %ebp
 54f:	c3                   	ret    
 550:	8b 75 d0             	mov    -0x30(%ebp),%esi
 553:	eb ee                	jmp    543 <printint+0x79>

00000555 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 555:	55                   	push   %ebp
 556:	89 e5                	mov    %esp,%ebp
 558:	57                   	push   %edi
 559:	56                   	push   %esi
 55a:	53                   	push   %ebx
 55b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 55e:	8d 45 10             	lea    0x10(%ebp),%eax
 561:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 564:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 569:	bb 00 00 00 00       	mov    $0x0,%ebx
 56e:	eb 14                	jmp    584 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 570:	89 fa                	mov    %edi,%edx
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	e8 36 ff ff ff       	call   4b0 <putc>
 57a:	eb 05                	jmp    581 <printf+0x2c>
      }
    } else if(state == '%'){
 57c:	83 fe 25             	cmp    $0x25,%esi
 57f:	74 25                	je     5a6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 581:	83 c3 01             	add    $0x1,%ebx
 584:	8b 45 0c             	mov    0xc(%ebp),%eax
 587:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 58b:	84 c0                	test   %al,%al
 58d:	0f 84 20 01 00 00    	je     6b3 <printf+0x15e>
    c = fmt[i] & 0xff;
 593:	0f be f8             	movsbl %al,%edi
 596:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 599:	85 f6                	test   %esi,%esi
 59b:	75 df                	jne    57c <printf+0x27>
      if(c == '%'){
 59d:	83 f8 25             	cmp    $0x25,%eax
 5a0:	75 ce                	jne    570 <printf+0x1b>
        state = '%';
 5a2:	89 c6                	mov    %eax,%esi
 5a4:	eb db                	jmp    581 <printf+0x2c>
      if(c == 'd'){
 5a6:	83 f8 25             	cmp    $0x25,%eax
 5a9:	0f 84 cf 00 00 00    	je     67e <printf+0x129>
 5af:	0f 8c dd 00 00 00    	jl     692 <printf+0x13d>
 5b5:	83 f8 78             	cmp    $0x78,%eax
 5b8:	0f 8f d4 00 00 00    	jg     692 <printf+0x13d>
 5be:	83 f8 63             	cmp    $0x63,%eax
 5c1:	0f 8c cb 00 00 00    	jl     692 <printf+0x13d>
 5c7:	83 e8 63             	sub    $0x63,%eax
 5ca:	83 f8 15             	cmp    $0x15,%eax
 5cd:	0f 87 bf 00 00 00    	ja     692 <printf+0x13d>
 5d3:	ff 24 85 88 08 00 00 	jmp    *0x888(,%eax,4)
        printint(fd, *ap, 10, 1);
 5da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5dd:	8b 17                	mov    (%edi),%edx
 5df:	83 ec 0c             	sub    $0xc,%esp
 5e2:	6a 01                	push   $0x1
 5e4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	e8 d9 fe ff ff       	call   4ca <printint>
        ap++;
 5f1:	83 c7 04             	add    $0x4,%edi
 5f4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5f7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5fa:	be 00 00 00 00       	mov    $0x0,%esi
 5ff:	eb 80                	jmp    581 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 601:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 604:	8b 17                	mov    (%edi),%edx
 606:	83 ec 0c             	sub    $0xc,%esp
 609:	6a 00                	push   $0x0
 60b:	b9 10 00 00 00       	mov    $0x10,%ecx
 610:	8b 45 08             	mov    0x8(%ebp),%eax
 613:	e8 b2 fe ff ff       	call   4ca <printint>
        ap++;
 618:	83 c7 04             	add    $0x4,%edi
 61b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 61e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 621:	be 00 00 00 00       	mov    $0x0,%esi
 626:	e9 56 ff ff ff       	jmp    581 <printf+0x2c>
        s = (char*)*ap;
 62b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 62e:	8b 30                	mov    (%eax),%esi
        ap++;
 630:	83 c0 04             	add    $0x4,%eax
 633:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 636:	85 f6                	test   %esi,%esi
 638:	75 15                	jne    64f <printf+0xfa>
          s = "(null)";
 63a:	be 7e 08 00 00       	mov    $0x87e,%esi
 63f:	eb 0e                	jmp    64f <printf+0xfa>
          putc(fd, *s);
 641:	0f be d2             	movsbl %dl,%edx
 644:	8b 45 08             	mov    0x8(%ebp),%eax
 647:	e8 64 fe ff ff       	call   4b0 <putc>
          s++;
 64c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 64f:	0f b6 16             	movzbl (%esi),%edx
 652:	84 d2                	test   %dl,%dl
 654:	75 eb                	jne    641 <printf+0xec>
      state = 0;
 656:	be 00 00 00 00       	mov    $0x0,%esi
 65b:	e9 21 ff ff ff       	jmp    581 <printf+0x2c>
        putc(fd, *ap);
 660:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 663:	0f be 17             	movsbl (%edi),%edx
 666:	8b 45 08             	mov    0x8(%ebp),%eax
 669:	e8 42 fe ff ff       	call   4b0 <putc>
        ap++;
 66e:	83 c7 04             	add    $0x4,%edi
 671:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 674:	be 00 00 00 00       	mov    $0x0,%esi
 679:	e9 03 ff ff ff       	jmp    581 <printf+0x2c>
        putc(fd, c);
 67e:	89 fa                	mov    %edi,%edx
 680:	8b 45 08             	mov    0x8(%ebp),%eax
 683:	e8 28 fe ff ff       	call   4b0 <putc>
      state = 0;
 688:	be 00 00 00 00       	mov    $0x0,%esi
 68d:	e9 ef fe ff ff       	jmp    581 <printf+0x2c>
        putc(fd, '%');
 692:	ba 25 00 00 00       	mov    $0x25,%edx
 697:	8b 45 08             	mov    0x8(%ebp),%eax
 69a:	e8 11 fe ff ff       	call   4b0 <putc>
        putc(fd, c);
 69f:	89 fa                	mov    %edi,%edx
 6a1:	8b 45 08             	mov    0x8(%ebp),%eax
 6a4:	e8 07 fe ff ff       	call   4b0 <putc>
      state = 0;
 6a9:	be 00 00 00 00       	mov    $0x0,%esi
 6ae:	e9 ce fe ff ff       	jmp    581 <printf+0x2c>
    }
  }
}
 6b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6b6:	5b                   	pop    %ebx
 6b7:	5e                   	pop    %esi
 6b8:	5f                   	pop    %edi
 6b9:	5d                   	pop    %ebp
 6ba:	c3                   	ret    

000006bb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6bb:	55                   	push   %ebp
 6bc:	89 e5                	mov    %esp,%ebp
 6be:	57                   	push   %edi
 6bf:	56                   	push   %esi
 6c0:	53                   	push   %ebx
 6c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6c4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c7:	a1 58 0c 00 00       	mov    0xc58,%eax
 6cc:	eb 02                	jmp    6d0 <free+0x15>
 6ce:	89 d0                	mov    %edx,%eax
 6d0:	39 c8                	cmp    %ecx,%eax
 6d2:	73 04                	jae    6d8 <free+0x1d>
 6d4:	39 08                	cmp    %ecx,(%eax)
 6d6:	77 12                	ja     6ea <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d8:	8b 10                	mov    (%eax),%edx
 6da:	39 c2                	cmp    %eax,%edx
 6dc:	77 f0                	ja     6ce <free+0x13>
 6de:	39 c8                	cmp    %ecx,%eax
 6e0:	72 08                	jb     6ea <free+0x2f>
 6e2:	39 ca                	cmp    %ecx,%edx
 6e4:	77 04                	ja     6ea <free+0x2f>
 6e6:	89 d0                	mov    %edx,%eax
 6e8:	eb e6                	jmp    6d0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ea:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ed:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6f0:	8b 10                	mov    (%eax),%edx
 6f2:	39 d7                	cmp    %edx,%edi
 6f4:	74 19                	je     70f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6f6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6f9:	8b 50 04             	mov    0x4(%eax),%edx
 6fc:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ff:	39 ce                	cmp    %ecx,%esi
 701:	74 1b                	je     71e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 703:	89 08                	mov    %ecx,(%eax)
  freep = p;
 705:	a3 58 0c 00 00       	mov    %eax,0xc58
}
 70a:	5b                   	pop    %ebx
 70b:	5e                   	pop    %esi
 70c:	5f                   	pop    %edi
 70d:	5d                   	pop    %ebp
 70e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 70f:	03 72 04             	add    0x4(%edx),%esi
 712:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 715:	8b 10                	mov    (%eax),%edx
 717:	8b 12                	mov    (%edx),%edx
 719:	89 53 f8             	mov    %edx,-0x8(%ebx)
 71c:	eb db                	jmp    6f9 <free+0x3e>
    p->s.size += bp->s.size;
 71e:	03 53 fc             	add    -0x4(%ebx),%edx
 721:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 724:	8b 53 f8             	mov    -0x8(%ebx),%edx
 727:	89 10                	mov    %edx,(%eax)
 729:	eb da                	jmp    705 <free+0x4a>

0000072b <morecore>:

static Header*
morecore(uint nu)
{
 72b:	55                   	push   %ebp
 72c:	89 e5                	mov    %esp,%ebp
 72e:	53                   	push   %ebx
 72f:	83 ec 04             	sub    $0x4,%esp
 732:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 734:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 739:	77 05                	ja     740 <morecore+0x15>
    nu = 4096;
 73b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 740:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 747:	83 ec 0c             	sub    $0xc,%esp
 74a:	50                   	push   %eax
 74b:	e8 38 fd ff ff       	call   488 <sbrk>
  if(p == (char*)-1)
 750:	83 c4 10             	add    $0x10,%esp
 753:	83 f8 ff             	cmp    $0xffffffff,%eax
 756:	74 1c                	je     774 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 758:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 75b:	83 c0 08             	add    $0x8,%eax
 75e:	83 ec 0c             	sub    $0xc,%esp
 761:	50                   	push   %eax
 762:	e8 54 ff ff ff       	call   6bb <free>
  return freep;
 767:	a1 58 0c 00 00       	mov    0xc58,%eax
 76c:	83 c4 10             	add    $0x10,%esp
}
 76f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 772:	c9                   	leave  
 773:	c3                   	ret    
    return 0;
 774:	b8 00 00 00 00       	mov    $0x0,%eax
 779:	eb f4                	jmp    76f <morecore+0x44>

0000077b <malloc>:

void*
malloc(uint nbytes)
{
 77b:	55                   	push   %ebp
 77c:	89 e5                	mov    %esp,%ebp
 77e:	53                   	push   %ebx
 77f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	8b 45 08             	mov    0x8(%ebp),%eax
 785:	8d 58 07             	lea    0x7(%eax),%ebx
 788:	c1 eb 03             	shr    $0x3,%ebx
 78b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 78e:	8b 0d 58 0c 00 00    	mov    0xc58,%ecx
 794:	85 c9                	test   %ecx,%ecx
 796:	74 04                	je     79c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 798:	8b 01                	mov    (%ecx),%eax
 79a:	eb 4a                	jmp    7e6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 79c:	c7 05 58 0c 00 00 5c 	movl   $0xc5c,0xc58
 7a3:	0c 00 00 
 7a6:	c7 05 5c 0c 00 00 5c 	movl   $0xc5c,0xc5c
 7ad:	0c 00 00 
    base.s.size = 0;
 7b0:	c7 05 60 0c 00 00 00 	movl   $0x0,0xc60
 7b7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7ba:	b9 5c 0c 00 00       	mov    $0xc5c,%ecx
 7bf:	eb d7                	jmp    798 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7c1:	74 19                	je     7dc <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7c3:	29 da                	sub    %ebx,%edx
 7c5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7cb:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7ce:	89 0d 58 0c 00 00    	mov    %ecx,0xc58
      return (void*)(p + 1);
 7d4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7da:	c9                   	leave  
 7db:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7dc:	8b 10                	mov    (%eax),%edx
 7de:	89 11                	mov    %edx,(%ecx)
 7e0:	eb ec                	jmp    7ce <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e2:	89 c1                	mov    %eax,%ecx
 7e4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7e6:	8b 50 04             	mov    0x4(%eax),%edx
 7e9:	39 da                	cmp    %ebx,%edx
 7eb:	73 d4                	jae    7c1 <malloc+0x46>
    if(p == freep)
 7ed:	39 05 58 0c 00 00    	cmp    %eax,0xc58
 7f3:	75 ed                	jne    7e2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7f5:	89 d8                	mov    %ebx,%eax
 7f7:	e8 2f ff ff ff       	call   72b <morecore>
 7fc:	85 c0                	test   %eax,%eax
 7fe:	75 e2                	jne    7e2 <malloc+0x67>
 800:	eb d5                	jmp    7d7 <malloc+0x5c>
