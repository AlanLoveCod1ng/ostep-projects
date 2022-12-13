
_ps:     file format elf32-i386


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
    100f:	81 ec 0c 04 00 00    	sub    $0x40c,%esp
    struct pstat pstat1;
    getpinfo(&pstat1);
    1015:	8d 85 f8 fb ff ff    	lea    -0x408(%ebp),%eax
    101b:	50                   	push   %eax
    101c:	e8 91 02 00 00       	call   12b2 <getpinfo>
    for (int i = 0; i < NPROC; i++)
    1021:	83 c4 10             	add    $0x10,%esp
    1024:	bb 00 00 00 00       	mov    $0x0,%ebx
    1029:	eb 03                	jmp    102e <main+0x2e>
    102b:	83 c3 01             	add    $0x1,%ebx
    102e:	83 fb 3f             	cmp    $0x3f,%ebx
    1031:	7f 33                	jg     1066 <main+0x66>
    {
        if (!pstat1.inuse[i])
    1033:	83 bc 9d f8 fb ff ff 	cmpl   $0x0,-0x408(%ebp,%ebx,4)
    103a:	00 
    103b:	74 ee                	je     102b <main+0x2b>
        {
            continue;
        }
        
        printf(1,"pid:%d   tickets:%d   ticks:%d\n",pstat1.pid[i],pstat1.tickets[i],pstat1.ticks[i]);
    103d:	83 ec 0c             	sub    $0xc,%esp
    1040:	ff b4 9d f8 fe ff ff 	push   -0x108(%ebp,%ebx,4)
    1047:	ff b4 9d f8 fc ff ff 	push   -0x308(%ebp,%ebx,4)
    104e:	ff b4 9d f8 fd ff ff 	push   -0x208(%ebp,%ebx,4)
    1055:	68 1c 16 00 00       	push   $0x161c
    105a:	6a 01                	push   $0x1
    105c:	e8 0e 03 00 00       	call   136f <printf>
    1061:	83 c4 20             	add    $0x20,%esp
    1064:	eb c5                	jmp    102b <main+0x2b>
    }
    exit();
    1066:	e8 9f 01 00 00       	call   120a <exit>

0000106b <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    106b:	55                   	push   %ebp
    106c:	89 e5                	mov    %esp,%ebp
    106e:	56                   	push   %esi
    106f:	53                   	push   %ebx
    1070:	8b 75 08             	mov    0x8(%ebp),%esi
    1073:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1076:	89 f0                	mov    %esi,%eax
    1078:	89 d1                	mov    %edx,%ecx
    107a:	83 c2 01             	add    $0x1,%edx
    107d:	89 c3                	mov    %eax,%ebx
    107f:	83 c0 01             	add    $0x1,%eax
    1082:	0f b6 09             	movzbl (%ecx),%ecx
    1085:	88 0b                	mov    %cl,(%ebx)
    1087:	84 c9                	test   %cl,%cl
    1089:	75 ed                	jne    1078 <strcpy+0xd>
    ;
  return os;
}
    108b:	89 f0                	mov    %esi,%eax
    108d:	5b                   	pop    %ebx
    108e:	5e                   	pop    %esi
    108f:	5d                   	pop    %ebp
    1090:	c3                   	ret    

00001091 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1091:	55                   	push   %ebp
    1092:	89 e5                	mov    %esp,%ebp
    1094:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1097:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    109a:	eb 06                	jmp    10a2 <strcmp+0x11>
    p++, q++;
    109c:	83 c1 01             	add    $0x1,%ecx
    109f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10a2:	0f b6 01             	movzbl (%ecx),%eax
    10a5:	84 c0                	test   %al,%al
    10a7:	74 04                	je     10ad <strcmp+0x1c>
    10a9:	3a 02                	cmp    (%edx),%al
    10ab:	74 ef                	je     109c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
    10ad:	0f b6 c0             	movzbl %al,%eax
    10b0:	0f b6 12             	movzbl (%edx),%edx
    10b3:	29 d0                	sub    %edx,%eax
}
    10b5:	5d                   	pop    %ebp
    10b6:	c3                   	ret    

000010b7 <strlen>:

uint
strlen(const char *s)
{
    10b7:	55                   	push   %ebp
    10b8:	89 e5                	mov    %esp,%ebp
    10ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10bd:	b8 00 00 00 00       	mov    $0x0,%eax
    10c2:	eb 03                	jmp    10c7 <strlen+0x10>
    10c4:	83 c0 01             	add    $0x1,%eax
    10c7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
    10cb:	75 f7                	jne    10c4 <strlen+0xd>
    ;
  return n;
}
    10cd:	5d                   	pop    %ebp
    10ce:	c3                   	ret    

000010cf <memset>:

void*
memset(void *dst, int c, uint n)
{
    10cf:	55                   	push   %ebp
    10d0:	89 e5                	mov    %esp,%ebp
    10d2:	57                   	push   %edi
    10d3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10d6:	89 d7                	mov    %edx,%edi
    10d8:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10db:	8b 45 0c             	mov    0xc(%ebp),%eax
    10de:	fc                   	cld    
    10df:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10e1:	89 d0                	mov    %edx,%eax
    10e3:	8b 7d fc             	mov    -0x4(%ebp),%edi
    10e6:	c9                   	leave  
    10e7:	c3                   	ret    

000010e8 <strchr>:

char*
strchr(const char *s, char c)
{
    10e8:	55                   	push   %ebp
    10e9:	89 e5                	mov    %esp,%ebp
    10eb:	8b 45 08             	mov    0x8(%ebp),%eax
    10ee:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    10f2:	eb 03                	jmp    10f7 <strchr+0xf>
    10f4:	83 c0 01             	add    $0x1,%eax
    10f7:	0f b6 10             	movzbl (%eax),%edx
    10fa:	84 d2                	test   %dl,%dl
    10fc:	74 06                	je     1104 <strchr+0x1c>
    if(*s == c)
    10fe:	38 ca                	cmp    %cl,%dl
    1100:	75 f2                	jne    10f4 <strchr+0xc>
    1102:	eb 05                	jmp    1109 <strchr+0x21>
      return (char*)s;
  return 0;
    1104:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1109:	5d                   	pop    %ebp
    110a:	c3                   	ret    

0000110b <gets>:

char*
gets(char *buf, int max)
{
    110b:	55                   	push   %ebp
    110c:	89 e5                	mov    %esp,%ebp
    110e:	57                   	push   %edi
    110f:	56                   	push   %esi
    1110:	53                   	push   %ebx
    1111:	83 ec 1c             	sub    $0x1c,%esp
    1114:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1117:	bb 00 00 00 00       	mov    $0x0,%ebx
    111c:	89 de                	mov    %ebx,%esi
    111e:	83 c3 01             	add    $0x1,%ebx
    1121:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1124:	7d 2e                	jge    1154 <gets+0x49>
    cc = read(0, &c, 1);
    1126:	83 ec 04             	sub    $0x4,%esp
    1129:	6a 01                	push   $0x1
    112b:	8d 45 e7             	lea    -0x19(%ebp),%eax
    112e:	50                   	push   %eax
    112f:	6a 00                	push   $0x0
    1131:	e8 ec 00 00 00       	call   1222 <read>
    if(cc < 1)
    1136:	83 c4 10             	add    $0x10,%esp
    1139:	85 c0                	test   %eax,%eax
    113b:	7e 17                	jle    1154 <gets+0x49>
      break;
    buf[i++] = c;
    113d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1141:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
    1144:	3c 0a                	cmp    $0xa,%al
    1146:	0f 94 c2             	sete   %dl
    1149:	3c 0d                	cmp    $0xd,%al
    114b:	0f 94 c0             	sete   %al
    114e:	08 c2                	or     %al,%dl
    1150:	74 ca                	je     111c <gets+0x11>
    buf[i++] = c;
    1152:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
    1154:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    1158:	89 f8                	mov    %edi,%eax
    115a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    115d:	5b                   	pop    %ebx
    115e:	5e                   	pop    %esi
    115f:	5f                   	pop    %edi
    1160:	5d                   	pop    %ebp
    1161:	c3                   	ret    

00001162 <stat>:

int
stat(const char *n, struct stat *st)
{
    1162:	55                   	push   %ebp
    1163:	89 e5                	mov    %esp,%ebp
    1165:	56                   	push   %esi
    1166:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1167:	83 ec 08             	sub    $0x8,%esp
    116a:	6a 00                	push   $0x0
    116c:	ff 75 08             	push   0x8(%ebp)
    116f:	e8 d6 00 00 00       	call   124a <open>
  if(fd < 0)
    1174:	83 c4 10             	add    $0x10,%esp
    1177:	85 c0                	test   %eax,%eax
    1179:	78 24                	js     119f <stat+0x3d>
    117b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    117d:	83 ec 08             	sub    $0x8,%esp
    1180:	ff 75 0c             	push   0xc(%ebp)
    1183:	50                   	push   %eax
    1184:	e8 d9 00 00 00       	call   1262 <fstat>
    1189:	89 c6                	mov    %eax,%esi
  close(fd);
    118b:	89 1c 24             	mov    %ebx,(%esp)
    118e:	e8 9f 00 00 00       	call   1232 <close>
  return r;
    1193:	83 c4 10             	add    $0x10,%esp
}
    1196:	89 f0                	mov    %esi,%eax
    1198:	8d 65 f8             	lea    -0x8(%ebp),%esp
    119b:	5b                   	pop    %ebx
    119c:	5e                   	pop    %esi
    119d:	5d                   	pop    %ebp
    119e:	c3                   	ret    
    return -1;
    119f:	be ff ff ff ff       	mov    $0xffffffff,%esi
    11a4:	eb f0                	jmp    1196 <stat+0x34>

000011a6 <atoi>:

int
atoi(const char *s)
{
    11a6:	55                   	push   %ebp
    11a7:	89 e5                	mov    %esp,%ebp
    11a9:	53                   	push   %ebx
    11aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
    11ad:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
    11b2:	eb 10                	jmp    11c4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
    11b4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
    11b7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
    11ba:	83 c1 01             	add    $0x1,%ecx
    11bd:	0f be c0             	movsbl %al,%eax
    11c0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
    11c4:	0f b6 01             	movzbl (%ecx),%eax
    11c7:	8d 58 d0             	lea    -0x30(%eax),%ebx
    11ca:	80 fb 09             	cmp    $0x9,%bl
    11cd:	76 e5                	jbe    11b4 <atoi+0xe>
  return n;
}
    11cf:	89 d0                	mov    %edx,%eax
    11d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11d4:	c9                   	leave  
    11d5:	c3                   	ret    

000011d6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    11d6:	55                   	push   %ebp
    11d7:	89 e5                	mov    %esp,%ebp
    11d9:	56                   	push   %esi
    11da:	53                   	push   %ebx
    11db:	8b 75 08             	mov    0x8(%ebp),%esi
    11de:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    11e1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
    11e4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
    11e6:	eb 0d                	jmp    11f5 <memmove+0x1f>
    *dst++ = *src++;
    11e8:	0f b6 01             	movzbl (%ecx),%eax
    11eb:	88 02                	mov    %al,(%edx)
    11ed:	8d 49 01             	lea    0x1(%ecx),%ecx
    11f0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
    11f3:	89 d8                	mov    %ebx,%eax
    11f5:	8d 58 ff             	lea    -0x1(%eax),%ebx
    11f8:	85 c0                	test   %eax,%eax
    11fa:	7f ec                	jg     11e8 <memmove+0x12>
  return vdst;
}
    11fc:	89 f0                	mov    %esi,%eax
    11fe:	5b                   	pop    %ebx
    11ff:	5e                   	pop    %esi
    1200:	5d                   	pop    %ebp
    1201:	c3                   	ret    

00001202 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1202:	b8 01 00 00 00       	mov    $0x1,%eax
    1207:	cd 40                	int    $0x40
    1209:	c3                   	ret    

0000120a <exit>:
SYSCALL(exit)
    120a:	b8 02 00 00 00       	mov    $0x2,%eax
    120f:	cd 40                	int    $0x40
    1211:	c3                   	ret    

00001212 <wait>:
SYSCALL(wait)
    1212:	b8 03 00 00 00       	mov    $0x3,%eax
    1217:	cd 40                	int    $0x40
    1219:	c3                   	ret    

0000121a <pipe>:
SYSCALL(pipe)
    121a:	b8 04 00 00 00       	mov    $0x4,%eax
    121f:	cd 40                	int    $0x40
    1221:	c3                   	ret    

00001222 <read>:
SYSCALL(read)
    1222:	b8 05 00 00 00       	mov    $0x5,%eax
    1227:	cd 40                	int    $0x40
    1229:	c3                   	ret    

0000122a <write>:
SYSCALL(write)
    122a:	b8 10 00 00 00       	mov    $0x10,%eax
    122f:	cd 40                	int    $0x40
    1231:	c3                   	ret    

00001232 <close>:
SYSCALL(close)
    1232:	b8 15 00 00 00       	mov    $0x15,%eax
    1237:	cd 40                	int    $0x40
    1239:	c3                   	ret    

0000123a <kill>:
SYSCALL(kill)
    123a:	b8 06 00 00 00       	mov    $0x6,%eax
    123f:	cd 40                	int    $0x40
    1241:	c3                   	ret    

00001242 <exec>:
SYSCALL(exec)
    1242:	b8 07 00 00 00       	mov    $0x7,%eax
    1247:	cd 40                	int    $0x40
    1249:	c3                   	ret    

0000124a <open>:
SYSCALL(open)
    124a:	b8 0f 00 00 00       	mov    $0xf,%eax
    124f:	cd 40                	int    $0x40
    1251:	c3                   	ret    

00001252 <mknod>:
SYSCALL(mknod)
    1252:	b8 11 00 00 00       	mov    $0x11,%eax
    1257:	cd 40                	int    $0x40
    1259:	c3                   	ret    

0000125a <unlink>:
SYSCALL(unlink)
    125a:	b8 12 00 00 00       	mov    $0x12,%eax
    125f:	cd 40                	int    $0x40
    1261:	c3                   	ret    

00001262 <fstat>:
SYSCALL(fstat)
    1262:	b8 08 00 00 00       	mov    $0x8,%eax
    1267:	cd 40                	int    $0x40
    1269:	c3                   	ret    

0000126a <link>:
SYSCALL(link)
    126a:	b8 13 00 00 00       	mov    $0x13,%eax
    126f:	cd 40                	int    $0x40
    1271:	c3                   	ret    

00001272 <mkdir>:
SYSCALL(mkdir)
    1272:	b8 14 00 00 00       	mov    $0x14,%eax
    1277:	cd 40                	int    $0x40
    1279:	c3                   	ret    

0000127a <chdir>:
SYSCALL(chdir)
    127a:	b8 09 00 00 00       	mov    $0x9,%eax
    127f:	cd 40                	int    $0x40
    1281:	c3                   	ret    

00001282 <dup>:
SYSCALL(dup)
    1282:	b8 0a 00 00 00       	mov    $0xa,%eax
    1287:	cd 40                	int    $0x40
    1289:	c3                   	ret    

0000128a <getpid>:
SYSCALL(getpid)
    128a:	b8 0b 00 00 00       	mov    $0xb,%eax
    128f:	cd 40                	int    $0x40
    1291:	c3                   	ret    

00001292 <sbrk>:
SYSCALL(sbrk)
    1292:	b8 0c 00 00 00       	mov    $0xc,%eax
    1297:	cd 40                	int    $0x40
    1299:	c3                   	ret    

0000129a <sleep>:
SYSCALL(sleep)
    129a:	b8 0d 00 00 00       	mov    $0xd,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <uptime>:
SYSCALL(uptime)
    12a2:	b8 0e 00 00 00       	mov    $0xe,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <settickets>:
SYSCALL(settickets)
    12aa:	b8 16 00 00 00       	mov    $0x16,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <getpinfo>:
SYSCALL(getpinfo)
    12b2:	b8 17 00 00 00       	mov    $0x17,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <mprotect>:
SYSCALL(mprotect)
    12ba:	b8 18 00 00 00       	mov    $0x18,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <munprotect>:
SYSCALL(munprotect)
    12c2:	b8 19 00 00 00       	mov    $0x19,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    12ca:	55                   	push   %ebp
    12cb:	89 e5                	mov    %esp,%ebp
    12cd:	83 ec 1c             	sub    $0x1c,%esp
    12d0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    12d3:	6a 01                	push   $0x1
    12d5:	8d 55 f4             	lea    -0xc(%ebp),%edx
    12d8:	52                   	push   %edx
    12d9:	50                   	push   %eax
    12da:	e8 4b ff ff ff       	call   122a <write>
}
    12df:	83 c4 10             	add    $0x10,%esp
    12e2:	c9                   	leave  
    12e3:	c3                   	ret    

000012e4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    12e4:	55                   	push   %ebp
    12e5:	89 e5                	mov    %esp,%ebp
    12e7:	57                   	push   %edi
    12e8:	56                   	push   %esi
    12e9:	53                   	push   %ebx
    12ea:	83 ec 2c             	sub    $0x2c,%esp
    12ed:	89 45 d0             	mov    %eax,-0x30(%ebp)
    12f0:	89 d0                	mov    %edx,%eax
    12f2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    12f4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    12f8:	0f 95 c1             	setne  %cl
    12fb:	c1 ea 1f             	shr    $0x1f,%edx
    12fe:	84 d1                	test   %dl,%cl
    1300:	74 44                	je     1346 <printint+0x62>
    neg = 1;
    x = -xx;
    1302:	f7 d8                	neg    %eax
    1304:	89 c1                	mov    %eax,%ecx
    neg = 1;
    1306:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    130d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
    1312:	89 c8                	mov    %ecx,%eax
    1314:	ba 00 00 00 00       	mov    $0x0,%edx
    1319:	f7 f6                	div    %esi
    131b:	89 df                	mov    %ebx,%edi
    131d:	83 c3 01             	add    $0x1,%ebx
    1320:	0f b6 92 9c 16 00 00 	movzbl 0x169c(%edx),%edx
    1327:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
    132b:	89 ca                	mov    %ecx,%edx
    132d:	89 c1                	mov    %eax,%ecx
    132f:	39 d6                	cmp    %edx,%esi
    1331:	76 df                	jbe    1312 <printint+0x2e>
  if(neg)
    1333:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    1337:	74 31                	je     136a <printint+0x86>
    buf[i++] = '-';
    1339:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    133e:	8d 5f 02             	lea    0x2(%edi),%ebx
    1341:	8b 75 d0             	mov    -0x30(%ebp),%esi
    1344:	eb 17                	jmp    135d <printint+0x79>
    x = xx;
    1346:	89 c1                	mov    %eax,%ecx
  neg = 0;
    1348:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    134f:	eb bc                	jmp    130d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
    1351:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    1356:	89 f0                	mov    %esi,%eax
    1358:	e8 6d ff ff ff       	call   12ca <putc>
  while(--i >= 0)
    135d:	83 eb 01             	sub    $0x1,%ebx
    1360:	79 ef                	jns    1351 <printint+0x6d>
}
    1362:	83 c4 2c             	add    $0x2c,%esp
    1365:	5b                   	pop    %ebx
    1366:	5e                   	pop    %esi
    1367:	5f                   	pop    %edi
    1368:	5d                   	pop    %ebp
    1369:	c3                   	ret    
    136a:	8b 75 d0             	mov    -0x30(%ebp),%esi
    136d:	eb ee                	jmp    135d <printint+0x79>

0000136f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    136f:	55                   	push   %ebp
    1370:	89 e5                	mov    %esp,%ebp
    1372:	57                   	push   %edi
    1373:	56                   	push   %esi
    1374:	53                   	push   %ebx
    1375:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    1378:	8d 45 10             	lea    0x10(%ebp),%eax
    137b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
    137e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
    1383:	bb 00 00 00 00       	mov    $0x0,%ebx
    1388:	eb 14                	jmp    139e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    138a:	89 fa                	mov    %edi,%edx
    138c:	8b 45 08             	mov    0x8(%ebp),%eax
    138f:	e8 36 ff ff ff       	call   12ca <putc>
    1394:	eb 05                	jmp    139b <printf+0x2c>
      }
    } else if(state == '%'){
    1396:	83 fe 25             	cmp    $0x25,%esi
    1399:	74 25                	je     13c0 <printf+0x51>
  for(i = 0; fmt[i]; i++){
    139b:	83 c3 01             	add    $0x1,%ebx
    139e:	8b 45 0c             	mov    0xc(%ebp),%eax
    13a1:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
    13a5:	84 c0                	test   %al,%al
    13a7:	0f 84 20 01 00 00    	je     14cd <printf+0x15e>
    c = fmt[i] & 0xff;
    13ad:	0f be f8             	movsbl %al,%edi
    13b0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    13b3:	85 f6                	test   %esi,%esi
    13b5:	75 df                	jne    1396 <printf+0x27>
      if(c == '%'){
    13b7:	83 f8 25             	cmp    $0x25,%eax
    13ba:	75 ce                	jne    138a <printf+0x1b>
        state = '%';
    13bc:	89 c6                	mov    %eax,%esi
    13be:	eb db                	jmp    139b <printf+0x2c>
      if(c == 'd'){
    13c0:	83 f8 25             	cmp    $0x25,%eax
    13c3:	0f 84 cf 00 00 00    	je     1498 <printf+0x129>
    13c9:	0f 8c dd 00 00 00    	jl     14ac <printf+0x13d>
    13cf:	83 f8 78             	cmp    $0x78,%eax
    13d2:	0f 8f d4 00 00 00    	jg     14ac <printf+0x13d>
    13d8:	83 f8 63             	cmp    $0x63,%eax
    13db:	0f 8c cb 00 00 00    	jl     14ac <printf+0x13d>
    13e1:	83 e8 63             	sub    $0x63,%eax
    13e4:	83 f8 15             	cmp    $0x15,%eax
    13e7:	0f 87 bf 00 00 00    	ja     14ac <printf+0x13d>
    13ed:	ff 24 85 44 16 00 00 	jmp    *0x1644(,%eax,4)
        printint(fd, *ap, 10, 1);
    13f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    13f7:	8b 17                	mov    (%edi),%edx
    13f9:	83 ec 0c             	sub    $0xc,%esp
    13fc:	6a 01                	push   $0x1
    13fe:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1403:	8b 45 08             	mov    0x8(%ebp),%eax
    1406:	e8 d9 fe ff ff       	call   12e4 <printint>
        ap++;
    140b:	83 c7 04             	add    $0x4,%edi
    140e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    1411:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1414:	be 00 00 00 00       	mov    $0x0,%esi
    1419:	eb 80                	jmp    139b <printf+0x2c>
        printint(fd, *ap, 16, 0);
    141b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    141e:	8b 17                	mov    (%edi),%edx
    1420:	83 ec 0c             	sub    $0xc,%esp
    1423:	6a 00                	push   $0x0
    1425:	b9 10 00 00 00       	mov    $0x10,%ecx
    142a:	8b 45 08             	mov    0x8(%ebp),%eax
    142d:	e8 b2 fe ff ff       	call   12e4 <printint>
        ap++;
    1432:	83 c7 04             	add    $0x4,%edi
    1435:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    1438:	83 c4 10             	add    $0x10,%esp
      state = 0;
    143b:	be 00 00 00 00       	mov    $0x0,%esi
    1440:	e9 56 ff ff ff       	jmp    139b <printf+0x2c>
        s = (char*)*ap;
    1445:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1448:	8b 30                	mov    (%eax),%esi
        ap++;
    144a:	83 c0 04             	add    $0x4,%eax
    144d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
    1450:	85 f6                	test   %esi,%esi
    1452:	75 15                	jne    1469 <printf+0xfa>
          s = "(null)";
    1454:	be 3c 16 00 00       	mov    $0x163c,%esi
    1459:	eb 0e                	jmp    1469 <printf+0xfa>
          putc(fd, *s);
    145b:	0f be d2             	movsbl %dl,%edx
    145e:	8b 45 08             	mov    0x8(%ebp),%eax
    1461:	e8 64 fe ff ff       	call   12ca <putc>
          s++;
    1466:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
    1469:	0f b6 16             	movzbl (%esi),%edx
    146c:	84 d2                	test   %dl,%dl
    146e:	75 eb                	jne    145b <printf+0xec>
      state = 0;
    1470:	be 00 00 00 00       	mov    $0x0,%esi
    1475:	e9 21 ff ff ff       	jmp    139b <printf+0x2c>
        putc(fd, *ap);
    147a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    147d:	0f be 17             	movsbl (%edi),%edx
    1480:	8b 45 08             	mov    0x8(%ebp),%eax
    1483:	e8 42 fe ff ff       	call   12ca <putc>
        ap++;
    1488:	83 c7 04             	add    $0x4,%edi
    148b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
    148e:	be 00 00 00 00       	mov    $0x0,%esi
    1493:	e9 03 ff ff ff       	jmp    139b <printf+0x2c>
        putc(fd, c);
    1498:	89 fa                	mov    %edi,%edx
    149a:	8b 45 08             	mov    0x8(%ebp),%eax
    149d:	e8 28 fe ff ff       	call   12ca <putc>
      state = 0;
    14a2:	be 00 00 00 00       	mov    $0x0,%esi
    14a7:	e9 ef fe ff ff       	jmp    139b <printf+0x2c>
        putc(fd, '%');
    14ac:	ba 25 00 00 00       	mov    $0x25,%edx
    14b1:	8b 45 08             	mov    0x8(%ebp),%eax
    14b4:	e8 11 fe ff ff       	call   12ca <putc>
        putc(fd, c);
    14b9:	89 fa                	mov    %edi,%edx
    14bb:	8b 45 08             	mov    0x8(%ebp),%eax
    14be:	e8 07 fe ff ff       	call   12ca <putc>
      state = 0;
    14c3:	be 00 00 00 00       	mov    $0x0,%esi
    14c8:	e9 ce fe ff ff       	jmp    139b <printf+0x2c>
    }
  }
}
    14cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14d0:	5b                   	pop    %ebx
    14d1:	5e                   	pop    %esi
    14d2:	5f                   	pop    %edi
    14d3:	5d                   	pop    %ebp
    14d4:	c3                   	ret    

000014d5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    14d5:	55                   	push   %ebp
    14d6:	89 e5                	mov    %esp,%ebp
    14d8:	57                   	push   %edi
    14d9:	56                   	push   %esi
    14da:	53                   	push   %ebx
    14db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    14de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14e1:	a1 40 19 00 00       	mov    0x1940,%eax
    14e6:	eb 02                	jmp    14ea <free+0x15>
    14e8:	89 d0                	mov    %edx,%eax
    14ea:	39 c8                	cmp    %ecx,%eax
    14ec:	73 04                	jae    14f2 <free+0x1d>
    14ee:	39 08                	cmp    %ecx,(%eax)
    14f0:	77 12                	ja     1504 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14f2:	8b 10                	mov    (%eax),%edx
    14f4:	39 c2                	cmp    %eax,%edx
    14f6:	77 f0                	ja     14e8 <free+0x13>
    14f8:	39 c8                	cmp    %ecx,%eax
    14fa:	72 08                	jb     1504 <free+0x2f>
    14fc:	39 ca                	cmp    %ecx,%edx
    14fe:	77 04                	ja     1504 <free+0x2f>
    1500:	89 d0                	mov    %edx,%eax
    1502:	eb e6                	jmp    14ea <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1504:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1507:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    150a:	8b 10                	mov    (%eax),%edx
    150c:	39 d7                	cmp    %edx,%edi
    150e:	74 19                	je     1529 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1510:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1513:	8b 50 04             	mov    0x4(%eax),%edx
    1516:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1519:	39 ce                	cmp    %ecx,%esi
    151b:	74 1b                	je     1538 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    151d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    151f:	a3 40 19 00 00       	mov    %eax,0x1940
}
    1524:	5b                   	pop    %ebx
    1525:	5e                   	pop    %esi
    1526:	5f                   	pop    %edi
    1527:	5d                   	pop    %ebp
    1528:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    1529:	03 72 04             	add    0x4(%edx),%esi
    152c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    152f:	8b 10                	mov    (%eax),%edx
    1531:	8b 12                	mov    (%edx),%edx
    1533:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1536:	eb db                	jmp    1513 <free+0x3e>
    p->s.size += bp->s.size;
    1538:	03 53 fc             	add    -0x4(%ebx),%edx
    153b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    153e:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1541:	89 10                	mov    %edx,(%eax)
    1543:	eb da                	jmp    151f <free+0x4a>

00001545 <morecore>:

static Header*
morecore(uint nu)
{
    1545:	55                   	push   %ebp
    1546:	89 e5                	mov    %esp,%ebp
    1548:	53                   	push   %ebx
    1549:	83 ec 04             	sub    $0x4,%esp
    154c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    154e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    1553:	77 05                	ja     155a <morecore+0x15>
    nu = 4096;
    1555:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    155a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1561:	83 ec 0c             	sub    $0xc,%esp
    1564:	50                   	push   %eax
    1565:	e8 28 fd ff ff       	call   1292 <sbrk>
  if(p == (char*)-1)
    156a:	83 c4 10             	add    $0x10,%esp
    156d:	83 f8 ff             	cmp    $0xffffffff,%eax
    1570:	74 1c                	je     158e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1572:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1575:	83 c0 08             	add    $0x8,%eax
    1578:	83 ec 0c             	sub    $0xc,%esp
    157b:	50                   	push   %eax
    157c:	e8 54 ff ff ff       	call   14d5 <free>
  return freep;
    1581:	a1 40 19 00 00       	mov    0x1940,%eax
    1586:	83 c4 10             	add    $0x10,%esp
}
    1589:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    158c:	c9                   	leave  
    158d:	c3                   	ret    
    return 0;
    158e:	b8 00 00 00 00       	mov    $0x0,%eax
    1593:	eb f4                	jmp    1589 <morecore+0x44>

00001595 <malloc>:

void*
malloc(uint nbytes)
{
    1595:	55                   	push   %ebp
    1596:	89 e5                	mov    %esp,%ebp
    1598:	53                   	push   %ebx
    1599:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    159c:	8b 45 08             	mov    0x8(%ebp),%eax
    159f:	8d 58 07             	lea    0x7(%eax),%ebx
    15a2:	c1 eb 03             	shr    $0x3,%ebx
    15a5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    15a8:	8b 0d 40 19 00 00    	mov    0x1940,%ecx
    15ae:	85 c9                	test   %ecx,%ecx
    15b0:	74 04                	je     15b6 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15b2:	8b 01                	mov    (%ecx),%eax
    15b4:	eb 4a                	jmp    1600 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
    15b6:	c7 05 40 19 00 00 44 	movl   $0x1944,0x1940
    15bd:	19 00 00 
    15c0:	c7 05 44 19 00 00 44 	movl   $0x1944,0x1944
    15c7:	19 00 00 
    base.s.size = 0;
    15ca:	c7 05 48 19 00 00 00 	movl   $0x0,0x1948
    15d1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    15d4:	b9 44 19 00 00       	mov    $0x1944,%ecx
    15d9:	eb d7                	jmp    15b2 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    15db:	74 19                	je     15f6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    15dd:	29 da                	sub    %ebx,%edx
    15df:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    15e2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    15e5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    15e8:	89 0d 40 19 00 00    	mov    %ecx,0x1940
      return (void*)(p + 1);
    15ee:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    15f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    15f4:	c9                   	leave  
    15f5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    15f6:	8b 10                	mov    (%eax),%edx
    15f8:	89 11                	mov    %edx,(%ecx)
    15fa:	eb ec                	jmp    15e8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15fc:	89 c1                	mov    %eax,%ecx
    15fe:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    1600:	8b 50 04             	mov    0x4(%eax),%edx
    1603:	39 da                	cmp    %ebx,%edx
    1605:	73 d4                	jae    15db <malloc+0x46>
    if(p == freep)
    1607:	39 05 40 19 00 00    	cmp    %eax,0x1940
    160d:	75 ed                	jne    15fc <malloc+0x67>
      if((p = morecore(nunits)) == 0)
    160f:	89 d8                	mov    %ebx,%eax
    1611:	e8 2f ff ff ff       	call   1545 <morecore>
    1616:	85 c0                	test   %eax,%eax
    1618:	75 e2                	jne    15fc <malloc+0x67>
    161a:	eb d5                	jmp    15f1 <malloc+0x5c>
