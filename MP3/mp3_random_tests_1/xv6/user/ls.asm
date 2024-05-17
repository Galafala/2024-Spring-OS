
user/_ls:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "user/user.h"
#include "kernel/fs.h"

char*
fmtname(char *path)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	f426                	sd	s1,40(sp)
       8:	0080                	addi	s0,sp,64
       a:	fca43423          	sd	a0,-56(s0)
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
       e:	fc843503          	ld	a0,-56(s0)
      12:	00000097          	auipc	ra,0x0
      16:	42e080e7          	jalr	1070(ra) # 440 <strlen>
      1a:	87aa                	mv	a5,a0
      1c:	2781                	sext.w	a5,a5
      1e:	1782                	slli	a5,a5,0x20
      20:	9381                	srli	a5,a5,0x20
      22:	fc843703          	ld	a4,-56(s0)
      26:	97ba                	add	a5,a5,a4
      28:	fcf43c23          	sd	a5,-40(s0)
      2c:	a031                	j	38 <fmtname+0x38>
      2e:	fd843783          	ld	a5,-40(s0)
      32:	17fd                	addi	a5,a5,-1
      34:	fcf43c23          	sd	a5,-40(s0)
      38:	fd843703          	ld	a4,-40(s0)
      3c:	fc843783          	ld	a5,-56(s0)
      40:	00f76b63          	bltu	a4,a5,56 <fmtname+0x56>
      44:	fd843783          	ld	a5,-40(s0)
      48:	0007c783          	lbu	a5,0(a5)
      4c:	873e                	mv	a4,a5
      4e:	02f00793          	li	a5,47
      52:	fcf71ee3          	bne	a4,a5,2e <fmtname+0x2e>
    ;
  p++;
      56:	fd843783          	ld	a5,-40(s0)
      5a:	0785                	addi	a5,a5,1
      5c:	fcf43c23          	sd	a5,-40(s0)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
      60:	fd843503          	ld	a0,-40(s0)
      64:	00000097          	auipc	ra,0x0
      68:	3dc080e7          	jalr	988(ra) # 440 <strlen>
      6c:	87aa                	mv	a5,a0
      6e:	2781                	sext.w	a5,a5
      70:	873e                	mv	a4,a5
      72:	47b5                	li	a5,13
      74:	00e7f563          	bgeu	a5,a4,7e <fmtname+0x7e>
    return p;
      78:	fd843783          	ld	a5,-40(s0)
      7c:	a8b5                	j	f8 <fmtname+0xf8>
  memmove(buf, p, strlen(p));
      7e:	fd843503          	ld	a0,-40(s0)
      82:	00000097          	auipc	ra,0x0
      86:	3be080e7          	jalr	958(ra) # 440 <strlen>
      8a:	87aa                	mv	a5,a0
      8c:	2781                	sext.w	a5,a5
      8e:	2781                	sext.w	a5,a5
      90:	863e                	mv	a2,a5
      92:	fd843583          	ld	a1,-40(s0)
      96:	00002517          	auipc	a0,0x2
      9a:	b7250513          	addi	a0,a0,-1166 # 1c08 <buf.1118>
      9e:	00000097          	auipc	ra,0x0
      a2:	5fc080e7          	jalr	1532(ra) # 69a <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      a6:	fd843503          	ld	a0,-40(s0)
      aa:	00000097          	auipc	ra,0x0
      ae:	396080e7          	jalr	918(ra) # 440 <strlen>
      b2:	87aa                	mv	a5,a0
      b4:	2781                	sext.w	a5,a5
      b6:	02079713          	slli	a4,a5,0x20
      ba:	9301                	srli	a4,a4,0x20
      bc:	00002797          	auipc	a5,0x2
      c0:	b4c78793          	addi	a5,a5,-1204 # 1c08 <buf.1118>
      c4:	00f704b3          	add	s1,a4,a5
      c8:	fd843503          	ld	a0,-40(s0)
      cc:	00000097          	auipc	ra,0x0
      d0:	374080e7          	jalr	884(ra) # 440 <strlen>
      d4:	87aa                	mv	a5,a0
      d6:	2781                	sext.w	a5,a5
      d8:	4739                	li	a4,14
      da:	40f707bb          	subw	a5,a4,a5
      de:	2781                	sext.w	a5,a5
      e0:	863e                	mv	a2,a5
      e2:	02000593          	li	a1,32
      e6:	8526                	mv	a0,s1
      e8:	00000097          	auipc	ra,0x0
      ec:	38e080e7          	jalr	910(ra) # 476 <memset>
  return buf;
      f0:	00002797          	auipc	a5,0x2
      f4:	b1878793          	addi	a5,a5,-1256 # 1c08 <buf.1118>
}
      f8:	853e                	mv	a0,a5
      fa:	70e2                	ld	ra,56(sp)
      fc:	7442                	ld	s0,48(sp)
      fe:	74a2                	ld	s1,40(sp)
     100:	6121                	addi	sp,sp,64
     102:	8082                	ret

0000000000000104 <ls>:

void
ls(char *path)
{
     104:	da010113          	addi	sp,sp,-608
     108:	24113c23          	sd	ra,600(sp)
     10c:	24813823          	sd	s0,592(sp)
     110:	1480                	addi	s0,sp,608
     112:	daa43423          	sd	a0,-600(s0)
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
     116:	4581                	li	a1,0
     118:	da843503          	ld	a0,-600(s0)
     11c:	00000097          	auipc	ra,0x0
     120:	744080e7          	jalr	1860(ra) # 860 <open>
     124:	87aa                	mv	a5,a0
     126:	fef42623          	sw	a5,-20(s0)
     12a:	fec42783          	lw	a5,-20(s0)
     12e:	2781                	sext.w	a5,a5
     130:	0007de63          	bgez	a5,14c <ls+0x48>
    fprintf(2, "ls: cannot open %s\n", path);
     134:	da843603          	ld	a2,-600(s0)
     138:	00002597          	auipc	a1,0x2
     13c:	a4058593          	addi	a1,a1,-1472 # 1b78 <schedule_dm+0x28c>
     140:	4509                	li	a0,2
     142:	00001097          	auipc	ra,0x1
     146:	bcc080e7          	jalr	-1076(ra) # d0e <fprintf>
    return;
     14a:	aa6d                	j	304 <ls+0x200>
  }

  if(fstat(fd, &st) < 0){
     14c:	db840713          	addi	a4,s0,-584
     150:	fec42783          	lw	a5,-20(s0)
     154:	85ba                	mv	a1,a4
     156:	853e                	mv	a0,a5
     158:	00000097          	auipc	ra,0x0
     15c:	720080e7          	jalr	1824(ra) # 878 <fstat>
     160:	87aa                	mv	a5,a0
     162:	0207d563          	bgez	a5,18c <ls+0x88>
    fprintf(2, "ls: cannot stat %s\n", path);
     166:	da843603          	ld	a2,-600(s0)
     16a:	00002597          	auipc	a1,0x2
     16e:	a2658593          	addi	a1,a1,-1498 # 1b90 <schedule_dm+0x2a4>
     172:	4509                	li	a0,2
     174:	00001097          	auipc	ra,0x1
     178:	b9a080e7          	jalr	-1126(ra) # d0e <fprintf>
    close(fd);
     17c:	fec42783          	lw	a5,-20(s0)
     180:	853e                	mv	a0,a5
     182:	00000097          	auipc	ra,0x0
     186:	6c6080e7          	jalr	1734(ra) # 848 <close>
    return;
     18a:	aaad                	j	304 <ls+0x200>
  }

  switch(st.type){
     18c:	dc041783          	lh	a5,-576(s0)
     190:	0007871b          	sext.w	a4,a5
     194:	86ba                	mv	a3,a4
     196:	4785                	li	a5,1
     198:	02f68d63          	beq	a3,a5,1d2 <ls+0xce>
     19c:	4789                	li	a5,2
     19e:	14f71c63          	bne	a4,a5,2f6 <ls+0x1f2>
  case T_FILE:
    printf("%s %d %d %l\n", fmtname(path), st.type, st.ino, st.size);
     1a2:	da843503          	ld	a0,-600(s0)
     1a6:	00000097          	auipc	ra,0x0
     1aa:	e5a080e7          	jalr	-422(ra) # 0 <fmtname>
     1ae:	85aa                	mv	a1,a0
     1b0:	dc041783          	lh	a5,-576(s0)
     1b4:	2781                	sext.w	a5,a5
     1b6:	dbc42683          	lw	a3,-580(s0)
     1ba:	dc843703          	ld	a4,-568(s0)
     1be:	863e                	mv	a2,a5
     1c0:	00002517          	auipc	a0,0x2
     1c4:	9e850513          	addi	a0,a0,-1560 # 1ba8 <schedule_dm+0x2bc>
     1c8:	00001097          	auipc	ra,0x1
     1cc:	b9e080e7          	jalr	-1122(ra) # d66 <printf>
    break;
     1d0:	a21d                	j	2f6 <ls+0x1f2>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     1d2:	da843503          	ld	a0,-600(s0)
     1d6:	00000097          	auipc	ra,0x0
     1da:	26a080e7          	jalr	618(ra) # 440 <strlen>
     1de:	87aa                	mv	a5,a0
     1e0:	2781                	sext.w	a5,a5
     1e2:	27c1                	addiw	a5,a5,16
     1e4:	2781                	sext.w	a5,a5
     1e6:	873e                	mv	a4,a5
     1e8:	20000793          	li	a5,512
     1ec:	00e7fb63          	bgeu	a5,a4,202 <ls+0xfe>
      printf("ls: path too long\n");
     1f0:	00002517          	auipc	a0,0x2
     1f4:	9c850513          	addi	a0,a0,-1592 # 1bb8 <schedule_dm+0x2cc>
     1f8:	00001097          	auipc	ra,0x1
     1fc:	b6e080e7          	jalr	-1170(ra) # d66 <printf>
      break;
     200:	a8dd                	j	2f6 <ls+0x1f2>
    }
    strcpy(buf, path);
     202:	de040793          	addi	a5,s0,-544
     206:	da843583          	ld	a1,-600(s0)
     20a:	853e                	mv	a0,a5
     20c:	00000097          	auipc	ra,0x0
     210:	184080e7          	jalr	388(ra) # 390 <strcpy>
    p = buf+strlen(buf);
     214:	de040793          	addi	a5,s0,-544
     218:	853e                	mv	a0,a5
     21a:	00000097          	auipc	ra,0x0
     21e:	226080e7          	jalr	550(ra) # 440 <strlen>
     222:	87aa                	mv	a5,a0
     224:	2781                	sext.w	a5,a5
     226:	1782                	slli	a5,a5,0x20
     228:	9381                	srli	a5,a5,0x20
     22a:	de040713          	addi	a4,s0,-544
     22e:	97ba                	add	a5,a5,a4
     230:	fef43023          	sd	a5,-32(s0)
    *p++ = '/';
     234:	fe043783          	ld	a5,-32(s0)
     238:	00178713          	addi	a4,a5,1
     23c:	fee43023          	sd	a4,-32(s0)
     240:	02f00713          	li	a4,47
     244:	00e78023          	sb	a4,0(a5)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     248:	a071                	j	2d4 <ls+0x1d0>
      if(de.inum == 0)
     24a:	dd045783          	lhu	a5,-560(s0)
     24e:	e391                	bnez	a5,252 <ls+0x14e>
        continue;
     250:	a051                	j	2d4 <ls+0x1d0>
      memmove(p, de.name, DIRSIZ);
     252:	dd040793          	addi	a5,s0,-560
     256:	0789                	addi	a5,a5,2
     258:	4639                	li	a2,14
     25a:	85be                	mv	a1,a5
     25c:	fe043503          	ld	a0,-32(s0)
     260:	00000097          	auipc	ra,0x0
     264:	43a080e7          	jalr	1082(ra) # 69a <memmove>
      p[DIRSIZ] = 0;
     268:	fe043783          	ld	a5,-32(s0)
     26c:	07b9                	addi	a5,a5,14
     26e:	00078023          	sb	zero,0(a5)
      if(stat(buf, &st) < 0){
     272:	db840713          	addi	a4,s0,-584
     276:	de040793          	addi	a5,s0,-544
     27a:	85ba                	mv	a1,a4
     27c:	853e                	mv	a0,a5
     27e:	00000097          	auipc	ra,0x0
     282:	344080e7          	jalr	836(ra) # 5c2 <stat>
     286:	87aa                	mv	a5,a0
     288:	0007de63          	bgez	a5,2a4 <ls+0x1a0>
        printf("ls: cannot stat %s\n", buf);
     28c:	de040793          	addi	a5,s0,-544
     290:	85be                	mv	a1,a5
     292:	00002517          	auipc	a0,0x2
     296:	8fe50513          	addi	a0,a0,-1794 # 1b90 <schedule_dm+0x2a4>
     29a:	00001097          	auipc	ra,0x1
     29e:	acc080e7          	jalr	-1332(ra) # d66 <printf>
        continue;
     2a2:	a80d                	j	2d4 <ls+0x1d0>
      }
      printf("%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     2a4:	de040793          	addi	a5,s0,-544
     2a8:	853e                	mv	a0,a5
     2aa:	00000097          	auipc	ra,0x0
     2ae:	d56080e7          	jalr	-682(ra) # 0 <fmtname>
     2b2:	85aa                	mv	a1,a0
     2b4:	dc041783          	lh	a5,-576(s0)
     2b8:	2781                	sext.w	a5,a5
     2ba:	dbc42683          	lw	a3,-580(s0)
     2be:	dc843703          	ld	a4,-568(s0)
     2c2:	863e                	mv	a2,a5
     2c4:	00002517          	auipc	a0,0x2
     2c8:	90c50513          	addi	a0,a0,-1780 # 1bd0 <schedule_dm+0x2e4>
     2cc:	00001097          	auipc	ra,0x1
     2d0:	a9a080e7          	jalr	-1382(ra) # d66 <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     2d4:	dd040713          	addi	a4,s0,-560
     2d8:	fec42783          	lw	a5,-20(s0)
     2dc:	4641                	li	a2,16
     2de:	85ba                	mv	a1,a4
     2e0:	853e                	mv	a0,a5
     2e2:	00000097          	auipc	ra,0x0
     2e6:	556080e7          	jalr	1366(ra) # 838 <read>
     2ea:	87aa                	mv	a5,a0
     2ec:	873e                	mv	a4,a5
     2ee:	47c1                	li	a5,16
     2f0:	f4f70de3          	beq	a4,a5,24a <ls+0x146>
    }
    break;
     2f4:	0001                	nop
  }
  close(fd);
     2f6:	fec42783          	lw	a5,-20(s0)
     2fa:	853e                	mv	a0,a5
     2fc:	00000097          	auipc	ra,0x0
     300:	54c080e7          	jalr	1356(ra) # 848 <close>
}
     304:	25813083          	ld	ra,600(sp)
     308:	25013403          	ld	s0,592(sp)
     30c:	26010113          	addi	sp,sp,608
     310:	8082                	ret

0000000000000312 <main>:

int
main(int argc, char *argv[])
{
     312:	7179                	addi	sp,sp,-48
     314:	f406                	sd	ra,40(sp)
     316:	f022                	sd	s0,32(sp)
     318:	1800                	addi	s0,sp,48
     31a:	87aa                	mv	a5,a0
     31c:	fcb43823          	sd	a1,-48(s0)
     320:	fcf42e23          	sw	a5,-36(s0)
  int i;

  if(argc < 2){
     324:	fdc42783          	lw	a5,-36(s0)
     328:	0007871b          	sext.w	a4,a5
     32c:	4785                	li	a5,1
     32e:	00e7cf63          	blt	a5,a4,34c <main+0x3a>
    ls(".");
     332:	00002517          	auipc	a0,0x2
     336:	8ae50513          	addi	a0,a0,-1874 # 1be0 <schedule_dm+0x2f4>
     33a:	00000097          	auipc	ra,0x0
     33e:	dca080e7          	jalr	-566(ra) # 104 <ls>
    exit(0);
     342:	4501                	li	a0,0
     344:	00000097          	auipc	ra,0x0
     348:	4dc080e7          	jalr	1244(ra) # 820 <exit>
  }
  for(i=1; i<argc; i++)
     34c:	4785                	li	a5,1
     34e:	fef42623          	sw	a5,-20(s0)
     352:	a015                	j	376 <main+0x64>
    ls(argv[i]);
     354:	fec42783          	lw	a5,-20(s0)
     358:	078e                	slli	a5,a5,0x3
     35a:	fd043703          	ld	a4,-48(s0)
     35e:	97ba                	add	a5,a5,a4
     360:	639c                	ld	a5,0(a5)
     362:	853e                	mv	a0,a5
     364:	00000097          	auipc	ra,0x0
     368:	da0080e7          	jalr	-608(ra) # 104 <ls>
  for(i=1; i<argc; i++)
     36c:	fec42783          	lw	a5,-20(s0)
     370:	2785                	addiw	a5,a5,1
     372:	fef42623          	sw	a5,-20(s0)
     376:	fec42703          	lw	a4,-20(s0)
     37a:	fdc42783          	lw	a5,-36(s0)
     37e:	2701                	sext.w	a4,a4
     380:	2781                	sext.w	a5,a5
     382:	fcf749e3          	blt	a4,a5,354 <main+0x42>
  exit(0);
     386:	4501                	li	a0,0
     388:	00000097          	auipc	ra,0x0
     38c:	498080e7          	jalr	1176(ra) # 820 <exit>

0000000000000390 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     390:	7179                	addi	sp,sp,-48
     392:	f422                	sd	s0,40(sp)
     394:	1800                	addi	s0,sp,48
     396:	fca43c23          	sd	a0,-40(s0)
     39a:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     39e:	fd843783          	ld	a5,-40(s0)
     3a2:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     3a6:	0001                	nop
     3a8:	fd043703          	ld	a4,-48(s0)
     3ac:	00170793          	addi	a5,a4,1
     3b0:	fcf43823          	sd	a5,-48(s0)
     3b4:	fd843783          	ld	a5,-40(s0)
     3b8:	00178693          	addi	a3,a5,1
     3bc:	fcd43c23          	sd	a3,-40(s0)
     3c0:	00074703          	lbu	a4,0(a4)
     3c4:	00e78023          	sb	a4,0(a5)
     3c8:	0007c783          	lbu	a5,0(a5)
     3cc:	fff1                	bnez	a5,3a8 <strcpy+0x18>
    ;
  return os;
     3ce:	fe843783          	ld	a5,-24(s0)
}
     3d2:	853e                	mv	a0,a5
     3d4:	7422                	ld	s0,40(sp)
     3d6:	6145                	addi	sp,sp,48
     3d8:	8082                	ret

00000000000003da <strcmp>:

int
strcmp(const char *p, const char *q)
{
     3da:	1101                	addi	sp,sp,-32
     3dc:	ec22                	sd	s0,24(sp)
     3de:	1000                	addi	s0,sp,32
     3e0:	fea43423          	sd	a0,-24(s0)
     3e4:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     3e8:	a819                	j	3fe <strcmp+0x24>
    p++, q++;
     3ea:	fe843783          	ld	a5,-24(s0)
     3ee:	0785                	addi	a5,a5,1
     3f0:	fef43423          	sd	a5,-24(s0)
     3f4:	fe043783          	ld	a5,-32(s0)
     3f8:	0785                	addi	a5,a5,1
     3fa:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     3fe:	fe843783          	ld	a5,-24(s0)
     402:	0007c783          	lbu	a5,0(a5)
     406:	cb99                	beqz	a5,41c <strcmp+0x42>
     408:	fe843783          	ld	a5,-24(s0)
     40c:	0007c703          	lbu	a4,0(a5)
     410:	fe043783          	ld	a5,-32(s0)
     414:	0007c783          	lbu	a5,0(a5)
     418:	fcf709e3          	beq	a4,a5,3ea <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     41c:	fe843783          	ld	a5,-24(s0)
     420:	0007c783          	lbu	a5,0(a5)
     424:	0007871b          	sext.w	a4,a5
     428:	fe043783          	ld	a5,-32(s0)
     42c:	0007c783          	lbu	a5,0(a5)
     430:	2781                	sext.w	a5,a5
     432:	40f707bb          	subw	a5,a4,a5
     436:	2781                	sext.w	a5,a5
}
     438:	853e                	mv	a0,a5
     43a:	6462                	ld	s0,24(sp)
     43c:	6105                	addi	sp,sp,32
     43e:	8082                	ret

0000000000000440 <strlen>:

uint
strlen(const char *s)
{
     440:	7179                	addi	sp,sp,-48
     442:	f422                	sd	s0,40(sp)
     444:	1800                	addi	s0,sp,48
     446:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     44a:	fe042623          	sw	zero,-20(s0)
     44e:	a031                	j	45a <strlen+0x1a>
     450:	fec42783          	lw	a5,-20(s0)
     454:	2785                	addiw	a5,a5,1
     456:	fef42623          	sw	a5,-20(s0)
     45a:	fec42783          	lw	a5,-20(s0)
     45e:	fd843703          	ld	a4,-40(s0)
     462:	97ba                	add	a5,a5,a4
     464:	0007c783          	lbu	a5,0(a5)
     468:	f7e5                	bnez	a5,450 <strlen+0x10>
    ;
  return n;
     46a:	fec42783          	lw	a5,-20(s0)
}
     46e:	853e                	mv	a0,a5
     470:	7422                	ld	s0,40(sp)
     472:	6145                	addi	sp,sp,48
     474:	8082                	ret

0000000000000476 <memset>:

void*
memset(void *dst, int c, uint n)
{
     476:	7179                	addi	sp,sp,-48
     478:	f422                	sd	s0,40(sp)
     47a:	1800                	addi	s0,sp,48
     47c:	fca43c23          	sd	a0,-40(s0)
     480:	87ae                	mv	a5,a1
     482:	8732                	mv	a4,a2
     484:	fcf42a23          	sw	a5,-44(s0)
     488:	87ba                	mv	a5,a4
     48a:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     48e:	fd843783          	ld	a5,-40(s0)
     492:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     496:	fe042623          	sw	zero,-20(s0)
     49a:	a00d                	j	4bc <memset+0x46>
    cdst[i] = c;
     49c:	fec42783          	lw	a5,-20(s0)
     4a0:	fe043703          	ld	a4,-32(s0)
     4a4:	97ba                	add	a5,a5,a4
     4a6:	fd442703          	lw	a4,-44(s0)
     4aa:	0ff77713          	andi	a4,a4,255
     4ae:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     4b2:	fec42783          	lw	a5,-20(s0)
     4b6:	2785                	addiw	a5,a5,1
     4b8:	fef42623          	sw	a5,-20(s0)
     4bc:	fec42703          	lw	a4,-20(s0)
     4c0:	fd042783          	lw	a5,-48(s0)
     4c4:	2781                	sext.w	a5,a5
     4c6:	fcf76be3          	bltu	a4,a5,49c <memset+0x26>
  }
  return dst;
     4ca:	fd843783          	ld	a5,-40(s0)
}
     4ce:	853e                	mv	a0,a5
     4d0:	7422                	ld	s0,40(sp)
     4d2:	6145                	addi	sp,sp,48
     4d4:	8082                	ret

00000000000004d6 <strchr>:

char*
strchr(const char *s, char c)
{
     4d6:	1101                	addi	sp,sp,-32
     4d8:	ec22                	sd	s0,24(sp)
     4da:	1000                	addi	s0,sp,32
     4dc:	fea43423          	sd	a0,-24(s0)
     4e0:	87ae                	mv	a5,a1
     4e2:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     4e6:	a01d                	j	50c <strchr+0x36>
    if(*s == c)
     4e8:	fe843783          	ld	a5,-24(s0)
     4ec:	0007c703          	lbu	a4,0(a5)
     4f0:	fe744783          	lbu	a5,-25(s0)
     4f4:	0ff7f793          	andi	a5,a5,255
     4f8:	00e79563          	bne	a5,a4,502 <strchr+0x2c>
      return (char*)s;
     4fc:	fe843783          	ld	a5,-24(s0)
     500:	a821                	j	518 <strchr+0x42>
  for(; *s; s++)
     502:	fe843783          	ld	a5,-24(s0)
     506:	0785                	addi	a5,a5,1
     508:	fef43423          	sd	a5,-24(s0)
     50c:	fe843783          	ld	a5,-24(s0)
     510:	0007c783          	lbu	a5,0(a5)
     514:	fbf1                	bnez	a5,4e8 <strchr+0x12>
  return 0;
     516:	4781                	li	a5,0
}
     518:	853e                	mv	a0,a5
     51a:	6462                	ld	s0,24(sp)
     51c:	6105                	addi	sp,sp,32
     51e:	8082                	ret

0000000000000520 <gets>:

char*
gets(char *buf, int max)
{
     520:	7179                	addi	sp,sp,-48
     522:	f406                	sd	ra,40(sp)
     524:	f022                	sd	s0,32(sp)
     526:	1800                	addi	s0,sp,48
     528:	fca43c23          	sd	a0,-40(s0)
     52c:	87ae                	mv	a5,a1
     52e:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     532:	fe042623          	sw	zero,-20(s0)
     536:	a8a1                	j	58e <gets+0x6e>
    cc = read(0, &c, 1);
     538:	fe740793          	addi	a5,s0,-25
     53c:	4605                	li	a2,1
     53e:	85be                	mv	a1,a5
     540:	4501                	li	a0,0
     542:	00000097          	auipc	ra,0x0
     546:	2f6080e7          	jalr	758(ra) # 838 <read>
     54a:	87aa                	mv	a5,a0
     54c:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     550:	fe842783          	lw	a5,-24(s0)
     554:	2781                	sext.w	a5,a5
     556:	04f05763          	blez	a5,5a4 <gets+0x84>
      break;
    buf[i++] = c;
     55a:	fec42783          	lw	a5,-20(s0)
     55e:	0017871b          	addiw	a4,a5,1
     562:	fee42623          	sw	a4,-20(s0)
     566:	873e                	mv	a4,a5
     568:	fd843783          	ld	a5,-40(s0)
     56c:	97ba                	add	a5,a5,a4
     56e:	fe744703          	lbu	a4,-25(s0)
     572:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     576:	fe744783          	lbu	a5,-25(s0)
     57a:	873e                	mv	a4,a5
     57c:	47a9                	li	a5,10
     57e:	02f70463          	beq	a4,a5,5a6 <gets+0x86>
     582:	fe744783          	lbu	a5,-25(s0)
     586:	873e                	mv	a4,a5
     588:	47b5                	li	a5,13
     58a:	00f70e63          	beq	a4,a5,5a6 <gets+0x86>
  for(i=0; i+1 < max; ){
     58e:	fec42783          	lw	a5,-20(s0)
     592:	2785                	addiw	a5,a5,1
     594:	0007871b          	sext.w	a4,a5
     598:	fd442783          	lw	a5,-44(s0)
     59c:	2781                	sext.w	a5,a5
     59e:	f8f74de3          	blt	a4,a5,538 <gets+0x18>
     5a2:	a011                	j	5a6 <gets+0x86>
      break;
     5a4:	0001                	nop
      break;
  }
  buf[i] = '\0';
     5a6:	fec42783          	lw	a5,-20(s0)
     5aa:	fd843703          	ld	a4,-40(s0)
     5ae:	97ba                	add	a5,a5,a4
     5b0:	00078023          	sb	zero,0(a5)
  return buf;
     5b4:	fd843783          	ld	a5,-40(s0)
}
     5b8:	853e                	mv	a0,a5
     5ba:	70a2                	ld	ra,40(sp)
     5bc:	7402                	ld	s0,32(sp)
     5be:	6145                	addi	sp,sp,48
     5c0:	8082                	ret

00000000000005c2 <stat>:

int
stat(const char *n, struct stat *st)
{
     5c2:	7179                	addi	sp,sp,-48
     5c4:	f406                	sd	ra,40(sp)
     5c6:	f022                	sd	s0,32(sp)
     5c8:	1800                	addi	s0,sp,48
     5ca:	fca43c23          	sd	a0,-40(s0)
     5ce:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     5d2:	4581                	li	a1,0
     5d4:	fd843503          	ld	a0,-40(s0)
     5d8:	00000097          	auipc	ra,0x0
     5dc:	288080e7          	jalr	648(ra) # 860 <open>
     5e0:	87aa                	mv	a5,a0
     5e2:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     5e6:	fec42783          	lw	a5,-20(s0)
     5ea:	2781                	sext.w	a5,a5
     5ec:	0007d463          	bgez	a5,5f4 <stat+0x32>
    return -1;
     5f0:	57fd                	li	a5,-1
     5f2:	a035                	j	61e <stat+0x5c>
  r = fstat(fd, st);
     5f4:	fec42783          	lw	a5,-20(s0)
     5f8:	fd043583          	ld	a1,-48(s0)
     5fc:	853e                	mv	a0,a5
     5fe:	00000097          	auipc	ra,0x0
     602:	27a080e7          	jalr	634(ra) # 878 <fstat>
     606:	87aa                	mv	a5,a0
     608:	fef42423          	sw	a5,-24(s0)
  close(fd);
     60c:	fec42783          	lw	a5,-20(s0)
     610:	853e                	mv	a0,a5
     612:	00000097          	auipc	ra,0x0
     616:	236080e7          	jalr	566(ra) # 848 <close>
  return r;
     61a:	fe842783          	lw	a5,-24(s0)
}
     61e:	853e                	mv	a0,a5
     620:	70a2                	ld	ra,40(sp)
     622:	7402                	ld	s0,32(sp)
     624:	6145                	addi	sp,sp,48
     626:	8082                	ret

0000000000000628 <atoi>:

int
atoi(const char *s)
{
     628:	7179                	addi	sp,sp,-48
     62a:	f422                	sd	s0,40(sp)
     62c:	1800                	addi	s0,sp,48
     62e:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     632:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     636:	a815                	j	66a <atoi+0x42>
    n = n*10 + *s++ - '0';
     638:	fec42703          	lw	a4,-20(s0)
     63c:	87ba                	mv	a5,a4
     63e:	0027979b          	slliw	a5,a5,0x2
     642:	9fb9                	addw	a5,a5,a4
     644:	0017979b          	slliw	a5,a5,0x1
     648:	0007871b          	sext.w	a4,a5
     64c:	fd843783          	ld	a5,-40(s0)
     650:	00178693          	addi	a3,a5,1
     654:	fcd43c23          	sd	a3,-40(s0)
     658:	0007c783          	lbu	a5,0(a5)
     65c:	2781                	sext.w	a5,a5
     65e:	9fb9                	addw	a5,a5,a4
     660:	2781                	sext.w	a5,a5
     662:	fd07879b          	addiw	a5,a5,-48
     666:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     66a:	fd843783          	ld	a5,-40(s0)
     66e:	0007c783          	lbu	a5,0(a5)
     672:	873e                	mv	a4,a5
     674:	02f00793          	li	a5,47
     678:	00e7fb63          	bgeu	a5,a4,68e <atoi+0x66>
     67c:	fd843783          	ld	a5,-40(s0)
     680:	0007c783          	lbu	a5,0(a5)
     684:	873e                	mv	a4,a5
     686:	03900793          	li	a5,57
     68a:	fae7f7e3          	bgeu	a5,a4,638 <atoi+0x10>
  return n;
     68e:	fec42783          	lw	a5,-20(s0)
}
     692:	853e                	mv	a0,a5
     694:	7422                	ld	s0,40(sp)
     696:	6145                	addi	sp,sp,48
     698:	8082                	ret

000000000000069a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     69a:	7139                	addi	sp,sp,-64
     69c:	fc22                	sd	s0,56(sp)
     69e:	0080                	addi	s0,sp,64
     6a0:	fca43c23          	sd	a0,-40(s0)
     6a4:	fcb43823          	sd	a1,-48(s0)
     6a8:	87b2                	mv	a5,a2
     6aa:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     6ae:	fd843783          	ld	a5,-40(s0)
     6b2:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     6b6:	fd043783          	ld	a5,-48(s0)
     6ba:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     6be:	fe043703          	ld	a4,-32(s0)
     6c2:	fe843783          	ld	a5,-24(s0)
     6c6:	02e7fc63          	bgeu	a5,a4,6fe <memmove+0x64>
    while(n-- > 0)
     6ca:	a00d                	j	6ec <memmove+0x52>
      *dst++ = *src++;
     6cc:	fe043703          	ld	a4,-32(s0)
     6d0:	00170793          	addi	a5,a4,1
     6d4:	fef43023          	sd	a5,-32(s0)
     6d8:	fe843783          	ld	a5,-24(s0)
     6dc:	00178693          	addi	a3,a5,1
     6e0:	fed43423          	sd	a3,-24(s0)
     6e4:	00074703          	lbu	a4,0(a4)
     6e8:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     6ec:	fcc42783          	lw	a5,-52(s0)
     6f0:	fff7871b          	addiw	a4,a5,-1
     6f4:	fce42623          	sw	a4,-52(s0)
     6f8:	fcf04ae3          	bgtz	a5,6cc <memmove+0x32>
     6fc:	a891                	j	750 <memmove+0xb6>
  } else {
    dst += n;
     6fe:	fcc42783          	lw	a5,-52(s0)
     702:	fe843703          	ld	a4,-24(s0)
     706:	97ba                	add	a5,a5,a4
     708:	fef43423          	sd	a5,-24(s0)
    src += n;
     70c:	fcc42783          	lw	a5,-52(s0)
     710:	fe043703          	ld	a4,-32(s0)
     714:	97ba                	add	a5,a5,a4
     716:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     71a:	a01d                	j	740 <memmove+0xa6>
      *--dst = *--src;
     71c:	fe043783          	ld	a5,-32(s0)
     720:	17fd                	addi	a5,a5,-1
     722:	fef43023          	sd	a5,-32(s0)
     726:	fe843783          	ld	a5,-24(s0)
     72a:	17fd                	addi	a5,a5,-1
     72c:	fef43423          	sd	a5,-24(s0)
     730:	fe043783          	ld	a5,-32(s0)
     734:	0007c703          	lbu	a4,0(a5)
     738:	fe843783          	ld	a5,-24(s0)
     73c:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     740:	fcc42783          	lw	a5,-52(s0)
     744:	fff7871b          	addiw	a4,a5,-1
     748:	fce42623          	sw	a4,-52(s0)
     74c:	fcf048e3          	bgtz	a5,71c <memmove+0x82>
  }
  return vdst;
     750:	fd843783          	ld	a5,-40(s0)
}
     754:	853e                	mv	a0,a5
     756:	7462                	ld	s0,56(sp)
     758:	6121                	addi	sp,sp,64
     75a:	8082                	ret

000000000000075c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     75c:	7139                	addi	sp,sp,-64
     75e:	fc22                	sd	s0,56(sp)
     760:	0080                	addi	s0,sp,64
     762:	fca43c23          	sd	a0,-40(s0)
     766:	fcb43823          	sd	a1,-48(s0)
     76a:	87b2                	mv	a5,a2
     76c:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     770:	fd843783          	ld	a5,-40(s0)
     774:	fef43423          	sd	a5,-24(s0)
     778:	fd043783          	ld	a5,-48(s0)
     77c:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     780:	a0a1                	j	7c8 <memcmp+0x6c>
    if (*p1 != *p2) {
     782:	fe843783          	ld	a5,-24(s0)
     786:	0007c703          	lbu	a4,0(a5)
     78a:	fe043783          	ld	a5,-32(s0)
     78e:	0007c783          	lbu	a5,0(a5)
     792:	02f70163          	beq	a4,a5,7b4 <memcmp+0x58>
      return *p1 - *p2;
     796:	fe843783          	ld	a5,-24(s0)
     79a:	0007c783          	lbu	a5,0(a5)
     79e:	0007871b          	sext.w	a4,a5
     7a2:	fe043783          	ld	a5,-32(s0)
     7a6:	0007c783          	lbu	a5,0(a5)
     7aa:	2781                	sext.w	a5,a5
     7ac:	40f707bb          	subw	a5,a4,a5
     7b0:	2781                	sext.w	a5,a5
     7b2:	a01d                	j	7d8 <memcmp+0x7c>
    }
    p1++;
     7b4:	fe843783          	ld	a5,-24(s0)
     7b8:	0785                	addi	a5,a5,1
     7ba:	fef43423          	sd	a5,-24(s0)
    p2++;
     7be:	fe043783          	ld	a5,-32(s0)
     7c2:	0785                	addi	a5,a5,1
     7c4:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     7c8:	fcc42783          	lw	a5,-52(s0)
     7cc:	fff7871b          	addiw	a4,a5,-1
     7d0:	fce42623          	sw	a4,-52(s0)
     7d4:	f7dd                	bnez	a5,782 <memcmp+0x26>
  }
  return 0;
     7d6:	4781                	li	a5,0
}
     7d8:	853e                	mv	a0,a5
     7da:	7462                	ld	s0,56(sp)
     7dc:	6121                	addi	sp,sp,64
     7de:	8082                	ret

00000000000007e0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     7e0:	7179                	addi	sp,sp,-48
     7e2:	f406                	sd	ra,40(sp)
     7e4:	f022                	sd	s0,32(sp)
     7e6:	1800                	addi	s0,sp,48
     7e8:	fea43423          	sd	a0,-24(s0)
     7ec:	feb43023          	sd	a1,-32(s0)
     7f0:	87b2                	mv	a5,a2
     7f2:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     7f6:	fdc42783          	lw	a5,-36(s0)
     7fa:	863e                	mv	a2,a5
     7fc:	fe043583          	ld	a1,-32(s0)
     800:	fe843503          	ld	a0,-24(s0)
     804:	00000097          	auipc	ra,0x0
     808:	e96080e7          	jalr	-362(ra) # 69a <memmove>
     80c:	87aa                	mv	a5,a0
}
     80e:	853e                	mv	a0,a5
     810:	70a2                	ld	ra,40(sp)
     812:	7402                	ld	s0,32(sp)
     814:	6145                	addi	sp,sp,48
     816:	8082                	ret

0000000000000818 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     818:	4885                	li	a7,1
 ecall
     81a:	00000073          	ecall
 ret
     81e:	8082                	ret

0000000000000820 <exit>:
.global exit
exit:
 li a7, SYS_exit
     820:	4889                	li	a7,2
 ecall
     822:	00000073          	ecall
 ret
     826:	8082                	ret

0000000000000828 <wait>:
.global wait
wait:
 li a7, SYS_wait
     828:	488d                	li	a7,3
 ecall
     82a:	00000073          	ecall
 ret
     82e:	8082                	ret

0000000000000830 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     830:	4891                	li	a7,4
 ecall
     832:	00000073          	ecall
 ret
     836:	8082                	ret

0000000000000838 <read>:
.global read
read:
 li a7, SYS_read
     838:	4895                	li	a7,5
 ecall
     83a:	00000073          	ecall
 ret
     83e:	8082                	ret

0000000000000840 <write>:
.global write
write:
 li a7, SYS_write
     840:	48c1                	li	a7,16
 ecall
     842:	00000073          	ecall
 ret
     846:	8082                	ret

0000000000000848 <close>:
.global close
close:
 li a7, SYS_close
     848:	48d5                	li	a7,21
 ecall
     84a:	00000073          	ecall
 ret
     84e:	8082                	ret

0000000000000850 <kill>:
.global kill
kill:
 li a7, SYS_kill
     850:	4899                	li	a7,6
 ecall
     852:	00000073          	ecall
 ret
     856:	8082                	ret

0000000000000858 <exec>:
.global exec
exec:
 li a7, SYS_exec
     858:	489d                	li	a7,7
 ecall
     85a:	00000073          	ecall
 ret
     85e:	8082                	ret

0000000000000860 <open>:
.global open
open:
 li a7, SYS_open
     860:	48bd                	li	a7,15
 ecall
     862:	00000073          	ecall
 ret
     866:	8082                	ret

0000000000000868 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     868:	48c5                	li	a7,17
 ecall
     86a:	00000073          	ecall
 ret
     86e:	8082                	ret

0000000000000870 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     870:	48c9                	li	a7,18
 ecall
     872:	00000073          	ecall
 ret
     876:	8082                	ret

0000000000000878 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     878:	48a1                	li	a7,8
 ecall
     87a:	00000073          	ecall
 ret
     87e:	8082                	ret

0000000000000880 <link>:
.global link
link:
 li a7, SYS_link
     880:	48cd                	li	a7,19
 ecall
     882:	00000073          	ecall
 ret
     886:	8082                	ret

0000000000000888 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     888:	48d1                	li	a7,20
 ecall
     88a:	00000073          	ecall
 ret
     88e:	8082                	ret

0000000000000890 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     890:	48a5                	li	a7,9
 ecall
     892:	00000073          	ecall
 ret
     896:	8082                	ret

0000000000000898 <dup>:
.global dup
dup:
 li a7, SYS_dup
     898:	48a9                	li	a7,10
 ecall
     89a:	00000073          	ecall
 ret
     89e:	8082                	ret

00000000000008a0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     8a0:	48ad                	li	a7,11
 ecall
     8a2:	00000073          	ecall
 ret
     8a6:	8082                	ret

00000000000008a8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     8a8:	48b1                	li	a7,12
 ecall
     8aa:	00000073          	ecall
 ret
     8ae:	8082                	ret

00000000000008b0 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     8b0:	48b5                	li	a7,13
 ecall
     8b2:	00000073          	ecall
 ret
     8b6:	8082                	ret

00000000000008b8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     8b8:	48b9                	li	a7,14
 ecall
     8ba:	00000073          	ecall
 ret
     8be:	8082                	ret

00000000000008c0 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     8c0:	48d9                	li	a7,22
 ecall
     8c2:	00000073          	ecall
 ret
     8c6:	8082                	ret

00000000000008c8 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     8c8:	48dd                	li	a7,23
 ecall
     8ca:	00000073          	ecall
 ret
     8ce:	8082                	ret

00000000000008d0 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     8d0:	48e1                	li	a7,24
 ecall
     8d2:	00000073          	ecall
 ret
     8d6:	8082                	ret

00000000000008d8 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     8d8:	1101                	addi	sp,sp,-32
     8da:	ec06                	sd	ra,24(sp)
     8dc:	e822                	sd	s0,16(sp)
     8de:	1000                	addi	s0,sp,32
     8e0:	87aa                	mv	a5,a0
     8e2:	872e                	mv	a4,a1
     8e4:	fef42623          	sw	a5,-20(s0)
     8e8:	87ba                	mv	a5,a4
     8ea:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     8ee:	feb40713          	addi	a4,s0,-21
     8f2:	fec42783          	lw	a5,-20(s0)
     8f6:	4605                	li	a2,1
     8f8:	85ba                	mv	a1,a4
     8fa:	853e                	mv	a0,a5
     8fc:	00000097          	auipc	ra,0x0
     900:	f44080e7          	jalr	-188(ra) # 840 <write>
}
     904:	0001                	nop
     906:	60e2                	ld	ra,24(sp)
     908:	6442                	ld	s0,16(sp)
     90a:	6105                	addi	sp,sp,32
     90c:	8082                	ret

000000000000090e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     90e:	7139                	addi	sp,sp,-64
     910:	fc06                	sd	ra,56(sp)
     912:	f822                	sd	s0,48(sp)
     914:	0080                	addi	s0,sp,64
     916:	87aa                	mv	a5,a0
     918:	8736                	mv	a4,a3
     91a:	fcf42623          	sw	a5,-52(s0)
     91e:	87ae                	mv	a5,a1
     920:	fcf42423          	sw	a5,-56(s0)
     924:	87b2                	mv	a5,a2
     926:	fcf42223          	sw	a5,-60(s0)
     92a:	87ba                	mv	a5,a4
     92c:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     930:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     934:	fc042783          	lw	a5,-64(s0)
     938:	2781                	sext.w	a5,a5
     93a:	c38d                	beqz	a5,95c <printint+0x4e>
     93c:	fc842783          	lw	a5,-56(s0)
     940:	2781                	sext.w	a5,a5
     942:	0007dd63          	bgez	a5,95c <printint+0x4e>
    neg = 1;
     946:	4785                	li	a5,1
     948:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     94c:	fc842783          	lw	a5,-56(s0)
     950:	40f007bb          	negw	a5,a5
     954:	2781                	sext.w	a5,a5
     956:	fef42223          	sw	a5,-28(s0)
     95a:	a029                	j	964 <printint+0x56>
  } else {
    x = xx;
     95c:	fc842783          	lw	a5,-56(s0)
     960:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     964:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     968:	fc442783          	lw	a5,-60(s0)
     96c:	fe442703          	lw	a4,-28(s0)
     970:	02f777bb          	remuw	a5,a4,a5
     974:	0007861b          	sext.w	a2,a5
     978:	fec42783          	lw	a5,-20(s0)
     97c:	0017871b          	addiw	a4,a5,1
     980:	fee42623          	sw	a4,-20(s0)
     984:	00001697          	auipc	a3,0x1
     988:	26c68693          	addi	a3,a3,620 # 1bf0 <digits>
     98c:	02061713          	slli	a4,a2,0x20
     990:	9301                	srli	a4,a4,0x20
     992:	9736                	add	a4,a4,a3
     994:	00074703          	lbu	a4,0(a4)
     998:	ff040693          	addi	a3,s0,-16
     99c:	97b6                	add	a5,a5,a3
     99e:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     9a2:	fc442783          	lw	a5,-60(s0)
     9a6:	fe442703          	lw	a4,-28(s0)
     9aa:	02f757bb          	divuw	a5,a4,a5
     9ae:	fef42223          	sw	a5,-28(s0)
     9b2:	fe442783          	lw	a5,-28(s0)
     9b6:	2781                	sext.w	a5,a5
     9b8:	fbc5                	bnez	a5,968 <printint+0x5a>
  if(neg)
     9ba:	fe842783          	lw	a5,-24(s0)
     9be:	2781                	sext.w	a5,a5
     9c0:	cf95                	beqz	a5,9fc <printint+0xee>
    buf[i++] = '-';
     9c2:	fec42783          	lw	a5,-20(s0)
     9c6:	0017871b          	addiw	a4,a5,1
     9ca:	fee42623          	sw	a4,-20(s0)
     9ce:	ff040713          	addi	a4,s0,-16
     9d2:	97ba                	add	a5,a5,a4
     9d4:	02d00713          	li	a4,45
     9d8:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     9dc:	a005                	j	9fc <printint+0xee>
    putc(fd, buf[i]);
     9de:	fec42783          	lw	a5,-20(s0)
     9e2:	ff040713          	addi	a4,s0,-16
     9e6:	97ba                	add	a5,a5,a4
     9e8:	fe07c703          	lbu	a4,-32(a5)
     9ec:	fcc42783          	lw	a5,-52(s0)
     9f0:	85ba                	mv	a1,a4
     9f2:	853e                	mv	a0,a5
     9f4:	00000097          	auipc	ra,0x0
     9f8:	ee4080e7          	jalr	-284(ra) # 8d8 <putc>
  while(--i >= 0)
     9fc:	fec42783          	lw	a5,-20(s0)
     a00:	37fd                	addiw	a5,a5,-1
     a02:	fef42623          	sw	a5,-20(s0)
     a06:	fec42783          	lw	a5,-20(s0)
     a0a:	2781                	sext.w	a5,a5
     a0c:	fc07d9e3          	bgez	a5,9de <printint+0xd0>
}
     a10:	0001                	nop
     a12:	0001                	nop
     a14:	70e2                	ld	ra,56(sp)
     a16:	7442                	ld	s0,48(sp)
     a18:	6121                	addi	sp,sp,64
     a1a:	8082                	ret

0000000000000a1c <printptr>:

static void
printptr(int fd, uint64 x) {
     a1c:	7179                	addi	sp,sp,-48
     a1e:	f406                	sd	ra,40(sp)
     a20:	f022                	sd	s0,32(sp)
     a22:	1800                	addi	s0,sp,48
     a24:	87aa                	mv	a5,a0
     a26:	fcb43823          	sd	a1,-48(s0)
     a2a:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     a2e:	fdc42783          	lw	a5,-36(s0)
     a32:	03000593          	li	a1,48
     a36:	853e                	mv	a0,a5
     a38:	00000097          	auipc	ra,0x0
     a3c:	ea0080e7          	jalr	-352(ra) # 8d8 <putc>
  putc(fd, 'x');
     a40:	fdc42783          	lw	a5,-36(s0)
     a44:	07800593          	li	a1,120
     a48:	853e                	mv	a0,a5
     a4a:	00000097          	auipc	ra,0x0
     a4e:	e8e080e7          	jalr	-370(ra) # 8d8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a52:	fe042623          	sw	zero,-20(s0)
     a56:	a82d                	j	a90 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     a58:	fd043783          	ld	a5,-48(s0)
     a5c:	93f1                	srli	a5,a5,0x3c
     a5e:	00001717          	auipc	a4,0x1
     a62:	19270713          	addi	a4,a4,402 # 1bf0 <digits>
     a66:	97ba                	add	a5,a5,a4
     a68:	0007c703          	lbu	a4,0(a5)
     a6c:	fdc42783          	lw	a5,-36(s0)
     a70:	85ba                	mv	a1,a4
     a72:	853e                	mv	a0,a5
     a74:	00000097          	auipc	ra,0x0
     a78:	e64080e7          	jalr	-412(ra) # 8d8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a7c:	fec42783          	lw	a5,-20(s0)
     a80:	2785                	addiw	a5,a5,1
     a82:	fef42623          	sw	a5,-20(s0)
     a86:	fd043783          	ld	a5,-48(s0)
     a8a:	0792                	slli	a5,a5,0x4
     a8c:	fcf43823          	sd	a5,-48(s0)
     a90:	fec42783          	lw	a5,-20(s0)
     a94:	873e                	mv	a4,a5
     a96:	47bd                	li	a5,15
     a98:	fce7f0e3          	bgeu	a5,a4,a58 <printptr+0x3c>
}
     a9c:	0001                	nop
     a9e:	0001                	nop
     aa0:	70a2                	ld	ra,40(sp)
     aa2:	7402                	ld	s0,32(sp)
     aa4:	6145                	addi	sp,sp,48
     aa6:	8082                	ret

0000000000000aa8 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     aa8:	715d                	addi	sp,sp,-80
     aaa:	e486                	sd	ra,72(sp)
     aac:	e0a2                	sd	s0,64(sp)
     aae:	0880                	addi	s0,sp,80
     ab0:	87aa                	mv	a5,a0
     ab2:	fcb43023          	sd	a1,-64(s0)
     ab6:	fac43c23          	sd	a2,-72(s0)
     aba:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     abe:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     ac2:	fe042223          	sw	zero,-28(s0)
     ac6:	a42d                	j	cf0 <vprintf+0x248>
    c = fmt[i] & 0xff;
     ac8:	fe442783          	lw	a5,-28(s0)
     acc:	fc043703          	ld	a4,-64(s0)
     ad0:	97ba                	add	a5,a5,a4
     ad2:	0007c783          	lbu	a5,0(a5)
     ad6:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     ada:	fe042783          	lw	a5,-32(s0)
     ade:	2781                	sext.w	a5,a5
     ae0:	eb9d                	bnez	a5,b16 <vprintf+0x6e>
      if(c == '%'){
     ae2:	fdc42783          	lw	a5,-36(s0)
     ae6:	0007871b          	sext.w	a4,a5
     aea:	02500793          	li	a5,37
     aee:	00f71763          	bne	a4,a5,afc <vprintf+0x54>
        state = '%';
     af2:	02500793          	li	a5,37
     af6:	fef42023          	sw	a5,-32(s0)
     afa:	a2f5                	j	ce6 <vprintf+0x23e>
      } else {
        putc(fd, c);
     afc:	fdc42783          	lw	a5,-36(s0)
     b00:	0ff7f713          	andi	a4,a5,255
     b04:	fcc42783          	lw	a5,-52(s0)
     b08:	85ba                	mv	a1,a4
     b0a:	853e                	mv	a0,a5
     b0c:	00000097          	auipc	ra,0x0
     b10:	dcc080e7          	jalr	-564(ra) # 8d8 <putc>
     b14:	aac9                	j	ce6 <vprintf+0x23e>
      }
    } else if(state == '%'){
     b16:	fe042783          	lw	a5,-32(s0)
     b1a:	0007871b          	sext.w	a4,a5
     b1e:	02500793          	li	a5,37
     b22:	1cf71263          	bne	a4,a5,ce6 <vprintf+0x23e>
      if(c == 'd'){
     b26:	fdc42783          	lw	a5,-36(s0)
     b2a:	0007871b          	sext.w	a4,a5
     b2e:	06400793          	li	a5,100
     b32:	02f71463          	bne	a4,a5,b5a <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     b36:	fb843783          	ld	a5,-72(s0)
     b3a:	00878713          	addi	a4,a5,8
     b3e:	fae43c23          	sd	a4,-72(s0)
     b42:	4398                	lw	a4,0(a5)
     b44:	fcc42783          	lw	a5,-52(s0)
     b48:	4685                	li	a3,1
     b4a:	4629                	li	a2,10
     b4c:	85ba                	mv	a1,a4
     b4e:	853e                	mv	a0,a5
     b50:	00000097          	auipc	ra,0x0
     b54:	dbe080e7          	jalr	-578(ra) # 90e <printint>
     b58:	a269                	j	ce2 <vprintf+0x23a>
      } else if(c == 'l') {
     b5a:	fdc42783          	lw	a5,-36(s0)
     b5e:	0007871b          	sext.w	a4,a5
     b62:	06c00793          	li	a5,108
     b66:	02f71663          	bne	a4,a5,b92 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     b6a:	fb843783          	ld	a5,-72(s0)
     b6e:	00878713          	addi	a4,a5,8
     b72:	fae43c23          	sd	a4,-72(s0)
     b76:	639c                	ld	a5,0(a5)
     b78:	0007871b          	sext.w	a4,a5
     b7c:	fcc42783          	lw	a5,-52(s0)
     b80:	4681                	li	a3,0
     b82:	4629                	li	a2,10
     b84:	85ba                	mv	a1,a4
     b86:	853e                	mv	a0,a5
     b88:	00000097          	auipc	ra,0x0
     b8c:	d86080e7          	jalr	-634(ra) # 90e <printint>
     b90:	aa89                	j	ce2 <vprintf+0x23a>
      } else if(c == 'x') {
     b92:	fdc42783          	lw	a5,-36(s0)
     b96:	0007871b          	sext.w	a4,a5
     b9a:	07800793          	li	a5,120
     b9e:	02f71463          	bne	a4,a5,bc6 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     ba2:	fb843783          	ld	a5,-72(s0)
     ba6:	00878713          	addi	a4,a5,8
     baa:	fae43c23          	sd	a4,-72(s0)
     bae:	4398                	lw	a4,0(a5)
     bb0:	fcc42783          	lw	a5,-52(s0)
     bb4:	4681                	li	a3,0
     bb6:	4641                	li	a2,16
     bb8:	85ba                	mv	a1,a4
     bba:	853e                	mv	a0,a5
     bbc:	00000097          	auipc	ra,0x0
     bc0:	d52080e7          	jalr	-686(ra) # 90e <printint>
     bc4:	aa39                	j	ce2 <vprintf+0x23a>
      } else if(c == 'p') {
     bc6:	fdc42783          	lw	a5,-36(s0)
     bca:	0007871b          	sext.w	a4,a5
     bce:	07000793          	li	a5,112
     bd2:	02f71263          	bne	a4,a5,bf6 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     bd6:	fb843783          	ld	a5,-72(s0)
     bda:	00878713          	addi	a4,a5,8
     bde:	fae43c23          	sd	a4,-72(s0)
     be2:	6398                	ld	a4,0(a5)
     be4:	fcc42783          	lw	a5,-52(s0)
     be8:	85ba                	mv	a1,a4
     bea:	853e                	mv	a0,a5
     bec:	00000097          	auipc	ra,0x0
     bf0:	e30080e7          	jalr	-464(ra) # a1c <printptr>
     bf4:	a0fd                	j	ce2 <vprintf+0x23a>
      } else if(c == 's'){
     bf6:	fdc42783          	lw	a5,-36(s0)
     bfa:	0007871b          	sext.w	a4,a5
     bfe:	07300793          	li	a5,115
     c02:	04f71c63          	bne	a4,a5,c5a <vprintf+0x1b2>
        s = va_arg(ap, char*);
     c06:	fb843783          	ld	a5,-72(s0)
     c0a:	00878713          	addi	a4,a5,8
     c0e:	fae43c23          	sd	a4,-72(s0)
     c12:	639c                	ld	a5,0(a5)
     c14:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     c18:	fe843783          	ld	a5,-24(s0)
     c1c:	eb8d                	bnez	a5,c4e <vprintf+0x1a6>
          s = "(null)";
     c1e:	00001797          	auipc	a5,0x1
     c22:	fca78793          	addi	a5,a5,-54 # 1be8 <schedule_dm+0x2fc>
     c26:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c2a:	a015                	j	c4e <vprintf+0x1a6>
          putc(fd, *s);
     c2c:	fe843783          	ld	a5,-24(s0)
     c30:	0007c703          	lbu	a4,0(a5)
     c34:	fcc42783          	lw	a5,-52(s0)
     c38:	85ba                	mv	a1,a4
     c3a:	853e                	mv	a0,a5
     c3c:	00000097          	auipc	ra,0x0
     c40:	c9c080e7          	jalr	-868(ra) # 8d8 <putc>
          s++;
     c44:	fe843783          	ld	a5,-24(s0)
     c48:	0785                	addi	a5,a5,1
     c4a:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c4e:	fe843783          	ld	a5,-24(s0)
     c52:	0007c783          	lbu	a5,0(a5)
     c56:	fbf9                	bnez	a5,c2c <vprintf+0x184>
     c58:	a069                	j	ce2 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     c5a:	fdc42783          	lw	a5,-36(s0)
     c5e:	0007871b          	sext.w	a4,a5
     c62:	06300793          	li	a5,99
     c66:	02f71463          	bne	a4,a5,c8e <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     c6a:	fb843783          	ld	a5,-72(s0)
     c6e:	00878713          	addi	a4,a5,8
     c72:	fae43c23          	sd	a4,-72(s0)
     c76:	439c                	lw	a5,0(a5)
     c78:	0ff7f713          	andi	a4,a5,255
     c7c:	fcc42783          	lw	a5,-52(s0)
     c80:	85ba                	mv	a1,a4
     c82:	853e                	mv	a0,a5
     c84:	00000097          	auipc	ra,0x0
     c88:	c54080e7          	jalr	-940(ra) # 8d8 <putc>
     c8c:	a899                	j	ce2 <vprintf+0x23a>
      } else if(c == '%'){
     c8e:	fdc42783          	lw	a5,-36(s0)
     c92:	0007871b          	sext.w	a4,a5
     c96:	02500793          	li	a5,37
     c9a:	00f71f63          	bne	a4,a5,cb8 <vprintf+0x210>
        putc(fd, c);
     c9e:	fdc42783          	lw	a5,-36(s0)
     ca2:	0ff7f713          	andi	a4,a5,255
     ca6:	fcc42783          	lw	a5,-52(s0)
     caa:	85ba                	mv	a1,a4
     cac:	853e                	mv	a0,a5
     cae:	00000097          	auipc	ra,0x0
     cb2:	c2a080e7          	jalr	-982(ra) # 8d8 <putc>
     cb6:	a035                	j	ce2 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     cb8:	fcc42783          	lw	a5,-52(s0)
     cbc:	02500593          	li	a1,37
     cc0:	853e                	mv	a0,a5
     cc2:	00000097          	auipc	ra,0x0
     cc6:	c16080e7          	jalr	-1002(ra) # 8d8 <putc>
        putc(fd, c);
     cca:	fdc42783          	lw	a5,-36(s0)
     cce:	0ff7f713          	andi	a4,a5,255
     cd2:	fcc42783          	lw	a5,-52(s0)
     cd6:	85ba                	mv	a1,a4
     cd8:	853e                	mv	a0,a5
     cda:	00000097          	auipc	ra,0x0
     cde:	bfe080e7          	jalr	-1026(ra) # 8d8 <putc>
      }
      state = 0;
     ce2:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     ce6:	fe442783          	lw	a5,-28(s0)
     cea:	2785                	addiw	a5,a5,1
     cec:	fef42223          	sw	a5,-28(s0)
     cf0:	fe442783          	lw	a5,-28(s0)
     cf4:	fc043703          	ld	a4,-64(s0)
     cf8:	97ba                	add	a5,a5,a4
     cfa:	0007c783          	lbu	a5,0(a5)
     cfe:	dc0795e3          	bnez	a5,ac8 <vprintf+0x20>
    }
  }
}
     d02:	0001                	nop
     d04:	0001                	nop
     d06:	60a6                	ld	ra,72(sp)
     d08:	6406                	ld	s0,64(sp)
     d0a:	6161                	addi	sp,sp,80
     d0c:	8082                	ret

0000000000000d0e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     d0e:	7159                	addi	sp,sp,-112
     d10:	fc06                	sd	ra,56(sp)
     d12:	f822                	sd	s0,48(sp)
     d14:	0080                	addi	s0,sp,64
     d16:	fcb43823          	sd	a1,-48(s0)
     d1a:	e010                	sd	a2,0(s0)
     d1c:	e414                	sd	a3,8(s0)
     d1e:	e818                	sd	a4,16(s0)
     d20:	ec1c                	sd	a5,24(s0)
     d22:	03043023          	sd	a6,32(s0)
     d26:	03143423          	sd	a7,40(s0)
     d2a:	87aa                	mv	a5,a0
     d2c:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     d30:	03040793          	addi	a5,s0,48
     d34:	fcf43423          	sd	a5,-56(s0)
     d38:	fc843783          	ld	a5,-56(s0)
     d3c:	fd078793          	addi	a5,a5,-48
     d40:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     d44:	fe843703          	ld	a4,-24(s0)
     d48:	fdc42783          	lw	a5,-36(s0)
     d4c:	863a                	mv	a2,a4
     d4e:	fd043583          	ld	a1,-48(s0)
     d52:	853e                	mv	a0,a5
     d54:	00000097          	auipc	ra,0x0
     d58:	d54080e7          	jalr	-684(ra) # aa8 <vprintf>
}
     d5c:	0001                	nop
     d5e:	70e2                	ld	ra,56(sp)
     d60:	7442                	ld	s0,48(sp)
     d62:	6165                	addi	sp,sp,112
     d64:	8082                	ret

0000000000000d66 <printf>:

void
printf(const char *fmt, ...)
{
     d66:	7159                	addi	sp,sp,-112
     d68:	f406                	sd	ra,40(sp)
     d6a:	f022                	sd	s0,32(sp)
     d6c:	1800                	addi	s0,sp,48
     d6e:	fca43c23          	sd	a0,-40(s0)
     d72:	e40c                	sd	a1,8(s0)
     d74:	e810                	sd	a2,16(s0)
     d76:	ec14                	sd	a3,24(s0)
     d78:	f018                	sd	a4,32(s0)
     d7a:	f41c                	sd	a5,40(s0)
     d7c:	03043823          	sd	a6,48(s0)
     d80:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     d84:	04040793          	addi	a5,s0,64
     d88:	fcf43823          	sd	a5,-48(s0)
     d8c:	fd043783          	ld	a5,-48(s0)
     d90:	fc878793          	addi	a5,a5,-56
     d94:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     d98:	fe843783          	ld	a5,-24(s0)
     d9c:	863e                	mv	a2,a5
     d9e:	fd843583          	ld	a1,-40(s0)
     da2:	4505                	li	a0,1
     da4:	00000097          	auipc	ra,0x0
     da8:	d04080e7          	jalr	-764(ra) # aa8 <vprintf>
}
     dac:	0001                	nop
     dae:	70a2                	ld	ra,40(sp)
     db0:	7402                	ld	s0,32(sp)
     db2:	6165                	addi	sp,sp,112
     db4:	8082                	ret

0000000000000db6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     db6:	7179                	addi	sp,sp,-48
     db8:	f422                	sd	s0,40(sp)
     dba:	1800                	addi	s0,sp,48
     dbc:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     dc0:	fd843783          	ld	a5,-40(s0)
     dc4:	17c1                	addi	a5,a5,-16
     dc6:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     dca:	00001797          	auipc	a5,0x1
     dce:	e5e78793          	addi	a5,a5,-418 # 1c28 <freep>
     dd2:	639c                	ld	a5,0(a5)
     dd4:	fef43423          	sd	a5,-24(s0)
     dd8:	a815                	j	e0c <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     dda:	fe843783          	ld	a5,-24(s0)
     dde:	639c                	ld	a5,0(a5)
     de0:	fe843703          	ld	a4,-24(s0)
     de4:	00f76f63          	bltu	a4,a5,e02 <free+0x4c>
     de8:	fe043703          	ld	a4,-32(s0)
     dec:	fe843783          	ld	a5,-24(s0)
     df0:	02e7eb63          	bltu	a5,a4,e26 <free+0x70>
     df4:	fe843783          	ld	a5,-24(s0)
     df8:	639c                	ld	a5,0(a5)
     dfa:	fe043703          	ld	a4,-32(s0)
     dfe:	02f76463          	bltu	a4,a5,e26 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e02:	fe843783          	ld	a5,-24(s0)
     e06:	639c                	ld	a5,0(a5)
     e08:	fef43423          	sd	a5,-24(s0)
     e0c:	fe043703          	ld	a4,-32(s0)
     e10:	fe843783          	ld	a5,-24(s0)
     e14:	fce7f3e3          	bgeu	a5,a4,dda <free+0x24>
     e18:	fe843783          	ld	a5,-24(s0)
     e1c:	639c                	ld	a5,0(a5)
     e1e:	fe043703          	ld	a4,-32(s0)
     e22:	faf77ce3          	bgeu	a4,a5,dda <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e26:	fe043783          	ld	a5,-32(s0)
     e2a:	479c                	lw	a5,8(a5)
     e2c:	1782                	slli	a5,a5,0x20
     e2e:	9381                	srli	a5,a5,0x20
     e30:	0792                	slli	a5,a5,0x4
     e32:	fe043703          	ld	a4,-32(s0)
     e36:	973e                	add	a4,a4,a5
     e38:	fe843783          	ld	a5,-24(s0)
     e3c:	639c                	ld	a5,0(a5)
     e3e:	02f71763          	bne	a4,a5,e6c <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     e42:	fe043783          	ld	a5,-32(s0)
     e46:	4798                	lw	a4,8(a5)
     e48:	fe843783          	ld	a5,-24(s0)
     e4c:	639c                	ld	a5,0(a5)
     e4e:	479c                	lw	a5,8(a5)
     e50:	9fb9                	addw	a5,a5,a4
     e52:	0007871b          	sext.w	a4,a5
     e56:	fe043783          	ld	a5,-32(s0)
     e5a:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     e5c:	fe843783          	ld	a5,-24(s0)
     e60:	639c                	ld	a5,0(a5)
     e62:	6398                	ld	a4,0(a5)
     e64:	fe043783          	ld	a5,-32(s0)
     e68:	e398                	sd	a4,0(a5)
     e6a:	a039                	j	e78 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     e6c:	fe843783          	ld	a5,-24(s0)
     e70:	6398                	ld	a4,0(a5)
     e72:	fe043783          	ld	a5,-32(s0)
     e76:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     e78:	fe843783          	ld	a5,-24(s0)
     e7c:	479c                	lw	a5,8(a5)
     e7e:	1782                	slli	a5,a5,0x20
     e80:	9381                	srli	a5,a5,0x20
     e82:	0792                	slli	a5,a5,0x4
     e84:	fe843703          	ld	a4,-24(s0)
     e88:	97ba                	add	a5,a5,a4
     e8a:	fe043703          	ld	a4,-32(s0)
     e8e:	02f71563          	bne	a4,a5,eb8 <free+0x102>
    p->s.size += bp->s.size;
     e92:	fe843783          	ld	a5,-24(s0)
     e96:	4798                	lw	a4,8(a5)
     e98:	fe043783          	ld	a5,-32(s0)
     e9c:	479c                	lw	a5,8(a5)
     e9e:	9fb9                	addw	a5,a5,a4
     ea0:	0007871b          	sext.w	a4,a5
     ea4:	fe843783          	ld	a5,-24(s0)
     ea8:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     eaa:	fe043783          	ld	a5,-32(s0)
     eae:	6398                	ld	a4,0(a5)
     eb0:	fe843783          	ld	a5,-24(s0)
     eb4:	e398                	sd	a4,0(a5)
     eb6:	a031                	j	ec2 <free+0x10c>
  } else
    p->s.ptr = bp;
     eb8:	fe843783          	ld	a5,-24(s0)
     ebc:	fe043703          	ld	a4,-32(s0)
     ec0:	e398                	sd	a4,0(a5)
  freep = p;
     ec2:	00001797          	auipc	a5,0x1
     ec6:	d6678793          	addi	a5,a5,-666 # 1c28 <freep>
     eca:	fe843703          	ld	a4,-24(s0)
     ece:	e398                	sd	a4,0(a5)
}
     ed0:	0001                	nop
     ed2:	7422                	ld	s0,40(sp)
     ed4:	6145                	addi	sp,sp,48
     ed6:	8082                	ret

0000000000000ed8 <morecore>:

static Header*
morecore(uint nu)
{
     ed8:	7179                	addi	sp,sp,-48
     eda:	f406                	sd	ra,40(sp)
     edc:	f022                	sd	s0,32(sp)
     ede:	1800                	addi	s0,sp,48
     ee0:	87aa                	mv	a5,a0
     ee2:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     ee6:	fdc42783          	lw	a5,-36(s0)
     eea:	0007871b          	sext.w	a4,a5
     eee:	6785                	lui	a5,0x1
     ef0:	00f77563          	bgeu	a4,a5,efa <morecore+0x22>
    nu = 4096;
     ef4:	6785                	lui	a5,0x1
     ef6:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     efa:	fdc42783          	lw	a5,-36(s0)
     efe:	0047979b          	slliw	a5,a5,0x4
     f02:	2781                	sext.w	a5,a5
     f04:	2781                	sext.w	a5,a5
     f06:	853e                	mv	a0,a5
     f08:	00000097          	auipc	ra,0x0
     f0c:	9a0080e7          	jalr	-1632(ra) # 8a8 <sbrk>
     f10:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     f14:	fe843703          	ld	a4,-24(s0)
     f18:	57fd                	li	a5,-1
     f1a:	00f71463          	bne	a4,a5,f22 <morecore+0x4a>
    return 0;
     f1e:	4781                	li	a5,0
     f20:	a03d                	j	f4e <morecore+0x76>
  hp = (Header*)p;
     f22:	fe843783          	ld	a5,-24(s0)
     f26:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     f2a:	fe043783          	ld	a5,-32(s0)
     f2e:	fdc42703          	lw	a4,-36(s0)
     f32:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     f34:	fe043783          	ld	a5,-32(s0)
     f38:	07c1                	addi	a5,a5,16
     f3a:	853e                	mv	a0,a5
     f3c:	00000097          	auipc	ra,0x0
     f40:	e7a080e7          	jalr	-390(ra) # db6 <free>
  return freep;
     f44:	00001797          	auipc	a5,0x1
     f48:	ce478793          	addi	a5,a5,-796 # 1c28 <freep>
     f4c:	639c                	ld	a5,0(a5)
}
     f4e:	853e                	mv	a0,a5
     f50:	70a2                	ld	ra,40(sp)
     f52:	7402                	ld	s0,32(sp)
     f54:	6145                	addi	sp,sp,48
     f56:	8082                	ret

0000000000000f58 <malloc>:

void*
malloc(uint nbytes)
{
     f58:	7139                	addi	sp,sp,-64
     f5a:	fc06                	sd	ra,56(sp)
     f5c:	f822                	sd	s0,48(sp)
     f5e:	0080                	addi	s0,sp,64
     f60:	87aa                	mv	a5,a0
     f62:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f66:	fcc46783          	lwu	a5,-52(s0)
     f6a:	07bd                	addi	a5,a5,15
     f6c:	8391                	srli	a5,a5,0x4
     f6e:	2781                	sext.w	a5,a5
     f70:	2785                	addiw	a5,a5,1
     f72:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     f76:	00001797          	auipc	a5,0x1
     f7a:	cb278793          	addi	a5,a5,-846 # 1c28 <freep>
     f7e:	639c                	ld	a5,0(a5)
     f80:	fef43023          	sd	a5,-32(s0)
     f84:	fe043783          	ld	a5,-32(s0)
     f88:	ef95                	bnez	a5,fc4 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     f8a:	00001797          	auipc	a5,0x1
     f8e:	c8e78793          	addi	a5,a5,-882 # 1c18 <base>
     f92:	fef43023          	sd	a5,-32(s0)
     f96:	00001797          	auipc	a5,0x1
     f9a:	c9278793          	addi	a5,a5,-878 # 1c28 <freep>
     f9e:	fe043703          	ld	a4,-32(s0)
     fa2:	e398                	sd	a4,0(a5)
     fa4:	00001797          	auipc	a5,0x1
     fa8:	c8478793          	addi	a5,a5,-892 # 1c28 <freep>
     fac:	6398                	ld	a4,0(a5)
     fae:	00001797          	auipc	a5,0x1
     fb2:	c6a78793          	addi	a5,a5,-918 # 1c18 <base>
     fb6:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     fb8:	00001797          	auipc	a5,0x1
     fbc:	c6078793          	addi	a5,a5,-928 # 1c18 <base>
     fc0:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fc4:	fe043783          	ld	a5,-32(s0)
     fc8:	639c                	ld	a5,0(a5)
     fca:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     fce:	fe843783          	ld	a5,-24(s0)
     fd2:	4798                	lw	a4,8(a5)
     fd4:	fdc42783          	lw	a5,-36(s0)
     fd8:	2781                	sext.w	a5,a5
     fda:	06f76863          	bltu	a4,a5,104a <malloc+0xf2>
      if(p->s.size == nunits)
     fde:	fe843783          	ld	a5,-24(s0)
     fe2:	4798                	lw	a4,8(a5)
     fe4:	fdc42783          	lw	a5,-36(s0)
     fe8:	2781                	sext.w	a5,a5
     fea:	00e79963          	bne	a5,a4,ffc <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     fee:	fe843783          	ld	a5,-24(s0)
     ff2:	6398                	ld	a4,0(a5)
     ff4:	fe043783          	ld	a5,-32(s0)
     ff8:	e398                	sd	a4,0(a5)
     ffa:	a82d                	j	1034 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     ffc:	fe843783          	ld	a5,-24(s0)
    1000:	4798                	lw	a4,8(a5)
    1002:	fdc42783          	lw	a5,-36(s0)
    1006:	40f707bb          	subw	a5,a4,a5
    100a:	0007871b          	sext.w	a4,a5
    100e:	fe843783          	ld	a5,-24(s0)
    1012:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1014:	fe843783          	ld	a5,-24(s0)
    1018:	479c                	lw	a5,8(a5)
    101a:	1782                	slli	a5,a5,0x20
    101c:	9381                	srli	a5,a5,0x20
    101e:	0792                	slli	a5,a5,0x4
    1020:	fe843703          	ld	a4,-24(s0)
    1024:	97ba                	add	a5,a5,a4
    1026:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    102a:	fe843783          	ld	a5,-24(s0)
    102e:	fdc42703          	lw	a4,-36(s0)
    1032:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    1034:	00001797          	auipc	a5,0x1
    1038:	bf478793          	addi	a5,a5,-1036 # 1c28 <freep>
    103c:	fe043703          	ld	a4,-32(s0)
    1040:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    1042:	fe843783          	ld	a5,-24(s0)
    1046:	07c1                	addi	a5,a5,16
    1048:	a091                	j	108c <malloc+0x134>
    }
    if(p == freep)
    104a:	00001797          	auipc	a5,0x1
    104e:	bde78793          	addi	a5,a5,-1058 # 1c28 <freep>
    1052:	639c                	ld	a5,0(a5)
    1054:	fe843703          	ld	a4,-24(s0)
    1058:	02f71063          	bne	a4,a5,1078 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    105c:	fdc42783          	lw	a5,-36(s0)
    1060:	853e                	mv	a0,a5
    1062:	00000097          	auipc	ra,0x0
    1066:	e76080e7          	jalr	-394(ra) # ed8 <morecore>
    106a:	fea43423          	sd	a0,-24(s0)
    106e:	fe843783          	ld	a5,-24(s0)
    1072:	e399                	bnez	a5,1078 <malloc+0x120>
        return 0;
    1074:	4781                	li	a5,0
    1076:	a819                	j	108c <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1078:	fe843783          	ld	a5,-24(s0)
    107c:	fef43023          	sd	a5,-32(s0)
    1080:	fe843783          	ld	a5,-24(s0)
    1084:	639c                	ld	a5,0(a5)
    1086:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    108a:	b791                	j	fce <malloc+0x76>
  }
}
    108c:	853e                	mv	a0,a5
    108e:	70e2                	ld	ra,56(sp)
    1090:	7442                	ld	s0,48(sp)
    1092:	6121                	addi	sp,sp,64
    1094:	8082                	ret

0000000000001096 <setjmp>:
    1096:	e100                	sd	s0,0(a0)
    1098:	e504                	sd	s1,8(a0)
    109a:	01253823          	sd	s2,16(a0)
    109e:	01353c23          	sd	s3,24(a0)
    10a2:	03453023          	sd	s4,32(a0)
    10a6:	03553423          	sd	s5,40(a0)
    10aa:	03653823          	sd	s6,48(a0)
    10ae:	03753c23          	sd	s7,56(a0)
    10b2:	05853023          	sd	s8,64(a0)
    10b6:	05953423          	sd	s9,72(a0)
    10ba:	05a53823          	sd	s10,80(a0)
    10be:	05b53c23          	sd	s11,88(a0)
    10c2:	06153023          	sd	ra,96(a0)
    10c6:	06253423          	sd	sp,104(a0)
    10ca:	4501                	li	a0,0
    10cc:	8082                	ret

00000000000010ce <longjmp>:
    10ce:	6100                	ld	s0,0(a0)
    10d0:	6504                	ld	s1,8(a0)
    10d2:	01053903          	ld	s2,16(a0)
    10d6:	01853983          	ld	s3,24(a0)
    10da:	02053a03          	ld	s4,32(a0)
    10de:	02853a83          	ld	s5,40(a0)
    10e2:	03053b03          	ld	s6,48(a0)
    10e6:	03853b83          	ld	s7,56(a0)
    10ea:	04053c03          	ld	s8,64(a0)
    10ee:	04853c83          	ld	s9,72(a0)
    10f2:	05053d03          	ld	s10,80(a0)
    10f6:	05853d83          	ld	s11,88(a0)
    10fa:	06053083          	ld	ra,96(a0)
    10fe:	06853103          	ld	sp,104(a0)
    1102:	c199                	beqz	a1,1108 <longjmp_1>
    1104:	852e                	mv	a0,a1
    1106:	8082                	ret

0000000000001108 <longjmp_1>:
    1108:	4505                	li	a0,1
    110a:	8082                	ret

000000000000110c <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
    110c:	1101                	addi	sp,sp,-32
    110e:	ec22                	sd	s0,24(sp)
    1110:	1000                	addi	s0,sp,32
    1112:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
    1116:	fe843783          	ld	a5,-24(s0)
    111a:	639c                	ld	a5,0(a5)
    111c:	fe843703          	ld	a4,-24(s0)
    1120:	40f707b3          	sub	a5,a4,a5
    1124:	0017b793          	seqz	a5,a5
    1128:	0ff7f793          	andi	a5,a5,255
    112c:	2781                	sext.w	a5,a5
}
    112e:	853e                	mv	a0,a5
    1130:	6462                	ld	s0,24(sp)
    1132:	6105                	addi	sp,sp,32
    1134:	8082                	ret

0000000000001136 <fill_sparse>:
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

struct threads_sched_result fill_sparse(struct threads_sched_args args) {
    1136:	715d                	addi	sp,sp,-80
    1138:	e4a2                	sd	s0,72(sp)
    113a:	e0a6                	sd	s1,64(sp)
    113c:	0880                	addi	s0,sp,80
    113e:	84aa                	mv	s1,a0
    int sleep_time = -1;
    1140:	57fd                	li	a5,-1
    1142:	fef42623          	sw	a5,-20(s0)
    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1146:	689c                	ld	a5,16(s1)
    1148:	639c                	ld	a5,0(a5)
    114a:	fcf43c23          	sd	a5,-40(s0)
    114e:	fd843783          	ld	a5,-40(s0)
    1152:	17e1                	addi	a5,a5,-8
    1154:	fef43023          	sd	a5,-32(s0)
    1158:	a0a9                	j	11a2 <fill_sparse+0x6c>
        if (sleep_time < 0 || sleep_time > cur->release_time - args.current_time)
    115a:	fec42783          	lw	a5,-20(s0)
    115e:	2781                	sext.w	a5,a5
    1160:	0007cf63          	bltz	a5,117e <fill_sparse+0x48>
    1164:	fe043783          	ld	a5,-32(s0)
    1168:	4f98                	lw	a4,24(a5)
    116a:	409c                	lw	a5,0(s1)
    116c:	40f707bb          	subw	a5,a4,a5
    1170:	0007871b          	sext.w	a4,a5
    1174:	fec42783          	lw	a5,-20(s0)
    1178:	2781                	sext.w	a5,a5
    117a:	00f75a63          	bge	a4,a5,118e <fill_sparse+0x58>
            sleep_time = cur->release_time - args.current_time;
    117e:	fe043783          	ld	a5,-32(s0)
    1182:	4f98                	lw	a4,24(a5)
    1184:	409c                	lw	a5,0(s1)
    1186:	40f707bb          	subw	a5,a4,a5
    118a:	fef42623          	sw	a5,-20(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    118e:	fe043783          	ld	a5,-32(s0)
    1192:	679c                	ld	a5,8(a5)
    1194:	fcf43823          	sd	a5,-48(s0)
    1198:	fd043783          	ld	a5,-48(s0)
    119c:	17e1                	addi	a5,a5,-8
    119e:	fef43023          	sd	a5,-32(s0)
    11a2:	fe043783          	ld	a5,-32(s0)
    11a6:	00878713          	addi	a4,a5,8
    11aa:	689c                	ld	a5,16(s1)
    11ac:	faf717e3          	bne	a4,a5,115a <fill_sparse+0x24>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = args.run_queue;
    11b0:	649c                	ld	a5,8(s1)
    11b2:	faf43823          	sd	a5,-80(s0)
    r.allocated_time = sleep_time;
    11b6:	fec42783          	lw	a5,-20(s0)
    11ba:	faf42c23          	sw	a5,-72(s0)
    return r;    
    11be:	fb043783          	ld	a5,-80(s0)
    11c2:	fcf43023          	sd	a5,-64(s0)
    11c6:	fb843783          	ld	a5,-72(s0)
    11ca:	fcf43423          	sd	a5,-56(s0)
    11ce:	4701                	li	a4,0
    11d0:	fc043703          	ld	a4,-64(s0)
    11d4:	4781                	li	a5,0
    11d6:	fc843783          	ld	a5,-56(s0)
    11da:	863a                	mv	a2,a4
    11dc:	86be                	mv	a3,a5
    11de:	8732                	mv	a4,a2
    11e0:	87b6                	mv	a5,a3
}
    11e2:	853a                	mv	a0,a4
    11e4:	85be                	mv	a1,a5
    11e6:	6426                	ld	s0,72(sp)
    11e8:	6486                	ld	s1,64(sp)
    11ea:	6161                	addi	sp,sp,80
    11ec:	8082                	ret

00000000000011ee <schedule_default>:

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    11ee:	715d                	addi	sp,sp,-80
    11f0:	e4a2                	sd	s0,72(sp)
    11f2:	e0a6                	sd	s1,64(sp)
    11f4:	0880                	addi	s0,sp,80
    11f6:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
    11f8:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    11fc:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1200:	649c                	ld	a5,8(s1)
    1202:	639c                	ld	a5,0(a5)
    1204:	fcf43c23          	sd	a5,-40(s0)
    1208:	fd843783          	ld	a5,-40(s0)
    120c:	fd878793          	addi	a5,a5,-40
    1210:	fef43023          	sd	a5,-32(s0)
    1214:	a81d                	j	124a <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
    1216:	fe843783          	ld	a5,-24(s0)
    121a:	cb89                	beqz	a5,122c <schedule_default+0x3e>
    121c:	fe043783          	ld	a5,-32(s0)
    1220:	5fd8                	lw	a4,60(a5)
    1222:	fe843783          	ld	a5,-24(s0)
    1226:	5fdc                	lw	a5,60(a5)
    1228:	00f75663          	bge	a4,a5,1234 <schedule_default+0x46>
            thread_with_smallest_id = th;
    122c:	fe043783          	ld	a5,-32(s0)
    1230:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1234:	fe043783          	ld	a5,-32(s0)
    1238:	779c                	ld	a5,40(a5)
    123a:	fcf43823          	sd	a5,-48(s0)
    123e:	fd043783          	ld	a5,-48(s0)
    1242:	fd878793          	addi	a5,a5,-40
    1246:	fef43023          	sd	a5,-32(s0)
    124a:	fe043783          	ld	a5,-32(s0)
    124e:	02878713          	addi	a4,a5,40
    1252:	649c                	ld	a5,8(s1)
    1254:	fcf711e3          	bne	a4,a5,1216 <schedule_default+0x28>
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
    1258:	fe843783          	ld	a5,-24(s0)
    125c:	cf89                	beqz	a5,1276 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
    125e:	fe843783          	ld	a5,-24(s0)
    1262:	02878793          	addi	a5,a5,40
    1266:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
    126a:	fe843783          	ld	a5,-24(s0)
    126e:	4fbc                	lw	a5,88(a5)
    1270:	faf42c23          	sw	a5,-72(s0)
    1274:	a039                	j	1282 <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1276:	649c                	ld	a5,8(s1)
    1278:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
    127c:	4785                	li	a5,1
    127e:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
    1282:	fb043783          	ld	a5,-80(s0)
    1286:	fcf43023          	sd	a5,-64(s0)
    128a:	fb843783          	ld	a5,-72(s0)
    128e:	fcf43423          	sd	a5,-56(s0)
    1292:	4701                	li	a4,0
    1294:	fc043703          	ld	a4,-64(s0)
    1298:	4781                	li	a5,0
    129a:	fc843783          	ld	a5,-56(s0)
    129e:	863a                	mv	a2,a4
    12a0:	86be                	mv	a3,a5
    12a2:	8732                	mv	a4,a2
    12a4:	87b6                	mv	a5,a3
}
    12a6:	853a                	mv	a0,a4
    12a8:	85be                	mv	a1,a5
    12aa:	6426                	ld	s0,72(sp)
    12ac:	6486                	ld	s1,64(sp)
    12ae:	6161                	addi	sp,sp,80
    12b0:	8082                	ret

00000000000012b2 <schedule_wrr>:

/* MP3 Part 1 - Non-Real-Time Scheduling */
/* Weighted-Round-Robin Scheduling */
struct threads_sched_result schedule_wrr(struct threads_sched_args args)
{   
    12b2:	7135                	addi	sp,sp,-160
    12b4:	ed06                	sd	ra,152(sp)
    12b6:	e922                	sd	s0,144(sp)
    12b8:	e526                	sd	s1,136(sp)
    12ba:	e14a                	sd	s2,128(sp)
    12bc:	fcce                	sd	s3,120(sp)
    12be:	1100                	addi	s0,sp,160
    12c0:	84aa                	mv	s1,a0
    // TODO: implement the weighted round-robin scheduling algorithm
    if (list_empty(args.run_queue)) 
    12c2:	649c                	ld	a5,8(s1)
    12c4:	853e                	mv	a0,a5
    12c6:	00000097          	auipc	ra,0x0
    12ca:	e46080e7          	jalr	-442(ra) # 110c <list_empty>
    12ce:	87aa                	mv	a5,a0
    12d0:	cb85                	beqz	a5,1300 <schedule_wrr+0x4e>
        return fill_sparse(args);
    12d2:	609c                	ld	a5,0(s1)
    12d4:	f6f43023          	sd	a5,-160(s0)
    12d8:	649c                	ld	a5,8(s1)
    12da:	f6f43423          	sd	a5,-152(s0)
    12de:	689c                	ld	a5,16(s1)
    12e0:	f6f43823          	sd	a5,-144(s0)
    12e4:	f6040793          	addi	a5,s0,-160
    12e8:	853e                	mv	a0,a5
    12ea:	00000097          	auipc	ra,0x0
    12ee:	e4c080e7          	jalr	-436(ra) # 1136 <fill_sparse>
    12f2:	872a                	mv	a4,a0
    12f4:	87ae                	mv	a5,a1
    12f6:	f8e43823          	sd	a4,-112(s0)
    12fa:	f8f43c23          	sd	a5,-104(s0)
    12fe:	a0c9                	j	13c0 <schedule_wrr+0x10e>

    struct thread *process_thread = NULL;
    1300:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1304:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1308:	649c                	ld	a5,8(s1)
    130a:	639c                	ld	a5,0(a5)
    130c:	faf43823          	sd	a5,-80(s0)
    1310:	fb043783          	ld	a5,-80(s0)
    1314:	fd878793          	addi	a5,a5,-40
    1318:	fcf43023          	sd	a5,-64(s0)
    131c:	a025                	j	1344 <schedule_wrr+0x92>
        if (process_thread == NULL) {
    131e:	fc843783          	ld	a5,-56(s0)
    1322:	e791                	bnez	a5,132e <schedule_wrr+0x7c>
            process_thread = th;
    1324:	fc043783          	ld	a5,-64(s0)
    1328:	fcf43423          	sd	a5,-56(s0)
            break;
    132c:	a01d                	j	1352 <schedule_wrr+0xa0>
    list_for_each_entry(th, args.run_queue, thread_list) {
    132e:	fc043783          	ld	a5,-64(s0)
    1332:	779c                	ld	a5,40(a5)
    1334:	faf43423          	sd	a5,-88(s0)
    1338:	fa843783          	ld	a5,-88(s0)
    133c:	fd878793          	addi	a5,a5,-40
    1340:	fcf43023          	sd	a5,-64(s0)
    1344:	fc043783          	ld	a5,-64(s0)
    1348:	02878713          	addi	a4,a5,40
    134c:	649c                	ld	a5,8(s1)
    134e:	fcf718e3          	bne	a4,a5,131e <schedule_wrr+0x6c>
        }
    }
    
    int time_quantum = args.time_quantum;
    1352:	40dc                	lw	a5,4(s1)
    1354:	faf42223          	sw	a5,-92(s0)
    int executing_time = process_thread->remaining_time;
    1358:	fc843783          	ld	a5,-56(s0)
    135c:	4fbc                	lw	a5,88(a5)
    135e:	faf42e23          	sw	a5,-68(s0)
    if (process_thread->remaining_time > time_quantum * (process_thread->weight)) {
    1362:	fc843783          	ld	a5,-56(s0)
    1366:	4fb4                	lw	a3,88(a5)
    1368:	fc843783          	ld	a5,-56(s0)
    136c:	47bc                	lw	a5,72(a5)
    136e:	fa442703          	lw	a4,-92(s0)
    1372:	02f707bb          	mulw	a5,a4,a5
    1376:	2781                	sext.w	a5,a5
    1378:	8736                	mv	a4,a3
    137a:	00e7dc63          	bge	a5,a4,1392 <schedule_wrr+0xe0>
        executing_time = time_quantum * (process_thread->weight);
    137e:	fc843783          	ld	a5,-56(s0)
    1382:	47bc                	lw	a5,72(a5)
    1384:	fa442703          	lw	a4,-92(s0)
    1388:	02f707bb          	mulw	a5,a4,a5
    138c:	faf42e23          	sw	a5,-68(s0)
    1390:	a031                	j	139c <schedule_wrr+0xea>
    }
    else {
        executing_time = process_thread->remaining_time;
    1392:	fc843783          	ld	a5,-56(s0)
    1396:	4fbc                	lw	a5,88(a5)
    1398:	faf42e23          	sw	a5,-68(s0)
    }
    
    struct threads_sched_result r;
    r.scheduled_thread_list_member = &process_thread->thread_list;
    139c:	fc843783          	ld	a5,-56(s0)
    13a0:	02878793          	addi	a5,a5,40
    13a4:	f8f43023          	sd	a5,-128(s0)
    r.allocated_time = executing_time;
    13a8:	fbc42783          	lw	a5,-68(s0)
    13ac:	f8f42423          	sw	a5,-120(s0)
    return r;
    13b0:	f8043783          	ld	a5,-128(s0)
    13b4:	f8f43823          	sd	a5,-112(s0)
    13b8:	f8843783          	ld	a5,-120(s0)
    13bc:	f8f43c23          	sd	a5,-104(s0)
    13c0:	4701                	li	a4,0
    13c2:	f9043703          	ld	a4,-112(s0)
    13c6:	4781                	li	a5,0
    13c8:	f9843783          	ld	a5,-104(s0)
    13cc:	893a                	mv	s2,a4
    13ce:	89be                	mv	s3,a5
    13d0:	874a                	mv	a4,s2
    13d2:	87ce                	mv	a5,s3
}
    13d4:	853a                	mv	a0,a4
    13d6:	85be                	mv	a1,a5
    13d8:	60ea                	ld	ra,152(sp)
    13da:	644a                	ld	s0,144(sp)
    13dc:	64aa                	ld	s1,136(sp)
    13de:	690a                	ld	s2,128(sp)
    13e0:	79e6                	ld	s3,120(sp)
    13e2:	610d                	addi	sp,sp,160
    13e4:	8082                	ret

00000000000013e6 <schedule_sjf>:

/* Shortest-Job-First Scheduling */
struct threads_sched_result schedule_sjf(struct threads_sched_args args)
{   
    13e6:	7131                	addi	sp,sp,-192
    13e8:	fd06                	sd	ra,184(sp)
    13ea:	f922                	sd	s0,176(sp)
    13ec:	f526                	sd	s1,168(sp)
    13ee:	f14a                	sd	s2,160(sp)
    13f0:	ed4e                	sd	s3,152(sp)
    13f2:	0180                	addi	s0,sp,192
    13f4:	84aa                	mv	s1,a0
    // TODO: implement the shortest-job-first scheduling algorithm
    if (list_empty(args.run_queue)) 
    13f6:	649c                	ld	a5,8(s1)
    13f8:	853e                	mv	a0,a5
    13fa:	00000097          	auipc	ra,0x0
    13fe:	d12080e7          	jalr	-750(ra) # 110c <list_empty>
    1402:	87aa                	mv	a5,a0
    1404:	cb85                	beqz	a5,1434 <schedule_sjf+0x4e>
        return fill_sparse(args);
    1406:	609c                	ld	a5,0(s1)
    1408:	f4f43023          	sd	a5,-192(s0)
    140c:	649c                	ld	a5,8(s1)
    140e:	f4f43423          	sd	a5,-184(s0)
    1412:	689c                	ld	a5,16(s1)
    1414:	f4f43823          	sd	a5,-176(s0)
    1418:	f4040793          	addi	a5,s0,-192
    141c:	853e                	mv	a0,a5
    141e:	00000097          	auipc	ra,0x0
    1422:	d18080e7          	jalr	-744(ra) # 1136 <fill_sparse>
    1426:	872a                	mv	a4,a0
    1428:	87ae                	mv	a5,a1
    142a:	f6e43c23          	sd	a4,-136(s0)
    142e:	f8f43023          	sd	a5,-128(s0)
    1432:	aa49                	j	15c4 <schedule_sjf+0x1de>

    int current_time = args.current_time;
    1434:	409c                	lw	a5,0(s1)
    1436:	faf42823          	sw	a5,-80(s0)

    // find the shortest thread in the run queue
    struct thread *shortest_thread = NULL;
    143a:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    143e:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1442:	649c                	ld	a5,8(s1)
    1444:	639c                	ld	a5,0(a5)
    1446:	faf43423          	sd	a5,-88(s0)
    144a:	fa843783          	ld	a5,-88(s0)
    144e:	fd878793          	addi	a5,a5,-40
    1452:	fcf43023          	sd	a5,-64(s0)
    1456:	a085                	j	14b6 <schedule_sjf+0xd0>
        if (shortest_thread == NULL || th->remaining_time < shortest_thread->remaining_time) {
    1458:	fc843783          	ld	a5,-56(s0)
    145c:	cb89                	beqz	a5,146e <schedule_sjf+0x88>
    145e:	fc043783          	ld	a5,-64(s0)
    1462:	4fb8                	lw	a4,88(a5)
    1464:	fc843783          	ld	a5,-56(s0)
    1468:	4fbc                	lw	a5,88(a5)
    146a:	00f75763          	bge	a4,a5,1478 <schedule_sjf+0x92>
            shortest_thread = th;
    146e:	fc043783          	ld	a5,-64(s0)
    1472:	fcf43423          	sd	a5,-56(s0)
    1476:	a02d                	j	14a0 <schedule_sjf+0xba>
        }
        else if (th->remaining_time == shortest_thread->remaining_time && th->ID < shortest_thread->ID) {
    1478:	fc043783          	ld	a5,-64(s0)
    147c:	4fb8                	lw	a4,88(a5)
    147e:	fc843783          	ld	a5,-56(s0)
    1482:	4fbc                	lw	a5,88(a5)
    1484:	00f71e63          	bne	a4,a5,14a0 <schedule_sjf+0xba>
    1488:	fc043783          	ld	a5,-64(s0)
    148c:	5fd8                	lw	a4,60(a5)
    148e:	fc843783          	ld	a5,-56(s0)
    1492:	5fdc                	lw	a5,60(a5)
    1494:	00f75663          	bge	a4,a5,14a0 <schedule_sjf+0xba>
            shortest_thread = th;
    1498:	fc043783          	ld	a5,-64(s0)
    149c:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    14a0:	fc043783          	ld	a5,-64(s0)
    14a4:	779c                	ld	a5,40(a5)
    14a6:	f8f43423          	sd	a5,-120(s0)
    14aa:	f8843783          	ld	a5,-120(s0)
    14ae:	fd878793          	addi	a5,a5,-40
    14b2:	fcf43023          	sd	a5,-64(s0)
    14b6:	fc043783          	ld	a5,-64(s0)
    14ba:	02878713          	addi	a4,a5,40
    14be:	649c                	ld	a5,8(s1)
    14c0:	f8f71ce3          	bne	a4,a5,1458 <schedule_sjf+0x72>
        }
    }

    struct release_queue_entry *cur;
    int executing_time = shortest_thread->remaining_time;
    14c4:	fc843783          	ld	a5,-56(s0)
    14c8:	4fbc                	lw	a5,88(a5)
    14ca:	faf42a23          	sw	a5,-76(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    14ce:	689c                	ld	a5,16(s1)
    14d0:	639c                	ld	a5,0(a5)
    14d2:	faf43023          	sd	a5,-96(s0)
    14d6:	fa043783          	ld	a5,-96(s0)
    14da:	17e1                	addi	a5,a5,-8
    14dc:	faf43c23          	sd	a5,-72(s0)
    14e0:	a84d                	j	1592 <schedule_sjf+0x1ac>
        int interval = cur->release_time - current_time;
    14e2:	fb843783          	ld	a5,-72(s0)
    14e6:	4f98                	lw	a4,24(a5)
    14e8:	fb042783          	lw	a5,-80(s0)
    14ec:	40f707bb          	subw	a5,a4,a5
    14f0:	f8f42e23          	sw	a5,-100(s0)
        if (interval > executing_time) continue;
    14f4:	f9c42703          	lw	a4,-100(s0)
    14f8:	fb442783          	lw	a5,-76(s0)
    14fc:	2701                	sext.w	a4,a4
    14fe:	2781                	sext.w	a5,a5
    1500:	06e7c863          	blt	a5,a4,1570 <schedule_sjf+0x18a>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1504:	fc843783          	ld	a5,-56(s0)
    1508:	4fbc                	lw	a5,88(a5)
    150a:	fb042703          	lw	a4,-80(s0)
    150e:	9fb9                	addw	a5,a5,a4
    1510:	0007871b          	sext.w	a4,a5
    1514:	fb843783          	ld	a5,-72(s0)
    1518:	4f9c                	lw	a5,24(a5)
    151a:	04f74d63          	blt	a4,a5,1574 <schedule_sjf+0x18e>
        int remaining_time = shortest_thread->remaining_time - interval;
    151e:	fc843783          	ld	a5,-56(s0)
    1522:	4fb8                	lw	a4,88(a5)
    1524:	f9c42783          	lw	a5,-100(s0)
    1528:	40f707bb          	subw	a5,a4,a5
    152c:	f8f42c23          	sw	a5,-104(s0)
        if (remaining_time < cur->thrd->processing_time) continue;
    1530:	fb843783          	ld	a5,-72(s0)
    1534:	639c                	ld	a5,0(a5)
    1536:	43f8                	lw	a4,68(a5)
    1538:	f9842783          	lw	a5,-104(s0)
    153c:	2781                	sext.w	a5,a5
    153e:	02e7cd63          	blt	a5,a4,1578 <schedule_sjf+0x192>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    1542:	fb843783          	ld	a5,-72(s0)
    1546:	639c                	ld	a5,0(a5)
    1548:	43f8                	lw	a4,68(a5)
    154a:	f9842783          	lw	a5,-104(s0)
    154e:	2781                	sext.w	a5,a5
    1550:	00e79b63          	bne	a5,a4,1566 <schedule_sjf+0x180>
    1554:	fc843783          	ld	a5,-56(s0)
    1558:	5fd8                	lw	a4,60(a5)
    155a:	fb843783          	ld	a5,-72(s0)
    155e:	639c                	ld	a5,0(a5)
    1560:	5fdc                	lw	a5,60(a5)
    1562:	00f74d63          	blt	a4,a5,157c <schedule_sjf+0x196>
        executing_time = interval;
    1566:	f9c42783          	lw	a5,-100(s0)
    156a:	faf42a23          	sw	a5,-76(s0)
    156e:	a801                	j	157e <schedule_sjf+0x198>
        if (interval > executing_time) continue;
    1570:	0001                	nop
    1572:	a031                	j	157e <schedule_sjf+0x198>
        if (current_time + shortest_thread->remaining_time < cur->release_time ) continue; 
    1574:	0001                	nop
    1576:	a021                	j	157e <schedule_sjf+0x198>
        if (remaining_time < cur->thrd->processing_time) continue;
    1578:	0001                	nop
    157a:	a011                	j	157e <schedule_sjf+0x198>
        if (remaining_time == cur->thrd->processing_time && shortest_thread->ID < cur->thrd->ID) continue;
    157c:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    157e:	fb843783          	ld	a5,-72(s0)
    1582:	679c                	ld	a5,8(a5)
    1584:	f8f43823          	sd	a5,-112(s0)
    1588:	f9043783          	ld	a5,-112(s0)
    158c:	17e1                	addi	a5,a5,-8
    158e:	faf43c23          	sd	a5,-72(s0)
    1592:	fb843783          	ld	a5,-72(s0)
    1596:	00878713          	addi	a4,a5,8
    159a:	689c                	ld	a5,16(s1)
    159c:	f4f713e3          	bne	a4,a5,14e2 <schedule_sjf+0xfc>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &shortest_thread->thread_list;
    15a0:	fc843783          	ld	a5,-56(s0)
    15a4:	02878793          	addi	a5,a5,40
    15a8:	f6f43423          	sd	a5,-152(s0)
    r.allocated_time = executing_time;
    15ac:	fb442783          	lw	a5,-76(s0)
    15b0:	f6f42823          	sw	a5,-144(s0)
    return r;
    15b4:	f6843783          	ld	a5,-152(s0)
    15b8:	f6f43c23          	sd	a5,-136(s0)
    15bc:	f7043783          	ld	a5,-144(s0)
    15c0:	f8f43023          	sd	a5,-128(s0)
    15c4:	4701                	li	a4,0
    15c6:	f7843703          	ld	a4,-136(s0)
    15ca:	4781                	li	a5,0
    15cc:	f8043783          	ld	a5,-128(s0)
    15d0:	893a                	mv	s2,a4
    15d2:	89be                	mv	s3,a5
    15d4:	874a                	mv	a4,s2
    15d6:	87ce                	mv	a5,s3
}
    15d8:	853a                	mv	a0,a4
    15da:	85be                	mv	a1,a5
    15dc:	70ea                	ld	ra,184(sp)
    15de:	744a                	ld	s0,176(sp)
    15e0:	74aa                	ld	s1,168(sp)
    15e2:	790a                	ld	s2,160(sp)
    15e4:	69ea                	ld	s3,152(sp)
    15e6:	6129                	addi	sp,sp,192
    15e8:	8082                	ret

00000000000015ea <schedule_lst>:

/* MP3 Part 2 - Real-Time Scheduling*/
/* Least-Slack-Time Scheduling */
struct threads_sched_result schedule_lst(struct threads_sched_args args)
{
    15ea:	7115                	addi	sp,sp,-224
    15ec:	ed86                	sd	ra,216(sp)
    15ee:	e9a2                	sd	s0,208(sp)
    15f0:	e5a6                	sd	s1,200(sp)
    15f2:	e1ca                	sd	s2,192(sp)
    15f4:	fd4e                	sd	s3,184(sp)
    15f6:	1180                	addi	s0,sp,224
    15f8:	84aa                	mv	s1,a0
    // TODO: implement the least-slack-time scheduling algorithm
    // A slack time is defined by current deadline − current time − remaining time
    
    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    15fa:	649c                	ld	a5,8(s1)
    15fc:	853e                	mv	a0,a5
    15fe:	00000097          	auipc	ra,0x0
    1602:	b0e080e7          	jalr	-1266(ra) # 110c <list_empty>
    1606:	87aa                	mv	a5,a0
    1608:	cb85                	beqz	a5,1638 <schedule_lst+0x4e>
        return fill_sparse(args);
    160a:	609c                	ld	a5,0(s1)
    160c:	f2f43023          	sd	a5,-224(s0)
    1610:	649c                	ld	a5,8(s1)
    1612:	f2f43423          	sd	a5,-216(s0)
    1616:	689c                	ld	a5,16(s1)
    1618:	f2f43823          	sd	a5,-208(s0)
    161c:	f2040793          	addi	a5,s0,-224
    1620:	853e                	mv	a0,a5
    1622:	00000097          	auipc	ra,0x0
    1626:	b14080e7          	jalr	-1260(ra) # 1136 <fill_sparse>
    162a:	872a                	mv	a4,a0
    162c:	87ae                	mv	a5,a1
    162e:	f6e43023          	sd	a4,-160(s0)
    1632:	f6f43423          	sd	a5,-152(s0)
    1636:	ac41                	j	18c6 <schedule_lst+0x2dc>

    int current_time = args.current_time;
    1638:	409c                	lw	a5,0(s1)
    163a:	faf42623          	sw	a5,-84(s0)

    // find the thread with the least slack time
    struct thread *least_slack_thread = NULL;
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
    165a:	a239                	j	1768 <schedule_lst+0x17e>
        int slack_time = th->current_deadline - current_time - th->remaining_time;
    165c:	fc043783          	ld	a5,-64(s0)
    1660:	4ff8                	lw	a4,92(a5)
    1662:	fac42783          	lw	a5,-84(s0)
    1666:	40f707bb          	subw	a5,a4,a5
    166a:	0007871b          	sext.w	a4,a5
    166e:	fc043783          	ld	a5,-64(s0)
    1672:	4fbc                	lw	a5,88(a5)
    1674:	40f707bb          	subw	a5,a4,a5
    1678:	f6f42e23          	sw	a5,-132(s0)
        int least_slack_time = (least_slack_thread == NULL) ? 0 : least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    167c:	fc843783          	ld	a5,-56(s0)
    1680:	c38d                	beqz	a5,16a2 <schedule_lst+0xb8>
    1682:	fc843783          	ld	a5,-56(s0)
    1686:	4ff8                	lw	a4,92(a5)
    1688:	fac42783          	lw	a5,-84(s0)
    168c:	40f707bb          	subw	a5,a4,a5
    1690:	0007871b          	sext.w	a4,a5
    1694:	fc843783          	ld	a5,-56(s0)
    1698:	4fbc                	lw	a5,88(a5)
    169a:	40f707bb          	subw	a5,a4,a5
    169e:	2781                	sext.w	a5,a5
    16a0:	a011                	j	16a4 <schedule_lst+0xba>
    16a2:	4781                	li	a5,0
    16a4:	f6f42c23          	sw	a5,-136(s0)
        if (least_slack_thread == NULL) {
    16a8:	fc843783          	ld	a5,-56(s0)
    16ac:	e791                	bnez	a5,16b8 <schedule_lst+0xce>
            least_slack_thread = th;
    16ae:	fc043783          	ld	a5,-64(s0)
    16b2:	fcf43423          	sd	a5,-56(s0)
    16b6:	a871                	j	1752 <schedule_lst+0x168>
        }
        else if (least_slack_thread->current_deadline <= current_time) { // missing the deadline
    16b8:	fc843783          	ld	a5,-56(s0)
    16bc:	4ff8                	lw	a4,92(a5)
    16be:	fac42783          	lw	a5,-84(s0)
    16c2:	2781                	sext.w	a5,a5
    16c4:	02e7c763          	blt	a5,a4,16f2 <schedule_lst+0x108>
            if (th->current_deadline > current_time) continue;
    16c8:	fc043783          	ld	a5,-64(s0)
    16cc:	4ff8                	lw	a4,92(a5)
    16ce:	fac42783          	lw	a5,-84(s0)
    16d2:	2781                	sext.w	a5,a5
    16d4:	06e7ce63          	blt	a5,a4,1750 <schedule_lst+0x166>
            if (th->ID < least_slack_thread->ID) {
    16d8:	fc043783          	ld	a5,-64(s0)
    16dc:	5fd8                	lw	a4,60(a5)
    16de:	fc843783          	ld	a5,-56(s0)
    16e2:	5fdc                	lw	a5,60(a5)
    16e4:	06f75763          	bge	a4,a5,1752 <schedule_lst+0x168>
                least_slack_thread = th;
    16e8:	fc043783          	ld	a5,-64(s0)
    16ec:	fcf43423          	sd	a5,-56(s0)
    16f0:	a08d                	j	1752 <schedule_lst+0x168>
            }
        }
        else if (th->current_deadline <= current_time) {
    16f2:	fc043783          	ld	a5,-64(s0)
    16f6:	4ff8                	lw	a4,92(a5)
    16f8:	fac42783          	lw	a5,-84(s0)
    16fc:	2781                	sext.w	a5,a5
    16fe:	00e7c763          	blt	a5,a4,170c <schedule_lst+0x122>
            least_slack_thread = th;
    1702:	fc043783          	ld	a5,-64(s0)
    1706:	fcf43423          	sd	a5,-56(s0)
    170a:	a0a1                	j	1752 <schedule_lst+0x168>
        }
        else if (slack_time < least_slack_time) {
    170c:	f7c42703          	lw	a4,-132(s0)
    1710:	f7842783          	lw	a5,-136(s0)
    1714:	2701                	sext.w	a4,a4
    1716:	2781                	sext.w	a5,a5
    1718:	00f75763          	bge	a4,a5,1726 <schedule_lst+0x13c>
            least_slack_thread = th;
    171c:	fc043783          	ld	a5,-64(s0)
    1720:	fcf43423          	sd	a5,-56(s0)
    1724:	a03d                	j	1752 <schedule_lst+0x168>
        }
        else if (slack_time == least_slack_time && th->ID < least_slack_thread->ID) {
    1726:	f7c42703          	lw	a4,-132(s0)
    172a:	f7842783          	lw	a5,-136(s0)
    172e:	2701                	sext.w	a4,a4
    1730:	2781                	sext.w	a5,a5
    1732:	02f71063          	bne	a4,a5,1752 <schedule_lst+0x168>
    1736:	fc043783          	ld	a5,-64(s0)
    173a:	5fd8                	lw	a4,60(a5)
    173c:	fc843783          	ld	a5,-56(s0)
    1740:	5fdc                	lw	a5,60(a5)
    1742:	00f75863          	bge	a4,a5,1752 <schedule_lst+0x168>
            least_slack_thread = th;
    1746:	fc043783          	ld	a5,-64(s0)
    174a:	fcf43423          	sd	a5,-56(s0)
    174e:	a011                	j	1752 <schedule_lst+0x168>
            if (th->current_deadline > current_time) continue;
    1750:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1752:	fc043783          	ld	a5,-64(s0)
    1756:	779c                	ld	a5,40(a5)
    1758:	f6f43823          	sd	a5,-144(s0)
    175c:	f7043783          	ld	a5,-144(s0)
    1760:	fd878793          	addi	a5,a5,-40
    1764:	fcf43023          	sd	a5,-64(s0)
    1768:	fc043783          	ld	a5,-64(s0)
    176c:	02878713          	addi	a4,a5,40
    1770:	649c                	ld	a5,8(s1)
    1772:	eef715e3          	bne	a4,a5,165c <schedule_lst+0x72>
        }
    }

    // all thread missing the current deadline
    if (least_slack_thread->current_deadline <= current_time)
    1776:	fc843783          	ld	a5,-56(s0)
    177a:	4ff8                	lw	a4,92(a5)
    177c:	fac42783          	lw	a5,-84(s0)
    1780:	2781                	sext.w	a5,a5
    1782:	00e7cb63          	blt	a5,a4,1798 <schedule_lst+0x1ae>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &least_slack_thread->thread_list, .allocated_time = 0 };
    1786:	fc843783          	ld	a5,-56(s0)
    178a:	02878793          	addi	a5,a5,40
    178e:	f6f43023          	sd	a5,-160(s0)
    1792:	f6042423          	sw	zero,-152(s0)
    1796:	aa05                	j	18c6 <schedule_lst+0x2dc>
    
    int executing_time = least_slack_thread->remaining_time;
    1798:	fc843783          	ld	a5,-56(s0)
    179c:	4fbc                	lw	a5,88(a5)
    179e:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (least_slack_thread->remaining_time > least_slack_thread->current_deadline - current_time) 
    17a2:	fc843783          	ld	a5,-56(s0)
    17a6:	4fb4                	lw	a3,88(a5)
    17a8:	fc843783          	ld	a5,-56(s0)
    17ac:	4ff8                	lw	a4,92(a5)
    17ae:	fac42783          	lw	a5,-84(s0)
    17b2:	40f707bb          	subw	a5,a4,a5
    17b6:	2781                	sext.w	a5,a5
    17b8:	8736                	mv	a4,a3
    17ba:	00e7db63          	bge	a5,a4,17d0 <schedule_lst+0x1e6>
        executing_time = least_slack_thread->current_deadline - current_time;
    17be:	fc843783          	ld	a5,-56(s0)
    17c2:	4ff8                	lw	a4,92(a5)
    17c4:	fac42783          	lw	a5,-84(s0)
    17c8:	40f707bb          	subw	a5,a4,a5
    17cc:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    int slack_time = least_slack_thread->current_deadline - current_time - least_slack_thread->remaining_time;
    17d0:	fc843783          	ld	a5,-56(s0)
    17d4:	4ff8                	lw	a4,92(a5)
    17d6:	fac42783          	lw	a5,-84(s0)
    17da:	40f707bb          	subw	a5,a4,a5
    17de:	0007871b          	sext.w	a4,a5
    17e2:	fc843783          	ld	a5,-56(s0)
    17e6:	4fbc                	lw	a5,88(a5)
    17e8:	40f707bb          	subw	a5,a4,a5
    17ec:	f8f42e23          	sw	a5,-100(s0)
    list_for_each_entry(cur, args.release_queue, thread_list) {
    17f0:	689c                	ld	a5,16(s1)
    17f2:	639c                	ld	a5,0(a5)
    17f4:	f8f43823          	sd	a5,-112(s0)
    17f8:	f9043783          	ld	a5,-112(s0)
    17fc:	17e1                	addi	a5,a5,-8
    17fe:	faf43823          	sd	a5,-80(s0)
    1802:	a849                	j	1894 <schedule_lst+0x2aa>
        int cur_slack_time = cur->thrd->deadline - cur->thrd->processing_time;
    1804:	fb043783          	ld	a5,-80(s0)
    1808:	639c                	ld	a5,0(a5)
    180a:	47f8                	lw	a4,76(a5)
    180c:	fb043783          	ld	a5,-80(s0)
    1810:	639c                	ld	a5,0(a5)
    1812:	43fc                	lw	a5,68(a5)
    1814:	40f707bb          	subw	a5,a4,a5
    1818:	f8f42623          	sw	a5,-116(s0)
        int interval = cur->release_time - current_time;
    181c:	fb043783          	ld	a5,-80(s0)
    1820:	4f98                	lw	a4,24(a5)
    1822:	fac42783          	lw	a5,-84(s0)
    1826:	40f707bb          	subw	a5,a4,a5
    182a:	f8f42423          	sw	a5,-120(s0)
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    182e:	f8842703          	lw	a4,-120(s0)
    1832:	fbc42783          	lw	a5,-68(s0)
    1836:	2701                	sext.w	a4,a4
    1838:	2781                	sext.w	a5,a5
    183a:	04e7c063          	blt	a5,a4,187a <schedule_lst+0x290>
    183e:	f9c42703          	lw	a4,-100(s0)
    1842:	f8c42783          	lw	a5,-116(s0)
    1846:	2701                	sext.w	a4,a4
    1848:	2781                	sext.w	a5,a5
    184a:	02f74863          	blt	a4,a5,187a <schedule_lst+0x290>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    184e:	f9c42703          	lw	a4,-100(s0)
    1852:	f8c42783          	lw	a5,-116(s0)
    1856:	2701                	sext.w	a4,a4
    1858:	2781                	sext.w	a5,a5
    185a:	00f71b63          	bne	a4,a5,1870 <schedule_lst+0x286>
    185e:	fc843783          	ld	a5,-56(s0)
    1862:	5fd8                	lw	a4,60(a5)
    1864:	fb043783          	ld	a5,-80(s0)
    1868:	639c                	ld	a5,0(a5)
    186a:	5fdc                	lw	a5,60(a5)
    186c:	00f74963          	blt	a4,a5,187e <schedule_lst+0x294>
        executing_time = interval;
    1870:	f8842783          	lw	a5,-120(s0)
    1874:	faf42e23          	sw	a5,-68(s0)
    1878:	a021                	j	1880 <schedule_lst+0x296>
        if (interval > executing_time || slack_time < cur_slack_time) continue;
    187a:	0001                	nop
    187c:	a011                	j	1880 <schedule_lst+0x296>
        if (slack_time == cur_slack_time && least_slack_thread->ID < cur->thrd->ID) continue;
    187e:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1880:	fb043783          	ld	a5,-80(s0)
    1884:	679c                	ld	a5,8(a5)
    1886:	f8f43023          	sd	a5,-128(s0)
    188a:	f8043783          	ld	a5,-128(s0)
    188e:	17e1                	addi	a5,a5,-8
    1890:	faf43823          	sd	a5,-80(s0)
    1894:	fb043783          	ld	a5,-80(s0)
    1898:	00878713          	addi	a4,a5,8
    189c:	689c                	ld	a5,16(s1)
    189e:	f6f713e3          	bne	a4,a5,1804 <schedule_lst+0x21a>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &least_slack_thread->thread_list;
    18a2:	fc843783          	ld	a5,-56(s0)
    18a6:	02878793          	addi	a5,a5,40
    18aa:	f4f43823          	sd	a5,-176(s0)
    r.allocated_time = executing_time;
    18ae:	fbc42783          	lw	a5,-68(s0)
    18b2:	f4f42c23          	sw	a5,-168(s0)
    return r;
    18b6:	f5043783          	ld	a5,-176(s0)
    18ba:	f6f43023          	sd	a5,-160(s0)
    18be:	f5843783          	ld	a5,-168(s0)
    18c2:	f6f43423          	sd	a5,-152(s0)
    18c6:	4701                	li	a4,0
    18c8:	f6043703          	ld	a4,-160(s0)
    18cc:	4781                	li	a5,0
    18ce:	f6843783          	ld	a5,-152(s0)
    18d2:	893a                	mv	s2,a4
    18d4:	89be                	mv	s3,a5
    18d6:	874a                	mv	a4,s2
    18d8:	87ce                	mv	a5,s3
}
    18da:	853a                	mv	a0,a4
    18dc:	85be                	mv	a1,a5
    18de:	60ee                	ld	ra,216(sp)
    18e0:	644e                	ld	s0,208(sp)
    18e2:	64ae                	ld	s1,200(sp)
    18e4:	690e                	ld	s2,192(sp)
    18e6:	79ea                	ld	s3,184(sp)
    18e8:	612d                	addi	sp,sp,224
    18ea:	8082                	ret

00000000000018ec <schedule_dm>:

/* Deadline-Monotonic Scheduling */
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    18ec:	7155                	addi	sp,sp,-208
    18ee:	e586                	sd	ra,200(sp)
    18f0:	e1a2                	sd	s0,192(sp)
    18f2:	fd26                	sd	s1,184(sp)
    18f4:	f94a                	sd	s2,176(sp)
    18f6:	f54e                	sd	s3,168(sp)
    18f8:	0980                	addi	s0,sp,208
    18fa:	84aa                	mv	s1,a0
    // TODO: implement the deadline-monotonic scheduling algorithm
    // Task with shortest deadline is assigned highest priority.

    // no thread in the run queue
    if (list_empty(args.run_queue)) 
    18fc:	649c                	ld	a5,8(s1)
    18fe:	853e                	mv	a0,a5
    1900:	00000097          	auipc	ra,0x0
    1904:	80c080e7          	jalr	-2036(ra) # 110c <list_empty>
    1908:	87aa                	mv	a5,a0
    190a:	cb85                	beqz	a5,193a <schedule_dm+0x4e>
        return fill_sparse(args);
    190c:	609c                	ld	a5,0(s1)
    190e:	f2f43823          	sd	a5,-208(s0)
    1912:	649c                	ld	a5,8(s1)
    1914:	f2f43c23          	sd	a5,-200(s0)
    1918:	689c                	ld	a5,16(s1)
    191a:	f4f43023          	sd	a5,-192(s0)
    191e:	f3040793          	addi	a5,s0,-208
    1922:	853e                	mv	a0,a5
    1924:	00000097          	auipc	ra,0x0
    1928:	812080e7          	jalr	-2030(ra) # 1136 <fill_sparse>
    192c:	872a                	mv	a4,a0
    192e:	87ae                	mv	a5,a1
    1930:	f6e43823          	sd	a4,-144(s0)
    1934:	f6f43c23          	sd	a5,-136(s0)
    1938:	ac11                	j	1b4c <schedule_dm+0x260>
    
    int current_time = args.current_time;
    193a:	409c                	lw	a5,0(s1)
    193c:	faf42623          	sw	a5,-84(s0)

    // find the thread with the earliest deadline
    struct thread *highest_priority_thread = NULL;
    1940:	fc043423          	sd	zero,-56(s0)
    struct thread *th = NULL;
    1944:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1948:	649c                	ld	a5,8(s1)
    194a:	639c                	ld	a5,0(a5)
    194c:	faf43023          	sd	a5,-96(s0)
    1950:	fa043783          	ld	a5,-96(s0)
    1954:	fd878793          	addi	a5,a5,-40
    1958:	fcf43023          	sd	a5,-64(s0)
    195c:	a0c9                	j	1a1e <schedule_dm+0x132>
        if (highest_priority_thread == NULL) {
    195e:	fc843783          	ld	a5,-56(s0)
    1962:	e791                	bnez	a5,196e <schedule_dm+0x82>
            highest_priority_thread = th;
    1964:	fc043783          	ld	a5,-64(s0)
    1968:	fcf43423          	sd	a5,-56(s0)
    196c:	a871                	j	1a08 <schedule_dm+0x11c>
        }
        else if (highest_priority_thread->current_deadline <= current_time) { // missing the deadline
    196e:	fc843783          	ld	a5,-56(s0)
    1972:	4ff8                	lw	a4,92(a5)
    1974:	fac42783          	lw	a5,-84(s0)
    1978:	2781                	sext.w	a5,a5
    197a:	02e7c763          	blt	a5,a4,19a8 <schedule_dm+0xbc>
            if (th->current_deadline > current_time) continue;
    197e:	fc043783          	ld	a5,-64(s0)
    1982:	4ff8                	lw	a4,92(a5)
    1984:	fac42783          	lw	a5,-84(s0)
    1988:	2781                	sext.w	a5,a5
    198a:	06e7ce63          	blt	a5,a4,1a06 <schedule_dm+0x11a>
            if (th->ID < highest_priority_thread->ID) {
    198e:	fc043783          	ld	a5,-64(s0)
    1992:	5fd8                	lw	a4,60(a5)
    1994:	fc843783          	ld	a5,-56(s0)
    1998:	5fdc                	lw	a5,60(a5)
    199a:	06f75763          	bge	a4,a5,1a08 <schedule_dm+0x11c>
                highest_priority_thread = th;
    199e:	fc043783          	ld	a5,-64(s0)
    19a2:	fcf43423          	sd	a5,-56(s0)
    19a6:	a08d                	j	1a08 <schedule_dm+0x11c>
            }
        }
        else if (th->current_deadline <= current_time) {
    19a8:	fc043783          	ld	a5,-64(s0)
    19ac:	4ff8                	lw	a4,92(a5)
    19ae:	fac42783          	lw	a5,-84(s0)
    19b2:	2781                	sext.w	a5,a5
    19b4:	00e7c763          	blt	a5,a4,19c2 <schedule_dm+0xd6>
            highest_priority_thread = th;
    19b8:	fc043783          	ld	a5,-64(s0)
    19bc:	fcf43423          	sd	a5,-56(s0)
    19c0:	a0a1                	j	1a08 <schedule_dm+0x11c>
        }
        else if (th->deadline < highest_priority_thread->deadline ) {
    19c2:	fc043783          	ld	a5,-64(s0)
    19c6:	47f8                	lw	a4,76(a5)
    19c8:	fc843783          	ld	a5,-56(s0)
    19cc:	47fc                	lw	a5,76(a5)
    19ce:	00f75763          	bge	a4,a5,19dc <schedule_dm+0xf0>
            highest_priority_thread = th;
    19d2:	fc043783          	ld	a5,-64(s0)
    19d6:	fcf43423          	sd	a5,-56(s0)
    19da:	a03d                	j	1a08 <schedule_dm+0x11c>
        }
        else if (th->deadline == highest_priority_thread->deadline && th->ID < highest_priority_thread->ID) {
    19dc:	fc043783          	ld	a5,-64(s0)
    19e0:	47f8                	lw	a4,76(a5)
    19e2:	fc843783          	ld	a5,-56(s0)
    19e6:	47fc                	lw	a5,76(a5)
    19e8:	02f71063          	bne	a4,a5,1a08 <schedule_dm+0x11c>
    19ec:	fc043783          	ld	a5,-64(s0)
    19f0:	5fd8                	lw	a4,60(a5)
    19f2:	fc843783          	ld	a5,-56(s0)
    19f6:	5fdc                	lw	a5,60(a5)
    19f8:	00f75863          	bge	a4,a5,1a08 <schedule_dm+0x11c>
            highest_priority_thread = th;
    19fc:	fc043783          	ld	a5,-64(s0)
    1a00:	fcf43423          	sd	a5,-56(s0)
    1a04:	a011                	j	1a08 <schedule_dm+0x11c>
            if (th->current_deadline > current_time) continue;
    1a06:	0001                	nop
    list_for_each_entry(th, args.run_queue, thread_list) {
    1a08:	fc043783          	ld	a5,-64(s0)
    1a0c:	779c                	ld	a5,40(a5)
    1a0e:	f8f43023          	sd	a5,-128(s0)
    1a12:	f8043783          	ld	a5,-128(s0)
    1a16:	fd878793          	addi	a5,a5,-40
    1a1a:	fcf43023          	sd	a5,-64(s0)
    1a1e:	fc043783          	ld	a5,-64(s0)
    1a22:	02878713          	addi	a4,a5,40
    1a26:	649c                	ld	a5,8(s1)
    1a28:	f2f71be3          	bne	a4,a5,195e <schedule_dm+0x72>
        }
    }

    // the thread missing the current deadline
    if (highest_priority_thread->current_deadline <= current_time)
    1a2c:	fc843783          	ld	a5,-56(s0)
    1a30:	4ff8                	lw	a4,92(a5)
    1a32:	fac42783          	lw	a5,-84(s0)
    1a36:	2781                	sext.w	a5,a5
    1a38:	00e7cb63          	blt	a5,a4,1a4e <schedule_dm+0x162>
        return (struct threads_sched_result) { .scheduled_thread_list_member = &highest_priority_thread->thread_list, .allocated_time = 0 };
    1a3c:	fc843783          	ld	a5,-56(s0)
    1a40:	02878793          	addi	a5,a5,40
    1a44:	f6f43823          	sd	a5,-144(s0)
    1a48:	f6042c23          	sw	zero,-136(s0)
    1a4c:	a201                	j	1b4c <schedule_dm+0x260>

    int executing_time = highest_priority_thread->remaining_time;
    1a4e:	fc843783          	ld	a5,-56(s0)
    1a52:	4fbc                	lw	a5,88(a5)
    1a54:	faf42e23          	sw	a5,-68(s0)

    // missing the deadline but still have some time to execute part of the task
    if (highest_priority_thread->remaining_time > highest_priority_thread->current_deadline - current_time) 
    1a58:	fc843783          	ld	a5,-56(s0)
    1a5c:	4fb4                	lw	a3,88(a5)
    1a5e:	fc843783          	ld	a5,-56(s0)
    1a62:	4ff8                	lw	a4,92(a5)
    1a64:	fac42783          	lw	a5,-84(s0)
    1a68:	40f707bb          	subw	a5,a4,a5
    1a6c:	2781                	sext.w	a5,a5
    1a6e:	8736                	mv	a4,a3
    1a70:	00e7db63          	bge	a5,a4,1a86 <schedule_dm+0x19a>
        executing_time = highest_priority_thread->current_deadline - current_time;
    1a74:	fc843783          	ld	a5,-56(s0)
    1a78:	4ff8                	lw	a4,92(a5)
    1a7a:	fac42783          	lw	a5,-84(s0)
    1a7e:	40f707bb          	subw	a5,a4,a5
    1a82:	faf42e23          	sw	a5,-68(s0)

    struct release_queue_entry *cur;
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1a86:	689c                	ld	a5,16(s1)
    1a88:	639c                	ld	a5,0(a5)
    1a8a:	f8f43c23          	sd	a5,-104(s0)
    1a8e:	f9843783          	ld	a5,-104(s0)
    1a92:	17e1                	addi	a5,a5,-8
    1a94:	faf43823          	sd	a5,-80(s0)
    1a98:	a049                	j	1b1a <schedule_dm+0x22e>
        int interval = cur->release_time - current_time;
    1a9a:	fb043783          	ld	a5,-80(s0)
    1a9e:	4f98                	lw	a4,24(a5)
    1aa0:	fac42783          	lw	a5,-84(s0)
    1aa4:	40f707bb          	subw	a5,a4,a5
    1aa8:	f8f42a23          	sw	a5,-108(s0)
        if (interval > executing_time) continue;
    1aac:	f9442703          	lw	a4,-108(s0)
    1ab0:	fbc42783          	lw	a5,-68(s0)
    1ab4:	2701                	sext.w	a4,a4
    1ab6:	2781                	sext.w	a5,a5
    1ab8:	04e7c263          	blt	a5,a4,1afc <schedule_dm+0x210>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    1abc:	fc843783          	ld	a5,-56(s0)
    1ac0:	47f8                	lw	a4,76(a5)
    1ac2:	fb043783          	ld	a5,-80(s0)
    1ac6:	639c                	ld	a5,0(a5)
    1ac8:	47fc                	lw	a5,76(a5)
    1aca:	02f74b63          	blt	a4,a5,1b00 <schedule_dm+0x214>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    1ace:	fc843783          	ld	a5,-56(s0)
    1ad2:	47f8                	lw	a4,76(a5)
    1ad4:	fb043783          	ld	a5,-80(s0)
    1ad8:	639c                	ld	a5,0(a5)
    1ada:	47fc                	lw	a5,76(a5)
    1adc:	00f71b63          	bne	a4,a5,1af2 <schedule_dm+0x206>
    1ae0:	fc843783          	ld	a5,-56(s0)
    1ae4:	5fd8                	lw	a4,60(a5)
    1ae6:	fb043783          	ld	a5,-80(s0)
    1aea:	639c                	ld	a5,0(a5)
    1aec:	5fdc                	lw	a5,60(a5)
    1aee:	00f74b63          	blt	a4,a5,1b04 <schedule_dm+0x218>
        executing_time = interval;
    1af2:	f9442783          	lw	a5,-108(s0)
    1af6:	faf42e23          	sw	a5,-68(s0)
    1afa:	a031                	j	1b06 <schedule_dm+0x21a>
        if (interval > executing_time) continue;
    1afc:	0001                	nop
    1afe:	a021                	j	1b06 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline < cur->thrd->deadline) continue;
    1b00:	0001                	nop
    1b02:	a011                	j	1b06 <schedule_dm+0x21a>
        if (highest_priority_thread->deadline == cur->thrd->deadline && highest_priority_thread->ID < cur->thrd->ID) continue;
    1b04:	0001                	nop
    list_for_each_entry(cur, args.release_queue, thread_list) {
    1b06:	fb043783          	ld	a5,-80(s0)
    1b0a:	679c                	ld	a5,8(a5)
    1b0c:	f8f43423          	sd	a5,-120(s0)
    1b10:	f8843783          	ld	a5,-120(s0)
    1b14:	17e1                	addi	a5,a5,-8
    1b16:	faf43823          	sd	a5,-80(s0)
    1b1a:	fb043783          	ld	a5,-80(s0)
    1b1e:	00878713          	addi	a4,a5,8
    1b22:	689c                	ld	a5,16(s1)
    1b24:	f6f71be3          	bne	a4,a5,1a9a <schedule_dm+0x1ae>
    }

    struct threads_sched_result r;
    r.scheduled_thread_list_member = &highest_priority_thread->thread_list;
    1b28:	fc843783          	ld	a5,-56(s0)
    1b2c:	02878793          	addi	a5,a5,40
    1b30:	f6f43023          	sd	a5,-160(s0)
    r.allocated_time = executing_time;
    1b34:	fbc42783          	lw	a5,-68(s0)
    1b38:	f6f42423          	sw	a5,-152(s0)
    return r;
    1b3c:	f6043783          	ld	a5,-160(s0)
    1b40:	f6f43823          	sd	a5,-144(s0)
    1b44:	f6843783          	ld	a5,-152(s0)
    1b48:	f6f43c23          	sd	a5,-136(s0)
    1b4c:	4701                	li	a4,0
    1b4e:	f7043703          	ld	a4,-144(s0)
    1b52:	4781                	li	a5,0
    1b54:	f7843783          	ld	a5,-136(s0)
    1b58:	893a                	mv	s2,a4
    1b5a:	89be                	mv	s3,a5
    1b5c:	874a                	mv	a4,s2
    1b5e:	87ce                	mv	a5,s3
    1b60:	853a                	mv	a0,a4
    1b62:	85be                	mv	a1,a5
    1b64:	60ae                	ld	ra,200(sp)
    1b66:	640e                	ld	s0,192(sp)
    1b68:	74ea                	ld	s1,184(sp)
    1b6a:	794a                	ld	s2,176(sp)
    1b6c:	79aa                	ld	s3,168(sp)
    1b6e:	6169                	addi	sp,sp,208
    1b70:	8082                	ret
