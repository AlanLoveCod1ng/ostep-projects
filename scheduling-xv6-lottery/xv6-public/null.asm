
_null:     file format elf32-i386


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
    100d:	51                   	push   %ecx
    100e:	83 ec 08             	sub    $0x8,%esp
    int *a = 0;
    int b = *a;
    printf(1,"%d",b);
    1011:	ff 35 00 00 00 00    	push   0x0
    1017:	68 dc 15 00 00       	push   $0x15dc
    101c:	6a 01                	push   $0x1
    101e:	e8 09 03 00 00       	call   132c <printf>
    int c = b;
    b = c;
    exit();
    1023:	e8 9f 01 00 00       	call   11c7 <exit>

00001028 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1028:	55                   	push   %ebp
    1029:	89 e5                	mov    %esp,%ebp
    102b:	56                   	push   %esi
    102c:	53                   	push   %ebx
    102d:	8b 75 08             	mov    0x8(%ebp),%esi
    1030:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1033:	89 f0                	mov    %esi,%eax
    1035:	89 d1                	mov    %edx,%ecx
    1037:	83 c2 01             	add    $0x1,%edx
    103a:	89 c3                	mov    %eax,%ebx
    103c:	83 c0 01             	add    $0x1,%eax
    103f:	0f b6 09             	movzbl (%ecx),%ecx
    1042:	88 0b                	mov    %cl,(%ebx)
    1044:	84 c9                	test   %cl,%cl
    1046:	75 ed                	jne    1035 <strcpy+0xd>
    ;
  return os;
}
    1048:	89 f0                	mov    %esi,%eax
    104a:	5b                   	pop    %ebx
    104b:	5e                   	pop    %esi
    104c:	5d                   	pop    %ebp
    104d:	c3                   	ret    

0000104e <strcmp>:

int
strcmp(const char *p, const char *q)
{
    104e:	55                   	push   %ebp
    104f:	89 e5                	mov    %esp,%ebp
    1051:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1054:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    1057:	eb 06                	jmp    105f <strcmp+0x11>
    p++, q++;
    1059:	83 c1 01             	add    $0x1,%ecx
    105c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    105f:	0f b6 01             	movzbl (%ecx),%eax
    1062:	84 c0                	test   %al,%al
    1064:	74 04                	je     106a <strcmp+0x1c>
    1066:	3a 02                	cmp    (%edx),%al
    1068:	74 ef                	je     1059 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
    106a:	0f b6 c0             	movzbl %al,%eax
    106d:	0f b6 12             	movzbl (%edx),%edx
    1070:	29 d0                	sub    %edx,%eax
}
    1072:	5d                   	pop    %ebp
    1073:	c3                   	ret    

00001074 <strlen>:

uint
strlen(const char *s)
{
    1074:	55                   	push   %ebp
    1075:	89 e5                	mov    %esp,%ebp
    1077:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    107a:	b8 00 00 00 00       	mov    $0x0,%eax
    107f:	eb 03                	jmp    1084 <strlen+0x10>
    1081:	83 c0 01             	add    $0x1,%eax
    1084:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
    1088:	75 f7                	jne    1081 <strlen+0xd>
    ;
  return n;
}
    108a:	5d                   	pop    %ebp
    108b:	c3                   	ret    

0000108c <memset>:

void*
memset(void *dst, int c, uint n)
{
    108c:	55                   	push   %ebp
    108d:	89 e5                	mov    %esp,%ebp
    108f:	57                   	push   %edi
    1090:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1093:	89 d7                	mov    %edx,%edi
    1095:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1098:	8b 45 0c             	mov    0xc(%ebp),%eax
    109b:	fc                   	cld    
    109c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    109e:	89 d0                	mov    %edx,%eax
    10a0:	8b 7d fc             	mov    -0x4(%ebp),%edi
    10a3:	c9                   	leave  
    10a4:	c3                   	ret    

000010a5 <strchr>:

char*
strchr(const char *s, char c)
{
    10a5:	55                   	push   %ebp
    10a6:	89 e5                	mov    %esp,%ebp
    10a8:	8b 45 08             	mov    0x8(%ebp),%eax
    10ab:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    10af:	eb 03                	jmp    10b4 <strchr+0xf>
    10b1:	83 c0 01             	add    $0x1,%eax
    10b4:	0f b6 10             	movzbl (%eax),%edx
    10b7:	84 d2                	test   %dl,%dl
    10b9:	74 06                	je     10c1 <strchr+0x1c>
    if(*s == c)
    10bb:	38 ca                	cmp    %cl,%dl
    10bd:	75 f2                	jne    10b1 <strchr+0xc>
    10bf:	eb 05                	jmp    10c6 <strchr+0x21>
      return (char*)s;
  return 0;
    10c1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    10c6:	5d                   	pop    %ebp
    10c7:	c3                   	ret    

000010c8 <gets>:

char*
gets(char *buf, int max)
{
    10c8:	55                   	push   %ebp
    10c9:	89 e5                	mov    %esp,%ebp
    10cb:	57                   	push   %edi
    10cc:	56                   	push   %esi
    10cd:	53                   	push   %ebx
    10ce:	83 ec 1c             	sub    $0x1c,%esp
    10d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    10d4:	bb 00 00 00 00       	mov    $0x0,%ebx
    10d9:	89 de                	mov    %ebx,%esi
    10db:	83 c3 01             	add    $0x1,%ebx
    10de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    10e1:	7d 2e                	jge    1111 <gets+0x49>
    cc = read(0, &c, 1);
    10e3:	83 ec 04             	sub    $0x4,%esp
    10e6:	6a 01                	push   $0x1
    10e8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    10eb:	50                   	push   %eax
    10ec:	6a 00                	push   $0x0
    10ee:	e8 ec 00 00 00       	call   11df <read>
    if(cc < 1)
    10f3:	83 c4 10             	add    $0x10,%esp
    10f6:	85 c0                	test   %eax,%eax
    10f8:	7e 17                	jle    1111 <gets+0x49>
      break;
    buf[i++] = c;
    10fa:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    10fe:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
    1101:	3c 0a                	cmp    $0xa,%al
    1103:	0f 94 c2             	sete   %dl
    1106:	3c 0d                	cmp    $0xd,%al
    1108:	0f 94 c0             	sete   %al
    110b:	08 c2                	or     %al,%dl
    110d:	74 ca                	je     10d9 <gets+0x11>
    buf[i++] = c;
    110f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
    1111:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    1115:	89 f8                	mov    %edi,%eax
    1117:	8d 65 f4             	lea    -0xc(%ebp),%esp
    111a:	5b                   	pop    %ebx
    111b:	5e                   	pop    %esi
    111c:	5f                   	pop    %edi
    111d:	5d                   	pop    %ebp
    111e:	c3                   	ret    

0000111f <stat>:

int
stat(const char *n, struct stat *st)
{
    111f:	55                   	push   %ebp
    1120:	89 e5                	mov    %esp,%ebp
    1122:	56                   	push   %esi
    1123:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1124:	83 ec 08             	sub    $0x8,%esp
    1127:	6a 00                	push   $0x0
    1129:	ff 75 08             	push   0x8(%ebp)
    112c:	e8 d6 00 00 00       	call   1207 <open>
  if(fd < 0)
    1131:	83 c4 10             	add    $0x10,%esp
    1134:	85 c0                	test   %eax,%eax
    1136:	78 24                	js     115c <stat+0x3d>
    1138:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    113a:	83 ec 08             	sub    $0x8,%esp
    113d:	ff 75 0c             	push   0xc(%ebp)
    1140:	50                   	push   %eax
    1141:	e8 d9 00 00 00       	call   121f <fstat>
    1146:	89 c6                	mov    %eax,%esi
  close(fd);
    1148:	89 1c 24             	mov    %ebx,(%esp)
    114b:	e8 9f 00 00 00       	call   11ef <close>
  return r;
    1150:	83 c4 10             	add    $0x10,%esp
}
    1153:	89 f0                	mov    %esi,%eax
    1155:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1158:	5b                   	pop    %ebx
    1159:	5e                   	pop    %esi
    115a:	5d                   	pop    %ebp
    115b:	c3                   	ret    
    return -1;
    115c:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1161:	eb f0                	jmp    1153 <stat+0x34>

00001163 <atoi>:

int
atoi(const char *s)
{
    1163:	55                   	push   %ebp
    1164:	89 e5                	mov    %esp,%ebp
    1166:	53                   	push   %ebx
    1167:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
    116a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
    116f:	eb 10                	jmp    1181 <atoi+0x1e>
    n = n*10 + *s++ - '0';
    1171:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
    1174:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
    1177:	83 c1 01             	add    $0x1,%ecx
    117a:	0f be c0             	movsbl %al,%eax
    117d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
    1181:	0f b6 01             	movzbl (%ecx),%eax
    1184:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1187:	80 fb 09             	cmp    $0x9,%bl
    118a:	76 e5                	jbe    1171 <atoi+0xe>
  return n;
}
    118c:	89 d0                	mov    %edx,%eax
    118e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1191:	c9                   	leave  
    1192:	c3                   	ret    

00001193 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1193:	55                   	push   %ebp
    1194:	89 e5                	mov    %esp,%ebp
    1196:	56                   	push   %esi
    1197:	53                   	push   %ebx
    1198:	8b 75 08             	mov    0x8(%ebp),%esi
    119b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    119e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
    11a1:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
    11a3:	eb 0d                	jmp    11b2 <memmove+0x1f>
    *dst++ = *src++;
    11a5:	0f b6 01             	movzbl (%ecx),%eax
    11a8:	88 02                	mov    %al,(%edx)
    11aa:	8d 49 01             	lea    0x1(%ecx),%ecx
    11ad:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
    11b0:	89 d8                	mov    %ebx,%eax
    11b2:	8d 58 ff             	lea    -0x1(%eax),%ebx
    11b5:	85 c0                	test   %eax,%eax
    11b7:	7f ec                	jg     11a5 <memmove+0x12>
  return vdst;
}
    11b9:	89 f0                	mov    %esi,%eax
    11bb:	5b                   	pop    %ebx
    11bc:	5e                   	pop    %esi
    11bd:	5d                   	pop    %ebp
    11be:	c3                   	ret    

000011bf <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    11bf:	b8 01 00 00 00       	mov    $0x1,%eax
    11c4:	cd 40                	int    $0x40
    11c6:	c3                   	ret    

000011c7 <exit>:
SYSCALL(exit)
    11c7:	b8 02 00 00 00       	mov    $0x2,%eax
    11cc:	cd 40                	int    $0x40
    11ce:	c3                   	ret    

000011cf <wait>:
SYSCALL(wait)
    11cf:	b8 03 00 00 00       	mov    $0x3,%eax
    11d4:	cd 40                	int    $0x40
    11d6:	c3                   	ret    

000011d7 <pipe>:
SYSCALL(pipe)
    11d7:	b8 04 00 00 00       	mov    $0x4,%eax
    11dc:	cd 40                	int    $0x40
    11de:	c3                   	ret    

000011df <read>:
SYSCALL(read)
    11df:	b8 05 00 00 00       	mov    $0x5,%eax
    11e4:	cd 40                	int    $0x40
    11e6:	c3                   	ret    

000011e7 <write>:
SYSCALL(write)
    11e7:	b8 10 00 00 00       	mov    $0x10,%eax
    11ec:	cd 40                	int    $0x40
    11ee:	c3                   	ret    

000011ef <close>:
SYSCALL(close)
    11ef:	b8 15 00 00 00       	mov    $0x15,%eax
    11f4:	cd 40                	int    $0x40
    11f6:	c3                   	ret    

000011f7 <kill>:
SYSCALL(kill)
    11f7:	b8 06 00 00 00       	mov    $0x6,%eax
    11fc:	cd 40                	int    $0x40
    11fe:	c3                   	ret    

000011ff <exec>:
SYSCALL(exec)
    11ff:	b8 07 00 00 00       	mov    $0x7,%eax
    1204:	cd 40                	int    $0x40
    1206:	c3                   	ret    

00001207 <open>:
SYSCALL(open)
    1207:	b8 0f 00 00 00       	mov    $0xf,%eax
    120c:	cd 40                	int    $0x40
    120e:	c3                   	ret    

0000120f <mknod>:
SYSCALL(mknod)
    120f:	b8 11 00 00 00       	mov    $0x11,%eax
    1214:	cd 40                	int    $0x40
    1216:	c3                   	ret    

00001217 <unlink>:
SYSCALL(unlink)
    1217:	b8 12 00 00 00       	mov    $0x12,%eax
    121c:	cd 40                	int    $0x40
    121e:	c3                   	ret    

0000121f <fstat>:
SYSCALL(fstat)
    121f:	b8 08 00 00 00       	mov    $0x8,%eax
    1224:	cd 40                	int    $0x40
    1226:	c3                   	ret    

00001227 <link>:
SYSCALL(link)
    1227:	b8 13 00 00 00       	mov    $0x13,%eax
    122c:	cd 40                	int    $0x40
    122e:	c3                   	ret    

0000122f <mkdir>:
SYSCALL(mkdir)
    122f:	b8 14 00 00 00       	mov    $0x14,%eax
    1234:	cd 40                	int    $0x40
    1236:	c3                   	ret    

00001237 <chdir>:
SYSCALL(chdir)
    1237:	b8 09 00 00 00       	mov    $0x9,%eax
    123c:	cd 40                	int    $0x40
    123e:	c3                   	ret    

0000123f <dup>:
SYSCALL(dup)
    123f:	b8 0a 00 00 00       	mov    $0xa,%eax
    1244:	cd 40                	int    $0x40
    1246:	c3                   	ret    

00001247 <getpid>:
SYSCALL(getpid)
    1247:	b8 0b 00 00 00       	mov    $0xb,%eax
    124c:	cd 40                	int    $0x40
    124e:	c3                   	ret    

0000124f <sbrk>:
SYSCALL(sbrk)
    124f:	b8 0c 00 00 00       	mov    $0xc,%eax
    1254:	cd 40                	int    $0x40
    1256:	c3                   	ret    

00001257 <sleep>:
SYSCALL(sleep)
    1257:	b8 0d 00 00 00       	mov    $0xd,%eax
    125c:	cd 40                	int    $0x40
    125e:	c3                   	ret    

0000125f <uptime>:
SYSCALL(uptime)
    125f:	b8 0e 00 00 00       	mov    $0xe,%eax
    1264:	cd 40                	int    $0x40
    1266:	c3                   	ret    

00001267 <settickets>:
SYSCALL(settickets)
    1267:	b8 16 00 00 00       	mov    $0x16,%eax
    126c:	cd 40                	int    $0x40
    126e:	c3                   	ret    

0000126f <getpinfo>:
SYSCALL(getpinfo)
    126f:	b8 17 00 00 00       	mov    $0x17,%eax
    1274:	cd 40                	int    $0x40
    1276:	c3                   	ret    

00001277 <mprotect>:
SYSCALL(mprotect)
    1277:	b8 18 00 00 00       	mov    $0x18,%eax
    127c:	cd 40                	int    $0x40
    127e:	c3                   	ret    

0000127f <munprotect>:
SYSCALL(munprotect)
    127f:	b8 19 00 00 00       	mov    $0x19,%eax
    1284:	cd 40                	int    $0x40
    1286:	c3                   	ret    

00001287 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1287:	55                   	push   %ebp
    1288:	89 e5                	mov    %esp,%ebp
    128a:	83 ec 1c             	sub    $0x1c,%esp
    128d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    1290:	6a 01                	push   $0x1
    1292:	8d 55 f4             	lea    -0xc(%ebp),%edx
    1295:	52                   	push   %edx
    1296:	50                   	push   %eax
    1297:	e8 4b ff ff ff       	call   11e7 <write>
}
    129c:	83 c4 10             	add    $0x10,%esp
    129f:	c9                   	leave  
    12a0:	c3                   	ret    

000012a1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    12a1:	55                   	push   %ebp
    12a2:	89 e5                	mov    %esp,%ebp
    12a4:	57                   	push   %edi
    12a5:	56                   	push   %esi
    12a6:	53                   	push   %ebx
    12a7:	83 ec 2c             	sub    $0x2c,%esp
    12aa:	89 45 d0             	mov    %eax,-0x30(%ebp)
    12ad:	89 d0                	mov    %edx,%eax
    12af:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    12b1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    12b5:	0f 95 c1             	setne  %cl
    12b8:	c1 ea 1f             	shr    $0x1f,%edx
    12bb:	84 d1                	test   %dl,%cl
    12bd:	74 44                	je     1303 <printint+0x62>
    neg = 1;
    x = -xx;
    12bf:	f7 d8                	neg    %eax
    12c1:	89 c1                	mov    %eax,%ecx
    neg = 1;
    12c3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    12ca:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
    12cf:	89 c8                	mov    %ecx,%eax
    12d1:	ba 00 00 00 00       	mov    $0x0,%edx
    12d6:	f7 f6                	div    %esi
    12d8:	89 df                	mov    %ebx,%edi
    12da:	83 c3 01             	add    $0x1,%ebx
    12dd:	0f b6 92 40 16 00 00 	movzbl 0x1640(%edx),%edx
    12e4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
    12e8:	89 ca                	mov    %ecx,%edx
    12ea:	89 c1                	mov    %eax,%ecx
    12ec:	39 d6                	cmp    %edx,%esi
    12ee:	76 df                	jbe    12cf <printint+0x2e>
  if(neg)
    12f0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    12f4:	74 31                	je     1327 <printint+0x86>
    buf[i++] = '-';
    12f6:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    12fb:	8d 5f 02             	lea    0x2(%edi),%ebx
    12fe:	8b 75 d0             	mov    -0x30(%ebp),%esi
    1301:	eb 17                	jmp    131a <printint+0x79>
    x = xx;
    1303:	89 c1                	mov    %eax,%ecx
  neg = 0;
    1305:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    130c:	eb bc                	jmp    12ca <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
    130e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    1313:	89 f0                	mov    %esi,%eax
    1315:	e8 6d ff ff ff       	call   1287 <putc>
  while(--i >= 0)
    131a:	83 eb 01             	sub    $0x1,%ebx
    131d:	79 ef                	jns    130e <printint+0x6d>
}
    131f:	83 c4 2c             	add    $0x2c,%esp
    1322:	5b                   	pop    %ebx
    1323:	5e                   	pop    %esi
    1324:	5f                   	pop    %edi
    1325:	5d                   	pop    %ebp
    1326:	c3                   	ret    
    1327:	8b 75 d0             	mov    -0x30(%ebp),%esi
    132a:	eb ee                	jmp    131a <printint+0x79>

0000132c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    132c:	55                   	push   %ebp
    132d:	89 e5                	mov    %esp,%ebp
    132f:	57                   	push   %edi
    1330:	56                   	push   %esi
    1331:	53                   	push   %ebx
    1332:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    1335:	8d 45 10             	lea    0x10(%ebp),%eax
    1338:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
    133b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
    1340:	bb 00 00 00 00       	mov    $0x0,%ebx
    1345:	eb 14                	jmp    135b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    1347:	89 fa                	mov    %edi,%edx
    1349:	8b 45 08             	mov    0x8(%ebp),%eax
    134c:	e8 36 ff ff ff       	call   1287 <putc>
    1351:	eb 05                	jmp    1358 <printf+0x2c>
      }
    } else if(state == '%'){
    1353:	83 fe 25             	cmp    $0x25,%esi
    1356:	74 25                	je     137d <printf+0x51>
  for(i = 0; fmt[i]; i++){
    1358:	83 c3 01             	add    $0x1,%ebx
    135b:	8b 45 0c             	mov    0xc(%ebp),%eax
    135e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
    1362:	84 c0                	test   %al,%al
    1364:	0f 84 20 01 00 00    	je     148a <printf+0x15e>
    c = fmt[i] & 0xff;
    136a:	0f be f8             	movsbl %al,%edi
    136d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    1370:	85 f6                	test   %esi,%esi
    1372:	75 df                	jne    1353 <printf+0x27>
      if(c == '%'){
    1374:	83 f8 25             	cmp    $0x25,%eax
    1377:	75 ce                	jne    1347 <printf+0x1b>
        state = '%';
    1379:	89 c6                	mov    %eax,%esi
    137b:	eb db                	jmp    1358 <printf+0x2c>
      if(c == 'd'){
    137d:	83 f8 25             	cmp    $0x25,%eax
    1380:	0f 84 cf 00 00 00    	je     1455 <printf+0x129>
    1386:	0f 8c dd 00 00 00    	jl     1469 <printf+0x13d>
    138c:	83 f8 78             	cmp    $0x78,%eax
    138f:	0f 8f d4 00 00 00    	jg     1469 <printf+0x13d>
    1395:	83 f8 63             	cmp    $0x63,%eax
    1398:	0f 8c cb 00 00 00    	jl     1469 <printf+0x13d>
    139e:	83 e8 63             	sub    $0x63,%eax
    13a1:	83 f8 15             	cmp    $0x15,%eax
    13a4:	0f 87 bf 00 00 00    	ja     1469 <printf+0x13d>
    13aa:	ff 24 85 e8 15 00 00 	jmp    *0x15e8(,%eax,4)
        printint(fd, *ap, 10, 1);
    13b1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    13b4:	8b 17                	mov    (%edi),%edx
    13b6:	83 ec 0c             	sub    $0xc,%esp
    13b9:	6a 01                	push   $0x1
    13bb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    13c0:	8b 45 08             	mov    0x8(%ebp),%eax
    13c3:	e8 d9 fe ff ff       	call   12a1 <printint>
        ap++;
    13c8:	83 c7 04             	add    $0x4,%edi
    13cb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    13ce:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    13d1:	be 00 00 00 00       	mov    $0x0,%esi
    13d6:	eb 80                	jmp    1358 <printf+0x2c>
        printint(fd, *ap, 16, 0);
    13d8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    13db:	8b 17                	mov    (%edi),%edx
    13dd:	83 ec 0c             	sub    $0xc,%esp
    13e0:	6a 00                	push   $0x0
    13e2:	b9 10 00 00 00       	mov    $0x10,%ecx
    13e7:	8b 45 08             	mov    0x8(%ebp),%eax
    13ea:	e8 b2 fe ff ff       	call   12a1 <printint>
        ap++;
    13ef:	83 c7 04             	add    $0x4,%edi
    13f2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    13f5:	83 c4 10             	add    $0x10,%esp
      state = 0;
    13f8:	be 00 00 00 00       	mov    $0x0,%esi
    13fd:	e9 56 ff ff ff       	jmp    1358 <printf+0x2c>
        s = (char*)*ap;
    1402:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1405:	8b 30                	mov    (%eax),%esi
        ap++;
    1407:	83 c0 04             	add    $0x4,%eax
    140a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
    140d:	85 f6                	test   %esi,%esi
    140f:	75 15                	jne    1426 <printf+0xfa>
          s = "(null)";
    1411:	be df 15 00 00       	mov    $0x15df,%esi
    1416:	eb 0e                	jmp    1426 <printf+0xfa>
          putc(fd, *s);
    1418:	0f be d2             	movsbl %dl,%edx
    141b:	8b 45 08             	mov    0x8(%ebp),%eax
    141e:	e8 64 fe ff ff       	call   1287 <putc>
          s++;
    1423:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
    1426:	0f b6 16             	movzbl (%esi),%edx
    1429:	84 d2                	test   %dl,%dl
    142b:	75 eb                	jne    1418 <printf+0xec>
      state = 0;
    142d:	be 00 00 00 00       	mov    $0x0,%esi
    1432:	e9 21 ff ff ff       	jmp    1358 <printf+0x2c>
        putc(fd, *ap);
    1437:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    143a:	0f be 17             	movsbl (%edi),%edx
    143d:	8b 45 08             	mov    0x8(%ebp),%eax
    1440:	e8 42 fe ff ff       	call   1287 <putc>
        ap++;
    1445:	83 c7 04             	add    $0x4,%edi
    1448:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
    144b:	be 00 00 00 00       	mov    $0x0,%esi
    1450:	e9 03 ff ff ff       	jmp    1358 <printf+0x2c>
        putc(fd, c);
    1455:	89 fa                	mov    %edi,%edx
    1457:	8b 45 08             	mov    0x8(%ebp),%eax
    145a:	e8 28 fe ff ff       	call   1287 <putc>
      state = 0;
    145f:	be 00 00 00 00       	mov    $0x0,%esi
    1464:	e9 ef fe ff ff       	jmp    1358 <printf+0x2c>
        putc(fd, '%');
    1469:	ba 25 00 00 00       	mov    $0x25,%edx
    146e:	8b 45 08             	mov    0x8(%ebp),%eax
    1471:	e8 11 fe ff ff       	call   1287 <putc>
        putc(fd, c);
    1476:	89 fa                	mov    %edi,%edx
    1478:	8b 45 08             	mov    0x8(%ebp),%eax
    147b:	e8 07 fe ff ff       	call   1287 <putc>
      state = 0;
    1480:	be 00 00 00 00       	mov    $0x0,%esi
    1485:	e9 ce fe ff ff       	jmp    1358 <printf+0x2c>
    }
  }
}
    148a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    148d:	5b                   	pop    %ebx
    148e:	5e                   	pop    %esi
    148f:	5f                   	pop    %edi
    1490:	5d                   	pop    %ebp
    1491:	c3                   	ret    

00001492 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1492:	55                   	push   %ebp
    1493:	89 e5                	mov    %esp,%ebp
    1495:	57                   	push   %edi
    1496:	56                   	push   %esi
    1497:	53                   	push   %ebx
    1498:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    149b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    149e:	a1 e0 18 00 00       	mov    0x18e0,%eax
    14a3:	eb 02                	jmp    14a7 <free+0x15>
    14a5:	89 d0                	mov    %edx,%eax
    14a7:	39 c8                	cmp    %ecx,%eax
    14a9:	73 04                	jae    14af <free+0x1d>
    14ab:	39 08                	cmp    %ecx,(%eax)
    14ad:	77 12                	ja     14c1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14af:	8b 10                	mov    (%eax),%edx
    14b1:	39 c2                	cmp    %eax,%edx
    14b3:	77 f0                	ja     14a5 <free+0x13>
    14b5:	39 c8                	cmp    %ecx,%eax
    14b7:	72 08                	jb     14c1 <free+0x2f>
    14b9:	39 ca                	cmp    %ecx,%edx
    14bb:	77 04                	ja     14c1 <free+0x2f>
    14bd:	89 d0                	mov    %edx,%eax
    14bf:	eb e6                	jmp    14a7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
    14c1:	8b 73 fc             	mov    -0x4(%ebx),%esi
    14c4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    14c7:	8b 10                	mov    (%eax),%edx
    14c9:	39 d7                	cmp    %edx,%edi
    14cb:	74 19                	je     14e6 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    14cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    14d0:	8b 50 04             	mov    0x4(%eax),%edx
    14d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    14d6:	39 ce                	cmp    %ecx,%esi
    14d8:	74 1b                	je     14f5 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    14da:	89 08                	mov    %ecx,(%eax)
  freep = p;
    14dc:	a3 e0 18 00 00       	mov    %eax,0x18e0
}
    14e1:	5b                   	pop    %ebx
    14e2:	5e                   	pop    %esi
    14e3:	5f                   	pop    %edi
    14e4:	5d                   	pop    %ebp
    14e5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    14e6:	03 72 04             	add    0x4(%edx),%esi
    14e9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    14ec:	8b 10                	mov    (%eax),%edx
    14ee:	8b 12                	mov    (%edx),%edx
    14f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
    14f3:	eb db                	jmp    14d0 <free+0x3e>
    p->s.size += bp->s.size;
    14f5:	03 53 fc             	add    -0x4(%ebx),%edx
    14f8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    14fb:	8b 53 f8             	mov    -0x8(%ebx),%edx
    14fe:	89 10                	mov    %edx,(%eax)
    1500:	eb da                	jmp    14dc <free+0x4a>

00001502 <morecore>:

static Header*
morecore(uint nu)
{
    1502:	55                   	push   %ebp
    1503:	89 e5                	mov    %esp,%ebp
    1505:	53                   	push   %ebx
    1506:	83 ec 04             	sub    $0x4,%esp
    1509:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    150b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    1510:	77 05                	ja     1517 <morecore+0x15>
    nu = 4096;
    1512:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    1517:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    151e:	83 ec 0c             	sub    $0xc,%esp
    1521:	50                   	push   %eax
    1522:	e8 28 fd ff ff       	call   124f <sbrk>
  if(p == (char*)-1)
    1527:	83 c4 10             	add    $0x10,%esp
    152a:	83 f8 ff             	cmp    $0xffffffff,%eax
    152d:	74 1c                	je     154b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    152f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1532:	83 c0 08             	add    $0x8,%eax
    1535:	83 ec 0c             	sub    $0xc,%esp
    1538:	50                   	push   %eax
    1539:	e8 54 ff ff ff       	call   1492 <free>
  return freep;
    153e:	a1 e0 18 00 00       	mov    0x18e0,%eax
    1543:	83 c4 10             	add    $0x10,%esp
}
    1546:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1549:	c9                   	leave  
    154a:	c3                   	ret    
    return 0;
    154b:	b8 00 00 00 00       	mov    $0x0,%eax
    1550:	eb f4                	jmp    1546 <morecore+0x44>

00001552 <malloc>:

void*
malloc(uint nbytes)
{
    1552:	55                   	push   %ebp
    1553:	89 e5                	mov    %esp,%ebp
    1555:	53                   	push   %ebx
    1556:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1559:	8b 45 08             	mov    0x8(%ebp),%eax
    155c:	8d 58 07             	lea    0x7(%eax),%ebx
    155f:	c1 eb 03             	shr    $0x3,%ebx
    1562:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    1565:	8b 0d e0 18 00 00    	mov    0x18e0,%ecx
    156b:	85 c9                	test   %ecx,%ecx
    156d:	74 04                	je     1573 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    156f:	8b 01                	mov    (%ecx),%eax
    1571:	eb 4a                	jmp    15bd <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
    1573:	c7 05 e0 18 00 00 e4 	movl   $0x18e4,0x18e0
    157a:	18 00 00 
    157d:	c7 05 e4 18 00 00 e4 	movl   $0x18e4,0x18e4
    1584:	18 00 00 
    base.s.size = 0;
    1587:	c7 05 e8 18 00 00 00 	movl   $0x0,0x18e8
    158e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1591:	b9 e4 18 00 00       	mov    $0x18e4,%ecx
    1596:	eb d7                	jmp    156f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1598:	74 19                	je     15b3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    159a:	29 da                	sub    %ebx,%edx
    159c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    159f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    15a2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    15a5:	89 0d e0 18 00 00    	mov    %ecx,0x18e0
      return (void*)(p + 1);
    15ab:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    15ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    15b1:	c9                   	leave  
    15b2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    15b3:	8b 10                	mov    (%eax),%edx
    15b5:	89 11                	mov    %edx,(%ecx)
    15b7:	eb ec                	jmp    15a5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15b9:	89 c1                	mov    %eax,%ecx
    15bb:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    15bd:	8b 50 04             	mov    0x4(%eax),%edx
    15c0:	39 da                	cmp    %ebx,%edx
    15c2:	73 d4                	jae    1598 <malloc+0x46>
    if(p == freep)
    15c4:	39 05 e0 18 00 00    	cmp    %eax,0x18e0
    15ca:	75 ed                	jne    15b9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
    15cc:	89 d8                	mov    %ebx,%eax
    15ce:	e8 2f ff ff ff       	call   1502 <morecore>
    15d3:	85 c0                	test   %eax,%eax
    15d5:	75 e2                	jne    15b9 <malloc+0x67>
    15d7:	eb d5                	jmp    15ae <malloc+0x5c>
