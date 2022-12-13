
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
   9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  10:	be 00 00 00 00       	mov    $0x0,%esi
  15:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  23:	83 ec 04             	sub    $0x4,%esp
  26:	68 00 02 00 00       	push   $0x200
  2b:	68 c0 0b 00 00       	push   $0xbc0
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 7a 03 00 00       	call   3b2 <read>
  38:	89 c7                	mov    %eax,%edi
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	7e 54                	jle    95 <wc+0x95>
    for(i=0; i<n; i++){
  41:	bb 00 00 00 00       	mov    $0x0,%ebx
  46:	eb 22                	jmp    6a <wc+0x6a>
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	0f be c0             	movsbl %al,%eax
  4e:	50                   	push   %eax
  4f:	68 9c 07 00 00       	push   $0x79c
  54:	e8 86 01 00 00       	call   1df <strchr>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	85 c0                	test   %eax,%eax
  5e:	74 22                	je     82 <wc+0x82>
        inword = 0;
  60:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  67:	83 c3 01             	add    $0x1,%ebx
  6a:	39 fb                	cmp    %edi,%ebx
  6c:	7d b5                	jge    23 <wc+0x23>
      c++;
  6e:	83 c6 01             	add    $0x1,%esi
      if(buf[i] == '\n')
  71:	0f b6 83 c0 0b 00 00 	movzbl 0xbc0(%ebx),%eax
  78:	3c 0a                	cmp    $0xa,%al
  7a:	75 cc                	jne    48 <wc+0x48>
        l++;
  7c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  80:	eb c6                	jmp    48 <wc+0x48>
      else if(!inword){
  82:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  86:	75 df                	jne    67 <wc+0x67>
        w++;
  88:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
  8c:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  93:	eb d2                	jmp    67 <wc+0x67>
      }
    }
  }
  if(n < 0){
  95:	78 24                	js     bb <wc+0xbb>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  97:	83 ec 08             	sub    $0x8,%esp
  9a:	ff 75 0c             	push   0xc(%ebp)
  9d:	56                   	push   %esi
  9e:	ff 75 dc             	push   -0x24(%ebp)
  a1:	ff 75 e0             	push   -0x20(%ebp)
  a4:	68 b2 07 00 00       	push   $0x7b2
  a9:	6a 01                	push   $0x1
  ab:	e8 3f 04 00 00       	call   4ef <printf>
}
  b0:	83 c4 20             	add    $0x20,%esp
  b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  b6:	5b                   	pop    %ebx
  b7:	5e                   	pop    %esi
  b8:	5f                   	pop    %edi
  b9:	5d                   	pop    %ebp
  ba:	c3                   	ret    
    printf(1, "wc: read error\n");
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 a2 07 00 00       	push   $0x7a2
  c3:	6a 01                	push   $0x1
  c5:	e8 25 04 00 00       	call   4ef <printf>
    exit();
  ca:	e8 cb 02 00 00       	call   39a <exit>

000000cf <main>:

int
main(int argc, char *argv[])
{
  cf:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  d3:	83 e4 f0             	and    $0xfffffff0,%esp
  d6:	ff 71 fc             	push   -0x4(%ecx)
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	57                   	push   %edi
  dd:	56                   	push   %esi
  de:	53                   	push   %ebx
  df:	51                   	push   %ecx
  e0:	83 ec 18             	sub    $0x18,%esp
  e3:	8b 01                	mov    (%ecx),%eax
  e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  e8:	8b 51 04             	mov    0x4(%ecx),%edx
  eb:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  ee:	83 f8 01             	cmp    $0x1,%eax
  f1:	7e 07                	jle    fa <main+0x2b>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  f3:	be 01 00 00 00       	mov    $0x1,%esi
  f8:	eb 2d                	jmp    127 <main+0x58>
    wc(0, "");
  fa:	83 ec 08             	sub    $0x8,%esp
  fd:	68 b1 07 00 00       	push   $0x7b1
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 8c 02 00 00       	call   39a <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 10e:	83 ec 08             	sub    $0x8,%esp
 111:	ff 37                	push   (%edi)
 113:	50                   	push   %eax
 114:	e8 e7 fe ff ff       	call   0 <wc>
    close(fd);
 119:	89 1c 24             	mov    %ebx,(%esp)
 11c:	e8 a1 02 00 00       	call   3c2 <close>
  for(i = 1; i < argc; i++){
 121:	83 c6 01             	add    $0x1,%esi
 124:	83 c4 10             	add    $0x10,%esp
 127:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 12a:	7d 31                	jge    15d <main+0x8e>
    if((fd = open(argv[i], 0)) < 0){
 12c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 12f:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 132:	83 ec 08             	sub    $0x8,%esp
 135:	6a 00                	push   $0x0
 137:	ff 37                	push   (%edi)
 139:	e8 9c 02 00 00       	call   3da <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 bf 07 00 00       	push   $0x7bf
 151:	6a 01                	push   $0x1
 153:	e8 97 03 00 00       	call   4ef <printf>
      exit();
 158:	e8 3d 02 00 00       	call   39a <exit>
  }
  exit();
 15d:	e8 38 02 00 00       	call   39a <exit>

00000162 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 162:	55                   	push   %ebp
 163:	89 e5                	mov    %esp,%ebp
 165:	56                   	push   %esi
 166:	53                   	push   %ebx
 167:	8b 75 08             	mov    0x8(%ebp),%esi
 16a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16d:	89 f0                	mov    %esi,%eax
 16f:	89 d1                	mov    %edx,%ecx
 171:	83 c2 01             	add    $0x1,%edx
 174:	89 c3                	mov    %eax,%ebx
 176:	83 c0 01             	add    $0x1,%eax
 179:	0f b6 09             	movzbl (%ecx),%ecx
 17c:	88 0b                	mov    %cl,(%ebx)
 17e:	84 c9                	test   %cl,%cl
 180:	75 ed                	jne    16f <strcpy+0xd>
    ;
  return os;
}
 182:	89 f0                	mov    %esi,%eax
 184:	5b                   	pop    %ebx
 185:	5e                   	pop    %esi
 186:	5d                   	pop    %ebp
 187:	c3                   	ret    

00000188 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 191:	eb 06                	jmp    199 <strcmp+0x11>
    p++, q++;
 193:	83 c1 01             	add    $0x1,%ecx
 196:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 199:	0f b6 01             	movzbl (%ecx),%eax
 19c:	84 c0                	test   %al,%al
 19e:	74 04                	je     1a4 <strcmp+0x1c>
 1a0:	3a 02                	cmp    (%edx),%al
 1a2:	74 ef                	je     193 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1a4:	0f b6 c0             	movzbl %al,%eax
 1a7:	0f b6 12             	movzbl (%edx),%edx
 1aa:	29 d0                	sub    %edx,%eax
}
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    

000001ae <strlen>:

uint
strlen(const char *s)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1b4:	b8 00 00 00 00       	mov    $0x0,%eax
 1b9:	eb 03                	jmp    1be <strlen+0x10>
 1bb:	83 c0 01             	add    $0x1,%eax
 1be:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1c2:	75 f7                	jne    1bb <strlen+0xd>
    ;
  return n;
}
 1c4:	5d                   	pop    %ebp
 1c5:	c3                   	ret    

000001c6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	57                   	push   %edi
 1ca:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d5:	fc                   	cld    
 1d6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d8:	89 d0                	mov    %edx,%eax
 1da:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1dd:	c9                   	leave  
 1de:	c3                   	ret    

000001df <strchr>:

char*
strchr(const char *s, char c)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1e9:	eb 03                	jmp    1ee <strchr+0xf>
 1eb:	83 c0 01             	add    $0x1,%eax
 1ee:	0f b6 10             	movzbl (%eax),%edx
 1f1:	84 d2                	test   %dl,%dl
 1f3:	74 06                	je     1fb <strchr+0x1c>
    if(*s == c)
 1f5:	38 ca                	cmp    %cl,%dl
 1f7:	75 f2                	jne    1eb <strchr+0xc>
 1f9:	eb 05                	jmp    200 <strchr+0x21>
      return (char*)s;
  return 0;
 1fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 200:	5d                   	pop    %ebp
 201:	c3                   	ret    

00000202 <gets>:

char*
gets(char *buf, int max)
{
 202:	55                   	push   %ebp
 203:	89 e5                	mov    %esp,%ebp
 205:	57                   	push   %edi
 206:	56                   	push   %esi
 207:	53                   	push   %ebx
 208:	83 ec 1c             	sub    $0x1c,%esp
 20b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20e:	bb 00 00 00 00       	mov    $0x0,%ebx
 213:	89 de                	mov    %ebx,%esi
 215:	83 c3 01             	add    $0x1,%ebx
 218:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21b:	7d 2e                	jge    24b <gets+0x49>
    cc = read(0, &c, 1);
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	6a 01                	push   $0x1
 222:	8d 45 e7             	lea    -0x19(%ebp),%eax
 225:	50                   	push   %eax
 226:	6a 00                	push   $0x0
 228:	e8 85 01 00 00       	call   3b2 <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 17                	jle    24b <gets+0x49>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 23b:	3c 0a                	cmp    $0xa,%al
 23d:	0f 94 c2             	sete   %dl
 240:	3c 0d                	cmp    $0xd,%al
 242:	0f 94 c0             	sete   %al
 245:	08 c2                	or     %al,%dl
 247:	74 ca                	je     213 <gets+0x11>
    buf[i++] = c;
 249:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 24b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 24f:	89 f8                	mov    %edi,%eax
 251:	8d 65 f4             	lea    -0xc(%ebp),%esp
 254:	5b                   	pop    %ebx
 255:	5e                   	pop    %esi
 256:	5f                   	pop    %edi
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    

00000259 <stat>:

int
stat(const char *n, struct stat *st)
{
 259:	55                   	push   %ebp
 25a:	89 e5                	mov    %esp,%ebp
 25c:	56                   	push   %esi
 25d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 25e:	83 ec 08             	sub    $0x8,%esp
 261:	6a 00                	push   $0x0
 263:	ff 75 08             	push   0x8(%ebp)
 266:	e8 6f 01 00 00       	call   3da <open>
  if(fd < 0)
 26b:	83 c4 10             	add    $0x10,%esp
 26e:	85 c0                	test   %eax,%eax
 270:	78 24                	js     296 <stat+0x3d>
 272:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 274:	83 ec 08             	sub    $0x8,%esp
 277:	ff 75 0c             	push   0xc(%ebp)
 27a:	50                   	push   %eax
 27b:	e8 72 01 00 00       	call   3f2 <fstat>
 280:	89 c6                	mov    %eax,%esi
  close(fd);
 282:	89 1c 24             	mov    %ebx,(%esp)
 285:	e8 38 01 00 00       	call   3c2 <close>
  return r;
 28a:	83 c4 10             	add    $0x10,%esp
}
 28d:	89 f0                	mov    %esi,%eax
 28f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 292:	5b                   	pop    %ebx
 293:	5e                   	pop    %esi
 294:	5d                   	pop    %ebp
 295:	c3                   	ret    
    return -1;
 296:	be ff ff ff ff       	mov    $0xffffffff,%esi
 29b:	eb f0                	jmp    28d <stat+0x34>

0000029d <atoi>:

int
atoi(const char *s)
{
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	53                   	push   %ebx
 2a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2a4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2a9:	eb 10                	jmp    2bb <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2ab:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2ae:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2b1:	83 c1 01             	add    $0x1,%ecx
 2b4:	0f be c0             	movsbl %al,%eax
 2b7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2bb:	0f b6 01             	movzbl (%ecx),%eax
 2be:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c1:	80 fb 09             	cmp    $0x9,%bl
 2c4:	76 e5                	jbe    2ab <atoi+0xe>
  return n;
}
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    

000002cd <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	8b 75 08             	mov    0x8(%ebp),%esi
 2d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d8:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2db:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2dd:	eb 0d                	jmp    2ec <memmove+0x1f>
    *dst++ = *src++;
 2df:	0f b6 01             	movzbl (%ecx),%eax
 2e2:	88 02                	mov    %al,(%edx)
 2e4:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e7:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2ea:	89 d8                	mov    %ebx,%eax
 2ec:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2ef:	85 c0                	test   %eax,%eax
 2f1:	7f ec                	jg     2df <memmove+0x12>
  return vdst;
}
 2f3:	89 f0                	mov    %esi,%eax
 2f5:	5b                   	pop    %ebx
 2f6:	5e                   	pop    %esi
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    

000002f9 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 2f9:	55                   	push   %ebp
 2fa:	89 e5                	mov    %esp,%ebp
 2fc:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 2ff:	68 00 20 00 00       	push   $0x2000
 304:	e8 0c 04 00 00       	call   715 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 309:	83 c4 10             	add    $0x10,%esp
 30c:	a9 ff 0f 00 00       	test   $0xfff,%eax
 311:	74 0a                	je     31d <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 313:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 318:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 31d:	50                   	push   %eax
 31e:	ff 75 10             	push   0x10(%ebp)
 321:	ff 75 0c             	push   0xc(%ebp)
 324:	ff 75 08             	push   0x8(%ebp)
 327:	e8 0e 01 00 00       	call   43a <clone>
  return pid;
}
 32c:	c9                   	leave  
 32d:	c3                   	ret    

0000032e <thread_join>:
int
thread_join()
{
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	53                   	push   %ebx
 332:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 335:	8d 45 f4             	lea    -0xc(%ebp),%eax
 338:	50                   	push   %eax
 339:	e8 04 01 00 00       	call   442 <join>
 33e:	89 c3                	mov    %eax,%ebx
  free(stack);
 340:	83 c4 04             	add    $0x4,%esp
 343:	ff 75 f4             	push   -0xc(%ebp)
 346:	e8 0a 03 00 00       	call   655 <free>
  return pid;
}
 34b:	89 d8                	mov    %ebx,%eax
 34d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 350:	c9                   	leave  
 351:	c3                   	ret    

00000352 <lock_init>:
int
lock_init(lock_t * lock){
 352:	55                   	push   %ebp
 353:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 355:	8b 45 08             	mov    0x8(%ebp),%eax
 358:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 35e:	b8 00 00 00 00       	mov    $0x0,%eax
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    

00000365 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 365:	55                   	push   %ebp
 366:	89 e5                	mov    %esp,%ebp
 368:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 36b:	b8 01 00 00 00       	mov    $0x1,%eax
 370:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 373:	83 f8 01             	cmp    $0x1,%eax
 376:	74 f3                	je     36b <lock_acquire+0x6>
  {

  }
  return 0;
}
 378:	b8 00 00 00 00       	mov    $0x0,%eax
 37d:	5d                   	pop    %ebp
 37e:	c3                   	ret    

0000037f <lock_release>:
int
lock_release(lock_t * lock){
 37f:	55                   	push   %ebp
 380:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 382:	8b 45 08             	mov    0x8(%ebp),%eax
 385:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 38b:	b8 00 00 00 00       	mov    $0x0,%eax
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 392:	b8 01 00 00 00       	mov    $0x1,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <exit>:
SYSCALL(exit)
 39a:	b8 02 00 00 00       	mov    $0x2,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <wait>:
SYSCALL(wait)
 3a2:	b8 03 00 00 00       	mov    $0x3,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <pipe>:
SYSCALL(pipe)
 3aa:	b8 04 00 00 00       	mov    $0x4,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <read>:
SYSCALL(read)
 3b2:	b8 05 00 00 00       	mov    $0x5,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <write>:
SYSCALL(write)
 3ba:	b8 10 00 00 00       	mov    $0x10,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <close>:
SYSCALL(close)
 3c2:	b8 15 00 00 00       	mov    $0x15,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <kill>:
SYSCALL(kill)
 3ca:	b8 06 00 00 00       	mov    $0x6,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <exec>:
SYSCALL(exec)
 3d2:	b8 07 00 00 00       	mov    $0x7,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <open>:
SYSCALL(open)
 3da:	b8 0f 00 00 00       	mov    $0xf,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <mknod>:
SYSCALL(mknod)
 3e2:	b8 11 00 00 00       	mov    $0x11,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <unlink>:
SYSCALL(unlink)
 3ea:	b8 12 00 00 00       	mov    $0x12,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <fstat>:
SYSCALL(fstat)
 3f2:	b8 08 00 00 00       	mov    $0x8,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <link>:
SYSCALL(link)
 3fa:	b8 13 00 00 00       	mov    $0x13,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <mkdir>:
SYSCALL(mkdir)
 402:	b8 14 00 00 00       	mov    $0x14,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <chdir>:
SYSCALL(chdir)
 40a:	b8 09 00 00 00       	mov    $0x9,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <dup>:
SYSCALL(dup)
 412:	b8 0a 00 00 00       	mov    $0xa,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <getpid>:
SYSCALL(getpid)
 41a:	b8 0b 00 00 00       	mov    $0xb,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <sbrk>:
SYSCALL(sbrk)
 422:	b8 0c 00 00 00       	mov    $0xc,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <sleep>:
SYSCALL(sleep)
 42a:	b8 0d 00 00 00       	mov    $0xd,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <uptime>:
SYSCALL(uptime)
 432:	b8 0e 00 00 00       	mov    $0xe,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <clone>:
SYSCALL(clone)
 43a:	b8 16 00 00 00       	mov    $0x16,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <join>:
SYSCALL(join)
 442:	b8 17 00 00 00       	mov    $0x17,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 44a:	55                   	push   %ebp
 44b:	89 e5                	mov    %esp,%ebp
 44d:	83 ec 1c             	sub    $0x1c,%esp
 450:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 453:	6a 01                	push   $0x1
 455:	8d 55 f4             	lea    -0xc(%ebp),%edx
 458:	52                   	push   %edx
 459:	50                   	push   %eax
 45a:	e8 5b ff ff ff       	call   3ba <write>
}
 45f:	83 c4 10             	add    $0x10,%esp
 462:	c9                   	leave  
 463:	c3                   	ret    

00000464 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	56                   	push   %esi
 469:	53                   	push   %ebx
 46a:	83 ec 2c             	sub    $0x2c,%esp
 46d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 470:	89 d0                	mov    %edx,%eax
 472:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 474:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 478:	0f 95 c1             	setne  %cl
 47b:	c1 ea 1f             	shr    $0x1f,%edx
 47e:	84 d1                	test   %dl,%cl
 480:	74 44                	je     4c6 <printint+0x62>
    neg = 1;
    x = -xx;
 482:	f7 d8                	neg    %eax
 484:	89 c1                	mov    %eax,%ecx
    neg = 1;
 486:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 48d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 492:	89 c8                	mov    %ecx,%eax
 494:	ba 00 00 00 00       	mov    $0x0,%edx
 499:	f7 f6                	div    %esi
 49b:	89 df                	mov    %ebx,%edi
 49d:	83 c3 01             	add    $0x1,%ebx
 4a0:	0f b6 92 34 08 00 00 	movzbl 0x834(%edx),%edx
 4a7:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4ab:	89 ca                	mov    %ecx,%edx
 4ad:	89 c1                	mov    %eax,%ecx
 4af:	39 d6                	cmp    %edx,%esi
 4b1:	76 df                	jbe    492 <printint+0x2e>
  if(neg)
 4b3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4b7:	74 31                	je     4ea <printint+0x86>
    buf[i++] = '-';
 4b9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4be:	8d 5f 02             	lea    0x2(%edi),%ebx
 4c1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4c4:	eb 17                	jmp    4dd <printint+0x79>
    x = xx;
 4c6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4c8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4cf:	eb bc                	jmp    48d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4d1:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4d6:	89 f0                	mov    %esi,%eax
 4d8:	e8 6d ff ff ff       	call   44a <putc>
  while(--i >= 0)
 4dd:	83 eb 01             	sub    $0x1,%ebx
 4e0:	79 ef                	jns    4d1 <printint+0x6d>
}
 4e2:	83 c4 2c             	add    $0x2c,%esp
 4e5:	5b                   	pop    %ebx
 4e6:	5e                   	pop    %esi
 4e7:	5f                   	pop    %edi
 4e8:	5d                   	pop    %ebp
 4e9:	c3                   	ret    
 4ea:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4ed:	eb ee                	jmp    4dd <printint+0x79>

000004ef <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4ef:	55                   	push   %ebp
 4f0:	89 e5                	mov    %esp,%ebp
 4f2:	57                   	push   %edi
 4f3:	56                   	push   %esi
 4f4:	53                   	push   %ebx
 4f5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4f8:	8d 45 10             	lea    0x10(%ebp),%eax
 4fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4fe:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 503:	bb 00 00 00 00       	mov    $0x0,%ebx
 508:	eb 14                	jmp    51e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 50a:	89 fa                	mov    %edi,%edx
 50c:	8b 45 08             	mov    0x8(%ebp),%eax
 50f:	e8 36 ff ff ff       	call   44a <putc>
 514:	eb 05                	jmp    51b <printf+0x2c>
      }
    } else if(state == '%'){
 516:	83 fe 25             	cmp    $0x25,%esi
 519:	74 25                	je     540 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 51b:	83 c3 01             	add    $0x1,%ebx
 51e:	8b 45 0c             	mov    0xc(%ebp),%eax
 521:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 525:	84 c0                	test   %al,%al
 527:	0f 84 20 01 00 00    	je     64d <printf+0x15e>
    c = fmt[i] & 0xff;
 52d:	0f be f8             	movsbl %al,%edi
 530:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 533:	85 f6                	test   %esi,%esi
 535:	75 df                	jne    516 <printf+0x27>
      if(c == '%'){
 537:	83 f8 25             	cmp    $0x25,%eax
 53a:	75 ce                	jne    50a <printf+0x1b>
        state = '%';
 53c:	89 c6                	mov    %eax,%esi
 53e:	eb db                	jmp    51b <printf+0x2c>
      if(c == 'd'){
 540:	83 f8 25             	cmp    $0x25,%eax
 543:	0f 84 cf 00 00 00    	je     618 <printf+0x129>
 549:	0f 8c dd 00 00 00    	jl     62c <printf+0x13d>
 54f:	83 f8 78             	cmp    $0x78,%eax
 552:	0f 8f d4 00 00 00    	jg     62c <printf+0x13d>
 558:	83 f8 63             	cmp    $0x63,%eax
 55b:	0f 8c cb 00 00 00    	jl     62c <printf+0x13d>
 561:	83 e8 63             	sub    $0x63,%eax
 564:	83 f8 15             	cmp    $0x15,%eax
 567:	0f 87 bf 00 00 00    	ja     62c <printf+0x13d>
 56d:	ff 24 85 dc 07 00 00 	jmp    *0x7dc(,%eax,4)
        printint(fd, *ap, 10, 1);
 574:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 577:	8b 17                	mov    (%edi),%edx
 579:	83 ec 0c             	sub    $0xc,%esp
 57c:	6a 01                	push   $0x1
 57e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 583:	8b 45 08             	mov    0x8(%ebp),%eax
 586:	e8 d9 fe ff ff       	call   464 <printint>
        ap++;
 58b:	83 c7 04             	add    $0x4,%edi
 58e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 591:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 594:	be 00 00 00 00       	mov    $0x0,%esi
 599:	eb 80                	jmp    51b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 59b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 59e:	8b 17                	mov    (%edi),%edx
 5a0:	83 ec 0c             	sub    $0xc,%esp
 5a3:	6a 00                	push   $0x0
 5a5:	b9 10 00 00 00       	mov    $0x10,%ecx
 5aa:	8b 45 08             	mov    0x8(%ebp),%eax
 5ad:	e8 b2 fe ff ff       	call   464 <printint>
        ap++;
 5b2:	83 c7 04             	add    $0x4,%edi
 5b5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5bb:	be 00 00 00 00       	mov    $0x0,%esi
 5c0:	e9 56 ff ff ff       	jmp    51b <printf+0x2c>
        s = (char*)*ap;
 5c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c8:	8b 30                	mov    (%eax),%esi
        ap++;
 5ca:	83 c0 04             	add    $0x4,%eax
 5cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5d0:	85 f6                	test   %esi,%esi
 5d2:	75 15                	jne    5e9 <printf+0xfa>
          s = "(null)";
 5d4:	be d3 07 00 00       	mov    $0x7d3,%esi
 5d9:	eb 0e                	jmp    5e9 <printf+0xfa>
          putc(fd, *s);
 5db:	0f be d2             	movsbl %dl,%edx
 5de:	8b 45 08             	mov    0x8(%ebp),%eax
 5e1:	e8 64 fe ff ff       	call   44a <putc>
          s++;
 5e6:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5e9:	0f b6 16             	movzbl (%esi),%edx
 5ec:	84 d2                	test   %dl,%dl
 5ee:	75 eb                	jne    5db <printf+0xec>
      state = 0;
 5f0:	be 00 00 00 00       	mov    $0x0,%esi
 5f5:	e9 21 ff ff ff       	jmp    51b <printf+0x2c>
        putc(fd, *ap);
 5fa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5fd:	0f be 17             	movsbl (%edi),%edx
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	e8 42 fe ff ff       	call   44a <putc>
        ap++;
 608:	83 c7 04             	add    $0x4,%edi
 60b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 60e:	be 00 00 00 00       	mov    $0x0,%esi
 613:	e9 03 ff ff ff       	jmp    51b <printf+0x2c>
        putc(fd, c);
 618:	89 fa                	mov    %edi,%edx
 61a:	8b 45 08             	mov    0x8(%ebp),%eax
 61d:	e8 28 fe ff ff       	call   44a <putc>
      state = 0;
 622:	be 00 00 00 00       	mov    $0x0,%esi
 627:	e9 ef fe ff ff       	jmp    51b <printf+0x2c>
        putc(fd, '%');
 62c:	ba 25 00 00 00       	mov    $0x25,%edx
 631:	8b 45 08             	mov    0x8(%ebp),%eax
 634:	e8 11 fe ff ff       	call   44a <putc>
        putc(fd, c);
 639:	89 fa                	mov    %edi,%edx
 63b:	8b 45 08             	mov    0x8(%ebp),%eax
 63e:	e8 07 fe ff ff       	call   44a <putc>
      state = 0;
 643:	be 00 00 00 00       	mov    $0x0,%esi
 648:	e9 ce fe ff ff       	jmp    51b <printf+0x2c>
    }
  }
}
 64d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 650:	5b                   	pop    %ebx
 651:	5e                   	pop    %esi
 652:	5f                   	pop    %edi
 653:	5d                   	pop    %ebp
 654:	c3                   	ret    

00000655 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 655:	55                   	push   %ebp
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 65e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 666:	eb 02                	jmp    66a <free+0x15>
 668:	89 d0                	mov    %edx,%eax
 66a:	39 c8                	cmp    %ecx,%eax
 66c:	73 04                	jae    672 <free+0x1d>
 66e:	39 08                	cmp    %ecx,(%eax)
 670:	77 12                	ja     684 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 672:	8b 10                	mov    (%eax),%edx
 674:	39 c2                	cmp    %eax,%edx
 676:	77 f0                	ja     668 <free+0x13>
 678:	39 c8                	cmp    %ecx,%eax
 67a:	72 08                	jb     684 <free+0x2f>
 67c:	39 ca                	cmp    %ecx,%edx
 67e:	77 04                	ja     684 <free+0x2f>
 680:	89 d0                	mov    %edx,%eax
 682:	eb e6                	jmp    66a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 684:	8b 73 fc             	mov    -0x4(%ebx),%esi
 687:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68a:	8b 10                	mov    (%eax),%edx
 68c:	39 d7                	cmp    %edx,%edi
 68e:	74 19                	je     6a9 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 690:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 693:	8b 50 04             	mov    0x4(%eax),%edx
 696:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 699:	39 ce                	cmp    %ecx,%esi
 69b:	74 1b                	je     6b8 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 69d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 69f:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 6a4:	5b                   	pop    %ebx
 6a5:	5e                   	pop    %esi
 6a6:	5f                   	pop    %edi
 6a7:	5d                   	pop    %ebp
 6a8:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6a9:	03 72 04             	add    0x4(%edx),%esi
 6ac:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6af:	8b 10                	mov    (%eax),%edx
 6b1:	8b 12                	mov    (%edx),%edx
 6b3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6b6:	eb db                	jmp    693 <free+0x3e>
    p->s.size += bp->s.size;
 6b8:	03 53 fc             	add    -0x4(%ebx),%edx
 6bb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6be:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6c1:	89 10                	mov    %edx,(%eax)
 6c3:	eb da                	jmp    69f <free+0x4a>

000006c5 <morecore>:

static Header*
morecore(uint nu)
{
 6c5:	55                   	push   %ebp
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	53                   	push   %ebx
 6c9:	83 ec 04             	sub    $0x4,%esp
 6cc:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6ce:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6d3:	77 05                	ja     6da <morecore+0x15>
    nu = 4096;
 6d5:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6da:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6e1:	83 ec 0c             	sub    $0xc,%esp
 6e4:	50                   	push   %eax
 6e5:	e8 38 fd ff ff       	call   422 <sbrk>
  if(p == (char*)-1)
 6ea:	83 c4 10             	add    $0x10,%esp
 6ed:	83 f8 ff             	cmp    $0xffffffff,%eax
 6f0:	74 1c                	je     70e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6f2:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6f5:	83 c0 08             	add    $0x8,%eax
 6f8:	83 ec 0c             	sub    $0xc,%esp
 6fb:	50                   	push   %eax
 6fc:	e8 54 ff ff ff       	call   655 <free>
  return freep;
 701:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 706:	83 c4 10             	add    $0x10,%esp
}
 709:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 70c:	c9                   	leave  
 70d:	c3                   	ret    
    return 0;
 70e:	b8 00 00 00 00       	mov    $0x0,%eax
 713:	eb f4                	jmp    709 <morecore+0x44>

00000715 <malloc>:

void*
malloc(uint nbytes)
{
 715:	55                   	push   %ebp
 716:	89 e5                	mov    %esp,%ebp
 718:	53                   	push   %ebx
 719:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	8d 58 07             	lea    0x7(%eax),%ebx
 722:	c1 eb 03             	shr    $0x3,%ebx
 725:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 728:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 72e:	85 c9                	test   %ecx,%ecx
 730:	74 04                	je     736 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 732:	8b 01                	mov    (%ecx),%eax
 734:	eb 4a                	jmp    780 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 736:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 73d:	0d 00 00 
 740:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 747:	0d 00 00 
    base.s.size = 0;
 74a:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 751:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 754:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
 759:	eb d7                	jmp    732 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 75b:	74 19                	je     776 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 75d:	29 da                	sub    %ebx,%edx
 75f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 762:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 765:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 768:	89 0d c0 0d 00 00    	mov    %ecx,0xdc0
      return (void*)(p + 1);
 76e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 771:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 774:	c9                   	leave  
 775:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 776:	8b 10                	mov    (%eax),%edx
 778:	89 11                	mov    %edx,(%ecx)
 77a:	eb ec                	jmp    768 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 77c:	89 c1                	mov    %eax,%ecx
 77e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 780:	8b 50 04             	mov    0x4(%eax),%edx
 783:	39 da                	cmp    %ebx,%edx
 785:	73 d4                	jae    75b <malloc+0x46>
    if(p == freep)
 787:	39 05 c0 0d 00 00    	cmp    %eax,0xdc0
 78d:	75 ed                	jne    77c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 78f:	89 d8                	mov    %ebx,%eax
 791:	e8 2f ff ff ff       	call   6c5 <morecore>
 796:	85 c0                	test   %eax,%eax
 798:	75 e2                	jne    77c <malloc+0x67>
 79a:	eb d5                	jmp    771 <malloc+0x5c>
