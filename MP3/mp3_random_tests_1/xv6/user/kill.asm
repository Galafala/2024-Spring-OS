
user/_kill:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char **argv)
{
       0:	7179                	addi	sp,sp,-48
       2:	f406                	sd	ra,40(sp)
       4:	f022                	sd	s0,32(sp)
       6:	1800                	addi	s0,sp,48
       8:	87aa                	mv	a5,a0
       a:	fcb43823          	sd	a1,-48(s0)
       e:	fcf42e23          	sw	a5,-36(s0)
  int i;

  if(argc < 2){
      12:	fdc42783          	lw	a5,-36(s0)
      16:	0007871b          	sext.w	a4,a5
      1a:	4785                	li	a5,1
      1c:	02e7c063          	blt	a5,a4,3c <main+0x3c>
    fprintf(2, "usage: kill pid...\n");
      20:	00002597          	auipc	a1,0x2
      24:	85058593          	addi	a1,a1,-1968 # 1870 <schedule_dm+0x288>
      28:	4509                	li	a0,2
      2a:	00001097          	auipc	ra,0x1
      2e:	9e0080e7          	jalr	-1568(ra) # a0a <fprintf>
    exit(1);
      32:	4505                	li	a0,1
      34:	00000097          	auipc	ra,0x0
      38:	4e8080e7          	jalr	1256(ra) # 51c <exit>
  }
  for(i=1; i<argc; i++)
      3c:	4785                	li	a5,1
      3e:	fef42623          	sw	a5,-20(s0)
      42:	a805                	j	72 <main+0x72>
    kill(atoi(argv[i]));
      44:	fec42783          	lw	a5,-20(s0)
      48:	078e                	slli	a5,a5,0x3
      4a:	fd043703          	ld	a4,-48(s0)
      4e:	97ba                	add	a5,a5,a4
      50:	639c                	ld	a5,0(a5)
      52:	853e                	mv	a0,a5
      54:	00000097          	auipc	ra,0x0
      58:	2d0080e7          	jalr	720(ra) # 324 <atoi>
      5c:	87aa                	mv	a5,a0
      5e:	853e                	mv	a0,a5
      60:	00000097          	auipc	ra,0x0
      64:	4ec080e7          	jalr	1260(ra) # 54c <kill>
  for(i=1; i<argc; i++)
      68:	fec42783          	lw	a5,-20(s0)
      6c:	2785                	addiw	a5,a5,1
      6e:	fef42623          	sw	a5,-20(s0)
      72:	fec42703          	lw	a4,-20(s0)
      76:	fdc42783          	lw	a5,-36(s0)
      7a:	2701                	sext.w	a4,a4
      7c:	2781                	sext.w	a5,a5
      7e:	fcf743e3          	blt	a4,a5,44 <main+0x44>
  exit(0);
      82:	4501                	li	a0,0
      84:	00000097          	auipc	ra,0x0
      88:	498080e7          	jalr	1176(ra) # 51c <exit>

000000000000008c <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      8c:	7179                	addi	sp,sp,-48
      8e:	f422                	sd	s0,40(sp)
      90:	1800                	addi	s0,sp,48
      92:	fca43c23          	sd	a0,-40(s0)
      96:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      9a:	fd843783          	ld	a5,-40(s0)
      9e:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      a2:	0001                	nop
      a4:	fd043703          	ld	a4,-48(s0)
      a8:	00170793          	addi	a5,a4,1
      ac:	fcf43823          	sd	a5,-48(s0)
      b0:	fd843783          	ld	a5,-40(s0)
      b4:	00178693          	addi	a3,a5,1
      b8:	fcd43c23          	sd	a3,-40(s0)
      bc:	00074703          	lbu	a4,0(a4)
      c0:	00e78023          	sb	a4,0(a5)
      c4:	0007c783          	lbu	a5,0(a5)
      c8:	fff1                	bnez	a5,a4 <strcpy+0x18>
    ;
  return os;
      ca:	fe843783          	ld	a5,-24(s0)
}
      ce:	853e                	mv	a0,a5
      d0:	7422                	ld	s0,40(sp)
      d2:	6145                	addi	sp,sp,48
      d4:	8082                	ret

00000000000000d6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      d6:	1101                	addi	sp,sp,-32
      d8:	ec22                	sd	s0,24(sp)
      da:	1000                	addi	s0,sp,32
      dc:	fea43423          	sd	a0,-24(s0)
      e0:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
      e4:	a819                	j	fa <strcmp+0x24>
    p++, q++;
      e6:	fe843783          	ld	a5,-24(s0)
      ea:	0785                	addi	a5,a5,1
      ec:	fef43423          	sd	a5,-24(s0)
      f0:	fe043783          	ld	a5,-32(s0)
      f4:	0785                	addi	a5,a5,1
      f6:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
      fa:	fe843783          	ld	a5,-24(s0)
      fe:	0007c783          	lbu	a5,0(a5)
     102:	cb99                	beqz	a5,118 <strcmp+0x42>
     104:	fe843783          	ld	a5,-24(s0)
     108:	0007c703          	lbu	a4,0(a5)
     10c:	fe043783          	ld	a5,-32(s0)
     110:	0007c783          	lbu	a5,0(a5)
     114:	fcf709e3          	beq	a4,a5,e6 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     118:	fe843783          	ld	a5,-24(s0)
     11c:	0007c783          	lbu	a5,0(a5)
     120:	0007871b          	sext.w	a4,a5
     124:	fe043783          	ld	a5,-32(s0)
     128:	0007c783          	lbu	a5,0(a5)
     12c:	2781                	sext.w	a5,a5
     12e:	40f707bb          	subw	a5,a4,a5
     132:	2781                	sext.w	a5,a5
}
     134:	853e                	mv	a0,a5
     136:	6462                	ld	s0,24(sp)
     138:	6105                	addi	sp,sp,32
     13a:	8082                	ret

000000000000013c <strlen>:

uint
strlen(const char *s)
{
     13c:	7179                	addi	sp,sp,-48
     13e:	f422                	sd	s0,40(sp)
     140:	1800                	addi	s0,sp,48
     142:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     146:	fe042623          	sw	zero,-20(s0)
     14a:	a031                	j	156 <strlen+0x1a>
     14c:	fec42783          	lw	a5,-20(s0)
     150:	2785                	addiw	a5,a5,1
     152:	fef42623          	sw	a5,-20(s0)
     156:	fec42783          	lw	a5,-20(s0)
     15a:	fd843703          	ld	a4,-40(s0)
     15e:	97ba                	add	a5,a5,a4
     160:	0007c783          	lbu	a5,0(a5)
     164:	f7e5                	bnez	a5,14c <strlen+0x10>
    ;
  return n;
     166:	fec42783          	lw	a5,-20(s0)
}
     16a:	853e                	mv	a0,a5
     16c:	7422                	ld	s0,40(sp)
     16e:	6145                	addi	sp,sp,48
     170:	8082                	ret

0000000000000172 <memset>:

void*
memset(void *dst, int c, uint n)
{
     172:	7179                	addi	sp,sp,-48
     174:	f422                	sd	s0,40(sp)
     176:	1800                	addi	s0,sp,48
     178:	fca43c23          	sd	a0,-40(s0)
     17c:	87ae                	mv	a5,a1
     17e:	8732                	mv	a4,a2
     180:	fcf42a23          	sw	a5,-44(s0)
     184:	87ba                	mv	a5,a4
     186:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     18a:	fd843783          	ld	a5,-40(s0)
     18e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     192:	fe042623          	sw	zero,-20(s0)
     196:	a00d                	j	1b8 <memset+0x46>
    cdst[i] = c;
     198:	fec42783          	lw	a5,-20(s0)
     19c:	fe043703          	ld	a4,-32(s0)
     1a0:	97ba                	add	a5,a5,a4
     1a2:	fd442703          	lw	a4,-44(s0)
     1a6:	0ff77713          	andi	a4,a4,255
     1aa:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1ae:	fec42783          	lw	a5,-20(s0)
     1b2:	2785                	addiw	a5,a5,1
     1b4:	fef42623          	sw	a5,-20(s0)
     1b8:	fec42703          	lw	a4,-20(s0)
     1bc:	fd042783          	lw	a5,-48(s0)
     1c0:	2781                	sext.w	a5,a5
     1c2:	fcf76be3          	bltu	a4,a5,198 <memset+0x26>
  }
  return dst;
     1c6:	fd843783          	ld	a5,-40(s0)
}
     1ca:	853e                	mv	a0,a5
     1cc:	7422                	ld	s0,40(sp)
     1ce:	6145                	addi	sp,sp,48
     1d0:	8082                	ret

00000000000001d2 <strchr>:

char*
strchr(const char *s, char c)
{
     1d2:	1101                	addi	sp,sp,-32
     1d4:	ec22                	sd	s0,24(sp)
     1d6:	1000                	addi	s0,sp,32
     1d8:	fea43423          	sd	a0,-24(s0)
     1dc:	87ae                	mv	a5,a1
     1de:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     1e2:	a01d                	j	208 <strchr+0x36>
    if(*s == c)
     1e4:	fe843783          	ld	a5,-24(s0)
     1e8:	0007c703          	lbu	a4,0(a5)
     1ec:	fe744783          	lbu	a5,-25(s0)
     1f0:	0ff7f793          	andi	a5,a5,255
     1f4:	00e79563          	bne	a5,a4,1fe <strchr+0x2c>
      return (char*)s;
     1f8:	fe843783          	ld	a5,-24(s0)
     1fc:	a821                	j	214 <strchr+0x42>
  for(; *s; s++)
     1fe:	fe843783          	ld	a5,-24(s0)
     202:	0785                	addi	a5,a5,1
     204:	fef43423          	sd	a5,-24(s0)
     208:	fe843783          	ld	a5,-24(s0)
     20c:	0007c783          	lbu	a5,0(a5)
     210:	fbf1                	bnez	a5,1e4 <strchr+0x12>
  return 0;
     212:	4781                	li	a5,0
}
     214:	853e                	mv	a0,a5
     216:	6462                	ld	s0,24(sp)
     218:	6105                	addi	sp,sp,32
     21a:	8082                	ret

000000000000021c <gets>:

char*
gets(char *buf, int max)
{
     21c:	7179                	addi	sp,sp,-48
     21e:	f406                	sd	ra,40(sp)
     220:	f022                	sd	s0,32(sp)
     222:	1800                	addi	s0,sp,48
     224:	fca43c23          	sd	a0,-40(s0)
     228:	87ae                	mv	a5,a1
     22a:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     22e:	fe042623          	sw	zero,-20(s0)
     232:	a8a1                	j	28a <gets+0x6e>
    cc = read(0, &c, 1);
     234:	fe740793          	addi	a5,s0,-25
     238:	4605                	li	a2,1
     23a:	85be                	mv	a1,a5
     23c:	4501                	li	a0,0
     23e:	00000097          	auipc	ra,0x0
     242:	2f6080e7          	jalr	758(ra) # 534 <read>
     246:	87aa                	mv	a5,a0
     248:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     24c:	fe842783          	lw	a5,-24(s0)
     250:	2781                	sext.w	a5,a5
     252:	04f05763          	blez	a5,2a0 <gets+0x84>
      break;
    buf[i++] = c;
     256:	fec42783          	lw	a5,-20(s0)
     25a:	0017871b          	addiw	a4,a5,1
     25e:	fee42623          	sw	a4,-20(s0)
     262:	873e                	mv	a4,a5
     264:	fd843783          	ld	a5,-40(s0)
     268:	97ba                	add	a5,a5,a4
     26a:	fe744703          	lbu	a4,-25(s0)
     26e:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     272:	fe744783          	lbu	a5,-25(s0)
     276:	873e                	mv	a4,a5
     278:	47a9                	li	a5,10
     27a:	02f70463          	beq	a4,a5,2a2 <gets+0x86>
     27e:	fe744783          	lbu	a5,-25(s0)
     282:	873e                	mv	a4,a5
     284:	47b5                	li	a5,13
     286:	00f70e63          	beq	a4,a5,2a2 <gets+0x86>
  for(i=0; i+1 < max; ){
     28a:	fec42783          	lw	a5,-20(s0)
     28e:	2785                	addiw	a5,a5,1
     290:	0007871b          	sext.w	a4,a5
     294:	fd442783          	lw	a5,-44(s0)
     298:	2781                	sext.w	a5,a5
     29a:	f8f74de3          	blt	a4,a5,234 <gets+0x18>
     29e:	a011                	j	2a2 <gets+0x86>
      break;
     2a0:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2a2:	fec42783          	lw	a5,-20(s0)
     2a6:	fd843703          	ld	a4,-40(s0)
     2aa:	97ba                	add	a5,a5,a4
     2ac:	00078023          	sb	zero,0(a5)
  return buf;
     2b0:	fd843783          	ld	a5,-40(s0)
}
     2b4:	853e                	mv	a0,a5
     2b6:	70a2                	ld	ra,40(sp)
     2b8:	7402                	ld	s0,32(sp)
     2ba:	6145                	addi	sp,sp,48
     2bc:	8082                	ret

00000000000002be <stat>:

int
stat(const char *n, struct stat *st)
{
     2be:	7179                	addi	sp,sp,-48
     2c0:	f406                	sd	ra,40(sp)
     2c2:	f022                	sd	s0,32(sp)
     2c4:	1800                	addi	s0,sp,48
     2c6:	fca43c23          	sd	a0,-40(s0)
     2ca:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2ce:	4581                	li	a1,0
     2d0:	fd843503          	ld	a0,-40(s0)
     2d4:	00000097          	auipc	ra,0x0
     2d8:	288080e7          	jalr	648(ra) # 55c <open>
     2dc:	87aa                	mv	a5,a0
     2de:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     2e2:	fec42783          	lw	a5,-20(s0)
     2e6:	2781                	sext.w	a5,a5
     2e8:	0007d463          	bgez	a5,2f0 <stat+0x32>
    return -1;
     2ec:	57fd                	li	a5,-1
     2ee:	a035                	j	31a <stat+0x5c>
  r = fstat(fd, st);
     2f0:	fec42783          	lw	a5,-20(s0)
     2f4:	fd043583          	ld	a1,-48(s0)
     2f8:	853e                	mv	a0,a5
     2fa:	00000097          	auipc	ra,0x0
     2fe:	27a080e7          	jalr	634(ra) # 574 <fstat>
     302:	87aa                	mv	a5,a0
     304:	fef42423          	sw	a5,-24(s0)
  close(fd);
     308:	fec42783          	lw	a5,-20(s0)
     30c:	853e                	mv	a0,a5
     30e:	00000097          	auipc	ra,0x0
     312:	236080e7          	jalr	566(ra) # 544 <close>
  return r;
     316:	fe842783          	lw	a5,-24(s0)
}
     31a:	853e                	mv	a0,a5
     31c:	70a2                	ld	ra,40(sp)
     31e:	7402                	ld	s0,32(sp)
     320:	6145                	addi	sp,sp,48
     322:	8082                	ret

0000000000000324 <atoi>:

int
atoi(const char *s)
{
     324:	7179                	addi	sp,sp,-48
     326:	f422                	sd	s0,40(sp)
     328:	1800                	addi	s0,sp,48
     32a:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     32e:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     332:	a815                	j	366 <atoi+0x42>
    n = n*10 + *s++ - '0';
     334:	fec42703          	lw	a4,-20(s0)
     338:	87ba                	mv	a5,a4
     33a:	0027979b          	slliw	a5,a5,0x2
     33e:	9fb9                	addw	a5,a5,a4
     340:	0017979b          	slliw	a5,a5,0x1
     344:	0007871b          	sext.w	a4,a5
     348:	fd843783          	ld	a5,-40(s0)
     34c:	00178693          	addi	a3,a5,1
     350:	fcd43c23          	sd	a3,-40(s0)
     354:	0007c783          	lbu	a5,0(a5)
     358:	2781                	sext.w	a5,a5
     35a:	9fb9                	addw	a5,a5,a4
     35c:	2781                	sext.w	a5,a5
     35e:	fd07879b          	addiw	a5,a5,-48
     362:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     366:	fd843783          	ld	a5,-40(s0)
     36a:	0007c783          	lbu	a5,0(a5)
     36e:	873e                	mv	a4,a5
     370:	02f00793          	li	a5,47
     374:	00e7fb63          	bgeu	a5,a4,38a <atoi+0x66>
     378:	fd843783          	ld	a5,-40(s0)
     37c:	0007c783          	lbu	a5,0(a5)
     380:	873e                	mv	a4,a5
     382:	03900793          	li	a5,57
     386:	fae7f7e3          	bgeu	a5,a4,334 <atoi+0x10>
  return n;
     38a:	fec42783          	lw	a5,-20(s0)
}
     38e:	853e                	mv	a0,a5
     390:	7422                	ld	s0,40(sp)
     392:	6145                	addi	sp,sp,48
     394:	8082                	ret

0000000000000396 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     396:	7139                	addi	sp,sp,-64
     398:	fc22                	sd	s0,56(sp)
     39a:	0080                	addi	s0,sp,64
     39c:	fca43c23          	sd	a0,-40(s0)
     3a0:	fcb43823          	sd	a1,-48(s0)
     3a4:	87b2                	mv	a5,a2
     3a6:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3aa:	fd843783          	ld	a5,-40(s0)
     3ae:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3b2:	fd043783          	ld	a5,-48(s0)
     3b6:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3ba:	fe043703          	ld	a4,-32(s0)
     3be:	fe843783          	ld	a5,-24(s0)
     3c2:	02e7fc63          	bgeu	a5,a4,3fa <memmove+0x64>
    while(n-- > 0)
     3c6:	a00d                	j	3e8 <memmove+0x52>
      *dst++ = *src++;
     3c8:	fe043703          	ld	a4,-32(s0)
     3cc:	00170793          	addi	a5,a4,1
     3d0:	fef43023          	sd	a5,-32(s0)
     3d4:	fe843783          	ld	a5,-24(s0)
     3d8:	00178693          	addi	a3,a5,1
     3dc:	fed43423          	sd	a3,-24(s0)
     3e0:	00074703          	lbu	a4,0(a4)
     3e4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     3e8:	fcc42783          	lw	a5,-52(s0)
     3ec:	fff7871b          	addiw	a4,a5,-1
     3f0:	fce42623          	sw	a4,-52(s0)
     3f4:	fcf04ae3          	bgtz	a5,3c8 <memmove+0x32>
     3f8:	a891                	j	44c <memmove+0xb6>
  } else {
    dst += n;
     3fa:	fcc42783          	lw	a5,-52(s0)
     3fe:	fe843703          	ld	a4,-24(s0)
     402:	97ba                	add	a5,a5,a4
     404:	fef43423          	sd	a5,-24(s0)
    src += n;
     408:	fcc42783          	lw	a5,-52(s0)
     40c:	fe043703          	ld	a4,-32(s0)
     410:	97ba                	add	a5,a5,a4
     412:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     416:	a01d                	j	43c <memmove+0xa6>
      *--dst = *--src;
     418:	fe043783          	ld	a5,-32(s0)
     41c:	17fd                	addi	a5,a5,-1
     41e:	fef43023          	sd	a5,-32(s0)
     422:	fe843783          	ld	a5,-24(s0)
     426:	17fd                	addi	a5,a5,-1
     428:	fef43423          	sd	a5,-24(s0)
     42c:	fe043783          	ld	a5,-32(s0)
     430:	0007c703          	lbu	a4,0(a5)
     434:	fe843783          	ld	a5,-24(s0)
     438:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     43c:	fcc42783          	lw	a5,-52(s0)
     440:	fff7871b          	addiw	a4,a5,-1
     444:	fce42623          	sw	a4,-52(s0)
     448:	fcf048e3          	bgtz	a5,418 <memmove+0x82>
  }
  return vdst;
     44c:	fd843783          	ld	a5,-40(s0)
}
     450:	853e                	mv	a0,a5
     452:	7462                	ld	s0,56(sp)
     454:	6121                	addi	sp,sp,64
     456:	8082                	ret

0000000000000458 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     458:	7139                	addi	sp,sp,-64
     45a:	fc22                	sd	s0,56(sp)
     45c:	0080                	addi	s0,sp,64
     45e:	fca43c23          	sd	a0,-40(s0)
     462:	fcb43823          	sd	a1,-48(s0)
     466:	87b2                	mv	a5,a2
     468:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     46c:	fd843783          	ld	a5,-40(s0)
     470:	fef43423          	sd	a5,-24(s0)
     474:	fd043783          	ld	a5,-48(s0)
     478:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     47c:	a0a1                	j	4c4 <memcmp+0x6c>
    if (*p1 != *p2) {
     47e:	fe843783          	ld	a5,-24(s0)
     482:	0007c703          	lbu	a4,0(a5)
     486:	fe043783          	ld	a5,-32(s0)
     48a:	0007c783          	lbu	a5,0(a5)
     48e:	02f70163          	beq	a4,a5,4b0 <memcmp+0x58>
      return *p1 - *p2;
     492:	fe843783          	ld	a5,-24(s0)
     496:	0007c783          	lbu	a5,0(a5)
     49a:	0007871b          	sext.w	a4,a5
     49e:	fe043783          	ld	a5,-32(s0)
     4a2:	0007c783          	lbu	a5,0(a5)
     4a6:	2781                	sext.w	a5,a5
     4a8:	40f707bb          	subw	a5,a4,a5
     4ac:	2781                	sext.w	a5,a5
     4ae:	a01d                	j	4d4 <memcmp+0x7c>
    }
    p1++;
     4b0:	fe843783          	ld	a5,-24(s0)
     4b4:	0785                	addi	a5,a5,1
     4b6:	fef43423          	sd	a5,-24(s0)
    p2++;
     4ba:	fe043783          	ld	a5,-32(s0)
     4be:	0785                	addi	a5,a5,1
     4c0:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4c4:	fcc42783          	lw	a5,-52(s0)
     4c8:	fff7871b          	addiw	a4,a5,-1
     4cc:	fce42623          	sw	a4,-52(s0)
     4d0:	f7dd                	bnez	a5,47e <memcmp+0x26>
  }
  return 0;
     4d2:	4781                	li	a5,0
}
     4d4:	853e                	mv	a0,a5
     4d6:	7462                	ld	s0,56(sp)
     4d8:	6121                	addi	sp,sp,64
     4da:	8082                	ret

00000000000004dc <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4dc:	7179                	addi	sp,sp,-48
     4de:	f406                	sd	ra,40(sp)
     4e0:	f022                	sd	s0,32(sp)
     4e2:	1800                	addi	s0,sp,48
     4e4:	fea43423          	sd	a0,-24(s0)
     4e8:	feb43023          	sd	a1,-32(s0)
     4ec:	87b2                	mv	a5,a2
     4ee:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     4f2:	fdc42783          	lw	a5,-36(s0)
     4f6:	863e                	mv	a2,a5
     4f8:	fe043583          	ld	a1,-32(s0)
     4fc:	fe843503          	ld	a0,-24(s0)
     500:	00000097          	auipc	ra,0x0
     504:	e96080e7          	jalr	-362(ra) # 396 <memmove>
     508:	87aa                	mv	a5,a0
}
     50a:	853e                	mv	a0,a5
     50c:	70a2                	ld	ra,40(sp)
     50e:	7402                	ld	s0,32(sp)
     510:	6145                	addi	sp,sp,48
     512:	8082                	ret

0000000000000514 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     514:	4885                	li	a7,1
 ecall
     516:	00000073          	ecall
 ret
     51a:	8082                	ret

000000000000051c <exit>:
.global exit
exit:
 li a7, SYS_exit
     51c:	4889                	li	a7,2
 ecall
     51e:	00000073          	ecall
 ret
     522:	8082                	ret

0000000000000524 <wait>:
.global wait
wait:
 li a7, SYS_wait
     524:	488d                	li	a7,3
 ecall
     526:	00000073          	ecall
 ret
     52a:	8082                	ret

000000000000052c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     52c:	4891                	li	a7,4
 ecall
     52e:	00000073          	ecall
 ret
     532:	8082                	ret

0000000000000534 <read>:
.global read
read:
 li a7, SYS_read
     534:	4895                	li	a7,5
 ecall
     536:	00000073          	ecall
 ret
     53a:	8082                	ret

000000000000053c <write>:
.global write
write:
 li a7, SYS_write
     53c:	48c1                	li	a7,16
 ecall
     53e:	00000073          	ecall
 ret
     542:	8082                	ret

0000000000000544 <close>:
.global close
close:
 li a7, SYS_close
     544:	48d5                	li	a7,21
 ecall
     546:	00000073          	ecall
 ret
     54a:	8082                	ret

000000000000054c <kill>:
.global kill
kill:
 li a7, SYS_kill
     54c:	4899                	li	a7,6
 ecall
     54e:	00000073          	ecall
 ret
     552:	8082                	ret

0000000000000554 <exec>:
.global exec
exec:
 li a7, SYS_exec
     554:	489d                	li	a7,7
 ecall
     556:	00000073          	ecall
 ret
     55a:	8082                	ret

000000000000055c <open>:
.global open
open:
 li a7, SYS_open
     55c:	48bd                	li	a7,15
 ecall
     55e:	00000073          	ecall
 ret
     562:	8082                	ret

0000000000000564 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     564:	48c5                	li	a7,17
 ecall
     566:	00000073          	ecall
 ret
     56a:	8082                	ret

000000000000056c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     56c:	48c9                	li	a7,18
 ecall
     56e:	00000073          	ecall
 ret
     572:	8082                	ret

0000000000000574 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     574:	48a1                	li	a7,8
 ecall
     576:	00000073          	ecall
 ret
     57a:	8082                	ret

000000000000057c <link>:
.global link
link:
 li a7, SYS_link
     57c:	48cd                	li	a7,19
 ecall
     57e:	00000073          	ecall
 ret
     582:	8082                	ret

0000000000000584 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     584:	48d1                	li	a7,20
 ecall
     586:	00000073          	ecall
 ret
     58a:	8082                	ret

000000000000058c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     58c:	48a5                	li	a7,9
 ecall
     58e:	00000073          	ecall
 ret
     592:	8082                	ret

0000000000000594 <dup>:
.global dup
dup:
 li a7, SYS_dup
     594:	48a9                	li	a7,10
 ecall
     596:	00000073          	ecall
 ret
     59a:	8082                	ret

000000000000059c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     59c:	48ad                	li	a7,11
 ecall
     59e:	00000073          	ecall
 ret
     5a2:	8082                	ret

00000000000005a4 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5a4:	48b1                	li	a7,12
 ecall
     5a6:	00000073          	ecall
 ret
     5aa:	8082                	ret

00000000000005ac <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5ac:	48b5                	li	a7,13
 ecall
     5ae:	00000073          	ecall
 ret
     5b2:	8082                	ret

00000000000005b4 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5b4:	48b9                	li	a7,14
 ecall
     5b6:	00000073          	ecall
 ret
     5ba:	8082                	ret

00000000000005bc <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5bc:	48d9                	li	a7,22
 ecall
     5be:	00000073          	ecall
 ret
     5c2:	8082                	ret

00000000000005c4 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5c4:	48dd                	li	a7,23
 ecall
     5c6:	00000073          	ecall
 ret
     5ca:	8082                	ret

00000000000005cc <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5cc:	48e1                	li	a7,24
 ecall
     5ce:	00000073          	ecall
 ret
     5d2:	8082                	ret

00000000000005d4 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5d4:	1101                	addi	sp,sp,-32
     5d6:	ec06                	sd	ra,24(sp)
     5d8:	e822                	sd	s0,16(sp)
     5da:	1000                	addi	s0,sp,32
     5dc:	87aa                	mv	a5,a0
     5de:	872e                	mv	a4,a1
     5e0:	fef42623          	sw	a5,-20(s0)
     5e4:	87ba                	mv	a5,a4
     5e6:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     5ea:	feb40713          	addi	a4,s0,-21
     5ee:	fec42783          	lw	a5,-20(s0)
     5f2:	4605                	li	a2,1
     5f4:	85ba                	mv	a1,a4
     5f6:	853e                	mv	a0,a5
     5f8:	00000097          	auipc	ra,0x0
     5fc:	f44080e7          	jalr	-188(ra) # 53c <write>
}
     600:	0001                	nop
     602:	60e2                	ld	ra,24(sp)
     604:	6442                	ld	s0,16(sp)
     606:	6105                	addi	sp,sp,32
     608:	8082                	ret

000000000000060a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     60a:	7139                	addi	sp,sp,-64
     60c:	fc06                	sd	ra,56(sp)
     60e:	f822                	sd	s0,48(sp)
     610:	0080                	addi	s0,sp,64
     612:	87aa                	mv	a5,a0
     614:	8736                	mv	a4,a3
     616:	fcf42623          	sw	a5,-52(s0)
     61a:	87ae                	mv	a5,a1
     61c:	fcf42423          	sw	a5,-56(s0)
     620:	87b2                	mv	a5,a2
     622:	fcf42223          	sw	a5,-60(s0)
     626:	87ba                	mv	a5,a4
     628:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     62c:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     630:	fc042783          	lw	a5,-64(s0)
     634:	2781                	sext.w	a5,a5
     636:	c38d                	beqz	a5,658 <printint+0x4e>
     638:	fc842783          	lw	a5,-56(s0)
     63c:	2781                	sext.w	a5,a5
     63e:	0007dd63          	bgez	a5,658 <printint+0x4e>
    neg = 1;
     642:	4785                	li	a5,1
     644:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     648:	fc842783          	lw	a5,-56(s0)
     64c:	40f007bb          	negw	a5,a5
     650:	2781                	sext.w	a5,a5
     652:	fef42223          	sw	a5,-28(s0)
     656:	a029                	j	660 <printint+0x56>
  } else {
    x = xx;
     658:	fc842783          	lw	a5,-56(s0)
     65c:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     660:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     664:	fc442783          	lw	a5,-60(s0)
     668:	fe442703          	lw	a4,-28(s0)
     66c:	02f777bb          	remuw	a5,a4,a5
     670:	0007861b          	sext.w	a2,a5
     674:	fec42783          	lw	a5,-20(s0)
     678:	0017871b          	addiw	a4,a5,1
     67c:	fee42623          	sw	a4,-20(s0)
     680:	00001697          	auipc	a3,0x1
     684:	21068693          	addi	a3,a3,528 # 1890 <digits>
     688:	02061713          	slli	a4,a2,0x20
     68c:	9301                	srli	a4,a4,0x20
     68e:	9736                	add	a4,a4,a3
     690:	00074703          	lbu	a4,0(a4)
     694:	ff040693          	addi	a3,s0,-16
     698:	97b6                	add	a5,a5,a3
     69a:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     69e:	fc442783          	lw	a5,-60(s0)
     6a2:	fe442703          	lw	a4,-28(s0)
     6a6:	02f757bb          	divuw	a5,a4,a5
     6aa:	fef42223          	sw	a5,-28(s0)
     6ae:	fe442783          	lw	a5,-28(s0)
     6b2:	2781                	sext.w	a5,a5
     6b4:	fbc5                	bnez	a5,664 <printint+0x5a>
  if(neg)
     6b6:	fe842783          	lw	a5,-24(s0)
     6ba:	2781                	sext.w	a5,a5
     6bc:	cf95                	beqz	a5,6f8 <printint+0xee>
    buf[i++] = '-';
     6be:	fec42783          	lw	a5,-20(s0)
     6c2:	0017871b          	addiw	a4,a5,1
     6c6:	fee42623          	sw	a4,-20(s0)
     6ca:	ff040713          	addi	a4,s0,-16
     6ce:	97ba                	add	a5,a5,a4
     6d0:	02d00713          	li	a4,45
     6d4:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6d8:	a005                	j	6f8 <printint+0xee>
    putc(fd, buf[i]);
     6da:	fec42783          	lw	a5,-20(s0)
     6de:	ff040713          	addi	a4,s0,-16
     6e2:	97ba                	add	a5,a5,a4
     6e4:	fe07c703          	lbu	a4,-32(a5)
     6e8:	fcc42783          	lw	a5,-52(s0)
     6ec:	85ba                	mv	a1,a4
     6ee:	853e                	mv	a0,a5
     6f0:	00000097          	auipc	ra,0x0
     6f4:	ee4080e7          	jalr	-284(ra) # 5d4 <putc>
  while(--i >= 0)
     6f8:	fec42783          	lw	a5,-20(s0)
     6fc:	37fd                	addiw	a5,a5,-1
     6fe:	fef42623          	sw	a5,-20(s0)
     702:	fec42783          	lw	a5,-20(s0)
     706:	2781                	sext.w	a5,a5
     708:	fc07d9e3          	bgez	a5,6da <printint+0xd0>
}
     70c:	0001                	nop
     70e:	0001                	nop
     710:	70e2                	ld	ra,56(sp)
     712:	7442                	ld	s0,48(sp)
     714:	6121                	addi	sp,sp,64
     716:	8082                	ret

0000000000000718 <printptr>:

static void
printptr(int fd, uint64 x) {
     718:	7179                	addi	sp,sp,-48
     71a:	f406                	sd	ra,40(sp)
     71c:	f022                	sd	s0,32(sp)
     71e:	1800                	addi	s0,sp,48
     720:	87aa                	mv	a5,a0
     722:	fcb43823          	sd	a1,-48(s0)
     726:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     72a:	fdc42783          	lw	a5,-36(s0)
     72e:	03000593          	li	a1,48
     732:	853e                	mv	a0,a5
     734:	00000097          	auipc	ra,0x0
     738:	ea0080e7          	jalr	-352(ra) # 5d4 <putc>
  putc(fd, 'x');
     73c:	fdc42783          	lw	a5,-36(s0)
     740:	07800593          	li	a1,120
     744:	853e                	mv	a0,a5
     746:	00000097          	auipc	ra,0x0
     74a:	e8e080e7          	jalr	-370(ra) # 5d4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     74e:	fe042623          	sw	zero,-20(s0)
     752:	a82d                	j	78c <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     754:	fd043783          	ld	a5,-48(s0)
     758:	93f1                	srli	a5,a5,0x3c
     75a:	00001717          	auipc	a4,0x1
     75e:	13670713          	addi	a4,a4,310 # 1890 <digits>
     762:	97ba                	add	a5,a5,a4
     764:	0007c703          	lbu	a4,0(a5)
     768:	fdc42783          	lw	a5,-36(s0)
     76c:	85ba                	mv	a1,a4
     76e:	853e                	mv	a0,a5
     770:	00000097          	auipc	ra,0x0
     774:	e64080e7          	jalr	-412(ra) # 5d4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     778:	fec42783          	lw	a5,-20(s0)
     77c:	2785                	addiw	a5,a5,1
     77e:	fef42623          	sw	a5,-20(s0)
     782:	fd043783          	ld	a5,-48(s0)
     786:	0792                	slli	a5,a5,0x4
     788:	fcf43823          	sd	a5,-48(s0)
     78c:	fec42783          	lw	a5,-20(s0)
     790:	873e                	mv	a4,a5
     792:	47bd                	li	a5,15
     794:	fce7f0e3          	bgeu	a5,a4,754 <printptr+0x3c>
}
     798:	0001                	nop
     79a:	0001                	nop
     79c:	70a2                	ld	ra,40(sp)
     79e:	7402                	ld	s0,32(sp)
     7a0:	6145                	addi	sp,sp,48
     7a2:	8082                	ret

00000000000007a4 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7a4:	715d                	addi	sp,sp,-80
     7a6:	e486                	sd	ra,72(sp)
     7a8:	e0a2                	sd	s0,64(sp)
     7aa:	0880                	addi	s0,sp,80
     7ac:	87aa                	mv	a5,a0
     7ae:	fcb43023          	sd	a1,-64(s0)
     7b2:	fac43c23          	sd	a2,-72(s0)
     7b6:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7ba:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7be:	fe042223          	sw	zero,-28(s0)
     7c2:	a42d                	j	9ec <vprintf+0x248>
    c = fmt[i] & 0xff;
     7c4:	fe442783          	lw	a5,-28(s0)
     7c8:	fc043703          	ld	a4,-64(s0)
     7cc:	97ba                	add	a5,a5,a4
     7ce:	0007c783          	lbu	a5,0(a5)
     7d2:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7d6:	fe042783          	lw	a5,-32(s0)
     7da:	2781                	sext.w	a5,a5
     7dc:	eb9d                	bnez	a5,812 <vprintf+0x6e>
      if(c == '%'){
     7de:	fdc42783          	lw	a5,-36(s0)
     7e2:	0007871b          	sext.w	a4,a5
     7e6:	02500793          	li	a5,37
     7ea:	00f71763          	bne	a4,a5,7f8 <vprintf+0x54>
        state = '%';
     7ee:	02500793          	li	a5,37
     7f2:	fef42023          	sw	a5,-32(s0)
     7f6:	a2f5                	j	9e2 <vprintf+0x23e>
      } else {
        putc(fd, c);
     7f8:	fdc42783          	lw	a5,-36(s0)
     7fc:	0ff7f713          	andi	a4,a5,255
     800:	fcc42783          	lw	a5,-52(s0)
     804:	85ba                	mv	a1,a4
     806:	853e                	mv	a0,a5
     808:	00000097          	auipc	ra,0x0
     80c:	dcc080e7          	jalr	-564(ra) # 5d4 <putc>
     810:	aac9                	j	9e2 <vprintf+0x23e>
      }
    } else if(state == '%'){
     812:	fe042783          	lw	a5,-32(s0)
     816:	0007871b          	sext.w	a4,a5
     81a:	02500793          	li	a5,37
     81e:	1cf71263          	bne	a4,a5,9e2 <vprintf+0x23e>
      if(c == 'd'){
     822:	fdc42783          	lw	a5,-36(s0)
     826:	0007871b          	sext.w	a4,a5
     82a:	06400793          	li	a5,100
     82e:	02f71463          	bne	a4,a5,856 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     832:	fb843783          	ld	a5,-72(s0)
     836:	00878713          	addi	a4,a5,8
     83a:	fae43c23          	sd	a4,-72(s0)
     83e:	4398                	lw	a4,0(a5)
     840:	fcc42783          	lw	a5,-52(s0)
     844:	4685                	li	a3,1
     846:	4629                	li	a2,10
     848:	85ba                	mv	a1,a4
     84a:	853e                	mv	a0,a5
     84c:	00000097          	auipc	ra,0x0
     850:	dbe080e7          	jalr	-578(ra) # 60a <printint>
     854:	a269                	j	9de <vprintf+0x23a>
      } else if(c == 'l') {
     856:	fdc42783          	lw	a5,-36(s0)
     85a:	0007871b          	sext.w	a4,a5
     85e:	06c00793          	li	a5,108
     862:	02f71663          	bne	a4,a5,88e <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     866:	fb843783          	ld	a5,-72(s0)
     86a:	00878713          	addi	a4,a5,8
     86e:	fae43c23          	sd	a4,-72(s0)
     872:	639c                	ld	a5,0(a5)
     874:	0007871b          	sext.w	a4,a5
     878:	fcc42783          	lw	a5,-52(s0)
     87c:	4681                	li	a3,0
     87e:	4629                	li	a2,10
     880:	85ba                	mv	a1,a4
     882:	853e                	mv	a0,a5
     884:	00000097          	auipc	ra,0x0
     888:	d86080e7          	jalr	-634(ra) # 60a <printint>
     88c:	aa89                	j	9de <vprintf+0x23a>
      } else if(c == 'x') {
     88e:	fdc42783          	lw	a5,-36(s0)
     892:	0007871b          	sext.w	a4,a5
     896:	07800793          	li	a5,120
     89a:	02f71463          	bne	a4,a5,8c2 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     89e:	fb843783          	ld	a5,-72(s0)
     8a2:	00878713          	addi	a4,a5,8
     8a6:	fae43c23          	sd	a4,-72(s0)
     8aa:	4398                	lw	a4,0(a5)
     8ac:	fcc42783          	lw	a5,-52(s0)
     8b0:	4681                	li	a3,0
     8b2:	4641                	li	a2,16
     8b4:	85ba                	mv	a1,a4
     8b6:	853e                	mv	a0,a5
     8b8:	00000097          	auipc	ra,0x0
     8bc:	d52080e7          	jalr	-686(ra) # 60a <printint>
     8c0:	aa39                	j	9de <vprintf+0x23a>
      } else if(c == 'p') {
     8c2:	fdc42783          	lw	a5,-36(s0)
     8c6:	0007871b          	sext.w	a4,a5
     8ca:	07000793          	li	a5,112
     8ce:	02f71263          	bne	a4,a5,8f2 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8d2:	fb843783          	ld	a5,-72(s0)
     8d6:	00878713          	addi	a4,a5,8
     8da:	fae43c23          	sd	a4,-72(s0)
     8de:	6398                	ld	a4,0(a5)
     8e0:	fcc42783          	lw	a5,-52(s0)
     8e4:	85ba                	mv	a1,a4
     8e6:	853e                	mv	a0,a5
     8e8:	00000097          	auipc	ra,0x0
     8ec:	e30080e7          	jalr	-464(ra) # 718 <printptr>
     8f0:	a0fd                	j	9de <vprintf+0x23a>
      } else if(c == 's'){
     8f2:	fdc42783          	lw	a5,-36(s0)
     8f6:	0007871b          	sext.w	a4,a5
     8fa:	07300793          	li	a5,115
     8fe:	04f71c63          	bne	a4,a5,956 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     902:	fb843783          	ld	a5,-72(s0)
     906:	00878713          	addi	a4,a5,8
     90a:	fae43c23          	sd	a4,-72(s0)
     90e:	639c                	ld	a5,0(a5)
     910:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     914:	fe843783          	ld	a5,-24(s0)
     918:	eb8d                	bnez	a5,94a <vprintf+0x1a6>
          s = "(null)";
     91a:	00001797          	auipc	a5,0x1
     91e:	f6e78793          	addi	a5,a5,-146 # 1888 <schedule_dm+0x2a0>
     922:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     926:	a015                	j	94a <vprintf+0x1a6>
          putc(fd, *s);
     928:	fe843783          	ld	a5,-24(s0)
     92c:	0007c703          	lbu	a4,0(a5)
     930:	fcc42783          	lw	a5,-52(s0)
     934:	85ba                	mv	a1,a4
     936:	853e                	mv	a0,a5
     938:	00000097          	auipc	ra,0x0
     93c:	c9c080e7          	jalr	-868(ra) # 5d4 <putc>
          s++;
     940:	fe843783          	ld	a5,-24(s0)
     944:	0785                	addi	a5,a5,1
     946:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     94a:	fe843783          	ld	a5,-24(s0)
     94e:	0007c783          	lbu	a5,0(a5)
     952:	fbf9                	bnez	a5,928 <vprintf+0x184>
     954:	a069                	j	9de <vprintf+0x23a>
        }
      } else if(c == 'c'){
     956:	fdc42783          	lw	a5,-36(s0)
     95a:	0007871b          	sext.w	a4,a5
     95e:	06300793          	li	a5,99
     962:	02f71463          	bne	a4,a5,98a <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     966:	fb843783          	ld	a5,-72(s0)
     96a:	00878713          	addi	a4,a5,8
     96e:	fae43c23          	sd	a4,-72(s0)
     972:	439c                	lw	a5,0(a5)
     974:	0ff7f713          	andi	a4,a5,255
     978:	fcc42783          	lw	a5,-52(s0)
     97c:	85ba                	mv	a1,a4
     97e:	853e                	mv	a0,a5
     980:	00000097          	auipc	ra,0x0
     984:	c54080e7          	jalr	-940(ra) # 5d4 <putc>
     988:	a899                	j	9de <vprintf+0x23a>
      } else if(c == '%'){
     98a:	fdc42783          	lw	a5,-36(s0)
     98e:	0007871b          	sext.w	a4,a5
     992:	02500793          	li	a5,37
     996:	00f71f63          	bne	a4,a5,9b4 <vprintf+0x210>
        putc(fd, c);
     99a:	fdc42783          	lw	a5,-36(s0)
     99e:	0ff7f713          	andi	a4,a5,255
     9a2:	fcc42783          	lw	a5,-52(s0)
     9a6:	85ba                	mv	a1,a4
     9a8:	853e                	mv	a0,a5
     9aa:	00000097          	auipc	ra,0x0
     9ae:	c2a080e7          	jalr	-982(ra) # 5d4 <putc>
     9b2:	a035                	j	9de <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9b4:	fcc42783          	lw	a5,-52(s0)
     9b8:	02500593          	li	a1,37
     9bc:	853e                	mv	a0,a5
     9be:	00000097          	auipc	ra,0x0
     9c2:	c16080e7          	jalr	-1002(ra) # 5d4 <putc>
        putc(fd, c);
     9c6:	fdc42783          	lw	a5,-36(s0)
     9ca:	0ff7f713          	andi	a4,a5,255
     9ce:	fcc42783          	lw	a5,-52(s0)
     9d2:	85ba                	mv	a1,a4
     9d4:	853e                	mv	a0,a5
     9d6:	00000097          	auipc	ra,0x0
     9da:	bfe080e7          	jalr	-1026(ra) # 5d4 <putc>
      }
      state = 0;
     9de:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     9e2:	fe442783          	lw	a5,-28(s0)
     9e6:	2785                	addiw	a5,a5,1
     9e8:	fef42223          	sw	a5,-28(s0)
     9ec:	fe442783          	lw	a5,-28(s0)
     9f0:	fc043703          	ld	a4,-64(s0)
     9f4:	97ba                	add	a5,a5,a4
     9f6:	0007c783          	lbu	a5,0(a5)
     9fa:	dc0795e3          	bnez	a5,7c4 <vprintf+0x20>
    }
  }
}
     9fe:	0001                	nop
     a00:	0001                	nop
     a02:	60a6                	ld	ra,72(sp)
     a04:	6406                	ld	s0,64(sp)
     a06:	6161                	addi	sp,sp,80
     a08:	8082                	ret

0000000000000a0a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a0a:	7159                	addi	sp,sp,-112
     a0c:	fc06                	sd	ra,56(sp)
     a0e:	f822                	sd	s0,48(sp)
     a10:	0080                	addi	s0,sp,64
     a12:	fcb43823          	sd	a1,-48(s0)
     a16:	e010                	sd	a2,0(s0)
     a18:	e414                	sd	a3,8(s0)
     a1a:	e818                	sd	a4,16(s0)
     a1c:	ec1c                	sd	a5,24(s0)
     a1e:	03043023          	sd	a6,32(s0)
     a22:	03143423          	sd	a7,40(s0)
     a26:	87aa                	mv	a5,a0
     a28:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a2c:	03040793          	addi	a5,s0,48
     a30:	fcf43423          	sd	a5,-56(s0)
     a34:	fc843783          	ld	a5,-56(s0)
     a38:	fd078793          	addi	a5,a5,-48
     a3c:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a40:	fe843703          	ld	a4,-24(s0)
     a44:	fdc42783          	lw	a5,-36(s0)
     a48:	863a                	mv	a2,a4
     a4a:	fd043583          	ld	a1,-48(s0)
     a4e:	853e                	mv	a0,a5
     a50:	00000097          	auipc	ra,0x0
     a54:	d54080e7          	jalr	-684(ra) # 7a4 <vprintf>
}
     a58:	0001                	nop
     a5a:	70e2                	ld	ra,56(sp)
     a5c:	7442                	ld	s0,48(sp)
     a5e:	6165                	addi	sp,sp,112
     a60:	8082                	ret

0000000000000a62 <printf>:

void
printf(const char *fmt, ...)
{
     a62:	7159                	addi	sp,sp,-112
     a64:	f406                	sd	ra,40(sp)
     a66:	f022                	sd	s0,32(sp)
     a68:	1800                	addi	s0,sp,48
     a6a:	fca43c23          	sd	a0,-40(s0)
     a6e:	e40c                	sd	a1,8(s0)
     a70:	e810                	sd	a2,16(s0)
     a72:	ec14                	sd	a3,24(s0)
     a74:	f018                	sd	a4,32(s0)
     a76:	f41c                	sd	a5,40(s0)
     a78:	03043823          	sd	a6,48(s0)
     a7c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a80:	04040793          	addi	a5,s0,64
     a84:	fcf43823          	sd	a5,-48(s0)
     a88:	fd043783          	ld	a5,-48(s0)
     a8c:	fc878793          	addi	a5,a5,-56
     a90:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     a94:	fe843783          	ld	a5,-24(s0)
     a98:	863e                	mv	a2,a5
     a9a:	fd843583          	ld	a1,-40(s0)
     a9e:	4505                	li	a0,1
     aa0:	00000097          	auipc	ra,0x0
     aa4:	d04080e7          	jalr	-764(ra) # 7a4 <vprintf>
}
     aa8:	0001                	nop
     aaa:	70a2                	ld	ra,40(sp)
     aac:	7402                	ld	s0,32(sp)
     aae:	6165                	addi	sp,sp,112
     ab0:	8082                	ret

0000000000000ab2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ab2:	7179                	addi	sp,sp,-48
     ab4:	f422                	sd	s0,40(sp)
     ab6:	1800                	addi	s0,sp,48
     ab8:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     abc:	fd843783          	ld	a5,-40(s0)
     ac0:	17c1                	addi	a5,a5,-16
     ac2:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ac6:	00001797          	auipc	a5,0x1
     aca:	df278793          	addi	a5,a5,-526 # 18b8 <freep>
     ace:	639c                	ld	a5,0(a5)
     ad0:	fef43423          	sd	a5,-24(s0)
     ad4:	a815                	j	b08 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ad6:	fe843783          	ld	a5,-24(s0)
     ada:	639c                	ld	a5,0(a5)
     adc:	fe843703          	ld	a4,-24(s0)
     ae0:	00f76f63          	bltu	a4,a5,afe <free+0x4c>
     ae4:	fe043703          	ld	a4,-32(s0)
     ae8:	fe843783          	ld	a5,-24(s0)
     aec:	02e7eb63          	bltu	a5,a4,b22 <free+0x70>
     af0:	fe843783          	ld	a5,-24(s0)
     af4:	639c                	ld	a5,0(a5)
     af6:	fe043703          	ld	a4,-32(s0)
     afa:	02f76463          	bltu	a4,a5,b22 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     afe:	fe843783          	ld	a5,-24(s0)
     b02:	639c                	ld	a5,0(a5)
     b04:	fef43423          	sd	a5,-24(s0)
     b08:	fe043703          	ld	a4,-32(s0)
     b0c:	fe843783          	ld	a5,-24(s0)
     b10:	fce7f3e3          	bgeu	a5,a4,ad6 <free+0x24>
     b14:	fe843783          	ld	a5,-24(s0)
     b18:	639c                	ld	a5,0(a5)
     b1a:	fe043703          	ld	a4,-32(s0)
     b1e:	faf77ce3          	bgeu	a4,a5,ad6 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b22:	fe043783          	ld	a5,-32(s0)
     b26:	479c                	lw	a5,8(a5)
     b28:	1782                	slli	a5,a5,0x20
     b2a:	9381                	srli	a5,a5,0x20
     b2c:	0792                	slli	a5,a5,0x4
     b2e:	fe043703          	ld	a4,-32(s0)
     b32:	973e                	add	a4,a4,a5
     b34:	fe843783          	ld	a5,-24(s0)
     b38:	639c                	ld	a5,0(a5)
     b3a:	02f71763          	bne	a4,a5,b68 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b3e:	fe043783          	ld	a5,-32(s0)
     b42:	4798                	lw	a4,8(a5)
     b44:	fe843783          	ld	a5,-24(s0)
     b48:	639c                	ld	a5,0(a5)
     b4a:	479c                	lw	a5,8(a5)
     b4c:	9fb9                	addw	a5,a5,a4
     b4e:	0007871b          	sext.w	a4,a5
     b52:	fe043783          	ld	a5,-32(s0)
     b56:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b58:	fe843783          	ld	a5,-24(s0)
     b5c:	639c                	ld	a5,0(a5)
     b5e:	6398                	ld	a4,0(a5)
     b60:	fe043783          	ld	a5,-32(s0)
     b64:	e398                	sd	a4,0(a5)
     b66:	a039                	j	b74 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b68:	fe843783          	ld	a5,-24(s0)
     b6c:	6398                	ld	a4,0(a5)
     b6e:	fe043783          	ld	a5,-32(s0)
     b72:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b74:	fe843783          	ld	a5,-24(s0)
     b78:	479c                	lw	a5,8(a5)
     b7a:	1782                	slli	a5,a5,0x20
     b7c:	9381                	srli	a5,a5,0x20
     b7e:	0792                	slli	a5,a5,0x4
     b80:	fe843703          	ld	a4,-24(s0)
     b84:	97ba                	add	a5,a5,a4
     b86:	fe043703          	ld	a4,-32(s0)
     b8a:	02f71563          	bne	a4,a5,bb4 <free+0x102>
    p->s.size += bp->s.size;
     b8e:	fe843783          	ld	a5,-24(s0)
     b92:	4798                	lw	a4,8(a5)
     b94:	fe043783          	ld	a5,-32(s0)
     b98:	479c                	lw	a5,8(a5)
     b9a:	9fb9                	addw	a5,a5,a4
     b9c:	0007871b          	sext.w	a4,a5
     ba0:	fe843783          	ld	a5,-24(s0)
     ba4:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     ba6:	fe043783          	ld	a5,-32(s0)
     baa:	6398                	ld	a4,0(a5)
     bac:	fe843783          	ld	a5,-24(s0)
     bb0:	e398                	sd	a4,0(a5)
     bb2:	a031                	j	bbe <free+0x10c>
  } else
    p->s.ptr = bp;
     bb4:	fe843783          	ld	a5,-24(s0)
     bb8:	fe043703          	ld	a4,-32(s0)
     bbc:	e398                	sd	a4,0(a5)
  freep = p;
     bbe:	00001797          	auipc	a5,0x1
     bc2:	cfa78793          	addi	a5,a5,-774 # 18b8 <freep>
     bc6:	fe843703          	ld	a4,-24(s0)
     bca:	e398                	sd	a4,0(a5)
}
     bcc:	0001                	nop
     bce:	7422                	ld	s0,40(sp)
     bd0:	6145                	addi	sp,sp,48
     bd2:	8082                	ret

0000000000000bd4 <morecore>:

static Header*
morecore(uint nu)
{
     bd4:	7179                	addi	sp,sp,-48
     bd6:	f406                	sd	ra,40(sp)
     bd8:	f022                	sd	s0,32(sp)
     bda:	1800                	addi	s0,sp,48
     bdc:	87aa                	mv	a5,a0
     bde:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     be2:	fdc42783          	lw	a5,-36(s0)
     be6:	0007871b          	sext.w	a4,a5
     bea:	6785                	lui	a5,0x1
     bec:	00f77563          	bgeu	a4,a5,bf6 <morecore+0x22>
    nu = 4096;
     bf0:	6785                	lui	a5,0x1
     bf2:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     bf6:	fdc42783          	lw	a5,-36(s0)
     bfa:	0047979b          	slliw	a5,a5,0x4
     bfe:	2781                	sext.w	a5,a5
     c00:	2781                	sext.w	a5,a5
     c02:	853e                	mv	a0,a5
     c04:	00000097          	auipc	ra,0x0
     c08:	9a0080e7          	jalr	-1632(ra) # 5a4 <sbrk>
     c0c:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c10:	fe843703          	ld	a4,-24(s0)
     c14:	57fd                	li	a5,-1
     c16:	00f71463          	bne	a4,a5,c1e <morecore+0x4a>
    return 0;
     c1a:	4781                	li	a5,0
     c1c:	a03d                	j	c4a <morecore+0x76>
  hp = (Header*)p;
     c1e:	fe843783          	ld	a5,-24(s0)
     c22:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c26:	fe043783          	ld	a5,-32(s0)
     c2a:	fdc42703          	lw	a4,-36(s0)
     c2e:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c30:	fe043783          	ld	a5,-32(s0)
     c34:	07c1                	addi	a5,a5,16
     c36:	853e                	mv	a0,a5
     c38:	00000097          	auipc	ra,0x0
     c3c:	e7a080e7          	jalr	-390(ra) # ab2 <free>
  return freep;
     c40:	00001797          	auipc	a5,0x1
     c44:	c7878793          	addi	a5,a5,-904 # 18b8 <freep>
     c48:	639c                	ld	a5,0(a5)
}
     c4a:	853e                	mv	a0,a5
     c4c:	70a2                	ld	ra,40(sp)
     c4e:	7402                	ld	s0,32(sp)
     c50:	6145                	addi	sp,sp,48
     c52:	8082                	ret

0000000000000c54 <malloc>:

void*
malloc(uint nbytes)
{
     c54:	7139                	addi	sp,sp,-64
     c56:	fc06                	sd	ra,56(sp)
     c58:	f822                	sd	s0,48(sp)
     c5a:	0080                	addi	s0,sp,64
     c5c:	87aa                	mv	a5,a0
     c5e:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c62:	fcc46783          	lwu	a5,-52(s0)
     c66:	07bd                	addi	a5,a5,15
     c68:	8391                	srli	a5,a5,0x4
     c6a:	2781                	sext.w	a5,a5
     c6c:	2785                	addiw	a5,a5,1
     c6e:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c72:	00001797          	auipc	a5,0x1
     c76:	c4678793          	addi	a5,a5,-954 # 18b8 <freep>
     c7a:	639c                	ld	a5,0(a5)
     c7c:	fef43023          	sd	a5,-32(s0)
     c80:	fe043783          	ld	a5,-32(s0)
     c84:	ef95                	bnez	a5,cc0 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     c86:	00001797          	auipc	a5,0x1
     c8a:	c2278793          	addi	a5,a5,-990 # 18a8 <base>
     c8e:	fef43023          	sd	a5,-32(s0)
     c92:	00001797          	auipc	a5,0x1
     c96:	c2678793          	addi	a5,a5,-986 # 18b8 <freep>
     c9a:	fe043703          	ld	a4,-32(s0)
     c9e:	e398                	sd	a4,0(a5)
     ca0:	00001797          	auipc	a5,0x1
     ca4:	c1878793          	addi	a5,a5,-1000 # 18b8 <freep>
     ca8:	6398                	ld	a4,0(a5)
     caa:	00001797          	auipc	a5,0x1
     cae:	bfe78793          	addi	a5,a5,-1026 # 18a8 <base>
     cb2:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     cb4:	00001797          	auipc	a5,0x1
     cb8:	bf478793          	addi	a5,a5,-1036 # 18a8 <base>
     cbc:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     cc0:	fe043783          	ld	a5,-32(s0)
     cc4:	639c                	ld	a5,0(a5)
     cc6:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     cca:	fe843783          	ld	a5,-24(s0)
     cce:	4798                	lw	a4,8(a5)
     cd0:	fdc42783          	lw	a5,-36(s0)
     cd4:	2781                	sext.w	a5,a5
     cd6:	06f76863          	bltu	a4,a5,d46 <malloc+0xf2>
      if(p->s.size == nunits)
     cda:	fe843783          	ld	a5,-24(s0)
     cde:	4798                	lw	a4,8(a5)
     ce0:	fdc42783          	lw	a5,-36(s0)
     ce4:	2781                	sext.w	a5,a5
     ce6:	00e79963          	bne	a5,a4,cf8 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     cea:	fe843783          	ld	a5,-24(s0)
     cee:	6398                	ld	a4,0(a5)
     cf0:	fe043783          	ld	a5,-32(s0)
     cf4:	e398                	sd	a4,0(a5)
     cf6:	a82d                	j	d30 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     cf8:	fe843783          	ld	a5,-24(s0)
     cfc:	4798                	lw	a4,8(a5)
     cfe:	fdc42783          	lw	a5,-36(s0)
     d02:	40f707bb          	subw	a5,a4,a5
     d06:	0007871b          	sext.w	a4,a5
     d0a:	fe843783          	ld	a5,-24(s0)
     d0e:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d10:	fe843783          	ld	a5,-24(s0)
     d14:	479c                	lw	a5,8(a5)
     d16:	1782                	slli	a5,a5,0x20
     d18:	9381                	srli	a5,a5,0x20
     d1a:	0792                	slli	a5,a5,0x4
     d1c:	fe843703          	ld	a4,-24(s0)
     d20:	97ba                	add	a5,a5,a4
     d22:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d26:	fe843783          	ld	a5,-24(s0)
     d2a:	fdc42703          	lw	a4,-36(s0)
     d2e:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d30:	00001797          	auipc	a5,0x1
     d34:	b8878793          	addi	a5,a5,-1144 # 18b8 <freep>
     d38:	fe043703          	ld	a4,-32(s0)
     d3c:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d3e:	fe843783          	ld	a5,-24(s0)
     d42:	07c1                	addi	a5,a5,16
     d44:	a091                	j	d88 <malloc+0x134>
    }
    if(p == freep)
     d46:	00001797          	auipc	a5,0x1
     d4a:	b7278793          	addi	a5,a5,-1166 # 18b8 <freep>
     d4e:	639c                	ld	a5,0(a5)
     d50:	fe843703          	ld	a4,-24(s0)
     d54:	02f71063          	bne	a4,a5,d74 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d58:	fdc42783          	lw	a5,-36(s0)
     d5c:	853e                	mv	a0,a5
     d5e:	00000097          	auipc	ra,0x0
     d62:	e76080e7          	jalr	-394(ra) # bd4 <morecore>
     d66:	fea43423          	sd	a0,-24(s0)
     d6a:	fe843783          	ld	a5,-24(s0)
     d6e:	e399                	bnez	a5,d74 <malloc+0x120>
        return 0;
     d70:	4781                	li	a5,0
     d72:	a819                	j	d88 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d74:	fe843783          	ld	a5,-24(s0)
     d78:	fef43023          	sd	a5,-32(s0)
     d7c:	fe843783          	ld	a5,-24(s0)
     d80:	639c                	ld	a5,0(a5)
     d82:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d86:	b791                	j	cca <malloc+0x76>
  }
}
     d88:	853e                	mv	a0,a5
     d8a:	70e2                	ld	ra,56(sp)
     d8c:	7442                	ld	s0,48(sp)
     d8e:	6121                	addi	sp,sp,64
     d90:	8082                	ret

0000000000000d92 <setjmp>:
     d92:	e100                	sd	s0,0(a0)
     d94:	e504                	sd	s1,8(a0)
     d96:	01253823          	sd	s2,16(a0)
     d9a:	01353c23          	sd	s3,24(a0)
     d9e:	03453023          	sd	s4,32(a0)
     da2:	03553423          	sd	s5,40(a0)
     da6:	03653823          	sd	s6,48(a0)
     daa:	03753c23          	sd	s7,56(a0)
     dae:	05853023          	sd	s8,64(a0)
     db2:	05953423          	sd	s9,72(a0)
     db6:	05a53823          	sd	s10,80(a0)
     dba:	05b53c23          	sd	s11,88(a0)
     dbe:	06153023          	sd	ra,96(a0)
     dc2:	06253423          	sd	sp,104(a0)
     dc6:	4501                	li	a0,0
     dc8:	8082                	ret

0000000000000dca <longjmp>:
     dca:	6100                	ld	s0,0(a0)
     dcc:	6504                	ld	s1,8(a0)
     dce:	01053903          	ld	s2,16(a0)
     dd2:	01853983          	ld	s3,24(a0)
     dd6:	02053a03          	ld	s4,32(a0)
     dda:	02853a83          	ld	s5,40(a0)
     dde:	03053b03          	ld	s6,48(a0)
     de2:	03853b83          	ld	s7,56(a0)
     de6:	04053c03          	ld	s8,64(a0)
     dea:	04853c83          	ld	s9,72(a0)
     dee:	05053d03          	ld	s10,80(a0)
     df2:	05853d83          	ld	s11,88(a0)
     df6:	06053083          	ld	ra,96(a0)
     dfa:	06853103          	ld	sp,104(a0)
     dfe:	c199                	beqz	a1,e04 <longjmp_1>
     e00:	852e                	mv	a0,a1
     e02:	8082                	ret

0000000000000e04 <longjmp_1>:
     e04:	4505                	li	a0,1
     e06:	8082                	ret

0000000000000e08 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     e08:	1101                	addi	sp,sp,-32
     e0a:	ec22                	sd	s0,24(sp)
     e0c:	1000                	addi	s0,sp,32
     e0e:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     e12:	fe843783          	ld	a5,-24(s0)
     e16:	639c                	ld	a5,0(a5)
     e18:	fe843703          	ld	a4,-24(s0)
     e1c:	40f707b3          	sub	a5,a4,a5
     e20:	0017b793          	seqz	a5,a5
     e24:	0ff7f793          	andi	a5,a5,255
     e28:	2781                	sext.w	a5,a5
}
     e2a:	853e                	mv	a0,a5
     e2c:	6462                	ld	s0,24(sp)
     e2e:	6105                	addi	sp,sp,32
     e30:	8082                	ret

0000000000000e32 <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
     e32:	715d                	addi	sp,sp,-80
     e34:	e4a2                	sd	s0,72(sp)
     e36:	e0a6                	sd	s1,64(sp)
     e38:	0880                	addi	s0,sp,80
     e3a:	84aa                	mv	s1,a0
    int sleep_time = -1;
     e3c:	57fd                	li	a5,-1
     e3e:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
     e42:	689c                	ld	a5,16(s1)
     e44:	639c                	ld	a5,0(a5)
     e46:	fcf43c23          	sd	a5,-40(s0)
     e4a:	fd843783          	ld	a5,-40(s0)
     e4e:	17e1                	addi	a5,a5,-8
     e50:	fef43023          	sd	a5,-32(s0)
     e54:	a0a9                	j	e9e <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
     e56:	fec42783          	lw	a5,-20(s0)
     e5a:	2781                	sext.w	a5,a5
     e5c:	0007cf63          	bltz	a5,e7a <fill_sparse+0x48>
     e60:	fe043783          	ld	a5,-32(s0)
     e64:	4f98                	lw	a4,24(a5)
     e66:	409c                	lw	a5,0(s1)
     e68:	40f707bb          	subw	a5,a4,a5
     e6c:	0007871b          	sext.w	a4,a5
     e70:	fec42783          	lw	a5,-20(s0)
     e74:	2781                	sext.w	a5,a5
     e76:	00f75a63          	bge	a4,a5,e8a <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
     e7a:	fe043783          	ld	a5,-32(s0)
     e7e:	4f98                	lw	a4,24(a5)
     e80:	409c                	lw	a5,0(s1)
     e82:	40f707bb          	subw	a5,a4,a5
     e86:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
     e8a:	fe043783          	ld	a5,-32(s0)
     e8e:	679c                	ld	a5,8(a5)
     e90:	fcf43823          	sd	a5,-48(s0)
     e94:	fd043783          	ld	a5,-48(s0)
     e98:	17e1                	addi	a5,a5,-8
     e9a:	fef43023          	sd	a5,-32(s0)
     e9e:	fe043783          	ld	a5,-32(s0)
     ea2:	00878713          	addi	a4,a5,8
     ea6:	689c                	ld	a5,16(s1)
     ea8:	faf717e3          	bne	a4,a5,e56 <fill_sparse+0x24>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = args.run_queue;
     eac:	649c                	ld	a5,8(s1)
     eae:	faf43823          	sd	a5,-80(s0)
    r.allocated_time = sleep_time;
     eb2:	fec42783          	lw	a5,-20(s0)
     eb6:	faf42c23          	sw	a5,-72(s0)
    return r;    
     eba:	fb043783          	ld	a5,-80(s0)
     ebe:	fcf43023          	sd	a5,-64(s0)
     ec2:	fb843783          	ld	a5,-72(s0)
     ec6:	fcf43423          	sd	a5,-56(s0)
     eca:	4701                	li	a4,0
     ecc:	fc043703          	ld	a4,-64(s0)
     ed0:	4781                	li	a5,0
     ed2:	fc843783          	ld	a5,-56(s0)
     ed6:	863a                	mv	a2,a4
     ed8:	86be                	mv	a3,a5
     eda:	8732                	mv	a4,a2
     edc:	87b6                	mv	a5,a3
}
     ede:	853a                	mv	a0,a4
     ee0:	85be                	mv	a1,a5
     ee2:	6426                	ld	s0,72(sp)
     ee4:	6486                	ld	s1,64(sp)
     ee6:	6161                	addi	sp,sp,80
     ee8:	8082                	ret

0000000000000eea <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
     eea:	715d                	addi	sp,sp,-80
     eec:	e4a2                	sd	s0,72(sp)
     eee:	e0a6                	sd	s1,64(sp)
     ef0:	0880                	addi	s0,sp,80
     ef2:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
     ef4:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
     ef8:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     efc:	649c                	ld	a5,8(s1)
     efe:	639c                	ld	a5,0(a5)
     f00:	fcf43c23          	sd	a5,-40(s0)
     f04:	fd843783          	ld	a5,-40(s0)
     f08:	fd878793          	addi	a5,a5,-40
     f0c:	fef43023          	sd	a5,-32(s0)
     f10:	a81d                	j	f46 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
     f12:	fe843783          	ld	a5,-24(s0)
     f16:	cb89                	beqz	a5,f28 <schedule_default+0x3e>
     f18:	fe043783          	ld	a5,-32(s0)
     f1c:	5fd8                	lw	a4,60(a5)
     f1e:	fe843783          	ld	a5,-24(s0)
     f22:	5fdc                	lw	a5,60(a5)
     f24:	00f75663          	bge	a4,a5,f30 <schedule_default+0x46>
            thread_with_smallest_id = th;
     f28:	fe043783          	ld	a5,-32(s0)
     f2c:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     f30:	fe043783          	ld	a5,-32(s0)
     f34:	779c                	ld	a5,40(a5)
     f36:	fcf43823          	sd	a5,-48(s0)
     f3a:	fd043783          	ld	a5,-48(s0)
     f3e:	fd878793          	addi	a5,a5,-40
     f42:	fef43023          	sd	a5,-32(s0)
     f46:	fe043783          	ld	a5,-32(s0)
     f4a:	02878713          	addi	a4,a5,40
     f4e:	649c                	ld	a5,8(s1)
     f50:	fcf711e3          	bne	a4,a5,f12 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
     f54:	fe843783          	ld	a5,-24(s0)
     f58:	cf89                	beqz	a5,f72 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
     f5a:	fe843783          	ld	a5,-24(s0)
     f5e:	02878793          	addi	a5,a5,40
     f62:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
     f66:	fe843783          	ld	a5,-24(s0)
     f6a:	4fbc                	lw	a5,88(a5)
     f6c:	faf42c23          	sw	a5,-72(s0)
     f70:	a039                	j	f7e <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
     f72:	649c                	ld	a5,8(s1)
     f74:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
     f78:	4785                	li	a5,1
     f7a:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
     f7e:	fb043783          	ld	a5,-80(s0)
     f82:	fcf43023          	sd	a5,-64(s0)
     f86:	fb843783          	ld	a5,-72(s0)
     f8a:	fcf43423          	sd	a5,-56(s0)
     f8e:	4701                	li	a4,0
     f90:	fc043703          	ld	a4,-64(s0)
     f94:	4781                	li	a5,0
     f96:	fc843783          	ld	a5,-56(s0)
     f9a:	863a                	mv	a2,a4
     f9c:	86be                	mv	a3,a5
     f9e:	8732                	mv	a4,a2
     fa0:	87b6                	mv	a5,a3
}
     fa2:	853a                	mv	a0,a4
     fa4:	85be                	mv	a1,a5
     fa6:	6426                	ld	s0,72(sp)
     fa8:	6486                	ld	s1,64(sp)
     faa:	6161                	addi	sp,sp,80
     fac:	8082                	ret

0000000000000fae <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
     fae:	7135                	addi	sp,sp,-160
     fb0:	ed06                	sd	ra,152(sp)
     fb2:	e922                	sd	s0,144(sp)
     fb4:	e526                	sd	s1,136(sp)
     fb6:	e14a                	sd	s2,128(sp)
     fb8:	fcce                	sd	s3,120(sp)
     fba:	1100                	addi	s0,sp,160
     fbc:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
     fbe:	649c                	ld	a5,8(s1)
     fc0:	853e                	mv	a0,a5
     fc2:	00000097          	auipc	ra,0x0
     fc6:	e46080e7          	jalr	-442(ra) # e08 <list_empty>
     fca:	87aa                	mv	a5,a0
     fcc:	cb85                	beqz	a5,ffc <schedule_wrr+0x4e>
        return fill_sparse(args);
     fce:	609c                	ld	a5,0(s1)
     fd0:	f6f43023          	sd	a5,-160(s0)
     fd4:	649c                	ld	a5,8(s1)
     fd6:	f6f43423          	sd	a5,-152(s0)
     fda:	689c                	ld	a5,16(s1)
     fdc:	f6f43823          	sd	a5,-144(s0)
     fe0:	f6040793          	addi	a5,s0,-160
     fe4:	853e                	mv	a0,a5
     fe6:	00000097          	auipc	ra,0x0
     fea:	e4c080e7          	jalr	-436(ra) # e32 <fill_sparse>
     fee:	872a                	mv	a4,a0
     ff0:	87ae                	mv	a5,a1
     ff2:	f8e43823          	sd	a4,-112(s0)
     ff6:	f8f43c23          	sd	a5,-104(s0)
     ffa:	a0c9                	j	10bc <schedule_wrr+0x10e>

    struct thread *process_thread = NULL;
     ffc:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1000:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1004:	649c                	ld	a5,8(s1)
    1006:	639c                	ld	a5,0(a5)
    1008:	faf43823          	sd	a5,-80(s0)
    100c:	fb043783          	ld	a5,-80(s0)
    1010:	fd878793          	addi	a5,a5,-40
    1014:	fcf43023          	sd	a5,-64(s0)
    1018:	a025                	j	1040 <schedule_wrr+0x92>
        if (process_thread == NULL) {
    101a:	fc843783          	ld	a5,-56(s0)
    101e:	e791                	bnez	a5,102a <schedule_wrr+0x7c>
            process_thread = th;
    1020:	fc043783          	ld	a5,-64(s0)
    1024:	fcf43423          	sd	a5,-56(s0)
            break;
    1028:	a01d                	j	104e <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
    102a:	fc043783          	ld	a5,-64(s0)
    102e:	779c                	ld	a5,40(a5)
    1030:	faf43423          	sd	a5,-88(s0)
    1034:	fa843783          	ld	a5,-88(s0)
    1038:	fd878793          	addi	a5,a5,-40
    103c:	fcf43023          	sd	a5,-64(s0)
    1040:	fc043783          	ld	a5,-64(s0)
    1044:	02878713          	addi	a4,a5,40
    1048:	649c                	ld	a5,8(s1)
    104a:	fcf718e3          	bne	a4,a5,101a <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
    104e:	40dc                	lw	a5,4(s1)
    1050:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
    1054:	fc843783          	ld	a5,-56(s0)
    1058:	4fbc                	lw	a5,88(a5)
    105a:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    105e:	fc843783          	ld	a5,-56(s0)
    1062:	4fb4                	lw	a3,88(a5)
    1064:	fc843783          	ld	a5,-56(s0)
    1068:	47bc                	lw	a5,72(a5)
    106a:	fa442703          	lw	a4,-92(s0)
    106e:	02f707bb          	mulw	a5,a4,a5
    1072:	2781                	sext.w	a5,a5
    1074:	8736                	mv	a4,a3
    1076:	00e7dc63          	bge	a5,a4,108e <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
    107a:	fc843783          	ld	a5,-56(s0)
    107e:	47bc                	lw	a5,72(a5)
    1080:	fa442703          	lw	a4,-92(s0)
    1084:	02f707bb          	mulw	a5,a4,a5
    1088:	faf42e23          	sw	a5,-68(s0)
    108c:	a031                	j	1098 <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    108e:	fc843783          	ld	a5,-56(s0)
    1092:	4fbc                	lw	a5,88(a5)
    1094:	faf42e23          	sw	a5,-68(s0)
    }
    
    struct threads_sched_result r;
    r.scheduled_thread_list_member = &process_thread->thread_list;
    1098:	fc843783          	ld	a5,-56(s0)
    109c:	02878793          	addi	a5,a5,40
    10a0:	f8f43023          	sd	a5,-128(s0)
    r.allocated_time = executing_time;
    10a4:	fbc42783          	lw	a5,-68(s0)
    10a8:	f8f42423          	sw	a5,-120(s0)
    return r;
    10ac:	f8043783          	ld	a5,-128(s0)
    10b0:	f8f43823          	sd	a5,-112(s0)
    10b4:	f8843783          	ld	a5,-120(s0)
    10b8:	f8f43c23          	sd	a5,-104(s0)
    10bc:	4701                	li	a4,0
    10be:	f9043703          	ld	a4,-112(s0)
    10c2:	4781                	li	a5,0
    10c4:	f9843783          	ld	a5,-104(s0)
    10c8:	893a                	mv	s2,a4
    10ca:	89be                	mv	s3,a5
    10cc:	874a                	mv	a4,s2
    10ce:	87ce                	mv	a5,s3
}
    10d0:	853a                	mv	a0,a4
    10d2:	85be                	mv	a1,a5
    10d4:	60ea                	ld	ra,152(sp)
    10d6:	644a                	ld	s0,144(sp)
    10d8:	64aa                	ld	s1,136(sp)
    10da:	690a                	ld	s2,128(sp)
    10dc:	79e6                	ld	s3,120(sp)
    10de:	610d                	addi	sp,sp,160
    10e0:	8082                	ret

00000000000010e2 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    10e2:	7131                	addi	sp,sp,-192
    10e4:	fd06                	sd	ra,184(sp)
    10e6:	f922                	sd	s0,176(sp)
    10e8:	f526                	sd	s1,168(sp)
    10ea:	f14a                	sd	s2,160(sp)
    10ec:	ed4e                	sd	s3,152(sp)
    10ee:	0180                	addi	s0,sp,192
    10f0:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    10f2:	649c                	ld	a5,8(s1)
    10f4:	853e                	mv	a0,a5
    10f6:	00000097          	auipc	ra,0x0
    10fa:	d12080e7          	jalr	-750(ra) # e08 <list_empty>
    10fe:	87aa                	mv	a5,a0
    1100:	cb85                	beqz	a5,1130 <schedule_sjf+0x4e>
        return fill_sparse(args);
    1102:	609c                	ld	a5,0(s1)
    1104:	f4f43023          	sd	a5,-192(s0)
    1108:	649c                	ld	a5,8(s1)
    110a:	f4f43423          	sd	a5,-184(s0)
    110e:	689c                	ld	a5,16(s1)
    1110:	f4f43823          	sd	a5,-176(s0)
    1114:	f4040793          	addi	a5,s0,-192
    1118:	853e                	mv	a0,a5
    111a:	00000097          	auipc	ra,0x0
    111e:	d18080e7          	jalr	-744(ra) # e32 <fill_sparse>
    1122:	872a                	mv	a4,a0
    1124:	87ae                	mv	a5,a1
    1126:	f6e43c23          	sd	a4,-136(s0)
    112a:	f8f43023          	sd	a5,-128(s0)
    112e:	aa49                	j	12c0 <schedule_sjf+0x1de>

    int current_time = args.current_time;
    1130:	409c                	lw	a5,0(s1)
    1132:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    1136:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    113a:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    113e:	649c                	ld	a5,8(s1)
    1140:	639c                	ld	a5,0(a5)
    1142:	faf43423          	sd	a5,-88(s0)
    1146:	fa843783          	ld	a5,-88(s0)
    114a:	fd878793          	addi	a5,a5,-40
    114e:	fcf43023          	sd	a5,-64(s0)
    1152:	a085                	j	11b2 <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    1154:	fc843783          	ld	a5,-56(s0)
    1158:	cb89                	beqz	a5,116a <schedule_sjf+0x88>
    115a:	fc043783          	ld	a5,-64(s0)
    115e:	4fb8                	lw	a4,88(a5)
    1160:	fc843783          	ld	a5,-56(s0)
    1164:	4fbc                	lw	a5,88(a5)
    1166:	00f75763          	bge	a4,a5,1174 <schedule_sjf+0x92>
            shortest_thread = th;
    116a:	fc043783          	ld	a5,-64(s0)
    116e:	fcf43423          	sd	a5,-56(s0)
    1172:	a02d                	j	119c <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    1174:	fc043783          	ld	a5,-64(s0)
    1178:	4fb8                	lw	a4,88(a5)
    117a:	fc843783          	ld	a5,-56(s0)
    117e:	4fbc                	lw	a5,88(a5)
    1180:	00f71e63          	bne	a4,a5,119c <schedule_sjf+0xba>
    1184:	fc043783          	ld	a5,-64(s0)
    1188:	5fd8                	lw	a4,60(a5)
    118a:	fc843783          	ld	a5,-56(s0)
    118e:	5fdc                	lw	a5,60(a5)
    1190:	00f75663          	bge	a4,a5,119c <schedule_sjf+0xba>
            shortest_thread = th;
    1194:	fc043783          	ld	a5,-64(s0)
    1198:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    119c:	fc043783          	ld	a5,-64(s0)
    11a0:	779c                	ld	a5,40(a5)
    11a2:	f8f43423          	sd	a5,-120(s0)
    11a6:	f8843783          	ld	a5,-120(s0)
    11aa:	fd878793          	addi	a5,a5,-40
    11ae:	fcf43023          	sd	a5,-64(s0)
    11b2:	fc043783          	ld	a5,-64(s0)
    11b6:	02878713          	addi	a4,a5,40
    11ba:	649c                	ld	a5,8(s1)
    11bc:	f8f71ce3          	bne	a4,a5,1154 <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    11c0:	fc843783          	ld	a5,-56(s0)
    11c4:	4fbc                	lw	a5,88(a5)
    11c6:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    11ca:	689c                	ld	a5,16(s1)
    11cc:	639c                	ld	a5,0(a5)
    11ce:	faf43023          	sd	a5,-96(s0)
    11d2:	fa043783          	ld	a5,-96(s0)
    11d6:	17e1                	addi	a5,a5,-8
    11d8:	faf43c23          	sd	a5,-72(s0)
    11dc:	a84d                	j	128e <schedule_sjf+0x1ac>
        int interval = cur->release_time - current_time;
    11de:	fb843783          	ld	a5,-72(s0)
    11e2:	4f98                	lw	a4,24(a5)
    11e4:	fb042783          	lw	a5,-80(s0)
    11e8:	40f707bb          	subw	a5,a4,a5
    11ec:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    11f0:	f9c42703          	lw	a4,-100(s0)
    11f4:	fb442783          	lw	a5,-76(s0)
    11f8:	2701                	sext.w	a4,a4
    11fa:	2781                	sext.w	a5,a5
    11fc:	06e7c863          	blt	a5,a4,126c <schedule_sjf+0x18a>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1200:	fc843783          	ld	a5,-56(s0)
    1204:	4fbc                	lw	a5,88(a5)
    1206:	fb042703          	lw	a4,-80(s0)
    120a:	9fb9                	addw	a5,a5,a4
    120c:	0007871b          	sext.w	a4,a5
    1210:	fb843783          	ld	a5,-72(s0)
    1214:	4f9c                	lw	a5,24(a5)
    1216:	04f74d63          	blt	a4,a5,1270 <schedule_sjf+0x18e>
        int remaining_time = shortest_thread->remaining_time - interval;
    121a:	fc843783          	ld	a5,-56(s0)
    121e:	4fb8                	lw	a4,88(a5)
    1220:	f9c42783          	lw	a5,-100(s0)
    1224:	40f707bb          	subw	a5,a4,a5
    1228:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    122c:	fb843783          	ld	a5,-72(s0)
    1230:	639c                	ld	a5,0(a5)
    1232:	43f8                	lw	a4,68(a5)
    1234:	f9842783          	lw	a5,-104(s0)
    1238:	2781                	sext.w	a5,a5
    123a:	02e7cd63          	blt	a5,a4,1274 <schedule_sjf+0x192>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    123e:	fb843783          	ld	a5,-72(s0)
    1242:	639c                	ld	a5,0(a5)
    1244:	43f8                	lw	a4,68(a5)
    1246:	f9842783          	lw	a5,-104(s0)
    124a:	2781                	sext.w	a5,a5
    124c:	00e79b63          	bne	a5,a4,1262 <schedule_sjf+0x180>
    1250:	fc843783          	ld	a5,-56(s0)
    1254:	5fd8                	lw	a4,60(a5)
    1256:	fb843783          	ld	a5,-72(s0)
    125a:	639c                	ld	a5,0(a5)
    125c:	5fdc                	lw	a5,60(a5)
    125e:	00f74d63          	blt	a4,a5,1278 <schedule_sjf+0x196>
        executing_time = interval;
    1262:	f9c42783          	lw	a5,-100(s0)
    1266:	faf42a23          	sw	a5,-76(s0)
    126a:	a801                	j	127a <schedule_sjf+0x198>
        if (interval > executing_time) continue;
    126c:	0001                	nop
    126e:	a031                	j	127a <schedule_sjf+0x198>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1270:	0001                	nop
    1272:	a021                	j	127a <schedule_sjf+0x198>
        if (remaining_time < cur->thrd->processing_time) continue;
    1274:	0001                	nop
    1276:	a011                	j	127a <schedule_sjf+0x198>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    1278:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    127a:	fb843783          	ld	a5,-72(s0)
    127e:	679c                	ld	a5,8(a5)
    1280:	f8f43823          	sd	a5,-112(s0)
    1284:	f9043783          	ld	a5,-112(s0)
    1288:	17e1                	addi	a5,a5,-8
    128a:	faf43c23          	sd	a5,-72(s0)
    128e:	fb843783          	ld	a5,-72(s0)
    1292:	00878713          	addi	a4,a5,8
    1296:	689c                	ld	a5,16(s1)
    1298:	f4f713e3          	bne	a4,a5,11de <schedule_sjf+0xfc>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &shortest_thread->thread_list;
    129c:	fc843783          	ld	a5,-56(s0)
    12a0:	02878793          	addi	a5,a5,40
    12a4:	f6f43423          	sd	a5,-152(s0)
    r.allocated_time = executing_time;
    12a8:	fb442783          	lw	a5,-76(s0)
    12ac:	f6f42823          	sw	a5,-144(s0)
    return r;
    12b0:	f6843783          	ld	a5,-152(s0)
    12b4:	f6f43c23          	sd	a5,-136(s0)
    12b8:	f7043783          	ld	a5,-144(s0)
    12bc:	f8f43023          	sd	a5,-128(s0)
    12c0:	4701                	li	a4,0
    12c2:	f7843703          	ld	a4,-136(s0)
    12c6:	4781                	li	a5,0
    12c8:	f8043783          	ld	a5,-128(s0)
    12cc:	893a                	mv	s2,a4
    12ce:	89be                	mv	s3,a5
    12d0:	874a                	mv	a4,s2
    12d2:	87ce                	mv	a5,s3
}
    12d4:	853a                	mv	a0,a4
    12d6:	85be                	mv	a1,a5
    12d8:	70ea                	ld	ra,184(sp)
    12da:	744a                	ld	s0,176(sp)
    12dc:	74aa                	ld	s1,168(sp)
    12de:	790a                	ld	s2,160(sp)
    12e0:	69ea                	ld	s3,152(sp)
    12e2:	6129                	addi	sp,sp,192
    12e4:	8082                	ret

00000000000012e6 <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    12e6:	7115                	addi	sp,sp,-224
    12e8:	ed86                	sd	ra,216(sp)
    12ea:	e9a2                	sd	s0,208(sp)
    12ec:	e5a6                	sd	s1,200(sp)
    12ee:	e1ca                	sd	s2,192(sp)
    12f0:	fd4e                	sd	s3,184(sp)
    12f2:	1180                	addi	s0,sp,224
    12f4:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    12f6:	649c                	ld	a5,8(s1)
    12f8:	853e                	mv	a0,a5
    12fa:	00000097          	auipc	ra,0x0
    12fe:	b0e080e7          	jalr	-1266(ra) # e08 <list_empty>
    1302:	87aa                	mv	a5,a0
    1304:	cb85                	beqz	a5,1334 <schedule_lst+0x4e>
        return fill_sparse(args);
    1306:	609c                	ld	a5,0(s1)
    1308:	f2f43023          	sd	a5,-224(s0)
    130c:	649c                	ld	a5,8(s1)
    130e:	f2f43423          	sd	a5,-216(s0)
    1312:	689c                	ld	a5,16(s1)
    1314:	f2f43823          	sd	a5,-208(s0)
    1318:	f2040793          	addi	a5,s0,-224
    131c:	853e                	mv	a0,a5
    131e:	00000097          	auipc	ra,0x0
    1322:	b14080e7          	jalr	-1260(ra) # e32 <fill_sparse>
    1326:	872a                	mv	a4,a0
    1328:	87ae                	mv	a5,a1
    132a:	f6e43023          	sd	a4,-160(s0)
    132e:	f6f43423          	sd	a5,-152(s0)
    1332:	ac41                	j	15c2 <schedule_lst+0x2dc>

    int current_time = args.current_time;
    1334:	409c                	lw	a5,0(s1)
    1336:	faf42623          	sw	a5,-84(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    133a:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    133e:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1342:	649c                	ld	a5,8(s1)
    1344:	639c                	ld	a5,0(a5)
    1346:	faf43023          	sd	a5,-96(s0)
    134a:	fa043783          	ld	a5,-96(s0)
    134e:	fd878793          	addi	a5,a5,-40
    1352:	fcf43023          	sd	a5,-64(s0)
    1356:	a239                	j	1464 <schedule_lst+0x17e>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    1358:	fc043783          	ld	a5,-64(s0)
    135c:	4ff8                	lw	a4,92(a5)
    135e:	fac42783          	lw	a5,-84(s0)
    1362:	40f707bb          	subw	a5,a4,a5
    1366:	0007871b          	sext.w	a4,a5
    136a:	fc043783          	ld	a5,-64(s0)
    136e:	4fbc                	lw	a5,88(a5)
    1370:	40f707bb          	subw	a5,a4,a5
    1374:	f6f42e23          	sw	a5,-132(s0)
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    1378:	fc843783          	ld	a5,-56(s0)
    137c:	c38d                	beqz	a5,139e <schedule_lst+0xb8>
    137e:	fc843783          	ld	a5,-56(s0)
    1382:	4ff8                	lw	a4,92(a5)
    1384:	fac42783          	lw	a5,-84(s0)
    1388:	40f707bb          	subw	a5,a4,a5
    138c:	0007871b          	sext.w	a4,a5
    1390:	fc843783          	ld	a5,-56(s0)
    1394:	4fbc                	lw	a5,88(a5)
    1396:	40f707bb          	subw	a5,a4,a5
    139a:	2781                	sext.w	a5,a5
    139c:	a011                	j	13a0 <schedule_lst+0xba>
    139e:	4781                	li	a5,0
    13a0:	f6f42c23          	sw	a5,-136(s0)
        if (least_slack_thread == NULL) {
    13a4:	fc843783          	ld	a5,-56(s0)
    13a8:	e791                	bnez	a5,13b4 <schedule_lst+0xce>
            least_slack_thread = th;
    13aa:	fc043783          	ld	a5,-64(s0)
    13ae:	fcf43423          	sd	a5,-56(s0)
    13b2:	a871                	j	144e <schedule_lst+0x168>
        }
        else if (least_slack_thread->current_deadline <= current_time) { // missing the deadline
    13b4:	fc843783          	ld	a5,-56(s0)
    13b8:	4ff8                	lw	a4,92(a5)
    13ba:	fac42783          	lw	a5,-84(s0)
    13be:	2781                	sext.w	a5,a5
    13c0:	02e7c763          	blt	a5,a4,13ee <schedule_lst+0x108>
            if (th->current_deadline > current_time) continue;
    13c4:	fc043783          	ld	a5,-64(s0)
    13c8:	4ff8                	lw	a4,92(a5)
    13ca:	fac42783          	lw	a5,-84(s0)
    13ce:	2781                	sext.w	a5,a5
    13d0:	06e7ce63          	blt	a5,a4,144c <schedule_lst+0x166>
            if (th->ID < least_slack_thread->ID) {
    13d4:	fc043783          	ld	a5,-64(s0)
    13d8:	5fd8                	lw	a4,60(a5)
    13da:	fc843783          	ld	a5,-56(s0)
    13de:	5fdc                	lw	a5,60(a5)
    13e0:	06f75763          	bge	a4,a5,144e <schedule_lst+0x168>
                least_slack_thread = th;
    13e4:	fc043783          	ld	a5,-64(s0)
    13e8:	fcf43423          	sd	a5,-56(s0)
    13ec:	a08d                	j	144e <schedule_lst+0x168>
            }
        }
        else if (th->current_deadline <= current_time) {
    13ee:	fc043783          	ld	a5,-64(s0)
    13f2:	4ff8                	lw	a4,92(a5)
    13f4:	fac42783          	lw	a5,-84(s0)
    13f8:	2781                	sext.w	a5,a5
    13fa:	00e7c763          	blt	a5,a4,1408 <schedule_lst+0x122>
            least_slack_thread = th;
    13fe:	fc043783          	ld	a5,-64(s0)
    1402:	fcf43423          	sd	a5,-56(s0)
    1406:	a0a1                	j	144e <schedule_lst+0x168>
        }
        else if (slack_time < least_slack_time) {
    1408:	f7c42703          	lw	a4,-132(s0)
    140c:	f7842783          	lw	a5,-136(s0)
    1410:	2701                	sext.w	a4,a4
    1412:	2781                	sext.w	a5,a5
    1414:	00f75763          	bge	a4,a5,1422 <schedule_lst+0x13c>
            least_slack_thread = th;
    1418:	fc043783          	ld	a5,-64(s0)
    141c:	fcf43423          	sd	a5,-56(s0)
    1420:	a03d                	j	144e <schedule_lst+0x168>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    1422:	f7c42703          	lw	a4,-132(s0)
    1426:	f7842783          	lw	a5,-136(s0)
    142a:	2701                	sext.w	a4,a4
    142c:	2781                	sext.w	a5,a5
    142e:	02f71063          	bne	a4,a5,144e <schedule_lst+0x168>
    1432:	fc043783          	ld	a5,-64(s0)
    1436:	5fd8                	lw	a4,60(a5)
    1438:	fc843783          	ld	a5,-56(s0)
    143c:	5fdc                	lw	a5,60(a5)
    143e:	00f75863          	bge	a4,a5,144e <schedule_lst+0x168>
            least_slack_thread = th;
    1442:	fc043783          	ld	a5,-64(s0)
    1446:	fcf43423          	sd	a5,-56(s0)
    144a:	a011                	j	144e <schedule_lst+0x168>
            if (th->current_deadline > current_time) continue;
    144c:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    144e:	fc043783          	ld	a5,-64(s0)
    1452:	779c                	ld	a5,40(a5)
    1454:	f6f43823          	sd	a5,-144(s0)
    1458:	f7043783          	ld	a5,-144(s0)
    145c:	fd878793          	addi	a5,a5,-40
    1460:	fcf43023          	sd	a5,-64(s0)
    1464:	fc043783          	ld	a5,-64(s0)
    1468:	02878713          	addi	a4,a5,40
    146c:	649c                	ld	a5,8(s1)
    146e:	eef715e3          	bne	a4,a5,1358 <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread->current_deadline <= current_time)
    1472:	fc843783          	ld	a5,-56(s0)
    1476:	4ff8                	lw	a4,92(a5)
    1478:	fac42783          	lw	a5,-84(s0)
    147c:	2781                	sext.w	a5,a5
    147e:	00e7cb63          	blt	a5,a4,1494 <schedule_lst+0x1ae>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    1482:	fc843783          	ld	a5,-56(s0)
    1486:	02878793          	addi	a5,a5,40
    148a:	f6f43023          	sd	a5,-160(s0)
    148e:	f6042423          	sw	zero,-152(s0)
    1492:	aa05                	j	15c2 <schedule_lst+0x2dc>
    
    int executing_time = least_slack_thread->remaining_time;
    1494:	fc843783          	ld	a5,-56(s0)
    1498:	4fbc                	lw	a5,88(a5)
    149a:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    149e:	fc843783          	ld	a5,-56(s0)
    14a2:	4fb4                	lw	a3,88(a5)
    14a4:	fc843783          	ld	a5,-56(s0)
    14a8:	4ff8                	lw	a4,92(a5)
    14aa:	fac42783          	lw	a5,-84(s0)
    14ae:	40f707bb          	subw	a5,a4,a5
    14b2:	2781                	sext.w	a5,a5
    14b4:	8736                	mv	a4,a3
    14b6:	00e7db63          	bge	a5,a4,14cc <schedule_lst+0x1e6>
        executing_time = least_slack_thread->current_deadline - current_time;
    14ba:	fc843783          	ld	a5,-56(s0)
    14be:	4ff8                	lw	a4,92(a5)
    14c0:	fac42783          	lw	a5,-84(s0)
    14c4:	40f707bb          	subw	a5,a4,a5
    14c8:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    14cc:	fc843783          	ld	a5,-56(s0)
    14d0:	4ff8                	lw	a4,92(a5)
    14d2:	fac42783          	lw	a5,-84(s0)
    14d6:	40f707bb          	subw	a5,a4,a5
    14da:	0007871b          	sext.w	a4,a5
    14de:	fc843783          	ld	a5,-56(s0)
    14e2:	4fbc                	lw	a5,88(a5)
    14e4:	40f707bb          	subw	a5,a4,a5
    14e8:	f8f42e23          	sw	a5,-100(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    14ec:	689c                	ld	a5,16(s1)
    14ee:	639c                	ld	a5,0(a5)
    14f0:	f8f43823          	sd	a5,-112(s0)
    14f4:	f9043783          	ld	a5,-112(s0)
    14f8:	17e1                	addi	a5,a5,-8
    14fa:	faf43823          	sd	a5,-80(s0)
    14fe:	a849                	j	1590 <schedule_lst+0x2aa>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    1500:	fb043783          	ld	a5,-80(s0)
    1504:	639c                	ld	a5,0(a5)
    1506:	47f8                	lw	a4,76(a5)
    1508:	fb043783          	ld	a5,-80(s0)
    150c:	639c                	ld	a5,0(a5)
    150e:	43fc                	lw	a5,68(a5)
    1510:	40f707bb          	subw	a5,a4,a5
    1514:	f8f42623          	sw	a5,-116(s0)
        int interval = cur->release_time - current_time;
    1518:	fb043783          	ld	a5,-80(s0)
    151c:	4f98                	lw	a4,24(a5)
    151e:	fac42783          	lw	a5,-84(s0)
    1522:	40f707bb          	subw	a5,a4,a5
    1526:	f8f42423          	sw	a5,-120(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    152a:	f8842703          	lw	a4,-120(s0)
    152e:	fbc42783          	lw	a5,-68(s0)
    1532:	2701                	sext.w	a4,a4
    1534:	2781                	sext.w	a5,a5
    1536:	04e7c063          	blt	a5,a4,1576 <schedule_lst+0x290>
    153a:	f9c42703          	lw	a4,-100(s0)
    153e:	f8c42783          	lw	a5,-116(s0)
    1542:	2701                	sext.w	a4,a4
    1544:	2781                	sext.w	a5,a5
    1546:	02f74863          	blt	a4,a5,1576 <schedule_lst+0x290>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    154a:	f9c42703          	lw	a4,-100(s0)
    154e:	f8c42783          	lw	a5,-116(s0)
    1552:	2701                	sext.w	a4,a4
    1554:	2781                	sext.w	a5,a5
    1556:	00f71b63          	bne	a4,a5,156c <schedule_lst+0x286>
    155a:	fc843783          	ld	a5,-56(s0)
    155e:	5fd8                	lw	a4,60(a5)
    1560:	fb043783          	ld	a5,-80(s0)
    1564:	639c                	ld	a5,0(a5)
    1566:	5fdc                	lw	a5,60(a5)
    1568:	00f74963          	blt	a4,a5,157a <schedule_lst+0x294>
        executing_time = interval;
    156c:	f8842783          	lw	a5,-120(s0)
    1570:	faf42e23          	sw	a5,-68(s0)
    1574:	a021                	j	157c <schedule_lst+0x296>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    1576:	0001                	nop
    1578:	a011                	j	157c <schedule_lst+0x296>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    157a:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    157c:	fb043783          	ld	a5,-80(s0)
    1580:	679c                	ld	a5,8(a5)
    1582:	f8f43023          	sd	a5,-128(s0)
    1586:	f8043783          	ld	a5,-128(s0)
    158a:	17e1                	addi	a5,a5,-8
    158c:	faf43823          	sd	a5,-80(s0)
    1590:	fb043783          	ld	a5,-80(s0)
    1594:	00878713          	addi	a4,a5,8
    1598:	689c                	ld	a5,16(s1)
    159a:	f6f713e3          	bne	a4,a5,1500 <schedule_lst+0x21a>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &least_slack_thread->thread_list;
    159e:	fc843783          	ld	a5,-56(s0)
    15a2:	02878793          	addi	a5,a5,40
    15a6:	f4f43823          	sd	a5,-176(s0)
    r.allocated_time = executing_time;
    15aa:	fbc42783          	lw	a5,-68(s0)
    15ae:	f4f42c23          	sw	a5,-168(s0)
    return r;
    15b2:	f5043783          	ld	a5,-176(s0)
    15b6:	f6f43023          	sd	a5,-160(s0)
    15ba:	f5843783          	ld	a5,-168(s0)
    15be:	f6f43423          	sd	a5,-152(s0)
    15c2:	4701                	li	a4,0
    15c4:	f6043703          	ld	a4,-160(s0)
    15c8:	4781                	li	a5,0
    15ca:	f6843783          	ld	a5,-152(s0)
    15ce:	893a                	mv	s2,a4
    15d0:	89be                	mv	s3,a5
    15d2:	874a                	mv	a4,s2
    15d4:	87ce                	mv	a5,s3
}
    15d6:	853a                	mv	a0,a4
    15d8:	85be                	mv	a1,a5
    15da:	60ee                	ld	ra,216(sp)
    15dc:	644e                	ld	s0,208(sp)
    15de:	64ae                	ld	s1,200(sp)
    15e0:	690e                	ld	s2,192(sp)
    15e2:	79ea                	ld	s3,184(sp)
    15e4:	612d                	addi	sp,sp,224
    15e6:	8082                	ret

00000000000015e8 <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    15e8:	7155                	addi	sp,sp,-208
    15ea:	e586                	sd	ra,200(sp)
    15ec:	e1a2                	sd	s0,192(sp)
    15ee:	fd26                	sd	s1,184(sp)
    15f0:	f94a                	sd	s2,176(sp)
    15f2:	f54e                	sd	s3,168(sp)
    15f4:	0980                	addi	s0,sp,208
    15f6:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.

    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    15f8:	649c                	ld	a5,8(s1)
    15fa:	853e                	mv	a0,a5
    15fc:	00000097          	auipc	ra,0x0
    1600:	80c080e7          	jalr	-2036(ra) # e08 <list_empty>
    1604:	87aa                	mv	a5,a0
    1606:	cb85                	beqz	a5,1636 <schedule_dm+0x4e>
        return fill_sparse(args);
    1608:	609c                	ld	a5,0(s1)
    160a:	f2f43823          	sd	a5,-208(s0)
    160e:	649c                	ld	a5,8(s1)
    1610:	f2f43c23          	sd	a5,-200(s0)
    1614:	689c                	ld	a5,16(s1)
    1616:	f4f43023          	sd	a5,-192(s0)
    161a:	f3040793          	addi	a5,s0,-208
    161e:	853e                	mv	a0,a5
    1620:	00000097          	auipc	ra,0x0
    1624:	812080e7          	jalr	-2030(ra) # e32 <fill_sparse>
    1628:	872a                	mv	a4,a0
    162a:	87ae                	mv	a5,a1
    162c:	f6e43823          	sd	a4,-144(s0)
    1630:	f6f43c23          	sd	a5,-136(s0)
    1634:	ac11                	j	1848 <schedule_dm+0x260>
    
    int current_time = args.current_time;
    1636:	409c                	lw	a5,0(s1)
    1638:	faf42623          	sw	a5,-84(s0)

    // find the thread with the earliest deadline
    struct thread *highest_priority_thread = NULL;
    163c:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1640:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1644:	649c                	ld	a5,8(s1)
    1646:	639c                	ld	a5,0(a5)
    1648:	faf43023          	sd	a5,-96(s0)
    164c:	fa043783          	ld	a5,-96(s0)
    1650:	fd878793          	addi	a5,a5,-40
    1654:	fcf43023          	sd	a5,-64(s0)
    1658:	a0c9                	j	171a <schedule_dm+0x132>
        if (highest_priority_thread == NULL) {
    165a:	fc843783          	ld	a5,-56(s0)
    165e:	e791                	bnez	a5,166a <schedule_dm+0x82>
            highest_priority_thread = th;
    1660:	fc043783          	ld	a5,-64(s0)
    1664:	fcf43423          	sd	a5,-56(s0)
    1668:	a871                	j	1704 <schedule_dm+0x11c>
        }
        else if (highest_priority_thread->current_deadline <= current_time) { // missing the deadline
    166a:	fc843783          	ld	a5,-56(s0)
    166e:	4ff8                	lw	a4,92(a5)
    1670:	fac42783          	lw	a5,-84(s0)
    1674:	2781                	sext.w	a5,a5
    1676:	02e7c763          	blt	a5,a4,16a4 <schedule_dm+0xbc>
            if (th->current_deadline > current_time) continue;
    167a:	fc043783          	ld	a5,-64(s0)
    167e:	4ff8                	lw	a4,92(a5)
    1680:	fac42783          	lw	a5,-84(s0)
    1684:	2781                	sext.w	a5,a5
    1686:	06e7ce63          	blt	a5,a4,1702 <schedule_dm+0x11a>
            if (th->ID < highest_priority_thread->ID) {
    168a:	fc043783          	ld	a5,-64(s0)
    168e:	5fd8                	lw	a4,60(a5)
    1690:	fc843783          	ld	a5,-56(s0)
    1694:	5fdc                	lw	a5,60(a5)
    1696:	06f75763          	bge	a4,a5,1704 <schedule_dm+0x11c>
                highest_priority_thread = th;
    169a:	fc043783          	ld	a5,-64(s0)
    169e:	fcf43423          	sd	a5,-56(s0)
    16a2:	a08d                	j	1704 <schedule_dm+0x11c>
            }
        }
        else if (th->current_deadline <= current_time) {
    16a4:	fc043783          	ld	a5,-64(s0)
    16a8:	4ff8                	lw	a4,92(a5)
    16aa:	fac42783          	lw	a5,-84(s0)
    16ae:	2781                	sext.w	a5,a5
    16b0:	00e7c763          	blt	a5,a4,16be <schedule_dm+0xd6>
            highest_priority_thread = th;
    16b4:	fc043783          	ld	a5,-64(s0)
    16b8:	fcf43423          	sd	a5,-56(s0)
    16bc:	a0a1                	j	1704 <schedule_dm+0x11c>
        }
        else if (th->deadline < highest_priority_thread->deadline ) {
    16be:	fc043783          	ld	a5,-64(s0)
    16c2:	47f8                	lw	a4,76(a5)
    16c4:	fc843783          	ld	a5,-56(s0)
    16c8:	47fc                	lw	a5,76(a5)
    16ca:	00f75763          	bge	a4,a5,16d8 <schedule_dm+0xf0>
            highest_priority_thread = th;
    16ce:	fc043783          	ld	a5,-64(s0)
    16d2:	fcf43423          	sd	a5,-56(s0)
    16d6:	a03d                	j	1704 <schedule_dm+0x11c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    16d8:	fc043783          	ld	a5,-64(s0)
    16dc:	47f8                	lw	a4,76(a5)
    16de:	fc843783          	ld	a5,-56(s0)
    16e2:	47fc                	lw	a5,76(a5)
    16e4:	02f71063          	bne	a4,a5,1704 <schedule_dm+0x11c>
    16e8:	fc043783          	ld	a5,-64(s0)
    16ec:	5fd8                	lw	a4,60(a5)
    16ee:	fc843783          	ld	a5,-56(s0)
    16f2:	5fdc                	lw	a5,60(a5)
    16f4:	00f75863          	bge	a4,a5,1704 <schedule_dm+0x11c>
            highest_priority_thread = th;
    16f8:	fc043783          	ld	a5,-64(s0)
    16fc:	fcf43423          	sd	a5,-56(s0)
    1700:	a011                	j	1704 <schedule_dm+0x11c>
            if (th->current_deadline > current_time) continue;
    1702:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1704:	fc043783          	ld	a5,-64(s0)
    1708:	779c                	ld	a5,40(a5)
    170a:	f8f43023          	sd	a5,-128(s0)
    170e:	f8043783          	ld	a5,-128(s0)
    1712:	fd878793          	addi	a5,a5,-40
    1716:	fcf43023          	sd	a5,-64(s0)
    171a:	fc043783          	ld	a5,-64(s0)
    171e:	02878713          	addi	a4,a5,40
    1722:	649c                	ld	a5,8(s1)
    1724:	f2f71be3          	bne	a4,a5,165a <schedule_dm+0x72>
        }
    }

    // the thread missing the current deadline
    if (highest_priority_thread->current_deadline <= current_time)
    1728:	fc843783          	ld	a5,-56(s0)
    172c:	4ff8                	lw	a4,92(a5)
    172e:	fac42783          	lw	a5,-84(s0)
    1732:	2781                	sext.w	a5,a5
    1734:	00e7cb63          	blt	a5,a4,174a <schedule_dm+0x162>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    1738:	fc843783          	ld	a5,-56(s0)
    173c:	02878793          	addi	a5,a5,40
    1740:	f6f43823          	sd	a5,-144(s0)
    1744:	f6042c23          	sw	zero,-136(s0)
    1748:	a201                	j	1848 <schedule_dm+0x260>

    int executing_time = highest_priority_thread->remaining_time;
    174a:	fc843783          	ld	a5,-56(s0)
    174e:	4fbc                	lw	a5,88(a5)
    1750:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    1754:	fc843783          	ld	a5,-56(s0)
    1758:	4fb4                	lw	a3,88(a5)
    175a:	fc843783          	ld	a5,-56(s0)
    175e:	4ff8                	lw	a4,92(a5)
    1760:	fac42783          	lw	a5,-84(s0)
    1764:	40f707bb          	subw	a5,a4,a5
    1768:	2781                	sext.w	a5,a5
    176a:	8736                	mv	a4,a3
    176c:	00e7db63          	bge	a5,a4,1782 <schedule_dm+0x19a>
        executing_time = highest_priority_thread->current_deadline - current_time;
    1770:	fc843783          	ld	a5,-56(s0)
    1774:	4ff8                	lw	a4,92(a5)
    1776:	fac42783          	lw	a5,-84(s0)
    177a:	40f707bb          	subw	a5,a4,a5
    177e:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1782:	689c                	ld	a5,16(s1)
    1784:	639c                	ld	a5,0(a5)
    1786:	f8f43c23          	sd	a5,-104(s0)
    178a:	f9843783          	ld	a5,-104(s0)
    178e:	17e1                	addi	a5,a5,-8
    1790:	faf43823          	sd	a5,-80(s0)
    1794:	a049                	j	1816 <schedule_dm+0x22e>
        int interval = cur->release_time - current_time;
    1796:	fb043783          	ld	a5,-80(s0)
    179a:	4f98                	lw	a4,24(a5)
    179c:	fac42783          	lw	a5,-84(s0)
    17a0:	40f707bb          	subw	a5,a4,a5
    17a4:	f8f42a23          	sw	a5,-108(s0)
        if (interval > executing_time) continue;
    17a8:	f9442703          	lw	a4,-108(s0)
    17ac:	fbc42783          	lw	a5,-68(s0)
    17b0:	2701                	sext.w	a4,a4
    17b2:	2781                	sext.w	a5,a5
    17b4:	04e7c263          	blt	a5,a4,17f8 <schedule_dm+0x210>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    17b8:	fc843783          	ld	a5,-56(s0)
    17bc:	47f8                	lw	a4,76(a5)
    17be:	fb043783          	ld	a5,-80(s0)
    17c2:	639c                	ld	a5,0(a5)
    17c4:	47fc                	lw	a5,76(a5)
    17c6:	02f74b63          	blt	a4,a5,17fc <schedule_dm+0x214>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    17ca:	fc843783          	ld	a5,-56(s0)
    17ce:	47f8                	lw	a4,76(a5)
    17d0:	fb043783          	ld	a5,-80(s0)
    17d4:	639c                	ld	a5,0(a5)
    17d6:	47fc                	lw	a5,76(a5)
    17d8:	00f71b63          	bne	a4,a5,17ee <schedule_dm+0x206>
    17dc:	fc843783          	ld	a5,-56(s0)
    17e0:	5fd8                	lw	a4,60(a5)
    17e2:	fb043783          	ld	a5,-80(s0)
    17e6:	639c                	ld	a5,0(a5)
    17e8:	5fdc                	lw	a5,60(a5)
    17ea:	00f74b63          	blt	a4,a5,1800 <schedule_dm+0x218>
        executing_time = interval;
    17ee:	f9442783          	lw	a5,-108(s0)
    17f2:	faf42e23          	sw	a5,-68(s0)
    17f6:	a031                	j	1802 <schedule_dm+0x21a>
        if (interval > executing_time) continue;
    17f8:	0001                	nop
    17fa:	a021                	j	1802 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    17fc:	0001                	nop
    17fe:	a011                	j	1802 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    1800:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1802:	fb043783          	ld	a5,-80(s0)
    1806:	679c                	ld	a5,8(a5)
    1808:	f8f43423          	sd	a5,-120(s0)
    180c:	f8843783          	ld	a5,-120(s0)
    1810:	17e1                	addi	a5,a5,-8
    1812:	faf43823          	sd	a5,-80(s0)
    1816:	fb043783          	ld	a5,-80(s0)
    181a:	00878713          	addi	a4,a5,8
    181e:	689c                	ld	a5,16(s1)
    1820:	f6f71be3          	bne	a4,a5,1796 <schedule_dm+0x1ae>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &highest_priority_thread->thread_list;
    1824:	fc843783          	ld	a5,-56(s0)
    1828:	02878793          	addi	a5,a5,40
    182c:	f6f43023          	sd	a5,-160(s0)
    r.allocated_time = executing_time;
    1830:	fbc42783          	lw	a5,-68(s0)
    1834:	f6f42423          	sw	a5,-152(s0)
    return r;
    1838:	f6043783          	ld	a5,-160(s0)
    183c:	f6f43823          	sd	a5,-144(s0)
    1840:	f6843783          	ld	a5,-152(s0)
    1844:	f6f43c23          	sd	a5,-136(s0)
    1848:	4701                	li	a4,0
    184a:	f7043703          	ld	a4,-144(s0)
    184e:	4781                	li	a5,0
    1850:	f7843783          	ld	a5,-136(s0)
    1854:	893a                	mv	s2,a4
    1856:	89be                	mv	s3,a5
    1858:	874a                	mv	a4,s2
    185a:	87ce                	mv	a5,s3
    185c:	853a                	mv	a0,a4
    185e:	85be                	mv	a1,a5
    1860:	60ae                	ld	ra,200(sp)
    1862:	640e                	ld	s0,192(sp)
    1864:	74ea                	ld	s1,184(sp)
    1866:	794a                	ld	s2,176(sp)
    1868:	79aa                	ld	s3,168(sp)
    186a:	6169                	addi	sp,sp,208
    186c:	8082                	ret
