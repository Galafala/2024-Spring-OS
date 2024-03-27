
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	a5013103          	ld	sp,-1456(sp) # 80008a50 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1e2060ef          	jal	ra,800061f8 <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec06                	sd	ra,24(sp)
    80000020:	e822                	sd	s0,16(sp)
    80000022:	e426                	sd	s1,8(sp)
    80000024:	e04a                	sd	s2,0(sp)
    80000026:	1000                	addi	s0,sp,32
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    80000028:	03451793          	slli	a5,a0,0x34
    8000002c:	ebb9                	bnez	a5,80000082 <kfree+0x66>
    8000002e:	84aa                	mv	s1,a0
    80000030:	00026797          	auipc	a5,0x26
    80000034:	21078793          	addi	a5,a5,528 # 80026240 <end>
    80000038:	04f56563          	bltu	a0,a5,80000082 <kfree+0x66>
    8000003c:	47c5                	li	a5,17
    8000003e:	07ee                	slli	a5,a5,0x1b
    80000040:	04f57163          	bgeu	a0,a5,80000082 <kfree+0x66>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    80000044:	6605                	lui	a2,0x1
    80000046:	4585                	li	a1,1
    80000048:	00000097          	auipc	ra,0x0
    8000004c:	130080e7          	jalr	304(ra) # 80000178 <memset>

  r = (struct run*)pa;

  acquire(&kmem.lock);
    80000050:	00009917          	auipc	s2,0x9
    80000054:	ff090913          	addi	s2,s2,-16 # 80009040 <kmem>
    80000058:	854a                	mv	a0,s2
    8000005a:	00007097          	auipc	ra,0x7
    8000005e:	b98080e7          	jalr	-1128(ra) # 80006bf2 <acquire>
  r->next = kmem.freelist;
    80000062:	01893783          	ld	a5,24(s2)
    80000066:	e09c                	sd	a5,0(s1)
  kmem.freelist = r;
    80000068:	00993c23          	sd	s1,24(s2)
  release(&kmem.lock);
    8000006c:	854a                	mv	a0,s2
    8000006e:	00007097          	auipc	ra,0x7
    80000072:	c38080e7          	jalr	-968(ra) # 80006ca6 <release>
}
    80000076:	60e2                	ld	ra,24(sp)
    80000078:	6442                	ld	s0,16(sp)
    8000007a:	64a2                	ld	s1,8(sp)
    8000007c:	6902                	ld	s2,0(sp)
    8000007e:	6105                	addi	sp,sp,32
    80000080:	8082                	ret
    panic("kfree");
    80000082:	00008517          	auipc	a0,0x8
    80000086:	f8e50513          	addi	a0,a0,-114 # 80008010 <etext+0x10>
    8000008a:	00006097          	auipc	ra,0x6
    8000008e:	61e080e7          	jalr	1566(ra) # 800066a8 <panic>

0000000080000092 <freerange>:
{
    80000092:	7179                	addi	sp,sp,-48
    80000094:	f406                	sd	ra,40(sp)
    80000096:	f022                	sd	s0,32(sp)
    80000098:	ec26                	sd	s1,24(sp)
    8000009a:	e84a                	sd	s2,16(sp)
    8000009c:	e44e                	sd	s3,8(sp)
    8000009e:	e052                	sd	s4,0(sp)
    800000a0:	1800                	addi	s0,sp,48
  p = (char*)PGROUNDUP((uint64)pa_start);
    800000a2:	6785                	lui	a5,0x1
    800000a4:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800000a8:	94aa                	add	s1,s1,a0
    800000aa:	757d                	lui	a0,0xfffff
    800000ac:	8ce9                	and	s1,s1,a0
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    800000ae:	94be                	add	s1,s1,a5
    800000b0:	0095ee63          	bltu	a1,s1,800000cc <freerange+0x3a>
    800000b4:	892e                	mv	s2,a1
    kfree(p);
    800000b6:	7a7d                	lui	s4,0xfffff
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    800000b8:	6985                	lui	s3,0x1
    kfree(p);
    800000ba:	01448533          	add	a0,s1,s4
    800000be:	00000097          	auipc	ra,0x0
    800000c2:	f5e080e7          	jalr	-162(ra) # 8000001c <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    800000c6:	94ce                	add	s1,s1,s3
    800000c8:	fe9979e3          	bgeu	s2,s1,800000ba <freerange+0x28>
}
    800000cc:	70a2                	ld	ra,40(sp)
    800000ce:	7402                	ld	s0,32(sp)
    800000d0:	64e2                	ld	s1,24(sp)
    800000d2:	6942                	ld	s2,16(sp)
    800000d4:	69a2                	ld	s3,8(sp)
    800000d6:	6a02                	ld	s4,0(sp)
    800000d8:	6145                	addi	sp,sp,48
    800000da:	8082                	ret

00000000800000dc <kinit>:
{
    800000dc:	1141                	addi	sp,sp,-16
    800000de:	e406                	sd	ra,8(sp)
    800000e0:	e022                	sd	s0,0(sp)
    800000e2:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    800000e4:	00008597          	auipc	a1,0x8
    800000e8:	f3458593          	addi	a1,a1,-204 # 80008018 <etext+0x18>
    800000ec:	00009517          	auipc	a0,0x9
    800000f0:	f5450513          	addi	a0,a0,-172 # 80009040 <kmem>
    800000f4:	00007097          	auipc	ra,0x7
    800000f8:	a6e080e7          	jalr	-1426(ra) # 80006b62 <initlock>
  freerange(end, (void*)PHYSTOP);
    800000fc:	45c5                	li	a1,17
    800000fe:	05ee                	slli	a1,a1,0x1b
    80000100:	00026517          	auipc	a0,0x26
    80000104:	14050513          	addi	a0,a0,320 # 80026240 <end>
    80000108:	00000097          	auipc	ra,0x0
    8000010c:	f8a080e7          	jalr	-118(ra) # 80000092 <freerange>
}
    80000110:	60a2                	ld	ra,8(sp)
    80000112:	6402                	ld	s0,0(sp)
    80000114:	0141                	addi	sp,sp,16
    80000116:	8082                	ret

0000000080000118 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    80000118:	1101                	addi	sp,sp,-32
    8000011a:	ec06                	sd	ra,24(sp)
    8000011c:	e822                	sd	s0,16(sp)
    8000011e:	e426                	sd	s1,8(sp)
    80000120:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80000122:	00009497          	auipc	s1,0x9
    80000126:	f1e48493          	addi	s1,s1,-226 # 80009040 <kmem>
    8000012a:	8526                	mv	a0,s1
    8000012c:	00007097          	auipc	ra,0x7
    80000130:	ac6080e7          	jalr	-1338(ra) # 80006bf2 <acquire>
  r = kmem.freelist;
    80000134:	6c84                	ld	s1,24(s1)
  if(r)
    80000136:	c885                	beqz	s1,80000166 <kalloc+0x4e>
    kmem.freelist = r->next;
    80000138:	609c                	ld	a5,0(s1)
    8000013a:	00009517          	auipc	a0,0x9
    8000013e:	f0650513          	addi	a0,a0,-250 # 80009040 <kmem>
    80000142:	ed1c                	sd	a5,24(a0)
  release(&kmem.lock);
    80000144:	00007097          	auipc	ra,0x7
    80000148:	b62080e7          	jalr	-1182(ra) # 80006ca6 <release>

  if(r)
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000014c:	6605                	lui	a2,0x1
    8000014e:	4595                	li	a1,5
    80000150:	8526                	mv	a0,s1
    80000152:	00000097          	auipc	ra,0x0
    80000156:	026080e7          	jalr	38(ra) # 80000178 <memset>
  return (void*)r;
}
    8000015a:	8526                	mv	a0,s1
    8000015c:	60e2                	ld	ra,24(sp)
    8000015e:	6442                	ld	s0,16(sp)
    80000160:	64a2                	ld	s1,8(sp)
    80000162:	6105                	addi	sp,sp,32
    80000164:	8082                	ret
  release(&kmem.lock);
    80000166:	00009517          	auipc	a0,0x9
    8000016a:	eda50513          	addi	a0,a0,-294 # 80009040 <kmem>
    8000016e:	00007097          	auipc	ra,0x7
    80000172:	b38080e7          	jalr	-1224(ra) # 80006ca6 <release>
  if(r)
    80000176:	b7d5                	j	8000015a <kalloc+0x42>

0000000080000178 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80000178:	1141                	addi	sp,sp,-16
    8000017a:	e422                	sd	s0,8(sp)
    8000017c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    8000017e:	ce09                	beqz	a2,80000198 <memset+0x20>
    80000180:	87aa                	mv	a5,a0
    80000182:	fff6071b          	addiw	a4,a2,-1
    80000186:	1702                	slli	a4,a4,0x20
    80000188:	9301                	srli	a4,a4,0x20
    8000018a:	0705                	addi	a4,a4,1
    8000018c:	972a                	add	a4,a4,a0
    cdst[i] = c;
    8000018e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    80000192:	0785                	addi	a5,a5,1
    80000194:	fee79de3          	bne	a5,a4,8000018e <memset+0x16>
  }
  return dst;
}
    80000198:	6422                	ld	s0,8(sp)
    8000019a:	0141                	addi	sp,sp,16
    8000019c:	8082                	ret

000000008000019e <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    8000019e:	1141                	addi	sp,sp,-16
    800001a0:	e422                	sd	s0,8(sp)
    800001a2:	0800                	addi	s0,sp,16
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    800001a4:	ca05                	beqz	a2,800001d4 <memcmp+0x36>
    800001a6:	fff6069b          	addiw	a3,a2,-1
    800001aa:	1682                	slli	a3,a3,0x20
    800001ac:	9281                	srli	a3,a3,0x20
    800001ae:	0685                	addi	a3,a3,1
    800001b0:	96aa                	add	a3,a3,a0
    if(*s1 != *s2)
    800001b2:	00054783          	lbu	a5,0(a0)
    800001b6:	0005c703          	lbu	a4,0(a1)
    800001ba:	00e79863          	bne	a5,a4,800001ca <memcmp+0x2c>
      return *s1 - *s2;
    s1++, s2++;
    800001be:	0505                	addi	a0,a0,1
    800001c0:	0585                	addi	a1,a1,1
  while(n-- > 0){
    800001c2:	fed518e3          	bne	a0,a3,800001b2 <memcmp+0x14>
  }

  return 0;
    800001c6:	4501                	li	a0,0
    800001c8:	a019                	j	800001ce <memcmp+0x30>
      return *s1 - *s2;
    800001ca:	40e7853b          	subw	a0,a5,a4
}
    800001ce:	6422                	ld	s0,8(sp)
    800001d0:	0141                	addi	sp,sp,16
    800001d2:	8082                	ret
  return 0;
    800001d4:	4501                	li	a0,0
    800001d6:	bfe5                	j	800001ce <memcmp+0x30>

00000000800001d8 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    800001d8:	1141                	addi	sp,sp,-16
    800001da:	e422                	sd	s0,8(sp)
    800001dc:	0800                	addi	s0,sp,16
  const char *s;
  char *d;

  if(n == 0)
    800001de:	ca0d                	beqz	a2,80000210 <memmove+0x38>
    return dst;
  
  s = src;
  d = dst;
  if(s < d && s + n > d){
    800001e0:	00a5f963          	bgeu	a1,a0,800001f2 <memmove+0x1a>
    800001e4:	02061693          	slli	a3,a2,0x20
    800001e8:	9281                	srli	a3,a3,0x20
    800001ea:	00d58733          	add	a4,a1,a3
    800001ee:	02e56463          	bltu	a0,a4,80000216 <memmove+0x3e>
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
    800001f2:	fff6079b          	addiw	a5,a2,-1
    800001f6:	1782                	slli	a5,a5,0x20
    800001f8:	9381                	srli	a5,a5,0x20
    800001fa:	0785                	addi	a5,a5,1
    800001fc:	97ae                	add	a5,a5,a1
    800001fe:	872a                	mv	a4,a0
      *d++ = *s++;
    80000200:	0585                	addi	a1,a1,1
    80000202:	0705                	addi	a4,a4,1
    80000204:	fff5c683          	lbu	a3,-1(a1)
    80000208:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
    8000020c:	fef59ae3          	bne	a1,a5,80000200 <memmove+0x28>

  return dst;
}
    80000210:	6422                	ld	s0,8(sp)
    80000212:	0141                	addi	sp,sp,16
    80000214:	8082                	ret
    d += n;
    80000216:	96aa                	add	a3,a3,a0
    while(n-- > 0)
    80000218:	fff6079b          	addiw	a5,a2,-1
    8000021c:	1782                	slli	a5,a5,0x20
    8000021e:	9381                	srli	a5,a5,0x20
    80000220:	fff7c793          	not	a5,a5
    80000224:	97ba                	add	a5,a5,a4
      *--d = *--s;
    80000226:	177d                	addi	a4,a4,-1
    80000228:	16fd                	addi	a3,a3,-1
    8000022a:	00074603          	lbu	a2,0(a4)
    8000022e:	00c68023          	sb	a2,0(a3)
    while(n-- > 0)
    80000232:	fef71ae3          	bne	a4,a5,80000226 <memmove+0x4e>
    80000236:	bfe9                	j	80000210 <memmove+0x38>

0000000080000238 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80000238:	1141                	addi	sp,sp,-16
    8000023a:	e406                	sd	ra,8(sp)
    8000023c:	e022                	sd	s0,0(sp)
    8000023e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    80000240:	00000097          	auipc	ra,0x0
    80000244:	f98080e7          	jalr	-104(ra) # 800001d8 <memmove>
}
    80000248:	60a2                	ld	ra,8(sp)
    8000024a:	6402                	ld	s0,0(sp)
    8000024c:	0141                	addi	sp,sp,16
    8000024e:	8082                	ret

0000000080000250 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    80000250:	1141                	addi	sp,sp,-16
    80000252:	e422                	sd	s0,8(sp)
    80000254:	0800                	addi	s0,sp,16
  while(n > 0 && *p && *p == *q)
    80000256:	ce11                	beqz	a2,80000272 <strncmp+0x22>
    80000258:	00054783          	lbu	a5,0(a0)
    8000025c:	cf89                	beqz	a5,80000276 <strncmp+0x26>
    8000025e:	0005c703          	lbu	a4,0(a1)
    80000262:	00f71a63          	bne	a4,a5,80000276 <strncmp+0x26>
    n--, p++, q++;
    80000266:	367d                	addiw	a2,a2,-1
    80000268:	0505                	addi	a0,a0,1
    8000026a:	0585                	addi	a1,a1,1
  while(n > 0 && *p && *p == *q)
    8000026c:	f675                	bnez	a2,80000258 <strncmp+0x8>
  if(n == 0)
    return 0;
    8000026e:	4501                	li	a0,0
    80000270:	a809                	j	80000282 <strncmp+0x32>
    80000272:	4501                	li	a0,0
    80000274:	a039                	j	80000282 <strncmp+0x32>
  if(n == 0)
    80000276:	ca09                	beqz	a2,80000288 <strncmp+0x38>
  return (uchar)*p - (uchar)*q;
    80000278:	00054503          	lbu	a0,0(a0)
    8000027c:	0005c783          	lbu	a5,0(a1)
    80000280:	9d1d                	subw	a0,a0,a5
}
    80000282:	6422                	ld	s0,8(sp)
    80000284:	0141                	addi	sp,sp,16
    80000286:	8082                	ret
    return 0;
    80000288:	4501                	li	a0,0
    8000028a:	bfe5                	j	80000282 <strncmp+0x32>

000000008000028c <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    8000028c:	1141                	addi	sp,sp,-16
    8000028e:	e422                	sd	s0,8(sp)
    80000290:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    80000292:	872a                	mv	a4,a0
    80000294:	8832                	mv	a6,a2
    80000296:	367d                	addiw	a2,a2,-1
    80000298:	01005963          	blez	a6,800002aa <strncpy+0x1e>
    8000029c:	0705                	addi	a4,a4,1
    8000029e:	0005c783          	lbu	a5,0(a1)
    800002a2:	fef70fa3          	sb	a5,-1(a4)
    800002a6:	0585                	addi	a1,a1,1
    800002a8:	f7f5                	bnez	a5,80000294 <strncpy+0x8>
    ;
  while(n-- > 0)
    800002aa:	00c05d63          	blez	a2,800002c4 <strncpy+0x38>
    800002ae:	86ba                	mv	a3,a4
    *s++ = 0;
    800002b0:	0685                	addi	a3,a3,1
    800002b2:	fe068fa3          	sb	zero,-1(a3)
  while(n-- > 0)
    800002b6:	fff6c793          	not	a5,a3
    800002ba:	9fb9                	addw	a5,a5,a4
    800002bc:	010787bb          	addw	a5,a5,a6
    800002c0:	fef048e3          	bgtz	a5,800002b0 <strncpy+0x24>
  return os;
}
    800002c4:	6422                	ld	s0,8(sp)
    800002c6:	0141                	addi	sp,sp,16
    800002c8:	8082                	ret

00000000800002ca <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    800002ca:	1141                	addi	sp,sp,-16
    800002cc:	e422                	sd	s0,8(sp)
    800002ce:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  if(n <= 0)
    800002d0:	02c05363          	blez	a2,800002f6 <safestrcpy+0x2c>
    800002d4:	fff6069b          	addiw	a3,a2,-1
    800002d8:	1682                	slli	a3,a3,0x20
    800002da:	9281                	srli	a3,a3,0x20
    800002dc:	96ae                	add	a3,a3,a1
    800002de:	87aa                	mv	a5,a0
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
    800002e0:	00d58963          	beq	a1,a3,800002f2 <safestrcpy+0x28>
    800002e4:	0585                	addi	a1,a1,1
    800002e6:	0785                	addi	a5,a5,1
    800002e8:	fff5c703          	lbu	a4,-1(a1)
    800002ec:	fee78fa3          	sb	a4,-1(a5)
    800002f0:	fb65                	bnez	a4,800002e0 <safestrcpy+0x16>
    ;
  *s = 0;
    800002f2:	00078023          	sb	zero,0(a5)
  return os;
}
    800002f6:	6422                	ld	s0,8(sp)
    800002f8:	0141                	addi	sp,sp,16
    800002fa:	8082                	ret

00000000800002fc <strlen>:

int
strlen(const char *s)
{
    800002fc:	1141                	addi	sp,sp,-16
    800002fe:	e422                	sd	s0,8(sp)
    80000300:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    80000302:	00054783          	lbu	a5,0(a0)
    80000306:	cf91                	beqz	a5,80000322 <strlen+0x26>
    80000308:	0505                	addi	a0,a0,1
    8000030a:	87aa                	mv	a5,a0
    8000030c:	4685                	li	a3,1
    8000030e:	9e89                	subw	a3,a3,a0
    80000310:	00f6853b          	addw	a0,a3,a5
    80000314:	0785                	addi	a5,a5,1
    80000316:	fff7c703          	lbu	a4,-1(a5)
    8000031a:	fb7d                	bnez	a4,80000310 <strlen+0x14>
    ;
  return n;
}
    8000031c:	6422                	ld	s0,8(sp)
    8000031e:	0141                	addi	sp,sp,16
    80000320:	8082                	ret
  for(n = 0; s[n]; n++)
    80000322:	4501                	li	a0,0
    80000324:	bfe5                	j	8000031c <strlen+0x20>

0000000080000326 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    80000326:	1141                	addi	sp,sp,-16
    80000328:	e406                	sd	ra,8(sp)
    8000032a:	e022                	sd	s0,0(sp)
    8000032c:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    8000032e:	00001097          	auipc	ra,0x1
    80000332:	112080e7          	jalr	274(ra) # 80001440 <cpuid>
    virtio_disk_init(); // emulated hard disk
    userinit();      // first user process
    __sync_synchronize();
    started = 1;
  } else {
    while(started == 0)
    80000336:	00009717          	auipc	a4,0x9
    8000033a:	cca70713          	addi	a4,a4,-822 # 80009000 <started>
  if(cpuid() == 0){
    8000033e:	c139                	beqz	a0,80000384 <main+0x5e>
    while(started == 0)
    80000340:	431c                	lw	a5,0(a4)
    80000342:	2781                	sext.w	a5,a5
    80000344:	dff5                	beqz	a5,80000340 <main+0x1a>
      ;
    __sync_synchronize();
    80000346:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    8000034a:	00001097          	auipc	ra,0x1
    8000034e:	0f6080e7          	jalr	246(ra) # 80001440 <cpuid>
    80000352:	85aa                	mv	a1,a0
    80000354:	00008517          	auipc	a0,0x8
    80000358:	ce450513          	addi	a0,a0,-796 # 80008038 <etext+0x38>
    8000035c:	00006097          	auipc	ra,0x6
    80000360:	396080e7          	jalr	918(ra) # 800066f2 <printf>
    kvminithart();    // turn on paging
    80000364:	00000097          	auipc	ra,0x0
    80000368:	0d8080e7          	jalr	216(ra) # 8000043c <kvminithart>
    trapinithart();   // install kernel trap vector
    8000036c:	00002097          	auipc	ra,0x2
    80000370:	d4c080e7          	jalr	-692(ra) # 800020b8 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80000374:	00005097          	auipc	ra,0x5
    80000378:	4fc080e7          	jalr	1276(ra) # 80005870 <plicinithart>
  }

  scheduler();
    8000037c:	00001097          	auipc	ra,0x1
    80000380:	5fa080e7          	jalr	1530(ra) # 80001976 <scheduler>
    consoleinit();
    80000384:	00006097          	auipc	ra,0x6
    80000388:	236080e7          	jalr	566(ra) # 800065ba <consoleinit>
    printfinit();
    8000038c:	00006097          	auipc	ra,0x6
    80000390:	54c080e7          	jalr	1356(ra) # 800068d8 <printfinit>
    printf("\n");
    80000394:	00008517          	auipc	a0,0x8
    80000398:	cb450513          	addi	a0,a0,-844 # 80008048 <etext+0x48>
    8000039c:	00006097          	auipc	ra,0x6
    800003a0:	356080e7          	jalr	854(ra) # 800066f2 <printf>
    printf("xv6 kernel is booting\n");
    800003a4:	00008517          	auipc	a0,0x8
    800003a8:	c7c50513          	addi	a0,a0,-900 # 80008020 <etext+0x20>
    800003ac:	00006097          	auipc	ra,0x6
    800003b0:	346080e7          	jalr	838(ra) # 800066f2 <printf>
    printf("\n");
    800003b4:	00008517          	auipc	a0,0x8
    800003b8:	c9450513          	addi	a0,a0,-876 # 80008048 <etext+0x48>
    800003bc:	00006097          	auipc	ra,0x6
    800003c0:	336080e7          	jalr	822(ra) # 800066f2 <printf>
    kinit();         // physical page allocator
    800003c4:	00000097          	auipc	ra,0x0
    800003c8:	d18080e7          	jalr	-744(ra) # 800000dc <kinit>
    kvminit();       // create kernel page table
    800003cc:	00000097          	auipc	ra,0x0
    800003d0:	348080e7          	jalr	840(ra) # 80000714 <kvminit>
    kvminithart();   // turn on paging
    800003d4:	00000097          	auipc	ra,0x0
    800003d8:	068080e7          	jalr	104(ra) # 8000043c <kvminithart>
    procinit();      // process table
    800003dc:	00001097          	auipc	ra,0x1
    800003e0:	fb6080e7          	jalr	-74(ra) # 80001392 <procinit>
    trapinit();      // trap vectors
    800003e4:	00002097          	auipc	ra,0x2
    800003e8:	cac080e7          	jalr	-852(ra) # 80002090 <trapinit>
    trapinithart();  // install kernel trap vector
    800003ec:	00002097          	auipc	ra,0x2
    800003f0:	ccc080e7          	jalr	-820(ra) # 800020b8 <trapinithart>
    plicinit();      // set up interrupt controller
    800003f4:	00005097          	auipc	ra,0x5
    800003f8:	466080e7          	jalr	1126(ra) # 8000585a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    800003fc:	00005097          	auipc	ra,0x5
    80000400:	474080e7          	jalr	1140(ra) # 80005870 <plicinithart>
    binit();         // buffer cache
    80000404:	00002097          	auipc	ra,0x2
    80000408:	4f4080e7          	jalr	1268(ra) # 800028f8 <binit>
    iinit();         // inode table
    8000040c:	00003097          	auipc	ra,0x3
    80000410:	b74080e7          	jalr	-1164(ra) # 80002f80 <iinit>
    fileinit();      // file table
    80000414:	00004097          	auipc	ra,0x4
    80000418:	c94080e7          	jalr	-876(ra) # 800040a8 <fileinit>
    virtio_disk_init(); // emulated hard disk
    8000041c:	00005097          	auipc	ra,0x5
    80000420:	576080e7          	jalr	1398(ra) # 80005992 <virtio_disk_init>
    userinit();      // first user process
    80000424:	00001097          	auipc	ra,0x1
    80000428:	320080e7          	jalr	800(ra) # 80001744 <userinit>
    __sync_synchronize();
    8000042c:	0ff0000f          	fence
    started = 1;
    80000430:	4785                	li	a5,1
    80000432:	00009717          	auipc	a4,0x9
    80000436:	bcf72723          	sw	a5,-1074(a4) # 80009000 <started>
    8000043a:	b789                	j	8000037c <main+0x56>

000000008000043c <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    8000043c:	1141                	addi	sp,sp,-16
    8000043e:	e422                	sd	s0,8(sp)
    80000440:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80000442:	00009797          	auipc	a5,0x9
    80000446:	bc67b783          	ld	a5,-1082(a5) # 80009008 <kernel_pagetable>
    8000044a:	83b1                	srli	a5,a5,0xc
    8000044c:	577d                	li	a4,-1
    8000044e:	177e                	slli	a4,a4,0x3f
    80000450:	8fd9                	or	a5,a5,a4
// supervisor address translation and protection;
// holds the address of the page table.
static inline void
w_satp(uint64 x)
{
  asm volatile("csrw satp, %0" : : "r" (x));
    80000452:	18079073          	csrw	satp,a5
// flush the TLB.
static inline void
sfence_vma()
{
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80000456:	12000073          	sfence.vma
  sfence_vma();
}
    8000045a:	6422                	ld	s0,8(sp)
    8000045c:	0141                	addi	sp,sp,16
    8000045e:	8082                	ret

0000000080000460 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80000460:	7139                	addi	sp,sp,-64
    80000462:	fc06                	sd	ra,56(sp)
    80000464:	f822                	sd	s0,48(sp)
    80000466:	f426                	sd	s1,40(sp)
    80000468:	f04a                	sd	s2,32(sp)
    8000046a:	ec4e                	sd	s3,24(sp)
    8000046c:	e852                	sd	s4,16(sp)
    8000046e:	e456                	sd	s5,8(sp)
    80000470:	e05a                	sd	s6,0(sp)
    80000472:	0080                	addi	s0,sp,64
    80000474:	84aa                	mv	s1,a0
    80000476:	89ae                	mv	s3,a1
    80000478:	8ab2                	mv	s5,a2
  if(va >= MAXVA)
    8000047a:	57fd                	li	a5,-1
    8000047c:	83e9                	srli	a5,a5,0x1a
    8000047e:	4a79                	li	s4,30
    panic("walk");

  for(int level = 2; level > 0; level--) {
    80000480:	4b31                	li	s6,12
  if(va >= MAXVA)
    80000482:	04b7f263          	bgeu	a5,a1,800004c6 <walk+0x66>
    panic("walk");
    80000486:	00008517          	auipc	a0,0x8
    8000048a:	bca50513          	addi	a0,a0,-1078 # 80008050 <etext+0x50>
    8000048e:	00006097          	auipc	ra,0x6
    80000492:	21a080e7          	jalr	538(ra) # 800066a8 <panic>
    pte_t *pte = &pagetable[PX(level, va)];
    if(*pte & PTE_V) {
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80000496:	080a8963          	beqz	s5,80000528 <walk+0xc8>
    8000049a:	00000097          	auipc	ra,0x0
    8000049e:	c7e080e7          	jalr	-898(ra) # 80000118 <kalloc>
    800004a2:	84aa                	mv	s1,a0
    800004a4:	c931                	beqz	a0,800004f8 <walk+0x98>
        return 0;
      memset(pagetable, 0, PGSIZE);
    800004a6:	6605                	lui	a2,0x1
    800004a8:	4581                	li	a1,0
    800004aa:	00000097          	auipc	ra,0x0
    800004ae:	cce080e7          	jalr	-818(ra) # 80000178 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    800004b2:	00c4d793          	srli	a5,s1,0xc
    800004b6:	07aa                	slli	a5,a5,0xa
    800004b8:	0017e793          	ori	a5,a5,1
    800004bc:	00f93023          	sd	a5,0(s2)
  for(int level = 2; level > 0; level--) {
    800004c0:	3a5d                	addiw	s4,s4,-9
    800004c2:	036a0063          	beq	s4,s6,800004e2 <walk+0x82>
    pte_t *pte = &pagetable[PX(level, va)];
    800004c6:	0149d933          	srl	s2,s3,s4
    800004ca:	1ff97913          	andi	s2,s2,511
    800004ce:	090e                	slli	s2,s2,0x3
    800004d0:	9926                	add	s2,s2,s1
    if(*pte & PTE_V) {
    800004d2:	00093483          	ld	s1,0(s2)
    800004d6:	0014f793          	andi	a5,s1,1
    800004da:	dfd5                	beqz	a5,80000496 <walk+0x36>
      pagetable = (pagetable_t)PTE2PA(*pte);
    800004dc:	80a9                	srli	s1,s1,0xa
    800004de:	04b2                	slli	s1,s1,0xc
    800004e0:	b7c5                	j	800004c0 <walk+0x60>
    }
  }

  pte_t *pte = &pagetable[PX(0, va)];
    800004e2:	00c9d513          	srli	a0,s3,0xc
    800004e6:	1ff57513          	andi	a0,a0,511
    800004ea:	050e                	slli	a0,a0,0x3
    800004ec:	94aa                	add	s1,s1,a0
  if (!lru) {
    lru = (lru_t *)kalloc();
    lru_clear(lru);
  }
  #elif defined(PG_REPLACEMENT_USE_FIFO)
  if (!q){
    800004ee:	00009797          	auipc	a5,0x9
    800004f2:	b227b783          	ld	a5,-1246(a5) # 80009010 <q>
    800004f6:	cf81                	beqz	a5,8000050e <walk+0xae>
    q = (queue_t *)kalloc();
    q_clear(q);
  }
  #endif
  return pte;
}
    800004f8:	8526                	mv	a0,s1
    800004fa:	70e2                	ld	ra,56(sp)
    800004fc:	7442                	ld	s0,48(sp)
    800004fe:	74a2                	ld	s1,40(sp)
    80000500:	7902                	ld	s2,32(sp)
    80000502:	69e2                	ld	s3,24(sp)
    80000504:	6a42                	ld	s4,16(sp)
    80000506:	6aa2                	ld	s5,8(sp)
    80000508:	6b02                	ld	s6,0(sp)
    8000050a:	6121                	addi	sp,sp,64
    8000050c:	8082                	ret
    q = (queue_t *)kalloc();
    8000050e:	00000097          	auipc	ra,0x0
    80000512:	c0a080e7          	jalr	-1014(ra) # 80000118 <kalloc>
    80000516:	00009797          	auipc	a5,0x9
    8000051a:	aea7bd23          	sd	a0,-1286(a5) # 80009010 <q>
    q_clear(q);
    8000051e:	00006097          	auipc	ra,0x6
    80000522:	b4a080e7          	jalr	-1206(ra) # 80006068 <q_clear>
    80000526:	bfc9                	j	800004f8 <walk+0x98>
        return 0;
    80000528:	4481                	li	s1,0
    8000052a:	b7f9                	j	800004f8 <walk+0x98>

000000008000052c <walkaddr>:
uint64
walkaddr(pagetable_t pagetable, uint64 va) {
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    8000052c:	57fd                	li	a5,-1
    8000052e:	83e9                	srli	a5,a5,0x1a
    80000530:	00b7f463          	bgeu	a5,a1,80000538 <walkaddr+0xc>
    return 0;
    80000534:	4501                	li	a0,0
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  pa = PTE2PA(*pte);
  return pa;
}
    80000536:	8082                	ret
walkaddr(pagetable_t pagetable, uint64 va) {
    80000538:	1141                	addi	sp,sp,-16
    8000053a:	e406                	sd	ra,8(sp)
    8000053c:	e022                	sd	s0,0(sp)
    8000053e:	0800                	addi	s0,sp,16
  pte = walk(pagetable, va, 0);
    80000540:	4601                	li	a2,0
    80000542:	00000097          	auipc	ra,0x0
    80000546:	f1e080e7          	jalr	-226(ra) # 80000460 <walk>
  if(pte == 0)
    8000054a:	c105                	beqz	a0,8000056a <walkaddr+0x3e>
  if((*pte & PTE_V) == 0)
    8000054c:	611c                	ld	a5,0(a0)
  if((*pte & PTE_U) == 0)
    8000054e:	0117f693          	andi	a3,a5,17
    80000552:	4745                	li	a4,17
    return 0;
    80000554:	4501                	li	a0,0
  if((*pte & PTE_U) == 0)
    80000556:	00e68663          	beq	a3,a4,80000562 <walkaddr+0x36>
}
    8000055a:	60a2                	ld	ra,8(sp)
    8000055c:	6402                	ld	s0,0(sp)
    8000055e:	0141                	addi	sp,sp,16
    80000560:	8082                	ret
  pa = PTE2PA(*pte);
    80000562:	00a7d513          	srli	a0,a5,0xa
    80000566:	0532                	slli	a0,a0,0xc
  return pa;
    80000568:	bfcd                	j	8000055a <walkaddr+0x2e>
    return 0;
    8000056a:	4501                	li	a0,0
    8000056c:	b7fd                	j	8000055a <walkaddr+0x2e>

000000008000056e <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    8000056e:	715d                	addi	sp,sp,-80
    80000570:	e486                	sd	ra,72(sp)
    80000572:	e0a2                	sd	s0,64(sp)
    80000574:	fc26                	sd	s1,56(sp)
    80000576:	f84a                	sd	s2,48(sp)
    80000578:	f44e                	sd	s3,40(sp)
    8000057a:	f052                	sd	s4,32(sp)
    8000057c:	ec56                	sd	s5,24(sp)
    8000057e:	e85a                	sd	s6,16(sp)
    80000580:	e45e                	sd	s7,8(sp)
    80000582:	0880                	addi	s0,sp,80
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80000584:	c205                	beqz	a2,800005a4 <mappages+0x36>
    80000586:	8aaa                	mv	s5,a0
    80000588:	8b3a                	mv	s6,a4
    panic("mappages: size");
  a = PGROUNDDOWN(va);
    8000058a:	77fd                	lui	a5,0xfffff
    8000058c:	00f5fa33          	and	s4,a1,a5
  last = PGROUNDDOWN(va + size - 1);
    80000590:	15fd                	addi	a1,a1,-1
    80000592:	00c589b3          	add	s3,a1,a2
    80000596:	00f9f9b3          	and	s3,s3,a5
  a = PGROUNDDOWN(va);
    8000059a:	8952                	mv	s2,s4
    8000059c:	41468a33          	sub	s4,a3,s4
    if(*pte & PTE_V)
      panic("mappages: remap");
    *pte = PA2PTE(pa) | perm | PTE_V;
    if(a == last)
      break;
    a += PGSIZE;
    800005a0:	6b85                	lui	s7,0x1
    800005a2:	a015                	j	800005c6 <mappages+0x58>
    panic("mappages: size");
    800005a4:	00008517          	auipc	a0,0x8
    800005a8:	ab450513          	addi	a0,a0,-1356 # 80008058 <etext+0x58>
    800005ac:	00006097          	auipc	ra,0x6
    800005b0:	0fc080e7          	jalr	252(ra) # 800066a8 <panic>
      panic("mappages: remap");
    800005b4:	00008517          	auipc	a0,0x8
    800005b8:	ab450513          	addi	a0,a0,-1356 # 80008068 <etext+0x68>
    800005bc:	00006097          	auipc	ra,0x6
    800005c0:	0ec080e7          	jalr	236(ra) # 800066a8 <panic>
    a += PGSIZE;
    800005c4:	995e                	add	s2,s2,s7
  for(;;){
    800005c6:	012a04b3          	add	s1,s4,s2
    if((pte = walk(pagetable, a, 1)) == 0)
    800005ca:	4605                	li	a2,1
    800005cc:	85ca                	mv	a1,s2
    800005ce:	8556                	mv	a0,s5
    800005d0:	00000097          	auipc	ra,0x0
    800005d4:	e90080e7          	jalr	-368(ra) # 80000460 <walk>
    800005d8:	cd19                	beqz	a0,800005f6 <mappages+0x88>
    if(*pte & PTE_V)
    800005da:	611c                	ld	a5,0(a0)
    800005dc:	8b85                	andi	a5,a5,1
    800005de:	fbf9                	bnez	a5,800005b4 <mappages+0x46>
    *pte = PA2PTE(pa) | perm | PTE_V;
    800005e0:	80b1                	srli	s1,s1,0xc
    800005e2:	04aa                	slli	s1,s1,0xa
    800005e4:	0164e4b3          	or	s1,s1,s6
    800005e8:	0014e493          	ori	s1,s1,1
    800005ec:	e104                	sd	s1,0(a0)
    if(a == last)
    800005ee:	fd391be3          	bne	s2,s3,800005c4 <mappages+0x56>
    pa += PGSIZE;
  }
  return 0;
    800005f2:	4501                	li	a0,0
    800005f4:	a011                	j	800005f8 <mappages+0x8a>
      return -1;
    800005f6:	557d                	li	a0,-1
}
    800005f8:	60a6                	ld	ra,72(sp)
    800005fa:	6406                	ld	s0,64(sp)
    800005fc:	74e2                	ld	s1,56(sp)
    800005fe:	7942                	ld	s2,48(sp)
    80000600:	79a2                	ld	s3,40(sp)
    80000602:	7a02                	ld	s4,32(sp)
    80000604:	6ae2                	ld	s5,24(sp)
    80000606:	6b42                	ld	s6,16(sp)
    80000608:	6ba2                	ld	s7,8(sp)
    8000060a:	6161                	addi	sp,sp,80
    8000060c:	8082                	ret

000000008000060e <kvmmap>:
{
    8000060e:	1141                	addi	sp,sp,-16
    80000610:	e406                	sd	ra,8(sp)
    80000612:	e022                	sd	s0,0(sp)
    80000614:	0800                	addi	s0,sp,16
    80000616:	87b6                	mv	a5,a3
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80000618:	86b2                	mv	a3,a2
    8000061a:	863e                	mv	a2,a5
    8000061c:	00000097          	auipc	ra,0x0
    80000620:	f52080e7          	jalr	-174(ra) # 8000056e <mappages>
    80000624:	e509                	bnez	a0,8000062e <kvmmap+0x20>
}
    80000626:	60a2                	ld	ra,8(sp)
    80000628:	6402                	ld	s0,0(sp)
    8000062a:	0141                	addi	sp,sp,16
    8000062c:	8082                	ret
    panic("kvmmap");
    8000062e:	00008517          	auipc	a0,0x8
    80000632:	a4a50513          	addi	a0,a0,-1462 # 80008078 <etext+0x78>
    80000636:	00006097          	auipc	ra,0x6
    8000063a:	072080e7          	jalr	114(ra) # 800066a8 <panic>

000000008000063e <kvmmake>:
{
    8000063e:	1101                	addi	sp,sp,-32
    80000640:	ec06                	sd	ra,24(sp)
    80000642:	e822                	sd	s0,16(sp)
    80000644:	e426                	sd	s1,8(sp)
    80000646:	e04a                	sd	s2,0(sp)
    80000648:	1000                	addi	s0,sp,32
  kpgtbl = (pagetable_t) kalloc();
    8000064a:	00000097          	auipc	ra,0x0
    8000064e:	ace080e7          	jalr	-1330(ra) # 80000118 <kalloc>
    80000652:	84aa                	mv	s1,a0
  memset(kpgtbl, 0, PGSIZE);
    80000654:	6605                	lui	a2,0x1
    80000656:	4581                	li	a1,0
    80000658:	00000097          	auipc	ra,0x0
    8000065c:	b20080e7          	jalr	-1248(ra) # 80000178 <memset>
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80000660:	4719                	li	a4,6
    80000662:	6685                	lui	a3,0x1
    80000664:	10000637          	lui	a2,0x10000
    80000668:	100005b7          	lui	a1,0x10000
    8000066c:	8526                	mv	a0,s1
    8000066e:	00000097          	auipc	ra,0x0
    80000672:	fa0080e7          	jalr	-96(ra) # 8000060e <kvmmap>
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80000676:	4719                	li	a4,6
    80000678:	6685                	lui	a3,0x1
    8000067a:	10001637          	lui	a2,0x10001
    8000067e:	100015b7          	lui	a1,0x10001
    80000682:	8526                	mv	a0,s1
    80000684:	00000097          	auipc	ra,0x0
    80000688:	f8a080e7          	jalr	-118(ra) # 8000060e <kvmmap>
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    8000068c:	4719                	li	a4,6
    8000068e:	004006b7          	lui	a3,0x400
    80000692:	0c000637          	lui	a2,0xc000
    80000696:	0c0005b7          	lui	a1,0xc000
    8000069a:	8526                	mv	a0,s1
    8000069c:	00000097          	auipc	ra,0x0
    800006a0:	f72080e7          	jalr	-142(ra) # 8000060e <kvmmap>
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    800006a4:	00008917          	auipc	s2,0x8
    800006a8:	95c90913          	addi	s2,s2,-1700 # 80008000 <etext>
    800006ac:	4729                	li	a4,10
    800006ae:	80008697          	auipc	a3,0x80008
    800006b2:	95268693          	addi	a3,a3,-1710 # 8000 <_entry-0x7fff8000>
    800006b6:	4605                	li	a2,1
    800006b8:	067e                	slli	a2,a2,0x1f
    800006ba:	85b2                	mv	a1,a2
    800006bc:	8526                	mv	a0,s1
    800006be:	00000097          	auipc	ra,0x0
    800006c2:	f50080e7          	jalr	-176(ra) # 8000060e <kvmmap>
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    800006c6:	4719                	li	a4,6
    800006c8:	46c5                	li	a3,17
    800006ca:	06ee                	slli	a3,a3,0x1b
    800006cc:	412686b3          	sub	a3,a3,s2
    800006d0:	864a                	mv	a2,s2
    800006d2:	85ca                	mv	a1,s2
    800006d4:	8526                	mv	a0,s1
    800006d6:	00000097          	auipc	ra,0x0
    800006da:	f38080e7          	jalr	-200(ra) # 8000060e <kvmmap>
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    800006de:	4729                	li	a4,10
    800006e0:	6685                	lui	a3,0x1
    800006e2:	00007617          	auipc	a2,0x7
    800006e6:	91e60613          	addi	a2,a2,-1762 # 80007000 <_trampoline>
    800006ea:	040005b7          	lui	a1,0x4000
    800006ee:	15fd                	addi	a1,a1,-1
    800006f0:	05b2                	slli	a1,a1,0xc
    800006f2:	8526                	mv	a0,s1
    800006f4:	00000097          	auipc	ra,0x0
    800006f8:	f1a080e7          	jalr	-230(ra) # 8000060e <kvmmap>
  proc_mapstacks(kpgtbl);
    800006fc:	8526                	mv	a0,s1
    800006fe:	00001097          	auipc	ra,0x1
    80000702:	c00080e7          	jalr	-1024(ra) # 800012fe <proc_mapstacks>
}
    80000706:	8526                	mv	a0,s1
    80000708:	60e2                	ld	ra,24(sp)
    8000070a:	6442                	ld	s0,16(sp)
    8000070c:	64a2                	ld	s1,8(sp)
    8000070e:	6902                	ld	s2,0(sp)
    80000710:	6105                	addi	sp,sp,32
    80000712:	8082                	ret

0000000080000714 <kvminit>:
{
    80000714:	1141                	addi	sp,sp,-16
    80000716:	e406                	sd	ra,8(sp)
    80000718:	e022                	sd	s0,0(sp)
    8000071a:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    8000071c:	00000097          	auipc	ra,0x0
    80000720:	f22080e7          	jalr	-222(ra) # 8000063e <kvmmake>
    80000724:	00009797          	auipc	a5,0x9
    80000728:	8ea7b223          	sd	a0,-1820(a5) # 80009008 <kernel_pagetable>
}
    8000072c:	60a2                	ld	ra,8(sp)
    8000072e:	6402                	ld	s0,0(sp)
    80000730:	0141                	addi	sp,sp,16
    80000732:	8082                	ret

0000000080000734 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80000734:	715d                	addi	sp,sp,-80
    80000736:	e486                	sd	ra,72(sp)
    80000738:	e0a2                	sd	s0,64(sp)
    8000073a:	fc26                	sd	s1,56(sp)
    8000073c:	f84a                	sd	s2,48(sp)
    8000073e:	f44e                	sd	s3,40(sp)
    80000740:	f052                	sd	s4,32(sp)
    80000742:	ec56                	sd	s5,24(sp)
    80000744:	e85a                	sd	s6,16(sp)
    80000746:	e45e                	sd	s7,8(sp)
    80000748:	0880                	addi	s0,sp,80
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    8000074a:	03459793          	slli	a5,a1,0x34
    8000074e:	e795                	bnez	a5,8000077a <uvmunmap+0x46>
    80000750:	8a2a                	mv	s4,a0
    80000752:	892e                	mv	s2,a1
    80000754:	8b36                	mv	s6,a3
    panic("uvmunmap: not aligned");

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80000756:	0632                	slli	a2,a2,0xc
    80000758:	00b609b3          	add	s3,a2,a1
    }

    if((*pte & PTE_V) == 0)
      continue;

    if(PTE_FLAGS(*pte) == PTE_V)
    8000075c:	4b85                	li	s7,1
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    8000075e:	6a85                	lui	s5,0x1
    80000760:	0735e163          	bltu	a1,s3,800007c2 <uvmunmap+0x8e>
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
  }
}
    80000764:	60a6                	ld	ra,72(sp)
    80000766:	6406                	ld	s0,64(sp)
    80000768:	74e2                	ld	s1,56(sp)
    8000076a:	7942                	ld	s2,48(sp)
    8000076c:	79a2                	ld	s3,40(sp)
    8000076e:	7a02                	ld	s4,32(sp)
    80000770:	6ae2                	ld	s5,24(sp)
    80000772:	6b42                	ld	s6,16(sp)
    80000774:	6ba2                	ld	s7,8(sp)
    80000776:	6161                	addi	sp,sp,80
    80000778:	8082                	ret
    panic("uvmunmap: not aligned");
    8000077a:	00008517          	auipc	a0,0x8
    8000077e:	90650513          	addi	a0,a0,-1786 # 80008080 <etext+0x80>
    80000782:	00006097          	auipc	ra,0x6
    80000786:	f26080e7          	jalr	-218(ra) # 800066a8 <panic>
      panic("uvmunmap: walk");
    8000078a:	00008517          	auipc	a0,0x8
    8000078e:	90e50513          	addi	a0,a0,-1778 # 80008098 <etext+0x98>
    80000792:	00006097          	auipc	ra,0x6
    80000796:	f16080e7          	jalr	-234(ra) # 800066a8 <panic>
      panic("uvmunmap: not a leaf");
    8000079a:	00008517          	auipc	a0,0x8
    8000079e:	90e50513          	addi	a0,a0,-1778 # 800080a8 <etext+0xa8>
    800007a2:	00006097          	auipc	ra,0x6
    800007a6:	f06080e7          	jalr	-250(ra) # 800066a8 <panic>
      uint64 pa = PTE2PA(*pte);
    800007aa:	83a9                	srli	a5,a5,0xa
      kfree((void*)pa);
    800007ac:	00c79513          	slli	a0,a5,0xc
    800007b0:	00000097          	auipc	ra,0x0
    800007b4:	86c080e7          	jalr	-1940(ra) # 8000001c <kfree>
    *pte = 0;
    800007b8:	0004b023          	sd	zero,0(s1)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    800007bc:	9956                	add	s2,s2,s5
    800007be:	fb3973e3          	bgeu	s2,s3,80000764 <uvmunmap+0x30>
    if((pte = walk(pagetable, a, 0)) == 0)
    800007c2:	4601                	li	a2,0
    800007c4:	85ca                	mv	a1,s2
    800007c6:	8552                	mv	a0,s4
    800007c8:	00000097          	auipc	ra,0x0
    800007cc:	c98080e7          	jalr	-872(ra) # 80000460 <walk>
    800007d0:	84aa                	mv	s1,a0
    800007d2:	dd45                	beqz	a0,8000078a <uvmunmap+0x56>
    if(*pte & PTE_S) {
    800007d4:	611c                	ld	a5,0(a0)
    800007d6:	2007f713          	andi	a4,a5,512
    800007da:	f36d                	bnez	a4,800007bc <uvmunmap+0x88>
    if((*pte & PTE_V) == 0)
    800007dc:	0017f713          	andi	a4,a5,1
    800007e0:	df71                	beqz	a4,800007bc <uvmunmap+0x88>
    if(PTE_FLAGS(*pte) == PTE_V)
    800007e2:	3ff7f713          	andi	a4,a5,1023
    800007e6:	fb770ae3          	beq	a4,s7,8000079a <uvmunmap+0x66>
    if(do_free){
    800007ea:	fc0b07e3          	beqz	s6,800007b8 <uvmunmap+0x84>
    800007ee:	bf75                	j	800007aa <uvmunmap+0x76>

00000000800007f0 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{ 
    800007f0:	1101                	addi	sp,sp,-32
    800007f2:	ec06                	sd	ra,24(sp)
    800007f4:	e822                	sd	s0,16(sp)
    800007f6:	e426                	sd	s1,8(sp)
    800007f8:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    800007fa:	00000097          	auipc	ra,0x0
    800007fe:	91e080e7          	jalr	-1762(ra) # 80000118 <kalloc>
    80000802:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80000804:	c519                	beqz	a0,80000812 <uvmcreate+0x22>
    return 0;
  memset(pagetable, 0, PGSIZE);
    80000806:	6605                	lui	a2,0x1
    80000808:	4581                	li	a1,0
    8000080a:	00000097          	auipc	ra,0x0
    8000080e:	96e080e7          	jalr	-1682(ra) # 80000178 <memset>
  return pagetable;
}
    80000812:	8526                	mv	a0,s1
    80000814:	60e2                	ld	ra,24(sp)
    80000816:	6442                	ld	s0,16(sp)
    80000818:	64a2                	ld	s1,8(sp)
    8000081a:	6105                	addi	sp,sp,32
    8000081c:	8082                	ret

000000008000081e <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, uchar *src, uint sz)
{
    8000081e:	7179                	addi	sp,sp,-48
    80000820:	f406                	sd	ra,40(sp)
    80000822:	f022                	sd	s0,32(sp)
    80000824:	ec26                	sd	s1,24(sp)
    80000826:	e84a                	sd	s2,16(sp)
    80000828:	e44e                	sd	s3,8(sp)
    8000082a:	e052                	sd	s4,0(sp)
    8000082c:	1800                	addi	s0,sp,48
  char *mem;

  if(sz >= PGSIZE)
    8000082e:	6785                	lui	a5,0x1
    80000830:	04f67863          	bgeu	a2,a5,80000880 <uvminit+0x62>
    80000834:	8a2a                	mv	s4,a0
    80000836:	89ae                	mv	s3,a1
    80000838:	84b2                	mv	s1,a2
    panic("inituvm: more than a page");
  mem = kalloc();
    8000083a:	00000097          	auipc	ra,0x0
    8000083e:	8de080e7          	jalr	-1826(ra) # 80000118 <kalloc>
    80000842:	892a                	mv	s2,a0
  memset(mem, 0, PGSIZE);
    80000844:	6605                	lui	a2,0x1
    80000846:	4581                	li	a1,0
    80000848:	00000097          	auipc	ra,0x0
    8000084c:	930080e7          	jalr	-1744(ra) # 80000178 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80000850:	4779                	li	a4,30
    80000852:	86ca                	mv	a3,s2
    80000854:	6605                	lui	a2,0x1
    80000856:	4581                	li	a1,0
    80000858:	8552                	mv	a0,s4
    8000085a:	00000097          	auipc	ra,0x0
    8000085e:	d14080e7          	jalr	-748(ra) # 8000056e <mappages>
  memmove(mem, src, sz);
    80000862:	8626                	mv	a2,s1
    80000864:	85ce                	mv	a1,s3
    80000866:	854a                	mv	a0,s2
    80000868:	00000097          	auipc	ra,0x0
    8000086c:	970080e7          	jalr	-1680(ra) # 800001d8 <memmove>
}
    80000870:	70a2                	ld	ra,40(sp)
    80000872:	7402                	ld	s0,32(sp)
    80000874:	64e2                	ld	s1,24(sp)
    80000876:	6942                	ld	s2,16(sp)
    80000878:	69a2                	ld	s3,8(sp)
    8000087a:	6a02                	ld	s4,0(sp)
    8000087c:	6145                	addi	sp,sp,48
    8000087e:	8082                	ret
    panic("inituvm: more than a page");
    80000880:	00008517          	auipc	a0,0x8
    80000884:	84050513          	addi	a0,a0,-1984 # 800080c0 <etext+0xc0>
    80000888:	00006097          	auipc	ra,0x6
    8000088c:	e20080e7          	jalr	-480(ra) # 800066a8 <panic>

0000000080000890 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80000890:	1101                	addi	sp,sp,-32
    80000892:	ec06                	sd	ra,24(sp)
    80000894:	e822                	sd	s0,16(sp)
    80000896:	e426                	sd	s1,8(sp)
    80000898:	1000                	addi	s0,sp,32
  if(newsz >= oldsz)
    return oldsz;
    8000089a:	84ae                	mv	s1,a1
  if(newsz >= oldsz)
    8000089c:	00b67d63          	bgeu	a2,a1,800008b6 <uvmdealloc+0x26>
    800008a0:	84b2                	mv	s1,a2

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    800008a2:	6785                	lui	a5,0x1
    800008a4:	17fd                	addi	a5,a5,-1
    800008a6:	00f60733          	add	a4,a2,a5
    800008aa:	767d                	lui	a2,0xfffff
    800008ac:	8f71                	and	a4,a4,a2
    800008ae:	97ae                	add	a5,a5,a1
    800008b0:	8ff1                	and	a5,a5,a2
    800008b2:	00f76863          	bltu	a4,a5,800008c2 <uvmdealloc+0x32>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
  }

  return newsz;
}
    800008b6:	8526                	mv	a0,s1
    800008b8:	60e2                	ld	ra,24(sp)
    800008ba:	6442                	ld	s0,16(sp)
    800008bc:	64a2                	ld	s1,8(sp)
    800008be:	6105                	addi	sp,sp,32
    800008c0:	8082                	ret
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    800008c2:	8f99                	sub	a5,a5,a4
    800008c4:	83b1                	srli	a5,a5,0xc
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    800008c6:	4685                	li	a3,1
    800008c8:	0007861b          	sext.w	a2,a5
    800008cc:	85ba                	mv	a1,a4
    800008ce:	00000097          	auipc	ra,0x0
    800008d2:	e66080e7          	jalr	-410(ra) # 80000734 <uvmunmap>
    800008d6:	b7c5                	j	800008b6 <uvmdealloc+0x26>

00000000800008d8 <uvmalloc>:
  if(newsz < oldsz)
    800008d8:	0ab66163          	bltu	a2,a1,8000097a <uvmalloc+0xa2>
{
    800008dc:	7139                	addi	sp,sp,-64
    800008de:	fc06                	sd	ra,56(sp)
    800008e0:	f822                	sd	s0,48(sp)
    800008e2:	f426                	sd	s1,40(sp)
    800008e4:	f04a                	sd	s2,32(sp)
    800008e6:	ec4e                	sd	s3,24(sp)
    800008e8:	e852                	sd	s4,16(sp)
    800008ea:	e456                	sd	s5,8(sp)
    800008ec:	0080                	addi	s0,sp,64
    800008ee:	8aaa                	mv	s5,a0
    800008f0:	8a32                	mv	s4,a2
  oldsz = PGROUNDUP(oldsz);
    800008f2:	6985                	lui	s3,0x1
    800008f4:	19fd                	addi	s3,s3,-1
    800008f6:	95ce                	add	a1,a1,s3
    800008f8:	79fd                	lui	s3,0xfffff
    800008fa:	0135f9b3          	and	s3,a1,s3
  for(a = oldsz; a < newsz; a += PGSIZE){
    800008fe:	08c9f063          	bgeu	s3,a2,8000097e <uvmalloc+0xa6>
    80000902:	894e                	mv	s2,s3
    mem = kalloc();
    80000904:	00000097          	auipc	ra,0x0
    80000908:	814080e7          	jalr	-2028(ra) # 80000118 <kalloc>
    8000090c:	84aa                	mv	s1,a0
    if(mem == 0){
    8000090e:	c51d                	beqz	a0,8000093c <uvmalloc+0x64>
    memset(mem, 0, PGSIZE);
    80000910:	6605                	lui	a2,0x1
    80000912:	4581                	li	a1,0
    80000914:	00000097          	auipc	ra,0x0
    80000918:	864080e7          	jalr	-1948(ra) # 80000178 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0){
    8000091c:	4779                	li	a4,30
    8000091e:	86a6                	mv	a3,s1
    80000920:	6605                	lui	a2,0x1
    80000922:	85ca                	mv	a1,s2
    80000924:	8556                	mv	a0,s5
    80000926:	00000097          	auipc	ra,0x0
    8000092a:	c48080e7          	jalr	-952(ra) # 8000056e <mappages>
    8000092e:	e905                	bnez	a0,8000095e <uvmalloc+0x86>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80000930:	6785                	lui	a5,0x1
    80000932:	993e                	add	s2,s2,a5
    80000934:	fd4968e3          	bltu	s2,s4,80000904 <uvmalloc+0x2c>
  return newsz;
    80000938:	8552                	mv	a0,s4
    8000093a:	a809                	j	8000094c <uvmalloc+0x74>
      uvmdealloc(pagetable, a, oldsz);
    8000093c:	864e                	mv	a2,s3
    8000093e:	85ca                	mv	a1,s2
    80000940:	8556                	mv	a0,s5
    80000942:	00000097          	auipc	ra,0x0
    80000946:	f4e080e7          	jalr	-178(ra) # 80000890 <uvmdealloc>
      return 0;
    8000094a:	4501                	li	a0,0
}
    8000094c:	70e2                	ld	ra,56(sp)
    8000094e:	7442                	ld	s0,48(sp)
    80000950:	74a2                	ld	s1,40(sp)
    80000952:	7902                	ld	s2,32(sp)
    80000954:	69e2                	ld	s3,24(sp)
    80000956:	6a42                	ld	s4,16(sp)
    80000958:	6aa2                	ld	s5,8(sp)
    8000095a:	6121                	addi	sp,sp,64
    8000095c:	8082                	ret
      kfree(mem);
    8000095e:	8526                	mv	a0,s1
    80000960:	fffff097          	auipc	ra,0xfffff
    80000964:	6bc080e7          	jalr	1724(ra) # 8000001c <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80000968:	864e                	mv	a2,s3
    8000096a:	85ca                	mv	a1,s2
    8000096c:	8556                	mv	a0,s5
    8000096e:	00000097          	auipc	ra,0x0
    80000972:	f22080e7          	jalr	-222(ra) # 80000890 <uvmdealloc>
      return 0;
    80000976:	4501                	li	a0,0
    80000978:	bfd1                	j	8000094c <uvmalloc+0x74>
    return oldsz;
    8000097a:	852e                	mv	a0,a1
}
    8000097c:	8082                	ret
  return newsz;
    8000097e:	8532                	mv	a0,a2
    80000980:	b7f1                	j	8000094c <uvmalloc+0x74>

0000000080000982 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    80000982:	7179                	addi	sp,sp,-48
    80000984:	f406                	sd	ra,40(sp)
    80000986:	f022                	sd	s0,32(sp)
    80000988:	ec26                	sd	s1,24(sp)
    8000098a:	e84a                	sd	s2,16(sp)
    8000098c:	e44e                	sd	s3,8(sp)
    8000098e:	e052                	sd	s4,0(sp)
    80000990:	1800                	addi	s0,sp,48
    80000992:	8a2a                	mv	s4,a0
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80000994:	84aa                	mv	s1,a0
    80000996:	6905                	lui	s2,0x1
    80000998:	992a                	add	s2,s2,a0
    pte_t pte = pagetable[i];
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000099a:	4985                	li	s3,1
    8000099c:	a821                	j	800009b4 <freewalk+0x32>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    8000099e:	8129                	srli	a0,a0,0xa
      freewalk((pagetable_t)child);
    800009a0:	0532                	slli	a0,a0,0xc
    800009a2:	00000097          	auipc	ra,0x0
    800009a6:	fe0080e7          	jalr	-32(ra) # 80000982 <freewalk>
      pagetable[i] = 0;
    800009aa:	0004b023          	sd	zero,0(s1)
  for(int i = 0; i < 512; i++){
    800009ae:	04a1                	addi	s1,s1,8
    800009b0:	03248163          	beq	s1,s2,800009d2 <freewalk+0x50>
    pte_t pte = pagetable[i];
    800009b4:	6088                	ld	a0,0(s1)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800009b6:	00f57793          	andi	a5,a0,15
    800009ba:	ff3782e3          	beq	a5,s3,8000099e <freewalk+0x1c>
    } else if(pte & PTE_V){
    800009be:	8905                	andi	a0,a0,1
    800009c0:	d57d                	beqz	a0,800009ae <freewalk+0x2c>
      panic("freewalk: leaf");
    800009c2:	00007517          	auipc	a0,0x7
    800009c6:	71e50513          	addi	a0,a0,1822 # 800080e0 <etext+0xe0>
    800009ca:	00006097          	auipc	ra,0x6
    800009ce:	cde080e7          	jalr	-802(ra) # 800066a8 <panic>
    }
  }
  kfree((void*)pagetable);
    800009d2:	8552                	mv	a0,s4
    800009d4:	fffff097          	auipc	ra,0xfffff
    800009d8:	648080e7          	jalr	1608(ra) # 8000001c <kfree>
}
    800009dc:	70a2                	ld	ra,40(sp)
    800009de:	7402                	ld	s0,32(sp)
    800009e0:	64e2                	ld	s1,24(sp)
    800009e2:	6942                	ld	s2,16(sp)
    800009e4:	69a2                	ld	s3,8(sp)
    800009e6:	6a02                	ld	s4,0(sp)
    800009e8:	6145                	addi	sp,sp,48
    800009ea:	8082                	ret

00000000800009ec <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    800009ec:	1101                	addi	sp,sp,-32
    800009ee:	ec06                	sd	ra,24(sp)
    800009f0:	e822                	sd	s0,16(sp)
    800009f2:	e426                	sd	s1,8(sp)
    800009f4:	1000                	addi	s0,sp,32
    800009f6:	84aa                	mv	s1,a0
  if(sz > 0)
    800009f8:	e999                	bnez	a1,80000a0e <uvmfree+0x22>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
  freewalk(pagetable);
    800009fa:	8526                	mv	a0,s1
    800009fc:	00000097          	auipc	ra,0x0
    80000a00:	f86080e7          	jalr	-122(ra) # 80000982 <freewalk>
}
    80000a04:	60e2                	ld	ra,24(sp)
    80000a06:	6442                	ld	s0,16(sp)
    80000a08:	64a2                	ld	s1,8(sp)
    80000a0a:	6105                	addi	sp,sp,32
    80000a0c:	8082                	ret
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80000a0e:	6605                	lui	a2,0x1
    80000a10:	167d                	addi	a2,a2,-1
    80000a12:	962e                	add	a2,a2,a1
    80000a14:	4685                	li	a3,1
    80000a16:	8231                	srli	a2,a2,0xc
    80000a18:	4581                	li	a1,0
    80000a1a:	00000097          	auipc	ra,0x0
    80000a1e:	d1a080e7          	jalr	-742(ra) # 80000734 <uvmunmap>
    80000a22:	bfe1                	j	800009fa <uvmfree+0xe>

0000000080000a24 <uvmcopy>:
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80000a24:	c679                	beqz	a2,80000af2 <uvmcopy+0xce>
{
    80000a26:	715d                	addi	sp,sp,-80
    80000a28:	e486                	sd	ra,72(sp)
    80000a2a:	e0a2                	sd	s0,64(sp)
    80000a2c:	fc26                	sd	s1,56(sp)
    80000a2e:	f84a                	sd	s2,48(sp)
    80000a30:	f44e                	sd	s3,40(sp)
    80000a32:	f052                	sd	s4,32(sp)
    80000a34:	ec56                	sd	s5,24(sp)
    80000a36:	e85a                	sd	s6,16(sp)
    80000a38:	e45e                	sd	s7,8(sp)
    80000a3a:	0880                	addi	s0,sp,80
    80000a3c:	8b2a                	mv	s6,a0
    80000a3e:	8aae                	mv	s5,a1
    80000a40:	8a32                	mv	s4,a2
  for(i = 0; i < sz; i += PGSIZE){
    80000a42:	4981                	li	s3,0
    if((pte = walk(old, i, 0)) == 0)
    80000a44:	4601                	li	a2,0
    80000a46:	85ce                	mv	a1,s3
    80000a48:	855a                	mv	a0,s6
    80000a4a:	00000097          	auipc	ra,0x0
    80000a4e:	a16080e7          	jalr	-1514(ra) # 80000460 <walk>
    80000a52:	c531                	beqz	a0,80000a9e <uvmcopy+0x7a>
      panic("uvmcopy: pte should exist");
    if((*pte & PTE_V) == 0)
    80000a54:	6118                	ld	a4,0(a0)
    80000a56:	00177793          	andi	a5,a4,1
    80000a5a:	cbb1                	beqz	a5,80000aae <uvmcopy+0x8a>
      panic("uvmcopy: page not present");
    pa = PTE2PA(*pte);
    80000a5c:	00a75593          	srli	a1,a4,0xa
    80000a60:	00c59b93          	slli	s7,a1,0xc
    flags = PTE_FLAGS(*pte);
    80000a64:	3ff77493          	andi	s1,a4,1023
    if((mem = kalloc()) == 0)
    80000a68:	fffff097          	auipc	ra,0xfffff
    80000a6c:	6b0080e7          	jalr	1712(ra) # 80000118 <kalloc>
    80000a70:	892a                	mv	s2,a0
    80000a72:	c939                	beqz	a0,80000ac8 <uvmcopy+0xa4>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    80000a74:	6605                	lui	a2,0x1
    80000a76:	85de                	mv	a1,s7
    80000a78:	fffff097          	auipc	ra,0xfffff
    80000a7c:	760080e7          	jalr	1888(ra) # 800001d8 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80000a80:	8726                	mv	a4,s1
    80000a82:	86ca                	mv	a3,s2
    80000a84:	6605                	lui	a2,0x1
    80000a86:	85ce                	mv	a1,s3
    80000a88:	8556                	mv	a0,s5
    80000a8a:	00000097          	auipc	ra,0x0
    80000a8e:	ae4080e7          	jalr	-1308(ra) # 8000056e <mappages>
    80000a92:	e515                	bnez	a0,80000abe <uvmcopy+0x9a>
  for(i = 0; i < sz; i += PGSIZE){
    80000a94:	6785                	lui	a5,0x1
    80000a96:	99be                	add	s3,s3,a5
    80000a98:	fb49e6e3          	bltu	s3,s4,80000a44 <uvmcopy+0x20>
    80000a9c:	a081                	j	80000adc <uvmcopy+0xb8>
      panic("uvmcopy: pte should exist");
    80000a9e:	00007517          	auipc	a0,0x7
    80000aa2:	65250513          	addi	a0,a0,1618 # 800080f0 <etext+0xf0>
    80000aa6:	00006097          	auipc	ra,0x6
    80000aaa:	c02080e7          	jalr	-1022(ra) # 800066a8 <panic>
      panic("uvmcopy: page not present");
    80000aae:	00007517          	auipc	a0,0x7
    80000ab2:	66250513          	addi	a0,a0,1634 # 80008110 <etext+0x110>
    80000ab6:	00006097          	auipc	ra,0x6
    80000aba:	bf2080e7          	jalr	-1038(ra) # 800066a8 <panic>
      kfree(mem);
    80000abe:	854a                	mv	a0,s2
    80000ac0:	fffff097          	auipc	ra,0xfffff
    80000ac4:	55c080e7          	jalr	1372(ra) # 8000001c <kfree>
    }
  }
  return 0;

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    80000ac8:	4685                	li	a3,1
    80000aca:	00c9d613          	srli	a2,s3,0xc
    80000ace:	4581                	li	a1,0
    80000ad0:	8556                	mv	a0,s5
    80000ad2:	00000097          	auipc	ra,0x0
    80000ad6:	c62080e7          	jalr	-926(ra) # 80000734 <uvmunmap>
  return -1;
    80000ada:	557d                	li	a0,-1
}
    80000adc:	60a6                	ld	ra,72(sp)
    80000ade:	6406                	ld	s0,64(sp)
    80000ae0:	74e2                	ld	s1,56(sp)
    80000ae2:	7942                	ld	s2,48(sp)
    80000ae4:	79a2                	ld	s3,40(sp)
    80000ae6:	7a02                	ld	s4,32(sp)
    80000ae8:	6ae2                	ld	s5,24(sp)
    80000aea:	6b42                	ld	s6,16(sp)
    80000aec:	6ba2                	ld	s7,8(sp)
    80000aee:	6161                	addi	sp,sp,80
    80000af0:	8082                	ret
  return 0;
    80000af2:	4501                	li	a0,0
}
    80000af4:	8082                	ret

0000000080000af6 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80000af6:	1141                	addi	sp,sp,-16
    80000af8:	e406                	sd	ra,8(sp)
    80000afa:	e022                	sd	s0,0(sp)
    80000afc:	0800                	addi	s0,sp,16
  pte_t *pte;
  pte = walk(pagetable, va, 0);
    80000afe:	4601                	li	a2,0
    80000b00:	00000097          	auipc	ra,0x0
    80000b04:	960080e7          	jalr	-1696(ra) # 80000460 <walk>
  if(pte == 0)
    80000b08:	c901                	beqz	a0,80000b18 <uvmclear+0x22>
    panic("uvmclear");
  *pte &= ~PTE_U;
    80000b0a:	611c                	ld	a5,0(a0)
    80000b0c:	9bbd                	andi	a5,a5,-17
    80000b0e:	e11c                	sd	a5,0(a0)
}
    80000b10:	60a2                	ld	ra,8(sp)
    80000b12:	6402                	ld	s0,0(sp)
    80000b14:	0141                	addi	sp,sp,16
    80000b16:	8082                	ret
    panic("uvmclear");
    80000b18:	00007517          	auipc	a0,0x7
    80000b1c:	61850513          	addi	a0,a0,1560 # 80008130 <etext+0x130>
    80000b20:	00006097          	auipc	ra,0x6
    80000b24:	b88080e7          	jalr	-1144(ra) # 800066a8 <panic>

0000000080000b28 <copyout>:
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80000b28:	c6bd                	beqz	a3,80000b96 <copyout+0x6e>
{
    80000b2a:	715d                	addi	sp,sp,-80
    80000b2c:	e486                	sd	ra,72(sp)
    80000b2e:	e0a2                	sd	s0,64(sp)
    80000b30:	fc26                	sd	s1,56(sp)
    80000b32:	f84a                	sd	s2,48(sp)
    80000b34:	f44e                	sd	s3,40(sp)
    80000b36:	f052                	sd	s4,32(sp)
    80000b38:	ec56                	sd	s5,24(sp)
    80000b3a:	e85a                	sd	s6,16(sp)
    80000b3c:	e45e                	sd	s7,8(sp)
    80000b3e:	e062                	sd	s8,0(sp)
    80000b40:	0880                	addi	s0,sp,80
    80000b42:	8b2a                	mv	s6,a0
    80000b44:	8c2e                	mv	s8,a1
    80000b46:	8a32                	mv	s4,a2
    80000b48:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(dstva);
    80000b4a:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (dstva - va0);
    80000b4c:	6a85                	lui	s5,0x1
    80000b4e:	a015                	j	80000b72 <copyout+0x4a>
    if(n > len)
      n = len;
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80000b50:	9562                	add	a0,a0,s8
    80000b52:	0004861b          	sext.w	a2,s1
    80000b56:	85d2                	mv	a1,s4
    80000b58:	41250533          	sub	a0,a0,s2
    80000b5c:	fffff097          	auipc	ra,0xfffff
    80000b60:	67c080e7          	jalr	1660(ra) # 800001d8 <memmove>

    len -= n;
    80000b64:	409989b3          	sub	s3,s3,s1
    src += n;
    80000b68:	9a26                	add	s4,s4,s1
    dstva = va0 + PGSIZE;
    80000b6a:	01590c33          	add	s8,s2,s5
  while(len > 0){
    80000b6e:	02098263          	beqz	s3,80000b92 <copyout+0x6a>
    va0 = PGROUNDDOWN(dstva);
    80000b72:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    80000b76:	85ca                	mv	a1,s2
    80000b78:	855a                	mv	a0,s6
    80000b7a:	00000097          	auipc	ra,0x0
    80000b7e:	9b2080e7          	jalr	-1614(ra) # 8000052c <walkaddr>
    if(pa0 == 0)
    80000b82:	cd01                	beqz	a0,80000b9a <copyout+0x72>
    n = PGSIZE - (dstva - va0);
    80000b84:	418904b3          	sub	s1,s2,s8
    80000b88:	94d6                	add	s1,s1,s5
    if(n > len)
    80000b8a:	fc99f3e3          	bgeu	s3,s1,80000b50 <copyout+0x28>
    80000b8e:	84ce                	mv	s1,s3
    80000b90:	b7c1                	j	80000b50 <copyout+0x28>
  }
  return 0;
    80000b92:	4501                	li	a0,0
    80000b94:	a021                	j	80000b9c <copyout+0x74>
    80000b96:	4501                	li	a0,0
}
    80000b98:	8082                	ret
      return -1;
    80000b9a:	557d                	li	a0,-1
}
    80000b9c:	60a6                	ld	ra,72(sp)
    80000b9e:	6406                	ld	s0,64(sp)
    80000ba0:	74e2                	ld	s1,56(sp)
    80000ba2:	7942                	ld	s2,48(sp)
    80000ba4:	79a2                	ld	s3,40(sp)
    80000ba6:	7a02                	ld	s4,32(sp)
    80000ba8:	6ae2                	ld	s5,24(sp)
    80000baa:	6b42                	ld	s6,16(sp)
    80000bac:	6ba2                	ld	s7,8(sp)
    80000bae:	6c02                	ld	s8,0(sp)
    80000bb0:	6161                	addi	sp,sp,80
    80000bb2:	8082                	ret

0000000080000bb4 <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80000bb4:	c6bd                	beqz	a3,80000c22 <copyin+0x6e>
{
    80000bb6:	715d                	addi	sp,sp,-80
    80000bb8:	e486                	sd	ra,72(sp)
    80000bba:	e0a2                	sd	s0,64(sp)
    80000bbc:	fc26                	sd	s1,56(sp)
    80000bbe:	f84a                	sd	s2,48(sp)
    80000bc0:	f44e                	sd	s3,40(sp)
    80000bc2:	f052                	sd	s4,32(sp)
    80000bc4:	ec56                	sd	s5,24(sp)
    80000bc6:	e85a                	sd	s6,16(sp)
    80000bc8:	e45e                	sd	s7,8(sp)
    80000bca:	e062                	sd	s8,0(sp)
    80000bcc:	0880                	addi	s0,sp,80
    80000bce:	8b2a                	mv	s6,a0
    80000bd0:	8a2e                	mv	s4,a1
    80000bd2:	8c32                	mv	s8,a2
    80000bd4:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
    80000bd6:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (srcva - va0);
    80000bd8:	6a85                	lui	s5,0x1
    80000bda:	a015                	j	80000bfe <copyin+0x4a>
    if(n > len)
      n = len;
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80000bdc:	9562                	add	a0,a0,s8
    80000bde:	0004861b          	sext.w	a2,s1
    80000be2:	412505b3          	sub	a1,a0,s2
    80000be6:	8552                	mv	a0,s4
    80000be8:	fffff097          	auipc	ra,0xfffff
    80000bec:	5f0080e7          	jalr	1520(ra) # 800001d8 <memmove>

    len -= n;
    80000bf0:	409989b3          	sub	s3,s3,s1
    dst += n;
    80000bf4:	9a26                	add	s4,s4,s1
    srcva = va0 + PGSIZE;
    80000bf6:	01590c33          	add	s8,s2,s5
  while(len > 0){
    80000bfa:	02098263          	beqz	s3,80000c1e <copyin+0x6a>
    va0 = PGROUNDDOWN(srcva);
    80000bfe:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    80000c02:	85ca                	mv	a1,s2
    80000c04:	855a                	mv	a0,s6
    80000c06:	00000097          	auipc	ra,0x0
    80000c0a:	926080e7          	jalr	-1754(ra) # 8000052c <walkaddr>
    if(pa0 == 0)
    80000c0e:	cd01                	beqz	a0,80000c26 <copyin+0x72>
    n = PGSIZE - (srcva - va0);
    80000c10:	418904b3          	sub	s1,s2,s8
    80000c14:	94d6                	add	s1,s1,s5
    if(n > len)
    80000c16:	fc99f3e3          	bgeu	s3,s1,80000bdc <copyin+0x28>
    80000c1a:	84ce                	mv	s1,s3
    80000c1c:	b7c1                	j	80000bdc <copyin+0x28>
  }
  return 0;
    80000c1e:	4501                	li	a0,0
    80000c20:	a021                	j	80000c28 <copyin+0x74>
    80000c22:	4501                	li	a0,0
}
    80000c24:	8082                	ret
      return -1;
    80000c26:	557d                	li	a0,-1
}
    80000c28:	60a6                	ld	ra,72(sp)
    80000c2a:	6406                	ld	s0,64(sp)
    80000c2c:	74e2                	ld	s1,56(sp)
    80000c2e:	7942                	ld	s2,48(sp)
    80000c30:	79a2                	ld	s3,40(sp)
    80000c32:	7a02                	ld	s4,32(sp)
    80000c34:	6ae2                	ld	s5,24(sp)
    80000c36:	6b42                	ld	s6,16(sp)
    80000c38:	6ba2                	ld	s7,8(sp)
    80000c3a:	6c02                	ld	s8,0(sp)
    80000c3c:	6161                	addi	sp,sp,80
    80000c3e:	8082                	ret

0000000080000c40 <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    80000c40:	c6c5                	beqz	a3,80000ce8 <copyinstr+0xa8>
{
    80000c42:	715d                	addi	sp,sp,-80
    80000c44:	e486                	sd	ra,72(sp)
    80000c46:	e0a2                	sd	s0,64(sp)
    80000c48:	fc26                	sd	s1,56(sp)
    80000c4a:	f84a                	sd	s2,48(sp)
    80000c4c:	f44e                	sd	s3,40(sp)
    80000c4e:	f052                	sd	s4,32(sp)
    80000c50:	ec56                	sd	s5,24(sp)
    80000c52:	e85a                	sd	s6,16(sp)
    80000c54:	e45e                	sd	s7,8(sp)
    80000c56:	0880                	addi	s0,sp,80
    80000c58:	8a2a                	mv	s4,a0
    80000c5a:	8b2e                	mv	s6,a1
    80000c5c:	8bb2                	mv	s7,a2
    80000c5e:	84b6                	mv	s1,a3
    va0 = PGROUNDDOWN(srcva);
    80000c60:	7afd                	lui	s5,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (srcva - va0);
    80000c62:	6985                	lui	s3,0x1
    80000c64:	a035                	j	80000c90 <copyinstr+0x50>
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
    80000c66:	00078023          	sb	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80000c6a:	4785                	li	a5,1
      dst++;
    }

    srcva = va0 + PGSIZE;
  }
  if(got_null){
    80000c6c:	0017b793          	seqz	a5,a5
    80000c70:	40f00533          	neg	a0,a5
    return 0;
  } else {
    return -1;
  }
}
    80000c74:	60a6                	ld	ra,72(sp)
    80000c76:	6406                	ld	s0,64(sp)
    80000c78:	74e2                	ld	s1,56(sp)
    80000c7a:	7942                	ld	s2,48(sp)
    80000c7c:	79a2                	ld	s3,40(sp)
    80000c7e:	7a02                	ld	s4,32(sp)
    80000c80:	6ae2                	ld	s5,24(sp)
    80000c82:	6b42                	ld	s6,16(sp)
    80000c84:	6ba2                	ld	s7,8(sp)
    80000c86:	6161                	addi	sp,sp,80
    80000c88:	8082                	ret
    srcva = va0 + PGSIZE;
    80000c8a:	01390bb3          	add	s7,s2,s3
  while(got_null == 0 && max > 0){
    80000c8e:	c8a9                	beqz	s1,80000ce0 <copyinstr+0xa0>
    va0 = PGROUNDDOWN(srcva);
    80000c90:	015bf933          	and	s2,s7,s5
    pa0 = walkaddr(pagetable, va0);
    80000c94:	85ca                	mv	a1,s2
    80000c96:	8552                	mv	a0,s4
    80000c98:	00000097          	auipc	ra,0x0
    80000c9c:	894080e7          	jalr	-1900(ra) # 8000052c <walkaddr>
    if(pa0 == 0)
    80000ca0:	c131                	beqz	a0,80000ce4 <copyinstr+0xa4>
    n = PGSIZE - (srcva - va0);
    80000ca2:	41790833          	sub	a6,s2,s7
    80000ca6:	984e                	add	a6,a6,s3
    if(n > max)
    80000ca8:	0104f363          	bgeu	s1,a6,80000cae <copyinstr+0x6e>
    80000cac:	8826                	mv	a6,s1
    char *p = (char *) (pa0 + (srcva - va0));
    80000cae:	955e                	add	a0,a0,s7
    80000cb0:	41250533          	sub	a0,a0,s2
    while(n > 0){
    80000cb4:	fc080be3          	beqz	a6,80000c8a <copyinstr+0x4a>
    80000cb8:	985a                	add	a6,a6,s6
    80000cba:	87da                	mv	a5,s6
      if(*p == '\0'){
    80000cbc:	41650633          	sub	a2,a0,s6
    80000cc0:	14fd                	addi	s1,s1,-1
    80000cc2:	9b26                	add	s6,s6,s1
    80000cc4:	00f60733          	add	a4,a2,a5
    80000cc8:	00074703          	lbu	a4,0(a4)
    80000ccc:	df49                	beqz	a4,80000c66 <copyinstr+0x26>
        *dst = *p;
    80000cce:	00e78023          	sb	a4,0(a5)
      --max;
    80000cd2:	40fb04b3          	sub	s1,s6,a5
      dst++;
    80000cd6:	0785                	addi	a5,a5,1
    while(n > 0){
    80000cd8:	ff0796e3          	bne	a5,a6,80000cc4 <copyinstr+0x84>
      dst++;
    80000cdc:	8b42                	mv	s6,a6
    80000cde:	b775                	j	80000c8a <copyinstr+0x4a>
    80000ce0:	4781                	li	a5,0
    80000ce2:	b769                	j	80000c6c <copyinstr+0x2c>
      return -1;
    80000ce4:	557d                	li	a0,-1
    80000ce6:	b779                	j	80000c74 <copyinstr+0x34>
  int got_null = 0;
    80000ce8:	4781                	li	a5,0
  if(got_null){
    80000cea:	0017b793          	seqz	a5,a5
    80000cee:	40f00533          	neg	a0,a5
}
    80000cf2:	8082                	ret

0000000080000cf4 <madvise>:

/* NTU OS 2024 */
/* Map pages to physical memory or swap space. */
int madvise(uint64 base, uint64 len, int advice) {
    80000cf4:	715d                	addi	sp,sp,-80
    80000cf6:	e486                	sd	ra,72(sp)
    80000cf8:	e0a2                	sd	s0,64(sp)
    80000cfa:	fc26                	sd	s1,56(sp)
    80000cfc:	f84a                	sd	s2,48(sp)
    80000cfe:	f44e                	sd	s3,40(sp)
    80000d00:	f052                	sd	s4,32(sp)
    80000d02:	ec56                	sd	s5,24(sp)
    80000d04:	e85a                	sd	s6,16(sp)
    80000d06:	e45e                	sd	s7,8(sp)
    80000d08:	e062                	sd	s8,0(sp)
    80000d0a:	0880                	addi	s0,sp,80
    80000d0c:	84aa                	mv	s1,a0
    80000d0e:	89ae                	mv	s3,a1
    80000d10:	8ab2                	mv	s5,a2
  struct proc *p = myproc();
    80000d12:	00000097          	auipc	ra,0x0
    80000d16:	75a080e7          	jalr	1882(ra) # 8000146c <myproc>
  pagetable_t pgtbl = p->pagetable;

  if (base > p->sz || (base + len) > p->sz) {
    80000d1a:	6538                	ld	a4,72(a0)
    80000d1c:	24976963          	bltu	a4,s1,80000f6e <madvise+0x27a>
    80000d20:	87aa                	mv	a5,a0
    80000d22:	01348933          	add	s2,s1,s3
    80000d26:	25276663          	bltu	a4,s2,80000f72 <madvise+0x27e>
    return -1;
  }

  if (len == 0) {
    return 0;
    80000d2a:	4501                	li	a0,0
  if (len == 0) {
    80000d2c:	22098563          	beqz	s3,80000f56 <madvise+0x262>
  uint64 begin = PGROUNDDOWN(base);
  uint64 last = PGROUNDDOWN(base + len - 1);

  if (advice == MADV_NORMAL) { // Expands to 0
    // TODO
    return 0;
    80000d30:	8556                	mv	a0,s5
  if (advice == MADV_NORMAL) { // Expands to 0
    80000d32:	220a8263          	beqz	s5,80000f56 <madvise+0x262>
  pagetable_t pgtbl = p->pagetable;
    80000d36:	0507ba03          	ld	s4,80(a5)
  uint64 begin = PGROUNDDOWN(base);
    80000d3a:	77fd                	lui	a5,0xfffff
    80000d3c:	8cfd                	and	s1,s1,a5
  uint64 last = PGROUNDDOWN(base + len - 1);
    80000d3e:	197d                	addi	s2,s2,-1
    80000d40:	00f97933          	and	s2,s2,a5
  } 
  else if (advice == MADV_WILLNEED) { // Expands to 1
    80000d44:	4785                	li	a5,1
    80000d46:	00fa8f63          	beq	s5,a5,80000d64 <madvise+0x70>
    }

    end_op();
    return 0;
  } 
  else if (advice == MADV_DONTNEED) { // Expands to 2. Do not expect any access in the near future.
    80000d4a:	4789                	li	a5,2
    80000d4c:	10fa8763          	beq	s5,a5,80000e5a <madvise+0x166>
    }

    end_op();
    return 0;
  } 
  else if(advice == MADV_PIN) { // Expands to 3
    80000d50:	478d                	li	a5,3
    80000d52:	1afa8563          	beq	s5,a5,80000efc <madvise+0x208>
        *pte |= PTE_P;
      }
    }
    
  } 
  else if(advice == MADV_UNPIN) { // Expands to 4
    80000d56:	4791                	li	a5,4
    80000d58:	22fa9163          	bne	s5,a5,80000f7a <madvise+0x286>
    // TODO
    for (uint64 va = begin; va <= last; va += PGSIZE) {
    80000d5c:	22996163          	bltu	s2,s1,80000f7e <madvise+0x28a>
    80000d60:	6985                	lui	s3,0x1
    80000d62:	aac9                	j	80000f34 <madvise+0x240>
    begin_op();
    80000d64:	00003097          	auipc	ra,0x3
    80000d68:	f5c080e7          	jalr	-164(ra) # 80003cc0 <begin_op>
    for (uint64 va = begin; va <= last; va += PGSIZE) {
    80000d6c:	0e996163          	bltu	s2,s1,80000e4e <madvise+0x15a>
        if (q_empty(q)) q_init(q, pgtbl);          
    80000d70:	00008a97          	auipc	s5,0x8
    80000d74:	2a0a8a93          	addi	s5,s5,672 # 80009010 <q>
        if (idx != -1);
    80000d78:	5b7d                	li	s6,-1
    80000d7a:	a81d                	j	80000db0 <madvise+0xbc>
          end_op();
    80000d7c:	00003097          	auipc	ra,0x3
    80000d80:	fc4080e7          	jalr	-60(ra) # 80003d40 <end_op>
          return -1;
    80000d84:	557d                	li	a0,-1
    80000d86:	aac1                	j	80000f56 <madvise+0x262>
        if (q_empty(q)) q_init(q, pgtbl);          
    80000d88:	85d2                	mv	a1,s4
    80000d8a:	000ab503          	ld	a0,0(s5)
    80000d8e:	00005097          	auipc	ra,0x5
    80000d92:	3de080e7          	jalr	990(ra) # 8000616c <q_init>
        int idx = q_find(q, pte);
    80000d96:	85ce                	mv	a1,s3
    80000d98:	000ab503          	ld	a0,0(s5)
    80000d9c:	00005097          	auipc	ra,0x5
    80000da0:	2fe080e7          	jalr	766(ra) # 8000609a <q_find>
        if (idx != -1);
    80000da4:	07650763          	beq	a0,s6,80000e12 <madvise+0x11e>
    for (uint64 va = begin; va <= last; va += PGSIZE) {
    80000da8:	6785                	lui	a5,0x1
    80000daa:	94be                	add	s1,s1,a5
    80000dac:	0a996163          	bltu	s2,s1,80000e4e <madvise+0x15a>
      uint64 blk = balloc_page(ROOTDEV);
    80000db0:	4505                	li	a0,1
    80000db2:	00003097          	auipc	ra,0x3
    80000db6:	b9a080e7          	jalr	-1126(ra) # 8000394c <balloc_page>
    80000dba:	00050b9b          	sext.w	s7,a0
      pte_t *pte = walk(pgtbl, va, 0);
    80000dbe:	4601                	li	a2,0
    80000dc0:	85a6                	mv	a1,s1
    80000dc2:	8552                	mv	a0,s4
    80000dc4:	fffff097          	auipc	ra,0xfffff
    80000dc8:	69c080e7          	jalr	1692(ra) # 80000460 <walk>
    80000dcc:	89aa                	mv	s3,a0
      if (pte != 0 && !(*pte & PTE_V)) {
    80000dce:	dd69                	beqz	a0,80000da8 <madvise+0xb4>
    80000dd0:	611c                	ld	a5,0(a0)
    80000dd2:	8b85                	andi	a5,a5,1
    80000dd4:	fbf1                	bnez	a5,80000da8 <madvise+0xb4>
        char *pa = kalloc();
    80000dd6:	fffff097          	auipc	ra,0xfffff
    80000dda:	342080e7          	jalr	834(ra) # 80000118 <kalloc>
    80000dde:	8c2a                	mv	s8,a0
        if (pa == 0) {
    80000de0:	dd51                	beqz	a0,80000d7c <madvise+0x88>
        read_page_from_disk(ROOTDEV, pa, blk);
    80000de2:	865e                	mv	a2,s7
    80000de4:	85aa                	mv	a1,a0
    80000de6:	4505                	li	a0,1
    80000de8:	00002097          	auipc	ra,0x2
    80000dec:	d8c080e7          	jalr	-628(ra) # 80002b74 <read_page_from_disk>
        mappages(pgtbl, va, PGSIZE, (uint64)pa, PTE_U|PTE_R|PTE_W|PTE_X);
    80000df0:	4779                	li	a4,30
    80000df2:	86e2                	mv	a3,s8
    80000df4:	6605                	lui	a2,0x1
    80000df6:	85a6                	mv	a1,s1
    80000df8:	8552                	mv	a0,s4
    80000dfa:	fffff097          	auipc	ra,0xfffff
    80000dfe:	774080e7          	jalr	1908(ra) # 8000056e <mappages>
        if (q_empty(q)) q_init(q, pgtbl);          
    80000e02:	000ab503          	ld	a0,0(s5)
    80000e06:	00005097          	auipc	ra,0x5
    80000e0a:	23c080e7          	jalr	572(ra) # 80006042 <q_empty>
    80000e0e:	d541                	beqz	a0,80000d96 <madvise+0xa2>
    80000e10:	bfa5                	j	80000d88 <madvise+0x94>
        else if (q_full(q)) {
    80000e12:	000ab503          	ld	a0,0(s5)
    80000e16:	00005097          	auipc	ra,0x5
    80000e1a:	23e080e7          	jalr	574(ra) # 80006054 <q_full>
    80000e1e:	c105                	beqz	a0,80000e3e <madvise+0x14a>
          q_pop_idx(q, 0);
    80000e20:	4581                	li	a1,0
    80000e22:	000ab503          	ld	a0,0(s5)
    80000e26:	00005097          	auipc	ra,0x5
    80000e2a:	1aa080e7          	jalr	426(ra) # 80005fd0 <q_pop_idx>
          q_push(q, pte);
    80000e2e:	85ce                	mv	a1,s3
    80000e30:	000ab503          	ld	a0,0(s5)
    80000e34:	00005097          	auipc	ra,0x5
    80000e38:	172080e7          	jalr	370(ra) # 80005fa6 <q_push>
    80000e3c:	b7b5                	j	80000da8 <madvise+0xb4>
          q_push(q, pte);
    80000e3e:	85ce                	mv	a1,s3
    80000e40:	000ab503          	ld	a0,0(s5)
    80000e44:	00005097          	auipc	ra,0x5
    80000e48:	162080e7          	jalr	354(ra) # 80005fa6 <q_push>
    80000e4c:	bfb1                	j	80000da8 <madvise+0xb4>
    end_op();
    80000e4e:	00003097          	auipc	ra,0x3
    80000e52:	ef2080e7          	jalr	-270(ra) # 80003d40 <end_op>
    return 0;
    80000e56:	4501                	li	a0,0
    80000e58:	a8fd                	j	80000f56 <madvise+0x262>
    begin_op();
    80000e5a:	00003097          	auipc	ra,0x3
    80000e5e:	e66080e7          	jalr	-410(ra) # 80003cc0 <begin_op>
    for (uint64 va = begin; va <= last; va += PGSIZE) {
    80000e62:	08996763          	bltu	s2,s1,80000ef0 <madvise+0x1fc>
        if (q_empty(q)) q_init(q, pgtbl);
    80000e66:	00008b17          	auipc	s6,0x8
    80000e6a:	1aab0b13          	addi	s6,s6,426 # 80009010 <q>
        if (idx != -1) q_pop_idx(q, idx);
    80000e6e:	5bfd                	li	s7,-1
    for (uint64 va = begin; va <= last; va += PGSIZE) {
    80000e70:	6a85                	lui	s5,0x1
    80000e72:	a80d                	j	80000ea4 <madvise+0x1b0>
          end_op();
    80000e74:	00003097          	auipc	ra,0x3
    80000e78:	ecc080e7          	jalr	-308(ra) # 80003d40 <end_op>
          return -1;
    80000e7c:	557d                	li	a0,-1
    80000e7e:	a8e1                	j	80000f56 <madvise+0x262>
        if (q_empty(q)) q_init(q, pgtbl);
    80000e80:	85d2                	mv	a1,s4
    80000e82:	000b3503          	ld	a0,0(s6)
    80000e86:	00005097          	auipc	ra,0x5
    80000e8a:	2e6080e7          	jalr	742(ra) # 8000616c <q_init>
    80000e8e:	a0b9                	j	80000edc <madvise+0x1e8>
        if (idx != -1) q_pop_idx(q, idx);
    80000e90:	85aa                	mv	a1,a0
    80000e92:	000b3503          	ld	a0,0(s6)
    80000e96:	00005097          	auipc	ra,0x5
    80000e9a:	13a080e7          	jalr	314(ra) # 80005fd0 <q_pop_idx>
    for (uint64 va = begin; va <= last; va += PGSIZE) {
    80000e9e:	94d6                	add	s1,s1,s5
    80000ea0:	04996863          	bltu	s2,s1,80000ef0 <madvise+0x1fc>
      pte = walk(pgtbl, va, 0);
    80000ea4:	4601                	li	a2,0
    80000ea6:	85a6                	mv	a1,s1
    80000ea8:	8552                	mv	a0,s4
    80000eaa:	fffff097          	auipc	ra,0xfffff
    80000eae:	5b6080e7          	jalr	1462(ra) # 80000460 <walk>
    80000eb2:	89aa                	mv	s3,a0
      if (pte != 0 && (*pte & PTE_V)) {
    80000eb4:	d56d                	beqz	a0,80000e9e <madvise+0x1aa>
    80000eb6:	611c                	ld	a5,0(a0)
    80000eb8:	8b85                	andi	a5,a5,1
    80000eba:	d3f5                	beqz	a5,80000e9e <madvise+0x1aa>
        char *pa = (char*) swap_page_from_pte(pte);
    80000ebc:	00005097          	auipc	ra,0x5
    80000ec0:	fba080e7          	jalr	-70(ra) # 80005e76 <swap_page_from_pte>
        if (pa == 0) {
    80000ec4:	d945                	beqz	a0,80000e74 <madvise+0x180>
        kfree(pa);
    80000ec6:	fffff097          	auipc	ra,0xfffff
    80000eca:	156080e7          	jalr	342(ra) # 8000001c <kfree>
        if (q_empty(q)) q_init(q, pgtbl);
    80000ece:	000b3503          	ld	a0,0(s6)
    80000ed2:	00005097          	auipc	ra,0x5
    80000ed6:	170080e7          	jalr	368(ra) # 80006042 <q_empty>
    80000eda:	f15d                	bnez	a0,80000e80 <madvise+0x18c>
        int idx = q_find(q, pte);
    80000edc:	85ce                	mv	a1,s3
    80000ede:	000b3503          	ld	a0,0(s6)
    80000ee2:	00005097          	auipc	ra,0x5
    80000ee6:	1b8080e7          	jalr	440(ra) # 8000609a <q_find>
        if (idx != -1) q_pop_idx(q, idx);
    80000eea:	fb750ae3          	beq	a0,s7,80000e9e <madvise+0x1aa>
    80000eee:	b74d                	j	80000e90 <madvise+0x19c>
    end_op();
    80000ef0:	00003097          	auipc	ra,0x3
    80000ef4:	e50080e7          	jalr	-432(ra) # 80003d40 <end_op>
    return 0;
    80000ef8:	4501                	li	a0,0
    80000efa:	a8b1                	j	80000f56 <madvise+0x262>
    for (uint64 va = begin; va <= last; va += PGSIZE) {
    80000efc:	06996d63          	bltu	s2,s1,80000f76 <madvise+0x282>
    80000f00:	6985                	lui	s3,0x1
    80000f02:	a021                	j	80000f0a <madvise+0x216>
    80000f04:	94ce                	add	s1,s1,s3
    80000f06:	02996263          	bltu	s2,s1,80000f2a <madvise+0x236>
      pte_t *pte = walk(pgtbl, va, 0);
    80000f0a:	4601                	li	a2,0
    80000f0c:	85a6                	mv	a1,s1
    80000f0e:	8552                	mv	a0,s4
    80000f10:	fffff097          	auipc	ra,0xfffff
    80000f14:	550080e7          	jalr	1360(ra) # 80000460 <walk>
      if (pte != 0 && (*pte & PTE_V)) {
    80000f18:	d575                	beqz	a0,80000f04 <madvise+0x210>
    80000f1a:	611c                	ld	a5,0(a0)
    80000f1c:	0017f713          	andi	a4,a5,1
    80000f20:	d375                	beqz	a4,80000f04 <madvise+0x210>
        *pte |= PTE_P;
    80000f22:	1007e793          	ori	a5,a5,256
    80000f26:	e11c                	sd	a5,0(a0)
    80000f28:	bff1                	j	80000f04 <madvise+0x210>
        lru_push(lru, pte);
        #endif
      }
    }
  }
  return -1;
    80000f2a:	557d                	li	a0,-1
    80000f2c:	a02d                	j	80000f56 <madvise+0x262>
    for (uint64 va = begin; va <= last; va += PGSIZE) {
    80000f2e:	94ce                	add	s1,s1,s3
    80000f30:	02996263          	bltu	s2,s1,80000f54 <madvise+0x260>
      pte_t *pte = walk(pgtbl, va, 0);
    80000f34:	4601                	li	a2,0
    80000f36:	85a6                	mv	a1,s1
    80000f38:	8552                	mv	a0,s4
    80000f3a:	fffff097          	auipc	ra,0xfffff
    80000f3e:	526080e7          	jalr	1318(ra) # 80000460 <walk>
      if (pte != 0 && (*pte & PTE_V)) {
    80000f42:	d575                	beqz	a0,80000f2e <madvise+0x23a>
    80000f44:	611c                	ld	a5,0(a0)
    80000f46:	0017f713          	andi	a4,a5,1
    80000f4a:	d375                	beqz	a4,80000f2e <madvise+0x23a>
        *pte &= ~PTE_P;
    80000f4c:	eff7f793          	andi	a5,a5,-257
    80000f50:	e11c                	sd	a5,0(a0)
    80000f52:	bff1                	j	80000f2e <madvise+0x23a>
  return -1;
    80000f54:	557d                	li	a0,-1
}
    80000f56:	60a6                	ld	ra,72(sp)
    80000f58:	6406                	ld	s0,64(sp)
    80000f5a:	74e2                	ld	s1,56(sp)
    80000f5c:	7942                	ld	s2,48(sp)
    80000f5e:	79a2                	ld	s3,40(sp)
    80000f60:	7a02                	ld	s4,32(sp)
    80000f62:	6ae2                	ld	s5,24(sp)
    80000f64:	6b42                	ld	s6,16(sp)
    80000f66:	6ba2                	ld	s7,8(sp)
    80000f68:	6c02                	ld	s8,0(sp)
    80000f6a:	6161                	addi	sp,sp,80
    80000f6c:	8082                	ret
    return -1;
    80000f6e:	557d                	li	a0,-1
    80000f70:	b7dd                	j	80000f56 <madvise+0x262>
    80000f72:	557d                	li	a0,-1
    80000f74:	b7cd                	j	80000f56 <madvise+0x262>
  return -1;
    80000f76:	557d                	li	a0,-1
    80000f78:	bff9                	j	80000f56 <madvise+0x262>
    80000f7a:	557d                	li	a0,-1
    80000f7c:	bfe9                	j	80000f56 <madvise+0x262>
    80000f7e:	557d                	li	a0,-1
    80000f80:	bfd9                	j	80000f56 <madvise+0x262>

0000000080000f82 <pgprint>:

/* NTU OS 2024 */
/* print pages from page replacement buffers */
#if defined(PG_REPLACEMENT_USE_LRU) || defined(PG_REPLACEMENT_USE_FIFO)
void pgprint() {
    80000f82:	7179                	addi	sp,sp,-48
    80000f84:	f406                	sd	ra,40(sp)
    80000f86:	f022                	sd	s0,32(sp)
    80000f88:	ec26                	sd	s1,24(sp)
    80000f8a:	e84a                	sd	s2,16(sp)
    80000f8c:	e44e                	sd	s3,8(sp)
    80000f8e:	1800                	addi	s0,sp,48
    printf("pte: %p\n", lru->bucket[i]);
  }
  printf("------End--------------\n");
  #elif defined(PG_REPLACEMENT_USE_FIFO)
  // TODO
  printf("Page replacement buffers\n");
    80000f90:	00007517          	auipc	a0,0x7
    80000f94:	1b050513          	addi	a0,a0,432 # 80008140 <etext+0x140>
    80000f98:	00005097          	auipc	ra,0x5
    80000f9c:	75a080e7          	jalr	1882(ra) # 800066f2 <printf>
  printf("------Start------------\n");
    80000fa0:	00007517          	auipc	a0,0x7
    80000fa4:	1c050513          	addi	a0,a0,448 # 80008160 <etext+0x160>
    80000fa8:	00005097          	auipc	ra,0x5
    80000fac:	74a080e7          	jalr	1866(ra) # 800066f2 <printf>
  for (int i = 0; i < q->size; i++) {
    80000fb0:	00008797          	auipc	a5,0x8
    80000fb4:	0607b783          	ld	a5,96(a5) # 80009010 <q>
    80000fb8:	4398                	lw	a4,0(a5)
    80000fba:	cf05                	beqz	a4,80000ff2 <pgprint+0x70>
    80000fbc:	4481                	li	s1,0
    printf("pte: %p\n", q->bucket[i]);
    80000fbe:	00007997          	auipc	s3,0x7
    80000fc2:	1c298993          	addi	s3,s3,450 # 80008180 <etext+0x180>
  for (int i = 0; i < q->size; i++) {
    80000fc6:	00008917          	auipc	s2,0x8
    80000fca:	04a90913          	addi	s2,s2,74 # 80009010 <q>
    printf("pte: %p\n", q->bucket[i]);
    80000fce:	00349713          	slli	a4,s1,0x3
    80000fd2:	97ba                	add	a5,a5,a4
    80000fd4:	678c                	ld	a1,8(a5)
    80000fd6:	854e                	mv	a0,s3
    80000fd8:	00005097          	auipc	ra,0x5
    80000fdc:	71a080e7          	jalr	1818(ra) # 800066f2 <printf>
  for (int i = 0; i < q->size; i++) {
    80000fe0:	0014871b          	addiw	a4,s1,1
    80000fe4:	0007049b          	sext.w	s1,a4
    80000fe8:	00093783          	ld	a5,0(s2)
    80000fec:	4394                	lw	a3,0(a5)
    80000fee:	fed4e0e3          	bltu	s1,a3,80000fce <pgprint+0x4c>
  }
  printf("------End--------------\n");
    80000ff2:	00007517          	auipc	a0,0x7
    80000ff6:	19e50513          	addi	a0,a0,414 # 80008190 <etext+0x190>
    80000ffa:	00005097          	auipc	ra,0x5
    80000ffe:	6f8080e7          	jalr	1784(ra) # 800066f2 <printf>
  #endif
}
    80001002:	70a2                	ld	ra,40(sp)
    80001004:	7402                	ld	s0,32(sp)
    80001006:	64e2                	ld	s1,24(sp)
    80001008:	6942                	ld	s2,16(sp)
    8000100a:	69a2                	ld	s3,8(sp)
    8000100c:	6145                	addi	sp,sp,48
    8000100e:	8082                	ret

0000000080001010 <calculate_va>:
#endif

/* NTU OS 2024 */
/* Print multi layer page table. */
uint64 calculate_va(int index, int level, uint64 preVa) {
    80001010:	1141                	addi	sp,sp,-16
    80001012:	e422                	sd	s0,8(sp)
    80001014:	0800                	addi	s0,sp,16
    int LEVEL = 3;
    int bits_per_level = 9;
    int offset = bits_per_level * (LEVEL - level - 1) + 12;
    80001016:	4789                	li	a5,2
    80001018:	9f8d                	subw	a5,a5,a1
    8000101a:	0037959b          	slliw	a1,a5,0x3
    8000101e:	9dbd                	addw	a1,a1,a5
    80001020:	25b1                	addiw	a1,a1,12
    uint64 va = index;
    va = va << offset;
    80001022:	00b51533          	sll	a0,a0,a1
    va += preVa;
    return va;
}
    80001026:	9532                	add	a0,a0,a2
    80001028:	6422                	ld	s0,8(sp)
    8000102a:	0141                	addi	sp,sp,16
    8000102c:	8082                	ret

000000008000102e <print_format>:

void print_format(pte_t *pte, uint64 va, int page_num, int level, int isLast){
    8000102e:	7139                	addi	sp,sp,-64
    80001030:	fc06                	sd	ra,56(sp)
    80001032:	f822                	sd	s0,48(sp)
    80001034:	f426                	sd	s1,40(sp)
    80001036:	f04a                	sd	s2,32(sp)
    80001038:	ec4e                	sd	s3,24(sp)
    8000103a:	e852                	sd	s4,16(sp)
    8000103c:	e456                	sd	s5,8(sp)
    8000103e:	e05a                	sd	s6,0(sp)
    80001040:	0080                	addi	s0,sp,64
    80001042:	89aa                	mv	s3,a0
    80001044:	8aae                	mv	s5,a1
    80001046:	8b32                	mv	s6,a2
  if (level == 0){
    80001048:	c2fd                	beqz	a3,8000112e <print_format+0x100>
    8000104a:	8936                	mv	s2,a3
    printf("+-- %d: ", page_num);
  }
  else {
    if (isLast) printf(" ");
    8000104c:	cb7d                	beqz	a4,80001142 <print_format+0x114>
    8000104e:	00007517          	auipc	a0,0x7
    80001052:	17250513          	addi	a0,a0,370 # 800081c0 <etext+0x1c0>
    80001056:	00005097          	auipc	ra,0x5
    8000105a:	69c080e7          	jalr	1692(ra) # 800066f2 <printf>
    else printf("|");
    int degree = level * 4 - 1;
    8000105e:	0029191b          	slliw	s2,s2,0x2
    80001062:	0009071b          	sext.w	a4,s2
    for (int i = 0; i < degree; i++) printf(" ");
    80001066:	4785                	li	a5,1
    80001068:	02e7d063          	bge	a5,a4,80001088 <print_format+0x5a>
    8000106c:	397d                	addiw	s2,s2,-1
    8000106e:	4481                	li	s1,0
    80001070:	00007a17          	auipc	s4,0x7
    80001074:	150a0a13          	addi	s4,s4,336 # 800081c0 <etext+0x1c0>
    80001078:	8552                	mv	a0,s4
    8000107a:	00005097          	auipc	ra,0x5
    8000107e:	678080e7          	jalr	1656(ra) # 800066f2 <printf>
    80001082:	2485                	addiw	s1,s1,1
    80001084:	ff249ae3          	bne	s1,s2,80001078 <print_format+0x4a>
    printf("+-- %d: ", page_num);
    80001088:	85da                	mv	a1,s6
    8000108a:	00007517          	auipc	a0,0x7
    8000108e:	12650513          	addi	a0,a0,294 # 800081b0 <etext+0x1b0>
    80001092:	00005097          	auipc	ra,0x5
    80001096:	660080e7          	jalr	1632(ra) # 800066f2 <printf>
  }
  if (*pte & PTE_V) {
    8000109a:	0009b683          	ld	a3,0(s3)
    8000109e:	0016f793          	andi	a5,a3,1
    800010a2:	cbcd                	beqz	a5,80001154 <print_format+0x126>
    printf("pte=%p va=%p pa=%p", pte, va, PTE2PA(*pte));
    800010a4:	82a9                	srli	a3,a3,0xa
    800010a6:	06b2                	slli	a3,a3,0xc
    800010a8:	8656                	mv	a2,s5
    800010aa:	85ce                	mv	a1,s3
    800010ac:	00007517          	auipc	a0,0x7
    800010b0:	12450513          	addi	a0,a0,292 # 800081d0 <etext+0x1d0>
    800010b4:	00005097          	auipc	ra,0x5
    800010b8:	63e080e7          	jalr	1598(ra) # 800066f2 <printf>
    printf(" V");
    800010bc:	00007517          	auipc	a0,0x7
    800010c0:	12c50513          	addi	a0,a0,300 # 800081e8 <etext+0x1e8>
    800010c4:	00005097          	auipc	ra,0x5
    800010c8:	62e080e7          	jalr	1582(ra) # 800066f2 <printf>
  }
  else{
    printf("pte=%p va=%p blockno=%p", pte, va, PTE2BLOCKNO(*pte));
  }
  if (*pte & PTE_R) printf(" R");
    800010cc:	0009b783          	ld	a5,0(s3)
    800010d0:	8b89                	andi	a5,a5,2
    800010d2:	efc9                	bnez	a5,8000116c <print_format+0x13e>
  if (*pte & PTE_W) printf(" W");
    800010d4:	0009b783          	ld	a5,0(s3)
    800010d8:	8b91                	andi	a5,a5,4
    800010da:	e3d5                	bnez	a5,8000117e <print_format+0x150>
  if (*pte & PTE_X) printf(" X");
    800010dc:	0009b783          	ld	a5,0(s3)
    800010e0:	8ba1                	andi	a5,a5,8
    800010e2:	e7dd                	bnez	a5,80001190 <print_format+0x162>
  if (*pte & PTE_U) printf(" U");
    800010e4:	0009b783          	ld	a5,0(s3)
    800010e8:	8bc1                	andi	a5,a5,16
    800010ea:	efc5                	bnez	a5,800011a2 <print_format+0x174>
  if (*pte & PTE_D) printf(" D");
    800010ec:	0009b783          	ld	a5,0(s3)
    800010f0:	0807f793          	andi	a5,a5,128
    800010f4:	e3e1                	bnez	a5,800011b4 <print_format+0x186>
  if (*pte & PTE_S) printf(" S");
    800010f6:	0009b783          	ld	a5,0(s3)
    800010fa:	2007f793          	andi	a5,a5,512
    800010fe:	e7e1                	bnez	a5,800011c6 <print_format+0x198>
  if (*pte & PTE_P) printf(" P");
    80001100:	0009b783          	ld	a5,0(s3)
    80001104:	1007f793          	andi	a5,a5,256
    80001108:	ebe1                	bnez	a5,800011d8 <print_format+0x1aa>

  printf("\n");
    8000110a:	00007517          	auipc	a0,0x7
    8000110e:	f3e50513          	addi	a0,a0,-194 # 80008048 <etext+0x48>
    80001112:	00005097          	auipc	ra,0x5
    80001116:	5e0080e7          	jalr	1504(ra) # 800066f2 <printf>
}
    8000111a:	70e2                	ld	ra,56(sp)
    8000111c:	7442                	ld	s0,48(sp)
    8000111e:	74a2                	ld	s1,40(sp)
    80001120:	7902                	ld	s2,32(sp)
    80001122:	69e2                	ld	s3,24(sp)
    80001124:	6a42                	ld	s4,16(sp)
    80001126:	6aa2                	ld	s5,8(sp)
    80001128:	6b02                	ld	s6,0(sp)
    8000112a:	6121                	addi	sp,sp,64
    8000112c:	8082                	ret
    printf("+-- %d: ", page_num);
    8000112e:	85b2                	mv	a1,a2
    80001130:	00007517          	auipc	a0,0x7
    80001134:	08050513          	addi	a0,a0,128 # 800081b0 <etext+0x1b0>
    80001138:	00005097          	auipc	ra,0x5
    8000113c:	5ba080e7          	jalr	1466(ra) # 800066f2 <printf>
    80001140:	bfa9                	j	8000109a <print_format+0x6c>
    else printf("|");
    80001142:	00007517          	auipc	a0,0x7
    80001146:	08650513          	addi	a0,a0,134 # 800081c8 <etext+0x1c8>
    8000114a:	00005097          	auipc	ra,0x5
    8000114e:	5a8080e7          	jalr	1448(ra) # 800066f2 <printf>
    80001152:	b731                	j	8000105e <print_format+0x30>
    printf("pte=%p va=%p blockno=%p", pte, va, PTE2BLOCKNO(*pte));
    80001154:	82a9                	srli	a3,a3,0xa
    80001156:	8656                	mv	a2,s5
    80001158:	85ce                	mv	a1,s3
    8000115a:	00007517          	auipc	a0,0x7
    8000115e:	09650513          	addi	a0,a0,150 # 800081f0 <etext+0x1f0>
    80001162:	00005097          	auipc	ra,0x5
    80001166:	590080e7          	jalr	1424(ra) # 800066f2 <printf>
    8000116a:	b78d                	j	800010cc <print_format+0x9e>
  if (*pte & PTE_R) printf(" R");
    8000116c:	00007517          	auipc	a0,0x7
    80001170:	09c50513          	addi	a0,a0,156 # 80008208 <etext+0x208>
    80001174:	00005097          	auipc	ra,0x5
    80001178:	57e080e7          	jalr	1406(ra) # 800066f2 <printf>
    8000117c:	bfa1                	j	800010d4 <print_format+0xa6>
  if (*pte & PTE_W) printf(" W");
    8000117e:	00007517          	auipc	a0,0x7
    80001182:	09250513          	addi	a0,a0,146 # 80008210 <etext+0x210>
    80001186:	00005097          	auipc	ra,0x5
    8000118a:	56c080e7          	jalr	1388(ra) # 800066f2 <printf>
    8000118e:	b7b9                	j	800010dc <print_format+0xae>
  if (*pte & PTE_X) printf(" X");
    80001190:	00007517          	auipc	a0,0x7
    80001194:	08850513          	addi	a0,a0,136 # 80008218 <etext+0x218>
    80001198:	00005097          	auipc	ra,0x5
    8000119c:	55a080e7          	jalr	1370(ra) # 800066f2 <printf>
    800011a0:	b791                	j	800010e4 <print_format+0xb6>
  if (*pte & PTE_U) printf(" U");
    800011a2:	00007517          	auipc	a0,0x7
    800011a6:	07e50513          	addi	a0,a0,126 # 80008220 <etext+0x220>
    800011aa:	00005097          	auipc	ra,0x5
    800011ae:	548080e7          	jalr	1352(ra) # 800066f2 <printf>
    800011b2:	bf2d                	j	800010ec <print_format+0xbe>
  if (*pte & PTE_D) printf(" D");
    800011b4:	00007517          	auipc	a0,0x7
    800011b8:	07450513          	addi	a0,a0,116 # 80008228 <etext+0x228>
    800011bc:	00005097          	auipc	ra,0x5
    800011c0:	536080e7          	jalr	1334(ra) # 800066f2 <printf>
    800011c4:	bf0d                	j	800010f6 <print_format+0xc8>
  if (*pte & PTE_S) printf(" S");
    800011c6:	00007517          	auipc	a0,0x7
    800011ca:	06a50513          	addi	a0,a0,106 # 80008230 <etext+0x230>
    800011ce:	00005097          	auipc	ra,0x5
    800011d2:	524080e7          	jalr	1316(ra) # 800066f2 <printf>
    800011d6:	b72d                	j	80001100 <print_format+0xd2>
  if (*pte & PTE_P) printf(" P");
    800011d8:	00007517          	auipc	a0,0x7
    800011dc:	06050513          	addi	a0,a0,96 # 80008238 <etext+0x238>
    800011e0:	00005097          	auipc	ra,0x5
    800011e4:	512080e7          	jalr	1298(ra) # 800066f2 <printf>
    800011e8:	b70d                	j	8000110a <print_format+0xdc>

00000000800011ea <vmTraversal>:

void vmTraversal(pagetable_t pagetable, int level, uint64 preVa, int last, int isLast) {
  if (level > 2) return;
    800011ea:	4789                	li	a5,2
    800011ec:	0ab7cb63          	blt	a5,a1,800012a2 <vmTraversal+0xb8>
void vmTraversal(pagetable_t pagetable, int level, uint64 preVa, int last, int isLast) {
    800011f0:	7159                	addi	sp,sp,-112
    800011f2:	f486                	sd	ra,104(sp)
    800011f4:	f0a2                	sd	s0,96(sp)
    800011f6:	eca6                	sd	s1,88(sp)
    800011f8:	e8ca                	sd	s2,80(sp)
    800011fa:	e4ce                	sd	s3,72(sp)
    800011fc:	e0d2                	sd	s4,64(sp)
    800011fe:	fc56                	sd	s5,56(sp)
    80001200:	f85a                	sd	s6,48(sp)
    80001202:	f45e                	sd	s7,40(sp)
    80001204:	f062                	sd	s8,32(sp)
    80001206:	ec66                	sd	s9,24(sp)
    80001208:	e86a                	sd	s10,16(sp)
    8000120a:	e46e                	sd	s11,8(sp)
    8000120c:	1880                	addi	s0,sp,112
    8000120e:	8b2e                	mv	s6,a1
    80001210:	8bb2                	mv	s7,a2
    80001212:	8c36                	mv	s8,a3
    80001214:	8a3a                	mv	s4,a4
    int offset = bits_per_level * (LEVEL - level - 1) + 12;
    80001216:	9f8d                	subw	a5,a5,a1
    80001218:	00379d1b          	slliw	s10,a5,0x3
    8000121c:	00fd07bb          	addw	a5,s10,a5
    80001220:	00c78d1b          	addiw	s10,a5,12
    80001224:	892a                	mv	s2,a0
    80001226:	4481                	li	s1,0
      preVa = 0;
      isLast = (i == last) ? 1 : 0;
    }
    uint64 va = calculate_va(i, level, preVa);
    print_format(pte, va, i, level, isLast);
    vmTraversal((pagetable_t)PTE2PA(*pte), level+1, va, last, isLast);
    80001228:	00158d9b          	addiw	s11,a1,1
  for (int i = 0; i < 512; i++) {
    8000122c:	20000c93          	li	s9,512
    80001230:	a825                	j	80001268 <vmTraversal+0x7e>
    va = va << offset;
    80001232:	01a499b3          	sll	s3,s1,s10
    va += preVa;
    80001236:	99de                	add	s3,s3,s7
    print_format(pte, va, i, level, isLast);
    80001238:	8752                	mv	a4,s4
    8000123a:	86da                	mv	a3,s6
    8000123c:	85ce                	mv	a1,s3
    8000123e:	8556                	mv	a0,s5
    80001240:	00000097          	auipc	ra,0x0
    80001244:	dee080e7          	jalr	-530(ra) # 8000102e <print_format>
    vmTraversal((pagetable_t)PTE2PA(*pte), level+1, va, last, isLast);
    80001248:	000ab503          	ld	a0,0(s5) # 1000 <_entry-0x7ffff000>
    8000124c:	8129                	srli	a0,a0,0xa
    8000124e:	8752                	mv	a4,s4
    80001250:	86e2                	mv	a3,s8
    80001252:	864e                	mv	a2,s3
    80001254:	85ee                	mv	a1,s11
    80001256:	0532                	slli	a0,a0,0xc
    80001258:	00000097          	auipc	ra,0x0
    8000125c:	f92080e7          	jalr	-110(ra) # 800011ea <vmTraversal>
  for (int i = 0; i < 512; i++) {
    80001260:	0485                	addi	s1,s1,1
    80001262:	0921                	addi	s2,s2,8
    80001264:	03948063          	beq	s1,s9,80001284 <vmTraversal+0x9a>
    80001268:	0004861b          	sext.w	a2,s1
    pte_t *pte = &pagetable[i];
    8000126c:	8aca                	mv	s5,s2
    if (!*pte) continue;
    8000126e:	00093783          	ld	a5,0(s2)
    80001272:	d7fd                	beqz	a5,80001260 <vmTraversal+0x76>
    if (level == 0) {
    80001274:	fa0b1fe3          	bnez	s6,80001232 <vmTraversal+0x48>
      isLast = (i == last) ? 1 : 0;
    80001278:	41860a33          	sub	s4,a2,s8
    8000127c:	001a3a13          	seqz	s4,s4
      preVa = 0;
    80001280:	4b81                	li	s7,0
    80001282:	bf45                	j	80001232 <vmTraversal+0x48>
  }
}
    80001284:	70a6                	ld	ra,104(sp)
    80001286:	7406                	ld	s0,96(sp)
    80001288:	64e6                	ld	s1,88(sp)
    8000128a:	6946                	ld	s2,80(sp)
    8000128c:	69a6                	ld	s3,72(sp)
    8000128e:	6a06                	ld	s4,64(sp)
    80001290:	7ae2                	ld	s5,56(sp)
    80001292:	7b42                	ld	s6,48(sp)
    80001294:	7ba2                	ld	s7,40(sp)
    80001296:	7c02                	ld	s8,32(sp)
    80001298:	6ce2                	ld	s9,24(sp)
    8000129a:	6d42                	ld	s10,16(sp)
    8000129c:	6da2                	ld	s11,8(sp)
    8000129e:	6165                	addi	sp,sp,112
    800012a0:	8082                	ret
    800012a2:	8082                	ret

00000000800012a4 <vmprint>:

void vmprint(pagetable_t pagetable) {
    800012a4:	1101                	addi	sp,sp,-32
    800012a6:	ec06                	sd	ra,24(sp)
    800012a8:	e822                	sd	s0,16(sp)
    800012aa:	e426                	sd	s1,8(sp)
    800012ac:	e04a                	sd	s2,0(sp)
    800012ae:	1000                	addi	s0,sp,32
    800012b0:	892a                	mv	s2,a0
  /* TODO */
  int last = 0;
  for (int i = 0; i < 512; i++) if (pagetable[i]) last = i;
    800012b2:	872a                	mv	a4,a0
    800012b4:	4781                	li	a5,0
  int last = 0;
    800012b6:	4481                	li	s1,0
  for (int i = 0; i < 512; i++) if (pagetable[i]) last = i;
    800012b8:	20000613          	li	a2,512
    800012bc:	a029                	j	800012c6 <vmprint+0x22>
    800012be:	2785                	addiw	a5,a5,1
    800012c0:	0721                	addi	a4,a4,8
    800012c2:	00c78663          	beq	a5,a2,800012ce <vmprint+0x2a>
    800012c6:	6314                	ld	a3,0(a4)
    800012c8:	dafd                	beqz	a3,800012be <vmprint+0x1a>
    800012ca:	84be                	mv	s1,a5
    800012cc:	bfcd                	j	800012be <vmprint+0x1a>
  printf("page table %p\n", pagetable);
    800012ce:	85ca                	mv	a1,s2
    800012d0:	00007517          	auipc	a0,0x7
    800012d4:	f7050513          	addi	a0,a0,-144 # 80008240 <etext+0x240>
    800012d8:	00005097          	auipc	ra,0x5
    800012dc:	41a080e7          	jalr	1050(ra) # 800066f2 <printf>
  vmTraversal(pagetable, 0, 0, last, 0);
    800012e0:	4701                	li	a4,0
    800012e2:	86a6                	mv	a3,s1
    800012e4:	4601                	li	a2,0
    800012e6:	4581                	li	a1,0
    800012e8:	854a                	mv	a0,s2
    800012ea:	00000097          	auipc	ra,0x0
    800012ee:	f00080e7          	jalr	-256(ra) # 800011ea <vmTraversal>
}
    800012f2:	60e2                	ld	ra,24(sp)
    800012f4:	6442                	ld	s0,16(sp)
    800012f6:	64a2                	ld	s1,8(sp)
    800012f8:	6902                	ld	s2,0(sp)
    800012fa:	6105                	addi	sp,sp,32
    800012fc:	8082                	ret

00000000800012fe <proc_mapstacks>:

// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl) {
    800012fe:	7139                	addi	sp,sp,-64
    80001300:	fc06                	sd	ra,56(sp)
    80001302:	f822                	sd	s0,48(sp)
    80001304:	f426                	sd	s1,40(sp)
    80001306:	f04a                	sd	s2,32(sp)
    80001308:	ec4e                	sd	s3,24(sp)
    8000130a:	e852                	sd	s4,16(sp)
    8000130c:	e456                	sd	s5,8(sp)
    8000130e:	e05a                	sd	s6,0(sp)
    80001310:	0080                	addi	s0,sp,64
    80001312:	89aa                	mv	s3,a0
  struct proc *p;
  for(p = proc; p < &proc[NPROC]; p++) {
    80001314:	00008497          	auipc	s1,0x8
    80001318:	17c48493          	addi	s1,s1,380 # 80009490 <proc>
    char *pa = kalloc();
    if(pa == 0)
      panic("kalloc");
    uint64 va = KSTACK((int) (p - proc));
    8000131c:	8b26                	mv	s6,s1
    8000131e:	00007a97          	auipc	s5,0x7
    80001322:	ce2a8a93          	addi	s5,s5,-798 # 80008000 <etext>
    80001326:	01000937          	lui	s2,0x1000
    8000132a:	197d                	addi	s2,s2,-1
    8000132c:	093a                	slli	s2,s2,0xe
  for(p = proc; p < &proc[NPROC]; p++) {
    8000132e:	0000ea17          	auipc	s4,0xe
    80001332:	b62a0a13          	addi	s4,s4,-1182 # 8000ee90 <tickslock>
    char *pa = kalloc();
    80001336:	fffff097          	auipc	ra,0xfffff
    8000133a:	de2080e7          	jalr	-542(ra) # 80000118 <kalloc>
    8000133e:	862a                	mv	a2,a0
    if(pa == 0)
    80001340:	c129                	beqz	a0,80001382 <proc_mapstacks+0x84>
    uint64 va = KSTACK((int) (p - proc));
    80001342:	416485b3          	sub	a1,s1,s6
    80001346:	858d                	srai	a1,a1,0x3
    80001348:	000ab783          	ld	a5,0(s5)
    8000134c:	02f585b3          	mul	a1,a1,a5
    80001350:	00d5959b          	slliw	a1,a1,0xd
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    80001354:	4719                	li	a4,6
    80001356:	6685                	lui	a3,0x1
    80001358:	40b905b3          	sub	a1,s2,a1
    8000135c:	854e                	mv	a0,s3
    8000135e:	fffff097          	auipc	ra,0xfffff
    80001362:	2b0080e7          	jalr	688(ra) # 8000060e <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    80001366:	16848493          	addi	s1,s1,360
    8000136a:	fd4496e3          	bne	s1,s4,80001336 <proc_mapstacks+0x38>
  }
}
    8000136e:	70e2                	ld	ra,56(sp)
    80001370:	7442                	ld	s0,48(sp)
    80001372:	74a2                	ld	s1,40(sp)
    80001374:	7902                	ld	s2,32(sp)
    80001376:	69e2                	ld	s3,24(sp)
    80001378:	6a42                	ld	s4,16(sp)
    8000137a:	6aa2                	ld	s5,8(sp)
    8000137c:	6b02                	ld	s6,0(sp)
    8000137e:	6121                	addi	sp,sp,64
    80001380:	8082                	ret
      panic("kalloc");
    80001382:	00007517          	auipc	a0,0x7
    80001386:	ece50513          	addi	a0,a0,-306 # 80008250 <etext+0x250>
    8000138a:	00005097          	auipc	ra,0x5
    8000138e:	31e080e7          	jalr	798(ra) # 800066a8 <panic>

0000000080001392 <procinit>:

// initialize the proc table at boot time.
void
procinit(void)
{
    80001392:	7139                	addi	sp,sp,-64
    80001394:	fc06                	sd	ra,56(sp)
    80001396:	f822                	sd	s0,48(sp)
    80001398:	f426                	sd	s1,40(sp)
    8000139a:	f04a                	sd	s2,32(sp)
    8000139c:	ec4e                	sd	s3,24(sp)
    8000139e:	e852                	sd	s4,16(sp)
    800013a0:	e456                	sd	s5,8(sp)
    800013a2:	e05a                	sd	s6,0(sp)
    800013a4:	0080                	addi	s0,sp,64
  struct proc *p;
  initlock(&pid_lock, "nextpid");
    800013a6:	00007597          	auipc	a1,0x7
    800013aa:	eb258593          	addi	a1,a1,-334 # 80008258 <etext+0x258>
    800013ae:	00008517          	auipc	a0,0x8
    800013b2:	cb250513          	addi	a0,a0,-846 # 80009060 <pid_lock>
    800013b6:	00005097          	auipc	ra,0x5
    800013ba:	7ac080e7          	jalr	1964(ra) # 80006b62 <initlock>
  initlock(&wait_lock, "wait_lock");
    800013be:	00007597          	auipc	a1,0x7
    800013c2:	ea258593          	addi	a1,a1,-350 # 80008260 <etext+0x260>
    800013c6:	00008517          	auipc	a0,0x8
    800013ca:	cb250513          	addi	a0,a0,-846 # 80009078 <wait_lock>
    800013ce:	00005097          	auipc	ra,0x5
    800013d2:	794080e7          	jalr	1940(ra) # 80006b62 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    800013d6:	00008497          	auipc	s1,0x8
    800013da:	0ba48493          	addi	s1,s1,186 # 80009490 <proc>
      initlock(&p->lock, "proc");
    800013de:	00007b17          	auipc	s6,0x7
    800013e2:	e92b0b13          	addi	s6,s6,-366 # 80008270 <etext+0x270>
      p->kstack = KSTACK((int) (p - proc));
    800013e6:	8aa6                	mv	s5,s1
    800013e8:	00007a17          	auipc	s4,0x7
    800013ec:	c18a0a13          	addi	s4,s4,-1000 # 80008000 <etext>
    800013f0:	01000937          	lui	s2,0x1000
    800013f4:	197d                	addi	s2,s2,-1
    800013f6:	093a                	slli	s2,s2,0xe
  for(p = proc; p < &proc[NPROC]; p++) {
    800013f8:	0000e997          	auipc	s3,0xe
    800013fc:	a9898993          	addi	s3,s3,-1384 # 8000ee90 <tickslock>
      initlock(&p->lock, "proc");
    80001400:	85da                	mv	a1,s6
    80001402:	8526                	mv	a0,s1
    80001404:	00005097          	auipc	ra,0x5
    80001408:	75e080e7          	jalr	1886(ra) # 80006b62 <initlock>
      p->kstack = KSTACK((int) (p - proc));
    8000140c:	415487b3          	sub	a5,s1,s5
    80001410:	878d                	srai	a5,a5,0x3
    80001412:	000a3703          	ld	a4,0(s4)
    80001416:	02e787b3          	mul	a5,a5,a4
    8000141a:	00d7979b          	slliw	a5,a5,0xd
    8000141e:	40f907b3          	sub	a5,s2,a5
    80001422:	e0bc                	sd	a5,64(s1)
  for(p = proc; p < &proc[NPROC]; p++) {
    80001424:	16848493          	addi	s1,s1,360
    80001428:	fd349ce3          	bne	s1,s3,80001400 <procinit+0x6e>
  }
}
    8000142c:	70e2                	ld	ra,56(sp)
    8000142e:	7442                	ld	s0,48(sp)
    80001430:	74a2                	ld	s1,40(sp)
    80001432:	7902                	ld	s2,32(sp)
    80001434:	69e2                	ld	s3,24(sp)
    80001436:	6a42                	ld	s4,16(sp)
    80001438:	6aa2                	ld	s5,8(sp)
    8000143a:	6b02                	ld	s6,0(sp)
    8000143c:	6121                	addi	sp,sp,64
    8000143e:	8082                	ret

0000000080001440 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    80001440:	1141                	addi	sp,sp,-16
    80001442:	e422                	sd	s0,8(sp)
    80001444:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80001446:	8512                	mv	a0,tp
  int id = r_tp();
  return id;
}
    80001448:	2501                	sext.w	a0,a0
    8000144a:	6422                	ld	s0,8(sp)
    8000144c:	0141                	addi	sp,sp,16
    8000144e:	8082                	ret

0000000080001450 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
    80001450:	1141                	addi	sp,sp,-16
    80001452:	e422                	sd	s0,8(sp)
    80001454:	0800                	addi	s0,sp,16
    80001456:	8792                	mv	a5,tp
  int id = cpuid();
  struct cpu *c = &cpus[id];
    80001458:	2781                	sext.w	a5,a5
    8000145a:	079e                	slli	a5,a5,0x7
  return c;
}
    8000145c:	00008517          	auipc	a0,0x8
    80001460:	c3450513          	addi	a0,a0,-972 # 80009090 <cpus>
    80001464:	953e                	add	a0,a0,a5
    80001466:	6422                	ld	s0,8(sp)
    80001468:	0141                	addi	sp,sp,16
    8000146a:	8082                	ret

000000008000146c <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
    8000146c:	1101                	addi	sp,sp,-32
    8000146e:	ec06                	sd	ra,24(sp)
    80001470:	e822                	sd	s0,16(sp)
    80001472:	e426                	sd	s1,8(sp)
    80001474:	1000                	addi	s0,sp,32
  push_off();
    80001476:	00005097          	auipc	ra,0x5
    8000147a:	730080e7          	jalr	1840(ra) # 80006ba6 <push_off>
    8000147e:	8792                	mv	a5,tp
  struct cpu *c = mycpu();
  struct proc *p = c->proc;
    80001480:	2781                	sext.w	a5,a5
    80001482:	079e                	slli	a5,a5,0x7
    80001484:	00008717          	auipc	a4,0x8
    80001488:	bdc70713          	addi	a4,a4,-1060 # 80009060 <pid_lock>
    8000148c:	97ba                	add	a5,a5,a4
    8000148e:	7b84                	ld	s1,48(a5)
  pop_off();
    80001490:	00005097          	auipc	ra,0x5
    80001494:	7b6080e7          	jalr	1974(ra) # 80006c46 <pop_off>
  return p;
}
    80001498:	8526                	mv	a0,s1
    8000149a:	60e2                	ld	ra,24(sp)
    8000149c:	6442                	ld	s0,16(sp)
    8000149e:	64a2                	ld	s1,8(sp)
    800014a0:	6105                	addi	sp,sp,32
    800014a2:	8082                	ret

00000000800014a4 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    800014a4:	1141                	addi	sp,sp,-16
    800014a6:	e406                	sd	ra,8(sp)
    800014a8:	e022                	sd	s0,0(sp)
    800014aa:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    800014ac:	00000097          	auipc	ra,0x0
    800014b0:	fc0080e7          	jalr	-64(ra) # 8000146c <myproc>
    800014b4:	00005097          	auipc	ra,0x5
    800014b8:	7f2080e7          	jalr	2034(ra) # 80006ca6 <release>

  if (first) {
    800014bc:	00007797          	auipc	a5,0x7
    800014c0:	5447a783          	lw	a5,1348(a5) # 80008a00 <first.1778>
    800014c4:	eb89                	bnez	a5,800014d6 <forkret+0x32>
    // be run from main().
    first = 0;
    fsinit(ROOTDEV);
  }

  usertrapret();
    800014c6:	00001097          	auipc	ra,0x1
    800014ca:	c0a080e7          	jalr	-1014(ra) # 800020d0 <usertrapret>
}
    800014ce:	60a2                	ld	ra,8(sp)
    800014d0:	6402                	ld	s0,0(sp)
    800014d2:	0141                	addi	sp,sp,16
    800014d4:	8082                	ret
    first = 0;
    800014d6:	00007797          	auipc	a5,0x7
    800014da:	5207a523          	sw	zero,1322(a5) # 80008a00 <first.1778>
    fsinit(ROOTDEV);
    800014de:	4505                	li	a0,1
    800014e0:	00002097          	auipc	ra,0x2
    800014e4:	a20080e7          	jalr	-1504(ra) # 80002f00 <fsinit>
    800014e8:	bff9                	j	800014c6 <forkret+0x22>

00000000800014ea <allocpid>:
allocpid() {
    800014ea:	1101                	addi	sp,sp,-32
    800014ec:	ec06                	sd	ra,24(sp)
    800014ee:	e822                	sd	s0,16(sp)
    800014f0:	e426                	sd	s1,8(sp)
    800014f2:	e04a                	sd	s2,0(sp)
    800014f4:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    800014f6:	00008917          	auipc	s2,0x8
    800014fa:	b6a90913          	addi	s2,s2,-1174 # 80009060 <pid_lock>
    800014fe:	854a                	mv	a0,s2
    80001500:	00005097          	auipc	ra,0x5
    80001504:	6f2080e7          	jalr	1778(ra) # 80006bf2 <acquire>
  pid = nextpid;
    80001508:	00007797          	auipc	a5,0x7
    8000150c:	4fc78793          	addi	a5,a5,1276 # 80008a04 <nextpid>
    80001510:	4384                	lw	s1,0(a5)
  nextpid = nextpid + 1;
    80001512:	0014871b          	addiw	a4,s1,1
    80001516:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80001518:	854a                	mv	a0,s2
    8000151a:	00005097          	auipc	ra,0x5
    8000151e:	78c080e7          	jalr	1932(ra) # 80006ca6 <release>
}
    80001522:	8526                	mv	a0,s1
    80001524:	60e2                	ld	ra,24(sp)
    80001526:	6442                	ld	s0,16(sp)
    80001528:	64a2                	ld	s1,8(sp)
    8000152a:	6902                	ld	s2,0(sp)
    8000152c:	6105                	addi	sp,sp,32
    8000152e:	8082                	ret

0000000080001530 <proc_pagetable>:
{
    80001530:	1101                	addi	sp,sp,-32
    80001532:	ec06                	sd	ra,24(sp)
    80001534:	e822                	sd	s0,16(sp)
    80001536:	e426                	sd	s1,8(sp)
    80001538:	e04a                	sd	s2,0(sp)
    8000153a:	1000                	addi	s0,sp,32
    8000153c:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    8000153e:	fffff097          	auipc	ra,0xfffff
    80001542:	2b2080e7          	jalr	690(ra) # 800007f0 <uvmcreate>
    80001546:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80001548:	c121                	beqz	a0,80001588 <proc_pagetable+0x58>
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    8000154a:	4729                	li	a4,10
    8000154c:	00006697          	auipc	a3,0x6
    80001550:	ab468693          	addi	a3,a3,-1356 # 80007000 <_trampoline>
    80001554:	6605                	lui	a2,0x1
    80001556:	040005b7          	lui	a1,0x4000
    8000155a:	15fd                	addi	a1,a1,-1
    8000155c:	05b2                	slli	a1,a1,0xc
    8000155e:	fffff097          	auipc	ra,0xfffff
    80001562:	010080e7          	jalr	16(ra) # 8000056e <mappages>
    80001566:	02054863          	bltz	a0,80001596 <proc_pagetable+0x66>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    8000156a:	4719                	li	a4,6
    8000156c:	05893683          	ld	a3,88(s2)
    80001570:	6605                	lui	a2,0x1
    80001572:	020005b7          	lui	a1,0x2000
    80001576:	15fd                	addi	a1,a1,-1
    80001578:	05b6                	slli	a1,a1,0xd
    8000157a:	8526                	mv	a0,s1
    8000157c:	fffff097          	auipc	ra,0xfffff
    80001580:	ff2080e7          	jalr	-14(ra) # 8000056e <mappages>
    80001584:	02054163          	bltz	a0,800015a6 <proc_pagetable+0x76>
}
    80001588:	8526                	mv	a0,s1
    8000158a:	60e2                	ld	ra,24(sp)
    8000158c:	6442                	ld	s0,16(sp)
    8000158e:	64a2                	ld	s1,8(sp)
    80001590:	6902                	ld	s2,0(sp)
    80001592:	6105                	addi	sp,sp,32
    80001594:	8082                	ret
    uvmfree(pagetable, 0);
    80001596:	4581                	li	a1,0
    80001598:	8526                	mv	a0,s1
    8000159a:	fffff097          	auipc	ra,0xfffff
    8000159e:	452080e7          	jalr	1106(ra) # 800009ec <uvmfree>
    return 0;
    800015a2:	4481                	li	s1,0
    800015a4:	b7d5                	j	80001588 <proc_pagetable+0x58>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    800015a6:	4681                	li	a3,0
    800015a8:	4605                	li	a2,1
    800015aa:	040005b7          	lui	a1,0x4000
    800015ae:	15fd                	addi	a1,a1,-1
    800015b0:	05b2                	slli	a1,a1,0xc
    800015b2:	8526                	mv	a0,s1
    800015b4:	fffff097          	auipc	ra,0xfffff
    800015b8:	180080e7          	jalr	384(ra) # 80000734 <uvmunmap>
    uvmfree(pagetable, 0);
    800015bc:	4581                	li	a1,0
    800015be:	8526                	mv	a0,s1
    800015c0:	fffff097          	auipc	ra,0xfffff
    800015c4:	42c080e7          	jalr	1068(ra) # 800009ec <uvmfree>
    return 0;
    800015c8:	4481                	li	s1,0
    800015ca:	bf7d                	j	80001588 <proc_pagetable+0x58>

00000000800015cc <proc_freepagetable>:
{
    800015cc:	1101                	addi	sp,sp,-32
    800015ce:	ec06                	sd	ra,24(sp)
    800015d0:	e822                	sd	s0,16(sp)
    800015d2:	e426                	sd	s1,8(sp)
    800015d4:	e04a                	sd	s2,0(sp)
    800015d6:	1000                	addi	s0,sp,32
    800015d8:	84aa                	mv	s1,a0
    800015da:	892e                	mv	s2,a1
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    800015dc:	4681                	li	a3,0
    800015de:	4605                	li	a2,1
    800015e0:	040005b7          	lui	a1,0x4000
    800015e4:	15fd                	addi	a1,a1,-1
    800015e6:	05b2                	slli	a1,a1,0xc
    800015e8:	fffff097          	auipc	ra,0xfffff
    800015ec:	14c080e7          	jalr	332(ra) # 80000734 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    800015f0:	4681                	li	a3,0
    800015f2:	4605                	li	a2,1
    800015f4:	020005b7          	lui	a1,0x2000
    800015f8:	15fd                	addi	a1,a1,-1
    800015fa:	05b6                	slli	a1,a1,0xd
    800015fc:	8526                	mv	a0,s1
    800015fe:	fffff097          	auipc	ra,0xfffff
    80001602:	136080e7          	jalr	310(ra) # 80000734 <uvmunmap>
  uvmfree(pagetable, sz);
    80001606:	85ca                	mv	a1,s2
    80001608:	8526                	mv	a0,s1
    8000160a:	fffff097          	auipc	ra,0xfffff
    8000160e:	3e2080e7          	jalr	994(ra) # 800009ec <uvmfree>
}
    80001612:	60e2                	ld	ra,24(sp)
    80001614:	6442                	ld	s0,16(sp)
    80001616:	64a2                	ld	s1,8(sp)
    80001618:	6902                	ld	s2,0(sp)
    8000161a:	6105                	addi	sp,sp,32
    8000161c:	8082                	ret

000000008000161e <freeproc>:
{
    8000161e:	1101                	addi	sp,sp,-32
    80001620:	ec06                	sd	ra,24(sp)
    80001622:	e822                	sd	s0,16(sp)
    80001624:	e426                	sd	s1,8(sp)
    80001626:	1000                	addi	s0,sp,32
    80001628:	84aa                	mv	s1,a0
  if(p->trapframe)
    8000162a:	6d28                	ld	a0,88(a0)
    8000162c:	c509                	beqz	a0,80001636 <freeproc+0x18>
    kfree((void*)p->trapframe);
    8000162e:	fffff097          	auipc	ra,0xfffff
    80001632:	9ee080e7          	jalr	-1554(ra) # 8000001c <kfree>
  p->trapframe = 0;
    80001636:	0404bc23          	sd	zero,88(s1)
  if(p->pagetable)
    8000163a:	68a8                	ld	a0,80(s1)
    8000163c:	c511                	beqz	a0,80001648 <freeproc+0x2a>
    proc_freepagetable(p->pagetable, p->sz);
    8000163e:	64ac                	ld	a1,72(s1)
    80001640:	00000097          	auipc	ra,0x0
    80001644:	f8c080e7          	jalr	-116(ra) # 800015cc <proc_freepagetable>
  p->pagetable = 0;
    80001648:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    8000164c:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80001650:	0204a823          	sw	zero,48(s1)
  p->parent = 0;
    80001654:	0204bc23          	sd	zero,56(s1)
  p->name[0] = 0;
    80001658:	14048c23          	sb	zero,344(s1)
  p->chan = 0;
    8000165c:	0204b023          	sd	zero,32(s1)
  p->killed = 0;
    80001660:	0204a423          	sw	zero,40(s1)
  p->xstate = 0;
    80001664:	0204a623          	sw	zero,44(s1)
  p->state = UNUSED;
    80001668:	0004ac23          	sw	zero,24(s1)
}
    8000166c:	60e2                	ld	ra,24(sp)
    8000166e:	6442                	ld	s0,16(sp)
    80001670:	64a2                	ld	s1,8(sp)
    80001672:	6105                	addi	sp,sp,32
    80001674:	8082                	ret

0000000080001676 <allocproc>:
{
    80001676:	1101                	addi	sp,sp,-32
    80001678:	ec06                	sd	ra,24(sp)
    8000167a:	e822                	sd	s0,16(sp)
    8000167c:	e426                	sd	s1,8(sp)
    8000167e:	e04a                	sd	s2,0(sp)
    80001680:	1000                	addi	s0,sp,32
  for(p = proc; p < &proc[NPROC]; p++) {
    80001682:	00008497          	auipc	s1,0x8
    80001686:	e0e48493          	addi	s1,s1,-498 # 80009490 <proc>
    8000168a:	0000e917          	auipc	s2,0xe
    8000168e:	80690913          	addi	s2,s2,-2042 # 8000ee90 <tickslock>
    acquire(&p->lock);
    80001692:	8526                	mv	a0,s1
    80001694:	00005097          	auipc	ra,0x5
    80001698:	55e080e7          	jalr	1374(ra) # 80006bf2 <acquire>
    if(p->state == UNUSED) {
    8000169c:	4c9c                	lw	a5,24(s1)
    8000169e:	cf81                	beqz	a5,800016b6 <allocproc+0x40>
      release(&p->lock);
    800016a0:	8526                	mv	a0,s1
    800016a2:	00005097          	auipc	ra,0x5
    800016a6:	604080e7          	jalr	1540(ra) # 80006ca6 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    800016aa:	16848493          	addi	s1,s1,360
    800016ae:	ff2492e3          	bne	s1,s2,80001692 <allocproc+0x1c>
  return 0;
    800016b2:	4481                	li	s1,0
    800016b4:	a889                	j	80001706 <allocproc+0x90>
  p->pid = allocpid();
    800016b6:	00000097          	auipc	ra,0x0
    800016ba:	e34080e7          	jalr	-460(ra) # 800014ea <allocpid>
    800016be:	d888                	sw	a0,48(s1)
  p->state = USED;
    800016c0:	4785                	li	a5,1
    800016c2:	cc9c                	sw	a5,24(s1)
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    800016c4:	fffff097          	auipc	ra,0xfffff
    800016c8:	a54080e7          	jalr	-1452(ra) # 80000118 <kalloc>
    800016cc:	892a                	mv	s2,a0
    800016ce:	eca8                	sd	a0,88(s1)
    800016d0:	c131                	beqz	a0,80001714 <allocproc+0x9e>
  p->pagetable = proc_pagetable(p);
    800016d2:	8526                	mv	a0,s1
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	e5c080e7          	jalr	-420(ra) # 80001530 <proc_pagetable>
    800016dc:	892a                	mv	s2,a0
    800016de:	e8a8                	sd	a0,80(s1)
  if(p->pagetable == 0){
    800016e0:	c531                	beqz	a0,8000172c <allocproc+0xb6>
  memset(&p->context, 0, sizeof(p->context));
    800016e2:	07000613          	li	a2,112
    800016e6:	4581                	li	a1,0
    800016e8:	06048513          	addi	a0,s1,96
    800016ec:	fffff097          	auipc	ra,0xfffff
    800016f0:	a8c080e7          	jalr	-1396(ra) # 80000178 <memset>
  p->context.ra = (uint64)forkret;
    800016f4:	00000797          	auipc	a5,0x0
    800016f8:	db078793          	addi	a5,a5,-592 # 800014a4 <forkret>
    800016fc:	f0bc                	sd	a5,96(s1)
  p->context.sp = p->kstack + PGSIZE;
    800016fe:	60bc                	ld	a5,64(s1)
    80001700:	6705                	lui	a4,0x1
    80001702:	97ba                	add	a5,a5,a4
    80001704:	f4bc                	sd	a5,104(s1)
}
    80001706:	8526                	mv	a0,s1
    80001708:	60e2                	ld	ra,24(sp)
    8000170a:	6442                	ld	s0,16(sp)
    8000170c:	64a2                	ld	s1,8(sp)
    8000170e:	6902                	ld	s2,0(sp)
    80001710:	6105                	addi	sp,sp,32
    80001712:	8082                	ret
    freeproc(p);
    80001714:	8526                	mv	a0,s1
    80001716:	00000097          	auipc	ra,0x0
    8000171a:	f08080e7          	jalr	-248(ra) # 8000161e <freeproc>
    release(&p->lock);
    8000171e:	8526                	mv	a0,s1
    80001720:	00005097          	auipc	ra,0x5
    80001724:	586080e7          	jalr	1414(ra) # 80006ca6 <release>
    return 0;
    80001728:	84ca                	mv	s1,s2
    8000172a:	bff1                	j	80001706 <allocproc+0x90>
    freeproc(p);
    8000172c:	8526                	mv	a0,s1
    8000172e:	00000097          	auipc	ra,0x0
    80001732:	ef0080e7          	jalr	-272(ra) # 8000161e <freeproc>
    release(&p->lock);
    80001736:	8526                	mv	a0,s1
    80001738:	00005097          	auipc	ra,0x5
    8000173c:	56e080e7          	jalr	1390(ra) # 80006ca6 <release>
    return 0;
    80001740:	84ca                	mv	s1,s2
    80001742:	b7d1                	j	80001706 <allocproc+0x90>

0000000080001744 <userinit>:
{
    80001744:	1101                	addi	sp,sp,-32
    80001746:	ec06                	sd	ra,24(sp)
    80001748:	e822                	sd	s0,16(sp)
    8000174a:	e426                	sd	s1,8(sp)
    8000174c:	1000                	addi	s0,sp,32
  p = allocproc();
    8000174e:	00000097          	auipc	ra,0x0
    80001752:	f28080e7          	jalr	-216(ra) # 80001676 <allocproc>
    80001756:	84aa                	mv	s1,a0
  initproc = p;
    80001758:	00008797          	auipc	a5,0x8
    8000175c:	8ca7b023          	sd	a0,-1856(a5) # 80009018 <initproc>
  uvminit(p->pagetable, initcode, sizeof(initcode));
    80001760:	03400613          	li	a2,52
    80001764:	00007597          	auipc	a1,0x7
    80001768:	2ac58593          	addi	a1,a1,684 # 80008a10 <initcode>
    8000176c:	6928                	ld	a0,80(a0)
    8000176e:	fffff097          	auipc	ra,0xfffff
    80001772:	0b0080e7          	jalr	176(ra) # 8000081e <uvminit>
  p->sz = PGSIZE;
    80001776:	6785                	lui	a5,0x1
    80001778:	e4bc                	sd	a5,72(s1)
  p->trapframe->epc = 0;      // user program counter
    8000177a:	6cb8                	ld	a4,88(s1)
    8000177c:	00073c23          	sd	zero,24(a4) # 1018 <_entry-0x7fffefe8>
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80001780:	6cb8                	ld	a4,88(s1)
    80001782:	fb1c                	sd	a5,48(a4)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80001784:	4641                	li	a2,16
    80001786:	00007597          	auipc	a1,0x7
    8000178a:	af258593          	addi	a1,a1,-1294 # 80008278 <etext+0x278>
    8000178e:	15848513          	addi	a0,s1,344
    80001792:	fffff097          	auipc	ra,0xfffff
    80001796:	b38080e7          	jalr	-1224(ra) # 800002ca <safestrcpy>
  p->cwd = namei("/");
    8000179a:	00007517          	auipc	a0,0x7
    8000179e:	aee50513          	addi	a0,a0,-1298 # 80008288 <etext+0x288>
    800017a2:	00002097          	auipc	ra,0x2
    800017a6:	170080e7          	jalr	368(ra) # 80003912 <namei>
    800017aa:	14a4b823          	sd	a0,336(s1)
  p->state = RUNNABLE;
    800017ae:	478d                	li	a5,3
    800017b0:	cc9c                	sw	a5,24(s1)
  release(&p->lock);
    800017b2:	8526                	mv	a0,s1
    800017b4:	00005097          	auipc	ra,0x5
    800017b8:	4f2080e7          	jalr	1266(ra) # 80006ca6 <release>
}
    800017bc:	60e2                	ld	ra,24(sp)
    800017be:	6442                	ld	s0,16(sp)
    800017c0:	64a2                	ld	s1,8(sp)
    800017c2:	6105                	addi	sp,sp,32
    800017c4:	8082                	ret

00000000800017c6 <growproc>:
{
    800017c6:	1101                	addi	sp,sp,-32
    800017c8:	ec06                	sd	ra,24(sp)
    800017ca:	e822                	sd	s0,16(sp)
    800017cc:	e426                	sd	s1,8(sp)
    800017ce:	e04a                	sd	s2,0(sp)
    800017d0:	1000                	addi	s0,sp,32
    800017d2:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	c98080e7          	jalr	-872(ra) # 8000146c <myproc>
    800017dc:	892a                	mv	s2,a0
  sz = p->sz;
    800017de:	652c                	ld	a1,72(a0)
    800017e0:	0005861b          	sext.w	a2,a1
  if(n > 0){
    800017e4:	00904f63          	bgtz	s1,80001802 <growproc+0x3c>
  } else if(n < 0){
    800017e8:	0204cc63          	bltz	s1,80001820 <growproc+0x5a>
  p->sz = sz;
    800017ec:	1602                	slli	a2,a2,0x20
    800017ee:	9201                	srli	a2,a2,0x20
    800017f0:	04c93423          	sd	a2,72(s2)
  return 0;
    800017f4:	4501                	li	a0,0
}
    800017f6:	60e2                	ld	ra,24(sp)
    800017f8:	6442                	ld	s0,16(sp)
    800017fa:	64a2                	ld	s1,8(sp)
    800017fc:	6902                	ld	s2,0(sp)
    800017fe:	6105                	addi	sp,sp,32
    80001800:	8082                	ret
    if((sz = uvmalloc(p->pagetable, sz, sz + n)) == 0) {
    80001802:	9e25                	addw	a2,a2,s1
    80001804:	1602                	slli	a2,a2,0x20
    80001806:	9201                	srli	a2,a2,0x20
    80001808:	1582                	slli	a1,a1,0x20
    8000180a:	9181                	srli	a1,a1,0x20
    8000180c:	6928                	ld	a0,80(a0)
    8000180e:	fffff097          	auipc	ra,0xfffff
    80001812:	0ca080e7          	jalr	202(ra) # 800008d8 <uvmalloc>
    80001816:	0005061b          	sext.w	a2,a0
    8000181a:	fa69                	bnez	a2,800017ec <growproc+0x26>
      return -1;
    8000181c:	557d                	li	a0,-1
    8000181e:	bfe1                	j	800017f6 <growproc+0x30>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80001820:	9e25                	addw	a2,a2,s1
    80001822:	1602                	slli	a2,a2,0x20
    80001824:	9201                	srli	a2,a2,0x20
    80001826:	1582                	slli	a1,a1,0x20
    80001828:	9181                	srli	a1,a1,0x20
    8000182a:	6928                	ld	a0,80(a0)
    8000182c:	fffff097          	auipc	ra,0xfffff
    80001830:	064080e7          	jalr	100(ra) # 80000890 <uvmdealloc>
    80001834:	0005061b          	sext.w	a2,a0
    80001838:	bf55                	j	800017ec <growproc+0x26>

000000008000183a <fork>:
{
    8000183a:	7179                	addi	sp,sp,-48
    8000183c:	f406                	sd	ra,40(sp)
    8000183e:	f022                	sd	s0,32(sp)
    80001840:	ec26                	sd	s1,24(sp)
    80001842:	e84a                	sd	s2,16(sp)
    80001844:	e44e                	sd	s3,8(sp)
    80001846:	e052                	sd	s4,0(sp)
    80001848:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    8000184a:	00000097          	auipc	ra,0x0
    8000184e:	c22080e7          	jalr	-990(ra) # 8000146c <myproc>
    80001852:	892a                	mv	s2,a0
  if((np = allocproc()) == 0){
    80001854:	00000097          	auipc	ra,0x0
    80001858:	e22080e7          	jalr	-478(ra) # 80001676 <allocproc>
    8000185c:	10050b63          	beqz	a0,80001972 <fork+0x138>
    80001860:	89aa                	mv	s3,a0
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80001862:	04893603          	ld	a2,72(s2)
    80001866:	692c                	ld	a1,80(a0)
    80001868:	05093503          	ld	a0,80(s2)
    8000186c:	fffff097          	auipc	ra,0xfffff
    80001870:	1b8080e7          	jalr	440(ra) # 80000a24 <uvmcopy>
    80001874:	04054663          	bltz	a0,800018c0 <fork+0x86>
  np->sz = p->sz;
    80001878:	04893783          	ld	a5,72(s2)
    8000187c:	04f9b423          	sd	a5,72(s3)
  *(np->trapframe) = *(p->trapframe);
    80001880:	05893683          	ld	a3,88(s2)
    80001884:	87b6                	mv	a5,a3
    80001886:	0589b703          	ld	a4,88(s3)
    8000188a:	12068693          	addi	a3,a3,288
    8000188e:	0007b803          	ld	a6,0(a5) # 1000 <_entry-0x7ffff000>
    80001892:	6788                	ld	a0,8(a5)
    80001894:	6b8c                	ld	a1,16(a5)
    80001896:	6f90                	ld	a2,24(a5)
    80001898:	01073023          	sd	a6,0(a4)
    8000189c:	e708                	sd	a0,8(a4)
    8000189e:	eb0c                	sd	a1,16(a4)
    800018a0:	ef10                	sd	a2,24(a4)
    800018a2:	02078793          	addi	a5,a5,32
    800018a6:	02070713          	addi	a4,a4,32
    800018aa:	fed792e3          	bne	a5,a3,8000188e <fork+0x54>
  np->trapframe->a0 = 0;
    800018ae:	0589b783          	ld	a5,88(s3)
    800018b2:	0607b823          	sd	zero,112(a5)
    800018b6:	0d000493          	li	s1,208
  for(i = 0; i < NOFILE; i++)
    800018ba:	15000a13          	li	s4,336
    800018be:	a03d                	j	800018ec <fork+0xb2>
    freeproc(np);
    800018c0:	854e                	mv	a0,s3
    800018c2:	00000097          	auipc	ra,0x0
    800018c6:	d5c080e7          	jalr	-676(ra) # 8000161e <freeproc>
    release(&np->lock);
    800018ca:	854e                	mv	a0,s3
    800018cc:	00005097          	auipc	ra,0x5
    800018d0:	3da080e7          	jalr	986(ra) # 80006ca6 <release>
    return -1;
    800018d4:	5a7d                	li	s4,-1
    800018d6:	a069                	j	80001960 <fork+0x126>
      np->ofile[i] = filedup(p->ofile[i]);
    800018d8:	00003097          	auipc	ra,0x3
    800018dc:	862080e7          	jalr	-1950(ra) # 8000413a <filedup>
    800018e0:	009987b3          	add	a5,s3,s1
    800018e4:	e388                	sd	a0,0(a5)
  for(i = 0; i < NOFILE; i++)
    800018e6:	04a1                	addi	s1,s1,8
    800018e8:	01448763          	beq	s1,s4,800018f6 <fork+0xbc>
    if(p->ofile[i])
    800018ec:	009907b3          	add	a5,s2,s1
    800018f0:	6388                	ld	a0,0(a5)
    800018f2:	f17d                	bnez	a0,800018d8 <fork+0x9e>
    800018f4:	bfcd                	j	800018e6 <fork+0xac>
  np->cwd = idup(p->cwd);
    800018f6:	15093503          	ld	a0,336(s2)
    800018fa:	00002097          	auipc	ra,0x2
    800018fe:	82e080e7          	jalr	-2002(ra) # 80003128 <idup>
    80001902:	14a9b823          	sd	a0,336(s3)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80001906:	4641                	li	a2,16
    80001908:	15890593          	addi	a1,s2,344
    8000190c:	15898513          	addi	a0,s3,344
    80001910:	fffff097          	auipc	ra,0xfffff
    80001914:	9ba080e7          	jalr	-1606(ra) # 800002ca <safestrcpy>
  pid = np->pid;
    80001918:	0309aa03          	lw	s4,48(s3)
  release(&np->lock);
    8000191c:	854e                	mv	a0,s3
    8000191e:	00005097          	auipc	ra,0x5
    80001922:	388080e7          	jalr	904(ra) # 80006ca6 <release>
  acquire(&wait_lock);
    80001926:	00007497          	auipc	s1,0x7
    8000192a:	75248493          	addi	s1,s1,1874 # 80009078 <wait_lock>
    8000192e:	8526                	mv	a0,s1
    80001930:	00005097          	auipc	ra,0x5
    80001934:	2c2080e7          	jalr	706(ra) # 80006bf2 <acquire>
  np->parent = p;
    80001938:	0329bc23          	sd	s2,56(s3)
  release(&wait_lock);
    8000193c:	8526                	mv	a0,s1
    8000193e:	00005097          	auipc	ra,0x5
    80001942:	368080e7          	jalr	872(ra) # 80006ca6 <release>
  acquire(&np->lock);
    80001946:	854e                	mv	a0,s3
    80001948:	00005097          	auipc	ra,0x5
    8000194c:	2aa080e7          	jalr	682(ra) # 80006bf2 <acquire>
  np->state = RUNNABLE;
    80001950:	478d                	li	a5,3
    80001952:	00f9ac23          	sw	a5,24(s3)
  release(&np->lock);
    80001956:	854e                	mv	a0,s3
    80001958:	00005097          	auipc	ra,0x5
    8000195c:	34e080e7          	jalr	846(ra) # 80006ca6 <release>
}
    80001960:	8552                	mv	a0,s4
    80001962:	70a2                	ld	ra,40(sp)
    80001964:	7402                	ld	s0,32(sp)
    80001966:	64e2                	ld	s1,24(sp)
    80001968:	6942                	ld	s2,16(sp)
    8000196a:	69a2                	ld	s3,8(sp)
    8000196c:	6a02                	ld	s4,0(sp)
    8000196e:	6145                	addi	sp,sp,48
    80001970:	8082                	ret
    return -1;
    80001972:	5a7d                	li	s4,-1
    80001974:	b7f5                	j	80001960 <fork+0x126>

0000000080001976 <scheduler>:
{
    80001976:	7139                	addi	sp,sp,-64
    80001978:	fc06                	sd	ra,56(sp)
    8000197a:	f822                	sd	s0,48(sp)
    8000197c:	f426                	sd	s1,40(sp)
    8000197e:	f04a                	sd	s2,32(sp)
    80001980:	ec4e                	sd	s3,24(sp)
    80001982:	e852                	sd	s4,16(sp)
    80001984:	e456                	sd	s5,8(sp)
    80001986:	e05a                	sd	s6,0(sp)
    80001988:	0080                	addi	s0,sp,64
    8000198a:	8792                	mv	a5,tp
  int id = r_tp();
    8000198c:	2781                	sext.w	a5,a5
  c->proc = 0;
    8000198e:	00779a93          	slli	s5,a5,0x7
    80001992:	00007717          	auipc	a4,0x7
    80001996:	6ce70713          	addi	a4,a4,1742 # 80009060 <pid_lock>
    8000199a:	9756                	add	a4,a4,s5
    8000199c:	02073823          	sd	zero,48(a4)
        swtch(&c->context, &p->context);
    800019a0:	00007717          	auipc	a4,0x7
    800019a4:	6f870713          	addi	a4,a4,1784 # 80009098 <cpus+0x8>
    800019a8:	9aba                	add	s5,s5,a4
      if(p->state == RUNNABLE) {
    800019aa:	498d                	li	s3,3
        p->state = RUNNING;
    800019ac:	4b11                	li	s6,4
        c->proc = p;
    800019ae:	079e                	slli	a5,a5,0x7
    800019b0:	00007a17          	auipc	s4,0x7
    800019b4:	6b0a0a13          	addi	s4,s4,1712 # 80009060 <pid_lock>
    800019b8:	9a3e                	add	s4,s4,a5
    for(p = proc; p < &proc[NPROC]; p++) {
    800019ba:	0000d917          	auipc	s2,0xd
    800019be:	4d690913          	addi	s2,s2,1238 # 8000ee90 <tickslock>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800019c2:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800019c6:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800019ca:	10079073          	csrw	sstatus,a5
    800019ce:	00008497          	auipc	s1,0x8
    800019d2:	ac248493          	addi	s1,s1,-1342 # 80009490 <proc>
    800019d6:	a03d                	j	80001a04 <scheduler+0x8e>
        p->state = RUNNING;
    800019d8:	0164ac23          	sw	s6,24(s1)
        c->proc = p;
    800019dc:	029a3823          	sd	s1,48(s4)
        swtch(&c->context, &p->context);
    800019e0:	06048593          	addi	a1,s1,96
    800019e4:	8556                	mv	a0,s5
    800019e6:	00000097          	auipc	ra,0x0
    800019ea:	640080e7          	jalr	1600(ra) # 80002026 <swtch>
        c->proc = 0;
    800019ee:	020a3823          	sd	zero,48(s4)
      release(&p->lock);
    800019f2:	8526                	mv	a0,s1
    800019f4:	00005097          	auipc	ra,0x5
    800019f8:	2b2080e7          	jalr	690(ra) # 80006ca6 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    800019fc:	16848493          	addi	s1,s1,360
    80001a00:	fd2481e3          	beq	s1,s2,800019c2 <scheduler+0x4c>
      acquire(&p->lock);
    80001a04:	8526                	mv	a0,s1
    80001a06:	00005097          	auipc	ra,0x5
    80001a0a:	1ec080e7          	jalr	492(ra) # 80006bf2 <acquire>
      if(p->state == RUNNABLE) {
    80001a0e:	4c9c                	lw	a5,24(s1)
    80001a10:	ff3791e3          	bne	a5,s3,800019f2 <scheduler+0x7c>
    80001a14:	b7d1                	j	800019d8 <scheduler+0x62>

0000000080001a16 <sched>:
{
    80001a16:	7179                	addi	sp,sp,-48
    80001a18:	f406                	sd	ra,40(sp)
    80001a1a:	f022                	sd	s0,32(sp)
    80001a1c:	ec26                	sd	s1,24(sp)
    80001a1e:	e84a                	sd	s2,16(sp)
    80001a20:	e44e                	sd	s3,8(sp)
    80001a22:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	a48080e7          	jalr	-1464(ra) # 8000146c <myproc>
    80001a2c:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    80001a2e:	00005097          	auipc	ra,0x5
    80001a32:	14a080e7          	jalr	330(ra) # 80006b78 <holding>
    80001a36:	c93d                	beqz	a0,80001aac <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    80001a38:	8792                	mv	a5,tp
  if(mycpu()->noff != 1)
    80001a3a:	2781                	sext.w	a5,a5
    80001a3c:	079e                	slli	a5,a5,0x7
    80001a3e:	00007717          	auipc	a4,0x7
    80001a42:	62270713          	addi	a4,a4,1570 # 80009060 <pid_lock>
    80001a46:	97ba                	add	a5,a5,a4
    80001a48:	0a87a703          	lw	a4,168(a5)
    80001a4c:	4785                	li	a5,1
    80001a4e:	06f71763          	bne	a4,a5,80001abc <sched+0xa6>
  if(p->state == RUNNING)
    80001a52:	4c98                	lw	a4,24(s1)
    80001a54:	4791                	li	a5,4
    80001a56:	06f70b63          	beq	a4,a5,80001acc <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80001a5a:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80001a5e:	8b89                	andi	a5,a5,2
  if(intr_get())
    80001a60:	efb5                	bnez	a5,80001adc <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    80001a62:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    80001a64:	00007917          	auipc	s2,0x7
    80001a68:	5fc90913          	addi	s2,s2,1532 # 80009060 <pid_lock>
    80001a6c:	2781                	sext.w	a5,a5
    80001a6e:	079e                	slli	a5,a5,0x7
    80001a70:	97ca                	add	a5,a5,s2
    80001a72:	0ac7a983          	lw	s3,172(a5)
    80001a76:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    80001a78:	2781                	sext.w	a5,a5
    80001a7a:	079e                	slli	a5,a5,0x7
    80001a7c:	00007597          	auipc	a1,0x7
    80001a80:	61c58593          	addi	a1,a1,1564 # 80009098 <cpus+0x8>
    80001a84:	95be                	add	a1,a1,a5
    80001a86:	06048513          	addi	a0,s1,96
    80001a8a:	00000097          	auipc	ra,0x0
    80001a8e:	59c080e7          	jalr	1436(ra) # 80002026 <swtch>
    80001a92:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    80001a94:	2781                	sext.w	a5,a5
    80001a96:	079e                	slli	a5,a5,0x7
    80001a98:	97ca                	add	a5,a5,s2
    80001a9a:	0b37a623          	sw	s3,172(a5)
}
    80001a9e:	70a2                	ld	ra,40(sp)
    80001aa0:	7402                	ld	s0,32(sp)
    80001aa2:	64e2                	ld	s1,24(sp)
    80001aa4:	6942                	ld	s2,16(sp)
    80001aa6:	69a2                	ld	s3,8(sp)
    80001aa8:	6145                	addi	sp,sp,48
    80001aaa:	8082                	ret
    panic("sched p->lock");
    80001aac:	00006517          	auipc	a0,0x6
    80001ab0:	7e450513          	addi	a0,a0,2020 # 80008290 <etext+0x290>
    80001ab4:	00005097          	auipc	ra,0x5
    80001ab8:	bf4080e7          	jalr	-1036(ra) # 800066a8 <panic>
    panic("sched locks");
    80001abc:	00006517          	auipc	a0,0x6
    80001ac0:	7e450513          	addi	a0,a0,2020 # 800082a0 <etext+0x2a0>
    80001ac4:	00005097          	auipc	ra,0x5
    80001ac8:	be4080e7          	jalr	-1052(ra) # 800066a8 <panic>
    panic("sched running");
    80001acc:	00006517          	auipc	a0,0x6
    80001ad0:	7e450513          	addi	a0,a0,2020 # 800082b0 <etext+0x2b0>
    80001ad4:	00005097          	auipc	ra,0x5
    80001ad8:	bd4080e7          	jalr	-1068(ra) # 800066a8 <panic>
    panic("sched interruptible");
    80001adc:	00006517          	auipc	a0,0x6
    80001ae0:	7e450513          	addi	a0,a0,2020 # 800082c0 <etext+0x2c0>
    80001ae4:	00005097          	auipc	ra,0x5
    80001ae8:	bc4080e7          	jalr	-1084(ra) # 800066a8 <panic>

0000000080001aec <yield>:
{
    80001aec:	1101                	addi	sp,sp,-32
    80001aee:	ec06                	sd	ra,24(sp)
    80001af0:	e822                	sd	s0,16(sp)
    80001af2:	e426                	sd	s1,8(sp)
    80001af4:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80001af6:	00000097          	auipc	ra,0x0
    80001afa:	976080e7          	jalr	-1674(ra) # 8000146c <myproc>
    80001afe:	84aa                	mv	s1,a0
  acquire(&p->lock);
    80001b00:	00005097          	auipc	ra,0x5
    80001b04:	0f2080e7          	jalr	242(ra) # 80006bf2 <acquire>
  p->state = RUNNABLE;
    80001b08:	478d                	li	a5,3
    80001b0a:	cc9c                	sw	a5,24(s1)
  sched();
    80001b0c:	00000097          	auipc	ra,0x0
    80001b10:	f0a080e7          	jalr	-246(ra) # 80001a16 <sched>
  release(&p->lock);
    80001b14:	8526                	mv	a0,s1
    80001b16:	00005097          	auipc	ra,0x5
    80001b1a:	190080e7          	jalr	400(ra) # 80006ca6 <release>
}
    80001b1e:	60e2                	ld	ra,24(sp)
    80001b20:	6442                	ld	s0,16(sp)
    80001b22:	64a2                	ld	s1,8(sp)
    80001b24:	6105                	addi	sp,sp,32
    80001b26:	8082                	ret

0000000080001b28 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80001b28:	7179                	addi	sp,sp,-48
    80001b2a:	f406                	sd	ra,40(sp)
    80001b2c:	f022                	sd	s0,32(sp)
    80001b2e:	ec26                	sd	s1,24(sp)
    80001b30:	e84a                	sd	s2,16(sp)
    80001b32:	e44e                	sd	s3,8(sp)
    80001b34:	1800                	addi	s0,sp,48
    80001b36:	89aa                	mv	s3,a0
    80001b38:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80001b3a:	00000097          	auipc	ra,0x0
    80001b3e:	932080e7          	jalr	-1742(ra) # 8000146c <myproc>
    80001b42:	84aa                	mv	s1,a0
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80001b44:	00005097          	auipc	ra,0x5
    80001b48:	0ae080e7          	jalr	174(ra) # 80006bf2 <acquire>
  release(lk);
    80001b4c:	854a                	mv	a0,s2
    80001b4e:	00005097          	auipc	ra,0x5
    80001b52:	158080e7          	jalr	344(ra) # 80006ca6 <release>

  // Go to sleep.
  p->chan = chan;
    80001b56:	0334b023          	sd	s3,32(s1)
  p->state = SLEEPING;
    80001b5a:	4789                	li	a5,2
    80001b5c:	cc9c                	sw	a5,24(s1)

  sched();
    80001b5e:	00000097          	auipc	ra,0x0
    80001b62:	eb8080e7          	jalr	-328(ra) # 80001a16 <sched>

  // Tidy up.
  p->chan = 0;
    80001b66:	0204b023          	sd	zero,32(s1)

  // Reacquire original lock.
  release(&p->lock);
    80001b6a:	8526                	mv	a0,s1
    80001b6c:	00005097          	auipc	ra,0x5
    80001b70:	13a080e7          	jalr	314(ra) # 80006ca6 <release>
  acquire(lk);
    80001b74:	854a                	mv	a0,s2
    80001b76:	00005097          	auipc	ra,0x5
    80001b7a:	07c080e7          	jalr	124(ra) # 80006bf2 <acquire>
}
    80001b7e:	70a2                	ld	ra,40(sp)
    80001b80:	7402                	ld	s0,32(sp)
    80001b82:	64e2                	ld	s1,24(sp)
    80001b84:	6942                	ld	s2,16(sp)
    80001b86:	69a2                	ld	s3,8(sp)
    80001b88:	6145                	addi	sp,sp,48
    80001b8a:	8082                	ret

0000000080001b8c <wait>:
{
    80001b8c:	715d                	addi	sp,sp,-80
    80001b8e:	e486                	sd	ra,72(sp)
    80001b90:	e0a2                	sd	s0,64(sp)
    80001b92:	fc26                	sd	s1,56(sp)
    80001b94:	f84a                	sd	s2,48(sp)
    80001b96:	f44e                	sd	s3,40(sp)
    80001b98:	f052                	sd	s4,32(sp)
    80001b9a:	ec56                	sd	s5,24(sp)
    80001b9c:	e85a                	sd	s6,16(sp)
    80001b9e:	e45e                	sd	s7,8(sp)
    80001ba0:	e062                	sd	s8,0(sp)
    80001ba2:	0880                	addi	s0,sp,80
    80001ba4:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    80001ba6:	00000097          	auipc	ra,0x0
    80001baa:	8c6080e7          	jalr	-1850(ra) # 8000146c <myproc>
    80001bae:	892a                	mv	s2,a0
  acquire(&wait_lock);
    80001bb0:	00007517          	auipc	a0,0x7
    80001bb4:	4c850513          	addi	a0,a0,1224 # 80009078 <wait_lock>
    80001bb8:	00005097          	auipc	ra,0x5
    80001bbc:	03a080e7          	jalr	58(ra) # 80006bf2 <acquire>
    havekids = 0;
    80001bc0:	4b81                	li	s7,0
        if(np->state == ZOMBIE){
    80001bc2:	4a15                	li	s4,5
    for(np = proc; np < &proc[NPROC]; np++){
    80001bc4:	0000d997          	auipc	s3,0xd
    80001bc8:	2cc98993          	addi	s3,s3,716 # 8000ee90 <tickslock>
        havekids = 1;
    80001bcc:	4a85                	li	s5,1
    sleep(p, &wait_lock);  //DOC: wait-sleep
    80001bce:	00007c17          	auipc	s8,0x7
    80001bd2:	4aac0c13          	addi	s8,s8,1194 # 80009078 <wait_lock>
    havekids = 0;
    80001bd6:	875e                	mv	a4,s7
    for(np = proc; np < &proc[NPROC]; np++){
    80001bd8:	00008497          	auipc	s1,0x8
    80001bdc:	8b848493          	addi	s1,s1,-1864 # 80009490 <proc>
    80001be0:	a0bd                	j	80001c4e <wait+0xc2>
          pid = np->pid;
    80001be2:	0304a983          	lw	s3,48(s1)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&np->xstate,
    80001be6:	000b0e63          	beqz	s6,80001c02 <wait+0x76>
    80001bea:	4691                	li	a3,4
    80001bec:	02c48613          	addi	a2,s1,44
    80001bf0:	85da                	mv	a1,s6
    80001bf2:	05093503          	ld	a0,80(s2)
    80001bf6:	fffff097          	auipc	ra,0xfffff
    80001bfa:	f32080e7          	jalr	-206(ra) # 80000b28 <copyout>
    80001bfe:	02054563          	bltz	a0,80001c28 <wait+0x9c>
          freeproc(np);
    80001c02:	8526                	mv	a0,s1
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	a1a080e7          	jalr	-1510(ra) # 8000161e <freeproc>
          release(&np->lock);
    80001c0c:	8526                	mv	a0,s1
    80001c0e:	00005097          	auipc	ra,0x5
    80001c12:	098080e7          	jalr	152(ra) # 80006ca6 <release>
          release(&wait_lock);
    80001c16:	00007517          	auipc	a0,0x7
    80001c1a:	46250513          	addi	a0,a0,1122 # 80009078 <wait_lock>
    80001c1e:	00005097          	auipc	ra,0x5
    80001c22:	088080e7          	jalr	136(ra) # 80006ca6 <release>
          return pid;
    80001c26:	a09d                	j	80001c8c <wait+0x100>
            release(&np->lock);
    80001c28:	8526                	mv	a0,s1
    80001c2a:	00005097          	auipc	ra,0x5
    80001c2e:	07c080e7          	jalr	124(ra) # 80006ca6 <release>
            release(&wait_lock);
    80001c32:	00007517          	auipc	a0,0x7
    80001c36:	44650513          	addi	a0,a0,1094 # 80009078 <wait_lock>
    80001c3a:	00005097          	auipc	ra,0x5
    80001c3e:	06c080e7          	jalr	108(ra) # 80006ca6 <release>
            return -1;
    80001c42:	59fd                	li	s3,-1
    80001c44:	a0a1                	j	80001c8c <wait+0x100>
    for(np = proc; np < &proc[NPROC]; np++){
    80001c46:	16848493          	addi	s1,s1,360
    80001c4a:	03348463          	beq	s1,s3,80001c72 <wait+0xe6>
      if(np->parent == p){
    80001c4e:	7c9c                	ld	a5,56(s1)
    80001c50:	ff279be3          	bne	a5,s2,80001c46 <wait+0xba>
        acquire(&np->lock);
    80001c54:	8526                	mv	a0,s1
    80001c56:	00005097          	auipc	ra,0x5
    80001c5a:	f9c080e7          	jalr	-100(ra) # 80006bf2 <acquire>
        if(np->state == ZOMBIE){
    80001c5e:	4c9c                	lw	a5,24(s1)
    80001c60:	f94781e3          	beq	a5,s4,80001be2 <wait+0x56>
        release(&np->lock);
    80001c64:	8526                	mv	a0,s1
    80001c66:	00005097          	auipc	ra,0x5
    80001c6a:	040080e7          	jalr	64(ra) # 80006ca6 <release>
        havekids = 1;
    80001c6e:	8756                	mv	a4,s5
    80001c70:	bfd9                	j	80001c46 <wait+0xba>
    if(!havekids || p->killed){
    80001c72:	c701                	beqz	a4,80001c7a <wait+0xee>
    80001c74:	02892783          	lw	a5,40(s2)
    80001c78:	c79d                	beqz	a5,80001ca6 <wait+0x11a>
      release(&wait_lock);
    80001c7a:	00007517          	auipc	a0,0x7
    80001c7e:	3fe50513          	addi	a0,a0,1022 # 80009078 <wait_lock>
    80001c82:	00005097          	auipc	ra,0x5
    80001c86:	024080e7          	jalr	36(ra) # 80006ca6 <release>
      return -1;
    80001c8a:	59fd                	li	s3,-1
}
    80001c8c:	854e                	mv	a0,s3
    80001c8e:	60a6                	ld	ra,72(sp)
    80001c90:	6406                	ld	s0,64(sp)
    80001c92:	74e2                	ld	s1,56(sp)
    80001c94:	7942                	ld	s2,48(sp)
    80001c96:	79a2                	ld	s3,40(sp)
    80001c98:	7a02                	ld	s4,32(sp)
    80001c9a:	6ae2                	ld	s5,24(sp)
    80001c9c:	6b42                	ld	s6,16(sp)
    80001c9e:	6ba2                	ld	s7,8(sp)
    80001ca0:	6c02                	ld	s8,0(sp)
    80001ca2:	6161                	addi	sp,sp,80
    80001ca4:	8082                	ret
    sleep(p, &wait_lock);  //DOC: wait-sleep
    80001ca6:	85e2                	mv	a1,s8
    80001ca8:	854a                	mv	a0,s2
    80001caa:	00000097          	auipc	ra,0x0
    80001cae:	e7e080e7          	jalr	-386(ra) # 80001b28 <sleep>
    havekids = 0;
    80001cb2:	b715                	j	80001bd6 <wait+0x4a>

0000000080001cb4 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    80001cb4:	7139                	addi	sp,sp,-64
    80001cb6:	fc06                	sd	ra,56(sp)
    80001cb8:	f822                	sd	s0,48(sp)
    80001cba:	f426                	sd	s1,40(sp)
    80001cbc:	f04a                	sd	s2,32(sp)
    80001cbe:	ec4e                	sd	s3,24(sp)
    80001cc0:	e852                	sd	s4,16(sp)
    80001cc2:	e456                	sd	s5,8(sp)
    80001cc4:	0080                	addi	s0,sp,64
    80001cc6:	8a2a                	mv	s4,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80001cc8:	00007497          	auipc	s1,0x7
    80001ccc:	7c848493          	addi	s1,s1,1992 # 80009490 <proc>
    if(p != myproc()){
      acquire(&p->lock);
      if(p->state == SLEEPING && p->chan == chan) {
    80001cd0:	4989                	li	s3,2
        p->state = RUNNABLE;
    80001cd2:	4a8d                	li	s5,3
  for(p = proc; p < &proc[NPROC]; p++) {
    80001cd4:	0000d917          	auipc	s2,0xd
    80001cd8:	1bc90913          	addi	s2,s2,444 # 8000ee90 <tickslock>
    80001cdc:	a821                	j	80001cf4 <wakeup+0x40>
        p->state = RUNNABLE;
    80001cde:	0154ac23          	sw	s5,24(s1)
      }
      release(&p->lock);
    80001ce2:	8526                	mv	a0,s1
    80001ce4:	00005097          	auipc	ra,0x5
    80001ce8:	fc2080e7          	jalr	-62(ra) # 80006ca6 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80001cec:	16848493          	addi	s1,s1,360
    80001cf0:	03248463          	beq	s1,s2,80001d18 <wakeup+0x64>
    if(p != myproc()){
    80001cf4:	fffff097          	auipc	ra,0xfffff
    80001cf8:	778080e7          	jalr	1912(ra) # 8000146c <myproc>
    80001cfc:	fea488e3          	beq	s1,a0,80001cec <wakeup+0x38>
      acquire(&p->lock);
    80001d00:	8526                	mv	a0,s1
    80001d02:	00005097          	auipc	ra,0x5
    80001d06:	ef0080e7          	jalr	-272(ra) # 80006bf2 <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    80001d0a:	4c9c                	lw	a5,24(s1)
    80001d0c:	fd379be3          	bne	a5,s3,80001ce2 <wakeup+0x2e>
    80001d10:	709c                	ld	a5,32(s1)
    80001d12:	fd4798e3          	bne	a5,s4,80001ce2 <wakeup+0x2e>
    80001d16:	b7e1                	j	80001cde <wakeup+0x2a>
    }
  }
}
    80001d18:	70e2                	ld	ra,56(sp)
    80001d1a:	7442                	ld	s0,48(sp)
    80001d1c:	74a2                	ld	s1,40(sp)
    80001d1e:	7902                	ld	s2,32(sp)
    80001d20:	69e2                	ld	s3,24(sp)
    80001d22:	6a42                	ld	s4,16(sp)
    80001d24:	6aa2                	ld	s5,8(sp)
    80001d26:	6121                	addi	sp,sp,64
    80001d28:	8082                	ret

0000000080001d2a <reparent>:
{
    80001d2a:	7179                	addi	sp,sp,-48
    80001d2c:	f406                	sd	ra,40(sp)
    80001d2e:	f022                	sd	s0,32(sp)
    80001d30:	ec26                	sd	s1,24(sp)
    80001d32:	e84a                	sd	s2,16(sp)
    80001d34:	e44e                	sd	s3,8(sp)
    80001d36:	e052                	sd	s4,0(sp)
    80001d38:	1800                	addi	s0,sp,48
    80001d3a:	892a                	mv	s2,a0
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80001d3c:	00007497          	auipc	s1,0x7
    80001d40:	75448493          	addi	s1,s1,1876 # 80009490 <proc>
      pp->parent = initproc;
    80001d44:	00007a17          	auipc	s4,0x7
    80001d48:	2d4a0a13          	addi	s4,s4,724 # 80009018 <initproc>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80001d4c:	0000d997          	auipc	s3,0xd
    80001d50:	14498993          	addi	s3,s3,324 # 8000ee90 <tickslock>
    80001d54:	a029                	j	80001d5e <reparent+0x34>
    80001d56:	16848493          	addi	s1,s1,360
    80001d5a:	01348d63          	beq	s1,s3,80001d74 <reparent+0x4a>
    if(pp->parent == p){
    80001d5e:	7c9c                	ld	a5,56(s1)
    80001d60:	ff279be3          	bne	a5,s2,80001d56 <reparent+0x2c>
      pp->parent = initproc;
    80001d64:	000a3503          	ld	a0,0(s4)
    80001d68:	fc88                	sd	a0,56(s1)
      wakeup(initproc);
    80001d6a:	00000097          	auipc	ra,0x0
    80001d6e:	f4a080e7          	jalr	-182(ra) # 80001cb4 <wakeup>
    80001d72:	b7d5                	j	80001d56 <reparent+0x2c>
}
    80001d74:	70a2                	ld	ra,40(sp)
    80001d76:	7402                	ld	s0,32(sp)
    80001d78:	64e2                	ld	s1,24(sp)
    80001d7a:	6942                	ld	s2,16(sp)
    80001d7c:	69a2                	ld	s3,8(sp)
    80001d7e:	6a02                	ld	s4,0(sp)
    80001d80:	6145                	addi	sp,sp,48
    80001d82:	8082                	ret

0000000080001d84 <exit>:
{
    80001d84:	7179                	addi	sp,sp,-48
    80001d86:	f406                	sd	ra,40(sp)
    80001d88:	f022                	sd	s0,32(sp)
    80001d8a:	ec26                	sd	s1,24(sp)
    80001d8c:	e84a                	sd	s2,16(sp)
    80001d8e:	e44e                	sd	s3,8(sp)
    80001d90:	e052                	sd	s4,0(sp)
    80001d92:	1800                	addi	s0,sp,48
    80001d94:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    80001d96:	fffff097          	auipc	ra,0xfffff
    80001d9a:	6d6080e7          	jalr	1750(ra) # 8000146c <myproc>
    80001d9e:	89aa                	mv	s3,a0
  if(p == initproc)
    80001da0:	00007797          	auipc	a5,0x7
    80001da4:	2787b783          	ld	a5,632(a5) # 80009018 <initproc>
    80001da8:	0d050493          	addi	s1,a0,208
    80001dac:	15050913          	addi	s2,a0,336
    80001db0:	02a79363          	bne	a5,a0,80001dd6 <exit+0x52>
    panic("init exiting");
    80001db4:	00006517          	auipc	a0,0x6
    80001db8:	52450513          	addi	a0,a0,1316 # 800082d8 <etext+0x2d8>
    80001dbc:	00005097          	auipc	ra,0x5
    80001dc0:	8ec080e7          	jalr	-1812(ra) # 800066a8 <panic>
      fileclose(f);
    80001dc4:	00002097          	auipc	ra,0x2
    80001dc8:	3c8080e7          	jalr	968(ra) # 8000418c <fileclose>
      p->ofile[fd] = 0;
    80001dcc:	0004b023          	sd	zero,0(s1)
  for(int fd = 0; fd < NOFILE; fd++){
    80001dd0:	04a1                	addi	s1,s1,8
    80001dd2:	01248563          	beq	s1,s2,80001ddc <exit+0x58>
    if(p->ofile[fd]){
    80001dd6:	6088                	ld	a0,0(s1)
    80001dd8:	f575                	bnez	a0,80001dc4 <exit+0x40>
    80001dda:	bfdd                	j	80001dd0 <exit+0x4c>
  begin_op();
    80001ddc:	00002097          	auipc	ra,0x2
    80001de0:	ee4080e7          	jalr	-284(ra) # 80003cc0 <begin_op>
  iput(p->cwd);
    80001de4:	1509b503          	ld	a0,336(s3)
    80001de8:	00001097          	auipc	ra,0x1
    80001dec:	538080e7          	jalr	1336(ra) # 80003320 <iput>
  end_op();
    80001df0:	00002097          	auipc	ra,0x2
    80001df4:	f50080e7          	jalr	-176(ra) # 80003d40 <end_op>
  p->cwd = 0;
    80001df8:	1409b823          	sd	zero,336(s3)
  acquire(&wait_lock);
    80001dfc:	00007497          	auipc	s1,0x7
    80001e00:	27c48493          	addi	s1,s1,636 # 80009078 <wait_lock>
    80001e04:	8526                	mv	a0,s1
    80001e06:	00005097          	auipc	ra,0x5
    80001e0a:	dec080e7          	jalr	-532(ra) # 80006bf2 <acquire>
  reparent(p);
    80001e0e:	854e                	mv	a0,s3
    80001e10:	00000097          	auipc	ra,0x0
    80001e14:	f1a080e7          	jalr	-230(ra) # 80001d2a <reparent>
  wakeup(p->parent);
    80001e18:	0389b503          	ld	a0,56(s3)
    80001e1c:	00000097          	auipc	ra,0x0
    80001e20:	e98080e7          	jalr	-360(ra) # 80001cb4 <wakeup>
  acquire(&p->lock);
    80001e24:	854e                	mv	a0,s3
    80001e26:	00005097          	auipc	ra,0x5
    80001e2a:	dcc080e7          	jalr	-564(ra) # 80006bf2 <acquire>
  p->xstate = status;
    80001e2e:	0349a623          	sw	s4,44(s3)
  p->state = ZOMBIE;
    80001e32:	4795                	li	a5,5
    80001e34:	00f9ac23          	sw	a5,24(s3)
  release(&wait_lock);
    80001e38:	8526                	mv	a0,s1
    80001e3a:	00005097          	auipc	ra,0x5
    80001e3e:	e6c080e7          	jalr	-404(ra) # 80006ca6 <release>
  sched();
    80001e42:	00000097          	auipc	ra,0x0
    80001e46:	bd4080e7          	jalr	-1068(ra) # 80001a16 <sched>
  panic("zombie exit");
    80001e4a:	00006517          	auipc	a0,0x6
    80001e4e:	49e50513          	addi	a0,a0,1182 # 800082e8 <etext+0x2e8>
    80001e52:	00005097          	auipc	ra,0x5
    80001e56:	856080e7          	jalr	-1962(ra) # 800066a8 <panic>

0000000080001e5a <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80001e5a:	7179                	addi	sp,sp,-48
    80001e5c:	f406                	sd	ra,40(sp)
    80001e5e:	f022                	sd	s0,32(sp)
    80001e60:	ec26                	sd	s1,24(sp)
    80001e62:	e84a                	sd	s2,16(sp)
    80001e64:	e44e                	sd	s3,8(sp)
    80001e66:	1800                	addi	s0,sp,48
    80001e68:	892a                	mv	s2,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80001e6a:	00007497          	auipc	s1,0x7
    80001e6e:	62648493          	addi	s1,s1,1574 # 80009490 <proc>
    80001e72:	0000d997          	auipc	s3,0xd
    80001e76:	01e98993          	addi	s3,s3,30 # 8000ee90 <tickslock>
    acquire(&p->lock);
    80001e7a:	8526                	mv	a0,s1
    80001e7c:	00005097          	auipc	ra,0x5
    80001e80:	d76080e7          	jalr	-650(ra) # 80006bf2 <acquire>
    if(p->pid == pid){
    80001e84:	589c                	lw	a5,48(s1)
    80001e86:	01278d63          	beq	a5,s2,80001ea0 <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    80001e8a:	8526                	mv	a0,s1
    80001e8c:	00005097          	auipc	ra,0x5
    80001e90:	e1a080e7          	jalr	-486(ra) # 80006ca6 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80001e94:	16848493          	addi	s1,s1,360
    80001e98:	ff3491e3          	bne	s1,s3,80001e7a <kill+0x20>
  }
  return -1;
    80001e9c:	557d                	li	a0,-1
    80001e9e:	a829                	j	80001eb8 <kill+0x5e>
      p->killed = 1;
    80001ea0:	4785                	li	a5,1
    80001ea2:	d49c                	sw	a5,40(s1)
      if(p->state == SLEEPING){
    80001ea4:	4c98                	lw	a4,24(s1)
    80001ea6:	4789                	li	a5,2
    80001ea8:	00f70f63          	beq	a4,a5,80001ec6 <kill+0x6c>
      release(&p->lock);
    80001eac:	8526                	mv	a0,s1
    80001eae:	00005097          	auipc	ra,0x5
    80001eb2:	df8080e7          	jalr	-520(ra) # 80006ca6 <release>
      return 0;
    80001eb6:	4501                	li	a0,0
}
    80001eb8:	70a2                	ld	ra,40(sp)
    80001eba:	7402                	ld	s0,32(sp)
    80001ebc:	64e2                	ld	s1,24(sp)
    80001ebe:	6942                	ld	s2,16(sp)
    80001ec0:	69a2                	ld	s3,8(sp)
    80001ec2:	6145                	addi	sp,sp,48
    80001ec4:	8082                	ret
        p->state = RUNNABLE;
    80001ec6:	478d                	li	a5,3
    80001ec8:	cc9c                	sw	a5,24(s1)
    80001eca:	b7cd                	j	80001eac <kill+0x52>

0000000080001ecc <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80001ecc:	7179                	addi	sp,sp,-48
    80001ece:	f406                	sd	ra,40(sp)
    80001ed0:	f022                	sd	s0,32(sp)
    80001ed2:	ec26                	sd	s1,24(sp)
    80001ed4:	e84a                	sd	s2,16(sp)
    80001ed6:	e44e                	sd	s3,8(sp)
    80001ed8:	e052                	sd	s4,0(sp)
    80001eda:	1800                	addi	s0,sp,48
    80001edc:	84aa                	mv	s1,a0
    80001ede:	892e                	mv	s2,a1
    80001ee0:	89b2                	mv	s3,a2
    80001ee2:	8a36                	mv	s4,a3
  struct proc *p = myproc();
    80001ee4:	fffff097          	auipc	ra,0xfffff
    80001ee8:	588080e7          	jalr	1416(ra) # 8000146c <myproc>
  if(user_dst){
    80001eec:	c08d                	beqz	s1,80001f0e <either_copyout+0x42>
    return copyout(p->pagetable, dst, src, len);
    80001eee:	86d2                	mv	a3,s4
    80001ef0:	864e                	mv	a2,s3
    80001ef2:	85ca                	mv	a1,s2
    80001ef4:	6928                	ld	a0,80(a0)
    80001ef6:	fffff097          	auipc	ra,0xfffff
    80001efa:	c32080e7          	jalr	-974(ra) # 80000b28 <copyout>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    80001efe:	70a2                	ld	ra,40(sp)
    80001f00:	7402                	ld	s0,32(sp)
    80001f02:	64e2                	ld	s1,24(sp)
    80001f04:	6942                	ld	s2,16(sp)
    80001f06:	69a2                	ld	s3,8(sp)
    80001f08:	6a02                	ld	s4,0(sp)
    80001f0a:	6145                	addi	sp,sp,48
    80001f0c:	8082                	ret
    memmove((char *)dst, src, len);
    80001f0e:	000a061b          	sext.w	a2,s4
    80001f12:	85ce                	mv	a1,s3
    80001f14:	854a                	mv	a0,s2
    80001f16:	ffffe097          	auipc	ra,0xffffe
    80001f1a:	2c2080e7          	jalr	706(ra) # 800001d8 <memmove>
    return 0;
    80001f1e:	8526                	mv	a0,s1
    80001f20:	bff9                	j	80001efe <either_copyout+0x32>

0000000080001f22 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80001f22:	7179                	addi	sp,sp,-48
    80001f24:	f406                	sd	ra,40(sp)
    80001f26:	f022                	sd	s0,32(sp)
    80001f28:	ec26                	sd	s1,24(sp)
    80001f2a:	e84a                	sd	s2,16(sp)
    80001f2c:	e44e                	sd	s3,8(sp)
    80001f2e:	e052                	sd	s4,0(sp)
    80001f30:	1800                	addi	s0,sp,48
    80001f32:	892a                	mv	s2,a0
    80001f34:	84ae                	mv	s1,a1
    80001f36:	89b2                	mv	s3,a2
    80001f38:	8a36                	mv	s4,a3
  struct proc *p = myproc();
    80001f3a:	fffff097          	auipc	ra,0xfffff
    80001f3e:	532080e7          	jalr	1330(ra) # 8000146c <myproc>
  if(user_src){
    80001f42:	c08d                	beqz	s1,80001f64 <either_copyin+0x42>
    return copyin(p->pagetable, dst, src, len);
    80001f44:	86d2                	mv	a3,s4
    80001f46:	864e                	mv	a2,s3
    80001f48:	85ca                	mv	a1,s2
    80001f4a:	6928                	ld	a0,80(a0)
    80001f4c:	fffff097          	auipc	ra,0xfffff
    80001f50:	c68080e7          	jalr	-920(ra) # 80000bb4 <copyin>
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}
    80001f54:	70a2                	ld	ra,40(sp)
    80001f56:	7402                	ld	s0,32(sp)
    80001f58:	64e2                	ld	s1,24(sp)
    80001f5a:	6942                	ld	s2,16(sp)
    80001f5c:	69a2                	ld	s3,8(sp)
    80001f5e:	6a02                	ld	s4,0(sp)
    80001f60:	6145                	addi	sp,sp,48
    80001f62:	8082                	ret
    memmove(dst, (char*)src, len);
    80001f64:	000a061b          	sext.w	a2,s4
    80001f68:	85ce                	mv	a1,s3
    80001f6a:	854a                	mv	a0,s2
    80001f6c:	ffffe097          	auipc	ra,0xffffe
    80001f70:	26c080e7          	jalr	620(ra) # 800001d8 <memmove>
    return 0;
    80001f74:	8526                	mv	a0,s1
    80001f76:	bff9                	j	80001f54 <either_copyin+0x32>

0000000080001f78 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80001f78:	715d                	addi	sp,sp,-80
    80001f7a:	e486                	sd	ra,72(sp)
    80001f7c:	e0a2                	sd	s0,64(sp)
    80001f7e:	fc26                	sd	s1,56(sp)
    80001f80:	f84a                	sd	s2,48(sp)
    80001f82:	f44e                	sd	s3,40(sp)
    80001f84:	f052                	sd	s4,32(sp)
    80001f86:	ec56                	sd	s5,24(sp)
    80001f88:	e85a                	sd	s6,16(sp)
    80001f8a:	e45e                	sd	s7,8(sp)
    80001f8c:	0880                	addi	s0,sp,80
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80001f8e:	00006517          	auipc	a0,0x6
    80001f92:	0ba50513          	addi	a0,a0,186 # 80008048 <etext+0x48>
    80001f96:	00004097          	auipc	ra,0x4
    80001f9a:	75c080e7          	jalr	1884(ra) # 800066f2 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80001f9e:	00007497          	auipc	s1,0x7
    80001fa2:	64a48493          	addi	s1,s1,1610 # 800095e8 <proc+0x158>
    80001fa6:	0000d917          	auipc	s2,0xd
    80001faa:	04290913          	addi	s2,s2,66 # 8000efe8 <bcache+0x140>
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80001fae:	4b15                	li	s6,5
      state = states[p->state];
    else
      state = "???";
    80001fb0:	00006997          	auipc	s3,0x6
    80001fb4:	34898993          	addi	s3,s3,840 # 800082f8 <etext+0x2f8>
    printf("%d %s %s", p->pid, state, p->name);
    80001fb8:	00006a97          	auipc	s5,0x6
    80001fbc:	348a8a93          	addi	s5,s5,840 # 80008300 <etext+0x300>
    printf("\n");
    80001fc0:	00006a17          	auipc	s4,0x6
    80001fc4:	088a0a13          	addi	s4,s4,136 # 80008048 <etext+0x48>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80001fc8:	00006b97          	auipc	s7,0x6
    80001fcc:	370b8b93          	addi	s7,s7,880 # 80008338 <states.1815>
    80001fd0:	a00d                	j	80001ff2 <procdump+0x7a>
    printf("%d %s %s", p->pid, state, p->name);
    80001fd2:	ed86a583          	lw	a1,-296(a3)
    80001fd6:	8556                	mv	a0,s5
    80001fd8:	00004097          	auipc	ra,0x4
    80001fdc:	71a080e7          	jalr	1818(ra) # 800066f2 <printf>
    printf("\n");
    80001fe0:	8552                	mv	a0,s4
    80001fe2:	00004097          	auipc	ra,0x4
    80001fe6:	710080e7          	jalr	1808(ra) # 800066f2 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80001fea:	16848493          	addi	s1,s1,360
    80001fee:	03248163          	beq	s1,s2,80002010 <procdump+0x98>
    if(p->state == UNUSED)
    80001ff2:	86a6                	mv	a3,s1
    80001ff4:	ec04a783          	lw	a5,-320(s1)
    80001ff8:	dbed                	beqz	a5,80001fea <procdump+0x72>
      state = "???";
    80001ffa:	864e                	mv	a2,s3
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80001ffc:	fcfb6be3          	bltu	s6,a5,80001fd2 <procdump+0x5a>
    80002000:	1782                	slli	a5,a5,0x20
    80002002:	9381                	srli	a5,a5,0x20
    80002004:	078e                	slli	a5,a5,0x3
    80002006:	97de                	add	a5,a5,s7
    80002008:	6390                	ld	a2,0(a5)
    8000200a:	f661                	bnez	a2,80001fd2 <procdump+0x5a>
      state = "???";
    8000200c:	864e                	mv	a2,s3
    8000200e:	b7d1                	j	80001fd2 <procdump+0x5a>
  }
}
    80002010:	60a6                	ld	ra,72(sp)
    80002012:	6406                	ld	s0,64(sp)
    80002014:	74e2                	ld	s1,56(sp)
    80002016:	7942                	ld	s2,48(sp)
    80002018:	79a2                	ld	s3,40(sp)
    8000201a:	7a02                	ld	s4,32(sp)
    8000201c:	6ae2                	ld	s5,24(sp)
    8000201e:	6b42                	ld	s6,16(sp)
    80002020:	6ba2                	ld	s7,8(sp)
    80002022:	6161                	addi	sp,sp,80
    80002024:	8082                	ret

0000000080002026 <swtch>:
    80002026:	00153023          	sd	ra,0(a0)
    8000202a:	00253423          	sd	sp,8(a0)
    8000202e:	e900                	sd	s0,16(a0)
    80002030:	ed04                	sd	s1,24(a0)
    80002032:	03253023          	sd	s2,32(a0)
    80002036:	03353423          	sd	s3,40(a0)
    8000203a:	03453823          	sd	s4,48(a0)
    8000203e:	03553c23          	sd	s5,56(a0)
    80002042:	05653023          	sd	s6,64(a0)
    80002046:	05753423          	sd	s7,72(a0)
    8000204a:	05853823          	sd	s8,80(a0)
    8000204e:	05953c23          	sd	s9,88(a0)
    80002052:	07a53023          	sd	s10,96(a0)
    80002056:	07b53423          	sd	s11,104(a0)
    8000205a:	0005b083          	ld	ra,0(a1)
    8000205e:	0085b103          	ld	sp,8(a1)
    80002062:	6980                	ld	s0,16(a1)
    80002064:	6d84                	ld	s1,24(a1)
    80002066:	0205b903          	ld	s2,32(a1)
    8000206a:	0285b983          	ld	s3,40(a1)
    8000206e:	0305ba03          	ld	s4,48(a1)
    80002072:	0385ba83          	ld	s5,56(a1)
    80002076:	0405bb03          	ld	s6,64(a1)
    8000207a:	0485bb83          	ld	s7,72(a1)
    8000207e:	0505bc03          	ld	s8,80(a1)
    80002082:	0585bc83          	ld	s9,88(a1)
    80002086:	0605bd03          	ld	s10,96(a1)
    8000208a:	0685bd83          	ld	s11,104(a1)
    8000208e:	8082                	ret

0000000080002090 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80002090:	1141                	addi	sp,sp,-16
    80002092:	e406                	sd	ra,8(sp)
    80002094:	e022                	sd	s0,0(sp)
    80002096:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80002098:	00006597          	auipc	a1,0x6
    8000209c:	2d058593          	addi	a1,a1,720 # 80008368 <states.1815+0x30>
    800020a0:	0000d517          	auipc	a0,0xd
    800020a4:	df050513          	addi	a0,a0,-528 # 8000ee90 <tickslock>
    800020a8:	00005097          	auipc	ra,0x5
    800020ac:	aba080e7          	jalr	-1350(ra) # 80006b62 <initlock>
}
    800020b0:	60a2                	ld	ra,8(sp)
    800020b2:	6402                	ld	s0,0(sp)
    800020b4:	0141                	addi	sp,sp,16
    800020b6:	8082                	ret

00000000800020b8 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    800020b8:	1141                	addi	sp,sp,-16
    800020ba:	e422                	sd	s0,8(sp)
    800020bc:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    800020be:	00003797          	auipc	a5,0x3
    800020c2:	6e278793          	addi	a5,a5,1762 # 800057a0 <kernelvec>
    800020c6:	10579073          	csrw	stvec,a5
  w_stvec((uint64)kernelvec);
}
    800020ca:	6422                	ld	s0,8(sp)
    800020cc:	0141                	addi	sp,sp,16
    800020ce:	8082                	ret

00000000800020d0 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    800020d0:	1141                	addi	sp,sp,-16
    800020d2:	e406                	sd	ra,8(sp)
    800020d4:	e022                	sd	s0,0(sp)
    800020d6:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    800020d8:	fffff097          	auipc	ra,0xfffff
    800020dc:	394080e7          	jalr	916(ra) # 8000146c <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800020e0:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800020e4:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800020e6:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    800020ea:	00005617          	auipc	a2,0x5
    800020ee:	f1660613          	addi	a2,a2,-234 # 80007000 <_trampoline>
    800020f2:	00005697          	auipc	a3,0x5
    800020f6:	f0e68693          	addi	a3,a3,-242 # 80007000 <_trampoline>
    800020fa:	8e91                	sub	a3,a3,a2
    800020fc:	040007b7          	lui	a5,0x4000
    80002100:	17fd                	addi	a5,a5,-1
    80002102:	07b2                	slli	a5,a5,0xc
    80002104:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    80002106:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    8000210a:	6d38                	ld	a4,88(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    8000210c:	180026f3          	csrr	a3,satp
    80002110:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80002112:	6d38                	ld	a4,88(a0)
    80002114:	6134                	ld	a3,64(a0)
    80002116:	6585                	lui	a1,0x1
    80002118:	96ae                	add	a3,a3,a1
    8000211a:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    8000211c:	6d38                	ld	a4,88(a0)
    8000211e:	00000697          	auipc	a3,0x0
    80002122:	13868693          	addi	a3,a3,312 # 80002256 <usertrap>
    80002126:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80002128:	6d38                	ld	a4,88(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    8000212a:	8692                	mv	a3,tp
    8000212c:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000212e:	100026f3          	csrr	a3,sstatus

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80002132:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80002136:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8000213a:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    8000213e:	6d38                	ld	a4,88(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80002140:	6f18                	ld	a4,24(a4)
    80002142:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80002146:	692c                	ld	a1,80(a0)
    80002148:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    8000214a:	00005717          	auipc	a4,0x5
    8000214e:	f4670713          	addi	a4,a4,-186 # 80007090 <userret>
    80002152:	8f11                	sub	a4,a4,a2
    80002154:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80002156:	577d                	li	a4,-1
    80002158:	177e                	slli	a4,a4,0x3f
    8000215a:	8dd9                	or	a1,a1,a4
    8000215c:	02000537          	lui	a0,0x2000
    80002160:	157d                	addi	a0,a0,-1
    80002162:	0536                	slli	a0,a0,0xd
    80002164:	9782                	jalr	a5
}
    80002166:	60a2                	ld	ra,8(sp)
    80002168:	6402                	ld	s0,0(sp)
    8000216a:	0141                	addi	sp,sp,16
    8000216c:	8082                	ret

000000008000216e <clockintr>:
  w_sstatus(sstatus);
}

void
clockintr()
{
    8000216e:	1101                	addi	sp,sp,-32
    80002170:	ec06                	sd	ra,24(sp)
    80002172:	e822                	sd	s0,16(sp)
    80002174:	e426                	sd	s1,8(sp)
    80002176:	1000                	addi	s0,sp,32
  acquire(&tickslock);
    80002178:	0000d497          	auipc	s1,0xd
    8000217c:	d1848493          	addi	s1,s1,-744 # 8000ee90 <tickslock>
    80002180:	8526                	mv	a0,s1
    80002182:	00005097          	auipc	ra,0x5
    80002186:	a70080e7          	jalr	-1424(ra) # 80006bf2 <acquire>
  ticks++;
    8000218a:	00007517          	auipc	a0,0x7
    8000218e:	e9650513          	addi	a0,a0,-362 # 80009020 <ticks>
    80002192:	411c                	lw	a5,0(a0)
    80002194:	2785                	addiw	a5,a5,1
    80002196:	c11c                	sw	a5,0(a0)
  wakeup(&ticks);
    80002198:	00000097          	auipc	ra,0x0
    8000219c:	b1c080e7          	jalr	-1252(ra) # 80001cb4 <wakeup>
  release(&tickslock);
    800021a0:	8526                	mv	a0,s1
    800021a2:	00005097          	auipc	ra,0x5
    800021a6:	b04080e7          	jalr	-1276(ra) # 80006ca6 <release>
}
    800021aa:	60e2                	ld	ra,24(sp)
    800021ac:	6442                	ld	s0,16(sp)
    800021ae:	64a2                	ld	s1,8(sp)
    800021b0:	6105                	addi	sp,sp,32
    800021b2:	8082                	ret

00000000800021b4 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    800021b4:	1101                	addi	sp,sp,-32
    800021b6:	ec06                	sd	ra,24(sp)
    800021b8:	e822                	sd	s0,16(sp)
    800021ba:	e426                	sd	s1,8(sp)
    800021bc:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    800021be:	14202773          	csrr	a4,scause
  uint64 scause = r_scause();

  if((scause & 0x8000000000000000L) &&
    800021c2:	00074d63          	bltz	a4,800021dc <devintr+0x28>
    // now allowed to interrupt again.
    if(irq)
      plic_complete(irq);

    return 1;
  } else if(scause == 0x8000000000000001L){
    800021c6:	57fd                	li	a5,-1
    800021c8:	17fe                	slli	a5,a5,0x3f
    800021ca:	0785                	addi	a5,a5,1
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);

    return 2;
  } else {
    return 0;
    800021cc:	4501                	li	a0,0
  } else if(scause == 0x8000000000000001L){
    800021ce:	06f70363          	beq	a4,a5,80002234 <devintr+0x80>
  }
}
    800021d2:	60e2                	ld	ra,24(sp)
    800021d4:	6442                	ld	s0,16(sp)
    800021d6:	64a2                	ld	s1,8(sp)
    800021d8:	6105                	addi	sp,sp,32
    800021da:	8082                	ret
     (scause & 0xff) == 9){
    800021dc:	0ff77793          	andi	a5,a4,255
  if((scause & 0x8000000000000000L) &&
    800021e0:	46a5                	li	a3,9
    800021e2:	fed792e3          	bne	a5,a3,800021c6 <devintr+0x12>
    int irq = plic_claim();
    800021e6:	00003097          	auipc	ra,0x3
    800021ea:	6c2080e7          	jalr	1730(ra) # 800058a8 <plic_claim>
    800021ee:	84aa                	mv	s1,a0
    if(irq == UART0_IRQ){
    800021f0:	47a9                	li	a5,10
    800021f2:	02f50763          	beq	a0,a5,80002220 <devintr+0x6c>
    } else if(irq == VIRTIO0_IRQ){
    800021f6:	4785                	li	a5,1
    800021f8:	02f50963          	beq	a0,a5,8000222a <devintr+0x76>
    return 1;
    800021fc:	4505                	li	a0,1
    } else if(irq){
    800021fe:	d8f1                	beqz	s1,800021d2 <devintr+0x1e>
      printf("unexpected interrupt irq=%d\n", irq);
    80002200:	85a6                	mv	a1,s1
    80002202:	00006517          	auipc	a0,0x6
    80002206:	16e50513          	addi	a0,a0,366 # 80008370 <states.1815+0x38>
    8000220a:	00004097          	auipc	ra,0x4
    8000220e:	4e8080e7          	jalr	1256(ra) # 800066f2 <printf>
      plic_complete(irq);
    80002212:	8526                	mv	a0,s1
    80002214:	00003097          	auipc	ra,0x3
    80002218:	6b8080e7          	jalr	1720(ra) # 800058cc <plic_complete>
    return 1;
    8000221c:	4505                	li	a0,1
    8000221e:	bf55                	j	800021d2 <devintr+0x1e>
      uartintr();
    80002220:	00005097          	auipc	ra,0x5
    80002224:	8f2080e7          	jalr	-1806(ra) # 80006b12 <uartintr>
    80002228:	b7ed                	j	80002212 <devintr+0x5e>
      virtio_disk_intr();
    8000222a:	00004097          	auipc	ra,0x4
    8000222e:	b82080e7          	jalr	-1150(ra) # 80005dac <virtio_disk_intr>
    80002232:	b7c5                	j	80002212 <devintr+0x5e>
    if(cpuid() == 0){
    80002234:	fffff097          	auipc	ra,0xfffff
    80002238:	20c080e7          	jalr	524(ra) # 80001440 <cpuid>
    8000223c:	c901                	beqz	a0,8000224c <devintr+0x98>
  asm volatile("csrr %0, sip" : "=r" (x) );
    8000223e:	144027f3          	csrr	a5,sip
    w_sip(r_sip() & ~2);
    80002242:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sip, %0" : : "r" (x));
    80002244:	14479073          	csrw	sip,a5
    return 2;
    80002248:	4509                	li	a0,2
    8000224a:	b761                	j	800021d2 <devintr+0x1e>
      clockintr();
    8000224c:	00000097          	auipc	ra,0x0
    80002250:	f22080e7          	jalr	-222(ra) # 8000216e <clockintr>
    80002254:	b7ed                	j	8000223e <devintr+0x8a>

0000000080002256 <usertrap>:
{
    80002256:	1101                	addi	sp,sp,-32
    80002258:	ec06                	sd	ra,24(sp)
    8000225a:	e822                	sd	s0,16(sp)
    8000225c:	e426                	sd	s1,8(sp)
    8000225e:	e04a                	sd	s2,0(sp)
    80002260:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002262:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    80002266:	1007f793          	andi	a5,a5,256
    8000226a:	e3b1                	bnez	a5,800022ae <usertrap+0x58>
  asm volatile("csrw stvec, %0" : : "r" (x));
    8000226c:	00003797          	auipc	a5,0x3
    80002270:	53478793          	addi	a5,a5,1332 # 800057a0 <kernelvec>
    80002274:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    80002278:	fffff097          	auipc	ra,0xfffff
    8000227c:	1f4080e7          	jalr	500(ra) # 8000146c <myproc>
    80002280:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80002282:	6d3c                	ld	a5,88(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80002284:	14102773          	csrr	a4,sepc
    80002288:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    8000228a:	142027f3          	csrr	a5,scause
  if(scause == 8) {
    8000228e:	4721                	li	a4,8
    80002290:	02e78763          	beq	a5,a4,800022be <usertrap+0x68>
  else if (scause == 13 || scause == 15) {
    80002294:	9bf5                	andi	a5,a5,-3
    80002296:	4735                	li	a4,13
    80002298:	04e78a63          	beq	a5,a4,800022ec <usertrap+0x96>
   else if ((which_dev = devintr()) != 0) {
    8000229c:	00000097          	auipc	ra,0x0
    800022a0:	f18080e7          	jalr	-232(ra) # 800021b4 <devintr>
    800022a4:	892a                	mv	s2,a0
    800022a6:	c13d                	beqz	a0,8000230c <usertrap+0xb6>
  if(p->killed)
    800022a8:	549c                	lw	a5,40(s1)
    800022aa:	c3cd                	beqz	a5,8000234c <usertrap+0xf6>
    800022ac:	a859                	j	80002342 <usertrap+0xec>
    panic("usertrap: not from user mode");
    800022ae:	00006517          	auipc	a0,0x6
    800022b2:	0e250513          	addi	a0,a0,226 # 80008390 <states.1815+0x58>
    800022b6:	00004097          	auipc	ra,0x4
    800022ba:	3f2080e7          	jalr	1010(ra) # 800066a8 <panic>
    if(p->killed)
    800022be:	551c                	lw	a5,40(a0)
    800022c0:	e385                	bnez	a5,800022e0 <usertrap+0x8a>
    p->trapframe->epc += 4;
    800022c2:	6cb8                	ld	a4,88(s1)
    800022c4:	6f1c                	ld	a5,24(a4)
    800022c6:	0791                	addi	a5,a5,4
    800022c8:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800022ca:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800022ce:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800022d2:	10079073          	csrw	sstatus,a5
    syscall();
    800022d6:	00000097          	auipc	ra,0x0
    800022da:	2c8080e7          	jalr	712(ra) # 8000259e <syscall>
    800022de:	a819                	j	800022f4 <usertrap+0x9e>
      exit(-1);
    800022e0:	557d                	li	a0,-1
    800022e2:	00000097          	auipc	ra,0x0
    800022e6:	aa2080e7          	jalr	-1374(ra) # 80001d84 <exit>
    800022ea:	bfe1                	j	800022c2 <usertrap+0x6c>
    handle_pgfault();
    800022ec:	00004097          	auipc	ra,0x4
    800022f0:	bea080e7          	jalr	-1046(ra) # 80005ed6 <handle_pgfault>
  if(p->killed)
    800022f4:	549c                	lw	a5,40(s1)
    800022f6:	e7a9                	bnez	a5,80002340 <usertrap+0xea>
  usertrapret();
    800022f8:	00000097          	auipc	ra,0x0
    800022fc:	dd8080e7          	jalr	-552(ra) # 800020d0 <usertrapret>
}
    80002300:	60e2                	ld	ra,24(sp)
    80002302:	6442                	ld	s0,16(sp)
    80002304:	64a2                	ld	s1,8(sp)
    80002306:	6902                	ld	s2,0(sp)
    80002308:	6105                	addi	sp,sp,32
    8000230a:	8082                	ret
  asm volatile("csrr %0, scause" : "=r" (x) );
    8000230c:	142025f3          	csrr	a1,scause
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80002310:	5890                	lw	a2,48(s1)
    80002312:	00006517          	auipc	a0,0x6
    80002316:	09e50513          	addi	a0,a0,158 # 800083b0 <states.1815+0x78>
    8000231a:	00004097          	auipc	ra,0x4
    8000231e:	3d8080e7          	jalr	984(ra) # 800066f2 <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80002322:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80002326:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    8000232a:	00006517          	auipc	a0,0x6
    8000232e:	0b650513          	addi	a0,a0,182 # 800083e0 <states.1815+0xa8>
    80002332:	00004097          	auipc	ra,0x4
    80002336:	3c0080e7          	jalr	960(ra) # 800066f2 <printf>
    p->killed = 1;
    8000233a:	4785                	li	a5,1
    8000233c:	d49c                	sw	a5,40(s1)
  if(p->killed)
    8000233e:	a011                	j	80002342 <usertrap+0xec>
    80002340:	4901                	li	s2,0
    exit(-1);
    80002342:	557d                	li	a0,-1
    80002344:	00000097          	auipc	ra,0x0
    80002348:	a40080e7          	jalr	-1472(ra) # 80001d84 <exit>
  if(which_dev == 2)
    8000234c:	4789                	li	a5,2
    8000234e:	faf915e3          	bne	s2,a5,800022f8 <usertrap+0xa2>
    yield();
    80002352:	fffff097          	auipc	ra,0xfffff
    80002356:	79a080e7          	jalr	1946(ra) # 80001aec <yield>
    8000235a:	bf79                	j	800022f8 <usertrap+0xa2>

000000008000235c <kerneltrap>:
{
    8000235c:	7179                	addi	sp,sp,-48
    8000235e:	f406                	sd	ra,40(sp)
    80002360:	f022                	sd	s0,32(sp)
    80002362:	ec26                	sd	s1,24(sp)
    80002364:	e84a                	sd	s2,16(sp)
    80002366:	e44e                	sd	s3,8(sp)
    80002368:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    8000236a:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000236e:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80002372:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80002376:	1004f793          	andi	a5,s1,256
    8000237a:	cb85                	beqz	a5,800023aa <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000237c:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80002380:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80002382:	ef85                	bnez	a5,800023ba <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80002384:	00000097          	auipc	ra,0x0
    80002388:	e30080e7          	jalr	-464(ra) # 800021b4 <devintr>
    8000238c:	cd1d                	beqz	a0,800023ca <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    8000238e:	4789                	li	a5,2
    80002390:	06f50a63          	beq	a0,a5,80002404 <kerneltrap+0xa8>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80002394:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80002398:	10049073          	csrw	sstatus,s1
}
    8000239c:	70a2                	ld	ra,40(sp)
    8000239e:	7402                	ld	s0,32(sp)
    800023a0:	64e2                	ld	s1,24(sp)
    800023a2:	6942                	ld	s2,16(sp)
    800023a4:	69a2                	ld	s3,8(sp)
    800023a6:	6145                	addi	sp,sp,48
    800023a8:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    800023aa:	00006517          	auipc	a0,0x6
    800023ae:	05650513          	addi	a0,a0,86 # 80008400 <states.1815+0xc8>
    800023b2:	00004097          	auipc	ra,0x4
    800023b6:	2f6080e7          	jalr	758(ra) # 800066a8 <panic>
    panic("kerneltrap: interrupts enabled");
    800023ba:	00006517          	auipc	a0,0x6
    800023be:	06e50513          	addi	a0,a0,110 # 80008428 <states.1815+0xf0>
    800023c2:	00004097          	auipc	ra,0x4
    800023c6:	2e6080e7          	jalr	742(ra) # 800066a8 <panic>
    printf("scause %p\n", scause);
    800023ca:	85ce                	mv	a1,s3
    800023cc:	00006517          	auipc	a0,0x6
    800023d0:	07c50513          	addi	a0,a0,124 # 80008448 <states.1815+0x110>
    800023d4:	00004097          	auipc	ra,0x4
    800023d8:	31e080e7          	jalr	798(ra) # 800066f2 <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    800023dc:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    800023e0:	14302673          	csrr	a2,stval
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    800023e4:	00006517          	auipc	a0,0x6
    800023e8:	07450513          	addi	a0,a0,116 # 80008458 <states.1815+0x120>
    800023ec:	00004097          	auipc	ra,0x4
    800023f0:	306080e7          	jalr	774(ra) # 800066f2 <printf>
    panic("kerneltrap");
    800023f4:	00006517          	auipc	a0,0x6
    800023f8:	07c50513          	addi	a0,a0,124 # 80008470 <states.1815+0x138>
    800023fc:	00004097          	auipc	ra,0x4
    80002400:	2ac080e7          	jalr	684(ra) # 800066a8 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80002404:	fffff097          	auipc	ra,0xfffff
    80002408:	068080e7          	jalr	104(ra) # 8000146c <myproc>
    8000240c:	d541                	beqz	a0,80002394 <kerneltrap+0x38>
    8000240e:	fffff097          	auipc	ra,0xfffff
    80002412:	05e080e7          	jalr	94(ra) # 8000146c <myproc>
    80002416:	4d18                	lw	a4,24(a0)
    80002418:	4791                	li	a5,4
    8000241a:	f6f71de3          	bne	a4,a5,80002394 <kerneltrap+0x38>
    yield();
    8000241e:	fffff097          	auipc	ra,0xfffff
    80002422:	6ce080e7          	jalr	1742(ra) # 80001aec <yield>
    80002426:	b7bd                	j	80002394 <kerneltrap+0x38>

0000000080002428 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80002428:	1101                	addi	sp,sp,-32
    8000242a:	ec06                	sd	ra,24(sp)
    8000242c:	e822                	sd	s0,16(sp)
    8000242e:	e426                	sd	s1,8(sp)
    80002430:	1000                	addi	s0,sp,32
    80002432:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80002434:	fffff097          	auipc	ra,0xfffff
    80002438:	038080e7          	jalr	56(ra) # 8000146c <myproc>
  switch (n) {
    8000243c:	4795                	li	a5,5
    8000243e:	0497e163          	bltu	a5,s1,80002480 <argraw+0x58>
    80002442:	048a                	slli	s1,s1,0x2
    80002444:	00006717          	auipc	a4,0x6
    80002448:	06470713          	addi	a4,a4,100 # 800084a8 <states.1815+0x170>
    8000244c:	94ba                	add	s1,s1,a4
    8000244e:	409c                	lw	a5,0(s1)
    80002450:	97ba                	add	a5,a5,a4
    80002452:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80002454:	6d3c                	ld	a5,88(a0)
    80002456:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80002458:	60e2                	ld	ra,24(sp)
    8000245a:	6442                	ld	s0,16(sp)
    8000245c:	64a2                	ld	s1,8(sp)
    8000245e:	6105                	addi	sp,sp,32
    80002460:	8082                	ret
    return p->trapframe->a1;
    80002462:	6d3c                	ld	a5,88(a0)
    80002464:	7fa8                	ld	a0,120(a5)
    80002466:	bfcd                	j	80002458 <argraw+0x30>
    return p->trapframe->a2;
    80002468:	6d3c                	ld	a5,88(a0)
    8000246a:	63c8                	ld	a0,128(a5)
    8000246c:	b7f5                	j	80002458 <argraw+0x30>
    return p->trapframe->a3;
    8000246e:	6d3c                	ld	a5,88(a0)
    80002470:	67c8                	ld	a0,136(a5)
    80002472:	b7dd                	j	80002458 <argraw+0x30>
    return p->trapframe->a4;
    80002474:	6d3c                	ld	a5,88(a0)
    80002476:	6bc8                	ld	a0,144(a5)
    80002478:	b7c5                	j	80002458 <argraw+0x30>
    return p->trapframe->a5;
    8000247a:	6d3c                	ld	a5,88(a0)
    8000247c:	6fc8                	ld	a0,152(a5)
    8000247e:	bfe9                	j	80002458 <argraw+0x30>
  panic("argraw");
    80002480:	00006517          	auipc	a0,0x6
    80002484:	00050513          	mv	a0,a0
    80002488:	00004097          	auipc	ra,0x4
    8000248c:	220080e7          	jalr	544(ra) # 800066a8 <panic>

0000000080002490 <fetchaddr>:
{
    80002490:	1101                	addi	sp,sp,-32
    80002492:	ec06                	sd	ra,24(sp)
    80002494:	e822                	sd	s0,16(sp)
    80002496:	e426                	sd	s1,8(sp)
    80002498:	e04a                	sd	s2,0(sp)
    8000249a:	1000                	addi	s0,sp,32
    8000249c:	84aa                	mv	s1,a0
    8000249e:	892e                	mv	s2,a1
  struct proc *p = myproc();
    800024a0:	fffff097          	auipc	ra,0xfffff
    800024a4:	fcc080e7          	jalr	-52(ra) # 8000146c <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    800024a8:	653c                	ld	a5,72(a0)
    800024aa:	02f4f863          	bgeu	s1,a5,800024da <fetchaddr+0x4a>
    800024ae:	00848713          	addi	a4,s1,8
    800024b2:	02e7e663          	bltu	a5,a4,800024de <fetchaddr+0x4e>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    800024b6:	46a1                	li	a3,8
    800024b8:	8626                	mv	a2,s1
    800024ba:	85ca                	mv	a1,s2
    800024bc:	6928                	ld	a0,80(a0)
    800024be:	ffffe097          	auipc	ra,0xffffe
    800024c2:	6f6080e7          	jalr	1782(ra) # 80000bb4 <copyin>
    800024c6:	00a03533          	snez	a0,a0
    800024ca:	40a00533          	neg	a0,a0
}
    800024ce:	60e2                	ld	ra,24(sp)
    800024d0:	6442                	ld	s0,16(sp)
    800024d2:	64a2                	ld	s1,8(sp)
    800024d4:	6902                	ld	s2,0(sp)
    800024d6:	6105                	addi	sp,sp,32
    800024d8:	8082                	ret
    return -1;
    800024da:	557d                	li	a0,-1
    800024dc:	bfcd                	j	800024ce <fetchaddr+0x3e>
    800024de:	557d                	li	a0,-1
    800024e0:	b7fd                	j	800024ce <fetchaddr+0x3e>

00000000800024e2 <fetchstr>:
{
    800024e2:	7179                	addi	sp,sp,-48
    800024e4:	f406                	sd	ra,40(sp)
    800024e6:	f022                	sd	s0,32(sp)
    800024e8:	ec26                	sd	s1,24(sp)
    800024ea:	e84a                	sd	s2,16(sp)
    800024ec:	e44e                	sd	s3,8(sp)
    800024ee:	1800                	addi	s0,sp,48
    800024f0:	892a                	mv	s2,a0
    800024f2:	84ae                	mv	s1,a1
    800024f4:	89b2                	mv	s3,a2
  struct proc *p = myproc();
    800024f6:	fffff097          	auipc	ra,0xfffff
    800024fa:	f76080e7          	jalr	-138(ra) # 8000146c <myproc>
  int err = copyinstr(p->pagetable, buf, addr, max);
    800024fe:	86ce                	mv	a3,s3
    80002500:	864a                	mv	a2,s2
    80002502:	85a6                	mv	a1,s1
    80002504:	6928                	ld	a0,80(a0)
    80002506:	ffffe097          	auipc	ra,0xffffe
    8000250a:	73a080e7          	jalr	1850(ra) # 80000c40 <copyinstr>
  if(err < 0)
    8000250e:	00054763          	bltz	a0,8000251c <fetchstr+0x3a>
  return strlen(buf);
    80002512:	8526                	mv	a0,s1
    80002514:	ffffe097          	auipc	ra,0xffffe
    80002518:	de8080e7          	jalr	-536(ra) # 800002fc <strlen>
}
    8000251c:	70a2                	ld	ra,40(sp)
    8000251e:	7402                	ld	s0,32(sp)
    80002520:	64e2                	ld	s1,24(sp)
    80002522:	6942                	ld	s2,16(sp)
    80002524:	69a2                	ld	s3,8(sp)
    80002526:	6145                	addi	sp,sp,48
    80002528:	8082                	ret

000000008000252a <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
    8000252a:	1101                	addi	sp,sp,-32
    8000252c:	ec06                	sd	ra,24(sp)
    8000252e:	e822                	sd	s0,16(sp)
    80002530:	e426                	sd	s1,8(sp)
    80002532:	1000                	addi	s0,sp,32
    80002534:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80002536:	00000097          	auipc	ra,0x0
    8000253a:	ef2080e7          	jalr	-270(ra) # 80002428 <argraw>
    8000253e:	c088                	sw	a0,0(s1)
  return 0;
}
    80002540:	4501                	li	a0,0
    80002542:	60e2                	ld	ra,24(sp)
    80002544:	6442                	ld	s0,16(sp)
    80002546:	64a2                	ld	s1,8(sp)
    80002548:	6105                	addi	sp,sp,32
    8000254a:	8082                	ret

000000008000254c <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int
argaddr(int n, uint64 *ip)
{
    8000254c:	1101                	addi	sp,sp,-32
    8000254e:	ec06                	sd	ra,24(sp)
    80002550:	e822                	sd	s0,16(sp)
    80002552:	e426                	sd	s1,8(sp)
    80002554:	1000                	addi	s0,sp,32
    80002556:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80002558:	00000097          	auipc	ra,0x0
    8000255c:	ed0080e7          	jalr	-304(ra) # 80002428 <argraw>
    80002560:	e088                	sd	a0,0(s1)
  return 0;
}
    80002562:	4501                	li	a0,0
    80002564:	60e2                	ld	ra,24(sp)
    80002566:	6442                	ld	s0,16(sp)
    80002568:	64a2                	ld	s1,8(sp)
    8000256a:	6105                	addi	sp,sp,32
    8000256c:	8082                	ret

000000008000256e <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    8000256e:	1101                	addi	sp,sp,-32
    80002570:	ec06                	sd	ra,24(sp)
    80002572:	e822                	sd	s0,16(sp)
    80002574:	e426                	sd	s1,8(sp)
    80002576:	e04a                	sd	s2,0(sp)
    80002578:	1000                	addi	s0,sp,32
    8000257a:	84ae                	mv	s1,a1
    8000257c:	8932                	mv	s2,a2
  *ip = argraw(n);
    8000257e:	00000097          	auipc	ra,0x0
    80002582:	eaa080e7          	jalr	-342(ra) # 80002428 <argraw>
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    return -1;
  return fetchstr(addr, buf, max);
    80002586:	864a                	mv	a2,s2
    80002588:	85a6                	mv	a1,s1
    8000258a:	00000097          	auipc	ra,0x0
    8000258e:	f58080e7          	jalr	-168(ra) # 800024e2 <fetchstr>
}
    80002592:	60e2                	ld	ra,24(sp)
    80002594:	6442                	ld	s0,16(sp)
    80002596:	64a2                	ld	s1,8(sp)
    80002598:	6902                	ld	s2,0(sp)
    8000259a:	6105                	addi	sp,sp,32
    8000259c:	8082                	ret

000000008000259e <syscall>:



void
syscall(void)
{
    8000259e:	1101                	addi	sp,sp,-32
    800025a0:	ec06                	sd	ra,24(sp)
    800025a2:	e822                	sd	s0,16(sp)
    800025a4:	e426                	sd	s1,8(sp)
    800025a6:	e04a                	sd	s2,0(sp)
    800025a8:	1000                	addi	s0,sp,32
  int num;
  struct proc *p = myproc();
    800025aa:	fffff097          	auipc	ra,0xfffff
    800025ae:	ec2080e7          	jalr	-318(ra) # 8000146c <myproc>
    800025b2:	84aa                	mv	s1,a0

  num = p->trapframe->a7;
    800025b4:	05853903          	ld	s2,88(a0) # 800084d8 <syscalls+0x18>
    800025b8:	0a893783          	ld	a5,168(s2)
    800025bc:	0007869b          	sext.w	a3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    800025c0:	37fd                	addiw	a5,a5,-1
    800025c2:	02000713          	li	a4,32
    800025c6:	00f76f63          	bltu	a4,a5,800025e4 <syscall+0x46>
    800025ca:	00369713          	slli	a4,a3,0x3
    800025ce:	00006797          	auipc	a5,0x6
    800025d2:	ef278793          	addi	a5,a5,-270 # 800084c0 <syscalls>
    800025d6:	97ba                	add	a5,a5,a4
    800025d8:	639c                	ld	a5,0(a5)
    800025da:	c789                	beqz	a5,800025e4 <syscall+0x46>
    p->trapframe->a0 = syscalls[num]();
    800025dc:	9782                	jalr	a5
    800025de:	06a93823          	sd	a0,112(s2)
    800025e2:	a839                	j	80002600 <syscall+0x62>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800025e4:	15848613          	addi	a2,s1,344
    800025e8:	588c                	lw	a1,48(s1)
    800025ea:	00006517          	auipc	a0,0x6
    800025ee:	e9e50513          	addi	a0,a0,-354 # 80008488 <states.1815+0x150>
    800025f2:	00004097          	auipc	ra,0x4
    800025f6:	100080e7          	jalr	256(ra) # 800066f2 <printf>
            p->pid, p->name, num);
    p->trapframe->a0 = -1;
    800025fa:	6cbc                	ld	a5,88(s1)
    800025fc:	577d                	li	a4,-1
    800025fe:	fbb8                	sd	a4,112(a5)
  }
}
    80002600:	60e2                	ld	ra,24(sp)
    80002602:	6442                	ld	s0,16(sp)
    80002604:	64a2                	ld	s1,8(sp)
    80002606:	6902                	ld	s2,0(sp)
    80002608:	6105                	addi	sp,sp,32
    8000260a:	8082                	ret

000000008000260c <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    8000260c:	1101                	addi	sp,sp,-32
    8000260e:	ec06                	sd	ra,24(sp)
    80002610:	e822                	sd	s0,16(sp)
    80002612:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    80002614:	fec40593          	addi	a1,s0,-20
    80002618:	4501                	li	a0,0
    8000261a:	00000097          	auipc	ra,0x0
    8000261e:	f10080e7          	jalr	-240(ra) # 8000252a <argint>
    return -1;
    80002622:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80002624:	00054963          	bltz	a0,80002636 <sys_exit+0x2a>
  exit(n);
    80002628:	fec42503          	lw	a0,-20(s0)
    8000262c:	fffff097          	auipc	ra,0xfffff
    80002630:	758080e7          	jalr	1880(ra) # 80001d84 <exit>
  return 0;  // not reached
    80002634:	4781                	li	a5,0
}
    80002636:	853e                	mv	a0,a5
    80002638:	60e2                	ld	ra,24(sp)
    8000263a:	6442                	ld	s0,16(sp)
    8000263c:	6105                	addi	sp,sp,32
    8000263e:	8082                	ret

0000000080002640 <sys_getpid>:

uint64
sys_getpid(void)
{
    80002640:	1141                	addi	sp,sp,-16
    80002642:	e406                	sd	ra,8(sp)
    80002644:	e022                	sd	s0,0(sp)
    80002646:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80002648:	fffff097          	auipc	ra,0xfffff
    8000264c:	e24080e7          	jalr	-476(ra) # 8000146c <myproc>
}
    80002650:	5908                	lw	a0,48(a0)
    80002652:	60a2                	ld	ra,8(sp)
    80002654:	6402                	ld	s0,0(sp)
    80002656:	0141                	addi	sp,sp,16
    80002658:	8082                	ret

000000008000265a <sys_fork>:

uint64
sys_fork(void)
{
    8000265a:	1141                	addi	sp,sp,-16
    8000265c:	e406                	sd	ra,8(sp)
    8000265e:	e022                	sd	s0,0(sp)
    80002660:	0800                	addi	s0,sp,16
  return fork();
    80002662:	fffff097          	auipc	ra,0xfffff
    80002666:	1d8080e7          	jalr	472(ra) # 8000183a <fork>
}
    8000266a:	60a2                	ld	ra,8(sp)
    8000266c:	6402                	ld	s0,0(sp)
    8000266e:	0141                	addi	sp,sp,16
    80002670:	8082                	ret

0000000080002672 <sys_wait>:

uint64
sys_wait(void)
{
    80002672:	1101                	addi	sp,sp,-32
    80002674:	ec06                	sd	ra,24(sp)
    80002676:	e822                	sd	s0,16(sp)
    80002678:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    8000267a:	fe840593          	addi	a1,s0,-24
    8000267e:	4501                	li	a0,0
    80002680:	00000097          	auipc	ra,0x0
    80002684:	ecc080e7          	jalr	-308(ra) # 8000254c <argaddr>
    80002688:	87aa                	mv	a5,a0
    return -1;
    8000268a:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    8000268c:	0007c863          	bltz	a5,8000269c <sys_wait+0x2a>
  return wait(p);
    80002690:	fe843503          	ld	a0,-24(s0)
    80002694:	fffff097          	auipc	ra,0xfffff
    80002698:	4f8080e7          	jalr	1272(ra) # 80001b8c <wait>
}
    8000269c:	60e2                	ld	ra,24(sp)
    8000269e:	6442                	ld	s0,16(sp)
    800026a0:	6105                	addi	sp,sp,32
    800026a2:	8082                	ret

00000000800026a4 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    800026a4:	7179                	addi	sp,sp,-48
    800026a6:	f406                	sd	ra,40(sp)
    800026a8:	f022                	sd	s0,32(sp)
    800026aa:	ec26                	sd	s1,24(sp)
    800026ac:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    800026ae:	fdc40593          	addi	a1,s0,-36
    800026b2:	4501                	li	a0,0
    800026b4:	00000097          	auipc	ra,0x0
    800026b8:	e76080e7          	jalr	-394(ra) # 8000252a <argint>
    800026bc:	87aa                	mv	a5,a0
    return -1;
    800026be:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    800026c0:	0207c063          	bltz	a5,800026e0 <sys_sbrk+0x3c>
  
  addr = myproc()->sz;
    800026c4:	fffff097          	auipc	ra,0xfffff
    800026c8:	da8080e7          	jalr	-600(ra) # 8000146c <myproc>
    800026cc:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    800026ce:	fdc42503          	lw	a0,-36(s0)
    800026d2:	fffff097          	auipc	ra,0xfffff
    800026d6:	0f4080e7          	jalr	244(ra) # 800017c6 <growproc>
    800026da:	00054863          	bltz	a0,800026ea <sys_sbrk+0x46>
    return -1;
  return addr;
    800026de:	8526                	mv	a0,s1
}
    800026e0:	70a2                	ld	ra,40(sp)
    800026e2:	7402                	ld	s0,32(sp)
    800026e4:	64e2                	ld	s1,24(sp)
    800026e6:	6145                	addi	sp,sp,48
    800026e8:	8082                	ret
    return -1;
    800026ea:	557d                	li	a0,-1
    800026ec:	bfd5                	j	800026e0 <sys_sbrk+0x3c>

00000000800026ee <sys_sleep>:

uint64
sys_sleep(void)
{
    800026ee:	7139                	addi	sp,sp,-64
    800026f0:	fc06                	sd	ra,56(sp)
    800026f2:	f822                	sd	s0,48(sp)
    800026f4:	f426                	sd	s1,40(sp)
    800026f6:	f04a                	sd	s2,32(sp)
    800026f8:	ec4e                	sd	s3,24(sp)
    800026fa:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;


  if(argint(0, &n) < 0)
    800026fc:	fcc40593          	addi	a1,s0,-52
    80002700:	4501                	li	a0,0
    80002702:	00000097          	auipc	ra,0x0
    80002706:	e28080e7          	jalr	-472(ra) # 8000252a <argint>
    return -1;
    8000270a:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    8000270c:	06054563          	bltz	a0,80002776 <sys_sleep+0x88>
  acquire(&tickslock);
    80002710:	0000c517          	auipc	a0,0xc
    80002714:	78050513          	addi	a0,a0,1920 # 8000ee90 <tickslock>
    80002718:	00004097          	auipc	ra,0x4
    8000271c:	4da080e7          	jalr	1242(ra) # 80006bf2 <acquire>
  ticks0 = ticks;
    80002720:	00007917          	auipc	s2,0x7
    80002724:	90092903          	lw	s2,-1792(s2) # 80009020 <ticks>
  while(ticks - ticks0 < n){
    80002728:	fcc42783          	lw	a5,-52(s0)
    8000272c:	cf85                	beqz	a5,80002764 <sys_sleep+0x76>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    8000272e:	0000c997          	auipc	s3,0xc
    80002732:	76298993          	addi	s3,s3,1890 # 8000ee90 <tickslock>
    80002736:	00007497          	auipc	s1,0x7
    8000273a:	8ea48493          	addi	s1,s1,-1814 # 80009020 <ticks>
    if(myproc()->killed){
    8000273e:	fffff097          	auipc	ra,0xfffff
    80002742:	d2e080e7          	jalr	-722(ra) # 8000146c <myproc>
    80002746:	551c                	lw	a5,40(a0)
    80002748:	ef9d                	bnez	a5,80002786 <sys_sleep+0x98>
    sleep(&ticks, &tickslock);
    8000274a:	85ce                	mv	a1,s3
    8000274c:	8526                	mv	a0,s1
    8000274e:	fffff097          	auipc	ra,0xfffff
    80002752:	3da080e7          	jalr	986(ra) # 80001b28 <sleep>
  while(ticks - ticks0 < n){
    80002756:	409c                	lw	a5,0(s1)
    80002758:	412787bb          	subw	a5,a5,s2
    8000275c:	fcc42703          	lw	a4,-52(s0)
    80002760:	fce7efe3          	bltu	a5,a4,8000273e <sys_sleep+0x50>
  }
  release(&tickslock);
    80002764:	0000c517          	auipc	a0,0xc
    80002768:	72c50513          	addi	a0,a0,1836 # 8000ee90 <tickslock>
    8000276c:	00004097          	auipc	ra,0x4
    80002770:	53a080e7          	jalr	1338(ra) # 80006ca6 <release>
  return 0;
    80002774:	4781                	li	a5,0
}
    80002776:	853e                	mv	a0,a5
    80002778:	70e2                	ld	ra,56(sp)
    8000277a:	7442                	ld	s0,48(sp)
    8000277c:	74a2                	ld	s1,40(sp)
    8000277e:	7902                	ld	s2,32(sp)
    80002780:	69e2                	ld	s3,24(sp)
    80002782:	6121                	addi	sp,sp,64
    80002784:	8082                	ret
      release(&tickslock);
    80002786:	0000c517          	auipc	a0,0xc
    8000278a:	70a50513          	addi	a0,a0,1802 # 8000ee90 <tickslock>
    8000278e:	00004097          	auipc	ra,0x4
    80002792:	518080e7          	jalr	1304(ra) # 80006ca6 <release>
      return -1;
    80002796:	57fd                	li	a5,-1
    80002798:	bff9                	j	80002776 <sys_sleep+0x88>

000000008000279a <sys_pgaccess>:


#ifdef LAB_PGTBL
int
sys_pgaccess(void)
{
    8000279a:	1141                	addi	sp,sp,-16
    8000279c:	e422                	sd	s0,8(sp)
    8000279e:	0800                	addi	s0,sp,16
  // lab pgtbl: your code here.
  return 0;
}
    800027a0:	4501                	li	a0,0
    800027a2:	6422                	ld	s0,8(sp)
    800027a4:	0141                	addi	sp,sp,16
    800027a6:	8082                	ret

00000000800027a8 <sys_kill>:
#endif

uint64
sys_kill(void)
{
    800027a8:	1101                	addi	sp,sp,-32
    800027aa:	ec06                	sd	ra,24(sp)
    800027ac:	e822                	sd	s0,16(sp)
    800027ae:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    800027b0:	fec40593          	addi	a1,s0,-20
    800027b4:	4501                	li	a0,0
    800027b6:	00000097          	auipc	ra,0x0
    800027ba:	d74080e7          	jalr	-652(ra) # 8000252a <argint>
    800027be:	87aa                	mv	a5,a0
    return -1;
    800027c0:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    800027c2:	0007c863          	bltz	a5,800027d2 <sys_kill+0x2a>
  return kill(pid);
    800027c6:	fec42503          	lw	a0,-20(s0)
    800027ca:	fffff097          	auipc	ra,0xfffff
    800027ce:	690080e7          	jalr	1680(ra) # 80001e5a <kill>
}
    800027d2:	60e2                	ld	ra,24(sp)
    800027d4:	6442                	ld	s0,16(sp)
    800027d6:	6105                	addi	sp,sp,32
    800027d8:	8082                	ret

00000000800027da <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    800027da:	1101                	addi	sp,sp,-32
    800027dc:	ec06                	sd	ra,24(sp)
    800027de:	e822                	sd	s0,16(sp)
    800027e0:	e426                	sd	s1,8(sp)
    800027e2:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    800027e4:	0000c517          	auipc	a0,0xc
    800027e8:	6ac50513          	addi	a0,a0,1708 # 8000ee90 <tickslock>
    800027ec:	00004097          	auipc	ra,0x4
    800027f0:	406080e7          	jalr	1030(ra) # 80006bf2 <acquire>
  xticks = ticks;
    800027f4:	00007497          	auipc	s1,0x7
    800027f8:	82c4a483          	lw	s1,-2004(s1) # 80009020 <ticks>
  release(&tickslock);
    800027fc:	0000c517          	auipc	a0,0xc
    80002800:	69450513          	addi	a0,a0,1684 # 8000ee90 <tickslock>
    80002804:	00004097          	auipc	ra,0x4
    80002808:	4a2080e7          	jalr	1186(ra) # 80006ca6 <release>
  return xticks;
}
    8000280c:	02049513          	slli	a0,s1,0x20
    80002810:	9101                	srli	a0,a0,0x20
    80002812:	60e2                	ld	ra,24(sp)
    80002814:	6442                	ld	s0,16(sp)
    80002816:	64a2                	ld	s1,8(sp)
    80002818:	6105                	addi	sp,sp,32
    8000281a:	8082                	ret

000000008000281c <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    8000281c:	7179                	addi	sp,sp,-48
    8000281e:	f406                	sd	ra,40(sp)
    80002820:	f022                	sd	s0,32(sp)
    80002822:	ec26                	sd	s1,24(sp)
    80002824:	e84a                	sd	s2,16(sp)
    80002826:	e44e                	sd	s3,8(sp)
    80002828:	1800                	addi	s0,sp,48
    8000282a:	892a                	mv	s2,a0
    8000282c:	89ae                	mv	s3,a1
  struct buf *b;

  acquire(&bcache.lock);
    8000282e:	0000c517          	auipc	a0,0xc
    80002832:	67a50513          	addi	a0,a0,1658 # 8000eea8 <bcache>
    80002836:	00004097          	auipc	ra,0x4
    8000283a:	3bc080e7          	jalr	956(ra) # 80006bf2 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8000283e:	00015497          	auipc	s1,0x15
    80002842:	9224b483          	ld	s1,-1758(s1) # 80017160 <bcache+0x82b8>
    80002846:	00015797          	auipc	a5,0x15
    8000284a:	8ca78793          	addi	a5,a5,-1846 # 80017110 <bcache+0x8268>
    8000284e:	02f48f63          	beq	s1,a5,8000288c <bget+0x70>
    80002852:	873e                	mv	a4,a5
    80002854:	a021                	j	8000285c <bget+0x40>
    80002856:	68a4                	ld	s1,80(s1)
    80002858:	02e48a63          	beq	s1,a4,8000288c <bget+0x70>
    if(b->dev == dev && b->blockno == blockno){
    8000285c:	449c                	lw	a5,8(s1)
    8000285e:	ff279ce3          	bne	a5,s2,80002856 <bget+0x3a>
    80002862:	44dc                	lw	a5,12(s1)
    80002864:	ff3799e3          	bne	a5,s3,80002856 <bget+0x3a>
      b->refcnt++;
    80002868:	40bc                	lw	a5,64(s1)
    8000286a:	2785                	addiw	a5,a5,1
    8000286c:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    8000286e:	0000c517          	auipc	a0,0xc
    80002872:	63a50513          	addi	a0,a0,1594 # 8000eea8 <bcache>
    80002876:	00004097          	auipc	ra,0x4
    8000287a:	430080e7          	jalr	1072(ra) # 80006ca6 <release>
      acquiresleep(&b->lock);
    8000287e:	01048513          	addi	a0,s1,16
    80002882:	00001097          	auipc	ra,0x1
    80002886:	736080e7          	jalr	1846(ra) # 80003fb8 <acquiresleep>
      return b;
    8000288a:	a8b9                	j	800028e8 <bget+0xcc>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8000288c:	00015497          	auipc	s1,0x15
    80002890:	8cc4b483          	ld	s1,-1844(s1) # 80017158 <bcache+0x82b0>
    80002894:	00015797          	auipc	a5,0x15
    80002898:	87c78793          	addi	a5,a5,-1924 # 80017110 <bcache+0x8268>
    8000289c:	00f48863          	beq	s1,a5,800028ac <bget+0x90>
    800028a0:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    800028a2:	40bc                	lw	a5,64(s1)
    800028a4:	cf81                	beqz	a5,800028bc <bget+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800028a6:	64a4                	ld	s1,72(s1)
    800028a8:	fee49de3          	bne	s1,a4,800028a2 <bget+0x86>
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
    800028ac:	00006517          	auipc	a0,0x6
    800028b0:	d2450513          	addi	a0,a0,-732 # 800085d0 <syscalls+0x110>
    800028b4:	00004097          	auipc	ra,0x4
    800028b8:	df4080e7          	jalr	-524(ra) # 800066a8 <panic>
      b->dev = dev;
    800028bc:	0124a423          	sw	s2,8(s1)
      b->blockno = blockno;
    800028c0:	0134a623          	sw	s3,12(s1)
      b->valid = 0;
    800028c4:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    800028c8:	4785                	li	a5,1
    800028ca:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    800028cc:	0000c517          	auipc	a0,0xc
    800028d0:	5dc50513          	addi	a0,a0,1500 # 8000eea8 <bcache>
    800028d4:	00004097          	auipc	ra,0x4
    800028d8:	3d2080e7          	jalr	978(ra) # 80006ca6 <release>
      acquiresleep(&b->lock);
    800028dc:	01048513          	addi	a0,s1,16
    800028e0:	00001097          	auipc	ra,0x1
    800028e4:	6d8080e7          	jalr	1752(ra) # 80003fb8 <acquiresleep>
}
    800028e8:	8526                	mv	a0,s1
    800028ea:	70a2                	ld	ra,40(sp)
    800028ec:	7402                	ld	s0,32(sp)
    800028ee:	64e2                	ld	s1,24(sp)
    800028f0:	6942                	ld	s2,16(sp)
    800028f2:	69a2                	ld	s3,8(sp)
    800028f4:	6145                	addi	sp,sp,48
    800028f6:	8082                	ret

00000000800028f8 <binit>:
{
    800028f8:	7179                	addi	sp,sp,-48
    800028fa:	f406                	sd	ra,40(sp)
    800028fc:	f022                	sd	s0,32(sp)
    800028fe:	ec26                	sd	s1,24(sp)
    80002900:	e84a                	sd	s2,16(sp)
    80002902:	e44e                	sd	s3,8(sp)
    80002904:	e052                	sd	s4,0(sp)
    80002906:	1800                	addi	s0,sp,48
  initlock(&bcache.lock, "bcache");
    80002908:	00006597          	auipc	a1,0x6
    8000290c:	ce058593          	addi	a1,a1,-800 # 800085e8 <syscalls+0x128>
    80002910:	0000c517          	auipc	a0,0xc
    80002914:	59850513          	addi	a0,a0,1432 # 8000eea8 <bcache>
    80002918:	00004097          	auipc	ra,0x4
    8000291c:	24a080e7          	jalr	586(ra) # 80006b62 <initlock>
  bcache.head.prev = &bcache.head;
    80002920:	00014797          	auipc	a5,0x14
    80002924:	58878793          	addi	a5,a5,1416 # 80016ea8 <bcache+0x8000>
    80002928:	00014717          	auipc	a4,0x14
    8000292c:	7e870713          	addi	a4,a4,2024 # 80017110 <bcache+0x8268>
    80002930:	2ae7b823          	sd	a4,688(a5)
  bcache.head.next = &bcache.head;
    80002934:	2ae7bc23          	sd	a4,696(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80002938:	0000c497          	auipc	s1,0xc
    8000293c:	58848493          	addi	s1,s1,1416 # 8000eec0 <bcache+0x18>
    b->next = bcache.head.next;
    80002940:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    80002942:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    80002944:	00006a17          	auipc	s4,0x6
    80002948:	caca0a13          	addi	s4,s4,-852 # 800085f0 <syscalls+0x130>
    b->next = bcache.head.next;
    8000294c:	2b893783          	ld	a5,696(s2)
    80002950:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    80002952:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    80002956:	85d2                	mv	a1,s4
    80002958:	01048513          	addi	a0,s1,16
    8000295c:	00001097          	auipc	ra,0x1
    80002960:	622080e7          	jalr	1570(ra) # 80003f7e <initsleeplock>
    bcache.head.next->prev = b;
    80002964:	2b893783          	ld	a5,696(s2)
    80002968:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    8000296a:	2a993c23          	sd	s1,696(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000296e:	45848493          	addi	s1,s1,1112
    80002972:	fd349de3          	bne	s1,s3,8000294c <binit+0x54>
}
    80002976:	70a2                	ld	ra,40(sp)
    80002978:	7402                	ld	s0,32(sp)
    8000297a:	64e2                	ld	s1,24(sp)
    8000297c:	6942                	ld	s2,16(sp)
    8000297e:	69a2                	ld	s3,8(sp)
    80002980:	6a02                	ld	s4,0(sp)
    80002982:	6145                	addi	sp,sp,48
    80002984:	8082                	ret

0000000080002986 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80002986:	1101                	addi	sp,sp,-32
    80002988:	ec06                	sd	ra,24(sp)
    8000298a:	e822                	sd	s0,16(sp)
    8000298c:	e426                	sd	s1,8(sp)
    8000298e:	1000                	addi	s0,sp,32
  struct buf *b;

  b = bget(dev, blockno);
    80002990:	00000097          	auipc	ra,0x0
    80002994:	e8c080e7          	jalr	-372(ra) # 8000281c <bget>
    80002998:	84aa                	mv	s1,a0
  if(!b->valid) {
    8000299a:	411c                	lw	a5,0(a0)
    8000299c:	c799                	beqz	a5,800029aa <bread+0x24>
    virtio_disk_rw(b, 0);
    b->valid = 1;
  }
  return b;
}
    8000299e:	8526                	mv	a0,s1
    800029a0:	60e2                	ld	ra,24(sp)
    800029a2:	6442                	ld	s0,16(sp)
    800029a4:	64a2                	ld	s1,8(sp)
    800029a6:	6105                	addi	sp,sp,32
    800029a8:	8082                	ret
    virtio_disk_rw(b, 0);
    800029aa:	4581                	li	a1,0
    800029ac:	00003097          	auipc	ra,0x3
    800029b0:	12a080e7          	jalr	298(ra) # 80005ad6 <virtio_disk_rw>
    b->valid = 1;
    800029b4:	4785                	li	a5,1
    800029b6:	c09c                	sw	a5,0(s1)
  return b;
    800029b8:	b7dd                	j	8000299e <bread+0x18>

00000000800029ba <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    800029ba:	1101                	addi	sp,sp,-32
    800029bc:	ec06                	sd	ra,24(sp)
    800029be:	e822                	sd	s0,16(sp)
    800029c0:	e426                	sd	s1,8(sp)
    800029c2:	1000                	addi	s0,sp,32
    800029c4:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    800029c6:	0541                	addi	a0,a0,16
    800029c8:	00001097          	auipc	ra,0x1
    800029cc:	68a080e7          	jalr	1674(ra) # 80004052 <holdingsleep>
    800029d0:	cd01                	beqz	a0,800029e8 <bwrite+0x2e>
    panic("bwrite");
  virtio_disk_rw(b, 1);
    800029d2:	4585                	li	a1,1
    800029d4:	8526                	mv	a0,s1
    800029d6:	00003097          	auipc	ra,0x3
    800029da:	100080e7          	jalr	256(ra) # 80005ad6 <virtio_disk_rw>
}
    800029de:	60e2                	ld	ra,24(sp)
    800029e0:	6442                	ld	s0,16(sp)
    800029e2:	64a2                	ld	s1,8(sp)
    800029e4:	6105                	addi	sp,sp,32
    800029e6:	8082                	ret
    panic("bwrite");
    800029e8:	00006517          	auipc	a0,0x6
    800029ec:	c1050513          	addi	a0,a0,-1008 # 800085f8 <syscalls+0x138>
    800029f0:	00004097          	auipc	ra,0x4
    800029f4:	cb8080e7          	jalr	-840(ra) # 800066a8 <panic>

00000000800029f8 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    800029f8:	1101                	addi	sp,sp,-32
    800029fa:	ec06                	sd	ra,24(sp)
    800029fc:	e822                	sd	s0,16(sp)
    800029fe:	e426                	sd	s1,8(sp)
    80002a00:	e04a                	sd	s2,0(sp)
    80002a02:	1000                	addi	s0,sp,32
    80002a04:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80002a06:	01050913          	addi	s2,a0,16
    80002a0a:	854a                	mv	a0,s2
    80002a0c:	00001097          	auipc	ra,0x1
    80002a10:	646080e7          	jalr	1606(ra) # 80004052 <holdingsleep>
    80002a14:	c92d                	beqz	a0,80002a86 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80002a16:	854a                	mv	a0,s2
    80002a18:	00001097          	auipc	ra,0x1
    80002a1c:	5f6080e7          	jalr	1526(ra) # 8000400e <releasesleep>

  acquire(&bcache.lock);
    80002a20:	0000c517          	auipc	a0,0xc
    80002a24:	48850513          	addi	a0,a0,1160 # 8000eea8 <bcache>
    80002a28:	00004097          	auipc	ra,0x4
    80002a2c:	1ca080e7          	jalr	458(ra) # 80006bf2 <acquire>
  b->refcnt--;
    80002a30:	40bc                	lw	a5,64(s1)
    80002a32:	37fd                	addiw	a5,a5,-1
    80002a34:	0007871b          	sext.w	a4,a5
    80002a38:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80002a3a:	eb05                	bnez	a4,80002a6a <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80002a3c:	68bc                	ld	a5,80(s1)
    80002a3e:	64b8                	ld	a4,72(s1)
    80002a40:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80002a42:	64bc                	ld	a5,72(s1)
    80002a44:	68b8                	ld	a4,80(s1)
    80002a46:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80002a48:	00014797          	auipc	a5,0x14
    80002a4c:	46078793          	addi	a5,a5,1120 # 80016ea8 <bcache+0x8000>
    80002a50:	2b87b703          	ld	a4,696(a5)
    80002a54:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80002a56:	00014717          	auipc	a4,0x14
    80002a5a:	6ba70713          	addi	a4,a4,1722 # 80017110 <bcache+0x8268>
    80002a5e:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80002a60:	2b87b703          	ld	a4,696(a5)
    80002a64:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80002a66:	2a97bc23          	sd	s1,696(a5)
  }

  release(&bcache.lock);
    80002a6a:	0000c517          	auipc	a0,0xc
    80002a6e:	43e50513          	addi	a0,a0,1086 # 8000eea8 <bcache>
    80002a72:	00004097          	auipc	ra,0x4
    80002a76:	234080e7          	jalr	564(ra) # 80006ca6 <release>
}
    80002a7a:	60e2                	ld	ra,24(sp)
    80002a7c:	6442                	ld	s0,16(sp)
    80002a7e:	64a2                	ld	s1,8(sp)
    80002a80:	6902                	ld	s2,0(sp)
    80002a82:	6105                	addi	sp,sp,32
    80002a84:	8082                	ret
    panic("brelse");
    80002a86:	00006517          	auipc	a0,0x6
    80002a8a:	b7a50513          	addi	a0,a0,-1158 # 80008600 <syscalls+0x140>
    80002a8e:	00004097          	auipc	ra,0x4
    80002a92:	c1a080e7          	jalr	-998(ra) # 800066a8 <panic>

0000000080002a96 <bpin>:

void
bpin(struct buf *b) {
    80002a96:	1101                	addi	sp,sp,-32
    80002a98:	ec06                	sd	ra,24(sp)
    80002a9a:	e822                	sd	s0,16(sp)
    80002a9c:	e426                	sd	s1,8(sp)
    80002a9e:	1000                	addi	s0,sp,32
    80002aa0:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80002aa2:	0000c517          	auipc	a0,0xc
    80002aa6:	40650513          	addi	a0,a0,1030 # 8000eea8 <bcache>
    80002aaa:	00004097          	auipc	ra,0x4
    80002aae:	148080e7          	jalr	328(ra) # 80006bf2 <acquire>
  b->refcnt++;
    80002ab2:	40bc                	lw	a5,64(s1)
    80002ab4:	2785                	addiw	a5,a5,1
    80002ab6:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80002ab8:	0000c517          	auipc	a0,0xc
    80002abc:	3f050513          	addi	a0,a0,1008 # 8000eea8 <bcache>
    80002ac0:	00004097          	auipc	ra,0x4
    80002ac4:	1e6080e7          	jalr	486(ra) # 80006ca6 <release>
}
    80002ac8:	60e2                	ld	ra,24(sp)
    80002aca:	6442                	ld	s0,16(sp)
    80002acc:	64a2                	ld	s1,8(sp)
    80002ace:	6105                	addi	sp,sp,32
    80002ad0:	8082                	ret

0000000080002ad2 <bunpin>:

void
bunpin(struct buf *b) {
    80002ad2:	1101                	addi	sp,sp,-32
    80002ad4:	ec06                	sd	ra,24(sp)
    80002ad6:	e822                	sd	s0,16(sp)
    80002ad8:	e426                	sd	s1,8(sp)
    80002ada:	1000                	addi	s0,sp,32
    80002adc:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80002ade:	0000c517          	auipc	a0,0xc
    80002ae2:	3ca50513          	addi	a0,a0,970 # 8000eea8 <bcache>
    80002ae6:	00004097          	auipc	ra,0x4
    80002aea:	10c080e7          	jalr	268(ra) # 80006bf2 <acquire>
  b->refcnt--;
    80002aee:	40bc                	lw	a5,64(s1)
    80002af0:	37fd                	addiw	a5,a5,-1
    80002af2:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80002af4:	0000c517          	auipc	a0,0xc
    80002af8:	3b450513          	addi	a0,a0,948 # 8000eea8 <bcache>
    80002afc:	00004097          	auipc	ra,0x4
    80002b00:	1aa080e7          	jalr	426(ra) # 80006ca6 <release>
}
    80002b04:	60e2                	ld	ra,24(sp)
    80002b06:	6442                	ld	s0,16(sp)
    80002b08:	64a2                	ld	s1,8(sp)
    80002b0a:	6105                	addi	sp,sp,32
    80002b0c:	8082                	ret

0000000080002b0e <write_page_to_disk>:

/* NTU OS 2024 */
/* Write 4096 bytes page to the eight consecutive 512-byte blocks starting at blk. */
void write_page_to_disk(uint dev, char *page, uint blk) {
    80002b0e:	7179                	addi	sp,sp,-48
    80002b10:	f406                	sd	ra,40(sp)
    80002b12:	f022                	sd	s0,32(sp)
    80002b14:	ec26                	sd	s1,24(sp)
    80002b16:	e84a                	sd	s2,16(sp)
    80002b18:	e44e                	sd	s3,8(sp)
    80002b1a:	e052                	sd	s4,0(sp)
    80002b1c:	1800                	addi	s0,sp,48
    80002b1e:	89b2                	mv	s3,a2
  for (int i = 0; i < 8; i++) {
    80002b20:	892e                	mv	s2,a1
    80002b22:	6a05                	lui	s4,0x1
    80002b24:	9a2e                	add	s4,s4,a1
    // disk
    int offset = i * 512;
    int blk_idx = blk + i;
    struct buf *buffer = bget(ROOTDEV, blk_idx);
    80002b26:	85ce                	mv	a1,s3
    80002b28:	4505                	li	a0,1
    80002b2a:	00000097          	auipc	ra,0x0
    80002b2e:	cf2080e7          	jalr	-782(ra) # 8000281c <bget>
    80002b32:	84aa                	mv	s1,a0
    memmove(buffer->data, page + offset, 512);
    80002b34:	20000613          	li	a2,512
    80002b38:	85ca                	mv	a1,s2
    80002b3a:	05850513          	addi	a0,a0,88
    80002b3e:	ffffd097          	auipc	ra,0xffffd
    80002b42:	69a080e7          	jalr	1690(ra) # 800001d8 <memmove>
    bwrite(buffer);
    80002b46:	8526                	mv	a0,s1
    80002b48:	00000097          	auipc	ra,0x0
    80002b4c:	e72080e7          	jalr	-398(ra) # 800029ba <bwrite>
    brelse(buffer);
    80002b50:	8526                	mv	a0,s1
    80002b52:	00000097          	auipc	ra,0x0
    80002b56:	ea6080e7          	jalr	-346(ra) # 800029f8 <brelse>
  for (int i = 0; i < 8; i++) {
    80002b5a:	2985                	addiw	s3,s3,1
    80002b5c:	20090913          	addi	s2,s2,512
    80002b60:	fd4913e3          	bne	s2,s4,80002b26 <write_page_to_disk+0x18>
  }
}
    80002b64:	70a2                	ld	ra,40(sp)
    80002b66:	7402                	ld	s0,32(sp)
    80002b68:	64e2                	ld	s1,24(sp)
    80002b6a:	6942                	ld	s2,16(sp)
    80002b6c:	69a2                	ld	s3,8(sp)
    80002b6e:	6a02                	ld	s4,0(sp)
    80002b70:	6145                	addi	sp,sp,48
    80002b72:	8082                	ret

0000000080002b74 <read_page_from_disk>:

/* NTU OS 2024 */
/* Read 4096 bytes from the eight consecutive 512-byte blocks starting at blk into page. */
void read_page_from_disk(uint dev, char *page, uint blk) {
    80002b74:	7179                	addi	sp,sp,-48
    80002b76:	f406                	sd	ra,40(sp)
    80002b78:	f022                	sd	s0,32(sp)
    80002b7a:	ec26                	sd	s1,24(sp)
    80002b7c:	e84a                	sd	s2,16(sp)
    80002b7e:	e44e                	sd	s3,8(sp)
    80002b80:	e052                	sd	s4,0(sp)
    80002b82:	1800                	addi	s0,sp,48
    80002b84:	89b2                	mv	s3,a2
  for (int i = 0; i < 8; i++) {
    80002b86:	892e                	mv	s2,a1
    80002b88:	6a05                	lui	s4,0x1
    80002b8a:	9a2e                	add	s4,s4,a1
    int offset = i * 512;
    int blk_idx = blk + i;
    struct buf *buffer = bread(ROOTDEV, blk_idx);
    80002b8c:	85ce                	mv	a1,s3
    80002b8e:	4505                	li	a0,1
    80002b90:	00000097          	auipc	ra,0x0
    80002b94:	df6080e7          	jalr	-522(ra) # 80002986 <bread>
    80002b98:	84aa                	mv	s1,a0
    memmove(page + offset, buffer->data, 512);
    80002b9a:	20000613          	li	a2,512
    80002b9e:	05850593          	addi	a1,a0,88
    80002ba2:	854a                	mv	a0,s2
    80002ba4:	ffffd097          	auipc	ra,0xffffd
    80002ba8:	634080e7          	jalr	1588(ra) # 800001d8 <memmove>
    brelse(buffer);
    80002bac:	8526                	mv	a0,s1
    80002bae:	00000097          	auipc	ra,0x0
    80002bb2:	e4a080e7          	jalr	-438(ra) # 800029f8 <brelse>
  for (int i = 0; i < 8; i++) {
    80002bb6:	2985                	addiw	s3,s3,1
    80002bb8:	20090913          	addi	s2,s2,512
    80002bbc:	fd4918e3          	bne	s2,s4,80002b8c <read_page_from_disk+0x18>
  }
}
    80002bc0:	70a2                	ld	ra,40(sp)
    80002bc2:	7402                	ld	s0,32(sp)
    80002bc4:	64e2                	ld	s1,24(sp)
    80002bc6:	6942                	ld	s2,16(sp)
    80002bc8:	69a2                	ld	s3,8(sp)
    80002bca:	6a02                	ld	s4,0(sp)
    80002bcc:	6145                	addi	sp,sp,48
    80002bce:	8082                	ret

0000000080002bd0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80002bd0:	1101                	addi	sp,sp,-32
    80002bd2:	ec06                	sd	ra,24(sp)
    80002bd4:	e822                	sd	s0,16(sp)
    80002bd6:	e426                	sd	s1,8(sp)
    80002bd8:	1000                	addi	s0,sp,32
    80002bda:	84ae                	mv	s1,a1
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80002bdc:	00d5d59b          	srliw	a1,a1,0xd
    80002be0:	00015797          	auipc	a5,0x15
    80002be4:	9a47a783          	lw	a5,-1628(a5) # 80017584 <sb+0x1c>
    80002be8:	9dbd                	addw	a1,a1,a5
    80002bea:	00000097          	auipc	ra,0x0
    80002bee:	d9c080e7          	jalr	-612(ra) # 80002986 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
    80002bf2:	0074f713          	andi	a4,s1,7
    80002bf6:	4785                	li	a5,1
    80002bf8:	00e797bb          	sllw	a5,a5,a4
  if((bp->data[bi/8] & m) == 0)
    80002bfc:	14ce                	slli	s1,s1,0x33
    80002bfe:	90d9                	srli	s1,s1,0x36
    80002c00:	00950733          	add	a4,a0,s1
    80002c04:	05874703          	lbu	a4,88(a4)
    80002c08:	00e7f6b3          	and	a3,a5,a4
    80002c0c:	c285                	beqz	a3,80002c2c <bfree+0x5c>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
    80002c0e:	94aa                	add	s1,s1,a0
    80002c10:	fff7c793          	not	a5,a5
    80002c14:	8ff9                	and	a5,a5,a4
    80002c16:	04f48c23          	sb	a5,88(s1)
  //log_write(bp);
  brelse(bp);
    80002c1a:	00000097          	auipc	ra,0x0
    80002c1e:	dde080e7          	jalr	-546(ra) # 800029f8 <brelse>
}
    80002c22:	60e2                	ld	ra,24(sp)
    80002c24:	6442                	ld	s0,16(sp)
    80002c26:	64a2                	ld	s1,8(sp)
    80002c28:	6105                	addi	sp,sp,32
    80002c2a:	8082                	ret
    panic("freeing free block");
    80002c2c:	00006517          	auipc	a0,0x6
    80002c30:	9dc50513          	addi	a0,a0,-1572 # 80008608 <syscalls+0x148>
    80002c34:	00004097          	auipc	ra,0x4
    80002c38:	a74080e7          	jalr	-1420(ra) # 800066a8 <panic>

0000000080002c3c <bzero>:
{
    80002c3c:	1101                	addi	sp,sp,-32
    80002c3e:	ec06                	sd	ra,24(sp)
    80002c40:	e822                	sd	s0,16(sp)
    80002c42:	e426                	sd	s1,8(sp)
    80002c44:	1000                	addi	s0,sp,32
  bp = bread(dev, bno);
    80002c46:	00000097          	auipc	ra,0x0
    80002c4a:	d40080e7          	jalr	-704(ra) # 80002986 <bread>
    80002c4e:	84aa                	mv	s1,a0
  memset(bp->data, 0, BSIZE);
    80002c50:	40000613          	li	a2,1024
    80002c54:	4581                	li	a1,0
    80002c56:	05850513          	addi	a0,a0,88
    80002c5a:	ffffd097          	auipc	ra,0xffffd
    80002c5e:	51e080e7          	jalr	1310(ra) # 80000178 <memset>
  brelse(bp);
    80002c62:	8526                	mv	a0,s1
    80002c64:	00000097          	auipc	ra,0x0
    80002c68:	d94080e7          	jalr	-620(ra) # 800029f8 <brelse>
}
    80002c6c:	60e2                	ld	ra,24(sp)
    80002c6e:	6442                	ld	s0,16(sp)
    80002c70:	64a2                	ld	s1,8(sp)
    80002c72:	6105                	addi	sp,sp,32
    80002c74:	8082                	ret

0000000080002c76 <balloc>:
{
    80002c76:	711d                	addi	sp,sp,-96
    80002c78:	ec86                	sd	ra,88(sp)
    80002c7a:	e8a2                	sd	s0,80(sp)
    80002c7c:	e4a6                	sd	s1,72(sp)
    80002c7e:	e0ca                	sd	s2,64(sp)
    80002c80:	fc4e                	sd	s3,56(sp)
    80002c82:	f852                	sd	s4,48(sp)
    80002c84:	f456                	sd	s5,40(sp)
    80002c86:	f05a                	sd	s6,32(sp)
    80002c88:	ec5e                	sd	s7,24(sp)
    80002c8a:	e862                	sd	s8,16(sp)
    80002c8c:	e466                	sd	s9,8(sp)
    80002c8e:	1080                	addi	s0,sp,96
  for(b = 0; b < sb.size; b += BPB){
    80002c90:	00015797          	auipc	a5,0x15
    80002c94:	8dc7a783          	lw	a5,-1828(a5) # 8001756c <sb+0x4>
    80002c98:	cbd1                	beqz	a5,80002d2c <balloc+0xb6>
    80002c9a:	8baa                	mv	s7,a0
    80002c9c:	4a81                	li	s5,0
    bp = bread(dev, BBLOCK(b, sb));
    80002c9e:	00015b17          	auipc	s6,0x15
    80002ca2:	8cab0b13          	addi	s6,s6,-1846 # 80017568 <sb>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80002ca6:	4c01                	li	s8,0
      m = 1 << (bi % 8);
    80002ca8:	4985                	li	s3,1
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80002caa:	6a09                	lui	s4,0x2
  for(b = 0; b < sb.size; b += BPB){
    80002cac:	6c89                	lui	s9,0x2
    80002cae:	a829                	j	80002cc8 <balloc+0x52>
    brelse(bp);
    80002cb0:	00000097          	auipc	ra,0x0
    80002cb4:	d48080e7          	jalr	-696(ra) # 800029f8 <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80002cb8:	015c87bb          	addw	a5,s9,s5
    80002cbc:	00078a9b          	sext.w	s5,a5
    80002cc0:	004b2703          	lw	a4,4(s6)
    80002cc4:	06eaf463          	bgeu	s5,a4,80002d2c <balloc+0xb6>
    bp = bread(dev, BBLOCK(b, sb));
    80002cc8:	41fad79b          	sraiw	a5,s5,0x1f
    80002ccc:	0137d79b          	srliw	a5,a5,0x13
    80002cd0:	015787bb          	addw	a5,a5,s5
    80002cd4:	40d7d79b          	sraiw	a5,a5,0xd
    80002cd8:	01cb2583          	lw	a1,28(s6)
    80002cdc:	9dbd                	addw	a1,a1,a5
    80002cde:	855e                	mv	a0,s7
    80002ce0:	00000097          	auipc	ra,0x0
    80002ce4:	ca6080e7          	jalr	-858(ra) # 80002986 <bread>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80002ce8:	004b2803          	lw	a6,4(s6)
    80002cec:	000a849b          	sext.w	s1,s5
    80002cf0:	8662                	mv	a2,s8
    80002cf2:	0004891b          	sext.w	s2,s1
    80002cf6:	fb04fde3          	bgeu	s1,a6,80002cb0 <balloc+0x3a>
      m = 1 << (bi % 8);
    80002cfa:	41f6579b          	sraiw	a5,a2,0x1f
    80002cfe:	01d7d69b          	srliw	a3,a5,0x1d
    80002d02:	00c6873b          	addw	a4,a3,a2
    80002d06:	00777793          	andi	a5,a4,7
    80002d0a:	9f95                	subw	a5,a5,a3
    80002d0c:	00f997bb          	sllw	a5,s3,a5
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80002d10:	4037571b          	sraiw	a4,a4,0x3
    80002d14:	00e506b3          	add	a3,a0,a4
    80002d18:	0586c683          	lbu	a3,88(a3)
    80002d1c:	00d7f5b3          	and	a1,a5,a3
    80002d20:	cd91                	beqz	a1,80002d3c <balloc+0xc6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80002d22:	2605                	addiw	a2,a2,1
    80002d24:	2485                	addiw	s1,s1,1
    80002d26:	fd4616e3          	bne	a2,s4,80002cf2 <balloc+0x7c>
    80002d2a:	b759                	j	80002cb0 <balloc+0x3a>
  panic("balloc: out of blocks");
    80002d2c:	00006517          	auipc	a0,0x6
    80002d30:	8f450513          	addi	a0,a0,-1804 # 80008620 <syscalls+0x160>
    80002d34:	00004097          	auipc	ra,0x4
    80002d38:	974080e7          	jalr	-1676(ra) # 800066a8 <panic>
        bp->data[bi/8] |= m;  // Mark block in use.
    80002d3c:	972a                	add	a4,a4,a0
    80002d3e:	8fd5                	or	a5,a5,a3
    80002d40:	04f70c23          	sb	a5,88(a4)
        brelse(bp);
    80002d44:	00000097          	auipc	ra,0x0
    80002d48:	cb4080e7          	jalr	-844(ra) # 800029f8 <brelse>
        bzero(dev, b + bi);
    80002d4c:	85ca                	mv	a1,s2
    80002d4e:	855e                	mv	a0,s7
    80002d50:	00000097          	auipc	ra,0x0
    80002d54:	eec080e7          	jalr	-276(ra) # 80002c3c <bzero>
}
    80002d58:	8526                	mv	a0,s1
    80002d5a:	60e6                	ld	ra,88(sp)
    80002d5c:	6446                	ld	s0,80(sp)
    80002d5e:	64a6                	ld	s1,72(sp)
    80002d60:	6906                	ld	s2,64(sp)
    80002d62:	79e2                	ld	s3,56(sp)
    80002d64:	7a42                	ld	s4,48(sp)
    80002d66:	7aa2                	ld	s5,40(sp)
    80002d68:	7b02                	ld	s6,32(sp)
    80002d6a:	6be2                	ld	s7,24(sp)
    80002d6c:	6c42                	ld	s8,16(sp)
    80002d6e:	6ca2                	ld	s9,8(sp)
    80002d70:	6125                	addi	sp,sp,96
    80002d72:	8082                	ret

0000000080002d74 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
    80002d74:	7179                	addi	sp,sp,-48
    80002d76:	f406                	sd	ra,40(sp)
    80002d78:	f022                	sd	s0,32(sp)
    80002d7a:	ec26                	sd	s1,24(sp)
    80002d7c:	e84a                	sd	s2,16(sp)
    80002d7e:	e44e                	sd	s3,8(sp)
    80002d80:	e052                	sd	s4,0(sp)
    80002d82:	1800                	addi	s0,sp,48
    80002d84:	892a                	mv	s2,a0
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    80002d86:	47ad                	li	a5,11
    80002d88:	04b7fe63          	bgeu	a5,a1,80002de4 <bmap+0x70>
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
    80002d8c:	ff45849b          	addiw	s1,a1,-12
    80002d90:	0004871b          	sext.w	a4,s1

  if(bn < NINDIRECT){
    80002d94:	0ff00793          	li	a5,255
    80002d98:	08e7ee63          	bltu	a5,a4,80002e34 <bmap+0xc0>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
    80002d9c:	08052583          	lw	a1,128(a0)
    80002da0:	c5ad                	beqz	a1,80002e0a <bmap+0x96>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    80002da2:	00092503          	lw	a0,0(s2)
    80002da6:	00000097          	auipc	ra,0x0
    80002daa:	be0080e7          	jalr	-1056(ra) # 80002986 <bread>
    80002dae:	8a2a                	mv	s4,a0
    a = (uint*)bp->data;
    80002db0:	05850793          	addi	a5,a0,88
    if((addr = a[bn]) == 0){
    80002db4:	02049593          	slli	a1,s1,0x20
    80002db8:	9181                	srli	a1,a1,0x20
    80002dba:	058a                	slli	a1,a1,0x2
    80002dbc:	00b784b3          	add	s1,a5,a1
    80002dc0:	0004a983          	lw	s3,0(s1)
    80002dc4:	04098d63          	beqz	s3,80002e1e <bmap+0xaa>
      a[bn] = addr = balloc(ip->dev);
      //log_write(bp);
    }
    brelse(bp);
    80002dc8:	8552                	mv	a0,s4
    80002dca:	00000097          	auipc	ra,0x0
    80002dce:	c2e080e7          	jalr	-978(ra) # 800029f8 <brelse>
    return addr;
  }

  panic("bmap: out of range");
}
    80002dd2:	854e                	mv	a0,s3
    80002dd4:	70a2                	ld	ra,40(sp)
    80002dd6:	7402                	ld	s0,32(sp)
    80002dd8:	64e2                	ld	s1,24(sp)
    80002dda:	6942                	ld	s2,16(sp)
    80002ddc:	69a2                	ld	s3,8(sp)
    80002dde:	6a02                	ld	s4,0(sp)
    80002de0:	6145                	addi	sp,sp,48
    80002de2:	8082                	ret
    if((addr = ip->addrs[bn]) == 0)
    80002de4:	02059493          	slli	s1,a1,0x20
    80002de8:	9081                	srli	s1,s1,0x20
    80002dea:	048a                	slli	s1,s1,0x2
    80002dec:	94aa                	add	s1,s1,a0
    80002dee:	0504a983          	lw	s3,80(s1)
    80002df2:	fe0990e3          	bnez	s3,80002dd2 <bmap+0x5e>
      ip->addrs[bn] = addr = balloc(ip->dev);
    80002df6:	4108                	lw	a0,0(a0)
    80002df8:	00000097          	auipc	ra,0x0
    80002dfc:	e7e080e7          	jalr	-386(ra) # 80002c76 <balloc>
    80002e00:	0005099b          	sext.w	s3,a0
    80002e04:	0534a823          	sw	s3,80(s1)
    80002e08:	b7e9                	j	80002dd2 <bmap+0x5e>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    80002e0a:	4108                	lw	a0,0(a0)
    80002e0c:	00000097          	auipc	ra,0x0
    80002e10:	e6a080e7          	jalr	-406(ra) # 80002c76 <balloc>
    80002e14:	0005059b          	sext.w	a1,a0
    80002e18:	08b92023          	sw	a1,128(s2)
    80002e1c:	b759                	j	80002da2 <bmap+0x2e>
      a[bn] = addr = balloc(ip->dev);
    80002e1e:	00092503          	lw	a0,0(s2)
    80002e22:	00000097          	auipc	ra,0x0
    80002e26:	e54080e7          	jalr	-428(ra) # 80002c76 <balloc>
    80002e2a:	0005099b          	sext.w	s3,a0
    80002e2e:	0134a023          	sw	s3,0(s1)
    80002e32:	bf59                	j	80002dc8 <bmap+0x54>
  panic("bmap: out of range");
    80002e34:	00006517          	auipc	a0,0x6
    80002e38:	80450513          	addi	a0,a0,-2044 # 80008638 <syscalls+0x178>
    80002e3c:	00004097          	auipc	ra,0x4
    80002e40:	86c080e7          	jalr	-1940(ra) # 800066a8 <panic>

0000000080002e44 <iget>:
{
    80002e44:	7179                	addi	sp,sp,-48
    80002e46:	f406                	sd	ra,40(sp)
    80002e48:	f022                	sd	s0,32(sp)
    80002e4a:	ec26                	sd	s1,24(sp)
    80002e4c:	e84a                	sd	s2,16(sp)
    80002e4e:	e44e                	sd	s3,8(sp)
    80002e50:	e052                	sd	s4,0(sp)
    80002e52:	1800                	addi	s0,sp,48
    80002e54:	89aa                	mv	s3,a0
    80002e56:	8a2e                	mv	s4,a1
  acquire(&itable.lock);
    80002e58:	00014517          	auipc	a0,0x14
    80002e5c:	73050513          	addi	a0,a0,1840 # 80017588 <itable>
    80002e60:	00004097          	auipc	ra,0x4
    80002e64:	d92080e7          	jalr	-622(ra) # 80006bf2 <acquire>
  empty = 0;
    80002e68:	4901                	li	s2,0
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80002e6a:	00014497          	auipc	s1,0x14
    80002e6e:	73648493          	addi	s1,s1,1846 # 800175a0 <itable+0x18>
    80002e72:	00016697          	auipc	a3,0x16
    80002e76:	1be68693          	addi	a3,a3,446 # 80019030 <log>
    80002e7a:	a039                	j	80002e88 <iget+0x44>
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80002e7c:	02090b63          	beqz	s2,80002eb2 <iget+0x6e>
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80002e80:	08848493          	addi	s1,s1,136
    80002e84:	02d48a63          	beq	s1,a3,80002eb8 <iget+0x74>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    80002e88:	449c                	lw	a5,8(s1)
    80002e8a:	fef059e3          	blez	a5,80002e7c <iget+0x38>
    80002e8e:	4098                	lw	a4,0(s1)
    80002e90:	ff3716e3          	bne	a4,s3,80002e7c <iget+0x38>
    80002e94:	40d8                	lw	a4,4(s1)
    80002e96:	ff4713e3          	bne	a4,s4,80002e7c <iget+0x38>
      ip->ref++;
    80002e9a:	2785                	addiw	a5,a5,1
    80002e9c:	c49c                	sw	a5,8(s1)
      release(&itable.lock);
    80002e9e:	00014517          	auipc	a0,0x14
    80002ea2:	6ea50513          	addi	a0,a0,1770 # 80017588 <itable>
    80002ea6:	00004097          	auipc	ra,0x4
    80002eaa:	e00080e7          	jalr	-512(ra) # 80006ca6 <release>
      return ip;
    80002eae:	8926                	mv	s2,s1
    80002eb0:	a03d                	j	80002ede <iget+0x9a>
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80002eb2:	f7f9                	bnez	a5,80002e80 <iget+0x3c>
    80002eb4:	8926                	mv	s2,s1
    80002eb6:	b7e9                	j	80002e80 <iget+0x3c>
  if(empty == 0)
    80002eb8:	02090c63          	beqz	s2,80002ef0 <iget+0xac>
  ip->dev = dev;
    80002ebc:	01392023          	sw	s3,0(s2)
  ip->inum = inum;
    80002ec0:	01492223          	sw	s4,4(s2)
  ip->ref = 1;
    80002ec4:	4785                	li	a5,1
    80002ec6:	00f92423          	sw	a5,8(s2)
  ip->valid = 0;
    80002eca:	04092023          	sw	zero,64(s2)
  release(&itable.lock);
    80002ece:	00014517          	auipc	a0,0x14
    80002ed2:	6ba50513          	addi	a0,a0,1722 # 80017588 <itable>
    80002ed6:	00004097          	auipc	ra,0x4
    80002eda:	dd0080e7          	jalr	-560(ra) # 80006ca6 <release>
}
    80002ede:	854a                	mv	a0,s2
    80002ee0:	70a2                	ld	ra,40(sp)
    80002ee2:	7402                	ld	s0,32(sp)
    80002ee4:	64e2                	ld	s1,24(sp)
    80002ee6:	6942                	ld	s2,16(sp)
    80002ee8:	69a2                	ld	s3,8(sp)
    80002eea:	6a02                	ld	s4,0(sp)
    80002eec:	6145                	addi	sp,sp,48
    80002eee:	8082                	ret
    panic("iget: no inodes");
    80002ef0:	00005517          	auipc	a0,0x5
    80002ef4:	76050513          	addi	a0,a0,1888 # 80008650 <syscalls+0x190>
    80002ef8:	00003097          	auipc	ra,0x3
    80002efc:	7b0080e7          	jalr	1968(ra) # 800066a8 <panic>

0000000080002f00 <fsinit>:
fsinit(int dev) {
    80002f00:	7179                	addi	sp,sp,-48
    80002f02:	f406                	sd	ra,40(sp)
    80002f04:	f022                	sd	s0,32(sp)
    80002f06:	ec26                	sd	s1,24(sp)
    80002f08:	e84a                	sd	s2,16(sp)
    80002f0a:	e44e                	sd	s3,8(sp)
    80002f0c:	1800                	addi	s0,sp,48
    80002f0e:	892a                	mv	s2,a0
  bp = bread(dev, 1);
    80002f10:	4585                	li	a1,1
    80002f12:	00000097          	auipc	ra,0x0
    80002f16:	a74080e7          	jalr	-1420(ra) # 80002986 <bread>
    80002f1a:	84aa                	mv	s1,a0
  memmove(sb, bp->data, sizeof(*sb));
    80002f1c:	00014997          	auipc	s3,0x14
    80002f20:	64c98993          	addi	s3,s3,1612 # 80017568 <sb>
    80002f24:	02000613          	li	a2,32
    80002f28:	05850593          	addi	a1,a0,88
    80002f2c:	854e                	mv	a0,s3
    80002f2e:	ffffd097          	auipc	ra,0xffffd
    80002f32:	2aa080e7          	jalr	682(ra) # 800001d8 <memmove>
  brelse(bp);
    80002f36:	8526                	mv	a0,s1
    80002f38:	00000097          	auipc	ra,0x0
    80002f3c:	ac0080e7          	jalr	-1344(ra) # 800029f8 <brelse>
  if(sb.magic != FSMAGIC)
    80002f40:	0009a703          	lw	a4,0(s3)
    80002f44:	102037b7          	lui	a5,0x10203
    80002f48:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80002f4c:	02f71263          	bne	a4,a5,80002f70 <fsinit+0x70>
  initlog(dev, &sb);
    80002f50:	00014597          	auipc	a1,0x14
    80002f54:	61858593          	addi	a1,a1,1560 # 80017568 <sb>
    80002f58:	854a                	mv	a0,s2
    80002f5a:	00001097          	auipc	ra,0x1
    80002f5e:	cc2080e7          	jalr	-830(ra) # 80003c1c <initlog>
}
    80002f62:	70a2                	ld	ra,40(sp)
    80002f64:	7402                	ld	s0,32(sp)
    80002f66:	64e2                	ld	s1,24(sp)
    80002f68:	6942                	ld	s2,16(sp)
    80002f6a:	69a2                	ld	s3,8(sp)
    80002f6c:	6145                	addi	sp,sp,48
    80002f6e:	8082                	ret
    panic("invalid file system");
    80002f70:	00005517          	auipc	a0,0x5
    80002f74:	6f050513          	addi	a0,a0,1776 # 80008660 <syscalls+0x1a0>
    80002f78:	00003097          	auipc	ra,0x3
    80002f7c:	730080e7          	jalr	1840(ra) # 800066a8 <panic>

0000000080002f80 <iinit>:
{
    80002f80:	7179                	addi	sp,sp,-48
    80002f82:	f406                	sd	ra,40(sp)
    80002f84:	f022                	sd	s0,32(sp)
    80002f86:	ec26                	sd	s1,24(sp)
    80002f88:	e84a                	sd	s2,16(sp)
    80002f8a:	e44e                	sd	s3,8(sp)
    80002f8c:	1800                	addi	s0,sp,48
  initlock(&itable.lock, "itable");
    80002f8e:	00005597          	auipc	a1,0x5
    80002f92:	6ea58593          	addi	a1,a1,1770 # 80008678 <syscalls+0x1b8>
    80002f96:	00014517          	auipc	a0,0x14
    80002f9a:	5f250513          	addi	a0,a0,1522 # 80017588 <itable>
    80002f9e:	00004097          	auipc	ra,0x4
    80002fa2:	bc4080e7          	jalr	-1084(ra) # 80006b62 <initlock>
  for(i = 0; i < NINODE; i++) {
    80002fa6:	00014497          	auipc	s1,0x14
    80002faa:	60a48493          	addi	s1,s1,1546 # 800175b0 <itable+0x28>
    80002fae:	00016997          	auipc	s3,0x16
    80002fb2:	09298993          	addi	s3,s3,146 # 80019040 <log+0x10>
    initsleeplock(&itable.inode[i].lock, "inode");
    80002fb6:	00005917          	auipc	s2,0x5
    80002fba:	6ca90913          	addi	s2,s2,1738 # 80008680 <syscalls+0x1c0>
    80002fbe:	85ca                	mv	a1,s2
    80002fc0:	8526                	mv	a0,s1
    80002fc2:	00001097          	auipc	ra,0x1
    80002fc6:	fbc080e7          	jalr	-68(ra) # 80003f7e <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80002fca:	08848493          	addi	s1,s1,136
    80002fce:	ff3498e3          	bne	s1,s3,80002fbe <iinit+0x3e>
}
    80002fd2:	70a2                	ld	ra,40(sp)
    80002fd4:	7402                	ld	s0,32(sp)
    80002fd6:	64e2                	ld	s1,24(sp)
    80002fd8:	6942                	ld	s2,16(sp)
    80002fda:	69a2                	ld	s3,8(sp)
    80002fdc:	6145                	addi	sp,sp,48
    80002fde:	8082                	ret

0000000080002fe0 <ialloc>:
{
    80002fe0:	715d                	addi	sp,sp,-80
    80002fe2:	e486                	sd	ra,72(sp)
    80002fe4:	e0a2                	sd	s0,64(sp)
    80002fe6:	fc26                	sd	s1,56(sp)
    80002fe8:	f84a                	sd	s2,48(sp)
    80002fea:	f44e                	sd	s3,40(sp)
    80002fec:	f052                	sd	s4,32(sp)
    80002fee:	ec56                	sd	s5,24(sp)
    80002ff0:	e85a                	sd	s6,16(sp)
    80002ff2:	e45e                	sd	s7,8(sp)
    80002ff4:	0880                	addi	s0,sp,80
  for(inum = 1; inum < sb.ninodes; inum++){
    80002ff6:	00014717          	auipc	a4,0x14
    80002ffa:	57e72703          	lw	a4,1406(a4) # 80017574 <sb+0xc>
    80002ffe:	4785                	li	a5,1
    80003000:	04e7fa63          	bgeu	a5,a4,80003054 <ialloc+0x74>
    80003004:	8aaa                	mv	s5,a0
    80003006:	8bae                	mv	s7,a1
    80003008:	4485                	li	s1,1
    bp = bread(dev, IBLOCK(inum, sb));
    8000300a:	00014a17          	auipc	s4,0x14
    8000300e:	55ea0a13          	addi	s4,s4,1374 # 80017568 <sb>
    80003012:	00048b1b          	sext.w	s6,s1
    80003016:	0044d593          	srli	a1,s1,0x4
    8000301a:	018a2783          	lw	a5,24(s4)
    8000301e:	9dbd                	addw	a1,a1,a5
    80003020:	8556                	mv	a0,s5
    80003022:	00000097          	auipc	ra,0x0
    80003026:	964080e7          	jalr	-1692(ra) # 80002986 <bread>
    8000302a:	892a                	mv	s2,a0
    dip = (struct dinode*)bp->data + inum%IPB;
    8000302c:	05850993          	addi	s3,a0,88
    80003030:	00f4f793          	andi	a5,s1,15
    80003034:	079a                	slli	a5,a5,0x6
    80003036:	99be                	add	s3,s3,a5
    if(dip->type == 0){  // a free inode
    80003038:	00099783          	lh	a5,0(s3)
    8000303c:	c785                	beqz	a5,80003064 <ialloc+0x84>
    brelse(bp);
    8000303e:	00000097          	auipc	ra,0x0
    80003042:	9ba080e7          	jalr	-1606(ra) # 800029f8 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80003046:	0485                	addi	s1,s1,1
    80003048:	00ca2703          	lw	a4,12(s4)
    8000304c:	0004879b          	sext.w	a5,s1
    80003050:	fce7e1e3          	bltu	a5,a4,80003012 <ialloc+0x32>
  panic("ialloc: no inodes");
    80003054:	00005517          	auipc	a0,0x5
    80003058:	63450513          	addi	a0,a0,1588 # 80008688 <syscalls+0x1c8>
    8000305c:	00003097          	auipc	ra,0x3
    80003060:	64c080e7          	jalr	1612(ra) # 800066a8 <panic>
      memset(dip, 0, sizeof(*dip));
    80003064:	04000613          	li	a2,64
    80003068:	4581                	li	a1,0
    8000306a:	854e                	mv	a0,s3
    8000306c:	ffffd097          	auipc	ra,0xffffd
    80003070:	10c080e7          	jalr	268(ra) # 80000178 <memset>
      dip->type = type;
    80003074:	01799023          	sh	s7,0(s3)
      brelse(bp);
    80003078:	854a                	mv	a0,s2
    8000307a:	00000097          	auipc	ra,0x0
    8000307e:	97e080e7          	jalr	-1666(ra) # 800029f8 <brelse>
      return iget(dev, inum);
    80003082:	85da                	mv	a1,s6
    80003084:	8556                	mv	a0,s5
    80003086:	00000097          	auipc	ra,0x0
    8000308a:	dbe080e7          	jalr	-578(ra) # 80002e44 <iget>
}
    8000308e:	60a6                	ld	ra,72(sp)
    80003090:	6406                	ld	s0,64(sp)
    80003092:	74e2                	ld	s1,56(sp)
    80003094:	7942                	ld	s2,48(sp)
    80003096:	79a2                	ld	s3,40(sp)
    80003098:	7a02                	ld	s4,32(sp)
    8000309a:	6ae2                	ld	s5,24(sp)
    8000309c:	6b42                	ld	s6,16(sp)
    8000309e:	6ba2                	ld	s7,8(sp)
    800030a0:	6161                	addi	sp,sp,80
    800030a2:	8082                	ret

00000000800030a4 <iupdate>:
{
    800030a4:	1101                	addi	sp,sp,-32
    800030a6:	ec06                	sd	ra,24(sp)
    800030a8:	e822                	sd	s0,16(sp)
    800030aa:	e426                	sd	s1,8(sp)
    800030ac:	e04a                	sd	s2,0(sp)
    800030ae:	1000                	addi	s0,sp,32
    800030b0:	84aa                	mv	s1,a0
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800030b2:	415c                	lw	a5,4(a0)
    800030b4:	0047d79b          	srliw	a5,a5,0x4
    800030b8:	00014597          	auipc	a1,0x14
    800030bc:	4c85a583          	lw	a1,1224(a1) # 80017580 <sb+0x18>
    800030c0:	9dbd                	addw	a1,a1,a5
    800030c2:	4108                	lw	a0,0(a0)
    800030c4:	00000097          	auipc	ra,0x0
    800030c8:	8c2080e7          	jalr	-1854(ra) # 80002986 <bread>
    800030cc:	892a                	mv	s2,a0
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    800030ce:	05850793          	addi	a5,a0,88
    800030d2:	40d8                	lw	a4,4(s1)
    800030d4:	8b3d                	andi	a4,a4,15
    800030d6:	071a                	slli	a4,a4,0x6
    800030d8:	97ba                	add	a5,a5,a4
  dip->type = ip->type;
    800030da:	04449703          	lh	a4,68(s1)
    800030de:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    800030e2:	04649703          	lh	a4,70(s1)
    800030e6:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    800030ea:	04849703          	lh	a4,72(s1)
    800030ee:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    800030f2:	04a49703          	lh	a4,74(s1)
    800030f6:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    800030fa:	44f8                	lw	a4,76(s1)
    800030fc:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    800030fe:	03400613          	li	a2,52
    80003102:	05048593          	addi	a1,s1,80
    80003106:	00c78513          	addi	a0,a5,12
    8000310a:	ffffd097          	auipc	ra,0xffffd
    8000310e:	0ce080e7          	jalr	206(ra) # 800001d8 <memmove>
  brelse(bp);
    80003112:	854a                	mv	a0,s2
    80003114:	00000097          	auipc	ra,0x0
    80003118:	8e4080e7          	jalr	-1820(ra) # 800029f8 <brelse>
}
    8000311c:	60e2                	ld	ra,24(sp)
    8000311e:	6442                	ld	s0,16(sp)
    80003120:	64a2                	ld	s1,8(sp)
    80003122:	6902                	ld	s2,0(sp)
    80003124:	6105                	addi	sp,sp,32
    80003126:	8082                	ret

0000000080003128 <idup>:
{
    80003128:	1101                	addi	sp,sp,-32
    8000312a:	ec06                	sd	ra,24(sp)
    8000312c:	e822                	sd	s0,16(sp)
    8000312e:	e426                	sd	s1,8(sp)
    80003130:	1000                	addi	s0,sp,32
    80003132:	84aa                	mv	s1,a0
  acquire(&itable.lock);
    80003134:	00014517          	auipc	a0,0x14
    80003138:	45450513          	addi	a0,a0,1108 # 80017588 <itable>
    8000313c:	00004097          	auipc	ra,0x4
    80003140:	ab6080e7          	jalr	-1354(ra) # 80006bf2 <acquire>
  ip->ref++;
    80003144:	449c                	lw	a5,8(s1)
    80003146:	2785                	addiw	a5,a5,1
    80003148:	c49c                	sw	a5,8(s1)
  release(&itable.lock);
    8000314a:	00014517          	auipc	a0,0x14
    8000314e:	43e50513          	addi	a0,a0,1086 # 80017588 <itable>
    80003152:	00004097          	auipc	ra,0x4
    80003156:	b54080e7          	jalr	-1196(ra) # 80006ca6 <release>
}
    8000315a:	8526                	mv	a0,s1
    8000315c:	60e2                	ld	ra,24(sp)
    8000315e:	6442                	ld	s0,16(sp)
    80003160:	64a2                	ld	s1,8(sp)
    80003162:	6105                	addi	sp,sp,32
    80003164:	8082                	ret

0000000080003166 <ilock>:
{
    80003166:	1101                	addi	sp,sp,-32
    80003168:	ec06                	sd	ra,24(sp)
    8000316a:	e822                	sd	s0,16(sp)
    8000316c:	e426                	sd	s1,8(sp)
    8000316e:	e04a                	sd	s2,0(sp)
    80003170:	1000                	addi	s0,sp,32
  if(ip == 0 || ip->ref < 1)
    80003172:	c115                	beqz	a0,80003196 <ilock+0x30>
    80003174:	84aa                	mv	s1,a0
    80003176:	451c                	lw	a5,8(a0)
    80003178:	00f05f63          	blez	a5,80003196 <ilock+0x30>
  acquiresleep(&ip->lock);
    8000317c:	0541                	addi	a0,a0,16
    8000317e:	00001097          	auipc	ra,0x1
    80003182:	e3a080e7          	jalr	-454(ra) # 80003fb8 <acquiresleep>
  if(ip->valid == 0){
    80003186:	40bc                	lw	a5,64(s1)
    80003188:	cf99                	beqz	a5,800031a6 <ilock+0x40>
}
    8000318a:	60e2                	ld	ra,24(sp)
    8000318c:	6442                	ld	s0,16(sp)
    8000318e:	64a2                	ld	s1,8(sp)
    80003190:	6902                	ld	s2,0(sp)
    80003192:	6105                	addi	sp,sp,32
    80003194:	8082                	ret
    panic("ilock");
    80003196:	00005517          	auipc	a0,0x5
    8000319a:	50a50513          	addi	a0,a0,1290 # 800086a0 <syscalls+0x1e0>
    8000319e:	00003097          	auipc	ra,0x3
    800031a2:	50a080e7          	jalr	1290(ra) # 800066a8 <panic>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800031a6:	40dc                	lw	a5,4(s1)
    800031a8:	0047d79b          	srliw	a5,a5,0x4
    800031ac:	00014597          	auipc	a1,0x14
    800031b0:	3d45a583          	lw	a1,980(a1) # 80017580 <sb+0x18>
    800031b4:	9dbd                	addw	a1,a1,a5
    800031b6:	4088                	lw	a0,0(s1)
    800031b8:	fffff097          	auipc	ra,0xfffff
    800031bc:	7ce080e7          	jalr	1998(ra) # 80002986 <bread>
    800031c0:	892a                	mv	s2,a0
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    800031c2:	05850593          	addi	a1,a0,88
    800031c6:	40dc                	lw	a5,4(s1)
    800031c8:	8bbd                	andi	a5,a5,15
    800031ca:	079a                	slli	a5,a5,0x6
    800031cc:	95be                	add	a1,a1,a5
    ip->type = dip->type;
    800031ce:	00059783          	lh	a5,0(a1)
    800031d2:	04f49223          	sh	a5,68(s1)
    ip->major = dip->major;
    800031d6:	00259783          	lh	a5,2(a1)
    800031da:	04f49323          	sh	a5,70(s1)
    ip->minor = dip->minor;
    800031de:	00459783          	lh	a5,4(a1)
    800031e2:	04f49423          	sh	a5,72(s1)
    ip->nlink = dip->nlink;
    800031e6:	00659783          	lh	a5,6(a1)
    800031ea:	04f49523          	sh	a5,74(s1)
    ip->size = dip->size;
    800031ee:	459c                	lw	a5,8(a1)
    800031f0:	c4fc                	sw	a5,76(s1)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800031f2:	03400613          	li	a2,52
    800031f6:	05b1                	addi	a1,a1,12
    800031f8:	05048513          	addi	a0,s1,80
    800031fc:	ffffd097          	auipc	ra,0xffffd
    80003200:	fdc080e7          	jalr	-36(ra) # 800001d8 <memmove>
    brelse(bp);
    80003204:	854a                	mv	a0,s2
    80003206:	fffff097          	auipc	ra,0xfffff
    8000320a:	7f2080e7          	jalr	2034(ra) # 800029f8 <brelse>
    ip->valid = 1;
    8000320e:	4785                	li	a5,1
    80003210:	c0bc                	sw	a5,64(s1)
    if(ip->type == 0)
    80003212:	04449783          	lh	a5,68(s1)
    80003216:	fbb5                	bnez	a5,8000318a <ilock+0x24>
      panic("ilock: no type");
    80003218:	00005517          	auipc	a0,0x5
    8000321c:	49050513          	addi	a0,a0,1168 # 800086a8 <syscalls+0x1e8>
    80003220:	00003097          	auipc	ra,0x3
    80003224:	488080e7          	jalr	1160(ra) # 800066a8 <panic>

0000000080003228 <iunlock>:
{
    80003228:	1101                	addi	sp,sp,-32
    8000322a:	ec06                	sd	ra,24(sp)
    8000322c:	e822                	sd	s0,16(sp)
    8000322e:	e426                	sd	s1,8(sp)
    80003230:	e04a                	sd	s2,0(sp)
    80003232:	1000                	addi	s0,sp,32
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80003234:	c905                	beqz	a0,80003264 <iunlock+0x3c>
    80003236:	84aa                	mv	s1,a0
    80003238:	01050913          	addi	s2,a0,16
    8000323c:	854a                	mv	a0,s2
    8000323e:	00001097          	auipc	ra,0x1
    80003242:	e14080e7          	jalr	-492(ra) # 80004052 <holdingsleep>
    80003246:	cd19                	beqz	a0,80003264 <iunlock+0x3c>
    80003248:	449c                	lw	a5,8(s1)
    8000324a:	00f05d63          	blez	a5,80003264 <iunlock+0x3c>
  releasesleep(&ip->lock);
    8000324e:	854a                	mv	a0,s2
    80003250:	00001097          	auipc	ra,0x1
    80003254:	dbe080e7          	jalr	-578(ra) # 8000400e <releasesleep>
}
    80003258:	60e2                	ld	ra,24(sp)
    8000325a:	6442                	ld	s0,16(sp)
    8000325c:	64a2                	ld	s1,8(sp)
    8000325e:	6902                	ld	s2,0(sp)
    80003260:	6105                	addi	sp,sp,32
    80003262:	8082                	ret
    panic("iunlock");
    80003264:	00005517          	auipc	a0,0x5
    80003268:	45450513          	addi	a0,a0,1108 # 800086b8 <syscalls+0x1f8>
    8000326c:	00003097          	auipc	ra,0x3
    80003270:	43c080e7          	jalr	1084(ra) # 800066a8 <panic>

0000000080003274 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    80003274:	7179                	addi	sp,sp,-48
    80003276:	f406                	sd	ra,40(sp)
    80003278:	f022                	sd	s0,32(sp)
    8000327a:	ec26                	sd	s1,24(sp)
    8000327c:	e84a                	sd	s2,16(sp)
    8000327e:	e44e                	sd	s3,8(sp)
    80003280:	e052                	sd	s4,0(sp)
    80003282:	1800                	addi	s0,sp,48
    80003284:	89aa                	mv	s3,a0
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80003286:	05050493          	addi	s1,a0,80
    8000328a:	08050913          	addi	s2,a0,128
    8000328e:	a021                	j	80003296 <itrunc+0x22>
    80003290:	0491                	addi	s1,s1,4
    80003292:	01248d63          	beq	s1,s2,800032ac <itrunc+0x38>
    if(ip->addrs[i]){
    80003296:	408c                	lw	a1,0(s1)
    80003298:	dde5                	beqz	a1,80003290 <itrunc+0x1c>
      bfree(ip->dev, ip->addrs[i]);
    8000329a:	0009a503          	lw	a0,0(s3)
    8000329e:	00000097          	auipc	ra,0x0
    800032a2:	932080e7          	jalr	-1742(ra) # 80002bd0 <bfree>
      ip->addrs[i] = 0;
    800032a6:	0004a023          	sw	zero,0(s1)
    800032aa:	b7dd                	j	80003290 <itrunc+0x1c>
    }
  }

  if(ip->addrs[NDIRECT]){
    800032ac:	0809a583          	lw	a1,128(s3)
    800032b0:	e185                	bnez	a1,800032d0 <itrunc+0x5c>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
    800032b2:	0409a623          	sw	zero,76(s3)
  iupdate(ip);
    800032b6:	854e                	mv	a0,s3
    800032b8:	00000097          	auipc	ra,0x0
    800032bc:	dec080e7          	jalr	-532(ra) # 800030a4 <iupdate>
}
    800032c0:	70a2                	ld	ra,40(sp)
    800032c2:	7402                	ld	s0,32(sp)
    800032c4:	64e2                	ld	s1,24(sp)
    800032c6:	6942                	ld	s2,16(sp)
    800032c8:	69a2                	ld	s3,8(sp)
    800032ca:	6a02                	ld	s4,0(sp)
    800032cc:	6145                	addi	sp,sp,48
    800032ce:	8082                	ret
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    800032d0:	0009a503          	lw	a0,0(s3)
    800032d4:	fffff097          	auipc	ra,0xfffff
    800032d8:	6b2080e7          	jalr	1714(ra) # 80002986 <bread>
    800032dc:	8a2a                	mv	s4,a0
    for(j = 0; j < NINDIRECT; j++){
    800032de:	05850493          	addi	s1,a0,88
    800032e2:	45850913          	addi	s2,a0,1112
    800032e6:	a811                	j	800032fa <itrunc+0x86>
        bfree(ip->dev, a[j]);
    800032e8:	0009a503          	lw	a0,0(s3)
    800032ec:	00000097          	auipc	ra,0x0
    800032f0:	8e4080e7          	jalr	-1820(ra) # 80002bd0 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    800032f4:	0491                	addi	s1,s1,4
    800032f6:	01248563          	beq	s1,s2,80003300 <itrunc+0x8c>
      if(a[j])
    800032fa:	408c                	lw	a1,0(s1)
    800032fc:	dde5                	beqz	a1,800032f4 <itrunc+0x80>
    800032fe:	b7ed                	j	800032e8 <itrunc+0x74>
    brelse(bp);
    80003300:	8552                	mv	a0,s4
    80003302:	fffff097          	auipc	ra,0xfffff
    80003306:	6f6080e7          	jalr	1782(ra) # 800029f8 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    8000330a:	0809a583          	lw	a1,128(s3)
    8000330e:	0009a503          	lw	a0,0(s3)
    80003312:	00000097          	auipc	ra,0x0
    80003316:	8be080e7          	jalr	-1858(ra) # 80002bd0 <bfree>
    ip->addrs[NDIRECT] = 0;
    8000331a:	0809a023          	sw	zero,128(s3)
    8000331e:	bf51                	j	800032b2 <itrunc+0x3e>

0000000080003320 <iput>:
{
    80003320:	1101                	addi	sp,sp,-32
    80003322:	ec06                	sd	ra,24(sp)
    80003324:	e822                	sd	s0,16(sp)
    80003326:	e426                	sd	s1,8(sp)
    80003328:	e04a                	sd	s2,0(sp)
    8000332a:	1000                	addi	s0,sp,32
    8000332c:	84aa                	mv	s1,a0
  acquire(&itable.lock);
    8000332e:	00014517          	auipc	a0,0x14
    80003332:	25a50513          	addi	a0,a0,602 # 80017588 <itable>
    80003336:	00004097          	auipc	ra,0x4
    8000333a:	8bc080e7          	jalr	-1860(ra) # 80006bf2 <acquire>
  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    8000333e:	4498                	lw	a4,8(s1)
    80003340:	4785                	li	a5,1
    80003342:	02f70363          	beq	a4,a5,80003368 <iput+0x48>
  ip->ref--;
    80003346:	449c                	lw	a5,8(s1)
    80003348:	37fd                	addiw	a5,a5,-1
    8000334a:	c49c                	sw	a5,8(s1)
  release(&itable.lock);
    8000334c:	00014517          	auipc	a0,0x14
    80003350:	23c50513          	addi	a0,a0,572 # 80017588 <itable>
    80003354:	00004097          	auipc	ra,0x4
    80003358:	952080e7          	jalr	-1710(ra) # 80006ca6 <release>
}
    8000335c:	60e2                	ld	ra,24(sp)
    8000335e:	6442                	ld	s0,16(sp)
    80003360:	64a2                	ld	s1,8(sp)
    80003362:	6902                	ld	s2,0(sp)
    80003364:	6105                	addi	sp,sp,32
    80003366:	8082                	ret
  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    80003368:	40bc                	lw	a5,64(s1)
    8000336a:	dff1                	beqz	a5,80003346 <iput+0x26>
    8000336c:	04a49783          	lh	a5,74(s1)
    80003370:	fbf9                	bnez	a5,80003346 <iput+0x26>
    acquiresleep(&ip->lock);
    80003372:	01048913          	addi	s2,s1,16
    80003376:	854a                	mv	a0,s2
    80003378:	00001097          	auipc	ra,0x1
    8000337c:	c40080e7          	jalr	-960(ra) # 80003fb8 <acquiresleep>
    release(&itable.lock);
    80003380:	00014517          	auipc	a0,0x14
    80003384:	20850513          	addi	a0,a0,520 # 80017588 <itable>
    80003388:	00004097          	auipc	ra,0x4
    8000338c:	91e080e7          	jalr	-1762(ra) # 80006ca6 <release>
    itrunc(ip);
    80003390:	8526                	mv	a0,s1
    80003392:	00000097          	auipc	ra,0x0
    80003396:	ee2080e7          	jalr	-286(ra) # 80003274 <itrunc>
    ip->type = 0;
    8000339a:	04049223          	sh	zero,68(s1)
    iupdate(ip);
    8000339e:	8526                	mv	a0,s1
    800033a0:	00000097          	auipc	ra,0x0
    800033a4:	d04080e7          	jalr	-764(ra) # 800030a4 <iupdate>
    ip->valid = 0;
    800033a8:	0404a023          	sw	zero,64(s1)
    releasesleep(&ip->lock);
    800033ac:	854a                	mv	a0,s2
    800033ae:	00001097          	auipc	ra,0x1
    800033b2:	c60080e7          	jalr	-928(ra) # 8000400e <releasesleep>
    acquire(&itable.lock);
    800033b6:	00014517          	auipc	a0,0x14
    800033ba:	1d250513          	addi	a0,a0,466 # 80017588 <itable>
    800033be:	00004097          	auipc	ra,0x4
    800033c2:	834080e7          	jalr	-1996(ra) # 80006bf2 <acquire>
    800033c6:	b741                	j	80003346 <iput+0x26>

00000000800033c8 <iunlockput>:
{
    800033c8:	1101                	addi	sp,sp,-32
    800033ca:	ec06                	sd	ra,24(sp)
    800033cc:	e822                	sd	s0,16(sp)
    800033ce:	e426                	sd	s1,8(sp)
    800033d0:	1000                	addi	s0,sp,32
    800033d2:	84aa                	mv	s1,a0
  iunlock(ip);
    800033d4:	00000097          	auipc	ra,0x0
    800033d8:	e54080e7          	jalr	-428(ra) # 80003228 <iunlock>
  iput(ip);
    800033dc:	8526                	mv	a0,s1
    800033de:	00000097          	auipc	ra,0x0
    800033e2:	f42080e7          	jalr	-190(ra) # 80003320 <iput>
}
    800033e6:	60e2                	ld	ra,24(sp)
    800033e8:	6442                	ld	s0,16(sp)
    800033ea:	64a2                	ld	s1,8(sp)
    800033ec:	6105                	addi	sp,sp,32
    800033ee:	8082                	ret

00000000800033f0 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    800033f0:	1141                	addi	sp,sp,-16
    800033f2:	e422                	sd	s0,8(sp)
    800033f4:	0800                	addi	s0,sp,16
  st->dev = ip->dev;
    800033f6:	411c                	lw	a5,0(a0)
    800033f8:	c19c                	sw	a5,0(a1)
  st->ino = ip->inum;
    800033fa:	415c                	lw	a5,4(a0)
    800033fc:	c1dc                	sw	a5,4(a1)
  st->type = ip->type;
    800033fe:	04451783          	lh	a5,68(a0)
    80003402:	00f59423          	sh	a5,8(a1)
  st->nlink = ip->nlink;
    80003406:	04a51783          	lh	a5,74(a0)
    8000340a:	00f59523          	sh	a5,10(a1)
  st->size = ip->size;
    8000340e:	04c56783          	lwu	a5,76(a0)
    80003412:	e99c                	sd	a5,16(a1)
}
    80003414:	6422                	ld	s0,8(sp)
    80003416:	0141                	addi	sp,sp,16
    80003418:	8082                	ret

000000008000341a <readi>:
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    8000341a:	457c                	lw	a5,76(a0)
    8000341c:	0ed7e963          	bltu	a5,a3,8000350e <readi+0xf4>
{
    80003420:	7159                	addi	sp,sp,-112
    80003422:	f486                	sd	ra,104(sp)
    80003424:	f0a2                	sd	s0,96(sp)
    80003426:	eca6                	sd	s1,88(sp)
    80003428:	e8ca                	sd	s2,80(sp)
    8000342a:	e4ce                	sd	s3,72(sp)
    8000342c:	e0d2                	sd	s4,64(sp)
    8000342e:	fc56                	sd	s5,56(sp)
    80003430:	f85a                	sd	s6,48(sp)
    80003432:	f45e                	sd	s7,40(sp)
    80003434:	f062                	sd	s8,32(sp)
    80003436:	ec66                	sd	s9,24(sp)
    80003438:	e86a                	sd	s10,16(sp)
    8000343a:	e46e                	sd	s11,8(sp)
    8000343c:	1880                	addi	s0,sp,112
    8000343e:	8baa                	mv	s7,a0
    80003440:	8c2e                	mv	s8,a1
    80003442:	8ab2                	mv	s5,a2
    80003444:	84b6                	mv	s1,a3
    80003446:	8b3a                	mv	s6,a4
  if(off > ip->size || off + n < off)
    80003448:	9f35                	addw	a4,a4,a3
    return 0;
    8000344a:	4501                	li	a0,0
  if(off > ip->size || off + n < off)
    8000344c:	0ad76063          	bltu	a4,a3,800034ec <readi+0xd2>
  if(off + n > ip->size)
    80003450:	00e7f463          	bgeu	a5,a4,80003458 <readi+0x3e>
    n = ip->size - off;
    80003454:	40d78b3b          	subw	s6,a5,a3

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80003458:	0a0b0963          	beqz	s6,8000350a <readi+0xf0>
    8000345c:	4981                	li	s3,0
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    8000345e:	40000d13          	li	s10,1024
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80003462:	5cfd                	li	s9,-1
    80003464:	a82d                	j	8000349e <readi+0x84>
    80003466:	020a1d93          	slli	s11,s4,0x20
    8000346a:	020ddd93          	srli	s11,s11,0x20
    8000346e:	05890613          	addi	a2,s2,88
    80003472:	86ee                	mv	a3,s11
    80003474:	963a                	add	a2,a2,a4
    80003476:	85d6                	mv	a1,s5
    80003478:	8562                	mv	a0,s8
    8000347a:	fffff097          	auipc	ra,0xfffff
    8000347e:	a52080e7          	jalr	-1454(ra) # 80001ecc <either_copyout>
    80003482:	05950d63          	beq	a0,s9,800034dc <readi+0xc2>
      brelse(bp);
      tot = -1;
      break;
    }
    brelse(bp);
    80003486:	854a                	mv	a0,s2
    80003488:	fffff097          	auipc	ra,0xfffff
    8000348c:	570080e7          	jalr	1392(ra) # 800029f8 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80003490:	013a09bb          	addw	s3,s4,s3
    80003494:	009a04bb          	addw	s1,s4,s1
    80003498:	9aee                	add	s5,s5,s11
    8000349a:	0569f763          	bgeu	s3,s6,800034e8 <readi+0xce>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    8000349e:	000ba903          	lw	s2,0(s7)
    800034a2:	00a4d59b          	srliw	a1,s1,0xa
    800034a6:	855e                	mv	a0,s7
    800034a8:	00000097          	auipc	ra,0x0
    800034ac:	8cc080e7          	jalr	-1844(ra) # 80002d74 <bmap>
    800034b0:	0005059b          	sext.w	a1,a0
    800034b4:	854a                	mv	a0,s2
    800034b6:	fffff097          	auipc	ra,0xfffff
    800034ba:	4d0080e7          	jalr	1232(ra) # 80002986 <bread>
    800034be:	892a                	mv	s2,a0
    m = min(n - tot, BSIZE - off%BSIZE);
    800034c0:	3ff4f713          	andi	a4,s1,1023
    800034c4:	40ed07bb          	subw	a5,s10,a4
    800034c8:	413b06bb          	subw	a3,s6,s3
    800034cc:	8a3e                	mv	s4,a5
    800034ce:	2781                	sext.w	a5,a5
    800034d0:	0006861b          	sext.w	a2,a3
    800034d4:	f8f679e3          	bgeu	a2,a5,80003466 <readi+0x4c>
    800034d8:	8a36                	mv	s4,a3
    800034da:	b771                	j	80003466 <readi+0x4c>
      brelse(bp);
    800034dc:	854a                	mv	a0,s2
    800034de:	fffff097          	auipc	ra,0xfffff
    800034e2:	51a080e7          	jalr	1306(ra) # 800029f8 <brelse>
      tot = -1;
    800034e6:	59fd                	li	s3,-1
  }
  return tot;
    800034e8:	0009851b          	sext.w	a0,s3
}
    800034ec:	70a6                	ld	ra,104(sp)
    800034ee:	7406                	ld	s0,96(sp)
    800034f0:	64e6                	ld	s1,88(sp)
    800034f2:	6946                	ld	s2,80(sp)
    800034f4:	69a6                	ld	s3,72(sp)
    800034f6:	6a06                	ld	s4,64(sp)
    800034f8:	7ae2                	ld	s5,56(sp)
    800034fa:	7b42                	ld	s6,48(sp)
    800034fc:	7ba2                	ld	s7,40(sp)
    800034fe:	7c02                	ld	s8,32(sp)
    80003500:	6ce2                	ld	s9,24(sp)
    80003502:	6d42                	ld	s10,16(sp)
    80003504:	6da2                	ld	s11,8(sp)
    80003506:	6165                	addi	sp,sp,112
    80003508:	8082                	ret
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    8000350a:	89da                	mv	s3,s6
    8000350c:	bff1                	j	800034e8 <readi+0xce>
    return 0;
    8000350e:	4501                	li	a0,0
}
    80003510:	8082                	ret

0000000080003512 <writei>:
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80003512:	457c                	lw	a5,76(a0)
    80003514:	10d7e363          	bltu	a5,a3,8000361a <writei+0x108>
{
    80003518:	7159                	addi	sp,sp,-112
    8000351a:	f486                	sd	ra,104(sp)
    8000351c:	f0a2                	sd	s0,96(sp)
    8000351e:	eca6                	sd	s1,88(sp)
    80003520:	e8ca                	sd	s2,80(sp)
    80003522:	e4ce                	sd	s3,72(sp)
    80003524:	e0d2                	sd	s4,64(sp)
    80003526:	fc56                	sd	s5,56(sp)
    80003528:	f85a                	sd	s6,48(sp)
    8000352a:	f45e                	sd	s7,40(sp)
    8000352c:	f062                	sd	s8,32(sp)
    8000352e:	ec66                	sd	s9,24(sp)
    80003530:	e86a                	sd	s10,16(sp)
    80003532:	e46e                	sd	s11,8(sp)
    80003534:	1880                	addi	s0,sp,112
    80003536:	8b2a                	mv	s6,a0
    80003538:	8c2e                	mv	s8,a1
    8000353a:	8ab2                	mv	s5,a2
    8000353c:	8936                	mv	s2,a3
    8000353e:	8bba                	mv	s7,a4
  if(off > ip->size || off + n < off)
    80003540:	00e687bb          	addw	a5,a3,a4
    80003544:	0cd7ed63          	bltu	a5,a3,8000361e <writei+0x10c>
    return -1;
  if(off + n > MAXFILE*BSIZE)
    80003548:	00043737          	lui	a4,0x43
    8000354c:	0cf76b63          	bltu	a4,a5,80003622 <writei+0x110>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80003550:	0c0b8363          	beqz	s7,80003616 <writei+0x104>
    80003554:	4a01                	li	s4,0
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    80003556:	40000d13          	li	s10,1024
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    8000355a:	5cfd                	li	s9,-1
    8000355c:	a82d                	j	80003596 <writei+0x84>
    8000355e:	02099d93          	slli	s11,s3,0x20
    80003562:	020ddd93          	srli	s11,s11,0x20
    80003566:	05848513          	addi	a0,s1,88
    8000356a:	86ee                	mv	a3,s11
    8000356c:	8656                	mv	a2,s5
    8000356e:	85e2                	mv	a1,s8
    80003570:	953a                	add	a0,a0,a4
    80003572:	fffff097          	auipc	ra,0xfffff
    80003576:	9b0080e7          	jalr	-1616(ra) # 80001f22 <either_copyin>
    8000357a:	05950d63          	beq	a0,s9,800035d4 <writei+0xc2>
      brelse(bp);
      break;
    }
    //log_write(bp);
    brelse(bp);
    8000357e:	8526                	mv	a0,s1
    80003580:	fffff097          	auipc	ra,0xfffff
    80003584:	478080e7          	jalr	1144(ra) # 800029f8 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80003588:	01498a3b          	addw	s4,s3,s4
    8000358c:	0129893b          	addw	s2,s3,s2
    80003590:	9aee                	add	s5,s5,s11
    80003592:	057a7663          	bgeu	s4,s7,800035de <writei+0xcc>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80003596:	000b2483          	lw	s1,0(s6)
    8000359a:	00a9559b          	srliw	a1,s2,0xa
    8000359e:	855a                	mv	a0,s6
    800035a0:	fffff097          	auipc	ra,0xfffff
    800035a4:	7d4080e7          	jalr	2004(ra) # 80002d74 <bmap>
    800035a8:	0005059b          	sext.w	a1,a0
    800035ac:	8526                	mv	a0,s1
    800035ae:	fffff097          	auipc	ra,0xfffff
    800035b2:	3d8080e7          	jalr	984(ra) # 80002986 <bread>
    800035b6:	84aa                	mv	s1,a0
    m = min(n - tot, BSIZE - off%BSIZE);
    800035b8:	3ff97713          	andi	a4,s2,1023
    800035bc:	40ed07bb          	subw	a5,s10,a4
    800035c0:	414b86bb          	subw	a3,s7,s4
    800035c4:	89be                	mv	s3,a5
    800035c6:	2781                	sext.w	a5,a5
    800035c8:	0006861b          	sext.w	a2,a3
    800035cc:	f8f679e3          	bgeu	a2,a5,8000355e <writei+0x4c>
    800035d0:	89b6                	mv	s3,a3
    800035d2:	b771                	j	8000355e <writei+0x4c>
      brelse(bp);
    800035d4:	8526                	mv	a0,s1
    800035d6:	fffff097          	auipc	ra,0xfffff
    800035da:	422080e7          	jalr	1058(ra) # 800029f8 <brelse>
  }

  if(off > ip->size)
    800035de:	04cb2783          	lw	a5,76(s6)
    800035e2:	0127f463          	bgeu	a5,s2,800035ea <writei+0xd8>
    ip->size = off;
    800035e6:	052b2623          	sw	s2,76(s6)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    800035ea:	855a                	mv	a0,s6
    800035ec:	00000097          	auipc	ra,0x0
    800035f0:	ab8080e7          	jalr	-1352(ra) # 800030a4 <iupdate>

  return tot;
    800035f4:	000a051b          	sext.w	a0,s4
}
    800035f8:	70a6                	ld	ra,104(sp)
    800035fa:	7406                	ld	s0,96(sp)
    800035fc:	64e6                	ld	s1,88(sp)
    800035fe:	6946                	ld	s2,80(sp)
    80003600:	69a6                	ld	s3,72(sp)
    80003602:	6a06                	ld	s4,64(sp)
    80003604:	7ae2                	ld	s5,56(sp)
    80003606:	7b42                	ld	s6,48(sp)
    80003608:	7ba2                	ld	s7,40(sp)
    8000360a:	7c02                	ld	s8,32(sp)
    8000360c:	6ce2                	ld	s9,24(sp)
    8000360e:	6d42                	ld	s10,16(sp)
    80003610:	6da2                	ld	s11,8(sp)
    80003612:	6165                	addi	sp,sp,112
    80003614:	8082                	ret
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80003616:	8a5e                	mv	s4,s7
    80003618:	bfc9                	j	800035ea <writei+0xd8>
    return -1;
    8000361a:	557d                	li	a0,-1
}
    8000361c:	8082                	ret
    return -1;
    8000361e:	557d                	li	a0,-1
    80003620:	bfe1                	j	800035f8 <writei+0xe6>
    return -1;
    80003622:	557d                	li	a0,-1
    80003624:	bfd1                	j	800035f8 <writei+0xe6>

0000000080003626 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80003626:	1141                	addi	sp,sp,-16
    80003628:	e406                	sd	ra,8(sp)
    8000362a:	e022                	sd	s0,0(sp)
    8000362c:	0800                	addi	s0,sp,16
  return strncmp(s, t, DIRSIZ);
    8000362e:	4639                	li	a2,14
    80003630:	ffffd097          	auipc	ra,0xffffd
    80003634:	c20080e7          	jalr	-992(ra) # 80000250 <strncmp>
}
    80003638:	60a2                	ld	ra,8(sp)
    8000363a:	6402                	ld	s0,0(sp)
    8000363c:	0141                	addi	sp,sp,16
    8000363e:	8082                	ret

0000000080003640 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80003640:	7139                	addi	sp,sp,-64
    80003642:	fc06                	sd	ra,56(sp)
    80003644:	f822                	sd	s0,48(sp)
    80003646:	f426                	sd	s1,40(sp)
    80003648:	f04a                	sd	s2,32(sp)
    8000364a:	ec4e                	sd	s3,24(sp)
    8000364c:	e852                	sd	s4,16(sp)
    8000364e:	0080                	addi	s0,sp,64
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80003650:	04451703          	lh	a4,68(a0)
    80003654:	4785                	li	a5,1
    80003656:	00f71a63          	bne	a4,a5,8000366a <dirlookup+0x2a>
    8000365a:	892a                	mv	s2,a0
    8000365c:	89ae                	mv	s3,a1
    8000365e:	8a32                	mv	s4,a2
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    80003660:	457c                	lw	a5,76(a0)
    80003662:	4481                	li	s1,0
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
    80003664:	4501                	li	a0,0
  for(off = 0; off < dp->size; off += sizeof(de)){
    80003666:	e79d                	bnez	a5,80003694 <dirlookup+0x54>
    80003668:	a8a5                	j	800036e0 <dirlookup+0xa0>
    panic("dirlookup not DIR");
    8000366a:	00005517          	auipc	a0,0x5
    8000366e:	05650513          	addi	a0,a0,86 # 800086c0 <syscalls+0x200>
    80003672:	00003097          	auipc	ra,0x3
    80003676:	036080e7          	jalr	54(ra) # 800066a8 <panic>
      panic("dirlookup read");
    8000367a:	00005517          	auipc	a0,0x5
    8000367e:	05e50513          	addi	a0,a0,94 # 800086d8 <syscalls+0x218>
    80003682:	00003097          	auipc	ra,0x3
    80003686:	026080e7          	jalr	38(ra) # 800066a8 <panic>
  for(off = 0; off < dp->size; off += sizeof(de)){
    8000368a:	24c1                	addiw	s1,s1,16
    8000368c:	04c92783          	lw	a5,76(s2)
    80003690:	04f4f763          	bgeu	s1,a5,800036de <dirlookup+0x9e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80003694:	4741                	li	a4,16
    80003696:	86a6                	mv	a3,s1
    80003698:	fc040613          	addi	a2,s0,-64
    8000369c:	4581                	li	a1,0
    8000369e:	854a                	mv	a0,s2
    800036a0:	00000097          	auipc	ra,0x0
    800036a4:	d7a080e7          	jalr	-646(ra) # 8000341a <readi>
    800036a8:	47c1                	li	a5,16
    800036aa:	fcf518e3          	bne	a0,a5,8000367a <dirlookup+0x3a>
    if(de.inum == 0)
    800036ae:	fc045783          	lhu	a5,-64(s0)
    800036b2:	dfe1                	beqz	a5,8000368a <dirlookup+0x4a>
    if(namecmp(name, de.name) == 0){
    800036b4:	fc240593          	addi	a1,s0,-62
    800036b8:	854e                	mv	a0,s3
    800036ba:	00000097          	auipc	ra,0x0
    800036be:	f6c080e7          	jalr	-148(ra) # 80003626 <namecmp>
    800036c2:	f561                	bnez	a0,8000368a <dirlookup+0x4a>
      if(poff)
    800036c4:	000a0463          	beqz	s4,800036cc <dirlookup+0x8c>
        *poff = off;
    800036c8:	009a2023          	sw	s1,0(s4)
      return iget(dp->dev, inum);
    800036cc:	fc045583          	lhu	a1,-64(s0)
    800036d0:	00092503          	lw	a0,0(s2)
    800036d4:	fffff097          	auipc	ra,0xfffff
    800036d8:	770080e7          	jalr	1904(ra) # 80002e44 <iget>
    800036dc:	a011                	j	800036e0 <dirlookup+0xa0>
  return 0;
    800036de:	4501                	li	a0,0
}
    800036e0:	70e2                	ld	ra,56(sp)
    800036e2:	7442                	ld	s0,48(sp)
    800036e4:	74a2                	ld	s1,40(sp)
    800036e6:	7902                	ld	s2,32(sp)
    800036e8:	69e2                	ld	s3,24(sp)
    800036ea:	6a42                	ld	s4,16(sp)
    800036ec:	6121                	addi	sp,sp,64
    800036ee:	8082                	ret

00000000800036f0 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    800036f0:	711d                	addi	sp,sp,-96
    800036f2:	ec86                	sd	ra,88(sp)
    800036f4:	e8a2                	sd	s0,80(sp)
    800036f6:	e4a6                	sd	s1,72(sp)
    800036f8:	e0ca                	sd	s2,64(sp)
    800036fa:	fc4e                	sd	s3,56(sp)
    800036fc:	f852                	sd	s4,48(sp)
    800036fe:	f456                	sd	s5,40(sp)
    80003700:	f05a                	sd	s6,32(sp)
    80003702:	ec5e                	sd	s7,24(sp)
    80003704:	e862                	sd	s8,16(sp)
    80003706:	e466                	sd	s9,8(sp)
    80003708:	1080                	addi	s0,sp,96
    8000370a:	84aa                	mv	s1,a0
    8000370c:	8b2e                	mv	s6,a1
    8000370e:	8ab2                	mv	s5,a2
  struct inode *ip, *next;

  if(*path == '/')
    80003710:	00054703          	lbu	a4,0(a0)
    80003714:	02f00793          	li	a5,47
    80003718:	02f70363          	beq	a4,a5,8000373e <namex+0x4e>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
    8000371c:	ffffe097          	auipc	ra,0xffffe
    80003720:	d50080e7          	jalr	-688(ra) # 8000146c <myproc>
    80003724:	15053503          	ld	a0,336(a0)
    80003728:	00000097          	auipc	ra,0x0
    8000372c:	a00080e7          	jalr	-1536(ra) # 80003128 <idup>
    80003730:	89aa                	mv	s3,a0
  while(*path == '/')
    80003732:	02f00913          	li	s2,47
  len = path - s;
    80003736:	4b81                	li	s7,0
  if(len >= DIRSIZ)
    80003738:	4cb5                	li	s9,13

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
    if(ip->type != T_DIR){
    8000373a:	4c05                	li	s8,1
    8000373c:	a865                	j	800037f4 <namex+0x104>
    ip = iget(ROOTDEV, ROOTINO);
    8000373e:	4585                	li	a1,1
    80003740:	4505                	li	a0,1
    80003742:	fffff097          	auipc	ra,0xfffff
    80003746:	702080e7          	jalr	1794(ra) # 80002e44 <iget>
    8000374a:	89aa                	mv	s3,a0
    8000374c:	b7dd                	j	80003732 <namex+0x42>
      iunlockput(ip);
    8000374e:	854e                	mv	a0,s3
    80003750:	00000097          	auipc	ra,0x0
    80003754:	c78080e7          	jalr	-904(ra) # 800033c8 <iunlockput>
      return 0;
    80003758:	4981                	li	s3,0
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
    8000375a:	854e                	mv	a0,s3
    8000375c:	60e6                	ld	ra,88(sp)
    8000375e:	6446                	ld	s0,80(sp)
    80003760:	64a6                	ld	s1,72(sp)
    80003762:	6906                	ld	s2,64(sp)
    80003764:	79e2                	ld	s3,56(sp)
    80003766:	7a42                	ld	s4,48(sp)
    80003768:	7aa2                	ld	s5,40(sp)
    8000376a:	7b02                	ld	s6,32(sp)
    8000376c:	6be2                	ld	s7,24(sp)
    8000376e:	6c42                	ld	s8,16(sp)
    80003770:	6ca2                	ld	s9,8(sp)
    80003772:	6125                	addi	sp,sp,96
    80003774:	8082                	ret
      iunlock(ip);
    80003776:	854e                	mv	a0,s3
    80003778:	00000097          	auipc	ra,0x0
    8000377c:	ab0080e7          	jalr	-1360(ra) # 80003228 <iunlock>
      return ip;
    80003780:	bfe9                	j	8000375a <namex+0x6a>
      iunlockput(ip);
    80003782:	854e                	mv	a0,s3
    80003784:	00000097          	auipc	ra,0x0
    80003788:	c44080e7          	jalr	-956(ra) # 800033c8 <iunlockput>
      return 0;
    8000378c:	89d2                	mv	s3,s4
    8000378e:	b7f1                	j	8000375a <namex+0x6a>
  len = path - s;
    80003790:	40b48633          	sub	a2,s1,a1
    80003794:	00060a1b          	sext.w	s4,a2
  if(len >= DIRSIZ)
    80003798:	094cd463          	bge	s9,s4,80003820 <namex+0x130>
    memmove(name, s, DIRSIZ);
    8000379c:	4639                	li	a2,14
    8000379e:	8556                	mv	a0,s5
    800037a0:	ffffd097          	auipc	ra,0xffffd
    800037a4:	a38080e7          	jalr	-1480(ra) # 800001d8 <memmove>
  while(*path == '/')
    800037a8:	0004c783          	lbu	a5,0(s1)
    800037ac:	01279763          	bne	a5,s2,800037ba <namex+0xca>
    path++;
    800037b0:	0485                	addi	s1,s1,1
  while(*path == '/')
    800037b2:	0004c783          	lbu	a5,0(s1)
    800037b6:	ff278de3          	beq	a5,s2,800037b0 <namex+0xc0>
    ilock(ip);
    800037ba:	854e                	mv	a0,s3
    800037bc:	00000097          	auipc	ra,0x0
    800037c0:	9aa080e7          	jalr	-1622(ra) # 80003166 <ilock>
    if(ip->type != T_DIR){
    800037c4:	04499783          	lh	a5,68(s3)
    800037c8:	f98793e3          	bne	a5,s8,8000374e <namex+0x5e>
    if(nameiparent && *path == '\0'){
    800037cc:	000b0563          	beqz	s6,800037d6 <namex+0xe6>
    800037d0:	0004c783          	lbu	a5,0(s1)
    800037d4:	d3cd                	beqz	a5,80003776 <namex+0x86>
    if((next = dirlookup(ip, name, 0)) == 0){
    800037d6:	865e                	mv	a2,s7
    800037d8:	85d6                	mv	a1,s5
    800037da:	854e                	mv	a0,s3
    800037dc:	00000097          	auipc	ra,0x0
    800037e0:	e64080e7          	jalr	-412(ra) # 80003640 <dirlookup>
    800037e4:	8a2a                	mv	s4,a0
    800037e6:	dd51                	beqz	a0,80003782 <namex+0x92>
    iunlockput(ip);
    800037e8:	854e                	mv	a0,s3
    800037ea:	00000097          	auipc	ra,0x0
    800037ee:	bde080e7          	jalr	-1058(ra) # 800033c8 <iunlockput>
    ip = next;
    800037f2:	89d2                	mv	s3,s4
  while(*path == '/')
    800037f4:	0004c783          	lbu	a5,0(s1)
    800037f8:	05279763          	bne	a5,s2,80003846 <namex+0x156>
    path++;
    800037fc:	0485                	addi	s1,s1,1
  while(*path == '/')
    800037fe:	0004c783          	lbu	a5,0(s1)
    80003802:	ff278de3          	beq	a5,s2,800037fc <namex+0x10c>
  if(*path == 0)
    80003806:	c79d                	beqz	a5,80003834 <namex+0x144>
    path++;
    80003808:	85a6                	mv	a1,s1
  len = path - s;
    8000380a:	8a5e                	mv	s4,s7
    8000380c:	865e                	mv	a2,s7
  while(*path != '/' && *path != 0)
    8000380e:	01278963          	beq	a5,s2,80003820 <namex+0x130>
    80003812:	dfbd                	beqz	a5,80003790 <namex+0xa0>
    path++;
    80003814:	0485                	addi	s1,s1,1
  while(*path != '/' && *path != 0)
    80003816:	0004c783          	lbu	a5,0(s1)
    8000381a:	ff279ce3          	bne	a5,s2,80003812 <namex+0x122>
    8000381e:	bf8d                	j	80003790 <namex+0xa0>
    memmove(name, s, len);
    80003820:	2601                	sext.w	a2,a2
    80003822:	8556                	mv	a0,s5
    80003824:	ffffd097          	auipc	ra,0xffffd
    80003828:	9b4080e7          	jalr	-1612(ra) # 800001d8 <memmove>
    name[len] = 0;
    8000382c:	9a56                	add	s4,s4,s5
    8000382e:	000a0023          	sb	zero,0(s4)
    80003832:	bf9d                	j	800037a8 <namex+0xb8>
  if(nameiparent){
    80003834:	f20b03e3          	beqz	s6,8000375a <namex+0x6a>
    iput(ip);
    80003838:	854e                	mv	a0,s3
    8000383a:	00000097          	auipc	ra,0x0
    8000383e:	ae6080e7          	jalr	-1306(ra) # 80003320 <iput>
    return 0;
    80003842:	4981                	li	s3,0
    80003844:	bf19                	j	8000375a <namex+0x6a>
  if(*path == 0)
    80003846:	d7fd                	beqz	a5,80003834 <namex+0x144>
  while(*path != '/' && *path != 0)
    80003848:	0004c783          	lbu	a5,0(s1)
    8000384c:	85a6                	mv	a1,s1
    8000384e:	b7d1                	j	80003812 <namex+0x122>

0000000080003850 <dirlink>:
{
    80003850:	7139                	addi	sp,sp,-64
    80003852:	fc06                	sd	ra,56(sp)
    80003854:	f822                	sd	s0,48(sp)
    80003856:	f426                	sd	s1,40(sp)
    80003858:	f04a                	sd	s2,32(sp)
    8000385a:	ec4e                	sd	s3,24(sp)
    8000385c:	e852                	sd	s4,16(sp)
    8000385e:	0080                	addi	s0,sp,64
    80003860:	892a                	mv	s2,a0
    80003862:	8a2e                	mv	s4,a1
    80003864:	89b2                	mv	s3,a2
  if((ip = dirlookup(dp, name, 0)) != 0){
    80003866:	4601                	li	a2,0
    80003868:	00000097          	auipc	ra,0x0
    8000386c:	dd8080e7          	jalr	-552(ra) # 80003640 <dirlookup>
    80003870:	e93d                	bnez	a0,800038e6 <dirlink+0x96>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80003872:	04c92483          	lw	s1,76(s2)
    80003876:	c49d                	beqz	s1,800038a4 <dirlink+0x54>
    80003878:	4481                	li	s1,0
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    8000387a:	4741                	li	a4,16
    8000387c:	86a6                	mv	a3,s1
    8000387e:	fc040613          	addi	a2,s0,-64
    80003882:	4581                	li	a1,0
    80003884:	854a                	mv	a0,s2
    80003886:	00000097          	auipc	ra,0x0
    8000388a:	b94080e7          	jalr	-1132(ra) # 8000341a <readi>
    8000388e:	47c1                	li	a5,16
    80003890:	06f51163          	bne	a0,a5,800038f2 <dirlink+0xa2>
    if(de.inum == 0)
    80003894:	fc045783          	lhu	a5,-64(s0)
    80003898:	c791                	beqz	a5,800038a4 <dirlink+0x54>
  for(off = 0; off < dp->size; off += sizeof(de)){
    8000389a:	24c1                	addiw	s1,s1,16
    8000389c:	04c92783          	lw	a5,76(s2)
    800038a0:	fcf4ede3          	bltu	s1,a5,8000387a <dirlink+0x2a>
  strncpy(de.name, name, DIRSIZ);
    800038a4:	4639                	li	a2,14
    800038a6:	85d2                	mv	a1,s4
    800038a8:	fc240513          	addi	a0,s0,-62
    800038ac:	ffffd097          	auipc	ra,0xffffd
    800038b0:	9e0080e7          	jalr	-1568(ra) # 8000028c <strncpy>
  de.inum = inum;
    800038b4:	fd341023          	sh	s3,-64(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    800038b8:	4741                	li	a4,16
    800038ba:	86a6                	mv	a3,s1
    800038bc:	fc040613          	addi	a2,s0,-64
    800038c0:	4581                	li	a1,0
    800038c2:	854a                	mv	a0,s2
    800038c4:	00000097          	auipc	ra,0x0
    800038c8:	c4e080e7          	jalr	-946(ra) # 80003512 <writei>
    800038cc:	872a                	mv	a4,a0
    800038ce:	47c1                	li	a5,16
  return 0;
    800038d0:	4501                	li	a0,0
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    800038d2:	02f71863          	bne	a4,a5,80003902 <dirlink+0xb2>
}
    800038d6:	70e2                	ld	ra,56(sp)
    800038d8:	7442                	ld	s0,48(sp)
    800038da:	74a2                	ld	s1,40(sp)
    800038dc:	7902                	ld	s2,32(sp)
    800038de:	69e2                	ld	s3,24(sp)
    800038e0:	6a42                	ld	s4,16(sp)
    800038e2:	6121                	addi	sp,sp,64
    800038e4:	8082                	ret
    iput(ip);
    800038e6:	00000097          	auipc	ra,0x0
    800038ea:	a3a080e7          	jalr	-1478(ra) # 80003320 <iput>
    return -1;
    800038ee:	557d                	li	a0,-1
    800038f0:	b7dd                	j	800038d6 <dirlink+0x86>
      panic("dirlink read");
    800038f2:	00005517          	auipc	a0,0x5
    800038f6:	df650513          	addi	a0,a0,-522 # 800086e8 <syscalls+0x228>
    800038fa:	00003097          	auipc	ra,0x3
    800038fe:	dae080e7          	jalr	-594(ra) # 800066a8 <panic>
    panic("dirlink");
    80003902:	00005517          	auipc	a0,0x5
    80003906:	f8e50513          	addi	a0,a0,-114 # 80008890 <syscalls+0x3d0>
    8000390a:	00003097          	auipc	ra,0x3
    8000390e:	d9e080e7          	jalr	-610(ra) # 800066a8 <panic>

0000000080003912 <namei>:

struct inode*
namei(char *path)
{
    80003912:	1101                	addi	sp,sp,-32
    80003914:	ec06                	sd	ra,24(sp)
    80003916:	e822                	sd	s0,16(sp)
    80003918:	1000                	addi	s0,sp,32
  char name[DIRSIZ];
  return namex(path, 0, name);
    8000391a:	fe040613          	addi	a2,s0,-32
    8000391e:	4581                	li	a1,0
    80003920:	00000097          	auipc	ra,0x0
    80003924:	dd0080e7          	jalr	-560(ra) # 800036f0 <namex>
}
    80003928:	60e2                	ld	ra,24(sp)
    8000392a:	6442                	ld	s0,16(sp)
    8000392c:	6105                	addi	sp,sp,32
    8000392e:	8082                	ret

0000000080003930 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80003930:	1141                	addi	sp,sp,-16
    80003932:	e406                	sd	ra,8(sp)
    80003934:	e022                	sd	s0,0(sp)
    80003936:	0800                	addi	s0,sp,16
    80003938:	862e                	mv	a2,a1
  return namex(path, 1, name);
    8000393a:	4585                	li	a1,1
    8000393c:	00000097          	auipc	ra,0x0
    80003940:	db4080e7          	jalr	-588(ra) # 800036f0 <namex>
}
    80003944:	60a2                	ld	ra,8(sp)
    80003946:	6402                	ld	s0,0(sp)
    80003948:	0141                	addi	sp,sp,16
    8000394a:	8082                	ret

000000008000394c <balloc_page>:

/* NTU OS 2024 */
/* Similar to balloc, except allocates eight consecutive free blocks. */
uint balloc_page(uint dev) {
    8000394c:	715d                	addi	sp,sp,-80
    8000394e:	e486                	sd	ra,72(sp)
    80003950:	e0a2                	sd	s0,64(sp)
    80003952:	fc26                	sd	s1,56(sp)
    80003954:	f84a                	sd	s2,48(sp)
    80003956:	f44e                	sd	s3,40(sp)
    80003958:	f052                	sd	s4,32(sp)
    8000395a:	ec56                	sd	s5,24(sp)
    8000395c:	e85a                	sd	s6,16(sp)
    8000395e:	e45e                	sd	s7,8(sp)
    80003960:	0880                	addi	s0,sp,80
  for (int b = 0; b < sb.size; b += BPB) {
    80003962:	00014797          	auipc	a5,0x14
    80003966:	c0a7a783          	lw	a5,-1014(a5) # 8001756c <sb+0x4>
    8000396a:	c3e9                	beqz	a5,80003a2c <balloc_page+0xe0>
    8000396c:	89aa                	mv	s3,a0
    8000396e:	4a01                	li	s4,0
    struct buf *bp = bread(dev, BBLOCK(b, sb));
    80003970:	00014a97          	auipc	s5,0x14
    80003974:	bf8a8a93          	addi	s5,s5,-1032 # 80017568 <sb>

    for (int bi = 0; bi < BPB && b + bi < sb.size; bi += 8) {
    80003978:	4b01                	li	s6,0
    8000397a:	6909                	lui	s2,0x2
  for (int b = 0; b < sb.size; b += BPB) {
    8000397c:	6b89                	lui	s7,0x2
    8000397e:	a8b9                	j	800039dc <balloc_page+0x90>
      uchar *bits = &bp->data[bi / 8];
      if (*bits == 0) {
        *bits |= 0xff; // Mark 8 consecutive blocks in use.
    80003980:	97aa                	add	a5,a5,a0
    80003982:	577d                	li	a4,-1
    80003984:	04e78c23          	sb	a4,88(a5)
        //log_write(bp);
        brelse(bp);
    80003988:	fffff097          	auipc	ra,0xfffff
    8000398c:	070080e7          	jalr	112(ra) # 800029f8 <brelse>

        for (int i = 0; i < 8; i += 1) {
    80003990:	00848a1b          	addiw	s4,s1,8
        brelse(bp);
    80003994:	8926                	mv	s2,s1
          bzero(dev, b + bi + i);
    80003996:	2981                	sext.w	s3,s3
    80003998:	0009059b          	sext.w	a1,s2
    8000399c:	854e                	mv	a0,s3
    8000399e:	fffff097          	auipc	ra,0xfffff
    800039a2:	29e080e7          	jalr	670(ra) # 80002c3c <bzero>
        for (int i = 0; i < 8; i += 1) {
    800039a6:	2905                	addiw	s2,s2,1
    800039a8:	ff4918e3          	bne	s2,s4,80003998 <balloc_page+0x4c>
    }

    brelse(bp);
  }
  panic("balloc_page: out of blocks");
}
    800039ac:	8526                	mv	a0,s1
    800039ae:	60a6                	ld	ra,72(sp)
    800039b0:	6406                	ld	s0,64(sp)
    800039b2:	74e2                	ld	s1,56(sp)
    800039b4:	7942                	ld	s2,48(sp)
    800039b6:	79a2                	ld	s3,40(sp)
    800039b8:	7a02                	ld	s4,32(sp)
    800039ba:	6ae2                	ld	s5,24(sp)
    800039bc:	6b42                	ld	s6,16(sp)
    800039be:	6ba2                	ld	s7,8(sp)
    800039c0:	6161                	addi	sp,sp,80
    800039c2:	8082                	ret
    brelse(bp);
    800039c4:	fffff097          	auipc	ra,0xfffff
    800039c8:	034080e7          	jalr	52(ra) # 800029f8 <brelse>
  for (int b = 0; b < sb.size; b += BPB) {
    800039cc:	014b87bb          	addw	a5,s7,s4
    800039d0:	00078a1b          	sext.w	s4,a5
    800039d4:	004aa703          	lw	a4,4(s5)
    800039d8:	04ea7a63          	bgeu	s4,a4,80003a2c <balloc_page+0xe0>
    struct buf *bp = bread(dev, BBLOCK(b, sb));
    800039dc:	41fa579b          	sraiw	a5,s4,0x1f
    800039e0:	0137d79b          	srliw	a5,a5,0x13
    800039e4:	014787bb          	addw	a5,a5,s4
    800039e8:	40d7d79b          	sraiw	a5,a5,0xd
    800039ec:	01caa583          	lw	a1,28(s5)
    800039f0:	9dbd                	addw	a1,a1,a5
    800039f2:	854e                	mv	a0,s3
    800039f4:	fffff097          	auipc	ra,0xfffff
    800039f8:	f92080e7          	jalr	-110(ra) # 80002986 <bread>
    for (int bi = 0; bi < BPB && b + bi < sb.size; bi += 8) {
    800039fc:	004aa603          	lw	a2,4(s5)
    80003a00:	000a049b          	sext.w	s1,s4
    80003a04:	875a                	mv	a4,s6
    80003a06:	fac4ffe3          	bgeu	s1,a2,800039c4 <balloc_page+0x78>
      uchar *bits = &bp->data[bi / 8];
    80003a0a:	41f7579b          	sraiw	a5,a4,0x1f
    80003a0e:	01d7d79b          	srliw	a5,a5,0x1d
    80003a12:	9fb9                	addw	a5,a5,a4
    80003a14:	4037d79b          	sraiw	a5,a5,0x3
      if (*bits == 0) {
    80003a18:	00f506b3          	add	a3,a0,a5
    80003a1c:	0586c683          	lbu	a3,88(a3)
    80003a20:	d2a5                	beqz	a3,80003980 <balloc_page+0x34>
    for (int bi = 0; bi < BPB && b + bi < sb.size; bi += 8) {
    80003a22:	2721                	addiw	a4,a4,8
    80003a24:	24a1                	addiw	s1,s1,8
    80003a26:	ff2710e3          	bne	a4,s2,80003a06 <balloc_page+0xba>
    80003a2a:	bf69                	j	800039c4 <balloc_page+0x78>
  panic("balloc_page: out of blocks");
    80003a2c:	00005517          	auipc	a0,0x5
    80003a30:	ccc50513          	addi	a0,a0,-820 # 800086f8 <syscalls+0x238>
    80003a34:	00003097          	auipc	ra,0x3
    80003a38:	c74080e7          	jalr	-908(ra) # 800066a8 <panic>

0000000080003a3c <bfree_page>:

/* NTU OS 2024 */
/* Free 8 disk blocks allocated from balloc_page(). */
void bfree_page(int dev, uint blockno) {
    80003a3c:	1101                	addi	sp,sp,-32
    80003a3e:	ec06                	sd	ra,24(sp)
    80003a40:	e822                	sd	s0,16(sp)
    80003a42:	e426                	sd	s1,8(sp)
    80003a44:	1000                	addi	s0,sp,32
  if (blockno + 8 > sb.size) {
    80003a46:	0085871b          	addiw	a4,a1,8
    80003a4a:	00014797          	auipc	a5,0x14
    80003a4e:	b227a783          	lw	a5,-1246(a5) # 8001756c <sb+0x4>
    80003a52:	04e7ee63          	bltu	a5,a4,80003aae <bfree_page+0x72>
    panic("bfree_page: blockno out of bound");
  }

  if ((blockno % 8) != 0) {
    80003a56:	0075f793          	andi	a5,a1,7
    80003a5a:	e3b5                	bnez	a5,80003abe <bfree_page+0x82>
    panic("bfree_page: blockno is not aligned");
  }

  int bi = blockno % BPB;
    80003a5c:	03359493          	slli	s1,a1,0x33
    80003a60:	90cd                	srli	s1,s1,0x33
  int b = blockno - bi;
    80003a62:	9d85                	subw	a1,a1,s1
  struct buf *bp = bread(dev, BBLOCK(b, sb));
    80003a64:	41f5d79b          	sraiw	a5,a1,0x1f
    80003a68:	0137d79b          	srliw	a5,a5,0x13
    80003a6c:	9dbd                	addw	a1,a1,a5
    80003a6e:	40d5d59b          	sraiw	a1,a1,0xd
    80003a72:	00014797          	auipc	a5,0x14
    80003a76:	b127a783          	lw	a5,-1262(a5) # 80017584 <sb+0x1c>
    80003a7a:	9dbd                	addw	a1,a1,a5
    80003a7c:	fffff097          	auipc	ra,0xfffff
    80003a80:	f0a080e7          	jalr	-246(ra) # 80002986 <bread>
  uchar *bits = &bp->data[bi / 8];
    80003a84:	808d                	srli	s1,s1,0x3

  if (*bits != 0xff) {
    80003a86:	009507b3          	add	a5,a0,s1
    80003a8a:	0587c703          	lbu	a4,88(a5)
    80003a8e:	0ff00793          	li	a5,255
    80003a92:	02f71e63          	bne	a4,a5,80003ace <bfree_page+0x92>
    panic("bfree_page: data bits are invalid");
  }

  *bits = 0;
    80003a96:	94aa                	add	s1,s1,a0
    80003a98:	04048c23          	sb	zero,88(s1)
  //log_write(bp);
  brelse(bp);
    80003a9c:	fffff097          	auipc	ra,0xfffff
    80003aa0:	f5c080e7          	jalr	-164(ra) # 800029f8 <brelse>
}
    80003aa4:	60e2                	ld	ra,24(sp)
    80003aa6:	6442                	ld	s0,16(sp)
    80003aa8:	64a2                	ld	s1,8(sp)
    80003aaa:	6105                	addi	sp,sp,32
    80003aac:	8082                	ret
    panic("bfree_page: blockno out of bound");
    80003aae:	00005517          	auipc	a0,0x5
    80003ab2:	c6a50513          	addi	a0,a0,-918 # 80008718 <syscalls+0x258>
    80003ab6:	00003097          	auipc	ra,0x3
    80003aba:	bf2080e7          	jalr	-1038(ra) # 800066a8 <panic>
    panic("bfree_page: blockno is not aligned");
    80003abe:	00005517          	auipc	a0,0x5
    80003ac2:	c8250513          	addi	a0,a0,-894 # 80008740 <syscalls+0x280>
    80003ac6:	00003097          	auipc	ra,0x3
    80003aca:	be2080e7          	jalr	-1054(ra) # 800066a8 <panic>
    panic("bfree_page: data bits are invalid");
    80003ace:	00005517          	auipc	a0,0x5
    80003ad2:	c9a50513          	addi	a0,a0,-870 # 80008768 <syscalls+0x2a8>
    80003ad6:	00003097          	auipc	ra,0x3
    80003ada:	bd2080e7          	jalr	-1070(ra) # 800066a8 <panic>

0000000080003ade <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    80003ade:	1101                	addi	sp,sp,-32
    80003ae0:	ec06                	sd	ra,24(sp)
    80003ae2:	e822                	sd	s0,16(sp)
    80003ae4:	e426                	sd	s1,8(sp)
    80003ae6:	e04a                	sd	s2,0(sp)
    80003ae8:	1000                	addi	s0,sp,32
  struct buf *buf = bread(log.dev, log.start);
    80003aea:	00015917          	auipc	s2,0x15
    80003aee:	54690913          	addi	s2,s2,1350 # 80019030 <log>
    80003af2:	01892583          	lw	a1,24(s2)
    80003af6:	02892503          	lw	a0,40(s2)
    80003afa:	fffff097          	auipc	ra,0xfffff
    80003afe:	e8c080e7          	jalr	-372(ra) # 80002986 <bread>
    80003b02:	84aa                	mv	s1,a0
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
    80003b04:	02c92683          	lw	a3,44(s2)
    80003b08:	cd34                	sw	a3,88(a0)
  for (i = 0; i < log.lh.n; i++) {
    80003b0a:	02d05763          	blez	a3,80003b38 <write_head+0x5a>
    80003b0e:	00015797          	auipc	a5,0x15
    80003b12:	55278793          	addi	a5,a5,1362 # 80019060 <log+0x30>
    80003b16:	05c50713          	addi	a4,a0,92
    80003b1a:	36fd                	addiw	a3,a3,-1
    80003b1c:	1682                	slli	a3,a3,0x20
    80003b1e:	9281                	srli	a3,a3,0x20
    80003b20:	068a                	slli	a3,a3,0x2
    80003b22:	00015617          	auipc	a2,0x15
    80003b26:	54260613          	addi	a2,a2,1346 # 80019064 <log+0x34>
    80003b2a:	96b2                	add	a3,a3,a2
    hb->block[i] = log.lh.block[i];
    80003b2c:	4390                	lw	a2,0(a5)
    80003b2e:	c310                	sw	a2,0(a4)
  for (i = 0; i < log.lh.n; i++) {
    80003b30:	0791                	addi	a5,a5,4
    80003b32:	0711                	addi	a4,a4,4
    80003b34:	fed79ce3          	bne	a5,a3,80003b2c <write_head+0x4e>
  }
  bwrite(buf);
    80003b38:	8526                	mv	a0,s1
    80003b3a:	fffff097          	auipc	ra,0xfffff
    80003b3e:	e80080e7          	jalr	-384(ra) # 800029ba <bwrite>
  brelse(buf);
    80003b42:	8526                	mv	a0,s1
    80003b44:	fffff097          	auipc	ra,0xfffff
    80003b48:	eb4080e7          	jalr	-332(ra) # 800029f8 <brelse>
}
    80003b4c:	60e2                	ld	ra,24(sp)
    80003b4e:	6442                	ld	s0,16(sp)
    80003b50:	64a2                	ld	s1,8(sp)
    80003b52:	6902                	ld	s2,0(sp)
    80003b54:	6105                	addi	sp,sp,32
    80003b56:	8082                	ret

0000000080003b58 <install_trans>:
  for (tail = 0; tail < log.lh.n; tail++) {
    80003b58:	00015797          	auipc	a5,0x15
    80003b5c:	5047a783          	lw	a5,1284(a5) # 8001905c <log+0x2c>
    80003b60:	0af05d63          	blez	a5,80003c1a <install_trans+0xc2>
{
    80003b64:	7139                	addi	sp,sp,-64
    80003b66:	fc06                	sd	ra,56(sp)
    80003b68:	f822                	sd	s0,48(sp)
    80003b6a:	f426                	sd	s1,40(sp)
    80003b6c:	f04a                	sd	s2,32(sp)
    80003b6e:	ec4e                	sd	s3,24(sp)
    80003b70:	e852                	sd	s4,16(sp)
    80003b72:	e456                	sd	s5,8(sp)
    80003b74:	e05a                	sd	s6,0(sp)
    80003b76:	0080                	addi	s0,sp,64
    80003b78:	8b2a                	mv	s6,a0
    80003b7a:	00015a97          	auipc	s5,0x15
    80003b7e:	4e6a8a93          	addi	s5,s5,1254 # 80019060 <log+0x30>
  for (tail = 0; tail < log.lh.n; tail++) {
    80003b82:	4a01                	li	s4,0
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80003b84:	00015997          	auipc	s3,0x15
    80003b88:	4ac98993          	addi	s3,s3,1196 # 80019030 <log>
    80003b8c:	a035                	j	80003bb8 <install_trans+0x60>
      bunpin(dbuf);
    80003b8e:	8526                	mv	a0,s1
    80003b90:	fffff097          	auipc	ra,0xfffff
    80003b94:	f42080e7          	jalr	-190(ra) # 80002ad2 <bunpin>
    brelse(lbuf);
    80003b98:	854a                	mv	a0,s2
    80003b9a:	fffff097          	auipc	ra,0xfffff
    80003b9e:	e5e080e7          	jalr	-418(ra) # 800029f8 <brelse>
    brelse(dbuf);
    80003ba2:	8526                	mv	a0,s1
    80003ba4:	fffff097          	auipc	ra,0xfffff
    80003ba8:	e54080e7          	jalr	-428(ra) # 800029f8 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80003bac:	2a05                	addiw	s4,s4,1
    80003bae:	0a91                	addi	s5,s5,4
    80003bb0:	02c9a783          	lw	a5,44(s3)
    80003bb4:	04fa5963          	bge	s4,a5,80003c06 <install_trans+0xae>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80003bb8:	0189a583          	lw	a1,24(s3)
    80003bbc:	014585bb          	addw	a1,a1,s4
    80003bc0:	2585                	addiw	a1,a1,1
    80003bc2:	0289a503          	lw	a0,40(s3)
    80003bc6:	fffff097          	auipc	ra,0xfffff
    80003bca:	dc0080e7          	jalr	-576(ra) # 80002986 <bread>
    80003bce:	892a                	mv	s2,a0
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80003bd0:	000aa583          	lw	a1,0(s5)
    80003bd4:	0289a503          	lw	a0,40(s3)
    80003bd8:	fffff097          	auipc	ra,0xfffff
    80003bdc:	dae080e7          	jalr	-594(ra) # 80002986 <bread>
    80003be0:	84aa                	mv	s1,a0
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80003be2:	40000613          	li	a2,1024
    80003be6:	05890593          	addi	a1,s2,88
    80003bea:	05850513          	addi	a0,a0,88
    80003bee:	ffffc097          	auipc	ra,0xffffc
    80003bf2:	5ea080e7          	jalr	1514(ra) # 800001d8 <memmove>
    bwrite(dbuf);  // write dst to disk
    80003bf6:	8526                	mv	a0,s1
    80003bf8:	fffff097          	auipc	ra,0xfffff
    80003bfc:	dc2080e7          	jalr	-574(ra) # 800029ba <bwrite>
    if(recovering == 0)
    80003c00:	f80b1ce3          	bnez	s6,80003b98 <install_trans+0x40>
    80003c04:	b769                	j	80003b8e <install_trans+0x36>
}
    80003c06:	70e2                	ld	ra,56(sp)
    80003c08:	7442                	ld	s0,48(sp)
    80003c0a:	74a2                	ld	s1,40(sp)
    80003c0c:	7902                	ld	s2,32(sp)
    80003c0e:	69e2                	ld	s3,24(sp)
    80003c10:	6a42                	ld	s4,16(sp)
    80003c12:	6aa2                	ld	s5,8(sp)
    80003c14:	6b02                	ld	s6,0(sp)
    80003c16:	6121                	addi	sp,sp,64
    80003c18:	8082                	ret
    80003c1a:	8082                	ret

0000000080003c1c <initlog>:
{
    80003c1c:	7179                	addi	sp,sp,-48
    80003c1e:	f406                	sd	ra,40(sp)
    80003c20:	f022                	sd	s0,32(sp)
    80003c22:	ec26                	sd	s1,24(sp)
    80003c24:	e84a                	sd	s2,16(sp)
    80003c26:	e44e                	sd	s3,8(sp)
    80003c28:	1800                	addi	s0,sp,48
    80003c2a:	892a                	mv	s2,a0
    80003c2c:	89ae                	mv	s3,a1
  initlock(&log.lock, "log");
    80003c2e:	00015497          	auipc	s1,0x15
    80003c32:	40248493          	addi	s1,s1,1026 # 80019030 <log>
    80003c36:	00005597          	auipc	a1,0x5
    80003c3a:	b5a58593          	addi	a1,a1,-1190 # 80008790 <syscalls+0x2d0>
    80003c3e:	8526                	mv	a0,s1
    80003c40:	00003097          	auipc	ra,0x3
    80003c44:	f22080e7          	jalr	-222(ra) # 80006b62 <initlock>
  log.start = sb->logstart;
    80003c48:	0149a583          	lw	a1,20(s3)
    80003c4c:	cc8c                	sw	a1,24(s1)
  log.size = sb->nlog;
    80003c4e:	0109a783          	lw	a5,16(s3)
    80003c52:	ccdc                	sw	a5,28(s1)
  log.dev = dev;
    80003c54:	0324a423          	sw	s2,40(s1)
  struct buf *buf = bread(log.dev, log.start);
    80003c58:	854a                	mv	a0,s2
    80003c5a:	fffff097          	auipc	ra,0xfffff
    80003c5e:	d2c080e7          	jalr	-724(ra) # 80002986 <bread>
  log.lh.n = lh->n;
    80003c62:	4d3c                	lw	a5,88(a0)
    80003c64:	d4dc                	sw	a5,44(s1)
  for (i = 0; i < log.lh.n; i++) {
    80003c66:	02f05563          	blez	a5,80003c90 <initlog+0x74>
    80003c6a:	05c50713          	addi	a4,a0,92
    80003c6e:	00015697          	auipc	a3,0x15
    80003c72:	3f268693          	addi	a3,a3,1010 # 80019060 <log+0x30>
    80003c76:	37fd                	addiw	a5,a5,-1
    80003c78:	1782                	slli	a5,a5,0x20
    80003c7a:	9381                	srli	a5,a5,0x20
    80003c7c:	078a                	slli	a5,a5,0x2
    80003c7e:	06050613          	addi	a2,a0,96
    80003c82:	97b2                	add	a5,a5,a2
    log.lh.block[i] = lh->block[i];
    80003c84:	4310                	lw	a2,0(a4)
    80003c86:	c290                	sw	a2,0(a3)
  for (i = 0; i < log.lh.n; i++) {
    80003c88:	0711                	addi	a4,a4,4
    80003c8a:	0691                	addi	a3,a3,4
    80003c8c:	fef71ce3          	bne	a4,a5,80003c84 <initlog+0x68>
  brelse(buf);
    80003c90:	fffff097          	auipc	ra,0xfffff
    80003c94:	d68080e7          	jalr	-664(ra) # 800029f8 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(1); // if committed, copy from log to disk
    80003c98:	4505                	li	a0,1
    80003c9a:	00000097          	auipc	ra,0x0
    80003c9e:	ebe080e7          	jalr	-322(ra) # 80003b58 <install_trans>
  log.lh.n = 0;
    80003ca2:	00015797          	auipc	a5,0x15
    80003ca6:	3a07ad23          	sw	zero,954(a5) # 8001905c <log+0x2c>
  write_head(); // clear the log
    80003caa:	00000097          	auipc	ra,0x0
    80003cae:	e34080e7          	jalr	-460(ra) # 80003ade <write_head>
}
    80003cb2:	70a2                	ld	ra,40(sp)
    80003cb4:	7402                	ld	s0,32(sp)
    80003cb6:	64e2                	ld	s1,24(sp)
    80003cb8:	6942                	ld	s2,16(sp)
    80003cba:	69a2                	ld	s3,8(sp)
    80003cbc:	6145                	addi	sp,sp,48
    80003cbe:	8082                	ret

0000000080003cc0 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
    80003cc0:	1101                	addi	sp,sp,-32
    80003cc2:	ec06                	sd	ra,24(sp)
    80003cc4:	e822                	sd	s0,16(sp)
    80003cc6:	e426                	sd	s1,8(sp)
    80003cc8:	e04a                	sd	s2,0(sp)
    80003cca:	1000                	addi	s0,sp,32
  acquire(&log.lock);
    80003ccc:	00015517          	auipc	a0,0x15
    80003cd0:	36450513          	addi	a0,a0,868 # 80019030 <log>
    80003cd4:	00003097          	auipc	ra,0x3
    80003cd8:	f1e080e7          	jalr	-226(ra) # 80006bf2 <acquire>
  while(1){
    if(log.committing){
    80003cdc:	00015497          	auipc	s1,0x15
    80003ce0:	35448493          	addi	s1,s1,852 # 80019030 <log>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    80003ce4:	4979                	li	s2,30
    80003ce6:	a039                	j	80003cf4 <begin_op+0x34>
      sleep(&log, &log.lock);
    80003ce8:	85a6                	mv	a1,s1
    80003cea:	8526                	mv	a0,s1
    80003cec:	ffffe097          	auipc	ra,0xffffe
    80003cf0:	e3c080e7          	jalr	-452(ra) # 80001b28 <sleep>
    if(log.committing){
    80003cf4:	50dc                	lw	a5,36(s1)
    80003cf6:	fbed                	bnez	a5,80003ce8 <begin_op+0x28>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    80003cf8:	509c                	lw	a5,32(s1)
    80003cfa:	0017871b          	addiw	a4,a5,1
    80003cfe:	0007069b          	sext.w	a3,a4
    80003d02:	0027179b          	slliw	a5,a4,0x2
    80003d06:	9fb9                	addw	a5,a5,a4
    80003d08:	0017979b          	slliw	a5,a5,0x1
    80003d0c:	54d8                	lw	a4,44(s1)
    80003d0e:	9fb9                	addw	a5,a5,a4
    80003d10:	00f95963          	bge	s2,a5,80003d22 <begin_op+0x62>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    80003d14:	85a6                	mv	a1,s1
    80003d16:	8526                	mv	a0,s1
    80003d18:	ffffe097          	auipc	ra,0xffffe
    80003d1c:	e10080e7          	jalr	-496(ra) # 80001b28 <sleep>
    80003d20:	bfd1                	j	80003cf4 <begin_op+0x34>
    } else {
      log.outstanding += 1;
    80003d22:	00015517          	auipc	a0,0x15
    80003d26:	30e50513          	addi	a0,a0,782 # 80019030 <log>
    80003d2a:	d114                	sw	a3,32(a0)
      release(&log.lock);
    80003d2c:	00003097          	auipc	ra,0x3
    80003d30:	f7a080e7          	jalr	-134(ra) # 80006ca6 <release>
      break;
    }
  }
}
    80003d34:	60e2                	ld	ra,24(sp)
    80003d36:	6442                	ld	s0,16(sp)
    80003d38:	64a2                	ld	s1,8(sp)
    80003d3a:	6902                	ld	s2,0(sp)
    80003d3c:	6105                	addi	sp,sp,32
    80003d3e:	8082                	ret

0000000080003d40 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    80003d40:	7139                	addi	sp,sp,-64
    80003d42:	fc06                	sd	ra,56(sp)
    80003d44:	f822                	sd	s0,48(sp)
    80003d46:	f426                	sd	s1,40(sp)
    80003d48:	f04a                	sd	s2,32(sp)
    80003d4a:	ec4e                	sd	s3,24(sp)
    80003d4c:	e852                	sd	s4,16(sp)
    80003d4e:	e456                	sd	s5,8(sp)
    80003d50:	0080                	addi	s0,sp,64
  int do_commit = 0;

  acquire(&log.lock);
    80003d52:	00015497          	auipc	s1,0x15
    80003d56:	2de48493          	addi	s1,s1,734 # 80019030 <log>
    80003d5a:	8526                	mv	a0,s1
    80003d5c:	00003097          	auipc	ra,0x3
    80003d60:	e96080e7          	jalr	-362(ra) # 80006bf2 <acquire>
  log.outstanding -= 1;
    80003d64:	509c                	lw	a5,32(s1)
    80003d66:	37fd                	addiw	a5,a5,-1
    80003d68:	0007891b          	sext.w	s2,a5
    80003d6c:	d09c                	sw	a5,32(s1)
  if(log.committing)
    80003d6e:	50dc                	lw	a5,36(s1)
    80003d70:	efb9                	bnez	a5,80003dce <end_op+0x8e>
    panic("log.committing");
  if(log.outstanding == 0){
    80003d72:	06091663          	bnez	s2,80003dde <end_op+0x9e>
    do_commit = 1;
    log.committing = 1;
    80003d76:	00015497          	auipc	s1,0x15
    80003d7a:	2ba48493          	addi	s1,s1,698 # 80019030 <log>
    80003d7e:	4785                	li	a5,1
    80003d80:	d0dc                	sw	a5,36(s1)
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
    80003d82:	8526                	mv	a0,s1
    80003d84:	00003097          	auipc	ra,0x3
    80003d88:	f22080e7          	jalr	-222(ra) # 80006ca6 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
    80003d8c:	54dc                	lw	a5,44(s1)
    80003d8e:	06f04763          	bgtz	a5,80003dfc <end_op+0xbc>
    acquire(&log.lock);
    80003d92:	00015497          	auipc	s1,0x15
    80003d96:	29e48493          	addi	s1,s1,670 # 80019030 <log>
    80003d9a:	8526                	mv	a0,s1
    80003d9c:	00003097          	auipc	ra,0x3
    80003da0:	e56080e7          	jalr	-426(ra) # 80006bf2 <acquire>
    log.committing = 0;
    80003da4:	0204a223          	sw	zero,36(s1)
    wakeup(&log);
    80003da8:	8526                	mv	a0,s1
    80003daa:	ffffe097          	auipc	ra,0xffffe
    80003dae:	f0a080e7          	jalr	-246(ra) # 80001cb4 <wakeup>
    release(&log.lock);
    80003db2:	8526                	mv	a0,s1
    80003db4:	00003097          	auipc	ra,0x3
    80003db8:	ef2080e7          	jalr	-270(ra) # 80006ca6 <release>
}
    80003dbc:	70e2                	ld	ra,56(sp)
    80003dbe:	7442                	ld	s0,48(sp)
    80003dc0:	74a2                	ld	s1,40(sp)
    80003dc2:	7902                	ld	s2,32(sp)
    80003dc4:	69e2                	ld	s3,24(sp)
    80003dc6:	6a42                	ld	s4,16(sp)
    80003dc8:	6aa2                	ld	s5,8(sp)
    80003dca:	6121                	addi	sp,sp,64
    80003dcc:	8082                	ret
    panic("log.committing");
    80003dce:	00005517          	auipc	a0,0x5
    80003dd2:	9ca50513          	addi	a0,a0,-1590 # 80008798 <syscalls+0x2d8>
    80003dd6:	00003097          	auipc	ra,0x3
    80003dda:	8d2080e7          	jalr	-1838(ra) # 800066a8 <panic>
    wakeup(&log);
    80003dde:	00015497          	auipc	s1,0x15
    80003de2:	25248493          	addi	s1,s1,594 # 80019030 <log>
    80003de6:	8526                	mv	a0,s1
    80003de8:	ffffe097          	auipc	ra,0xffffe
    80003dec:	ecc080e7          	jalr	-308(ra) # 80001cb4 <wakeup>
  release(&log.lock);
    80003df0:	8526                	mv	a0,s1
    80003df2:	00003097          	auipc	ra,0x3
    80003df6:	eb4080e7          	jalr	-332(ra) # 80006ca6 <release>
  if(do_commit){
    80003dfa:	b7c9                	j	80003dbc <end_op+0x7c>
  for (tail = 0; tail < log.lh.n; tail++) {
    80003dfc:	00015a97          	auipc	s5,0x15
    80003e00:	264a8a93          	addi	s5,s5,612 # 80019060 <log+0x30>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80003e04:	00015a17          	auipc	s4,0x15
    80003e08:	22ca0a13          	addi	s4,s4,556 # 80019030 <log>
    80003e0c:	018a2583          	lw	a1,24(s4)
    80003e10:	012585bb          	addw	a1,a1,s2
    80003e14:	2585                	addiw	a1,a1,1
    80003e16:	028a2503          	lw	a0,40(s4)
    80003e1a:	fffff097          	auipc	ra,0xfffff
    80003e1e:	b6c080e7          	jalr	-1172(ra) # 80002986 <bread>
    80003e22:	84aa                	mv	s1,a0
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    80003e24:	000aa583          	lw	a1,0(s5)
    80003e28:	028a2503          	lw	a0,40(s4)
    80003e2c:	fffff097          	auipc	ra,0xfffff
    80003e30:	b5a080e7          	jalr	-1190(ra) # 80002986 <bread>
    80003e34:	89aa                	mv	s3,a0
    memmove(to->data, from->data, BSIZE);
    80003e36:	40000613          	li	a2,1024
    80003e3a:	05850593          	addi	a1,a0,88
    80003e3e:	05848513          	addi	a0,s1,88
    80003e42:	ffffc097          	auipc	ra,0xffffc
    80003e46:	396080e7          	jalr	918(ra) # 800001d8 <memmove>
    bwrite(to);  // write the log
    80003e4a:	8526                	mv	a0,s1
    80003e4c:	fffff097          	auipc	ra,0xfffff
    80003e50:	b6e080e7          	jalr	-1170(ra) # 800029ba <bwrite>
    brelse(from);
    80003e54:	854e                	mv	a0,s3
    80003e56:	fffff097          	auipc	ra,0xfffff
    80003e5a:	ba2080e7          	jalr	-1118(ra) # 800029f8 <brelse>
    brelse(to);
    80003e5e:	8526                	mv	a0,s1
    80003e60:	fffff097          	auipc	ra,0xfffff
    80003e64:	b98080e7          	jalr	-1128(ra) # 800029f8 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80003e68:	2905                	addiw	s2,s2,1
    80003e6a:	0a91                	addi	s5,s5,4
    80003e6c:	02ca2783          	lw	a5,44(s4)
    80003e70:	f8f94ee3          	blt	s2,a5,80003e0c <end_op+0xcc>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
    80003e74:	00000097          	auipc	ra,0x0
    80003e78:	c6a080e7          	jalr	-918(ra) # 80003ade <write_head>
    install_trans(0); // Now install writes to home locations
    80003e7c:	4501                	li	a0,0
    80003e7e:	00000097          	auipc	ra,0x0
    80003e82:	cda080e7          	jalr	-806(ra) # 80003b58 <install_trans>
    log.lh.n = 0;
    80003e86:	00015797          	auipc	a5,0x15
    80003e8a:	1c07ab23          	sw	zero,470(a5) # 8001905c <log+0x2c>
    write_head();    // Erase the transaction from the log
    80003e8e:	00000097          	auipc	ra,0x0
    80003e92:	c50080e7          	jalr	-944(ra) # 80003ade <write_head>
    80003e96:	bdf5                	j	80003d92 <end_op+0x52>

0000000080003e98 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80003e98:	1101                	addi	sp,sp,-32
    80003e9a:	ec06                	sd	ra,24(sp)
    80003e9c:	e822                	sd	s0,16(sp)
    80003e9e:	e426                	sd	s1,8(sp)
    80003ea0:	e04a                	sd	s2,0(sp)
    80003ea2:	1000                	addi	s0,sp,32
    80003ea4:	84aa                	mv	s1,a0
  int i;

  acquire(&log.lock);
    80003ea6:	00015917          	auipc	s2,0x15
    80003eaa:	18a90913          	addi	s2,s2,394 # 80019030 <log>
    80003eae:	854a                	mv	a0,s2
    80003eb0:	00003097          	auipc	ra,0x3
    80003eb4:	d42080e7          	jalr	-702(ra) # 80006bf2 <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80003eb8:	02c92603          	lw	a2,44(s2)
    80003ebc:	47f5                	li	a5,29
    80003ebe:	06c7c563          	blt	a5,a2,80003f28 <log_write+0x90>
    80003ec2:	00015797          	auipc	a5,0x15
    80003ec6:	18a7a783          	lw	a5,394(a5) # 8001904c <log+0x1c>
    80003eca:	37fd                	addiw	a5,a5,-1
    80003ecc:	04f65e63          	bge	a2,a5,80003f28 <log_write+0x90>
    panic("too big a transaction");
  if (log.outstanding < 1)
    80003ed0:	00015797          	auipc	a5,0x15
    80003ed4:	1807a783          	lw	a5,384(a5) # 80019050 <log+0x20>
    80003ed8:	06f05063          	blez	a5,80003f38 <log_write+0xa0>
    panic("log_write outside of trans");

  for (i = 0; i < log.lh.n; i++) {
    80003edc:	4781                	li	a5,0
    80003ede:	06c05563          	blez	a2,80003f48 <log_write+0xb0>
    if (log.lh.block[i] == b->blockno)   // log absorption
    80003ee2:	44cc                	lw	a1,12(s1)
    80003ee4:	00015717          	auipc	a4,0x15
    80003ee8:	17c70713          	addi	a4,a4,380 # 80019060 <log+0x30>
  for (i = 0; i < log.lh.n; i++) {
    80003eec:	4781                	li	a5,0
    if (log.lh.block[i] == b->blockno)   // log absorption
    80003eee:	4314                	lw	a3,0(a4)
    80003ef0:	04b68c63          	beq	a3,a1,80003f48 <log_write+0xb0>
  for (i = 0; i < log.lh.n; i++) {
    80003ef4:	2785                	addiw	a5,a5,1
    80003ef6:	0711                	addi	a4,a4,4
    80003ef8:	fef61be3          	bne	a2,a5,80003eee <log_write+0x56>
      break;
  }
  log.lh.block[i] = b->blockno;
    80003efc:	0621                	addi	a2,a2,8
    80003efe:	060a                	slli	a2,a2,0x2
    80003f00:	00015797          	auipc	a5,0x15
    80003f04:	13078793          	addi	a5,a5,304 # 80019030 <log>
    80003f08:	963e                	add	a2,a2,a5
    80003f0a:	44dc                	lw	a5,12(s1)
    80003f0c:	ca1c                	sw	a5,16(a2)
  if (i == log.lh.n) {  // Add new block to log?
    bpin(b);
    80003f0e:	8526                	mv	a0,s1
    80003f10:	fffff097          	auipc	ra,0xfffff
    80003f14:	b86080e7          	jalr	-1146(ra) # 80002a96 <bpin>
    log.lh.n++;
    80003f18:	00015717          	auipc	a4,0x15
    80003f1c:	11870713          	addi	a4,a4,280 # 80019030 <log>
    80003f20:	575c                	lw	a5,44(a4)
    80003f22:	2785                	addiw	a5,a5,1
    80003f24:	d75c                	sw	a5,44(a4)
    80003f26:	a835                	j	80003f62 <log_write+0xca>
    panic("too big a transaction");
    80003f28:	00005517          	auipc	a0,0x5
    80003f2c:	88050513          	addi	a0,a0,-1920 # 800087a8 <syscalls+0x2e8>
    80003f30:	00002097          	auipc	ra,0x2
    80003f34:	778080e7          	jalr	1912(ra) # 800066a8 <panic>
    panic("log_write outside of trans");
    80003f38:	00005517          	auipc	a0,0x5
    80003f3c:	88850513          	addi	a0,a0,-1912 # 800087c0 <syscalls+0x300>
    80003f40:	00002097          	auipc	ra,0x2
    80003f44:	768080e7          	jalr	1896(ra) # 800066a8 <panic>
  log.lh.block[i] = b->blockno;
    80003f48:	00878713          	addi	a4,a5,8
    80003f4c:	00271693          	slli	a3,a4,0x2
    80003f50:	00015717          	auipc	a4,0x15
    80003f54:	0e070713          	addi	a4,a4,224 # 80019030 <log>
    80003f58:	9736                	add	a4,a4,a3
    80003f5a:	44d4                	lw	a3,12(s1)
    80003f5c:	cb14                	sw	a3,16(a4)
  if (i == log.lh.n) {  // Add new block to log?
    80003f5e:	faf608e3          	beq	a2,a5,80003f0e <log_write+0x76>
  }
  release(&log.lock);
    80003f62:	00015517          	auipc	a0,0x15
    80003f66:	0ce50513          	addi	a0,a0,206 # 80019030 <log>
    80003f6a:	00003097          	auipc	ra,0x3
    80003f6e:	d3c080e7          	jalr	-708(ra) # 80006ca6 <release>
}
    80003f72:	60e2                	ld	ra,24(sp)
    80003f74:	6442                	ld	s0,16(sp)
    80003f76:	64a2                	ld	s1,8(sp)
    80003f78:	6902                	ld	s2,0(sp)
    80003f7a:	6105                	addi	sp,sp,32
    80003f7c:	8082                	ret

0000000080003f7e <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80003f7e:	1101                	addi	sp,sp,-32
    80003f80:	ec06                	sd	ra,24(sp)
    80003f82:	e822                	sd	s0,16(sp)
    80003f84:	e426                	sd	s1,8(sp)
    80003f86:	e04a                	sd	s2,0(sp)
    80003f88:	1000                	addi	s0,sp,32
    80003f8a:	84aa                	mv	s1,a0
    80003f8c:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80003f8e:	00005597          	auipc	a1,0x5
    80003f92:	85258593          	addi	a1,a1,-1966 # 800087e0 <syscalls+0x320>
    80003f96:	0521                	addi	a0,a0,8
    80003f98:	00003097          	auipc	ra,0x3
    80003f9c:	bca080e7          	jalr	-1078(ra) # 80006b62 <initlock>
  lk->name = name;
    80003fa0:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80003fa4:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80003fa8:	0204a423          	sw	zero,40(s1)
}
    80003fac:	60e2                	ld	ra,24(sp)
    80003fae:	6442                	ld	s0,16(sp)
    80003fb0:	64a2                	ld	s1,8(sp)
    80003fb2:	6902                	ld	s2,0(sp)
    80003fb4:	6105                	addi	sp,sp,32
    80003fb6:	8082                	ret

0000000080003fb8 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80003fb8:	1101                	addi	sp,sp,-32
    80003fba:	ec06                	sd	ra,24(sp)
    80003fbc:	e822                	sd	s0,16(sp)
    80003fbe:	e426                	sd	s1,8(sp)
    80003fc0:	e04a                	sd	s2,0(sp)
    80003fc2:	1000                	addi	s0,sp,32
    80003fc4:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80003fc6:	00850913          	addi	s2,a0,8
    80003fca:	854a                	mv	a0,s2
    80003fcc:	00003097          	auipc	ra,0x3
    80003fd0:	c26080e7          	jalr	-986(ra) # 80006bf2 <acquire>
  while (lk->locked) {
    80003fd4:	409c                	lw	a5,0(s1)
    80003fd6:	cb89                	beqz	a5,80003fe8 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80003fd8:	85ca                	mv	a1,s2
    80003fda:	8526                	mv	a0,s1
    80003fdc:	ffffe097          	auipc	ra,0xffffe
    80003fe0:	b4c080e7          	jalr	-1204(ra) # 80001b28 <sleep>
  while (lk->locked) {
    80003fe4:	409c                	lw	a5,0(s1)
    80003fe6:	fbed                	bnez	a5,80003fd8 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80003fe8:	4785                	li	a5,1
    80003fea:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80003fec:	ffffd097          	auipc	ra,0xffffd
    80003ff0:	480080e7          	jalr	1152(ra) # 8000146c <myproc>
    80003ff4:	591c                	lw	a5,48(a0)
    80003ff6:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80003ff8:	854a                	mv	a0,s2
    80003ffa:	00003097          	auipc	ra,0x3
    80003ffe:	cac080e7          	jalr	-852(ra) # 80006ca6 <release>
}
    80004002:	60e2                	ld	ra,24(sp)
    80004004:	6442                	ld	s0,16(sp)
    80004006:	64a2                	ld	s1,8(sp)
    80004008:	6902                	ld	s2,0(sp)
    8000400a:	6105                	addi	sp,sp,32
    8000400c:	8082                	ret

000000008000400e <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    8000400e:	1101                	addi	sp,sp,-32
    80004010:	ec06                	sd	ra,24(sp)
    80004012:	e822                	sd	s0,16(sp)
    80004014:	e426                	sd	s1,8(sp)
    80004016:	e04a                	sd	s2,0(sp)
    80004018:	1000                	addi	s0,sp,32
    8000401a:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    8000401c:	00850913          	addi	s2,a0,8
    80004020:	854a                	mv	a0,s2
    80004022:	00003097          	auipc	ra,0x3
    80004026:	bd0080e7          	jalr	-1072(ra) # 80006bf2 <acquire>
  lk->locked = 0;
    8000402a:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    8000402e:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80004032:	8526                	mv	a0,s1
    80004034:	ffffe097          	auipc	ra,0xffffe
    80004038:	c80080e7          	jalr	-896(ra) # 80001cb4 <wakeup>
  release(&lk->lk);
    8000403c:	854a                	mv	a0,s2
    8000403e:	00003097          	auipc	ra,0x3
    80004042:	c68080e7          	jalr	-920(ra) # 80006ca6 <release>
}
    80004046:	60e2                	ld	ra,24(sp)
    80004048:	6442                	ld	s0,16(sp)
    8000404a:	64a2                	ld	s1,8(sp)
    8000404c:	6902                	ld	s2,0(sp)
    8000404e:	6105                	addi	sp,sp,32
    80004050:	8082                	ret

0000000080004052 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80004052:	7179                	addi	sp,sp,-48
    80004054:	f406                	sd	ra,40(sp)
    80004056:	f022                	sd	s0,32(sp)
    80004058:	ec26                	sd	s1,24(sp)
    8000405a:	e84a                	sd	s2,16(sp)
    8000405c:	e44e                	sd	s3,8(sp)
    8000405e:	1800                	addi	s0,sp,48
    80004060:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80004062:	00850913          	addi	s2,a0,8
    80004066:	854a                	mv	a0,s2
    80004068:	00003097          	auipc	ra,0x3
    8000406c:	b8a080e7          	jalr	-1142(ra) # 80006bf2 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80004070:	409c                	lw	a5,0(s1)
    80004072:	ef99                	bnez	a5,80004090 <holdingsleep+0x3e>
    80004074:	4481                	li	s1,0
  release(&lk->lk);
    80004076:	854a                	mv	a0,s2
    80004078:	00003097          	auipc	ra,0x3
    8000407c:	c2e080e7          	jalr	-978(ra) # 80006ca6 <release>
  return r;
}
    80004080:	8526                	mv	a0,s1
    80004082:	70a2                	ld	ra,40(sp)
    80004084:	7402                	ld	s0,32(sp)
    80004086:	64e2                	ld	s1,24(sp)
    80004088:	6942                	ld	s2,16(sp)
    8000408a:	69a2                	ld	s3,8(sp)
    8000408c:	6145                	addi	sp,sp,48
    8000408e:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80004090:	0284a983          	lw	s3,40(s1)
    80004094:	ffffd097          	auipc	ra,0xffffd
    80004098:	3d8080e7          	jalr	984(ra) # 8000146c <myproc>
    8000409c:	5904                	lw	s1,48(a0)
    8000409e:	413484b3          	sub	s1,s1,s3
    800040a2:	0014b493          	seqz	s1,s1
    800040a6:	bfc1                	j	80004076 <holdingsleep+0x24>

00000000800040a8 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    800040a8:	1141                	addi	sp,sp,-16
    800040aa:	e406                	sd	ra,8(sp)
    800040ac:	e022                	sd	s0,0(sp)
    800040ae:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    800040b0:	00004597          	auipc	a1,0x4
    800040b4:	74058593          	addi	a1,a1,1856 # 800087f0 <syscalls+0x330>
    800040b8:	00015517          	auipc	a0,0x15
    800040bc:	0c050513          	addi	a0,a0,192 # 80019178 <ftable>
    800040c0:	00003097          	auipc	ra,0x3
    800040c4:	aa2080e7          	jalr	-1374(ra) # 80006b62 <initlock>
}
    800040c8:	60a2                	ld	ra,8(sp)
    800040ca:	6402                	ld	s0,0(sp)
    800040cc:	0141                	addi	sp,sp,16
    800040ce:	8082                	ret

00000000800040d0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    800040d0:	1101                	addi	sp,sp,-32
    800040d2:	ec06                	sd	ra,24(sp)
    800040d4:	e822                	sd	s0,16(sp)
    800040d6:	e426                	sd	s1,8(sp)
    800040d8:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    800040da:	00015517          	auipc	a0,0x15
    800040de:	09e50513          	addi	a0,a0,158 # 80019178 <ftable>
    800040e2:	00003097          	auipc	ra,0x3
    800040e6:	b10080e7          	jalr	-1264(ra) # 80006bf2 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800040ea:	00015497          	auipc	s1,0x15
    800040ee:	0a648493          	addi	s1,s1,166 # 80019190 <ftable+0x18>
    800040f2:	00016717          	auipc	a4,0x16
    800040f6:	03e70713          	addi	a4,a4,62 # 8001a130 <ftable+0xfb8>
    if(f->ref == 0){
    800040fa:	40dc                	lw	a5,4(s1)
    800040fc:	cf99                	beqz	a5,8000411a <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800040fe:	02848493          	addi	s1,s1,40
    80004102:	fee49ce3          	bne	s1,a4,800040fa <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80004106:	00015517          	auipc	a0,0x15
    8000410a:	07250513          	addi	a0,a0,114 # 80019178 <ftable>
    8000410e:	00003097          	auipc	ra,0x3
    80004112:	b98080e7          	jalr	-1128(ra) # 80006ca6 <release>
  return 0;
    80004116:	4481                	li	s1,0
    80004118:	a819                	j	8000412e <filealloc+0x5e>
      f->ref = 1;
    8000411a:	4785                	li	a5,1
    8000411c:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    8000411e:	00015517          	auipc	a0,0x15
    80004122:	05a50513          	addi	a0,a0,90 # 80019178 <ftable>
    80004126:	00003097          	auipc	ra,0x3
    8000412a:	b80080e7          	jalr	-1152(ra) # 80006ca6 <release>
}
    8000412e:	8526                	mv	a0,s1
    80004130:	60e2                	ld	ra,24(sp)
    80004132:	6442                	ld	s0,16(sp)
    80004134:	64a2                	ld	s1,8(sp)
    80004136:	6105                	addi	sp,sp,32
    80004138:	8082                	ret

000000008000413a <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    8000413a:	1101                	addi	sp,sp,-32
    8000413c:	ec06                	sd	ra,24(sp)
    8000413e:	e822                	sd	s0,16(sp)
    80004140:	e426                	sd	s1,8(sp)
    80004142:	1000                	addi	s0,sp,32
    80004144:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80004146:	00015517          	auipc	a0,0x15
    8000414a:	03250513          	addi	a0,a0,50 # 80019178 <ftable>
    8000414e:	00003097          	auipc	ra,0x3
    80004152:	aa4080e7          	jalr	-1372(ra) # 80006bf2 <acquire>
  if(f->ref < 1)
    80004156:	40dc                	lw	a5,4(s1)
    80004158:	02f05263          	blez	a5,8000417c <filedup+0x42>
    panic("filedup");
  f->ref++;
    8000415c:	2785                	addiw	a5,a5,1
    8000415e:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80004160:	00015517          	auipc	a0,0x15
    80004164:	01850513          	addi	a0,a0,24 # 80019178 <ftable>
    80004168:	00003097          	auipc	ra,0x3
    8000416c:	b3e080e7          	jalr	-1218(ra) # 80006ca6 <release>
  return f;
}
    80004170:	8526                	mv	a0,s1
    80004172:	60e2                	ld	ra,24(sp)
    80004174:	6442                	ld	s0,16(sp)
    80004176:	64a2                	ld	s1,8(sp)
    80004178:	6105                	addi	sp,sp,32
    8000417a:	8082                	ret
    panic("filedup");
    8000417c:	00004517          	auipc	a0,0x4
    80004180:	67c50513          	addi	a0,a0,1660 # 800087f8 <syscalls+0x338>
    80004184:	00002097          	auipc	ra,0x2
    80004188:	524080e7          	jalr	1316(ra) # 800066a8 <panic>

000000008000418c <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    8000418c:	7139                	addi	sp,sp,-64
    8000418e:	fc06                	sd	ra,56(sp)
    80004190:	f822                	sd	s0,48(sp)
    80004192:	f426                	sd	s1,40(sp)
    80004194:	f04a                	sd	s2,32(sp)
    80004196:	ec4e                	sd	s3,24(sp)
    80004198:	e852                	sd	s4,16(sp)
    8000419a:	e456                	sd	s5,8(sp)
    8000419c:	0080                	addi	s0,sp,64
    8000419e:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    800041a0:	00015517          	auipc	a0,0x15
    800041a4:	fd850513          	addi	a0,a0,-40 # 80019178 <ftable>
    800041a8:	00003097          	auipc	ra,0x3
    800041ac:	a4a080e7          	jalr	-1462(ra) # 80006bf2 <acquire>
  if(f->ref < 1)
    800041b0:	40dc                	lw	a5,4(s1)
    800041b2:	06f05163          	blez	a5,80004214 <fileclose+0x88>
    panic("fileclose");
  if(--f->ref > 0){
    800041b6:	37fd                	addiw	a5,a5,-1
    800041b8:	0007871b          	sext.w	a4,a5
    800041bc:	c0dc                	sw	a5,4(s1)
    800041be:	06e04363          	bgtz	a4,80004224 <fileclose+0x98>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    800041c2:	0004a903          	lw	s2,0(s1)
    800041c6:	0094ca83          	lbu	s5,9(s1)
    800041ca:	0104ba03          	ld	s4,16(s1)
    800041ce:	0184b983          	ld	s3,24(s1)
  f->ref = 0;
    800041d2:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    800041d6:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    800041da:	00015517          	auipc	a0,0x15
    800041de:	f9e50513          	addi	a0,a0,-98 # 80019178 <ftable>
    800041e2:	00003097          	auipc	ra,0x3
    800041e6:	ac4080e7          	jalr	-1340(ra) # 80006ca6 <release>

  if(ff.type == FD_PIPE){
    800041ea:	4785                	li	a5,1
    800041ec:	04f90d63          	beq	s2,a5,80004246 <fileclose+0xba>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    800041f0:	3979                	addiw	s2,s2,-2
    800041f2:	4785                	li	a5,1
    800041f4:	0527e063          	bltu	a5,s2,80004234 <fileclose+0xa8>
    begin_op();
    800041f8:	00000097          	auipc	ra,0x0
    800041fc:	ac8080e7          	jalr	-1336(ra) # 80003cc0 <begin_op>
    iput(ff.ip);
    80004200:	854e                	mv	a0,s3
    80004202:	fffff097          	auipc	ra,0xfffff
    80004206:	11e080e7          	jalr	286(ra) # 80003320 <iput>
    end_op();
    8000420a:	00000097          	auipc	ra,0x0
    8000420e:	b36080e7          	jalr	-1226(ra) # 80003d40 <end_op>
    80004212:	a00d                	j	80004234 <fileclose+0xa8>
    panic("fileclose");
    80004214:	00004517          	auipc	a0,0x4
    80004218:	5ec50513          	addi	a0,a0,1516 # 80008800 <syscalls+0x340>
    8000421c:	00002097          	auipc	ra,0x2
    80004220:	48c080e7          	jalr	1164(ra) # 800066a8 <panic>
    release(&ftable.lock);
    80004224:	00015517          	auipc	a0,0x15
    80004228:	f5450513          	addi	a0,a0,-172 # 80019178 <ftable>
    8000422c:	00003097          	auipc	ra,0x3
    80004230:	a7a080e7          	jalr	-1414(ra) # 80006ca6 <release>
  }
}
    80004234:	70e2                	ld	ra,56(sp)
    80004236:	7442                	ld	s0,48(sp)
    80004238:	74a2                	ld	s1,40(sp)
    8000423a:	7902                	ld	s2,32(sp)
    8000423c:	69e2                	ld	s3,24(sp)
    8000423e:	6a42                	ld	s4,16(sp)
    80004240:	6aa2                	ld	s5,8(sp)
    80004242:	6121                	addi	sp,sp,64
    80004244:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80004246:	85d6                	mv	a1,s5
    80004248:	8552                	mv	a0,s4
    8000424a:	00000097          	auipc	ra,0x0
    8000424e:	34c080e7          	jalr	844(ra) # 80004596 <pipeclose>
    80004252:	b7cd                	j	80004234 <fileclose+0xa8>

0000000080004254 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80004254:	715d                	addi	sp,sp,-80
    80004256:	e486                	sd	ra,72(sp)
    80004258:	e0a2                	sd	s0,64(sp)
    8000425a:	fc26                	sd	s1,56(sp)
    8000425c:	f84a                	sd	s2,48(sp)
    8000425e:	f44e                	sd	s3,40(sp)
    80004260:	0880                	addi	s0,sp,80
    80004262:	84aa                	mv	s1,a0
    80004264:	89ae                	mv	s3,a1
  struct proc *p = myproc();
    80004266:	ffffd097          	auipc	ra,0xffffd
    8000426a:	206080e7          	jalr	518(ra) # 8000146c <myproc>
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    8000426e:	409c                	lw	a5,0(s1)
    80004270:	37f9                	addiw	a5,a5,-2
    80004272:	4705                	li	a4,1
    80004274:	04f76763          	bltu	a4,a5,800042c2 <filestat+0x6e>
    80004278:	892a                	mv	s2,a0
    ilock(f->ip);
    8000427a:	6c88                	ld	a0,24(s1)
    8000427c:	fffff097          	auipc	ra,0xfffff
    80004280:	eea080e7          	jalr	-278(ra) # 80003166 <ilock>
    stati(f->ip, &st);
    80004284:	fb840593          	addi	a1,s0,-72
    80004288:	6c88                	ld	a0,24(s1)
    8000428a:	fffff097          	auipc	ra,0xfffff
    8000428e:	166080e7          	jalr	358(ra) # 800033f0 <stati>
    iunlock(f->ip);
    80004292:	6c88                	ld	a0,24(s1)
    80004294:	fffff097          	auipc	ra,0xfffff
    80004298:	f94080e7          	jalr	-108(ra) # 80003228 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    8000429c:	46e1                	li	a3,24
    8000429e:	fb840613          	addi	a2,s0,-72
    800042a2:	85ce                	mv	a1,s3
    800042a4:	05093503          	ld	a0,80(s2)
    800042a8:	ffffd097          	auipc	ra,0xffffd
    800042ac:	880080e7          	jalr	-1920(ra) # 80000b28 <copyout>
    800042b0:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    800042b4:	60a6                	ld	ra,72(sp)
    800042b6:	6406                	ld	s0,64(sp)
    800042b8:	74e2                	ld	s1,56(sp)
    800042ba:	7942                	ld	s2,48(sp)
    800042bc:	79a2                	ld	s3,40(sp)
    800042be:	6161                	addi	sp,sp,80
    800042c0:	8082                	ret
  return -1;
    800042c2:	557d                	li	a0,-1
    800042c4:	bfc5                	j	800042b4 <filestat+0x60>

00000000800042c6 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    800042c6:	7179                	addi	sp,sp,-48
    800042c8:	f406                	sd	ra,40(sp)
    800042ca:	f022                	sd	s0,32(sp)
    800042cc:	ec26                	sd	s1,24(sp)
    800042ce:	e84a                	sd	s2,16(sp)
    800042d0:	e44e                	sd	s3,8(sp)
    800042d2:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    800042d4:	00854783          	lbu	a5,8(a0)
    800042d8:	c3d5                	beqz	a5,8000437c <fileread+0xb6>
    800042da:	84aa                	mv	s1,a0
    800042dc:	89ae                	mv	s3,a1
    800042de:	8932                	mv	s2,a2
    return -1;

  if(f->type == FD_PIPE){
    800042e0:	411c                	lw	a5,0(a0)
    800042e2:	4705                	li	a4,1
    800042e4:	04e78963          	beq	a5,a4,80004336 <fileread+0x70>
    r = piperead(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    800042e8:	470d                	li	a4,3
    800042ea:	04e78d63          	beq	a5,a4,80004344 <fileread+0x7e>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
      return -1;
    r = devsw[f->major].read(1, addr, n);
  } else if(f->type == FD_INODE){
    800042ee:	4709                	li	a4,2
    800042f0:	06e79e63          	bne	a5,a4,8000436c <fileread+0xa6>
    ilock(f->ip);
    800042f4:	6d08                	ld	a0,24(a0)
    800042f6:	fffff097          	auipc	ra,0xfffff
    800042fa:	e70080e7          	jalr	-400(ra) # 80003166 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    800042fe:	874a                	mv	a4,s2
    80004300:	5094                	lw	a3,32(s1)
    80004302:	864e                	mv	a2,s3
    80004304:	4585                	li	a1,1
    80004306:	6c88                	ld	a0,24(s1)
    80004308:	fffff097          	auipc	ra,0xfffff
    8000430c:	112080e7          	jalr	274(ra) # 8000341a <readi>
    80004310:	892a                	mv	s2,a0
    80004312:	00a05563          	blez	a0,8000431c <fileread+0x56>
      f->off += r;
    80004316:	509c                	lw	a5,32(s1)
    80004318:	9fa9                	addw	a5,a5,a0
    8000431a:	d09c                	sw	a5,32(s1)
    iunlock(f->ip);
    8000431c:	6c88                	ld	a0,24(s1)
    8000431e:	fffff097          	auipc	ra,0xfffff
    80004322:	f0a080e7          	jalr	-246(ra) # 80003228 <iunlock>
  } else {
    panic("fileread");
  }

  return r;
}
    80004326:	854a                	mv	a0,s2
    80004328:	70a2                	ld	ra,40(sp)
    8000432a:	7402                	ld	s0,32(sp)
    8000432c:	64e2                	ld	s1,24(sp)
    8000432e:	6942                	ld	s2,16(sp)
    80004330:	69a2                	ld	s3,8(sp)
    80004332:	6145                	addi	sp,sp,48
    80004334:	8082                	ret
    r = piperead(f->pipe, addr, n);
    80004336:	6908                	ld	a0,16(a0)
    80004338:	00000097          	auipc	ra,0x0
    8000433c:	3c8080e7          	jalr	968(ra) # 80004700 <piperead>
    80004340:	892a                	mv	s2,a0
    80004342:	b7d5                	j	80004326 <fileread+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80004344:	02451783          	lh	a5,36(a0)
    80004348:	03079693          	slli	a3,a5,0x30
    8000434c:	92c1                	srli	a3,a3,0x30
    8000434e:	4725                	li	a4,9
    80004350:	02d76863          	bltu	a4,a3,80004380 <fileread+0xba>
    80004354:	0792                	slli	a5,a5,0x4
    80004356:	00015717          	auipc	a4,0x15
    8000435a:	d8270713          	addi	a4,a4,-638 # 800190d8 <devsw>
    8000435e:	97ba                	add	a5,a5,a4
    80004360:	639c                	ld	a5,0(a5)
    80004362:	c38d                	beqz	a5,80004384 <fileread+0xbe>
    r = devsw[f->major].read(1, addr, n);
    80004364:	4505                	li	a0,1
    80004366:	9782                	jalr	a5
    80004368:	892a                	mv	s2,a0
    8000436a:	bf75                	j	80004326 <fileread+0x60>
    panic("fileread");
    8000436c:	00004517          	auipc	a0,0x4
    80004370:	4a450513          	addi	a0,a0,1188 # 80008810 <syscalls+0x350>
    80004374:	00002097          	auipc	ra,0x2
    80004378:	334080e7          	jalr	820(ra) # 800066a8 <panic>
    return -1;
    8000437c:	597d                	li	s2,-1
    8000437e:	b765                	j	80004326 <fileread+0x60>
      return -1;
    80004380:	597d                	li	s2,-1
    80004382:	b755                	j	80004326 <fileread+0x60>
    80004384:	597d                	li	s2,-1
    80004386:	b745                	j	80004326 <fileread+0x60>

0000000080004388 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80004388:	715d                	addi	sp,sp,-80
    8000438a:	e486                	sd	ra,72(sp)
    8000438c:	e0a2                	sd	s0,64(sp)
    8000438e:	fc26                	sd	s1,56(sp)
    80004390:	f84a                	sd	s2,48(sp)
    80004392:	f44e                	sd	s3,40(sp)
    80004394:	f052                	sd	s4,32(sp)
    80004396:	ec56                	sd	s5,24(sp)
    80004398:	e85a                	sd	s6,16(sp)
    8000439a:	e45e                	sd	s7,8(sp)
    8000439c:	e062                	sd	s8,0(sp)
    8000439e:	0880                	addi	s0,sp,80
  int r, ret = 0;

  if(f->writable == 0)
    800043a0:	00954783          	lbu	a5,9(a0)
    800043a4:	10078663          	beqz	a5,800044b0 <filewrite+0x128>
    800043a8:	892a                	mv	s2,a0
    800043aa:	8aae                	mv	s5,a1
    800043ac:	8a32                	mv	s4,a2
    return -1;

  if(f->type == FD_PIPE){
    800043ae:	411c                	lw	a5,0(a0)
    800043b0:	4705                	li	a4,1
    800043b2:	02e78263          	beq	a5,a4,800043d6 <filewrite+0x4e>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    800043b6:	470d                	li	a4,3
    800043b8:	02e78663          	beq	a5,a4,800043e4 <filewrite+0x5c>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_INODE){
    800043bc:	4709                	li	a4,2
    800043be:	0ee79163          	bne	a5,a4,800044a0 <filewrite+0x118>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    int i = 0;
    while(i < n){
    800043c2:	0ac05d63          	blez	a2,8000447c <filewrite+0xf4>
    int i = 0;
    800043c6:	4981                	li	s3,0
    800043c8:	6b05                	lui	s6,0x1
    800043ca:	c00b0b13          	addi	s6,s6,-1024 # c00 <_entry-0x7ffff400>
    800043ce:	6b85                	lui	s7,0x1
    800043d0:	c00b8b9b          	addiw	s7,s7,-1024
    800043d4:	a861                	j	8000446c <filewrite+0xe4>
    ret = pipewrite(f->pipe, addr, n);
    800043d6:	6908                	ld	a0,16(a0)
    800043d8:	00000097          	auipc	ra,0x0
    800043dc:	22e080e7          	jalr	558(ra) # 80004606 <pipewrite>
    800043e0:	8a2a                	mv	s4,a0
    800043e2:	a045                	j	80004482 <filewrite+0xfa>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    800043e4:	02451783          	lh	a5,36(a0)
    800043e8:	03079693          	slli	a3,a5,0x30
    800043ec:	92c1                	srli	a3,a3,0x30
    800043ee:	4725                	li	a4,9
    800043f0:	0cd76263          	bltu	a4,a3,800044b4 <filewrite+0x12c>
    800043f4:	0792                	slli	a5,a5,0x4
    800043f6:	00015717          	auipc	a4,0x15
    800043fa:	ce270713          	addi	a4,a4,-798 # 800190d8 <devsw>
    800043fe:	97ba                	add	a5,a5,a4
    80004400:	679c                	ld	a5,8(a5)
    80004402:	cbdd                	beqz	a5,800044b8 <filewrite+0x130>
    ret = devsw[f->major].write(1, addr, n);
    80004404:	4505                	li	a0,1
    80004406:	9782                	jalr	a5
    80004408:	8a2a                	mv	s4,a0
    8000440a:	a8a5                	j	80004482 <filewrite+0xfa>
    8000440c:	00048c1b          	sext.w	s8,s1
      int n1 = n - i;
      if(n1 > max)
        n1 = max;

      begin_op();
    80004410:	00000097          	auipc	ra,0x0
    80004414:	8b0080e7          	jalr	-1872(ra) # 80003cc0 <begin_op>
      ilock(f->ip);
    80004418:	01893503          	ld	a0,24(s2)
    8000441c:	fffff097          	auipc	ra,0xfffff
    80004420:	d4a080e7          	jalr	-694(ra) # 80003166 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80004424:	8762                	mv	a4,s8
    80004426:	02092683          	lw	a3,32(s2)
    8000442a:	01598633          	add	a2,s3,s5
    8000442e:	4585                	li	a1,1
    80004430:	01893503          	ld	a0,24(s2)
    80004434:	fffff097          	auipc	ra,0xfffff
    80004438:	0de080e7          	jalr	222(ra) # 80003512 <writei>
    8000443c:	84aa                	mv	s1,a0
    8000443e:	00a05763          	blez	a0,8000444c <filewrite+0xc4>
        f->off += r;
    80004442:	02092783          	lw	a5,32(s2)
    80004446:	9fa9                	addw	a5,a5,a0
    80004448:	02f92023          	sw	a5,32(s2)
      iunlock(f->ip);
    8000444c:	01893503          	ld	a0,24(s2)
    80004450:	fffff097          	auipc	ra,0xfffff
    80004454:	dd8080e7          	jalr	-552(ra) # 80003228 <iunlock>
      end_op();
    80004458:	00000097          	auipc	ra,0x0
    8000445c:	8e8080e7          	jalr	-1816(ra) # 80003d40 <end_op>

      if(r != n1){
    80004460:	009c1f63          	bne	s8,s1,8000447e <filewrite+0xf6>
        // error from writei
        break;
      }
      i += r;
    80004464:	013489bb          	addw	s3,s1,s3
    while(i < n){
    80004468:	0149db63          	bge	s3,s4,8000447e <filewrite+0xf6>
      int n1 = n - i;
    8000446c:	413a07bb          	subw	a5,s4,s3
      if(n1 > max)
    80004470:	84be                	mv	s1,a5
    80004472:	2781                	sext.w	a5,a5
    80004474:	f8fb5ce3          	bge	s6,a5,8000440c <filewrite+0x84>
    80004478:	84de                	mv	s1,s7
    8000447a:	bf49                	j	8000440c <filewrite+0x84>
    int i = 0;
    8000447c:	4981                	li	s3,0
    }
    ret = (i == n ? n : -1);
    8000447e:	013a1f63          	bne	s4,s3,8000449c <filewrite+0x114>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80004482:	8552                	mv	a0,s4
    80004484:	60a6                	ld	ra,72(sp)
    80004486:	6406                	ld	s0,64(sp)
    80004488:	74e2                	ld	s1,56(sp)
    8000448a:	7942                	ld	s2,48(sp)
    8000448c:	79a2                	ld	s3,40(sp)
    8000448e:	7a02                	ld	s4,32(sp)
    80004490:	6ae2                	ld	s5,24(sp)
    80004492:	6b42                	ld	s6,16(sp)
    80004494:	6ba2                	ld	s7,8(sp)
    80004496:	6c02                	ld	s8,0(sp)
    80004498:	6161                	addi	sp,sp,80
    8000449a:	8082                	ret
    ret = (i == n ? n : -1);
    8000449c:	5a7d                	li	s4,-1
    8000449e:	b7d5                	j	80004482 <filewrite+0xfa>
    panic("filewrite");
    800044a0:	00004517          	auipc	a0,0x4
    800044a4:	38050513          	addi	a0,a0,896 # 80008820 <syscalls+0x360>
    800044a8:	00002097          	auipc	ra,0x2
    800044ac:	200080e7          	jalr	512(ra) # 800066a8 <panic>
    return -1;
    800044b0:	5a7d                	li	s4,-1
    800044b2:	bfc1                	j	80004482 <filewrite+0xfa>
      return -1;
    800044b4:	5a7d                	li	s4,-1
    800044b6:	b7f1                	j	80004482 <filewrite+0xfa>
    800044b8:	5a7d                	li	s4,-1
    800044ba:	b7e1                	j	80004482 <filewrite+0xfa>

00000000800044bc <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    800044bc:	7179                	addi	sp,sp,-48
    800044be:	f406                	sd	ra,40(sp)
    800044c0:	f022                	sd	s0,32(sp)
    800044c2:	ec26                	sd	s1,24(sp)
    800044c4:	e84a                	sd	s2,16(sp)
    800044c6:	e44e                	sd	s3,8(sp)
    800044c8:	e052                	sd	s4,0(sp)
    800044ca:	1800                	addi	s0,sp,48
    800044cc:	84aa                	mv	s1,a0
    800044ce:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    800044d0:	0005b023          	sd	zero,0(a1)
    800044d4:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    800044d8:	00000097          	auipc	ra,0x0
    800044dc:	bf8080e7          	jalr	-1032(ra) # 800040d0 <filealloc>
    800044e0:	e088                	sd	a0,0(s1)
    800044e2:	c551                	beqz	a0,8000456e <pipealloc+0xb2>
    800044e4:	00000097          	auipc	ra,0x0
    800044e8:	bec080e7          	jalr	-1044(ra) # 800040d0 <filealloc>
    800044ec:	00aa3023          	sd	a0,0(s4)
    800044f0:	c92d                	beqz	a0,80004562 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    800044f2:	ffffc097          	auipc	ra,0xffffc
    800044f6:	c26080e7          	jalr	-986(ra) # 80000118 <kalloc>
    800044fa:	892a                	mv	s2,a0
    800044fc:	c125                	beqz	a0,8000455c <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    800044fe:	4985                	li	s3,1
    80004500:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80004504:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    80004508:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    8000450c:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80004510:	00004597          	auipc	a1,0x4
    80004514:	32058593          	addi	a1,a1,800 # 80008830 <syscalls+0x370>
    80004518:	00002097          	auipc	ra,0x2
    8000451c:	64a080e7          	jalr	1610(ra) # 80006b62 <initlock>
  (*f0)->type = FD_PIPE;
    80004520:	609c                	ld	a5,0(s1)
    80004522:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80004526:	609c                	ld	a5,0(s1)
    80004528:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    8000452c:	609c                	ld	a5,0(s1)
    8000452e:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80004532:	609c                	ld	a5,0(s1)
    80004534:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80004538:	000a3783          	ld	a5,0(s4)
    8000453c:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80004540:	000a3783          	ld	a5,0(s4)
    80004544:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80004548:	000a3783          	ld	a5,0(s4)
    8000454c:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80004550:	000a3783          	ld	a5,0(s4)
    80004554:	0127b823          	sd	s2,16(a5)
  return 0;
    80004558:	4501                	li	a0,0
    8000455a:	a025                	j	80004582 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    8000455c:	6088                	ld	a0,0(s1)
    8000455e:	e501                	bnez	a0,80004566 <pipealloc+0xaa>
    80004560:	a039                	j	8000456e <pipealloc+0xb2>
    80004562:	6088                	ld	a0,0(s1)
    80004564:	c51d                	beqz	a0,80004592 <pipealloc+0xd6>
    fileclose(*f0);
    80004566:	00000097          	auipc	ra,0x0
    8000456a:	c26080e7          	jalr	-986(ra) # 8000418c <fileclose>
  if(*f1)
    8000456e:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    80004572:	557d                	li	a0,-1
  if(*f1)
    80004574:	c799                	beqz	a5,80004582 <pipealloc+0xc6>
    fileclose(*f1);
    80004576:	853e                	mv	a0,a5
    80004578:	00000097          	auipc	ra,0x0
    8000457c:	c14080e7          	jalr	-1004(ra) # 8000418c <fileclose>
  return -1;
    80004580:	557d                	li	a0,-1
}
    80004582:	70a2                	ld	ra,40(sp)
    80004584:	7402                	ld	s0,32(sp)
    80004586:	64e2                	ld	s1,24(sp)
    80004588:	6942                	ld	s2,16(sp)
    8000458a:	69a2                	ld	s3,8(sp)
    8000458c:	6a02                	ld	s4,0(sp)
    8000458e:	6145                	addi	sp,sp,48
    80004590:	8082                	ret
  return -1;
    80004592:	557d                	li	a0,-1
    80004594:	b7fd                	j	80004582 <pipealloc+0xc6>

0000000080004596 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80004596:	1101                	addi	sp,sp,-32
    80004598:	ec06                	sd	ra,24(sp)
    8000459a:	e822                	sd	s0,16(sp)
    8000459c:	e426                	sd	s1,8(sp)
    8000459e:	e04a                	sd	s2,0(sp)
    800045a0:	1000                	addi	s0,sp,32
    800045a2:	84aa                	mv	s1,a0
    800045a4:	892e                	mv	s2,a1
  acquire(&pi->lock);
    800045a6:	00002097          	auipc	ra,0x2
    800045aa:	64c080e7          	jalr	1612(ra) # 80006bf2 <acquire>
  if(writable){
    800045ae:	02090d63          	beqz	s2,800045e8 <pipeclose+0x52>
    pi->writeopen = 0;
    800045b2:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    800045b6:	21848513          	addi	a0,s1,536
    800045ba:	ffffd097          	auipc	ra,0xffffd
    800045be:	6fa080e7          	jalr	1786(ra) # 80001cb4 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    800045c2:	2204b783          	ld	a5,544(s1)
    800045c6:	eb95                	bnez	a5,800045fa <pipeclose+0x64>
    release(&pi->lock);
    800045c8:	8526                	mv	a0,s1
    800045ca:	00002097          	auipc	ra,0x2
    800045ce:	6dc080e7          	jalr	1756(ra) # 80006ca6 <release>
    kfree((char*)pi);
    800045d2:	8526                	mv	a0,s1
    800045d4:	ffffc097          	auipc	ra,0xffffc
    800045d8:	a48080e7          	jalr	-1464(ra) # 8000001c <kfree>
  } else
    release(&pi->lock);
}
    800045dc:	60e2                	ld	ra,24(sp)
    800045de:	6442                	ld	s0,16(sp)
    800045e0:	64a2                	ld	s1,8(sp)
    800045e2:	6902                	ld	s2,0(sp)
    800045e4:	6105                	addi	sp,sp,32
    800045e6:	8082                	ret
    pi->readopen = 0;
    800045e8:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    800045ec:	21c48513          	addi	a0,s1,540
    800045f0:	ffffd097          	auipc	ra,0xffffd
    800045f4:	6c4080e7          	jalr	1732(ra) # 80001cb4 <wakeup>
    800045f8:	b7e9                	j	800045c2 <pipeclose+0x2c>
    release(&pi->lock);
    800045fa:	8526                	mv	a0,s1
    800045fc:	00002097          	auipc	ra,0x2
    80004600:	6aa080e7          	jalr	1706(ra) # 80006ca6 <release>
}
    80004604:	bfe1                	j	800045dc <pipeclose+0x46>

0000000080004606 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80004606:	7159                	addi	sp,sp,-112
    80004608:	f486                	sd	ra,104(sp)
    8000460a:	f0a2                	sd	s0,96(sp)
    8000460c:	eca6                	sd	s1,88(sp)
    8000460e:	e8ca                	sd	s2,80(sp)
    80004610:	e4ce                	sd	s3,72(sp)
    80004612:	e0d2                	sd	s4,64(sp)
    80004614:	fc56                	sd	s5,56(sp)
    80004616:	f85a                	sd	s6,48(sp)
    80004618:	f45e                	sd	s7,40(sp)
    8000461a:	f062                	sd	s8,32(sp)
    8000461c:	ec66                	sd	s9,24(sp)
    8000461e:	1880                	addi	s0,sp,112
    80004620:	84aa                	mv	s1,a0
    80004622:	8aae                	mv	s5,a1
    80004624:	8a32                	mv	s4,a2
  int i = 0;
  struct proc *pr = myproc();
    80004626:	ffffd097          	auipc	ra,0xffffd
    8000462a:	e46080e7          	jalr	-442(ra) # 8000146c <myproc>
    8000462e:	89aa                	mv	s3,a0

  acquire(&pi->lock);
    80004630:	8526                	mv	a0,s1
    80004632:	00002097          	auipc	ra,0x2
    80004636:	5c0080e7          	jalr	1472(ra) # 80006bf2 <acquire>
  while(i < n){
    8000463a:	0d405163          	blez	s4,800046fc <pipewrite+0xf6>
    8000463e:	8ba6                	mv	s7,s1
  int i = 0;
    80004640:	4901                	li	s2,0
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
      wakeup(&pi->nread);
      sleep(&pi->nwrite, &pi->lock);
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80004642:	5b7d                	li	s6,-1
      wakeup(&pi->nread);
    80004644:	21848c93          	addi	s9,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80004648:	21c48c13          	addi	s8,s1,540
    8000464c:	a08d                	j	800046ae <pipewrite+0xa8>
      release(&pi->lock);
    8000464e:	8526                	mv	a0,s1
    80004650:	00002097          	auipc	ra,0x2
    80004654:	656080e7          	jalr	1622(ra) # 80006ca6 <release>
      return -1;
    80004658:	597d                	li	s2,-1
  }
  wakeup(&pi->nread);
  release(&pi->lock);

  return i;
}
    8000465a:	854a                	mv	a0,s2
    8000465c:	70a6                	ld	ra,104(sp)
    8000465e:	7406                	ld	s0,96(sp)
    80004660:	64e6                	ld	s1,88(sp)
    80004662:	6946                	ld	s2,80(sp)
    80004664:	69a6                	ld	s3,72(sp)
    80004666:	6a06                	ld	s4,64(sp)
    80004668:	7ae2                	ld	s5,56(sp)
    8000466a:	7b42                	ld	s6,48(sp)
    8000466c:	7ba2                	ld	s7,40(sp)
    8000466e:	7c02                	ld	s8,32(sp)
    80004670:	6ce2                	ld	s9,24(sp)
    80004672:	6165                	addi	sp,sp,112
    80004674:	8082                	ret
      wakeup(&pi->nread);
    80004676:	8566                	mv	a0,s9
    80004678:	ffffd097          	auipc	ra,0xffffd
    8000467c:	63c080e7          	jalr	1596(ra) # 80001cb4 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80004680:	85de                	mv	a1,s7
    80004682:	8562                	mv	a0,s8
    80004684:	ffffd097          	auipc	ra,0xffffd
    80004688:	4a4080e7          	jalr	1188(ra) # 80001b28 <sleep>
    8000468c:	a839                	j	800046aa <pipewrite+0xa4>
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8000468e:	21c4a783          	lw	a5,540(s1)
    80004692:	0017871b          	addiw	a4,a5,1
    80004696:	20e4ae23          	sw	a4,540(s1)
    8000469a:	1ff7f793          	andi	a5,a5,511
    8000469e:	97a6                	add	a5,a5,s1
    800046a0:	f9f44703          	lbu	a4,-97(s0)
    800046a4:	00e78c23          	sb	a4,24(a5)
      i++;
    800046a8:	2905                	addiw	s2,s2,1
  while(i < n){
    800046aa:	03495d63          	bge	s2,s4,800046e4 <pipewrite+0xde>
    if(pi->readopen == 0 || pr->killed){
    800046ae:	2204a783          	lw	a5,544(s1)
    800046b2:	dfd1                	beqz	a5,8000464e <pipewrite+0x48>
    800046b4:	0289a783          	lw	a5,40(s3)
    800046b8:	fbd9                	bnez	a5,8000464e <pipewrite+0x48>
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    800046ba:	2184a783          	lw	a5,536(s1)
    800046be:	21c4a703          	lw	a4,540(s1)
    800046c2:	2007879b          	addiw	a5,a5,512
    800046c6:	faf708e3          	beq	a4,a5,80004676 <pipewrite+0x70>
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    800046ca:	4685                	li	a3,1
    800046cc:	01590633          	add	a2,s2,s5
    800046d0:	f9f40593          	addi	a1,s0,-97
    800046d4:	0509b503          	ld	a0,80(s3)
    800046d8:	ffffc097          	auipc	ra,0xffffc
    800046dc:	4dc080e7          	jalr	1244(ra) # 80000bb4 <copyin>
    800046e0:	fb6517e3          	bne	a0,s6,8000468e <pipewrite+0x88>
  wakeup(&pi->nread);
    800046e4:	21848513          	addi	a0,s1,536
    800046e8:	ffffd097          	auipc	ra,0xffffd
    800046ec:	5cc080e7          	jalr	1484(ra) # 80001cb4 <wakeup>
  release(&pi->lock);
    800046f0:	8526                	mv	a0,s1
    800046f2:	00002097          	auipc	ra,0x2
    800046f6:	5b4080e7          	jalr	1460(ra) # 80006ca6 <release>
  return i;
    800046fa:	b785                	j	8000465a <pipewrite+0x54>
  int i = 0;
    800046fc:	4901                	li	s2,0
    800046fe:	b7dd                	j	800046e4 <pipewrite+0xde>

0000000080004700 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80004700:	715d                	addi	sp,sp,-80
    80004702:	e486                	sd	ra,72(sp)
    80004704:	e0a2                	sd	s0,64(sp)
    80004706:	fc26                	sd	s1,56(sp)
    80004708:	f84a                	sd	s2,48(sp)
    8000470a:	f44e                	sd	s3,40(sp)
    8000470c:	f052                	sd	s4,32(sp)
    8000470e:	ec56                	sd	s5,24(sp)
    80004710:	e85a                	sd	s6,16(sp)
    80004712:	0880                	addi	s0,sp,80
    80004714:	84aa                	mv	s1,a0
    80004716:	892e                	mv	s2,a1
    80004718:	8ab2                	mv	s5,a2
  int i;
  struct proc *pr = myproc();
    8000471a:	ffffd097          	auipc	ra,0xffffd
    8000471e:	d52080e7          	jalr	-686(ra) # 8000146c <myproc>
    80004722:	8a2a                	mv	s4,a0
  char ch;

  acquire(&pi->lock);
    80004724:	8b26                	mv	s6,s1
    80004726:	8526                	mv	a0,s1
    80004728:	00002097          	auipc	ra,0x2
    8000472c:	4ca080e7          	jalr	1226(ra) # 80006bf2 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80004730:	2184a703          	lw	a4,536(s1)
    80004734:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80004738:	21848993          	addi	s3,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000473c:	02f71463          	bne	a4,a5,80004764 <piperead+0x64>
    80004740:	2244a783          	lw	a5,548(s1)
    80004744:	c385                	beqz	a5,80004764 <piperead+0x64>
    if(pr->killed){
    80004746:	028a2783          	lw	a5,40(s4)
    8000474a:	ebc1                	bnez	a5,800047da <piperead+0xda>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8000474c:	85da                	mv	a1,s6
    8000474e:	854e                	mv	a0,s3
    80004750:	ffffd097          	auipc	ra,0xffffd
    80004754:	3d8080e7          	jalr	984(ra) # 80001b28 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80004758:	2184a703          	lw	a4,536(s1)
    8000475c:	21c4a783          	lw	a5,540(s1)
    80004760:	fef700e3          	beq	a4,a5,80004740 <piperead+0x40>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80004764:	09505263          	blez	s5,800047e8 <piperead+0xe8>
    80004768:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    8000476a:	5b7d                	li	s6,-1
    if(pi->nread == pi->nwrite)
    8000476c:	2184a783          	lw	a5,536(s1)
    80004770:	21c4a703          	lw	a4,540(s1)
    80004774:	02f70d63          	beq	a4,a5,800047ae <piperead+0xae>
    ch = pi->data[pi->nread++ % PIPESIZE];
    80004778:	0017871b          	addiw	a4,a5,1
    8000477c:	20e4ac23          	sw	a4,536(s1)
    80004780:	1ff7f793          	andi	a5,a5,511
    80004784:	97a6                	add	a5,a5,s1
    80004786:	0187c783          	lbu	a5,24(a5)
    8000478a:	faf40fa3          	sb	a5,-65(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    8000478e:	4685                	li	a3,1
    80004790:	fbf40613          	addi	a2,s0,-65
    80004794:	85ca                	mv	a1,s2
    80004796:	050a3503          	ld	a0,80(s4)
    8000479a:	ffffc097          	auipc	ra,0xffffc
    8000479e:	38e080e7          	jalr	910(ra) # 80000b28 <copyout>
    800047a2:	01650663          	beq	a0,s6,800047ae <piperead+0xae>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800047a6:	2985                	addiw	s3,s3,1
    800047a8:	0905                	addi	s2,s2,1
    800047aa:	fd3a91e3          	bne	s5,s3,8000476c <piperead+0x6c>
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800047ae:	21c48513          	addi	a0,s1,540
    800047b2:	ffffd097          	auipc	ra,0xffffd
    800047b6:	502080e7          	jalr	1282(ra) # 80001cb4 <wakeup>
  release(&pi->lock);
    800047ba:	8526                	mv	a0,s1
    800047bc:	00002097          	auipc	ra,0x2
    800047c0:	4ea080e7          	jalr	1258(ra) # 80006ca6 <release>
  return i;
}
    800047c4:	854e                	mv	a0,s3
    800047c6:	60a6                	ld	ra,72(sp)
    800047c8:	6406                	ld	s0,64(sp)
    800047ca:	74e2                	ld	s1,56(sp)
    800047cc:	7942                	ld	s2,48(sp)
    800047ce:	79a2                	ld	s3,40(sp)
    800047d0:	7a02                	ld	s4,32(sp)
    800047d2:	6ae2                	ld	s5,24(sp)
    800047d4:	6b42                	ld	s6,16(sp)
    800047d6:	6161                	addi	sp,sp,80
    800047d8:	8082                	ret
      release(&pi->lock);
    800047da:	8526                	mv	a0,s1
    800047dc:	00002097          	auipc	ra,0x2
    800047e0:	4ca080e7          	jalr	1226(ra) # 80006ca6 <release>
      return -1;
    800047e4:	59fd                	li	s3,-1
    800047e6:	bff9                	j	800047c4 <piperead+0xc4>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800047e8:	4981                	li	s3,0
    800047ea:	b7d1                	j	800047ae <piperead+0xae>

00000000800047ec <exec>:

static int loadseg(pde_t *pgdir, uint64 addr, struct inode *ip, uint offset, uint sz);

int
exec(char *path, char **argv)
{
    800047ec:	df010113          	addi	sp,sp,-528
    800047f0:	20113423          	sd	ra,520(sp)
    800047f4:	20813023          	sd	s0,512(sp)
    800047f8:	ffa6                	sd	s1,504(sp)
    800047fa:	fbca                	sd	s2,496(sp)
    800047fc:	f7ce                	sd	s3,488(sp)
    800047fe:	f3d2                	sd	s4,480(sp)
    80004800:	efd6                	sd	s5,472(sp)
    80004802:	ebda                	sd	s6,464(sp)
    80004804:	e7de                	sd	s7,456(sp)
    80004806:	e3e2                	sd	s8,448(sp)
    80004808:	ff66                	sd	s9,440(sp)
    8000480a:	fb6a                	sd	s10,432(sp)
    8000480c:	f76e                	sd	s11,424(sp)
    8000480e:	0c00                	addi	s0,sp,528
    80004810:	84aa                	mv	s1,a0
    80004812:	dea43c23          	sd	a0,-520(s0)
    80004816:	e0b43023          	sd	a1,-512(s0)
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  struct proc *p = myproc();
    8000481a:	ffffd097          	auipc	ra,0xffffd
    8000481e:	c52080e7          	jalr	-942(ra) # 8000146c <myproc>
    80004822:	892a                	mv	s2,a0

  begin_op();
    80004824:	fffff097          	auipc	ra,0xfffff
    80004828:	49c080e7          	jalr	1180(ra) # 80003cc0 <begin_op>

  if((ip = namei(path)) == 0){
    8000482c:	8526                	mv	a0,s1
    8000482e:	fffff097          	auipc	ra,0xfffff
    80004832:	0e4080e7          	jalr	228(ra) # 80003912 <namei>
    80004836:	c92d                	beqz	a0,800048a8 <exec+0xbc>
    80004838:	84aa                	mv	s1,a0
    end_op();
    return -1;
  }
  ilock(ip);
    8000483a:	fffff097          	auipc	ra,0xfffff
    8000483e:	92c080e7          	jalr	-1748(ra) # 80003166 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    80004842:	04000713          	li	a4,64
    80004846:	4681                	li	a3,0
    80004848:	e5040613          	addi	a2,s0,-432
    8000484c:	4581                	li	a1,0
    8000484e:	8526                	mv	a0,s1
    80004850:	fffff097          	auipc	ra,0xfffff
    80004854:	bca080e7          	jalr	-1078(ra) # 8000341a <readi>
    80004858:	04000793          	li	a5,64
    8000485c:	00f51a63          	bne	a0,a5,80004870 <exec+0x84>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80004860:	e5042703          	lw	a4,-432(s0)
    80004864:	464c47b7          	lui	a5,0x464c4
    80004868:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    8000486c:	04f70463          	beq	a4,a5,800048b4 <exec+0xc8>

 bad:
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(ip){
    iunlockput(ip);
    80004870:	8526                	mv	a0,s1
    80004872:	fffff097          	auipc	ra,0xfffff
    80004876:	b56080e7          	jalr	-1194(ra) # 800033c8 <iunlockput>
    end_op();
    8000487a:	fffff097          	auipc	ra,0xfffff
    8000487e:	4c6080e7          	jalr	1222(ra) # 80003d40 <end_op>
  }
  return -1;
    80004882:	557d                	li	a0,-1
}
    80004884:	20813083          	ld	ra,520(sp)
    80004888:	20013403          	ld	s0,512(sp)
    8000488c:	74fe                	ld	s1,504(sp)
    8000488e:	795e                	ld	s2,496(sp)
    80004890:	79be                	ld	s3,488(sp)
    80004892:	7a1e                	ld	s4,480(sp)
    80004894:	6afe                	ld	s5,472(sp)
    80004896:	6b5e                	ld	s6,464(sp)
    80004898:	6bbe                	ld	s7,456(sp)
    8000489a:	6c1e                	ld	s8,448(sp)
    8000489c:	7cfa                	ld	s9,440(sp)
    8000489e:	7d5a                	ld	s10,432(sp)
    800048a0:	7dba                	ld	s11,424(sp)
    800048a2:	21010113          	addi	sp,sp,528
    800048a6:	8082                	ret
    end_op();
    800048a8:	fffff097          	auipc	ra,0xfffff
    800048ac:	498080e7          	jalr	1176(ra) # 80003d40 <end_op>
    return -1;
    800048b0:	557d                	li	a0,-1
    800048b2:	bfc9                	j	80004884 <exec+0x98>
  if((pagetable = proc_pagetable(p)) == 0)
    800048b4:	854a                	mv	a0,s2
    800048b6:	ffffd097          	auipc	ra,0xffffd
    800048ba:	c7a080e7          	jalr	-902(ra) # 80001530 <proc_pagetable>
    800048be:	8baa                	mv	s7,a0
    800048c0:	d945                	beqz	a0,80004870 <exec+0x84>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800048c2:	e7042983          	lw	s3,-400(s0)
    800048c6:	e8845783          	lhu	a5,-376(s0)
    800048ca:	c7ad                	beqz	a5,80004934 <exec+0x148>
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    800048cc:	4901                	li	s2,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800048ce:	4b01                	li	s6,0
    if((ph.vaddr % PGSIZE) != 0)
    800048d0:	6c85                	lui	s9,0x1
    800048d2:	fffc8793          	addi	a5,s9,-1 # fff <_entry-0x7ffff001>
    800048d6:	def43823          	sd	a5,-528(s0)
    800048da:	a42d                	j	80004b04 <exec+0x318>
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    pa = walkaddr(pagetable, va + i);
    if(pa == 0)
      panic("loadseg: address should exist");
    800048dc:	00004517          	auipc	a0,0x4
    800048e0:	f5c50513          	addi	a0,a0,-164 # 80008838 <syscalls+0x378>
    800048e4:	00002097          	auipc	ra,0x2
    800048e8:	dc4080e7          	jalr	-572(ra) # 800066a8 <panic>
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    800048ec:	8756                	mv	a4,s5
    800048ee:	012d86bb          	addw	a3,s11,s2
    800048f2:	4581                	li	a1,0
    800048f4:	8526                	mv	a0,s1
    800048f6:	fffff097          	auipc	ra,0xfffff
    800048fa:	b24080e7          	jalr	-1244(ra) # 8000341a <readi>
    800048fe:	2501                	sext.w	a0,a0
    80004900:	1aaa9963          	bne	s5,a0,80004ab2 <exec+0x2c6>
  for(i = 0; i < sz; i += PGSIZE){
    80004904:	6785                	lui	a5,0x1
    80004906:	0127893b          	addw	s2,a5,s2
    8000490a:	77fd                	lui	a5,0xfffff
    8000490c:	01478a3b          	addw	s4,a5,s4
    80004910:	1f897163          	bgeu	s2,s8,80004af2 <exec+0x306>
    pa = walkaddr(pagetable, va + i);
    80004914:	02091593          	slli	a1,s2,0x20
    80004918:	9181                	srli	a1,a1,0x20
    8000491a:	95ea                	add	a1,a1,s10
    8000491c:	855e                	mv	a0,s7
    8000491e:	ffffc097          	auipc	ra,0xffffc
    80004922:	c0e080e7          	jalr	-1010(ra) # 8000052c <walkaddr>
    80004926:	862a                	mv	a2,a0
    if(pa == 0)
    80004928:	d955                	beqz	a0,800048dc <exec+0xf0>
      n = PGSIZE;
    8000492a:	8ae6                	mv	s5,s9
    if(sz - i < PGSIZE)
    8000492c:	fd9a70e3          	bgeu	s4,s9,800048ec <exec+0x100>
      n = sz - i;
    80004930:	8ad2                	mv	s5,s4
    80004932:	bf6d                	j	800048ec <exec+0x100>
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80004934:	4901                	li	s2,0
  iunlockput(ip);
    80004936:	8526                	mv	a0,s1
    80004938:	fffff097          	auipc	ra,0xfffff
    8000493c:	a90080e7          	jalr	-1392(ra) # 800033c8 <iunlockput>
  end_op();
    80004940:	fffff097          	auipc	ra,0xfffff
    80004944:	400080e7          	jalr	1024(ra) # 80003d40 <end_op>
  p = myproc();
    80004948:	ffffd097          	auipc	ra,0xffffd
    8000494c:	b24080e7          	jalr	-1244(ra) # 8000146c <myproc>
    80004950:	8aaa                	mv	s5,a0
  uint64 oldsz = p->sz;
    80004952:	04853d03          	ld	s10,72(a0)
  sz = PGROUNDUP(sz);
    80004956:	6785                	lui	a5,0x1
    80004958:	17fd                	addi	a5,a5,-1
    8000495a:	993e                	add	s2,s2,a5
    8000495c:	757d                	lui	a0,0xfffff
    8000495e:	00a977b3          	and	a5,s2,a0
    80004962:	e0f43423          	sd	a5,-504(s0)
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    80004966:	6609                	lui	a2,0x2
    80004968:	963e                	add	a2,a2,a5
    8000496a:	85be                	mv	a1,a5
    8000496c:	855e                	mv	a0,s7
    8000496e:	ffffc097          	auipc	ra,0xffffc
    80004972:	f6a080e7          	jalr	-150(ra) # 800008d8 <uvmalloc>
    80004976:	8b2a                	mv	s6,a0
  ip = 0;
    80004978:	4481                	li	s1,0
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    8000497a:	12050c63          	beqz	a0,80004ab2 <exec+0x2c6>
  uvmclear(pagetable, sz-2*PGSIZE);
    8000497e:	75f9                	lui	a1,0xffffe
    80004980:	95aa                	add	a1,a1,a0
    80004982:	855e                	mv	a0,s7
    80004984:	ffffc097          	auipc	ra,0xffffc
    80004988:	172080e7          	jalr	370(ra) # 80000af6 <uvmclear>
  stackbase = sp - PGSIZE;
    8000498c:	7c7d                	lui	s8,0xfffff
    8000498e:	9c5a                	add	s8,s8,s6
  for(argc = 0; argv[argc]; argc++) {
    80004990:	e0043783          	ld	a5,-512(s0)
    80004994:	6388                	ld	a0,0(a5)
    80004996:	c535                	beqz	a0,80004a02 <exec+0x216>
    80004998:	e9040993          	addi	s3,s0,-368
    8000499c:	f9040c93          	addi	s9,s0,-112
  sp = sz;
    800049a0:	895a                	mv	s2,s6
    sp -= strlen(argv[argc]) + 1;
    800049a2:	ffffc097          	auipc	ra,0xffffc
    800049a6:	95a080e7          	jalr	-1702(ra) # 800002fc <strlen>
    800049aa:	2505                	addiw	a0,a0,1
    800049ac:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800049b0:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    800049b4:	13896363          	bltu	s2,s8,80004ada <exec+0x2ee>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    800049b8:	e0043d83          	ld	s11,-512(s0)
    800049bc:	000dba03          	ld	s4,0(s11)
    800049c0:	8552                	mv	a0,s4
    800049c2:	ffffc097          	auipc	ra,0xffffc
    800049c6:	93a080e7          	jalr	-1734(ra) # 800002fc <strlen>
    800049ca:	0015069b          	addiw	a3,a0,1
    800049ce:	8652                	mv	a2,s4
    800049d0:	85ca                	mv	a1,s2
    800049d2:	855e                	mv	a0,s7
    800049d4:	ffffc097          	auipc	ra,0xffffc
    800049d8:	154080e7          	jalr	340(ra) # 80000b28 <copyout>
    800049dc:	10054363          	bltz	a0,80004ae2 <exec+0x2f6>
    ustack[argc] = sp;
    800049e0:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    800049e4:	0485                	addi	s1,s1,1
    800049e6:	008d8793          	addi	a5,s11,8
    800049ea:	e0f43023          	sd	a5,-512(s0)
    800049ee:	008db503          	ld	a0,8(s11)
    800049f2:	c911                	beqz	a0,80004a06 <exec+0x21a>
    if(argc >= MAXARG)
    800049f4:	09a1                	addi	s3,s3,8
    800049f6:	fb3c96e3          	bne	s9,s3,800049a2 <exec+0x1b6>
  sz = sz1;
    800049fa:	e1643423          	sd	s6,-504(s0)
  ip = 0;
    800049fe:	4481                	li	s1,0
    80004a00:	a84d                	j	80004ab2 <exec+0x2c6>
  sp = sz;
    80004a02:	895a                	mv	s2,s6
  for(argc = 0; argv[argc]; argc++) {
    80004a04:	4481                	li	s1,0
  ustack[argc] = 0;
    80004a06:	00349793          	slli	a5,s1,0x3
    80004a0a:	f9040713          	addi	a4,s0,-112
    80004a0e:	97ba                	add	a5,a5,a4
    80004a10:	f007b023          	sd	zero,-256(a5) # f00 <_entry-0x7ffff100>
  sp -= (argc+1) * sizeof(uint64);
    80004a14:	00148693          	addi	a3,s1,1
    80004a18:	068e                	slli	a3,a3,0x3
    80004a1a:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    80004a1e:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    80004a22:	01897663          	bgeu	s2,s8,80004a2e <exec+0x242>
  sz = sz1;
    80004a26:	e1643423          	sd	s6,-504(s0)
  ip = 0;
    80004a2a:	4481                	li	s1,0
    80004a2c:	a059                	j	80004ab2 <exec+0x2c6>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80004a2e:	e9040613          	addi	a2,s0,-368
    80004a32:	85ca                	mv	a1,s2
    80004a34:	855e                	mv	a0,s7
    80004a36:	ffffc097          	auipc	ra,0xffffc
    80004a3a:	0f2080e7          	jalr	242(ra) # 80000b28 <copyout>
    80004a3e:	0a054663          	bltz	a0,80004aea <exec+0x2fe>
  p->trapframe->a1 = sp;
    80004a42:	058ab783          	ld	a5,88(s5)
    80004a46:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    80004a4a:	df843783          	ld	a5,-520(s0)
    80004a4e:	0007c703          	lbu	a4,0(a5)
    80004a52:	cf11                	beqz	a4,80004a6e <exec+0x282>
    80004a54:	0785                	addi	a5,a5,1
    if(*s == '/')
    80004a56:	02f00693          	li	a3,47
    80004a5a:	a039                	j	80004a68 <exec+0x27c>
      last = s+1;
    80004a5c:	def43c23          	sd	a5,-520(s0)
  for(last=s=path; *s; s++)
    80004a60:	0785                	addi	a5,a5,1
    80004a62:	fff7c703          	lbu	a4,-1(a5)
    80004a66:	c701                	beqz	a4,80004a6e <exec+0x282>
    if(*s == '/')
    80004a68:	fed71ce3          	bne	a4,a3,80004a60 <exec+0x274>
    80004a6c:	bfc5                	j	80004a5c <exec+0x270>
  safestrcpy(p->name, last, sizeof(p->name));
    80004a6e:	4641                	li	a2,16
    80004a70:	df843583          	ld	a1,-520(s0)
    80004a74:	158a8513          	addi	a0,s5,344
    80004a78:	ffffc097          	auipc	ra,0xffffc
    80004a7c:	852080e7          	jalr	-1966(ra) # 800002ca <safestrcpy>
  oldpagetable = p->pagetable;
    80004a80:	050ab503          	ld	a0,80(s5)
  p->pagetable = pagetable;
    80004a84:	057ab823          	sd	s7,80(s5)
  p->sz = sz;
    80004a88:	056ab423          	sd	s6,72(s5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80004a8c:	058ab783          	ld	a5,88(s5)
    80004a90:	e6843703          	ld	a4,-408(s0)
    80004a94:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80004a96:	058ab783          	ld	a5,88(s5)
    80004a9a:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80004a9e:	85ea                	mv	a1,s10
    80004aa0:	ffffd097          	auipc	ra,0xffffd
    80004aa4:	b2c080e7          	jalr	-1236(ra) # 800015cc <proc_freepagetable>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80004aa8:	0004851b          	sext.w	a0,s1
    80004aac:	bbe1                	j	80004884 <exec+0x98>
    80004aae:	e1243423          	sd	s2,-504(s0)
    proc_freepagetable(pagetable, sz);
    80004ab2:	e0843583          	ld	a1,-504(s0)
    80004ab6:	855e                	mv	a0,s7
    80004ab8:	ffffd097          	auipc	ra,0xffffd
    80004abc:	b14080e7          	jalr	-1260(ra) # 800015cc <proc_freepagetable>
  if(ip){
    80004ac0:	da0498e3          	bnez	s1,80004870 <exec+0x84>
  return -1;
    80004ac4:	557d                	li	a0,-1
    80004ac6:	bb7d                	j	80004884 <exec+0x98>
    80004ac8:	e1243423          	sd	s2,-504(s0)
    80004acc:	b7dd                	j	80004ab2 <exec+0x2c6>
    80004ace:	e1243423          	sd	s2,-504(s0)
    80004ad2:	b7c5                	j	80004ab2 <exec+0x2c6>
    80004ad4:	e1243423          	sd	s2,-504(s0)
    80004ad8:	bfe9                	j	80004ab2 <exec+0x2c6>
  sz = sz1;
    80004ada:	e1643423          	sd	s6,-504(s0)
  ip = 0;
    80004ade:	4481                	li	s1,0
    80004ae0:	bfc9                	j	80004ab2 <exec+0x2c6>
  sz = sz1;
    80004ae2:	e1643423          	sd	s6,-504(s0)
  ip = 0;
    80004ae6:	4481                	li	s1,0
    80004ae8:	b7e9                	j	80004ab2 <exec+0x2c6>
  sz = sz1;
    80004aea:	e1643423          	sd	s6,-504(s0)
  ip = 0;
    80004aee:	4481                	li	s1,0
    80004af0:	b7c9                	j	80004ab2 <exec+0x2c6>
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80004af2:	e0843903          	ld	s2,-504(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80004af6:	2b05                	addiw	s6,s6,1
    80004af8:	0389899b          	addiw	s3,s3,56
    80004afc:	e8845783          	lhu	a5,-376(s0)
    80004b00:	e2fb5be3          	bge	s6,a5,80004936 <exec+0x14a>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80004b04:	2981                	sext.w	s3,s3
    80004b06:	03800713          	li	a4,56
    80004b0a:	86ce                	mv	a3,s3
    80004b0c:	e1840613          	addi	a2,s0,-488
    80004b10:	4581                	li	a1,0
    80004b12:	8526                	mv	a0,s1
    80004b14:	fffff097          	auipc	ra,0xfffff
    80004b18:	906080e7          	jalr	-1786(ra) # 8000341a <readi>
    80004b1c:	03800793          	li	a5,56
    80004b20:	f8f517e3          	bne	a0,a5,80004aae <exec+0x2c2>
    if(ph.type != ELF_PROG_LOAD)
    80004b24:	e1842783          	lw	a5,-488(s0)
    80004b28:	4705                	li	a4,1
    80004b2a:	fce796e3          	bne	a5,a4,80004af6 <exec+0x30a>
    if(ph.memsz < ph.filesz)
    80004b2e:	e4043603          	ld	a2,-448(s0)
    80004b32:	e3843783          	ld	a5,-456(s0)
    80004b36:	f8f669e3          	bltu	a2,a5,80004ac8 <exec+0x2dc>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80004b3a:	e2843783          	ld	a5,-472(s0)
    80004b3e:	963e                	add	a2,a2,a5
    80004b40:	f8f667e3          	bltu	a2,a5,80004ace <exec+0x2e2>
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80004b44:	85ca                	mv	a1,s2
    80004b46:	855e                	mv	a0,s7
    80004b48:	ffffc097          	auipc	ra,0xffffc
    80004b4c:	d90080e7          	jalr	-624(ra) # 800008d8 <uvmalloc>
    80004b50:	e0a43423          	sd	a0,-504(s0)
    80004b54:	d141                	beqz	a0,80004ad4 <exec+0x2e8>
    if((ph.vaddr % PGSIZE) != 0)
    80004b56:	e2843d03          	ld	s10,-472(s0)
    80004b5a:	df043783          	ld	a5,-528(s0)
    80004b5e:	00fd77b3          	and	a5,s10,a5
    80004b62:	fba1                	bnez	a5,80004ab2 <exec+0x2c6>
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    80004b64:	e2042d83          	lw	s11,-480(s0)
    80004b68:	e3842c03          	lw	s8,-456(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80004b6c:	f80c03e3          	beqz	s8,80004af2 <exec+0x306>
    80004b70:	8a62                	mv	s4,s8
    80004b72:	4901                	li	s2,0
    80004b74:	b345                	j	80004914 <exec+0x128>

0000000080004b76 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80004b76:	7179                	addi	sp,sp,-48
    80004b78:	f406                	sd	ra,40(sp)
    80004b7a:	f022                	sd	s0,32(sp)
    80004b7c:	ec26                	sd	s1,24(sp)
    80004b7e:	e84a                	sd	s2,16(sp)
    80004b80:	1800                	addi	s0,sp,48
    80004b82:	892e                	mv	s2,a1
    80004b84:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80004b86:	fdc40593          	addi	a1,s0,-36
    80004b8a:	ffffe097          	auipc	ra,0xffffe
    80004b8e:	9a0080e7          	jalr	-1632(ra) # 8000252a <argint>
    80004b92:	04054063          	bltz	a0,80004bd2 <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80004b96:	fdc42703          	lw	a4,-36(s0)
    80004b9a:	47bd                	li	a5,15
    80004b9c:	02e7ed63          	bltu	a5,a4,80004bd6 <argfd+0x60>
    80004ba0:	ffffd097          	auipc	ra,0xffffd
    80004ba4:	8cc080e7          	jalr	-1844(ra) # 8000146c <myproc>
    80004ba8:	fdc42703          	lw	a4,-36(s0)
    80004bac:	01a70793          	addi	a5,a4,26
    80004bb0:	078e                	slli	a5,a5,0x3
    80004bb2:	953e                	add	a0,a0,a5
    80004bb4:	611c                	ld	a5,0(a0)
    80004bb6:	c395                	beqz	a5,80004bda <argfd+0x64>
    return -1;
  if(pfd)
    80004bb8:	00090463          	beqz	s2,80004bc0 <argfd+0x4a>
    *pfd = fd;
    80004bbc:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    80004bc0:	4501                	li	a0,0
  if(pf)
    80004bc2:	c091                	beqz	s1,80004bc6 <argfd+0x50>
    *pf = f;
    80004bc4:	e09c                	sd	a5,0(s1)
}
    80004bc6:	70a2                	ld	ra,40(sp)
    80004bc8:	7402                	ld	s0,32(sp)
    80004bca:	64e2                	ld	s1,24(sp)
    80004bcc:	6942                	ld	s2,16(sp)
    80004bce:	6145                	addi	sp,sp,48
    80004bd0:	8082                	ret
    return -1;
    80004bd2:	557d                	li	a0,-1
    80004bd4:	bfcd                	j	80004bc6 <argfd+0x50>
    return -1;
    80004bd6:	557d                	li	a0,-1
    80004bd8:	b7fd                	j	80004bc6 <argfd+0x50>
    80004bda:	557d                	li	a0,-1
    80004bdc:	b7ed                	j	80004bc6 <argfd+0x50>

0000000080004bde <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80004bde:	1101                	addi	sp,sp,-32
    80004be0:	ec06                	sd	ra,24(sp)
    80004be2:	e822                	sd	s0,16(sp)
    80004be4:	e426                	sd	s1,8(sp)
    80004be6:	1000                	addi	s0,sp,32
    80004be8:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    80004bea:	ffffd097          	auipc	ra,0xffffd
    80004bee:	882080e7          	jalr	-1918(ra) # 8000146c <myproc>
    80004bf2:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80004bf4:	0d050793          	addi	a5,a0,208 # fffffffffffff0d0 <end+0xffffffff7ffd8e90>
    80004bf8:	4501                	li	a0,0
    80004bfa:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    80004bfc:	6398                	ld	a4,0(a5)
    80004bfe:	cb19                	beqz	a4,80004c14 <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    80004c00:	2505                	addiw	a0,a0,1
    80004c02:	07a1                	addi	a5,a5,8
    80004c04:	fed51ce3          	bne	a0,a3,80004bfc <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80004c08:	557d                	li	a0,-1
}
    80004c0a:	60e2                	ld	ra,24(sp)
    80004c0c:	6442                	ld	s0,16(sp)
    80004c0e:	64a2                	ld	s1,8(sp)
    80004c10:	6105                	addi	sp,sp,32
    80004c12:	8082                	ret
      p->ofile[fd] = f;
    80004c14:	01a50793          	addi	a5,a0,26
    80004c18:	078e                	slli	a5,a5,0x3
    80004c1a:	963e                	add	a2,a2,a5
    80004c1c:	e204                	sd	s1,0(a2)
      return fd;
    80004c1e:	b7f5                	j	80004c0a <fdalloc+0x2c>

0000000080004c20 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
    80004c20:	715d                	addi	sp,sp,-80
    80004c22:	e486                	sd	ra,72(sp)
    80004c24:	e0a2                	sd	s0,64(sp)
    80004c26:	fc26                	sd	s1,56(sp)
    80004c28:	f84a                	sd	s2,48(sp)
    80004c2a:	f44e                	sd	s3,40(sp)
    80004c2c:	f052                	sd	s4,32(sp)
    80004c2e:	ec56                	sd	s5,24(sp)
    80004c30:	0880                	addi	s0,sp,80
    80004c32:	89ae                	mv	s3,a1
    80004c34:	8ab2                	mv	s5,a2
    80004c36:	8a36                	mv	s4,a3
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80004c38:	fb040593          	addi	a1,s0,-80
    80004c3c:	fffff097          	auipc	ra,0xfffff
    80004c40:	cf4080e7          	jalr	-780(ra) # 80003930 <nameiparent>
    80004c44:	892a                	mv	s2,a0
    80004c46:	12050f63          	beqz	a0,80004d84 <create+0x164>
    return 0;

  ilock(dp);
    80004c4a:	ffffe097          	auipc	ra,0xffffe
    80004c4e:	51c080e7          	jalr	1308(ra) # 80003166 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80004c52:	4601                	li	a2,0
    80004c54:	fb040593          	addi	a1,s0,-80
    80004c58:	854a                	mv	a0,s2
    80004c5a:	fffff097          	auipc	ra,0xfffff
    80004c5e:	9e6080e7          	jalr	-1562(ra) # 80003640 <dirlookup>
    80004c62:	84aa                	mv	s1,a0
    80004c64:	c921                	beqz	a0,80004cb4 <create+0x94>
    iunlockput(dp);
    80004c66:	854a                	mv	a0,s2
    80004c68:	ffffe097          	auipc	ra,0xffffe
    80004c6c:	760080e7          	jalr	1888(ra) # 800033c8 <iunlockput>
    ilock(ip);
    80004c70:	8526                	mv	a0,s1
    80004c72:	ffffe097          	auipc	ra,0xffffe
    80004c76:	4f4080e7          	jalr	1268(ra) # 80003166 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80004c7a:	2981                	sext.w	s3,s3
    80004c7c:	4789                	li	a5,2
    80004c7e:	02f99463          	bne	s3,a5,80004ca6 <create+0x86>
    80004c82:	0444d783          	lhu	a5,68(s1)
    80004c86:	37f9                	addiw	a5,a5,-2
    80004c88:	17c2                	slli	a5,a5,0x30
    80004c8a:	93c1                	srli	a5,a5,0x30
    80004c8c:	4705                	li	a4,1
    80004c8e:	00f76c63          	bltu	a4,a5,80004ca6 <create+0x86>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
    80004c92:	8526                	mv	a0,s1
    80004c94:	60a6                	ld	ra,72(sp)
    80004c96:	6406                	ld	s0,64(sp)
    80004c98:	74e2                	ld	s1,56(sp)
    80004c9a:	7942                	ld	s2,48(sp)
    80004c9c:	79a2                	ld	s3,40(sp)
    80004c9e:	7a02                	ld	s4,32(sp)
    80004ca0:	6ae2                	ld	s5,24(sp)
    80004ca2:	6161                	addi	sp,sp,80
    80004ca4:	8082                	ret
    iunlockput(ip);
    80004ca6:	8526                	mv	a0,s1
    80004ca8:	ffffe097          	auipc	ra,0xffffe
    80004cac:	720080e7          	jalr	1824(ra) # 800033c8 <iunlockput>
    return 0;
    80004cb0:	4481                	li	s1,0
    80004cb2:	b7c5                	j	80004c92 <create+0x72>
  if((ip = ialloc(dp->dev, type)) == 0)
    80004cb4:	85ce                	mv	a1,s3
    80004cb6:	00092503          	lw	a0,0(s2)
    80004cba:	ffffe097          	auipc	ra,0xffffe
    80004cbe:	326080e7          	jalr	806(ra) # 80002fe0 <ialloc>
    80004cc2:	84aa                	mv	s1,a0
    80004cc4:	c529                	beqz	a0,80004d0e <create+0xee>
  ilock(ip);
    80004cc6:	ffffe097          	auipc	ra,0xffffe
    80004cca:	4a0080e7          	jalr	1184(ra) # 80003166 <ilock>
  ip->major = major;
    80004cce:	05549323          	sh	s5,70(s1)
  ip->minor = minor;
    80004cd2:	05449423          	sh	s4,72(s1)
  ip->nlink = 1;
    80004cd6:	4785                	li	a5,1
    80004cd8:	04f49523          	sh	a5,74(s1)
  iupdate(ip);
    80004cdc:	8526                	mv	a0,s1
    80004cde:	ffffe097          	auipc	ra,0xffffe
    80004ce2:	3c6080e7          	jalr	966(ra) # 800030a4 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
    80004ce6:	2981                	sext.w	s3,s3
    80004ce8:	4785                	li	a5,1
    80004cea:	02f98a63          	beq	s3,a5,80004d1e <create+0xfe>
  if(dirlink(dp, name, ip->inum) < 0)
    80004cee:	40d0                	lw	a2,4(s1)
    80004cf0:	fb040593          	addi	a1,s0,-80
    80004cf4:	854a                	mv	a0,s2
    80004cf6:	fffff097          	auipc	ra,0xfffff
    80004cfa:	b5a080e7          	jalr	-1190(ra) # 80003850 <dirlink>
    80004cfe:	06054b63          	bltz	a0,80004d74 <create+0x154>
  iunlockput(dp);
    80004d02:	854a                	mv	a0,s2
    80004d04:	ffffe097          	auipc	ra,0xffffe
    80004d08:	6c4080e7          	jalr	1732(ra) # 800033c8 <iunlockput>
  return ip;
    80004d0c:	b759                	j	80004c92 <create+0x72>
    panic("create: ialloc");
    80004d0e:	00004517          	auipc	a0,0x4
    80004d12:	b4a50513          	addi	a0,a0,-1206 # 80008858 <syscalls+0x398>
    80004d16:	00002097          	auipc	ra,0x2
    80004d1a:	992080e7          	jalr	-1646(ra) # 800066a8 <panic>
    dp->nlink++;  // for ".."
    80004d1e:	04a95783          	lhu	a5,74(s2)
    80004d22:	2785                	addiw	a5,a5,1
    80004d24:	04f91523          	sh	a5,74(s2)
    iupdate(dp);
    80004d28:	854a                	mv	a0,s2
    80004d2a:	ffffe097          	auipc	ra,0xffffe
    80004d2e:	37a080e7          	jalr	890(ra) # 800030a4 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    80004d32:	40d0                	lw	a2,4(s1)
    80004d34:	00004597          	auipc	a1,0x4
    80004d38:	b3458593          	addi	a1,a1,-1228 # 80008868 <syscalls+0x3a8>
    80004d3c:	8526                	mv	a0,s1
    80004d3e:	fffff097          	auipc	ra,0xfffff
    80004d42:	b12080e7          	jalr	-1262(ra) # 80003850 <dirlink>
    80004d46:	00054f63          	bltz	a0,80004d64 <create+0x144>
    80004d4a:	00492603          	lw	a2,4(s2)
    80004d4e:	00004597          	auipc	a1,0x4
    80004d52:	b2258593          	addi	a1,a1,-1246 # 80008870 <syscalls+0x3b0>
    80004d56:	8526                	mv	a0,s1
    80004d58:	fffff097          	auipc	ra,0xfffff
    80004d5c:	af8080e7          	jalr	-1288(ra) # 80003850 <dirlink>
    80004d60:	f80557e3          	bgez	a0,80004cee <create+0xce>
      panic("create dots");
    80004d64:	00004517          	auipc	a0,0x4
    80004d68:	b1450513          	addi	a0,a0,-1260 # 80008878 <syscalls+0x3b8>
    80004d6c:	00002097          	auipc	ra,0x2
    80004d70:	93c080e7          	jalr	-1732(ra) # 800066a8 <panic>
    panic("create: dirlink");
    80004d74:	00004517          	auipc	a0,0x4
    80004d78:	b1450513          	addi	a0,a0,-1260 # 80008888 <syscalls+0x3c8>
    80004d7c:	00002097          	auipc	ra,0x2
    80004d80:	92c080e7          	jalr	-1748(ra) # 800066a8 <panic>
    return 0;
    80004d84:	84aa                	mv	s1,a0
    80004d86:	b731                	j	80004c92 <create+0x72>

0000000080004d88 <sys_dup>:
{
    80004d88:	7179                	addi	sp,sp,-48
    80004d8a:	f406                	sd	ra,40(sp)
    80004d8c:	f022                	sd	s0,32(sp)
    80004d8e:	ec26                	sd	s1,24(sp)
    80004d90:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80004d92:	fd840613          	addi	a2,s0,-40
    80004d96:	4581                	li	a1,0
    80004d98:	4501                	li	a0,0
    80004d9a:	00000097          	auipc	ra,0x0
    80004d9e:	ddc080e7          	jalr	-548(ra) # 80004b76 <argfd>
    return -1;
    80004da2:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80004da4:	02054363          	bltz	a0,80004dca <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    80004da8:	fd843503          	ld	a0,-40(s0)
    80004dac:	00000097          	auipc	ra,0x0
    80004db0:	e32080e7          	jalr	-462(ra) # 80004bde <fdalloc>
    80004db4:	84aa                	mv	s1,a0
    return -1;
    80004db6:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80004db8:	00054963          	bltz	a0,80004dca <sys_dup+0x42>
  filedup(f);
    80004dbc:	fd843503          	ld	a0,-40(s0)
    80004dc0:	fffff097          	auipc	ra,0xfffff
    80004dc4:	37a080e7          	jalr	890(ra) # 8000413a <filedup>
  return fd;
    80004dc8:	87a6                	mv	a5,s1
}
    80004dca:	853e                	mv	a0,a5
    80004dcc:	70a2                	ld	ra,40(sp)
    80004dce:	7402                	ld	s0,32(sp)
    80004dd0:	64e2                	ld	s1,24(sp)
    80004dd2:	6145                	addi	sp,sp,48
    80004dd4:	8082                	ret

0000000080004dd6 <sys_read>:
{
    80004dd6:	7179                	addi	sp,sp,-48
    80004dd8:	f406                	sd	ra,40(sp)
    80004dda:	f022                	sd	s0,32(sp)
    80004ddc:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80004dde:	fe840613          	addi	a2,s0,-24
    80004de2:	4581                	li	a1,0
    80004de4:	4501                	li	a0,0
    80004de6:	00000097          	auipc	ra,0x0
    80004dea:	d90080e7          	jalr	-624(ra) # 80004b76 <argfd>
    return -1;
    80004dee:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80004df0:	04054163          	bltz	a0,80004e32 <sys_read+0x5c>
    80004df4:	fe440593          	addi	a1,s0,-28
    80004df8:	4509                	li	a0,2
    80004dfa:	ffffd097          	auipc	ra,0xffffd
    80004dfe:	730080e7          	jalr	1840(ra) # 8000252a <argint>
    return -1;
    80004e02:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80004e04:	02054763          	bltz	a0,80004e32 <sys_read+0x5c>
    80004e08:	fd840593          	addi	a1,s0,-40
    80004e0c:	4505                	li	a0,1
    80004e0e:	ffffd097          	auipc	ra,0xffffd
    80004e12:	73e080e7          	jalr	1854(ra) # 8000254c <argaddr>
    return -1;
    80004e16:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80004e18:	00054d63          	bltz	a0,80004e32 <sys_read+0x5c>
  return fileread(f, p, n);
    80004e1c:	fe442603          	lw	a2,-28(s0)
    80004e20:	fd843583          	ld	a1,-40(s0)
    80004e24:	fe843503          	ld	a0,-24(s0)
    80004e28:	fffff097          	auipc	ra,0xfffff
    80004e2c:	49e080e7          	jalr	1182(ra) # 800042c6 <fileread>
    80004e30:	87aa                	mv	a5,a0
}
    80004e32:	853e                	mv	a0,a5
    80004e34:	70a2                	ld	ra,40(sp)
    80004e36:	7402                	ld	s0,32(sp)
    80004e38:	6145                	addi	sp,sp,48
    80004e3a:	8082                	ret

0000000080004e3c <sys_write>:
{
    80004e3c:	7179                	addi	sp,sp,-48
    80004e3e:	f406                	sd	ra,40(sp)
    80004e40:	f022                	sd	s0,32(sp)
    80004e42:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80004e44:	fe840613          	addi	a2,s0,-24
    80004e48:	4581                	li	a1,0
    80004e4a:	4501                	li	a0,0
    80004e4c:	00000097          	auipc	ra,0x0
    80004e50:	d2a080e7          	jalr	-726(ra) # 80004b76 <argfd>
    return -1;
    80004e54:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80004e56:	04054163          	bltz	a0,80004e98 <sys_write+0x5c>
    80004e5a:	fe440593          	addi	a1,s0,-28
    80004e5e:	4509                	li	a0,2
    80004e60:	ffffd097          	auipc	ra,0xffffd
    80004e64:	6ca080e7          	jalr	1738(ra) # 8000252a <argint>
    return -1;
    80004e68:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80004e6a:	02054763          	bltz	a0,80004e98 <sys_write+0x5c>
    80004e6e:	fd840593          	addi	a1,s0,-40
    80004e72:	4505                	li	a0,1
    80004e74:	ffffd097          	auipc	ra,0xffffd
    80004e78:	6d8080e7          	jalr	1752(ra) # 8000254c <argaddr>
    return -1;
    80004e7c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80004e7e:	00054d63          	bltz	a0,80004e98 <sys_write+0x5c>
  return filewrite(f, p, n);
    80004e82:	fe442603          	lw	a2,-28(s0)
    80004e86:	fd843583          	ld	a1,-40(s0)
    80004e8a:	fe843503          	ld	a0,-24(s0)
    80004e8e:	fffff097          	auipc	ra,0xfffff
    80004e92:	4fa080e7          	jalr	1274(ra) # 80004388 <filewrite>
    80004e96:	87aa                	mv	a5,a0
}
    80004e98:	853e                	mv	a0,a5
    80004e9a:	70a2                	ld	ra,40(sp)
    80004e9c:	7402                	ld	s0,32(sp)
    80004e9e:	6145                	addi	sp,sp,48
    80004ea0:	8082                	ret

0000000080004ea2 <sys_close>:
{
    80004ea2:	1101                	addi	sp,sp,-32
    80004ea4:	ec06                	sd	ra,24(sp)
    80004ea6:	e822                	sd	s0,16(sp)
    80004ea8:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80004eaa:	fe040613          	addi	a2,s0,-32
    80004eae:	fec40593          	addi	a1,s0,-20
    80004eb2:	4501                	li	a0,0
    80004eb4:	00000097          	auipc	ra,0x0
    80004eb8:	cc2080e7          	jalr	-830(ra) # 80004b76 <argfd>
    return -1;
    80004ebc:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80004ebe:	02054463          	bltz	a0,80004ee6 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80004ec2:	ffffc097          	auipc	ra,0xffffc
    80004ec6:	5aa080e7          	jalr	1450(ra) # 8000146c <myproc>
    80004eca:	fec42783          	lw	a5,-20(s0)
    80004ece:	07e9                	addi	a5,a5,26
    80004ed0:	078e                	slli	a5,a5,0x3
    80004ed2:	97aa                	add	a5,a5,a0
    80004ed4:	0007b023          	sd	zero,0(a5)
  fileclose(f);
    80004ed8:	fe043503          	ld	a0,-32(s0)
    80004edc:	fffff097          	auipc	ra,0xfffff
    80004ee0:	2b0080e7          	jalr	688(ra) # 8000418c <fileclose>
  return 0;
    80004ee4:	4781                	li	a5,0
}
    80004ee6:	853e                	mv	a0,a5
    80004ee8:	60e2                	ld	ra,24(sp)
    80004eea:	6442                	ld	s0,16(sp)
    80004eec:	6105                	addi	sp,sp,32
    80004eee:	8082                	ret

0000000080004ef0 <sys_fstat>:
{
    80004ef0:	1101                	addi	sp,sp,-32
    80004ef2:	ec06                	sd	ra,24(sp)
    80004ef4:	e822                	sd	s0,16(sp)
    80004ef6:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80004ef8:	fe840613          	addi	a2,s0,-24
    80004efc:	4581                	li	a1,0
    80004efe:	4501                	li	a0,0
    80004f00:	00000097          	auipc	ra,0x0
    80004f04:	c76080e7          	jalr	-906(ra) # 80004b76 <argfd>
    return -1;
    80004f08:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80004f0a:	02054563          	bltz	a0,80004f34 <sys_fstat+0x44>
    80004f0e:	fe040593          	addi	a1,s0,-32
    80004f12:	4505                	li	a0,1
    80004f14:	ffffd097          	auipc	ra,0xffffd
    80004f18:	638080e7          	jalr	1592(ra) # 8000254c <argaddr>
    return -1;
    80004f1c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80004f1e:	00054b63          	bltz	a0,80004f34 <sys_fstat+0x44>
  return filestat(f, st);
    80004f22:	fe043583          	ld	a1,-32(s0)
    80004f26:	fe843503          	ld	a0,-24(s0)
    80004f2a:	fffff097          	auipc	ra,0xfffff
    80004f2e:	32a080e7          	jalr	810(ra) # 80004254 <filestat>
    80004f32:	87aa                	mv	a5,a0
}
    80004f34:	853e                	mv	a0,a5
    80004f36:	60e2                	ld	ra,24(sp)
    80004f38:	6442                	ld	s0,16(sp)
    80004f3a:	6105                	addi	sp,sp,32
    80004f3c:	8082                	ret

0000000080004f3e <sys_link>:
{
    80004f3e:	7169                	addi	sp,sp,-304
    80004f40:	f606                	sd	ra,296(sp)
    80004f42:	f222                	sd	s0,288(sp)
    80004f44:	ee26                	sd	s1,280(sp)
    80004f46:	ea4a                	sd	s2,272(sp)
    80004f48:	1a00                	addi	s0,sp,304
  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80004f4a:	08000613          	li	a2,128
    80004f4e:	ed040593          	addi	a1,s0,-304
    80004f52:	4501                	li	a0,0
    80004f54:	ffffd097          	auipc	ra,0xffffd
    80004f58:	61a080e7          	jalr	1562(ra) # 8000256e <argstr>
    return -1;
    80004f5c:	57fd                	li	a5,-1
  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80004f5e:	10054e63          	bltz	a0,8000507a <sys_link+0x13c>
    80004f62:	08000613          	li	a2,128
    80004f66:	f5040593          	addi	a1,s0,-176
    80004f6a:	4505                	li	a0,1
    80004f6c:	ffffd097          	auipc	ra,0xffffd
    80004f70:	602080e7          	jalr	1538(ra) # 8000256e <argstr>
    return -1;
    80004f74:	57fd                	li	a5,-1
  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80004f76:	10054263          	bltz	a0,8000507a <sys_link+0x13c>
  begin_op();
    80004f7a:	fffff097          	auipc	ra,0xfffff
    80004f7e:	d46080e7          	jalr	-698(ra) # 80003cc0 <begin_op>
  if((ip = namei(old)) == 0){
    80004f82:	ed040513          	addi	a0,s0,-304
    80004f86:	fffff097          	auipc	ra,0xfffff
    80004f8a:	98c080e7          	jalr	-1652(ra) # 80003912 <namei>
    80004f8e:	84aa                	mv	s1,a0
    80004f90:	c551                	beqz	a0,8000501c <sys_link+0xde>
  ilock(ip);
    80004f92:	ffffe097          	auipc	ra,0xffffe
    80004f96:	1d4080e7          	jalr	468(ra) # 80003166 <ilock>
  if(ip->type == T_DIR){
    80004f9a:	04449703          	lh	a4,68(s1)
    80004f9e:	4785                	li	a5,1
    80004fa0:	08f70463          	beq	a4,a5,80005028 <sys_link+0xea>
  ip->nlink++;
    80004fa4:	04a4d783          	lhu	a5,74(s1)
    80004fa8:	2785                	addiw	a5,a5,1
    80004faa:	04f49523          	sh	a5,74(s1)
  iupdate(ip);
    80004fae:	8526                	mv	a0,s1
    80004fb0:	ffffe097          	auipc	ra,0xffffe
    80004fb4:	0f4080e7          	jalr	244(ra) # 800030a4 <iupdate>
  iunlock(ip);
    80004fb8:	8526                	mv	a0,s1
    80004fba:	ffffe097          	auipc	ra,0xffffe
    80004fbe:	26e080e7          	jalr	622(ra) # 80003228 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
    80004fc2:	fd040593          	addi	a1,s0,-48
    80004fc6:	f5040513          	addi	a0,s0,-176
    80004fca:	fffff097          	auipc	ra,0xfffff
    80004fce:	966080e7          	jalr	-1690(ra) # 80003930 <nameiparent>
    80004fd2:	892a                	mv	s2,a0
    80004fd4:	c935                	beqz	a0,80005048 <sys_link+0x10a>
  ilock(dp);
    80004fd6:	ffffe097          	auipc	ra,0xffffe
    80004fda:	190080e7          	jalr	400(ra) # 80003166 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80004fde:	00092703          	lw	a4,0(s2)
    80004fe2:	409c                	lw	a5,0(s1)
    80004fe4:	04f71d63          	bne	a4,a5,8000503e <sys_link+0x100>
    80004fe8:	40d0                	lw	a2,4(s1)
    80004fea:	fd040593          	addi	a1,s0,-48
    80004fee:	854a                	mv	a0,s2
    80004ff0:	fffff097          	auipc	ra,0xfffff
    80004ff4:	860080e7          	jalr	-1952(ra) # 80003850 <dirlink>
    80004ff8:	04054363          	bltz	a0,8000503e <sys_link+0x100>
  iunlockput(dp);
    80004ffc:	854a                	mv	a0,s2
    80004ffe:	ffffe097          	auipc	ra,0xffffe
    80005002:	3ca080e7          	jalr	970(ra) # 800033c8 <iunlockput>
  iput(ip);
    80005006:	8526                	mv	a0,s1
    80005008:	ffffe097          	auipc	ra,0xffffe
    8000500c:	318080e7          	jalr	792(ra) # 80003320 <iput>
  end_op();
    80005010:	fffff097          	auipc	ra,0xfffff
    80005014:	d30080e7          	jalr	-720(ra) # 80003d40 <end_op>
  return 0;
    80005018:	4781                	li	a5,0
    8000501a:	a085                	j	8000507a <sys_link+0x13c>
    end_op();
    8000501c:	fffff097          	auipc	ra,0xfffff
    80005020:	d24080e7          	jalr	-732(ra) # 80003d40 <end_op>
    return -1;
    80005024:	57fd                	li	a5,-1
    80005026:	a891                	j	8000507a <sys_link+0x13c>
    iunlockput(ip);
    80005028:	8526                	mv	a0,s1
    8000502a:	ffffe097          	auipc	ra,0xffffe
    8000502e:	39e080e7          	jalr	926(ra) # 800033c8 <iunlockput>
    end_op();
    80005032:	fffff097          	auipc	ra,0xfffff
    80005036:	d0e080e7          	jalr	-754(ra) # 80003d40 <end_op>
    return -1;
    8000503a:	57fd                	li	a5,-1
    8000503c:	a83d                	j	8000507a <sys_link+0x13c>
    iunlockput(dp);
    8000503e:	854a                	mv	a0,s2
    80005040:	ffffe097          	auipc	ra,0xffffe
    80005044:	388080e7          	jalr	904(ra) # 800033c8 <iunlockput>
  ilock(ip);
    80005048:	8526                	mv	a0,s1
    8000504a:	ffffe097          	auipc	ra,0xffffe
    8000504e:	11c080e7          	jalr	284(ra) # 80003166 <ilock>
  ip->nlink--;
    80005052:	04a4d783          	lhu	a5,74(s1)
    80005056:	37fd                	addiw	a5,a5,-1
    80005058:	04f49523          	sh	a5,74(s1)
  iupdate(ip);
    8000505c:	8526                	mv	a0,s1
    8000505e:	ffffe097          	auipc	ra,0xffffe
    80005062:	046080e7          	jalr	70(ra) # 800030a4 <iupdate>
  iunlockput(ip);
    80005066:	8526                	mv	a0,s1
    80005068:	ffffe097          	auipc	ra,0xffffe
    8000506c:	360080e7          	jalr	864(ra) # 800033c8 <iunlockput>
  end_op();
    80005070:	fffff097          	auipc	ra,0xfffff
    80005074:	cd0080e7          	jalr	-816(ra) # 80003d40 <end_op>
  return -1;
    80005078:	57fd                	li	a5,-1
}
    8000507a:	853e                	mv	a0,a5
    8000507c:	70b2                	ld	ra,296(sp)
    8000507e:	7412                	ld	s0,288(sp)
    80005080:	64f2                	ld	s1,280(sp)
    80005082:	6952                	ld	s2,272(sp)
    80005084:	6155                	addi	sp,sp,304
    80005086:	8082                	ret

0000000080005088 <sys_unlink>:
{
    80005088:	7151                	addi	sp,sp,-240
    8000508a:	f586                	sd	ra,232(sp)
    8000508c:	f1a2                	sd	s0,224(sp)
    8000508e:	eda6                	sd	s1,216(sp)
    80005090:	e9ca                	sd	s2,208(sp)
    80005092:	e5ce                	sd	s3,200(sp)
    80005094:	1980                	addi	s0,sp,240
  if(argstr(0, path, MAXPATH) < 0)
    80005096:	08000613          	li	a2,128
    8000509a:	f3040593          	addi	a1,s0,-208
    8000509e:	4501                	li	a0,0
    800050a0:	ffffd097          	auipc	ra,0xffffd
    800050a4:	4ce080e7          	jalr	1230(ra) # 8000256e <argstr>
    800050a8:	18054163          	bltz	a0,8000522a <sys_unlink+0x1a2>
  begin_op();
    800050ac:	fffff097          	auipc	ra,0xfffff
    800050b0:	c14080e7          	jalr	-1004(ra) # 80003cc0 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    800050b4:	fb040593          	addi	a1,s0,-80
    800050b8:	f3040513          	addi	a0,s0,-208
    800050bc:	fffff097          	auipc	ra,0xfffff
    800050c0:	874080e7          	jalr	-1932(ra) # 80003930 <nameiparent>
    800050c4:	84aa                	mv	s1,a0
    800050c6:	c979                	beqz	a0,8000519c <sys_unlink+0x114>
  ilock(dp);
    800050c8:	ffffe097          	auipc	ra,0xffffe
    800050cc:	09e080e7          	jalr	158(ra) # 80003166 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    800050d0:	00003597          	auipc	a1,0x3
    800050d4:	79858593          	addi	a1,a1,1944 # 80008868 <syscalls+0x3a8>
    800050d8:	fb040513          	addi	a0,s0,-80
    800050dc:	ffffe097          	auipc	ra,0xffffe
    800050e0:	54a080e7          	jalr	1354(ra) # 80003626 <namecmp>
    800050e4:	14050a63          	beqz	a0,80005238 <sys_unlink+0x1b0>
    800050e8:	00003597          	auipc	a1,0x3
    800050ec:	78858593          	addi	a1,a1,1928 # 80008870 <syscalls+0x3b0>
    800050f0:	fb040513          	addi	a0,s0,-80
    800050f4:	ffffe097          	auipc	ra,0xffffe
    800050f8:	532080e7          	jalr	1330(ra) # 80003626 <namecmp>
    800050fc:	12050e63          	beqz	a0,80005238 <sys_unlink+0x1b0>
  if((ip = dirlookup(dp, name, &off)) == 0)
    80005100:	f2c40613          	addi	a2,s0,-212
    80005104:	fb040593          	addi	a1,s0,-80
    80005108:	8526                	mv	a0,s1
    8000510a:	ffffe097          	auipc	ra,0xffffe
    8000510e:	536080e7          	jalr	1334(ra) # 80003640 <dirlookup>
    80005112:	892a                	mv	s2,a0
    80005114:	12050263          	beqz	a0,80005238 <sys_unlink+0x1b0>
  ilock(ip);
    80005118:	ffffe097          	auipc	ra,0xffffe
    8000511c:	04e080e7          	jalr	78(ra) # 80003166 <ilock>
  if(ip->nlink < 1)
    80005120:	04a91783          	lh	a5,74(s2)
    80005124:	08f05263          	blez	a5,800051a8 <sys_unlink+0x120>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80005128:	04491703          	lh	a4,68(s2)
    8000512c:	4785                	li	a5,1
    8000512e:	08f70563          	beq	a4,a5,800051b8 <sys_unlink+0x130>
  memset(&de, 0, sizeof(de));
    80005132:	4641                	li	a2,16
    80005134:	4581                	li	a1,0
    80005136:	fc040513          	addi	a0,s0,-64
    8000513a:	ffffb097          	auipc	ra,0xffffb
    8000513e:	03e080e7          	jalr	62(ra) # 80000178 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005142:	4741                	li	a4,16
    80005144:	f2c42683          	lw	a3,-212(s0)
    80005148:	fc040613          	addi	a2,s0,-64
    8000514c:	4581                	li	a1,0
    8000514e:	8526                	mv	a0,s1
    80005150:	ffffe097          	auipc	ra,0xffffe
    80005154:	3c2080e7          	jalr	962(ra) # 80003512 <writei>
    80005158:	47c1                	li	a5,16
    8000515a:	0af51563          	bne	a0,a5,80005204 <sys_unlink+0x17c>
  if(ip->type == T_DIR){
    8000515e:	04491703          	lh	a4,68(s2)
    80005162:	4785                	li	a5,1
    80005164:	0af70863          	beq	a4,a5,80005214 <sys_unlink+0x18c>
  iunlockput(dp);
    80005168:	8526                	mv	a0,s1
    8000516a:	ffffe097          	auipc	ra,0xffffe
    8000516e:	25e080e7          	jalr	606(ra) # 800033c8 <iunlockput>
  ip->nlink--;
    80005172:	04a95783          	lhu	a5,74(s2)
    80005176:	37fd                	addiw	a5,a5,-1
    80005178:	04f91523          	sh	a5,74(s2)
  iupdate(ip);
    8000517c:	854a                	mv	a0,s2
    8000517e:	ffffe097          	auipc	ra,0xffffe
    80005182:	f26080e7          	jalr	-218(ra) # 800030a4 <iupdate>
  iunlockput(ip);
    80005186:	854a                	mv	a0,s2
    80005188:	ffffe097          	auipc	ra,0xffffe
    8000518c:	240080e7          	jalr	576(ra) # 800033c8 <iunlockput>
  end_op();
    80005190:	fffff097          	auipc	ra,0xfffff
    80005194:	bb0080e7          	jalr	-1104(ra) # 80003d40 <end_op>
  return 0;
    80005198:	4501                	li	a0,0
    8000519a:	a84d                	j	8000524c <sys_unlink+0x1c4>
    end_op();
    8000519c:	fffff097          	auipc	ra,0xfffff
    800051a0:	ba4080e7          	jalr	-1116(ra) # 80003d40 <end_op>
    return -1;
    800051a4:	557d                	li	a0,-1
    800051a6:	a05d                	j	8000524c <sys_unlink+0x1c4>
    panic("unlink: nlink < 1");
    800051a8:	00003517          	auipc	a0,0x3
    800051ac:	6f050513          	addi	a0,a0,1776 # 80008898 <syscalls+0x3d8>
    800051b0:	00001097          	auipc	ra,0x1
    800051b4:	4f8080e7          	jalr	1272(ra) # 800066a8 <panic>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    800051b8:	04c92703          	lw	a4,76(s2)
    800051bc:	02000793          	li	a5,32
    800051c0:	f6e7f9e3          	bgeu	a5,a4,80005132 <sys_unlink+0xaa>
    800051c4:	02000993          	li	s3,32
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    800051c8:	4741                	li	a4,16
    800051ca:	86ce                	mv	a3,s3
    800051cc:	f1840613          	addi	a2,s0,-232
    800051d0:	4581                	li	a1,0
    800051d2:	854a                	mv	a0,s2
    800051d4:	ffffe097          	auipc	ra,0xffffe
    800051d8:	246080e7          	jalr	582(ra) # 8000341a <readi>
    800051dc:	47c1                	li	a5,16
    800051de:	00f51b63          	bne	a0,a5,800051f4 <sys_unlink+0x16c>
    if(de.inum != 0)
    800051e2:	f1845783          	lhu	a5,-232(s0)
    800051e6:	e7a1                	bnez	a5,8000522e <sys_unlink+0x1a6>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    800051e8:	29c1                	addiw	s3,s3,16
    800051ea:	04c92783          	lw	a5,76(s2)
    800051ee:	fcf9ede3          	bltu	s3,a5,800051c8 <sys_unlink+0x140>
    800051f2:	b781                	j	80005132 <sys_unlink+0xaa>
      panic("isdirempty: readi");
    800051f4:	00003517          	auipc	a0,0x3
    800051f8:	6bc50513          	addi	a0,a0,1724 # 800088b0 <syscalls+0x3f0>
    800051fc:	00001097          	auipc	ra,0x1
    80005200:	4ac080e7          	jalr	1196(ra) # 800066a8 <panic>
    panic("unlink: writei");
    80005204:	00003517          	auipc	a0,0x3
    80005208:	6c450513          	addi	a0,a0,1732 # 800088c8 <syscalls+0x408>
    8000520c:	00001097          	auipc	ra,0x1
    80005210:	49c080e7          	jalr	1180(ra) # 800066a8 <panic>
    dp->nlink--;
    80005214:	04a4d783          	lhu	a5,74(s1)
    80005218:	37fd                	addiw	a5,a5,-1
    8000521a:	04f49523          	sh	a5,74(s1)
    iupdate(dp);
    8000521e:	8526                	mv	a0,s1
    80005220:	ffffe097          	auipc	ra,0xffffe
    80005224:	e84080e7          	jalr	-380(ra) # 800030a4 <iupdate>
    80005228:	b781                	j	80005168 <sys_unlink+0xe0>
    return -1;
    8000522a:	557d                	li	a0,-1
    8000522c:	a005                	j	8000524c <sys_unlink+0x1c4>
    iunlockput(ip);
    8000522e:	854a                	mv	a0,s2
    80005230:	ffffe097          	auipc	ra,0xffffe
    80005234:	198080e7          	jalr	408(ra) # 800033c8 <iunlockput>
  iunlockput(dp);
    80005238:	8526                	mv	a0,s1
    8000523a:	ffffe097          	auipc	ra,0xffffe
    8000523e:	18e080e7          	jalr	398(ra) # 800033c8 <iunlockput>
  end_op();
    80005242:	fffff097          	auipc	ra,0xfffff
    80005246:	afe080e7          	jalr	-1282(ra) # 80003d40 <end_op>
  return -1;
    8000524a:	557d                	li	a0,-1
}
    8000524c:	70ae                	ld	ra,232(sp)
    8000524e:	740e                	ld	s0,224(sp)
    80005250:	64ee                	ld	s1,216(sp)
    80005252:	694e                	ld	s2,208(sp)
    80005254:	69ae                	ld	s3,200(sp)
    80005256:	616d                	addi	sp,sp,240
    80005258:	8082                	ret

000000008000525a <sys_open>:

uint64
sys_open(void)
{
    8000525a:	7131                	addi	sp,sp,-192
    8000525c:	fd06                	sd	ra,184(sp)
    8000525e:	f922                	sd	s0,176(sp)
    80005260:	f526                	sd	s1,168(sp)
    80005262:	f14a                	sd	s2,160(sp)
    80005264:	ed4e                	sd	s3,152(sp)
    80005266:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    80005268:	08000613          	li	a2,128
    8000526c:	f5040593          	addi	a1,s0,-176
    80005270:	4501                	li	a0,0
    80005272:	ffffd097          	auipc	ra,0xffffd
    80005276:	2fc080e7          	jalr	764(ra) # 8000256e <argstr>
    return -1;
    8000527a:	54fd                	li	s1,-1
  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    8000527c:	0c054163          	bltz	a0,8000533e <sys_open+0xe4>
    80005280:	f4c40593          	addi	a1,s0,-180
    80005284:	4505                	li	a0,1
    80005286:	ffffd097          	auipc	ra,0xffffd
    8000528a:	2a4080e7          	jalr	676(ra) # 8000252a <argint>
    8000528e:	0a054863          	bltz	a0,8000533e <sys_open+0xe4>

  begin_op();
    80005292:	fffff097          	auipc	ra,0xfffff
    80005296:	a2e080e7          	jalr	-1490(ra) # 80003cc0 <begin_op>

  if(omode & O_CREATE){
    8000529a:	f4c42783          	lw	a5,-180(s0)
    8000529e:	2007f793          	andi	a5,a5,512
    800052a2:	cbdd                	beqz	a5,80005358 <sys_open+0xfe>
    ip = create(path, T_FILE, 0, 0);
    800052a4:	4681                	li	a3,0
    800052a6:	4601                	li	a2,0
    800052a8:	4589                	li	a1,2
    800052aa:	f5040513          	addi	a0,s0,-176
    800052ae:	00000097          	auipc	ra,0x0
    800052b2:	972080e7          	jalr	-1678(ra) # 80004c20 <create>
    800052b6:	892a                	mv	s2,a0
    if(ip == 0){
    800052b8:	c959                	beqz	a0,8000534e <sys_open+0xf4>
      end_op();
      return -1;
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    800052ba:	04491703          	lh	a4,68(s2)
    800052be:	478d                	li	a5,3
    800052c0:	00f71763          	bne	a4,a5,800052ce <sys_open+0x74>
    800052c4:	04695703          	lhu	a4,70(s2)
    800052c8:	47a5                	li	a5,9
    800052ca:	0ce7ec63          	bltu	a5,a4,800053a2 <sys_open+0x148>
    iunlockput(ip);
    end_op();
    return -1;
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    800052ce:	fffff097          	auipc	ra,0xfffff
    800052d2:	e02080e7          	jalr	-510(ra) # 800040d0 <filealloc>
    800052d6:	89aa                	mv	s3,a0
    800052d8:	10050263          	beqz	a0,800053dc <sys_open+0x182>
    800052dc:	00000097          	auipc	ra,0x0
    800052e0:	902080e7          	jalr	-1790(ra) # 80004bde <fdalloc>
    800052e4:	84aa                	mv	s1,a0
    800052e6:	0e054663          	bltz	a0,800053d2 <sys_open+0x178>
    iunlockput(ip);
    end_op();
    return -1;
  }

  if(ip->type == T_DEVICE){
    800052ea:	04491703          	lh	a4,68(s2)
    800052ee:	478d                	li	a5,3
    800052f0:	0cf70463          	beq	a4,a5,800053b8 <sys_open+0x15e>
    f->type = FD_DEVICE;
    f->major = ip->major;
  } else {
    f->type = FD_INODE;
    800052f4:	4789                	li	a5,2
    800052f6:	00f9a023          	sw	a5,0(s3)
    f->off = 0;
    800052fa:	0209a023          	sw	zero,32(s3)
  }
  f->ip = ip;
    800052fe:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80005302:	f4c42783          	lw	a5,-180(s0)
    80005306:	0017c713          	xori	a4,a5,1
    8000530a:	8b05                	andi	a4,a4,1
    8000530c:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80005310:	0037f713          	andi	a4,a5,3
    80005314:	00e03733          	snez	a4,a4
    80005318:	00e984a3          	sb	a4,9(s3)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    8000531c:	4007f793          	andi	a5,a5,1024
    80005320:	c791                	beqz	a5,8000532c <sys_open+0xd2>
    80005322:	04491703          	lh	a4,68(s2)
    80005326:	4789                	li	a5,2
    80005328:	08f70f63          	beq	a4,a5,800053c6 <sys_open+0x16c>
    itrunc(ip);
  }

  iunlock(ip);
    8000532c:	854a                	mv	a0,s2
    8000532e:	ffffe097          	auipc	ra,0xffffe
    80005332:	efa080e7          	jalr	-262(ra) # 80003228 <iunlock>
  end_op();
    80005336:	fffff097          	auipc	ra,0xfffff
    8000533a:	a0a080e7          	jalr	-1526(ra) # 80003d40 <end_op>

  return fd;
}
    8000533e:	8526                	mv	a0,s1
    80005340:	70ea                	ld	ra,184(sp)
    80005342:	744a                	ld	s0,176(sp)
    80005344:	74aa                	ld	s1,168(sp)
    80005346:	790a                	ld	s2,160(sp)
    80005348:	69ea                	ld	s3,152(sp)
    8000534a:	6129                	addi	sp,sp,192
    8000534c:	8082                	ret
      end_op();
    8000534e:	fffff097          	auipc	ra,0xfffff
    80005352:	9f2080e7          	jalr	-1550(ra) # 80003d40 <end_op>
      return -1;
    80005356:	b7e5                	j	8000533e <sys_open+0xe4>
    if((ip = namei(path)) == 0){
    80005358:	f5040513          	addi	a0,s0,-176
    8000535c:	ffffe097          	auipc	ra,0xffffe
    80005360:	5b6080e7          	jalr	1462(ra) # 80003912 <namei>
    80005364:	892a                	mv	s2,a0
    80005366:	c905                	beqz	a0,80005396 <sys_open+0x13c>
    ilock(ip);
    80005368:	ffffe097          	auipc	ra,0xffffe
    8000536c:	dfe080e7          	jalr	-514(ra) # 80003166 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    80005370:	04491703          	lh	a4,68(s2)
    80005374:	4785                	li	a5,1
    80005376:	f4f712e3          	bne	a4,a5,800052ba <sys_open+0x60>
    8000537a:	f4c42783          	lw	a5,-180(s0)
    8000537e:	dba1                	beqz	a5,800052ce <sys_open+0x74>
      iunlockput(ip);
    80005380:	854a                	mv	a0,s2
    80005382:	ffffe097          	auipc	ra,0xffffe
    80005386:	046080e7          	jalr	70(ra) # 800033c8 <iunlockput>
      end_op();
    8000538a:	fffff097          	auipc	ra,0xfffff
    8000538e:	9b6080e7          	jalr	-1610(ra) # 80003d40 <end_op>
      return -1;
    80005392:	54fd                	li	s1,-1
    80005394:	b76d                	j	8000533e <sys_open+0xe4>
      end_op();
    80005396:	fffff097          	auipc	ra,0xfffff
    8000539a:	9aa080e7          	jalr	-1622(ra) # 80003d40 <end_op>
      return -1;
    8000539e:	54fd                	li	s1,-1
    800053a0:	bf79                	j	8000533e <sys_open+0xe4>
    iunlockput(ip);
    800053a2:	854a                	mv	a0,s2
    800053a4:	ffffe097          	auipc	ra,0xffffe
    800053a8:	024080e7          	jalr	36(ra) # 800033c8 <iunlockput>
    end_op();
    800053ac:	fffff097          	auipc	ra,0xfffff
    800053b0:	994080e7          	jalr	-1644(ra) # 80003d40 <end_op>
    return -1;
    800053b4:	54fd                	li	s1,-1
    800053b6:	b761                	j	8000533e <sys_open+0xe4>
    f->type = FD_DEVICE;
    800053b8:	00f9a023          	sw	a5,0(s3)
    f->major = ip->major;
    800053bc:	04691783          	lh	a5,70(s2)
    800053c0:	02f99223          	sh	a5,36(s3)
    800053c4:	bf2d                	j	800052fe <sys_open+0xa4>
    itrunc(ip);
    800053c6:	854a                	mv	a0,s2
    800053c8:	ffffe097          	auipc	ra,0xffffe
    800053cc:	eac080e7          	jalr	-340(ra) # 80003274 <itrunc>
    800053d0:	bfb1                	j	8000532c <sys_open+0xd2>
      fileclose(f);
    800053d2:	854e                	mv	a0,s3
    800053d4:	fffff097          	auipc	ra,0xfffff
    800053d8:	db8080e7          	jalr	-584(ra) # 8000418c <fileclose>
    iunlockput(ip);
    800053dc:	854a                	mv	a0,s2
    800053de:	ffffe097          	auipc	ra,0xffffe
    800053e2:	fea080e7          	jalr	-22(ra) # 800033c8 <iunlockput>
    end_op();
    800053e6:	fffff097          	auipc	ra,0xfffff
    800053ea:	95a080e7          	jalr	-1702(ra) # 80003d40 <end_op>
    return -1;
    800053ee:	54fd                	li	s1,-1
    800053f0:	b7b9                	j	8000533e <sys_open+0xe4>

00000000800053f2 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    800053f2:	7175                	addi	sp,sp,-144
    800053f4:	e506                	sd	ra,136(sp)
    800053f6:	e122                	sd	s0,128(sp)
    800053f8:	0900                	addi	s0,sp,144
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800053fa:	fffff097          	auipc	ra,0xfffff
    800053fe:	8c6080e7          	jalr	-1850(ra) # 80003cc0 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    80005402:	08000613          	li	a2,128
    80005406:	f7040593          	addi	a1,s0,-144
    8000540a:	4501                	li	a0,0
    8000540c:	ffffd097          	auipc	ra,0xffffd
    80005410:	162080e7          	jalr	354(ra) # 8000256e <argstr>
    80005414:	02054963          	bltz	a0,80005446 <sys_mkdir+0x54>
    80005418:	4681                	li	a3,0
    8000541a:	4601                	li	a2,0
    8000541c:	4585                	li	a1,1
    8000541e:	f7040513          	addi	a0,s0,-144
    80005422:	fffff097          	auipc	ra,0xfffff
    80005426:	7fe080e7          	jalr	2046(ra) # 80004c20 <create>
    8000542a:	cd11                	beqz	a0,80005446 <sys_mkdir+0x54>
    end_op();
    return -1;
  }
  iunlockput(ip);
    8000542c:	ffffe097          	auipc	ra,0xffffe
    80005430:	f9c080e7          	jalr	-100(ra) # 800033c8 <iunlockput>
  end_op();
    80005434:	fffff097          	auipc	ra,0xfffff
    80005438:	90c080e7          	jalr	-1780(ra) # 80003d40 <end_op>
  return 0;
    8000543c:	4501                	li	a0,0
}
    8000543e:	60aa                	ld	ra,136(sp)
    80005440:	640a                	ld	s0,128(sp)
    80005442:	6149                	addi	sp,sp,144
    80005444:	8082                	ret
    end_op();
    80005446:	fffff097          	auipc	ra,0xfffff
    8000544a:	8fa080e7          	jalr	-1798(ra) # 80003d40 <end_op>
    return -1;
    8000544e:	557d                	li	a0,-1
    80005450:	b7fd                	j	8000543e <sys_mkdir+0x4c>

0000000080005452 <sys_mknod>:

uint64
sys_mknod(void)
{
    80005452:	7135                	addi	sp,sp,-160
    80005454:	ed06                	sd	ra,152(sp)
    80005456:	e922                	sd	s0,144(sp)
    80005458:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    8000545a:	fffff097          	auipc	ra,0xfffff
    8000545e:	866080e7          	jalr	-1946(ra) # 80003cc0 <begin_op>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80005462:	08000613          	li	a2,128
    80005466:	f7040593          	addi	a1,s0,-144
    8000546a:	4501                	li	a0,0
    8000546c:	ffffd097          	auipc	ra,0xffffd
    80005470:	102080e7          	jalr	258(ra) # 8000256e <argstr>
    80005474:	04054a63          	bltz	a0,800054c8 <sys_mknod+0x76>
     argint(1, &major) < 0 ||
    80005478:	f6c40593          	addi	a1,s0,-148
    8000547c:	4505                	li	a0,1
    8000547e:	ffffd097          	auipc	ra,0xffffd
    80005482:	0ac080e7          	jalr	172(ra) # 8000252a <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80005486:	04054163          	bltz	a0,800054c8 <sys_mknod+0x76>
     argint(2, &minor) < 0 ||
    8000548a:	f6840593          	addi	a1,s0,-152
    8000548e:	4509                	li	a0,2
    80005490:	ffffd097          	auipc	ra,0xffffd
    80005494:	09a080e7          	jalr	154(ra) # 8000252a <argint>
     argint(1, &major) < 0 ||
    80005498:	02054863          	bltz	a0,800054c8 <sys_mknod+0x76>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    8000549c:	f6841683          	lh	a3,-152(s0)
    800054a0:	f6c41603          	lh	a2,-148(s0)
    800054a4:	458d                	li	a1,3
    800054a6:	f7040513          	addi	a0,s0,-144
    800054aa:	fffff097          	auipc	ra,0xfffff
    800054ae:	776080e7          	jalr	1910(ra) # 80004c20 <create>
     argint(2, &minor) < 0 ||
    800054b2:	c919                	beqz	a0,800054c8 <sys_mknod+0x76>
    end_op();
    return -1;
  }
  iunlockput(ip);
    800054b4:	ffffe097          	auipc	ra,0xffffe
    800054b8:	f14080e7          	jalr	-236(ra) # 800033c8 <iunlockput>
  end_op();
    800054bc:	fffff097          	auipc	ra,0xfffff
    800054c0:	884080e7          	jalr	-1916(ra) # 80003d40 <end_op>
  return 0;
    800054c4:	4501                	li	a0,0
    800054c6:	a031                	j	800054d2 <sys_mknod+0x80>
    end_op();
    800054c8:	fffff097          	auipc	ra,0xfffff
    800054cc:	878080e7          	jalr	-1928(ra) # 80003d40 <end_op>
    return -1;
    800054d0:	557d                	li	a0,-1
}
    800054d2:	60ea                	ld	ra,152(sp)
    800054d4:	644a                	ld	s0,144(sp)
    800054d6:	610d                	addi	sp,sp,160
    800054d8:	8082                	ret

00000000800054da <sys_chdir>:

uint64
sys_chdir(void)
{
    800054da:	7135                	addi	sp,sp,-160
    800054dc:	ed06                	sd	ra,152(sp)
    800054de:	e922                	sd	s0,144(sp)
    800054e0:	e526                	sd	s1,136(sp)
    800054e2:	e14a                	sd	s2,128(sp)
    800054e4:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800054e6:	ffffc097          	auipc	ra,0xffffc
    800054ea:	f86080e7          	jalr	-122(ra) # 8000146c <myproc>
    800054ee:	892a                	mv	s2,a0
  
  begin_op();
    800054f0:	ffffe097          	auipc	ra,0xffffe
    800054f4:	7d0080e7          	jalr	2000(ra) # 80003cc0 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800054f8:	08000613          	li	a2,128
    800054fc:	f6040593          	addi	a1,s0,-160
    80005500:	4501                	li	a0,0
    80005502:	ffffd097          	auipc	ra,0xffffd
    80005506:	06c080e7          	jalr	108(ra) # 8000256e <argstr>
    8000550a:	04054b63          	bltz	a0,80005560 <sys_chdir+0x86>
    8000550e:	f6040513          	addi	a0,s0,-160
    80005512:	ffffe097          	auipc	ra,0xffffe
    80005516:	400080e7          	jalr	1024(ra) # 80003912 <namei>
    8000551a:	84aa                	mv	s1,a0
    8000551c:	c131                	beqz	a0,80005560 <sys_chdir+0x86>
    end_op();
    return -1;
  }
  ilock(ip);
    8000551e:	ffffe097          	auipc	ra,0xffffe
    80005522:	c48080e7          	jalr	-952(ra) # 80003166 <ilock>
  if(ip->type != T_DIR){
    80005526:	04449703          	lh	a4,68(s1)
    8000552a:	4785                	li	a5,1
    8000552c:	04f71063          	bne	a4,a5,8000556c <sys_chdir+0x92>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
    80005530:	8526                	mv	a0,s1
    80005532:	ffffe097          	auipc	ra,0xffffe
    80005536:	cf6080e7          	jalr	-778(ra) # 80003228 <iunlock>
  iput(p->cwd);
    8000553a:	15093503          	ld	a0,336(s2)
    8000553e:	ffffe097          	auipc	ra,0xffffe
    80005542:	de2080e7          	jalr	-542(ra) # 80003320 <iput>
  end_op();
    80005546:	ffffe097          	auipc	ra,0xffffe
    8000554a:	7fa080e7          	jalr	2042(ra) # 80003d40 <end_op>
  p->cwd = ip;
    8000554e:	14993823          	sd	s1,336(s2)
  return 0;
    80005552:	4501                	li	a0,0
}
    80005554:	60ea                	ld	ra,152(sp)
    80005556:	644a                	ld	s0,144(sp)
    80005558:	64aa                	ld	s1,136(sp)
    8000555a:	690a                	ld	s2,128(sp)
    8000555c:	610d                	addi	sp,sp,160
    8000555e:	8082                	ret
    end_op();
    80005560:	ffffe097          	auipc	ra,0xffffe
    80005564:	7e0080e7          	jalr	2016(ra) # 80003d40 <end_op>
    return -1;
    80005568:	557d                	li	a0,-1
    8000556a:	b7ed                	j	80005554 <sys_chdir+0x7a>
    iunlockput(ip);
    8000556c:	8526                	mv	a0,s1
    8000556e:	ffffe097          	auipc	ra,0xffffe
    80005572:	e5a080e7          	jalr	-422(ra) # 800033c8 <iunlockput>
    end_op();
    80005576:	ffffe097          	auipc	ra,0xffffe
    8000557a:	7ca080e7          	jalr	1994(ra) # 80003d40 <end_op>
    return -1;
    8000557e:	557d                	li	a0,-1
    80005580:	bfd1                	j	80005554 <sys_chdir+0x7a>

0000000080005582 <sys_exec>:

uint64
sys_exec(void)
{
    80005582:	7145                	addi	sp,sp,-464
    80005584:	e786                	sd	ra,456(sp)
    80005586:	e3a2                	sd	s0,448(sp)
    80005588:	ff26                	sd	s1,440(sp)
    8000558a:	fb4a                	sd	s2,432(sp)
    8000558c:	f74e                	sd	s3,424(sp)
    8000558e:	f352                	sd	s4,416(sp)
    80005590:	ef56                	sd	s5,408(sp)
    80005592:	0b80                	addi	s0,sp,464
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    80005594:	08000613          	li	a2,128
    80005598:	f4040593          	addi	a1,s0,-192
    8000559c:	4501                	li	a0,0
    8000559e:	ffffd097          	auipc	ra,0xffffd
    800055a2:	fd0080e7          	jalr	-48(ra) # 8000256e <argstr>
    return -1;
    800055a6:	597d                	li	s2,-1
  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    800055a8:	0c054a63          	bltz	a0,8000567c <sys_exec+0xfa>
    800055ac:	e3840593          	addi	a1,s0,-456
    800055b0:	4505                	li	a0,1
    800055b2:	ffffd097          	auipc	ra,0xffffd
    800055b6:	f9a080e7          	jalr	-102(ra) # 8000254c <argaddr>
    800055ba:	0c054163          	bltz	a0,8000567c <sys_exec+0xfa>
  }
  memset(argv, 0, sizeof(argv));
    800055be:	10000613          	li	a2,256
    800055c2:	4581                	li	a1,0
    800055c4:	e4040513          	addi	a0,s0,-448
    800055c8:	ffffb097          	auipc	ra,0xffffb
    800055cc:	bb0080e7          	jalr	-1104(ra) # 80000178 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    800055d0:	e4040493          	addi	s1,s0,-448
  memset(argv, 0, sizeof(argv));
    800055d4:	89a6                	mv	s3,s1
    800055d6:	4901                	li	s2,0
    if(i >= NELEM(argv)){
    800055d8:	02000a13          	li	s4,32
    800055dc:	00090a9b          	sext.w	s5,s2
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    800055e0:	00391513          	slli	a0,s2,0x3
    800055e4:	e3040593          	addi	a1,s0,-464
    800055e8:	e3843783          	ld	a5,-456(s0)
    800055ec:	953e                	add	a0,a0,a5
    800055ee:	ffffd097          	auipc	ra,0xffffd
    800055f2:	ea2080e7          	jalr	-350(ra) # 80002490 <fetchaddr>
    800055f6:	02054a63          	bltz	a0,8000562a <sys_exec+0xa8>
      goto bad;
    }
    if(uarg == 0){
    800055fa:	e3043783          	ld	a5,-464(s0)
    800055fe:	c3b9                	beqz	a5,80005644 <sys_exec+0xc2>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    80005600:	ffffb097          	auipc	ra,0xffffb
    80005604:	b18080e7          	jalr	-1256(ra) # 80000118 <kalloc>
    80005608:	85aa                	mv	a1,a0
    8000560a:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    8000560e:	cd11                	beqz	a0,8000562a <sys_exec+0xa8>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80005610:	6605                	lui	a2,0x1
    80005612:	e3043503          	ld	a0,-464(s0)
    80005616:	ffffd097          	auipc	ra,0xffffd
    8000561a:	ecc080e7          	jalr	-308(ra) # 800024e2 <fetchstr>
    8000561e:	00054663          	bltz	a0,8000562a <sys_exec+0xa8>
    if(i >= NELEM(argv)){
    80005622:	0905                	addi	s2,s2,1
    80005624:	09a1                	addi	s3,s3,8
    80005626:	fb491be3          	bne	s2,s4,800055dc <sys_exec+0x5a>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000562a:	10048913          	addi	s2,s1,256
    8000562e:	6088                	ld	a0,0(s1)
    80005630:	c529                	beqz	a0,8000567a <sys_exec+0xf8>
    kfree(argv[i]);
    80005632:	ffffb097          	auipc	ra,0xffffb
    80005636:	9ea080e7          	jalr	-1558(ra) # 8000001c <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000563a:	04a1                	addi	s1,s1,8
    8000563c:	ff2499e3          	bne	s1,s2,8000562e <sys_exec+0xac>
  return -1;
    80005640:	597d                	li	s2,-1
    80005642:	a82d                	j	8000567c <sys_exec+0xfa>
      argv[i] = 0;
    80005644:	0a8e                	slli	s5,s5,0x3
    80005646:	fc040793          	addi	a5,s0,-64
    8000564a:	9abe                	add	s5,s5,a5
    8000564c:	e80ab023          	sd	zero,-384(s5)
  int ret = exec(path, argv);
    80005650:	e4040593          	addi	a1,s0,-448
    80005654:	f4040513          	addi	a0,s0,-192
    80005658:	fffff097          	auipc	ra,0xfffff
    8000565c:	194080e7          	jalr	404(ra) # 800047ec <exec>
    80005660:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80005662:	10048993          	addi	s3,s1,256
    80005666:	6088                	ld	a0,0(s1)
    80005668:	c911                	beqz	a0,8000567c <sys_exec+0xfa>
    kfree(argv[i]);
    8000566a:	ffffb097          	auipc	ra,0xffffb
    8000566e:	9b2080e7          	jalr	-1614(ra) # 8000001c <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80005672:	04a1                	addi	s1,s1,8
    80005674:	ff3499e3          	bne	s1,s3,80005666 <sys_exec+0xe4>
    80005678:	a011                	j	8000567c <sys_exec+0xfa>
  return -1;
    8000567a:	597d                	li	s2,-1
}
    8000567c:	854a                	mv	a0,s2
    8000567e:	60be                	ld	ra,456(sp)
    80005680:	641e                	ld	s0,448(sp)
    80005682:	74fa                	ld	s1,440(sp)
    80005684:	795a                	ld	s2,432(sp)
    80005686:	79ba                	ld	s3,424(sp)
    80005688:	7a1a                	ld	s4,416(sp)
    8000568a:	6afa                	ld	s5,408(sp)
    8000568c:	6179                	addi	sp,sp,464
    8000568e:	8082                	ret

0000000080005690 <sys_pipe>:

uint64
sys_pipe(void)
{
    80005690:	7139                	addi	sp,sp,-64
    80005692:	fc06                	sd	ra,56(sp)
    80005694:	f822                	sd	s0,48(sp)
    80005696:	f426                	sd	s1,40(sp)
    80005698:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    8000569a:	ffffc097          	auipc	ra,0xffffc
    8000569e:	dd2080e7          	jalr	-558(ra) # 8000146c <myproc>
    800056a2:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    800056a4:	fd840593          	addi	a1,s0,-40
    800056a8:	4501                	li	a0,0
    800056aa:	ffffd097          	auipc	ra,0xffffd
    800056ae:	ea2080e7          	jalr	-350(ra) # 8000254c <argaddr>
    return -1;
    800056b2:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    800056b4:	0e054063          	bltz	a0,80005794 <sys_pipe+0x104>
  if(pipealloc(&rf, &wf) < 0)
    800056b8:	fc840593          	addi	a1,s0,-56
    800056bc:	fd040513          	addi	a0,s0,-48
    800056c0:	fffff097          	auipc	ra,0xfffff
    800056c4:	dfc080e7          	jalr	-516(ra) # 800044bc <pipealloc>
    return -1;
    800056c8:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    800056ca:	0c054563          	bltz	a0,80005794 <sys_pipe+0x104>
  fd0 = -1;
    800056ce:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    800056d2:	fd043503          	ld	a0,-48(s0)
    800056d6:	fffff097          	auipc	ra,0xfffff
    800056da:	508080e7          	jalr	1288(ra) # 80004bde <fdalloc>
    800056de:	fca42223          	sw	a0,-60(s0)
    800056e2:	08054c63          	bltz	a0,8000577a <sys_pipe+0xea>
    800056e6:	fc843503          	ld	a0,-56(s0)
    800056ea:	fffff097          	auipc	ra,0xfffff
    800056ee:	4f4080e7          	jalr	1268(ra) # 80004bde <fdalloc>
    800056f2:	fca42023          	sw	a0,-64(s0)
    800056f6:	06054863          	bltz	a0,80005766 <sys_pipe+0xd6>
      p->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800056fa:	4691                	li	a3,4
    800056fc:	fc440613          	addi	a2,s0,-60
    80005700:	fd843583          	ld	a1,-40(s0)
    80005704:	68a8                	ld	a0,80(s1)
    80005706:	ffffb097          	auipc	ra,0xffffb
    8000570a:	422080e7          	jalr	1058(ra) # 80000b28 <copyout>
    8000570e:	02054063          	bltz	a0,8000572e <sys_pipe+0x9e>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80005712:	4691                	li	a3,4
    80005714:	fc040613          	addi	a2,s0,-64
    80005718:	fd843583          	ld	a1,-40(s0)
    8000571c:	0591                	addi	a1,a1,4
    8000571e:	68a8                	ld	a0,80(s1)
    80005720:	ffffb097          	auipc	ra,0xffffb
    80005724:	408080e7          	jalr	1032(ra) # 80000b28 <copyout>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80005728:	4781                	li	a5,0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    8000572a:	06055563          	bgez	a0,80005794 <sys_pipe+0x104>
    p->ofile[fd0] = 0;
    8000572e:	fc442783          	lw	a5,-60(s0)
    80005732:	07e9                	addi	a5,a5,26
    80005734:	078e                	slli	a5,a5,0x3
    80005736:	97a6                	add	a5,a5,s1
    80005738:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    8000573c:	fc042503          	lw	a0,-64(s0)
    80005740:	0569                	addi	a0,a0,26
    80005742:	050e                	slli	a0,a0,0x3
    80005744:	9526                	add	a0,a0,s1
    80005746:	00053023          	sd	zero,0(a0)
    fileclose(rf);
    8000574a:	fd043503          	ld	a0,-48(s0)
    8000574e:	fffff097          	auipc	ra,0xfffff
    80005752:	a3e080e7          	jalr	-1474(ra) # 8000418c <fileclose>
    fileclose(wf);
    80005756:	fc843503          	ld	a0,-56(s0)
    8000575a:	fffff097          	auipc	ra,0xfffff
    8000575e:	a32080e7          	jalr	-1486(ra) # 8000418c <fileclose>
    return -1;
    80005762:	57fd                	li	a5,-1
    80005764:	a805                	j	80005794 <sys_pipe+0x104>
    if(fd0 >= 0)
    80005766:	fc442783          	lw	a5,-60(s0)
    8000576a:	0007c863          	bltz	a5,8000577a <sys_pipe+0xea>
      p->ofile[fd0] = 0;
    8000576e:	01a78513          	addi	a0,a5,26
    80005772:	050e                	slli	a0,a0,0x3
    80005774:	9526                	add	a0,a0,s1
    80005776:	00053023          	sd	zero,0(a0)
    fileclose(rf);
    8000577a:	fd043503          	ld	a0,-48(s0)
    8000577e:	fffff097          	auipc	ra,0xfffff
    80005782:	a0e080e7          	jalr	-1522(ra) # 8000418c <fileclose>
    fileclose(wf);
    80005786:	fc843503          	ld	a0,-56(s0)
    8000578a:	fffff097          	auipc	ra,0xfffff
    8000578e:	a02080e7          	jalr	-1534(ra) # 8000418c <fileclose>
    return -1;
    80005792:	57fd                	li	a5,-1
}
    80005794:	853e                	mv	a0,a5
    80005796:	70e2                	ld	ra,56(sp)
    80005798:	7442                	ld	s0,48(sp)
    8000579a:	74a2                	ld	s1,40(sp)
    8000579c:	6121                	addi	sp,sp,64
    8000579e:	8082                	ret

00000000800057a0 <kernelvec>:
    800057a0:	7111                	addi	sp,sp,-256
    800057a2:	e006                	sd	ra,0(sp)
    800057a4:	e40a                	sd	sp,8(sp)
    800057a6:	e80e                	sd	gp,16(sp)
    800057a8:	ec12                	sd	tp,24(sp)
    800057aa:	f016                	sd	t0,32(sp)
    800057ac:	f41a                	sd	t1,40(sp)
    800057ae:	f81e                	sd	t2,48(sp)
    800057b0:	fc22                	sd	s0,56(sp)
    800057b2:	e0a6                	sd	s1,64(sp)
    800057b4:	e4aa                	sd	a0,72(sp)
    800057b6:	e8ae                	sd	a1,80(sp)
    800057b8:	ecb2                	sd	a2,88(sp)
    800057ba:	f0b6                	sd	a3,96(sp)
    800057bc:	f4ba                	sd	a4,104(sp)
    800057be:	f8be                	sd	a5,112(sp)
    800057c0:	fcc2                	sd	a6,120(sp)
    800057c2:	e146                	sd	a7,128(sp)
    800057c4:	e54a                	sd	s2,136(sp)
    800057c6:	e94e                	sd	s3,144(sp)
    800057c8:	ed52                	sd	s4,152(sp)
    800057ca:	f156                	sd	s5,160(sp)
    800057cc:	f55a                	sd	s6,168(sp)
    800057ce:	f95e                	sd	s7,176(sp)
    800057d0:	fd62                	sd	s8,184(sp)
    800057d2:	e1e6                	sd	s9,192(sp)
    800057d4:	e5ea                	sd	s10,200(sp)
    800057d6:	e9ee                	sd	s11,208(sp)
    800057d8:	edf2                	sd	t3,216(sp)
    800057da:	f1f6                	sd	t4,224(sp)
    800057dc:	f5fa                	sd	t5,232(sp)
    800057de:	f9fe                	sd	t6,240(sp)
    800057e0:	b7dfc0ef          	jal	ra,8000235c <kerneltrap>
    800057e4:	6082                	ld	ra,0(sp)
    800057e6:	6122                	ld	sp,8(sp)
    800057e8:	61c2                	ld	gp,16(sp)
    800057ea:	7282                	ld	t0,32(sp)
    800057ec:	7322                	ld	t1,40(sp)
    800057ee:	73c2                	ld	t2,48(sp)
    800057f0:	7462                	ld	s0,56(sp)
    800057f2:	6486                	ld	s1,64(sp)
    800057f4:	6526                	ld	a0,72(sp)
    800057f6:	65c6                	ld	a1,80(sp)
    800057f8:	6666                	ld	a2,88(sp)
    800057fa:	7686                	ld	a3,96(sp)
    800057fc:	7726                	ld	a4,104(sp)
    800057fe:	77c6                	ld	a5,112(sp)
    80005800:	7866                	ld	a6,120(sp)
    80005802:	688a                	ld	a7,128(sp)
    80005804:	692a                	ld	s2,136(sp)
    80005806:	69ca                	ld	s3,144(sp)
    80005808:	6a6a                	ld	s4,152(sp)
    8000580a:	7a8a                	ld	s5,160(sp)
    8000580c:	7b2a                	ld	s6,168(sp)
    8000580e:	7bca                	ld	s7,176(sp)
    80005810:	7c6a                	ld	s8,184(sp)
    80005812:	6c8e                	ld	s9,192(sp)
    80005814:	6d2e                	ld	s10,200(sp)
    80005816:	6dce                	ld	s11,208(sp)
    80005818:	6e6e                	ld	t3,216(sp)
    8000581a:	7e8e                	ld	t4,224(sp)
    8000581c:	7f2e                	ld	t5,232(sp)
    8000581e:	7fce                	ld	t6,240(sp)
    80005820:	6111                	addi	sp,sp,256
    80005822:	10200073          	sret
    80005826:	00000013          	nop
    8000582a:	00000013          	nop
    8000582e:	0001                	nop

0000000080005830 <timervec>:
    80005830:	34051573          	csrrw	a0,mscratch,a0
    80005834:	e10c                	sd	a1,0(a0)
    80005836:	e510                	sd	a2,8(a0)
    80005838:	e914                	sd	a3,16(a0)
    8000583a:	6d0c                	ld	a1,24(a0)
    8000583c:	7110                	ld	a2,32(a0)
    8000583e:	6194                	ld	a3,0(a1)
    80005840:	96b2                	add	a3,a3,a2
    80005842:	e194                	sd	a3,0(a1)
    80005844:	4589                	li	a1,2
    80005846:	14459073          	csrw	sip,a1
    8000584a:	6914                	ld	a3,16(a0)
    8000584c:	6510                	ld	a2,8(a0)
    8000584e:	610c                	ld	a1,0(a0)
    80005850:	34051573          	csrrw	a0,mscratch,a0
    80005854:	30200073          	mret
	...

000000008000585a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    8000585a:	1141                	addi	sp,sp,-16
    8000585c:	e422                	sd	s0,8(sp)
    8000585e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80005860:	0c0007b7          	lui	a5,0xc000
    80005864:	4705                	li	a4,1
    80005866:	d798                	sw	a4,40(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80005868:	c3d8                	sw	a4,4(a5)
}
    8000586a:	6422                	ld	s0,8(sp)
    8000586c:	0141                	addi	sp,sp,16
    8000586e:	8082                	ret

0000000080005870 <plicinithart>:

void
plicinithart(void)
{
    80005870:	1141                	addi	sp,sp,-16
    80005872:	e406                	sd	ra,8(sp)
    80005874:	e022                	sd	s0,0(sp)
    80005876:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80005878:	ffffc097          	auipc	ra,0xffffc
    8000587c:	bc8080e7          	jalr	-1080(ra) # 80001440 <cpuid>
  
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80005880:	0085171b          	slliw	a4,a0,0x8
    80005884:	0c0027b7          	lui	a5,0xc002
    80005888:	97ba                	add	a5,a5,a4
    8000588a:	40200713          	li	a4,1026
    8000588e:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80005892:	00d5151b          	slliw	a0,a0,0xd
    80005896:	0c2017b7          	lui	a5,0xc201
    8000589a:	953e                	add	a0,a0,a5
    8000589c:	00052023          	sw	zero,0(a0)
}
    800058a0:	60a2                	ld	ra,8(sp)
    800058a2:	6402                	ld	s0,0(sp)
    800058a4:	0141                	addi	sp,sp,16
    800058a6:	8082                	ret

00000000800058a8 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    800058a8:	1141                	addi	sp,sp,-16
    800058aa:	e406                	sd	ra,8(sp)
    800058ac:	e022                	sd	s0,0(sp)
    800058ae:	0800                	addi	s0,sp,16
  int hart = cpuid();
    800058b0:	ffffc097          	auipc	ra,0xffffc
    800058b4:	b90080e7          	jalr	-1136(ra) # 80001440 <cpuid>
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    800058b8:	00d5179b          	slliw	a5,a0,0xd
    800058bc:	0c201537          	lui	a0,0xc201
    800058c0:	953e                	add	a0,a0,a5
  return irq;
}
    800058c2:	4148                	lw	a0,4(a0)
    800058c4:	60a2                	ld	ra,8(sp)
    800058c6:	6402                	ld	s0,0(sp)
    800058c8:	0141                	addi	sp,sp,16
    800058ca:	8082                	ret

00000000800058cc <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    800058cc:	1101                	addi	sp,sp,-32
    800058ce:	ec06                	sd	ra,24(sp)
    800058d0:	e822                	sd	s0,16(sp)
    800058d2:	e426                	sd	s1,8(sp)
    800058d4:	1000                	addi	s0,sp,32
    800058d6:	84aa                	mv	s1,a0
  int hart = cpuid();
    800058d8:	ffffc097          	auipc	ra,0xffffc
    800058dc:	b68080e7          	jalr	-1176(ra) # 80001440 <cpuid>
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    800058e0:	00d5151b          	slliw	a0,a0,0xd
    800058e4:	0c2017b7          	lui	a5,0xc201
    800058e8:	97aa                	add	a5,a5,a0
    800058ea:	c3c4                	sw	s1,4(a5)
}
    800058ec:	60e2                	ld	ra,24(sp)
    800058ee:	6442                	ld	s0,16(sp)
    800058f0:	64a2                	ld	s1,8(sp)
    800058f2:	6105                	addi	sp,sp,32
    800058f4:	8082                	ret

00000000800058f6 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    800058f6:	1141                	addi	sp,sp,-16
    800058f8:	e406                	sd	ra,8(sp)
    800058fa:	e022                	sd	s0,0(sp)
    800058fc:	0800                	addi	s0,sp,16
  if(i >= NUM)
    800058fe:	479d                	li	a5,7
    80005900:	06a7c963          	blt	a5,a0,80005972 <free_desc+0x7c>
    panic("free_desc 1");
  if(disk.free[i])
    80005904:	00015797          	auipc	a5,0x15
    80005908:	6fc78793          	addi	a5,a5,1788 # 8001b000 <disk>
    8000590c:	00a78733          	add	a4,a5,a0
    80005910:	6789                	lui	a5,0x2
    80005912:	97ba                	add	a5,a5,a4
    80005914:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x7fffdfe8>
    80005918:	e7ad                	bnez	a5,80005982 <free_desc+0x8c>
    panic("free_desc 2");
  disk.desc[i].addr = 0;
    8000591a:	00451793          	slli	a5,a0,0x4
    8000591e:	00017717          	auipc	a4,0x17
    80005922:	6e270713          	addi	a4,a4,1762 # 8001d000 <disk+0x2000>
    80005926:	6314                	ld	a3,0(a4)
    80005928:	96be                	add	a3,a3,a5
    8000592a:	0006b023          	sd	zero,0(a3)
  disk.desc[i].len = 0;
    8000592e:	6314                	ld	a3,0(a4)
    80005930:	96be                	add	a3,a3,a5
    80005932:	0006a423          	sw	zero,8(a3)
  disk.desc[i].flags = 0;
    80005936:	6314                	ld	a3,0(a4)
    80005938:	96be                	add	a3,a3,a5
    8000593a:	00069623          	sh	zero,12(a3)
  disk.desc[i].next = 0;
    8000593e:	6318                	ld	a4,0(a4)
    80005940:	97ba                	add	a5,a5,a4
    80005942:	00079723          	sh	zero,14(a5)
  disk.free[i] = 1;
    80005946:	00015797          	auipc	a5,0x15
    8000594a:	6ba78793          	addi	a5,a5,1722 # 8001b000 <disk>
    8000594e:	97aa                	add	a5,a5,a0
    80005950:	6509                	lui	a0,0x2
    80005952:	953e                	add	a0,a0,a5
    80005954:	4785                	li	a5,1
    80005956:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x7fffdfe8>
  wakeup(&disk.free[0]);
    8000595a:	00017517          	auipc	a0,0x17
    8000595e:	6be50513          	addi	a0,a0,1726 # 8001d018 <disk+0x2018>
    80005962:	ffffc097          	auipc	ra,0xffffc
    80005966:	352080e7          	jalr	850(ra) # 80001cb4 <wakeup>
}
    8000596a:	60a2                	ld	ra,8(sp)
    8000596c:	6402                	ld	s0,0(sp)
    8000596e:	0141                	addi	sp,sp,16
    80005970:	8082                	ret
    panic("free_desc 1");
    80005972:	00003517          	auipc	a0,0x3
    80005976:	f6650513          	addi	a0,a0,-154 # 800088d8 <syscalls+0x418>
    8000597a:	00001097          	auipc	ra,0x1
    8000597e:	d2e080e7          	jalr	-722(ra) # 800066a8 <panic>
    panic("free_desc 2");
    80005982:	00003517          	auipc	a0,0x3
    80005986:	f6650513          	addi	a0,a0,-154 # 800088e8 <syscalls+0x428>
    8000598a:	00001097          	auipc	ra,0x1
    8000598e:	d1e080e7          	jalr	-738(ra) # 800066a8 <panic>

0000000080005992 <virtio_disk_init>:
{
    80005992:	1101                	addi	sp,sp,-32
    80005994:	ec06                	sd	ra,24(sp)
    80005996:	e822                	sd	s0,16(sp)
    80005998:	e426                	sd	s1,8(sp)
    8000599a:	1000                	addi	s0,sp,32
  initlock(&disk.vdisk_lock, "virtio_disk");
    8000599c:	00003597          	auipc	a1,0x3
    800059a0:	f5c58593          	addi	a1,a1,-164 # 800088f8 <syscalls+0x438>
    800059a4:	00017517          	auipc	a0,0x17
    800059a8:	78450513          	addi	a0,a0,1924 # 8001d128 <disk+0x2128>
    800059ac:	00001097          	auipc	ra,0x1
    800059b0:	1b6080e7          	jalr	438(ra) # 80006b62 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    800059b4:	100017b7          	lui	a5,0x10001
    800059b8:	4398                	lw	a4,0(a5)
    800059ba:	2701                	sext.w	a4,a4
    800059bc:	747277b7          	lui	a5,0x74727
    800059c0:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    800059c4:	0ef71163          	bne	a4,a5,80005aa6 <virtio_disk_init+0x114>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    800059c8:	100017b7          	lui	a5,0x10001
    800059cc:	43dc                	lw	a5,4(a5)
    800059ce:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    800059d0:	4705                	li	a4,1
    800059d2:	0ce79a63          	bne	a5,a4,80005aa6 <virtio_disk_init+0x114>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    800059d6:	100017b7          	lui	a5,0x10001
    800059da:	479c                	lw	a5,8(a5)
    800059dc:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    800059de:	4709                	li	a4,2
    800059e0:	0ce79363          	bne	a5,a4,80005aa6 <virtio_disk_init+0x114>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    800059e4:	100017b7          	lui	a5,0x10001
    800059e8:	47d8                	lw	a4,12(a5)
    800059ea:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    800059ec:	554d47b7          	lui	a5,0x554d4
    800059f0:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    800059f4:	0af71963          	bne	a4,a5,80005aa6 <virtio_disk_init+0x114>
  *R(VIRTIO_MMIO_STATUS) = status;
    800059f8:	100017b7          	lui	a5,0x10001
    800059fc:	4705                	li	a4,1
    800059fe:	dbb8                	sw	a4,112(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80005a00:	470d                	li	a4,3
    80005a02:	dbb8                	sw	a4,112(a5)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80005a04:	4b94                	lw	a3,16(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80005a06:	c7ffe737          	lui	a4,0xc7ffe
    80005a0a:	75f70713          	addi	a4,a4,1887 # ffffffffc7ffe75f <end+0xffffffff47fd851f>
    80005a0e:	8f75                	and	a4,a4,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80005a10:	2701                	sext.w	a4,a4
    80005a12:	d398                	sw	a4,32(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80005a14:	472d                	li	a4,11
    80005a16:	dbb8                	sw	a4,112(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80005a18:	473d                	li	a4,15
    80005a1a:	dbb8                	sw	a4,112(a5)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80005a1c:	6705                	lui	a4,0x1
    80005a1e:	d798                	sw	a4,40(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80005a20:	0207a823          	sw	zero,48(a5) # 10001030 <_entry-0x6fffefd0>
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80005a24:	5bdc                	lw	a5,52(a5)
    80005a26:	2781                	sext.w	a5,a5
  if(max == 0)
    80005a28:	c7d9                	beqz	a5,80005ab6 <virtio_disk_init+0x124>
  if(max < NUM)
    80005a2a:	471d                	li	a4,7
    80005a2c:	08f77d63          	bgeu	a4,a5,80005ac6 <virtio_disk_init+0x134>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80005a30:	100014b7          	lui	s1,0x10001
    80005a34:	47a1                	li	a5,8
    80005a36:	dc9c                	sw	a5,56(s1)
  memset(disk.pages, 0, sizeof(disk.pages));
    80005a38:	6609                	lui	a2,0x2
    80005a3a:	4581                	li	a1,0
    80005a3c:	00015517          	auipc	a0,0x15
    80005a40:	5c450513          	addi	a0,a0,1476 # 8001b000 <disk>
    80005a44:	ffffa097          	auipc	ra,0xffffa
    80005a48:	734080e7          	jalr	1844(ra) # 80000178 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80005a4c:	00015717          	auipc	a4,0x15
    80005a50:	5b470713          	addi	a4,a4,1460 # 8001b000 <disk>
    80005a54:	00c75793          	srli	a5,a4,0xc
    80005a58:	2781                	sext.w	a5,a5
    80005a5a:	c0bc                	sw	a5,64(s1)
  disk.desc = (struct virtq_desc *) disk.pages;
    80005a5c:	00017797          	auipc	a5,0x17
    80005a60:	5a478793          	addi	a5,a5,1444 # 8001d000 <disk+0x2000>
    80005a64:	e398                	sd	a4,0(a5)
  disk.avail = (struct virtq_avail *)(disk.pages + NUM*sizeof(struct virtq_desc));
    80005a66:	00015717          	auipc	a4,0x15
    80005a6a:	61a70713          	addi	a4,a4,1562 # 8001b080 <disk+0x80>
    80005a6e:	e798                	sd	a4,8(a5)
  disk.used = (struct virtq_used *) (disk.pages + PGSIZE);
    80005a70:	00016717          	auipc	a4,0x16
    80005a74:	59070713          	addi	a4,a4,1424 # 8001c000 <disk+0x1000>
    80005a78:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80005a7a:	4705                	li	a4,1
    80005a7c:	00e78c23          	sb	a4,24(a5)
    80005a80:	00e78ca3          	sb	a4,25(a5)
    80005a84:	00e78d23          	sb	a4,26(a5)
    80005a88:	00e78da3          	sb	a4,27(a5)
    80005a8c:	00e78e23          	sb	a4,28(a5)
    80005a90:	00e78ea3          	sb	a4,29(a5)
    80005a94:	00e78f23          	sb	a4,30(a5)
    80005a98:	00e78fa3          	sb	a4,31(a5)
}
    80005a9c:	60e2                	ld	ra,24(sp)
    80005a9e:	6442                	ld	s0,16(sp)
    80005aa0:	64a2                	ld	s1,8(sp)
    80005aa2:	6105                	addi	sp,sp,32
    80005aa4:	8082                	ret
    panic("could not find virtio disk");
    80005aa6:	00003517          	auipc	a0,0x3
    80005aaa:	e6250513          	addi	a0,a0,-414 # 80008908 <syscalls+0x448>
    80005aae:	00001097          	auipc	ra,0x1
    80005ab2:	bfa080e7          	jalr	-1030(ra) # 800066a8 <panic>
    panic("virtio disk has no queue 0");
    80005ab6:	00003517          	auipc	a0,0x3
    80005aba:	e7250513          	addi	a0,a0,-398 # 80008928 <syscalls+0x468>
    80005abe:	00001097          	auipc	ra,0x1
    80005ac2:	bea080e7          	jalr	-1046(ra) # 800066a8 <panic>
    panic("virtio disk max queue too short");
    80005ac6:	00003517          	auipc	a0,0x3
    80005aca:	e8250513          	addi	a0,a0,-382 # 80008948 <syscalls+0x488>
    80005ace:	00001097          	auipc	ra,0x1
    80005ad2:	bda080e7          	jalr	-1062(ra) # 800066a8 <panic>

0000000080005ad6 <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80005ad6:	7159                	addi	sp,sp,-112
    80005ad8:	f486                	sd	ra,104(sp)
    80005ada:	f0a2                	sd	s0,96(sp)
    80005adc:	eca6                	sd	s1,88(sp)
    80005ade:	e8ca                	sd	s2,80(sp)
    80005ae0:	e4ce                	sd	s3,72(sp)
    80005ae2:	e0d2                	sd	s4,64(sp)
    80005ae4:	fc56                	sd	s5,56(sp)
    80005ae6:	f85a                	sd	s6,48(sp)
    80005ae8:	f45e                	sd	s7,40(sp)
    80005aea:	f062                	sd	s8,32(sp)
    80005aec:	ec66                	sd	s9,24(sp)
    80005aee:	e86a                	sd	s10,16(sp)
    80005af0:	1880                	addi	s0,sp,112
    80005af2:	892a                	mv	s2,a0
    80005af4:	8d2e                	mv	s10,a1
  uint64 sector = b->blockno * (BSIZE / 512);
    80005af6:	00c52c83          	lw	s9,12(a0)
    80005afa:	001c9c9b          	slliw	s9,s9,0x1
    80005afe:	1c82                	slli	s9,s9,0x20
    80005b00:	020cdc93          	srli	s9,s9,0x20

  acquire(&disk.vdisk_lock);
    80005b04:	00017517          	auipc	a0,0x17
    80005b08:	62450513          	addi	a0,a0,1572 # 8001d128 <disk+0x2128>
    80005b0c:	00001097          	auipc	ra,0x1
    80005b10:	0e6080e7          	jalr	230(ra) # 80006bf2 <acquire>
  for(int i = 0; i < 3; i++){
    80005b14:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    80005b16:	4c21                	li	s8,8
      disk.free[i] = 0;
    80005b18:	00015b97          	auipc	s7,0x15
    80005b1c:	4e8b8b93          	addi	s7,s7,1256 # 8001b000 <disk>
    80005b20:	6b09                	lui	s6,0x2
  for(int i = 0; i < 3; i++){
    80005b22:	4a8d                	li	s5,3
  for(int i = 0; i < NUM; i++){
    80005b24:	8a4e                	mv	s4,s3
    80005b26:	a051                	j	80005baa <virtio_disk_rw+0xd4>
      disk.free[i] = 0;
    80005b28:	00fb86b3          	add	a3,s7,a5
    80005b2c:	96da                	add	a3,a3,s6
    80005b2e:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    80005b32:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    80005b34:	0207c563          	bltz	a5,80005b5e <virtio_disk_rw+0x88>
  for(int i = 0; i < 3; i++){
    80005b38:	2485                	addiw	s1,s1,1
    80005b3a:	0711                	addi	a4,a4,4
    80005b3c:	25548063          	beq	s1,s5,80005d7c <virtio_disk_rw+0x2a6>
    idx[i] = alloc_desc();
    80005b40:	863a                	mv	a2,a4
  for(int i = 0; i < NUM; i++){
    80005b42:	00017697          	auipc	a3,0x17
    80005b46:	4d668693          	addi	a3,a3,1238 # 8001d018 <disk+0x2018>
    80005b4a:	87d2                	mv	a5,s4
    if(disk.free[i]){
    80005b4c:	0006c583          	lbu	a1,0(a3)
    80005b50:	fde1                	bnez	a1,80005b28 <virtio_disk_rw+0x52>
  for(int i = 0; i < NUM; i++){
    80005b52:	2785                	addiw	a5,a5,1
    80005b54:	0685                	addi	a3,a3,1
    80005b56:	ff879be3          	bne	a5,s8,80005b4c <virtio_disk_rw+0x76>
    idx[i] = alloc_desc();
    80005b5a:	57fd                	li	a5,-1
    80005b5c:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    80005b5e:	02905a63          	blez	s1,80005b92 <virtio_disk_rw+0xbc>
        free_desc(idx[j]);
    80005b62:	f9042503          	lw	a0,-112(s0)
    80005b66:	00000097          	auipc	ra,0x0
    80005b6a:	d90080e7          	jalr	-624(ra) # 800058f6 <free_desc>
      for(int j = 0; j < i; j++)
    80005b6e:	4785                	li	a5,1
    80005b70:	0297d163          	bge	a5,s1,80005b92 <virtio_disk_rw+0xbc>
        free_desc(idx[j]);
    80005b74:	f9442503          	lw	a0,-108(s0)
    80005b78:	00000097          	auipc	ra,0x0
    80005b7c:	d7e080e7          	jalr	-642(ra) # 800058f6 <free_desc>
      for(int j = 0; j < i; j++)
    80005b80:	4789                	li	a5,2
    80005b82:	0097d863          	bge	a5,s1,80005b92 <virtio_disk_rw+0xbc>
        free_desc(idx[j]);
    80005b86:	f9842503          	lw	a0,-104(s0)
    80005b8a:	00000097          	auipc	ra,0x0
    80005b8e:	d6c080e7          	jalr	-660(ra) # 800058f6 <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80005b92:	00017597          	auipc	a1,0x17
    80005b96:	59658593          	addi	a1,a1,1430 # 8001d128 <disk+0x2128>
    80005b9a:	00017517          	auipc	a0,0x17
    80005b9e:	47e50513          	addi	a0,a0,1150 # 8001d018 <disk+0x2018>
    80005ba2:	ffffc097          	auipc	ra,0xffffc
    80005ba6:	f86080e7          	jalr	-122(ra) # 80001b28 <sleep>
  for(int i = 0; i < 3; i++){
    80005baa:	f9040713          	addi	a4,s0,-112
    80005bae:	84ce                	mv	s1,s3
    80005bb0:	bf41                	j	80005b40 <virtio_disk_rw+0x6a>
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];

  if(write)
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80005bb2:	20058713          	addi	a4,a1,512
    80005bb6:	00471693          	slli	a3,a4,0x4
    80005bba:	00015717          	auipc	a4,0x15
    80005bbe:	44670713          	addi	a4,a4,1094 # 8001b000 <disk>
    80005bc2:	9736                	add	a4,a4,a3
    80005bc4:	4685                	li	a3,1
    80005bc6:	0ad72423          	sw	a3,168(a4)
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
  buf0->reserved = 0;
    80005bca:	20058713          	addi	a4,a1,512
    80005bce:	00471693          	slli	a3,a4,0x4
    80005bd2:	00015717          	auipc	a4,0x15
    80005bd6:	42e70713          	addi	a4,a4,1070 # 8001b000 <disk>
    80005bda:	9736                	add	a4,a4,a3
    80005bdc:	0a072623          	sw	zero,172(a4)
  buf0->sector = sector;
    80005be0:	0b973823          	sd	s9,176(a4)

  disk.desc[idx[0]].addr = (uint64) buf0;
    80005be4:	7679                	lui	a2,0xffffe
    80005be6:	963e                	add	a2,a2,a5
    80005be8:	00017697          	auipc	a3,0x17
    80005bec:	41868693          	addi	a3,a3,1048 # 8001d000 <disk+0x2000>
    80005bf0:	6298                	ld	a4,0(a3)
    80005bf2:	9732                	add	a4,a4,a2
    80005bf4:	e308                	sd	a0,0(a4)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80005bf6:	6298                	ld	a4,0(a3)
    80005bf8:	9732                	add	a4,a4,a2
    80005bfa:	4541                	li	a0,16
    80005bfc:	c708                	sw	a0,8(a4)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80005bfe:	6298                	ld	a4,0(a3)
    80005c00:	9732                	add	a4,a4,a2
    80005c02:	4505                	li	a0,1
    80005c04:	00a71623          	sh	a0,12(a4)
  disk.desc[idx[0]].next = idx[1];
    80005c08:	f9442703          	lw	a4,-108(s0)
    80005c0c:	6288                	ld	a0,0(a3)
    80005c0e:	962a                	add	a2,a2,a0
    80005c10:	00e61723          	sh	a4,14(a2) # ffffffffffffe00e <end+0xffffffff7ffd7dce>

  disk.desc[idx[1]].addr = (uint64) b->data;
    80005c14:	0712                	slli	a4,a4,0x4
    80005c16:	6290                	ld	a2,0(a3)
    80005c18:	963a                	add	a2,a2,a4
    80005c1a:	05890513          	addi	a0,s2,88
    80005c1e:	e208                	sd	a0,0(a2)
  disk.desc[idx[1]].len = BSIZE;
    80005c20:	6294                	ld	a3,0(a3)
    80005c22:	96ba                	add	a3,a3,a4
    80005c24:	40000613          	li	a2,1024
    80005c28:	c690                	sw	a2,8(a3)
  if(write)
    80005c2a:	140d0063          	beqz	s10,80005d6a <virtio_disk_rw+0x294>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80005c2e:	00017697          	auipc	a3,0x17
    80005c32:	3d26b683          	ld	a3,978(a3) # 8001d000 <disk+0x2000>
    80005c36:	96ba                	add	a3,a3,a4
    80005c38:	00069623          	sh	zero,12(a3)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80005c3c:	00015817          	auipc	a6,0x15
    80005c40:	3c480813          	addi	a6,a6,964 # 8001b000 <disk>
    80005c44:	00017517          	auipc	a0,0x17
    80005c48:	3bc50513          	addi	a0,a0,956 # 8001d000 <disk+0x2000>
    80005c4c:	6114                	ld	a3,0(a0)
    80005c4e:	96ba                	add	a3,a3,a4
    80005c50:	00c6d603          	lhu	a2,12(a3)
    80005c54:	00166613          	ori	a2,a2,1
    80005c58:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    80005c5c:	f9842683          	lw	a3,-104(s0)
    80005c60:	6110                	ld	a2,0(a0)
    80005c62:	9732                	add	a4,a4,a2
    80005c64:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    80005c68:	20058613          	addi	a2,a1,512
    80005c6c:	0612                	slli	a2,a2,0x4
    80005c6e:	9642                	add	a2,a2,a6
    80005c70:	577d                	li	a4,-1
    80005c72:	02e60823          	sb	a4,48(a2)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80005c76:	00469713          	slli	a4,a3,0x4
    80005c7a:	6114                	ld	a3,0(a0)
    80005c7c:	96ba                	add	a3,a3,a4
    80005c7e:	03078793          	addi	a5,a5,48
    80005c82:	97c2                	add	a5,a5,a6
    80005c84:	e29c                	sd	a5,0(a3)
  disk.desc[idx[2]].len = 1;
    80005c86:	611c                	ld	a5,0(a0)
    80005c88:	97ba                	add	a5,a5,a4
    80005c8a:	4685                	li	a3,1
    80005c8c:	c794                	sw	a3,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80005c8e:	611c                	ld	a5,0(a0)
    80005c90:	97ba                	add	a5,a5,a4
    80005c92:	4809                	li	a6,2
    80005c94:	01079623          	sh	a6,12(a5)
  disk.desc[idx[2]].next = 0;
    80005c98:	611c                	ld	a5,0(a0)
    80005c9a:	973e                	add	a4,a4,a5
    80005c9c:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80005ca0:	00d92223          	sw	a3,4(s2)
  disk.info[idx[0]].b = b;
    80005ca4:	03263423          	sd	s2,40(a2)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    80005ca8:	6518                	ld	a4,8(a0)
    80005caa:	00275783          	lhu	a5,2(a4)
    80005cae:	8b9d                	andi	a5,a5,7
    80005cb0:	0786                	slli	a5,a5,0x1
    80005cb2:	97ba                	add	a5,a5,a4
    80005cb4:	00b79223          	sh	a1,4(a5)

  __sync_synchronize();
    80005cb8:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    80005cbc:	6518                	ld	a4,8(a0)
    80005cbe:	00275783          	lhu	a5,2(a4)
    80005cc2:	2785                	addiw	a5,a5,1
    80005cc4:	00f71123          	sh	a5,2(a4)

  __sync_synchronize();
    80005cc8:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80005ccc:	100017b7          	lui	a5,0x10001
    80005cd0:	0407a823          	sw	zero,80(a5) # 10001050 <_entry-0x6fffefb0>

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80005cd4:	00492703          	lw	a4,4(s2)
    80005cd8:	4785                	li	a5,1
    80005cda:	02f71163          	bne	a4,a5,80005cfc <virtio_disk_rw+0x226>
    sleep(b, &disk.vdisk_lock);
    80005cde:	00017997          	auipc	s3,0x17
    80005ce2:	44a98993          	addi	s3,s3,1098 # 8001d128 <disk+0x2128>
  while(b->disk == 1) {
    80005ce6:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    80005ce8:	85ce                	mv	a1,s3
    80005cea:	854a                	mv	a0,s2
    80005cec:	ffffc097          	auipc	ra,0xffffc
    80005cf0:	e3c080e7          	jalr	-452(ra) # 80001b28 <sleep>
  while(b->disk == 1) {
    80005cf4:	00492783          	lw	a5,4(s2)
    80005cf8:	fe9788e3          	beq	a5,s1,80005ce8 <virtio_disk_rw+0x212>
  }

  disk.info[idx[0]].b = 0;
    80005cfc:	f9042903          	lw	s2,-112(s0)
    80005d00:	20090793          	addi	a5,s2,512
    80005d04:	00479713          	slli	a4,a5,0x4
    80005d08:	00015797          	auipc	a5,0x15
    80005d0c:	2f878793          	addi	a5,a5,760 # 8001b000 <disk>
    80005d10:	97ba                	add	a5,a5,a4
    80005d12:	0207b423          	sd	zero,40(a5)
    int flag = disk.desc[i].flags;
    80005d16:	00017997          	auipc	s3,0x17
    80005d1a:	2ea98993          	addi	s3,s3,746 # 8001d000 <disk+0x2000>
    80005d1e:	00491713          	slli	a4,s2,0x4
    80005d22:	0009b783          	ld	a5,0(s3)
    80005d26:	97ba                	add	a5,a5,a4
    80005d28:	00c7d483          	lhu	s1,12(a5)
    int nxt = disk.desc[i].next;
    80005d2c:	854a                	mv	a0,s2
    80005d2e:	00e7d903          	lhu	s2,14(a5)
    free_desc(i);
    80005d32:	00000097          	auipc	ra,0x0
    80005d36:	bc4080e7          	jalr	-1084(ra) # 800058f6 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    80005d3a:	8885                	andi	s1,s1,1
    80005d3c:	f0ed                	bnez	s1,80005d1e <virtio_disk_rw+0x248>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80005d3e:	00017517          	auipc	a0,0x17
    80005d42:	3ea50513          	addi	a0,a0,1002 # 8001d128 <disk+0x2128>
    80005d46:	00001097          	auipc	ra,0x1
    80005d4a:	f60080e7          	jalr	-160(ra) # 80006ca6 <release>
}
    80005d4e:	70a6                	ld	ra,104(sp)
    80005d50:	7406                	ld	s0,96(sp)
    80005d52:	64e6                	ld	s1,88(sp)
    80005d54:	6946                	ld	s2,80(sp)
    80005d56:	69a6                	ld	s3,72(sp)
    80005d58:	6a06                	ld	s4,64(sp)
    80005d5a:	7ae2                	ld	s5,56(sp)
    80005d5c:	7b42                	ld	s6,48(sp)
    80005d5e:	7ba2                	ld	s7,40(sp)
    80005d60:	7c02                	ld	s8,32(sp)
    80005d62:	6ce2                	ld	s9,24(sp)
    80005d64:	6d42                	ld	s10,16(sp)
    80005d66:	6165                	addi	sp,sp,112
    80005d68:	8082                	ret
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80005d6a:	00017697          	auipc	a3,0x17
    80005d6e:	2966b683          	ld	a3,662(a3) # 8001d000 <disk+0x2000>
    80005d72:	96ba                	add	a3,a3,a4
    80005d74:	4609                	li	a2,2
    80005d76:	00c69623          	sh	a2,12(a3)
    80005d7a:	b5c9                	j	80005c3c <virtio_disk_rw+0x166>
  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    80005d7c:	f9042583          	lw	a1,-112(s0)
    80005d80:	20058793          	addi	a5,a1,512
    80005d84:	0792                	slli	a5,a5,0x4
    80005d86:	00015517          	auipc	a0,0x15
    80005d8a:	32250513          	addi	a0,a0,802 # 8001b0a8 <disk+0xa8>
    80005d8e:	953e                	add	a0,a0,a5
  if(write)
    80005d90:	e20d11e3          	bnez	s10,80005bb2 <virtio_disk_rw+0xdc>
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    80005d94:	20058713          	addi	a4,a1,512
    80005d98:	00471693          	slli	a3,a4,0x4
    80005d9c:	00015717          	auipc	a4,0x15
    80005da0:	26470713          	addi	a4,a4,612 # 8001b000 <disk>
    80005da4:	9736                	add	a4,a4,a3
    80005da6:	0a072423          	sw	zero,168(a4)
    80005daa:	b505                	j	80005bca <virtio_disk_rw+0xf4>

0000000080005dac <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80005dac:	1101                	addi	sp,sp,-32
    80005dae:	ec06                	sd	ra,24(sp)
    80005db0:	e822                	sd	s0,16(sp)
    80005db2:	e426                	sd	s1,8(sp)
    80005db4:	e04a                	sd	s2,0(sp)
    80005db6:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80005db8:	00017517          	auipc	a0,0x17
    80005dbc:	37050513          	addi	a0,a0,880 # 8001d128 <disk+0x2128>
    80005dc0:	00001097          	auipc	ra,0x1
    80005dc4:	e32080e7          	jalr	-462(ra) # 80006bf2 <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80005dc8:	10001737          	lui	a4,0x10001
    80005dcc:	533c                	lw	a5,96(a4)
    80005dce:	8b8d                	andi	a5,a5,3
    80005dd0:	d37c                	sw	a5,100(a4)

  __sync_synchronize();
    80005dd2:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    80005dd6:	00017797          	auipc	a5,0x17
    80005dda:	22a78793          	addi	a5,a5,554 # 8001d000 <disk+0x2000>
    80005dde:	6b94                	ld	a3,16(a5)
    80005de0:	0207d703          	lhu	a4,32(a5)
    80005de4:	0026d783          	lhu	a5,2(a3)
    80005de8:	06f70163          	beq	a4,a5,80005e4a <virtio_disk_intr+0x9e>
    __sync_synchronize();
    int id = disk.used->ring[disk.used_idx % NUM].id;
    80005dec:	00015917          	auipc	s2,0x15
    80005df0:	21490913          	addi	s2,s2,532 # 8001b000 <disk>
    80005df4:	00017497          	auipc	s1,0x17
    80005df8:	20c48493          	addi	s1,s1,524 # 8001d000 <disk+0x2000>
    __sync_synchronize();
    80005dfc:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    80005e00:	6898                	ld	a4,16(s1)
    80005e02:	0204d783          	lhu	a5,32(s1)
    80005e06:	8b9d                	andi	a5,a5,7
    80005e08:	078e                	slli	a5,a5,0x3
    80005e0a:	97ba                	add	a5,a5,a4
    80005e0c:	43dc                	lw	a5,4(a5)

    if(disk.info[id].status != 0)
    80005e0e:	20078713          	addi	a4,a5,512
    80005e12:	0712                	slli	a4,a4,0x4
    80005e14:	974a                	add	a4,a4,s2
    80005e16:	03074703          	lbu	a4,48(a4) # 10001030 <_entry-0x6fffefd0>
    80005e1a:	e731                	bnez	a4,80005e66 <virtio_disk_intr+0xba>
      panic("virtio_disk_intr status");

    struct buf *b = disk.info[id].b;
    80005e1c:	20078793          	addi	a5,a5,512
    80005e20:	0792                	slli	a5,a5,0x4
    80005e22:	97ca                	add	a5,a5,s2
    80005e24:	7788                	ld	a0,40(a5)
    b->disk = 0;   // disk is done with buf
    80005e26:	00052223          	sw	zero,4(a0)
    wakeup(b);
    80005e2a:	ffffc097          	auipc	ra,0xffffc
    80005e2e:	e8a080e7          	jalr	-374(ra) # 80001cb4 <wakeup>

    disk.used_idx += 1;
    80005e32:	0204d783          	lhu	a5,32(s1)
    80005e36:	2785                	addiw	a5,a5,1
    80005e38:	17c2                	slli	a5,a5,0x30
    80005e3a:	93c1                	srli	a5,a5,0x30
    80005e3c:	02f49023          	sh	a5,32(s1)
  while(disk.used_idx != disk.used->idx){
    80005e40:	6898                	ld	a4,16(s1)
    80005e42:	00275703          	lhu	a4,2(a4)
    80005e46:	faf71be3          	bne	a4,a5,80005dfc <virtio_disk_intr+0x50>
  }

  release(&disk.vdisk_lock);
    80005e4a:	00017517          	auipc	a0,0x17
    80005e4e:	2de50513          	addi	a0,a0,734 # 8001d128 <disk+0x2128>
    80005e52:	00001097          	auipc	ra,0x1
    80005e56:	e54080e7          	jalr	-428(ra) # 80006ca6 <release>
}
    80005e5a:	60e2                	ld	ra,24(sp)
    80005e5c:	6442                	ld	s0,16(sp)
    80005e5e:	64a2                	ld	s1,8(sp)
    80005e60:	6902                	ld	s2,0(sp)
    80005e62:	6105                	addi	sp,sp,32
    80005e64:	8082                	ret
      panic("virtio_disk_intr status");
    80005e66:	00003517          	auipc	a0,0x3
    80005e6a:	b0250513          	addi	a0,a0,-1278 # 80008968 <syscalls+0x4a8>
    80005e6e:	00001097          	auipc	ra,0x1
    80005e72:	83a080e7          	jalr	-1990(ra) # 800066a8 <panic>

0000000080005e76 <swap_page_from_pte>:
/* NTU OS 2024 */
/* Allocate eight consecutive disk blocks. */
/* Save the content of the physical page in the pte */
/* to the disk blocks and save the block-id into the */
/* pte. */
char *swap_page_from_pte(pte_t *pte) {
    80005e76:	7179                	addi	sp,sp,-48
    80005e78:	f406                	sd	ra,40(sp)
    80005e7a:	f022                	sd	s0,32(sp)
    80005e7c:	ec26                	sd	s1,24(sp)
    80005e7e:	e84a                	sd	s2,16(sp)
    80005e80:	e44e                	sd	s3,8(sp)
    80005e82:	1800                	addi	s0,sp,48
    80005e84:	89aa                	mv	s3,a0
  char *pa = (char*) PTE2PA(*pte);
    80005e86:	00053903          	ld	s2,0(a0)
    80005e8a:	00a95913          	srli	s2,s2,0xa
    80005e8e:	0932                	slli	s2,s2,0xc
  uint dp = balloc_page(ROOTDEV);
    80005e90:	4505                	li	a0,1
    80005e92:	ffffe097          	auipc	ra,0xffffe
    80005e96:	aba080e7          	jalr	-1350(ra) # 8000394c <balloc_page>
    80005e9a:	0005049b          	sext.w	s1,a0

  write_page_to_disk(ROOTDEV, pa, dp); // write this page to disk
    80005e9e:	8626                	mv	a2,s1
    80005ea0:	85ca                	mv	a1,s2
    80005ea2:	4505                	li	a0,1
    80005ea4:	ffffd097          	auipc	ra,0xffffd
    80005ea8:	c6a080e7          	jalr	-918(ra) # 80002b0e <write_page_to_disk>
  *pte = (BLOCKNO2PTE(dp) | PTE_FLAGS(*pte) | PTE_S) & ~PTE_V;
    80005eac:	0009b783          	ld	a5,0(s3)
    80005eb0:	00a4949b          	slliw	s1,s1,0xa
    80005eb4:	1482                	slli	s1,s1,0x20
    80005eb6:	9081                	srli	s1,s1,0x20
    80005eb8:	1fe7f793          	andi	a5,a5,510
    80005ebc:	8cdd                	or	s1,s1,a5
    80005ebe:	2004e493          	ori	s1,s1,512
    80005ec2:	0099b023          	sd	s1,0(s3)

  return pa;
}
    80005ec6:	854a                	mv	a0,s2
    80005ec8:	70a2                	ld	ra,40(sp)
    80005eca:	7402                	ld	s0,32(sp)
    80005ecc:	64e2                	ld	s1,24(sp)
    80005ece:	6942                	ld	s2,16(sp)
    80005ed0:	69a2                	ld	s3,8(sp)
    80005ed2:	6145                	addi	sp,sp,48
    80005ed4:	8082                	ret

0000000080005ed6 <handle_pgfault>:

/* NTU OS 2024 */
/* Page fault handler */
int handle_pgfault() {
    80005ed6:	1141                	addi	sp,sp,-16
    80005ed8:	e406                	sd	ra,8(sp)
    80005eda:	e022                	sd	s0,0(sp)
    80005edc:	0800                	addi	s0,sp,16
    80005ede:	14302573          	csrr	a0,stval
  uint64 base = PGROUNDDOWN(r_stval());
  // pagetable_t pagetable = myproc()->pagetable;
  // char *pa = kalloc();
  // memset(pa, 0, PGSIZE);
  // mappages(pagetable, base, PGSIZE, (uint64)pa, PTE_U|PTE_R|PTE_W|PTE_X);
  madvise(base, PGSIZE, MADV_WILLNEED);
    80005ee2:	4605                	li	a2,1
    80005ee4:	6585                	lui	a1,0x1
    80005ee6:	77fd                	lui	a5,0xfffff
    80005ee8:	8d7d                	and	a0,a0,a5
    80005eea:	ffffb097          	auipc	ra,0xffffb
    80005eee:	e0a080e7          	jalr	-502(ra) # 80000cf4 <madvise>
  return 0;
    80005ef2:	4501                	li	a0,0
    80005ef4:	60a2                	ld	ra,8(sp)
    80005ef6:	6402                	ld	s0,0(sp)
    80005ef8:	0141                	addi	sp,sp,16
    80005efa:	8082                	ret

0000000080005efc <sys_vmprint>:

/* NTU OS 2024 */
/* Entry of vmprint() syscall. */
uint64
sys_vmprint(void)
{
    80005efc:	1141                	addi	sp,sp,-16
    80005efe:	e406                	sd	ra,8(sp)
    80005f00:	e022                	sd	s0,0(sp)
    80005f02:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80005f04:	ffffb097          	auipc	ra,0xffffb
    80005f08:	568080e7          	jalr	1384(ra) # 8000146c <myproc>
  vmprint(p->pagetable);
    80005f0c:	6928                	ld	a0,80(a0)
    80005f0e:	ffffb097          	auipc	ra,0xffffb
    80005f12:	396080e7          	jalr	918(ra) # 800012a4 <vmprint>
  return 0;
}
    80005f16:	4501                	li	a0,0
    80005f18:	60a2                	ld	ra,8(sp)
    80005f1a:	6402                	ld	s0,0(sp)
    80005f1c:	0141                	addi	sp,sp,16
    80005f1e:	8082                	ret

0000000080005f20 <sys_madvise>:

/* NTU OS 2024 */
/* Entry of madvise() syscall. */
uint64
sys_madvise(void)
{
    80005f20:	1101                	addi	sp,sp,-32
    80005f22:	ec06                	sd	ra,24(sp)
    80005f24:	e822                	sd	s0,16(sp)
    80005f26:	1000                	addi	s0,sp,32

  uint64 addr;
  int length;
  int advise;

  if (argaddr(0, &addr) < 0) return -1;
    80005f28:	fe840593          	addi	a1,s0,-24
    80005f2c:	4501                	li	a0,0
    80005f2e:	ffffc097          	auipc	ra,0xffffc
    80005f32:	61e080e7          	jalr	1566(ra) # 8000254c <argaddr>
    80005f36:	57fd                	li	a5,-1
    80005f38:	04054163          	bltz	a0,80005f7a <sys_madvise+0x5a>
  if (argint(1, &length) < 0) return -1;
    80005f3c:	fe440593          	addi	a1,s0,-28
    80005f40:	4505                	li	a0,1
    80005f42:	ffffc097          	auipc	ra,0xffffc
    80005f46:	5e8080e7          	jalr	1512(ra) # 8000252a <argint>
    80005f4a:	57fd                	li	a5,-1
    80005f4c:	02054763          	bltz	a0,80005f7a <sys_madvise+0x5a>
  if (argint(2, &advise) < 0) return -1;
    80005f50:	fe040593          	addi	a1,s0,-32
    80005f54:	4509                	li	a0,2
    80005f56:	ffffc097          	auipc	ra,0xffffc
    80005f5a:	5d4080e7          	jalr	1492(ra) # 8000252a <argint>
    80005f5e:	57fd                	li	a5,-1
    80005f60:	00054d63          	bltz	a0,80005f7a <sys_madvise+0x5a>

  int ret = madvise(addr, length, advise);
    80005f64:	fe042603          	lw	a2,-32(s0)
    80005f68:	fe442583          	lw	a1,-28(s0)
    80005f6c:	fe843503          	ld	a0,-24(s0)
    80005f70:	ffffb097          	auipc	ra,0xffffb
    80005f74:	d84080e7          	jalr	-636(ra) # 80000cf4 <madvise>
  return ret;
    80005f78:	87aa                	mv	a5,a0
}
    80005f7a:	853e                	mv	a0,a5
    80005f7c:	60e2                	ld	ra,24(sp)
    80005f7e:	6442                	ld	s0,16(sp)
    80005f80:	6105                	addi	sp,sp,32
    80005f82:	8082                	ret

0000000080005f84 <sys_pgprint>:
#if defined(PG_REPLACEMENT_USE_FIFO) || defined(PG_REPLACEMENT_USE_LRU)
/* NTU OS 2024 */
/* Entry of pgprint() syscall. */
uint64
sys_pgprint(void)
{
    80005f84:	1141                	addi	sp,sp,-16
    80005f86:	e406                	sd	ra,8(sp)
    80005f88:	e022                	sd	s0,0(sp)
    80005f8a:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80005f8c:	ffffb097          	auipc	ra,0xffffb
    80005f90:	4e0080e7          	jalr	1248(ra) # 8000146c <myproc>
  pgprint();
    80005f94:	ffffb097          	auipc	ra,0xffffb
    80005f98:	fee080e7          	jalr	-18(ra) # 80000f82 <pgprint>
  return 0;
}
    80005f9c:	4501                	li	a0,0
    80005f9e:	60a2                	ld	ra,8(sp)
    80005fa0:	6402                	ld	s0,0(sp)
    80005fa2:	0141                	addi	sp,sp,16
    80005fa4:	8082                	ret

0000000080005fa6 <q_push>:

void q_init(queue_t *q, uint64 *pgtbl){
	q_traversal(q, pgtbl, 0);
}

int q_push(queue_t *q, uint64 *e){
    80005fa6:	1141                	addi	sp,sp,-16
    80005fa8:	e422                	sd	s0,8(sp)
    80005faa:	0800                	addi	s0,sp,16
int q_empty(queue_t *q){
	return q->size == 0;
}

int q_full(queue_t *q){
	return q->size == PG_BUF_SIZE;
    80005fac:	411c                	lw	a5,0(a0)
	if (q_full(q)) return -1;
    80005fae:	4721                	li	a4,8
    80005fb0:	00e78e63          	beq	a5,a4,80005fcc <q_push+0x26>
	q->bucket[q->size++] = e;
    80005fb4:	0017871b          	addiw	a4,a5,1
    80005fb8:	c118                	sw	a4,0(a0)
    80005fba:	1782                	slli	a5,a5,0x20
    80005fbc:	9381                	srli	a5,a5,0x20
    80005fbe:	078e                	slli	a5,a5,0x3
    80005fc0:	953e                	add	a0,a0,a5
    80005fc2:	e50c                	sd	a1,8(a0)
	return 0;
    80005fc4:	4501                	li	a0,0
}
    80005fc6:	6422                	ld	s0,8(sp)
    80005fc8:	0141                	addi	sp,sp,16
    80005fca:	8082                	ret
	if (q_full(q)) return -1;
    80005fcc:	557d                	li	a0,-1
    80005fce:	bfe5                	j	80005fc6 <q_push+0x20>

0000000080005fd0 <q_pop_idx>:
uint64* q_pop_idx(queue_t *q, int idx){
    80005fd0:	1141                	addi	sp,sp,-16
    80005fd2:	e422                	sd	s0,8(sp)
    80005fd4:	0800                	addi	s0,sp,16
	if (idx >= q->size || idx < 0) return 0;
    80005fd6:	4110                	lw	a2,0(a0)
    80005fd8:	06c5f163          	bgeu	a1,a2,8000603a <q_pop_idx+0x6a>
    80005fdc:	882a                	mv	a6,a0
    80005fde:	872e                	mv	a4,a1
    80005fe0:	0405cf63          	bltz	a1,8000603e <q_pop_idx+0x6e>
	while (*q->bucket[idx] & PTE_P) idx++;
    80005fe4:	00359793          	slli	a5,a1,0x3
    80005fe8:	97aa                	add	a5,a5,a0
    80005fea:	6788                	ld	a0,8(a5)
    80005fec:	611c                	ld	a5,0(a0)
    80005fee:	1007f793          	andi	a5,a5,256
    80005ff2:	cb99                	beqz	a5,80006008 <q_pop_idx+0x38>
    80005ff4:	00359693          	slli	a3,a1,0x3
    80005ff8:	96c2                	add	a3,a3,a6
    80005ffa:	2705                	addiw	a4,a4,1
    80005ffc:	6a88                	ld	a0,16(a3)
    80005ffe:	06a1                	addi	a3,a3,8
    80006000:	611c                	ld	a5,0(a0)
    80006002:	1007f793          	andi	a5,a5,256
    80006006:	fbf5                	bnez	a5,80005ffa <q_pop_idx+0x2a>
	for (int i = idx; i < q->size-1; i++){
    80006008:	fff6089b          	addiw	a7,a2,-1
    8000600c:	0008859b          	sext.w	a1,a7
    80006010:	0007079b          	sext.w	a5,a4
    80006014:	00b7fe63          	bgeu	a5,a1,80006030 <q_pop_idx+0x60>
    80006018:	00371693          	slli	a3,a4,0x3
    8000601c:	96c2                	add	a3,a3,a6
		q->bucket[i] = q->bucket[i+1];
    8000601e:	0017079b          	addiw	a5,a4,1
    80006022:	0007871b          	sext.w	a4,a5
    80006026:	6a90                	ld	a2,16(a3)
    80006028:	e690                	sd	a2,8(a3)
	for (int i = idx; i < q->size-1; i++){
    8000602a:	06a1                	addi	a3,a3,8
    8000602c:	feb769e3          	bltu	a4,a1,8000601e <q_pop_idx+0x4e>
	q->size--;
    80006030:	01182023          	sw	a7,0(a6)
}
    80006034:	6422                	ld	s0,8(sp)
    80006036:	0141                	addi	sp,sp,16
    80006038:	8082                	ret
	if (idx >= q->size || idx < 0) return 0;
    8000603a:	4501                	li	a0,0
    8000603c:	bfe5                	j	80006034 <q_pop_idx+0x64>
    8000603e:	4501                	li	a0,0
    80006040:	bfd5                	j	80006034 <q_pop_idx+0x64>

0000000080006042 <q_empty>:
int q_empty(queue_t *q){
    80006042:	1141                	addi	sp,sp,-16
    80006044:	e422                	sd	s0,8(sp)
    80006046:	0800                	addi	s0,sp,16
	return q->size == 0;
    80006048:	4108                	lw	a0,0(a0)
}
    8000604a:	00153513          	seqz	a0,a0
    8000604e:	6422                	ld	s0,8(sp)
    80006050:	0141                	addi	sp,sp,16
    80006052:	8082                	ret

0000000080006054 <q_full>:
int q_full(queue_t *q){
    80006054:	1141                	addi	sp,sp,-16
    80006056:	e422                	sd	s0,8(sp)
    80006058:	0800                	addi	s0,sp,16
	return q->size == PG_BUF_SIZE;
    8000605a:	4108                	lw	a0,0(a0)
    8000605c:	1561                	addi	a0,a0,-8
}
    8000605e:	00153513          	seqz	a0,a0
    80006062:	6422                	ld	s0,8(sp)
    80006064:	0141                	addi	sp,sp,16
    80006066:	8082                	ret

0000000080006068 <q_clear>:

int q_clear(queue_t *q){
    80006068:	1141                	addi	sp,sp,-16
    8000606a:	e422                	sd	s0,8(sp)
    8000606c:	0800                	addi	s0,sp,16
	q->size = 0;
    8000606e:	00052023          	sw	zero,0(a0)
	for (int i = 0; i < PG_BUF_SIZE; i++){
		q->bucket[i] = 0;
    80006072:	00053423          	sd	zero,8(a0)
    80006076:	00053823          	sd	zero,16(a0)
    8000607a:	00053c23          	sd	zero,24(a0)
    8000607e:	02053023          	sd	zero,32(a0)
    80006082:	02053423          	sd	zero,40(a0)
    80006086:	02053823          	sd	zero,48(a0)
    8000608a:	02053c23          	sd	zero,56(a0)
    8000608e:	04053023          	sd	zero,64(a0)
	}
	return 0;
}
    80006092:	4501                	li	a0,0
    80006094:	6422                	ld	s0,8(sp)
    80006096:	0141                	addi	sp,sp,16
    80006098:	8082                	ret

000000008000609a <q_find>:

int q_find(queue_t *q, uint64 *e){
    8000609a:	1141                	addi	sp,sp,-16
    8000609c:	e422                	sd	s0,8(sp)
    8000609e:	0800                	addi	s0,sp,16
	return q->size == 0;
    800060a0:	4114                	lw	a3,0(a0)
	if (q_empty(q)) return -1;
    800060a2:	c285                	beqz	a3,800060c2 <q_find+0x28>
    800060a4:	00850793          	addi	a5,a0,8
    800060a8:	2681                	sext.w	a3,a3
	for (int i=0; i < q->size; i++){
    800060aa:	4501                	li	a0,0
		if (q->bucket[i] == e) return i;
    800060ac:	6398                	ld	a4,0(a5)
    800060ae:	00b70763          	beq	a4,a1,800060bc <q_find+0x22>
	for (int i=0; i < q->size; i++){
    800060b2:	2505                	addiw	a0,a0,1
    800060b4:	07a1                	addi	a5,a5,8
    800060b6:	fed51be3          	bne	a0,a3,800060ac <q_find+0x12>
	}
	return -1;
    800060ba:	557d                	li	a0,-1
}
    800060bc:	6422                	ld	s0,8(sp)
    800060be:	0141                	addi	sp,sp,16
    800060c0:	8082                	ret
	if (q_empty(q)) return -1;
    800060c2:	557d                	li	a0,-1
    800060c4:	bfe5                	j	800060bc <q_find+0x22>

00000000800060c6 <q_traversal>:
void q_traversal(queue_t *q, uint64* pgtbl, int level){
    800060c6:	711d                	addi	sp,sp,-96
    800060c8:	ec86                	sd	ra,88(sp)
    800060ca:	e8a2                	sd	s0,80(sp)
    800060cc:	e4a6                	sd	s1,72(sp)
    800060ce:	e0ca                	sd	s2,64(sp)
    800060d0:	fc4e                	sd	s3,56(sp)
    800060d2:	f852                	sd	s4,48(sp)
    800060d4:	f456                	sd	s5,40(sp)
    800060d6:	f05a                	sd	s6,32(sp)
    800060d8:	ec5e                	sd	s7,24(sp)
    800060da:	e862                	sd	s8,16(sp)
    800060dc:	e466                	sd	s9,8(sp)
    800060de:	1080                	addi	s0,sp,96
    800060e0:	89aa                	mv	s3,a0
    800060e2:	8bb2                	mv	s7,a2
	for (int i = 0; i < 512; i++){
    800060e4:	84ae                	mv	s1,a1
    800060e6:	4901                	li	s2,0
		if (q_full(q)) q_pop_idx(q, 0);
    800060e8:	4aa1                	li	s5,8
		if (level != 2) {
    800060ea:	4a09                	li	s4,2
		else if (i < 3 || !(*pte & PTE_V) || q_find(q, (uint64 *)pte) != -1) continue; // avoid the first 3 ptes and duplicated ptes
    800060ec:	5c7d                	li	s8,-1
	for (int i = 0; i < 512; i++){
    800060ee:	20000b13          	li	s6,512
    800060f2:	a091                	j	80006136 <q_traversal+0x70>
		if (q_full(q)) q_pop_idx(q, 0);
    800060f4:	4581                	li	a1,0
    800060f6:	854e                	mv	a0,s3
    800060f8:	00000097          	auipc	ra,0x0
    800060fc:	ed8080e7          	jalr	-296(ra) # 80005fd0 <q_pop_idx>
    80006100:	a83d                	j	8000613e <q_traversal+0x78>
			q_traversal(q, (uint64 *)PTE2PA(*pte), level+1);
    80006102:	81a9                	srli	a1,a1,0xa
    80006104:	001b861b          	addiw	a2,s7,1
    80006108:	05b2                	slli	a1,a1,0xc
    8000610a:	854e                	mv	a0,s3
    8000610c:	00000097          	auipc	ra,0x0
    80006110:	fba080e7          	jalr	-70(ra) # 800060c6 <q_traversal>
}
    80006114:	60e6                	ld	ra,88(sp)
    80006116:	6446                	ld	s0,80(sp)
    80006118:	64a6                	ld	s1,72(sp)
    8000611a:	6906                	ld	s2,64(sp)
    8000611c:	79e2                	ld	s3,56(sp)
    8000611e:	7a42                	ld	s4,48(sp)
    80006120:	7aa2                	ld	s5,40(sp)
    80006122:	7b02                	ld	s6,32(sp)
    80006124:	6be2                	ld	s7,24(sp)
    80006126:	6c42                	ld	s8,16(sp)
    80006128:	6ca2                	ld	s9,8(sp)
    8000612a:	6125                	addi	sp,sp,96
    8000612c:	8082                	ret
	for (int i = 0; i < 512; i++){
    8000612e:	2905                	addiw	s2,s2,1
    80006130:	04a1                	addi	s1,s1,8
    80006132:	ff6901e3          	beq	s2,s6,80006114 <q_traversal+0x4e>
		if (q_full(q)) q_pop_idx(q, 0);
    80006136:	0009a783          	lw	a5,0(s3)
    8000613a:	fb578de3          	beq	a5,s5,800060f4 <q_traversal+0x2e>
		if (!*pte) continue;
    8000613e:	608c                	ld	a1,0(s1)
    80006140:	d5fd                	beqz	a1,8000612e <q_traversal+0x68>
		if (level != 2) {
    80006142:	fd4b90e3          	bne	s7,s4,80006102 <q_traversal+0x3c>
		else if (i < 3 || !(*pte & PTE_V) || q_find(q, (uint64 *)pte) != -1) continue; // avoid the first 3 ptes and duplicated ptes
    80006146:	ff2a54e3          	bge	s4,s2,8000612e <q_traversal+0x68>
    8000614a:	8985                	andi	a1,a1,1
    8000614c:	d1ed                	beqz	a1,8000612e <q_traversal+0x68>
    8000614e:	85a6                	mv	a1,s1
    80006150:	854e                	mv	a0,s3
    80006152:	00000097          	auipc	ra,0x0
    80006156:	f48080e7          	jalr	-184(ra) # 8000609a <q_find>
    8000615a:	fd851ae3          	bne	a0,s8,8000612e <q_traversal+0x68>
			q_push(q, pte);
    8000615e:	85a6                	mv	a1,s1
    80006160:	854e                	mv	a0,s3
    80006162:	00000097          	auipc	ra,0x0
    80006166:	e44080e7          	jalr	-444(ra) # 80005fa6 <q_push>
    8000616a:	b7d1                	j	8000612e <q_traversal+0x68>

000000008000616c <q_init>:
void q_init(queue_t *q, uint64 *pgtbl){
    8000616c:	1141                	addi	sp,sp,-16
    8000616e:	e406                	sd	ra,8(sp)
    80006170:	e022                	sd	s0,0(sp)
    80006172:	0800                	addi	s0,sp,16
	q_traversal(q, pgtbl, 0);
    80006174:	4601                	li	a2,0
    80006176:	00000097          	auipc	ra,0x0
    8000617a:	f50080e7          	jalr	-176(ra) # 800060c6 <q_traversal>
}
    8000617e:	60a2                	ld	ra,8(sp)
    80006180:	6402                	ld	s0,0(sp)
    80006182:	0141                	addi	sp,sp,16
    80006184:	8082                	ret

0000000080006186 <timerinit>:
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80006186:	1141                	addi	sp,sp,-16
    80006188:	e422                	sd	s0,8(sp)
    8000618a:	0800                	addi	s0,sp,16
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    8000618c:	f14027f3          	csrr	a5,mhartid
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    80006190:	0007869b          	sext.w	a3,a5

  // ask the CLINT for a timer interrupt.
  int interval = 1000000; // cycles; about 1/10th second in qemu.
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    80006194:	0037979b          	slliw	a5,a5,0x3
    80006198:	02004737          	lui	a4,0x2004
    8000619c:	97ba                	add	a5,a5,a4
    8000619e:	0200c737          	lui	a4,0x200c
    800061a2:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800061a6:	000f4637          	lui	a2,0xf4
    800061aa:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800061ae:	95b2                	add	a1,a1,a2
    800061b0:	e38c                	sd	a1,0(a5)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    800061b2:	00269713          	slli	a4,a3,0x2
    800061b6:	9736                	add	a4,a4,a3
    800061b8:	00371693          	slli	a3,a4,0x3
    800061bc:	00018717          	auipc	a4,0x18
    800061c0:	e4470713          	addi	a4,a4,-444 # 8001e000 <timer_scratch>
    800061c4:	9736                	add	a4,a4,a3
  scratch[3] = CLINT_MTIMECMP(id);
    800061c6:	ef1c                	sd	a5,24(a4)
  scratch[4] = interval;
    800061c8:	f310                	sd	a2,32(a4)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    800061ca:	34071073          	csrw	mscratch,a4
  asm volatile("csrw mtvec, %0" : : "r" (x));
    800061ce:	fffff797          	auipc	a5,0xfffff
    800061d2:	66278793          	addi	a5,a5,1634 # 80005830 <timervec>
    800061d6:	30579073          	csrw	mtvec,a5
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    800061da:	300027f3          	csrr	a5,mstatus

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    800061de:	0087e793          	ori	a5,a5,8
  asm volatile("csrw mstatus, %0" : : "r" (x));
    800061e2:	30079073          	csrw	mstatus,a5
  asm volatile("csrr %0, mie" : "=r" (x) );
    800061e6:	304027f3          	csrr	a5,mie

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    800061ea:	0807e793          	ori	a5,a5,128
  asm volatile("csrw mie, %0" : : "r" (x));
    800061ee:	30479073          	csrw	mie,a5
}
    800061f2:	6422                	ld	s0,8(sp)
    800061f4:	0141                	addi	sp,sp,16
    800061f6:	8082                	ret

00000000800061f8 <start>:
{
    800061f8:	1141                	addi	sp,sp,-16
    800061fa:	e406                	sd	ra,8(sp)
    800061fc:	e022                	sd	s0,0(sp)
    800061fe:	0800                	addi	s0,sp,16
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    80006200:	300027f3          	csrr	a5,mstatus
  x &= ~MSTATUS_MPP_MASK;
    80006204:	7779                	lui	a4,0xffffe
    80006206:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffd85bf>
    8000620a:	8ff9                	and	a5,a5,a4
  x |= MSTATUS_MPP_S;
    8000620c:	6705                	lui	a4,0x1
    8000620e:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006212:	8fd9                	or	a5,a5,a4
  asm volatile("csrw mstatus, %0" : : "r" (x));
    80006214:	30079073          	csrw	mstatus,a5
  asm volatile("csrw mepc, %0" : : "r" (x));
    80006218:	ffffa797          	auipc	a5,0xffffa
    8000621c:	10e78793          	addi	a5,a5,270 # 80000326 <main>
    80006220:	34179073          	csrw	mepc,a5
  asm volatile("csrw satp, %0" : : "r" (x));
    80006224:	4781                	li	a5,0
    80006226:	18079073          	csrw	satp,a5
  asm volatile("csrw medeleg, %0" : : "r" (x));
    8000622a:	67c1                	lui	a5,0x10
    8000622c:	17fd                	addi	a5,a5,-1
    8000622e:	30279073          	csrw	medeleg,a5
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80006232:	30379073          	csrw	mideleg,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    80006236:	104027f3          	csrr	a5,sie
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    8000623a:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    8000623e:	10479073          	csrw	sie,a5
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    80006242:	57fd                	li	a5,-1
    80006244:	83a9                	srli	a5,a5,0xa
    80006246:	3b079073          	csrw	pmpaddr0,a5
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    8000624a:	47bd                	li	a5,15
    8000624c:	3a079073          	csrw	pmpcfg0,a5
  timerinit();
    80006250:	00000097          	auipc	ra,0x0
    80006254:	f36080e7          	jalr	-202(ra) # 80006186 <timerinit>
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80006258:	f14027f3          	csrr	a5,mhartid
  w_tp(id);
    8000625c:	2781                	sext.w	a5,a5
  asm volatile("mv tp, %0" : : "r" (x));
    8000625e:	823e                	mv	tp,a5
  asm volatile("mret");
    80006260:	30200073          	mret
}
    80006264:	60a2                	ld	ra,8(sp)
    80006266:	6402                	ld	s0,0(sp)
    80006268:	0141                	addi	sp,sp,16
    8000626a:	8082                	ret

000000008000626c <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    8000626c:	715d                	addi	sp,sp,-80
    8000626e:	e486                	sd	ra,72(sp)
    80006270:	e0a2                	sd	s0,64(sp)
    80006272:	fc26                	sd	s1,56(sp)
    80006274:	f84a                	sd	s2,48(sp)
    80006276:	f44e                	sd	s3,40(sp)
    80006278:	f052                	sd	s4,32(sp)
    8000627a:	ec56                	sd	s5,24(sp)
    8000627c:	0880                	addi	s0,sp,80
  int i;

  for(i = 0; i < n; i++){
    8000627e:	04c05663          	blez	a2,800062ca <consolewrite+0x5e>
    80006282:	8a2a                	mv	s4,a0
    80006284:	84ae                	mv	s1,a1
    80006286:	89b2                	mv	s3,a2
    80006288:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    8000628a:	5afd                	li	s5,-1
    8000628c:	4685                	li	a3,1
    8000628e:	8626                	mv	a2,s1
    80006290:	85d2                	mv	a1,s4
    80006292:	fbf40513          	addi	a0,s0,-65
    80006296:	ffffc097          	auipc	ra,0xffffc
    8000629a:	c8c080e7          	jalr	-884(ra) # 80001f22 <either_copyin>
    8000629e:	01550c63          	beq	a0,s5,800062b6 <consolewrite+0x4a>
      break;
    uartputc(c);
    800062a2:	fbf44503          	lbu	a0,-65(s0)
    800062a6:	00000097          	auipc	ra,0x0
    800062aa:	78e080e7          	jalr	1934(ra) # 80006a34 <uartputc>
  for(i = 0; i < n; i++){
    800062ae:	2905                	addiw	s2,s2,1
    800062b0:	0485                	addi	s1,s1,1
    800062b2:	fd299de3          	bne	s3,s2,8000628c <consolewrite+0x20>
  }

  return i;
}
    800062b6:	854a                	mv	a0,s2
    800062b8:	60a6                	ld	ra,72(sp)
    800062ba:	6406                	ld	s0,64(sp)
    800062bc:	74e2                	ld	s1,56(sp)
    800062be:	7942                	ld	s2,48(sp)
    800062c0:	79a2                	ld	s3,40(sp)
    800062c2:	7a02                	ld	s4,32(sp)
    800062c4:	6ae2                	ld	s5,24(sp)
    800062c6:	6161                	addi	sp,sp,80
    800062c8:	8082                	ret
  for(i = 0; i < n; i++){
    800062ca:	4901                	li	s2,0
    800062cc:	b7ed                	j	800062b6 <consolewrite+0x4a>

00000000800062ce <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    800062ce:	7119                	addi	sp,sp,-128
    800062d0:	fc86                	sd	ra,120(sp)
    800062d2:	f8a2                	sd	s0,112(sp)
    800062d4:	f4a6                	sd	s1,104(sp)
    800062d6:	f0ca                	sd	s2,96(sp)
    800062d8:	ecce                	sd	s3,88(sp)
    800062da:	e8d2                	sd	s4,80(sp)
    800062dc:	e4d6                	sd	s5,72(sp)
    800062de:	e0da                	sd	s6,64(sp)
    800062e0:	fc5e                	sd	s7,56(sp)
    800062e2:	f862                	sd	s8,48(sp)
    800062e4:	f466                	sd	s9,40(sp)
    800062e6:	f06a                	sd	s10,32(sp)
    800062e8:	ec6e                	sd	s11,24(sp)
    800062ea:	0100                	addi	s0,sp,128
    800062ec:	8b2a                	mv	s6,a0
    800062ee:	8aae                	mv	s5,a1
    800062f0:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    800062f2:	00060b9b          	sext.w	s7,a2
  acquire(&cons.lock);
    800062f6:	00020517          	auipc	a0,0x20
    800062fa:	e4a50513          	addi	a0,a0,-438 # 80026140 <cons>
    800062fe:	00001097          	auipc	ra,0x1
    80006302:	8f4080e7          	jalr	-1804(ra) # 80006bf2 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80006306:	00020497          	auipc	s1,0x20
    8000630a:	e3a48493          	addi	s1,s1,-454 # 80026140 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    8000630e:	89a6                	mv	s3,s1
    80006310:	00020917          	auipc	s2,0x20
    80006314:	ec890913          	addi	s2,s2,-312 # 800261d8 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80006318:	4c91                	li	s9,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    8000631a:	5d7d                	li	s10,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    8000631c:	4da9                	li	s11,10
  while(n > 0){
    8000631e:	07405863          	blez	s4,8000638e <consoleread+0xc0>
    while(cons.r == cons.w){
    80006322:	0984a783          	lw	a5,152(s1)
    80006326:	09c4a703          	lw	a4,156(s1)
    8000632a:	02f71463          	bne	a4,a5,80006352 <consoleread+0x84>
      if(myproc()->killed){
    8000632e:	ffffb097          	auipc	ra,0xffffb
    80006332:	13e080e7          	jalr	318(ra) # 8000146c <myproc>
    80006336:	551c                	lw	a5,40(a0)
    80006338:	e7b5                	bnez	a5,800063a4 <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    8000633a:	85ce                	mv	a1,s3
    8000633c:	854a                	mv	a0,s2
    8000633e:	ffffb097          	auipc	ra,0xffffb
    80006342:	7ea080e7          	jalr	2026(ra) # 80001b28 <sleep>
    while(cons.r == cons.w){
    80006346:	0984a783          	lw	a5,152(s1)
    8000634a:	09c4a703          	lw	a4,156(s1)
    8000634e:	fef700e3          	beq	a4,a5,8000632e <consoleread+0x60>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80006352:	0017871b          	addiw	a4,a5,1
    80006356:	08e4ac23          	sw	a4,152(s1)
    8000635a:	07f7f713          	andi	a4,a5,127
    8000635e:	9726                	add	a4,a4,s1
    80006360:	01874703          	lbu	a4,24(a4)
    80006364:	00070c1b          	sext.w	s8,a4
    if(c == C('D')){  // end-of-file
    80006368:	079c0663          	beq	s8,s9,800063d4 <consoleread+0x106>
    cbuf = c;
    8000636c:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80006370:	4685                	li	a3,1
    80006372:	f8f40613          	addi	a2,s0,-113
    80006376:	85d6                	mv	a1,s5
    80006378:	855a                	mv	a0,s6
    8000637a:	ffffc097          	auipc	ra,0xffffc
    8000637e:	b52080e7          	jalr	-1198(ra) # 80001ecc <either_copyout>
    80006382:	01a50663          	beq	a0,s10,8000638e <consoleread+0xc0>
    dst++;
    80006386:	0a85                	addi	s5,s5,1
    --n;
    80006388:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    8000638a:	f9bc1ae3          	bne	s8,s11,8000631e <consoleread+0x50>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    8000638e:	00020517          	auipc	a0,0x20
    80006392:	db250513          	addi	a0,a0,-590 # 80026140 <cons>
    80006396:	00001097          	auipc	ra,0x1
    8000639a:	910080e7          	jalr	-1776(ra) # 80006ca6 <release>

  return target - n;
    8000639e:	414b853b          	subw	a0,s7,s4
    800063a2:	a811                	j	800063b6 <consoleread+0xe8>
        release(&cons.lock);
    800063a4:	00020517          	auipc	a0,0x20
    800063a8:	d9c50513          	addi	a0,a0,-612 # 80026140 <cons>
    800063ac:	00001097          	auipc	ra,0x1
    800063b0:	8fa080e7          	jalr	-1798(ra) # 80006ca6 <release>
        return -1;
    800063b4:	557d                	li	a0,-1
}
    800063b6:	70e6                	ld	ra,120(sp)
    800063b8:	7446                	ld	s0,112(sp)
    800063ba:	74a6                	ld	s1,104(sp)
    800063bc:	7906                	ld	s2,96(sp)
    800063be:	69e6                	ld	s3,88(sp)
    800063c0:	6a46                	ld	s4,80(sp)
    800063c2:	6aa6                	ld	s5,72(sp)
    800063c4:	6b06                	ld	s6,64(sp)
    800063c6:	7be2                	ld	s7,56(sp)
    800063c8:	7c42                	ld	s8,48(sp)
    800063ca:	7ca2                	ld	s9,40(sp)
    800063cc:	7d02                	ld	s10,32(sp)
    800063ce:	6de2                	ld	s11,24(sp)
    800063d0:	6109                	addi	sp,sp,128
    800063d2:	8082                	ret
      if(n < target){
    800063d4:	000a071b          	sext.w	a4,s4
    800063d8:	fb777be3          	bgeu	a4,s7,8000638e <consoleread+0xc0>
        cons.r--;
    800063dc:	00020717          	auipc	a4,0x20
    800063e0:	def72e23          	sw	a5,-516(a4) # 800261d8 <cons+0x98>
    800063e4:	b76d                	j	8000638e <consoleread+0xc0>

00000000800063e6 <consputc>:
{
    800063e6:	1141                	addi	sp,sp,-16
    800063e8:	e406                	sd	ra,8(sp)
    800063ea:	e022                	sd	s0,0(sp)
    800063ec:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    800063ee:	10000793          	li	a5,256
    800063f2:	00f50a63          	beq	a0,a5,80006406 <consputc+0x20>
    uartputc_sync(c);
    800063f6:	00000097          	auipc	ra,0x0
    800063fa:	564080e7          	jalr	1380(ra) # 8000695a <uartputc_sync>
}
    800063fe:	60a2                	ld	ra,8(sp)
    80006400:	6402                	ld	s0,0(sp)
    80006402:	0141                	addi	sp,sp,16
    80006404:	8082                	ret
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80006406:	4521                	li	a0,8
    80006408:	00000097          	auipc	ra,0x0
    8000640c:	552080e7          	jalr	1362(ra) # 8000695a <uartputc_sync>
    80006410:	02000513          	li	a0,32
    80006414:	00000097          	auipc	ra,0x0
    80006418:	546080e7          	jalr	1350(ra) # 8000695a <uartputc_sync>
    8000641c:	4521                	li	a0,8
    8000641e:	00000097          	auipc	ra,0x0
    80006422:	53c080e7          	jalr	1340(ra) # 8000695a <uartputc_sync>
    80006426:	bfe1                	j	800063fe <consputc+0x18>

0000000080006428 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80006428:	1101                	addi	sp,sp,-32
    8000642a:	ec06                	sd	ra,24(sp)
    8000642c:	e822                	sd	s0,16(sp)
    8000642e:	e426                	sd	s1,8(sp)
    80006430:	e04a                	sd	s2,0(sp)
    80006432:	1000                	addi	s0,sp,32
    80006434:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80006436:	00020517          	auipc	a0,0x20
    8000643a:	d0a50513          	addi	a0,a0,-758 # 80026140 <cons>
    8000643e:	00000097          	auipc	ra,0x0
    80006442:	7b4080e7          	jalr	1972(ra) # 80006bf2 <acquire>

  switch(c){
    80006446:	47d5                	li	a5,21
    80006448:	0af48663          	beq	s1,a5,800064f4 <consoleintr+0xcc>
    8000644c:	0297ca63          	blt	a5,s1,80006480 <consoleintr+0x58>
    80006450:	47a1                	li	a5,8
    80006452:	0ef48763          	beq	s1,a5,80006540 <consoleintr+0x118>
    80006456:	47c1                	li	a5,16
    80006458:	10f49a63          	bne	s1,a5,8000656c <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    8000645c:	ffffc097          	auipc	ra,0xffffc
    80006460:	b1c080e7          	jalr	-1252(ra) # 80001f78 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80006464:	00020517          	auipc	a0,0x20
    80006468:	cdc50513          	addi	a0,a0,-804 # 80026140 <cons>
    8000646c:	00001097          	auipc	ra,0x1
    80006470:	83a080e7          	jalr	-1990(ra) # 80006ca6 <release>
}
    80006474:	60e2                	ld	ra,24(sp)
    80006476:	6442                	ld	s0,16(sp)
    80006478:	64a2                	ld	s1,8(sp)
    8000647a:	6902                	ld	s2,0(sp)
    8000647c:	6105                	addi	sp,sp,32
    8000647e:	8082                	ret
  switch(c){
    80006480:	07f00793          	li	a5,127
    80006484:	0af48e63          	beq	s1,a5,80006540 <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80006488:	00020717          	auipc	a4,0x20
    8000648c:	cb870713          	addi	a4,a4,-840 # 80026140 <cons>
    80006490:	0a072783          	lw	a5,160(a4)
    80006494:	09872703          	lw	a4,152(a4)
    80006498:	9f99                	subw	a5,a5,a4
    8000649a:	07f00713          	li	a4,127
    8000649e:	fcf763e3          	bltu	a4,a5,80006464 <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    800064a2:	47b5                	li	a5,13
    800064a4:	0cf48763          	beq	s1,a5,80006572 <consoleintr+0x14a>
      consputc(c);
    800064a8:	8526                	mv	a0,s1
    800064aa:	00000097          	auipc	ra,0x0
    800064ae:	f3c080e7          	jalr	-196(ra) # 800063e6 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    800064b2:	00020797          	auipc	a5,0x20
    800064b6:	c8e78793          	addi	a5,a5,-882 # 80026140 <cons>
    800064ba:	0a07a703          	lw	a4,160(a5)
    800064be:	0017069b          	addiw	a3,a4,1
    800064c2:	0006861b          	sext.w	a2,a3
    800064c6:	0ad7a023          	sw	a3,160(a5)
    800064ca:	07f77713          	andi	a4,a4,127
    800064ce:	97ba                	add	a5,a5,a4
    800064d0:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    800064d4:	47a9                	li	a5,10
    800064d6:	0cf48563          	beq	s1,a5,800065a0 <consoleintr+0x178>
    800064da:	4791                	li	a5,4
    800064dc:	0cf48263          	beq	s1,a5,800065a0 <consoleintr+0x178>
    800064e0:	00020797          	auipc	a5,0x20
    800064e4:	cf87a783          	lw	a5,-776(a5) # 800261d8 <cons+0x98>
    800064e8:	0807879b          	addiw	a5,a5,128
    800064ec:	f6f61ce3          	bne	a2,a5,80006464 <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    800064f0:	863e                	mv	a2,a5
    800064f2:	a07d                	j	800065a0 <consoleintr+0x178>
    while(cons.e != cons.w &&
    800064f4:	00020717          	auipc	a4,0x20
    800064f8:	c4c70713          	addi	a4,a4,-948 # 80026140 <cons>
    800064fc:	0a072783          	lw	a5,160(a4)
    80006500:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80006504:	00020497          	auipc	s1,0x20
    80006508:	c3c48493          	addi	s1,s1,-964 # 80026140 <cons>
    while(cons.e != cons.w &&
    8000650c:	4929                	li	s2,10
    8000650e:	f4f70be3          	beq	a4,a5,80006464 <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80006512:	37fd                	addiw	a5,a5,-1
    80006514:	07f7f713          	andi	a4,a5,127
    80006518:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    8000651a:	01874703          	lbu	a4,24(a4)
    8000651e:	f52703e3          	beq	a4,s2,80006464 <consoleintr+0x3c>
      cons.e--;
    80006522:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80006526:	10000513          	li	a0,256
    8000652a:	00000097          	auipc	ra,0x0
    8000652e:	ebc080e7          	jalr	-324(ra) # 800063e6 <consputc>
    while(cons.e != cons.w &&
    80006532:	0a04a783          	lw	a5,160(s1)
    80006536:	09c4a703          	lw	a4,156(s1)
    8000653a:	fcf71ce3          	bne	a4,a5,80006512 <consoleintr+0xea>
    8000653e:	b71d                	j	80006464 <consoleintr+0x3c>
    if(cons.e != cons.w){
    80006540:	00020717          	auipc	a4,0x20
    80006544:	c0070713          	addi	a4,a4,-1024 # 80026140 <cons>
    80006548:	0a072783          	lw	a5,160(a4)
    8000654c:	09c72703          	lw	a4,156(a4)
    80006550:	f0f70ae3          	beq	a4,a5,80006464 <consoleintr+0x3c>
      cons.e--;
    80006554:	37fd                	addiw	a5,a5,-1
    80006556:	00020717          	auipc	a4,0x20
    8000655a:	c8f72523          	sw	a5,-886(a4) # 800261e0 <cons+0xa0>
      consputc(BACKSPACE);
    8000655e:	10000513          	li	a0,256
    80006562:	00000097          	auipc	ra,0x0
    80006566:	e84080e7          	jalr	-380(ra) # 800063e6 <consputc>
    8000656a:	bded                	j	80006464 <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    8000656c:	ee048ce3          	beqz	s1,80006464 <consoleintr+0x3c>
    80006570:	bf21                	j	80006488 <consoleintr+0x60>
      consputc(c);
    80006572:	4529                	li	a0,10
    80006574:	00000097          	auipc	ra,0x0
    80006578:	e72080e7          	jalr	-398(ra) # 800063e6 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8000657c:	00020797          	auipc	a5,0x20
    80006580:	bc478793          	addi	a5,a5,-1084 # 80026140 <cons>
    80006584:	0a07a703          	lw	a4,160(a5)
    80006588:	0017069b          	addiw	a3,a4,1
    8000658c:	0006861b          	sext.w	a2,a3
    80006590:	0ad7a023          	sw	a3,160(a5)
    80006594:	07f77713          	andi	a4,a4,127
    80006598:	97ba                	add	a5,a5,a4
    8000659a:	4729                	li	a4,10
    8000659c:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    800065a0:	00020797          	auipc	a5,0x20
    800065a4:	c2c7ae23          	sw	a2,-964(a5) # 800261dc <cons+0x9c>
        wakeup(&cons.r);
    800065a8:	00020517          	auipc	a0,0x20
    800065ac:	c3050513          	addi	a0,a0,-976 # 800261d8 <cons+0x98>
    800065b0:	ffffb097          	auipc	ra,0xffffb
    800065b4:	704080e7          	jalr	1796(ra) # 80001cb4 <wakeup>
    800065b8:	b575                	j	80006464 <consoleintr+0x3c>

00000000800065ba <consoleinit>:

void
consoleinit(void)
{
    800065ba:	1141                	addi	sp,sp,-16
    800065bc:	e406                	sd	ra,8(sp)
    800065be:	e022                	sd	s0,0(sp)
    800065c0:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    800065c2:	00002597          	auipc	a1,0x2
    800065c6:	3be58593          	addi	a1,a1,958 # 80008980 <syscalls+0x4c0>
    800065ca:	00020517          	auipc	a0,0x20
    800065ce:	b7650513          	addi	a0,a0,-1162 # 80026140 <cons>
    800065d2:	00000097          	auipc	ra,0x0
    800065d6:	590080e7          	jalr	1424(ra) # 80006b62 <initlock>

  uartinit();
    800065da:	00000097          	auipc	ra,0x0
    800065de:	330080e7          	jalr	816(ra) # 8000690a <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    800065e2:	00013797          	auipc	a5,0x13
    800065e6:	af678793          	addi	a5,a5,-1290 # 800190d8 <devsw>
    800065ea:	00000717          	auipc	a4,0x0
    800065ee:	ce470713          	addi	a4,a4,-796 # 800062ce <consoleread>
    800065f2:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    800065f4:	00000717          	auipc	a4,0x0
    800065f8:	c7870713          	addi	a4,a4,-904 # 8000626c <consolewrite>
    800065fc:	ef98                	sd	a4,24(a5)
}
    800065fe:	60a2                	ld	ra,8(sp)
    80006600:	6402                	ld	s0,0(sp)
    80006602:	0141                	addi	sp,sp,16
    80006604:	8082                	ret

0000000080006606 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    80006606:	7179                	addi	sp,sp,-48
    80006608:	f406                	sd	ra,40(sp)
    8000660a:	f022                	sd	s0,32(sp)
    8000660c:	ec26                	sd	s1,24(sp)
    8000660e:	e84a                	sd	s2,16(sp)
    80006610:	1800                	addi	s0,sp,48
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    80006612:	c219                	beqz	a2,80006618 <printint+0x12>
    80006614:	08054663          	bltz	a0,800066a0 <printint+0x9a>
    x = -xx;
  else
    x = xx;
    80006618:	2501                	sext.w	a0,a0
    8000661a:	4881                	li	a7,0
    8000661c:	fd040693          	addi	a3,s0,-48

  i = 0;
    80006620:	4701                	li	a4,0
  do {
    buf[i++] = digits[x % base];
    80006622:	2581                	sext.w	a1,a1
    80006624:	00002617          	auipc	a2,0x2
    80006628:	38c60613          	addi	a2,a2,908 # 800089b0 <digits>
    8000662c:	883a                	mv	a6,a4
    8000662e:	2705                	addiw	a4,a4,1
    80006630:	02b577bb          	remuw	a5,a0,a1
    80006634:	1782                	slli	a5,a5,0x20
    80006636:	9381                	srli	a5,a5,0x20
    80006638:	97b2                	add	a5,a5,a2
    8000663a:	0007c783          	lbu	a5,0(a5)
    8000663e:	00f68023          	sb	a5,0(a3)
  } while((x /= base) != 0);
    80006642:	0005079b          	sext.w	a5,a0
    80006646:	02b5553b          	divuw	a0,a0,a1
    8000664a:	0685                	addi	a3,a3,1
    8000664c:	feb7f0e3          	bgeu	a5,a1,8000662c <printint+0x26>

  if(sign)
    80006650:	00088b63          	beqz	a7,80006666 <printint+0x60>
    buf[i++] = '-';
    80006654:	fe040793          	addi	a5,s0,-32
    80006658:	973e                	add	a4,a4,a5
    8000665a:	02d00793          	li	a5,45
    8000665e:	fef70823          	sb	a5,-16(a4)
    80006662:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    80006666:	02e05763          	blez	a4,80006694 <printint+0x8e>
    8000666a:	fd040793          	addi	a5,s0,-48
    8000666e:	00e784b3          	add	s1,a5,a4
    80006672:	fff78913          	addi	s2,a5,-1
    80006676:	993a                	add	s2,s2,a4
    80006678:	377d                	addiw	a4,a4,-1
    8000667a:	1702                	slli	a4,a4,0x20
    8000667c:	9301                	srli	a4,a4,0x20
    8000667e:	40e90933          	sub	s2,s2,a4
    consputc(buf[i]);
    80006682:	fff4c503          	lbu	a0,-1(s1)
    80006686:	00000097          	auipc	ra,0x0
    8000668a:	d60080e7          	jalr	-672(ra) # 800063e6 <consputc>
  while(--i >= 0)
    8000668e:	14fd                	addi	s1,s1,-1
    80006690:	ff2499e3          	bne	s1,s2,80006682 <printint+0x7c>
}
    80006694:	70a2                	ld	ra,40(sp)
    80006696:	7402                	ld	s0,32(sp)
    80006698:	64e2                	ld	s1,24(sp)
    8000669a:	6942                	ld	s2,16(sp)
    8000669c:	6145                	addi	sp,sp,48
    8000669e:	8082                	ret
    x = -xx;
    800066a0:	40a0053b          	negw	a0,a0
  if(sign && (sign = xx < 0))
    800066a4:	4885                	li	a7,1
    x = -xx;
    800066a6:	bf9d                	j	8000661c <printint+0x16>

00000000800066a8 <panic>:
    release(&pr.lock);
}

void
panic(char *s)
{
    800066a8:	1101                	addi	sp,sp,-32
    800066aa:	ec06                	sd	ra,24(sp)
    800066ac:	e822                	sd	s0,16(sp)
    800066ae:	e426                	sd	s1,8(sp)
    800066b0:	1000                	addi	s0,sp,32
    800066b2:	84aa                	mv	s1,a0
  pr.locking = 0;
    800066b4:	00020797          	auipc	a5,0x20
    800066b8:	b407a623          	sw	zero,-1204(a5) # 80026200 <pr+0x18>
  printf("panic: ");
    800066bc:	00002517          	auipc	a0,0x2
    800066c0:	2cc50513          	addi	a0,a0,716 # 80008988 <syscalls+0x4c8>
    800066c4:	00000097          	auipc	ra,0x0
    800066c8:	02e080e7          	jalr	46(ra) # 800066f2 <printf>
  printf(s);
    800066cc:	8526                	mv	a0,s1
    800066ce:	00000097          	auipc	ra,0x0
    800066d2:	024080e7          	jalr	36(ra) # 800066f2 <printf>
  printf("\n");
    800066d6:	00002517          	auipc	a0,0x2
    800066da:	97250513          	addi	a0,a0,-1678 # 80008048 <etext+0x48>
    800066de:	00000097          	auipc	ra,0x0
    800066e2:	014080e7          	jalr	20(ra) # 800066f2 <printf>
  panicked = 1; // freeze uart output from other CPUs
    800066e6:	4785                	li	a5,1
    800066e8:	00003717          	auipc	a4,0x3
    800066ec:	92f72e23          	sw	a5,-1732(a4) # 80009024 <panicked>
  for(;;)
    800066f0:	a001                	j	800066f0 <panic+0x48>

00000000800066f2 <printf>:
{
    800066f2:	7131                	addi	sp,sp,-192
    800066f4:	fc86                	sd	ra,120(sp)
    800066f6:	f8a2                	sd	s0,112(sp)
    800066f8:	f4a6                	sd	s1,104(sp)
    800066fa:	f0ca                	sd	s2,96(sp)
    800066fc:	ecce                	sd	s3,88(sp)
    800066fe:	e8d2                	sd	s4,80(sp)
    80006700:	e4d6                	sd	s5,72(sp)
    80006702:	e0da                	sd	s6,64(sp)
    80006704:	fc5e                	sd	s7,56(sp)
    80006706:	f862                	sd	s8,48(sp)
    80006708:	f466                	sd	s9,40(sp)
    8000670a:	f06a                	sd	s10,32(sp)
    8000670c:	ec6e                	sd	s11,24(sp)
    8000670e:	0100                	addi	s0,sp,128
    80006710:	8a2a                	mv	s4,a0
    80006712:	e40c                	sd	a1,8(s0)
    80006714:	e810                	sd	a2,16(s0)
    80006716:	ec14                	sd	a3,24(s0)
    80006718:	f018                	sd	a4,32(s0)
    8000671a:	f41c                	sd	a5,40(s0)
    8000671c:	03043823          	sd	a6,48(s0)
    80006720:	03143c23          	sd	a7,56(s0)
  locking = pr.locking;
    80006724:	00020d97          	auipc	s11,0x20
    80006728:	adcdad83          	lw	s11,-1316(s11) # 80026200 <pr+0x18>
  if(locking)
    8000672c:	020d9b63          	bnez	s11,80006762 <printf+0x70>
  if (fmt == 0)
    80006730:	040a0263          	beqz	s4,80006774 <printf+0x82>
  va_start(ap, fmt);
    80006734:	00840793          	addi	a5,s0,8
    80006738:	f8f43423          	sd	a5,-120(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    8000673c:	000a4503          	lbu	a0,0(s4)
    80006740:	16050263          	beqz	a0,800068a4 <printf+0x1b2>
    80006744:	4481                	li	s1,0
    if(c != '%'){
    80006746:	02500a93          	li	s5,37
    switch(c){
    8000674a:	07000b13          	li	s6,112
  consputc('x');
    8000674e:	4d41                	li	s10,16
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    80006750:	00002b97          	auipc	s7,0x2
    80006754:	260b8b93          	addi	s7,s7,608 # 800089b0 <digits>
    switch(c){
    80006758:	07300c93          	li	s9,115
    8000675c:	06400c13          	li	s8,100
    80006760:	a82d                	j	8000679a <printf+0xa8>
    acquire(&pr.lock);
    80006762:	00020517          	auipc	a0,0x20
    80006766:	a8650513          	addi	a0,a0,-1402 # 800261e8 <pr>
    8000676a:	00000097          	auipc	ra,0x0
    8000676e:	488080e7          	jalr	1160(ra) # 80006bf2 <acquire>
    80006772:	bf7d                	j	80006730 <printf+0x3e>
    panic("null fmt");
    80006774:	00002517          	auipc	a0,0x2
    80006778:	22450513          	addi	a0,a0,548 # 80008998 <syscalls+0x4d8>
    8000677c:	00000097          	auipc	ra,0x0
    80006780:	f2c080e7          	jalr	-212(ra) # 800066a8 <panic>
      consputc(c);
    80006784:	00000097          	auipc	ra,0x0
    80006788:	c62080e7          	jalr	-926(ra) # 800063e6 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    8000678c:	2485                	addiw	s1,s1,1
    8000678e:	009a07b3          	add	a5,s4,s1
    80006792:	0007c503          	lbu	a0,0(a5)
    80006796:	10050763          	beqz	a0,800068a4 <printf+0x1b2>
    if(c != '%'){
    8000679a:	ff5515e3          	bne	a0,s5,80006784 <printf+0x92>
    c = fmt[++i] & 0xff;
    8000679e:	2485                	addiw	s1,s1,1
    800067a0:	009a07b3          	add	a5,s4,s1
    800067a4:	0007c783          	lbu	a5,0(a5)
    800067a8:	0007891b          	sext.w	s2,a5
    if(c == 0)
    800067ac:	cfe5                	beqz	a5,800068a4 <printf+0x1b2>
    switch(c){
    800067ae:	05678a63          	beq	a5,s6,80006802 <printf+0x110>
    800067b2:	02fb7663          	bgeu	s6,a5,800067de <printf+0xec>
    800067b6:	09978963          	beq	a5,s9,80006848 <printf+0x156>
    800067ba:	07800713          	li	a4,120
    800067be:	0ce79863          	bne	a5,a4,8000688e <printf+0x19c>
      printint(va_arg(ap, int), 16, 1);
    800067c2:	f8843783          	ld	a5,-120(s0)
    800067c6:	00878713          	addi	a4,a5,8
    800067ca:	f8e43423          	sd	a4,-120(s0)
    800067ce:	4605                	li	a2,1
    800067d0:	85ea                	mv	a1,s10
    800067d2:	4388                	lw	a0,0(a5)
    800067d4:	00000097          	auipc	ra,0x0
    800067d8:	e32080e7          	jalr	-462(ra) # 80006606 <printint>
      break;
    800067dc:	bf45                	j	8000678c <printf+0x9a>
    switch(c){
    800067de:	0b578263          	beq	a5,s5,80006882 <printf+0x190>
    800067e2:	0b879663          	bne	a5,s8,8000688e <printf+0x19c>
      printint(va_arg(ap, int), 10, 1);
    800067e6:	f8843783          	ld	a5,-120(s0)
    800067ea:	00878713          	addi	a4,a5,8
    800067ee:	f8e43423          	sd	a4,-120(s0)
    800067f2:	4605                	li	a2,1
    800067f4:	45a9                	li	a1,10
    800067f6:	4388                	lw	a0,0(a5)
    800067f8:	00000097          	auipc	ra,0x0
    800067fc:	e0e080e7          	jalr	-498(ra) # 80006606 <printint>
      break;
    80006800:	b771                	j	8000678c <printf+0x9a>
      printptr(va_arg(ap, uint64));
    80006802:	f8843783          	ld	a5,-120(s0)
    80006806:	00878713          	addi	a4,a5,8
    8000680a:	f8e43423          	sd	a4,-120(s0)
    8000680e:	0007b983          	ld	s3,0(a5)
  consputc('0');
    80006812:	03000513          	li	a0,48
    80006816:	00000097          	auipc	ra,0x0
    8000681a:	bd0080e7          	jalr	-1072(ra) # 800063e6 <consputc>
  consputc('x');
    8000681e:	07800513          	li	a0,120
    80006822:	00000097          	auipc	ra,0x0
    80006826:	bc4080e7          	jalr	-1084(ra) # 800063e6 <consputc>
    8000682a:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    8000682c:	03c9d793          	srli	a5,s3,0x3c
    80006830:	97de                	add	a5,a5,s7
    80006832:	0007c503          	lbu	a0,0(a5)
    80006836:	00000097          	auipc	ra,0x0
    8000683a:	bb0080e7          	jalr	-1104(ra) # 800063e6 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    8000683e:	0992                	slli	s3,s3,0x4
    80006840:	397d                	addiw	s2,s2,-1
    80006842:	fe0915e3          	bnez	s2,8000682c <printf+0x13a>
    80006846:	b799                	j	8000678c <printf+0x9a>
      if((s = va_arg(ap, char*)) == 0)
    80006848:	f8843783          	ld	a5,-120(s0)
    8000684c:	00878713          	addi	a4,a5,8
    80006850:	f8e43423          	sd	a4,-120(s0)
    80006854:	0007b903          	ld	s2,0(a5)
    80006858:	00090e63          	beqz	s2,80006874 <printf+0x182>
      for(; *s; s++)
    8000685c:	00094503          	lbu	a0,0(s2)
    80006860:	d515                	beqz	a0,8000678c <printf+0x9a>
        consputc(*s);
    80006862:	00000097          	auipc	ra,0x0
    80006866:	b84080e7          	jalr	-1148(ra) # 800063e6 <consputc>
      for(; *s; s++)
    8000686a:	0905                	addi	s2,s2,1
    8000686c:	00094503          	lbu	a0,0(s2)
    80006870:	f96d                	bnez	a0,80006862 <printf+0x170>
    80006872:	bf29                	j	8000678c <printf+0x9a>
        s = "(null)";
    80006874:	00002917          	auipc	s2,0x2
    80006878:	11c90913          	addi	s2,s2,284 # 80008990 <syscalls+0x4d0>
      for(; *s; s++)
    8000687c:	02800513          	li	a0,40
    80006880:	b7cd                	j	80006862 <printf+0x170>
      consputc('%');
    80006882:	8556                	mv	a0,s5
    80006884:	00000097          	auipc	ra,0x0
    80006888:	b62080e7          	jalr	-1182(ra) # 800063e6 <consputc>
      break;
    8000688c:	b701                	j	8000678c <printf+0x9a>
      consputc('%');
    8000688e:	8556                	mv	a0,s5
    80006890:	00000097          	auipc	ra,0x0
    80006894:	b56080e7          	jalr	-1194(ra) # 800063e6 <consputc>
      consputc(c);
    80006898:	854a                	mv	a0,s2
    8000689a:	00000097          	auipc	ra,0x0
    8000689e:	b4c080e7          	jalr	-1204(ra) # 800063e6 <consputc>
      break;
    800068a2:	b5ed                	j	8000678c <printf+0x9a>
  if(locking)
    800068a4:	020d9163          	bnez	s11,800068c6 <printf+0x1d4>
}
    800068a8:	70e6                	ld	ra,120(sp)
    800068aa:	7446                	ld	s0,112(sp)
    800068ac:	74a6                	ld	s1,104(sp)
    800068ae:	7906                	ld	s2,96(sp)
    800068b0:	69e6                	ld	s3,88(sp)
    800068b2:	6a46                	ld	s4,80(sp)
    800068b4:	6aa6                	ld	s5,72(sp)
    800068b6:	6b06                	ld	s6,64(sp)
    800068b8:	7be2                	ld	s7,56(sp)
    800068ba:	7c42                	ld	s8,48(sp)
    800068bc:	7ca2                	ld	s9,40(sp)
    800068be:	7d02                	ld	s10,32(sp)
    800068c0:	6de2                	ld	s11,24(sp)
    800068c2:	6129                	addi	sp,sp,192
    800068c4:	8082                	ret
    release(&pr.lock);
    800068c6:	00020517          	auipc	a0,0x20
    800068ca:	92250513          	addi	a0,a0,-1758 # 800261e8 <pr>
    800068ce:	00000097          	auipc	ra,0x0
    800068d2:	3d8080e7          	jalr	984(ra) # 80006ca6 <release>
}
    800068d6:	bfc9                	j	800068a8 <printf+0x1b6>

00000000800068d8 <printfinit>:
    ;
}

void
printfinit(void)
{
    800068d8:	1101                	addi	sp,sp,-32
    800068da:	ec06                	sd	ra,24(sp)
    800068dc:	e822                	sd	s0,16(sp)
    800068de:	e426                	sd	s1,8(sp)
    800068e0:	1000                	addi	s0,sp,32
  initlock(&pr.lock, "pr");
    800068e2:	00020497          	auipc	s1,0x20
    800068e6:	90648493          	addi	s1,s1,-1786 # 800261e8 <pr>
    800068ea:	00002597          	auipc	a1,0x2
    800068ee:	0be58593          	addi	a1,a1,190 # 800089a8 <syscalls+0x4e8>
    800068f2:	8526                	mv	a0,s1
    800068f4:	00000097          	auipc	ra,0x0
    800068f8:	26e080e7          	jalr	622(ra) # 80006b62 <initlock>
  pr.locking = 1;
    800068fc:	4785                	li	a5,1
    800068fe:	cc9c                	sw	a5,24(s1)
}
    80006900:	60e2                	ld	ra,24(sp)
    80006902:	6442                	ld	s0,16(sp)
    80006904:	64a2                	ld	s1,8(sp)
    80006906:	6105                	addi	sp,sp,32
    80006908:	8082                	ret

000000008000690a <uartinit>:

void uartstart();

void
uartinit(void)
{
    8000690a:	1141                	addi	sp,sp,-16
    8000690c:	e406                	sd	ra,8(sp)
    8000690e:	e022                	sd	s0,0(sp)
    80006910:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80006912:	100007b7          	lui	a5,0x10000
    80006916:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    8000691a:	f8000713          	li	a4,-128
    8000691e:	00e781a3          	sb	a4,3(a5)

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80006922:	470d                	li	a4,3
    80006924:	00e78023          	sb	a4,0(a5)

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80006928:	000780a3          	sb	zero,1(a5)

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    8000692c:	00e781a3          	sb	a4,3(a5)

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80006930:	469d                	li	a3,7
    80006932:	00d78123          	sb	a3,2(a5)

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80006936:	00e780a3          	sb	a4,1(a5)

  initlock(&uart_tx_lock, "uart");
    8000693a:	00002597          	auipc	a1,0x2
    8000693e:	08e58593          	addi	a1,a1,142 # 800089c8 <digits+0x18>
    80006942:	00020517          	auipc	a0,0x20
    80006946:	8c650513          	addi	a0,a0,-1850 # 80026208 <uart_tx_lock>
    8000694a:	00000097          	auipc	ra,0x0
    8000694e:	218080e7          	jalr	536(ra) # 80006b62 <initlock>
}
    80006952:	60a2                	ld	ra,8(sp)
    80006954:	6402                	ld	s0,0(sp)
    80006956:	0141                	addi	sp,sp,16
    80006958:	8082                	ret

000000008000695a <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    8000695a:	1101                	addi	sp,sp,-32
    8000695c:	ec06                	sd	ra,24(sp)
    8000695e:	e822                	sd	s0,16(sp)
    80006960:	e426                	sd	s1,8(sp)
    80006962:	1000                	addi	s0,sp,32
    80006964:	84aa                	mv	s1,a0
  push_off();
    80006966:	00000097          	auipc	ra,0x0
    8000696a:	240080e7          	jalr	576(ra) # 80006ba6 <push_off>

  if(panicked){
    8000696e:	00002797          	auipc	a5,0x2
    80006972:	6b67a783          	lw	a5,1718(a5) # 80009024 <panicked>
    for(;;)
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80006976:	10000737          	lui	a4,0x10000
  if(panicked){
    8000697a:	c391                	beqz	a5,8000697e <uartputc_sync+0x24>
    for(;;)
    8000697c:	a001                	j	8000697c <uartputc_sync+0x22>
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    8000697e:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80006982:	0ff7f793          	andi	a5,a5,255
    80006986:	0207f793          	andi	a5,a5,32
    8000698a:	dbf5                	beqz	a5,8000697e <uartputc_sync+0x24>
    ;
  WriteReg(THR, c);
    8000698c:	0ff4f793          	andi	a5,s1,255
    80006990:	10000737          	lui	a4,0x10000
    80006994:	00f70023          	sb	a5,0(a4) # 10000000 <_entry-0x70000000>

  pop_off();
    80006998:	00000097          	auipc	ra,0x0
    8000699c:	2ae080e7          	jalr	686(ra) # 80006c46 <pop_off>
}
    800069a0:	60e2                	ld	ra,24(sp)
    800069a2:	6442                	ld	s0,16(sp)
    800069a4:	64a2                	ld	s1,8(sp)
    800069a6:	6105                	addi	sp,sp,32
    800069a8:	8082                	ret

00000000800069aa <uartstart>:
// called from both the top- and bottom-half.
void
uartstart()
{
  while(1){
    if(uart_tx_w == uart_tx_r){
    800069aa:	00002717          	auipc	a4,0x2
    800069ae:	67e73703          	ld	a4,1662(a4) # 80009028 <uart_tx_r>
    800069b2:	00002797          	auipc	a5,0x2
    800069b6:	67e7b783          	ld	a5,1662(a5) # 80009030 <uart_tx_w>
    800069ba:	06e78c63          	beq	a5,a4,80006a32 <uartstart+0x88>
{
    800069be:	7139                	addi	sp,sp,-64
    800069c0:	fc06                	sd	ra,56(sp)
    800069c2:	f822                	sd	s0,48(sp)
    800069c4:	f426                	sd	s1,40(sp)
    800069c6:	f04a                	sd	s2,32(sp)
    800069c8:	ec4e                	sd	s3,24(sp)
    800069ca:	e852                	sd	s4,16(sp)
    800069cc:	e456                	sd	s5,8(sp)
    800069ce:	0080                	addi	s0,sp,64
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    800069d0:	10000937          	lui	s2,0x10000
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    800069d4:	00020a17          	auipc	s4,0x20
    800069d8:	834a0a13          	addi	s4,s4,-1996 # 80026208 <uart_tx_lock>
    uart_tx_r += 1;
    800069dc:	00002497          	auipc	s1,0x2
    800069e0:	64c48493          	addi	s1,s1,1612 # 80009028 <uart_tx_r>
    if(uart_tx_w == uart_tx_r){
    800069e4:	00002997          	auipc	s3,0x2
    800069e8:	64c98993          	addi	s3,s3,1612 # 80009030 <uart_tx_w>
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    800069ec:	00594783          	lbu	a5,5(s2) # 10000005 <_entry-0x6ffffffb>
    800069f0:	0ff7f793          	andi	a5,a5,255
    800069f4:	0207f793          	andi	a5,a5,32
    800069f8:	c785                	beqz	a5,80006a20 <uartstart+0x76>
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    800069fa:	01f77793          	andi	a5,a4,31
    800069fe:	97d2                	add	a5,a5,s4
    80006a00:	0187ca83          	lbu	s5,24(a5)
    uart_tx_r += 1;
    80006a04:	0705                	addi	a4,a4,1
    80006a06:	e098                	sd	a4,0(s1)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80006a08:	8526                	mv	a0,s1
    80006a0a:	ffffb097          	auipc	ra,0xffffb
    80006a0e:	2aa080e7          	jalr	682(ra) # 80001cb4 <wakeup>
    
    WriteReg(THR, c);
    80006a12:	01590023          	sb	s5,0(s2)
    if(uart_tx_w == uart_tx_r){
    80006a16:	6098                	ld	a4,0(s1)
    80006a18:	0009b783          	ld	a5,0(s3)
    80006a1c:	fce798e3          	bne	a5,a4,800069ec <uartstart+0x42>
  }
}
    80006a20:	70e2                	ld	ra,56(sp)
    80006a22:	7442                	ld	s0,48(sp)
    80006a24:	74a2                	ld	s1,40(sp)
    80006a26:	7902                	ld	s2,32(sp)
    80006a28:	69e2                	ld	s3,24(sp)
    80006a2a:	6a42                	ld	s4,16(sp)
    80006a2c:	6aa2                	ld	s5,8(sp)
    80006a2e:	6121                	addi	sp,sp,64
    80006a30:	8082                	ret
    80006a32:	8082                	ret

0000000080006a34 <uartputc>:
{
    80006a34:	7179                	addi	sp,sp,-48
    80006a36:	f406                	sd	ra,40(sp)
    80006a38:	f022                	sd	s0,32(sp)
    80006a3a:	ec26                	sd	s1,24(sp)
    80006a3c:	e84a                	sd	s2,16(sp)
    80006a3e:	e44e                	sd	s3,8(sp)
    80006a40:	e052                	sd	s4,0(sp)
    80006a42:	1800                	addi	s0,sp,48
    80006a44:	89aa                	mv	s3,a0
  acquire(&uart_tx_lock);
    80006a46:	0001f517          	auipc	a0,0x1f
    80006a4a:	7c250513          	addi	a0,a0,1986 # 80026208 <uart_tx_lock>
    80006a4e:	00000097          	auipc	ra,0x0
    80006a52:	1a4080e7          	jalr	420(ra) # 80006bf2 <acquire>
  if(panicked){
    80006a56:	00002797          	auipc	a5,0x2
    80006a5a:	5ce7a783          	lw	a5,1486(a5) # 80009024 <panicked>
    80006a5e:	c391                	beqz	a5,80006a62 <uartputc+0x2e>
    for(;;)
    80006a60:	a001                	j	80006a60 <uartputc+0x2c>
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80006a62:	00002797          	auipc	a5,0x2
    80006a66:	5ce7b783          	ld	a5,1486(a5) # 80009030 <uart_tx_w>
    80006a6a:	00002717          	auipc	a4,0x2
    80006a6e:	5be73703          	ld	a4,1470(a4) # 80009028 <uart_tx_r>
    80006a72:	02070713          	addi	a4,a4,32
    80006a76:	02f71b63          	bne	a4,a5,80006aac <uartputc+0x78>
      sleep(&uart_tx_r, &uart_tx_lock);
    80006a7a:	0001fa17          	auipc	s4,0x1f
    80006a7e:	78ea0a13          	addi	s4,s4,1934 # 80026208 <uart_tx_lock>
    80006a82:	00002497          	auipc	s1,0x2
    80006a86:	5a648493          	addi	s1,s1,1446 # 80009028 <uart_tx_r>
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80006a8a:	00002917          	auipc	s2,0x2
    80006a8e:	5a690913          	addi	s2,s2,1446 # 80009030 <uart_tx_w>
      sleep(&uart_tx_r, &uart_tx_lock);
    80006a92:	85d2                	mv	a1,s4
    80006a94:	8526                	mv	a0,s1
    80006a96:	ffffb097          	auipc	ra,0xffffb
    80006a9a:	092080e7          	jalr	146(ra) # 80001b28 <sleep>
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80006a9e:	00093783          	ld	a5,0(s2)
    80006aa2:	6098                	ld	a4,0(s1)
    80006aa4:	02070713          	addi	a4,a4,32
    80006aa8:	fef705e3          	beq	a4,a5,80006a92 <uartputc+0x5e>
      uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80006aac:	0001f497          	auipc	s1,0x1f
    80006ab0:	75c48493          	addi	s1,s1,1884 # 80026208 <uart_tx_lock>
    80006ab4:	01f7f713          	andi	a4,a5,31
    80006ab8:	9726                	add	a4,a4,s1
    80006aba:	01370c23          	sb	s3,24(a4)
      uart_tx_w += 1;
    80006abe:	0785                	addi	a5,a5,1
    80006ac0:	00002717          	auipc	a4,0x2
    80006ac4:	56f73823          	sd	a5,1392(a4) # 80009030 <uart_tx_w>
      uartstart();
    80006ac8:	00000097          	auipc	ra,0x0
    80006acc:	ee2080e7          	jalr	-286(ra) # 800069aa <uartstart>
      release(&uart_tx_lock);
    80006ad0:	8526                	mv	a0,s1
    80006ad2:	00000097          	auipc	ra,0x0
    80006ad6:	1d4080e7          	jalr	468(ra) # 80006ca6 <release>
}
    80006ada:	70a2                	ld	ra,40(sp)
    80006adc:	7402                	ld	s0,32(sp)
    80006ade:	64e2                	ld	s1,24(sp)
    80006ae0:	6942                	ld	s2,16(sp)
    80006ae2:	69a2                	ld	s3,8(sp)
    80006ae4:	6a02                	ld	s4,0(sp)
    80006ae6:	6145                	addi	sp,sp,48
    80006ae8:	8082                	ret

0000000080006aea <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80006aea:	1141                	addi	sp,sp,-16
    80006aec:	e422                	sd	s0,8(sp)
    80006aee:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80006af0:	100007b7          	lui	a5,0x10000
    80006af4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006af8:	8b85                	andi	a5,a5,1
    80006afa:	cb91                	beqz	a5,80006b0e <uartgetc+0x24>
    // input data is ready.
    return ReadReg(RHR);
    80006afc:	100007b7          	lui	a5,0x10000
    80006b00:	0007c503          	lbu	a0,0(a5) # 10000000 <_entry-0x70000000>
    80006b04:	0ff57513          	andi	a0,a0,255
  } else {
    return -1;
  }
}
    80006b08:	6422                	ld	s0,8(sp)
    80006b0a:	0141                	addi	sp,sp,16
    80006b0c:	8082                	ret
    return -1;
    80006b0e:	557d                	li	a0,-1
    80006b10:	bfe5                	j	80006b08 <uartgetc+0x1e>

0000000080006b12 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80006b12:	1101                	addi	sp,sp,-32
    80006b14:	ec06                	sd	ra,24(sp)
    80006b16:	e822                	sd	s0,16(sp)
    80006b18:	e426                	sd	s1,8(sp)
    80006b1a:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    if(c == -1)
    80006b1c:	54fd                	li	s1,-1
    int c = uartgetc();
    80006b1e:	00000097          	auipc	ra,0x0
    80006b22:	fcc080e7          	jalr	-52(ra) # 80006aea <uartgetc>
    if(c == -1)
    80006b26:	00950763          	beq	a0,s1,80006b34 <uartintr+0x22>
      break;
    consoleintr(c);
    80006b2a:	00000097          	auipc	ra,0x0
    80006b2e:	8fe080e7          	jalr	-1794(ra) # 80006428 <consoleintr>
  while(1){
    80006b32:	b7f5                	j	80006b1e <uartintr+0xc>
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80006b34:	0001f497          	auipc	s1,0x1f
    80006b38:	6d448493          	addi	s1,s1,1748 # 80026208 <uart_tx_lock>
    80006b3c:	8526                	mv	a0,s1
    80006b3e:	00000097          	auipc	ra,0x0
    80006b42:	0b4080e7          	jalr	180(ra) # 80006bf2 <acquire>
  uartstart();
    80006b46:	00000097          	auipc	ra,0x0
    80006b4a:	e64080e7          	jalr	-412(ra) # 800069aa <uartstart>
  release(&uart_tx_lock);
    80006b4e:	8526                	mv	a0,s1
    80006b50:	00000097          	auipc	ra,0x0
    80006b54:	156080e7          	jalr	342(ra) # 80006ca6 <release>
}
    80006b58:	60e2                	ld	ra,24(sp)
    80006b5a:	6442                	ld	s0,16(sp)
    80006b5c:	64a2                	ld	s1,8(sp)
    80006b5e:	6105                	addi	sp,sp,32
    80006b60:	8082                	ret

0000000080006b62 <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    80006b62:	1141                	addi	sp,sp,-16
    80006b64:	e422                	sd	s0,8(sp)
    80006b66:	0800                	addi	s0,sp,16
  lk->name = name;
    80006b68:	e50c                	sd	a1,8(a0)
  lk->locked = 0;
    80006b6a:	00052023          	sw	zero,0(a0)
  lk->cpu = 0;
    80006b6e:	00053823          	sd	zero,16(a0)
}
    80006b72:	6422                	ld	s0,8(sp)
    80006b74:	0141                	addi	sp,sp,16
    80006b76:	8082                	ret

0000000080006b78 <holding>:
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80006b78:	411c                	lw	a5,0(a0)
    80006b7a:	e399                	bnez	a5,80006b80 <holding+0x8>
    80006b7c:	4501                	li	a0,0
  return r;
}
    80006b7e:	8082                	ret
{
    80006b80:	1101                	addi	sp,sp,-32
    80006b82:	ec06                	sd	ra,24(sp)
    80006b84:	e822                	sd	s0,16(sp)
    80006b86:	e426                	sd	s1,8(sp)
    80006b88:	1000                	addi	s0,sp,32
  r = (lk->locked && lk->cpu == mycpu());
    80006b8a:	6904                	ld	s1,16(a0)
    80006b8c:	ffffb097          	auipc	ra,0xffffb
    80006b90:	8c4080e7          	jalr	-1852(ra) # 80001450 <mycpu>
    80006b94:	40a48533          	sub	a0,s1,a0
    80006b98:	00153513          	seqz	a0,a0
}
    80006b9c:	60e2                	ld	ra,24(sp)
    80006b9e:	6442                	ld	s0,16(sp)
    80006ba0:	64a2                	ld	s1,8(sp)
    80006ba2:	6105                	addi	sp,sp,32
    80006ba4:	8082                	ret

0000000080006ba6 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    80006ba6:	1101                	addi	sp,sp,-32
    80006ba8:	ec06                	sd	ra,24(sp)
    80006baa:	e822                	sd	s0,16(sp)
    80006bac:	e426                	sd	s1,8(sp)
    80006bae:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80006bb0:	100024f3          	csrr	s1,sstatus
    80006bb4:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80006bb8:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80006bba:	10079073          	csrw	sstatus,a5
  int old = intr_get();

  intr_off();
  if(mycpu()->noff == 0)
    80006bbe:	ffffb097          	auipc	ra,0xffffb
    80006bc2:	892080e7          	jalr	-1902(ra) # 80001450 <mycpu>
    80006bc6:	5d3c                	lw	a5,120(a0)
    80006bc8:	cf89                	beqz	a5,80006be2 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    80006bca:	ffffb097          	auipc	ra,0xffffb
    80006bce:	886080e7          	jalr	-1914(ra) # 80001450 <mycpu>
    80006bd2:	5d3c                	lw	a5,120(a0)
    80006bd4:	2785                	addiw	a5,a5,1
    80006bd6:	dd3c                	sw	a5,120(a0)
}
    80006bd8:	60e2                	ld	ra,24(sp)
    80006bda:	6442                	ld	s0,16(sp)
    80006bdc:	64a2                	ld	s1,8(sp)
    80006bde:	6105                	addi	sp,sp,32
    80006be0:	8082                	ret
    mycpu()->intena = old;
    80006be2:	ffffb097          	auipc	ra,0xffffb
    80006be6:	86e080e7          	jalr	-1938(ra) # 80001450 <mycpu>
  return (x & SSTATUS_SIE) != 0;
    80006bea:	8085                	srli	s1,s1,0x1
    80006bec:	8885                	andi	s1,s1,1
    80006bee:	dd64                	sw	s1,124(a0)
    80006bf0:	bfe9                	j	80006bca <push_off+0x24>

0000000080006bf2 <acquire>:
{
    80006bf2:	1101                	addi	sp,sp,-32
    80006bf4:	ec06                	sd	ra,24(sp)
    80006bf6:	e822                	sd	s0,16(sp)
    80006bf8:	e426                	sd	s1,8(sp)
    80006bfa:	1000                	addi	s0,sp,32
    80006bfc:	84aa                	mv	s1,a0
  push_off(); // disable interrupts to avoid deadlock.
    80006bfe:	00000097          	auipc	ra,0x0
    80006c02:	fa8080e7          	jalr	-88(ra) # 80006ba6 <push_off>
  if(holding(lk))
    80006c06:	8526                	mv	a0,s1
    80006c08:	00000097          	auipc	ra,0x0
    80006c0c:	f70080e7          	jalr	-144(ra) # 80006b78 <holding>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    80006c10:	4705                	li	a4,1
  if(holding(lk))
    80006c12:	e115                	bnez	a0,80006c36 <acquire+0x44>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    80006c14:	87ba                	mv	a5,a4
    80006c16:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006c1a:	2781                	sext.w	a5,a5
    80006c1c:	ffe5                	bnez	a5,80006c14 <acquire+0x22>
  __sync_synchronize();
    80006c1e:	0ff0000f          	fence
  lk->cpu = mycpu();
    80006c22:	ffffb097          	auipc	ra,0xffffb
    80006c26:	82e080e7          	jalr	-2002(ra) # 80001450 <mycpu>
    80006c2a:	e888                	sd	a0,16(s1)
}
    80006c2c:	60e2                	ld	ra,24(sp)
    80006c2e:	6442                	ld	s0,16(sp)
    80006c30:	64a2                	ld	s1,8(sp)
    80006c32:	6105                	addi	sp,sp,32
    80006c34:	8082                	ret
    panic("acquire");
    80006c36:	00002517          	auipc	a0,0x2
    80006c3a:	d9a50513          	addi	a0,a0,-614 # 800089d0 <digits+0x20>
    80006c3e:	00000097          	auipc	ra,0x0
    80006c42:	a6a080e7          	jalr	-1430(ra) # 800066a8 <panic>

0000000080006c46 <pop_off>:

void
pop_off(void)
{
    80006c46:	1141                	addi	sp,sp,-16
    80006c48:	e406                	sd	ra,8(sp)
    80006c4a:	e022                	sd	s0,0(sp)
    80006c4c:	0800                	addi	s0,sp,16
  struct cpu *c = mycpu();
    80006c4e:	ffffb097          	auipc	ra,0xffffb
    80006c52:	802080e7          	jalr	-2046(ra) # 80001450 <mycpu>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80006c56:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80006c5a:	8b89                	andi	a5,a5,2
  if(intr_get())
    80006c5c:	e78d                	bnez	a5,80006c86 <pop_off+0x40>
    panic("pop_off - interruptible");
  if(c->noff < 1)
    80006c5e:	5d3c                	lw	a5,120(a0)
    80006c60:	02f05b63          	blez	a5,80006c96 <pop_off+0x50>
    panic("pop_off");
  c->noff -= 1;
    80006c64:	37fd                	addiw	a5,a5,-1
    80006c66:	0007871b          	sext.w	a4,a5
    80006c6a:	dd3c                	sw	a5,120(a0)
  if(c->noff == 0 && c->intena)
    80006c6c:	eb09                	bnez	a4,80006c7e <pop_off+0x38>
    80006c6e:	5d7c                	lw	a5,124(a0)
    80006c70:	c799                	beqz	a5,80006c7e <pop_off+0x38>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80006c72:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80006c76:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80006c7a:	10079073          	csrw	sstatus,a5
    intr_on();
}
    80006c7e:	60a2                	ld	ra,8(sp)
    80006c80:	6402                	ld	s0,0(sp)
    80006c82:	0141                	addi	sp,sp,16
    80006c84:	8082                	ret
    panic("pop_off - interruptible");
    80006c86:	00002517          	auipc	a0,0x2
    80006c8a:	d5250513          	addi	a0,a0,-686 # 800089d8 <digits+0x28>
    80006c8e:	00000097          	auipc	ra,0x0
    80006c92:	a1a080e7          	jalr	-1510(ra) # 800066a8 <panic>
    panic("pop_off");
    80006c96:	00002517          	auipc	a0,0x2
    80006c9a:	d5a50513          	addi	a0,a0,-678 # 800089f0 <digits+0x40>
    80006c9e:	00000097          	auipc	ra,0x0
    80006ca2:	a0a080e7          	jalr	-1526(ra) # 800066a8 <panic>

0000000080006ca6 <release>:
{
    80006ca6:	1101                	addi	sp,sp,-32
    80006ca8:	ec06                	sd	ra,24(sp)
    80006caa:	e822                	sd	s0,16(sp)
    80006cac:	e426                	sd	s1,8(sp)
    80006cae:	1000                	addi	s0,sp,32
    80006cb0:	84aa                	mv	s1,a0
  if(!holding(lk))
    80006cb2:	00000097          	auipc	ra,0x0
    80006cb6:	ec6080e7          	jalr	-314(ra) # 80006b78 <holding>
    80006cba:	c115                	beqz	a0,80006cde <release+0x38>
  lk->cpu = 0;
    80006cbc:	0004b823          	sd	zero,16(s1)
  __sync_synchronize();
    80006cc0:	0ff0000f          	fence
  __sync_lock_release(&lk->locked);
    80006cc4:	0f50000f          	fence	iorw,ow
    80006cc8:	0804a02f          	amoswap.w	zero,zero,(s1)
  pop_off();
    80006ccc:	00000097          	auipc	ra,0x0
    80006cd0:	f7a080e7          	jalr	-134(ra) # 80006c46 <pop_off>
}
    80006cd4:	60e2                	ld	ra,24(sp)
    80006cd6:	6442                	ld	s0,16(sp)
    80006cd8:	64a2                	ld	s1,8(sp)
    80006cda:	6105                	addi	sp,sp,32
    80006cdc:	8082                	ret
    panic("release");
    80006cde:	00002517          	auipc	a0,0x2
    80006ce2:	d1a50513          	addi	a0,a0,-742 # 800089f8 <digits+0x48>
    80006ce6:	00000097          	auipc	ra,0x0
    80006cea:	9c2080e7          	jalr	-1598(ra) # 800066a8 <panic>
	...

0000000080007000 <_trampoline>:
    80007000:	14051573          	csrrw	a0,sscratch,a0
    80007004:	02153423          	sd	ra,40(a0)
    80007008:	02253823          	sd	sp,48(a0)
    8000700c:	02353c23          	sd	gp,56(a0)
    80007010:	04453023          	sd	tp,64(a0)
    80007014:	04553423          	sd	t0,72(a0)
    80007018:	04653823          	sd	t1,80(a0)
    8000701c:	04753c23          	sd	t2,88(a0)
    80007020:	f120                	sd	s0,96(a0)
    80007022:	f524                	sd	s1,104(a0)
    80007024:	fd2c                	sd	a1,120(a0)
    80007026:	e150                	sd	a2,128(a0)
    80007028:	e554                	sd	a3,136(a0)
    8000702a:	e958                	sd	a4,144(a0)
    8000702c:	ed5c                	sd	a5,152(a0)
    8000702e:	0b053023          	sd	a6,160(a0)
    80007032:	0b153423          	sd	a7,168(a0)
    80007036:	0b253823          	sd	s2,176(a0)
    8000703a:	0b353c23          	sd	s3,184(a0)
    8000703e:	0d453023          	sd	s4,192(a0)
    80007042:	0d553423          	sd	s5,200(a0)
    80007046:	0d653823          	sd	s6,208(a0)
    8000704a:	0d753c23          	sd	s7,216(a0)
    8000704e:	0f853023          	sd	s8,224(a0)
    80007052:	0f953423          	sd	s9,232(a0)
    80007056:	0fa53823          	sd	s10,240(a0)
    8000705a:	0fb53c23          	sd	s11,248(a0)
    8000705e:	11c53023          	sd	t3,256(a0)
    80007062:	11d53423          	sd	t4,264(a0)
    80007066:	11e53823          	sd	t5,272(a0)
    8000706a:	11f53c23          	sd	t6,280(a0)
    8000706e:	140022f3          	csrr	t0,sscratch
    80007072:	06553823          	sd	t0,112(a0)
    80007076:	00853103          	ld	sp,8(a0)
    8000707a:	02053203          	ld	tp,32(a0)
    8000707e:	01053283          	ld	t0,16(a0)
    80007082:	00053303          	ld	t1,0(a0)
    80007086:	18031073          	csrw	satp,t1
    8000708a:	12000073          	sfence.vma
    8000708e:	8282                	jr	t0

0000000080007090 <userret>:
    80007090:	18059073          	csrw	satp,a1
    80007094:	12000073          	sfence.vma
    80007098:	07053283          	ld	t0,112(a0)
    8000709c:	14029073          	csrw	sscratch,t0
    800070a0:	02853083          	ld	ra,40(a0)
    800070a4:	03053103          	ld	sp,48(a0)
    800070a8:	03853183          	ld	gp,56(a0)
    800070ac:	04053203          	ld	tp,64(a0)
    800070b0:	04853283          	ld	t0,72(a0)
    800070b4:	05053303          	ld	t1,80(a0)
    800070b8:	05853383          	ld	t2,88(a0)
    800070bc:	7120                	ld	s0,96(a0)
    800070be:	7524                	ld	s1,104(a0)
    800070c0:	7d2c                	ld	a1,120(a0)
    800070c2:	6150                	ld	a2,128(a0)
    800070c4:	6554                	ld	a3,136(a0)
    800070c6:	6958                	ld	a4,144(a0)
    800070c8:	6d5c                	ld	a5,152(a0)
    800070ca:	0a053803          	ld	a6,160(a0)
    800070ce:	0a853883          	ld	a7,168(a0)
    800070d2:	0b053903          	ld	s2,176(a0)
    800070d6:	0b853983          	ld	s3,184(a0)
    800070da:	0c053a03          	ld	s4,192(a0)
    800070de:	0c853a83          	ld	s5,200(a0)
    800070e2:	0d053b03          	ld	s6,208(a0)
    800070e6:	0d853b83          	ld	s7,216(a0)
    800070ea:	0e053c03          	ld	s8,224(a0)
    800070ee:	0e853c83          	ld	s9,232(a0)
    800070f2:	0f053d03          	ld	s10,240(a0)
    800070f6:	0f853d83          	ld	s11,248(a0)
    800070fa:	10053e03          	ld	t3,256(a0)
    800070fe:	10853e83          	ld	t4,264(a0)
    80007102:	11053f03          	ld	t5,272(a0)
    80007106:	11853f83          	ld	t6,280(a0)
    8000710a:	14051573          	csrrw	a0,sscratch,a0
    8000710e:	10200073          	sret
	...
