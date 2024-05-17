
user/_setjmp:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <setjmp>:
       0:	e100                	sd	s0,0(a0)
       2:	e504                	sd	s1,8(a0)
       4:	01253823          	sd	s2,16(a0)
       8:	01353c23          	sd	s3,24(a0)
       c:	03453023          	sd	s4,32(a0)
      10:	03553423          	sd	s5,40(a0)
      14:	03653823          	sd	s6,48(a0)
      18:	03753c23          	sd	s7,56(a0)
      1c:	05853023          	sd	s8,64(a0)
      20:	05953423          	sd	s9,72(a0)
      24:	05a53823          	sd	s10,80(a0)
      28:	05b53c23          	sd	s11,88(a0)
      2c:	06153023          	sd	ra,96(a0)
      30:	06253423          	sd	sp,104(a0)
      34:	4501                	li	a0,0
      36:	8082                	ret

0000000000000038 <longjmp>:
      38:	6100                	ld	s0,0(a0)
      3a:	6504                	ld	s1,8(a0)
      3c:	01053903          	ld	s2,16(a0)
      40:	01853983          	ld	s3,24(a0)
      44:	02053a03          	ld	s4,32(a0)
      48:	02853a83          	ld	s5,40(a0)
      4c:	03053b03          	ld	s6,48(a0)
      50:	03853b83          	ld	s7,56(a0)
      54:	04053c03          	ld	s8,64(a0)
      58:	04853c83          	ld	s9,72(a0)
      5c:	05053d03          	ld	s10,80(a0)
      60:	05853d83          	ld	s11,88(a0)
      64:	06053083          	ld	ra,96(a0)
      68:	06853103          	ld	sp,104(a0)
      6c:	c199                	beqz	a1,72 <longjmp_1>
      6e:	852e                	mv	a0,a1
      70:	8082                	ret

0000000000000072 <longjmp_1>:
      72:	4505                	li	a0,1
      74:	8082                	ret

0000000000000076 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      76:	7179                	addi	sp,sp,-48
      78:	f422                	sd	s0,40(sp)
      7a:	1800                	addi	s0,sp,48
      7c:	fca43c23          	sd	a0,-40(s0)
      80:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      84:	fd843783          	ld	a5,-40(s0)
      88:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      8c:	0001                	nop
      8e:	fd043703          	ld	a4,-48(s0)
      92:	00170793          	addi	a5,a4,1
      96:	fcf43823          	sd	a5,-48(s0)
      9a:	fd843783          	ld	a5,-40(s0)
      9e:	00178693          	addi	a3,a5,1
      a2:	fcd43c23          	sd	a3,-40(s0)
      a6:	00074703          	lbu	a4,0(a4)
      aa:	00e78023          	sb	a4,0(a5)
      ae:	0007c783          	lbu	a5,0(a5)
      b2:	fff1                	bnez	a5,8e <strcpy+0x18>
    ;
  return os;
      b4:	fe843783          	ld	a5,-24(s0)
}
      b8:	853e                	mv	a0,a5
      ba:	7422                	ld	s0,40(sp)
      bc:	6145                	addi	sp,sp,48
      be:	8082                	ret

00000000000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      c0:	1101                	addi	sp,sp,-32
      c2:	ec22                	sd	s0,24(sp)
      c4:	1000                	addi	s0,sp,32
      c6:	fea43423          	sd	a0,-24(s0)
      ca:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
      ce:	a819                	j	e4 <strcmp+0x24>
    p++, q++;
      d0:	fe843783          	ld	a5,-24(s0)
      d4:	0785                	addi	a5,a5,1
      d6:	fef43423          	sd	a5,-24(s0)
      da:	fe043783          	ld	a5,-32(s0)
      de:	0785                	addi	a5,a5,1
      e0:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
      e4:	fe843783          	ld	a5,-24(s0)
      e8:	0007c783          	lbu	a5,0(a5)
      ec:	cb99                	beqz	a5,102 <strcmp+0x42>
      ee:	fe843783          	ld	a5,-24(s0)
      f2:	0007c703          	lbu	a4,0(a5)
      f6:	fe043783          	ld	a5,-32(s0)
      fa:	0007c783          	lbu	a5,0(a5)
      fe:	fcf709e3          	beq	a4,a5,d0 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     102:	fe843783          	ld	a5,-24(s0)
     106:	0007c783          	lbu	a5,0(a5)
     10a:	0007871b          	sext.w	a4,a5
     10e:	fe043783          	ld	a5,-32(s0)
     112:	0007c783          	lbu	a5,0(a5)
     116:	2781                	sext.w	a5,a5
     118:	40f707bb          	subw	a5,a4,a5
     11c:	2781                	sext.w	a5,a5
}
     11e:	853e                	mv	a0,a5
     120:	6462                	ld	s0,24(sp)
     122:	6105                	addi	sp,sp,32
     124:	8082                	ret

0000000000000126 <strlen>:

uint
strlen(const char *s)
{
     126:	7179                	addi	sp,sp,-48
     128:	f422                	sd	s0,40(sp)
     12a:	1800                	addi	s0,sp,48
     12c:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     130:	fe042623          	sw	zero,-20(s0)
     134:	a031                	j	140 <strlen+0x1a>
     136:	fec42783          	lw	a5,-20(s0)
     13a:	2785                	addiw	a5,a5,1
     13c:	fef42623          	sw	a5,-20(s0)
     140:	fec42783          	lw	a5,-20(s0)
     144:	fd843703          	ld	a4,-40(s0)
     148:	97ba                	add	a5,a5,a4
     14a:	0007c783          	lbu	a5,0(a5)
     14e:	f7e5                	bnez	a5,136 <strlen+0x10>
    ;
  return n;
     150:	fec42783          	lw	a5,-20(s0)
}
     154:	853e                	mv	a0,a5
     156:	7422                	ld	s0,40(sp)
     158:	6145                	addi	sp,sp,48
     15a:	8082                	ret

000000000000015c <memset>:

void*
memset(void *dst, int c, uint n)
{
     15c:	7179                	addi	sp,sp,-48
     15e:	f422                	sd	s0,40(sp)
     160:	1800                	addi	s0,sp,48
     162:	fca43c23          	sd	a0,-40(s0)
     166:	87ae                	mv	a5,a1
     168:	8732                	mv	a4,a2
     16a:	fcf42a23          	sw	a5,-44(s0)
     16e:	87ba                	mv	a5,a4
     170:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     174:	fd843783          	ld	a5,-40(s0)
     178:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     17c:	fe042623          	sw	zero,-20(s0)
     180:	a00d                	j	1a2 <memset+0x46>
    cdst[i] = c;
     182:	fec42783          	lw	a5,-20(s0)
     186:	fe043703          	ld	a4,-32(s0)
     18a:	97ba                	add	a5,a5,a4
     18c:	fd442703          	lw	a4,-44(s0)
     190:	0ff77713          	andi	a4,a4,255
     194:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     198:	fec42783          	lw	a5,-20(s0)
     19c:	2785                	addiw	a5,a5,1
     19e:	fef42623          	sw	a5,-20(s0)
     1a2:	fec42703          	lw	a4,-20(s0)
     1a6:	fd042783          	lw	a5,-48(s0)
     1aa:	2781                	sext.w	a5,a5
     1ac:	fcf76be3          	bltu	a4,a5,182 <memset+0x26>
  }
  return dst;
     1b0:	fd843783          	ld	a5,-40(s0)
}
     1b4:	853e                	mv	a0,a5
     1b6:	7422                	ld	s0,40(sp)
     1b8:	6145                	addi	sp,sp,48
     1ba:	8082                	ret

00000000000001bc <strchr>:

char*
strchr(const char *s, char c)
{
     1bc:	1101                	addi	sp,sp,-32
     1be:	ec22                	sd	s0,24(sp)
     1c0:	1000                	addi	s0,sp,32
     1c2:	fea43423          	sd	a0,-24(s0)
     1c6:	87ae                	mv	a5,a1
     1c8:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     1cc:	a01d                	j	1f2 <strchr+0x36>
    if(*s == c)
     1ce:	fe843783          	ld	a5,-24(s0)
     1d2:	0007c703          	lbu	a4,0(a5)
     1d6:	fe744783          	lbu	a5,-25(s0)
     1da:	0ff7f793          	andi	a5,a5,255
     1de:	00e79563          	bne	a5,a4,1e8 <strchr+0x2c>
      return (char*)s;
     1e2:	fe843783          	ld	a5,-24(s0)
     1e6:	a821                	j	1fe <strchr+0x42>
  for(; *s; s++)
     1e8:	fe843783          	ld	a5,-24(s0)
     1ec:	0785                	addi	a5,a5,1
     1ee:	fef43423          	sd	a5,-24(s0)
     1f2:	fe843783          	ld	a5,-24(s0)
     1f6:	0007c783          	lbu	a5,0(a5)
     1fa:	fbf1                	bnez	a5,1ce <strchr+0x12>
  return 0;
     1fc:	4781                	li	a5,0
}
     1fe:	853e                	mv	a0,a5
     200:	6462                	ld	s0,24(sp)
     202:	6105                	addi	sp,sp,32
     204:	8082                	ret

0000000000000206 <gets>:

char*
gets(char *buf, int max)
{
     206:	7179                	addi	sp,sp,-48
     208:	f406                	sd	ra,40(sp)
     20a:	f022                	sd	s0,32(sp)
     20c:	1800                	addi	s0,sp,48
     20e:	fca43c23          	sd	a0,-40(s0)
     212:	87ae                	mv	a5,a1
     214:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     218:	fe042623          	sw	zero,-20(s0)
     21c:	a8a1                	j	274 <gets+0x6e>
    cc = read(0, &c, 1);
     21e:	fe740793          	addi	a5,s0,-25
     222:	4605                	li	a2,1
     224:	85be                	mv	a1,a5
     226:	4501                	li	a0,0
     228:	00000097          	auipc	ra,0x0
     22c:	2f6080e7          	jalr	758(ra) # 51e <read>
     230:	87aa                	mv	a5,a0
     232:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     236:	fe842783          	lw	a5,-24(s0)
     23a:	2781                	sext.w	a5,a5
     23c:	04f05763          	blez	a5,28a <gets+0x84>
      break;
    buf[i++] = c;
     240:	fec42783          	lw	a5,-20(s0)
     244:	0017871b          	addiw	a4,a5,1
     248:	fee42623          	sw	a4,-20(s0)
     24c:	873e                	mv	a4,a5
     24e:	fd843783          	ld	a5,-40(s0)
     252:	97ba                	add	a5,a5,a4
     254:	fe744703          	lbu	a4,-25(s0)
     258:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     25c:	fe744783          	lbu	a5,-25(s0)
     260:	873e                	mv	a4,a5
     262:	47a9                	li	a5,10
     264:	02f70463          	beq	a4,a5,28c <gets+0x86>
     268:	fe744783          	lbu	a5,-25(s0)
     26c:	873e                	mv	a4,a5
     26e:	47b5                	li	a5,13
     270:	00f70e63          	beq	a4,a5,28c <gets+0x86>
  for(i=0; i+1 < max; ){
     274:	fec42783          	lw	a5,-20(s0)
     278:	2785                	addiw	a5,a5,1
     27a:	0007871b          	sext.w	a4,a5
     27e:	fd442783          	lw	a5,-44(s0)
     282:	2781                	sext.w	a5,a5
     284:	f8f74de3          	blt	a4,a5,21e <gets+0x18>
     288:	a011                	j	28c <gets+0x86>
      break;
     28a:	0001                	nop
      break;
  }
  buf[i] = '\0';
     28c:	fec42783          	lw	a5,-20(s0)
     290:	fd843703          	ld	a4,-40(s0)
     294:	97ba                	add	a5,a5,a4
     296:	00078023          	sb	zero,0(a5)
  return buf;
     29a:	fd843783          	ld	a5,-40(s0)
}
     29e:	853e                	mv	a0,a5
     2a0:	70a2                	ld	ra,40(sp)
     2a2:	7402                	ld	s0,32(sp)
     2a4:	6145                	addi	sp,sp,48
     2a6:	8082                	ret

00000000000002a8 <stat>:

int
stat(const char *n, struct stat *st)
{
     2a8:	7179                	addi	sp,sp,-48
     2aa:	f406                	sd	ra,40(sp)
     2ac:	f022                	sd	s0,32(sp)
     2ae:	1800                	addi	s0,sp,48
     2b0:	fca43c23          	sd	a0,-40(s0)
     2b4:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2b8:	4581                	li	a1,0
     2ba:	fd843503          	ld	a0,-40(s0)
     2be:	00000097          	auipc	ra,0x0
     2c2:	288080e7          	jalr	648(ra) # 546 <open>
     2c6:	87aa                	mv	a5,a0
     2c8:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     2cc:	fec42783          	lw	a5,-20(s0)
     2d0:	2781                	sext.w	a5,a5
     2d2:	0007d463          	bgez	a5,2da <stat+0x32>
    return -1;
     2d6:	57fd                	li	a5,-1
     2d8:	a035                	j	304 <stat+0x5c>
  r = fstat(fd, st);
     2da:	fec42783          	lw	a5,-20(s0)
     2de:	fd043583          	ld	a1,-48(s0)
     2e2:	853e                	mv	a0,a5
     2e4:	00000097          	auipc	ra,0x0
     2e8:	27a080e7          	jalr	634(ra) # 55e <fstat>
     2ec:	87aa                	mv	a5,a0
     2ee:	fef42423          	sw	a5,-24(s0)
  close(fd);
     2f2:	fec42783          	lw	a5,-20(s0)
     2f6:	853e                	mv	a0,a5
     2f8:	00000097          	auipc	ra,0x0
     2fc:	236080e7          	jalr	566(ra) # 52e <close>
  return r;
     300:	fe842783          	lw	a5,-24(s0)
}
     304:	853e                	mv	a0,a5
     306:	70a2                	ld	ra,40(sp)
     308:	7402                	ld	s0,32(sp)
     30a:	6145                	addi	sp,sp,48
     30c:	8082                	ret

000000000000030e <atoi>:

int
atoi(const char *s)
{
     30e:	7179                	addi	sp,sp,-48
     310:	f422                	sd	s0,40(sp)
     312:	1800                	addi	s0,sp,48
     314:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     318:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     31c:	a815                	j	350 <atoi+0x42>
    n = n*10 + *s++ - '0';
     31e:	fec42703          	lw	a4,-20(s0)
     322:	87ba                	mv	a5,a4
     324:	0027979b          	slliw	a5,a5,0x2
     328:	9fb9                	addw	a5,a5,a4
     32a:	0017979b          	slliw	a5,a5,0x1
     32e:	0007871b          	sext.w	a4,a5
     332:	fd843783          	ld	a5,-40(s0)
     336:	00178693          	addi	a3,a5,1
     33a:	fcd43c23          	sd	a3,-40(s0)
     33e:	0007c783          	lbu	a5,0(a5)
     342:	2781                	sext.w	a5,a5
     344:	9fb9                	addw	a5,a5,a4
     346:	2781                	sext.w	a5,a5
     348:	fd07879b          	addiw	a5,a5,-48
     34c:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     350:	fd843783          	ld	a5,-40(s0)
     354:	0007c783          	lbu	a5,0(a5)
     358:	873e                	mv	a4,a5
     35a:	02f00793          	li	a5,47
     35e:	00e7fb63          	bgeu	a5,a4,374 <atoi+0x66>
     362:	fd843783          	ld	a5,-40(s0)
     366:	0007c783          	lbu	a5,0(a5)
     36a:	873e                	mv	a4,a5
     36c:	03900793          	li	a5,57
     370:	fae7f7e3          	bgeu	a5,a4,31e <atoi+0x10>
  return n;
     374:	fec42783          	lw	a5,-20(s0)
}
     378:	853e                	mv	a0,a5
     37a:	7422                	ld	s0,40(sp)
     37c:	6145                	addi	sp,sp,48
     37e:	8082                	ret

0000000000000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     380:	7139                	addi	sp,sp,-64
     382:	fc22                	sd	s0,56(sp)
     384:	0080                	addi	s0,sp,64
     386:	fca43c23          	sd	a0,-40(s0)
     38a:	fcb43823          	sd	a1,-48(s0)
     38e:	87b2                	mv	a5,a2
     390:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     394:	fd843783          	ld	a5,-40(s0)
     398:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     39c:	fd043783          	ld	a5,-48(s0)
     3a0:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3a4:	fe043703          	ld	a4,-32(s0)
     3a8:	fe843783          	ld	a5,-24(s0)
     3ac:	02e7fc63          	bgeu	a5,a4,3e4 <memmove+0x64>
    while(n-- > 0)
     3b0:	a00d                	j	3d2 <memmove+0x52>
      *dst++ = *src++;
     3b2:	fe043703          	ld	a4,-32(s0)
     3b6:	00170793          	addi	a5,a4,1
     3ba:	fef43023          	sd	a5,-32(s0)
     3be:	fe843783          	ld	a5,-24(s0)
     3c2:	00178693          	addi	a3,a5,1
     3c6:	fed43423          	sd	a3,-24(s0)
     3ca:	00074703          	lbu	a4,0(a4)
     3ce:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     3d2:	fcc42783          	lw	a5,-52(s0)
     3d6:	fff7871b          	addiw	a4,a5,-1
     3da:	fce42623          	sw	a4,-52(s0)
     3de:	fcf04ae3          	bgtz	a5,3b2 <memmove+0x32>
     3e2:	a891                	j	436 <memmove+0xb6>
  } else {
    dst += n;
     3e4:	fcc42783          	lw	a5,-52(s0)
     3e8:	fe843703          	ld	a4,-24(s0)
     3ec:	97ba                	add	a5,a5,a4
     3ee:	fef43423          	sd	a5,-24(s0)
    src += n;
     3f2:	fcc42783          	lw	a5,-52(s0)
     3f6:	fe043703          	ld	a4,-32(s0)
     3fa:	97ba                	add	a5,a5,a4
     3fc:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     400:	a01d                	j	426 <memmove+0xa6>
      *--dst = *--src;
     402:	fe043783          	ld	a5,-32(s0)
     406:	17fd                	addi	a5,a5,-1
     408:	fef43023          	sd	a5,-32(s0)
     40c:	fe843783          	ld	a5,-24(s0)
     410:	17fd                	addi	a5,a5,-1
     412:	fef43423          	sd	a5,-24(s0)
     416:	fe043783          	ld	a5,-32(s0)
     41a:	0007c703          	lbu	a4,0(a5)
     41e:	fe843783          	ld	a5,-24(s0)
     422:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     426:	fcc42783          	lw	a5,-52(s0)
     42a:	fff7871b          	addiw	a4,a5,-1
     42e:	fce42623          	sw	a4,-52(s0)
     432:	fcf048e3          	bgtz	a5,402 <memmove+0x82>
  }
  return vdst;
     436:	fd843783          	ld	a5,-40(s0)
}
     43a:	853e                	mv	a0,a5
     43c:	7462                	ld	s0,56(sp)
     43e:	6121                	addi	sp,sp,64
     440:	8082                	ret

0000000000000442 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     442:	7139                	addi	sp,sp,-64
     444:	fc22                	sd	s0,56(sp)
     446:	0080                	addi	s0,sp,64
     448:	fca43c23          	sd	a0,-40(s0)
     44c:	fcb43823          	sd	a1,-48(s0)
     450:	87b2                	mv	a5,a2
     452:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     456:	fd843783          	ld	a5,-40(s0)
     45a:	fef43423          	sd	a5,-24(s0)
     45e:	fd043783          	ld	a5,-48(s0)
     462:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     466:	a0a1                	j	4ae <memcmp+0x6c>
    if (*p1 != *p2) {
     468:	fe843783          	ld	a5,-24(s0)
     46c:	0007c703          	lbu	a4,0(a5)
     470:	fe043783          	ld	a5,-32(s0)
     474:	0007c783          	lbu	a5,0(a5)
     478:	02f70163          	beq	a4,a5,49a <memcmp+0x58>
      return *p1 - *p2;
     47c:	fe843783          	ld	a5,-24(s0)
     480:	0007c783          	lbu	a5,0(a5)
     484:	0007871b          	sext.w	a4,a5
     488:	fe043783          	ld	a5,-32(s0)
     48c:	0007c783          	lbu	a5,0(a5)
     490:	2781                	sext.w	a5,a5
     492:	40f707bb          	subw	a5,a4,a5
     496:	2781                	sext.w	a5,a5
     498:	a01d                	j	4be <memcmp+0x7c>
    }
    p1++;
     49a:	fe843783          	ld	a5,-24(s0)
     49e:	0785                	addi	a5,a5,1
     4a0:	fef43423          	sd	a5,-24(s0)
    p2++;
     4a4:	fe043783          	ld	a5,-32(s0)
     4a8:	0785                	addi	a5,a5,1
     4aa:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4ae:	fcc42783          	lw	a5,-52(s0)
     4b2:	fff7871b          	addiw	a4,a5,-1
     4b6:	fce42623          	sw	a4,-52(s0)
     4ba:	f7dd                	bnez	a5,468 <memcmp+0x26>
  }
  return 0;
     4bc:	4781                	li	a5,0
}
     4be:	853e                	mv	a0,a5
     4c0:	7462                	ld	s0,56(sp)
     4c2:	6121                	addi	sp,sp,64
     4c4:	8082                	ret

00000000000004c6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4c6:	7179                	addi	sp,sp,-48
     4c8:	f406                	sd	ra,40(sp)
     4ca:	f022                	sd	s0,32(sp)
     4cc:	1800                	addi	s0,sp,48
     4ce:	fea43423          	sd	a0,-24(s0)
     4d2:	feb43023          	sd	a1,-32(s0)
     4d6:	87b2                	mv	a5,a2
     4d8:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     4dc:	fdc42783          	lw	a5,-36(s0)
     4e0:	863e                	mv	a2,a5
     4e2:	fe043583          	ld	a1,-32(s0)
     4e6:	fe843503          	ld	a0,-24(s0)
     4ea:	00000097          	auipc	ra,0x0
     4ee:	e96080e7          	jalr	-362(ra) # 380 <memmove>
     4f2:	87aa                	mv	a5,a0
}
     4f4:	853e                	mv	a0,a5
     4f6:	70a2                	ld	ra,40(sp)
     4f8:	7402                	ld	s0,32(sp)
     4fa:	6145                	addi	sp,sp,48
     4fc:	8082                	ret

00000000000004fe <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     4fe:	4885                	li	a7,1
 ecall
     500:	00000073          	ecall
 ret
     504:	8082                	ret

0000000000000506 <exit>:
.global exit
exit:
 li a7, SYS_exit
     506:	4889                	li	a7,2
 ecall
     508:	00000073          	ecall
 ret
     50c:	8082                	ret

000000000000050e <wait>:
.global wait
wait:
 li a7, SYS_wait
     50e:	488d                	li	a7,3
 ecall
     510:	00000073          	ecall
 ret
     514:	8082                	ret

0000000000000516 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     516:	4891                	li	a7,4
 ecall
     518:	00000073          	ecall
 ret
     51c:	8082                	ret

000000000000051e <read>:
.global read
read:
 li a7, SYS_read
     51e:	4895                	li	a7,5
 ecall
     520:	00000073          	ecall
 ret
     524:	8082                	ret

0000000000000526 <write>:
.global write
write:
 li a7, SYS_write
     526:	48c1                	li	a7,16
 ecall
     528:	00000073          	ecall
 ret
     52c:	8082                	ret

000000000000052e <close>:
.global close
close:
 li a7, SYS_close
     52e:	48d5                	li	a7,21
 ecall
     530:	00000073          	ecall
 ret
     534:	8082                	ret

0000000000000536 <kill>:
.global kill
kill:
 li a7, SYS_kill
     536:	4899                	li	a7,6
 ecall
     538:	00000073          	ecall
 ret
     53c:	8082                	ret

000000000000053e <exec>:
.global exec
exec:
 li a7, SYS_exec
     53e:	489d                	li	a7,7
 ecall
     540:	00000073          	ecall
 ret
     544:	8082                	ret

0000000000000546 <open>:
.global open
open:
 li a7, SYS_open
     546:	48bd                	li	a7,15
 ecall
     548:	00000073          	ecall
 ret
     54c:	8082                	ret

000000000000054e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     54e:	48c5                	li	a7,17
 ecall
     550:	00000073          	ecall
 ret
     554:	8082                	ret

0000000000000556 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     556:	48c9                	li	a7,18
 ecall
     558:	00000073          	ecall
 ret
     55c:	8082                	ret

000000000000055e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     55e:	48a1                	li	a7,8
 ecall
     560:	00000073          	ecall
 ret
     564:	8082                	ret

0000000000000566 <link>:
.global link
link:
 li a7, SYS_link
     566:	48cd                	li	a7,19
 ecall
     568:	00000073          	ecall
 ret
     56c:	8082                	ret

000000000000056e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     56e:	48d1                	li	a7,20
 ecall
     570:	00000073          	ecall
 ret
     574:	8082                	ret

0000000000000576 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     576:	48a5                	li	a7,9
 ecall
     578:	00000073          	ecall
 ret
     57c:	8082                	ret

000000000000057e <dup>:
.global dup
dup:
 li a7, SYS_dup
     57e:	48a9                	li	a7,10
 ecall
     580:	00000073          	ecall
 ret
     584:	8082                	ret

0000000000000586 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     586:	48ad                	li	a7,11
 ecall
     588:	00000073          	ecall
 ret
     58c:	8082                	ret

000000000000058e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     58e:	48b1                	li	a7,12
 ecall
     590:	00000073          	ecall
 ret
     594:	8082                	ret

0000000000000596 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     596:	48b5                	li	a7,13
 ecall
     598:	00000073          	ecall
 ret
     59c:	8082                	ret

000000000000059e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     59e:	48b9                	li	a7,14
 ecall
     5a0:	00000073          	ecall
 ret
     5a4:	8082                	ret

00000000000005a6 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5a6:	48d9                	li	a7,22
 ecall
     5a8:	00000073          	ecall
 ret
     5ac:	8082                	ret

00000000000005ae <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5ae:	48dd                	li	a7,23
 ecall
     5b0:	00000073          	ecall
 ret
     5b4:	8082                	ret

00000000000005b6 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5b6:	48e1                	li	a7,24
 ecall
     5b8:	00000073          	ecall
 ret
     5bc:	8082                	ret

00000000000005be <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5be:	1101                	addi	sp,sp,-32
     5c0:	ec06                	sd	ra,24(sp)
     5c2:	e822                	sd	s0,16(sp)
     5c4:	1000                	addi	s0,sp,32
     5c6:	87aa                	mv	a5,a0
     5c8:	872e                	mv	a4,a1
     5ca:	fef42623          	sw	a5,-20(s0)
     5ce:	87ba                	mv	a5,a4
     5d0:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     5d4:	feb40713          	addi	a4,s0,-21
     5d8:	fec42783          	lw	a5,-20(s0)
     5dc:	4605                	li	a2,1
     5de:	85ba                	mv	a1,a4
     5e0:	853e                	mv	a0,a5
     5e2:	00000097          	auipc	ra,0x0
     5e6:	f44080e7          	jalr	-188(ra) # 526 <write>
}
     5ea:	0001                	nop
     5ec:	60e2                	ld	ra,24(sp)
     5ee:	6442                	ld	s0,16(sp)
     5f0:	6105                	addi	sp,sp,32
     5f2:	8082                	ret

00000000000005f4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     5f4:	7139                	addi	sp,sp,-64
     5f6:	fc06                	sd	ra,56(sp)
     5f8:	f822                	sd	s0,48(sp)
     5fa:	0080                	addi	s0,sp,64
     5fc:	87aa                	mv	a5,a0
     5fe:	8736                	mv	a4,a3
     600:	fcf42623          	sw	a5,-52(s0)
     604:	87ae                	mv	a5,a1
     606:	fcf42423          	sw	a5,-56(s0)
     60a:	87b2                	mv	a5,a2
     60c:	fcf42223          	sw	a5,-60(s0)
     610:	87ba                	mv	a5,a4
     612:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     616:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     61a:	fc042783          	lw	a5,-64(s0)
     61e:	2781                	sext.w	a5,a5
     620:	c38d                	beqz	a5,642 <printint+0x4e>
     622:	fc842783          	lw	a5,-56(s0)
     626:	2781                	sext.w	a5,a5
     628:	0007dd63          	bgez	a5,642 <printint+0x4e>
    neg = 1;
     62c:	4785                	li	a5,1
     62e:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     632:	fc842783          	lw	a5,-56(s0)
     636:	40f007bb          	negw	a5,a5
     63a:	2781                	sext.w	a5,a5
     63c:	fef42223          	sw	a5,-28(s0)
     640:	a029                	j	64a <printint+0x56>
  } else {
    x = xx;
     642:	fc842783          	lw	a5,-56(s0)
     646:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     64a:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     64e:	fc442783          	lw	a5,-60(s0)
     652:	fe442703          	lw	a4,-28(s0)
     656:	02f777bb          	remuw	a5,a4,a5
     65a:	0007861b          	sext.w	a2,a5
     65e:	fec42783          	lw	a5,-20(s0)
     662:	0017871b          	addiw	a4,a5,1
     666:	fee42623          	sw	a4,-20(s0)
     66a:	00001697          	auipc	a3,0x1
     66e:	18668693          	addi	a3,a3,390 # 17f0 <digits>
     672:	02061713          	slli	a4,a2,0x20
     676:	9301                	srli	a4,a4,0x20
     678:	9736                	add	a4,a4,a3
     67a:	00074703          	lbu	a4,0(a4)
     67e:	ff040693          	addi	a3,s0,-16
     682:	97b6                	add	a5,a5,a3
     684:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     688:	fc442783          	lw	a5,-60(s0)
     68c:	fe442703          	lw	a4,-28(s0)
     690:	02f757bb          	divuw	a5,a4,a5
     694:	fef42223          	sw	a5,-28(s0)
     698:	fe442783          	lw	a5,-28(s0)
     69c:	2781                	sext.w	a5,a5
     69e:	fbc5                	bnez	a5,64e <printint+0x5a>
  if(neg)
     6a0:	fe842783          	lw	a5,-24(s0)
     6a4:	2781                	sext.w	a5,a5
     6a6:	cf95                	beqz	a5,6e2 <printint+0xee>
    buf[i++] = '-';
     6a8:	fec42783          	lw	a5,-20(s0)
     6ac:	0017871b          	addiw	a4,a5,1
     6b0:	fee42623          	sw	a4,-20(s0)
     6b4:	ff040713          	addi	a4,s0,-16
     6b8:	97ba                	add	a5,a5,a4
     6ba:	02d00713          	li	a4,45
     6be:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6c2:	a005                	j	6e2 <printint+0xee>
    putc(fd, buf[i]);
     6c4:	fec42783          	lw	a5,-20(s0)
     6c8:	ff040713          	addi	a4,s0,-16
     6cc:	97ba                	add	a5,a5,a4
     6ce:	fe07c703          	lbu	a4,-32(a5)
     6d2:	fcc42783          	lw	a5,-52(s0)
     6d6:	85ba                	mv	a1,a4
     6d8:	853e                	mv	a0,a5
     6da:	00000097          	auipc	ra,0x0
     6de:	ee4080e7          	jalr	-284(ra) # 5be <putc>
  while(--i >= 0)
     6e2:	fec42783          	lw	a5,-20(s0)
     6e6:	37fd                	addiw	a5,a5,-1
     6e8:	fef42623          	sw	a5,-20(s0)
     6ec:	fec42783          	lw	a5,-20(s0)
     6f0:	2781                	sext.w	a5,a5
     6f2:	fc07d9e3          	bgez	a5,6c4 <printint+0xd0>
}
     6f6:	0001                	nop
     6f8:	0001                	nop
     6fa:	70e2                	ld	ra,56(sp)
     6fc:	7442                	ld	s0,48(sp)
     6fe:	6121                	addi	sp,sp,64
     700:	8082                	ret

0000000000000702 <printptr>:

static void
printptr(int fd, uint64 x) {
     702:	7179                	addi	sp,sp,-48
     704:	f406                	sd	ra,40(sp)
     706:	f022                	sd	s0,32(sp)
     708:	1800                	addi	s0,sp,48
     70a:	87aa                	mv	a5,a0
     70c:	fcb43823          	sd	a1,-48(s0)
     710:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     714:	fdc42783          	lw	a5,-36(s0)
     718:	03000593          	li	a1,48
     71c:	853e                	mv	a0,a5
     71e:	00000097          	auipc	ra,0x0
     722:	ea0080e7          	jalr	-352(ra) # 5be <putc>
  putc(fd, 'x');
     726:	fdc42783          	lw	a5,-36(s0)
     72a:	07800593          	li	a1,120
     72e:	853e                	mv	a0,a5
     730:	00000097          	auipc	ra,0x0
     734:	e8e080e7          	jalr	-370(ra) # 5be <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     738:	fe042623          	sw	zero,-20(s0)
     73c:	a82d                	j	776 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     73e:	fd043783          	ld	a5,-48(s0)
     742:	93f1                	srli	a5,a5,0x3c
     744:	00001717          	auipc	a4,0x1
     748:	0ac70713          	addi	a4,a4,172 # 17f0 <digits>
     74c:	97ba                	add	a5,a5,a4
     74e:	0007c703          	lbu	a4,0(a5)
     752:	fdc42783          	lw	a5,-36(s0)
     756:	85ba                	mv	a1,a4
     758:	853e                	mv	a0,a5
     75a:	00000097          	auipc	ra,0x0
     75e:	e64080e7          	jalr	-412(ra) # 5be <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     762:	fec42783          	lw	a5,-20(s0)
     766:	2785                	addiw	a5,a5,1
     768:	fef42623          	sw	a5,-20(s0)
     76c:	fd043783          	ld	a5,-48(s0)
     770:	0792                	slli	a5,a5,0x4
     772:	fcf43823          	sd	a5,-48(s0)
     776:	fec42783          	lw	a5,-20(s0)
     77a:	873e                	mv	a4,a5
     77c:	47bd                	li	a5,15
     77e:	fce7f0e3          	bgeu	a5,a4,73e <printptr+0x3c>
}
     782:	0001                	nop
     784:	0001                	nop
     786:	70a2                	ld	ra,40(sp)
     788:	7402                	ld	s0,32(sp)
     78a:	6145                	addi	sp,sp,48
     78c:	8082                	ret

000000000000078e <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     78e:	715d                	addi	sp,sp,-80
     790:	e486                	sd	ra,72(sp)
     792:	e0a2                	sd	s0,64(sp)
     794:	0880                	addi	s0,sp,80
     796:	87aa                	mv	a5,a0
     798:	fcb43023          	sd	a1,-64(s0)
     79c:	fac43c23          	sd	a2,-72(s0)
     7a0:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7a4:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7a8:	fe042223          	sw	zero,-28(s0)
     7ac:	a42d                	j	9d6 <vprintf+0x248>
    c = fmt[i] & 0xff;
     7ae:	fe442783          	lw	a5,-28(s0)
     7b2:	fc043703          	ld	a4,-64(s0)
     7b6:	97ba                	add	a5,a5,a4
     7b8:	0007c783          	lbu	a5,0(a5)
     7bc:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7c0:	fe042783          	lw	a5,-32(s0)
     7c4:	2781                	sext.w	a5,a5
     7c6:	eb9d                	bnez	a5,7fc <vprintf+0x6e>
      if(c == '%'){
     7c8:	fdc42783          	lw	a5,-36(s0)
     7cc:	0007871b          	sext.w	a4,a5
     7d0:	02500793          	li	a5,37
     7d4:	00f71763          	bne	a4,a5,7e2 <vprintf+0x54>
        state = '%';
     7d8:	02500793          	li	a5,37
     7dc:	fef42023          	sw	a5,-32(s0)
     7e0:	a2f5                	j	9cc <vprintf+0x23e>
      } else {
        putc(fd, c);
     7e2:	fdc42783          	lw	a5,-36(s0)
     7e6:	0ff7f713          	andi	a4,a5,255
     7ea:	fcc42783          	lw	a5,-52(s0)
     7ee:	85ba                	mv	a1,a4
     7f0:	853e                	mv	a0,a5
     7f2:	00000097          	auipc	ra,0x0
     7f6:	dcc080e7          	jalr	-564(ra) # 5be <putc>
     7fa:	aac9                	j	9cc <vprintf+0x23e>
      }
    } else if(state == '%'){
     7fc:	fe042783          	lw	a5,-32(s0)
     800:	0007871b          	sext.w	a4,a5
     804:	02500793          	li	a5,37
     808:	1cf71263          	bne	a4,a5,9cc <vprintf+0x23e>
      if(c == 'd'){
     80c:	fdc42783          	lw	a5,-36(s0)
     810:	0007871b          	sext.w	a4,a5
     814:	06400793          	li	a5,100
     818:	02f71463          	bne	a4,a5,840 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     81c:	fb843783          	ld	a5,-72(s0)
     820:	00878713          	addi	a4,a5,8
     824:	fae43c23          	sd	a4,-72(s0)
     828:	4398                	lw	a4,0(a5)
     82a:	fcc42783          	lw	a5,-52(s0)
     82e:	4685                	li	a3,1
     830:	4629                	li	a2,10
     832:	85ba                	mv	a1,a4
     834:	853e                	mv	a0,a5
     836:	00000097          	auipc	ra,0x0
     83a:	dbe080e7          	jalr	-578(ra) # 5f4 <printint>
     83e:	a269                	j	9c8 <vprintf+0x23a>
      } else if(c == 'l') {
     840:	fdc42783          	lw	a5,-36(s0)
     844:	0007871b          	sext.w	a4,a5
     848:	06c00793          	li	a5,108
     84c:	02f71663          	bne	a4,a5,878 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     850:	fb843783          	ld	a5,-72(s0)
     854:	00878713          	addi	a4,a5,8
     858:	fae43c23          	sd	a4,-72(s0)
     85c:	639c                	ld	a5,0(a5)
     85e:	0007871b          	sext.w	a4,a5
     862:	fcc42783          	lw	a5,-52(s0)
     866:	4681                	li	a3,0
     868:	4629                	li	a2,10
     86a:	85ba                	mv	a1,a4
     86c:	853e                	mv	a0,a5
     86e:	00000097          	auipc	ra,0x0
     872:	d86080e7          	jalr	-634(ra) # 5f4 <printint>
     876:	aa89                	j	9c8 <vprintf+0x23a>
      } else if(c == 'x') {
     878:	fdc42783          	lw	a5,-36(s0)
     87c:	0007871b          	sext.w	a4,a5
     880:	07800793          	li	a5,120
     884:	02f71463          	bne	a4,a5,8ac <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     888:	fb843783          	ld	a5,-72(s0)
     88c:	00878713          	addi	a4,a5,8
     890:	fae43c23          	sd	a4,-72(s0)
     894:	4398                	lw	a4,0(a5)
     896:	fcc42783          	lw	a5,-52(s0)
     89a:	4681                	li	a3,0
     89c:	4641                	li	a2,16
     89e:	85ba                	mv	a1,a4
     8a0:	853e                	mv	a0,a5
     8a2:	00000097          	auipc	ra,0x0
     8a6:	d52080e7          	jalr	-686(ra) # 5f4 <printint>
     8aa:	aa39                	j	9c8 <vprintf+0x23a>
      } else if(c == 'p') {
     8ac:	fdc42783          	lw	a5,-36(s0)
     8b0:	0007871b          	sext.w	a4,a5
     8b4:	07000793          	li	a5,112
     8b8:	02f71263          	bne	a4,a5,8dc <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8bc:	fb843783          	ld	a5,-72(s0)
     8c0:	00878713          	addi	a4,a5,8
     8c4:	fae43c23          	sd	a4,-72(s0)
     8c8:	6398                	ld	a4,0(a5)
     8ca:	fcc42783          	lw	a5,-52(s0)
     8ce:	85ba                	mv	a1,a4
     8d0:	853e                	mv	a0,a5
     8d2:	00000097          	auipc	ra,0x0
     8d6:	e30080e7          	jalr	-464(ra) # 702 <printptr>
     8da:	a0fd                	j	9c8 <vprintf+0x23a>
      } else if(c == 's'){
     8dc:	fdc42783          	lw	a5,-36(s0)
     8e0:	0007871b          	sext.w	a4,a5
     8e4:	07300793          	li	a5,115
     8e8:	04f71c63          	bne	a4,a5,940 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     8ec:	fb843783          	ld	a5,-72(s0)
     8f0:	00878713          	addi	a4,a5,8
     8f4:	fae43c23          	sd	a4,-72(s0)
     8f8:	639c                	ld	a5,0(a5)
     8fa:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     8fe:	fe843783          	ld	a5,-24(s0)
     902:	eb8d                	bnez	a5,934 <vprintf+0x1a6>
          s = "(null)";
     904:	00001797          	auipc	a5,0x1
     908:	ee478793          	addi	a5,a5,-284 # 17e8 <schedule_dm+0x28c>
     90c:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     910:	a015                	j	934 <vprintf+0x1a6>
          putc(fd, *s);
     912:	fe843783          	ld	a5,-24(s0)
     916:	0007c703          	lbu	a4,0(a5)
     91a:	fcc42783          	lw	a5,-52(s0)
     91e:	85ba                	mv	a1,a4
     920:	853e                	mv	a0,a5
     922:	00000097          	auipc	ra,0x0
     926:	c9c080e7          	jalr	-868(ra) # 5be <putc>
          s++;
     92a:	fe843783          	ld	a5,-24(s0)
     92e:	0785                	addi	a5,a5,1
     930:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     934:	fe843783          	ld	a5,-24(s0)
     938:	0007c783          	lbu	a5,0(a5)
     93c:	fbf9                	bnez	a5,912 <vprintf+0x184>
     93e:	a069                	j	9c8 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     940:	fdc42783          	lw	a5,-36(s0)
     944:	0007871b          	sext.w	a4,a5
     948:	06300793          	li	a5,99
     94c:	02f71463          	bne	a4,a5,974 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     950:	fb843783          	ld	a5,-72(s0)
     954:	00878713          	addi	a4,a5,8
     958:	fae43c23          	sd	a4,-72(s0)
     95c:	439c                	lw	a5,0(a5)
     95e:	0ff7f713          	andi	a4,a5,255
     962:	fcc42783          	lw	a5,-52(s0)
     966:	85ba                	mv	a1,a4
     968:	853e                	mv	a0,a5
     96a:	00000097          	auipc	ra,0x0
     96e:	c54080e7          	jalr	-940(ra) # 5be <putc>
     972:	a899                	j	9c8 <vprintf+0x23a>
      } else if(c == '%'){
     974:	fdc42783          	lw	a5,-36(s0)
     978:	0007871b          	sext.w	a4,a5
     97c:	02500793          	li	a5,37
     980:	00f71f63          	bne	a4,a5,99e <vprintf+0x210>
        putc(fd, c);
     984:	fdc42783          	lw	a5,-36(s0)
     988:	0ff7f713          	andi	a4,a5,255
     98c:	fcc42783          	lw	a5,-52(s0)
     990:	85ba                	mv	a1,a4
     992:	853e                	mv	a0,a5
     994:	00000097          	auipc	ra,0x0
     998:	c2a080e7          	jalr	-982(ra) # 5be <putc>
     99c:	a035                	j	9c8 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     99e:	fcc42783          	lw	a5,-52(s0)
     9a2:	02500593          	li	a1,37
     9a6:	853e                	mv	a0,a5
     9a8:	00000097          	auipc	ra,0x0
     9ac:	c16080e7          	jalr	-1002(ra) # 5be <putc>
        putc(fd, c);
     9b0:	fdc42783          	lw	a5,-36(s0)
     9b4:	0ff7f713          	andi	a4,a5,255
     9b8:	fcc42783          	lw	a5,-52(s0)
     9bc:	85ba                	mv	a1,a4
     9be:	853e                	mv	a0,a5
     9c0:	00000097          	auipc	ra,0x0
     9c4:	bfe080e7          	jalr	-1026(ra) # 5be <putc>
      }
      state = 0;
     9c8:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     9cc:	fe442783          	lw	a5,-28(s0)
     9d0:	2785                	addiw	a5,a5,1
     9d2:	fef42223          	sw	a5,-28(s0)
     9d6:	fe442783          	lw	a5,-28(s0)
     9da:	fc043703          	ld	a4,-64(s0)
     9de:	97ba                	add	a5,a5,a4
     9e0:	0007c783          	lbu	a5,0(a5)
     9e4:	dc0795e3          	bnez	a5,7ae <vprintf+0x20>
    }
  }
}
     9e8:	0001                	nop
     9ea:	0001                	nop
     9ec:	60a6                	ld	ra,72(sp)
     9ee:	6406                	ld	s0,64(sp)
     9f0:	6161                	addi	sp,sp,80
     9f2:	8082                	ret

00000000000009f4 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     9f4:	7159                	addi	sp,sp,-112
     9f6:	fc06                	sd	ra,56(sp)
     9f8:	f822                	sd	s0,48(sp)
     9fa:	0080                	addi	s0,sp,64
     9fc:	fcb43823          	sd	a1,-48(s0)
     a00:	e010                	sd	a2,0(s0)
     a02:	e414                	sd	a3,8(s0)
     a04:	e818                	sd	a4,16(s0)
     a06:	ec1c                	sd	a5,24(s0)
     a08:	03043023          	sd	a6,32(s0)
     a0c:	03143423          	sd	a7,40(s0)
     a10:	87aa                	mv	a5,a0
     a12:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a16:	03040793          	addi	a5,s0,48
     a1a:	fcf43423          	sd	a5,-56(s0)
     a1e:	fc843783          	ld	a5,-56(s0)
     a22:	fd078793          	addi	a5,a5,-48
     a26:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a2a:	fe843703          	ld	a4,-24(s0)
     a2e:	fdc42783          	lw	a5,-36(s0)
     a32:	863a                	mv	a2,a4
     a34:	fd043583          	ld	a1,-48(s0)
     a38:	853e                	mv	a0,a5
     a3a:	00000097          	auipc	ra,0x0
     a3e:	d54080e7          	jalr	-684(ra) # 78e <vprintf>
}
     a42:	0001                	nop
     a44:	70e2                	ld	ra,56(sp)
     a46:	7442                	ld	s0,48(sp)
     a48:	6165                	addi	sp,sp,112
     a4a:	8082                	ret

0000000000000a4c <printf>:

void
printf(const char *fmt, ...)
{
     a4c:	7159                	addi	sp,sp,-112
     a4e:	f406                	sd	ra,40(sp)
     a50:	f022                	sd	s0,32(sp)
     a52:	1800                	addi	s0,sp,48
     a54:	fca43c23          	sd	a0,-40(s0)
     a58:	e40c                	sd	a1,8(s0)
     a5a:	e810                	sd	a2,16(s0)
     a5c:	ec14                	sd	a3,24(s0)
     a5e:	f018                	sd	a4,32(s0)
     a60:	f41c                	sd	a5,40(s0)
     a62:	03043823          	sd	a6,48(s0)
     a66:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a6a:	04040793          	addi	a5,s0,64
     a6e:	fcf43823          	sd	a5,-48(s0)
     a72:	fd043783          	ld	a5,-48(s0)
     a76:	fc878793          	addi	a5,a5,-56
     a7a:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     a7e:	fe843783          	ld	a5,-24(s0)
     a82:	863e                	mv	a2,a5
     a84:	fd843583          	ld	a1,-40(s0)
     a88:	4505                	li	a0,1
     a8a:	00000097          	auipc	ra,0x0
     a8e:	d04080e7          	jalr	-764(ra) # 78e <vprintf>
}
     a92:	0001                	nop
     a94:	70a2                	ld	ra,40(sp)
     a96:	7402                	ld	s0,32(sp)
     a98:	6165                	addi	sp,sp,112
     a9a:	8082                	ret

0000000000000a9c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     a9c:	7179                	addi	sp,sp,-48
     a9e:	f422                	sd	s0,40(sp)
     aa0:	1800                	addi	s0,sp,48
     aa2:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     aa6:	fd843783          	ld	a5,-40(s0)
     aaa:	17c1                	addi	a5,a5,-16
     aac:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ab0:	00001797          	auipc	a5,0x1
     ab4:	d6878793          	addi	a5,a5,-664 # 1818 <freep>
     ab8:	639c                	ld	a5,0(a5)
     aba:	fef43423          	sd	a5,-24(s0)
     abe:	a815                	j	af2 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ac0:	fe843783          	ld	a5,-24(s0)
     ac4:	639c                	ld	a5,0(a5)
     ac6:	fe843703          	ld	a4,-24(s0)
     aca:	00f76f63          	bltu	a4,a5,ae8 <free+0x4c>
     ace:	fe043703          	ld	a4,-32(s0)
     ad2:	fe843783          	ld	a5,-24(s0)
     ad6:	02e7eb63          	bltu	a5,a4,b0c <free+0x70>
     ada:	fe843783          	ld	a5,-24(s0)
     ade:	639c                	ld	a5,0(a5)
     ae0:	fe043703          	ld	a4,-32(s0)
     ae4:	02f76463          	bltu	a4,a5,b0c <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ae8:	fe843783          	ld	a5,-24(s0)
     aec:	639c                	ld	a5,0(a5)
     aee:	fef43423          	sd	a5,-24(s0)
     af2:	fe043703          	ld	a4,-32(s0)
     af6:	fe843783          	ld	a5,-24(s0)
     afa:	fce7f3e3          	bgeu	a5,a4,ac0 <free+0x24>
     afe:	fe843783          	ld	a5,-24(s0)
     b02:	639c                	ld	a5,0(a5)
     b04:	fe043703          	ld	a4,-32(s0)
     b08:	faf77ce3          	bgeu	a4,a5,ac0 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b0c:	fe043783          	ld	a5,-32(s0)
     b10:	479c                	lw	a5,8(a5)
     b12:	1782                	slli	a5,a5,0x20
     b14:	9381                	srli	a5,a5,0x20
     b16:	0792                	slli	a5,a5,0x4
     b18:	fe043703          	ld	a4,-32(s0)
     b1c:	973e                	add	a4,a4,a5
     b1e:	fe843783          	ld	a5,-24(s0)
     b22:	639c                	ld	a5,0(a5)
     b24:	02f71763          	bne	a4,a5,b52 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b28:	fe043783          	ld	a5,-32(s0)
     b2c:	4798                	lw	a4,8(a5)
     b2e:	fe843783          	ld	a5,-24(s0)
     b32:	639c                	ld	a5,0(a5)
     b34:	479c                	lw	a5,8(a5)
     b36:	9fb9                	addw	a5,a5,a4
     b38:	0007871b          	sext.w	a4,a5
     b3c:	fe043783          	ld	a5,-32(s0)
     b40:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b42:	fe843783          	ld	a5,-24(s0)
     b46:	639c                	ld	a5,0(a5)
     b48:	6398                	ld	a4,0(a5)
     b4a:	fe043783          	ld	a5,-32(s0)
     b4e:	e398                	sd	a4,0(a5)
     b50:	a039                	j	b5e <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b52:	fe843783          	ld	a5,-24(s0)
     b56:	6398                	ld	a4,0(a5)
     b58:	fe043783          	ld	a5,-32(s0)
     b5c:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b5e:	fe843783          	ld	a5,-24(s0)
     b62:	479c                	lw	a5,8(a5)
     b64:	1782                	slli	a5,a5,0x20
     b66:	9381                	srli	a5,a5,0x20
     b68:	0792                	slli	a5,a5,0x4
     b6a:	fe843703          	ld	a4,-24(s0)
     b6e:	97ba                	add	a5,a5,a4
     b70:	fe043703          	ld	a4,-32(s0)
     b74:	02f71563          	bne	a4,a5,b9e <free+0x102>
    p->s.size += bp->s.size;
     b78:	fe843783          	ld	a5,-24(s0)
     b7c:	4798                	lw	a4,8(a5)
     b7e:	fe043783          	ld	a5,-32(s0)
     b82:	479c                	lw	a5,8(a5)
     b84:	9fb9                	addw	a5,a5,a4
     b86:	0007871b          	sext.w	a4,a5
     b8a:	fe843783          	ld	a5,-24(s0)
     b8e:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     b90:	fe043783          	ld	a5,-32(s0)
     b94:	6398                	ld	a4,0(a5)
     b96:	fe843783          	ld	a5,-24(s0)
     b9a:	e398                	sd	a4,0(a5)
     b9c:	a031                	j	ba8 <free+0x10c>
  } else
    p->s.ptr = bp;
     b9e:	fe843783          	ld	a5,-24(s0)
     ba2:	fe043703          	ld	a4,-32(s0)
     ba6:	e398                	sd	a4,0(a5)
  freep = p;
     ba8:	00001797          	auipc	a5,0x1
     bac:	c7078793          	addi	a5,a5,-912 # 1818 <freep>
     bb0:	fe843703          	ld	a4,-24(s0)
     bb4:	e398                	sd	a4,0(a5)
}
     bb6:	0001                	nop
     bb8:	7422                	ld	s0,40(sp)
     bba:	6145                	addi	sp,sp,48
     bbc:	8082                	ret

0000000000000bbe <morecore>:

static Header*
morecore(uint nu)
{
     bbe:	7179                	addi	sp,sp,-48
     bc0:	f406                	sd	ra,40(sp)
     bc2:	f022                	sd	s0,32(sp)
     bc4:	1800                	addi	s0,sp,48
     bc6:	87aa                	mv	a5,a0
     bc8:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     bcc:	fdc42783          	lw	a5,-36(s0)
     bd0:	0007871b          	sext.w	a4,a5
     bd4:	6785                	lui	a5,0x1
     bd6:	00f77563          	bgeu	a4,a5,be0 <morecore+0x22>
    nu = 4096;
     bda:	6785                	lui	a5,0x1
     bdc:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     be0:	fdc42783          	lw	a5,-36(s0)
     be4:	0047979b          	slliw	a5,a5,0x4
     be8:	2781                	sext.w	a5,a5
     bea:	2781                	sext.w	a5,a5
     bec:	853e                	mv	a0,a5
     bee:	00000097          	auipc	ra,0x0
     bf2:	9a0080e7          	jalr	-1632(ra) # 58e <sbrk>
     bf6:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     bfa:	fe843703          	ld	a4,-24(s0)
     bfe:	57fd                	li	a5,-1
     c00:	00f71463          	bne	a4,a5,c08 <morecore+0x4a>
    return 0;
     c04:	4781                	li	a5,0
     c06:	a03d                	j	c34 <morecore+0x76>
  hp = (Header*)p;
     c08:	fe843783          	ld	a5,-24(s0)
     c0c:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c10:	fe043783          	ld	a5,-32(s0)
     c14:	fdc42703          	lw	a4,-36(s0)
     c18:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c1a:	fe043783          	ld	a5,-32(s0)
     c1e:	07c1                	addi	a5,a5,16
     c20:	853e                	mv	a0,a5
     c22:	00000097          	auipc	ra,0x0
     c26:	e7a080e7          	jalr	-390(ra) # a9c <free>
  return freep;
     c2a:	00001797          	auipc	a5,0x1
     c2e:	bee78793          	addi	a5,a5,-1042 # 1818 <freep>
     c32:	639c                	ld	a5,0(a5)
}
     c34:	853e                	mv	a0,a5
     c36:	70a2                	ld	ra,40(sp)
     c38:	7402                	ld	s0,32(sp)
     c3a:	6145                	addi	sp,sp,48
     c3c:	8082                	ret

0000000000000c3e <malloc>:

void*
malloc(uint nbytes)
{
     c3e:	7139                	addi	sp,sp,-64
     c40:	fc06                	sd	ra,56(sp)
     c42:	f822                	sd	s0,48(sp)
     c44:	0080                	addi	s0,sp,64
     c46:	87aa                	mv	a5,a0
     c48:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c4c:	fcc46783          	lwu	a5,-52(s0)
     c50:	07bd                	addi	a5,a5,15
     c52:	8391                	srli	a5,a5,0x4
     c54:	2781                	sext.w	a5,a5
     c56:	2785                	addiw	a5,a5,1
     c58:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c5c:	00001797          	auipc	a5,0x1
     c60:	bbc78793          	addi	a5,a5,-1092 # 1818 <freep>
     c64:	639c                	ld	a5,0(a5)
     c66:	fef43023          	sd	a5,-32(s0)
     c6a:	fe043783          	ld	a5,-32(s0)
     c6e:	ef95                	bnez	a5,caa <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     c70:	00001797          	auipc	a5,0x1
     c74:	b9878793          	addi	a5,a5,-1128 # 1808 <base>
     c78:	fef43023          	sd	a5,-32(s0)
     c7c:	00001797          	auipc	a5,0x1
     c80:	b9c78793          	addi	a5,a5,-1124 # 1818 <freep>
     c84:	fe043703          	ld	a4,-32(s0)
     c88:	e398                	sd	a4,0(a5)
     c8a:	00001797          	auipc	a5,0x1
     c8e:	b8e78793          	addi	a5,a5,-1138 # 1818 <freep>
     c92:	6398                	ld	a4,0(a5)
     c94:	00001797          	auipc	a5,0x1
     c98:	b7478793          	addi	a5,a5,-1164 # 1808 <base>
     c9c:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     c9e:	00001797          	auipc	a5,0x1
     ca2:	b6a78793          	addi	a5,a5,-1174 # 1808 <base>
     ca6:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     caa:	fe043783          	ld	a5,-32(s0)
     cae:	639c                	ld	a5,0(a5)
     cb0:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     cb4:	fe843783          	ld	a5,-24(s0)
     cb8:	4798                	lw	a4,8(a5)
     cba:	fdc42783          	lw	a5,-36(s0)
     cbe:	2781                	sext.w	a5,a5
     cc0:	06f76863          	bltu	a4,a5,d30 <malloc+0xf2>
      if(p->s.size == nunits)
     cc4:	fe843783          	ld	a5,-24(s0)
     cc8:	4798                	lw	a4,8(a5)
     cca:	fdc42783          	lw	a5,-36(s0)
     cce:	2781                	sext.w	a5,a5
     cd0:	00e79963          	bne	a5,a4,ce2 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     cd4:	fe843783          	ld	a5,-24(s0)
     cd8:	6398                	ld	a4,0(a5)
     cda:	fe043783          	ld	a5,-32(s0)
     cde:	e398                	sd	a4,0(a5)
     ce0:	a82d                	j	d1a <malloc+0xdc>
      else {
        p->s.size -= nunits;
     ce2:	fe843783          	ld	a5,-24(s0)
     ce6:	4798                	lw	a4,8(a5)
     ce8:	fdc42783          	lw	a5,-36(s0)
     cec:	40f707bb          	subw	a5,a4,a5
     cf0:	0007871b          	sext.w	a4,a5
     cf4:	fe843783          	ld	a5,-24(s0)
     cf8:	c798                	sw	a4,8(a5)
        p += p->s.size;
     cfa:	fe843783          	ld	a5,-24(s0)
     cfe:	479c                	lw	a5,8(a5)
     d00:	1782                	slli	a5,a5,0x20
     d02:	9381                	srli	a5,a5,0x20
     d04:	0792                	slli	a5,a5,0x4
     d06:	fe843703          	ld	a4,-24(s0)
     d0a:	97ba                	add	a5,a5,a4
     d0c:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d10:	fe843783          	ld	a5,-24(s0)
     d14:	fdc42703          	lw	a4,-36(s0)
     d18:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d1a:	00001797          	auipc	a5,0x1
     d1e:	afe78793          	addi	a5,a5,-1282 # 1818 <freep>
     d22:	fe043703          	ld	a4,-32(s0)
     d26:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d28:	fe843783          	ld	a5,-24(s0)
     d2c:	07c1                	addi	a5,a5,16
     d2e:	a091                	j	d72 <malloc+0x134>
    }
    if(p == freep)
     d30:	00001797          	auipc	a5,0x1
     d34:	ae878793          	addi	a5,a5,-1304 # 1818 <freep>
     d38:	639c                	ld	a5,0(a5)
     d3a:	fe843703          	ld	a4,-24(s0)
     d3e:	02f71063          	bne	a4,a5,d5e <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d42:	fdc42783          	lw	a5,-36(s0)
     d46:	853e                	mv	a0,a5
     d48:	00000097          	auipc	ra,0x0
     d4c:	e76080e7          	jalr	-394(ra) # bbe <morecore>
     d50:	fea43423          	sd	a0,-24(s0)
     d54:	fe843783          	ld	a5,-24(s0)
     d58:	e399                	bnez	a5,d5e <malloc+0x120>
        return 0;
     d5a:	4781                	li	a5,0
     d5c:	a819                	j	d72 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d5e:	fe843783          	ld	a5,-24(s0)
     d62:	fef43023          	sd	a5,-32(s0)
     d66:	fe843783          	ld	a5,-24(s0)
     d6a:	639c                	ld	a5,0(a5)
     d6c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d70:	b791                	j	cb4 <malloc+0x76>
  }
}
     d72:	853e                	mv	a0,a5
     d74:	70e2                	ld	ra,56(sp)
     d76:	7442                	ld	s0,48(sp)
     d78:	6121                	addi	sp,sp,64
     d7a:	8082                	ret

0000000000000d7c <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     d7c:	1101                	addi	sp,sp,-32
     d7e:	ec22                	sd	s0,24(sp)
     d80:	1000                	addi	s0,sp,32
     d82:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     d86:	fe843783          	ld	a5,-24(s0)
     d8a:	639c                	ld	a5,0(a5)
     d8c:	fe843703          	ld	a4,-24(s0)
     d90:	40f707b3          	sub	a5,a4,a5
     d94:	0017b793          	seqz	a5,a5
     d98:	0ff7f793          	andi	a5,a5,255
     d9c:	2781                	sext.w	a5,a5
}
     d9e:	853e                	mv	a0,a5
     da0:	6462                	ld	s0,24(sp)
     da2:	6105                	addi	sp,sp,32
     da4:	8082                	ret

0000000000000da6 <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
     da6:	715d                	addi	sp,sp,-80
     da8:	e4a2                	sd	s0,72(sp)
     daa:	e0a6                	sd	s1,64(sp)
     dac:	0880                	addi	s0,sp,80
     dae:	84aa                	mv	s1,a0
    int sleep_time = -1;
     db0:	57fd                	li	a5,-1
     db2:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
     db6:	689c                	ld	a5,16(s1)
     db8:	639c                	ld	a5,0(a5)
     dba:	fcf43c23          	sd	a5,-40(s0)
     dbe:	fd843783          	ld	a5,-40(s0)
     dc2:	17e1                	addi	a5,a5,-8
     dc4:	fef43023          	sd	a5,-32(s0)
     dc8:	a0a9                	j	e12 <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
     dca:	fec42783          	lw	a5,-20(s0)
     dce:	2781                	sext.w	a5,a5
     dd0:	0007cf63          	bltz	a5,dee <fill_sparse+0x48>
     dd4:	fe043783          	ld	a5,-32(s0)
     dd8:	4f98                	lw	a4,24(a5)
     dda:	409c                	lw	a5,0(s1)
     ddc:	40f707bb          	subw	a5,a4,a5
     de0:	0007871b          	sext.w	a4,a5
     de4:	fec42783          	lw	a5,-20(s0)
     de8:	2781                	sext.w	a5,a5
     dea:	00f75a63          	bge	a4,a5,dfe <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
     dee:	fe043783          	ld	a5,-32(s0)
     df2:	4f98                	lw	a4,24(a5)
     df4:	409c                	lw	a5,0(s1)
     df6:	40f707bb          	subw	a5,a4,a5
     dfa:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
     dfe:	fe043783          	ld	a5,-32(s0)
     e02:	679c                	ld	a5,8(a5)
     e04:	fcf43823          	sd	a5,-48(s0)
     e08:	fd043783          	ld	a5,-48(s0)
     e0c:	17e1                	addi	a5,a5,-8
     e0e:	fef43023          	sd	a5,-32(s0)
     e12:	fe043783          	ld	a5,-32(s0)
     e16:	00878713          	addi	a4,a5,8
     e1a:	689c                	ld	a5,16(s1)
     e1c:	faf717e3          	bne	a4,a5,dca <fill_sparse+0x24>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = args.run_queue;
     e20:	649c                	ld	a5,8(s1)
     e22:	faf43823          	sd	a5,-80(s0)
    r.allocated_time = sleep_time;
     e26:	fec42783          	lw	a5,-20(s0)
     e2a:	faf42c23          	sw	a5,-72(s0)
    return r;    
     e2e:	fb043783          	ld	a5,-80(s0)
     e32:	fcf43023          	sd	a5,-64(s0)
     e36:	fb843783          	ld	a5,-72(s0)
     e3a:	fcf43423          	sd	a5,-56(s0)
     e3e:	4701                	li	a4,0
     e40:	fc043703          	ld	a4,-64(s0)
     e44:	4781                	li	a5,0
     e46:	fc843783          	ld	a5,-56(s0)
     e4a:	863a                	mv	a2,a4
     e4c:	86be                	mv	a3,a5
     e4e:	8732                	mv	a4,a2
     e50:	87b6                	mv	a5,a3
}
     e52:	853a                	mv	a0,a4
     e54:	85be                	mv	a1,a5
     e56:	6426                	ld	s0,72(sp)
     e58:	6486                	ld	s1,64(sp)
     e5a:	6161                	addi	sp,sp,80
     e5c:	8082                	ret

0000000000000e5e <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
     e5e:	715d                	addi	sp,sp,-80
     e60:	e4a2                	sd	s0,72(sp)
     e62:	e0a6                	sd	s1,64(sp)
     e64:	0880                	addi	s0,sp,80
     e66:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
     e68:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
     e6c:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     e70:	649c                	ld	a5,8(s1)
     e72:	639c                	ld	a5,0(a5)
     e74:	fcf43c23          	sd	a5,-40(s0)
     e78:	fd843783          	ld	a5,-40(s0)
     e7c:	fd878793          	addi	a5,a5,-40
     e80:	fef43023          	sd	a5,-32(s0)
     e84:	a81d                	j	eba <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
     e86:	fe843783          	ld	a5,-24(s0)
     e8a:	cb89                	beqz	a5,e9c <schedule_default+0x3e>
     e8c:	fe043783          	ld	a5,-32(s0)
     e90:	5fd8                	lw	a4,60(a5)
     e92:	fe843783          	ld	a5,-24(s0)
     e96:	5fdc                	lw	a5,60(a5)
     e98:	00f75663          	bge	a4,a5,ea4 <schedule_default+0x46>
            thread_with_smallest_id = th;
     e9c:	fe043783          	ld	a5,-32(s0)
     ea0:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     ea4:	fe043783          	ld	a5,-32(s0)
     ea8:	779c                	ld	a5,40(a5)
     eaa:	fcf43823          	sd	a5,-48(s0)
     eae:	fd043783          	ld	a5,-48(s0)
     eb2:	fd878793          	addi	a5,a5,-40
     eb6:	fef43023          	sd	a5,-32(s0)
     eba:	fe043783          	ld	a5,-32(s0)
     ebe:	02878713          	addi	a4,a5,40
     ec2:	649c                	ld	a5,8(s1)
     ec4:	fcf711e3          	bne	a4,a5,e86 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
     ec8:	fe843783          	ld	a5,-24(s0)
     ecc:	cf89                	beqz	a5,ee6 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
     ece:	fe843783          	ld	a5,-24(s0)
     ed2:	02878793          	addi	a5,a5,40
     ed6:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
     eda:	fe843783          	ld	a5,-24(s0)
     ede:	4fbc                	lw	a5,88(a5)
     ee0:	faf42c23          	sw	a5,-72(s0)
     ee4:	a039                	j	ef2 <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
     ee6:	649c                	ld	a5,8(s1)
     ee8:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
     eec:	4785                	li	a5,1
     eee:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
     ef2:	fb043783          	ld	a5,-80(s0)
     ef6:	fcf43023          	sd	a5,-64(s0)
     efa:	fb843783          	ld	a5,-72(s0)
     efe:	fcf43423          	sd	a5,-56(s0)
     f02:	4701                	li	a4,0
     f04:	fc043703          	ld	a4,-64(s0)
     f08:	4781                	li	a5,0
     f0a:	fc843783          	ld	a5,-56(s0)
     f0e:	863a                	mv	a2,a4
     f10:	86be                	mv	a3,a5
     f12:	8732                	mv	a4,a2
     f14:	87b6                	mv	a5,a3
}
     f16:	853a                	mv	a0,a4
     f18:	85be                	mv	a1,a5
     f1a:	6426                	ld	s0,72(sp)
     f1c:	6486                	ld	s1,64(sp)
     f1e:	6161                	addi	sp,sp,80
     f20:	8082                	ret

0000000000000f22 <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
     f22:	7135                	addi	sp,sp,-160
     f24:	ed06                	sd	ra,152(sp)
     f26:	e922                	sd	s0,144(sp)
     f28:	e526                	sd	s1,136(sp)
     f2a:	e14a                	sd	s2,128(sp)
     f2c:	fcce                	sd	s3,120(sp)
     f2e:	1100                	addi	s0,sp,160
     f30:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
     f32:	649c                	ld	a5,8(s1)
     f34:	853e                	mv	a0,a5
     f36:	00000097          	auipc	ra,0x0
     f3a:	e46080e7          	jalr	-442(ra) # d7c <list_empty>
     f3e:	87aa                	mv	a5,a0
     f40:	cb85                	beqz	a5,f70 <schedule_wrr+0x4e>
        return fill_sparse(args);
     f42:	609c                	ld	a5,0(s1)
     f44:	f6f43023          	sd	a5,-160(s0)
     f48:	649c                	ld	a5,8(s1)
     f4a:	f6f43423          	sd	a5,-152(s0)
     f4e:	689c                	ld	a5,16(s1)
     f50:	f6f43823          	sd	a5,-144(s0)
     f54:	f6040793          	addi	a5,s0,-160
     f58:	853e                	mv	a0,a5
     f5a:	00000097          	auipc	ra,0x0
     f5e:	e4c080e7          	jalr	-436(ra) # da6 <fill_sparse>
     f62:	872a                	mv	a4,a0
     f64:	87ae                	mv	a5,a1
     f66:	f8e43823          	sd	a4,-112(s0)
     f6a:	f8f43c23          	sd	a5,-104(s0)
     f6e:	a0c9                	j	1030 <schedule_wrr+0x10e>

    struct thread *process_thread = NULL;
     f70:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
     f74:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     f78:	649c                	ld	a5,8(s1)
     f7a:	639c                	ld	a5,0(a5)
     f7c:	faf43823          	sd	a5,-80(s0)
     f80:	fb043783          	ld	a5,-80(s0)
     f84:	fd878793          	addi	a5,a5,-40
     f88:	fcf43023          	sd	a5,-64(s0)
     f8c:	a025                	j	fb4 <schedule_wrr+0x92>
        if (process_thread == NULL) {
     f8e:	fc843783          	ld	a5,-56(s0)
     f92:	e791                	bnez	a5,f9e <schedule_wrr+0x7c>
            process_thread = th;
     f94:	fc043783          	ld	a5,-64(s0)
     f98:	fcf43423          	sd	a5,-56(s0)
            break;
     f9c:	a01d                	j	fc2 <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
     f9e:	fc043783          	ld	a5,-64(s0)
     fa2:	779c                	ld	a5,40(a5)
     fa4:	faf43423          	sd	a5,-88(s0)
     fa8:	fa843783          	ld	a5,-88(s0)
     fac:	fd878793          	addi	a5,a5,-40
     fb0:	fcf43023          	sd	a5,-64(s0)
     fb4:	fc043783          	ld	a5,-64(s0)
     fb8:	02878713          	addi	a4,a5,40
     fbc:	649c                	ld	a5,8(s1)
     fbe:	fcf718e3          	bne	a4,a5,f8e <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
     fc2:	40dc                	lw	a5,4(s1)
     fc4:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
     fc8:	fc843783          	ld	a5,-56(s0)
     fcc:	4fbc                	lw	a5,88(a5)
     fce:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
     fd2:	fc843783          	ld	a5,-56(s0)
     fd6:	4fb4                	lw	a3,88(a5)
     fd8:	fc843783          	ld	a5,-56(s0)
     fdc:	47bc                	lw	a5,72(a5)
     fde:	fa442703          	lw	a4,-92(s0)
     fe2:	02f707bb          	mulw	a5,a4,a5
     fe6:	2781                	sext.w	a5,a5
     fe8:	8736                	mv	a4,a3
     fea:	00e7dc63          	bge	a5,a4,1002 <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
     fee:	fc843783          	ld	a5,-56(s0)
     ff2:	47bc                	lw	a5,72(a5)
     ff4:	fa442703          	lw	a4,-92(s0)
     ff8:	02f707bb          	mulw	a5,a4,a5
     ffc:	faf42e23          	sw	a5,-68(s0)
    1000:	a031                	j	100c <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    1002:	fc843783          	ld	a5,-56(s0)
    1006:	4fbc                	lw	a5,88(a5)
    1008:	faf42e23          	sw	a5,-68(s0)
    }
    
    struct threads_sched_result r;
    r.scheduled_thread_list_member = &process_thread->thread_list;
    100c:	fc843783          	ld	a5,-56(s0)
    1010:	02878793          	addi	a5,a5,40
    1014:	f8f43023          	sd	a5,-128(s0)
    r.allocated_time = executing_time;
    1018:	fbc42783          	lw	a5,-68(s0)
    101c:	f8f42423          	sw	a5,-120(s0)
    return r;
    1020:	f8043783          	ld	a5,-128(s0)
    1024:	f8f43823          	sd	a5,-112(s0)
    1028:	f8843783          	ld	a5,-120(s0)
    102c:	f8f43c23          	sd	a5,-104(s0)
    1030:	4701                	li	a4,0
    1032:	f9043703          	ld	a4,-112(s0)
    1036:	4781                	li	a5,0
    1038:	f9843783          	ld	a5,-104(s0)
    103c:	893a                	mv	s2,a4
    103e:	89be                	mv	s3,a5
    1040:	874a                	mv	a4,s2
    1042:	87ce                	mv	a5,s3
}
    1044:	853a                	mv	a0,a4
    1046:	85be                	mv	a1,a5
    1048:	60ea                	ld	ra,152(sp)
    104a:	644a                	ld	s0,144(sp)
    104c:	64aa                	ld	s1,136(sp)
    104e:	690a                	ld	s2,128(sp)
    1050:	79e6                	ld	s3,120(sp)
    1052:	610d                	addi	sp,sp,160
    1054:	8082                	ret

0000000000001056 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    1056:	7131                	addi	sp,sp,-192
    1058:	fd06                	sd	ra,184(sp)
    105a:	f922                	sd	s0,176(sp)
    105c:	f526                	sd	s1,168(sp)
    105e:	f14a                	sd	s2,160(sp)
    1060:	ed4e                	sd	s3,152(sp)
    1062:	0180                	addi	s0,sp,192
    1064:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    1066:	649c                	ld	a5,8(s1)
    1068:	853e                	mv	a0,a5
    106a:	00000097          	auipc	ra,0x0
    106e:	d12080e7          	jalr	-750(ra) # d7c <list_empty>
    1072:	87aa                	mv	a5,a0
    1074:	cb85                	beqz	a5,10a4 <schedule_sjf+0x4e>
        return fill_sparse(args);
    1076:	609c                	ld	a5,0(s1)
    1078:	f4f43023          	sd	a5,-192(s0)
    107c:	649c                	ld	a5,8(s1)
    107e:	f4f43423          	sd	a5,-184(s0)
    1082:	689c                	ld	a5,16(s1)
    1084:	f4f43823          	sd	a5,-176(s0)
    1088:	f4040793          	addi	a5,s0,-192
    108c:	853e                	mv	a0,a5
    108e:	00000097          	auipc	ra,0x0
    1092:	d18080e7          	jalr	-744(ra) # da6 <fill_sparse>
    1096:	872a                	mv	a4,a0
    1098:	87ae                	mv	a5,a1
    109a:	f6e43c23          	sd	a4,-136(s0)
    109e:	f8f43023          	sd	a5,-128(s0)
    10a2:	aa49                	j	1234 <schedule_sjf+0x1de>

    int current_time = args.current_time;
    10a4:	409c                	lw	a5,0(s1)
    10a6:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    10aa:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    10ae:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    10b2:	649c                	ld	a5,8(s1)
    10b4:	639c                	ld	a5,0(a5)
    10b6:	faf43423          	sd	a5,-88(s0)
    10ba:	fa843783          	ld	a5,-88(s0)
    10be:	fd878793          	addi	a5,a5,-40
    10c2:	fcf43023          	sd	a5,-64(s0)
    10c6:	a085                	j	1126 <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    10c8:	fc843783          	ld	a5,-56(s0)
    10cc:	cb89                	beqz	a5,10de <schedule_sjf+0x88>
    10ce:	fc043783          	ld	a5,-64(s0)
    10d2:	4fb8                	lw	a4,88(a5)
    10d4:	fc843783          	ld	a5,-56(s0)
    10d8:	4fbc                	lw	a5,88(a5)
    10da:	00f75763          	bge	a4,a5,10e8 <schedule_sjf+0x92>
            shortest_thread = th;
    10de:	fc043783          	ld	a5,-64(s0)
    10e2:	fcf43423          	sd	a5,-56(s0)
    10e6:	a02d                	j	1110 <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    10e8:	fc043783          	ld	a5,-64(s0)
    10ec:	4fb8                	lw	a4,88(a5)
    10ee:	fc843783          	ld	a5,-56(s0)
    10f2:	4fbc                	lw	a5,88(a5)
    10f4:	00f71e63          	bne	a4,a5,1110 <schedule_sjf+0xba>
    10f8:	fc043783          	ld	a5,-64(s0)
    10fc:	5fd8                	lw	a4,60(a5)
    10fe:	fc843783          	ld	a5,-56(s0)
    1102:	5fdc                	lw	a5,60(a5)
    1104:	00f75663          	bge	a4,a5,1110 <schedule_sjf+0xba>
            shortest_thread = th;
    1108:	fc043783          	ld	a5,-64(s0)
    110c:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1110:	fc043783          	ld	a5,-64(s0)
    1114:	779c                	ld	a5,40(a5)
    1116:	f8f43423          	sd	a5,-120(s0)
    111a:	f8843783          	ld	a5,-120(s0)
    111e:	fd878793          	addi	a5,a5,-40
    1122:	fcf43023          	sd	a5,-64(s0)
    1126:	fc043783          	ld	a5,-64(s0)
    112a:	02878713          	addi	a4,a5,40
    112e:	649c                	ld	a5,8(s1)
    1130:	f8f71ce3          	bne	a4,a5,10c8 <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    1134:	fc843783          	ld	a5,-56(s0)
    1138:	4fbc                	lw	a5,88(a5)
    113a:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    113e:	689c                	ld	a5,16(s1)
    1140:	639c                	ld	a5,0(a5)
    1142:	faf43023          	sd	a5,-96(s0)
    1146:	fa043783          	ld	a5,-96(s0)
    114a:	17e1                	addi	a5,a5,-8
    114c:	faf43c23          	sd	a5,-72(s0)
    1150:	a84d                	j	1202 <schedule_sjf+0x1ac>
        int interval = cur->release_time - current_time;
    1152:	fb843783          	ld	a5,-72(s0)
    1156:	4f98                	lw	a4,24(a5)
    1158:	fb042783          	lw	a5,-80(s0)
    115c:	40f707bb          	subw	a5,a4,a5
    1160:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    1164:	f9c42703          	lw	a4,-100(s0)
    1168:	fb442783          	lw	a5,-76(s0)
    116c:	2701                	sext.w	a4,a4
    116e:	2781                	sext.w	a5,a5
    1170:	06e7c863          	blt	a5,a4,11e0 <schedule_sjf+0x18a>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1174:	fc843783          	ld	a5,-56(s0)
    1178:	4fbc                	lw	a5,88(a5)
    117a:	fb042703          	lw	a4,-80(s0)
    117e:	9fb9                	addw	a5,a5,a4
    1180:	0007871b          	sext.w	a4,a5
    1184:	fb843783          	ld	a5,-72(s0)
    1188:	4f9c                	lw	a5,24(a5)
    118a:	04f74d63          	blt	a4,a5,11e4 <schedule_sjf+0x18e>
        int remaining_time = shortest_thread->remaining_time - interval;
    118e:	fc843783          	ld	a5,-56(s0)
    1192:	4fb8                	lw	a4,88(a5)
    1194:	f9c42783          	lw	a5,-100(s0)
    1198:	40f707bb          	subw	a5,a4,a5
    119c:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    11a0:	fb843783          	ld	a5,-72(s0)
    11a4:	639c                	ld	a5,0(a5)
    11a6:	43f8                	lw	a4,68(a5)
    11a8:	f9842783          	lw	a5,-104(s0)
    11ac:	2781                	sext.w	a5,a5
    11ae:	02e7cd63          	blt	a5,a4,11e8 <schedule_sjf+0x192>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    11b2:	fb843783          	ld	a5,-72(s0)
    11b6:	639c                	ld	a5,0(a5)
    11b8:	43f8                	lw	a4,68(a5)
    11ba:	f9842783          	lw	a5,-104(s0)
    11be:	2781                	sext.w	a5,a5
    11c0:	00e79b63          	bne	a5,a4,11d6 <schedule_sjf+0x180>
    11c4:	fc843783          	ld	a5,-56(s0)
    11c8:	5fd8                	lw	a4,60(a5)
    11ca:	fb843783          	ld	a5,-72(s0)
    11ce:	639c                	ld	a5,0(a5)
    11d0:	5fdc                	lw	a5,60(a5)
    11d2:	00f74d63          	blt	a4,a5,11ec <schedule_sjf+0x196>
        executing_time = interval;
    11d6:	f9c42783          	lw	a5,-100(s0)
    11da:	faf42a23          	sw	a5,-76(s0)
    11de:	a801                	j	11ee <schedule_sjf+0x198>
        if (interval > executing_time) continue;
    11e0:	0001                	nop
    11e2:	a031                	j	11ee <schedule_sjf+0x198>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    11e4:	0001                	nop
    11e6:	a021                	j	11ee <schedule_sjf+0x198>
        if (remaining_time < cur->thrd->processing_time) continue;
    11e8:	0001                	nop
    11ea:	a011                	j	11ee <schedule_sjf+0x198>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    11ec:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    11ee:	fb843783          	ld	a5,-72(s0)
    11f2:	679c                	ld	a5,8(a5)
    11f4:	f8f43823          	sd	a5,-112(s0)
    11f8:	f9043783          	ld	a5,-112(s0)
    11fc:	17e1                	addi	a5,a5,-8
    11fe:	faf43c23          	sd	a5,-72(s0)
    1202:	fb843783          	ld	a5,-72(s0)
    1206:	00878713          	addi	a4,a5,8
    120a:	689c                	ld	a5,16(s1)
    120c:	f4f713e3          	bne	a4,a5,1152 <schedule_sjf+0xfc>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &shortest_thread->thread_list;
    1210:	fc843783          	ld	a5,-56(s0)
    1214:	02878793          	addi	a5,a5,40
    1218:	f6f43423          	sd	a5,-152(s0)
    r.allocated_time = executing_time;
    121c:	fb442783          	lw	a5,-76(s0)
    1220:	f6f42823          	sw	a5,-144(s0)
    return r;
    1224:	f6843783          	ld	a5,-152(s0)
    1228:	f6f43c23          	sd	a5,-136(s0)
    122c:	f7043783          	ld	a5,-144(s0)
    1230:	f8f43023          	sd	a5,-128(s0)
    1234:	4701                	li	a4,0
    1236:	f7843703          	ld	a4,-136(s0)
    123a:	4781                	li	a5,0
    123c:	f8043783          	ld	a5,-128(s0)
    1240:	893a                	mv	s2,a4
    1242:	89be                	mv	s3,a5
    1244:	874a                	mv	a4,s2
    1246:	87ce                	mv	a5,s3
}
    1248:	853a                	mv	a0,a4
    124a:	85be                	mv	a1,a5
    124c:	70ea                	ld	ra,184(sp)
    124e:	744a                	ld	s0,176(sp)
    1250:	74aa                	ld	s1,168(sp)
    1252:	790a                	ld	s2,160(sp)
    1254:	69ea                	ld	s3,152(sp)
    1256:	6129                	addi	sp,sp,192
    1258:	8082                	ret

000000000000125a <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    125a:	7115                	addi	sp,sp,-224
    125c:	ed86                	sd	ra,216(sp)
    125e:	e9a2                	sd	s0,208(sp)
    1260:	e5a6                	sd	s1,200(sp)
    1262:	e1ca                	sd	s2,192(sp)
    1264:	fd4e                	sd	s3,184(sp)
    1266:	1180                	addi	s0,sp,224
    1268:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    126a:	649c                	ld	a5,8(s1)
    126c:	853e                	mv	a0,a5
    126e:	00000097          	auipc	ra,0x0
    1272:	b0e080e7          	jalr	-1266(ra) # d7c <list_empty>
    1276:	87aa                	mv	a5,a0
    1278:	cb85                	beqz	a5,12a8 <schedule_lst+0x4e>
        return fill_sparse(args);
    127a:	609c                	ld	a5,0(s1)
    127c:	f2f43023          	sd	a5,-224(s0)
    1280:	649c                	ld	a5,8(s1)
    1282:	f2f43423          	sd	a5,-216(s0)
    1286:	689c                	ld	a5,16(s1)
    1288:	f2f43823          	sd	a5,-208(s0)
    128c:	f2040793          	addi	a5,s0,-224
    1290:	853e                	mv	a0,a5
    1292:	00000097          	auipc	ra,0x0
    1296:	b14080e7          	jalr	-1260(ra) # da6 <fill_sparse>
    129a:	872a                	mv	a4,a0
    129c:	87ae                	mv	a5,a1
    129e:	f6e43023          	sd	a4,-160(s0)
    12a2:	f6f43423          	sd	a5,-152(s0)
    12a6:	ac41                	j	1536 <schedule_lst+0x2dc>

    int current_time = args.current_time;
    12a8:	409c                	lw	a5,0(s1)
    12aa:	faf42623          	sw	a5,-84(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    12ae:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    12b2:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    12b6:	649c                	ld	a5,8(s1)
    12b8:	639c                	ld	a5,0(a5)
    12ba:	faf43023          	sd	a5,-96(s0)
    12be:	fa043783          	ld	a5,-96(s0)
    12c2:	fd878793          	addi	a5,a5,-40
    12c6:	fcf43023          	sd	a5,-64(s0)
    12ca:	a239                	j	13d8 <schedule_lst+0x17e>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    12cc:	fc043783          	ld	a5,-64(s0)
    12d0:	4ff8                	lw	a4,92(a5)
    12d2:	fac42783          	lw	a5,-84(s0)
    12d6:	40f707bb          	subw	a5,a4,a5
    12da:	0007871b          	sext.w	a4,a5
    12de:	fc043783          	ld	a5,-64(s0)
    12e2:	4fbc                	lw	a5,88(a5)
    12e4:	40f707bb          	subw	a5,a4,a5
    12e8:	f6f42e23          	sw	a5,-132(s0)
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    12ec:	fc843783          	ld	a5,-56(s0)
    12f0:	c38d                	beqz	a5,1312 <schedule_lst+0xb8>
    12f2:	fc843783          	ld	a5,-56(s0)
    12f6:	4ff8                	lw	a4,92(a5)
    12f8:	fac42783          	lw	a5,-84(s0)
    12fc:	40f707bb          	subw	a5,a4,a5
    1300:	0007871b          	sext.w	a4,a5
    1304:	fc843783          	ld	a5,-56(s0)
    1308:	4fbc                	lw	a5,88(a5)
    130a:	40f707bb          	subw	a5,a4,a5
    130e:	2781                	sext.w	a5,a5
    1310:	a011                	j	1314 <schedule_lst+0xba>
    1312:	4781                	li	a5,0
    1314:	f6f42c23          	sw	a5,-136(s0)
        if (least_slack_thread == NULL) {
    1318:	fc843783          	ld	a5,-56(s0)
    131c:	e791                	bnez	a5,1328 <schedule_lst+0xce>
            least_slack_thread = th;
    131e:	fc043783          	ld	a5,-64(s0)
    1322:	fcf43423          	sd	a5,-56(s0)
    1326:	a871                	j	13c2 <schedule_lst+0x168>
        }
        else if (least_slack_thread->current_deadline <= current_time) { // missing the deadline
    1328:	fc843783          	ld	a5,-56(s0)
    132c:	4ff8                	lw	a4,92(a5)
    132e:	fac42783          	lw	a5,-84(s0)
    1332:	2781                	sext.w	a5,a5
    1334:	02e7c763          	blt	a5,a4,1362 <schedule_lst+0x108>
            if (th->current_deadline > current_time) continue;
    1338:	fc043783          	ld	a5,-64(s0)
    133c:	4ff8                	lw	a4,92(a5)
    133e:	fac42783          	lw	a5,-84(s0)
    1342:	2781                	sext.w	a5,a5
    1344:	06e7ce63          	blt	a5,a4,13c0 <schedule_lst+0x166>
            if (th->ID < least_slack_thread->ID) {
    1348:	fc043783          	ld	a5,-64(s0)
    134c:	5fd8                	lw	a4,60(a5)
    134e:	fc843783          	ld	a5,-56(s0)
    1352:	5fdc                	lw	a5,60(a5)
    1354:	06f75763          	bge	a4,a5,13c2 <schedule_lst+0x168>
                least_slack_thread = th;
    1358:	fc043783          	ld	a5,-64(s0)
    135c:	fcf43423          	sd	a5,-56(s0)
    1360:	a08d                	j	13c2 <schedule_lst+0x168>
            }
        }
        else if (th->current_deadline <= current_time) {
    1362:	fc043783          	ld	a5,-64(s0)
    1366:	4ff8                	lw	a4,92(a5)
    1368:	fac42783          	lw	a5,-84(s0)
    136c:	2781                	sext.w	a5,a5
    136e:	00e7c763          	blt	a5,a4,137c <schedule_lst+0x122>
            least_slack_thread = th;
    1372:	fc043783          	ld	a5,-64(s0)
    1376:	fcf43423          	sd	a5,-56(s0)
    137a:	a0a1                	j	13c2 <schedule_lst+0x168>
        }
        else if (slack_time < least_slack_time) {
    137c:	f7c42703          	lw	a4,-132(s0)
    1380:	f7842783          	lw	a5,-136(s0)
    1384:	2701                	sext.w	a4,a4
    1386:	2781                	sext.w	a5,a5
    1388:	00f75763          	bge	a4,a5,1396 <schedule_lst+0x13c>
            least_slack_thread = th;
    138c:	fc043783          	ld	a5,-64(s0)
    1390:	fcf43423          	sd	a5,-56(s0)
    1394:	a03d                	j	13c2 <schedule_lst+0x168>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    1396:	f7c42703          	lw	a4,-132(s0)
    139a:	f7842783          	lw	a5,-136(s0)
    139e:	2701                	sext.w	a4,a4
    13a0:	2781                	sext.w	a5,a5
    13a2:	02f71063          	bne	a4,a5,13c2 <schedule_lst+0x168>
    13a6:	fc043783          	ld	a5,-64(s0)
    13aa:	5fd8                	lw	a4,60(a5)
    13ac:	fc843783          	ld	a5,-56(s0)
    13b0:	5fdc                	lw	a5,60(a5)
    13b2:	00f75863          	bge	a4,a5,13c2 <schedule_lst+0x168>
            least_slack_thread = th;
    13b6:	fc043783          	ld	a5,-64(s0)
    13ba:	fcf43423          	sd	a5,-56(s0)
    13be:	a011                	j	13c2 <schedule_lst+0x168>
            if (th->current_deadline > current_time) continue;
    13c0:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    13c2:	fc043783          	ld	a5,-64(s0)
    13c6:	779c                	ld	a5,40(a5)
    13c8:	f6f43823          	sd	a5,-144(s0)
    13cc:	f7043783          	ld	a5,-144(s0)
    13d0:	fd878793          	addi	a5,a5,-40
    13d4:	fcf43023          	sd	a5,-64(s0)
    13d8:	fc043783          	ld	a5,-64(s0)
    13dc:	02878713          	addi	a4,a5,40
    13e0:	649c                	ld	a5,8(s1)
    13e2:	eef715e3          	bne	a4,a5,12cc <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread->current_deadline <= current_time)
    13e6:	fc843783          	ld	a5,-56(s0)
    13ea:	4ff8                	lw	a4,92(a5)
    13ec:	fac42783          	lw	a5,-84(s0)
    13f0:	2781                	sext.w	a5,a5
    13f2:	00e7cb63          	blt	a5,a4,1408 <schedule_lst+0x1ae>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    13f6:	fc843783          	ld	a5,-56(s0)
    13fa:	02878793          	addi	a5,a5,40
    13fe:	f6f43023          	sd	a5,-160(s0)
    1402:	f6042423          	sw	zero,-152(s0)
    1406:	aa05                	j	1536 <schedule_lst+0x2dc>
    
    int executing_time = least_slack_thread->remaining_time;
    1408:	fc843783          	ld	a5,-56(s0)
    140c:	4fbc                	lw	a5,88(a5)
    140e:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    1412:	fc843783          	ld	a5,-56(s0)
    1416:	4fb4                	lw	a3,88(a5)
    1418:	fc843783          	ld	a5,-56(s0)
    141c:	4ff8                	lw	a4,92(a5)
    141e:	fac42783          	lw	a5,-84(s0)
    1422:	40f707bb          	subw	a5,a4,a5
    1426:	2781                	sext.w	a5,a5
    1428:	8736                	mv	a4,a3
    142a:	00e7db63          	bge	a5,a4,1440 <schedule_lst+0x1e6>
        executing_time = least_slack_thread->current_deadline - current_time;
    142e:	fc843783          	ld	a5,-56(s0)
    1432:	4ff8                	lw	a4,92(a5)
    1434:	fac42783          	lw	a5,-84(s0)
    1438:	40f707bb          	subw	a5,a4,a5
    143c:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    1440:	fc843783          	ld	a5,-56(s0)
    1444:	4ff8                	lw	a4,92(a5)
    1446:	fac42783          	lw	a5,-84(s0)
    144a:	40f707bb          	subw	a5,a4,a5
    144e:	0007871b          	sext.w	a4,a5
    1452:	fc843783          	ld	a5,-56(s0)
    1456:	4fbc                	lw	a5,88(a5)
    1458:	40f707bb          	subw	a5,a4,a5
    145c:	f8f42e23          	sw	a5,-100(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1460:	689c                	ld	a5,16(s1)
    1462:	639c                	ld	a5,0(a5)
    1464:	f8f43823          	sd	a5,-112(s0)
    1468:	f9043783          	ld	a5,-112(s0)
    146c:	17e1                	addi	a5,a5,-8
    146e:	faf43823          	sd	a5,-80(s0)
    1472:	a849                	j	1504 <schedule_lst+0x2aa>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    1474:	fb043783          	ld	a5,-80(s0)
    1478:	639c                	ld	a5,0(a5)
    147a:	47f8                	lw	a4,76(a5)
    147c:	fb043783          	ld	a5,-80(s0)
    1480:	639c                	ld	a5,0(a5)
    1482:	43fc                	lw	a5,68(a5)
    1484:	40f707bb          	subw	a5,a4,a5
    1488:	f8f42623          	sw	a5,-116(s0)
        int interval = cur->release_time - current_time;
    148c:	fb043783          	ld	a5,-80(s0)
    1490:	4f98                	lw	a4,24(a5)
    1492:	fac42783          	lw	a5,-84(s0)
    1496:	40f707bb          	subw	a5,a4,a5
    149a:	f8f42423          	sw	a5,-120(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    149e:	f8842703          	lw	a4,-120(s0)
    14a2:	fbc42783          	lw	a5,-68(s0)
    14a6:	2701                	sext.w	a4,a4
    14a8:	2781                	sext.w	a5,a5
    14aa:	04e7c063          	blt	a5,a4,14ea <schedule_lst+0x290>
    14ae:	f9c42703          	lw	a4,-100(s0)
    14b2:	f8c42783          	lw	a5,-116(s0)
    14b6:	2701                	sext.w	a4,a4
    14b8:	2781                	sext.w	a5,a5
    14ba:	02f74863          	blt	a4,a5,14ea <schedule_lst+0x290>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    14be:	f9c42703          	lw	a4,-100(s0)
    14c2:	f8c42783          	lw	a5,-116(s0)
    14c6:	2701                	sext.w	a4,a4
    14c8:	2781                	sext.w	a5,a5
    14ca:	00f71b63          	bne	a4,a5,14e0 <schedule_lst+0x286>
    14ce:	fc843783          	ld	a5,-56(s0)
    14d2:	5fd8                	lw	a4,60(a5)
    14d4:	fb043783          	ld	a5,-80(s0)
    14d8:	639c                	ld	a5,0(a5)
    14da:	5fdc                	lw	a5,60(a5)
    14dc:	00f74963          	blt	a4,a5,14ee <schedule_lst+0x294>
        executing_time = interval;
    14e0:	f8842783          	lw	a5,-120(s0)
    14e4:	faf42e23          	sw	a5,-68(s0)
    14e8:	a021                	j	14f0 <schedule_lst+0x296>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    14ea:	0001                	nop
    14ec:	a011                	j	14f0 <schedule_lst+0x296>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    14ee:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    14f0:	fb043783          	ld	a5,-80(s0)
    14f4:	679c                	ld	a5,8(a5)
    14f6:	f8f43023          	sd	a5,-128(s0)
    14fa:	f8043783          	ld	a5,-128(s0)
    14fe:	17e1                	addi	a5,a5,-8
    1500:	faf43823          	sd	a5,-80(s0)
    1504:	fb043783          	ld	a5,-80(s0)
    1508:	00878713          	addi	a4,a5,8
    150c:	689c                	ld	a5,16(s1)
    150e:	f6f713e3          	bne	a4,a5,1474 <schedule_lst+0x21a>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &least_slack_thread->thread_list;
    1512:	fc843783          	ld	a5,-56(s0)
    1516:	02878793          	addi	a5,a5,40
    151a:	f4f43823          	sd	a5,-176(s0)
    r.allocated_time = executing_time;
    151e:	fbc42783          	lw	a5,-68(s0)
    1522:	f4f42c23          	sw	a5,-168(s0)
    return r;
    1526:	f5043783          	ld	a5,-176(s0)
    152a:	f6f43023          	sd	a5,-160(s0)
    152e:	f5843783          	ld	a5,-168(s0)
    1532:	f6f43423          	sd	a5,-152(s0)
    1536:	4701                	li	a4,0
    1538:	f6043703          	ld	a4,-160(s0)
    153c:	4781                	li	a5,0
    153e:	f6843783          	ld	a5,-152(s0)
    1542:	893a                	mv	s2,a4
    1544:	89be                	mv	s3,a5
    1546:	874a                	mv	a4,s2
    1548:	87ce                	mv	a5,s3
}
    154a:	853a                	mv	a0,a4
    154c:	85be                	mv	a1,a5
    154e:	60ee                	ld	ra,216(sp)
    1550:	644e                	ld	s0,208(sp)
    1552:	64ae                	ld	s1,200(sp)
    1554:	690e                	ld	s2,192(sp)
    1556:	79ea                	ld	s3,184(sp)
    1558:	612d                	addi	sp,sp,224
    155a:	8082                	ret

000000000000155c <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    155c:	7155                	addi	sp,sp,-208
    155e:	e586                	sd	ra,200(sp)
    1560:	e1a2                	sd	s0,192(sp)
    1562:	fd26                	sd	s1,184(sp)
    1564:	f94a                	sd	s2,176(sp)
    1566:	f54e                	sd	s3,168(sp)
    1568:	0980                	addi	s0,sp,208
    156a:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.

    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    156c:	649c                	ld	a5,8(s1)
    156e:	853e                	mv	a0,a5
    1570:	00000097          	auipc	ra,0x0
    1574:	80c080e7          	jalr	-2036(ra) # d7c <list_empty>
    1578:	87aa                	mv	a5,a0
    157a:	cb85                	beqz	a5,15aa <schedule_dm+0x4e>
        return fill_sparse(args);
    157c:	609c                	ld	a5,0(s1)
    157e:	f2f43823          	sd	a5,-208(s0)
    1582:	649c                	ld	a5,8(s1)
    1584:	f2f43c23          	sd	a5,-200(s0)
    1588:	689c                	ld	a5,16(s1)
    158a:	f4f43023          	sd	a5,-192(s0)
    158e:	f3040793          	addi	a5,s0,-208
    1592:	853e                	mv	a0,a5
    1594:	00000097          	auipc	ra,0x0
    1598:	812080e7          	jalr	-2030(ra) # da6 <fill_sparse>
    159c:	872a                	mv	a4,a0
    159e:	87ae                	mv	a5,a1
    15a0:	f6e43823          	sd	a4,-144(s0)
    15a4:	f6f43c23          	sd	a5,-136(s0)
    15a8:	ac11                	j	17bc <schedule_dm+0x260>
    
    int current_time = args.current_time;
    15aa:	409c                	lw	a5,0(s1)
    15ac:	faf42623          	sw	a5,-84(s0)

    // find the thread with the earliest deadline
    struct thread *highest_priority_thread = NULL;
    15b0:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    15b4:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    15b8:	649c                	ld	a5,8(s1)
    15ba:	639c                	ld	a5,0(a5)
    15bc:	faf43023          	sd	a5,-96(s0)
    15c0:	fa043783          	ld	a5,-96(s0)
    15c4:	fd878793          	addi	a5,a5,-40
    15c8:	fcf43023          	sd	a5,-64(s0)
    15cc:	a0c9                	j	168e <schedule_dm+0x132>
        if (highest_priority_thread == NULL) {
    15ce:	fc843783          	ld	a5,-56(s0)
    15d2:	e791                	bnez	a5,15de <schedule_dm+0x82>
            highest_priority_thread = th;
    15d4:	fc043783          	ld	a5,-64(s0)
    15d8:	fcf43423          	sd	a5,-56(s0)
    15dc:	a871                	j	1678 <schedule_dm+0x11c>
        }
        else if (highest_priority_thread->current_deadline <= current_time) { // missing the deadline
    15de:	fc843783          	ld	a5,-56(s0)
    15e2:	4ff8                	lw	a4,92(a5)
    15e4:	fac42783          	lw	a5,-84(s0)
    15e8:	2781                	sext.w	a5,a5
    15ea:	02e7c763          	blt	a5,a4,1618 <schedule_dm+0xbc>
            if (th->current_deadline > current_time) continue;
    15ee:	fc043783          	ld	a5,-64(s0)
    15f2:	4ff8                	lw	a4,92(a5)
    15f4:	fac42783          	lw	a5,-84(s0)
    15f8:	2781                	sext.w	a5,a5
    15fa:	06e7ce63          	blt	a5,a4,1676 <schedule_dm+0x11a>
            if (th->ID < highest_priority_thread->ID) {
    15fe:	fc043783          	ld	a5,-64(s0)
    1602:	5fd8                	lw	a4,60(a5)
    1604:	fc843783          	ld	a5,-56(s0)
    1608:	5fdc                	lw	a5,60(a5)
    160a:	06f75763          	bge	a4,a5,1678 <schedule_dm+0x11c>
                highest_priority_thread = th;
    160e:	fc043783          	ld	a5,-64(s0)
    1612:	fcf43423          	sd	a5,-56(s0)
    1616:	a08d                	j	1678 <schedule_dm+0x11c>
            }
        }
        else if (th->current_deadline <= current_time) {
    1618:	fc043783          	ld	a5,-64(s0)
    161c:	4ff8                	lw	a4,92(a5)
    161e:	fac42783          	lw	a5,-84(s0)
    1622:	2781                	sext.w	a5,a5
    1624:	00e7c763          	blt	a5,a4,1632 <schedule_dm+0xd6>
            highest_priority_thread = th;
    1628:	fc043783          	ld	a5,-64(s0)
    162c:	fcf43423          	sd	a5,-56(s0)
    1630:	a0a1                	j	1678 <schedule_dm+0x11c>
        }
        else if (th->deadline < highest_priority_thread->deadline ) {
    1632:	fc043783          	ld	a5,-64(s0)
    1636:	47f8                	lw	a4,76(a5)
    1638:	fc843783          	ld	a5,-56(s0)
    163c:	47fc                	lw	a5,76(a5)
    163e:	00f75763          	bge	a4,a5,164c <schedule_dm+0xf0>
            highest_priority_thread = th;
    1642:	fc043783          	ld	a5,-64(s0)
    1646:	fcf43423          	sd	a5,-56(s0)
    164a:	a03d                	j	1678 <schedule_dm+0x11c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    164c:	fc043783          	ld	a5,-64(s0)
    1650:	47f8                	lw	a4,76(a5)
    1652:	fc843783          	ld	a5,-56(s0)
    1656:	47fc                	lw	a5,76(a5)
    1658:	02f71063          	bne	a4,a5,1678 <schedule_dm+0x11c>
    165c:	fc043783          	ld	a5,-64(s0)
    1660:	5fd8                	lw	a4,60(a5)
    1662:	fc843783          	ld	a5,-56(s0)
    1666:	5fdc                	lw	a5,60(a5)
    1668:	00f75863          	bge	a4,a5,1678 <schedule_dm+0x11c>
            highest_priority_thread = th;
    166c:	fc043783          	ld	a5,-64(s0)
    1670:	fcf43423          	sd	a5,-56(s0)
    1674:	a011                	j	1678 <schedule_dm+0x11c>
            if (th->current_deadline > current_time) continue;
    1676:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1678:	fc043783          	ld	a5,-64(s0)
    167c:	779c                	ld	a5,40(a5)
    167e:	f8f43023          	sd	a5,-128(s0)
    1682:	f8043783          	ld	a5,-128(s0)
    1686:	fd878793          	addi	a5,a5,-40
    168a:	fcf43023          	sd	a5,-64(s0)
    168e:	fc043783          	ld	a5,-64(s0)
    1692:	02878713          	addi	a4,a5,40
    1696:	649c                	ld	a5,8(s1)
    1698:	f2f71be3          	bne	a4,a5,15ce <schedule_dm+0x72>
        }
    }

    // the thread missing the current deadline
    if (highest_priority_thread->current_deadline <= current_time)
    169c:	fc843783          	ld	a5,-56(s0)
    16a0:	4ff8                	lw	a4,92(a5)
    16a2:	fac42783          	lw	a5,-84(s0)
    16a6:	2781                	sext.w	a5,a5
    16a8:	00e7cb63          	blt	a5,a4,16be <schedule_dm+0x162>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    16ac:	fc843783          	ld	a5,-56(s0)
    16b0:	02878793          	addi	a5,a5,40
    16b4:	f6f43823          	sd	a5,-144(s0)
    16b8:	f6042c23          	sw	zero,-136(s0)
    16bc:	a201                	j	17bc <schedule_dm+0x260>

    int executing_time = highest_priority_thread->remaining_time;
    16be:	fc843783          	ld	a5,-56(s0)
    16c2:	4fbc                	lw	a5,88(a5)
    16c4:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    16c8:	fc843783          	ld	a5,-56(s0)
    16cc:	4fb4                	lw	a3,88(a5)
    16ce:	fc843783          	ld	a5,-56(s0)
    16d2:	4ff8                	lw	a4,92(a5)
    16d4:	fac42783          	lw	a5,-84(s0)
    16d8:	40f707bb          	subw	a5,a4,a5
    16dc:	2781                	sext.w	a5,a5
    16de:	8736                	mv	a4,a3
    16e0:	00e7db63          	bge	a5,a4,16f6 <schedule_dm+0x19a>
        executing_time = highest_priority_thread->current_deadline - current_time;
    16e4:	fc843783          	ld	a5,-56(s0)
    16e8:	4ff8                	lw	a4,92(a5)
    16ea:	fac42783          	lw	a5,-84(s0)
    16ee:	40f707bb          	subw	a5,a4,a5
    16f2:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    16f6:	689c                	ld	a5,16(s1)
    16f8:	639c                	ld	a5,0(a5)
    16fa:	f8f43c23          	sd	a5,-104(s0)
    16fe:	f9843783          	ld	a5,-104(s0)
    1702:	17e1                	addi	a5,a5,-8
    1704:	faf43823          	sd	a5,-80(s0)
    1708:	a049                	j	178a <schedule_dm+0x22e>
        int interval = cur->release_time - current_time;
    170a:	fb043783          	ld	a5,-80(s0)
    170e:	4f98                	lw	a4,24(a5)
    1710:	fac42783          	lw	a5,-84(s0)
    1714:	40f707bb          	subw	a5,a4,a5
    1718:	f8f42a23          	sw	a5,-108(s0)
        if (interval > executing_time) continue;
    171c:	f9442703          	lw	a4,-108(s0)
    1720:	fbc42783          	lw	a5,-68(s0)
    1724:	2701                	sext.w	a4,a4
    1726:	2781                	sext.w	a5,a5
    1728:	04e7c263          	blt	a5,a4,176c <schedule_dm+0x210>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    172c:	fc843783          	ld	a5,-56(s0)
    1730:	47f8                	lw	a4,76(a5)
    1732:	fb043783          	ld	a5,-80(s0)
    1736:	639c                	ld	a5,0(a5)
    1738:	47fc                	lw	a5,76(a5)
    173a:	02f74b63          	blt	a4,a5,1770 <schedule_dm+0x214>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    173e:	fc843783          	ld	a5,-56(s0)
    1742:	47f8                	lw	a4,76(a5)
    1744:	fb043783          	ld	a5,-80(s0)
    1748:	639c                	ld	a5,0(a5)
    174a:	47fc                	lw	a5,76(a5)
    174c:	00f71b63          	bne	a4,a5,1762 <schedule_dm+0x206>
    1750:	fc843783          	ld	a5,-56(s0)
    1754:	5fd8                	lw	a4,60(a5)
    1756:	fb043783          	ld	a5,-80(s0)
    175a:	639c                	ld	a5,0(a5)
    175c:	5fdc                	lw	a5,60(a5)
    175e:	00f74b63          	blt	a4,a5,1774 <schedule_dm+0x218>
        executing_time = interval;
    1762:	f9442783          	lw	a5,-108(s0)
    1766:	faf42e23          	sw	a5,-68(s0)
    176a:	a031                	j	1776 <schedule_dm+0x21a>
        if (interval > executing_time) continue;
    176c:	0001                	nop
    176e:	a021                	j	1776 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    1770:	0001                	nop
    1772:	a011                	j	1776 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    1774:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1776:	fb043783          	ld	a5,-80(s0)
    177a:	679c                	ld	a5,8(a5)
    177c:	f8f43423          	sd	a5,-120(s0)
    1780:	f8843783          	ld	a5,-120(s0)
    1784:	17e1                	addi	a5,a5,-8
    1786:	faf43823          	sd	a5,-80(s0)
    178a:	fb043783          	ld	a5,-80(s0)
    178e:	00878713          	addi	a4,a5,8
    1792:	689c                	ld	a5,16(s1)
    1794:	f6f71be3          	bne	a4,a5,170a <schedule_dm+0x1ae>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &highest_priority_thread->thread_list;
    1798:	fc843783          	ld	a5,-56(s0)
    179c:	02878793          	addi	a5,a5,40
    17a0:	f6f43023          	sd	a5,-160(s0)
    r.allocated_time = executing_time;
    17a4:	fbc42783          	lw	a5,-68(s0)
    17a8:	f6f42423          	sw	a5,-152(s0)
    return r;
    17ac:	f6043783          	ld	a5,-160(s0)
    17b0:	f6f43823          	sd	a5,-144(s0)
    17b4:	f6843783          	ld	a5,-152(s0)
    17b8:	f6f43c23          	sd	a5,-136(s0)
    17bc:	4701                	li	a4,0
    17be:	f7043703          	ld	a4,-144(s0)
    17c2:	4781                	li	a5,0
    17c4:	f7843783          	ld	a5,-136(s0)
    17c8:	893a                	mv	s2,a4
    17ca:	89be                	mv	s3,a5
    17cc:	874a                	mv	a4,s2
    17ce:	87ce                	mv	a5,s3
    17d0:	853a                	mv	a0,a4
    17d2:	85be                	mv	a1,a5
    17d4:	60ae                	ld	ra,200(sp)
    17d6:	640e                	ld	s0,192(sp)
    17d8:	74ea                	ld	s1,184(sp)
    17da:	794a                	ld	s2,176(sp)
    17dc:	79aa                	ld	s3,168(sp)
    17de:	6169                	addi	sp,sp,208
    17e0:	8082                	ret
