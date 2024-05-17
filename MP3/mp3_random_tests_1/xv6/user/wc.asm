
user/_wc:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	0080                	addi	s0,sp,64
       8:	87aa                	mv	a5,a0
       a:	fcb43023          	sd	a1,-64(s0)
       e:	fcf42623          	sw	a5,-52(s0)
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
      12:	fe042023          	sw	zero,-32(s0)
      16:	fe042783          	lw	a5,-32(s0)
      1a:	fef42223          	sw	a5,-28(s0)
      1e:	fe442783          	lw	a5,-28(s0)
      22:	fef42423          	sw	a5,-24(s0)
  inword = 0;
      26:	fc042e23          	sw	zero,-36(s0)
  while((n = read(fd, buf, sizeof(buf))) > 0){
      2a:	a859                	j	c0 <wc+0xc0>
    for(i=0; i<n; i++){
      2c:	fe042623          	sw	zero,-20(s0)
      30:	a041                	j	b0 <wc+0xb0>
      c++;
      32:	fe042783          	lw	a5,-32(s0)
      36:	2785                	addiw	a5,a5,1
      38:	fef42023          	sw	a5,-32(s0)
      if(buf[i] == '\n')
      3c:	00002717          	auipc	a4,0x2
      40:	a3470713          	addi	a4,a4,-1484 # 1a70 <buf>
      44:	fec42783          	lw	a5,-20(s0)
      48:	97ba                	add	a5,a5,a4
      4a:	0007c783          	lbu	a5,0(a5)
      4e:	873e                	mv	a4,a5
      50:	47a9                	li	a5,10
      52:	00f71763          	bne	a4,a5,60 <wc+0x60>
        l++;
      56:	fe842783          	lw	a5,-24(s0)
      5a:	2785                	addiw	a5,a5,1
      5c:	fef42423          	sw	a5,-24(s0)
      if(strchr(" \r\t\n\v", buf[i]))
      60:	00002717          	auipc	a4,0x2
      64:	a1070713          	addi	a4,a4,-1520 # 1a70 <buf>
      68:	fec42783          	lw	a5,-20(s0)
      6c:	97ba                	add	a5,a5,a4
      6e:	0007c783          	lbu	a5,0(a5)
      72:	85be                	mv	a1,a5
      74:	00002517          	auipc	a0,0x2
      78:	99450513          	addi	a0,a0,-1644 # 1a08 <schedule_dm+0x28a>
      7c:	00000097          	auipc	ra,0x0
      80:	2ec080e7          	jalr	748(ra) # 368 <strchr>
      84:	87aa                	mv	a5,a0
      86:	c781                	beqz	a5,8e <wc+0x8e>
        inword = 0;
      88:	fc042e23          	sw	zero,-36(s0)
      8c:	a829                	j	a6 <wc+0xa6>
      else if(!inword){
      8e:	fdc42783          	lw	a5,-36(s0)
      92:	2781                	sext.w	a5,a5
      94:	eb89                	bnez	a5,a6 <wc+0xa6>
        w++;
      96:	fe442783          	lw	a5,-28(s0)
      9a:	2785                	addiw	a5,a5,1
      9c:	fef42223          	sw	a5,-28(s0)
        inword = 1;
      a0:	4785                	li	a5,1
      a2:	fcf42e23          	sw	a5,-36(s0)
    for(i=0; i<n; i++){
      a6:	fec42783          	lw	a5,-20(s0)
      aa:	2785                	addiw	a5,a5,1
      ac:	fef42623          	sw	a5,-20(s0)
      b0:	fec42703          	lw	a4,-20(s0)
      b4:	fd842783          	lw	a5,-40(s0)
      b8:	2701                	sext.w	a4,a4
      ba:	2781                	sext.w	a5,a5
      bc:	f6f74be3          	blt	a4,a5,32 <wc+0x32>
  while((n = read(fd, buf, sizeof(buf))) > 0){
      c0:	fcc42783          	lw	a5,-52(s0)
      c4:	20000613          	li	a2,512
      c8:	00002597          	auipc	a1,0x2
      cc:	9a858593          	addi	a1,a1,-1624 # 1a70 <buf>
      d0:	853e                	mv	a0,a5
      d2:	00000097          	auipc	ra,0x0
      d6:	5f8080e7          	jalr	1528(ra) # 6ca <read>
      da:	87aa                	mv	a5,a0
      dc:	fcf42c23          	sw	a5,-40(s0)
      e0:	fd842783          	lw	a5,-40(s0)
      e4:	2781                	sext.w	a5,a5
      e6:	f4f043e3          	bgtz	a5,2c <wc+0x2c>
      }
    }
  }
  if(n < 0){
      ea:	fd842783          	lw	a5,-40(s0)
      ee:	2781                	sext.w	a5,a5
      f0:	0007df63          	bgez	a5,10e <wc+0x10e>
    printf("wc: read error\n");
      f4:	00002517          	auipc	a0,0x2
      f8:	91c50513          	addi	a0,a0,-1764 # 1a10 <schedule_dm+0x292>
      fc:	00001097          	auipc	ra,0x1
     100:	afc080e7          	jalr	-1284(ra) # bf8 <printf>
    exit(1);
     104:	4505                	li	a0,1
     106:	00000097          	auipc	ra,0x0
     10a:	5ac080e7          	jalr	1452(ra) # 6b2 <exit>
  }
  printf("%d %d %d %s\n", l, w, c, name);
     10e:	fe042683          	lw	a3,-32(s0)
     112:	fe442603          	lw	a2,-28(s0)
     116:	fe842783          	lw	a5,-24(s0)
     11a:	fc043703          	ld	a4,-64(s0)
     11e:	85be                	mv	a1,a5
     120:	00002517          	auipc	a0,0x2
     124:	90050513          	addi	a0,a0,-1792 # 1a20 <schedule_dm+0x2a2>
     128:	00001097          	auipc	ra,0x1
     12c:	ad0080e7          	jalr	-1328(ra) # bf8 <printf>
}
     130:	0001                	nop
     132:	70e2                	ld	ra,56(sp)
     134:	7442                	ld	s0,48(sp)
     136:	6121                	addi	sp,sp,64
     138:	8082                	ret

000000000000013a <main>:

int
main(int argc, char *argv[])
{
     13a:	7179                	addi	sp,sp,-48
     13c:	f406                	sd	ra,40(sp)
     13e:	f022                	sd	s0,32(sp)
     140:	1800                	addi	s0,sp,48
     142:	87aa                	mv	a5,a0
     144:	fcb43823          	sd	a1,-48(s0)
     148:	fcf42e23          	sw	a5,-36(s0)
  int fd, i;

  if(argc <= 1){
     14c:	fdc42783          	lw	a5,-36(s0)
     150:	0007871b          	sext.w	a4,a5
     154:	4785                	li	a5,1
     156:	02e7c063          	blt	a5,a4,176 <main+0x3c>
    wc(0, "");
     15a:	00002597          	auipc	a1,0x2
     15e:	8d658593          	addi	a1,a1,-1834 # 1a30 <schedule_dm+0x2b2>
     162:	4501                	li	a0,0
     164:	00000097          	auipc	ra,0x0
     168:	e9c080e7          	jalr	-356(ra) # 0 <wc>
    exit(0);
     16c:	4501                	li	a0,0
     16e:	00000097          	auipc	ra,0x0
     172:	544080e7          	jalr	1348(ra) # 6b2 <exit>
  }

  for(i = 1; i < argc; i++){
     176:	4785                	li	a5,1
     178:	fef42623          	sw	a5,-20(s0)
     17c:	a071                	j	208 <main+0xce>
    if((fd = open(argv[i], 0)) < 0){
     17e:	fec42783          	lw	a5,-20(s0)
     182:	078e                	slli	a5,a5,0x3
     184:	fd043703          	ld	a4,-48(s0)
     188:	97ba                	add	a5,a5,a4
     18a:	639c                	ld	a5,0(a5)
     18c:	4581                	li	a1,0
     18e:	853e                	mv	a0,a5
     190:	00000097          	auipc	ra,0x0
     194:	562080e7          	jalr	1378(ra) # 6f2 <open>
     198:	87aa                	mv	a5,a0
     19a:	fef42423          	sw	a5,-24(s0)
     19e:	fe842783          	lw	a5,-24(s0)
     1a2:	2781                	sext.w	a5,a5
     1a4:	0207d763          	bgez	a5,1d2 <main+0x98>
      printf("wc: cannot open %s\n", argv[i]);
     1a8:	fec42783          	lw	a5,-20(s0)
     1ac:	078e                	slli	a5,a5,0x3
     1ae:	fd043703          	ld	a4,-48(s0)
     1b2:	97ba                	add	a5,a5,a4
     1b4:	639c                	ld	a5,0(a5)
     1b6:	85be                	mv	a1,a5
     1b8:	00002517          	auipc	a0,0x2
     1bc:	88050513          	addi	a0,a0,-1920 # 1a38 <schedule_dm+0x2ba>
     1c0:	00001097          	auipc	ra,0x1
     1c4:	a38080e7          	jalr	-1480(ra) # bf8 <printf>
      exit(1);
     1c8:	4505                	li	a0,1
     1ca:	00000097          	auipc	ra,0x0
     1ce:	4e8080e7          	jalr	1256(ra) # 6b2 <exit>
    }
    wc(fd, argv[i]);
     1d2:	fec42783          	lw	a5,-20(s0)
     1d6:	078e                	slli	a5,a5,0x3
     1d8:	fd043703          	ld	a4,-48(s0)
     1dc:	97ba                	add	a5,a5,a4
     1de:	6398                	ld	a4,0(a5)
     1e0:	fe842783          	lw	a5,-24(s0)
     1e4:	85ba                	mv	a1,a4
     1e6:	853e                	mv	a0,a5
     1e8:	00000097          	auipc	ra,0x0
     1ec:	e18080e7          	jalr	-488(ra) # 0 <wc>
    close(fd);
     1f0:	fe842783          	lw	a5,-24(s0)
     1f4:	853e                	mv	a0,a5
     1f6:	00000097          	auipc	ra,0x0
     1fa:	4e4080e7          	jalr	1252(ra) # 6da <close>
  for(i = 1; i < argc; i++){
     1fe:	fec42783          	lw	a5,-20(s0)
     202:	2785                	addiw	a5,a5,1
     204:	fef42623          	sw	a5,-20(s0)
     208:	fec42703          	lw	a4,-20(s0)
     20c:	fdc42783          	lw	a5,-36(s0)
     210:	2701                	sext.w	a4,a4
     212:	2781                	sext.w	a5,a5
     214:	f6f745e3          	blt	a4,a5,17e <main+0x44>
  }
  exit(0);
     218:	4501                	li	a0,0
     21a:	00000097          	auipc	ra,0x0
     21e:	498080e7          	jalr	1176(ra) # 6b2 <exit>

0000000000000222 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     222:	7179                	addi	sp,sp,-48
     224:	f422                	sd	s0,40(sp)
     226:	1800                	addi	s0,sp,48
     228:	fca43c23          	sd	a0,-40(s0)
     22c:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     230:	fd843783          	ld	a5,-40(s0)
     234:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     238:	0001                	nop
     23a:	fd043703          	ld	a4,-48(s0)
     23e:	00170793          	addi	a5,a4,1
     242:	fcf43823          	sd	a5,-48(s0)
     246:	fd843783          	ld	a5,-40(s0)
     24a:	00178693          	addi	a3,a5,1
     24e:	fcd43c23          	sd	a3,-40(s0)
     252:	00074703          	lbu	a4,0(a4)
     256:	00e78023          	sb	a4,0(a5)
     25a:	0007c783          	lbu	a5,0(a5)
     25e:	fff1                	bnez	a5,23a <strcpy+0x18>
    ;
  return os;
     260:	fe843783          	ld	a5,-24(s0)
}
     264:	853e                	mv	a0,a5
     266:	7422                	ld	s0,40(sp)
     268:	6145                	addi	sp,sp,48
     26a:	8082                	ret

000000000000026c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     26c:	1101                	addi	sp,sp,-32
     26e:	ec22                	sd	s0,24(sp)
     270:	1000                	addi	s0,sp,32
     272:	fea43423          	sd	a0,-24(s0)
     276:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     27a:	a819                	j	290 <strcmp+0x24>
    p++, q++;
     27c:	fe843783          	ld	a5,-24(s0)
     280:	0785                	addi	a5,a5,1
     282:	fef43423          	sd	a5,-24(s0)
     286:	fe043783          	ld	a5,-32(s0)
     28a:	0785                	addi	a5,a5,1
     28c:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     290:	fe843783          	ld	a5,-24(s0)
     294:	0007c783          	lbu	a5,0(a5)
     298:	cb99                	beqz	a5,2ae <strcmp+0x42>
     29a:	fe843783          	ld	a5,-24(s0)
     29e:	0007c703          	lbu	a4,0(a5)
     2a2:	fe043783          	ld	a5,-32(s0)
     2a6:	0007c783          	lbu	a5,0(a5)
     2aa:	fcf709e3          	beq	a4,a5,27c <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     2ae:	fe843783          	ld	a5,-24(s0)
     2b2:	0007c783          	lbu	a5,0(a5)
     2b6:	0007871b          	sext.w	a4,a5
     2ba:	fe043783          	ld	a5,-32(s0)
     2be:	0007c783          	lbu	a5,0(a5)
     2c2:	2781                	sext.w	a5,a5
     2c4:	40f707bb          	subw	a5,a4,a5
     2c8:	2781                	sext.w	a5,a5
}
     2ca:	853e                	mv	a0,a5
     2cc:	6462                	ld	s0,24(sp)
     2ce:	6105                	addi	sp,sp,32
     2d0:	8082                	ret

00000000000002d2 <strlen>:

uint
strlen(const char *s)
{
     2d2:	7179                	addi	sp,sp,-48
     2d4:	f422                	sd	s0,40(sp)
     2d6:	1800                	addi	s0,sp,48
     2d8:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     2dc:	fe042623          	sw	zero,-20(s0)
     2e0:	a031                	j	2ec <strlen+0x1a>
     2e2:	fec42783          	lw	a5,-20(s0)
     2e6:	2785                	addiw	a5,a5,1
     2e8:	fef42623          	sw	a5,-20(s0)
     2ec:	fec42783          	lw	a5,-20(s0)
     2f0:	fd843703          	ld	a4,-40(s0)
     2f4:	97ba                	add	a5,a5,a4
     2f6:	0007c783          	lbu	a5,0(a5)
     2fa:	f7e5                	bnez	a5,2e2 <strlen+0x10>
    ;
  return n;
     2fc:	fec42783          	lw	a5,-20(s0)
}
     300:	853e                	mv	a0,a5
     302:	7422                	ld	s0,40(sp)
     304:	6145                	addi	sp,sp,48
     306:	8082                	ret

0000000000000308 <memset>:

void*
memset(void *dst, int c, uint n)
{
     308:	7179                	addi	sp,sp,-48
     30a:	f422                	sd	s0,40(sp)
     30c:	1800                	addi	s0,sp,48
     30e:	fca43c23          	sd	a0,-40(s0)
     312:	87ae                	mv	a5,a1
     314:	8732                	mv	a4,a2
     316:	fcf42a23          	sw	a5,-44(s0)
     31a:	87ba                	mv	a5,a4
     31c:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     320:	fd843783          	ld	a5,-40(s0)
     324:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     328:	fe042623          	sw	zero,-20(s0)
     32c:	a00d                	j	34e <memset+0x46>
    cdst[i] = c;
     32e:	fec42783          	lw	a5,-20(s0)
     332:	fe043703          	ld	a4,-32(s0)
     336:	97ba                	add	a5,a5,a4
     338:	fd442703          	lw	a4,-44(s0)
     33c:	0ff77713          	andi	a4,a4,255
     340:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     344:	fec42783          	lw	a5,-20(s0)
     348:	2785                	addiw	a5,a5,1
     34a:	fef42623          	sw	a5,-20(s0)
     34e:	fec42703          	lw	a4,-20(s0)
     352:	fd042783          	lw	a5,-48(s0)
     356:	2781                	sext.w	a5,a5
     358:	fcf76be3          	bltu	a4,a5,32e <memset+0x26>
  }
  return dst;
     35c:	fd843783          	ld	a5,-40(s0)
}
     360:	853e                	mv	a0,a5
     362:	7422                	ld	s0,40(sp)
     364:	6145                	addi	sp,sp,48
     366:	8082                	ret

0000000000000368 <strchr>:

char*
strchr(const char *s, char c)
{
     368:	1101                	addi	sp,sp,-32
     36a:	ec22                	sd	s0,24(sp)
     36c:	1000                	addi	s0,sp,32
     36e:	fea43423          	sd	a0,-24(s0)
     372:	87ae                	mv	a5,a1
     374:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     378:	a01d                	j	39e <strchr+0x36>
    if(*s == c)
     37a:	fe843783          	ld	a5,-24(s0)
     37e:	0007c703          	lbu	a4,0(a5)
     382:	fe744783          	lbu	a5,-25(s0)
     386:	0ff7f793          	andi	a5,a5,255
     38a:	00e79563          	bne	a5,a4,394 <strchr+0x2c>
      return (char*)s;
     38e:	fe843783          	ld	a5,-24(s0)
     392:	a821                	j	3aa <strchr+0x42>
  for(; *s; s++)
     394:	fe843783          	ld	a5,-24(s0)
     398:	0785                	addi	a5,a5,1
     39a:	fef43423          	sd	a5,-24(s0)
     39e:	fe843783          	ld	a5,-24(s0)
     3a2:	0007c783          	lbu	a5,0(a5)
     3a6:	fbf1                	bnez	a5,37a <strchr+0x12>
  return 0;
     3a8:	4781                	li	a5,0
}
     3aa:	853e                	mv	a0,a5
     3ac:	6462                	ld	s0,24(sp)
     3ae:	6105                	addi	sp,sp,32
     3b0:	8082                	ret

00000000000003b2 <gets>:

char*
gets(char *buf, int max)
{
     3b2:	7179                	addi	sp,sp,-48
     3b4:	f406                	sd	ra,40(sp)
     3b6:	f022                	sd	s0,32(sp)
     3b8:	1800                	addi	s0,sp,48
     3ba:	fca43c23          	sd	a0,-40(s0)
     3be:	87ae                	mv	a5,a1
     3c0:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     3c4:	fe042623          	sw	zero,-20(s0)
     3c8:	a8a1                	j	420 <gets+0x6e>
    cc = read(0, &c, 1);
     3ca:	fe740793          	addi	a5,s0,-25
     3ce:	4605                	li	a2,1
     3d0:	85be                	mv	a1,a5
     3d2:	4501                	li	a0,0
     3d4:	00000097          	auipc	ra,0x0
     3d8:	2f6080e7          	jalr	758(ra) # 6ca <read>
     3dc:	87aa                	mv	a5,a0
     3de:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     3e2:	fe842783          	lw	a5,-24(s0)
     3e6:	2781                	sext.w	a5,a5
     3e8:	04f05763          	blez	a5,436 <gets+0x84>
      break;
    buf[i++] = c;
     3ec:	fec42783          	lw	a5,-20(s0)
     3f0:	0017871b          	addiw	a4,a5,1
     3f4:	fee42623          	sw	a4,-20(s0)
     3f8:	873e                	mv	a4,a5
     3fa:	fd843783          	ld	a5,-40(s0)
     3fe:	97ba                	add	a5,a5,a4
     400:	fe744703          	lbu	a4,-25(s0)
     404:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     408:	fe744783          	lbu	a5,-25(s0)
     40c:	873e                	mv	a4,a5
     40e:	47a9                	li	a5,10
     410:	02f70463          	beq	a4,a5,438 <gets+0x86>
     414:	fe744783          	lbu	a5,-25(s0)
     418:	873e                	mv	a4,a5
     41a:	47b5                	li	a5,13
     41c:	00f70e63          	beq	a4,a5,438 <gets+0x86>
  for(i=0; i+1 < max; ){
     420:	fec42783          	lw	a5,-20(s0)
     424:	2785                	addiw	a5,a5,1
     426:	0007871b          	sext.w	a4,a5
     42a:	fd442783          	lw	a5,-44(s0)
     42e:	2781                	sext.w	a5,a5
     430:	f8f74de3          	blt	a4,a5,3ca <gets+0x18>
     434:	a011                	j	438 <gets+0x86>
      break;
     436:	0001                	nop
      break;
  }
  buf[i] = '\0';
     438:	fec42783          	lw	a5,-20(s0)
     43c:	fd843703          	ld	a4,-40(s0)
     440:	97ba                	add	a5,a5,a4
     442:	00078023          	sb	zero,0(a5)
  return buf;
     446:	fd843783          	ld	a5,-40(s0)
}
     44a:	853e                	mv	a0,a5
     44c:	70a2                	ld	ra,40(sp)
     44e:	7402                	ld	s0,32(sp)
     450:	6145                	addi	sp,sp,48
     452:	8082                	ret

0000000000000454 <stat>:

int
stat(const char *n, struct stat *st)
{
     454:	7179                	addi	sp,sp,-48
     456:	f406                	sd	ra,40(sp)
     458:	f022                	sd	s0,32(sp)
     45a:	1800                	addi	s0,sp,48
     45c:	fca43c23          	sd	a0,-40(s0)
     460:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     464:	4581                	li	a1,0
     466:	fd843503          	ld	a0,-40(s0)
     46a:	00000097          	auipc	ra,0x0
     46e:	288080e7          	jalr	648(ra) # 6f2 <open>
     472:	87aa                	mv	a5,a0
     474:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     478:	fec42783          	lw	a5,-20(s0)
     47c:	2781                	sext.w	a5,a5
     47e:	0007d463          	bgez	a5,486 <stat+0x32>
    return -1;
     482:	57fd                	li	a5,-1
     484:	a035                	j	4b0 <stat+0x5c>
  r = fstat(fd, st);
     486:	fec42783          	lw	a5,-20(s0)
     48a:	fd043583          	ld	a1,-48(s0)
     48e:	853e                	mv	a0,a5
     490:	00000097          	auipc	ra,0x0
     494:	27a080e7          	jalr	634(ra) # 70a <fstat>
     498:	87aa                	mv	a5,a0
     49a:	fef42423          	sw	a5,-24(s0)
  close(fd);
     49e:	fec42783          	lw	a5,-20(s0)
     4a2:	853e                	mv	a0,a5
     4a4:	00000097          	auipc	ra,0x0
     4a8:	236080e7          	jalr	566(ra) # 6da <close>
  return r;
     4ac:	fe842783          	lw	a5,-24(s0)
}
     4b0:	853e                	mv	a0,a5
     4b2:	70a2                	ld	ra,40(sp)
     4b4:	7402                	ld	s0,32(sp)
     4b6:	6145                	addi	sp,sp,48
     4b8:	8082                	ret

00000000000004ba <atoi>:

int
atoi(const char *s)
{
     4ba:	7179                	addi	sp,sp,-48
     4bc:	f422                	sd	s0,40(sp)
     4be:	1800                	addi	s0,sp,48
     4c0:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     4c4:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     4c8:	a815                	j	4fc <atoi+0x42>
    n = n*10 + *s++ - '0';
     4ca:	fec42703          	lw	a4,-20(s0)
     4ce:	87ba                	mv	a5,a4
     4d0:	0027979b          	slliw	a5,a5,0x2
     4d4:	9fb9                	addw	a5,a5,a4
     4d6:	0017979b          	slliw	a5,a5,0x1
     4da:	0007871b          	sext.w	a4,a5
     4de:	fd843783          	ld	a5,-40(s0)
     4e2:	00178693          	addi	a3,a5,1
     4e6:	fcd43c23          	sd	a3,-40(s0)
     4ea:	0007c783          	lbu	a5,0(a5)
     4ee:	2781                	sext.w	a5,a5
     4f0:	9fb9                	addw	a5,a5,a4
     4f2:	2781                	sext.w	a5,a5
     4f4:	fd07879b          	addiw	a5,a5,-48
     4f8:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     4fc:	fd843783          	ld	a5,-40(s0)
     500:	0007c783          	lbu	a5,0(a5)
     504:	873e                	mv	a4,a5
     506:	02f00793          	li	a5,47
     50a:	00e7fb63          	bgeu	a5,a4,520 <atoi+0x66>
     50e:	fd843783          	ld	a5,-40(s0)
     512:	0007c783          	lbu	a5,0(a5)
     516:	873e                	mv	a4,a5
     518:	03900793          	li	a5,57
     51c:	fae7f7e3          	bgeu	a5,a4,4ca <atoi+0x10>
  return n;
     520:	fec42783          	lw	a5,-20(s0)
}
     524:	853e                	mv	a0,a5
     526:	7422                	ld	s0,40(sp)
     528:	6145                	addi	sp,sp,48
     52a:	8082                	ret

000000000000052c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     52c:	7139                	addi	sp,sp,-64
     52e:	fc22                	sd	s0,56(sp)
     530:	0080                	addi	s0,sp,64
     532:	fca43c23          	sd	a0,-40(s0)
     536:	fcb43823          	sd	a1,-48(s0)
     53a:	87b2                	mv	a5,a2
     53c:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     540:	fd843783          	ld	a5,-40(s0)
     544:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     548:	fd043783          	ld	a5,-48(s0)
     54c:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     550:	fe043703          	ld	a4,-32(s0)
     554:	fe843783          	ld	a5,-24(s0)
     558:	02e7fc63          	bgeu	a5,a4,590 <memmove+0x64>
    while(n-- > 0)
     55c:	a00d                	j	57e <memmove+0x52>
      *dst++ = *src++;
     55e:	fe043703          	ld	a4,-32(s0)
     562:	00170793          	addi	a5,a4,1
     566:	fef43023          	sd	a5,-32(s0)
     56a:	fe843783          	ld	a5,-24(s0)
     56e:	00178693          	addi	a3,a5,1
     572:	fed43423          	sd	a3,-24(s0)
     576:	00074703          	lbu	a4,0(a4)
     57a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     57e:	fcc42783          	lw	a5,-52(s0)
     582:	fff7871b          	addiw	a4,a5,-1
     586:	fce42623          	sw	a4,-52(s0)
     58a:	fcf04ae3          	bgtz	a5,55e <memmove+0x32>
     58e:	a891                	j	5e2 <memmove+0xb6>
  } else {
    dst += n;
     590:	fcc42783          	lw	a5,-52(s0)
     594:	fe843703          	ld	a4,-24(s0)
     598:	97ba                	add	a5,a5,a4
     59a:	fef43423          	sd	a5,-24(s0)
    src += n;
     59e:	fcc42783          	lw	a5,-52(s0)
     5a2:	fe043703          	ld	a4,-32(s0)
     5a6:	97ba                	add	a5,a5,a4
     5a8:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     5ac:	a01d                	j	5d2 <memmove+0xa6>
      *--dst = *--src;
     5ae:	fe043783          	ld	a5,-32(s0)
     5b2:	17fd                	addi	a5,a5,-1
     5b4:	fef43023          	sd	a5,-32(s0)
     5b8:	fe843783          	ld	a5,-24(s0)
     5bc:	17fd                	addi	a5,a5,-1
     5be:	fef43423          	sd	a5,-24(s0)
     5c2:	fe043783          	ld	a5,-32(s0)
     5c6:	0007c703          	lbu	a4,0(a5)
     5ca:	fe843783          	ld	a5,-24(s0)
     5ce:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     5d2:	fcc42783          	lw	a5,-52(s0)
     5d6:	fff7871b          	addiw	a4,a5,-1
     5da:	fce42623          	sw	a4,-52(s0)
     5de:	fcf048e3          	bgtz	a5,5ae <memmove+0x82>
  }
  return vdst;
     5e2:	fd843783          	ld	a5,-40(s0)
}
     5e6:	853e                	mv	a0,a5
     5e8:	7462                	ld	s0,56(sp)
     5ea:	6121                	addi	sp,sp,64
     5ec:	8082                	ret

00000000000005ee <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     5ee:	7139                	addi	sp,sp,-64
     5f0:	fc22                	sd	s0,56(sp)
     5f2:	0080                	addi	s0,sp,64
     5f4:	fca43c23          	sd	a0,-40(s0)
     5f8:	fcb43823          	sd	a1,-48(s0)
     5fc:	87b2                	mv	a5,a2
     5fe:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     602:	fd843783          	ld	a5,-40(s0)
     606:	fef43423          	sd	a5,-24(s0)
     60a:	fd043783          	ld	a5,-48(s0)
     60e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     612:	a0a1                	j	65a <memcmp+0x6c>
    if (*p1 != *p2) {
     614:	fe843783          	ld	a5,-24(s0)
     618:	0007c703          	lbu	a4,0(a5)
     61c:	fe043783          	ld	a5,-32(s0)
     620:	0007c783          	lbu	a5,0(a5)
     624:	02f70163          	beq	a4,a5,646 <memcmp+0x58>
      return *p1 - *p2;
     628:	fe843783          	ld	a5,-24(s0)
     62c:	0007c783          	lbu	a5,0(a5)
     630:	0007871b          	sext.w	a4,a5
     634:	fe043783          	ld	a5,-32(s0)
     638:	0007c783          	lbu	a5,0(a5)
     63c:	2781                	sext.w	a5,a5
     63e:	40f707bb          	subw	a5,a4,a5
     642:	2781                	sext.w	a5,a5
     644:	a01d                	j	66a <memcmp+0x7c>
    }
    p1++;
     646:	fe843783          	ld	a5,-24(s0)
     64a:	0785                	addi	a5,a5,1
     64c:	fef43423          	sd	a5,-24(s0)
    p2++;
     650:	fe043783          	ld	a5,-32(s0)
     654:	0785                	addi	a5,a5,1
     656:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     65a:	fcc42783          	lw	a5,-52(s0)
     65e:	fff7871b          	addiw	a4,a5,-1
     662:	fce42623          	sw	a4,-52(s0)
     666:	f7dd                	bnez	a5,614 <memcmp+0x26>
  }
  return 0;
     668:	4781                	li	a5,0
}
     66a:	853e                	mv	a0,a5
     66c:	7462                	ld	s0,56(sp)
     66e:	6121                	addi	sp,sp,64
     670:	8082                	ret

0000000000000672 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     672:	7179                	addi	sp,sp,-48
     674:	f406                	sd	ra,40(sp)
     676:	f022                	sd	s0,32(sp)
     678:	1800                	addi	s0,sp,48
     67a:	fea43423          	sd	a0,-24(s0)
     67e:	feb43023          	sd	a1,-32(s0)
     682:	87b2                	mv	a5,a2
     684:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     688:	fdc42783          	lw	a5,-36(s0)
     68c:	863e                	mv	a2,a5
     68e:	fe043583          	ld	a1,-32(s0)
     692:	fe843503          	ld	a0,-24(s0)
     696:	00000097          	auipc	ra,0x0
     69a:	e96080e7          	jalr	-362(ra) # 52c <memmove>
     69e:	87aa                	mv	a5,a0
}
     6a0:	853e                	mv	a0,a5
     6a2:	70a2                	ld	ra,40(sp)
     6a4:	7402                	ld	s0,32(sp)
     6a6:	6145                	addi	sp,sp,48
     6a8:	8082                	ret

00000000000006aa <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     6aa:	4885                	li	a7,1
 ecall
     6ac:	00000073          	ecall
 ret
     6b0:	8082                	ret

00000000000006b2 <exit>:
.global exit
exit:
 li a7, SYS_exit
     6b2:	4889                	li	a7,2
 ecall
     6b4:	00000073          	ecall
 ret
     6b8:	8082                	ret

00000000000006ba <wait>:
.global wait
wait:
 li a7, SYS_wait
     6ba:	488d                	li	a7,3
 ecall
     6bc:	00000073          	ecall
 ret
     6c0:	8082                	ret

00000000000006c2 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     6c2:	4891                	li	a7,4
 ecall
     6c4:	00000073          	ecall
 ret
     6c8:	8082                	ret

00000000000006ca <read>:
.global read
read:
 li a7, SYS_read
     6ca:	4895                	li	a7,5
 ecall
     6cc:	00000073          	ecall
 ret
     6d0:	8082                	ret

00000000000006d2 <write>:
.global write
write:
 li a7, SYS_write
     6d2:	48c1                	li	a7,16
 ecall
     6d4:	00000073          	ecall
 ret
     6d8:	8082                	ret

00000000000006da <close>:
.global close
close:
 li a7, SYS_close
     6da:	48d5                	li	a7,21
 ecall
     6dc:	00000073          	ecall
 ret
     6e0:	8082                	ret

00000000000006e2 <kill>:
.global kill
kill:
 li a7, SYS_kill
     6e2:	4899                	li	a7,6
 ecall
     6e4:	00000073          	ecall
 ret
     6e8:	8082                	ret

00000000000006ea <exec>:
.global exec
exec:
 li a7, SYS_exec
     6ea:	489d                	li	a7,7
 ecall
     6ec:	00000073          	ecall
 ret
     6f0:	8082                	ret

00000000000006f2 <open>:
.global open
open:
 li a7, SYS_open
     6f2:	48bd                	li	a7,15
 ecall
     6f4:	00000073          	ecall
 ret
     6f8:	8082                	ret

00000000000006fa <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     6fa:	48c5                	li	a7,17
 ecall
     6fc:	00000073          	ecall
 ret
     700:	8082                	ret

0000000000000702 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     702:	48c9                	li	a7,18
 ecall
     704:	00000073          	ecall
 ret
     708:	8082                	ret

000000000000070a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     70a:	48a1                	li	a7,8
 ecall
     70c:	00000073          	ecall
 ret
     710:	8082                	ret

0000000000000712 <link>:
.global link
link:
 li a7, SYS_link
     712:	48cd                	li	a7,19
 ecall
     714:	00000073          	ecall
 ret
     718:	8082                	ret

000000000000071a <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     71a:	48d1                	li	a7,20
 ecall
     71c:	00000073          	ecall
 ret
     720:	8082                	ret

0000000000000722 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     722:	48a5                	li	a7,9
 ecall
     724:	00000073          	ecall
 ret
     728:	8082                	ret

000000000000072a <dup>:
.global dup
dup:
 li a7, SYS_dup
     72a:	48a9                	li	a7,10
 ecall
     72c:	00000073          	ecall
 ret
     730:	8082                	ret

0000000000000732 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     732:	48ad                	li	a7,11
 ecall
     734:	00000073          	ecall
 ret
     738:	8082                	ret

000000000000073a <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     73a:	48b1                	li	a7,12
 ecall
     73c:	00000073          	ecall
 ret
     740:	8082                	ret

0000000000000742 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     742:	48b5                	li	a7,13
 ecall
     744:	00000073          	ecall
 ret
     748:	8082                	ret

000000000000074a <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     74a:	48b9                	li	a7,14
 ecall
     74c:	00000073          	ecall
 ret
     750:	8082                	ret

0000000000000752 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     752:	48d9                	li	a7,22
 ecall
     754:	00000073          	ecall
 ret
     758:	8082                	ret

000000000000075a <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     75a:	48dd                	li	a7,23
 ecall
     75c:	00000073          	ecall
 ret
     760:	8082                	ret

0000000000000762 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     762:	48e1                	li	a7,24
 ecall
     764:	00000073          	ecall
 ret
     768:	8082                	ret

000000000000076a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     76a:	1101                	addi	sp,sp,-32
     76c:	ec06                	sd	ra,24(sp)
     76e:	e822                	sd	s0,16(sp)
     770:	1000                	addi	s0,sp,32
     772:	87aa                	mv	a5,a0
     774:	872e                	mv	a4,a1
     776:	fef42623          	sw	a5,-20(s0)
     77a:	87ba                	mv	a5,a4
     77c:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     780:	feb40713          	addi	a4,s0,-21
     784:	fec42783          	lw	a5,-20(s0)
     788:	4605                	li	a2,1
     78a:	85ba                	mv	a1,a4
     78c:	853e                	mv	a0,a5
     78e:	00000097          	auipc	ra,0x0
     792:	f44080e7          	jalr	-188(ra) # 6d2 <write>
}
     796:	0001                	nop
     798:	60e2                	ld	ra,24(sp)
     79a:	6442                	ld	s0,16(sp)
     79c:	6105                	addi	sp,sp,32
     79e:	8082                	ret

00000000000007a0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     7a0:	7139                	addi	sp,sp,-64
     7a2:	fc06                	sd	ra,56(sp)
     7a4:	f822                	sd	s0,48(sp)
     7a6:	0080                	addi	s0,sp,64
     7a8:	87aa                	mv	a5,a0
     7aa:	8736                	mv	a4,a3
     7ac:	fcf42623          	sw	a5,-52(s0)
     7b0:	87ae                	mv	a5,a1
     7b2:	fcf42423          	sw	a5,-56(s0)
     7b6:	87b2                	mv	a5,a2
     7b8:	fcf42223          	sw	a5,-60(s0)
     7bc:	87ba                	mv	a5,a4
     7be:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     7c2:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     7c6:	fc042783          	lw	a5,-64(s0)
     7ca:	2781                	sext.w	a5,a5
     7cc:	c38d                	beqz	a5,7ee <printint+0x4e>
     7ce:	fc842783          	lw	a5,-56(s0)
     7d2:	2781                	sext.w	a5,a5
     7d4:	0007dd63          	bgez	a5,7ee <printint+0x4e>
    neg = 1;
     7d8:	4785                	li	a5,1
     7da:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     7de:	fc842783          	lw	a5,-56(s0)
     7e2:	40f007bb          	negw	a5,a5
     7e6:	2781                	sext.w	a5,a5
     7e8:	fef42223          	sw	a5,-28(s0)
     7ec:	a029                	j	7f6 <printint+0x56>
  } else {
    x = xx;
     7ee:	fc842783          	lw	a5,-56(s0)
     7f2:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     7f6:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     7fa:	fc442783          	lw	a5,-60(s0)
     7fe:	fe442703          	lw	a4,-28(s0)
     802:	02f777bb          	remuw	a5,a4,a5
     806:	0007861b          	sext.w	a2,a5
     80a:	fec42783          	lw	a5,-20(s0)
     80e:	0017871b          	addiw	a4,a5,1
     812:	fee42623          	sw	a4,-20(s0)
     816:	00001697          	auipc	a3,0x1
     81a:	24268693          	addi	a3,a3,578 # 1a58 <digits>
     81e:	02061713          	slli	a4,a2,0x20
     822:	9301                	srli	a4,a4,0x20
     824:	9736                	add	a4,a4,a3
     826:	00074703          	lbu	a4,0(a4)
     82a:	ff040693          	addi	a3,s0,-16
     82e:	97b6                	add	a5,a5,a3
     830:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     834:	fc442783          	lw	a5,-60(s0)
     838:	fe442703          	lw	a4,-28(s0)
     83c:	02f757bb          	divuw	a5,a4,a5
     840:	fef42223          	sw	a5,-28(s0)
     844:	fe442783          	lw	a5,-28(s0)
     848:	2781                	sext.w	a5,a5
     84a:	fbc5                	bnez	a5,7fa <printint+0x5a>
  if(neg)
     84c:	fe842783          	lw	a5,-24(s0)
     850:	2781                	sext.w	a5,a5
     852:	cf95                	beqz	a5,88e <printint+0xee>
    buf[i++] = '-';
     854:	fec42783          	lw	a5,-20(s0)
     858:	0017871b          	addiw	a4,a5,1
     85c:	fee42623          	sw	a4,-20(s0)
     860:	ff040713          	addi	a4,s0,-16
     864:	97ba                	add	a5,a5,a4
     866:	02d00713          	li	a4,45
     86a:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     86e:	a005                	j	88e <printint+0xee>
    putc(fd, buf[i]);
     870:	fec42783          	lw	a5,-20(s0)
     874:	ff040713          	addi	a4,s0,-16
     878:	97ba                	add	a5,a5,a4
     87a:	fe07c703          	lbu	a4,-32(a5)
     87e:	fcc42783          	lw	a5,-52(s0)
     882:	85ba                	mv	a1,a4
     884:	853e                	mv	a0,a5
     886:	00000097          	auipc	ra,0x0
     88a:	ee4080e7          	jalr	-284(ra) # 76a <putc>
  while(--i >= 0)
     88e:	fec42783          	lw	a5,-20(s0)
     892:	37fd                	addiw	a5,a5,-1
     894:	fef42623          	sw	a5,-20(s0)
     898:	fec42783          	lw	a5,-20(s0)
     89c:	2781                	sext.w	a5,a5
     89e:	fc07d9e3          	bgez	a5,870 <printint+0xd0>
}
     8a2:	0001                	nop
     8a4:	0001                	nop
     8a6:	70e2                	ld	ra,56(sp)
     8a8:	7442                	ld	s0,48(sp)
     8aa:	6121                	addi	sp,sp,64
     8ac:	8082                	ret

00000000000008ae <printptr>:

static void
printptr(int fd, uint64 x) {
     8ae:	7179                	addi	sp,sp,-48
     8b0:	f406                	sd	ra,40(sp)
     8b2:	f022                	sd	s0,32(sp)
     8b4:	1800                	addi	s0,sp,48
     8b6:	87aa                	mv	a5,a0
     8b8:	fcb43823          	sd	a1,-48(s0)
     8bc:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     8c0:	fdc42783          	lw	a5,-36(s0)
     8c4:	03000593          	li	a1,48
     8c8:	853e                	mv	a0,a5
     8ca:	00000097          	auipc	ra,0x0
     8ce:	ea0080e7          	jalr	-352(ra) # 76a <putc>
  putc(fd, 'x');
     8d2:	fdc42783          	lw	a5,-36(s0)
     8d6:	07800593          	li	a1,120
     8da:	853e                	mv	a0,a5
     8dc:	00000097          	auipc	ra,0x0
     8e0:	e8e080e7          	jalr	-370(ra) # 76a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     8e4:	fe042623          	sw	zero,-20(s0)
     8e8:	a82d                	j	922 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     8ea:	fd043783          	ld	a5,-48(s0)
     8ee:	93f1                	srli	a5,a5,0x3c
     8f0:	00001717          	auipc	a4,0x1
     8f4:	16870713          	addi	a4,a4,360 # 1a58 <digits>
     8f8:	97ba                	add	a5,a5,a4
     8fa:	0007c703          	lbu	a4,0(a5)
     8fe:	fdc42783          	lw	a5,-36(s0)
     902:	85ba                	mv	a1,a4
     904:	853e                	mv	a0,a5
     906:	00000097          	auipc	ra,0x0
     90a:	e64080e7          	jalr	-412(ra) # 76a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     90e:	fec42783          	lw	a5,-20(s0)
     912:	2785                	addiw	a5,a5,1
     914:	fef42623          	sw	a5,-20(s0)
     918:	fd043783          	ld	a5,-48(s0)
     91c:	0792                	slli	a5,a5,0x4
     91e:	fcf43823          	sd	a5,-48(s0)
     922:	fec42783          	lw	a5,-20(s0)
     926:	873e                	mv	a4,a5
     928:	47bd                	li	a5,15
     92a:	fce7f0e3          	bgeu	a5,a4,8ea <printptr+0x3c>
}
     92e:	0001                	nop
     930:	0001                	nop
     932:	70a2                	ld	ra,40(sp)
     934:	7402                	ld	s0,32(sp)
     936:	6145                	addi	sp,sp,48
     938:	8082                	ret

000000000000093a <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     93a:	715d                	addi	sp,sp,-80
     93c:	e486                	sd	ra,72(sp)
     93e:	e0a2                	sd	s0,64(sp)
     940:	0880                	addi	s0,sp,80
     942:	87aa                	mv	a5,a0
     944:	fcb43023          	sd	a1,-64(s0)
     948:	fac43c23          	sd	a2,-72(s0)
     94c:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     950:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     954:	fe042223          	sw	zero,-28(s0)
     958:	a42d                	j	b82 <vprintf+0x248>
    c = fmt[i] & 0xff;
     95a:	fe442783          	lw	a5,-28(s0)
     95e:	fc043703          	ld	a4,-64(s0)
     962:	97ba                	add	a5,a5,a4
     964:	0007c783          	lbu	a5,0(a5)
     968:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     96c:	fe042783          	lw	a5,-32(s0)
     970:	2781                	sext.w	a5,a5
     972:	eb9d                	bnez	a5,9a8 <vprintf+0x6e>
      if(c == '%'){
     974:	fdc42783          	lw	a5,-36(s0)
     978:	0007871b          	sext.w	a4,a5
     97c:	02500793          	li	a5,37
     980:	00f71763          	bne	a4,a5,98e <vprintf+0x54>
        state = '%';
     984:	02500793          	li	a5,37
     988:	fef42023          	sw	a5,-32(s0)
     98c:	a2f5                	j	b78 <vprintf+0x23e>
      } else {
        putc(fd, c);
     98e:	fdc42783          	lw	a5,-36(s0)
     992:	0ff7f713          	andi	a4,a5,255
     996:	fcc42783          	lw	a5,-52(s0)
     99a:	85ba                	mv	a1,a4
     99c:	853e                	mv	a0,a5
     99e:	00000097          	auipc	ra,0x0
     9a2:	dcc080e7          	jalr	-564(ra) # 76a <putc>
     9a6:	aac9                	j	b78 <vprintf+0x23e>
      }
    } else if(state == '%'){
     9a8:	fe042783          	lw	a5,-32(s0)
     9ac:	0007871b          	sext.w	a4,a5
     9b0:	02500793          	li	a5,37
     9b4:	1cf71263          	bne	a4,a5,b78 <vprintf+0x23e>
      if(c == 'd'){
     9b8:	fdc42783          	lw	a5,-36(s0)
     9bc:	0007871b          	sext.w	a4,a5
     9c0:	06400793          	li	a5,100
     9c4:	02f71463          	bne	a4,a5,9ec <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     9c8:	fb843783          	ld	a5,-72(s0)
     9cc:	00878713          	addi	a4,a5,8
     9d0:	fae43c23          	sd	a4,-72(s0)
     9d4:	4398                	lw	a4,0(a5)
     9d6:	fcc42783          	lw	a5,-52(s0)
     9da:	4685                	li	a3,1
     9dc:	4629                	li	a2,10
     9de:	85ba                	mv	a1,a4
     9e0:	853e                	mv	a0,a5
     9e2:	00000097          	auipc	ra,0x0
     9e6:	dbe080e7          	jalr	-578(ra) # 7a0 <printint>
     9ea:	a269                	j	b74 <vprintf+0x23a>
      } else if(c == 'l') {
     9ec:	fdc42783          	lw	a5,-36(s0)
     9f0:	0007871b          	sext.w	a4,a5
     9f4:	06c00793          	li	a5,108
     9f8:	02f71663          	bne	a4,a5,a24 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     9fc:	fb843783          	ld	a5,-72(s0)
     a00:	00878713          	addi	a4,a5,8
     a04:	fae43c23          	sd	a4,-72(s0)
     a08:	639c                	ld	a5,0(a5)
     a0a:	0007871b          	sext.w	a4,a5
     a0e:	fcc42783          	lw	a5,-52(s0)
     a12:	4681                	li	a3,0
     a14:	4629                	li	a2,10
     a16:	85ba                	mv	a1,a4
     a18:	853e                	mv	a0,a5
     a1a:	00000097          	auipc	ra,0x0
     a1e:	d86080e7          	jalr	-634(ra) # 7a0 <printint>
     a22:	aa89                	j	b74 <vprintf+0x23a>
      } else if(c == 'x') {
     a24:	fdc42783          	lw	a5,-36(s0)
     a28:	0007871b          	sext.w	a4,a5
     a2c:	07800793          	li	a5,120
     a30:	02f71463          	bne	a4,a5,a58 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     a34:	fb843783          	ld	a5,-72(s0)
     a38:	00878713          	addi	a4,a5,8
     a3c:	fae43c23          	sd	a4,-72(s0)
     a40:	4398                	lw	a4,0(a5)
     a42:	fcc42783          	lw	a5,-52(s0)
     a46:	4681                	li	a3,0
     a48:	4641                	li	a2,16
     a4a:	85ba                	mv	a1,a4
     a4c:	853e                	mv	a0,a5
     a4e:	00000097          	auipc	ra,0x0
     a52:	d52080e7          	jalr	-686(ra) # 7a0 <printint>
     a56:	aa39                	j	b74 <vprintf+0x23a>
      } else if(c == 'p') {
     a58:	fdc42783          	lw	a5,-36(s0)
     a5c:	0007871b          	sext.w	a4,a5
     a60:	07000793          	li	a5,112
     a64:	02f71263          	bne	a4,a5,a88 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     a68:	fb843783          	ld	a5,-72(s0)
     a6c:	00878713          	addi	a4,a5,8
     a70:	fae43c23          	sd	a4,-72(s0)
     a74:	6398                	ld	a4,0(a5)
     a76:	fcc42783          	lw	a5,-52(s0)
     a7a:	85ba                	mv	a1,a4
     a7c:	853e                	mv	a0,a5
     a7e:	00000097          	auipc	ra,0x0
     a82:	e30080e7          	jalr	-464(ra) # 8ae <printptr>
     a86:	a0fd                	j	b74 <vprintf+0x23a>
      } else if(c == 's'){
     a88:	fdc42783          	lw	a5,-36(s0)
     a8c:	0007871b          	sext.w	a4,a5
     a90:	07300793          	li	a5,115
     a94:	04f71c63          	bne	a4,a5,aec <vprintf+0x1b2>
        s = va_arg(ap, char*);
     a98:	fb843783          	ld	a5,-72(s0)
     a9c:	00878713          	addi	a4,a5,8
     aa0:	fae43c23          	sd	a4,-72(s0)
     aa4:	639c                	ld	a5,0(a5)
     aa6:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     aaa:	fe843783          	ld	a5,-24(s0)
     aae:	eb8d                	bnez	a5,ae0 <vprintf+0x1a6>
          s = "(null)";
     ab0:	00001797          	auipc	a5,0x1
     ab4:	fa078793          	addi	a5,a5,-96 # 1a50 <schedule_dm+0x2d2>
     ab8:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     abc:	a015                	j	ae0 <vprintf+0x1a6>
          putc(fd, *s);
     abe:	fe843783          	ld	a5,-24(s0)
     ac2:	0007c703          	lbu	a4,0(a5)
     ac6:	fcc42783          	lw	a5,-52(s0)
     aca:	85ba                	mv	a1,a4
     acc:	853e                	mv	a0,a5
     ace:	00000097          	auipc	ra,0x0
     ad2:	c9c080e7          	jalr	-868(ra) # 76a <putc>
          s++;
     ad6:	fe843783          	ld	a5,-24(s0)
     ada:	0785                	addi	a5,a5,1
     adc:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     ae0:	fe843783          	ld	a5,-24(s0)
     ae4:	0007c783          	lbu	a5,0(a5)
     ae8:	fbf9                	bnez	a5,abe <vprintf+0x184>
     aea:	a069                	j	b74 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     aec:	fdc42783          	lw	a5,-36(s0)
     af0:	0007871b          	sext.w	a4,a5
     af4:	06300793          	li	a5,99
     af8:	02f71463          	bne	a4,a5,b20 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     afc:	fb843783          	ld	a5,-72(s0)
     b00:	00878713          	addi	a4,a5,8
     b04:	fae43c23          	sd	a4,-72(s0)
     b08:	439c                	lw	a5,0(a5)
     b0a:	0ff7f713          	andi	a4,a5,255
     b0e:	fcc42783          	lw	a5,-52(s0)
     b12:	85ba                	mv	a1,a4
     b14:	853e                	mv	a0,a5
     b16:	00000097          	auipc	ra,0x0
     b1a:	c54080e7          	jalr	-940(ra) # 76a <putc>
     b1e:	a899                	j	b74 <vprintf+0x23a>
      } else if(c == '%'){
     b20:	fdc42783          	lw	a5,-36(s0)
     b24:	0007871b          	sext.w	a4,a5
     b28:	02500793          	li	a5,37
     b2c:	00f71f63          	bne	a4,a5,b4a <vprintf+0x210>
        putc(fd, c);
     b30:	fdc42783          	lw	a5,-36(s0)
     b34:	0ff7f713          	andi	a4,a5,255
     b38:	fcc42783          	lw	a5,-52(s0)
     b3c:	85ba                	mv	a1,a4
     b3e:	853e                	mv	a0,a5
     b40:	00000097          	auipc	ra,0x0
     b44:	c2a080e7          	jalr	-982(ra) # 76a <putc>
     b48:	a035                	j	b74 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     b4a:	fcc42783          	lw	a5,-52(s0)
     b4e:	02500593          	li	a1,37
     b52:	853e                	mv	a0,a5
     b54:	00000097          	auipc	ra,0x0
     b58:	c16080e7          	jalr	-1002(ra) # 76a <putc>
        putc(fd, c);
     b5c:	fdc42783          	lw	a5,-36(s0)
     b60:	0ff7f713          	andi	a4,a5,255
     b64:	fcc42783          	lw	a5,-52(s0)
     b68:	85ba                	mv	a1,a4
     b6a:	853e                	mv	a0,a5
     b6c:	00000097          	auipc	ra,0x0
     b70:	bfe080e7          	jalr	-1026(ra) # 76a <putc>
      }
      state = 0;
     b74:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     b78:	fe442783          	lw	a5,-28(s0)
     b7c:	2785                	addiw	a5,a5,1
     b7e:	fef42223          	sw	a5,-28(s0)
     b82:	fe442783          	lw	a5,-28(s0)
     b86:	fc043703          	ld	a4,-64(s0)
     b8a:	97ba                	add	a5,a5,a4
     b8c:	0007c783          	lbu	a5,0(a5)
     b90:	dc0795e3          	bnez	a5,95a <vprintf+0x20>
    }
  }
}
     b94:	0001                	nop
     b96:	0001                	nop
     b98:	60a6                	ld	ra,72(sp)
     b9a:	6406                	ld	s0,64(sp)
     b9c:	6161                	addi	sp,sp,80
     b9e:	8082                	ret

0000000000000ba0 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     ba0:	7159                	addi	sp,sp,-112
     ba2:	fc06                	sd	ra,56(sp)
     ba4:	f822                	sd	s0,48(sp)
     ba6:	0080                	addi	s0,sp,64
     ba8:	fcb43823          	sd	a1,-48(s0)
     bac:	e010                	sd	a2,0(s0)
     bae:	e414                	sd	a3,8(s0)
     bb0:	e818                	sd	a4,16(s0)
     bb2:	ec1c                	sd	a5,24(s0)
     bb4:	03043023          	sd	a6,32(s0)
     bb8:	03143423          	sd	a7,40(s0)
     bbc:	87aa                	mv	a5,a0
     bbe:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     bc2:	03040793          	addi	a5,s0,48
     bc6:	fcf43423          	sd	a5,-56(s0)
     bca:	fc843783          	ld	a5,-56(s0)
     bce:	fd078793          	addi	a5,a5,-48
     bd2:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     bd6:	fe843703          	ld	a4,-24(s0)
     bda:	fdc42783          	lw	a5,-36(s0)
     bde:	863a                	mv	a2,a4
     be0:	fd043583          	ld	a1,-48(s0)
     be4:	853e                	mv	a0,a5
     be6:	00000097          	auipc	ra,0x0
     bea:	d54080e7          	jalr	-684(ra) # 93a <vprintf>
}
     bee:	0001                	nop
     bf0:	70e2                	ld	ra,56(sp)
     bf2:	7442                	ld	s0,48(sp)
     bf4:	6165                	addi	sp,sp,112
     bf6:	8082                	ret

0000000000000bf8 <printf>:

void
printf(const char *fmt, ...)
{
     bf8:	7159                	addi	sp,sp,-112
     bfa:	f406                	sd	ra,40(sp)
     bfc:	f022                	sd	s0,32(sp)
     bfe:	1800                	addi	s0,sp,48
     c00:	fca43c23          	sd	a0,-40(s0)
     c04:	e40c                	sd	a1,8(s0)
     c06:	e810                	sd	a2,16(s0)
     c08:	ec14                	sd	a3,24(s0)
     c0a:	f018                	sd	a4,32(s0)
     c0c:	f41c                	sd	a5,40(s0)
     c0e:	03043823          	sd	a6,48(s0)
     c12:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     c16:	04040793          	addi	a5,s0,64
     c1a:	fcf43823          	sd	a5,-48(s0)
     c1e:	fd043783          	ld	a5,-48(s0)
     c22:	fc878793          	addi	a5,a5,-56
     c26:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     c2a:	fe843783          	ld	a5,-24(s0)
     c2e:	863e                	mv	a2,a5
     c30:	fd843583          	ld	a1,-40(s0)
     c34:	4505                	li	a0,1
     c36:	00000097          	auipc	ra,0x0
     c3a:	d04080e7          	jalr	-764(ra) # 93a <vprintf>
}
     c3e:	0001                	nop
     c40:	70a2                	ld	ra,40(sp)
     c42:	7402                	ld	s0,32(sp)
     c44:	6165                	addi	sp,sp,112
     c46:	8082                	ret

0000000000000c48 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c48:	7179                	addi	sp,sp,-48
     c4a:	f422                	sd	s0,40(sp)
     c4c:	1800                	addi	s0,sp,48
     c4e:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     c52:	fd843783          	ld	a5,-40(s0)
     c56:	17c1                	addi	a5,a5,-16
     c58:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c5c:	00001797          	auipc	a5,0x1
     c60:	02478793          	addi	a5,a5,36 # 1c80 <freep>
     c64:	639c                	ld	a5,0(a5)
     c66:	fef43423          	sd	a5,-24(s0)
     c6a:	a815                	j	c9e <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     c6c:	fe843783          	ld	a5,-24(s0)
     c70:	639c                	ld	a5,0(a5)
     c72:	fe843703          	ld	a4,-24(s0)
     c76:	00f76f63          	bltu	a4,a5,c94 <free+0x4c>
     c7a:	fe043703          	ld	a4,-32(s0)
     c7e:	fe843783          	ld	a5,-24(s0)
     c82:	02e7eb63          	bltu	a5,a4,cb8 <free+0x70>
     c86:	fe843783          	ld	a5,-24(s0)
     c8a:	639c                	ld	a5,0(a5)
     c8c:	fe043703          	ld	a4,-32(s0)
     c90:	02f76463          	bltu	a4,a5,cb8 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c94:	fe843783          	ld	a5,-24(s0)
     c98:	639c                	ld	a5,0(a5)
     c9a:	fef43423          	sd	a5,-24(s0)
     c9e:	fe043703          	ld	a4,-32(s0)
     ca2:	fe843783          	ld	a5,-24(s0)
     ca6:	fce7f3e3          	bgeu	a5,a4,c6c <free+0x24>
     caa:	fe843783          	ld	a5,-24(s0)
     cae:	639c                	ld	a5,0(a5)
     cb0:	fe043703          	ld	a4,-32(s0)
     cb4:	faf77ce3          	bgeu	a4,a5,c6c <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     cb8:	fe043783          	ld	a5,-32(s0)
     cbc:	479c                	lw	a5,8(a5)
     cbe:	1782                	slli	a5,a5,0x20
     cc0:	9381                	srli	a5,a5,0x20
     cc2:	0792                	slli	a5,a5,0x4
     cc4:	fe043703          	ld	a4,-32(s0)
     cc8:	973e                	add	a4,a4,a5
     cca:	fe843783          	ld	a5,-24(s0)
     cce:	639c                	ld	a5,0(a5)
     cd0:	02f71763          	bne	a4,a5,cfe <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     cd4:	fe043783          	ld	a5,-32(s0)
     cd8:	4798                	lw	a4,8(a5)
     cda:	fe843783          	ld	a5,-24(s0)
     cde:	639c                	ld	a5,0(a5)
     ce0:	479c                	lw	a5,8(a5)
     ce2:	9fb9                	addw	a5,a5,a4
     ce4:	0007871b          	sext.w	a4,a5
     ce8:	fe043783          	ld	a5,-32(s0)
     cec:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     cee:	fe843783          	ld	a5,-24(s0)
     cf2:	639c                	ld	a5,0(a5)
     cf4:	6398                	ld	a4,0(a5)
     cf6:	fe043783          	ld	a5,-32(s0)
     cfa:	e398                	sd	a4,0(a5)
     cfc:	a039                	j	d0a <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     cfe:	fe843783          	ld	a5,-24(s0)
     d02:	6398                	ld	a4,0(a5)
     d04:	fe043783          	ld	a5,-32(s0)
     d08:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     d0a:	fe843783          	ld	a5,-24(s0)
     d0e:	479c                	lw	a5,8(a5)
     d10:	1782                	slli	a5,a5,0x20
     d12:	9381                	srli	a5,a5,0x20
     d14:	0792                	slli	a5,a5,0x4
     d16:	fe843703          	ld	a4,-24(s0)
     d1a:	97ba                	add	a5,a5,a4
     d1c:	fe043703          	ld	a4,-32(s0)
     d20:	02f71563          	bne	a4,a5,d4a <free+0x102>
    p->s.size += bp->s.size;
     d24:	fe843783          	ld	a5,-24(s0)
     d28:	4798                	lw	a4,8(a5)
     d2a:	fe043783          	ld	a5,-32(s0)
     d2e:	479c                	lw	a5,8(a5)
     d30:	9fb9                	addw	a5,a5,a4
     d32:	0007871b          	sext.w	a4,a5
     d36:	fe843783          	ld	a5,-24(s0)
     d3a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     d3c:	fe043783          	ld	a5,-32(s0)
     d40:	6398                	ld	a4,0(a5)
     d42:	fe843783          	ld	a5,-24(s0)
     d46:	e398                	sd	a4,0(a5)
     d48:	a031                	j	d54 <free+0x10c>
  } else
    p->s.ptr = bp;
     d4a:	fe843783          	ld	a5,-24(s0)
     d4e:	fe043703          	ld	a4,-32(s0)
     d52:	e398                	sd	a4,0(a5)
  freep = p;
     d54:	00001797          	auipc	a5,0x1
     d58:	f2c78793          	addi	a5,a5,-212 # 1c80 <freep>
     d5c:	fe843703          	ld	a4,-24(s0)
     d60:	e398                	sd	a4,0(a5)
}
     d62:	0001                	nop
     d64:	7422                	ld	s0,40(sp)
     d66:	6145                	addi	sp,sp,48
     d68:	8082                	ret

0000000000000d6a <morecore>:

static Header*
morecore(uint nu)
{
     d6a:	7179                	addi	sp,sp,-48
     d6c:	f406                	sd	ra,40(sp)
     d6e:	f022                	sd	s0,32(sp)
     d70:	1800                	addi	s0,sp,48
     d72:	87aa                	mv	a5,a0
     d74:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     d78:	fdc42783          	lw	a5,-36(s0)
     d7c:	0007871b          	sext.w	a4,a5
     d80:	6785                	lui	a5,0x1
     d82:	00f77563          	bgeu	a4,a5,d8c <morecore+0x22>
    nu = 4096;
     d86:	6785                	lui	a5,0x1
     d88:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     d8c:	fdc42783          	lw	a5,-36(s0)
     d90:	0047979b          	slliw	a5,a5,0x4
     d94:	2781                	sext.w	a5,a5
     d96:	2781                	sext.w	a5,a5
     d98:	853e                	mv	a0,a5
     d9a:	00000097          	auipc	ra,0x0
     d9e:	9a0080e7          	jalr	-1632(ra) # 73a <sbrk>
     da2:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     da6:	fe843703          	ld	a4,-24(s0)
     daa:	57fd                	li	a5,-1
     dac:	00f71463          	bne	a4,a5,db4 <morecore+0x4a>
    return 0;
     db0:	4781                	li	a5,0
     db2:	a03d                	j	de0 <morecore+0x76>
  hp = (Header*)p;
     db4:	fe843783          	ld	a5,-24(s0)
     db8:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     dbc:	fe043783          	ld	a5,-32(s0)
     dc0:	fdc42703          	lw	a4,-36(s0)
     dc4:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     dc6:	fe043783          	ld	a5,-32(s0)
     dca:	07c1                	addi	a5,a5,16
     dcc:	853e                	mv	a0,a5
     dce:	00000097          	auipc	ra,0x0
     dd2:	e7a080e7          	jalr	-390(ra) # c48 <free>
  return freep;
     dd6:	00001797          	auipc	a5,0x1
     dda:	eaa78793          	addi	a5,a5,-342 # 1c80 <freep>
     dde:	639c                	ld	a5,0(a5)
}
     de0:	853e                	mv	a0,a5
     de2:	70a2                	ld	ra,40(sp)
     de4:	7402                	ld	s0,32(sp)
     de6:	6145                	addi	sp,sp,48
     de8:	8082                	ret

0000000000000dea <malloc>:

void*
malloc(uint nbytes)
{
     dea:	7139                	addi	sp,sp,-64
     dec:	fc06                	sd	ra,56(sp)
     dee:	f822                	sd	s0,48(sp)
     df0:	0080                	addi	s0,sp,64
     df2:	87aa                	mv	a5,a0
     df4:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     df8:	fcc46783          	lwu	a5,-52(s0)
     dfc:	07bd                	addi	a5,a5,15
     dfe:	8391                	srli	a5,a5,0x4
     e00:	2781                	sext.w	a5,a5
     e02:	2785                	addiw	a5,a5,1
     e04:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     e08:	00001797          	auipc	a5,0x1
     e0c:	e7878793          	addi	a5,a5,-392 # 1c80 <freep>
     e10:	639c                	ld	a5,0(a5)
     e12:	fef43023          	sd	a5,-32(s0)
     e16:	fe043783          	ld	a5,-32(s0)
     e1a:	ef95                	bnez	a5,e56 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     e1c:	00001797          	auipc	a5,0x1
     e20:	e5478793          	addi	a5,a5,-428 # 1c70 <base>
     e24:	fef43023          	sd	a5,-32(s0)
     e28:	00001797          	auipc	a5,0x1
     e2c:	e5878793          	addi	a5,a5,-424 # 1c80 <freep>
     e30:	fe043703          	ld	a4,-32(s0)
     e34:	e398                	sd	a4,0(a5)
     e36:	00001797          	auipc	a5,0x1
     e3a:	e4a78793          	addi	a5,a5,-438 # 1c80 <freep>
     e3e:	6398                	ld	a4,0(a5)
     e40:	00001797          	auipc	a5,0x1
     e44:	e3078793          	addi	a5,a5,-464 # 1c70 <base>
     e48:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     e4a:	00001797          	auipc	a5,0x1
     e4e:	e2678793          	addi	a5,a5,-474 # 1c70 <base>
     e52:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     e56:	fe043783          	ld	a5,-32(s0)
     e5a:	639c                	ld	a5,0(a5)
     e5c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     e60:	fe843783          	ld	a5,-24(s0)
     e64:	4798                	lw	a4,8(a5)
     e66:	fdc42783          	lw	a5,-36(s0)
     e6a:	2781                	sext.w	a5,a5
     e6c:	06f76863          	bltu	a4,a5,edc <malloc+0xf2>
      if(p->s.size == nunits)
     e70:	fe843783          	ld	a5,-24(s0)
     e74:	4798                	lw	a4,8(a5)
     e76:	fdc42783          	lw	a5,-36(s0)
     e7a:	2781                	sext.w	a5,a5
     e7c:	00e79963          	bne	a5,a4,e8e <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     e80:	fe843783          	ld	a5,-24(s0)
     e84:	6398                	ld	a4,0(a5)
     e86:	fe043783          	ld	a5,-32(s0)
     e8a:	e398                	sd	a4,0(a5)
     e8c:	a82d                	j	ec6 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     e8e:	fe843783          	ld	a5,-24(s0)
     e92:	4798                	lw	a4,8(a5)
     e94:	fdc42783          	lw	a5,-36(s0)
     e98:	40f707bb          	subw	a5,a4,a5
     e9c:	0007871b          	sext.w	a4,a5
     ea0:	fe843783          	ld	a5,-24(s0)
     ea4:	c798                	sw	a4,8(a5)
        p += p->s.size;
     ea6:	fe843783          	ld	a5,-24(s0)
     eaa:	479c                	lw	a5,8(a5)
     eac:	1782                	slli	a5,a5,0x20
     eae:	9381                	srli	a5,a5,0x20
     eb0:	0792                	slli	a5,a5,0x4
     eb2:	fe843703          	ld	a4,-24(s0)
     eb6:	97ba                	add	a5,a5,a4
     eb8:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     ebc:	fe843783          	ld	a5,-24(s0)
     ec0:	fdc42703          	lw	a4,-36(s0)
     ec4:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     ec6:	00001797          	auipc	a5,0x1
     eca:	dba78793          	addi	a5,a5,-582 # 1c80 <freep>
     ece:	fe043703          	ld	a4,-32(s0)
     ed2:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     ed4:	fe843783          	ld	a5,-24(s0)
     ed8:	07c1                	addi	a5,a5,16
     eda:	a091                	j	f1e <malloc+0x134>
    }
    if(p == freep)
     edc:	00001797          	auipc	a5,0x1
     ee0:	da478793          	addi	a5,a5,-604 # 1c80 <freep>
     ee4:	639c                	ld	a5,0(a5)
     ee6:	fe843703          	ld	a4,-24(s0)
     eea:	02f71063          	bne	a4,a5,f0a <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     eee:	fdc42783          	lw	a5,-36(s0)
     ef2:	853e                	mv	a0,a5
     ef4:	00000097          	auipc	ra,0x0
     ef8:	e76080e7          	jalr	-394(ra) # d6a <morecore>
     efc:	fea43423          	sd	a0,-24(s0)
     f00:	fe843783          	ld	a5,-24(s0)
     f04:	e399                	bnez	a5,f0a <malloc+0x120>
        return 0;
     f06:	4781                	li	a5,0
     f08:	a819                	j	f1e <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f0a:	fe843783          	ld	a5,-24(s0)
     f0e:	fef43023          	sd	a5,-32(s0)
     f12:	fe843783          	ld	a5,-24(s0)
     f16:	639c                	ld	a5,0(a5)
     f18:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     f1c:	b791                	j	e60 <malloc+0x76>
  }
}
     f1e:	853e                	mv	a0,a5
     f20:	70e2                	ld	ra,56(sp)
     f22:	7442                	ld	s0,48(sp)
     f24:	6121                	addi	sp,sp,64
     f26:	8082                	ret

0000000000000f28 <setjmp>:
     f28:	e100                	sd	s0,0(a0)
     f2a:	e504                	sd	s1,8(a0)
     f2c:	01253823          	sd	s2,16(a0)
     f30:	01353c23          	sd	s3,24(a0)
     f34:	03453023          	sd	s4,32(a0)
     f38:	03553423          	sd	s5,40(a0)
     f3c:	03653823          	sd	s6,48(a0)
     f40:	03753c23          	sd	s7,56(a0)
     f44:	05853023          	sd	s8,64(a0)
     f48:	05953423          	sd	s9,72(a0)
     f4c:	05a53823          	sd	s10,80(a0)
     f50:	05b53c23          	sd	s11,88(a0)
     f54:	06153023          	sd	ra,96(a0)
     f58:	06253423          	sd	sp,104(a0)
     f5c:	4501                	li	a0,0
     f5e:	8082                	ret

0000000000000f60 <longjmp>:
     f60:	6100                	ld	s0,0(a0)
     f62:	6504                	ld	s1,8(a0)
     f64:	01053903          	ld	s2,16(a0)
     f68:	01853983          	ld	s3,24(a0)
     f6c:	02053a03          	ld	s4,32(a0)
     f70:	02853a83          	ld	s5,40(a0)
     f74:	03053b03          	ld	s6,48(a0)
     f78:	03853b83          	ld	s7,56(a0)
     f7c:	04053c03          	ld	s8,64(a0)
     f80:	04853c83          	ld	s9,72(a0)
     f84:	05053d03          	ld	s10,80(a0)
     f88:	05853d83          	ld	s11,88(a0)
     f8c:	06053083          	ld	ra,96(a0)
     f90:	06853103          	ld	sp,104(a0)
     f94:	c199                	beqz	a1,f9a <longjmp_1>
     f96:	852e                	mv	a0,a1
     f98:	8082                	ret

0000000000000f9a <longjmp_1>:
     f9a:	4505                	li	a0,1
     f9c:	8082                	ret

0000000000000f9e <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     f9e:	1101                	addi	sp,sp,-32
     fa0:	ec22                	sd	s0,24(sp)
     fa2:	1000                	addi	s0,sp,32
     fa4:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     fa8:	fe843783          	ld	a5,-24(s0)
     fac:	639c                	ld	a5,0(a5)
     fae:	fe843703          	ld	a4,-24(s0)
     fb2:	40f707b3          	sub	a5,a4,a5
     fb6:	0017b793          	seqz	a5,a5
     fba:	0ff7f793          	andi	a5,a5,255
     fbe:	2781                	sext.w	a5,a5
}
     fc0:	853e                	mv	a0,a5
     fc2:	6462                	ld	s0,24(sp)
     fc4:	6105                	addi	sp,sp,32
     fc6:	8082                	ret

0000000000000fc8 <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
     fc8:	715d                	addi	sp,sp,-80
     fca:	e4a2                	sd	s0,72(sp)
     fcc:	e0a6                	sd	s1,64(sp)
     fce:	0880                	addi	s0,sp,80
     fd0:	84aa                	mv	s1,a0
    int sleep_time = -1;
     fd2:	57fd                	li	a5,-1
     fd4:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
     fd8:	689c                	ld	a5,16(s1)
     fda:	639c                	ld	a5,0(a5)
     fdc:	fcf43c23          	sd	a5,-40(s0)
     fe0:	fd843783          	ld	a5,-40(s0)
     fe4:	17e1                	addi	a5,a5,-8
     fe6:	fef43023          	sd	a5,-32(s0)
     fea:	a0a9                	j	1034 <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
     fec:	fec42783          	lw	a5,-20(s0)
     ff0:	2781                	sext.w	a5,a5
     ff2:	0007cf63          	bltz	a5,1010 <fill_sparse+0x48>
     ff6:	fe043783          	ld	a5,-32(s0)
     ffa:	4f98                	lw	a4,24(a5)
     ffc:	409c                	lw	a5,0(s1)
     ffe:	40f707bb          	subw	a5,a4,a5
    1002:	0007871b          	sext.w	a4,a5
    1006:	fec42783          	lw	a5,-20(s0)
    100a:	2781                	sext.w	a5,a5
    100c:	00f75a63          	bge	a4,a5,1020 <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
    1010:	fe043783          	ld	a5,-32(s0)
    1014:	4f98                	lw	a4,24(a5)
    1016:	409c                	lw	a5,0(s1)
    1018:	40f707bb          	subw	a5,a4,a5
    101c:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1020:	fe043783          	ld	a5,-32(s0)
    1024:	679c                	ld	a5,8(a5)
    1026:	fcf43823          	sd	a5,-48(s0)
    102a:	fd043783          	ld	a5,-48(s0)
    102e:	17e1                	addi	a5,a5,-8
    1030:	fef43023          	sd	a5,-32(s0)
    1034:	fe043783          	ld	a5,-32(s0)
    1038:	00878713          	addi	a4,a5,8
    103c:	689c                	ld	a5,16(s1)
    103e:	faf717e3          	bne	a4,a5,fec <fill_sparse+0x24>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = args.run_queue;
    1042:	649c                	ld	a5,8(s1)
    1044:	faf43823          	sd	a5,-80(s0)
    r.allocated_time = sleep_time;
    1048:	fec42783          	lw	a5,-20(s0)
    104c:	faf42c23          	sw	a5,-72(s0)
    return r;    
    1050:	fb043783          	ld	a5,-80(s0)
    1054:	fcf43023          	sd	a5,-64(s0)
    1058:	fb843783          	ld	a5,-72(s0)
    105c:	fcf43423          	sd	a5,-56(s0)
    1060:	4701                	li	a4,0
    1062:	fc043703          	ld	a4,-64(s0)
    1066:	4781                	li	a5,0
    1068:	fc843783          	ld	a5,-56(s0)
    106c:	863a                	mv	a2,a4
    106e:	86be                	mv	a3,a5
    1070:	8732                	mv	a4,a2
    1072:	87b6                	mv	a5,a3
}
    1074:	853a                	mv	a0,a4
    1076:	85be                	mv	a1,a5
    1078:	6426                	ld	s0,72(sp)
    107a:	6486                	ld	s1,64(sp)
    107c:	6161                	addi	sp,sp,80
    107e:	8082                	ret

0000000000001080 <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    1080:	715d                	addi	sp,sp,-80
    1082:	e4a2                	sd	s0,72(sp)
    1084:	e0a6                	sd	s1,64(sp)
    1086:	0880                	addi	s0,sp,80
    1088:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
    108a:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    108e:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1092:	649c                	ld	a5,8(s1)
    1094:	639c                	ld	a5,0(a5)
    1096:	fcf43c23          	sd	a5,-40(s0)
    109a:	fd843783          	ld	a5,-40(s0)
    109e:	fd878793          	addi	a5,a5,-40
    10a2:	fef43023          	sd	a5,-32(s0)
    10a6:	a81d                	j	10dc <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
    10a8:	fe843783          	ld	a5,-24(s0)
    10ac:	cb89                	beqz	a5,10be <schedule_default+0x3e>
    10ae:	fe043783          	ld	a5,-32(s0)
    10b2:	5fd8                	lw	a4,60(a5)
    10b4:	fe843783          	ld	a5,-24(s0)
    10b8:	5fdc                	lw	a5,60(a5)
    10ba:	00f75663          	bge	a4,a5,10c6 <schedule_default+0x46>
            thread_with_smallest_id = th;
    10be:	fe043783          	ld	a5,-32(s0)
    10c2:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    10c6:	fe043783          	ld	a5,-32(s0)
    10ca:	779c                	ld	a5,40(a5)
    10cc:	fcf43823          	sd	a5,-48(s0)
    10d0:	fd043783          	ld	a5,-48(s0)
    10d4:	fd878793          	addi	a5,a5,-40
    10d8:	fef43023          	sd	a5,-32(s0)
    10dc:	fe043783          	ld	a5,-32(s0)
    10e0:	02878713          	addi	a4,a5,40
    10e4:	649c                	ld	a5,8(s1)
    10e6:	fcf711e3          	bne	a4,a5,10a8 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
    10ea:	fe843783          	ld	a5,-24(s0)
    10ee:	cf89                	beqz	a5,1108 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
    10f0:	fe843783          	ld	a5,-24(s0)
    10f4:	02878793          	addi	a5,a5,40
    10f8:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
    10fc:	fe843783          	ld	a5,-24(s0)
    1100:	4fbc                	lw	a5,88(a5)
    1102:	faf42c23          	sw	a5,-72(s0)
    1106:	a039                	j	1114 <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1108:	649c                	ld	a5,8(s1)
    110a:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
    110e:	4785                	li	a5,1
    1110:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
    1114:	fb043783          	ld	a5,-80(s0)
    1118:	fcf43023          	sd	a5,-64(s0)
    111c:	fb843783          	ld	a5,-72(s0)
    1120:	fcf43423          	sd	a5,-56(s0)
    1124:	4701                	li	a4,0
    1126:	fc043703          	ld	a4,-64(s0)
    112a:	4781                	li	a5,0
    112c:	fc843783          	ld	a5,-56(s0)
    1130:	863a                	mv	a2,a4
    1132:	86be                	mv	a3,a5
    1134:	8732                	mv	a4,a2
    1136:	87b6                	mv	a5,a3
}
    1138:	853a                	mv	a0,a4
    113a:	85be                	mv	a1,a5
    113c:	6426                	ld	s0,72(sp)
    113e:	6486                	ld	s1,64(sp)
    1140:	6161                	addi	sp,sp,80
    1142:	8082                	ret

0000000000001144 <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
    1144:	7135                	addi	sp,sp,-160
    1146:	ed06                	sd	ra,152(sp)
    1148:	e922                	sd	s0,144(sp)
    114a:	e526                	sd	s1,136(sp)
    114c:	e14a                	sd	s2,128(sp)
    114e:	fcce                	sd	s3,120(sp)
    1150:	1100                	addi	s0,sp,160
    1152:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
    1154:	649c                	ld	a5,8(s1)
    1156:	853e                	mv	a0,a5
    1158:	00000097          	auipc	ra,0x0
    115c:	e46080e7          	jalr	-442(ra) # f9e <list_empty>
    1160:	87aa                	mv	a5,a0
    1162:	cb85                	beqz	a5,1192 <schedule_wrr+0x4e>
        return fill_sparse(args);
    1164:	609c                	ld	a5,0(s1)
    1166:	f6f43023          	sd	a5,-160(s0)
    116a:	649c                	ld	a5,8(s1)
    116c:	f6f43423          	sd	a5,-152(s0)
    1170:	689c                	ld	a5,16(s1)
    1172:	f6f43823          	sd	a5,-144(s0)
    1176:	f6040793          	addi	a5,s0,-160
    117a:	853e                	mv	a0,a5
    117c:	00000097          	auipc	ra,0x0
    1180:	e4c080e7          	jalr	-436(ra) # fc8 <fill_sparse>
    1184:	872a                	mv	a4,a0
    1186:	87ae                	mv	a5,a1
    1188:	f8e43823          	sd	a4,-112(s0)
    118c:	f8f43c23          	sd	a5,-104(s0)
    1190:	a0c9                	j	1252 <schedule_wrr+0x10e>

    struct thread *process_thread = NULL;
    1192:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1196:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    119a:	649c                	ld	a5,8(s1)
    119c:	639c                	ld	a5,0(a5)
    119e:	faf43823          	sd	a5,-80(s0)
    11a2:	fb043783          	ld	a5,-80(s0)
    11a6:	fd878793          	addi	a5,a5,-40
    11aa:	fcf43023          	sd	a5,-64(s0)
    11ae:	a025                	j	11d6 <schedule_wrr+0x92>
        if (process_thread == NULL) {
    11b0:	fc843783          	ld	a5,-56(s0)
    11b4:	e791                	bnez	a5,11c0 <schedule_wrr+0x7c>
            process_thread = th;
    11b6:	fc043783          	ld	a5,-64(s0)
    11ba:	fcf43423          	sd	a5,-56(s0)
            break;
    11be:	a01d                	j	11e4 <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
    11c0:	fc043783          	ld	a5,-64(s0)
    11c4:	779c                	ld	a5,40(a5)
    11c6:	faf43423          	sd	a5,-88(s0)
    11ca:	fa843783          	ld	a5,-88(s0)
    11ce:	fd878793          	addi	a5,a5,-40
    11d2:	fcf43023          	sd	a5,-64(s0)
    11d6:	fc043783          	ld	a5,-64(s0)
    11da:	02878713          	addi	a4,a5,40
    11de:	649c                	ld	a5,8(s1)
    11e0:	fcf718e3          	bne	a4,a5,11b0 <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
    11e4:	40dc                	lw	a5,4(s1)
    11e6:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
    11ea:	fc843783          	ld	a5,-56(s0)
    11ee:	4fbc                	lw	a5,88(a5)
    11f0:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    11f4:	fc843783          	ld	a5,-56(s0)
    11f8:	4fb4                	lw	a3,88(a5)
    11fa:	fc843783          	ld	a5,-56(s0)
    11fe:	47bc                	lw	a5,72(a5)
    1200:	fa442703          	lw	a4,-92(s0)
    1204:	02f707bb          	mulw	a5,a4,a5
    1208:	2781                	sext.w	a5,a5
    120a:	8736                	mv	a4,a3
    120c:	00e7dc63          	bge	a5,a4,1224 <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
    1210:	fc843783          	ld	a5,-56(s0)
    1214:	47bc                	lw	a5,72(a5)
    1216:	fa442703          	lw	a4,-92(s0)
    121a:	02f707bb          	mulw	a5,a4,a5
    121e:	faf42e23          	sw	a5,-68(s0)
    1222:	a031                	j	122e <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    1224:	fc843783          	ld	a5,-56(s0)
    1228:	4fbc                	lw	a5,88(a5)
    122a:	faf42e23          	sw	a5,-68(s0)
    }
    
    struct threads_sched_result r;
    r.scheduled_thread_list_member = &process_thread->thread_list;
    122e:	fc843783          	ld	a5,-56(s0)
    1232:	02878793          	addi	a5,a5,40
    1236:	f8f43023          	sd	a5,-128(s0)
    r.allocated_time = executing_time;
    123a:	fbc42783          	lw	a5,-68(s0)
    123e:	f8f42423          	sw	a5,-120(s0)
    return r;
    1242:	f8043783          	ld	a5,-128(s0)
    1246:	f8f43823          	sd	a5,-112(s0)
    124a:	f8843783          	ld	a5,-120(s0)
    124e:	f8f43c23          	sd	a5,-104(s0)
    1252:	4701                	li	a4,0
    1254:	f9043703          	ld	a4,-112(s0)
    1258:	4781                	li	a5,0
    125a:	f9843783          	ld	a5,-104(s0)
    125e:	893a                	mv	s2,a4
    1260:	89be                	mv	s3,a5
    1262:	874a                	mv	a4,s2
    1264:	87ce                	mv	a5,s3
}
    1266:	853a                	mv	a0,a4
    1268:	85be                	mv	a1,a5
    126a:	60ea                	ld	ra,152(sp)
    126c:	644a                	ld	s0,144(sp)
    126e:	64aa                	ld	s1,136(sp)
    1270:	690a                	ld	s2,128(sp)
    1272:	79e6                	ld	s3,120(sp)
    1274:	610d                	addi	sp,sp,160
    1276:	8082                	ret

0000000000001278 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    1278:	7131                	addi	sp,sp,-192
    127a:	fd06                	sd	ra,184(sp)
    127c:	f922                	sd	s0,176(sp)
    127e:	f526                	sd	s1,168(sp)
    1280:	f14a                	sd	s2,160(sp)
    1282:	ed4e                	sd	s3,152(sp)
    1284:	0180                	addi	s0,sp,192
    1286:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    1288:	649c                	ld	a5,8(s1)
    128a:	853e                	mv	a0,a5
    128c:	00000097          	auipc	ra,0x0
    1290:	d12080e7          	jalr	-750(ra) # f9e <list_empty>
    1294:	87aa                	mv	a5,a0
    1296:	cb85                	beqz	a5,12c6 <schedule_sjf+0x4e>
        return fill_sparse(args);
    1298:	609c                	ld	a5,0(s1)
    129a:	f4f43023          	sd	a5,-192(s0)
    129e:	649c                	ld	a5,8(s1)
    12a0:	f4f43423          	sd	a5,-184(s0)
    12a4:	689c                	ld	a5,16(s1)
    12a6:	f4f43823          	sd	a5,-176(s0)
    12aa:	f4040793          	addi	a5,s0,-192
    12ae:	853e                	mv	a0,a5
    12b0:	00000097          	auipc	ra,0x0
    12b4:	d18080e7          	jalr	-744(ra) # fc8 <fill_sparse>
    12b8:	872a                	mv	a4,a0
    12ba:	87ae                	mv	a5,a1
    12bc:	f6e43c23          	sd	a4,-136(s0)
    12c0:	f8f43023          	sd	a5,-128(s0)
    12c4:	aa49                	j	1456 <schedule_sjf+0x1de>

    int current_time = args.current_time;
    12c6:	409c                	lw	a5,0(s1)
    12c8:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    12cc:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    12d0:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    12d4:	649c                	ld	a5,8(s1)
    12d6:	639c                	ld	a5,0(a5)
    12d8:	faf43423          	sd	a5,-88(s0)
    12dc:	fa843783          	ld	a5,-88(s0)
    12e0:	fd878793          	addi	a5,a5,-40
    12e4:	fcf43023          	sd	a5,-64(s0)
    12e8:	a085                	j	1348 <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    12ea:	fc843783          	ld	a5,-56(s0)
    12ee:	cb89                	beqz	a5,1300 <schedule_sjf+0x88>
    12f0:	fc043783          	ld	a5,-64(s0)
    12f4:	4fb8                	lw	a4,88(a5)
    12f6:	fc843783          	ld	a5,-56(s0)
    12fa:	4fbc                	lw	a5,88(a5)
    12fc:	00f75763          	bge	a4,a5,130a <schedule_sjf+0x92>
            shortest_thread = th;
    1300:	fc043783          	ld	a5,-64(s0)
    1304:	fcf43423          	sd	a5,-56(s0)
    1308:	a02d                	j	1332 <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    130a:	fc043783          	ld	a5,-64(s0)
    130e:	4fb8                	lw	a4,88(a5)
    1310:	fc843783          	ld	a5,-56(s0)
    1314:	4fbc                	lw	a5,88(a5)
    1316:	00f71e63          	bne	a4,a5,1332 <schedule_sjf+0xba>
    131a:	fc043783          	ld	a5,-64(s0)
    131e:	5fd8                	lw	a4,60(a5)
    1320:	fc843783          	ld	a5,-56(s0)
    1324:	5fdc                	lw	a5,60(a5)
    1326:	00f75663          	bge	a4,a5,1332 <schedule_sjf+0xba>
            shortest_thread = th;
    132a:	fc043783          	ld	a5,-64(s0)
    132e:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1332:	fc043783          	ld	a5,-64(s0)
    1336:	779c                	ld	a5,40(a5)
    1338:	f8f43423          	sd	a5,-120(s0)
    133c:	f8843783          	ld	a5,-120(s0)
    1340:	fd878793          	addi	a5,a5,-40
    1344:	fcf43023          	sd	a5,-64(s0)
    1348:	fc043783          	ld	a5,-64(s0)
    134c:	02878713          	addi	a4,a5,40
    1350:	649c                	ld	a5,8(s1)
    1352:	f8f71ce3          	bne	a4,a5,12ea <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    1356:	fc843783          	ld	a5,-56(s0)
    135a:	4fbc                	lw	a5,88(a5)
    135c:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1360:	689c                	ld	a5,16(s1)
    1362:	639c                	ld	a5,0(a5)
    1364:	faf43023          	sd	a5,-96(s0)
    1368:	fa043783          	ld	a5,-96(s0)
    136c:	17e1                	addi	a5,a5,-8
    136e:	faf43c23          	sd	a5,-72(s0)
    1372:	a84d                	j	1424 <schedule_sjf+0x1ac>
        int interval = cur->release_time - current_time;
    1374:	fb843783          	ld	a5,-72(s0)
    1378:	4f98                	lw	a4,24(a5)
    137a:	fb042783          	lw	a5,-80(s0)
    137e:	40f707bb          	subw	a5,a4,a5
    1382:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    1386:	f9c42703          	lw	a4,-100(s0)
    138a:	fb442783          	lw	a5,-76(s0)
    138e:	2701                	sext.w	a4,a4
    1390:	2781                	sext.w	a5,a5
    1392:	06e7c863          	blt	a5,a4,1402 <schedule_sjf+0x18a>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1396:	fc843783          	ld	a5,-56(s0)
    139a:	4fbc                	lw	a5,88(a5)
    139c:	fb042703          	lw	a4,-80(s0)
    13a0:	9fb9                	addw	a5,a5,a4
    13a2:	0007871b          	sext.w	a4,a5
    13a6:	fb843783          	ld	a5,-72(s0)
    13aa:	4f9c                	lw	a5,24(a5)
    13ac:	04f74d63          	blt	a4,a5,1406 <schedule_sjf+0x18e>
        int remaining_time = shortest_thread->remaining_time - interval;
    13b0:	fc843783          	ld	a5,-56(s0)
    13b4:	4fb8                	lw	a4,88(a5)
    13b6:	f9c42783          	lw	a5,-100(s0)
    13ba:	40f707bb          	subw	a5,a4,a5
    13be:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    13c2:	fb843783          	ld	a5,-72(s0)
    13c6:	639c                	ld	a5,0(a5)
    13c8:	43f8                	lw	a4,68(a5)
    13ca:	f9842783          	lw	a5,-104(s0)
    13ce:	2781                	sext.w	a5,a5
    13d0:	02e7cd63          	blt	a5,a4,140a <schedule_sjf+0x192>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    13d4:	fb843783          	ld	a5,-72(s0)
    13d8:	639c                	ld	a5,0(a5)
    13da:	43f8                	lw	a4,68(a5)
    13dc:	f9842783          	lw	a5,-104(s0)
    13e0:	2781                	sext.w	a5,a5
    13e2:	00e79b63          	bne	a5,a4,13f8 <schedule_sjf+0x180>
    13e6:	fc843783          	ld	a5,-56(s0)
    13ea:	5fd8                	lw	a4,60(a5)
    13ec:	fb843783          	ld	a5,-72(s0)
    13f0:	639c                	ld	a5,0(a5)
    13f2:	5fdc                	lw	a5,60(a5)
    13f4:	00f74d63          	blt	a4,a5,140e <schedule_sjf+0x196>
        executing_time = interval;
    13f8:	f9c42783          	lw	a5,-100(s0)
    13fc:	faf42a23          	sw	a5,-76(s0)
    1400:	a801                	j	1410 <schedule_sjf+0x198>
        if (interval > executing_time) continue;
    1402:	0001                	nop
    1404:	a031                	j	1410 <schedule_sjf+0x198>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1406:	0001                	nop
    1408:	a021                	j	1410 <schedule_sjf+0x198>
        if (remaining_time < cur->thrd->processing_time) continue;
    140a:	0001                	nop
    140c:	a011                	j	1410 <schedule_sjf+0x198>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    140e:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1410:	fb843783          	ld	a5,-72(s0)
    1414:	679c                	ld	a5,8(a5)
    1416:	f8f43823          	sd	a5,-112(s0)
    141a:	f9043783          	ld	a5,-112(s0)
    141e:	17e1                	addi	a5,a5,-8
    1420:	faf43c23          	sd	a5,-72(s0)
    1424:	fb843783          	ld	a5,-72(s0)
    1428:	00878713          	addi	a4,a5,8
    142c:	689c                	ld	a5,16(s1)
    142e:	f4f713e3          	bne	a4,a5,1374 <schedule_sjf+0xfc>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &shortest_thread->thread_list;
    1432:	fc843783          	ld	a5,-56(s0)
    1436:	02878793          	addi	a5,a5,40
    143a:	f6f43423          	sd	a5,-152(s0)
    r.allocated_time = executing_time;
    143e:	fb442783          	lw	a5,-76(s0)
    1442:	f6f42823          	sw	a5,-144(s0)
    return r;
    1446:	f6843783          	ld	a5,-152(s0)
    144a:	f6f43c23          	sd	a5,-136(s0)
    144e:	f7043783          	ld	a5,-144(s0)
    1452:	f8f43023          	sd	a5,-128(s0)
    1456:	4701                	li	a4,0
    1458:	f7843703          	ld	a4,-136(s0)
    145c:	4781                	li	a5,0
    145e:	f8043783          	ld	a5,-128(s0)
    1462:	893a                	mv	s2,a4
    1464:	89be                	mv	s3,a5
    1466:	874a                	mv	a4,s2
    1468:	87ce                	mv	a5,s3
}
    146a:	853a                	mv	a0,a4
    146c:	85be                	mv	a1,a5
    146e:	70ea                	ld	ra,184(sp)
    1470:	744a                	ld	s0,176(sp)
    1472:	74aa                	ld	s1,168(sp)
    1474:	790a                	ld	s2,160(sp)
    1476:	69ea                	ld	s3,152(sp)
    1478:	6129                	addi	sp,sp,192
    147a:	8082                	ret

000000000000147c <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    147c:	7115                	addi	sp,sp,-224
    147e:	ed86                	sd	ra,216(sp)
    1480:	e9a2                	sd	s0,208(sp)
    1482:	e5a6                	sd	s1,200(sp)
    1484:	e1ca                	sd	s2,192(sp)
    1486:	fd4e                	sd	s3,184(sp)
    1488:	1180                	addi	s0,sp,224
    148a:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    148c:	649c                	ld	a5,8(s1)
    148e:	853e                	mv	a0,a5
    1490:	00000097          	auipc	ra,0x0
    1494:	b0e080e7          	jalr	-1266(ra) # f9e <list_empty>
    1498:	87aa                	mv	a5,a0
    149a:	cb85                	beqz	a5,14ca <schedule_lst+0x4e>
        return fill_sparse(args);
    149c:	609c                	ld	a5,0(s1)
    149e:	f2f43023          	sd	a5,-224(s0)
    14a2:	649c                	ld	a5,8(s1)
    14a4:	f2f43423          	sd	a5,-216(s0)
    14a8:	689c                	ld	a5,16(s1)
    14aa:	f2f43823          	sd	a5,-208(s0)
    14ae:	f2040793          	addi	a5,s0,-224
    14b2:	853e                	mv	a0,a5
    14b4:	00000097          	auipc	ra,0x0
    14b8:	b14080e7          	jalr	-1260(ra) # fc8 <fill_sparse>
    14bc:	872a                	mv	a4,a0
    14be:	87ae                	mv	a5,a1
    14c0:	f6e43023          	sd	a4,-160(s0)
    14c4:	f6f43423          	sd	a5,-152(s0)
    14c8:	ac41                	j	1758 <schedule_lst+0x2dc>

    int current_time = args.current_time;
    14ca:	409c                	lw	a5,0(s1)
    14cc:	faf42623          	sw	a5,-84(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    14d0:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    14d4:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    14d8:	649c                	ld	a5,8(s1)
    14da:	639c                	ld	a5,0(a5)
    14dc:	faf43023          	sd	a5,-96(s0)
    14e0:	fa043783          	ld	a5,-96(s0)
    14e4:	fd878793          	addi	a5,a5,-40
    14e8:	fcf43023          	sd	a5,-64(s0)
    14ec:	a239                	j	15fa <schedule_lst+0x17e>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    14ee:	fc043783          	ld	a5,-64(s0)
    14f2:	4ff8                	lw	a4,92(a5)
    14f4:	fac42783          	lw	a5,-84(s0)
    14f8:	40f707bb          	subw	a5,a4,a5
    14fc:	0007871b          	sext.w	a4,a5
    1500:	fc043783          	ld	a5,-64(s0)
    1504:	4fbc                	lw	a5,88(a5)
    1506:	40f707bb          	subw	a5,a4,a5
    150a:	f6f42e23          	sw	a5,-132(s0)
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    150e:	fc843783          	ld	a5,-56(s0)
    1512:	c38d                	beqz	a5,1534 <schedule_lst+0xb8>
    1514:	fc843783          	ld	a5,-56(s0)
    1518:	4ff8                	lw	a4,92(a5)
    151a:	fac42783          	lw	a5,-84(s0)
    151e:	40f707bb          	subw	a5,a4,a5
    1522:	0007871b          	sext.w	a4,a5
    1526:	fc843783          	ld	a5,-56(s0)
    152a:	4fbc                	lw	a5,88(a5)
    152c:	40f707bb          	subw	a5,a4,a5
    1530:	2781                	sext.w	a5,a5
    1532:	a011                	j	1536 <schedule_lst+0xba>
    1534:	4781                	li	a5,0
    1536:	f6f42c23          	sw	a5,-136(s0)
        if (least_slack_thread == NULL) {
    153a:	fc843783          	ld	a5,-56(s0)
    153e:	e791                	bnez	a5,154a <schedule_lst+0xce>
            least_slack_thread = th;
    1540:	fc043783          	ld	a5,-64(s0)
    1544:	fcf43423          	sd	a5,-56(s0)
    1548:	a871                	j	15e4 <schedule_lst+0x168>
        }
        else if (least_slack_thread->current_deadline <= current_time) { // missing the deadline
    154a:	fc843783          	ld	a5,-56(s0)
    154e:	4ff8                	lw	a4,92(a5)
    1550:	fac42783          	lw	a5,-84(s0)
    1554:	2781                	sext.w	a5,a5
    1556:	02e7c763          	blt	a5,a4,1584 <schedule_lst+0x108>
            if (th->current_deadline > current_time) continue;
    155a:	fc043783          	ld	a5,-64(s0)
    155e:	4ff8                	lw	a4,92(a5)
    1560:	fac42783          	lw	a5,-84(s0)
    1564:	2781                	sext.w	a5,a5
    1566:	06e7ce63          	blt	a5,a4,15e2 <schedule_lst+0x166>
            if (th->ID < least_slack_thread->ID) {
    156a:	fc043783          	ld	a5,-64(s0)
    156e:	5fd8                	lw	a4,60(a5)
    1570:	fc843783          	ld	a5,-56(s0)
    1574:	5fdc                	lw	a5,60(a5)
    1576:	06f75763          	bge	a4,a5,15e4 <schedule_lst+0x168>
                least_slack_thread = th;
    157a:	fc043783          	ld	a5,-64(s0)
    157e:	fcf43423          	sd	a5,-56(s0)
    1582:	a08d                	j	15e4 <schedule_lst+0x168>
            }
        }
        else if (th->current_deadline <= current_time) {
    1584:	fc043783          	ld	a5,-64(s0)
    1588:	4ff8                	lw	a4,92(a5)
    158a:	fac42783          	lw	a5,-84(s0)
    158e:	2781                	sext.w	a5,a5
    1590:	00e7c763          	blt	a5,a4,159e <schedule_lst+0x122>
            least_slack_thread = th;
    1594:	fc043783          	ld	a5,-64(s0)
    1598:	fcf43423          	sd	a5,-56(s0)
    159c:	a0a1                	j	15e4 <schedule_lst+0x168>
        }
        else if (slack_time < least_slack_time) {
    159e:	f7c42703          	lw	a4,-132(s0)
    15a2:	f7842783          	lw	a5,-136(s0)
    15a6:	2701                	sext.w	a4,a4
    15a8:	2781                	sext.w	a5,a5
    15aa:	00f75763          	bge	a4,a5,15b8 <schedule_lst+0x13c>
            least_slack_thread = th;
    15ae:	fc043783          	ld	a5,-64(s0)
    15b2:	fcf43423          	sd	a5,-56(s0)
    15b6:	a03d                	j	15e4 <schedule_lst+0x168>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    15b8:	f7c42703          	lw	a4,-132(s0)
    15bc:	f7842783          	lw	a5,-136(s0)
    15c0:	2701                	sext.w	a4,a4
    15c2:	2781                	sext.w	a5,a5
    15c4:	02f71063          	bne	a4,a5,15e4 <schedule_lst+0x168>
    15c8:	fc043783          	ld	a5,-64(s0)
    15cc:	5fd8                	lw	a4,60(a5)
    15ce:	fc843783          	ld	a5,-56(s0)
    15d2:	5fdc                	lw	a5,60(a5)
    15d4:	00f75863          	bge	a4,a5,15e4 <schedule_lst+0x168>
            least_slack_thread = th;
    15d8:	fc043783          	ld	a5,-64(s0)
    15dc:	fcf43423          	sd	a5,-56(s0)
    15e0:	a011                	j	15e4 <schedule_lst+0x168>
            if (th->current_deadline > current_time) continue;
    15e2:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    15e4:	fc043783          	ld	a5,-64(s0)
    15e8:	779c                	ld	a5,40(a5)
    15ea:	f6f43823          	sd	a5,-144(s0)
    15ee:	f7043783          	ld	a5,-144(s0)
    15f2:	fd878793          	addi	a5,a5,-40
    15f6:	fcf43023          	sd	a5,-64(s0)
    15fa:	fc043783          	ld	a5,-64(s0)
    15fe:	02878713          	addi	a4,a5,40
    1602:	649c                	ld	a5,8(s1)
    1604:	eef715e3          	bne	a4,a5,14ee <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread->current_deadline <= current_time)
    1608:	fc843783          	ld	a5,-56(s0)
    160c:	4ff8                	lw	a4,92(a5)
    160e:	fac42783          	lw	a5,-84(s0)
    1612:	2781                	sext.w	a5,a5
    1614:	00e7cb63          	blt	a5,a4,162a <schedule_lst+0x1ae>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    1618:	fc843783          	ld	a5,-56(s0)
    161c:	02878793          	addi	a5,a5,40
    1620:	f6f43023          	sd	a5,-160(s0)
    1624:	f6042423          	sw	zero,-152(s0)
    1628:	aa05                	j	1758 <schedule_lst+0x2dc>
    
    int executing_time = least_slack_thread->remaining_time;
    162a:	fc843783          	ld	a5,-56(s0)
    162e:	4fbc                	lw	a5,88(a5)
    1630:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    1634:	fc843783          	ld	a5,-56(s0)
    1638:	4fb4                	lw	a3,88(a5)
    163a:	fc843783          	ld	a5,-56(s0)
    163e:	4ff8                	lw	a4,92(a5)
    1640:	fac42783          	lw	a5,-84(s0)
    1644:	40f707bb          	subw	a5,a4,a5
    1648:	2781                	sext.w	a5,a5
    164a:	8736                	mv	a4,a3
    164c:	00e7db63          	bge	a5,a4,1662 <schedule_lst+0x1e6>
        executing_time = least_slack_thread->current_deadline - current_time;
    1650:	fc843783          	ld	a5,-56(s0)
    1654:	4ff8                	lw	a4,92(a5)
    1656:	fac42783          	lw	a5,-84(s0)
    165a:	40f707bb          	subw	a5,a4,a5
    165e:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    1662:	fc843783          	ld	a5,-56(s0)
    1666:	4ff8                	lw	a4,92(a5)
    1668:	fac42783          	lw	a5,-84(s0)
    166c:	40f707bb          	subw	a5,a4,a5
    1670:	0007871b          	sext.w	a4,a5
    1674:	fc843783          	ld	a5,-56(s0)
    1678:	4fbc                	lw	a5,88(a5)
    167a:	40f707bb          	subw	a5,a4,a5
    167e:	f8f42e23          	sw	a5,-100(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1682:	689c                	ld	a5,16(s1)
    1684:	639c                	ld	a5,0(a5)
    1686:	f8f43823          	sd	a5,-112(s0)
    168a:	f9043783          	ld	a5,-112(s0)
    168e:	17e1                	addi	a5,a5,-8
    1690:	faf43823          	sd	a5,-80(s0)
    1694:	a849                	j	1726 <schedule_lst+0x2aa>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    1696:	fb043783          	ld	a5,-80(s0)
    169a:	639c                	ld	a5,0(a5)
    169c:	47f8                	lw	a4,76(a5)
    169e:	fb043783          	ld	a5,-80(s0)
    16a2:	639c                	ld	a5,0(a5)
    16a4:	43fc                	lw	a5,68(a5)
    16a6:	40f707bb          	subw	a5,a4,a5
    16aa:	f8f42623          	sw	a5,-116(s0)
        int interval = cur->release_time - current_time;
    16ae:	fb043783          	ld	a5,-80(s0)
    16b2:	4f98                	lw	a4,24(a5)
    16b4:	fac42783          	lw	a5,-84(s0)
    16b8:	40f707bb          	subw	a5,a4,a5
    16bc:	f8f42423          	sw	a5,-120(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    16c0:	f8842703          	lw	a4,-120(s0)
    16c4:	fbc42783          	lw	a5,-68(s0)
    16c8:	2701                	sext.w	a4,a4
    16ca:	2781                	sext.w	a5,a5
    16cc:	04e7c063          	blt	a5,a4,170c <schedule_lst+0x290>
    16d0:	f9c42703          	lw	a4,-100(s0)
    16d4:	f8c42783          	lw	a5,-116(s0)
    16d8:	2701                	sext.w	a4,a4
    16da:	2781                	sext.w	a5,a5
    16dc:	02f74863          	blt	a4,a5,170c <schedule_lst+0x290>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    16e0:	f9c42703          	lw	a4,-100(s0)
    16e4:	f8c42783          	lw	a5,-116(s0)
    16e8:	2701                	sext.w	a4,a4
    16ea:	2781                	sext.w	a5,a5
    16ec:	00f71b63          	bne	a4,a5,1702 <schedule_lst+0x286>
    16f0:	fc843783          	ld	a5,-56(s0)
    16f4:	5fd8                	lw	a4,60(a5)
    16f6:	fb043783          	ld	a5,-80(s0)
    16fa:	639c                	ld	a5,0(a5)
    16fc:	5fdc                	lw	a5,60(a5)
    16fe:	00f74963          	blt	a4,a5,1710 <schedule_lst+0x294>
        executing_time = interval;
    1702:	f8842783          	lw	a5,-120(s0)
    1706:	faf42e23          	sw	a5,-68(s0)
    170a:	a021                	j	1712 <schedule_lst+0x296>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    170c:	0001                	nop
    170e:	a011                	j	1712 <schedule_lst+0x296>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    1710:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1712:	fb043783          	ld	a5,-80(s0)
    1716:	679c                	ld	a5,8(a5)
    1718:	f8f43023          	sd	a5,-128(s0)
    171c:	f8043783          	ld	a5,-128(s0)
    1720:	17e1                	addi	a5,a5,-8
    1722:	faf43823          	sd	a5,-80(s0)
    1726:	fb043783          	ld	a5,-80(s0)
    172a:	00878713          	addi	a4,a5,8
    172e:	689c                	ld	a5,16(s1)
    1730:	f6f713e3          	bne	a4,a5,1696 <schedule_lst+0x21a>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &least_slack_thread->thread_list;
    1734:	fc843783          	ld	a5,-56(s0)
    1738:	02878793          	addi	a5,a5,40
    173c:	f4f43823          	sd	a5,-176(s0)
    r.allocated_time = executing_time;
    1740:	fbc42783          	lw	a5,-68(s0)
    1744:	f4f42c23          	sw	a5,-168(s0)
    return r;
    1748:	f5043783          	ld	a5,-176(s0)
    174c:	f6f43023          	sd	a5,-160(s0)
    1750:	f5843783          	ld	a5,-168(s0)
    1754:	f6f43423          	sd	a5,-152(s0)
    1758:	4701                	li	a4,0
    175a:	f6043703          	ld	a4,-160(s0)
    175e:	4781                	li	a5,0
    1760:	f6843783          	ld	a5,-152(s0)
    1764:	893a                	mv	s2,a4
    1766:	89be                	mv	s3,a5
    1768:	874a                	mv	a4,s2
    176a:	87ce                	mv	a5,s3
}
    176c:	853a                	mv	a0,a4
    176e:	85be                	mv	a1,a5
    1770:	60ee                	ld	ra,216(sp)
    1772:	644e                	ld	s0,208(sp)
    1774:	64ae                	ld	s1,200(sp)
    1776:	690e                	ld	s2,192(sp)
    1778:	79ea                	ld	s3,184(sp)
    177a:	612d                	addi	sp,sp,224
    177c:	8082                	ret

000000000000177e <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    177e:	7155                	addi	sp,sp,-208
    1780:	e586                	sd	ra,200(sp)
    1782:	e1a2                	sd	s0,192(sp)
    1784:	fd26                	sd	s1,184(sp)
    1786:	f94a                	sd	s2,176(sp)
    1788:	f54e                	sd	s3,168(sp)
    178a:	0980                	addi	s0,sp,208
    178c:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.

    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    178e:	649c                	ld	a5,8(s1)
    1790:	853e                	mv	a0,a5
    1792:	00000097          	auipc	ra,0x0
    1796:	80c080e7          	jalr	-2036(ra) # f9e <list_empty>
    179a:	87aa                	mv	a5,a0
    179c:	cb85                	beqz	a5,17cc <schedule_dm+0x4e>
        return fill_sparse(args);
    179e:	609c                	ld	a5,0(s1)
    17a0:	f2f43823          	sd	a5,-208(s0)
    17a4:	649c                	ld	a5,8(s1)
    17a6:	f2f43c23          	sd	a5,-200(s0)
    17aa:	689c                	ld	a5,16(s1)
    17ac:	f4f43023          	sd	a5,-192(s0)
    17b0:	f3040793          	addi	a5,s0,-208
    17b4:	853e                	mv	a0,a5
    17b6:	00000097          	auipc	ra,0x0
    17ba:	812080e7          	jalr	-2030(ra) # fc8 <fill_sparse>
    17be:	872a                	mv	a4,a0
    17c0:	87ae                	mv	a5,a1
    17c2:	f6e43823          	sd	a4,-144(s0)
    17c6:	f6f43c23          	sd	a5,-136(s0)
    17ca:	ac11                	j	19de <schedule_dm+0x260>
    
    int current_time = args.current_time;
    17cc:	409c                	lw	a5,0(s1)
    17ce:	faf42623          	sw	a5,-84(s0)

    // find the thread with the earliest deadline
    struct thread *highest_priority_thread = NULL;
    17d2:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    17d6:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    17da:	649c                	ld	a5,8(s1)
    17dc:	639c                	ld	a5,0(a5)
    17de:	faf43023          	sd	a5,-96(s0)
    17e2:	fa043783          	ld	a5,-96(s0)
    17e6:	fd878793          	addi	a5,a5,-40
    17ea:	fcf43023          	sd	a5,-64(s0)
    17ee:	a0c9                	j	18b0 <schedule_dm+0x132>
        if (highest_priority_thread == NULL) {
    17f0:	fc843783          	ld	a5,-56(s0)
    17f4:	e791                	bnez	a5,1800 <schedule_dm+0x82>
            highest_priority_thread = th;
    17f6:	fc043783          	ld	a5,-64(s0)
    17fa:	fcf43423          	sd	a5,-56(s0)
    17fe:	a871                	j	189a <schedule_dm+0x11c>
        }
        else if (highest_priority_thread->current_deadline <= current_time) { // missing the deadline
    1800:	fc843783          	ld	a5,-56(s0)
    1804:	4ff8                	lw	a4,92(a5)
    1806:	fac42783          	lw	a5,-84(s0)
    180a:	2781                	sext.w	a5,a5
    180c:	02e7c763          	blt	a5,a4,183a <schedule_dm+0xbc>
            if (th->current_deadline > current_time) continue;
    1810:	fc043783          	ld	a5,-64(s0)
    1814:	4ff8                	lw	a4,92(a5)
    1816:	fac42783          	lw	a5,-84(s0)
    181a:	2781                	sext.w	a5,a5
    181c:	06e7ce63          	blt	a5,a4,1898 <schedule_dm+0x11a>
            if (th->ID < highest_priority_thread->ID) {
    1820:	fc043783          	ld	a5,-64(s0)
    1824:	5fd8                	lw	a4,60(a5)
    1826:	fc843783          	ld	a5,-56(s0)
    182a:	5fdc                	lw	a5,60(a5)
    182c:	06f75763          	bge	a4,a5,189a <schedule_dm+0x11c>
                highest_priority_thread = th;
    1830:	fc043783          	ld	a5,-64(s0)
    1834:	fcf43423          	sd	a5,-56(s0)
    1838:	a08d                	j	189a <schedule_dm+0x11c>
            }
        }
        else if (th->current_deadline <= current_time) {
    183a:	fc043783          	ld	a5,-64(s0)
    183e:	4ff8                	lw	a4,92(a5)
    1840:	fac42783          	lw	a5,-84(s0)
    1844:	2781                	sext.w	a5,a5
    1846:	00e7c763          	blt	a5,a4,1854 <schedule_dm+0xd6>
            highest_priority_thread = th;
    184a:	fc043783          	ld	a5,-64(s0)
    184e:	fcf43423          	sd	a5,-56(s0)
    1852:	a0a1                	j	189a <schedule_dm+0x11c>
        }
        else if (th->deadline < highest_priority_thread->deadline ) {
    1854:	fc043783          	ld	a5,-64(s0)
    1858:	47f8                	lw	a4,76(a5)
    185a:	fc843783          	ld	a5,-56(s0)
    185e:	47fc                	lw	a5,76(a5)
    1860:	00f75763          	bge	a4,a5,186e <schedule_dm+0xf0>
            highest_priority_thread = th;
    1864:	fc043783          	ld	a5,-64(s0)
    1868:	fcf43423          	sd	a5,-56(s0)
    186c:	a03d                	j	189a <schedule_dm+0x11c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    186e:	fc043783          	ld	a5,-64(s0)
    1872:	47f8                	lw	a4,76(a5)
    1874:	fc843783          	ld	a5,-56(s0)
    1878:	47fc                	lw	a5,76(a5)
    187a:	02f71063          	bne	a4,a5,189a <schedule_dm+0x11c>
    187e:	fc043783          	ld	a5,-64(s0)
    1882:	5fd8                	lw	a4,60(a5)
    1884:	fc843783          	ld	a5,-56(s0)
    1888:	5fdc                	lw	a5,60(a5)
    188a:	00f75863          	bge	a4,a5,189a <schedule_dm+0x11c>
            highest_priority_thread = th;
    188e:	fc043783          	ld	a5,-64(s0)
    1892:	fcf43423          	sd	a5,-56(s0)
    1896:	a011                	j	189a <schedule_dm+0x11c>
            if (th->current_deadline > current_time) continue;
    1898:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    189a:	fc043783          	ld	a5,-64(s0)
    189e:	779c                	ld	a5,40(a5)
    18a0:	f8f43023          	sd	a5,-128(s0)
    18a4:	f8043783          	ld	a5,-128(s0)
    18a8:	fd878793          	addi	a5,a5,-40
    18ac:	fcf43023          	sd	a5,-64(s0)
    18b0:	fc043783          	ld	a5,-64(s0)
    18b4:	02878713          	addi	a4,a5,40
    18b8:	649c                	ld	a5,8(s1)
    18ba:	f2f71be3          	bne	a4,a5,17f0 <schedule_dm+0x72>
        }
    }

    // the thread missing the current deadline
    if (highest_priority_thread->current_deadline <= current_time)
    18be:	fc843783          	ld	a5,-56(s0)
    18c2:	4ff8                	lw	a4,92(a5)
    18c4:	fac42783          	lw	a5,-84(s0)
    18c8:	2781                	sext.w	a5,a5
    18ca:	00e7cb63          	blt	a5,a4,18e0 <schedule_dm+0x162>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    18ce:	fc843783          	ld	a5,-56(s0)
    18d2:	02878793          	addi	a5,a5,40
    18d6:	f6f43823          	sd	a5,-144(s0)
    18da:	f6042c23          	sw	zero,-136(s0)
    18de:	a201                	j	19de <schedule_dm+0x260>

    int executing_time = highest_priority_thread->remaining_time;
    18e0:	fc843783          	ld	a5,-56(s0)
    18e4:	4fbc                	lw	a5,88(a5)
    18e6:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    18ea:	fc843783          	ld	a5,-56(s0)
    18ee:	4fb4                	lw	a3,88(a5)
    18f0:	fc843783          	ld	a5,-56(s0)
    18f4:	4ff8                	lw	a4,92(a5)
    18f6:	fac42783          	lw	a5,-84(s0)
    18fa:	40f707bb          	subw	a5,a4,a5
    18fe:	2781                	sext.w	a5,a5
    1900:	8736                	mv	a4,a3
    1902:	00e7db63          	bge	a5,a4,1918 <schedule_dm+0x19a>
        executing_time = highest_priority_thread->current_deadline - current_time;
    1906:	fc843783          	ld	a5,-56(s0)
    190a:	4ff8                	lw	a4,92(a5)
    190c:	fac42783          	lw	a5,-84(s0)
    1910:	40f707bb          	subw	a5,a4,a5
    1914:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1918:	689c                	ld	a5,16(s1)
    191a:	639c                	ld	a5,0(a5)
    191c:	f8f43c23          	sd	a5,-104(s0)
    1920:	f9843783          	ld	a5,-104(s0)
    1924:	17e1                	addi	a5,a5,-8
    1926:	faf43823          	sd	a5,-80(s0)
    192a:	a049                	j	19ac <schedule_dm+0x22e>
        int interval = cur->release_time - current_time;
    192c:	fb043783          	ld	a5,-80(s0)
    1930:	4f98                	lw	a4,24(a5)
    1932:	fac42783          	lw	a5,-84(s0)
    1936:	40f707bb          	subw	a5,a4,a5
    193a:	f8f42a23          	sw	a5,-108(s0)
        if (interval > executing_time) continue;
    193e:	f9442703          	lw	a4,-108(s0)
    1942:	fbc42783          	lw	a5,-68(s0)
    1946:	2701                	sext.w	a4,a4
    1948:	2781                	sext.w	a5,a5
    194a:	04e7c263          	blt	a5,a4,198e <schedule_dm+0x210>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    194e:	fc843783          	ld	a5,-56(s0)
    1952:	47f8                	lw	a4,76(a5)
    1954:	fb043783          	ld	a5,-80(s0)
    1958:	639c                	ld	a5,0(a5)
    195a:	47fc                	lw	a5,76(a5)
    195c:	02f74b63          	blt	a4,a5,1992 <schedule_dm+0x214>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    1960:	fc843783          	ld	a5,-56(s0)
    1964:	47f8                	lw	a4,76(a5)
    1966:	fb043783          	ld	a5,-80(s0)
    196a:	639c                	ld	a5,0(a5)
    196c:	47fc                	lw	a5,76(a5)
    196e:	00f71b63          	bne	a4,a5,1984 <schedule_dm+0x206>
    1972:	fc843783          	ld	a5,-56(s0)
    1976:	5fd8                	lw	a4,60(a5)
    1978:	fb043783          	ld	a5,-80(s0)
    197c:	639c                	ld	a5,0(a5)
    197e:	5fdc                	lw	a5,60(a5)
    1980:	00f74b63          	blt	a4,a5,1996 <schedule_dm+0x218>
        executing_time = interval;
    1984:	f9442783          	lw	a5,-108(s0)
    1988:	faf42e23          	sw	a5,-68(s0)
    198c:	a031                	j	1998 <schedule_dm+0x21a>
        if (interval > executing_time) continue;
    198e:	0001                	nop
    1990:	a021                	j	1998 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    1992:	0001                	nop
    1994:	a011                	j	1998 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    1996:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1998:	fb043783          	ld	a5,-80(s0)
    199c:	679c                	ld	a5,8(a5)
    199e:	f8f43423          	sd	a5,-120(s0)
    19a2:	f8843783          	ld	a5,-120(s0)
    19a6:	17e1                	addi	a5,a5,-8
    19a8:	faf43823          	sd	a5,-80(s0)
    19ac:	fb043783          	ld	a5,-80(s0)
    19b0:	00878713          	addi	a4,a5,8
    19b4:	689c                	ld	a5,16(s1)
    19b6:	f6f71be3          	bne	a4,a5,192c <schedule_dm+0x1ae>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &highest_priority_thread->thread_list;
    19ba:	fc843783          	ld	a5,-56(s0)
    19be:	02878793          	addi	a5,a5,40
    19c2:	f6f43023          	sd	a5,-160(s0)
    r.allocated_time = executing_time;
    19c6:	fbc42783          	lw	a5,-68(s0)
    19ca:	f6f42423          	sw	a5,-152(s0)
    return r;
    19ce:	f6043783          	ld	a5,-160(s0)
    19d2:	f6f43823          	sd	a5,-144(s0)
    19d6:	f6843783          	ld	a5,-152(s0)
    19da:	f6f43c23          	sd	a5,-136(s0)
    19de:	4701                	li	a4,0
    19e0:	f7043703          	ld	a4,-144(s0)
    19e4:	4781                	li	a5,0
    19e6:	f7843783          	ld	a5,-136(s0)
    19ea:	893a                	mv	s2,a4
    19ec:	89be                	mv	s3,a5
    19ee:	874a                	mv	a4,s2
    19f0:	87ce                	mv	a5,s3
    19f2:	853a                	mv	a0,a4
    19f4:	85be                	mv	a1,a5
    19f6:	60ae                	ld	ra,200(sp)
    19f8:	640e                	ld	s0,192(sp)
    19fa:	74ea                	ld	s1,184(sp)
    19fc:	794a                	ld	s2,176(sp)
    19fe:	79aa                	ld	s3,168(sp)
    1a00:	6169                	addi	sp,sp,208
    1a02:	8082                	ret
