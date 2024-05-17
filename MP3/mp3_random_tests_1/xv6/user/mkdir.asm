
user/_mkdir:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
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
    fprintf(2, "Usage: mkdir files...\n");
      20:	00002597          	auipc	a1,0x2
      24:	87058593          	addi	a1,a1,-1936 # 1890 <schedule_dm+0x28a>
      28:	4509                	li	a0,2
      2a:	00001097          	auipc	ra,0x1
      2e:	9fe080e7          	jalr	-1538(ra) # a28 <fprintf>
    exit(1);
      32:	4505                	li	a0,1
      34:	00000097          	auipc	ra,0x0
      38:	506080e7          	jalr	1286(ra) # 53a <exit>
  }

  for(i = 1; i < argc; i++){
      3c:	4785                	li	a5,1
      3e:	fef42623          	sw	a5,-20(s0)
      42:	a0b9                	j	90 <main+0x90>
    if(mkdir(argv[i]) < 0){
      44:	fec42783          	lw	a5,-20(s0)
      48:	078e                	slli	a5,a5,0x3
      4a:	fd043703          	ld	a4,-48(s0)
      4e:	97ba                	add	a5,a5,a4
      50:	639c                	ld	a5,0(a5)
      52:	853e                	mv	a0,a5
      54:	00000097          	auipc	ra,0x0
      58:	54e080e7          	jalr	1358(ra) # 5a2 <mkdir>
      5c:	87aa                	mv	a5,a0
      5e:	0207d463          	bgez	a5,86 <main+0x86>
      fprintf(2, "mkdir: %s failed to create\n", argv[i]);
      62:	fec42783          	lw	a5,-20(s0)
      66:	078e                	slli	a5,a5,0x3
      68:	fd043703          	ld	a4,-48(s0)
      6c:	97ba                	add	a5,a5,a4
      6e:	639c                	ld	a5,0(a5)
      70:	863e                	mv	a2,a5
      72:	00002597          	auipc	a1,0x2
      76:	83658593          	addi	a1,a1,-1994 # 18a8 <schedule_dm+0x2a2>
      7a:	4509                	li	a0,2
      7c:	00001097          	auipc	ra,0x1
      80:	9ac080e7          	jalr	-1620(ra) # a28 <fprintf>
      break;
      84:	a831                	j	a0 <main+0xa0>
  for(i = 1; i < argc; i++){
      86:	fec42783          	lw	a5,-20(s0)
      8a:	2785                	addiw	a5,a5,1
      8c:	fef42623          	sw	a5,-20(s0)
      90:	fec42703          	lw	a4,-20(s0)
      94:	fdc42783          	lw	a5,-36(s0)
      98:	2701                	sext.w	a4,a4
      9a:	2781                	sext.w	a5,a5
      9c:	faf744e3          	blt	a4,a5,44 <main+0x44>
    }
  }

  exit(0);
      a0:	4501                	li	a0,0
      a2:	00000097          	auipc	ra,0x0
      a6:	498080e7          	jalr	1176(ra) # 53a <exit>

00000000000000aa <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      aa:	7179                	addi	sp,sp,-48
      ac:	f422                	sd	s0,40(sp)
      ae:	1800                	addi	s0,sp,48
      b0:	fca43c23          	sd	a0,-40(s0)
      b4:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      b8:	fd843783          	ld	a5,-40(s0)
      bc:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      c0:	0001                	nop
      c2:	fd043703          	ld	a4,-48(s0)
      c6:	00170793          	addi	a5,a4,1
      ca:	fcf43823          	sd	a5,-48(s0)
      ce:	fd843783          	ld	a5,-40(s0)
      d2:	00178693          	addi	a3,a5,1
      d6:	fcd43c23          	sd	a3,-40(s0)
      da:	00074703          	lbu	a4,0(a4)
      de:	00e78023          	sb	a4,0(a5)
      e2:	0007c783          	lbu	a5,0(a5)
      e6:	fff1                	bnez	a5,c2 <strcpy+0x18>
    ;
  return os;
      e8:	fe843783          	ld	a5,-24(s0)
}
      ec:	853e                	mv	a0,a5
      ee:	7422                	ld	s0,40(sp)
      f0:	6145                	addi	sp,sp,48
      f2:	8082                	ret

00000000000000f4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      f4:	1101                	addi	sp,sp,-32
      f6:	ec22                	sd	s0,24(sp)
      f8:	1000                	addi	s0,sp,32
      fa:	fea43423          	sd	a0,-24(s0)
      fe:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     102:	a819                	j	118 <strcmp+0x24>
    p++, q++;
     104:	fe843783          	ld	a5,-24(s0)
     108:	0785                	addi	a5,a5,1
     10a:	fef43423          	sd	a5,-24(s0)
     10e:	fe043783          	ld	a5,-32(s0)
     112:	0785                	addi	a5,a5,1
     114:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     118:	fe843783          	ld	a5,-24(s0)
     11c:	0007c783          	lbu	a5,0(a5)
     120:	cb99                	beqz	a5,136 <strcmp+0x42>
     122:	fe843783          	ld	a5,-24(s0)
     126:	0007c703          	lbu	a4,0(a5)
     12a:	fe043783          	ld	a5,-32(s0)
     12e:	0007c783          	lbu	a5,0(a5)
     132:	fcf709e3          	beq	a4,a5,104 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     136:	fe843783          	ld	a5,-24(s0)
     13a:	0007c783          	lbu	a5,0(a5)
     13e:	0007871b          	sext.w	a4,a5
     142:	fe043783          	ld	a5,-32(s0)
     146:	0007c783          	lbu	a5,0(a5)
     14a:	2781                	sext.w	a5,a5
     14c:	40f707bb          	subw	a5,a4,a5
     150:	2781                	sext.w	a5,a5
}
     152:	853e                	mv	a0,a5
     154:	6462                	ld	s0,24(sp)
     156:	6105                	addi	sp,sp,32
     158:	8082                	ret

000000000000015a <strlen>:

uint
strlen(const char *s)
{
     15a:	7179                	addi	sp,sp,-48
     15c:	f422                	sd	s0,40(sp)
     15e:	1800                	addi	s0,sp,48
     160:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     164:	fe042623          	sw	zero,-20(s0)
     168:	a031                	j	174 <strlen+0x1a>
     16a:	fec42783          	lw	a5,-20(s0)
     16e:	2785                	addiw	a5,a5,1
     170:	fef42623          	sw	a5,-20(s0)
     174:	fec42783          	lw	a5,-20(s0)
     178:	fd843703          	ld	a4,-40(s0)
     17c:	97ba                	add	a5,a5,a4
     17e:	0007c783          	lbu	a5,0(a5)
     182:	f7e5                	bnez	a5,16a <strlen+0x10>
    ;
  return n;
     184:	fec42783          	lw	a5,-20(s0)
}
     188:	853e                	mv	a0,a5
     18a:	7422                	ld	s0,40(sp)
     18c:	6145                	addi	sp,sp,48
     18e:	8082                	ret

0000000000000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
     190:	7179                	addi	sp,sp,-48
     192:	f422                	sd	s0,40(sp)
     194:	1800                	addi	s0,sp,48
     196:	fca43c23          	sd	a0,-40(s0)
     19a:	87ae                	mv	a5,a1
     19c:	8732                	mv	a4,a2
     19e:	fcf42a23          	sw	a5,-44(s0)
     1a2:	87ba                	mv	a5,a4
     1a4:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     1a8:	fd843783          	ld	a5,-40(s0)
     1ac:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     1b0:	fe042623          	sw	zero,-20(s0)
     1b4:	a00d                	j	1d6 <memset+0x46>
    cdst[i] = c;
     1b6:	fec42783          	lw	a5,-20(s0)
     1ba:	fe043703          	ld	a4,-32(s0)
     1be:	97ba                	add	a5,a5,a4
     1c0:	fd442703          	lw	a4,-44(s0)
     1c4:	0ff77713          	andi	a4,a4,255
     1c8:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1cc:	fec42783          	lw	a5,-20(s0)
     1d0:	2785                	addiw	a5,a5,1
     1d2:	fef42623          	sw	a5,-20(s0)
     1d6:	fec42703          	lw	a4,-20(s0)
     1da:	fd042783          	lw	a5,-48(s0)
     1de:	2781                	sext.w	a5,a5
     1e0:	fcf76be3          	bltu	a4,a5,1b6 <memset+0x26>
  }
  return dst;
     1e4:	fd843783          	ld	a5,-40(s0)
}
     1e8:	853e                	mv	a0,a5
     1ea:	7422                	ld	s0,40(sp)
     1ec:	6145                	addi	sp,sp,48
     1ee:	8082                	ret

00000000000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
     1f0:	1101                	addi	sp,sp,-32
     1f2:	ec22                	sd	s0,24(sp)
     1f4:	1000                	addi	s0,sp,32
     1f6:	fea43423          	sd	a0,-24(s0)
     1fa:	87ae                	mv	a5,a1
     1fc:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     200:	a01d                	j	226 <strchr+0x36>
    if(*s == c)
     202:	fe843783          	ld	a5,-24(s0)
     206:	0007c703          	lbu	a4,0(a5)
     20a:	fe744783          	lbu	a5,-25(s0)
     20e:	0ff7f793          	andi	a5,a5,255
     212:	00e79563          	bne	a5,a4,21c <strchr+0x2c>
      return (char*)s;
     216:	fe843783          	ld	a5,-24(s0)
     21a:	a821                	j	232 <strchr+0x42>
  for(; *s; s++)
     21c:	fe843783          	ld	a5,-24(s0)
     220:	0785                	addi	a5,a5,1
     222:	fef43423          	sd	a5,-24(s0)
     226:	fe843783          	ld	a5,-24(s0)
     22a:	0007c783          	lbu	a5,0(a5)
     22e:	fbf1                	bnez	a5,202 <strchr+0x12>
  return 0;
     230:	4781                	li	a5,0
}
     232:	853e                	mv	a0,a5
     234:	6462                	ld	s0,24(sp)
     236:	6105                	addi	sp,sp,32
     238:	8082                	ret

000000000000023a <gets>:

char*
gets(char *buf, int max)
{
     23a:	7179                	addi	sp,sp,-48
     23c:	f406                	sd	ra,40(sp)
     23e:	f022                	sd	s0,32(sp)
     240:	1800                	addi	s0,sp,48
     242:	fca43c23          	sd	a0,-40(s0)
     246:	87ae                	mv	a5,a1
     248:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     24c:	fe042623          	sw	zero,-20(s0)
     250:	a8a1                	j	2a8 <gets+0x6e>
    cc = read(0, &c, 1);
     252:	fe740793          	addi	a5,s0,-25
     256:	4605                	li	a2,1
     258:	85be                	mv	a1,a5
     25a:	4501                	li	a0,0
     25c:	00000097          	auipc	ra,0x0
     260:	2f6080e7          	jalr	758(ra) # 552 <read>
     264:	87aa                	mv	a5,a0
     266:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     26a:	fe842783          	lw	a5,-24(s0)
     26e:	2781                	sext.w	a5,a5
     270:	04f05763          	blez	a5,2be <gets+0x84>
      break;
    buf[i++] = c;
     274:	fec42783          	lw	a5,-20(s0)
     278:	0017871b          	addiw	a4,a5,1
     27c:	fee42623          	sw	a4,-20(s0)
     280:	873e                	mv	a4,a5
     282:	fd843783          	ld	a5,-40(s0)
     286:	97ba                	add	a5,a5,a4
     288:	fe744703          	lbu	a4,-25(s0)
     28c:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     290:	fe744783          	lbu	a5,-25(s0)
     294:	873e                	mv	a4,a5
     296:	47a9                	li	a5,10
     298:	02f70463          	beq	a4,a5,2c0 <gets+0x86>
     29c:	fe744783          	lbu	a5,-25(s0)
     2a0:	873e                	mv	a4,a5
     2a2:	47b5                	li	a5,13
     2a4:	00f70e63          	beq	a4,a5,2c0 <gets+0x86>
  for(i=0; i+1 < max; ){
     2a8:	fec42783          	lw	a5,-20(s0)
     2ac:	2785                	addiw	a5,a5,1
     2ae:	0007871b          	sext.w	a4,a5
     2b2:	fd442783          	lw	a5,-44(s0)
     2b6:	2781                	sext.w	a5,a5
     2b8:	f8f74de3          	blt	a4,a5,252 <gets+0x18>
     2bc:	a011                	j	2c0 <gets+0x86>
      break;
     2be:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2c0:	fec42783          	lw	a5,-20(s0)
     2c4:	fd843703          	ld	a4,-40(s0)
     2c8:	97ba                	add	a5,a5,a4
     2ca:	00078023          	sb	zero,0(a5)
  return buf;
     2ce:	fd843783          	ld	a5,-40(s0)
}
     2d2:	853e                	mv	a0,a5
     2d4:	70a2                	ld	ra,40(sp)
     2d6:	7402                	ld	s0,32(sp)
     2d8:	6145                	addi	sp,sp,48
     2da:	8082                	ret

00000000000002dc <stat>:

int
stat(const char *n, struct stat *st)
{
     2dc:	7179                	addi	sp,sp,-48
     2de:	f406                	sd	ra,40(sp)
     2e0:	f022                	sd	s0,32(sp)
     2e2:	1800                	addi	s0,sp,48
     2e4:	fca43c23          	sd	a0,-40(s0)
     2e8:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2ec:	4581                	li	a1,0
     2ee:	fd843503          	ld	a0,-40(s0)
     2f2:	00000097          	auipc	ra,0x0
     2f6:	288080e7          	jalr	648(ra) # 57a <open>
     2fa:	87aa                	mv	a5,a0
     2fc:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     300:	fec42783          	lw	a5,-20(s0)
     304:	2781                	sext.w	a5,a5
     306:	0007d463          	bgez	a5,30e <stat+0x32>
    return -1;
     30a:	57fd                	li	a5,-1
     30c:	a035                	j	338 <stat+0x5c>
  r = fstat(fd, st);
     30e:	fec42783          	lw	a5,-20(s0)
     312:	fd043583          	ld	a1,-48(s0)
     316:	853e                	mv	a0,a5
     318:	00000097          	auipc	ra,0x0
     31c:	27a080e7          	jalr	634(ra) # 592 <fstat>
     320:	87aa                	mv	a5,a0
     322:	fef42423          	sw	a5,-24(s0)
  close(fd);
     326:	fec42783          	lw	a5,-20(s0)
     32a:	853e                	mv	a0,a5
     32c:	00000097          	auipc	ra,0x0
     330:	236080e7          	jalr	566(ra) # 562 <close>
  return r;
     334:	fe842783          	lw	a5,-24(s0)
}
     338:	853e                	mv	a0,a5
     33a:	70a2                	ld	ra,40(sp)
     33c:	7402                	ld	s0,32(sp)
     33e:	6145                	addi	sp,sp,48
     340:	8082                	ret

0000000000000342 <atoi>:

int
atoi(const char *s)
{
     342:	7179                	addi	sp,sp,-48
     344:	f422                	sd	s0,40(sp)
     346:	1800                	addi	s0,sp,48
     348:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     34c:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     350:	a815                	j	384 <atoi+0x42>
    n = n*10 + *s++ - '0';
     352:	fec42703          	lw	a4,-20(s0)
     356:	87ba                	mv	a5,a4
     358:	0027979b          	slliw	a5,a5,0x2
     35c:	9fb9                	addw	a5,a5,a4
     35e:	0017979b          	slliw	a5,a5,0x1
     362:	0007871b          	sext.w	a4,a5
     366:	fd843783          	ld	a5,-40(s0)
     36a:	00178693          	addi	a3,a5,1
     36e:	fcd43c23          	sd	a3,-40(s0)
     372:	0007c783          	lbu	a5,0(a5)
     376:	2781                	sext.w	a5,a5
     378:	9fb9                	addw	a5,a5,a4
     37a:	2781                	sext.w	a5,a5
     37c:	fd07879b          	addiw	a5,a5,-48
     380:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     384:	fd843783          	ld	a5,-40(s0)
     388:	0007c783          	lbu	a5,0(a5)
     38c:	873e                	mv	a4,a5
     38e:	02f00793          	li	a5,47
     392:	00e7fb63          	bgeu	a5,a4,3a8 <atoi+0x66>
     396:	fd843783          	ld	a5,-40(s0)
     39a:	0007c783          	lbu	a5,0(a5)
     39e:	873e                	mv	a4,a5
     3a0:	03900793          	li	a5,57
     3a4:	fae7f7e3          	bgeu	a5,a4,352 <atoi+0x10>
  return n;
     3a8:	fec42783          	lw	a5,-20(s0)
}
     3ac:	853e                	mv	a0,a5
     3ae:	7422                	ld	s0,40(sp)
     3b0:	6145                	addi	sp,sp,48
     3b2:	8082                	ret

00000000000003b4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     3b4:	7139                	addi	sp,sp,-64
     3b6:	fc22                	sd	s0,56(sp)
     3b8:	0080                	addi	s0,sp,64
     3ba:	fca43c23          	sd	a0,-40(s0)
     3be:	fcb43823          	sd	a1,-48(s0)
     3c2:	87b2                	mv	a5,a2
     3c4:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3c8:	fd843783          	ld	a5,-40(s0)
     3cc:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3d0:	fd043783          	ld	a5,-48(s0)
     3d4:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3d8:	fe043703          	ld	a4,-32(s0)
     3dc:	fe843783          	ld	a5,-24(s0)
     3e0:	02e7fc63          	bgeu	a5,a4,418 <memmove+0x64>
    while(n-- > 0)
     3e4:	a00d                	j	406 <memmove+0x52>
      *dst++ = *src++;
     3e6:	fe043703          	ld	a4,-32(s0)
     3ea:	00170793          	addi	a5,a4,1
     3ee:	fef43023          	sd	a5,-32(s0)
     3f2:	fe843783          	ld	a5,-24(s0)
     3f6:	00178693          	addi	a3,a5,1
     3fa:	fed43423          	sd	a3,-24(s0)
     3fe:	00074703          	lbu	a4,0(a4)
     402:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     406:	fcc42783          	lw	a5,-52(s0)
     40a:	fff7871b          	addiw	a4,a5,-1
     40e:	fce42623          	sw	a4,-52(s0)
     412:	fcf04ae3          	bgtz	a5,3e6 <memmove+0x32>
     416:	a891                	j	46a <memmove+0xb6>
  } else {
    dst += n;
     418:	fcc42783          	lw	a5,-52(s0)
     41c:	fe843703          	ld	a4,-24(s0)
     420:	97ba                	add	a5,a5,a4
     422:	fef43423          	sd	a5,-24(s0)
    src += n;
     426:	fcc42783          	lw	a5,-52(s0)
     42a:	fe043703          	ld	a4,-32(s0)
     42e:	97ba                	add	a5,a5,a4
     430:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     434:	a01d                	j	45a <memmove+0xa6>
      *--dst = *--src;
     436:	fe043783          	ld	a5,-32(s0)
     43a:	17fd                	addi	a5,a5,-1
     43c:	fef43023          	sd	a5,-32(s0)
     440:	fe843783          	ld	a5,-24(s0)
     444:	17fd                	addi	a5,a5,-1
     446:	fef43423          	sd	a5,-24(s0)
     44a:	fe043783          	ld	a5,-32(s0)
     44e:	0007c703          	lbu	a4,0(a5)
     452:	fe843783          	ld	a5,-24(s0)
     456:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     45a:	fcc42783          	lw	a5,-52(s0)
     45e:	fff7871b          	addiw	a4,a5,-1
     462:	fce42623          	sw	a4,-52(s0)
     466:	fcf048e3          	bgtz	a5,436 <memmove+0x82>
  }
  return vdst;
     46a:	fd843783          	ld	a5,-40(s0)
}
     46e:	853e                	mv	a0,a5
     470:	7462                	ld	s0,56(sp)
     472:	6121                	addi	sp,sp,64
     474:	8082                	ret

0000000000000476 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     476:	7139                	addi	sp,sp,-64
     478:	fc22                	sd	s0,56(sp)
     47a:	0080                	addi	s0,sp,64
     47c:	fca43c23          	sd	a0,-40(s0)
     480:	fcb43823          	sd	a1,-48(s0)
     484:	87b2                	mv	a5,a2
     486:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     48a:	fd843783          	ld	a5,-40(s0)
     48e:	fef43423          	sd	a5,-24(s0)
     492:	fd043783          	ld	a5,-48(s0)
     496:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     49a:	a0a1                	j	4e2 <memcmp+0x6c>
    if (*p1 != *p2) {
     49c:	fe843783          	ld	a5,-24(s0)
     4a0:	0007c703          	lbu	a4,0(a5)
     4a4:	fe043783          	ld	a5,-32(s0)
     4a8:	0007c783          	lbu	a5,0(a5)
     4ac:	02f70163          	beq	a4,a5,4ce <memcmp+0x58>
      return *p1 - *p2;
     4b0:	fe843783          	ld	a5,-24(s0)
     4b4:	0007c783          	lbu	a5,0(a5)
     4b8:	0007871b          	sext.w	a4,a5
     4bc:	fe043783          	ld	a5,-32(s0)
     4c0:	0007c783          	lbu	a5,0(a5)
     4c4:	2781                	sext.w	a5,a5
     4c6:	40f707bb          	subw	a5,a4,a5
     4ca:	2781                	sext.w	a5,a5
     4cc:	a01d                	j	4f2 <memcmp+0x7c>
    }
    p1++;
     4ce:	fe843783          	ld	a5,-24(s0)
     4d2:	0785                	addi	a5,a5,1
     4d4:	fef43423          	sd	a5,-24(s0)
    p2++;
     4d8:	fe043783          	ld	a5,-32(s0)
     4dc:	0785                	addi	a5,a5,1
     4de:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4e2:	fcc42783          	lw	a5,-52(s0)
     4e6:	fff7871b          	addiw	a4,a5,-1
     4ea:	fce42623          	sw	a4,-52(s0)
     4ee:	f7dd                	bnez	a5,49c <memcmp+0x26>
  }
  return 0;
     4f0:	4781                	li	a5,0
}
     4f2:	853e                	mv	a0,a5
     4f4:	7462                	ld	s0,56(sp)
     4f6:	6121                	addi	sp,sp,64
     4f8:	8082                	ret

00000000000004fa <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4fa:	7179                	addi	sp,sp,-48
     4fc:	f406                	sd	ra,40(sp)
     4fe:	f022                	sd	s0,32(sp)
     500:	1800                	addi	s0,sp,48
     502:	fea43423          	sd	a0,-24(s0)
     506:	feb43023          	sd	a1,-32(s0)
     50a:	87b2                	mv	a5,a2
     50c:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     510:	fdc42783          	lw	a5,-36(s0)
     514:	863e                	mv	a2,a5
     516:	fe043583          	ld	a1,-32(s0)
     51a:	fe843503          	ld	a0,-24(s0)
     51e:	00000097          	auipc	ra,0x0
     522:	e96080e7          	jalr	-362(ra) # 3b4 <memmove>
     526:	87aa                	mv	a5,a0
}
     528:	853e                	mv	a0,a5
     52a:	70a2                	ld	ra,40(sp)
     52c:	7402                	ld	s0,32(sp)
     52e:	6145                	addi	sp,sp,48
     530:	8082                	ret

0000000000000532 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     532:	4885                	li	a7,1
 ecall
     534:	00000073          	ecall
 ret
     538:	8082                	ret

000000000000053a <exit>:
.global exit
exit:
 li a7, SYS_exit
     53a:	4889                	li	a7,2
 ecall
     53c:	00000073          	ecall
 ret
     540:	8082                	ret

0000000000000542 <wait>:
.global wait
wait:
 li a7, SYS_wait
     542:	488d                	li	a7,3
 ecall
     544:	00000073          	ecall
 ret
     548:	8082                	ret

000000000000054a <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     54a:	4891                	li	a7,4
 ecall
     54c:	00000073          	ecall
 ret
     550:	8082                	ret

0000000000000552 <read>:
.global read
read:
 li a7, SYS_read
     552:	4895                	li	a7,5
 ecall
     554:	00000073          	ecall
 ret
     558:	8082                	ret

000000000000055a <write>:
.global write
write:
 li a7, SYS_write
     55a:	48c1                	li	a7,16
 ecall
     55c:	00000073          	ecall
 ret
     560:	8082                	ret

0000000000000562 <close>:
.global close
close:
 li a7, SYS_close
     562:	48d5                	li	a7,21
 ecall
     564:	00000073          	ecall
 ret
     568:	8082                	ret

000000000000056a <kill>:
.global kill
kill:
 li a7, SYS_kill
     56a:	4899                	li	a7,6
 ecall
     56c:	00000073          	ecall
 ret
     570:	8082                	ret

0000000000000572 <exec>:
.global exec
exec:
 li a7, SYS_exec
     572:	489d                	li	a7,7
 ecall
     574:	00000073          	ecall
 ret
     578:	8082                	ret

000000000000057a <open>:
.global open
open:
 li a7, SYS_open
     57a:	48bd                	li	a7,15
 ecall
     57c:	00000073          	ecall
 ret
     580:	8082                	ret

0000000000000582 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     582:	48c5                	li	a7,17
 ecall
     584:	00000073          	ecall
 ret
     588:	8082                	ret

000000000000058a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     58a:	48c9                	li	a7,18
 ecall
     58c:	00000073          	ecall
 ret
     590:	8082                	ret

0000000000000592 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     592:	48a1                	li	a7,8
 ecall
     594:	00000073          	ecall
 ret
     598:	8082                	ret

000000000000059a <link>:
.global link
link:
 li a7, SYS_link
     59a:	48cd                	li	a7,19
 ecall
     59c:	00000073          	ecall
 ret
     5a0:	8082                	ret

00000000000005a2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     5a2:	48d1                	li	a7,20
 ecall
     5a4:	00000073          	ecall
 ret
     5a8:	8082                	ret

00000000000005aa <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     5aa:	48a5                	li	a7,9
 ecall
     5ac:	00000073          	ecall
 ret
     5b0:	8082                	ret

00000000000005b2 <dup>:
.global dup
dup:
 li a7, SYS_dup
     5b2:	48a9                	li	a7,10
 ecall
     5b4:	00000073          	ecall
 ret
     5b8:	8082                	ret

00000000000005ba <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     5ba:	48ad                	li	a7,11
 ecall
     5bc:	00000073          	ecall
 ret
     5c0:	8082                	ret

00000000000005c2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5c2:	48b1                	li	a7,12
 ecall
     5c4:	00000073          	ecall
 ret
     5c8:	8082                	ret

00000000000005ca <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5ca:	48b5                	li	a7,13
 ecall
     5cc:	00000073          	ecall
 ret
     5d0:	8082                	ret

00000000000005d2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5d2:	48b9                	li	a7,14
 ecall
     5d4:	00000073          	ecall
 ret
     5d8:	8082                	ret

00000000000005da <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5da:	48d9                	li	a7,22
 ecall
     5dc:	00000073          	ecall
 ret
     5e0:	8082                	ret

00000000000005e2 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5e2:	48dd                	li	a7,23
 ecall
     5e4:	00000073          	ecall
 ret
     5e8:	8082                	ret

00000000000005ea <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5ea:	48e1                	li	a7,24
 ecall
     5ec:	00000073          	ecall
 ret
     5f0:	8082                	ret

00000000000005f2 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5f2:	1101                	addi	sp,sp,-32
     5f4:	ec06                	sd	ra,24(sp)
     5f6:	e822                	sd	s0,16(sp)
     5f8:	1000                	addi	s0,sp,32
     5fa:	87aa                	mv	a5,a0
     5fc:	872e                	mv	a4,a1
     5fe:	fef42623          	sw	a5,-20(s0)
     602:	87ba                	mv	a5,a4
     604:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     608:	feb40713          	addi	a4,s0,-21
     60c:	fec42783          	lw	a5,-20(s0)
     610:	4605                	li	a2,1
     612:	85ba                	mv	a1,a4
     614:	853e                	mv	a0,a5
     616:	00000097          	auipc	ra,0x0
     61a:	f44080e7          	jalr	-188(ra) # 55a <write>
}
     61e:	0001                	nop
     620:	60e2                	ld	ra,24(sp)
     622:	6442                	ld	s0,16(sp)
     624:	6105                	addi	sp,sp,32
     626:	8082                	ret

0000000000000628 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     628:	7139                	addi	sp,sp,-64
     62a:	fc06                	sd	ra,56(sp)
     62c:	f822                	sd	s0,48(sp)
     62e:	0080                	addi	s0,sp,64
     630:	87aa                	mv	a5,a0
     632:	8736                	mv	a4,a3
     634:	fcf42623          	sw	a5,-52(s0)
     638:	87ae                	mv	a5,a1
     63a:	fcf42423          	sw	a5,-56(s0)
     63e:	87b2                	mv	a5,a2
     640:	fcf42223          	sw	a5,-60(s0)
     644:	87ba                	mv	a5,a4
     646:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     64a:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     64e:	fc042783          	lw	a5,-64(s0)
     652:	2781                	sext.w	a5,a5
     654:	c38d                	beqz	a5,676 <printint+0x4e>
     656:	fc842783          	lw	a5,-56(s0)
     65a:	2781                	sext.w	a5,a5
     65c:	0007dd63          	bgez	a5,676 <printint+0x4e>
    neg = 1;
     660:	4785                	li	a5,1
     662:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     666:	fc842783          	lw	a5,-56(s0)
     66a:	40f007bb          	negw	a5,a5
     66e:	2781                	sext.w	a5,a5
     670:	fef42223          	sw	a5,-28(s0)
     674:	a029                	j	67e <printint+0x56>
  } else {
    x = xx;
     676:	fc842783          	lw	a5,-56(s0)
     67a:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     67e:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     682:	fc442783          	lw	a5,-60(s0)
     686:	fe442703          	lw	a4,-28(s0)
     68a:	02f777bb          	remuw	a5,a4,a5
     68e:	0007861b          	sext.w	a2,a5
     692:	fec42783          	lw	a5,-20(s0)
     696:	0017871b          	addiw	a4,a5,1
     69a:	fee42623          	sw	a4,-20(s0)
     69e:	00001697          	auipc	a3,0x1
     6a2:	23268693          	addi	a3,a3,562 # 18d0 <digits>
     6a6:	02061713          	slli	a4,a2,0x20
     6aa:	9301                	srli	a4,a4,0x20
     6ac:	9736                	add	a4,a4,a3
     6ae:	00074703          	lbu	a4,0(a4)
     6b2:	ff040693          	addi	a3,s0,-16
     6b6:	97b6                	add	a5,a5,a3
     6b8:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     6bc:	fc442783          	lw	a5,-60(s0)
     6c0:	fe442703          	lw	a4,-28(s0)
     6c4:	02f757bb          	divuw	a5,a4,a5
     6c8:	fef42223          	sw	a5,-28(s0)
     6cc:	fe442783          	lw	a5,-28(s0)
     6d0:	2781                	sext.w	a5,a5
     6d2:	fbc5                	bnez	a5,682 <printint+0x5a>
  if(neg)
     6d4:	fe842783          	lw	a5,-24(s0)
     6d8:	2781                	sext.w	a5,a5
     6da:	cf95                	beqz	a5,716 <printint+0xee>
    buf[i++] = '-';
     6dc:	fec42783          	lw	a5,-20(s0)
     6e0:	0017871b          	addiw	a4,a5,1
     6e4:	fee42623          	sw	a4,-20(s0)
     6e8:	ff040713          	addi	a4,s0,-16
     6ec:	97ba                	add	a5,a5,a4
     6ee:	02d00713          	li	a4,45
     6f2:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6f6:	a005                	j	716 <printint+0xee>
    putc(fd, buf[i]);
     6f8:	fec42783          	lw	a5,-20(s0)
     6fc:	ff040713          	addi	a4,s0,-16
     700:	97ba                	add	a5,a5,a4
     702:	fe07c703          	lbu	a4,-32(a5)
     706:	fcc42783          	lw	a5,-52(s0)
     70a:	85ba                	mv	a1,a4
     70c:	853e                	mv	a0,a5
     70e:	00000097          	auipc	ra,0x0
     712:	ee4080e7          	jalr	-284(ra) # 5f2 <putc>
  while(--i >= 0)
     716:	fec42783          	lw	a5,-20(s0)
     71a:	37fd                	addiw	a5,a5,-1
     71c:	fef42623          	sw	a5,-20(s0)
     720:	fec42783          	lw	a5,-20(s0)
     724:	2781                	sext.w	a5,a5
     726:	fc07d9e3          	bgez	a5,6f8 <printint+0xd0>
}
     72a:	0001                	nop
     72c:	0001                	nop
     72e:	70e2                	ld	ra,56(sp)
     730:	7442                	ld	s0,48(sp)
     732:	6121                	addi	sp,sp,64
     734:	8082                	ret

0000000000000736 <printptr>:

static void
printptr(int fd, uint64 x) {
     736:	7179                	addi	sp,sp,-48
     738:	f406                	sd	ra,40(sp)
     73a:	f022                	sd	s0,32(sp)
     73c:	1800                	addi	s0,sp,48
     73e:	87aa                	mv	a5,a0
     740:	fcb43823          	sd	a1,-48(s0)
     744:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     748:	fdc42783          	lw	a5,-36(s0)
     74c:	03000593          	li	a1,48
     750:	853e                	mv	a0,a5
     752:	00000097          	auipc	ra,0x0
     756:	ea0080e7          	jalr	-352(ra) # 5f2 <putc>
  putc(fd, 'x');
     75a:	fdc42783          	lw	a5,-36(s0)
     75e:	07800593          	li	a1,120
     762:	853e                	mv	a0,a5
     764:	00000097          	auipc	ra,0x0
     768:	e8e080e7          	jalr	-370(ra) # 5f2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     76c:	fe042623          	sw	zero,-20(s0)
     770:	a82d                	j	7aa <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     772:	fd043783          	ld	a5,-48(s0)
     776:	93f1                	srli	a5,a5,0x3c
     778:	00001717          	auipc	a4,0x1
     77c:	15870713          	addi	a4,a4,344 # 18d0 <digits>
     780:	97ba                	add	a5,a5,a4
     782:	0007c703          	lbu	a4,0(a5)
     786:	fdc42783          	lw	a5,-36(s0)
     78a:	85ba                	mv	a1,a4
     78c:	853e                	mv	a0,a5
     78e:	00000097          	auipc	ra,0x0
     792:	e64080e7          	jalr	-412(ra) # 5f2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     796:	fec42783          	lw	a5,-20(s0)
     79a:	2785                	addiw	a5,a5,1
     79c:	fef42623          	sw	a5,-20(s0)
     7a0:	fd043783          	ld	a5,-48(s0)
     7a4:	0792                	slli	a5,a5,0x4
     7a6:	fcf43823          	sd	a5,-48(s0)
     7aa:	fec42783          	lw	a5,-20(s0)
     7ae:	873e                	mv	a4,a5
     7b0:	47bd                	li	a5,15
     7b2:	fce7f0e3          	bgeu	a5,a4,772 <printptr+0x3c>
}
     7b6:	0001                	nop
     7b8:	0001                	nop
     7ba:	70a2                	ld	ra,40(sp)
     7bc:	7402                	ld	s0,32(sp)
     7be:	6145                	addi	sp,sp,48
     7c0:	8082                	ret

00000000000007c2 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7c2:	715d                	addi	sp,sp,-80
     7c4:	e486                	sd	ra,72(sp)
     7c6:	e0a2                	sd	s0,64(sp)
     7c8:	0880                	addi	s0,sp,80
     7ca:	87aa                	mv	a5,a0
     7cc:	fcb43023          	sd	a1,-64(s0)
     7d0:	fac43c23          	sd	a2,-72(s0)
     7d4:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7d8:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7dc:	fe042223          	sw	zero,-28(s0)
     7e0:	a42d                	j	a0a <vprintf+0x248>
    c = fmt[i] & 0xff;
     7e2:	fe442783          	lw	a5,-28(s0)
     7e6:	fc043703          	ld	a4,-64(s0)
     7ea:	97ba                	add	a5,a5,a4
     7ec:	0007c783          	lbu	a5,0(a5)
     7f0:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7f4:	fe042783          	lw	a5,-32(s0)
     7f8:	2781                	sext.w	a5,a5
     7fa:	eb9d                	bnez	a5,830 <vprintf+0x6e>
      if(c == '%'){
     7fc:	fdc42783          	lw	a5,-36(s0)
     800:	0007871b          	sext.w	a4,a5
     804:	02500793          	li	a5,37
     808:	00f71763          	bne	a4,a5,816 <vprintf+0x54>
        state = '%';
     80c:	02500793          	li	a5,37
     810:	fef42023          	sw	a5,-32(s0)
     814:	a2f5                	j	a00 <vprintf+0x23e>
      } else {
        putc(fd, c);
     816:	fdc42783          	lw	a5,-36(s0)
     81a:	0ff7f713          	andi	a4,a5,255
     81e:	fcc42783          	lw	a5,-52(s0)
     822:	85ba                	mv	a1,a4
     824:	853e                	mv	a0,a5
     826:	00000097          	auipc	ra,0x0
     82a:	dcc080e7          	jalr	-564(ra) # 5f2 <putc>
     82e:	aac9                	j	a00 <vprintf+0x23e>
      }
    } else if(state == '%'){
     830:	fe042783          	lw	a5,-32(s0)
     834:	0007871b          	sext.w	a4,a5
     838:	02500793          	li	a5,37
     83c:	1cf71263          	bne	a4,a5,a00 <vprintf+0x23e>
      if(c == 'd'){
     840:	fdc42783          	lw	a5,-36(s0)
     844:	0007871b          	sext.w	a4,a5
     848:	06400793          	li	a5,100
     84c:	02f71463          	bne	a4,a5,874 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     850:	fb843783          	ld	a5,-72(s0)
     854:	00878713          	addi	a4,a5,8
     858:	fae43c23          	sd	a4,-72(s0)
     85c:	4398                	lw	a4,0(a5)
     85e:	fcc42783          	lw	a5,-52(s0)
     862:	4685                	li	a3,1
     864:	4629                	li	a2,10
     866:	85ba                	mv	a1,a4
     868:	853e                	mv	a0,a5
     86a:	00000097          	auipc	ra,0x0
     86e:	dbe080e7          	jalr	-578(ra) # 628 <printint>
     872:	a269                	j	9fc <vprintf+0x23a>
      } else if(c == 'l') {
     874:	fdc42783          	lw	a5,-36(s0)
     878:	0007871b          	sext.w	a4,a5
     87c:	06c00793          	li	a5,108
     880:	02f71663          	bne	a4,a5,8ac <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     884:	fb843783          	ld	a5,-72(s0)
     888:	00878713          	addi	a4,a5,8
     88c:	fae43c23          	sd	a4,-72(s0)
     890:	639c                	ld	a5,0(a5)
     892:	0007871b          	sext.w	a4,a5
     896:	fcc42783          	lw	a5,-52(s0)
     89a:	4681                	li	a3,0
     89c:	4629                	li	a2,10
     89e:	85ba                	mv	a1,a4
     8a0:	853e                	mv	a0,a5
     8a2:	00000097          	auipc	ra,0x0
     8a6:	d86080e7          	jalr	-634(ra) # 628 <printint>
     8aa:	aa89                	j	9fc <vprintf+0x23a>
      } else if(c == 'x') {
     8ac:	fdc42783          	lw	a5,-36(s0)
     8b0:	0007871b          	sext.w	a4,a5
     8b4:	07800793          	li	a5,120
     8b8:	02f71463          	bne	a4,a5,8e0 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     8bc:	fb843783          	ld	a5,-72(s0)
     8c0:	00878713          	addi	a4,a5,8
     8c4:	fae43c23          	sd	a4,-72(s0)
     8c8:	4398                	lw	a4,0(a5)
     8ca:	fcc42783          	lw	a5,-52(s0)
     8ce:	4681                	li	a3,0
     8d0:	4641                	li	a2,16
     8d2:	85ba                	mv	a1,a4
     8d4:	853e                	mv	a0,a5
     8d6:	00000097          	auipc	ra,0x0
     8da:	d52080e7          	jalr	-686(ra) # 628 <printint>
     8de:	aa39                	j	9fc <vprintf+0x23a>
      } else if(c == 'p') {
     8e0:	fdc42783          	lw	a5,-36(s0)
     8e4:	0007871b          	sext.w	a4,a5
     8e8:	07000793          	li	a5,112
     8ec:	02f71263          	bne	a4,a5,910 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8f0:	fb843783          	ld	a5,-72(s0)
     8f4:	00878713          	addi	a4,a5,8
     8f8:	fae43c23          	sd	a4,-72(s0)
     8fc:	6398                	ld	a4,0(a5)
     8fe:	fcc42783          	lw	a5,-52(s0)
     902:	85ba                	mv	a1,a4
     904:	853e                	mv	a0,a5
     906:	00000097          	auipc	ra,0x0
     90a:	e30080e7          	jalr	-464(ra) # 736 <printptr>
     90e:	a0fd                	j	9fc <vprintf+0x23a>
      } else if(c == 's'){
     910:	fdc42783          	lw	a5,-36(s0)
     914:	0007871b          	sext.w	a4,a5
     918:	07300793          	li	a5,115
     91c:	04f71c63          	bne	a4,a5,974 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     920:	fb843783          	ld	a5,-72(s0)
     924:	00878713          	addi	a4,a5,8
     928:	fae43c23          	sd	a4,-72(s0)
     92c:	639c                	ld	a5,0(a5)
     92e:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     932:	fe843783          	ld	a5,-24(s0)
     936:	eb8d                	bnez	a5,968 <vprintf+0x1a6>
          s = "(null)";
     938:	00001797          	auipc	a5,0x1
     93c:	f9078793          	addi	a5,a5,-112 # 18c8 <schedule_dm+0x2c2>
     940:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     944:	a015                	j	968 <vprintf+0x1a6>
          putc(fd, *s);
     946:	fe843783          	ld	a5,-24(s0)
     94a:	0007c703          	lbu	a4,0(a5)
     94e:	fcc42783          	lw	a5,-52(s0)
     952:	85ba                	mv	a1,a4
     954:	853e                	mv	a0,a5
     956:	00000097          	auipc	ra,0x0
     95a:	c9c080e7          	jalr	-868(ra) # 5f2 <putc>
          s++;
     95e:	fe843783          	ld	a5,-24(s0)
     962:	0785                	addi	a5,a5,1
     964:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     968:	fe843783          	ld	a5,-24(s0)
     96c:	0007c783          	lbu	a5,0(a5)
     970:	fbf9                	bnez	a5,946 <vprintf+0x184>
     972:	a069                	j	9fc <vprintf+0x23a>
        }
      } else if(c == 'c'){
     974:	fdc42783          	lw	a5,-36(s0)
     978:	0007871b          	sext.w	a4,a5
     97c:	06300793          	li	a5,99
     980:	02f71463          	bne	a4,a5,9a8 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     984:	fb843783          	ld	a5,-72(s0)
     988:	00878713          	addi	a4,a5,8
     98c:	fae43c23          	sd	a4,-72(s0)
     990:	439c                	lw	a5,0(a5)
     992:	0ff7f713          	andi	a4,a5,255
     996:	fcc42783          	lw	a5,-52(s0)
     99a:	85ba                	mv	a1,a4
     99c:	853e                	mv	a0,a5
     99e:	00000097          	auipc	ra,0x0
     9a2:	c54080e7          	jalr	-940(ra) # 5f2 <putc>
     9a6:	a899                	j	9fc <vprintf+0x23a>
      } else if(c == '%'){
     9a8:	fdc42783          	lw	a5,-36(s0)
     9ac:	0007871b          	sext.w	a4,a5
     9b0:	02500793          	li	a5,37
     9b4:	00f71f63          	bne	a4,a5,9d2 <vprintf+0x210>
        putc(fd, c);
     9b8:	fdc42783          	lw	a5,-36(s0)
     9bc:	0ff7f713          	andi	a4,a5,255
     9c0:	fcc42783          	lw	a5,-52(s0)
     9c4:	85ba                	mv	a1,a4
     9c6:	853e                	mv	a0,a5
     9c8:	00000097          	auipc	ra,0x0
     9cc:	c2a080e7          	jalr	-982(ra) # 5f2 <putc>
     9d0:	a035                	j	9fc <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9d2:	fcc42783          	lw	a5,-52(s0)
     9d6:	02500593          	li	a1,37
     9da:	853e                	mv	a0,a5
     9dc:	00000097          	auipc	ra,0x0
     9e0:	c16080e7          	jalr	-1002(ra) # 5f2 <putc>
        putc(fd, c);
     9e4:	fdc42783          	lw	a5,-36(s0)
     9e8:	0ff7f713          	andi	a4,a5,255
     9ec:	fcc42783          	lw	a5,-52(s0)
     9f0:	85ba                	mv	a1,a4
     9f2:	853e                	mv	a0,a5
     9f4:	00000097          	auipc	ra,0x0
     9f8:	bfe080e7          	jalr	-1026(ra) # 5f2 <putc>
      }
      state = 0;
     9fc:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a00:	fe442783          	lw	a5,-28(s0)
     a04:	2785                	addiw	a5,a5,1
     a06:	fef42223          	sw	a5,-28(s0)
     a0a:	fe442783          	lw	a5,-28(s0)
     a0e:	fc043703          	ld	a4,-64(s0)
     a12:	97ba                	add	a5,a5,a4
     a14:	0007c783          	lbu	a5,0(a5)
     a18:	dc0795e3          	bnez	a5,7e2 <vprintf+0x20>
    }
  }
}
     a1c:	0001                	nop
     a1e:	0001                	nop
     a20:	60a6                	ld	ra,72(sp)
     a22:	6406                	ld	s0,64(sp)
     a24:	6161                	addi	sp,sp,80
     a26:	8082                	ret

0000000000000a28 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a28:	7159                	addi	sp,sp,-112
     a2a:	fc06                	sd	ra,56(sp)
     a2c:	f822                	sd	s0,48(sp)
     a2e:	0080                	addi	s0,sp,64
     a30:	fcb43823          	sd	a1,-48(s0)
     a34:	e010                	sd	a2,0(s0)
     a36:	e414                	sd	a3,8(s0)
     a38:	e818                	sd	a4,16(s0)
     a3a:	ec1c                	sd	a5,24(s0)
     a3c:	03043023          	sd	a6,32(s0)
     a40:	03143423          	sd	a7,40(s0)
     a44:	87aa                	mv	a5,a0
     a46:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a4a:	03040793          	addi	a5,s0,48
     a4e:	fcf43423          	sd	a5,-56(s0)
     a52:	fc843783          	ld	a5,-56(s0)
     a56:	fd078793          	addi	a5,a5,-48
     a5a:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a5e:	fe843703          	ld	a4,-24(s0)
     a62:	fdc42783          	lw	a5,-36(s0)
     a66:	863a                	mv	a2,a4
     a68:	fd043583          	ld	a1,-48(s0)
     a6c:	853e                	mv	a0,a5
     a6e:	00000097          	auipc	ra,0x0
     a72:	d54080e7          	jalr	-684(ra) # 7c2 <vprintf>
}
     a76:	0001                	nop
     a78:	70e2                	ld	ra,56(sp)
     a7a:	7442                	ld	s0,48(sp)
     a7c:	6165                	addi	sp,sp,112
     a7e:	8082                	ret

0000000000000a80 <printf>:

void
printf(const char *fmt, ...)
{
     a80:	7159                	addi	sp,sp,-112
     a82:	f406                	sd	ra,40(sp)
     a84:	f022                	sd	s0,32(sp)
     a86:	1800                	addi	s0,sp,48
     a88:	fca43c23          	sd	a0,-40(s0)
     a8c:	e40c                	sd	a1,8(s0)
     a8e:	e810                	sd	a2,16(s0)
     a90:	ec14                	sd	a3,24(s0)
     a92:	f018                	sd	a4,32(s0)
     a94:	f41c                	sd	a5,40(s0)
     a96:	03043823          	sd	a6,48(s0)
     a9a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a9e:	04040793          	addi	a5,s0,64
     aa2:	fcf43823          	sd	a5,-48(s0)
     aa6:	fd043783          	ld	a5,-48(s0)
     aaa:	fc878793          	addi	a5,a5,-56
     aae:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     ab2:	fe843783          	ld	a5,-24(s0)
     ab6:	863e                	mv	a2,a5
     ab8:	fd843583          	ld	a1,-40(s0)
     abc:	4505                	li	a0,1
     abe:	00000097          	auipc	ra,0x0
     ac2:	d04080e7          	jalr	-764(ra) # 7c2 <vprintf>
}
     ac6:	0001                	nop
     ac8:	70a2                	ld	ra,40(sp)
     aca:	7402                	ld	s0,32(sp)
     acc:	6165                	addi	sp,sp,112
     ace:	8082                	ret

0000000000000ad0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ad0:	7179                	addi	sp,sp,-48
     ad2:	f422                	sd	s0,40(sp)
     ad4:	1800                	addi	s0,sp,48
     ad6:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     ada:	fd843783          	ld	a5,-40(s0)
     ade:	17c1                	addi	a5,a5,-16
     ae0:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ae4:	00001797          	auipc	a5,0x1
     ae8:	e1478793          	addi	a5,a5,-492 # 18f8 <freep>
     aec:	639c                	ld	a5,0(a5)
     aee:	fef43423          	sd	a5,-24(s0)
     af2:	a815                	j	b26 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     af4:	fe843783          	ld	a5,-24(s0)
     af8:	639c                	ld	a5,0(a5)
     afa:	fe843703          	ld	a4,-24(s0)
     afe:	00f76f63          	bltu	a4,a5,b1c <free+0x4c>
     b02:	fe043703          	ld	a4,-32(s0)
     b06:	fe843783          	ld	a5,-24(s0)
     b0a:	02e7eb63          	bltu	a5,a4,b40 <free+0x70>
     b0e:	fe843783          	ld	a5,-24(s0)
     b12:	639c                	ld	a5,0(a5)
     b14:	fe043703          	ld	a4,-32(s0)
     b18:	02f76463          	bltu	a4,a5,b40 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b1c:	fe843783          	ld	a5,-24(s0)
     b20:	639c                	ld	a5,0(a5)
     b22:	fef43423          	sd	a5,-24(s0)
     b26:	fe043703          	ld	a4,-32(s0)
     b2a:	fe843783          	ld	a5,-24(s0)
     b2e:	fce7f3e3          	bgeu	a5,a4,af4 <free+0x24>
     b32:	fe843783          	ld	a5,-24(s0)
     b36:	639c                	ld	a5,0(a5)
     b38:	fe043703          	ld	a4,-32(s0)
     b3c:	faf77ce3          	bgeu	a4,a5,af4 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b40:	fe043783          	ld	a5,-32(s0)
     b44:	479c                	lw	a5,8(a5)
     b46:	1782                	slli	a5,a5,0x20
     b48:	9381                	srli	a5,a5,0x20
     b4a:	0792                	slli	a5,a5,0x4
     b4c:	fe043703          	ld	a4,-32(s0)
     b50:	973e                	add	a4,a4,a5
     b52:	fe843783          	ld	a5,-24(s0)
     b56:	639c                	ld	a5,0(a5)
     b58:	02f71763          	bne	a4,a5,b86 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b5c:	fe043783          	ld	a5,-32(s0)
     b60:	4798                	lw	a4,8(a5)
     b62:	fe843783          	ld	a5,-24(s0)
     b66:	639c                	ld	a5,0(a5)
     b68:	479c                	lw	a5,8(a5)
     b6a:	9fb9                	addw	a5,a5,a4
     b6c:	0007871b          	sext.w	a4,a5
     b70:	fe043783          	ld	a5,-32(s0)
     b74:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b76:	fe843783          	ld	a5,-24(s0)
     b7a:	639c                	ld	a5,0(a5)
     b7c:	6398                	ld	a4,0(a5)
     b7e:	fe043783          	ld	a5,-32(s0)
     b82:	e398                	sd	a4,0(a5)
     b84:	a039                	j	b92 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b86:	fe843783          	ld	a5,-24(s0)
     b8a:	6398                	ld	a4,0(a5)
     b8c:	fe043783          	ld	a5,-32(s0)
     b90:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b92:	fe843783          	ld	a5,-24(s0)
     b96:	479c                	lw	a5,8(a5)
     b98:	1782                	slli	a5,a5,0x20
     b9a:	9381                	srli	a5,a5,0x20
     b9c:	0792                	slli	a5,a5,0x4
     b9e:	fe843703          	ld	a4,-24(s0)
     ba2:	97ba                	add	a5,a5,a4
     ba4:	fe043703          	ld	a4,-32(s0)
     ba8:	02f71563          	bne	a4,a5,bd2 <free+0x102>
    p->s.size += bp->s.size;
     bac:	fe843783          	ld	a5,-24(s0)
     bb0:	4798                	lw	a4,8(a5)
     bb2:	fe043783          	ld	a5,-32(s0)
     bb6:	479c                	lw	a5,8(a5)
     bb8:	9fb9                	addw	a5,a5,a4
     bba:	0007871b          	sext.w	a4,a5
     bbe:	fe843783          	ld	a5,-24(s0)
     bc2:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     bc4:	fe043783          	ld	a5,-32(s0)
     bc8:	6398                	ld	a4,0(a5)
     bca:	fe843783          	ld	a5,-24(s0)
     bce:	e398                	sd	a4,0(a5)
     bd0:	a031                	j	bdc <free+0x10c>
  } else
    p->s.ptr = bp;
     bd2:	fe843783          	ld	a5,-24(s0)
     bd6:	fe043703          	ld	a4,-32(s0)
     bda:	e398                	sd	a4,0(a5)
  freep = p;
     bdc:	00001797          	auipc	a5,0x1
     be0:	d1c78793          	addi	a5,a5,-740 # 18f8 <freep>
     be4:	fe843703          	ld	a4,-24(s0)
     be8:	e398                	sd	a4,0(a5)
}
     bea:	0001                	nop
     bec:	7422                	ld	s0,40(sp)
     bee:	6145                	addi	sp,sp,48
     bf0:	8082                	ret

0000000000000bf2 <morecore>:

static Header*
morecore(uint nu)
{
     bf2:	7179                	addi	sp,sp,-48
     bf4:	f406                	sd	ra,40(sp)
     bf6:	f022                	sd	s0,32(sp)
     bf8:	1800                	addi	s0,sp,48
     bfa:	87aa                	mv	a5,a0
     bfc:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c00:	fdc42783          	lw	a5,-36(s0)
     c04:	0007871b          	sext.w	a4,a5
     c08:	6785                	lui	a5,0x1
     c0a:	00f77563          	bgeu	a4,a5,c14 <morecore+0x22>
    nu = 4096;
     c0e:	6785                	lui	a5,0x1
     c10:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c14:	fdc42783          	lw	a5,-36(s0)
     c18:	0047979b          	slliw	a5,a5,0x4
     c1c:	2781                	sext.w	a5,a5
     c1e:	2781                	sext.w	a5,a5
     c20:	853e                	mv	a0,a5
     c22:	00000097          	auipc	ra,0x0
     c26:	9a0080e7          	jalr	-1632(ra) # 5c2 <sbrk>
     c2a:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c2e:	fe843703          	ld	a4,-24(s0)
     c32:	57fd                	li	a5,-1
     c34:	00f71463          	bne	a4,a5,c3c <morecore+0x4a>
    return 0;
     c38:	4781                	li	a5,0
     c3a:	a03d                	j	c68 <morecore+0x76>
  hp = (Header*)p;
     c3c:	fe843783          	ld	a5,-24(s0)
     c40:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c44:	fe043783          	ld	a5,-32(s0)
     c48:	fdc42703          	lw	a4,-36(s0)
     c4c:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c4e:	fe043783          	ld	a5,-32(s0)
     c52:	07c1                	addi	a5,a5,16
     c54:	853e                	mv	a0,a5
     c56:	00000097          	auipc	ra,0x0
     c5a:	e7a080e7          	jalr	-390(ra) # ad0 <free>
  return freep;
     c5e:	00001797          	auipc	a5,0x1
     c62:	c9a78793          	addi	a5,a5,-870 # 18f8 <freep>
     c66:	639c                	ld	a5,0(a5)
}
     c68:	853e                	mv	a0,a5
     c6a:	70a2                	ld	ra,40(sp)
     c6c:	7402                	ld	s0,32(sp)
     c6e:	6145                	addi	sp,sp,48
     c70:	8082                	ret

0000000000000c72 <malloc>:

void*
malloc(uint nbytes)
{
     c72:	7139                	addi	sp,sp,-64
     c74:	fc06                	sd	ra,56(sp)
     c76:	f822                	sd	s0,48(sp)
     c78:	0080                	addi	s0,sp,64
     c7a:	87aa                	mv	a5,a0
     c7c:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c80:	fcc46783          	lwu	a5,-52(s0)
     c84:	07bd                	addi	a5,a5,15
     c86:	8391                	srli	a5,a5,0x4
     c88:	2781                	sext.w	a5,a5
     c8a:	2785                	addiw	a5,a5,1
     c8c:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c90:	00001797          	auipc	a5,0x1
     c94:	c6878793          	addi	a5,a5,-920 # 18f8 <freep>
     c98:	639c                	ld	a5,0(a5)
     c9a:	fef43023          	sd	a5,-32(s0)
     c9e:	fe043783          	ld	a5,-32(s0)
     ca2:	ef95                	bnez	a5,cde <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     ca4:	00001797          	auipc	a5,0x1
     ca8:	c4478793          	addi	a5,a5,-956 # 18e8 <base>
     cac:	fef43023          	sd	a5,-32(s0)
     cb0:	00001797          	auipc	a5,0x1
     cb4:	c4878793          	addi	a5,a5,-952 # 18f8 <freep>
     cb8:	fe043703          	ld	a4,-32(s0)
     cbc:	e398                	sd	a4,0(a5)
     cbe:	00001797          	auipc	a5,0x1
     cc2:	c3a78793          	addi	a5,a5,-966 # 18f8 <freep>
     cc6:	6398                	ld	a4,0(a5)
     cc8:	00001797          	auipc	a5,0x1
     ccc:	c2078793          	addi	a5,a5,-992 # 18e8 <base>
     cd0:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     cd2:	00001797          	auipc	a5,0x1
     cd6:	c1678793          	addi	a5,a5,-1002 # 18e8 <base>
     cda:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     cde:	fe043783          	ld	a5,-32(s0)
     ce2:	639c                	ld	a5,0(a5)
     ce4:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     ce8:	fe843783          	ld	a5,-24(s0)
     cec:	4798                	lw	a4,8(a5)
     cee:	fdc42783          	lw	a5,-36(s0)
     cf2:	2781                	sext.w	a5,a5
     cf4:	06f76863          	bltu	a4,a5,d64 <malloc+0xf2>
      if(p->s.size == nunits)
     cf8:	fe843783          	ld	a5,-24(s0)
     cfc:	4798                	lw	a4,8(a5)
     cfe:	fdc42783          	lw	a5,-36(s0)
     d02:	2781                	sext.w	a5,a5
     d04:	00e79963          	bne	a5,a4,d16 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d08:	fe843783          	ld	a5,-24(s0)
     d0c:	6398                	ld	a4,0(a5)
     d0e:	fe043783          	ld	a5,-32(s0)
     d12:	e398                	sd	a4,0(a5)
     d14:	a82d                	j	d4e <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d16:	fe843783          	ld	a5,-24(s0)
     d1a:	4798                	lw	a4,8(a5)
     d1c:	fdc42783          	lw	a5,-36(s0)
     d20:	40f707bb          	subw	a5,a4,a5
     d24:	0007871b          	sext.w	a4,a5
     d28:	fe843783          	ld	a5,-24(s0)
     d2c:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d2e:	fe843783          	ld	a5,-24(s0)
     d32:	479c                	lw	a5,8(a5)
     d34:	1782                	slli	a5,a5,0x20
     d36:	9381                	srli	a5,a5,0x20
     d38:	0792                	slli	a5,a5,0x4
     d3a:	fe843703          	ld	a4,-24(s0)
     d3e:	97ba                	add	a5,a5,a4
     d40:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d44:	fe843783          	ld	a5,-24(s0)
     d48:	fdc42703          	lw	a4,-36(s0)
     d4c:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d4e:	00001797          	auipc	a5,0x1
     d52:	baa78793          	addi	a5,a5,-1110 # 18f8 <freep>
     d56:	fe043703          	ld	a4,-32(s0)
     d5a:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d5c:	fe843783          	ld	a5,-24(s0)
     d60:	07c1                	addi	a5,a5,16
     d62:	a091                	j	da6 <malloc+0x134>
    }
    if(p == freep)
     d64:	00001797          	auipc	a5,0x1
     d68:	b9478793          	addi	a5,a5,-1132 # 18f8 <freep>
     d6c:	639c                	ld	a5,0(a5)
     d6e:	fe843703          	ld	a4,-24(s0)
     d72:	02f71063          	bne	a4,a5,d92 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d76:	fdc42783          	lw	a5,-36(s0)
     d7a:	853e                	mv	a0,a5
     d7c:	00000097          	auipc	ra,0x0
     d80:	e76080e7          	jalr	-394(ra) # bf2 <morecore>
     d84:	fea43423          	sd	a0,-24(s0)
     d88:	fe843783          	ld	a5,-24(s0)
     d8c:	e399                	bnez	a5,d92 <malloc+0x120>
        return 0;
     d8e:	4781                	li	a5,0
     d90:	a819                	j	da6 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d92:	fe843783          	ld	a5,-24(s0)
     d96:	fef43023          	sd	a5,-32(s0)
     d9a:	fe843783          	ld	a5,-24(s0)
     d9e:	639c                	ld	a5,0(a5)
     da0:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     da4:	b791                	j	ce8 <malloc+0x76>
  }
}
     da6:	853e                	mv	a0,a5
     da8:	70e2                	ld	ra,56(sp)
     daa:	7442                	ld	s0,48(sp)
     dac:	6121                	addi	sp,sp,64
     dae:	8082                	ret

0000000000000db0 <setjmp>:
     db0:	e100                	sd	s0,0(a0)
     db2:	e504                	sd	s1,8(a0)
     db4:	01253823          	sd	s2,16(a0)
     db8:	01353c23          	sd	s3,24(a0)
     dbc:	03453023          	sd	s4,32(a0)
     dc0:	03553423          	sd	s5,40(a0)
     dc4:	03653823          	sd	s6,48(a0)
     dc8:	03753c23          	sd	s7,56(a0)
     dcc:	05853023          	sd	s8,64(a0)
     dd0:	05953423          	sd	s9,72(a0)
     dd4:	05a53823          	sd	s10,80(a0)
     dd8:	05b53c23          	sd	s11,88(a0)
     ddc:	06153023          	sd	ra,96(a0)
     de0:	06253423          	sd	sp,104(a0)
     de4:	4501                	li	a0,0
     de6:	8082                	ret

0000000000000de8 <longjmp>:
     de8:	6100                	ld	s0,0(a0)
     dea:	6504                	ld	s1,8(a0)
     dec:	01053903          	ld	s2,16(a0)
     df0:	01853983          	ld	s3,24(a0)
     df4:	02053a03          	ld	s4,32(a0)
     df8:	02853a83          	ld	s5,40(a0)
     dfc:	03053b03          	ld	s6,48(a0)
     e00:	03853b83          	ld	s7,56(a0)
     e04:	04053c03          	ld	s8,64(a0)
     e08:	04853c83          	ld	s9,72(a0)
     e0c:	05053d03          	ld	s10,80(a0)
     e10:	05853d83          	ld	s11,88(a0)
     e14:	06053083          	ld	ra,96(a0)
     e18:	06853103          	ld	sp,104(a0)
     e1c:	c199                	beqz	a1,e22 <longjmp_1>
     e1e:	852e                	mv	a0,a1
     e20:	8082                	ret

0000000000000e22 <longjmp_1>:
     e22:	4505                	li	a0,1
     e24:	8082                	ret

0000000000000e26 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     e26:	1101                	addi	sp,sp,-32
     e28:	ec22                	sd	s0,24(sp)
     e2a:	1000                	addi	s0,sp,32
     e2c:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     e30:	fe843783          	ld	a5,-24(s0)
     e34:	639c                	ld	a5,0(a5)
     e36:	fe843703          	ld	a4,-24(s0)
     e3a:	40f707b3          	sub	a5,a4,a5
     e3e:	0017b793          	seqz	a5,a5
     e42:	0ff7f793          	andi	a5,a5,255
     e46:	2781                	sext.w	a5,a5
}
     e48:	853e                	mv	a0,a5
     e4a:	6462                	ld	s0,24(sp)
     e4c:	6105                	addi	sp,sp,32
     e4e:	8082                	ret

0000000000000e50 <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
     e50:	715d                	addi	sp,sp,-80
     e52:	e4a2                	sd	s0,72(sp)
     e54:	e0a6                	sd	s1,64(sp)
     e56:	0880                	addi	s0,sp,80
     e58:	84aa                	mv	s1,a0
    int sleep_time = -1;
     e5a:	57fd                	li	a5,-1
     e5c:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
     e60:	689c                	ld	a5,16(s1)
     e62:	639c                	ld	a5,0(a5)
     e64:	fcf43c23          	sd	a5,-40(s0)
     e68:	fd843783          	ld	a5,-40(s0)
     e6c:	17e1                	addi	a5,a5,-8
     e6e:	fef43023          	sd	a5,-32(s0)
     e72:	a0a9                	j	ebc <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
     e74:	fec42783          	lw	a5,-20(s0)
     e78:	2781                	sext.w	a5,a5
     e7a:	0007cf63          	bltz	a5,e98 <fill_sparse+0x48>
     e7e:	fe043783          	ld	a5,-32(s0)
     e82:	4f98                	lw	a4,24(a5)
     e84:	409c                	lw	a5,0(s1)
     e86:	40f707bb          	subw	a5,a4,a5
     e8a:	0007871b          	sext.w	a4,a5
     e8e:	fec42783          	lw	a5,-20(s0)
     e92:	2781                	sext.w	a5,a5
     e94:	00f75a63          	bge	a4,a5,ea8 <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
     e98:	fe043783          	ld	a5,-32(s0)
     e9c:	4f98                	lw	a4,24(a5)
     e9e:	409c                	lw	a5,0(s1)
     ea0:	40f707bb          	subw	a5,a4,a5
     ea4:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
     ea8:	fe043783          	ld	a5,-32(s0)
     eac:	679c                	ld	a5,8(a5)
     eae:	fcf43823          	sd	a5,-48(s0)
     eb2:	fd043783          	ld	a5,-48(s0)
     eb6:	17e1                	addi	a5,a5,-8
     eb8:	fef43023          	sd	a5,-32(s0)
     ebc:	fe043783          	ld	a5,-32(s0)
     ec0:	00878713          	addi	a4,a5,8
     ec4:	689c                	ld	a5,16(s1)
     ec6:	faf717e3          	bne	a4,a5,e74 <fill_sparse+0x24>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = args.run_queue;
     eca:	649c                	ld	a5,8(s1)
     ecc:	faf43823          	sd	a5,-80(s0)
    r.allocated_time = sleep_time;
     ed0:	fec42783          	lw	a5,-20(s0)
     ed4:	faf42c23          	sw	a5,-72(s0)
    return r;    
     ed8:	fb043783          	ld	a5,-80(s0)
     edc:	fcf43023          	sd	a5,-64(s0)
     ee0:	fb843783          	ld	a5,-72(s0)
     ee4:	fcf43423          	sd	a5,-56(s0)
     ee8:	4701                	li	a4,0
     eea:	fc043703          	ld	a4,-64(s0)
     eee:	4781                	li	a5,0
     ef0:	fc843783          	ld	a5,-56(s0)
     ef4:	863a                	mv	a2,a4
     ef6:	86be                	mv	a3,a5
     ef8:	8732                	mv	a4,a2
     efa:	87b6                	mv	a5,a3
}
     efc:	853a                	mv	a0,a4
     efe:	85be                	mv	a1,a5
     f00:	6426                	ld	s0,72(sp)
     f02:	6486                	ld	s1,64(sp)
     f04:	6161                	addi	sp,sp,80
     f06:	8082                	ret

0000000000000f08 <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
     f08:	715d                	addi	sp,sp,-80
     f0a:	e4a2                	sd	s0,72(sp)
     f0c:	e0a6                	sd	s1,64(sp)
     f0e:	0880                	addi	s0,sp,80
     f10:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
     f12:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
     f16:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     f1a:	649c                	ld	a5,8(s1)
     f1c:	639c                	ld	a5,0(a5)
     f1e:	fcf43c23          	sd	a5,-40(s0)
     f22:	fd843783          	ld	a5,-40(s0)
     f26:	fd878793          	addi	a5,a5,-40
     f2a:	fef43023          	sd	a5,-32(s0)
     f2e:	a81d                	j	f64 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
     f30:	fe843783          	ld	a5,-24(s0)
     f34:	cb89                	beqz	a5,f46 <schedule_default+0x3e>
     f36:	fe043783          	ld	a5,-32(s0)
     f3a:	5fd8                	lw	a4,60(a5)
     f3c:	fe843783          	ld	a5,-24(s0)
     f40:	5fdc                	lw	a5,60(a5)
     f42:	00f75663          	bge	a4,a5,f4e <schedule_default+0x46>
            thread_with_smallest_id = th;
     f46:	fe043783          	ld	a5,-32(s0)
     f4a:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     f4e:	fe043783          	ld	a5,-32(s0)
     f52:	779c                	ld	a5,40(a5)
     f54:	fcf43823          	sd	a5,-48(s0)
     f58:	fd043783          	ld	a5,-48(s0)
     f5c:	fd878793          	addi	a5,a5,-40
     f60:	fef43023          	sd	a5,-32(s0)
     f64:	fe043783          	ld	a5,-32(s0)
     f68:	02878713          	addi	a4,a5,40
     f6c:	649c                	ld	a5,8(s1)
     f6e:	fcf711e3          	bne	a4,a5,f30 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
     f72:	fe843783          	ld	a5,-24(s0)
     f76:	cf89                	beqz	a5,f90 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
     f78:	fe843783          	ld	a5,-24(s0)
     f7c:	02878793          	addi	a5,a5,40
     f80:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
     f84:	fe843783          	ld	a5,-24(s0)
     f88:	4fbc                	lw	a5,88(a5)
     f8a:	faf42c23          	sw	a5,-72(s0)
     f8e:	a039                	j	f9c <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
     f90:	649c                	ld	a5,8(s1)
     f92:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
     f96:	4785                	li	a5,1
     f98:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
     f9c:	fb043783          	ld	a5,-80(s0)
     fa0:	fcf43023          	sd	a5,-64(s0)
     fa4:	fb843783          	ld	a5,-72(s0)
     fa8:	fcf43423          	sd	a5,-56(s0)
     fac:	4701                	li	a4,0
     fae:	fc043703          	ld	a4,-64(s0)
     fb2:	4781                	li	a5,0
     fb4:	fc843783          	ld	a5,-56(s0)
     fb8:	863a                	mv	a2,a4
     fba:	86be                	mv	a3,a5
     fbc:	8732                	mv	a4,a2
     fbe:	87b6                	mv	a5,a3
}
     fc0:	853a                	mv	a0,a4
     fc2:	85be                	mv	a1,a5
     fc4:	6426                	ld	s0,72(sp)
     fc6:	6486                	ld	s1,64(sp)
     fc8:	6161                	addi	sp,sp,80
     fca:	8082                	ret

0000000000000fcc <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
     fcc:	7135                	addi	sp,sp,-160
     fce:	ed06                	sd	ra,152(sp)
     fd0:	e922                	sd	s0,144(sp)
     fd2:	e526                	sd	s1,136(sp)
     fd4:	e14a                	sd	s2,128(sp)
     fd6:	fcce                	sd	s3,120(sp)
     fd8:	1100                	addi	s0,sp,160
     fda:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
     fdc:	649c                	ld	a5,8(s1)
     fde:	853e                	mv	a0,a5
     fe0:	00000097          	auipc	ra,0x0
     fe4:	e46080e7          	jalr	-442(ra) # e26 <list_empty>
     fe8:	87aa                	mv	a5,a0
     fea:	cb85                	beqz	a5,101a <schedule_wrr+0x4e>
        return fill_sparse(args);
     fec:	609c                	ld	a5,0(s1)
     fee:	f6f43023          	sd	a5,-160(s0)
     ff2:	649c                	ld	a5,8(s1)
     ff4:	f6f43423          	sd	a5,-152(s0)
     ff8:	689c                	ld	a5,16(s1)
     ffa:	f6f43823          	sd	a5,-144(s0)
     ffe:	f6040793          	addi	a5,s0,-160
    1002:	853e                	mv	a0,a5
    1004:	00000097          	auipc	ra,0x0
    1008:	e4c080e7          	jalr	-436(ra) # e50 <fill_sparse>
    100c:	872a                	mv	a4,a0
    100e:	87ae                	mv	a5,a1
    1010:	f8e43823          	sd	a4,-112(s0)
    1014:	f8f43c23          	sd	a5,-104(s0)
    1018:	a0c9                	j	10da <schedule_wrr+0x10e>

    struct thread *process_thread = NULL;
    101a:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    101e:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1022:	649c                	ld	a5,8(s1)
    1024:	639c                	ld	a5,0(a5)
    1026:	faf43823          	sd	a5,-80(s0)
    102a:	fb043783          	ld	a5,-80(s0)
    102e:	fd878793          	addi	a5,a5,-40
    1032:	fcf43023          	sd	a5,-64(s0)
    1036:	a025                	j	105e <schedule_wrr+0x92>
        if (process_thread == NULL) {
    1038:	fc843783          	ld	a5,-56(s0)
    103c:	e791                	bnez	a5,1048 <schedule_wrr+0x7c>
            process_thread = th;
    103e:	fc043783          	ld	a5,-64(s0)
    1042:	fcf43423          	sd	a5,-56(s0)
            break;
    1046:	a01d                	j	106c <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
    1048:	fc043783          	ld	a5,-64(s0)
    104c:	779c                	ld	a5,40(a5)
    104e:	faf43423          	sd	a5,-88(s0)
    1052:	fa843783          	ld	a5,-88(s0)
    1056:	fd878793          	addi	a5,a5,-40
    105a:	fcf43023          	sd	a5,-64(s0)
    105e:	fc043783          	ld	a5,-64(s0)
    1062:	02878713          	addi	a4,a5,40
    1066:	649c                	ld	a5,8(s1)
    1068:	fcf718e3          	bne	a4,a5,1038 <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
    106c:	40dc                	lw	a5,4(s1)
    106e:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
    1072:	fc843783          	ld	a5,-56(s0)
    1076:	4fbc                	lw	a5,88(a5)
    1078:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    107c:	fc843783          	ld	a5,-56(s0)
    1080:	4fb4                	lw	a3,88(a5)
    1082:	fc843783          	ld	a5,-56(s0)
    1086:	47bc                	lw	a5,72(a5)
    1088:	fa442703          	lw	a4,-92(s0)
    108c:	02f707bb          	mulw	a5,a4,a5
    1090:	2781                	sext.w	a5,a5
    1092:	8736                	mv	a4,a3
    1094:	00e7dc63          	bge	a5,a4,10ac <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
    1098:	fc843783          	ld	a5,-56(s0)
    109c:	47bc                	lw	a5,72(a5)
    109e:	fa442703          	lw	a4,-92(s0)
    10a2:	02f707bb          	mulw	a5,a4,a5
    10a6:	faf42e23          	sw	a5,-68(s0)
    10aa:	a031                	j	10b6 <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    10ac:	fc843783          	ld	a5,-56(s0)
    10b0:	4fbc                	lw	a5,88(a5)
    10b2:	faf42e23          	sw	a5,-68(s0)
    }
    
    struct threads_sched_result r;
    r.scheduled_thread_list_member = &process_thread->thread_list;
    10b6:	fc843783          	ld	a5,-56(s0)
    10ba:	02878793          	addi	a5,a5,40
    10be:	f8f43023          	sd	a5,-128(s0)
    r.allocated_time = executing_time;
    10c2:	fbc42783          	lw	a5,-68(s0)
    10c6:	f8f42423          	sw	a5,-120(s0)
    return r;
    10ca:	f8043783          	ld	a5,-128(s0)
    10ce:	f8f43823          	sd	a5,-112(s0)
    10d2:	f8843783          	ld	a5,-120(s0)
    10d6:	f8f43c23          	sd	a5,-104(s0)
    10da:	4701                	li	a4,0
    10dc:	f9043703          	ld	a4,-112(s0)
    10e0:	4781                	li	a5,0
    10e2:	f9843783          	ld	a5,-104(s0)
    10e6:	893a                	mv	s2,a4
    10e8:	89be                	mv	s3,a5
    10ea:	874a                	mv	a4,s2
    10ec:	87ce                	mv	a5,s3
}
    10ee:	853a                	mv	a0,a4
    10f0:	85be                	mv	a1,a5
    10f2:	60ea                	ld	ra,152(sp)
    10f4:	644a                	ld	s0,144(sp)
    10f6:	64aa                	ld	s1,136(sp)
    10f8:	690a                	ld	s2,128(sp)
    10fa:	79e6                	ld	s3,120(sp)
    10fc:	610d                	addi	sp,sp,160
    10fe:	8082                	ret

0000000000001100 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    1100:	7131                	addi	sp,sp,-192
    1102:	fd06                	sd	ra,184(sp)
    1104:	f922                	sd	s0,176(sp)
    1106:	f526                	sd	s1,168(sp)
    1108:	f14a                	sd	s2,160(sp)
    110a:	ed4e                	sd	s3,152(sp)
    110c:	0180                	addi	s0,sp,192
    110e:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    1110:	649c                	ld	a5,8(s1)
    1112:	853e                	mv	a0,a5
    1114:	00000097          	auipc	ra,0x0
    1118:	d12080e7          	jalr	-750(ra) # e26 <list_empty>
    111c:	87aa                	mv	a5,a0
    111e:	cb85                	beqz	a5,114e <schedule_sjf+0x4e>
        return fill_sparse(args);
    1120:	609c                	ld	a5,0(s1)
    1122:	f4f43023          	sd	a5,-192(s0)
    1126:	649c                	ld	a5,8(s1)
    1128:	f4f43423          	sd	a5,-184(s0)
    112c:	689c                	ld	a5,16(s1)
    112e:	f4f43823          	sd	a5,-176(s0)
    1132:	f4040793          	addi	a5,s0,-192
    1136:	853e                	mv	a0,a5
    1138:	00000097          	auipc	ra,0x0
    113c:	d18080e7          	jalr	-744(ra) # e50 <fill_sparse>
    1140:	872a                	mv	a4,a0
    1142:	87ae                	mv	a5,a1
    1144:	f6e43c23          	sd	a4,-136(s0)
    1148:	f8f43023          	sd	a5,-128(s0)
    114c:	aa49                	j	12de <schedule_sjf+0x1de>

    int current_time = args.current_time;
    114e:	409c                	lw	a5,0(s1)
    1150:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    1154:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1158:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    115c:	649c                	ld	a5,8(s1)
    115e:	639c                	ld	a5,0(a5)
    1160:	faf43423          	sd	a5,-88(s0)
    1164:	fa843783          	ld	a5,-88(s0)
    1168:	fd878793          	addi	a5,a5,-40
    116c:	fcf43023          	sd	a5,-64(s0)
    1170:	a085                	j	11d0 <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    1172:	fc843783          	ld	a5,-56(s0)
    1176:	cb89                	beqz	a5,1188 <schedule_sjf+0x88>
    1178:	fc043783          	ld	a5,-64(s0)
    117c:	4fb8                	lw	a4,88(a5)
    117e:	fc843783          	ld	a5,-56(s0)
    1182:	4fbc                	lw	a5,88(a5)
    1184:	00f75763          	bge	a4,a5,1192 <schedule_sjf+0x92>
            shortest_thread = th;
    1188:	fc043783          	ld	a5,-64(s0)
    118c:	fcf43423          	sd	a5,-56(s0)
    1190:	a02d                	j	11ba <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    1192:	fc043783          	ld	a5,-64(s0)
    1196:	4fb8                	lw	a4,88(a5)
    1198:	fc843783          	ld	a5,-56(s0)
    119c:	4fbc                	lw	a5,88(a5)
    119e:	00f71e63          	bne	a4,a5,11ba <schedule_sjf+0xba>
    11a2:	fc043783          	ld	a5,-64(s0)
    11a6:	5fd8                	lw	a4,60(a5)
    11a8:	fc843783          	ld	a5,-56(s0)
    11ac:	5fdc                	lw	a5,60(a5)
    11ae:	00f75663          	bge	a4,a5,11ba <schedule_sjf+0xba>
            shortest_thread = th;
    11b2:	fc043783          	ld	a5,-64(s0)
    11b6:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    11ba:	fc043783          	ld	a5,-64(s0)
    11be:	779c                	ld	a5,40(a5)
    11c0:	f8f43423          	sd	a5,-120(s0)
    11c4:	f8843783          	ld	a5,-120(s0)
    11c8:	fd878793          	addi	a5,a5,-40
    11cc:	fcf43023          	sd	a5,-64(s0)
    11d0:	fc043783          	ld	a5,-64(s0)
    11d4:	02878713          	addi	a4,a5,40
    11d8:	649c                	ld	a5,8(s1)
    11da:	f8f71ce3          	bne	a4,a5,1172 <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    11de:	fc843783          	ld	a5,-56(s0)
    11e2:	4fbc                	lw	a5,88(a5)
    11e4:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    11e8:	689c                	ld	a5,16(s1)
    11ea:	639c                	ld	a5,0(a5)
    11ec:	faf43023          	sd	a5,-96(s0)
    11f0:	fa043783          	ld	a5,-96(s0)
    11f4:	17e1                	addi	a5,a5,-8
    11f6:	faf43c23          	sd	a5,-72(s0)
    11fa:	a84d                	j	12ac <schedule_sjf+0x1ac>
        int interval = cur->release_time - current_time;
    11fc:	fb843783          	ld	a5,-72(s0)
    1200:	4f98                	lw	a4,24(a5)
    1202:	fb042783          	lw	a5,-80(s0)
    1206:	40f707bb          	subw	a5,a4,a5
    120a:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    120e:	f9c42703          	lw	a4,-100(s0)
    1212:	fb442783          	lw	a5,-76(s0)
    1216:	2701                	sext.w	a4,a4
    1218:	2781                	sext.w	a5,a5
    121a:	06e7c863          	blt	a5,a4,128a <schedule_sjf+0x18a>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    121e:	fc843783          	ld	a5,-56(s0)
    1222:	4fbc                	lw	a5,88(a5)
    1224:	fb042703          	lw	a4,-80(s0)
    1228:	9fb9                	addw	a5,a5,a4
    122a:	0007871b          	sext.w	a4,a5
    122e:	fb843783          	ld	a5,-72(s0)
    1232:	4f9c                	lw	a5,24(a5)
    1234:	04f74d63          	blt	a4,a5,128e <schedule_sjf+0x18e>
        int remaining_time = shortest_thread->remaining_time - interval;
    1238:	fc843783          	ld	a5,-56(s0)
    123c:	4fb8                	lw	a4,88(a5)
    123e:	f9c42783          	lw	a5,-100(s0)
    1242:	40f707bb          	subw	a5,a4,a5
    1246:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    124a:	fb843783          	ld	a5,-72(s0)
    124e:	639c                	ld	a5,0(a5)
    1250:	43f8                	lw	a4,68(a5)
    1252:	f9842783          	lw	a5,-104(s0)
    1256:	2781                	sext.w	a5,a5
    1258:	02e7cd63          	blt	a5,a4,1292 <schedule_sjf+0x192>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    125c:	fb843783          	ld	a5,-72(s0)
    1260:	639c                	ld	a5,0(a5)
    1262:	43f8                	lw	a4,68(a5)
    1264:	f9842783          	lw	a5,-104(s0)
    1268:	2781                	sext.w	a5,a5
    126a:	00e79b63          	bne	a5,a4,1280 <schedule_sjf+0x180>
    126e:	fc843783          	ld	a5,-56(s0)
    1272:	5fd8                	lw	a4,60(a5)
    1274:	fb843783          	ld	a5,-72(s0)
    1278:	639c                	ld	a5,0(a5)
    127a:	5fdc                	lw	a5,60(a5)
    127c:	00f74d63          	blt	a4,a5,1296 <schedule_sjf+0x196>
        executing_time = interval;
    1280:	f9c42783          	lw	a5,-100(s0)
    1284:	faf42a23          	sw	a5,-76(s0)
    1288:	a801                	j	1298 <schedule_sjf+0x198>
        if (interval > executing_time) continue;
    128a:	0001                	nop
    128c:	a031                	j	1298 <schedule_sjf+0x198>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    128e:	0001                	nop
    1290:	a021                	j	1298 <schedule_sjf+0x198>
        if (remaining_time < cur->thrd->processing_time) continue;
    1292:	0001                	nop
    1294:	a011                	j	1298 <schedule_sjf+0x198>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    1296:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1298:	fb843783          	ld	a5,-72(s0)
    129c:	679c                	ld	a5,8(a5)
    129e:	f8f43823          	sd	a5,-112(s0)
    12a2:	f9043783          	ld	a5,-112(s0)
    12a6:	17e1                	addi	a5,a5,-8
    12a8:	faf43c23          	sd	a5,-72(s0)
    12ac:	fb843783          	ld	a5,-72(s0)
    12b0:	00878713          	addi	a4,a5,8
    12b4:	689c                	ld	a5,16(s1)
    12b6:	f4f713e3          	bne	a4,a5,11fc <schedule_sjf+0xfc>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &shortest_thread->thread_list;
    12ba:	fc843783          	ld	a5,-56(s0)
    12be:	02878793          	addi	a5,a5,40
    12c2:	f6f43423          	sd	a5,-152(s0)
    r.allocated_time = executing_time;
    12c6:	fb442783          	lw	a5,-76(s0)
    12ca:	f6f42823          	sw	a5,-144(s0)
    return r;
    12ce:	f6843783          	ld	a5,-152(s0)
    12d2:	f6f43c23          	sd	a5,-136(s0)
    12d6:	f7043783          	ld	a5,-144(s0)
    12da:	f8f43023          	sd	a5,-128(s0)
    12de:	4701                	li	a4,0
    12e0:	f7843703          	ld	a4,-136(s0)
    12e4:	4781                	li	a5,0
    12e6:	f8043783          	ld	a5,-128(s0)
    12ea:	893a                	mv	s2,a4
    12ec:	89be                	mv	s3,a5
    12ee:	874a                	mv	a4,s2
    12f0:	87ce                	mv	a5,s3
}
    12f2:	853a                	mv	a0,a4
    12f4:	85be                	mv	a1,a5
    12f6:	70ea                	ld	ra,184(sp)
    12f8:	744a                	ld	s0,176(sp)
    12fa:	74aa                	ld	s1,168(sp)
    12fc:	790a                	ld	s2,160(sp)
    12fe:	69ea                	ld	s3,152(sp)
    1300:	6129                	addi	sp,sp,192
    1302:	8082                	ret

0000000000001304 <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    1304:	7115                	addi	sp,sp,-224
    1306:	ed86                	sd	ra,216(sp)
    1308:	e9a2                	sd	s0,208(sp)
    130a:	e5a6                	sd	s1,200(sp)
    130c:	e1ca                	sd	s2,192(sp)
    130e:	fd4e                	sd	s3,184(sp)
    1310:	1180                	addi	s0,sp,224
    1312:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    1314:	649c                	ld	a5,8(s1)
    1316:	853e                	mv	a0,a5
    1318:	00000097          	auipc	ra,0x0
    131c:	b0e080e7          	jalr	-1266(ra) # e26 <list_empty>
    1320:	87aa                	mv	a5,a0
    1322:	cb85                	beqz	a5,1352 <schedule_lst+0x4e>
        return fill_sparse(args);
    1324:	609c                	ld	a5,0(s1)
    1326:	f2f43023          	sd	a5,-224(s0)
    132a:	649c                	ld	a5,8(s1)
    132c:	f2f43423          	sd	a5,-216(s0)
    1330:	689c                	ld	a5,16(s1)
    1332:	f2f43823          	sd	a5,-208(s0)
    1336:	f2040793          	addi	a5,s0,-224
    133a:	853e                	mv	a0,a5
    133c:	00000097          	auipc	ra,0x0
    1340:	b14080e7          	jalr	-1260(ra) # e50 <fill_sparse>
    1344:	872a                	mv	a4,a0
    1346:	87ae                	mv	a5,a1
    1348:	f6e43023          	sd	a4,-160(s0)
    134c:	f6f43423          	sd	a5,-152(s0)
    1350:	ac41                	j	15e0 <schedule_lst+0x2dc>

    int current_time = args.current_time;
    1352:	409c                	lw	a5,0(s1)
    1354:	faf42623          	sw	a5,-84(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    1358:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    135c:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1360:	649c                	ld	a5,8(s1)
    1362:	639c                	ld	a5,0(a5)
    1364:	faf43023          	sd	a5,-96(s0)
    1368:	fa043783          	ld	a5,-96(s0)
    136c:	fd878793          	addi	a5,a5,-40
    1370:	fcf43023          	sd	a5,-64(s0)
    1374:	a239                	j	1482 <schedule_lst+0x17e>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    1376:	fc043783          	ld	a5,-64(s0)
    137a:	4ff8                	lw	a4,92(a5)
    137c:	fac42783          	lw	a5,-84(s0)
    1380:	40f707bb          	subw	a5,a4,a5
    1384:	0007871b          	sext.w	a4,a5
    1388:	fc043783          	ld	a5,-64(s0)
    138c:	4fbc                	lw	a5,88(a5)
    138e:	40f707bb          	subw	a5,a4,a5
    1392:	f6f42e23          	sw	a5,-132(s0)
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    1396:	fc843783          	ld	a5,-56(s0)
    139a:	c38d                	beqz	a5,13bc <schedule_lst+0xb8>
    139c:	fc843783          	ld	a5,-56(s0)
    13a0:	4ff8                	lw	a4,92(a5)
    13a2:	fac42783          	lw	a5,-84(s0)
    13a6:	40f707bb          	subw	a5,a4,a5
    13aa:	0007871b          	sext.w	a4,a5
    13ae:	fc843783          	ld	a5,-56(s0)
    13b2:	4fbc                	lw	a5,88(a5)
    13b4:	40f707bb          	subw	a5,a4,a5
    13b8:	2781                	sext.w	a5,a5
    13ba:	a011                	j	13be <schedule_lst+0xba>
    13bc:	4781                	li	a5,0
    13be:	f6f42c23          	sw	a5,-136(s0)
        if (least_slack_thread == NULL) {
    13c2:	fc843783          	ld	a5,-56(s0)
    13c6:	e791                	bnez	a5,13d2 <schedule_lst+0xce>
            least_slack_thread = th;
    13c8:	fc043783          	ld	a5,-64(s0)
    13cc:	fcf43423          	sd	a5,-56(s0)
    13d0:	a871                	j	146c <schedule_lst+0x168>
        }
        else if (least_slack_thread->current_deadline <= current_time) { // missing the deadline
    13d2:	fc843783          	ld	a5,-56(s0)
    13d6:	4ff8                	lw	a4,92(a5)
    13d8:	fac42783          	lw	a5,-84(s0)
    13dc:	2781                	sext.w	a5,a5
    13de:	02e7c763          	blt	a5,a4,140c <schedule_lst+0x108>
            if (th->current_deadline > current_time) continue;
    13e2:	fc043783          	ld	a5,-64(s0)
    13e6:	4ff8                	lw	a4,92(a5)
    13e8:	fac42783          	lw	a5,-84(s0)
    13ec:	2781                	sext.w	a5,a5
    13ee:	06e7ce63          	blt	a5,a4,146a <schedule_lst+0x166>
            if (th->ID < least_slack_thread->ID) {
    13f2:	fc043783          	ld	a5,-64(s0)
    13f6:	5fd8                	lw	a4,60(a5)
    13f8:	fc843783          	ld	a5,-56(s0)
    13fc:	5fdc                	lw	a5,60(a5)
    13fe:	06f75763          	bge	a4,a5,146c <schedule_lst+0x168>
                least_slack_thread = th;
    1402:	fc043783          	ld	a5,-64(s0)
    1406:	fcf43423          	sd	a5,-56(s0)
    140a:	a08d                	j	146c <schedule_lst+0x168>
            }
        }
        else if (th->current_deadline <= current_time) {
    140c:	fc043783          	ld	a5,-64(s0)
    1410:	4ff8                	lw	a4,92(a5)
    1412:	fac42783          	lw	a5,-84(s0)
    1416:	2781                	sext.w	a5,a5
    1418:	00e7c763          	blt	a5,a4,1426 <schedule_lst+0x122>
            least_slack_thread = th;
    141c:	fc043783          	ld	a5,-64(s0)
    1420:	fcf43423          	sd	a5,-56(s0)
    1424:	a0a1                	j	146c <schedule_lst+0x168>
        }
        else if (slack_time < least_slack_time) {
    1426:	f7c42703          	lw	a4,-132(s0)
    142a:	f7842783          	lw	a5,-136(s0)
    142e:	2701                	sext.w	a4,a4
    1430:	2781                	sext.w	a5,a5
    1432:	00f75763          	bge	a4,a5,1440 <schedule_lst+0x13c>
            least_slack_thread = th;
    1436:	fc043783          	ld	a5,-64(s0)
    143a:	fcf43423          	sd	a5,-56(s0)
    143e:	a03d                	j	146c <schedule_lst+0x168>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    1440:	f7c42703          	lw	a4,-132(s0)
    1444:	f7842783          	lw	a5,-136(s0)
    1448:	2701                	sext.w	a4,a4
    144a:	2781                	sext.w	a5,a5
    144c:	02f71063          	bne	a4,a5,146c <schedule_lst+0x168>
    1450:	fc043783          	ld	a5,-64(s0)
    1454:	5fd8                	lw	a4,60(a5)
    1456:	fc843783          	ld	a5,-56(s0)
    145a:	5fdc                	lw	a5,60(a5)
    145c:	00f75863          	bge	a4,a5,146c <schedule_lst+0x168>
            least_slack_thread = th;
    1460:	fc043783          	ld	a5,-64(s0)
    1464:	fcf43423          	sd	a5,-56(s0)
    1468:	a011                	j	146c <schedule_lst+0x168>
            if (th->current_deadline > current_time) continue;
    146a:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    146c:	fc043783          	ld	a5,-64(s0)
    1470:	779c                	ld	a5,40(a5)
    1472:	f6f43823          	sd	a5,-144(s0)
    1476:	f7043783          	ld	a5,-144(s0)
    147a:	fd878793          	addi	a5,a5,-40
    147e:	fcf43023          	sd	a5,-64(s0)
    1482:	fc043783          	ld	a5,-64(s0)
    1486:	02878713          	addi	a4,a5,40
    148a:	649c                	ld	a5,8(s1)
    148c:	eef715e3          	bne	a4,a5,1376 <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread->current_deadline <= current_time)
    1490:	fc843783          	ld	a5,-56(s0)
    1494:	4ff8                	lw	a4,92(a5)
    1496:	fac42783          	lw	a5,-84(s0)
    149a:	2781                	sext.w	a5,a5
    149c:	00e7cb63          	blt	a5,a4,14b2 <schedule_lst+0x1ae>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    14a0:	fc843783          	ld	a5,-56(s0)
    14a4:	02878793          	addi	a5,a5,40
    14a8:	f6f43023          	sd	a5,-160(s0)
    14ac:	f6042423          	sw	zero,-152(s0)
    14b0:	aa05                	j	15e0 <schedule_lst+0x2dc>
    
    int executing_time = least_slack_thread->remaining_time;
    14b2:	fc843783          	ld	a5,-56(s0)
    14b6:	4fbc                	lw	a5,88(a5)
    14b8:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    14bc:	fc843783          	ld	a5,-56(s0)
    14c0:	4fb4                	lw	a3,88(a5)
    14c2:	fc843783          	ld	a5,-56(s0)
    14c6:	4ff8                	lw	a4,92(a5)
    14c8:	fac42783          	lw	a5,-84(s0)
    14cc:	40f707bb          	subw	a5,a4,a5
    14d0:	2781                	sext.w	a5,a5
    14d2:	8736                	mv	a4,a3
    14d4:	00e7db63          	bge	a5,a4,14ea <schedule_lst+0x1e6>
        executing_time = least_slack_thread->current_deadline - current_time;
    14d8:	fc843783          	ld	a5,-56(s0)
    14dc:	4ff8                	lw	a4,92(a5)
    14de:	fac42783          	lw	a5,-84(s0)
    14e2:	40f707bb          	subw	a5,a4,a5
    14e6:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    14ea:	fc843783          	ld	a5,-56(s0)
    14ee:	4ff8                	lw	a4,92(a5)
    14f0:	fac42783          	lw	a5,-84(s0)
    14f4:	40f707bb          	subw	a5,a4,a5
    14f8:	0007871b          	sext.w	a4,a5
    14fc:	fc843783          	ld	a5,-56(s0)
    1500:	4fbc                	lw	a5,88(a5)
    1502:	40f707bb          	subw	a5,a4,a5
    1506:	f8f42e23          	sw	a5,-100(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    150a:	689c                	ld	a5,16(s1)
    150c:	639c                	ld	a5,0(a5)
    150e:	f8f43823          	sd	a5,-112(s0)
    1512:	f9043783          	ld	a5,-112(s0)
    1516:	17e1                	addi	a5,a5,-8
    1518:	faf43823          	sd	a5,-80(s0)
    151c:	a849                	j	15ae <schedule_lst+0x2aa>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    151e:	fb043783          	ld	a5,-80(s0)
    1522:	639c                	ld	a5,0(a5)
    1524:	47f8                	lw	a4,76(a5)
    1526:	fb043783          	ld	a5,-80(s0)
    152a:	639c                	ld	a5,0(a5)
    152c:	43fc                	lw	a5,68(a5)
    152e:	40f707bb          	subw	a5,a4,a5
    1532:	f8f42623          	sw	a5,-116(s0)
        int interval = cur->release_time - current_time;
    1536:	fb043783          	ld	a5,-80(s0)
    153a:	4f98                	lw	a4,24(a5)
    153c:	fac42783          	lw	a5,-84(s0)
    1540:	40f707bb          	subw	a5,a4,a5
    1544:	f8f42423          	sw	a5,-120(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    1548:	f8842703          	lw	a4,-120(s0)
    154c:	fbc42783          	lw	a5,-68(s0)
    1550:	2701                	sext.w	a4,a4
    1552:	2781                	sext.w	a5,a5
    1554:	04e7c063          	blt	a5,a4,1594 <schedule_lst+0x290>
    1558:	f9c42703          	lw	a4,-100(s0)
    155c:	f8c42783          	lw	a5,-116(s0)
    1560:	2701                	sext.w	a4,a4
    1562:	2781                	sext.w	a5,a5
    1564:	02f74863          	blt	a4,a5,1594 <schedule_lst+0x290>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    1568:	f9c42703          	lw	a4,-100(s0)
    156c:	f8c42783          	lw	a5,-116(s0)
    1570:	2701                	sext.w	a4,a4
    1572:	2781                	sext.w	a5,a5
    1574:	00f71b63          	bne	a4,a5,158a <schedule_lst+0x286>
    1578:	fc843783          	ld	a5,-56(s0)
    157c:	5fd8                	lw	a4,60(a5)
    157e:	fb043783          	ld	a5,-80(s0)
    1582:	639c                	ld	a5,0(a5)
    1584:	5fdc                	lw	a5,60(a5)
    1586:	00f74963          	blt	a4,a5,1598 <schedule_lst+0x294>
        executing_time = interval;
    158a:	f8842783          	lw	a5,-120(s0)
    158e:	faf42e23          	sw	a5,-68(s0)
    1592:	a021                	j	159a <schedule_lst+0x296>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    1594:	0001                	nop
    1596:	a011                	j	159a <schedule_lst+0x296>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    1598:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    159a:	fb043783          	ld	a5,-80(s0)
    159e:	679c                	ld	a5,8(a5)
    15a0:	f8f43023          	sd	a5,-128(s0)
    15a4:	f8043783          	ld	a5,-128(s0)
    15a8:	17e1                	addi	a5,a5,-8
    15aa:	faf43823          	sd	a5,-80(s0)
    15ae:	fb043783          	ld	a5,-80(s0)
    15b2:	00878713          	addi	a4,a5,8
    15b6:	689c                	ld	a5,16(s1)
    15b8:	f6f713e3          	bne	a4,a5,151e <schedule_lst+0x21a>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &least_slack_thread->thread_list;
    15bc:	fc843783          	ld	a5,-56(s0)
    15c0:	02878793          	addi	a5,a5,40
    15c4:	f4f43823          	sd	a5,-176(s0)
    r.allocated_time = executing_time;
    15c8:	fbc42783          	lw	a5,-68(s0)
    15cc:	f4f42c23          	sw	a5,-168(s0)
    return r;
    15d0:	f5043783          	ld	a5,-176(s0)
    15d4:	f6f43023          	sd	a5,-160(s0)
    15d8:	f5843783          	ld	a5,-168(s0)
    15dc:	f6f43423          	sd	a5,-152(s0)
    15e0:	4701                	li	a4,0
    15e2:	f6043703          	ld	a4,-160(s0)
    15e6:	4781                	li	a5,0
    15e8:	f6843783          	ld	a5,-152(s0)
    15ec:	893a                	mv	s2,a4
    15ee:	89be                	mv	s3,a5
    15f0:	874a                	mv	a4,s2
    15f2:	87ce                	mv	a5,s3
}
    15f4:	853a                	mv	a0,a4
    15f6:	85be                	mv	a1,a5
    15f8:	60ee                	ld	ra,216(sp)
    15fa:	644e                	ld	s0,208(sp)
    15fc:	64ae                	ld	s1,200(sp)
    15fe:	690e                	ld	s2,192(sp)
    1600:	79ea                	ld	s3,184(sp)
    1602:	612d                	addi	sp,sp,224
    1604:	8082                	ret

0000000000001606 <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    1606:	7155                	addi	sp,sp,-208
    1608:	e586                	sd	ra,200(sp)
    160a:	e1a2                	sd	s0,192(sp)
    160c:	fd26                	sd	s1,184(sp)
    160e:	f94a                	sd	s2,176(sp)
    1610:	f54e                	sd	s3,168(sp)
    1612:	0980                	addi	s0,sp,208
    1614:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.

    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    1616:	649c                	ld	a5,8(s1)
    1618:	853e                	mv	a0,a5
    161a:	00000097          	auipc	ra,0x0
    161e:	80c080e7          	jalr	-2036(ra) # e26 <list_empty>
    1622:	87aa                	mv	a5,a0
    1624:	cb85                	beqz	a5,1654 <schedule_dm+0x4e>
        return fill_sparse(args);
    1626:	609c                	ld	a5,0(s1)
    1628:	f2f43823          	sd	a5,-208(s0)
    162c:	649c                	ld	a5,8(s1)
    162e:	f2f43c23          	sd	a5,-200(s0)
    1632:	689c                	ld	a5,16(s1)
    1634:	f4f43023          	sd	a5,-192(s0)
    1638:	f3040793          	addi	a5,s0,-208
    163c:	853e                	mv	a0,a5
    163e:	00000097          	auipc	ra,0x0
    1642:	812080e7          	jalr	-2030(ra) # e50 <fill_sparse>
    1646:	872a                	mv	a4,a0
    1648:	87ae                	mv	a5,a1
    164a:	f6e43823          	sd	a4,-144(s0)
    164e:	f6f43c23          	sd	a5,-136(s0)
    1652:	ac11                	j	1866 <schedule_dm+0x260>
    
    int current_time = args.current_time;
    1654:	409c                	lw	a5,0(s1)
    1656:	faf42623          	sw	a5,-84(s0)

    // find the thread with the earliest deadline
    struct thread *highest_priority_thread = NULL;
    165a:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    165e:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1662:	649c                	ld	a5,8(s1)
    1664:	639c                	ld	a5,0(a5)
    1666:	faf43023          	sd	a5,-96(s0)
    166a:	fa043783          	ld	a5,-96(s0)
    166e:	fd878793          	addi	a5,a5,-40
    1672:	fcf43023          	sd	a5,-64(s0)
    1676:	a0c9                	j	1738 <schedule_dm+0x132>
        if (highest_priority_thread == NULL) {
    1678:	fc843783          	ld	a5,-56(s0)
    167c:	e791                	bnez	a5,1688 <schedule_dm+0x82>
            highest_priority_thread = th;
    167e:	fc043783          	ld	a5,-64(s0)
    1682:	fcf43423          	sd	a5,-56(s0)
    1686:	a871                	j	1722 <schedule_dm+0x11c>
        }
        else if (highest_priority_thread->current_deadline <= current_time) { // missing the deadline
    1688:	fc843783          	ld	a5,-56(s0)
    168c:	4ff8                	lw	a4,92(a5)
    168e:	fac42783          	lw	a5,-84(s0)
    1692:	2781                	sext.w	a5,a5
    1694:	02e7c763          	blt	a5,a4,16c2 <schedule_dm+0xbc>
            if (th->current_deadline > current_time) continue;
    1698:	fc043783          	ld	a5,-64(s0)
    169c:	4ff8                	lw	a4,92(a5)
    169e:	fac42783          	lw	a5,-84(s0)
    16a2:	2781                	sext.w	a5,a5
    16a4:	06e7ce63          	blt	a5,a4,1720 <schedule_dm+0x11a>
            if (th->ID < highest_priority_thread->ID) {
    16a8:	fc043783          	ld	a5,-64(s0)
    16ac:	5fd8                	lw	a4,60(a5)
    16ae:	fc843783          	ld	a5,-56(s0)
    16b2:	5fdc                	lw	a5,60(a5)
    16b4:	06f75763          	bge	a4,a5,1722 <schedule_dm+0x11c>
                highest_priority_thread = th;
    16b8:	fc043783          	ld	a5,-64(s0)
    16bc:	fcf43423          	sd	a5,-56(s0)
    16c0:	a08d                	j	1722 <schedule_dm+0x11c>
            }
        }
        else if (th->current_deadline <= current_time) {
    16c2:	fc043783          	ld	a5,-64(s0)
    16c6:	4ff8                	lw	a4,92(a5)
    16c8:	fac42783          	lw	a5,-84(s0)
    16cc:	2781                	sext.w	a5,a5
    16ce:	00e7c763          	blt	a5,a4,16dc <schedule_dm+0xd6>
            highest_priority_thread = th;
    16d2:	fc043783          	ld	a5,-64(s0)
    16d6:	fcf43423          	sd	a5,-56(s0)
    16da:	a0a1                	j	1722 <schedule_dm+0x11c>
        }
        else if (th->deadline < highest_priority_thread->deadline ) {
    16dc:	fc043783          	ld	a5,-64(s0)
    16e0:	47f8                	lw	a4,76(a5)
    16e2:	fc843783          	ld	a5,-56(s0)
    16e6:	47fc                	lw	a5,76(a5)
    16e8:	00f75763          	bge	a4,a5,16f6 <schedule_dm+0xf0>
            highest_priority_thread = th;
    16ec:	fc043783          	ld	a5,-64(s0)
    16f0:	fcf43423          	sd	a5,-56(s0)
    16f4:	a03d                	j	1722 <schedule_dm+0x11c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    16f6:	fc043783          	ld	a5,-64(s0)
    16fa:	47f8                	lw	a4,76(a5)
    16fc:	fc843783          	ld	a5,-56(s0)
    1700:	47fc                	lw	a5,76(a5)
    1702:	02f71063          	bne	a4,a5,1722 <schedule_dm+0x11c>
    1706:	fc043783          	ld	a5,-64(s0)
    170a:	5fd8                	lw	a4,60(a5)
    170c:	fc843783          	ld	a5,-56(s0)
    1710:	5fdc                	lw	a5,60(a5)
    1712:	00f75863          	bge	a4,a5,1722 <schedule_dm+0x11c>
            highest_priority_thread = th;
    1716:	fc043783          	ld	a5,-64(s0)
    171a:	fcf43423          	sd	a5,-56(s0)
    171e:	a011                	j	1722 <schedule_dm+0x11c>
            if (th->current_deadline > current_time) continue;
    1720:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1722:	fc043783          	ld	a5,-64(s0)
    1726:	779c                	ld	a5,40(a5)
    1728:	f8f43023          	sd	a5,-128(s0)
    172c:	f8043783          	ld	a5,-128(s0)
    1730:	fd878793          	addi	a5,a5,-40
    1734:	fcf43023          	sd	a5,-64(s0)
    1738:	fc043783          	ld	a5,-64(s0)
    173c:	02878713          	addi	a4,a5,40
    1740:	649c                	ld	a5,8(s1)
    1742:	f2f71be3          	bne	a4,a5,1678 <schedule_dm+0x72>
        }
    }

    // the thread missing the current deadline
    if (highest_priority_thread->current_deadline <= current_time)
    1746:	fc843783          	ld	a5,-56(s0)
    174a:	4ff8                	lw	a4,92(a5)
    174c:	fac42783          	lw	a5,-84(s0)
    1750:	2781                	sext.w	a5,a5
    1752:	00e7cb63          	blt	a5,a4,1768 <schedule_dm+0x162>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    1756:	fc843783          	ld	a5,-56(s0)
    175a:	02878793          	addi	a5,a5,40
    175e:	f6f43823          	sd	a5,-144(s0)
    1762:	f6042c23          	sw	zero,-136(s0)
    1766:	a201                	j	1866 <schedule_dm+0x260>

    int executing_time = highest_priority_thread->remaining_time;
    1768:	fc843783          	ld	a5,-56(s0)
    176c:	4fbc                	lw	a5,88(a5)
    176e:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    1772:	fc843783          	ld	a5,-56(s0)
    1776:	4fb4                	lw	a3,88(a5)
    1778:	fc843783          	ld	a5,-56(s0)
    177c:	4ff8                	lw	a4,92(a5)
    177e:	fac42783          	lw	a5,-84(s0)
    1782:	40f707bb          	subw	a5,a4,a5
    1786:	2781                	sext.w	a5,a5
    1788:	8736                	mv	a4,a3
    178a:	00e7db63          	bge	a5,a4,17a0 <schedule_dm+0x19a>
        executing_time = highest_priority_thread->current_deadline - current_time;
    178e:	fc843783          	ld	a5,-56(s0)
    1792:	4ff8                	lw	a4,92(a5)
    1794:	fac42783          	lw	a5,-84(s0)
    1798:	40f707bb          	subw	a5,a4,a5
    179c:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    17a0:	689c                	ld	a5,16(s1)
    17a2:	639c                	ld	a5,0(a5)
    17a4:	f8f43c23          	sd	a5,-104(s0)
    17a8:	f9843783          	ld	a5,-104(s0)
    17ac:	17e1                	addi	a5,a5,-8
    17ae:	faf43823          	sd	a5,-80(s0)
    17b2:	a049                	j	1834 <schedule_dm+0x22e>
        int interval = cur->release_time - current_time;
    17b4:	fb043783          	ld	a5,-80(s0)
    17b8:	4f98                	lw	a4,24(a5)
    17ba:	fac42783          	lw	a5,-84(s0)
    17be:	40f707bb          	subw	a5,a4,a5
    17c2:	f8f42a23          	sw	a5,-108(s0)
        if (interval > executing_time) continue;
    17c6:	f9442703          	lw	a4,-108(s0)
    17ca:	fbc42783          	lw	a5,-68(s0)
    17ce:	2701                	sext.w	a4,a4
    17d0:	2781                	sext.w	a5,a5
    17d2:	04e7c263          	blt	a5,a4,1816 <schedule_dm+0x210>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    17d6:	fc843783          	ld	a5,-56(s0)
    17da:	47f8                	lw	a4,76(a5)
    17dc:	fb043783          	ld	a5,-80(s0)
    17e0:	639c                	ld	a5,0(a5)
    17e2:	47fc                	lw	a5,76(a5)
    17e4:	02f74b63          	blt	a4,a5,181a <schedule_dm+0x214>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    17e8:	fc843783          	ld	a5,-56(s0)
    17ec:	47f8                	lw	a4,76(a5)
    17ee:	fb043783          	ld	a5,-80(s0)
    17f2:	639c                	ld	a5,0(a5)
    17f4:	47fc                	lw	a5,76(a5)
    17f6:	00f71b63          	bne	a4,a5,180c <schedule_dm+0x206>
    17fa:	fc843783          	ld	a5,-56(s0)
    17fe:	5fd8                	lw	a4,60(a5)
    1800:	fb043783          	ld	a5,-80(s0)
    1804:	639c                	ld	a5,0(a5)
    1806:	5fdc                	lw	a5,60(a5)
    1808:	00f74b63          	blt	a4,a5,181e <schedule_dm+0x218>
        executing_time = interval;
    180c:	f9442783          	lw	a5,-108(s0)
    1810:	faf42e23          	sw	a5,-68(s0)
    1814:	a031                	j	1820 <schedule_dm+0x21a>
        if (interval > executing_time) continue;
    1816:	0001                	nop
    1818:	a021                	j	1820 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    181a:	0001                	nop
    181c:	a011                	j	1820 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    181e:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1820:	fb043783          	ld	a5,-80(s0)
    1824:	679c                	ld	a5,8(a5)
    1826:	f8f43423          	sd	a5,-120(s0)
    182a:	f8843783          	ld	a5,-120(s0)
    182e:	17e1                	addi	a5,a5,-8
    1830:	faf43823          	sd	a5,-80(s0)
    1834:	fb043783          	ld	a5,-80(s0)
    1838:	00878713          	addi	a4,a5,8
    183c:	689c                	ld	a5,16(s1)
    183e:	f6f71be3          	bne	a4,a5,17b4 <schedule_dm+0x1ae>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &highest_priority_thread->thread_list;
    1842:	fc843783          	ld	a5,-56(s0)
    1846:	02878793          	addi	a5,a5,40
    184a:	f6f43023          	sd	a5,-160(s0)
    r.allocated_time = executing_time;
    184e:	fbc42783          	lw	a5,-68(s0)
    1852:	f6f42423          	sw	a5,-152(s0)
    return r;
    1856:	f6043783          	ld	a5,-160(s0)
    185a:	f6f43823          	sd	a5,-144(s0)
    185e:	f6843783          	ld	a5,-152(s0)
    1862:	f6f43c23          	sd	a5,-136(s0)
    1866:	4701                	li	a4,0
    1868:	f7043703          	ld	a4,-144(s0)
    186c:	4781                	li	a5,0
    186e:	f7843783          	ld	a5,-136(s0)
    1872:	893a                	mv	s2,a4
    1874:	89be                	mv	s3,a5
    1876:	874a                	mv	a4,s2
    1878:	87ce                	mv	a5,s3
    187a:	853a                	mv	a0,a4
    187c:	85be                	mv	a1,a5
    187e:	60ae                	ld	ra,200(sp)
    1880:	640e                	ld	s0,192(sp)
    1882:	74ea                	ld	s1,184(sp)
    1884:	794a                	ld	s2,176(sp)
    1886:	79aa                	ld	s3,168(sp)
    1888:	6169                	addi	sp,sp,208
    188a:	8082                	ret
