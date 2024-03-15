
user/_test-stack:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f1>:
    printf("task 2: %d\n", i);

}

void f1(void *arg)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
    int i = 100;

    while(1) {
        printf("thread 1: %d\n",i++);
  10:	06400593          	li	a1,100
  14:	00001517          	auipc	a0,0x1
  18:	e2450513          	addi	a0,a0,-476 # e38 <thread_yield+0x118>
  1c:	00000097          	auipc	ra,0x0
  20:	6fc080e7          	jalr	1788(ra) # 718 <printf>
  24:	06500493          	li	s1,101
  28:	00001a17          	auipc	s4,0x1
  2c:	e10a0a13          	addi	s4,s4,-496 # e38 <thread_yield+0x118>
        if (i == 106) {
  30:	06a00993          	li	s3,106
  34:	a011                	j	38 <f1+0x38>
        printf("thread 1: %d\n",i++);
  36:	84ca                	mv	s1,s2
            thread_exit();
        }
        thread_yield();
  38:	00001097          	auipc	ra,0x1
  3c:	ce8080e7          	jalr	-792(ra) # d20 <thread_yield>
        printf("thread 1: %d\n",i++);
  40:	0014891b          	addiw	s2,s1,1
  44:	85a6                	mv	a1,s1
  46:	8552                	mv	a0,s4
  48:	00000097          	auipc	ra,0x0
  4c:	6d0080e7          	jalr	1744(ra) # 718 <printf>
        if (i == 106) {
  50:	ff3913e3          	bne	s2,s3,36 <f1+0x36>
            thread_exit();
  54:	00001097          	auipc	ra,0x1
  58:	9b2080e7          	jalr	-1614(ra) # a06 <thread_exit>
  5c:	bfe9                	j	36 <f1+0x36>

000000000000005e <task4>:
{
  5e:	1141                	addi	sp,sp,-16
  60:	e406                	sd	ra,8(sp)
  62:	e022                	sd	s0,0(sp)
  64:	0800                	addi	s0,sp,16
    printf("task 4: %d\n", i);
  66:	410c                	lw	a1,0(a0)
  68:	00001517          	auipc	a0,0x1
  6c:	de050513          	addi	a0,a0,-544 # e48 <thread_yield+0x128>
  70:	00000097          	auipc	ra,0x0
  74:	6a8080e7          	jalr	1704(ra) # 718 <printf>
}
  78:	60a2                	ld	ra,8(sp)
  7a:	6402                	ld	s0,0(sp)
  7c:	0141                	addi	sp,sp,16
  7e:	8082                	ret

0000000000000080 <task3>:
{
  80:	1141                	addi	sp,sp,-16
  82:	e406                	sd	ra,8(sp)
  84:	e022                	sd	s0,0(sp)
  86:	0800                	addi	s0,sp,16
    printf("task 3: %d\n", i);
  88:	410c                	lw	a1,0(a0)
  8a:	00001517          	auipc	a0,0x1
  8e:	dce50513          	addi	a0,a0,-562 # e58 <thread_yield+0x138>
  92:	00000097          	auipc	ra,0x0
  96:	686080e7          	jalr	1670(ra) # 718 <printf>
}
  9a:	60a2                	ld	ra,8(sp)
  9c:	6402                	ld	s0,0(sp)
  9e:	0141                	addi	sp,sp,16
  a0:	8082                	ret

00000000000000a2 <task2>:
{
  a2:	1141                	addi	sp,sp,-16
  a4:	e406                	sd	ra,8(sp)
  a6:	e022                	sd	s0,0(sp)
  a8:	0800                	addi	s0,sp,16
    printf("task 2: %d\n", i);
  aa:	410c                	lw	a1,0(a0)
  ac:	00001517          	auipc	a0,0x1
  b0:	dbc50513          	addi	a0,a0,-580 # e68 <thread_yield+0x148>
  b4:	00000097          	auipc	ra,0x0
  b8:	664080e7          	jalr	1636(ra) # 718 <printf>
}
  bc:	60a2                	ld	ra,8(sp)
  be:	6402                	ld	s0,0(sp)
  c0:	0141                	addi	sp,sp,16
  c2:	8082                	ret

00000000000000c4 <main>:
    }
}

int main(int argc, char **argv)
{
  c4:	1141                	addi	sp,sp,-16
  c6:	e406                	sd	ra,8(sp)
  c8:	e022                	sd	s0,0(sp)
  ca:	0800                	addi	s0,sp,16
    printf("mp1-part2-0\n");
  cc:	00001517          	auipc	a0,0x1
  d0:	dac50513          	addi	a0,a0,-596 # e78 <thread_yield+0x158>
  d4:	00000097          	auipc	ra,0x0
  d8:	644080e7          	jalr	1604(ra) # 718 <printf>
    struct thread *t1 = thread_create(f1, NULL);
  dc:	4581                	li	a1,0
  de:	00000517          	auipc	a0,0x0
  e2:	f2250513          	addi	a0,a0,-222 # 0 <f1>
  e6:	00001097          	auipc	ra,0x1
  ea:	84a080e7          	jalr	-1974(ra) # 930 <thread_create>
    thread_add_runqueue(t1);
  ee:	00001097          	auipc	ra,0x1
  f2:	8d0080e7          	jalr	-1840(ra) # 9be <thread_add_runqueue>
    printf("size of a function: %d\n", sizeof(void (*)(void *)));
  f6:	45a1                	li	a1,8
  f8:	00001517          	auipc	a0,0x1
  fc:	d9050513          	addi	a0,a0,-624 # e88 <thread_yield+0x168>
 100:	00000097          	auipc	ra,0x0
 104:	618080e7          	jalr	1560(ra) # 718 <printf>
    // int k = 1;
    // thread_assign_task(t1, task2, &k);
    // thread_assign_task(t1, task3, &k);
    // thread_assign_task(t1, task4, &k);

    thread_start_threading();
 108:	00001097          	auipc	ra,0x1
 10c:	b5a080e7          	jalr	-1190(ra) # c62 <thread_start_threading>
    printf("\nexited\n");
 110:	00001517          	auipc	a0,0x1
 114:	d9050513          	addi	a0,a0,-624 # ea0 <thread_yield+0x180>
 118:	00000097          	auipc	ra,0x0
 11c:	600080e7          	jalr	1536(ra) # 718 <printf>
    exit(0);
 120:	4501                	li	a0,0
 122:	00000097          	auipc	ra,0x0
 126:	27e080e7          	jalr	638(ra) # 3a0 <exit>

000000000000012a <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 12a:	1141                	addi	sp,sp,-16
 12c:	e422                	sd	s0,8(sp)
 12e:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 130:	87aa                	mv	a5,a0
 132:	0585                	addi	a1,a1,1
 134:	0785                	addi	a5,a5,1
 136:	fff5c703          	lbu	a4,-1(a1)
 13a:	fee78fa3          	sb	a4,-1(a5)
 13e:	fb75                	bnez	a4,132 <strcpy+0x8>
    ;
  return os;
}
 140:	6422                	ld	s0,8(sp)
 142:	0141                	addi	sp,sp,16
 144:	8082                	ret

0000000000000146 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 146:	1141                	addi	sp,sp,-16
 148:	e422                	sd	s0,8(sp)
 14a:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 14c:	00054783          	lbu	a5,0(a0)
 150:	cb91                	beqz	a5,164 <strcmp+0x1e>
 152:	0005c703          	lbu	a4,0(a1)
 156:	00f71763          	bne	a4,a5,164 <strcmp+0x1e>
    p++, q++;
 15a:	0505                	addi	a0,a0,1
 15c:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 15e:	00054783          	lbu	a5,0(a0)
 162:	fbe5                	bnez	a5,152 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 164:	0005c503          	lbu	a0,0(a1)
}
 168:	40a7853b          	subw	a0,a5,a0
 16c:	6422                	ld	s0,8(sp)
 16e:	0141                	addi	sp,sp,16
 170:	8082                	ret

0000000000000172 <strlen>:

uint
strlen(const char *s)
{
 172:	1141                	addi	sp,sp,-16
 174:	e422                	sd	s0,8(sp)
 176:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 178:	00054783          	lbu	a5,0(a0)
 17c:	cf91                	beqz	a5,198 <strlen+0x26>
 17e:	0505                	addi	a0,a0,1
 180:	87aa                	mv	a5,a0
 182:	4685                	li	a3,1
 184:	9e89                	subw	a3,a3,a0
 186:	00f6853b          	addw	a0,a3,a5
 18a:	0785                	addi	a5,a5,1
 18c:	fff7c703          	lbu	a4,-1(a5)
 190:	fb7d                	bnez	a4,186 <strlen+0x14>
    ;
  return n;
}
 192:	6422                	ld	s0,8(sp)
 194:	0141                	addi	sp,sp,16
 196:	8082                	ret
  for(n = 0; s[n]; n++)
 198:	4501                	li	a0,0
 19a:	bfe5                	j	192 <strlen+0x20>

000000000000019c <memset>:

void*
memset(void *dst, int c, uint n)
{
 19c:	1141                	addi	sp,sp,-16
 19e:	e422                	sd	s0,8(sp)
 1a0:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1a2:	ce09                	beqz	a2,1bc <memset+0x20>
 1a4:	87aa                	mv	a5,a0
 1a6:	fff6071b          	addiw	a4,a2,-1
 1aa:	1702                	slli	a4,a4,0x20
 1ac:	9301                	srli	a4,a4,0x20
 1ae:	0705                	addi	a4,a4,1
 1b0:	972a                	add	a4,a4,a0
    cdst[i] = c;
 1b2:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 1b6:	0785                	addi	a5,a5,1
 1b8:	fee79de3          	bne	a5,a4,1b2 <memset+0x16>
  }
  return dst;
}
 1bc:	6422                	ld	s0,8(sp)
 1be:	0141                	addi	sp,sp,16
 1c0:	8082                	ret

00000000000001c2 <strchr>:

char*
strchr(const char *s, char c)
{
 1c2:	1141                	addi	sp,sp,-16
 1c4:	e422                	sd	s0,8(sp)
 1c6:	0800                	addi	s0,sp,16
  for(; *s; s++)
 1c8:	00054783          	lbu	a5,0(a0)
 1cc:	cb99                	beqz	a5,1e2 <strchr+0x20>
    if(*s == c)
 1ce:	00f58763          	beq	a1,a5,1dc <strchr+0x1a>
  for(; *s; s++)
 1d2:	0505                	addi	a0,a0,1
 1d4:	00054783          	lbu	a5,0(a0)
 1d8:	fbfd                	bnez	a5,1ce <strchr+0xc>
      return (char*)s;
  return 0;
 1da:	4501                	li	a0,0
}
 1dc:	6422                	ld	s0,8(sp)
 1de:	0141                	addi	sp,sp,16
 1e0:	8082                	ret
  return 0;
 1e2:	4501                	li	a0,0
 1e4:	bfe5                	j	1dc <strchr+0x1a>

00000000000001e6 <gets>:

char*
gets(char *buf, int max)
{
 1e6:	711d                	addi	sp,sp,-96
 1e8:	ec86                	sd	ra,88(sp)
 1ea:	e8a2                	sd	s0,80(sp)
 1ec:	e4a6                	sd	s1,72(sp)
 1ee:	e0ca                	sd	s2,64(sp)
 1f0:	fc4e                	sd	s3,56(sp)
 1f2:	f852                	sd	s4,48(sp)
 1f4:	f456                	sd	s5,40(sp)
 1f6:	f05a                	sd	s6,32(sp)
 1f8:	ec5e                	sd	s7,24(sp)
 1fa:	1080                	addi	s0,sp,96
 1fc:	8baa                	mv	s7,a0
 1fe:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 200:	892a                	mv	s2,a0
 202:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 204:	4aa9                	li	s5,10
 206:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 208:	89a6                	mv	s3,s1
 20a:	2485                	addiw	s1,s1,1
 20c:	0344d863          	bge	s1,s4,23c <gets+0x56>
    cc = read(0, &c, 1);
 210:	4605                	li	a2,1
 212:	faf40593          	addi	a1,s0,-81
 216:	4501                	li	a0,0
 218:	00000097          	auipc	ra,0x0
 21c:	1a0080e7          	jalr	416(ra) # 3b8 <read>
    if(cc < 1)
 220:	00a05e63          	blez	a0,23c <gets+0x56>
    buf[i++] = c;
 224:	faf44783          	lbu	a5,-81(s0)
 228:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 22c:	01578763          	beq	a5,s5,23a <gets+0x54>
 230:	0905                	addi	s2,s2,1
 232:	fd679be3          	bne	a5,s6,208 <gets+0x22>
  for(i=0; i+1 < max; ){
 236:	89a6                	mv	s3,s1
 238:	a011                	j	23c <gets+0x56>
 23a:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 23c:	99de                	add	s3,s3,s7
 23e:	00098023          	sb	zero,0(s3)
  return buf;
}
 242:	855e                	mv	a0,s7
 244:	60e6                	ld	ra,88(sp)
 246:	6446                	ld	s0,80(sp)
 248:	64a6                	ld	s1,72(sp)
 24a:	6906                	ld	s2,64(sp)
 24c:	79e2                	ld	s3,56(sp)
 24e:	7a42                	ld	s4,48(sp)
 250:	7aa2                	ld	s5,40(sp)
 252:	7b02                	ld	s6,32(sp)
 254:	6be2                	ld	s7,24(sp)
 256:	6125                	addi	sp,sp,96
 258:	8082                	ret

000000000000025a <stat>:

int
stat(const char *n, struct stat *st)
{
 25a:	1101                	addi	sp,sp,-32
 25c:	ec06                	sd	ra,24(sp)
 25e:	e822                	sd	s0,16(sp)
 260:	e426                	sd	s1,8(sp)
 262:	e04a                	sd	s2,0(sp)
 264:	1000                	addi	s0,sp,32
 266:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 268:	4581                	li	a1,0
 26a:	00000097          	auipc	ra,0x0
 26e:	176080e7          	jalr	374(ra) # 3e0 <open>
  if(fd < 0)
 272:	02054563          	bltz	a0,29c <stat+0x42>
 276:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 278:	85ca                	mv	a1,s2
 27a:	00000097          	auipc	ra,0x0
 27e:	17e080e7          	jalr	382(ra) # 3f8 <fstat>
 282:	892a                	mv	s2,a0
  close(fd);
 284:	8526                	mv	a0,s1
 286:	00000097          	auipc	ra,0x0
 28a:	142080e7          	jalr	322(ra) # 3c8 <close>
  return r;
}
 28e:	854a                	mv	a0,s2
 290:	60e2                	ld	ra,24(sp)
 292:	6442                	ld	s0,16(sp)
 294:	64a2                	ld	s1,8(sp)
 296:	6902                	ld	s2,0(sp)
 298:	6105                	addi	sp,sp,32
 29a:	8082                	ret
    return -1;
 29c:	597d                	li	s2,-1
 29e:	bfc5                	j	28e <stat+0x34>

00000000000002a0 <atoi>:

int
atoi(const char *s)
{
 2a0:	1141                	addi	sp,sp,-16
 2a2:	e422                	sd	s0,8(sp)
 2a4:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a6:	00054603          	lbu	a2,0(a0)
 2aa:	fd06079b          	addiw	a5,a2,-48
 2ae:	0ff7f793          	andi	a5,a5,255
 2b2:	4725                	li	a4,9
 2b4:	02f76963          	bltu	a4,a5,2e6 <atoi+0x46>
 2b8:	86aa                	mv	a3,a0
  n = 0;
 2ba:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 2bc:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 2be:	0685                	addi	a3,a3,1
 2c0:	0025179b          	slliw	a5,a0,0x2
 2c4:	9fa9                	addw	a5,a5,a0
 2c6:	0017979b          	slliw	a5,a5,0x1
 2ca:	9fb1                	addw	a5,a5,a2
 2cc:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 2d0:	0006c603          	lbu	a2,0(a3)
 2d4:	fd06071b          	addiw	a4,a2,-48
 2d8:	0ff77713          	andi	a4,a4,255
 2dc:	fee5f1e3          	bgeu	a1,a4,2be <atoi+0x1e>
  return n;
}
 2e0:	6422                	ld	s0,8(sp)
 2e2:	0141                	addi	sp,sp,16
 2e4:	8082                	ret
  n = 0;
 2e6:	4501                	li	a0,0
 2e8:	bfe5                	j	2e0 <atoi+0x40>

00000000000002ea <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2ea:	1141                	addi	sp,sp,-16
 2ec:	e422                	sd	s0,8(sp)
 2ee:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2f0:	02b57663          	bgeu	a0,a1,31c <memmove+0x32>
    while(n-- > 0)
 2f4:	02c05163          	blez	a2,316 <memmove+0x2c>
 2f8:	fff6079b          	addiw	a5,a2,-1
 2fc:	1782                	slli	a5,a5,0x20
 2fe:	9381                	srli	a5,a5,0x20
 300:	0785                	addi	a5,a5,1
 302:	97aa                	add	a5,a5,a0
  dst = vdst;
 304:	872a                	mv	a4,a0
      *dst++ = *src++;
 306:	0585                	addi	a1,a1,1
 308:	0705                	addi	a4,a4,1
 30a:	fff5c683          	lbu	a3,-1(a1)
 30e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 312:	fee79ae3          	bne	a5,a4,306 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 316:	6422                	ld	s0,8(sp)
 318:	0141                	addi	sp,sp,16
 31a:	8082                	ret
    dst += n;
 31c:	00c50733          	add	a4,a0,a2
    src += n;
 320:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 322:	fec05ae3          	blez	a2,316 <memmove+0x2c>
 326:	fff6079b          	addiw	a5,a2,-1
 32a:	1782                	slli	a5,a5,0x20
 32c:	9381                	srli	a5,a5,0x20
 32e:	fff7c793          	not	a5,a5
 332:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 334:	15fd                	addi	a1,a1,-1
 336:	177d                	addi	a4,a4,-1
 338:	0005c683          	lbu	a3,0(a1)
 33c:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 340:	fee79ae3          	bne	a5,a4,334 <memmove+0x4a>
 344:	bfc9                	j	316 <memmove+0x2c>

0000000000000346 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 346:	1141                	addi	sp,sp,-16
 348:	e422                	sd	s0,8(sp)
 34a:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 34c:	ca05                	beqz	a2,37c <memcmp+0x36>
 34e:	fff6069b          	addiw	a3,a2,-1
 352:	1682                	slli	a3,a3,0x20
 354:	9281                	srli	a3,a3,0x20
 356:	0685                	addi	a3,a3,1
 358:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 35a:	00054783          	lbu	a5,0(a0)
 35e:	0005c703          	lbu	a4,0(a1)
 362:	00e79863          	bne	a5,a4,372 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 366:	0505                	addi	a0,a0,1
    p2++;
 368:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 36a:	fed518e3          	bne	a0,a3,35a <memcmp+0x14>
  }
  return 0;
 36e:	4501                	li	a0,0
 370:	a019                	j	376 <memcmp+0x30>
      return *p1 - *p2;
 372:	40e7853b          	subw	a0,a5,a4
}
 376:	6422                	ld	s0,8(sp)
 378:	0141                	addi	sp,sp,16
 37a:	8082                	ret
  return 0;
 37c:	4501                	li	a0,0
 37e:	bfe5                	j	376 <memcmp+0x30>

0000000000000380 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 380:	1141                	addi	sp,sp,-16
 382:	e406                	sd	ra,8(sp)
 384:	e022                	sd	s0,0(sp)
 386:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 388:	00000097          	auipc	ra,0x0
 38c:	f62080e7          	jalr	-158(ra) # 2ea <memmove>
}
 390:	60a2                	ld	ra,8(sp)
 392:	6402                	ld	s0,0(sp)
 394:	0141                	addi	sp,sp,16
 396:	8082                	ret

0000000000000398 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 398:	4885                	li	a7,1
 ecall
 39a:	00000073          	ecall
 ret
 39e:	8082                	ret

00000000000003a0 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3a0:	4889                	li	a7,2
 ecall
 3a2:	00000073          	ecall
 ret
 3a6:	8082                	ret

00000000000003a8 <wait>:
.global wait
wait:
 li a7, SYS_wait
 3a8:	488d                	li	a7,3
 ecall
 3aa:	00000073          	ecall
 ret
 3ae:	8082                	ret

00000000000003b0 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3b0:	4891                	li	a7,4
 ecall
 3b2:	00000073          	ecall
 ret
 3b6:	8082                	ret

00000000000003b8 <read>:
.global read
read:
 li a7, SYS_read
 3b8:	4895                	li	a7,5
 ecall
 3ba:	00000073          	ecall
 ret
 3be:	8082                	ret

00000000000003c0 <write>:
.global write
write:
 li a7, SYS_write
 3c0:	48c1                	li	a7,16
 ecall
 3c2:	00000073          	ecall
 ret
 3c6:	8082                	ret

00000000000003c8 <close>:
.global close
close:
 li a7, SYS_close
 3c8:	48d5                	li	a7,21
 ecall
 3ca:	00000073          	ecall
 ret
 3ce:	8082                	ret

00000000000003d0 <kill>:
.global kill
kill:
 li a7, SYS_kill
 3d0:	4899                	li	a7,6
 ecall
 3d2:	00000073          	ecall
 ret
 3d6:	8082                	ret

00000000000003d8 <exec>:
.global exec
exec:
 li a7, SYS_exec
 3d8:	489d                	li	a7,7
 ecall
 3da:	00000073          	ecall
 ret
 3de:	8082                	ret

00000000000003e0 <open>:
.global open
open:
 li a7, SYS_open
 3e0:	48bd                	li	a7,15
 ecall
 3e2:	00000073          	ecall
 ret
 3e6:	8082                	ret

00000000000003e8 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 3e8:	48c5                	li	a7,17
 ecall
 3ea:	00000073          	ecall
 ret
 3ee:	8082                	ret

00000000000003f0 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 3f0:	48c9                	li	a7,18
 ecall
 3f2:	00000073          	ecall
 ret
 3f6:	8082                	ret

00000000000003f8 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3f8:	48a1                	li	a7,8
 ecall
 3fa:	00000073          	ecall
 ret
 3fe:	8082                	ret

0000000000000400 <link>:
.global link
link:
 li a7, SYS_link
 400:	48cd                	li	a7,19
 ecall
 402:	00000073          	ecall
 ret
 406:	8082                	ret

0000000000000408 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 408:	48d1                	li	a7,20
 ecall
 40a:	00000073          	ecall
 ret
 40e:	8082                	ret

0000000000000410 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 410:	48a5                	li	a7,9
 ecall
 412:	00000073          	ecall
 ret
 416:	8082                	ret

0000000000000418 <dup>:
.global dup
dup:
 li a7, SYS_dup
 418:	48a9                	li	a7,10
 ecall
 41a:	00000073          	ecall
 ret
 41e:	8082                	ret

0000000000000420 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 420:	48ad                	li	a7,11
 ecall
 422:	00000073          	ecall
 ret
 426:	8082                	ret

0000000000000428 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 428:	48b1                	li	a7,12
 ecall
 42a:	00000073          	ecall
 ret
 42e:	8082                	ret

0000000000000430 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 430:	48b5                	li	a7,13
 ecall
 432:	00000073          	ecall
 ret
 436:	8082                	ret

0000000000000438 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 438:	48b9                	li	a7,14
 ecall
 43a:	00000073          	ecall
 ret
 43e:	8082                	ret

0000000000000440 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 440:	1101                	addi	sp,sp,-32
 442:	ec06                	sd	ra,24(sp)
 444:	e822                	sd	s0,16(sp)
 446:	1000                	addi	s0,sp,32
 448:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 44c:	4605                	li	a2,1
 44e:	fef40593          	addi	a1,s0,-17
 452:	00000097          	auipc	ra,0x0
 456:	f6e080e7          	jalr	-146(ra) # 3c0 <write>
}
 45a:	60e2                	ld	ra,24(sp)
 45c:	6442                	ld	s0,16(sp)
 45e:	6105                	addi	sp,sp,32
 460:	8082                	ret

0000000000000462 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 462:	7139                	addi	sp,sp,-64
 464:	fc06                	sd	ra,56(sp)
 466:	f822                	sd	s0,48(sp)
 468:	f426                	sd	s1,40(sp)
 46a:	f04a                	sd	s2,32(sp)
 46c:	ec4e                	sd	s3,24(sp)
 46e:	0080                	addi	s0,sp,64
 470:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 472:	c299                	beqz	a3,478 <printint+0x16>
 474:	0805c863          	bltz	a1,504 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 478:	2581                	sext.w	a1,a1
  neg = 0;
 47a:	4881                	li	a7,0
 47c:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 480:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 482:	2601                	sext.w	a2,a2
 484:	00001517          	auipc	a0,0x1
 488:	a3450513          	addi	a0,a0,-1484 # eb8 <digits>
 48c:	883a                	mv	a6,a4
 48e:	2705                	addiw	a4,a4,1
 490:	02c5f7bb          	remuw	a5,a1,a2
 494:	1782                	slli	a5,a5,0x20
 496:	9381                	srli	a5,a5,0x20
 498:	97aa                	add	a5,a5,a0
 49a:	0007c783          	lbu	a5,0(a5)
 49e:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4a2:	0005879b          	sext.w	a5,a1
 4a6:	02c5d5bb          	divuw	a1,a1,a2
 4aa:	0685                	addi	a3,a3,1
 4ac:	fec7f0e3          	bgeu	a5,a2,48c <printint+0x2a>
  if(neg)
 4b0:	00088b63          	beqz	a7,4c6 <printint+0x64>
    buf[i++] = '-';
 4b4:	fd040793          	addi	a5,s0,-48
 4b8:	973e                	add	a4,a4,a5
 4ba:	02d00793          	li	a5,45
 4be:	fef70823          	sb	a5,-16(a4)
 4c2:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4c6:	02e05863          	blez	a4,4f6 <printint+0x94>
 4ca:	fc040793          	addi	a5,s0,-64
 4ce:	00e78933          	add	s2,a5,a4
 4d2:	fff78993          	addi	s3,a5,-1
 4d6:	99ba                	add	s3,s3,a4
 4d8:	377d                	addiw	a4,a4,-1
 4da:	1702                	slli	a4,a4,0x20
 4dc:	9301                	srli	a4,a4,0x20
 4de:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4e2:	fff94583          	lbu	a1,-1(s2)
 4e6:	8526                	mv	a0,s1
 4e8:	00000097          	auipc	ra,0x0
 4ec:	f58080e7          	jalr	-168(ra) # 440 <putc>
  while(--i >= 0)
 4f0:	197d                	addi	s2,s2,-1
 4f2:	ff3918e3          	bne	s2,s3,4e2 <printint+0x80>
}
 4f6:	70e2                	ld	ra,56(sp)
 4f8:	7442                	ld	s0,48(sp)
 4fa:	74a2                	ld	s1,40(sp)
 4fc:	7902                	ld	s2,32(sp)
 4fe:	69e2                	ld	s3,24(sp)
 500:	6121                	addi	sp,sp,64
 502:	8082                	ret
    x = -xx;
 504:	40b005bb          	negw	a1,a1
    neg = 1;
 508:	4885                	li	a7,1
    x = -xx;
 50a:	bf8d                	j	47c <printint+0x1a>

000000000000050c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 50c:	7119                	addi	sp,sp,-128
 50e:	fc86                	sd	ra,120(sp)
 510:	f8a2                	sd	s0,112(sp)
 512:	f4a6                	sd	s1,104(sp)
 514:	f0ca                	sd	s2,96(sp)
 516:	ecce                	sd	s3,88(sp)
 518:	e8d2                	sd	s4,80(sp)
 51a:	e4d6                	sd	s5,72(sp)
 51c:	e0da                	sd	s6,64(sp)
 51e:	fc5e                	sd	s7,56(sp)
 520:	f862                	sd	s8,48(sp)
 522:	f466                	sd	s9,40(sp)
 524:	f06a                	sd	s10,32(sp)
 526:	ec6e                	sd	s11,24(sp)
 528:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 52a:	0005c903          	lbu	s2,0(a1)
 52e:	18090f63          	beqz	s2,6cc <vprintf+0x1c0>
 532:	8aaa                	mv	s5,a0
 534:	8b32                	mv	s6,a2
 536:	00158493          	addi	s1,a1,1
  state = 0;
 53a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 53c:	02500a13          	li	s4,37
      if(c == 'd'){
 540:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 544:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 548:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 54c:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 550:	00001b97          	auipc	s7,0x1
 554:	968b8b93          	addi	s7,s7,-1688 # eb8 <digits>
 558:	a839                	j	576 <vprintf+0x6a>
        putc(fd, c);
 55a:	85ca                	mv	a1,s2
 55c:	8556                	mv	a0,s5
 55e:	00000097          	auipc	ra,0x0
 562:	ee2080e7          	jalr	-286(ra) # 440 <putc>
 566:	a019                	j	56c <vprintf+0x60>
    } else if(state == '%'){
 568:	01498f63          	beq	s3,s4,586 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 56c:	0485                	addi	s1,s1,1
 56e:	fff4c903          	lbu	s2,-1(s1)
 572:	14090d63          	beqz	s2,6cc <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 576:	0009079b          	sext.w	a5,s2
    if(state == 0){
 57a:	fe0997e3          	bnez	s3,568 <vprintf+0x5c>
      if(c == '%'){
 57e:	fd479ee3          	bne	a5,s4,55a <vprintf+0x4e>
        state = '%';
 582:	89be                	mv	s3,a5
 584:	b7e5                	j	56c <vprintf+0x60>
      if(c == 'd'){
 586:	05878063          	beq	a5,s8,5c6 <vprintf+0xba>
      } else if(c == 'l') {
 58a:	05978c63          	beq	a5,s9,5e2 <vprintf+0xd6>
      } else if(c == 'x') {
 58e:	07a78863          	beq	a5,s10,5fe <vprintf+0xf2>
      } else if(c == 'p') {
 592:	09b78463          	beq	a5,s11,61a <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 596:	07300713          	li	a4,115
 59a:	0ce78663          	beq	a5,a4,666 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 59e:	06300713          	li	a4,99
 5a2:	0ee78e63          	beq	a5,a4,69e <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 5a6:	11478863          	beq	a5,s4,6b6 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5aa:	85d2                	mv	a1,s4
 5ac:	8556                	mv	a0,s5
 5ae:	00000097          	auipc	ra,0x0
 5b2:	e92080e7          	jalr	-366(ra) # 440 <putc>
        putc(fd, c);
 5b6:	85ca                	mv	a1,s2
 5b8:	8556                	mv	a0,s5
 5ba:	00000097          	auipc	ra,0x0
 5be:	e86080e7          	jalr	-378(ra) # 440 <putc>
      }
      state = 0;
 5c2:	4981                	li	s3,0
 5c4:	b765                	j	56c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5c6:	008b0913          	addi	s2,s6,8
 5ca:	4685                	li	a3,1
 5cc:	4629                	li	a2,10
 5ce:	000b2583          	lw	a1,0(s6)
 5d2:	8556                	mv	a0,s5
 5d4:	00000097          	auipc	ra,0x0
 5d8:	e8e080e7          	jalr	-370(ra) # 462 <printint>
 5dc:	8b4a                	mv	s6,s2
      state = 0;
 5de:	4981                	li	s3,0
 5e0:	b771                	j	56c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5e2:	008b0913          	addi	s2,s6,8
 5e6:	4681                	li	a3,0
 5e8:	4629                	li	a2,10
 5ea:	000b2583          	lw	a1,0(s6)
 5ee:	8556                	mv	a0,s5
 5f0:	00000097          	auipc	ra,0x0
 5f4:	e72080e7          	jalr	-398(ra) # 462 <printint>
 5f8:	8b4a                	mv	s6,s2
      state = 0;
 5fa:	4981                	li	s3,0
 5fc:	bf85                	j	56c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5fe:	008b0913          	addi	s2,s6,8
 602:	4681                	li	a3,0
 604:	4641                	li	a2,16
 606:	000b2583          	lw	a1,0(s6)
 60a:	8556                	mv	a0,s5
 60c:	00000097          	auipc	ra,0x0
 610:	e56080e7          	jalr	-426(ra) # 462 <printint>
 614:	8b4a                	mv	s6,s2
      state = 0;
 616:	4981                	li	s3,0
 618:	bf91                	j	56c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 61a:	008b0793          	addi	a5,s6,8
 61e:	f8f43423          	sd	a5,-120(s0)
 622:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 626:	03000593          	li	a1,48
 62a:	8556                	mv	a0,s5
 62c:	00000097          	auipc	ra,0x0
 630:	e14080e7          	jalr	-492(ra) # 440 <putc>
  putc(fd, 'x');
 634:	85ea                	mv	a1,s10
 636:	8556                	mv	a0,s5
 638:	00000097          	auipc	ra,0x0
 63c:	e08080e7          	jalr	-504(ra) # 440 <putc>
 640:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 642:	03c9d793          	srli	a5,s3,0x3c
 646:	97de                	add	a5,a5,s7
 648:	0007c583          	lbu	a1,0(a5)
 64c:	8556                	mv	a0,s5
 64e:	00000097          	auipc	ra,0x0
 652:	df2080e7          	jalr	-526(ra) # 440 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 656:	0992                	slli	s3,s3,0x4
 658:	397d                	addiw	s2,s2,-1
 65a:	fe0914e3          	bnez	s2,642 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 65e:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 662:	4981                	li	s3,0
 664:	b721                	j	56c <vprintf+0x60>
        s = va_arg(ap, char*);
 666:	008b0993          	addi	s3,s6,8
 66a:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 66e:	02090163          	beqz	s2,690 <vprintf+0x184>
        while(*s != 0){
 672:	00094583          	lbu	a1,0(s2)
 676:	c9a1                	beqz	a1,6c6 <vprintf+0x1ba>
          putc(fd, *s);
 678:	8556                	mv	a0,s5
 67a:	00000097          	auipc	ra,0x0
 67e:	dc6080e7          	jalr	-570(ra) # 440 <putc>
          s++;
 682:	0905                	addi	s2,s2,1
        while(*s != 0){
 684:	00094583          	lbu	a1,0(s2)
 688:	f9e5                	bnez	a1,678 <vprintf+0x16c>
        s = va_arg(ap, char*);
 68a:	8b4e                	mv	s6,s3
      state = 0;
 68c:	4981                	li	s3,0
 68e:	bdf9                	j	56c <vprintf+0x60>
          s = "(null)";
 690:	00001917          	auipc	s2,0x1
 694:	82090913          	addi	s2,s2,-2016 # eb0 <thread_yield+0x190>
        while(*s != 0){
 698:	02800593          	li	a1,40
 69c:	bff1                	j	678 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 69e:	008b0913          	addi	s2,s6,8
 6a2:	000b4583          	lbu	a1,0(s6)
 6a6:	8556                	mv	a0,s5
 6a8:	00000097          	auipc	ra,0x0
 6ac:	d98080e7          	jalr	-616(ra) # 440 <putc>
 6b0:	8b4a                	mv	s6,s2
      state = 0;
 6b2:	4981                	li	s3,0
 6b4:	bd65                	j	56c <vprintf+0x60>
        putc(fd, c);
 6b6:	85d2                	mv	a1,s4
 6b8:	8556                	mv	a0,s5
 6ba:	00000097          	auipc	ra,0x0
 6be:	d86080e7          	jalr	-634(ra) # 440 <putc>
      state = 0;
 6c2:	4981                	li	s3,0
 6c4:	b565                	j	56c <vprintf+0x60>
        s = va_arg(ap, char*);
 6c6:	8b4e                	mv	s6,s3
      state = 0;
 6c8:	4981                	li	s3,0
 6ca:	b54d                	j	56c <vprintf+0x60>
    }
  }
}
 6cc:	70e6                	ld	ra,120(sp)
 6ce:	7446                	ld	s0,112(sp)
 6d0:	74a6                	ld	s1,104(sp)
 6d2:	7906                	ld	s2,96(sp)
 6d4:	69e6                	ld	s3,88(sp)
 6d6:	6a46                	ld	s4,80(sp)
 6d8:	6aa6                	ld	s5,72(sp)
 6da:	6b06                	ld	s6,64(sp)
 6dc:	7be2                	ld	s7,56(sp)
 6de:	7c42                	ld	s8,48(sp)
 6e0:	7ca2                	ld	s9,40(sp)
 6e2:	7d02                	ld	s10,32(sp)
 6e4:	6de2                	ld	s11,24(sp)
 6e6:	6109                	addi	sp,sp,128
 6e8:	8082                	ret

00000000000006ea <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6ea:	715d                	addi	sp,sp,-80
 6ec:	ec06                	sd	ra,24(sp)
 6ee:	e822                	sd	s0,16(sp)
 6f0:	1000                	addi	s0,sp,32
 6f2:	e010                	sd	a2,0(s0)
 6f4:	e414                	sd	a3,8(s0)
 6f6:	e818                	sd	a4,16(s0)
 6f8:	ec1c                	sd	a5,24(s0)
 6fa:	03043023          	sd	a6,32(s0)
 6fe:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 702:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 706:	8622                	mv	a2,s0
 708:	00000097          	auipc	ra,0x0
 70c:	e04080e7          	jalr	-508(ra) # 50c <vprintf>
}
 710:	60e2                	ld	ra,24(sp)
 712:	6442                	ld	s0,16(sp)
 714:	6161                	addi	sp,sp,80
 716:	8082                	ret

0000000000000718 <printf>:

void
printf(const char *fmt, ...)
{
 718:	711d                	addi	sp,sp,-96
 71a:	ec06                	sd	ra,24(sp)
 71c:	e822                	sd	s0,16(sp)
 71e:	1000                	addi	s0,sp,32
 720:	e40c                	sd	a1,8(s0)
 722:	e810                	sd	a2,16(s0)
 724:	ec14                	sd	a3,24(s0)
 726:	f018                	sd	a4,32(s0)
 728:	f41c                	sd	a5,40(s0)
 72a:	03043823          	sd	a6,48(s0)
 72e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 732:	00840613          	addi	a2,s0,8
 736:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 73a:	85aa                	mv	a1,a0
 73c:	4505                	li	a0,1
 73e:	00000097          	auipc	ra,0x0
 742:	dce080e7          	jalr	-562(ra) # 50c <vprintf>
}
 746:	60e2                	ld	ra,24(sp)
 748:	6442                	ld	s0,16(sp)
 74a:	6125                	addi	sp,sp,96
 74c:	8082                	ret

000000000000074e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 74e:	1141                	addi	sp,sp,-16
 750:	e422                	sd	s0,8(sp)
 752:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 754:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 758:	00000797          	auipc	a5,0x0
 75c:	7787b783          	ld	a5,1912(a5) # ed0 <freep>
 760:	a805                	j	790 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 762:	4618                	lw	a4,8(a2)
 764:	9db9                	addw	a1,a1,a4
 766:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 76a:	6398                	ld	a4,0(a5)
 76c:	6318                	ld	a4,0(a4)
 76e:	fee53823          	sd	a4,-16(a0)
 772:	a091                	j	7b6 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 774:	ff852703          	lw	a4,-8(a0)
 778:	9e39                	addw	a2,a2,a4
 77a:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 77c:	ff053703          	ld	a4,-16(a0)
 780:	e398                	sd	a4,0(a5)
 782:	a099                	j	7c8 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 784:	6398                	ld	a4,0(a5)
 786:	00e7e463          	bltu	a5,a4,78e <free+0x40>
 78a:	00e6ea63          	bltu	a3,a4,79e <free+0x50>
{
 78e:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 790:	fed7fae3          	bgeu	a5,a3,784 <free+0x36>
 794:	6398                	ld	a4,0(a5)
 796:	00e6e463          	bltu	a3,a4,79e <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79a:	fee7eae3          	bltu	a5,a4,78e <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 79e:	ff852583          	lw	a1,-8(a0)
 7a2:	6390                	ld	a2,0(a5)
 7a4:	02059713          	slli	a4,a1,0x20
 7a8:	9301                	srli	a4,a4,0x20
 7aa:	0712                	slli	a4,a4,0x4
 7ac:	9736                	add	a4,a4,a3
 7ae:	fae60ae3          	beq	a2,a4,762 <free+0x14>
    bp->s.ptr = p->s.ptr;
 7b2:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7b6:	4790                	lw	a2,8(a5)
 7b8:	02061713          	slli	a4,a2,0x20
 7bc:	9301                	srli	a4,a4,0x20
 7be:	0712                	slli	a4,a4,0x4
 7c0:	973e                	add	a4,a4,a5
 7c2:	fae689e3          	beq	a3,a4,774 <free+0x26>
  } else
    p->s.ptr = bp;
 7c6:	e394                	sd	a3,0(a5)
  freep = p;
 7c8:	00000717          	auipc	a4,0x0
 7cc:	70f73423          	sd	a5,1800(a4) # ed0 <freep>
}
 7d0:	6422                	ld	s0,8(sp)
 7d2:	0141                	addi	sp,sp,16
 7d4:	8082                	ret

00000000000007d6 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d6:	7139                	addi	sp,sp,-64
 7d8:	fc06                	sd	ra,56(sp)
 7da:	f822                	sd	s0,48(sp)
 7dc:	f426                	sd	s1,40(sp)
 7de:	f04a                	sd	s2,32(sp)
 7e0:	ec4e                	sd	s3,24(sp)
 7e2:	e852                	sd	s4,16(sp)
 7e4:	e456                	sd	s5,8(sp)
 7e6:	e05a                	sd	s6,0(sp)
 7e8:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ea:	02051493          	slli	s1,a0,0x20
 7ee:	9081                	srli	s1,s1,0x20
 7f0:	04bd                	addi	s1,s1,15
 7f2:	8091                	srli	s1,s1,0x4
 7f4:	0014899b          	addiw	s3,s1,1
 7f8:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7fa:	00000517          	auipc	a0,0x0
 7fe:	6d653503          	ld	a0,1750(a0) # ed0 <freep>
 802:	c515                	beqz	a0,82e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 804:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 806:	4798                	lw	a4,8(a5)
 808:	02977f63          	bgeu	a4,s1,846 <malloc+0x70>
 80c:	8a4e                	mv	s4,s3
 80e:	0009871b          	sext.w	a4,s3
 812:	6685                	lui	a3,0x1
 814:	00d77363          	bgeu	a4,a3,81a <malloc+0x44>
 818:	6a05                	lui	s4,0x1
 81a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 81e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 822:	00000917          	auipc	s2,0x0
 826:	6ae90913          	addi	s2,s2,1710 # ed0 <freep>
  if(p == (char*)-1)
 82a:	5afd                	li	s5,-1
 82c:	a88d                	j	89e <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 82e:	00000797          	auipc	a5,0x0
 832:	6b278793          	addi	a5,a5,1714 # ee0 <base>
 836:	00000717          	auipc	a4,0x0
 83a:	68f73d23          	sd	a5,1690(a4) # ed0 <freep>
 83e:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 840:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 844:	b7e1                	j	80c <malloc+0x36>
      if(p->s.size == nunits)
 846:	02e48b63          	beq	s1,a4,87c <malloc+0xa6>
        p->s.size -= nunits;
 84a:	4137073b          	subw	a4,a4,s3
 84e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 850:	1702                	slli	a4,a4,0x20
 852:	9301                	srli	a4,a4,0x20
 854:	0712                	slli	a4,a4,0x4
 856:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 858:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 85c:	00000717          	auipc	a4,0x0
 860:	66a73a23          	sd	a0,1652(a4) # ed0 <freep>
      return (void*)(p + 1);
 864:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 868:	70e2                	ld	ra,56(sp)
 86a:	7442                	ld	s0,48(sp)
 86c:	74a2                	ld	s1,40(sp)
 86e:	7902                	ld	s2,32(sp)
 870:	69e2                	ld	s3,24(sp)
 872:	6a42                	ld	s4,16(sp)
 874:	6aa2                	ld	s5,8(sp)
 876:	6b02                	ld	s6,0(sp)
 878:	6121                	addi	sp,sp,64
 87a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 87c:	6398                	ld	a4,0(a5)
 87e:	e118                	sd	a4,0(a0)
 880:	bff1                	j	85c <malloc+0x86>
  hp->s.size = nu;
 882:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 886:	0541                	addi	a0,a0,16
 888:	00000097          	auipc	ra,0x0
 88c:	ec6080e7          	jalr	-314(ra) # 74e <free>
  return freep;
 890:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 894:	d971                	beqz	a0,868 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 896:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 898:	4798                	lw	a4,8(a5)
 89a:	fa9776e3          	bgeu	a4,s1,846 <malloc+0x70>
    if(p == freep)
 89e:	00093703          	ld	a4,0(s2)
 8a2:	853e                	mv	a0,a5
 8a4:	fef719e3          	bne	a4,a5,896 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8a8:	8552                	mv	a0,s4
 8aa:	00000097          	auipc	ra,0x0
 8ae:	b7e080e7          	jalr	-1154(ra) # 428 <sbrk>
  if(p == (char*)-1)
 8b2:	fd5518e3          	bne	a0,s5,882 <malloc+0xac>
        return 0;
 8b6:	4501                	li	a0,0
 8b8:	bf45                	j	868 <malloc+0x92>

00000000000008ba <setjmp>:
 8ba:	e100                	sd	s0,0(a0)
 8bc:	e504                	sd	s1,8(a0)
 8be:	01253823          	sd	s2,16(a0)
 8c2:	01353c23          	sd	s3,24(a0)
 8c6:	03453023          	sd	s4,32(a0)
 8ca:	03553423          	sd	s5,40(a0)
 8ce:	03653823          	sd	s6,48(a0)
 8d2:	03753c23          	sd	s7,56(a0)
 8d6:	05853023          	sd	s8,64(a0)
 8da:	05953423          	sd	s9,72(a0)
 8de:	05a53823          	sd	s10,80(a0)
 8e2:	05b53c23          	sd	s11,88(a0)
 8e6:	06153023          	sd	ra,96(a0)
 8ea:	06253423          	sd	sp,104(a0)
 8ee:	4501                	li	a0,0
 8f0:	8082                	ret

00000000000008f2 <longjmp>:
 8f2:	6100                	ld	s0,0(a0)
 8f4:	6504                	ld	s1,8(a0)
 8f6:	01053903          	ld	s2,16(a0)
 8fa:	01853983          	ld	s3,24(a0)
 8fe:	02053a03          	ld	s4,32(a0)
 902:	02853a83          	ld	s5,40(a0)
 906:	03053b03          	ld	s6,48(a0)
 90a:	03853b83          	ld	s7,56(a0)
 90e:	04053c03          	ld	s8,64(a0)
 912:	04853c83          	ld	s9,72(a0)
 916:	05053d03          	ld	s10,80(a0)
 91a:	05853d83          	ld	s11,88(a0)
 91e:	06053083          	ld	ra,96(a0)
 922:	06853103          	ld	sp,104(a0)
 926:	c199                	beqz	a1,92c <longjmp_1>
 928:	852e                	mv	a0,a1
 92a:	8082                	ret

000000000000092c <longjmp_1>:
 92c:	4505                	li	a0,1
 92e:	8082                	ret

0000000000000930 <thread_create>:
static struct thread* current_thread = NULL;
static int id = 1;
static jmp_buf env_st;
static jmp_buf env_tmp;

struct thread *thread_create(void (*f)(void *), void *arg){
 930:	7179                	addi	sp,sp,-48
 932:	f406                	sd	ra,40(sp)
 934:	f022                	sd	s0,32(sp)
 936:	ec26                	sd	s1,24(sp)
 938:	e84a                	sd	s2,16(sp)
 93a:	e44e                	sd	s3,8(sp)
 93c:	e052                	sd	s4,0(sp)
 93e:	1800                	addi	s0,sp,48
 940:	8a2a                	mv	s4,a0
 942:	89ae                	mv	s3,a1
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
 944:	6921                	lui	s2,0x8
 946:	ab090513          	addi	a0,s2,-1360 # 7ab0 <__global_pointer$+0x63e7>
 94a:	00000097          	auipc	ra,0x0
 94e:	e8c080e7          	jalr	-372(ra) # 7d6 <malloc>
 952:	84aa                	mv	s1,a0
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
 954:	6505                	lui	a0,0x1
 956:	80050513          	addi	a0,a0,-2048 # 800 <malloc+0x2a>
 95a:	00000097          	auipc	ra,0x0
 95e:	e7c080e7          	jalr	-388(ra) # 7d6 <malloc>
    new_stack_p = new_stack + 0x100*8-0x2*8;
    t->fp = f;
 962:	0144b023          	sd	s4,0(s1)
    t->arg = arg;
 966:	0134b423          	sd	s3,8(s1)
    t->ID  = id;
 96a:	00000997          	auipc	s3,0x0
 96e:	56298993          	addi	s3,s3,1378 # ecc <id>
 972:	0009a783          	lw	a5,0(s3)
 976:	08f4aa23          	sw	a5,148(s1)
    t->buf_set = 0;
 97a:	0804a823          	sw	zero,144(s1)
    t->stack = (void*) new_stack;
 97e:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack + 0x100*8-0x2*8;
 980:	7f050513          	addi	a0,a0,2032
    t->stack_p = (void*) new_stack_p;
 984:	ec88                	sd	a0,24(s1)

    t->task_id = 0;
 986:	9926                	add	s2,s2,s1
 988:	aa092423          	sw	zero,-1368(s2)
    memset(t->task_sets, 0, sizeof(t->task_sets));
 98c:	20000613          	li	a2,512
 990:	4581                	li	a1,0
 992:	651d                	lui	a0,0x7
 994:	0a850513          	addi	a0,a0,168 # 70a8 <__global_pointer$+0x59df>
 998:	9526                	add	a0,a0,s1
 99a:	00000097          	auipc	ra,0x0
 99e:	802080e7          	jalr	-2046(ra) # 19c <memset>
    id++;
 9a2:	0009a783          	lw	a5,0(s3)
 9a6:	2785                	addiw	a5,a5,1
 9a8:	00f9a023          	sw	a5,0(s3)
    return t;
}
 9ac:	8526                	mv	a0,s1
 9ae:	70a2                	ld	ra,40(sp)
 9b0:	7402                	ld	s0,32(sp)
 9b2:	64e2                	ld	s1,24(sp)
 9b4:	6942                	ld	s2,16(sp)
 9b6:	69a2                	ld	s3,8(sp)
 9b8:	6a02                	ld	s4,0(sp)
 9ba:	6145                	addi	sp,sp,48
 9bc:	8082                	ret

00000000000009be <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
 9be:	1141                	addi	sp,sp,-16
 9c0:	e422                	sd	s0,8(sp)
 9c2:	0800                	addi	s0,sp,16
    if(current_thread == NULL){
 9c4:	00000797          	auipc	a5,0x0
 9c8:	5147b783          	ld	a5,1300(a5) # ed8 <current_thread>
 9cc:	cb89                	beqz	a5,9de <thread_add_runqueue+0x20>
        current_thread->next = current_thread;
        current_thread->previous = current_thread;
    }
    else{
        // TODO
        struct thread *prevoius_thread = current_thread->previous;
 9ce:	6fd8                	ld	a4,152(a5)
        t->next = current_thread;
 9d0:	f15c                	sd	a5,160(a0)
        t->previous = prevoius_thread;
 9d2:	ed58                	sd	a4,152(a0)
        prevoius_thread->next = t;
 9d4:	f348                	sd	a0,160(a4)
        current_thread->previous = t;
 9d6:	efc8                	sd	a0,152(a5)
    }
}
 9d8:	6422                	ld	s0,8(sp)
 9da:	0141                	addi	sp,sp,16
 9dc:	8082                	ret
        current_thread = t;
 9de:	00000797          	auipc	a5,0x0
 9e2:	4ea7bd23          	sd	a0,1274(a5) # ed8 <current_thread>
        current_thread->next = current_thread;
 9e6:	f148                	sd	a0,160(a0)
        current_thread->previous = current_thread;
 9e8:	ed48                	sd	a0,152(a0)
 9ea:	b7fd                	j	9d8 <thread_add_runqueue+0x1a>

00000000000009ec <schedule>:
        current_thread->env->sp = env_tmp->sp;
        current_thread->fp(current_thread->arg);
    }
    thread_exit();
}
void schedule(void){
 9ec:	1141                	addi	sp,sp,-16
 9ee:	e422                	sd	s0,8(sp)
 9f0:	0800                	addi	s0,sp,16
    // TODO
    current_thread = current_thread->next;
 9f2:	00000797          	auipc	a5,0x0
 9f6:	4e678793          	addi	a5,a5,1254 # ed8 <current_thread>
 9fa:	6398                	ld	a4,0(a5)
 9fc:	7358                	ld	a4,160(a4)
 9fe:	e398                	sd	a4,0(a5)
}
 a00:	6422                	ld	s0,8(sp)
 a02:	0141                	addi	sp,sp,16
 a04:	8082                	ret

0000000000000a06 <thread_exit>:
void thread_exit(void){
 a06:	1101                	addi	sp,sp,-32
 a08:	ec06                	sd	ra,24(sp)
 a0a:	e822                	sd	s0,16(sp)
 a0c:	e426                	sd	s1,8(sp)
 a0e:	e04a                	sd	s2,0(sp)
 a10:	1000                	addi	s0,sp,32
    if(current_thread->next != current_thread){
 a12:	00000497          	auipc	s1,0x0
 a16:	4c64b483          	ld	s1,1222(s1) # ed8 <current_thread>
 a1a:	70dc                	ld	a5,160(s1)
 a1c:	06f48f63          	beq	s1,a5,a9a <thread_exit+0x94>
        // TODO
        struct thread *tmp = current_thread;
        struct thread *prevoius_thread = current_thread->previous;
 a20:	6cd8                	ld	a4,152(s1)
        struct thread *next_thread = current_thread->next;

        prevoius_thread->next = next_thread;
 a22:	f35c                	sd	a5,160(a4)
        next_thread->previous = prevoius_thread;
 a24:	efd8                	sd	a4,152(a5)
        current_thread = next_thread;
 a26:	00000917          	auipc	s2,0x0
 a2a:	4b290913          	addi	s2,s2,1202 # ed8 <current_thread>
 a2e:	00f93023          	sd	a5,0(s2)
        
        free(tmp->stack);
 a32:	6888                	ld	a0,16(s1)
 a34:	00000097          	auipc	ra,0x0
 a38:	d1a080e7          	jalr	-742(ra) # 74e <free>
        free(tmp);
 a3c:	8526                	mv	a0,s1
 a3e:	00000097          	auipc	ra,0x0
 a42:	d10080e7          	jalr	-752(ra) # 74e <free>

        if (current_thread->task_id){
 a46:	00093503          	ld	a0,0(s2)
 a4a:	67a1                	lui	a5,0x8
 a4c:	97aa                	add	a5,a5,a0
 a4e:	aa87a703          	lw	a4,-1368(a5) # 7aa8 <__global_pointer$+0x63df>
 a52:	cb15                	beqz	a4,a86 <thread_exit+0x80>
            current_thread->stack_p = (void*)current_thread->task_envs[current_thread->task_id]->sp;
 a54:	00371793          	slli	a5,a4,0x3
 a58:	40e786b3          	sub	a3,a5,a4
 a5c:	0692                	slli	a3,a3,0x4
 a5e:	96aa                	add	a3,a3,a0
 a60:	1106b683          	ld	a3,272(a3) # 1110 <__BSS_END__+0x140>
 a64:	ed14                	sd	a3,24(a0)
            longjmp(current_thread->task_envs[current_thread->task_id], 1);
 a66:	8f99                	sub	a5,a5,a4
 a68:	0792                	slli	a5,a5,0x4
 a6a:	0a878793          	addi	a5,a5,168
 a6e:	4585                	li	a1,1
 a70:	953e                	add	a0,a0,a5
 a72:	00000097          	auipc	ra,0x0
 a76:	e80080e7          	jalr	-384(ra) # 8f2 <longjmp>
        free(current_thread->stack);
        free(current_thread);
        current_thread = NULL;
        longjmp(env_st, 1);
    }
}
 a7a:	60e2                	ld	ra,24(sp)
 a7c:	6442                	ld	s0,16(sp)
 a7e:	64a2                	ld	s1,8(sp)
 a80:	6902                	ld	s2,0(sp)
 a82:	6105                	addi	sp,sp,32
 a84:	8082                	ret
            current_thread->stack_p = (void*)current_thread->env->sp;
 a86:	655c                	ld	a5,136(a0)
 a88:	ed1c                	sd	a5,24(a0)
            longjmp(current_thread->env, 1); // jump to next thread
 a8a:	4585                	li	a1,1
 a8c:	02050513          	addi	a0,a0,32
 a90:	00000097          	auipc	ra,0x0
 a94:	e62080e7          	jalr	-414(ra) # 8f2 <longjmp>
 a98:	b7cd                	j	a7a <thread_exit+0x74>
        free(current_thread->stack);
 a9a:	6888                	ld	a0,16(s1)
 a9c:	00000097          	auipc	ra,0x0
 aa0:	cb2080e7          	jalr	-846(ra) # 74e <free>
        free(current_thread);
 aa4:	00000497          	auipc	s1,0x0
 aa8:	43448493          	addi	s1,s1,1076 # ed8 <current_thread>
 aac:	6088                	ld	a0,0(s1)
 aae:	00000097          	auipc	ra,0x0
 ab2:	ca0080e7          	jalr	-864(ra) # 74e <free>
        current_thread = NULL;
 ab6:	0004b023          	sd	zero,0(s1)
        longjmp(env_st, 1);
 aba:	4585                	li	a1,1
 abc:	00000517          	auipc	a0,0x0
 ac0:	43450513          	addi	a0,a0,1076 # ef0 <env_st>
 ac4:	00000097          	auipc	ra,0x0
 ac8:	e2e080e7          	jalr	-466(ra) # 8f2 <longjmp>
}
 acc:	b77d                	j	a7a <thread_exit+0x74>

0000000000000ace <dispatch>:
void dispatch(void){
 ace:	1101                	addi	sp,sp,-32
 ad0:	ec06                	sd	ra,24(sp)
 ad2:	e822                	sd	s0,16(sp)
 ad4:	1000                	addi	s0,sp,32
    if (current_thread->task_id){
 ad6:	00000717          	auipc	a4,0x0
 ada:	40273703          	ld	a4,1026(a4) # ed8 <current_thread>
 ade:	67a1                	lui	a5,0x8
 ae0:	97ba                	add	a5,a5,a4
 ae2:	aa87a683          	lw	a3,-1368(a5) # 7aa8 <__global_pointer$+0x63df>
 ae6:	fed43423          	sd	a3,-24(s0)
 aea:	cec1                	beqz	a3,b82 <dispatch+0xb4>
        if (current_thread->task_sets[current_task_id]){ // if the task has been set
 aec:	6789                	lui	a5,0x2
 aee:	c2878793          	addi	a5,a5,-984 # 1c28 <__global_pointer$+0x55f>
 af2:	97b6                	add	a5,a5,a3
 af4:	078a                	slli	a5,a5,0x2
 af6:	97ba                	add	a5,a5,a4
 af8:	479c                	lw	a5,8(a5)
 afa:	eff9                	bnez	a5,bd8 <dispatch+0x10a>
        current_thread->task_sets[current_task_id] = 1; // set the task
 afc:	6789                	lui	a5,0x2
 afe:	c2878793          	addi	a5,a5,-984 # 1c28 <__global_pointer$+0x55f>
 b02:	fe843703          	ld	a4,-24(s0)
 b06:	97ba                	add	a5,a5,a4
 b08:	078a                	slli	a5,a5,0x2
 b0a:	00000717          	auipc	a4,0x0
 b0e:	3ce73703          	ld	a4,974(a4) # ed8 <current_thread>
 b12:	97ba                	add	a5,a5,a4
 b14:	4705                	li	a4,1
 b16:	c798                	sw	a4,8(a5)
        if (setjmp(env_tmp) == 0){
 b18:	00000517          	auipc	a0,0x0
 b1c:	44850513          	addi	a0,a0,1096 # f60 <env_tmp>
 b20:	00000097          	auipc	ra,0x0
 b24:	d9a080e7          	jalr	-614(ra) # 8ba <setjmp>
 b28:	cd69                	beqz	a0,c02 <dispatch+0x134>
            current_thread->task_envs[current_task_id]->sp = env_tmp->sp;
 b2a:	00000797          	auipc	a5,0x0
 b2e:	3ae7b783          	ld	a5,942(a5) # ed8 <current_thread>
 b32:	fe843703          	ld	a4,-24(s0)
 b36:	00371693          	slli	a3,a4,0x3
 b3a:	40e68733          	sub	a4,a3,a4
 b3e:	0712                	slli	a4,a4,0x4
 b40:	973e                	add	a4,a4,a5
 b42:	00000617          	auipc	a2,0x0
 b46:	48663603          	ld	a2,1158(a2) # fc8 <env_tmp+0x68>
 b4a:	10c73823          	sd	a2,272(a4)
            void (*task)(void *) = current_thread->tasks[current_task_id];
 b4e:	97b6                	add	a5,a5,a3
            void *task_arg = current_thread->task_args[current_task_id];
 b50:	671d                	lui	a4,0x7
 b52:	97ba                	add	a5,a5,a4
            task(task_arg);
 b54:	2a87b703          	ld	a4,680(a5)
 b58:	6a87b503          	ld	a0,1704(a5)
 b5c:	9702                	jalr	a4
        longjmp(current_thread->task_envs[current_task_id], 1);
 b5e:	fe843703          	ld	a4,-24(s0)
 b62:	00371793          	slli	a5,a4,0x3
 b66:	8f99                	sub	a5,a5,a4
 b68:	0792                	slli	a5,a5,0x4
 b6a:	0a878793          	addi	a5,a5,168
 b6e:	4585                	li	a1,1
 b70:	00000517          	auipc	a0,0x0
 b74:	36853503          	ld	a0,872(a0) # ed8 <current_thread>
 b78:	953e                	add	a0,a0,a5
 b7a:	00000097          	auipc	ra,0x0
 b7e:	d78080e7          	jalr	-648(ra) # 8f2 <longjmp>
    if (current_thread->buf_set){ // if the jmp_buf has been set
 b82:	00000517          	auipc	a0,0x0
 b86:	35653503          	ld	a0,854(a0) # ed8 <current_thread>
 b8a:	09052783          	lw	a5,144(a0)
 b8e:	efc9                	bnez	a5,c28 <dispatch+0x15a>
    current_thread->buf_set = 1; // set the jmp_buf
 b90:	00000797          	auipc	a5,0x0
 b94:	3487b783          	ld	a5,840(a5) # ed8 <current_thread>
 b98:	4705                	li	a4,1
 b9a:	08e7a823          	sw	a4,144(a5)
    if (setjmp(env_tmp) == 0){
 b9e:	00000517          	auipc	a0,0x0
 ba2:	3c250513          	addi	a0,a0,962 # f60 <env_tmp>
 ba6:	00000097          	auipc	ra,0x0
 baa:	d14080e7          	jalr	-748(ra) # 8ba <setjmp>
 bae:	c559                	beqz	a0,c3c <dispatch+0x16e>
        current_thread->env->sp = env_tmp->sp;
 bb0:	00000797          	auipc	a5,0x0
 bb4:	3287b783          	ld	a5,808(a5) # ed8 <current_thread>
 bb8:	00000717          	auipc	a4,0x0
 bbc:	41073703          	ld	a4,1040(a4) # fc8 <env_tmp+0x68>
 bc0:	e7d8                	sd	a4,136(a5)
        current_thread->fp(current_thread->arg);
 bc2:	6398                	ld	a4,0(a5)
 bc4:	6788                	ld	a0,8(a5)
 bc6:	9702                	jalr	a4
    thread_exit();
 bc8:	00000097          	auipc	ra,0x0
 bcc:	e3e080e7          	jalr	-450(ra) # a06 <thread_exit>
}
 bd0:	60e2                	ld	ra,24(sp)
 bd2:	6442                	ld	s0,16(sp)
 bd4:	6105                	addi	sp,sp,32
 bd6:	8082                	ret
            current_thread->stack_p = (void*)current_thread->task_envs[current_task_id]->sp;
 bd8:	00369793          	slli	a5,a3,0x3
 bdc:	8f95                	sub	a5,a5,a3
 bde:	0792                	slli	a5,a5,0x4
 be0:	97ba                	add	a5,a5,a4
 be2:	1107b783          	ld	a5,272(a5)
 be6:	ef1c                	sd	a5,24(a4)
            longjmp(current_thread->task_envs[current_task_id], 1);
 be8:	00369513          	slli	a0,a3,0x3
 bec:	8d15                	sub	a0,a0,a3
 bee:	0512                	slli	a0,a0,0x4
 bf0:	0a850513          	addi	a0,a0,168
 bf4:	4585                	li	a1,1
 bf6:	953a                	add	a0,a0,a4
 bf8:	00000097          	auipc	ra,0x0
 bfc:	cfa080e7          	jalr	-774(ra) # 8f2 <longjmp>
 c00:	bdf5                	j	afc <dispatch+0x2e>
            env_tmp->sp = (unsigned long)current_thread->stack_p; // set the stack pointer
 c02:	00000797          	auipc	a5,0x0
 c06:	2d67b783          	ld	a5,726(a5) # ed8 <current_thread>
 c0a:	6f9c                	ld	a5,24(a5)
 c0c:	00000717          	auipc	a4,0x0
 c10:	3af73e23          	sd	a5,956(a4) # fc8 <env_tmp+0x68>
            longjmp(env_tmp, 1);
 c14:	4585                	li	a1,1
 c16:	00000517          	auipc	a0,0x0
 c1a:	34a50513          	addi	a0,a0,842 # f60 <env_tmp>
 c1e:	00000097          	auipc	ra,0x0
 c22:	cd4080e7          	jalr	-812(ra) # 8f2 <longjmp>
 c26:	bf25                	j	b5e <dispatch+0x90>
        current_thread->stack_p = (void*)current_thread->env->sp;
 c28:	655c                	ld	a5,136(a0)
 c2a:	ed1c                	sd	a5,24(a0)
        longjmp(current_thread->env, 1);
 c2c:	4585                	li	a1,1
 c2e:	02050513          	addi	a0,a0,32
 c32:	00000097          	auipc	ra,0x0
 c36:	cc0080e7          	jalr	-832(ra) # 8f2 <longjmp>
 c3a:	bf99                	j	b90 <dispatch+0xc2>
        env_tmp->sp = (unsigned long)current_thread->stack_p; // set the stack pointer
 c3c:	00000797          	auipc	a5,0x0
 c40:	29c7b783          	ld	a5,668(a5) # ed8 <current_thread>
 c44:	6f9c                	ld	a5,24(a5)
 c46:	00000717          	auipc	a4,0x0
 c4a:	38f73123          	sd	a5,898(a4) # fc8 <env_tmp+0x68>
        longjmp(env_tmp, 1);
 c4e:	4585                	li	a1,1
 c50:	00000517          	auipc	a0,0x0
 c54:	31050513          	addi	a0,a0,784 # f60 <env_tmp>
 c58:	00000097          	auipc	ra,0x0
 c5c:	c9a080e7          	jalr	-870(ra) # 8f2 <longjmp>
 c60:	b7a5                	j	bc8 <dispatch+0xfa>

0000000000000c62 <thread_start_threading>:
void thread_start_threading(void){
 c62:	1141                	addi	sp,sp,-16
 c64:	e406                	sd	ra,8(sp)
 c66:	e022                	sd	s0,0(sp)
 c68:	0800                	addi	s0,sp,16
    // TODO
    if (setjmp(env_st) == 0){
 c6a:	00000517          	auipc	a0,0x0
 c6e:	28650513          	addi	a0,a0,646 # ef0 <env_st>
 c72:	00000097          	auipc	ra,0x0
 c76:	c48080e7          	jalr	-952(ra) # 8ba <setjmp>
 c7a:	c509                	beqz	a0,c84 <thread_start_threading+0x22>
        dispatch();
    }    
}
 c7c:	60a2                	ld	ra,8(sp)
 c7e:	6402                	ld	s0,0(sp)
 c80:	0141                	addi	sp,sp,16
 c82:	8082                	ret
        dispatch();
 c84:	00000097          	auipc	ra,0x0
 c88:	e4a080e7          	jalr	-438(ra) # ace <dispatch>
}
 c8c:	bfc5                	j	c7c <thread_start_threading+0x1a>

0000000000000c8e <push>:
    push(t);
    t->tasks[t->task_id] = f;
    t->task_args[t->task_id] = arg; 
}

void push(struct thread *t) {
 c8e:	1141                	addi	sp,sp,-16
 c90:	e422                	sd	s0,8(sp)
 c92:	0800                	addi	s0,sp,16
    // printf("Thread%d pushing\n", t->ID);
    t->stack_p -= 0x2*8;
 c94:	6d1c                	ld	a5,24(a0)
 c96:	17c1                	addi	a5,a5,-16
 c98:	ed1c                	sd	a5,24(a0)
    t->task_id++;
 c9a:	67a1                	lui	a5,0x8
 c9c:	953e                	add	a0,a0,a5
 c9e:	aa852783          	lw	a5,-1368(a0)
 ca2:	2785                	addiw	a5,a5,1
 ca4:	aaf52423          	sw	a5,-1368(a0)
}
 ca8:	6422                	ld	s0,8(sp)
 caa:	0141                	addi	sp,sp,16
 cac:	8082                	ret

0000000000000cae <thread_assign_task>:
void thread_assign_task(struct thread *t, void (*f)(void *), void *arg){
 cae:	7179                	addi	sp,sp,-48
 cb0:	f406                	sd	ra,40(sp)
 cb2:	f022                	sd	s0,32(sp)
 cb4:	ec26                	sd	s1,24(sp)
 cb6:	e84a                	sd	s2,16(sp)
 cb8:	e44e                	sd	s3,8(sp)
 cba:	1800                	addi	s0,sp,48
 cbc:	84aa                	mv	s1,a0
 cbe:	89ae                	mv	s3,a1
 cc0:	8932                	mv	s2,a2
    push(t);
 cc2:	00000097          	auipc	ra,0x0
 cc6:	fcc080e7          	jalr	-52(ra) # c8e <push>
    t->tasks[t->task_id] = f;
 cca:	67a1                	lui	a5,0x8
 ccc:	97a6                	add	a5,a5,s1
 cce:	aa87a503          	lw	a0,-1368(a5) # 7aa8 <__global_pointer$+0x63df>
 cd2:	050e                	slli	a0,a0,0x3
 cd4:	94aa                	add	s1,s1,a0
 cd6:	651d                	lui	a0,0x7
 cd8:	94aa                	add	s1,s1,a0
 cda:	2b34b423          	sd	s3,680(s1)
    t->task_args[t->task_id] = arg; 
 cde:	6b24b423          	sd	s2,1704(s1)
}
 ce2:	70a2                	ld	ra,40(sp)
 ce4:	7402                	ld	s0,32(sp)
 ce6:	64e2                	ld	s1,24(sp)
 ce8:	6942                	ld	s2,16(sp)
 cea:	69a2                	ld	s3,8(sp)
 cec:	6145                	addi	sp,sp,48
 cee:	8082                	ret

0000000000000cf0 <pop>:

void pop(struct thread *t) {
 cf0:	1141                	addi	sp,sp,-16
 cf2:	e422                	sd	s0,8(sp)
 cf4:	0800                	addi	s0,sp,16
    // printf("Thread%d popping\n", t->ID);
    t->stack_p += 0x2*8;
 cf6:	6d1c                	ld	a5,24(a0)
 cf8:	07c1                	addi	a5,a5,16
 cfa:	ed1c                	sd	a5,24(a0)
    t->task_sets[t->task_id] = 0;
 cfc:	6721                	lui	a4,0x8
 cfe:	972a                	add	a4,a4,a0
 d00:	aa872683          	lw	a3,-1368(a4) # 7aa8 <__global_pointer$+0x63df>
 d04:	6789                	lui	a5,0x2
 d06:	c2878793          	addi	a5,a5,-984 # 1c28 <__global_pointer$+0x55f>
 d0a:	97b6                	add	a5,a5,a3
 d0c:	078a                	slli	a5,a5,0x2
 d0e:	953e                	add	a0,a0,a5
 d10:	00052423          	sw	zero,8(a0) # 7008 <__global_pointer$+0x593f>
    t->task_id--;
 d14:	36fd                	addiw	a3,a3,-1
 d16:	aad72423          	sw	a3,-1368(a4)
 d1a:	6422                	ld	s0,8(sp)
 d1c:	0141                	addi	sp,sp,16
 d1e:	8082                	ret

0000000000000d20 <thread_yield>:
void thread_yield(void){
 d20:	1141                	addi	sp,sp,-16
 d22:	e406                	sd	ra,8(sp)
 d24:	e022                	sd	s0,0(sp)
 d26:	0800                	addi	s0,sp,16
    if (current_thread->task_id){
 d28:	00000517          	auipc	a0,0x0
 d2c:	1b053503          	ld	a0,432(a0) # ed8 <current_thread>
 d30:	67a1                	lui	a5,0x8
 d32:	97aa                	add	a5,a5,a0
 d34:	aa87a703          	lw	a4,-1368(a5) # 7aa8 <__global_pointer$+0x63df>
 d38:	c749                	beqz	a4,dc2 <thread_yield+0xa2>
        if (setjmp(current_thread->task_envs[current_thread->task_id]) == 0){ 
 d3a:	00371793          	slli	a5,a4,0x3
 d3e:	8f99                	sub	a5,a5,a4
 d40:	0792                	slli	a5,a5,0x4
 d42:	0a878793          	addi	a5,a5,168
 d46:	953e                	add	a0,a0,a5
 d48:	00000097          	auipc	ra,0x0
 d4c:	b72080e7          	jalr	-1166(ra) # 8ba <setjmp>
 d50:	c509                	beqz	a0,d5a <thread_yield+0x3a>
}
 d52:	60a2                	ld	ra,8(sp)
 d54:	6402                	ld	s0,0(sp)
 d56:	0141                	addi	sp,sp,16
 d58:	8082                	ret
            schedule(); // schedule the next thread
 d5a:	00000097          	auipc	ra,0x0
 d5e:	c92080e7          	jalr	-878(ra) # 9ec <schedule>
            if (setjmp(current_thread->task_envs[current_thread->task_id]) == 0){ // if the current thread has task
 d62:	00000517          	auipc	a0,0x0
 d66:	17653503          	ld	a0,374(a0) # ed8 <current_thread>
 d6a:	67a1                	lui	a5,0x8
 d6c:	97aa                	add	a5,a5,a0
 d6e:	aa87a703          	lw	a4,-1368(a5) # 7aa8 <__global_pointer$+0x63df>
 d72:	00371793          	slli	a5,a4,0x3
 d76:	8f99                	sub	a5,a5,a4
 d78:	0792                	slli	a5,a5,0x4
 d7a:	0a878793          	addi	a5,a5,168
 d7e:	953e                	add	a0,a0,a5
 d80:	00000097          	auipc	ra,0x0
 d84:	b3a080e7          	jalr	-1222(ra) # 8ba <setjmp>
 d88:	e505                	bnez	a0,db0 <thread_yield+0x90>
                if (current_thread->task_id){
 d8a:	00000797          	auipc	a5,0x0
 d8e:	14e7b783          	ld	a5,334(a5) # ed8 <current_thread>
 d92:	6721                	lui	a4,0x8
 d94:	97ba                	add	a5,a5,a4
 d96:	aa87a783          	lw	a5,-1368(a5)
 d9a:	e791                	bnez	a5,da6 <thread_yield+0x86>
            dispatch(); // dispatch the thread
 d9c:	00000097          	auipc	ra,0x0
 da0:	d32080e7          	jalr	-718(ra) # ace <dispatch>
 da4:	b77d                	j	d52 <thread_yield+0x32>
                    dispatch();
 da6:	00000097          	auipc	ra,0x0
 daa:	d28080e7          	jalr	-728(ra) # ace <dispatch>
 dae:	b7fd                	j	d9c <thread_yield+0x7c>
                pop(current_thread);
 db0:	00000517          	auipc	a0,0x0
 db4:	12853503          	ld	a0,296(a0) # ed8 <current_thread>
 db8:	00000097          	auipc	ra,0x0
 dbc:	f38080e7          	jalr	-200(ra) # cf0 <pop>
 dc0:	bff1                	j	d9c <thread_yield+0x7c>
        if (setjmp(current_thread->env) == 0){ 
 dc2:	02050513          	addi	a0,a0,32
 dc6:	00000097          	auipc	ra,0x0
 dca:	af4080e7          	jalr	-1292(ra) # 8ba <setjmp>
 dce:	f151                	bnez	a0,d52 <thread_yield+0x32>
            schedule(); // schedule the next thread
 dd0:	00000097          	auipc	ra,0x0
 dd4:	c1c080e7          	jalr	-996(ra) # 9ec <schedule>
            if (setjmp(current_thread->task_envs[current_thread->task_id]) == 0){ // if the current thread has task
 dd8:	00000517          	auipc	a0,0x0
 ddc:	10053503          	ld	a0,256(a0) # ed8 <current_thread>
 de0:	67a1                	lui	a5,0x8
 de2:	97aa                	add	a5,a5,a0
 de4:	aa87a703          	lw	a4,-1368(a5) # 7aa8 <__global_pointer$+0x63df>
 de8:	00371793          	slli	a5,a4,0x3
 dec:	8f99                	sub	a5,a5,a4
 dee:	0792                	slli	a5,a5,0x4
 df0:	0a878793          	addi	a5,a5,168
 df4:	953e                	add	a0,a0,a5
 df6:	00000097          	auipc	ra,0x0
 dfa:	ac4080e7          	jalr	-1340(ra) # 8ba <setjmp>
 dfe:	e505                	bnez	a0,e26 <thread_yield+0x106>
                if (current_thread->task_id){
 e00:	00000797          	auipc	a5,0x0
 e04:	0d87b783          	ld	a5,216(a5) # ed8 <current_thread>
 e08:	6721                	lui	a4,0x8
 e0a:	97ba                	add	a5,a5,a4
 e0c:	aa87a783          	lw	a5,-1368(a5)
 e10:	e791                	bnez	a5,e1c <thread_yield+0xfc>
            dispatch(); // dispatch the thread
 e12:	00000097          	auipc	ra,0x0
 e16:	cbc080e7          	jalr	-836(ra) # ace <dispatch>
}
 e1a:	bf25                	j	d52 <thread_yield+0x32>
                    dispatch();
 e1c:	00000097          	auipc	ra,0x0
 e20:	cb2080e7          	jalr	-846(ra) # ace <dispatch>
 e24:	b7fd                	j	e12 <thread_yield+0xf2>
                pop(current_thread);
 e26:	00000517          	auipc	a0,0x0
 e2a:	0b253503          	ld	a0,178(a0) # ed8 <current_thread>
 e2e:	00000097          	auipc	ra,0x0
 e32:	ec2080e7          	jalr	-318(ra) # cf0 <pop>
 e36:	bff1                	j	e12 <thread_yield+0xf2>
