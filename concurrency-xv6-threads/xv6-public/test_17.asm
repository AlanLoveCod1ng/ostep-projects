
_test_17:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void merge_sort(void *array, void *size);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
  12:	e8 cf 05 00 00       	call   5e6 <getpid>
  17:	a3 e8 0d 00 00       	mov    %eax,0xde8
   3. join both threads
   4. Merge function
   */


    int size = 11;
  1c:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 2c                	push   $0x2c
  28:	e8 b4 08 00 00       	call   8e1 <malloc>
  2d:	a3 e4 0d 00 00       	mov    %eax,0xde4
    for(int i = 0; i < size; i++){
  32:	83 c4 10             	add    $0x10,%esp
  35:	ba 00 00 00 00       	mov    $0x0,%edx
  3a:	eb 11                	jmp    4d <main+0x4d>
        global[i] = size - i - 1;
  3c:	29 d0                	sub    %edx,%eax
  3e:	83 e8 01             	sub    $0x1,%eax
  41:	8b 0d e4 0d 00 00    	mov    0xde4,%ecx
  47:	89 04 91             	mov    %eax,(%ecx,%edx,4)
    for(int i = 0; i < size; i++){
  4a:	83 c2 01             	add    $0x1,%edx
  4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  50:	39 d0                	cmp    %edx,%eax
  52:	7f e8                	jg     3c <main+0x3c>
    }

   int thread_pid = thread_create(merge_sort, global, &size);
  54:	83 ec 04             	sub    $0x4,%esp
  57:	8d 45 f4             	lea    -0xc(%ebp),%eax
  5a:	50                   	push   %eax
  5b:	ff 35 e4 0d 00 00    	push   0xde4
  61:	68 a3 02 00 00       	push   $0x2a3
  66:	e8 5a 04 00 00       	call   4c5 <thread_create>
  6b:	89 c3                	mov    %eax,%ebx
   assert(thread_pid > 0);
  6d:	83 c4 10             	add    $0x10,%esp
  70:	85 c0                	test   %eax,%eax
  72:	7e 6e                	jle    e2 <main+0xe2>

   int join_pid = thread_join();
  74:	e8 81 04 00 00       	call   4fa <thread_join>
   assert(join_pid == thread_pid);
  79:	39 c3                	cmp    %eax,%ebx
  7b:	0f 85 aa 00 00 00    	jne    12b <main+0x12b>
   assert(global[0] == 0);
  81:	a1 e4 0d 00 00       	mov    0xde4,%eax
  86:	83 38 00             	cmpl   $0x0,(%eax)
  89:	0f 85 e5 00 00 00    	jne    174 <main+0x174>
   assert(global[10] == 10); 
  8f:	83 78 28 0a          	cmpl   $0xa,0x28(%eax)
  93:	0f 84 24 01 00 00    	je     1bd <main+0x1bd>
  99:	6a 35                	push   $0x35
  9b:	68 68 09 00 00       	push   $0x968
  a0:	68 72 09 00 00       	push   $0x972
  a5:	6a 01                	push   $0x1
  a7:	e8 0f 06 00 00       	call   6bb <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 d0 09 00 00       	push   $0x9d0
  b4:	68 89 09 00 00       	push   $0x989
  b9:	6a 01                	push   $0x1
  bb:	e8 fb 05 00 00       	call   6bb <printf>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 9d 09 00 00       	push   $0x99d
  c8:	6a 01                	push   $0x1
  ca:	e8 ec 05 00 00       	call   6bb <printf>
  cf:	83 c4 04             	add    $0x4,%esp
  d2:	ff 35 e8 0d 00 00    	push   0xde8
  d8:	e8 b9 04 00 00       	call   596 <kill>
  dd:	e8 84 04 00 00       	call   566 <exit>
   assert(thread_pid > 0);
  e2:	6a 30                	push   $0x30
  e4:	68 68 09 00 00       	push   $0x968
  e9:	68 72 09 00 00       	push   $0x972
  ee:	6a 01                	push   $0x1
  f0:	e8 c6 05 00 00       	call   6bb <printf>
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	68 7a 09 00 00       	push   $0x97a
  fd:	68 89 09 00 00       	push   $0x989
 102:	6a 01                	push   $0x1
 104:	e8 b2 05 00 00       	call   6bb <printf>
 109:	83 c4 08             	add    $0x8,%esp
 10c:	68 9d 09 00 00       	push   $0x99d
 111:	6a 01                	push   $0x1
 113:	e8 a3 05 00 00       	call   6bb <printf>
 118:	83 c4 04             	add    $0x4,%esp
 11b:	ff 35 e8 0d 00 00    	push   0xde8
 121:	e8 70 04 00 00       	call   596 <kill>
 126:	e8 3b 04 00 00       	call   566 <exit>
   assert(join_pid == thread_pid);
 12b:	6a 33                	push   $0x33
 12d:	68 68 09 00 00       	push   $0x968
 132:	68 72 09 00 00       	push   $0x972
 137:	6a 01                	push   $0x1
 139:	e8 7d 05 00 00       	call   6bb <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 aa 09 00 00       	push   $0x9aa
 146:	68 89 09 00 00       	push   $0x989
 14b:	6a 01                	push   $0x1
 14d:	e8 69 05 00 00       	call   6bb <printf>
 152:	83 c4 08             	add    $0x8,%esp
 155:	68 9d 09 00 00       	push   $0x99d
 15a:	6a 01                	push   $0x1
 15c:	e8 5a 05 00 00       	call   6bb <printf>
 161:	83 c4 04             	add    $0x4,%esp
 164:	ff 35 e8 0d 00 00    	push   0xde8
 16a:	e8 27 04 00 00       	call   596 <kill>
 16f:	e8 f2 03 00 00       	call   566 <exit>
   assert(global[0] == 0);
 174:	6a 34                	push   $0x34
 176:	68 68 09 00 00       	push   $0x968
 17b:	68 72 09 00 00       	push   $0x972
 180:	6a 01                	push   $0x1
 182:	e8 34 05 00 00       	call   6bb <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 c1 09 00 00       	push   $0x9c1
 18f:	68 89 09 00 00       	push   $0x989
 194:	6a 01                	push   $0x1
 196:	e8 20 05 00 00       	call   6bb <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 9d 09 00 00       	push   $0x99d
 1a3:	6a 01                	push   $0x1
 1a5:	e8 11 05 00 00       	call   6bb <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 e8 0d 00 00    	push   0xde8
 1b3:	e8 de 03 00 00       	call   596 <kill>
 1b8:	e8 a9 03 00 00       	call   566 <exit>

   printf(1, "TEST PASSED\n");
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	68 e1 09 00 00       	push   $0x9e1
 1c5:	6a 01                	push   $0x1
 1c7:	e8 ef 04 00 00       	call   6bb <printf>
   exit();
 1cc:	e8 95 03 00 00       	call   566 <exit>

000001d1 <merge>:
}

void merge(int* array, int* array_right,int size_left, int size_right,int*temp_array){
 1d1:	55                   	push   %ebp
 1d2:	89 e5                	mov    %esp,%ebp
 1d4:	57                   	push   %edi
 1d5:	56                   	push   %esi
 1d6:	53                   	push   %ebx
 1d7:	83 ec 04             	sub    $0x4,%esp
    int i = 0;
    int j = 0;
    int k = 0;
 1da:	b8 00 00 00 00       	mov    $0x0,%eax
    int j = 0;
 1df:	ba 00 00 00 00       	mov    $0x0,%edx
    int i = 0;
 1e4:	b9 00 00 00 00       	mov    $0x0,%ecx
    while(i < size_left && j < size_right){
 1e9:	eb 0c                	jmp    1f7 <merge+0x26>
        if(array[i] < array_right[j]){
            temp_array[k] = array[i];
            i++;
        }
        else{
            temp_array[k] = array_right[j];
 1eb:	8b 7d 18             	mov    0x18(%ebp),%edi
 1ee:	89 34 87             	mov    %esi,(%edi,%eax,4)
            j++;
 1f1:	83 c2 01             	add    $0x1,%edx
        }
        k++;
 1f4:	83 c0 01             	add    $0x1,%eax
    while(i < size_left && j < size_right){
 1f7:	3b 4d 10             	cmp    0x10(%ebp),%ecx
 1fa:	0f 9c c3             	setl   %bl
 1fd:	89 de                	mov    %ebx,%esi
 1ff:	3b 55 14             	cmp    0x14(%ebp),%edx
 202:	0f 9c c3             	setl   %bl
 205:	89 df                	mov    %ebx,%edi
 207:	89 f3                	mov    %esi,%ebx
 209:	84 db                	test   %bl,%bl
 20b:	74 50                	je     25d <merge+0x8c>
 20d:	89 fb                	mov    %edi,%ebx
 20f:	84 db                	test   %bl,%bl
 211:	74 1b                	je     22e <merge+0x5d>
        if(array[i] < array_right[j]){
 213:	8b 7d 08             	mov    0x8(%ebp),%edi
 216:	8b 3c 8f             	mov    (%edi,%ecx,4),%edi
 219:	8b 75 0c             	mov    0xc(%ebp),%esi
 21c:	8b 34 96             	mov    (%esi,%edx,4),%esi
 21f:	39 f7                	cmp    %esi,%edi
 221:	7d c8                	jge    1eb <merge+0x1a>
            temp_array[k] = array[i];
 223:	8b 75 18             	mov    0x18(%ebp),%esi
 226:	89 3c 86             	mov    %edi,(%esi,%eax,4)
            i++;
 229:	83 c1 01             	add    $0x1,%ecx
 22c:	eb c6                	jmp    1f4 <merge+0x23>
 22e:	8b 7d 08             	mov    0x8(%ebp),%edi
 231:	8b 5d 18             	mov    0x18(%ebp),%ebx
 234:	89 55 f0             	mov    %edx,-0x10(%ebp)
 237:	8b 75 10             	mov    0x10(%ebp),%esi
 23a:	eb 0c                	jmp    248 <merge+0x77>
    }
    while(i < size_left){
        temp_array[k] = array[i];
 23c:	8b 14 8f             	mov    (%edi,%ecx,4),%edx
 23f:	89 14 83             	mov    %edx,(%ebx,%eax,4)
        i++;
 242:	83 c1 01             	add    $0x1,%ecx
        k++;
 245:	83 c0 01             	add    $0x1,%eax
    while(i < size_left){
 248:	39 f1                	cmp    %esi,%ecx
 24a:	7c f0                	jl     23c <merge+0x6b>
 24c:	8b 55 f0             	mov    -0x10(%ebp),%edx
 24f:	89 75 10             	mov    %esi,0x10(%ebp)
 252:	89 7d 08             	mov    %edi,0x8(%ebp)
 255:	8b 75 0c             	mov    0xc(%ebp),%esi
 258:	8b 4d 14             	mov    0x14(%ebp),%ecx
 25b:	eb 1a                	jmp    277 <merge+0xa6>
 25d:	89 55 f0             	mov    %edx,-0x10(%ebp)
 260:	8b 7d 08             	mov    0x8(%ebp),%edi
 263:	8b 75 10             	mov    0x10(%ebp),%esi
 266:	8b 5d 18             	mov    0x18(%ebp),%ebx
 269:	eb dd                	jmp    248 <merge+0x77>
    }
    while(j < size_right){
        temp_array[k] = array_right[j];
 26b:	8b 3c 96             	mov    (%esi,%edx,4),%edi
 26e:	89 3c 83             	mov    %edi,(%ebx,%eax,4)
        j++;
 271:	83 c2 01             	add    $0x1,%edx
        k++;
 274:	83 c0 01             	add    $0x1,%eax
    while(j < size_right){
 277:	39 ca                	cmp    %ecx,%edx
 279:	7c f0                	jl     26b <merge+0x9a>
    }
    for(int i = 0; i < size_left + size_right; i++){
 27b:	8b 7d 08             	mov    0x8(%ebp),%edi
 27e:	b8 00 00 00 00       	mov    $0x0,%eax
 283:	8b 4d 10             	mov    0x10(%ebp),%ecx
 286:	8b 75 14             	mov    0x14(%ebp),%esi
 289:	eb 09                	jmp    294 <merge+0xc3>
        array[i] = temp_array[i];
 28b:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 28e:	89 14 87             	mov    %edx,(%edi,%eax,4)
    for(int i = 0; i < size_left + size_right; i++){
 291:	83 c0 01             	add    $0x1,%eax
 294:	8d 14 31             	lea    (%ecx,%esi,1),%edx
 297:	39 c2                	cmp    %eax,%edx
 299:	7f f0                	jg     28b <merge+0xba>
    }
   
}
 29b:	83 c4 04             	add    $0x4,%esp
 29e:	5b                   	pop    %ebx
 29f:	5e                   	pop    %esi
 2a0:	5f                   	pop    %edi
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    

000002a3 <merge_sort>:

void merge_sort(void *arg1, void *arg2) {
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	57                   	push   %edi
 2a7:	56                   	push   %esi
 2a8:	53                   	push   %ebx
 2a9:	83 ec 1c             	sub    $0x1c,%esp
 2ac:	8b 75 08             	mov    0x8(%ebp),%esi
   int *array = (int*)arg1;
   int size = *(int*)arg2;
 2af:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b2:	8b 18                	mov    (%eax),%ebx

   if (size==1){
 2b4:	83 fb 01             	cmp    $0x1,%ebx
 2b7:	74 70                	je     329 <merge_sort+0x86>
       exit();
   }

   
   int size_left = size/2;
 2b9:	b9 02 00 00 00       	mov    $0x2,%ecx
 2be:	89 d8                	mov    %ebx,%eax
 2c0:	99                   	cltd   
 2c1:	f7 f9                	idiv   %ecx
 2c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   int size_right = size-size/2;
 2c6:	89 da                	mov    %ebx,%edx
 2c8:	29 c2                	sub    %eax,%edx
 2ca:	89 55 e0             	mov    %edx,-0x20(%ebp)

   int* array_right = (int*)(array + size_left);
 2cd:	8d 3c 86             	lea    (%esi,%eax,4),%edi
//    merge_sort(array_right, size_right);

//    int nested_thread_pid_l = thread_create(merge_sort, array, &size_left);
//    int nested_thread_pid_r = thread_create(merge_sort, array_right, &size_right);
   
   thread_create(merge_sort, array, &size_left);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 2d6:	50                   	push   %eax
 2d7:	56                   	push   %esi
 2d8:	68 a3 02 00 00       	push   $0x2a3
 2dd:	e8 e3 01 00 00       	call   4c5 <thread_create>
   thread_create(merge_sort, array_right, &size_right);
 2e2:	83 c4 0c             	add    $0xc,%esp
 2e5:	8d 45 e0             	lea    -0x20(%ebp),%eax
 2e8:	50                   	push   %eax
 2e9:	57                   	push   %edi
 2ea:	68 a3 02 00 00       	push   $0x2a3
 2ef:	e8 d1 01 00 00       	call   4c5 <thread_create>

   thread_join();
 2f4:	e8 01 02 00 00       	call   4fa <thread_join>
   thread_join();
 2f9:	e8 fc 01 00 00       	call   4fa <thread_join>
 

//    int nested_join_pid_1 = thread_join();
//    int nested_join_pid_2 = thread_join();

   int* temp_array = malloc(size*sizeof(int));
 2fe:	c1 e3 02             	shl    $0x2,%ebx
 301:	89 1c 24             	mov    %ebx,(%esp)
 304:	e8 d8 05 00 00       	call   8e1 <malloc>
 309:	89 c3                	mov    %eax,%ebx

   merge(array,array_right,size_left,size_right,temp_array);
 30b:	89 04 24             	mov    %eax,(%esp)
 30e:	ff 75 e0             	push   -0x20(%ebp)
 311:	ff 75 e4             	push   -0x1c(%ebp)
 314:	57                   	push   %edi
 315:	56                   	push   %esi
 316:	e8 b6 fe ff ff       	call   1d1 <merge>

   free(temp_array);
 31b:	83 c4 14             	add    $0x14,%esp
 31e:	53                   	push   %ebx
 31f:	e8 fd 04 00 00       	call   821 <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 324:	e8 3d 02 00 00       	call   566 <exit>
       exit();
 329:	e8 38 02 00 00       	call   566 <exit>

0000032e <strcpy>:
#include "user.h"
#include "x86.h"
#include "mmu.h"
char*
strcpy(char *s, const char *t)
{
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	56                   	push   %esi
 332:	53                   	push   %ebx
 333:	8b 75 08             	mov    0x8(%ebp),%esi
 336:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 339:	89 f0                	mov    %esi,%eax
 33b:	89 d1                	mov    %edx,%ecx
 33d:	83 c2 01             	add    $0x1,%edx
 340:	89 c3                	mov    %eax,%ebx
 342:	83 c0 01             	add    $0x1,%eax
 345:	0f b6 09             	movzbl (%ecx),%ecx
 348:	88 0b                	mov    %cl,(%ebx)
 34a:	84 c9                	test   %cl,%cl
 34c:	75 ed                	jne    33b <strcpy+0xd>
    ;
  return os;
}
 34e:	89 f0                	mov    %esi,%eax
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    

00000354 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	8b 4d 08             	mov    0x8(%ebp),%ecx
 35a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 35d:	eb 06                	jmp    365 <strcmp+0x11>
    p++, q++;
 35f:	83 c1 01             	add    $0x1,%ecx
 362:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 365:	0f b6 01             	movzbl (%ecx),%eax
 368:	84 c0                	test   %al,%al
 36a:	74 04                	je     370 <strcmp+0x1c>
 36c:	3a 02                	cmp    (%edx),%al
 36e:	74 ef                	je     35f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 370:	0f b6 c0             	movzbl %al,%eax
 373:	0f b6 12             	movzbl (%edx),%edx
 376:	29 d0                	sub    %edx,%eax
}
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    

0000037a <strlen>:

uint
strlen(const char *s)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 380:	b8 00 00 00 00       	mov    $0x0,%eax
 385:	eb 03                	jmp    38a <strlen+0x10>
 387:	83 c0 01             	add    $0x1,%eax
 38a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 38e:	75 f7                	jne    387 <strlen+0xd>
    ;
  return n;
}
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <memset>:

void*
memset(void *dst, int c, uint n)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	57                   	push   %edi
 396:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 399:	89 d7                	mov    %edx,%edi
 39b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 39e:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a1:	fc                   	cld    
 3a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3a4:	89 d0                	mov    %edx,%eax
 3a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3a9:	c9                   	leave  
 3aa:	c3                   	ret    

000003ab <strchr>:

char*
strchr(const char *s, char c)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	8b 45 08             	mov    0x8(%ebp),%eax
 3b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3b5:	eb 03                	jmp    3ba <strchr+0xf>
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	0f b6 10             	movzbl (%eax),%edx
 3bd:	84 d2                	test   %dl,%dl
 3bf:	74 06                	je     3c7 <strchr+0x1c>
    if(*s == c)
 3c1:	38 ca                	cmp    %cl,%dl
 3c3:	75 f2                	jne    3b7 <strchr+0xc>
 3c5:	eb 05                	jmp    3cc <strchr+0x21>
      return (char*)s;
  return 0;
 3c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3cc:	5d                   	pop    %ebp
 3cd:	c3                   	ret    

000003ce <gets>:

char*
gets(char *buf, int max)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	57                   	push   %edi
 3d2:	56                   	push   %esi
 3d3:	53                   	push   %ebx
 3d4:	83 ec 1c             	sub    $0x1c,%esp
 3d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3da:	bb 00 00 00 00       	mov    $0x0,%ebx
 3df:	89 de                	mov    %ebx,%esi
 3e1:	83 c3 01             	add    $0x1,%ebx
 3e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e7:	7d 2e                	jge    417 <gets+0x49>
    cc = read(0, &c, 1);
 3e9:	83 ec 04             	sub    $0x4,%esp
 3ec:	6a 01                	push   $0x1
 3ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f1:	50                   	push   %eax
 3f2:	6a 00                	push   $0x0
 3f4:	e8 85 01 00 00       	call   57e <read>
    if(cc < 1)
 3f9:	83 c4 10             	add    $0x10,%esp
 3fc:	85 c0                	test   %eax,%eax
 3fe:	7e 17                	jle    417 <gets+0x49>
      break;
    buf[i++] = c;
 400:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 404:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 407:	3c 0a                	cmp    $0xa,%al
 409:	0f 94 c2             	sete   %dl
 40c:	3c 0d                	cmp    $0xd,%al
 40e:	0f 94 c0             	sete   %al
 411:	08 c2                	or     %al,%dl
 413:	74 ca                	je     3df <gets+0x11>
    buf[i++] = c;
 415:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 417:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 41b:	89 f8                	mov    %edi,%eax
 41d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 420:	5b                   	pop    %ebx
 421:	5e                   	pop    %esi
 422:	5f                   	pop    %edi
 423:	5d                   	pop    %ebp
 424:	c3                   	ret    

00000425 <stat>:

int
stat(const char *n, struct stat *st)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	56                   	push   %esi
 429:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 42a:	83 ec 08             	sub    $0x8,%esp
 42d:	6a 00                	push   $0x0
 42f:	ff 75 08             	push   0x8(%ebp)
 432:	e8 6f 01 00 00       	call   5a6 <open>
  if(fd < 0)
 437:	83 c4 10             	add    $0x10,%esp
 43a:	85 c0                	test   %eax,%eax
 43c:	78 24                	js     462 <stat+0x3d>
 43e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 440:	83 ec 08             	sub    $0x8,%esp
 443:	ff 75 0c             	push   0xc(%ebp)
 446:	50                   	push   %eax
 447:	e8 72 01 00 00       	call   5be <fstat>
 44c:	89 c6                	mov    %eax,%esi
  close(fd);
 44e:	89 1c 24             	mov    %ebx,(%esp)
 451:	e8 38 01 00 00       	call   58e <close>
  return r;
 456:	83 c4 10             	add    $0x10,%esp
}
 459:	89 f0                	mov    %esi,%eax
 45b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    
    return -1;
 462:	be ff ff ff ff       	mov    $0xffffffff,%esi
 467:	eb f0                	jmp    459 <stat+0x34>

00000469 <atoi>:

int
atoi(const char *s)
{
 469:	55                   	push   %ebp
 46a:	89 e5                	mov    %esp,%ebp
 46c:	53                   	push   %ebx
 46d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 470:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 475:	eb 10                	jmp    487 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 477:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 47a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 47d:	83 c1 01             	add    $0x1,%ecx
 480:	0f be c0             	movsbl %al,%eax
 483:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 487:	0f b6 01             	movzbl (%ecx),%eax
 48a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 48d:	80 fb 09             	cmp    $0x9,%bl
 490:	76 e5                	jbe    477 <atoi+0xe>
  return n;
}
 492:	89 d0                	mov    %edx,%eax
 494:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	56                   	push   %esi
 49d:	53                   	push   %ebx
 49e:	8b 75 08             	mov    0x8(%ebp),%esi
 4a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4a9:	eb 0d                	jmp    4b8 <memmove+0x1f>
    *dst++ = *src++;
 4ab:	0f b6 01             	movzbl (%ecx),%eax
 4ae:	88 02                	mov    %al,(%edx)
 4b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 4b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4b6:	89 d8                	mov    %ebx,%eax
 4b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4bb:	85 c0                	test   %eax,%eax
 4bd:	7f ec                	jg     4ab <memmove+0x12>
  return vdst;
}
 4bf:	89 f0                	mov    %esi,%eax
 4c1:	5b                   	pop    %ebx
 4c2:	5e                   	pop    %esi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    

000004c5 <thread_create>:

int
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 4c5:	55                   	push   %ebp
 4c6:	89 e5                	mov    %esp,%ebp
 4c8:	83 ec 14             	sub    $0x14,%esp
  void *stack = malloc(2*PGSIZE);
 4cb:	68 00 20 00 00       	push   $0x2000
 4d0:	e8 0c 04 00 00       	call   8e1 <malloc>
  if((uint)(stack) % PGSIZE != 0){
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	a9 ff 0f 00 00       	test   $0xfff,%eax
 4dd:	74 0a                	je     4e9 <thread_create+0x24>
    stack = (void*)((uint)stack+(PGSIZE-(uint)(stack)%PGSIZE));
 4df:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 4e4:	05 00 10 00 00       	add    $0x1000,%eax
  }
  int pid = clone(start_routine, arg1, arg2, stack);
 4e9:	50                   	push   %eax
 4ea:	ff 75 10             	push   0x10(%ebp)
 4ed:	ff 75 0c             	push   0xc(%ebp)
 4f0:	ff 75 08             	push   0x8(%ebp)
 4f3:	e8 0e 01 00 00       	call   606 <clone>
  return pid;
}
 4f8:	c9                   	leave  
 4f9:	c3                   	ret    

000004fa <thread_join>:
int
thread_join()
{
 4fa:	55                   	push   %ebp
 4fb:	89 e5                	mov    %esp,%ebp
 4fd:	53                   	push   %ebx
 4fe:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int pid = join(&stack);
 501:	8d 45 f4             	lea    -0xc(%ebp),%eax
 504:	50                   	push   %eax
 505:	e8 04 01 00 00       	call   60e <join>
 50a:	89 c3                	mov    %eax,%ebx
  free(stack);
 50c:	83 c4 04             	add    $0x4,%esp
 50f:	ff 75 f4             	push   -0xc(%ebp)
 512:	e8 0a 03 00 00       	call   821 <free>
  return pid;
}
 517:	89 d8                	mov    %ebx,%eax
 519:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 51c:	c9                   	leave  
 51d:	c3                   	ret    

0000051e <lock_init>:
int
lock_init(lock_t * lock){
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 52a:	b8 00 00 00 00       	mov    $0x0,%eax
 52f:	5d                   	pop    %ebp
 530:	c3                   	ret    

00000531 <lock_acquire>:
int
lock_acquire(lock_t * lock){
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 537:	b8 01 00 00 00       	mov    $0x1,%eax
 53c:	f0 87 02             	lock xchg %eax,(%edx)
  while (xchg(&lock->flag, 1) == 1)
 53f:	83 f8 01             	cmp    $0x1,%eax
 542:	74 f3                	je     537 <lock_acquire+0x6>
  {

  }
  return 0;
}
 544:	b8 00 00 00 00       	mov    $0x0,%eax
 549:	5d                   	pop    %ebp
 54a:	c3                   	ret    

0000054b <lock_release>:
int
lock_release(lock_t * lock){
 54b:	55                   	push   %ebp
 54c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
 557:	b8 00 00 00 00       	mov    $0x0,%eax
 55c:	5d                   	pop    %ebp
 55d:	c3                   	ret    

0000055e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 55e:	b8 01 00 00 00       	mov    $0x1,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <exit>:
SYSCALL(exit)
 566:	b8 02 00 00 00       	mov    $0x2,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <wait>:
SYSCALL(wait)
 56e:	b8 03 00 00 00       	mov    $0x3,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <pipe>:
SYSCALL(pipe)
 576:	b8 04 00 00 00       	mov    $0x4,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <read>:
SYSCALL(read)
 57e:	b8 05 00 00 00       	mov    $0x5,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <write>:
SYSCALL(write)
 586:	b8 10 00 00 00       	mov    $0x10,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <close>:
SYSCALL(close)
 58e:	b8 15 00 00 00       	mov    $0x15,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <kill>:
SYSCALL(kill)
 596:	b8 06 00 00 00       	mov    $0x6,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <exec>:
SYSCALL(exec)
 59e:	b8 07 00 00 00       	mov    $0x7,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <open>:
SYSCALL(open)
 5a6:	b8 0f 00 00 00       	mov    $0xf,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <mknod>:
SYSCALL(mknod)
 5ae:	b8 11 00 00 00       	mov    $0x11,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <unlink>:
SYSCALL(unlink)
 5b6:	b8 12 00 00 00       	mov    $0x12,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <fstat>:
SYSCALL(fstat)
 5be:	b8 08 00 00 00       	mov    $0x8,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <link>:
SYSCALL(link)
 5c6:	b8 13 00 00 00       	mov    $0x13,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <mkdir>:
SYSCALL(mkdir)
 5ce:	b8 14 00 00 00       	mov    $0x14,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <chdir>:
SYSCALL(chdir)
 5d6:	b8 09 00 00 00       	mov    $0x9,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <dup>:
SYSCALL(dup)
 5de:	b8 0a 00 00 00       	mov    $0xa,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <getpid>:
SYSCALL(getpid)
 5e6:	b8 0b 00 00 00       	mov    $0xb,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <sbrk>:
SYSCALL(sbrk)
 5ee:	b8 0c 00 00 00       	mov    $0xc,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <sleep>:
SYSCALL(sleep)
 5f6:	b8 0d 00 00 00       	mov    $0xd,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <uptime>:
SYSCALL(uptime)
 5fe:	b8 0e 00 00 00       	mov    $0xe,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <clone>:
SYSCALL(clone)
 606:	b8 16 00 00 00       	mov    $0x16,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <join>:
SYSCALL(join)
 60e:	b8 17 00 00 00       	mov    $0x17,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 616:	55                   	push   %ebp
 617:	89 e5                	mov    %esp,%ebp
 619:	83 ec 1c             	sub    $0x1c,%esp
 61c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 61f:	6a 01                	push   $0x1
 621:	8d 55 f4             	lea    -0xc(%ebp),%edx
 624:	52                   	push   %edx
 625:	50                   	push   %eax
 626:	e8 5b ff ff ff       	call   586 <write>
}
 62b:	83 c4 10             	add    $0x10,%esp
 62e:	c9                   	leave  
 62f:	c3                   	ret    

00000630 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 2c             	sub    $0x2c,%esp
 639:	89 45 d0             	mov    %eax,-0x30(%ebp)
 63c:	89 d0                	mov    %edx,%eax
 63e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 640:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 644:	0f 95 c1             	setne  %cl
 647:	c1 ea 1f             	shr    $0x1f,%edx
 64a:	84 d1                	test   %dl,%cl
 64c:	74 44                	je     692 <printint+0x62>
    neg = 1;
    x = -xx;
 64e:	f7 d8                	neg    %eax
 650:	89 c1                	mov    %eax,%ecx
    neg = 1;
 652:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 659:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 65e:	89 c8                	mov    %ecx,%eax
 660:	ba 00 00 00 00       	mov    $0x0,%edx
 665:	f7 f6                	div    %esi
 667:	89 df                	mov    %ebx,%edi
 669:	83 c3 01             	add    $0x1,%ebx
 66c:	0f b6 92 50 0a 00 00 	movzbl 0xa50(%edx),%edx
 673:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 677:	89 ca                	mov    %ecx,%edx
 679:	89 c1                	mov    %eax,%ecx
 67b:	39 d6                	cmp    %edx,%esi
 67d:	76 df                	jbe    65e <printint+0x2e>
  if(neg)
 67f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 683:	74 31                	je     6b6 <printint+0x86>
    buf[i++] = '-';
 685:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 68a:	8d 5f 02             	lea    0x2(%edi),%ebx
 68d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 690:	eb 17                	jmp    6a9 <printint+0x79>
    x = xx;
 692:	89 c1                	mov    %eax,%ecx
  neg = 0;
 694:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 69b:	eb bc                	jmp    659 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 69d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6a2:	89 f0                	mov    %esi,%eax
 6a4:	e8 6d ff ff ff       	call   616 <putc>
  while(--i >= 0)
 6a9:	83 eb 01             	sub    $0x1,%ebx
 6ac:	79 ef                	jns    69d <printint+0x6d>
}
 6ae:	83 c4 2c             	add    $0x2c,%esp
 6b1:	5b                   	pop    %ebx
 6b2:	5e                   	pop    %esi
 6b3:	5f                   	pop    %edi
 6b4:	5d                   	pop    %ebp
 6b5:	c3                   	ret    
 6b6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6b9:	eb ee                	jmp    6a9 <printint+0x79>

000006bb <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6bb:	55                   	push   %ebp
 6bc:	89 e5                	mov    %esp,%ebp
 6be:	57                   	push   %edi
 6bf:	56                   	push   %esi
 6c0:	53                   	push   %ebx
 6c1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6c4:	8d 45 10             	lea    0x10(%ebp),%eax
 6c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6ca:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6cf:	bb 00 00 00 00       	mov    $0x0,%ebx
 6d4:	eb 14                	jmp    6ea <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6d6:	89 fa                	mov    %edi,%edx
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	e8 36 ff ff ff       	call   616 <putc>
 6e0:	eb 05                	jmp    6e7 <printf+0x2c>
      }
    } else if(state == '%'){
 6e2:	83 fe 25             	cmp    $0x25,%esi
 6e5:	74 25                	je     70c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6e7:	83 c3 01             	add    $0x1,%ebx
 6ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ed:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6f1:	84 c0                	test   %al,%al
 6f3:	0f 84 20 01 00 00    	je     819 <printf+0x15e>
    c = fmt[i] & 0xff;
 6f9:	0f be f8             	movsbl %al,%edi
 6fc:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ff:	85 f6                	test   %esi,%esi
 701:	75 df                	jne    6e2 <printf+0x27>
      if(c == '%'){
 703:	83 f8 25             	cmp    $0x25,%eax
 706:	75 ce                	jne    6d6 <printf+0x1b>
        state = '%';
 708:	89 c6                	mov    %eax,%esi
 70a:	eb db                	jmp    6e7 <printf+0x2c>
      if(c == 'd'){
 70c:	83 f8 25             	cmp    $0x25,%eax
 70f:	0f 84 cf 00 00 00    	je     7e4 <printf+0x129>
 715:	0f 8c dd 00 00 00    	jl     7f8 <printf+0x13d>
 71b:	83 f8 78             	cmp    $0x78,%eax
 71e:	0f 8f d4 00 00 00    	jg     7f8 <printf+0x13d>
 724:	83 f8 63             	cmp    $0x63,%eax
 727:	0f 8c cb 00 00 00    	jl     7f8 <printf+0x13d>
 72d:	83 e8 63             	sub    $0x63,%eax
 730:	83 f8 15             	cmp    $0x15,%eax
 733:	0f 87 bf 00 00 00    	ja     7f8 <printf+0x13d>
 739:	ff 24 85 f8 09 00 00 	jmp    *0x9f8(,%eax,4)
        printint(fd, *ap, 10, 1);
 740:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 743:	8b 17                	mov    (%edi),%edx
 745:	83 ec 0c             	sub    $0xc,%esp
 748:	6a 01                	push   $0x1
 74a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 74f:	8b 45 08             	mov    0x8(%ebp),%eax
 752:	e8 d9 fe ff ff       	call   630 <printint>
        ap++;
 757:	83 c7 04             	add    $0x4,%edi
 75a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 75d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 760:	be 00 00 00 00       	mov    $0x0,%esi
 765:	eb 80                	jmp    6e7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 767:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 76a:	8b 17                	mov    (%edi),%edx
 76c:	83 ec 0c             	sub    $0xc,%esp
 76f:	6a 00                	push   $0x0
 771:	b9 10 00 00 00       	mov    $0x10,%ecx
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	e8 b2 fe ff ff       	call   630 <printint>
        ap++;
 77e:	83 c7 04             	add    $0x4,%edi
 781:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 784:	83 c4 10             	add    $0x10,%esp
      state = 0;
 787:	be 00 00 00 00       	mov    $0x0,%esi
 78c:	e9 56 ff ff ff       	jmp    6e7 <printf+0x2c>
        s = (char*)*ap;
 791:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 794:	8b 30                	mov    (%eax),%esi
        ap++;
 796:	83 c0 04             	add    $0x4,%eax
 799:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 79c:	85 f6                	test   %esi,%esi
 79e:	75 15                	jne    7b5 <printf+0xfa>
          s = "(null)";
 7a0:	be ee 09 00 00       	mov    $0x9ee,%esi
 7a5:	eb 0e                	jmp    7b5 <printf+0xfa>
          putc(fd, *s);
 7a7:	0f be d2             	movsbl %dl,%edx
 7aa:	8b 45 08             	mov    0x8(%ebp),%eax
 7ad:	e8 64 fe ff ff       	call   616 <putc>
          s++;
 7b2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7b5:	0f b6 16             	movzbl (%esi),%edx
 7b8:	84 d2                	test   %dl,%dl
 7ba:	75 eb                	jne    7a7 <printf+0xec>
      state = 0;
 7bc:	be 00 00 00 00       	mov    $0x0,%esi
 7c1:	e9 21 ff ff ff       	jmp    6e7 <printf+0x2c>
        putc(fd, *ap);
 7c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c9:	0f be 17             	movsbl (%edi),%edx
 7cc:	8b 45 08             	mov    0x8(%ebp),%eax
 7cf:	e8 42 fe ff ff       	call   616 <putc>
        ap++;
 7d4:	83 c7 04             	add    $0x4,%edi
 7d7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7da:	be 00 00 00 00       	mov    $0x0,%esi
 7df:	e9 03 ff ff ff       	jmp    6e7 <printf+0x2c>
        putc(fd, c);
 7e4:	89 fa                	mov    %edi,%edx
 7e6:	8b 45 08             	mov    0x8(%ebp),%eax
 7e9:	e8 28 fe ff ff       	call   616 <putc>
      state = 0;
 7ee:	be 00 00 00 00       	mov    $0x0,%esi
 7f3:	e9 ef fe ff ff       	jmp    6e7 <printf+0x2c>
        putc(fd, '%');
 7f8:	ba 25 00 00 00       	mov    $0x25,%edx
 7fd:	8b 45 08             	mov    0x8(%ebp),%eax
 800:	e8 11 fe ff ff       	call   616 <putc>
        putc(fd, c);
 805:	89 fa                	mov    %edi,%edx
 807:	8b 45 08             	mov    0x8(%ebp),%eax
 80a:	e8 07 fe ff ff       	call   616 <putc>
      state = 0;
 80f:	be 00 00 00 00       	mov    $0x0,%esi
 814:	e9 ce fe ff ff       	jmp    6e7 <printf+0x2c>
    }
  }
}
 819:	8d 65 f4             	lea    -0xc(%ebp),%esp
 81c:	5b                   	pop    %ebx
 81d:	5e                   	pop    %esi
 81e:	5f                   	pop    %edi
 81f:	5d                   	pop    %ebp
 820:	c3                   	ret    

00000821 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 821:	55                   	push   %ebp
 822:	89 e5                	mov    %esp,%ebp
 824:	57                   	push   %edi
 825:	56                   	push   %esi
 826:	53                   	push   %ebx
 827:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 82a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82d:	a1 ec 0d 00 00       	mov    0xdec,%eax
 832:	eb 02                	jmp    836 <free+0x15>
 834:	89 d0                	mov    %edx,%eax
 836:	39 c8                	cmp    %ecx,%eax
 838:	73 04                	jae    83e <free+0x1d>
 83a:	39 08                	cmp    %ecx,(%eax)
 83c:	77 12                	ja     850 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 83e:	8b 10                	mov    (%eax),%edx
 840:	39 c2                	cmp    %eax,%edx
 842:	77 f0                	ja     834 <free+0x13>
 844:	39 c8                	cmp    %ecx,%eax
 846:	72 08                	jb     850 <free+0x2f>
 848:	39 ca                	cmp    %ecx,%edx
 84a:	77 04                	ja     850 <free+0x2f>
 84c:	89 d0                	mov    %edx,%eax
 84e:	eb e6                	jmp    836 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 850:	8b 73 fc             	mov    -0x4(%ebx),%esi
 853:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 856:	8b 10                	mov    (%eax),%edx
 858:	39 d7                	cmp    %edx,%edi
 85a:	74 19                	je     875 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 85c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 85f:	8b 50 04             	mov    0x4(%eax),%edx
 862:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 865:	39 ce                	cmp    %ecx,%esi
 867:	74 1b                	je     884 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 869:	89 08                	mov    %ecx,(%eax)
  freep = p;
 86b:	a3 ec 0d 00 00       	mov    %eax,0xdec
}
 870:	5b                   	pop    %ebx
 871:	5e                   	pop    %esi
 872:	5f                   	pop    %edi
 873:	5d                   	pop    %ebp
 874:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 875:	03 72 04             	add    0x4(%edx),%esi
 878:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 87b:	8b 10                	mov    (%eax),%edx
 87d:	8b 12                	mov    (%edx),%edx
 87f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 882:	eb db                	jmp    85f <free+0x3e>
    p->s.size += bp->s.size;
 884:	03 53 fc             	add    -0x4(%ebx),%edx
 887:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 88a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 88d:	89 10                	mov    %edx,(%eax)
 88f:	eb da                	jmp    86b <free+0x4a>

00000891 <morecore>:

static Header*
morecore(uint nu)
{
 891:	55                   	push   %ebp
 892:	89 e5                	mov    %esp,%ebp
 894:	53                   	push   %ebx
 895:	83 ec 04             	sub    $0x4,%esp
 898:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 89a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 89f:	77 05                	ja     8a6 <morecore+0x15>
    nu = 4096;
 8a1:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8ad:	83 ec 0c             	sub    $0xc,%esp
 8b0:	50                   	push   %eax
 8b1:	e8 38 fd ff ff       	call   5ee <sbrk>
  if(p == (char*)-1)
 8b6:	83 c4 10             	add    $0x10,%esp
 8b9:	83 f8 ff             	cmp    $0xffffffff,%eax
 8bc:	74 1c                	je     8da <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8be:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8c1:	83 c0 08             	add    $0x8,%eax
 8c4:	83 ec 0c             	sub    $0xc,%esp
 8c7:	50                   	push   %eax
 8c8:	e8 54 ff ff ff       	call   821 <free>
  return freep;
 8cd:	a1 ec 0d 00 00       	mov    0xdec,%eax
 8d2:	83 c4 10             	add    $0x10,%esp
}
 8d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d8:	c9                   	leave  
 8d9:	c3                   	ret    
    return 0;
 8da:	b8 00 00 00 00       	mov    $0x0,%eax
 8df:	eb f4                	jmp    8d5 <morecore+0x44>

000008e1 <malloc>:

void*
malloc(uint nbytes)
{
 8e1:	55                   	push   %ebp
 8e2:	89 e5                	mov    %esp,%ebp
 8e4:	53                   	push   %ebx
 8e5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e8:	8b 45 08             	mov    0x8(%ebp),%eax
 8eb:	8d 58 07             	lea    0x7(%eax),%ebx
 8ee:	c1 eb 03             	shr    $0x3,%ebx
 8f1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8f4:	8b 0d ec 0d 00 00    	mov    0xdec,%ecx
 8fa:	85 c9                	test   %ecx,%ecx
 8fc:	74 04                	je     902 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fe:	8b 01                	mov    (%ecx),%eax
 900:	eb 4a                	jmp    94c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 902:	c7 05 ec 0d 00 00 f0 	movl   $0xdf0,0xdec
 909:	0d 00 00 
 90c:	c7 05 f0 0d 00 00 f0 	movl   $0xdf0,0xdf0
 913:	0d 00 00 
    base.s.size = 0;
 916:	c7 05 f4 0d 00 00 00 	movl   $0x0,0xdf4
 91d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 920:	b9 f0 0d 00 00       	mov    $0xdf0,%ecx
 925:	eb d7                	jmp    8fe <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 927:	74 19                	je     942 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 929:	29 da                	sub    %ebx,%edx
 92b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 92e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 931:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 934:	89 0d ec 0d 00 00    	mov    %ecx,0xdec
      return (void*)(p + 1);
 93a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 93d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 940:	c9                   	leave  
 941:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 942:	8b 10                	mov    (%eax),%edx
 944:	89 11                	mov    %edx,(%ecx)
 946:	eb ec                	jmp    934 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 948:	89 c1                	mov    %eax,%ecx
 94a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 94c:	8b 50 04             	mov    0x4(%eax),%edx
 94f:	39 da                	cmp    %ebx,%edx
 951:	73 d4                	jae    927 <malloc+0x46>
    if(p == freep)
 953:	39 05 ec 0d 00 00    	cmp    %eax,0xdec
 959:	75 ed                	jne    948 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 95b:	89 d8                	mov    %ebx,%eax
 95d:	e8 2f ff ff ff       	call   891 <morecore>
 962:	85 c0                	test   %eax,%eax
 964:	75 e2                	jne    948 <malloc+0x67>
 966:	eb d5                	jmp    93d <malloc+0x5c>
