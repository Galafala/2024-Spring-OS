
user/_stressfs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/fs.h"
#include "kernel/fcntl.h"

int
main(int argc, char *argv[])
{
       0:	dc010113          	addi	sp,sp,-576
       4:	22113c23          	sd	ra,568(sp)
       8:	22813823          	sd	s0,560(sp)
       c:	0480                	addi	s0,sp,576
       e:	87aa                	mv	a5,a0
      10:	dcb43023          	sd	a1,-576(s0)
      14:	dcf42623          	sw	a5,-564(s0)
  int fd, i;
  char path[] = "stressfs0";
      18:	00002797          	auipc	a5,0x2
      1c:	98878793          	addi	a5,a5,-1656 # 19a0 <schedule_dm+0x2ba>
      20:	6398                	ld	a4,0(a5)
      22:	fce43c23          	sd	a4,-40(s0)
      26:	0087d783          	lhu	a5,8(a5)
      2a:	fef41023          	sh	a5,-32(s0)
  char data[512];

  printf("stressfs starting\n");
      2e:	00002517          	auipc	a0,0x2
      32:	94250513          	addi	a0,a0,-1726 # 1970 <schedule_dm+0x28a>
      36:	00001097          	auipc	ra,0x1
      3a:	b2a080e7          	jalr	-1238(ra) # b60 <printf>
  memset(data, 'a', sizeof(data));
      3e:	dd840793          	addi	a5,s0,-552
      42:	20000613          	li	a2,512
      46:	06100593          	li	a1,97
      4a:	853e                	mv	a0,a5
      4c:	00000097          	auipc	ra,0x0
      50:	224080e7          	jalr	548(ra) # 270 <memset>

  for(i = 0; i < 4; i++)
      54:	fe042623          	sw	zero,-20(s0)
      58:	a829                	j	72 <main+0x72>
    if(fork() > 0)
      5a:	00000097          	auipc	ra,0x0
      5e:	5b8080e7          	jalr	1464(ra) # 612 <fork>
      62:	87aa                	mv	a5,a0
      64:	00f04f63          	bgtz	a5,82 <main+0x82>
  for(i = 0; i < 4; i++)
      68:	fec42783          	lw	a5,-20(s0)
      6c:	2785                	addiw	a5,a5,1
      6e:	fef42623          	sw	a5,-20(s0)
      72:	fec42783          	lw	a5,-20(s0)
      76:	0007871b          	sext.w	a4,a5
      7a:	478d                	li	a5,3
      7c:	fce7dfe3          	bge	a5,a4,5a <main+0x5a>
      80:	a011                	j	84 <main+0x84>
      break;
      82:	0001                	nop

  printf("write %d\n", i);
      84:	fec42783          	lw	a5,-20(s0)
      88:	85be                	mv	a1,a5
      8a:	00002517          	auipc	a0,0x2
      8e:	8fe50513          	addi	a0,a0,-1794 # 1988 <schedule_dm+0x2a2>
      92:	00001097          	auipc	ra,0x1
      96:	ace080e7          	jalr	-1330(ra) # b60 <printf>

  path[8] += i;
      9a:	fe044703          	lbu	a4,-32(s0)
      9e:	fec42783          	lw	a5,-20(s0)
      a2:	0ff7f793          	andi	a5,a5,255
      a6:	9fb9                	addw	a5,a5,a4
      a8:	0ff7f793          	andi	a5,a5,255
      ac:	fef40023          	sb	a5,-32(s0)
  fd = open(path, O_CREATE | O_RDWR);
      b0:	fd840793          	addi	a5,s0,-40
      b4:	20200593          	li	a1,514
      b8:	853e                	mv	a0,a5
      ba:	00000097          	auipc	ra,0x0
      be:	5a0080e7          	jalr	1440(ra) # 65a <open>
      c2:	87aa                	mv	a5,a0
      c4:	fef42423          	sw	a5,-24(s0)
  for(i = 0; i < 20; i++)
      c8:	fe042623          	sw	zero,-20(s0)
      cc:	a015                	j	f0 <main+0xf0>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
      ce:	dd840713          	addi	a4,s0,-552
      d2:	fe842783          	lw	a5,-24(s0)
      d6:	20000613          	li	a2,512
      da:	85ba                	mv	a1,a4
      dc:	853e                	mv	a0,a5
      de:	00000097          	auipc	ra,0x0
      e2:	55c080e7          	jalr	1372(ra) # 63a <write>
  for(i = 0; i < 20; i++)
      e6:	fec42783          	lw	a5,-20(s0)
      ea:	2785                	addiw	a5,a5,1
      ec:	fef42623          	sw	a5,-20(s0)
      f0:	fec42783          	lw	a5,-20(s0)
      f4:	0007871b          	sext.w	a4,a5
      f8:	47cd                	li	a5,19
      fa:	fce7dae3          	bge	a5,a4,ce <main+0xce>
  close(fd);
      fe:	fe842783          	lw	a5,-24(s0)
     102:	853e                	mv	a0,a5
     104:	00000097          	auipc	ra,0x0
     108:	53e080e7          	jalr	1342(ra) # 642 <close>

  printf("read\n");
     10c:	00002517          	auipc	a0,0x2
     110:	88c50513          	addi	a0,a0,-1908 # 1998 <schedule_dm+0x2b2>
     114:	00001097          	auipc	ra,0x1
     118:	a4c080e7          	jalr	-1460(ra) # b60 <printf>

  fd = open(path, O_RDONLY);
     11c:	fd840793          	addi	a5,s0,-40
     120:	4581                	li	a1,0
     122:	853e                	mv	a0,a5
     124:	00000097          	auipc	ra,0x0
     128:	536080e7          	jalr	1334(ra) # 65a <open>
     12c:	87aa                	mv	a5,a0
     12e:	fef42423          	sw	a5,-24(s0)
  for (i = 0; i < 20; i++)
     132:	fe042623          	sw	zero,-20(s0)
     136:	a015                	j	15a <main+0x15a>
    read(fd, data, sizeof(data));
     138:	dd840713          	addi	a4,s0,-552
     13c:	fe842783          	lw	a5,-24(s0)
     140:	20000613          	li	a2,512
     144:	85ba                	mv	a1,a4
     146:	853e                	mv	a0,a5
     148:	00000097          	auipc	ra,0x0
     14c:	4ea080e7          	jalr	1258(ra) # 632 <read>
  for (i = 0; i < 20; i++)
     150:	fec42783          	lw	a5,-20(s0)
     154:	2785                	addiw	a5,a5,1
     156:	fef42623          	sw	a5,-20(s0)
     15a:	fec42783          	lw	a5,-20(s0)
     15e:	0007871b          	sext.w	a4,a5
     162:	47cd                	li	a5,19
     164:	fce7dae3          	bge	a5,a4,138 <main+0x138>
  close(fd);
     168:	fe842783          	lw	a5,-24(s0)
     16c:	853e                	mv	a0,a5
     16e:	00000097          	auipc	ra,0x0
     172:	4d4080e7          	jalr	1236(ra) # 642 <close>

  wait(0);
     176:	4501                	li	a0,0
     178:	00000097          	auipc	ra,0x0
     17c:	4aa080e7          	jalr	1194(ra) # 622 <wait>

  exit(0);
     180:	4501                	li	a0,0
     182:	00000097          	auipc	ra,0x0
     186:	498080e7          	jalr	1176(ra) # 61a <exit>

000000000000018a <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     18a:	7179                	addi	sp,sp,-48
     18c:	f422                	sd	s0,40(sp)
     18e:	1800                	addi	s0,sp,48
     190:	fca43c23          	sd	a0,-40(s0)
     194:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     198:	fd843783          	ld	a5,-40(s0)
     19c:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     1a0:	0001                	nop
     1a2:	fd043703          	ld	a4,-48(s0)
     1a6:	00170793          	addi	a5,a4,1
     1aa:	fcf43823          	sd	a5,-48(s0)
     1ae:	fd843783          	ld	a5,-40(s0)
     1b2:	00178693          	addi	a3,a5,1
     1b6:	fcd43c23          	sd	a3,-40(s0)
     1ba:	00074703          	lbu	a4,0(a4)
     1be:	00e78023          	sb	a4,0(a5)
     1c2:	0007c783          	lbu	a5,0(a5)
     1c6:	fff1                	bnez	a5,1a2 <strcpy+0x18>
    ;
  return os;
     1c8:	fe843783          	ld	a5,-24(s0)
}
     1cc:	853e                	mv	a0,a5
     1ce:	7422                	ld	s0,40(sp)
     1d0:	6145                	addi	sp,sp,48
     1d2:	8082                	ret

00000000000001d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     1d4:	1101                	addi	sp,sp,-32
     1d6:	ec22                	sd	s0,24(sp)
     1d8:	1000                	addi	s0,sp,32
     1da:	fea43423          	sd	a0,-24(s0)
     1de:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     1e2:	a819                	j	1f8 <strcmp+0x24>
    p++, q++;
     1e4:	fe843783          	ld	a5,-24(s0)
     1e8:	0785                	addi	a5,a5,1
     1ea:	fef43423          	sd	a5,-24(s0)
     1ee:	fe043783          	ld	a5,-32(s0)
     1f2:	0785                	addi	a5,a5,1
     1f4:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     1f8:	fe843783          	ld	a5,-24(s0)
     1fc:	0007c783          	lbu	a5,0(a5)
     200:	cb99                	beqz	a5,216 <strcmp+0x42>
     202:	fe843783          	ld	a5,-24(s0)
     206:	0007c703          	lbu	a4,0(a5)
     20a:	fe043783          	ld	a5,-32(s0)
     20e:	0007c783          	lbu	a5,0(a5)
     212:	fcf709e3          	beq	a4,a5,1e4 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     216:	fe843783          	ld	a5,-24(s0)
     21a:	0007c783          	lbu	a5,0(a5)
     21e:	0007871b          	sext.w	a4,a5
     222:	fe043783          	ld	a5,-32(s0)
     226:	0007c783          	lbu	a5,0(a5)
     22a:	2781                	sext.w	a5,a5
     22c:	40f707bb          	subw	a5,a4,a5
     230:	2781                	sext.w	a5,a5
}
     232:	853e                	mv	a0,a5
     234:	6462                	ld	s0,24(sp)
     236:	6105                	addi	sp,sp,32
     238:	8082                	ret

000000000000023a <strlen>:

uint
strlen(const char *s)
{
     23a:	7179                	addi	sp,sp,-48
     23c:	f422                	sd	s0,40(sp)
     23e:	1800                	addi	s0,sp,48
     240:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     244:	fe042623          	sw	zero,-20(s0)
     248:	a031                	j	254 <strlen+0x1a>
     24a:	fec42783          	lw	a5,-20(s0)
     24e:	2785                	addiw	a5,a5,1
     250:	fef42623          	sw	a5,-20(s0)
     254:	fec42783          	lw	a5,-20(s0)
     258:	fd843703          	ld	a4,-40(s0)
     25c:	97ba                	add	a5,a5,a4
     25e:	0007c783          	lbu	a5,0(a5)
     262:	f7e5                	bnez	a5,24a <strlen+0x10>
    ;
  return n;
     264:	fec42783          	lw	a5,-20(s0)
}
     268:	853e                	mv	a0,a5
     26a:	7422                	ld	s0,40(sp)
     26c:	6145                	addi	sp,sp,48
     26e:	8082                	ret

0000000000000270 <memset>:

void*
memset(void *dst, int c, uint n)
{
     270:	7179                	addi	sp,sp,-48
     272:	f422                	sd	s0,40(sp)
     274:	1800                	addi	s0,sp,48
     276:	fca43c23          	sd	a0,-40(s0)
     27a:	87ae                	mv	a5,a1
     27c:	8732                	mv	a4,a2
     27e:	fcf42a23          	sw	a5,-44(s0)
     282:	87ba                	mv	a5,a4
     284:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     288:	fd843783          	ld	a5,-40(s0)
     28c:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     290:	fe042623          	sw	zero,-20(s0)
     294:	a00d                	j	2b6 <memset+0x46>
    cdst[i] = c;
     296:	fec42783          	lw	a5,-20(s0)
     29a:	fe043703          	ld	a4,-32(s0)
     29e:	97ba                	add	a5,a5,a4
     2a0:	fd442703          	lw	a4,-44(s0)
     2a4:	0ff77713          	andi	a4,a4,255
     2a8:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     2ac:	fec42783          	lw	a5,-20(s0)
     2b0:	2785                	addiw	a5,a5,1
     2b2:	fef42623          	sw	a5,-20(s0)
     2b6:	fec42703          	lw	a4,-20(s0)
     2ba:	fd042783          	lw	a5,-48(s0)
     2be:	2781                	sext.w	a5,a5
     2c0:	fcf76be3          	bltu	a4,a5,296 <memset+0x26>
  }
  return dst;
     2c4:	fd843783          	ld	a5,-40(s0)
}
     2c8:	853e                	mv	a0,a5
     2ca:	7422                	ld	s0,40(sp)
     2cc:	6145                	addi	sp,sp,48
     2ce:	8082                	ret

00000000000002d0 <strchr>:

char*
strchr(const char *s, char c)
{
     2d0:	1101                	addi	sp,sp,-32
     2d2:	ec22                	sd	s0,24(sp)
     2d4:	1000                	addi	s0,sp,32
     2d6:	fea43423          	sd	a0,-24(s0)
     2da:	87ae                	mv	a5,a1
     2dc:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     2e0:	a01d                	j	306 <strchr+0x36>
    if(*s == c)
     2e2:	fe843783          	ld	a5,-24(s0)
     2e6:	0007c703          	lbu	a4,0(a5)
     2ea:	fe744783          	lbu	a5,-25(s0)
     2ee:	0ff7f793          	andi	a5,a5,255
     2f2:	00e79563          	bne	a5,a4,2fc <strchr+0x2c>
      return (char*)s;
     2f6:	fe843783          	ld	a5,-24(s0)
     2fa:	a821                	j	312 <strchr+0x42>
  for(; *s; s++)
     2fc:	fe843783          	ld	a5,-24(s0)
     300:	0785                	addi	a5,a5,1
     302:	fef43423          	sd	a5,-24(s0)
     306:	fe843783          	ld	a5,-24(s0)
     30a:	0007c783          	lbu	a5,0(a5)
     30e:	fbf1                	bnez	a5,2e2 <strchr+0x12>
  return 0;
     310:	4781                	li	a5,0
}
     312:	853e                	mv	a0,a5
     314:	6462                	ld	s0,24(sp)
     316:	6105                	addi	sp,sp,32
     318:	8082                	ret

000000000000031a <gets>:

char*
gets(char *buf, int max)
{
     31a:	7179                	addi	sp,sp,-48
     31c:	f406                	sd	ra,40(sp)
     31e:	f022                	sd	s0,32(sp)
     320:	1800                	addi	s0,sp,48
     322:	fca43c23          	sd	a0,-40(s0)
     326:	87ae                	mv	a5,a1
     328:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     32c:	fe042623          	sw	zero,-20(s0)
     330:	a8a1                	j	388 <gets+0x6e>
    cc = read(0, &c, 1);
     332:	fe740793          	addi	a5,s0,-25
     336:	4605                	li	a2,1
     338:	85be                	mv	a1,a5
     33a:	4501                	li	a0,0
     33c:	00000097          	auipc	ra,0x0
     340:	2f6080e7          	jalr	758(ra) # 632 <read>
     344:	87aa                	mv	a5,a0
     346:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     34a:	fe842783          	lw	a5,-24(s0)
     34e:	2781                	sext.w	a5,a5
     350:	04f05763          	blez	a5,39e <gets+0x84>
      break;
    buf[i++] = c;
     354:	fec42783          	lw	a5,-20(s0)
     358:	0017871b          	addiw	a4,a5,1
     35c:	fee42623          	sw	a4,-20(s0)
     360:	873e                	mv	a4,a5
     362:	fd843783          	ld	a5,-40(s0)
     366:	97ba                	add	a5,a5,a4
     368:	fe744703          	lbu	a4,-25(s0)
     36c:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     370:	fe744783          	lbu	a5,-25(s0)
     374:	873e                	mv	a4,a5
     376:	47a9                	li	a5,10
     378:	02f70463          	beq	a4,a5,3a0 <gets+0x86>
     37c:	fe744783          	lbu	a5,-25(s0)
     380:	873e                	mv	a4,a5
     382:	47b5                	li	a5,13
     384:	00f70e63          	beq	a4,a5,3a0 <gets+0x86>
  for(i=0; i+1 < max; ){
     388:	fec42783          	lw	a5,-20(s0)
     38c:	2785                	addiw	a5,a5,1
     38e:	0007871b          	sext.w	a4,a5
     392:	fd442783          	lw	a5,-44(s0)
     396:	2781                	sext.w	a5,a5
     398:	f8f74de3          	blt	a4,a5,332 <gets+0x18>
     39c:	a011                	j	3a0 <gets+0x86>
      break;
     39e:	0001                	nop
      break;
  }
  buf[i] = '\0';
     3a0:	fec42783          	lw	a5,-20(s0)
     3a4:	fd843703          	ld	a4,-40(s0)
     3a8:	97ba                	add	a5,a5,a4
     3aa:	00078023          	sb	zero,0(a5)
  return buf;
     3ae:	fd843783          	ld	a5,-40(s0)
}
     3b2:	853e                	mv	a0,a5
     3b4:	70a2                	ld	ra,40(sp)
     3b6:	7402                	ld	s0,32(sp)
     3b8:	6145                	addi	sp,sp,48
     3ba:	8082                	ret

00000000000003bc <stat>:

int
stat(const char *n, struct stat *st)
{
     3bc:	7179                	addi	sp,sp,-48
     3be:	f406                	sd	ra,40(sp)
     3c0:	f022                	sd	s0,32(sp)
     3c2:	1800                	addi	s0,sp,48
     3c4:	fca43c23          	sd	a0,-40(s0)
     3c8:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     3cc:	4581                	li	a1,0
     3ce:	fd843503          	ld	a0,-40(s0)
     3d2:	00000097          	auipc	ra,0x0
     3d6:	288080e7          	jalr	648(ra) # 65a <open>
     3da:	87aa                	mv	a5,a0
     3dc:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     3e0:	fec42783          	lw	a5,-20(s0)
     3e4:	2781                	sext.w	a5,a5
     3e6:	0007d463          	bgez	a5,3ee <stat+0x32>
    return -1;
     3ea:	57fd                	li	a5,-1
     3ec:	a035                	j	418 <stat+0x5c>
  r = fstat(fd, st);
     3ee:	fec42783          	lw	a5,-20(s0)
     3f2:	fd043583          	ld	a1,-48(s0)
     3f6:	853e                	mv	a0,a5
     3f8:	00000097          	auipc	ra,0x0
     3fc:	27a080e7          	jalr	634(ra) # 672 <fstat>
     400:	87aa                	mv	a5,a0
     402:	fef42423          	sw	a5,-24(s0)
  close(fd);
     406:	fec42783          	lw	a5,-20(s0)
     40a:	853e                	mv	a0,a5
     40c:	00000097          	auipc	ra,0x0
     410:	236080e7          	jalr	566(ra) # 642 <close>
  return r;
     414:	fe842783          	lw	a5,-24(s0)
}
     418:	853e                	mv	a0,a5
     41a:	70a2                	ld	ra,40(sp)
     41c:	7402                	ld	s0,32(sp)
     41e:	6145                	addi	sp,sp,48
     420:	8082                	ret

0000000000000422 <atoi>:

int
atoi(const char *s)
{
     422:	7179                	addi	sp,sp,-48
     424:	f422                	sd	s0,40(sp)
     426:	1800                	addi	s0,sp,48
     428:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     42c:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     430:	a815                	j	464 <atoi+0x42>
    n = n*10 + *s++ - '0';
     432:	fec42703          	lw	a4,-20(s0)
     436:	87ba                	mv	a5,a4
     438:	0027979b          	slliw	a5,a5,0x2
     43c:	9fb9                	addw	a5,a5,a4
     43e:	0017979b          	slliw	a5,a5,0x1
     442:	0007871b          	sext.w	a4,a5
     446:	fd843783          	ld	a5,-40(s0)
     44a:	00178693          	addi	a3,a5,1
     44e:	fcd43c23          	sd	a3,-40(s0)
     452:	0007c783          	lbu	a5,0(a5)
     456:	2781                	sext.w	a5,a5
     458:	9fb9                	addw	a5,a5,a4
     45a:	2781                	sext.w	a5,a5
     45c:	fd07879b          	addiw	a5,a5,-48
     460:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     464:	fd843783          	ld	a5,-40(s0)
     468:	0007c783          	lbu	a5,0(a5)
     46c:	873e                	mv	a4,a5
     46e:	02f00793          	li	a5,47
     472:	00e7fb63          	bgeu	a5,a4,488 <atoi+0x66>
     476:	fd843783          	ld	a5,-40(s0)
     47a:	0007c783          	lbu	a5,0(a5)
     47e:	873e                	mv	a4,a5
     480:	03900793          	li	a5,57
     484:	fae7f7e3          	bgeu	a5,a4,432 <atoi+0x10>
  return n;
     488:	fec42783          	lw	a5,-20(s0)
}
     48c:	853e                	mv	a0,a5
     48e:	7422                	ld	s0,40(sp)
     490:	6145                	addi	sp,sp,48
     492:	8082                	ret

0000000000000494 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     494:	7139                	addi	sp,sp,-64
     496:	fc22                	sd	s0,56(sp)
     498:	0080                	addi	s0,sp,64
     49a:	fca43c23          	sd	a0,-40(s0)
     49e:	fcb43823          	sd	a1,-48(s0)
     4a2:	87b2                	mv	a5,a2
     4a4:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     4a8:	fd843783          	ld	a5,-40(s0)
     4ac:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     4b0:	fd043783          	ld	a5,-48(s0)
     4b4:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     4b8:	fe043703          	ld	a4,-32(s0)
     4bc:	fe843783          	ld	a5,-24(s0)
     4c0:	02e7fc63          	bgeu	a5,a4,4f8 <memmove+0x64>
    while(n-- > 0)
     4c4:	a00d                	j	4e6 <memmove+0x52>
      *dst++ = *src++;
     4c6:	fe043703          	ld	a4,-32(s0)
     4ca:	00170793          	addi	a5,a4,1
     4ce:	fef43023          	sd	a5,-32(s0)
     4d2:	fe843783          	ld	a5,-24(s0)
     4d6:	00178693          	addi	a3,a5,1
     4da:	fed43423          	sd	a3,-24(s0)
     4de:	00074703          	lbu	a4,0(a4)
     4e2:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     4e6:	fcc42783          	lw	a5,-52(s0)
     4ea:	fff7871b          	addiw	a4,a5,-1
     4ee:	fce42623          	sw	a4,-52(s0)
     4f2:	fcf04ae3          	bgtz	a5,4c6 <memmove+0x32>
     4f6:	a891                	j	54a <memmove+0xb6>
  } else {
    dst += n;
     4f8:	fcc42783          	lw	a5,-52(s0)
     4fc:	fe843703          	ld	a4,-24(s0)
     500:	97ba                	add	a5,a5,a4
     502:	fef43423          	sd	a5,-24(s0)
    src += n;
     506:	fcc42783          	lw	a5,-52(s0)
     50a:	fe043703          	ld	a4,-32(s0)
     50e:	97ba                	add	a5,a5,a4
     510:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     514:	a01d                	j	53a <memmove+0xa6>
      *--dst = *--src;
     516:	fe043783          	ld	a5,-32(s0)
     51a:	17fd                	addi	a5,a5,-1
     51c:	fef43023          	sd	a5,-32(s0)
     520:	fe843783          	ld	a5,-24(s0)
     524:	17fd                	addi	a5,a5,-1
     526:	fef43423          	sd	a5,-24(s0)
     52a:	fe043783          	ld	a5,-32(s0)
     52e:	0007c703          	lbu	a4,0(a5)
     532:	fe843783          	ld	a5,-24(s0)
     536:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     53a:	fcc42783          	lw	a5,-52(s0)
     53e:	fff7871b          	addiw	a4,a5,-1
     542:	fce42623          	sw	a4,-52(s0)
     546:	fcf048e3          	bgtz	a5,516 <memmove+0x82>
  }
  return vdst;
     54a:	fd843783          	ld	a5,-40(s0)
}
     54e:	853e                	mv	a0,a5
     550:	7462                	ld	s0,56(sp)
     552:	6121                	addi	sp,sp,64
     554:	8082                	ret

0000000000000556 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     556:	7139                	addi	sp,sp,-64
     558:	fc22                	sd	s0,56(sp)
     55a:	0080                	addi	s0,sp,64
     55c:	fca43c23          	sd	a0,-40(s0)
     560:	fcb43823          	sd	a1,-48(s0)
     564:	87b2                	mv	a5,a2
     566:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     56a:	fd843783          	ld	a5,-40(s0)
     56e:	fef43423          	sd	a5,-24(s0)
     572:	fd043783          	ld	a5,-48(s0)
     576:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     57a:	a0a1                	j	5c2 <memcmp+0x6c>
    if (*p1 != *p2) {
     57c:	fe843783          	ld	a5,-24(s0)
     580:	0007c703          	lbu	a4,0(a5)
     584:	fe043783          	ld	a5,-32(s0)
     588:	0007c783          	lbu	a5,0(a5)
     58c:	02f70163          	beq	a4,a5,5ae <memcmp+0x58>
      return *p1 - *p2;
     590:	fe843783          	ld	a5,-24(s0)
     594:	0007c783          	lbu	a5,0(a5)
     598:	0007871b          	sext.w	a4,a5
     59c:	fe043783          	ld	a5,-32(s0)
     5a0:	0007c783          	lbu	a5,0(a5)
     5a4:	2781                	sext.w	a5,a5
     5a6:	40f707bb          	subw	a5,a4,a5
     5aa:	2781                	sext.w	a5,a5
     5ac:	a01d                	j	5d2 <memcmp+0x7c>
    }
    p1++;
     5ae:	fe843783          	ld	a5,-24(s0)
     5b2:	0785                	addi	a5,a5,1
     5b4:	fef43423          	sd	a5,-24(s0)
    p2++;
     5b8:	fe043783          	ld	a5,-32(s0)
     5bc:	0785                	addi	a5,a5,1
     5be:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     5c2:	fcc42783          	lw	a5,-52(s0)
     5c6:	fff7871b          	addiw	a4,a5,-1
     5ca:	fce42623          	sw	a4,-52(s0)
     5ce:	f7dd                	bnez	a5,57c <memcmp+0x26>
  }
  return 0;
     5d0:	4781                	li	a5,0
}
     5d2:	853e                	mv	a0,a5
     5d4:	7462                	ld	s0,56(sp)
     5d6:	6121                	addi	sp,sp,64
     5d8:	8082                	ret

00000000000005da <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     5da:	7179                	addi	sp,sp,-48
     5dc:	f406                	sd	ra,40(sp)
     5de:	f022                	sd	s0,32(sp)
     5e0:	1800                	addi	s0,sp,48
     5e2:	fea43423          	sd	a0,-24(s0)
     5e6:	feb43023          	sd	a1,-32(s0)
     5ea:	87b2                	mv	a5,a2
     5ec:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     5f0:	fdc42783          	lw	a5,-36(s0)
     5f4:	863e                	mv	a2,a5
     5f6:	fe043583          	ld	a1,-32(s0)
     5fa:	fe843503          	ld	a0,-24(s0)
     5fe:	00000097          	auipc	ra,0x0
     602:	e96080e7          	jalr	-362(ra) # 494 <memmove>
     606:	87aa                	mv	a5,a0
}
     608:	853e                	mv	a0,a5
     60a:	70a2                	ld	ra,40(sp)
     60c:	7402                	ld	s0,32(sp)
     60e:	6145                	addi	sp,sp,48
     610:	8082                	ret

0000000000000612 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     612:	4885                	li	a7,1
 ecall
     614:	00000073          	ecall
 ret
     618:	8082                	ret

000000000000061a <exit>:
.global exit
exit:
 li a7, SYS_exit
     61a:	4889                	li	a7,2
 ecall
     61c:	00000073          	ecall
 ret
     620:	8082                	ret

0000000000000622 <wait>:
.global wait
wait:
 li a7, SYS_wait
     622:	488d                	li	a7,3
 ecall
     624:	00000073          	ecall
 ret
     628:	8082                	ret

000000000000062a <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     62a:	4891                	li	a7,4
 ecall
     62c:	00000073          	ecall
 ret
     630:	8082                	ret

0000000000000632 <read>:
.global read
read:
 li a7, SYS_read
     632:	4895                	li	a7,5
 ecall
     634:	00000073          	ecall
 ret
     638:	8082                	ret

000000000000063a <write>:
.global write
write:
 li a7, SYS_write
     63a:	48c1                	li	a7,16
 ecall
     63c:	00000073          	ecall
 ret
     640:	8082                	ret

0000000000000642 <close>:
.global close
close:
 li a7, SYS_close
     642:	48d5                	li	a7,21
 ecall
     644:	00000073          	ecall
 ret
     648:	8082                	ret

000000000000064a <kill>:
.global kill
kill:
 li a7, SYS_kill
     64a:	4899                	li	a7,6
 ecall
     64c:	00000073          	ecall
 ret
     650:	8082                	ret

0000000000000652 <exec>:
.global exec
exec:
 li a7, SYS_exec
     652:	489d                	li	a7,7
 ecall
     654:	00000073          	ecall
 ret
     658:	8082                	ret

000000000000065a <open>:
.global open
open:
 li a7, SYS_open
     65a:	48bd                	li	a7,15
 ecall
     65c:	00000073          	ecall
 ret
     660:	8082                	ret

0000000000000662 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     662:	48c5                	li	a7,17
 ecall
     664:	00000073          	ecall
 ret
     668:	8082                	ret

000000000000066a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     66a:	48c9                	li	a7,18
 ecall
     66c:	00000073          	ecall
 ret
     670:	8082                	ret

0000000000000672 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     672:	48a1                	li	a7,8
 ecall
     674:	00000073          	ecall
 ret
     678:	8082                	ret

000000000000067a <link>:
.global link
link:
 li a7, SYS_link
     67a:	48cd                	li	a7,19
 ecall
     67c:	00000073          	ecall
 ret
     680:	8082                	ret

0000000000000682 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     682:	48d1                	li	a7,20
 ecall
     684:	00000073          	ecall
 ret
     688:	8082                	ret

000000000000068a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     68a:	48a5                	li	a7,9
 ecall
     68c:	00000073          	ecall
 ret
     690:	8082                	ret

0000000000000692 <dup>:
.global dup
dup:
 li a7, SYS_dup
     692:	48a9                	li	a7,10
 ecall
     694:	00000073          	ecall
 ret
     698:	8082                	ret

000000000000069a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     69a:	48ad                	li	a7,11
 ecall
     69c:	00000073          	ecall
 ret
     6a0:	8082                	ret

00000000000006a2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     6a2:	48b1                	li	a7,12
 ecall
     6a4:	00000073          	ecall
 ret
     6a8:	8082                	ret

00000000000006aa <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     6aa:	48b5                	li	a7,13
 ecall
     6ac:	00000073          	ecall
 ret
     6b0:	8082                	ret

00000000000006b2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     6b2:	48b9                	li	a7,14
 ecall
     6b4:	00000073          	ecall
 ret
     6b8:	8082                	ret

00000000000006ba <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     6ba:	48d9                	li	a7,22
 ecall
     6bc:	00000073          	ecall
 ret
     6c0:	8082                	ret

00000000000006c2 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     6c2:	48dd                	li	a7,23
 ecall
     6c4:	00000073          	ecall
 ret
     6c8:	8082                	ret

00000000000006ca <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     6ca:	48e1                	li	a7,24
 ecall
     6cc:	00000073          	ecall
 ret
     6d0:	8082                	ret

00000000000006d2 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     6d2:	1101                	addi	sp,sp,-32
     6d4:	ec06                	sd	ra,24(sp)
     6d6:	e822                	sd	s0,16(sp)
     6d8:	1000                	addi	s0,sp,32
     6da:	87aa                	mv	a5,a0
     6dc:	872e                	mv	a4,a1
     6de:	fef42623          	sw	a5,-20(s0)
     6e2:	87ba                	mv	a5,a4
     6e4:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     6e8:	feb40713          	addi	a4,s0,-21
     6ec:	fec42783          	lw	a5,-20(s0)
     6f0:	4605                	li	a2,1
     6f2:	85ba                	mv	a1,a4
     6f4:	853e                	mv	a0,a5
     6f6:	00000097          	auipc	ra,0x0
     6fa:	f44080e7          	jalr	-188(ra) # 63a <write>
}
     6fe:	0001                	nop
     700:	60e2                	ld	ra,24(sp)
     702:	6442                	ld	s0,16(sp)
     704:	6105                	addi	sp,sp,32
     706:	8082                	ret

0000000000000708 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     708:	7139                	addi	sp,sp,-64
     70a:	fc06                	sd	ra,56(sp)
     70c:	f822                	sd	s0,48(sp)
     70e:	0080                	addi	s0,sp,64
     710:	87aa                	mv	a5,a0
     712:	8736                	mv	a4,a3
     714:	fcf42623          	sw	a5,-52(s0)
     718:	87ae                	mv	a5,a1
     71a:	fcf42423          	sw	a5,-56(s0)
     71e:	87b2                	mv	a5,a2
     720:	fcf42223          	sw	a5,-60(s0)
     724:	87ba                	mv	a5,a4
     726:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     72a:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     72e:	fc042783          	lw	a5,-64(s0)
     732:	2781                	sext.w	a5,a5
     734:	c38d                	beqz	a5,756 <printint+0x4e>
     736:	fc842783          	lw	a5,-56(s0)
     73a:	2781                	sext.w	a5,a5
     73c:	0007dd63          	bgez	a5,756 <printint+0x4e>
    neg = 1;
     740:	4785                	li	a5,1
     742:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     746:	fc842783          	lw	a5,-56(s0)
     74a:	40f007bb          	negw	a5,a5
     74e:	2781                	sext.w	a5,a5
     750:	fef42223          	sw	a5,-28(s0)
     754:	a029                	j	75e <printint+0x56>
  } else {
    x = xx;
     756:	fc842783          	lw	a5,-56(s0)
     75a:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     75e:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     762:	fc442783          	lw	a5,-60(s0)
     766:	fe442703          	lw	a4,-28(s0)
     76a:	02f777bb          	remuw	a5,a4,a5
     76e:	0007861b          	sext.w	a2,a5
     772:	fec42783          	lw	a5,-20(s0)
     776:	0017871b          	addiw	a4,a5,1
     77a:	fee42623          	sw	a4,-20(s0)
     77e:	00001697          	auipc	a3,0x1
     782:	23a68693          	addi	a3,a3,570 # 19b8 <digits>
     786:	02061713          	slli	a4,a2,0x20
     78a:	9301                	srli	a4,a4,0x20
     78c:	9736                	add	a4,a4,a3
     78e:	00074703          	lbu	a4,0(a4)
     792:	ff040693          	addi	a3,s0,-16
     796:	97b6                	add	a5,a5,a3
     798:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     79c:	fc442783          	lw	a5,-60(s0)
     7a0:	fe442703          	lw	a4,-28(s0)
     7a4:	02f757bb          	divuw	a5,a4,a5
     7a8:	fef42223          	sw	a5,-28(s0)
     7ac:	fe442783          	lw	a5,-28(s0)
     7b0:	2781                	sext.w	a5,a5
     7b2:	fbc5                	bnez	a5,762 <printint+0x5a>
  if(neg)
     7b4:	fe842783          	lw	a5,-24(s0)
     7b8:	2781                	sext.w	a5,a5
     7ba:	cf95                	beqz	a5,7f6 <printint+0xee>
    buf[i++] = '-';
     7bc:	fec42783          	lw	a5,-20(s0)
     7c0:	0017871b          	addiw	a4,a5,1
     7c4:	fee42623          	sw	a4,-20(s0)
     7c8:	ff040713          	addi	a4,s0,-16
     7cc:	97ba                	add	a5,a5,a4
     7ce:	02d00713          	li	a4,45
     7d2:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     7d6:	a005                	j	7f6 <printint+0xee>
    putc(fd, buf[i]);
     7d8:	fec42783          	lw	a5,-20(s0)
     7dc:	ff040713          	addi	a4,s0,-16
     7e0:	97ba                	add	a5,a5,a4
     7e2:	fe07c703          	lbu	a4,-32(a5)
     7e6:	fcc42783          	lw	a5,-52(s0)
     7ea:	85ba                	mv	a1,a4
     7ec:	853e                	mv	a0,a5
     7ee:	00000097          	auipc	ra,0x0
     7f2:	ee4080e7          	jalr	-284(ra) # 6d2 <putc>
  while(--i >= 0)
     7f6:	fec42783          	lw	a5,-20(s0)
     7fa:	37fd                	addiw	a5,a5,-1
     7fc:	fef42623          	sw	a5,-20(s0)
     800:	fec42783          	lw	a5,-20(s0)
     804:	2781                	sext.w	a5,a5
     806:	fc07d9e3          	bgez	a5,7d8 <printint+0xd0>
}
     80a:	0001                	nop
     80c:	0001                	nop
     80e:	70e2                	ld	ra,56(sp)
     810:	7442                	ld	s0,48(sp)
     812:	6121                	addi	sp,sp,64
     814:	8082                	ret

0000000000000816 <printptr>:

static void
printptr(int fd, uint64 x) {
     816:	7179                	addi	sp,sp,-48
     818:	f406                	sd	ra,40(sp)
     81a:	f022                	sd	s0,32(sp)
     81c:	1800                	addi	s0,sp,48
     81e:	87aa                	mv	a5,a0
     820:	fcb43823          	sd	a1,-48(s0)
     824:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     828:	fdc42783          	lw	a5,-36(s0)
     82c:	03000593          	li	a1,48
     830:	853e                	mv	a0,a5
     832:	00000097          	auipc	ra,0x0
     836:	ea0080e7          	jalr	-352(ra) # 6d2 <putc>
  putc(fd, 'x');
     83a:	fdc42783          	lw	a5,-36(s0)
     83e:	07800593          	li	a1,120
     842:	853e                	mv	a0,a5
     844:	00000097          	auipc	ra,0x0
     848:	e8e080e7          	jalr	-370(ra) # 6d2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     84c:	fe042623          	sw	zero,-20(s0)
     850:	a82d                	j	88a <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     852:	fd043783          	ld	a5,-48(s0)
     856:	93f1                	srli	a5,a5,0x3c
     858:	00001717          	auipc	a4,0x1
     85c:	16070713          	addi	a4,a4,352 # 19b8 <digits>
     860:	97ba                	add	a5,a5,a4
     862:	0007c703          	lbu	a4,0(a5)
     866:	fdc42783          	lw	a5,-36(s0)
     86a:	85ba                	mv	a1,a4
     86c:	853e                	mv	a0,a5
     86e:	00000097          	auipc	ra,0x0
     872:	e64080e7          	jalr	-412(ra) # 6d2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     876:	fec42783          	lw	a5,-20(s0)
     87a:	2785                	addiw	a5,a5,1
     87c:	fef42623          	sw	a5,-20(s0)
     880:	fd043783          	ld	a5,-48(s0)
     884:	0792                	slli	a5,a5,0x4
     886:	fcf43823          	sd	a5,-48(s0)
     88a:	fec42783          	lw	a5,-20(s0)
     88e:	873e                	mv	a4,a5
     890:	47bd                	li	a5,15
     892:	fce7f0e3          	bgeu	a5,a4,852 <printptr+0x3c>
}
     896:	0001                	nop
     898:	0001                	nop
     89a:	70a2                	ld	ra,40(sp)
     89c:	7402                	ld	s0,32(sp)
     89e:	6145                	addi	sp,sp,48
     8a0:	8082                	ret

00000000000008a2 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     8a2:	715d                	addi	sp,sp,-80
     8a4:	e486                	sd	ra,72(sp)
     8a6:	e0a2                	sd	s0,64(sp)
     8a8:	0880                	addi	s0,sp,80
     8aa:	87aa                	mv	a5,a0
     8ac:	fcb43023          	sd	a1,-64(s0)
     8b0:	fac43c23          	sd	a2,-72(s0)
     8b4:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     8b8:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     8bc:	fe042223          	sw	zero,-28(s0)
     8c0:	a42d                	j	aea <vprintf+0x248>
    c = fmt[i] & 0xff;
     8c2:	fe442783          	lw	a5,-28(s0)
     8c6:	fc043703          	ld	a4,-64(s0)
     8ca:	97ba                	add	a5,a5,a4
     8cc:	0007c783          	lbu	a5,0(a5)
     8d0:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     8d4:	fe042783          	lw	a5,-32(s0)
     8d8:	2781                	sext.w	a5,a5
     8da:	eb9d                	bnez	a5,910 <vprintf+0x6e>
      if(c == '%'){
     8dc:	fdc42783          	lw	a5,-36(s0)
     8e0:	0007871b          	sext.w	a4,a5
     8e4:	02500793          	li	a5,37
     8e8:	00f71763          	bne	a4,a5,8f6 <vprintf+0x54>
        state = '%';
     8ec:	02500793          	li	a5,37
     8f0:	fef42023          	sw	a5,-32(s0)
     8f4:	a2f5                	j	ae0 <vprintf+0x23e>
      } else {
        putc(fd, c);
     8f6:	fdc42783          	lw	a5,-36(s0)
     8fa:	0ff7f713          	andi	a4,a5,255
     8fe:	fcc42783          	lw	a5,-52(s0)
     902:	85ba                	mv	a1,a4
     904:	853e                	mv	a0,a5
     906:	00000097          	auipc	ra,0x0
     90a:	dcc080e7          	jalr	-564(ra) # 6d2 <putc>
     90e:	aac9                	j	ae0 <vprintf+0x23e>
      }
    } else if(state == '%'){
     910:	fe042783          	lw	a5,-32(s0)
     914:	0007871b          	sext.w	a4,a5
     918:	02500793          	li	a5,37
     91c:	1cf71263          	bne	a4,a5,ae0 <vprintf+0x23e>
      if(c == 'd'){
     920:	fdc42783          	lw	a5,-36(s0)
     924:	0007871b          	sext.w	a4,a5
     928:	06400793          	li	a5,100
     92c:	02f71463          	bne	a4,a5,954 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     930:	fb843783          	ld	a5,-72(s0)
     934:	00878713          	addi	a4,a5,8
     938:	fae43c23          	sd	a4,-72(s0)
     93c:	4398                	lw	a4,0(a5)
     93e:	fcc42783          	lw	a5,-52(s0)
     942:	4685                	li	a3,1
     944:	4629                	li	a2,10
     946:	85ba                	mv	a1,a4
     948:	853e                	mv	a0,a5
     94a:	00000097          	auipc	ra,0x0
     94e:	dbe080e7          	jalr	-578(ra) # 708 <printint>
     952:	a269                	j	adc <vprintf+0x23a>
      } else if(c == 'l') {
     954:	fdc42783          	lw	a5,-36(s0)
     958:	0007871b          	sext.w	a4,a5
     95c:	06c00793          	li	a5,108
     960:	02f71663          	bne	a4,a5,98c <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     964:	fb843783          	ld	a5,-72(s0)
     968:	00878713          	addi	a4,a5,8
     96c:	fae43c23          	sd	a4,-72(s0)
     970:	639c                	ld	a5,0(a5)
     972:	0007871b          	sext.w	a4,a5
     976:	fcc42783          	lw	a5,-52(s0)
     97a:	4681                	li	a3,0
     97c:	4629                	li	a2,10
     97e:	85ba                	mv	a1,a4
     980:	853e                	mv	a0,a5
     982:	00000097          	auipc	ra,0x0
     986:	d86080e7          	jalr	-634(ra) # 708 <printint>
     98a:	aa89                	j	adc <vprintf+0x23a>
      } else if(c == 'x') {
     98c:	fdc42783          	lw	a5,-36(s0)
     990:	0007871b          	sext.w	a4,a5
     994:	07800793          	li	a5,120
     998:	02f71463          	bne	a4,a5,9c0 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     99c:	fb843783          	ld	a5,-72(s0)
     9a0:	00878713          	addi	a4,a5,8
     9a4:	fae43c23          	sd	a4,-72(s0)
     9a8:	4398                	lw	a4,0(a5)
     9aa:	fcc42783          	lw	a5,-52(s0)
     9ae:	4681                	li	a3,0
     9b0:	4641                	li	a2,16
     9b2:	85ba                	mv	a1,a4
     9b4:	853e                	mv	a0,a5
     9b6:	00000097          	auipc	ra,0x0
     9ba:	d52080e7          	jalr	-686(ra) # 708 <printint>
     9be:	aa39                	j	adc <vprintf+0x23a>
      } else if(c == 'p') {
     9c0:	fdc42783          	lw	a5,-36(s0)
     9c4:	0007871b          	sext.w	a4,a5
     9c8:	07000793          	li	a5,112
     9cc:	02f71263          	bne	a4,a5,9f0 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     9d0:	fb843783          	ld	a5,-72(s0)
     9d4:	00878713          	addi	a4,a5,8
     9d8:	fae43c23          	sd	a4,-72(s0)
     9dc:	6398                	ld	a4,0(a5)
     9de:	fcc42783          	lw	a5,-52(s0)
     9e2:	85ba                	mv	a1,a4
     9e4:	853e                	mv	a0,a5
     9e6:	00000097          	auipc	ra,0x0
     9ea:	e30080e7          	jalr	-464(ra) # 816 <printptr>
     9ee:	a0fd                	j	adc <vprintf+0x23a>
      } else if(c == 's'){
     9f0:	fdc42783          	lw	a5,-36(s0)
     9f4:	0007871b          	sext.w	a4,a5
     9f8:	07300793          	li	a5,115
     9fc:	04f71c63          	bne	a4,a5,a54 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     a00:	fb843783          	ld	a5,-72(s0)
     a04:	00878713          	addi	a4,a5,8
     a08:	fae43c23          	sd	a4,-72(s0)
     a0c:	639c                	ld	a5,0(a5)
     a0e:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     a12:	fe843783          	ld	a5,-24(s0)
     a16:	eb8d                	bnez	a5,a48 <vprintf+0x1a6>
          s = "(null)";
     a18:	00001797          	auipc	a5,0x1
     a1c:	f9878793          	addi	a5,a5,-104 # 19b0 <schedule_dm+0x2ca>
     a20:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     a24:	a015                	j	a48 <vprintf+0x1a6>
          putc(fd, *s);
     a26:	fe843783          	ld	a5,-24(s0)
     a2a:	0007c703          	lbu	a4,0(a5)
     a2e:	fcc42783          	lw	a5,-52(s0)
     a32:	85ba                	mv	a1,a4
     a34:	853e                	mv	a0,a5
     a36:	00000097          	auipc	ra,0x0
     a3a:	c9c080e7          	jalr	-868(ra) # 6d2 <putc>
          s++;
     a3e:	fe843783          	ld	a5,-24(s0)
     a42:	0785                	addi	a5,a5,1
     a44:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     a48:	fe843783          	ld	a5,-24(s0)
     a4c:	0007c783          	lbu	a5,0(a5)
     a50:	fbf9                	bnez	a5,a26 <vprintf+0x184>
     a52:	a069                	j	adc <vprintf+0x23a>
        }
      } else if(c == 'c'){
     a54:	fdc42783          	lw	a5,-36(s0)
     a58:	0007871b          	sext.w	a4,a5
     a5c:	06300793          	li	a5,99
     a60:	02f71463          	bne	a4,a5,a88 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     a64:	fb843783          	ld	a5,-72(s0)
     a68:	00878713          	addi	a4,a5,8
     a6c:	fae43c23          	sd	a4,-72(s0)
     a70:	439c                	lw	a5,0(a5)
     a72:	0ff7f713          	andi	a4,a5,255
     a76:	fcc42783          	lw	a5,-52(s0)
     a7a:	85ba                	mv	a1,a4
     a7c:	853e                	mv	a0,a5
     a7e:	00000097          	auipc	ra,0x0
     a82:	c54080e7          	jalr	-940(ra) # 6d2 <putc>
     a86:	a899                	j	adc <vprintf+0x23a>
      } else if(c == '%'){
     a88:	fdc42783          	lw	a5,-36(s0)
     a8c:	0007871b          	sext.w	a4,a5
     a90:	02500793          	li	a5,37
     a94:	00f71f63          	bne	a4,a5,ab2 <vprintf+0x210>
        putc(fd, c);
     a98:	fdc42783          	lw	a5,-36(s0)
     a9c:	0ff7f713          	andi	a4,a5,255
     aa0:	fcc42783          	lw	a5,-52(s0)
     aa4:	85ba                	mv	a1,a4
     aa6:	853e                	mv	a0,a5
     aa8:	00000097          	auipc	ra,0x0
     aac:	c2a080e7          	jalr	-982(ra) # 6d2 <putc>
     ab0:	a035                	j	adc <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ab2:	fcc42783          	lw	a5,-52(s0)
     ab6:	02500593          	li	a1,37
     aba:	853e                	mv	a0,a5
     abc:	00000097          	auipc	ra,0x0
     ac0:	c16080e7          	jalr	-1002(ra) # 6d2 <putc>
        putc(fd, c);
     ac4:	fdc42783          	lw	a5,-36(s0)
     ac8:	0ff7f713          	andi	a4,a5,255
     acc:	fcc42783          	lw	a5,-52(s0)
     ad0:	85ba                	mv	a1,a4
     ad2:	853e                	mv	a0,a5
     ad4:	00000097          	auipc	ra,0x0
     ad8:	bfe080e7          	jalr	-1026(ra) # 6d2 <putc>
      }
      state = 0;
     adc:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     ae0:	fe442783          	lw	a5,-28(s0)
     ae4:	2785                	addiw	a5,a5,1
     ae6:	fef42223          	sw	a5,-28(s0)
     aea:	fe442783          	lw	a5,-28(s0)
     aee:	fc043703          	ld	a4,-64(s0)
     af2:	97ba                	add	a5,a5,a4
     af4:	0007c783          	lbu	a5,0(a5)
     af8:	dc0795e3          	bnez	a5,8c2 <vprintf+0x20>
    }
  }
}
     afc:	0001                	nop
     afe:	0001                	nop
     b00:	60a6                	ld	ra,72(sp)
     b02:	6406                	ld	s0,64(sp)
     b04:	6161                	addi	sp,sp,80
     b06:	8082                	ret

0000000000000b08 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     b08:	7159                	addi	sp,sp,-112
     b0a:	fc06                	sd	ra,56(sp)
     b0c:	f822                	sd	s0,48(sp)
     b0e:	0080                	addi	s0,sp,64
     b10:	fcb43823          	sd	a1,-48(s0)
     b14:	e010                	sd	a2,0(s0)
     b16:	e414                	sd	a3,8(s0)
     b18:	e818                	sd	a4,16(s0)
     b1a:	ec1c                	sd	a5,24(s0)
     b1c:	03043023          	sd	a6,32(s0)
     b20:	03143423          	sd	a7,40(s0)
     b24:	87aa                	mv	a5,a0
     b26:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     b2a:	03040793          	addi	a5,s0,48
     b2e:	fcf43423          	sd	a5,-56(s0)
     b32:	fc843783          	ld	a5,-56(s0)
     b36:	fd078793          	addi	a5,a5,-48
     b3a:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     b3e:	fe843703          	ld	a4,-24(s0)
     b42:	fdc42783          	lw	a5,-36(s0)
     b46:	863a                	mv	a2,a4
     b48:	fd043583          	ld	a1,-48(s0)
     b4c:	853e                	mv	a0,a5
     b4e:	00000097          	auipc	ra,0x0
     b52:	d54080e7          	jalr	-684(ra) # 8a2 <vprintf>
}
     b56:	0001                	nop
     b58:	70e2                	ld	ra,56(sp)
     b5a:	7442                	ld	s0,48(sp)
     b5c:	6165                	addi	sp,sp,112
     b5e:	8082                	ret

0000000000000b60 <printf>:

void
printf(const char *fmt, ...)
{
     b60:	7159                	addi	sp,sp,-112
     b62:	f406                	sd	ra,40(sp)
     b64:	f022                	sd	s0,32(sp)
     b66:	1800                	addi	s0,sp,48
     b68:	fca43c23          	sd	a0,-40(s0)
     b6c:	e40c                	sd	a1,8(s0)
     b6e:	e810                	sd	a2,16(s0)
     b70:	ec14                	sd	a3,24(s0)
     b72:	f018                	sd	a4,32(s0)
     b74:	f41c                	sd	a5,40(s0)
     b76:	03043823          	sd	a6,48(s0)
     b7a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     b7e:	04040793          	addi	a5,s0,64
     b82:	fcf43823          	sd	a5,-48(s0)
     b86:	fd043783          	ld	a5,-48(s0)
     b8a:	fc878793          	addi	a5,a5,-56
     b8e:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     b92:	fe843783          	ld	a5,-24(s0)
     b96:	863e                	mv	a2,a5
     b98:	fd843583          	ld	a1,-40(s0)
     b9c:	4505                	li	a0,1
     b9e:	00000097          	auipc	ra,0x0
     ba2:	d04080e7          	jalr	-764(ra) # 8a2 <vprintf>
}
     ba6:	0001                	nop
     ba8:	70a2                	ld	ra,40(sp)
     baa:	7402                	ld	s0,32(sp)
     bac:	6165                	addi	sp,sp,112
     bae:	8082                	ret

0000000000000bb0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     bb0:	7179                	addi	sp,sp,-48
     bb2:	f422                	sd	s0,40(sp)
     bb4:	1800                	addi	s0,sp,48
     bb6:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     bba:	fd843783          	ld	a5,-40(s0)
     bbe:	17c1                	addi	a5,a5,-16
     bc0:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     bc4:	00001797          	auipc	a5,0x1
     bc8:	e1c78793          	addi	a5,a5,-484 # 19e0 <freep>
     bcc:	639c                	ld	a5,0(a5)
     bce:	fef43423          	sd	a5,-24(s0)
     bd2:	a815                	j	c06 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     bd4:	fe843783          	ld	a5,-24(s0)
     bd8:	639c                	ld	a5,0(a5)
     bda:	fe843703          	ld	a4,-24(s0)
     bde:	00f76f63          	bltu	a4,a5,bfc <free+0x4c>
     be2:	fe043703          	ld	a4,-32(s0)
     be6:	fe843783          	ld	a5,-24(s0)
     bea:	02e7eb63          	bltu	a5,a4,c20 <free+0x70>
     bee:	fe843783          	ld	a5,-24(s0)
     bf2:	639c                	ld	a5,0(a5)
     bf4:	fe043703          	ld	a4,-32(s0)
     bf8:	02f76463          	bltu	a4,a5,c20 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     bfc:	fe843783          	ld	a5,-24(s0)
     c00:	639c                	ld	a5,0(a5)
     c02:	fef43423          	sd	a5,-24(s0)
     c06:	fe043703          	ld	a4,-32(s0)
     c0a:	fe843783          	ld	a5,-24(s0)
     c0e:	fce7f3e3          	bgeu	a5,a4,bd4 <free+0x24>
     c12:	fe843783          	ld	a5,-24(s0)
     c16:	639c                	ld	a5,0(a5)
     c18:	fe043703          	ld	a4,-32(s0)
     c1c:	faf77ce3          	bgeu	a4,a5,bd4 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     c20:	fe043783          	ld	a5,-32(s0)
     c24:	479c                	lw	a5,8(a5)
     c26:	1782                	slli	a5,a5,0x20
     c28:	9381                	srli	a5,a5,0x20
     c2a:	0792                	slli	a5,a5,0x4
     c2c:	fe043703          	ld	a4,-32(s0)
     c30:	973e                	add	a4,a4,a5
     c32:	fe843783          	ld	a5,-24(s0)
     c36:	639c                	ld	a5,0(a5)
     c38:	02f71763          	bne	a4,a5,c66 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     c3c:	fe043783          	ld	a5,-32(s0)
     c40:	4798                	lw	a4,8(a5)
     c42:	fe843783          	ld	a5,-24(s0)
     c46:	639c                	ld	a5,0(a5)
     c48:	479c                	lw	a5,8(a5)
     c4a:	9fb9                	addw	a5,a5,a4
     c4c:	0007871b          	sext.w	a4,a5
     c50:	fe043783          	ld	a5,-32(s0)
     c54:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     c56:	fe843783          	ld	a5,-24(s0)
     c5a:	639c                	ld	a5,0(a5)
     c5c:	6398                	ld	a4,0(a5)
     c5e:	fe043783          	ld	a5,-32(s0)
     c62:	e398                	sd	a4,0(a5)
     c64:	a039                	j	c72 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     c66:	fe843783          	ld	a5,-24(s0)
     c6a:	6398                	ld	a4,0(a5)
     c6c:	fe043783          	ld	a5,-32(s0)
     c70:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     c72:	fe843783          	ld	a5,-24(s0)
     c76:	479c                	lw	a5,8(a5)
     c78:	1782                	slli	a5,a5,0x20
     c7a:	9381                	srli	a5,a5,0x20
     c7c:	0792                	slli	a5,a5,0x4
     c7e:	fe843703          	ld	a4,-24(s0)
     c82:	97ba                	add	a5,a5,a4
     c84:	fe043703          	ld	a4,-32(s0)
     c88:	02f71563          	bne	a4,a5,cb2 <free+0x102>
    p->s.size += bp->s.size;
     c8c:	fe843783          	ld	a5,-24(s0)
     c90:	4798                	lw	a4,8(a5)
     c92:	fe043783          	ld	a5,-32(s0)
     c96:	479c                	lw	a5,8(a5)
     c98:	9fb9                	addw	a5,a5,a4
     c9a:	0007871b          	sext.w	a4,a5
     c9e:	fe843783          	ld	a5,-24(s0)
     ca2:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     ca4:	fe043783          	ld	a5,-32(s0)
     ca8:	6398                	ld	a4,0(a5)
     caa:	fe843783          	ld	a5,-24(s0)
     cae:	e398                	sd	a4,0(a5)
     cb0:	a031                	j	cbc <free+0x10c>
  } else
    p->s.ptr = bp;
     cb2:	fe843783          	ld	a5,-24(s0)
     cb6:	fe043703          	ld	a4,-32(s0)
     cba:	e398                	sd	a4,0(a5)
  freep = p;
     cbc:	00001797          	auipc	a5,0x1
     cc0:	d2478793          	addi	a5,a5,-732 # 19e0 <freep>
     cc4:	fe843703          	ld	a4,-24(s0)
     cc8:	e398                	sd	a4,0(a5)
}
     cca:	0001                	nop
     ccc:	7422                	ld	s0,40(sp)
     cce:	6145                	addi	sp,sp,48
     cd0:	8082                	ret

0000000000000cd2 <morecore>:

static Header*
morecore(uint nu)
{
     cd2:	7179                	addi	sp,sp,-48
     cd4:	f406                	sd	ra,40(sp)
     cd6:	f022                	sd	s0,32(sp)
     cd8:	1800                	addi	s0,sp,48
     cda:	87aa                	mv	a5,a0
     cdc:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     ce0:	fdc42783          	lw	a5,-36(s0)
     ce4:	0007871b          	sext.w	a4,a5
     ce8:	6785                	lui	a5,0x1
     cea:	00f77563          	bgeu	a4,a5,cf4 <morecore+0x22>
    nu = 4096;
     cee:	6785                	lui	a5,0x1
     cf0:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     cf4:	fdc42783          	lw	a5,-36(s0)
     cf8:	0047979b          	slliw	a5,a5,0x4
     cfc:	2781                	sext.w	a5,a5
     cfe:	2781                	sext.w	a5,a5
     d00:	853e                	mv	a0,a5
     d02:	00000097          	auipc	ra,0x0
     d06:	9a0080e7          	jalr	-1632(ra) # 6a2 <sbrk>
     d0a:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     d0e:	fe843703          	ld	a4,-24(s0)
     d12:	57fd                	li	a5,-1
     d14:	00f71463          	bne	a4,a5,d1c <morecore+0x4a>
    return 0;
     d18:	4781                	li	a5,0
     d1a:	a03d                	j	d48 <morecore+0x76>
  hp = (Header*)p;
     d1c:	fe843783          	ld	a5,-24(s0)
     d20:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     d24:	fe043783          	ld	a5,-32(s0)
     d28:	fdc42703          	lw	a4,-36(s0)
     d2c:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     d2e:	fe043783          	ld	a5,-32(s0)
     d32:	07c1                	addi	a5,a5,16
     d34:	853e                	mv	a0,a5
     d36:	00000097          	auipc	ra,0x0
     d3a:	e7a080e7          	jalr	-390(ra) # bb0 <free>
  return freep;
     d3e:	00001797          	auipc	a5,0x1
     d42:	ca278793          	addi	a5,a5,-862 # 19e0 <freep>
     d46:	639c                	ld	a5,0(a5)
}
     d48:	853e                	mv	a0,a5
     d4a:	70a2                	ld	ra,40(sp)
     d4c:	7402                	ld	s0,32(sp)
     d4e:	6145                	addi	sp,sp,48
     d50:	8082                	ret

0000000000000d52 <malloc>:

void*
malloc(uint nbytes)
{
     d52:	7139                	addi	sp,sp,-64
     d54:	fc06                	sd	ra,56(sp)
     d56:	f822                	sd	s0,48(sp)
     d58:	0080                	addi	s0,sp,64
     d5a:	87aa                	mv	a5,a0
     d5c:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     d60:	fcc46783          	lwu	a5,-52(s0)
     d64:	07bd                	addi	a5,a5,15
     d66:	8391                	srli	a5,a5,0x4
     d68:	2781                	sext.w	a5,a5
     d6a:	2785                	addiw	a5,a5,1
     d6c:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     d70:	00001797          	auipc	a5,0x1
     d74:	c7078793          	addi	a5,a5,-912 # 19e0 <freep>
     d78:	639c                	ld	a5,0(a5)
     d7a:	fef43023          	sd	a5,-32(s0)
     d7e:	fe043783          	ld	a5,-32(s0)
     d82:	ef95                	bnez	a5,dbe <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     d84:	00001797          	auipc	a5,0x1
     d88:	c4c78793          	addi	a5,a5,-948 # 19d0 <base>
     d8c:	fef43023          	sd	a5,-32(s0)
     d90:	00001797          	auipc	a5,0x1
     d94:	c5078793          	addi	a5,a5,-944 # 19e0 <freep>
     d98:	fe043703          	ld	a4,-32(s0)
     d9c:	e398                	sd	a4,0(a5)
     d9e:	00001797          	auipc	a5,0x1
     da2:	c4278793          	addi	a5,a5,-958 # 19e0 <freep>
     da6:	6398                	ld	a4,0(a5)
     da8:	00001797          	auipc	a5,0x1
     dac:	c2878793          	addi	a5,a5,-984 # 19d0 <base>
     db0:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     db2:	00001797          	auipc	a5,0x1
     db6:	c1e78793          	addi	a5,a5,-994 # 19d0 <base>
     dba:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     dbe:	fe043783          	ld	a5,-32(s0)
     dc2:	639c                	ld	a5,0(a5)
     dc4:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     dc8:	fe843783          	ld	a5,-24(s0)
     dcc:	4798                	lw	a4,8(a5)
     dce:	fdc42783          	lw	a5,-36(s0)
     dd2:	2781                	sext.w	a5,a5
     dd4:	06f76863          	bltu	a4,a5,e44 <malloc+0xf2>
      if(p->s.size == nunits)
     dd8:	fe843783          	ld	a5,-24(s0)
     ddc:	4798                	lw	a4,8(a5)
     dde:	fdc42783          	lw	a5,-36(s0)
     de2:	2781                	sext.w	a5,a5
     de4:	00e79963          	bne	a5,a4,df6 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     de8:	fe843783          	ld	a5,-24(s0)
     dec:	6398                	ld	a4,0(a5)
     dee:	fe043783          	ld	a5,-32(s0)
     df2:	e398                	sd	a4,0(a5)
     df4:	a82d                	j	e2e <malloc+0xdc>
      else {
        p->s.size -= nunits;
     df6:	fe843783          	ld	a5,-24(s0)
     dfa:	4798                	lw	a4,8(a5)
     dfc:	fdc42783          	lw	a5,-36(s0)
     e00:	40f707bb          	subw	a5,a4,a5
     e04:	0007871b          	sext.w	a4,a5
     e08:	fe843783          	ld	a5,-24(s0)
     e0c:	c798                	sw	a4,8(a5)
        p += p->s.size;
     e0e:	fe843783          	ld	a5,-24(s0)
     e12:	479c                	lw	a5,8(a5)
     e14:	1782                	slli	a5,a5,0x20
     e16:	9381                	srli	a5,a5,0x20
     e18:	0792                	slli	a5,a5,0x4
     e1a:	fe843703          	ld	a4,-24(s0)
     e1e:	97ba                	add	a5,a5,a4
     e20:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     e24:	fe843783          	ld	a5,-24(s0)
     e28:	fdc42703          	lw	a4,-36(s0)
     e2c:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     e2e:	00001797          	auipc	a5,0x1
     e32:	bb278793          	addi	a5,a5,-1102 # 19e0 <freep>
     e36:	fe043703          	ld	a4,-32(s0)
     e3a:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     e3c:	fe843783          	ld	a5,-24(s0)
     e40:	07c1                	addi	a5,a5,16
     e42:	a091                	j	e86 <malloc+0x134>
    }
    if(p == freep)
     e44:	00001797          	auipc	a5,0x1
     e48:	b9c78793          	addi	a5,a5,-1124 # 19e0 <freep>
     e4c:	639c                	ld	a5,0(a5)
     e4e:	fe843703          	ld	a4,-24(s0)
     e52:	02f71063          	bne	a4,a5,e72 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     e56:	fdc42783          	lw	a5,-36(s0)
     e5a:	853e                	mv	a0,a5
     e5c:	00000097          	auipc	ra,0x0
     e60:	e76080e7          	jalr	-394(ra) # cd2 <morecore>
     e64:	fea43423          	sd	a0,-24(s0)
     e68:	fe843783          	ld	a5,-24(s0)
     e6c:	e399                	bnez	a5,e72 <malloc+0x120>
        return 0;
     e6e:	4781                	li	a5,0
     e70:	a819                	j	e86 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     e72:	fe843783          	ld	a5,-24(s0)
     e76:	fef43023          	sd	a5,-32(s0)
     e7a:	fe843783          	ld	a5,-24(s0)
     e7e:	639c                	ld	a5,0(a5)
     e80:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     e84:	b791                	j	dc8 <malloc+0x76>
  }
}
     e86:	853e                	mv	a0,a5
     e88:	70e2                	ld	ra,56(sp)
     e8a:	7442                	ld	s0,48(sp)
     e8c:	6121                	addi	sp,sp,64
     e8e:	8082                	ret

0000000000000e90 <setjmp>:
     e90:	e100                	sd	s0,0(a0)
     e92:	e504                	sd	s1,8(a0)
     e94:	01253823          	sd	s2,16(a0)
     e98:	01353c23          	sd	s3,24(a0)
     e9c:	03453023          	sd	s4,32(a0)
     ea0:	03553423          	sd	s5,40(a0)
     ea4:	03653823          	sd	s6,48(a0)
     ea8:	03753c23          	sd	s7,56(a0)
     eac:	05853023          	sd	s8,64(a0)
     eb0:	05953423          	sd	s9,72(a0)
     eb4:	05a53823          	sd	s10,80(a0)
     eb8:	05b53c23          	sd	s11,88(a0)
     ebc:	06153023          	sd	ra,96(a0)
     ec0:	06253423          	sd	sp,104(a0)
     ec4:	4501                	li	a0,0
     ec6:	8082                	ret

0000000000000ec8 <longjmp>:
     ec8:	6100                	ld	s0,0(a0)
     eca:	6504                	ld	s1,8(a0)
     ecc:	01053903          	ld	s2,16(a0)
     ed0:	01853983          	ld	s3,24(a0)
     ed4:	02053a03          	ld	s4,32(a0)
     ed8:	02853a83          	ld	s5,40(a0)
     edc:	03053b03          	ld	s6,48(a0)
     ee0:	03853b83          	ld	s7,56(a0)
     ee4:	04053c03          	ld	s8,64(a0)
     ee8:	04853c83          	ld	s9,72(a0)
     eec:	05053d03          	ld	s10,80(a0)
     ef0:	05853d83          	ld	s11,88(a0)
     ef4:	06053083          	ld	ra,96(a0)
     ef8:	06853103          	ld	sp,104(a0)
     efc:	c199                	beqz	a1,f02 <longjmp_1>
     efe:	852e                	mv	a0,a1
     f00:	8082                	ret

0000000000000f02 <longjmp_1>:
     f02:	4505                	li	a0,1
     f04:	8082                	ret

0000000000000f06 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     f06:	1101                	addi	sp,sp,-32
     f08:	ec22                	sd	s0,24(sp)
     f0a:	1000                	addi	s0,sp,32
     f0c:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     f10:	fe843783          	ld	a5,-24(s0)
     f14:	639c                	ld	a5,0(a5)
     f16:	fe843703          	ld	a4,-24(s0)
     f1a:	40f707b3          	sub	a5,a4,a5
     f1e:	0017b793          	seqz	a5,a5
     f22:	0ff7f793          	andi	a5,a5,255
     f26:	2781                	sext.w	a5,a5
}
     f28:	853e                	mv	a0,a5
     f2a:	6462                	ld	s0,24(sp)
     f2c:	6105                	addi	sp,sp,32
     f2e:	8082                	ret

0000000000000f30 <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
     f30:	715d                	addi	sp,sp,-80
     f32:	e4a2                	sd	s0,72(sp)
     f34:	e0a6                	sd	s1,64(sp)
     f36:	0880                	addi	s0,sp,80
     f38:	84aa                	mv	s1,a0
    int sleep_time = -1;
     f3a:	57fd                	li	a5,-1
     f3c:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
     f40:	689c                	ld	a5,16(s1)
     f42:	639c                	ld	a5,0(a5)
     f44:	fcf43c23          	sd	a5,-40(s0)
     f48:	fd843783          	ld	a5,-40(s0)
     f4c:	17e1                	addi	a5,a5,-8
     f4e:	fef43023          	sd	a5,-32(s0)
     f52:	a0a9                	j	f9c <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
     f54:	fec42783          	lw	a5,-20(s0)
     f58:	2781                	sext.w	a5,a5
     f5a:	0007cf63          	bltz	a5,f78 <fill_sparse+0x48>
     f5e:	fe043783          	ld	a5,-32(s0)
     f62:	4f98                	lw	a4,24(a5)
     f64:	409c                	lw	a5,0(s1)
     f66:	40f707bb          	subw	a5,a4,a5
     f6a:	0007871b          	sext.w	a4,a5
     f6e:	fec42783          	lw	a5,-20(s0)
     f72:	2781                	sext.w	a5,a5
     f74:	00f75a63          	bge	a4,a5,f88 <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
     f78:	fe043783          	ld	a5,-32(s0)
     f7c:	4f98                	lw	a4,24(a5)
     f7e:	409c                	lw	a5,0(s1)
     f80:	40f707bb          	subw	a5,a4,a5
     f84:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
     f88:	fe043783          	ld	a5,-32(s0)
     f8c:	679c                	ld	a5,8(a5)
     f8e:	fcf43823          	sd	a5,-48(s0)
     f92:	fd043783          	ld	a5,-48(s0)
     f96:	17e1                	addi	a5,a5,-8
     f98:	fef43023          	sd	a5,-32(s0)
     f9c:	fe043783          	ld	a5,-32(s0)
     fa0:	00878713          	addi	a4,a5,8
     fa4:	689c                	ld	a5,16(s1)
     fa6:	faf717e3          	bne	a4,a5,f54 <fill_sparse+0x24>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = args.run_queue;
     faa:	649c                	ld	a5,8(s1)
     fac:	faf43823          	sd	a5,-80(s0)
    r.allocated_time = sleep_time;
     fb0:	fec42783          	lw	a5,-20(s0)
     fb4:	faf42c23          	sw	a5,-72(s0)
    return r;    
     fb8:	fb043783          	ld	a5,-80(s0)
     fbc:	fcf43023          	sd	a5,-64(s0)
     fc0:	fb843783          	ld	a5,-72(s0)
     fc4:	fcf43423          	sd	a5,-56(s0)
     fc8:	4701                	li	a4,0
     fca:	fc043703          	ld	a4,-64(s0)
     fce:	4781                	li	a5,0
     fd0:	fc843783          	ld	a5,-56(s0)
     fd4:	863a                	mv	a2,a4
     fd6:	86be                	mv	a3,a5
     fd8:	8732                	mv	a4,a2
     fda:	87b6                	mv	a5,a3
}
     fdc:	853a                	mv	a0,a4
     fde:	85be                	mv	a1,a5
     fe0:	6426                	ld	s0,72(sp)
     fe2:	6486                	ld	s1,64(sp)
     fe4:	6161                	addi	sp,sp,80
     fe6:	8082                	ret

0000000000000fe8 <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
     fe8:	715d                	addi	sp,sp,-80
     fea:	e4a2                	sd	s0,72(sp)
     fec:	e0a6                	sd	s1,64(sp)
     fee:	0880                	addi	s0,sp,80
     ff0:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
     ff2:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
     ff6:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     ffa:	649c                	ld	a5,8(s1)
     ffc:	639c                	ld	a5,0(a5)
     ffe:	fcf43c23          	sd	a5,-40(s0)
    1002:	fd843783          	ld	a5,-40(s0)
    1006:	fd878793          	addi	a5,a5,-40
    100a:	fef43023          	sd	a5,-32(s0)
    100e:	a81d                	j	1044 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
    1010:	fe843783          	ld	a5,-24(s0)
    1014:	cb89                	beqz	a5,1026 <schedule_default+0x3e>
    1016:	fe043783          	ld	a5,-32(s0)
    101a:	5fd8                	lw	a4,60(a5)
    101c:	fe843783          	ld	a5,-24(s0)
    1020:	5fdc                	lw	a5,60(a5)
    1022:	00f75663          	bge	a4,a5,102e <schedule_default+0x46>
            thread_with_smallest_id = th;
    1026:	fe043783          	ld	a5,-32(s0)
    102a:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    102e:	fe043783          	ld	a5,-32(s0)
    1032:	779c                	ld	a5,40(a5)
    1034:	fcf43823          	sd	a5,-48(s0)
    1038:	fd043783          	ld	a5,-48(s0)
    103c:	fd878793          	addi	a5,a5,-40
    1040:	fef43023          	sd	a5,-32(s0)
    1044:	fe043783          	ld	a5,-32(s0)
    1048:	02878713          	addi	a4,a5,40
    104c:	649c                	ld	a5,8(s1)
    104e:	fcf711e3          	bne	a4,a5,1010 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
    1052:	fe843783          	ld	a5,-24(s0)
    1056:	cf89                	beqz	a5,1070 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
    1058:	fe843783          	ld	a5,-24(s0)
    105c:	02878793          	addi	a5,a5,40
    1060:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
    1064:	fe843783          	ld	a5,-24(s0)
    1068:	4fbc                	lw	a5,88(a5)
    106a:	faf42c23          	sw	a5,-72(s0)
    106e:	a039                	j	107c <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1070:	649c                	ld	a5,8(s1)
    1072:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
    1076:	4785                	li	a5,1
    1078:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
    107c:	fb043783          	ld	a5,-80(s0)
    1080:	fcf43023          	sd	a5,-64(s0)
    1084:	fb843783          	ld	a5,-72(s0)
    1088:	fcf43423          	sd	a5,-56(s0)
    108c:	4701                	li	a4,0
    108e:	fc043703          	ld	a4,-64(s0)
    1092:	4781                	li	a5,0
    1094:	fc843783          	ld	a5,-56(s0)
    1098:	863a                	mv	a2,a4
    109a:	86be                	mv	a3,a5
    109c:	8732                	mv	a4,a2
    109e:	87b6                	mv	a5,a3
}
    10a0:	853a                	mv	a0,a4
    10a2:	85be                	mv	a1,a5
    10a4:	6426                	ld	s0,72(sp)
    10a6:	6486                	ld	s1,64(sp)
    10a8:	6161                	addi	sp,sp,80
    10aa:	8082                	ret

00000000000010ac <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
    10ac:	7135                	addi	sp,sp,-160
    10ae:	ed06                	sd	ra,152(sp)
    10b0:	e922                	sd	s0,144(sp)
    10b2:	e526                	sd	s1,136(sp)
    10b4:	e14a                	sd	s2,128(sp)
    10b6:	fcce                	sd	s3,120(sp)
    10b8:	1100                	addi	s0,sp,160
    10ba:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
    10bc:	649c                	ld	a5,8(s1)
    10be:	853e                	mv	a0,a5
    10c0:	00000097          	auipc	ra,0x0
    10c4:	e46080e7          	jalr	-442(ra) # f06 <list_empty>
    10c8:	87aa                	mv	a5,a0
    10ca:	cb85                	beqz	a5,10fa <schedule_wrr+0x4e>
        return fill_sparse(args);
    10cc:	609c                	ld	a5,0(s1)
    10ce:	f6f43023          	sd	a5,-160(s0)
    10d2:	649c                	ld	a5,8(s1)
    10d4:	f6f43423          	sd	a5,-152(s0)
    10d8:	689c                	ld	a5,16(s1)
    10da:	f6f43823          	sd	a5,-144(s0)
    10de:	f6040793          	addi	a5,s0,-160
    10e2:	853e                	mv	a0,a5
    10e4:	00000097          	auipc	ra,0x0
    10e8:	e4c080e7          	jalr	-436(ra) # f30 <fill_sparse>
    10ec:	872a                	mv	a4,a0
    10ee:	87ae                	mv	a5,a1
    10f0:	f8e43823          	sd	a4,-112(s0)
    10f4:	f8f43c23          	sd	a5,-104(s0)
    10f8:	a0c9                	j	11ba <schedule_wrr+0x10e>

    struct thread *process_thread = NULL;
    10fa:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    10fe:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1102:	649c                	ld	a5,8(s1)
    1104:	639c                	ld	a5,0(a5)
    1106:	faf43823          	sd	a5,-80(s0)
    110a:	fb043783          	ld	a5,-80(s0)
    110e:	fd878793          	addi	a5,a5,-40
    1112:	fcf43023          	sd	a5,-64(s0)
    1116:	a025                	j	113e <schedule_wrr+0x92>
        if (process_thread == NULL) {
    1118:	fc843783          	ld	a5,-56(s0)
    111c:	e791                	bnez	a5,1128 <schedule_wrr+0x7c>
            process_thread = th;
    111e:	fc043783          	ld	a5,-64(s0)
    1122:	fcf43423          	sd	a5,-56(s0)
            break;
    1126:	a01d                	j	114c <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
    1128:	fc043783          	ld	a5,-64(s0)
    112c:	779c                	ld	a5,40(a5)
    112e:	faf43423          	sd	a5,-88(s0)
    1132:	fa843783          	ld	a5,-88(s0)
    1136:	fd878793          	addi	a5,a5,-40
    113a:	fcf43023          	sd	a5,-64(s0)
    113e:	fc043783          	ld	a5,-64(s0)
    1142:	02878713          	addi	a4,a5,40
    1146:	649c                	ld	a5,8(s1)
    1148:	fcf718e3          	bne	a4,a5,1118 <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
    114c:	40dc                	lw	a5,4(s1)
    114e:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
    1152:	fc843783          	ld	a5,-56(s0)
    1156:	4fbc                	lw	a5,88(a5)
    1158:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    115c:	fc843783          	ld	a5,-56(s0)
    1160:	4fb4                	lw	a3,88(a5)
    1162:	fc843783          	ld	a5,-56(s0)
    1166:	47bc                	lw	a5,72(a5)
    1168:	fa442703          	lw	a4,-92(s0)
    116c:	02f707bb          	mulw	a5,a4,a5
    1170:	2781                	sext.w	a5,a5
    1172:	8736                	mv	a4,a3
    1174:	00e7dc63          	bge	a5,a4,118c <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
    1178:	fc843783          	ld	a5,-56(s0)
    117c:	47bc                	lw	a5,72(a5)
    117e:	fa442703          	lw	a4,-92(s0)
    1182:	02f707bb          	mulw	a5,a4,a5
    1186:	faf42e23          	sw	a5,-68(s0)
    118a:	a031                	j	1196 <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    118c:	fc843783          	ld	a5,-56(s0)
    1190:	4fbc                	lw	a5,88(a5)
    1192:	faf42e23          	sw	a5,-68(s0)
    }
    
    struct threads_sched_result r;
    r.scheduled_thread_list_member = &process_thread->thread_list;
    1196:	fc843783          	ld	a5,-56(s0)
    119a:	02878793          	addi	a5,a5,40
    119e:	f8f43023          	sd	a5,-128(s0)
    r.allocated_time = executing_time;
    11a2:	fbc42783          	lw	a5,-68(s0)
    11a6:	f8f42423          	sw	a5,-120(s0)
    return r;
    11aa:	f8043783          	ld	a5,-128(s0)
    11ae:	f8f43823          	sd	a5,-112(s0)
    11b2:	f8843783          	ld	a5,-120(s0)
    11b6:	f8f43c23          	sd	a5,-104(s0)
    11ba:	4701                	li	a4,0
    11bc:	f9043703          	ld	a4,-112(s0)
    11c0:	4781                	li	a5,0
    11c2:	f9843783          	ld	a5,-104(s0)
    11c6:	893a                	mv	s2,a4
    11c8:	89be                	mv	s3,a5
    11ca:	874a                	mv	a4,s2
    11cc:	87ce                	mv	a5,s3
}
    11ce:	853a                	mv	a0,a4
    11d0:	85be                	mv	a1,a5
    11d2:	60ea                	ld	ra,152(sp)
    11d4:	644a                	ld	s0,144(sp)
    11d6:	64aa                	ld	s1,136(sp)
    11d8:	690a                	ld	s2,128(sp)
    11da:	79e6                	ld	s3,120(sp)
    11dc:	610d                	addi	sp,sp,160
    11de:	8082                	ret

00000000000011e0 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    11e0:	7131                	addi	sp,sp,-192
    11e2:	fd06                	sd	ra,184(sp)
    11e4:	f922                	sd	s0,176(sp)
    11e6:	f526                	sd	s1,168(sp)
    11e8:	f14a                	sd	s2,160(sp)
    11ea:	ed4e                	sd	s3,152(sp)
    11ec:	0180                	addi	s0,sp,192
    11ee:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    11f0:	649c                	ld	a5,8(s1)
    11f2:	853e                	mv	a0,a5
    11f4:	00000097          	auipc	ra,0x0
    11f8:	d12080e7          	jalr	-750(ra) # f06 <list_empty>
    11fc:	87aa                	mv	a5,a0
    11fe:	cb85                	beqz	a5,122e <schedule_sjf+0x4e>
        return fill_sparse(args);
    1200:	609c                	ld	a5,0(s1)
    1202:	f4f43023          	sd	a5,-192(s0)
    1206:	649c                	ld	a5,8(s1)
    1208:	f4f43423          	sd	a5,-184(s0)
    120c:	689c                	ld	a5,16(s1)
    120e:	f4f43823          	sd	a5,-176(s0)
    1212:	f4040793          	addi	a5,s0,-192
    1216:	853e                	mv	a0,a5
    1218:	00000097          	auipc	ra,0x0
    121c:	d18080e7          	jalr	-744(ra) # f30 <fill_sparse>
    1220:	872a                	mv	a4,a0
    1222:	87ae                	mv	a5,a1
    1224:	f6e43c23          	sd	a4,-136(s0)
    1228:	f8f43023          	sd	a5,-128(s0)
    122c:	aa49                	j	13be <schedule_sjf+0x1de>

    int current_time = args.current_time;
    122e:	409c                	lw	a5,0(s1)
    1230:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    1234:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1238:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    123c:	649c                	ld	a5,8(s1)
    123e:	639c                	ld	a5,0(a5)
    1240:	faf43423          	sd	a5,-88(s0)
    1244:	fa843783          	ld	a5,-88(s0)
    1248:	fd878793          	addi	a5,a5,-40
    124c:	fcf43023          	sd	a5,-64(s0)
    1250:	a085                	j	12b0 <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    1252:	fc843783          	ld	a5,-56(s0)
    1256:	cb89                	beqz	a5,1268 <schedule_sjf+0x88>
    1258:	fc043783          	ld	a5,-64(s0)
    125c:	4fb8                	lw	a4,88(a5)
    125e:	fc843783          	ld	a5,-56(s0)
    1262:	4fbc                	lw	a5,88(a5)
    1264:	00f75763          	bge	a4,a5,1272 <schedule_sjf+0x92>
            shortest_thread = th;
    1268:	fc043783          	ld	a5,-64(s0)
    126c:	fcf43423          	sd	a5,-56(s0)
    1270:	a02d                	j	129a <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    1272:	fc043783          	ld	a5,-64(s0)
    1276:	4fb8                	lw	a4,88(a5)
    1278:	fc843783          	ld	a5,-56(s0)
    127c:	4fbc                	lw	a5,88(a5)
    127e:	00f71e63          	bne	a4,a5,129a <schedule_sjf+0xba>
    1282:	fc043783          	ld	a5,-64(s0)
    1286:	5fd8                	lw	a4,60(a5)
    1288:	fc843783          	ld	a5,-56(s0)
    128c:	5fdc                	lw	a5,60(a5)
    128e:	00f75663          	bge	a4,a5,129a <schedule_sjf+0xba>
            shortest_thread = th;
    1292:	fc043783          	ld	a5,-64(s0)
    1296:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    129a:	fc043783          	ld	a5,-64(s0)
    129e:	779c                	ld	a5,40(a5)
    12a0:	f8f43423          	sd	a5,-120(s0)
    12a4:	f8843783          	ld	a5,-120(s0)
    12a8:	fd878793          	addi	a5,a5,-40
    12ac:	fcf43023          	sd	a5,-64(s0)
    12b0:	fc043783          	ld	a5,-64(s0)
    12b4:	02878713          	addi	a4,a5,40
    12b8:	649c                	ld	a5,8(s1)
    12ba:	f8f71ce3          	bne	a4,a5,1252 <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    12be:	fc843783          	ld	a5,-56(s0)
    12c2:	4fbc                	lw	a5,88(a5)
    12c4:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    12c8:	689c                	ld	a5,16(s1)
    12ca:	639c                	ld	a5,0(a5)
    12cc:	faf43023          	sd	a5,-96(s0)
    12d0:	fa043783          	ld	a5,-96(s0)
    12d4:	17e1                	addi	a5,a5,-8
    12d6:	faf43c23          	sd	a5,-72(s0)
    12da:	a84d                	j	138c <schedule_sjf+0x1ac>
        int interval = cur->release_time - current_time;
    12dc:	fb843783          	ld	a5,-72(s0)
    12e0:	4f98                	lw	a4,24(a5)
    12e2:	fb042783          	lw	a5,-80(s0)
    12e6:	40f707bb          	subw	a5,a4,a5
    12ea:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    12ee:	f9c42703          	lw	a4,-100(s0)
    12f2:	fb442783          	lw	a5,-76(s0)
    12f6:	2701                	sext.w	a4,a4
    12f8:	2781                	sext.w	a5,a5
    12fa:	06e7c863          	blt	a5,a4,136a <schedule_sjf+0x18a>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    12fe:	fc843783          	ld	a5,-56(s0)
    1302:	4fbc                	lw	a5,88(a5)
    1304:	fb042703          	lw	a4,-80(s0)
    1308:	9fb9                	addw	a5,a5,a4
    130a:	0007871b          	sext.w	a4,a5
    130e:	fb843783          	ld	a5,-72(s0)
    1312:	4f9c                	lw	a5,24(a5)
    1314:	04f74d63          	blt	a4,a5,136e <schedule_sjf+0x18e>
        int remaining_time = shortest_thread->remaining_time - interval;
    1318:	fc843783          	ld	a5,-56(s0)
    131c:	4fb8                	lw	a4,88(a5)
    131e:	f9c42783          	lw	a5,-100(s0)
    1322:	40f707bb          	subw	a5,a4,a5
    1326:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    132a:	fb843783          	ld	a5,-72(s0)
    132e:	639c                	ld	a5,0(a5)
    1330:	43f8                	lw	a4,68(a5)
    1332:	f9842783          	lw	a5,-104(s0)
    1336:	2781                	sext.w	a5,a5
    1338:	02e7cd63          	blt	a5,a4,1372 <schedule_sjf+0x192>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    133c:	fb843783          	ld	a5,-72(s0)
    1340:	639c                	ld	a5,0(a5)
    1342:	43f8                	lw	a4,68(a5)
    1344:	f9842783          	lw	a5,-104(s0)
    1348:	2781                	sext.w	a5,a5
    134a:	00e79b63          	bne	a5,a4,1360 <schedule_sjf+0x180>
    134e:	fc843783          	ld	a5,-56(s0)
    1352:	5fd8                	lw	a4,60(a5)
    1354:	fb843783          	ld	a5,-72(s0)
    1358:	639c                	ld	a5,0(a5)
    135a:	5fdc                	lw	a5,60(a5)
    135c:	00f74d63          	blt	a4,a5,1376 <schedule_sjf+0x196>
        executing_time = interval;
    1360:	f9c42783          	lw	a5,-100(s0)
    1364:	faf42a23          	sw	a5,-76(s0)
    1368:	a801                	j	1378 <schedule_sjf+0x198>
        if (interval > executing_time) continue;
    136a:	0001                	nop
    136c:	a031                	j	1378 <schedule_sjf+0x198>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    136e:	0001                	nop
    1370:	a021                	j	1378 <schedule_sjf+0x198>
        if (remaining_time < cur->thrd->processing_time) continue;
    1372:	0001                	nop
    1374:	a011                	j	1378 <schedule_sjf+0x198>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    1376:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1378:	fb843783          	ld	a5,-72(s0)
    137c:	679c                	ld	a5,8(a5)
    137e:	f8f43823          	sd	a5,-112(s0)
    1382:	f9043783          	ld	a5,-112(s0)
    1386:	17e1                	addi	a5,a5,-8
    1388:	faf43c23          	sd	a5,-72(s0)
    138c:	fb843783          	ld	a5,-72(s0)
    1390:	00878713          	addi	a4,a5,8
    1394:	689c                	ld	a5,16(s1)
    1396:	f4f713e3          	bne	a4,a5,12dc <schedule_sjf+0xfc>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &shortest_thread->thread_list;
    139a:	fc843783          	ld	a5,-56(s0)
    139e:	02878793          	addi	a5,a5,40
    13a2:	f6f43423          	sd	a5,-152(s0)
    r.allocated_time = executing_time;
    13a6:	fb442783          	lw	a5,-76(s0)
    13aa:	f6f42823          	sw	a5,-144(s0)
    return r;
    13ae:	f6843783          	ld	a5,-152(s0)
    13b2:	f6f43c23          	sd	a5,-136(s0)
    13b6:	f7043783          	ld	a5,-144(s0)
    13ba:	f8f43023          	sd	a5,-128(s0)
    13be:	4701                	li	a4,0
    13c0:	f7843703          	ld	a4,-136(s0)
    13c4:	4781                	li	a5,0
    13c6:	f8043783          	ld	a5,-128(s0)
    13ca:	893a                	mv	s2,a4
    13cc:	89be                	mv	s3,a5
    13ce:	874a                	mv	a4,s2
    13d0:	87ce                	mv	a5,s3
}
    13d2:	853a                	mv	a0,a4
    13d4:	85be                	mv	a1,a5
    13d6:	70ea                	ld	ra,184(sp)
    13d8:	744a                	ld	s0,176(sp)
    13da:	74aa                	ld	s1,168(sp)
    13dc:	790a                	ld	s2,160(sp)
    13de:	69ea                	ld	s3,152(sp)
    13e0:	6129                	addi	sp,sp,192
    13e2:	8082                	ret

00000000000013e4 <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    13e4:	7115                	addi	sp,sp,-224
    13e6:	ed86                	sd	ra,216(sp)
    13e8:	e9a2                	sd	s0,208(sp)
    13ea:	e5a6                	sd	s1,200(sp)
    13ec:	e1ca                	sd	s2,192(sp)
    13ee:	fd4e                	sd	s3,184(sp)
    13f0:	1180                	addi	s0,sp,224
    13f2:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    13f4:	649c                	ld	a5,8(s1)
    13f6:	853e                	mv	a0,a5
    13f8:	00000097          	auipc	ra,0x0
    13fc:	b0e080e7          	jalr	-1266(ra) # f06 <list_empty>
    1400:	87aa                	mv	a5,a0
    1402:	cb85                	beqz	a5,1432 <schedule_lst+0x4e>
        return fill_sparse(args);
    1404:	609c                	ld	a5,0(s1)
    1406:	f2f43023          	sd	a5,-224(s0)
    140a:	649c                	ld	a5,8(s1)
    140c:	f2f43423          	sd	a5,-216(s0)
    1410:	689c                	ld	a5,16(s1)
    1412:	f2f43823          	sd	a5,-208(s0)
    1416:	f2040793          	addi	a5,s0,-224
    141a:	853e                	mv	a0,a5
    141c:	00000097          	auipc	ra,0x0
    1420:	b14080e7          	jalr	-1260(ra) # f30 <fill_sparse>
    1424:	872a                	mv	a4,a0
    1426:	87ae                	mv	a5,a1
    1428:	f6e43023          	sd	a4,-160(s0)
    142c:	f6f43423          	sd	a5,-152(s0)
    1430:	ac41                	j	16c0 <schedule_lst+0x2dc>

    int current_time = args.current_time;
    1432:	409c                	lw	a5,0(s1)
    1434:	faf42623          	sw	a5,-84(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    1438:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    143c:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1440:	649c                	ld	a5,8(s1)
    1442:	639c                	ld	a5,0(a5)
    1444:	faf43023          	sd	a5,-96(s0)
    1448:	fa043783          	ld	a5,-96(s0)
    144c:	fd878793          	addi	a5,a5,-40
    1450:	fcf43023          	sd	a5,-64(s0)
    1454:	a239                	j	1562 <schedule_lst+0x17e>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    1456:	fc043783          	ld	a5,-64(s0)
    145a:	4ff8                	lw	a4,92(a5)
    145c:	fac42783          	lw	a5,-84(s0)
    1460:	40f707bb          	subw	a5,a4,a5
    1464:	0007871b          	sext.w	a4,a5
    1468:	fc043783          	ld	a5,-64(s0)
    146c:	4fbc                	lw	a5,88(a5)
    146e:	40f707bb          	subw	a5,a4,a5
    1472:	f6f42e23          	sw	a5,-132(s0)
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    1476:	fc843783          	ld	a5,-56(s0)
    147a:	c38d                	beqz	a5,149c <schedule_lst+0xb8>
    147c:	fc843783          	ld	a5,-56(s0)
    1480:	4ff8                	lw	a4,92(a5)
    1482:	fac42783          	lw	a5,-84(s0)
    1486:	40f707bb          	subw	a5,a4,a5
    148a:	0007871b          	sext.w	a4,a5
    148e:	fc843783          	ld	a5,-56(s0)
    1492:	4fbc                	lw	a5,88(a5)
    1494:	40f707bb          	subw	a5,a4,a5
    1498:	2781                	sext.w	a5,a5
    149a:	a011                	j	149e <schedule_lst+0xba>
    149c:	4781                	li	a5,0
    149e:	f6f42c23          	sw	a5,-136(s0)
        if (least_slack_thread == NULL) {
    14a2:	fc843783          	ld	a5,-56(s0)
    14a6:	e791                	bnez	a5,14b2 <schedule_lst+0xce>
            least_slack_thread = th;
    14a8:	fc043783          	ld	a5,-64(s0)
    14ac:	fcf43423          	sd	a5,-56(s0)
    14b0:	a871                	j	154c <schedule_lst+0x168>
        }
        else if (least_slack_thread->current_deadline <= current_time) { // missing the deadline
    14b2:	fc843783          	ld	a5,-56(s0)
    14b6:	4ff8                	lw	a4,92(a5)
    14b8:	fac42783          	lw	a5,-84(s0)
    14bc:	2781                	sext.w	a5,a5
    14be:	02e7c763          	blt	a5,a4,14ec <schedule_lst+0x108>
            if (th->current_deadline > current_time) continue;
    14c2:	fc043783          	ld	a5,-64(s0)
    14c6:	4ff8                	lw	a4,92(a5)
    14c8:	fac42783          	lw	a5,-84(s0)
    14cc:	2781                	sext.w	a5,a5
    14ce:	06e7ce63          	blt	a5,a4,154a <schedule_lst+0x166>
            if (th->ID < least_slack_thread->ID) {
    14d2:	fc043783          	ld	a5,-64(s0)
    14d6:	5fd8                	lw	a4,60(a5)
    14d8:	fc843783          	ld	a5,-56(s0)
    14dc:	5fdc                	lw	a5,60(a5)
    14de:	06f75763          	bge	a4,a5,154c <schedule_lst+0x168>
                least_slack_thread = th;
    14e2:	fc043783          	ld	a5,-64(s0)
    14e6:	fcf43423          	sd	a5,-56(s0)
    14ea:	a08d                	j	154c <schedule_lst+0x168>
            }
        }
        else if (th->current_deadline <= current_time) {
    14ec:	fc043783          	ld	a5,-64(s0)
    14f0:	4ff8                	lw	a4,92(a5)
    14f2:	fac42783          	lw	a5,-84(s0)
    14f6:	2781                	sext.w	a5,a5
    14f8:	00e7c763          	blt	a5,a4,1506 <schedule_lst+0x122>
            least_slack_thread = th;
    14fc:	fc043783          	ld	a5,-64(s0)
    1500:	fcf43423          	sd	a5,-56(s0)
    1504:	a0a1                	j	154c <schedule_lst+0x168>
        }
        else if (slack_time < least_slack_time) {
    1506:	f7c42703          	lw	a4,-132(s0)
    150a:	f7842783          	lw	a5,-136(s0)
    150e:	2701                	sext.w	a4,a4
    1510:	2781                	sext.w	a5,a5
    1512:	00f75763          	bge	a4,a5,1520 <schedule_lst+0x13c>
            least_slack_thread = th;
    1516:	fc043783          	ld	a5,-64(s0)
    151a:	fcf43423          	sd	a5,-56(s0)
    151e:	a03d                	j	154c <schedule_lst+0x168>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    1520:	f7c42703          	lw	a4,-132(s0)
    1524:	f7842783          	lw	a5,-136(s0)
    1528:	2701                	sext.w	a4,a4
    152a:	2781                	sext.w	a5,a5
    152c:	02f71063          	bne	a4,a5,154c <schedule_lst+0x168>
    1530:	fc043783          	ld	a5,-64(s0)
    1534:	5fd8                	lw	a4,60(a5)
    1536:	fc843783          	ld	a5,-56(s0)
    153a:	5fdc                	lw	a5,60(a5)
    153c:	00f75863          	bge	a4,a5,154c <schedule_lst+0x168>
            least_slack_thread = th;
    1540:	fc043783          	ld	a5,-64(s0)
    1544:	fcf43423          	sd	a5,-56(s0)
    1548:	a011                	j	154c <schedule_lst+0x168>
            if (th->current_deadline > current_time) continue;
    154a:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    154c:	fc043783          	ld	a5,-64(s0)
    1550:	779c                	ld	a5,40(a5)
    1552:	f6f43823          	sd	a5,-144(s0)
    1556:	f7043783          	ld	a5,-144(s0)
    155a:	fd878793          	addi	a5,a5,-40
    155e:	fcf43023          	sd	a5,-64(s0)
    1562:	fc043783          	ld	a5,-64(s0)
    1566:	02878713          	addi	a4,a5,40
    156a:	649c                	ld	a5,8(s1)
    156c:	eef715e3          	bne	a4,a5,1456 <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread->current_deadline <= current_time)
    1570:	fc843783          	ld	a5,-56(s0)
    1574:	4ff8                	lw	a4,92(a5)
    1576:	fac42783          	lw	a5,-84(s0)
    157a:	2781                	sext.w	a5,a5
    157c:	00e7cb63          	blt	a5,a4,1592 <schedule_lst+0x1ae>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    1580:	fc843783          	ld	a5,-56(s0)
    1584:	02878793          	addi	a5,a5,40
    1588:	f6f43023          	sd	a5,-160(s0)
    158c:	f6042423          	sw	zero,-152(s0)
    1590:	aa05                	j	16c0 <schedule_lst+0x2dc>
    
    int executing_time = least_slack_thread->remaining_time;
    1592:	fc843783          	ld	a5,-56(s0)
    1596:	4fbc                	lw	a5,88(a5)
    1598:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    159c:	fc843783          	ld	a5,-56(s0)
    15a0:	4fb4                	lw	a3,88(a5)
    15a2:	fc843783          	ld	a5,-56(s0)
    15a6:	4ff8                	lw	a4,92(a5)
    15a8:	fac42783          	lw	a5,-84(s0)
    15ac:	40f707bb          	subw	a5,a4,a5
    15b0:	2781                	sext.w	a5,a5
    15b2:	8736                	mv	a4,a3
    15b4:	00e7db63          	bge	a5,a4,15ca <schedule_lst+0x1e6>
        executing_time = least_slack_thread->current_deadline - current_time;
    15b8:	fc843783          	ld	a5,-56(s0)
    15bc:	4ff8                	lw	a4,92(a5)
    15be:	fac42783          	lw	a5,-84(s0)
    15c2:	40f707bb          	subw	a5,a4,a5
    15c6:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    15ca:	fc843783          	ld	a5,-56(s0)
    15ce:	4ff8                	lw	a4,92(a5)
    15d0:	fac42783          	lw	a5,-84(s0)
    15d4:	40f707bb          	subw	a5,a4,a5
    15d8:	0007871b          	sext.w	a4,a5
    15dc:	fc843783          	ld	a5,-56(s0)
    15e0:	4fbc                	lw	a5,88(a5)
    15e2:	40f707bb          	subw	a5,a4,a5
    15e6:	f8f42e23          	sw	a5,-100(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    15ea:	689c                	ld	a5,16(s1)
    15ec:	639c                	ld	a5,0(a5)
    15ee:	f8f43823          	sd	a5,-112(s0)
    15f2:	f9043783          	ld	a5,-112(s0)
    15f6:	17e1                	addi	a5,a5,-8
    15f8:	faf43823          	sd	a5,-80(s0)
    15fc:	a849                	j	168e <schedule_lst+0x2aa>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    15fe:	fb043783          	ld	a5,-80(s0)
    1602:	639c                	ld	a5,0(a5)
    1604:	47f8                	lw	a4,76(a5)
    1606:	fb043783          	ld	a5,-80(s0)
    160a:	639c                	ld	a5,0(a5)
    160c:	43fc                	lw	a5,68(a5)
    160e:	40f707bb          	subw	a5,a4,a5
    1612:	f8f42623          	sw	a5,-116(s0)
        int interval = cur->release_time - current_time;
    1616:	fb043783          	ld	a5,-80(s0)
    161a:	4f98                	lw	a4,24(a5)
    161c:	fac42783          	lw	a5,-84(s0)
    1620:	40f707bb          	subw	a5,a4,a5
    1624:	f8f42423          	sw	a5,-120(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    1628:	f8842703          	lw	a4,-120(s0)
    162c:	fbc42783          	lw	a5,-68(s0)
    1630:	2701                	sext.w	a4,a4
    1632:	2781                	sext.w	a5,a5
    1634:	04e7c063          	blt	a5,a4,1674 <schedule_lst+0x290>
    1638:	f9c42703          	lw	a4,-100(s0)
    163c:	f8c42783          	lw	a5,-116(s0)
    1640:	2701                	sext.w	a4,a4
    1642:	2781                	sext.w	a5,a5
    1644:	02f74863          	blt	a4,a5,1674 <schedule_lst+0x290>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    1648:	f9c42703          	lw	a4,-100(s0)
    164c:	f8c42783          	lw	a5,-116(s0)
    1650:	2701                	sext.w	a4,a4
    1652:	2781                	sext.w	a5,a5
    1654:	00f71b63          	bne	a4,a5,166a <schedule_lst+0x286>
    1658:	fc843783          	ld	a5,-56(s0)
    165c:	5fd8                	lw	a4,60(a5)
    165e:	fb043783          	ld	a5,-80(s0)
    1662:	639c                	ld	a5,0(a5)
    1664:	5fdc                	lw	a5,60(a5)
    1666:	00f74963          	blt	a4,a5,1678 <schedule_lst+0x294>
        executing_time = interval;
    166a:	f8842783          	lw	a5,-120(s0)
    166e:	faf42e23          	sw	a5,-68(s0)
    1672:	a021                	j	167a <schedule_lst+0x296>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    1674:	0001                	nop
    1676:	a011                	j	167a <schedule_lst+0x296>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    1678:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    167a:	fb043783          	ld	a5,-80(s0)
    167e:	679c                	ld	a5,8(a5)
    1680:	f8f43023          	sd	a5,-128(s0)
    1684:	f8043783          	ld	a5,-128(s0)
    1688:	17e1                	addi	a5,a5,-8
    168a:	faf43823          	sd	a5,-80(s0)
    168e:	fb043783          	ld	a5,-80(s0)
    1692:	00878713          	addi	a4,a5,8
    1696:	689c                	ld	a5,16(s1)
    1698:	f6f713e3          	bne	a4,a5,15fe <schedule_lst+0x21a>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &least_slack_thread->thread_list;
    169c:	fc843783          	ld	a5,-56(s0)
    16a0:	02878793          	addi	a5,a5,40
    16a4:	f4f43823          	sd	a5,-176(s0)
    r.allocated_time = executing_time;
    16a8:	fbc42783          	lw	a5,-68(s0)
    16ac:	f4f42c23          	sw	a5,-168(s0)
    return r;
    16b0:	f5043783          	ld	a5,-176(s0)
    16b4:	f6f43023          	sd	a5,-160(s0)
    16b8:	f5843783          	ld	a5,-168(s0)
    16bc:	f6f43423          	sd	a5,-152(s0)
    16c0:	4701                	li	a4,0
    16c2:	f6043703          	ld	a4,-160(s0)
    16c6:	4781                	li	a5,0
    16c8:	f6843783          	ld	a5,-152(s0)
    16cc:	893a                	mv	s2,a4
    16ce:	89be                	mv	s3,a5
    16d0:	874a                	mv	a4,s2
    16d2:	87ce                	mv	a5,s3
}
    16d4:	853a                	mv	a0,a4
    16d6:	85be                	mv	a1,a5
    16d8:	60ee                	ld	ra,216(sp)
    16da:	644e                	ld	s0,208(sp)
    16dc:	64ae                	ld	s1,200(sp)
    16de:	690e                	ld	s2,192(sp)
    16e0:	79ea                	ld	s3,184(sp)
    16e2:	612d                	addi	sp,sp,224
    16e4:	8082                	ret

00000000000016e6 <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    16e6:	7155                	addi	sp,sp,-208
    16e8:	e586                	sd	ra,200(sp)
    16ea:	e1a2                	sd	s0,192(sp)
    16ec:	fd26                	sd	s1,184(sp)
    16ee:	f94a                	sd	s2,176(sp)
    16f0:	f54e                	sd	s3,168(sp)
    16f2:	0980                	addi	s0,sp,208
    16f4:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.

    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    16f6:	649c                	ld	a5,8(s1)
    16f8:	853e                	mv	a0,a5
    16fa:	00000097          	auipc	ra,0x0
    16fe:	80c080e7          	jalr	-2036(ra) # f06 <list_empty>
    1702:	87aa                	mv	a5,a0
    1704:	cb85                	beqz	a5,1734 <schedule_dm+0x4e>
        return fill_sparse(args);
    1706:	609c                	ld	a5,0(s1)
    1708:	f2f43823          	sd	a5,-208(s0)
    170c:	649c                	ld	a5,8(s1)
    170e:	f2f43c23          	sd	a5,-200(s0)
    1712:	689c                	ld	a5,16(s1)
    1714:	f4f43023          	sd	a5,-192(s0)
    1718:	f3040793          	addi	a5,s0,-208
    171c:	853e                	mv	a0,a5
    171e:	00000097          	auipc	ra,0x0
    1722:	812080e7          	jalr	-2030(ra) # f30 <fill_sparse>
    1726:	872a                	mv	a4,a0
    1728:	87ae                	mv	a5,a1
    172a:	f6e43823          	sd	a4,-144(s0)
    172e:	f6f43c23          	sd	a5,-136(s0)
    1732:	ac11                	j	1946 <schedule_dm+0x260>
    
    int current_time = args.current_time;
    1734:	409c                	lw	a5,0(s1)
    1736:	faf42623          	sw	a5,-84(s0)

    // find the thread with the earliest deadline
    struct thread *highest_priority_thread = NULL;
    173a:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    173e:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1742:	649c                	ld	a5,8(s1)
    1744:	639c                	ld	a5,0(a5)
    1746:	faf43023          	sd	a5,-96(s0)
    174a:	fa043783          	ld	a5,-96(s0)
    174e:	fd878793          	addi	a5,a5,-40
    1752:	fcf43023          	sd	a5,-64(s0)
    1756:	a0c9                	j	1818 <schedule_dm+0x132>
        if (highest_priority_thread == NULL) {
    1758:	fc843783          	ld	a5,-56(s0)
    175c:	e791                	bnez	a5,1768 <schedule_dm+0x82>
            highest_priority_thread = th;
    175e:	fc043783          	ld	a5,-64(s0)
    1762:	fcf43423          	sd	a5,-56(s0)
    1766:	a871                	j	1802 <schedule_dm+0x11c>
        }
        else if (highest_priority_thread->current_deadline <= current_time) { // missing the deadline
    1768:	fc843783          	ld	a5,-56(s0)
    176c:	4ff8                	lw	a4,92(a5)
    176e:	fac42783          	lw	a5,-84(s0)
    1772:	2781                	sext.w	a5,a5
    1774:	02e7c763          	blt	a5,a4,17a2 <schedule_dm+0xbc>
            if (th->current_deadline > current_time) continue;
    1778:	fc043783          	ld	a5,-64(s0)
    177c:	4ff8                	lw	a4,92(a5)
    177e:	fac42783          	lw	a5,-84(s0)
    1782:	2781                	sext.w	a5,a5
    1784:	06e7ce63          	blt	a5,a4,1800 <schedule_dm+0x11a>
            if (th->ID < highest_priority_thread->ID) {
    1788:	fc043783          	ld	a5,-64(s0)
    178c:	5fd8                	lw	a4,60(a5)
    178e:	fc843783          	ld	a5,-56(s0)
    1792:	5fdc                	lw	a5,60(a5)
    1794:	06f75763          	bge	a4,a5,1802 <schedule_dm+0x11c>
                highest_priority_thread = th;
    1798:	fc043783          	ld	a5,-64(s0)
    179c:	fcf43423          	sd	a5,-56(s0)
    17a0:	a08d                	j	1802 <schedule_dm+0x11c>
            }
        }
        else if (th->current_deadline <= current_time) {
    17a2:	fc043783          	ld	a5,-64(s0)
    17a6:	4ff8                	lw	a4,92(a5)
    17a8:	fac42783          	lw	a5,-84(s0)
    17ac:	2781                	sext.w	a5,a5
    17ae:	00e7c763          	blt	a5,a4,17bc <schedule_dm+0xd6>
            highest_priority_thread = th;
    17b2:	fc043783          	ld	a5,-64(s0)
    17b6:	fcf43423          	sd	a5,-56(s0)
    17ba:	a0a1                	j	1802 <schedule_dm+0x11c>
        }
        else if (th->deadline < highest_priority_thread->deadline ) {
    17bc:	fc043783          	ld	a5,-64(s0)
    17c0:	47f8                	lw	a4,76(a5)
    17c2:	fc843783          	ld	a5,-56(s0)
    17c6:	47fc                	lw	a5,76(a5)
    17c8:	00f75763          	bge	a4,a5,17d6 <schedule_dm+0xf0>
            highest_priority_thread = th;
    17cc:	fc043783          	ld	a5,-64(s0)
    17d0:	fcf43423          	sd	a5,-56(s0)
    17d4:	a03d                	j	1802 <schedule_dm+0x11c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    17d6:	fc043783          	ld	a5,-64(s0)
    17da:	47f8                	lw	a4,76(a5)
    17dc:	fc843783          	ld	a5,-56(s0)
    17e0:	47fc                	lw	a5,76(a5)
    17e2:	02f71063          	bne	a4,a5,1802 <schedule_dm+0x11c>
    17e6:	fc043783          	ld	a5,-64(s0)
    17ea:	5fd8                	lw	a4,60(a5)
    17ec:	fc843783          	ld	a5,-56(s0)
    17f0:	5fdc                	lw	a5,60(a5)
    17f2:	00f75863          	bge	a4,a5,1802 <schedule_dm+0x11c>
            highest_priority_thread = th;
    17f6:	fc043783          	ld	a5,-64(s0)
    17fa:	fcf43423          	sd	a5,-56(s0)
    17fe:	a011                	j	1802 <schedule_dm+0x11c>
            if (th->current_deadline > current_time) continue;
    1800:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1802:	fc043783          	ld	a5,-64(s0)
    1806:	779c                	ld	a5,40(a5)
    1808:	f8f43023          	sd	a5,-128(s0)
    180c:	f8043783          	ld	a5,-128(s0)
    1810:	fd878793          	addi	a5,a5,-40
    1814:	fcf43023          	sd	a5,-64(s0)
    1818:	fc043783          	ld	a5,-64(s0)
    181c:	02878713          	addi	a4,a5,40
    1820:	649c                	ld	a5,8(s1)
    1822:	f2f71be3          	bne	a4,a5,1758 <schedule_dm+0x72>
        }
    }

    // the thread missing the current deadline
    if (highest_priority_thread->current_deadline <= current_time)
    1826:	fc843783          	ld	a5,-56(s0)
    182a:	4ff8                	lw	a4,92(a5)
    182c:	fac42783          	lw	a5,-84(s0)
    1830:	2781                	sext.w	a5,a5
    1832:	00e7cb63          	blt	a5,a4,1848 <schedule_dm+0x162>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    1836:	fc843783          	ld	a5,-56(s0)
    183a:	02878793          	addi	a5,a5,40
    183e:	f6f43823          	sd	a5,-144(s0)
    1842:	f6042c23          	sw	zero,-136(s0)
    1846:	a201                	j	1946 <schedule_dm+0x260>

    int executing_time = highest_priority_thread->remaining_time;
    1848:	fc843783          	ld	a5,-56(s0)
    184c:	4fbc                	lw	a5,88(a5)
    184e:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    1852:	fc843783          	ld	a5,-56(s0)
    1856:	4fb4                	lw	a3,88(a5)
    1858:	fc843783          	ld	a5,-56(s0)
    185c:	4ff8                	lw	a4,92(a5)
    185e:	fac42783          	lw	a5,-84(s0)
    1862:	40f707bb          	subw	a5,a4,a5
    1866:	2781                	sext.w	a5,a5
    1868:	8736                	mv	a4,a3
    186a:	00e7db63          	bge	a5,a4,1880 <schedule_dm+0x19a>
        executing_time = highest_priority_thread->current_deadline - current_time;
    186e:	fc843783          	ld	a5,-56(s0)
    1872:	4ff8                	lw	a4,92(a5)
    1874:	fac42783          	lw	a5,-84(s0)
    1878:	40f707bb          	subw	a5,a4,a5
    187c:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1880:	689c                	ld	a5,16(s1)
    1882:	639c                	ld	a5,0(a5)
    1884:	f8f43c23          	sd	a5,-104(s0)
    1888:	f9843783          	ld	a5,-104(s0)
    188c:	17e1                	addi	a5,a5,-8
    188e:	faf43823          	sd	a5,-80(s0)
    1892:	a049                	j	1914 <schedule_dm+0x22e>
        int interval = cur->release_time - current_time;
    1894:	fb043783          	ld	a5,-80(s0)
    1898:	4f98                	lw	a4,24(a5)
    189a:	fac42783          	lw	a5,-84(s0)
    189e:	40f707bb          	subw	a5,a4,a5
    18a2:	f8f42a23          	sw	a5,-108(s0)
        if (interval > executing_time) continue;
    18a6:	f9442703          	lw	a4,-108(s0)
    18aa:	fbc42783          	lw	a5,-68(s0)
    18ae:	2701                	sext.w	a4,a4
    18b0:	2781                	sext.w	a5,a5
    18b2:	04e7c263          	blt	a5,a4,18f6 <schedule_dm+0x210>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    18b6:	fc843783          	ld	a5,-56(s0)
    18ba:	47f8                	lw	a4,76(a5)
    18bc:	fb043783          	ld	a5,-80(s0)
    18c0:	639c                	ld	a5,0(a5)
    18c2:	47fc                	lw	a5,76(a5)
    18c4:	02f74b63          	blt	a4,a5,18fa <schedule_dm+0x214>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    18c8:	fc843783          	ld	a5,-56(s0)
    18cc:	47f8                	lw	a4,76(a5)
    18ce:	fb043783          	ld	a5,-80(s0)
    18d2:	639c                	ld	a5,0(a5)
    18d4:	47fc                	lw	a5,76(a5)
    18d6:	00f71b63          	bne	a4,a5,18ec <schedule_dm+0x206>
    18da:	fc843783          	ld	a5,-56(s0)
    18de:	5fd8                	lw	a4,60(a5)
    18e0:	fb043783          	ld	a5,-80(s0)
    18e4:	639c                	ld	a5,0(a5)
    18e6:	5fdc                	lw	a5,60(a5)
    18e8:	00f74b63          	blt	a4,a5,18fe <schedule_dm+0x218>
        executing_time = interval;
    18ec:	f9442783          	lw	a5,-108(s0)
    18f0:	faf42e23          	sw	a5,-68(s0)
    18f4:	a031                	j	1900 <schedule_dm+0x21a>
        if (interval > executing_time) continue;
    18f6:	0001                	nop
    18f8:	a021                	j	1900 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    18fa:	0001                	nop
    18fc:	a011                	j	1900 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    18fe:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1900:	fb043783          	ld	a5,-80(s0)
    1904:	679c                	ld	a5,8(a5)
    1906:	f8f43423          	sd	a5,-120(s0)
    190a:	f8843783          	ld	a5,-120(s0)
    190e:	17e1                	addi	a5,a5,-8
    1910:	faf43823          	sd	a5,-80(s0)
    1914:	fb043783          	ld	a5,-80(s0)
    1918:	00878713          	addi	a4,a5,8
    191c:	689c                	ld	a5,16(s1)
    191e:	f6f71be3          	bne	a4,a5,1894 <schedule_dm+0x1ae>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &highest_priority_thread->thread_list;
    1922:	fc843783          	ld	a5,-56(s0)
    1926:	02878793          	addi	a5,a5,40
    192a:	f6f43023          	sd	a5,-160(s0)
    r.allocated_time = executing_time;
    192e:	fbc42783          	lw	a5,-68(s0)
    1932:	f6f42423          	sw	a5,-152(s0)
    return r;
    1936:	f6043783          	ld	a5,-160(s0)
    193a:	f6f43823          	sd	a5,-144(s0)
    193e:	f6843783          	ld	a5,-152(s0)
    1942:	f6f43c23          	sd	a5,-136(s0)
    1946:	4701                	li	a4,0
    1948:	f7043703          	ld	a4,-144(s0)
    194c:	4781                	li	a5,0
    194e:	f7843783          	ld	a5,-136(s0)
    1952:	893a                	mv	s2,a4
    1954:	89be                	mv	s3,a5
    1956:	874a                	mv	a4,s2
    1958:	87ce                	mv	a5,s3
    195a:	853a                	mv	a0,a4
    195c:	85be                	mv	a1,a5
    195e:	60ae                	ld	ra,200(sp)
    1960:	640e                	ld	s0,192(sp)
    1962:	74ea                	ld	s1,184(sp)
    1964:	794a                	ld	s2,176(sp)
    1966:	79aa                	ld	s3,168(sp)
    1968:	6169                	addi	sp,sp,208
    196a:	8082                	ret
