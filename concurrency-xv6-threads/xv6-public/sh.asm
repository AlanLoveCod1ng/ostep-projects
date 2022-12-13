
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   8:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
   b:	83 ec 08             	sub    $0x8,%esp
   e:	68 ec 0f 00 00       	push   $0xfec
  13:	6a 02                	push   $0x2
  15:	e8 22 0d 00 00       	call   d3c <printf>
  memset(buf, 0, nbuf);
  1a:	83 c4 0c             	add    $0xc,%esp
  1d:	56                   	push   %esi
  1e:	6a 00                	push   $0x0
  20:	53                   	push   %ebx
  21:	e8 ed 09 00 00       	call   a13 <memset>
  gets(buf, nbuf);
  26:	83 c4 08             	add    $0x8,%esp
  29:	56                   	push   %esi
  2a:	53                   	push   %ebx
  2b:	e8 1f 0a 00 00       	call   a4f <gets>
  if(buf[0] == 0) // EOF
  30:	83 c4 10             	add    $0x10,%esp
  33:	80 3b 00             	cmpb   $0x0,(%ebx)
  36:	74 0c                	je     44 <getcmd+0x44>
    return -1;
  return 0;
  38:	b8 00 00 00 00       	mov    $0x0,%eax
}
  3d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  40:	5b                   	pop    %ebx
  41:	5e                   	pop    %esi
  42:	5d                   	pop    %ebp
  43:	c3                   	ret    
    return -1;
  44:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  49:	eb f2                	jmp    3d <getcmd+0x3d>

0000004b <panic>:
  exit();
}

void
panic(char *s)
{
  4b:	55                   	push   %ebp
  4c:	89 e5                	mov    %esp,%ebp
  4e:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
  51:	ff 75 08             	push   0x8(%ebp)
  54:	68 89 10 00 00       	push   $0x1089
  59:	6a 02                	push   $0x2
  5b:	e8 dc 0c 00 00       	call   d3c <printf>
  exit();
  60:	e8 82 0b 00 00       	call   be7 <exit>

00000065 <fork1>:
}

int
fork1(void)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
  6b:	e8 6f 0b 00 00       	call   bdf <fork>
  if(pid == -1)
  70:	83 f8 ff             	cmp    $0xffffffff,%eax
  73:	74 02                	je     77 <fork1+0x12>
    panic("fork");
  return pid;
}
  75:	c9                   	leave  
  76:	c3                   	ret    
    panic("fork");
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 ef 0f 00 00       	push   $0xfef
  7f:	e8 c7 ff ff ff       	call   4b <panic>

00000084 <runcmd>:
{
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	53                   	push   %ebx
  88:	83 ec 14             	sub    $0x14,%esp
  8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
  8e:	85 db                	test   %ebx,%ebx
  90:	74 0e                	je     a0 <runcmd+0x1c>
  switch(cmd->type){
  92:	8b 03                	mov    (%ebx),%eax
  94:	83 f8 05             	cmp    $0x5,%eax
  97:	77 0c                	ja     a5 <runcmd+0x21>
  99:	ff 24 85 a4 10 00 00 	jmp    *0x10a4(,%eax,4)
    exit();
  a0:	e8 42 0b 00 00       	call   be7 <exit>
    panic("runcmd");
  a5:	83 ec 0c             	sub    $0xc,%esp
  a8:	68 f4 0f 00 00       	push   $0xff4
  ad:	e8 99 ff ff ff       	call   4b <panic>
    if(ecmd->argv[0] == 0)
  b2:	8b 43 04             	mov    0x4(%ebx),%eax
  b5:	85 c0                	test   %eax,%eax
  b7:	74 27                	je     e0 <runcmd+0x5c>
    exec(ecmd->argv[0], ecmd->argv);
  b9:	8d 53 04             	lea    0x4(%ebx),%edx
  bc:	83 ec 08             	sub    $0x8,%esp
  bf:	52                   	push   %edx
  c0:	50                   	push   %eax
  c1:	e8 59 0b 00 00       	call   c1f <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
  c6:	83 c4 0c             	add    $0xc,%esp
  c9:	ff 73 04             	push   0x4(%ebx)
  cc:	68 fb 0f 00 00       	push   $0xffb
  d1:	6a 02                	push   $0x2
  d3:	e8 64 0c 00 00       	call   d3c <printf>
    break;
  d8:	83 c4 10             	add    $0x10,%esp
  exit();
  db:	e8 07 0b 00 00       	call   be7 <exit>
      exit();
  e0:	e8 02 0b 00 00       	call   be7 <exit>
    close(rcmd->fd);
  e5:	83 ec 0c             	sub    $0xc,%esp
  e8:	ff 73 14             	push   0x14(%ebx)
  eb:	e8 1f 0b 00 00       	call   c0f <close>
    if(open(rcmd->file, rcmd->mode) < 0){
  f0:	83 c4 08             	add    $0x8,%esp
  f3:	ff 73 10             	push   0x10(%ebx)
  f6:	ff 73 08             	push   0x8(%ebx)
  f9:	e8 29 0b 00 00       	call   c27 <open>
  fe:	83 c4 10             	add    $0x10,%esp
 101:	85 c0                	test   %eax,%eax
 103:	78 0b                	js     110 <runcmd+0x8c>
    runcmd(rcmd->cmd);
 105:	83 ec 0c             	sub    $0xc,%esp
 108:	ff 73 04             	push   0x4(%ebx)
 10b:	e8 74 ff ff ff       	call   84 <runcmd>
      printf(2, "open %s failed\n", rcmd->file);
 110:	83 ec 04             	sub    $0x4,%esp
 113:	ff 73 08             	push   0x8(%ebx)
 116:	68 0b 10 00 00       	push   $0x100b
 11b:	6a 02                	push   $0x2
 11d:	e8 1a 0c 00 00       	call   d3c <printf>
      exit();
 122:	e8 c0 0a 00 00       	call   be7 <exit>
    if(fork1() == 0)
 127:	e8 39 ff ff ff       	call   65 <fork1>
 12c:	85 c0                	test   %eax,%eax
 12e:	74 10                	je     140 <runcmd+0xbc>
    wait();
 130:	e8 ba 0a 00 00       	call   bef <wait>
    runcmd(lcmd->right);
 135:	83 ec 0c             	sub    $0xc,%esp
 138:	ff 73 08             	push   0x8(%ebx)
 13b:	e8 44 ff ff ff       	call   84 <runcmd>
      runcmd(lcmd->left);
 140:	83 ec 0c             	sub    $0xc,%esp
 143:	ff 73 04             	push   0x4(%ebx)
 146:	e8 39 ff ff ff       	call   84 <runcmd>
    if(pipe(p) < 0)
 14b:	83 ec 0c             	sub    $0xc,%esp
 14e:	8d 45 f0             	lea    -0x10(%ebp),%eax
 151:	50                   	push   %eax
 152:	e8 a0 0a 00 00       	call   bf7 <pipe>
 157:	83 c4 10             	add    $0x10,%esp
 15a:	85 c0                	test   %eax,%eax
 15c:	78 3a                	js     198 <runcmd+0x114>
    if(fork1() == 0){
 15e:	e8 02 ff ff ff       	call   65 <fork1>
 163:	85 c0                	test   %eax,%eax
 165:	74 3e                	je     1a5 <runcmd+0x121>
    if(fork1() == 0){
 167:	e8 f9 fe ff ff       	call   65 <fork1>
 16c:	85 c0                	test   %eax,%eax
 16e:	74 6b                	je     1db <runcmd+0x157>
    close(p[0]);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	ff 75 f0             	push   -0x10(%ebp)
 176:	e8 94 0a 00 00       	call   c0f <close>
    close(p[1]);
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 75 f4             	push   -0xc(%ebp)
 181:	e8 89 0a 00 00       	call   c0f <close>
    wait();
 186:	e8 64 0a 00 00       	call   bef <wait>
    wait();
 18b:	e8 5f 0a 00 00       	call   bef <wait>
    break;
 190:	83 c4 10             	add    $0x10,%esp
 193:	e9 43 ff ff ff       	jmp    db <runcmd+0x57>
      panic("pipe");
 198:	83 ec 0c             	sub    $0xc,%esp
 19b:	68 1b 10 00 00       	push   $0x101b
 1a0:	e8 a6 fe ff ff       	call   4b <panic>
      close(1);
 1a5:	83 ec 0c             	sub    $0xc,%esp
 1a8:	6a 01                	push   $0x1
 1aa:	e8 60 0a 00 00       	call   c0f <close>
      dup(p[1]);
 1af:	83 c4 04             	add    $0x4,%esp
 1b2:	ff 75 f4             	push   -0xc(%ebp)
 1b5:	e8 a5 0a 00 00       	call   c5f <dup>
      close(p[0]);
 1ba:	83 c4 04             	add    $0x4,%esp
 1bd:	ff 75 f0             	push   -0x10(%ebp)
 1c0:	e8 4a 0a 00 00       	call   c0f <close>
      close(p[1]);
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 75 f4             	push   -0xc(%ebp)
 1cb:	e8 3f 0a 00 00       	call   c0f <close>
      runcmd(pcmd->left);
 1d0:	83 c4 04             	add    $0x4,%esp
 1d3:	ff 73 04             	push   0x4(%ebx)
 1d6:	e8 a9 fe ff ff       	call   84 <runcmd>
      close(0);
 1db:	83 ec 0c             	sub    $0xc,%esp
 1de:	6a 00                	push   $0x0
 1e0:	e8 2a 0a 00 00       	call   c0f <close>
      dup(p[0]);
 1e5:	83 c4 04             	add    $0x4,%esp
 1e8:	ff 75 f0             	push   -0x10(%ebp)
 1eb:	e8 6f 0a 00 00       	call   c5f <dup>
      close(p[0]);
 1f0:	83 c4 04             	add    $0x4,%esp
 1f3:	ff 75 f0             	push   -0x10(%ebp)
 1f6:	e8 14 0a 00 00       	call   c0f <close>
      close(p[1]);
 1fb:	83 c4 04             	add    $0x4,%esp
 1fe:	ff 75 f4             	push   -0xc(%ebp)
 201:	e8 09 0a 00 00       	call   c0f <close>
      runcmd(pcmd->right);
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 73 08             	push   0x8(%ebx)
 20c:	e8 73 fe ff ff       	call   84 <runcmd>
    if(fork1() == 0)
 211:	e8 4f fe ff ff       	call   65 <fork1>
 216:	85 c0                	test   %eax,%eax
 218:	0f 85 bd fe ff ff    	jne    db <runcmd+0x57>
      runcmd(bcmd->cmd);
 21e:	83 ec 0c             	sub    $0xc,%esp
 221:	ff 73 04             	push   0x4(%ebx)
 224:	e8 5b fe ff ff       	call   84 <runcmd>

00000229 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
 22c:	53                   	push   %ebx
 22d:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
 230:	6a 54                	push   $0x54
 232:	e8 2b 0d 00 00       	call   f62 <malloc>
 237:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 239:	83 c4 0c             	add    $0xc,%esp
 23c:	6a 54                	push   $0x54
 23e:	6a 00                	push   $0x0
 240:	50                   	push   %eax
 241:	e8 cd 07 00 00       	call   a13 <memset>
  cmd->type = EXEC;
 246:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
 24c:	89 d8                	mov    %ebx,%eax
 24e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 251:	c9                   	leave  
 252:	c3                   	ret    

00000253 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
 253:	55                   	push   %ebp
 254:	89 e5                	mov    %esp,%ebp
 256:	53                   	push   %ebx
 257:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
 25a:	6a 18                	push   $0x18
 25c:	e8 01 0d 00 00       	call   f62 <malloc>
 261:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 263:	83 c4 0c             	add    $0xc,%esp
 266:	6a 18                	push   $0x18
 268:	6a 00                	push   $0x0
 26a:	50                   	push   %eax
 26b:	e8 a3 07 00 00       	call   a13 <memset>
  cmd->type = REDIR;
 270:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
 27c:	8b 45 0c             	mov    0xc(%ebp),%eax
 27f:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
 282:	8b 45 10             	mov    0x10(%ebp),%eax
 285:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
 288:	8b 45 14             	mov    0x14(%ebp),%eax
 28b:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
 28e:	8b 45 18             	mov    0x18(%ebp),%eax
 291:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
 294:	89 d8                	mov    %ebx,%eax
 296:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 299:	c9                   	leave  
 29a:	c3                   	ret    

0000029b <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	53                   	push   %ebx
 29f:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
 2a2:	6a 0c                	push   $0xc
 2a4:	e8 b9 0c 00 00       	call   f62 <malloc>
 2a9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 2ab:	83 c4 0c             	add    $0xc,%esp
 2ae:	6a 0c                	push   $0xc
 2b0:	6a 00                	push   $0x0
 2b2:	50                   	push   %eax
 2b3:	e8 5b 07 00 00       	call   a13 <memset>
  cmd->type = PIPE;
 2b8:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
 2c1:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
 2c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c7:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
 2ca:	89 d8                	mov    %ebx,%eax
 2cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cf:	c9                   	leave  
 2d0:	c3                   	ret    

000002d1 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
 2d1:	55                   	push   %ebp
 2d2:	89 e5                	mov    %esp,%ebp
 2d4:	53                   	push   %ebx
 2d5:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
 2d8:	6a 0c                	push   $0xc
 2da:	e8 83 0c 00 00       	call   f62 <malloc>
 2df:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 2e1:	83 c4 0c             	add    $0xc,%esp
 2e4:	6a 0c                	push   $0xc
 2e6:	6a 00                	push   $0x0
 2e8:	50                   	push   %eax
 2e9:	e8 25 07 00 00       	call   a13 <memset>
  cmd->type = LIST;
 2ee:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
 2fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fd:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
 300:	89 d8                	mov    %ebx,%eax
 302:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 305:	c9                   	leave  
 306:	c3                   	ret    

00000307 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
 307:	55                   	push   %ebp
 308:	89 e5                	mov    %esp,%ebp
 30a:	53                   	push   %ebx
 30b:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
 30e:	6a 08                	push   $0x8
 310:	e8 4d 0c 00 00       	call   f62 <malloc>
 315:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
 317:	83 c4 0c             	add    $0xc,%esp
 31a:	6a 08                	push   $0x8
 31c:	6a 00                	push   $0x0
 31e:	50                   	push   %eax
 31f:	e8 ef 06 00 00       	call   a13 <memset>
  cmd->type = BACK;
 324:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
 32a:	8b 45 08             	mov    0x8(%ebp),%eax
 32d:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
 330:	89 d8                	mov    %ebx,%eax
 332:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 335:	c9                   	leave  
 336:	c3                   	ret    

00000337 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
 337:	55                   	push   %ebp
 338:	89 e5                	mov    %esp,%ebp
 33a:	57                   	push   %edi
 33b:	56                   	push   %esi
 33c:	53                   	push   %ebx
 33d:	83 ec 0c             	sub    $0xc,%esp
 340:	8b 75 0c             	mov    0xc(%ebp),%esi
 343:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *s;
  int ret;

  s = *ps;
 346:	8b 45 08             	mov    0x8(%ebp),%eax
 349:	8b 18                	mov    (%eax),%ebx
  while(s < es && strchr(whitespace, *s))
 34b:	eb 03                	jmp    350 <gettoken+0x19>
    s++;
 34d:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
 350:	39 f3                	cmp    %esi,%ebx
 352:	73 18                	jae    36c <gettoken+0x35>
 354:	83 ec 08             	sub    $0x8,%esp
 357:	0f be 03             	movsbl (%ebx),%eax
 35a:	50                   	push   %eax
 35b:	68 58 17 00 00       	push   $0x1758
 360:	e8 c7 06 00 00       	call   a2c <strchr>
 365:	83 c4 10             	add    $0x10,%esp
 368:	85 c0                	test   %eax,%eax
 36a:	75 e1                	jne    34d <gettoken+0x16>
  if(q)
 36c:	85 ff                	test   %edi,%edi
 36e:	74 02                	je     372 <gettoken+0x3b>
    *q = s;
 370:	89 1f                	mov    %ebx,(%edi)
  ret = *s;
 372:	0f b6 03             	movzbl (%ebx),%eax
 375:	0f be f8             	movsbl %al,%edi
  switch(*s){
 378:	3c 3c                	cmp    $0x3c,%al
 37a:	7f 27                	jg     3a3 <gettoken+0x6c>
 37c:	3c 3b                	cmp    $0x3b,%al
 37e:	7d 13                	jge    393 <gettoken+0x5c>
 380:	84 c0                	test   %al,%al
 382:	74 12                	je     396 <gettoken+0x5f>
 384:	78 41                	js     3c7 <gettoken+0x90>
 386:	3c 26                	cmp    $0x26,%al
 388:	74 09                	je     393 <gettoken+0x5c>
 38a:	7c 3b                	jl     3c7 <gettoken+0x90>
 38c:	83 e8 28             	sub    $0x28,%eax
 38f:	3c 01                	cmp    $0x1,%al
 391:	77 34                	ja     3c7 <gettoken+0x90>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
 393:	83 c3 01             	add    $0x1,%ebx
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
 396:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 39a:	74 77                	je     413 <gettoken+0xdc>
    *eq = s;
 39c:	8b 45 14             	mov    0x14(%ebp),%eax
 39f:	89 18                	mov    %ebx,(%eax)
 3a1:	eb 70                	jmp    413 <gettoken+0xdc>
  switch(*s){
 3a3:	3c 3e                	cmp    $0x3e,%al
 3a5:	75 0d                	jne    3b4 <gettoken+0x7d>
    s++;
 3a7:	8d 43 01             	lea    0x1(%ebx),%eax
    if(*s == '>'){
 3aa:	80 7b 01 3e          	cmpb   $0x3e,0x1(%ebx)
 3ae:	74 0a                	je     3ba <gettoken+0x83>
    s++;
 3b0:	89 c3                	mov    %eax,%ebx
 3b2:	eb e2                	jmp    396 <gettoken+0x5f>
  switch(*s){
 3b4:	3c 7c                	cmp    $0x7c,%al
 3b6:	75 0f                	jne    3c7 <gettoken+0x90>
 3b8:	eb d9                	jmp    393 <gettoken+0x5c>
      s++;
 3ba:	83 c3 02             	add    $0x2,%ebx
      ret = '+';
 3bd:	bf 2b 00 00 00       	mov    $0x2b,%edi
 3c2:	eb d2                	jmp    396 <gettoken+0x5f>
      s++;
 3c4:	83 c3 01             	add    $0x1,%ebx
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
 3c7:	39 f3                	cmp    %esi,%ebx
 3c9:	73 37                	jae    402 <gettoken+0xcb>
 3cb:	83 ec 08             	sub    $0x8,%esp
 3ce:	0f be 03             	movsbl (%ebx),%eax
 3d1:	50                   	push   %eax
 3d2:	68 58 17 00 00       	push   $0x1758
 3d7:	e8 50 06 00 00       	call   a2c <strchr>
 3dc:	83 c4 10             	add    $0x10,%esp
 3df:	85 c0                	test   %eax,%eax
 3e1:	75 26                	jne    409 <gettoken+0xd2>
 3e3:	83 ec 08             	sub    $0x8,%esp
 3e6:	0f be 03             	movsbl (%ebx),%eax
 3e9:	50                   	push   %eax
 3ea:	68 50 17 00 00       	push   $0x1750
 3ef:	e8 38 06 00 00       	call   a2c <strchr>
 3f4:	83 c4 10             	add    $0x10,%esp
 3f7:	85 c0                	test   %eax,%eax
 3f9:	74 c9                	je     3c4 <gettoken+0x8d>
    ret = 'a';
 3fb:	bf 61 00 00 00       	mov    $0x61,%edi
 400:	eb 94                	jmp    396 <gettoken+0x5f>
 402:	bf 61 00 00 00       	mov    $0x61,%edi
 407:	eb 8d                	jmp    396 <gettoken+0x5f>
 409:	bf 61 00 00 00       	mov    $0x61,%edi
 40e:	eb 86                	jmp    396 <gettoken+0x5f>

  while(s < es && strchr(whitespace, *s))
    s++;
 410:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
 413:	39 f3                	cmp    %esi,%ebx
 415:	73 18                	jae    42f <gettoken+0xf8>
 417:	83 ec 08             	sub    $0x8,%esp
 41a:	0f be 03             	movsbl (%ebx),%eax
 41d:	50                   	push   %eax
 41e:	68 58 17 00 00       	push   $0x1758
 423:	e8 04 06 00 00       	call   a2c <strchr>
 428:	83 c4 10             	add    $0x10,%esp
 42b:	85 c0                	test   %eax,%eax
 42d:	75 e1                	jne    410 <gettoken+0xd9>
  *ps = s;
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
 432:	89 18                	mov    %ebx,(%eax)
  return ret;
}
 434:	89 f8                	mov    %edi,%eax
 436:	8d 65 f4             	lea    -0xc(%ebp),%esp
 439:	5b                   	pop    %ebx
 43a:	5e                   	pop    %esi
 43b:	5f                   	pop    %edi
 43c:	5d                   	pop    %ebp
 43d:	c3                   	ret    

0000043e <peek>:

int
peek(char **ps, char *es, char *toks)
{
 43e:	55                   	push   %ebp
 43f:	89 e5                	mov    %esp,%ebp
 441:	57                   	push   %edi
 442:	56                   	push   %esi
 443:	53                   	push   %ebx
 444:	83 ec 0c             	sub    $0xc,%esp
 447:	8b 7d 08             	mov    0x8(%ebp),%edi
 44a:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
 44d:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
 44f:	eb 03                	jmp    454 <peek+0x16>
    s++;
 451:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
 454:	39 f3                	cmp    %esi,%ebx
 456:	73 18                	jae    470 <peek+0x32>
 458:	83 ec 08             	sub    $0x8,%esp
 45b:	0f be 03             	movsbl (%ebx),%eax
 45e:	50                   	push   %eax
 45f:	68 58 17 00 00       	push   $0x1758
 464:	e8 c3 05 00 00       	call   a2c <strchr>
 469:	83 c4 10             	add    $0x10,%esp
 46c:	85 c0                	test   %eax,%eax
 46e:	75 e1                	jne    451 <peek+0x13>
  *ps = s;
 470:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
 472:	0f b6 03             	movzbl (%ebx),%eax
 475:	84 c0                	test   %al,%al
 477:	75 0d                	jne    486 <peek+0x48>
 479:	b8 00 00 00 00       	mov    $0x0,%eax
}
 47e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 481:	5b                   	pop    %ebx
 482:	5e                   	pop    %esi
 483:	5f                   	pop    %edi
 484:	5d                   	pop    %ebp
 485:	c3                   	ret    
  return *s && strchr(toks, *s);
 486:	83 ec 08             	sub    $0x8,%esp
 489:	0f be c0             	movsbl %al,%eax
 48c:	50                   	push   %eax
 48d:	ff 75 10             	push   0x10(%ebp)
 490:	e8 97 05 00 00       	call   a2c <strchr>
 495:	83 c4 10             	add    $0x10,%esp
 498:	85 c0                	test   %eax,%eax
 49a:	74 07                	je     4a3 <peek+0x65>
 49c:	b8 01 00 00 00       	mov    $0x1,%eax
 4a1:	eb db                	jmp    47e <peek+0x40>
 4a3:	b8 00 00 00 00       	mov    $0x0,%eax
 4a8:	eb d4                	jmp    47e <peek+0x40>

000004aa <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
 4aa:	55                   	push   %ebp
 4ab:	89 e5                	mov    %esp,%ebp
 4ad:	57                   	push   %edi
 4ae:	56                   	push   %esi
 4af:	53                   	push   %ebx
 4b0:	83 ec 1c             	sub    $0x1c,%esp
 4b3:	8b 7d 0c             	mov    0xc(%ebp),%edi
 4b6:	8b 75 10             	mov    0x10(%ebp),%esi
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
 4b9:	eb 28                	jmp    4e3 <parseredirs+0x39>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
 4bb:	83 ec 0c             	sub    $0xc,%esp
 4be:	68 20 10 00 00       	push   $0x1020
 4c3:	e8 83 fb ff ff       	call   4b <panic>
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
 4c8:	83 ec 0c             	sub    $0xc,%esp
 4cb:	6a 00                	push   $0x0
 4cd:	6a 00                	push   $0x0
 4cf:	ff 75 e0             	push   -0x20(%ebp)
 4d2:	ff 75 e4             	push   -0x1c(%ebp)
 4d5:	ff 75 08             	push   0x8(%ebp)
 4d8:	e8 76 fd ff ff       	call   253 <redircmd>
 4dd:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
 4e0:	83 c4 20             	add    $0x20,%esp
  while(peek(ps, es, "<>")){
 4e3:	83 ec 04             	sub    $0x4,%esp
 4e6:	68 3d 10 00 00       	push   $0x103d
 4eb:	56                   	push   %esi
 4ec:	57                   	push   %edi
 4ed:	e8 4c ff ff ff       	call   43e <peek>
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	85 c0                	test   %eax,%eax
 4f7:	74 76                	je     56f <parseredirs+0xc5>
    tok = gettoken(ps, es, 0, 0);
 4f9:	6a 00                	push   $0x0
 4fb:	6a 00                	push   $0x0
 4fd:	56                   	push   %esi
 4fe:	57                   	push   %edi
 4ff:	e8 33 fe ff ff       	call   337 <gettoken>
 504:	89 c3                	mov    %eax,%ebx
    if(gettoken(ps, es, &q, &eq) != 'a')
 506:	8d 45 e0             	lea    -0x20(%ebp),%eax
 509:	50                   	push   %eax
 50a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 50d:	50                   	push   %eax
 50e:	56                   	push   %esi
 50f:	57                   	push   %edi
 510:	e8 22 fe ff ff       	call   337 <gettoken>
 515:	83 c4 20             	add    $0x20,%esp
 518:	83 f8 61             	cmp    $0x61,%eax
 51b:	75 9e                	jne    4bb <parseredirs+0x11>
    switch(tok){
 51d:	83 fb 3c             	cmp    $0x3c,%ebx
 520:	74 a6                	je     4c8 <parseredirs+0x1e>
 522:	83 fb 3e             	cmp    $0x3e,%ebx
 525:	74 25                	je     54c <parseredirs+0xa2>
 527:	83 fb 2b             	cmp    $0x2b,%ebx
 52a:	75 b7                	jne    4e3 <parseredirs+0x39>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
 52c:	83 ec 0c             	sub    $0xc,%esp
 52f:	6a 01                	push   $0x1
 531:	68 01 02 00 00       	push   $0x201
 536:	ff 75 e0             	push   -0x20(%ebp)
 539:	ff 75 e4             	push   -0x1c(%ebp)
 53c:	ff 75 08             	push   0x8(%ebp)
 53f:	e8 0f fd ff ff       	call   253 <redircmd>
 544:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
 547:	83 c4 20             	add    $0x20,%esp
 54a:	eb 97                	jmp    4e3 <parseredirs+0x39>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
 54c:	83 ec 0c             	sub    $0xc,%esp
 54f:	6a 01                	push   $0x1
 551:	68 01 02 00 00       	push   $0x201
 556:	ff 75 e0             	push   -0x20(%ebp)
 559:	ff 75 e4             	push   -0x1c(%ebp)
 55c:	ff 75 08             	push   0x8(%ebp)
 55f:	e8 ef fc ff ff       	call   253 <redircmd>
 564:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
 567:	83 c4 20             	add    $0x20,%esp
 56a:	e9 74 ff ff ff       	jmp    4e3 <parseredirs+0x39>
    }
  }
  return cmd;
}
 56f:	8b 45 08             	mov    0x8(%ebp),%eax
 572:	8d 65 f4             	lea    -0xc(%ebp),%esp
 575:	5b                   	pop    %ebx
 576:	5e                   	pop    %esi
 577:	5f                   	pop    %edi
 578:	5d                   	pop    %ebp
 579:	c3                   	ret    

0000057a <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
 57a:	55                   	push   %ebp
 57b:	89 e5                	mov    %esp,%ebp
 57d:	57                   	push   %edi
 57e:	56                   	push   %esi
 57f:	53                   	push   %ebx
 580:	83 ec 30             	sub    $0x30,%esp
 583:	8b 75 08             	mov    0x8(%ebp),%esi
 586:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
 589:	68 40 10 00 00       	push   $0x1040
 58e:	57                   	push   %edi
 58f:	56                   	push   %esi
 590:	e8 a9 fe ff ff       	call   43e <peek>
 595:	83 c4 10             	add    $0x10,%esp
 598:	85 c0                	test   %eax,%eax
 59a:	75 1d                	jne    5b9 <parseexec+0x3f>
 59c:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
 59e:	e8 86 fc ff ff       	call   229 <execcmd>
 5a3:	89 45 d0             	mov    %eax,-0x30(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
 5a6:	83 ec 04             	sub    $0x4,%esp
 5a9:	57                   	push   %edi
 5aa:	56                   	push   %esi
 5ab:	50                   	push   %eax
 5ac:	e8 f9 fe ff ff       	call   4aa <parseredirs>
 5b1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
 5b4:	83 c4 10             	add    $0x10,%esp
 5b7:	eb 3b                	jmp    5f4 <parseexec+0x7a>
    return parseblock(ps, es);
 5b9:	83 ec 08             	sub    $0x8,%esp
 5bc:	57                   	push   %edi
 5bd:	56                   	push   %esi
 5be:	e8 8f 01 00 00       	call   752 <parseblock>
 5c3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5c6:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
 5c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cf:	5b                   	pop    %ebx
 5d0:	5e                   	pop    %esi
 5d1:	5f                   	pop    %edi
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
      panic("syntax");
 5d4:	83 ec 0c             	sub    $0xc,%esp
 5d7:	68 42 10 00 00       	push   $0x1042
 5dc:	e8 6a fa ff ff       	call   4b <panic>
    ret = parseredirs(ret, ps, es);
 5e1:	83 ec 04             	sub    $0x4,%esp
 5e4:	57                   	push   %edi
 5e5:	56                   	push   %esi
 5e6:	ff 75 d4             	push   -0x2c(%ebp)
 5e9:	e8 bc fe ff ff       	call   4aa <parseredirs>
 5ee:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5f1:	83 c4 10             	add    $0x10,%esp
  while(!peek(ps, es, "|)&;")){
 5f4:	83 ec 04             	sub    $0x4,%esp
 5f7:	68 57 10 00 00       	push   $0x1057
 5fc:	57                   	push   %edi
 5fd:	56                   	push   %esi
 5fe:	e8 3b fe ff ff       	call   43e <peek>
 603:	83 c4 10             	add    $0x10,%esp
 606:	85 c0                	test   %eax,%eax
 608:	75 41                	jne    64b <parseexec+0xd1>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
 60a:	8d 45 e0             	lea    -0x20(%ebp),%eax
 60d:	50                   	push   %eax
 60e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 611:	50                   	push   %eax
 612:	57                   	push   %edi
 613:	56                   	push   %esi
 614:	e8 1e fd ff ff       	call   337 <gettoken>
 619:	83 c4 10             	add    $0x10,%esp
 61c:	85 c0                	test   %eax,%eax
 61e:	74 2b                	je     64b <parseexec+0xd1>
    if(tok != 'a')
 620:	83 f8 61             	cmp    $0x61,%eax
 623:	75 af                	jne    5d4 <parseexec+0x5a>
    cmd->argv[argc] = q;
 625:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 628:	8b 55 d0             	mov    -0x30(%ebp),%edx
 62b:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
 62f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 632:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
 636:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
 639:	83 fb 09             	cmp    $0x9,%ebx
 63c:	7e a3                	jle    5e1 <parseexec+0x67>
      panic("too many args");
 63e:	83 ec 0c             	sub    $0xc,%esp
 641:	68 49 10 00 00       	push   $0x1049
 646:	e8 00 fa ff ff       	call   4b <panic>
  cmd->argv[argc] = 0;
 64b:	8b 45 d0             	mov    -0x30(%ebp),%eax
 64e:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
 655:	00 
  cmd->eargv[argc] = 0;
 656:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
 65d:	00 
  return ret;
 65e:	e9 66 ff ff ff       	jmp    5c9 <parseexec+0x4f>

00000663 <parsepipe>:
{
 663:	55                   	push   %ebp
 664:	89 e5                	mov    %esp,%ebp
 666:	57                   	push   %edi
 667:	56                   	push   %esi
 668:	53                   	push   %ebx
 669:	83 ec 14             	sub    $0x14,%esp
 66c:	8b 75 08             	mov    0x8(%ebp),%esi
 66f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
 672:	57                   	push   %edi
 673:	56                   	push   %esi
 674:	e8 01 ff ff ff       	call   57a <parseexec>
 679:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
 67b:	83 c4 0c             	add    $0xc,%esp
 67e:	68 5c 10 00 00       	push   $0x105c
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	e8 b4 fd ff ff       	call   43e <peek>
 68a:	83 c4 10             	add    $0x10,%esp
 68d:	85 c0                	test   %eax,%eax
 68f:	75 0a                	jne    69b <parsepipe+0x38>
}
 691:	89 d8                	mov    %ebx,%eax
 693:	8d 65 f4             	lea    -0xc(%ebp),%esp
 696:	5b                   	pop    %ebx
 697:	5e                   	pop    %esi
 698:	5f                   	pop    %edi
 699:	5d                   	pop    %ebp
 69a:	c3                   	ret    
    gettoken(ps, es, 0, 0);
 69b:	6a 00                	push   $0x0
 69d:	6a 00                	push   $0x0
 69f:	57                   	push   %edi
 6a0:	56                   	push   %esi
 6a1:	e8 91 fc ff ff       	call   337 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
 6a6:	83 c4 08             	add    $0x8,%esp
 6a9:	57                   	push   %edi
 6aa:	56                   	push   %esi
 6ab:	e8 b3 ff ff ff       	call   663 <parsepipe>
 6b0:	83 c4 08             	add    $0x8,%esp
 6b3:	50                   	push   %eax
 6b4:	53                   	push   %ebx
 6b5:	e8 e1 fb ff ff       	call   29b <pipecmd>
 6ba:	89 c3                	mov    %eax,%ebx
 6bc:	83 c4 10             	add    $0x10,%esp
  return cmd;
 6bf:	eb d0                	jmp    691 <parsepipe+0x2e>

000006c1 <parseline>:
{
 6c1:	55                   	push   %ebp
 6c2:	89 e5                	mov    %esp,%ebp
 6c4:	57                   	push   %edi
 6c5:	56                   	push   %esi
 6c6:	53                   	push   %ebx
 6c7:	83 ec 14             	sub    $0x14,%esp
 6ca:	8b 75 08             	mov    0x8(%ebp),%esi
 6cd:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
 6d0:	57                   	push   %edi
 6d1:	56                   	push   %esi
 6d2:	e8 8c ff ff ff       	call   663 <parsepipe>
 6d7:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
 6d9:	83 c4 10             	add    $0x10,%esp
 6dc:	eb 18                	jmp    6f6 <parseline+0x35>
    gettoken(ps, es, 0, 0);
 6de:	6a 00                	push   $0x0
 6e0:	6a 00                	push   $0x0
 6e2:	57                   	push   %edi
 6e3:	56                   	push   %esi
 6e4:	e8 4e fc ff ff       	call   337 <gettoken>
    cmd = backcmd(cmd);
 6e9:	89 1c 24             	mov    %ebx,(%esp)
 6ec:	e8 16 fc ff ff       	call   307 <backcmd>
 6f1:	89 c3                	mov    %eax,%ebx
 6f3:	83 c4 10             	add    $0x10,%esp
  while(peek(ps, es, "&")){
 6f6:	83 ec 04             	sub    $0x4,%esp
 6f9:	68 5e 10 00 00       	push   $0x105e
 6fe:	57                   	push   %edi
 6ff:	56                   	push   %esi
 700:	e8 39 fd ff ff       	call   43e <peek>
 705:	83 c4 10             	add    $0x10,%esp
 708:	85 c0                	test   %eax,%eax
 70a:	75 d2                	jne    6de <parseline+0x1d>
  if(peek(ps, es, ";")){
 70c:	83 ec 04             	sub    $0x4,%esp
 70f:	68 5a 10 00 00       	push   $0x105a
 714:	57                   	push   %edi
 715:	56                   	push   %esi
 716:	e8 23 fd ff ff       	call   43e <peek>
 71b:	83 c4 10             	add    $0x10,%esp
 71e:	85 c0                	test   %eax,%eax
 720:	75 0a                	jne    72c <parseline+0x6b>
}
 722:	89 d8                	mov    %ebx,%eax
 724:	8d 65 f4             	lea    -0xc(%ebp),%esp
 727:	5b                   	pop    %ebx
 728:	5e                   	pop    %esi
 729:	5f                   	pop    %edi
 72a:	5d                   	pop    %ebp
 72b:	c3                   	ret    
    gettoken(ps, es, 0, 0);
 72c:	6a 00                	push   $0x0
 72e:	6a 00                	push   $0x0
 730:	57                   	push   %edi
 731:	56                   	push   %esi
 732:	e8 00 fc ff ff       	call   337 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
 737:	83 c4 08             	add    $0x8,%esp
 73a:	57                   	push   %edi
 73b:	56                   	push   %esi
 73c:	e8 80 ff ff ff       	call   6c1 <parseline>
 741:	83 c4 08             	add    $0x8,%esp
 744:	50                   	push   %eax
 745:	53                   	push   %ebx
 746:	e8 86 fb ff ff       	call   2d1 <listcmd>
 74b:	89 c3                	mov    %eax,%ebx
 74d:	83 c4 10             	add    $0x10,%esp
  return cmd;
 750:	eb d0                	jmp    722 <parseline+0x61>

00000752 <parseblock>:
{
 752:	55                   	push   %ebp
 753:	89 e5                	mov    %esp,%ebp
 755:	57                   	push   %edi
 756:	56                   	push   %esi
 757:	53                   	push   %ebx
 758:	83 ec 10             	sub    $0x10,%esp
 75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 75e:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
 761:	68 40 10 00 00       	push   $0x1040
 766:	56                   	push   %esi
 767:	53                   	push   %ebx
 768:	e8 d1 fc ff ff       	call   43e <peek>
 76d:	83 c4 10             	add    $0x10,%esp
 770:	85 c0                	test   %eax,%eax
 772:	74 4b                	je     7bf <parseblock+0x6d>
  gettoken(ps, es, 0, 0);
 774:	6a 00                	push   $0x0
 776:	6a 00                	push   $0x0
 778:	56                   	push   %esi
 779:	53                   	push   %ebx
 77a:	e8 b8 fb ff ff       	call   337 <gettoken>
  cmd = parseline(ps, es);
 77f:	83 c4 08             	add    $0x8,%esp
 782:	56                   	push   %esi
 783:	53                   	push   %ebx
 784:	e8 38 ff ff ff       	call   6c1 <parseline>
 789:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
 78b:	83 c4 0c             	add    $0xc,%esp
 78e:	68 7c 10 00 00       	push   $0x107c
 793:	56                   	push   %esi
 794:	53                   	push   %ebx
 795:	e8 a4 fc ff ff       	call   43e <peek>
 79a:	83 c4 10             	add    $0x10,%esp
 79d:	85 c0                	test   %eax,%eax
 79f:	74 2b                	je     7cc <parseblock+0x7a>
  gettoken(ps, es, 0, 0);
 7a1:	6a 00                	push   $0x0
 7a3:	6a 00                	push   $0x0
 7a5:	56                   	push   %esi
 7a6:	53                   	push   %ebx
 7a7:	e8 8b fb ff ff       	call   337 <gettoken>
  cmd = parseredirs(cmd, ps, es);
 7ac:	83 c4 0c             	add    $0xc,%esp
 7af:	56                   	push   %esi
 7b0:	53                   	push   %ebx
 7b1:	57                   	push   %edi
 7b2:	e8 f3 fc ff ff       	call   4aa <parseredirs>
}
 7b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ba:	5b                   	pop    %ebx
 7bb:	5e                   	pop    %esi
 7bc:	5f                   	pop    %edi
 7bd:	5d                   	pop    %ebp
 7be:	c3                   	ret    
    panic("parseblock");
 7bf:	83 ec 0c             	sub    $0xc,%esp
 7c2:	68 60 10 00 00       	push   $0x1060
 7c7:	e8 7f f8 ff ff       	call   4b <panic>
    panic("syntax - missing )");
 7cc:	83 ec 0c             	sub    $0xc,%esp
 7cf:	68 6b 10 00 00       	push   $0x106b
 7d4:	e8 72 f8 ff ff       	call   4b <panic>

000007d9 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
 7d9:	55                   	push   %ebp
 7da:	89 e5                	mov    %esp,%ebp
 7dc:	53                   	push   %ebx
 7dd:	83 ec 04             	sub    $0x4,%esp
 7e0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
 7e3:	85 db                	test   %ebx,%ebx
 7e5:	74 1f                	je     806 <nulterminate+0x2d>
    return 0;

  switch(cmd->type){
 7e7:	8b 03                	mov    (%ebx),%eax
 7e9:	83 f8 05             	cmp    $0x5,%eax
 7ec:	77 18                	ja     806 <nulterminate+0x2d>
 7ee:	ff 24 85 bc 10 00 00 	jmp    *0x10bc(,%eax,4)
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
 7f5:	8b 54 83 2c          	mov    0x2c(%ebx,%eax,4),%edx
 7f9:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
 7fc:	83 c0 01             	add    $0x1,%eax
 7ff:	83 7c 83 04 00       	cmpl   $0x0,0x4(%ebx,%eax,4)
 804:	75 ef                	jne    7f5 <nulterminate+0x1c>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
 806:	89 d8                	mov    %ebx,%eax
 808:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80b:	c9                   	leave  
 80c:	c3                   	ret    
  switch(cmd->type){
 80d:	b8 00 00 00 00       	mov    $0x0,%eax
 812:	eb eb                	jmp    7ff <nulterminate+0x26>
    nulterminate(rcmd->cmd);
 814:	83 ec 0c             	sub    $0xc,%esp
 817:	ff 73 04             	push   0x4(%ebx)
 81a:	e8 ba ff ff ff       	call   7d9 <nulterminate>
    *rcmd->efile = 0;
 81f:	8b 43 0c             	mov    0xc(%ebx),%eax
 822:	c6 00 00             	movb   $0x0,(%eax)
    break;
 825:	83 c4 10             	add    $0x10,%esp
 828:	eb dc                	jmp    806 <nulterminate+0x2d>
    nulterminate(pcmd->left);
 82a:	83 ec 0c             	sub    $0xc,%esp
 82d:	ff 73 04             	push   0x4(%ebx)
 830:	e8 a4 ff ff ff       	call   7d9 <nulterminate>
    nulterminate(pcmd->right);
 835:	83 c4 04             	add    $0x4,%esp
 838:	ff 73 08             	push   0x8(%ebx)
 83b:	e8 99 ff ff ff       	call   7d9 <nulterminate>
    break;
 840:	83 c4 10             	add    $0x10,%esp
 843:	eb c1                	jmp    806 <nulterminate+0x2d>
    nulterminate(lcmd->left);
 845:	83 ec 0c             	sub    $0xc,%esp
 848:	ff 73 04             	push   0x4(%ebx)
 84b:	e8 89 ff ff ff       	call   7d9 <nulterminate>
    nulterminate(lcmd->right);
 850:	83 c4 04             	add    $0x4,%esp
 853:	ff 73 08             	push   0x8(%ebx)
 856:	e8 7e ff ff ff       	call   7d9 <nulterminate>
    break;
 85b:	83 c4 10             	add    $0x10,%esp
 85e:	eb a6                	jmp    806 <nulterminate+0x2d>
    nulterminate(bcmd->cmd);
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	ff 73 04             	push   0x4(%ebx)
 866:	e8 6e ff ff ff       	call   7d9 <nulterminate>
    break;
 86b:	83 c4 10             	add    $0x10,%esp
 86e:	eb 96                	jmp    806 <nulterminate+0x2d>

00000870 <parsecmd>:
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	56                   	push   %esi
 874:	53                   	push   %ebx
  es = s + strlen(s);
 875:	8b 5d 08             	mov    0x8(%ebp),%ebx
 878:	83 ec 0c             	sub    $0xc,%esp
 87b:	53                   	push   %ebx
 87c:	e8 7a 01 00 00       	call   9fb <strlen>
 881:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
 883:	83 c4 08             	add    $0x8,%esp
 886:	53                   	push   %ebx
 887:	8d 45 08             	lea    0x8(%ebp),%eax
 88a:	50                   	push   %eax
 88b:	e8 31 fe ff ff       	call   6c1 <parseline>
 890:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
 892:	83 c4 0c             	add    $0xc,%esp
 895:	68 0a 10 00 00       	push   $0x100a
 89a:	53                   	push   %ebx
 89b:	8d 45 08             	lea    0x8(%ebp),%eax
 89e:	50                   	push   %eax
 89f:	e8 9a fb ff ff       	call   43e <peek>
  if(s != es){
 8a4:	8b 45 08             	mov    0x8(%ebp),%eax
 8a7:	83 c4 10             	add    $0x10,%esp
 8aa:	39 d8                	cmp    %ebx,%eax
 8ac:	75 12                	jne    8c0 <parsecmd+0x50>
  nulterminate(cmd);
 8ae:	83 ec 0c             	sub    $0xc,%esp
 8b1:	56                   	push   %esi
 8b2:	e8 22 ff ff ff       	call   7d9 <nulterminate>
}
 8b7:	89 f0                	mov    %esi,%eax
 8b9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8bc:	5b                   	pop    %ebx
 8bd:	5e                   	pop    %esi
 8be:	5d                   	pop    %ebp
 8bf:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
 8c0:	83 ec 04             	sub    $0x4,%esp
 8c3:	50                   	push   %eax
 8c4:	68 7e 10 00 00       	push   $0x107e
 8c9:	6a 02                	push   $0x2
 8cb:	e8 6c 04 00 00       	call   d3c <printf>
    panic("syntax");
 8d0:	c7 04 24 42 10 00 00 	movl   $0x1042,(%esp)
 8d7:	e8 6f f7 ff ff       	call   4b <panic>

000008dc <main>:
{
 8dc:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8e0:	83 e4 f0             	and    $0xfffffff0,%esp
 8e3:	ff 71 fc             	push   -0x4(%ecx)
 8e6:	55                   	push   %ebp
 8e7:	89 e5                	mov    %esp,%ebp
 8e9:	51                   	push   %ecx
 8ea:	83 ec 04             	sub    $0x4,%esp
  while((fd = open("console", O_RDWR)) >= 0){
 8ed:	83 ec 08             	sub    $0x8,%esp
 8f0:	6a 02                	push   $0x2
 8f2:	68 8d 10 00 00       	push   $0x108d
 8f7:	e8 2b 03 00 00       	call   c27 <open>
 8fc:	83 c4 10             	add    $0x10,%esp
 8ff:	85 c0                	test   %eax,%eax
 901:	78 21                	js     924 <main+0x48>
    if(fd >= 3){
 903:	83 f8 02             	cmp    $0x2,%eax
 906:	7e e5                	jle    8ed <main+0x11>
      close(fd);
 908:	83 ec 0c             	sub    $0xc,%esp
 90b:	50                   	push   %eax
 90c:	e8 fe 02 00 00       	call   c0f <close>
      break;
 911:	83 c4 10             	add    $0x10,%esp
 914:	eb 0e                	jmp    924 <main+0x48>
    if(fork1() == 0)
 916:	e8 4a f7 ff ff       	call   65 <fork1>
 91b:	85 c0                	test   %eax,%eax
 91d:	74 76                	je     995 <main+0xb9>
    wait();
 91f:	e8 cb 02 00 00       	call   bef <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
 924:	83 ec 08             	sub    $0x8,%esp
 927:	6a 64                	push   $0x64
 929:	68 60 17 00 00       	push   $0x1760
 92e:	e8 cd f6 ff ff       	call   0 <getcmd>
 933:	83 c4 10             	add    $0x10,%esp
 936:	85 c0                	test   %eax,%eax
 938:	78 70                	js     9aa <main+0xce>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
 93a:	80 3d 60 17 00 00 63 	cmpb   $0x63,0x1760
 941:	75 d3                	jne    916 <main+0x3a>
 943:	80 3d 61 17 00 00 64 	cmpb   $0x64,0x1761
 94a:	75 ca                	jne    916 <main+0x3a>
 94c:	80 3d 62 17 00 00 20 	cmpb   $0x20,0x1762
 953:	75 c1                	jne    916 <main+0x3a>
      buf[strlen(buf)-1] = 0;  // chop \n
 955:	83 ec 0c             	sub    $0xc,%esp
 958:	68 60 17 00 00       	push   $0x1760
 95d:	e8 99 00 00 00       	call   9fb <strlen>
 962:	c6 80 5f 17 00 00 00 	movb   $0x0,0x175f(%eax)
      if(chdir(buf+3) < 0)
 969:	c7 04 24 63 17 00 00 	movl   $0x1763,(%esp)
 970:	e8 e2 02 00 00       	call   c57 <chdir>
 975:	83 c4 10             	add    $0x10,%esp
 978:	85 c0                	test   %eax,%eax
 97a:	79 a8                	jns    924 <main+0x48>
        printf(2, "cannot cd %s\n", buf+3);
 97c:	83 ec 04             	sub    $0x4,%esp
 97f:	68 63 17 00 00       	push   $0x1763
 984:	68 95 10 00 00       	push   $0x1095
 989:	6a 02                	push   $0x2
 98b:	e8 ac 03 00 00       	call   d3c <printf>
 990:	83 c4 10             	add    $0x10,%esp
      continue;
 993:	eb 8f                	jmp    924 <main+0x48>
      runcmd(parsecmd(buf));
 995:	83 ec 0c             	sub    $0xc,%esp
 998:	68 60 17 00 00       	push   $0x1760
 99d:	e8 ce fe ff ff       	call   870 <parsecmd>
 9a2:	89 04 24             	mov    %eax,(%esp)
 9a5:	e8 da f6 ff ff       	call   84 <runcmd>
  exit();
 9aa:	e8 38 02 00 00       	call   be7 <exit>

000009af <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 9af:	55                   	push   %ebp
 9b0:	89 e5                	mov    %esp,%ebp
 9b2:	56                   	push   %esi
 9b3:	53                   	push   %ebx
 9b4:	8b 75 08             	mov    0x8(%ebp),%esi
 9b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 9ba:	89 f0                	mov    %esi,%eax
 9bc:	89 d1                	mov    %edx,%ecx
 9be:	83 c2 01             	add    $0x1,%edx
 9c1:	89 c3                	mov    %eax,%ebx
 9c3:	83 c0 01             	add    $0x1,%eax
 9c6:	0f b6 09             	movzbl (%ecx),%ecx
 9c9:	88 0b                	mov    %cl,(%ebx)
 9cb:	84 c9                	test   %cl,%cl
 9cd:	75 ed                	jne    9bc <strcpy+0xd>
    ;
  return os;
}
 9cf:	89 f0                	mov    %esi,%eax
 9d1:	5b                   	pop    %ebx
 9d2:	5e                   	pop    %esi
 9d3:	5d                   	pop    %ebp
 9d4:	c3                   	ret    

000009d5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 9d5:	55                   	push   %ebp
 9d6:	89 e5                	mov    %esp,%ebp
 9d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 9db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 9de:	eb 06                	jmp    9e6 <strcmp+0x11>
    p++, q++;
 9e0:	83 c1 01             	add    $0x1,%ecx
 9e3:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 9e6:	0f b6 01             	movzbl (%ecx),%eax
 9e9:	84 c0                	test   %al,%al
 9eb:	74 04                	je     9f1 <strcmp+0x1c>
 9ed:	3a 02                	cmp    (%edx),%al
 9ef:	74 ef                	je     9e0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 9f1:	0f b6 c0             	movzbl %al,%eax
 9f4:	0f b6 12             	movzbl (%edx),%edx
 9f7:	29 d0                	sub    %edx,%eax
}
 9f9:	5d                   	pop    %ebp
 9fa:	c3                   	ret    

000009fb <strlen>:

uint
strlen(const char *s)
{
 9fb:	55                   	push   %ebp
 9fc:	89 e5                	mov    %esp,%ebp
 9fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 a01:	b8 00 00 00 00       	mov    $0x0,%eax
 a06:	eb 03                	jmp    a0b <strlen+0x10>
 a08:	83 c0 01             	add    $0x1,%eax
 a0b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 a0f:	75 f7                	jne    a08 <strlen+0xd>
    ;
  return n;
}
 a11:	5d                   	pop    %ebp
 a12:	c3                   	ret    

00000a13 <memset>:

void*
memset(void *dst, int c, uint n)
{
 a13:	55                   	push   %ebp
 a14:	89 e5                	mov    %esp,%ebp
 a16:	57                   	push   %edi
 a17:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 a1a:	89 d7                	mov    %edx,%edi
 a1c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 a1f:	8b 45 0c             	mov    0xc(%ebp),%eax
 a22:	fc                   	cld    
 a23:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 a25:	89 d0                	mov    %edx,%eax
 a27:	8b 7d fc             	mov    -0x4(%ebp),%edi
 a2a:	c9                   	leave  
 a2b:	c3                   	ret    

00000a2c <strchr>:

char*
strchr(const char *s, char c)
{
 a2c:	55                   	push   %ebp
 a2d:	89 e5                	mov    %esp,%ebp
 a2f:	8b 45 08             	mov    0x8(%ebp),%eax
 a32:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 a36:	eb 03                	jmp    a3b <strchr+0xf>
 a38:	83 c0 01             	add    $0x1,%eax
 a3b:	0f b6 10             	movzbl (%eax),%edx
 a3e:	84 d2                	test   %dl,%dl
 a40:	74 06                	je     a48 <strchr+0x1c>
    if(*s == c)
 a42:	38 ca                	cmp    %cl,%dl
 a44:	75 f2                	jne    a38 <strchr+0xc>
 a46:	eb 05                	jmp    a4d <strchr+0x21>
      return (char*)s;
  return 0;
 a48:	b8 00 00 00 00       	mov    $0x0,%eax
}
 a4d:	5d                   	pop    %ebp
 a4e:	c3                   	ret    

00000a4f <gets>:

char*
gets(char *buf, int max)
{
 a4f:	55                   	push   %ebp
 a50:	89 e5                	mov    %esp,%ebp
 a52:	57                   	push   %edi
 a53:	56                   	push   %esi
 a54:	53                   	push   %ebx
 a55:	83 ec 1c             	sub    $0x1c,%esp
 a58:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 a5b:	bb 00 00 00 00       	mov    $0x0,%ebx
 a60:	89 de                	mov    %ebx,%esi
 a62:	83 c3 01             	add    $0x1,%ebx
 a65:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 a68:	7d 2e                	jge    a98 <gets+0x49>
    cc = read(0, &c, 1);
 a6a:	83 ec 04             	sub    $0x4,%esp
 a6d:	6a 01                	push   $0x1
 a6f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 a72:	50                   	push   %eax
 a73:	6a 00                	push   $0x0
 a75:	e8 85 01 00 00       	call   bff <read>
    if(cc < 1)
 a7a:	83 c4 10             	add    $0x10,%esp
 a7d:	85 c0                	test   %eax,%eax
 a7f:	7e 17                	jle    a98 <gets+0x49>
      break;
    buf[i++] = c;
 a81:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 a85:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 a88:	3c 0a                	cmp    $0xa,%al
 a8a:	0f 94 c2             	sete   %dl
 a8d:	3c 0d                	cmp    $0xd,%al
 a8f:	0f 94 c0             	sete   %al
 a92:	08 c2                	or     %al,%dl
 a94:	74 ca                	je     a60 <gets+0x11>
    buf[i++] = c;
 a96:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 a98:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 a9c:	89 f8                	mov    %edi,%eax
 a9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 aa1:	5b                   	pop    %ebx
 aa2:	5e                   	pop    %esi
 aa3:	5f                   	pop    %edi
 aa4:	5d                   	pop    %ebp
 aa5:	c3                   	ret    

00000aa6 <stat>:

int
stat(const char *n, struct stat *st)
{
 aa6:	55                   	push   %ebp
 aa7:	89 e5                	mov    %esp,%ebp
 aa9:	56                   	push   %esi
 aaa:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 aab:	83 ec 08             	sub    $0x8,%esp
 aae:	6a 00                	push   $0x0
 ab0:	ff 75 08             	push   0x8(%ebp)
 ab3:	e8 6f 01 00 00       	call   c27 <open>
  if(fd < 0)
 ab8:	83 c4 10             	add    $0x10,%esp
 abb:	85 c0                	test   %eax,%eax
 abd:	78 24                	js     ae3 <stat+0x3d>
 abf:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 ac1:	83 ec 08             	sub    $0x8,%esp
 ac4:	ff 75 0c             	push   0xc(%ebp)
 ac7:	50                   	push   %eax
 ac8:	e8 72 01 00 00       	call   c3f <fstat>
 acd:	89 c6                	mov    %eax,%esi
  close(fd);
 acf:	89 1c 24             	mov    %ebx,(%esp)
 ad2:	e8 38 01 00 00       	call   c0f <close>
  return r;
 ad7:	83 c4 10             	add    $0x10,%esp
}
 ada:	89 f0                	mov    %esi,%eax
 adc:	8d 65 f8             	lea    -0x8(%ebp),%esp
 adf:	5b                   	pop    %ebx
 ae0:	5e                   	pop    %esi
 ae1:	5d                   	pop    %ebp
 ae2:	c3                   	ret    
    return -1;
 ae3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 ae8:	eb f0                	jmp    ada <stat+0x34>

00000aea <atoi>:

int
atoi(const char *s)
{
 aea:	55                   	push   %ebp
 aeb:	89 e5                	mov    %esp,%ebp
 aed:	53                   	push   %ebx
 aee:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 af1:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 af6:	eb 10                	jmp    b08 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 af8:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 afb:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 afe:	83 c1 01             	add    $0x1,%ecx
 b01:	0f be c0             	movsbl %al,%eax
 b04:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 b08:	0f b6 01             	movzbl (%ecx),%eax
 b0b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 b0e:	80 fb 09             	cmp    $0x9,%bl
 b11:	76 e5                	jbe    af8 <atoi+0xe>
  return n;
}
 b13:	89 d0                	mov    %edx,%eax
 b15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b18:	c9                   	leave  
 b19:	c3                   	ret    

00000b1a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 b1a:	55                   	push   %ebp
 b1b:	89 e5                	mov    %esp,%ebp
 b1d:	56                   	push   %esi
 b1e:	53                   	push   %ebx
 b1f:	8b 75 08             	mov    0x8(%ebp),%esi
 b22:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 b25:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 b28:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 b2a:	eb 0d                	jmp    b39 <memmove+0x1f>
    *dst++ = *src++;
 b2c:	0f b6 01             	movzbl (%ecx),%eax
 b2f:	88 02                	mov    %al,(%edx)
 b31:	8d 49 01             	lea    0x1(%ecx),%ecx
 b34:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 b37:	89 d8                	mov    %ebx,%eax
 b39:	8d 58 ff             	lea    -0x1(%eax),%ebx
 b3c:	85 c0                	test   %eax,%eax
 b3e:	7f ec                	jg     b2c <memmove+0x12>
  return vdst;
}
 b40:	89 f0                	mov    %esi,%eax
 b42:	5b                   	pop    %ebx
 b43:	5e                   	pop    %esi
 b44:	5d                   	pop    %ebp
 b45:	c3                   	ret    

00000b46 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 b46:	55                   	push   %ebp
 b47:	89 e5                	mov    %esp,%ebp
 b49:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 b4c:	68 00 20 00 00       	push   $0x2000
 b51:	e8 0c 04 00 00       	call   f62 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 b56:	83 c4 10             	add    $0x10,%esp
 b59:	a9 ff 0f 00 00       	test   $0xfff,%eax
 b5e:	74 0a                	je     b6a <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 b60:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 b65:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 b6a:	50                   	push   %eax
 b6b:	ff 75 10             	push   0x10(%ebp)
 b6e:	ff 75 0c             	push   0xc(%ebp)
 b71:	ff 75 08             	push   0x8(%ebp)
 b74:	e8 0e 01 00 00       	call   c87 <clone>
  return pid;
}
 b79:	c9                   	leave  
 b7a:	c3                   	ret    

00000b7b <thread_join>:
int
thread_join()
{
 b7b:	55                   	push   %ebp
 b7c:	89 e5                	mov    %esp,%ebp
 b7e:	53                   	push   %ebx
 b7f:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 b82:	8d 45 f4             	lea    -0xc(%ebp),%eax
 b85:	50                   	push   %eax
 b86:	e8 04 01 00 00       	call   c8f <join>
 b8b:	89 c3                	mov    %eax,%ebx
  free(stack);
 b8d:	83 c4 04             	add    $0x4,%esp
 b90:	ff 75 f4             	push   -0xc(%ebp)
 b93:	e8 0a 03 00 00       	call   ea2 <free>
  return pid;
}
 b98:	89 d8                	mov    %ebx,%eax
 b9a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b9d:	c9                   	leave  
 b9e:	c3                   	ret    

00000b9f <lock_init>:
int
lock_init(lock_t * lock){
 b9f:	55                   	push   %ebp
 ba0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 ba2:	8b 45 08             	mov    0x8(%ebp),%eax
 ba5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 bab:	b8 00 00 00 00       	mov    $0x0,%eax
 bb0:	5d                   	pop    %ebp
 bb1:	c3                   	ret    

00000bb2 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 bb2:	55                   	push   %ebp
 bb3:	89 e5                	mov    %esp,%ebp
 bb5:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 bb8:	b8 01 00 00 00       	mov    $0x1,%eax
 bbd:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 bc0:	83 f8 01             	cmp    $0x1,%eax
 bc3:	74 f3                	je     bb8 <lock_acquire+0x6>
  {

  }
  return 0;
}
 bc5:	b8 00 00 00 00       	mov    $0x0,%eax
 bca:	5d                   	pop    %ebp
 bcb:	c3                   	ret    

00000bcc <lock_release>:
int
lock_release(lock_t * lock){
 bcc:	55                   	push   %ebp
 bcd:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 bcf:	8b 45 08             	mov    0x8(%ebp),%eax
 bd2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 bd8:	b8 00 00 00 00       	mov    $0x0,%eax
 bdd:	5d                   	pop    %ebp
 bde:	c3                   	ret    

00000bdf <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 bdf:	b8 01 00 00 00       	mov    $0x1,%eax
 be4:	cd 40                	int    $0x40
 be6:	c3                   	ret    

00000be7 <exit>:
SYSCALL(exit)
 be7:	b8 02 00 00 00       	mov    $0x2,%eax
 bec:	cd 40                	int    $0x40
 bee:	c3                   	ret    

00000bef <wait>:
SYSCALL(wait)
 bef:	b8 03 00 00 00       	mov    $0x3,%eax
 bf4:	cd 40                	int    $0x40
 bf6:	c3                   	ret    

00000bf7 <pipe>:
SYSCALL(pipe)
 bf7:	b8 04 00 00 00       	mov    $0x4,%eax
 bfc:	cd 40                	int    $0x40
 bfe:	c3                   	ret    

00000bff <read>:
SYSCALL(read)
 bff:	b8 05 00 00 00       	mov    $0x5,%eax
 c04:	cd 40                	int    $0x40
 c06:	c3                   	ret    

00000c07 <write>:
SYSCALL(write)
 c07:	b8 10 00 00 00       	mov    $0x10,%eax
 c0c:	cd 40                	int    $0x40
 c0e:	c3                   	ret    

00000c0f <close>:
SYSCALL(close)
 c0f:	b8 15 00 00 00       	mov    $0x15,%eax
 c14:	cd 40                	int    $0x40
 c16:	c3                   	ret    

00000c17 <kill>:
SYSCALL(kill)
 c17:	b8 06 00 00 00       	mov    $0x6,%eax
 c1c:	cd 40                	int    $0x40
 c1e:	c3                   	ret    

00000c1f <exec>:
SYSCALL(exec)
 c1f:	b8 07 00 00 00       	mov    $0x7,%eax
 c24:	cd 40                	int    $0x40
 c26:	c3                   	ret    

00000c27 <open>:
SYSCALL(open)
 c27:	b8 0f 00 00 00       	mov    $0xf,%eax
 c2c:	cd 40                	int    $0x40
 c2e:	c3                   	ret    

00000c2f <mknod>:
SYSCALL(mknod)
 c2f:	b8 11 00 00 00       	mov    $0x11,%eax
 c34:	cd 40                	int    $0x40
 c36:	c3                   	ret    

00000c37 <unlink>:
SYSCALL(unlink)
 c37:	b8 12 00 00 00       	mov    $0x12,%eax
 c3c:	cd 40                	int    $0x40
 c3e:	c3                   	ret    

00000c3f <fstat>:
SYSCALL(fstat)
 c3f:	b8 08 00 00 00       	mov    $0x8,%eax
 c44:	cd 40                	int    $0x40
 c46:	c3                   	ret    

00000c47 <link>:
SYSCALL(link)
 c47:	b8 13 00 00 00       	mov    $0x13,%eax
 c4c:	cd 40                	int    $0x40
 c4e:	c3                   	ret    

00000c4f <mkdir>:
SYSCALL(mkdir)
 c4f:	b8 14 00 00 00       	mov    $0x14,%eax
 c54:	cd 40                	int    $0x40
 c56:	c3                   	ret    

00000c57 <chdir>:
SYSCALL(chdir)
 c57:	b8 09 00 00 00       	mov    $0x9,%eax
 c5c:	cd 40                	int    $0x40
 c5e:	c3                   	ret    

00000c5f <dup>:
SYSCALL(dup)
 c5f:	b8 0a 00 00 00       	mov    $0xa,%eax
 c64:	cd 40                	int    $0x40
 c66:	c3                   	ret    

00000c67 <getpid>:
SYSCALL(getpid)
 c67:	b8 0b 00 00 00       	mov    $0xb,%eax
 c6c:	cd 40                	int    $0x40
 c6e:	c3                   	ret    

00000c6f <sbrk>:
SYSCALL(sbrk)
 c6f:	b8 0c 00 00 00       	mov    $0xc,%eax
 c74:	cd 40                	int    $0x40
 c76:	c3                   	ret    

00000c77 <sleep>:
SYSCALL(sleep)
 c77:	b8 0d 00 00 00       	mov    $0xd,%eax
 c7c:	cd 40                	int    $0x40
 c7e:	c3                   	ret    

00000c7f <uptime>:
SYSCALL(uptime)
 c7f:	b8 0e 00 00 00       	mov    $0xe,%eax
 c84:	cd 40                	int    $0x40
 c86:	c3                   	ret    

00000c87 <clone>:
SYSCALL(clone)
 c87:	b8 16 00 00 00       	mov    $0x16,%eax
 c8c:	cd 40                	int    $0x40
 c8e:	c3                   	ret    

00000c8f <join>:
SYSCALL(join)
 c8f:	b8 17 00 00 00       	mov    $0x17,%eax
 c94:	cd 40                	int    $0x40
 c96:	c3                   	ret    

00000c97 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 c97:	55                   	push   %ebp
 c98:	89 e5                	mov    %esp,%ebp
 c9a:	83 ec 1c             	sub    $0x1c,%esp
 c9d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 ca0:	6a 01                	push   $0x1
 ca2:	8d 55 f4             	lea    -0xc(%ebp),%edx
 ca5:	52                   	push   %edx
 ca6:	50                   	push   %eax
 ca7:	e8 5b ff ff ff       	call   c07 <write>
}
 cac:	83 c4 10             	add    $0x10,%esp
 caf:	c9                   	leave  
 cb0:	c3                   	ret    

00000cb1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 cb1:	55                   	push   %ebp
 cb2:	89 e5                	mov    %esp,%ebp
 cb4:	57                   	push   %edi
 cb5:	56                   	push   %esi
 cb6:	53                   	push   %ebx
 cb7:	83 ec 2c             	sub    $0x2c,%esp
 cba:	89 45 d0             	mov    %eax,-0x30(%ebp)
 cbd:	89 d0                	mov    %edx,%eax
 cbf:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 cc1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 cc5:	0f 95 c1             	setne  %cl
 cc8:	c1 ea 1f             	shr    $0x1f,%edx
 ccb:	84 d1                	test   %dl,%cl
 ccd:	74 44                	je     d13 <printint+0x62>
    neg = 1;
    x = -xx;
 ccf:	f7 d8                	neg    %eax
 cd1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 cd3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 cda:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 cdf:	89 c8                	mov    %ecx,%eax
 ce1:	ba 00 00 00 00       	mov    $0x0,%edx
 ce6:	f7 f6                	div    %esi
 ce8:	89 df                	mov    %ebx,%edi
 cea:	83 c3 01             	add    $0x1,%ebx
 ced:	0f b6 92 34 11 00 00 	movzbl 0x1134(%edx),%edx
 cf4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 cf8:	89 ca                	mov    %ecx,%edx
 cfa:	89 c1                	mov    %eax,%ecx
 cfc:	39 d6                	cmp    %edx,%esi
 cfe:	76 df                	jbe    cdf <printint+0x2e>
  if(neg)
 d00:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 d04:	74 31                	je     d37 <printint+0x86>
    buf[i++] = '-';
 d06:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 d0b:	8d 5f 02             	lea    0x2(%edi),%ebx
 d0e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 d11:	eb 17                	jmp    d2a <printint+0x79>
    x = xx;
 d13:	89 c1                	mov    %eax,%ecx
  neg = 0;
 d15:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 d1c:	eb bc                	jmp    cda <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 d1e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 d23:	89 f0                	mov    %esi,%eax
 d25:	e8 6d ff ff ff       	call   c97 <putc>
  while(--i >= 0)
 d2a:	83 eb 01             	sub    $0x1,%ebx
 d2d:	79 ef                	jns    d1e <printint+0x6d>
}
 d2f:	83 c4 2c             	add    $0x2c,%esp
 d32:	5b                   	pop    %ebx
 d33:	5e                   	pop    %esi
 d34:	5f                   	pop    %edi
 d35:	5d                   	pop    %ebp
 d36:	c3                   	ret    
 d37:	8b 75 d0             	mov    -0x30(%ebp),%esi
 d3a:	eb ee                	jmp    d2a <printint+0x79>

00000d3c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 d3c:	55                   	push   %ebp
 d3d:	89 e5                	mov    %esp,%ebp
 d3f:	57                   	push   %edi
 d40:	56                   	push   %esi
 d41:	53                   	push   %ebx
 d42:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 d45:	8d 45 10             	lea    0x10(%ebp),%eax
 d48:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 d4b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 d50:	bb 00 00 00 00       	mov    $0x0,%ebx
 d55:	eb 14                	jmp    d6b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 d57:	89 fa                	mov    %edi,%edx
 d59:	8b 45 08             	mov    0x8(%ebp),%eax
 d5c:	e8 36 ff ff ff       	call   c97 <putc>
 d61:	eb 05                	jmp    d68 <printf+0x2c>
      }
    } else if(state == '%'){
 d63:	83 fe 25             	cmp    $0x25,%esi
 d66:	74 25                	je     d8d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 d68:	83 c3 01             	add    $0x1,%ebx
 d6b:	8b 45 0c             	mov    0xc(%ebp),%eax
 d6e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 d72:	84 c0                	test   %al,%al
 d74:	0f 84 20 01 00 00    	je     e9a <printf+0x15e>
    c = fmt[i] & 0xff;
 d7a:	0f be f8             	movsbl %al,%edi
 d7d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 d80:	85 f6                	test   %esi,%esi
 d82:	75 df                	jne    d63 <printf+0x27>
      if(c == '%'){
 d84:	83 f8 25             	cmp    $0x25,%eax
 d87:	75 ce                	jne    d57 <printf+0x1b>
        state = '%';
 d89:	89 c6                	mov    %eax,%esi
 d8b:	eb db                	jmp    d68 <printf+0x2c>
      if(c == 'd'){
 d8d:	83 f8 25             	cmp    $0x25,%eax
 d90:	0f 84 cf 00 00 00    	je     e65 <printf+0x129>
 d96:	0f 8c dd 00 00 00    	jl     e79 <printf+0x13d>
 d9c:	83 f8 78             	cmp    $0x78,%eax
 d9f:	0f 8f d4 00 00 00    	jg     e79 <printf+0x13d>
 da5:	83 f8 63             	cmp    $0x63,%eax
 da8:	0f 8c cb 00 00 00    	jl     e79 <printf+0x13d>
 dae:	83 e8 63             	sub    $0x63,%eax
 db1:	83 f8 15             	cmp    $0x15,%eax
 db4:	0f 87 bf 00 00 00    	ja     e79 <printf+0x13d>
 dba:	ff 24 85 dc 10 00 00 	jmp    *0x10dc(,%eax,4)
        printint(fd, *ap, 10, 1);
 dc1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 dc4:	8b 17                	mov    (%edi),%edx
 dc6:	83 ec 0c             	sub    $0xc,%esp
 dc9:	6a 01                	push   $0x1
 dcb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 dd0:	8b 45 08             	mov    0x8(%ebp),%eax
 dd3:	e8 d9 fe ff ff       	call   cb1 <printint>
        ap++;
 dd8:	83 c7 04             	add    $0x4,%edi
 ddb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 dde:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 de1:	be 00 00 00 00       	mov    $0x0,%esi
 de6:	eb 80                	jmp    d68 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 de8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 deb:	8b 17                	mov    (%edi),%edx
 ded:	83 ec 0c             	sub    $0xc,%esp
 df0:	6a 00                	push   $0x0
 df2:	b9 10 00 00 00       	mov    $0x10,%ecx
 df7:	8b 45 08             	mov    0x8(%ebp),%eax
 dfa:	e8 b2 fe ff ff       	call   cb1 <printint>
        ap++;
 dff:	83 c7 04             	add    $0x4,%edi
 e02:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 e05:	83 c4 10             	add    $0x10,%esp
      state = 0;
 e08:	be 00 00 00 00       	mov    $0x0,%esi
 e0d:	e9 56 ff ff ff       	jmp    d68 <printf+0x2c>
        s = (char*)*ap;
 e12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 e15:	8b 30                	mov    (%eax),%esi
        ap++;
 e17:	83 c0 04             	add    $0x4,%eax
 e1a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 e1d:	85 f6                	test   %esi,%esi
 e1f:	75 15                	jne    e36 <printf+0xfa>
          s = "(null)";
 e21:	be d4 10 00 00       	mov    $0x10d4,%esi
 e26:	eb 0e                	jmp    e36 <printf+0xfa>
          putc(fd, *s);
 e28:	0f be d2             	movsbl %dl,%edx
 e2b:	8b 45 08             	mov    0x8(%ebp),%eax
 e2e:	e8 64 fe ff ff       	call   c97 <putc>
          s++;
 e33:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 e36:	0f b6 16             	movzbl (%esi),%edx
 e39:	84 d2                	test   %dl,%dl
 e3b:	75 eb                	jne    e28 <printf+0xec>
      state = 0;
 e3d:	be 00 00 00 00       	mov    $0x0,%esi
 e42:	e9 21 ff ff ff       	jmp    d68 <printf+0x2c>
        putc(fd, *ap);
 e47:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 e4a:	0f be 17             	movsbl (%edi),%edx
 e4d:	8b 45 08             	mov    0x8(%ebp),%eax
 e50:	e8 42 fe ff ff       	call   c97 <putc>
        ap++;
 e55:	83 c7 04             	add    $0x4,%edi
 e58:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 e5b:	be 00 00 00 00       	mov    $0x0,%esi
 e60:	e9 03 ff ff ff       	jmp    d68 <printf+0x2c>
        putc(fd, c);
 e65:	89 fa                	mov    %edi,%edx
 e67:	8b 45 08             	mov    0x8(%ebp),%eax
 e6a:	e8 28 fe ff ff       	call   c97 <putc>
      state = 0;
 e6f:	be 00 00 00 00       	mov    $0x0,%esi
 e74:	e9 ef fe ff ff       	jmp    d68 <printf+0x2c>
        putc(fd, '%');
 e79:	ba 25 00 00 00       	mov    $0x25,%edx
 e7e:	8b 45 08             	mov    0x8(%ebp),%eax
 e81:	e8 11 fe ff ff       	call   c97 <putc>
        putc(fd, c);
 e86:	89 fa                	mov    %edi,%edx
 e88:	8b 45 08             	mov    0x8(%ebp),%eax
 e8b:	e8 07 fe ff ff       	call   c97 <putc>
      state = 0;
 e90:	be 00 00 00 00       	mov    $0x0,%esi
 e95:	e9 ce fe ff ff       	jmp    d68 <printf+0x2c>
    }
  }
}
 e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 e9d:	5b                   	pop    %ebx
 e9e:	5e                   	pop    %esi
 e9f:	5f                   	pop    %edi
 ea0:	5d                   	pop    %ebp
 ea1:	c3                   	ret    

00000ea2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ea2:	55                   	push   %ebp
 ea3:	89 e5                	mov    %esp,%ebp
 ea5:	57                   	push   %edi
 ea6:	56                   	push   %esi
 ea7:	53                   	push   %ebx
 ea8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 eab:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 eae:	a1 c4 17 00 00       	mov    0x17c4,%eax
 eb3:	eb 02                	jmp    eb7 <free+0x15>
 eb5:	89 d0                	mov    %edx,%eax
 eb7:	39 c8                	cmp    %ecx,%eax
 eb9:	73 04                	jae    ebf <free+0x1d>
 ebb:	39 08                	cmp    %ecx,(%eax)
 ebd:	77 12                	ja     ed1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ebf:	8b 10                	mov    (%eax),%edx
 ec1:	39 c2                	cmp    %eax,%edx
 ec3:	77 f0                	ja     eb5 <free+0x13>
 ec5:	39 c8                	cmp    %ecx,%eax
 ec7:	72 08                	jb     ed1 <free+0x2f>
 ec9:	39 ca                	cmp    %ecx,%edx
 ecb:	77 04                	ja     ed1 <free+0x2f>
 ecd:	89 d0                	mov    %edx,%eax
 ecf:	eb e6                	jmp    eb7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ed1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 ed4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ed7:	8b 10                	mov    (%eax),%edx
 ed9:	39 d7                	cmp    %edx,%edi
 edb:	74 19                	je     ef6 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 edd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ee0:	8b 50 04             	mov    0x4(%eax),%edx
 ee3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ee6:	39 ce                	cmp    %ecx,%esi
 ee8:	74 1b                	je     f05 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 eea:	89 08                	mov    %ecx,(%eax)
  freep = p;
 eec:	a3 c4 17 00 00       	mov    %eax,0x17c4
}
 ef1:	5b                   	pop    %ebx
 ef2:	5e                   	pop    %esi
 ef3:	5f                   	pop    %edi
 ef4:	5d                   	pop    %ebp
 ef5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 ef6:	03 72 04             	add    0x4(%edx),%esi
 ef9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 efc:	8b 10                	mov    (%eax),%edx
 efe:	8b 12                	mov    (%edx),%edx
 f00:	89 53 f8             	mov    %edx,-0x8(%ebx)
 f03:	eb db                	jmp    ee0 <free+0x3e>
    p->s.size += bp->s.size;
 f05:	03 53 fc             	add    -0x4(%ebx),%edx
 f08:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 f0b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 f0e:	89 10                	mov    %edx,(%eax)
 f10:	eb da                	jmp    eec <free+0x4a>

00000f12 <morecore>:

static Header*
morecore(uint nu)
{
 f12:	55                   	push   %ebp
 f13:	89 e5                	mov    %esp,%ebp
 f15:	53                   	push   %ebx
 f16:	83 ec 04             	sub    $0x4,%esp
 f19:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 f1b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 f20:	77 05                	ja     f27 <morecore+0x15>
    nu = 4096;
 f22:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 f27:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 f2e:	83 ec 0c             	sub    $0xc,%esp
 f31:	50                   	push   %eax
 f32:	e8 38 fd ff ff       	call   c6f <sbrk>
  if(p == (char*)-1)
 f37:	83 c4 10             	add    $0x10,%esp
 f3a:	83 f8 ff             	cmp    $0xffffffff,%eax
 f3d:	74 1c                	je     f5b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 f3f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 f42:	83 c0 08             	add    $0x8,%eax
 f45:	83 ec 0c             	sub    $0xc,%esp
 f48:	50                   	push   %eax
 f49:	e8 54 ff ff ff       	call   ea2 <free>
  return freep;
 f4e:	a1 c4 17 00 00       	mov    0x17c4,%eax
 f53:	83 c4 10             	add    $0x10,%esp
}
 f56:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 f59:	c9                   	leave  
 f5a:	c3                   	ret    
    return 0;
 f5b:	b8 00 00 00 00       	mov    $0x0,%eax
 f60:	eb f4                	jmp    f56 <morecore+0x44>

00000f62 <malloc>:

void*
malloc(uint nbytes)
{
 f62:	55                   	push   %ebp
 f63:	89 e5                	mov    %esp,%ebp
 f65:	53                   	push   %ebx
 f66:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 f69:	8b 45 08             	mov    0x8(%ebp),%eax
 f6c:	8d 58 07             	lea    0x7(%eax),%ebx
 f6f:	c1 eb 03             	shr    $0x3,%ebx
 f72:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 f75:	8b 0d c4 17 00 00    	mov    0x17c4,%ecx
 f7b:	85 c9                	test   %ecx,%ecx
 f7d:	74 04                	je     f83 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f7f:	8b 01                	mov    (%ecx),%eax
 f81:	eb 4a                	jmp    fcd <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 f83:	c7 05 c4 17 00 00 c8 	movl   $0x17c8,0x17c4
 f8a:	17 00 00 
 f8d:	c7 05 c8 17 00 00 c8 	movl   $0x17c8,0x17c8
 f94:	17 00 00 
    base.s.size = 0;
 f97:	c7 05 cc 17 00 00 00 	movl   $0x0,0x17cc
 f9e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 fa1:	b9 c8 17 00 00       	mov    $0x17c8,%ecx
 fa6:	eb d7                	jmp    f7f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 fa8:	74 19                	je     fc3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 faa:	29 da                	sub    %ebx,%edx
 fac:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 faf:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 fb2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 fb5:	89 0d c4 17 00 00    	mov    %ecx,0x17c4
      return (void*)(p + 1);
 fbb:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 fbe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 fc1:	c9                   	leave  
 fc2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 fc3:	8b 10                	mov    (%eax),%edx
 fc5:	89 11                	mov    %edx,(%ecx)
 fc7:	eb ec                	jmp    fb5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 fc9:	89 c1                	mov    %eax,%ecx
 fcb:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 fcd:	8b 50 04             	mov    0x4(%eax),%edx
 fd0:	39 da                	cmp    %ebx,%edx
 fd2:	73 d4                	jae    fa8 <malloc+0x46>
    if(p == freep)
 fd4:	39 05 c4 17 00 00    	cmp    %eax,0x17c4
 fda:	75 ed                	jne    fc9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 fdc:	89 d8                	mov    %ebx,%eax
 fde:	e8 2f ff ff ff       	call   f12 <morecore>
 fe3:	85 c0                	test   %eax,%eax
 fe5:	75 e2                	jne    fc9 <malloc+0x67>
 fe7:	eb d5                	jmp    fbe <malloc+0x5c>
