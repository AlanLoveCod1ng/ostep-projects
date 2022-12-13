
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	8b 75 08             	mov    0x8(%ebp),%esi
   c:	8b 7d 0c             	mov    0xc(%ebp),%edi
   f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  12:	83 ec 08             	sub    $0x8,%esp
  15:	53                   	push   %ebx
  16:	57                   	push   %edi
  17:	e8 2c 00 00 00       	call   48 <matchhere>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	85 c0                	test   %eax,%eax
  21:	75 18                	jne    3b <matchstar+0x3b>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  23:	0f b6 13             	movzbl (%ebx),%edx
  26:	84 d2                	test   %dl,%dl
  28:	74 16                	je     40 <matchstar+0x40>
  2a:	83 c3 01             	add    $0x1,%ebx
  2d:	0f be d2             	movsbl %dl,%edx
  30:	39 f2                	cmp    %esi,%edx
  32:	74 de                	je     12 <matchstar+0x12>
  34:	83 fe 2e             	cmp    $0x2e,%esi
  37:	74 d9                	je     12 <matchstar+0x12>
  39:	eb 05                	jmp    40 <matchstar+0x40>
      return 1;
  3b:	b8 01 00 00 00       	mov    $0x1,%eax
  return 0;
}
  40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  43:	5b                   	pop    %ebx
  44:	5e                   	pop    %esi
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <matchhere>:
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	8b 55 08             	mov    0x8(%ebp),%edx
  if(re[0] == '\0')
  51:	0f b6 02             	movzbl (%edx),%eax
  54:	84 c0                	test   %al,%al
  56:	74 68                	je     c0 <matchhere+0x78>
  if(re[1] == '*')
  58:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
  5c:	80 f9 2a             	cmp    $0x2a,%cl
  5f:	74 1d                	je     7e <matchhere+0x36>
  if(re[0] == '$' && re[1] == '\0')
  61:	3c 24                	cmp    $0x24,%al
  63:	74 31                	je     96 <matchhere+0x4e>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  65:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  68:	0f b6 09             	movzbl (%ecx),%ecx
  6b:	84 c9                	test   %cl,%cl
  6d:	74 58                	je     c7 <matchhere+0x7f>
  6f:	3c 2e                	cmp    $0x2e,%al
  71:	74 35                	je     a8 <matchhere+0x60>
  73:	38 c8                	cmp    %cl,%al
  75:	74 31                	je     a8 <matchhere+0x60>
  return 0;
  77:	b8 00 00 00 00       	mov    $0x0,%eax
  7c:	eb 47                	jmp    c5 <matchhere+0x7d>
    return matchstar(re[0], re+2, text);
  7e:	83 ec 04             	sub    $0x4,%esp
  81:	ff 75 0c             	push   0xc(%ebp)
  84:	83 c2 02             	add    $0x2,%edx
  87:	52                   	push   %edx
  88:	0f be c0             	movsbl %al,%eax
  8b:	50                   	push   %eax
  8c:	e8 6f ff ff ff       	call   0 <matchstar>
  91:	83 c4 10             	add    $0x10,%esp
  94:	eb 2f                	jmp    c5 <matchhere+0x7d>
  if(re[0] == '$' && re[1] == '\0')
  96:	84 c9                	test   %cl,%cl
  98:	75 cb                	jne    65 <matchhere+0x1d>
    return *text == '\0';
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	80 38 00             	cmpb   $0x0,(%eax)
  a0:	0f 94 c0             	sete   %al
  a3:	0f b6 c0             	movzbl %al,%eax
  a6:	eb 1d                	jmp    c5 <matchhere+0x7d>
    return matchhere(re+1, text+1);
  a8:	83 ec 08             	sub    $0x8,%esp
  ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  ae:	83 c0 01             	add    $0x1,%eax
  b1:	50                   	push   %eax
  b2:	83 c2 01             	add    $0x1,%edx
  b5:	52                   	push   %edx
  b6:	e8 8d ff ff ff       	call   48 <matchhere>
  bb:	83 c4 10             	add    $0x10,%esp
  be:	eb 05                	jmp    c5 <matchhere+0x7d>
    return 1;
  c0:	b8 01 00 00 00       	mov    $0x1,%eax
}
  c5:	c9                   	leave  
  c6:	c3                   	ret    
  return 0;
  c7:	b8 00 00 00 00       	mov    $0x0,%eax
  cc:	eb f7                	jmp    c5 <matchhere+0x7d>

000000ce <match>:
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	56                   	push   %esi
  d2:	53                   	push   %ebx
  d3:	8b 75 08             	mov    0x8(%ebp),%esi
  d6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
  d9:	80 3e 5e             	cmpb   $0x5e,(%esi)
  dc:	75 14                	jne    f2 <match+0x24>
    return matchhere(re+1, text);
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	53                   	push   %ebx
  e2:	83 c6 01             	add    $0x1,%esi
  e5:	56                   	push   %esi
  e6:	e8 5d ff ff ff       	call   48 <matchhere>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	eb 22                	jmp    112 <match+0x44>
  }while(*text++ != '\0');
  f0:	89 d3                	mov    %edx,%ebx
    if(matchhere(re, text))
  f2:	83 ec 08             	sub    $0x8,%esp
  f5:	53                   	push   %ebx
  f6:	56                   	push   %esi
  f7:	e8 4c ff ff ff       	call   48 <matchhere>
  fc:	83 c4 10             	add    $0x10,%esp
  ff:	85 c0                	test   %eax,%eax
 101:	75 0a                	jne    10d <match+0x3f>
  }while(*text++ != '\0');
 103:	8d 53 01             	lea    0x1(%ebx),%edx
 106:	80 3b 00             	cmpb   $0x0,(%ebx)
 109:	75 e5                	jne    f0 <match+0x22>
 10b:	eb 05                	jmp    112 <match+0x44>
      return 1;
 10d:	b8 01 00 00 00       	mov    $0x1,%eax
}
 112:	8d 65 f8             	lea    -0x8(%ebp),%esp
 115:	5b                   	pop    %ebx
 116:	5e                   	pop    %esi
 117:	5d                   	pop    %ebp
 118:	c3                   	ret    

00000119 <grep>:
{
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	57                   	push   %edi
 11d:	56                   	push   %esi
 11e:	53                   	push   %ebx
 11f:	83 ec 1c             	sub    $0x1c,%esp
 122:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 125:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 12c:	eb 53                	jmp    181 <grep+0x68>
      p = q+1;
 12e:	8d 73 01             	lea    0x1(%ebx),%esi
    while((q = strchr(p, '\n')) != 0){
 131:	83 ec 08             	sub    $0x8,%esp
 134:	6a 0a                	push   $0xa
 136:	56                   	push   %esi
 137:	e8 e1 01 00 00       	call   31d <strchr>
 13c:	89 c3                	mov    %eax,%ebx
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	74 2d                	je     172 <grep+0x59>
      *q = 0;
 145:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 148:	83 ec 08             	sub    $0x8,%esp
 14b:	56                   	push   %esi
 14c:	57                   	push   %edi
 14d:	e8 7c ff ff ff       	call   ce <match>
 152:	83 c4 10             	add    $0x10,%esp
 155:	85 c0                	test   %eax,%eax
 157:	74 d5                	je     12e <grep+0x15>
        *q = '\n';
 159:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 15c:	8d 43 01             	lea    0x1(%ebx),%eax
 15f:	83 ec 04             	sub    $0x4,%esp
 162:	29 f0                	sub    %esi,%eax
 164:	50                   	push   %eax
 165:	56                   	push   %esi
 166:	6a 01                	push   $0x1
 168:	e8 8b 03 00 00       	call   4f8 <write>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	eb bc                	jmp    12e <grep+0x15>
    if(p == buf)
 172:	81 fe 80 0d 00 00    	cmp    $0xd80,%esi
 178:	74 62                	je     1dc <grep+0xc3>
    if(m > 0){
 17a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 17d:	85 c9                	test   %ecx,%ecx
 17f:	7f 3b                	jg     1bc <grep+0xa3>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 181:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 186:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 189:	29 c8                	sub    %ecx,%eax
 18b:	83 ec 04             	sub    $0x4,%esp
 18e:	50                   	push   %eax
 18f:	8d 81 80 0d 00 00    	lea    0xd80(%ecx),%eax
 195:	50                   	push   %eax
 196:	ff 75 0c             	push   0xc(%ebp)
 199:	e8 52 03 00 00       	call   4f0 <read>
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	85 c0                	test   %eax,%eax
 1a3:	7e 40                	jle    1e5 <grep+0xcc>
    m += n;
 1a5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1ab:	c6 82 80 0d 00 00 00 	movb   $0x0,0xd80(%edx)
    p = buf;
 1b2:	be 80 0d 00 00       	mov    $0xd80,%esi
    while((q = strchr(p, '\n')) != 0){
 1b7:	e9 75 ff ff ff       	jmp    131 <grep+0x18>
      m -= p - buf;
 1bc:	89 f0                	mov    %esi,%eax
 1be:	2d 80 0d 00 00       	sub    $0xd80,%eax
 1c3:	29 c1                	sub    %eax,%ecx
 1c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1c8:	83 ec 04             	sub    $0x4,%esp
 1cb:	51                   	push   %ecx
 1cc:	56                   	push   %esi
 1cd:	68 80 0d 00 00       	push   $0xd80
 1d2:	e8 34 02 00 00       	call   40b <memmove>
 1d7:	83 c4 10             	add    $0x10,%esp
 1da:	eb a5                	jmp    181 <grep+0x68>
      m = 0;
 1dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1e3:	eb 9c                	jmp    181 <grep+0x68>
}
 1e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e8:	5b                   	pop    %ebx
 1e9:	5e                   	pop    %esi
 1ea:	5f                   	pop    %edi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    

000001ed <main>:
{
 1ed:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 1f1:	83 e4 f0             	and    $0xfffffff0,%esp
 1f4:	ff 71 fc             	push   -0x4(%ecx)
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	57                   	push   %edi
 1fb:	56                   	push   %esi
 1fc:	53                   	push   %ebx
 1fd:	51                   	push   %ecx
 1fe:	83 ec 18             	sub    $0x18,%esp
 201:	8b 01                	mov    (%ecx),%eax
 203:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 206:	8b 51 04             	mov    0x4(%ecx),%edx
 209:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(argc <= 1){
 20c:	83 f8 01             	cmp    $0x1,%eax
 20f:	7e 50                	jle    261 <main+0x74>
  pattern = argv[1];
 211:	8b 45 e0             	mov    -0x20(%ebp),%eax
 214:	8b 40 04             	mov    0x4(%eax),%eax
 217:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(argc <= 2){
 21a:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 21e:	7e 55                	jle    275 <main+0x88>
  for(i = 2; i < argc; i++){
 220:	be 02 00 00 00       	mov    $0x2,%esi
 225:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 228:	7d 71                	jge    29b <main+0xae>
    if((fd = open(argv[i], 0)) < 0){
 22a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22d:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 00                	push   $0x0
 235:	ff 37                	push   (%edi)
 237:	e8 dc 02 00 00       	call   518 <open>
 23c:	89 c3                	mov    %eax,%ebx
 23e:	83 c4 10             	add    $0x10,%esp
 241:	85 c0                	test   %eax,%eax
 243:	78 40                	js     285 <main+0x98>
    grep(pattern, fd);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	50                   	push   %eax
 249:	ff 75 dc             	push   -0x24(%ebp)
 24c:	e8 c8 fe ff ff       	call   119 <grep>
    close(fd);
 251:	89 1c 24             	mov    %ebx,(%esp)
 254:	e8 a7 02 00 00       	call   500 <close>
  for(i = 2; i < argc; i++){
 259:	83 c6 01             	add    $0x1,%esi
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	eb c4                	jmp    225 <main+0x38>
    printf(2, "usage: grep pattern [file ...]\n");
 261:	83 ec 08             	sub    $0x8,%esp
 264:	68 dc 08 00 00       	push   $0x8dc
 269:	6a 02                	push   $0x2
 26b:	e8 bd 03 00 00       	call   62d <printf>
    exit();
 270:	e8 63 02 00 00       	call   4d8 <exit>
    grep(pattern, 0);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	50                   	push   %eax
 27b:	e8 99 fe ff ff       	call   119 <grep>
    exit();
 280:	e8 53 02 00 00       	call   4d8 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 285:	83 ec 04             	sub    $0x4,%esp
 288:	ff 37                	push   (%edi)
 28a:	68 fc 08 00 00       	push   $0x8fc
 28f:	6a 01                	push   $0x1
 291:	e8 97 03 00 00       	call   62d <printf>
      exit();
 296:	e8 3d 02 00 00       	call   4d8 <exit>
  exit();
 29b:	e8 38 02 00 00       	call   4d8 <exit>

000002a0 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
 2a5:	8b 75 08             	mov    0x8(%ebp),%esi
 2a8:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ab:	89 f0                	mov    %esi,%eax
 2ad:	89 d1                	mov    %edx,%ecx
 2af:	83 c2 01             	add    $0x1,%edx
 2b2:	89 c3                	mov    %eax,%ebx
 2b4:	83 c0 01             	add    $0x1,%eax
 2b7:	0f b6 09             	movzbl (%ecx),%ecx
 2ba:	88 0b                	mov    %cl,(%ebx)
 2bc:	84 c9                	test   %cl,%cl
 2be:	75 ed                	jne    2ad <strcpy+0xd>
    ;
  return os;
}
 2c0:	89 f0                	mov    %esi,%eax
 2c2:	5b                   	pop    %ebx
 2c3:	5e                   	pop    %esi
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2cf:	eb 06                	jmp    2d7 <strcmp+0x11>
    p++, q++;
 2d1:	83 c1 01             	add    $0x1,%ecx
 2d4:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2d7:	0f b6 01             	movzbl (%ecx),%eax
 2da:	84 c0                	test   %al,%al
 2dc:	74 04                	je     2e2 <strcmp+0x1c>
 2de:	3a 02                	cmp    (%edx),%al
 2e0:	74 ef                	je     2d1 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2e2:	0f b6 c0             	movzbl %al,%eax
 2e5:	0f b6 12             	movzbl (%edx),%edx
 2e8:	29 d0                	sub    %edx,%eax
}
 2ea:	5d                   	pop    %ebp
 2eb:	c3                   	ret    

000002ec <strlen>:

uint
strlen(const char *s)
{
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2f2:	b8 00 00 00 00       	mov    $0x0,%eax
 2f7:	eb 03                	jmp    2fc <strlen+0x10>
 2f9:	83 c0 01             	add    $0x1,%eax
 2fc:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 300:	75 f7                	jne    2f9 <strlen+0xd>
    ;
  return n;
}
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <memset>:

void*
memset(void *dst, int c, uint n)
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	57                   	push   %edi
 308:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 30b:	89 d7                	mov    %edx,%edi
 30d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 310:	8b 45 0c             	mov    0xc(%ebp),%eax
 313:	fc                   	cld    
 314:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 316:	89 d0                	mov    %edx,%eax
 318:	8b 7d fc             	mov    -0x4(%ebp),%edi
 31b:	c9                   	leave  
 31c:	c3                   	ret    

0000031d <strchr>:

char*
strchr(const char *s, char c)
{
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	8b 45 08             	mov    0x8(%ebp),%eax
 323:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 327:	eb 03                	jmp    32c <strchr+0xf>
 329:	83 c0 01             	add    $0x1,%eax
 32c:	0f b6 10             	movzbl (%eax),%edx
 32f:	84 d2                	test   %dl,%dl
 331:	74 06                	je     339 <strchr+0x1c>
    if(*s == c)
 333:	38 ca                	cmp    %cl,%dl
 335:	75 f2                	jne    329 <strchr+0xc>
 337:	eb 05                	jmp    33e <strchr+0x21>
      return (char*)s;
  return 0;
 339:	b8 00 00 00 00       	mov    $0x0,%eax
}
 33e:	5d                   	pop    %ebp
 33f:	c3                   	ret    

00000340 <gets>:

char*
gets(char *buf, int max)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
 346:	83 ec 1c             	sub    $0x1c,%esp
 349:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 34c:	bb 00 00 00 00       	mov    $0x0,%ebx
 351:	89 de                	mov    %ebx,%esi
 353:	83 c3 01             	add    $0x1,%ebx
 356:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 359:	7d 2e                	jge    389 <gets+0x49>
    cc = read(0, &c, 1);
 35b:	83 ec 04             	sub    $0x4,%esp
 35e:	6a 01                	push   $0x1
 360:	8d 45 e7             	lea    -0x19(%ebp),%eax
 363:	50                   	push   %eax
 364:	6a 00                	push   $0x0
 366:	e8 85 01 00 00       	call   4f0 <read>
    if(cc < 1)
 36b:	83 c4 10             	add    $0x10,%esp
 36e:	85 c0                	test   %eax,%eax
 370:	7e 17                	jle    389 <gets+0x49>
      break;
    buf[i++] = c;
 372:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 376:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 379:	3c 0a                	cmp    $0xa,%al
 37b:	0f 94 c2             	sete   %dl
 37e:	3c 0d                	cmp    $0xd,%al
 380:	0f 94 c0             	sete   %al
 383:	08 c2                	or     %al,%dl
 385:	74 ca                	je     351 <gets+0x11>
    buf[i++] = c;
 387:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 389:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 38d:	89 f8                	mov    %edi,%eax
 38f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 392:	5b                   	pop    %ebx
 393:	5e                   	pop    %esi
 394:	5f                   	pop    %edi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    

00000397 <stat>:

int
stat(const char *n, struct stat *st)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	56                   	push   %esi
 39b:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 39c:	83 ec 08             	sub    $0x8,%esp
 39f:	6a 00                	push   $0x0
 3a1:	ff 75 08             	push   0x8(%ebp)
 3a4:	e8 6f 01 00 00       	call   518 <open>
  if(fd < 0)
 3a9:	83 c4 10             	add    $0x10,%esp
 3ac:	85 c0                	test   %eax,%eax
 3ae:	78 24                	js     3d4 <stat+0x3d>
 3b0:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3b2:	83 ec 08             	sub    $0x8,%esp
 3b5:	ff 75 0c             	push   0xc(%ebp)
 3b8:	50                   	push   %eax
 3b9:	e8 72 01 00 00       	call   530 <fstat>
 3be:	89 c6                	mov    %eax,%esi
  close(fd);
 3c0:	89 1c 24             	mov    %ebx,(%esp)
 3c3:	e8 38 01 00 00       	call   500 <close>
  return r;
 3c8:	83 c4 10             	add    $0x10,%esp
}
 3cb:	89 f0                	mov    %esi,%eax
 3cd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3d0:	5b                   	pop    %ebx
 3d1:	5e                   	pop    %esi
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
    return -1;
 3d4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d9:	eb f0                	jmp    3cb <stat+0x34>

000003db <atoi>:

int
atoi(const char *s)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	53                   	push   %ebx
 3df:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3e2:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3e7:	eb 10                	jmp    3f9 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3e9:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3ec:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ef:	83 c1 01             	add    $0x1,%ecx
 3f2:	0f be c0             	movsbl %al,%eax
 3f5:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3f9:	0f b6 01             	movzbl (%ecx),%eax
 3fc:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3ff:	80 fb 09             	cmp    $0x9,%bl
 402:	76 e5                	jbe    3e9 <atoi+0xe>
  return n;
}
 404:	89 d0                	mov    %edx,%eax
 406:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 409:	c9                   	leave  
 40a:	c3                   	ret    

0000040b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	56                   	push   %esi
 40f:	53                   	push   %ebx
 410:	8b 75 08             	mov    0x8(%ebp),%esi
 413:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 416:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 419:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 41b:	eb 0d                	jmp    42a <memmove+0x1f>
    *dst++ = *src++;
 41d:	0f b6 01             	movzbl (%ecx),%eax
 420:	88 02                	mov    %al,(%edx)
 422:	8d 49 01             	lea    0x1(%ecx),%ecx
 425:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 428:	89 d8                	mov    %ebx,%eax
 42a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 42d:	85 c0                	test   %eax,%eax
 42f:	7f ec                	jg     41d <memmove+0x12>
  return vdst;
}
 431:	89 f0                	mov    %esi,%eax
 433:	5b                   	pop    %ebx
 434:	5e                   	pop    %esi
 435:	5d                   	pop    %ebp
 436:	c3                   	ret    

00000437 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 43d:	68 00 20 00 00       	push   $0x2000
 442:	e8 0c 04 00 00       	call   853 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 447:	83 c4 10             	add    $0x10,%esp
 44a:	a9 ff 0f 00 00       	test   $0xfff,%eax
 44f:	74 0a                	je     45b <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 451:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 456:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 45b:	50                   	push   %eax
 45c:	ff 75 10             	push   0x10(%ebp)
 45f:	ff 75 0c             	push   0xc(%ebp)
 462:	ff 75 08             	push   0x8(%ebp)
 465:	e8 0e 01 00 00       	call   578 <clone>
  return pid;
}
 46a:	c9                   	leave  
 46b:	c3                   	ret    

0000046c <thread_join>:
int
thread_join()
{
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	53                   	push   %ebx
 470:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 473:	8d 45 f4             	lea    -0xc(%ebp),%eax
 476:	50                   	push   %eax
 477:	e8 04 01 00 00       	call   580 <join>
 47c:	89 c3                	mov    %eax,%ebx
  free(stack);
 47e:	83 c4 04             	add    $0x4,%esp
 481:	ff 75 f4             	push   -0xc(%ebp)
 484:	e8 0a 03 00 00       	call   793 <free>
  return pid;
}
 489:	89 d8                	mov    %ebx,%eax
 48b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 48e:	c9                   	leave  
 48f:	c3                   	ret    

00000490 <lock_init>:
int
lock_init(lock_t * lock){
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 493:	8b 45 08             	mov    0x8(%ebp),%eax
 496:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 49c:	b8 00 00 00 00       	mov    $0x0,%eax
 4a1:	5d                   	pop    %ebp
 4a2:	c3                   	ret    

000004a3 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
 4a6:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4a9:	b8 01 00 00 00       	mov    $0x1,%eax
 4ae:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 4b1:	83 f8 01             	cmp    $0x1,%eax
 4b4:	74 f3                	je     4a9 <lock_acquire+0x6>
  {

  }
  return 0;
}
 4b6:	b8 00 00 00 00       	mov    $0x0,%eax
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    

000004bd <lock_release>:
int
lock_release(lock_t * lock){
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4c0:	8b 45 08             	mov    0x8(%ebp),%eax
 4c3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 4c9:	b8 00 00 00 00       	mov    $0x0,%eax
 4ce:	5d                   	pop    %ebp
 4cf:	c3                   	ret    

000004d0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4d0:	b8 01 00 00 00       	mov    $0x1,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <exit>:
SYSCALL(exit)
 4d8:	b8 02 00 00 00       	mov    $0x2,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <wait>:
SYSCALL(wait)
 4e0:	b8 03 00 00 00       	mov    $0x3,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <pipe>:
SYSCALL(pipe)
 4e8:	b8 04 00 00 00       	mov    $0x4,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <read>:
SYSCALL(read)
 4f0:	b8 05 00 00 00       	mov    $0x5,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <write>:
SYSCALL(write)
 4f8:	b8 10 00 00 00       	mov    $0x10,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <close>:
SYSCALL(close)
 500:	b8 15 00 00 00       	mov    $0x15,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <kill>:
SYSCALL(kill)
 508:	b8 06 00 00 00       	mov    $0x6,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <exec>:
SYSCALL(exec)
 510:	b8 07 00 00 00       	mov    $0x7,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <open>:
SYSCALL(open)
 518:	b8 0f 00 00 00       	mov    $0xf,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <mknod>:
SYSCALL(mknod)
 520:	b8 11 00 00 00       	mov    $0x11,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <unlink>:
SYSCALL(unlink)
 528:	b8 12 00 00 00       	mov    $0x12,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <fstat>:
SYSCALL(fstat)
 530:	b8 08 00 00 00       	mov    $0x8,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <link>:
SYSCALL(link)
 538:	b8 13 00 00 00       	mov    $0x13,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <mkdir>:
SYSCALL(mkdir)
 540:	b8 14 00 00 00       	mov    $0x14,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <chdir>:
SYSCALL(chdir)
 548:	b8 09 00 00 00       	mov    $0x9,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <dup>:
SYSCALL(dup)
 550:	b8 0a 00 00 00       	mov    $0xa,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <getpid>:
SYSCALL(getpid)
 558:	b8 0b 00 00 00       	mov    $0xb,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <sbrk>:
SYSCALL(sbrk)
 560:	b8 0c 00 00 00       	mov    $0xc,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <sleep>:
SYSCALL(sleep)
 568:	b8 0d 00 00 00       	mov    $0xd,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <uptime>:
SYSCALL(uptime)
 570:	b8 0e 00 00 00       	mov    $0xe,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <clone>:
SYSCALL(clone)
 578:	b8 16 00 00 00       	mov    $0x16,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <join>:
SYSCALL(join)
 580:	b8 17 00 00 00       	mov    $0x17,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	83 ec 1c             	sub    $0x1c,%esp
 58e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 591:	6a 01                	push   $0x1
 593:	8d 55 f4             	lea    -0xc(%ebp),%edx
 596:	52                   	push   %edx
 597:	50                   	push   %eax
 598:	e8 5b ff ff ff       	call   4f8 <write>
}
 59d:	83 c4 10             	add    $0x10,%esp
 5a0:	c9                   	leave  
 5a1:	c3                   	ret    

000005a2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5a2:	55                   	push   %ebp
 5a3:	89 e5                	mov    %esp,%ebp
 5a5:	57                   	push   %edi
 5a6:	56                   	push   %esi
 5a7:	53                   	push   %ebx
 5a8:	83 ec 2c             	sub    $0x2c,%esp
 5ab:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5ae:	89 d0                	mov    %edx,%eax
 5b0:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5b2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5b6:	0f 95 c1             	setne  %cl
 5b9:	c1 ea 1f             	shr    $0x1f,%edx
 5bc:	84 d1                	test   %dl,%cl
 5be:	74 44                	je     604 <printint+0x62>
    neg = 1;
    x = -xx;
 5c0:	f7 d8                	neg    %eax
 5c2:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5c4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5cb:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5d0:	89 c8                	mov    %ecx,%eax
 5d2:	ba 00 00 00 00       	mov    $0x0,%edx
 5d7:	f7 f6                	div    %esi
 5d9:	89 df                	mov    %ebx,%edi
 5db:	83 c3 01             	add    $0x1,%ebx
 5de:	0f b6 92 74 09 00 00 	movzbl 0x974(%edx),%edx
 5e5:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5e9:	89 ca                	mov    %ecx,%edx
 5eb:	89 c1                	mov    %eax,%ecx
 5ed:	39 d6                	cmp    %edx,%esi
 5ef:	76 df                	jbe    5d0 <printint+0x2e>
  if(neg)
 5f1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5f5:	74 31                	je     628 <printint+0x86>
    buf[i++] = '-';
 5f7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5fc:	8d 5f 02             	lea    0x2(%edi),%ebx
 5ff:	8b 75 d0             	mov    -0x30(%ebp),%esi
 602:	eb 17                	jmp    61b <printint+0x79>
    x = xx;
 604:	89 c1                	mov    %eax,%ecx
  neg = 0;
 606:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 60d:	eb bc                	jmp    5cb <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 60f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 614:	89 f0                	mov    %esi,%eax
 616:	e8 6d ff ff ff       	call   588 <putc>
  while(--i >= 0)
 61b:	83 eb 01             	sub    $0x1,%ebx
 61e:	79 ef                	jns    60f <printint+0x6d>
}
 620:	83 c4 2c             	add    $0x2c,%esp
 623:	5b                   	pop    %ebx
 624:	5e                   	pop    %esi
 625:	5f                   	pop    %edi
 626:	5d                   	pop    %ebp
 627:	c3                   	ret    
 628:	8b 75 d0             	mov    -0x30(%ebp),%esi
 62b:	eb ee                	jmp    61b <printint+0x79>

0000062d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 62d:	55                   	push   %ebp
 62e:	89 e5                	mov    %esp,%ebp
 630:	57                   	push   %edi
 631:	56                   	push   %esi
 632:	53                   	push   %ebx
 633:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 636:	8d 45 10             	lea    0x10(%ebp),%eax
 639:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 63c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 641:	bb 00 00 00 00       	mov    $0x0,%ebx
 646:	eb 14                	jmp    65c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 648:	89 fa                	mov    %edi,%edx
 64a:	8b 45 08             	mov    0x8(%ebp),%eax
 64d:	e8 36 ff ff ff       	call   588 <putc>
 652:	eb 05                	jmp    659 <printf+0x2c>
      }
    } else if(state == '%'){
 654:	83 fe 25             	cmp    $0x25,%esi
 657:	74 25                	je     67e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 659:	83 c3 01             	add    $0x1,%ebx
 65c:	8b 45 0c             	mov    0xc(%ebp),%eax
 65f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 663:	84 c0                	test   %al,%al
 665:	0f 84 20 01 00 00    	je     78b <printf+0x15e>
    c = fmt[i] & 0xff;
 66b:	0f be f8             	movsbl %al,%edi
 66e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 671:	85 f6                	test   %esi,%esi
 673:	75 df                	jne    654 <printf+0x27>
      if(c == '%'){
 675:	83 f8 25             	cmp    $0x25,%eax
 678:	75 ce                	jne    648 <printf+0x1b>
        state = '%';
 67a:	89 c6                	mov    %eax,%esi
 67c:	eb db                	jmp    659 <printf+0x2c>
      if(c == 'd'){
 67e:	83 f8 25             	cmp    $0x25,%eax
 681:	0f 84 cf 00 00 00    	je     756 <printf+0x129>
 687:	0f 8c dd 00 00 00    	jl     76a <printf+0x13d>
 68d:	83 f8 78             	cmp    $0x78,%eax
 690:	0f 8f d4 00 00 00    	jg     76a <printf+0x13d>
 696:	83 f8 63             	cmp    $0x63,%eax
 699:	0f 8c cb 00 00 00    	jl     76a <printf+0x13d>
 69f:	83 e8 63             	sub    $0x63,%eax
 6a2:	83 f8 15             	cmp    $0x15,%eax
 6a5:	0f 87 bf 00 00 00    	ja     76a <printf+0x13d>
 6ab:	ff 24 85 1c 09 00 00 	jmp    *0x91c(,%eax,4)
        printint(fd, *ap, 10, 1);
 6b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b5:	8b 17                	mov    (%edi),%edx
 6b7:	83 ec 0c             	sub    $0xc,%esp
 6ba:	6a 01                	push   $0x1
 6bc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c1:	8b 45 08             	mov    0x8(%ebp),%eax
 6c4:	e8 d9 fe ff ff       	call   5a2 <printint>
        ap++;
 6c9:	83 c7 04             	add    $0x4,%edi
 6cc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6cf:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6d2:	be 00 00 00 00       	mov    $0x0,%esi
 6d7:	eb 80                	jmp    659 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6d9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6dc:	8b 17                	mov    (%edi),%edx
 6de:	83 ec 0c             	sub    $0xc,%esp
 6e1:	6a 00                	push   $0x0
 6e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	e8 b2 fe ff ff       	call   5a2 <printint>
        ap++;
 6f0:	83 c7 04             	add    $0x4,%edi
 6f3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f9:	be 00 00 00 00       	mov    $0x0,%esi
 6fe:	e9 56 ff ff ff       	jmp    659 <printf+0x2c>
        s = (char*)*ap;
 703:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 706:	8b 30                	mov    (%eax),%esi
        ap++;
 708:	83 c0 04             	add    $0x4,%eax
 70b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 70e:	85 f6                	test   %esi,%esi
 710:	75 15                	jne    727 <printf+0xfa>
          s = "(null)";
 712:	be 12 09 00 00       	mov    $0x912,%esi
 717:	eb 0e                	jmp    727 <printf+0xfa>
          putc(fd, *s);
 719:	0f be d2             	movsbl %dl,%edx
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	e8 64 fe ff ff       	call   588 <putc>
          s++;
 724:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 727:	0f b6 16             	movzbl (%esi),%edx
 72a:	84 d2                	test   %dl,%dl
 72c:	75 eb                	jne    719 <printf+0xec>
      state = 0;
 72e:	be 00 00 00 00       	mov    $0x0,%esi
 733:	e9 21 ff ff ff       	jmp    659 <printf+0x2c>
        putc(fd, *ap);
 738:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 73b:	0f be 17             	movsbl (%edi),%edx
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	e8 42 fe ff ff       	call   588 <putc>
        ap++;
 746:	83 c7 04             	add    $0x4,%edi
 749:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 74c:	be 00 00 00 00       	mov    $0x0,%esi
 751:	e9 03 ff ff ff       	jmp    659 <printf+0x2c>
        putc(fd, c);
 756:	89 fa                	mov    %edi,%edx
 758:	8b 45 08             	mov    0x8(%ebp),%eax
 75b:	e8 28 fe ff ff       	call   588 <putc>
      state = 0;
 760:	be 00 00 00 00       	mov    $0x0,%esi
 765:	e9 ef fe ff ff       	jmp    659 <printf+0x2c>
        putc(fd, '%');
 76a:	ba 25 00 00 00       	mov    $0x25,%edx
 76f:	8b 45 08             	mov    0x8(%ebp),%eax
 772:	e8 11 fe ff ff       	call   588 <putc>
        putc(fd, c);
 777:	89 fa                	mov    %edi,%edx
 779:	8b 45 08             	mov    0x8(%ebp),%eax
 77c:	e8 07 fe ff ff       	call   588 <putc>
      state = 0;
 781:	be 00 00 00 00       	mov    $0x0,%esi
 786:	e9 ce fe ff ff       	jmp    659 <printf+0x2c>
    }
  }
}
 78b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78e:	5b                   	pop    %ebx
 78f:	5e                   	pop    %esi
 790:	5f                   	pop    %edi
 791:	5d                   	pop    %ebp
 792:	c3                   	ret    

00000793 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 793:	55                   	push   %ebp
 794:	89 e5                	mov    %esp,%ebp
 796:	57                   	push   %edi
 797:	56                   	push   %esi
 798:	53                   	push   %ebx
 799:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 79c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79f:	a1 80 11 00 00       	mov    0x1180,%eax
 7a4:	eb 02                	jmp    7a8 <free+0x15>
 7a6:	89 d0                	mov    %edx,%eax
 7a8:	39 c8                	cmp    %ecx,%eax
 7aa:	73 04                	jae    7b0 <free+0x1d>
 7ac:	39 08                	cmp    %ecx,(%eax)
 7ae:	77 12                	ja     7c2 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	8b 10                	mov    (%eax),%edx
 7b2:	39 c2                	cmp    %eax,%edx
 7b4:	77 f0                	ja     7a6 <free+0x13>
 7b6:	39 c8                	cmp    %ecx,%eax
 7b8:	72 08                	jb     7c2 <free+0x2f>
 7ba:	39 ca                	cmp    %ecx,%edx
 7bc:	77 04                	ja     7c2 <free+0x2f>
 7be:	89 d0                	mov    %edx,%eax
 7c0:	eb e6                	jmp    7a8 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c2:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7c5:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7c8:	8b 10                	mov    (%eax),%edx
 7ca:	39 d7                	cmp    %edx,%edi
 7cc:	74 19                	je     7e7 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7ce:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7d1:	8b 50 04             	mov    0x4(%eax),%edx
 7d4:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d7:	39 ce                	cmp    %ecx,%esi
 7d9:	74 1b                	je     7f6 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7db:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7dd:	a3 80 11 00 00       	mov    %eax,0x1180
}
 7e2:	5b                   	pop    %ebx
 7e3:	5e                   	pop    %esi
 7e4:	5f                   	pop    %edi
 7e5:	5d                   	pop    %ebp
 7e6:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7e7:	03 72 04             	add    0x4(%edx),%esi
 7ea:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ed:	8b 10                	mov    (%eax),%edx
 7ef:	8b 12                	mov    (%edx),%edx
 7f1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7f4:	eb db                	jmp    7d1 <free+0x3e>
    p->s.size += bp->s.size;
 7f6:	03 53 fc             	add    -0x4(%ebx),%edx
 7f9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7fc:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7ff:	89 10                	mov    %edx,(%eax)
 801:	eb da                	jmp    7dd <free+0x4a>

00000803 <morecore>:

static Header*
morecore(uint nu)
{
 803:	55                   	push   %ebp
 804:	89 e5                	mov    %esp,%ebp
 806:	53                   	push   %ebx
 807:	83 ec 04             	sub    $0x4,%esp
 80a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 80c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 811:	77 05                	ja     818 <morecore+0x15>
    nu = 4096;
 813:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 818:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 81f:	83 ec 0c             	sub    $0xc,%esp
 822:	50                   	push   %eax
 823:	e8 38 fd ff ff       	call   560 <sbrk>
  if(p == (char*)-1)
 828:	83 c4 10             	add    $0x10,%esp
 82b:	83 f8 ff             	cmp    $0xffffffff,%eax
 82e:	74 1c                	je     84c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 830:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 833:	83 c0 08             	add    $0x8,%eax
 836:	83 ec 0c             	sub    $0xc,%esp
 839:	50                   	push   %eax
 83a:	e8 54 ff ff ff       	call   793 <free>
  return freep;
 83f:	a1 80 11 00 00       	mov    0x1180,%eax
 844:	83 c4 10             	add    $0x10,%esp
}
 847:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 84a:	c9                   	leave  
 84b:	c3                   	ret    
    return 0;
 84c:	b8 00 00 00 00       	mov    $0x0,%eax
 851:	eb f4                	jmp    847 <morecore+0x44>

00000853 <malloc>:

void*
malloc(uint nbytes)
{
 853:	55                   	push   %ebp
 854:	89 e5                	mov    %esp,%ebp
 856:	53                   	push   %ebx
 857:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 85a:	8b 45 08             	mov    0x8(%ebp),%eax
 85d:	8d 58 07             	lea    0x7(%eax),%ebx
 860:	c1 eb 03             	shr    $0x3,%ebx
 863:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 866:	8b 0d 80 11 00 00    	mov    0x1180,%ecx
 86c:	85 c9                	test   %ecx,%ecx
 86e:	74 04                	je     874 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 870:	8b 01                	mov    (%ecx),%eax
 872:	eb 4a                	jmp    8be <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 874:	c7 05 80 11 00 00 84 	movl   $0x1184,0x1180
 87b:	11 00 00 
 87e:	c7 05 84 11 00 00 84 	movl   $0x1184,0x1184
 885:	11 00 00 
    base.s.size = 0;
 888:	c7 05 88 11 00 00 00 	movl   $0x0,0x1188
 88f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 892:	b9 84 11 00 00       	mov    $0x1184,%ecx
 897:	eb d7                	jmp    870 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 899:	74 19                	je     8b4 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 89b:	29 da                	sub    %ebx,%edx
 89d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8a0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8a3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8a6:	89 0d 80 11 00 00    	mov    %ecx,0x1180
      return (void*)(p + 1);
 8ac:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8b2:	c9                   	leave  
 8b3:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8b4:	8b 10                	mov    (%eax),%edx
 8b6:	89 11                	mov    %edx,(%ecx)
 8b8:	eb ec                	jmp    8a6 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ba:	89 c1                	mov    %eax,%ecx
 8bc:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8be:	8b 50 04             	mov    0x4(%eax),%edx
 8c1:	39 da                	cmp    %ebx,%edx
 8c3:	73 d4                	jae    899 <malloc+0x46>
    if(p == freep)
 8c5:	39 05 80 11 00 00    	cmp    %eax,0x1180
 8cb:	75 ed                	jne    8ba <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8cd:	89 d8                	mov    %ebx,%eax
 8cf:	e8 2f ff ff ff       	call   803 <morecore>
 8d4:	85 c0                	test   %eax,%eax
 8d6:	75 e2                	jne    8ba <malloc+0x67>
 8d8:	eb d5                	jmp    8af <malloc+0x5c>
