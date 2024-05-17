
user/_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	f426                	sd	s1,40(sp)
       8:	0080                	addi	s0,sp,64
       a:	87aa                	mv	a5,a0
       c:	fcb43023          	sd	a1,-64(s0)
      10:	fcf42623          	sw	a5,-52(s0)
  int i;

  for(i = 1; i < argc; i++){
      14:	4785                	li	a5,1
      16:	fcf42e23          	sw	a5,-36(s0)
      1a:	a051                	j	9e <main+0x9e>
    write(1, argv[i], strlen(argv[i]));
      1c:	fdc42783          	lw	a5,-36(s0)
      20:	078e                	slli	a5,a5,0x3
      22:	fc043703          	ld	a4,-64(s0)
      26:	97ba                	add	a5,a5,a4
      28:	6384                	ld	s1,0(a5)
      2a:	fdc42783          	lw	a5,-36(s0)
      2e:	078e                	slli	a5,a5,0x3
      30:	fc043703          	ld	a4,-64(s0)
      34:	97ba                	add	a5,a5,a4
      36:	639c                	ld	a5,0(a5)
      38:	853e                	mv	a0,a5
      3a:	00000097          	auipc	ra,0x0
      3e:	12e080e7          	jalr	302(ra) # 168 <strlen>
      42:	87aa                	mv	a5,a0
      44:	2781                	sext.w	a5,a5
      46:	2781                	sext.w	a5,a5
      48:	863e                	mv	a2,a5
      4a:	85a6                	mv	a1,s1
      4c:	4505                	li	a0,1
      4e:	00000097          	auipc	ra,0x0
      52:	51a080e7          	jalr	1306(ra) # 568 <write>
    if(i + 1 < argc){
      56:	fdc42783          	lw	a5,-36(s0)
      5a:	2785                	addiw	a5,a5,1
      5c:	0007871b          	sext.w	a4,a5
      60:	fcc42783          	lw	a5,-52(s0)
      64:	2781                	sext.w	a5,a5
      66:	00f75d63          	bge	a4,a5,80 <main+0x80>
      write(1, " ", 1);
      6a:	4605                	li	a2,1
      6c:	00002597          	auipc	a1,0x2
      70:	83458593          	addi	a1,a1,-1996 # 18a0 <schedule_dm+0x28c>
      74:	4505                	li	a0,1
      76:	00000097          	auipc	ra,0x0
      7a:	4f2080e7          	jalr	1266(ra) # 568 <write>
      7e:	a819                	j	94 <main+0x94>
    } else {
      write(1, "\n", 1);
      80:	4605                	li	a2,1
      82:	00002597          	auipc	a1,0x2
      86:	82658593          	addi	a1,a1,-2010 # 18a8 <schedule_dm+0x294>
      8a:	4505                	li	a0,1
      8c:	00000097          	auipc	ra,0x0
      90:	4dc080e7          	jalr	1244(ra) # 568 <write>
  for(i = 1; i < argc; i++){
      94:	fdc42783          	lw	a5,-36(s0)
      98:	2785                	addiw	a5,a5,1
      9a:	fcf42e23          	sw	a5,-36(s0)
      9e:	fdc42703          	lw	a4,-36(s0)
      a2:	fcc42783          	lw	a5,-52(s0)
      a6:	2701                	sext.w	a4,a4
      a8:	2781                	sext.w	a5,a5
      aa:	f6f749e3          	blt	a4,a5,1c <main+0x1c>
    }
  }
  exit(0);
      ae:	4501                	li	a0,0
      b0:	00000097          	auipc	ra,0x0
      b4:	498080e7          	jalr	1176(ra) # 548 <exit>

00000000000000b8 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      b8:	7179                	addi	sp,sp,-48
      ba:	f422                	sd	s0,40(sp)
      bc:	1800                	addi	s0,sp,48
      be:	fca43c23          	sd	a0,-40(s0)
      c2:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      c6:	fd843783          	ld	a5,-40(s0)
      ca:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      ce:	0001                	nop
      d0:	fd043703          	ld	a4,-48(s0)
      d4:	00170793          	addi	a5,a4,1
      d8:	fcf43823          	sd	a5,-48(s0)
      dc:	fd843783          	ld	a5,-40(s0)
      e0:	00178693          	addi	a3,a5,1
      e4:	fcd43c23          	sd	a3,-40(s0)
      e8:	00074703          	lbu	a4,0(a4)
      ec:	00e78023          	sb	a4,0(a5)
      f0:	0007c783          	lbu	a5,0(a5)
      f4:	fff1                	bnez	a5,d0 <strcpy+0x18>
    ;
  return os;
      f6:	fe843783          	ld	a5,-24(s0)
}
      fa:	853e                	mv	a0,a5
      fc:	7422                	ld	s0,40(sp)
      fe:	6145                	addi	sp,sp,48
     100:	8082                	ret

0000000000000102 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     102:	1101                	addi	sp,sp,-32
     104:	ec22                	sd	s0,24(sp)
     106:	1000                	addi	s0,sp,32
     108:	fea43423          	sd	a0,-24(s0)
     10c:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     110:	a819                	j	126 <strcmp+0x24>
    p++, q++;
     112:	fe843783          	ld	a5,-24(s0)
     116:	0785                	addi	a5,a5,1
     118:	fef43423          	sd	a5,-24(s0)
     11c:	fe043783          	ld	a5,-32(s0)
     120:	0785                	addi	a5,a5,1
     122:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     126:	fe843783          	ld	a5,-24(s0)
     12a:	0007c783          	lbu	a5,0(a5)
     12e:	cb99                	beqz	a5,144 <strcmp+0x42>
     130:	fe843783          	ld	a5,-24(s0)
     134:	0007c703          	lbu	a4,0(a5)
     138:	fe043783          	ld	a5,-32(s0)
     13c:	0007c783          	lbu	a5,0(a5)
     140:	fcf709e3          	beq	a4,a5,112 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     144:	fe843783          	ld	a5,-24(s0)
     148:	0007c783          	lbu	a5,0(a5)
     14c:	0007871b          	sext.w	a4,a5
     150:	fe043783          	ld	a5,-32(s0)
     154:	0007c783          	lbu	a5,0(a5)
     158:	2781                	sext.w	a5,a5
     15a:	40f707bb          	subw	a5,a4,a5
     15e:	2781                	sext.w	a5,a5
}
     160:	853e                	mv	a0,a5
     162:	6462                	ld	s0,24(sp)
     164:	6105                	addi	sp,sp,32
     166:	8082                	ret

0000000000000168 <strlen>:

uint
strlen(const char *s)
{
     168:	7179                	addi	sp,sp,-48
     16a:	f422                	sd	s0,40(sp)
     16c:	1800                	addi	s0,sp,48
     16e:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     172:	fe042623          	sw	zero,-20(s0)
     176:	a031                	j	182 <strlen+0x1a>
     178:	fec42783          	lw	a5,-20(s0)
     17c:	2785                	addiw	a5,a5,1
     17e:	fef42623          	sw	a5,-20(s0)
     182:	fec42783          	lw	a5,-20(s0)
     186:	fd843703          	ld	a4,-40(s0)
     18a:	97ba                	add	a5,a5,a4
     18c:	0007c783          	lbu	a5,0(a5)
     190:	f7e5                	bnez	a5,178 <strlen+0x10>
    ;
  return n;
     192:	fec42783          	lw	a5,-20(s0)
}
     196:	853e                	mv	a0,a5
     198:	7422                	ld	s0,40(sp)
     19a:	6145                	addi	sp,sp,48
     19c:	8082                	ret

000000000000019e <memset>:

void*
memset(void *dst, int c, uint n)
{
     19e:	7179                	addi	sp,sp,-48
     1a0:	f422                	sd	s0,40(sp)
     1a2:	1800                	addi	s0,sp,48
     1a4:	fca43c23          	sd	a0,-40(s0)
     1a8:	87ae                	mv	a5,a1
     1aa:	8732                	mv	a4,a2
     1ac:	fcf42a23          	sw	a5,-44(s0)
     1b0:	87ba                	mv	a5,a4
     1b2:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     1b6:	fd843783          	ld	a5,-40(s0)
     1ba:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     1be:	fe042623          	sw	zero,-20(s0)
     1c2:	a00d                	j	1e4 <memset+0x46>
    cdst[i] = c;
     1c4:	fec42783          	lw	a5,-20(s0)
     1c8:	fe043703          	ld	a4,-32(s0)
     1cc:	97ba                	add	a5,a5,a4
     1ce:	fd442703          	lw	a4,-44(s0)
     1d2:	0ff77713          	andi	a4,a4,255
     1d6:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1da:	fec42783          	lw	a5,-20(s0)
     1de:	2785                	addiw	a5,a5,1
     1e0:	fef42623          	sw	a5,-20(s0)
     1e4:	fec42703          	lw	a4,-20(s0)
     1e8:	fd042783          	lw	a5,-48(s0)
     1ec:	2781                	sext.w	a5,a5
     1ee:	fcf76be3          	bltu	a4,a5,1c4 <memset+0x26>
  }
  return dst;
     1f2:	fd843783          	ld	a5,-40(s0)
}
     1f6:	853e                	mv	a0,a5
     1f8:	7422                	ld	s0,40(sp)
     1fa:	6145                	addi	sp,sp,48
     1fc:	8082                	ret

00000000000001fe <strchr>:

char*
strchr(const char *s, char c)
{
     1fe:	1101                	addi	sp,sp,-32
     200:	ec22                	sd	s0,24(sp)
     202:	1000                	addi	s0,sp,32
     204:	fea43423          	sd	a0,-24(s0)
     208:	87ae                	mv	a5,a1
     20a:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     20e:	a01d                	j	234 <strchr+0x36>
    if(*s == c)
     210:	fe843783          	ld	a5,-24(s0)
     214:	0007c703          	lbu	a4,0(a5)
     218:	fe744783          	lbu	a5,-25(s0)
     21c:	0ff7f793          	andi	a5,a5,255
     220:	00e79563          	bne	a5,a4,22a <strchr+0x2c>
      return (char*)s;
     224:	fe843783          	ld	a5,-24(s0)
     228:	a821                	j	240 <strchr+0x42>
  for(; *s; s++)
     22a:	fe843783          	ld	a5,-24(s0)
     22e:	0785                	addi	a5,a5,1
     230:	fef43423          	sd	a5,-24(s0)
     234:	fe843783          	ld	a5,-24(s0)
     238:	0007c783          	lbu	a5,0(a5)
     23c:	fbf1                	bnez	a5,210 <strchr+0x12>
  return 0;
     23e:	4781                	li	a5,0
}
     240:	853e                	mv	a0,a5
     242:	6462                	ld	s0,24(sp)
     244:	6105                	addi	sp,sp,32
     246:	8082                	ret

0000000000000248 <gets>:

char*
gets(char *buf, int max)
{
     248:	7179                	addi	sp,sp,-48
     24a:	f406                	sd	ra,40(sp)
     24c:	f022                	sd	s0,32(sp)
     24e:	1800                	addi	s0,sp,48
     250:	fca43c23          	sd	a0,-40(s0)
     254:	87ae                	mv	a5,a1
     256:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     25a:	fe042623          	sw	zero,-20(s0)
     25e:	a8a1                	j	2b6 <gets+0x6e>
    cc = read(0, &c, 1);
     260:	fe740793          	addi	a5,s0,-25
     264:	4605                	li	a2,1
     266:	85be                	mv	a1,a5
     268:	4501                	li	a0,0
     26a:	00000097          	auipc	ra,0x0
     26e:	2f6080e7          	jalr	758(ra) # 560 <read>
     272:	87aa                	mv	a5,a0
     274:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     278:	fe842783          	lw	a5,-24(s0)
     27c:	2781                	sext.w	a5,a5
     27e:	04f05763          	blez	a5,2cc <gets+0x84>
      break;
    buf[i++] = c;
     282:	fec42783          	lw	a5,-20(s0)
     286:	0017871b          	addiw	a4,a5,1
     28a:	fee42623          	sw	a4,-20(s0)
     28e:	873e                	mv	a4,a5
     290:	fd843783          	ld	a5,-40(s0)
     294:	97ba                	add	a5,a5,a4
     296:	fe744703          	lbu	a4,-25(s0)
     29a:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     29e:	fe744783          	lbu	a5,-25(s0)
     2a2:	873e                	mv	a4,a5
     2a4:	47a9                	li	a5,10
     2a6:	02f70463          	beq	a4,a5,2ce <gets+0x86>
     2aa:	fe744783          	lbu	a5,-25(s0)
     2ae:	873e                	mv	a4,a5
     2b0:	47b5                	li	a5,13
     2b2:	00f70e63          	beq	a4,a5,2ce <gets+0x86>
  for(i=0; i+1 < max; ){
     2b6:	fec42783          	lw	a5,-20(s0)
     2ba:	2785                	addiw	a5,a5,1
     2bc:	0007871b          	sext.w	a4,a5
     2c0:	fd442783          	lw	a5,-44(s0)
     2c4:	2781                	sext.w	a5,a5
     2c6:	f8f74de3          	blt	a4,a5,260 <gets+0x18>
     2ca:	a011                	j	2ce <gets+0x86>
      break;
     2cc:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2ce:	fec42783          	lw	a5,-20(s0)
     2d2:	fd843703          	ld	a4,-40(s0)
     2d6:	97ba                	add	a5,a5,a4
     2d8:	00078023          	sb	zero,0(a5)
  return buf;
     2dc:	fd843783          	ld	a5,-40(s0)
}
     2e0:	853e                	mv	a0,a5
     2e2:	70a2                	ld	ra,40(sp)
     2e4:	7402                	ld	s0,32(sp)
     2e6:	6145                	addi	sp,sp,48
     2e8:	8082                	ret

00000000000002ea <stat>:

int
stat(const char *n, struct stat *st)
{
     2ea:	7179                	addi	sp,sp,-48
     2ec:	f406                	sd	ra,40(sp)
     2ee:	f022                	sd	s0,32(sp)
     2f0:	1800                	addi	s0,sp,48
     2f2:	fca43c23          	sd	a0,-40(s0)
     2f6:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2fa:	4581                	li	a1,0
     2fc:	fd843503          	ld	a0,-40(s0)
     300:	00000097          	auipc	ra,0x0
     304:	288080e7          	jalr	648(ra) # 588 <open>
     308:	87aa                	mv	a5,a0
     30a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     30e:	fec42783          	lw	a5,-20(s0)
     312:	2781                	sext.w	a5,a5
     314:	0007d463          	bgez	a5,31c <stat+0x32>
    return -1;
     318:	57fd                	li	a5,-1
     31a:	a035                	j	346 <stat+0x5c>
  r = fstat(fd, st);
     31c:	fec42783          	lw	a5,-20(s0)
     320:	fd043583          	ld	a1,-48(s0)
     324:	853e                	mv	a0,a5
     326:	00000097          	auipc	ra,0x0
     32a:	27a080e7          	jalr	634(ra) # 5a0 <fstat>
     32e:	87aa                	mv	a5,a0
     330:	fef42423          	sw	a5,-24(s0)
  close(fd);
     334:	fec42783          	lw	a5,-20(s0)
     338:	853e                	mv	a0,a5
     33a:	00000097          	auipc	ra,0x0
     33e:	236080e7          	jalr	566(ra) # 570 <close>
  return r;
     342:	fe842783          	lw	a5,-24(s0)
}
     346:	853e                	mv	a0,a5
     348:	70a2                	ld	ra,40(sp)
     34a:	7402                	ld	s0,32(sp)
     34c:	6145                	addi	sp,sp,48
     34e:	8082                	ret

0000000000000350 <atoi>:

int
atoi(const char *s)
{
     350:	7179                	addi	sp,sp,-48
     352:	f422                	sd	s0,40(sp)
     354:	1800                	addi	s0,sp,48
     356:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     35a:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     35e:	a815                	j	392 <atoi+0x42>
    n = n*10 + *s++ - '0';
     360:	fec42703          	lw	a4,-20(s0)
     364:	87ba                	mv	a5,a4
     366:	0027979b          	slliw	a5,a5,0x2
     36a:	9fb9                	addw	a5,a5,a4
     36c:	0017979b          	slliw	a5,a5,0x1
     370:	0007871b          	sext.w	a4,a5
     374:	fd843783          	ld	a5,-40(s0)
     378:	00178693          	addi	a3,a5,1
     37c:	fcd43c23          	sd	a3,-40(s0)
     380:	0007c783          	lbu	a5,0(a5)
     384:	2781                	sext.w	a5,a5
     386:	9fb9                	addw	a5,a5,a4
     388:	2781                	sext.w	a5,a5
     38a:	fd07879b          	addiw	a5,a5,-48
     38e:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     392:	fd843783          	ld	a5,-40(s0)
     396:	0007c783          	lbu	a5,0(a5)
     39a:	873e                	mv	a4,a5
     39c:	02f00793          	li	a5,47
     3a0:	00e7fb63          	bgeu	a5,a4,3b6 <atoi+0x66>
     3a4:	fd843783          	ld	a5,-40(s0)
     3a8:	0007c783          	lbu	a5,0(a5)
     3ac:	873e                	mv	a4,a5
     3ae:	03900793          	li	a5,57
     3b2:	fae7f7e3          	bgeu	a5,a4,360 <atoi+0x10>
  return n;
     3b6:	fec42783          	lw	a5,-20(s0)
}
     3ba:	853e                	mv	a0,a5
     3bc:	7422                	ld	s0,40(sp)
     3be:	6145                	addi	sp,sp,48
     3c0:	8082                	ret

00000000000003c2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     3c2:	7139                	addi	sp,sp,-64
     3c4:	fc22                	sd	s0,56(sp)
     3c6:	0080                	addi	s0,sp,64
     3c8:	fca43c23          	sd	a0,-40(s0)
     3cc:	fcb43823          	sd	a1,-48(s0)
     3d0:	87b2                	mv	a5,a2
     3d2:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3d6:	fd843783          	ld	a5,-40(s0)
     3da:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3de:	fd043783          	ld	a5,-48(s0)
     3e2:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3e6:	fe043703          	ld	a4,-32(s0)
     3ea:	fe843783          	ld	a5,-24(s0)
     3ee:	02e7fc63          	bgeu	a5,a4,426 <memmove+0x64>
    while(n-- > 0)
     3f2:	a00d                	j	414 <memmove+0x52>
      *dst++ = *src++;
     3f4:	fe043703          	ld	a4,-32(s0)
     3f8:	00170793          	addi	a5,a4,1
     3fc:	fef43023          	sd	a5,-32(s0)
     400:	fe843783          	ld	a5,-24(s0)
     404:	00178693          	addi	a3,a5,1
     408:	fed43423          	sd	a3,-24(s0)
     40c:	00074703          	lbu	a4,0(a4)
     410:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     414:	fcc42783          	lw	a5,-52(s0)
     418:	fff7871b          	addiw	a4,a5,-1
     41c:	fce42623          	sw	a4,-52(s0)
     420:	fcf04ae3          	bgtz	a5,3f4 <memmove+0x32>
     424:	a891                	j	478 <memmove+0xb6>
  } else {
    dst += n;
     426:	fcc42783          	lw	a5,-52(s0)
     42a:	fe843703          	ld	a4,-24(s0)
     42e:	97ba                	add	a5,a5,a4
     430:	fef43423          	sd	a5,-24(s0)
    src += n;
     434:	fcc42783          	lw	a5,-52(s0)
     438:	fe043703          	ld	a4,-32(s0)
     43c:	97ba                	add	a5,a5,a4
     43e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     442:	a01d                	j	468 <memmove+0xa6>
      *--dst = *--src;
     444:	fe043783          	ld	a5,-32(s0)
     448:	17fd                	addi	a5,a5,-1
     44a:	fef43023          	sd	a5,-32(s0)
     44e:	fe843783          	ld	a5,-24(s0)
     452:	17fd                	addi	a5,a5,-1
     454:	fef43423          	sd	a5,-24(s0)
     458:	fe043783          	ld	a5,-32(s0)
     45c:	0007c703          	lbu	a4,0(a5)
     460:	fe843783          	ld	a5,-24(s0)
     464:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     468:	fcc42783          	lw	a5,-52(s0)
     46c:	fff7871b          	addiw	a4,a5,-1
     470:	fce42623          	sw	a4,-52(s0)
     474:	fcf048e3          	bgtz	a5,444 <memmove+0x82>
  }
  return vdst;
     478:	fd843783          	ld	a5,-40(s0)
}
     47c:	853e                	mv	a0,a5
     47e:	7462                	ld	s0,56(sp)
     480:	6121                	addi	sp,sp,64
     482:	8082                	ret

0000000000000484 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     484:	7139                	addi	sp,sp,-64
     486:	fc22                	sd	s0,56(sp)
     488:	0080                	addi	s0,sp,64
     48a:	fca43c23          	sd	a0,-40(s0)
     48e:	fcb43823          	sd	a1,-48(s0)
     492:	87b2                	mv	a5,a2
     494:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     498:	fd843783          	ld	a5,-40(s0)
     49c:	fef43423          	sd	a5,-24(s0)
     4a0:	fd043783          	ld	a5,-48(s0)
     4a4:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4a8:	a0a1                	j	4f0 <memcmp+0x6c>
    if (*p1 != *p2) {
     4aa:	fe843783          	ld	a5,-24(s0)
     4ae:	0007c703          	lbu	a4,0(a5)
     4b2:	fe043783          	ld	a5,-32(s0)
     4b6:	0007c783          	lbu	a5,0(a5)
     4ba:	02f70163          	beq	a4,a5,4dc <memcmp+0x58>
      return *p1 - *p2;
     4be:	fe843783          	ld	a5,-24(s0)
     4c2:	0007c783          	lbu	a5,0(a5)
     4c6:	0007871b          	sext.w	a4,a5
     4ca:	fe043783          	ld	a5,-32(s0)
     4ce:	0007c783          	lbu	a5,0(a5)
     4d2:	2781                	sext.w	a5,a5
     4d4:	40f707bb          	subw	a5,a4,a5
     4d8:	2781                	sext.w	a5,a5
     4da:	a01d                	j	500 <memcmp+0x7c>
    }
    p1++;
     4dc:	fe843783          	ld	a5,-24(s0)
     4e0:	0785                	addi	a5,a5,1
     4e2:	fef43423          	sd	a5,-24(s0)
    p2++;
     4e6:	fe043783          	ld	a5,-32(s0)
     4ea:	0785                	addi	a5,a5,1
     4ec:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4f0:	fcc42783          	lw	a5,-52(s0)
     4f4:	fff7871b          	addiw	a4,a5,-1
     4f8:	fce42623          	sw	a4,-52(s0)
     4fc:	f7dd                	bnez	a5,4aa <memcmp+0x26>
  }
  return 0;
     4fe:	4781                	li	a5,0
}
     500:	853e                	mv	a0,a5
     502:	7462                	ld	s0,56(sp)
     504:	6121                	addi	sp,sp,64
     506:	8082                	ret

0000000000000508 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     508:	7179                	addi	sp,sp,-48
     50a:	f406                	sd	ra,40(sp)
     50c:	f022                	sd	s0,32(sp)
     50e:	1800                	addi	s0,sp,48
     510:	fea43423          	sd	a0,-24(s0)
     514:	feb43023          	sd	a1,-32(s0)
     518:	87b2                	mv	a5,a2
     51a:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     51e:	fdc42783          	lw	a5,-36(s0)
     522:	863e                	mv	a2,a5
     524:	fe043583          	ld	a1,-32(s0)
     528:	fe843503          	ld	a0,-24(s0)
     52c:	00000097          	auipc	ra,0x0
     530:	e96080e7          	jalr	-362(ra) # 3c2 <memmove>
     534:	87aa                	mv	a5,a0
}
     536:	853e                	mv	a0,a5
     538:	70a2                	ld	ra,40(sp)
     53a:	7402                	ld	s0,32(sp)
     53c:	6145                	addi	sp,sp,48
     53e:	8082                	ret

0000000000000540 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     540:	4885                	li	a7,1
 ecall
     542:	00000073          	ecall
 ret
     546:	8082                	ret

0000000000000548 <exit>:
.global exit
exit:
 li a7, SYS_exit
     548:	4889                	li	a7,2
 ecall
     54a:	00000073          	ecall
 ret
     54e:	8082                	ret

0000000000000550 <wait>:
.global wait
wait:
 li a7, SYS_wait
     550:	488d                	li	a7,3
 ecall
     552:	00000073          	ecall
 ret
     556:	8082                	ret

0000000000000558 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     558:	4891                	li	a7,4
 ecall
     55a:	00000073          	ecall
 ret
     55e:	8082                	ret

0000000000000560 <read>:
.global read
read:
 li a7, SYS_read
     560:	4895                	li	a7,5
 ecall
     562:	00000073          	ecall
 ret
     566:	8082                	ret

0000000000000568 <write>:
.global write
write:
 li a7, SYS_write
     568:	48c1                	li	a7,16
 ecall
     56a:	00000073          	ecall
 ret
     56e:	8082                	ret

0000000000000570 <close>:
.global close
close:
 li a7, SYS_close
     570:	48d5                	li	a7,21
 ecall
     572:	00000073          	ecall
 ret
     576:	8082                	ret

0000000000000578 <kill>:
.global kill
kill:
 li a7, SYS_kill
     578:	4899                	li	a7,6
 ecall
     57a:	00000073          	ecall
 ret
     57e:	8082                	ret

0000000000000580 <exec>:
.global exec
exec:
 li a7, SYS_exec
     580:	489d                	li	a7,7
 ecall
     582:	00000073          	ecall
 ret
     586:	8082                	ret

0000000000000588 <open>:
.global open
open:
 li a7, SYS_open
     588:	48bd                	li	a7,15
 ecall
     58a:	00000073          	ecall
 ret
     58e:	8082                	ret

0000000000000590 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     590:	48c5                	li	a7,17
 ecall
     592:	00000073          	ecall
 ret
     596:	8082                	ret

0000000000000598 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     598:	48c9                	li	a7,18
 ecall
     59a:	00000073          	ecall
 ret
     59e:	8082                	ret

00000000000005a0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     5a0:	48a1                	li	a7,8
 ecall
     5a2:	00000073          	ecall
 ret
     5a6:	8082                	ret

00000000000005a8 <link>:
.global link
link:
 li a7, SYS_link
     5a8:	48cd                	li	a7,19
 ecall
     5aa:	00000073          	ecall
 ret
     5ae:	8082                	ret

00000000000005b0 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     5b0:	48d1                	li	a7,20
 ecall
     5b2:	00000073          	ecall
 ret
     5b6:	8082                	ret

00000000000005b8 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     5b8:	48a5                	li	a7,9
 ecall
     5ba:	00000073          	ecall
 ret
     5be:	8082                	ret

00000000000005c0 <dup>:
.global dup
dup:
 li a7, SYS_dup
     5c0:	48a9                	li	a7,10
 ecall
     5c2:	00000073          	ecall
 ret
     5c6:	8082                	ret

00000000000005c8 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     5c8:	48ad                	li	a7,11
 ecall
     5ca:	00000073          	ecall
 ret
     5ce:	8082                	ret

00000000000005d0 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5d0:	48b1                	li	a7,12
 ecall
     5d2:	00000073          	ecall
 ret
     5d6:	8082                	ret

00000000000005d8 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5d8:	48b5                	li	a7,13
 ecall
     5da:	00000073          	ecall
 ret
     5de:	8082                	ret

00000000000005e0 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5e0:	48b9                	li	a7,14
 ecall
     5e2:	00000073          	ecall
 ret
     5e6:	8082                	ret

00000000000005e8 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5e8:	48d9                	li	a7,22
 ecall
     5ea:	00000073          	ecall
 ret
     5ee:	8082                	ret

00000000000005f0 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5f0:	48dd                	li	a7,23
 ecall
     5f2:	00000073          	ecall
 ret
     5f6:	8082                	ret

00000000000005f8 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5f8:	48e1                	li	a7,24
 ecall
     5fa:	00000073          	ecall
 ret
     5fe:	8082                	ret

0000000000000600 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     600:	1101                	addi	sp,sp,-32
     602:	ec06                	sd	ra,24(sp)
     604:	e822                	sd	s0,16(sp)
     606:	1000                	addi	s0,sp,32
     608:	87aa                	mv	a5,a0
     60a:	872e                	mv	a4,a1
     60c:	fef42623          	sw	a5,-20(s0)
     610:	87ba                	mv	a5,a4
     612:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     616:	feb40713          	addi	a4,s0,-21
     61a:	fec42783          	lw	a5,-20(s0)
     61e:	4605                	li	a2,1
     620:	85ba                	mv	a1,a4
     622:	853e                	mv	a0,a5
     624:	00000097          	auipc	ra,0x0
     628:	f44080e7          	jalr	-188(ra) # 568 <write>
}
     62c:	0001                	nop
     62e:	60e2                	ld	ra,24(sp)
     630:	6442                	ld	s0,16(sp)
     632:	6105                	addi	sp,sp,32
     634:	8082                	ret

0000000000000636 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     636:	7139                	addi	sp,sp,-64
     638:	fc06                	sd	ra,56(sp)
     63a:	f822                	sd	s0,48(sp)
     63c:	0080                	addi	s0,sp,64
     63e:	87aa                	mv	a5,a0
     640:	8736                	mv	a4,a3
     642:	fcf42623          	sw	a5,-52(s0)
     646:	87ae                	mv	a5,a1
     648:	fcf42423          	sw	a5,-56(s0)
     64c:	87b2                	mv	a5,a2
     64e:	fcf42223          	sw	a5,-60(s0)
     652:	87ba                	mv	a5,a4
     654:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     658:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     65c:	fc042783          	lw	a5,-64(s0)
     660:	2781                	sext.w	a5,a5
     662:	c38d                	beqz	a5,684 <printint+0x4e>
     664:	fc842783          	lw	a5,-56(s0)
     668:	2781                	sext.w	a5,a5
     66a:	0007dd63          	bgez	a5,684 <printint+0x4e>
    neg = 1;
     66e:	4785                	li	a5,1
     670:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     674:	fc842783          	lw	a5,-56(s0)
     678:	40f007bb          	negw	a5,a5
     67c:	2781                	sext.w	a5,a5
     67e:	fef42223          	sw	a5,-28(s0)
     682:	a029                	j	68c <printint+0x56>
  } else {
    x = xx;
     684:	fc842783          	lw	a5,-56(s0)
     688:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     68c:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     690:	fc442783          	lw	a5,-60(s0)
     694:	fe442703          	lw	a4,-28(s0)
     698:	02f777bb          	remuw	a5,a4,a5
     69c:	0007861b          	sext.w	a2,a5
     6a0:	fec42783          	lw	a5,-20(s0)
     6a4:	0017871b          	addiw	a4,a5,1
     6a8:	fee42623          	sw	a4,-20(s0)
     6ac:	00001697          	auipc	a3,0x1
     6b0:	20c68693          	addi	a3,a3,524 # 18b8 <digits>
     6b4:	02061713          	slli	a4,a2,0x20
     6b8:	9301                	srli	a4,a4,0x20
     6ba:	9736                	add	a4,a4,a3
     6bc:	00074703          	lbu	a4,0(a4)
     6c0:	ff040693          	addi	a3,s0,-16
     6c4:	97b6                	add	a5,a5,a3
     6c6:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     6ca:	fc442783          	lw	a5,-60(s0)
     6ce:	fe442703          	lw	a4,-28(s0)
     6d2:	02f757bb          	divuw	a5,a4,a5
     6d6:	fef42223          	sw	a5,-28(s0)
     6da:	fe442783          	lw	a5,-28(s0)
     6de:	2781                	sext.w	a5,a5
     6e0:	fbc5                	bnez	a5,690 <printint+0x5a>
  if(neg)
     6e2:	fe842783          	lw	a5,-24(s0)
     6e6:	2781                	sext.w	a5,a5
     6e8:	cf95                	beqz	a5,724 <printint+0xee>
    buf[i++] = '-';
     6ea:	fec42783          	lw	a5,-20(s0)
     6ee:	0017871b          	addiw	a4,a5,1
     6f2:	fee42623          	sw	a4,-20(s0)
     6f6:	ff040713          	addi	a4,s0,-16
     6fa:	97ba                	add	a5,a5,a4
     6fc:	02d00713          	li	a4,45
     700:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     704:	a005                	j	724 <printint+0xee>
    putc(fd, buf[i]);
     706:	fec42783          	lw	a5,-20(s0)
     70a:	ff040713          	addi	a4,s0,-16
     70e:	97ba                	add	a5,a5,a4
     710:	fe07c703          	lbu	a4,-32(a5)
     714:	fcc42783          	lw	a5,-52(s0)
     718:	85ba                	mv	a1,a4
     71a:	853e                	mv	a0,a5
     71c:	00000097          	auipc	ra,0x0
     720:	ee4080e7          	jalr	-284(ra) # 600 <putc>
  while(--i >= 0)
     724:	fec42783          	lw	a5,-20(s0)
     728:	37fd                	addiw	a5,a5,-1
     72a:	fef42623          	sw	a5,-20(s0)
     72e:	fec42783          	lw	a5,-20(s0)
     732:	2781                	sext.w	a5,a5
     734:	fc07d9e3          	bgez	a5,706 <printint+0xd0>
}
     738:	0001                	nop
     73a:	0001                	nop
     73c:	70e2                	ld	ra,56(sp)
     73e:	7442                	ld	s0,48(sp)
     740:	6121                	addi	sp,sp,64
     742:	8082                	ret

0000000000000744 <printptr>:

static void
printptr(int fd, uint64 x) {
     744:	7179                	addi	sp,sp,-48
     746:	f406                	sd	ra,40(sp)
     748:	f022                	sd	s0,32(sp)
     74a:	1800                	addi	s0,sp,48
     74c:	87aa                	mv	a5,a0
     74e:	fcb43823          	sd	a1,-48(s0)
     752:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     756:	fdc42783          	lw	a5,-36(s0)
     75a:	03000593          	li	a1,48
     75e:	853e                	mv	a0,a5
     760:	00000097          	auipc	ra,0x0
     764:	ea0080e7          	jalr	-352(ra) # 600 <putc>
  putc(fd, 'x');
     768:	fdc42783          	lw	a5,-36(s0)
     76c:	07800593          	li	a1,120
     770:	853e                	mv	a0,a5
     772:	00000097          	auipc	ra,0x0
     776:	e8e080e7          	jalr	-370(ra) # 600 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     77a:	fe042623          	sw	zero,-20(s0)
     77e:	a82d                	j	7b8 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     780:	fd043783          	ld	a5,-48(s0)
     784:	93f1                	srli	a5,a5,0x3c
     786:	00001717          	auipc	a4,0x1
     78a:	13270713          	addi	a4,a4,306 # 18b8 <digits>
     78e:	97ba                	add	a5,a5,a4
     790:	0007c703          	lbu	a4,0(a5)
     794:	fdc42783          	lw	a5,-36(s0)
     798:	85ba                	mv	a1,a4
     79a:	853e                	mv	a0,a5
     79c:	00000097          	auipc	ra,0x0
     7a0:	e64080e7          	jalr	-412(ra) # 600 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7a4:	fec42783          	lw	a5,-20(s0)
     7a8:	2785                	addiw	a5,a5,1
     7aa:	fef42623          	sw	a5,-20(s0)
     7ae:	fd043783          	ld	a5,-48(s0)
     7b2:	0792                	slli	a5,a5,0x4
     7b4:	fcf43823          	sd	a5,-48(s0)
     7b8:	fec42783          	lw	a5,-20(s0)
     7bc:	873e                	mv	a4,a5
     7be:	47bd                	li	a5,15
     7c0:	fce7f0e3          	bgeu	a5,a4,780 <printptr+0x3c>
}
     7c4:	0001                	nop
     7c6:	0001                	nop
     7c8:	70a2                	ld	ra,40(sp)
     7ca:	7402                	ld	s0,32(sp)
     7cc:	6145                	addi	sp,sp,48
     7ce:	8082                	ret

00000000000007d0 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7d0:	715d                	addi	sp,sp,-80
     7d2:	e486                	sd	ra,72(sp)
     7d4:	e0a2                	sd	s0,64(sp)
     7d6:	0880                	addi	s0,sp,80
     7d8:	87aa                	mv	a5,a0
     7da:	fcb43023          	sd	a1,-64(s0)
     7de:	fac43c23          	sd	a2,-72(s0)
     7e2:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7e6:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7ea:	fe042223          	sw	zero,-28(s0)
     7ee:	a42d                	j	a18 <vprintf+0x248>
    c = fmt[i] & 0xff;
     7f0:	fe442783          	lw	a5,-28(s0)
     7f4:	fc043703          	ld	a4,-64(s0)
     7f8:	97ba                	add	a5,a5,a4
     7fa:	0007c783          	lbu	a5,0(a5)
     7fe:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     802:	fe042783          	lw	a5,-32(s0)
     806:	2781                	sext.w	a5,a5
     808:	eb9d                	bnez	a5,83e <vprintf+0x6e>
      if(c == '%'){
     80a:	fdc42783          	lw	a5,-36(s0)
     80e:	0007871b          	sext.w	a4,a5
     812:	02500793          	li	a5,37
     816:	00f71763          	bne	a4,a5,824 <vprintf+0x54>
        state = '%';
     81a:	02500793          	li	a5,37
     81e:	fef42023          	sw	a5,-32(s0)
     822:	a2f5                	j	a0e <vprintf+0x23e>
      } else {
        putc(fd, c);
     824:	fdc42783          	lw	a5,-36(s0)
     828:	0ff7f713          	andi	a4,a5,255
     82c:	fcc42783          	lw	a5,-52(s0)
     830:	85ba                	mv	a1,a4
     832:	853e                	mv	a0,a5
     834:	00000097          	auipc	ra,0x0
     838:	dcc080e7          	jalr	-564(ra) # 600 <putc>
     83c:	aac9                	j	a0e <vprintf+0x23e>
      }
    } else if(state == '%'){
     83e:	fe042783          	lw	a5,-32(s0)
     842:	0007871b          	sext.w	a4,a5
     846:	02500793          	li	a5,37
     84a:	1cf71263          	bne	a4,a5,a0e <vprintf+0x23e>
      if(c == 'd'){
     84e:	fdc42783          	lw	a5,-36(s0)
     852:	0007871b          	sext.w	a4,a5
     856:	06400793          	li	a5,100
     85a:	02f71463          	bne	a4,a5,882 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     85e:	fb843783          	ld	a5,-72(s0)
     862:	00878713          	addi	a4,a5,8
     866:	fae43c23          	sd	a4,-72(s0)
     86a:	4398                	lw	a4,0(a5)
     86c:	fcc42783          	lw	a5,-52(s0)
     870:	4685                	li	a3,1
     872:	4629                	li	a2,10
     874:	85ba                	mv	a1,a4
     876:	853e                	mv	a0,a5
     878:	00000097          	auipc	ra,0x0
     87c:	dbe080e7          	jalr	-578(ra) # 636 <printint>
     880:	a269                	j	a0a <vprintf+0x23a>
      } else if(c == 'l') {
     882:	fdc42783          	lw	a5,-36(s0)
     886:	0007871b          	sext.w	a4,a5
     88a:	06c00793          	li	a5,108
     88e:	02f71663          	bne	a4,a5,8ba <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     892:	fb843783          	ld	a5,-72(s0)
     896:	00878713          	addi	a4,a5,8
     89a:	fae43c23          	sd	a4,-72(s0)
     89e:	639c                	ld	a5,0(a5)
     8a0:	0007871b          	sext.w	a4,a5
     8a4:	fcc42783          	lw	a5,-52(s0)
     8a8:	4681                	li	a3,0
     8aa:	4629                	li	a2,10
     8ac:	85ba                	mv	a1,a4
     8ae:	853e                	mv	a0,a5
     8b0:	00000097          	auipc	ra,0x0
     8b4:	d86080e7          	jalr	-634(ra) # 636 <printint>
     8b8:	aa89                	j	a0a <vprintf+0x23a>
      } else if(c == 'x') {
     8ba:	fdc42783          	lw	a5,-36(s0)
     8be:	0007871b          	sext.w	a4,a5
     8c2:	07800793          	li	a5,120
     8c6:	02f71463          	bne	a4,a5,8ee <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     8ca:	fb843783          	ld	a5,-72(s0)
     8ce:	00878713          	addi	a4,a5,8
     8d2:	fae43c23          	sd	a4,-72(s0)
     8d6:	4398                	lw	a4,0(a5)
     8d8:	fcc42783          	lw	a5,-52(s0)
     8dc:	4681                	li	a3,0
     8de:	4641                	li	a2,16
     8e0:	85ba                	mv	a1,a4
     8e2:	853e                	mv	a0,a5
     8e4:	00000097          	auipc	ra,0x0
     8e8:	d52080e7          	jalr	-686(ra) # 636 <printint>
     8ec:	aa39                	j	a0a <vprintf+0x23a>
      } else if(c == 'p') {
     8ee:	fdc42783          	lw	a5,-36(s0)
     8f2:	0007871b          	sext.w	a4,a5
     8f6:	07000793          	li	a5,112
     8fa:	02f71263          	bne	a4,a5,91e <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8fe:	fb843783          	ld	a5,-72(s0)
     902:	00878713          	addi	a4,a5,8
     906:	fae43c23          	sd	a4,-72(s0)
     90a:	6398                	ld	a4,0(a5)
     90c:	fcc42783          	lw	a5,-52(s0)
     910:	85ba                	mv	a1,a4
     912:	853e                	mv	a0,a5
     914:	00000097          	auipc	ra,0x0
     918:	e30080e7          	jalr	-464(ra) # 744 <printptr>
     91c:	a0fd                	j	a0a <vprintf+0x23a>
      } else if(c == 's'){
     91e:	fdc42783          	lw	a5,-36(s0)
     922:	0007871b          	sext.w	a4,a5
     926:	07300793          	li	a5,115
     92a:	04f71c63          	bne	a4,a5,982 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     92e:	fb843783          	ld	a5,-72(s0)
     932:	00878713          	addi	a4,a5,8
     936:	fae43c23          	sd	a4,-72(s0)
     93a:	639c                	ld	a5,0(a5)
     93c:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     940:	fe843783          	ld	a5,-24(s0)
     944:	eb8d                	bnez	a5,976 <vprintf+0x1a6>
          s = "(null)";
     946:	00001797          	auipc	a5,0x1
     94a:	f6a78793          	addi	a5,a5,-150 # 18b0 <schedule_dm+0x29c>
     94e:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     952:	a015                	j	976 <vprintf+0x1a6>
          putc(fd, *s);
     954:	fe843783          	ld	a5,-24(s0)
     958:	0007c703          	lbu	a4,0(a5)
     95c:	fcc42783          	lw	a5,-52(s0)
     960:	85ba                	mv	a1,a4
     962:	853e                	mv	a0,a5
     964:	00000097          	auipc	ra,0x0
     968:	c9c080e7          	jalr	-868(ra) # 600 <putc>
          s++;
     96c:	fe843783          	ld	a5,-24(s0)
     970:	0785                	addi	a5,a5,1
     972:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     976:	fe843783          	ld	a5,-24(s0)
     97a:	0007c783          	lbu	a5,0(a5)
     97e:	fbf9                	bnez	a5,954 <vprintf+0x184>
     980:	a069                	j	a0a <vprintf+0x23a>
        }
      } else if(c == 'c'){
     982:	fdc42783          	lw	a5,-36(s0)
     986:	0007871b          	sext.w	a4,a5
     98a:	06300793          	li	a5,99
     98e:	02f71463          	bne	a4,a5,9b6 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     992:	fb843783          	ld	a5,-72(s0)
     996:	00878713          	addi	a4,a5,8
     99a:	fae43c23          	sd	a4,-72(s0)
     99e:	439c                	lw	a5,0(a5)
     9a0:	0ff7f713          	andi	a4,a5,255
     9a4:	fcc42783          	lw	a5,-52(s0)
     9a8:	85ba                	mv	a1,a4
     9aa:	853e                	mv	a0,a5
     9ac:	00000097          	auipc	ra,0x0
     9b0:	c54080e7          	jalr	-940(ra) # 600 <putc>
     9b4:	a899                	j	a0a <vprintf+0x23a>
      } else if(c == '%'){
     9b6:	fdc42783          	lw	a5,-36(s0)
     9ba:	0007871b          	sext.w	a4,a5
     9be:	02500793          	li	a5,37
     9c2:	00f71f63          	bne	a4,a5,9e0 <vprintf+0x210>
        putc(fd, c);
     9c6:	fdc42783          	lw	a5,-36(s0)
     9ca:	0ff7f713          	andi	a4,a5,255
     9ce:	fcc42783          	lw	a5,-52(s0)
     9d2:	85ba                	mv	a1,a4
     9d4:	853e                	mv	a0,a5
     9d6:	00000097          	auipc	ra,0x0
     9da:	c2a080e7          	jalr	-982(ra) # 600 <putc>
     9de:	a035                	j	a0a <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9e0:	fcc42783          	lw	a5,-52(s0)
     9e4:	02500593          	li	a1,37
     9e8:	853e                	mv	a0,a5
     9ea:	00000097          	auipc	ra,0x0
     9ee:	c16080e7          	jalr	-1002(ra) # 600 <putc>
        putc(fd, c);
     9f2:	fdc42783          	lw	a5,-36(s0)
     9f6:	0ff7f713          	andi	a4,a5,255
     9fa:	fcc42783          	lw	a5,-52(s0)
     9fe:	85ba                	mv	a1,a4
     a00:	853e                	mv	a0,a5
     a02:	00000097          	auipc	ra,0x0
     a06:	bfe080e7          	jalr	-1026(ra) # 600 <putc>
      }
      state = 0;
     a0a:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a0e:	fe442783          	lw	a5,-28(s0)
     a12:	2785                	addiw	a5,a5,1
     a14:	fef42223          	sw	a5,-28(s0)
     a18:	fe442783          	lw	a5,-28(s0)
     a1c:	fc043703          	ld	a4,-64(s0)
     a20:	97ba                	add	a5,a5,a4
     a22:	0007c783          	lbu	a5,0(a5)
     a26:	dc0795e3          	bnez	a5,7f0 <vprintf+0x20>
    }
  }
}
     a2a:	0001                	nop
     a2c:	0001                	nop
     a2e:	60a6                	ld	ra,72(sp)
     a30:	6406                	ld	s0,64(sp)
     a32:	6161                	addi	sp,sp,80
     a34:	8082                	ret

0000000000000a36 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a36:	7159                	addi	sp,sp,-112
     a38:	fc06                	sd	ra,56(sp)
     a3a:	f822                	sd	s0,48(sp)
     a3c:	0080                	addi	s0,sp,64
     a3e:	fcb43823          	sd	a1,-48(s0)
     a42:	e010                	sd	a2,0(s0)
     a44:	e414                	sd	a3,8(s0)
     a46:	e818                	sd	a4,16(s0)
     a48:	ec1c                	sd	a5,24(s0)
     a4a:	03043023          	sd	a6,32(s0)
     a4e:	03143423          	sd	a7,40(s0)
     a52:	87aa                	mv	a5,a0
     a54:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a58:	03040793          	addi	a5,s0,48
     a5c:	fcf43423          	sd	a5,-56(s0)
     a60:	fc843783          	ld	a5,-56(s0)
     a64:	fd078793          	addi	a5,a5,-48
     a68:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a6c:	fe843703          	ld	a4,-24(s0)
     a70:	fdc42783          	lw	a5,-36(s0)
     a74:	863a                	mv	a2,a4
     a76:	fd043583          	ld	a1,-48(s0)
     a7a:	853e                	mv	a0,a5
     a7c:	00000097          	auipc	ra,0x0
     a80:	d54080e7          	jalr	-684(ra) # 7d0 <vprintf>
}
     a84:	0001                	nop
     a86:	70e2                	ld	ra,56(sp)
     a88:	7442                	ld	s0,48(sp)
     a8a:	6165                	addi	sp,sp,112
     a8c:	8082                	ret

0000000000000a8e <printf>:

void
printf(const char *fmt, ...)
{
     a8e:	7159                	addi	sp,sp,-112
     a90:	f406                	sd	ra,40(sp)
     a92:	f022                	sd	s0,32(sp)
     a94:	1800                	addi	s0,sp,48
     a96:	fca43c23          	sd	a0,-40(s0)
     a9a:	e40c                	sd	a1,8(s0)
     a9c:	e810                	sd	a2,16(s0)
     a9e:	ec14                	sd	a3,24(s0)
     aa0:	f018                	sd	a4,32(s0)
     aa2:	f41c                	sd	a5,40(s0)
     aa4:	03043823          	sd	a6,48(s0)
     aa8:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     aac:	04040793          	addi	a5,s0,64
     ab0:	fcf43823          	sd	a5,-48(s0)
     ab4:	fd043783          	ld	a5,-48(s0)
     ab8:	fc878793          	addi	a5,a5,-56
     abc:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     ac0:	fe843783          	ld	a5,-24(s0)
     ac4:	863e                	mv	a2,a5
     ac6:	fd843583          	ld	a1,-40(s0)
     aca:	4505                	li	a0,1
     acc:	00000097          	auipc	ra,0x0
     ad0:	d04080e7          	jalr	-764(ra) # 7d0 <vprintf>
}
     ad4:	0001                	nop
     ad6:	70a2                	ld	ra,40(sp)
     ad8:	7402                	ld	s0,32(sp)
     ada:	6165                	addi	sp,sp,112
     adc:	8082                	ret

0000000000000ade <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ade:	7179                	addi	sp,sp,-48
     ae0:	f422                	sd	s0,40(sp)
     ae2:	1800                	addi	s0,sp,48
     ae4:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     ae8:	fd843783          	ld	a5,-40(s0)
     aec:	17c1                	addi	a5,a5,-16
     aee:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     af2:	00001797          	auipc	a5,0x1
     af6:	dee78793          	addi	a5,a5,-530 # 18e0 <freep>
     afa:	639c                	ld	a5,0(a5)
     afc:	fef43423          	sd	a5,-24(s0)
     b00:	a815                	j	b34 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b02:	fe843783          	ld	a5,-24(s0)
     b06:	639c                	ld	a5,0(a5)
     b08:	fe843703          	ld	a4,-24(s0)
     b0c:	00f76f63          	bltu	a4,a5,b2a <free+0x4c>
     b10:	fe043703          	ld	a4,-32(s0)
     b14:	fe843783          	ld	a5,-24(s0)
     b18:	02e7eb63          	bltu	a5,a4,b4e <free+0x70>
     b1c:	fe843783          	ld	a5,-24(s0)
     b20:	639c                	ld	a5,0(a5)
     b22:	fe043703          	ld	a4,-32(s0)
     b26:	02f76463          	bltu	a4,a5,b4e <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b2a:	fe843783          	ld	a5,-24(s0)
     b2e:	639c                	ld	a5,0(a5)
     b30:	fef43423          	sd	a5,-24(s0)
     b34:	fe043703          	ld	a4,-32(s0)
     b38:	fe843783          	ld	a5,-24(s0)
     b3c:	fce7f3e3          	bgeu	a5,a4,b02 <free+0x24>
     b40:	fe843783          	ld	a5,-24(s0)
     b44:	639c                	ld	a5,0(a5)
     b46:	fe043703          	ld	a4,-32(s0)
     b4a:	faf77ce3          	bgeu	a4,a5,b02 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b4e:	fe043783          	ld	a5,-32(s0)
     b52:	479c                	lw	a5,8(a5)
     b54:	1782                	slli	a5,a5,0x20
     b56:	9381                	srli	a5,a5,0x20
     b58:	0792                	slli	a5,a5,0x4
     b5a:	fe043703          	ld	a4,-32(s0)
     b5e:	973e                	add	a4,a4,a5
     b60:	fe843783          	ld	a5,-24(s0)
     b64:	639c                	ld	a5,0(a5)
     b66:	02f71763          	bne	a4,a5,b94 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b6a:	fe043783          	ld	a5,-32(s0)
     b6e:	4798                	lw	a4,8(a5)
     b70:	fe843783          	ld	a5,-24(s0)
     b74:	639c                	ld	a5,0(a5)
     b76:	479c                	lw	a5,8(a5)
     b78:	9fb9                	addw	a5,a5,a4
     b7a:	0007871b          	sext.w	a4,a5
     b7e:	fe043783          	ld	a5,-32(s0)
     b82:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b84:	fe843783          	ld	a5,-24(s0)
     b88:	639c                	ld	a5,0(a5)
     b8a:	6398                	ld	a4,0(a5)
     b8c:	fe043783          	ld	a5,-32(s0)
     b90:	e398                	sd	a4,0(a5)
     b92:	a039                	j	ba0 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b94:	fe843783          	ld	a5,-24(s0)
     b98:	6398                	ld	a4,0(a5)
     b9a:	fe043783          	ld	a5,-32(s0)
     b9e:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     ba0:	fe843783          	ld	a5,-24(s0)
     ba4:	479c                	lw	a5,8(a5)
     ba6:	1782                	slli	a5,a5,0x20
     ba8:	9381                	srli	a5,a5,0x20
     baa:	0792                	slli	a5,a5,0x4
     bac:	fe843703          	ld	a4,-24(s0)
     bb0:	97ba                	add	a5,a5,a4
     bb2:	fe043703          	ld	a4,-32(s0)
     bb6:	02f71563          	bne	a4,a5,be0 <free+0x102>
    p->s.size += bp->s.size;
     bba:	fe843783          	ld	a5,-24(s0)
     bbe:	4798                	lw	a4,8(a5)
     bc0:	fe043783          	ld	a5,-32(s0)
     bc4:	479c                	lw	a5,8(a5)
     bc6:	9fb9                	addw	a5,a5,a4
     bc8:	0007871b          	sext.w	a4,a5
     bcc:	fe843783          	ld	a5,-24(s0)
     bd0:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     bd2:	fe043783          	ld	a5,-32(s0)
     bd6:	6398                	ld	a4,0(a5)
     bd8:	fe843783          	ld	a5,-24(s0)
     bdc:	e398                	sd	a4,0(a5)
     bde:	a031                	j	bea <free+0x10c>
  } else
    p->s.ptr = bp;
     be0:	fe843783          	ld	a5,-24(s0)
     be4:	fe043703          	ld	a4,-32(s0)
     be8:	e398                	sd	a4,0(a5)
  freep = p;
     bea:	00001797          	auipc	a5,0x1
     bee:	cf678793          	addi	a5,a5,-778 # 18e0 <freep>
     bf2:	fe843703          	ld	a4,-24(s0)
     bf6:	e398                	sd	a4,0(a5)
}
     bf8:	0001                	nop
     bfa:	7422                	ld	s0,40(sp)
     bfc:	6145                	addi	sp,sp,48
     bfe:	8082                	ret

0000000000000c00 <morecore>:

static Header*
morecore(uint nu)
{
     c00:	7179                	addi	sp,sp,-48
     c02:	f406                	sd	ra,40(sp)
     c04:	f022                	sd	s0,32(sp)
     c06:	1800                	addi	s0,sp,48
     c08:	87aa                	mv	a5,a0
     c0a:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c0e:	fdc42783          	lw	a5,-36(s0)
     c12:	0007871b          	sext.w	a4,a5
     c16:	6785                	lui	a5,0x1
     c18:	00f77563          	bgeu	a4,a5,c22 <morecore+0x22>
    nu = 4096;
     c1c:	6785                	lui	a5,0x1
     c1e:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c22:	fdc42783          	lw	a5,-36(s0)
     c26:	0047979b          	slliw	a5,a5,0x4
     c2a:	2781                	sext.w	a5,a5
     c2c:	2781                	sext.w	a5,a5
     c2e:	853e                	mv	a0,a5
     c30:	00000097          	auipc	ra,0x0
     c34:	9a0080e7          	jalr	-1632(ra) # 5d0 <sbrk>
     c38:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c3c:	fe843703          	ld	a4,-24(s0)
     c40:	57fd                	li	a5,-1
     c42:	00f71463          	bne	a4,a5,c4a <morecore+0x4a>
    return 0;
     c46:	4781                	li	a5,0
     c48:	a03d                	j	c76 <morecore+0x76>
  hp = (Header*)p;
     c4a:	fe843783          	ld	a5,-24(s0)
     c4e:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c52:	fe043783          	ld	a5,-32(s0)
     c56:	fdc42703          	lw	a4,-36(s0)
     c5a:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c5c:	fe043783          	ld	a5,-32(s0)
     c60:	07c1                	addi	a5,a5,16
     c62:	853e                	mv	a0,a5
     c64:	00000097          	auipc	ra,0x0
     c68:	e7a080e7          	jalr	-390(ra) # ade <free>
  return freep;
     c6c:	00001797          	auipc	a5,0x1
     c70:	c7478793          	addi	a5,a5,-908 # 18e0 <freep>
     c74:	639c                	ld	a5,0(a5)
}
     c76:	853e                	mv	a0,a5
     c78:	70a2                	ld	ra,40(sp)
     c7a:	7402                	ld	s0,32(sp)
     c7c:	6145                	addi	sp,sp,48
     c7e:	8082                	ret

0000000000000c80 <malloc>:

void*
malloc(uint nbytes)
{
     c80:	7139                	addi	sp,sp,-64
     c82:	fc06                	sd	ra,56(sp)
     c84:	f822                	sd	s0,48(sp)
     c86:	0080                	addi	s0,sp,64
     c88:	87aa                	mv	a5,a0
     c8a:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c8e:	fcc46783          	lwu	a5,-52(s0)
     c92:	07bd                	addi	a5,a5,15
     c94:	8391                	srli	a5,a5,0x4
     c96:	2781                	sext.w	a5,a5
     c98:	2785                	addiw	a5,a5,1
     c9a:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c9e:	00001797          	auipc	a5,0x1
     ca2:	c4278793          	addi	a5,a5,-958 # 18e0 <freep>
     ca6:	639c                	ld	a5,0(a5)
     ca8:	fef43023          	sd	a5,-32(s0)
     cac:	fe043783          	ld	a5,-32(s0)
     cb0:	ef95                	bnez	a5,cec <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     cb2:	00001797          	auipc	a5,0x1
     cb6:	c1e78793          	addi	a5,a5,-994 # 18d0 <base>
     cba:	fef43023          	sd	a5,-32(s0)
     cbe:	00001797          	auipc	a5,0x1
     cc2:	c2278793          	addi	a5,a5,-990 # 18e0 <freep>
     cc6:	fe043703          	ld	a4,-32(s0)
     cca:	e398                	sd	a4,0(a5)
     ccc:	00001797          	auipc	a5,0x1
     cd0:	c1478793          	addi	a5,a5,-1004 # 18e0 <freep>
     cd4:	6398                	ld	a4,0(a5)
     cd6:	00001797          	auipc	a5,0x1
     cda:	bfa78793          	addi	a5,a5,-1030 # 18d0 <base>
     cde:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     ce0:	00001797          	auipc	a5,0x1
     ce4:	bf078793          	addi	a5,a5,-1040 # 18d0 <base>
     ce8:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     cec:	fe043783          	ld	a5,-32(s0)
     cf0:	639c                	ld	a5,0(a5)
     cf2:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     cf6:	fe843783          	ld	a5,-24(s0)
     cfa:	4798                	lw	a4,8(a5)
     cfc:	fdc42783          	lw	a5,-36(s0)
     d00:	2781                	sext.w	a5,a5
     d02:	06f76863          	bltu	a4,a5,d72 <malloc+0xf2>
      if(p->s.size == nunits)
     d06:	fe843783          	ld	a5,-24(s0)
     d0a:	4798                	lw	a4,8(a5)
     d0c:	fdc42783          	lw	a5,-36(s0)
     d10:	2781                	sext.w	a5,a5
     d12:	00e79963          	bne	a5,a4,d24 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d16:	fe843783          	ld	a5,-24(s0)
     d1a:	6398                	ld	a4,0(a5)
     d1c:	fe043783          	ld	a5,-32(s0)
     d20:	e398                	sd	a4,0(a5)
     d22:	a82d                	j	d5c <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d24:	fe843783          	ld	a5,-24(s0)
     d28:	4798                	lw	a4,8(a5)
     d2a:	fdc42783          	lw	a5,-36(s0)
     d2e:	40f707bb          	subw	a5,a4,a5
     d32:	0007871b          	sext.w	a4,a5
     d36:	fe843783          	ld	a5,-24(s0)
     d3a:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d3c:	fe843783          	ld	a5,-24(s0)
     d40:	479c                	lw	a5,8(a5)
     d42:	1782                	slli	a5,a5,0x20
     d44:	9381                	srli	a5,a5,0x20
     d46:	0792                	slli	a5,a5,0x4
     d48:	fe843703          	ld	a4,-24(s0)
     d4c:	97ba                	add	a5,a5,a4
     d4e:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d52:	fe843783          	ld	a5,-24(s0)
     d56:	fdc42703          	lw	a4,-36(s0)
     d5a:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d5c:	00001797          	auipc	a5,0x1
     d60:	b8478793          	addi	a5,a5,-1148 # 18e0 <freep>
     d64:	fe043703          	ld	a4,-32(s0)
     d68:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d6a:	fe843783          	ld	a5,-24(s0)
     d6e:	07c1                	addi	a5,a5,16
     d70:	a091                	j	db4 <malloc+0x134>
    }
    if(p == freep)
     d72:	00001797          	auipc	a5,0x1
     d76:	b6e78793          	addi	a5,a5,-1170 # 18e0 <freep>
     d7a:	639c                	ld	a5,0(a5)
     d7c:	fe843703          	ld	a4,-24(s0)
     d80:	02f71063          	bne	a4,a5,da0 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d84:	fdc42783          	lw	a5,-36(s0)
     d88:	853e                	mv	a0,a5
     d8a:	00000097          	auipc	ra,0x0
     d8e:	e76080e7          	jalr	-394(ra) # c00 <morecore>
     d92:	fea43423          	sd	a0,-24(s0)
     d96:	fe843783          	ld	a5,-24(s0)
     d9a:	e399                	bnez	a5,da0 <malloc+0x120>
        return 0;
     d9c:	4781                	li	a5,0
     d9e:	a819                	j	db4 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     da0:	fe843783          	ld	a5,-24(s0)
     da4:	fef43023          	sd	a5,-32(s0)
     da8:	fe843783          	ld	a5,-24(s0)
     dac:	639c                	ld	a5,0(a5)
     dae:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     db2:	b791                	j	cf6 <malloc+0x76>
  }
}
     db4:	853e                	mv	a0,a5
     db6:	70e2                	ld	ra,56(sp)
     db8:	7442                	ld	s0,48(sp)
     dba:	6121                	addi	sp,sp,64
     dbc:	8082                	ret

0000000000000dbe <setjmp>:
     dbe:	e100                	sd	s0,0(a0)
     dc0:	e504                	sd	s1,8(a0)
     dc2:	01253823          	sd	s2,16(a0)
     dc6:	01353c23          	sd	s3,24(a0)
     dca:	03453023          	sd	s4,32(a0)
     dce:	03553423          	sd	s5,40(a0)
     dd2:	03653823          	sd	s6,48(a0)
     dd6:	03753c23          	sd	s7,56(a0)
     dda:	05853023          	sd	s8,64(a0)
     dde:	05953423          	sd	s9,72(a0)
     de2:	05a53823          	sd	s10,80(a0)
     de6:	05b53c23          	sd	s11,88(a0)
     dea:	06153023          	sd	ra,96(a0)
     dee:	06253423          	sd	sp,104(a0)
     df2:	4501                	li	a0,0
     df4:	8082                	ret

0000000000000df6 <longjmp>:
     df6:	6100                	ld	s0,0(a0)
     df8:	6504                	ld	s1,8(a0)
     dfa:	01053903          	ld	s2,16(a0)
     dfe:	01853983          	ld	s3,24(a0)
     e02:	02053a03          	ld	s4,32(a0)
     e06:	02853a83          	ld	s5,40(a0)
     e0a:	03053b03          	ld	s6,48(a0)
     e0e:	03853b83          	ld	s7,56(a0)
     e12:	04053c03          	ld	s8,64(a0)
     e16:	04853c83          	ld	s9,72(a0)
     e1a:	05053d03          	ld	s10,80(a0)
     e1e:	05853d83          	ld	s11,88(a0)
     e22:	06053083          	ld	ra,96(a0)
     e26:	06853103          	ld	sp,104(a0)
     e2a:	c199                	beqz	a1,e30 <longjmp_1>
     e2c:	852e                	mv	a0,a1
     e2e:	8082                	ret

0000000000000e30 <longjmp_1>:
     e30:	4505                	li	a0,1
     e32:	8082                	ret

0000000000000e34 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     e34:	1101                	addi	sp,sp,-32
     e36:	ec22                	sd	s0,24(sp)
     e38:	1000                	addi	s0,sp,32
     e3a:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     e3e:	fe843783          	ld	a5,-24(s0)
     e42:	639c                	ld	a5,0(a5)
     e44:	fe843703          	ld	a4,-24(s0)
     e48:	40f707b3          	sub	a5,a4,a5
     e4c:	0017b793          	seqz	a5,a5
     e50:	0ff7f793          	andi	a5,a5,255
     e54:	2781                	sext.w	a5,a5
}
     e56:	853e                	mv	a0,a5
     e58:	6462                	ld	s0,24(sp)
     e5a:	6105                	addi	sp,sp,32
     e5c:	8082                	ret

0000000000000e5e <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
     e5e:	715d                	addi	sp,sp,-80
     e60:	e4a2                	sd	s0,72(sp)
     e62:	e0a6                	sd	s1,64(sp)
     e64:	0880                	addi	s0,sp,80
     e66:	84aa                	mv	s1,a0
    int sleep_time = -1;
     e68:	57fd                	li	a5,-1
     e6a:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
     e6e:	689c                	ld	a5,16(s1)
     e70:	639c                	ld	a5,0(a5)
     e72:	fcf43c23          	sd	a5,-40(s0)
     e76:	fd843783          	ld	a5,-40(s0)
     e7a:	17e1                	addi	a5,a5,-8
     e7c:	fef43023          	sd	a5,-32(s0)
     e80:	a0a9                	j	eca <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
     e82:	fec42783          	lw	a5,-20(s0)
     e86:	2781                	sext.w	a5,a5
     e88:	0007cf63          	bltz	a5,ea6 <fill_sparse+0x48>
     e8c:	fe043783          	ld	a5,-32(s0)
     e90:	4f98                	lw	a4,24(a5)
     e92:	409c                	lw	a5,0(s1)
     e94:	40f707bb          	subw	a5,a4,a5
     e98:	0007871b          	sext.w	a4,a5
     e9c:	fec42783          	lw	a5,-20(s0)
     ea0:	2781                	sext.w	a5,a5
     ea2:	00f75a63          	bge	a4,a5,eb6 <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
     ea6:	fe043783          	ld	a5,-32(s0)
     eaa:	4f98                	lw	a4,24(a5)
     eac:	409c                	lw	a5,0(s1)
     eae:	40f707bb          	subw	a5,a4,a5
     eb2:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
     eb6:	fe043783          	ld	a5,-32(s0)
     eba:	679c                	ld	a5,8(a5)
     ebc:	fcf43823          	sd	a5,-48(s0)
     ec0:	fd043783          	ld	a5,-48(s0)
     ec4:	17e1                	addi	a5,a5,-8
     ec6:	fef43023          	sd	a5,-32(s0)
     eca:	fe043783          	ld	a5,-32(s0)
     ece:	00878713          	addi	a4,a5,8
     ed2:	689c                	ld	a5,16(s1)
     ed4:	faf717e3          	bne	a4,a5,e82 <fill_sparse+0x24>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = args.run_queue;
     ed8:	649c                	ld	a5,8(s1)
     eda:	faf43823          	sd	a5,-80(s0)
    r.allocated_time = sleep_time;
     ede:	fec42783          	lw	a5,-20(s0)
     ee2:	faf42c23          	sw	a5,-72(s0)
    return r;    
     ee6:	fb043783          	ld	a5,-80(s0)
     eea:	fcf43023          	sd	a5,-64(s0)
     eee:	fb843783          	ld	a5,-72(s0)
     ef2:	fcf43423          	sd	a5,-56(s0)
     ef6:	4701                	li	a4,0
     ef8:	fc043703          	ld	a4,-64(s0)
     efc:	4781                	li	a5,0
     efe:	fc843783          	ld	a5,-56(s0)
     f02:	863a                	mv	a2,a4
     f04:	86be                	mv	a3,a5
     f06:	8732                	mv	a4,a2
     f08:	87b6                	mv	a5,a3
}
     f0a:	853a                	mv	a0,a4
     f0c:	85be                	mv	a1,a5
     f0e:	6426                	ld	s0,72(sp)
     f10:	6486                	ld	s1,64(sp)
     f12:	6161                	addi	sp,sp,80
     f14:	8082                	ret

0000000000000f16 <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
     f16:	715d                	addi	sp,sp,-80
     f18:	e4a2                	sd	s0,72(sp)
     f1a:	e0a6                	sd	s1,64(sp)
     f1c:	0880                	addi	s0,sp,80
     f1e:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
     f20:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
     f24:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     f28:	649c                	ld	a5,8(s1)
     f2a:	639c                	ld	a5,0(a5)
     f2c:	fcf43c23          	sd	a5,-40(s0)
     f30:	fd843783          	ld	a5,-40(s0)
     f34:	fd878793          	addi	a5,a5,-40
     f38:	fef43023          	sd	a5,-32(s0)
     f3c:	a81d                	j	f72 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
     f3e:	fe843783          	ld	a5,-24(s0)
     f42:	cb89                	beqz	a5,f54 <schedule_default+0x3e>
     f44:	fe043783          	ld	a5,-32(s0)
     f48:	5fd8                	lw	a4,60(a5)
     f4a:	fe843783          	ld	a5,-24(s0)
     f4e:	5fdc                	lw	a5,60(a5)
     f50:	00f75663          	bge	a4,a5,f5c <schedule_default+0x46>
            thread_with_smallest_id = th;
     f54:	fe043783          	ld	a5,-32(s0)
     f58:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     f5c:	fe043783          	ld	a5,-32(s0)
     f60:	779c                	ld	a5,40(a5)
     f62:	fcf43823          	sd	a5,-48(s0)
     f66:	fd043783          	ld	a5,-48(s0)
     f6a:	fd878793          	addi	a5,a5,-40
     f6e:	fef43023          	sd	a5,-32(s0)
     f72:	fe043783          	ld	a5,-32(s0)
     f76:	02878713          	addi	a4,a5,40
     f7a:	649c                	ld	a5,8(s1)
     f7c:	fcf711e3          	bne	a4,a5,f3e <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
     f80:	fe843783          	ld	a5,-24(s0)
     f84:	cf89                	beqz	a5,f9e <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
     f86:	fe843783          	ld	a5,-24(s0)
     f8a:	02878793          	addi	a5,a5,40
     f8e:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
     f92:	fe843783          	ld	a5,-24(s0)
     f96:	4fbc                	lw	a5,88(a5)
     f98:	faf42c23          	sw	a5,-72(s0)
     f9c:	a039                	j	faa <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
     f9e:	649c                	ld	a5,8(s1)
     fa0:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
     fa4:	4785                	li	a5,1
     fa6:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
     faa:	fb043783          	ld	a5,-80(s0)
     fae:	fcf43023          	sd	a5,-64(s0)
     fb2:	fb843783          	ld	a5,-72(s0)
     fb6:	fcf43423          	sd	a5,-56(s0)
     fba:	4701                	li	a4,0
     fbc:	fc043703          	ld	a4,-64(s0)
     fc0:	4781                	li	a5,0
     fc2:	fc843783          	ld	a5,-56(s0)
     fc6:	863a                	mv	a2,a4
     fc8:	86be                	mv	a3,a5
     fca:	8732                	mv	a4,a2
     fcc:	87b6                	mv	a5,a3
}
     fce:	853a                	mv	a0,a4
     fd0:	85be                	mv	a1,a5
     fd2:	6426                	ld	s0,72(sp)
     fd4:	6486                	ld	s1,64(sp)
     fd6:	6161                	addi	sp,sp,80
     fd8:	8082                	ret

0000000000000fda <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
     fda:	7135                	addi	sp,sp,-160
     fdc:	ed06                	sd	ra,152(sp)
     fde:	e922                	sd	s0,144(sp)
     fe0:	e526                	sd	s1,136(sp)
     fe2:	e14a                	sd	s2,128(sp)
     fe4:	fcce                	sd	s3,120(sp)
     fe6:	1100                	addi	s0,sp,160
     fe8:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
     fea:	649c                	ld	a5,8(s1)
     fec:	853e                	mv	a0,a5
     fee:	00000097          	auipc	ra,0x0
     ff2:	e46080e7          	jalr	-442(ra) # e34 <list_empty>
     ff6:	87aa                	mv	a5,a0
     ff8:	cb85                	beqz	a5,1028 <schedule_wrr+0x4e>
        return fill_sparse(args);
     ffa:	609c                	ld	a5,0(s1)
     ffc:	f6f43023          	sd	a5,-160(s0)
    1000:	649c                	ld	a5,8(s1)
    1002:	f6f43423          	sd	a5,-152(s0)
    1006:	689c                	ld	a5,16(s1)
    1008:	f6f43823          	sd	a5,-144(s0)
    100c:	f6040793          	addi	a5,s0,-160
    1010:	853e                	mv	a0,a5
    1012:	00000097          	auipc	ra,0x0
    1016:	e4c080e7          	jalr	-436(ra) # e5e <fill_sparse>
    101a:	872a                	mv	a4,a0
    101c:	87ae                	mv	a5,a1
    101e:	f8e43823          	sd	a4,-112(s0)
    1022:	f8f43c23          	sd	a5,-104(s0)
    1026:	a0c9                	j	10e8 <schedule_wrr+0x10e>

    struct thread *process_thread = NULL;
    1028:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    102c:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1030:	649c                	ld	a5,8(s1)
    1032:	639c                	ld	a5,0(a5)
    1034:	faf43823          	sd	a5,-80(s0)
    1038:	fb043783          	ld	a5,-80(s0)
    103c:	fd878793          	addi	a5,a5,-40
    1040:	fcf43023          	sd	a5,-64(s0)
    1044:	a025                	j	106c <schedule_wrr+0x92>
        if (process_thread == NULL) {
    1046:	fc843783          	ld	a5,-56(s0)
    104a:	e791                	bnez	a5,1056 <schedule_wrr+0x7c>
            process_thread = th;
    104c:	fc043783          	ld	a5,-64(s0)
    1050:	fcf43423          	sd	a5,-56(s0)
            break;
    1054:	a01d                	j	107a <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
    1056:	fc043783          	ld	a5,-64(s0)
    105a:	779c                	ld	a5,40(a5)
    105c:	faf43423          	sd	a5,-88(s0)
    1060:	fa843783          	ld	a5,-88(s0)
    1064:	fd878793          	addi	a5,a5,-40
    1068:	fcf43023          	sd	a5,-64(s0)
    106c:	fc043783          	ld	a5,-64(s0)
    1070:	02878713          	addi	a4,a5,40
    1074:	649c                	ld	a5,8(s1)
    1076:	fcf718e3          	bne	a4,a5,1046 <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
    107a:	40dc                	lw	a5,4(s1)
    107c:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
    1080:	fc843783          	ld	a5,-56(s0)
    1084:	4fbc                	lw	a5,88(a5)
    1086:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    108a:	fc843783          	ld	a5,-56(s0)
    108e:	4fb4                	lw	a3,88(a5)
    1090:	fc843783          	ld	a5,-56(s0)
    1094:	47bc                	lw	a5,72(a5)
    1096:	fa442703          	lw	a4,-92(s0)
    109a:	02f707bb          	mulw	a5,a4,a5
    109e:	2781                	sext.w	a5,a5
    10a0:	8736                	mv	a4,a3
    10a2:	00e7dc63          	bge	a5,a4,10ba <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
    10a6:	fc843783          	ld	a5,-56(s0)
    10aa:	47bc                	lw	a5,72(a5)
    10ac:	fa442703          	lw	a4,-92(s0)
    10b0:	02f707bb          	mulw	a5,a4,a5
    10b4:	faf42e23          	sw	a5,-68(s0)
    10b8:	a031                	j	10c4 <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    10ba:	fc843783          	ld	a5,-56(s0)
    10be:	4fbc                	lw	a5,88(a5)
    10c0:	faf42e23          	sw	a5,-68(s0)
    }
    
    struct threads_sched_result r;
    r.scheduled_thread_list_member = &process_thread->thread_list;
    10c4:	fc843783          	ld	a5,-56(s0)
    10c8:	02878793          	addi	a5,a5,40
    10cc:	f8f43023          	sd	a5,-128(s0)
    r.allocated_time = executing_time;
    10d0:	fbc42783          	lw	a5,-68(s0)
    10d4:	f8f42423          	sw	a5,-120(s0)
    return r;
    10d8:	f8043783          	ld	a5,-128(s0)
    10dc:	f8f43823          	sd	a5,-112(s0)
    10e0:	f8843783          	ld	a5,-120(s0)
    10e4:	f8f43c23          	sd	a5,-104(s0)
    10e8:	4701                	li	a4,0
    10ea:	f9043703          	ld	a4,-112(s0)
    10ee:	4781                	li	a5,0
    10f0:	f9843783          	ld	a5,-104(s0)
    10f4:	893a                	mv	s2,a4
    10f6:	89be                	mv	s3,a5
    10f8:	874a                	mv	a4,s2
    10fa:	87ce                	mv	a5,s3
}
    10fc:	853a                	mv	a0,a4
    10fe:	85be                	mv	a1,a5
    1100:	60ea                	ld	ra,152(sp)
    1102:	644a                	ld	s0,144(sp)
    1104:	64aa                	ld	s1,136(sp)
    1106:	690a                	ld	s2,128(sp)
    1108:	79e6                	ld	s3,120(sp)
    110a:	610d                	addi	sp,sp,160
    110c:	8082                	ret

000000000000110e <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    110e:	7131                	addi	sp,sp,-192
    1110:	fd06                	sd	ra,184(sp)
    1112:	f922                	sd	s0,176(sp)
    1114:	f526                	sd	s1,168(sp)
    1116:	f14a                	sd	s2,160(sp)
    1118:	ed4e                	sd	s3,152(sp)
    111a:	0180                	addi	s0,sp,192
    111c:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    111e:	649c                	ld	a5,8(s1)
    1120:	853e                	mv	a0,a5
    1122:	00000097          	auipc	ra,0x0
    1126:	d12080e7          	jalr	-750(ra) # e34 <list_empty>
    112a:	87aa                	mv	a5,a0
    112c:	cb85                	beqz	a5,115c <schedule_sjf+0x4e>
        return fill_sparse(args);
    112e:	609c                	ld	a5,0(s1)
    1130:	f4f43023          	sd	a5,-192(s0)
    1134:	649c                	ld	a5,8(s1)
    1136:	f4f43423          	sd	a5,-184(s0)
    113a:	689c                	ld	a5,16(s1)
    113c:	f4f43823          	sd	a5,-176(s0)
    1140:	f4040793          	addi	a5,s0,-192
    1144:	853e                	mv	a0,a5
    1146:	00000097          	auipc	ra,0x0
    114a:	d18080e7          	jalr	-744(ra) # e5e <fill_sparse>
    114e:	872a                	mv	a4,a0
    1150:	87ae                	mv	a5,a1
    1152:	f6e43c23          	sd	a4,-136(s0)
    1156:	f8f43023          	sd	a5,-128(s0)
    115a:	aa49                	j	12ec <schedule_sjf+0x1de>

    int current_time = args.current_time;
    115c:	409c                	lw	a5,0(s1)
    115e:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    1162:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1166:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    116a:	649c                	ld	a5,8(s1)
    116c:	639c                	ld	a5,0(a5)
    116e:	faf43423          	sd	a5,-88(s0)
    1172:	fa843783          	ld	a5,-88(s0)
    1176:	fd878793          	addi	a5,a5,-40
    117a:	fcf43023          	sd	a5,-64(s0)
    117e:	a085                	j	11de <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    1180:	fc843783          	ld	a5,-56(s0)
    1184:	cb89                	beqz	a5,1196 <schedule_sjf+0x88>
    1186:	fc043783          	ld	a5,-64(s0)
    118a:	4fb8                	lw	a4,88(a5)
    118c:	fc843783          	ld	a5,-56(s0)
    1190:	4fbc                	lw	a5,88(a5)
    1192:	00f75763          	bge	a4,a5,11a0 <schedule_sjf+0x92>
            shortest_thread = th;
    1196:	fc043783          	ld	a5,-64(s0)
    119a:	fcf43423          	sd	a5,-56(s0)
    119e:	a02d                	j	11c8 <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    11a0:	fc043783          	ld	a5,-64(s0)
    11a4:	4fb8                	lw	a4,88(a5)
    11a6:	fc843783          	ld	a5,-56(s0)
    11aa:	4fbc                	lw	a5,88(a5)
    11ac:	00f71e63          	bne	a4,a5,11c8 <schedule_sjf+0xba>
    11b0:	fc043783          	ld	a5,-64(s0)
    11b4:	5fd8                	lw	a4,60(a5)
    11b6:	fc843783          	ld	a5,-56(s0)
    11ba:	5fdc                	lw	a5,60(a5)
    11bc:	00f75663          	bge	a4,a5,11c8 <schedule_sjf+0xba>
            shortest_thread = th;
    11c0:	fc043783          	ld	a5,-64(s0)
    11c4:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    11c8:	fc043783          	ld	a5,-64(s0)
    11cc:	779c                	ld	a5,40(a5)
    11ce:	f8f43423          	sd	a5,-120(s0)
    11d2:	f8843783          	ld	a5,-120(s0)
    11d6:	fd878793          	addi	a5,a5,-40
    11da:	fcf43023          	sd	a5,-64(s0)
    11de:	fc043783          	ld	a5,-64(s0)
    11e2:	02878713          	addi	a4,a5,40
    11e6:	649c                	ld	a5,8(s1)
    11e8:	f8f71ce3          	bne	a4,a5,1180 <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    11ec:	fc843783          	ld	a5,-56(s0)
    11f0:	4fbc                	lw	a5,88(a5)
    11f2:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    11f6:	689c                	ld	a5,16(s1)
    11f8:	639c                	ld	a5,0(a5)
    11fa:	faf43023          	sd	a5,-96(s0)
    11fe:	fa043783          	ld	a5,-96(s0)
    1202:	17e1                	addi	a5,a5,-8
    1204:	faf43c23          	sd	a5,-72(s0)
    1208:	a84d                	j	12ba <schedule_sjf+0x1ac>
        int interval = cur->release_time - current_time;
    120a:	fb843783          	ld	a5,-72(s0)
    120e:	4f98                	lw	a4,24(a5)
    1210:	fb042783          	lw	a5,-80(s0)
    1214:	40f707bb          	subw	a5,a4,a5
    1218:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    121c:	f9c42703          	lw	a4,-100(s0)
    1220:	fb442783          	lw	a5,-76(s0)
    1224:	2701                	sext.w	a4,a4
    1226:	2781                	sext.w	a5,a5
    1228:	06e7c863          	blt	a5,a4,1298 <schedule_sjf+0x18a>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    122c:	fc843783          	ld	a5,-56(s0)
    1230:	4fbc                	lw	a5,88(a5)
    1232:	fb042703          	lw	a4,-80(s0)
    1236:	9fb9                	addw	a5,a5,a4
    1238:	0007871b          	sext.w	a4,a5
    123c:	fb843783          	ld	a5,-72(s0)
    1240:	4f9c                	lw	a5,24(a5)
    1242:	04f74d63          	blt	a4,a5,129c <schedule_sjf+0x18e>
        int remaining_time = shortest_thread->remaining_time - interval;
    1246:	fc843783          	ld	a5,-56(s0)
    124a:	4fb8                	lw	a4,88(a5)
    124c:	f9c42783          	lw	a5,-100(s0)
    1250:	40f707bb          	subw	a5,a4,a5
    1254:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    1258:	fb843783          	ld	a5,-72(s0)
    125c:	639c                	ld	a5,0(a5)
    125e:	43f8                	lw	a4,68(a5)
    1260:	f9842783          	lw	a5,-104(s0)
    1264:	2781                	sext.w	a5,a5
    1266:	02e7cd63          	blt	a5,a4,12a0 <schedule_sjf+0x192>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    126a:	fb843783          	ld	a5,-72(s0)
    126e:	639c                	ld	a5,0(a5)
    1270:	43f8                	lw	a4,68(a5)
    1272:	f9842783          	lw	a5,-104(s0)
    1276:	2781                	sext.w	a5,a5
    1278:	00e79b63          	bne	a5,a4,128e <schedule_sjf+0x180>
    127c:	fc843783          	ld	a5,-56(s0)
    1280:	5fd8                	lw	a4,60(a5)
    1282:	fb843783          	ld	a5,-72(s0)
    1286:	639c                	ld	a5,0(a5)
    1288:	5fdc                	lw	a5,60(a5)
    128a:	00f74d63          	blt	a4,a5,12a4 <schedule_sjf+0x196>
        executing_time = interval;
    128e:	f9c42783          	lw	a5,-100(s0)
    1292:	faf42a23          	sw	a5,-76(s0)
    1296:	a801                	j	12a6 <schedule_sjf+0x198>
        if (interval > executing_time) continue;
    1298:	0001                	nop
    129a:	a031                	j	12a6 <schedule_sjf+0x198>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    129c:	0001                	nop
    129e:	a021                	j	12a6 <schedule_sjf+0x198>
        if (remaining_time < cur->thrd->processing_time) continue;
    12a0:	0001                	nop
    12a2:	a011                	j	12a6 <schedule_sjf+0x198>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    12a4:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    12a6:	fb843783          	ld	a5,-72(s0)
    12aa:	679c                	ld	a5,8(a5)
    12ac:	f8f43823          	sd	a5,-112(s0)
    12b0:	f9043783          	ld	a5,-112(s0)
    12b4:	17e1                	addi	a5,a5,-8
    12b6:	faf43c23          	sd	a5,-72(s0)
    12ba:	fb843783          	ld	a5,-72(s0)
    12be:	00878713          	addi	a4,a5,8
    12c2:	689c                	ld	a5,16(s1)
    12c4:	f4f713e3          	bne	a4,a5,120a <schedule_sjf+0xfc>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &shortest_thread->thread_list;
    12c8:	fc843783          	ld	a5,-56(s0)
    12cc:	02878793          	addi	a5,a5,40
    12d0:	f6f43423          	sd	a5,-152(s0)
    r.allocated_time = executing_time;
    12d4:	fb442783          	lw	a5,-76(s0)
    12d8:	f6f42823          	sw	a5,-144(s0)
    return r;
    12dc:	f6843783          	ld	a5,-152(s0)
    12e0:	f6f43c23          	sd	a5,-136(s0)
    12e4:	f7043783          	ld	a5,-144(s0)
    12e8:	f8f43023          	sd	a5,-128(s0)
    12ec:	4701                	li	a4,0
    12ee:	f7843703          	ld	a4,-136(s0)
    12f2:	4781                	li	a5,0
    12f4:	f8043783          	ld	a5,-128(s0)
    12f8:	893a                	mv	s2,a4
    12fa:	89be                	mv	s3,a5
    12fc:	874a                	mv	a4,s2
    12fe:	87ce                	mv	a5,s3
}
    1300:	853a                	mv	a0,a4
    1302:	85be                	mv	a1,a5
    1304:	70ea                	ld	ra,184(sp)
    1306:	744a                	ld	s0,176(sp)
    1308:	74aa                	ld	s1,168(sp)
    130a:	790a                	ld	s2,160(sp)
    130c:	69ea                	ld	s3,152(sp)
    130e:	6129                	addi	sp,sp,192
    1310:	8082                	ret

0000000000001312 <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    1312:	7115                	addi	sp,sp,-224
    1314:	ed86                	sd	ra,216(sp)
    1316:	e9a2                	sd	s0,208(sp)
    1318:	e5a6                	sd	s1,200(sp)
    131a:	e1ca                	sd	s2,192(sp)
    131c:	fd4e                	sd	s3,184(sp)
    131e:	1180                	addi	s0,sp,224
    1320:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    1322:	649c                	ld	a5,8(s1)
    1324:	853e                	mv	a0,a5
    1326:	00000097          	auipc	ra,0x0
    132a:	b0e080e7          	jalr	-1266(ra) # e34 <list_empty>
    132e:	87aa                	mv	a5,a0
    1330:	cb85                	beqz	a5,1360 <schedule_lst+0x4e>
        return fill_sparse(args);
    1332:	609c                	ld	a5,0(s1)
    1334:	f2f43023          	sd	a5,-224(s0)
    1338:	649c                	ld	a5,8(s1)
    133a:	f2f43423          	sd	a5,-216(s0)
    133e:	689c                	ld	a5,16(s1)
    1340:	f2f43823          	sd	a5,-208(s0)
    1344:	f2040793          	addi	a5,s0,-224
    1348:	853e                	mv	a0,a5
    134a:	00000097          	auipc	ra,0x0
    134e:	b14080e7          	jalr	-1260(ra) # e5e <fill_sparse>
    1352:	872a                	mv	a4,a0
    1354:	87ae                	mv	a5,a1
    1356:	f6e43023          	sd	a4,-160(s0)
    135a:	f6f43423          	sd	a5,-152(s0)
    135e:	ac41                	j	15ee <schedule_lst+0x2dc>

    int current_time = args.current_time;
    1360:	409c                	lw	a5,0(s1)
    1362:	faf42623          	sw	a5,-84(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    1366:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    136a:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    136e:	649c                	ld	a5,8(s1)
    1370:	639c                	ld	a5,0(a5)
    1372:	faf43023          	sd	a5,-96(s0)
    1376:	fa043783          	ld	a5,-96(s0)
    137a:	fd878793          	addi	a5,a5,-40
    137e:	fcf43023          	sd	a5,-64(s0)
    1382:	a239                	j	1490 <schedule_lst+0x17e>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    1384:	fc043783          	ld	a5,-64(s0)
    1388:	4ff8                	lw	a4,92(a5)
    138a:	fac42783          	lw	a5,-84(s0)
    138e:	40f707bb          	subw	a5,a4,a5
    1392:	0007871b          	sext.w	a4,a5
    1396:	fc043783          	ld	a5,-64(s0)
    139a:	4fbc                	lw	a5,88(a5)
    139c:	40f707bb          	subw	a5,a4,a5
    13a0:	f6f42e23          	sw	a5,-132(s0)
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    13a4:	fc843783          	ld	a5,-56(s0)
    13a8:	c38d                	beqz	a5,13ca <schedule_lst+0xb8>
    13aa:	fc843783          	ld	a5,-56(s0)
    13ae:	4ff8                	lw	a4,92(a5)
    13b0:	fac42783          	lw	a5,-84(s0)
    13b4:	40f707bb          	subw	a5,a4,a5
    13b8:	0007871b          	sext.w	a4,a5
    13bc:	fc843783          	ld	a5,-56(s0)
    13c0:	4fbc                	lw	a5,88(a5)
    13c2:	40f707bb          	subw	a5,a4,a5
    13c6:	2781                	sext.w	a5,a5
    13c8:	a011                	j	13cc <schedule_lst+0xba>
    13ca:	4781                	li	a5,0
    13cc:	f6f42c23          	sw	a5,-136(s0)
        if (least_slack_thread == NULL) {
    13d0:	fc843783          	ld	a5,-56(s0)
    13d4:	e791                	bnez	a5,13e0 <schedule_lst+0xce>
            least_slack_thread = th;
    13d6:	fc043783          	ld	a5,-64(s0)
    13da:	fcf43423          	sd	a5,-56(s0)
    13de:	a871                	j	147a <schedule_lst+0x168>
        }
        else if (least_slack_thread->current_deadline <= current_time) { // missing the deadline
    13e0:	fc843783          	ld	a5,-56(s0)
    13e4:	4ff8                	lw	a4,92(a5)
    13e6:	fac42783          	lw	a5,-84(s0)
    13ea:	2781                	sext.w	a5,a5
    13ec:	02e7c763          	blt	a5,a4,141a <schedule_lst+0x108>
            if (th->current_deadline > current_time) continue;
    13f0:	fc043783          	ld	a5,-64(s0)
    13f4:	4ff8                	lw	a4,92(a5)
    13f6:	fac42783          	lw	a5,-84(s0)
    13fa:	2781                	sext.w	a5,a5
    13fc:	06e7ce63          	blt	a5,a4,1478 <schedule_lst+0x166>
            if (th->ID < least_slack_thread->ID) {
    1400:	fc043783          	ld	a5,-64(s0)
    1404:	5fd8                	lw	a4,60(a5)
    1406:	fc843783          	ld	a5,-56(s0)
    140a:	5fdc                	lw	a5,60(a5)
    140c:	06f75763          	bge	a4,a5,147a <schedule_lst+0x168>
                least_slack_thread = th;
    1410:	fc043783          	ld	a5,-64(s0)
    1414:	fcf43423          	sd	a5,-56(s0)
    1418:	a08d                	j	147a <schedule_lst+0x168>
            }
        }
        else if (th->current_deadline <= current_time) {
    141a:	fc043783          	ld	a5,-64(s0)
    141e:	4ff8                	lw	a4,92(a5)
    1420:	fac42783          	lw	a5,-84(s0)
    1424:	2781                	sext.w	a5,a5
    1426:	00e7c763          	blt	a5,a4,1434 <schedule_lst+0x122>
            least_slack_thread = th;
    142a:	fc043783          	ld	a5,-64(s0)
    142e:	fcf43423          	sd	a5,-56(s0)
    1432:	a0a1                	j	147a <schedule_lst+0x168>
        }
        else if (slack_time < least_slack_time) {
    1434:	f7c42703          	lw	a4,-132(s0)
    1438:	f7842783          	lw	a5,-136(s0)
    143c:	2701                	sext.w	a4,a4
    143e:	2781                	sext.w	a5,a5
    1440:	00f75763          	bge	a4,a5,144e <schedule_lst+0x13c>
            least_slack_thread = th;
    1444:	fc043783          	ld	a5,-64(s0)
    1448:	fcf43423          	sd	a5,-56(s0)
    144c:	a03d                	j	147a <schedule_lst+0x168>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    144e:	f7c42703          	lw	a4,-132(s0)
    1452:	f7842783          	lw	a5,-136(s0)
    1456:	2701                	sext.w	a4,a4
    1458:	2781                	sext.w	a5,a5
    145a:	02f71063          	bne	a4,a5,147a <schedule_lst+0x168>
    145e:	fc043783          	ld	a5,-64(s0)
    1462:	5fd8                	lw	a4,60(a5)
    1464:	fc843783          	ld	a5,-56(s0)
    1468:	5fdc                	lw	a5,60(a5)
    146a:	00f75863          	bge	a4,a5,147a <schedule_lst+0x168>
            least_slack_thread = th;
    146e:	fc043783          	ld	a5,-64(s0)
    1472:	fcf43423          	sd	a5,-56(s0)
    1476:	a011                	j	147a <schedule_lst+0x168>
            if (th->current_deadline > current_time) continue;
    1478:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    147a:	fc043783          	ld	a5,-64(s0)
    147e:	779c                	ld	a5,40(a5)
    1480:	f6f43823          	sd	a5,-144(s0)
    1484:	f7043783          	ld	a5,-144(s0)
    1488:	fd878793          	addi	a5,a5,-40
    148c:	fcf43023          	sd	a5,-64(s0)
    1490:	fc043783          	ld	a5,-64(s0)
    1494:	02878713          	addi	a4,a5,40
    1498:	649c                	ld	a5,8(s1)
    149a:	eef715e3          	bne	a4,a5,1384 <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread->current_deadline <= current_time)
    149e:	fc843783          	ld	a5,-56(s0)
    14a2:	4ff8                	lw	a4,92(a5)
    14a4:	fac42783          	lw	a5,-84(s0)
    14a8:	2781                	sext.w	a5,a5
    14aa:	00e7cb63          	blt	a5,a4,14c0 <schedule_lst+0x1ae>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    14ae:	fc843783          	ld	a5,-56(s0)
    14b2:	02878793          	addi	a5,a5,40
    14b6:	f6f43023          	sd	a5,-160(s0)
    14ba:	f6042423          	sw	zero,-152(s0)
    14be:	aa05                	j	15ee <schedule_lst+0x2dc>
    
    int executing_time = least_slack_thread->remaining_time;
    14c0:	fc843783          	ld	a5,-56(s0)
    14c4:	4fbc                	lw	a5,88(a5)
    14c6:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    14ca:	fc843783          	ld	a5,-56(s0)
    14ce:	4fb4                	lw	a3,88(a5)
    14d0:	fc843783          	ld	a5,-56(s0)
    14d4:	4ff8                	lw	a4,92(a5)
    14d6:	fac42783          	lw	a5,-84(s0)
    14da:	40f707bb          	subw	a5,a4,a5
    14de:	2781                	sext.w	a5,a5
    14e0:	8736                	mv	a4,a3
    14e2:	00e7db63          	bge	a5,a4,14f8 <schedule_lst+0x1e6>
        executing_time = least_slack_thread->current_deadline - current_time;
    14e6:	fc843783          	ld	a5,-56(s0)
    14ea:	4ff8                	lw	a4,92(a5)
    14ec:	fac42783          	lw	a5,-84(s0)
    14f0:	40f707bb          	subw	a5,a4,a5
    14f4:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    14f8:	fc843783          	ld	a5,-56(s0)
    14fc:	4ff8                	lw	a4,92(a5)
    14fe:	fac42783          	lw	a5,-84(s0)
    1502:	40f707bb          	subw	a5,a4,a5
    1506:	0007871b          	sext.w	a4,a5
    150a:	fc843783          	ld	a5,-56(s0)
    150e:	4fbc                	lw	a5,88(a5)
    1510:	40f707bb          	subw	a5,a4,a5
    1514:	f8f42e23          	sw	a5,-100(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1518:	689c                	ld	a5,16(s1)
    151a:	639c                	ld	a5,0(a5)
    151c:	f8f43823          	sd	a5,-112(s0)
    1520:	f9043783          	ld	a5,-112(s0)
    1524:	17e1                	addi	a5,a5,-8
    1526:	faf43823          	sd	a5,-80(s0)
    152a:	a849                	j	15bc <schedule_lst+0x2aa>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    152c:	fb043783          	ld	a5,-80(s0)
    1530:	639c                	ld	a5,0(a5)
    1532:	47f8                	lw	a4,76(a5)
    1534:	fb043783          	ld	a5,-80(s0)
    1538:	639c                	ld	a5,0(a5)
    153a:	43fc                	lw	a5,68(a5)
    153c:	40f707bb          	subw	a5,a4,a5
    1540:	f8f42623          	sw	a5,-116(s0)
        int interval = cur->release_time - current_time;
    1544:	fb043783          	ld	a5,-80(s0)
    1548:	4f98                	lw	a4,24(a5)
    154a:	fac42783          	lw	a5,-84(s0)
    154e:	40f707bb          	subw	a5,a4,a5
    1552:	f8f42423          	sw	a5,-120(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    1556:	f8842703          	lw	a4,-120(s0)
    155a:	fbc42783          	lw	a5,-68(s0)
    155e:	2701                	sext.w	a4,a4
    1560:	2781                	sext.w	a5,a5
    1562:	04e7c063          	blt	a5,a4,15a2 <schedule_lst+0x290>
    1566:	f9c42703          	lw	a4,-100(s0)
    156a:	f8c42783          	lw	a5,-116(s0)
    156e:	2701                	sext.w	a4,a4
    1570:	2781                	sext.w	a5,a5
    1572:	02f74863          	blt	a4,a5,15a2 <schedule_lst+0x290>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    1576:	f9c42703          	lw	a4,-100(s0)
    157a:	f8c42783          	lw	a5,-116(s0)
    157e:	2701                	sext.w	a4,a4
    1580:	2781                	sext.w	a5,a5
    1582:	00f71b63          	bne	a4,a5,1598 <schedule_lst+0x286>
    1586:	fc843783          	ld	a5,-56(s0)
    158a:	5fd8                	lw	a4,60(a5)
    158c:	fb043783          	ld	a5,-80(s0)
    1590:	639c                	ld	a5,0(a5)
    1592:	5fdc                	lw	a5,60(a5)
    1594:	00f74963          	blt	a4,a5,15a6 <schedule_lst+0x294>
        executing_time = interval;
    1598:	f8842783          	lw	a5,-120(s0)
    159c:	faf42e23          	sw	a5,-68(s0)
    15a0:	a021                	j	15a8 <schedule_lst+0x296>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    15a2:	0001                	nop
    15a4:	a011                	j	15a8 <schedule_lst+0x296>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    15a6:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    15a8:	fb043783          	ld	a5,-80(s0)
    15ac:	679c                	ld	a5,8(a5)
    15ae:	f8f43023          	sd	a5,-128(s0)
    15b2:	f8043783          	ld	a5,-128(s0)
    15b6:	17e1                	addi	a5,a5,-8
    15b8:	faf43823          	sd	a5,-80(s0)
    15bc:	fb043783          	ld	a5,-80(s0)
    15c0:	00878713          	addi	a4,a5,8
    15c4:	689c                	ld	a5,16(s1)
    15c6:	f6f713e3          	bne	a4,a5,152c <schedule_lst+0x21a>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &least_slack_thread->thread_list;
    15ca:	fc843783          	ld	a5,-56(s0)
    15ce:	02878793          	addi	a5,a5,40
    15d2:	f4f43823          	sd	a5,-176(s0)
    r.allocated_time = executing_time;
    15d6:	fbc42783          	lw	a5,-68(s0)
    15da:	f4f42c23          	sw	a5,-168(s0)
    return r;
    15de:	f5043783          	ld	a5,-176(s0)
    15e2:	f6f43023          	sd	a5,-160(s0)
    15e6:	f5843783          	ld	a5,-168(s0)
    15ea:	f6f43423          	sd	a5,-152(s0)
    15ee:	4701                	li	a4,0
    15f0:	f6043703          	ld	a4,-160(s0)
    15f4:	4781                	li	a5,0
    15f6:	f6843783          	ld	a5,-152(s0)
    15fa:	893a                	mv	s2,a4
    15fc:	89be                	mv	s3,a5
    15fe:	874a                	mv	a4,s2
    1600:	87ce                	mv	a5,s3
}
    1602:	853a                	mv	a0,a4
    1604:	85be                	mv	a1,a5
    1606:	60ee                	ld	ra,216(sp)
    1608:	644e                	ld	s0,208(sp)
    160a:	64ae                	ld	s1,200(sp)
    160c:	690e                	ld	s2,192(sp)
    160e:	79ea                	ld	s3,184(sp)
    1610:	612d                	addi	sp,sp,224
    1612:	8082                	ret

0000000000001614 <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    1614:	7155                	addi	sp,sp,-208
    1616:	e586                	sd	ra,200(sp)
    1618:	e1a2                	sd	s0,192(sp)
    161a:	fd26                	sd	s1,184(sp)
    161c:	f94a                	sd	s2,176(sp)
    161e:	f54e                	sd	s3,168(sp)
    1620:	0980                	addi	s0,sp,208
    1622:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.

    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    1624:	649c                	ld	a5,8(s1)
    1626:	853e                	mv	a0,a5
    1628:	00000097          	auipc	ra,0x0
    162c:	80c080e7          	jalr	-2036(ra) # e34 <list_empty>
    1630:	87aa                	mv	a5,a0
    1632:	cb85                	beqz	a5,1662 <schedule_dm+0x4e>
        return fill_sparse(args);
    1634:	609c                	ld	a5,0(s1)
    1636:	f2f43823          	sd	a5,-208(s0)
    163a:	649c                	ld	a5,8(s1)
    163c:	f2f43c23          	sd	a5,-200(s0)
    1640:	689c                	ld	a5,16(s1)
    1642:	f4f43023          	sd	a5,-192(s0)
    1646:	f3040793          	addi	a5,s0,-208
    164a:	853e                	mv	a0,a5
    164c:	00000097          	auipc	ra,0x0
    1650:	812080e7          	jalr	-2030(ra) # e5e <fill_sparse>
    1654:	872a                	mv	a4,a0
    1656:	87ae                	mv	a5,a1
    1658:	f6e43823          	sd	a4,-144(s0)
    165c:	f6f43c23          	sd	a5,-136(s0)
    1660:	ac11                	j	1874 <schedule_dm+0x260>
    
    int current_time = args.current_time;
    1662:	409c                	lw	a5,0(s1)
    1664:	faf42623          	sw	a5,-84(s0)

    // find the thread with the earliest deadline
    struct thread *highest_priority_thread = NULL;
    1668:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    166c:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1670:	649c                	ld	a5,8(s1)
    1672:	639c                	ld	a5,0(a5)
    1674:	faf43023          	sd	a5,-96(s0)
    1678:	fa043783          	ld	a5,-96(s0)
    167c:	fd878793          	addi	a5,a5,-40
    1680:	fcf43023          	sd	a5,-64(s0)
    1684:	a0c9                	j	1746 <schedule_dm+0x132>
        if (highest_priority_thread == NULL) {
    1686:	fc843783          	ld	a5,-56(s0)
    168a:	e791                	bnez	a5,1696 <schedule_dm+0x82>
            highest_priority_thread = th;
    168c:	fc043783          	ld	a5,-64(s0)
    1690:	fcf43423          	sd	a5,-56(s0)
    1694:	a871                	j	1730 <schedule_dm+0x11c>
        }
        else if (highest_priority_thread->current_deadline <= current_time) { // missing the deadline
    1696:	fc843783          	ld	a5,-56(s0)
    169a:	4ff8                	lw	a4,92(a5)
    169c:	fac42783          	lw	a5,-84(s0)
    16a0:	2781                	sext.w	a5,a5
    16a2:	02e7c763          	blt	a5,a4,16d0 <schedule_dm+0xbc>
            if (th->current_deadline > current_time) continue;
    16a6:	fc043783          	ld	a5,-64(s0)
    16aa:	4ff8                	lw	a4,92(a5)
    16ac:	fac42783          	lw	a5,-84(s0)
    16b0:	2781                	sext.w	a5,a5
    16b2:	06e7ce63          	blt	a5,a4,172e <schedule_dm+0x11a>
            if (th->ID < highest_priority_thread->ID) {
    16b6:	fc043783          	ld	a5,-64(s0)
    16ba:	5fd8                	lw	a4,60(a5)
    16bc:	fc843783          	ld	a5,-56(s0)
    16c0:	5fdc                	lw	a5,60(a5)
    16c2:	06f75763          	bge	a4,a5,1730 <schedule_dm+0x11c>
                highest_priority_thread = th;
    16c6:	fc043783          	ld	a5,-64(s0)
    16ca:	fcf43423          	sd	a5,-56(s0)
    16ce:	a08d                	j	1730 <schedule_dm+0x11c>
            }
        }
        else if (th->current_deadline <= current_time) {
    16d0:	fc043783          	ld	a5,-64(s0)
    16d4:	4ff8                	lw	a4,92(a5)
    16d6:	fac42783          	lw	a5,-84(s0)
    16da:	2781                	sext.w	a5,a5
    16dc:	00e7c763          	blt	a5,a4,16ea <schedule_dm+0xd6>
            highest_priority_thread = th;
    16e0:	fc043783          	ld	a5,-64(s0)
    16e4:	fcf43423          	sd	a5,-56(s0)
    16e8:	a0a1                	j	1730 <schedule_dm+0x11c>
        }
        else if (th->deadline < highest_priority_thread->deadline ) {
    16ea:	fc043783          	ld	a5,-64(s0)
    16ee:	47f8                	lw	a4,76(a5)
    16f0:	fc843783          	ld	a5,-56(s0)
    16f4:	47fc                	lw	a5,76(a5)
    16f6:	00f75763          	bge	a4,a5,1704 <schedule_dm+0xf0>
            highest_priority_thread = th;
    16fa:	fc043783          	ld	a5,-64(s0)
    16fe:	fcf43423          	sd	a5,-56(s0)
    1702:	a03d                	j	1730 <schedule_dm+0x11c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    1704:	fc043783          	ld	a5,-64(s0)
    1708:	47f8                	lw	a4,76(a5)
    170a:	fc843783          	ld	a5,-56(s0)
    170e:	47fc                	lw	a5,76(a5)
    1710:	02f71063          	bne	a4,a5,1730 <schedule_dm+0x11c>
    1714:	fc043783          	ld	a5,-64(s0)
    1718:	5fd8                	lw	a4,60(a5)
    171a:	fc843783          	ld	a5,-56(s0)
    171e:	5fdc                	lw	a5,60(a5)
    1720:	00f75863          	bge	a4,a5,1730 <schedule_dm+0x11c>
            highest_priority_thread = th;
    1724:	fc043783          	ld	a5,-64(s0)
    1728:	fcf43423          	sd	a5,-56(s0)
    172c:	a011                	j	1730 <schedule_dm+0x11c>
            if (th->current_deadline > current_time) continue;
    172e:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1730:	fc043783          	ld	a5,-64(s0)
    1734:	779c                	ld	a5,40(a5)
    1736:	f8f43023          	sd	a5,-128(s0)
    173a:	f8043783          	ld	a5,-128(s0)
    173e:	fd878793          	addi	a5,a5,-40
    1742:	fcf43023          	sd	a5,-64(s0)
    1746:	fc043783          	ld	a5,-64(s0)
    174a:	02878713          	addi	a4,a5,40
    174e:	649c                	ld	a5,8(s1)
    1750:	f2f71be3          	bne	a4,a5,1686 <schedule_dm+0x72>
        }
    }

    // the thread missing the current deadline
    if (highest_priority_thread->current_deadline <= current_time)
    1754:	fc843783          	ld	a5,-56(s0)
    1758:	4ff8                	lw	a4,92(a5)
    175a:	fac42783          	lw	a5,-84(s0)
    175e:	2781                	sext.w	a5,a5
    1760:	00e7cb63          	blt	a5,a4,1776 <schedule_dm+0x162>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    1764:	fc843783          	ld	a5,-56(s0)
    1768:	02878793          	addi	a5,a5,40
    176c:	f6f43823          	sd	a5,-144(s0)
    1770:	f6042c23          	sw	zero,-136(s0)
    1774:	a201                	j	1874 <schedule_dm+0x260>

    int executing_time = highest_priority_thread->remaining_time;
    1776:	fc843783          	ld	a5,-56(s0)
    177a:	4fbc                	lw	a5,88(a5)
    177c:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    1780:	fc843783          	ld	a5,-56(s0)
    1784:	4fb4                	lw	a3,88(a5)
    1786:	fc843783          	ld	a5,-56(s0)
    178a:	4ff8                	lw	a4,92(a5)
    178c:	fac42783          	lw	a5,-84(s0)
    1790:	40f707bb          	subw	a5,a4,a5
    1794:	2781                	sext.w	a5,a5
    1796:	8736                	mv	a4,a3
    1798:	00e7db63          	bge	a5,a4,17ae <schedule_dm+0x19a>
        executing_time = highest_priority_thread->current_deadline - current_time;
    179c:	fc843783          	ld	a5,-56(s0)
    17a0:	4ff8                	lw	a4,92(a5)
    17a2:	fac42783          	lw	a5,-84(s0)
    17a6:	40f707bb          	subw	a5,a4,a5
    17aa:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    17ae:	689c                	ld	a5,16(s1)
    17b0:	639c                	ld	a5,0(a5)
    17b2:	f8f43c23          	sd	a5,-104(s0)
    17b6:	f9843783          	ld	a5,-104(s0)
    17ba:	17e1                	addi	a5,a5,-8
    17bc:	faf43823          	sd	a5,-80(s0)
    17c0:	a049                	j	1842 <schedule_dm+0x22e>
        int interval = cur->release_time - current_time;
    17c2:	fb043783          	ld	a5,-80(s0)
    17c6:	4f98                	lw	a4,24(a5)
    17c8:	fac42783          	lw	a5,-84(s0)
    17cc:	40f707bb          	subw	a5,a4,a5
    17d0:	f8f42a23          	sw	a5,-108(s0)
        if (interval > executing_time) continue;
    17d4:	f9442703          	lw	a4,-108(s0)
    17d8:	fbc42783          	lw	a5,-68(s0)
    17dc:	2701                	sext.w	a4,a4
    17de:	2781                	sext.w	a5,a5
    17e0:	04e7c263          	blt	a5,a4,1824 <schedule_dm+0x210>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    17e4:	fc843783          	ld	a5,-56(s0)
    17e8:	47f8                	lw	a4,76(a5)
    17ea:	fb043783          	ld	a5,-80(s0)
    17ee:	639c                	ld	a5,0(a5)
    17f0:	47fc                	lw	a5,76(a5)
    17f2:	02f74b63          	blt	a4,a5,1828 <schedule_dm+0x214>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    17f6:	fc843783          	ld	a5,-56(s0)
    17fa:	47f8                	lw	a4,76(a5)
    17fc:	fb043783          	ld	a5,-80(s0)
    1800:	639c                	ld	a5,0(a5)
    1802:	47fc                	lw	a5,76(a5)
    1804:	00f71b63          	bne	a4,a5,181a <schedule_dm+0x206>
    1808:	fc843783          	ld	a5,-56(s0)
    180c:	5fd8                	lw	a4,60(a5)
    180e:	fb043783          	ld	a5,-80(s0)
    1812:	639c                	ld	a5,0(a5)
    1814:	5fdc                	lw	a5,60(a5)
    1816:	00f74b63          	blt	a4,a5,182c <schedule_dm+0x218>
        executing_time = interval;
    181a:	f9442783          	lw	a5,-108(s0)
    181e:	faf42e23          	sw	a5,-68(s0)
    1822:	a031                	j	182e <schedule_dm+0x21a>
        if (interval > executing_time) continue;
    1824:	0001                	nop
    1826:	a021                	j	182e <schedule_dm+0x21a>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    1828:	0001                	nop
    182a:	a011                	j	182e <schedule_dm+0x21a>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    182c:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    182e:	fb043783          	ld	a5,-80(s0)
    1832:	679c                	ld	a5,8(a5)
    1834:	f8f43423          	sd	a5,-120(s0)
    1838:	f8843783          	ld	a5,-120(s0)
    183c:	17e1                	addi	a5,a5,-8
    183e:	faf43823          	sd	a5,-80(s0)
    1842:	fb043783          	ld	a5,-80(s0)
    1846:	00878713          	addi	a4,a5,8
    184a:	689c                	ld	a5,16(s1)
    184c:	f6f71be3          	bne	a4,a5,17c2 <schedule_dm+0x1ae>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &highest_priority_thread->thread_list;
    1850:	fc843783          	ld	a5,-56(s0)
    1854:	02878793          	addi	a5,a5,40
    1858:	f6f43023          	sd	a5,-160(s0)
    r.allocated_time = executing_time;
    185c:	fbc42783          	lw	a5,-68(s0)
    1860:	f6f42423          	sw	a5,-152(s0)
    return r;
    1864:	f6043783          	ld	a5,-160(s0)
    1868:	f6f43823          	sd	a5,-144(s0)
    186c:	f6843783          	ld	a5,-152(s0)
    1870:	f6f43c23          	sd	a5,-136(s0)
    1874:	4701                	li	a4,0
    1876:	f7043703          	ld	a4,-144(s0)
    187a:	4781                	li	a5,0
    187c:	f7843783          	ld	a5,-136(s0)
    1880:	893a                	mv	s2,a4
    1882:	89be                	mv	s3,a5
    1884:	874a                	mv	a4,s2
    1886:	87ce                	mv	a5,s3
    1888:	853a                	mv	a0,a4
    188a:	85be                	mv	a1,a5
    188c:	60ae                	ld	ra,200(sp)
    188e:	640e                	ld	s0,192(sp)
    1890:	74ea                	ld	s1,184(sp)
    1892:	794a                	ld	s2,176(sp)
    1894:	79aa                	ld	s3,168(sp)
    1896:	6169                	addi	sp,sp,208
    1898:	8082                	ret
