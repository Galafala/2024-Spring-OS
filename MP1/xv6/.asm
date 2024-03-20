
user/_mp1_1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <t1>:
    randomvar++;
    thread_yield();
    printf("task finished\n");
    return;
}
void t1(void* arg){
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
    printf("t1 executed and returned\n");
   8:	00001517          	auipc	a0,0x1
   c:	cf050513          	addi	a0,a0,-784 # cf8 <thread_start_threading+0x2e>
  10:	00000097          	auipc	ra,0x0
  14:	716080e7          	jalr	1814(ra) # 726 <printf>
}
  18:	60a2                	ld	ra,8(sp)
  1a:	6402                	ld	s0,0(sp)
  1c:	0141                	addi	sp,sp,16
  1e:	8082                	ret

0000000000000020 <task1>:
void task1(void* arg){
  20:	1141                	addi	sp,sp,-16
  22:	e406                	sd	ra,8(sp)
  24:	e022                	sd	s0,0(sp)
  26:	0800                	addi	s0,sp,16
    printf("task added\n");
  28:	00001517          	auipc	a0,0x1
  2c:	cf050513          	addi	a0,a0,-784 # d18 <thread_start_threading+0x4e>
  30:	00000097          	auipc	ra,0x0
  34:	6f6080e7          	jalr	1782(ra) # 726 <printf>
    thread_yield();
  38:	00001097          	auipc	ra,0x1
  3c:	b8e080e7          	jalr	-1138(ra) # bc6 <thread_yield>
    printf("task finished\n");
  40:	00001517          	auipc	a0,0x1
  44:	ce850513          	addi	a0,a0,-792 # d28 <thread_start_threading+0x5e>
  48:	00000097          	auipc	ra,0x0
  4c:	6de080e7          	jalr	1758(ra) # 726 <printf>
}
  50:	60a2                	ld	ra,8(sp)
  52:	6402                	ld	s0,0(sp)
  54:	0141                	addi	sp,sp,16
  56:	8082                	ret

0000000000000058 <t2>:
void t2(void* arg){
  58:	1101                	addi	sp,sp,-32
  5a:	ec06                	sd	ra,24(sp)
  5c:	e822                	sd	s0,16(sp)
  5e:	e426                	sd	s1,8(sp)
  60:	1000                	addi	s0,sp,32
    for(int i = 0; i < TASK_COUNT; ++i){
        thread_assign_task(thread1, task1, NULL);
  62:	00001497          	auipc	s1,0x1
  66:	d2e48493          	addi	s1,s1,-722 # d90 <thread1>
  6a:	4601                	li	a2,0
  6c:	00000597          	auipc	a1,0x0
  70:	fb458593          	addi	a1,a1,-76 # 20 <task1>
  74:	6088                	ld	a0,0(s1)
  76:	00001097          	auipc	ra,0x1
  7a:	9e6080e7          	jalr	-1562(ra) # a5c <thread_assign_task>
        thread_yield();
  7e:	00001097          	auipc	ra,0x1
  82:	b48080e7          	jalr	-1208(ra) # bc6 <thread_yield>
        thread_assign_task(thread1, task1, NULL);
  86:	4601                	li	a2,0
  88:	00000597          	auipc	a1,0x0
  8c:	f9858593          	addi	a1,a1,-104 # 20 <task1>
  90:	6088                	ld	a0,0(s1)
  92:	00001097          	auipc	ra,0x1
  96:	9ca080e7          	jalr	-1590(ra) # a5c <thread_assign_task>
        thread_yield();
  9a:	00001097          	auipc	ra,0x1
  9e:	b2c080e7          	jalr	-1236(ra) # bc6 <thread_yield>
    }
    printf("t2 end\n");
  a2:	00001517          	auipc	a0,0x1
  a6:	c9650513          	addi	a0,a0,-874 # d38 <thread_start_threading+0x6e>
  aa:	00000097          	auipc	ra,0x0
  ae:	67c080e7          	jalr	1660(ra) # 726 <printf>
}
  b2:	60e2                	ld	ra,24(sp)
  b4:	6442                	ld	s0,16(sp)
  b6:	64a2                	ld	s1,8(sp)
  b8:	6105                	addi	sp,sp,32
  ba:	8082                	ret

00000000000000bc <main>:


int main(int argc, char **argv) {
  bc:	1101                	addi	sp,sp,-32
  be:	ec06                	sd	ra,24(sp)
  c0:	e822                	sd	s0,16(sp)
  c2:	e426                	sd	s1,8(sp)
  c4:	1000                	addi	s0,sp,32
    printf("function execution test\n");
  c6:	00001517          	auipc	a0,0x1
  ca:	c7a50513          	addi	a0,a0,-902 # d40 <thread_start_threading+0x76>
  ce:	00000097          	auipc	ra,0x0
  d2:	658080e7          	jalr	1624(ra) # 726 <printf>
    thread1 = thread_create(t1, NULL);
  d6:	4581                	li	a1,0
  d8:	00000517          	auipc	a0,0x0
  dc:	f2850513          	addi	a0,a0,-216 # 0 <t1>
  e0:	00001097          	auipc	ra,0x1
  e4:	85e080e7          	jalr	-1954(ra) # 93e <thread_create>
  e8:	00001497          	auipc	s1,0x1
  ec:	ca848493          	addi	s1,s1,-856 # d90 <thread1>
  f0:	e088                	sd	a0,0(s1)
    thread2 = thread_create(t2, NULL);
  f2:	4581                	li	a1,0
  f4:	00000517          	auipc	a0,0x0
  f8:	f6450513          	addi	a0,a0,-156 # 58 <t2>
  fc:	00001097          	auipc	ra,0x1
 100:	842080e7          	jalr	-1982(ra) # 93e <thread_create>
    thread_add_runqueue(thread2);
 104:	00001097          	auipc	ra,0x1
 108:	8e0080e7          	jalr	-1824(ra) # 9e4 <thread_add_runqueue>
    thread_add_runqueue(thread1);
 10c:	6088                	ld	a0,0(s1)
 10e:	00001097          	auipc	ra,0x1
 112:	8d6080e7          	jalr	-1834(ra) # 9e4 <thread_add_runqueue>
    thread_start_threading();
 116:	00001097          	auipc	ra,0x1
 11a:	bb4080e7          	jalr	-1100(ra) # cca <thread_start_threading>

    printf("\nexited\n");
 11e:	00001517          	auipc	a0,0x1
 122:	c4250513          	addi	a0,a0,-958 # d60 <thread_start_threading+0x96>
 126:	00000097          	auipc	ra,0x0
 12a:	600080e7          	jalr	1536(ra) # 726 <printf>
    exit(0);
 12e:	4501                	li	a0,0
 130:	00000097          	auipc	ra,0x0
 134:	27e080e7          	jalr	638(ra) # 3ae <exit>

0000000000000138 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 138:	1141                	addi	sp,sp,-16
 13a:	e422                	sd	s0,8(sp)
 13c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 13e:	87aa                	mv	a5,a0
 140:	0585                	addi	a1,a1,1
 142:	0785                	addi	a5,a5,1
 144:	fff5c703          	lbu	a4,-1(a1)
 148:	fee78fa3          	sb	a4,-1(a5)
 14c:	fb75                	bnez	a4,140 <strcpy+0x8>
    ;
  return os;
}
 14e:	6422                	ld	s0,8(sp)
 150:	0141                	addi	sp,sp,16
 152:	8082                	ret

0000000000000154 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 154:	1141                	addi	sp,sp,-16
 156:	e422                	sd	s0,8(sp)
 158:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 15a:	00054783          	lbu	a5,0(a0)
 15e:	cb91                	beqz	a5,172 <strcmp+0x1e>
 160:	0005c703          	lbu	a4,0(a1)
 164:	00f71763          	bne	a4,a5,172 <strcmp+0x1e>
    p++, q++;
 168:	0505                	addi	a0,a0,1
 16a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 16c:	00054783          	lbu	a5,0(a0)
 170:	fbe5                	bnez	a5,160 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 172:	0005c503          	lbu	a0,0(a1)
}
 176:	40a7853b          	subw	a0,a5,a0
 17a:	6422                	ld	s0,8(sp)
 17c:	0141                	addi	sp,sp,16
 17e:	8082                	ret

0000000000000180 <strlen>:

uint
strlen(const char *s)
{
 180:	1141                	addi	sp,sp,-16
 182:	e422                	sd	s0,8(sp)
 184:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 186:	00054783          	lbu	a5,0(a0)
 18a:	cf91                	beqz	a5,1a6 <strlen+0x26>
 18c:	0505                	addi	a0,a0,1
 18e:	87aa                	mv	a5,a0
 190:	4685                	li	a3,1
 192:	9e89                	subw	a3,a3,a0
 194:	00f6853b          	addw	a0,a3,a5
 198:	0785                	addi	a5,a5,1
 19a:	fff7c703          	lbu	a4,-1(a5)
 19e:	fb7d                	bnez	a4,194 <strlen+0x14>
    ;
  return n;
}
 1a0:	6422                	ld	s0,8(sp)
 1a2:	0141                	addi	sp,sp,16
 1a4:	8082                	ret
  for(n = 0; s[n]; n++)
 1a6:	4501                	li	a0,0
 1a8:	bfe5                	j	1a0 <strlen+0x20>

00000000000001aa <memset>:

void*
memset(void *dst, int c, uint n)
{
 1aa:	1141                	addi	sp,sp,-16
 1ac:	e422                	sd	s0,8(sp)
 1ae:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1b0:	ce09                	beqz	a2,1ca <memset+0x20>
 1b2:	87aa                	mv	a5,a0
 1b4:	fff6071b          	addiw	a4,a2,-1
 1b8:	1702                	slli	a4,a4,0x20
 1ba:	9301                	srli	a4,a4,0x20
 1bc:	0705                	addi	a4,a4,1
 1be:	972a                	add	a4,a4,a0
    cdst[i] = c;
 1c0:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 1c4:	0785                	addi	a5,a5,1
 1c6:	fee79de3          	bne	a5,a4,1c0 <memset+0x16>
  }
  return dst;
}
 1ca:	6422                	ld	s0,8(sp)
 1cc:	0141                	addi	sp,sp,16
 1ce:	8082                	ret

00000000000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	1141                	addi	sp,sp,-16
 1d2:	e422                	sd	s0,8(sp)
 1d4:	0800                	addi	s0,sp,16
  for(; *s; s++)
 1d6:	00054783          	lbu	a5,0(a0)
 1da:	cb99                	beqz	a5,1f0 <strchr+0x20>
    if(*s == c)
 1dc:	00f58763          	beq	a1,a5,1ea <strchr+0x1a>
  for(; *s; s++)
 1e0:	0505                	addi	a0,a0,1
 1e2:	00054783          	lbu	a5,0(a0)
 1e6:	fbfd                	bnez	a5,1dc <strchr+0xc>
      return (char*)s;
  return 0;
 1e8:	4501                	li	a0,0
}
 1ea:	6422                	ld	s0,8(sp)
 1ec:	0141                	addi	sp,sp,16
 1ee:	8082                	ret
  return 0;
 1f0:	4501                	li	a0,0
 1f2:	bfe5                	j	1ea <strchr+0x1a>

00000000000001f4 <gets>:

char*
gets(char *buf, int max)
{
 1f4:	711d                	addi	sp,sp,-96
 1f6:	ec86                	sd	ra,88(sp)
 1f8:	e8a2                	sd	s0,80(sp)
 1fa:	e4a6                	sd	s1,72(sp)
 1fc:	e0ca                	sd	s2,64(sp)
 1fe:	fc4e                	sd	s3,56(sp)
 200:	f852                	sd	s4,48(sp)
 202:	f456                	sd	s5,40(sp)
 204:	f05a                	sd	s6,32(sp)
 206:	ec5e                	sd	s7,24(sp)
 208:	1080                	addi	s0,sp,96
 20a:	8baa                	mv	s7,a0
 20c:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20e:	892a                	mv	s2,a0
 210:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 212:	4aa9                	li	s5,10
 214:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 216:	89a6                	mv	s3,s1
 218:	2485                	addiw	s1,s1,1
 21a:	0344d863          	bge	s1,s4,24a <gets+0x56>
    cc = read(0, &c, 1);
 21e:	4605                	li	a2,1
 220:	faf40593          	addi	a1,s0,-81
 224:	4501                	li	a0,0
 226:	00000097          	auipc	ra,0x0
 22a:	1a0080e7          	jalr	416(ra) # 3c6 <read>
    if(cc < 1)
 22e:	00a05e63          	blez	a0,24a <gets+0x56>
    buf[i++] = c;
 232:	faf44783          	lbu	a5,-81(s0)
 236:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 23a:	01578763          	beq	a5,s5,248 <gets+0x54>
 23e:	0905                	addi	s2,s2,1
 240:	fd679be3          	bne	a5,s6,216 <gets+0x22>
  for(i=0; i+1 < max; ){
 244:	89a6                	mv	s3,s1
 246:	a011                	j	24a <gets+0x56>
 248:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 24a:	99de                	add	s3,s3,s7
 24c:	00098023          	sb	zero,0(s3)
  return buf;
}
 250:	855e                	mv	a0,s7
 252:	60e6                	ld	ra,88(sp)
 254:	6446                	ld	s0,80(sp)
 256:	64a6                	ld	s1,72(sp)
 258:	6906                	ld	s2,64(sp)
 25a:	79e2                	ld	s3,56(sp)
 25c:	7a42                	ld	s4,48(sp)
 25e:	7aa2                	ld	s5,40(sp)
 260:	7b02                	ld	s6,32(sp)
 262:	6be2                	ld	s7,24(sp)
 264:	6125                	addi	sp,sp,96
 266:	8082                	ret

0000000000000268 <stat>:

int
stat(const char *n, struct stat *st)
{
 268:	1101                	addi	sp,sp,-32
 26a:	ec06                	sd	ra,24(sp)
 26c:	e822                	sd	s0,16(sp)
 26e:	e426                	sd	s1,8(sp)
 270:	e04a                	sd	s2,0(sp)
 272:	1000                	addi	s0,sp,32
 274:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 276:	4581                	li	a1,0
 278:	00000097          	auipc	ra,0x0
 27c:	176080e7          	jalr	374(ra) # 3ee <open>
  if(fd < 0)
 280:	02054563          	bltz	a0,2aa <stat+0x42>
 284:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 286:	85ca                	mv	a1,s2
 288:	00000097          	auipc	ra,0x0
 28c:	17e080e7          	jalr	382(ra) # 406 <fstat>
 290:	892a                	mv	s2,a0
  close(fd);
 292:	8526                	mv	a0,s1
 294:	00000097          	auipc	ra,0x0
 298:	142080e7          	jalr	322(ra) # 3d6 <close>
  return r;
}
 29c:	854a                	mv	a0,s2
 29e:	60e2                	ld	ra,24(sp)
 2a0:	6442                	ld	s0,16(sp)
 2a2:	64a2                	ld	s1,8(sp)
 2a4:	6902                	ld	s2,0(sp)
 2a6:	6105                	addi	sp,sp,32
 2a8:	8082                	ret
    return -1;
 2aa:	597d                	li	s2,-1
 2ac:	bfc5                	j	29c <stat+0x34>

00000000000002ae <atoi>:

int
atoi(const char *s)
{
 2ae:	1141                	addi	sp,sp,-16
 2b0:	e422                	sd	s0,8(sp)
 2b2:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b4:	00054603          	lbu	a2,0(a0)
 2b8:	fd06079b          	addiw	a5,a2,-48
 2bc:	0ff7f793          	andi	a5,a5,255
 2c0:	4725                	li	a4,9
 2c2:	02f76963          	bltu	a4,a5,2f4 <atoi+0x46>
 2c6:	86aa                	mv	a3,a0
  n = 0;
 2c8:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 2ca:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 2cc:	0685                	addi	a3,a3,1
 2ce:	0025179b          	slliw	a5,a0,0x2
 2d2:	9fa9                	addw	a5,a5,a0
 2d4:	0017979b          	slliw	a5,a5,0x1
 2d8:	9fb1                	addw	a5,a5,a2
 2da:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 2de:	0006c603          	lbu	a2,0(a3)
 2e2:	fd06071b          	addiw	a4,a2,-48
 2e6:	0ff77713          	andi	a4,a4,255
 2ea:	fee5f1e3          	bgeu	a1,a4,2cc <atoi+0x1e>
  return n;
}
 2ee:	6422                	ld	s0,8(sp)
 2f0:	0141                	addi	sp,sp,16
 2f2:	8082                	ret
  n = 0;
 2f4:	4501                	li	a0,0
 2f6:	bfe5                	j	2ee <atoi+0x40>

00000000000002f8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2f8:	1141                	addi	sp,sp,-16
 2fa:	e422                	sd	s0,8(sp)
 2fc:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2fe:	02b57663          	bgeu	a0,a1,32a <memmove+0x32>
    while(n-- > 0)
 302:	02c05163          	blez	a2,324 <memmove+0x2c>
 306:	fff6079b          	addiw	a5,a2,-1
 30a:	1782                	slli	a5,a5,0x20
 30c:	9381                	srli	a5,a5,0x20
 30e:	0785                	addi	a5,a5,1
 310:	97aa                	add	a5,a5,a0
  dst = vdst;
 312:	872a                	mv	a4,a0
      *dst++ = *src++;
 314:	0585                	addi	a1,a1,1
 316:	0705                	addi	a4,a4,1
 318:	fff5c683          	lbu	a3,-1(a1)
 31c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 320:	fee79ae3          	bne	a5,a4,314 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 324:	6422                	ld	s0,8(sp)
 326:	0141                	addi	sp,sp,16
 328:	8082                	ret
    dst += n;
 32a:	00c50733          	add	a4,a0,a2
    src += n;
 32e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 330:	fec05ae3          	blez	a2,324 <memmove+0x2c>
 334:	fff6079b          	addiw	a5,a2,-1
 338:	1782                	slli	a5,a5,0x20
 33a:	9381                	srli	a5,a5,0x20
 33c:	fff7c793          	not	a5,a5
 340:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 342:	15fd                	addi	a1,a1,-1
 344:	177d                	addi	a4,a4,-1
 346:	0005c683          	lbu	a3,0(a1)
 34a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 34e:	fee79ae3          	bne	a5,a4,342 <memmove+0x4a>
 352:	bfc9                	j	324 <memmove+0x2c>

0000000000000354 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 354:	1141                	addi	sp,sp,-16
 356:	e422                	sd	s0,8(sp)
 358:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 35a:	ca05                	beqz	a2,38a <memcmp+0x36>
 35c:	fff6069b          	addiw	a3,a2,-1
 360:	1682                	slli	a3,a3,0x20
 362:	9281                	srli	a3,a3,0x20
 364:	0685                	addi	a3,a3,1
 366:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 368:	00054783          	lbu	a5,0(a0)
 36c:	0005c703          	lbu	a4,0(a1)
 370:	00e79863          	bne	a5,a4,380 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 374:	0505                	addi	a0,a0,1
    p2++;
 376:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 378:	fed518e3          	bne	a0,a3,368 <memcmp+0x14>
  }
  return 0;
 37c:	4501                	li	a0,0
 37e:	a019                	j	384 <memcmp+0x30>
      return *p1 - *p2;
 380:	40e7853b          	subw	a0,a5,a4
}
 384:	6422                	ld	s0,8(sp)
 386:	0141                	addi	sp,sp,16
 388:	8082                	ret
  return 0;
 38a:	4501                	li	a0,0
 38c:	bfe5                	j	384 <memcmp+0x30>

000000000000038e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 38e:	1141                	addi	sp,sp,-16
 390:	e406                	sd	ra,8(sp)
 392:	e022                	sd	s0,0(sp)
 394:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 396:	00000097          	auipc	ra,0x0
 39a:	f62080e7          	jalr	-158(ra) # 2f8 <memmove>
}
 39e:	60a2                	ld	ra,8(sp)
 3a0:	6402                	ld	s0,0(sp)
 3a2:	0141                	addi	sp,sp,16
 3a4:	8082                	ret

00000000000003a6 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 3a6:	4885                	li	a7,1
 ecall
 3a8:	00000073          	ecall
 ret
 3ac:	8082                	ret

00000000000003ae <exit>:
.global exit
exit:
 li a7, SYS_exit
 3ae:	4889                	li	a7,2
 ecall
 3b0:	00000073          	ecall
 ret
 3b4:	8082                	ret

00000000000003b6 <wait>:
.global wait
wait:
 li a7, SYS_wait
 3b6:	488d                	li	a7,3
 ecall
 3b8:	00000073          	ecall
 ret
 3bc:	8082                	ret

00000000000003be <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3be:	4891                	li	a7,4
 ecall
 3c0:	00000073          	ecall
 ret
 3c4:	8082                	ret

00000000000003c6 <read>:
.global read
read:
 li a7, SYS_read
 3c6:	4895                	li	a7,5
 ecall
 3c8:	00000073          	ecall
 ret
 3cc:	8082                	ret

00000000000003ce <write>:
.global write
write:
 li a7, SYS_write
 3ce:	48c1                	li	a7,16
 ecall
 3d0:	00000073          	ecall
 ret
 3d4:	8082                	ret

00000000000003d6 <close>:
.global close
close:
 li a7, SYS_close
 3d6:	48d5                	li	a7,21
 ecall
 3d8:	00000073          	ecall
 ret
 3dc:	8082                	ret

00000000000003de <kill>:
.global kill
kill:
 li a7, SYS_kill
 3de:	4899                	li	a7,6
 ecall
 3e0:	00000073          	ecall
 ret
 3e4:	8082                	ret

00000000000003e6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 3e6:	489d                	li	a7,7
 ecall
 3e8:	00000073          	ecall
 ret
 3ec:	8082                	ret

00000000000003ee <open>:
.global open
open:
 li a7, SYS_open
 3ee:	48bd                	li	a7,15
 ecall
 3f0:	00000073          	ecall
 ret
 3f4:	8082                	ret

00000000000003f6 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 3f6:	48c5                	li	a7,17
 ecall
 3f8:	00000073          	ecall
 ret
 3fc:	8082                	ret

00000000000003fe <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 3fe:	48c9                	li	a7,18
 ecall
 400:	00000073          	ecall
 ret
 404:	8082                	ret

0000000000000406 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 406:	48a1                	li	a7,8
 ecall
 408:	00000073          	ecall
 ret
 40c:	8082                	ret

000000000000040e <link>:
.global link
link:
 li a7, SYS_link
 40e:	48cd                	li	a7,19
 ecall
 410:	00000073          	ecall
 ret
 414:	8082                	ret

0000000000000416 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 416:	48d1                	li	a7,20
 ecall
 418:	00000073          	ecall
 ret
 41c:	8082                	ret

000000000000041e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 41e:	48a5                	li	a7,9
 ecall
 420:	00000073          	ecall
 ret
 424:	8082                	ret

0000000000000426 <dup>:
.global dup
dup:
 li a7, SYS_dup
 426:	48a9                	li	a7,10
 ecall
 428:	00000073          	ecall
 ret
 42c:	8082                	ret

000000000000042e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 42e:	48ad                	li	a7,11
 ecall
 430:	00000073          	ecall
 ret
 434:	8082                	ret

0000000000000436 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 436:	48b1                	li	a7,12
 ecall
 438:	00000073          	ecall
 ret
 43c:	8082                	ret

000000000000043e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 43e:	48b5                	li	a7,13
 ecall
 440:	00000073          	ecall
 ret
 444:	8082                	ret

0000000000000446 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 446:	48b9                	li	a7,14
 ecall
 448:	00000073          	ecall
 ret
 44c:	8082                	ret

000000000000044e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 44e:	1101                	addi	sp,sp,-32
 450:	ec06                	sd	ra,24(sp)
 452:	e822                	sd	s0,16(sp)
 454:	1000                	addi	s0,sp,32
 456:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 45a:	4605                	li	a2,1
 45c:	fef40593          	addi	a1,s0,-17
 460:	00000097          	auipc	ra,0x0
 464:	f6e080e7          	jalr	-146(ra) # 3ce <write>
}
 468:	60e2                	ld	ra,24(sp)
 46a:	6442                	ld	s0,16(sp)
 46c:	6105                	addi	sp,sp,32
 46e:	8082                	ret

0000000000000470 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 470:	7139                	addi	sp,sp,-64
 472:	fc06                	sd	ra,56(sp)
 474:	f822                	sd	s0,48(sp)
 476:	f426                	sd	s1,40(sp)
 478:	f04a                	sd	s2,32(sp)
 47a:	ec4e                	sd	s3,24(sp)
 47c:	0080                	addi	s0,sp,64
 47e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 480:	c299                	beqz	a3,486 <printint+0x16>
 482:	0805c863          	bltz	a1,512 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 486:	2581                	sext.w	a1,a1
  neg = 0;
 488:	4881                	li	a7,0
 48a:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 48e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 490:	2601                	sext.w	a2,a2
 492:	00001517          	auipc	a0,0x1
 496:	8e650513          	addi	a0,a0,-1818 # d78 <digits>
 49a:	883a                	mv	a6,a4
 49c:	2705                	addiw	a4,a4,1
 49e:	02c5f7bb          	remuw	a5,a1,a2
 4a2:	1782                	slli	a5,a5,0x20
 4a4:	9381                	srli	a5,a5,0x20
 4a6:	97aa                	add	a5,a5,a0
 4a8:	0007c783          	lbu	a5,0(a5)
 4ac:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4b0:	0005879b          	sext.w	a5,a1
 4b4:	02c5d5bb          	divuw	a1,a1,a2
 4b8:	0685                	addi	a3,a3,1
 4ba:	fec7f0e3          	bgeu	a5,a2,49a <printint+0x2a>
  if(neg)
 4be:	00088b63          	beqz	a7,4d4 <printint+0x64>
    buf[i++] = '-';
 4c2:	fd040793          	addi	a5,s0,-48
 4c6:	973e                	add	a4,a4,a5
 4c8:	02d00793          	li	a5,45
 4cc:	fef70823          	sb	a5,-16(a4)
 4d0:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4d4:	02e05863          	blez	a4,504 <printint+0x94>
 4d8:	fc040793          	addi	a5,s0,-64
 4dc:	00e78933          	add	s2,a5,a4
 4e0:	fff78993          	addi	s3,a5,-1
 4e4:	99ba                	add	s3,s3,a4
 4e6:	377d                	addiw	a4,a4,-1
 4e8:	1702                	slli	a4,a4,0x20
 4ea:	9301                	srli	a4,a4,0x20
 4ec:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4f0:	fff94583          	lbu	a1,-1(s2)
 4f4:	8526                	mv	a0,s1
 4f6:	00000097          	auipc	ra,0x0
 4fa:	f58080e7          	jalr	-168(ra) # 44e <putc>
  while(--i >= 0)
 4fe:	197d                	addi	s2,s2,-1
 500:	ff3918e3          	bne	s2,s3,4f0 <printint+0x80>
}
 504:	70e2                	ld	ra,56(sp)
 506:	7442                	ld	s0,48(sp)
 508:	74a2                	ld	s1,40(sp)
 50a:	7902                	ld	s2,32(sp)
 50c:	69e2                	ld	s3,24(sp)
 50e:	6121                	addi	sp,sp,64
 510:	8082                	ret
    x = -xx;
 512:	40b005bb          	negw	a1,a1
    neg = 1;
 516:	4885                	li	a7,1
    x = -xx;
 518:	bf8d                	j	48a <printint+0x1a>

000000000000051a <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 51a:	7119                	addi	sp,sp,-128
 51c:	fc86                	sd	ra,120(sp)
 51e:	f8a2                	sd	s0,112(sp)
 520:	f4a6                	sd	s1,104(sp)
 522:	f0ca                	sd	s2,96(sp)
 524:	ecce                	sd	s3,88(sp)
 526:	e8d2                	sd	s4,80(sp)
 528:	e4d6                	sd	s5,72(sp)
 52a:	e0da                	sd	s6,64(sp)
 52c:	fc5e                	sd	s7,56(sp)
 52e:	f862                	sd	s8,48(sp)
 530:	f466                	sd	s9,40(sp)
 532:	f06a                	sd	s10,32(sp)
 534:	ec6e                	sd	s11,24(sp)
 536:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 538:	0005c903          	lbu	s2,0(a1)
 53c:	18090f63          	beqz	s2,6da <vprintf+0x1c0>
 540:	8aaa                	mv	s5,a0
 542:	8b32                	mv	s6,a2
 544:	00158493          	addi	s1,a1,1
  state = 0;
 548:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 54a:	02500a13          	li	s4,37
      if(c == 'd'){
 54e:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 552:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 556:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 55a:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 55e:	00001b97          	auipc	s7,0x1
 562:	81ab8b93          	addi	s7,s7,-2022 # d78 <digits>
 566:	a839                	j	584 <vprintf+0x6a>
        putc(fd, c);
 568:	85ca                	mv	a1,s2
 56a:	8556                	mv	a0,s5
 56c:	00000097          	auipc	ra,0x0
 570:	ee2080e7          	jalr	-286(ra) # 44e <putc>
 574:	a019                	j	57a <vprintf+0x60>
    } else if(state == '%'){
 576:	01498f63          	beq	s3,s4,594 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 57a:	0485                	addi	s1,s1,1
 57c:	fff4c903          	lbu	s2,-1(s1)
 580:	14090d63          	beqz	s2,6da <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 584:	0009079b          	sext.w	a5,s2
    if(state == 0){
 588:	fe0997e3          	bnez	s3,576 <vprintf+0x5c>
      if(c == '%'){
 58c:	fd479ee3          	bne	a5,s4,568 <vprintf+0x4e>
        state = '%';
 590:	89be                	mv	s3,a5
 592:	b7e5                	j	57a <vprintf+0x60>
      if(c == 'd'){
 594:	05878063          	beq	a5,s8,5d4 <vprintf+0xba>
      } else if(c == 'l') {
 598:	05978c63          	beq	a5,s9,5f0 <vprintf+0xd6>
      } else if(c == 'x') {
 59c:	07a78863          	beq	a5,s10,60c <vprintf+0xf2>
      } else if(c == 'p') {
 5a0:	09b78463          	beq	a5,s11,628 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 5a4:	07300713          	li	a4,115
 5a8:	0ce78663          	beq	a5,a4,674 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ac:	06300713          	li	a4,99
 5b0:	0ee78e63          	beq	a5,a4,6ac <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 5b4:	11478863          	beq	a5,s4,6c4 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5b8:	85d2                	mv	a1,s4
 5ba:	8556                	mv	a0,s5
 5bc:	00000097          	auipc	ra,0x0
 5c0:	e92080e7          	jalr	-366(ra) # 44e <putc>
        putc(fd, c);
 5c4:	85ca                	mv	a1,s2
 5c6:	8556                	mv	a0,s5
 5c8:	00000097          	auipc	ra,0x0
 5cc:	e86080e7          	jalr	-378(ra) # 44e <putc>
      }
      state = 0;
 5d0:	4981                	li	s3,0
 5d2:	b765                	j	57a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5d4:	008b0913          	addi	s2,s6,8
 5d8:	4685                	li	a3,1
 5da:	4629                	li	a2,10
 5dc:	000b2583          	lw	a1,0(s6)
 5e0:	8556                	mv	a0,s5
 5e2:	00000097          	auipc	ra,0x0
 5e6:	e8e080e7          	jalr	-370(ra) # 470 <printint>
 5ea:	8b4a                	mv	s6,s2
      state = 0;
 5ec:	4981                	li	s3,0
 5ee:	b771                	j	57a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5f0:	008b0913          	addi	s2,s6,8
 5f4:	4681                	li	a3,0
 5f6:	4629                	li	a2,10
 5f8:	000b2583          	lw	a1,0(s6)
 5fc:	8556                	mv	a0,s5
 5fe:	00000097          	auipc	ra,0x0
 602:	e72080e7          	jalr	-398(ra) # 470 <printint>
 606:	8b4a                	mv	s6,s2
      state = 0;
 608:	4981                	li	s3,0
 60a:	bf85                	j	57a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 60c:	008b0913          	addi	s2,s6,8
 610:	4681                	li	a3,0
 612:	4641                	li	a2,16
 614:	000b2583          	lw	a1,0(s6)
 618:	8556                	mv	a0,s5
 61a:	00000097          	auipc	ra,0x0
 61e:	e56080e7          	jalr	-426(ra) # 470 <printint>
 622:	8b4a                	mv	s6,s2
      state = 0;
 624:	4981                	li	s3,0
 626:	bf91                	j	57a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 628:	008b0793          	addi	a5,s6,8
 62c:	f8f43423          	sd	a5,-120(s0)
 630:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 634:	03000593          	li	a1,48
 638:	8556                	mv	a0,s5
 63a:	00000097          	auipc	ra,0x0
 63e:	e14080e7          	jalr	-492(ra) # 44e <putc>
  putc(fd, 'x');
 642:	85ea                	mv	a1,s10
 644:	8556                	mv	a0,s5
 646:	00000097          	auipc	ra,0x0
 64a:	e08080e7          	jalr	-504(ra) # 44e <putc>
 64e:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 650:	03c9d793          	srli	a5,s3,0x3c
 654:	97de                	add	a5,a5,s7
 656:	0007c583          	lbu	a1,0(a5)
 65a:	8556                	mv	a0,s5
 65c:	00000097          	auipc	ra,0x0
 660:	df2080e7          	jalr	-526(ra) # 44e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 664:	0992                	slli	s3,s3,0x4
 666:	397d                	addiw	s2,s2,-1
 668:	fe0914e3          	bnez	s2,650 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 66c:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 670:	4981                	li	s3,0
 672:	b721                	j	57a <vprintf+0x60>
        s = va_arg(ap, char*);
 674:	008b0993          	addi	s3,s6,8
 678:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 67c:	02090163          	beqz	s2,69e <vprintf+0x184>
        while(*s != 0){
 680:	00094583          	lbu	a1,0(s2)
 684:	c9a1                	beqz	a1,6d4 <vprintf+0x1ba>
          putc(fd, *s);
 686:	8556                	mv	a0,s5
 688:	00000097          	auipc	ra,0x0
 68c:	dc6080e7          	jalr	-570(ra) # 44e <putc>
          s++;
 690:	0905                	addi	s2,s2,1
        while(*s != 0){
 692:	00094583          	lbu	a1,0(s2)
 696:	f9e5                	bnez	a1,686 <vprintf+0x16c>
        s = va_arg(ap, char*);
 698:	8b4e                	mv	s6,s3
      state = 0;
 69a:	4981                	li	s3,0
 69c:	bdf9                	j	57a <vprintf+0x60>
          s = "(null)";
 69e:	00000917          	auipc	s2,0x0
 6a2:	6d290913          	addi	s2,s2,1746 # d70 <thread_start_threading+0xa6>
        while(*s != 0){
 6a6:	02800593          	li	a1,40
 6aa:	bff1                	j	686 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 6ac:	008b0913          	addi	s2,s6,8
 6b0:	000b4583          	lbu	a1,0(s6)
 6b4:	8556                	mv	a0,s5
 6b6:	00000097          	auipc	ra,0x0
 6ba:	d98080e7          	jalr	-616(ra) # 44e <putc>
 6be:	8b4a                	mv	s6,s2
      state = 0;
 6c0:	4981                	li	s3,0
 6c2:	bd65                	j	57a <vprintf+0x60>
        putc(fd, c);
 6c4:	85d2                	mv	a1,s4
 6c6:	8556                	mv	a0,s5
 6c8:	00000097          	auipc	ra,0x0
 6cc:	d86080e7          	jalr	-634(ra) # 44e <putc>
      state = 0;
 6d0:	4981                	li	s3,0
 6d2:	b565                	j	57a <vprintf+0x60>
        s = va_arg(ap, char*);
 6d4:	8b4e                	mv	s6,s3
      state = 0;
 6d6:	4981                	li	s3,0
 6d8:	b54d                	j	57a <vprintf+0x60>
    }
  }
}
 6da:	70e6                	ld	ra,120(sp)
 6dc:	7446                	ld	s0,112(sp)
 6de:	74a6                	ld	s1,104(sp)
 6e0:	7906                	ld	s2,96(sp)
 6e2:	69e6                	ld	s3,88(sp)
 6e4:	6a46                	ld	s4,80(sp)
 6e6:	6aa6                	ld	s5,72(sp)
 6e8:	6b06                	ld	s6,64(sp)
 6ea:	7be2                	ld	s7,56(sp)
 6ec:	7c42                	ld	s8,48(sp)
 6ee:	7ca2                	ld	s9,40(sp)
 6f0:	7d02                	ld	s10,32(sp)
 6f2:	6de2                	ld	s11,24(sp)
 6f4:	6109                	addi	sp,sp,128
 6f6:	8082                	ret

00000000000006f8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6f8:	715d                	addi	sp,sp,-80
 6fa:	ec06                	sd	ra,24(sp)
 6fc:	e822                	sd	s0,16(sp)
 6fe:	1000                	addi	s0,sp,32
 700:	e010                	sd	a2,0(s0)
 702:	e414                	sd	a3,8(s0)
 704:	e818                	sd	a4,16(s0)
 706:	ec1c                	sd	a5,24(s0)
 708:	03043023          	sd	a6,32(s0)
 70c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 710:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 714:	8622                	mv	a2,s0
 716:	00000097          	auipc	ra,0x0
 71a:	e04080e7          	jalr	-508(ra) # 51a <vprintf>
}
 71e:	60e2                	ld	ra,24(sp)
 720:	6442                	ld	s0,16(sp)
 722:	6161                	addi	sp,sp,80
 724:	8082                	ret

0000000000000726 <printf>:

void
printf(const char *fmt, ...)
{
 726:	711d                	addi	sp,sp,-96
 728:	ec06                	sd	ra,24(sp)
 72a:	e822                	sd	s0,16(sp)
 72c:	1000                	addi	s0,sp,32
 72e:	e40c                	sd	a1,8(s0)
 730:	e810                	sd	a2,16(s0)
 732:	ec14                	sd	a3,24(s0)
 734:	f018                	sd	a4,32(s0)
 736:	f41c                	sd	a5,40(s0)
 738:	03043823          	sd	a6,48(s0)
 73c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 740:	00840613          	addi	a2,s0,8
 744:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 748:	85aa                	mv	a1,a0
 74a:	4505                	li	a0,1
 74c:	00000097          	auipc	ra,0x0
 750:	dce080e7          	jalr	-562(ra) # 51a <vprintf>
}
 754:	60e2                	ld	ra,24(sp)
 756:	6442                	ld	s0,16(sp)
 758:	6125                	addi	sp,sp,96
 75a:	8082                	ret

000000000000075c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 75c:	1141                	addi	sp,sp,-16
 75e:	e422                	sd	s0,8(sp)
 760:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 762:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 766:	00000797          	auipc	a5,0x0
 76a:	6327b783          	ld	a5,1586(a5) # d98 <freep>
 76e:	a805                	j	79e <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 770:	4618                	lw	a4,8(a2)
 772:	9db9                	addw	a1,a1,a4
 774:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 778:	6398                	ld	a4,0(a5)
 77a:	6318                	ld	a4,0(a4)
 77c:	fee53823          	sd	a4,-16(a0)
 780:	a091                	j	7c4 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 782:	ff852703          	lw	a4,-8(a0)
 786:	9e39                	addw	a2,a2,a4
 788:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 78a:	ff053703          	ld	a4,-16(a0)
 78e:	e398                	sd	a4,0(a5)
 790:	a099                	j	7d6 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 792:	6398                	ld	a4,0(a5)
 794:	00e7e463          	bltu	a5,a4,79c <free+0x40>
 798:	00e6ea63          	bltu	a3,a4,7ac <free+0x50>
{
 79c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79e:	fed7fae3          	bgeu	a5,a3,792 <free+0x36>
 7a2:	6398                	ld	a4,0(a5)
 7a4:	00e6e463          	bltu	a3,a4,7ac <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a8:	fee7eae3          	bltu	a5,a4,79c <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 7ac:	ff852583          	lw	a1,-8(a0)
 7b0:	6390                	ld	a2,0(a5)
 7b2:	02059713          	slli	a4,a1,0x20
 7b6:	9301                	srli	a4,a4,0x20
 7b8:	0712                	slli	a4,a4,0x4
 7ba:	9736                	add	a4,a4,a3
 7bc:	fae60ae3          	beq	a2,a4,770 <free+0x14>
    bp->s.ptr = p->s.ptr;
 7c0:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7c4:	4790                	lw	a2,8(a5)
 7c6:	02061713          	slli	a4,a2,0x20
 7ca:	9301                	srli	a4,a4,0x20
 7cc:	0712                	slli	a4,a4,0x4
 7ce:	973e                	add	a4,a4,a5
 7d0:	fae689e3          	beq	a3,a4,782 <free+0x26>
  } else
    p->s.ptr = bp;
 7d4:	e394                	sd	a3,0(a5)
  freep = p;
 7d6:	00000717          	auipc	a4,0x0
 7da:	5cf73123          	sd	a5,1474(a4) # d98 <freep>
}
 7de:	6422                	ld	s0,8(sp)
 7e0:	0141                	addi	sp,sp,16
 7e2:	8082                	ret

00000000000007e4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7e4:	7139                	addi	sp,sp,-64
 7e6:	fc06                	sd	ra,56(sp)
 7e8:	f822                	sd	s0,48(sp)
 7ea:	f426                	sd	s1,40(sp)
 7ec:	f04a                	sd	s2,32(sp)
 7ee:	ec4e                	sd	s3,24(sp)
 7f0:	e852                	sd	s4,16(sp)
 7f2:	e456                	sd	s5,8(sp)
 7f4:	e05a                	sd	s6,0(sp)
 7f6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f8:	02051493          	slli	s1,a0,0x20
 7fc:	9081                	srli	s1,s1,0x20
 7fe:	04bd                	addi	s1,s1,15
 800:	8091                	srli	s1,s1,0x4
 802:	0014899b          	addiw	s3,s1,1
 806:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 808:	00000517          	auipc	a0,0x0
 80c:	59053503          	ld	a0,1424(a0) # d98 <freep>
 810:	c515                	beqz	a0,83c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 812:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 814:	4798                	lw	a4,8(a5)
 816:	02977f63          	bgeu	a4,s1,854 <malloc+0x70>
 81a:	8a4e                	mv	s4,s3
 81c:	0009871b          	sext.w	a4,s3
 820:	6685                	lui	a3,0x1
 822:	00d77363          	bgeu	a4,a3,828 <malloc+0x44>
 826:	6a05                	lui	s4,0x1
 828:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 82c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 830:	00000917          	auipc	s2,0x0
 834:	56890913          	addi	s2,s2,1384 # d98 <freep>
  if(p == (char*)-1)
 838:	5afd                	li	s5,-1
 83a:	a88d                	j	8ac <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 83c:	00000797          	auipc	a5,0x0
 840:	56c78793          	addi	a5,a5,1388 # da8 <base>
 844:	00000717          	auipc	a4,0x0
 848:	54f73a23          	sd	a5,1364(a4) # d98 <freep>
 84c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 84e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 852:	b7e1                	j	81a <malloc+0x36>
      if(p->s.size == nunits)
 854:	02e48b63          	beq	s1,a4,88a <malloc+0xa6>
        p->s.size -= nunits;
 858:	4137073b          	subw	a4,a4,s3
 85c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 85e:	1702                	slli	a4,a4,0x20
 860:	9301                	srli	a4,a4,0x20
 862:	0712                	slli	a4,a4,0x4
 864:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 866:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 86a:	00000717          	auipc	a4,0x0
 86e:	52a73723          	sd	a0,1326(a4) # d98 <freep>
      return (void*)(p + 1);
 872:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 876:	70e2                	ld	ra,56(sp)
 878:	7442                	ld	s0,48(sp)
 87a:	74a2                	ld	s1,40(sp)
 87c:	7902                	ld	s2,32(sp)
 87e:	69e2                	ld	s3,24(sp)
 880:	6a42                	ld	s4,16(sp)
 882:	6aa2                	ld	s5,8(sp)
 884:	6b02                	ld	s6,0(sp)
 886:	6121                	addi	sp,sp,64
 888:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 88a:	6398                	ld	a4,0(a5)
 88c:	e118                	sd	a4,0(a0)
 88e:	bff1                	j	86a <malloc+0x86>
  hp->s.size = nu;
 890:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 894:	0541                	addi	a0,a0,16
 896:	00000097          	auipc	ra,0x0
 89a:	ec6080e7          	jalr	-314(ra) # 75c <free>
  return freep;
 89e:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8a2:	d971                	beqz	a0,876 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8a6:	4798                	lw	a4,8(a5)
 8a8:	fa9776e3          	bgeu	a4,s1,854 <malloc+0x70>
    if(p == freep)
 8ac:	00093703          	ld	a4,0(s2)
 8b0:	853e                	mv	a0,a5
 8b2:	fef719e3          	bne	a4,a5,8a4 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8b6:	8552                	mv	a0,s4
 8b8:	00000097          	auipc	ra,0x0
 8bc:	b7e080e7          	jalr	-1154(ra) # 436 <sbrk>
  if(p == (char*)-1)
 8c0:	fd5518e3          	bne	a0,s5,890 <malloc+0xac>
        return 0;
 8c4:	4501                	li	a0,0
 8c6:	bf45                	j	876 <malloc+0x92>

00000000000008c8 <setjmp>:
 8c8:	e100                	sd	s0,0(a0)
 8ca:	e504                	sd	s1,8(a0)
 8cc:	01253823          	sd	s2,16(a0)
 8d0:	01353c23          	sd	s3,24(a0)
 8d4:	03453023          	sd	s4,32(a0)
 8d8:	03553423          	sd	s5,40(a0)
 8dc:	03653823          	sd	s6,48(a0)
 8e0:	03753c23          	sd	s7,56(a0)
 8e4:	05853023          	sd	s8,64(a0)
 8e8:	05953423          	sd	s9,72(a0)
 8ec:	05a53823          	sd	s10,80(a0)
 8f0:	05b53c23          	sd	s11,88(a0)
 8f4:	06153023          	sd	ra,96(a0)
 8f8:	06253423          	sd	sp,104(a0)
 8fc:	4501                	li	a0,0
 8fe:	8082                	ret

0000000000000900 <longjmp>:
 900:	6100                	ld	s0,0(a0)
 902:	6504                	ld	s1,8(a0)
 904:	01053903          	ld	s2,16(a0)
 908:	01853983          	ld	s3,24(a0)
 90c:	02053a03          	ld	s4,32(a0)
 910:	02853a83          	ld	s5,40(a0)
 914:	03053b03          	ld	s6,48(a0)
 918:	03853b83          	ld	s7,56(a0)
 91c:	04053c03          	ld	s8,64(a0)
 920:	04853c83          	ld	s9,72(a0)
 924:	05053d03          	ld	s10,80(a0)
 928:	05853d83          	ld	s11,88(a0)
 92c:	06053083          	ld	ra,96(a0)
 930:	06853103          	ld	sp,104(a0)
 934:	c199                	beqz	a1,93a <longjmp_1>
 936:	852e                	mv	a0,a1
 938:	8082                	ret

000000000000093a <longjmp_1>:
 93a:	4505                	li	a0,1
 93c:	8082                	ret

000000000000093e <thread_create>:

static struct thread* current_thread = NULL;
static int id = 1;
static jmp_buf env_st;

struct thread *thread_create(void (*f)(void *), void *arg){
 93e:	7179                	addi	sp,sp,-48
 940:	f406                	sd	ra,40(sp)
 942:	f022                	sd	s0,32(sp)
 944:	ec26                	sd	s1,24(sp)
 946:	e84a                	sd	s2,16(sp)
 948:	e44e                	sd	s3,8(sp)
 94a:	1800                	addi	s0,sp,48
 94c:	89aa                	mv	s3,a0
 94e:	892e                	mv	s2,a1
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
 950:	0c000513          	li	a0,192
 954:	00000097          	auipc	ra,0x0
 958:	e90080e7          	jalr	-368(ra) # 7e4 <malloc>
 95c:	84aa                	mv	s1,a0
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
 95e:	6505                	lui	a0,0x1
 960:	80050513          	addi	a0,a0,-2048 # 800 <malloc+0x1c>
 964:	00000097          	auipc	ra,0x0
 968:	e80080e7          	jalr	-384(ra) # 7e4 <malloc>
    new_stack_p = new_stack + 0x100*8-0x2*8;
    t->fp = f;
 96c:	0134b023          	sd	s3,0(s1)
    t->arg = arg;
 970:	0124b423          	sd	s2,8(s1)
    t->buf_set = 0;
 974:	0804a823          	sw	zero,144(s1)
    t->ID  = id;
 978:	00000717          	auipc	a4,0x0
 97c:	41470713          	addi	a4,a4,1044 # d8c <id>
 980:	431c                	lw	a5,0(a4)
 982:	08f4aa23          	sw	a5,148(s1)
    t->stack = (void*) new_stack;
 986:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack + 0x100*8-0x2*8;
 988:	7f050513          	addi	a0,a0,2032
    t->stack_p = (void*) new_stack_p;
 98c:	ec88                	sd	a0,24(s1)
    t->executed = 0;
 98e:	0804ac23          	sw	zero,152(s1)

    t->tasks = NULL;
 992:	0a04b823          	sd	zero,176(s1)
    // t->task_buf_set = 0;
    id++;
 996:	2785                	addiw	a5,a5,1
 998:	c31c                	sw	a5,0(a4)
    return t;
}
 99a:	8526                	mv	a0,s1
 99c:	70a2                	ld	ra,40(sp)
 99e:	7402                	ld	s0,32(sp)
 9a0:	64e2                	ld	s1,24(sp)
 9a2:	6942                	ld	s2,16(sp)
 9a4:	69a2                	ld	s3,8(sp)
 9a6:	6145                	addi	sp,sp,48
 9a8:	8082                	ret

00000000000009aa <task_create>:
struct task *task_create(void (*f)(void *), void *arg){
 9aa:	1101                	addi	sp,sp,-32
 9ac:	ec06                	sd	ra,24(sp)
 9ae:	e822                	sd	s0,16(sp)
 9b0:	e426                	sd	s1,8(sp)
 9b2:	e04a                	sd	s2,0(sp)
 9b4:	1000                	addi	s0,sp,32
 9b6:	892a                	mv	s2,a0
 9b8:	84ae                	mv	s1,a1
    struct task *t = (struct task*) malloc(sizeof(struct task));
 9ba:	09000513          	li	a0,144
 9be:	00000097          	auipc	ra,0x0
 9c2:	e26080e7          	jalr	-474(ra) # 7e4 <malloc>
    t->fp = f;
 9c6:	01253023          	sd	s2,0(a0)
    t->arg = arg;
 9ca:	e504                	sd	s1,8(a0)
    t->buf_set = 0;
 9cc:	08052023          	sw	zero,128(a0)
    t->executed = 0;
 9d0:	08052223          	sw	zero,132(a0)
    t->previous = NULL;
 9d4:	08053423          	sd	zero,136(a0)
    return t;
}
 9d8:	60e2                	ld	ra,24(sp)
 9da:	6442                	ld	s0,16(sp)
 9dc:	64a2                	ld	s1,8(sp)
 9de:	6902                	ld	s2,0(sp)
 9e0:	6105                	addi	sp,sp,32
 9e2:	8082                	ret

00000000000009e4 <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
 9e4:	1141                	addi	sp,sp,-16
 9e6:	e422                	sd	s0,8(sp)
 9e8:	0800                	addi	s0,sp,16
    if(current_thread == NULL){
 9ea:	00000797          	auipc	a5,0x0
 9ee:	3b67b783          	ld	a5,950(a5) # da0 <current_thread>
 9f2:	cb89                	beqz	a5,a04 <thread_add_runqueue+0x20>
        current_thread = t;
        current_thread->next = current_thread;
        current_thread->previous = current_thread;
    }
    else{
        struct thread *prevoius_thread = current_thread->previous;
 9f4:	73d8                	ld	a4,160(a5)
        t->next = current_thread;
 9f6:	f55c                	sd	a5,168(a0)
        t->previous = prevoius_thread;
 9f8:	f158                	sd	a4,160(a0)
        prevoius_thread->next = t;
 9fa:	f748                	sd	a0,168(a4)
        current_thread->previous = t;
 9fc:	f3c8                	sd	a0,160(a5)
    }
}
 9fe:	6422                	ld	s0,8(sp)
 a00:	0141                	addi	sp,sp,16
 a02:	8082                	ret
        current_thread = t;
 a04:	00000797          	auipc	a5,0x0
 a08:	38a7be23          	sd	a0,924(a5) # da0 <current_thread>
        current_thread->next = current_thread;
 a0c:	f548                	sd	a0,168(a0)
        current_thread->previous = current_thread;
 a0e:	f148                	sd	a0,160(a0)
 a10:	b7fd                	j	9fe <thread_add_runqueue+0x1a>

0000000000000a12 <schedule>:
    else
    {
        longjmp(current_thread->env, 1);
    }
}
void schedule(void){
 a12:	1141                	addi	sp,sp,-16
 a14:	e422                	sd	s0,8(sp)
 a16:	0800                	addi	s0,sp,16
    current_thread = current_thread->next;
 a18:	00000797          	auipc	a5,0x0
 a1c:	38878793          	addi	a5,a5,904 # da0 <current_thread>
 a20:	6398                	ld	a4,0(a5)
 a22:	7758                	ld	a4,168(a4)
 a24:	e398                	sd	a4,0(a5)
}
 a26:	6422                	ld	s0,8(sp)
 a28:	0141                	addi	sp,sp,16
 a2a:	8082                	ret

0000000000000a2c <push>:

// part 2
void thread_assign_task(struct thread *t, void (*f)(void *), void *arg){
    push(t, f, arg);
}
void push(struct thread *t, void (*f)(void *), void *arg){
 a2c:	1101                	addi	sp,sp,-32
 a2e:	ec06                	sd	ra,24(sp)
 a30:	e822                	sd	s0,16(sp)
 a32:	e426                	sd	s1,8(sp)
 a34:	1000                	addi	s0,sp,32
 a36:	84aa                	mv	s1,a0
 a38:	852e                	mv	a0,a1
    struct task *tmp = task_create(f, arg);
 a3a:	85b2                	mv	a1,a2
 a3c:	00000097          	auipc	ra,0x0
 a40:	f6e080e7          	jalr	-146(ra) # 9aa <task_create>
    if (t->tasks) {
 a44:	78dc                	ld	a5,176(s1)
 a46:	cb81                	beqz	a5,a56 <push+0x2a>
        tmp->previous = t->tasks;
 a48:	e55c                	sd	a5,136(a0)
        t->tasks = tmp;
 a4a:	f8c8                	sd	a0,176(s1)
    }
    else{
        t->tasks = tmp;
        t->current_task = tmp;
    }
}
 a4c:	60e2                	ld	ra,24(sp)
 a4e:	6442                	ld	s0,16(sp)
 a50:	64a2                	ld	s1,8(sp)
 a52:	6105                	addi	sp,sp,32
 a54:	8082                	ret
        t->tasks = tmp;
 a56:	f8c8                	sd	a0,176(s1)
        t->current_task = tmp;
 a58:	fcc8                	sd	a0,184(s1)
}
 a5a:	bfcd                	j	a4c <push+0x20>

0000000000000a5c <thread_assign_task>:
void thread_assign_task(struct thread *t, void (*f)(void *), void *arg){
 a5c:	1141                	addi	sp,sp,-16
 a5e:	e406                	sd	ra,8(sp)
 a60:	e022                	sd	s0,0(sp)
 a62:	0800                	addi	s0,sp,16
    push(t, f, arg);
 a64:	00000097          	auipc	ra,0x0
 a68:	fc8080e7          	jalr	-56(ra) # a2c <push>
}
 a6c:	60a2                	ld	ra,8(sp)
 a6e:	6402                	ld	s0,0(sp)
 a70:	0141                	addi	sp,sp,16
 a72:	8082                	ret

0000000000000a74 <pop>:
void pop(){
 a74:	1101                	addi	sp,sp,-32
 a76:	ec06                	sd	ra,24(sp)
 a78:	e822                	sd	s0,16(sp)
 a7a:	e426                	sd	s1,8(sp)
 a7c:	1000                	addi	s0,sp,32
    struct task *tmp = current_thread->tasks;
 a7e:	00000497          	auipc	s1,0x0
 a82:	32248493          	addi	s1,s1,802 # da0 <current_thread>
 a86:	609c                	ld	a5,0(s1)
    free(tmp);
 a88:	7bc8                	ld	a0,176(a5)
 a8a:	00000097          	auipc	ra,0x0
 a8e:	cd2080e7          	jalr	-814(ra) # 75c <free>
    current_thread->tasks = current_thread->tasks->previous;
 a92:	609c                	ld	a5,0(s1)
 a94:	7bd8                	ld	a4,176(a5)
 a96:	6758                	ld	a4,136(a4)
 a98:	fbd8                	sd	a4,176(a5)
    current_thread->current_task = current_thread->tasks;
 a9a:	ffd8                	sd	a4,184(a5)
 a9c:	60e2                	ld	ra,24(sp)
 a9e:	6442                	ld	s0,16(sp)
 aa0:	64a2                	ld	s1,8(sp)
 aa2:	6105                	addi	sp,sp,32
 aa4:	8082                	ret

0000000000000aa6 <dispatch>:
void dispatch(void){
 aa6:	1141                	addi	sp,sp,-16
 aa8:	e406                	sd	ra,8(sp)
 aaa:	e022                	sd	s0,0(sp)
 aac:	0800                	addi	s0,sp,16
    if (!current_thread->buf_set) // if the jmp_buf has been set
 aae:	00000517          	auipc	a0,0x0
 ab2:	2f253503          	ld	a0,754(a0) # da0 <current_thread>
 ab6:	09052783          	lw	a5,144(a0)
 aba:	eb99                	bnez	a5,ad0 <dispatch+0x2a>
        current_thread->buf_set = 1; // set the jmp_buf
 abc:	4785                	li	a5,1
 abe:	08f52823          	sw	a5,144(a0)
        if (setjmp(current_thread->env) == 0)
 ac2:	02050513          	addi	a0,a0,32
 ac6:	00000097          	auipc	ra,0x0
 aca:	e02080e7          	jalr	-510(ra) # 8c8 <setjmp>
 ace:	c541                	beqz	a0,b56 <dispatch+0xb0>
    if (current_thread->tasks && !current_thread->tasks->buf_set)
 ad0:	00000517          	auipc	a0,0x0
 ad4:	2d053503          	ld	a0,720(a0) # da0 <current_thread>
 ad8:	795c                	ld	a5,176(a0)
 ada:	cbc5                	beqz	a5,b8a <dispatch+0xe4>
 adc:	0807a703          	lw	a4,128(a5)
 ae0:	e721                	bnez	a4,b28 <dispatch+0x82>
        current_thread->tasks->buf_set = 1;
 ae2:	4705                	li	a4,1
 ae4:	08e7a023          	sw	a4,128(a5)
        if (setjmp(current_thread->tasks->env) == 0)
 ae8:	7948                	ld	a0,176(a0)
 aea:	0541                	addi	a0,a0,16
 aec:	00000097          	auipc	ra,0x0
 af0:	ddc080e7          	jalr	-548(ra) # 8c8 <setjmp>
 af4:	e11d                	bnez	a0,b1a <dispatch+0x74>
            if (current_thread->current_task->executed)
 af6:	00000797          	auipc	a5,0x0
 afa:	2aa7b783          	ld	a5,682(a5) # da0 <current_thread>
 afe:	7fd8                	ld	a4,184(a5)
 b00:	08472683          	lw	a3,132(a4)
 b04:	c6bd                	beqz	a3,b72 <dispatch+0xcc>
                current_thread->tasks->env->sp = (unsigned long)current_thread->current_task->env->sp;
 b06:	7bd4                	ld	a3,176(a5)
 b08:	7f38                	ld	a4,120(a4)
 b0a:	feb8                	sd	a4,120(a3)
            longjmp(current_thread->tasks->env, 1);
 b0c:	7bc8                	ld	a0,176(a5)
 b0e:	4585                	li	a1,1
 b10:	0541                	addi	a0,a0,16
 b12:	00000097          	auipc	ra,0x0
 b16:	dee080e7          	jalr	-530(ra) # 900 <longjmp>
        current_thread->current_task = current_thread->tasks;
 b1a:	00000517          	auipc	a0,0x0
 b1e:	28653503          	ld	a0,646(a0) # da0 <current_thread>
 b22:	795c                	ld	a5,176(a0)
 b24:	fd5c                	sd	a5,184(a0)
    if (current_thread->tasks && current_thread->current_task->buf_set)
 b26:	c3b5                	beqz	a5,b8a <dispatch+0xe4>
 b28:	7d5c                	ld	a5,184(a0)
 b2a:	0807a703          	lw	a4,128(a5)
 b2e:	cf31                	beqz	a4,b8a <dispatch+0xe4>
        if (!current_thread->current_task->executed)
 b30:	0847a703          	lw	a4,132(a5)
 b34:	e339                	bnez	a4,b7a <dispatch+0xd4>
            current_thread->current_task->executed = 1;
 b36:	4705                	li	a4,1
 b38:	08e7a223          	sw	a4,132(a5)
            current_thread->current_task->fp(current_thread->current_task->arg); // task function
 b3c:	7d5c                	ld	a5,184(a0)
 b3e:	6398                	ld	a4,0(a5)
 b40:	6788                	ld	a0,8(a5)
 b42:	9702                	jalr	a4
            pop();
 b44:	00000097          	auipc	ra,0x0
 b48:	f30080e7          	jalr	-208(ra) # a74 <pop>
            dispatch();
 b4c:	00000097          	auipc	ra,0x0
 b50:	f5a080e7          	jalr	-166(ra) # aa6 <dispatch>
 b54:	a8a9                	j	bae <dispatch+0x108>
            current_thread->env->sp = (unsigned long)current_thread->stack_p; // set the stack pointer
 b56:	00000517          	auipc	a0,0x0
 b5a:	24a53503          	ld	a0,586(a0) # da0 <current_thread>
 b5e:	6d1c                	ld	a5,24(a0)
 b60:	e55c                	sd	a5,136(a0)
            longjmp(current_thread->env, 1);
 b62:	4585                	li	a1,1
 b64:	02050513          	addi	a0,a0,32
 b68:	00000097          	auipc	ra,0x0
 b6c:	d98080e7          	jalr	-616(ra) # 900 <longjmp>
 b70:	b785                	j	ad0 <dispatch+0x2a>
                current_thread->tasks->env->sp = (unsigned long)current_thread->env->sp;
 b72:	7bd8                	ld	a4,176(a5)
 b74:	67d4                	ld	a3,136(a5)
 b76:	ff34                	sd	a3,120(a4)
 b78:	bf51                	j	b0c <dispatch+0x66>
            longjmp(current_thread->current_task->env, 1);
 b7a:	4585                	li	a1,1
 b7c:	01078513          	addi	a0,a5,16
 b80:	00000097          	auipc	ra,0x0
 b84:	d80080e7          	jalr	-640(ra) # 900 <longjmp>
 b88:	a01d                	j	bae <dispatch+0x108>
    else if (!current_thread->executed)
 b8a:	09852783          	lw	a5,152(a0)
 b8e:	e785                	bnez	a5,bb6 <dispatch+0x110>
        current_thread->executed = 1;
 b90:	4785                	li	a5,1
 b92:	08f52c23          	sw	a5,152(a0)
        current_thread->env->ra = (unsigned long)thread_exit;
 b96:	00000797          	auipc	a5,0x0
 b9a:	0b478793          	addi	a5,a5,180 # c4a <thread_exit>
 b9e:	e15c                	sd	a5,128(a0)
        current_thread->fp(current_thread->arg); // thread function
 ba0:	611c                	ld	a5,0(a0)
 ba2:	6508                	ld	a0,8(a0)
 ba4:	9782                	jalr	a5
        thread_exit();
 ba6:	00000097          	auipc	ra,0x0
 baa:	0a4080e7          	jalr	164(ra) # c4a <thread_exit>
}
 bae:	60a2                	ld	ra,8(sp)
 bb0:	6402                	ld	s0,0(sp)
 bb2:	0141                	addi	sp,sp,16
 bb4:	8082                	ret
        longjmp(current_thread->env, 1);
 bb6:	4585                	li	a1,1
 bb8:	02050513          	addi	a0,a0,32
 bbc:	00000097          	auipc	ra,0x0
 bc0:	d44080e7          	jalr	-700(ra) # 900 <longjmp>
}
 bc4:	b7ed                	j	bae <dispatch+0x108>

0000000000000bc6 <thread_yield>:
void thread_yield(void){
 bc6:	1141                	addi	sp,sp,-16
 bc8:	e406                	sd	ra,8(sp)
 bca:	e022                	sd	s0,0(sp)
 bcc:	0800                	addi	s0,sp,16
    if (current_thread->tasks)
 bce:	00000517          	auipc	a0,0x0
 bd2:	1d253503          	ld	a0,466(a0) # da0 <current_thread>
 bd6:	795c                	ld	a5,176(a0)
 bd8:	cba9                	beqz	a5,c2a <thread_yield+0x64>
        if (current_thread->current_task->executed)
 bda:	7d5c                	ld	a5,184(a0)
 bdc:	0847a703          	lw	a4,132(a5)
 be0:	c70d                	beqz	a4,c0a <thread_yield+0x44>
            if (setjmp(current_thread->current_task->env) == 0)
 be2:	01078513          	addi	a0,a5,16
 be6:	00000097          	auipc	ra,0x0
 bea:	ce2080e7          	jalr	-798(ra) # 8c8 <setjmp>
 bee:	c509                	beqz	a0,bf8 <thread_yield+0x32>
}
 bf0:	60a2                	ld	ra,8(sp)
 bf2:	6402                	ld	s0,0(sp)
 bf4:	0141                	addi	sp,sp,16
 bf6:	8082                	ret
                schedule();
 bf8:	00000097          	auipc	ra,0x0
 bfc:	e1a080e7          	jalr	-486(ra) # a12 <schedule>
                dispatch();
 c00:	00000097          	auipc	ra,0x0
 c04:	ea6080e7          	jalr	-346(ra) # aa6 <dispatch>
 c08:	b7e5                	j	bf0 <thread_yield+0x2a>
            if (setjmp(current_thread->env) == 0)
 c0a:	02050513          	addi	a0,a0,32
 c0e:	00000097          	auipc	ra,0x0
 c12:	cba080e7          	jalr	-838(ra) # 8c8 <setjmp>
 c16:	fd69                	bnez	a0,bf0 <thread_yield+0x2a>
                schedule();
 c18:	00000097          	auipc	ra,0x0
 c1c:	dfa080e7          	jalr	-518(ra) # a12 <schedule>
                dispatch();
 c20:	00000097          	auipc	ra,0x0
 c24:	e86080e7          	jalr	-378(ra) # aa6 <dispatch>
 c28:	b7e1                	j	bf0 <thread_yield+0x2a>
        if (setjmp(current_thread->env) == 0)
 c2a:	02050513          	addi	a0,a0,32
 c2e:	00000097          	auipc	ra,0x0
 c32:	c9a080e7          	jalr	-870(ra) # 8c8 <setjmp>
 c36:	fd4d                	bnez	a0,bf0 <thread_yield+0x2a>
            schedule();
 c38:	00000097          	auipc	ra,0x0
 c3c:	dda080e7          	jalr	-550(ra) # a12 <schedule>
            dispatch();
 c40:	00000097          	auipc	ra,0x0
 c44:	e66080e7          	jalr	-410(ra) # aa6 <dispatch>
}
 c48:	b765                	j	bf0 <thread_yield+0x2a>

0000000000000c4a <thread_exit>:
void thread_exit(void){
 c4a:	1101                	addi	sp,sp,-32
 c4c:	ec06                	sd	ra,24(sp)
 c4e:	e822                	sd	s0,16(sp)
 c50:	e426                	sd	s1,8(sp)
 c52:	1000                	addi	s0,sp,32
    if(current_thread->next != current_thread){
 c54:	00000497          	auipc	s1,0x0
 c58:	14c4b483          	ld	s1,332(s1) # da0 <current_thread>
 c5c:	74dc                	ld	a5,168(s1)
 c5e:	02f48c63          	beq	s1,a5,c96 <thread_exit+0x4c>
        struct thread *prevoius_thread = current_thread->previous;
 c62:	70d8                	ld	a4,160(s1)
        prevoius_thread->next = next_thread;
 c64:	f75c                	sd	a5,168(a4)
        next_thread->previous = prevoius_thread;
 c66:	f3d8                	sd	a4,160(a5)
        current_thread = next_thread;
 c68:	00000717          	auipc	a4,0x0
 c6c:	12f73c23          	sd	a5,312(a4) # da0 <current_thread>
        free(tmp->stack);
 c70:	6888                	ld	a0,16(s1)
 c72:	00000097          	auipc	ra,0x0
 c76:	aea080e7          	jalr	-1302(ra) # 75c <free>
        free(tmp);
 c7a:	8526                	mv	a0,s1
 c7c:	00000097          	auipc	ra,0x0
 c80:	ae0080e7          	jalr	-1312(ra) # 75c <free>
        dispatch();
 c84:	00000097          	auipc	ra,0x0
 c88:	e22080e7          	jalr	-478(ra) # aa6 <dispatch>
}
 c8c:	60e2                	ld	ra,24(sp)
 c8e:	6442                	ld	s0,16(sp)
 c90:	64a2                	ld	s1,8(sp)
 c92:	6105                	addi	sp,sp,32
 c94:	8082                	ret
        free(current_thread->stack);
 c96:	6888                	ld	a0,16(s1)
 c98:	00000097          	auipc	ra,0x0
 c9c:	ac4080e7          	jalr	-1340(ra) # 75c <free>
        free(current_thread);
 ca0:	00000497          	auipc	s1,0x0
 ca4:	10048493          	addi	s1,s1,256 # da0 <current_thread>
 ca8:	6088                	ld	a0,0(s1)
 caa:	00000097          	auipc	ra,0x0
 cae:	ab2080e7          	jalr	-1358(ra) # 75c <free>
        current_thread = NULL;
 cb2:	0004b023          	sd	zero,0(s1)
        longjmp(env_st, 1);
 cb6:	4585                	li	a1,1
 cb8:	00000517          	auipc	a0,0x0
 cbc:	10050513          	addi	a0,a0,256 # db8 <env_st>
 cc0:	00000097          	auipc	ra,0x0
 cc4:	c40080e7          	jalr	-960(ra) # 900 <longjmp>
}
 cc8:	b7d1                	j	c8c <thread_exit+0x42>

0000000000000cca <thread_start_threading>:
void thread_start_threading(void){
 cca:	1141                	addi	sp,sp,-16
 ccc:	e406                	sd	ra,8(sp)
 cce:	e022                	sd	s0,0(sp)
 cd0:	0800                	addi	s0,sp,16
    if (setjmp(env_st) == 0){
 cd2:	00000517          	auipc	a0,0x0
 cd6:	0e650513          	addi	a0,a0,230 # db8 <env_st>
 cda:	00000097          	auipc	ra,0x0
 cde:	bee080e7          	jalr	-1042(ra) # 8c8 <setjmp>
 ce2:	c509                	beqz	a0,cec <thread_start_threading+0x22>
}
 ce4:	60a2                	ld	ra,8(sp)
 ce6:	6402                	ld	s0,0(sp)
 ce8:	0141                	addi	sp,sp,16
 cea:	8082                	ret
        dispatch();
 cec:	00000097          	auipc	ra,0x0
 cf0:	dba080e7          	jalr	-582(ra) # aa6 <dispatch>
}
 cf4:	bfc5                	j	ce4 <thread_start_threading+0x1a>
