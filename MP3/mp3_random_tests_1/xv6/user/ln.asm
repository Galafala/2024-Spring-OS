
user/_ln:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
       0:	1101                	addi	sp,sp,-32
       2:	ec06                	sd	ra,24(sp)
       4:	e822                	sd	s0,16(sp)
       6:	1000                	addi	s0,sp,32
       8:	87aa                	mv	a5,a0
       a:	feb43023          	sd	a1,-32(s0)
       e:	fef42623          	sw	a5,-20(s0)
  if(argc != 3){
      12:	fec42783          	lw	a5,-20(s0)
      16:	0007871b          	sext.w	a4,a5
      1a:	478d                	li	a5,3
      1c:	02f70063          	beq	a4,a5,3c <main+0x3c>
    fprintf(2, "Usage: ln old new\n");
      20:	00002597          	auipc	a1,0x2
      24:	85058593          	addi	a1,a1,-1968 # 1870 <schedule_dm+0x286>
      28:	4509                	li	a0,2
      2a:	00001097          	auipc	ra,0x1
      2e:	9e2080e7          	jalr	-1566(ra) # a0c <fprintf>
    exit(1);
      32:	4505                	li	a0,1
      34:	00000097          	auipc	ra,0x0
      38:	4ea080e7          	jalr	1258(ra) # 51e <exit>
  }
  if(link(argv[1], argv[2]) < 0)
      3c:	fe043783          	ld	a5,-32(s0)
      40:	07a1                	addi	a5,a5,8
      42:	6398                	ld	a4,0(a5)
      44:	fe043783          	ld	a5,-32(s0)
      48:	07c1                	addi	a5,a5,16
      4a:	639c                	ld	a5,0(a5)
      4c:	85be                	mv	a1,a5
      4e:	853a                	mv	a0,a4
      50:	00000097          	auipc	ra,0x0
      54:	52e080e7          	jalr	1326(ra) # 57e <link>
      58:	87aa                	mv	a5,a0
      5a:	0207d563          	bgez	a5,84 <main+0x84>
    fprintf(2, "link %s %s: failed\n", argv[1], argv[2]);
      5e:	fe043783          	ld	a5,-32(s0)
      62:	07a1                	addi	a5,a5,8
      64:	6398                	ld	a4,0(a5)
      66:	fe043783          	ld	a5,-32(s0)
      6a:	07c1                	addi	a5,a5,16
      6c:	639c                	ld	a5,0(a5)
      6e:	86be                	mv	a3,a5
      70:	863a                	mv	a2,a4
      72:	00002597          	auipc	a1,0x2
      76:	81658593          	addi	a1,a1,-2026 # 1888 <schedule_dm+0x29e>
      7a:	4509                	li	a0,2
      7c:	00001097          	auipc	ra,0x1
      80:	990080e7          	jalr	-1648(ra) # a0c <fprintf>
  exit(0);
      84:	4501                	li	a0,0
      86:	00000097          	auipc	ra,0x0
      8a:	498080e7          	jalr	1176(ra) # 51e <exit>

000000000000008e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      8e:	7179                	addi	sp,sp,-48
      90:	f422                	sd	s0,40(sp)
      92:	1800                	addi	s0,sp,48
      94:	fca43c23          	sd	a0,-40(s0)
      98:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      9c:	fd843783          	ld	a5,-40(s0)
      a0:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      a4:	0001                	nop
      a6:	fd043703          	ld	a4,-48(s0)
      aa:	00170793          	addi	a5,a4,1
      ae:	fcf43823          	sd	a5,-48(s0)
      b2:	fd843783          	ld	a5,-40(s0)
      b6:	00178693          	addi	a3,a5,1
      ba:	fcd43c23          	sd	a3,-40(s0)
      be:	00074703          	lbu	a4,0(a4)
      c2:	00e78023          	sb	a4,0(a5)
      c6:	0007c783          	lbu	a5,0(a5)
      ca:	fff1                	bnez	a5,a6 <strcpy+0x18>
    ;
  return os;
      cc:	fe843783          	ld	a5,-24(s0)
}
      d0:	853e                	mv	a0,a5
      d2:	7422                	ld	s0,40(sp)
      d4:	6145                	addi	sp,sp,48
      d6:	8082                	ret

00000000000000d8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      d8:	1101                	addi	sp,sp,-32
      da:	ec22                	sd	s0,24(sp)
      dc:	1000                	addi	s0,sp,32
      de:	fea43423          	sd	a0,-24(s0)
      e2:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
      e6:	a819                	j	fc <strcmp+0x24>
    p++, q++;
      e8:	fe843783          	ld	a5,-24(s0)
      ec:	0785                	addi	a5,a5,1
      ee:	fef43423          	sd	a5,-24(s0)
      f2:	fe043783          	ld	a5,-32(s0)
      f6:	0785                	addi	a5,a5,1
      f8:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
      fc:	fe843783          	ld	a5,-24(s0)
     100:	0007c783          	lbu	a5,0(a5)
     104:	cb99                	beqz	a5,11a <strcmp+0x42>
     106:	fe843783          	ld	a5,-24(s0)
     10a:	0007c703          	lbu	a4,0(a5)
     10e:	fe043783          	ld	a5,-32(s0)
     112:	0007c783          	lbu	a5,0(a5)
     116:	fcf709e3          	beq	a4,a5,e8 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     11a:	fe843783          	ld	a5,-24(s0)
     11e:	0007c783          	lbu	a5,0(a5)
     122:	0007871b          	sext.w	a4,a5
     126:	fe043783          	ld	a5,-32(s0)
     12a:	0007c783          	lbu	a5,0(a5)
     12e:	2781                	sext.w	a5,a5
     130:	40f707bb          	subw	a5,a4,a5
     134:	2781                	sext.w	a5,a5
}
     136:	853e                	mv	a0,a5
     138:	6462                	ld	s0,24(sp)
     13a:	6105                	addi	sp,sp,32
     13c:	8082                	ret

000000000000013e <strlen>:

uint
strlen(const char *s)
{
     13e:	7179                	addi	sp,sp,-48
     140:	f422                	sd	s0,40(sp)
     142:	1800                	addi	s0,sp,48
     144:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     148:	fe042623          	sw	zero,-20(s0)
     14c:	a031                	j	158 <strlen+0x1a>
     14e:	fec42783          	lw	a5,-20(s0)
     152:	2785                	addiw	a5,a5,1
     154:	fef42623          	sw	a5,-20(s0)
     158:	fec42783          	lw	a5,-20(s0)
     15c:	fd843703          	ld	a4,-40(s0)
     160:	97ba                	add	a5,a5,a4
     162:	0007c783          	lbu	a5,0(a5)
     166:	f7e5                	bnez	a5,14e <strlen+0x10>
    ;
  return n;
     168:	fec42783          	lw	a5,-20(s0)
}
     16c:	853e                	mv	a0,a5
     16e:	7422                	ld	s0,40(sp)
     170:	6145                	addi	sp,sp,48
     172:	8082                	ret

0000000000000174 <memset>:

void*
memset(void *dst, int c, uint n)
{
     174:	7179                	addi	sp,sp,-48
     176:	f422                	sd	s0,40(sp)
     178:	1800                	addi	s0,sp,48
     17a:	fca43c23          	sd	a0,-40(s0)
     17e:	87ae                	mv	a5,a1
     180:	8732                	mv	a4,a2
     182:	fcf42a23          	sw	a5,-44(s0)
     186:	87ba                	mv	a5,a4
     188:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     18c:	fd843783          	ld	a5,-40(s0)
     190:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     194:	fe042623          	sw	zero,-20(s0)
     198:	a00d                	j	1ba <memset+0x46>
    cdst[i] = c;
     19a:	fec42783          	lw	a5,-20(s0)
     19e:	fe043703          	ld	a4,-32(s0)
     1a2:	97ba                	add	a5,a5,a4
     1a4:	fd442703          	lw	a4,-44(s0)
     1a8:	0ff77713          	andi	a4,a4,255
     1ac:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1b0:	fec42783          	lw	a5,-20(s0)
     1b4:	2785                	addiw	a5,a5,1
     1b6:	fef42623          	sw	a5,-20(s0)
     1ba:	fec42703          	lw	a4,-20(s0)
     1be:	fd042783          	lw	a5,-48(s0)
     1c2:	2781                	sext.w	a5,a5
     1c4:	fcf76be3          	bltu	a4,a5,19a <memset+0x26>
  }
  return dst;
     1c8:	fd843783          	ld	a5,-40(s0)
}
     1cc:	853e                	mv	a0,a5
     1ce:	7422                	ld	s0,40(sp)
     1d0:	6145                	addi	sp,sp,48
     1d2:	8082                	ret

00000000000001d4 <strchr>:

char*
strchr(const char *s, char c)
{
     1d4:	1101                	addi	sp,sp,-32
     1d6:	ec22                	sd	s0,24(sp)
     1d8:	1000                	addi	s0,sp,32
     1da:	fea43423          	sd	a0,-24(s0)
     1de:	87ae                	mv	a5,a1
     1e0:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     1e4:	a01d                	j	20a <strchr+0x36>
    if(*s == c)
     1e6:	fe843783          	ld	a5,-24(s0)
     1ea:	0007c703          	lbu	a4,0(a5)
     1ee:	fe744783          	lbu	a5,-25(s0)
     1f2:	0ff7f793          	andi	a5,a5,255
     1f6:	00e79563          	bne	a5,a4,200 <strchr+0x2c>
      return (char*)s;
     1fa:	fe843783          	ld	a5,-24(s0)
     1fe:	a821                	j	216 <strchr+0x42>
  for(; *s; s++)
     200:	fe843783          	ld	a5,-24(s0)
     204:	0785                	addi	a5,a5,1
     206:	fef43423          	sd	a5,-24(s0)
     20a:	fe843783          	ld	a5,-24(s0)
     20e:	0007c783          	lbu	a5,0(a5)
     212:	fbf1                	bnez	a5,1e6 <strchr+0x12>
  return 0;
     214:	4781                	li	a5,0
}
     216:	853e                	mv	a0,a5
     218:	6462                	ld	s0,24(sp)
     21a:	6105                	addi	sp,sp,32
     21c:	8082                	ret

000000000000021e <gets>:

char*
gets(char *buf, int max)
{
     21e:	7179                	addi	sp,sp,-48
     220:	f406                	sd	ra,40(sp)
     222:	f022                	sd	s0,32(sp)
     224:	1800                	addi	s0,sp,48
     226:	fca43c23          	sd	a0,-40(s0)
     22a:	87ae                	mv	a5,a1
     22c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     230:	fe042623          	sw	zero,-20(s0)
     234:	a8a1                	j	28c <gets+0x6e>
    cc = read(0, &c, 1);
     236:	fe740793          	addi	a5,s0,-25
     23a:	4605                	li	a2,1
     23c:	85be                	mv	a1,a5
     23e:	4501                	li	a0,0
     240:	00000097          	auipc	ra,0x0
     244:	2f6080e7          	jalr	758(ra) # 536 <read>
     248:	87aa                	mv	a5,a0
     24a:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     24e:	fe842783          	lw	a5,-24(s0)
     252:	2781                	sext.w	a5,a5
     254:	04f05763          	blez	a5,2a2 <gets+0x84>
      break;
    buf[i++] = c;
     258:	fec42783          	lw	a5,-20(s0)
     25c:	0017871b          	addiw	a4,a5,1
     260:	fee42623          	sw	a4,-20(s0)
     264:	873e                	mv	a4,a5
     266:	fd843783          	ld	a5,-40(s0)
     26a:	97ba                	add	a5,a5,a4
     26c:	fe744703          	lbu	a4,-25(s0)
     270:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     274:	fe744783          	lbu	a5,-25(s0)
     278:	873e                	mv	a4,a5
     27a:	47a9                	li	a5,10
     27c:	02f70463          	beq	a4,a5,2a4 <gets+0x86>
     280:	fe744783          	lbu	a5,-25(s0)
     284:	873e                	mv	a4,a5
     286:	47b5                	li	a5,13
     288:	00f70e63          	beq	a4,a5,2a4 <gets+0x86>
  for(i=0; i+1 < max; ){
     28c:	fec42783          	lw	a5,-20(s0)
     290:	2785                	addiw	a5,a5,1
     292:	0007871b          	sext.w	a4,a5
     296:	fd442783          	lw	a5,-44(s0)
     29a:	2781                	sext.w	a5,a5
     29c:	f8f74de3          	blt	a4,a5,236 <gets+0x18>
     2a0:	a011                	j	2a4 <gets+0x86>
      break;
     2a2:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2a4:	fec42783          	lw	a5,-20(s0)
     2a8:	fd843703          	ld	a4,-40(s0)
     2ac:	97ba                	add	a5,a5,a4
     2ae:	00078023          	sb	zero,0(a5)
  return buf;
     2b2:	fd843783          	ld	a5,-40(s0)
}
     2b6:	853e                	mv	a0,a5
     2b8:	70a2                	ld	ra,40(sp)
     2ba:	7402                	ld	s0,32(sp)
     2bc:	6145                	addi	sp,sp,48
     2be:	8082                	ret

00000000000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
     2c0:	7179                	addi	sp,sp,-48
     2c2:	f406                	sd	ra,40(sp)
     2c4:	f022                	sd	s0,32(sp)
     2c6:	1800                	addi	s0,sp,48
     2c8:	fca43c23          	sd	a0,-40(s0)
     2cc:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2d0:	4581                	li	a1,0
     2d2:	fd843503          	ld	a0,-40(s0)
     2d6:	00000097          	auipc	ra,0x0
     2da:	288080e7          	jalr	648(ra) # 55e <open>
     2de:	87aa                	mv	a5,a0
     2e0:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     2e4:	fec42783          	lw	a5,-20(s0)
     2e8:	2781                	sext.w	a5,a5
     2ea:	0007d463          	bgez	a5,2f2 <stat+0x32>
    return -1;
     2ee:	57fd                	li	a5,-1
     2f0:	a035                	j	31c <stat+0x5c>
  r = fstat(fd, st);
     2f2:	fec42783          	lw	a5,-20(s0)
     2f6:	fd043583          	ld	a1,-48(s0)
     2fa:	853e                	mv	a0,a5
     2fc:	00000097          	auipc	ra,0x0
     300:	27a080e7          	jalr	634(ra) # 576 <fstat>
     304:	87aa                	mv	a5,a0
     306:	fef42423          	sw	a5,-24(s0)
  close(fd);
     30a:	fec42783          	lw	a5,-20(s0)
     30e:	853e                	mv	a0,a5
     310:	00000097          	auipc	ra,0x0
     314:	236080e7          	jalr	566(ra) # 546 <close>
  return r;
     318:	fe842783          	lw	a5,-24(s0)
}
     31c:	853e                	mv	a0,a5
     31e:	70a2                	ld	ra,40(sp)
     320:	7402                	ld	s0,32(sp)
     322:	6145                	addi	sp,sp,48
     324:	8082                	ret

0000000000000326 <atoi>:

int
atoi(const char *s)
{
     326:	7179                	addi	sp,sp,-48
     328:	f422                	sd	s0,40(sp)
     32a:	1800                	addi	s0,sp,48
     32c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     330:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     334:	a815                	j	368 <atoi+0x42>
    n = n*10 + *s++ - '0';
     336:	fec42703          	lw	a4,-20(s0)
     33a:	87ba                	mv	a5,a4
     33c:	0027979b          	slliw	a5,a5,0x2
     340:	9fb9                	addw	a5,a5,a4
     342:	0017979b          	slliw	a5,a5,0x1
     346:	0007871b          	sext.w	a4,a5
     34a:	fd843783          	ld	a5,-40(s0)
     34e:	00178693          	addi	a3,a5,1
     352:	fcd43c23          	sd	a3,-40(s0)
     356:	0007c783          	lbu	a5,0(a5)
     35a:	2781                	sext.w	a5,a5
     35c:	9fb9                	addw	a5,a5,a4
     35e:	2781                	sext.w	a5,a5
     360:	fd07879b          	addiw	a5,a5,-48
     364:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     368:	fd843783          	ld	a5,-40(s0)
     36c:	0007c783          	lbu	a5,0(a5)
     370:	873e                	mv	a4,a5
     372:	02f00793          	li	a5,47
     376:	00e7fb63          	bgeu	a5,a4,38c <atoi+0x66>
     37a:	fd843783          	ld	a5,-40(s0)
     37e:	0007c783          	lbu	a5,0(a5)
     382:	873e                	mv	a4,a5
     384:	03900793          	li	a5,57
     388:	fae7f7e3          	bgeu	a5,a4,336 <atoi+0x10>
  return n;
     38c:	fec42783          	lw	a5,-20(s0)
}
     390:	853e                	mv	a0,a5
     392:	7422                	ld	s0,40(sp)
     394:	6145                	addi	sp,sp,48
     396:	8082                	ret

0000000000000398 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     398:	7139                	addi	sp,sp,-64
     39a:	fc22                	sd	s0,56(sp)
     39c:	0080                	addi	s0,sp,64
     39e:	fca43c23          	sd	a0,-40(s0)
     3a2:	fcb43823          	sd	a1,-48(s0)
     3a6:	87b2                	mv	a5,a2
     3a8:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3ac:	fd843783          	ld	a5,-40(s0)
     3b0:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3b4:	fd043783          	ld	a5,-48(s0)
     3b8:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3bc:	fe043703          	ld	a4,-32(s0)
     3c0:	fe843783          	ld	a5,-24(s0)
     3c4:	02e7fc63          	bgeu	a5,a4,3fc <memmove+0x64>
    while(n-- > 0)
     3c8:	a00d                	j	3ea <memmove+0x52>
      *dst++ = *src++;
     3ca:	fe043703          	ld	a4,-32(s0)
     3ce:	00170793          	addi	a5,a4,1
     3d2:	fef43023          	sd	a5,-32(s0)
     3d6:	fe843783          	ld	a5,-24(s0)
     3da:	00178693          	addi	a3,a5,1
     3de:	fed43423          	sd	a3,-24(s0)
     3e2:	00074703          	lbu	a4,0(a4)
     3e6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     3ea:	fcc42783          	lw	a5,-52(s0)
     3ee:	fff7871b          	addiw	a4,a5,-1
     3f2:	fce42623          	sw	a4,-52(s0)
     3f6:	fcf04ae3          	bgtz	a5,3ca <memmove+0x32>
     3fa:	a891                	j	44e <memmove+0xb6>
  } else {
    dst += n;
     3fc:	fcc42783          	lw	a5,-52(s0)
     400:	fe843703          	ld	a4,-24(s0)
     404:	97ba                	add	a5,a5,a4
     406:	fef43423          	sd	a5,-24(s0)
    src += n;
     40a:	fcc42783          	lw	a5,-52(s0)
     40e:	fe043703          	ld	a4,-32(s0)
     412:	97ba                	add	a5,a5,a4
     414:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     418:	a01d                	j	43e <memmove+0xa6>
      *--dst = *--src;
     41a:	fe043783          	ld	a5,-32(s0)
     41e:	17fd                	addi	a5,a5,-1
     420:	fef43023          	sd	a5,-32(s0)
     424:	fe843783          	ld	a5,-24(s0)
     428:	17fd                	addi	a5,a5,-1
     42a:	fef43423          	sd	a5,-24(s0)
     42e:	fe043783          	ld	a5,-32(s0)
     432:	0007c703          	lbu	a4,0(a5)
     436:	fe843783          	ld	a5,-24(s0)
     43a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     43e:	fcc42783          	lw	a5,-52(s0)
     442:	fff7871b          	addiw	a4,a5,-1
     446:	fce42623          	sw	a4,-52(s0)
     44a:	fcf048e3          	bgtz	a5,41a <memmove+0x82>
  }
  return vdst;
     44e:	fd843783          	ld	a5,-40(s0)
}
     452:	853e                	mv	a0,a5
     454:	7462                	ld	s0,56(sp)
     456:	6121                	addi	sp,sp,64
     458:	8082                	ret

000000000000045a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     45a:	7139                	addi	sp,sp,-64
     45c:	fc22                	sd	s0,56(sp)
     45e:	0080                	addi	s0,sp,64
     460:	fca43c23          	sd	a0,-40(s0)
     464:	fcb43823          	sd	a1,-48(s0)
     468:	87b2                	mv	a5,a2
     46a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     46e:	fd843783          	ld	a5,-40(s0)
     472:	fef43423          	sd	a5,-24(s0)
     476:	fd043783          	ld	a5,-48(s0)
     47a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     47e:	a0a1                	j	4c6 <memcmp+0x6c>
    if (*p1 != *p2) {
     480:	fe843783          	ld	a5,-24(s0)
     484:	0007c703          	lbu	a4,0(a5)
     488:	fe043783          	ld	a5,-32(s0)
     48c:	0007c783          	lbu	a5,0(a5)
     490:	02f70163          	beq	a4,a5,4b2 <memcmp+0x58>
      return *p1 - *p2;
     494:	fe843783          	ld	a5,-24(s0)
     498:	0007c783          	lbu	a5,0(a5)
     49c:	0007871b          	sext.w	a4,a5
     4a0:	fe043783          	ld	a5,-32(s0)
     4a4:	0007c783          	lbu	a5,0(a5)
     4a8:	2781                	sext.w	a5,a5
     4aa:	40f707bb          	subw	a5,a4,a5
     4ae:	2781                	sext.w	a5,a5
     4b0:	a01d                	j	4d6 <memcmp+0x7c>
    }
    p1++;
     4b2:	fe843783          	ld	a5,-24(s0)
     4b6:	0785                	addi	a5,a5,1
     4b8:	fef43423          	sd	a5,-24(s0)
    p2++;
     4bc:	fe043783          	ld	a5,-32(s0)
     4c0:	0785                	addi	a5,a5,1
     4c2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4c6:	fcc42783          	lw	a5,-52(s0)
     4ca:	fff7871b          	addiw	a4,a5,-1
     4ce:	fce42623          	sw	a4,-52(s0)
     4d2:	f7dd                	bnez	a5,480 <memcmp+0x26>
  }
  return 0;
     4d4:	4781                	li	a5,0
}
     4d6:	853e                	mv	a0,a5
     4d8:	7462                	ld	s0,56(sp)
     4da:	6121                	addi	sp,sp,64
     4dc:	8082                	ret

00000000000004de <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4de:	7179                	addi	sp,sp,-48
     4e0:	f406                	sd	ra,40(sp)
     4e2:	f022                	sd	s0,32(sp)
     4e4:	1800                	addi	s0,sp,48
     4e6:	fea43423          	sd	a0,-24(s0)
     4ea:	feb43023          	sd	a1,-32(s0)
     4ee:	87b2                	mv	a5,a2
     4f0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     4f4:	fdc42783          	lw	a5,-36(s0)
     4f8:	863e                	mv	a2,a5
     4fa:	fe043583          	ld	a1,-32(s0)
     4fe:	fe843503          	ld	a0,-24(s0)
     502:	00000097          	auipc	ra,0x0
     506:	e96080e7          	jalr	-362(ra) # 398 <memmove>
     50a:	87aa                	mv	a5,a0
}
     50c:	853e                	mv	a0,a5
     50e:	70a2                	ld	ra,40(sp)
     510:	7402                	ld	s0,32(sp)
     512:	6145                	addi	sp,sp,48
     514:	8082                	ret

0000000000000516 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     516:	4885                	li	a7,1
 ecall
     518:	00000073          	ecall
 ret
     51c:	8082                	ret

000000000000051e <exit>:
.global exit
exit:
 li a7, SYS_exit
     51e:	4889                	li	a7,2
 ecall
     520:	00000073          	ecall
 ret
     524:	8082                	ret

0000000000000526 <wait>:
.global wait
wait:
 li a7, SYS_wait
     526:	488d                	li	a7,3
 ecall
     528:	00000073          	ecall
 ret
     52c:	8082                	ret

000000000000052e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     52e:	4891                	li	a7,4
 ecall
     530:	00000073          	ecall
 ret
     534:	8082                	ret

0000000000000536 <read>:
.global read
read:
 li a7, SYS_read
     536:	4895                	li	a7,5
 ecall
     538:	00000073          	ecall
 ret
     53c:	8082                	ret

000000000000053e <write>:
.global write
write:
 li a7, SYS_write
     53e:	48c1                	li	a7,16
 ecall
     540:	00000073          	ecall
 ret
     544:	8082                	ret

0000000000000546 <close>:
.global close
close:
 li a7, SYS_close
     546:	48d5                	li	a7,21
 ecall
     548:	00000073          	ecall
 ret
     54c:	8082                	ret

000000000000054e <kill>:
.global kill
kill:
 li a7, SYS_kill
     54e:	4899                	li	a7,6
 ecall
     550:	00000073          	ecall
 ret
     554:	8082                	ret

0000000000000556 <exec>:
.global exec
exec:
 li a7, SYS_exec
     556:	489d                	li	a7,7
 ecall
     558:	00000073          	ecall
 ret
     55c:	8082                	ret

000000000000055e <open>:
.global open
open:
 li a7, SYS_open
     55e:	48bd                	li	a7,15
 ecall
     560:	00000073          	ecall
 ret
     564:	8082                	ret

0000000000000566 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     566:	48c5                	li	a7,17
 ecall
     568:	00000073          	ecall
 ret
     56c:	8082                	ret

000000000000056e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     56e:	48c9                	li	a7,18
 ecall
     570:	00000073          	ecall
 ret
     574:	8082                	ret

0000000000000576 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     576:	48a1                	li	a7,8
 ecall
     578:	00000073          	ecall
 ret
     57c:	8082                	ret

000000000000057e <link>:
.global link
link:
 li a7, SYS_link
     57e:	48cd                	li	a7,19
 ecall
     580:	00000073          	ecall
 ret
     584:	8082                	ret

0000000000000586 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     586:	48d1                	li	a7,20
 ecall
     588:	00000073          	ecall
 ret
     58c:	8082                	ret

000000000000058e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     58e:	48a5                	li	a7,9
 ecall
     590:	00000073          	ecall
 ret
     594:	8082                	ret

0000000000000596 <dup>:
.global dup
dup:
 li a7, SYS_dup
     596:	48a9                	li	a7,10
 ecall
     598:	00000073          	ecall
 ret
     59c:	8082                	ret

000000000000059e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     59e:	48ad                	li	a7,11
 ecall
     5a0:	00000073          	ecall
 ret
     5a4:	8082                	ret

00000000000005a6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5a6:	48b1                	li	a7,12
 ecall
     5a8:	00000073          	ecall
 ret
     5ac:	8082                	ret

00000000000005ae <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5ae:	48b5                	li	a7,13
 ecall
     5b0:	00000073          	ecall
 ret
     5b4:	8082                	ret

00000000000005b6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5b6:	48b9                	li	a7,14
 ecall
     5b8:	00000073          	ecall
 ret
     5bc:	8082                	ret

00000000000005be <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5be:	48d9                	li	a7,22
 ecall
     5c0:	00000073          	ecall
 ret
     5c4:	8082                	ret

00000000000005c6 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5c6:	48dd                	li	a7,23
 ecall
     5c8:	00000073          	ecall
 ret
     5cc:	8082                	ret

00000000000005ce <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5ce:	48e1                	li	a7,24
 ecall
     5d0:	00000073          	ecall
 ret
     5d4:	8082                	ret

00000000000005d6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5d6:	1101                	addi	sp,sp,-32
     5d8:	ec06                	sd	ra,24(sp)
     5da:	e822                	sd	s0,16(sp)
     5dc:	1000                	addi	s0,sp,32
     5de:	87aa                	mv	a5,a0
     5e0:	872e                	mv	a4,a1
     5e2:	fef42623          	sw	a5,-20(s0)
     5e6:	87ba                	mv	a5,a4
     5e8:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     5ec:	feb40713          	addi	a4,s0,-21
     5f0:	fec42783          	lw	a5,-20(s0)
     5f4:	4605                	li	a2,1
     5f6:	85ba                	mv	a1,a4
     5f8:	853e                	mv	a0,a5
     5fa:	00000097          	auipc	ra,0x0
     5fe:	f44080e7          	jalr	-188(ra) # 53e <write>
}
     602:	0001                	nop
     604:	60e2                	ld	ra,24(sp)
     606:	6442                	ld	s0,16(sp)
     608:	6105                	addi	sp,sp,32
     60a:	8082                	ret

000000000000060c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     60c:	7139                	addi	sp,sp,-64
     60e:	fc06                	sd	ra,56(sp)
     610:	f822                	sd	s0,48(sp)
     612:	0080                	addi	s0,sp,64
     614:	87aa                	mv	a5,a0
     616:	8736                	mv	a4,a3
     618:	fcf42623          	sw	a5,-52(s0)
     61c:	87ae                	mv	a5,a1
     61e:	fcf42423          	sw	a5,-56(s0)
     622:	87b2                	mv	a5,a2
     624:	fcf42223          	sw	a5,-60(s0)
     628:	87ba                	mv	a5,a4
     62a:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     62e:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     632:	fc042783          	lw	a5,-64(s0)
     636:	2781                	sext.w	a5,a5
     638:	c38d                	beqz	a5,65a <printint+0x4e>
     63a:	fc842783          	lw	a5,-56(s0)
     63e:	2781                	sext.w	a5,a5
     640:	0007dd63          	bgez	a5,65a <printint+0x4e>
    neg = 1;
     644:	4785                	li	a5,1
     646:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     64a:	fc842783          	lw	a5,-56(s0)
     64e:	40f007bb          	negw	a5,a5
     652:	2781                	sext.w	a5,a5
     654:	fef42223          	sw	a5,-28(s0)
     658:	a029                	j	662 <printint+0x56>
  } else {
    x = xx;
     65a:	fc842783          	lw	a5,-56(s0)
     65e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     662:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     666:	fc442783          	lw	a5,-60(s0)
     66a:	fe442703          	lw	a4,-28(s0)
     66e:	02f777bb          	remuw	a5,a4,a5
     672:	0007861b          	sext.w	a2,a5
     676:	fec42783          	lw	a5,-20(s0)
     67a:	0017871b          	addiw	a4,a5,1
     67e:	fee42623          	sw	a4,-20(s0)
     682:	00001697          	auipc	a3,0x1
     686:	22668693          	addi	a3,a3,550 # 18a8 <digits>
     68a:	02061713          	slli	a4,a2,0x20
     68e:	9301                	srli	a4,a4,0x20
     690:	9736                	add	a4,a4,a3
     692:	00074703          	lbu	a4,0(a4)
     696:	ff040693          	addi	a3,s0,-16
     69a:	97b6                	add	a5,a5,a3
     69c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     6a0:	fc442783          	lw	a5,-60(s0)
     6a4:	fe442703          	lw	a4,-28(s0)
     6a8:	02f757bb          	divuw	a5,a4,a5
     6ac:	fef42223          	sw	a5,-28(s0)
     6b0:	fe442783          	lw	a5,-28(s0)
     6b4:	2781                	sext.w	a5,a5
     6b6:	fbc5                	bnez	a5,666 <printint+0x5a>
  if(neg)
     6b8:	fe842783          	lw	a5,-24(s0)
     6bc:	2781                	sext.w	a5,a5
     6be:	cf95                	beqz	a5,6fa <printint+0xee>
    buf[i++] = '-';
     6c0:	fec42783          	lw	a5,-20(s0)
     6c4:	0017871b          	addiw	a4,a5,1
     6c8:	fee42623          	sw	a4,-20(s0)
     6cc:	ff040713          	addi	a4,s0,-16
     6d0:	97ba                	add	a5,a5,a4
     6d2:	02d00713          	li	a4,45
     6d6:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6da:	a005                	j	6fa <printint+0xee>
    putc(fd, buf[i]);
     6dc:	fec42783          	lw	a5,-20(s0)
     6e0:	ff040713          	addi	a4,s0,-16
     6e4:	97ba                	add	a5,a5,a4
     6e6:	fe07c703          	lbu	a4,-32(a5)
     6ea:	fcc42783          	lw	a5,-52(s0)
     6ee:	85ba                	mv	a1,a4
     6f0:	853e                	mv	a0,a5
     6f2:	00000097          	auipc	ra,0x0
     6f6:	ee4080e7          	jalr	-284(ra) # 5d6 <putc>
  while(--i >= 0)
     6fa:	fec42783          	lw	a5,-20(s0)
     6fe:	37fd                	addiw	a5,a5,-1
     700:	fef42623          	sw	a5,-20(s0)
     704:	fec42783          	lw	a5,-20(s0)
     708:	2781                	sext.w	a5,a5
     70a:	fc07d9e3          	bgez	a5,6dc <printint+0xd0>
}
     70e:	0001                	nop
     710:	0001                	nop
     712:	70e2                	ld	ra,56(sp)
     714:	7442                	ld	s0,48(sp)
     716:	6121                	addi	sp,sp,64
     718:	8082                	ret

000000000000071a <printptr>:

static void
printptr(int fd, uint64 x) {
     71a:	7179                	addi	sp,sp,-48
     71c:	f406                	sd	ra,40(sp)
     71e:	f022                	sd	s0,32(sp)
     720:	1800                	addi	s0,sp,48
     722:	87aa                	mv	a5,a0
     724:	fcb43823          	sd	a1,-48(s0)
     728:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     72c:	fdc42783          	lw	a5,-36(s0)
     730:	03000593          	li	a1,48
     734:	853e                	mv	a0,a5
     736:	00000097          	auipc	ra,0x0
     73a:	ea0080e7          	jalr	-352(ra) # 5d6 <putc>
  putc(fd, 'x');
     73e:	fdc42783          	lw	a5,-36(s0)
     742:	07800593          	li	a1,120
     746:	853e                	mv	a0,a5
     748:	00000097          	auipc	ra,0x0
     74c:	e8e080e7          	jalr	-370(ra) # 5d6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     750:	fe042623          	sw	zero,-20(s0)
     754:	a82d                	j	78e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     756:	fd043783          	ld	a5,-48(s0)
     75a:	93f1                	srli	a5,a5,0x3c
     75c:	00001717          	auipc	a4,0x1
     760:	14c70713          	addi	a4,a4,332 # 18a8 <digits>
     764:	97ba                	add	a5,a5,a4
     766:	0007c703          	lbu	a4,0(a5)
     76a:	fdc42783          	lw	a5,-36(s0)
     76e:	85ba                	mv	a1,a4
     770:	853e                	mv	a0,a5
     772:	00000097          	auipc	ra,0x0
     776:	e64080e7          	jalr	-412(ra) # 5d6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     77a:	fec42783          	lw	a5,-20(s0)
     77e:	2785                	addiw	a5,a5,1
     780:	fef42623          	sw	a5,-20(s0)
     784:	fd043783          	ld	a5,-48(s0)
     788:	0792                	slli	a5,a5,0x4
     78a:	fcf43823          	sd	a5,-48(s0)
     78e:	fec42783          	lw	a5,-20(s0)
     792:	873e                	mv	a4,a5
     794:	47bd                	li	a5,15
     796:	fce7f0e3          	bgeu	a5,a4,756 <printptr+0x3c>
}
     79a:	0001                	nop
     79c:	0001                	nop
     79e:	70a2                	ld	ra,40(sp)
     7a0:	7402                	ld	s0,32(sp)
     7a2:	6145                	addi	sp,sp,48
     7a4:	8082                	ret

00000000000007a6 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7a6:	715d                	addi	sp,sp,-80
     7a8:	e486                	sd	ra,72(sp)
     7aa:	e0a2                	sd	s0,64(sp)
     7ac:	0880                	addi	s0,sp,80
     7ae:	87aa                	mv	a5,a0
     7b0:	fcb43023          	sd	a1,-64(s0)
     7b4:	fac43c23          	sd	a2,-72(s0)
     7b8:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7bc:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7c0:	fe042223          	sw	zero,-28(s0)
     7c4:	a42d                	j	9ee <vprintf+0x248>
    c = fmt[i] & 0xff;
     7c6:	fe442783          	lw	a5,-28(s0)
     7ca:	fc043703          	ld	a4,-64(s0)
     7ce:	97ba                	add	a5,a5,a4
     7d0:	0007c783          	lbu	a5,0(a5)
     7d4:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7d8:	fe042783          	lw	a5,-32(s0)
     7dc:	2781                	sext.w	a5,a5
     7de:	eb9d                	bnez	a5,814 <vprintf+0x6e>
      if(c == '%'){
     7e0:	fdc42783          	lw	a5,-36(s0)
     7e4:	0007871b          	sext.w	a4,a5
     7e8:	02500793          	li	a5,37
     7ec:	00f71763          	bne	a4,a5,7fa <vprintf+0x54>
        state = '%';
     7f0:	02500793          	li	a5,37
     7f4:	fef42023          	sw	a5,-32(s0)
     7f8:	a2f5                	j	9e4 <vprintf+0x23e>
      } else {
        putc(fd, c);
     7fa:	fdc42783          	lw	a5,-36(s0)
     7fe:	0ff7f713          	andi	a4,a5,255
     802:	fcc42783          	lw	a5,-52(s0)
     806:	85ba                	mv	a1,a4
     808:	853e                	mv	a0,a5
     80a:	00000097          	auipc	ra,0x0
     80e:	dcc080e7          	jalr	-564(ra) # 5d6 <putc>
     812:	aac9                	j	9e4 <vprintf+0x23e>
      }
    } else if(state == '%'){
     814:	fe042783          	lw	a5,-32(s0)
     818:	0007871b          	sext.w	a4,a5
     81c:	02500793          	li	a5,37
     820:	1cf71263          	bne	a4,a5,9e4 <vprintf+0x23e>
      if(c == 'd'){
     824:	fdc42783          	lw	a5,-36(s0)
     828:	0007871b          	sext.w	a4,a5
     82c:	06400793          	li	a5,100
     830:	02f71463          	bne	a4,a5,858 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     834:	fb843783          	ld	a5,-72(s0)
     838:	00878713          	addi	a4,a5,8
     83c:	fae43c23          	sd	a4,-72(s0)
     840:	4398                	lw	a4,0(a5)
     842:	fcc42783          	lw	a5,-52(s0)
     846:	4685                	li	a3,1
     848:	4629                	li	a2,10
     84a:	85ba                	mv	a1,a4
     84c:	853e                	mv	a0,a5
     84e:	00000097          	auipc	ra,0x0
     852:	dbe080e7          	jalr	-578(ra) # 60c <printint>
     856:	a269                	j	9e0 <vprintf+0x23a>
      } else if(c == 'l') {
     858:	fdc42783          	lw	a5,-36(s0)
     85c:	0007871b          	sext.w	a4,a5
     860:	06c00793          	li	a5,108
     864:	02f71663          	bne	a4,a5,890 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     868:	fb843783          	ld	a5,-72(s0)
     86c:	00878713          	addi	a4,a5,8
     870:	fae43c23          	sd	a4,-72(s0)
     874:	639c                	ld	a5,0(a5)
     876:	0007871b          	sext.w	a4,a5
     87a:	fcc42783          	lw	a5,-52(s0)
     87e:	4681                	li	a3,0
     880:	4629                	li	a2,10
     882:	85ba                	mv	a1,a4
     884:	853e                	mv	a0,a5
     886:	00000097          	auipc	ra,0x0
     88a:	d86080e7          	jalr	-634(ra) # 60c <printint>
     88e:	aa89                	j	9e0 <vprintf+0x23a>
      } else if(c == 'x') {
     890:	fdc42783          	lw	a5,-36(s0)
     894:	0007871b          	sext.w	a4,a5
     898:	07800793          	li	a5,120
     89c:	02f71463          	bne	a4,a5,8c4 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     8a0:	fb843783          	ld	a5,-72(s0)
     8a4:	00878713          	addi	a4,a5,8
     8a8:	fae43c23          	sd	a4,-72(s0)
     8ac:	4398                	lw	a4,0(a5)
     8ae:	fcc42783          	lw	a5,-52(s0)
     8b2:	4681                	li	a3,0
     8b4:	4641                	li	a2,16
     8b6:	85ba                	mv	a1,a4
     8b8:	853e                	mv	a0,a5
     8ba:	00000097          	auipc	ra,0x0
     8be:	d52080e7          	jalr	-686(ra) # 60c <printint>
     8c2:	aa39                	j	9e0 <vprintf+0x23a>
      } else if(c == 'p') {
     8c4:	fdc42783          	lw	a5,-36(s0)
     8c8:	0007871b          	sext.w	a4,a5
     8cc:	07000793          	li	a5,112
     8d0:	02f71263          	bne	a4,a5,8f4 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8d4:	fb843783          	ld	a5,-72(s0)
     8d8:	00878713          	addi	a4,a5,8
     8dc:	fae43c23          	sd	a4,-72(s0)
     8e0:	6398                	ld	a4,0(a5)
     8e2:	fcc42783          	lw	a5,-52(s0)
     8e6:	85ba                	mv	a1,a4
     8e8:	853e                	mv	a0,a5
     8ea:	00000097          	auipc	ra,0x0
     8ee:	e30080e7          	jalr	-464(ra) # 71a <printptr>
     8f2:	a0fd                	j	9e0 <vprintf+0x23a>
      } else if(c == 's'){
     8f4:	fdc42783          	lw	a5,-36(s0)
     8f8:	0007871b          	sext.w	a4,a5
     8fc:	07300793          	li	a5,115
     900:	04f71c63          	bne	a4,a5,958 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     904:	fb843783          	ld	a5,-72(s0)
     908:	00878713          	addi	a4,a5,8
     90c:	fae43c23          	sd	a4,-72(s0)
     910:	639c                	ld	a5,0(a5)
     912:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     916:	fe843783          	ld	a5,-24(s0)
     91a:	eb8d                	bnez	a5,94c <vprintf+0x1a6>
          s = "(null)";
     91c:	00001797          	auipc	a5,0x1
     920:	f8478793          	addi	a5,a5,-124 # 18a0 <schedule_dm+0x2b6>
     924:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     928:	a015                	j	94c <vprintf+0x1a6>
          putc(fd, *s);
     92a:	fe843783          	ld	a5,-24(s0)
     92e:	0007c703          	lbu	a4,0(a5)
     932:	fcc42783          	lw	a5,-52(s0)
     936:	85ba                	mv	a1,a4
     938:	853e                	mv	a0,a5
     93a:	00000097          	auipc	ra,0x0
     93e:	c9c080e7          	jalr	-868(ra) # 5d6 <putc>
          s++;
     942:	fe843783          	ld	a5,-24(s0)
     946:	0785                	addi	a5,a5,1
     948:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     94c:	fe843783          	ld	a5,-24(s0)
     950:	0007c783          	lbu	a5,0(a5)
     954:	fbf9                	bnez	a5,92a <vprintf+0x184>
     956:	a069                	j	9e0 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     958:	fdc42783          	lw	a5,-36(s0)
     95c:	0007871b          	sext.w	a4,a5
     960:	06300793          	li	a5,99
     964:	02f71463          	bne	a4,a5,98c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     968:	fb843783          	ld	a5,-72(s0)
     96c:	00878713          	addi	a4,a5,8
     970:	fae43c23          	sd	a4,-72(s0)
     974:	439c                	lw	a5,0(a5)
     976:	0ff7f713          	andi	a4,a5,255
     97a:	fcc42783          	lw	a5,-52(s0)
     97e:	85ba                	mv	a1,a4
     980:	853e                	mv	a0,a5
     982:	00000097          	auipc	ra,0x0
     986:	c54080e7          	jalr	-940(ra) # 5d6 <putc>
     98a:	a899                	j	9e0 <vprintf+0x23a>
      } else if(c == '%'){
     98c:	fdc42783          	lw	a5,-36(s0)
     990:	0007871b          	sext.w	a4,a5
     994:	02500793          	li	a5,37
     998:	00f71f63          	bne	a4,a5,9b6 <vprintf+0x210>
        putc(fd, c);
     99c:	fdc42783          	lw	a5,-36(s0)
     9a0:	0ff7f713          	andi	a4,a5,255
     9a4:	fcc42783          	lw	a5,-52(s0)
     9a8:	85ba                	mv	a1,a4
     9aa:	853e                	mv	a0,a5
     9ac:	00000097          	auipc	ra,0x0
     9b0:	c2a080e7          	jalr	-982(ra) # 5d6 <putc>
     9b4:	a035                	j	9e0 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9b6:	fcc42783          	lw	a5,-52(s0)
     9ba:	02500593          	li	a1,37
     9be:	853e                	mv	a0,a5
     9c0:	00000097          	auipc	ra,0x0
     9c4:	c16080e7          	jalr	-1002(ra) # 5d6 <putc>
        putc(fd, c);
     9c8:	fdc42783          	lw	a5,-36(s0)
     9cc:	0ff7f713          	andi	a4,a5,255
     9d0:	fcc42783          	lw	a5,-52(s0)
     9d4:	85ba                	mv	a1,a4
     9d6:	853e                	mv	a0,a5
     9d8:	00000097          	auipc	ra,0x0
     9dc:	bfe080e7          	jalr	-1026(ra) # 5d6 <putc>
      }
      state = 0;
     9e0:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     9e4:	fe442783          	lw	a5,-28(s0)
     9e8:	2785                	addiw	a5,a5,1
     9ea:	fef42223          	sw	a5,-28(s0)
     9ee:	fe442783          	lw	a5,-28(s0)
     9f2:	fc043703          	ld	a4,-64(s0)
     9f6:	97ba                	add	a5,a5,a4
     9f8:	0007c783          	lbu	a5,0(a5)
     9fc:	dc0795e3          	bnez	a5,7c6 <vprintf+0x20>
    }
  }
}
     a00:	0001                	nop
     a02:	0001                	nop
     a04:	60a6                	ld	ra,72(sp)
     a06:	6406                	ld	s0,64(sp)
     a08:	6161                	addi	sp,sp,80
     a0a:	8082                	ret

0000000000000a0c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a0c:	7159                	addi	sp,sp,-112
     a0e:	fc06                	sd	ra,56(sp)
     a10:	f822                	sd	s0,48(sp)
     a12:	0080                	addi	s0,sp,64
     a14:	fcb43823          	sd	a1,-48(s0)
     a18:	e010                	sd	a2,0(s0)
     a1a:	e414                	sd	a3,8(s0)
     a1c:	e818                	sd	a4,16(s0)
     a1e:	ec1c                	sd	a5,24(s0)
     a20:	03043023          	sd	a6,32(s0)
     a24:	03143423          	sd	a7,40(s0)
     a28:	87aa                	mv	a5,a0
     a2a:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a2e:	03040793          	addi	a5,s0,48
     a32:	fcf43423          	sd	a5,-56(s0)
     a36:	fc843783          	ld	a5,-56(s0)
     a3a:	fd078793          	addi	a5,a5,-48
     a3e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a42:	fe843703          	ld	a4,-24(s0)
     a46:	fdc42783          	lw	a5,-36(s0)
     a4a:	863a                	mv	a2,a4
     a4c:	fd043583          	ld	a1,-48(s0)
     a50:	853e                	mv	a0,a5
     a52:	00000097          	auipc	ra,0x0
     a56:	d54080e7          	jalr	-684(ra) # 7a6 <vprintf>
}
     a5a:	0001                	nop
     a5c:	70e2                	ld	ra,56(sp)
     a5e:	7442                	ld	s0,48(sp)
     a60:	6165                	addi	sp,sp,112
     a62:	8082                	ret

0000000000000a64 <printf>:

void
printf(const char *fmt, ...)
{
     a64:	7159                	addi	sp,sp,-112
     a66:	f406                	sd	ra,40(sp)
     a68:	f022                	sd	s0,32(sp)
     a6a:	1800                	addi	s0,sp,48
     a6c:	fca43c23          	sd	a0,-40(s0)
     a70:	e40c                	sd	a1,8(s0)
     a72:	e810                	sd	a2,16(s0)
     a74:	ec14                	sd	a3,24(s0)
     a76:	f018                	sd	a4,32(s0)
     a78:	f41c                	sd	a5,40(s0)
     a7a:	03043823          	sd	a6,48(s0)
     a7e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a82:	04040793          	addi	a5,s0,64
     a86:	fcf43823          	sd	a5,-48(s0)
     a8a:	fd043783          	ld	a5,-48(s0)
     a8e:	fc878793          	addi	a5,a5,-56
     a92:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     a96:	fe843783          	ld	a5,-24(s0)
     a9a:	863e                	mv	a2,a5
     a9c:	fd843583          	ld	a1,-40(s0)
     aa0:	4505                	li	a0,1
     aa2:	00000097          	auipc	ra,0x0
     aa6:	d04080e7          	jalr	-764(ra) # 7a6 <vprintf>
}
     aaa:	0001                	nop
     aac:	70a2                	ld	ra,40(sp)
     aae:	7402                	ld	s0,32(sp)
     ab0:	6165                	addi	sp,sp,112
     ab2:	8082                	ret

0000000000000ab4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ab4:	7179                	addi	sp,sp,-48
     ab6:	f422                	sd	s0,40(sp)
     ab8:	1800                	addi	s0,sp,48
     aba:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     abe:	fd843783          	ld	a5,-40(s0)
     ac2:	17c1                	addi	a5,a5,-16
     ac4:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ac8:	00001797          	auipc	a5,0x1
     acc:	e0878793          	addi	a5,a5,-504 # 18d0 <freep>
     ad0:	639c                	ld	a5,0(a5)
     ad2:	fef43423          	sd	a5,-24(s0)
     ad6:	a815                	j	b0a <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ad8:	fe843783          	ld	a5,-24(s0)
     adc:	639c                	ld	a5,0(a5)
     ade:	fe843703          	ld	a4,-24(s0)
     ae2:	00f76f63          	bltu	a4,a5,b00 <free+0x4c>
     ae6:	fe043703          	ld	a4,-32(s0)
     aea:	fe843783          	ld	a5,-24(s0)
     aee:	02e7eb63          	bltu	a5,a4,b24 <free+0x70>
     af2:	fe843783          	ld	a5,-24(s0)
     af6:	639c                	ld	a5,0(a5)
     af8:	fe043703          	ld	a4,-32(s0)
     afc:	02f76463          	bltu	a4,a5,b24 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b00:	fe843783          	ld	a5,-24(s0)
     b04:	639c                	ld	a5,0(a5)
     b06:	fef43423          	sd	a5,-24(s0)
     b0a:	fe043703          	ld	a4,-32(s0)
     b0e:	fe843783          	ld	a5,-24(s0)
     b12:	fce7f3e3          	bgeu	a5,a4,ad8 <free+0x24>
     b16:	fe843783          	ld	a5,-24(s0)
     b1a:	639c                	ld	a5,0(a5)
     b1c:	fe043703          	ld	a4,-32(s0)
     b20:	faf77ce3          	bgeu	a4,a5,ad8 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b24:	fe043783          	ld	a5,-32(s0)
     b28:	479c                	lw	a5,8(a5)
     b2a:	1782                	slli	a5,a5,0x20
     b2c:	9381                	srli	a5,a5,0x20
     b2e:	0792                	slli	a5,a5,0x4
     b30:	fe043703          	ld	a4,-32(s0)
     b34:	973e                	add	a4,a4,a5
     b36:	fe843783          	ld	a5,-24(s0)
     b3a:	639c                	ld	a5,0(a5)
     b3c:	02f71763          	bne	a4,a5,b6a <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b40:	fe043783          	ld	a5,-32(s0)
     b44:	4798                	lw	a4,8(a5)
     b46:	fe843783          	ld	a5,-24(s0)
     b4a:	639c                	ld	a5,0(a5)
     b4c:	479c                	lw	a5,8(a5)
     b4e:	9fb9                	addw	a5,a5,a4
     b50:	0007871b          	sext.w	a4,a5
     b54:	fe043783          	ld	a5,-32(s0)
     b58:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b5a:	fe843783          	ld	a5,-24(s0)
     b5e:	639c                	ld	a5,0(a5)
     b60:	6398                	ld	a4,0(a5)
     b62:	fe043783          	ld	a5,-32(s0)
     b66:	e398                	sd	a4,0(a5)
     b68:	a039                	j	b76 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b6a:	fe843783          	ld	a5,-24(s0)
     b6e:	6398                	ld	a4,0(a5)
     b70:	fe043783          	ld	a5,-32(s0)
     b74:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b76:	fe843783          	ld	a5,-24(s0)
     b7a:	479c                	lw	a5,8(a5)
     b7c:	1782                	slli	a5,a5,0x20
     b7e:	9381                	srli	a5,a5,0x20
     b80:	0792                	slli	a5,a5,0x4
     b82:	fe843703          	ld	a4,-24(s0)
     b86:	97ba                	add	a5,a5,a4
     b88:	fe043703          	ld	a4,-32(s0)
     b8c:	02f71563          	bne	a4,a5,bb6 <free+0x102>
    p->s.size += bp->s.size;
     b90:	fe843783          	ld	a5,-24(s0)
     b94:	4798                	lw	a4,8(a5)
     b96:	fe043783          	ld	a5,-32(s0)
     b9a:	479c                	lw	a5,8(a5)
     b9c:	9fb9                	addw	a5,a5,a4
     b9e:	0007871b          	sext.w	a4,a5
     ba2:	fe843783          	ld	a5,-24(s0)
     ba6:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     ba8:	fe043783          	ld	a5,-32(s0)
     bac:	6398                	ld	a4,0(a5)
     bae:	fe843783          	ld	a5,-24(s0)
     bb2:	e398                	sd	a4,0(a5)
     bb4:	a031                	j	bc0 <free+0x10c>
  } else
    p->s.ptr = bp;
     bb6:	fe843783          	ld	a5,-24(s0)
     bba:	fe043703          	ld	a4,-32(s0)
     bbe:	e398                	sd	a4,0(a5)
  freep = p;
     bc0:	00001797          	auipc	a5,0x1
     bc4:	d1078793          	addi	a5,a5,-752 # 18d0 <freep>
     bc8:	fe843703          	ld	a4,-24(s0)
     bcc:	e398                	sd	a4,0(a5)
}
     bce:	0001                	nop
     bd0:	7422                	ld	s0,40(sp)
     bd2:	6145                	addi	sp,sp,48
     bd4:	8082                	ret

0000000000000bd6 <morecore>:

static Header*
morecore(uint nu)
{
     bd6:	7179                	addi	sp,sp,-48
     bd8:	f406                	sd	ra,40(sp)
     bda:	f022                	sd	s0,32(sp)
     bdc:	1800                	addi	s0,sp,48
     bde:	87aa                	mv	a5,a0
     be0:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     be4:	fdc42783          	lw	a5,-36(s0)
     be8:	0007871b          	sext.w	a4,a5
     bec:	6785                	lui	a5,0x1
     bee:	00f77563          	bgeu	a4,a5,bf8 <morecore+0x22>
    nu = 4096;
     bf2:	6785                	lui	a5,0x1
     bf4:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     bf8:	fdc42783          	lw	a5,-36(s0)
     bfc:	0047979b          	slliw	a5,a5,0x4
     c00:	2781                	sext.w	a5,a5
     c02:	2781                	sext.w	a5,a5
     c04:	853e                	mv	a0,a5
     c06:	00000097          	auipc	ra,0x0
     c0a:	9a0080e7          	jalr	-1632(ra) # 5a6 <sbrk>
     c0e:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c12:	fe843703          	ld	a4,-24(s0)
     c16:	57fd                	li	a5,-1
     c18:	00f71463          	bne	a4,a5,c20 <morecore+0x4a>
    return 0;
     c1c:	4781                	li	a5,0
     c1e:	a03d                	j	c4c <morecore+0x76>
  hp = (Header*)p;
     c20:	fe843783          	ld	a5,-24(s0)
     c24:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c28:	fe043783          	ld	a5,-32(s0)
     c2c:	fdc42703          	lw	a4,-36(s0)
     c30:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c32:	fe043783          	ld	a5,-32(s0)
     c36:	07c1                	addi	a5,a5,16
     c38:	853e                	mv	a0,a5
     c3a:	00000097          	auipc	ra,0x0
     c3e:	e7a080e7          	jalr	-390(ra) # ab4 <free>
  return freep;
     c42:	00001797          	auipc	a5,0x1
     c46:	c8e78793          	addi	a5,a5,-882 # 18d0 <freep>
     c4a:	639c                	ld	a5,0(a5)
}
     c4c:	853e                	mv	a0,a5
     c4e:	70a2                	ld	ra,40(sp)
     c50:	7402                	ld	s0,32(sp)
     c52:	6145                	addi	sp,sp,48
     c54:	8082                	ret

0000000000000c56 <malloc>:

void*
malloc(uint nbytes)
{
     c56:	7139                	addi	sp,sp,-64
     c58:	fc06                	sd	ra,56(sp)
     c5a:	f822                	sd	s0,48(sp)
     c5c:	0080                	addi	s0,sp,64
     c5e:	87aa                	mv	a5,a0
     c60:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c64:	fcc46783          	lwu	a5,-52(s0)
     c68:	07bd                	addi	a5,a5,15
     c6a:	8391                	srli	a5,a5,0x4
     c6c:	2781                	sext.w	a5,a5
     c6e:	2785                	addiw	a5,a5,1
     c70:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c74:	00001797          	auipc	a5,0x1
     c78:	c5c78793          	addi	a5,a5,-932 # 18d0 <freep>
     c7c:	639c                	ld	a5,0(a5)
     c7e:	fef43023          	sd	a5,-32(s0)
     c82:	fe043783          	ld	a5,-32(s0)
     c86:	ef95                	bnez	a5,cc2 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     c88:	00001797          	auipc	a5,0x1
     c8c:	c3878793          	addi	a5,a5,-968 # 18c0 <base>
     c90:	fef43023          	sd	a5,-32(s0)
     c94:	00001797          	auipc	a5,0x1
     c98:	c3c78793          	addi	a5,a5,-964 # 18d0 <freep>
     c9c:	fe043703          	ld	a4,-32(s0)
     ca0:	e398                	sd	a4,0(a5)
     ca2:	00001797          	auipc	a5,0x1
     ca6:	c2e78793          	addi	a5,a5,-978 # 18d0 <freep>
     caa:	6398                	ld	a4,0(a5)
     cac:	00001797          	auipc	a5,0x1
     cb0:	c1478793          	addi	a5,a5,-1004 # 18c0 <base>
     cb4:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     cb6:	00001797          	auipc	a5,0x1
     cba:	c0a78793          	addi	a5,a5,-1014 # 18c0 <base>
     cbe:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     cc2:	fe043783          	ld	a5,-32(s0)
     cc6:	639c                	ld	a5,0(a5)
     cc8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     ccc:	fe843783          	ld	a5,-24(s0)
     cd0:	4798                	lw	a4,8(a5)
     cd2:	fdc42783          	lw	a5,-36(s0)
     cd6:	2781                	sext.w	a5,a5
     cd8:	06f76863          	bltu	a4,a5,d48 <malloc+0xf2>
      if(p->s.size == nunits)
     cdc:	fe843783          	ld	a5,-24(s0)
     ce0:	4798                	lw	a4,8(a5)
     ce2:	fdc42783          	lw	a5,-36(s0)
     ce6:	2781                	sext.w	a5,a5
     ce8:	00e79963          	bne	a5,a4,cfa <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     cec:	fe843783          	ld	a5,-24(s0)
     cf0:	6398                	ld	a4,0(a5)
     cf2:	fe043783          	ld	a5,-32(s0)
     cf6:	e398                	sd	a4,0(a5)
     cf8:	a82d                	j	d32 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     cfa:	fe843783          	ld	a5,-24(s0)
     cfe:	4798                	lw	a4,8(a5)
     d00:	fdc42783          	lw	a5,-36(s0)
     d04:	40f707bb          	subw	a5,a4,a5
     d08:	0007871b          	sext.w	a4,a5
     d0c:	fe843783          	ld	a5,-24(s0)
     d10:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d12:	fe843783          	ld	a5,-24(s0)
     d16:	479c                	lw	a5,8(a5)
     d18:	1782                	slli	a5,a5,0x20
     d1a:	9381                	srli	a5,a5,0x20
     d1c:	0792                	slli	a5,a5,0x4
     d1e:	fe843703          	ld	a4,-24(s0)
     d22:	97ba                	add	a5,a5,a4
     d24:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d28:	fe843783          	ld	a5,-24(s0)
     d2c:	fdc42703          	lw	a4,-36(s0)
     d30:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d32:	00001797          	auipc	a5,0x1
     d36:	b9e78793          	addi	a5,a5,-1122 # 18d0 <freep>
     d3a:	fe043703          	ld	a4,-32(s0)
     d3e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d40:	fe843783          	ld	a5,-24(s0)
     d44:	07c1                	addi	a5,a5,16
     d46:	a091                	j	d8a <malloc+0x134>
    }
    if(p == freep)
     d48:	00001797          	auipc	a5,0x1
     d4c:	b8878793          	addi	a5,a5,-1144 # 18d0 <freep>
     d50:	639c                	ld	a5,0(a5)
     d52:	fe843703          	ld	a4,-24(s0)
     d56:	02f71063          	bne	a4,a5,d76 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d5a:	fdc42783          	lw	a5,-36(s0)
     d5e:	853e                	mv	a0,a5
     d60:	00000097          	auipc	ra,0x0
     d64:	e76080e7          	jalr	-394(ra) # bd6 <morecore>
     d68:	fea43423          	sd	a0,-24(s0)
     d6c:	fe843783          	ld	a5,-24(s0)
     d70:	e399                	bnez	a5,d76 <malloc+0x120>
        return 0;
     d72:	4781                	li	a5,0
     d74:	a819                	j	d8a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d76:	fe843783          	ld	a5,-24(s0)
     d7a:	fef43023          	sd	a5,-32(s0)
     d7e:	fe843783          	ld	a5,-24(s0)
     d82:	639c                	ld	a5,0(a5)
     d84:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d88:	b791                	j	ccc <malloc+0x76>
  }
}
     d8a:	853e                	mv	a0,a5
     d8c:	70e2                	ld	ra,56(sp)
     d8e:	7442                	ld	s0,48(sp)
     d90:	6121                	addi	sp,sp,64
     d92:	8082                	ret

0000000000000d94 <setjmp>:
     d94:	e100                	sd	s0,0(a0)
     d96:	e504                	sd	s1,8(a0)
     d98:	01253823          	sd	s2,16(a0)
     d9c:	01353c23          	sd	s3,24(a0)
     da0:	03453023          	sd	s4,32(a0)
     da4:	03553423          	sd	s5,40(a0)
     da8:	03653823          	sd	s6,48(a0)
     dac:	03753c23          	sd	s7,56(a0)
     db0:	05853023          	sd	s8,64(a0)
     db4:	05953423          	sd	s9,72(a0)
     db8:	05a53823          	sd	s10,80(a0)
     dbc:	05b53c23          	sd	s11,88(a0)
     dc0:	06153023          	sd	ra,96(a0)
     dc4:	06253423          	sd	sp,104(a0)
     dc8:	4501                	li	a0,0
     dca:	8082                	ret

0000000000000dcc <longjmp>:
     dcc:	6100                	ld	s0,0(a0)
     dce:	6504                	ld	s1,8(a0)
     dd0:	01053903          	ld	s2,16(a0)
     dd4:	01853983          	ld	s3,24(a0)
     dd8:	02053a03          	ld	s4,32(a0)
     ddc:	02853a83          	ld	s5,40(a0)
     de0:	03053b03          	ld	s6,48(a0)
     de4:	03853b83          	ld	s7,56(a0)
     de8:	04053c03          	ld	s8,64(a0)
     dec:	04853c83          	ld	s9,72(a0)
     df0:	05053d03          	ld	s10,80(a0)
     df4:	05853d83          	ld	s11,88(a0)
     df8:	06053083          	ld	ra,96(a0)
     dfc:	06853103          	ld	sp,104(a0)
     e00:	c199                	beqz	a1,e06 <longjmp_1>
     e02:	852e                	mv	a0,a1
     e04:	8082                	ret

0000000000000e06 <longjmp_1>:
     e06:	4505                	li	a0,1
     e08:	8082                	ret

0000000000000e0a <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     e0a:	1101                	addi	sp,sp,-32
     e0c:	ec22                	sd	s0,24(sp)
     e0e:	1000                	addi	s0,sp,32
     e10:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     e14:	fe843783          	ld	a5,-24(s0)
     e18:	639c                	ld	a5,0(a5)
     e1a:	fe843703          	ld	a4,-24(s0)
     e1e:	40f707b3          	sub	a5,a4,a5
     e22:	0017b793          	seqz	a5,a5
     e26:	0ff7f793          	andi	a5,a5,255
     e2a:	2781                	sext.w	a5,a5
}
     e2c:	853e                	mv	a0,a5
     e2e:	6462                	ld	s0,24(sp)
     e30:	6105                	addi	sp,sp,32
     e32:	8082                	ret

0000000000000e34 <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
     e34:	715d                	addi	sp,sp,-80
     e36:	e4a2                	sd	s0,72(sp)
     e38:	e0a6                	sd	s1,64(sp)
     e3a:	0880                	addi	s0,sp,80
     e3c:	84aa                	mv	s1,a0
    int sleep_time = -1;
     e3e:	57fd                	li	a5,-1
     e40:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
     e44:	689c                	ld	a5,16(s1)
     e46:	639c                	ld	a5,0(a5)
     e48:	fcf43c23          	sd	a5,-40(s0)
     e4c:	fd843783          	ld	a5,-40(s0)
     e50:	17e1                	addi	a5,a5,-8
     e52:	fef43023          	sd	a5,-32(s0)
     e56:	a0a9                	j	ea0 <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
     e58:	fec42783          	lw	a5,-20(s0)
     e5c:	2781                	sext.w	a5,a5
     e5e:	0007cf63          	bltz	a5,e7c <fill_sparse+0x48>
     e62:	fe043783          	ld	a5,-32(s0)
     e66:	4f98                	lw	a4,24(a5)
     e68:	409c                	lw	a5,0(s1)
     e6a:	40f707bb          	subw	a5,a4,a5
     e6e:	0007871b          	sext.w	a4,a5
     e72:	fec42783          	lw	a5,-20(s0)
     e76:	2781                	sext.w	a5,a5
     e78:	00f75a63          	bge	a4,a5,e8c <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
     e7c:	fe043783          	ld	a5,-32(s0)
     e80:	4f98                	lw	a4,24(a5)
     e82:	409c                	lw	a5,0(s1)
     e84:	40f707bb          	subw	a5,a4,a5
     e88:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
     e8c:	fe043783          	ld	a5,-32(s0)
     e90:	679c                	ld	a5,8(a5)
     e92:	fcf43823          	sd	a5,-48(s0)
     e96:	fd043783          	ld	a5,-48(s0)
     e9a:	17e1                	addi	a5,a5,-8
     e9c:	fef43023          	sd	a5,-32(s0)
     ea0:	fe043783          	ld	a5,-32(s0)
     ea4:	00878713          	addi	a4,a5,8
     ea8:	689c                	ld	a5,16(s1)
     eaa:	faf717e3          	bne	a4,a5,e58 <fill_sparse+0x24>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = args.run_queue;
     eae:	649c                	ld	a5,8(s1)
     eb0:	faf43823          	sd	a5,-80(s0)
    r.allocated_time = sleep_time;
     eb4:	fec42783          	lw	a5,-20(s0)
     eb8:	faf42c23          	sw	a5,-72(s0)
    return r;    
     ebc:	fb043783          	ld	a5,-80(s0)
     ec0:	fcf43023          	sd	a5,-64(s0)
     ec4:	fb843783          	ld	a5,-72(s0)
     ec8:	fcf43423          	sd	a5,-56(s0)
     ecc:	4701                	li	a4,0
     ece:	fc043703          	ld	a4,-64(s0)
     ed2:	4781                	li	a5,0
     ed4:	fc843783          	ld	a5,-56(s0)
     ed8:	863a                	mv	a2,a4
     eda:	86be                	mv	a3,a5
     edc:	8732                	mv	a4,a2
     ede:	87b6                	mv	a5,a3
}
     ee0:	853a                	mv	a0,a4
     ee2:	85be                	mv	a1,a5
     ee4:	6426                	ld	s0,72(sp)
     ee6:	6486                	ld	s1,64(sp)
     ee8:	6161                	addi	sp,sp,80
     eea:	8082                	ret

0000000000000eec <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
     eec:	715d                	addi	sp,sp,-80
     eee:	e4a2                	sd	s0,72(sp)
     ef0:	e0a6                	sd	s1,64(sp)
     ef2:	0880                	addi	s0,sp,80
     ef4:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
     ef6:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
     efa:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     efe:	649c                	ld	a5,8(s1)
     f00:	639c                	ld	a5,0(a5)
     f02:	fcf43c23          	sd	a5,-40(s0)
     f06:	fd843783          	ld	a5,-40(s0)
     f0a:	fd878793          	addi	a5,a5,-40
     f0e:	fef43023          	sd	a5,-32(s0)
     f12:	a81d                	j	f48 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
     f14:	fe843783          	ld	a5,-24(s0)
     f18:	cb89                	beqz	a5,f2a <schedule_default+0x3e>
     f1a:	fe043783          	ld	a5,-32(s0)
     f1e:	5fd8                	lw	a4,60(a5)
     f20:	fe843783          	ld	a5,-24(s0)
     f24:	5fdc                	lw	a5,60(a5)
     f26:	00f75663          	bge	a4,a5,f32 <schedule_default+0x46>
            thread_with_smallest_id = th;
     f2a:	fe043783          	ld	a5,-32(s0)
     f2e:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     f32:	fe043783          	ld	a5,-32(s0)
     f36:	779c                	ld	a5,40(a5)
     f38:	fcf43823          	sd	a5,-48(s0)
     f3c:	fd043783          	ld	a5,-48(s0)
     f40:	fd878793          	addi	a5,a5,-40
     f44:	fef43023          	sd	a5,-32(s0)
     f48:	fe043783          	ld	a5,-32(s0)
     f4c:	02878713          	addi	a4,a5,40
     f50:	649c                	ld	a5,8(s1)
     f52:	fcf711e3          	bne	a4,a5,f14 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
     f56:	fe843783          	ld	a5,-24(s0)
     f5a:	cf89                	beqz	a5,f74 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
     f5c:	fe843783          	ld	a5,-24(s0)
     f60:	02878793          	addi	a5,a5,40
     f64:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
     f68:	fe843783          	ld	a5,-24(s0)
     f6c:	4fbc                	lw	a5,88(a5)
     f6e:	faf42c23          	sw	a5,-72(s0)
     f72:	a039                	j	f80 <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
     f74:	649c                	ld	a5,8(s1)
     f76:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
     f7a:	4785                	li	a5,1
     f7c:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
     f80:	fb043783          	ld	a5,-80(s0)
     f84:	fcf43023          	sd	a5,-64(s0)
     f88:	fb843783          	ld	a5,-72(s0)
     f8c:	fcf43423          	sd	a5,-56(s0)
     f90:	4701                	li	a4,0
     f92:	fc043703          	ld	a4,-64(s0)
     f96:	4781                	li	a5,0
     f98:	fc843783          	ld	a5,-56(s0)
     f9c:	863a                	mv	a2,a4
     f9e:	86be                	mv	a3,a5
     fa0:	8732                	mv	a4,a2
     fa2:	87b6                	mv	a5,a3
}
     fa4:	853a                	mv	a0,a4
     fa6:	85be                	mv	a1,a5
     fa8:	6426                	ld	s0,72(sp)
     faa:	6486                	ld	s1,64(sp)
     fac:	6161                	addi	sp,sp,80
     fae:	8082                	ret

0000000000000fb0 <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
     fb0:	7135                	addi	sp,sp,-160
     fb2:	ed06                	sd	ra,152(sp)
     fb4:	e922                	sd	s0,144(sp)
     fb6:	e526                	sd	s1,136(sp)
     fb8:	e14a                	sd	s2,128(sp)
     fba:	fcce                	sd	s3,120(sp)
     fbc:	1100                	addi	s0,sp,160
     fbe:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
     fc0:	649c                	ld	a5,8(s1)
     fc2:	853e                	mv	a0,a5
     fc4:	00000097          	auipc	ra,0x0
     fc8:	e46080e7          	jalr	-442(ra) # e0a <list_empty>
     fcc:	87aa                	mv	a5,a0
     fce:	cb85                	beqz	a5,ffe <schedule_wrr+0x4e>
        return fill_sparse(args);
     fd0:	609c                	ld	a5,0(s1)
     fd2:	f6f43023          	sd	a5,-160(s0)
     fd6:	649c                	ld	a5,8(s1)
     fd8:	f6f43423          	sd	a5,-152(s0)
     fdc:	689c                	ld	a5,16(s1)
     fde:	f6f43823          	sd	a5,-144(s0)
     fe2:	f6040793          	addi	a5,s0,-160
     fe6:	853e                	mv	a0,a5
     fe8:	00000097          	auipc	ra,0x0
     fec:	e4c080e7          	jalr	-436(ra) # e34 <fill_sparse>
     ff0:	872a                	mv	a4,a0
     ff2:	87ae                	mv	a5,a1
     ff4:	f8e43823          	sd	a4,-112(s0)
     ff8:	f8f43c23          	sd	a5,-104(s0)
     ffc:	a0c9                	j	10be <schedule_wrr+0x10e>

    struct thread *process_thread = NULL;
     ffe:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1002:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1006:	649c                	ld	a5,8(s1)
    1008:	639c                	ld	a5,0(a5)
    100a:	faf43823          	sd	a5,-80(s0)
    100e:	fb043783          	ld	a5,-80(s0)
    1012:	fd878793          	addi	a5,a5,-40
    1016:	fcf43023          	sd	a5,-64(s0)
    101a:	a025                	j	1042 <schedule_wrr+0x92>
        if (process_thread == NULL) {
    101c:	fc843783          	ld	a5,-56(s0)
    1020:	e791                	bnez	a5,102c <schedule_wrr+0x7c>
            process_thread = th;
    1022:	fc043783          	ld	a5,-64(s0)
    1026:	fcf43423          	sd	a5,-56(s0)
            break;
    102a:	a01d                	j	1050 <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
    102c:	fc043783          	ld	a5,-64(s0)
    1030:	779c                	ld	a5,40(a5)
    1032:	faf43423          	sd	a5,-88(s0)
    1036:	fa843783          	ld	a5,-88(s0)
    103a:	fd878793          	addi	a5,a5,-40
    103e:	fcf43023          	sd	a5,-64(s0)
    1042:	fc043783          	ld	a5,-64(s0)
    1046:	02878713          	addi	a4,a5,40
    104a:	649c                	ld	a5,8(s1)
    104c:	fcf718e3          	bne	a4,a5,101c <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
    1050:	40dc                	lw	a5,4(s1)
    1052:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
    1056:	fc843783          	ld	a5,-56(s0)
    105a:	4fbc                	lw	a5,88(a5)
    105c:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    1060:	fc843783          	ld	a5,-56(s0)
    1064:	4fb4                	lw	a3,88(a5)
    1066:	fc843783          	ld	a5,-56(s0)
    106a:	47bc                	lw	a5,72(a5)
    106c:	fa442703          	lw	a4,-92(s0)
    1070:	02f707bb          	mulw	a5,a4,a5
    1074:	2781                	sext.w	a5,a5
    1076:	8736                	mv	a4,a3
    1078:	00e7dc63          	bge	a5,a4,1090 <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
    107c:	fc843783          	ld	a5,-56(s0)
    1080:	47bc                	lw	a5,72(a5)
    1082:	fa442703          	lw	a4,-92(s0)
    1086:	02f707bb          	mulw	a5,a4,a5
    108a:	faf42e23          	sw	a5,-68(s0)
    108e:	a031                	j	109a <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    1090:	fc843783          	ld	a5,-56(s0)
    1094:	4fbc                	lw	a5,88(a5)
    1096:	faf42e23          	sw	a5,-68(s0)
    }
    
    struct threads_sched_result r;
    r.scheduled_thread_list_member = &process_thread->thread_list;
    109a:	fc843783          	ld	a5,-56(s0)
    109e:	02878793          	addi	a5,a5,40
    10a2:	f8f43023          	sd	a5,-128(s0)
    r.allocated_time = executing_time;
    10a6:	fbc42783          	lw	a5,-68(s0)
    10aa:	f8f42423          	sw	a5,-120(s0)
    return r;
    10ae:	f8043783          	ld	a5,-128(s0)
    10b2:	f8f43823          	sd	a5,-112(s0)
    10b6:	f8843783          	ld	a5,-120(s0)
    10ba:	f8f43c23          	sd	a5,-104(s0)
    10be:	4701                	li	a4,0
    10c0:	f9043703          	ld	a4,-112(s0)
    10c4:	4781                	li	a5,0
    10c6:	f9843783          	ld	a5,-104(s0)
    10ca:	893a                	mv	s2,a4
    10cc:	89be                	mv	s3,a5
    10ce:	874a                	mv	a4,s2
    10d0:	87ce                	mv	a5,s3
}
    10d2:	853a                	mv	a0,a4
    10d4:	85be                	mv	a1,a5
    10d6:	60ea                	ld	ra,152(sp)
    10d8:	644a                	ld	s0,144(sp)
    10da:	64aa                	ld	s1,136(sp)
    10dc:	690a                	ld	s2,128(sp)
    10de:	79e6                	ld	s3,120(sp)
    10e0:	610d                	addi	sp,sp,160
    10e2:	8082                	ret

00000000000010e4 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    10e4:	7131                	addi	sp,sp,-192
    10e6:	fd06                	sd	ra,184(sp)
    10e8:	f922                	sd	s0,176(sp)
    10ea:	f526                	sd	s1,168(sp)
    10ec:	f14a                	sd	s2,160(sp)
    10ee:	ed4e                	sd	s3,152(sp)
    10f0:	0180                	addi	s0,sp,192
    10f2:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    10f4:	649c                	ld	a5,8(s1)
    10f6:	853e                	mv	a0,a5
    10f8:	00000097          	auipc	ra,0x0
    10fc:	d12080e7          	jalr	-750(ra) # e0a <list_empty>
    1100:	87aa                	mv	a5,a0
    1102:	cb85                	beqz	a5,1132 <schedule_sjf+0x4e>
        return fill_sparse(args);
    1104:	609c                	ld	a5,0(s1)
    1106:	f4f43023          	sd	a5,-192(s0)
    110a:	649c                	ld	a5,8(s1)
    110c:	f4f43423          	sd	a5,-184(s0)
    1110:	689c                	ld	a5,16(s1)
    1112:	f4f43823          	sd	a5,-176(s0)
    1116:	f4040793          	addi	a5,s0,-192
    111a:	853e                	mv	a0,a5
    111c:	00000097          	auipc	ra,0x0
    1120:	d18080e7          	jalr	-744(ra) # e34 <fill_sparse>
    1124:	872a                	mv	a4,a0
    1126:	87ae                	mv	a5,a1
    1128:	f6e43c23          	sd	a4,-136(s0)
    112c:	f8f43023          	sd	a5,-128(s0)
    1130:	aa49                	j	12c2 <schedule_sjf+0x1de>

    int current_time = args.current_time;
    1132:	409c                	lw	a5,0(s1)
    1134:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    1138:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    113c:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1140:	649c                	ld	a5,8(s1)
    1142:	639c                	ld	a5,0(a5)
    1144:	faf43423          	sd	a5,-88(s0)
    1148:	fa843783          	ld	a5,-88(s0)
    114c:	fd878793          	addi	a5,a5,-40
    1150:	fcf43023          	sd	a5,-64(s0)
    1154:	a085                	j	11b4 <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    1156:	fc843783          	ld	a5,-56(s0)
    115a:	cb89                	beqz	a5,116c <schedule_sjf+0x88>
    115c:	fc043783          	ld	a5,-64(s0)
    1160:	4fb8                	lw	a4,88(a5)
    1162:	fc843783          	ld	a5,-56(s0)
    1166:	4fbc                	lw	a5,88(a5)
    1168:	00f75763          	bge	a4,a5,1176 <schedule_sjf+0x92>
            shortest_thread = th;
    116c:	fc043783          	ld	a5,-64(s0)
    1170:	fcf43423          	sd	a5,-56(s0)
    1174:	a02d                	j	119e <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    1176:	fc043783          	ld	a5,-64(s0)
    117a:	4fb8                	lw	a4,88(a5)
    117c:	fc843783          	ld	a5,-56(s0)
    1180:	4fbc                	lw	a5,88(a5)
    1182:	00f71e63          	bne	a4,a5,119e <schedule_sjf+0xba>
    1186:	fc043783          	ld	a5,-64(s0)
    118a:	5fd8                	lw	a4,60(a5)
    118c:	fc843783          	ld	a5,-56(s0)
    1190:	5fdc                	lw	a5,60(a5)
    1192:	00f75663          	bge	a4,a5,119e <schedule_sjf+0xba>
            shortest_thread = th;
    1196:	fc043783          	ld	a5,-64(s0)
    119a:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    119e:	fc043783          	ld	a5,-64(s0)
    11a2:	779c                	ld	a5,40(a5)
    11a4:	f8f43423          	sd	a5,-120(s0)
    11a8:	f8843783          	ld	a5,-120(s0)
    11ac:	fd878793          	addi	a5,a5,-40
    11b0:	fcf43023          	sd	a5,-64(s0)
    11b4:	fc043783          	ld	a5,-64(s0)
    11b8:	02878713          	addi	a4,a5,40
    11bc:	649c                	ld	a5,8(s1)
    11be:	f8f71ce3          	bne	a4,a5,1156 <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    11c2:	fc843783          	ld	a5,-56(s0)
    11c6:	4fbc                	lw	a5,88(a5)
    11c8:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    11cc:	689c                	ld	a5,16(s1)
    11ce:	639c                	ld	a5,0(a5)
    11d0:	faf43023          	sd	a5,-96(s0)
    11d4:	fa043783          	ld	a5,-96(s0)
    11d8:	17e1                	addi	a5,a5,-8
    11da:	faf43c23          	sd	a5,-72(s0)
    11de:	a84d                	j	1290 <schedule_sjf+0x1ac>
        int interval = cur->release_time - current_time;
    11e0:	fb843783          	ld	a5,-72(s0)
    11e4:	4f98                	lw	a4,24(a5)
    11e6:	fb042783          	lw	a5,-80(s0)
    11ea:	40f707bb          	subw	a5,a4,a5
    11ee:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    11f2:	f9c42703          	lw	a4,-100(s0)
    11f6:	fb442783          	lw	a5,-76(s0)
    11fa:	2701                	sext.w	a4,a4
    11fc:	2781                	sext.w	a5,a5
    11fe:	06e7c863          	blt	a5,a4,126e <schedule_sjf+0x18a>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1202:	fc843783          	ld	a5,-56(s0)
    1206:	4fbc                	lw	a5,88(a5)
    1208:	fb042703          	lw	a4,-80(s0)
    120c:	9fb9                	addw	a5,a5,a4
    120e:	0007871b          	sext.w	a4,a5
    1212:	fb843783          	ld	a5,-72(s0)
    1216:	4f9c                	lw	a5,24(a5)
    1218:	04f74d63          	blt	a4,a5,1272 <schedule_sjf+0x18e>
        int remaining_time = shortest_thread->remaining_time - interval;
    121c:	fc843783          	ld	a5,-56(s0)
    1220:	4fb8                	lw	a4,88(a5)
    1222:	f9c42783          	lw	a5,-100(s0)
    1226:	40f707bb          	subw	a5,a4,a5
    122a:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    122e:	fb843783          	ld	a5,-72(s0)
    1232:	639c                	ld	a5,0(a5)
    1234:	43f8                	lw	a4,68(a5)
    1236:	f9842783          	lw	a5,-104(s0)
    123a:	2781                	sext.w	a5,a5
    123c:	02e7cd63          	blt	a5,a4,1276 <schedule_sjf+0x192>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    1240:	fb843783          	ld	a5,-72(s0)
    1244:	639c                	ld	a5,0(a5)
    1246:	43f8                	lw	a4,68(a5)
    1248:	f9842783          	lw	a5,-104(s0)
    124c:	2781                	sext.w	a5,a5
    124e:	00e79b63          	bne	a5,a4,1264 <schedule_sjf+0x180>
    1252:	fc843783          	ld	a5,-56(s0)
    1256:	5fd8                	lw	a4,60(a5)
    1258:	fb843783          	ld	a5,-72(s0)
    125c:	639c                	ld	a5,0(a5)
    125e:	5fdc                	lw	a5,60(a5)
    1260:	00f74d63          	blt	a4,a5,127a <schedule_sjf+0x196>
        executing_time = interval;
    1264:	f9c42783          	lw	a5,-100(s0)
    1268:	faf42a23          	sw	a5,-76(s0)
    126c:	a801                	j	127c <schedule_sjf+0x198>
        if (interval > executing_time) continue;
    126e:	0001                	nop
    1270:	a031                	j	127c <schedule_sjf+0x198>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1272:	0001                	nop
    1274:	a021                	j	127c <schedule_sjf+0x198>
        if (remaining_time < cur->thrd->processing_time) continue;
    1276:	0001                	nop
    1278:	a011                	j	127c <schedule_sjf+0x198>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    127a:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    127c:	fb843783          	ld	a5,-72(s0)
    1280:	679c                	ld	a5,8(a5)
    1282:	f8f43823          	sd	a5,-112(s0)
    1286:	f9043783          	ld	a5,-112(s0)
    128a:	17e1                	addi	a5,a5,-8
    128c:	faf43c23          	sd	a5,-72(s0)
    1290:	fb843783          	ld	a5,-72(s0)
    1294:	00878713          	addi	a4,a5,8
    1298:	689c                	ld	a5,16(s1)
    129a:	f4f713e3          	bne	a4,a5,11e0 <schedule_sjf+0xfc>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &shortest_thread->thread_list;
    129e:	fc843783          	ld	a5,-56(s0)
    12a2:	02878793          	addi	a5,a5,40
    12a6:	f6f43423          	sd	a5,-152(s0)
    r.allocated_time = executing_time;
    12aa:	fb442783          	lw	a5,-76(s0)
    12ae:	f6f42823          	sw	a5,-144(s0)
    return r;
    12b2:	f6843783          	ld	a5,-152(s0)
    12b6:	f6f43c23          	sd	a5,-136(s0)
    12ba:	f7043783          	ld	a5,-144(s0)
    12be:	f8f43023          	sd	a5,-128(s0)
    12c2:	4701                	li	a4,0
    12c4:	f7843703          	ld	a4,-136(s0)
    12c8:	4781                	li	a5,0
    12ca:	f8043783          	ld	a5,-128(s0)
    12ce:	893a                	mv	s2,a4
    12d0:	89be                	mv	s3,a5
    12d2:	874a                	mv	a4,s2
    12d4:	87ce                	mv	a5,s3
}
    12d6:	853a                	mv	a0,a4
    12d8:	85be                	mv	a1,a5
    12da:	70ea                	ld	ra,184(sp)
    12dc:	744a                	ld	s0,176(sp)
    12de:	74aa                	ld	s1,168(sp)
    12e0:	790a                	ld	s2,160(sp)
    12e2:	69ea                	ld	s3,152(sp)
    12e4:	6129                	addi	sp,sp,192
    12e6:	8082                	ret

00000000000012e8 <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    12e8:	7115                	addi	sp,sp,-224
    12ea:	ed86                	sd	ra,216(sp)
    12ec:	e9a2                	sd	s0,208(sp)
    12ee:	e5a6                	sd	s1,200(sp)
    12f0:	e1ca                	sd	s2,192(sp)
    12f2:	fd4e                	sd	s3,184(sp)
    12f4:	1180                	addi	s0,sp,224
    12f6:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    12f8:	649c                	ld	a5,8(s1)
    12fa:	853e                	mv	a0,a5
    12fc:	00000097          	auipc	ra,0x0
    1300:	b0e080e7          	jalr	-1266(ra) # e0a <list_empty>
    1304:	87aa                	mv	a5,a0
    1306:	cb85                	beqz	a5,1336 <schedule_lst+0x4e>
        return fill_sparse(args);
    1308:	609c                	ld	a5,0(s1)
    130a:	f2f43023          	sd	a5,-224(s0)
    130e:	649c                	ld	a5,8(s1)
    1310:	f2f43423          	sd	a5,-216(s0)
    1314:	689c                	ld	a5,16(s1)
    1316:	f2f43823          	sd	a5,-208(s0)
    131a:	f2040793          	addi	a5,s0,-224
    131e:	853e                	mv	a0,a5
    1320:	00000097          	auipc	ra,0x0
    1324:	b14080e7          	jalr	-1260(ra) # e34 <fill_sparse>
    1328:	872a                	mv	a4,a0
    132a:	87ae                	mv	a5,a1
    132c:	f6e43023          	sd	a4,-160(s0)
    1330:	f6f43423          	sd	a5,-152(s0)
    1334:	ac41                	j	15c4 <schedule_lst+0x2dc>

    int current_time = args.current_time;
    1336:	409c                	lw	a5,0(s1)
    1338:	faf42623          	sw	a5,-84(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    133c:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1340:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1344:	649c                	ld	a5,8(s1)
    1346:	639c                	ld	a5,0(a5)
    1348:	faf43023          	sd	a5,-96(s0)
    134c:	fa043783          	ld	a5,-96(s0)
    1350:	fd878793          	addi	a5,a5,-40
    1354:	fcf43023          	sd	a5,-64(s0)
    1358:	a239                	j	1466 <schedule_lst+0x17e>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    135a:	fc043783          	ld	a5,-64(s0)
    135e:	4ff8                	lw	a4,92(a5)
    1360:	fac42783          	lw	a5,-84(s0)
    1364:	40f707bb          	subw	a5,a4,a5
    1368:	0007871b          	sext.w	a4,a5
    136c:	fc043783          	ld	a5,-64(s0)
    1370:	4fbc                	lw	a5,88(a5)
    1372:	40f707bb          	subw	a5,a4,a5
    1376:	f6f42e23          	sw	a5,-132(s0)
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    137a:	fc843783          	ld	a5,-56(s0)
    137e:	c38d                	beqz	a5,13a0 <schedule_lst+0xb8>
    1380:	fc843783          	ld	a5,-56(s0)
    1384:	4ff8                	lw	a4,92(a5)
    1386:	fac42783          	lw	a5,-84(s0)
    138a:	40f707bb          	subw	a5,a4,a5
    138e:	0007871b          	sext.w	a4,a5
    1392:	fc843783          	ld	a5,-56(s0)
    1396:	4fbc                	lw	a5,88(a5)
    1398:	40f707bb          	subw	a5,a4,a5
    139c:	2781                	sext.w	a5,a5
    139e:	a011                	j	13a2 <schedule_lst+0xba>
    13a0:	4781                	li	a5,0
    13a2:	f6f42c23          	sw	a5,-136(s0)
        if (least_slack_thread == NULL) {
    13a6:	fc843783          	ld	a5,-56(s0)
    13aa:	e791                	bnez	a5,13b6 <schedule_lst+0xce>
            least_slack_thread = th;
    13ac:	fc043783          	ld	a5,-64(s0)
    13b0:	fcf43423          	sd	a5,-56(s0)
    13b4:	a871                	j	1450 <schedule_lst+0x168>
        }
        else if (least_slack_thread->current_deadline <= current_time) { // missing the deadline
    13b6:	fc843783          	ld	a5,-56(s0)
    13ba:	4ff8                	lw	a4,92(a5)
    13bc:	fac42783          	lw	a5,-84(s0)
    13c0:	2781                	sext.w	a5,a5
    13c2:	02e7c763          	blt	a5,a4,13f0 <schedule_lst+0x108>
            if (th->current_deadline > current_time) continue;
    13c6:	fc043783          	ld	a5,-64(s0)
    13ca:	4ff8                	lw	a4,92(a5)
    13cc:	fac42783          	lw	a5,-84(s0)
    13d0:	2781                	sext.w	a5,a5
    13d2:	06e7ce63          	blt	a5,a4,144e <schedule_lst+0x166>
            if (th->ID < least_slack_thread->ID) {
    13d6:	fc043783          	ld	a5,-64(s0)
    13da:	5fd8                	lw	a4,60(a5)
    13dc:	fc843783          	ld	a5,-56(s0)
    13e0:	5fdc                	lw	a5,60(a5)
    13e2:	06f75763          	bge	a4,a5,1450 <schedule_lst+0x168>
                least_slack_thread = th;
    13e6:	fc043783          	ld	a5,-64(s0)
    13ea:	fcf43423          	sd	a5,-56(s0)
    13ee:	a08d                	j	1450 <schedule_lst+0x168>
            }
        }
        else if (th->current_deadline <= current_time) {
    13f0:	fc043783          	ld	a5,-64(s0)
    13f4:	4ff8                	lw	a4,92(a5)
    13f6:	fac42783          	lw	a5,-84(s0)
    13fa:	2781                	sext.w	a5,a5
    13fc:	00e7c763          	blt	a5,a4,140a <schedule_lst+0x122>
            least_slack_thread = th;
    1400:	fc043783          	ld	a5,-64(s0)
    1404:	fcf43423          	sd	a5,-56(s0)
    1408:	a0a1                	j	1450 <schedule_lst+0x168>
        }
        else if (slack_time < least_slack_time) {
    140a:	f7c42703          	lw	a4,-132(s0)
    140e:	f7842783          	lw	a5,-136(s0)
    1412:	2701                	sext.w	a4,a4
    1414:	2781                	sext.w	a5,a5
    1416:	00f75763          	bge	a4,a5,1424 <schedule_lst+0x13c>
            least_slack_thread = th;
    141a:	fc043783          	ld	a5,-64(s0)
    141e:	fcf43423          	sd	a5,-56(s0)
    1422:	a03d                	j	1450 <schedule_lst+0x168>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    1424:	f7c42703          	lw	a4,-132(s0)
    1428:	f7842783          	lw	a5,-136(s0)
    142c:	2701                	sext.w	a4,a4
    142e:	2781                	sext.w	a5,a5
    1430:	02f71063          	bne	a4,a5,1450 <schedule_lst+0x168>
    1434:	fc043783          	ld	a5,-64(s0)
    1438:	5fd8                	lw	a4,60(a5)
    143a:	fc843783          	ld	a5,-56(s0)
    143e:	5fdc                	lw	a5,60(a5)
    1440:	00f75863          	bge	a4,a5,1450 <schedule_lst+0x168>
            least_slack_thread = th;
    1444:	fc043783          	ld	a5,-64(s0)
    1448:	fcf43423          	sd	a5,-56(s0)
    144c:	a011                	j	1450 <schedule_lst+0x168>
            if (th->current_deadline > current_time) continue;
    144e:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1450:	fc043783          	ld	a5,-64(s0)
    1454:	779c                	ld	a5,40(a5)
    1456:	f6f43823          	sd	a5,-144(s0)
    145a:	f7043783          	ld	a5,-144(s0)
    145e:	fd878793          	addi	a5,a5,-40
    1462:	fcf43023          	sd	a5,-64(s0)
    1466:	fc043783          	ld	a5,-64(s0)
    146a:	02878713          	addi	a4,a5,40
    146e:	649c                	ld	a5,8(s1)
    1470:	eef715e3          	bne	a4,a5,135a <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread->current_deadline <= current_time)
    1474:	fc843783          	ld	a5,-56(s0)
    1478:	4ff8                	lw	a4,92(a5)
    147a:	fac42783          	lw	a5,-84(s0)
    147e:	2781                	sext.w	a5,a5
    1480:	00e7cb63          	blt	a5,a4,1496 <schedule_lst+0x1ae>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    1484:	fc843783          	ld	a5,-56(s0)
    1488:	02878793          	addi	a5,a5,40
    148c:	f6f43023          	sd	a5,-160(s0)
    1490:	f6042423          	sw	zero,-152(s0)
    1494:	aa05                	j	15c4 <schedule_lst+0x2dc>
    
    int executing_time = least_slack_thread->remaining_time;
    1496:	fc843783          	ld	a5,-56(s0)
    149a:	4fbc                	lw	a5,88(a5)
    149c:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    14a0:	fc843783          	ld	a5,-56(s0)
    14a4:	4fb4                	lw	a3,88(a5)
    14a6:	fc843783          	ld	a5,-56(s0)
    14aa:	4ff8                	lw	a4,92(a5)
    14ac:	fac42783          	lw	a5,-84(s0)
    14b0:	40f707bb          	subw	a5,a4,a5
    14b4:	2781                	sext.w	a5,a5
    14b6:	8736                	mv	a4,a3
    14b8:	00e7db63          	bge	a5,a4,14ce <schedule_lst+0x1e6>
        executing_time = least_slack_thread->current_deadline - current_time;
    14bc:	fc843783          	ld	a5,-56(s0)
    14c0:	4ff8                	lw	a4,92(a5)
    14c2:	fac42783          	lw	a5,-84(s0)
    14c6:	40f707bb          	subw	a5,a4,a5
    14ca:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    14ce:	fc843783          	ld	a5,-56(s0)
    14d2:	4ff8                	lw	a4,92(a5)
    14d4:	fac42783          	lw	a5,-84(s0)
    14d8:	40f707bb          	subw	a5,a4,a5
    14dc:	0007871b          	sext.w	a4,a5
    14e0:	fc843783          	ld	a5,-56(s0)
    14e4:	4fbc                	lw	a5,88(a5)
    14e6:	40f707bb          	subw	a5,a4,a5
    14ea:	f8f42e23          	sw	a5,-100(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    14ee:	689c                	ld	a5,16(s1)
    14f0:	639c                	ld	a5,0(a5)
    14f2:	f8f43823          	sd	a5,-112(s0)
    14f6:	f9043783          	ld	a5,-112(s0)
    14fa:	17e1                	addi	a5,a5,-8
    14fc:	faf43823          	sd	a5,-80(s0)
    1500:	a849                	j	1592 <schedule_lst+0x2aa>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    1502:	fb043783          	ld	a5,-80(s0)
    1506:	639c                	ld	a5,0(a5)
    1508:	47f8                	lw	a4,76(a5)
    150a:	fb043783          	ld	a5,-80(s0)
    150e:	639c                	ld	a5,0(a5)
    1510:	43fc                	lw	a5,68(a5)
    1512:	40f707bb          	subw	a5,a4,a5
    1516:	f8f42623          	sw	a5,-116(s0)
        int interval = cur->release_time - current_time;
    151a:	fb043783          	ld	a5,-80(s0)
    151e:	4f98                	lw	a4,24(a5)
    1520:	fac42783          	lw	a5,-84(s0)
    1524:	40f707bb          	subw	a5,a4,a5
    1528:	f8f42423          	sw	a5,-120(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    152c:	f8842703          	lw	a4,-120(s0)
    1530:	fbc42783          	lw	a5,-68(s0)
    1534:	2701                	sext.w	a4,a4
    1536:	2781                	sext.w	a5,a5
    1538:	04e7c063          	blt	a5,a4,1578 <schedule_lst+0x290>
    153c:	f9c42703          	lw	a4,-100(s0)
    1540:	f8c42783          	lw	a5,-116(s0)
    1544:	2701                	sext.w	a4,a4
    1546:	2781                	sext.w	a5,a5
    1548:	02f74863          	blt	a4,a5,1578 <schedule_lst+0x290>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    154c:	f9c42703          	lw	a4,-100(s0)
    1550:	f8c42783          	lw	a5,-116(s0)
    1554:	2701                	sext.w	a4,a4
    1556:	2781                	sext.w	a5,a5
    1558:	00f71b63          	bne	a4,a5,156e <schedule_lst+0x286>
    155c:	fc843783          	ld	a5,-56(s0)
    1560:	5fd8                	lw	a4,60(a5)
    1562:	fb043783          	ld	a5,-80(s0)
    1566:	639c                	ld	a5,0(a5)
    1568:	5fdc                	lw	a5,60(a5)
    156a:	00f74963          	blt	a4,a5,157c <schedule_lst+0x294>
        executing_time = interval;
    156e:	f8842783          	lw	a5,-120(s0)
    1572:	faf42e23          	sw	a5,-68(s0)
    1576:	a021                	j	157e <schedule_lst+0x296>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    1578:	0001                	nop
    157a:	a011                	j	157e <schedule_lst+0x296>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    157c:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    157e:	fb043783          	ld	a5,-80(s0)
    1582:	679c                	ld	a5,8(a5)
    1584:	f8f43023          	sd	a5,-128(s0)
    1588:	f8043783          	ld	a5,-128(s0)
    158c:	17e1                	addi	a5,a5,-8
    158e:	faf43823          	sd	a5,-80(s0)
    1592:	fb043783          	ld	a5,-80(s0)
    1596:	00878713          	addi	a4,a5,8
    159a:	689c                	ld	a5,16(s1)
    159c:	f6f713e3          	bne	a4,a5,1502 <schedule_lst+0x21a>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &least_slack_thread->thread_list;
    15a0:	fc843783          	ld	a5,-56(s0)
    15a4:	02878793          	addi	a5,a5,40
    15a8:	f4f43823          	sd	a5,-176(s0)
    r.allocated_time = executing_time;
    15ac:	fbc42783          	lw	a5,-68(s0)
    15b0:	f4f42c23          	sw	a5,-168(s0)
    return r;
    15b4:	f5043783          	ld	a5,-176(s0)
    15b8:	f6f43023          	sd	a5,-160(s0)
    15bc:	f5843783          	ld	a5,-168(s0)
    15c0:	f6f43423          	sd	a5,-152(s0)
    15c4:	4701                	li	a4,0
    15c6:	f6043703          	ld	a4,-160(s0)
    15ca:	4781                	li	a5,0
    15cc:	f6843783          	ld	a5,-152(s0)
    15d0:	893a                	mv	s2,a4
    15d2:	89be                	mv	s3,a5
    15d4:	874a                	mv	a4,s2
    15d6:	87ce                	mv	a5,s3
}
    15d8:	853a                	mv	a0,a4
    15da:	85be                	mv	a1,a5
    15dc:	60ee                	ld	ra,216(sp)
    15de:	644e                	ld	s0,208(sp)
    15e0:	64ae                	ld	s1,200(sp)
    15e2:	690e                	ld	s2,192(sp)
    15e4:	79ea                	ld	s3,184(sp)
    15e6:	612d                	addi	sp,sp,224
    15e8:	8082                	ret

00000000000015ea <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    15ea:	7155                	addi	sp,sp,-208
    15ec:	e586                	sd	ra,200(sp)
    15ee:	e1a2                	sd	s0,192(sp)
    15f0:	fd26                	sd	s1,184(sp)
    15f2:	f94a                	sd	s2,176(sp)
    15f4:	f54e                	sd	s3,168(sp)
    15f6:	0980                	addi	s0,sp,208
    15f8:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.

    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    15fa:	649c                	ld	a5,8(s1)
    15fc:	853e                	mv	a0,a5
    15fe:	00000097          	auipc	ra,0x0
    1602:	80c080e7          	jalr	-2036(ra) # e0a <list_empty>
    1606:	87aa                	mv	a5,a0
    1608:	cb85                	beqz	a5,1638 <schedule_dm+0x4e>
        return fill_sparse(args);
    160a:	609c                	ld	a5,0(s1)
    160c:	f2f43823          	sd	a5,-208(s0)
    1610:	649c                	ld	a5,8(s1)
    1612:	f2f43c23          	sd	a5,-200(s0)
    1616:	689c                	ld	a5,16(s1)
    1618:	f4f43023          	sd	a5,-192(s0)
    161c:	f3040793          	addi	a5,s0,-208
    1620:	853e                	mv	a0,a5
    1622:	00000097          	auipc	ra,0x0
    1626:	812080e7          	jalr	-2030(ra) # e34 <fill_sparse>
    162a:	872a                	mv	a4,a0
    162c:	87ae                	mv	a5,a1
    162e:	f6e43823          	sd	a4,-144(s0)
    1632:	f6f43c23          	sd	a5,-136(s0)
    1636:	ac11                	j	184a <schedule_dm+0x260>
    
    int current_time = args.current_time;
    1638:	409c                	lw	a5,0(s1)
    163a:	faf42623          	sw	a5,-84(s0)

    // find the thread with the earliest deadline
    struct thread *highest_priority_thread = NULL;
    163e:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1642:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1646:	649c                	ld	a5,8(s1)
    1648:	639c                	ld	a5,0(a5)
    164a:	faf43023          	sd	a5,-96(s0)
    164e:	fa043783          	ld	a5,-96(s0)
    1652:	fd878793          	addi	a5,a5,-40
    1656:	fcf43023          	sd	a5,-64(s0)
    165a:	a0c9                	j	171c <schedule_dm+0x132>
        if (highest_priority_thread == NULL) {
    165c:	fc843783          	ld	a5,-56(s0)
    1660:	e791                	bnez	a5,166c <schedule_dm+0x82>
            highest_priority_thread = th;
    1662:	fc043783          	ld	a5,-64(s0)
    1666:	fcf43423          	sd	a5,-56(s0)
    166a:	a871                	j	1706 <schedule_dm+0x11c>
        }
        else if (highest_priority_thread->current_deadline <= current_time) { // missing the deadline
    166c:	fc843783          	ld	a5,-56(s0)
    1670:	4ff8                	lw	a4,92(a5)
    1672:	fac42783          	lw	a5,-84(s0)
    1676:	2781                	sext.w	a5,a5
    1678:	02e7c763          	blt	a5,a4,16a6 <schedule_dm+0xbc>
            if (th->current_deadline > current_time) continue;
    167c:	fc043783          	ld	a5,-64(s0)
    1680:	4ff8                	lw	a4,92(a5)
    1682:	fac42783          	lw	a5,-84(s0)
    1686:	2781                	sext.w	a5,a5
    1688:	06e7ce63          	blt	a5,a4,1704 <schedule_dm+0x11a>
            if (th->ID < highest_priority_thread->ID) {
    168c:	fc043783          	ld	a5,-64(s0)
    1690:	5fd8                	lw	a4,60(a5)
    1692:	fc843783          	ld	a5,-56(s0)
    1696:	5fdc                	lw	a5,60(a5)
    1698:	06f75763          	bge	a4,a5,1706 <schedule_dm+0x11c>
                highest_priority_thread = th;
    169c:	fc043783          	ld	a5,-64(s0)
    16a0:	fcf43423          	sd	a5,-56(s0)
    16a4:	a08d                	j	1706 <schedule_dm+0x11c>
            }
        }
        else if (th->current_deadline <= current_time) {
    16a6:	fc043783          	ld	a5,-64(s0)
    16aa:	4ff8                	lw	a4,92(a5)
    16ac:	fac42783          	lw	a5,-84(s0)
    16b0:	2781                	sext.w	a5,a5
    16b2:	00e7c763          	blt	a5,a4,16c0 <schedule_dm+0xd6>
            highest_priority_thread = th;
    16b6:	fc043783          	ld	a5,-64(s0)
    16ba:	fcf43423          	sd	a5,-56(s0)
    16be:	a0a1                	j	1706 <schedule_dm+0x11c>
        }
        else if (th->deadline < highest_priority_thread->deadline ) {
    16c0:	fc043783          	ld	a5,-64(s0)
    16c4:	47f8                	lw	a4,76(a5)
    16c6:	fc843783          	ld	a5,-56(s0)
    16ca:	47fc                	lw	a5,76(a5)
    16cc:	00f75763          	bge	a4,a5,16da <schedule_dm+0xf0>
            highest_priority_thread = th;
    16d0:	fc043783          	ld	a5,-64(s0)
    16d4:	fcf43423          	sd	a5,-56(s0)
    16d8:	a03d                	j	1706 <schedule_dm+0x11c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    16da:	fc043783          	ld	a5,-64(s0)
    16de:	47f8                	lw	a4,76(a5)
    16e0:	fc843783          	ld	a5,-56(s0)
    16e4:	47fc                	lw	a5,76(a5)
    16e6:	02f71063          	bne	a4,a5,1706 <schedule_dm+0x11c>
    16ea:	fc043783          	ld	a5,-64(s0)
    16ee:	5fd8                	lw	a4,60(a5)
    16f0:	fc843783          	ld	a5,-56(s0)
    16f4:	5fdc                	lw	a5,60(a5)
    16f6:	00f75863          	bge	a4,a5,1706 <schedule_dm+0x11c>
            highest_priority_thread = th;
    16fa:	fc043783          	ld	a5,-64(s0)
    16fe:	fcf43423          	sd	a5,-56(s0)
    1702:	a011                	j	1706 <schedule_dm+0x11c>
            if (th->current_deadline > current_time) continue;
    1704:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1706:	fc043783          	ld	a5,-64(s0)
    170a:	779c                	ld	a5,40(a5)
    170c:	f8f43023          	sd	a5,-128(s0)
    1710:	f8043783          	ld	a5,-128(s0)
    1714:	fd878793          	addi	a5,a5,-40
    1718:	fcf43023          	sd	a5,-64(s0)
    171c:	fc043783          	ld	a5,-64(s0)
    1720:	02878713          	addi	a4,a5,40
    1724:	649c                	ld	a5,8(s1)
    1726:	f2f71be3          	bne	a4,a5,165c <schedule_dm+0x72>
        }
    }

    // the thread missing the current deadline
    if (highest_priority_thread->current_deadline <= current_time)
    172a:	fc843783          	ld	a5,-56(s0)
    172e:	4ff8                	lw	a4,92(a5)
    1730:	fac42783          	lw	a5,-84(s0)
    1734:	2781                	sext.w	a5,a5
    1736:	00e7cb63          	blt	a5,a4,174c <schedule_dm+0x162>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    173a:	fc843783          	ld	a5,-56(s0)
    173e:	02878793          	addi	a5,a5,40
    1742:	f6f43823          	sd	a5,-144(s0)
    1746:	f6042c23          	sw	zero,-136(s0)
    174a:	a201                	j	184a <schedule_dm+0x260>

    int executing_time = highest_priority_thread->remaining_time;
    174c:	fc843783          	ld	a5,-56(s0)
    1750:	4fbc                	lw	a5,88(a5)
    1752:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    1756:	fc843783          	ld	a5,-56(s0)
    175a:	4fb4                	lw	a3,88(a5)
    175c:	fc843783          	ld	a5,-56(s0)
    1760:	4ff8                	lw	a4,92(a5)
    1762:	fac42783          	lw	a5,-84(s0)
    1766:	40f707bb          	subw	a5,a4,a5
    176a:	2781                	sext.w	a5,a5
    176c:	8736                	mv	a4,a3
    176e:	00e7db63          	bge	a5,a4,1784 <schedule_dm+0x19a>
        executing_time = highest_priority_thread->current_deadline - current_time;
    1772:	fc843783          	ld	a5,-56(s0)
    1776:	4ff8                	lw	a4,92(a5)
    1778:	fac42783          	lw	a5,-84(s0)
    177c:	40f707bb          	subw	a5,a4,a5
    1780:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1784:	689c                	ld	a5,16(s1)
    1786:	639c                	ld	a5,0(a5)
    1788:	f8f43c23          	sd	a5,-104(s0)
    178c:	f9843783          	ld	a5,-104(s0)
    1790:	17e1                	addi	a5,a5,-8
    1792:	faf43823          	sd	a5,-80(s0)
    1796:	a049                	j	1818 <schedule_dm+0x22e>
        int interval = cur->release_time - current_time;
    1798:	fb043783          	ld	a5,-80(s0)
    179c:	4f98                	lw	a4,24(a5)
    179e:	fac42783          	lw	a5,-84(s0)
    17a2:	40f707bb          	subw	a5,a4,a5
    17a6:	f8f42a23          	sw	a5,-108(s0)
        if (interval > executing_time) continue;
    17aa:	f9442703          	lw	a4,-108(s0)
    17ae:	fbc42783          	lw	a5,-68(s0)
    17b2:	2701                	sext.w	a4,a4
    17b4:	2781                	sext.w	a5,a5
    17b6:	04e7c263          	blt	a5,a4,17fa <schedule_dm+0x210>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    17ba:	fc843783          	ld	a5,-56(s0)
    17be:	47f8                	lw	a4,76(a5)
    17c0:	fb043783          	ld	a5,-80(s0)
    17c4:	639c                	ld	a5,0(a5)
    17c6:	47fc                	lw	a5,76(a5)
    17c8:	02f74b63          	blt	a4,a5,17fe <schedule_dm+0x214>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    17cc:	fc843783          	ld	a5,-56(s0)
    17d0:	47f8                	lw	a4,76(a5)
    17d2:	fb043783          	ld	a5,-80(s0)
    17d6:	639c                	ld	a5,0(a5)
    17d8:	47fc                	lw	a5,76(a5)
    17da:	00f71b63          	bne	a4,a5,17f0 <schedule_dm+0x206>
    17de:	fc843783          	ld	a5,-56(s0)
    17e2:	5fd8                	lw	a4,60(a5)
    17e4:	fb043783          	ld	a5,-80(s0)
    17e8:	639c                	ld	a5,0(a5)
    17ea:	5fdc                	lw	a5,60(a5)
    17ec:	00f74b63          	blt	a4,a5,1802 <schedule_dm+0x218>
        executing_time = interval;
    17f0:	f9442783          	lw	a5,-108(s0)
    17f4:	faf42e23          	sw	a5,-68(s0)
    17f8:	a031                	j	1804 <schedule_dm+0x21a>
        if (interval > executing_time) continue;
    17fa:	0001                	nop
    17fc:	a021                	j	1804 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    17fe:	0001                	nop
    1800:	a011                	j	1804 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    1802:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1804:	fb043783          	ld	a5,-80(s0)
    1808:	679c                	ld	a5,8(a5)
    180a:	f8f43423          	sd	a5,-120(s0)
    180e:	f8843783          	ld	a5,-120(s0)
    1812:	17e1                	addi	a5,a5,-8
    1814:	faf43823          	sd	a5,-80(s0)
    1818:	fb043783          	ld	a5,-80(s0)
    181c:	00878713          	addi	a4,a5,8
    1820:	689c                	ld	a5,16(s1)
    1822:	f6f71be3          	bne	a4,a5,1798 <schedule_dm+0x1ae>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &highest_priority_thread->thread_list;
    1826:	fc843783          	ld	a5,-56(s0)
    182a:	02878793          	addi	a5,a5,40
    182e:	f6f43023          	sd	a5,-160(s0)
    r.allocated_time = executing_time;
    1832:	fbc42783          	lw	a5,-68(s0)
    1836:	f6f42423          	sw	a5,-152(s0)
    return r;
    183a:	f6043783          	ld	a5,-160(s0)
    183e:	f6f43823          	sd	a5,-144(s0)
    1842:	f6843783          	ld	a5,-152(s0)
    1846:	f6f43c23          	sd	a5,-136(s0)
    184a:	4701                	li	a4,0
    184c:	f7043703          	ld	a4,-144(s0)
    1850:	4781                	li	a5,0
    1852:	f7843783          	ld	a5,-136(s0)
    1856:	893a                	mv	s2,a4
    1858:	89be                	mv	s3,a5
    185a:	874a                	mv	a4,s2
    185c:	87ce                	mv	a5,s3
    185e:	853a                	mv	a0,a4
    1860:	85be                	mv	a1,a5
    1862:	60ae                	ld	ra,200(sp)
    1864:	640e                	ld	s0,192(sp)
    1866:	74ea                	ld	s1,184(sp)
    1868:	794a                	ld	s2,176(sp)
    186a:	79aa                	ld	s3,168(sp)
    186c:	6169                	addi	sp,sp,208
    186e:	8082                	ret
