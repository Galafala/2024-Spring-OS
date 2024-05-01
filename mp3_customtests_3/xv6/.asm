
user/_custom_rttask6:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f>:
#define NULL 0

int k = 0;

void f(void *arg)
{
       0:	1101                	addi	sp,sp,-32
       2:	ec22                	sd	s0,24(sp)
       4:	1000                	addi	s0,sp,32
       6:	fea43423          	sd	a0,-24(s0)
    while (1) {
        k++;
       a:	00002797          	auipc	a5,0x2
       e:	54678793          	addi	a5,a5,1350 # 2550 <k>
      12:	439c                	lw	a5,0(a5)
      14:	2785                	addiw	a5,a5,1
      16:	0007871b          	sext.w	a4,a5
      1a:	00002797          	auipc	a5,0x2
      1e:	53678793          	addi	a5,a5,1334 # 2550 <k>
      22:	c398                	sw	a4,0(a5)
      24:	b7dd                	j	a <f+0xa>

0000000000000026 <main>:
}

// 15 threads arriving @ different times w same deadline

int main(int argc, char **argv)
{   
      26:	7139                	addi	sp,sp,-64
      28:	fc06                	sd	ra,56(sp)
      2a:	f822                	sd	s0,48(sp)
      2c:	0080                	addi	s0,sp,64
      2e:	87aa                	mv	a5,a0
      30:	fcb43023          	sd	a1,-64(s0)
      34:	fcf42623          	sw	a5,-52(s0)
    struct thread *t0 = thread_create(f, NULL, 1,6,6,1);
      38:	4785                	li	a5,1
      3a:	4719                	li	a4,6
      3c:	4699                	li	a3,6
      3e:	4605                	li	a2,1
      40:	4581                	li	a1,0
      42:	00000517          	auipc	a0,0x0
      46:	fbe50513          	addi	a0,a0,-66 # 0 <f>
      4a:	00001097          	auipc	ra,0x1
      4e:	f32080e7          	jalr	-206(ra) # f7c <thread_create>
      52:	fea43023          	sd	a0,-32(s0)
    thread_add_at(t0, 19);
      56:	45cd                	li	a1,19
      58:	fe043503          	ld	a0,-32(s0)
      5c:	00001097          	auipc	ra,0x1
      60:	04c080e7          	jalr	76(ra) # 10a8 <thread_add_at>
    for(int i=2;i<=15;i++){
      64:	4789                	li	a5,2
      66:	fef42623          	sw	a5,-20(s0)
      6a:	a891                	j	be <main+0x98>
        struct thread *t = thread_create(f, NULL, 1,23-(16-i),23-(16-i),1);
      6c:	fec42783          	lw	a5,-20(s0)
      70:	279d                	addiw	a5,a5,7
      72:	0007869b          	sext.w	a3,a5
      76:	fec42783          	lw	a5,-20(s0)
      7a:	279d                	addiw	a5,a5,7
      7c:	0007871b          	sext.w	a4,a5
      80:	4785                	li	a5,1
      82:	4605                	li	a2,1
      84:	4581                	li	a1,0
      86:	00000517          	auipc	a0,0x0
      8a:	f7a50513          	addi	a0,a0,-134 # 0 <f>
      8e:	00001097          	auipc	ra,0x1
      92:	eee080e7          	jalr	-274(ra) # f7c <thread_create>
      96:	fca43c23          	sd	a0,-40(s0)
        thread_add_at(t, 16-i);
      9a:	4741                	li	a4,16
      9c:	fec42783          	lw	a5,-20(s0)
      a0:	40f707bb          	subw	a5,a4,a5
      a4:	2781                	sext.w	a5,a5
      a6:	85be                	mv	a1,a5
      a8:	fd843503          	ld	a0,-40(s0)
      ac:	00001097          	auipc	ra,0x1
      b0:	ffc080e7          	jalr	-4(ra) # 10a8 <thread_add_at>
    for(int i=2;i<=15;i++){
      b4:	fec42783          	lw	a5,-20(s0)
      b8:	2785                	addiw	a5,a5,1
      ba:	fef42623          	sw	a5,-20(s0)
      be:	fec42783          	lw	a5,-20(s0)
      c2:	0007871b          	sext.w	a4,a5
      c6:	47bd                	li	a5,15
      c8:	fae7d2e3          	bge	a5,a4,6c <main+0x46>
    }
    thread_start_threading();
      cc:	00001097          	auipc	ra,0x1
      d0:	7ea080e7          	jalr	2026(ra) # 18b6 <thread_start_threading>
    printf("\nexited\n");
      d4:	00002517          	auipc	a0,0x2
      d8:	2e450513          	addi	a0,a0,740 # 23b8 <schedule_dm+0x1f0>
      dc:	00001097          	auipc	ra,0x1
      e0:	9e8080e7          	jalr	-1560(ra) # ac4 <printf>
    exit(0);
      e4:	4501                	li	a0,0
      e6:	00000097          	auipc	ra,0x0
      ea:	498080e7          	jalr	1176(ra) # 57e <exit>

00000000000000ee <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      ee:	7179                	addi	sp,sp,-48
      f0:	f422                	sd	s0,40(sp)
      f2:	1800                	addi	s0,sp,48
      f4:	fca43c23          	sd	a0,-40(s0)
      f8:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      fc:	fd843783          	ld	a5,-40(s0)
     100:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     104:	0001                	nop
     106:	fd043703          	ld	a4,-48(s0)
     10a:	00170793          	addi	a5,a4,1
     10e:	fcf43823          	sd	a5,-48(s0)
     112:	fd843783          	ld	a5,-40(s0)
     116:	00178693          	addi	a3,a5,1
     11a:	fcd43c23          	sd	a3,-40(s0)
     11e:	00074703          	lbu	a4,0(a4)
     122:	00e78023          	sb	a4,0(a5)
     126:	0007c783          	lbu	a5,0(a5)
     12a:	fff1                	bnez	a5,106 <strcpy+0x18>
    ;
  return os;
     12c:	fe843783          	ld	a5,-24(s0)
}
     130:	853e                	mv	a0,a5
     132:	7422                	ld	s0,40(sp)
     134:	6145                	addi	sp,sp,48
     136:	8082                	ret

0000000000000138 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     138:	1101                	addi	sp,sp,-32
     13a:	ec22                	sd	s0,24(sp)
     13c:	1000                	addi	s0,sp,32
     13e:	fea43423          	sd	a0,-24(s0)
     142:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     146:	a819                	j	15c <strcmp+0x24>
    p++, q++;
     148:	fe843783          	ld	a5,-24(s0)
     14c:	0785                	addi	a5,a5,1
     14e:	fef43423          	sd	a5,-24(s0)
     152:	fe043783          	ld	a5,-32(s0)
     156:	0785                	addi	a5,a5,1
     158:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     15c:	fe843783          	ld	a5,-24(s0)
     160:	0007c783          	lbu	a5,0(a5)
     164:	cb99                	beqz	a5,17a <strcmp+0x42>
     166:	fe843783          	ld	a5,-24(s0)
     16a:	0007c703          	lbu	a4,0(a5)
     16e:	fe043783          	ld	a5,-32(s0)
     172:	0007c783          	lbu	a5,0(a5)
     176:	fcf709e3          	beq	a4,a5,148 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     17a:	fe843783          	ld	a5,-24(s0)
     17e:	0007c783          	lbu	a5,0(a5)
     182:	0007871b          	sext.w	a4,a5
     186:	fe043783          	ld	a5,-32(s0)
     18a:	0007c783          	lbu	a5,0(a5)
     18e:	2781                	sext.w	a5,a5
     190:	40f707bb          	subw	a5,a4,a5
     194:	2781                	sext.w	a5,a5
}
     196:	853e                	mv	a0,a5
     198:	6462                	ld	s0,24(sp)
     19a:	6105                	addi	sp,sp,32
     19c:	8082                	ret

000000000000019e <strlen>:

uint
strlen(const char *s)
{
     19e:	7179                	addi	sp,sp,-48
     1a0:	f422                	sd	s0,40(sp)
     1a2:	1800                	addi	s0,sp,48
     1a4:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     1a8:	fe042623          	sw	zero,-20(s0)
     1ac:	a031                	j	1b8 <strlen+0x1a>
     1ae:	fec42783          	lw	a5,-20(s0)
     1b2:	2785                	addiw	a5,a5,1
     1b4:	fef42623          	sw	a5,-20(s0)
     1b8:	fec42783          	lw	a5,-20(s0)
     1bc:	fd843703          	ld	a4,-40(s0)
     1c0:	97ba                	add	a5,a5,a4
     1c2:	0007c783          	lbu	a5,0(a5)
     1c6:	f7e5                	bnez	a5,1ae <strlen+0x10>
    ;
  return n;
     1c8:	fec42783          	lw	a5,-20(s0)
}
     1cc:	853e                	mv	a0,a5
     1ce:	7422                	ld	s0,40(sp)
     1d0:	6145                	addi	sp,sp,48
     1d2:	8082                	ret

00000000000001d4 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1d4:	7179                	addi	sp,sp,-48
     1d6:	f422                	sd	s0,40(sp)
     1d8:	1800                	addi	s0,sp,48
     1da:	fca43c23          	sd	a0,-40(s0)
     1de:	87ae                	mv	a5,a1
     1e0:	8732                	mv	a4,a2
     1e2:	fcf42a23          	sw	a5,-44(s0)
     1e6:	87ba                	mv	a5,a4
     1e8:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     1ec:	fd843783          	ld	a5,-40(s0)
     1f0:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     1f4:	fe042623          	sw	zero,-20(s0)
     1f8:	a00d                	j	21a <memset+0x46>
    cdst[i] = c;
     1fa:	fec42783          	lw	a5,-20(s0)
     1fe:	fe043703          	ld	a4,-32(s0)
     202:	97ba                	add	a5,a5,a4
     204:	fd442703          	lw	a4,-44(s0)
     208:	0ff77713          	andi	a4,a4,255
     20c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     210:	fec42783          	lw	a5,-20(s0)
     214:	2785                	addiw	a5,a5,1
     216:	fef42623          	sw	a5,-20(s0)
     21a:	fec42703          	lw	a4,-20(s0)
     21e:	fd042783          	lw	a5,-48(s0)
     222:	2781                	sext.w	a5,a5
     224:	fcf76be3          	bltu	a4,a5,1fa <memset+0x26>
  }
  return dst;
     228:	fd843783          	ld	a5,-40(s0)
}
     22c:	853e                	mv	a0,a5
     22e:	7422                	ld	s0,40(sp)
     230:	6145                	addi	sp,sp,48
     232:	8082                	ret

0000000000000234 <strchr>:

char*
strchr(const char *s, char c)
{
     234:	1101                	addi	sp,sp,-32
     236:	ec22                	sd	s0,24(sp)
     238:	1000                	addi	s0,sp,32
     23a:	fea43423          	sd	a0,-24(s0)
     23e:	87ae                	mv	a5,a1
     240:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     244:	a01d                	j	26a <strchr+0x36>
    if(*s == c)
     246:	fe843783          	ld	a5,-24(s0)
     24a:	0007c703          	lbu	a4,0(a5)
     24e:	fe744783          	lbu	a5,-25(s0)
     252:	0ff7f793          	andi	a5,a5,255
     256:	00e79563          	bne	a5,a4,260 <strchr+0x2c>
      return (char*)s;
     25a:	fe843783          	ld	a5,-24(s0)
     25e:	a821                	j	276 <strchr+0x42>
  for(; *s; s++)
     260:	fe843783          	ld	a5,-24(s0)
     264:	0785                	addi	a5,a5,1
     266:	fef43423          	sd	a5,-24(s0)
     26a:	fe843783          	ld	a5,-24(s0)
     26e:	0007c783          	lbu	a5,0(a5)
     272:	fbf1                	bnez	a5,246 <strchr+0x12>
  return 0;
     274:	4781                	li	a5,0
}
     276:	853e                	mv	a0,a5
     278:	6462                	ld	s0,24(sp)
     27a:	6105                	addi	sp,sp,32
     27c:	8082                	ret

000000000000027e <gets>:

char*
gets(char *buf, int max)
{
     27e:	7179                	addi	sp,sp,-48
     280:	f406                	sd	ra,40(sp)
     282:	f022                	sd	s0,32(sp)
     284:	1800                	addi	s0,sp,48
     286:	fca43c23          	sd	a0,-40(s0)
     28a:	87ae                	mv	a5,a1
     28c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     290:	fe042623          	sw	zero,-20(s0)
     294:	a8a1                	j	2ec <gets+0x6e>
    cc = read(0, &c, 1);
     296:	fe740793          	addi	a5,s0,-25
     29a:	4605                	li	a2,1
     29c:	85be                	mv	a1,a5
     29e:	4501                	li	a0,0
     2a0:	00000097          	auipc	ra,0x0
     2a4:	2f6080e7          	jalr	758(ra) # 596 <read>
     2a8:	87aa                	mv	a5,a0
     2aa:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     2ae:	fe842783          	lw	a5,-24(s0)
     2b2:	2781                	sext.w	a5,a5
     2b4:	04f05763          	blez	a5,302 <gets+0x84>
      break;
    buf[i++] = c;
     2b8:	fec42783          	lw	a5,-20(s0)
     2bc:	0017871b          	addiw	a4,a5,1
     2c0:	fee42623          	sw	a4,-20(s0)
     2c4:	873e                	mv	a4,a5
     2c6:	fd843783          	ld	a5,-40(s0)
     2ca:	97ba                	add	a5,a5,a4
     2cc:	fe744703          	lbu	a4,-25(s0)
     2d0:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     2d4:	fe744783          	lbu	a5,-25(s0)
     2d8:	873e                	mv	a4,a5
     2da:	47a9                	li	a5,10
     2dc:	02f70463          	beq	a4,a5,304 <gets+0x86>
     2e0:	fe744783          	lbu	a5,-25(s0)
     2e4:	873e                	mv	a4,a5
     2e6:	47b5                	li	a5,13
     2e8:	00f70e63          	beq	a4,a5,304 <gets+0x86>
  for(i=0; i+1 < max; ){
     2ec:	fec42783          	lw	a5,-20(s0)
     2f0:	2785                	addiw	a5,a5,1
     2f2:	0007871b          	sext.w	a4,a5
     2f6:	fd442783          	lw	a5,-44(s0)
     2fa:	2781                	sext.w	a5,a5
     2fc:	f8f74de3          	blt	a4,a5,296 <gets+0x18>
     300:	a011                	j	304 <gets+0x86>
      break;
     302:	0001                	nop
      break;
  }
  buf[i] = '\0';
     304:	fec42783          	lw	a5,-20(s0)
     308:	fd843703          	ld	a4,-40(s0)
     30c:	97ba                	add	a5,a5,a4
     30e:	00078023          	sb	zero,0(a5)
  return buf;
     312:	fd843783          	ld	a5,-40(s0)
}
     316:	853e                	mv	a0,a5
     318:	70a2                	ld	ra,40(sp)
     31a:	7402                	ld	s0,32(sp)
     31c:	6145                	addi	sp,sp,48
     31e:	8082                	ret

0000000000000320 <stat>:

int
stat(const char *n, struct stat *st)
{
     320:	7179                	addi	sp,sp,-48
     322:	f406                	sd	ra,40(sp)
     324:	f022                	sd	s0,32(sp)
     326:	1800                	addi	s0,sp,48
     328:	fca43c23          	sd	a0,-40(s0)
     32c:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     330:	4581                	li	a1,0
     332:	fd843503          	ld	a0,-40(s0)
     336:	00000097          	auipc	ra,0x0
     33a:	288080e7          	jalr	648(ra) # 5be <open>
     33e:	87aa                	mv	a5,a0
     340:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     344:	fec42783          	lw	a5,-20(s0)
     348:	2781                	sext.w	a5,a5
     34a:	0007d463          	bgez	a5,352 <stat+0x32>
    return -1;
     34e:	57fd                	li	a5,-1
     350:	a035                	j	37c <stat+0x5c>
  r = fstat(fd, st);
     352:	fec42783          	lw	a5,-20(s0)
     356:	fd043583          	ld	a1,-48(s0)
     35a:	853e                	mv	a0,a5
     35c:	00000097          	auipc	ra,0x0
     360:	27a080e7          	jalr	634(ra) # 5d6 <fstat>
     364:	87aa                	mv	a5,a0
     366:	fef42423          	sw	a5,-24(s0)
  close(fd);
     36a:	fec42783          	lw	a5,-20(s0)
     36e:	853e                	mv	a0,a5
     370:	00000097          	auipc	ra,0x0
     374:	236080e7          	jalr	566(ra) # 5a6 <close>
  return r;
     378:	fe842783          	lw	a5,-24(s0)
}
     37c:	853e                	mv	a0,a5
     37e:	70a2                	ld	ra,40(sp)
     380:	7402                	ld	s0,32(sp)
     382:	6145                	addi	sp,sp,48
     384:	8082                	ret

0000000000000386 <atoi>:

int
atoi(const char *s)
{
     386:	7179                	addi	sp,sp,-48
     388:	f422                	sd	s0,40(sp)
     38a:	1800                	addi	s0,sp,48
     38c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     390:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     394:	a815                	j	3c8 <atoi+0x42>
    n = n*10 + *s++ - '0';
     396:	fec42703          	lw	a4,-20(s0)
     39a:	87ba                	mv	a5,a4
     39c:	0027979b          	slliw	a5,a5,0x2
     3a0:	9fb9                	addw	a5,a5,a4
     3a2:	0017979b          	slliw	a5,a5,0x1
     3a6:	0007871b          	sext.w	a4,a5
     3aa:	fd843783          	ld	a5,-40(s0)
     3ae:	00178693          	addi	a3,a5,1
     3b2:	fcd43c23          	sd	a3,-40(s0)
     3b6:	0007c783          	lbu	a5,0(a5)
     3ba:	2781                	sext.w	a5,a5
     3bc:	9fb9                	addw	a5,a5,a4
     3be:	2781                	sext.w	a5,a5
     3c0:	fd07879b          	addiw	a5,a5,-48
     3c4:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     3c8:	fd843783          	ld	a5,-40(s0)
     3cc:	0007c783          	lbu	a5,0(a5)
     3d0:	873e                	mv	a4,a5
     3d2:	02f00793          	li	a5,47
     3d6:	00e7fb63          	bgeu	a5,a4,3ec <atoi+0x66>
     3da:	fd843783          	ld	a5,-40(s0)
     3de:	0007c783          	lbu	a5,0(a5)
     3e2:	873e                	mv	a4,a5
     3e4:	03900793          	li	a5,57
     3e8:	fae7f7e3          	bgeu	a5,a4,396 <atoi+0x10>
  return n;
     3ec:	fec42783          	lw	a5,-20(s0)
}
     3f0:	853e                	mv	a0,a5
     3f2:	7422                	ld	s0,40(sp)
     3f4:	6145                	addi	sp,sp,48
     3f6:	8082                	ret

00000000000003f8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     3f8:	7139                	addi	sp,sp,-64
     3fa:	fc22                	sd	s0,56(sp)
     3fc:	0080                	addi	s0,sp,64
     3fe:	fca43c23          	sd	a0,-40(s0)
     402:	fcb43823          	sd	a1,-48(s0)
     406:	87b2                	mv	a5,a2
     408:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     40c:	fd843783          	ld	a5,-40(s0)
     410:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     414:	fd043783          	ld	a5,-48(s0)
     418:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     41c:	fe043703          	ld	a4,-32(s0)
     420:	fe843783          	ld	a5,-24(s0)
     424:	02e7fc63          	bgeu	a5,a4,45c <memmove+0x64>
    while(n-- > 0)
     428:	a00d                	j	44a <memmove+0x52>
      *dst++ = *src++;
     42a:	fe043703          	ld	a4,-32(s0)
     42e:	00170793          	addi	a5,a4,1
     432:	fef43023          	sd	a5,-32(s0)
     436:	fe843783          	ld	a5,-24(s0)
     43a:	00178693          	addi	a3,a5,1
     43e:	fed43423          	sd	a3,-24(s0)
     442:	00074703          	lbu	a4,0(a4)
     446:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     44a:	fcc42783          	lw	a5,-52(s0)
     44e:	fff7871b          	addiw	a4,a5,-1
     452:	fce42623          	sw	a4,-52(s0)
     456:	fcf04ae3          	bgtz	a5,42a <memmove+0x32>
     45a:	a891                	j	4ae <memmove+0xb6>
  } else {
    dst += n;
     45c:	fcc42783          	lw	a5,-52(s0)
     460:	fe843703          	ld	a4,-24(s0)
     464:	97ba                	add	a5,a5,a4
     466:	fef43423          	sd	a5,-24(s0)
    src += n;
     46a:	fcc42783          	lw	a5,-52(s0)
     46e:	fe043703          	ld	a4,-32(s0)
     472:	97ba                	add	a5,a5,a4
     474:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     478:	a01d                	j	49e <memmove+0xa6>
      *--dst = *--src;
     47a:	fe043783          	ld	a5,-32(s0)
     47e:	17fd                	addi	a5,a5,-1
     480:	fef43023          	sd	a5,-32(s0)
     484:	fe843783          	ld	a5,-24(s0)
     488:	17fd                	addi	a5,a5,-1
     48a:	fef43423          	sd	a5,-24(s0)
     48e:	fe043783          	ld	a5,-32(s0)
     492:	0007c703          	lbu	a4,0(a5)
     496:	fe843783          	ld	a5,-24(s0)
     49a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     49e:	fcc42783          	lw	a5,-52(s0)
     4a2:	fff7871b          	addiw	a4,a5,-1
     4a6:	fce42623          	sw	a4,-52(s0)
     4aa:	fcf048e3          	bgtz	a5,47a <memmove+0x82>
  }
  return vdst;
     4ae:	fd843783          	ld	a5,-40(s0)
}
     4b2:	853e                	mv	a0,a5
     4b4:	7462                	ld	s0,56(sp)
     4b6:	6121                	addi	sp,sp,64
     4b8:	8082                	ret

00000000000004ba <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     4ba:	7139                	addi	sp,sp,-64
     4bc:	fc22                	sd	s0,56(sp)
     4be:	0080                	addi	s0,sp,64
     4c0:	fca43c23          	sd	a0,-40(s0)
     4c4:	fcb43823          	sd	a1,-48(s0)
     4c8:	87b2                	mv	a5,a2
     4ca:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     4ce:	fd843783          	ld	a5,-40(s0)
     4d2:	fef43423          	sd	a5,-24(s0)
     4d6:	fd043783          	ld	a5,-48(s0)
     4da:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4de:	a0a1                	j	526 <memcmp+0x6c>
    if (*p1 != *p2) {
     4e0:	fe843783          	ld	a5,-24(s0)
     4e4:	0007c703          	lbu	a4,0(a5)
     4e8:	fe043783          	ld	a5,-32(s0)
     4ec:	0007c783          	lbu	a5,0(a5)
     4f0:	02f70163          	beq	a4,a5,512 <memcmp+0x58>
      return *p1 - *p2;
     4f4:	fe843783          	ld	a5,-24(s0)
     4f8:	0007c783          	lbu	a5,0(a5)
     4fc:	0007871b          	sext.w	a4,a5
     500:	fe043783          	ld	a5,-32(s0)
     504:	0007c783          	lbu	a5,0(a5)
     508:	2781                	sext.w	a5,a5
     50a:	40f707bb          	subw	a5,a4,a5
     50e:	2781                	sext.w	a5,a5
     510:	a01d                	j	536 <memcmp+0x7c>
    }
    p1++;
     512:	fe843783          	ld	a5,-24(s0)
     516:	0785                	addi	a5,a5,1
     518:	fef43423          	sd	a5,-24(s0)
    p2++;
     51c:	fe043783          	ld	a5,-32(s0)
     520:	0785                	addi	a5,a5,1
     522:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     526:	fcc42783          	lw	a5,-52(s0)
     52a:	fff7871b          	addiw	a4,a5,-1
     52e:	fce42623          	sw	a4,-52(s0)
     532:	f7dd                	bnez	a5,4e0 <memcmp+0x26>
  }
  return 0;
     534:	4781                	li	a5,0
}
     536:	853e                	mv	a0,a5
     538:	7462                	ld	s0,56(sp)
     53a:	6121                	addi	sp,sp,64
     53c:	8082                	ret

000000000000053e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     53e:	7179                	addi	sp,sp,-48
     540:	f406                	sd	ra,40(sp)
     542:	f022                	sd	s0,32(sp)
     544:	1800                	addi	s0,sp,48
     546:	fea43423          	sd	a0,-24(s0)
     54a:	feb43023          	sd	a1,-32(s0)
     54e:	87b2                	mv	a5,a2
     550:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     554:	fdc42783          	lw	a5,-36(s0)
     558:	863e                	mv	a2,a5
     55a:	fe043583          	ld	a1,-32(s0)
     55e:	fe843503          	ld	a0,-24(s0)
     562:	00000097          	auipc	ra,0x0
     566:	e96080e7          	jalr	-362(ra) # 3f8 <memmove>
     56a:	87aa                	mv	a5,a0
}
     56c:	853e                	mv	a0,a5
     56e:	70a2                	ld	ra,40(sp)
     570:	7402                	ld	s0,32(sp)
     572:	6145                	addi	sp,sp,48
     574:	8082                	ret

0000000000000576 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     576:	4885                	li	a7,1
 ecall
     578:	00000073          	ecall
 ret
     57c:	8082                	ret

000000000000057e <exit>:
.global exit
exit:
 li a7, SYS_exit
     57e:	4889                	li	a7,2
 ecall
     580:	00000073          	ecall
 ret
     584:	8082                	ret

0000000000000586 <wait>:
.global wait
wait:
 li a7, SYS_wait
     586:	488d                	li	a7,3
 ecall
     588:	00000073          	ecall
 ret
     58c:	8082                	ret

000000000000058e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     58e:	4891                	li	a7,4
 ecall
     590:	00000073          	ecall
 ret
     594:	8082                	ret

0000000000000596 <read>:
.global read
read:
 li a7, SYS_read
     596:	4895                	li	a7,5
 ecall
     598:	00000073          	ecall
 ret
     59c:	8082                	ret

000000000000059e <write>:
.global write
write:
 li a7, SYS_write
     59e:	48c1                	li	a7,16
 ecall
     5a0:	00000073          	ecall
 ret
     5a4:	8082                	ret

00000000000005a6 <close>:
.global close
close:
 li a7, SYS_close
     5a6:	48d5                	li	a7,21
 ecall
     5a8:	00000073          	ecall
 ret
     5ac:	8082                	ret

00000000000005ae <kill>:
.global kill
kill:
 li a7, SYS_kill
     5ae:	4899                	li	a7,6
 ecall
     5b0:	00000073          	ecall
 ret
     5b4:	8082                	ret

00000000000005b6 <exec>:
.global exec
exec:
 li a7, SYS_exec
     5b6:	489d                	li	a7,7
 ecall
     5b8:	00000073          	ecall
 ret
     5bc:	8082                	ret

00000000000005be <open>:
.global open
open:
 li a7, SYS_open
     5be:	48bd                	li	a7,15
 ecall
     5c0:	00000073          	ecall
 ret
     5c4:	8082                	ret

00000000000005c6 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     5c6:	48c5                	li	a7,17
 ecall
     5c8:	00000073          	ecall
 ret
     5cc:	8082                	ret

00000000000005ce <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     5ce:	48c9                	li	a7,18
 ecall
     5d0:	00000073          	ecall
 ret
     5d4:	8082                	ret

00000000000005d6 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     5d6:	48a1                	li	a7,8
 ecall
     5d8:	00000073          	ecall
 ret
     5dc:	8082                	ret

00000000000005de <link>:
.global link
link:
 li a7, SYS_link
     5de:	48cd                	li	a7,19
 ecall
     5e0:	00000073          	ecall
 ret
     5e4:	8082                	ret

00000000000005e6 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     5e6:	48d1                	li	a7,20
 ecall
     5e8:	00000073          	ecall
 ret
     5ec:	8082                	ret

00000000000005ee <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     5ee:	48a5                	li	a7,9
 ecall
     5f0:	00000073          	ecall
 ret
     5f4:	8082                	ret

00000000000005f6 <dup>:
.global dup
dup:
 li a7, SYS_dup
     5f6:	48a9                	li	a7,10
 ecall
     5f8:	00000073          	ecall
 ret
     5fc:	8082                	ret

00000000000005fe <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     5fe:	48ad                	li	a7,11
 ecall
     600:	00000073          	ecall
 ret
     604:	8082                	ret

0000000000000606 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     606:	48b1                	li	a7,12
 ecall
     608:	00000073          	ecall
 ret
     60c:	8082                	ret

000000000000060e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     60e:	48b5                	li	a7,13
 ecall
     610:	00000073          	ecall
 ret
     614:	8082                	ret

0000000000000616 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     616:	48b9                	li	a7,14
 ecall
     618:	00000073          	ecall
 ret
     61c:	8082                	ret

000000000000061e <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     61e:	48d9                	li	a7,22
 ecall
     620:	00000073          	ecall
 ret
     624:	8082                	ret

0000000000000626 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     626:	48dd                	li	a7,23
 ecall
     628:	00000073          	ecall
 ret
     62c:	8082                	ret

000000000000062e <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     62e:	48e1                	li	a7,24
 ecall
     630:	00000073          	ecall
 ret
     634:	8082                	ret

0000000000000636 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     636:	1101                	addi	sp,sp,-32
     638:	ec06                	sd	ra,24(sp)
     63a:	e822                	sd	s0,16(sp)
     63c:	1000                	addi	s0,sp,32
     63e:	87aa                	mv	a5,a0
     640:	872e                	mv	a4,a1
     642:	fef42623          	sw	a5,-20(s0)
     646:	87ba                	mv	a5,a4
     648:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     64c:	feb40713          	addi	a4,s0,-21
     650:	fec42783          	lw	a5,-20(s0)
     654:	4605                	li	a2,1
     656:	85ba                	mv	a1,a4
     658:	853e                	mv	a0,a5
     65a:	00000097          	auipc	ra,0x0
     65e:	f44080e7          	jalr	-188(ra) # 59e <write>
}
     662:	0001                	nop
     664:	60e2                	ld	ra,24(sp)
     666:	6442                	ld	s0,16(sp)
     668:	6105                	addi	sp,sp,32
     66a:	8082                	ret

000000000000066c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     66c:	7139                	addi	sp,sp,-64
     66e:	fc06                	sd	ra,56(sp)
     670:	f822                	sd	s0,48(sp)
     672:	0080                	addi	s0,sp,64
     674:	87aa                	mv	a5,a0
     676:	8736                	mv	a4,a3
     678:	fcf42623          	sw	a5,-52(s0)
     67c:	87ae                	mv	a5,a1
     67e:	fcf42423          	sw	a5,-56(s0)
     682:	87b2                	mv	a5,a2
     684:	fcf42223          	sw	a5,-60(s0)
     688:	87ba                	mv	a5,a4
     68a:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     68e:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     692:	fc042783          	lw	a5,-64(s0)
     696:	2781                	sext.w	a5,a5
     698:	c38d                	beqz	a5,6ba <printint+0x4e>
     69a:	fc842783          	lw	a5,-56(s0)
     69e:	2781                	sext.w	a5,a5
     6a0:	0007dd63          	bgez	a5,6ba <printint+0x4e>
    neg = 1;
     6a4:	4785                	li	a5,1
     6a6:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     6aa:	fc842783          	lw	a5,-56(s0)
     6ae:	40f007bb          	negw	a5,a5
     6b2:	2781                	sext.w	a5,a5
     6b4:	fef42223          	sw	a5,-28(s0)
     6b8:	a029                	j	6c2 <printint+0x56>
  } else {
    x = xx;
     6ba:	fc842783          	lw	a5,-56(s0)
     6be:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     6c2:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     6c6:	fc442783          	lw	a5,-60(s0)
     6ca:	fe442703          	lw	a4,-28(s0)
     6ce:	02f777bb          	remuw	a5,a4,a5
     6d2:	0007861b          	sext.w	a2,a5
     6d6:	fec42783          	lw	a5,-20(s0)
     6da:	0017871b          	addiw	a4,a5,1
     6de:	fee42623          	sw	a4,-20(s0)
     6e2:	00002697          	auipc	a3,0x2
     6e6:	e2e68693          	addi	a3,a3,-466 # 2510 <digits>
     6ea:	02061713          	slli	a4,a2,0x20
     6ee:	9301                	srli	a4,a4,0x20
     6f0:	9736                	add	a4,a4,a3
     6f2:	00074703          	lbu	a4,0(a4)
     6f6:	ff040693          	addi	a3,s0,-16
     6fa:	97b6                	add	a5,a5,a3
     6fc:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     700:	fc442783          	lw	a5,-60(s0)
     704:	fe442703          	lw	a4,-28(s0)
     708:	02f757bb          	divuw	a5,a4,a5
     70c:	fef42223          	sw	a5,-28(s0)
     710:	fe442783          	lw	a5,-28(s0)
     714:	2781                	sext.w	a5,a5
     716:	fbc5                	bnez	a5,6c6 <printint+0x5a>
  if(neg)
     718:	fe842783          	lw	a5,-24(s0)
     71c:	2781                	sext.w	a5,a5
     71e:	cf95                	beqz	a5,75a <printint+0xee>
    buf[i++] = '-';
     720:	fec42783          	lw	a5,-20(s0)
     724:	0017871b          	addiw	a4,a5,1
     728:	fee42623          	sw	a4,-20(s0)
     72c:	ff040713          	addi	a4,s0,-16
     730:	97ba                	add	a5,a5,a4
     732:	02d00713          	li	a4,45
     736:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     73a:	a005                	j	75a <printint+0xee>
    putc(fd, buf[i]);
     73c:	fec42783          	lw	a5,-20(s0)
     740:	ff040713          	addi	a4,s0,-16
     744:	97ba                	add	a5,a5,a4
     746:	fe07c703          	lbu	a4,-32(a5)
     74a:	fcc42783          	lw	a5,-52(s0)
     74e:	85ba                	mv	a1,a4
     750:	853e                	mv	a0,a5
     752:	00000097          	auipc	ra,0x0
     756:	ee4080e7          	jalr	-284(ra) # 636 <putc>
  while(--i >= 0)
     75a:	fec42783          	lw	a5,-20(s0)
     75e:	37fd                	addiw	a5,a5,-1
     760:	fef42623          	sw	a5,-20(s0)
     764:	fec42783          	lw	a5,-20(s0)
     768:	2781                	sext.w	a5,a5
     76a:	fc07d9e3          	bgez	a5,73c <printint+0xd0>
}
     76e:	0001                	nop
     770:	0001                	nop
     772:	70e2                	ld	ra,56(sp)
     774:	7442                	ld	s0,48(sp)
     776:	6121                	addi	sp,sp,64
     778:	8082                	ret

000000000000077a <printptr>:

static void
printptr(int fd, uint64 x) {
     77a:	7179                	addi	sp,sp,-48
     77c:	f406                	sd	ra,40(sp)
     77e:	f022                	sd	s0,32(sp)
     780:	1800                	addi	s0,sp,48
     782:	87aa                	mv	a5,a0
     784:	fcb43823          	sd	a1,-48(s0)
     788:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     78c:	fdc42783          	lw	a5,-36(s0)
     790:	03000593          	li	a1,48
     794:	853e                	mv	a0,a5
     796:	00000097          	auipc	ra,0x0
     79a:	ea0080e7          	jalr	-352(ra) # 636 <putc>
  putc(fd, 'x');
     79e:	fdc42783          	lw	a5,-36(s0)
     7a2:	07800593          	li	a1,120
     7a6:	853e                	mv	a0,a5
     7a8:	00000097          	auipc	ra,0x0
     7ac:	e8e080e7          	jalr	-370(ra) # 636 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7b0:	fe042623          	sw	zero,-20(s0)
     7b4:	a82d                	j	7ee <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     7b6:	fd043783          	ld	a5,-48(s0)
     7ba:	93f1                	srli	a5,a5,0x3c
     7bc:	00002717          	auipc	a4,0x2
     7c0:	d5470713          	addi	a4,a4,-684 # 2510 <digits>
     7c4:	97ba                	add	a5,a5,a4
     7c6:	0007c703          	lbu	a4,0(a5)
     7ca:	fdc42783          	lw	a5,-36(s0)
     7ce:	85ba                	mv	a1,a4
     7d0:	853e                	mv	a0,a5
     7d2:	00000097          	auipc	ra,0x0
     7d6:	e64080e7          	jalr	-412(ra) # 636 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7da:	fec42783          	lw	a5,-20(s0)
     7de:	2785                	addiw	a5,a5,1
     7e0:	fef42623          	sw	a5,-20(s0)
     7e4:	fd043783          	ld	a5,-48(s0)
     7e8:	0792                	slli	a5,a5,0x4
     7ea:	fcf43823          	sd	a5,-48(s0)
     7ee:	fec42783          	lw	a5,-20(s0)
     7f2:	873e                	mv	a4,a5
     7f4:	47bd                	li	a5,15
     7f6:	fce7f0e3          	bgeu	a5,a4,7b6 <printptr+0x3c>
}
     7fa:	0001                	nop
     7fc:	0001                	nop
     7fe:	70a2                	ld	ra,40(sp)
     800:	7402                	ld	s0,32(sp)
     802:	6145                	addi	sp,sp,48
     804:	8082                	ret

0000000000000806 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     806:	715d                	addi	sp,sp,-80
     808:	e486                	sd	ra,72(sp)
     80a:	e0a2                	sd	s0,64(sp)
     80c:	0880                	addi	s0,sp,80
     80e:	87aa                	mv	a5,a0
     810:	fcb43023          	sd	a1,-64(s0)
     814:	fac43c23          	sd	a2,-72(s0)
     818:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     81c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     820:	fe042223          	sw	zero,-28(s0)
     824:	a42d                	j	a4e <vprintf+0x248>
    c = fmt[i] & 0xff;
     826:	fe442783          	lw	a5,-28(s0)
     82a:	fc043703          	ld	a4,-64(s0)
     82e:	97ba                	add	a5,a5,a4
     830:	0007c783          	lbu	a5,0(a5)
     834:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     838:	fe042783          	lw	a5,-32(s0)
     83c:	2781                	sext.w	a5,a5
     83e:	eb9d                	bnez	a5,874 <vprintf+0x6e>
      if(c == '%'){
     840:	fdc42783          	lw	a5,-36(s0)
     844:	0007871b          	sext.w	a4,a5
     848:	02500793          	li	a5,37
     84c:	00f71763          	bne	a4,a5,85a <vprintf+0x54>
        state = '%';
     850:	02500793          	li	a5,37
     854:	fef42023          	sw	a5,-32(s0)
     858:	a2f5                	j	a44 <vprintf+0x23e>
      } else {
        putc(fd, c);
     85a:	fdc42783          	lw	a5,-36(s0)
     85e:	0ff7f713          	andi	a4,a5,255
     862:	fcc42783          	lw	a5,-52(s0)
     866:	85ba                	mv	a1,a4
     868:	853e                	mv	a0,a5
     86a:	00000097          	auipc	ra,0x0
     86e:	dcc080e7          	jalr	-564(ra) # 636 <putc>
     872:	aac9                	j	a44 <vprintf+0x23e>
      }
    } else if(state == '%'){
     874:	fe042783          	lw	a5,-32(s0)
     878:	0007871b          	sext.w	a4,a5
     87c:	02500793          	li	a5,37
     880:	1cf71263          	bne	a4,a5,a44 <vprintf+0x23e>
      if(c == 'd'){
     884:	fdc42783          	lw	a5,-36(s0)
     888:	0007871b          	sext.w	a4,a5
     88c:	06400793          	li	a5,100
     890:	02f71463          	bne	a4,a5,8b8 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     894:	fb843783          	ld	a5,-72(s0)
     898:	00878713          	addi	a4,a5,8
     89c:	fae43c23          	sd	a4,-72(s0)
     8a0:	4398                	lw	a4,0(a5)
     8a2:	fcc42783          	lw	a5,-52(s0)
     8a6:	4685                	li	a3,1
     8a8:	4629                	li	a2,10
     8aa:	85ba                	mv	a1,a4
     8ac:	853e                	mv	a0,a5
     8ae:	00000097          	auipc	ra,0x0
     8b2:	dbe080e7          	jalr	-578(ra) # 66c <printint>
     8b6:	a269                	j	a40 <vprintf+0x23a>
      } else if(c == 'l') {
     8b8:	fdc42783          	lw	a5,-36(s0)
     8bc:	0007871b          	sext.w	a4,a5
     8c0:	06c00793          	li	a5,108
     8c4:	02f71663          	bne	a4,a5,8f0 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     8c8:	fb843783          	ld	a5,-72(s0)
     8cc:	00878713          	addi	a4,a5,8
     8d0:	fae43c23          	sd	a4,-72(s0)
     8d4:	639c                	ld	a5,0(a5)
     8d6:	0007871b          	sext.w	a4,a5
     8da:	fcc42783          	lw	a5,-52(s0)
     8de:	4681                	li	a3,0
     8e0:	4629                	li	a2,10
     8e2:	85ba                	mv	a1,a4
     8e4:	853e                	mv	a0,a5
     8e6:	00000097          	auipc	ra,0x0
     8ea:	d86080e7          	jalr	-634(ra) # 66c <printint>
     8ee:	aa89                	j	a40 <vprintf+0x23a>
      } else if(c == 'x') {
     8f0:	fdc42783          	lw	a5,-36(s0)
     8f4:	0007871b          	sext.w	a4,a5
     8f8:	07800793          	li	a5,120
     8fc:	02f71463          	bne	a4,a5,924 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     900:	fb843783          	ld	a5,-72(s0)
     904:	00878713          	addi	a4,a5,8
     908:	fae43c23          	sd	a4,-72(s0)
     90c:	4398                	lw	a4,0(a5)
     90e:	fcc42783          	lw	a5,-52(s0)
     912:	4681                	li	a3,0
     914:	4641                	li	a2,16
     916:	85ba                	mv	a1,a4
     918:	853e                	mv	a0,a5
     91a:	00000097          	auipc	ra,0x0
     91e:	d52080e7          	jalr	-686(ra) # 66c <printint>
     922:	aa39                	j	a40 <vprintf+0x23a>
      } else if(c == 'p') {
     924:	fdc42783          	lw	a5,-36(s0)
     928:	0007871b          	sext.w	a4,a5
     92c:	07000793          	li	a5,112
     930:	02f71263          	bne	a4,a5,954 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     934:	fb843783          	ld	a5,-72(s0)
     938:	00878713          	addi	a4,a5,8
     93c:	fae43c23          	sd	a4,-72(s0)
     940:	6398                	ld	a4,0(a5)
     942:	fcc42783          	lw	a5,-52(s0)
     946:	85ba                	mv	a1,a4
     948:	853e                	mv	a0,a5
     94a:	00000097          	auipc	ra,0x0
     94e:	e30080e7          	jalr	-464(ra) # 77a <printptr>
     952:	a0fd                	j	a40 <vprintf+0x23a>
      } else if(c == 's'){
     954:	fdc42783          	lw	a5,-36(s0)
     958:	0007871b          	sext.w	a4,a5
     95c:	07300793          	li	a5,115
     960:	04f71c63          	bne	a4,a5,9b8 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     964:	fb843783          	ld	a5,-72(s0)
     968:	00878713          	addi	a4,a5,8
     96c:	fae43c23          	sd	a4,-72(s0)
     970:	639c                	ld	a5,0(a5)
     972:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     976:	fe843783          	ld	a5,-24(s0)
     97a:	eb8d                	bnez	a5,9ac <vprintf+0x1a6>
          s = "(null)";
     97c:	00002797          	auipc	a5,0x2
     980:	a4c78793          	addi	a5,a5,-1460 # 23c8 <schedule_dm+0x200>
     984:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     988:	a015                	j	9ac <vprintf+0x1a6>
          putc(fd, *s);
     98a:	fe843783          	ld	a5,-24(s0)
     98e:	0007c703          	lbu	a4,0(a5)
     992:	fcc42783          	lw	a5,-52(s0)
     996:	85ba                	mv	a1,a4
     998:	853e                	mv	a0,a5
     99a:	00000097          	auipc	ra,0x0
     99e:	c9c080e7          	jalr	-868(ra) # 636 <putc>
          s++;
     9a2:	fe843783          	ld	a5,-24(s0)
     9a6:	0785                	addi	a5,a5,1
     9a8:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     9ac:	fe843783          	ld	a5,-24(s0)
     9b0:	0007c783          	lbu	a5,0(a5)
     9b4:	fbf9                	bnez	a5,98a <vprintf+0x184>
     9b6:	a069                	j	a40 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     9b8:	fdc42783          	lw	a5,-36(s0)
     9bc:	0007871b          	sext.w	a4,a5
     9c0:	06300793          	li	a5,99
     9c4:	02f71463          	bne	a4,a5,9ec <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     9c8:	fb843783          	ld	a5,-72(s0)
     9cc:	00878713          	addi	a4,a5,8
     9d0:	fae43c23          	sd	a4,-72(s0)
     9d4:	439c                	lw	a5,0(a5)
     9d6:	0ff7f713          	andi	a4,a5,255
     9da:	fcc42783          	lw	a5,-52(s0)
     9de:	85ba                	mv	a1,a4
     9e0:	853e                	mv	a0,a5
     9e2:	00000097          	auipc	ra,0x0
     9e6:	c54080e7          	jalr	-940(ra) # 636 <putc>
     9ea:	a899                	j	a40 <vprintf+0x23a>
      } else if(c == '%'){
     9ec:	fdc42783          	lw	a5,-36(s0)
     9f0:	0007871b          	sext.w	a4,a5
     9f4:	02500793          	li	a5,37
     9f8:	00f71f63          	bne	a4,a5,a16 <vprintf+0x210>
        putc(fd, c);
     9fc:	fdc42783          	lw	a5,-36(s0)
     a00:	0ff7f713          	andi	a4,a5,255
     a04:	fcc42783          	lw	a5,-52(s0)
     a08:	85ba                	mv	a1,a4
     a0a:	853e                	mv	a0,a5
     a0c:	00000097          	auipc	ra,0x0
     a10:	c2a080e7          	jalr	-982(ra) # 636 <putc>
     a14:	a035                	j	a40 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     a16:	fcc42783          	lw	a5,-52(s0)
     a1a:	02500593          	li	a1,37
     a1e:	853e                	mv	a0,a5
     a20:	00000097          	auipc	ra,0x0
     a24:	c16080e7          	jalr	-1002(ra) # 636 <putc>
        putc(fd, c);
     a28:	fdc42783          	lw	a5,-36(s0)
     a2c:	0ff7f713          	andi	a4,a5,255
     a30:	fcc42783          	lw	a5,-52(s0)
     a34:	85ba                	mv	a1,a4
     a36:	853e                	mv	a0,a5
     a38:	00000097          	auipc	ra,0x0
     a3c:	bfe080e7          	jalr	-1026(ra) # 636 <putc>
      }
      state = 0;
     a40:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a44:	fe442783          	lw	a5,-28(s0)
     a48:	2785                	addiw	a5,a5,1
     a4a:	fef42223          	sw	a5,-28(s0)
     a4e:	fe442783          	lw	a5,-28(s0)
     a52:	fc043703          	ld	a4,-64(s0)
     a56:	97ba                	add	a5,a5,a4
     a58:	0007c783          	lbu	a5,0(a5)
     a5c:	dc0795e3          	bnez	a5,826 <vprintf+0x20>
    }
  }
}
     a60:	0001                	nop
     a62:	0001                	nop
     a64:	60a6                	ld	ra,72(sp)
     a66:	6406                	ld	s0,64(sp)
     a68:	6161                	addi	sp,sp,80
     a6a:	8082                	ret

0000000000000a6c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a6c:	7159                	addi	sp,sp,-112
     a6e:	fc06                	sd	ra,56(sp)
     a70:	f822                	sd	s0,48(sp)
     a72:	0080                	addi	s0,sp,64
     a74:	fcb43823          	sd	a1,-48(s0)
     a78:	e010                	sd	a2,0(s0)
     a7a:	e414                	sd	a3,8(s0)
     a7c:	e818                	sd	a4,16(s0)
     a7e:	ec1c                	sd	a5,24(s0)
     a80:	03043023          	sd	a6,32(s0)
     a84:	03143423          	sd	a7,40(s0)
     a88:	87aa                	mv	a5,a0
     a8a:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a8e:	03040793          	addi	a5,s0,48
     a92:	fcf43423          	sd	a5,-56(s0)
     a96:	fc843783          	ld	a5,-56(s0)
     a9a:	fd078793          	addi	a5,a5,-48
     a9e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     aa2:	fe843703          	ld	a4,-24(s0)
     aa6:	fdc42783          	lw	a5,-36(s0)
     aaa:	863a                	mv	a2,a4
     aac:	fd043583          	ld	a1,-48(s0)
     ab0:	853e                	mv	a0,a5
     ab2:	00000097          	auipc	ra,0x0
     ab6:	d54080e7          	jalr	-684(ra) # 806 <vprintf>
}
     aba:	0001                	nop
     abc:	70e2                	ld	ra,56(sp)
     abe:	7442                	ld	s0,48(sp)
     ac0:	6165                	addi	sp,sp,112
     ac2:	8082                	ret

0000000000000ac4 <printf>:

void
printf(const char *fmt, ...)
{
     ac4:	7159                	addi	sp,sp,-112
     ac6:	f406                	sd	ra,40(sp)
     ac8:	f022                	sd	s0,32(sp)
     aca:	1800                	addi	s0,sp,48
     acc:	fca43c23          	sd	a0,-40(s0)
     ad0:	e40c                	sd	a1,8(s0)
     ad2:	e810                	sd	a2,16(s0)
     ad4:	ec14                	sd	a3,24(s0)
     ad6:	f018                	sd	a4,32(s0)
     ad8:	f41c                	sd	a5,40(s0)
     ada:	03043823          	sd	a6,48(s0)
     ade:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     ae2:	04040793          	addi	a5,s0,64
     ae6:	fcf43823          	sd	a5,-48(s0)
     aea:	fd043783          	ld	a5,-48(s0)
     aee:	fc878793          	addi	a5,a5,-56
     af2:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     af6:	fe843783          	ld	a5,-24(s0)
     afa:	863e                	mv	a2,a5
     afc:	fd843583          	ld	a1,-40(s0)
     b00:	4505                	li	a0,1
     b02:	00000097          	auipc	ra,0x0
     b06:	d04080e7          	jalr	-764(ra) # 806 <vprintf>
}
     b0a:	0001                	nop
     b0c:	70a2                	ld	ra,40(sp)
     b0e:	7402                	ld	s0,32(sp)
     b10:	6165                	addi	sp,sp,112
     b12:	8082                	ret

0000000000000b14 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     b14:	7179                	addi	sp,sp,-48
     b16:	f422                	sd	s0,40(sp)
     b18:	1800                	addi	s0,sp,48
     b1a:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     b1e:	fd843783          	ld	a5,-40(s0)
     b22:	17c1                	addi	a5,a5,-16
     b24:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b28:	00002797          	auipc	a5,0x2
     b2c:	a4078793          	addi	a5,a5,-1472 # 2568 <freep>
     b30:	639c                	ld	a5,0(a5)
     b32:	fef43423          	sd	a5,-24(s0)
     b36:	a815                	j	b6a <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b38:	fe843783          	ld	a5,-24(s0)
     b3c:	639c                	ld	a5,0(a5)
     b3e:	fe843703          	ld	a4,-24(s0)
     b42:	00f76f63          	bltu	a4,a5,b60 <free+0x4c>
     b46:	fe043703          	ld	a4,-32(s0)
     b4a:	fe843783          	ld	a5,-24(s0)
     b4e:	02e7eb63          	bltu	a5,a4,b84 <free+0x70>
     b52:	fe843783          	ld	a5,-24(s0)
     b56:	639c                	ld	a5,0(a5)
     b58:	fe043703          	ld	a4,-32(s0)
     b5c:	02f76463          	bltu	a4,a5,b84 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b60:	fe843783          	ld	a5,-24(s0)
     b64:	639c                	ld	a5,0(a5)
     b66:	fef43423          	sd	a5,-24(s0)
     b6a:	fe043703          	ld	a4,-32(s0)
     b6e:	fe843783          	ld	a5,-24(s0)
     b72:	fce7f3e3          	bgeu	a5,a4,b38 <free+0x24>
     b76:	fe843783          	ld	a5,-24(s0)
     b7a:	639c                	ld	a5,0(a5)
     b7c:	fe043703          	ld	a4,-32(s0)
     b80:	faf77ce3          	bgeu	a4,a5,b38 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b84:	fe043783          	ld	a5,-32(s0)
     b88:	479c                	lw	a5,8(a5)
     b8a:	1782                	slli	a5,a5,0x20
     b8c:	9381                	srli	a5,a5,0x20
     b8e:	0792                	slli	a5,a5,0x4
     b90:	fe043703          	ld	a4,-32(s0)
     b94:	973e                	add	a4,a4,a5
     b96:	fe843783          	ld	a5,-24(s0)
     b9a:	639c                	ld	a5,0(a5)
     b9c:	02f71763          	bne	a4,a5,bca <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     ba0:	fe043783          	ld	a5,-32(s0)
     ba4:	4798                	lw	a4,8(a5)
     ba6:	fe843783          	ld	a5,-24(s0)
     baa:	639c                	ld	a5,0(a5)
     bac:	479c                	lw	a5,8(a5)
     bae:	9fb9                	addw	a5,a5,a4
     bb0:	0007871b          	sext.w	a4,a5
     bb4:	fe043783          	ld	a5,-32(s0)
     bb8:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     bba:	fe843783          	ld	a5,-24(s0)
     bbe:	639c                	ld	a5,0(a5)
     bc0:	6398                	ld	a4,0(a5)
     bc2:	fe043783          	ld	a5,-32(s0)
     bc6:	e398                	sd	a4,0(a5)
     bc8:	a039                	j	bd6 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     bca:	fe843783          	ld	a5,-24(s0)
     bce:	6398                	ld	a4,0(a5)
     bd0:	fe043783          	ld	a5,-32(s0)
     bd4:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     bd6:	fe843783          	ld	a5,-24(s0)
     bda:	479c                	lw	a5,8(a5)
     bdc:	1782                	slli	a5,a5,0x20
     bde:	9381                	srli	a5,a5,0x20
     be0:	0792                	slli	a5,a5,0x4
     be2:	fe843703          	ld	a4,-24(s0)
     be6:	97ba                	add	a5,a5,a4
     be8:	fe043703          	ld	a4,-32(s0)
     bec:	02f71563          	bne	a4,a5,c16 <free+0x102>
    p->s.size += bp->s.size;
     bf0:	fe843783          	ld	a5,-24(s0)
     bf4:	4798                	lw	a4,8(a5)
     bf6:	fe043783          	ld	a5,-32(s0)
     bfa:	479c                	lw	a5,8(a5)
     bfc:	9fb9                	addw	a5,a5,a4
     bfe:	0007871b          	sext.w	a4,a5
     c02:	fe843783          	ld	a5,-24(s0)
     c06:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     c08:	fe043783          	ld	a5,-32(s0)
     c0c:	6398                	ld	a4,0(a5)
     c0e:	fe843783          	ld	a5,-24(s0)
     c12:	e398                	sd	a4,0(a5)
     c14:	a031                	j	c20 <free+0x10c>
  } else
    p->s.ptr = bp;
     c16:	fe843783          	ld	a5,-24(s0)
     c1a:	fe043703          	ld	a4,-32(s0)
     c1e:	e398                	sd	a4,0(a5)
  freep = p;
     c20:	00002797          	auipc	a5,0x2
     c24:	94878793          	addi	a5,a5,-1720 # 2568 <freep>
     c28:	fe843703          	ld	a4,-24(s0)
     c2c:	e398                	sd	a4,0(a5)
}
     c2e:	0001                	nop
     c30:	7422                	ld	s0,40(sp)
     c32:	6145                	addi	sp,sp,48
     c34:	8082                	ret

0000000000000c36 <morecore>:

static Header*
morecore(uint nu)
{
     c36:	7179                	addi	sp,sp,-48
     c38:	f406                	sd	ra,40(sp)
     c3a:	f022                	sd	s0,32(sp)
     c3c:	1800                	addi	s0,sp,48
     c3e:	87aa                	mv	a5,a0
     c40:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c44:	fdc42783          	lw	a5,-36(s0)
     c48:	0007871b          	sext.w	a4,a5
     c4c:	6785                	lui	a5,0x1
     c4e:	00f77563          	bgeu	a4,a5,c58 <morecore+0x22>
    nu = 4096;
     c52:	6785                	lui	a5,0x1
     c54:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c58:	fdc42783          	lw	a5,-36(s0)
     c5c:	0047979b          	slliw	a5,a5,0x4
     c60:	2781                	sext.w	a5,a5
     c62:	2781                	sext.w	a5,a5
     c64:	853e                	mv	a0,a5
     c66:	00000097          	auipc	ra,0x0
     c6a:	9a0080e7          	jalr	-1632(ra) # 606 <sbrk>
     c6e:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c72:	fe843703          	ld	a4,-24(s0)
     c76:	57fd                	li	a5,-1
     c78:	00f71463          	bne	a4,a5,c80 <morecore+0x4a>
    return 0;
     c7c:	4781                	li	a5,0
     c7e:	a03d                	j	cac <morecore+0x76>
  hp = (Header*)p;
     c80:	fe843783          	ld	a5,-24(s0)
     c84:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c88:	fe043783          	ld	a5,-32(s0)
     c8c:	fdc42703          	lw	a4,-36(s0)
     c90:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c92:	fe043783          	ld	a5,-32(s0)
     c96:	07c1                	addi	a5,a5,16
     c98:	853e                	mv	a0,a5
     c9a:	00000097          	auipc	ra,0x0
     c9e:	e7a080e7          	jalr	-390(ra) # b14 <free>
  return freep;
     ca2:	00002797          	auipc	a5,0x2
     ca6:	8c678793          	addi	a5,a5,-1850 # 2568 <freep>
     caa:	639c                	ld	a5,0(a5)
}
     cac:	853e                	mv	a0,a5
     cae:	70a2                	ld	ra,40(sp)
     cb0:	7402                	ld	s0,32(sp)
     cb2:	6145                	addi	sp,sp,48
     cb4:	8082                	ret

0000000000000cb6 <malloc>:

void*
malloc(uint nbytes)
{
     cb6:	7139                	addi	sp,sp,-64
     cb8:	fc06                	sd	ra,56(sp)
     cba:	f822                	sd	s0,48(sp)
     cbc:	0080                	addi	s0,sp,64
     cbe:	87aa                	mv	a5,a0
     cc0:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     cc4:	fcc46783          	lwu	a5,-52(s0)
     cc8:	07bd                	addi	a5,a5,15
     cca:	8391                	srli	a5,a5,0x4
     ccc:	2781                	sext.w	a5,a5
     cce:	2785                	addiw	a5,a5,1
     cd0:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     cd4:	00002797          	auipc	a5,0x2
     cd8:	89478793          	addi	a5,a5,-1900 # 2568 <freep>
     cdc:	639c                	ld	a5,0(a5)
     cde:	fef43023          	sd	a5,-32(s0)
     ce2:	fe043783          	ld	a5,-32(s0)
     ce6:	ef95                	bnez	a5,d22 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     ce8:	00002797          	auipc	a5,0x2
     cec:	87078793          	addi	a5,a5,-1936 # 2558 <base>
     cf0:	fef43023          	sd	a5,-32(s0)
     cf4:	00002797          	auipc	a5,0x2
     cf8:	87478793          	addi	a5,a5,-1932 # 2568 <freep>
     cfc:	fe043703          	ld	a4,-32(s0)
     d00:	e398                	sd	a4,0(a5)
     d02:	00002797          	auipc	a5,0x2
     d06:	86678793          	addi	a5,a5,-1946 # 2568 <freep>
     d0a:	6398                	ld	a4,0(a5)
     d0c:	00002797          	auipc	a5,0x2
     d10:	84c78793          	addi	a5,a5,-1972 # 2558 <base>
     d14:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     d16:	00002797          	auipc	a5,0x2
     d1a:	84278793          	addi	a5,a5,-1982 # 2558 <base>
     d1e:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d22:	fe043783          	ld	a5,-32(s0)
     d26:	639c                	ld	a5,0(a5)
     d28:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d2c:	fe843783          	ld	a5,-24(s0)
     d30:	4798                	lw	a4,8(a5)
     d32:	fdc42783          	lw	a5,-36(s0)
     d36:	2781                	sext.w	a5,a5
     d38:	06f76863          	bltu	a4,a5,da8 <malloc+0xf2>
      if(p->s.size == nunits)
     d3c:	fe843783          	ld	a5,-24(s0)
     d40:	4798                	lw	a4,8(a5)
     d42:	fdc42783          	lw	a5,-36(s0)
     d46:	2781                	sext.w	a5,a5
     d48:	00e79963          	bne	a5,a4,d5a <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d4c:	fe843783          	ld	a5,-24(s0)
     d50:	6398                	ld	a4,0(a5)
     d52:	fe043783          	ld	a5,-32(s0)
     d56:	e398                	sd	a4,0(a5)
     d58:	a82d                	j	d92 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d5a:	fe843783          	ld	a5,-24(s0)
     d5e:	4798                	lw	a4,8(a5)
     d60:	fdc42783          	lw	a5,-36(s0)
     d64:	40f707bb          	subw	a5,a4,a5
     d68:	0007871b          	sext.w	a4,a5
     d6c:	fe843783          	ld	a5,-24(s0)
     d70:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d72:	fe843783          	ld	a5,-24(s0)
     d76:	479c                	lw	a5,8(a5)
     d78:	1782                	slli	a5,a5,0x20
     d7a:	9381                	srli	a5,a5,0x20
     d7c:	0792                	slli	a5,a5,0x4
     d7e:	fe843703          	ld	a4,-24(s0)
     d82:	97ba                	add	a5,a5,a4
     d84:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d88:	fe843783          	ld	a5,-24(s0)
     d8c:	fdc42703          	lw	a4,-36(s0)
     d90:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d92:	00001797          	auipc	a5,0x1
     d96:	7d678793          	addi	a5,a5,2006 # 2568 <freep>
     d9a:	fe043703          	ld	a4,-32(s0)
     d9e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     da0:	fe843783          	ld	a5,-24(s0)
     da4:	07c1                	addi	a5,a5,16
     da6:	a091                	j	dea <malloc+0x134>
    }
    if(p == freep)
     da8:	00001797          	auipc	a5,0x1
     dac:	7c078793          	addi	a5,a5,1984 # 2568 <freep>
     db0:	639c                	ld	a5,0(a5)
     db2:	fe843703          	ld	a4,-24(s0)
     db6:	02f71063          	bne	a4,a5,dd6 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     dba:	fdc42783          	lw	a5,-36(s0)
     dbe:	853e                	mv	a0,a5
     dc0:	00000097          	auipc	ra,0x0
     dc4:	e76080e7          	jalr	-394(ra) # c36 <morecore>
     dc8:	fea43423          	sd	a0,-24(s0)
     dcc:	fe843783          	ld	a5,-24(s0)
     dd0:	e399                	bnez	a5,dd6 <malloc+0x120>
        return 0;
     dd2:	4781                	li	a5,0
     dd4:	a819                	j	dea <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     dd6:	fe843783          	ld	a5,-24(s0)
     dda:	fef43023          	sd	a5,-32(s0)
     dde:	fe843783          	ld	a5,-24(s0)
     de2:	639c                	ld	a5,0(a5)
     de4:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     de8:	b791                	j	d2c <malloc+0x76>
  }
}
     dea:	853e                	mv	a0,a5
     dec:	70e2                	ld	ra,56(sp)
     dee:	7442                	ld	s0,48(sp)
     df0:	6121                	addi	sp,sp,64
     df2:	8082                	ret

0000000000000df4 <setjmp>:
     df4:	e100                	sd	s0,0(a0)
     df6:	e504                	sd	s1,8(a0)
     df8:	01253823          	sd	s2,16(a0)
     dfc:	01353c23          	sd	s3,24(a0)
     e00:	03453023          	sd	s4,32(a0)
     e04:	03553423          	sd	s5,40(a0)
     e08:	03653823          	sd	s6,48(a0)
     e0c:	03753c23          	sd	s7,56(a0)
     e10:	05853023          	sd	s8,64(a0)
     e14:	05953423          	sd	s9,72(a0)
     e18:	05a53823          	sd	s10,80(a0)
     e1c:	05b53c23          	sd	s11,88(a0)
     e20:	06153023          	sd	ra,96(a0)
     e24:	06253423          	sd	sp,104(a0)
     e28:	4501                	li	a0,0
     e2a:	8082                	ret

0000000000000e2c <longjmp>:
     e2c:	6100                	ld	s0,0(a0)
     e2e:	6504                	ld	s1,8(a0)
     e30:	01053903          	ld	s2,16(a0)
     e34:	01853983          	ld	s3,24(a0)
     e38:	02053a03          	ld	s4,32(a0)
     e3c:	02853a83          	ld	s5,40(a0)
     e40:	03053b03          	ld	s6,48(a0)
     e44:	03853b83          	ld	s7,56(a0)
     e48:	04053c03          	ld	s8,64(a0)
     e4c:	04853c83          	ld	s9,72(a0)
     e50:	05053d03          	ld	s10,80(a0)
     e54:	05853d83          	ld	s11,88(a0)
     e58:	06053083          	ld	ra,96(a0)
     e5c:	06853103          	ld	sp,104(a0)
     e60:	c199                	beqz	a1,e66 <longjmp_1>
     e62:	852e                	mv	a0,a1
     e64:	8082                	ret

0000000000000e66 <longjmp_1>:
     e66:	4505                	li	a0,1
     e68:	8082                	ret

0000000000000e6a <__list_add>:
 * the prev/next entries already!
 */
static inline void __list_add(struct list_head *new_entry,
                              struct list_head *prev,
                              struct list_head *next)
{
     e6a:	7179                	addi	sp,sp,-48
     e6c:	f422                	sd	s0,40(sp)
     e6e:	1800                	addi	s0,sp,48
     e70:	fea43423          	sd	a0,-24(s0)
     e74:	feb43023          	sd	a1,-32(s0)
     e78:	fcc43c23          	sd	a2,-40(s0)
    next->prev = new_entry;
     e7c:	fd843783          	ld	a5,-40(s0)
     e80:	fe843703          	ld	a4,-24(s0)
     e84:	e798                	sd	a4,8(a5)
    new_entry->next = next;
     e86:	fe843783          	ld	a5,-24(s0)
     e8a:	fd843703          	ld	a4,-40(s0)
     e8e:	e398                	sd	a4,0(a5)
    new_entry->prev = prev;
     e90:	fe843783          	ld	a5,-24(s0)
     e94:	fe043703          	ld	a4,-32(s0)
     e98:	e798                	sd	a4,8(a5)
    prev->next = new_entry;
     e9a:	fe043783          	ld	a5,-32(s0)
     e9e:	fe843703          	ld	a4,-24(s0)
     ea2:	e398                	sd	a4,0(a5)
}
     ea4:	0001                	nop
     ea6:	7422                	ld	s0,40(sp)
     ea8:	6145                	addi	sp,sp,48
     eaa:	8082                	ret

0000000000000eac <list_add_tail>:
 *
 * Insert a new entry before the specified head.
 * This is useful for implementing queues.
 */
static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
{
     eac:	1101                	addi	sp,sp,-32
     eae:	ec06                	sd	ra,24(sp)
     eb0:	e822                	sd	s0,16(sp)
     eb2:	1000                	addi	s0,sp,32
     eb4:	fea43423          	sd	a0,-24(s0)
     eb8:	feb43023          	sd	a1,-32(s0)
    __list_add(new_entry, head->prev, head);
     ebc:	fe043783          	ld	a5,-32(s0)
     ec0:	679c                	ld	a5,8(a5)
     ec2:	fe043603          	ld	a2,-32(s0)
     ec6:	85be                	mv	a1,a5
     ec8:	fe843503          	ld	a0,-24(s0)
     ecc:	00000097          	auipc	ra,0x0
     ed0:	f9e080e7          	jalr	-98(ra) # e6a <__list_add>
}
     ed4:	0001                	nop
     ed6:	60e2                	ld	ra,24(sp)
     ed8:	6442                	ld	s0,16(sp)
     eda:	6105                	addi	sp,sp,32
     edc:	8082                	ret

0000000000000ede <__list_del>:
 *
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head *prev, struct list_head *next)
{
     ede:	1101                	addi	sp,sp,-32
     ee0:	ec22                	sd	s0,24(sp)
     ee2:	1000                	addi	s0,sp,32
     ee4:	fea43423          	sd	a0,-24(s0)
     ee8:	feb43023          	sd	a1,-32(s0)
    next->prev = prev;
     eec:	fe043783          	ld	a5,-32(s0)
     ef0:	fe843703          	ld	a4,-24(s0)
     ef4:	e798                	sd	a4,8(a5)
    prev->next = next;
     ef6:	fe843783          	ld	a5,-24(s0)
     efa:	fe043703          	ld	a4,-32(s0)
     efe:	e398                	sd	a4,0(a5)
}
     f00:	0001                	nop
     f02:	6462                	ld	s0,24(sp)
     f04:	6105                	addi	sp,sp,32
     f06:	8082                	ret

0000000000000f08 <list_del>:
 * @entry: the element to delete from the list.
 * Note: list_empty on entry does not return true after this, the entry is
 * in an undefined state.
 */
static inline void list_del(struct list_head *entry)
{
     f08:	1101                	addi	sp,sp,-32
     f0a:	ec06                	sd	ra,24(sp)
     f0c:	e822                	sd	s0,16(sp)
     f0e:	1000                	addi	s0,sp,32
     f10:	fea43423          	sd	a0,-24(s0)
    __list_del(entry->prev, entry->next);
     f14:	fe843783          	ld	a5,-24(s0)
     f18:	6798                	ld	a4,8(a5)
     f1a:	fe843783          	ld	a5,-24(s0)
     f1e:	639c                	ld	a5,0(a5)
     f20:	85be                	mv	a1,a5
     f22:	853a                	mv	a0,a4
     f24:	00000097          	auipc	ra,0x0
     f28:	fba080e7          	jalr	-70(ra) # ede <__list_del>
    entry->next = LIST_POISON1;
     f2c:	fe843783          	ld	a5,-24(s0)
     f30:	00100737          	lui	a4,0x100
     f34:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd3f0>
     f38:	e398                	sd	a4,0(a5)
    entry->prev = LIST_POISON2;
     f3a:	fe843783          	ld	a5,-24(s0)
     f3e:	00200737          	lui	a4,0x200
     f42:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd4f0>
     f46:	e798                	sd	a4,8(a5)
}
     f48:	0001                	nop
     f4a:	60e2                	ld	ra,24(sp)
     f4c:	6442                	ld	s0,16(sp)
     f4e:	6105                	addi	sp,sp,32
     f50:	8082                	ret

0000000000000f52 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     f52:	1101                	addi	sp,sp,-32
     f54:	ec22                	sd	s0,24(sp)
     f56:	1000                	addi	s0,sp,32
     f58:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     f5c:	fe843783          	ld	a5,-24(s0)
     f60:	639c                	ld	a5,0(a5)
     f62:	fe843703          	ld	a4,-24(s0)
     f66:	40f707b3          	sub	a5,a4,a5
     f6a:	0017b793          	seqz	a5,a5
     f6e:	0ff7f793          	andi	a5,a5,255
     f72:	2781                	sext.w	a5,a5
}
     f74:	853e                	mv	a0,a5
     f76:	6462                	ld	s0,24(sp)
     f78:	6105                	addi	sp,sp,32
     f7a:	8082                	ret

0000000000000f7c <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     f7c:	715d                	addi	sp,sp,-80
     f7e:	e486                	sd	ra,72(sp)
     f80:	e0a2                	sd	s0,64(sp)
     f82:	0880                	addi	s0,sp,80
     f84:	fca43423          	sd	a0,-56(s0)
     f88:	fcb43023          	sd	a1,-64(s0)
     f8c:	85b2                	mv	a1,a2
     f8e:	8636                	mv	a2,a3
     f90:	86ba                	mv	a3,a4
     f92:	873e                	mv	a4,a5
     f94:	87ae                	mv	a5,a1
     f96:	faf42e23          	sw	a5,-68(s0)
     f9a:	87b2                	mv	a5,a2
     f9c:	faf42c23          	sw	a5,-72(s0)
     fa0:	87b6                	mv	a5,a3
     fa2:	faf42a23          	sw	a5,-76(s0)
     fa6:	87ba                	mv	a5,a4
     fa8:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     fac:	06000513          	li	a0,96
     fb0:	00000097          	auipc	ra,0x0
     fb4:	d06080e7          	jalr	-762(ra) # cb6 <malloc>
     fb8:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     fbc:	6505                	lui	a0,0x1
     fbe:	00000097          	auipc	ra,0x0
     fc2:	cf8080e7          	jalr	-776(ra) # cb6 <malloc>
     fc6:	87aa                	mv	a5,a0
     fc8:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     fcc:	fe043703          	ld	a4,-32(s0)
     fd0:	6785                	lui	a5,0x1
     fd2:	17c1                	addi	a5,a5,-16
     fd4:	97ba                	add	a5,a5,a4
     fd6:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     fda:	fe843783          	ld	a5,-24(s0)
     fde:	fc843703          	ld	a4,-56(s0)
     fe2:	e398                	sd	a4,0(a5)
    t->arg = arg;
     fe4:	fe843783          	ld	a5,-24(s0)
     fe8:	fc043703          	ld	a4,-64(s0)
     fec:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     fee:	00001797          	auipc	a5,0x1
     ff2:	55e78793          	addi	a5,a5,1374 # 254c <_id.1229>
     ff6:	439c                	lw	a5,0(a5)
     ff8:	0017871b          	addiw	a4,a5,1
     ffc:	0007069b          	sext.w	a3,a4
    1000:	00001717          	auipc	a4,0x1
    1004:	54c70713          	addi	a4,a4,1356 # 254c <_id.1229>
    1008:	c314                	sw	a3,0(a4)
    100a:	fe843703          	ld	a4,-24(s0)
    100e:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    1010:	fe843783          	ld	a5,-24(s0)
    1014:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    1018:	fe043703          	ld	a4,-32(s0)
    101c:	fe843783          	ld	a5,-24(s0)
    1020:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    1022:	fd843703          	ld	a4,-40(s0)
    1026:	fe843783          	ld	a5,-24(s0)
    102a:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    102c:	fe843783          	ld	a5,-24(s0)
    1030:	fb842703          	lw	a4,-72(s0)
    1034:	c3f8                	sw	a4,68(a5)
    t->period = period;
    1036:	fe843783          	ld	a5,-24(s0)
    103a:	fb442703          	lw	a4,-76(s0)
    103e:	cbb8                	sw	a4,80(a5)
    t->deadline = period;
    1040:	fe843783          	ld	a5,-24(s0)
    1044:	fb442703          	lw	a4,-76(s0)
    1048:	c7f8                	sw	a4,76(a5)
    t->n = n;
    104a:	fe843783          	ld	a5,-24(s0)
    104e:	fb042703          	lw	a4,-80(s0)
    1052:	cbf8                	sw	a4,84(a5)
    t->is_real_time = is_real_time;
    1054:	fe843783          	ld	a5,-24(s0)
    1058:	fbc42703          	lw	a4,-68(s0)
    105c:	c3b8                	sw	a4,64(a5)
    t->weight = 1;
    105e:	fe843783          	ld	a5,-24(s0)
    1062:	4705                	li	a4,1
    1064:	c7b8                	sw	a4,72(a5)
    t->remaining_time = processing_time;
    1066:	fe843783          	ld	a5,-24(s0)
    106a:	fb842703          	lw	a4,-72(s0)
    106e:	cfb8                	sw	a4,88(a5)
    t->current_deadline = 0;
    1070:	fe843783          	ld	a5,-24(s0)
    1074:	0407ae23          	sw	zero,92(a5)
    return t;
    1078:	fe843783          	ld	a5,-24(s0)
}
    107c:	853e                	mv	a0,a5
    107e:	60a6                	ld	ra,72(sp)
    1080:	6406                	ld	s0,64(sp)
    1082:	6161                	addi	sp,sp,80
    1084:	8082                	ret

0000000000001086 <thread_set_weight>:

void thread_set_weight(struct thread *t, int weight)
{
    1086:	1101                	addi	sp,sp,-32
    1088:	ec22                	sd	s0,24(sp)
    108a:	1000                	addi	s0,sp,32
    108c:	fea43423          	sd	a0,-24(s0)
    1090:	87ae                	mv	a5,a1
    1092:	fef42223          	sw	a5,-28(s0)
    t->weight = weight;
    1096:	fe843783          	ld	a5,-24(s0)
    109a:	fe442703          	lw	a4,-28(s0)
    109e:	c7b8                	sw	a4,72(a5)
}
    10a0:	0001                	nop
    10a2:	6462                	ld	s0,24(sp)
    10a4:	6105                	addi	sp,sp,32
    10a6:	8082                	ret

00000000000010a8 <thread_add_at>:

void thread_add_at(struct thread *t, int arrival_time)
{
    10a8:	7179                	addi	sp,sp,-48
    10aa:	f406                	sd	ra,40(sp)
    10ac:	f022                	sd	s0,32(sp)
    10ae:	1800                	addi	s0,sp,48
    10b0:	fca43c23          	sd	a0,-40(s0)
    10b4:	87ae                	mv	a5,a1
    10b6:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    10ba:	02000513          	li	a0,32
    10be:	00000097          	auipc	ra,0x0
    10c2:	bf8080e7          	jalr	-1032(ra) # cb6 <malloc>
    10c6:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    10ca:	fe843783          	ld	a5,-24(s0)
    10ce:	fd843703          	ld	a4,-40(s0)
    10d2:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    10d4:	fe843783          	ld	a5,-24(s0)
    10d8:	fd442703          	lw	a4,-44(s0)
    10dc:	cf98                	sw	a4,24(a5)
    if (t->is_real_time) {
    10de:	fd843783          	ld	a5,-40(s0)
    10e2:	43bc                	lw	a5,64(a5)
    10e4:	c38d                	beqz	a5,1106 <thread_add_at+0x5e>
        t->current_deadline = arrival_time;
    10e6:	fd843783          	ld	a5,-40(s0)
    10ea:	fd442703          	lw	a4,-44(s0)
    10ee:	cff8                	sw	a4,92(a5)
        t->current_deadline = arrival_time + t->deadline;
    10f0:	fd843783          	ld	a5,-40(s0)
    10f4:	47fc                	lw	a5,76(a5)
    10f6:	fd442703          	lw	a4,-44(s0)
    10fa:	9fb9                	addw	a5,a5,a4
    10fc:	0007871b          	sext.w	a4,a5
    1100:	fd843783          	ld	a5,-40(s0)
    1104:	cff8                	sw	a4,92(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1106:	fe843783          	ld	a5,-24(s0)
    110a:	07a1                	addi	a5,a5,8
    110c:	00001597          	auipc	a1,0x1
    1110:	42c58593          	addi	a1,a1,1068 # 2538 <release_queue>
    1114:	853e                	mv	a0,a5
    1116:	00000097          	auipc	ra,0x0
    111a:	d96080e7          	jalr	-618(ra) # eac <list_add_tail>
}
    111e:	0001                	nop
    1120:	70a2                	ld	ra,40(sp)
    1122:	7402                	ld	s0,32(sp)
    1124:	6145                	addi	sp,sp,48
    1126:	8082                	ret

0000000000001128 <__release>:

void __release()
{
    1128:	7139                	addi	sp,sp,-64
    112a:	fc06                	sd	ra,56(sp)
    112c:	f822                	sd	s0,48(sp)
    112e:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1130:	00001797          	auipc	a5,0x1
    1134:	40878793          	addi	a5,a5,1032 # 2538 <release_queue>
    1138:	639c                	ld	a5,0(a5)
    113a:	fcf43c23          	sd	a5,-40(s0)
    113e:	fd843783          	ld	a5,-40(s0)
    1142:	17e1                	addi	a5,a5,-8
    1144:	fef43423          	sd	a5,-24(s0)
    1148:	fe843783          	ld	a5,-24(s0)
    114c:	679c                	ld	a5,8(a5)
    114e:	fcf43823          	sd	a5,-48(s0)
    1152:	fd043783          	ld	a5,-48(s0)
    1156:	17e1                	addi	a5,a5,-8
    1158:	fef43023          	sd	a5,-32(s0)
    115c:	a851                	j	11f0 <__release+0xc8>
        if (threading_system_time >= cur->release_time) {
    115e:	fe843783          	ld	a5,-24(s0)
    1162:	4f98                	lw	a4,24(a5)
    1164:	00001797          	auipc	a5,0x1
    1168:	41478793          	addi	a5,a5,1044 # 2578 <threading_system_time>
    116c:	439c                	lw	a5,0(a5)
    116e:	06e7c363          	blt	a5,a4,11d4 <__release+0xac>
            cur->thrd->remaining_time = cur->thrd->processing_time;
    1172:	fe843783          	ld	a5,-24(s0)
    1176:	6398                	ld	a4,0(a5)
    1178:	fe843783          	ld	a5,-24(s0)
    117c:	639c                	ld	a5,0(a5)
    117e:	4378                	lw	a4,68(a4)
    1180:	cfb8                	sw	a4,88(a5)
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    1182:	fe843783          	ld	a5,-24(s0)
    1186:	4f94                	lw	a3,24(a5)
    1188:	fe843783          	ld	a5,-24(s0)
    118c:	639c                	ld	a5,0(a5)
    118e:	47f8                	lw	a4,76(a5)
    1190:	fe843783          	ld	a5,-24(s0)
    1194:	639c                	ld	a5,0(a5)
    1196:	9f35                	addw	a4,a4,a3
    1198:	2701                	sext.w	a4,a4
    119a:	cff8                	sw	a4,92(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    119c:	fe843783          	ld	a5,-24(s0)
    11a0:	639c                	ld	a5,0(a5)
    11a2:	02878793          	addi	a5,a5,40
    11a6:	00001597          	auipc	a1,0x1
    11aa:	38258593          	addi	a1,a1,898 # 2528 <run_queue>
    11ae:	853e                	mv	a0,a5
    11b0:	00000097          	auipc	ra,0x0
    11b4:	cfc080e7          	jalr	-772(ra) # eac <list_add_tail>
            list_del(&cur->thread_list);
    11b8:	fe843783          	ld	a5,-24(s0)
    11bc:	07a1                	addi	a5,a5,8
    11be:	853e                	mv	a0,a5
    11c0:	00000097          	auipc	ra,0x0
    11c4:	d48080e7          	jalr	-696(ra) # f08 <list_del>
            free(cur);
    11c8:	fe843503          	ld	a0,-24(s0)
    11cc:	00000097          	auipc	ra,0x0
    11d0:	948080e7          	jalr	-1720(ra) # b14 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    11d4:	fe043783          	ld	a5,-32(s0)
    11d8:	fef43423          	sd	a5,-24(s0)
    11dc:	fe043783          	ld	a5,-32(s0)
    11e0:	679c                	ld	a5,8(a5)
    11e2:	fcf43423          	sd	a5,-56(s0)
    11e6:	fc843783          	ld	a5,-56(s0)
    11ea:	17e1                	addi	a5,a5,-8
    11ec:	fef43023          	sd	a5,-32(s0)
    11f0:	fe843783          	ld	a5,-24(s0)
    11f4:	00878713          	addi	a4,a5,8
    11f8:	00001797          	auipc	a5,0x1
    11fc:	34078793          	addi	a5,a5,832 # 2538 <release_queue>
    1200:	f4f71fe3          	bne	a4,a5,115e <__release+0x36>
        }
    }
}
    1204:	0001                	nop
    1206:	0001                	nop
    1208:	70e2                	ld	ra,56(sp)
    120a:	7442                	ld	s0,48(sp)
    120c:	6121                	addi	sp,sp,64
    120e:	8082                	ret

0000000000001210 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    1210:	1101                	addi	sp,sp,-32
    1212:	ec06                	sd	ra,24(sp)
    1214:	e822                	sd	s0,16(sp)
    1216:	1000                	addi	s0,sp,32
    1218:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    121c:	fe843783          	ld	a5,-24(s0)
    1220:	7b98                	ld	a4,48(a5)
    1222:	00001797          	auipc	a5,0x1
    1226:	34e78793          	addi	a5,a5,846 # 2570 <current>
    122a:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    122c:	fe843783          	ld	a5,-24(s0)
    1230:	02878793          	addi	a5,a5,40
    1234:	853e                	mv	a0,a5
    1236:	00000097          	auipc	ra,0x0
    123a:	cd2080e7          	jalr	-814(ra) # f08 <list_del>

    free(to_remove->stack);
    123e:	fe843783          	ld	a5,-24(s0)
    1242:	6b9c                	ld	a5,16(a5)
    1244:	853e                	mv	a0,a5
    1246:	00000097          	auipc	ra,0x0
    124a:	8ce080e7          	jalr	-1842(ra) # b14 <free>
    free(to_remove);
    124e:	fe843503          	ld	a0,-24(s0)
    1252:	00000097          	auipc	ra,0x0
    1256:	8c2080e7          	jalr	-1854(ra) # b14 <free>

    __schedule();
    125a:	00000097          	auipc	ra,0x0
    125e:	572080e7          	jalr	1394(ra) # 17cc <__schedule>
    __dispatch();
    1262:	00000097          	auipc	ra,0x0
    1266:	3da080e7          	jalr	986(ra) # 163c <__dispatch>
    thrdresume(main_thrd_id);
    126a:	00001797          	auipc	a5,0x1
    126e:	2de78793          	addi	a5,a5,734 # 2548 <main_thrd_id>
    1272:	439c                	lw	a5,0(a5)
    1274:	853e                	mv	a0,a5
    1276:	fffff097          	auipc	ra,0xfffff
    127a:	3b0080e7          	jalr	944(ra) # 626 <thrdresume>
}
    127e:	0001                	nop
    1280:	60e2                	ld	ra,24(sp)
    1282:	6442                	ld	s0,16(sp)
    1284:	6105                	addi	sp,sp,32
    1286:	8082                	ret

0000000000001288 <thread_exit>:

void thread_exit(void)
{
    1288:	7179                	addi	sp,sp,-48
    128a:	f406                	sd	ra,40(sp)
    128c:	f022                	sd	s0,32(sp)
    128e:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1290:	00001797          	auipc	a5,0x1
    1294:	2e078793          	addi	a5,a5,736 # 2570 <current>
    1298:	6398                	ld	a4,0(a5)
    129a:	00001797          	auipc	a5,0x1
    129e:	28e78793          	addi	a5,a5,654 # 2528 <run_queue>
    12a2:	02f71063          	bne	a4,a5,12c2 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    12a6:	00001597          	auipc	a1,0x1
    12aa:	12a58593          	addi	a1,a1,298 # 23d0 <schedule_dm+0x208>
    12ae:	4509                	li	a0,2
    12b0:	fffff097          	auipc	ra,0xfffff
    12b4:	7bc080e7          	jalr	1980(ra) # a6c <fprintf>
        exit(1);
    12b8:	4505                	li	a0,1
    12ba:	fffff097          	auipc	ra,0xfffff
    12be:	2c4080e7          	jalr	708(ra) # 57e <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    12c2:	00001797          	auipc	a5,0x1
    12c6:	2ae78793          	addi	a5,a5,686 # 2570 <current>
    12ca:	639c                	ld	a5,0(a5)
    12cc:	fef43423          	sd	a5,-24(s0)
    12d0:	fe843783          	ld	a5,-24(s0)
    12d4:	fd878793          	addi	a5,a5,-40
    12d8:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    12dc:	fe043783          	ld	a5,-32(s0)
    12e0:	5f9c                	lw	a5,56(a5)
    12e2:	4585                	li	a1,1
    12e4:	853e                	mv	a0,a5
    12e6:	fffff097          	auipc	ra,0xfffff
    12ea:	348080e7          	jalr	840(ra) # 62e <cancelthrdstop>
    12ee:	87aa                	mv	a5,a0
    12f0:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    12f4:	00001797          	auipc	a5,0x1
    12f8:	28478793          	addi	a5,a5,644 # 2578 <threading_system_time>
    12fc:	439c                	lw	a5,0(a5)
    12fe:	fdc42703          	lw	a4,-36(s0)
    1302:	9fb9                	addw	a5,a5,a4
    1304:	0007871b          	sext.w	a4,a5
    1308:	00001797          	auipc	a5,0x1
    130c:	27078793          	addi	a5,a5,624 # 2578 <threading_system_time>
    1310:	c398                	sw	a4,0(a5)

    __release();
    1312:	00000097          	auipc	ra,0x0
    1316:	e16080e7          	jalr	-490(ra) # 1128 <__release>
    __thread_exit(to_remove);
    131a:	fe043503          	ld	a0,-32(s0)
    131e:	00000097          	auipc	ra,0x0
    1322:	ef2080e7          	jalr	-270(ra) # 1210 <__thread_exit>
}
    1326:	0001                	nop
    1328:	70a2                	ld	ra,40(sp)
    132a:	7402                	ld	s0,32(sp)
    132c:	6145                	addi	sp,sp,48
    132e:	8082                	ret

0000000000001330 <__finish_current>:

void __finish_current()
{
    1330:	7179                	addi	sp,sp,-48
    1332:	f406                	sd	ra,40(sp)
    1334:	f022                	sd	s0,32(sp)
    1336:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1338:	00001797          	auipc	a5,0x1
    133c:	23878793          	addi	a5,a5,568 # 2570 <current>
    1340:	639c                	ld	a5,0(a5)
    1342:	fef43423          	sd	a5,-24(s0)
    1346:	fe843783          	ld	a5,-24(s0)
    134a:	fd878793          	addi	a5,a5,-40
    134e:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1352:	fe043783          	ld	a5,-32(s0)
    1356:	4bfc                	lw	a5,84(a5)
    1358:	37fd                	addiw	a5,a5,-1
    135a:	0007871b          	sext.w	a4,a5
    135e:	fe043783          	ld	a5,-32(s0)
    1362:	cbf8                	sw	a4,84(a5)

    printf("thread#%d finish at %d\n",
    1364:	fe043783          	ld	a5,-32(s0)
    1368:	5fd8                	lw	a4,60(a5)
    136a:	00001797          	auipc	a5,0x1
    136e:	20e78793          	addi	a5,a5,526 # 2578 <threading_system_time>
    1372:	4390                	lw	a2,0(a5)
    1374:	fe043783          	ld	a5,-32(s0)
    1378:	4bfc                	lw	a5,84(a5)
    137a:	86be                	mv	a3,a5
    137c:	85ba                	mv	a1,a4
    137e:	00001517          	auipc	a0,0x1
    1382:	08a50513          	addi	a0,a0,138 # 2408 <schedule_dm+0x240>
    1386:	fffff097          	auipc	ra,0xfffff
    138a:	73e080e7          	jalr	1854(ra) # ac4 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    138e:	fe043783          	ld	a5,-32(s0)
    1392:	4bfc                	lw	a5,84(a5)
    1394:	04f05563          	blez	a5,13de <__finish_current+0xae>
        struct list_head *to_remove = current;
    1398:	00001797          	auipc	a5,0x1
    139c:	1d878793          	addi	a5,a5,472 # 2570 <current>
    13a0:	639c                	ld	a5,0(a5)
    13a2:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    13a6:	00001797          	auipc	a5,0x1
    13aa:	1ca78793          	addi	a5,a5,458 # 2570 <current>
    13ae:	639c                	ld	a5,0(a5)
    13b0:	6798                	ld	a4,8(a5)
    13b2:	00001797          	auipc	a5,0x1
    13b6:	1be78793          	addi	a5,a5,446 # 2570 <current>
    13ba:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    13bc:	fd843503          	ld	a0,-40(s0)
    13c0:	00000097          	auipc	ra,0x0
    13c4:	b48080e7          	jalr	-1208(ra) # f08 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    13c8:	fe043783          	ld	a5,-32(s0)
    13cc:	4ffc                	lw	a5,92(a5)
    13ce:	85be                	mv	a1,a5
    13d0:	fe043503          	ld	a0,-32(s0)
    13d4:	00000097          	auipc	ra,0x0
    13d8:	cd4080e7          	jalr	-812(ra) # 10a8 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    13dc:	a039                	j	13ea <__finish_current+0xba>
        __thread_exit(current_thread);
    13de:	fe043503          	ld	a0,-32(s0)
    13e2:	00000097          	auipc	ra,0x0
    13e6:	e2e080e7          	jalr	-466(ra) # 1210 <__thread_exit>
}
    13ea:	0001                	nop
    13ec:	70a2                	ld	ra,40(sp)
    13ee:	7402                	ld	s0,32(sp)
    13f0:	6145                	addi	sp,sp,48
    13f2:	8082                	ret

00000000000013f4 <__rt_finish_current>:
void __rt_finish_current()
{
    13f4:	7179                	addi	sp,sp,-48
    13f6:	f406                	sd	ra,40(sp)
    13f8:	f022                	sd	s0,32(sp)
    13fa:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    13fc:	00001797          	auipc	a5,0x1
    1400:	17478793          	addi	a5,a5,372 # 2570 <current>
    1404:	639c                	ld	a5,0(a5)
    1406:	fef43423          	sd	a5,-24(s0)
    140a:	fe843783          	ld	a5,-24(s0)
    140e:	fd878793          	addi	a5,a5,-40
    1412:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1416:	fe043783          	ld	a5,-32(s0)
    141a:	4bfc                	lw	a5,84(a5)
    141c:	37fd                	addiw	a5,a5,-1
    141e:	0007871b          	sext.w	a4,a5
    1422:	fe043783          	ld	a5,-32(s0)
    1426:	cbf8                	sw	a4,84(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    1428:	fe043783          	ld	a5,-32(s0)
    142c:	5fd8                	lw	a4,60(a5)
    142e:	00001797          	auipc	a5,0x1
    1432:	14a78793          	addi	a5,a5,330 # 2578 <threading_system_time>
    1436:	4390                	lw	a2,0(a5)
    1438:	fe043783          	ld	a5,-32(s0)
    143c:	4bfc                	lw	a5,84(a5)
    143e:	86be                	mv	a3,a5
    1440:	85ba                	mv	a1,a4
    1442:	00001517          	auipc	a0,0x1
    1446:	fde50513          	addi	a0,a0,-34 # 2420 <schedule_dm+0x258>
    144a:	fffff097          	auipc	ra,0xfffff
    144e:	67a080e7          	jalr	1658(ra) # ac4 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1452:	fe043783          	ld	a5,-32(s0)
    1456:	4bfc                	lw	a5,84(a5)
    1458:	04f05563          	blez	a5,14a2 <__rt_finish_current+0xae>
        struct list_head *to_remove = current;
    145c:	00001797          	auipc	a5,0x1
    1460:	11478793          	addi	a5,a5,276 # 2570 <current>
    1464:	639c                	ld	a5,0(a5)
    1466:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    146a:	00001797          	auipc	a5,0x1
    146e:	10678793          	addi	a5,a5,262 # 2570 <current>
    1472:	639c                	ld	a5,0(a5)
    1474:	6798                	ld	a4,8(a5)
    1476:	00001797          	auipc	a5,0x1
    147a:	0fa78793          	addi	a5,a5,250 # 2570 <current>
    147e:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1480:	fd843503          	ld	a0,-40(s0)
    1484:	00000097          	auipc	ra,0x0
    1488:	a84080e7          	jalr	-1404(ra) # f08 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    148c:	fe043783          	ld	a5,-32(s0)
    1490:	4ffc                	lw	a5,92(a5)
    1492:	85be                	mv	a1,a5
    1494:	fe043503          	ld	a0,-32(s0)
    1498:	00000097          	auipc	ra,0x0
    149c:	c10080e7          	jalr	-1008(ra) # 10a8 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    14a0:	a039                	j	14ae <__rt_finish_current+0xba>
        __thread_exit(current_thread);
    14a2:	fe043503          	ld	a0,-32(s0)
    14a6:	00000097          	auipc	ra,0x0
    14aa:	d6a080e7          	jalr	-662(ra) # 1210 <__thread_exit>
}
    14ae:	0001                	nop
    14b0:	70a2                	ld	ra,40(sp)
    14b2:	7402                	ld	s0,32(sp)
    14b4:	6145                	addi	sp,sp,48
    14b6:	8082                	ret

00000000000014b8 <switch_handler>:

void switch_handler(void *arg)
{
    14b8:	7139                	addi	sp,sp,-64
    14ba:	fc06                	sd	ra,56(sp)
    14bc:	f822                	sd	s0,48(sp)
    14be:	0080                	addi	s0,sp,64
    14c0:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    14c4:	fc843783          	ld	a5,-56(s0)
    14c8:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    14cc:	00001797          	auipc	a5,0x1
    14d0:	0a478793          	addi	a5,a5,164 # 2570 <current>
    14d4:	639c                	ld	a5,0(a5)
    14d6:	fef43023          	sd	a5,-32(s0)
    14da:	fe043783          	ld	a5,-32(s0)
    14de:	fd878793          	addi	a5,a5,-40
    14e2:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    14e6:	fe843783          	ld	a5,-24(s0)
    14ea:	0007871b          	sext.w	a4,a5
    14ee:	00001797          	auipc	a5,0x1
    14f2:	08a78793          	addi	a5,a5,138 # 2578 <threading_system_time>
    14f6:	439c                	lw	a5,0(a5)
    14f8:	2781                	sext.w	a5,a5
    14fa:	9fb9                	addw	a5,a5,a4
    14fc:	2781                	sext.w	a5,a5
    14fe:	0007871b          	sext.w	a4,a5
    1502:	00001797          	auipc	a5,0x1
    1506:	07678793          	addi	a5,a5,118 # 2578 <threading_system_time>
    150a:	c398                	sw	a4,0(a5)
     __release();
    150c:	00000097          	auipc	ra,0x0
    1510:	c1c080e7          	jalr	-996(ra) # 1128 <__release>
    current_thread->remaining_time -= elapsed_time;
    1514:	fd843783          	ld	a5,-40(s0)
    1518:	4fbc                	lw	a5,88(a5)
    151a:	0007871b          	sext.w	a4,a5
    151e:	fe843783          	ld	a5,-24(s0)
    1522:	2781                	sext.w	a5,a5
    1524:	40f707bb          	subw	a5,a4,a5
    1528:	2781                	sext.w	a5,a5
    152a:	0007871b          	sext.w	a4,a5
    152e:	fd843783          	ld	a5,-40(s0)
    1532:	cfb8                	sw	a4,88(a5)

    if (current_thread->is_real_time)
    1534:	fd843783          	ld	a5,-40(s0)
    1538:	43bc                	lw	a5,64(a5)
    153a:	c3ad                	beqz	a5,159c <switch_handler+0xe4>
        if (threading_system_time > current_thread->current_deadline || 
    153c:	fd843783          	ld	a5,-40(s0)
    1540:	4ff8                	lw	a4,92(a5)
    1542:	00001797          	auipc	a5,0x1
    1546:	03678793          	addi	a5,a5,54 # 2578 <threading_system_time>
    154a:	439c                	lw	a5,0(a5)
    154c:	02f74163          	blt	a4,a5,156e <switch_handler+0xb6>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1550:	fd843783          	ld	a5,-40(s0)
    1554:	4ff8                	lw	a4,92(a5)
    1556:	00001797          	auipc	a5,0x1
    155a:	02278793          	addi	a5,a5,34 # 2578 <threading_system_time>
    155e:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    1560:	02f71e63          	bne	a4,a5,159c <switch_handler+0xe4>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1564:	fd843783          	ld	a5,-40(s0)
    1568:	4fbc                	lw	a5,88(a5)
    156a:	02f05963          	blez	a5,159c <switch_handler+0xe4>
            printf("thread#%d misses a deadline at %d\n", current_thread->ID, threading_system_time);
    156e:	fd843783          	ld	a5,-40(s0)
    1572:	5fd8                	lw	a4,60(a5)
    1574:	00001797          	auipc	a5,0x1
    1578:	00478793          	addi	a5,a5,4 # 2578 <threading_system_time>
    157c:	439c                	lw	a5,0(a5)
    157e:	863e                	mv	a2,a5
    1580:	85ba                	mv	a1,a4
    1582:	00001517          	auipc	a0,0x1
    1586:	ed650513          	addi	a0,a0,-298 # 2458 <schedule_dm+0x290>
    158a:	fffff097          	auipc	ra,0xfffff
    158e:	53a080e7          	jalr	1338(ra) # ac4 <printf>
            exit(0);
    1592:	4501                	li	a0,0
    1594:	fffff097          	auipc	ra,0xfffff
    1598:	fea080e7          	jalr	-22(ra) # 57e <exit>
        }

    if (current_thread->remaining_time <= 0) {
    159c:	fd843783          	ld	a5,-40(s0)
    15a0:	4fbc                	lw	a5,88(a5)
    15a2:	02f04063          	bgtz	a5,15c2 <switch_handler+0x10a>
        if (current_thread->is_real_time)
    15a6:	fd843783          	ld	a5,-40(s0)
    15aa:	43bc                	lw	a5,64(a5)
    15ac:	c791                	beqz	a5,15b8 <switch_handler+0x100>
            __rt_finish_current();
    15ae:	00000097          	auipc	ra,0x0
    15b2:	e46080e7          	jalr	-442(ra) # 13f4 <__rt_finish_current>
    15b6:	a881                	j	1606 <switch_handler+0x14e>
        else
            __finish_current();
    15b8:	00000097          	auipc	ra,0x0
    15bc:	d78080e7          	jalr	-648(ra) # 1330 <__finish_current>
    15c0:	a099                	j	1606 <switch_handler+0x14e>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    15c2:	00001797          	auipc	a5,0x1
    15c6:	fae78793          	addi	a5,a5,-82 # 2570 <current>
    15ca:	639c                	ld	a5,0(a5)
    15cc:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    15d0:	00001797          	auipc	a5,0x1
    15d4:	fa078793          	addi	a5,a5,-96 # 2570 <current>
    15d8:	639c                	ld	a5,0(a5)
    15da:	6798                	ld	a4,8(a5)
    15dc:	00001797          	auipc	a5,0x1
    15e0:	f9478793          	addi	a5,a5,-108 # 2570 <current>
    15e4:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    15e6:	fd043503          	ld	a0,-48(s0)
    15ea:	00000097          	auipc	ra,0x0
    15ee:	91e080e7          	jalr	-1762(ra) # f08 <list_del>
        list_add_tail(to_remove, &run_queue);
    15f2:	00001597          	auipc	a1,0x1
    15f6:	f3658593          	addi	a1,a1,-202 # 2528 <run_queue>
    15fa:	fd043503          	ld	a0,-48(s0)
    15fe:	00000097          	auipc	ra,0x0
    1602:	8ae080e7          	jalr	-1874(ra) # eac <list_add_tail>
    }

    __release();
    1606:	00000097          	auipc	ra,0x0
    160a:	b22080e7          	jalr	-1246(ra) # 1128 <__release>
    __schedule();
    160e:	00000097          	auipc	ra,0x0
    1612:	1be080e7          	jalr	446(ra) # 17cc <__schedule>
    __dispatch();
    1616:	00000097          	auipc	ra,0x0
    161a:	026080e7          	jalr	38(ra) # 163c <__dispatch>
    thrdresume(main_thrd_id);
    161e:	00001797          	auipc	a5,0x1
    1622:	f2a78793          	addi	a5,a5,-214 # 2548 <main_thrd_id>
    1626:	439c                	lw	a5,0(a5)
    1628:	853e                	mv	a0,a5
    162a:	fffff097          	auipc	ra,0xfffff
    162e:	ffc080e7          	jalr	-4(ra) # 626 <thrdresume>
}
    1632:	0001                	nop
    1634:	70e2                	ld	ra,56(sp)
    1636:	7442                	ld	s0,48(sp)
    1638:	6121                	addi	sp,sp,64
    163a:	8082                	ret

000000000000163c <__dispatch>:

void __dispatch()
{
    163c:	7179                	addi	sp,sp,-48
    163e:	f406                	sd	ra,40(sp)
    1640:	f022                	sd	s0,32(sp)
    1642:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1644:	00001797          	auipc	a5,0x1
    1648:	f2c78793          	addi	a5,a5,-212 # 2570 <current>
    164c:	6398                	ld	a4,0(a5)
    164e:	00001797          	auipc	a5,0x1
    1652:	eda78793          	addi	a5,a5,-294 # 2528 <run_queue>
    1656:	16f70663          	beq	a4,a5,17c2 <__dispatch+0x186>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }

    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    165a:	00001797          	auipc	a5,0x1
    165e:	f1678793          	addi	a5,a5,-234 # 2570 <current>
    1662:	639c                	ld	a5,0(a5)
    1664:	fef43423          	sd	a5,-24(s0)
    1668:	fe843783          	ld	a5,-24(s0)
    166c:	fd878793          	addi	a5,a5,-40
    1670:	fef43023          	sd	a5,-32(s0)
    if (current_thread->is_real_time && allocated_time == 0) { // miss deadline, abort
    1674:	fe043783          	ld	a5,-32(s0)
    1678:	43bc                	lw	a5,64(a5)
    167a:	cf85                	beqz	a5,16b2 <__dispatch+0x76>
    167c:	00001797          	auipc	a5,0x1
    1680:	f0478793          	addi	a5,a5,-252 # 2580 <allocated_time>
    1684:	639c                	ld	a5,0(a5)
    1686:	e795                	bnez	a5,16b2 <__dispatch+0x76>
        printf("thread#%d misses a deadline at %d\n", current_thread->ID, current_thread->current_deadline);
    1688:	fe043783          	ld	a5,-32(s0)
    168c:	5fd8                	lw	a4,60(a5)
    168e:	fe043783          	ld	a5,-32(s0)
    1692:	4ffc                	lw	a5,92(a5)
    1694:	863e                	mv	a2,a5
    1696:	85ba                	mv	a1,a4
    1698:	00001517          	auipc	a0,0x1
    169c:	dc050513          	addi	a0,a0,-576 # 2458 <schedule_dm+0x290>
    16a0:	fffff097          	auipc	ra,0xfffff
    16a4:	424080e7          	jalr	1060(ra) # ac4 <printf>
        exit(0);
    16a8:	4501                	li	a0,0
    16aa:	fffff097          	auipc	ra,0xfffff
    16ae:	ed4080e7          	jalr	-300(ra) # 57e <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    16b2:	fe043783          	ld	a5,-32(s0)
    16b6:	5fd8                	lw	a4,60(a5)
    16b8:	00001797          	auipc	a5,0x1
    16bc:	ec078793          	addi	a5,a5,-320 # 2578 <threading_system_time>
    16c0:	4390                	lw	a2,0(a5)
    16c2:	00001797          	auipc	a5,0x1
    16c6:	ebe78793          	addi	a5,a5,-322 # 2580 <allocated_time>
    16ca:	639c                	ld	a5,0(a5)
    16cc:	86be                	mv	a3,a5
    16ce:	85ba                	mv	a1,a4
    16d0:	00001517          	auipc	a0,0x1
    16d4:	db050513          	addi	a0,a0,-592 # 2480 <schedule_dm+0x2b8>
    16d8:	fffff097          	auipc	ra,0xfffff
    16dc:	3ec080e7          	jalr	1004(ra) # ac4 <printf>

    if (current_thread->buf_set) {
    16e0:	fe043783          	ld	a5,-32(s0)
    16e4:	539c                	lw	a5,32(a5)
    16e6:	c7a1                	beqz	a5,172e <__dispatch+0xf2>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    16e8:	00001797          	auipc	a5,0x1
    16ec:	e9878793          	addi	a5,a5,-360 # 2580 <allocated_time>
    16f0:	639c                	ld	a5,0(a5)
    16f2:	0007871b          	sext.w	a4,a5
    16f6:	fe043783          	ld	a5,-32(s0)
    16fa:	03878593          	addi	a1,a5,56
    16fe:	00001797          	auipc	a5,0x1
    1702:	e8278793          	addi	a5,a5,-382 # 2580 <allocated_time>
    1706:	639c                	ld	a5,0(a5)
    1708:	86be                	mv	a3,a5
    170a:	00000617          	auipc	a2,0x0
    170e:	dae60613          	addi	a2,a2,-594 # 14b8 <switch_handler>
    1712:	853a                	mv	a0,a4
    1714:	fffff097          	auipc	ra,0xfffff
    1718:	f0a080e7          	jalr	-246(ra) # 61e <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    171c:	fe043783          	ld	a5,-32(s0)
    1720:	5f9c                	lw	a5,56(a5)
    1722:	853e                	mv	a0,a5
    1724:	fffff097          	auipc	ra,0xfffff
    1728:	f02080e7          	jalr	-254(ra) # 626 <thrdresume>
    172c:	a071                	j	17b8 <__dispatch+0x17c>
    } else {
        current_thread->buf_set = 1;
    172e:	fe043783          	ld	a5,-32(s0)
    1732:	4705                	li	a4,1
    1734:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    1736:	fe043783          	ld	a5,-32(s0)
    173a:	6f9c                	ld	a5,24(a5)
    173c:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1740:	fe043783          	ld	a5,-32(s0)
    1744:	577d                	li	a4,-1
    1746:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1748:	00001797          	auipc	a5,0x1
    174c:	e3878793          	addi	a5,a5,-456 # 2580 <allocated_time>
    1750:	639c                	ld	a5,0(a5)
    1752:	0007871b          	sext.w	a4,a5
    1756:	fe043783          	ld	a5,-32(s0)
    175a:	03878593          	addi	a1,a5,56
    175e:	00001797          	auipc	a5,0x1
    1762:	e2278793          	addi	a5,a5,-478 # 2580 <allocated_time>
    1766:	639c                	ld	a5,0(a5)
    1768:	86be                	mv	a3,a5
    176a:	00000617          	auipc	a2,0x0
    176e:	d4e60613          	addi	a2,a2,-690 # 14b8 <switch_handler>
    1772:	853a                	mv	a0,a4
    1774:	fffff097          	auipc	ra,0xfffff
    1778:	eaa080e7          	jalr	-342(ra) # 61e <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    177c:	fe043783          	ld	a5,-32(s0)
    1780:	5f9c                	lw	a5,56(a5)
    1782:	0207d063          	bgez	a5,17a2 <__dispatch+0x166>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    1786:	00001597          	auipc	a1,0x1
    178a:	d2a58593          	addi	a1,a1,-726 # 24b0 <schedule_dm+0x2e8>
    178e:	4509                	li	a0,2
    1790:	fffff097          	auipc	ra,0xfffff
    1794:	2dc080e7          	jalr	732(ra) # a6c <fprintf>
            exit(1);
    1798:	4505                	li	a0,1
    179a:	fffff097          	auipc	ra,0xfffff
    179e:	de4080e7          	jalr	-540(ra) # 57e <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    17a2:	fd843783          	ld	a5,-40(s0)
    17a6:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    17a8:	fe043783          	ld	a5,-32(s0)
    17ac:	6398                	ld	a4,0(a5)
    17ae:	fe043783          	ld	a5,-32(s0)
    17b2:	679c                	ld	a5,8(a5)
    17b4:	853e                	mv	a0,a5
    17b6:	9702                	jalr	a4
    }
    thread_exit();
    17b8:	00000097          	auipc	ra,0x0
    17bc:	ad0080e7          	jalr	-1328(ra) # 1288 <thread_exit>
    17c0:	a011                	j	17c4 <__dispatch+0x188>
        return;
    17c2:	0001                	nop
}
    17c4:	70a2                	ld	ra,40(sp)
    17c6:	7402                	ld	s0,32(sp)
    17c8:	6145                	addi	sp,sp,48
    17ca:	8082                	ret

00000000000017cc <__schedule>:

void __schedule()
{
    17cc:	711d                	addi	sp,sp,-96
    17ce:	ec86                	sd	ra,88(sp)
    17d0:	e8a2                	sd	s0,80(sp)
    17d2:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    17d4:	00001797          	auipc	a5,0x1
    17d8:	da478793          	addi	a5,a5,-604 # 2578 <threading_system_time>
    17dc:	439c                	lw	a5,0(a5)
    17de:	fcf42c23          	sw	a5,-40(s0)
    17e2:	4789                	li	a5,2
    17e4:	fcf42e23          	sw	a5,-36(s0)
    17e8:	00001797          	auipc	a5,0x1
    17ec:	d4078793          	addi	a5,a5,-704 # 2528 <run_queue>
    17f0:	fef43023          	sd	a5,-32(s0)
    17f4:	00001797          	auipc	a5,0x1
    17f8:	d4478793          	addi	a5,a5,-700 # 2538 <release_queue>
    17fc:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_WRR
    r = schedule_wrr(args);
#endif

#ifdef THREAD_SCHEDULER_SJF
    r = schedule_sjf(args);
    1800:	fd843783          	ld	a5,-40(s0)
    1804:	faf43023          	sd	a5,-96(s0)
    1808:	fe043783          	ld	a5,-32(s0)
    180c:	faf43423          	sd	a5,-88(s0)
    1810:	fe843783          	ld	a5,-24(s0)
    1814:	faf43823          	sd	a5,-80(s0)
    1818:	fa040793          	addi	a5,s0,-96
    181c:	853e                	mv	a0,a5
    181e:	00000097          	auipc	ra,0x0
    1822:	4a4080e7          	jalr	1188(ra) # 1cc2 <schedule_sjf>
    1826:	872a                	mv	a4,a0
    1828:	87ae                	mv	a5,a1
    182a:	fce43423          	sd	a4,-56(s0)
    182e:	fcf43823          	sd	a5,-48(s0)

#ifdef THREAD_SCHEDULER_DM
    r = schedule_dm(args);
#endif

    current = r.scheduled_thread_list_member;
    1832:	fc843703          	ld	a4,-56(s0)
    1836:	00001797          	auipc	a5,0x1
    183a:	d3a78793          	addi	a5,a5,-710 # 2570 <current>
    183e:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1840:	fd042783          	lw	a5,-48(s0)
    1844:	873e                	mv	a4,a5
    1846:	00001797          	auipc	a5,0x1
    184a:	d3a78793          	addi	a5,a5,-710 # 2580 <allocated_time>
    184e:	e398                	sd	a4,0(a5)
}
    1850:	0001                	nop
    1852:	60e6                	ld	ra,88(sp)
    1854:	6446                	ld	s0,80(sp)
    1856:	6125                	addi	sp,sp,96
    1858:	8082                	ret

000000000000185a <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    185a:	1101                	addi	sp,sp,-32
    185c:	ec06                	sd	ra,24(sp)
    185e:	e822                	sd	s0,16(sp)
    1860:	1000                	addi	s0,sp,32
    1862:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1866:	00001797          	auipc	a5,0x1
    186a:	d1678793          	addi	a5,a5,-746 # 257c <sleeping>
    186e:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1872:	fe843783          	ld	a5,-24(s0)
    1876:	0007871b          	sext.w	a4,a5
    187a:	00001797          	auipc	a5,0x1
    187e:	cfe78793          	addi	a5,a5,-770 # 2578 <threading_system_time>
    1882:	439c                	lw	a5,0(a5)
    1884:	2781                	sext.w	a5,a5
    1886:	9fb9                	addw	a5,a5,a4
    1888:	2781                	sext.w	a5,a5
    188a:	0007871b          	sext.w	a4,a5
    188e:	00001797          	auipc	a5,0x1
    1892:	cea78793          	addi	a5,a5,-790 # 2578 <threading_system_time>
    1896:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    1898:	00001797          	auipc	a5,0x1
    189c:	cb078793          	addi	a5,a5,-848 # 2548 <main_thrd_id>
    18a0:	439c                	lw	a5,0(a5)
    18a2:	853e                	mv	a0,a5
    18a4:	fffff097          	auipc	ra,0xfffff
    18a8:	d82080e7          	jalr	-638(ra) # 626 <thrdresume>
}
    18ac:	0001                	nop
    18ae:	60e2                	ld	ra,24(sp)
    18b0:	6442                	ld	s0,16(sp)
    18b2:	6105                	addi	sp,sp,32
    18b4:	8082                	ret

00000000000018b6 <thread_start_threading>:

void thread_start_threading()
{
    18b6:	1141                	addi	sp,sp,-16
    18b8:	e406                	sd	ra,8(sp)
    18ba:	e022                	sd	s0,0(sp)
    18bc:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    18be:	00001797          	auipc	a5,0x1
    18c2:	cba78793          	addi	a5,a5,-838 # 2578 <threading_system_time>
    18c6:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    18ca:	00001797          	auipc	a5,0x1
    18ce:	ca678793          	addi	a5,a5,-858 # 2570 <current>
    18d2:	00001717          	auipc	a4,0x1
    18d6:	c5670713          	addi	a4,a4,-938 # 2528 <run_queue>
    18da:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    18dc:	4681                	li	a3,0
    18de:	00000617          	auipc	a2,0x0
    18e2:	f7c60613          	addi	a2,a2,-132 # 185a <back_to_main_handler>
    18e6:	00001597          	auipc	a1,0x1
    18ea:	c6258593          	addi	a1,a1,-926 # 2548 <main_thrd_id>
    18ee:	3e800513          	li	a0,1000
    18f2:	fffff097          	auipc	ra,0xfffff
    18f6:	d2c080e7          	jalr	-724(ra) # 61e <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    18fa:	00001797          	auipc	a5,0x1
    18fe:	c4e78793          	addi	a5,a5,-946 # 2548 <main_thrd_id>
    1902:	439c                	lw	a5,0(a5)
    1904:	4581                	li	a1,0
    1906:	853e                	mv	a0,a5
    1908:	fffff097          	auipc	ra,0xfffff
    190c:	d26080e7          	jalr	-730(ra) # 62e <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1910:	a0c9                	j	19d2 <thread_start_threading+0x11c>
        __release();
    1912:	00000097          	auipc	ra,0x0
    1916:	816080e7          	jalr	-2026(ra) # 1128 <__release>
        __schedule();
    191a:	00000097          	auipc	ra,0x0
    191e:	eb2080e7          	jalr	-334(ra) # 17cc <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1922:	00001797          	auipc	a5,0x1
    1926:	c2678793          	addi	a5,a5,-986 # 2548 <main_thrd_id>
    192a:	439c                	lw	a5,0(a5)
    192c:	4581                	li	a1,0
    192e:	853e                	mv	a0,a5
    1930:	fffff097          	auipc	ra,0xfffff
    1934:	cfe080e7          	jalr	-770(ra) # 62e <cancelthrdstop>
        __dispatch();
    1938:	00000097          	auipc	ra,0x0
    193c:	d04080e7          	jalr	-764(ra) # 163c <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1940:	00001517          	auipc	a0,0x1
    1944:	be850513          	addi	a0,a0,-1048 # 2528 <run_queue>
    1948:	fffff097          	auipc	ra,0xfffff
    194c:	60a080e7          	jalr	1546(ra) # f52 <list_empty>
    1950:	87aa                	mv	a5,a0
    1952:	cb99                	beqz	a5,1968 <thread_start_threading+0xb2>
    1954:	00001517          	auipc	a0,0x1
    1958:	be450513          	addi	a0,a0,-1052 # 2538 <release_queue>
    195c:	fffff097          	auipc	ra,0xfffff
    1960:	5f6080e7          	jalr	1526(ra) # f52 <list_empty>
    1964:	87aa                	mv	a5,a0
    1966:	ebd9                	bnez	a5,19fc <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1968:	00001797          	auipc	a5,0x1
    196c:	c1878793          	addi	a5,a5,-1000 # 2580 <allocated_time>
    1970:	639c                	ld	a5,0(a5)
    1972:	85be                	mv	a1,a5
    1974:	00001517          	auipc	a0,0x1
    1978:	b7450513          	addi	a0,a0,-1164 # 24e8 <schedule_dm+0x320>
    197c:	fffff097          	auipc	ra,0xfffff
    1980:	148080e7          	jalr	328(ra) # ac4 <printf>
        sleeping = 1;
    1984:	00001797          	auipc	a5,0x1
    1988:	bf878793          	addi	a5,a5,-1032 # 257c <sleeping>
    198c:	4705                	li	a4,1
    198e:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1990:	00001797          	auipc	a5,0x1
    1994:	bf078793          	addi	a5,a5,-1040 # 2580 <allocated_time>
    1998:	639c                	ld	a5,0(a5)
    199a:	0007871b          	sext.w	a4,a5
    199e:	00001797          	auipc	a5,0x1
    19a2:	be278793          	addi	a5,a5,-1054 # 2580 <allocated_time>
    19a6:	639c                	ld	a5,0(a5)
    19a8:	86be                	mv	a3,a5
    19aa:	00000617          	auipc	a2,0x0
    19ae:	eb060613          	addi	a2,a2,-336 # 185a <back_to_main_handler>
    19b2:	00001597          	auipc	a1,0x1
    19b6:	b9658593          	addi	a1,a1,-1130 # 2548 <main_thrd_id>
    19ba:	853a                	mv	a0,a4
    19bc:	fffff097          	auipc	ra,0xfffff
    19c0:	c62080e7          	jalr	-926(ra) # 61e <thrdstop>
        while (sleeping) {
    19c4:	0001                	nop
    19c6:	00001797          	auipc	a5,0x1
    19ca:	bb678793          	addi	a5,a5,-1098 # 257c <sleeping>
    19ce:	439c                	lw	a5,0(a5)
    19d0:	fbfd                	bnez	a5,19c6 <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    19d2:	00001517          	auipc	a0,0x1
    19d6:	b5650513          	addi	a0,a0,-1194 # 2528 <run_queue>
    19da:	fffff097          	auipc	ra,0xfffff
    19de:	578080e7          	jalr	1400(ra) # f52 <list_empty>
    19e2:	87aa                	mv	a5,a0
    19e4:	d79d                	beqz	a5,1912 <thread_start_threading+0x5c>
    19e6:	00001517          	auipc	a0,0x1
    19ea:	b5250513          	addi	a0,a0,-1198 # 2538 <release_queue>
    19ee:	fffff097          	auipc	ra,0xfffff
    19f2:	564080e7          	jalr	1380(ra) # f52 <list_empty>
    19f6:	87aa                	mv	a5,a0
    19f8:	df89                	beqz	a5,1912 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    19fa:	a011                	j	19fe <thread_start_threading+0x148>
            break;
    19fc:	0001                	nop
}
    19fe:	0001                	nop
    1a00:	60a2                	ld	ra,8(sp)
    1a02:	6402                	ld	s0,0(sp)
    1a04:	0141                	addi	sp,sp,16
    1a06:	8082                	ret

0000000000001a08 <list_empty>:
{
    1a08:	1101                	addi	sp,sp,-32
    1a0a:	ec22                	sd	s0,24(sp)
    1a0c:	1000                	addi	s0,sp,32
    1a0e:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
    1a12:	fe843783          	ld	a5,-24(s0)
    1a16:	639c                	ld	a5,0(a5)
    1a18:	fe843703          	ld	a4,-24(s0)
    1a1c:	40f707b3          	sub	a5,a4,a5
    1a20:	0017b793          	seqz	a5,a5
    1a24:	0ff7f793          	andi	a5,a5,255
    1a28:	2781                	sext.w	a5,a5
}
    1a2a:	853e                	mv	a0,a5
    1a2c:	6462                	ld	s0,24(sp)
    1a2e:	6105                	addi	sp,sp,32
    1a30:	8082                	ret

0000000000001a32 <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
    1a32:	715d                	addi	sp,sp,-80
    1a34:	e4a2                	sd	s0,72(sp)
    1a36:	e0a6                	sd	s1,64(sp)
    1a38:	0880                	addi	s0,sp,80
    1a3a:	84aa                	mv	s1,a0
    int sleep_time = -1;
    1a3c:	57fd                	li	a5,-1
    1a3e:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1a42:	689c                	ld	a5,16(s1)
    1a44:	639c                	ld	a5,0(a5)
    1a46:	fcf43c23          	sd	a5,-40(s0)
    1a4a:	fd843783          	ld	a5,-40(s0)
    1a4e:	17e1                	addi	a5,a5,-8
    1a50:	fef43023          	sd	a5,-32(s0)
    1a54:	a0a9                	j	1a9e <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
    1a56:	fec42783          	lw	a5,-20(s0)
    1a5a:	2781                	sext.w	a5,a5
    1a5c:	0007cf63          	bltz	a5,1a7a <fill_sparse+0x48>
    1a60:	fe043783          	ld	a5,-32(s0)
    1a64:	4f98                	lw	a4,24(a5)
    1a66:	409c                	lw	a5,0(s1)
    1a68:	40f707bb          	subw	a5,a4,a5
    1a6c:	0007871b          	sext.w	a4,a5
    1a70:	fec42783          	lw	a5,-20(s0)
    1a74:	2781                	sext.w	a5,a5
    1a76:	00f75a63          	bge	a4,a5,1a8a <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
    1a7a:	fe043783          	ld	a5,-32(s0)
    1a7e:	4f98                	lw	a4,24(a5)
    1a80:	409c                	lw	a5,0(s1)
    1a82:	40f707bb          	subw	a5,a4,a5
    1a86:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1a8a:	fe043783          	ld	a5,-32(s0)
    1a8e:	679c                	ld	a5,8(a5)
    1a90:	fcf43823          	sd	a5,-48(s0)
    1a94:	fd043783          	ld	a5,-48(s0)
    1a98:	17e1                	addi	a5,a5,-8
    1a9a:	fef43023          	sd	a5,-32(s0)
    1a9e:	fe043783          	ld	a5,-32(s0)
    1aa2:	00878713          	addi	a4,a5,8
    1aa6:	689c                	ld	a5,16(s1)
    1aa8:	faf717e3          	bne	a4,a5,1a56 <fill_sparse+0x24>
    }
    return (struct threads_sched_result) { .scheduled_thread_list_member = args.run_queue, .allocated_time = sleep_time };
    1aac:	649c                	ld	a5,8(s1)
    1aae:	fcf43023          	sd	a5,-64(s0)
    1ab2:	fec42783          	lw	a5,-20(s0)
    1ab6:	fcf42423          	sw	a5,-56(s0)
    1aba:	4701                	li	a4,0
    1abc:	fc043703          	ld	a4,-64(s0)
    1ac0:	4781                	li	a5,0
    1ac2:	fc843783          	ld	a5,-56(s0)
    1ac6:	863a                	mv	a2,a4
    1ac8:	86be                	mv	a3,a5
    1aca:	8732                	mv	a4,a2
    1acc:	87b6                	mv	a5,a3
}
    1ace:	853a                	mv	a0,a4
    1ad0:	85be                	mv	a1,a5
    1ad2:	6426                	ld	s0,72(sp)
    1ad4:	6486                	ld	s1,64(sp)
    1ad6:	6161                	addi	sp,sp,80
    1ad8:	8082                	ret

0000000000001ada <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    1ada:	715d                	addi	sp,sp,-80
    1adc:	e4a2                	sd	s0,72(sp)
    1ade:	e0a6                	sd	s1,64(sp)
    1ae0:	0880                	addi	s0,sp,80
    1ae2:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
    1ae4:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    1ae8:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1aec:	649c                	ld	a5,8(s1)
    1aee:	639c                	ld	a5,0(a5)
    1af0:	fcf43c23          	sd	a5,-40(s0)
    1af4:	fd843783          	ld	a5,-40(s0)
    1af8:	fd878793          	addi	a5,a5,-40
    1afc:	fef43023          	sd	a5,-32(s0)
    1b00:	a81d                	j	1b36 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
    1b02:	fe843783          	ld	a5,-24(s0)
    1b06:	cb89                	beqz	a5,1b18 <schedule_default+0x3e>
    1b08:	fe043783          	ld	a5,-32(s0)
    1b0c:	5fd8                	lw	a4,60(a5)
    1b0e:	fe843783          	ld	a5,-24(s0)
    1b12:	5fdc                	lw	a5,60(a5)
    1b14:	00f75663          	bge	a4,a5,1b20 <schedule_default+0x46>
            thread_with_smallest_id = th;
    1b18:	fe043783          	ld	a5,-32(s0)
    1b1c:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1b20:	fe043783          	ld	a5,-32(s0)
    1b24:	779c                	ld	a5,40(a5)
    1b26:	fcf43823          	sd	a5,-48(s0)
    1b2a:	fd043783          	ld	a5,-48(s0)
    1b2e:	fd878793          	addi	a5,a5,-40
    1b32:	fef43023          	sd	a5,-32(s0)
    1b36:	fe043783          	ld	a5,-32(s0)
    1b3a:	02878713          	addi	a4,a5,40
    1b3e:	649c                	ld	a5,8(s1)
    1b40:	fcf711e3          	bne	a4,a5,1b02 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
    1b44:	fe843783          	ld	a5,-24(s0)
    1b48:	cf89                	beqz	a5,1b62 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
    1b4a:	fe843783          	ld	a5,-24(s0)
    1b4e:	02878793          	addi	a5,a5,40
    1b52:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
    1b56:	fe843783          	ld	a5,-24(s0)
    1b5a:	4fbc                	lw	a5,88(a5)
    1b5c:	faf42c23          	sw	a5,-72(s0)
    1b60:	a039                	j	1b6e <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1b62:	649c                	ld	a5,8(s1)
    1b64:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
    1b68:	4785                	li	a5,1
    1b6a:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
    1b6e:	fb043783          	ld	a5,-80(s0)
    1b72:	fcf43023          	sd	a5,-64(s0)
    1b76:	fb843783          	ld	a5,-72(s0)
    1b7a:	fcf43423          	sd	a5,-56(s0)
    1b7e:	4701                	li	a4,0
    1b80:	fc043703          	ld	a4,-64(s0)
    1b84:	4781                	li	a5,0
    1b86:	fc843783          	ld	a5,-56(s0)
    1b8a:	863a                	mv	a2,a4
    1b8c:	86be                	mv	a3,a5
    1b8e:	8732                	mv	a4,a2
    1b90:	87b6                	mv	a5,a3
}
    1b92:	853a                	mv	a0,a4
    1b94:	85be                	mv	a1,a5
    1b96:	6426                	ld	s0,72(sp)
    1b98:	6486                	ld	s1,64(sp)
    1b9a:	6161                	addi	sp,sp,80
    1b9c:	8082                	ret

0000000000001b9e <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
    1b9e:	7135                	addi	sp,sp,-160
    1ba0:	ed06                	sd	ra,152(sp)
    1ba2:	e922                	sd	s0,144(sp)
    1ba4:	e526                	sd	s1,136(sp)
    1ba6:	e14a                	sd	s2,128(sp)
    1ba8:	fcce                	sd	s3,120(sp)
    1baa:	1100                	addi	s0,sp,160
    1bac:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
    1bae:	649c                	ld	a5,8(s1)
    1bb0:	853e                	mv	a0,a5
    1bb2:	00000097          	auipc	ra,0x0
    1bb6:	e56080e7          	jalr	-426(ra) # 1a08 <list_empty>
    1bba:	87aa                	mv	a5,a0
    1bbc:	cb85                	beqz	a5,1bec <schedule_wrr+0x4e>
        return fill_sparse(args);
    1bbe:	609c                	ld	a5,0(s1)
    1bc0:	f6f43023          	sd	a5,-160(s0)
    1bc4:	649c                	ld	a5,8(s1)
    1bc6:	f6f43423          	sd	a5,-152(s0)
    1bca:	689c                	ld	a5,16(s1)
    1bcc:	f6f43823          	sd	a5,-144(s0)
    1bd0:	f6040793          	addi	a5,s0,-160
    1bd4:	853e                	mv	a0,a5
    1bd6:	00000097          	auipc	ra,0x0
    1bda:	e5c080e7          	jalr	-420(ra) # 1a32 <fill_sparse>
    1bde:	872a                	mv	a4,a0
    1be0:	87ae                	mv	a5,a1
    1be2:	f8e43823          	sd	a4,-112(s0)
    1be6:	f8f43c23          	sd	a5,-104(s0)
    1bea:	a84d                	j	1c9c <schedule_wrr+0xfe>

    struct thread *process_thread = NULL;
    1bec:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1bf0:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1bf4:	649c                	ld	a5,8(s1)
    1bf6:	639c                	ld	a5,0(a5)
    1bf8:	faf43823          	sd	a5,-80(s0)
    1bfc:	fb043783          	ld	a5,-80(s0)
    1c00:	fd878793          	addi	a5,a5,-40
    1c04:	fcf43023          	sd	a5,-64(s0)
    1c08:	a025                	j	1c30 <schedule_wrr+0x92>
        if (process_thread == NULL) {
    1c0a:	fc843783          	ld	a5,-56(s0)
    1c0e:	e791                	bnez	a5,1c1a <schedule_wrr+0x7c>
            process_thread = th;
    1c10:	fc043783          	ld	a5,-64(s0)
    1c14:	fcf43423          	sd	a5,-56(s0)
            break;
    1c18:	a01d                	j	1c3e <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
    1c1a:	fc043783          	ld	a5,-64(s0)
    1c1e:	779c                	ld	a5,40(a5)
    1c20:	faf43423          	sd	a5,-88(s0)
    1c24:	fa843783          	ld	a5,-88(s0)
    1c28:	fd878793          	addi	a5,a5,-40
    1c2c:	fcf43023          	sd	a5,-64(s0)
    1c30:	fc043783          	ld	a5,-64(s0)
    1c34:	02878713          	addi	a4,a5,40
    1c38:	649c                	ld	a5,8(s1)
    1c3a:	fcf718e3          	bne	a4,a5,1c0a <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
    1c3e:	40dc                	lw	a5,4(s1)
    1c40:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
    1c44:	fc843783          	ld	a5,-56(s0)
    1c48:	4fbc                	lw	a5,88(a5)
    1c4a:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    1c4e:	fc843783          	ld	a5,-56(s0)
    1c52:	4fb4                	lw	a3,88(a5)
    1c54:	fc843783          	ld	a5,-56(s0)
    1c58:	47bc                	lw	a5,72(a5)
    1c5a:	fa442703          	lw	a4,-92(s0)
    1c5e:	02f707bb          	mulw	a5,a4,a5
    1c62:	2781                	sext.w	a5,a5
    1c64:	8736                	mv	a4,a3
    1c66:	00e7dc63          	bge	a5,a4,1c7e <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
    1c6a:	fc843783          	ld	a5,-56(s0)
    1c6e:	47bc                	lw	a5,72(a5)
    1c70:	fa442703          	lw	a4,-92(s0)
    1c74:	02f707bb          	mulw	a5,a4,a5
    1c78:	faf42e23          	sw	a5,-68(s0)
    1c7c:	a031                	j	1c88 <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    1c7e:	fc843783          	ld	a5,-56(s0)
    1c82:	4fbc                	lw	a5,88(a5)
    1c84:	faf42e23          	sw	a5,-68(s0)
    }
    
    return (struct threads_sched_result) { .scheduled_thread_list_member = &process_thread->thread_list, .allocated_time = executing_time };
    1c88:	fc843783          	ld	a5,-56(s0)
    1c8c:	02878793          	addi	a5,a5,40
    1c90:	f8f43823          	sd	a5,-112(s0)
    1c94:	fbc42783          	lw	a5,-68(s0)
    1c98:	f8f42c23          	sw	a5,-104(s0)
    1c9c:	4701                	li	a4,0
    1c9e:	f9043703          	ld	a4,-112(s0)
    1ca2:	4781                	li	a5,0
    1ca4:	f9843783          	ld	a5,-104(s0)
    1ca8:	893a                	mv	s2,a4
    1caa:	89be                	mv	s3,a5
    1cac:	874a                	mv	a4,s2
    1cae:	87ce                	mv	a5,s3
}
    1cb0:	853a                	mv	a0,a4
    1cb2:	85be                	mv	a1,a5
    1cb4:	60ea                	ld	ra,152(sp)
    1cb6:	644a                	ld	s0,144(sp)
    1cb8:	64aa                	ld	s1,136(sp)
    1cba:	690a                	ld	s2,128(sp)
    1cbc:	79e6                	ld	s3,120(sp)
    1cbe:	610d                	addi	sp,sp,160
    1cc0:	8082                	ret

0000000000001cc2 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    1cc2:	7131                	addi	sp,sp,-192
    1cc4:	fd06                	sd	ra,184(sp)
    1cc6:	f922                	sd	s0,176(sp)
    1cc8:	f526                	sd	s1,168(sp)
    1cca:	f14a                	sd	s2,160(sp)
    1ccc:	ed4e                	sd	s3,152(sp)
    1cce:	0180                	addi	s0,sp,192
    1cd0:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    1cd2:	649c                	ld	a5,8(s1)
    1cd4:	853e                	mv	a0,a5
    1cd6:	00000097          	auipc	ra,0x0
    1cda:	d32080e7          	jalr	-718(ra) # 1a08 <list_empty>
    1cde:	87aa                	mv	a5,a0
    1ce0:	cb85                	beqz	a5,1d10 <schedule_sjf+0x4e>
        return fill_sparse(args);
    1ce2:	609c                	ld	a5,0(s1)
    1ce4:	f4f43023          	sd	a5,-192(s0)
    1ce8:	649c                	ld	a5,8(s1)
    1cea:	f4f43423          	sd	a5,-184(s0)
    1cee:	689c                	ld	a5,16(s1)
    1cf0:	f4f43823          	sd	a5,-176(s0)
    1cf4:	f4040793          	addi	a5,s0,-192
    1cf8:	853e                	mv	a0,a5
    1cfa:	00000097          	auipc	ra,0x0
    1cfe:	d38080e7          	jalr	-712(ra) # 1a32 <fill_sparse>
    1d02:	872a                	mv	a4,a0
    1d04:	87ae                	mv	a5,a1
    1d06:	f6e43c23          	sd	a4,-136(s0)
    1d0a:	f8f43023          	sd	a5,-128(s0)
    1d0e:	aa49                	j	1ea0 <schedule_sjf+0x1de>

    int current_time = args.current_time;
    1d10:	409c                	lw	a5,0(s1)
    1d12:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    1d16:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1d1a:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1d1e:	649c                	ld	a5,8(s1)
    1d20:	639c                	ld	a5,0(a5)
    1d22:	faf43423          	sd	a5,-88(s0)
    1d26:	fa843783          	ld	a5,-88(s0)
    1d2a:	fd878793          	addi	a5,a5,-40
    1d2e:	fcf43023          	sd	a5,-64(s0)
    1d32:	a085                	j	1d92 <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    1d34:	fc843783          	ld	a5,-56(s0)
    1d38:	cb89                	beqz	a5,1d4a <schedule_sjf+0x88>
    1d3a:	fc043783          	ld	a5,-64(s0)
    1d3e:	4fb8                	lw	a4,88(a5)
    1d40:	fc843783          	ld	a5,-56(s0)
    1d44:	4fbc                	lw	a5,88(a5)
    1d46:	00f75763          	bge	a4,a5,1d54 <schedule_sjf+0x92>
            shortest_thread = th;
    1d4a:	fc043783          	ld	a5,-64(s0)
    1d4e:	fcf43423          	sd	a5,-56(s0)
    1d52:	a02d                	j	1d7c <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    1d54:	fc043783          	ld	a5,-64(s0)
    1d58:	4fb8                	lw	a4,88(a5)
    1d5a:	fc843783          	ld	a5,-56(s0)
    1d5e:	4fbc                	lw	a5,88(a5)
    1d60:	00f71e63          	bne	a4,a5,1d7c <schedule_sjf+0xba>
    1d64:	fc043783          	ld	a5,-64(s0)
    1d68:	5fd8                	lw	a4,60(a5)
    1d6a:	fc843783          	ld	a5,-56(s0)
    1d6e:	5fdc                	lw	a5,60(a5)
    1d70:	00f75663          	bge	a4,a5,1d7c <schedule_sjf+0xba>
            shortest_thread = th;
    1d74:	fc043783          	ld	a5,-64(s0)
    1d78:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1d7c:	fc043783          	ld	a5,-64(s0)
    1d80:	779c                	ld	a5,40(a5)
    1d82:	f8f43423          	sd	a5,-120(s0)
    1d86:	f8843783          	ld	a5,-120(s0)
    1d8a:	fd878793          	addi	a5,a5,-40
    1d8e:	fcf43023          	sd	a5,-64(s0)
    1d92:	fc043783          	ld	a5,-64(s0)
    1d96:	02878713          	addi	a4,a5,40
    1d9a:	649c                	ld	a5,8(s1)
    1d9c:	f8f71ce3          	bne	a4,a5,1d34 <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    1da0:	fc843783          	ld	a5,-56(s0)
    1da4:	4fbc                	lw	a5,88(a5)
    1da6:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1daa:	689c                	ld	a5,16(s1)
    1dac:	639c                	ld	a5,0(a5)
    1dae:	faf43023          	sd	a5,-96(s0)
    1db2:	fa043783          	ld	a5,-96(s0)
    1db6:	17e1                	addi	a5,a5,-8
    1db8:	faf43c23          	sd	a5,-72(s0)
    1dbc:	a0c9                	j	1e7e <schedule_sjf+0x1bc>
        int interval = cur->release_time - current_time;
    1dbe:	fb843783          	ld	a5,-72(s0)
    1dc2:	4f98                	lw	a4,24(a5)
    1dc4:	fb042783          	lw	a5,-80(s0)
    1dc8:	40f707bb          	subw	a5,a4,a5
    1dcc:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    1dd0:	f9c42703          	lw	a4,-100(s0)
    1dd4:	fb442783          	lw	a5,-76(s0)
    1dd8:	2701                	sext.w	a4,a4
    1dda:	2781                	sext.w	a5,a5
    1ddc:	08e7c063          	blt	a5,a4,1e5c <schedule_sjf+0x19a>
        if (current_time + shortest_thread->remaining_time < cur->release_time || interval > executing_time) continue; 
    1de0:	fc843783          	ld	a5,-56(s0)
    1de4:	4fbc                	lw	a5,88(a5)
    1de6:	fb042703          	lw	a4,-80(s0)
    1dea:	9fb9                	addw	a5,a5,a4
    1dec:	0007871b          	sext.w	a4,a5
    1df0:	fb843783          	ld	a5,-72(s0)
    1df4:	4f9c                	lw	a5,24(a5)
    1df6:	06f74563          	blt	a4,a5,1e60 <schedule_sjf+0x19e>
    1dfa:	f9c42703          	lw	a4,-100(s0)
    1dfe:	fb442783          	lw	a5,-76(s0)
    1e02:	2701                	sext.w	a4,a4
    1e04:	2781                	sext.w	a5,a5
    1e06:	04e7cd63          	blt	a5,a4,1e60 <schedule_sjf+0x19e>
        int remaining_time = shortest_thread->remaining_time - interval;
    1e0a:	fc843783          	ld	a5,-56(s0)
    1e0e:	4fb8                	lw	a4,88(a5)
    1e10:	f9c42783          	lw	a5,-100(s0)
    1e14:	40f707bb          	subw	a5,a4,a5
    1e18:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    1e1c:	fb843783          	ld	a5,-72(s0)
    1e20:	639c                	ld	a5,0(a5)
    1e22:	43f8                	lw	a4,68(a5)
    1e24:	f9842783          	lw	a5,-104(s0)
    1e28:	2781                	sext.w	a5,a5
    1e2a:	02e7cd63          	blt	a5,a4,1e64 <schedule_sjf+0x1a2>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    1e2e:	fb843783          	ld	a5,-72(s0)
    1e32:	639c                	ld	a5,0(a5)
    1e34:	43f8                	lw	a4,68(a5)
    1e36:	f9842783          	lw	a5,-104(s0)
    1e3a:	2781                	sext.w	a5,a5
    1e3c:	00e79b63          	bne	a5,a4,1e52 <schedule_sjf+0x190>
    1e40:	fc843783          	ld	a5,-56(s0)
    1e44:	5fd8                	lw	a4,60(a5)
    1e46:	fb843783          	ld	a5,-72(s0)
    1e4a:	639c                	ld	a5,0(a5)
    1e4c:	5fdc                	lw	a5,60(a5)
    1e4e:	00f74d63          	blt	a4,a5,1e68 <schedule_sjf+0x1a6>
        executing_time = interval;
    1e52:	f9c42783          	lw	a5,-100(s0)
    1e56:	faf42a23          	sw	a5,-76(s0)
    1e5a:	a801                	j	1e6a <schedule_sjf+0x1a8>
        if (interval > executing_time) continue;
    1e5c:	0001                	nop
    1e5e:	a031                	j	1e6a <schedule_sjf+0x1a8>
        if (current_time + shortest_thread->remaining_time < cur->release_time || interval > executing_time) continue; 
    1e60:	0001                	nop
    1e62:	a021                	j	1e6a <schedule_sjf+0x1a8>
        if (remaining_time < cur->thrd->processing_time) continue;
    1e64:	0001                	nop
    1e66:	a011                	j	1e6a <schedule_sjf+0x1a8>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    1e68:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1e6a:	fb843783          	ld	a5,-72(s0)
    1e6e:	679c                	ld	a5,8(a5)
    1e70:	f8f43823          	sd	a5,-112(s0)
    1e74:	f9043783          	ld	a5,-112(s0)
    1e78:	17e1                	addi	a5,a5,-8
    1e7a:	faf43c23          	sd	a5,-72(s0)
    1e7e:	fb843783          	ld	a5,-72(s0)
    1e82:	00878713          	addi	a4,a5,8
    1e86:	689c                	ld	a5,16(s1)
    1e88:	f2f71be3          	bne	a4,a5,1dbe <schedule_sjf+0xfc>
    }

    return (struct threads_sched_result) { .scheduled_thread_list_member = &shortest_thread->thread_list, .allocated_time = executing_time };
    1e8c:	fc843783          	ld	a5,-56(s0)
    1e90:	02878793          	addi	a5,a5,40
    1e94:	f6f43c23          	sd	a5,-136(s0)
    1e98:	fb442783          	lw	a5,-76(s0)
    1e9c:	f8f42023          	sw	a5,-128(s0)
    1ea0:	4701                	li	a4,0
    1ea2:	f7843703          	ld	a4,-136(s0)
    1ea6:	4781                	li	a5,0
    1ea8:	f8043783          	ld	a5,-128(s0)
    1eac:	893a                	mv	s2,a4
    1eae:	89be                	mv	s3,a5
    1eb0:	874a                	mv	a4,s2
    1eb2:	87ce                	mv	a5,s3
}
    1eb4:	853a                	mv	a0,a4
    1eb6:	85be                	mv	a1,a5
    1eb8:	70ea                	ld	ra,184(sp)
    1eba:	744a                	ld	s0,176(sp)
    1ebc:	74aa                	ld	s1,168(sp)
    1ebe:	790a                	ld	s2,160(sp)
    1ec0:	69ea                	ld	s3,152(sp)
    1ec2:	6129                	addi	sp,sp,192
    1ec4:	8082                	ret

0000000000001ec6 <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    1ec6:	7111                	addi	sp,sp,-256
    1ec8:	fd86                	sd	ra,248(sp)
    1eca:	f9a2                	sd	s0,240(sp)
    1ecc:	f5a6                	sd	s1,232(sp)
    1ece:	f1ca                	sd	s2,224(sp)
    1ed0:	edce                	sd	s3,216(sp)
    1ed2:	0200                	addi	s0,sp,256
    1ed4:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    1ed6:	649c                	ld	a5,8(s1)
    1ed8:	853e                	mv	a0,a5
    1eda:	00000097          	auipc	ra,0x0
    1ede:	b2e080e7          	jalr	-1234(ra) # 1a08 <list_empty>
    1ee2:	87aa                	mv	a5,a0
    1ee4:	cb85                	beqz	a5,1f14 <schedule_lst+0x4e>
        return fill_sparse(args);
    1ee6:	609c                	ld	a5,0(s1)
    1ee8:	f0f43023          	sd	a5,-256(s0)
    1eec:	649c                	ld	a5,8(s1)
    1eee:	f0f43423          	sd	a5,-248(s0)
    1ef2:	689c                	ld	a5,16(s1)
    1ef4:	f0f43823          	sd	a5,-240(s0)
    1ef8:	f0040793          	addi	a5,s0,-256
    1efc:	853e                	mv	a0,a5
    1efe:	00000097          	auipc	ra,0x0
    1f02:	b34080e7          	jalr	-1228(ra) # 1a32 <fill_sparse>
    1f06:	872a                	mv	a4,a0
    1f08:	87ae                	mv	a5,a1
    1f0a:	f4e43c23          	sd	a4,-168(s0)
    1f0e:	f6f43023          	sd	a5,-160(s0)
    1f12:	ac41                	j	21a2 <schedule_lst+0x2dc>

    int current_time = args.current_time;
    1f14:	409c                	lw	a5,0(s1)
    1f16:	faf42823          	sw	a5,-80(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    1f1a:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1f1e:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1f22:	649c                	ld	a5,8(s1)
    1f24:	639c                	ld	a5,0(a5)
    1f26:	faf43423          	sd	a5,-88(s0)
    1f2a:	fa843783          	ld	a5,-88(s0)
    1f2e:	fd878793          	addi	a5,a5,-40
    1f32:	fcf43023          	sd	a5,-64(s0)
    1f36:	a0c1                	j	1ff6 <schedule_lst+0x130>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    1f38:	fc043783          	ld	a5,-64(s0)
    1f3c:	4ff8                	lw	a4,92(a5)
    1f3e:	fb042783          	lw	a5,-80(s0)
    1f42:	40f707bb          	subw	a5,a4,a5
    1f46:	0007871b          	sext.w	a4,a5
    1f4a:	fc043783          	ld	a5,-64(s0)
    1f4e:	4fbc                	lw	a5,88(a5)
    1f50:	40f707bb          	subw	a5,a4,a5
    1f54:	f6f42a23          	sw	a5,-140(s0)
        if (th->current_deadline < current_time) continue;
    1f58:	fc043783          	ld	a5,-64(s0)
    1f5c:	4ff8                	lw	a4,92(a5)
    1f5e:	fb042783          	lw	a5,-80(s0)
    1f62:	2781                	sext.w	a5,a5
    1f64:	06f74d63          	blt	a4,a5,1fde <schedule_lst+0x118>
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    1f68:	fc843783          	ld	a5,-56(s0)
    1f6c:	c38d                	beqz	a5,1f8e <schedule_lst+0xc8>
    1f6e:	fc843783          	ld	a5,-56(s0)
    1f72:	4ff8                	lw	a4,92(a5)
    1f74:	fb042783          	lw	a5,-80(s0)
    1f78:	40f707bb          	subw	a5,a4,a5
    1f7c:	0007871b          	sext.w	a4,a5
    1f80:	fc843783          	ld	a5,-56(s0)
    1f84:	4fbc                	lw	a5,88(a5)
    1f86:	40f707bb          	subw	a5,a4,a5
    1f8a:	2781                	sext.w	a5,a5
    1f8c:	a011                	j	1f90 <schedule_lst+0xca>
    1f8e:	4781                	li	a5,0
    1f90:	f6f42823          	sw	a5,-144(s0)
        if (least_slack_thread == NULL || slack_time < least_slack_time) {
    1f94:	fc843783          	ld	a5,-56(s0)
    1f98:	cb89                	beqz	a5,1faa <schedule_lst+0xe4>
    1f9a:	f7442703          	lw	a4,-140(s0)
    1f9e:	f7042783          	lw	a5,-144(s0)
    1fa2:	2701                	sext.w	a4,a4
    1fa4:	2781                	sext.w	a5,a5
    1fa6:	00f75763          	bge	a4,a5,1fb4 <schedule_lst+0xee>
            least_slack_thread = th;
    1faa:	fc043783          	ld	a5,-64(s0)
    1fae:	fcf43423          	sd	a5,-56(s0)
    1fb2:	a03d                	j	1fe0 <schedule_lst+0x11a>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    1fb4:	f7442703          	lw	a4,-140(s0)
    1fb8:	f7042783          	lw	a5,-144(s0)
    1fbc:	2701                	sext.w	a4,a4
    1fbe:	2781                	sext.w	a5,a5
    1fc0:	02f71063          	bne	a4,a5,1fe0 <schedule_lst+0x11a>
    1fc4:	fc043783          	ld	a5,-64(s0)
    1fc8:	5fd8                	lw	a4,60(a5)
    1fca:	fc843783          	ld	a5,-56(s0)
    1fce:	5fdc                	lw	a5,60(a5)
    1fd0:	00f75863          	bge	a4,a5,1fe0 <schedule_lst+0x11a>
            least_slack_thread = th;
    1fd4:	fc043783          	ld	a5,-64(s0)
    1fd8:	fcf43423          	sd	a5,-56(s0)
    1fdc:	a011                	j	1fe0 <schedule_lst+0x11a>
        if (th->current_deadline < current_time) continue;
    1fde:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1fe0:	fc043783          	ld	a5,-64(s0)
    1fe4:	779c                	ld	a5,40(a5)
    1fe6:	f6f43423          	sd	a5,-152(s0)
    1fea:	f6843783          	ld	a5,-152(s0)
    1fee:	fd878793          	addi	a5,a5,-40
    1ff2:	fcf43023          	sd	a5,-64(s0)
    1ff6:	fc043783          	ld	a5,-64(s0)
    1ffa:	02878713          	addi	a4,a5,40
    1ffe:	649c                	ld	a5,8(s1)
    2000:	f2f71ce3          	bne	a4,a5,1f38 <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread == NULL) {
    2004:	fc843783          	ld	a5,-56(s0)
    2008:	e7b5                	bnez	a5,2074 <schedule_lst+0x1ae>
        list_for_each_entry(th, args.run_queue, thread_list) {
    200a:	649c                	ld	a5,8(s1)
    200c:	639c                	ld	a5,0(a5)
    200e:	f8f43023          	sd	a5,-128(s0)
    2012:	f8043783          	ld	a5,-128(s0)
    2016:	fd878793          	addi	a5,a5,-40
    201a:	fcf43023          	sd	a5,-64(s0)
    201e:	a81d                	j	2054 <schedule_lst+0x18e>
            if (least_slack_thread == NULL || th->ID < least_slack_thread->ID)
    2020:	fc843783          	ld	a5,-56(s0)
    2024:	cb89                	beqz	a5,2036 <schedule_lst+0x170>
    2026:	fc043783          	ld	a5,-64(s0)
    202a:	5fd8                	lw	a4,60(a5)
    202c:	fc843783          	ld	a5,-56(s0)
    2030:	5fdc                	lw	a5,60(a5)
    2032:	00f75663          	bge	a4,a5,203e <schedule_lst+0x178>
                least_slack_thread = th;
    2036:	fc043783          	ld	a5,-64(s0)
    203a:	fcf43423          	sd	a5,-56(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    203e:	fc043783          	ld	a5,-64(s0)
    2042:	779c                	ld	a5,40(a5)
    2044:	f6f43c23          	sd	a5,-136(s0)
    2048:	f7843783          	ld	a5,-136(s0)
    204c:	fd878793          	addi	a5,a5,-40
    2050:	fcf43023          	sd	a5,-64(s0)
    2054:	fc043783          	ld	a5,-64(s0)
    2058:	02878713          	addi	a4,a5,40
    205c:	649c                	ld	a5,8(s1)
    205e:	fcf711e3          	bne	a4,a5,2020 <schedule_lst+0x15a>
        }
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    2062:	fc843783          	ld	a5,-56(s0)
    2066:	02878793          	addi	a5,a5,40
    206a:	f4f43c23          	sd	a5,-168(s0)
    206e:	f6042023          	sw	zero,-160(s0)
    2072:	aa05                	j	21a2 <schedule_lst+0x2dc>
    }
    
    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    2074:	fc843783          	ld	a5,-56(s0)
    2078:	4fb4                	lw	a3,88(a5)
    207a:	fc843783          	ld	a5,-56(s0)
    207e:	4ff8                	lw	a4,92(a5)
    2080:	fb042783          	lw	a5,-80(s0)
    2084:	40f707bb          	subw	a5,a4,a5
    2088:	2781                	sext.w	a5,a5
    208a:	8736                	mv	a4,a3
    208c:	02e7d363          	bge	a5,a4,20b2 <schedule_lst+0x1ec>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = least_slack_thread->current_deadline - current_time };
    2090:	fc843783          	ld	a5,-56(s0)
    2094:	02878713          	addi	a4,a5,40
    2098:	fc843783          	ld	a5,-56(s0)
    209c:	4ff4                	lw	a3,92(a5)
    209e:	fb042783          	lw	a5,-80(s0)
    20a2:	40f687bb          	subw	a5,a3,a5
    20a6:	2781                	sext.w	a5,a5
    20a8:	f4e43c23          	sd	a4,-168(s0)
    20ac:	f6f42023          	sw	a5,-160(s0)
    20b0:	a8cd                	j	21a2 <schedule_lst+0x2dc>
    
    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    20b2:	fc843783          	ld	a5,-56(s0)
    20b6:	4ff8                	lw	a4,92(a5)
    20b8:	fb042783          	lw	a5,-80(s0)
    20bc:	40f707bb          	subw	a5,a4,a5
    20c0:	0007871b          	sext.w	a4,a5
    20c4:	fc843783          	ld	a5,-56(s0)
    20c8:	4fbc                	lw	a5,88(a5)
    20ca:	40f707bb          	subw	a5,a4,a5
    20ce:	faf42223          	sw	a5,-92(s0)
    int executing_time = least_slack_thread->remaining_time;
    20d2:	fc843783          	ld	a5,-56(s0)
    20d6:	4fbc                	lw	a5,88(a5)
    20d8:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    20dc:	689c                	ld	a5,16(s1)
    20de:	639c                	ld	a5,0(a5)
    20e0:	f8f43c23          	sd	a5,-104(s0)
    20e4:	f9843783          	ld	a5,-104(s0)
    20e8:	17e1                	addi	a5,a5,-8
    20ea:	faf43c23          	sd	a5,-72(s0)
    20ee:	a849                	j	2180 <schedule_lst+0x2ba>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    20f0:	fb843783          	ld	a5,-72(s0)
    20f4:	639c                	ld	a5,0(a5)
    20f6:	47f8                	lw	a4,76(a5)
    20f8:	fb843783          	ld	a5,-72(s0)
    20fc:	639c                	ld	a5,0(a5)
    20fe:	43fc                	lw	a5,68(a5)
    2100:	40f707bb          	subw	a5,a4,a5
    2104:	f8f42a23          	sw	a5,-108(s0)
        int interval = cur->release_time - current_time;
    2108:	fb843783          	ld	a5,-72(s0)
    210c:	4f98                	lw	a4,24(a5)
    210e:	fb042783          	lw	a5,-80(s0)
    2112:	40f707bb          	subw	a5,a4,a5
    2116:	f8f42823          	sw	a5,-112(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    211a:	f9042703          	lw	a4,-112(s0)
    211e:	fb442783          	lw	a5,-76(s0)
    2122:	2701                	sext.w	a4,a4
    2124:	2781                	sext.w	a5,a5
    2126:	04e7c063          	blt	a5,a4,2166 <schedule_lst+0x2a0>
    212a:	fa442703          	lw	a4,-92(s0)
    212e:	f9442783          	lw	a5,-108(s0)
    2132:	2701                	sext.w	a4,a4
    2134:	2781                	sext.w	a5,a5
    2136:	02f74863          	blt	a4,a5,2166 <schedule_lst+0x2a0>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    213a:	fa442703          	lw	a4,-92(s0)
    213e:	f9442783          	lw	a5,-108(s0)
    2142:	2701                	sext.w	a4,a4
    2144:	2781                	sext.w	a5,a5
    2146:	00f71b63          	bne	a4,a5,215c <schedule_lst+0x296>
    214a:	fc843783          	ld	a5,-56(s0)
    214e:	5fd8                	lw	a4,60(a5)
    2150:	fb843783          	ld	a5,-72(s0)
    2154:	639c                	ld	a5,0(a5)
    2156:	5fdc                	lw	a5,60(a5)
    2158:	00f74963          	blt	a4,a5,216a <schedule_lst+0x2a4>
        executing_time = interval;
    215c:	f9042783          	lw	a5,-112(s0)
    2160:	faf42a23          	sw	a5,-76(s0)
    2164:	a021                	j	216c <schedule_lst+0x2a6>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    2166:	0001                	nop
    2168:	a011                	j	216c <schedule_lst+0x2a6>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    216a:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    216c:	fb843783          	ld	a5,-72(s0)
    2170:	679c                	ld	a5,8(a5)
    2172:	f8f43423          	sd	a5,-120(s0)
    2176:	f8843783          	ld	a5,-120(s0)
    217a:	17e1                	addi	a5,a5,-8
    217c:	faf43c23          	sd	a5,-72(s0)
    2180:	fb843783          	ld	a5,-72(s0)
    2184:	00878713          	addi	a4,a5,8
    2188:	689c                	ld	a5,16(s1)
    218a:	f6f713e3          	bne	a4,a5,20f0 <schedule_lst+0x22a>
    }
    return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = executing_time };
    218e:	fc843783          	ld	a5,-56(s0)
    2192:	02878793          	addi	a5,a5,40
    2196:	f4f43c23          	sd	a5,-168(s0)
    219a:	fb442783          	lw	a5,-76(s0)
    219e:	f6f42023          	sw	a5,-160(s0)
    21a2:	4701                	li	a4,0
    21a4:	f5843703          	ld	a4,-168(s0)
    21a8:	4781                	li	a5,0
    21aa:	f6043783          	ld	a5,-160(s0)
    21ae:	893a                	mv	s2,a4
    21b0:	89be                	mv	s3,a5
    21b2:	874a                	mv	a4,s2
    21b4:	87ce                	mv	a5,s3
}
    21b6:	853a                	mv	a0,a4
    21b8:	85be                	mv	a1,a5
    21ba:	70ee                	ld	ra,248(sp)
    21bc:	744e                	ld	s0,240(sp)
    21be:	74ae                	ld	s1,232(sp)
    21c0:	790e                	ld	s2,224(sp)
    21c2:	69ee                	ld	s3,216(sp)
    21c4:	6111                	addi	sp,sp,256
    21c6:	8082                	ret

00000000000021c8 <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    21c8:	7155                	addi	sp,sp,-208
    21ca:	e586                	sd	ra,200(sp)
    21cc:	e1a2                	sd	s0,192(sp)
    21ce:	fd26                	sd	s1,184(sp)
    21d0:	f94a                	sd	s2,176(sp)
    21d2:	f54e                	sd	s3,168(sp)
    21d4:	0980                	addi	s0,sp,208
    21d6:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.
    int current_time = args.current_time;
    21d8:	409c                	lw	a5,0(s1)
    21da:	faf42823          	sw	a5,-80(s0)

    struct thread *highest_priority_thread = NULL;
    21de:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    21e2:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    21e6:	649c                	ld	a5,8(s1)
    21e8:	639c                	ld	a5,0(a5)
    21ea:	faf43423          	sd	a5,-88(s0)
    21ee:	fa843783          	ld	a5,-88(s0)
    21f2:	fd878793          	addi	a5,a5,-40
    21f6:	fcf43023          	sd	a5,-64(s0)
    21fa:	a085                	j	225a <schedule_dm+0x92>
        if (highest_priority_thread == NULL || th->deadline < highest_priority_thread->deadline) {
    21fc:	fc843783          	ld	a5,-56(s0)
    2200:	cb89                	beqz	a5,2212 <schedule_dm+0x4a>
    2202:	fc043783          	ld	a5,-64(s0)
    2206:	47f8                	lw	a4,76(a5)
    2208:	fc843783          	ld	a5,-56(s0)
    220c:	47fc                	lw	a5,76(a5)
    220e:	00f75763          	bge	a4,a5,221c <schedule_dm+0x54>
            highest_priority_thread = th;
    2212:	fc043783          	ld	a5,-64(s0)
    2216:	fcf43423          	sd	a5,-56(s0)
    221a:	a02d                	j	2244 <schedule_dm+0x7c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    221c:	fc043783          	ld	a5,-64(s0)
    2220:	47f8                	lw	a4,76(a5)
    2222:	fc843783          	ld	a5,-56(s0)
    2226:	47fc                	lw	a5,76(a5)
    2228:	00f71e63          	bne	a4,a5,2244 <schedule_dm+0x7c>
    222c:	fc043783          	ld	a5,-64(s0)
    2230:	5fd8                	lw	a4,60(a5)
    2232:	fc843783          	ld	a5,-56(s0)
    2236:	5fdc                	lw	a5,60(a5)
    2238:	00f75663          	bge	a4,a5,2244 <schedule_dm+0x7c>
            highest_priority_thread = th;
    223c:	fc043783          	ld	a5,-64(s0)
    2240:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    2244:	fc043783          	ld	a5,-64(s0)
    2248:	779c                	ld	a5,40(a5)
    224a:	f8f43423          	sd	a5,-120(s0)
    224e:	f8843783          	ld	a5,-120(s0)
    2252:	fd878793          	addi	a5,a5,-40
    2256:	fcf43023          	sd	a5,-64(s0)
    225a:	fc043783          	ld	a5,-64(s0)
    225e:	02878713          	addi	a4,a5,40
    2262:	649c                	ld	a5,8(s1)
    2264:	f8f71ce3          	bne	a4,a5,21fc <schedule_dm+0x34>
        }
    }
    
    // no thread in the run queue
    if (highest_priority_thread == NULL) 
    2268:	fc843783          	ld	a5,-56(s0)
    226c:	eb85                	bnez	a5,229c <schedule_dm+0xd4>
        return fill_sparse(args);
    226e:	609c                	ld	a5,0(s1)
    2270:	f2f43823          	sd	a5,-208(s0)
    2274:	649c                	ld	a5,8(s1)
    2276:	f2f43c23          	sd	a5,-200(s0)
    227a:	689c                	ld	a5,16(s1)
    227c:	f4f43023          	sd	a5,-192(s0)
    2280:	f3040793          	addi	a5,s0,-208
    2284:	853e                	mv	a0,a5
    2286:	fffff097          	auipc	ra,0xfffff
    228a:	7ac080e7          	jalr	1964(ra) # 1a32 <fill_sparse>
    228e:	872a                	mv	a4,a0
    2290:	87ae                	mv	a5,a1
    2292:	f6e43c23          	sd	a4,-136(s0)
    2296:	f8f43023          	sd	a5,-128(s0)
    229a:	a8cd                	j	238c <schedule_dm+0x1c4>
    
    // missing the deadline
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    229c:	fc843783          	ld	a5,-56(s0)
    22a0:	4fb4                	lw	a3,88(a5)
    22a2:	fc843783          	ld	a5,-56(s0)
    22a6:	4ff8                	lw	a4,92(a5)
    22a8:	fb042783          	lw	a5,-80(s0)
    22ac:	40f707bb          	subw	a5,a4,a5
    22b0:	2781                	sext.w	a5,a5
    22b2:	8736                	mv	a4,a3
    22b4:	00e7db63          	bge	a5,a4,22ca <schedule_dm+0x102>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    22b8:	fc843783          	ld	a5,-56(s0)
    22bc:	02878793          	addi	a5,a5,40
    22c0:	f6f43c23          	sd	a5,-136(s0)
    22c4:	f8042023          	sw	zero,-128(s0)
    22c8:	a0d1                	j	238c <schedule_dm+0x1c4>
    
    struct release_queue_entry *cur;
    int executing_time = highest_priority_thread->remaining_time;
    22ca:	fc843783          	ld	a5,-56(s0)
    22ce:	4fbc                	lw	a5,88(a5)
    22d0:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    22d4:	689c                	ld	a5,16(s1)
    22d6:	639c                	ld	a5,0(a5)
    22d8:	faf43023          	sd	a5,-96(s0)
    22dc:	fa043783          	ld	a5,-96(s0)
    22e0:	17e1                	addi	a5,a5,-8
    22e2:	faf43c23          	sd	a5,-72(s0)
    22e6:	a051                	j	236a <schedule_dm+0x1a2>
        int interval = cur->release_time - current_time;
    22e8:	fb843783          	ld	a5,-72(s0)
    22ec:	4f98                	lw	a4,24(a5)
    22ee:	fb042783          	lw	a5,-80(s0)
    22f2:	40f707bb          	subw	a5,a4,a5
    22f6:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    22fa:	f9c42703          	lw	a4,-100(s0)
    22fe:	fb442783          	lw	a5,-76(s0)
    2302:	2701                	sext.w	a4,a4
    2304:	2781                	sext.w	a5,a5
    2306:	04e7c763          	blt	a5,a4,2354 <schedule_dm+0x18c>
        if (highest_priority_thread->deadline > cur->thrd->deadline) {
    230a:	fc843783          	ld	a5,-56(s0)
    230e:	47f8                	lw	a4,76(a5)
    2310:	fb843783          	ld	a5,-72(s0)
    2314:	639c                	ld	a5,0(a5)
    2316:	47fc                	lw	a5,76(a5)
    2318:	00e7d763          	bge	a5,a4,2326 <schedule_dm+0x15e>
            executing_time = interval;
    231c:	f9c42783          	lw	a5,-100(s0)
    2320:	faf42a23          	sw	a5,-76(s0)
    2324:	a80d                	j	2356 <schedule_dm+0x18e>
        }
        else if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID > cur->thrd->ID) {
    2326:	fc843783          	ld	a5,-56(s0)
    232a:	47f8                	lw	a4,76(a5)
    232c:	fb843783          	ld	a5,-72(s0)
    2330:	639c                	ld	a5,0(a5)
    2332:	47fc                	lw	a5,76(a5)
    2334:	02f71163          	bne	a4,a5,2356 <schedule_dm+0x18e>
    2338:	fc843783          	ld	a5,-56(s0)
    233c:	5fd8                	lw	a4,60(a5)
    233e:	fb843783          	ld	a5,-72(s0)
    2342:	639c                	ld	a5,0(a5)
    2344:	5fdc                	lw	a5,60(a5)
    2346:	00e7d863          	bge	a5,a4,2356 <schedule_dm+0x18e>
            executing_time = interval;
    234a:	f9c42783          	lw	a5,-100(s0)
    234e:	faf42a23          	sw	a5,-76(s0)
    2352:	a011                	j	2356 <schedule_dm+0x18e>
        if (interval > executing_time) continue;
    2354:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    2356:	fb843783          	ld	a5,-72(s0)
    235a:	679c                	ld	a5,8(a5)
    235c:	f8f43823          	sd	a5,-112(s0)
    2360:	f9043783          	ld	a5,-112(s0)
    2364:	17e1                	addi	a5,a5,-8
    2366:	faf43c23          	sd	a5,-72(s0)
    236a:	fb843783          	ld	a5,-72(s0)
    236e:	00878713          	addi	a4,a5,8
    2372:	689c                	ld	a5,16(s1)
    2374:	f6f71ae3          	bne	a4,a5,22e8 <schedule_dm+0x120>
        }
    }
    
    return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = executing_time };
    2378:	fc843783          	ld	a5,-56(s0)
    237c:	02878793          	addi	a5,a5,40
    2380:	f6f43c23          	sd	a5,-136(s0)
    2384:	fb442783          	lw	a5,-76(s0)
    2388:	f8f42023          	sw	a5,-128(s0)
    238c:	4701                	li	a4,0
    238e:	f7843703          	ld	a4,-136(s0)
    2392:	4781                	li	a5,0
    2394:	f8043783          	ld	a5,-128(s0)
    2398:	893a                	mv	s2,a4
    239a:	89be                	mv	s3,a5
    239c:	874a                	mv	a4,s2
    239e:	87ce                	mv	a5,s3
}
    23a0:	853a                	mv	a0,a4
    23a2:	85be                	mv	a1,a5
    23a4:	60ae                	ld	ra,200(sp)
    23a6:	640e                	ld	s0,192(sp)
    23a8:	74ea                	ld	s1,184(sp)
    23aa:	794a                	ld	s2,176(sp)
    23ac:	79aa                	ld	s3,168(sp)
    23ae:	6169                	addi	sp,sp,208
    23b0:	8082                	ret
