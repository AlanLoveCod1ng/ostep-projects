
_test_12:     file format elf32-i386


Disassembly of section .text:

00001000 <spin>:
#include "types.h"
#include "stat.h"
#include "user.h"
#include "pstat.h"

int spin() {
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	53                   	push   %ebx
  int i = 0;
  int j = 0;
  int k = 0;
    1004:	b8 00 00 00 00       	mov    $0x0,%eax
  for (i = 0; i < 5000; ++i) {
    1009:	bb 00 00 00 00       	mov    $0x0,%ebx
    100e:	eb 2f                	jmp    103f <spin+0x3f>
    for (j = 0; j < 200000; ++j) {
      k = j % 10;
    1010:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1015:	89 c8                	mov    %ecx,%eax
    1017:	f7 ea                	imul   %edx
    1019:	c1 fa 02             	sar    $0x2,%edx
    101c:	89 c8                	mov    %ecx,%eax
    101e:	c1 f8 1f             	sar    $0x1f,%eax
    1021:	29 c2                	sub    %eax,%edx
    1023:	8d 14 92             	lea    (%edx,%edx,4),%edx
    1026:	8d 04 12             	lea    (%edx,%edx,1),%eax
    1029:	89 ca                	mov    %ecx,%edx
    102b:	29 c2                	sub    %eax,%edx
      k += i + 1;
    102d:	8d 44 13 01          	lea    0x1(%ebx,%edx,1),%eax
    for (j = 0; j < 200000; ++j) {
    1031:	83 c1 01             	add    $0x1,%ecx
    1034:	81 f9 3f 0d 03 00    	cmp    $0x30d3f,%ecx
    103a:	7e d4                	jle    1010 <spin+0x10>
  for (i = 0; i < 5000; ++i) {
    103c:	83 c3 01             	add    $0x1,%ebx
    103f:	81 fb 87 13 00 00    	cmp    $0x1387,%ebx
    1045:	7f 07                	jg     104e <spin+0x4e>
    for (j = 0; j < 200000; ++j) {
    1047:	b9 00 00 00 00       	mov    $0x0,%ecx
    104c:	eb e6                	jmp    1034 <spin+0x34>
    }
  }
  return k;
}
    104e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1051:	c9                   	leave  
    1052:	c3                   	ret    

00001053 <print>:

void print(struct pstat *st) {
    1053:	55                   	push   %ebp
    1054:	89 e5                	mov    %esp,%ebp
    1056:	56                   	push   %esi
    1057:	53                   	push   %ebx
    1058:	8b 75 08             	mov    0x8(%ebp),%esi
   int i;
   for(i = 0; i < NPROC; i++) {
    105b:	bb 00 00 00 00       	mov    $0x0,%ebx
    1060:	eb 03                	jmp    1065 <print+0x12>
    1062:	83 c3 01             	add    $0x1,%ebx
    1065:	83 fb 3f             	cmp    $0x3f,%ebx
    1068:	7f 2f                	jg     1099 <print+0x46>
     if (st->inuse[i]) {
    106a:	83 3c 9e 00          	cmpl   $0x0,(%esi,%ebx,4)
    106e:	74 f2                	je     1062 <print+0xf>
       printf(1, "pid: %d tickets: %d ticks: %d\n", st->pid[i], st->tickets[i], st->ticks[i]);
    1070:	83 ec 0c             	sub    $0xc,%esp
    1073:	ff b4 9e 00 03 00 00 	push   0x300(%esi,%ebx,4)
    107a:	ff b4 9e 00 01 00 00 	push   0x100(%esi,%ebx,4)
    1081:	ff b4 9e 00 02 00 00 	push   0x200(%esi,%ebx,4)
    1088:	68 0c 18 00 00       	push   $0x180c
    108d:	6a 01                	push   $0x1
    108f:	e8 c8 04 00 00       	call   155c <printf>
    1094:	83 c4 20             	add    $0x20,%esp
    1097:	eb c9                	jmp    1062 <print+0xf>
     }
   }
}
    1099:	8d 65 f8             	lea    -0x8(%ebp),%esp
    109c:	5b                   	pop    %ebx
    109d:	5e                   	pop    %esi
    109e:	5d                   	pop    %ebp
    109f:	c3                   	ret    

000010a0 <compare>:

void compare(int pid_low, int pid_high, struct pstat *before, struct pstat *after) {
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	57                   	push   %edi
    10a4:	56                   	push   %esi
    10a5:	53                   	push   %ebx
    10a6:	83 ec 1c             	sub    $0x1c,%esp
    10a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    10ac:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    10af:	8b 7d 10             	mov    0x10(%ebp),%edi
  int i, ticks_low_before=-1, ticks_low_after=-1, ticks_high_before=-1, ticks_high_after=-1;
    10b2:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
    10b9:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%ebp)
    10c0:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
    10c7:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  for(i = 0; i < NPROC; i++) {
    10ce:	b8 00 00 00 00       	mov    $0x0,%eax
    10d3:	eb 27                	jmp    10fc <compare+0x5c>
    if (before->pid[i] == pid_low) 
        ticks_low_before = before->ticks[i];
    10d5:	8b b4 87 00 03 00 00 	mov    0x300(%edi,%eax,4),%esi
    10dc:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    10df:	eb 2b                	jmp    110c <compare+0x6c>
    if (before->pid[i] == pid_high)
        ticks_high_before = before->ticks[i];
    10e1:	8b b4 87 00 03 00 00 	mov    0x300(%edi,%eax,4),%esi
    10e8:	89 75 dc             	mov    %esi,-0x24(%ebp)
    10eb:	eb 23                	jmp    1110 <compare+0x70>
    if (after->pid[i] == pid_low)
        ticks_low_after = after->ticks[i];
    10ed:	8b b4 86 00 03 00 00 	mov    0x300(%esi,%eax,4),%esi
    10f4:	89 75 e0             	mov    %esi,-0x20(%ebp)
    10f7:	eb 25                	jmp    111e <compare+0x7e>
  for(i = 0; i < NPROC; i++) {
    10f9:	83 c0 01             	add    $0x1,%eax
    10fc:	83 f8 3f             	cmp    $0x3f,%eax
    10ff:	7f 30                	jg     1131 <compare+0x91>
    if (before->pid[i] == pid_low) 
    1101:	8b 94 87 00 02 00 00 	mov    0x200(%edi,%eax,4),%edx
    1108:	39 da                	cmp    %ebx,%edx
    110a:	74 c9                	je     10d5 <compare+0x35>
    if (before->pid[i] == pid_high)
    110c:	39 ca                	cmp    %ecx,%edx
    110e:	74 d1                	je     10e1 <compare+0x41>
    if (after->pid[i] == pid_low)
    1110:	8b 75 14             	mov    0x14(%ebp),%esi
    1113:	8b 94 86 00 02 00 00 	mov    0x200(%esi,%eax,4),%edx
    111a:	39 da                	cmp    %ebx,%edx
    111c:	74 cf                	je     10ed <compare+0x4d>
    if (after->pid[i] == pid_high)
    111e:	39 ca                	cmp    %ecx,%edx
    1120:	75 d7                	jne    10f9 <compare+0x59>
        ticks_high_after = after->ticks[i];
    1122:	8b 75 14             	mov    0x14(%ebp),%esi
    1125:	8b b4 86 00 03 00 00 	mov    0x300(%esi,%eax,4),%esi
    112c:	89 75 d8             	mov    %esi,-0x28(%ebp)
    112f:	eb c8                	jmp    10f9 <compare+0x59>
  }
  printf(1, "high before: %d high after: %d, low before: %d low after: %d\n", 
    1131:	83 ec 08             	sub    $0x8,%esp
    1134:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    1137:	53                   	push   %ebx
    1138:	ff 75 e4             	push   -0x1c(%ebp)
    113b:	8b 7d d8             	mov    -0x28(%ebp),%edi
    113e:	57                   	push   %edi
    113f:	8b 75 dc             	mov    -0x24(%ebp),%esi
    1142:	56                   	push   %esi
    1143:	68 2c 18 00 00       	push   $0x182c
    1148:	6a 01                	push   $0x1
    114a:	e8 0d 04 00 00       	call   155c <printf>
                     ticks_high_before, ticks_high_after, ticks_low_before, ticks_low_after);
  
  if ( (ticks_high_after-ticks_high_before) > (ticks_low_after - ticks_low_before)) {
    114f:	29 f7                	sub    %esi,%edi
    1151:	89 d8                	mov    %ebx,%eax
    1153:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    1156:	83 c4 20             	add    $0x20,%esp
    1159:	39 c7                	cmp    %eax,%edi
    115b:	7e 17                	jle    1174 <compare+0xd4>
    printf(1, "XV6_SCHEDULER\t SUCCESS\n"); 
    115d:	83 ec 08             	sub    $0x8,%esp
    1160:	68 6a 18 00 00       	push   $0x186a
    1165:	6a 01                	push   $0x1
    1167:	e8 f0 03 00 00       	call   155c <printf>
  } else {
    printf(1, "XV6_SCHEDULER\t FAILED\n"); 
    exit();
  }
}
    116c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    116f:	5b                   	pop    %ebx
    1170:	5e                   	pop    %esi
    1171:	5f                   	pop    %edi
    1172:	5d                   	pop    %ebp
    1173:	c3                   	ret    
    printf(1, "XV6_SCHEDULER\t FAILED\n"); 
    1174:	83 ec 08             	sub    $0x8,%esp
    1177:	68 82 18 00 00       	push   $0x1882
    117c:	6a 01                	push   $0x1
    117e:	e8 d9 03 00 00       	call   155c <printf>
    exit();
    1183:	e8 6f 02 00 00       	call   13f7 <exit>

00001188 <main>:

int
main(int argc, char *argv[])
{
    1188:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    118c:	83 e4 f0             	and    $0xfffffff0,%esp
    118f:	ff 71 fc             	push   -0x4(%ecx)
    1192:	55                   	push   %ebp
    1193:	89 e5                	mov    %esp,%ebp
    1195:	51                   	push   %ecx
    1196:	83 ec 10             	sub    $0x10,%esp
  int lowtickets = 0, hightickets = 1;

  if (settickets(lowtickets) != 0) {
    1199:	6a 00                	push   $0x0
    119b:	e8 f7 02 00 00       	call   1497 <settickets>
    11a0:	83 c4 10             	add    $0x10,%esp
    11a3:	85 c0                	test   %eax,%eax
    11a5:	74 14                	je     11bb <main+0x33>
    printf(1, "XV6_SCHEDULER\t FAILED\n"); 
    11a7:	83 ec 08             	sub    $0x8,%esp
    11aa:	68 82 18 00 00       	push   $0x1882
    11af:	6a 01                	push   $0x1
    11b1:	e8 a6 03 00 00       	call   155c <printf>
    exit();
    11b6:	e8 3c 02 00 00       	call   13f7 <exit>
  }

  if (fork() == 0) {  	
    11bb:	e8 2f 02 00 00       	call   13ef <fork>
    11c0:	85 c0                	test   %eax,%eax
    11c2:	75 6e                	jne    1232 <main+0xaa>
    if (settickets(hightickets) != 0) {
    11c4:	83 ec 0c             	sub    $0xc,%esp
    11c7:	6a 01                	push   $0x1
    11c9:	e8 c9 02 00 00       	call   1497 <settickets>
    11ce:	83 c4 10             	add    $0x10,%esp
    11d1:	85 c0                	test   %eax,%eax
    11d3:	74 14                	je     11e9 <main+0x61>
      printf(1, "XV6_SCHEDULER\t FAILED\n"); 
    11d5:	83 ec 08             	sub    $0x8,%esp
    11d8:	68 82 18 00 00       	push   $0x1882
    11dd:	6a 01                	push   $0x1
    11df:	e8 78 03 00 00       	call   155c <printf>
      exit();
    11e4:	e8 0e 02 00 00       	call   13f7 <exit>
    }
    if (fork() == 0)
    11e9:	e8 01 02 00 00       	call   13ef <fork>
    11ee:	85 c0                	test   %eax,%eax
    11f0:	75 1a                	jne    120c <main+0x84>
    {
      
      printf(1,"Spinning...%d\n", spin());
    11f2:	e8 09 fe ff ff       	call   1000 <spin>
    11f7:	83 ec 04             	sub    $0x4,%esp
    11fa:	50                   	push   %eax
    11fb:	68 99 18 00 00       	push   $0x1899
    1200:	6a 01                	push   $0x1
    1202:	e8 55 03 00 00       	call   155c <printf>

          
      exit();
    1207:	e8 eb 01 00 00       	call   13f7 <exit>
    }
    
    printf(1,"Spinning...%d\n", spin());
    120c:	e8 ef fd ff ff       	call   1000 <spin>
    1211:	83 ec 04             	sub    $0x4,%esp
    1214:	50                   	push   %eax
    1215:	68 99 18 00 00       	push   $0x1899
    121a:	6a 01                	push   $0x1
    121c:	e8 3b 03 00 00       	call   155c <printf>
    while (wait() > -1);
    1221:	83 c4 10             	add    $0x10,%esp
    1224:	e8 d6 01 00 00       	call   13ff <wait>
    1229:	85 c0                	test   %eax,%eax
    122b:	79 f7                	jns    1224 <main+0x9c>
    exit();
    122d:	e8 c5 01 00 00       	call   13f7 <exit>
  }
  printf(1,"Spinning...%d\n", spin());
    1232:	e8 c9 fd ff ff       	call   1000 <spin>
    1237:	83 ec 04             	sub    $0x4,%esp
    123a:	50                   	push   %eax
    123b:	68 99 18 00 00       	push   $0x1899
    1240:	6a 01                	push   $0x1
    1242:	e8 15 03 00 00       	call   155c <printf>

  while (wait() > -1);
    1247:	83 c4 10             	add    $0x10,%esp
    124a:	e8 b0 01 00 00       	call   13ff <wait>
    124f:	85 c0                	test   %eax,%eax
    1251:	79 f7                	jns    124a <main+0xc2>
  exit();
    1253:	e8 9f 01 00 00       	call   13f7 <exit>

00001258 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1258:	55                   	push   %ebp
    1259:	89 e5                	mov    %esp,%ebp
    125b:	56                   	push   %esi
    125c:	53                   	push   %ebx
    125d:	8b 75 08             	mov    0x8(%ebp),%esi
    1260:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1263:	89 f0                	mov    %esi,%eax
    1265:	89 d1                	mov    %edx,%ecx
    1267:	83 c2 01             	add    $0x1,%edx
    126a:	89 c3                	mov    %eax,%ebx
    126c:	83 c0 01             	add    $0x1,%eax
    126f:	0f b6 09             	movzbl (%ecx),%ecx
    1272:	88 0b                	mov    %cl,(%ebx)
    1274:	84 c9                	test   %cl,%cl
    1276:	75 ed                	jne    1265 <strcpy+0xd>
    ;
  return os;
}
    1278:	89 f0                	mov    %esi,%eax
    127a:	5b                   	pop    %ebx
    127b:	5e                   	pop    %esi
    127c:	5d                   	pop    %ebp
    127d:	c3                   	ret    

0000127e <strcmp>:

int
strcmp(const char *p, const char *q)
{
    127e:	55                   	push   %ebp
    127f:	89 e5                	mov    %esp,%ebp
    1281:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1284:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    1287:	eb 06                	jmp    128f <strcmp+0x11>
    p++, q++;
    1289:	83 c1 01             	add    $0x1,%ecx
    128c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    128f:	0f b6 01             	movzbl (%ecx),%eax
    1292:	84 c0                	test   %al,%al
    1294:	74 04                	je     129a <strcmp+0x1c>
    1296:	3a 02                	cmp    (%edx),%al
    1298:	74 ef                	je     1289 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
    129a:	0f b6 c0             	movzbl %al,%eax
    129d:	0f b6 12             	movzbl (%edx),%edx
    12a0:	29 d0                	sub    %edx,%eax
}
    12a2:	5d                   	pop    %ebp
    12a3:	c3                   	ret    

000012a4 <strlen>:

uint
strlen(const char *s)
{
    12a4:	55                   	push   %ebp
    12a5:	89 e5                	mov    %esp,%ebp
    12a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    12aa:	b8 00 00 00 00       	mov    $0x0,%eax
    12af:	eb 03                	jmp    12b4 <strlen+0x10>
    12b1:	83 c0 01             	add    $0x1,%eax
    12b4:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
    12b8:	75 f7                	jne    12b1 <strlen+0xd>
    ;
  return n;
}
    12ba:	5d                   	pop    %ebp
    12bb:	c3                   	ret    

000012bc <memset>:

void*
memset(void *dst, int c, uint n)
{
    12bc:	55                   	push   %ebp
    12bd:	89 e5                	mov    %esp,%ebp
    12bf:	57                   	push   %edi
    12c0:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    12c3:	89 d7                	mov    %edx,%edi
    12c5:	8b 4d 10             	mov    0x10(%ebp),%ecx
    12c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    12cb:	fc                   	cld    
    12cc:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    12ce:	89 d0                	mov    %edx,%eax
    12d0:	8b 7d fc             	mov    -0x4(%ebp),%edi
    12d3:	c9                   	leave  
    12d4:	c3                   	ret    

000012d5 <strchr>:

char*
strchr(const char *s, char c)
{
    12d5:	55                   	push   %ebp
    12d6:	89 e5                	mov    %esp,%ebp
    12d8:	8b 45 08             	mov    0x8(%ebp),%eax
    12db:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    12df:	eb 03                	jmp    12e4 <strchr+0xf>
    12e1:	83 c0 01             	add    $0x1,%eax
    12e4:	0f b6 10             	movzbl (%eax),%edx
    12e7:	84 d2                	test   %dl,%dl
    12e9:	74 06                	je     12f1 <strchr+0x1c>
    if(*s == c)
    12eb:	38 ca                	cmp    %cl,%dl
    12ed:	75 f2                	jne    12e1 <strchr+0xc>
    12ef:	eb 05                	jmp    12f6 <strchr+0x21>
      return (char*)s;
  return 0;
    12f1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12f6:	5d                   	pop    %ebp
    12f7:	c3                   	ret    

000012f8 <gets>:

char*
gets(char *buf, int max)
{
    12f8:	55                   	push   %ebp
    12f9:	89 e5                	mov    %esp,%ebp
    12fb:	57                   	push   %edi
    12fc:	56                   	push   %esi
    12fd:	53                   	push   %ebx
    12fe:	83 ec 1c             	sub    $0x1c,%esp
    1301:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1304:	bb 00 00 00 00       	mov    $0x0,%ebx
    1309:	89 de                	mov    %ebx,%esi
    130b:	83 c3 01             	add    $0x1,%ebx
    130e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1311:	7d 2e                	jge    1341 <gets+0x49>
    cc = read(0, &c, 1);
    1313:	83 ec 04             	sub    $0x4,%esp
    1316:	6a 01                	push   $0x1
    1318:	8d 45 e7             	lea    -0x19(%ebp),%eax
    131b:	50                   	push   %eax
    131c:	6a 00                	push   $0x0
    131e:	e8 ec 00 00 00       	call   140f <read>
    if(cc < 1)
    1323:	83 c4 10             	add    $0x10,%esp
    1326:	85 c0                	test   %eax,%eax
    1328:	7e 17                	jle    1341 <gets+0x49>
      break;
    buf[i++] = c;
    132a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    132e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
    1331:	3c 0a                	cmp    $0xa,%al
    1333:	0f 94 c2             	sete   %dl
    1336:	3c 0d                	cmp    $0xd,%al
    1338:	0f 94 c0             	sete   %al
    133b:	08 c2                	or     %al,%dl
    133d:	74 ca                	je     1309 <gets+0x11>
    buf[i++] = c;
    133f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
    1341:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    1345:	89 f8                	mov    %edi,%eax
    1347:	8d 65 f4             	lea    -0xc(%ebp),%esp
    134a:	5b                   	pop    %ebx
    134b:	5e                   	pop    %esi
    134c:	5f                   	pop    %edi
    134d:	5d                   	pop    %ebp
    134e:	c3                   	ret    

0000134f <stat>:

int
stat(const char *n, struct stat *st)
{
    134f:	55                   	push   %ebp
    1350:	89 e5                	mov    %esp,%ebp
    1352:	56                   	push   %esi
    1353:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1354:	83 ec 08             	sub    $0x8,%esp
    1357:	6a 00                	push   $0x0
    1359:	ff 75 08             	push   0x8(%ebp)
    135c:	e8 d6 00 00 00       	call   1437 <open>
  if(fd < 0)
    1361:	83 c4 10             	add    $0x10,%esp
    1364:	85 c0                	test   %eax,%eax
    1366:	78 24                	js     138c <stat+0x3d>
    1368:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    136a:	83 ec 08             	sub    $0x8,%esp
    136d:	ff 75 0c             	push   0xc(%ebp)
    1370:	50                   	push   %eax
    1371:	e8 d9 00 00 00       	call   144f <fstat>
    1376:	89 c6                	mov    %eax,%esi
  close(fd);
    1378:	89 1c 24             	mov    %ebx,(%esp)
    137b:	e8 9f 00 00 00       	call   141f <close>
  return r;
    1380:	83 c4 10             	add    $0x10,%esp
}
    1383:	89 f0                	mov    %esi,%eax
    1385:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1388:	5b                   	pop    %ebx
    1389:	5e                   	pop    %esi
    138a:	5d                   	pop    %ebp
    138b:	c3                   	ret    
    return -1;
    138c:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1391:	eb f0                	jmp    1383 <stat+0x34>

00001393 <atoi>:

int
atoi(const char *s)
{
    1393:	55                   	push   %ebp
    1394:	89 e5                	mov    %esp,%ebp
    1396:	53                   	push   %ebx
    1397:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
    139a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
    139f:	eb 10                	jmp    13b1 <atoi+0x1e>
    n = n*10 + *s++ - '0';
    13a1:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
    13a4:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
    13a7:	83 c1 01             	add    $0x1,%ecx
    13aa:	0f be c0             	movsbl %al,%eax
    13ad:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
    13b1:	0f b6 01             	movzbl (%ecx),%eax
    13b4:	8d 58 d0             	lea    -0x30(%eax),%ebx
    13b7:	80 fb 09             	cmp    $0x9,%bl
    13ba:	76 e5                	jbe    13a1 <atoi+0xe>
  return n;
}
    13bc:	89 d0                	mov    %edx,%eax
    13be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13c1:	c9                   	leave  
    13c2:	c3                   	ret    

000013c3 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    13c3:	55                   	push   %ebp
    13c4:	89 e5                	mov    %esp,%ebp
    13c6:	56                   	push   %esi
    13c7:	53                   	push   %ebx
    13c8:	8b 75 08             	mov    0x8(%ebp),%esi
    13cb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    13ce:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
    13d1:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
    13d3:	eb 0d                	jmp    13e2 <memmove+0x1f>
    *dst++ = *src++;
    13d5:	0f b6 01             	movzbl (%ecx),%eax
    13d8:	88 02                	mov    %al,(%edx)
    13da:	8d 49 01             	lea    0x1(%ecx),%ecx
    13dd:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
    13e0:	89 d8                	mov    %ebx,%eax
    13e2:	8d 58 ff             	lea    -0x1(%eax),%ebx
    13e5:	85 c0                	test   %eax,%eax
    13e7:	7f ec                	jg     13d5 <memmove+0x12>
  return vdst;
}
    13e9:	89 f0                	mov    %esi,%eax
    13eb:	5b                   	pop    %ebx
    13ec:	5e                   	pop    %esi
    13ed:	5d                   	pop    %ebp
    13ee:	c3                   	ret    

000013ef <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13ef:	b8 01 00 00 00       	mov    $0x1,%eax
    13f4:	cd 40                	int    $0x40
    13f6:	c3                   	ret    

000013f7 <exit>:
SYSCALL(exit)
    13f7:	b8 02 00 00 00       	mov    $0x2,%eax
    13fc:	cd 40                	int    $0x40
    13fe:	c3                   	ret    

000013ff <wait>:
SYSCALL(wait)
    13ff:	b8 03 00 00 00       	mov    $0x3,%eax
    1404:	cd 40                	int    $0x40
    1406:	c3                   	ret    

00001407 <pipe>:
SYSCALL(pipe)
    1407:	b8 04 00 00 00       	mov    $0x4,%eax
    140c:	cd 40                	int    $0x40
    140e:	c3                   	ret    

0000140f <read>:
SYSCALL(read)
    140f:	b8 05 00 00 00       	mov    $0x5,%eax
    1414:	cd 40                	int    $0x40
    1416:	c3                   	ret    

00001417 <write>:
SYSCALL(write)
    1417:	b8 10 00 00 00       	mov    $0x10,%eax
    141c:	cd 40                	int    $0x40
    141e:	c3                   	ret    

0000141f <close>:
SYSCALL(close)
    141f:	b8 15 00 00 00       	mov    $0x15,%eax
    1424:	cd 40                	int    $0x40
    1426:	c3                   	ret    

00001427 <kill>:
SYSCALL(kill)
    1427:	b8 06 00 00 00       	mov    $0x6,%eax
    142c:	cd 40                	int    $0x40
    142e:	c3                   	ret    

0000142f <exec>:
SYSCALL(exec)
    142f:	b8 07 00 00 00       	mov    $0x7,%eax
    1434:	cd 40                	int    $0x40
    1436:	c3                   	ret    

00001437 <open>:
SYSCALL(open)
    1437:	b8 0f 00 00 00       	mov    $0xf,%eax
    143c:	cd 40                	int    $0x40
    143e:	c3                   	ret    

0000143f <mknod>:
SYSCALL(mknod)
    143f:	b8 11 00 00 00       	mov    $0x11,%eax
    1444:	cd 40                	int    $0x40
    1446:	c3                   	ret    

00001447 <unlink>:
SYSCALL(unlink)
    1447:	b8 12 00 00 00       	mov    $0x12,%eax
    144c:	cd 40                	int    $0x40
    144e:	c3                   	ret    

0000144f <fstat>:
SYSCALL(fstat)
    144f:	b8 08 00 00 00       	mov    $0x8,%eax
    1454:	cd 40                	int    $0x40
    1456:	c3                   	ret    

00001457 <link>:
SYSCALL(link)
    1457:	b8 13 00 00 00       	mov    $0x13,%eax
    145c:	cd 40                	int    $0x40
    145e:	c3                   	ret    

0000145f <mkdir>:
SYSCALL(mkdir)
    145f:	b8 14 00 00 00       	mov    $0x14,%eax
    1464:	cd 40                	int    $0x40
    1466:	c3                   	ret    

00001467 <chdir>:
SYSCALL(chdir)
    1467:	b8 09 00 00 00       	mov    $0x9,%eax
    146c:	cd 40                	int    $0x40
    146e:	c3                   	ret    

0000146f <dup>:
SYSCALL(dup)
    146f:	b8 0a 00 00 00       	mov    $0xa,%eax
    1474:	cd 40                	int    $0x40
    1476:	c3                   	ret    

00001477 <getpid>:
SYSCALL(getpid)
    1477:	b8 0b 00 00 00       	mov    $0xb,%eax
    147c:	cd 40                	int    $0x40
    147e:	c3                   	ret    

0000147f <sbrk>:
SYSCALL(sbrk)
    147f:	b8 0c 00 00 00       	mov    $0xc,%eax
    1484:	cd 40                	int    $0x40
    1486:	c3                   	ret    

00001487 <sleep>:
SYSCALL(sleep)
    1487:	b8 0d 00 00 00       	mov    $0xd,%eax
    148c:	cd 40                	int    $0x40
    148e:	c3                   	ret    

0000148f <uptime>:
SYSCALL(uptime)
    148f:	b8 0e 00 00 00       	mov    $0xe,%eax
    1494:	cd 40                	int    $0x40
    1496:	c3                   	ret    

00001497 <settickets>:
SYSCALL(settickets)
    1497:	b8 16 00 00 00       	mov    $0x16,%eax
    149c:	cd 40                	int    $0x40
    149e:	c3                   	ret    

0000149f <getpinfo>:
SYSCALL(getpinfo)
    149f:	b8 17 00 00 00       	mov    $0x17,%eax
    14a4:	cd 40                	int    $0x40
    14a6:	c3                   	ret    

000014a7 <mprotect>:
SYSCALL(mprotect)
    14a7:	b8 18 00 00 00       	mov    $0x18,%eax
    14ac:	cd 40                	int    $0x40
    14ae:	c3                   	ret    

000014af <munprotect>:
SYSCALL(munprotect)
    14af:	b8 19 00 00 00       	mov    $0x19,%eax
    14b4:	cd 40                	int    $0x40
    14b6:	c3                   	ret    

000014b7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    14b7:	55                   	push   %ebp
    14b8:	89 e5                	mov    %esp,%ebp
    14ba:	83 ec 1c             	sub    $0x1c,%esp
    14bd:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    14c0:	6a 01                	push   $0x1
    14c2:	8d 55 f4             	lea    -0xc(%ebp),%edx
    14c5:	52                   	push   %edx
    14c6:	50                   	push   %eax
    14c7:	e8 4b ff ff ff       	call   1417 <write>
}
    14cc:	83 c4 10             	add    $0x10,%esp
    14cf:	c9                   	leave  
    14d0:	c3                   	ret    

000014d1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    14d1:	55                   	push   %ebp
    14d2:	89 e5                	mov    %esp,%ebp
    14d4:	57                   	push   %edi
    14d5:	56                   	push   %esi
    14d6:	53                   	push   %ebx
    14d7:	83 ec 2c             	sub    $0x2c,%esp
    14da:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14dd:	89 d0                	mov    %edx,%eax
    14df:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    14e1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    14e5:	0f 95 c1             	setne  %cl
    14e8:	c1 ea 1f             	shr    $0x1f,%edx
    14eb:	84 d1                	test   %dl,%cl
    14ed:	74 44                	je     1533 <printint+0x62>
    neg = 1;
    x = -xx;
    14ef:	f7 d8                	neg    %eax
    14f1:	89 c1                	mov    %eax,%ecx
    neg = 1;
    14f3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    14fa:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
    14ff:	89 c8                	mov    %ecx,%eax
    1501:	ba 00 00 00 00       	mov    $0x0,%edx
    1506:	f7 f6                	div    %esi
    1508:	89 df                	mov    %ebx,%edi
    150a:	83 c3 01             	add    $0x1,%ebx
    150d:	0f b6 92 08 19 00 00 	movzbl 0x1908(%edx),%edx
    1514:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
    1518:	89 ca                	mov    %ecx,%edx
    151a:	89 c1                	mov    %eax,%ecx
    151c:	39 d6                	cmp    %edx,%esi
    151e:	76 df                	jbe    14ff <printint+0x2e>
  if(neg)
    1520:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    1524:	74 31                	je     1557 <printint+0x86>
    buf[i++] = '-';
    1526:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    152b:	8d 5f 02             	lea    0x2(%edi),%ebx
    152e:	8b 75 d0             	mov    -0x30(%ebp),%esi
    1531:	eb 17                	jmp    154a <printint+0x79>
    x = xx;
    1533:	89 c1                	mov    %eax,%ecx
  neg = 0;
    1535:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    153c:	eb bc                	jmp    14fa <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
    153e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    1543:	89 f0                	mov    %esi,%eax
    1545:	e8 6d ff ff ff       	call   14b7 <putc>
  while(--i >= 0)
    154a:	83 eb 01             	sub    $0x1,%ebx
    154d:	79 ef                	jns    153e <printint+0x6d>
}
    154f:	83 c4 2c             	add    $0x2c,%esp
    1552:	5b                   	pop    %ebx
    1553:	5e                   	pop    %esi
    1554:	5f                   	pop    %edi
    1555:	5d                   	pop    %ebp
    1556:	c3                   	ret    
    1557:	8b 75 d0             	mov    -0x30(%ebp),%esi
    155a:	eb ee                	jmp    154a <printint+0x79>

0000155c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    155c:	55                   	push   %ebp
    155d:	89 e5                	mov    %esp,%ebp
    155f:	57                   	push   %edi
    1560:	56                   	push   %esi
    1561:	53                   	push   %ebx
    1562:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    1565:	8d 45 10             	lea    0x10(%ebp),%eax
    1568:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
    156b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
    1570:	bb 00 00 00 00       	mov    $0x0,%ebx
    1575:	eb 14                	jmp    158b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    1577:	89 fa                	mov    %edi,%edx
    1579:	8b 45 08             	mov    0x8(%ebp),%eax
    157c:	e8 36 ff ff ff       	call   14b7 <putc>
    1581:	eb 05                	jmp    1588 <printf+0x2c>
      }
    } else if(state == '%'){
    1583:	83 fe 25             	cmp    $0x25,%esi
    1586:	74 25                	je     15ad <printf+0x51>
  for(i = 0; fmt[i]; i++){
    1588:	83 c3 01             	add    $0x1,%ebx
    158b:	8b 45 0c             	mov    0xc(%ebp),%eax
    158e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
    1592:	84 c0                	test   %al,%al
    1594:	0f 84 20 01 00 00    	je     16ba <printf+0x15e>
    c = fmt[i] & 0xff;
    159a:	0f be f8             	movsbl %al,%edi
    159d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    15a0:	85 f6                	test   %esi,%esi
    15a2:	75 df                	jne    1583 <printf+0x27>
      if(c == '%'){
    15a4:	83 f8 25             	cmp    $0x25,%eax
    15a7:	75 ce                	jne    1577 <printf+0x1b>
        state = '%';
    15a9:	89 c6                	mov    %eax,%esi
    15ab:	eb db                	jmp    1588 <printf+0x2c>
      if(c == 'd'){
    15ad:	83 f8 25             	cmp    $0x25,%eax
    15b0:	0f 84 cf 00 00 00    	je     1685 <printf+0x129>
    15b6:	0f 8c dd 00 00 00    	jl     1699 <printf+0x13d>
    15bc:	83 f8 78             	cmp    $0x78,%eax
    15bf:	0f 8f d4 00 00 00    	jg     1699 <printf+0x13d>
    15c5:	83 f8 63             	cmp    $0x63,%eax
    15c8:	0f 8c cb 00 00 00    	jl     1699 <printf+0x13d>
    15ce:	83 e8 63             	sub    $0x63,%eax
    15d1:	83 f8 15             	cmp    $0x15,%eax
    15d4:	0f 87 bf 00 00 00    	ja     1699 <printf+0x13d>
    15da:	ff 24 85 b0 18 00 00 	jmp    *0x18b0(,%eax,4)
        printint(fd, *ap, 10, 1);
    15e1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    15e4:	8b 17                	mov    (%edi),%edx
    15e6:	83 ec 0c             	sub    $0xc,%esp
    15e9:	6a 01                	push   $0x1
    15eb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15f0:	8b 45 08             	mov    0x8(%ebp),%eax
    15f3:	e8 d9 fe ff ff       	call   14d1 <printint>
        ap++;
    15f8:	83 c7 04             	add    $0x4,%edi
    15fb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    15fe:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1601:	be 00 00 00 00       	mov    $0x0,%esi
    1606:	eb 80                	jmp    1588 <printf+0x2c>
        printint(fd, *ap, 16, 0);
    1608:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    160b:	8b 17                	mov    (%edi),%edx
    160d:	83 ec 0c             	sub    $0xc,%esp
    1610:	6a 00                	push   $0x0
    1612:	b9 10 00 00 00       	mov    $0x10,%ecx
    1617:	8b 45 08             	mov    0x8(%ebp),%eax
    161a:	e8 b2 fe ff ff       	call   14d1 <printint>
        ap++;
    161f:	83 c7 04             	add    $0x4,%edi
    1622:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    1625:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1628:	be 00 00 00 00       	mov    $0x0,%esi
    162d:	e9 56 ff ff ff       	jmp    1588 <printf+0x2c>
        s = (char*)*ap;
    1632:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1635:	8b 30                	mov    (%eax),%esi
        ap++;
    1637:	83 c0 04             	add    $0x4,%eax
    163a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
    163d:	85 f6                	test   %esi,%esi
    163f:	75 15                	jne    1656 <printf+0xfa>
          s = "(null)";
    1641:	be a8 18 00 00       	mov    $0x18a8,%esi
    1646:	eb 0e                	jmp    1656 <printf+0xfa>
          putc(fd, *s);
    1648:	0f be d2             	movsbl %dl,%edx
    164b:	8b 45 08             	mov    0x8(%ebp),%eax
    164e:	e8 64 fe ff ff       	call   14b7 <putc>
          s++;
    1653:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
    1656:	0f b6 16             	movzbl (%esi),%edx
    1659:	84 d2                	test   %dl,%dl
    165b:	75 eb                	jne    1648 <printf+0xec>
      state = 0;
    165d:	be 00 00 00 00       	mov    $0x0,%esi
    1662:	e9 21 ff ff ff       	jmp    1588 <printf+0x2c>
        putc(fd, *ap);
    1667:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    166a:	0f be 17             	movsbl (%edi),%edx
    166d:	8b 45 08             	mov    0x8(%ebp),%eax
    1670:	e8 42 fe ff ff       	call   14b7 <putc>
        ap++;
    1675:	83 c7 04             	add    $0x4,%edi
    1678:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
    167b:	be 00 00 00 00       	mov    $0x0,%esi
    1680:	e9 03 ff ff ff       	jmp    1588 <printf+0x2c>
        putc(fd, c);
    1685:	89 fa                	mov    %edi,%edx
    1687:	8b 45 08             	mov    0x8(%ebp),%eax
    168a:	e8 28 fe ff ff       	call   14b7 <putc>
      state = 0;
    168f:	be 00 00 00 00       	mov    $0x0,%esi
    1694:	e9 ef fe ff ff       	jmp    1588 <printf+0x2c>
        putc(fd, '%');
    1699:	ba 25 00 00 00       	mov    $0x25,%edx
    169e:	8b 45 08             	mov    0x8(%ebp),%eax
    16a1:	e8 11 fe ff ff       	call   14b7 <putc>
        putc(fd, c);
    16a6:	89 fa                	mov    %edi,%edx
    16a8:	8b 45 08             	mov    0x8(%ebp),%eax
    16ab:	e8 07 fe ff ff       	call   14b7 <putc>
      state = 0;
    16b0:	be 00 00 00 00       	mov    $0x0,%esi
    16b5:	e9 ce fe ff ff       	jmp    1588 <printf+0x2c>
    }
  }
}
    16ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16bd:	5b                   	pop    %ebx
    16be:	5e                   	pop    %esi
    16bf:	5f                   	pop    %edi
    16c0:	5d                   	pop    %ebp
    16c1:	c3                   	ret    

000016c2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16c2:	55                   	push   %ebp
    16c3:	89 e5                	mov    %esp,%ebp
    16c5:	57                   	push   %edi
    16c6:	56                   	push   %esi
    16c7:	53                   	push   %ebx
    16c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16cb:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16ce:	a1 24 1c 00 00       	mov    0x1c24,%eax
    16d3:	eb 02                	jmp    16d7 <free+0x15>
    16d5:	89 d0                	mov    %edx,%eax
    16d7:	39 c8                	cmp    %ecx,%eax
    16d9:	73 04                	jae    16df <free+0x1d>
    16db:	39 08                	cmp    %ecx,(%eax)
    16dd:	77 12                	ja     16f1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16df:	8b 10                	mov    (%eax),%edx
    16e1:	39 c2                	cmp    %eax,%edx
    16e3:	77 f0                	ja     16d5 <free+0x13>
    16e5:	39 c8                	cmp    %ecx,%eax
    16e7:	72 08                	jb     16f1 <free+0x2f>
    16e9:	39 ca                	cmp    %ecx,%edx
    16eb:	77 04                	ja     16f1 <free+0x2f>
    16ed:	89 d0                	mov    %edx,%eax
    16ef:	eb e6                	jmp    16d7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16f1:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16f4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16f7:	8b 10                	mov    (%eax),%edx
    16f9:	39 d7                	cmp    %edx,%edi
    16fb:	74 19                	je     1716 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1700:	8b 50 04             	mov    0x4(%eax),%edx
    1703:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1706:	39 ce                	cmp    %ecx,%esi
    1708:	74 1b                	je     1725 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    170a:	89 08                	mov    %ecx,(%eax)
  freep = p;
    170c:	a3 24 1c 00 00       	mov    %eax,0x1c24
}
    1711:	5b                   	pop    %ebx
    1712:	5e                   	pop    %esi
    1713:	5f                   	pop    %edi
    1714:	5d                   	pop    %ebp
    1715:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    1716:	03 72 04             	add    0x4(%edx),%esi
    1719:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    171c:	8b 10                	mov    (%eax),%edx
    171e:	8b 12                	mov    (%edx),%edx
    1720:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1723:	eb db                	jmp    1700 <free+0x3e>
    p->s.size += bp->s.size;
    1725:	03 53 fc             	add    -0x4(%ebx),%edx
    1728:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    172b:	8b 53 f8             	mov    -0x8(%ebx),%edx
    172e:	89 10                	mov    %edx,(%eax)
    1730:	eb da                	jmp    170c <free+0x4a>

00001732 <morecore>:

static Header*
morecore(uint nu)
{
    1732:	55                   	push   %ebp
    1733:	89 e5                	mov    %esp,%ebp
    1735:	53                   	push   %ebx
    1736:	83 ec 04             	sub    $0x4,%esp
    1739:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    173b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    1740:	77 05                	ja     1747 <morecore+0x15>
    nu = 4096;
    1742:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    1747:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    174e:	83 ec 0c             	sub    $0xc,%esp
    1751:	50                   	push   %eax
    1752:	e8 28 fd ff ff       	call   147f <sbrk>
  if(p == (char*)-1)
    1757:	83 c4 10             	add    $0x10,%esp
    175a:	83 f8 ff             	cmp    $0xffffffff,%eax
    175d:	74 1c                	je     177b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    175f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1762:	83 c0 08             	add    $0x8,%eax
    1765:	83 ec 0c             	sub    $0xc,%esp
    1768:	50                   	push   %eax
    1769:	e8 54 ff ff ff       	call   16c2 <free>
  return freep;
    176e:	a1 24 1c 00 00       	mov    0x1c24,%eax
    1773:	83 c4 10             	add    $0x10,%esp
}
    1776:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1779:	c9                   	leave  
    177a:	c3                   	ret    
    return 0;
    177b:	b8 00 00 00 00       	mov    $0x0,%eax
    1780:	eb f4                	jmp    1776 <morecore+0x44>

00001782 <malloc>:

void*
malloc(uint nbytes)
{
    1782:	55                   	push   %ebp
    1783:	89 e5                	mov    %esp,%ebp
    1785:	53                   	push   %ebx
    1786:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1789:	8b 45 08             	mov    0x8(%ebp),%eax
    178c:	8d 58 07             	lea    0x7(%eax),%ebx
    178f:	c1 eb 03             	shr    $0x3,%ebx
    1792:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    1795:	8b 0d 24 1c 00 00    	mov    0x1c24,%ecx
    179b:	85 c9                	test   %ecx,%ecx
    179d:	74 04                	je     17a3 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    179f:	8b 01                	mov    (%ecx),%eax
    17a1:	eb 4a                	jmp    17ed <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
    17a3:	c7 05 24 1c 00 00 28 	movl   $0x1c28,0x1c24
    17aa:	1c 00 00 
    17ad:	c7 05 28 1c 00 00 28 	movl   $0x1c28,0x1c28
    17b4:	1c 00 00 
    base.s.size = 0;
    17b7:	c7 05 2c 1c 00 00 00 	movl   $0x0,0x1c2c
    17be:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    17c1:	b9 28 1c 00 00       	mov    $0x1c28,%ecx
    17c6:	eb d7                	jmp    179f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    17c8:	74 19                	je     17e3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    17ca:	29 da                	sub    %ebx,%edx
    17cc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    17cf:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    17d2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    17d5:	89 0d 24 1c 00 00    	mov    %ecx,0x1c24
      return (void*)(p + 1);
    17db:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    17de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    17e1:	c9                   	leave  
    17e2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    17e3:	8b 10                	mov    (%eax),%edx
    17e5:	89 11                	mov    %edx,(%ecx)
    17e7:	eb ec                	jmp    17d5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17e9:	89 c1                	mov    %eax,%ecx
    17eb:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    17ed:	8b 50 04             	mov    0x4(%eax),%edx
    17f0:	39 da                	cmp    %ebx,%edx
    17f2:	73 d4                	jae    17c8 <malloc+0x46>
    if(p == freep)
    17f4:	39 05 24 1c 00 00    	cmp    %eax,0x1c24
    17fa:	75 ed                	jne    17e9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
    17fc:	89 d8                	mov    %ebx,%eax
    17fe:	e8 2f ff ff ff       	call   1732 <morecore>
    1803:	85 c0                	test   %eax,%eax
    1805:	75 e2                	jne    17e9 <malloc+0x67>
    1807:	eb d5                	jmp    17de <malloc+0x5c>
