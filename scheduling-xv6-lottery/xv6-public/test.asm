
_test:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "user.h"
#include "fs.h"
#include "param.h"
#include "pstat.h"
int main(int argc, char const *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	push   -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
    100f:	8b 59 04             	mov    0x4(%ecx),%ebx
    int x = 1;
    if (argc != 3)
    1012:	83 39 03             	cmpl   $0x3,(%ecx)
    1015:	74 05                	je     101c <main+0x1c>
    {
        exit();
    1017:	e8 d3 01 00 00       	call   11ef <exit>
    }
    settickets(atoi(argv[2]));
    101c:	83 ec 0c             	sub    $0xc,%esp
    101f:	ff 73 08             	push   0x8(%ebx)
    1022:	e8 64 01 00 00       	call   118b <atoi>
    1027:	89 04 24             	mov    %eax,(%esp)
    102a:	e8 60 02 00 00       	call   128f <settickets>
    int iteration = atoi(argv[1]);
    102f:	83 c4 04             	add    $0x4,%esp
    1032:	ff 73 04             	push   0x4(%ebx)
    1035:	e8 51 01 00 00       	call   118b <atoi>
    for (int i = 0; i < iteration; i++)
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	ba 00 00 00 00       	mov    $0x0,%edx
    1042:	eb 03                	jmp    1047 <main+0x47>
    1044:	83 c2 01             	add    $0x1,%edx
    1047:	39 c2                	cmp    %eax,%edx
    1049:	7c f9                	jl     1044 <main+0x44>
    {
        x++;
    }
    
    exit();
    104b:	e8 9f 01 00 00       	call   11ef <exit>

00001050 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	56                   	push   %esi
    1054:	53                   	push   %ebx
    1055:	8b 75 08             	mov    0x8(%ebp),%esi
    1058:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    105b:	89 f0                	mov    %esi,%eax
    105d:	89 d1                	mov    %edx,%ecx
    105f:	83 c2 01             	add    $0x1,%edx
    1062:	89 c3                	mov    %eax,%ebx
    1064:	83 c0 01             	add    $0x1,%eax
    1067:	0f b6 09             	movzbl (%ecx),%ecx
    106a:	88 0b                	mov    %cl,(%ebx)
    106c:	84 c9                	test   %cl,%cl
    106e:	75 ed                	jne    105d <strcpy+0xd>
    ;
  return os;
}
    1070:	89 f0                	mov    %esi,%eax
    1072:	5b                   	pop    %ebx
    1073:	5e                   	pop    %esi
    1074:	5d                   	pop    %ebp
    1075:	c3                   	ret    

00001076 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1076:	55                   	push   %ebp
    1077:	89 e5                	mov    %esp,%ebp
    1079:	8b 4d 08             	mov    0x8(%ebp),%ecx
    107c:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    107f:	eb 06                	jmp    1087 <strcmp+0x11>
    p++, q++;
    1081:	83 c1 01             	add    $0x1,%ecx
    1084:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1087:	0f b6 01             	movzbl (%ecx),%eax
    108a:	84 c0                	test   %al,%al
    108c:	74 04                	je     1092 <strcmp+0x1c>
    108e:	3a 02                	cmp    (%edx),%al
    1090:	74 ef                	je     1081 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
    1092:	0f b6 c0             	movzbl %al,%eax
    1095:	0f b6 12             	movzbl (%edx),%edx
    1098:	29 d0                	sub    %edx,%eax
}
    109a:	5d                   	pop    %ebp
    109b:	c3                   	ret    

0000109c <strlen>:

uint
strlen(const char *s)
{
    109c:	55                   	push   %ebp
    109d:	89 e5                	mov    %esp,%ebp
    109f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10a2:	b8 00 00 00 00       	mov    $0x0,%eax
    10a7:	eb 03                	jmp    10ac <strlen+0x10>
    10a9:	83 c0 01             	add    $0x1,%eax
    10ac:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
    10b0:	75 f7                	jne    10a9 <strlen+0xd>
    ;
  return n;
}
    10b2:	5d                   	pop    %ebp
    10b3:	c3                   	ret    

000010b4 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10b4:	55                   	push   %ebp
    10b5:	89 e5                	mov    %esp,%ebp
    10b7:	57                   	push   %edi
    10b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10bb:	89 d7                	mov    %edx,%edi
    10bd:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    10c3:	fc                   	cld    
    10c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10c6:	89 d0                	mov    %edx,%eax
    10c8:	8b 7d fc             	mov    -0x4(%ebp),%edi
    10cb:	c9                   	leave  
    10cc:	c3                   	ret    

000010cd <strchr>:

char*
strchr(const char *s, char c)
{
    10cd:	55                   	push   %ebp
    10ce:	89 e5                	mov    %esp,%ebp
    10d0:	8b 45 08             	mov    0x8(%ebp),%eax
    10d3:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    10d7:	eb 03                	jmp    10dc <strchr+0xf>
    10d9:	83 c0 01             	add    $0x1,%eax
    10dc:	0f b6 10             	movzbl (%eax),%edx
    10df:	84 d2                	test   %dl,%dl
    10e1:	74 06                	je     10e9 <strchr+0x1c>
    if(*s == c)
    10e3:	38 ca                	cmp    %cl,%dl
    10e5:	75 f2                	jne    10d9 <strchr+0xc>
    10e7:	eb 05                	jmp    10ee <strchr+0x21>
      return (char*)s;
  return 0;
    10e9:	b8 00 00 00 00       	mov    $0x0,%eax
}
    10ee:	5d                   	pop    %ebp
    10ef:	c3                   	ret    

000010f0 <gets>:

char*
gets(char *buf, int max)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	57                   	push   %edi
    10f4:	56                   	push   %esi
    10f5:	53                   	push   %ebx
    10f6:	83 ec 1c             	sub    $0x1c,%esp
    10f9:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    10fc:	bb 00 00 00 00       	mov    $0x0,%ebx
    1101:	89 de                	mov    %ebx,%esi
    1103:	83 c3 01             	add    $0x1,%ebx
    1106:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1109:	7d 2e                	jge    1139 <gets+0x49>
    cc = read(0, &c, 1);
    110b:	83 ec 04             	sub    $0x4,%esp
    110e:	6a 01                	push   $0x1
    1110:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1113:	50                   	push   %eax
    1114:	6a 00                	push   $0x0
    1116:	e8 ec 00 00 00       	call   1207 <read>
    if(cc < 1)
    111b:	83 c4 10             	add    $0x10,%esp
    111e:	85 c0                	test   %eax,%eax
    1120:	7e 17                	jle    1139 <gets+0x49>
      break;
    buf[i++] = c;
    1122:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1126:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
    1129:	3c 0a                	cmp    $0xa,%al
    112b:	0f 94 c2             	sete   %dl
    112e:	3c 0d                	cmp    $0xd,%al
    1130:	0f 94 c0             	sete   %al
    1133:	08 c2                	or     %al,%dl
    1135:	74 ca                	je     1101 <gets+0x11>
    buf[i++] = c;
    1137:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
    1139:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    113d:	89 f8                	mov    %edi,%eax
    113f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1142:	5b                   	pop    %ebx
    1143:	5e                   	pop    %esi
    1144:	5f                   	pop    %edi
    1145:	5d                   	pop    %ebp
    1146:	c3                   	ret    

00001147 <stat>:

int
stat(const char *n, struct stat *st)
{
    1147:	55                   	push   %ebp
    1148:	89 e5                	mov    %esp,%ebp
    114a:	56                   	push   %esi
    114b:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    114c:	83 ec 08             	sub    $0x8,%esp
    114f:	6a 00                	push   $0x0
    1151:	ff 75 08             	push   0x8(%ebp)
    1154:	e8 d6 00 00 00       	call   122f <open>
  if(fd < 0)
    1159:	83 c4 10             	add    $0x10,%esp
    115c:	85 c0                	test   %eax,%eax
    115e:	78 24                	js     1184 <stat+0x3d>
    1160:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    1162:	83 ec 08             	sub    $0x8,%esp
    1165:	ff 75 0c             	push   0xc(%ebp)
    1168:	50                   	push   %eax
    1169:	e8 d9 00 00 00       	call   1247 <fstat>
    116e:	89 c6                	mov    %eax,%esi
  close(fd);
    1170:	89 1c 24             	mov    %ebx,(%esp)
    1173:	e8 9f 00 00 00       	call   1217 <close>
  return r;
    1178:	83 c4 10             	add    $0x10,%esp
}
    117b:	89 f0                	mov    %esi,%eax
    117d:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1180:	5b                   	pop    %ebx
    1181:	5e                   	pop    %esi
    1182:	5d                   	pop    %ebp
    1183:	c3                   	ret    
    return -1;
    1184:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1189:	eb f0                	jmp    117b <stat+0x34>

0000118b <atoi>:

int
atoi(const char *s)
{
    118b:	55                   	push   %ebp
    118c:	89 e5                	mov    %esp,%ebp
    118e:	53                   	push   %ebx
    118f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
    1192:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
    1197:	eb 10                	jmp    11a9 <atoi+0x1e>
    n = n*10 + *s++ - '0';
    1199:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
    119c:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
    119f:	83 c1 01             	add    $0x1,%ecx
    11a2:	0f be c0             	movsbl %al,%eax
    11a5:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
    11a9:	0f b6 01             	movzbl (%ecx),%eax
    11ac:	8d 58 d0             	lea    -0x30(%eax),%ebx
    11af:	80 fb 09             	cmp    $0x9,%bl
    11b2:	76 e5                	jbe    1199 <atoi+0xe>
  return n;
}
    11b4:	89 d0                	mov    %edx,%eax
    11b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11b9:	c9                   	leave  
    11ba:	c3                   	ret    

000011bb <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    11bb:	55                   	push   %ebp
    11bc:	89 e5                	mov    %esp,%ebp
    11be:	56                   	push   %esi
    11bf:	53                   	push   %ebx
    11c0:	8b 75 08             	mov    0x8(%ebp),%esi
    11c3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    11c6:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
    11c9:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
    11cb:	eb 0d                	jmp    11da <memmove+0x1f>
    *dst++ = *src++;
    11cd:	0f b6 01             	movzbl (%ecx),%eax
    11d0:	88 02                	mov    %al,(%edx)
    11d2:	8d 49 01             	lea    0x1(%ecx),%ecx
    11d5:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
    11d8:	89 d8                	mov    %ebx,%eax
    11da:	8d 58 ff             	lea    -0x1(%eax),%ebx
    11dd:	85 c0                	test   %eax,%eax
    11df:	7f ec                	jg     11cd <memmove+0x12>
  return vdst;
}
    11e1:	89 f0                	mov    %esi,%eax
    11e3:	5b                   	pop    %ebx
    11e4:	5e                   	pop    %esi
    11e5:	5d                   	pop    %ebp
    11e6:	c3                   	ret    

000011e7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    11e7:	b8 01 00 00 00       	mov    $0x1,%eax
    11ec:	cd 40                	int    $0x40
    11ee:	c3                   	ret    

000011ef <exit>:
SYSCALL(exit)
    11ef:	b8 02 00 00 00       	mov    $0x2,%eax
    11f4:	cd 40                	int    $0x40
    11f6:	c3                   	ret    

000011f7 <wait>:
SYSCALL(wait)
    11f7:	b8 03 00 00 00       	mov    $0x3,%eax
    11fc:	cd 40                	int    $0x40
    11fe:	c3                   	ret    

000011ff <pipe>:
SYSCALL(pipe)
    11ff:	b8 04 00 00 00       	mov    $0x4,%eax
    1204:	cd 40                	int    $0x40
    1206:	c3                   	ret    

00001207 <read>:
SYSCALL(read)
    1207:	b8 05 00 00 00       	mov    $0x5,%eax
    120c:	cd 40                	int    $0x40
    120e:	c3                   	ret    

0000120f <write>:
SYSCALL(write)
    120f:	b8 10 00 00 00       	mov    $0x10,%eax
    1214:	cd 40                	int    $0x40
    1216:	c3                   	ret    

00001217 <close>:
SYSCALL(close)
    1217:	b8 15 00 00 00       	mov    $0x15,%eax
    121c:	cd 40                	int    $0x40
    121e:	c3                   	ret    

0000121f <kill>:
SYSCALL(kill)
    121f:	b8 06 00 00 00       	mov    $0x6,%eax
    1224:	cd 40                	int    $0x40
    1226:	c3                   	ret    

00001227 <exec>:
SYSCALL(exec)
    1227:	b8 07 00 00 00       	mov    $0x7,%eax
    122c:	cd 40                	int    $0x40
    122e:	c3                   	ret    

0000122f <open>:
SYSCALL(open)
    122f:	b8 0f 00 00 00       	mov    $0xf,%eax
    1234:	cd 40                	int    $0x40
    1236:	c3                   	ret    

00001237 <mknod>:
SYSCALL(mknod)
    1237:	b8 11 00 00 00       	mov    $0x11,%eax
    123c:	cd 40                	int    $0x40
    123e:	c3                   	ret    

0000123f <unlink>:
SYSCALL(unlink)
    123f:	b8 12 00 00 00       	mov    $0x12,%eax
    1244:	cd 40                	int    $0x40
    1246:	c3                   	ret    

00001247 <fstat>:
SYSCALL(fstat)
    1247:	b8 08 00 00 00       	mov    $0x8,%eax
    124c:	cd 40                	int    $0x40
    124e:	c3                   	ret    

0000124f <link>:
SYSCALL(link)
    124f:	b8 13 00 00 00       	mov    $0x13,%eax
    1254:	cd 40                	int    $0x40
    1256:	c3                   	ret    

00001257 <mkdir>:
SYSCALL(mkdir)
    1257:	b8 14 00 00 00       	mov    $0x14,%eax
    125c:	cd 40                	int    $0x40
    125e:	c3                   	ret    

0000125f <chdir>:
SYSCALL(chdir)
    125f:	b8 09 00 00 00       	mov    $0x9,%eax
    1264:	cd 40                	int    $0x40
    1266:	c3                   	ret    

00001267 <dup>:
SYSCALL(dup)
    1267:	b8 0a 00 00 00       	mov    $0xa,%eax
    126c:	cd 40                	int    $0x40
    126e:	c3                   	ret    

0000126f <getpid>:
SYSCALL(getpid)
    126f:	b8 0b 00 00 00       	mov    $0xb,%eax
    1274:	cd 40                	int    $0x40
    1276:	c3                   	ret    

00001277 <sbrk>:
SYSCALL(sbrk)
    1277:	b8 0c 00 00 00       	mov    $0xc,%eax
    127c:	cd 40                	int    $0x40
    127e:	c3                   	ret    

0000127f <sleep>:
SYSCALL(sleep)
    127f:	b8 0d 00 00 00       	mov    $0xd,%eax
    1284:	cd 40                	int    $0x40
    1286:	c3                   	ret    

00001287 <uptime>:
SYSCALL(uptime)
    1287:	b8 0e 00 00 00       	mov    $0xe,%eax
    128c:	cd 40                	int    $0x40
    128e:	c3                   	ret    

0000128f <settickets>:
SYSCALL(settickets)
    128f:	b8 16 00 00 00       	mov    $0x16,%eax
    1294:	cd 40                	int    $0x40
    1296:	c3                   	ret    

00001297 <getpinfo>:
SYSCALL(getpinfo)
    1297:	b8 17 00 00 00       	mov    $0x17,%eax
    129c:	cd 40                	int    $0x40
    129e:	c3                   	ret    

0000129f <mprotect>:
SYSCALL(mprotect)
    129f:	b8 18 00 00 00       	mov    $0x18,%eax
    12a4:	cd 40                	int    $0x40
    12a6:	c3                   	ret    

000012a7 <munprotect>:
SYSCALL(munprotect)
    12a7:	b8 19 00 00 00       	mov    $0x19,%eax
    12ac:	cd 40                	int    $0x40
    12ae:	c3                   	ret    

000012af <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    12af:	55                   	push   %ebp
    12b0:	89 e5                	mov    %esp,%ebp
    12b2:	83 ec 1c             	sub    $0x1c,%esp
    12b5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    12b8:	6a 01                	push   $0x1
    12ba:	8d 55 f4             	lea    -0xc(%ebp),%edx
    12bd:	52                   	push   %edx
    12be:	50                   	push   %eax
    12bf:	e8 4b ff ff ff       	call   120f <write>
}
    12c4:	83 c4 10             	add    $0x10,%esp
    12c7:	c9                   	leave  
    12c8:	c3                   	ret    

000012c9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    12c9:	55                   	push   %ebp
    12ca:	89 e5                	mov    %esp,%ebp
    12cc:	57                   	push   %edi
    12cd:	56                   	push   %esi
    12ce:	53                   	push   %ebx
    12cf:	83 ec 2c             	sub    $0x2c,%esp
    12d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    12d5:	89 d0                	mov    %edx,%eax
    12d7:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    12d9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    12dd:	0f 95 c1             	setne  %cl
    12e0:	c1 ea 1f             	shr    $0x1f,%edx
    12e3:	84 d1                	test   %dl,%cl
    12e5:	74 44                	je     132b <printint+0x62>
    neg = 1;
    x = -xx;
    12e7:	f7 d8                	neg    %eax
    12e9:	89 c1                	mov    %eax,%ecx
    neg = 1;
    12eb:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    12f2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
    12f7:	89 c8                	mov    %ecx,%eax
    12f9:	ba 00 00 00 00       	mov    $0x0,%edx
    12fe:	f7 f6                	div    %esi
    1300:	89 df                	mov    %ebx,%edi
    1302:	83 c3 01             	add    $0x1,%ebx
    1305:	0f b6 92 64 16 00 00 	movzbl 0x1664(%edx),%edx
    130c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
    1310:	89 ca                	mov    %ecx,%edx
    1312:	89 c1                	mov    %eax,%ecx
    1314:	39 d6                	cmp    %edx,%esi
    1316:	76 df                	jbe    12f7 <printint+0x2e>
  if(neg)
    1318:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    131c:	74 31                	je     134f <printint+0x86>
    buf[i++] = '-';
    131e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    1323:	8d 5f 02             	lea    0x2(%edi),%ebx
    1326:	8b 75 d0             	mov    -0x30(%ebp),%esi
    1329:	eb 17                	jmp    1342 <printint+0x79>
    x = xx;
    132b:	89 c1                	mov    %eax,%ecx
  neg = 0;
    132d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1334:	eb bc                	jmp    12f2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
    1336:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    133b:	89 f0                	mov    %esi,%eax
    133d:	e8 6d ff ff ff       	call   12af <putc>
  while(--i >= 0)
    1342:	83 eb 01             	sub    $0x1,%ebx
    1345:	79 ef                	jns    1336 <printint+0x6d>
}
    1347:	83 c4 2c             	add    $0x2c,%esp
    134a:	5b                   	pop    %ebx
    134b:	5e                   	pop    %esi
    134c:	5f                   	pop    %edi
    134d:	5d                   	pop    %ebp
    134e:	c3                   	ret    
    134f:	8b 75 d0             	mov    -0x30(%ebp),%esi
    1352:	eb ee                	jmp    1342 <printint+0x79>

00001354 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1354:	55                   	push   %ebp
    1355:	89 e5                	mov    %esp,%ebp
    1357:	57                   	push   %edi
    1358:	56                   	push   %esi
    1359:	53                   	push   %ebx
    135a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    135d:	8d 45 10             	lea    0x10(%ebp),%eax
    1360:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
    1363:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
    1368:	bb 00 00 00 00       	mov    $0x0,%ebx
    136d:	eb 14                	jmp    1383 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    136f:	89 fa                	mov    %edi,%edx
    1371:	8b 45 08             	mov    0x8(%ebp),%eax
    1374:	e8 36 ff ff ff       	call   12af <putc>
    1379:	eb 05                	jmp    1380 <printf+0x2c>
      }
    } else if(state == '%'){
    137b:	83 fe 25             	cmp    $0x25,%esi
    137e:	74 25                	je     13a5 <printf+0x51>
  for(i = 0; fmt[i]; i++){
    1380:	83 c3 01             	add    $0x1,%ebx
    1383:	8b 45 0c             	mov    0xc(%ebp),%eax
    1386:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
    138a:	84 c0                	test   %al,%al
    138c:	0f 84 20 01 00 00    	je     14b2 <printf+0x15e>
    c = fmt[i] & 0xff;
    1392:	0f be f8             	movsbl %al,%edi
    1395:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    1398:	85 f6                	test   %esi,%esi
    139a:	75 df                	jne    137b <printf+0x27>
      if(c == '%'){
    139c:	83 f8 25             	cmp    $0x25,%eax
    139f:	75 ce                	jne    136f <printf+0x1b>
        state = '%';
    13a1:	89 c6                	mov    %eax,%esi
    13a3:	eb db                	jmp    1380 <printf+0x2c>
      if(c == 'd'){
    13a5:	83 f8 25             	cmp    $0x25,%eax
    13a8:	0f 84 cf 00 00 00    	je     147d <printf+0x129>
    13ae:	0f 8c dd 00 00 00    	jl     1491 <printf+0x13d>
    13b4:	83 f8 78             	cmp    $0x78,%eax
    13b7:	0f 8f d4 00 00 00    	jg     1491 <printf+0x13d>
    13bd:	83 f8 63             	cmp    $0x63,%eax
    13c0:	0f 8c cb 00 00 00    	jl     1491 <printf+0x13d>
    13c6:	83 e8 63             	sub    $0x63,%eax
    13c9:	83 f8 15             	cmp    $0x15,%eax
    13cc:	0f 87 bf 00 00 00    	ja     1491 <printf+0x13d>
    13d2:	ff 24 85 0c 16 00 00 	jmp    *0x160c(,%eax,4)
        printint(fd, *ap, 10, 1);
    13d9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    13dc:	8b 17                	mov    (%edi),%edx
    13de:	83 ec 0c             	sub    $0xc,%esp
    13e1:	6a 01                	push   $0x1
    13e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    13e8:	8b 45 08             	mov    0x8(%ebp),%eax
    13eb:	e8 d9 fe ff ff       	call   12c9 <printint>
        ap++;
    13f0:	83 c7 04             	add    $0x4,%edi
    13f3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    13f6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    13f9:	be 00 00 00 00       	mov    $0x0,%esi
    13fe:	eb 80                	jmp    1380 <printf+0x2c>
        printint(fd, *ap, 16, 0);
    1400:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    1403:	8b 17                	mov    (%edi),%edx
    1405:	83 ec 0c             	sub    $0xc,%esp
    1408:	6a 00                	push   $0x0
    140a:	b9 10 00 00 00       	mov    $0x10,%ecx
    140f:	8b 45 08             	mov    0x8(%ebp),%eax
    1412:	e8 b2 fe ff ff       	call   12c9 <printint>
        ap++;
    1417:	83 c7 04             	add    $0x4,%edi
    141a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    141d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1420:	be 00 00 00 00       	mov    $0x0,%esi
    1425:	e9 56 ff ff ff       	jmp    1380 <printf+0x2c>
        s = (char*)*ap;
    142a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    142d:	8b 30                	mov    (%eax),%esi
        ap++;
    142f:	83 c0 04             	add    $0x4,%eax
    1432:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
    1435:	85 f6                	test   %esi,%esi
    1437:	75 15                	jne    144e <printf+0xfa>
          s = "(null)";
    1439:	be 04 16 00 00       	mov    $0x1604,%esi
    143e:	eb 0e                	jmp    144e <printf+0xfa>
          putc(fd, *s);
    1440:	0f be d2             	movsbl %dl,%edx
    1443:	8b 45 08             	mov    0x8(%ebp),%eax
    1446:	e8 64 fe ff ff       	call   12af <putc>
          s++;
    144b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
    144e:	0f b6 16             	movzbl (%esi),%edx
    1451:	84 d2                	test   %dl,%dl
    1453:	75 eb                	jne    1440 <printf+0xec>
      state = 0;
    1455:	be 00 00 00 00       	mov    $0x0,%esi
    145a:	e9 21 ff ff ff       	jmp    1380 <printf+0x2c>
        putc(fd, *ap);
    145f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    1462:	0f be 17             	movsbl (%edi),%edx
    1465:	8b 45 08             	mov    0x8(%ebp),%eax
    1468:	e8 42 fe ff ff       	call   12af <putc>
        ap++;
    146d:	83 c7 04             	add    $0x4,%edi
    1470:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
    1473:	be 00 00 00 00       	mov    $0x0,%esi
    1478:	e9 03 ff ff ff       	jmp    1380 <printf+0x2c>
        putc(fd, c);
    147d:	89 fa                	mov    %edi,%edx
    147f:	8b 45 08             	mov    0x8(%ebp),%eax
    1482:	e8 28 fe ff ff       	call   12af <putc>
      state = 0;
    1487:	be 00 00 00 00       	mov    $0x0,%esi
    148c:	e9 ef fe ff ff       	jmp    1380 <printf+0x2c>
        putc(fd, '%');
    1491:	ba 25 00 00 00       	mov    $0x25,%edx
    1496:	8b 45 08             	mov    0x8(%ebp),%eax
    1499:	e8 11 fe ff ff       	call   12af <putc>
        putc(fd, c);
    149e:	89 fa                	mov    %edi,%edx
    14a0:	8b 45 08             	mov    0x8(%ebp),%eax
    14a3:	e8 07 fe ff ff       	call   12af <putc>
      state = 0;
    14a8:	be 00 00 00 00       	mov    $0x0,%esi
    14ad:	e9 ce fe ff ff       	jmp    1380 <printf+0x2c>
    }
  }
}
    14b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14b5:	5b                   	pop    %ebx
    14b6:	5e                   	pop    %esi
    14b7:	5f                   	pop    %edi
    14b8:	5d                   	pop    %ebp
    14b9:	c3                   	ret    

000014ba <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    14ba:	55                   	push   %ebp
    14bb:	89 e5                	mov    %esp,%ebp
    14bd:	57                   	push   %edi
    14be:	56                   	push   %esi
    14bf:	53                   	push   %ebx
    14c0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    14c3:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14c6:	a1 08 19 00 00       	mov    0x1908,%eax
    14cb:	eb 02                	jmp    14cf <free+0x15>
    14cd:	89 d0                	mov    %edx,%eax
    14cf:	39 c8                	cmp    %ecx,%eax
    14d1:	73 04                	jae    14d7 <free+0x1d>
    14d3:	39 08                	cmp    %ecx,(%eax)
    14d5:	77 12                	ja     14e9 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14d7:	8b 10                	mov    (%eax),%edx
    14d9:	39 c2                	cmp    %eax,%edx
    14db:	77 f0                	ja     14cd <free+0x13>
    14dd:	39 c8                	cmp    %ecx,%eax
    14df:	72 08                	jb     14e9 <free+0x2f>
    14e1:	39 ca                	cmp    %ecx,%edx
    14e3:	77 04                	ja     14e9 <free+0x2f>
    14e5:	89 d0                	mov    %edx,%eax
    14e7:	eb e6                	jmp    14cf <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
    14e9:	8b 73 fc             	mov    -0x4(%ebx),%esi
    14ec:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    14ef:	8b 10                	mov    (%eax),%edx
    14f1:	39 d7                	cmp    %edx,%edi
    14f3:	74 19                	je     150e <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    14f5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    14f8:	8b 50 04             	mov    0x4(%eax),%edx
    14fb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    14fe:	39 ce                	cmp    %ecx,%esi
    1500:	74 1b                	je     151d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1502:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1504:	a3 08 19 00 00       	mov    %eax,0x1908
}
    1509:	5b                   	pop    %ebx
    150a:	5e                   	pop    %esi
    150b:	5f                   	pop    %edi
    150c:	5d                   	pop    %ebp
    150d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    150e:	03 72 04             	add    0x4(%edx),%esi
    1511:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1514:	8b 10                	mov    (%eax),%edx
    1516:	8b 12                	mov    (%edx),%edx
    1518:	89 53 f8             	mov    %edx,-0x8(%ebx)
    151b:	eb db                	jmp    14f8 <free+0x3e>
    p->s.size += bp->s.size;
    151d:	03 53 fc             	add    -0x4(%ebx),%edx
    1520:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1523:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1526:	89 10                	mov    %edx,(%eax)
    1528:	eb da                	jmp    1504 <free+0x4a>

0000152a <morecore>:

static Header*
morecore(uint nu)
{
    152a:	55                   	push   %ebp
    152b:	89 e5                	mov    %esp,%ebp
    152d:	53                   	push   %ebx
    152e:	83 ec 04             	sub    $0x4,%esp
    1531:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    1533:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    1538:	77 05                	ja     153f <morecore+0x15>
    nu = 4096;
    153a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    153f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1546:	83 ec 0c             	sub    $0xc,%esp
    1549:	50                   	push   %eax
    154a:	e8 28 fd ff ff       	call   1277 <sbrk>
  if(p == (char*)-1)
    154f:	83 c4 10             	add    $0x10,%esp
    1552:	83 f8 ff             	cmp    $0xffffffff,%eax
    1555:	74 1c                	je     1573 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1557:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    155a:	83 c0 08             	add    $0x8,%eax
    155d:	83 ec 0c             	sub    $0xc,%esp
    1560:	50                   	push   %eax
    1561:	e8 54 ff ff ff       	call   14ba <free>
  return freep;
    1566:	a1 08 19 00 00       	mov    0x1908,%eax
    156b:	83 c4 10             	add    $0x10,%esp
}
    156e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1571:	c9                   	leave  
    1572:	c3                   	ret    
    return 0;
    1573:	b8 00 00 00 00       	mov    $0x0,%eax
    1578:	eb f4                	jmp    156e <morecore+0x44>

0000157a <malloc>:

void*
malloc(uint nbytes)
{
    157a:	55                   	push   %ebp
    157b:	89 e5                	mov    %esp,%ebp
    157d:	53                   	push   %ebx
    157e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1581:	8b 45 08             	mov    0x8(%ebp),%eax
    1584:	8d 58 07             	lea    0x7(%eax),%ebx
    1587:	c1 eb 03             	shr    $0x3,%ebx
    158a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    158d:	8b 0d 08 19 00 00    	mov    0x1908,%ecx
    1593:	85 c9                	test   %ecx,%ecx
    1595:	74 04                	je     159b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1597:	8b 01                	mov    (%ecx),%eax
    1599:	eb 4a                	jmp    15e5 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
    159b:	c7 05 08 19 00 00 0c 	movl   $0x190c,0x1908
    15a2:	19 00 00 
    15a5:	c7 05 0c 19 00 00 0c 	movl   $0x190c,0x190c
    15ac:	19 00 00 
    base.s.size = 0;
    15af:	c7 05 10 19 00 00 00 	movl   $0x0,0x1910
    15b6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    15b9:	b9 0c 19 00 00       	mov    $0x190c,%ecx
    15be:	eb d7                	jmp    1597 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    15c0:	74 19                	je     15db <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    15c2:	29 da                	sub    %ebx,%edx
    15c4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    15c7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    15ca:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    15cd:	89 0d 08 19 00 00    	mov    %ecx,0x1908
      return (void*)(p + 1);
    15d3:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    15d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    15d9:	c9                   	leave  
    15da:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    15db:	8b 10                	mov    (%eax),%edx
    15dd:	89 11                	mov    %edx,(%ecx)
    15df:	eb ec                	jmp    15cd <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15e1:	89 c1                	mov    %eax,%ecx
    15e3:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    15e5:	8b 50 04             	mov    0x4(%eax),%edx
    15e8:	39 da                	cmp    %ebx,%edx
    15ea:	73 d4                	jae    15c0 <malloc+0x46>
    if(p == freep)
    15ec:	39 05 08 19 00 00    	cmp    %eax,0x1908
    15f2:	75 ed                	jne    15e1 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
    15f4:	89 d8                	mov    %ebx,%eax
    15f6:	e8 2f ff ff ff       	call   152a <morecore>
    15fb:	85 c0                	test   %eax,%eax
    15fd:	75 e2                	jne    15e1 <malloc+0x67>
    15ff:	eb d5                	jmp    15d6 <malloc+0x5c>
