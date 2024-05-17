
user/_custom_rttask:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f>:
#include "kernel/types.h"
          #include "user/user.h"
          #include "user/threads.h"
          #define NULL 0
          int k = 0;
          void f(void *arg){
       0:	1101                	addi	sp,sp,-32
       2:	ec22                	sd	s0,24(sp)
       4:	1000                	addi	s0,sp,32
       6:	fea43423          	sd	a0,-24(s0)
              while (1) k++;
       a:	00002797          	auipc	a5,0x2
       e:	5e678793          	addi	a5,a5,1510 # 25f0 <k>
      12:	439c                	lw	a5,0(a5)
      14:	2785                	addiw	a5,a5,1
      16:	0007871b          	sext.w	a4,a5
      1a:	00002797          	auipc	a5,0x2
      1e:	5d678793          	addi	a5,a5,1494 # 25f0 <k>
      22:	c398                	sw	a4,0(a5)
      24:	b7dd                	j	a <f+0xa>

0000000000000026 <main>:
          }
          int main(int argc, char **argv){
      26:	7179                	addi	sp,sp,-48
      28:	f406                	sd	ra,40(sp)
      2a:	f022                	sd	s0,32(sp)
      2c:	1800                	addi	s0,sp,48
      2e:	87aa                	mv	a5,a0
      30:	fcb43823          	sd	a1,-48(s0)
      34:	fcf42e23          	sw	a5,-36(s0)
          struct thread *t1 = thread_create(f, NULL, 1, 2, 13, 7);
      38:	479d                	li	a5,7
      3a:	4735                	li	a4,13
      3c:	4689                	li	a3,2
      3e:	4605                	li	a2,1
      40:	4581                	li	a1,0
      42:	00000517          	auipc	a0,0x0
      46:	fbe50513          	addi	a0,a0,-66 # 0 <f>
      4a:	00001097          	auipc	ra,0x1
      4e:	f16080e7          	jalr	-234(ra) # f60 <thread_create>
      52:	fea43423          	sd	a0,-24(s0)
thread_set_weight(t1, 1);
      56:	4585                	li	a1,1
      58:	fe843503          	ld	a0,-24(s0)
      5c:	00001097          	auipc	ra,0x1
      60:	00e080e7          	jalr	14(ra) # 106a <thread_set_weight>
thread_add_at(t1, 46);
      64:	02e00593          	li	a1,46
      68:	fe843503          	ld	a0,-24(s0)
      6c:	00001097          	auipc	ra,0x1
      70:	020080e7          	jalr	32(ra) # 108c <thread_add_at>
struct thread *t2 = thread_create(f, NULL, 1, 2, 3, 7);
      74:	479d                	li	a5,7
      76:	470d                	li	a4,3
      78:	4689                	li	a3,2
      7a:	4605                	li	a2,1
      7c:	4581                	li	a1,0
      7e:	00000517          	auipc	a0,0x0
      82:	f8250513          	addi	a0,a0,-126 # 0 <f>
      86:	00001097          	auipc	ra,0x1
      8a:	eda080e7          	jalr	-294(ra) # f60 <thread_create>
      8e:	fea43023          	sd	a0,-32(s0)
thread_set_weight(t2, 1);
      92:	4585                	li	a1,1
      94:	fe043503          	ld	a0,-32(s0)
      98:	00001097          	auipc	ra,0x1
      9c:	fd2080e7          	jalr	-46(ra) # 106a <thread_set_weight>
thread_add_at(t2, 47);
      a0:	02f00593          	li	a1,47
      a4:	fe043503          	ld	a0,-32(s0)
      a8:	00001097          	auipc	ra,0x1
      ac:	fe4080e7          	jalr	-28(ra) # 108c <thread_add_at>
thread_start_threading();
      b0:	00001097          	auipc	ra,0x1
      b4:	7ea080e7          	jalr	2026(ra) # 189a <thread_start_threading>
          printf("\nexited\n");
      b8:	00002517          	auipc	a0,0x2
      bc:	3a050513          	addi	a0,a0,928 # 2458 <schedule_dm+0x28c>
      c0:	00001097          	auipc	ra,0x1
      c4:	9e8080e7          	jalr	-1560(ra) # aa8 <printf>
          exit(0);
      c8:	4501                	li	a0,0
      ca:	00000097          	auipc	ra,0x0
      ce:	498080e7          	jalr	1176(ra) # 562 <exit>

00000000000000d2 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      d2:	7179                	addi	sp,sp,-48
      d4:	f422                	sd	s0,40(sp)
      d6:	1800                	addi	s0,sp,48
      d8:	fca43c23          	sd	a0,-40(s0)
      dc:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      e0:	fd843783          	ld	a5,-40(s0)
      e4:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      e8:	0001                	nop
      ea:	fd043703          	ld	a4,-48(s0)
      ee:	00170793          	addi	a5,a4,1
      f2:	fcf43823          	sd	a5,-48(s0)
      f6:	fd843783          	ld	a5,-40(s0)
      fa:	00178693          	addi	a3,a5,1
      fe:	fcd43c23          	sd	a3,-40(s0)
     102:	00074703          	lbu	a4,0(a4)
     106:	00e78023          	sb	a4,0(a5)
     10a:	0007c783          	lbu	a5,0(a5)
     10e:	fff1                	bnez	a5,ea <strcpy+0x18>
    ;
  return os;
     110:	fe843783          	ld	a5,-24(s0)
}
     114:	853e                	mv	a0,a5
     116:	7422                	ld	s0,40(sp)
     118:	6145                	addi	sp,sp,48
     11a:	8082                	ret

000000000000011c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     11c:	1101                	addi	sp,sp,-32
     11e:	ec22                	sd	s0,24(sp)
     120:	1000                	addi	s0,sp,32
     122:	fea43423          	sd	a0,-24(s0)
     126:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     12a:	a819                	j	140 <strcmp+0x24>
    p++, q++;
     12c:	fe843783          	ld	a5,-24(s0)
     130:	0785                	addi	a5,a5,1
     132:	fef43423          	sd	a5,-24(s0)
     136:	fe043783          	ld	a5,-32(s0)
     13a:	0785                	addi	a5,a5,1
     13c:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     140:	fe843783          	ld	a5,-24(s0)
     144:	0007c783          	lbu	a5,0(a5)
     148:	cb99                	beqz	a5,15e <strcmp+0x42>
     14a:	fe843783          	ld	a5,-24(s0)
     14e:	0007c703          	lbu	a4,0(a5)
     152:	fe043783          	ld	a5,-32(s0)
     156:	0007c783          	lbu	a5,0(a5)
     15a:	fcf709e3          	beq	a4,a5,12c <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     15e:	fe843783          	ld	a5,-24(s0)
     162:	0007c783          	lbu	a5,0(a5)
     166:	0007871b          	sext.w	a4,a5
     16a:	fe043783          	ld	a5,-32(s0)
     16e:	0007c783          	lbu	a5,0(a5)
     172:	2781                	sext.w	a5,a5
     174:	40f707bb          	subw	a5,a4,a5
     178:	2781                	sext.w	a5,a5
}
     17a:	853e                	mv	a0,a5
     17c:	6462                	ld	s0,24(sp)
     17e:	6105                	addi	sp,sp,32
     180:	8082                	ret

0000000000000182 <strlen>:

uint
strlen(const char *s)
{
     182:	7179                	addi	sp,sp,-48
     184:	f422                	sd	s0,40(sp)
     186:	1800                	addi	s0,sp,48
     188:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     18c:	fe042623          	sw	zero,-20(s0)
     190:	a031                	j	19c <strlen+0x1a>
     192:	fec42783          	lw	a5,-20(s0)
     196:	2785                	addiw	a5,a5,1
     198:	fef42623          	sw	a5,-20(s0)
     19c:	fec42783          	lw	a5,-20(s0)
     1a0:	fd843703          	ld	a4,-40(s0)
     1a4:	97ba                	add	a5,a5,a4
     1a6:	0007c783          	lbu	a5,0(a5)
     1aa:	f7e5                	bnez	a5,192 <strlen+0x10>
    ;
  return n;
     1ac:	fec42783          	lw	a5,-20(s0)
}
     1b0:	853e                	mv	a0,a5
     1b2:	7422                	ld	s0,40(sp)
     1b4:	6145                	addi	sp,sp,48
     1b6:	8082                	ret

00000000000001b8 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1b8:	7179                	addi	sp,sp,-48
     1ba:	f422                	sd	s0,40(sp)
     1bc:	1800                	addi	s0,sp,48
     1be:	fca43c23          	sd	a0,-40(s0)
     1c2:	87ae                	mv	a5,a1
     1c4:	8732                	mv	a4,a2
     1c6:	fcf42a23          	sw	a5,-44(s0)
     1ca:	87ba                	mv	a5,a4
     1cc:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     1d0:	fd843783          	ld	a5,-40(s0)
     1d4:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     1d8:	fe042623          	sw	zero,-20(s0)
     1dc:	a00d                	j	1fe <memset+0x46>
    cdst[i] = c;
     1de:	fec42783          	lw	a5,-20(s0)
     1e2:	fe043703          	ld	a4,-32(s0)
     1e6:	97ba                	add	a5,a5,a4
     1e8:	fd442703          	lw	a4,-44(s0)
     1ec:	0ff77713          	andi	a4,a4,255
     1f0:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1f4:	fec42783          	lw	a5,-20(s0)
     1f8:	2785                	addiw	a5,a5,1
     1fa:	fef42623          	sw	a5,-20(s0)
     1fe:	fec42703          	lw	a4,-20(s0)
     202:	fd042783          	lw	a5,-48(s0)
     206:	2781                	sext.w	a5,a5
     208:	fcf76be3          	bltu	a4,a5,1de <memset+0x26>
  }
  return dst;
     20c:	fd843783          	ld	a5,-40(s0)
}
     210:	853e                	mv	a0,a5
     212:	7422                	ld	s0,40(sp)
     214:	6145                	addi	sp,sp,48
     216:	8082                	ret

0000000000000218 <strchr>:

char*
strchr(const char *s, char c)
{
     218:	1101                	addi	sp,sp,-32
     21a:	ec22                	sd	s0,24(sp)
     21c:	1000                	addi	s0,sp,32
     21e:	fea43423          	sd	a0,-24(s0)
     222:	87ae                	mv	a5,a1
     224:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     228:	a01d                	j	24e <strchr+0x36>
    if(*s == c)
     22a:	fe843783          	ld	a5,-24(s0)
     22e:	0007c703          	lbu	a4,0(a5)
     232:	fe744783          	lbu	a5,-25(s0)
     236:	0ff7f793          	andi	a5,a5,255
     23a:	00e79563          	bne	a5,a4,244 <strchr+0x2c>
      return (char*)s;
     23e:	fe843783          	ld	a5,-24(s0)
     242:	a821                	j	25a <strchr+0x42>
  for(; *s; s++)
     244:	fe843783          	ld	a5,-24(s0)
     248:	0785                	addi	a5,a5,1
     24a:	fef43423          	sd	a5,-24(s0)
     24e:	fe843783          	ld	a5,-24(s0)
     252:	0007c783          	lbu	a5,0(a5)
     256:	fbf1                	bnez	a5,22a <strchr+0x12>
  return 0;
     258:	4781                	li	a5,0
}
     25a:	853e                	mv	a0,a5
     25c:	6462                	ld	s0,24(sp)
     25e:	6105                	addi	sp,sp,32
     260:	8082                	ret

0000000000000262 <gets>:

char*
gets(char *buf, int max)
{
     262:	7179                	addi	sp,sp,-48
     264:	f406                	sd	ra,40(sp)
     266:	f022                	sd	s0,32(sp)
     268:	1800                	addi	s0,sp,48
     26a:	fca43c23          	sd	a0,-40(s0)
     26e:	87ae                	mv	a5,a1
     270:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     274:	fe042623          	sw	zero,-20(s0)
     278:	a8a1                	j	2d0 <gets+0x6e>
    cc = read(0, &c, 1);
     27a:	fe740793          	addi	a5,s0,-25
     27e:	4605                	li	a2,1
     280:	85be                	mv	a1,a5
     282:	4501                	li	a0,0
     284:	00000097          	auipc	ra,0x0
     288:	2f6080e7          	jalr	758(ra) # 57a <read>
     28c:	87aa                	mv	a5,a0
     28e:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     292:	fe842783          	lw	a5,-24(s0)
     296:	2781                	sext.w	a5,a5
     298:	04f05763          	blez	a5,2e6 <gets+0x84>
      break;
    buf[i++] = c;
     29c:	fec42783          	lw	a5,-20(s0)
     2a0:	0017871b          	addiw	a4,a5,1
     2a4:	fee42623          	sw	a4,-20(s0)
     2a8:	873e                	mv	a4,a5
     2aa:	fd843783          	ld	a5,-40(s0)
     2ae:	97ba                	add	a5,a5,a4
     2b0:	fe744703          	lbu	a4,-25(s0)
     2b4:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     2b8:	fe744783          	lbu	a5,-25(s0)
     2bc:	873e                	mv	a4,a5
     2be:	47a9                	li	a5,10
     2c0:	02f70463          	beq	a4,a5,2e8 <gets+0x86>
     2c4:	fe744783          	lbu	a5,-25(s0)
     2c8:	873e                	mv	a4,a5
     2ca:	47b5                	li	a5,13
     2cc:	00f70e63          	beq	a4,a5,2e8 <gets+0x86>
  for(i=0; i+1 < max; ){
     2d0:	fec42783          	lw	a5,-20(s0)
     2d4:	2785                	addiw	a5,a5,1
     2d6:	0007871b          	sext.w	a4,a5
     2da:	fd442783          	lw	a5,-44(s0)
     2de:	2781                	sext.w	a5,a5
     2e0:	f8f74de3          	blt	a4,a5,27a <gets+0x18>
     2e4:	a011                	j	2e8 <gets+0x86>
      break;
     2e6:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2e8:	fec42783          	lw	a5,-20(s0)
     2ec:	fd843703          	ld	a4,-40(s0)
     2f0:	97ba                	add	a5,a5,a4
     2f2:	00078023          	sb	zero,0(a5)
  return buf;
     2f6:	fd843783          	ld	a5,-40(s0)
}
     2fa:	853e                	mv	a0,a5
     2fc:	70a2                	ld	ra,40(sp)
     2fe:	7402                	ld	s0,32(sp)
     300:	6145                	addi	sp,sp,48
     302:	8082                	ret

0000000000000304 <stat>:

int
stat(const char *n, struct stat *st)
{
     304:	7179                	addi	sp,sp,-48
     306:	f406                	sd	ra,40(sp)
     308:	f022                	sd	s0,32(sp)
     30a:	1800                	addi	s0,sp,48
     30c:	fca43c23          	sd	a0,-40(s0)
     310:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     314:	4581                	li	a1,0
     316:	fd843503          	ld	a0,-40(s0)
     31a:	00000097          	auipc	ra,0x0
     31e:	288080e7          	jalr	648(ra) # 5a2 <open>
     322:	87aa                	mv	a5,a0
     324:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     328:	fec42783          	lw	a5,-20(s0)
     32c:	2781                	sext.w	a5,a5
     32e:	0007d463          	bgez	a5,336 <stat+0x32>
    return -1;
     332:	57fd                	li	a5,-1
     334:	a035                	j	360 <stat+0x5c>
  r = fstat(fd, st);
     336:	fec42783          	lw	a5,-20(s0)
     33a:	fd043583          	ld	a1,-48(s0)
     33e:	853e                	mv	a0,a5
     340:	00000097          	auipc	ra,0x0
     344:	27a080e7          	jalr	634(ra) # 5ba <fstat>
     348:	87aa                	mv	a5,a0
     34a:	fef42423          	sw	a5,-24(s0)
  close(fd);
     34e:	fec42783          	lw	a5,-20(s0)
     352:	853e                	mv	a0,a5
     354:	00000097          	auipc	ra,0x0
     358:	236080e7          	jalr	566(ra) # 58a <close>
  return r;
     35c:	fe842783          	lw	a5,-24(s0)
}
     360:	853e                	mv	a0,a5
     362:	70a2                	ld	ra,40(sp)
     364:	7402                	ld	s0,32(sp)
     366:	6145                	addi	sp,sp,48
     368:	8082                	ret

000000000000036a <atoi>:

int
atoi(const char *s)
{
     36a:	7179                	addi	sp,sp,-48
     36c:	f422                	sd	s0,40(sp)
     36e:	1800                	addi	s0,sp,48
     370:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     374:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     378:	a815                	j	3ac <atoi+0x42>
    n = n*10 + *s++ - '0';
     37a:	fec42703          	lw	a4,-20(s0)
     37e:	87ba                	mv	a5,a4
     380:	0027979b          	slliw	a5,a5,0x2
     384:	9fb9                	addw	a5,a5,a4
     386:	0017979b          	slliw	a5,a5,0x1
     38a:	0007871b          	sext.w	a4,a5
     38e:	fd843783          	ld	a5,-40(s0)
     392:	00178693          	addi	a3,a5,1
     396:	fcd43c23          	sd	a3,-40(s0)
     39a:	0007c783          	lbu	a5,0(a5)
     39e:	2781                	sext.w	a5,a5
     3a0:	9fb9                	addw	a5,a5,a4
     3a2:	2781                	sext.w	a5,a5
     3a4:	fd07879b          	addiw	a5,a5,-48
     3a8:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     3ac:	fd843783          	ld	a5,-40(s0)
     3b0:	0007c783          	lbu	a5,0(a5)
     3b4:	873e                	mv	a4,a5
     3b6:	02f00793          	li	a5,47
     3ba:	00e7fb63          	bgeu	a5,a4,3d0 <atoi+0x66>
     3be:	fd843783          	ld	a5,-40(s0)
     3c2:	0007c783          	lbu	a5,0(a5)
     3c6:	873e                	mv	a4,a5
     3c8:	03900793          	li	a5,57
     3cc:	fae7f7e3          	bgeu	a5,a4,37a <atoi+0x10>
  return n;
     3d0:	fec42783          	lw	a5,-20(s0)
}
     3d4:	853e                	mv	a0,a5
     3d6:	7422                	ld	s0,40(sp)
     3d8:	6145                	addi	sp,sp,48
     3da:	8082                	ret

00000000000003dc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     3dc:	7139                	addi	sp,sp,-64
     3de:	fc22                	sd	s0,56(sp)
     3e0:	0080                	addi	s0,sp,64
     3e2:	fca43c23          	sd	a0,-40(s0)
     3e6:	fcb43823          	sd	a1,-48(s0)
     3ea:	87b2                	mv	a5,a2
     3ec:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3f0:	fd843783          	ld	a5,-40(s0)
     3f4:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3f8:	fd043783          	ld	a5,-48(s0)
     3fc:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     400:	fe043703          	ld	a4,-32(s0)
     404:	fe843783          	ld	a5,-24(s0)
     408:	02e7fc63          	bgeu	a5,a4,440 <memmove+0x64>
    while(n-- > 0)
     40c:	a00d                	j	42e <memmove+0x52>
      *dst++ = *src++;
     40e:	fe043703          	ld	a4,-32(s0)
     412:	00170793          	addi	a5,a4,1
     416:	fef43023          	sd	a5,-32(s0)
     41a:	fe843783          	ld	a5,-24(s0)
     41e:	00178693          	addi	a3,a5,1
     422:	fed43423          	sd	a3,-24(s0)
     426:	00074703          	lbu	a4,0(a4)
     42a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     42e:	fcc42783          	lw	a5,-52(s0)
     432:	fff7871b          	addiw	a4,a5,-1
     436:	fce42623          	sw	a4,-52(s0)
     43a:	fcf04ae3          	bgtz	a5,40e <memmove+0x32>
     43e:	a891                	j	492 <memmove+0xb6>
  } else {
    dst += n;
     440:	fcc42783          	lw	a5,-52(s0)
     444:	fe843703          	ld	a4,-24(s0)
     448:	97ba                	add	a5,a5,a4
     44a:	fef43423          	sd	a5,-24(s0)
    src += n;
     44e:	fcc42783          	lw	a5,-52(s0)
     452:	fe043703          	ld	a4,-32(s0)
     456:	97ba                	add	a5,a5,a4
     458:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     45c:	a01d                	j	482 <memmove+0xa6>
      *--dst = *--src;
     45e:	fe043783          	ld	a5,-32(s0)
     462:	17fd                	addi	a5,a5,-1
     464:	fef43023          	sd	a5,-32(s0)
     468:	fe843783          	ld	a5,-24(s0)
     46c:	17fd                	addi	a5,a5,-1
     46e:	fef43423          	sd	a5,-24(s0)
     472:	fe043783          	ld	a5,-32(s0)
     476:	0007c703          	lbu	a4,0(a5)
     47a:	fe843783          	ld	a5,-24(s0)
     47e:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     482:	fcc42783          	lw	a5,-52(s0)
     486:	fff7871b          	addiw	a4,a5,-1
     48a:	fce42623          	sw	a4,-52(s0)
     48e:	fcf048e3          	bgtz	a5,45e <memmove+0x82>
  }
  return vdst;
     492:	fd843783          	ld	a5,-40(s0)
}
     496:	853e                	mv	a0,a5
     498:	7462                	ld	s0,56(sp)
     49a:	6121                	addi	sp,sp,64
     49c:	8082                	ret

000000000000049e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     49e:	7139                	addi	sp,sp,-64
     4a0:	fc22                	sd	s0,56(sp)
     4a2:	0080                	addi	s0,sp,64
     4a4:	fca43c23          	sd	a0,-40(s0)
     4a8:	fcb43823          	sd	a1,-48(s0)
     4ac:	87b2                	mv	a5,a2
     4ae:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     4b2:	fd843783          	ld	a5,-40(s0)
     4b6:	fef43423          	sd	a5,-24(s0)
     4ba:	fd043783          	ld	a5,-48(s0)
     4be:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4c2:	a0a1                	j	50a <memcmp+0x6c>
    if (*p1 != *p2) {
     4c4:	fe843783          	ld	a5,-24(s0)
     4c8:	0007c703          	lbu	a4,0(a5)
     4cc:	fe043783          	ld	a5,-32(s0)
     4d0:	0007c783          	lbu	a5,0(a5)
     4d4:	02f70163          	beq	a4,a5,4f6 <memcmp+0x58>
      return *p1 - *p2;
     4d8:	fe843783          	ld	a5,-24(s0)
     4dc:	0007c783          	lbu	a5,0(a5)
     4e0:	0007871b          	sext.w	a4,a5
     4e4:	fe043783          	ld	a5,-32(s0)
     4e8:	0007c783          	lbu	a5,0(a5)
     4ec:	2781                	sext.w	a5,a5
     4ee:	40f707bb          	subw	a5,a4,a5
     4f2:	2781                	sext.w	a5,a5
     4f4:	a01d                	j	51a <memcmp+0x7c>
    }
    p1++;
     4f6:	fe843783          	ld	a5,-24(s0)
     4fa:	0785                	addi	a5,a5,1
     4fc:	fef43423          	sd	a5,-24(s0)
    p2++;
     500:	fe043783          	ld	a5,-32(s0)
     504:	0785                	addi	a5,a5,1
     506:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     50a:	fcc42783          	lw	a5,-52(s0)
     50e:	fff7871b          	addiw	a4,a5,-1
     512:	fce42623          	sw	a4,-52(s0)
     516:	f7dd                	bnez	a5,4c4 <memcmp+0x26>
  }
  return 0;
     518:	4781                	li	a5,0
}
     51a:	853e                	mv	a0,a5
     51c:	7462                	ld	s0,56(sp)
     51e:	6121                	addi	sp,sp,64
     520:	8082                	ret

0000000000000522 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     522:	7179                	addi	sp,sp,-48
     524:	f406                	sd	ra,40(sp)
     526:	f022                	sd	s0,32(sp)
     528:	1800                	addi	s0,sp,48
     52a:	fea43423          	sd	a0,-24(s0)
     52e:	feb43023          	sd	a1,-32(s0)
     532:	87b2                	mv	a5,a2
     534:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     538:	fdc42783          	lw	a5,-36(s0)
     53c:	863e                	mv	a2,a5
     53e:	fe043583          	ld	a1,-32(s0)
     542:	fe843503          	ld	a0,-24(s0)
     546:	00000097          	auipc	ra,0x0
     54a:	e96080e7          	jalr	-362(ra) # 3dc <memmove>
     54e:	87aa                	mv	a5,a0
}
     550:	853e                	mv	a0,a5
     552:	70a2                	ld	ra,40(sp)
     554:	7402                	ld	s0,32(sp)
     556:	6145                	addi	sp,sp,48
     558:	8082                	ret

000000000000055a <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     55a:	4885                	li	a7,1
 ecall
     55c:	00000073          	ecall
 ret
     560:	8082                	ret

0000000000000562 <exit>:
.global exit
exit:
 li a7, SYS_exit
     562:	4889                	li	a7,2
 ecall
     564:	00000073          	ecall
 ret
     568:	8082                	ret

000000000000056a <wait>:
.global wait
wait:
 li a7, SYS_wait
     56a:	488d                	li	a7,3
 ecall
     56c:	00000073          	ecall
 ret
     570:	8082                	ret

0000000000000572 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     572:	4891                	li	a7,4
 ecall
     574:	00000073          	ecall
 ret
     578:	8082                	ret

000000000000057a <read>:
.global read
read:
 li a7, SYS_read
     57a:	4895                	li	a7,5
 ecall
     57c:	00000073          	ecall
 ret
     580:	8082                	ret

0000000000000582 <write>:
.global write
write:
 li a7, SYS_write
     582:	48c1                	li	a7,16
 ecall
     584:	00000073          	ecall
 ret
     588:	8082                	ret

000000000000058a <close>:
.global close
close:
 li a7, SYS_close
     58a:	48d5                	li	a7,21
 ecall
     58c:	00000073          	ecall
 ret
     590:	8082                	ret

0000000000000592 <kill>:
.global kill
kill:
 li a7, SYS_kill
     592:	4899                	li	a7,6
 ecall
     594:	00000073          	ecall
 ret
     598:	8082                	ret

000000000000059a <exec>:
.global exec
exec:
 li a7, SYS_exec
     59a:	489d                	li	a7,7
 ecall
     59c:	00000073          	ecall
 ret
     5a0:	8082                	ret

00000000000005a2 <open>:
.global open
open:
 li a7, SYS_open
     5a2:	48bd                	li	a7,15
 ecall
     5a4:	00000073          	ecall
 ret
     5a8:	8082                	ret

00000000000005aa <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     5aa:	48c5                	li	a7,17
 ecall
     5ac:	00000073          	ecall
 ret
     5b0:	8082                	ret

00000000000005b2 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     5b2:	48c9                	li	a7,18
 ecall
     5b4:	00000073          	ecall
 ret
     5b8:	8082                	ret

00000000000005ba <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     5ba:	48a1                	li	a7,8
 ecall
     5bc:	00000073          	ecall
 ret
     5c0:	8082                	ret

00000000000005c2 <link>:
.global link
link:
 li a7, SYS_link
     5c2:	48cd                	li	a7,19
 ecall
     5c4:	00000073          	ecall
 ret
     5c8:	8082                	ret

00000000000005ca <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     5ca:	48d1                	li	a7,20
 ecall
     5cc:	00000073          	ecall
 ret
     5d0:	8082                	ret

00000000000005d2 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     5d2:	48a5                	li	a7,9
 ecall
     5d4:	00000073          	ecall
 ret
     5d8:	8082                	ret

00000000000005da <dup>:
.global dup
dup:
 li a7, SYS_dup
     5da:	48a9                	li	a7,10
 ecall
     5dc:	00000073          	ecall
 ret
     5e0:	8082                	ret

00000000000005e2 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     5e2:	48ad                	li	a7,11
 ecall
     5e4:	00000073          	ecall
 ret
     5e8:	8082                	ret

00000000000005ea <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5ea:	48b1                	li	a7,12
 ecall
     5ec:	00000073          	ecall
 ret
     5f0:	8082                	ret

00000000000005f2 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5f2:	48b5                	li	a7,13
 ecall
     5f4:	00000073          	ecall
 ret
     5f8:	8082                	ret

00000000000005fa <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5fa:	48b9                	li	a7,14
 ecall
     5fc:	00000073          	ecall
 ret
     600:	8082                	ret

0000000000000602 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     602:	48d9                	li	a7,22
 ecall
     604:	00000073          	ecall
 ret
     608:	8082                	ret

000000000000060a <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     60a:	48dd                	li	a7,23
 ecall
     60c:	00000073          	ecall
 ret
     610:	8082                	ret

0000000000000612 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     612:	48e1                	li	a7,24
 ecall
     614:	00000073          	ecall
 ret
     618:	8082                	ret

000000000000061a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     61a:	1101                	addi	sp,sp,-32
     61c:	ec06                	sd	ra,24(sp)
     61e:	e822                	sd	s0,16(sp)
     620:	1000                	addi	s0,sp,32
     622:	87aa                	mv	a5,a0
     624:	872e                	mv	a4,a1
     626:	fef42623          	sw	a5,-20(s0)
     62a:	87ba                	mv	a5,a4
     62c:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     630:	feb40713          	addi	a4,s0,-21
     634:	fec42783          	lw	a5,-20(s0)
     638:	4605                	li	a2,1
     63a:	85ba                	mv	a1,a4
     63c:	853e                	mv	a0,a5
     63e:	00000097          	auipc	ra,0x0
     642:	f44080e7          	jalr	-188(ra) # 582 <write>
}
     646:	0001                	nop
     648:	60e2                	ld	ra,24(sp)
     64a:	6442                	ld	s0,16(sp)
     64c:	6105                	addi	sp,sp,32
     64e:	8082                	ret

0000000000000650 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     650:	7139                	addi	sp,sp,-64
     652:	fc06                	sd	ra,56(sp)
     654:	f822                	sd	s0,48(sp)
     656:	0080                	addi	s0,sp,64
     658:	87aa                	mv	a5,a0
     65a:	8736                	mv	a4,a3
     65c:	fcf42623          	sw	a5,-52(s0)
     660:	87ae                	mv	a5,a1
     662:	fcf42423          	sw	a5,-56(s0)
     666:	87b2                	mv	a5,a2
     668:	fcf42223          	sw	a5,-60(s0)
     66c:	87ba                	mv	a5,a4
     66e:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     672:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     676:	fc042783          	lw	a5,-64(s0)
     67a:	2781                	sext.w	a5,a5
     67c:	c38d                	beqz	a5,69e <printint+0x4e>
     67e:	fc842783          	lw	a5,-56(s0)
     682:	2781                	sext.w	a5,a5
     684:	0007dd63          	bgez	a5,69e <printint+0x4e>
    neg = 1;
     688:	4785                	li	a5,1
     68a:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     68e:	fc842783          	lw	a5,-56(s0)
     692:	40f007bb          	negw	a5,a5
     696:	2781                	sext.w	a5,a5
     698:	fef42223          	sw	a5,-28(s0)
     69c:	a029                	j	6a6 <printint+0x56>
  } else {
    x = xx;
     69e:	fc842783          	lw	a5,-56(s0)
     6a2:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     6a6:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     6aa:	fc442783          	lw	a5,-60(s0)
     6ae:	fe442703          	lw	a4,-28(s0)
     6b2:	02f777bb          	remuw	a5,a4,a5
     6b6:	0007861b          	sext.w	a2,a5
     6ba:	fec42783          	lw	a5,-20(s0)
     6be:	0017871b          	addiw	a4,a5,1
     6c2:	fee42623          	sw	a4,-20(s0)
     6c6:	00002697          	auipc	a3,0x2
     6ca:	eea68693          	addi	a3,a3,-278 # 25b0 <digits>
     6ce:	02061713          	slli	a4,a2,0x20
     6d2:	9301                	srli	a4,a4,0x20
     6d4:	9736                	add	a4,a4,a3
     6d6:	00074703          	lbu	a4,0(a4)
     6da:	ff040693          	addi	a3,s0,-16
     6de:	97b6                	add	a5,a5,a3
     6e0:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     6e4:	fc442783          	lw	a5,-60(s0)
     6e8:	fe442703          	lw	a4,-28(s0)
     6ec:	02f757bb          	divuw	a5,a4,a5
     6f0:	fef42223          	sw	a5,-28(s0)
     6f4:	fe442783          	lw	a5,-28(s0)
     6f8:	2781                	sext.w	a5,a5
     6fa:	fbc5                	bnez	a5,6aa <printint+0x5a>
  if(neg)
     6fc:	fe842783          	lw	a5,-24(s0)
     700:	2781                	sext.w	a5,a5
     702:	cf95                	beqz	a5,73e <printint+0xee>
    buf[i++] = '-';
     704:	fec42783          	lw	a5,-20(s0)
     708:	0017871b          	addiw	a4,a5,1
     70c:	fee42623          	sw	a4,-20(s0)
     710:	ff040713          	addi	a4,s0,-16
     714:	97ba                	add	a5,a5,a4
     716:	02d00713          	li	a4,45
     71a:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     71e:	a005                	j	73e <printint+0xee>
    putc(fd, buf[i]);
     720:	fec42783          	lw	a5,-20(s0)
     724:	ff040713          	addi	a4,s0,-16
     728:	97ba                	add	a5,a5,a4
     72a:	fe07c703          	lbu	a4,-32(a5)
     72e:	fcc42783          	lw	a5,-52(s0)
     732:	85ba                	mv	a1,a4
     734:	853e                	mv	a0,a5
     736:	00000097          	auipc	ra,0x0
     73a:	ee4080e7          	jalr	-284(ra) # 61a <putc>
  while(--i >= 0)
     73e:	fec42783          	lw	a5,-20(s0)
     742:	37fd                	addiw	a5,a5,-1
     744:	fef42623          	sw	a5,-20(s0)
     748:	fec42783          	lw	a5,-20(s0)
     74c:	2781                	sext.w	a5,a5
     74e:	fc07d9e3          	bgez	a5,720 <printint+0xd0>
}
     752:	0001                	nop
     754:	0001                	nop
     756:	70e2                	ld	ra,56(sp)
     758:	7442                	ld	s0,48(sp)
     75a:	6121                	addi	sp,sp,64
     75c:	8082                	ret

000000000000075e <printptr>:

static void
printptr(int fd, uint64 x) {
     75e:	7179                	addi	sp,sp,-48
     760:	f406                	sd	ra,40(sp)
     762:	f022                	sd	s0,32(sp)
     764:	1800                	addi	s0,sp,48
     766:	87aa                	mv	a5,a0
     768:	fcb43823          	sd	a1,-48(s0)
     76c:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     770:	fdc42783          	lw	a5,-36(s0)
     774:	03000593          	li	a1,48
     778:	853e                	mv	a0,a5
     77a:	00000097          	auipc	ra,0x0
     77e:	ea0080e7          	jalr	-352(ra) # 61a <putc>
  putc(fd, 'x');
     782:	fdc42783          	lw	a5,-36(s0)
     786:	07800593          	li	a1,120
     78a:	853e                	mv	a0,a5
     78c:	00000097          	auipc	ra,0x0
     790:	e8e080e7          	jalr	-370(ra) # 61a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     794:	fe042623          	sw	zero,-20(s0)
     798:	a82d                	j	7d2 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     79a:	fd043783          	ld	a5,-48(s0)
     79e:	93f1                	srli	a5,a5,0x3c
     7a0:	00002717          	auipc	a4,0x2
     7a4:	e1070713          	addi	a4,a4,-496 # 25b0 <digits>
     7a8:	97ba                	add	a5,a5,a4
     7aa:	0007c703          	lbu	a4,0(a5)
     7ae:	fdc42783          	lw	a5,-36(s0)
     7b2:	85ba                	mv	a1,a4
     7b4:	853e                	mv	a0,a5
     7b6:	00000097          	auipc	ra,0x0
     7ba:	e64080e7          	jalr	-412(ra) # 61a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7be:	fec42783          	lw	a5,-20(s0)
     7c2:	2785                	addiw	a5,a5,1
     7c4:	fef42623          	sw	a5,-20(s0)
     7c8:	fd043783          	ld	a5,-48(s0)
     7cc:	0792                	slli	a5,a5,0x4
     7ce:	fcf43823          	sd	a5,-48(s0)
     7d2:	fec42783          	lw	a5,-20(s0)
     7d6:	873e                	mv	a4,a5
     7d8:	47bd                	li	a5,15
     7da:	fce7f0e3          	bgeu	a5,a4,79a <printptr+0x3c>
}
     7de:	0001                	nop
     7e0:	0001                	nop
     7e2:	70a2                	ld	ra,40(sp)
     7e4:	7402                	ld	s0,32(sp)
     7e6:	6145                	addi	sp,sp,48
     7e8:	8082                	ret

00000000000007ea <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7ea:	715d                	addi	sp,sp,-80
     7ec:	e486                	sd	ra,72(sp)
     7ee:	e0a2                	sd	s0,64(sp)
     7f0:	0880                	addi	s0,sp,80
     7f2:	87aa                	mv	a5,a0
     7f4:	fcb43023          	sd	a1,-64(s0)
     7f8:	fac43c23          	sd	a2,-72(s0)
     7fc:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     800:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     804:	fe042223          	sw	zero,-28(s0)
     808:	a42d                	j	a32 <vprintf+0x248>
    c = fmt[i] & 0xff;
     80a:	fe442783          	lw	a5,-28(s0)
     80e:	fc043703          	ld	a4,-64(s0)
     812:	97ba                	add	a5,a5,a4
     814:	0007c783          	lbu	a5,0(a5)
     818:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     81c:	fe042783          	lw	a5,-32(s0)
     820:	2781                	sext.w	a5,a5
     822:	eb9d                	bnez	a5,858 <vprintf+0x6e>
      if(c == '%'){
     824:	fdc42783          	lw	a5,-36(s0)
     828:	0007871b          	sext.w	a4,a5
     82c:	02500793          	li	a5,37
     830:	00f71763          	bne	a4,a5,83e <vprintf+0x54>
        state = '%';
     834:	02500793          	li	a5,37
     838:	fef42023          	sw	a5,-32(s0)
     83c:	a2f5                	j	a28 <vprintf+0x23e>
      } else {
        putc(fd, c);
     83e:	fdc42783          	lw	a5,-36(s0)
     842:	0ff7f713          	andi	a4,a5,255
     846:	fcc42783          	lw	a5,-52(s0)
     84a:	85ba                	mv	a1,a4
     84c:	853e                	mv	a0,a5
     84e:	00000097          	auipc	ra,0x0
     852:	dcc080e7          	jalr	-564(ra) # 61a <putc>
     856:	aac9                	j	a28 <vprintf+0x23e>
      }
    } else if(state == '%'){
     858:	fe042783          	lw	a5,-32(s0)
     85c:	0007871b          	sext.w	a4,a5
     860:	02500793          	li	a5,37
     864:	1cf71263          	bne	a4,a5,a28 <vprintf+0x23e>
      if(c == 'd'){
     868:	fdc42783          	lw	a5,-36(s0)
     86c:	0007871b          	sext.w	a4,a5
     870:	06400793          	li	a5,100
     874:	02f71463          	bne	a4,a5,89c <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     878:	fb843783          	ld	a5,-72(s0)
     87c:	00878713          	addi	a4,a5,8
     880:	fae43c23          	sd	a4,-72(s0)
     884:	4398                	lw	a4,0(a5)
     886:	fcc42783          	lw	a5,-52(s0)
     88a:	4685                	li	a3,1
     88c:	4629                	li	a2,10
     88e:	85ba                	mv	a1,a4
     890:	853e                	mv	a0,a5
     892:	00000097          	auipc	ra,0x0
     896:	dbe080e7          	jalr	-578(ra) # 650 <printint>
     89a:	a269                	j	a24 <vprintf+0x23a>
      } else if(c == 'l') {
     89c:	fdc42783          	lw	a5,-36(s0)
     8a0:	0007871b          	sext.w	a4,a5
     8a4:	06c00793          	li	a5,108
     8a8:	02f71663          	bne	a4,a5,8d4 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     8ac:	fb843783          	ld	a5,-72(s0)
     8b0:	00878713          	addi	a4,a5,8
     8b4:	fae43c23          	sd	a4,-72(s0)
     8b8:	639c                	ld	a5,0(a5)
     8ba:	0007871b          	sext.w	a4,a5
     8be:	fcc42783          	lw	a5,-52(s0)
     8c2:	4681                	li	a3,0
     8c4:	4629                	li	a2,10
     8c6:	85ba                	mv	a1,a4
     8c8:	853e                	mv	a0,a5
     8ca:	00000097          	auipc	ra,0x0
     8ce:	d86080e7          	jalr	-634(ra) # 650 <printint>
     8d2:	aa89                	j	a24 <vprintf+0x23a>
      } else if(c == 'x') {
     8d4:	fdc42783          	lw	a5,-36(s0)
     8d8:	0007871b          	sext.w	a4,a5
     8dc:	07800793          	li	a5,120
     8e0:	02f71463          	bne	a4,a5,908 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     8e4:	fb843783          	ld	a5,-72(s0)
     8e8:	00878713          	addi	a4,a5,8
     8ec:	fae43c23          	sd	a4,-72(s0)
     8f0:	4398                	lw	a4,0(a5)
     8f2:	fcc42783          	lw	a5,-52(s0)
     8f6:	4681                	li	a3,0
     8f8:	4641                	li	a2,16
     8fa:	85ba                	mv	a1,a4
     8fc:	853e                	mv	a0,a5
     8fe:	00000097          	auipc	ra,0x0
     902:	d52080e7          	jalr	-686(ra) # 650 <printint>
     906:	aa39                	j	a24 <vprintf+0x23a>
      } else if(c == 'p') {
     908:	fdc42783          	lw	a5,-36(s0)
     90c:	0007871b          	sext.w	a4,a5
     910:	07000793          	li	a5,112
     914:	02f71263          	bne	a4,a5,938 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     918:	fb843783          	ld	a5,-72(s0)
     91c:	00878713          	addi	a4,a5,8
     920:	fae43c23          	sd	a4,-72(s0)
     924:	6398                	ld	a4,0(a5)
     926:	fcc42783          	lw	a5,-52(s0)
     92a:	85ba                	mv	a1,a4
     92c:	853e                	mv	a0,a5
     92e:	00000097          	auipc	ra,0x0
     932:	e30080e7          	jalr	-464(ra) # 75e <printptr>
     936:	a0fd                	j	a24 <vprintf+0x23a>
      } else if(c == 's'){
     938:	fdc42783          	lw	a5,-36(s0)
     93c:	0007871b          	sext.w	a4,a5
     940:	07300793          	li	a5,115
     944:	04f71c63          	bne	a4,a5,99c <vprintf+0x1b2>
        s = va_arg(ap, char*);
     948:	fb843783          	ld	a5,-72(s0)
     94c:	00878713          	addi	a4,a5,8
     950:	fae43c23          	sd	a4,-72(s0)
     954:	639c                	ld	a5,0(a5)
     956:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     95a:	fe843783          	ld	a5,-24(s0)
     95e:	eb8d                	bnez	a5,990 <vprintf+0x1a6>
          s = "(null)";
     960:	00002797          	auipc	a5,0x2
     964:	b0878793          	addi	a5,a5,-1272 # 2468 <schedule_dm+0x29c>
     968:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     96c:	a015                	j	990 <vprintf+0x1a6>
          putc(fd, *s);
     96e:	fe843783          	ld	a5,-24(s0)
     972:	0007c703          	lbu	a4,0(a5)
     976:	fcc42783          	lw	a5,-52(s0)
     97a:	85ba                	mv	a1,a4
     97c:	853e                	mv	a0,a5
     97e:	00000097          	auipc	ra,0x0
     982:	c9c080e7          	jalr	-868(ra) # 61a <putc>
          s++;
     986:	fe843783          	ld	a5,-24(s0)
     98a:	0785                	addi	a5,a5,1
     98c:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     990:	fe843783          	ld	a5,-24(s0)
     994:	0007c783          	lbu	a5,0(a5)
     998:	fbf9                	bnez	a5,96e <vprintf+0x184>
     99a:	a069                	j	a24 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     99c:	fdc42783          	lw	a5,-36(s0)
     9a0:	0007871b          	sext.w	a4,a5
     9a4:	06300793          	li	a5,99
     9a8:	02f71463          	bne	a4,a5,9d0 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     9ac:	fb843783          	ld	a5,-72(s0)
     9b0:	00878713          	addi	a4,a5,8
     9b4:	fae43c23          	sd	a4,-72(s0)
     9b8:	439c                	lw	a5,0(a5)
     9ba:	0ff7f713          	andi	a4,a5,255
     9be:	fcc42783          	lw	a5,-52(s0)
     9c2:	85ba                	mv	a1,a4
     9c4:	853e                	mv	a0,a5
     9c6:	00000097          	auipc	ra,0x0
     9ca:	c54080e7          	jalr	-940(ra) # 61a <putc>
     9ce:	a899                	j	a24 <vprintf+0x23a>
      } else if(c == '%'){
     9d0:	fdc42783          	lw	a5,-36(s0)
     9d4:	0007871b          	sext.w	a4,a5
     9d8:	02500793          	li	a5,37
     9dc:	00f71f63          	bne	a4,a5,9fa <vprintf+0x210>
        putc(fd, c);
     9e0:	fdc42783          	lw	a5,-36(s0)
     9e4:	0ff7f713          	andi	a4,a5,255
     9e8:	fcc42783          	lw	a5,-52(s0)
     9ec:	85ba                	mv	a1,a4
     9ee:	853e                	mv	a0,a5
     9f0:	00000097          	auipc	ra,0x0
     9f4:	c2a080e7          	jalr	-982(ra) # 61a <putc>
     9f8:	a035                	j	a24 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9fa:	fcc42783          	lw	a5,-52(s0)
     9fe:	02500593          	li	a1,37
     a02:	853e                	mv	a0,a5
     a04:	00000097          	auipc	ra,0x0
     a08:	c16080e7          	jalr	-1002(ra) # 61a <putc>
        putc(fd, c);
     a0c:	fdc42783          	lw	a5,-36(s0)
     a10:	0ff7f713          	andi	a4,a5,255
     a14:	fcc42783          	lw	a5,-52(s0)
     a18:	85ba                	mv	a1,a4
     a1a:	853e                	mv	a0,a5
     a1c:	00000097          	auipc	ra,0x0
     a20:	bfe080e7          	jalr	-1026(ra) # 61a <putc>
      }
      state = 0;
     a24:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a28:	fe442783          	lw	a5,-28(s0)
     a2c:	2785                	addiw	a5,a5,1
     a2e:	fef42223          	sw	a5,-28(s0)
     a32:	fe442783          	lw	a5,-28(s0)
     a36:	fc043703          	ld	a4,-64(s0)
     a3a:	97ba                	add	a5,a5,a4
     a3c:	0007c783          	lbu	a5,0(a5)
     a40:	dc0795e3          	bnez	a5,80a <vprintf+0x20>
    }
  }
}
     a44:	0001                	nop
     a46:	0001                	nop
     a48:	60a6                	ld	ra,72(sp)
     a4a:	6406                	ld	s0,64(sp)
     a4c:	6161                	addi	sp,sp,80
     a4e:	8082                	ret

0000000000000a50 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a50:	7159                	addi	sp,sp,-112
     a52:	fc06                	sd	ra,56(sp)
     a54:	f822                	sd	s0,48(sp)
     a56:	0080                	addi	s0,sp,64
     a58:	fcb43823          	sd	a1,-48(s0)
     a5c:	e010                	sd	a2,0(s0)
     a5e:	e414                	sd	a3,8(s0)
     a60:	e818                	sd	a4,16(s0)
     a62:	ec1c                	sd	a5,24(s0)
     a64:	03043023          	sd	a6,32(s0)
     a68:	03143423          	sd	a7,40(s0)
     a6c:	87aa                	mv	a5,a0
     a6e:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a72:	03040793          	addi	a5,s0,48
     a76:	fcf43423          	sd	a5,-56(s0)
     a7a:	fc843783          	ld	a5,-56(s0)
     a7e:	fd078793          	addi	a5,a5,-48
     a82:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a86:	fe843703          	ld	a4,-24(s0)
     a8a:	fdc42783          	lw	a5,-36(s0)
     a8e:	863a                	mv	a2,a4
     a90:	fd043583          	ld	a1,-48(s0)
     a94:	853e                	mv	a0,a5
     a96:	00000097          	auipc	ra,0x0
     a9a:	d54080e7          	jalr	-684(ra) # 7ea <vprintf>
}
     a9e:	0001                	nop
     aa0:	70e2                	ld	ra,56(sp)
     aa2:	7442                	ld	s0,48(sp)
     aa4:	6165                	addi	sp,sp,112
     aa6:	8082                	ret

0000000000000aa8 <printf>:

void
printf(const char *fmt, ...)
{
     aa8:	7159                	addi	sp,sp,-112
     aaa:	f406                	sd	ra,40(sp)
     aac:	f022                	sd	s0,32(sp)
     aae:	1800                	addi	s0,sp,48
     ab0:	fca43c23          	sd	a0,-40(s0)
     ab4:	e40c                	sd	a1,8(s0)
     ab6:	e810                	sd	a2,16(s0)
     ab8:	ec14                	sd	a3,24(s0)
     aba:	f018                	sd	a4,32(s0)
     abc:	f41c                	sd	a5,40(s0)
     abe:	03043823          	sd	a6,48(s0)
     ac2:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     ac6:	04040793          	addi	a5,s0,64
     aca:	fcf43823          	sd	a5,-48(s0)
     ace:	fd043783          	ld	a5,-48(s0)
     ad2:	fc878793          	addi	a5,a5,-56
     ad6:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     ada:	fe843783          	ld	a5,-24(s0)
     ade:	863e                	mv	a2,a5
     ae0:	fd843583          	ld	a1,-40(s0)
     ae4:	4505                	li	a0,1
     ae6:	00000097          	auipc	ra,0x0
     aea:	d04080e7          	jalr	-764(ra) # 7ea <vprintf>
}
     aee:	0001                	nop
     af0:	70a2                	ld	ra,40(sp)
     af2:	7402                	ld	s0,32(sp)
     af4:	6165                	addi	sp,sp,112
     af6:	8082                	ret

0000000000000af8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     af8:	7179                	addi	sp,sp,-48
     afa:	f422                	sd	s0,40(sp)
     afc:	1800                	addi	s0,sp,48
     afe:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     b02:	fd843783          	ld	a5,-40(s0)
     b06:	17c1                	addi	a5,a5,-16
     b08:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b0c:	00002797          	auipc	a5,0x2
     b10:	afc78793          	addi	a5,a5,-1284 # 2608 <freep>
     b14:	639c                	ld	a5,0(a5)
     b16:	fef43423          	sd	a5,-24(s0)
     b1a:	a815                	j	b4e <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b1c:	fe843783          	ld	a5,-24(s0)
     b20:	639c                	ld	a5,0(a5)
     b22:	fe843703          	ld	a4,-24(s0)
     b26:	00f76f63          	bltu	a4,a5,b44 <free+0x4c>
     b2a:	fe043703          	ld	a4,-32(s0)
     b2e:	fe843783          	ld	a5,-24(s0)
     b32:	02e7eb63          	bltu	a5,a4,b68 <free+0x70>
     b36:	fe843783          	ld	a5,-24(s0)
     b3a:	639c                	ld	a5,0(a5)
     b3c:	fe043703          	ld	a4,-32(s0)
     b40:	02f76463          	bltu	a4,a5,b68 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b44:	fe843783          	ld	a5,-24(s0)
     b48:	639c                	ld	a5,0(a5)
     b4a:	fef43423          	sd	a5,-24(s0)
     b4e:	fe043703          	ld	a4,-32(s0)
     b52:	fe843783          	ld	a5,-24(s0)
     b56:	fce7f3e3          	bgeu	a5,a4,b1c <free+0x24>
     b5a:	fe843783          	ld	a5,-24(s0)
     b5e:	639c                	ld	a5,0(a5)
     b60:	fe043703          	ld	a4,-32(s0)
     b64:	faf77ce3          	bgeu	a4,a5,b1c <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b68:	fe043783          	ld	a5,-32(s0)
     b6c:	479c                	lw	a5,8(a5)
     b6e:	1782                	slli	a5,a5,0x20
     b70:	9381                	srli	a5,a5,0x20
     b72:	0792                	slli	a5,a5,0x4
     b74:	fe043703          	ld	a4,-32(s0)
     b78:	973e                	add	a4,a4,a5
     b7a:	fe843783          	ld	a5,-24(s0)
     b7e:	639c                	ld	a5,0(a5)
     b80:	02f71763          	bne	a4,a5,bae <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b84:	fe043783          	ld	a5,-32(s0)
     b88:	4798                	lw	a4,8(a5)
     b8a:	fe843783          	ld	a5,-24(s0)
     b8e:	639c                	ld	a5,0(a5)
     b90:	479c                	lw	a5,8(a5)
     b92:	9fb9                	addw	a5,a5,a4
     b94:	0007871b          	sext.w	a4,a5
     b98:	fe043783          	ld	a5,-32(s0)
     b9c:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b9e:	fe843783          	ld	a5,-24(s0)
     ba2:	639c                	ld	a5,0(a5)
     ba4:	6398                	ld	a4,0(a5)
     ba6:	fe043783          	ld	a5,-32(s0)
     baa:	e398                	sd	a4,0(a5)
     bac:	a039                	j	bba <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     bae:	fe843783          	ld	a5,-24(s0)
     bb2:	6398                	ld	a4,0(a5)
     bb4:	fe043783          	ld	a5,-32(s0)
     bb8:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     bba:	fe843783          	ld	a5,-24(s0)
     bbe:	479c                	lw	a5,8(a5)
     bc0:	1782                	slli	a5,a5,0x20
     bc2:	9381                	srli	a5,a5,0x20
     bc4:	0792                	slli	a5,a5,0x4
     bc6:	fe843703          	ld	a4,-24(s0)
     bca:	97ba                	add	a5,a5,a4
     bcc:	fe043703          	ld	a4,-32(s0)
     bd0:	02f71563          	bne	a4,a5,bfa <free+0x102>
    p->s.size += bp->s.size;
     bd4:	fe843783          	ld	a5,-24(s0)
     bd8:	4798                	lw	a4,8(a5)
     bda:	fe043783          	ld	a5,-32(s0)
     bde:	479c                	lw	a5,8(a5)
     be0:	9fb9                	addw	a5,a5,a4
     be2:	0007871b          	sext.w	a4,a5
     be6:	fe843783          	ld	a5,-24(s0)
     bea:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     bec:	fe043783          	ld	a5,-32(s0)
     bf0:	6398                	ld	a4,0(a5)
     bf2:	fe843783          	ld	a5,-24(s0)
     bf6:	e398                	sd	a4,0(a5)
     bf8:	a031                	j	c04 <free+0x10c>
  } else
    p->s.ptr = bp;
     bfa:	fe843783          	ld	a5,-24(s0)
     bfe:	fe043703          	ld	a4,-32(s0)
     c02:	e398                	sd	a4,0(a5)
  freep = p;
     c04:	00002797          	auipc	a5,0x2
     c08:	a0478793          	addi	a5,a5,-1532 # 2608 <freep>
     c0c:	fe843703          	ld	a4,-24(s0)
     c10:	e398                	sd	a4,0(a5)
}
     c12:	0001                	nop
     c14:	7422                	ld	s0,40(sp)
     c16:	6145                	addi	sp,sp,48
     c18:	8082                	ret

0000000000000c1a <morecore>:

static Header*
morecore(uint nu)
{
     c1a:	7179                	addi	sp,sp,-48
     c1c:	f406                	sd	ra,40(sp)
     c1e:	f022                	sd	s0,32(sp)
     c20:	1800                	addi	s0,sp,48
     c22:	87aa                	mv	a5,a0
     c24:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c28:	fdc42783          	lw	a5,-36(s0)
     c2c:	0007871b          	sext.w	a4,a5
     c30:	6785                	lui	a5,0x1
     c32:	00f77563          	bgeu	a4,a5,c3c <morecore+0x22>
    nu = 4096;
     c36:	6785                	lui	a5,0x1
     c38:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c3c:	fdc42783          	lw	a5,-36(s0)
     c40:	0047979b          	slliw	a5,a5,0x4
     c44:	2781                	sext.w	a5,a5
     c46:	2781                	sext.w	a5,a5
     c48:	853e                	mv	a0,a5
     c4a:	00000097          	auipc	ra,0x0
     c4e:	9a0080e7          	jalr	-1632(ra) # 5ea <sbrk>
     c52:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c56:	fe843703          	ld	a4,-24(s0)
     c5a:	57fd                	li	a5,-1
     c5c:	00f71463          	bne	a4,a5,c64 <morecore+0x4a>
    return 0;
     c60:	4781                	li	a5,0
     c62:	a03d                	j	c90 <morecore+0x76>
  hp = (Header*)p;
     c64:	fe843783          	ld	a5,-24(s0)
     c68:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c6c:	fe043783          	ld	a5,-32(s0)
     c70:	fdc42703          	lw	a4,-36(s0)
     c74:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c76:	fe043783          	ld	a5,-32(s0)
     c7a:	07c1                	addi	a5,a5,16
     c7c:	853e                	mv	a0,a5
     c7e:	00000097          	auipc	ra,0x0
     c82:	e7a080e7          	jalr	-390(ra) # af8 <free>
  return freep;
     c86:	00002797          	auipc	a5,0x2
     c8a:	98278793          	addi	a5,a5,-1662 # 2608 <freep>
     c8e:	639c                	ld	a5,0(a5)
}
     c90:	853e                	mv	a0,a5
     c92:	70a2                	ld	ra,40(sp)
     c94:	7402                	ld	s0,32(sp)
     c96:	6145                	addi	sp,sp,48
     c98:	8082                	ret

0000000000000c9a <malloc>:

void*
malloc(uint nbytes)
{
     c9a:	7139                	addi	sp,sp,-64
     c9c:	fc06                	sd	ra,56(sp)
     c9e:	f822                	sd	s0,48(sp)
     ca0:	0080                	addi	s0,sp,64
     ca2:	87aa                	mv	a5,a0
     ca4:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     ca8:	fcc46783          	lwu	a5,-52(s0)
     cac:	07bd                	addi	a5,a5,15
     cae:	8391                	srli	a5,a5,0x4
     cb0:	2781                	sext.w	a5,a5
     cb2:	2785                	addiw	a5,a5,1
     cb4:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     cb8:	00002797          	auipc	a5,0x2
     cbc:	95078793          	addi	a5,a5,-1712 # 2608 <freep>
     cc0:	639c                	ld	a5,0(a5)
     cc2:	fef43023          	sd	a5,-32(s0)
     cc6:	fe043783          	ld	a5,-32(s0)
     cca:	ef95                	bnez	a5,d06 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     ccc:	00002797          	auipc	a5,0x2
     cd0:	92c78793          	addi	a5,a5,-1748 # 25f8 <base>
     cd4:	fef43023          	sd	a5,-32(s0)
     cd8:	00002797          	auipc	a5,0x2
     cdc:	93078793          	addi	a5,a5,-1744 # 2608 <freep>
     ce0:	fe043703          	ld	a4,-32(s0)
     ce4:	e398                	sd	a4,0(a5)
     ce6:	00002797          	auipc	a5,0x2
     cea:	92278793          	addi	a5,a5,-1758 # 2608 <freep>
     cee:	6398                	ld	a4,0(a5)
     cf0:	00002797          	auipc	a5,0x2
     cf4:	90878793          	addi	a5,a5,-1784 # 25f8 <base>
     cf8:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     cfa:	00002797          	auipc	a5,0x2
     cfe:	8fe78793          	addi	a5,a5,-1794 # 25f8 <base>
     d02:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d06:	fe043783          	ld	a5,-32(s0)
     d0a:	639c                	ld	a5,0(a5)
     d0c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d10:	fe843783          	ld	a5,-24(s0)
     d14:	4798                	lw	a4,8(a5)
     d16:	fdc42783          	lw	a5,-36(s0)
     d1a:	2781                	sext.w	a5,a5
     d1c:	06f76863          	bltu	a4,a5,d8c <malloc+0xf2>
      if(p->s.size == nunits)
     d20:	fe843783          	ld	a5,-24(s0)
     d24:	4798                	lw	a4,8(a5)
     d26:	fdc42783          	lw	a5,-36(s0)
     d2a:	2781                	sext.w	a5,a5
     d2c:	00e79963          	bne	a5,a4,d3e <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d30:	fe843783          	ld	a5,-24(s0)
     d34:	6398                	ld	a4,0(a5)
     d36:	fe043783          	ld	a5,-32(s0)
     d3a:	e398                	sd	a4,0(a5)
     d3c:	a82d                	j	d76 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d3e:	fe843783          	ld	a5,-24(s0)
     d42:	4798                	lw	a4,8(a5)
     d44:	fdc42783          	lw	a5,-36(s0)
     d48:	40f707bb          	subw	a5,a4,a5
     d4c:	0007871b          	sext.w	a4,a5
     d50:	fe843783          	ld	a5,-24(s0)
     d54:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d56:	fe843783          	ld	a5,-24(s0)
     d5a:	479c                	lw	a5,8(a5)
     d5c:	1782                	slli	a5,a5,0x20
     d5e:	9381                	srli	a5,a5,0x20
     d60:	0792                	slli	a5,a5,0x4
     d62:	fe843703          	ld	a4,-24(s0)
     d66:	97ba                	add	a5,a5,a4
     d68:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d6c:	fe843783          	ld	a5,-24(s0)
     d70:	fdc42703          	lw	a4,-36(s0)
     d74:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d76:	00002797          	auipc	a5,0x2
     d7a:	89278793          	addi	a5,a5,-1902 # 2608 <freep>
     d7e:	fe043703          	ld	a4,-32(s0)
     d82:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d84:	fe843783          	ld	a5,-24(s0)
     d88:	07c1                	addi	a5,a5,16
     d8a:	a091                	j	dce <malloc+0x134>
    }
    if(p == freep)
     d8c:	00002797          	auipc	a5,0x2
     d90:	87c78793          	addi	a5,a5,-1924 # 2608 <freep>
     d94:	639c                	ld	a5,0(a5)
     d96:	fe843703          	ld	a4,-24(s0)
     d9a:	02f71063          	bne	a4,a5,dba <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d9e:	fdc42783          	lw	a5,-36(s0)
     da2:	853e                	mv	a0,a5
     da4:	00000097          	auipc	ra,0x0
     da8:	e76080e7          	jalr	-394(ra) # c1a <morecore>
     dac:	fea43423          	sd	a0,-24(s0)
     db0:	fe843783          	ld	a5,-24(s0)
     db4:	e399                	bnez	a5,dba <malloc+0x120>
        return 0;
     db6:	4781                	li	a5,0
     db8:	a819                	j	dce <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     dba:	fe843783          	ld	a5,-24(s0)
     dbe:	fef43023          	sd	a5,-32(s0)
     dc2:	fe843783          	ld	a5,-24(s0)
     dc6:	639c                	ld	a5,0(a5)
     dc8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     dcc:	b791                	j	d10 <malloc+0x76>
  }
}
     dce:	853e                	mv	a0,a5
     dd0:	70e2                	ld	ra,56(sp)
     dd2:	7442                	ld	s0,48(sp)
     dd4:	6121                	addi	sp,sp,64
     dd6:	8082                	ret

0000000000000dd8 <setjmp>:
     dd8:	e100                	sd	s0,0(a0)
     dda:	e504                	sd	s1,8(a0)
     ddc:	01253823          	sd	s2,16(a0)
     de0:	01353c23          	sd	s3,24(a0)
     de4:	03453023          	sd	s4,32(a0)
     de8:	03553423          	sd	s5,40(a0)
     dec:	03653823          	sd	s6,48(a0)
     df0:	03753c23          	sd	s7,56(a0)
     df4:	05853023          	sd	s8,64(a0)
     df8:	05953423          	sd	s9,72(a0)
     dfc:	05a53823          	sd	s10,80(a0)
     e00:	05b53c23          	sd	s11,88(a0)
     e04:	06153023          	sd	ra,96(a0)
     e08:	06253423          	sd	sp,104(a0)
     e0c:	4501                	li	a0,0
     e0e:	8082                	ret

0000000000000e10 <longjmp>:
     e10:	6100                	ld	s0,0(a0)
     e12:	6504                	ld	s1,8(a0)
     e14:	01053903          	ld	s2,16(a0)
     e18:	01853983          	ld	s3,24(a0)
     e1c:	02053a03          	ld	s4,32(a0)
     e20:	02853a83          	ld	s5,40(a0)
     e24:	03053b03          	ld	s6,48(a0)
     e28:	03853b83          	ld	s7,56(a0)
     e2c:	04053c03          	ld	s8,64(a0)
     e30:	04853c83          	ld	s9,72(a0)
     e34:	05053d03          	ld	s10,80(a0)
     e38:	05853d83          	ld	s11,88(a0)
     e3c:	06053083          	ld	ra,96(a0)
     e40:	06853103          	ld	sp,104(a0)
     e44:	c199                	beqz	a1,e4a <longjmp_1>
     e46:	852e                	mv	a0,a1
     e48:	8082                	ret

0000000000000e4a <longjmp_1>:
     e4a:	4505                	li	a0,1
     e4c:	8082                	ret

0000000000000e4e <__list_add>:
 * the prev/next entries already!
 */
static inline void __list_add(struct list_head *new_entry,
                              struct list_head *prev,
                              struct list_head *next)
{
     e4e:	7179                	addi	sp,sp,-48
     e50:	f422                	sd	s0,40(sp)
     e52:	1800                	addi	s0,sp,48
     e54:	fea43423          	sd	a0,-24(s0)
     e58:	feb43023          	sd	a1,-32(s0)
     e5c:	fcc43c23          	sd	a2,-40(s0)
    next->prev = new_entry;
     e60:	fd843783          	ld	a5,-40(s0)
     e64:	fe843703          	ld	a4,-24(s0)
     e68:	e798                	sd	a4,8(a5)
    new_entry->next = next;
     e6a:	fe843783          	ld	a5,-24(s0)
     e6e:	fd843703          	ld	a4,-40(s0)
     e72:	e398                	sd	a4,0(a5)
    new_entry->prev = prev;
     e74:	fe843783          	ld	a5,-24(s0)
     e78:	fe043703          	ld	a4,-32(s0)
     e7c:	e798                	sd	a4,8(a5)
    prev->next = new_entry;
     e7e:	fe043783          	ld	a5,-32(s0)
     e82:	fe843703          	ld	a4,-24(s0)
     e86:	e398                	sd	a4,0(a5)
}
     e88:	0001                	nop
     e8a:	7422                	ld	s0,40(sp)
     e8c:	6145                	addi	sp,sp,48
     e8e:	8082                	ret

0000000000000e90 <list_add_tail>:
 *
 * Insert a new entry before the specified head.
 * This is useful for implementing queues.
 */
static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
{
     e90:	1101                	addi	sp,sp,-32
     e92:	ec06                	sd	ra,24(sp)
     e94:	e822                	sd	s0,16(sp)
     e96:	1000                	addi	s0,sp,32
     e98:	fea43423          	sd	a0,-24(s0)
     e9c:	feb43023          	sd	a1,-32(s0)
    __list_add(new_entry, head->prev, head);
     ea0:	fe043783          	ld	a5,-32(s0)
     ea4:	679c                	ld	a5,8(a5)
     ea6:	fe043603          	ld	a2,-32(s0)
     eaa:	85be                	mv	a1,a5
     eac:	fe843503          	ld	a0,-24(s0)
     eb0:	00000097          	auipc	ra,0x0
     eb4:	f9e080e7          	jalr	-98(ra) # e4e <__list_add>
}
     eb8:	0001                	nop
     eba:	60e2                	ld	ra,24(sp)
     ebc:	6442                	ld	s0,16(sp)
     ebe:	6105                	addi	sp,sp,32
     ec0:	8082                	ret

0000000000000ec2 <__list_del>:
 *
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head *prev, struct list_head *next)
{
     ec2:	1101                	addi	sp,sp,-32
     ec4:	ec22                	sd	s0,24(sp)
     ec6:	1000                	addi	s0,sp,32
     ec8:	fea43423          	sd	a0,-24(s0)
     ecc:	feb43023          	sd	a1,-32(s0)
    next->prev = prev;
     ed0:	fe043783          	ld	a5,-32(s0)
     ed4:	fe843703          	ld	a4,-24(s0)
     ed8:	e798                	sd	a4,8(a5)
    prev->next = next;
     eda:	fe843783          	ld	a5,-24(s0)
     ede:	fe043703          	ld	a4,-32(s0)
     ee2:	e398                	sd	a4,0(a5)
}
     ee4:	0001                	nop
     ee6:	6462                	ld	s0,24(sp)
     ee8:	6105                	addi	sp,sp,32
     eea:	8082                	ret

0000000000000eec <list_del>:
 * @entry: the element to delete from the list.
 * Note: list_empty on entry does not return true after this, the entry is
 * in an undefined state.
 */
static inline void list_del(struct list_head *entry)
{
     eec:	1101                	addi	sp,sp,-32
     eee:	ec06                	sd	ra,24(sp)
     ef0:	e822                	sd	s0,16(sp)
     ef2:	1000                	addi	s0,sp,32
     ef4:	fea43423          	sd	a0,-24(s0)
    __list_del(entry->prev, entry->next);
     ef8:	fe843783          	ld	a5,-24(s0)
     efc:	6798                	ld	a4,8(a5)
     efe:	fe843783          	ld	a5,-24(s0)
     f02:	639c                	ld	a5,0(a5)
     f04:	85be                	mv	a1,a5
     f06:	853a                	mv	a0,a4
     f08:	00000097          	auipc	ra,0x0
     f0c:	fba080e7          	jalr	-70(ra) # ec2 <__list_del>
    entry->next = LIST_POISON1;
     f10:	fe843783          	ld	a5,-24(s0)
     f14:	00100737          	lui	a4,0x100
     f18:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd350>
     f1c:	e398                	sd	a4,0(a5)
    entry->prev = LIST_POISON2;
     f1e:	fe843783          	ld	a5,-24(s0)
     f22:	00200737          	lui	a4,0x200
     f26:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd450>
     f2a:	e798                	sd	a4,8(a5)
}
     f2c:	0001                	nop
     f2e:	60e2                	ld	ra,24(sp)
     f30:	6442                	ld	s0,16(sp)
     f32:	6105                	addi	sp,sp,32
     f34:	8082                	ret

0000000000000f36 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     f36:	1101                	addi	sp,sp,-32
     f38:	ec22                	sd	s0,24(sp)
     f3a:	1000                	addi	s0,sp,32
     f3c:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     f40:	fe843783          	ld	a5,-24(s0)
     f44:	639c                	ld	a5,0(a5)
     f46:	fe843703          	ld	a4,-24(s0)
     f4a:	40f707b3          	sub	a5,a4,a5
     f4e:	0017b793          	seqz	a5,a5
     f52:	0ff7f793          	andi	a5,a5,255
     f56:	2781                	sext.w	a5,a5
}
     f58:	853e                	mv	a0,a5
     f5a:	6462                	ld	s0,24(sp)
     f5c:	6105                	addi	sp,sp,32
     f5e:	8082                	ret

0000000000000f60 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     f60:	715d                	addi	sp,sp,-80
     f62:	e486                	sd	ra,72(sp)
     f64:	e0a2                	sd	s0,64(sp)
     f66:	0880                	addi	s0,sp,80
     f68:	fca43423          	sd	a0,-56(s0)
     f6c:	fcb43023          	sd	a1,-64(s0)
     f70:	85b2                	mv	a1,a2
     f72:	8636                	mv	a2,a3
     f74:	86ba                	mv	a3,a4
     f76:	873e                	mv	a4,a5
     f78:	87ae                	mv	a5,a1
     f7a:	faf42e23          	sw	a5,-68(s0)
     f7e:	87b2                	mv	a5,a2
     f80:	faf42c23          	sw	a5,-72(s0)
     f84:	87b6                	mv	a5,a3
     f86:	faf42a23          	sw	a5,-76(s0)
     f8a:	87ba                	mv	a5,a4
     f8c:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     f90:	06000513          	li	a0,96
     f94:	00000097          	auipc	ra,0x0
     f98:	d06080e7          	jalr	-762(ra) # c9a <malloc>
     f9c:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     fa0:	6505                	lui	a0,0x1
     fa2:	00000097          	auipc	ra,0x0
     fa6:	cf8080e7          	jalr	-776(ra) # c9a <malloc>
     faa:	87aa                	mv	a5,a0
     fac:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     fb0:	fe043703          	ld	a4,-32(s0)
     fb4:	6785                	lui	a5,0x1
     fb6:	17c1                	addi	a5,a5,-16
     fb8:	97ba                	add	a5,a5,a4
     fba:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     fbe:	fe843783          	ld	a5,-24(s0)
     fc2:	fc843703          	ld	a4,-56(s0)
     fc6:	e398                	sd	a4,0(a5)
    t->arg = arg;
     fc8:	fe843783          	ld	a5,-24(s0)
     fcc:	fc043703          	ld	a4,-64(s0)
     fd0:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     fd2:	00001797          	auipc	a5,0x1
     fd6:	61a78793          	addi	a5,a5,1562 # 25ec <_id.1229>
     fda:	439c                	lw	a5,0(a5)
     fdc:	0017871b          	addiw	a4,a5,1
     fe0:	0007069b          	sext.w	a3,a4
     fe4:	00001717          	auipc	a4,0x1
     fe8:	60870713          	addi	a4,a4,1544 # 25ec <_id.1229>
     fec:	c314                	sw	a3,0(a4)
     fee:	fe843703          	ld	a4,-24(s0)
     ff2:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
     ff4:	fe843783          	ld	a5,-24(s0)
     ff8:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
     ffc:	fe043703          	ld	a4,-32(s0)
    1000:	fe843783          	ld	a5,-24(s0)
    1004:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    1006:	fd843703          	ld	a4,-40(s0)
    100a:	fe843783          	ld	a5,-24(s0)
    100e:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    1010:	fe843783          	ld	a5,-24(s0)
    1014:	fb842703          	lw	a4,-72(s0)
    1018:	c3f8                	sw	a4,68(a5)
    t->period = period;
    101a:	fe843783          	ld	a5,-24(s0)
    101e:	fb442703          	lw	a4,-76(s0)
    1022:	cbb8                	sw	a4,80(a5)
    t->deadline = period;
    1024:	fe843783          	ld	a5,-24(s0)
    1028:	fb442703          	lw	a4,-76(s0)
    102c:	c7f8                	sw	a4,76(a5)
    t->n = n;
    102e:	fe843783          	ld	a5,-24(s0)
    1032:	fb042703          	lw	a4,-80(s0)
    1036:	cbf8                	sw	a4,84(a5)
    t->is_real_time = is_real_time;
    1038:	fe843783          	ld	a5,-24(s0)
    103c:	fbc42703          	lw	a4,-68(s0)
    1040:	c3b8                	sw	a4,64(a5)
    t->weight = 1;
    1042:	fe843783          	ld	a5,-24(s0)
    1046:	4705                	li	a4,1
    1048:	c7b8                	sw	a4,72(a5)
    t->remaining_time = processing_time;
    104a:	fe843783          	ld	a5,-24(s0)
    104e:	fb842703          	lw	a4,-72(s0)
    1052:	cfb8                	sw	a4,88(a5)
    t->current_deadline = 0;
    1054:	fe843783          	ld	a5,-24(s0)
    1058:	0407ae23          	sw	zero,92(a5)
    return t;
    105c:	fe843783          	ld	a5,-24(s0)
}
    1060:	853e                	mv	a0,a5
    1062:	60a6                	ld	ra,72(sp)
    1064:	6406                	ld	s0,64(sp)
    1066:	6161                	addi	sp,sp,80
    1068:	8082                	ret

000000000000106a <thread_set_weight>:

void thread_set_weight(struct thread *t, int weight)
{
    106a:	1101                	addi	sp,sp,-32
    106c:	ec22                	sd	s0,24(sp)
    106e:	1000                	addi	s0,sp,32
    1070:	fea43423          	sd	a0,-24(s0)
    1074:	87ae                	mv	a5,a1
    1076:	fef42223          	sw	a5,-28(s0)
    t->weight = weight;
    107a:	fe843783          	ld	a5,-24(s0)
    107e:	fe442703          	lw	a4,-28(s0)
    1082:	c7b8                	sw	a4,72(a5)
}
    1084:	0001                	nop
    1086:	6462                	ld	s0,24(sp)
    1088:	6105                	addi	sp,sp,32
    108a:	8082                	ret

000000000000108c <thread_add_at>:

void thread_add_at(struct thread *t, int arrival_time)
{
    108c:	7179                	addi	sp,sp,-48
    108e:	f406                	sd	ra,40(sp)
    1090:	f022                	sd	s0,32(sp)
    1092:	1800                	addi	s0,sp,48
    1094:	fca43c23          	sd	a0,-40(s0)
    1098:	87ae                	mv	a5,a1
    109a:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    109e:	02000513          	li	a0,32
    10a2:	00000097          	auipc	ra,0x0
    10a6:	bf8080e7          	jalr	-1032(ra) # c9a <malloc>
    10aa:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    10ae:	fe843783          	ld	a5,-24(s0)
    10b2:	fd843703          	ld	a4,-40(s0)
    10b6:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    10b8:	fe843783          	ld	a5,-24(s0)
    10bc:	fd442703          	lw	a4,-44(s0)
    10c0:	cf98                	sw	a4,24(a5)
    if (t->is_real_time) {
    10c2:	fd843783          	ld	a5,-40(s0)
    10c6:	43bc                	lw	a5,64(a5)
    10c8:	c38d                	beqz	a5,10ea <thread_add_at+0x5e>
        t->current_deadline = arrival_time;
    10ca:	fd843783          	ld	a5,-40(s0)
    10ce:	fd442703          	lw	a4,-44(s0)
    10d2:	cff8                	sw	a4,92(a5)
        t->current_deadline = arrival_time + t->deadline;
    10d4:	fd843783          	ld	a5,-40(s0)
    10d8:	47fc                	lw	a5,76(a5)
    10da:	fd442703          	lw	a4,-44(s0)
    10de:	9fb9                	addw	a5,a5,a4
    10e0:	0007871b          	sext.w	a4,a5
    10e4:	fd843783          	ld	a5,-40(s0)
    10e8:	cff8                	sw	a4,92(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    10ea:	fe843783          	ld	a5,-24(s0)
    10ee:	07a1                	addi	a5,a5,8
    10f0:	00001597          	auipc	a1,0x1
    10f4:	4e858593          	addi	a1,a1,1256 # 25d8 <release_queue>
    10f8:	853e                	mv	a0,a5
    10fa:	00000097          	auipc	ra,0x0
    10fe:	d96080e7          	jalr	-618(ra) # e90 <list_add_tail>
}
    1102:	0001                	nop
    1104:	70a2                	ld	ra,40(sp)
    1106:	7402                	ld	s0,32(sp)
    1108:	6145                	addi	sp,sp,48
    110a:	8082                	ret

000000000000110c <__release>:

void __release()
{
    110c:	7139                	addi	sp,sp,-64
    110e:	fc06                	sd	ra,56(sp)
    1110:	f822                	sd	s0,48(sp)
    1112:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1114:	00001797          	auipc	a5,0x1
    1118:	4c478793          	addi	a5,a5,1220 # 25d8 <release_queue>
    111c:	639c                	ld	a5,0(a5)
    111e:	fcf43c23          	sd	a5,-40(s0)
    1122:	fd843783          	ld	a5,-40(s0)
    1126:	17e1                	addi	a5,a5,-8
    1128:	fef43423          	sd	a5,-24(s0)
    112c:	fe843783          	ld	a5,-24(s0)
    1130:	679c                	ld	a5,8(a5)
    1132:	fcf43823          	sd	a5,-48(s0)
    1136:	fd043783          	ld	a5,-48(s0)
    113a:	17e1                	addi	a5,a5,-8
    113c:	fef43023          	sd	a5,-32(s0)
    1140:	a851                	j	11d4 <__release+0xc8>
        if (threading_system_time >= cur->release_time) {
    1142:	fe843783          	ld	a5,-24(s0)
    1146:	4f98                	lw	a4,24(a5)
    1148:	00001797          	auipc	a5,0x1
    114c:	4d078793          	addi	a5,a5,1232 # 2618 <threading_system_time>
    1150:	439c                	lw	a5,0(a5)
    1152:	06e7c363          	blt	a5,a4,11b8 <__release+0xac>
            cur->thrd->remaining_time = cur->thrd->processing_time;
    1156:	fe843783          	ld	a5,-24(s0)
    115a:	6398                	ld	a4,0(a5)
    115c:	fe843783          	ld	a5,-24(s0)
    1160:	639c                	ld	a5,0(a5)
    1162:	4378                	lw	a4,68(a4)
    1164:	cfb8                	sw	a4,88(a5)
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    1166:	fe843783          	ld	a5,-24(s0)
    116a:	4f94                	lw	a3,24(a5)
    116c:	fe843783          	ld	a5,-24(s0)
    1170:	639c                	ld	a5,0(a5)
    1172:	47f8                	lw	a4,76(a5)
    1174:	fe843783          	ld	a5,-24(s0)
    1178:	639c                	ld	a5,0(a5)
    117a:	9f35                	addw	a4,a4,a3
    117c:	2701                	sext.w	a4,a4
    117e:	cff8                	sw	a4,92(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    1180:	fe843783          	ld	a5,-24(s0)
    1184:	639c                	ld	a5,0(a5)
    1186:	02878793          	addi	a5,a5,40
    118a:	00001597          	auipc	a1,0x1
    118e:	43e58593          	addi	a1,a1,1086 # 25c8 <run_queue>
    1192:	853e                	mv	a0,a5
    1194:	00000097          	auipc	ra,0x0
    1198:	cfc080e7          	jalr	-772(ra) # e90 <list_add_tail>
            list_del(&cur->thread_list);
    119c:	fe843783          	ld	a5,-24(s0)
    11a0:	07a1                	addi	a5,a5,8
    11a2:	853e                	mv	a0,a5
    11a4:	00000097          	auipc	ra,0x0
    11a8:	d48080e7          	jalr	-696(ra) # eec <list_del>
            free(cur);
    11ac:	fe843503          	ld	a0,-24(s0)
    11b0:	00000097          	auipc	ra,0x0
    11b4:	948080e7          	jalr	-1720(ra) # af8 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    11b8:	fe043783          	ld	a5,-32(s0)
    11bc:	fef43423          	sd	a5,-24(s0)
    11c0:	fe043783          	ld	a5,-32(s0)
    11c4:	679c                	ld	a5,8(a5)
    11c6:	fcf43423          	sd	a5,-56(s0)
    11ca:	fc843783          	ld	a5,-56(s0)
    11ce:	17e1                	addi	a5,a5,-8
    11d0:	fef43023          	sd	a5,-32(s0)
    11d4:	fe843783          	ld	a5,-24(s0)
    11d8:	00878713          	addi	a4,a5,8
    11dc:	00001797          	auipc	a5,0x1
    11e0:	3fc78793          	addi	a5,a5,1020 # 25d8 <release_queue>
    11e4:	f4f71fe3          	bne	a4,a5,1142 <__release+0x36>
        }
    }
}
    11e8:	0001                	nop
    11ea:	0001                	nop
    11ec:	70e2                	ld	ra,56(sp)
    11ee:	7442                	ld	s0,48(sp)
    11f0:	6121                	addi	sp,sp,64
    11f2:	8082                	ret

00000000000011f4 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    11f4:	1101                	addi	sp,sp,-32
    11f6:	ec06                	sd	ra,24(sp)
    11f8:	e822                	sd	s0,16(sp)
    11fa:	1000                	addi	s0,sp,32
    11fc:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    1200:	fe843783          	ld	a5,-24(s0)
    1204:	7b98                	ld	a4,48(a5)
    1206:	00001797          	auipc	a5,0x1
    120a:	40a78793          	addi	a5,a5,1034 # 2610 <current>
    120e:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    1210:	fe843783          	ld	a5,-24(s0)
    1214:	02878793          	addi	a5,a5,40
    1218:	853e                	mv	a0,a5
    121a:	00000097          	auipc	ra,0x0
    121e:	cd2080e7          	jalr	-814(ra) # eec <list_del>

    free(to_remove->stack);
    1222:	fe843783          	ld	a5,-24(s0)
    1226:	6b9c                	ld	a5,16(a5)
    1228:	853e                	mv	a0,a5
    122a:	00000097          	auipc	ra,0x0
    122e:	8ce080e7          	jalr	-1842(ra) # af8 <free>
    free(to_remove);
    1232:	fe843503          	ld	a0,-24(s0)
    1236:	00000097          	auipc	ra,0x0
    123a:	8c2080e7          	jalr	-1854(ra) # af8 <free>

    __schedule();
    123e:	00000097          	auipc	ra,0x0
    1242:	572080e7          	jalr	1394(ra) # 17b0 <__schedule>
    __dispatch();
    1246:	00000097          	auipc	ra,0x0
    124a:	3da080e7          	jalr	986(ra) # 1620 <__dispatch>
    thrdresume(main_thrd_id);
    124e:	00001797          	auipc	a5,0x1
    1252:	39a78793          	addi	a5,a5,922 # 25e8 <main_thrd_id>
    1256:	439c                	lw	a5,0(a5)
    1258:	853e                	mv	a0,a5
    125a:	fffff097          	auipc	ra,0xfffff
    125e:	3b0080e7          	jalr	944(ra) # 60a <thrdresume>
}
    1262:	0001                	nop
    1264:	60e2                	ld	ra,24(sp)
    1266:	6442                	ld	s0,16(sp)
    1268:	6105                	addi	sp,sp,32
    126a:	8082                	ret

000000000000126c <thread_exit>:

void thread_exit(void)
{
    126c:	7179                	addi	sp,sp,-48
    126e:	f406                	sd	ra,40(sp)
    1270:	f022                	sd	s0,32(sp)
    1272:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1274:	00001797          	auipc	a5,0x1
    1278:	39c78793          	addi	a5,a5,924 # 2610 <current>
    127c:	6398                	ld	a4,0(a5)
    127e:	00001797          	auipc	a5,0x1
    1282:	34a78793          	addi	a5,a5,842 # 25c8 <run_queue>
    1286:	02f71063          	bne	a4,a5,12a6 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    128a:	00001597          	auipc	a1,0x1
    128e:	1e658593          	addi	a1,a1,486 # 2470 <schedule_dm+0x2a4>
    1292:	4509                	li	a0,2
    1294:	fffff097          	auipc	ra,0xfffff
    1298:	7bc080e7          	jalr	1980(ra) # a50 <fprintf>
        exit(1);
    129c:	4505                	li	a0,1
    129e:	fffff097          	auipc	ra,0xfffff
    12a2:	2c4080e7          	jalr	708(ra) # 562 <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    12a6:	00001797          	auipc	a5,0x1
    12aa:	36a78793          	addi	a5,a5,874 # 2610 <current>
    12ae:	639c                	ld	a5,0(a5)
    12b0:	fef43423          	sd	a5,-24(s0)
    12b4:	fe843783          	ld	a5,-24(s0)
    12b8:	fd878793          	addi	a5,a5,-40
    12bc:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    12c0:	fe043783          	ld	a5,-32(s0)
    12c4:	5f9c                	lw	a5,56(a5)
    12c6:	4585                	li	a1,1
    12c8:	853e                	mv	a0,a5
    12ca:	fffff097          	auipc	ra,0xfffff
    12ce:	348080e7          	jalr	840(ra) # 612 <cancelthrdstop>
    12d2:	87aa                	mv	a5,a0
    12d4:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    12d8:	00001797          	auipc	a5,0x1
    12dc:	34078793          	addi	a5,a5,832 # 2618 <threading_system_time>
    12e0:	439c                	lw	a5,0(a5)
    12e2:	fdc42703          	lw	a4,-36(s0)
    12e6:	9fb9                	addw	a5,a5,a4
    12e8:	0007871b          	sext.w	a4,a5
    12ec:	00001797          	auipc	a5,0x1
    12f0:	32c78793          	addi	a5,a5,812 # 2618 <threading_system_time>
    12f4:	c398                	sw	a4,0(a5)

    __release();
    12f6:	00000097          	auipc	ra,0x0
    12fa:	e16080e7          	jalr	-490(ra) # 110c <__release>
    __thread_exit(to_remove);
    12fe:	fe043503          	ld	a0,-32(s0)
    1302:	00000097          	auipc	ra,0x0
    1306:	ef2080e7          	jalr	-270(ra) # 11f4 <__thread_exit>
}
    130a:	0001                	nop
    130c:	70a2                	ld	ra,40(sp)
    130e:	7402                	ld	s0,32(sp)
    1310:	6145                	addi	sp,sp,48
    1312:	8082                	ret

0000000000001314 <__finish_current>:

void __finish_current()
{
    1314:	7179                	addi	sp,sp,-48
    1316:	f406                	sd	ra,40(sp)
    1318:	f022                	sd	s0,32(sp)
    131a:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    131c:	00001797          	auipc	a5,0x1
    1320:	2f478793          	addi	a5,a5,756 # 2610 <current>
    1324:	639c                	ld	a5,0(a5)
    1326:	fef43423          	sd	a5,-24(s0)
    132a:	fe843783          	ld	a5,-24(s0)
    132e:	fd878793          	addi	a5,a5,-40
    1332:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1336:	fe043783          	ld	a5,-32(s0)
    133a:	4bfc                	lw	a5,84(a5)
    133c:	37fd                	addiw	a5,a5,-1
    133e:	0007871b          	sext.w	a4,a5
    1342:	fe043783          	ld	a5,-32(s0)
    1346:	cbf8                	sw	a4,84(a5)

    printf("thread#%d finish at %d\n",
    1348:	fe043783          	ld	a5,-32(s0)
    134c:	5fd8                	lw	a4,60(a5)
    134e:	00001797          	auipc	a5,0x1
    1352:	2ca78793          	addi	a5,a5,714 # 2618 <threading_system_time>
    1356:	4390                	lw	a2,0(a5)
    1358:	fe043783          	ld	a5,-32(s0)
    135c:	4bfc                	lw	a5,84(a5)
    135e:	86be                	mv	a3,a5
    1360:	85ba                	mv	a1,a4
    1362:	00001517          	auipc	a0,0x1
    1366:	14650513          	addi	a0,a0,326 # 24a8 <schedule_dm+0x2dc>
    136a:	fffff097          	auipc	ra,0xfffff
    136e:	73e080e7          	jalr	1854(ra) # aa8 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1372:	fe043783          	ld	a5,-32(s0)
    1376:	4bfc                	lw	a5,84(a5)
    1378:	04f05563          	blez	a5,13c2 <__finish_current+0xae>
        struct list_head *to_remove = current;
    137c:	00001797          	auipc	a5,0x1
    1380:	29478793          	addi	a5,a5,660 # 2610 <current>
    1384:	639c                	ld	a5,0(a5)
    1386:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    138a:	00001797          	auipc	a5,0x1
    138e:	28678793          	addi	a5,a5,646 # 2610 <current>
    1392:	639c                	ld	a5,0(a5)
    1394:	6798                	ld	a4,8(a5)
    1396:	00001797          	auipc	a5,0x1
    139a:	27a78793          	addi	a5,a5,634 # 2610 <current>
    139e:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    13a0:	fd843503          	ld	a0,-40(s0)
    13a4:	00000097          	auipc	ra,0x0
    13a8:	b48080e7          	jalr	-1208(ra) # eec <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    13ac:	fe043783          	ld	a5,-32(s0)
    13b0:	4ffc                	lw	a5,92(a5)
    13b2:	85be                	mv	a1,a5
    13b4:	fe043503          	ld	a0,-32(s0)
    13b8:	00000097          	auipc	ra,0x0
    13bc:	cd4080e7          	jalr	-812(ra) # 108c <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    13c0:	a039                	j	13ce <__finish_current+0xba>
        __thread_exit(current_thread);
    13c2:	fe043503          	ld	a0,-32(s0)
    13c6:	00000097          	auipc	ra,0x0
    13ca:	e2e080e7          	jalr	-466(ra) # 11f4 <__thread_exit>
}
    13ce:	0001                	nop
    13d0:	70a2                	ld	ra,40(sp)
    13d2:	7402                	ld	s0,32(sp)
    13d4:	6145                	addi	sp,sp,48
    13d6:	8082                	ret

00000000000013d8 <__rt_finish_current>:
void __rt_finish_current()
{
    13d8:	7179                	addi	sp,sp,-48
    13da:	f406                	sd	ra,40(sp)
    13dc:	f022                	sd	s0,32(sp)
    13de:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    13e0:	00001797          	auipc	a5,0x1
    13e4:	23078793          	addi	a5,a5,560 # 2610 <current>
    13e8:	639c                	ld	a5,0(a5)
    13ea:	fef43423          	sd	a5,-24(s0)
    13ee:	fe843783          	ld	a5,-24(s0)
    13f2:	fd878793          	addi	a5,a5,-40
    13f6:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    13fa:	fe043783          	ld	a5,-32(s0)
    13fe:	4bfc                	lw	a5,84(a5)
    1400:	37fd                	addiw	a5,a5,-1
    1402:	0007871b          	sext.w	a4,a5
    1406:	fe043783          	ld	a5,-32(s0)
    140a:	cbf8                	sw	a4,84(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    140c:	fe043783          	ld	a5,-32(s0)
    1410:	5fd8                	lw	a4,60(a5)
    1412:	00001797          	auipc	a5,0x1
    1416:	20678793          	addi	a5,a5,518 # 2618 <threading_system_time>
    141a:	4390                	lw	a2,0(a5)
    141c:	fe043783          	ld	a5,-32(s0)
    1420:	4bfc                	lw	a5,84(a5)
    1422:	86be                	mv	a3,a5
    1424:	85ba                	mv	a1,a4
    1426:	00001517          	auipc	a0,0x1
    142a:	09a50513          	addi	a0,a0,154 # 24c0 <schedule_dm+0x2f4>
    142e:	fffff097          	auipc	ra,0xfffff
    1432:	67a080e7          	jalr	1658(ra) # aa8 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1436:	fe043783          	ld	a5,-32(s0)
    143a:	4bfc                	lw	a5,84(a5)
    143c:	04f05563          	blez	a5,1486 <__rt_finish_current+0xae>
        struct list_head *to_remove = current;
    1440:	00001797          	auipc	a5,0x1
    1444:	1d078793          	addi	a5,a5,464 # 2610 <current>
    1448:	639c                	ld	a5,0(a5)
    144a:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    144e:	00001797          	auipc	a5,0x1
    1452:	1c278793          	addi	a5,a5,450 # 2610 <current>
    1456:	639c                	ld	a5,0(a5)
    1458:	6798                	ld	a4,8(a5)
    145a:	00001797          	auipc	a5,0x1
    145e:	1b678793          	addi	a5,a5,438 # 2610 <current>
    1462:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1464:	fd843503          	ld	a0,-40(s0)
    1468:	00000097          	auipc	ra,0x0
    146c:	a84080e7          	jalr	-1404(ra) # eec <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    1470:	fe043783          	ld	a5,-32(s0)
    1474:	4ffc                	lw	a5,92(a5)
    1476:	85be                	mv	a1,a5
    1478:	fe043503          	ld	a0,-32(s0)
    147c:	00000097          	auipc	ra,0x0
    1480:	c10080e7          	jalr	-1008(ra) # 108c <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    1484:	a039                	j	1492 <__rt_finish_current+0xba>
        __thread_exit(current_thread);
    1486:	fe043503          	ld	a0,-32(s0)
    148a:	00000097          	auipc	ra,0x0
    148e:	d6a080e7          	jalr	-662(ra) # 11f4 <__thread_exit>
}
    1492:	0001                	nop
    1494:	70a2                	ld	ra,40(sp)
    1496:	7402                	ld	s0,32(sp)
    1498:	6145                	addi	sp,sp,48
    149a:	8082                	ret

000000000000149c <switch_handler>:

void switch_handler(void *arg)
{
    149c:	7139                	addi	sp,sp,-64
    149e:	fc06                	sd	ra,56(sp)
    14a0:	f822                	sd	s0,48(sp)
    14a2:	0080                	addi	s0,sp,64
    14a4:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    14a8:	fc843783          	ld	a5,-56(s0)
    14ac:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    14b0:	00001797          	auipc	a5,0x1
    14b4:	16078793          	addi	a5,a5,352 # 2610 <current>
    14b8:	639c                	ld	a5,0(a5)
    14ba:	fef43023          	sd	a5,-32(s0)
    14be:	fe043783          	ld	a5,-32(s0)
    14c2:	fd878793          	addi	a5,a5,-40
    14c6:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    14ca:	fe843783          	ld	a5,-24(s0)
    14ce:	0007871b          	sext.w	a4,a5
    14d2:	00001797          	auipc	a5,0x1
    14d6:	14678793          	addi	a5,a5,326 # 2618 <threading_system_time>
    14da:	439c                	lw	a5,0(a5)
    14dc:	2781                	sext.w	a5,a5
    14de:	9fb9                	addw	a5,a5,a4
    14e0:	2781                	sext.w	a5,a5
    14e2:	0007871b          	sext.w	a4,a5
    14e6:	00001797          	auipc	a5,0x1
    14ea:	13278793          	addi	a5,a5,306 # 2618 <threading_system_time>
    14ee:	c398                	sw	a4,0(a5)
     __release();
    14f0:	00000097          	auipc	ra,0x0
    14f4:	c1c080e7          	jalr	-996(ra) # 110c <__release>
    current_thread->remaining_time -= elapsed_time;
    14f8:	fd843783          	ld	a5,-40(s0)
    14fc:	4fbc                	lw	a5,88(a5)
    14fe:	0007871b          	sext.w	a4,a5
    1502:	fe843783          	ld	a5,-24(s0)
    1506:	2781                	sext.w	a5,a5
    1508:	40f707bb          	subw	a5,a4,a5
    150c:	2781                	sext.w	a5,a5
    150e:	0007871b          	sext.w	a4,a5
    1512:	fd843783          	ld	a5,-40(s0)
    1516:	cfb8                	sw	a4,88(a5)

    if (current_thread->is_real_time)
    1518:	fd843783          	ld	a5,-40(s0)
    151c:	43bc                	lw	a5,64(a5)
    151e:	c3ad                	beqz	a5,1580 <switch_handler+0xe4>
        if (threading_system_time > current_thread->current_deadline || 
    1520:	fd843783          	ld	a5,-40(s0)
    1524:	4ff8                	lw	a4,92(a5)
    1526:	00001797          	auipc	a5,0x1
    152a:	0f278793          	addi	a5,a5,242 # 2618 <threading_system_time>
    152e:	439c                	lw	a5,0(a5)
    1530:	02f74163          	blt	a4,a5,1552 <switch_handler+0xb6>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1534:	fd843783          	ld	a5,-40(s0)
    1538:	4ff8                	lw	a4,92(a5)
    153a:	00001797          	auipc	a5,0x1
    153e:	0de78793          	addi	a5,a5,222 # 2618 <threading_system_time>
    1542:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    1544:	02f71e63          	bne	a4,a5,1580 <switch_handler+0xe4>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1548:	fd843783          	ld	a5,-40(s0)
    154c:	4fbc                	lw	a5,88(a5)
    154e:	02f05963          	blez	a5,1580 <switch_handler+0xe4>
            printf("thread#%d misses a deadline at %d\n", current_thread->ID, threading_system_time);
    1552:	fd843783          	ld	a5,-40(s0)
    1556:	5fd8                	lw	a4,60(a5)
    1558:	00001797          	auipc	a5,0x1
    155c:	0c078793          	addi	a5,a5,192 # 2618 <threading_system_time>
    1560:	439c                	lw	a5,0(a5)
    1562:	863e                	mv	a2,a5
    1564:	85ba                	mv	a1,a4
    1566:	00001517          	auipc	a0,0x1
    156a:	f9250513          	addi	a0,a0,-110 # 24f8 <schedule_dm+0x32c>
    156e:	fffff097          	auipc	ra,0xfffff
    1572:	53a080e7          	jalr	1338(ra) # aa8 <printf>
            exit(0);
    1576:	4501                	li	a0,0
    1578:	fffff097          	auipc	ra,0xfffff
    157c:	fea080e7          	jalr	-22(ra) # 562 <exit>
        }

    if (current_thread->remaining_time <= 0) {
    1580:	fd843783          	ld	a5,-40(s0)
    1584:	4fbc                	lw	a5,88(a5)
    1586:	02f04063          	bgtz	a5,15a6 <switch_handler+0x10a>
        if (current_thread->is_real_time)
    158a:	fd843783          	ld	a5,-40(s0)
    158e:	43bc                	lw	a5,64(a5)
    1590:	c791                	beqz	a5,159c <switch_handler+0x100>
            __rt_finish_current();
    1592:	00000097          	auipc	ra,0x0
    1596:	e46080e7          	jalr	-442(ra) # 13d8 <__rt_finish_current>
    159a:	a881                	j	15ea <switch_handler+0x14e>
        else
            __finish_current();
    159c:	00000097          	auipc	ra,0x0
    15a0:	d78080e7          	jalr	-648(ra) # 1314 <__finish_current>
    15a4:	a099                	j	15ea <switch_handler+0x14e>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    15a6:	00001797          	auipc	a5,0x1
    15aa:	06a78793          	addi	a5,a5,106 # 2610 <current>
    15ae:	639c                	ld	a5,0(a5)
    15b0:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    15b4:	00001797          	auipc	a5,0x1
    15b8:	05c78793          	addi	a5,a5,92 # 2610 <current>
    15bc:	639c                	ld	a5,0(a5)
    15be:	6798                	ld	a4,8(a5)
    15c0:	00001797          	auipc	a5,0x1
    15c4:	05078793          	addi	a5,a5,80 # 2610 <current>
    15c8:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    15ca:	fd043503          	ld	a0,-48(s0)
    15ce:	00000097          	auipc	ra,0x0
    15d2:	91e080e7          	jalr	-1762(ra) # eec <list_del>
        list_add_tail(to_remove, &run_queue);
    15d6:	00001597          	auipc	a1,0x1
    15da:	ff258593          	addi	a1,a1,-14 # 25c8 <run_queue>
    15de:	fd043503          	ld	a0,-48(s0)
    15e2:	00000097          	auipc	ra,0x0
    15e6:	8ae080e7          	jalr	-1874(ra) # e90 <list_add_tail>
    }

    __release();
    15ea:	00000097          	auipc	ra,0x0
    15ee:	b22080e7          	jalr	-1246(ra) # 110c <__release>
    __schedule();
    15f2:	00000097          	auipc	ra,0x0
    15f6:	1be080e7          	jalr	446(ra) # 17b0 <__schedule>
    __dispatch();
    15fa:	00000097          	auipc	ra,0x0
    15fe:	026080e7          	jalr	38(ra) # 1620 <__dispatch>
    thrdresume(main_thrd_id);
    1602:	00001797          	auipc	a5,0x1
    1606:	fe678793          	addi	a5,a5,-26 # 25e8 <main_thrd_id>
    160a:	439c                	lw	a5,0(a5)
    160c:	853e                	mv	a0,a5
    160e:	fffff097          	auipc	ra,0xfffff
    1612:	ffc080e7          	jalr	-4(ra) # 60a <thrdresume>
}
    1616:	0001                	nop
    1618:	70e2                	ld	ra,56(sp)
    161a:	7442                	ld	s0,48(sp)
    161c:	6121                	addi	sp,sp,64
    161e:	8082                	ret

0000000000001620 <__dispatch>:

void __dispatch()
{
    1620:	7179                	addi	sp,sp,-48
    1622:	f406                	sd	ra,40(sp)
    1624:	f022                	sd	s0,32(sp)
    1626:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1628:	00001797          	auipc	a5,0x1
    162c:	fe878793          	addi	a5,a5,-24 # 2610 <current>
    1630:	6398                	ld	a4,0(a5)
    1632:	00001797          	auipc	a5,0x1
    1636:	f9678793          	addi	a5,a5,-106 # 25c8 <run_queue>
    163a:	16f70663          	beq	a4,a5,17a6 <__dispatch+0x186>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }

    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    163e:	00001797          	auipc	a5,0x1
    1642:	fd278793          	addi	a5,a5,-46 # 2610 <current>
    1646:	639c                	ld	a5,0(a5)
    1648:	fef43423          	sd	a5,-24(s0)
    164c:	fe843783          	ld	a5,-24(s0)
    1650:	fd878793          	addi	a5,a5,-40
    1654:	fef43023          	sd	a5,-32(s0)
    if (current_thread->is_real_time && allocated_time == 0) { // miss deadline, abort
    1658:	fe043783          	ld	a5,-32(s0)
    165c:	43bc                	lw	a5,64(a5)
    165e:	cf85                	beqz	a5,1696 <__dispatch+0x76>
    1660:	00001797          	auipc	a5,0x1
    1664:	fc078793          	addi	a5,a5,-64 # 2620 <allocated_time>
    1668:	639c                	ld	a5,0(a5)
    166a:	e795                	bnez	a5,1696 <__dispatch+0x76>
        printf("thread#%d misses a deadline at %d\n", current_thread->ID, current_thread->current_deadline);
    166c:	fe043783          	ld	a5,-32(s0)
    1670:	5fd8                	lw	a4,60(a5)
    1672:	fe043783          	ld	a5,-32(s0)
    1676:	4ffc                	lw	a5,92(a5)
    1678:	863e                	mv	a2,a5
    167a:	85ba                	mv	a1,a4
    167c:	00001517          	auipc	a0,0x1
    1680:	e7c50513          	addi	a0,a0,-388 # 24f8 <schedule_dm+0x32c>
    1684:	fffff097          	auipc	ra,0xfffff
    1688:	424080e7          	jalr	1060(ra) # aa8 <printf>
        exit(0);
    168c:	4501                	li	a0,0
    168e:	fffff097          	auipc	ra,0xfffff
    1692:	ed4080e7          	jalr	-300(ra) # 562 <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    1696:	fe043783          	ld	a5,-32(s0)
    169a:	5fd8                	lw	a4,60(a5)
    169c:	00001797          	auipc	a5,0x1
    16a0:	f7c78793          	addi	a5,a5,-132 # 2618 <threading_system_time>
    16a4:	4390                	lw	a2,0(a5)
    16a6:	00001797          	auipc	a5,0x1
    16aa:	f7a78793          	addi	a5,a5,-134 # 2620 <allocated_time>
    16ae:	639c                	ld	a5,0(a5)
    16b0:	86be                	mv	a3,a5
    16b2:	85ba                	mv	a1,a4
    16b4:	00001517          	auipc	a0,0x1
    16b8:	e6c50513          	addi	a0,a0,-404 # 2520 <schedule_dm+0x354>
    16bc:	fffff097          	auipc	ra,0xfffff
    16c0:	3ec080e7          	jalr	1004(ra) # aa8 <printf>

    if (current_thread->buf_set) {
    16c4:	fe043783          	ld	a5,-32(s0)
    16c8:	539c                	lw	a5,32(a5)
    16ca:	c7a1                	beqz	a5,1712 <__dispatch+0xf2>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    16cc:	00001797          	auipc	a5,0x1
    16d0:	f5478793          	addi	a5,a5,-172 # 2620 <allocated_time>
    16d4:	639c                	ld	a5,0(a5)
    16d6:	0007871b          	sext.w	a4,a5
    16da:	fe043783          	ld	a5,-32(s0)
    16de:	03878593          	addi	a1,a5,56
    16e2:	00001797          	auipc	a5,0x1
    16e6:	f3e78793          	addi	a5,a5,-194 # 2620 <allocated_time>
    16ea:	639c                	ld	a5,0(a5)
    16ec:	86be                	mv	a3,a5
    16ee:	00000617          	auipc	a2,0x0
    16f2:	dae60613          	addi	a2,a2,-594 # 149c <switch_handler>
    16f6:	853a                	mv	a0,a4
    16f8:	fffff097          	auipc	ra,0xfffff
    16fc:	f0a080e7          	jalr	-246(ra) # 602 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    1700:	fe043783          	ld	a5,-32(s0)
    1704:	5f9c                	lw	a5,56(a5)
    1706:	853e                	mv	a0,a5
    1708:	fffff097          	auipc	ra,0xfffff
    170c:	f02080e7          	jalr	-254(ra) # 60a <thrdresume>
    1710:	a071                	j	179c <__dispatch+0x17c>
    } else {
        current_thread->buf_set = 1;
    1712:	fe043783          	ld	a5,-32(s0)
    1716:	4705                	li	a4,1
    1718:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    171a:	fe043783          	ld	a5,-32(s0)
    171e:	6f9c                	ld	a5,24(a5)
    1720:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1724:	fe043783          	ld	a5,-32(s0)
    1728:	577d                	li	a4,-1
    172a:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    172c:	00001797          	auipc	a5,0x1
    1730:	ef478793          	addi	a5,a5,-268 # 2620 <allocated_time>
    1734:	639c                	ld	a5,0(a5)
    1736:	0007871b          	sext.w	a4,a5
    173a:	fe043783          	ld	a5,-32(s0)
    173e:	03878593          	addi	a1,a5,56
    1742:	00001797          	auipc	a5,0x1
    1746:	ede78793          	addi	a5,a5,-290 # 2620 <allocated_time>
    174a:	639c                	ld	a5,0(a5)
    174c:	86be                	mv	a3,a5
    174e:	00000617          	auipc	a2,0x0
    1752:	d4e60613          	addi	a2,a2,-690 # 149c <switch_handler>
    1756:	853a                	mv	a0,a4
    1758:	fffff097          	auipc	ra,0xfffff
    175c:	eaa080e7          	jalr	-342(ra) # 602 <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    1760:	fe043783          	ld	a5,-32(s0)
    1764:	5f9c                	lw	a5,56(a5)
    1766:	0207d063          	bgez	a5,1786 <__dispatch+0x166>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    176a:	00001597          	auipc	a1,0x1
    176e:	de658593          	addi	a1,a1,-538 # 2550 <schedule_dm+0x384>
    1772:	4509                	li	a0,2
    1774:	fffff097          	auipc	ra,0xfffff
    1778:	2dc080e7          	jalr	732(ra) # a50 <fprintf>
            exit(1);
    177c:	4505                	li	a0,1
    177e:	fffff097          	auipc	ra,0xfffff
    1782:	de4080e7          	jalr	-540(ra) # 562 <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    1786:	fd843783          	ld	a5,-40(s0)
    178a:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    178c:	fe043783          	ld	a5,-32(s0)
    1790:	6398                	ld	a4,0(a5)
    1792:	fe043783          	ld	a5,-32(s0)
    1796:	679c                	ld	a5,8(a5)
    1798:	853e                	mv	a0,a5
    179a:	9702                	jalr	a4
    }
    thread_exit();
    179c:	00000097          	auipc	ra,0x0
    17a0:	ad0080e7          	jalr	-1328(ra) # 126c <thread_exit>
    17a4:	a011                	j	17a8 <__dispatch+0x188>
        return;
    17a6:	0001                	nop
}
    17a8:	70a2                	ld	ra,40(sp)
    17aa:	7402                	ld	s0,32(sp)
    17ac:	6145                	addi	sp,sp,48
    17ae:	8082                	ret

00000000000017b0 <__schedule>:

void __schedule()
{
    17b0:	711d                	addi	sp,sp,-96
    17b2:	ec86                	sd	ra,88(sp)
    17b4:	e8a2                	sd	s0,80(sp)
    17b6:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    17b8:	00001797          	auipc	a5,0x1
    17bc:	e6078793          	addi	a5,a5,-416 # 2618 <threading_system_time>
    17c0:	439c                	lw	a5,0(a5)
    17c2:	fcf42c23          	sw	a5,-40(s0)
    17c6:	4789                	li	a5,2
    17c8:	fcf42e23          	sw	a5,-36(s0)
    17cc:	00001797          	auipc	a5,0x1
    17d0:	dfc78793          	addi	a5,a5,-516 # 25c8 <run_queue>
    17d4:	fef43023          	sd	a5,-32(s0)
    17d8:	00001797          	auipc	a5,0x1
    17dc:	e0078793          	addi	a5,a5,-512 # 25d8 <release_queue>
    17e0:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_WRR
    r = schedule_wrr(args);
#endif

#ifdef THREAD_SCHEDULER_SJF
    r = schedule_sjf(args);
    17e4:	fd843783          	ld	a5,-40(s0)
    17e8:	faf43023          	sd	a5,-96(s0)
    17ec:	fe043783          	ld	a5,-32(s0)
    17f0:	faf43423          	sd	a5,-88(s0)
    17f4:	fe843783          	ld	a5,-24(s0)
    17f8:	faf43823          	sd	a5,-80(s0)
    17fc:	fa040793          	addi	a5,s0,-96
    1800:	853e                	mv	a0,a5
    1802:	00000097          	auipc	ra,0x0
    1806:	4c4080e7          	jalr	1220(ra) # 1cc6 <schedule_sjf>
    180a:	872a                	mv	a4,a0
    180c:	87ae                	mv	a5,a1
    180e:	fce43423          	sd	a4,-56(s0)
    1812:	fcf43823          	sd	a5,-48(s0)

#ifdef THREAD_SCHEDULER_DM
    r = schedule_dm(args);
#endif

    current = r.scheduled_thread_list_member;
    1816:	fc843703          	ld	a4,-56(s0)
    181a:	00001797          	auipc	a5,0x1
    181e:	df678793          	addi	a5,a5,-522 # 2610 <current>
    1822:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1824:	fd042783          	lw	a5,-48(s0)
    1828:	873e                	mv	a4,a5
    182a:	00001797          	auipc	a5,0x1
    182e:	df678793          	addi	a5,a5,-522 # 2620 <allocated_time>
    1832:	e398                	sd	a4,0(a5)
}
    1834:	0001                	nop
    1836:	60e6                	ld	ra,88(sp)
    1838:	6446                	ld	s0,80(sp)
    183a:	6125                	addi	sp,sp,96
    183c:	8082                	ret

000000000000183e <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    183e:	1101                	addi	sp,sp,-32
    1840:	ec06                	sd	ra,24(sp)
    1842:	e822                	sd	s0,16(sp)
    1844:	1000                	addi	s0,sp,32
    1846:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    184a:	00001797          	auipc	a5,0x1
    184e:	dd278793          	addi	a5,a5,-558 # 261c <sleeping>
    1852:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1856:	fe843783          	ld	a5,-24(s0)
    185a:	0007871b          	sext.w	a4,a5
    185e:	00001797          	auipc	a5,0x1
    1862:	dba78793          	addi	a5,a5,-582 # 2618 <threading_system_time>
    1866:	439c                	lw	a5,0(a5)
    1868:	2781                	sext.w	a5,a5
    186a:	9fb9                	addw	a5,a5,a4
    186c:	2781                	sext.w	a5,a5
    186e:	0007871b          	sext.w	a4,a5
    1872:	00001797          	auipc	a5,0x1
    1876:	da678793          	addi	a5,a5,-602 # 2618 <threading_system_time>
    187a:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    187c:	00001797          	auipc	a5,0x1
    1880:	d6c78793          	addi	a5,a5,-660 # 25e8 <main_thrd_id>
    1884:	439c                	lw	a5,0(a5)
    1886:	853e                	mv	a0,a5
    1888:	fffff097          	auipc	ra,0xfffff
    188c:	d82080e7          	jalr	-638(ra) # 60a <thrdresume>
}
    1890:	0001                	nop
    1892:	60e2                	ld	ra,24(sp)
    1894:	6442                	ld	s0,16(sp)
    1896:	6105                	addi	sp,sp,32
    1898:	8082                	ret

000000000000189a <thread_start_threading>:

void thread_start_threading()
{
    189a:	1141                	addi	sp,sp,-16
    189c:	e406                	sd	ra,8(sp)
    189e:	e022                	sd	s0,0(sp)
    18a0:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    18a2:	00001797          	auipc	a5,0x1
    18a6:	d7678793          	addi	a5,a5,-650 # 2618 <threading_system_time>
    18aa:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    18ae:	00001797          	auipc	a5,0x1
    18b2:	d6278793          	addi	a5,a5,-670 # 2610 <current>
    18b6:	00001717          	auipc	a4,0x1
    18ba:	d1270713          	addi	a4,a4,-750 # 25c8 <run_queue>
    18be:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    18c0:	4681                	li	a3,0
    18c2:	00000617          	auipc	a2,0x0
    18c6:	f7c60613          	addi	a2,a2,-132 # 183e <back_to_main_handler>
    18ca:	00001597          	auipc	a1,0x1
    18ce:	d1e58593          	addi	a1,a1,-738 # 25e8 <main_thrd_id>
    18d2:	3e800513          	li	a0,1000
    18d6:	fffff097          	auipc	ra,0xfffff
    18da:	d2c080e7          	jalr	-724(ra) # 602 <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    18de:	00001797          	auipc	a5,0x1
    18e2:	d0a78793          	addi	a5,a5,-758 # 25e8 <main_thrd_id>
    18e6:	439c                	lw	a5,0(a5)
    18e8:	4581                	li	a1,0
    18ea:	853e                	mv	a0,a5
    18ec:	fffff097          	auipc	ra,0xfffff
    18f0:	d26080e7          	jalr	-730(ra) # 612 <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    18f4:	a0c9                	j	19b6 <thread_start_threading+0x11c>
        __release();
    18f6:	00000097          	auipc	ra,0x0
    18fa:	816080e7          	jalr	-2026(ra) # 110c <__release>
        __schedule();
    18fe:	00000097          	auipc	ra,0x0
    1902:	eb2080e7          	jalr	-334(ra) # 17b0 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1906:	00001797          	auipc	a5,0x1
    190a:	ce278793          	addi	a5,a5,-798 # 25e8 <main_thrd_id>
    190e:	439c                	lw	a5,0(a5)
    1910:	4581                	li	a1,0
    1912:	853e                	mv	a0,a5
    1914:	fffff097          	auipc	ra,0xfffff
    1918:	cfe080e7          	jalr	-770(ra) # 612 <cancelthrdstop>
        __dispatch();
    191c:	00000097          	auipc	ra,0x0
    1920:	d04080e7          	jalr	-764(ra) # 1620 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1924:	00001517          	auipc	a0,0x1
    1928:	ca450513          	addi	a0,a0,-860 # 25c8 <run_queue>
    192c:	fffff097          	auipc	ra,0xfffff
    1930:	60a080e7          	jalr	1546(ra) # f36 <list_empty>
    1934:	87aa                	mv	a5,a0
    1936:	cb99                	beqz	a5,194c <thread_start_threading+0xb2>
    1938:	00001517          	auipc	a0,0x1
    193c:	ca050513          	addi	a0,a0,-864 # 25d8 <release_queue>
    1940:	fffff097          	auipc	ra,0xfffff
    1944:	5f6080e7          	jalr	1526(ra) # f36 <list_empty>
    1948:	87aa                	mv	a5,a0
    194a:	ebd9                	bnez	a5,19e0 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    194c:	00001797          	auipc	a5,0x1
    1950:	cd478793          	addi	a5,a5,-812 # 2620 <allocated_time>
    1954:	639c                	ld	a5,0(a5)
    1956:	85be                	mv	a1,a5
    1958:	00001517          	auipc	a0,0x1
    195c:	c3050513          	addi	a0,a0,-976 # 2588 <schedule_dm+0x3bc>
    1960:	fffff097          	auipc	ra,0xfffff
    1964:	148080e7          	jalr	328(ra) # aa8 <printf>
        sleeping = 1;
    1968:	00001797          	auipc	a5,0x1
    196c:	cb478793          	addi	a5,a5,-844 # 261c <sleeping>
    1970:	4705                	li	a4,1
    1972:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1974:	00001797          	auipc	a5,0x1
    1978:	cac78793          	addi	a5,a5,-852 # 2620 <allocated_time>
    197c:	639c                	ld	a5,0(a5)
    197e:	0007871b          	sext.w	a4,a5
    1982:	00001797          	auipc	a5,0x1
    1986:	c9e78793          	addi	a5,a5,-866 # 2620 <allocated_time>
    198a:	639c                	ld	a5,0(a5)
    198c:	86be                	mv	a3,a5
    198e:	00000617          	auipc	a2,0x0
    1992:	eb060613          	addi	a2,a2,-336 # 183e <back_to_main_handler>
    1996:	00001597          	auipc	a1,0x1
    199a:	c5258593          	addi	a1,a1,-942 # 25e8 <main_thrd_id>
    199e:	853a                	mv	a0,a4
    19a0:	fffff097          	auipc	ra,0xfffff
    19a4:	c62080e7          	jalr	-926(ra) # 602 <thrdstop>
        while (sleeping) {
    19a8:	0001                	nop
    19aa:	00001797          	auipc	a5,0x1
    19ae:	c7278793          	addi	a5,a5,-910 # 261c <sleeping>
    19b2:	439c                	lw	a5,0(a5)
    19b4:	fbfd                	bnez	a5,19aa <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    19b6:	00001517          	auipc	a0,0x1
    19ba:	c1250513          	addi	a0,a0,-1006 # 25c8 <run_queue>
    19be:	fffff097          	auipc	ra,0xfffff
    19c2:	578080e7          	jalr	1400(ra) # f36 <list_empty>
    19c6:	87aa                	mv	a5,a0
    19c8:	d79d                	beqz	a5,18f6 <thread_start_threading+0x5c>
    19ca:	00001517          	auipc	a0,0x1
    19ce:	c0e50513          	addi	a0,a0,-1010 # 25d8 <release_queue>
    19d2:	fffff097          	auipc	ra,0xfffff
    19d6:	564080e7          	jalr	1380(ra) # f36 <list_empty>
    19da:	87aa                	mv	a5,a0
    19dc:	df89                	beqz	a5,18f6 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    19de:	a011                	j	19e2 <thread_start_threading+0x148>
            break;
    19e0:	0001                	nop
}
    19e2:	0001                	nop
    19e4:	60a2                	ld	ra,8(sp)
    19e6:	6402                	ld	s0,0(sp)
    19e8:	0141                	addi	sp,sp,16
    19ea:	8082                	ret

00000000000019ec <list_empty>:
{
    19ec:	1101                	addi	sp,sp,-32
    19ee:	ec22                	sd	s0,24(sp)
    19f0:	1000                	addi	s0,sp,32
    19f2:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
    19f6:	fe843783          	ld	a5,-24(s0)
    19fa:	639c                	ld	a5,0(a5)
    19fc:	fe843703          	ld	a4,-24(s0)
    1a00:	40f707b3          	sub	a5,a4,a5
    1a04:	0017b793          	seqz	a5,a5
    1a08:	0ff7f793          	andi	a5,a5,255
    1a0c:	2781                	sext.w	a5,a5
}
    1a0e:	853e                	mv	a0,a5
    1a10:	6462                	ld	s0,24(sp)
    1a12:	6105                	addi	sp,sp,32
    1a14:	8082                	ret

0000000000001a16 <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
    1a16:	715d                	addi	sp,sp,-80
    1a18:	e4a2                	sd	s0,72(sp)
    1a1a:	e0a6                	sd	s1,64(sp)
    1a1c:	0880                	addi	s0,sp,80
    1a1e:	84aa                	mv	s1,a0
    int sleep_time = -1;
    1a20:	57fd                	li	a5,-1
    1a22:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1a26:	689c                	ld	a5,16(s1)
    1a28:	639c                	ld	a5,0(a5)
    1a2a:	fcf43c23          	sd	a5,-40(s0)
    1a2e:	fd843783          	ld	a5,-40(s0)
    1a32:	17e1                	addi	a5,a5,-8
    1a34:	fef43023          	sd	a5,-32(s0)
    1a38:	a0a9                	j	1a82 <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
    1a3a:	fec42783          	lw	a5,-20(s0)
    1a3e:	2781                	sext.w	a5,a5
    1a40:	0007cf63          	bltz	a5,1a5e <fill_sparse+0x48>
    1a44:	fe043783          	ld	a5,-32(s0)
    1a48:	4f98                	lw	a4,24(a5)
    1a4a:	409c                	lw	a5,0(s1)
    1a4c:	40f707bb          	subw	a5,a4,a5
    1a50:	0007871b          	sext.w	a4,a5
    1a54:	fec42783          	lw	a5,-20(s0)
    1a58:	2781                	sext.w	a5,a5
    1a5a:	00f75a63          	bge	a4,a5,1a6e <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
    1a5e:	fe043783          	ld	a5,-32(s0)
    1a62:	4f98                	lw	a4,24(a5)
    1a64:	409c                	lw	a5,0(s1)
    1a66:	40f707bb          	subw	a5,a4,a5
    1a6a:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1a6e:	fe043783          	ld	a5,-32(s0)
    1a72:	679c                	ld	a5,8(a5)
    1a74:	fcf43823          	sd	a5,-48(s0)
    1a78:	fd043783          	ld	a5,-48(s0)
    1a7c:	17e1                	addi	a5,a5,-8
    1a7e:	fef43023          	sd	a5,-32(s0)
    1a82:	fe043783          	ld	a5,-32(s0)
    1a86:	00878713          	addi	a4,a5,8
    1a8a:	689c                	ld	a5,16(s1)
    1a8c:	faf717e3          	bne	a4,a5,1a3a <fill_sparse+0x24>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = args.run_queue;
    1a90:	649c                	ld	a5,8(s1)
    1a92:	faf43823          	sd	a5,-80(s0)
    r.allocated_time = sleep_time;
    1a96:	fec42783          	lw	a5,-20(s0)
    1a9a:	faf42c23          	sw	a5,-72(s0)
    return r;    
    1a9e:	fb043783          	ld	a5,-80(s0)
    1aa2:	fcf43023          	sd	a5,-64(s0)
    1aa6:	fb843783          	ld	a5,-72(s0)
    1aaa:	fcf43423          	sd	a5,-56(s0)
    1aae:	4701                	li	a4,0
    1ab0:	fc043703          	ld	a4,-64(s0)
    1ab4:	4781                	li	a5,0
    1ab6:	fc843783          	ld	a5,-56(s0)
    1aba:	863a                	mv	a2,a4
    1abc:	86be                	mv	a3,a5
    1abe:	8732                	mv	a4,a2
    1ac0:	87b6                	mv	a5,a3
}
    1ac2:	853a                	mv	a0,a4
    1ac4:	85be                	mv	a1,a5
    1ac6:	6426                	ld	s0,72(sp)
    1ac8:	6486                	ld	s1,64(sp)
    1aca:	6161                	addi	sp,sp,80
    1acc:	8082                	ret

0000000000001ace <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    1ace:	715d                	addi	sp,sp,-80
    1ad0:	e4a2                	sd	s0,72(sp)
    1ad2:	e0a6                	sd	s1,64(sp)
    1ad4:	0880                	addi	s0,sp,80
    1ad6:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
    1ad8:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    1adc:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1ae0:	649c                	ld	a5,8(s1)
    1ae2:	639c                	ld	a5,0(a5)
    1ae4:	fcf43c23          	sd	a5,-40(s0)
    1ae8:	fd843783          	ld	a5,-40(s0)
    1aec:	fd878793          	addi	a5,a5,-40
    1af0:	fef43023          	sd	a5,-32(s0)
    1af4:	a81d                	j	1b2a <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
    1af6:	fe843783          	ld	a5,-24(s0)
    1afa:	cb89                	beqz	a5,1b0c <schedule_default+0x3e>
    1afc:	fe043783          	ld	a5,-32(s0)
    1b00:	5fd8                	lw	a4,60(a5)
    1b02:	fe843783          	ld	a5,-24(s0)
    1b06:	5fdc                	lw	a5,60(a5)
    1b08:	00f75663          	bge	a4,a5,1b14 <schedule_default+0x46>
            thread_with_smallest_id = th;
    1b0c:	fe043783          	ld	a5,-32(s0)
    1b10:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1b14:	fe043783          	ld	a5,-32(s0)
    1b18:	779c                	ld	a5,40(a5)
    1b1a:	fcf43823          	sd	a5,-48(s0)
    1b1e:	fd043783          	ld	a5,-48(s0)
    1b22:	fd878793          	addi	a5,a5,-40
    1b26:	fef43023          	sd	a5,-32(s0)
    1b2a:	fe043783          	ld	a5,-32(s0)
    1b2e:	02878713          	addi	a4,a5,40
    1b32:	649c                	ld	a5,8(s1)
    1b34:	fcf711e3          	bne	a4,a5,1af6 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
    1b38:	fe843783          	ld	a5,-24(s0)
    1b3c:	cf89                	beqz	a5,1b56 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
    1b3e:	fe843783          	ld	a5,-24(s0)
    1b42:	02878793          	addi	a5,a5,40
    1b46:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
    1b4a:	fe843783          	ld	a5,-24(s0)
    1b4e:	4fbc                	lw	a5,88(a5)
    1b50:	faf42c23          	sw	a5,-72(s0)
    1b54:	a039                	j	1b62 <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1b56:	649c                	ld	a5,8(s1)
    1b58:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
    1b5c:	4785                	li	a5,1
    1b5e:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
    1b62:	fb043783          	ld	a5,-80(s0)
    1b66:	fcf43023          	sd	a5,-64(s0)
    1b6a:	fb843783          	ld	a5,-72(s0)
    1b6e:	fcf43423          	sd	a5,-56(s0)
    1b72:	4701                	li	a4,0
    1b74:	fc043703          	ld	a4,-64(s0)
    1b78:	4781                	li	a5,0
    1b7a:	fc843783          	ld	a5,-56(s0)
    1b7e:	863a                	mv	a2,a4
    1b80:	86be                	mv	a3,a5
    1b82:	8732                	mv	a4,a2
    1b84:	87b6                	mv	a5,a3
}
    1b86:	853a                	mv	a0,a4
    1b88:	85be                	mv	a1,a5
    1b8a:	6426                	ld	s0,72(sp)
    1b8c:	6486                	ld	s1,64(sp)
    1b8e:	6161                	addi	sp,sp,80
    1b90:	8082                	ret

0000000000001b92 <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
    1b92:	7135                	addi	sp,sp,-160
    1b94:	ed06                	sd	ra,152(sp)
    1b96:	e922                	sd	s0,144(sp)
    1b98:	e526                	sd	s1,136(sp)
    1b9a:	e14a                	sd	s2,128(sp)
    1b9c:	fcce                	sd	s3,120(sp)
    1b9e:	1100                	addi	s0,sp,160
    1ba0:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
    1ba2:	649c                	ld	a5,8(s1)
    1ba4:	853e                	mv	a0,a5
    1ba6:	00000097          	auipc	ra,0x0
    1baa:	e46080e7          	jalr	-442(ra) # 19ec <list_empty>
    1bae:	87aa                	mv	a5,a0
    1bb0:	cb85                	beqz	a5,1be0 <schedule_wrr+0x4e>
        return fill_sparse(args);
    1bb2:	609c                	ld	a5,0(s1)
    1bb4:	f6f43023          	sd	a5,-160(s0)
    1bb8:	649c                	ld	a5,8(s1)
    1bba:	f6f43423          	sd	a5,-152(s0)
    1bbe:	689c                	ld	a5,16(s1)
    1bc0:	f6f43823          	sd	a5,-144(s0)
    1bc4:	f6040793          	addi	a5,s0,-160
    1bc8:	853e                	mv	a0,a5
    1bca:	00000097          	auipc	ra,0x0
    1bce:	e4c080e7          	jalr	-436(ra) # 1a16 <fill_sparse>
    1bd2:	872a                	mv	a4,a0
    1bd4:	87ae                	mv	a5,a1
    1bd6:	f8e43823          	sd	a4,-112(s0)
    1bda:	f8f43c23          	sd	a5,-104(s0)
    1bde:	a0c9                	j	1ca0 <schedule_wrr+0x10e>

    struct thread *process_thread = NULL;
    1be0:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1be4:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1be8:	649c                	ld	a5,8(s1)
    1bea:	639c                	ld	a5,0(a5)
    1bec:	faf43823          	sd	a5,-80(s0)
    1bf0:	fb043783          	ld	a5,-80(s0)
    1bf4:	fd878793          	addi	a5,a5,-40
    1bf8:	fcf43023          	sd	a5,-64(s0)
    1bfc:	a025                	j	1c24 <schedule_wrr+0x92>
        if (process_thread == NULL) {
    1bfe:	fc843783          	ld	a5,-56(s0)
    1c02:	e791                	bnez	a5,1c0e <schedule_wrr+0x7c>
            process_thread = th;
    1c04:	fc043783          	ld	a5,-64(s0)
    1c08:	fcf43423          	sd	a5,-56(s0)
            break;
    1c0c:	a01d                	j	1c32 <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
    1c0e:	fc043783          	ld	a5,-64(s0)
    1c12:	779c                	ld	a5,40(a5)
    1c14:	faf43423          	sd	a5,-88(s0)
    1c18:	fa843783          	ld	a5,-88(s0)
    1c1c:	fd878793          	addi	a5,a5,-40
    1c20:	fcf43023          	sd	a5,-64(s0)
    1c24:	fc043783          	ld	a5,-64(s0)
    1c28:	02878713          	addi	a4,a5,40
    1c2c:	649c                	ld	a5,8(s1)
    1c2e:	fcf718e3          	bne	a4,a5,1bfe <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
    1c32:	40dc                	lw	a5,4(s1)
    1c34:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
    1c38:	fc843783          	ld	a5,-56(s0)
    1c3c:	4fbc                	lw	a5,88(a5)
    1c3e:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    1c42:	fc843783          	ld	a5,-56(s0)
    1c46:	4fb4                	lw	a3,88(a5)
    1c48:	fc843783          	ld	a5,-56(s0)
    1c4c:	47bc                	lw	a5,72(a5)
    1c4e:	fa442703          	lw	a4,-92(s0)
    1c52:	02f707bb          	mulw	a5,a4,a5
    1c56:	2781                	sext.w	a5,a5
    1c58:	8736                	mv	a4,a3
    1c5a:	00e7dc63          	bge	a5,a4,1c72 <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
    1c5e:	fc843783          	ld	a5,-56(s0)
    1c62:	47bc                	lw	a5,72(a5)
    1c64:	fa442703          	lw	a4,-92(s0)
    1c68:	02f707bb          	mulw	a5,a4,a5
    1c6c:	faf42e23          	sw	a5,-68(s0)
    1c70:	a031                	j	1c7c <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    1c72:	fc843783          	ld	a5,-56(s0)
    1c76:	4fbc                	lw	a5,88(a5)
    1c78:	faf42e23          	sw	a5,-68(s0)
    }
    
    struct threads_sched_result r;
    r.scheduled_thread_list_member = &process_thread->thread_list;
    1c7c:	fc843783          	ld	a5,-56(s0)
    1c80:	02878793          	addi	a5,a5,40
    1c84:	f8f43023          	sd	a5,-128(s0)
    r.allocated_time = executing_time;
    1c88:	fbc42783          	lw	a5,-68(s0)
    1c8c:	f8f42423          	sw	a5,-120(s0)
    return r;
    1c90:	f8043783          	ld	a5,-128(s0)
    1c94:	f8f43823          	sd	a5,-112(s0)
    1c98:	f8843783          	ld	a5,-120(s0)
    1c9c:	f8f43c23          	sd	a5,-104(s0)
    1ca0:	4701                	li	a4,0
    1ca2:	f9043703          	ld	a4,-112(s0)
    1ca6:	4781                	li	a5,0
    1ca8:	f9843783          	ld	a5,-104(s0)
    1cac:	893a                	mv	s2,a4
    1cae:	89be                	mv	s3,a5
    1cb0:	874a                	mv	a4,s2
    1cb2:	87ce                	mv	a5,s3
}
    1cb4:	853a                	mv	a0,a4
    1cb6:	85be                	mv	a1,a5
    1cb8:	60ea                	ld	ra,152(sp)
    1cba:	644a                	ld	s0,144(sp)
    1cbc:	64aa                	ld	s1,136(sp)
    1cbe:	690a                	ld	s2,128(sp)
    1cc0:	79e6                	ld	s3,120(sp)
    1cc2:	610d                	addi	sp,sp,160
    1cc4:	8082                	ret

0000000000001cc6 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    1cc6:	7131                	addi	sp,sp,-192
    1cc8:	fd06                	sd	ra,184(sp)
    1cca:	f922                	sd	s0,176(sp)
    1ccc:	f526                	sd	s1,168(sp)
    1cce:	f14a                	sd	s2,160(sp)
    1cd0:	ed4e                	sd	s3,152(sp)
    1cd2:	0180                	addi	s0,sp,192
    1cd4:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    1cd6:	649c                	ld	a5,8(s1)
    1cd8:	853e                	mv	a0,a5
    1cda:	00000097          	auipc	ra,0x0
    1cde:	d12080e7          	jalr	-750(ra) # 19ec <list_empty>
    1ce2:	87aa                	mv	a5,a0
    1ce4:	cb85                	beqz	a5,1d14 <schedule_sjf+0x4e>
        return fill_sparse(args);
    1ce6:	609c                	ld	a5,0(s1)
    1ce8:	f4f43023          	sd	a5,-192(s0)
    1cec:	649c                	ld	a5,8(s1)
    1cee:	f4f43423          	sd	a5,-184(s0)
    1cf2:	689c                	ld	a5,16(s1)
    1cf4:	f4f43823          	sd	a5,-176(s0)
    1cf8:	f4040793          	addi	a5,s0,-192
    1cfc:	853e                	mv	a0,a5
    1cfe:	00000097          	auipc	ra,0x0
    1d02:	d18080e7          	jalr	-744(ra) # 1a16 <fill_sparse>
    1d06:	872a                	mv	a4,a0
    1d08:	87ae                	mv	a5,a1
    1d0a:	f6e43c23          	sd	a4,-136(s0)
    1d0e:	f8f43023          	sd	a5,-128(s0)
    1d12:	aa49                	j	1ea4 <schedule_sjf+0x1de>

    int current_time = args.current_time;
    1d14:	409c                	lw	a5,0(s1)
    1d16:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    1d1a:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1d1e:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1d22:	649c                	ld	a5,8(s1)
    1d24:	639c                	ld	a5,0(a5)
    1d26:	faf43423          	sd	a5,-88(s0)
    1d2a:	fa843783          	ld	a5,-88(s0)
    1d2e:	fd878793          	addi	a5,a5,-40
    1d32:	fcf43023          	sd	a5,-64(s0)
    1d36:	a085                	j	1d96 <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    1d38:	fc843783          	ld	a5,-56(s0)
    1d3c:	cb89                	beqz	a5,1d4e <schedule_sjf+0x88>
    1d3e:	fc043783          	ld	a5,-64(s0)
    1d42:	4fb8                	lw	a4,88(a5)
    1d44:	fc843783          	ld	a5,-56(s0)
    1d48:	4fbc                	lw	a5,88(a5)
    1d4a:	00f75763          	bge	a4,a5,1d58 <schedule_sjf+0x92>
            shortest_thread = th;
    1d4e:	fc043783          	ld	a5,-64(s0)
    1d52:	fcf43423          	sd	a5,-56(s0)
    1d56:	a02d                	j	1d80 <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    1d58:	fc043783          	ld	a5,-64(s0)
    1d5c:	4fb8                	lw	a4,88(a5)
    1d5e:	fc843783          	ld	a5,-56(s0)
    1d62:	4fbc                	lw	a5,88(a5)
    1d64:	00f71e63          	bne	a4,a5,1d80 <schedule_sjf+0xba>
    1d68:	fc043783          	ld	a5,-64(s0)
    1d6c:	5fd8                	lw	a4,60(a5)
    1d6e:	fc843783          	ld	a5,-56(s0)
    1d72:	5fdc                	lw	a5,60(a5)
    1d74:	00f75663          	bge	a4,a5,1d80 <schedule_sjf+0xba>
            shortest_thread = th;
    1d78:	fc043783          	ld	a5,-64(s0)
    1d7c:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1d80:	fc043783          	ld	a5,-64(s0)
    1d84:	779c                	ld	a5,40(a5)
    1d86:	f8f43423          	sd	a5,-120(s0)
    1d8a:	f8843783          	ld	a5,-120(s0)
    1d8e:	fd878793          	addi	a5,a5,-40
    1d92:	fcf43023          	sd	a5,-64(s0)
    1d96:	fc043783          	ld	a5,-64(s0)
    1d9a:	02878713          	addi	a4,a5,40
    1d9e:	649c                	ld	a5,8(s1)
    1da0:	f8f71ce3          	bne	a4,a5,1d38 <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    1da4:	fc843783          	ld	a5,-56(s0)
    1da8:	4fbc                	lw	a5,88(a5)
    1daa:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1dae:	689c                	ld	a5,16(s1)
    1db0:	639c                	ld	a5,0(a5)
    1db2:	faf43023          	sd	a5,-96(s0)
    1db6:	fa043783          	ld	a5,-96(s0)
    1dba:	17e1                	addi	a5,a5,-8
    1dbc:	faf43c23          	sd	a5,-72(s0)
    1dc0:	a84d                	j	1e72 <schedule_sjf+0x1ac>
        int interval = cur->release_time - current_time;
    1dc2:	fb843783          	ld	a5,-72(s0)
    1dc6:	4f98                	lw	a4,24(a5)
    1dc8:	fb042783          	lw	a5,-80(s0)
    1dcc:	40f707bb          	subw	a5,a4,a5
    1dd0:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    1dd4:	f9c42703          	lw	a4,-100(s0)
    1dd8:	fb442783          	lw	a5,-76(s0)
    1ddc:	2701                	sext.w	a4,a4
    1dde:	2781                	sext.w	a5,a5
    1de0:	06e7c863          	blt	a5,a4,1e50 <schedule_sjf+0x18a>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1de4:	fc843783          	ld	a5,-56(s0)
    1de8:	4fbc                	lw	a5,88(a5)
    1dea:	fb042703          	lw	a4,-80(s0)
    1dee:	9fb9                	addw	a5,a5,a4
    1df0:	0007871b          	sext.w	a4,a5
    1df4:	fb843783          	ld	a5,-72(s0)
    1df8:	4f9c                	lw	a5,24(a5)
    1dfa:	04f74d63          	blt	a4,a5,1e54 <schedule_sjf+0x18e>
        int remaining_time = shortest_thread->remaining_time - interval;
    1dfe:	fc843783          	ld	a5,-56(s0)
    1e02:	4fb8                	lw	a4,88(a5)
    1e04:	f9c42783          	lw	a5,-100(s0)
    1e08:	40f707bb          	subw	a5,a4,a5
    1e0c:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    1e10:	fb843783          	ld	a5,-72(s0)
    1e14:	639c                	ld	a5,0(a5)
    1e16:	43f8                	lw	a4,68(a5)
    1e18:	f9842783          	lw	a5,-104(s0)
    1e1c:	2781                	sext.w	a5,a5
    1e1e:	02e7cd63          	blt	a5,a4,1e58 <schedule_sjf+0x192>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    1e22:	fb843783          	ld	a5,-72(s0)
    1e26:	639c                	ld	a5,0(a5)
    1e28:	43f8                	lw	a4,68(a5)
    1e2a:	f9842783          	lw	a5,-104(s0)
    1e2e:	2781                	sext.w	a5,a5
    1e30:	00e79b63          	bne	a5,a4,1e46 <schedule_sjf+0x180>
    1e34:	fc843783          	ld	a5,-56(s0)
    1e38:	5fd8                	lw	a4,60(a5)
    1e3a:	fb843783          	ld	a5,-72(s0)
    1e3e:	639c                	ld	a5,0(a5)
    1e40:	5fdc                	lw	a5,60(a5)
    1e42:	00f74d63          	blt	a4,a5,1e5c <schedule_sjf+0x196>
        executing_time = interval;
    1e46:	f9c42783          	lw	a5,-100(s0)
    1e4a:	faf42a23          	sw	a5,-76(s0)
    1e4e:	a801                	j	1e5e <schedule_sjf+0x198>
        if (interval > executing_time) continue;
    1e50:	0001                	nop
    1e52:	a031                	j	1e5e <schedule_sjf+0x198>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1e54:	0001                	nop
    1e56:	a021                	j	1e5e <schedule_sjf+0x198>
        if (remaining_time < cur->thrd->processing_time) continue;
    1e58:	0001                	nop
    1e5a:	a011                	j	1e5e <schedule_sjf+0x198>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    1e5c:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1e5e:	fb843783          	ld	a5,-72(s0)
    1e62:	679c                	ld	a5,8(a5)
    1e64:	f8f43823          	sd	a5,-112(s0)
    1e68:	f9043783          	ld	a5,-112(s0)
    1e6c:	17e1                	addi	a5,a5,-8
    1e6e:	faf43c23          	sd	a5,-72(s0)
    1e72:	fb843783          	ld	a5,-72(s0)
    1e76:	00878713          	addi	a4,a5,8
    1e7a:	689c                	ld	a5,16(s1)
    1e7c:	f4f713e3          	bne	a4,a5,1dc2 <schedule_sjf+0xfc>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &shortest_thread->thread_list;
    1e80:	fc843783          	ld	a5,-56(s0)
    1e84:	02878793          	addi	a5,a5,40
    1e88:	f6f43423          	sd	a5,-152(s0)
    r.allocated_time = executing_time;
    1e8c:	fb442783          	lw	a5,-76(s0)
    1e90:	f6f42823          	sw	a5,-144(s0)
    return r;
    1e94:	f6843783          	ld	a5,-152(s0)
    1e98:	f6f43c23          	sd	a5,-136(s0)
    1e9c:	f7043783          	ld	a5,-144(s0)
    1ea0:	f8f43023          	sd	a5,-128(s0)
    1ea4:	4701                	li	a4,0
    1ea6:	f7843703          	ld	a4,-136(s0)
    1eaa:	4781                	li	a5,0
    1eac:	f8043783          	ld	a5,-128(s0)
    1eb0:	893a                	mv	s2,a4
    1eb2:	89be                	mv	s3,a5
    1eb4:	874a                	mv	a4,s2
    1eb6:	87ce                	mv	a5,s3
}
    1eb8:	853a                	mv	a0,a4
    1eba:	85be                	mv	a1,a5
    1ebc:	70ea                	ld	ra,184(sp)
    1ebe:	744a                	ld	s0,176(sp)
    1ec0:	74aa                	ld	s1,168(sp)
    1ec2:	790a                	ld	s2,160(sp)
    1ec4:	69ea                	ld	s3,152(sp)
    1ec6:	6129                	addi	sp,sp,192
    1ec8:	8082                	ret

0000000000001eca <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    1eca:	7115                	addi	sp,sp,-224
    1ecc:	ed86                	sd	ra,216(sp)
    1ece:	e9a2                	sd	s0,208(sp)
    1ed0:	e5a6                	sd	s1,200(sp)
    1ed2:	e1ca                	sd	s2,192(sp)
    1ed4:	fd4e                	sd	s3,184(sp)
    1ed6:	1180                	addi	s0,sp,224
    1ed8:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    1eda:	649c                	ld	a5,8(s1)
    1edc:	853e                	mv	a0,a5
    1ede:	00000097          	auipc	ra,0x0
    1ee2:	b0e080e7          	jalr	-1266(ra) # 19ec <list_empty>
    1ee6:	87aa                	mv	a5,a0
    1ee8:	cb85                	beqz	a5,1f18 <schedule_lst+0x4e>
        return fill_sparse(args);
    1eea:	609c                	ld	a5,0(s1)
    1eec:	f2f43023          	sd	a5,-224(s0)
    1ef0:	649c                	ld	a5,8(s1)
    1ef2:	f2f43423          	sd	a5,-216(s0)
    1ef6:	689c                	ld	a5,16(s1)
    1ef8:	f2f43823          	sd	a5,-208(s0)
    1efc:	f2040793          	addi	a5,s0,-224
    1f00:	853e                	mv	a0,a5
    1f02:	00000097          	auipc	ra,0x0
    1f06:	b14080e7          	jalr	-1260(ra) # 1a16 <fill_sparse>
    1f0a:	872a                	mv	a4,a0
    1f0c:	87ae                	mv	a5,a1
    1f0e:	f6e43023          	sd	a4,-160(s0)
    1f12:	f6f43423          	sd	a5,-152(s0)
    1f16:	ac41                	j	21a6 <schedule_lst+0x2dc>

    int current_time = args.current_time;
    1f18:	409c                	lw	a5,0(s1)
    1f1a:	faf42623          	sw	a5,-84(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    1f1e:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1f22:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1f26:	649c                	ld	a5,8(s1)
    1f28:	639c                	ld	a5,0(a5)
    1f2a:	faf43023          	sd	a5,-96(s0)
    1f2e:	fa043783          	ld	a5,-96(s0)
    1f32:	fd878793          	addi	a5,a5,-40
    1f36:	fcf43023          	sd	a5,-64(s0)
    1f3a:	a239                	j	2048 <schedule_lst+0x17e>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    1f3c:	fc043783          	ld	a5,-64(s0)
    1f40:	4ff8                	lw	a4,92(a5)
    1f42:	fac42783          	lw	a5,-84(s0)
    1f46:	40f707bb          	subw	a5,a4,a5
    1f4a:	0007871b          	sext.w	a4,a5
    1f4e:	fc043783          	ld	a5,-64(s0)
    1f52:	4fbc                	lw	a5,88(a5)
    1f54:	40f707bb          	subw	a5,a4,a5
    1f58:	f6f42e23          	sw	a5,-132(s0)
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    1f5c:	fc843783          	ld	a5,-56(s0)
    1f60:	c38d                	beqz	a5,1f82 <schedule_lst+0xb8>
    1f62:	fc843783          	ld	a5,-56(s0)
    1f66:	4ff8                	lw	a4,92(a5)
    1f68:	fac42783          	lw	a5,-84(s0)
    1f6c:	40f707bb          	subw	a5,a4,a5
    1f70:	0007871b          	sext.w	a4,a5
    1f74:	fc843783          	ld	a5,-56(s0)
    1f78:	4fbc                	lw	a5,88(a5)
    1f7a:	40f707bb          	subw	a5,a4,a5
    1f7e:	2781                	sext.w	a5,a5
    1f80:	a011                	j	1f84 <schedule_lst+0xba>
    1f82:	4781                	li	a5,0
    1f84:	f6f42c23          	sw	a5,-136(s0)
        if (least_slack_thread == NULL) {
    1f88:	fc843783          	ld	a5,-56(s0)
    1f8c:	e791                	bnez	a5,1f98 <schedule_lst+0xce>
            least_slack_thread = th;
    1f8e:	fc043783          	ld	a5,-64(s0)
    1f92:	fcf43423          	sd	a5,-56(s0)
    1f96:	a871                	j	2032 <schedule_lst+0x168>
        }
        else if (least_slack_thread->current_deadline <= current_time) { // missing the deadline
    1f98:	fc843783          	ld	a5,-56(s0)
    1f9c:	4ff8                	lw	a4,92(a5)
    1f9e:	fac42783          	lw	a5,-84(s0)
    1fa2:	2781                	sext.w	a5,a5
    1fa4:	02e7c763          	blt	a5,a4,1fd2 <schedule_lst+0x108>
            if (th->current_deadline > current_time) continue;
    1fa8:	fc043783          	ld	a5,-64(s0)
    1fac:	4ff8                	lw	a4,92(a5)
    1fae:	fac42783          	lw	a5,-84(s0)
    1fb2:	2781                	sext.w	a5,a5
    1fb4:	06e7ce63          	blt	a5,a4,2030 <schedule_lst+0x166>
            if (th->ID < least_slack_thread->ID) {
    1fb8:	fc043783          	ld	a5,-64(s0)
    1fbc:	5fd8                	lw	a4,60(a5)
    1fbe:	fc843783          	ld	a5,-56(s0)
    1fc2:	5fdc                	lw	a5,60(a5)
    1fc4:	06f75763          	bge	a4,a5,2032 <schedule_lst+0x168>
                least_slack_thread = th;
    1fc8:	fc043783          	ld	a5,-64(s0)
    1fcc:	fcf43423          	sd	a5,-56(s0)
    1fd0:	a08d                	j	2032 <schedule_lst+0x168>
            }
        }
        else if (th->current_deadline <= current_time) {
    1fd2:	fc043783          	ld	a5,-64(s0)
    1fd6:	4ff8                	lw	a4,92(a5)
    1fd8:	fac42783          	lw	a5,-84(s0)
    1fdc:	2781                	sext.w	a5,a5
    1fde:	00e7c763          	blt	a5,a4,1fec <schedule_lst+0x122>
            least_slack_thread = th;
    1fe2:	fc043783          	ld	a5,-64(s0)
    1fe6:	fcf43423          	sd	a5,-56(s0)
    1fea:	a0a1                	j	2032 <schedule_lst+0x168>
        }
        else if (slack_time < least_slack_time) {
    1fec:	f7c42703          	lw	a4,-132(s0)
    1ff0:	f7842783          	lw	a5,-136(s0)
    1ff4:	2701                	sext.w	a4,a4
    1ff6:	2781                	sext.w	a5,a5
    1ff8:	00f75763          	bge	a4,a5,2006 <schedule_lst+0x13c>
            least_slack_thread = th;
    1ffc:	fc043783          	ld	a5,-64(s0)
    2000:	fcf43423          	sd	a5,-56(s0)
    2004:	a03d                	j	2032 <schedule_lst+0x168>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    2006:	f7c42703          	lw	a4,-132(s0)
    200a:	f7842783          	lw	a5,-136(s0)
    200e:	2701                	sext.w	a4,a4
    2010:	2781                	sext.w	a5,a5
    2012:	02f71063          	bne	a4,a5,2032 <schedule_lst+0x168>
    2016:	fc043783          	ld	a5,-64(s0)
    201a:	5fd8                	lw	a4,60(a5)
    201c:	fc843783          	ld	a5,-56(s0)
    2020:	5fdc                	lw	a5,60(a5)
    2022:	00f75863          	bge	a4,a5,2032 <schedule_lst+0x168>
            least_slack_thread = th;
    2026:	fc043783          	ld	a5,-64(s0)
    202a:	fcf43423          	sd	a5,-56(s0)
    202e:	a011                	j	2032 <schedule_lst+0x168>
            if (th->current_deadline > current_time) continue;
    2030:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    2032:	fc043783          	ld	a5,-64(s0)
    2036:	779c                	ld	a5,40(a5)
    2038:	f6f43823          	sd	a5,-144(s0)
    203c:	f7043783          	ld	a5,-144(s0)
    2040:	fd878793          	addi	a5,a5,-40
    2044:	fcf43023          	sd	a5,-64(s0)
    2048:	fc043783          	ld	a5,-64(s0)
    204c:	02878713          	addi	a4,a5,40
    2050:	649c                	ld	a5,8(s1)
    2052:	eef715e3          	bne	a4,a5,1f3c <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread->current_deadline <= current_time)
    2056:	fc843783          	ld	a5,-56(s0)
    205a:	4ff8                	lw	a4,92(a5)
    205c:	fac42783          	lw	a5,-84(s0)
    2060:	2781                	sext.w	a5,a5
    2062:	00e7cb63          	blt	a5,a4,2078 <schedule_lst+0x1ae>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    2066:	fc843783          	ld	a5,-56(s0)
    206a:	02878793          	addi	a5,a5,40
    206e:	f6f43023          	sd	a5,-160(s0)
    2072:	f6042423          	sw	zero,-152(s0)
    2076:	aa05                	j	21a6 <schedule_lst+0x2dc>
    
    int executing_time = least_slack_thread->remaining_time;
    2078:	fc843783          	ld	a5,-56(s0)
    207c:	4fbc                	lw	a5,88(a5)
    207e:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    2082:	fc843783          	ld	a5,-56(s0)
    2086:	4fb4                	lw	a3,88(a5)
    2088:	fc843783          	ld	a5,-56(s0)
    208c:	4ff8                	lw	a4,92(a5)
    208e:	fac42783          	lw	a5,-84(s0)
    2092:	40f707bb          	subw	a5,a4,a5
    2096:	2781                	sext.w	a5,a5
    2098:	8736                	mv	a4,a3
    209a:	00e7db63          	bge	a5,a4,20b0 <schedule_lst+0x1e6>
        executing_time = least_slack_thread->current_deadline - current_time;
    209e:	fc843783          	ld	a5,-56(s0)
    20a2:	4ff8                	lw	a4,92(a5)
    20a4:	fac42783          	lw	a5,-84(s0)
    20a8:	40f707bb          	subw	a5,a4,a5
    20ac:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    20b0:	fc843783          	ld	a5,-56(s0)
    20b4:	4ff8                	lw	a4,92(a5)
    20b6:	fac42783          	lw	a5,-84(s0)
    20ba:	40f707bb          	subw	a5,a4,a5
    20be:	0007871b          	sext.w	a4,a5
    20c2:	fc843783          	ld	a5,-56(s0)
    20c6:	4fbc                	lw	a5,88(a5)
    20c8:	40f707bb          	subw	a5,a4,a5
    20cc:	f8f42e23          	sw	a5,-100(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    20d0:	689c                	ld	a5,16(s1)
    20d2:	639c                	ld	a5,0(a5)
    20d4:	f8f43823          	sd	a5,-112(s0)
    20d8:	f9043783          	ld	a5,-112(s0)
    20dc:	17e1                	addi	a5,a5,-8
    20de:	faf43823          	sd	a5,-80(s0)
    20e2:	a849                	j	2174 <schedule_lst+0x2aa>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    20e4:	fb043783          	ld	a5,-80(s0)
    20e8:	639c                	ld	a5,0(a5)
    20ea:	47f8                	lw	a4,76(a5)
    20ec:	fb043783          	ld	a5,-80(s0)
    20f0:	639c                	ld	a5,0(a5)
    20f2:	43fc                	lw	a5,68(a5)
    20f4:	40f707bb          	subw	a5,a4,a5
    20f8:	f8f42623          	sw	a5,-116(s0)
        int interval = cur->release_time - current_time;
    20fc:	fb043783          	ld	a5,-80(s0)
    2100:	4f98                	lw	a4,24(a5)
    2102:	fac42783          	lw	a5,-84(s0)
    2106:	40f707bb          	subw	a5,a4,a5
    210a:	f8f42423          	sw	a5,-120(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    210e:	f8842703          	lw	a4,-120(s0)
    2112:	fbc42783          	lw	a5,-68(s0)
    2116:	2701                	sext.w	a4,a4
    2118:	2781                	sext.w	a5,a5
    211a:	04e7c063          	blt	a5,a4,215a <schedule_lst+0x290>
    211e:	f9c42703          	lw	a4,-100(s0)
    2122:	f8c42783          	lw	a5,-116(s0)
    2126:	2701                	sext.w	a4,a4
    2128:	2781                	sext.w	a5,a5
    212a:	02f74863          	blt	a4,a5,215a <schedule_lst+0x290>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    212e:	f9c42703          	lw	a4,-100(s0)
    2132:	f8c42783          	lw	a5,-116(s0)
    2136:	2701                	sext.w	a4,a4
    2138:	2781                	sext.w	a5,a5
    213a:	00f71b63          	bne	a4,a5,2150 <schedule_lst+0x286>
    213e:	fc843783          	ld	a5,-56(s0)
    2142:	5fd8                	lw	a4,60(a5)
    2144:	fb043783          	ld	a5,-80(s0)
    2148:	639c                	ld	a5,0(a5)
    214a:	5fdc                	lw	a5,60(a5)
    214c:	00f74963          	blt	a4,a5,215e <schedule_lst+0x294>
        executing_time = interval;
    2150:	f8842783          	lw	a5,-120(s0)
    2154:	faf42e23          	sw	a5,-68(s0)
    2158:	a021                	j	2160 <schedule_lst+0x296>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    215a:	0001                	nop
    215c:	a011                	j	2160 <schedule_lst+0x296>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    215e:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    2160:	fb043783          	ld	a5,-80(s0)
    2164:	679c                	ld	a5,8(a5)
    2166:	f8f43023          	sd	a5,-128(s0)
    216a:	f8043783          	ld	a5,-128(s0)
    216e:	17e1                	addi	a5,a5,-8
    2170:	faf43823          	sd	a5,-80(s0)
    2174:	fb043783          	ld	a5,-80(s0)
    2178:	00878713          	addi	a4,a5,8
    217c:	689c                	ld	a5,16(s1)
    217e:	f6f713e3          	bne	a4,a5,20e4 <schedule_lst+0x21a>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &least_slack_thread->thread_list;
    2182:	fc843783          	ld	a5,-56(s0)
    2186:	02878793          	addi	a5,a5,40
    218a:	f4f43823          	sd	a5,-176(s0)
    r.allocated_time = executing_time;
    218e:	fbc42783          	lw	a5,-68(s0)
    2192:	f4f42c23          	sw	a5,-168(s0)
    return r;
    2196:	f5043783          	ld	a5,-176(s0)
    219a:	f6f43023          	sd	a5,-160(s0)
    219e:	f5843783          	ld	a5,-168(s0)
    21a2:	f6f43423          	sd	a5,-152(s0)
    21a6:	4701                	li	a4,0
    21a8:	f6043703          	ld	a4,-160(s0)
    21ac:	4781                	li	a5,0
    21ae:	f6843783          	ld	a5,-152(s0)
    21b2:	893a                	mv	s2,a4
    21b4:	89be                	mv	s3,a5
    21b6:	874a                	mv	a4,s2
    21b8:	87ce                	mv	a5,s3
}
    21ba:	853a                	mv	a0,a4
    21bc:	85be                	mv	a1,a5
    21be:	60ee                	ld	ra,216(sp)
    21c0:	644e                	ld	s0,208(sp)
    21c2:	64ae                	ld	s1,200(sp)
    21c4:	690e                	ld	s2,192(sp)
    21c6:	79ea                	ld	s3,184(sp)
    21c8:	612d                	addi	sp,sp,224
    21ca:	8082                	ret

00000000000021cc <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    21cc:	7155                	addi	sp,sp,-208
    21ce:	e586                	sd	ra,200(sp)
    21d0:	e1a2                	sd	s0,192(sp)
    21d2:	fd26                	sd	s1,184(sp)
    21d4:	f94a                	sd	s2,176(sp)
    21d6:	f54e                	sd	s3,168(sp)
    21d8:	0980                	addi	s0,sp,208
    21da:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.

    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    21dc:	649c                	ld	a5,8(s1)
    21de:	853e                	mv	a0,a5
    21e0:	00000097          	auipc	ra,0x0
    21e4:	80c080e7          	jalr	-2036(ra) # 19ec <list_empty>
    21e8:	87aa                	mv	a5,a0
    21ea:	cb85                	beqz	a5,221a <schedule_dm+0x4e>
        return fill_sparse(args);
    21ec:	609c                	ld	a5,0(s1)
    21ee:	f2f43823          	sd	a5,-208(s0)
    21f2:	649c                	ld	a5,8(s1)
    21f4:	f2f43c23          	sd	a5,-200(s0)
    21f8:	689c                	ld	a5,16(s1)
    21fa:	f4f43023          	sd	a5,-192(s0)
    21fe:	f3040793          	addi	a5,s0,-208
    2202:	853e                	mv	a0,a5
    2204:	00000097          	auipc	ra,0x0
    2208:	812080e7          	jalr	-2030(ra) # 1a16 <fill_sparse>
    220c:	872a                	mv	a4,a0
    220e:	87ae                	mv	a5,a1
    2210:	f6e43823          	sd	a4,-144(s0)
    2214:	f6f43c23          	sd	a5,-136(s0)
    2218:	ac11                	j	242c <schedule_dm+0x260>
    
    int current_time = args.current_time;
    221a:	409c                	lw	a5,0(s1)
    221c:	faf42623          	sw	a5,-84(s0)

    // find the thread with the earliest deadline
    struct thread *highest_priority_thread = NULL;
    2220:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    2224:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    2228:	649c                	ld	a5,8(s1)
    222a:	639c                	ld	a5,0(a5)
    222c:	faf43023          	sd	a5,-96(s0)
    2230:	fa043783          	ld	a5,-96(s0)
    2234:	fd878793          	addi	a5,a5,-40
    2238:	fcf43023          	sd	a5,-64(s0)
    223c:	a0c9                	j	22fe <schedule_dm+0x132>
        if (highest_priority_thread == NULL) {
    223e:	fc843783          	ld	a5,-56(s0)
    2242:	e791                	bnez	a5,224e <schedule_dm+0x82>
            highest_priority_thread = th;
    2244:	fc043783          	ld	a5,-64(s0)
    2248:	fcf43423          	sd	a5,-56(s0)
    224c:	a871                	j	22e8 <schedule_dm+0x11c>
        }
        else if (highest_priority_thread->current_deadline <= current_time) { // missing the deadline
    224e:	fc843783          	ld	a5,-56(s0)
    2252:	4ff8                	lw	a4,92(a5)
    2254:	fac42783          	lw	a5,-84(s0)
    2258:	2781                	sext.w	a5,a5
    225a:	02e7c763          	blt	a5,a4,2288 <schedule_dm+0xbc>
            if (th->current_deadline > current_time) continue;
    225e:	fc043783          	ld	a5,-64(s0)
    2262:	4ff8                	lw	a4,92(a5)
    2264:	fac42783          	lw	a5,-84(s0)
    2268:	2781                	sext.w	a5,a5
    226a:	06e7ce63          	blt	a5,a4,22e6 <schedule_dm+0x11a>
            if (th->ID < highest_priority_thread->ID) {
    226e:	fc043783          	ld	a5,-64(s0)
    2272:	5fd8                	lw	a4,60(a5)
    2274:	fc843783          	ld	a5,-56(s0)
    2278:	5fdc                	lw	a5,60(a5)
    227a:	06f75763          	bge	a4,a5,22e8 <schedule_dm+0x11c>
                highest_priority_thread = th;
    227e:	fc043783          	ld	a5,-64(s0)
    2282:	fcf43423          	sd	a5,-56(s0)
    2286:	a08d                	j	22e8 <schedule_dm+0x11c>
            }
        }
        else if (th->current_deadline <= current_time) {
    2288:	fc043783          	ld	a5,-64(s0)
    228c:	4ff8                	lw	a4,92(a5)
    228e:	fac42783          	lw	a5,-84(s0)
    2292:	2781                	sext.w	a5,a5
    2294:	00e7c763          	blt	a5,a4,22a2 <schedule_dm+0xd6>
            highest_priority_thread = th;
    2298:	fc043783          	ld	a5,-64(s0)
    229c:	fcf43423          	sd	a5,-56(s0)
    22a0:	a0a1                	j	22e8 <schedule_dm+0x11c>
        }
        else if (th->deadline < highest_priority_thread->deadline ) {
    22a2:	fc043783          	ld	a5,-64(s0)
    22a6:	47f8                	lw	a4,76(a5)
    22a8:	fc843783          	ld	a5,-56(s0)
    22ac:	47fc                	lw	a5,76(a5)
    22ae:	00f75763          	bge	a4,a5,22bc <schedule_dm+0xf0>
            highest_priority_thread = th;
    22b2:	fc043783          	ld	a5,-64(s0)
    22b6:	fcf43423          	sd	a5,-56(s0)
    22ba:	a03d                	j	22e8 <schedule_dm+0x11c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    22bc:	fc043783          	ld	a5,-64(s0)
    22c0:	47f8                	lw	a4,76(a5)
    22c2:	fc843783          	ld	a5,-56(s0)
    22c6:	47fc                	lw	a5,76(a5)
    22c8:	02f71063          	bne	a4,a5,22e8 <schedule_dm+0x11c>
    22cc:	fc043783          	ld	a5,-64(s0)
    22d0:	5fd8                	lw	a4,60(a5)
    22d2:	fc843783          	ld	a5,-56(s0)
    22d6:	5fdc                	lw	a5,60(a5)
    22d8:	00f75863          	bge	a4,a5,22e8 <schedule_dm+0x11c>
            highest_priority_thread = th;
    22dc:	fc043783          	ld	a5,-64(s0)
    22e0:	fcf43423          	sd	a5,-56(s0)
    22e4:	a011                	j	22e8 <schedule_dm+0x11c>
            if (th->current_deadline > current_time) continue;
    22e6:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    22e8:	fc043783          	ld	a5,-64(s0)
    22ec:	779c                	ld	a5,40(a5)
    22ee:	f8f43023          	sd	a5,-128(s0)
    22f2:	f8043783          	ld	a5,-128(s0)
    22f6:	fd878793          	addi	a5,a5,-40
    22fa:	fcf43023          	sd	a5,-64(s0)
    22fe:	fc043783          	ld	a5,-64(s0)
    2302:	02878713          	addi	a4,a5,40
    2306:	649c                	ld	a5,8(s1)
    2308:	f2f71be3          	bne	a4,a5,223e <schedule_dm+0x72>
        }
    }

    // the thread missing the current deadline
    if (highest_priority_thread->current_deadline <= current_time)
    230c:	fc843783          	ld	a5,-56(s0)
    2310:	4ff8                	lw	a4,92(a5)
    2312:	fac42783          	lw	a5,-84(s0)
    2316:	2781                	sext.w	a5,a5
    2318:	00e7cb63          	blt	a5,a4,232e <schedule_dm+0x162>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    231c:	fc843783          	ld	a5,-56(s0)
    2320:	02878793          	addi	a5,a5,40
    2324:	f6f43823          	sd	a5,-144(s0)
    2328:	f6042c23          	sw	zero,-136(s0)
    232c:	a201                	j	242c <schedule_dm+0x260>

    int executing_time = highest_priority_thread->remaining_time;
    232e:	fc843783          	ld	a5,-56(s0)
    2332:	4fbc                	lw	a5,88(a5)
    2334:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    2338:	fc843783          	ld	a5,-56(s0)
    233c:	4fb4                	lw	a3,88(a5)
    233e:	fc843783          	ld	a5,-56(s0)
    2342:	4ff8                	lw	a4,92(a5)
    2344:	fac42783          	lw	a5,-84(s0)
    2348:	40f707bb          	subw	a5,a4,a5
    234c:	2781                	sext.w	a5,a5
    234e:	8736                	mv	a4,a3
    2350:	00e7db63          	bge	a5,a4,2366 <schedule_dm+0x19a>
        executing_time = highest_priority_thread->current_deadline - current_time;
    2354:	fc843783          	ld	a5,-56(s0)
    2358:	4ff8                	lw	a4,92(a5)
    235a:	fac42783          	lw	a5,-84(s0)
    235e:	40f707bb          	subw	a5,a4,a5
    2362:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    2366:	689c                	ld	a5,16(s1)
    2368:	639c                	ld	a5,0(a5)
    236a:	f8f43c23          	sd	a5,-104(s0)
    236e:	f9843783          	ld	a5,-104(s0)
    2372:	17e1                	addi	a5,a5,-8
    2374:	faf43823          	sd	a5,-80(s0)
    2378:	a049                	j	23fa <schedule_dm+0x22e>
        int interval = cur->release_time - current_time;
    237a:	fb043783          	ld	a5,-80(s0)
    237e:	4f98                	lw	a4,24(a5)
    2380:	fac42783          	lw	a5,-84(s0)
    2384:	40f707bb          	subw	a5,a4,a5
    2388:	f8f42a23          	sw	a5,-108(s0)
        if (interval > executing_time) continue;
    238c:	f9442703          	lw	a4,-108(s0)
    2390:	fbc42783          	lw	a5,-68(s0)
    2394:	2701                	sext.w	a4,a4
    2396:	2781                	sext.w	a5,a5
    2398:	04e7c263          	blt	a5,a4,23dc <schedule_dm+0x210>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    239c:	fc843783          	ld	a5,-56(s0)
    23a0:	47f8                	lw	a4,76(a5)
    23a2:	fb043783          	ld	a5,-80(s0)
    23a6:	639c                	ld	a5,0(a5)
    23a8:	47fc                	lw	a5,76(a5)
    23aa:	02f74b63          	blt	a4,a5,23e0 <schedule_dm+0x214>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    23ae:	fc843783          	ld	a5,-56(s0)
    23b2:	47f8                	lw	a4,76(a5)
    23b4:	fb043783          	ld	a5,-80(s0)
    23b8:	639c                	ld	a5,0(a5)
    23ba:	47fc                	lw	a5,76(a5)
    23bc:	00f71b63          	bne	a4,a5,23d2 <schedule_dm+0x206>
    23c0:	fc843783          	ld	a5,-56(s0)
    23c4:	5fd8                	lw	a4,60(a5)
    23c6:	fb043783          	ld	a5,-80(s0)
    23ca:	639c                	ld	a5,0(a5)
    23cc:	5fdc                	lw	a5,60(a5)
    23ce:	00f74b63          	blt	a4,a5,23e4 <schedule_dm+0x218>
        executing_time = interval;
    23d2:	f9442783          	lw	a5,-108(s0)
    23d6:	faf42e23          	sw	a5,-68(s0)
    23da:	a031                	j	23e6 <schedule_dm+0x21a>
        if (interval > executing_time) continue;
    23dc:	0001                	nop
    23de:	a021                	j	23e6 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    23e0:	0001                	nop
    23e2:	a011                	j	23e6 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    23e4:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    23e6:	fb043783          	ld	a5,-80(s0)
    23ea:	679c                	ld	a5,8(a5)
    23ec:	f8f43423          	sd	a5,-120(s0)
    23f0:	f8843783          	ld	a5,-120(s0)
    23f4:	17e1                	addi	a5,a5,-8
    23f6:	faf43823          	sd	a5,-80(s0)
    23fa:	fb043783          	ld	a5,-80(s0)
    23fe:	00878713          	addi	a4,a5,8
    2402:	689c                	ld	a5,16(s1)
    2404:	f6f71be3          	bne	a4,a5,237a <schedule_dm+0x1ae>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &highest_priority_thread->thread_list;
    2408:	fc843783          	ld	a5,-56(s0)
    240c:	02878793          	addi	a5,a5,40
    2410:	f6f43023          	sd	a5,-160(s0)
    r.allocated_time = executing_time;
    2414:	fbc42783          	lw	a5,-68(s0)
    2418:	f6f42423          	sw	a5,-152(s0)
    return r;
    241c:	f6043783          	ld	a5,-160(s0)
    2420:	f6f43823          	sd	a5,-144(s0)
    2424:	f6843783          	ld	a5,-152(s0)
    2428:	f6f43c23          	sd	a5,-136(s0)
    242c:	4701                	li	a4,0
    242e:	f7043703          	ld	a4,-144(s0)
    2432:	4781                	li	a5,0
    2434:	f7843783          	ld	a5,-136(s0)
    2438:	893a                	mv	s2,a4
    243a:	89be                	mv	s3,a5
    243c:	874a                	mv	a4,s2
    243e:	87ce                	mv	a5,s3
    2440:	853a                	mv	a0,a4
    2442:	85be                	mv	a1,a5
    2444:	60ae                	ld	ra,200(sp)
    2446:	640e                	ld	s0,192(sp)
    2448:	74ea                	ld	s1,184(sp)
    244a:	794a                	ld	s2,176(sp)
    244c:	79aa                	ld	s3,168(sp)
    244e:	6169                	addi	sp,sp,208
    2450:	8082                	ret
