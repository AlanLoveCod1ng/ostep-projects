
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   8:	83 ec 0c             	sub    $0xc,%esp
   b:	53                   	push   %ebx
   c:	e8 1f 03 00 00       	call   330 <strlen>
  11:	01 d8                	add    %ebx,%eax
  13:	83 c4 10             	add    $0x10,%esp
  16:	eb 03                	jmp    1b <fmtname+0x1b>
  18:	83 e8 01             	sub    $0x1,%eax
  1b:	39 d8                	cmp    %ebx,%eax
  1d:	72 05                	jb     24 <fmtname+0x24>
  1f:	80 38 2f             	cmpb   $0x2f,(%eax)
  22:	75 f4                	jne    18 <fmtname+0x18>
    ;
  p++;
  24:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  27:	83 ec 0c             	sub    $0xc,%esp
  2a:	53                   	push   %ebx
  2b:	e8 00 03 00 00       	call   330 <strlen>
  30:	83 c4 10             	add    $0x10,%esp
  33:	83 f8 0d             	cmp    $0xd,%eax
  36:	76 09                	jbe    41 <fmtname+0x41>
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}
  38:	89 d8                	mov    %ebx,%eax
  3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3d:	5b                   	pop    %ebx
  3e:	5e                   	pop    %esi
  3f:	5d                   	pop    %ebp
  40:	c3                   	ret    
  memmove(buf, p, strlen(p));
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	53                   	push   %ebx
  45:	e8 e6 02 00 00       	call   330 <strlen>
  4a:	83 c4 0c             	add    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	53                   	push   %ebx
  4f:	68 78 0d 00 00       	push   $0xd78
  54:	e8 f6 03 00 00       	call   44f <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  59:	89 1c 24             	mov    %ebx,(%esp)
  5c:	e8 cf 02 00 00       	call   330 <strlen>
  61:	89 c6                	mov    %eax,%esi
  63:	89 1c 24             	mov    %ebx,(%esp)
  66:	e8 c5 02 00 00       	call   330 <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	ba 0e 00 00 00       	mov    $0xe,%edx
  73:	29 f2                	sub    %esi,%edx
  75:	52                   	push   %edx
  76:	6a 20                	push   $0x20
  78:	05 78 0d 00 00       	add    $0xd78,%eax
  7d:	50                   	push   %eax
  7e:	e8 c5 02 00 00       	call   348 <memset>
  return buf;
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb 78 0d 00 00       	mov    $0xd78,%ebx
  8b:	eb ab                	jmp    38 <fmtname+0x38>

0000008d <ls>:

void
ls(char *path)
{
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	57                   	push   %edi
  91:	56                   	push   %esi
  92:	53                   	push   %ebx
  93:	81 ec 54 02 00 00    	sub    $0x254,%esp
  99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  9c:	6a 00                	push   $0x0
  9e:	53                   	push   %ebx
  9f:	e8 b8 04 00 00       	call   55c <open>
  a4:	83 c4 10             	add    $0x10,%esp
  a7:	85 c0                	test   %eax,%eax
  a9:	0f 88 8c 00 00 00    	js     13b <ls+0xae>
  af:	89 c7                	mov    %eax,%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  b1:	83 ec 08             	sub    $0x8,%esp
  b4:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
  ba:	50                   	push   %eax
  bb:	57                   	push   %edi
  bc:	e8 b3 04 00 00       	call   574 <fstat>
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	85 c0                	test   %eax,%eax
  c6:	0f 88 84 00 00 00    	js     150 <ls+0xc3>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  cc:	0f b7 85 c4 fd ff ff 	movzwl -0x23c(%ebp),%eax
  d3:	0f bf f0             	movswl %ax,%esi
  d6:	66 83 f8 01          	cmp    $0x1,%ax
  da:	0f 84 8d 00 00 00    	je     16d <ls+0xe0>
  e0:	66 83 f8 02          	cmp    $0x2,%ax
  e4:	75 41                	jne    127 <ls+0x9a>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
  e6:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
  ec:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
  f2:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
  f8:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
  fe:	83 ec 0c             	sub    $0xc,%esp
 101:	53                   	push   %ebx
 102:	e8 f9 fe ff ff       	call   0 <fmtname>
 107:	83 c4 08             	add    $0x8,%esp
 10a:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 110:	ff b5 b0 fd ff ff    	push   -0x250(%ebp)
 116:	56                   	push   %esi
 117:	50                   	push   %eax
 118:	68 48 09 00 00       	push   $0x948
 11d:	6a 01                	push   $0x1
 11f:	e8 4d 05 00 00       	call   671 <printf>
    break;
 124:	83 c4 20             	add    $0x20,%esp
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 127:	83 ec 0c             	sub    $0xc,%esp
 12a:	57                   	push   %edi
 12b:	e8 14 04 00 00       	call   544 <close>
 130:	83 c4 10             	add    $0x10,%esp
}
 133:	8d 65 f4             	lea    -0xc(%ebp),%esp
 136:	5b                   	pop    %ebx
 137:	5e                   	pop    %esi
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    
    printf(2, "ls: cannot open %s\n", path);
 13b:	83 ec 04             	sub    $0x4,%esp
 13e:	53                   	push   %ebx
 13f:	68 20 09 00 00       	push   $0x920
 144:	6a 02                	push   $0x2
 146:	e8 26 05 00 00       	call   671 <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 34 09 00 00       	push   $0x934
 159:	6a 02                	push   $0x2
 15b:	e8 11 05 00 00       	call   671 <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 dc 03 00 00       	call   544 <close>
    return;
 168:	83 c4 10             	add    $0x10,%esp
 16b:	eb c6                	jmp    133 <ls+0xa6>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 16d:	83 ec 0c             	sub    $0xc,%esp
 170:	53                   	push   %ebx
 171:	e8 ba 01 00 00       	call   330 <strlen>
 176:	83 c0 10             	add    $0x10,%eax
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3d 00 02 00 00       	cmp    $0x200,%eax
 181:	76 14                	jbe    197 <ls+0x10a>
      printf(1, "ls: path too long\n");
 183:	83 ec 08             	sub    $0x8,%esp
 186:	68 55 09 00 00       	push   $0x955
 18b:	6a 01                	push   $0x1
 18d:	e8 df 04 00 00       	call   671 <printf>
      break;
 192:	83 c4 10             	add    $0x10,%esp
 195:	eb 90                	jmp    127 <ls+0x9a>
    strcpy(buf, path);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	53                   	push   %ebx
 19b:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a1:	56                   	push   %esi
 1a2:	e8 3d 01 00 00       	call   2e4 <strcpy>
    p = buf+strlen(buf);
 1a7:	89 34 24             	mov    %esi,(%esp)
 1aa:	e8 81 01 00 00       	call   330 <strlen>
 1af:	01 c6                	add    %eax,%esi
    *p++ = '/';
 1b1:	8d 46 01             	lea    0x1(%esi),%eax
 1b4:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 1ba:	c6 06 2f             	movb   $0x2f,(%esi)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	eb 19                	jmp    1db <ls+0x14e>
        printf(1, "ls: cannot stat %s\n", buf);
 1c2:	83 ec 04             	sub    $0x4,%esp
 1c5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1cb:	50                   	push   %eax
 1cc:	68 34 09 00 00       	push   $0x934
 1d1:	6a 01                	push   $0x1
 1d3:	e8 99 04 00 00       	call   671 <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 47 03 00 00       	call   534 <read>
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	83 f8 10             	cmp    $0x10,%eax
 1f3:	0f 85 2e ff ff ff    	jne    127 <ls+0x9a>
      if(de.inum == 0)
 1f9:	66 83 bd d8 fd ff ff 	cmpw   $0x0,-0x228(%ebp)
 200:	00 
 201:	74 d8                	je     1db <ls+0x14e>
      memmove(p, de.name, DIRSIZ);
 203:	83 ec 04             	sub    $0x4,%esp
 206:	6a 0e                	push   $0xe
 208:	8d 85 da fd ff ff    	lea    -0x226(%ebp),%eax
 20e:	50                   	push   %eax
 20f:	ff b5 ac fd ff ff    	push   -0x254(%ebp)
 215:	e8 35 02 00 00       	call   44f <memmove>
      p[DIRSIZ] = 0;
 21a:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 21e:	83 c4 08             	add    $0x8,%esp
 221:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	e8 a7 01 00 00       	call   3db <stat>
 234:	83 c4 10             	add    $0x10,%esp
 237:	85 c0                	test   %eax,%eax
 239:	78 87                	js     1c2 <ls+0x135>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 23b:	8b 9d d4 fd ff ff    	mov    -0x22c(%ebp),%ebx
 241:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
 247:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 24d:	0f b7 8d c4 fd ff ff 	movzwl -0x23c(%ebp),%ecx
 254:	66 89 8d b0 fd ff ff 	mov    %cx,-0x250(%ebp)
 25b:	83 ec 0c             	sub    $0xc,%esp
 25e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 264:	50                   	push   %eax
 265:	e8 96 fd ff ff       	call   0 <fmtname>
 26a:	89 c2                	mov    %eax,%edx
 26c:	83 c4 08             	add    $0x8,%esp
 26f:	53                   	push   %ebx
 270:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 276:	0f bf 85 b0 fd ff ff 	movswl -0x250(%ebp),%eax
 27d:	50                   	push   %eax
 27e:	52                   	push   %edx
 27f:	68 48 09 00 00       	push   $0x948
 284:	6a 01                	push   $0x1
 286:	e8 e6 03 00 00       	call   671 <printf>
 28b:	83 c4 20             	add    $0x20,%esp
 28e:	e9 48 ff ff ff       	jmp    1db <ls+0x14e>

00000293 <main>:

int
main(int argc, char *argv[])
{
 293:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 297:	83 e4 f0             	and    $0xfffffff0,%esp
 29a:	ff 71 fc             	push   -0x4(%ecx)
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	57                   	push   %edi
 2a1:	56                   	push   %esi
 2a2:	53                   	push   %ebx
 2a3:	51                   	push   %ecx
 2a4:	83 ec 08             	sub    $0x8,%esp
 2a7:	8b 31                	mov    (%ecx),%esi
 2a9:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
 2ac:	83 fe 01             	cmp    $0x1,%esi
 2af:	7e 07                	jle    2b8 <main+0x25>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 2b1:	bb 01 00 00 00       	mov    $0x1,%ebx
 2b6:	eb 23                	jmp    2db <main+0x48>
    ls(".");
 2b8:	83 ec 0c             	sub    $0xc,%esp
 2bb:	68 68 09 00 00       	push   $0x968
 2c0:	e8 c8 fd ff ff       	call   8d <ls>
    exit();
 2c5:	e8 52 02 00 00       	call   51c <exit>
    ls(argv[i]);
 2ca:	83 ec 0c             	sub    $0xc,%esp
 2cd:	ff 34 9f             	push   (%edi,%ebx,4)
 2d0:	e8 b8 fd ff ff       	call   8d <ls>
  for(i=1; i<argc; i++)
 2d5:	83 c3 01             	add    $0x1,%ebx
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	39 f3                	cmp    %esi,%ebx
 2dd:	7c eb                	jl     2ca <main+0x37>
  exit();
 2df:	e8 38 02 00 00       	call   51c <exit>

000002e4 <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	56                   	push   %esi
 2e8:	53                   	push   %ebx
 2e9:	8b 75 08             	mov    0x8(%ebp),%esi
 2ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ef:	89 f0                	mov    %esi,%eax
 2f1:	89 d1                	mov    %edx,%ecx
 2f3:	83 c2 01             	add    $0x1,%edx
 2f6:	89 c3                	mov    %eax,%ebx
 2f8:	83 c0 01             	add    $0x1,%eax
 2fb:	0f b6 09             	movzbl (%ecx),%ecx
 2fe:	88 0b                	mov    %cl,(%ebx)
 300:	84 c9                	test   %cl,%cl
 302:	75 ed                	jne    2f1 <strcpy+0xd>
    ;
  return os;
}
 304:	89 f0                	mov    %esi,%eax
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    

0000030a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
 30d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 310:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 313:	eb 06                	jmp    31b <strcmp+0x11>
    p++, q++;
 315:	83 c1 01             	add    $0x1,%ecx
 318:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 31b:	0f b6 01             	movzbl (%ecx),%eax
 31e:	84 c0                	test   %al,%al
 320:	74 04                	je     326 <strcmp+0x1c>
 322:	3a 02                	cmp    (%edx),%al
 324:	74 ef                	je     315 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 326:	0f b6 c0             	movzbl %al,%eax
 329:	0f b6 12             	movzbl (%edx),%edx
 32c:	29 d0                	sub    %edx,%eax
}
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    

00000330 <strlen>:

uint
strlen(const char *s)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 336:	b8 00 00 00 00       	mov    $0x0,%eax
 33b:	eb 03                	jmp    340 <strlen+0x10>
 33d:	83 c0 01             	add    $0x1,%eax
 340:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 344:	75 f7                	jne    33d <strlen+0xd>
    ;
  return n;
}
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    

00000348 <memset>:

void*
memset(void *dst, int c, uint n)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	57                   	push   %edi
 34c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 34f:	89 d7                	mov    %edx,%edi
 351:	8b 4d 10             	mov    0x10(%ebp),%ecx
 354:	8b 45 0c             	mov    0xc(%ebp),%eax
 357:	fc                   	cld    
 358:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 35a:	89 d0                	mov    %edx,%eax
 35c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <strchr>:

char*
strchr(const char *s, char c)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 36b:	eb 03                	jmp    370 <strchr+0xf>
 36d:	83 c0 01             	add    $0x1,%eax
 370:	0f b6 10             	movzbl (%eax),%edx
 373:	84 d2                	test   %dl,%dl
 375:	74 06                	je     37d <strchr+0x1c>
    if(*s == c)
 377:	38 ca                	cmp    %cl,%dl
 379:	75 f2                	jne    36d <strchr+0xc>
 37b:	eb 05                	jmp    382 <strchr+0x21>
      return (char*)s;
  return 0;
 37d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 382:	5d                   	pop    %ebp
 383:	c3                   	ret    

00000384 <gets>:

char*
gets(char *buf, int max)
{
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	56                   	push   %esi
 389:	53                   	push   %ebx
 38a:	83 ec 1c             	sub    $0x1c,%esp
 38d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 390:	bb 00 00 00 00       	mov    $0x0,%ebx
 395:	89 de                	mov    %ebx,%esi
 397:	83 c3 01             	add    $0x1,%ebx
 39a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 39d:	7d 2e                	jge    3cd <gets+0x49>
    cc = read(0, &c, 1);
 39f:	83 ec 04             	sub    $0x4,%esp
 3a2:	6a 01                	push   $0x1
 3a4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3a7:	50                   	push   %eax
 3a8:	6a 00                	push   $0x0
 3aa:	e8 85 01 00 00       	call   534 <read>
    if(cc < 1)
 3af:	83 c4 10             	add    $0x10,%esp
 3b2:	85 c0                	test   %eax,%eax
 3b4:	7e 17                	jle    3cd <gets+0x49>
      break;
    buf[i++] = c;
 3b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3ba:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3bd:	3c 0a                	cmp    $0xa,%al
 3bf:	0f 94 c2             	sete   %dl
 3c2:	3c 0d                	cmp    $0xd,%al
 3c4:	0f 94 c0             	sete   %al
 3c7:	08 c2                	or     %al,%dl
 3c9:	74 ca                	je     395 <gets+0x11>
    buf[i++] = c;
 3cb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3cd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d1:	89 f8                	mov    %edi,%eax
 3d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3d6:	5b                   	pop    %ebx
 3d7:	5e                   	pop    %esi
 3d8:	5f                   	pop    %edi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <stat>:

int
stat(const char *n, struct stat *st)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	56                   	push   %esi
 3df:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e0:	83 ec 08             	sub    $0x8,%esp
 3e3:	6a 00                	push   $0x0
 3e5:	ff 75 08             	push   0x8(%ebp)
 3e8:	e8 6f 01 00 00       	call   55c <open>
  if(fd < 0)
 3ed:	83 c4 10             	add    $0x10,%esp
 3f0:	85 c0                	test   %eax,%eax
 3f2:	78 24                	js     418 <stat+0x3d>
 3f4:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3f6:	83 ec 08             	sub    $0x8,%esp
 3f9:	ff 75 0c             	push   0xc(%ebp)
 3fc:	50                   	push   %eax
 3fd:	e8 72 01 00 00       	call   574 <fstat>
 402:	89 c6                	mov    %eax,%esi
  close(fd);
 404:	89 1c 24             	mov    %ebx,(%esp)
 407:	e8 38 01 00 00       	call   544 <close>
  return r;
 40c:	83 c4 10             	add    $0x10,%esp
}
 40f:	89 f0                	mov    %esi,%eax
 411:	8d 65 f8             	lea    -0x8(%ebp),%esp
 414:	5b                   	pop    %ebx
 415:	5e                   	pop    %esi
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    
    return -1;
 418:	be ff ff ff ff       	mov    $0xffffffff,%esi
 41d:	eb f0                	jmp    40f <stat+0x34>

0000041f <atoi>:

int
atoi(const char *s)
{
 41f:	55                   	push   %ebp
 420:	89 e5                	mov    %esp,%ebp
 422:	53                   	push   %ebx
 423:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 426:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 42b:	eb 10                	jmp    43d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 42d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 430:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 433:	83 c1 01             	add    $0x1,%ecx
 436:	0f be c0             	movsbl %al,%eax
 439:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 43d:	0f b6 01             	movzbl (%ecx),%eax
 440:	8d 58 d0             	lea    -0x30(%eax),%ebx
 443:	80 fb 09             	cmp    $0x9,%bl
 446:	76 e5                	jbe    42d <atoi+0xe>
  return n;
}
 448:	89 d0                	mov    %edx,%eax
 44a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44d:	c9                   	leave  
 44e:	c3                   	ret    

0000044f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	56                   	push   %esi
 453:	53                   	push   %ebx
 454:	8b 75 08             	mov    0x8(%ebp),%esi
 457:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 45a:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 45d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 45f:	eb 0d                	jmp    46e <memmove+0x1f>
    *dst++ = *src++;
 461:	0f b6 01             	movzbl (%ecx),%eax
 464:	88 02                	mov    %al,(%edx)
 466:	8d 49 01             	lea    0x1(%ecx),%ecx
 469:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 46c:	89 d8                	mov    %ebx,%eax
 46e:	8d 58 ff             	lea    -0x1(%eax),%ebx
 471:	85 c0                	test   %eax,%eax
 473:	7f ec                	jg     461 <memmove+0x12>
  return vdst;
}
 475:	89 f0                	mov    %esi,%eax
 477:	5b                   	pop    %ebx
 478:	5e                   	pop    %esi
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    

0000047b <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 47b:	55                   	push   %ebp
 47c:	89 e5                	mov    %esp,%ebp
 47e:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 481:	68 00 20 00 00       	push   $0x2000
 486:	e8 0c 04 00 00       	call   897 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 48b:	83 c4 10             	add    $0x10,%esp
 48e:	a9 ff 0f 00 00       	test   $0xfff,%eax
 493:	74 0a                	je     49f <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 495:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 49a:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 49f:	50                   	push   %eax
 4a0:	ff 75 10             	push   0x10(%ebp)
 4a3:	ff 75 0c             	push   0xc(%ebp)
 4a6:	ff 75 08             	push   0x8(%ebp)
 4a9:	e8 0e 01 00 00       	call   5bc <clone>
  return pid;
}
 4ae:	c9                   	leave  
 4af:	c3                   	ret    

000004b0 <thread_join>:
int
thread_join()
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	53                   	push   %ebx
 4b4:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 4b7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ba:	50                   	push   %eax
 4bb:	e8 04 01 00 00       	call   5c4 <join>
 4c0:	89 c3                	mov    %eax,%ebx
  free(stack);
 4c2:	83 c4 04             	add    $0x4,%esp
 4c5:	ff 75 f4             	push   -0xc(%ebp)
 4c8:	e8 0a 03 00 00       	call   7d7 <free>
  return pid;
}
 4cd:	89 d8                	mov    %ebx,%eax
 4cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d2:	c9                   	leave  
 4d3:	c3                   	ret    

000004d4 <lock_init>:
int
lock_init(lock_t * lock){
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 4e0:	b8 00 00 00 00       	mov    $0x0,%eax
 4e5:	5d                   	pop    %ebp
 4e6:	c3                   	ret    

000004e7 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 4e7:	55                   	push   %ebp
 4e8:	89 e5                	mov    %esp,%ebp
 4ea:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4ed:	b8 01 00 00 00       	mov    $0x1,%eax
 4f2:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 4f5:	83 f8 01             	cmp    $0x1,%eax
 4f8:	74 f3                	je     4ed <lock_acquire+0x6>
  {

  }
  return 0;
}
 4fa:	b8 00 00 00 00       	mov    $0x0,%eax
 4ff:	5d                   	pop    %ebp
 500:	c3                   	ret    

00000501 <lock_release>:
int
lock_release(lock_t * lock){
 501:	55                   	push   %ebp
 502:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 504:	8b 45 08             	mov    0x8(%ebp),%eax
 507:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 50d:	b8 00 00 00 00       	mov    $0x0,%eax
 512:	5d                   	pop    %ebp
 513:	c3                   	ret    

00000514 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 514:	b8 01 00 00 00       	mov    $0x1,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <exit>:
SYSCALL(exit)
 51c:	b8 02 00 00 00       	mov    $0x2,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <wait>:
SYSCALL(wait)
 524:	b8 03 00 00 00       	mov    $0x3,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <pipe>:
SYSCALL(pipe)
 52c:	b8 04 00 00 00       	mov    $0x4,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <read>:
SYSCALL(read)
 534:	b8 05 00 00 00       	mov    $0x5,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <write>:
SYSCALL(write)
 53c:	b8 10 00 00 00       	mov    $0x10,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <close>:
SYSCALL(close)
 544:	b8 15 00 00 00       	mov    $0x15,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <kill>:
SYSCALL(kill)
 54c:	b8 06 00 00 00       	mov    $0x6,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <exec>:
SYSCALL(exec)
 554:	b8 07 00 00 00       	mov    $0x7,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <open>:
SYSCALL(open)
 55c:	b8 0f 00 00 00       	mov    $0xf,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <mknod>:
SYSCALL(mknod)
 564:	b8 11 00 00 00       	mov    $0x11,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <unlink>:
SYSCALL(unlink)
 56c:	b8 12 00 00 00       	mov    $0x12,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <fstat>:
SYSCALL(fstat)
 574:	b8 08 00 00 00       	mov    $0x8,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <link>:
SYSCALL(link)
 57c:	b8 13 00 00 00       	mov    $0x13,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <mkdir>:
SYSCALL(mkdir)
 584:	b8 14 00 00 00       	mov    $0x14,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <chdir>:
SYSCALL(chdir)
 58c:	b8 09 00 00 00       	mov    $0x9,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <dup>:
SYSCALL(dup)
 594:	b8 0a 00 00 00       	mov    $0xa,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <getpid>:
SYSCALL(getpid)
 59c:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <sbrk>:
SYSCALL(sbrk)
 5a4:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <sleep>:
SYSCALL(sleep)
 5ac:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <uptime>:
SYSCALL(uptime)
 5b4:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <clone>:
SYSCALL(clone)
 5bc:	b8 16 00 00 00       	mov    $0x16,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <join>:
SYSCALL(join)
 5c4:	b8 17 00 00 00       	mov    $0x17,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5cc:	55                   	push   %ebp
 5cd:	89 e5                	mov    %esp,%ebp
 5cf:	83 ec 1c             	sub    $0x1c,%esp
 5d2:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5d5:	6a 01                	push   $0x1
 5d7:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5da:	52                   	push   %edx
 5db:	50                   	push   %eax
 5dc:	e8 5b ff ff ff       	call   53c <write>
}
 5e1:	83 c4 10             	add    $0x10,%esp
 5e4:	c9                   	leave  
 5e5:	c3                   	ret    

000005e6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5e6:	55                   	push   %ebp
 5e7:	89 e5                	mov    %esp,%ebp
 5e9:	57                   	push   %edi
 5ea:	56                   	push   %esi
 5eb:	53                   	push   %ebx
 5ec:	83 ec 2c             	sub    $0x2c,%esp
 5ef:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f2:	89 d0                	mov    %edx,%eax
 5f4:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5f6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5fa:	0f 95 c1             	setne  %cl
 5fd:	c1 ea 1f             	shr    $0x1f,%edx
 600:	84 d1                	test   %dl,%cl
 602:	74 44                	je     648 <printint+0x62>
    neg = 1;
    x = -xx;
 604:	f7 d8                	neg    %eax
 606:	89 c1                	mov    %eax,%ecx
    neg = 1;
 608:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 60f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 614:	89 c8                	mov    %ecx,%eax
 616:	ba 00 00 00 00       	mov    $0x0,%edx
 61b:	f7 f6                	div    %esi
 61d:	89 df                	mov    %ebx,%edi
 61f:	83 c3 01             	add    $0x1,%ebx
 622:	0f b6 92 cc 09 00 00 	movzbl 0x9cc(%edx),%edx
 629:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 62d:	89 ca                	mov    %ecx,%edx
 62f:	89 c1                	mov    %eax,%ecx
 631:	39 d6                	cmp    %edx,%esi
 633:	76 df                	jbe    614 <printint+0x2e>
  if(neg)
 635:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 639:	74 31                	je     66c <printint+0x86>
    buf[i++] = '-';
 63b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 640:	8d 5f 02             	lea    0x2(%edi),%ebx
 643:	8b 75 d0             	mov    -0x30(%ebp),%esi
 646:	eb 17                	jmp    65f <printint+0x79>
    x = xx;
 648:	89 c1                	mov    %eax,%ecx
  neg = 0;
 64a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 651:	eb bc                	jmp    60f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 653:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 658:	89 f0                	mov    %esi,%eax
 65a:	e8 6d ff ff ff       	call   5cc <putc>
  while(--i >= 0)
 65f:	83 eb 01             	sub    $0x1,%ebx
 662:	79 ef                	jns    653 <printint+0x6d>
}
 664:	83 c4 2c             	add    $0x2c,%esp
 667:	5b                   	pop    %ebx
 668:	5e                   	pop    %esi
 669:	5f                   	pop    %edi
 66a:	5d                   	pop    %ebp
 66b:	c3                   	ret    
 66c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 66f:	eb ee                	jmp    65f <printint+0x79>

00000671 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 671:	55                   	push   %ebp
 672:	89 e5                	mov    %esp,%ebp
 674:	57                   	push   %edi
 675:	56                   	push   %esi
 676:	53                   	push   %ebx
 677:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 67a:	8d 45 10             	lea    0x10(%ebp),%eax
 67d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 680:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 685:	bb 00 00 00 00       	mov    $0x0,%ebx
 68a:	eb 14                	jmp    6a0 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 68c:	89 fa                	mov    %edi,%edx
 68e:	8b 45 08             	mov    0x8(%ebp),%eax
 691:	e8 36 ff ff ff       	call   5cc <putc>
 696:	eb 05                	jmp    69d <printf+0x2c>
      }
    } else if(state == '%'){
 698:	83 fe 25             	cmp    $0x25,%esi
 69b:	74 25                	je     6c2 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 69d:	83 c3 01             	add    $0x1,%ebx
 6a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a3:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6a7:	84 c0                	test   %al,%al
 6a9:	0f 84 20 01 00 00    	je     7cf <printf+0x15e>
    c = fmt[i] & 0xff;
 6af:	0f be f8             	movsbl %al,%edi
 6b2:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6b5:	85 f6                	test   %esi,%esi
 6b7:	75 df                	jne    698 <printf+0x27>
      if(c == '%'){
 6b9:	83 f8 25             	cmp    $0x25,%eax
 6bc:	75 ce                	jne    68c <printf+0x1b>
        state = '%';
 6be:	89 c6                	mov    %eax,%esi
 6c0:	eb db                	jmp    69d <printf+0x2c>
      if(c == 'd'){
 6c2:	83 f8 25             	cmp    $0x25,%eax
 6c5:	0f 84 cf 00 00 00    	je     79a <printf+0x129>
 6cb:	0f 8c dd 00 00 00    	jl     7ae <printf+0x13d>
 6d1:	83 f8 78             	cmp    $0x78,%eax
 6d4:	0f 8f d4 00 00 00    	jg     7ae <printf+0x13d>
 6da:	83 f8 63             	cmp    $0x63,%eax
 6dd:	0f 8c cb 00 00 00    	jl     7ae <printf+0x13d>
 6e3:	83 e8 63             	sub    $0x63,%eax
 6e6:	83 f8 15             	cmp    $0x15,%eax
 6e9:	0f 87 bf 00 00 00    	ja     7ae <printf+0x13d>
 6ef:	ff 24 85 74 09 00 00 	jmp    *0x974(,%eax,4)
        printint(fd, *ap, 10, 1);
 6f6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f9:	8b 17                	mov    (%edi),%edx
 6fb:	83 ec 0c             	sub    $0xc,%esp
 6fe:	6a 01                	push   $0x1
 700:	b9 0a 00 00 00       	mov    $0xa,%ecx
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	e8 d9 fe ff ff       	call   5e6 <printint>
        ap++;
 70d:	83 c7 04             	add    $0x4,%edi
 710:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 713:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 716:	be 00 00 00 00       	mov    $0x0,%esi
 71b:	eb 80                	jmp    69d <printf+0x2c>
        printint(fd, *ap, 16, 0);
 71d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 720:	8b 17                	mov    (%edi),%edx
 722:	83 ec 0c             	sub    $0xc,%esp
 725:	6a 00                	push   $0x0
 727:	b9 10 00 00 00       	mov    $0x10,%ecx
 72c:	8b 45 08             	mov    0x8(%ebp),%eax
 72f:	e8 b2 fe ff ff       	call   5e6 <printint>
        ap++;
 734:	83 c7 04             	add    $0x4,%edi
 737:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 73a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73d:	be 00 00 00 00       	mov    $0x0,%esi
 742:	e9 56 ff ff ff       	jmp    69d <printf+0x2c>
        s = (char*)*ap;
 747:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 74a:	8b 30                	mov    (%eax),%esi
        ap++;
 74c:	83 c0 04             	add    $0x4,%eax
 74f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 752:	85 f6                	test   %esi,%esi
 754:	75 15                	jne    76b <printf+0xfa>
          s = "(null)";
 756:	be 6a 09 00 00       	mov    $0x96a,%esi
 75b:	eb 0e                	jmp    76b <printf+0xfa>
          putc(fd, *s);
 75d:	0f be d2             	movsbl %dl,%edx
 760:	8b 45 08             	mov    0x8(%ebp),%eax
 763:	e8 64 fe ff ff       	call   5cc <putc>
          s++;
 768:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 76b:	0f b6 16             	movzbl (%esi),%edx
 76e:	84 d2                	test   %dl,%dl
 770:	75 eb                	jne    75d <printf+0xec>
      state = 0;
 772:	be 00 00 00 00       	mov    $0x0,%esi
 777:	e9 21 ff ff ff       	jmp    69d <printf+0x2c>
        putc(fd, *ap);
 77c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 77f:	0f be 17             	movsbl (%edi),%edx
 782:	8b 45 08             	mov    0x8(%ebp),%eax
 785:	e8 42 fe ff ff       	call   5cc <putc>
        ap++;
 78a:	83 c7 04             	add    $0x4,%edi
 78d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 790:	be 00 00 00 00       	mov    $0x0,%esi
 795:	e9 03 ff ff ff       	jmp    69d <printf+0x2c>
        putc(fd, c);
 79a:	89 fa                	mov    %edi,%edx
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	e8 28 fe ff ff       	call   5cc <putc>
      state = 0;
 7a4:	be 00 00 00 00       	mov    $0x0,%esi
 7a9:	e9 ef fe ff ff       	jmp    69d <printf+0x2c>
        putc(fd, '%');
 7ae:	ba 25 00 00 00       	mov    $0x25,%edx
 7b3:	8b 45 08             	mov    0x8(%ebp),%eax
 7b6:	e8 11 fe ff ff       	call   5cc <putc>
        putc(fd, c);
 7bb:	89 fa                	mov    %edi,%edx
 7bd:	8b 45 08             	mov    0x8(%ebp),%eax
 7c0:	e8 07 fe ff ff       	call   5cc <putc>
      state = 0;
 7c5:	be 00 00 00 00       	mov    $0x0,%esi
 7ca:	e9 ce fe ff ff       	jmp    69d <printf+0x2c>
    }
  }
}
 7cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7d2:	5b                   	pop    %ebx
 7d3:	5e                   	pop    %esi
 7d4:	5f                   	pop    %edi
 7d5:	5d                   	pop    %ebp
 7d6:	c3                   	ret    

000007d7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d7:	55                   	push   %ebp
 7d8:	89 e5                	mov    %esp,%ebp
 7da:	57                   	push   %edi
 7db:	56                   	push   %esi
 7dc:	53                   	push   %ebx
 7dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e3:	a1 88 0d 00 00       	mov    0xd88,%eax
 7e8:	eb 02                	jmp    7ec <free+0x15>
 7ea:	89 d0                	mov    %edx,%eax
 7ec:	39 c8                	cmp    %ecx,%eax
 7ee:	73 04                	jae    7f4 <free+0x1d>
 7f0:	39 08                	cmp    %ecx,(%eax)
 7f2:	77 12                	ja     806 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f4:	8b 10                	mov    (%eax),%edx
 7f6:	39 c2                	cmp    %eax,%edx
 7f8:	77 f0                	ja     7ea <free+0x13>
 7fa:	39 c8                	cmp    %ecx,%eax
 7fc:	72 08                	jb     806 <free+0x2f>
 7fe:	39 ca                	cmp    %ecx,%edx
 800:	77 04                	ja     806 <free+0x2f>
 802:	89 d0                	mov    %edx,%eax
 804:	eb e6                	jmp    7ec <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 806:	8b 73 fc             	mov    -0x4(%ebx),%esi
 809:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 80c:	8b 10                	mov    (%eax),%edx
 80e:	39 d7                	cmp    %edx,%edi
 810:	74 19                	je     82b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 812:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 815:	8b 50 04             	mov    0x4(%eax),%edx
 818:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 81b:	39 ce                	cmp    %ecx,%esi
 81d:	74 1b                	je     83a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 81f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 821:	a3 88 0d 00 00       	mov    %eax,0xd88
}
 826:	5b                   	pop    %ebx
 827:	5e                   	pop    %esi
 828:	5f                   	pop    %edi
 829:	5d                   	pop    %ebp
 82a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 82b:	03 72 04             	add    0x4(%edx),%esi
 82e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 831:	8b 10                	mov    (%eax),%edx
 833:	8b 12                	mov    (%edx),%edx
 835:	89 53 f8             	mov    %edx,-0x8(%ebx)
 838:	eb db                	jmp    815 <free+0x3e>
    p->s.size += bp->s.size;
 83a:	03 53 fc             	add    -0x4(%ebx),%edx
 83d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 840:	8b 53 f8             	mov    -0x8(%ebx),%edx
 843:	89 10                	mov    %edx,(%eax)
 845:	eb da                	jmp    821 <free+0x4a>

00000847 <morecore>:

static Header*
morecore(uint nu)
{
 847:	55                   	push   %ebp
 848:	89 e5                	mov    %esp,%ebp
 84a:	53                   	push   %ebx
 84b:	83 ec 04             	sub    $0x4,%esp
 84e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 850:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 855:	77 05                	ja     85c <morecore+0x15>
    nu = 4096;
 857:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 85c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 863:	83 ec 0c             	sub    $0xc,%esp
 866:	50                   	push   %eax
 867:	e8 38 fd ff ff       	call   5a4 <sbrk>
  if(p == (char*)-1)
 86c:	83 c4 10             	add    $0x10,%esp
 86f:	83 f8 ff             	cmp    $0xffffffff,%eax
 872:	74 1c                	je     890 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 874:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 877:	83 c0 08             	add    $0x8,%eax
 87a:	83 ec 0c             	sub    $0xc,%esp
 87d:	50                   	push   %eax
 87e:	e8 54 ff ff ff       	call   7d7 <free>
  return freep;
 883:	a1 88 0d 00 00       	mov    0xd88,%eax
 888:	83 c4 10             	add    $0x10,%esp
}
 88b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 88e:	c9                   	leave  
 88f:	c3                   	ret    
    return 0;
 890:	b8 00 00 00 00       	mov    $0x0,%eax
 895:	eb f4                	jmp    88b <morecore+0x44>

00000897 <malloc>:

void*
malloc(uint nbytes)
{
 897:	55                   	push   %ebp
 898:	89 e5                	mov    %esp,%ebp
 89a:	53                   	push   %ebx
 89b:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89e:	8b 45 08             	mov    0x8(%ebp),%eax
 8a1:	8d 58 07             	lea    0x7(%eax),%ebx
 8a4:	c1 eb 03             	shr    $0x3,%ebx
 8a7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8aa:	8b 0d 88 0d 00 00    	mov    0xd88,%ecx
 8b0:	85 c9                	test   %ecx,%ecx
 8b2:	74 04                	je     8b8 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b4:	8b 01                	mov    (%ecx),%eax
 8b6:	eb 4a                	jmp    902 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8b8:	c7 05 88 0d 00 00 8c 	movl   $0xd8c,0xd88
 8bf:	0d 00 00 
 8c2:	c7 05 8c 0d 00 00 8c 	movl   $0xd8c,0xd8c
 8c9:	0d 00 00 
    base.s.size = 0;
 8cc:	c7 05 90 0d 00 00 00 	movl   $0x0,0xd90
 8d3:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8d6:	b9 8c 0d 00 00       	mov    $0xd8c,%ecx
 8db:	eb d7                	jmp    8b4 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8dd:	74 19                	je     8f8 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8df:	29 da                	sub    %ebx,%edx
 8e1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8e7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8ea:	89 0d 88 0d 00 00    	mov    %ecx,0xd88
      return (void*)(p + 1);
 8f0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8f6:	c9                   	leave  
 8f7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8f8:	8b 10                	mov    (%eax),%edx
 8fa:	89 11                	mov    %edx,(%ecx)
 8fc:	eb ec                	jmp    8ea <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fe:	89 c1                	mov    %eax,%ecx
 900:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 902:	8b 50 04             	mov    0x4(%eax),%edx
 905:	39 da                	cmp    %ebx,%edx
 907:	73 d4                	jae    8dd <malloc+0x46>
    if(p == freep)
 909:	39 05 88 0d 00 00    	cmp    %eax,0xd88
 90f:	75 ed                	jne    8fe <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 911:	89 d8                	mov    %ebx,%eax
 913:	e8 2f ff ff ff       	call   847 <morecore>
 918:	85 c0                	test   %eax,%eax
 91a:	75 e2                	jne    8fe <malloc+0x67>
 91c:	eb d5                	jmp    8f3 <malloc+0x5c>
