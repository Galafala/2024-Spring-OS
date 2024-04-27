
user/_rttask4:     file format elf64-littleriscv


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
       e:	4d678793          	addi	a5,a5,1238 # 24e0 <k>
      12:	439c                	lw	a5,0(a5)
      14:	2785                	addiw	a5,a5,1
      16:	0007871b          	sext.w	a4,a5
      1a:	00002797          	auipc	a5,0x2
      1e:	4c678793          	addi	a5,a5,1222 # 24e0 <k>
      22:	c398                	sw	a4,0(a5)
      24:	b7dd                	j	a <f+0xa>

0000000000000026 <main>:
    }
}

int main(int argc, char **argv)
{
      26:	7139                	addi	sp,sp,-64
      28:	fc06                	sd	ra,56(sp)
      2a:	f822                	sd	s0,48(sp)
      2c:	0080                	addi	s0,sp,64
      2e:	87aa                	mv	a5,a0
      30:	fcb43023          	sd	a1,-64(s0)
      34:	fcf42623          	sw	a5,-52(s0)
    struct thread *t1 = thread_create(f, NULL, 1, 1, 10, 2);
      38:	4789                	li	a5,2
      3a:	4729                	li	a4,10
      3c:	4685                	li	a3,1
      3e:	4605                	li	a2,1
      40:	4581                	li	a1,0
      42:	00000517          	auipc	a0,0x0
      46:	fbe50513          	addi	a0,a0,-66 # 0 <f>
      4a:	00001097          	auipc	ra,0x1
      4e:	f4e080e7          	jalr	-178(ra) # f98 <thread_create>
      52:	fea43423          	sd	a0,-24(s0)
    thread_add_at(t1, 3);
      56:	458d                	li	a1,3
      58:	fe843503          	ld	a0,-24(s0)
      5c:	00001097          	auipc	ra,0x1
      60:	068080e7          	jalr	104(ra) # 10c4 <thread_add_at>

    struct thread *t2 = thread_create(f, NULL, 1, 2, 10, 2);
      64:	4789                	li	a5,2
      66:	4729                	li	a4,10
      68:	4689                	li	a3,2
      6a:	4605                	li	a2,1
      6c:	4581                	li	a1,0
      6e:	00000517          	auipc	a0,0x0
      72:	f9250513          	addi	a0,a0,-110 # 0 <f>
      76:	00001097          	auipc	ra,0x1
      7a:	f22080e7          	jalr	-222(ra) # f98 <thread_create>
      7e:	fea43023          	sd	a0,-32(s0)
    thread_add_at(t2, 2);
      82:	4589                	li	a1,2
      84:	fe043503          	ld	a0,-32(s0)
      88:	00001097          	auipc	ra,0x1
      8c:	03c080e7          	jalr	60(ra) # 10c4 <thread_add_at>

    struct thread *t3 = thread_create(f, NULL, 1, 3, 10, 2);
      90:	4789                	li	a5,2
      92:	4729                	li	a4,10
      94:	468d                	li	a3,3
      96:	4605                	li	a2,1
      98:	4581                	li	a1,0
      9a:	00000517          	auipc	a0,0x0
      9e:	f6650513          	addi	a0,a0,-154 # 0 <f>
      a2:	00001097          	auipc	ra,0x1
      a6:	ef6080e7          	jalr	-266(ra) # f98 <thread_create>
      aa:	fca43c23          	sd	a0,-40(s0)
    thread_add_at(t3, 1);
      ae:	4585                	li	a1,1
      b0:	fd843503          	ld	a0,-40(s0)
      b4:	00001097          	auipc	ra,0x1
      b8:	010080e7          	jalr	16(ra) # 10c4 <thread_add_at>

    struct thread *t4 = thread_create(f, NULL, 1, 4, 10, 2);
      bc:	4789                	li	a5,2
      be:	4729                	li	a4,10
      c0:	4691                	li	a3,4
      c2:	4605                	li	a2,1
      c4:	4581                	li	a1,0
      c6:	00000517          	auipc	a0,0x0
      ca:	f3a50513          	addi	a0,a0,-198 # 0 <f>
      ce:	00001097          	auipc	ra,0x1
      d2:	eca080e7          	jalr	-310(ra) # f98 <thread_create>
      d6:	fca43823          	sd	a0,-48(s0)
    thread_add_at(t4, 0);
      da:	4581                	li	a1,0
      dc:	fd043503          	ld	a0,-48(s0)
      e0:	00001097          	auipc	ra,0x1
      e4:	fe4080e7          	jalr	-28(ra) # 10c4 <thread_add_at>

    thread_start_threading();
      e8:	00001097          	auipc	ra,0x1
      ec:	7ea080e7          	jalr	2026(ra) # 18d2 <thread_start_threading>
    printf("\nexited\n");
      f0:	00002517          	auipc	a0,0x2
      f4:	25850513          	addi	a0,a0,600 # 2348 <schedule_dm+0x234>
      f8:	00001097          	auipc	ra,0x1
      fc:	9e8080e7          	jalr	-1560(ra) # ae0 <printf>
    exit(0);
     100:	4501                	li	a0,0
     102:	00000097          	auipc	ra,0x0
     106:	498080e7          	jalr	1176(ra) # 59a <exit>

000000000000010a <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     10a:	7179                	addi	sp,sp,-48
     10c:	f422                	sd	s0,40(sp)
     10e:	1800                	addi	s0,sp,48
     110:	fca43c23          	sd	a0,-40(s0)
     114:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     118:	fd843783          	ld	a5,-40(s0)
     11c:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     120:	0001                	nop
     122:	fd043703          	ld	a4,-48(s0)
     126:	00170793          	addi	a5,a4,1
     12a:	fcf43823          	sd	a5,-48(s0)
     12e:	fd843783          	ld	a5,-40(s0)
     132:	00178693          	addi	a3,a5,1
     136:	fcd43c23          	sd	a3,-40(s0)
     13a:	00074703          	lbu	a4,0(a4)
     13e:	00e78023          	sb	a4,0(a5)
     142:	0007c783          	lbu	a5,0(a5)
     146:	fff1                	bnez	a5,122 <strcpy+0x18>
    ;
  return os;
     148:	fe843783          	ld	a5,-24(s0)
}
     14c:	853e                	mv	a0,a5
     14e:	7422                	ld	s0,40(sp)
     150:	6145                	addi	sp,sp,48
     152:	8082                	ret

0000000000000154 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     154:	1101                	addi	sp,sp,-32
     156:	ec22                	sd	s0,24(sp)
     158:	1000                	addi	s0,sp,32
     15a:	fea43423          	sd	a0,-24(s0)
     15e:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     162:	a819                	j	178 <strcmp+0x24>
    p++, q++;
     164:	fe843783          	ld	a5,-24(s0)
     168:	0785                	addi	a5,a5,1
     16a:	fef43423          	sd	a5,-24(s0)
     16e:	fe043783          	ld	a5,-32(s0)
     172:	0785                	addi	a5,a5,1
     174:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     178:	fe843783          	ld	a5,-24(s0)
     17c:	0007c783          	lbu	a5,0(a5)
     180:	cb99                	beqz	a5,196 <strcmp+0x42>
     182:	fe843783          	ld	a5,-24(s0)
     186:	0007c703          	lbu	a4,0(a5)
     18a:	fe043783          	ld	a5,-32(s0)
     18e:	0007c783          	lbu	a5,0(a5)
     192:	fcf709e3          	beq	a4,a5,164 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     196:	fe843783          	ld	a5,-24(s0)
     19a:	0007c783          	lbu	a5,0(a5)
     19e:	0007871b          	sext.w	a4,a5
     1a2:	fe043783          	ld	a5,-32(s0)
     1a6:	0007c783          	lbu	a5,0(a5)
     1aa:	2781                	sext.w	a5,a5
     1ac:	40f707bb          	subw	a5,a4,a5
     1b0:	2781                	sext.w	a5,a5
}
     1b2:	853e                	mv	a0,a5
     1b4:	6462                	ld	s0,24(sp)
     1b6:	6105                	addi	sp,sp,32
     1b8:	8082                	ret

00000000000001ba <strlen>:

uint
strlen(const char *s)
{
     1ba:	7179                	addi	sp,sp,-48
     1bc:	f422                	sd	s0,40(sp)
     1be:	1800                	addi	s0,sp,48
     1c0:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     1c4:	fe042623          	sw	zero,-20(s0)
     1c8:	a031                	j	1d4 <strlen+0x1a>
     1ca:	fec42783          	lw	a5,-20(s0)
     1ce:	2785                	addiw	a5,a5,1
     1d0:	fef42623          	sw	a5,-20(s0)
     1d4:	fec42783          	lw	a5,-20(s0)
     1d8:	fd843703          	ld	a4,-40(s0)
     1dc:	97ba                	add	a5,a5,a4
     1de:	0007c783          	lbu	a5,0(a5)
     1e2:	f7e5                	bnez	a5,1ca <strlen+0x10>
    ;
  return n;
     1e4:	fec42783          	lw	a5,-20(s0)
}
     1e8:	853e                	mv	a0,a5
     1ea:	7422                	ld	s0,40(sp)
     1ec:	6145                	addi	sp,sp,48
     1ee:	8082                	ret

00000000000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1f0:	7179                	addi	sp,sp,-48
     1f2:	f422                	sd	s0,40(sp)
     1f4:	1800                	addi	s0,sp,48
     1f6:	fca43c23          	sd	a0,-40(s0)
     1fa:	87ae                	mv	a5,a1
     1fc:	8732                	mv	a4,a2
     1fe:	fcf42a23          	sw	a5,-44(s0)
     202:	87ba                	mv	a5,a4
     204:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     208:	fd843783          	ld	a5,-40(s0)
     20c:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     210:	fe042623          	sw	zero,-20(s0)
     214:	a00d                	j	236 <memset+0x46>
    cdst[i] = c;
     216:	fec42783          	lw	a5,-20(s0)
     21a:	fe043703          	ld	a4,-32(s0)
     21e:	97ba                	add	a5,a5,a4
     220:	fd442703          	lw	a4,-44(s0)
     224:	0ff77713          	andi	a4,a4,255
     228:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     22c:	fec42783          	lw	a5,-20(s0)
     230:	2785                	addiw	a5,a5,1
     232:	fef42623          	sw	a5,-20(s0)
     236:	fec42703          	lw	a4,-20(s0)
     23a:	fd042783          	lw	a5,-48(s0)
     23e:	2781                	sext.w	a5,a5
     240:	fcf76be3          	bltu	a4,a5,216 <memset+0x26>
  }
  return dst;
     244:	fd843783          	ld	a5,-40(s0)
}
     248:	853e                	mv	a0,a5
     24a:	7422                	ld	s0,40(sp)
     24c:	6145                	addi	sp,sp,48
     24e:	8082                	ret

0000000000000250 <strchr>:

char*
strchr(const char *s, char c)
{
     250:	1101                	addi	sp,sp,-32
     252:	ec22                	sd	s0,24(sp)
     254:	1000                	addi	s0,sp,32
     256:	fea43423          	sd	a0,-24(s0)
     25a:	87ae                	mv	a5,a1
     25c:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     260:	a01d                	j	286 <strchr+0x36>
    if(*s == c)
     262:	fe843783          	ld	a5,-24(s0)
     266:	0007c703          	lbu	a4,0(a5)
     26a:	fe744783          	lbu	a5,-25(s0)
     26e:	0ff7f793          	andi	a5,a5,255
     272:	00e79563          	bne	a5,a4,27c <strchr+0x2c>
      return (char*)s;
     276:	fe843783          	ld	a5,-24(s0)
     27a:	a821                	j	292 <strchr+0x42>
  for(; *s; s++)
     27c:	fe843783          	ld	a5,-24(s0)
     280:	0785                	addi	a5,a5,1
     282:	fef43423          	sd	a5,-24(s0)
     286:	fe843783          	ld	a5,-24(s0)
     28a:	0007c783          	lbu	a5,0(a5)
     28e:	fbf1                	bnez	a5,262 <strchr+0x12>
  return 0;
     290:	4781                	li	a5,0
}
     292:	853e                	mv	a0,a5
     294:	6462                	ld	s0,24(sp)
     296:	6105                	addi	sp,sp,32
     298:	8082                	ret

000000000000029a <gets>:

char*
gets(char *buf, int max)
{
     29a:	7179                	addi	sp,sp,-48
     29c:	f406                	sd	ra,40(sp)
     29e:	f022                	sd	s0,32(sp)
     2a0:	1800                	addi	s0,sp,48
     2a2:	fca43c23          	sd	a0,-40(s0)
     2a6:	87ae                	mv	a5,a1
     2a8:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2ac:	fe042623          	sw	zero,-20(s0)
     2b0:	a8a1                	j	308 <gets+0x6e>
    cc = read(0, &c, 1);
     2b2:	fe740793          	addi	a5,s0,-25
     2b6:	4605                	li	a2,1
     2b8:	85be                	mv	a1,a5
     2ba:	4501                	li	a0,0
     2bc:	00000097          	auipc	ra,0x0
     2c0:	2f6080e7          	jalr	758(ra) # 5b2 <read>
     2c4:	87aa                	mv	a5,a0
     2c6:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     2ca:	fe842783          	lw	a5,-24(s0)
     2ce:	2781                	sext.w	a5,a5
     2d0:	04f05763          	blez	a5,31e <gets+0x84>
      break;
    buf[i++] = c;
     2d4:	fec42783          	lw	a5,-20(s0)
     2d8:	0017871b          	addiw	a4,a5,1
     2dc:	fee42623          	sw	a4,-20(s0)
     2e0:	873e                	mv	a4,a5
     2e2:	fd843783          	ld	a5,-40(s0)
     2e6:	97ba                	add	a5,a5,a4
     2e8:	fe744703          	lbu	a4,-25(s0)
     2ec:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     2f0:	fe744783          	lbu	a5,-25(s0)
     2f4:	873e                	mv	a4,a5
     2f6:	47a9                	li	a5,10
     2f8:	02f70463          	beq	a4,a5,320 <gets+0x86>
     2fc:	fe744783          	lbu	a5,-25(s0)
     300:	873e                	mv	a4,a5
     302:	47b5                	li	a5,13
     304:	00f70e63          	beq	a4,a5,320 <gets+0x86>
  for(i=0; i+1 < max; ){
     308:	fec42783          	lw	a5,-20(s0)
     30c:	2785                	addiw	a5,a5,1
     30e:	0007871b          	sext.w	a4,a5
     312:	fd442783          	lw	a5,-44(s0)
     316:	2781                	sext.w	a5,a5
     318:	f8f74de3          	blt	a4,a5,2b2 <gets+0x18>
     31c:	a011                	j	320 <gets+0x86>
      break;
     31e:	0001                	nop
      break;
  }
  buf[i] = '\0';
     320:	fec42783          	lw	a5,-20(s0)
     324:	fd843703          	ld	a4,-40(s0)
     328:	97ba                	add	a5,a5,a4
     32a:	00078023          	sb	zero,0(a5)
  return buf;
     32e:	fd843783          	ld	a5,-40(s0)
}
     332:	853e                	mv	a0,a5
     334:	70a2                	ld	ra,40(sp)
     336:	7402                	ld	s0,32(sp)
     338:	6145                	addi	sp,sp,48
     33a:	8082                	ret

000000000000033c <stat>:

int
stat(const char *n, struct stat *st)
{
     33c:	7179                	addi	sp,sp,-48
     33e:	f406                	sd	ra,40(sp)
     340:	f022                	sd	s0,32(sp)
     342:	1800                	addi	s0,sp,48
     344:	fca43c23          	sd	a0,-40(s0)
     348:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     34c:	4581                	li	a1,0
     34e:	fd843503          	ld	a0,-40(s0)
     352:	00000097          	auipc	ra,0x0
     356:	288080e7          	jalr	648(ra) # 5da <open>
     35a:	87aa                	mv	a5,a0
     35c:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     360:	fec42783          	lw	a5,-20(s0)
     364:	2781                	sext.w	a5,a5
     366:	0007d463          	bgez	a5,36e <stat+0x32>
    return -1;
     36a:	57fd                	li	a5,-1
     36c:	a035                	j	398 <stat+0x5c>
  r = fstat(fd, st);
     36e:	fec42783          	lw	a5,-20(s0)
     372:	fd043583          	ld	a1,-48(s0)
     376:	853e                	mv	a0,a5
     378:	00000097          	auipc	ra,0x0
     37c:	27a080e7          	jalr	634(ra) # 5f2 <fstat>
     380:	87aa                	mv	a5,a0
     382:	fef42423          	sw	a5,-24(s0)
  close(fd);
     386:	fec42783          	lw	a5,-20(s0)
     38a:	853e                	mv	a0,a5
     38c:	00000097          	auipc	ra,0x0
     390:	236080e7          	jalr	566(ra) # 5c2 <close>
  return r;
     394:	fe842783          	lw	a5,-24(s0)
}
     398:	853e                	mv	a0,a5
     39a:	70a2                	ld	ra,40(sp)
     39c:	7402                	ld	s0,32(sp)
     39e:	6145                	addi	sp,sp,48
     3a0:	8082                	ret

00000000000003a2 <atoi>:

int
atoi(const char *s)
{
     3a2:	7179                	addi	sp,sp,-48
     3a4:	f422                	sd	s0,40(sp)
     3a6:	1800                	addi	s0,sp,48
     3a8:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     3ac:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     3b0:	a815                	j	3e4 <atoi+0x42>
    n = n*10 + *s++ - '0';
     3b2:	fec42703          	lw	a4,-20(s0)
     3b6:	87ba                	mv	a5,a4
     3b8:	0027979b          	slliw	a5,a5,0x2
     3bc:	9fb9                	addw	a5,a5,a4
     3be:	0017979b          	slliw	a5,a5,0x1
     3c2:	0007871b          	sext.w	a4,a5
     3c6:	fd843783          	ld	a5,-40(s0)
     3ca:	00178693          	addi	a3,a5,1
     3ce:	fcd43c23          	sd	a3,-40(s0)
     3d2:	0007c783          	lbu	a5,0(a5)
     3d6:	2781                	sext.w	a5,a5
     3d8:	9fb9                	addw	a5,a5,a4
     3da:	2781                	sext.w	a5,a5
     3dc:	fd07879b          	addiw	a5,a5,-48
     3e0:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     3e4:	fd843783          	ld	a5,-40(s0)
     3e8:	0007c783          	lbu	a5,0(a5)
     3ec:	873e                	mv	a4,a5
     3ee:	02f00793          	li	a5,47
     3f2:	00e7fb63          	bgeu	a5,a4,408 <atoi+0x66>
     3f6:	fd843783          	ld	a5,-40(s0)
     3fa:	0007c783          	lbu	a5,0(a5)
     3fe:	873e                	mv	a4,a5
     400:	03900793          	li	a5,57
     404:	fae7f7e3          	bgeu	a5,a4,3b2 <atoi+0x10>
  return n;
     408:	fec42783          	lw	a5,-20(s0)
}
     40c:	853e                	mv	a0,a5
     40e:	7422                	ld	s0,40(sp)
     410:	6145                	addi	sp,sp,48
     412:	8082                	ret

0000000000000414 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     414:	7139                	addi	sp,sp,-64
     416:	fc22                	sd	s0,56(sp)
     418:	0080                	addi	s0,sp,64
     41a:	fca43c23          	sd	a0,-40(s0)
     41e:	fcb43823          	sd	a1,-48(s0)
     422:	87b2                	mv	a5,a2
     424:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     428:	fd843783          	ld	a5,-40(s0)
     42c:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     430:	fd043783          	ld	a5,-48(s0)
     434:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     438:	fe043703          	ld	a4,-32(s0)
     43c:	fe843783          	ld	a5,-24(s0)
     440:	02e7fc63          	bgeu	a5,a4,478 <memmove+0x64>
    while(n-- > 0)
     444:	a00d                	j	466 <memmove+0x52>
      *dst++ = *src++;
     446:	fe043703          	ld	a4,-32(s0)
     44a:	00170793          	addi	a5,a4,1
     44e:	fef43023          	sd	a5,-32(s0)
     452:	fe843783          	ld	a5,-24(s0)
     456:	00178693          	addi	a3,a5,1
     45a:	fed43423          	sd	a3,-24(s0)
     45e:	00074703          	lbu	a4,0(a4)
     462:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     466:	fcc42783          	lw	a5,-52(s0)
     46a:	fff7871b          	addiw	a4,a5,-1
     46e:	fce42623          	sw	a4,-52(s0)
     472:	fcf04ae3          	bgtz	a5,446 <memmove+0x32>
     476:	a891                	j	4ca <memmove+0xb6>
  } else {
    dst += n;
     478:	fcc42783          	lw	a5,-52(s0)
     47c:	fe843703          	ld	a4,-24(s0)
     480:	97ba                	add	a5,a5,a4
     482:	fef43423          	sd	a5,-24(s0)
    src += n;
     486:	fcc42783          	lw	a5,-52(s0)
     48a:	fe043703          	ld	a4,-32(s0)
     48e:	97ba                	add	a5,a5,a4
     490:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     494:	a01d                	j	4ba <memmove+0xa6>
      *--dst = *--src;
     496:	fe043783          	ld	a5,-32(s0)
     49a:	17fd                	addi	a5,a5,-1
     49c:	fef43023          	sd	a5,-32(s0)
     4a0:	fe843783          	ld	a5,-24(s0)
     4a4:	17fd                	addi	a5,a5,-1
     4a6:	fef43423          	sd	a5,-24(s0)
     4aa:	fe043783          	ld	a5,-32(s0)
     4ae:	0007c703          	lbu	a4,0(a5)
     4b2:	fe843783          	ld	a5,-24(s0)
     4b6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     4ba:	fcc42783          	lw	a5,-52(s0)
     4be:	fff7871b          	addiw	a4,a5,-1
     4c2:	fce42623          	sw	a4,-52(s0)
     4c6:	fcf048e3          	bgtz	a5,496 <memmove+0x82>
  }
  return vdst;
     4ca:	fd843783          	ld	a5,-40(s0)
}
     4ce:	853e                	mv	a0,a5
     4d0:	7462                	ld	s0,56(sp)
     4d2:	6121                	addi	sp,sp,64
     4d4:	8082                	ret

00000000000004d6 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     4d6:	7139                	addi	sp,sp,-64
     4d8:	fc22                	sd	s0,56(sp)
     4da:	0080                	addi	s0,sp,64
     4dc:	fca43c23          	sd	a0,-40(s0)
     4e0:	fcb43823          	sd	a1,-48(s0)
     4e4:	87b2                	mv	a5,a2
     4e6:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     4ea:	fd843783          	ld	a5,-40(s0)
     4ee:	fef43423          	sd	a5,-24(s0)
     4f2:	fd043783          	ld	a5,-48(s0)
     4f6:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4fa:	a0a1                	j	542 <memcmp+0x6c>
    if (*p1 != *p2) {
     4fc:	fe843783          	ld	a5,-24(s0)
     500:	0007c703          	lbu	a4,0(a5)
     504:	fe043783          	ld	a5,-32(s0)
     508:	0007c783          	lbu	a5,0(a5)
     50c:	02f70163          	beq	a4,a5,52e <memcmp+0x58>
      return *p1 - *p2;
     510:	fe843783          	ld	a5,-24(s0)
     514:	0007c783          	lbu	a5,0(a5)
     518:	0007871b          	sext.w	a4,a5
     51c:	fe043783          	ld	a5,-32(s0)
     520:	0007c783          	lbu	a5,0(a5)
     524:	2781                	sext.w	a5,a5
     526:	40f707bb          	subw	a5,a4,a5
     52a:	2781                	sext.w	a5,a5
     52c:	a01d                	j	552 <memcmp+0x7c>
    }
    p1++;
     52e:	fe843783          	ld	a5,-24(s0)
     532:	0785                	addi	a5,a5,1
     534:	fef43423          	sd	a5,-24(s0)
    p2++;
     538:	fe043783          	ld	a5,-32(s0)
     53c:	0785                	addi	a5,a5,1
     53e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     542:	fcc42783          	lw	a5,-52(s0)
     546:	fff7871b          	addiw	a4,a5,-1
     54a:	fce42623          	sw	a4,-52(s0)
     54e:	f7dd                	bnez	a5,4fc <memcmp+0x26>
  }
  return 0;
     550:	4781                	li	a5,0
}
     552:	853e                	mv	a0,a5
     554:	7462                	ld	s0,56(sp)
     556:	6121                	addi	sp,sp,64
     558:	8082                	ret

000000000000055a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     55a:	7179                	addi	sp,sp,-48
     55c:	f406                	sd	ra,40(sp)
     55e:	f022                	sd	s0,32(sp)
     560:	1800                	addi	s0,sp,48
     562:	fea43423          	sd	a0,-24(s0)
     566:	feb43023          	sd	a1,-32(s0)
     56a:	87b2                	mv	a5,a2
     56c:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     570:	fdc42783          	lw	a5,-36(s0)
     574:	863e                	mv	a2,a5
     576:	fe043583          	ld	a1,-32(s0)
     57a:	fe843503          	ld	a0,-24(s0)
     57e:	00000097          	auipc	ra,0x0
     582:	e96080e7          	jalr	-362(ra) # 414 <memmove>
     586:	87aa                	mv	a5,a0
}
     588:	853e                	mv	a0,a5
     58a:	70a2                	ld	ra,40(sp)
     58c:	7402                	ld	s0,32(sp)
     58e:	6145                	addi	sp,sp,48
     590:	8082                	ret

0000000000000592 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     592:	4885                	li	a7,1
 ecall
     594:	00000073          	ecall
 ret
     598:	8082                	ret

000000000000059a <exit>:
.global exit
exit:
 li a7, SYS_exit
     59a:	4889                	li	a7,2
 ecall
     59c:	00000073          	ecall
 ret
     5a0:	8082                	ret

00000000000005a2 <wait>:
.global wait
wait:
 li a7, SYS_wait
     5a2:	488d                	li	a7,3
 ecall
     5a4:	00000073          	ecall
 ret
     5a8:	8082                	ret

00000000000005aa <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     5aa:	4891                	li	a7,4
 ecall
     5ac:	00000073          	ecall
 ret
     5b0:	8082                	ret

00000000000005b2 <read>:
.global read
read:
 li a7, SYS_read
     5b2:	4895                	li	a7,5
 ecall
     5b4:	00000073          	ecall
 ret
     5b8:	8082                	ret

00000000000005ba <write>:
.global write
write:
 li a7, SYS_write
     5ba:	48c1                	li	a7,16
 ecall
     5bc:	00000073          	ecall
 ret
     5c0:	8082                	ret

00000000000005c2 <close>:
.global close
close:
 li a7, SYS_close
     5c2:	48d5                	li	a7,21
 ecall
     5c4:	00000073          	ecall
 ret
     5c8:	8082                	ret

00000000000005ca <kill>:
.global kill
kill:
 li a7, SYS_kill
     5ca:	4899                	li	a7,6
 ecall
     5cc:	00000073          	ecall
 ret
     5d0:	8082                	ret

00000000000005d2 <exec>:
.global exec
exec:
 li a7, SYS_exec
     5d2:	489d                	li	a7,7
 ecall
     5d4:	00000073          	ecall
 ret
     5d8:	8082                	ret

00000000000005da <open>:
.global open
open:
 li a7, SYS_open
     5da:	48bd                	li	a7,15
 ecall
     5dc:	00000073          	ecall
 ret
     5e0:	8082                	ret

00000000000005e2 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     5e2:	48c5                	li	a7,17
 ecall
     5e4:	00000073          	ecall
 ret
     5e8:	8082                	ret

00000000000005ea <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     5ea:	48c9                	li	a7,18
 ecall
     5ec:	00000073          	ecall
 ret
     5f0:	8082                	ret

00000000000005f2 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     5f2:	48a1                	li	a7,8
 ecall
     5f4:	00000073          	ecall
 ret
     5f8:	8082                	ret

00000000000005fa <link>:
.global link
link:
 li a7, SYS_link
     5fa:	48cd                	li	a7,19
 ecall
     5fc:	00000073          	ecall
 ret
     600:	8082                	ret

0000000000000602 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     602:	48d1                	li	a7,20
 ecall
     604:	00000073          	ecall
 ret
     608:	8082                	ret

000000000000060a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     60a:	48a5                	li	a7,9
 ecall
     60c:	00000073          	ecall
 ret
     610:	8082                	ret

0000000000000612 <dup>:
.global dup
dup:
 li a7, SYS_dup
     612:	48a9                	li	a7,10
 ecall
     614:	00000073          	ecall
 ret
     618:	8082                	ret

000000000000061a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     61a:	48ad                	li	a7,11
 ecall
     61c:	00000073          	ecall
 ret
     620:	8082                	ret

0000000000000622 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     622:	48b1                	li	a7,12
 ecall
     624:	00000073          	ecall
 ret
     628:	8082                	ret

000000000000062a <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     62a:	48b5                	li	a7,13
 ecall
     62c:	00000073          	ecall
 ret
     630:	8082                	ret

0000000000000632 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     632:	48b9                	li	a7,14
 ecall
     634:	00000073          	ecall
 ret
     638:	8082                	ret

000000000000063a <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     63a:	48d9                	li	a7,22
 ecall
     63c:	00000073          	ecall
 ret
     640:	8082                	ret

0000000000000642 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     642:	48dd                	li	a7,23
 ecall
     644:	00000073          	ecall
 ret
     648:	8082                	ret

000000000000064a <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     64a:	48e1                	li	a7,24
 ecall
     64c:	00000073          	ecall
 ret
     650:	8082                	ret

0000000000000652 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     652:	1101                	addi	sp,sp,-32
     654:	ec06                	sd	ra,24(sp)
     656:	e822                	sd	s0,16(sp)
     658:	1000                	addi	s0,sp,32
     65a:	87aa                	mv	a5,a0
     65c:	872e                	mv	a4,a1
     65e:	fef42623          	sw	a5,-20(s0)
     662:	87ba                	mv	a5,a4
     664:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     668:	feb40713          	addi	a4,s0,-21
     66c:	fec42783          	lw	a5,-20(s0)
     670:	4605                	li	a2,1
     672:	85ba                	mv	a1,a4
     674:	853e                	mv	a0,a5
     676:	00000097          	auipc	ra,0x0
     67a:	f44080e7          	jalr	-188(ra) # 5ba <write>
}
     67e:	0001                	nop
     680:	60e2                	ld	ra,24(sp)
     682:	6442                	ld	s0,16(sp)
     684:	6105                	addi	sp,sp,32
     686:	8082                	ret

0000000000000688 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     688:	7139                	addi	sp,sp,-64
     68a:	fc06                	sd	ra,56(sp)
     68c:	f822                	sd	s0,48(sp)
     68e:	0080                	addi	s0,sp,64
     690:	87aa                	mv	a5,a0
     692:	8736                	mv	a4,a3
     694:	fcf42623          	sw	a5,-52(s0)
     698:	87ae                	mv	a5,a1
     69a:	fcf42423          	sw	a5,-56(s0)
     69e:	87b2                	mv	a5,a2
     6a0:	fcf42223          	sw	a5,-60(s0)
     6a4:	87ba                	mv	a5,a4
     6a6:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     6aa:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     6ae:	fc042783          	lw	a5,-64(s0)
     6b2:	2781                	sext.w	a5,a5
     6b4:	c38d                	beqz	a5,6d6 <printint+0x4e>
     6b6:	fc842783          	lw	a5,-56(s0)
     6ba:	2781                	sext.w	a5,a5
     6bc:	0007dd63          	bgez	a5,6d6 <printint+0x4e>
    neg = 1;
     6c0:	4785                	li	a5,1
     6c2:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     6c6:	fc842783          	lw	a5,-56(s0)
     6ca:	40f007bb          	negw	a5,a5
     6ce:	2781                	sext.w	a5,a5
     6d0:	fef42223          	sw	a5,-28(s0)
     6d4:	a029                	j	6de <printint+0x56>
  } else {
    x = xx;
     6d6:	fc842783          	lw	a5,-56(s0)
     6da:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     6de:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     6e2:	fc442783          	lw	a5,-60(s0)
     6e6:	fe442703          	lw	a4,-28(s0)
     6ea:	02f777bb          	remuw	a5,a4,a5
     6ee:	0007861b          	sext.w	a2,a5
     6f2:	fec42783          	lw	a5,-20(s0)
     6f6:	0017871b          	addiw	a4,a5,1
     6fa:	fee42623          	sw	a4,-20(s0)
     6fe:	00002697          	auipc	a3,0x2
     702:	da268693          	addi	a3,a3,-606 # 24a0 <digits>
     706:	02061713          	slli	a4,a2,0x20
     70a:	9301                	srli	a4,a4,0x20
     70c:	9736                	add	a4,a4,a3
     70e:	00074703          	lbu	a4,0(a4)
     712:	ff040693          	addi	a3,s0,-16
     716:	97b6                	add	a5,a5,a3
     718:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     71c:	fc442783          	lw	a5,-60(s0)
     720:	fe442703          	lw	a4,-28(s0)
     724:	02f757bb          	divuw	a5,a4,a5
     728:	fef42223          	sw	a5,-28(s0)
     72c:	fe442783          	lw	a5,-28(s0)
     730:	2781                	sext.w	a5,a5
     732:	fbc5                	bnez	a5,6e2 <printint+0x5a>
  if(neg)
     734:	fe842783          	lw	a5,-24(s0)
     738:	2781                	sext.w	a5,a5
     73a:	cf95                	beqz	a5,776 <printint+0xee>
    buf[i++] = '-';
     73c:	fec42783          	lw	a5,-20(s0)
     740:	0017871b          	addiw	a4,a5,1
     744:	fee42623          	sw	a4,-20(s0)
     748:	ff040713          	addi	a4,s0,-16
     74c:	97ba                	add	a5,a5,a4
     74e:	02d00713          	li	a4,45
     752:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     756:	a005                	j	776 <printint+0xee>
    putc(fd, buf[i]);
     758:	fec42783          	lw	a5,-20(s0)
     75c:	ff040713          	addi	a4,s0,-16
     760:	97ba                	add	a5,a5,a4
     762:	fe07c703          	lbu	a4,-32(a5)
     766:	fcc42783          	lw	a5,-52(s0)
     76a:	85ba                	mv	a1,a4
     76c:	853e                	mv	a0,a5
     76e:	00000097          	auipc	ra,0x0
     772:	ee4080e7          	jalr	-284(ra) # 652 <putc>
  while(--i >= 0)
     776:	fec42783          	lw	a5,-20(s0)
     77a:	37fd                	addiw	a5,a5,-1
     77c:	fef42623          	sw	a5,-20(s0)
     780:	fec42783          	lw	a5,-20(s0)
     784:	2781                	sext.w	a5,a5
     786:	fc07d9e3          	bgez	a5,758 <printint+0xd0>
}
     78a:	0001                	nop
     78c:	0001                	nop
     78e:	70e2                	ld	ra,56(sp)
     790:	7442                	ld	s0,48(sp)
     792:	6121                	addi	sp,sp,64
     794:	8082                	ret

0000000000000796 <printptr>:

static void
printptr(int fd, uint64 x) {
     796:	7179                	addi	sp,sp,-48
     798:	f406                	sd	ra,40(sp)
     79a:	f022                	sd	s0,32(sp)
     79c:	1800                	addi	s0,sp,48
     79e:	87aa                	mv	a5,a0
     7a0:	fcb43823          	sd	a1,-48(s0)
     7a4:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     7a8:	fdc42783          	lw	a5,-36(s0)
     7ac:	03000593          	li	a1,48
     7b0:	853e                	mv	a0,a5
     7b2:	00000097          	auipc	ra,0x0
     7b6:	ea0080e7          	jalr	-352(ra) # 652 <putc>
  putc(fd, 'x');
     7ba:	fdc42783          	lw	a5,-36(s0)
     7be:	07800593          	li	a1,120
     7c2:	853e                	mv	a0,a5
     7c4:	00000097          	auipc	ra,0x0
     7c8:	e8e080e7          	jalr	-370(ra) # 652 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7cc:	fe042623          	sw	zero,-20(s0)
     7d0:	a82d                	j	80a <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     7d2:	fd043783          	ld	a5,-48(s0)
     7d6:	93f1                	srli	a5,a5,0x3c
     7d8:	00002717          	auipc	a4,0x2
     7dc:	cc870713          	addi	a4,a4,-824 # 24a0 <digits>
     7e0:	97ba                	add	a5,a5,a4
     7e2:	0007c703          	lbu	a4,0(a5)
     7e6:	fdc42783          	lw	a5,-36(s0)
     7ea:	85ba                	mv	a1,a4
     7ec:	853e                	mv	a0,a5
     7ee:	00000097          	auipc	ra,0x0
     7f2:	e64080e7          	jalr	-412(ra) # 652 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7f6:	fec42783          	lw	a5,-20(s0)
     7fa:	2785                	addiw	a5,a5,1
     7fc:	fef42623          	sw	a5,-20(s0)
     800:	fd043783          	ld	a5,-48(s0)
     804:	0792                	slli	a5,a5,0x4
     806:	fcf43823          	sd	a5,-48(s0)
     80a:	fec42783          	lw	a5,-20(s0)
     80e:	873e                	mv	a4,a5
     810:	47bd                	li	a5,15
     812:	fce7f0e3          	bgeu	a5,a4,7d2 <printptr+0x3c>
}
     816:	0001                	nop
     818:	0001                	nop
     81a:	70a2                	ld	ra,40(sp)
     81c:	7402                	ld	s0,32(sp)
     81e:	6145                	addi	sp,sp,48
     820:	8082                	ret

0000000000000822 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     822:	715d                	addi	sp,sp,-80
     824:	e486                	sd	ra,72(sp)
     826:	e0a2                	sd	s0,64(sp)
     828:	0880                	addi	s0,sp,80
     82a:	87aa                	mv	a5,a0
     82c:	fcb43023          	sd	a1,-64(s0)
     830:	fac43c23          	sd	a2,-72(s0)
     834:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     838:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     83c:	fe042223          	sw	zero,-28(s0)
     840:	a42d                	j	a6a <vprintf+0x248>
    c = fmt[i] & 0xff;
     842:	fe442783          	lw	a5,-28(s0)
     846:	fc043703          	ld	a4,-64(s0)
     84a:	97ba                	add	a5,a5,a4
     84c:	0007c783          	lbu	a5,0(a5)
     850:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     854:	fe042783          	lw	a5,-32(s0)
     858:	2781                	sext.w	a5,a5
     85a:	eb9d                	bnez	a5,890 <vprintf+0x6e>
      if(c == '%'){
     85c:	fdc42783          	lw	a5,-36(s0)
     860:	0007871b          	sext.w	a4,a5
     864:	02500793          	li	a5,37
     868:	00f71763          	bne	a4,a5,876 <vprintf+0x54>
        state = '%';
     86c:	02500793          	li	a5,37
     870:	fef42023          	sw	a5,-32(s0)
     874:	a2f5                	j	a60 <vprintf+0x23e>
      } else {
        putc(fd, c);
     876:	fdc42783          	lw	a5,-36(s0)
     87a:	0ff7f713          	andi	a4,a5,255
     87e:	fcc42783          	lw	a5,-52(s0)
     882:	85ba                	mv	a1,a4
     884:	853e                	mv	a0,a5
     886:	00000097          	auipc	ra,0x0
     88a:	dcc080e7          	jalr	-564(ra) # 652 <putc>
     88e:	aac9                	j	a60 <vprintf+0x23e>
      }
    } else if(state == '%'){
     890:	fe042783          	lw	a5,-32(s0)
     894:	0007871b          	sext.w	a4,a5
     898:	02500793          	li	a5,37
     89c:	1cf71263          	bne	a4,a5,a60 <vprintf+0x23e>
      if(c == 'd'){
     8a0:	fdc42783          	lw	a5,-36(s0)
     8a4:	0007871b          	sext.w	a4,a5
     8a8:	06400793          	li	a5,100
     8ac:	02f71463          	bne	a4,a5,8d4 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     8b0:	fb843783          	ld	a5,-72(s0)
     8b4:	00878713          	addi	a4,a5,8
     8b8:	fae43c23          	sd	a4,-72(s0)
     8bc:	4398                	lw	a4,0(a5)
     8be:	fcc42783          	lw	a5,-52(s0)
     8c2:	4685                	li	a3,1
     8c4:	4629                	li	a2,10
     8c6:	85ba                	mv	a1,a4
     8c8:	853e                	mv	a0,a5
     8ca:	00000097          	auipc	ra,0x0
     8ce:	dbe080e7          	jalr	-578(ra) # 688 <printint>
     8d2:	a269                	j	a5c <vprintf+0x23a>
      } else if(c == 'l') {
     8d4:	fdc42783          	lw	a5,-36(s0)
     8d8:	0007871b          	sext.w	a4,a5
     8dc:	06c00793          	li	a5,108
     8e0:	02f71663          	bne	a4,a5,90c <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     8e4:	fb843783          	ld	a5,-72(s0)
     8e8:	00878713          	addi	a4,a5,8
     8ec:	fae43c23          	sd	a4,-72(s0)
     8f0:	639c                	ld	a5,0(a5)
     8f2:	0007871b          	sext.w	a4,a5
     8f6:	fcc42783          	lw	a5,-52(s0)
     8fa:	4681                	li	a3,0
     8fc:	4629                	li	a2,10
     8fe:	85ba                	mv	a1,a4
     900:	853e                	mv	a0,a5
     902:	00000097          	auipc	ra,0x0
     906:	d86080e7          	jalr	-634(ra) # 688 <printint>
     90a:	aa89                	j	a5c <vprintf+0x23a>
      } else if(c == 'x') {
     90c:	fdc42783          	lw	a5,-36(s0)
     910:	0007871b          	sext.w	a4,a5
     914:	07800793          	li	a5,120
     918:	02f71463          	bne	a4,a5,940 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     91c:	fb843783          	ld	a5,-72(s0)
     920:	00878713          	addi	a4,a5,8
     924:	fae43c23          	sd	a4,-72(s0)
     928:	4398                	lw	a4,0(a5)
     92a:	fcc42783          	lw	a5,-52(s0)
     92e:	4681                	li	a3,0
     930:	4641                	li	a2,16
     932:	85ba                	mv	a1,a4
     934:	853e                	mv	a0,a5
     936:	00000097          	auipc	ra,0x0
     93a:	d52080e7          	jalr	-686(ra) # 688 <printint>
     93e:	aa39                	j	a5c <vprintf+0x23a>
      } else if(c == 'p') {
     940:	fdc42783          	lw	a5,-36(s0)
     944:	0007871b          	sext.w	a4,a5
     948:	07000793          	li	a5,112
     94c:	02f71263          	bne	a4,a5,970 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     950:	fb843783          	ld	a5,-72(s0)
     954:	00878713          	addi	a4,a5,8
     958:	fae43c23          	sd	a4,-72(s0)
     95c:	6398                	ld	a4,0(a5)
     95e:	fcc42783          	lw	a5,-52(s0)
     962:	85ba                	mv	a1,a4
     964:	853e                	mv	a0,a5
     966:	00000097          	auipc	ra,0x0
     96a:	e30080e7          	jalr	-464(ra) # 796 <printptr>
     96e:	a0fd                	j	a5c <vprintf+0x23a>
      } else if(c == 's'){
     970:	fdc42783          	lw	a5,-36(s0)
     974:	0007871b          	sext.w	a4,a5
     978:	07300793          	li	a5,115
     97c:	04f71c63          	bne	a4,a5,9d4 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     980:	fb843783          	ld	a5,-72(s0)
     984:	00878713          	addi	a4,a5,8
     988:	fae43c23          	sd	a4,-72(s0)
     98c:	639c                	ld	a5,0(a5)
     98e:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     992:	fe843783          	ld	a5,-24(s0)
     996:	eb8d                	bnez	a5,9c8 <vprintf+0x1a6>
          s = "(null)";
     998:	00002797          	auipc	a5,0x2
     99c:	9c078793          	addi	a5,a5,-1600 # 2358 <schedule_dm+0x244>
     9a0:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     9a4:	a015                	j	9c8 <vprintf+0x1a6>
          putc(fd, *s);
     9a6:	fe843783          	ld	a5,-24(s0)
     9aa:	0007c703          	lbu	a4,0(a5)
     9ae:	fcc42783          	lw	a5,-52(s0)
     9b2:	85ba                	mv	a1,a4
     9b4:	853e                	mv	a0,a5
     9b6:	00000097          	auipc	ra,0x0
     9ba:	c9c080e7          	jalr	-868(ra) # 652 <putc>
          s++;
     9be:	fe843783          	ld	a5,-24(s0)
     9c2:	0785                	addi	a5,a5,1
     9c4:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     9c8:	fe843783          	ld	a5,-24(s0)
     9cc:	0007c783          	lbu	a5,0(a5)
     9d0:	fbf9                	bnez	a5,9a6 <vprintf+0x184>
     9d2:	a069                	j	a5c <vprintf+0x23a>
        }
      } else if(c == 'c'){
     9d4:	fdc42783          	lw	a5,-36(s0)
     9d8:	0007871b          	sext.w	a4,a5
     9dc:	06300793          	li	a5,99
     9e0:	02f71463          	bne	a4,a5,a08 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     9e4:	fb843783          	ld	a5,-72(s0)
     9e8:	00878713          	addi	a4,a5,8
     9ec:	fae43c23          	sd	a4,-72(s0)
     9f0:	439c                	lw	a5,0(a5)
     9f2:	0ff7f713          	andi	a4,a5,255
     9f6:	fcc42783          	lw	a5,-52(s0)
     9fa:	85ba                	mv	a1,a4
     9fc:	853e                	mv	a0,a5
     9fe:	00000097          	auipc	ra,0x0
     a02:	c54080e7          	jalr	-940(ra) # 652 <putc>
     a06:	a899                	j	a5c <vprintf+0x23a>
      } else if(c == '%'){
     a08:	fdc42783          	lw	a5,-36(s0)
     a0c:	0007871b          	sext.w	a4,a5
     a10:	02500793          	li	a5,37
     a14:	00f71f63          	bne	a4,a5,a32 <vprintf+0x210>
        putc(fd, c);
     a18:	fdc42783          	lw	a5,-36(s0)
     a1c:	0ff7f713          	andi	a4,a5,255
     a20:	fcc42783          	lw	a5,-52(s0)
     a24:	85ba                	mv	a1,a4
     a26:	853e                	mv	a0,a5
     a28:	00000097          	auipc	ra,0x0
     a2c:	c2a080e7          	jalr	-982(ra) # 652 <putc>
     a30:	a035                	j	a5c <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     a32:	fcc42783          	lw	a5,-52(s0)
     a36:	02500593          	li	a1,37
     a3a:	853e                	mv	a0,a5
     a3c:	00000097          	auipc	ra,0x0
     a40:	c16080e7          	jalr	-1002(ra) # 652 <putc>
        putc(fd, c);
     a44:	fdc42783          	lw	a5,-36(s0)
     a48:	0ff7f713          	andi	a4,a5,255
     a4c:	fcc42783          	lw	a5,-52(s0)
     a50:	85ba                	mv	a1,a4
     a52:	853e                	mv	a0,a5
     a54:	00000097          	auipc	ra,0x0
     a58:	bfe080e7          	jalr	-1026(ra) # 652 <putc>
      }
      state = 0;
     a5c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a60:	fe442783          	lw	a5,-28(s0)
     a64:	2785                	addiw	a5,a5,1
     a66:	fef42223          	sw	a5,-28(s0)
     a6a:	fe442783          	lw	a5,-28(s0)
     a6e:	fc043703          	ld	a4,-64(s0)
     a72:	97ba                	add	a5,a5,a4
     a74:	0007c783          	lbu	a5,0(a5)
     a78:	dc0795e3          	bnez	a5,842 <vprintf+0x20>
    }
  }
}
     a7c:	0001                	nop
     a7e:	0001                	nop
     a80:	60a6                	ld	ra,72(sp)
     a82:	6406                	ld	s0,64(sp)
     a84:	6161                	addi	sp,sp,80
     a86:	8082                	ret

0000000000000a88 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a88:	7159                	addi	sp,sp,-112
     a8a:	fc06                	sd	ra,56(sp)
     a8c:	f822                	sd	s0,48(sp)
     a8e:	0080                	addi	s0,sp,64
     a90:	fcb43823          	sd	a1,-48(s0)
     a94:	e010                	sd	a2,0(s0)
     a96:	e414                	sd	a3,8(s0)
     a98:	e818                	sd	a4,16(s0)
     a9a:	ec1c                	sd	a5,24(s0)
     a9c:	03043023          	sd	a6,32(s0)
     aa0:	03143423          	sd	a7,40(s0)
     aa4:	87aa                	mv	a5,a0
     aa6:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     aaa:	03040793          	addi	a5,s0,48
     aae:	fcf43423          	sd	a5,-56(s0)
     ab2:	fc843783          	ld	a5,-56(s0)
     ab6:	fd078793          	addi	a5,a5,-48
     aba:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     abe:	fe843703          	ld	a4,-24(s0)
     ac2:	fdc42783          	lw	a5,-36(s0)
     ac6:	863a                	mv	a2,a4
     ac8:	fd043583          	ld	a1,-48(s0)
     acc:	853e                	mv	a0,a5
     ace:	00000097          	auipc	ra,0x0
     ad2:	d54080e7          	jalr	-684(ra) # 822 <vprintf>
}
     ad6:	0001                	nop
     ad8:	70e2                	ld	ra,56(sp)
     ada:	7442                	ld	s0,48(sp)
     adc:	6165                	addi	sp,sp,112
     ade:	8082                	ret

0000000000000ae0 <printf>:

void
printf(const char *fmt, ...)
{
     ae0:	7159                	addi	sp,sp,-112
     ae2:	f406                	sd	ra,40(sp)
     ae4:	f022                	sd	s0,32(sp)
     ae6:	1800                	addi	s0,sp,48
     ae8:	fca43c23          	sd	a0,-40(s0)
     aec:	e40c                	sd	a1,8(s0)
     aee:	e810                	sd	a2,16(s0)
     af0:	ec14                	sd	a3,24(s0)
     af2:	f018                	sd	a4,32(s0)
     af4:	f41c                	sd	a5,40(s0)
     af6:	03043823          	sd	a6,48(s0)
     afa:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     afe:	04040793          	addi	a5,s0,64
     b02:	fcf43823          	sd	a5,-48(s0)
     b06:	fd043783          	ld	a5,-48(s0)
     b0a:	fc878793          	addi	a5,a5,-56
     b0e:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     b12:	fe843783          	ld	a5,-24(s0)
     b16:	863e                	mv	a2,a5
     b18:	fd843583          	ld	a1,-40(s0)
     b1c:	4505                	li	a0,1
     b1e:	00000097          	auipc	ra,0x0
     b22:	d04080e7          	jalr	-764(ra) # 822 <vprintf>
}
     b26:	0001                	nop
     b28:	70a2                	ld	ra,40(sp)
     b2a:	7402                	ld	s0,32(sp)
     b2c:	6165                	addi	sp,sp,112
     b2e:	8082                	ret

0000000000000b30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     b30:	7179                	addi	sp,sp,-48
     b32:	f422                	sd	s0,40(sp)
     b34:	1800                	addi	s0,sp,48
     b36:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     b3a:	fd843783          	ld	a5,-40(s0)
     b3e:	17c1                	addi	a5,a5,-16
     b40:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b44:	00002797          	auipc	a5,0x2
     b48:	9b478793          	addi	a5,a5,-1612 # 24f8 <freep>
     b4c:	639c                	ld	a5,0(a5)
     b4e:	fef43423          	sd	a5,-24(s0)
     b52:	a815                	j	b86 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b54:	fe843783          	ld	a5,-24(s0)
     b58:	639c                	ld	a5,0(a5)
     b5a:	fe843703          	ld	a4,-24(s0)
     b5e:	00f76f63          	bltu	a4,a5,b7c <free+0x4c>
     b62:	fe043703          	ld	a4,-32(s0)
     b66:	fe843783          	ld	a5,-24(s0)
     b6a:	02e7eb63          	bltu	a5,a4,ba0 <free+0x70>
     b6e:	fe843783          	ld	a5,-24(s0)
     b72:	639c                	ld	a5,0(a5)
     b74:	fe043703          	ld	a4,-32(s0)
     b78:	02f76463          	bltu	a4,a5,ba0 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b7c:	fe843783          	ld	a5,-24(s0)
     b80:	639c                	ld	a5,0(a5)
     b82:	fef43423          	sd	a5,-24(s0)
     b86:	fe043703          	ld	a4,-32(s0)
     b8a:	fe843783          	ld	a5,-24(s0)
     b8e:	fce7f3e3          	bgeu	a5,a4,b54 <free+0x24>
     b92:	fe843783          	ld	a5,-24(s0)
     b96:	639c                	ld	a5,0(a5)
     b98:	fe043703          	ld	a4,-32(s0)
     b9c:	faf77ce3          	bgeu	a4,a5,b54 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     ba0:	fe043783          	ld	a5,-32(s0)
     ba4:	479c                	lw	a5,8(a5)
     ba6:	1782                	slli	a5,a5,0x20
     ba8:	9381                	srli	a5,a5,0x20
     baa:	0792                	slli	a5,a5,0x4
     bac:	fe043703          	ld	a4,-32(s0)
     bb0:	973e                	add	a4,a4,a5
     bb2:	fe843783          	ld	a5,-24(s0)
     bb6:	639c                	ld	a5,0(a5)
     bb8:	02f71763          	bne	a4,a5,be6 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     bbc:	fe043783          	ld	a5,-32(s0)
     bc0:	4798                	lw	a4,8(a5)
     bc2:	fe843783          	ld	a5,-24(s0)
     bc6:	639c                	ld	a5,0(a5)
     bc8:	479c                	lw	a5,8(a5)
     bca:	9fb9                	addw	a5,a5,a4
     bcc:	0007871b          	sext.w	a4,a5
     bd0:	fe043783          	ld	a5,-32(s0)
     bd4:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     bd6:	fe843783          	ld	a5,-24(s0)
     bda:	639c                	ld	a5,0(a5)
     bdc:	6398                	ld	a4,0(a5)
     bde:	fe043783          	ld	a5,-32(s0)
     be2:	e398                	sd	a4,0(a5)
     be4:	a039                	j	bf2 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     be6:	fe843783          	ld	a5,-24(s0)
     bea:	6398                	ld	a4,0(a5)
     bec:	fe043783          	ld	a5,-32(s0)
     bf0:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     bf2:	fe843783          	ld	a5,-24(s0)
     bf6:	479c                	lw	a5,8(a5)
     bf8:	1782                	slli	a5,a5,0x20
     bfa:	9381                	srli	a5,a5,0x20
     bfc:	0792                	slli	a5,a5,0x4
     bfe:	fe843703          	ld	a4,-24(s0)
     c02:	97ba                	add	a5,a5,a4
     c04:	fe043703          	ld	a4,-32(s0)
     c08:	02f71563          	bne	a4,a5,c32 <free+0x102>
    p->s.size += bp->s.size;
     c0c:	fe843783          	ld	a5,-24(s0)
     c10:	4798                	lw	a4,8(a5)
     c12:	fe043783          	ld	a5,-32(s0)
     c16:	479c                	lw	a5,8(a5)
     c18:	9fb9                	addw	a5,a5,a4
     c1a:	0007871b          	sext.w	a4,a5
     c1e:	fe843783          	ld	a5,-24(s0)
     c22:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     c24:	fe043783          	ld	a5,-32(s0)
     c28:	6398                	ld	a4,0(a5)
     c2a:	fe843783          	ld	a5,-24(s0)
     c2e:	e398                	sd	a4,0(a5)
     c30:	a031                	j	c3c <free+0x10c>
  } else
    p->s.ptr = bp;
     c32:	fe843783          	ld	a5,-24(s0)
     c36:	fe043703          	ld	a4,-32(s0)
     c3a:	e398                	sd	a4,0(a5)
  freep = p;
     c3c:	00002797          	auipc	a5,0x2
     c40:	8bc78793          	addi	a5,a5,-1860 # 24f8 <freep>
     c44:	fe843703          	ld	a4,-24(s0)
     c48:	e398                	sd	a4,0(a5)
}
     c4a:	0001                	nop
     c4c:	7422                	ld	s0,40(sp)
     c4e:	6145                	addi	sp,sp,48
     c50:	8082                	ret

0000000000000c52 <morecore>:

static Header*
morecore(uint nu)
{
     c52:	7179                	addi	sp,sp,-48
     c54:	f406                	sd	ra,40(sp)
     c56:	f022                	sd	s0,32(sp)
     c58:	1800                	addi	s0,sp,48
     c5a:	87aa                	mv	a5,a0
     c5c:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c60:	fdc42783          	lw	a5,-36(s0)
     c64:	0007871b          	sext.w	a4,a5
     c68:	6785                	lui	a5,0x1
     c6a:	00f77563          	bgeu	a4,a5,c74 <morecore+0x22>
    nu = 4096;
     c6e:	6785                	lui	a5,0x1
     c70:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c74:	fdc42783          	lw	a5,-36(s0)
     c78:	0047979b          	slliw	a5,a5,0x4
     c7c:	2781                	sext.w	a5,a5
     c7e:	2781                	sext.w	a5,a5
     c80:	853e                	mv	a0,a5
     c82:	00000097          	auipc	ra,0x0
     c86:	9a0080e7          	jalr	-1632(ra) # 622 <sbrk>
     c8a:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c8e:	fe843703          	ld	a4,-24(s0)
     c92:	57fd                	li	a5,-1
     c94:	00f71463          	bne	a4,a5,c9c <morecore+0x4a>
    return 0;
     c98:	4781                	li	a5,0
     c9a:	a03d                	j	cc8 <morecore+0x76>
  hp = (Header*)p;
     c9c:	fe843783          	ld	a5,-24(s0)
     ca0:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     ca4:	fe043783          	ld	a5,-32(s0)
     ca8:	fdc42703          	lw	a4,-36(s0)
     cac:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     cae:	fe043783          	ld	a5,-32(s0)
     cb2:	07c1                	addi	a5,a5,16
     cb4:	853e                	mv	a0,a5
     cb6:	00000097          	auipc	ra,0x0
     cba:	e7a080e7          	jalr	-390(ra) # b30 <free>
  return freep;
     cbe:	00002797          	auipc	a5,0x2
     cc2:	83a78793          	addi	a5,a5,-1990 # 24f8 <freep>
     cc6:	639c                	ld	a5,0(a5)
}
     cc8:	853e                	mv	a0,a5
     cca:	70a2                	ld	ra,40(sp)
     ccc:	7402                	ld	s0,32(sp)
     cce:	6145                	addi	sp,sp,48
     cd0:	8082                	ret

0000000000000cd2 <malloc>:

void*
malloc(uint nbytes)
{
     cd2:	7139                	addi	sp,sp,-64
     cd4:	fc06                	sd	ra,56(sp)
     cd6:	f822                	sd	s0,48(sp)
     cd8:	0080                	addi	s0,sp,64
     cda:	87aa                	mv	a5,a0
     cdc:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     ce0:	fcc46783          	lwu	a5,-52(s0)
     ce4:	07bd                	addi	a5,a5,15
     ce6:	8391                	srli	a5,a5,0x4
     ce8:	2781                	sext.w	a5,a5
     cea:	2785                	addiw	a5,a5,1
     cec:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     cf0:	00002797          	auipc	a5,0x2
     cf4:	80878793          	addi	a5,a5,-2040 # 24f8 <freep>
     cf8:	639c                	ld	a5,0(a5)
     cfa:	fef43023          	sd	a5,-32(s0)
     cfe:	fe043783          	ld	a5,-32(s0)
     d02:	ef95                	bnez	a5,d3e <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     d04:	00001797          	auipc	a5,0x1
     d08:	7e478793          	addi	a5,a5,2020 # 24e8 <base>
     d0c:	fef43023          	sd	a5,-32(s0)
     d10:	00001797          	auipc	a5,0x1
     d14:	7e878793          	addi	a5,a5,2024 # 24f8 <freep>
     d18:	fe043703          	ld	a4,-32(s0)
     d1c:	e398                	sd	a4,0(a5)
     d1e:	00001797          	auipc	a5,0x1
     d22:	7da78793          	addi	a5,a5,2010 # 24f8 <freep>
     d26:	6398                	ld	a4,0(a5)
     d28:	00001797          	auipc	a5,0x1
     d2c:	7c078793          	addi	a5,a5,1984 # 24e8 <base>
     d30:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     d32:	00001797          	auipc	a5,0x1
     d36:	7b678793          	addi	a5,a5,1974 # 24e8 <base>
     d3a:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d3e:	fe043783          	ld	a5,-32(s0)
     d42:	639c                	ld	a5,0(a5)
     d44:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d48:	fe843783          	ld	a5,-24(s0)
     d4c:	4798                	lw	a4,8(a5)
     d4e:	fdc42783          	lw	a5,-36(s0)
     d52:	2781                	sext.w	a5,a5
     d54:	06f76863          	bltu	a4,a5,dc4 <malloc+0xf2>
      if(p->s.size == nunits)
     d58:	fe843783          	ld	a5,-24(s0)
     d5c:	4798                	lw	a4,8(a5)
     d5e:	fdc42783          	lw	a5,-36(s0)
     d62:	2781                	sext.w	a5,a5
     d64:	00e79963          	bne	a5,a4,d76 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d68:	fe843783          	ld	a5,-24(s0)
     d6c:	6398                	ld	a4,0(a5)
     d6e:	fe043783          	ld	a5,-32(s0)
     d72:	e398                	sd	a4,0(a5)
     d74:	a82d                	j	dae <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d76:	fe843783          	ld	a5,-24(s0)
     d7a:	4798                	lw	a4,8(a5)
     d7c:	fdc42783          	lw	a5,-36(s0)
     d80:	40f707bb          	subw	a5,a4,a5
     d84:	0007871b          	sext.w	a4,a5
     d88:	fe843783          	ld	a5,-24(s0)
     d8c:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d8e:	fe843783          	ld	a5,-24(s0)
     d92:	479c                	lw	a5,8(a5)
     d94:	1782                	slli	a5,a5,0x20
     d96:	9381                	srli	a5,a5,0x20
     d98:	0792                	slli	a5,a5,0x4
     d9a:	fe843703          	ld	a4,-24(s0)
     d9e:	97ba                	add	a5,a5,a4
     da0:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     da4:	fe843783          	ld	a5,-24(s0)
     da8:	fdc42703          	lw	a4,-36(s0)
     dac:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     dae:	00001797          	auipc	a5,0x1
     db2:	74a78793          	addi	a5,a5,1866 # 24f8 <freep>
     db6:	fe043703          	ld	a4,-32(s0)
     dba:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     dbc:	fe843783          	ld	a5,-24(s0)
     dc0:	07c1                	addi	a5,a5,16
     dc2:	a091                	j	e06 <malloc+0x134>
    }
    if(p == freep)
     dc4:	00001797          	auipc	a5,0x1
     dc8:	73478793          	addi	a5,a5,1844 # 24f8 <freep>
     dcc:	639c                	ld	a5,0(a5)
     dce:	fe843703          	ld	a4,-24(s0)
     dd2:	02f71063          	bne	a4,a5,df2 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     dd6:	fdc42783          	lw	a5,-36(s0)
     dda:	853e                	mv	a0,a5
     ddc:	00000097          	auipc	ra,0x0
     de0:	e76080e7          	jalr	-394(ra) # c52 <morecore>
     de4:	fea43423          	sd	a0,-24(s0)
     de8:	fe843783          	ld	a5,-24(s0)
     dec:	e399                	bnez	a5,df2 <malloc+0x120>
        return 0;
     dee:	4781                	li	a5,0
     df0:	a819                	j	e06 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     df2:	fe843783          	ld	a5,-24(s0)
     df6:	fef43023          	sd	a5,-32(s0)
     dfa:	fe843783          	ld	a5,-24(s0)
     dfe:	639c                	ld	a5,0(a5)
     e00:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     e04:	b791                	j	d48 <malloc+0x76>
  }
}
     e06:	853e                	mv	a0,a5
     e08:	70e2                	ld	ra,56(sp)
     e0a:	7442                	ld	s0,48(sp)
     e0c:	6121                	addi	sp,sp,64
     e0e:	8082                	ret

0000000000000e10 <setjmp>:
     e10:	e100                	sd	s0,0(a0)
     e12:	e504                	sd	s1,8(a0)
     e14:	01253823          	sd	s2,16(a0)
     e18:	01353c23          	sd	s3,24(a0)
     e1c:	03453023          	sd	s4,32(a0)
     e20:	03553423          	sd	s5,40(a0)
     e24:	03653823          	sd	s6,48(a0)
     e28:	03753c23          	sd	s7,56(a0)
     e2c:	05853023          	sd	s8,64(a0)
     e30:	05953423          	sd	s9,72(a0)
     e34:	05a53823          	sd	s10,80(a0)
     e38:	05b53c23          	sd	s11,88(a0)
     e3c:	06153023          	sd	ra,96(a0)
     e40:	06253423          	sd	sp,104(a0)
     e44:	4501                	li	a0,0
     e46:	8082                	ret

0000000000000e48 <longjmp>:
     e48:	6100                	ld	s0,0(a0)
     e4a:	6504                	ld	s1,8(a0)
     e4c:	01053903          	ld	s2,16(a0)
     e50:	01853983          	ld	s3,24(a0)
     e54:	02053a03          	ld	s4,32(a0)
     e58:	02853a83          	ld	s5,40(a0)
     e5c:	03053b03          	ld	s6,48(a0)
     e60:	03853b83          	ld	s7,56(a0)
     e64:	04053c03          	ld	s8,64(a0)
     e68:	04853c83          	ld	s9,72(a0)
     e6c:	05053d03          	ld	s10,80(a0)
     e70:	05853d83          	ld	s11,88(a0)
     e74:	06053083          	ld	ra,96(a0)
     e78:	06853103          	ld	sp,104(a0)
     e7c:	c199                	beqz	a1,e82 <longjmp_1>
     e7e:	852e                	mv	a0,a1
     e80:	8082                	ret

0000000000000e82 <longjmp_1>:
     e82:	4505                	li	a0,1
     e84:	8082                	ret

0000000000000e86 <__list_add>:
 * the prev/next entries already!
 */
static inline void __list_add(struct list_head *new_entry,
                              struct list_head *prev,
                              struct list_head *next)
{
     e86:	7179                	addi	sp,sp,-48
     e88:	f422                	sd	s0,40(sp)
     e8a:	1800                	addi	s0,sp,48
     e8c:	fea43423          	sd	a0,-24(s0)
     e90:	feb43023          	sd	a1,-32(s0)
     e94:	fcc43c23          	sd	a2,-40(s0)
    next->prev = new_entry;
     e98:	fd843783          	ld	a5,-40(s0)
     e9c:	fe843703          	ld	a4,-24(s0)
     ea0:	e798                	sd	a4,8(a5)
    new_entry->next = next;
     ea2:	fe843783          	ld	a5,-24(s0)
     ea6:	fd843703          	ld	a4,-40(s0)
     eaa:	e398                	sd	a4,0(a5)
    new_entry->prev = prev;
     eac:	fe843783          	ld	a5,-24(s0)
     eb0:	fe043703          	ld	a4,-32(s0)
     eb4:	e798                	sd	a4,8(a5)
    prev->next = new_entry;
     eb6:	fe043783          	ld	a5,-32(s0)
     eba:	fe843703          	ld	a4,-24(s0)
     ebe:	e398                	sd	a4,0(a5)
}
     ec0:	0001                	nop
     ec2:	7422                	ld	s0,40(sp)
     ec4:	6145                	addi	sp,sp,48
     ec6:	8082                	ret

0000000000000ec8 <list_add_tail>:
 *
 * Insert a new entry before the specified head.
 * This is useful for implementing queues.
 */
static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
{
     ec8:	1101                	addi	sp,sp,-32
     eca:	ec06                	sd	ra,24(sp)
     ecc:	e822                	sd	s0,16(sp)
     ece:	1000                	addi	s0,sp,32
     ed0:	fea43423          	sd	a0,-24(s0)
     ed4:	feb43023          	sd	a1,-32(s0)
    __list_add(new_entry, head->prev, head);
     ed8:	fe043783          	ld	a5,-32(s0)
     edc:	679c                	ld	a5,8(a5)
     ede:	fe043603          	ld	a2,-32(s0)
     ee2:	85be                	mv	a1,a5
     ee4:	fe843503          	ld	a0,-24(s0)
     ee8:	00000097          	auipc	ra,0x0
     eec:	f9e080e7          	jalr	-98(ra) # e86 <__list_add>
}
     ef0:	0001                	nop
     ef2:	60e2                	ld	ra,24(sp)
     ef4:	6442                	ld	s0,16(sp)
     ef6:	6105                	addi	sp,sp,32
     ef8:	8082                	ret

0000000000000efa <__list_del>:
 *
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head *prev, struct list_head *next)
{
     efa:	1101                	addi	sp,sp,-32
     efc:	ec22                	sd	s0,24(sp)
     efe:	1000                	addi	s0,sp,32
     f00:	fea43423          	sd	a0,-24(s0)
     f04:	feb43023          	sd	a1,-32(s0)
    next->prev = prev;
     f08:	fe043783          	ld	a5,-32(s0)
     f0c:	fe843703          	ld	a4,-24(s0)
     f10:	e798                	sd	a4,8(a5)
    prev->next = next;
     f12:	fe843783          	ld	a5,-24(s0)
     f16:	fe043703          	ld	a4,-32(s0)
     f1a:	e398                	sd	a4,0(a5)
}
     f1c:	0001                	nop
     f1e:	6462                	ld	s0,24(sp)
     f20:	6105                	addi	sp,sp,32
     f22:	8082                	ret

0000000000000f24 <list_del>:
 * @entry: the element to delete from the list.
 * Note: list_empty on entry does not return true after this, the entry is
 * in an undefined state.
 */
static inline void list_del(struct list_head *entry)
{
     f24:	1101                	addi	sp,sp,-32
     f26:	ec06                	sd	ra,24(sp)
     f28:	e822                	sd	s0,16(sp)
     f2a:	1000                	addi	s0,sp,32
     f2c:	fea43423          	sd	a0,-24(s0)
    __list_del(entry->prev, entry->next);
     f30:	fe843783          	ld	a5,-24(s0)
     f34:	6798                	ld	a4,8(a5)
     f36:	fe843783          	ld	a5,-24(s0)
     f3a:	639c                	ld	a5,0(a5)
     f3c:	85be                	mv	a1,a5
     f3e:	853a                	mv	a0,a4
     f40:	00000097          	auipc	ra,0x0
     f44:	fba080e7          	jalr	-70(ra) # efa <__list_del>
    entry->next = LIST_POISON1;
     f48:	fe843783          	ld	a5,-24(s0)
     f4c:	00100737          	lui	a4,0x100
     f50:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd460>
     f54:	e398                	sd	a4,0(a5)
    entry->prev = LIST_POISON2;
     f56:	fe843783          	ld	a5,-24(s0)
     f5a:	00200737          	lui	a4,0x200
     f5e:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd560>
     f62:	e798                	sd	a4,8(a5)
}
     f64:	0001                	nop
     f66:	60e2                	ld	ra,24(sp)
     f68:	6442                	ld	s0,16(sp)
     f6a:	6105                	addi	sp,sp,32
     f6c:	8082                	ret

0000000000000f6e <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
     f6e:	1101                	addi	sp,sp,-32
     f70:	ec22                	sd	s0,24(sp)
     f72:	1000                	addi	s0,sp,32
     f74:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
     f78:	fe843783          	ld	a5,-24(s0)
     f7c:	639c                	ld	a5,0(a5)
     f7e:	fe843703          	ld	a4,-24(s0)
     f82:	40f707b3          	sub	a5,a4,a5
     f86:	0017b793          	seqz	a5,a5
     f8a:	0ff7f793          	andi	a5,a5,255
     f8e:	2781                	sext.w	a5,a5
}
     f90:	853e                	mv	a0,a5
     f92:	6462                	ld	s0,24(sp)
     f94:	6105                	addi	sp,sp,32
     f96:	8082                	ret

0000000000000f98 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     f98:	715d                	addi	sp,sp,-80
     f9a:	e486                	sd	ra,72(sp)
     f9c:	e0a2                	sd	s0,64(sp)
     f9e:	0880                	addi	s0,sp,80
     fa0:	fca43423          	sd	a0,-56(s0)
     fa4:	fcb43023          	sd	a1,-64(s0)
     fa8:	85b2                	mv	a1,a2
     faa:	8636                	mv	a2,a3
     fac:	86ba                	mv	a3,a4
     fae:	873e                	mv	a4,a5
     fb0:	87ae                	mv	a5,a1
     fb2:	faf42e23          	sw	a5,-68(s0)
     fb6:	87b2                	mv	a5,a2
     fb8:	faf42c23          	sw	a5,-72(s0)
     fbc:	87b6                	mv	a5,a3
     fbe:	faf42a23          	sw	a5,-76(s0)
     fc2:	87ba                	mv	a5,a4
     fc4:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     fc8:	06000513          	li	a0,96
     fcc:	00000097          	auipc	ra,0x0
     fd0:	d06080e7          	jalr	-762(ra) # cd2 <malloc>
     fd4:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     fd8:	6505                	lui	a0,0x1
     fda:	00000097          	auipc	ra,0x0
     fde:	cf8080e7          	jalr	-776(ra) # cd2 <malloc>
     fe2:	87aa                	mv	a5,a0
     fe4:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     fe8:	fe043703          	ld	a4,-32(s0)
     fec:	6785                	lui	a5,0x1
     fee:	17c1                	addi	a5,a5,-16
     ff0:	97ba                	add	a5,a5,a4
     ff2:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     ff6:	fe843783          	ld	a5,-24(s0)
     ffa:	fc843703          	ld	a4,-56(s0)
     ffe:	e398                	sd	a4,0(a5)
    t->arg = arg;
    1000:	fe843783          	ld	a5,-24(s0)
    1004:	fc043703          	ld	a4,-64(s0)
    1008:	e798                	sd	a4,8(a5)
    t->ID = _id++;
    100a:	00001797          	auipc	a5,0x1
    100e:	4d278793          	addi	a5,a5,1234 # 24dc <_id.1229>
    1012:	439c                	lw	a5,0(a5)
    1014:	0017871b          	addiw	a4,a5,1
    1018:	0007069b          	sext.w	a3,a4
    101c:	00001717          	auipc	a4,0x1
    1020:	4c070713          	addi	a4,a4,1216 # 24dc <_id.1229>
    1024:	c314                	sw	a3,0(a4)
    1026:	fe843703          	ld	a4,-24(s0)
    102a:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    102c:	fe843783          	ld	a5,-24(s0)
    1030:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    1034:	fe043703          	ld	a4,-32(s0)
    1038:	fe843783          	ld	a5,-24(s0)
    103c:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    103e:	fd843703          	ld	a4,-40(s0)
    1042:	fe843783          	ld	a5,-24(s0)
    1046:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    1048:	fe843783          	ld	a5,-24(s0)
    104c:	fb842703          	lw	a4,-72(s0)
    1050:	c3f8                	sw	a4,68(a5)
    t->period = period;
    1052:	fe843783          	ld	a5,-24(s0)
    1056:	fb442703          	lw	a4,-76(s0)
    105a:	cbb8                	sw	a4,80(a5)
    t->deadline = period;
    105c:	fe843783          	ld	a5,-24(s0)
    1060:	fb442703          	lw	a4,-76(s0)
    1064:	c7f8                	sw	a4,76(a5)
    t->n = n;
    1066:	fe843783          	ld	a5,-24(s0)
    106a:	fb042703          	lw	a4,-80(s0)
    106e:	cbf8                	sw	a4,84(a5)
    t->is_real_time = is_real_time;
    1070:	fe843783          	ld	a5,-24(s0)
    1074:	fbc42703          	lw	a4,-68(s0)
    1078:	c3b8                	sw	a4,64(a5)
    t->weight = 1;
    107a:	fe843783          	ld	a5,-24(s0)
    107e:	4705                	li	a4,1
    1080:	c7b8                	sw	a4,72(a5)
    t->remaining_time = processing_time;
    1082:	fe843783          	ld	a5,-24(s0)
    1086:	fb842703          	lw	a4,-72(s0)
    108a:	cfb8                	sw	a4,88(a5)
    t->current_deadline = 0;
    108c:	fe843783          	ld	a5,-24(s0)
    1090:	0407ae23          	sw	zero,92(a5)
    return t;
    1094:	fe843783          	ld	a5,-24(s0)
}
    1098:	853e                	mv	a0,a5
    109a:	60a6                	ld	ra,72(sp)
    109c:	6406                	ld	s0,64(sp)
    109e:	6161                	addi	sp,sp,80
    10a0:	8082                	ret

00000000000010a2 <thread_set_weight>:

void thread_set_weight(struct thread *t, int weight)
{
    10a2:	1101                	addi	sp,sp,-32
    10a4:	ec22                	sd	s0,24(sp)
    10a6:	1000                	addi	s0,sp,32
    10a8:	fea43423          	sd	a0,-24(s0)
    10ac:	87ae                	mv	a5,a1
    10ae:	fef42223          	sw	a5,-28(s0)
    t->weight = weight;
    10b2:	fe843783          	ld	a5,-24(s0)
    10b6:	fe442703          	lw	a4,-28(s0)
    10ba:	c7b8                	sw	a4,72(a5)
}
    10bc:	0001                	nop
    10be:	6462                	ld	s0,24(sp)
    10c0:	6105                	addi	sp,sp,32
    10c2:	8082                	ret

00000000000010c4 <thread_add_at>:

void thread_add_at(struct thread *t, int arrival_time)
{
    10c4:	7179                	addi	sp,sp,-48
    10c6:	f406                	sd	ra,40(sp)
    10c8:	f022                	sd	s0,32(sp)
    10ca:	1800                	addi	s0,sp,48
    10cc:	fca43c23          	sd	a0,-40(s0)
    10d0:	87ae                	mv	a5,a1
    10d2:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    10d6:	02000513          	li	a0,32
    10da:	00000097          	auipc	ra,0x0
    10de:	bf8080e7          	jalr	-1032(ra) # cd2 <malloc>
    10e2:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    10e6:	fe843783          	ld	a5,-24(s0)
    10ea:	fd843703          	ld	a4,-40(s0)
    10ee:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    10f0:	fe843783          	ld	a5,-24(s0)
    10f4:	fd442703          	lw	a4,-44(s0)
    10f8:	cf98                	sw	a4,24(a5)
    if (t->is_real_time) {
    10fa:	fd843783          	ld	a5,-40(s0)
    10fe:	43bc                	lw	a5,64(a5)
    1100:	c38d                	beqz	a5,1122 <thread_add_at+0x5e>
        t->current_deadline = arrival_time;
    1102:	fd843783          	ld	a5,-40(s0)
    1106:	fd442703          	lw	a4,-44(s0)
    110a:	cff8                	sw	a4,92(a5)
        t->current_deadline = arrival_time + t->deadline;
    110c:	fd843783          	ld	a5,-40(s0)
    1110:	47fc                	lw	a5,76(a5)
    1112:	fd442703          	lw	a4,-44(s0)
    1116:	9fb9                	addw	a5,a5,a4
    1118:	0007871b          	sext.w	a4,a5
    111c:	fd843783          	ld	a5,-40(s0)
    1120:	cff8                	sw	a4,92(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1122:	fe843783          	ld	a5,-24(s0)
    1126:	07a1                	addi	a5,a5,8
    1128:	00001597          	auipc	a1,0x1
    112c:	3a058593          	addi	a1,a1,928 # 24c8 <release_queue>
    1130:	853e                	mv	a0,a5
    1132:	00000097          	auipc	ra,0x0
    1136:	d96080e7          	jalr	-618(ra) # ec8 <list_add_tail>
}
    113a:	0001                	nop
    113c:	70a2                	ld	ra,40(sp)
    113e:	7402                	ld	s0,32(sp)
    1140:	6145                	addi	sp,sp,48
    1142:	8082                	ret

0000000000001144 <__release>:

void __release()
{
    1144:	7139                	addi	sp,sp,-64
    1146:	fc06                	sd	ra,56(sp)
    1148:	f822                	sd	s0,48(sp)
    114a:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    114c:	00001797          	auipc	a5,0x1
    1150:	37c78793          	addi	a5,a5,892 # 24c8 <release_queue>
    1154:	639c                	ld	a5,0(a5)
    1156:	fcf43c23          	sd	a5,-40(s0)
    115a:	fd843783          	ld	a5,-40(s0)
    115e:	17e1                	addi	a5,a5,-8
    1160:	fef43423          	sd	a5,-24(s0)
    1164:	fe843783          	ld	a5,-24(s0)
    1168:	679c                	ld	a5,8(a5)
    116a:	fcf43823          	sd	a5,-48(s0)
    116e:	fd043783          	ld	a5,-48(s0)
    1172:	17e1                	addi	a5,a5,-8
    1174:	fef43023          	sd	a5,-32(s0)
    1178:	a851                	j	120c <__release+0xc8>
        if (threading_system_time >= cur->release_time) {
    117a:	fe843783          	ld	a5,-24(s0)
    117e:	4f98                	lw	a4,24(a5)
    1180:	00001797          	auipc	a5,0x1
    1184:	38878793          	addi	a5,a5,904 # 2508 <threading_system_time>
    1188:	439c                	lw	a5,0(a5)
    118a:	06e7c363          	blt	a5,a4,11f0 <__release+0xac>
            cur->thrd->remaining_time = cur->thrd->processing_time;
    118e:	fe843783          	ld	a5,-24(s0)
    1192:	6398                	ld	a4,0(a5)
    1194:	fe843783          	ld	a5,-24(s0)
    1198:	639c                	ld	a5,0(a5)
    119a:	4378                	lw	a4,68(a4)
    119c:	cfb8                	sw	a4,88(a5)
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    119e:	fe843783          	ld	a5,-24(s0)
    11a2:	4f94                	lw	a3,24(a5)
    11a4:	fe843783          	ld	a5,-24(s0)
    11a8:	639c                	ld	a5,0(a5)
    11aa:	47f8                	lw	a4,76(a5)
    11ac:	fe843783          	ld	a5,-24(s0)
    11b0:	639c                	ld	a5,0(a5)
    11b2:	9f35                	addw	a4,a4,a3
    11b4:	2701                	sext.w	a4,a4
    11b6:	cff8                	sw	a4,92(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    11b8:	fe843783          	ld	a5,-24(s0)
    11bc:	639c                	ld	a5,0(a5)
    11be:	02878793          	addi	a5,a5,40
    11c2:	00001597          	auipc	a1,0x1
    11c6:	2f658593          	addi	a1,a1,758 # 24b8 <run_queue>
    11ca:	853e                	mv	a0,a5
    11cc:	00000097          	auipc	ra,0x0
    11d0:	cfc080e7          	jalr	-772(ra) # ec8 <list_add_tail>
            list_del(&cur->thread_list);
    11d4:	fe843783          	ld	a5,-24(s0)
    11d8:	07a1                	addi	a5,a5,8
    11da:	853e                	mv	a0,a5
    11dc:	00000097          	auipc	ra,0x0
    11e0:	d48080e7          	jalr	-696(ra) # f24 <list_del>
            free(cur);
    11e4:	fe843503          	ld	a0,-24(s0)
    11e8:	00000097          	auipc	ra,0x0
    11ec:	948080e7          	jalr	-1720(ra) # b30 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    11f0:	fe043783          	ld	a5,-32(s0)
    11f4:	fef43423          	sd	a5,-24(s0)
    11f8:	fe043783          	ld	a5,-32(s0)
    11fc:	679c                	ld	a5,8(a5)
    11fe:	fcf43423          	sd	a5,-56(s0)
    1202:	fc843783          	ld	a5,-56(s0)
    1206:	17e1                	addi	a5,a5,-8
    1208:	fef43023          	sd	a5,-32(s0)
    120c:	fe843783          	ld	a5,-24(s0)
    1210:	00878713          	addi	a4,a5,8
    1214:	00001797          	auipc	a5,0x1
    1218:	2b478793          	addi	a5,a5,692 # 24c8 <release_queue>
    121c:	f4f71fe3          	bne	a4,a5,117a <__release+0x36>
        }
    }
}
    1220:	0001                	nop
    1222:	0001                	nop
    1224:	70e2                	ld	ra,56(sp)
    1226:	7442                	ld	s0,48(sp)
    1228:	6121                	addi	sp,sp,64
    122a:	8082                	ret

000000000000122c <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    122c:	1101                	addi	sp,sp,-32
    122e:	ec06                	sd	ra,24(sp)
    1230:	e822                	sd	s0,16(sp)
    1232:	1000                	addi	s0,sp,32
    1234:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    1238:	fe843783          	ld	a5,-24(s0)
    123c:	7b98                	ld	a4,48(a5)
    123e:	00001797          	auipc	a5,0x1
    1242:	2c278793          	addi	a5,a5,706 # 2500 <current>
    1246:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    1248:	fe843783          	ld	a5,-24(s0)
    124c:	02878793          	addi	a5,a5,40
    1250:	853e                	mv	a0,a5
    1252:	00000097          	auipc	ra,0x0
    1256:	cd2080e7          	jalr	-814(ra) # f24 <list_del>

    free(to_remove->stack);
    125a:	fe843783          	ld	a5,-24(s0)
    125e:	6b9c                	ld	a5,16(a5)
    1260:	853e                	mv	a0,a5
    1262:	00000097          	auipc	ra,0x0
    1266:	8ce080e7          	jalr	-1842(ra) # b30 <free>
    free(to_remove);
    126a:	fe843503          	ld	a0,-24(s0)
    126e:	00000097          	auipc	ra,0x0
    1272:	8c2080e7          	jalr	-1854(ra) # b30 <free>

    __schedule();
    1276:	00000097          	auipc	ra,0x0
    127a:	572080e7          	jalr	1394(ra) # 17e8 <__schedule>
    __dispatch();
    127e:	00000097          	auipc	ra,0x0
    1282:	3da080e7          	jalr	986(ra) # 1658 <__dispatch>
    thrdresume(main_thrd_id);
    1286:	00001797          	auipc	a5,0x1
    128a:	25278793          	addi	a5,a5,594 # 24d8 <main_thrd_id>
    128e:	439c                	lw	a5,0(a5)
    1290:	853e                	mv	a0,a5
    1292:	fffff097          	auipc	ra,0xfffff
    1296:	3b0080e7          	jalr	944(ra) # 642 <thrdresume>
}
    129a:	0001                	nop
    129c:	60e2                	ld	ra,24(sp)
    129e:	6442                	ld	s0,16(sp)
    12a0:	6105                	addi	sp,sp,32
    12a2:	8082                	ret

00000000000012a4 <thread_exit>:

void thread_exit(void)
{
    12a4:	7179                	addi	sp,sp,-48
    12a6:	f406                	sd	ra,40(sp)
    12a8:	f022                	sd	s0,32(sp)
    12aa:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    12ac:	00001797          	auipc	a5,0x1
    12b0:	25478793          	addi	a5,a5,596 # 2500 <current>
    12b4:	6398                	ld	a4,0(a5)
    12b6:	00001797          	auipc	a5,0x1
    12ba:	20278793          	addi	a5,a5,514 # 24b8 <run_queue>
    12be:	02f71063          	bne	a4,a5,12de <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    12c2:	00001597          	auipc	a1,0x1
    12c6:	09e58593          	addi	a1,a1,158 # 2360 <schedule_dm+0x24c>
    12ca:	4509                	li	a0,2
    12cc:	fffff097          	auipc	ra,0xfffff
    12d0:	7bc080e7          	jalr	1980(ra) # a88 <fprintf>
        exit(1);
    12d4:	4505                	li	a0,1
    12d6:	fffff097          	auipc	ra,0xfffff
    12da:	2c4080e7          	jalr	708(ra) # 59a <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    12de:	00001797          	auipc	a5,0x1
    12e2:	22278793          	addi	a5,a5,546 # 2500 <current>
    12e6:	639c                	ld	a5,0(a5)
    12e8:	fef43423          	sd	a5,-24(s0)
    12ec:	fe843783          	ld	a5,-24(s0)
    12f0:	fd878793          	addi	a5,a5,-40
    12f4:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    12f8:	fe043783          	ld	a5,-32(s0)
    12fc:	5f9c                	lw	a5,56(a5)
    12fe:	4585                	li	a1,1
    1300:	853e                	mv	a0,a5
    1302:	fffff097          	auipc	ra,0xfffff
    1306:	348080e7          	jalr	840(ra) # 64a <cancelthrdstop>
    130a:	87aa                	mv	a5,a0
    130c:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    1310:	00001797          	auipc	a5,0x1
    1314:	1f878793          	addi	a5,a5,504 # 2508 <threading_system_time>
    1318:	439c                	lw	a5,0(a5)
    131a:	fdc42703          	lw	a4,-36(s0)
    131e:	9fb9                	addw	a5,a5,a4
    1320:	0007871b          	sext.w	a4,a5
    1324:	00001797          	auipc	a5,0x1
    1328:	1e478793          	addi	a5,a5,484 # 2508 <threading_system_time>
    132c:	c398                	sw	a4,0(a5)

    __release();
    132e:	00000097          	auipc	ra,0x0
    1332:	e16080e7          	jalr	-490(ra) # 1144 <__release>
    __thread_exit(to_remove);
    1336:	fe043503          	ld	a0,-32(s0)
    133a:	00000097          	auipc	ra,0x0
    133e:	ef2080e7          	jalr	-270(ra) # 122c <__thread_exit>
}
    1342:	0001                	nop
    1344:	70a2                	ld	ra,40(sp)
    1346:	7402                	ld	s0,32(sp)
    1348:	6145                	addi	sp,sp,48
    134a:	8082                	ret

000000000000134c <__finish_current>:

void __finish_current()
{
    134c:	7179                	addi	sp,sp,-48
    134e:	f406                	sd	ra,40(sp)
    1350:	f022                	sd	s0,32(sp)
    1352:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1354:	00001797          	auipc	a5,0x1
    1358:	1ac78793          	addi	a5,a5,428 # 2500 <current>
    135c:	639c                	ld	a5,0(a5)
    135e:	fef43423          	sd	a5,-24(s0)
    1362:	fe843783          	ld	a5,-24(s0)
    1366:	fd878793          	addi	a5,a5,-40
    136a:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    136e:	fe043783          	ld	a5,-32(s0)
    1372:	4bfc                	lw	a5,84(a5)
    1374:	37fd                	addiw	a5,a5,-1
    1376:	0007871b          	sext.w	a4,a5
    137a:	fe043783          	ld	a5,-32(s0)
    137e:	cbf8                	sw	a4,84(a5)

    printf("thread#%d finish at %d\n",
    1380:	fe043783          	ld	a5,-32(s0)
    1384:	5fd8                	lw	a4,60(a5)
    1386:	00001797          	auipc	a5,0x1
    138a:	18278793          	addi	a5,a5,386 # 2508 <threading_system_time>
    138e:	4390                	lw	a2,0(a5)
    1390:	fe043783          	ld	a5,-32(s0)
    1394:	4bfc                	lw	a5,84(a5)
    1396:	86be                	mv	a3,a5
    1398:	85ba                	mv	a1,a4
    139a:	00001517          	auipc	a0,0x1
    139e:	ffe50513          	addi	a0,a0,-2 # 2398 <schedule_dm+0x284>
    13a2:	fffff097          	auipc	ra,0xfffff
    13a6:	73e080e7          	jalr	1854(ra) # ae0 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    13aa:	fe043783          	ld	a5,-32(s0)
    13ae:	4bfc                	lw	a5,84(a5)
    13b0:	04f05563          	blez	a5,13fa <__finish_current+0xae>
        struct list_head *to_remove = current;
    13b4:	00001797          	auipc	a5,0x1
    13b8:	14c78793          	addi	a5,a5,332 # 2500 <current>
    13bc:	639c                	ld	a5,0(a5)
    13be:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    13c2:	00001797          	auipc	a5,0x1
    13c6:	13e78793          	addi	a5,a5,318 # 2500 <current>
    13ca:	639c                	ld	a5,0(a5)
    13cc:	6798                	ld	a4,8(a5)
    13ce:	00001797          	auipc	a5,0x1
    13d2:	13278793          	addi	a5,a5,306 # 2500 <current>
    13d6:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    13d8:	fd843503          	ld	a0,-40(s0)
    13dc:	00000097          	auipc	ra,0x0
    13e0:	b48080e7          	jalr	-1208(ra) # f24 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    13e4:	fe043783          	ld	a5,-32(s0)
    13e8:	4ffc                	lw	a5,92(a5)
    13ea:	85be                	mv	a1,a5
    13ec:	fe043503          	ld	a0,-32(s0)
    13f0:	00000097          	auipc	ra,0x0
    13f4:	cd4080e7          	jalr	-812(ra) # 10c4 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    13f8:	a039                	j	1406 <__finish_current+0xba>
        __thread_exit(current_thread);
    13fa:	fe043503          	ld	a0,-32(s0)
    13fe:	00000097          	auipc	ra,0x0
    1402:	e2e080e7          	jalr	-466(ra) # 122c <__thread_exit>
}
    1406:	0001                	nop
    1408:	70a2                	ld	ra,40(sp)
    140a:	7402                	ld	s0,32(sp)
    140c:	6145                	addi	sp,sp,48
    140e:	8082                	ret

0000000000001410 <__rt_finish_current>:
void __rt_finish_current()
{
    1410:	7179                	addi	sp,sp,-48
    1412:	f406                	sd	ra,40(sp)
    1414:	f022                	sd	s0,32(sp)
    1416:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1418:	00001797          	auipc	a5,0x1
    141c:	0e878793          	addi	a5,a5,232 # 2500 <current>
    1420:	639c                	ld	a5,0(a5)
    1422:	fef43423          	sd	a5,-24(s0)
    1426:	fe843783          	ld	a5,-24(s0)
    142a:	fd878793          	addi	a5,a5,-40
    142e:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1432:	fe043783          	ld	a5,-32(s0)
    1436:	4bfc                	lw	a5,84(a5)
    1438:	37fd                	addiw	a5,a5,-1
    143a:	0007871b          	sext.w	a4,a5
    143e:	fe043783          	ld	a5,-32(s0)
    1442:	cbf8                	sw	a4,84(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    1444:	fe043783          	ld	a5,-32(s0)
    1448:	5fd8                	lw	a4,60(a5)
    144a:	00001797          	auipc	a5,0x1
    144e:	0be78793          	addi	a5,a5,190 # 2508 <threading_system_time>
    1452:	4390                	lw	a2,0(a5)
    1454:	fe043783          	ld	a5,-32(s0)
    1458:	4bfc                	lw	a5,84(a5)
    145a:	86be                	mv	a3,a5
    145c:	85ba                	mv	a1,a4
    145e:	00001517          	auipc	a0,0x1
    1462:	f5250513          	addi	a0,a0,-174 # 23b0 <schedule_dm+0x29c>
    1466:	fffff097          	auipc	ra,0xfffff
    146a:	67a080e7          	jalr	1658(ra) # ae0 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    146e:	fe043783          	ld	a5,-32(s0)
    1472:	4bfc                	lw	a5,84(a5)
    1474:	04f05563          	blez	a5,14be <__rt_finish_current+0xae>
        struct list_head *to_remove = current;
    1478:	00001797          	auipc	a5,0x1
    147c:	08878793          	addi	a5,a5,136 # 2500 <current>
    1480:	639c                	ld	a5,0(a5)
    1482:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1486:	00001797          	auipc	a5,0x1
    148a:	07a78793          	addi	a5,a5,122 # 2500 <current>
    148e:	639c                	ld	a5,0(a5)
    1490:	6798                	ld	a4,8(a5)
    1492:	00001797          	auipc	a5,0x1
    1496:	06e78793          	addi	a5,a5,110 # 2500 <current>
    149a:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    149c:	fd843503          	ld	a0,-40(s0)
    14a0:	00000097          	auipc	ra,0x0
    14a4:	a84080e7          	jalr	-1404(ra) # f24 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    14a8:	fe043783          	ld	a5,-32(s0)
    14ac:	4ffc                	lw	a5,92(a5)
    14ae:	85be                	mv	a1,a5
    14b0:	fe043503          	ld	a0,-32(s0)
    14b4:	00000097          	auipc	ra,0x0
    14b8:	c10080e7          	jalr	-1008(ra) # 10c4 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    14bc:	a039                	j	14ca <__rt_finish_current+0xba>
        __thread_exit(current_thread);
    14be:	fe043503          	ld	a0,-32(s0)
    14c2:	00000097          	auipc	ra,0x0
    14c6:	d6a080e7          	jalr	-662(ra) # 122c <__thread_exit>
}
    14ca:	0001                	nop
    14cc:	70a2                	ld	ra,40(sp)
    14ce:	7402                	ld	s0,32(sp)
    14d0:	6145                	addi	sp,sp,48
    14d2:	8082                	ret

00000000000014d4 <switch_handler>:

void switch_handler(void *arg)
{
    14d4:	7139                	addi	sp,sp,-64
    14d6:	fc06                	sd	ra,56(sp)
    14d8:	f822                	sd	s0,48(sp)
    14da:	0080                	addi	s0,sp,64
    14dc:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    14e0:	fc843783          	ld	a5,-56(s0)
    14e4:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    14e8:	00001797          	auipc	a5,0x1
    14ec:	01878793          	addi	a5,a5,24 # 2500 <current>
    14f0:	639c                	ld	a5,0(a5)
    14f2:	fef43023          	sd	a5,-32(s0)
    14f6:	fe043783          	ld	a5,-32(s0)
    14fa:	fd878793          	addi	a5,a5,-40
    14fe:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    1502:	fe843783          	ld	a5,-24(s0)
    1506:	0007871b          	sext.w	a4,a5
    150a:	00001797          	auipc	a5,0x1
    150e:	ffe78793          	addi	a5,a5,-2 # 2508 <threading_system_time>
    1512:	439c                	lw	a5,0(a5)
    1514:	2781                	sext.w	a5,a5
    1516:	9fb9                	addw	a5,a5,a4
    1518:	2781                	sext.w	a5,a5
    151a:	0007871b          	sext.w	a4,a5
    151e:	00001797          	auipc	a5,0x1
    1522:	fea78793          	addi	a5,a5,-22 # 2508 <threading_system_time>
    1526:	c398                	sw	a4,0(a5)
     __release();
    1528:	00000097          	auipc	ra,0x0
    152c:	c1c080e7          	jalr	-996(ra) # 1144 <__release>
    current_thread->remaining_time -= elapsed_time;
    1530:	fd843783          	ld	a5,-40(s0)
    1534:	4fbc                	lw	a5,88(a5)
    1536:	0007871b          	sext.w	a4,a5
    153a:	fe843783          	ld	a5,-24(s0)
    153e:	2781                	sext.w	a5,a5
    1540:	40f707bb          	subw	a5,a4,a5
    1544:	2781                	sext.w	a5,a5
    1546:	0007871b          	sext.w	a4,a5
    154a:	fd843783          	ld	a5,-40(s0)
    154e:	cfb8                	sw	a4,88(a5)

    if (current_thread->is_real_time)
    1550:	fd843783          	ld	a5,-40(s0)
    1554:	43bc                	lw	a5,64(a5)
    1556:	c3ad                	beqz	a5,15b8 <switch_handler+0xe4>
        if (threading_system_time > current_thread->current_deadline || 
    1558:	fd843783          	ld	a5,-40(s0)
    155c:	4ff8                	lw	a4,92(a5)
    155e:	00001797          	auipc	a5,0x1
    1562:	faa78793          	addi	a5,a5,-86 # 2508 <threading_system_time>
    1566:	439c                	lw	a5,0(a5)
    1568:	02f74163          	blt	a4,a5,158a <switch_handler+0xb6>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    156c:	fd843783          	ld	a5,-40(s0)
    1570:	4ff8                	lw	a4,92(a5)
    1572:	00001797          	auipc	a5,0x1
    1576:	f9678793          	addi	a5,a5,-106 # 2508 <threading_system_time>
    157a:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    157c:	02f71e63          	bne	a4,a5,15b8 <switch_handler+0xe4>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1580:	fd843783          	ld	a5,-40(s0)
    1584:	4fbc                	lw	a5,88(a5)
    1586:	02f05963          	blez	a5,15b8 <switch_handler+0xe4>
            printf("thread#%d misses a deadline at %d\n", current_thread->ID, threading_system_time);
    158a:	fd843783          	ld	a5,-40(s0)
    158e:	5fd8                	lw	a4,60(a5)
    1590:	00001797          	auipc	a5,0x1
    1594:	f7878793          	addi	a5,a5,-136 # 2508 <threading_system_time>
    1598:	439c                	lw	a5,0(a5)
    159a:	863e                	mv	a2,a5
    159c:	85ba                	mv	a1,a4
    159e:	00001517          	auipc	a0,0x1
    15a2:	e4a50513          	addi	a0,a0,-438 # 23e8 <schedule_dm+0x2d4>
    15a6:	fffff097          	auipc	ra,0xfffff
    15aa:	53a080e7          	jalr	1338(ra) # ae0 <printf>
            exit(0);
    15ae:	4501                	li	a0,0
    15b0:	fffff097          	auipc	ra,0xfffff
    15b4:	fea080e7          	jalr	-22(ra) # 59a <exit>
        }

    if (current_thread->remaining_time <= 0) {
    15b8:	fd843783          	ld	a5,-40(s0)
    15bc:	4fbc                	lw	a5,88(a5)
    15be:	02f04063          	bgtz	a5,15de <switch_handler+0x10a>
        if (current_thread->is_real_time)
    15c2:	fd843783          	ld	a5,-40(s0)
    15c6:	43bc                	lw	a5,64(a5)
    15c8:	c791                	beqz	a5,15d4 <switch_handler+0x100>
            __rt_finish_current();
    15ca:	00000097          	auipc	ra,0x0
    15ce:	e46080e7          	jalr	-442(ra) # 1410 <__rt_finish_current>
    15d2:	a881                	j	1622 <switch_handler+0x14e>
        else
            __finish_current();
    15d4:	00000097          	auipc	ra,0x0
    15d8:	d78080e7          	jalr	-648(ra) # 134c <__finish_current>
    15dc:	a099                	j	1622 <switch_handler+0x14e>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    15de:	00001797          	auipc	a5,0x1
    15e2:	f2278793          	addi	a5,a5,-222 # 2500 <current>
    15e6:	639c                	ld	a5,0(a5)
    15e8:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    15ec:	00001797          	auipc	a5,0x1
    15f0:	f1478793          	addi	a5,a5,-236 # 2500 <current>
    15f4:	639c                	ld	a5,0(a5)
    15f6:	6798                	ld	a4,8(a5)
    15f8:	00001797          	auipc	a5,0x1
    15fc:	f0878793          	addi	a5,a5,-248 # 2500 <current>
    1600:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1602:	fd043503          	ld	a0,-48(s0)
    1606:	00000097          	auipc	ra,0x0
    160a:	91e080e7          	jalr	-1762(ra) # f24 <list_del>
        list_add_tail(to_remove, &run_queue);
    160e:	00001597          	auipc	a1,0x1
    1612:	eaa58593          	addi	a1,a1,-342 # 24b8 <run_queue>
    1616:	fd043503          	ld	a0,-48(s0)
    161a:	00000097          	auipc	ra,0x0
    161e:	8ae080e7          	jalr	-1874(ra) # ec8 <list_add_tail>
    }

    __release();
    1622:	00000097          	auipc	ra,0x0
    1626:	b22080e7          	jalr	-1246(ra) # 1144 <__release>
    __schedule();
    162a:	00000097          	auipc	ra,0x0
    162e:	1be080e7          	jalr	446(ra) # 17e8 <__schedule>
    __dispatch();
    1632:	00000097          	auipc	ra,0x0
    1636:	026080e7          	jalr	38(ra) # 1658 <__dispatch>
    thrdresume(main_thrd_id);
    163a:	00001797          	auipc	a5,0x1
    163e:	e9e78793          	addi	a5,a5,-354 # 24d8 <main_thrd_id>
    1642:	439c                	lw	a5,0(a5)
    1644:	853e                	mv	a0,a5
    1646:	fffff097          	auipc	ra,0xfffff
    164a:	ffc080e7          	jalr	-4(ra) # 642 <thrdresume>
}
    164e:	0001                	nop
    1650:	70e2                	ld	ra,56(sp)
    1652:	7442                	ld	s0,48(sp)
    1654:	6121                	addi	sp,sp,64
    1656:	8082                	ret

0000000000001658 <__dispatch>:

void __dispatch()
{
    1658:	7179                	addi	sp,sp,-48
    165a:	f406                	sd	ra,40(sp)
    165c:	f022                	sd	s0,32(sp)
    165e:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1660:	00001797          	auipc	a5,0x1
    1664:	ea078793          	addi	a5,a5,-352 # 2500 <current>
    1668:	6398                	ld	a4,0(a5)
    166a:	00001797          	auipc	a5,0x1
    166e:	e4e78793          	addi	a5,a5,-434 # 24b8 <run_queue>
    1672:	16f70663          	beq	a4,a5,17de <__dispatch+0x186>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }

    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1676:	00001797          	auipc	a5,0x1
    167a:	e8a78793          	addi	a5,a5,-374 # 2500 <current>
    167e:	639c                	ld	a5,0(a5)
    1680:	fef43423          	sd	a5,-24(s0)
    1684:	fe843783          	ld	a5,-24(s0)
    1688:	fd878793          	addi	a5,a5,-40
    168c:	fef43023          	sd	a5,-32(s0)
    if (current_thread->is_real_time && allocated_time == 0) { // miss deadline, abort
    1690:	fe043783          	ld	a5,-32(s0)
    1694:	43bc                	lw	a5,64(a5)
    1696:	cf85                	beqz	a5,16ce <__dispatch+0x76>
    1698:	00001797          	auipc	a5,0x1
    169c:	e7878793          	addi	a5,a5,-392 # 2510 <allocated_time>
    16a0:	639c                	ld	a5,0(a5)
    16a2:	e795                	bnez	a5,16ce <__dispatch+0x76>
        printf("thread#%d misses a deadline at %d\n", current_thread->ID, current_thread->current_deadline);
    16a4:	fe043783          	ld	a5,-32(s0)
    16a8:	5fd8                	lw	a4,60(a5)
    16aa:	fe043783          	ld	a5,-32(s0)
    16ae:	4ffc                	lw	a5,92(a5)
    16b0:	863e                	mv	a2,a5
    16b2:	85ba                	mv	a1,a4
    16b4:	00001517          	auipc	a0,0x1
    16b8:	d3450513          	addi	a0,a0,-716 # 23e8 <schedule_dm+0x2d4>
    16bc:	fffff097          	auipc	ra,0xfffff
    16c0:	424080e7          	jalr	1060(ra) # ae0 <printf>
        exit(0);
    16c4:	4501                	li	a0,0
    16c6:	fffff097          	auipc	ra,0xfffff
    16ca:	ed4080e7          	jalr	-300(ra) # 59a <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    16ce:	fe043783          	ld	a5,-32(s0)
    16d2:	5fd8                	lw	a4,60(a5)
    16d4:	00001797          	auipc	a5,0x1
    16d8:	e3478793          	addi	a5,a5,-460 # 2508 <threading_system_time>
    16dc:	4390                	lw	a2,0(a5)
    16de:	00001797          	auipc	a5,0x1
    16e2:	e3278793          	addi	a5,a5,-462 # 2510 <allocated_time>
    16e6:	639c                	ld	a5,0(a5)
    16e8:	86be                	mv	a3,a5
    16ea:	85ba                	mv	a1,a4
    16ec:	00001517          	auipc	a0,0x1
    16f0:	d2450513          	addi	a0,a0,-732 # 2410 <schedule_dm+0x2fc>
    16f4:	fffff097          	auipc	ra,0xfffff
    16f8:	3ec080e7          	jalr	1004(ra) # ae0 <printf>

    if (current_thread->buf_set) {
    16fc:	fe043783          	ld	a5,-32(s0)
    1700:	539c                	lw	a5,32(a5)
    1702:	c7a1                	beqz	a5,174a <__dispatch+0xf2>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1704:	00001797          	auipc	a5,0x1
    1708:	e0c78793          	addi	a5,a5,-500 # 2510 <allocated_time>
    170c:	639c                	ld	a5,0(a5)
    170e:	0007871b          	sext.w	a4,a5
    1712:	fe043783          	ld	a5,-32(s0)
    1716:	03878593          	addi	a1,a5,56
    171a:	00001797          	auipc	a5,0x1
    171e:	df678793          	addi	a5,a5,-522 # 2510 <allocated_time>
    1722:	639c                	ld	a5,0(a5)
    1724:	86be                	mv	a3,a5
    1726:	00000617          	auipc	a2,0x0
    172a:	dae60613          	addi	a2,a2,-594 # 14d4 <switch_handler>
    172e:	853a                	mv	a0,a4
    1730:	fffff097          	auipc	ra,0xfffff
    1734:	f0a080e7          	jalr	-246(ra) # 63a <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    1738:	fe043783          	ld	a5,-32(s0)
    173c:	5f9c                	lw	a5,56(a5)
    173e:	853e                	mv	a0,a5
    1740:	fffff097          	auipc	ra,0xfffff
    1744:	f02080e7          	jalr	-254(ra) # 642 <thrdresume>
    1748:	a071                	j	17d4 <__dispatch+0x17c>
    } else {
        current_thread->buf_set = 1;
    174a:	fe043783          	ld	a5,-32(s0)
    174e:	4705                	li	a4,1
    1750:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    1752:	fe043783          	ld	a5,-32(s0)
    1756:	6f9c                	ld	a5,24(a5)
    1758:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    175c:	fe043783          	ld	a5,-32(s0)
    1760:	577d                	li	a4,-1
    1762:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1764:	00001797          	auipc	a5,0x1
    1768:	dac78793          	addi	a5,a5,-596 # 2510 <allocated_time>
    176c:	639c                	ld	a5,0(a5)
    176e:	0007871b          	sext.w	a4,a5
    1772:	fe043783          	ld	a5,-32(s0)
    1776:	03878593          	addi	a1,a5,56
    177a:	00001797          	auipc	a5,0x1
    177e:	d9678793          	addi	a5,a5,-618 # 2510 <allocated_time>
    1782:	639c                	ld	a5,0(a5)
    1784:	86be                	mv	a3,a5
    1786:	00000617          	auipc	a2,0x0
    178a:	d4e60613          	addi	a2,a2,-690 # 14d4 <switch_handler>
    178e:	853a                	mv	a0,a4
    1790:	fffff097          	auipc	ra,0xfffff
    1794:	eaa080e7          	jalr	-342(ra) # 63a <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    1798:	fe043783          	ld	a5,-32(s0)
    179c:	5f9c                	lw	a5,56(a5)
    179e:	0207d063          	bgez	a5,17be <__dispatch+0x166>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    17a2:	00001597          	auipc	a1,0x1
    17a6:	c9e58593          	addi	a1,a1,-866 # 2440 <schedule_dm+0x32c>
    17aa:	4509                	li	a0,2
    17ac:	fffff097          	auipc	ra,0xfffff
    17b0:	2dc080e7          	jalr	732(ra) # a88 <fprintf>
            exit(1);
    17b4:	4505                	li	a0,1
    17b6:	fffff097          	auipc	ra,0xfffff
    17ba:	de4080e7          	jalr	-540(ra) # 59a <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    17be:	fd843783          	ld	a5,-40(s0)
    17c2:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    17c4:	fe043783          	ld	a5,-32(s0)
    17c8:	6398                	ld	a4,0(a5)
    17ca:	fe043783          	ld	a5,-32(s0)
    17ce:	679c                	ld	a5,8(a5)
    17d0:	853e                	mv	a0,a5
    17d2:	9702                	jalr	a4
    }
    thread_exit();
    17d4:	00000097          	auipc	ra,0x0
    17d8:	ad0080e7          	jalr	-1328(ra) # 12a4 <thread_exit>
    17dc:	a011                	j	17e0 <__dispatch+0x188>
        return;
    17de:	0001                	nop
}
    17e0:	70a2                	ld	ra,40(sp)
    17e2:	7402                	ld	s0,32(sp)
    17e4:	6145                	addi	sp,sp,48
    17e6:	8082                	ret

00000000000017e8 <__schedule>:

void __schedule()
{
    17e8:	711d                	addi	sp,sp,-96
    17ea:	ec86                	sd	ra,88(sp)
    17ec:	e8a2                	sd	s0,80(sp)
    17ee:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    17f0:	00001797          	auipc	a5,0x1
    17f4:	d1878793          	addi	a5,a5,-744 # 2508 <threading_system_time>
    17f8:	439c                	lw	a5,0(a5)
    17fa:	fcf42c23          	sw	a5,-40(s0)
    17fe:	4789                	li	a5,2
    1800:	fcf42e23          	sw	a5,-36(s0)
    1804:	00001797          	auipc	a5,0x1
    1808:	cb478793          	addi	a5,a5,-844 # 24b8 <run_queue>
    180c:	fef43023          	sd	a5,-32(s0)
    1810:	00001797          	auipc	a5,0x1
    1814:	cb878793          	addi	a5,a5,-840 # 24c8 <release_queue>
    1818:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_LST
    r = schedule_lst(args);
#endif

#ifdef THREAD_SCHEDULER_DM
    r = schedule_dm(args);
    181c:	fd843783          	ld	a5,-40(s0)
    1820:	faf43023          	sd	a5,-96(s0)
    1824:	fe043783          	ld	a5,-32(s0)
    1828:	faf43423          	sd	a5,-88(s0)
    182c:	fe843783          	ld	a5,-24(s0)
    1830:	faf43823          	sd	a5,-80(s0)
    1834:	fa040793          	addi	a5,s0,-96
    1838:	853e                	mv	a0,a5
    183a:	00001097          	auipc	ra,0x1
    183e:	8da080e7          	jalr	-1830(ra) # 2114 <schedule_dm>
    1842:	872a                	mv	a4,a0
    1844:	87ae                	mv	a5,a1
    1846:	fce43423          	sd	a4,-56(s0)
    184a:	fcf43823          	sd	a5,-48(s0)
#endif

    current = r.scheduled_thread_list_member;
    184e:	fc843703          	ld	a4,-56(s0)
    1852:	00001797          	auipc	a5,0x1
    1856:	cae78793          	addi	a5,a5,-850 # 2500 <current>
    185a:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    185c:	fd042783          	lw	a5,-48(s0)
    1860:	873e                	mv	a4,a5
    1862:	00001797          	auipc	a5,0x1
    1866:	cae78793          	addi	a5,a5,-850 # 2510 <allocated_time>
    186a:	e398                	sd	a4,0(a5)
}
    186c:	0001                	nop
    186e:	60e6                	ld	ra,88(sp)
    1870:	6446                	ld	s0,80(sp)
    1872:	6125                	addi	sp,sp,96
    1874:	8082                	ret

0000000000001876 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    1876:	1101                	addi	sp,sp,-32
    1878:	ec06                	sd	ra,24(sp)
    187a:	e822                	sd	s0,16(sp)
    187c:	1000                	addi	s0,sp,32
    187e:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1882:	00001797          	auipc	a5,0x1
    1886:	c8a78793          	addi	a5,a5,-886 # 250c <sleeping>
    188a:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    188e:	fe843783          	ld	a5,-24(s0)
    1892:	0007871b          	sext.w	a4,a5
    1896:	00001797          	auipc	a5,0x1
    189a:	c7278793          	addi	a5,a5,-910 # 2508 <threading_system_time>
    189e:	439c                	lw	a5,0(a5)
    18a0:	2781                	sext.w	a5,a5
    18a2:	9fb9                	addw	a5,a5,a4
    18a4:	2781                	sext.w	a5,a5
    18a6:	0007871b          	sext.w	a4,a5
    18aa:	00001797          	auipc	a5,0x1
    18ae:	c5e78793          	addi	a5,a5,-930 # 2508 <threading_system_time>
    18b2:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    18b4:	00001797          	auipc	a5,0x1
    18b8:	c2478793          	addi	a5,a5,-988 # 24d8 <main_thrd_id>
    18bc:	439c                	lw	a5,0(a5)
    18be:	853e                	mv	a0,a5
    18c0:	fffff097          	auipc	ra,0xfffff
    18c4:	d82080e7          	jalr	-638(ra) # 642 <thrdresume>
}
    18c8:	0001                	nop
    18ca:	60e2                	ld	ra,24(sp)
    18cc:	6442                	ld	s0,16(sp)
    18ce:	6105                	addi	sp,sp,32
    18d0:	8082                	ret

00000000000018d2 <thread_start_threading>:

void thread_start_threading()
{
    18d2:	1141                	addi	sp,sp,-16
    18d4:	e406                	sd	ra,8(sp)
    18d6:	e022                	sd	s0,0(sp)
    18d8:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    18da:	00001797          	auipc	a5,0x1
    18de:	c2e78793          	addi	a5,a5,-978 # 2508 <threading_system_time>
    18e2:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    18e6:	00001797          	auipc	a5,0x1
    18ea:	c1a78793          	addi	a5,a5,-998 # 2500 <current>
    18ee:	00001717          	auipc	a4,0x1
    18f2:	bca70713          	addi	a4,a4,-1078 # 24b8 <run_queue>
    18f6:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    18f8:	4681                	li	a3,0
    18fa:	00000617          	auipc	a2,0x0
    18fe:	f7c60613          	addi	a2,a2,-132 # 1876 <back_to_main_handler>
    1902:	00001597          	auipc	a1,0x1
    1906:	bd658593          	addi	a1,a1,-1066 # 24d8 <main_thrd_id>
    190a:	3e800513          	li	a0,1000
    190e:	fffff097          	auipc	ra,0xfffff
    1912:	d2c080e7          	jalr	-724(ra) # 63a <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    1916:	00001797          	auipc	a5,0x1
    191a:	bc278793          	addi	a5,a5,-1086 # 24d8 <main_thrd_id>
    191e:	439c                	lw	a5,0(a5)
    1920:	4581                	li	a1,0
    1922:	853e                	mv	a0,a5
    1924:	fffff097          	auipc	ra,0xfffff
    1928:	d26080e7          	jalr	-730(ra) # 64a <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    192c:	a0c9                	j	19ee <thread_start_threading+0x11c>
        __release();
    192e:	00000097          	auipc	ra,0x0
    1932:	816080e7          	jalr	-2026(ra) # 1144 <__release>
        __schedule();
    1936:	00000097          	auipc	ra,0x0
    193a:	eb2080e7          	jalr	-334(ra) # 17e8 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    193e:	00001797          	auipc	a5,0x1
    1942:	b9a78793          	addi	a5,a5,-1126 # 24d8 <main_thrd_id>
    1946:	439c                	lw	a5,0(a5)
    1948:	4581                	li	a1,0
    194a:	853e                	mv	a0,a5
    194c:	fffff097          	auipc	ra,0xfffff
    1950:	cfe080e7          	jalr	-770(ra) # 64a <cancelthrdstop>
        __dispatch();
    1954:	00000097          	auipc	ra,0x0
    1958:	d04080e7          	jalr	-764(ra) # 1658 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    195c:	00001517          	auipc	a0,0x1
    1960:	b5c50513          	addi	a0,a0,-1188 # 24b8 <run_queue>
    1964:	fffff097          	auipc	ra,0xfffff
    1968:	60a080e7          	jalr	1546(ra) # f6e <list_empty>
    196c:	87aa                	mv	a5,a0
    196e:	cb99                	beqz	a5,1984 <thread_start_threading+0xb2>
    1970:	00001517          	auipc	a0,0x1
    1974:	b5850513          	addi	a0,a0,-1192 # 24c8 <release_queue>
    1978:	fffff097          	auipc	ra,0xfffff
    197c:	5f6080e7          	jalr	1526(ra) # f6e <list_empty>
    1980:	87aa                	mv	a5,a0
    1982:	ebd9                	bnez	a5,1a18 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1984:	00001797          	auipc	a5,0x1
    1988:	b8c78793          	addi	a5,a5,-1140 # 2510 <allocated_time>
    198c:	639c                	ld	a5,0(a5)
    198e:	85be                	mv	a1,a5
    1990:	00001517          	auipc	a0,0x1
    1994:	ae850513          	addi	a0,a0,-1304 # 2478 <schedule_dm+0x364>
    1998:	fffff097          	auipc	ra,0xfffff
    199c:	148080e7          	jalr	328(ra) # ae0 <printf>
        sleeping = 1;
    19a0:	00001797          	auipc	a5,0x1
    19a4:	b6c78793          	addi	a5,a5,-1172 # 250c <sleeping>
    19a8:	4705                	li	a4,1
    19aa:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    19ac:	00001797          	auipc	a5,0x1
    19b0:	b6478793          	addi	a5,a5,-1180 # 2510 <allocated_time>
    19b4:	639c                	ld	a5,0(a5)
    19b6:	0007871b          	sext.w	a4,a5
    19ba:	00001797          	auipc	a5,0x1
    19be:	b5678793          	addi	a5,a5,-1194 # 2510 <allocated_time>
    19c2:	639c                	ld	a5,0(a5)
    19c4:	86be                	mv	a3,a5
    19c6:	00000617          	auipc	a2,0x0
    19ca:	eb060613          	addi	a2,a2,-336 # 1876 <back_to_main_handler>
    19ce:	00001597          	auipc	a1,0x1
    19d2:	b0a58593          	addi	a1,a1,-1270 # 24d8 <main_thrd_id>
    19d6:	853a                	mv	a0,a4
    19d8:	fffff097          	auipc	ra,0xfffff
    19dc:	c62080e7          	jalr	-926(ra) # 63a <thrdstop>
        while (sleeping) {
    19e0:	0001                	nop
    19e2:	00001797          	auipc	a5,0x1
    19e6:	b2a78793          	addi	a5,a5,-1238 # 250c <sleeping>
    19ea:	439c                	lw	a5,0(a5)
    19ec:	fbfd                	bnez	a5,19e2 <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    19ee:	00001517          	auipc	a0,0x1
    19f2:	aca50513          	addi	a0,a0,-1334 # 24b8 <run_queue>
    19f6:	fffff097          	auipc	ra,0xfffff
    19fa:	578080e7          	jalr	1400(ra) # f6e <list_empty>
    19fe:	87aa                	mv	a5,a0
    1a00:	d79d                	beqz	a5,192e <thread_start_threading+0x5c>
    1a02:	00001517          	auipc	a0,0x1
    1a06:	ac650513          	addi	a0,a0,-1338 # 24c8 <release_queue>
    1a0a:	fffff097          	auipc	ra,0xfffff
    1a0e:	564080e7          	jalr	1380(ra) # f6e <list_empty>
    1a12:	87aa                	mv	a5,a0
    1a14:	df89                	beqz	a5,192e <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1a16:	a011                	j	1a1a <thread_start_threading+0x148>
            break;
    1a18:	0001                	nop
}
    1a1a:	0001                	nop
    1a1c:	60a2                	ld	ra,8(sp)
    1a1e:	6402                	ld	s0,0(sp)
    1a20:	0141                	addi	sp,sp,16
    1a22:	8082                	ret

0000000000001a24 <schedule_default>:

#define NULL 0

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    1a24:	715d                	addi	sp,sp,-80
    1a26:	e4a2                	sd	s0,72(sp)
    1a28:	e0a6                	sd	s1,64(sp)
    1a2a:	0880                	addi	s0,sp,80
    1a2c:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
    1a2e:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    1a32:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1a36:	649c                	ld	a5,8(s1)
    1a38:	639c                	ld	a5,0(a5)
    1a3a:	fcf43c23          	sd	a5,-40(s0)
    1a3e:	fd843783          	ld	a5,-40(s0)
    1a42:	fd878793          	addi	a5,a5,-40
    1a46:	fef43023          	sd	a5,-32(s0)
    1a4a:	a81d                	j	1a80 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
    1a4c:	fe843783          	ld	a5,-24(s0)
    1a50:	cb89                	beqz	a5,1a62 <schedule_default+0x3e>
    1a52:	fe043783          	ld	a5,-32(s0)
    1a56:	5fd8                	lw	a4,60(a5)
    1a58:	fe843783          	ld	a5,-24(s0)
    1a5c:	5fdc                	lw	a5,60(a5)
    1a5e:	00f75663          	bge	a4,a5,1a6a <schedule_default+0x46>
            thread_with_smallest_id = th;
    1a62:	fe043783          	ld	a5,-32(s0)
    1a66:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1a6a:	fe043783          	ld	a5,-32(s0)
    1a6e:	779c                	ld	a5,40(a5)
    1a70:	fcf43823          	sd	a5,-48(s0)
    1a74:	fd043783          	ld	a5,-48(s0)
    1a78:	fd878793          	addi	a5,a5,-40
    1a7c:	fef43023          	sd	a5,-32(s0)
    1a80:	fe043783          	ld	a5,-32(s0)
    1a84:	02878713          	addi	a4,a5,40
    1a88:	649c                	ld	a5,8(s1)
    1a8a:	fcf711e3          	bne	a4,a5,1a4c <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
    1a8e:	fe843783          	ld	a5,-24(s0)
    1a92:	cf89                	beqz	a5,1aac <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
    1a94:	fe843783          	ld	a5,-24(s0)
    1a98:	02878793          	addi	a5,a5,40
    1a9c:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
    1aa0:	fe843783          	ld	a5,-24(s0)
    1aa4:	4fbc                	lw	a5,88(a5)
    1aa6:	faf42c23          	sw	a5,-72(s0)
    1aaa:	a039                	j	1ab8 <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1aac:	649c                	ld	a5,8(s1)
    1aae:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
    1ab2:	4785                	li	a5,1
    1ab4:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
    1ab8:	fb043783          	ld	a5,-80(s0)
    1abc:	fcf43023          	sd	a5,-64(s0)
    1ac0:	fb843783          	ld	a5,-72(s0)
    1ac4:	fcf43423          	sd	a5,-56(s0)
    1ac8:	4701                	li	a4,0
    1aca:	fc043703          	ld	a4,-64(s0)
    1ace:	4781                	li	a5,0
    1ad0:	fc843783          	ld	a5,-56(s0)
    1ad4:	863a                	mv	a2,a4
    1ad6:	86be                	mv	a3,a5
    1ad8:	8732                	mv	a4,a2
    1ada:	87b6                	mv	a5,a3
}
    1adc:	853a                	mv	a0,a4
    1ade:	85be                	mv	a1,a5
    1ae0:	6426                	ld	s0,72(sp)
    1ae2:	6486                	ld	s1,64(sp)
    1ae4:	6161                	addi	sp,sp,80
    1ae6:	8082                	ret

0000000000001ae8 <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
    1ae8:	7175                	addi	sp,sp,-144
    1aea:	e522                	sd	s0,136(sp)
    1aec:	e126                	sd	s1,128(sp)
    1aee:	0900                	addi	s0,sp,144
    1af0:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    struct thread *process_thread = NULL;
    1af2:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    1af6:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1afa:	649c                	ld	a5,8(s1)
    1afc:	639c                	ld	a5,0(a5)
    1afe:	fcf43023          	sd	a5,-64(s0)
    1b02:	fc043783          	ld	a5,-64(s0)
    1b06:	fd878793          	addi	a5,a5,-40
    1b0a:	fef43023          	sd	a5,-32(s0)
    1b0e:	a025                	j	1b36 <schedule_wrr+0x4e>
        if (process_thread == NULL) {
    1b10:	fe843783          	ld	a5,-24(s0)
    1b14:	e791                	bnez	a5,1b20 <schedule_wrr+0x38>
            process_thread = th;
    1b16:	fe043783          	ld	a5,-32(s0)
    1b1a:	fef43423          	sd	a5,-24(s0)
            break;
    1b1e:	a01d                	j	1b44 <schedule_wrr+0x5c>
    list_for_each_entry(th, args.run_queue, thread_list) {
    1b20:	fe043783          	ld	a5,-32(s0)
    1b24:	779c                	ld	a5,40(a5)
    1b26:	faf43c23          	sd	a5,-72(s0)
    1b2a:	fb843783          	ld	a5,-72(s0)
    1b2e:	fd878793          	addi	a5,a5,-40
    1b32:	fef43023          	sd	a5,-32(s0)
    1b36:	fe043783          	ld	a5,-32(s0)
    1b3a:	02878713          	addi	a4,a5,40
    1b3e:	649c                	ld	a5,8(s1)
    1b40:	fcf718e3          	bne	a4,a5,1b10 <schedule_wrr+0x28>
        }
    }

    if (process_thread == NULL) {
    1b44:	fe843783          	ld	a5,-24(s0)
    1b48:	e3c9                	bnez	a5,1bca <schedule_wrr+0xe2>
        int sleep_time = -1;
    1b4a:	57fd                	li	a5,-1
    1b4c:	fcf42e23          	sw	a5,-36(s0)
        struct release_queue_entry *cur;
        list_for_each_entry(cur, args.release_queue, thread_list) {
    1b50:	689c                	ld	a5,16(s1)
    1b52:	639c                	ld	a5,0(a5)
    1b54:	faf43423          	sd	a5,-88(s0)
    1b58:	fa843783          	ld	a5,-88(s0)
    1b5c:	17e1                	addi	a5,a5,-8
    1b5e:	fcf43823          	sd	a5,-48(s0)
    1b62:	a0a9                	j	1bac <schedule_wrr+0xc4>
            if (sleep_time < 0 || sleep_time < cur->release_time - args.current_time)
    1b64:	fdc42783          	lw	a5,-36(s0)
    1b68:	2781                	sext.w	a5,a5
    1b6a:	0007cf63          	bltz	a5,1b88 <schedule_wrr+0xa0>
    1b6e:	fd043783          	ld	a5,-48(s0)
    1b72:	4f98                	lw	a4,24(a5)
    1b74:	409c                	lw	a5,0(s1)
    1b76:	40f707bb          	subw	a5,a4,a5
    1b7a:	0007871b          	sext.w	a4,a5
    1b7e:	fdc42783          	lw	a5,-36(s0)
    1b82:	2781                	sext.w	a5,a5
    1b84:	00e7da63          	bge	a5,a4,1b98 <schedule_wrr+0xb0>
                sleep_time = cur->release_time - args.current_time;
    1b88:	fd043783          	ld	a5,-48(s0)
    1b8c:	4f98                	lw	a4,24(a5)
    1b8e:	409c                	lw	a5,0(s1)
    1b90:	40f707bb          	subw	a5,a4,a5
    1b94:	fcf42e23          	sw	a5,-36(s0)
        list_for_each_entry(cur, args.release_queue, thread_list) {
    1b98:	fd043783          	ld	a5,-48(s0)
    1b9c:	679c                	ld	a5,8(a5)
    1b9e:	faf43023          	sd	a5,-96(s0)
    1ba2:	fa043783          	ld	a5,-96(s0)
    1ba6:	17e1                	addi	a5,a5,-8
    1ba8:	fcf43823          	sd	a5,-48(s0)
    1bac:	fd043783          	ld	a5,-48(s0)
    1bb0:	00878713          	addi	a4,a5,8
    1bb4:	689c                	ld	a5,16(s1)
    1bb6:	faf717e3          	bne	a4,a5,1b64 <schedule_wrr+0x7c>
        }
        return (struct threads_sched_result) { .scheduled_thread_list_member = args.run_queue, .allocated_time = sleep_time };
    1bba:	649c                	ld	a5,8(s1)
    1bbc:	f8f43823          	sd	a5,-112(s0)
    1bc0:	fdc42783          	lw	a5,-36(s0)
    1bc4:	f8f42c23          	sw	a5,-104(s0)
    1bc8:	a085                	j	1c28 <schedule_wrr+0x140>
    }

    int time_quantum = args.time_quantum;
    1bca:	40dc                	lw	a5,4(s1)
    1bcc:	faf42a23          	sw	a5,-76(s0)
    int executing_time = process_thread->remaining_time;
    1bd0:	fe843783          	ld	a5,-24(s0)
    1bd4:	4fbc                	lw	a5,88(a5)
    1bd6:	fcf42623          	sw	a5,-52(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    1bda:	fe843783          	ld	a5,-24(s0)
    1bde:	4fac                	lw	a1,88(a5)
    1be0:	fe843783          	ld	a5,-24(s0)
    1be4:	47bc                	lw	a5,72(a5)
    1be6:	fb442703          	lw	a4,-76(s0)
    1bea:	02f707bb          	mulw	a5,a4,a5
    1bee:	2781                	sext.w	a5,a5
    1bf0:	872e                	mv	a4,a1
    1bf2:	00e7dc63          	bge	a5,a4,1c0a <schedule_wrr+0x122>
        executing_time = time_quantum * (process_thread->weight);
    1bf6:	fe843783          	ld	a5,-24(s0)
    1bfa:	47bc                	lw	a5,72(a5)
    1bfc:	fb442703          	lw	a4,-76(s0)
    1c00:	02f707bb          	mulw	a5,a4,a5
    1c04:	fcf42623          	sw	a5,-52(s0)
    1c08:	a031                	j	1c14 <schedule_wrr+0x12c>
    }
    else {
        executing_time = process_thread->remaining_time;
    1c0a:	fe843783          	ld	a5,-24(s0)
    1c0e:	4fbc                	lw	a5,88(a5)
    1c10:	fcf42623          	sw	a5,-52(s0)
    }
    
    return (struct threads_sched_result) { .scheduled_thread_list_member = &process_thread->thread_list, .allocated_time = executing_time };
    1c14:	fe843783          	ld	a5,-24(s0)
    1c18:	02878793          	addi	a5,a5,40
    1c1c:	f8f43823          	sd	a5,-112(s0)
    1c20:	fcc42783          	lw	a5,-52(s0)
    1c24:	f8f42c23          	sw	a5,-104(s0)
    1c28:	4701                	li	a4,0
    1c2a:	f9043703          	ld	a4,-112(s0)
    1c2e:	4781                	li	a5,0
    1c30:	f9843783          	ld	a5,-104(s0)
    1c34:	863a                	mv	a2,a4
    1c36:	86be                	mv	a3,a5
    1c38:	8732                	mv	a4,a2
    1c3a:	87b6                	mv	a5,a3
}
    1c3c:	853a                	mv	a0,a4
    1c3e:	85be                	mv	a1,a5
    1c40:	642a                	ld	s0,136(sp)
    1c42:	648a                	ld	s1,128(sp)
    1c44:	6149                	addi	sp,sp,144
    1c46:	8082                	ret

0000000000001c48 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    1c48:	7171                	addi	sp,sp,-176
    1c4a:	f522                	sd	s0,168(sp)
    1c4c:	f126                	sd	s1,160(sp)
    1c4e:	1900                	addi	s0,sp,176
    1c50:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    int current_time = args.current_time;
    1c52:	409c                	lw	a5,0(s1)
    1c54:	fcf42023          	sw	a5,-64(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    1c58:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    1c5c:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1c60:	649c                	ld	a5,8(s1)
    1c62:	639c                	ld	a5,0(a5)
    1c64:	faf43c23          	sd	a5,-72(s0)
    1c68:	fb843783          	ld	a5,-72(s0)
    1c6c:	fd878793          	addi	a5,a5,-40
    1c70:	fef43023          	sd	a5,-32(s0)
    1c74:	a085                	j	1cd4 <schedule_sjf+0x8c>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    1c76:	fe843783          	ld	a5,-24(s0)
    1c7a:	cb89                	beqz	a5,1c8c <schedule_sjf+0x44>
    1c7c:	fe043783          	ld	a5,-32(s0)
    1c80:	4fb8                	lw	a4,88(a5)
    1c82:	fe843783          	ld	a5,-24(s0)
    1c86:	4fbc                	lw	a5,88(a5)
    1c88:	00f75763          	bge	a4,a5,1c96 <schedule_sjf+0x4e>
            shortest_thread = th;
    1c8c:	fe043783          	ld	a5,-32(s0)
    1c90:	fef43423          	sd	a5,-24(s0)
    1c94:	a02d                	j	1cbe <schedule_sjf+0x76>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    1c96:	fe043783          	ld	a5,-32(s0)
    1c9a:	4fb8                	lw	a4,88(a5)
    1c9c:	fe843783          	ld	a5,-24(s0)
    1ca0:	4fbc                	lw	a5,88(a5)
    1ca2:	00f71e63          	bne	a4,a5,1cbe <schedule_sjf+0x76>
    1ca6:	fe043783          	ld	a5,-32(s0)
    1caa:	5fd8                	lw	a4,60(a5)
    1cac:	fe843783          	ld	a5,-24(s0)
    1cb0:	5fdc                	lw	a5,60(a5)
    1cb2:	00f75663          	bge	a4,a5,1cbe <schedule_sjf+0x76>
            shortest_thread = th;
    1cb6:	fe043783          	ld	a5,-32(s0)
    1cba:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1cbe:	fe043783          	ld	a5,-32(s0)
    1cc2:	779c                	ld	a5,40(a5)
    1cc4:	f8f43423          	sd	a5,-120(s0)
    1cc8:	f8843783          	ld	a5,-120(s0)
    1ccc:	fd878793          	addi	a5,a5,-40
    1cd0:	fef43023          	sd	a5,-32(s0)
    1cd4:	fe043783          	ld	a5,-32(s0)
    1cd8:	02878713          	addi	a4,a5,40
    1cdc:	649c                	ld	a5,8(s1)
    1cde:	f8f71ce3          	bne	a4,a5,1c76 <schedule_sjf+0x2e>
        }
    }

    if (shortest_thread == NULL) {
    1ce2:	fe843783          	ld	a5,-24(s0)
    1ce6:	e3c9                	bnez	a5,1d68 <schedule_sjf+0x120>
        int sleep_time = -1;
    1ce8:	57fd                	li	a5,-1
    1cea:	fcf42e23          	sw	a5,-36(s0)
        struct release_queue_entry *cur;
        list_for_each_entry(cur, args.release_queue, thread_list) {
    1cee:	689c                	ld	a5,16(s1)
    1cf0:	639c                	ld	a5,0(a5)
    1cf2:	f8f43c23          	sd	a5,-104(s0)
    1cf6:	f9843783          	ld	a5,-104(s0)
    1cfa:	17e1                	addi	a5,a5,-8
    1cfc:	fcf43823          	sd	a5,-48(s0)
    1d00:	a0a9                	j	1d4a <schedule_sjf+0x102>
            if (sleep_time < 0 || sleep_time < cur->release_time - args.current_time)
    1d02:	fdc42783          	lw	a5,-36(s0)
    1d06:	2781                	sext.w	a5,a5
    1d08:	0007cf63          	bltz	a5,1d26 <schedule_sjf+0xde>
    1d0c:	fd043783          	ld	a5,-48(s0)
    1d10:	4f98                	lw	a4,24(a5)
    1d12:	409c                	lw	a5,0(s1)
    1d14:	40f707bb          	subw	a5,a4,a5
    1d18:	0007871b          	sext.w	a4,a5
    1d1c:	fdc42783          	lw	a5,-36(s0)
    1d20:	2781                	sext.w	a5,a5
    1d22:	00e7da63          	bge	a5,a4,1d36 <schedule_sjf+0xee>
                sleep_time = cur->release_time - args.current_time;
    1d26:	fd043783          	ld	a5,-48(s0)
    1d2a:	4f98                	lw	a4,24(a5)
    1d2c:	409c                	lw	a5,0(s1)
    1d2e:	40f707bb          	subw	a5,a4,a5
    1d32:	fcf42e23          	sw	a5,-36(s0)
        list_for_each_entry(cur, args.release_queue, thread_list) {
    1d36:	fd043783          	ld	a5,-48(s0)
    1d3a:	679c                	ld	a5,8(a5)
    1d3c:	f8f43823          	sd	a5,-112(s0)
    1d40:	f9043783          	ld	a5,-112(s0)
    1d44:	17e1                	addi	a5,a5,-8
    1d46:	fcf43823          	sd	a5,-48(s0)
    1d4a:	fd043783          	ld	a5,-48(s0)
    1d4e:	00878713          	addi	a4,a5,8
    1d52:	689c                	ld	a5,16(s1)
    1d54:	faf717e3          	bne	a4,a5,1d02 <schedule_sjf+0xba>
        }
        return (struct threads_sched_result) { .scheduled_thread_list_member = args.run_queue, .allocated_time = sleep_time };
    1d58:	649c                	ld	a5,8(s1)
    1d5a:	f6f43c23          	sd	a5,-136(s0)
    1d5e:	fdc42783          	lw	a5,-36(s0)
    1d62:	f8f42023          	sw	a5,-128(s0)
    1d66:	a211                	j	1e6a <schedule_sjf+0x222>
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    1d68:	fe843783          	ld	a5,-24(s0)
    1d6c:	4fbc                	lw	a5,88(a5)
    1d6e:	fcf42223          	sw	a5,-60(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1d72:	689c                	ld	a5,16(s1)
    1d74:	639c                	ld	a5,0(a5)
    1d76:	faf43823          	sd	a5,-80(s0)
    1d7a:	fb043783          	ld	a5,-80(s0)
    1d7e:	17e1                	addi	a5,a5,-8
    1d80:	fcf43423          	sd	a5,-56(s0)
    1d84:	a0d1                	j	1e48 <schedule_sjf+0x200>
        int interval = cur->release_time - current_time;
    1d86:	fc843783          	ld	a5,-56(s0)
    1d8a:	4f98                	lw	a4,24(a5)
    1d8c:	fc042783          	lw	a5,-64(s0)
    1d90:	40f707bb          	subw	a5,a4,a5
    1d94:	faf42623          	sw	a5,-84(s0)
        if (interval > executing_time) continue;
    1d98:	fac42703          	lw	a4,-84(s0)
    1d9c:	fc442783          	lw	a5,-60(s0)
    1da0:	2701                	sext.w	a4,a4
    1da2:	2781                	sext.w	a5,a5
    1da4:	08e7c563          	blt	a5,a4,1e2e <schedule_sjf+0x1e6>
        if (current_time + shortest_thread->remaining_time < cur->release_time || interval > executing_time) continue; 
    1da8:	fe843783          	ld	a5,-24(s0)
    1dac:	4fbc                	lw	a5,88(a5)
    1dae:	fc042703          	lw	a4,-64(s0)
    1db2:	9fb9                	addw	a5,a5,a4
    1db4:	0007871b          	sext.w	a4,a5
    1db8:	fc843783          	ld	a5,-56(s0)
    1dbc:	4f9c                	lw	a5,24(a5)
    1dbe:	06f74a63          	blt	a4,a5,1e32 <schedule_sjf+0x1ea>
    1dc2:	fac42703          	lw	a4,-84(s0)
    1dc6:	fc442783          	lw	a5,-60(s0)
    1dca:	2701                	sext.w	a4,a4
    1dcc:	2781                	sext.w	a5,a5
    1dce:	06e7c263          	blt	a5,a4,1e32 <schedule_sjf+0x1ea>
        int remaining_time = shortest_thread->remaining_time - interval;
    1dd2:	fe843783          	ld	a5,-24(s0)
    1dd6:	4fb8                	lw	a4,88(a5)
    1dd8:	fac42783          	lw	a5,-84(s0)
    1ddc:	40f707bb          	subw	a5,a4,a5
    1de0:	faf42423          	sw	a5,-88(s0)
        if (remaining_time > cur->thrd->processing_time) {
    1de4:	fc843783          	ld	a5,-56(s0)
    1de8:	639c                	ld	a5,0(a5)
    1dea:	43f8                	lw	a4,68(a5)
    1dec:	fa842783          	lw	a5,-88(s0)
    1df0:	2781                	sext.w	a5,a5
    1df2:	00f75763          	bge	a4,a5,1e00 <schedule_sjf+0x1b8>
            executing_time = interval;
    1df6:	fac42783          	lw	a5,-84(s0)
    1dfa:	fcf42223          	sw	a5,-60(s0)
    1dfe:	a81d                	j	1e34 <schedule_sjf+0x1ec>
        }
        else if (remaining_time == cur->thrd->processing_time && shortest_thread->ID > cur->thrd->ID) {
    1e00:	fc843783          	ld	a5,-56(s0)
    1e04:	639c                	ld	a5,0(a5)
    1e06:	43f8                	lw	a4,68(a5)
    1e08:	fa842783          	lw	a5,-88(s0)
    1e0c:	2781                	sext.w	a5,a5
    1e0e:	02e79363          	bne	a5,a4,1e34 <schedule_sjf+0x1ec>
    1e12:	fe843783          	ld	a5,-24(s0)
    1e16:	5fd8                	lw	a4,60(a5)
    1e18:	fc843783          	ld	a5,-56(s0)
    1e1c:	639c                	ld	a5,0(a5)
    1e1e:	5fdc                	lw	a5,60(a5)
    1e20:	00e7da63          	bge	a5,a4,1e34 <schedule_sjf+0x1ec>
            executing_time = interval;
    1e24:	fac42783          	lw	a5,-84(s0)
    1e28:	fcf42223          	sw	a5,-60(s0)
    1e2c:	a021                	j	1e34 <schedule_sjf+0x1ec>
        if (interval > executing_time) continue;
    1e2e:	0001                	nop
    1e30:	a011                	j	1e34 <schedule_sjf+0x1ec>
        if (current_time + shortest_thread->remaining_time < cur->release_time || interval > executing_time) continue; 
    1e32:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1e34:	fc843783          	ld	a5,-56(s0)
    1e38:	679c                	ld	a5,8(a5)
    1e3a:	faf43023          	sd	a5,-96(s0)
    1e3e:	fa043783          	ld	a5,-96(s0)
    1e42:	17e1                	addi	a5,a5,-8
    1e44:	fcf43423          	sd	a5,-56(s0)
    1e48:	fc843783          	ld	a5,-56(s0)
    1e4c:	00878713          	addi	a4,a5,8
    1e50:	689c                	ld	a5,16(s1)
    1e52:	f2f71ae3          	bne	a4,a5,1d86 <schedule_sjf+0x13e>
        }
    }

    return (struct threads_sched_result) { .scheduled_thread_list_member = &shortest_thread->thread_list, .allocated_time = executing_time };
    1e56:	fe843783          	ld	a5,-24(s0)
    1e5a:	02878793          	addi	a5,a5,40
    1e5e:	f6f43c23          	sd	a5,-136(s0)
    1e62:	fc442783          	lw	a5,-60(s0)
    1e66:	f8f42023          	sw	a5,-128(s0)
    1e6a:	4701                	li	a4,0
    1e6c:	f7843703          	ld	a4,-136(s0)
    1e70:	4781                	li	a5,0
    1e72:	f8043783          	ld	a5,-128(s0)
    1e76:	863a                	mv	a2,a4
    1e78:	86be                	mv	a3,a5
    1e7a:	8732                	mv	a4,a2
    1e7c:	87b6                	mv	a5,a3
}
    1e7e:	853a                	mv	a0,a4
    1e80:	85be                	mv	a1,a5
    1e82:	742a                	ld	s0,168(sp)
    1e84:	748a                	ld	s1,160(sp)
    1e86:	614d                	addi	sp,sp,176
    1e88:	8082                	ret

0000000000001e8a <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    1e8a:	7131                	addi	sp,sp,-192
    1e8c:	fd22                	sd	s0,184(sp)
    1e8e:	f926                	sd	s1,176(sp)
    1e90:	0180                	addi	s0,sp,192
    1e92:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    int current_time = args.current_time;
    1e94:	409c                	lw	a5,0(s1)
    1e96:	fcf42023          	sw	a5,-64(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
    1e9a:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    1e9e:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1ea2:	649c                	ld	a5,8(s1)
    1ea4:	639c                	ld	a5,0(a5)
    1ea6:	faf43c23          	sd	a5,-72(s0)
    1eaa:	fb843783          	ld	a5,-72(s0)
    1eae:	fd878793          	addi	a5,a5,-40
    1eb2:	fef43023          	sd	a5,-32(s0)
    1eb6:	a855                	j	1f6a <schedule_lst+0xe0>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    1eb8:	fe043783          	ld	a5,-32(s0)
    1ebc:	4ff8                	lw	a4,92(a5)
    1ebe:	fc042783          	lw	a5,-64(s0)
    1ec2:	40f707bb          	subw	a5,a4,a5
    1ec6:	0007871b          	sext.w	a4,a5
    1eca:	fe043783          	ld	a5,-32(s0)
    1ece:	4fbc                	lw	a5,88(a5)
    1ed0:	40f707bb          	subw	a5,a4,a5
    1ed4:	f8f42223          	sw	a5,-124(s0)
        if (least_slack_thread == NULL || slack_time < least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time) {
    1ed8:	fe843783          	ld	a5,-24(s0)
    1edc:	c795                	beqz	a5,1f08 <schedule_lst+0x7e>
    1ede:	fe843783          	ld	a5,-24(s0)
    1ee2:	4ff8                	lw	a4,92(a5)
    1ee4:	fc042783          	lw	a5,-64(s0)
    1ee8:	40f707bb          	subw	a5,a4,a5
    1eec:	0007871b          	sext.w	a4,a5
    1ef0:	fe843783          	ld	a5,-24(s0)
    1ef4:	4fbc                	lw	a5,88(a5)
    1ef6:	40f707bb          	subw	a5,a4,a5
    1efa:	0007871b          	sext.w	a4,a5
    1efe:	f8442783          	lw	a5,-124(s0)
    1f02:	2781                	sext.w	a5,a5
    1f04:	00e7d763          	bge	a5,a4,1f12 <schedule_lst+0x88>
            least_slack_thread = th;
    1f08:	fe043783          	ld	a5,-32(s0)
    1f0c:	fef43423          	sd	a5,-24(s0)
    1f10:	a091                	j	1f54 <schedule_lst+0xca>
        }
        else if (slack_time == least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time && th->ID < least_slack_thread->ID) {
    1f12:	fe843783          	ld	a5,-24(s0)
    1f16:	4ff8                	lw	a4,92(a5)
    1f18:	fc042783          	lw	a5,-64(s0)
    1f1c:	40f707bb          	subw	a5,a4,a5
    1f20:	0007871b          	sext.w	a4,a5
    1f24:	fe843783          	ld	a5,-24(s0)
    1f28:	4fbc                	lw	a5,88(a5)
    1f2a:	40f707bb          	subw	a5,a4,a5
    1f2e:	0007871b          	sext.w	a4,a5
    1f32:	f8442783          	lw	a5,-124(s0)
    1f36:	2781                	sext.w	a5,a5
    1f38:	00e79e63          	bne	a5,a4,1f54 <schedule_lst+0xca>
    1f3c:	fe043783          	ld	a5,-32(s0)
    1f40:	5fd8                	lw	a4,60(a5)
    1f42:	fe843783          	ld	a5,-24(s0)
    1f46:	5fdc                	lw	a5,60(a5)
    1f48:	00f75663          	bge	a4,a5,1f54 <schedule_lst+0xca>
            least_slack_thread = th;
    1f4c:	fe043783          	ld	a5,-32(s0)
    1f50:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1f54:	fe043783          	ld	a5,-32(s0)
    1f58:	779c                	ld	a5,40(a5)
    1f5a:	f6f43c23          	sd	a5,-136(s0)
    1f5e:	f7843783          	ld	a5,-136(s0)
    1f62:	fd878793          	addi	a5,a5,-40
    1f66:	fef43023          	sd	a5,-32(s0)
    1f6a:	fe043783          	ld	a5,-32(s0)
    1f6e:	02878713          	addi	a4,a5,40
    1f72:	649c                	ld	a5,8(s1)
    1f74:	f4f712e3          	bne	a4,a5,1eb8 <schedule_lst+0x2e>
        }
    }

    if (least_slack_thread == NULL) {
    1f78:	fe843783          	ld	a5,-24(s0)
    1f7c:	e3c9                	bnez	a5,1ffe <schedule_lst+0x174>
        int sleep_time = -1;
    1f7e:	57fd                	li	a5,-1
    1f80:	fcf42e23          	sw	a5,-36(s0)
        struct release_queue_entry *cur;
        list_for_each_entry(cur, args.release_queue, thread_list) {
    1f84:	689c                	ld	a5,16(s1)
    1f86:	639c                	ld	a5,0(a5)
    1f88:	f8f43823          	sd	a5,-112(s0)
    1f8c:	f9043783          	ld	a5,-112(s0)
    1f90:	17e1                	addi	a5,a5,-8
    1f92:	fcf43823          	sd	a5,-48(s0)
    1f96:	a0a9                	j	1fe0 <schedule_lst+0x156>
            if (sleep_time < 0 || sleep_time < cur->release_time - args.current_time)
    1f98:	fdc42783          	lw	a5,-36(s0)
    1f9c:	2781                	sext.w	a5,a5
    1f9e:	0007cf63          	bltz	a5,1fbc <schedule_lst+0x132>
    1fa2:	fd043783          	ld	a5,-48(s0)
    1fa6:	4f98                	lw	a4,24(a5)
    1fa8:	409c                	lw	a5,0(s1)
    1faa:	40f707bb          	subw	a5,a4,a5
    1fae:	0007871b          	sext.w	a4,a5
    1fb2:	fdc42783          	lw	a5,-36(s0)
    1fb6:	2781                	sext.w	a5,a5
    1fb8:	00e7da63          	bge	a5,a4,1fcc <schedule_lst+0x142>
                sleep_time = cur->release_time - args.current_time;
    1fbc:	fd043783          	ld	a5,-48(s0)
    1fc0:	4f98                	lw	a4,24(a5)
    1fc2:	409c                	lw	a5,0(s1)
    1fc4:	40f707bb          	subw	a5,a4,a5
    1fc8:	fcf42e23          	sw	a5,-36(s0)
        list_for_each_entry(cur, args.release_queue, thread_list) {
    1fcc:	fd043783          	ld	a5,-48(s0)
    1fd0:	679c                	ld	a5,8(a5)
    1fd2:	f8f43423          	sd	a5,-120(s0)
    1fd6:	f8843783          	ld	a5,-120(s0)
    1fda:	17e1                	addi	a5,a5,-8
    1fdc:	fcf43823          	sd	a5,-48(s0)
    1fe0:	fd043783          	ld	a5,-48(s0)
    1fe4:	00878713          	addi	a4,a5,8
    1fe8:	689c                	ld	a5,16(s1)
    1fea:	faf717e3          	bne	a4,a5,1f98 <schedule_lst+0x10e>
        }
        return (struct threads_sched_result) { .scheduled_thread_list_member = args.run_queue, .allocated_time = sleep_time };
    1fee:	649c                	ld	a5,8(s1)
    1ff0:	f6f43423          	sd	a5,-152(s0)
    1ff4:	fdc42783          	lw	a5,-36(s0)
    1ff8:	f6f42823          	sw	a5,-144(s0)
    1ffc:	a8e5                	j	20f4 <schedule_lst+0x26a>
    }

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    1ffe:	fe843783          	ld	a5,-24(s0)
    2002:	4ff8                	lw	a4,92(a5)
    2004:	fc042783          	lw	a5,-64(s0)
    2008:	40f707bb          	subw	a5,a4,a5
    200c:	0007871b          	sext.w	a4,a5
    2010:	fe843783          	ld	a5,-24(s0)
    2014:	4fbc                	lw	a5,88(a5)
    2016:	40f707bb          	subw	a5,a4,a5
    201a:	faf42a23          	sw	a5,-76(s0)
    int executing_time = least_slack_thread->remaining_time;
    201e:	fe843783          	ld	a5,-24(s0)
    2022:	4fbc                	lw	a5,88(a5)
    2024:	fcf42223          	sw	a5,-60(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    2028:	689c                	ld	a5,16(s1)
    202a:	639c                	ld	a5,0(a5)
    202c:	faf43423          	sd	a5,-88(s0)
    2030:	fa843783          	ld	a5,-88(s0)
    2034:	17e1                	addi	a5,a5,-8
    2036:	fcf43423          	sd	a5,-56(s0)
    203a:	a861                	j	20d2 <schedule_lst+0x248>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->remaining_time;
    203c:	fc843783          	ld	a5,-56(s0)
    2040:	639c                	ld	a5,0(a5)
    2042:	47f8                	lw	a4,76(a5)
    2044:	fc843783          	ld	a5,-56(s0)
    2048:	639c                	ld	a5,0(a5)
    204a:	4fbc                	lw	a5,88(a5)
    204c:	40f707bb          	subw	a5,a4,a5
    2050:	faf42223          	sw	a5,-92(s0)
        int interval = cur->release_time - current_time;
    2054:	fc843783          	ld	a5,-56(s0)
    2058:	4f98                	lw	a4,24(a5)
    205a:	fc042783          	lw	a5,-64(s0)
    205e:	40f707bb          	subw	a5,a4,a5
    2062:	faf42023          	sw	a5,-96(s0)
        if (interval > executing_time) continue;
    2066:	fa042703          	lw	a4,-96(s0)
    206a:	fc442783          	lw	a5,-60(s0)
    206e:	2701                	sext.w	a4,a4
    2070:	2781                	sext.w	a5,a5
    2072:	04e7c563          	blt	a5,a4,20bc <schedule_lst+0x232>
        if (slack_time > cur_slack_time) {
    2076:	fb442703          	lw	a4,-76(s0)
    207a:	fa442783          	lw	a5,-92(s0)
    207e:	2701                	sext.w	a4,a4
    2080:	2781                	sext.w	a5,a5
    2082:	00e7d763          	bge	a5,a4,2090 <schedule_lst+0x206>
            executing_time = interval;
    2086:	fa042783          	lw	a5,-96(s0)
    208a:	fcf42223          	sw	a5,-60(s0)
    208e:	a805                	j	20be <schedule_lst+0x234>
        }
        else if (slack_time == cur_slack_time && least_slack_thread->ID>cur->thrd->ID) {
    2090:	fb442703          	lw	a4,-76(s0)
    2094:	fa442783          	lw	a5,-92(s0)
    2098:	2701                	sext.w	a4,a4
    209a:	2781                	sext.w	a5,a5
    209c:	02f71163          	bne	a4,a5,20be <schedule_lst+0x234>
    20a0:	fe843783          	ld	a5,-24(s0)
    20a4:	5fd8                	lw	a4,60(a5)
    20a6:	fc843783          	ld	a5,-56(s0)
    20aa:	639c                	ld	a5,0(a5)
    20ac:	5fdc                	lw	a5,60(a5)
    20ae:	00e7d863          	bge	a5,a4,20be <schedule_lst+0x234>
            executing_time = interval;
    20b2:	fa042783          	lw	a5,-96(s0)
    20b6:	fcf42223          	sw	a5,-60(s0)
    20ba:	a011                	j	20be <schedule_lst+0x234>
        if (interval > executing_time) continue;
    20bc:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    20be:	fc843783          	ld	a5,-56(s0)
    20c2:	679c                	ld	a5,8(a5)
    20c4:	f8f43c23          	sd	a5,-104(s0)
    20c8:	f9843783          	ld	a5,-104(s0)
    20cc:	17e1                	addi	a5,a5,-8
    20ce:	fcf43423          	sd	a5,-56(s0)
    20d2:	fc843783          	ld	a5,-56(s0)
    20d6:	00878713          	addi	a4,a5,8
    20da:	689c                	ld	a5,16(s1)
    20dc:	f6f710e3          	bne	a4,a5,203c <schedule_lst+0x1b2>
        }
    }
    return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = executing_time };
    20e0:	fe843783          	ld	a5,-24(s0)
    20e4:	02878793          	addi	a5,a5,40
    20e8:	f6f43423          	sd	a5,-152(s0)
    20ec:	fc442783          	lw	a5,-60(s0)
    20f0:	f6f42823          	sw	a5,-144(s0)
    20f4:	4701                	li	a4,0
    20f6:	f6843703          	ld	a4,-152(s0)
    20fa:	4781                	li	a5,0
    20fc:	f7043783          	ld	a5,-144(s0)
    2100:	863a                	mv	a2,a4
    2102:	86be                	mv	a3,a5
    2104:	8732                	mv	a4,a2
    2106:	87b6                	mv	a5,a3
}
    2108:	853a                	mv	a0,a4
    210a:	85be                	mv	a1,a5
    210c:	746a                	ld	s0,184(sp)
    210e:	74ca                	ld	s1,176(sp)
    2110:	6129                	addi	sp,sp,192
    2112:	8082                	ret

0000000000002114 <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    2114:	7131                	addi	sp,sp,-192
    2116:	fd22                	sd	s0,184(sp)
    2118:	f926                	sd	s1,176(sp)
    211a:	0180                	addi	s0,sp,192
    211c:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.
    int current_time = args.current_time;
    211e:	409c                	lw	a5,0(s1)
    2120:	fcf42023          	sw	a5,-64(s0)

    struct thread *highest_priority_thread = NULL;
    2124:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    2128:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    212c:	649c                	ld	a5,8(s1)
    212e:	639c                	ld	a5,0(a5)
    2130:	faf43c23          	sd	a5,-72(s0)
    2134:	fb843783          	ld	a5,-72(s0)
    2138:	fd878793          	addi	a5,a5,-40
    213c:	fef43023          	sd	a5,-32(s0)
    2140:	a085                	j	21a0 <schedule_dm+0x8c>
        if (highest_priority_thread == NULL || th->deadline < highest_priority_thread->deadline) {
    2142:	fe843783          	ld	a5,-24(s0)
    2146:	cb89                	beqz	a5,2158 <schedule_dm+0x44>
    2148:	fe043783          	ld	a5,-32(s0)
    214c:	47f8                	lw	a4,76(a5)
    214e:	fe843783          	ld	a5,-24(s0)
    2152:	47fc                	lw	a5,76(a5)
    2154:	00f75763          	bge	a4,a5,2162 <schedule_dm+0x4e>
            highest_priority_thread = th;
    2158:	fe043783          	ld	a5,-32(s0)
    215c:	fef43423          	sd	a5,-24(s0)
    2160:	a02d                	j	218a <schedule_dm+0x76>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    2162:	fe043783          	ld	a5,-32(s0)
    2166:	47f8                	lw	a4,76(a5)
    2168:	fe843783          	ld	a5,-24(s0)
    216c:	47fc                	lw	a5,76(a5)
    216e:	00f71e63          	bne	a4,a5,218a <schedule_dm+0x76>
    2172:	fe043783          	ld	a5,-32(s0)
    2176:	5fd8                	lw	a4,60(a5)
    2178:	fe843783          	ld	a5,-24(s0)
    217c:	5fdc                	lw	a5,60(a5)
    217e:	00f75663          	bge	a4,a5,218a <schedule_dm+0x76>
            highest_priority_thread = th;
    2182:	fe043783          	ld	a5,-32(s0)
    2186:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    218a:	fe043783          	ld	a5,-32(s0)
    218e:	779c                	ld	a5,40(a5)
    2190:	f8f43423          	sd	a5,-120(s0)
    2194:	f8843783          	ld	a5,-120(s0)
    2198:	fd878793          	addi	a5,a5,-40
    219c:	fef43023          	sd	a5,-32(s0)
    21a0:	fe043783          	ld	a5,-32(s0)
    21a4:	02878713          	addi	a4,a5,40
    21a8:	649c                	ld	a5,8(s1)
    21aa:	f8f71ce3          	bne	a4,a5,2142 <schedule_dm+0x2e>
        }
    }
    
    if (highest_priority_thread == NULL) {
    21ae:	fe843783          	ld	a5,-24(s0)
    21b2:	e3d9                	bnez	a5,2238 <schedule_dm+0x124>
        int sleep_time = -1;
    21b4:	57fd                	li	a5,-1
    21b6:	fcf42e23          	sw	a5,-36(s0)
        struct release_queue_entry *cur;
        list_for_each_entry(cur, args.release_queue, thread_list) {
    21ba:	689c                	ld	a5,16(s1)
    21bc:	639c                	ld	a5,0(a5)
    21be:	f8f43c23          	sd	a5,-104(s0)
    21c2:	f9843783          	ld	a5,-104(s0)
    21c6:	17e1                	addi	a5,a5,-8
    21c8:	fcf43823          	sd	a5,-48(s0)
    21cc:	a0b9                	j	221a <schedule_dm+0x106>
            if (sleep_time < 0 || sleep_time < cur->release_time - current_time)
    21ce:	fdc42783          	lw	a5,-36(s0)
    21d2:	2781                	sext.w	a5,a5
    21d4:	0207c063          	bltz	a5,21f4 <schedule_dm+0xe0>
    21d8:	fd043783          	ld	a5,-48(s0)
    21dc:	4f98                	lw	a4,24(a5)
    21de:	fc042783          	lw	a5,-64(s0)
    21e2:	40f707bb          	subw	a5,a4,a5
    21e6:	0007871b          	sext.w	a4,a5
    21ea:	fdc42783          	lw	a5,-36(s0)
    21ee:	2781                	sext.w	a5,a5
    21f0:	00e7db63          	bge	a5,a4,2206 <schedule_dm+0xf2>
                sleep_time = cur->release_time - current_time;
    21f4:	fd043783          	ld	a5,-48(s0)
    21f8:	4f98                	lw	a4,24(a5)
    21fa:	fc042783          	lw	a5,-64(s0)
    21fe:	40f707bb          	subw	a5,a4,a5
    2202:	fcf42e23          	sw	a5,-36(s0)
        list_for_each_entry(cur, args.release_queue, thread_list) {
    2206:	fd043783          	ld	a5,-48(s0)
    220a:	679c                	ld	a5,8(a5)
    220c:	f8f43823          	sd	a5,-112(s0)
    2210:	f9043783          	ld	a5,-112(s0)
    2214:	17e1                	addi	a5,a5,-8
    2216:	fcf43823          	sd	a5,-48(s0)
    221a:	fd043783          	ld	a5,-48(s0)
    221e:	00878713          	addi	a4,a5,8
    2222:	689c                	ld	a5,16(s1)
    2224:	faf715e3          	bne	a4,a5,21ce <schedule_dm+0xba>
        }
        return (struct threads_sched_result) { .scheduled_thread_list_member = args.run_queue, .allocated_time = sleep_time };
    2228:	649c                	ld	a5,8(s1)
    222a:	f6f43c23          	sd	a5,-136(s0)
    222e:	fdc42783          	lw	a5,-36(s0)
    2232:	f8f42023          	sw	a5,-128(s0)
    2236:	a8cd                	j	2328 <schedule_dm+0x214>
    }

    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) {
    2238:	fe843783          	ld	a5,-24(s0)
    223c:	4fac                	lw	a1,88(a5)
    223e:	fe843783          	ld	a5,-24(s0)
    2242:	4ff8                	lw	a4,92(a5)
    2244:	fc042783          	lw	a5,-64(s0)
    2248:	40f707bb          	subw	a5,a4,a5
    224c:	2781                	sext.w	a5,a5
    224e:	872e                	mv	a4,a1
    2250:	00e7db63          	bge	a5,a4,2266 <schedule_dm+0x152>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    2254:	fe843783          	ld	a5,-24(s0)
    2258:	02878793          	addi	a5,a5,40
    225c:	f6f43c23          	sd	a5,-136(s0)
    2260:	f8042023          	sw	zero,-128(s0)
    2264:	a0d1                	j	2328 <schedule_dm+0x214>
    }

    struct release_queue_entry *cur;
    int executing_time = highest_priority_thread->remaining_time;
    2266:	fe843783          	ld	a5,-24(s0)
    226a:	4fbc                	lw	a5,88(a5)
    226c:	fcf42223          	sw	a5,-60(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    2270:	689c                	ld	a5,16(s1)
    2272:	639c                	ld	a5,0(a5)
    2274:	faf43823          	sd	a5,-80(s0)
    2278:	fb043783          	ld	a5,-80(s0)
    227c:	17e1                	addi	a5,a5,-8
    227e:	fcf43423          	sd	a5,-56(s0)
    2282:	a051                	j	2306 <schedule_dm+0x1f2>
        int interval = cur->release_time - current_time;
    2284:	fc843783          	ld	a5,-56(s0)
    2288:	4f98                	lw	a4,24(a5)
    228a:	fc042783          	lw	a5,-64(s0)
    228e:	40f707bb          	subw	a5,a4,a5
    2292:	faf42623          	sw	a5,-84(s0)
        if (interval > executing_time) continue;
    2296:	fac42703          	lw	a4,-84(s0)
    229a:	fc442783          	lw	a5,-60(s0)
    229e:	2701                	sext.w	a4,a4
    22a0:	2781                	sext.w	a5,a5
    22a2:	04e7c763          	blt	a5,a4,22f0 <schedule_dm+0x1dc>
        if (highest_priority_thread->deadline > cur->thrd->deadline) {
    22a6:	fe843783          	ld	a5,-24(s0)
    22aa:	47f8                	lw	a4,76(a5)
    22ac:	fc843783          	ld	a5,-56(s0)
    22b0:	639c                	ld	a5,0(a5)
    22b2:	47fc                	lw	a5,76(a5)
    22b4:	00e7d763          	bge	a5,a4,22c2 <schedule_dm+0x1ae>
            executing_time = interval;
    22b8:	fac42783          	lw	a5,-84(s0)
    22bc:	fcf42223          	sw	a5,-60(s0)
    22c0:	a80d                	j	22f2 <schedule_dm+0x1de>
        }
        else if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID > cur->thrd->ID) {
    22c2:	fe843783          	ld	a5,-24(s0)
    22c6:	47f8                	lw	a4,76(a5)
    22c8:	fc843783          	ld	a5,-56(s0)
    22cc:	639c                	ld	a5,0(a5)
    22ce:	47fc                	lw	a5,76(a5)
    22d0:	02f71163          	bne	a4,a5,22f2 <schedule_dm+0x1de>
    22d4:	fe843783          	ld	a5,-24(s0)
    22d8:	5fd8                	lw	a4,60(a5)
    22da:	fc843783          	ld	a5,-56(s0)
    22de:	639c                	ld	a5,0(a5)
    22e0:	5fdc                	lw	a5,60(a5)
    22e2:	00e7d863          	bge	a5,a4,22f2 <schedule_dm+0x1de>
            executing_time = interval;
    22e6:	fac42783          	lw	a5,-84(s0)
    22ea:	fcf42223          	sw	a5,-60(s0)
    22ee:	a011                	j	22f2 <schedule_dm+0x1de>
        if (interval > executing_time) continue;
    22f0:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    22f2:	fc843783          	ld	a5,-56(s0)
    22f6:	679c                	ld	a5,8(a5)
    22f8:	faf43023          	sd	a5,-96(s0)
    22fc:	fa043783          	ld	a5,-96(s0)
    2300:	17e1                	addi	a5,a5,-8
    2302:	fcf43423          	sd	a5,-56(s0)
    2306:	fc843783          	ld	a5,-56(s0)
    230a:	00878713          	addi	a4,a5,8
    230e:	689c                	ld	a5,16(s1)
    2310:	f6f71ae3          	bne	a4,a5,2284 <schedule_dm+0x170>
        }
    }
    
    return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = executing_time };
    2314:	fe843783          	ld	a5,-24(s0)
    2318:	02878793          	addi	a5,a5,40
    231c:	f6f43c23          	sd	a5,-136(s0)
    2320:	fc442783          	lw	a5,-60(s0)
    2324:	f8f42023          	sw	a5,-128(s0)
    2328:	4701                	li	a4,0
    232a:	f7843703          	ld	a4,-136(s0)
    232e:	4781                	li	a5,0
    2330:	f8043783          	ld	a5,-128(s0)
    2334:	863a                	mv	a2,a4
    2336:	86be                	mv	a3,a5
    2338:	8732                	mv	a4,a2
    233a:	87b6                	mv	a5,a3
}
    233c:	853a                	mv	a0,a4
    233e:	85be                	mv	a1,a5
    2340:	746a                	ld	s0,184(sp)
    2342:	74ca                	ld	s1,176(sp)
    2344:	6129                	addi	sp,sp,192
    2346:	8082                	ret
