
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	8a813103          	ld	sp,-1880(sp) # 8000b8a8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	170000ef          	jal	ra,80000186 <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002a:	fe843783          	ld	a5,-24(s0)
}
    8000002e:	853e                	mv	a0,a5
    80000030:	6462                	ld	s0,24(sp)
    80000032:	6105                	addi	sp,sp,32
    80000034:	8082                	ret

0000000080000036 <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    80000036:	1101                	addi	sp,sp,-32
    80000038:	ec22                	sd	s0,24(sp)
    8000003a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    8000003c:	300027f3          	csrr	a5,mstatus
    80000040:	fef43423          	sd	a5,-24(s0)
  return x;
    80000044:	fe843783          	ld	a5,-24(s0)
}
    80000048:	853e                	mv	a0,a5
    8000004a:	6462                	ld	s0,24(sp)
    8000004c:	6105                	addi	sp,sp,32
    8000004e:	8082                	ret

0000000080000050 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000050:	1101                	addi	sp,sp,-32
    80000052:	ec22                	sd	s0,24(sp)
    80000054:	1000                	addi	s0,sp,32
    80000056:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    8000005a:	fe843783          	ld	a5,-24(s0)
    8000005e:	30079073          	csrw	mstatus,a5
}
    80000062:	0001                	nop
    80000064:	6462                	ld	s0,24(sp)
    80000066:	6105                	addi	sp,sp,32
    80000068:	8082                	ret

000000008000006a <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    8000006a:	1101                	addi	sp,sp,-32
    8000006c:	ec22                	sd	s0,24(sp)
    8000006e:	1000                	addi	s0,sp,32
    80000070:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000074:	fe843783          	ld	a5,-24(s0)
    80000078:	34179073          	csrw	mepc,a5
}
    8000007c:	0001                	nop
    8000007e:	6462                	ld	s0,24(sp)
    80000080:	6105                	addi	sp,sp,32
    80000082:	8082                	ret

0000000080000084 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000084:	1101                	addi	sp,sp,-32
    80000086:	ec22                	sd	s0,24(sp)
    80000088:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000008a:	104027f3          	csrr	a5,sie
    8000008e:	fef43423          	sd	a5,-24(s0)
  return x;
    80000092:	fe843783          	ld	a5,-24(s0)
}
    80000096:	853e                	mv	a0,a5
    80000098:	6462                	ld	s0,24(sp)
    8000009a:	6105                	addi	sp,sp,32
    8000009c:	8082                	ret

000000008000009e <w_sie>:

static inline void 
w_sie(uint64 x)
{
    8000009e:	1101                	addi	sp,sp,-32
    800000a0:	ec22                	sd	s0,24(sp)
    800000a2:	1000                	addi	s0,sp,32
    800000a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000a8:	fe843783          	ld	a5,-24(s0)
    800000ac:	10479073          	csrw	sie,a5
}
    800000b0:	0001                	nop
    800000b2:	6462                	ld	s0,24(sp)
    800000b4:	6105                	addi	sp,sp,32
    800000b6:	8082                	ret

00000000800000b8 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000b8:	1101                	addi	sp,sp,-32
    800000ba:	ec22                	sd	s0,24(sp)
    800000bc:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000be:	304027f3          	csrr	a5,mie
    800000c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800000c6:	fe843783          	ld	a5,-24(s0)
}
    800000ca:	853e                	mv	a0,a5
    800000cc:	6462                	ld	s0,24(sp)
    800000ce:	6105                	addi	sp,sp,32
    800000d0:	8082                	ret

00000000800000d2 <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000d2:	1101                	addi	sp,sp,-32
    800000d4:	ec22                	sd	s0,24(sp)
    800000d6:	1000                	addi	s0,sp,32
    800000d8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000dc:	fe843783          	ld	a5,-24(s0)
    800000e0:	30479073          	csrw	mie,a5
}
    800000e4:	0001                	nop
    800000e6:	6462                	ld	s0,24(sp)
    800000e8:	6105                	addi	sp,sp,32
    800000ea:	8082                	ret

00000000800000ec <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    800000ec:	1101                	addi	sp,sp,-32
    800000ee:	ec22                	sd	s0,24(sp)
    800000f0:	1000                	addi	s0,sp,32
    800000f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    800000f6:	fe843783          	ld	a5,-24(s0)
    800000fa:	30279073          	csrw	medeleg,a5
}
    800000fe:	0001                	nop
    80000100:	6462                	ld	s0,24(sp)
    80000102:	6105                	addi	sp,sp,32
    80000104:	8082                	ret

0000000080000106 <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    80000106:	1101                	addi	sp,sp,-32
    80000108:	ec22                	sd	s0,24(sp)
    8000010a:	1000                	addi	s0,sp,32
    8000010c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000110:	fe843783          	ld	a5,-24(s0)
    80000114:	30379073          	csrw	mideleg,a5
}
    80000118:	0001                	nop
    8000011a:	6462                	ld	s0,24(sp)
    8000011c:	6105                	addi	sp,sp,32
    8000011e:	8082                	ret

0000000080000120 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000120:	1101                	addi	sp,sp,-32
    80000122:	ec22                	sd	s0,24(sp)
    80000124:	1000                	addi	s0,sp,32
    80000126:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    8000012a:	fe843783          	ld	a5,-24(s0)
    8000012e:	30579073          	csrw	mtvec,a5
}
    80000132:	0001                	nop
    80000134:	6462                	ld	s0,24(sp)
    80000136:	6105                	addi	sp,sp,32
    80000138:	8082                	ret

000000008000013a <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	18079073          	csrw	satp,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_mscratch>:
  asm volatile("csrw sscratch, %0" : : "r" (x));
}

static inline void 
w_mscratch(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	34079073          	csrw	mscratch,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	823e                	mv	tp,a5
}
    8000017e:	0001                	nop
    80000180:	6462                	ld	s0,24(sp)
    80000182:	6105                	addi	sp,sp,32
    80000184:	8082                	ret

0000000080000186 <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    80000186:	1101                	addi	sp,sp,-32
    80000188:	ec06                	sd	ra,24(sp)
    8000018a:	e822                	sd	s0,16(sp)
    8000018c:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    8000018e:	00000097          	auipc	ra,0x0
    80000192:	ea8080e7          	jalr	-344(ra) # 80000036 <r_mstatus>
    80000196:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    8000019a:	fe843703          	ld	a4,-24(s0)
    8000019e:	77f9                	lui	a5,0xffffe
    800001a0:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ff8c7ff>
    800001a4:	8ff9                	and	a5,a5,a4
    800001a6:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001aa:	fe843703          	ld	a4,-24(s0)
    800001ae:	6785                	lui	a5,0x1
    800001b0:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001b4:	8fd9                	or	a5,a5,a4
    800001b6:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ba:	fe843503          	ld	a0,-24(s0)
    800001be:	00000097          	auipc	ra,0x0
    800001c2:	e92080e7          	jalr	-366(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001c6:	00001797          	auipc	a5,0x1
    800001ca:	63278793          	addi	a5,a5,1586 # 800017f8 <main>
    800001ce:	853e                	mv	a0,a5
    800001d0:	00000097          	auipc	ra,0x0
    800001d4:	e9a080e7          	jalr	-358(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    800001d8:	4501                	li	a0,0
    800001da:	00000097          	auipc	ra,0x0
    800001de:	f60080e7          	jalr	-160(ra) # 8000013a <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    800001e2:	67c1                	lui	a5,0x10
    800001e4:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    800001e8:	00000097          	auipc	ra,0x0
    800001ec:	f04080e7          	jalr	-252(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    800001f0:	67c1                	lui	a5,0x10
    800001f2:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    800001f6:	00000097          	auipc	ra,0x0
    800001fa:	f10080e7          	jalr	-240(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    800001fe:	00000097          	auipc	ra,0x0
    80000202:	e86080e7          	jalr	-378(ra) # 80000084 <r_sie>
    80000206:	87aa                	mv	a5,a0
    80000208:	2227e793          	ori	a5,a5,546
    8000020c:	853e                	mv	a0,a5
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	e90080e7          	jalr	-368(ra) # 8000009e <w_sie>

  // ask for clock interrupts.
  timerinit();
    80000216:	00000097          	auipc	ra,0x0
    8000021a:	032080e7          	jalr	50(ra) # 80000248 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000021e:	00000097          	auipc	ra,0x0
    80000222:	dfe080e7          	jalr	-514(ra) # 8000001c <r_mhartid>
    80000226:	87aa                	mv	a5,a0
    80000228:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    8000022c:	fe442783          	lw	a5,-28(s0)
    80000230:	853e                	mv	a0,a5
    80000232:	00000097          	auipc	ra,0x0
    80000236:	f3c080e7          	jalr	-196(ra) # 8000016e <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    8000023a:	30200073          	mret
}
    8000023e:	0001                	nop
    80000240:	60e2                	ld	ra,24(sp)
    80000242:	6442                	ld	s0,16(sp)
    80000244:	6105                	addi	sp,sp,32
    80000246:	8082                	ret

0000000080000248 <timerinit>:
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000248:	1101                	addi	sp,sp,-32
    8000024a:	ec06                	sd	ra,24(sp)
    8000024c:	e822                	sd	s0,16(sp)
    8000024e:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    80000250:	00000097          	auipc	ra,0x0
    80000254:	dcc080e7          	jalr	-564(ra) # 8000001c <r_mhartid>
    80000258:	87aa                	mv	a5,a0
    8000025a:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 100000; // cycles; about 1/10th second in qemu.
    8000025e:	67e1                	lui	a5,0x18
    80000260:	6a07879b          	addiw	a5,a5,1696
    80000264:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    80000268:	0200c7b7          	lui	a5,0x200c
    8000026c:	17e1                	addi	a5,a5,-8
    8000026e:	6398                	ld	a4,0(a5)
    80000270:	fe842783          	lw	a5,-24(s0)
    80000274:	fec42683          	lw	a3,-20(s0)
    80000278:	0036969b          	slliw	a3,a3,0x3
    8000027c:	2681                	sext.w	a3,a3
    8000027e:	8636                	mv	a2,a3
    80000280:	020046b7          	lui	a3,0x2004
    80000284:	96b2                	add	a3,a3,a2
    80000286:	97ba                	add	a5,a5,a4
    80000288:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    8000028a:	fec42703          	lw	a4,-20(s0)
    8000028e:	87ba                	mv	a5,a4
    80000290:	078a                	slli	a5,a5,0x2
    80000292:	97ba                	add	a5,a5,a4
    80000294:	078e                	slli	a5,a5,0x3
    80000296:	00014717          	auipc	a4,0x14
    8000029a:	d9a70713          	addi	a4,a4,-614 # 80014030 <timer_scratch>
    8000029e:	97ba                	add	a5,a5,a4
    800002a0:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002a4:	fec42783          	lw	a5,-20(s0)
    800002a8:	0037979b          	slliw	a5,a5,0x3
    800002ac:	2781                	sext.w	a5,a5
    800002ae:	873e                	mv	a4,a5
    800002b0:	020047b7          	lui	a5,0x2004
    800002b4:	973e                	add	a4,a4,a5
    800002b6:	fe043783          	ld	a5,-32(s0)
    800002ba:	07e1                	addi	a5,a5,24
    800002bc:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    800002be:	fe043783          	ld	a5,-32(s0)
    800002c2:	02078793          	addi	a5,a5,32 # 2004020 <_entry-0x7dffbfe0>
    800002c6:	fe842703          	lw	a4,-24(s0)
    800002ca:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    800002cc:	fe043783          	ld	a5,-32(s0)
    800002d0:	853e                	mv	a0,a5
    800002d2:	00000097          	auipc	ra,0x0
    800002d6:	e82080e7          	jalr	-382(ra) # 80000154 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    800002da:	00009797          	auipc	a5,0x9
    800002de:	98678793          	addi	a5,a5,-1658 # 80008c60 <timervec>
    800002e2:	853e                	mv	a0,a5
    800002e4:	00000097          	auipc	ra,0x0
    800002e8:	e3c080e7          	jalr	-452(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    800002ec:	00000097          	auipc	ra,0x0
    800002f0:	d4a080e7          	jalr	-694(ra) # 80000036 <r_mstatus>
    800002f4:	87aa                	mv	a5,a0
    800002f6:	0087e793          	ori	a5,a5,8
    800002fa:	853e                	mv	a0,a5
    800002fc:	00000097          	auipc	ra,0x0
    80000300:	d54080e7          	jalr	-684(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000304:	00000097          	auipc	ra,0x0
    80000308:	db4080e7          	jalr	-588(ra) # 800000b8 <r_mie>
    8000030c:	87aa                	mv	a5,a0
    8000030e:	0807e793          	ori	a5,a5,128
    80000312:	853e                	mv	a0,a5
    80000314:	00000097          	auipc	ra,0x0
    80000318:	dbe080e7          	jalr	-578(ra) # 800000d2 <w_mie>
}
    8000031c:	0001                	nop
    8000031e:	60e2                	ld	ra,24(sp)
    80000320:	6442                	ld	s0,16(sp)
    80000322:	6105                	addi	sp,sp,32
    80000324:	8082                	ret

0000000080000326 <consputc>:
// called by printf, and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000326:	1101                	addi	sp,sp,-32
    80000328:	ec06                	sd	ra,24(sp)
    8000032a:	e822                	sd	s0,16(sp)
    8000032c:	1000                	addi	s0,sp,32
    8000032e:	87aa                	mv	a5,a0
    80000330:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000334:	fec42783          	lw	a5,-20(s0)
    80000338:	0007871b          	sext.w	a4,a5
    8000033c:	10000793          	li	a5,256
    80000340:	02f71363          	bne	a4,a5,80000366 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000344:	4521                	li	a0,8
    80000346:	00001097          	auipc	ra,0x1
    8000034a:	af6080e7          	jalr	-1290(ra) # 80000e3c <uartputc_sync>
    8000034e:	02000513          	li	a0,32
    80000352:	00001097          	auipc	ra,0x1
    80000356:	aea080e7          	jalr	-1302(ra) # 80000e3c <uartputc_sync>
    8000035a:	4521                	li	a0,8
    8000035c:	00001097          	auipc	ra,0x1
    80000360:	ae0080e7          	jalr	-1312(ra) # 80000e3c <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    80000364:	a801                	j	80000374 <consputc+0x4e>
    uartputc_sync(c);
    80000366:	fec42783          	lw	a5,-20(s0)
    8000036a:	853e                	mv	a0,a5
    8000036c:	00001097          	auipc	ra,0x1
    80000370:	ad0080e7          	jalr	-1328(ra) # 80000e3c <uartputc_sync>
}
    80000374:	0001                	nop
    80000376:	60e2                	ld	ra,24(sp)
    80000378:	6442                	ld	s0,16(sp)
    8000037a:	6105                	addi	sp,sp,32
    8000037c:	8082                	ret

000000008000037e <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    8000037e:	7179                	addi	sp,sp,-48
    80000380:	f406                	sd	ra,40(sp)
    80000382:	f022                	sd	s0,32(sp)
    80000384:	1800                	addi	s0,sp,48
    80000386:	87aa                	mv	a5,a0
    80000388:	fcb43823          	sd	a1,-48(s0)
    8000038c:	8732                	mv	a4,a2
    8000038e:	fcf42e23          	sw	a5,-36(s0)
    80000392:	87ba                	mv	a5,a4
    80000394:	fcf42c23          	sw	a5,-40(s0)
  int i;

  acquire(&cons.lock);
    80000398:	00014517          	auipc	a0,0x14
    8000039c:	dd850513          	addi	a0,a0,-552 # 80014170 <cons>
    800003a0:	00001097          	auipc	ra,0x1
    800003a4:	ede080e7          	jalr	-290(ra) # 8000127e <acquire>
  for(i = 0; i < n; i++){
    800003a8:	fe042623          	sw	zero,-20(s0)
    800003ac:	a0a1                	j	800003f4 <consolewrite+0x76>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003ae:	fec42703          	lw	a4,-20(s0)
    800003b2:	fd043783          	ld	a5,-48(s0)
    800003b6:	00f70633          	add	a2,a4,a5
    800003ba:	fdc42703          	lw	a4,-36(s0)
    800003be:	feb40793          	addi	a5,s0,-21
    800003c2:	4685                	li	a3,1
    800003c4:	85ba                	mv	a1,a4
    800003c6:	853e                	mv	a0,a5
    800003c8:	00003097          	auipc	ra,0x3
    800003cc:	40e080e7          	jalr	1038(ra) # 800037d6 <either_copyin>
    800003d0:	87aa                	mv	a5,a0
    800003d2:	873e                	mv	a4,a5
    800003d4:	57fd                	li	a5,-1
    800003d6:	02f70863          	beq	a4,a5,80000406 <consolewrite+0x88>
      break;
    uartputc(c);
    800003da:	feb44783          	lbu	a5,-21(s0)
    800003de:	2781                	sext.w	a5,a5
    800003e0:	853e                	mv	a0,a5
    800003e2:	00001097          	auipc	ra,0x1
    800003e6:	970080e7          	jalr	-1680(ra) # 80000d52 <uartputc>
  for(i = 0; i < n; i++){
    800003ea:	fec42783          	lw	a5,-20(s0)
    800003ee:	2785                	addiw	a5,a5,1
    800003f0:	fef42623          	sw	a5,-20(s0)
    800003f4:	fec42703          	lw	a4,-20(s0)
    800003f8:	fd842783          	lw	a5,-40(s0)
    800003fc:	2701                	sext.w	a4,a4
    800003fe:	2781                	sext.w	a5,a5
    80000400:	faf747e3          	blt	a4,a5,800003ae <consolewrite+0x30>
    80000404:	a011                	j	80000408 <consolewrite+0x8a>
      break;
    80000406:	0001                	nop
  }
  release(&cons.lock);
    80000408:	00014517          	auipc	a0,0x14
    8000040c:	d6850513          	addi	a0,a0,-664 # 80014170 <cons>
    80000410:	00001097          	auipc	ra,0x1
    80000414:	ed2080e7          	jalr	-302(ra) # 800012e2 <release>

  return i;
    80000418:	fec42783          	lw	a5,-20(s0)
}
    8000041c:	853e                	mv	a0,a5
    8000041e:	70a2                	ld	ra,40(sp)
    80000420:	7402                	ld	s0,32(sp)
    80000422:	6145                	addi	sp,sp,48
    80000424:	8082                	ret

0000000080000426 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000426:	7179                	addi	sp,sp,-48
    80000428:	f406                	sd	ra,40(sp)
    8000042a:	f022                	sd	s0,32(sp)
    8000042c:	1800                	addi	s0,sp,48
    8000042e:	87aa                	mv	a5,a0
    80000430:	fcb43823          	sd	a1,-48(s0)
    80000434:	8732                	mv	a4,a2
    80000436:	fcf42e23          	sw	a5,-36(s0)
    8000043a:	87ba                	mv	a5,a4
    8000043c:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    80000440:	fd842783          	lw	a5,-40(s0)
    80000444:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000448:	00014517          	auipc	a0,0x14
    8000044c:	d2850513          	addi	a0,a0,-728 # 80014170 <cons>
    80000450:	00001097          	auipc	ra,0x1
    80000454:	e2e080e7          	jalr	-466(ra) # 8000127e <acquire>
  while(n > 0){
    80000458:	a215                	j	8000057c <consoleread+0x156>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(myproc()->killed){
    8000045a:	00002097          	auipc	ra,0x2
    8000045e:	39c080e7          	jalr	924(ra) # 800027f6 <myproc>
    80000462:	87aa                	mv	a5,a0
    80000464:	5b9c                	lw	a5,48(a5)
    80000466:	cb99                	beqz	a5,8000047c <consoleread+0x56>
        release(&cons.lock);
    80000468:	00014517          	auipc	a0,0x14
    8000046c:	d0850513          	addi	a0,a0,-760 # 80014170 <cons>
    80000470:	00001097          	auipc	ra,0x1
    80000474:	e72080e7          	jalr	-398(ra) # 800012e2 <release>
        return -1;
    80000478:	57fd                	li	a5,-1
    8000047a:	aa25                	j	800005b2 <consoleread+0x18c>
      }
      sleep(&cons.r, &cons.lock);
    8000047c:	00014597          	auipc	a1,0x14
    80000480:	cf458593          	addi	a1,a1,-780 # 80014170 <cons>
    80000484:	00014517          	auipc	a0,0x14
    80000488:	d8450513          	addi	a0,a0,-636 # 80014208 <cons+0x98>
    8000048c:	00003097          	auipc	ra,0x3
    80000490:	0b6080e7          	jalr	182(ra) # 80003542 <sleep>
    while(cons.r == cons.w){
    80000494:	00014797          	auipc	a5,0x14
    80000498:	cdc78793          	addi	a5,a5,-804 # 80014170 <cons>
    8000049c:	0987a703          	lw	a4,152(a5)
    800004a0:	00014797          	auipc	a5,0x14
    800004a4:	cd078793          	addi	a5,a5,-816 # 80014170 <cons>
    800004a8:	09c7a783          	lw	a5,156(a5)
    800004ac:	faf707e3          	beq	a4,a5,8000045a <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];
    800004b0:	00014797          	auipc	a5,0x14
    800004b4:	cc078793          	addi	a5,a5,-832 # 80014170 <cons>
    800004b8:	0987a783          	lw	a5,152(a5)
    800004bc:	2781                	sext.w	a5,a5
    800004be:	0017871b          	addiw	a4,a5,1
    800004c2:	0007069b          	sext.w	a3,a4
    800004c6:	00014717          	auipc	a4,0x14
    800004ca:	caa70713          	addi	a4,a4,-854 # 80014170 <cons>
    800004ce:	08d72c23          	sw	a3,152(a4)
    800004d2:	07f7f793          	andi	a5,a5,127
    800004d6:	2781                	sext.w	a5,a5
    800004d8:	00014717          	auipc	a4,0x14
    800004dc:	c9870713          	addi	a4,a4,-872 # 80014170 <cons>
    800004e0:	1782                	slli	a5,a5,0x20
    800004e2:	9381                	srli	a5,a5,0x20
    800004e4:	97ba                	add	a5,a5,a4
    800004e6:	0187c783          	lbu	a5,24(a5)
    800004ea:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    800004ee:	fe842783          	lw	a5,-24(s0)
    800004f2:	0007871b          	sext.w	a4,a5
    800004f6:	4791                	li	a5,4
    800004f8:	02f71963          	bne	a4,a5,8000052a <consoleread+0x104>
      if(n < target){
    800004fc:	fd842703          	lw	a4,-40(s0)
    80000500:	fec42783          	lw	a5,-20(s0)
    80000504:	2781                	sext.w	a5,a5
    80000506:	08f77163          	bgeu	a4,a5,80000588 <consoleread+0x162>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    8000050a:	00014797          	auipc	a5,0x14
    8000050e:	c6678793          	addi	a5,a5,-922 # 80014170 <cons>
    80000512:	0987a783          	lw	a5,152(a5)
    80000516:	37fd                	addiw	a5,a5,-1
    80000518:	0007871b          	sext.w	a4,a5
    8000051c:	00014797          	auipc	a5,0x14
    80000520:	c5478793          	addi	a5,a5,-940 # 80014170 <cons>
    80000524:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    80000528:	a085                	j	80000588 <consoleread+0x162>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    8000052a:	fe842783          	lw	a5,-24(s0)
    8000052e:	0ff7f793          	andi	a5,a5,255
    80000532:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80000536:	fe740713          	addi	a4,s0,-25
    8000053a:	fdc42783          	lw	a5,-36(s0)
    8000053e:	4685                	li	a3,1
    80000540:	863a                	mv	a2,a4
    80000542:	fd043583          	ld	a1,-48(s0)
    80000546:	853e                	mv	a0,a5
    80000548:	00003097          	auipc	ra,0x3
    8000054c:	214080e7          	jalr	532(ra) # 8000375c <either_copyout>
    80000550:	87aa                	mv	a5,a0
    80000552:	873e                	mv	a4,a5
    80000554:	57fd                	li	a5,-1
    80000556:	02f70b63          	beq	a4,a5,8000058c <consoleread+0x166>
      break;

    dst++;
    8000055a:	fd043783          	ld	a5,-48(s0)
    8000055e:	0785                	addi	a5,a5,1
    80000560:	fcf43823          	sd	a5,-48(s0)
    --n;
    80000564:	fd842783          	lw	a5,-40(s0)
    80000568:	37fd                	addiw	a5,a5,-1
    8000056a:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    8000056e:	fe842783          	lw	a5,-24(s0)
    80000572:	0007871b          	sext.w	a4,a5
    80000576:	47a9                	li	a5,10
    80000578:	00f70c63          	beq	a4,a5,80000590 <consoleread+0x16a>
  while(n > 0){
    8000057c:	fd842783          	lw	a5,-40(s0)
    80000580:	2781                	sext.w	a5,a5
    80000582:	f0f049e3          	bgtz	a5,80000494 <consoleread+0x6e>
    80000586:	a031                	j	80000592 <consoleread+0x16c>
      break;
    80000588:	0001                	nop
    8000058a:	a021                	j	80000592 <consoleread+0x16c>
      break;
    8000058c:	0001                	nop
    8000058e:	a011                	j	80000592 <consoleread+0x16c>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    80000590:	0001                	nop
    }
  }
  release(&cons.lock);
    80000592:	00014517          	auipc	a0,0x14
    80000596:	bde50513          	addi	a0,a0,-1058 # 80014170 <cons>
    8000059a:	00001097          	auipc	ra,0x1
    8000059e:	d48080e7          	jalr	-696(ra) # 800012e2 <release>

  return target - n;
    800005a2:	fd842783          	lw	a5,-40(s0)
    800005a6:	fec42703          	lw	a4,-20(s0)
    800005aa:	40f707bb          	subw	a5,a4,a5
    800005ae:	2781                	sext.w	a5,a5
    800005b0:	2781                	sext.w	a5,a5
}
    800005b2:	853e                	mv	a0,a5
    800005b4:	70a2                	ld	ra,40(sp)
    800005b6:	7402                	ld	s0,32(sp)
    800005b8:	6145                	addi	sp,sp,48
    800005ba:	8082                	ret

00000000800005bc <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005bc:	1101                	addi	sp,sp,-32
    800005be:	ec06                	sd	ra,24(sp)
    800005c0:	e822                	sd	s0,16(sp)
    800005c2:	1000                	addi	s0,sp,32
    800005c4:	87aa                	mv	a5,a0
    800005c6:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    800005ca:	00014517          	auipc	a0,0x14
    800005ce:	ba650513          	addi	a0,a0,-1114 # 80014170 <cons>
    800005d2:	00001097          	auipc	ra,0x1
    800005d6:	cac080e7          	jalr	-852(ra) # 8000127e <acquire>

  switch(c){
    800005da:	fec42783          	lw	a5,-20(s0)
    800005de:	0007871b          	sext.w	a4,a5
    800005e2:	07f00793          	li	a5,127
    800005e6:	0cf70763          	beq	a4,a5,800006b4 <consoleintr+0xf8>
    800005ea:	fec42783          	lw	a5,-20(s0)
    800005ee:	0007871b          	sext.w	a4,a5
    800005f2:	07f00793          	li	a5,127
    800005f6:	10e7c363          	blt	a5,a4,800006fc <consoleintr+0x140>
    800005fa:	fec42783          	lw	a5,-20(s0)
    800005fe:	0007871b          	sext.w	a4,a5
    80000602:	47d5                	li	a5,21
    80000604:	06f70163          	beq	a4,a5,80000666 <consoleintr+0xaa>
    80000608:	fec42783          	lw	a5,-20(s0)
    8000060c:	0007871b          	sext.w	a4,a5
    80000610:	47d5                	li	a5,21
    80000612:	0ee7c563          	blt	a5,a4,800006fc <consoleintr+0x140>
    80000616:	fec42783          	lw	a5,-20(s0)
    8000061a:	0007871b          	sext.w	a4,a5
    8000061e:	47a1                	li	a5,8
    80000620:	08f70a63          	beq	a4,a5,800006b4 <consoleintr+0xf8>
    80000624:	fec42783          	lw	a5,-20(s0)
    80000628:	0007871b          	sext.w	a4,a5
    8000062c:	47c1                	li	a5,16
    8000062e:	0cf71763          	bne	a4,a5,800006fc <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    80000632:	00003097          	auipc	ra,0x3
    80000636:	21e080e7          	jalr	542(ra) # 80003850 <procdump>
    break;
    8000063a:	aac1                	j	8000080a <consoleintr+0x24e>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
      cons.e--;
    8000063c:	00014797          	auipc	a5,0x14
    80000640:	b3478793          	addi	a5,a5,-1228 # 80014170 <cons>
    80000644:	0a07a783          	lw	a5,160(a5)
    80000648:	37fd                	addiw	a5,a5,-1
    8000064a:	0007871b          	sext.w	a4,a5
    8000064e:	00014797          	auipc	a5,0x14
    80000652:	b2278793          	addi	a5,a5,-1246 # 80014170 <cons>
    80000656:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    8000065a:	10000513          	li	a0,256
    8000065e:	00000097          	auipc	ra,0x0
    80000662:	cc8080e7          	jalr	-824(ra) # 80000326 <consputc>
    while(cons.e != cons.w &&
    80000666:	00014797          	auipc	a5,0x14
    8000066a:	b0a78793          	addi	a5,a5,-1270 # 80014170 <cons>
    8000066e:	0a07a703          	lw	a4,160(a5)
    80000672:	00014797          	auipc	a5,0x14
    80000676:	afe78793          	addi	a5,a5,-1282 # 80014170 <cons>
    8000067a:	09c7a783          	lw	a5,156(a5)
    8000067e:	18f70163          	beq	a4,a5,80000800 <consoleintr+0x244>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80000682:	00014797          	auipc	a5,0x14
    80000686:	aee78793          	addi	a5,a5,-1298 # 80014170 <cons>
    8000068a:	0a07a783          	lw	a5,160(a5)
    8000068e:	37fd                	addiw	a5,a5,-1
    80000690:	2781                	sext.w	a5,a5
    80000692:	07f7f793          	andi	a5,a5,127
    80000696:	2781                	sext.w	a5,a5
    80000698:	00014717          	auipc	a4,0x14
    8000069c:	ad870713          	addi	a4,a4,-1320 # 80014170 <cons>
    800006a0:	1782                	slli	a5,a5,0x20
    800006a2:	9381                	srli	a5,a5,0x20
    800006a4:	97ba                	add	a5,a5,a4
    800006a6:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006aa:	873e                	mv	a4,a5
    800006ac:	47a9                	li	a5,10
    800006ae:	f8f717e3          	bne	a4,a5,8000063c <consoleintr+0x80>
    }
    break;
    800006b2:	a2b9                	j	80000800 <consoleintr+0x244>
  case C('H'): // Backspace
  case '\x7f':
    if(cons.e != cons.w){
    800006b4:	00014797          	auipc	a5,0x14
    800006b8:	abc78793          	addi	a5,a5,-1348 # 80014170 <cons>
    800006bc:	0a07a703          	lw	a4,160(a5)
    800006c0:	00014797          	auipc	a5,0x14
    800006c4:	ab078793          	addi	a5,a5,-1360 # 80014170 <cons>
    800006c8:	09c7a783          	lw	a5,156(a5)
    800006cc:	12f70c63          	beq	a4,a5,80000804 <consoleintr+0x248>
      cons.e--;
    800006d0:	00014797          	auipc	a5,0x14
    800006d4:	aa078793          	addi	a5,a5,-1376 # 80014170 <cons>
    800006d8:	0a07a783          	lw	a5,160(a5)
    800006dc:	37fd                	addiw	a5,a5,-1
    800006de:	0007871b          	sext.w	a4,a5
    800006e2:	00014797          	auipc	a5,0x14
    800006e6:	a8e78793          	addi	a5,a5,-1394 # 80014170 <cons>
    800006ea:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    800006ee:	10000513          	li	a0,256
    800006f2:	00000097          	auipc	ra,0x0
    800006f6:	c34080e7          	jalr	-972(ra) # 80000326 <consputc>
    }
    break;
    800006fa:	a229                	j	80000804 <consoleintr+0x248>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    800006fc:	fec42783          	lw	a5,-20(s0)
    80000700:	2781                	sext.w	a5,a5
    80000702:	10078363          	beqz	a5,80000808 <consoleintr+0x24c>
    80000706:	00014797          	auipc	a5,0x14
    8000070a:	a6a78793          	addi	a5,a5,-1430 # 80014170 <cons>
    8000070e:	0a07a703          	lw	a4,160(a5)
    80000712:	00014797          	auipc	a5,0x14
    80000716:	a5e78793          	addi	a5,a5,-1442 # 80014170 <cons>
    8000071a:	0987a783          	lw	a5,152(a5)
    8000071e:	40f707bb          	subw	a5,a4,a5
    80000722:	2781                	sext.w	a5,a5
    80000724:	873e                	mv	a4,a5
    80000726:	07f00793          	li	a5,127
    8000072a:	0ce7ef63          	bltu	a5,a4,80000808 <consoleintr+0x24c>
      c = (c == '\r') ? '\n' : c;
    8000072e:	fec42783          	lw	a5,-20(s0)
    80000732:	0007871b          	sext.w	a4,a5
    80000736:	47b5                	li	a5,13
    80000738:	00f70563          	beq	a4,a5,80000742 <consoleintr+0x186>
    8000073c:	fec42783          	lw	a5,-20(s0)
    80000740:	a011                	j	80000744 <consoleintr+0x188>
    80000742:	47a9                	li	a5,10
    80000744:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    80000748:	fec42783          	lw	a5,-20(s0)
    8000074c:	853e                	mv	a0,a5
    8000074e:	00000097          	auipc	ra,0x0
    80000752:	bd8080e7          	jalr	-1064(ra) # 80000326 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80000756:	00014797          	auipc	a5,0x14
    8000075a:	a1a78793          	addi	a5,a5,-1510 # 80014170 <cons>
    8000075e:	0a07a783          	lw	a5,160(a5)
    80000762:	2781                	sext.w	a5,a5
    80000764:	0017871b          	addiw	a4,a5,1
    80000768:	0007069b          	sext.w	a3,a4
    8000076c:	00014717          	auipc	a4,0x14
    80000770:	a0470713          	addi	a4,a4,-1532 # 80014170 <cons>
    80000774:	0ad72023          	sw	a3,160(a4)
    80000778:	07f7f793          	andi	a5,a5,127
    8000077c:	2781                	sext.w	a5,a5
    8000077e:	fec42703          	lw	a4,-20(s0)
    80000782:	0ff77713          	andi	a4,a4,255
    80000786:	00014697          	auipc	a3,0x14
    8000078a:	9ea68693          	addi	a3,a3,-1558 # 80014170 <cons>
    8000078e:	1782                	slli	a5,a5,0x20
    80000790:	9381                	srli	a5,a5,0x20
    80000792:	97b6                	add	a5,a5,a3
    80000794:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80000798:	fec42783          	lw	a5,-20(s0)
    8000079c:	0007871b          	sext.w	a4,a5
    800007a0:	47a9                	li	a5,10
    800007a2:	02f70a63          	beq	a4,a5,800007d6 <consoleintr+0x21a>
    800007a6:	fec42783          	lw	a5,-20(s0)
    800007aa:	0007871b          	sext.w	a4,a5
    800007ae:	4791                	li	a5,4
    800007b0:	02f70363          	beq	a4,a5,800007d6 <consoleintr+0x21a>
    800007b4:	00014797          	auipc	a5,0x14
    800007b8:	9bc78793          	addi	a5,a5,-1604 # 80014170 <cons>
    800007bc:	0a07a703          	lw	a4,160(a5)
    800007c0:	00014797          	auipc	a5,0x14
    800007c4:	9b078793          	addi	a5,a5,-1616 # 80014170 <cons>
    800007c8:	0987a783          	lw	a5,152(a5)
    800007cc:	0807879b          	addiw	a5,a5,128
    800007d0:	2781                	sext.w	a5,a5
    800007d2:	02f71b63          	bne	a4,a5,80000808 <consoleintr+0x24c>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    800007d6:	00014797          	auipc	a5,0x14
    800007da:	99a78793          	addi	a5,a5,-1638 # 80014170 <cons>
    800007de:	0a07a703          	lw	a4,160(a5)
    800007e2:	00014797          	auipc	a5,0x14
    800007e6:	98e78793          	addi	a5,a5,-1650 # 80014170 <cons>
    800007ea:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    800007ee:	00014517          	auipc	a0,0x14
    800007f2:	a1a50513          	addi	a0,a0,-1510 # 80014208 <cons+0x98>
    800007f6:	00003097          	auipc	ra,0x3
    800007fa:	de0080e7          	jalr	-544(ra) # 800035d6 <wakeup>
      }
    }
    break;
    800007fe:	a029                	j	80000808 <consoleintr+0x24c>
    break;
    80000800:	0001                	nop
    80000802:	a021                	j	8000080a <consoleintr+0x24e>
    break;
    80000804:	0001                	nop
    80000806:	a011                	j	8000080a <consoleintr+0x24e>
    break;
    80000808:	0001                	nop
  }
  
  release(&cons.lock);
    8000080a:	00014517          	auipc	a0,0x14
    8000080e:	96650513          	addi	a0,a0,-1690 # 80014170 <cons>
    80000812:	00001097          	auipc	ra,0x1
    80000816:	ad0080e7          	jalr	-1328(ra) # 800012e2 <release>
}
    8000081a:	0001                	nop
    8000081c:	60e2                	ld	ra,24(sp)
    8000081e:	6442                	ld	s0,16(sp)
    80000820:	6105                	addi	sp,sp,32
    80000822:	8082                	ret

0000000080000824 <consoleinit>:

void
consoleinit(void)
{
    80000824:	1141                	addi	sp,sp,-16
    80000826:	e406                	sd	ra,8(sp)
    80000828:	e022                	sd	s0,0(sp)
    8000082a:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    8000082c:	0000a597          	auipc	a1,0xa
    80000830:	7d458593          	addi	a1,a1,2004 # 8000b000 <etext>
    80000834:	00014517          	auipc	a0,0x14
    80000838:	93c50513          	addi	a0,a0,-1732 # 80014170 <cons>
    8000083c:	00001097          	auipc	ra,0x1
    80000840:	a12080e7          	jalr	-1518(ra) # 8000124e <initlock>

  uartinit();
    80000844:	00000097          	auipc	ra,0x0
    80000848:	494080e7          	jalr	1172(ra) # 80000cd8 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000084c:	0006d797          	auipc	a5,0x6d
    80000850:	4ac78793          	addi	a5,a5,1196 # 8006dcf8 <devsw>
    80000854:	00000717          	auipc	a4,0x0
    80000858:	bd270713          	addi	a4,a4,-1070 # 80000426 <consoleread>
    8000085c:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000085e:	0006d797          	auipc	a5,0x6d
    80000862:	49a78793          	addi	a5,a5,1178 # 8006dcf8 <devsw>
    80000866:	00000717          	auipc	a4,0x0
    8000086a:	b1870713          	addi	a4,a4,-1256 # 8000037e <consolewrite>
    8000086e:	ef98                	sd	a4,24(a5)
}
    80000870:	0001                	nop
    80000872:	60a2                	ld	ra,8(sp)
    80000874:	6402                	ld	s0,0(sp)
    80000876:	0141                	addi	sp,sp,16
    80000878:	8082                	ret

000000008000087a <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    8000087a:	7139                	addi	sp,sp,-64
    8000087c:	fc06                	sd	ra,56(sp)
    8000087e:	f822                	sd	s0,48(sp)
    80000880:	0080                	addi	s0,sp,64
    80000882:	87aa                	mv	a5,a0
    80000884:	86ae                	mv	a3,a1
    80000886:	8732                	mv	a4,a2
    80000888:	fcf42623          	sw	a5,-52(s0)
    8000088c:	87b6                	mv	a5,a3
    8000088e:	fcf42423          	sw	a5,-56(s0)
    80000892:	87ba                	mv	a5,a4
    80000894:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    80000898:	fc442783          	lw	a5,-60(s0)
    8000089c:	2781                	sext.w	a5,a5
    8000089e:	c78d                	beqz	a5,800008c8 <printint+0x4e>
    800008a0:	fcc42783          	lw	a5,-52(s0)
    800008a4:	01f7d79b          	srliw	a5,a5,0x1f
    800008a8:	0ff7f793          	andi	a5,a5,255
    800008ac:	fcf42223          	sw	a5,-60(s0)
    800008b0:	fc442783          	lw	a5,-60(s0)
    800008b4:	2781                	sext.w	a5,a5
    800008b6:	cb89                	beqz	a5,800008c8 <printint+0x4e>
    x = -xx;
    800008b8:	fcc42783          	lw	a5,-52(s0)
    800008bc:	40f007bb          	negw	a5,a5
    800008c0:	2781                	sext.w	a5,a5
    800008c2:	fef42423          	sw	a5,-24(s0)
    800008c6:	a029                	j	800008d0 <printint+0x56>
  else
    x = xx;
    800008c8:	fcc42783          	lw	a5,-52(s0)
    800008cc:	fef42423          	sw	a5,-24(s0)

  i = 0;
    800008d0:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    800008d4:	fc842783          	lw	a5,-56(s0)
    800008d8:	fe842703          	lw	a4,-24(s0)
    800008dc:	02f777bb          	remuw	a5,a4,a5
    800008e0:	0007861b          	sext.w	a2,a5
    800008e4:	fec42783          	lw	a5,-20(s0)
    800008e8:	0017871b          	addiw	a4,a5,1
    800008ec:	fee42623          	sw	a4,-20(s0)
    800008f0:	0000b697          	auipc	a3,0xb
    800008f4:	e7068693          	addi	a3,a3,-400 # 8000b760 <digits>
    800008f8:	02061713          	slli	a4,a2,0x20
    800008fc:	9301                	srli	a4,a4,0x20
    800008fe:	9736                	add	a4,a4,a3
    80000900:	00074703          	lbu	a4,0(a4)
    80000904:	ff040693          	addi	a3,s0,-16
    80000908:	97b6                	add	a5,a5,a3
    8000090a:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    8000090e:	fc842783          	lw	a5,-56(s0)
    80000912:	fe842703          	lw	a4,-24(s0)
    80000916:	02f757bb          	divuw	a5,a4,a5
    8000091a:	fef42423          	sw	a5,-24(s0)
    8000091e:	fe842783          	lw	a5,-24(s0)
    80000922:	2781                	sext.w	a5,a5
    80000924:	fbc5                	bnez	a5,800008d4 <printint+0x5a>

  if(sign)
    80000926:	fc442783          	lw	a5,-60(s0)
    8000092a:	2781                	sext.w	a5,a5
    8000092c:	cf85                	beqz	a5,80000964 <printint+0xea>
    buf[i++] = '-';
    8000092e:	fec42783          	lw	a5,-20(s0)
    80000932:	0017871b          	addiw	a4,a5,1
    80000936:	fee42623          	sw	a4,-20(s0)
    8000093a:	ff040713          	addi	a4,s0,-16
    8000093e:	97ba                	add	a5,a5,a4
    80000940:	02d00713          	li	a4,45
    80000944:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    80000948:	a831                	j	80000964 <printint+0xea>
    consputc(buf[i]);
    8000094a:	fec42783          	lw	a5,-20(s0)
    8000094e:	ff040713          	addi	a4,s0,-16
    80000952:	97ba                	add	a5,a5,a4
    80000954:	fe87c783          	lbu	a5,-24(a5)
    80000958:	2781                	sext.w	a5,a5
    8000095a:	853e                	mv	a0,a5
    8000095c:	00000097          	auipc	ra,0x0
    80000960:	9ca080e7          	jalr	-1590(ra) # 80000326 <consputc>
  while(--i >= 0)
    80000964:	fec42783          	lw	a5,-20(s0)
    80000968:	37fd                	addiw	a5,a5,-1
    8000096a:	fef42623          	sw	a5,-20(s0)
    8000096e:	fec42783          	lw	a5,-20(s0)
    80000972:	2781                	sext.w	a5,a5
    80000974:	fc07dbe3          	bgez	a5,8000094a <printint+0xd0>
}
    80000978:	0001                	nop
    8000097a:	0001                	nop
    8000097c:	70e2                	ld	ra,56(sp)
    8000097e:	7442                	ld	s0,48(sp)
    80000980:	6121                	addi	sp,sp,64
    80000982:	8082                	ret

0000000080000984 <printptr>:

static void
printptr(uint64 x)
{
    80000984:	7179                	addi	sp,sp,-48
    80000986:	f406                	sd	ra,40(sp)
    80000988:	f022                	sd	s0,32(sp)
    8000098a:	1800                	addi	s0,sp,48
    8000098c:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    80000990:	03000513          	li	a0,48
    80000994:	00000097          	auipc	ra,0x0
    80000998:	992080e7          	jalr	-1646(ra) # 80000326 <consputc>
  consputc('x');
    8000099c:	07800513          	li	a0,120
    800009a0:	00000097          	auipc	ra,0x0
    800009a4:	986080e7          	jalr	-1658(ra) # 80000326 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009a8:	fe042623          	sw	zero,-20(s0)
    800009ac:	a81d                	j	800009e2 <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009ae:	fd843783          	ld	a5,-40(s0)
    800009b2:	93f1                	srli	a5,a5,0x3c
    800009b4:	0000b717          	auipc	a4,0xb
    800009b8:	dac70713          	addi	a4,a4,-596 # 8000b760 <digits>
    800009bc:	97ba                	add	a5,a5,a4
    800009be:	0007c783          	lbu	a5,0(a5)
    800009c2:	2781                	sext.w	a5,a5
    800009c4:	853e                	mv	a0,a5
    800009c6:	00000097          	auipc	ra,0x0
    800009ca:	960080e7          	jalr	-1696(ra) # 80000326 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009ce:	fec42783          	lw	a5,-20(s0)
    800009d2:	2785                	addiw	a5,a5,1
    800009d4:	fef42623          	sw	a5,-20(s0)
    800009d8:	fd843783          	ld	a5,-40(s0)
    800009dc:	0792                	slli	a5,a5,0x4
    800009de:	fcf43c23          	sd	a5,-40(s0)
    800009e2:	fec42783          	lw	a5,-20(s0)
    800009e6:	873e                	mv	a4,a5
    800009e8:	47bd                	li	a5,15
    800009ea:	fce7f2e3          	bgeu	a5,a4,800009ae <printptr+0x2a>
}
    800009ee:	0001                	nop
    800009f0:	0001                	nop
    800009f2:	70a2                	ld	ra,40(sp)
    800009f4:	7402                	ld	s0,32(sp)
    800009f6:	6145                	addi	sp,sp,48
    800009f8:	8082                	ret

00000000800009fa <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    800009fa:	7119                	addi	sp,sp,-128
    800009fc:	fc06                	sd	ra,56(sp)
    800009fe:	f822                	sd	s0,48(sp)
    80000a00:	0080                	addi	s0,sp,64
    80000a02:	fca43423          	sd	a0,-56(s0)
    80000a06:	e40c                	sd	a1,8(s0)
    80000a08:	e810                	sd	a2,16(s0)
    80000a0a:	ec14                	sd	a3,24(s0)
    80000a0c:	f018                	sd	a4,32(s0)
    80000a0e:	f41c                	sd	a5,40(s0)
    80000a10:	03043823          	sd	a6,48(s0)
    80000a14:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a18:	00014797          	auipc	a5,0x14
    80000a1c:	80078793          	addi	a5,a5,-2048 # 80014218 <pr>
    80000a20:	4f9c                	lw	a5,24(a5)
    80000a22:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a26:	fdc42783          	lw	a5,-36(s0)
    80000a2a:	2781                	sext.w	a5,a5
    80000a2c:	cb89                	beqz	a5,80000a3e <printf+0x44>
    acquire(&pr.lock);
    80000a2e:	00013517          	auipc	a0,0x13
    80000a32:	7ea50513          	addi	a0,a0,2026 # 80014218 <pr>
    80000a36:	00001097          	auipc	ra,0x1
    80000a3a:	848080e7          	jalr	-1976(ra) # 8000127e <acquire>

  if (fmt == 0)
    80000a3e:	fc843783          	ld	a5,-56(s0)
    80000a42:	eb89                	bnez	a5,80000a54 <printf+0x5a>
    panic("null fmt");
    80000a44:	0000a517          	auipc	a0,0xa
    80000a48:	5c450513          	addi	a0,a0,1476 # 8000b008 <etext+0x8>
    80000a4c:	00000097          	auipc	ra,0x0
    80000a50:	204080e7          	jalr	516(ra) # 80000c50 <panic>

  va_start(ap, fmt);
    80000a54:	04040793          	addi	a5,s0,64
    80000a58:	fcf43023          	sd	a5,-64(s0)
    80000a5c:	fc043783          	ld	a5,-64(s0)
    80000a60:	fc878793          	addi	a5,a5,-56
    80000a64:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000a68:	fe042623          	sw	zero,-20(s0)
    80000a6c:	a24d                	j	80000c0e <printf+0x214>
    if(c != '%'){
    80000a6e:	fd842783          	lw	a5,-40(s0)
    80000a72:	0007871b          	sext.w	a4,a5
    80000a76:	02500793          	li	a5,37
    80000a7a:	00f70a63          	beq	a4,a5,80000a8e <printf+0x94>
      consputc(c);
    80000a7e:	fd842783          	lw	a5,-40(s0)
    80000a82:	853e                	mv	a0,a5
    80000a84:	00000097          	auipc	ra,0x0
    80000a88:	8a2080e7          	jalr	-1886(ra) # 80000326 <consputc>
      continue;
    80000a8c:	aaa5                	j	80000c04 <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000a8e:	fec42783          	lw	a5,-20(s0)
    80000a92:	2785                	addiw	a5,a5,1
    80000a94:	fef42623          	sw	a5,-20(s0)
    80000a98:	fec42783          	lw	a5,-20(s0)
    80000a9c:	fc843703          	ld	a4,-56(s0)
    80000aa0:	97ba                	add	a5,a5,a4
    80000aa2:	0007c783          	lbu	a5,0(a5)
    80000aa6:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000aaa:	fd842783          	lw	a5,-40(s0)
    80000aae:	2781                	sext.w	a5,a5
    80000ab0:	16078e63          	beqz	a5,80000c2c <printf+0x232>
      break;
    switch(c){
    80000ab4:	fd842783          	lw	a5,-40(s0)
    80000ab8:	0007871b          	sext.w	a4,a5
    80000abc:	07800793          	li	a5,120
    80000ac0:	08f70963          	beq	a4,a5,80000b52 <printf+0x158>
    80000ac4:	fd842783          	lw	a5,-40(s0)
    80000ac8:	0007871b          	sext.w	a4,a5
    80000acc:	07800793          	li	a5,120
    80000ad0:	10e7cc63          	blt	a5,a4,80000be8 <printf+0x1ee>
    80000ad4:	fd842783          	lw	a5,-40(s0)
    80000ad8:	0007871b          	sext.w	a4,a5
    80000adc:	07300793          	li	a5,115
    80000ae0:	0af70563          	beq	a4,a5,80000b8a <printf+0x190>
    80000ae4:	fd842783          	lw	a5,-40(s0)
    80000ae8:	0007871b          	sext.w	a4,a5
    80000aec:	07300793          	li	a5,115
    80000af0:	0ee7cc63          	blt	a5,a4,80000be8 <printf+0x1ee>
    80000af4:	fd842783          	lw	a5,-40(s0)
    80000af8:	0007871b          	sext.w	a4,a5
    80000afc:	07000793          	li	a5,112
    80000b00:	06f70863          	beq	a4,a5,80000b70 <printf+0x176>
    80000b04:	fd842783          	lw	a5,-40(s0)
    80000b08:	0007871b          	sext.w	a4,a5
    80000b0c:	07000793          	li	a5,112
    80000b10:	0ce7cc63          	blt	a5,a4,80000be8 <printf+0x1ee>
    80000b14:	fd842783          	lw	a5,-40(s0)
    80000b18:	0007871b          	sext.w	a4,a5
    80000b1c:	02500793          	li	a5,37
    80000b20:	0af70d63          	beq	a4,a5,80000bda <printf+0x1e0>
    80000b24:	fd842783          	lw	a5,-40(s0)
    80000b28:	0007871b          	sext.w	a4,a5
    80000b2c:	06400793          	li	a5,100
    80000b30:	0af71c63          	bne	a4,a5,80000be8 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b34:	fd043783          	ld	a5,-48(s0)
    80000b38:	00878713          	addi	a4,a5,8
    80000b3c:	fce43823          	sd	a4,-48(s0)
    80000b40:	439c                	lw	a5,0(a5)
    80000b42:	4605                	li	a2,1
    80000b44:	45a9                	li	a1,10
    80000b46:	853e                	mv	a0,a5
    80000b48:	00000097          	auipc	ra,0x0
    80000b4c:	d32080e7          	jalr	-718(ra) # 8000087a <printint>
      break;
    80000b50:	a855                	j	80000c04 <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b52:	fd043783          	ld	a5,-48(s0)
    80000b56:	00878713          	addi	a4,a5,8
    80000b5a:	fce43823          	sd	a4,-48(s0)
    80000b5e:	439c                	lw	a5,0(a5)
    80000b60:	4605                	li	a2,1
    80000b62:	45c1                	li	a1,16
    80000b64:	853e                	mv	a0,a5
    80000b66:	00000097          	auipc	ra,0x0
    80000b6a:	d14080e7          	jalr	-748(ra) # 8000087a <printint>
      break;
    80000b6e:	a859                	j	80000c04 <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000b70:	fd043783          	ld	a5,-48(s0)
    80000b74:	00878713          	addi	a4,a5,8
    80000b78:	fce43823          	sd	a4,-48(s0)
    80000b7c:	639c                	ld	a5,0(a5)
    80000b7e:	853e                	mv	a0,a5
    80000b80:	00000097          	auipc	ra,0x0
    80000b84:	e04080e7          	jalr	-508(ra) # 80000984 <printptr>
      break;
    80000b88:	a8b5                	j	80000c04 <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000b8a:	fd043783          	ld	a5,-48(s0)
    80000b8e:	00878713          	addi	a4,a5,8
    80000b92:	fce43823          	sd	a4,-48(s0)
    80000b96:	639c                	ld	a5,0(a5)
    80000b98:	fef43023          	sd	a5,-32(s0)
    80000b9c:	fe043783          	ld	a5,-32(s0)
    80000ba0:	e79d                	bnez	a5,80000bce <printf+0x1d4>
        s = "(null)";
    80000ba2:	0000a797          	auipc	a5,0xa
    80000ba6:	47678793          	addi	a5,a5,1142 # 8000b018 <etext+0x18>
    80000baa:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000bae:	a005                	j	80000bce <printf+0x1d4>
        consputc(*s);
    80000bb0:	fe043783          	ld	a5,-32(s0)
    80000bb4:	0007c783          	lbu	a5,0(a5)
    80000bb8:	2781                	sext.w	a5,a5
    80000bba:	853e                	mv	a0,a5
    80000bbc:	fffff097          	auipc	ra,0xfffff
    80000bc0:	76a080e7          	jalr	1898(ra) # 80000326 <consputc>
      for(; *s; s++)
    80000bc4:	fe043783          	ld	a5,-32(s0)
    80000bc8:	0785                	addi	a5,a5,1
    80000bca:	fef43023          	sd	a5,-32(s0)
    80000bce:	fe043783          	ld	a5,-32(s0)
    80000bd2:	0007c783          	lbu	a5,0(a5)
    80000bd6:	ffe9                	bnez	a5,80000bb0 <printf+0x1b6>
      break;
    80000bd8:	a035                	j	80000c04 <printf+0x20a>
    case '%':
      consputc('%');
    80000bda:	02500513          	li	a0,37
    80000bde:	fffff097          	auipc	ra,0xfffff
    80000be2:	748080e7          	jalr	1864(ra) # 80000326 <consputc>
      break;
    80000be6:	a839                	j	80000c04 <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000be8:	02500513          	li	a0,37
    80000bec:	fffff097          	auipc	ra,0xfffff
    80000bf0:	73a080e7          	jalr	1850(ra) # 80000326 <consputc>
      consputc(c);
    80000bf4:	fd842783          	lw	a5,-40(s0)
    80000bf8:	853e                	mv	a0,a5
    80000bfa:	fffff097          	auipc	ra,0xfffff
    80000bfe:	72c080e7          	jalr	1836(ra) # 80000326 <consputc>
      break;
    80000c02:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c04:	fec42783          	lw	a5,-20(s0)
    80000c08:	2785                	addiw	a5,a5,1
    80000c0a:	fef42623          	sw	a5,-20(s0)
    80000c0e:	fec42783          	lw	a5,-20(s0)
    80000c12:	fc843703          	ld	a4,-56(s0)
    80000c16:	97ba                	add	a5,a5,a4
    80000c18:	0007c783          	lbu	a5,0(a5)
    80000c1c:	fcf42c23          	sw	a5,-40(s0)
    80000c20:	fd842783          	lw	a5,-40(s0)
    80000c24:	2781                	sext.w	a5,a5
    80000c26:	e40794e3          	bnez	a5,80000a6e <printf+0x74>
    80000c2a:	a011                	j	80000c2e <printf+0x234>
      break;
    80000c2c:	0001                	nop
    }
  }

  if(locking)
    80000c2e:	fdc42783          	lw	a5,-36(s0)
    80000c32:	2781                	sext.w	a5,a5
    80000c34:	cb89                	beqz	a5,80000c46 <printf+0x24c>
    release(&pr.lock);
    80000c36:	00013517          	auipc	a0,0x13
    80000c3a:	5e250513          	addi	a0,a0,1506 # 80014218 <pr>
    80000c3e:	00000097          	auipc	ra,0x0
    80000c42:	6a4080e7          	jalr	1700(ra) # 800012e2 <release>
}
    80000c46:	0001                	nop
    80000c48:	70e2                	ld	ra,56(sp)
    80000c4a:	7442                	ld	s0,48(sp)
    80000c4c:	6109                	addi	sp,sp,128
    80000c4e:	8082                	ret

0000000080000c50 <panic>:

void
panic(char *s)
{
    80000c50:	1101                	addi	sp,sp,-32
    80000c52:	ec06                	sd	ra,24(sp)
    80000c54:	e822                	sd	s0,16(sp)
    80000c56:	1000                	addi	s0,sp,32
    80000c58:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c5c:	00013797          	auipc	a5,0x13
    80000c60:	5bc78793          	addi	a5,a5,1468 # 80014218 <pr>
    80000c64:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000c68:	0000a517          	auipc	a0,0xa
    80000c6c:	3b850513          	addi	a0,a0,952 # 8000b020 <etext+0x20>
    80000c70:	00000097          	auipc	ra,0x0
    80000c74:	d8a080e7          	jalr	-630(ra) # 800009fa <printf>
  printf(s);
    80000c78:	fe843503          	ld	a0,-24(s0)
    80000c7c:	00000097          	auipc	ra,0x0
    80000c80:	d7e080e7          	jalr	-642(ra) # 800009fa <printf>
  printf("\n");
    80000c84:	0000a517          	auipc	a0,0xa
    80000c88:	3a450513          	addi	a0,a0,932 # 8000b028 <etext+0x28>
    80000c8c:	00000097          	auipc	ra,0x0
    80000c90:	d6e080e7          	jalr	-658(ra) # 800009fa <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000c94:	0000b797          	auipc	a5,0xb
    80000c98:	36c78793          	addi	a5,a5,876 # 8000c000 <panicked>
    80000c9c:	4705                	li	a4,1
    80000c9e:	c398                	sw	a4,0(a5)
  for(;;)
    80000ca0:	a001                	j	80000ca0 <panic+0x50>

0000000080000ca2 <printfinit>:
    ;
}

void
printfinit(void)
{
    80000ca2:	1141                	addi	sp,sp,-16
    80000ca4:	e406                	sd	ra,8(sp)
    80000ca6:	e022                	sd	s0,0(sp)
    80000ca8:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000caa:	0000a597          	auipc	a1,0xa
    80000cae:	38658593          	addi	a1,a1,902 # 8000b030 <etext+0x30>
    80000cb2:	00013517          	auipc	a0,0x13
    80000cb6:	56650513          	addi	a0,a0,1382 # 80014218 <pr>
    80000cba:	00000097          	auipc	ra,0x0
    80000cbe:	594080e7          	jalr	1428(ra) # 8000124e <initlock>
  pr.locking = 1;
    80000cc2:	00013797          	auipc	a5,0x13
    80000cc6:	55678793          	addi	a5,a5,1366 # 80014218 <pr>
    80000cca:	4705                	li	a4,1
    80000ccc:	cf98                	sw	a4,24(a5)
}
    80000cce:	0001                	nop
    80000cd0:	60a2                	ld	ra,8(sp)
    80000cd2:	6402                	ld	s0,0(sp)
    80000cd4:	0141                	addi	sp,sp,16
    80000cd6:	8082                	ret

0000000080000cd8 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000cd8:	1141                	addi	sp,sp,-16
    80000cda:	e406                	sd	ra,8(sp)
    80000cdc:	e022                	sd	s0,0(sp)
    80000cde:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000ce0:	100007b7          	lui	a5,0x10000
    80000ce4:	0785                	addi	a5,a5,1
    80000ce6:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000cea:	100007b7          	lui	a5,0x10000
    80000cee:	078d                	addi	a5,a5,3
    80000cf0:	f8000713          	li	a4,-128
    80000cf4:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000cf8:	100007b7          	lui	a5,0x10000
    80000cfc:	470d                	li	a4,3
    80000cfe:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000d02:	100007b7          	lui	a5,0x10000
    80000d06:	0785                	addi	a5,a5,1
    80000d08:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000d0c:	100007b7          	lui	a5,0x10000
    80000d10:	078d                	addi	a5,a5,3
    80000d12:	470d                	li	a4,3
    80000d14:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000d18:	100007b7          	lui	a5,0x10000
    80000d1c:	0789                	addi	a5,a5,2
    80000d1e:	471d                	li	a4,7
    80000d20:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000d24:	100007b7          	lui	a5,0x10000
    80000d28:	0785                	addi	a5,a5,1
    80000d2a:	470d                	li	a4,3
    80000d2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  initlock(&uart_tx_lock, "uart");
    80000d30:	0000a597          	auipc	a1,0xa
    80000d34:	30858593          	addi	a1,a1,776 # 8000b038 <etext+0x38>
    80000d38:	00013517          	auipc	a0,0x13
    80000d3c:	50050513          	addi	a0,a0,1280 # 80014238 <uart_tx_lock>
    80000d40:	00000097          	auipc	ra,0x0
    80000d44:	50e080e7          	jalr	1294(ra) # 8000124e <initlock>
}
    80000d48:	0001                	nop
    80000d4a:	60a2                	ld	ra,8(sp)
    80000d4c:	6402                	ld	s0,0(sp)
    80000d4e:	0141                	addi	sp,sp,16
    80000d50:	8082                	ret

0000000080000d52 <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000d52:	1101                	addi	sp,sp,-32
    80000d54:	ec06                	sd	ra,24(sp)
    80000d56:	e822                	sd	s0,16(sp)
    80000d58:	1000                	addi	s0,sp,32
    80000d5a:	87aa                	mv	a5,a0
    80000d5c:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000d60:	00013517          	auipc	a0,0x13
    80000d64:	4d850513          	addi	a0,a0,1240 # 80014238 <uart_tx_lock>
    80000d68:	00000097          	auipc	ra,0x0
    80000d6c:	516080e7          	jalr	1302(ra) # 8000127e <acquire>

  if(panicked){
    80000d70:	0000b797          	auipc	a5,0xb
    80000d74:	29078793          	addi	a5,a5,656 # 8000c000 <panicked>
    80000d78:	439c                	lw	a5,0(a5)
    80000d7a:	2781                	sext.w	a5,a5
    80000d7c:	c391                	beqz	a5,80000d80 <uartputc+0x2e>
    for(;;)
    80000d7e:	a001                	j	80000d7e <uartputc+0x2c>
      ;
  }

  while(1){
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    80000d80:	0000b797          	auipc	a5,0xb
    80000d84:	28478793          	addi	a5,a5,644 # 8000c004 <uart_tx_w>
    80000d88:	439c                	lw	a5,0(a5)
    80000d8a:	2785                	addiw	a5,a5,1
    80000d8c:	2781                	sext.w	a5,a5
    80000d8e:	873e                	mv	a4,a5
    80000d90:	41f7579b          	sraiw	a5,a4,0x1f
    80000d94:	01b7d79b          	srliw	a5,a5,0x1b
    80000d98:	9f3d                	addw	a4,a4,a5
    80000d9a:	8b7d                	andi	a4,a4,31
    80000d9c:	40f707bb          	subw	a5,a4,a5
    80000da0:	0007871b          	sext.w	a4,a5
    80000da4:	0000b797          	auipc	a5,0xb
    80000da8:	26478793          	addi	a5,a5,612 # 8000c008 <uart_tx_r>
    80000dac:	439c                	lw	a5,0(a5)
    80000dae:	00f71f63          	bne	a4,a5,80000dcc <uartputc+0x7a>
      // buffer is full.
      // wait for uartstart() to open up space in the buffer.
      sleep(&uart_tx_r, &uart_tx_lock);
    80000db2:	00013597          	auipc	a1,0x13
    80000db6:	48658593          	addi	a1,a1,1158 # 80014238 <uart_tx_lock>
    80000dba:	0000b517          	auipc	a0,0xb
    80000dbe:	24e50513          	addi	a0,a0,590 # 8000c008 <uart_tx_r>
    80000dc2:	00002097          	auipc	ra,0x2
    80000dc6:	780080e7          	jalr	1920(ra) # 80003542 <sleep>
    80000dca:	bf5d                	j	80000d80 <uartputc+0x2e>
    } else {
      uart_tx_buf[uart_tx_w] = c;
    80000dcc:	0000b797          	auipc	a5,0xb
    80000dd0:	23878793          	addi	a5,a5,568 # 8000c004 <uart_tx_w>
    80000dd4:	439c                	lw	a5,0(a5)
    80000dd6:	fec42703          	lw	a4,-20(s0)
    80000dda:	0ff77713          	andi	a4,a4,255
    80000dde:	00013697          	auipc	a3,0x13
    80000de2:	47268693          	addi	a3,a3,1138 # 80014250 <uart_tx_buf>
    80000de6:	97b6                	add	a5,a5,a3
    80000de8:	00e78023          	sb	a4,0(a5)
      uart_tx_w = (uart_tx_w + 1) % UART_TX_BUF_SIZE;
    80000dec:	0000b797          	auipc	a5,0xb
    80000df0:	21878793          	addi	a5,a5,536 # 8000c004 <uart_tx_w>
    80000df4:	439c                	lw	a5,0(a5)
    80000df6:	2785                	addiw	a5,a5,1
    80000df8:	2781                	sext.w	a5,a5
    80000dfa:	873e                	mv	a4,a5
    80000dfc:	41f7579b          	sraiw	a5,a4,0x1f
    80000e00:	01b7d79b          	srliw	a5,a5,0x1b
    80000e04:	9f3d                	addw	a4,a4,a5
    80000e06:	8b7d                	andi	a4,a4,31
    80000e08:	40f707bb          	subw	a5,a4,a5
    80000e0c:	0007871b          	sext.w	a4,a5
    80000e10:	0000b797          	auipc	a5,0xb
    80000e14:	1f478793          	addi	a5,a5,500 # 8000c004 <uart_tx_w>
    80000e18:	c398                	sw	a4,0(a5)
      uartstart();
    80000e1a:	00000097          	auipc	ra,0x0
    80000e1e:	084080e7          	jalr	132(ra) # 80000e9e <uartstart>
      release(&uart_tx_lock);
    80000e22:	00013517          	auipc	a0,0x13
    80000e26:	41650513          	addi	a0,a0,1046 # 80014238 <uart_tx_lock>
    80000e2a:	00000097          	auipc	ra,0x0
    80000e2e:	4b8080e7          	jalr	1208(ra) # 800012e2 <release>
      return;
    80000e32:	0001                	nop
    }
  }
}
    80000e34:	60e2                	ld	ra,24(sp)
    80000e36:	6442                	ld	s0,16(sp)
    80000e38:	6105                	addi	sp,sp,32
    80000e3a:	8082                	ret

0000000080000e3c <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000e3c:	1101                	addi	sp,sp,-32
    80000e3e:	ec06                	sd	ra,24(sp)
    80000e40:	e822                	sd	s0,16(sp)
    80000e42:	1000                	addi	s0,sp,32
    80000e44:	87aa                	mv	a5,a0
    80000e46:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000e4a:	00000097          	auipc	ra,0x0
    80000e4e:	532080e7          	jalr	1330(ra) # 8000137c <push_off>

  if(panicked){
    80000e52:	0000b797          	auipc	a5,0xb
    80000e56:	1ae78793          	addi	a5,a5,430 # 8000c000 <panicked>
    80000e5a:	439c                	lw	a5,0(a5)
    80000e5c:	2781                	sext.w	a5,a5
    80000e5e:	c391                	beqz	a5,80000e62 <uartputc_sync+0x26>
    for(;;)
    80000e60:	a001                	j	80000e60 <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000e62:	0001                	nop
    80000e64:	100007b7          	lui	a5,0x10000
    80000e68:	0795                	addi	a5,a5,5
    80000e6a:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000e6e:	0ff7f793          	andi	a5,a5,255
    80000e72:	2781                	sext.w	a5,a5
    80000e74:	0207f793          	andi	a5,a5,32
    80000e78:	2781                	sext.w	a5,a5
    80000e7a:	d7ed                	beqz	a5,80000e64 <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80000e7c:	100007b7          	lui	a5,0x10000
    80000e80:	fec42703          	lw	a4,-20(s0)
    80000e84:	0ff77713          	andi	a4,a4,255
    80000e88:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000e8c:	00000097          	auipc	ra,0x0
    80000e90:	548080e7          	jalr	1352(ra) # 800013d4 <pop_off>
}
    80000e94:	0001                	nop
    80000e96:	60e2                	ld	ra,24(sp)
    80000e98:	6442                	ld	s0,16(sp)
    80000e9a:	6105                	addi	sp,sp,32
    80000e9c:	8082                	ret

0000000080000e9e <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000e9e:	1101                	addi	sp,sp,-32
    80000ea0:	ec06                	sd	ra,24(sp)
    80000ea2:	e822                	sd	s0,16(sp)
    80000ea4:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000ea6:	0000b797          	auipc	a5,0xb
    80000eaa:	15e78793          	addi	a5,a5,350 # 8000c004 <uart_tx_w>
    80000eae:	4398                	lw	a4,0(a5)
    80000eb0:	0000b797          	auipc	a5,0xb
    80000eb4:	15878793          	addi	a5,a5,344 # 8000c008 <uart_tx_r>
    80000eb8:	439c                	lw	a5,0(a5)
    80000eba:	08f70463          	beq	a4,a5,80000f42 <uartstart+0xa4>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000ebe:	100007b7          	lui	a5,0x10000
    80000ec2:	0795                	addi	a5,a5,5
    80000ec4:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000ec8:	0ff7f793          	andi	a5,a5,255
    80000ecc:	2781                	sext.w	a5,a5
    80000ece:	0207f793          	andi	a5,a5,32
    80000ed2:	2781                	sext.w	a5,a5
    80000ed4:	cbad                	beqz	a5,80000f46 <uartstart+0xa8>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r];
    80000ed6:	0000b797          	auipc	a5,0xb
    80000eda:	13278793          	addi	a5,a5,306 # 8000c008 <uart_tx_r>
    80000ede:	439c                	lw	a5,0(a5)
    80000ee0:	00013717          	auipc	a4,0x13
    80000ee4:	37070713          	addi	a4,a4,880 # 80014250 <uart_tx_buf>
    80000ee8:	97ba                	add	a5,a5,a4
    80000eea:	0007c783          	lbu	a5,0(a5)
    80000eee:	fef42623          	sw	a5,-20(s0)
    uart_tx_r = (uart_tx_r + 1) % UART_TX_BUF_SIZE;
    80000ef2:	0000b797          	auipc	a5,0xb
    80000ef6:	11678793          	addi	a5,a5,278 # 8000c008 <uart_tx_r>
    80000efa:	439c                	lw	a5,0(a5)
    80000efc:	2785                	addiw	a5,a5,1
    80000efe:	2781                	sext.w	a5,a5
    80000f00:	873e                	mv	a4,a5
    80000f02:	41f7579b          	sraiw	a5,a4,0x1f
    80000f06:	01b7d79b          	srliw	a5,a5,0x1b
    80000f0a:	9f3d                	addw	a4,a4,a5
    80000f0c:	8b7d                	andi	a4,a4,31
    80000f0e:	40f707bb          	subw	a5,a4,a5
    80000f12:	0007871b          	sext.w	a4,a5
    80000f16:	0000b797          	auipc	a5,0xb
    80000f1a:	0f278793          	addi	a5,a5,242 # 8000c008 <uart_tx_r>
    80000f1e:	c398                	sw	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000f20:	0000b517          	auipc	a0,0xb
    80000f24:	0e850513          	addi	a0,a0,232 # 8000c008 <uart_tx_r>
    80000f28:	00002097          	auipc	ra,0x2
    80000f2c:	6ae080e7          	jalr	1710(ra) # 800035d6 <wakeup>
    
    WriteReg(THR, c);
    80000f30:	100007b7          	lui	a5,0x10000
    80000f34:	fec42703          	lw	a4,-20(s0)
    80000f38:	0ff77713          	andi	a4,a4,255
    80000f3c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000f40:	b79d                	j	80000ea6 <uartstart+0x8>
      return;
    80000f42:	0001                	nop
    80000f44:	a011                	j	80000f48 <uartstart+0xaa>
      return;
    80000f46:	0001                	nop
  }
}
    80000f48:	60e2                	ld	ra,24(sp)
    80000f4a:	6442                	ld	s0,16(sp)
    80000f4c:	6105                	addi	sp,sp,32
    80000f4e:	8082                	ret

0000000080000f50 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000f50:	1141                	addi	sp,sp,-16
    80000f52:	e422                	sd	s0,8(sp)
    80000f54:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000f56:	100007b7          	lui	a5,0x10000
    80000f5a:	0795                	addi	a5,a5,5
    80000f5c:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f60:	0ff7f793          	andi	a5,a5,255
    80000f64:	2781                	sext.w	a5,a5
    80000f66:	8b85                	andi	a5,a5,1
    80000f68:	2781                	sext.w	a5,a5
    80000f6a:	cb89                	beqz	a5,80000f7c <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    80000f6c:	100007b7          	lui	a5,0x10000
    80000f70:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f74:	0ff7f793          	andi	a5,a5,255
    80000f78:	2781                	sext.w	a5,a5
    80000f7a:	a011                	j	80000f7e <uartgetc+0x2e>
  } else {
    return -1;
    80000f7c:	57fd                	li	a5,-1
  }
}
    80000f7e:	853e                	mv	a0,a5
    80000f80:	6422                	ld	s0,8(sp)
    80000f82:	0141                	addi	sp,sp,16
    80000f84:	8082                	ret

0000000080000f86 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80000f86:	1101                	addi	sp,sp,-32
    80000f88:	ec06                	sd	ra,24(sp)
    80000f8a:	e822                	sd	s0,16(sp)
    80000f8c:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80000f8e:	00000097          	auipc	ra,0x0
    80000f92:	fc2080e7          	jalr	-62(ra) # 80000f50 <uartgetc>
    80000f96:	87aa                	mv	a5,a0
    80000f98:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80000f9c:	fec42783          	lw	a5,-20(s0)
    80000fa0:	0007871b          	sext.w	a4,a5
    80000fa4:	57fd                	li	a5,-1
    80000fa6:	00f70a63          	beq	a4,a5,80000fba <uartintr+0x34>
      break;
    consoleintr(c);
    80000faa:	fec42783          	lw	a5,-20(s0)
    80000fae:	853e                	mv	a0,a5
    80000fb0:	fffff097          	auipc	ra,0xfffff
    80000fb4:	60c080e7          	jalr	1548(ra) # 800005bc <consoleintr>
  while(1){
    80000fb8:	bfd9                	j	80000f8e <uartintr+0x8>
      break;
    80000fba:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80000fbc:	00013517          	auipc	a0,0x13
    80000fc0:	27c50513          	addi	a0,a0,636 # 80014238 <uart_tx_lock>
    80000fc4:	00000097          	auipc	ra,0x0
    80000fc8:	2ba080e7          	jalr	698(ra) # 8000127e <acquire>
  uartstart();
    80000fcc:	00000097          	auipc	ra,0x0
    80000fd0:	ed2080e7          	jalr	-302(ra) # 80000e9e <uartstart>
  release(&uart_tx_lock);
    80000fd4:	00013517          	auipc	a0,0x13
    80000fd8:	26450513          	addi	a0,a0,612 # 80014238 <uart_tx_lock>
    80000fdc:	00000097          	auipc	ra,0x0
    80000fe0:	306080e7          	jalr	774(ra) # 800012e2 <release>
}
    80000fe4:	0001                	nop
    80000fe6:	60e2                	ld	ra,24(sp)
    80000fe8:	6442                	ld	s0,16(sp)
    80000fea:	6105                	addi	sp,sp,32
    80000fec:	8082                	ret

0000000080000fee <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80000fee:	1141                	addi	sp,sp,-16
    80000ff0:	e406                	sd	ra,8(sp)
    80000ff2:	e022                	sd	s0,0(sp)
    80000ff4:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    80000ff6:	0000a597          	auipc	a1,0xa
    80000ffa:	04a58593          	addi	a1,a1,74 # 8000b040 <etext+0x40>
    80000ffe:	00013517          	auipc	a0,0x13
    80001002:	27250513          	addi	a0,a0,626 # 80014270 <kmem>
    80001006:	00000097          	auipc	ra,0x0
    8000100a:	248080e7          	jalr	584(ra) # 8000124e <initlock>
  freerange(end, (void*)PHYSTOP);
    8000100e:	47c5                	li	a5,17
    80001010:	01b79593          	slli	a1,a5,0x1b
    80001014:	00071517          	auipc	a0,0x71
    80001018:	fec50513          	addi	a0,a0,-20 # 80072000 <end>
    8000101c:	00000097          	auipc	ra,0x0
    80001020:	012080e7          	jalr	18(ra) # 8000102e <freerange>
}
    80001024:	0001                	nop
    80001026:	60a2                	ld	ra,8(sp)
    80001028:	6402                	ld	s0,0(sp)
    8000102a:	0141                	addi	sp,sp,16
    8000102c:	8082                	ret

000000008000102e <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    8000102e:	7179                	addi	sp,sp,-48
    80001030:	f406                	sd	ra,40(sp)
    80001032:	f022                	sd	s0,32(sp)
    80001034:	1800                	addi	s0,sp,48
    80001036:	fca43c23          	sd	a0,-40(s0)
    8000103a:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    8000103e:	fd843703          	ld	a4,-40(s0)
    80001042:	6785                	lui	a5,0x1
    80001044:	17fd                	addi	a5,a5,-1
    80001046:	973e                	add	a4,a4,a5
    80001048:	77fd                	lui	a5,0xfffff
    8000104a:	8ff9                	and	a5,a5,a4
    8000104c:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001050:	a829                	j	8000106a <freerange+0x3c>
    kfree(p);
    80001052:	fe843503          	ld	a0,-24(s0)
    80001056:	00000097          	auipc	ra,0x0
    8000105a:	030080e7          	jalr	48(ra) # 80001086 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    8000105e:	fe843703          	ld	a4,-24(s0)
    80001062:	6785                	lui	a5,0x1
    80001064:	97ba                	add	a5,a5,a4
    80001066:	fef43423          	sd	a5,-24(s0)
    8000106a:	fe843703          	ld	a4,-24(s0)
    8000106e:	6785                	lui	a5,0x1
    80001070:	97ba                	add	a5,a5,a4
    80001072:	fd043703          	ld	a4,-48(s0)
    80001076:	fcf77ee3          	bgeu	a4,a5,80001052 <freerange+0x24>
}
    8000107a:	0001                	nop
    8000107c:	0001                	nop
    8000107e:	70a2                	ld	ra,40(sp)
    80001080:	7402                	ld	s0,32(sp)
    80001082:	6145                	addi	sp,sp,48
    80001084:	8082                	ret

0000000080001086 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001086:	7179                	addi	sp,sp,-48
    80001088:	f406                	sd	ra,40(sp)
    8000108a:	f022                	sd	s0,32(sp)
    8000108c:	1800                	addi	s0,sp,48
    8000108e:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    80001092:	fd843703          	ld	a4,-40(s0)
    80001096:	6785                	lui	a5,0x1
    80001098:	17fd                	addi	a5,a5,-1
    8000109a:	8ff9                	and	a5,a5,a4
    8000109c:	ef99                	bnez	a5,800010ba <kfree+0x34>
    8000109e:	fd843703          	ld	a4,-40(s0)
    800010a2:	00071797          	auipc	a5,0x71
    800010a6:	f5e78793          	addi	a5,a5,-162 # 80072000 <end>
    800010aa:	00f76863          	bltu	a4,a5,800010ba <kfree+0x34>
    800010ae:	fd843703          	ld	a4,-40(s0)
    800010b2:	47c5                	li	a5,17
    800010b4:	07ee                	slli	a5,a5,0x1b
    800010b6:	00f76a63          	bltu	a4,a5,800010ca <kfree+0x44>
    panic("kfree");
    800010ba:	0000a517          	auipc	a0,0xa
    800010be:	f8e50513          	addi	a0,a0,-114 # 8000b048 <etext+0x48>
    800010c2:	00000097          	auipc	ra,0x0
    800010c6:	b8e080e7          	jalr	-1138(ra) # 80000c50 <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    800010ca:	6605                	lui	a2,0x1
    800010cc:	4585                	li	a1,1
    800010ce:	fd843503          	ld	a0,-40(s0)
    800010d2:	00000097          	auipc	ra,0x0
    800010d6:	380080e7          	jalr	896(ra) # 80001452 <memset>

  r = (struct run*)pa;
    800010da:	fd843783          	ld	a5,-40(s0)
    800010de:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    800010e2:	00013517          	auipc	a0,0x13
    800010e6:	18e50513          	addi	a0,a0,398 # 80014270 <kmem>
    800010ea:	00000097          	auipc	ra,0x0
    800010ee:	194080e7          	jalr	404(ra) # 8000127e <acquire>
  r->next = kmem.freelist;
    800010f2:	00013797          	auipc	a5,0x13
    800010f6:	17e78793          	addi	a5,a5,382 # 80014270 <kmem>
    800010fa:	6f98                	ld	a4,24(a5)
    800010fc:	fe843783          	ld	a5,-24(s0)
    80001100:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    80001102:	00013797          	auipc	a5,0x13
    80001106:	16e78793          	addi	a5,a5,366 # 80014270 <kmem>
    8000110a:	fe843703          	ld	a4,-24(s0)
    8000110e:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001110:	00013517          	auipc	a0,0x13
    80001114:	16050513          	addi	a0,a0,352 # 80014270 <kmem>
    80001118:	00000097          	auipc	ra,0x0
    8000111c:	1ca080e7          	jalr	458(ra) # 800012e2 <release>
}
    80001120:	0001                	nop
    80001122:	70a2                	ld	ra,40(sp)
    80001124:	7402                	ld	s0,32(sp)
    80001126:	6145                	addi	sp,sp,48
    80001128:	8082                	ret

000000008000112a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8000112a:	1101                	addi	sp,sp,-32
    8000112c:	ec06                	sd	ra,24(sp)
    8000112e:	e822                	sd	s0,16(sp)
    80001130:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80001132:	00013517          	auipc	a0,0x13
    80001136:	13e50513          	addi	a0,a0,318 # 80014270 <kmem>
    8000113a:	00000097          	auipc	ra,0x0
    8000113e:	144080e7          	jalr	324(ra) # 8000127e <acquire>
  r = kmem.freelist;
    80001142:	00013797          	auipc	a5,0x13
    80001146:	12e78793          	addi	a5,a5,302 # 80014270 <kmem>
    8000114a:	6f9c                	ld	a5,24(a5)
    8000114c:	fef43423          	sd	a5,-24(s0)
  if(r)
    80001150:	fe843783          	ld	a5,-24(s0)
    80001154:	cb89                	beqz	a5,80001166 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001156:	fe843783          	ld	a5,-24(s0)
    8000115a:	6398                	ld	a4,0(a5)
    8000115c:	00013797          	auipc	a5,0x13
    80001160:	11478793          	addi	a5,a5,276 # 80014270 <kmem>
    80001164:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001166:	00013517          	auipc	a0,0x13
    8000116a:	10a50513          	addi	a0,a0,266 # 80014270 <kmem>
    8000116e:	00000097          	auipc	ra,0x0
    80001172:	174080e7          	jalr	372(ra) # 800012e2 <release>

  if(r)
    80001176:	fe843783          	ld	a5,-24(s0)
    8000117a:	cb89                	beqz	a5,8000118c <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000117c:	6605                	lui	a2,0x1
    8000117e:	4595                	li	a1,5
    80001180:	fe843503          	ld	a0,-24(s0)
    80001184:	00000097          	auipc	ra,0x0
    80001188:	2ce080e7          	jalr	718(ra) # 80001452 <memset>
  return (void*)r;
    8000118c:	fe843783          	ld	a5,-24(s0)
}
    80001190:	853e                	mv	a0,a5
    80001192:	60e2                	ld	ra,24(sp)
    80001194:	6442                	ld	s0,16(sp)
    80001196:	6105                	addi	sp,sp,32
    80001198:	8082                	ret

000000008000119a <r_sstatus>:
{
    8000119a:	1101                	addi	sp,sp,-32
    8000119c:	ec22                	sd	s0,24(sp)
    8000119e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800011a0:	100027f3          	csrr	a5,sstatus
    800011a4:	fef43423          	sd	a5,-24(s0)
  return x;
    800011a8:	fe843783          	ld	a5,-24(s0)
}
    800011ac:	853e                	mv	a0,a5
    800011ae:	6462                	ld	s0,24(sp)
    800011b0:	6105                	addi	sp,sp,32
    800011b2:	8082                	ret

00000000800011b4 <w_sstatus>:
{
    800011b4:	1101                	addi	sp,sp,-32
    800011b6:	ec22                	sd	s0,24(sp)
    800011b8:	1000                	addi	s0,sp,32
    800011ba:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800011be:	fe843783          	ld	a5,-24(s0)
    800011c2:	10079073          	csrw	sstatus,a5
}
    800011c6:	0001                	nop
    800011c8:	6462                	ld	s0,24(sp)
    800011ca:	6105                	addi	sp,sp,32
    800011cc:	8082                	ret

00000000800011ce <intr_on>:
{
    800011ce:	1141                	addi	sp,sp,-16
    800011d0:	e406                	sd	ra,8(sp)
    800011d2:	e022                	sd	s0,0(sp)
    800011d4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800011d6:	00000097          	auipc	ra,0x0
    800011da:	fc4080e7          	jalr	-60(ra) # 8000119a <r_sstatus>
    800011de:	87aa                	mv	a5,a0
    800011e0:	0027e793          	ori	a5,a5,2
    800011e4:	853e                	mv	a0,a5
    800011e6:	00000097          	auipc	ra,0x0
    800011ea:	fce080e7          	jalr	-50(ra) # 800011b4 <w_sstatus>
}
    800011ee:	0001                	nop
    800011f0:	60a2                	ld	ra,8(sp)
    800011f2:	6402                	ld	s0,0(sp)
    800011f4:	0141                	addi	sp,sp,16
    800011f6:	8082                	ret

00000000800011f8 <intr_off>:
{
    800011f8:	1141                	addi	sp,sp,-16
    800011fa:	e406                	sd	ra,8(sp)
    800011fc:	e022                	sd	s0,0(sp)
    800011fe:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80001200:	00000097          	auipc	ra,0x0
    80001204:	f9a080e7          	jalr	-102(ra) # 8000119a <r_sstatus>
    80001208:	87aa                	mv	a5,a0
    8000120a:	9bf5                	andi	a5,a5,-3
    8000120c:	853e                	mv	a0,a5
    8000120e:	00000097          	auipc	ra,0x0
    80001212:	fa6080e7          	jalr	-90(ra) # 800011b4 <w_sstatus>
}
    80001216:	0001                	nop
    80001218:	60a2                	ld	ra,8(sp)
    8000121a:	6402                	ld	s0,0(sp)
    8000121c:	0141                	addi	sp,sp,16
    8000121e:	8082                	ret

0000000080001220 <intr_get>:
{
    80001220:	1101                	addi	sp,sp,-32
    80001222:	ec06                	sd	ra,24(sp)
    80001224:	e822                	sd	s0,16(sp)
    80001226:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80001228:	00000097          	auipc	ra,0x0
    8000122c:	f72080e7          	jalr	-142(ra) # 8000119a <r_sstatus>
    80001230:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80001234:	fe843783          	ld	a5,-24(s0)
    80001238:	8b89                	andi	a5,a5,2
    8000123a:	00f037b3          	snez	a5,a5
    8000123e:	0ff7f793          	andi	a5,a5,255
    80001242:	2781                	sext.w	a5,a5
}
    80001244:	853e                	mv	a0,a5
    80001246:	60e2                	ld	ra,24(sp)
    80001248:	6442                	ld	s0,16(sp)
    8000124a:	6105                	addi	sp,sp,32
    8000124c:	8082                	ret

000000008000124e <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    8000124e:	1101                	addi	sp,sp,-32
    80001250:	ec22                	sd	s0,24(sp)
    80001252:	1000                	addi	s0,sp,32
    80001254:	fea43423          	sd	a0,-24(s0)
    80001258:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    8000125c:	fe843783          	ld	a5,-24(s0)
    80001260:	fe043703          	ld	a4,-32(s0)
    80001264:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001266:	fe843783          	ld	a5,-24(s0)
    8000126a:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    8000126e:	fe843783          	ld	a5,-24(s0)
    80001272:	0007b823          	sd	zero,16(a5)
}
    80001276:	0001                	nop
    80001278:	6462                	ld	s0,24(sp)
    8000127a:	6105                	addi	sp,sp,32
    8000127c:	8082                	ret

000000008000127e <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    8000127e:	1101                	addi	sp,sp,-32
    80001280:	ec06                	sd	ra,24(sp)
    80001282:	e822                	sd	s0,16(sp)
    80001284:	1000                	addi	s0,sp,32
    80001286:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    8000128a:	00000097          	auipc	ra,0x0
    8000128e:	0f2080e7          	jalr	242(ra) # 8000137c <push_off>
  if(holding(lk))
    80001292:	fe843503          	ld	a0,-24(s0)
    80001296:	00000097          	auipc	ra,0x0
    8000129a:	0a2080e7          	jalr	162(ra) # 80001338 <holding>
    8000129e:	87aa                	mv	a5,a0
    800012a0:	cb89                	beqz	a5,800012b2 <acquire+0x34>
    panic("acquire");
    800012a2:	0000a517          	auipc	a0,0xa
    800012a6:	dae50513          	addi	a0,a0,-594 # 8000b050 <etext+0x50>
    800012aa:	00000097          	auipc	ra,0x0
    800012ae:	9a6080e7          	jalr	-1626(ra) # 80000c50 <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    800012b2:	0001                	nop
    800012b4:	fe843783          	ld	a5,-24(s0)
    800012b8:	4705                	li	a4,1
    800012ba:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    800012be:	0007079b          	sext.w	a5,a4
    800012c2:	fbed                	bnez	a5,800012b4 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800012c4:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    800012c8:	00001097          	auipc	ra,0x1
    800012cc:	4f4080e7          	jalr	1268(ra) # 800027bc <mycpu>
    800012d0:	872a                	mv	a4,a0
    800012d2:	fe843783          	ld	a5,-24(s0)
    800012d6:	eb98                	sd	a4,16(a5)
}
    800012d8:	0001                	nop
    800012da:	60e2                	ld	ra,24(sp)
    800012dc:	6442                	ld	s0,16(sp)
    800012de:	6105                	addi	sp,sp,32
    800012e0:	8082                	ret

00000000800012e2 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800012e2:	1101                	addi	sp,sp,-32
    800012e4:	ec06                	sd	ra,24(sp)
    800012e6:	e822                	sd	s0,16(sp)
    800012e8:	1000                	addi	s0,sp,32
    800012ea:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800012ee:	fe843503          	ld	a0,-24(s0)
    800012f2:	00000097          	auipc	ra,0x0
    800012f6:	046080e7          	jalr	70(ra) # 80001338 <holding>
    800012fa:	87aa                	mv	a5,a0
    800012fc:	eb89                	bnez	a5,8000130e <release+0x2c>
    panic("release");
    800012fe:	0000a517          	auipc	a0,0xa
    80001302:	d5a50513          	addi	a0,a0,-678 # 8000b058 <etext+0x58>
    80001306:	00000097          	auipc	ra,0x0
    8000130a:	94a080e7          	jalr	-1718(ra) # 80000c50 <panic>

  lk->cpu = 0;
    8000130e:	fe843783          	ld	a5,-24(s0)
    80001312:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001316:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    8000131a:	fe843783          	ld	a5,-24(s0)
    8000131e:	0f50000f          	fence	iorw,ow
    80001322:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    80001326:	00000097          	auipc	ra,0x0
    8000132a:	0ae080e7          	jalr	174(ra) # 800013d4 <pop_off>
}
    8000132e:	0001                	nop
    80001330:	60e2                	ld	ra,24(sp)
    80001332:	6442                	ld	s0,16(sp)
    80001334:	6105                	addi	sp,sp,32
    80001336:	8082                	ret

0000000080001338 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    80001338:	7139                	addi	sp,sp,-64
    8000133a:	fc06                	sd	ra,56(sp)
    8000133c:	f822                	sd	s0,48(sp)
    8000133e:	f426                	sd	s1,40(sp)
    80001340:	0080                	addi	s0,sp,64
    80001342:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001346:	fc843783          	ld	a5,-56(s0)
    8000134a:	439c                	lw	a5,0(a5)
    8000134c:	cf89                	beqz	a5,80001366 <holding+0x2e>
    8000134e:	fc843783          	ld	a5,-56(s0)
    80001352:	6b84                	ld	s1,16(a5)
    80001354:	00001097          	auipc	ra,0x1
    80001358:	468080e7          	jalr	1128(ra) # 800027bc <mycpu>
    8000135c:	87aa                	mv	a5,a0
    8000135e:	00f49463          	bne	s1,a5,80001366 <holding+0x2e>
    80001362:	4785                	li	a5,1
    80001364:	a011                	j	80001368 <holding+0x30>
    80001366:	4781                	li	a5,0
    80001368:	fcf42e23          	sw	a5,-36(s0)
  return r;
    8000136c:	fdc42783          	lw	a5,-36(s0)
}
    80001370:	853e                	mv	a0,a5
    80001372:	70e2                	ld	ra,56(sp)
    80001374:	7442                	ld	s0,48(sp)
    80001376:	74a2                	ld	s1,40(sp)
    80001378:	6121                	addi	sp,sp,64
    8000137a:	8082                	ret

000000008000137c <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    8000137c:	1101                	addi	sp,sp,-32
    8000137e:	ec06                	sd	ra,24(sp)
    80001380:	e822                	sd	s0,16(sp)
    80001382:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001384:	00000097          	auipc	ra,0x0
    80001388:	e9c080e7          	jalr	-356(ra) # 80001220 <intr_get>
    8000138c:	87aa                	mv	a5,a0
    8000138e:	fef42623          	sw	a5,-20(s0)

  intr_off();
    80001392:	00000097          	auipc	ra,0x0
    80001396:	e66080e7          	jalr	-410(ra) # 800011f8 <intr_off>
  if(mycpu()->noff == 0)
    8000139a:	00001097          	auipc	ra,0x1
    8000139e:	422080e7          	jalr	1058(ra) # 800027bc <mycpu>
    800013a2:	87aa                	mv	a5,a0
    800013a4:	5fbc                	lw	a5,120(a5)
    800013a6:	eb89                	bnez	a5,800013b8 <push_off+0x3c>
    mycpu()->intena = old;
    800013a8:	00001097          	auipc	ra,0x1
    800013ac:	414080e7          	jalr	1044(ra) # 800027bc <mycpu>
    800013b0:	872a                	mv	a4,a0
    800013b2:	fec42783          	lw	a5,-20(s0)
    800013b6:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800013b8:	00001097          	auipc	ra,0x1
    800013bc:	404080e7          	jalr	1028(ra) # 800027bc <mycpu>
    800013c0:	87aa                	mv	a5,a0
    800013c2:	5fb8                	lw	a4,120(a5)
    800013c4:	2705                	addiw	a4,a4,1
    800013c6:	2701                	sext.w	a4,a4
    800013c8:	dfb8                	sw	a4,120(a5)
}
    800013ca:	0001                	nop
    800013cc:	60e2                	ld	ra,24(sp)
    800013ce:	6442                	ld	s0,16(sp)
    800013d0:	6105                	addi	sp,sp,32
    800013d2:	8082                	ret

00000000800013d4 <pop_off>:

void
pop_off(void)
{
    800013d4:	1101                	addi	sp,sp,-32
    800013d6:	ec06                	sd	ra,24(sp)
    800013d8:	e822                	sd	s0,16(sp)
    800013da:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    800013dc:	00001097          	auipc	ra,0x1
    800013e0:	3e0080e7          	jalr	992(ra) # 800027bc <mycpu>
    800013e4:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800013e8:	00000097          	auipc	ra,0x0
    800013ec:	e38080e7          	jalr	-456(ra) # 80001220 <intr_get>
    800013f0:	87aa                	mv	a5,a0
    800013f2:	cb89                	beqz	a5,80001404 <pop_off+0x30>
    panic("pop_off - interruptible");
    800013f4:	0000a517          	auipc	a0,0xa
    800013f8:	c6c50513          	addi	a0,a0,-916 # 8000b060 <etext+0x60>
    800013fc:	00000097          	auipc	ra,0x0
    80001400:	854080e7          	jalr	-1964(ra) # 80000c50 <panic>
  if(c->noff < 1)
    80001404:	fe843783          	ld	a5,-24(s0)
    80001408:	5fbc                	lw	a5,120(a5)
    8000140a:	00f04a63          	bgtz	a5,8000141e <pop_off+0x4a>
    panic("pop_off");
    8000140e:	0000a517          	auipc	a0,0xa
    80001412:	c6a50513          	addi	a0,a0,-918 # 8000b078 <etext+0x78>
    80001416:	00000097          	auipc	ra,0x0
    8000141a:	83a080e7          	jalr	-1990(ra) # 80000c50 <panic>
  c->noff -= 1;
    8000141e:	fe843783          	ld	a5,-24(s0)
    80001422:	5fbc                	lw	a5,120(a5)
    80001424:	37fd                	addiw	a5,a5,-1
    80001426:	0007871b          	sext.w	a4,a5
    8000142a:	fe843783          	ld	a5,-24(s0)
    8000142e:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    80001430:	fe843783          	ld	a5,-24(s0)
    80001434:	5fbc                	lw	a5,120(a5)
    80001436:	eb89                	bnez	a5,80001448 <pop_off+0x74>
    80001438:	fe843783          	ld	a5,-24(s0)
    8000143c:	5ffc                	lw	a5,124(a5)
    8000143e:	c789                	beqz	a5,80001448 <pop_off+0x74>
    intr_on();
    80001440:	00000097          	auipc	ra,0x0
    80001444:	d8e080e7          	jalr	-626(ra) # 800011ce <intr_on>
}
    80001448:	0001                	nop
    8000144a:	60e2                	ld	ra,24(sp)
    8000144c:	6442                	ld	s0,16(sp)
    8000144e:	6105                	addi	sp,sp,32
    80001450:	8082                	ret

0000000080001452 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001452:	7179                	addi	sp,sp,-48
    80001454:	f422                	sd	s0,40(sp)
    80001456:	1800                	addi	s0,sp,48
    80001458:	fca43c23          	sd	a0,-40(s0)
    8000145c:	87ae                	mv	a5,a1
    8000145e:	8732                	mv	a4,a2
    80001460:	fcf42a23          	sw	a5,-44(s0)
    80001464:	87ba                	mv	a5,a4
    80001466:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    8000146a:	fd843783          	ld	a5,-40(s0)
    8000146e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    80001472:	fe042623          	sw	zero,-20(s0)
    80001476:	a00d                	j	80001498 <memset+0x46>
    cdst[i] = c;
    80001478:	fec42783          	lw	a5,-20(s0)
    8000147c:	fe043703          	ld	a4,-32(s0)
    80001480:	97ba                	add	a5,a5,a4
    80001482:	fd442703          	lw	a4,-44(s0)
    80001486:	0ff77713          	andi	a4,a4,255
    8000148a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    8000148e:	fec42783          	lw	a5,-20(s0)
    80001492:	2785                	addiw	a5,a5,1
    80001494:	fef42623          	sw	a5,-20(s0)
    80001498:	fec42703          	lw	a4,-20(s0)
    8000149c:	fd042783          	lw	a5,-48(s0)
    800014a0:	2781                	sext.w	a5,a5
    800014a2:	fcf76be3          	bltu	a4,a5,80001478 <memset+0x26>
  }
  return dst;
    800014a6:	fd843783          	ld	a5,-40(s0)
}
    800014aa:	853e                	mv	a0,a5
    800014ac:	7422                	ld	s0,40(sp)
    800014ae:	6145                	addi	sp,sp,48
    800014b0:	8082                	ret

00000000800014b2 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    800014b2:	7139                	addi	sp,sp,-64
    800014b4:	fc22                	sd	s0,56(sp)
    800014b6:	0080                	addi	s0,sp,64
    800014b8:	fca43c23          	sd	a0,-40(s0)
    800014bc:	fcb43823          	sd	a1,-48(s0)
    800014c0:	87b2                	mv	a5,a2
    800014c2:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    800014c6:	fd843783          	ld	a5,-40(s0)
    800014ca:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    800014ce:	fd043783          	ld	a5,-48(s0)
    800014d2:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800014d6:	a0a1                	j	8000151e <memcmp+0x6c>
    if(*s1 != *s2)
    800014d8:	fe843783          	ld	a5,-24(s0)
    800014dc:	0007c703          	lbu	a4,0(a5)
    800014e0:	fe043783          	ld	a5,-32(s0)
    800014e4:	0007c783          	lbu	a5,0(a5)
    800014e8:	02f70163          	beq	a4,a5,8000150a <memcmp+0x58>
      return *s1 - *s2;
    800014ec:	fe843783          	ld	a5,-24(s0)
    800014f0:	0007c783          	lbu	a5,0(a5)
    800014f4:	0007871b          	sext.w	a4,a5
    800014f8:	fe043783          	ld	a5,-32(s0)
    800014fc:	0007c783          	lbu	a5,0(a5)
    80001500:	2781                	sext.w	a5,a5
    80001502:	40f707bb          	subw	a5,a4,a5
    80001506:	2781                	sext.w	a5,a5
    80001508:	a01d                	j	8000152e <memcmp+0x7c>
    s1++, s2++;
    8000150a:	fe843783          	ld	a5,-24(s0)
    8000150e:	0785                	addi	a5,a5,1
    80001510:	fef43423          	sd	a5,-24(s0)
    80001514:	fe043783          	ld	a5,-32(s0)
    80001518:	0785                	addi	a5,a5,1
    8000151a:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    8000151e:	fcc42783          	lw	a5,-52(s0)
    80001522:	fff7871b          	addiw	a4,a5,-1
    80001526:	fce42623          	sw	a4,-52(s0)
    8000152a:	f7dd                	bnez	a5,800014d8 <memcmp+0x26>
  }

  return 0;
    8000152c:	4781                	li	a5,0
}
    8000152e:	853e                	mv	a0,a5
    80001530:	7462                	ld	s0,56(sp)
    80001532:	6121                	addi	sp,sp,64
    80001534:	8082                	ret

0000000080001536 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001536:	7139                	addi	sp,sp,-64
    80001538:	fc22                	sd	s0,56(sp)
    8000153a:	0080                	addi	s0,sp,64
    8000153c:	fca43c23          	sd	a0,-40(s0)
    80001540:	fcb43823          	sd	a1,-48(s0)
    80001544:	87b2                	mv	a5,a2
    80001546:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  s = src;
    8000154a:	fd043783          	ld	a5,-48(s0)
    8000154e:	fef43423          	sd	a5,-24(s0)
  d = dst;
    80001552:	fd843783          	ld	a5,-40(s0)
    80001556:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    8000155a:	fe843703          	ld	a4,-24(s0)
    8000155e:	fe043783          	ld	a5,-32(s0)
    80001562:	08f77463          	bgeu	a4,a5,800015ea <memmove+0xb4>
    80001566:	fcc46783          	lwu	a5,-52(s0)
    8000156a:	fe843703          	ld	a4,-24(s0)
    8000156e:	97ba                	add	a5,a5,a4
    80001570:	fe043703          	ld	a4,-32(s0)
    80001574:	06f77b63          	bgeu	a4,a5,800015ea <memmove+0xb4>
    s += n;
    80001578:	fcc46783          	lwu	a5,-52(s0)
    8000157c:	fe843703          	ld	a4,-24(s0)
    80001580:	97ba                	add	a5,a5,a4
    80001582:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001586:	fcc46783          	lwu	a5,-52(s0)
    8000158a:	fe043703          	ld	a4,-32(s0)
    8000158e:	97ba                	add	a5,a5,a4
    80001590:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    80001594:	a01d                	j	800015ba <memmove+0x84>
      *--d = *--s;
    80001596:	fe843783          	ld	a5,-24(s0)
    8000159a:	17fd                	addi	a5,a5,-1
    8000159c:	fef43423          	sd	a5,-24(s0)
    800015a0:	fe043783          	ld	a5,-32(s0)
    800015a4:	17fd                	addi	a5,a5,-1
    800015a6:	fef43023          	sd	a5,-32(s0)
    800015aa:	fe843783          	ld	a5,-24(s0)
    800015ae:	0007c703          	lbu	a4,0(a5)
    800015b2:	fe043783          	ld	a5,-32(s0)
    800015b6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015ba:	fcc42783          	lw	a5,-52(s0)
    800015be:	fff7871b          	addiw	a4,a5,-1
    800015c2:	fce42623          	sw	a4,-52(s0)
    800015c6:	fbe1                	bnez	a5,80001596 <memmove+0x60>
  if(s < d && s + n > d){
    800015c8:	a805                	j	800015f8 <memmove+0xc2>
  } else
    while(n-- > 0)
      *d++ = *s++;
    800015ca:	fe843703          	ld	a4,-24(s0)
    800015ce:	00170793          	addi	a5,a4,1
    800015d2:	fef43423          	sd	a5,-24(s0)
    800015d6:	fe043783          	ld	a5,-32(s0)
    800015da:	00178693          	addi	a3,a5,1
    800015de:	fed43023          	sd	a3,-32(s0)
    800015e2:	00074703          	lbu	a4,0(a4)
    800015e6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015ea:	fcc42783          	lw	a5,-52(s0)
    800015ee:	fff7871b          	addiw	a4,a5,-1
    800015f2:	fce42623          	sw	a4,-52(s0)
    800015f6:	fbf1                	bnez	a5,800015ca <memmove+0x94>

  return dst;
    800015f8:	fd843783          	ld	a5,-40(s0)
}
    800015fc:	853e                	mv	a0,a5
    800015fe:	7462                	ld	s0,56(sp)
    80001600:	6121                	addi	sp,sp,64
    80001602:	8082                	ret

0000000080001604 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80001604:	7179                	addi	sp,sp,-48
    80001606:	f406                	sd	ra,40(sp)
    80001608:	f022                	sd	s0,32(sp)
    8000160a:	1800                	addi	s0,sp,48
    8000160c:	fea43423          	sd	a0,-24(s0)
    80001610:	feb43023          	sd	a1,-32(s0)
    80001614:	87b2                	mv	a5,a2
    80001616:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    8000161a:	fdc42783          	lw	a5,-36(s0)
    8000161e:	863e                	mv	a2,a5
    80001620:	fe043583          	ld	a1,-32(s0)
    80001624:	fe843503          	ld	a0,-24(s0)
    80001628:	00000097          	auipc	ra,0x0
    8000162c:	f0e080e7          	jalr	-242(ra) # 80001536 <memmove>
    80001630:	87aa                	mv	a5,a0
}
    80001632:	853e                	mv	a0,a5
    80001634:	70a2                	ld	ra,40(sp)
    80001636:	7402                	ld	s0,32(sp)
    80001638:	6145                	addi	sp,sp,48
    8000163a:	8082                	ret

000000008000163c <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8000163c:	7179                	addi	sp,sp,-48
    8000163e:	f422                	sd	s0,40(sp)
    80001640:	1800                	addi	s0,sp,48
    80001642:	fea43423          	sd	a0,-24(s0)
    80001646:	feb43023          	sd	a1,-32(s0)
    8000164a:	87b2                	mv	a5,a2
    8000164c:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    80001650:	a005                	j	80001670 <strncmp+0x34>
    n--, p++, q++;
    80001652:	fdc42783          	lw	a5,-36(s0)
    80001656:	37fd                	addiw	a5,a5,-1
    80001658:	fcf42e23          	sw	a5,-36(s0)
    8000165c:	fe843783          	ld	a5,-24(s0)
    80001660:	0785                	addi	a5,a5,1
    80001662:	fef43423          	sd	a5,-24(s0)
    80001666:	fe043783          	ld	a5,-32(s0)
    8000166a:	0785                	addi	a5,a5,1
    8000166c:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    80001670:	fdc42783          	lw	a5,-36(s0)
    80001674:	2781                	sext.w	a5,a5
    80001676:	c385                	beqz	a5,80001696 <strncmp+0x5a>
    80001678:	fe843783          	ld	a5,-24(s0)
    8000167c:	0007c783          	lbu	a5,0(a5)
    80001680:	cb99                	beqz	a5,80001696 <strncmp+0x5a>
    80001682:	fe843783          	ld	a5,-24(s0)
    80001686:	0007c703          	lbu	a4,0(a5)
    8000168a:	fe043783          	ld	a5,-32(s0)
    8000168e:	0007c783          	lbu	a5,0(a5)
    80001692:	fcf700e3          	beq	a4,a5,80001652 <strncmp+0x16>
  if(n == 0)
    80001696:	fdc42783          	lw	a5,-36(s0)
    8000169a:	2781                	sext.w	a5,a5
    8000169c:	e399                	bnez	a5,800016a2 <strncmp+0x66>
    return 0;
    8000169e:	4781                	li	a5,0
    800016a0:	a839                	j	800016be <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    800016a2:	fe843783          	ld	a5,-24(s0)
    800016a6:	0007c783          	lbu	a5,0(a5)
    800016aa:	0007871b          	sext.w	a4,a5
    800016ae:	fe043783          	ld	a5,-32(s0)
    800016b2:	0007c783          	lbu	a5,0(a5)
    800016b6:	2781                	sext.w	a5,a5
    800016b8:	40f707bb          	subw	a5,a4,a5
    800016bc:	2781                	sext.w	a5,a5
}
    800016be:	853e                	mv	a0,a5
    800016c0:	7422                	ld	s0,40(sp)
    800016c2:	6145                	addi	sp,sp,48
    800016c4:	8082                	ret

00000000800016c6 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    800016c6:	7139                	addi	sp,sp,-64
    800016c8:	fc22                	sd	s0,56(sp)
    800016ca:	0080                	addi	s0,sp,64
    800016cc:	fca43c23          	sd	a0,-40(s0)
    800016d0:	fcb43823          	sd	a1,-48(s0)
    800016d4:	87b2                	mv	a5,a2
    800016d6:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800016da:	fd843783          	ld	a5,-40(s0)
    800016de:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800016e2:	0001                	nop
    800016e4:	fcc42783          	lw	a5,-52(s0)
    800016e8:	fff7871b          	addiw	a4,a5,-1
    800016ec:	fce42623          	sw	a4,-52(s0)
    800016f0:	02f05e63          	blez	a5,8000172c <strncpy+0x66>
    800016f4:	fd043703          	ld	a4,-48(s0)
    800016f8:	00170793          	addi	a5,a4,1
    800016fc:	fcf43823          	sd	a5,-48(s0)
    80001700:	fd843783          	ld	a5,-40(s0)
    80001704:	00178693          	addi	a3,a5,1
    80001708:	fcd43c23          	sd	a3,-40(s0)
    8000170c:	00074703          	lbu	a4,0(a4)
    80001710:	00e78023          	sb	a4,0(a5)
    80001714:	0007c783          	lbu	a5,0(a5)
    80001718:	f7f1                	bnez	a5,800016e4 <strncpy+0x1e>
    ;
  while(n-- > 0)
    8000171a:	a809                	j	8000172c <strncpy+0x66>
    *s++ = 0;
    8000171c:	fd843783          	ld	a5,-40(s0)
    80001720:	00178713          	addi	a4,a5,1
    80001724:	fce43c23          	sd	a4,-40(s0)
    80001728:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    8000172c:	fcc42783          	lw	a5,-52(s0)
    80001730:	fff7871b          	addiw	a4,a5,-1
    80001734:	fce42623          	sw	a4,-52(s0)
    80001738:	fef042e3          	bgtz	a5,8000171c <strncpy+0x56>
  return os;
    8000173c:	fe843783          	ld	a5,-24(s0)
}
    80001740:	853e                	mv	a0,a5
    80001742:	7462                	ld	s0,56(sp)
    80001744:	6121                	addi	sp,sp,64
    80001746:	8082                	ret

0000000080001748 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001748:	7139                	addi	sp,sp,-64
    8000174a:	fc22                	sd	s0,56(sp)
    8000174c:	0080                	addi	s0,sp,64
    8000174e:	fca43c23          	sd	a0,-40(s0)
    80001752:	fcb43823          	sd	a1,-48(s0)
    80001756:	87b2                	mv	a5,a2
    80001758:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    8000175c:	fd843783          	ld	a5,-40(s0)
    80001760:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    80001764:	fcc42783          	lw	a5,-52(s0)
    80001768:	2781                	sext.w	a5,a5
    8000176a:	00f04563          	bgtz	a5,80001774 <safestrcpy+0x2c>
    return os;
    8000176e:	fe843783          	ld	a5,-24(s0)
    80001772:	a0a1                	j	800017ba <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    80001774:	fcc42783          	lw	a5,-52(s0)
    80001778:	37fd                	addiw	a5,a5,-1
    8000177a:	fcf42623          	sw	a5,-52(s0)
    8000177e:	fcc42783          	lw	a5,-52(s0)
    80001782:	2781                	sext.w	a5,a5
    80001784:	02f05563          	blez	a5,800017ae <safestrcpy+0x66>
    80001788:	fd043703          	ld	a4,-48(s0)
    8000178c:	00170793          	addi	a5,a4,1
    80001790:	fcf43823          	sd	a5,-48(s0)
    80001794:	fd843783          	ld	a5,-40(s0)
    80001798:	00178693          	addi	a3,a5,1
    8000179c:	fcd43c23          	sd	a3,-40(s0)
    800017a0:	00074703          	lbu	a4,0(a4)
    800017a4:	00e78023          	sb	a4,0(a5)
    800017a8:	0007c783          	lbu	a5,0(a5)
    800017ac:	f7e1                	bnez	a5,80001774 <safestrcpy+0x2c>
    ;
  *s = 0;
    800017ae:	fd843783          	ld	a5,-40(s0)
    800017b2:	00078023          	sb	zero,0(a5)
  return os;
    800017b6:	fe843783          	ld	a5,-24(s0)
}
    800017ba:	853e                	mv	a0,a5
    800017bc:	7462                	ld	s0,56(sp)
    800017be:	6121                	addi	sp,sp,64
    800017c0:	8082                	ret

00000000800017c2 <strlen>:

int
strlen(const char *s)
{
    800017c2:	7179                	addi	sp,sp,-48
    800017c4:	f422                	sd	s0,40(sp)
    800017c6:	1800                	addi	s0,sp,48
    800017c8:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800017cc:	fe042623          	sw	zero,-20(s0)
    800017d0:	a031                	j	800017dc <strlen+0x1a>
    800017d2:	fec42783          	lw	a5,-20(s0)
    800017d6:	2785                	addiw	a5,a5,1
    800017d8:	fef42623          	sw	a5,-20(s0)
    800017dc:	fec42783          	lw	a5,-20(s0)
    800017e0:	fd843703          	ld	a4,-40(s0)
    800017e4:	97ba                	add	a5,a5,a4
    800017e6:	0007c783          	lbu	a5,0(a5)
    800017ea:	f7e5                	bnez	a5,800017d2 <strlen+0x10>
    ;
  return n;
    800017ec:	fec42783          	lw	a5,-20(s0)
}
    800017f0:	853e                	mv	a0,a5
    800017f2:	7422                	ld	s0,40(sp)
    800017f4:	6145                	addi	sp,sp,48
    800017f6:	8082                	ret

00000000800017f8 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800017f8:	1141                	addi	sp,sp,-16
    800017fa:	e406                	sd	ra,8(sp)
    800017fc:	e022                	sd	s0,0(sp)
    800017fe:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    80001800:	00001097          	auipc	ra,0x1
    80001804:	f98080e7          	jalr	-104(ra) # 80002798 <cpuid>
    80001808:	87aa                	mv	a5,a0
    8000180a:	efd5                	bnez	a5,800018c6 <main+0xce>
    consoleinit();
    8000180c:	fffff097          	auipc	ra,0xfffff
    80001810:	018080e7          	jalr	24(ra) # 80000824 <consoleinit>
    printfinit();
    80001814:	fffff097          	auipc	ra,0xfffff
    80001818:	48e080e7          	jalr	1166(ra) # 80000ca2 <printfinit>
    printf("\n");
    8000181c:	0000a517          	auipc	a0,0xa
    80001820:	86450513          	addi	a0,a0,-1948 # 8000b080 <etext+0x80>
    80001824:	fffff097          	auipc	ra,0xfffff
    80001828:	1d6080e7          	jalr	470(ra) # 800009fa <printf>
    printf("xv6 kernel is booting\n");
    8000182c:	0000a517          	auipc	a0,0xa
    80001830:	85c50513          	addi	a0,a0,-1956 # 8000b088 <etext+0x88>
    80001834:	fffff097          	auipc	ra,0xfffff
    80001838:	1c6080e7          	jalr	454(ra) # 800009fa <printf>
    printf("\n");
    8000183c:	0000a517          	auipc	a0,0xa
    80001840:	84450513          	addi	a0,a0,-1980 # 8000b080 <etext+0x80>
    80001844:	fffff097          	auipc	ra,0xfffff
    80001848:	1b6080e7          	jalr	438(ra) # 800009fa <printf>
    kinit();         // physical page allocator
    8000184c:	fffff097          	auipc	ra,0xfffff
    80001850:	7a2080e7          	jalr	1954(ra) # 80000fee <kinit>
    kvminit();       // create kernel page table
    80001854:	00000097          	auipc	ra,0x0
    80001858:	1f4080e7          	jalr	500(ra) # 80001a48 <kvminit>
    kvminithart();   // turn on paging
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	212080e7          	jalr	530(ra) # 80001a6e <kvminithart>
    procinit();      // process table
    80001864:	00001097          	auipc	ra,0x1
    80001868:	e7c080e7          	jalr	-388(ra) # 800026e0 <procinit>
    trapinit();      // trap vectors
    8000186c:	00002097          	auipc	ra,0x2
    80001870:	2d2080e7          	jalr	722(ra) # 80003b3e <trapinit>
    trapinithart();  // install kernel trap vector
    80001874:	00002097          	auipc	ra,0x2
    80001878:	2f4080e7          	jalr	756(ra) # 80003b68 <trapinithart>
    plicinit();      // set up interrupt controller
    8000187c:	00007097          	auipc	ra,0x7
    80001880:	40e080e7          	jalr	1038(ra) # 80008c8a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001884:	00007097          	auipc	ra,0x7
    80001888:	42a080e7          	jalr	1066(ra) # 80008cae <plicinithart>
    binit();         // buffer cache
    8000188c:	00003097          	auipc	ra,0x3
    80001890:	f78080e7          	jalr	-136(ra) # 80004804 <binit>
    iinit();         // inode cache
    80001894:	00003097          	auipc	ra,0x3
    80001898:	7c4080e7          	jalr	1988(ra) # 80005058 <iinit>
    fileinit();      // file table
    8000189c:	00005097          	auipc	ra,0x5
    800018a0:	178080e7          	jalr	376(ra) # 80006a14 <fileinit>
    virtio_disk_init(); // emulated hard disk
    800018a4:	00007097          	auipc	ra,0x7
    800018a8:	4de080e7          	jalr	1246(ra) # 80008d82 <virtio_disk_init>
    userinit();      // first user process
    800018ac:	00001097          	auipc	ra,0x1
    800018b0:	386080e7          	jalr	902(ra) # 80002c32 <userinit>
    __sync_synchronize();
    800018b4:	0ff0000f          	fence
    started = 1;
    800018b8:	00013797          	auipc	a5,0x13
    800018bc:	9d878793          	addi	a5,a5,-1576 # 80014290 <started>
    800018c0:	4705                	li	a4,1
    800018c2:	c398                	sw	a4,0(a5)
    800018c4:	a0a9                	j	8000190e <main+0x116>
  } else {
    while(started == 0)
    800018c6:	0001                	nop
    800018c8:	00013797          	auipc	a5,0x13
    800018cc:	9c878793          	addi	a5,a5,-1592 # 80014290 <started>
    800018d0:	439c                	lw	a5,0(a5)
    800018d2:	2781                	sext.w	a5,a5
    800018d4:	dbf5                	beqz	a5,800018c8 <main+0xd0>
      ;
    __sync_synchronize();
    800018d6:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800018da:	00001097          	auipc	ra,0x1
    800018de:	ebe080e7          	jalr	-322(ra) # 80002798 <cpuid>
    800018e2:	87aa                	mv	a5,a0
    800018e4:	85be                	mv	a1,a5
    800018e6:	00009517          	auipc	a0,0x9
    800018ea:	7ba50513          	addi	a0,a0,1978 # 8000b0a0 <etext+0xa0>
    800018ee:	fffff097          	auipc	ra,0xfffff
    800018f2:	10c080e7          	jalr	268(ra) # 800009fa <printf>
    kvminithart();    // turn on paging
    800018f6:	00000097          	auipc	ra,0x0
    800018fa:	178080e7          	jalr	376(ra) # 80001a6e <kvminithart>
    trapinithart();   // install kernel trap vector
    800018fe:	00002097          	auipc	ra,0x2
    80001902:	26a080e7          	jalr	618(ra) # 80003b68 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001906:	00007097          	auipc	ra,0x7
    8000190a:	3a8080e7          	jalr	936(ra) # 80008cae <plicinithart>
  }

  scheduler();        
    8000190e:	00002097          	auipc	ra,0x2
    80001912:	9fa080e7          	jalr	-1542(ra) # 80003308 <scheduler>

0000000080001916 <w_satp>:
{
    80001916:	1101                	addi	sp,sp,-32
    80001918:	ec22                	sd	s0,24(sp)
    8000191a:	1000                	addi	s0,sp,32
    8000191c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80001920:	fe843783          	ld	a5,-24(s0)
    80001924:	18079073          	csrw	satp,a5
}
    80001928:	0001                	nop
    8000192a:	6462                	ld	s0,24(sp)
    8000192c:	6105                	addi	sp,sp,32
    8000192e:	8082                	ret

0000000080001930 <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    80001930:	1141                	addi	sp,sp,-16
    80001932:	e422                	sd	s0,8(sp)
    80001934:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001936:	12000073          	sfence.vma
}
    8000193a:	0001                	nop
    8000193c:	6422                	ld	s0,8(sp)
    8000193e:	0141                	addi	sp,sp,16
    80001940:	8082                	ret

0000000080001942 <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001942:	1101                	addi	sp,sp,-32
    80001944:	ec06                	sd	ra,24(sp)
    80001946:	e822                	sd	s0,16(sp)
    80001948:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    8000194a:	fffff097          	auipc	ra,0xfffff
    8000194e:	7e0080e7          	jalr	2016(ra) # 8000112a <kalloc>
    80001952:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001956:	6605                	lui	a2,0x1
    80001958:	4581                	li	a1,0
    8000195a:	fe843503          	ld	a0,-24(s0)
    8000195e:	00000097          	auipc	ra,0x0
    80001962:	af4080e7          	jalr	-1292(ra) # 80001452 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001966:	4719                	li	a4,6
    80001968:	6685                	lui	a3,0x1
    8000196a:	10000637          	lui	a2,0x10000
    8000196e:	100005b7          	lui	a1,0x10000
    80001972:	fe843503          	ld	a0,-24(s0)
    80001976:	00000097          	auipc	ra,0x0
    8000197a:	298080e7          	jalr	664(ra) # 80001c0e <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    8000197e:	4719                	li	a4,6
    80001980:	6685                	lui	a3,0x1
    80001982:	10001637          	lui	a2,0x10001
    80001986:	100015b7          	lui	a1,0x10001
    8000198a:	fe843503          	ld	a0,-24(s0)
    8000198e:	00000097          	auipc	ra,0x0
    80001992:	280080e7          	jalr	640(ra) # 80001c0e <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001996:	4719                	li	a4,6
    80001998:	004006b7          	lui	a3,0x400
    8000199c:	0c000637          	lui	a2,0xc000
    800019a0:	0c0005b7          	lui	a1,0xc000
    800019a4:	fe843503          	ld	a0,-24(s0)
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	266080e7          	jalr	614(ra) # 80001c0e <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    800019b0:	00009717          	auipc	a4,0x9
    800019b4:	65070713          	addi	a4,a4,1616 # 8000b000 <etext>
    800019b8:	800007b7          	lui	a5,0x80000
    800019bc:	97ba                	add	a5,a5,a4
    800019be:	4729                	li	a4,10
    800019c0:	86be                	mv	a3,a5
    800019c2:	4785                	li	a5,1
    800019c4:	01f79613          	slli	a2,a5,0x1f
    800019c8:	4785                	li	a5,1
    800019ca:	01f79593          	slli	a1,a5,0x1f
    800019ce:	fe843503          	ld	a0,-24(s0)
    800019d2:	00000097          	auipc	ra,0x0
    800019d6:	23c080e7          	jalr	572(ra) # 80001c0e <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    800019da:	00009597          	auipc	a1,0x9
    800019de:	62658593          	addi	a1,a1,1574 # 8000b000 <etext>
    800019e2:	00009617          	auipc	a2,0x9
    800019e6:	61e60613          	addi	a2,a2,1566 # 8000b000 <etext>
    800019ea:	00009797          	auipc	a5,0x9
    800019ee:	61678793          	addi	a5,a5,1558 # 8000b000 <etext>
    800019f2:	4745                	li	a4,17
    800019f4:	076e                	slli	a4,a4,0x1b
    800019f6:	40f707b3          	sub	a5,a4,a5
    800019fa:	4719                	li	a4,6
    800019fc:	86be                	mv	a3,a5
    800019fe:	fe843503          	ld	a0,-24(s0)
    80001a02:	00000097          	auipc	ra,0x0
    80001a06:	20c080e7          	jalr	524(ra) # 80001c0e <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001a0a:	00008797          	auipc	a5,0x8
    80001a0e:	5f678793          	addi	a5,a5,1526 # 8000a000 <_trampoline>
    80001a12:	4729                	li	a4,10
    80001a14:	6685                	lui	a3,0x1
    80001a16:	863e                	mv	a2,a5
    80001a18:	040007b7          	lui	a5,0x4000
    80001a1c:	17fd                	addi	a5,a5,-1
    80001a1e:	00c79593          	slli	a1,a5,0xc
    80001a22:	fe843503          	ld	a0,-24(s0)
    80001a26:	00000097          	auipc	ra,0x0
    80001a2a:	1e8080e7          	jalr	488(ra) # 80001c0e <kvmmap>

  // map kernel stacks
  proc_mapstacks(kpgtbl);
    80001a2e:	fe843503          	ld	a0,-24(s0)
    80001a32:	00001097          	auipc	ra,0x1
    80001a36:	bee080e7          	jalr	-1042(ra) # 80002620 <proc_mapstacks>
  
  return kpgtbl;
    80001a3a:	fe843783          	ld	a5,-24(s0)
}
    80001a3e:	853e                	mv	a0,a5
    80001a40:	60e2                	ld	ra,24(sp)
    80001a42:	6442                	ld	s0,16(sp)
    80001a44:	6105                	addi	sp,sp,32
    80001a46:	8082                	ret

0000000080001a48 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001a48:	1141                	addi	sp,sp,-16
    80001a4a:	e406                	sd	ra,8(sp)
    80001a4c:	e022                	sd	s0,0(sp)
    80001a4e:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	ef2080e7          	jalr	-270(ra) # 80001942 <kvmmake>
    80001a58:	872a                	mv	a4,a0
    80001a5a:	0000a797          	auipc	a5,0xa
    80001a5e:	5b678793          	addi	a5,a5,1462 # 8000c010 <kernel_pagetable>
    80001a62:	e398                	sd	a4,0(a5)
}
    80001a64:	0001                	nop
    80001a66:	60a2                	ld	ra,8(sp)
    80001a68:	6402                	ld	s0,0(sp)
    80001a6a:	0141                	addi	sp,sp,16
    80001a6c:	8082                	ret

0000000080001a6e <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001a6e:	1141                	addi	sp,sp,-16
    80001a70:	e406                	sd	ra,8(sp)
    80001a72:	e022                	sd	s0,0(sp)
    80001a74:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80001a76:	0000a797          	auipc	a5,0xa
    80001a7a:	59a78793          	addi	a5,a5,1434 # 8000c010 <kernel_pagetable>
    80001a7e:	639c                	ld	a5,0(a5)
    80001a80:	00c7d713          	srli	a4,a5,0xc
    80001a84:	57fd                	li	a5,-1
    80001a86:	17fe                	slli	a5,a5,0x3f
    80001a88:	8fd9                	or	a5,a5,a4
    80001a8a:	853e                	mv	a0,a5
    80001a8c:	00000097          	auipc	ra,0x0
    80001a90:	e8a080e7          	jalr	-374(ra) # 80001916 <w_satp>
  sfence_vma();
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	e9c080e7          	jalr	-356(ra) # 80001930 <sfence_vma>
}
    80001a9c:	0001                	nop
    80001a9e:	60a2                	ld	ra,8(sp)
    80001aa0:	6402                	ld	s0,0(sp)
    80001aa2:	0141                	addi	sp,sp,16
    80001aa4:	8082                	ret

0000000080001aa6 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001aa6:	7139                	addi	sp,sp,-64
    80001aa8:	fc06                	sd	ra,56(sp)
    80001aaa:	f822                	sd	s0,48(sp)
    80001aac:	0080                	addi	s0,sp,64
    80001aae:	fca43c23          	sd	a0,-40(s0)
    80001ab2:	fcb43823          	sd	a1,-48(s0)
    80001ab6:	87b2                	mv	a5,a2
    80001ab8:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001abc:	fd043703          	ld	a4,-48(s0)
    80001ac0:	57fd                	li	a5,-1
    80001ac2:	83e9                	srli	a5,a5,0x1a
    80001ac4:	00e7fa63          	bgeu	a5,a4,80001ad8 <walk+0x32>
    panic("walk");
    80001ac8:	00009517          	auipc	a0,0x9
    80001acc:	5f050513          	addi	a0,a0,1520 # 8000b0b8 <etext+0xb8>
    80001ad0:	fffff097          	auipc	ra,0xfffff
    80001ad4:	180080e7          	jalr	384(ra) # 80000c50 <panic>

  for(int level = 2; level > 0; level--) {
    80001ad8:	4789                	li	a5,2
    80001ada:	fef42623          	sw	a5,-20(s0)
    80001ade:	a849                	j	80001b70 <walk+0xca>
    pte_t *pte = &pagetable[PX(level, va)];
    80001ae0:	fec42703          	lw	a4,-20(s0)
    80001ae4:	87ba                	mv	a5,a4
    80001ae6:	0037979b          	slliw	a5,a5,0x3
    80001aea:	9fb9                	addw	a5,a5,a4
    80001aec:	2781                	sext.w	a5,a5
    80001aee:	27b1                	addiw	a5,a5,12
    80001af0:	2781                	sext.w	a5,a5
    80001af2:	873e                	mv	a4,a5
    80001af4:	fd043783          	ld	a5,-48(s0)
    80001af8:	00e7d7b3          	srl	a5,a5,a4
    80001afc:	1ff7f793          	andi	a5,a5,511
    80001b00:	078e                	slli	a5,a5,0x3
    80001b02:	fd843703          	ld	a4,-40(s0)
    80001b06:	97ba                	add	a5,a5,a4
    80001b08:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001b0c:	fe043783          	ld	a5,-32(s0)
    80001b10:	639c                	ld	a5,0(a5)
    80001b12:	8b85                	andi	a5,a5,1
    80001b14:	cb89                	beqz	a5,80001b26 <walk+0x80>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001b16:	fe043783          	ld	a5,-32(s0)
    80001b1a:	639c                	ld	a5,0(a5)
    80001b1c:	83a9                	srli	a5,a5,0xa
    80001b1e:	07b2                	slli	a5,a5,0xc
    80001b20:	fcf43c23          	sd	a5,-40(s0)
    80001b24:	a089                	j	80001b66 <walk+0xc0>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001b26:	fcc42783          	lw	a5,-52(s0)
    80001b2a:	2781                	sext.w	a5,a5
    80001b2c:	cb91                	beqz	a5,80001b40 <walk+0x9a>
    80001b2e:	fffff097          	auipc	ra,0xfffff
    80001b32:	5fc080e7          	jalr	1532(ra) # 8000112a <kalloc>
    80001b36:	fca43c23          	sd	a0,-40(s0)
    80001b3a:	fd843783          	ld	a5,-40(s0)
    80001b3e:	e399                	bnez	a5,80001b44 <walk+0x9e>
        return 0;
    80001b40:	4781                	li	a5,0
    80001b42:	a0a9                	j	80001b8c <walk+0xe6>
      memset(pagetable, 0, PGSIZE);
    80001b44:	6605                	lui	a2,0x1
    80001b46:	4581                	li	a1,0
    80001b48:	fd843503          	ld	a0,-40(s0)
    80001b4c:	00000097          	auipc	ra,0x0
    80001b50:	906080e7          	jalr	-1786(ra) # 80001452 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001b54:	fd843783          	ld	a5,-40(s0)
    80001b58:	83b1                	srli	a5,a5,0xc
    80001b5a:	07aa                	slli	a5,a5,0xa
    80001b5c:	0017e713          	ori	a4,a5,1
    80001b60:	fe043783          	ld	a5,-32(s0)
    80001b64:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001b66:	fec42783          	lw	a5,-20(s0)
    80001b6a:	37fd                	addiw	a5,a5,-1
    80001b6c:	fef42623          	sw	a5,-20(s0)
    80001b70:	fec42783          	lw	a5,-20(s0)
    80001b74:	2781                	sext.w	a5,a5
    80001b76:	f6f045e3          	bgtz	a5,80001ae0 <walk+0x3a>
    }
  }
  return &pagetable[PX(0, va)];
    80001b7a:	fd043783          	ld	a5,-48(s0)
    80001b7e:	83b1                	srli	a5,a5,0xc
    80001b80:	1ff7f793          	andi	a5,a5,511
    80001b84:	078e                	slli	a5,a5,0x3
    80001b86:	fd843703          	ld	a4,-40(s0)
    80001b8a:	97ba                	add	a5,a5,a4
}
    80001b8c:	853e                	mv	a0,a5
    80001b8e:	70e2                	ld	ra,56(sp)
    80001b90:	7442                	ld	s0,48(sp)
    80001b92:	6121                	addi	sp,sp,64
    80001b94:	8082                	ret

0000000080001b96 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001b96:	7179                	addi	sp,sp,-48
    80001b98:	f406                	sd	ra,40(sp)
    80001b9a:	f022                	sd	s0,32(sp)
    80001b9c:	1800                	addi	s0,sp,48
    80001b9e:	fca43c23          	sd	a0,-40(s0)
    80001ba2:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001ba6:	fd043703          	ld	a4,-48(s0)
    80001baa:	57fd                	li	a5,-1
    80001bac:	83e9                	srli	a5,a5,0x1a
    80001bae:	00e7f463          	bgeu	a5,a4,80001bb6 <walkaddr+0x20>
    return 0;
    80001bb2:	4781                	li	a5,0
    80001bb4:	a881                	j	80001c04 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001bb6:	4601                	li	a2,0
    80001bb8:	fd043583          	ld	a1,-48(s0)
    80001bbc:	fd843503          	ld	a0,-40(s0)
    80001bc0:	00000097          	auipc	ra,0x0
    80001bc4:	ee6080e7          	jalr	-282(ra) # 80001aa6 <walk>
    80001bc8:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001bcc:	fe843783          	ld	a5,-24(s0)
    80001bd0:	e399                	bnez	a5,80001bd6 <walkaddr+0x40>
    return 0;
    80001bd2:	4781                	li	a5,0
    80001bd4:	a805                	j	80001c04 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001bd6:	fe843783          	ld	a5,-24(s0)
    80001bda:	639c                	ld	a5,0(a5)
    80001bdc:	8b85                	andi	a5,a5,1
    80001bde:	e399                	bnez	a5,80001be4 <walkaddr+0x4e>
    return 0;
    80001be0:	4781                	li	a5,0
    80001be2:	a00d                	j	80001c04 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001be4:	fe843783          	ld	a5,-24(s0)
    80001be8:	639c                	ld	a5,0(a5)
    80001bea:	8bc1                	andi	a5,a5,16
    80001bec:	e399                	bnez	a5,80001bf2 <walkaddr+0x5c>
    return 0;
    80001bee:	4781                	li	a5,0
    80001bf0:	a811                	j	80001c04 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001bf2:	fe843783          	ld	a5,-24(s0)
    80001bf6:	639c                	ld	a5,0(a5)
    80001bf8:	83a9                	srli	a5,a5,0xa
    80001bfa:	07b2                	slli	a5,a5,0xc
    80001bfc:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001c00:	fe043783          	ld	a5,-32(s0)
}
    80001c04:	853e                	mv	a0,a5
    80001c06:	70a2                	ld	ra,40(sp)
    80001c08:	7402                	ld	s0,32(sp)
    80001c0a:	6145                	addi	sp,sp,48
    80001c0c:	8082                	ret

0000000080001c0e <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001c0e:	7139                	addi	sp,sp,-64
    80001c10:	fc06                	sd	ra,56(sp)
    80001c12:	f822                	sd	s0,48(sp)
    80001c14:	0080                	addi	s0,sp,64
    80001c16:	fea43423          	sd	a0,-24(s0)
    80001c1a:	feb43023          	sd	a1,-32(s0)
    80001c1e:	fcc43c23          	sd	a2,-40(s0)
    80001c22:	fcd43823          	sd	a3,-48(s0)
    80001c26:	87ba                	mv	a5,a4
    80001c28:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001c2c:	fcc42783          	lw	a5,-52(s0)
    80001c30:	873e                	mv	a4,a5
    80001c32:	fd843683          	ld	a3,-40(s0)
    80001c36:	fd043603          	ld	a2,-48(s0)
    80001c3a:	fe043583          	ld	a1,-32(s0)
    80001c3e:	fe843503          	ld	a0,-24(s0)
    80001c42:	00000097          	auipc	ra,0x0
    80001c46:	026080e7          	jalr	38(ra) # 80001c68 <mappages>
    80001c4a:	87aa                	mv	a5,a0
    80001c4c:	cb89                	beqz	a5,80001c5e <kvmmap+0x50>
    panic("kvmmap");
    80001c4e:	00009517          	auipc	a0,0x9
    80001c52:	47250513          	addi	a0,a0,1138 # 8000b0c0 <etext+0xc0>
    80001c56:	fffff097          	auipc	ra,0xfffff
    80001c5a:	ffa080e7          	jalr	-6(ra) # 80000c50 <panic>
}
    80001c5e:	0001                	nop
    80001c60:	70e2                	ld	ra,56(sp)
    80001c62:	7442                	ld	s0,48(sp)
    80001c64:	6121                	addi	sp,sp,64
    80001c66:	8082                	ret

0000000080001c68 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001c68:	711d                	addi	sp,sp,-96
    80001c6a:	ec86                	sd	ra,88(sp)
    80001c6c:	e8a2                	sd	s0,80(sp)
    80001c6e:	1080                	addi	s0,sp,96
    80001c70:	fca43423          	sd	a0,-56(s0)
    80001c74:	fcb43023          	sd	a1,-64(s0)
    80001c78:	fac43c23          	sd	a2,-72(s0)
    80001c7c:	fad43823          	sd	a3,-80(s0)
    80001c80:	87ba                	mv	a5,a4
    80001c82:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
    80001c86:	fc043703          	ld	a4,-64(s0)
    80001c8a:	77fd                	lui	a5,0xfffff
    80001c8c:	8ff9                	and	a5,a5,a4
    80001c8e:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001c92:	fc043703          	ld	a4,-64(s0)
    80001c96:	fb843783          	ld	a5,-72(s0)
    80001c9a:	97ba                	add	a5,a5,a4
    80001c9c:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ff8cfff>
    80001ca0:	77fd                	lui	a5,0xfffff
    80001ca2:	8ff9                	and	a5,a5,a4
    80001ca4:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001ca8:	4605                	li	a2,1
    80001caa:	fe843583          	ld	a1,-24(s0)
    80001cae:	fc843503          	ld	a0,-56(s0)
    80001cb2:	00000097          	auipc	ra,0x0
    80001cb6:	df4080e7          	jalr	-524(ra) # 80001aa6 <walk>
    80001cba:	fca43c23          	sd	a0,-40(s0)
    80001cbe:	fd843783          	ld	a5,-40(s0)
    80001cc2:	e399                	bnez	a5,80001cc8 <mappages+0x60>
      return -1;
    80001cc4:	57fd                	li	a5,-1
    80001cc6:	a085                	j	80001d26 <mappages+0xbe>
    if(*pte & PTE_V)
    80001cc8:	fd843783          	ld	a5,-40(s0)
    80001ccc:	639c                	ld	a5,0(a5)
    80001cce:	8b85                	andi	a5,a5,1
    80001cd0:	cb89                	beqz	a5,80001ce2 <mappages+0x7a>
      panic("remap");
    80001cd2:	00009517          	auipc	a0,0x9
    80001cd6:	3f650513          	addi	a0,a0,1014 # 8000b0c8 <etext+0xc8>
    80001cda:	fffff097          	auipc	ra,0xfffff
    80001cde:	f76080e7          	jalr	-138(ra) # 80000c50 <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001ce2:	fb043783          	ld	a5,-80(s0)
    80001ce6:	83b1                	srli	a5,a5,0xc
    80001ce8:	00a79713          	slli	a4,a5,0xa
    80001cec:	fac42783          	lw	a5,-84(s0)
    80001cf0:	8fd9                	or	a5,a5,a4
    80001cf2:	0017e713          	ori	a4,a5,1
    80001cf6:	fd843783          	ld	a5,-40(s0)
    80001cfa:	e398                	sd	a4,0(a5)
    if(a == last)
    80001cfc:	fe843703          	ld	a4,-24(s0)
    80001d00:	fe043783          	ld	a5,-32(s0)
    80001d04:	00f70f63          	beq	a4,a5,80001d22 <mappages+0xba>
      break;
    a += PGSIZE;
    80001d08:	fe843703          	ld	a4,-24(s0)
    80001d0c:	6785                	lui	a5,0x1
    80001d0e:	97ba                	add	a5,a5,a4
    80001d10:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001d14:	fb043703          	ld	a4,-80(s0)
    80001d18:	6785                	lui	a5,0x1
    80001d1a:	97ba                	add	a5,a5,a4
    80001d1c:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001d20:	b761                	j	80001ca8 <mappages+0x40>
      break;
    80001d22:	0001                	nop
  }
  return 0;
    80001d24:	4781                	li	a5,0
}
    80001d26:	853e                	mv	a0,a5
    80001d28:	60e6                	ld	ra,88(sp)
    80001d2a:	6446                	ld	s0,80(sp)
    80001d2c:	6125                	addi	sp,sp,96
    80001d2e:	8082                	ret

0000000080001d30 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001d30:	715d                	addi	sp,sp,-80
    80001d32:	e486                	sd	ra,72(sp)
    80001d34:	e0a2                	sd	s0,64(sp)
    80001d36:	0880                	addi	s0,sp,80
    80001d38:	fca43423          	sd	a0,-56(s0)
    80001d3c:	fcb43023          	sd	a1,-64(s0)
    80001d40:	fac43c23          	sd	a2,-72(s0)
    80001d44:	87b6                	mv	a5,a3
    80001d46:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001d4a:	fc043703          	ld	a4,-64(s0)
    80001d4e:	6785                	lui	a5,0x1
    80001d50:	17fd                	addi	a5,a5,-1
    80001d52:	8ff9                	and	a5,a5,a4
    80001d54:	cb89                	beqz	a5,80001d66 <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001d56:	00009517          	auipc	a0,0x9
    80001d5a:	37a50513          	addi	a0,a0,890 # 8000b0d0 <etext+0xd0>
    80001d5e:	fffff097          	auipc	ra,0xfffff
    80001d62:	ef2080e7          	jalr	-270(ra) # 80000c50 <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001d66:	fc043783          	ld	a5,-64(s0)
    80001d6a:	fef43423          	sd	a5,-24(s0)
    80001d6e:	a045                	j	80001e0e <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001d70:	4601                	li	a2,0
    80001d72:	fe843583          	ld	a1,-24(s0)
    80001d76:	fc843503          	ld	a0,-56(s0)
    80001d7a:	00000097          	auipc	ra,0x0
    80001d7e:	d2c080e7          	jalr	-724(ra) # 80001aa6 <walk>
    80001d82:	fea43023          	sd	a0,-32(s0)
    80001d86:	fe043783          	ld	a5,-32(s0)
    80001d8a:	eb89                	bnez	a5,80001d9c <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001d8c:	00009517          	auipc	a0,0x9
    80001d90:	35c50513          	addi	a0,a0,860 # 8000b0e8 <etext+0xe8>
    80001d94:	fffff097          	auipc	ra,0xfffff
    80001d98:	ebc080e7          	jalr	-324(ra) # 80000c50 <panic>
    if((*pte & PTE_V) == 0)
    80001d9c:	fe043783          	ld	a5,-32(s0)
    80001da0:	639c                	ld	a5,0(a5)
    80001da2:	8b85                	andi	a5,a5,1
    80001da4:	eb89                	bnez	a5,80001db6 <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001da6:	00009517          	auipc	a0,0x9
    80001daa:	35250513          	addi	a0,a0,850 # 8000b0f8 <etext+0xf8>
    80001dae:	fffff097          	auipc	ra,0xfffff
    80001db2:	ea2080e7          	jalr	-350(ra) # 80000c50 <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001db6:	fe043783          	ld	a5,-32(s0)
    80001dba:	639c                	ld	a5,0(a5)
    80001dbc:	3ff7f713          	andi	a4,a5,1023
    80001dc0:	4785                	li	a5,1
    80001dc2:	00f71a63          	bne	a4,a5,80001dd6 <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001dc6:	00009517          	auipc	a0,0x9
    80001dca:	34a50513          	addi	a0,a0,842 # 8000b110 <etext+0x110>
    80001dce:	fffff097          	auipc	ra,0xfffff
    80001dd2:	e82080e7          	jalr	-382(ra) # 80000c50 <panic>
    if(do_free){
    80001dd6:	fb442783          	lw	a5,-76(s0)
    80001dda:	2781                	sext.w	a5,a5
    80001ddc:	cf99                	beqz	a5,80001dfa <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    80001dde:	fe043783          	ld	a5,-32(s0)
    80001de2:	639c                	ld	a5,0(a5)
    80001de4:	83a9                	srli	a5,a5,0xa
    80001de6:	07b2                	slli	a5,a5,0xc
    80001de8:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001dec:	fd843783          	ld	a5,-40(s0)
    80001df0:	853e                	mv	a0,a5
    80001df2:	fffff097          	auipc	ra,0xfffff
    80001df6:	294080e7          	jalr	660(ra) # 80001086 <kfree>
    }
    *pte = 0;
    80001dfa:	fe043783          	ld	a5,-32(s0)
    80001dfe:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e02:	fe843703          	ld	a4,-24(s0)
    80001e06:	6785                	lui	a5,0x1
    80001e08:	97ba                	add	a5,a5,a4
    80001e0a:	fef43423          	sd	a5,-24(s0)
    80001e0e:	fb843783          	ld	a5,-72(s0)
    80001e12:	00c79713          	slli	a4,a5,0xc
    80001e16:	fc043783          	ld	a5,-64(s0)
    80001e1a:	97ba                	add	a5,a5,a4
    80001e1c:	fe843703          	ld	a4,-24(s0)
    80001e20:	f4f768e3          	bltu	a4,a5,80001d70 <uvmunmap+0x40>
  }
}
    80001e24:	0001                	nop
    80001e26:	0001                	nop
    80001e28:	60a6                	ld	ra,72(sp)
    80001e2a:	6406                	ld	s0,64(sp)
    80001e2c:	6161                	addi	sp,sp,80
    80001e2e:	8082                	ret

0000000080001e30 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001e30:	1101                	addi	sp,sp,-32
    80001e32:	ec06                	sd	ra,24(sp)
    80001e34:	e822                	sd	s0,16(sp)
    80001e36:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001e38:	fffff097          	auipc	ra,0xfffff
    80001e3c:	2f2080e7          	jalr	754(ra) # 8000112a <kalloc>
    80001e40:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001e44:	fe843783          	ld	a5,-24(s0)
    80001e48:	e399                	bnez	a5,80001e4e <uvmcreate+0x1e>
    return 0;
    80001e4a:	4781                	li	a5,0
    80001e4c:	a819                	j	80001e62 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001e4e:	6605                	lui	a2,0x1
    80001e50:	4581                	li	a1,0
    80001e52:	fe843503          	ld	a0,-24(s0)
    80001e56:	fffff097          	auipc	ra,0xfffff
    80001e5a:	5fc080e7          	jalr	1532(ra) # 80001452 <memset>
  return pagetable;
    80001e5e:	fe843783          	ld	a5,-24(s0)
}
    80001e62:	853e                	mv	a0,a5
    80001e64:	60e2                	ld	ra,24(sp)
    80001e66:	6442                	ld	s0,16(sp)
    80001e68:	6105                	addi	sp,sp,32
    80001e6a:	8082                	ret

0000000080001e6c <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, uchar *src, uint sz)
{
    80001e6c:	7139                	addi	sp,sp,-64
    80001e6e:	fc06                	sd	ra,56(sp)
    80001e70:	f822                	sd	s0,48(sp)
    80001e72:	0080                	addi	s0,sp,64
    80001e74:	fca43c23          	sd	a0,-40(s0)
    80001e78:	fcb43823          	sd	a1,-48(s0)
    80001e7c:	87b2                	mv	a5,a2
    80001e7e:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80001e82:	fcc42783          	lw	a5,-52(s0)
    80001e86:	0007871b          	sext.w	a4,a5
    80001e8a:	6785                	lui	a5,0x1
    80001e8c:	00f76a63          	bltu	a4,a5,80001ea0 <uvminit+0x34>
    panic("inituvm: more than a page");
    80001e90:	00009517          	auipc	a0,0x9
    80001e94:	29850513          	addi	a0,a0,664 # 8000b128 <etext+0x128>
    80001e98:	fffff097          	auipc	ra,0xfffff
    80001e9c:	db8080e7          	jalr	-584(ra) # 80000c50 <panic>
  mem = kalloc();
    80001ea0:	fffff097          	auipc	ra,0xfffff
    80001ea4:	28a080e7          	jalr	650(ra) # 8000112a <kalloc>
    80001ea8:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80001eac:	6605                	lui	a2,0x1
    80001eae:	4581                	li	a1,0
    80001eb0:	fe843503          	ld	a0,-24(s0)
    80001eb4:	fffff097          	auipc	ra,0xfffff
    80001eb8:	59e080e7          	jalr	1438(ra) # 80001452 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80001ebc:	fe843783          	ld	a5,-24(s0)
    80001ec0:	4779                	li	a4,30
    80001ec2:	86be                	mv	a3,a5
    80001ec4:	6605                	lui	a2,0x1
    80001ec6:	4581                	li	a1,0
    80001ec8:	fd843503          	ld	a0,-40(s0)
    80001ecc:	00000097          	auipc	ra,0x0
    80001ed0:	d9c080e7          	jalr	-612(ra) # 80001c68 <mappages>
  memmove(mem, src, sz);
    80001ed4:	fcc42783          	lw	a5,-52(s0)
    80001ed8:	863e                	mv	a2,a5
    80001eda:	fd043583          	ld	a1,-48(s0)
    80001ede:	fe843503          	ld	a0,-24(s0)
    80001ee2:	fffff097          	auipc	ra,0xfffff
    80001ee6:	654080e7          	jalr	1620(ra) # 80001536 <memmove>
}
    80001eea:	0001                	nop
    80001eec:	70e2                	ld	ra,56(sp)
    80001eee:	7442                	ld	s0,48(sp)
    80001ef0:	6121                	addi	sp,sp,64
    80001ef2:	8082                	ret

0000000080001ef4 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001ef4:	7139                	addi	sp,sp,-64
    80001ef6:	fc06                	sd	ra,56(sp)
    80001ef8:	f822                	sd	s0,48(sp)
    80001efa:	0080                	addi	s0,sp,64
    80001efc:	fca43c23          	sd	a0,-40(s0)
    80001f00:	fcb43823          	sd	a1,-48(s0)
    80001f04:	fcc43423          	sd	a2,-56(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80001f08:	fc843703          	ld	a4,-56(s0)
    80001f0c:	fd043783          	ld	a5,-48(s0)
    80001f10:	00f77563          	bgeu	a4,a5,80001f1a <uvmalloc+0x26>
    return oldsz;
    80001f14:	fd043783          	ld	a5,-48(s0)
    80001f18:	a85d                	j	80001fce <uvmalloc+0xda>

  oldsz = PGROUNDUP(oldsz);
    80001f1a:	fd043703          	ld	a4,-48(s0)
    80001f1e:	6785                	lui	a5,0x1
    80001f20:	17fd                	addi	a5,a5,-1
    80001f22:	973e                	add	a4,a4,a5
    80001f24:	77fd                	lui	a5,0xfffff
    80001f26:	8ff9                	and	a5,a5,a4
    80001f28:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001f2c:	fd043783          	ld	a5,-48(s0)
    80001f30:	fef43423          	sd	a5,-24(s0)
    80001f34:	a069                	j	80001fbe <uvmalloc+0xca>
    mem = kalloc();
    80001f36:	fffff097          	auipc	ra,0xfffff
    80001f3a:	1f4080e7          	jalr	500(ra) # 8000112a <kalloc>
    80001f3e:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80001f42:	fe043783          	ld	a5,-32(s0)
    80001f46:	ef89                	bnez	a5,80001f60 <uvmalloc+0x6c>
      uvmdealloc(pagetable, a, oldsz);
    80001f48:	fd043603          	ld	a2,-48(s0)
    80001f4c:	fe843583          	ld	a1,-24(s0)
    80001f50:	fd843503          	ld	a0,-40(s0)
    80001f54:	00000097          	auipc	ra,0x0
    80001f58:	084080e7          	jalr	132(ra) # 80001fd8 <uvmdealloc>
      return 0;
    80001f5c:	4781                	li	a5,0
    80001f5e:	a885                	j	80001fce <uvmalloc+0xda>
    }
    memset(mem, 0, PGSIZE);
    80001f60:	6605                	lui	a2,0x1
    80001f62:	4581                	li	a1,0
    80001f64:	fe043503          	ld	a0,-32(s0)
    80001f68:	fffff097          	auipc	ra,0xfffff
    80001f6c:	4ea080e7          	jalr	1258(ra) # 80001452 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0){
    80001f70:	fe043783          	ld	a5,-32(s0)
    80001f74:	4779                	li	a4,30
    80001f76:	86be                	mv	a3,a5
    80001f78:	6605                	lui	a2,0x1
    80001f7a:	fe843583          	ld	a1,-24(s0)
    80001f7e:	fd843503          	ld	a0,-40(s0)
    80001f82:	00000097          	auipc	ra,0x0
    80001f86:	ce6080e7          	jalr	-794(ra) # 80001c68 <mappages>
    80001f8a:	87aa                	mv	a5,a0
    80001f8c:	c39d                	beqz	a5,80001fb2 <uvmalloc+0xbe>
      kfree(mem);
    80001f8e:	fe043503          	ld	a0,-32(s0)
    80001f92:	fffff097          	auipc	ra,0xfffff
    80001f96:	0f4080e7          	jalr	244(ra) # 80001086 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80001f9a:	fd043603          	ld	a2,-48(s0)
    80001f9e:	fe843583          	ld	a1,-24(s0)
    80001fa2:	fd843503          	ld	a0,-40(s0)
    80001fa6:	00000097          	auipc	ra,0x0
    80001faa:	032080e7          	jalr	50(ra) # 80001fd8 <uvmdealloc>
      return 0;
    80001fae:	4781                	li	a5,0
    80001fb0:	a839                	j	80001fce <uvmalloc+0xda>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001fb2:	fe843703          	ld	a4,-24(s0)
    80001fb6:	6785                	lui	a5,0x1
    80001fb8:	97ba                	add	a5,a5,a4
    80001fba:	fef43423          	sd	a5,-24(s0)
    80001fbe:	fe843703          	ld	a4,-24(s0)
    80001fc2:	fc843783          	ld	a5,-56(s0)
    80001fc6:	f6f768e3          	bltu	a4,a5,80001f36 <uvmalloc+0x42>
    }
  }
  return newsz;
    80001fca:	fc843783          	ld	a5,-56(s0)
}
    80001fce:	853e                	mv	a0,a5
    80001fd0:	70e2                	ld	ra,56(sp)
    80001fd2:	7442                	ld	s0,48(sp)
    80001fd4:	6121                	addi	sp,sp,64
    80001fd6:	8082                	ret

0000000080001fd8 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001fd8:	7139                	addi	sp,sp,-64
    80001fda:	fc06                	sd	ra,56(sp)
    80001fdc:	f822                	sd	s0,48(sp)
    80001fde:	0080                	addi	s0,sp,64
    80001fe0:	fca43c23          	sd	a0,-40(s0)
    80001fe4:	fcb43823          	sd	a1,-48(s0)
    80001fe8:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80001fec:	fc843703          	ld	a4,-56(s0)
    80001ff0:	fd043783          	ld	a5,-48(s0)
    80001ff4:	00f76563          	bltu	a4,a5,80001ffe <uvmdealloc+0x26>
    return oldsz;
    80001ff8:	fd043783          	ld	a5,-48(s0)
    80001ffc:	a885                	j	8000206c <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80001ffe:	fc843703          	ld	a4,-56(s0)
    80002002:	6785                	lui	a5,0x1
    80002004:	17fd                	addi	a5,a5,-1
    80002006:	973e                	add	a4,a4,a5
    80002008:	77fd                	lui	a5,0xfffff
    8000200a:	8f7d                	and	a4,a4,a5
    8000200c:	fd043683          	ld	a3,-48(s0)
    80002010:	6785                	lui	a5,0x1
    80002012:	17fd                	addi	a5,a5,-1
    80002014:	96be                	add	a3,a3,a5
    80002016:	77fd                	lui	a5,0xfffff
    80002018:	8ff5                	and	a5,a5,a3
    8000201a:	04f77763          	bgeu	a4,a5,80002068 <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    8000201e:	fd043703          	ld	a4,-48(s0)
    80002022:	6785                	lui	a5,0x1
    80002024:	17fd                	addi	a5,a5,-1
    80002026:	973e                	add	a4,a4,a5
    80002028:	77fd                	lui	a5,0xfffff
    8000202a:	8f7d                	and	a4,a4,a5
    8000202c:	fc843683          	ld	a3,-56(s0)
    80002030:	6785                	lui	a5,0x1
    80002032:	17fd                	addi	a5,a5,-1
    80002034:	96be                	add	a3,a3,a5
    80002036:	77fd                	lui	a5,0xfffff
    80002038:	8ff5                	and	a5,a5,a3
    8000203a:	40f707b3          	sub	a5,a4,a5
    8000203e:	83b1                	srli	a5,a5,0xc
    80002040:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002044:	fc843703          	ld	a4,-56(s0)
    80002048:	6785                	lui	a5,0x1
    8000204a:	17fd                	addi	a5,a5,-1
    8000204c:	973e                	add	a4,a4,a5
    8000204e:	77fd                	lui	a5,0xfffff
    80002050:	8ff9                	and	a5,a5,a4
    80002052:	fec42703          	lw	a4,-20(s0)
    80002056:	4685                	li	a3,1
    80002058:	863a                	mv	a2,a4
    8000205a:	85be                	mv	a1,a5
    8000205c:	fd843503          	ld	a0,-40(s0)
    80002060:	00000097          	auipc	ra,0x0
    80002064:	cd0080e7          	jalr	-816(ra) # 80001d30 <uvmunmap>
  }

  return newsz;
    80002068:	fc843783          	ld	a5,-56(s0)
}
    8000206c:	853e                	mv	a0,a5
    8000206e:	70e2                	ld	ra,56(sp)
    80002070:	7442                	ld	s0,48(sp)
    80002072:	6121                	addi	sp,sp,64
    80002074:	8082                	ret

0000000080002076 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    80002076:	7139                	addi	sp,sp,-64
    80002078:	fc06                	sd	ra,56(sp)
    8000207a:	f822                	sd	s0,48(sp)
    8000207c:	0080                	addi	s0,sp,64
    8000207e:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002082:	fe042623          	sw	zero,-20(s0)
    80002086:	a88d                	j	800020f8 <freewalk+0x82>
    pte_t pte = pagetable[i];
    80002088:	fec42783          	lw	a5,-20(s0)
    8000208c:	078e                	slli	a5,a5,0x3
    8000208e:	fc843703          	ld	a4,-56(s0)
    80002092:	97ba                	add	a5,a5,a4
    80002094:	639c                	ld	a5,0(a5)
    80002096:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000209a:	fe043783          	ld	a5,-32(s0)
    8000209e:	8b85                	andi	a5,a5,1
    800020a0:	cb9d                	beqz	a5,800020d6 <freewalk+0x60>
    800020a2:	fe043783          	ld	a5,-32(s0)
    800020a6:	8bb9                	andi	a5,a5,14
    800020a8:	e79d                	bnez	a5,800020d6 <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800020aa:	fe043783          	ld	a5,-32(s0)
    800020ae:	83a9                	srli	a5,a5,0xa
    800020b0:	07b2                	slli	a5,a5,0xc
    800020b2:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800020b6:	fd843783          	ld	a5,-40(s0)
    800020ba:	853e                	mv	a0,a5
    800020bc:	00000097          	auipc	ra,0x0
    800020c0:	fba080e7          	jalr	-70(ra) # 80002076 <freewalk>
      pagetable[i] = 0;
    800020c4:	fec42783          	lw	a5,-20(s0)
    800020c8:	078e                	slli	a5,a5,0x3
    800020ca:	fc843703          	ld	a4,-56(s0)
    800020ce:	97ba                	add	a5,a5,a4
    800020d0:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ff8d000>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020d4:	a829                	j	800020ee <freewalk+0x78>
    } else if(pte & PTE_V){
    800020d6:	fe043783          	ld	a5,-32(s0)
    800020da:	8b85                	andi	a5,a5,1
    800020dc:	cb89                	beqz	a5,800020ee <freewalk+0x78>
      panic("freewalk: leaf");
    800020de:	00009517          	auipc	a0,0x9
    800020e2:	06a50513          	addi	a0,a0,106 # 8000b148 <etext+0x148>
    800020e6:	fffff097          	auipc	ra,0xfffff
    800020ea:	b6a080e7          	jalr	-1174(ra) # 80000c50 <panic>
  for(int i = 0; i < 512; i++){
    800020ee:	fec42783          	lw	a5,-20(s0)
    800020f2:	2785                	addiw	a5,a5,1
    800020f4:	fef42623          	sw	a5,-20(s0)
    800020f8:	fec42783          	lw	a5,-20(s0)
    800020fc:	0007871b          	sext.w	a4,a5
    80002100:	1ff00793          	li	a5,511
    80002104:	f8e7d2e3          	bge	a5,a4,80002088 <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    80002108:	fc843503          	ld	a0,-56(s0)
    8000210c:	fffff097          	auipc	ra,0xfffff
    80002110:	f7a080e7          	jalr	-134(ra) # 80001086 <kfree>
}
    80002114:	0001                	nop
    80002116:	70e2                	ld	ra,56(sp)
    80002118:	7442                	ld	s0,48(sp)
    8000211a:	6121                	addi	sp,sp,64
    8000211c:	8082                	ret

000000008000211e <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    8000211e:	1101                	addi	sp,sp,-32
    80002120:	ec06                	sd	ra,24(sp)
    80002122:	e822                	sd	s0,16(sp)
    80002124:	1000                	addi	s0,sp,32
    80002126:	fea43423          	sd	a0,-24(s0)
    8000212a:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    8000212e:	fe043783          	ld	a5,-32(s0)
    80002132:	c385                	beqz	a5,80002152 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002134:	fe043703          	ld	a4,-32(s0)
    80002138:	6785                	lui	a5,0x1
    8000213a:	17fd                	addi	a5,a5,-1
    8000213c:	97ba                	add	a5,a5,a4
    8000213e:	83b1                	srli	a5,a5,0xc
    80002140:	4685                	li	a3,1
    80002142:	863e                	mv	a2,a5
    80002144:	4581                	li	a1,0
    80002146:	fe843503          	ld	a0,-24(s0)
    8000214a:	00000097          	auipc	ra,0x0
    8000214e:	be6080e7          	jalr	-1050(ra) # 80001d30 <uvmunmap>
  freewalk(pagetable);
    80002152:	fe843503          	ld	a0,-24(s0)
    80002156:	00000097          	auipc	ra,0x0
    8000215a:	f20080e7          	jalr	-224(ra) # 80002076 <freewalk>
}
    8000215e:	0001                	nop
    80002160:	60e2                	ld	ra,24(sp)
    80002162:	6442                	ld	s0,16(sp)
    80002164:	6105                	addi	sp,sp,32
    80002166:	8082                	ret

0000000080002168 <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    80002168:	711d                	addi	sp,sp,-96
    8000216a:	ec86                	sd	ra,88(sp)
    8000216c:	e8a2                	sd	s0,80(sp)
    8000216e:	1080                	addi	s0,sp,96
    80002170:	faa43c23          	sd	a0,-72(s0)
    80002174:	fab43823          	sd	a1,-80(s0)
    80002178:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    8000217c:	fe043423          	sd	zero,-24(s0)
    80002180:	a0d9                	j	80002246 <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002182:	4601                	li	a2,0
    80002184:	fe843583          	ld	a1,-24(s0)
    80002188:	fb843503          	ld	a0,-72(s0)
    8000218c:	00000097          	auipc	ra,0x0
    80002190:	91a080e7          	jalr	-1766(ra) # 80001aa6 <walk>
    80002194:	fea43023          	sd	a0,-32(s0)
    80002198:	fe043783          	ld	a5,-32(s0)
    8000219c:	eb89                	bnez	a5,800021ae <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    8000219e:	00009517          	auipc	a0,0x9
    800021a2:	fba50513          	addi	a0,a0,-70 # 8000b158 <etext+0x158>
    800021a6:	fffff097          	auipc	ra,0xfffff
    800021aa:	aaa080e7          	jalr	-1366(ra) # 80000c50 <panic>
    if((*pte & PTE_V) == 0)
    800021ae:	fe043783          	ld	a5,-32(s0)
    800021b2:	639c                	ld	a5,0(a5)
    800021b4:	8b85                	andi	a5,a5,1
    800021b6:	eb89                	bnez	a5,800021c8 <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800021b8:	00009517          	auipc	a0,0x9
    800021bc:	fc050513          	addi	a0,a0,-64 # 8000b178 <etext+0x178>
    800021c0:	fffff097          	auipc	ra,0xfffff
    800021c4:	a90080e7          	jalr	-1392(ra) # 80000c50 <panic>
    pa = PTE2PA(*pte);
    800021c8:	fe043783          	ld	a5,-32(s0)
    800021cc:	639c                	ld	a5,0(a5)
    800021ce:	83a9                	srli	a5,a5,0xa
    800021d0:	07b2                	slli	a5,a5,0xc
    800021d2:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800021d6:	fe043783          	ld	a5,-32(s0)
    800021da:	639c                	ld	a5,0(a5)
    800021dc:	2781                	sext.w	a5,a5
    800021de:	3ff7f793          	andi	a5,a5,1023
    800021e2:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800021e6:	fffff097          	auipc	ra,0xfffff
    800021ea:	f44080e7          	jalr	-188(ra) # 8000112a <kalloc>
    800021ee:	fca43423          	sd	a0,-56(s0)
    800021f2:	fc843783          	ld	a5,-56(s0)
    800021f6:	c3a5                	beqz	a5,80002256 <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    800021f8:	fd843783          	ld	a5,-40(s0)
    800021fc:	6605                	lui	a2,0x1
    800021fe:	85be                	mv	a1,a5
    80002200:	fc843503          	ld	a0,-56(s0)
    80002204:	fffff097          	auipc	ra,0xfffff
    80002208:	332080e7          	jalr	818(ra) # 80001536 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    8000220c:	fc843783          	ld	a5,-56(s0)
    80002210:	fd442703          	lw	a4,-44(s0)
    80002214:	86be                	mv	a3,a5
    80002216:	6605                	lui	a2,0x1
    80002218:	fe843583          	ld	a1,-24(s0)
    8000221c:	fb043503          	ld	a0,-80(s0)
    80002220:	00000097          	auipc	ra,0x0
    80002224:	a48080e7          	jalr	-1464(ra) # 80001c68 <mappages>
    80002228:	87aa                	mv	a5,a0
    8000222a:	cb81                	beqz	a5,8000223a <uvmcopy+0xd2>
      kfree(mem);
    8000222c:	fc843503          	ld	a0,-56(s0)
    80002230:	fffff097          	auipc	ra,0xfffff
    80002234:	e56080e7          	jalr	-426(ra) # 80001086 <kfree>
      goto err;
    80002238:	a005                	j	80002258 <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    8000223a:	fe843703          	ld	a4,-24(s0)
    8000223e:	6785                	lui	a5,0x1
    80002240:	97ba                	add	a5,a5,a4
    80002242:	fef43423          	sd	a5,-24(s0)
    80002246:	fe843703          	ld	a4,-24(s0)
    8000224a:	fa843783          	ld	a5,-88(s0)
    8000224e:	f2f76ae3          	bltu	a4,a5,80002182 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002252:	4781                	li	a5,0
    80002254:	a839                	j	80002272 <uvmcopy+0x10a>
      goto err;
    80002256:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    80002258:	fe843783          	ld	a5,-24(s0)
    8000225c:	83b1                	srli	a5,a5,0xc
    8000225e:	4685                	li	a3,1
    80002260:	863e                	mv	a2,a5
    80002262:	4581                	li	a1,0
    80002264:	fb043503          	ld	a0,-80(s0)
    80002268:	00000097          	auipc	ra,0x0
    8000226c:	ac8080e7          	jalr	-1336(ra) # 80001d30 <uvmunmap>
  return -1;
    80002270:	57fd                	li	a5,-1
}
    80002272:	853e                	mv	a0,a5
    80002274:	60e6                	ld	ra,88(sp)
    80002276:	6446                	ld	s0,80(sp)
    80002278:	6125                	addi	sp,sp,96
    8000227a:	8082                	ret

000000008000227c <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    8000227c:	7179                	addi	sp,sp,-48
    8000227e:	f406                	sd	ra,40(sp)
    80002280:	f022                	sd	s0,32(sp)
    80002282:	1800                	addi	s0,sp,48
    80002284:	fca43c23          	sd	a0,-40(s0)
    80002288:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    8000228c:	4601                	li	a2,0
    8000228e:	fd043583          	ld	a1,-48(s0)
    80002292:	fd843503          	ld	a0,-40(s0)
    80002296:	00000097          	auipc	ra,0x0
    8000229a:	810080e7          	jalr	-2032(ra) # 80001aa6 <walk>
    8000229e:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800022a2:	fe843783          	ld	a5,-24(s0)
    800022a6:	eb89                	bnez	a5,800022b8 <uvmclear+0x3c>
    panic("uvmclear");
    800022a8:	00009517          	auipc	a0,0x9
    800022ac:	ef050513          	addi	a0,a0,-272 # 8000b198 <etext+0x198>
    800022b0:	fffff097          	auipc	ra,0xfffff
    800022b4:	9a0080e7          	jalr	-1632(ra) # 80000c50 <panic>
  *pte &= ~PTE_U;
    800022b8:	fe843783          	ld	a5,-24(s0)
    800022bc:	639c                	ld	a5,0(a5)
    800022be:	fef7f713          	andi	a4,a5,-17
    800022c2:	fe843783          	ld	a5,-24(s0)
    800022c6:	e398                	sd	a4,0(a5)
}
    800022c8:	0001                	nop
    800022ca:	70a2                	ld	ra,40(sp)
    800022cc:	7402                	ld	s0,32(sp)
    800022ce:	6145                	addi	sp,sp,48
    800022d0:	8082                	ret

00000000800022d2 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800022d2:	715d                	addi	sp,sp,-80
    800022d4:	e486                	sd	ra,72(sp)
    800022d6:	e0a2                	sd	s0,64(sp)
    800022d8:	0880                	addi	s0,sp,80
    800022da:	fca43423          	sd	a0,-56(s0)
    800022de:	fcb43023          	sd	a1,-64(s0)
    800022e2:	fac43c23          	sd	a2,-72(s0)
    800022e6:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800022ea:	a055                	j	8000238e <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    800022ec:	fc043703          	ld	a4,-64(s0)
    800022f0:	77fd                	lui	a5,0xfffff
    800022f2:	8ff9                	and	a5,a5,a4
    800022f4:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800022f8:	fe043583          	ld	a1,-32(s0)
    800022fc:	fc843503          	ld	a0,-56(s0)
    80002300:	00000097          	auipc	ra,0x0
    80002304:	896080e7          	jalr	-1898(ra) # 80001b96 <walkaddr>
    80002308:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    8000230c:	fd843783          	ld	a5,-40(s0)
    80002310:	e399                	bnez	a5,80002316 <copyout+0x44>
      return -1;
    80002312:	57fd                	li	a5,-1
    80002314:	a049                	j	80002396 <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    80002316:	fe043703          	ld	a4,-32(s0)
    8000231a:	fc043783          	ld	a5,-64(s0)
    8000231e:	8f1d                	sub	a4,a4,a5
    80002320:	6785                	lui	a5,0x1
    80002322:	97ba                	add	a5,a5,a4
    80002324:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002328:	fe843703          	ld	a4,-24(s0)
    8000232c:	fb043783          	ld	a5,-80(s0)
    80002330:	00e7f663          	bgeu	a5,a4,8000233c <copyout+0x6a>
      n = len;
    80002334:	fb043783          	ld	a5,-80(s0)
    80002338:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    8000233c:	fc043703          	ld	a4,-64(s0)
    80002340:	fe043783          	ld	a5,-32(s0)
    80002344:	8f1d                	sub	a4,a4,a5
    80002346:	fd843783          	ld	a5,-40(s0)
    8000234a:	97ba                	add	a5,a5,a4
    8000234c:	873e                	mv	a4,a5
    8000234e:	fe843783          	ld	a5,-24(s0)
    80002352:	2781                	sext.w	a5,a5
    80002354:	863e                	mv	a2,a5
    80002356:	fb843583          	ld	a1,-72(s0)
    8000235a:	853a                	mv	a0,a4
    8000235c:	fffff097          	auipc	ra,0xfffff
    80002360:	1da080e7          	jalr	474(ra) # 80001536 <memmove>

    len -= n;
    80002364:	fb043703          	ld	a4,-80(s0)
    80002368:	fe843783          	ld	a5,-24(s0)
    8000236c:	40f707b3          	sub	a5,a4,a5
    80002370:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002374:	fb843703          	ld	a4,-72(s0)
    80002378:	fe843783          	ld	a5,-24(s0)
    8000237c:	97ba                	add	a5,a5,a4
    8000237e:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002382:	fe043703          	ld	a4,-32(s0)
    80002386:	6785                	lui	a5,0x1
    80002388:	97ba                	add	a5,a5,a4
    8000238a:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    8000238e:	fb043783          	ld	a5,-80(s0)
    80002392:	ffa9                	bnez	a5,800022ec <copyout+0x1a>
  }
  return 0;
    80002394:	4781                	li	a5,0
}
    80002396:	853e                	mv	a0,a5
    80002398:	60a6                	ld	ra,72(sp)
    8000239a:	6406                	ld	s0,64(sp)
    8000239c:	6161                	addi	sp,sp,80
    8000239e:	8082                	ret

00000000800023a0 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800023a0:	715d                	addi	sp,sp,-80
    800023a2:	e486                	sd	ra,72(sp)
    800023a4:	e0a2                	sd	s0,64(sp)
    800023a6:	0880                	addi	s0,sp,80
    800023a8:	fca43423          	sd	a0,-56(s0)
    800023ac:	fcb43023          	sd	a1,-64(s0)
    800023b0:	fac43c23          	sd	a2,-72(s0)
    800023b4:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800023b8:	a055                	j	8000245c <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800023ba:	fb843703          	ld	a4,-72(s0)
    800023be:	77fd                	lui	a5,0xfffff
    800023c0:	8ff9                	and	a5,a5,a4
    800023c2:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800023c6:	fe043583          	ld	a1,-32(s0)
    800023ca:	fc843503          	ld	a0,-56(s0)
    800023ce:	fffff097          	auipc	ra,0xfffff
    800023d2:	7c8080e7          	jalr	1992(ra) # 80001b96 <walkaddr>
    800023d6:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800023da:	fd843783          	ld	a5,-40(s0)
    800023de:	e399                	bnez	a5,800023e4 <copyin+0x44>
      return -1;
    800023e0:	57fd                	li	a5,-1
    800023e2:	a049                	j	80002464 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800023e4:	fe043703          	ld	a4,-32(s0)
    800023e8:	fb843783          	ld	a5,-72(s0)
    800023ec:	8f1d                	sub	a4,a4,a5
    800023ee:	6785                	lui	a5,0x1
    800023f0:	97ba                	add	a5,a5,a4
    800023f2:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800023f6:	fe843703          	ld	a4,-24(s0)
    800023fa:	fb043783          	ld	a5,-80(s0)
    800023fe:	00e7f663          	bgeu	a5,a4,8000240a <copyin+0x6a>
      n = len;
    80002402:	fb043783          	ld	a5,-80(s0)
    80002406:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8000240a:	fb843703          	ld	a4,-72(s0)
    8000240e:	fe043783          	ld	a5,-32(s0)
    80002412:	8f1d                	sub	a4,a4,a5
    80002414:	fd843783          	ld	a5,-40(s0)
    80002418:	97ba                	add	a5,a5,a4
    8000241a:	873e                	mv	a4,a5
    8000241c:	fe843783          	ld	a5,-24(s0)
    80002420:	2781                	sext.w	a5,a5
    80002422:	863e                	mv	a2,a5
    80002424:	85ba                	mv	a1,a4
    80002426:	fc043503          	ld	a0,-64(s0)
    8000242a:	fffff097          	auipc	ra,0xfffff
    8000242e:	10c080e7          	jalr	268(ra) # 80001536 <memmove>

    len -= n;
    80002432:	fb043703          	ld	a4,-80(s0)
    80002436:	fe843783          	ld	a5,-24(s0)
    8000243a:	40f707b3          	sub	a5,a4,a5
    8000243e:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002442:	fc043703          	ld	a4,-64(s0)
    80002446:	fe843783          	ld	a5,-24(s0)
    8000244a:	97ba                	add	a5,a5,a4
    8000244c:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002450:	fe043703          	ld	a4,-32(s0)
    80002454:	6785                	lui	a5,0x1
    80002456:	97ba                	add	a5,a5,a4
    80002458:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    8000245c:	fb043783          	ld	a5,-80(s0)
    80002460:	ffa9                	bnez	a5,800023ba <copyin+0x1a>
  }
  return 0;
    80002462:	4781                	li	a5,0
}
    80002464:	853e                	mv	a0,a5
    80002466:	60a6                	ld	ra,72(sp)
    80002468:	6406                	ld	s0,64(sp)
    8000246a:	6161                	addi	sp,sp,80
    8000246c:	8082                	ret

000000008000246e <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    8000246e:	711d                	addi	sp,sp,-96
    80002470:	ec86                	sd	ra,88(sp)
    80002472:	e8a2                	sd	s0,80(sp)
    80002474:	1080                	addi	s0,sp,96
    80002476:	faa43c23          	sd	a0,-72(s0)
    8000247a:	fab43823          	sd	a1,-80(s0)
    8000247e:	fac43423          	sd	a2,-88(s0)
    80002482:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    80002486:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000248a:	a0f1                	j	80002556 <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    8000248c:	fa843703          	ld	a4,-88(s0)
    80002490:	77fd                	lui	a5,0xfffff
    80002492:	8ff9                	and	a5,a5,a4
    80002494:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    80002498:	fd043583          	ld	a1,-48(s0)
    8000249c:	fb843503          	ld	a0,-72(s0)
    800024a0:	fffff097          	auipc	ra,0xfffff
    800024a4:	6f6080e7          	jalr	1782(ra) # 80001b96 <walkaddr>
    800024a8:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800024ac:	fc843783          	ld	a5,-56(s0)
    800024b0:	e399                	bnez	a5,800024b6 <copyinstr+0x48>
      return -1;
    800024b2:	57fd                	li	a5,-1
    800024b4:	a87d                	j	80002572 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800024b6:	fd043703          	ld	a4,-48(s0)
    800024ba:	fa843783          	ld	a5,-88(s0)
    800024be:	8f1d                	sub	a4,a4,a5
    800024c0:	6785                	lui	a5,0x1
    800024c2:	97ba                	add	a5,a5,a4
    800024c4:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800024c8:	fe843703          	ld	a4,-24(s0)
    800024cc:	fa043783          	ld	a5,-96(s0)
    800024d0:	00e7f663          	bgeu	a5,a4,800024dc <copyinstr+0x6e>
      n = max;
    800024d4:	fa043783          	ld	a5,-96(s0)
    800024d8:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800024dc:	fa843703          	ld	a4,-88(s0)
    800024e0:	fd043783          	ld	a5,-48(s0)
    800024e4:	8f1d                	sub	a4,a4,a5
    800024e6:	fc843783          	ld	a5,-56(s0)
    800024ea:	97ba                	add	a5,a5,a4
    800024ec:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    800024f0:	a891                	j	80002544 <copyinstr+0xd6>
      if(*p == '\0'){
    800024f2:	fd843783          	ld	a5,-40(s0)
    800024f6:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    800024fa:	eb89                	bnez	a5,8000250c <copyinstr+0x9e>
        *dst = '\0';
    800024fc:	fb043783          	ld	a5,-80(s0)
    80002500:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002504:	4785                	li	a5,1
    80002506:	fef42223          	sw	a5,-28(s0)
        break;
    8000250a:	a081                	j	8000254a <copyinstr+0xdc>
      } else {
        *dst = *p;
    8000250c:	fd843783          	ld	a5,-40(s0)
    80002510:	0007c703          	lbu	a4,0(a5)
    80002514:	fb043783          	ld	a5,-80(s0)
    80002518:	00e78023          	sb	a4,0(a5)
      }
      --n;
    8000251c:	fe843783          	ld	a5,-24(s0)
    80002520:	17fd                	addi	a5,a5,-1
    80002522:	fef43423          	sd	a5,-24(s0)
      --max;
    80002526:	fa043783          	ld	a5,-96(s0)
    8000252a:	17fd                	addi	a5,a5,-1
    8000252c:	faf43023          	sd	a5,-96(s0)
      p++;
    80002530:	fd843783          	ld	a5,-40(s0)
    80002534:	0785                	addi	a5,a5,1
    80002536:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    8000253a:	fb043783          	ld	a5,-80(s0)
    8000253e:	0785                	addi	a5,a5,1
    80002540:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002544:	fe843783          	ld	a5,-24(s0)
    80002548:	f7cd                	bnez	a5,800024f2 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    8000254a:	fd043703          	ld	a4,-48(s0)
    8000254e:	6785                	lui	a5,0x1
    80002550:	97ba                	add	a5,a5,a4
    80002552:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    80002556:	fe442783          	lw	a5,-28(s0)
    8000255a:	2781                	sext.w	a5,a5
    8000255c:	e781                	bnez	a5,80002564 <copyinstr+0xf6>
    8000255e:	fa043783          	ld	a5,-96(s0)
    80002562:	f78d                	bnez	a5,8000248c <copyinstr+0x1e>
  }
  if(got_null){
    80002564:	fe442783          	lw	a5,-28(s0)
    80002568:	2781                	sext.w	a5,a5
    8000256a:	c399                	beqz	a5,80002570 <copyinstr+0x102>
    return 0;
    8000256c:	4781                	li	a5,0
    8000256e:	a011                	j	80002572 <copyinstr+0x104>
  } else {
    return -1;
    80002570:	57fd                	li	a5,-1
  }
}
    80002572:	853e                	mv	a0,a5
    80002574:	60e6                	ld	ra,88(sp)
    80002576:	6446                	ld	s0,80(sp)
    80002578:	6125                	addi	sp,sp,96
    8000257a:	8082                	ret

000000008000257c <r_sstatus>:
{
    8000257c:	1101                	addi	sp,sp,-32
    8000257e:	ec22                	sd	s0,24(sp)
    80002580:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002582:	100027f3          	csrr	a5,sstatus
    80002586:	fef43423          	sd	a5,-24(s0)
  return x;
    8000258a:	fe843783          	ld	a5,-24(s0)
}
    8000258e:	853e                	mv	a0,a5
    80002590:	6462                	ld	s0,24(sp)
    80002592:	6105                	addi	sp,sp,32
    80002594:	8082                	ret

0000000080002596 <w_sstatus>:
{
    80002596:	1101                	addi	sp,sp,-32
    80002598:	ec22                	sd	s0,24(sp)
    8000259a:	1000                	addi	s0,sp,32
    8000259c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800025a0:	fe843783          	ld	a5,-24(s0)
    800025a4:	10079073          	csrw	sstatus,a5
}
    800025a8:	0001                	nop
    800025aa:	6462                	ld	s0,24(sp)
    800025ac:	6105                	addi	sp,sp,32
    800025ae:	8082                	ret

00000000800025b0 <intr_on>:
{
    800025b0:	1141                	addi	sp,sp,-16
    800025b2:	e406                	sd	ra,8(sp)
    800025b4:	e022                	sd	s0,0(sp)
    800025b6:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800025b8:	00000097          	auipc	ra,0x0
    800025bc:	fc4080e7          	jalr	-60(ra) # 8000257c <r_sstatus>
    800025c0:	87aa                	mv	a5,a0
    800025c2:	0027e793          	ori	a5,a5,2
    800025c6:	853e                	mv	a0,a5
    800025c8:	00000097          	auipc	ra,0x0
    800025cc:	fce080e7          	jalr	-50(ra) # 80002596 <w_sstatus>
}
    800025d0:	0001                	nop
    800025d2:	60a2                	ld	ra,8(sp)
    800025d4:	6402                	ld	s0,0(sp)
    800025d6:	0141                	addi	sp,sp,16
    800025d8:	8082                	ret

00000000800025da <intr_get>:
{
    800025da:	1101                	addi	sp,sp,-32
    800025dc:	ec06                	sd	ra,24(sp)
    800025de:	e822                	sd	s0,16(sp)
    800025e0:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800025e2:	00000097          	auipc	ra,0x0
    800025e6:	f9a080e7          	jalr	-102(ra) # 8000257c <r_sstatus>
    800025ea:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800025ee:	fe843783          	ld	a5,-24(s0)
    800025f2:	8b89                	andi	a5,a5,2
    800025f4:	00f037b3          	snez	a5,a5
    800025f8:	0ff7f793          	andi	a5,a5,255
    800025fc:	2781                	sext.w	a5,a5
}
    800025fe:	853e                	mv	a0,a5
    80002600:	60e2                	ld	ra,24(sp)
    80002602:	6442                	ld	s0,16(sp)
    80002604:	6105                	addi	sp,sp,32
    80002606:	8082                	ret

0000000080002608 <r_tp>:
{
    80002608:	1101                	addi	sp,sp,-32
    8000260a:	ec22                	sd	s0,24(sp)
    8000260c:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    8000260e:	8792                	mv	a5,tp
    80002610:	fef43423          	sd	a5,-24(s0)
  return x;
    80002614:	fe843783          	ld	a5,-24(s0)
}
    80002618:	853e                	mv	a0,a5
    8000261a:	6462                	ld	s0,24(sp)
    8000261c:	6105                	addi	sp,sp,32
    8000261e:	8082                	ret

0000000080002620 <proc_mapstacks>:

// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl) {
    80002620:	7139                	addi	sp,sp,-64
    80002622:	fc06                	sd	ra,56(sp)
    80002624:	f822                	sd	s0,48(sp)
    80002626:	0080                	addi	s0,sp,64
    80002628:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    8000262c:	00012797          	auipc	a5,0x12
    80002630:	06c78793          	addi	a5,a5,108 # 80014698 <proc>
    80002634:	fef43423          	sd	a5,-24(s0)
    80002638:	a071                	j	800026c4 <proc_mapstacks+0xa4>
    char *pa = kalloc();
    8000263a:	fffff097          	auipc	ra,0xfffff
    8000263e:	af0080e7          	jalr	-1296(ra) # 8000112a <kalloc>
    80002642:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80002646:	fe043783          	ld	a5,-32(s0)
    8000264a:	eb89                	bnez	a5,8000265c <proc_mapstacks+0x3c>
      panic("kalloc");
    8000264c:	00009517          	auipc	a0,0x9
    80002650:	b5c50513          	addi	a0,a0,-1188 # 8000b1a8 <etext+0x1a8>
    80002654:	ffffe097          	auipc	ra,0xffffe
    80002658:	5fc080e7          	jalr	1532(ra) # 80000c50 <panic>
    uint64 va = KSTACK((int) (p - proc));
    8000265c:	fe843703          	ld	a4,-24(s0)
    80002660:	00012797          	auipc	a5,0x12
    80002664:	03878793          	addi	a5,a5,56 # 80014698 <proc>
    80002668:	40f707b3          	sub	a5,a4,a5
    8000266c:	4047d713          	srai	a4,a5,0x4
    80002670:	00009797          	auipc	a5,0x9
    80002674:	c2078793          	addi	a5,a5,-992 # 8000b290 <etext+0x290>
    80002678:	639c                	ld	a5,0(a5)
    8000267a:	02f707b3          	mul	a5,a4,a5
    8000267e:	2781                	sext.w	a5,a5
    80002680:	2785                	addiw	a5,a5,1
    80002682:	2781                	sext.w	a5,a5
    80002684:	00d7979b          	slliw	a5,a5,0xd
    80002688:	2781                	sext.w	a5,a5
    8000268a:	873e                	mv	a4,a5
    8000268c:	040007b7          	lui	a5,0x4000
    80002690:	17fd                	addi	a5,a5,-1
    80002692:	07b2                	slli	a5,a5,0xc
    80002694:	8f99                	sub	a5,a5,a4
    80002696:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    8000269a:	fe043783          	ld	a5,-32(s0)
    8000269e:	4719                	li	a4,6
    800026a0:	6685                	lui	a3,0x1
    800026a2:	863e                	mv	a2,a5
    800026a4:	fd843583          	ld	a1,-40(s0)
    800026a8:	fc843503          	ld	a0,-56(s0)
    800026ac:	fffff097          	auipc	ra,0xfffff
    800026b0:	562080e7          	jalr	1378(ra) # 80001c0e <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800026b4:	fe843703          	ld	a4,-24(s0)
    800026b8:	6785                	lui	a5,0x1
    800026ba:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    800026be:	97ba                	add	a5,a5,a4
    800026c0:	fef43423          	sd	a5,-24(s0)
    800026c4:	fe843703          	ld	a4,-24(s0)
    800026c8:	00061797          	auipc	a5,0x61
    800026cc:	3d078793          	addi	a5,a5,976 # 80063a98 <pid_lock>
    800026d0:	f6f765e3          	bltu	a4,a5,8000263a <proc_mapstacks+0x1a>
  }
}
    800026d4:	0001                	nop
    800026d6:	0001                	nop
    800026d8:	70e2                	ld	ra,56(sp)
    800026da:	7442                	ld	s0,48(sp)
    800026dc:	6121                	addi	sp,sp,64
    800026de:	8082                	ret

00000000800026e0 <procinit>:

// initialize the proc table at boot time.
void
procinit(void)
{
    800026e0:	1101                	addi	sp,sp,-32
    800026e2:	ec06                	sd	ra,24(sp)
    800026e4:	e822                	sd	s0,16(sp)
    800026e6:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800026e8:	00009597          	auipc	a1,0x9
    800026ec:	ac858593          	addi	a1,a1,-1336 # 8000b1b0 <etext+0x1b0>
    800026f0:	00061517          	auipc	a0,0x61
    800026f4:	3a850513          	addi	a0,a0,936 # 80063a98 <pid_lock>
    800026f8:	fffff097          	auipc	ra,0xfffff
    800026fc:	b56080e7          	jalr	-1194(ra) # 8000124e <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002700:	00012797          	auipc	a5,0x12
    80002704:	f9878793          	addi	a5,a5,-104 # 80014698 <proc>
    80002708:	fef43423          	sd	a5,-24(s0)
    8000270c:	a885                	j	8000277c <procinit+0x9c>
      initlock(&p->lock, "proc");
    8000270e:	fe843783          	ld	a5,-24(s0)
    80002712:	00009597          	auipc	a1,0x9
    80002716:	aa658593          	addi	a1,a1,-1370 # 8000b1b8 <etext+0x1b8>
    8000271a:	853e                	mv	a0,a5
    8000271c:	fffff097          	auipc	ra,0xfffff
    80002720:	b32080e7          	jalr	-1230(ra) # 8000124e <initlock>
      p->kstack = KSTACK((int) (p - proc));
    80002724:	fe843703          	ld	a4,-24(s0)
    80002728:	00012797          	auipc	a5,0x12
    8000272c:	f7078793          	addi	a5,a5,-144 # 80014698 <proc>
    80002730:	40f707b3          	sub	a5,a4,a5
    80002734:	4047d713          	srai	a4,a5,0x4
    80002738:	00009797          	auipc	a5,0x9
    8000273c:	b5878793          	addi	a5,a5,-1192 # 8000b290 <etext+0x290>
    80002740:	639c                	ld	a5,0(a5)
    80002742:	02f707b3          	mul	a5,a4,a5
    80002746:	2781                	sext.w	a5,a5
    80002748:	2785                	addiw	a5,a5,1
    8000274a:	2781                	sext.w	a5,a5
    8000274c:	00d7979b          	slliw	a5,a5,0xd
    80002750:	2781                	sext.w	a5,a5
    80002752:	873e                	mv	a4,a5
    80002754:	040007b7          	lui	a5,0x4000
    80002758:	17fd                	addi	a5,a5,-1
    8000275a:	07b2                	slli	a5,a5,0xc
    8000275c:	8f99                	sub	a5,a5,a4
    8000275e:	86be                	mv	a3,a5
    80002760:	fe843703          	ld	a4,-24(s0)
    80002764:	6785                	lui	a5,0x1
    80002766:	97ba                	add	a5,a5,a4
    80002768:	2ad7b423          	sd	a3,680(a5) # 12a8 <_entry-0x7fffed58>
  for(p = proc; p < &proc[NPROC]; p++) {
    8000276c:	fe843703          	ld	a4,-24(s0)
    80002770:	6785                	lui	a5,0x1
    80002772:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    80002776:	97ba                	add	a5,a5,a4
    80002778:	fef43423          	sd	a5,-24(s0)
    8000277c:	fe843703          	ld	a4,-24(s0)
    80002780:	00061797          	auipc	a5,0x61
    80002784:	31878793          	addi	a5,a5,792 # 80063a98 <pid_lock>
    80002788:	f8f763e3          	bltu	a4,a5,8000270e <procinit+0x2e>
  }
}
    8000278c:	0001                	nop
    8000278e:	0001                	nop
    80002790:	60e2                	ld	ra,24(sp)
    80002792:	6442                	ld	s0,16(sp)
    80002794:	6105                	addi	sp,sp,32
    80002796:	8082                	ret

0000000080002798 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    80002798:	1101                	addi	sp,sp,-32
    8000279a:	ec06                	sd	ra,24(sp)
    8000279c:	e822                	sd	s0,16(sp)
    8000279e:	1000                	addi	s0,sp,32
  int id = r_tp();
    800027a0:	00000097          	auipc	ra,0x0
    800027a4:	e68080e7          	jalr	-408(ra) # 80002608 <r_tp>
    800027a8:	87aa                	mv	a5,a0
    800027aa:	fef42623          	sw	a5,-20(s0)
  return id;
    800027ae:	fec42783          	lw	a5,-20(s0)
}
    800027b2:	853e                	mv	a0,a5
    800027b4:	60e2                	ld	ra,24(sp)
    800027b6:	6442                	ld	s0,16(sp)
    800027b8:	6105                	addi	sp,sp,32
    800027ba:	8082                	ret

00000000800027bc <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
    800027bc:	1101                	addi	sp,sp,-32
    800027be:	ec06                	sd	ra,24(sp)
    800027c0:	e822                	sd	s0,16(sp)
    800027c2:	1000                	addi	s0,sp,32
  int id = cpuid();
    800027c4:	00000097          	auipc	ra,0x0
    800027c8:	fd4080e7          	jalr	-44(ra) # 80002798 <cpuid>
    800027cc:	87aa                	mv	a5,a0
    800027ce:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    800027d2:	fec42783          	lw	a5,-20(s0)
    800027d6:	00779713          	slli	a4,a5,0x7
    800027da:	00012797          	auipc	a5,0x12
    800027de:	abe78793          	addi	a5,a5,-1346 # 80014298 <cpus>
    800027e2:	97ba                	add	a5,a5,a4
    800027e4:	fef43023          	sd	a5,-32(s0)
  return c;
    800027e8:	fe043783          	ld	a5,-32(s0)
}
    800027ec:	853e                	mv	a0,a5
    800027ee:	60e2                	ld	ra,24(sp)
    800027f0:	6442                	ld	s0,16(sp)
    800027f2:	6105                	addi	sp,sp,32
    800027f4:	8082                	ret

00000000800027f6 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
    800027f6:	1101                	addi	sp,sp,-32
    800027f8:	ec06                	sd	ra,24(sp)
    800027fa:	e822                	sd	s0,16(sp)
    800027fc:	1000                	addi	s0,sp,32
  push_off();
    800027fe:	fffff097          	auipc	ra,0xfffff
    80002802:	b7e080e7          	jalr	-1154(ra) # 8000137c <push_off>
  struct cpu *c = mycpu();
    80002806:	00000097          	auipc	ra,0x0
    8000280a:	fb6080e7          	jalr	-74(ra) # 800027bc <mycpu>
    8000280e:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002812:	fe843783          	ld	a5,-24(s0)
    80002816:	639c                	ld	a5,0(a5)
    80002818:	fef43023          	sd	a5,-32(s0)
  pop_off();
    8000281c:	fffff097          	auipc	ra,0xfffff
    80002820:	bb8080e7          	jalr	-1096(ra) # 800013d4 <pop_off>
  return p;
    80002824:	fe043783          	ld	a5,-32(s0)
}
    80002828:	853e                	mv	a0,a5
    8000282a:	60e2                	ld	ra,24(sp)
    8000282c:	6442                	ld	s0,16(sp)
    8000282e:	6105                	addi	sp,sp,32
    80002830:	8082                	ret

0000000080002832 <allocpid>:

int
allocpid() {
    80002832:	1101                	addi	sp,sp,-32
    80002834:	ec06                	sd	ra,24(sp)
    80002836:	e822                	sd	s0,16(sp)
    80002838:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    8000283a:	00061517          	auipc	a0,0x61
    8000283e:	25e50513          	addi	a0,a0,606 # 80063a98 <pid_lock>
    80002842:	fffff097          	auipc	ra,0xfffff
    80002846:	a3c080e7          	jalr	-1476(ra) # 8000127e <acquire>
  pid = nextpid;
    8000284a:	00009797          	auipc	a5,0x9
    8000284e:	f0678793          	addi	a5,a5,-250 # 8000b750 <nextpid>
    80002852:	439c                	lw	a5,0(a5)
    80002854:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002858:	00009797          	auipc	a5,0x9
    8000285c:	ef878793          	addi	a5,a5,-264 # 8000b750 <nextpid>
    80002860:	439c                	lw	a5,0(a5)
    80002862:	2785                	addiw	a5,a5,1
    80002864:	0007871b          	sext.w	a4,a5
    80002868:	00009797          	auipc	a5,0x9
    8000286c:	ee878793          	addi	a5,a5,-280 # 8000b750 <nextpid>
    80002870:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002872:	00061517          	auipc	a0,0x61
    80002876:	22650513          	addi	a0,a0,550 # 80063a98 <pid_lock>
    8000287a:	fffff097          	auipc	ra,0xfffff
    8000287e:	a68080e7          	jalr	-1432(ra) # 800012e2 <release>

  return pid;
    80002882:	fec42783          	lw	a5,-20(s0)
}
    80002886:	853e                	mv	a0,a5
    80002888:	60e2                	ld	ra,24(sp)
    8000288a:	6442                	ld	s0,16(sp)
    8000288c:	6105                	addi	sp,sp,32
    8000288e:	8082                	ret

0000000080002890 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002890:	1101                	addi	sp,sp,-32
    80002892:	ec06                	sd	ra,24(sp)
    80002894:	e822                	sd	s0,16(sp)
    80002896:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002898:	00012797          	auipc	a5,0x12
    8000289c:	e0078793          	addi	a5,a5,-512 # 80014698 <proc>
    800028a0:	fef43423          	sd	a5,-24(s0)
    800028a4:	a81d                	j	800028da <allocproc+0x4a>
    acquire(&p->lock);
    800028a6:	fe843783          	ld	a5,-24(s0)
    800028aa:	853e                	mv	a0,a5
    800028ac:	fffff097          	auipc	ra,0xfffff
    800028b0:	9d2080e7          	jalr	-1582(ra) # 8000127e <acquire>
    if(p->state == UNUSED) {
    800028b4:	fe843783          	ld	a5,-24(s0)
    800028b8:	4f9c                	lw	a5,24(a5)
    800028ba:	cb95                	beqz	a5,800028ee <allocproc+0x5e>
      goto found;
    } else {
      release(&p->lock);
    800028bc:	fe843783          	ld	a5,-24(s0)
    800028c0:	853e                	mv	a0,a5
    800028c2:	fffff097          	auipc	ra,0xfffff
    800028c6:	a20080e7          	jalr	-1504(ra) # 800012e2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028ca:	fe843703          	ld	a4,-24(s0)
    800028ce:	6785                	lui	a5,0x1
    800028d0:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    800028d4:	97ba                	add	a5,a5,a4
    800028d6:	fef43423          	sd	a5,-24(s0)
    800028da:	fe843703          	ld	a4,-24(s0)
    800028de:	00061797          	auipc	a5,0x61
    800028e2:	1ba78793          	addi	a5,a5,442 # 80063a98 <pid_lock>
    800028e6:	fcf760e3          	bltu	a4,a5,800028a6 <allocproc+0x16>
    }
  }
  return 0;
    800028ea:	4781                	li	a5,0
    800028ec:	a2b1                	j	80002a38 <allocproc+0x1a8>
      goto found;
    800028ee:	0001                	nop

found:
  p->pid = allocpid();
    800028f0:	00000097          	auipc	ra,0x0
    800028f4:	f42080e7          	jalr	-190(ra) # 80002832 <allocpid>
    800028f8:	87aa                	mv	a5,a0
    800028fa:	873e                	mv	a4,a5
    800028fc:	fe843783          	ld	a5,-24(s0)
    80002900:	df98                	sw	a4,56(a5)

  // for mp3
  p->thrdstop_ticks = 0;
    80002902:	fe843783          	ld	a5,-24(s0)
    80002906:	0207ae23          	sw	zero,60(a5)
  p->thrdstop_delay = -1;
    8000290a:	fe843783          	ld	a5,-24(s0)
    8000290e:	577d                	li	a4,-1
    80002910:	c3b8                	sw	a4,64(a5)
  p->jump_flag = 0;
    80002912:	fe843703          	ld	a4,-24(s0)
    80002916:	6785                	lui	a5,0x1
    80002918:	97ba                	add	a5,a5,a4
    8000291a:	2807ac23          	sw	zero,664(a5) # 1298 <_entry-0x7fffed68>
  p->resume_flag = -1;
    8000291e:	fe843703          	ld	a4,-24(s0)
    80002922:	6785                	lui	a5,0x1
    80002924:	97ba                	add	a5,a5,a4
    80002926:	577d                	li	a4,-1
    80002928:	28e7ae23          	sw	a4,668(a5) # 129c <_entry-0x7fffed64>
  p->cancel_save_flag = -1;
    8000292c:	fe843703          	ld	a4,-24(s0)
    80002930:	6785                	lui	a5,0x1
    80002932:	97ba                	add	a5,a5,a4
    80002934:	577d                	li	a4,-1
    80002936:	2ae7a023          	sw	a4,672(a5) # 12a0 <_entry-0x7fffed60>
  int i;
  for (i = 0; i < MAX_THRD_NUM; i++)
    8000293a:	fe042223          	sw	zero,-28(s0)
    8000293e:	a005                	j	8000295e <allocproc+0xce>
  {
    p->thrdstop_context_used[i] = 0;
    80002940:	fe843703          	ld	a4,-24(s0)
    80002944:	fe442783          	lw	a5,-28(s0)
    80002948:	49478793          	addi	a5,a5,1172
    8000294c:	078a                	slli	a5,a5,0x2
    8000294e:	97ba                	add	a5,a5,a4
    80002950:	0007a423          	sw	zero,8(a5)
  for (i = 0; i < MAX_THRD_NUM; i++)
    80002954:	fe442783          	lw	a5,-28(s0)
    80002958:	2785                	addiw	a5,a5,1
    8000295a:	fef42223          	sw	a5,-28(s0)
    8000295e:	fe442783          	lw	a5,-28(s0)
    80002962:	0007871b          	sext.w	a4,a5
    80002966:	47bd                	li	a5,15
    80002968:	fce7dce3          	bge	a5,a4,80002940 <allocproc+0xb0>
  }

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    8000296c:	ffffe097          	auipc	ra,0xffffe
    80002970:	7be080e7          	jalr	1982(ra) # 8000112a <kalloc>
    80002974:	86aa                	mv	a3,a0
    80002976:	fe843703          	ld	a4,-24(s0)
    8000297a:	6785                	lui	a5,0x1
    8000297c:	97ba                	add	a5,a5,a4
    8000297e:	2cd7b023          	sd	a3,704(a5) # 12c0 <_entry-0x7fffed40>
    80002982:	fe843703          	ld	a4,-24(s0)
    80002986:	6785                	lui	a5,0x1
    80002988:	97ba                	add	a5,a5,a4
    8000298a:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    8000298e:	eb91                	bnez	a5,800029a2 <allocproc+0x112>
    release(&p->lock);
    80002990:	fe843783          	ld	a5,-24(s0)
    80002994:	853e                	mv	a0,a5
    80002996:	fffff097          	auipc	ra,0xfffff
    8000299a:	94c080e7          	jalr	-1716(ra) # 800012e2 <release>
    return 0;
    8000299e:	4781                	li	a5,0
    800029a0:	a861                	j	80002a38 <allocproc+0x1a8>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    800029a2:	fe843503          	ld	a0,-24(s0)
    800029a6:	00000097          	auipc	ra,0x0
    800029aa:	168080e7          	jalr	360(ra) # 80002b0e <proc_pagetable>
    800029ae:	86aa                	mv	a3,a0
    800029b0:	fe843703          	ld	a4,-24(s0)
    800029b4:	6785                	lui	a5,0x1
    800029b6:	97ba                	add	a5,a5,a4
    800029b8:	2ad7bc23          	sd	a3,696(a5) # 12b8 <_entry-0x7fffed48>
  if(p->pagetable == 0){
    800029bc:	fe843703          	ld	a4,-24(s0)
    800029c0:	6785                	lui	a5,0x1
    800029c2:	97ba                	add	a5,a5,a4
    800029c4:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    800029c8:	e385                	bnez	a5,800029e8 <allocproc+0x158>
    freeproc(p);
    800029ca:	fe843503          	ld	a0,-24(s0)
    800029ce:	00000097          	auipc	ra,0x0
    800029d2:	074080e7          	jalr	116(ra) # 80002a42 <freeproc>
    release(&p->lock);
    800029d6:	fe843783          	ld	a5,-24(s0)
    800029da:	853e                	mv	a0,a5
    800029dc:	fffff097          	auipc	ra,0xfffff
    800029e0:	906080e7          	jalr	-1786(ra) # 800012e2 <release>
    return 0;
    800029e4:	4781                	li	a5,0
    800029e6:	a889                	j	80002a38 <allocproc+0x1a8>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    800029e8:	fe843703          	ld	a4,-24(s0)
    800029ec:	6785                	lui	a5,0x1
    800029ee:	2c878793          	addi	a5,a5,712 # 12c8 <_entry-0x7fffed38>
    800029f2:	97ba                	add	a5,a5,a4
    800029f4:	07000613          	li	a2,112
    800029f8:	4581                	li	a1,0
    800029fa:	853e                	mv	a0,a5
    800029fc:	fffff097          	auipc	ra,0xfffff
    80002a00:	a56080e7          	jalr	-1450(ra) # 80001452 <memset>
  p->context.ra = (uint64)forkret;
    80002a04:	00001717          	auipc	a4,0x1
    80002a08:	aee70713          	addi	a4,a4,-1298 # 800034f2 <forkret>
    80002a0c:	fe843683          	ld	a3,-24(s0)
    80002a10:	6785                	lui	a5,0x1
    80002a12:	97b6                	add	a5,a5,a3
    80002a14:	2ce7b423          	sd	a4,712(a5) # 12c8 <_entry-0x7fffed38>
  p->context.sp = p->kstack + PGSIZE;
    80002a18:	fe843703          	ld	a4,-24(s0)
    80002a1c:	6785                	lui	a5,0x1
    80002a1e:	97ba                	add	a5,a5,a4
    80002a20:	2a87b703          	ld	a4,680(a5) # 12a8 <_entry-0x7fffed58>
    80002a24:	6785                	lui	a5,0x1
    80002a26:	973e                	add	a4,a4,a5
    80002a28:	fe843683          	ld	a3,-24(s0)
    80002a2c:	6785                	lui	a5,0x1
    80002a2e:	97b6                	add	a5,a5,a3
    80002a30:	2ce7b823          	sd	a4,720(a5) # 12d0 <_entry-0x7fffed30>

  return p;
    80002a34:	fe843783          	ld	a5,-24(s0)
}
    80002a38:	853e                	mv	a0,a5
    80002a3a:	60e2                	ld	ra,24(sp)
    80002a3c:	6442                	ld	s0,16(sp)
    80002a3e:	6105                	addi	sp,sp,32
    80002a40:	8082                	ret

0000000080002a42 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002a42:	1101                	addi	sp,sp,-32
    80002a44:	ec06                	sd	ra,24(sp)
    80002a46:	e822                	sd	s0,16(sp)
    80002a48:	1000                	addi	s0,sp,32
    80002a4a:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002a4e:	fe843703          	ld	a4,-24(s0)
    80002a52:	6785                	lui	a5,0x1
    80002a54:	97ba                	add	a5,a5,a4
    80002a56:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80002a5a:	cf81                	beqz	a5,80002a72 <freeproc+0x30>
    kfree((void*)p->trapframe);
    80002a5c:	fe843703          	ld	a4,-24(s0)
    80002a60:	6785                	lui	a5,0x1
    80002a62:	97ba                	add	a5,a5,a4
    80002a64:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80002a68:	853e                	mv	a0,a5
    80002a6a:	ffffe097          	auipc	ra,0xffffe
    80002a6e:	61c080e7          	jalr	1564(ra) # 80001086 <kfree>
  p->trapframe = 0;
    80002a72:	fe843703          	ld	a4,-24(s0)
    80002a76:	6785                	lui	a5,0x1
    80002a78:	97ba                	add	a5,a5,a4
    80002a7a:	2c07b023          	sd	zero,704(a5) # 12c0 <_entry-0x7fffed40>
  if(p->pagetable)
    80002a7e:	fe843703          	ld	a4,-24(s0)
    80002a82:	6785                	lui	a5,0x1
    80002a84:	97ba                	add	a5,a5,a4
    80002a86:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    80002a8a:	c39d                	beqz	a5,80002ab0 <freeproc+0x6e>
    proc_freepagetable(p->pagetable, p->sz);
    80002a8c:	fe843703          	ld	a4,-24(s0)
    80002a90:	6785                	lui	a5,0x1
    80002a92:	97ba                	add	a5,a5,a4
    80002a94:	2b87b683          	ld	a3,696(a5) # 12b8 <_entry-0x7fffed48>
    80002a98:	fe843703          	ld	a4,-24(s0)
    80002a9c:	6785                	lui	a5,0x1
    80002a9e:	97ba                	add	a5,a5,a4
    80002aa0:	2b07b783          	ld	a5,688(a5) # 12b0 <_entry-0x7fffed50>
    80002aa4:	85be                	mv	a1,a5
    80002aa6:	8536                	mv	a0,a3
    80002aa8:	00000097          	auipc	ra,0x0
    80002aac:	12c080e7          	jalr	300(ra) # 80002bd4 <proc_freepagetable>
  p->pagetable = 0;
    80002ab0:	fe843703          	ld	a4,-24(s0)
    80002ab4:	6785                	lui	a5,0x1
    80002ab6:	97ba                	add	a5,a5,a4
    80002ab8:	2a07bc23          	sd	zero,696(a5) # 12b8 <_entry-0x7fffed48>
  p->sz = 0;
    80002abc:	fe843703          	ld	a4,-24(s0)
    80002ac0:	6785                	lui	a5,0x1
    80002ac2:	97ba                	add	a5,a5,a4
    80002ac4:	2a07b823          	sd	zero,688(a5) # 12b0 <_entry-0x7fffed50>
  p->pid = 0;
    80002ac8:	fe843783          	ld	a5,-24(s0)
    80002acc:	0207ac23          	sw	zero,56(a5)
  p->parent = 0;
    80002ad0:	fe843783          	ld	a5,-24(s0)
    80002ad4:	0207b023          	sd	zero,32(a5)
  p->name[0] = 0;
    80002ad8:	fe843703          	ld	a4,-24(s0)
    80002adc:	6785                	lui	a5,0x1
    80002ade:	97ba                	add	a5,a5,a4
    80002ae0:	3c078023          	sb	zero,960(a5) # 13c0 <_entry-0x7fffec40>
  p->chan = 0;
    80002ae4:	fe843783          	ld	a5,-24(s0)
    80002ae8:	0207b423          	sd	zero,40(a5)
  p->killed = 0;
    80002aec:	fe843783          	ld	a5,-24(s0)
    80002af0:	0207a823          	sw	zero,48(a5)
  p->xstate = 0;
    80002af4:	fe843783          	ld	a5,-24(s0)
    80002af8:	0207aa23          	sw	zero,52(a5)
  p->state = UNUSED;
    80002afc:	fe843783          	ld	a5,-24(s0)
    80002b00:	0007ac23          	sw	zero,24(a5)
}
    80002b04:	0001                	nop
    80002b06:	60e2                	ld	ra,24(sp)
    80002b08:	6442                	ld	s0,16(sp)
    80002b0a:	6105                	addi	sp,sp,32
    80002b0c:	8082                	ret

0000000080002b0e <proc_pagetable>:

// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002b0e:	7179                	addi	sp,sp,-48
    80002b10:	f406                	sd	ra,40(sp)
    80002b12:	f022                	sd	s0,32(sp)
    80002b14:	1800                	addi	s0,sp,48
    80002b16:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002b1a:	fffff097          	auipc	ra,0xfffff
    80002b1e:	316080e7          	jalr	790(ra) # 80001e30 <uvmcreate>
    80002b22:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002b26:	fe843783          	ld	a5,-24(s0)
    80002b2a:	e399                	bnez	a5,80002b30 <proc_pagetable+0x22>
    return 0;
    80002b2c:	4781                	li	a5,0
    80002b2e:	a871                	j	80002bca <proc_pagetable+0xbc>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002b30:	00007797          	auipc	a5,0x7
    80002b34:	4d078793          	addi	a5,a5,1232 # 8000a000 <_trampoline>
    80002b38:	4729                	li	a4,10
    80002b3a:	86be                	mv	a3,a5
    80002b3c:	6605                	lui	a2,0x1
    80002b3e:	040007b7          	lui	a5,0x4000
    80002b42:	17fd                	addi	a5,a5,-1
    80002b44:	00c79593          	slli	a1,a5,0xc
    80002b48:	fe843503          	ld	a0,-24(s0)
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	11c080e7          	jalr	284(ra) # 80001c68 <mappages>
    80002b54:	87aa                	mv	a5,a0
    80002b56:	0007db63          	bgez	a5,80002b6c <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002b5a:	4581                	li	a1,0
    80002b5c:	fe843503          	ld	a0,-24(s0)
    80002b60:	fffff097          	auipc	ra,0xfffff
    80002b64:	5be080e7          	jalr	1470(ra) # 8000211e <uvmfree>
    return 0;
    80002b68:	4781                	li	a5,0
    80002b6a:	a085                	j	80002bca <proc_pagetable+0xbc>
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002b6c:	fd843703          	ld	a4,-40(s0)
    80002b70:	6785                	lui	a5,0x1
    80002b72:	97ba                	add	a5,a5,a4
    80002b74:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002b78:	4719                	li	a4,6
    80002b7a:	86be                	mv	a3,a5
    80002b7c:	6605                	lui	a2,0x1
    80002b7e:	020007b7          	lui	a5,0x2000
    80002b82:	17fd                	addi	a5,a5,-1
    80002b84:	00d79593          	slli	a1,a5,0xd
    80002b88:	fe843503          	ld	a0,-24(s0)
    80002b8c:	fffff097          	auipc	ra,0xfffff
    80002b90:	0dc080e7          	jalr	220(ra) # 80001c68 <mappages>
    80002b94:	87aa                	mv	a5,a0
    80002b96:	0207d863          	bgez	a5,80002bc6 <proc_pagetable+0xb8>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b9a:	4681                	li	a3,0
    80002b9c:	4605                	li	a2,1
    80002b9e:	040007b7          	lui	a5,0x4000
    80002ba2:	17fd                	addi	a5,a5,-1
    80002ba4:	00c79593          	slli	a1,a5,0xc
    80002ba8:	fe843503          	ld	a0,-24(s0)
    80002bac:	fffff097          	auipc	ra,0xfffff
    80002bb0:	184080e7          	jalr	388(ra) # 80001d30 <uvmunmap>
    uvmfree(pagetable, 0);
    80002bb4:	4581                	li	a1,0
    80002bb6:	fe843503          	ld	a0,-24(s0)
    80002bba:	fffff097          	auipc	ra,0xfffff
    80002bbe:	564080e7          	jalr	1380(ra) # 8000211e <uvmfree>
    return 0;
    80002bc2:	4781                	li	a5,0
    80002bc4:	a019                	j	80002bca <proc_pagetable+0xbc>
  }

  return pagetable;
    80002bc6:	fe843783          	ld	a5,-24(s0)
}
    80002bca:	853e                	mv	a0,a5
    80002bcc:	70a2                	ld	ra,40(sp)
    80002bce:	7402                	ld	s0,32(sp)
    80002bd0:	6145                	addi	sp,sp,48
    80002bd2:	8082                	ret

0000000080002bd4 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002bd4:	1101                	addi	sp,sp,-32
    80002bd6:	ec06                	sd	ra,24(sp)
    80002bd8:	e822                	sd	s0,16(sp)
    80002bda:	1000                	addi	s0,sp,32
    80002bdc:	fea43423          	sd	a0,-24(s0)
    80002be0:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002be4:	4681                	li	a3,0
    80002be6:	4605                	li	a2,1
    80002be8:	040007b7          	lui	a5,0x4000
    80002bec:	17fd                	addi	a5,a5,-1
    80002bee:	00c79593          	slli	a1,a5,0xc
    80002bf2:	fe843503          	ld	a0,-24(s0)
    80002bf6:	fffff097          	auipc	ra,0xfffff
    80002bfa:	13a080e7          	jalr	314(ra) # 80001d30 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002bfe:	4681                	li	a3,0
    80002c00:	4605                	li	a2,1
    80002c02:	020007b7          	lui	a5,0x2000
    80002c06:	17fd                	addi	a5,a5,-1
    80002c08:	00d79593          	slli	a1,a5,0xd
    80002c0c:	fe843503          	ld	a0,-24(s0)
    80002c10:	fffff097          	auipc	ra,0xfffff
    80002c14:	120080e7          	jalr	288(ra) # 80001d30 <uvmunmap>
  uvmfree(pagetable, sz);
    80002c18:	fe043583          	ld	a1,-32(s0)
    80002c1c:	fe843503          	ld	a0,-24(s0)
    80002c20:	fffff097          	auipc	ra,0xfffff
    80002c24:	4fe080e7          	jalr	1278(ra) # 8000211e <uvmfree>
}
    80002c28:	0001                	nop
    80002c2a:	60e2                	ld	ra,24(sp)
    80002c2c:	6442                	ld	s0,16(sp)
    80002c2e:	6105                	addi	sp,sp,32
    80002c30:	8082                	ret

0000000080002c32 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002c32:	1101                	addi	sp,sp,-32
    80002c34:	ec06                	sd	ra,24(sp)
    80002c36:	e822                	sd	s0,16(sp)
    80002c38:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002c3a:	00000097          	auipc	ra,0x0
    80002c3e:	c56080e7          	jalr	-938(ra) # 80002890 <allocproc>
    80002c42:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002c46:	00009797          	auipc	a5,0x9
    80002c4a:	3d278793          	addi	a5,a5,978 # 8000c018 <initproc>
    80002c4e:	fe843703          	ld	a4,-24(s0)
    80002c52:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy init's instructions
  // and data into it.
  uvminit(p->pagetable, initcode, sizeof(initcode));
    80002c54:	fe843703          	ld	a4,-24(s0)
    80002c58:	6785                	lui	a5,0x1
    80002c5a:	97ba                	add	a5,a5,a4
    80002c5c:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    80002c60:	03400613          	li	a2,52
    80002c64:	00009597          	auipc	a1,0x9
    80002c68:	b1458593          	addi	a1,a1,-1260 # 8000b778 <initcode>
    80002c6c:	853e                	mv	a0,a5
    80002c6e:	fffff097          	auipc	ra,0xfffff
    80002c72:	1fe080e7          	jalr	510(ra) # 80001e6c <uvminit>
  p->sz = PGSIZE;
    80002c76:	fe843703          	ld	a4,-24(s0)
    80002c7a:	6785                	lui	a5,0x1
    80002c7c:	97ba                	add	a5,a5,a4
    80002c7e:	6705                	lui	a4,0x1
    80002c80:	2ae7b823          	sd	a4,688(a5) # 12b0 <_entry-0x7fffed50>

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002c84:	fe843703          	ld	a4,-24(s0)
    80002c88:	6785                	lui	a5,0x1
    80002c8a:	97ba                	add	a5,a5,a4
    80002c8c:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80002c90:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002c94:	fe843703          	ld	a4,-24(s0)
    80002c98:	6785                	lui	a5,0x1
    80002c9a:	97ba                	add	a5,a5,a4
    80002c9c:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80002ca0:	6705                	lui	a4,0x1
    80002ca2:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002ca4:	fe843703          	ld	a4,-24(s0)
    80002ca8:	6785                	lui	a5,0x1
    80002caa:	3c078793          	addi	a5,a5,960 # 13c0 <_entry-0x7fffec40>
    80002cae:	97ba                	add	a5,a5,a4
    80002cb0:	4641                	li	a2,16
    80002cb2:	00008597          	auipc	a1,0x8
    80002cb6:	50e58593          	addi	a1,a1,1294 # 8000b1c0 <etext+0x1c0>
    80002cba:	853e                	mv	a0,a5
    80002cbc:	fffff097          	auipc	ra,0xfffff
    80002cc0:	a8c080e7          	jalr	-1396(ra) # 80001748 <safestrcpy>
  p->cwd = namei("/");
    80002cc4:	00008517          	auipc	a0,0x8
    80002cc8:	50c50513          	addi	a0,a0,1292 # 8000b1d0 <etext+0x1d0>
    80002ccc:	00003097          	auipc	ra,0x3
    80002cd0:	45e080e7          	jalr	1118(ra) # 8000612a <namei>
    80002cd4:	86aa                	mv	a3,a0
    80002cd6:	fe843703          	ld	a4,-24(s0)
    80002cda:	6785                	lui	a5,0x1
    80002cdc:	97ba                	add	a5,a5,a4
    80002cde:	3ad7bc23          	sd	a3,952(a5) # 13b8 <_entry-0x7fffec48>

  p->state = RUNNABLE;
    80002ce2:	fe843783          	ld	a5,-24(s0)
    80002ce6:	4709                	li	a4,2
    80002ce8:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002cea:	fe843783          	ld	a5,-24(s0)
    80002cee:	853e                	mv	a0,a5
    80002cf0:	ffffe097          	auipc	ra,0xffffe
    80002cf4:	5f2080e7          	jalr	1522(ra) # 800012e2 <release>
}
    80002cf8:	0001                	nop
    80002cfa:	60e2                	ld	ra,24(sp)
    80002cfc:	6442                	ld	s0,16(sp)
    80002cfe:	6105                	addi	sp,sp,32
    80002d00:	8082                	ret

0000000080002d02 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002d02:	7179                	addi	sp,sp,-48
    80002d04:	f406                	sd	ra,40(sp)
    80002d06:	f022                	sd	s0,32(sp)
    80002d08:	1800                	addi	s0,sp,48
    80002d0a:	87aa                	mv	a5,a0
    80002d0c:	fcf42e23          	sw	a5,-36(s0)
  uint sz;
  struct proc *p = myproc();
    80002d10:	00000097          	auipc	ra,0x0
    80002d14:	ae6080e7          	jalr	-1306(ra) # 800027f6 <myproc>
    80002d18:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002d1c:	fe043703          	ld	a4,-32(s0)
    80002d20:	6785                	lui	a5,0x1
    80002d22:	97ba                	add	a5,a5,a4
    80002d24:	2b07b783          	ld	a5,688(a5) # 12b0 <_entry-0x7fffed50>
    80002d28:	fef42623          	sw	a5,-20(s0)
  if(n > 0){
    80002d2c:	fdc42783          	lw	a5,-36(s0)
    80002d30:	2781                	sext.w	a5,a5
    80002d32:	04f05163          	blez	a5,80002d74 <growproc+0x72>
    if((sz = uvmalloc(p->pagetable, sz, sz + n)) == 0) {
    80002d36:	fe043703          	ld	a4,-32(s0)
    80002d3a:	6785                	lui	a5,0x1
    80002d3c:	97ba                	add	a5,a5,a4
    80002d3e:	2b87b683          	ld	a3,696(a5) # 12b8 <_entry-0x7fffed48>
    80002d42:	fec46583          	lwu	a1,-20(s0)
    80002d46:	fdc42783          	lw	a5,-36(s0)
    80002d4a:	fec42703          	lw	a4,-20(s0)
    80002d4e:	9fb9                	addw	a5,a5,a4
    80002d50:	2781                	sext.w	a5,a5
    80002d52:	1782                	slli	a5,a5,0x20
    80002d54:	9381                	srli	a5,a5,0x20
    80002d56:	863e                	mv	a2,a5
    80002d58:	8536                	mv	a0,a3
    80002d5a:	fffff097          	auipc	ra,0xfffff
    80002d5e:	19a080e7          	jalr	410(ra) # 80001ef4 <uvmalloc>
    80002d62:	87aa                	mv	a5,a0
    80002d64:	fef42623          	sw	a5,-20(s0)
    80002d68:	fec42783          	lw	a5,-20(s0)
    80002d6c:	2781                	sext.w	a5,a5
    80002d6e:	e3a9                	bnez	a5,80002db0 <growproc+0xae>
      return -1;
    80002d70:	57fd                	li	a5,-1
    80002d72:	a881                	j	80002dc2 <growproc+0xc0>
    }
  } else if(n < 0){
    80002d74:	fdc42783          	lw	a5,-36(s0)
    80002d78:	2781                	sext.w	a5,a5
    80002d7a:	0207db63          	bgez	a5,80002db0 <growproc+0xae>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002d7e:	fe043703          	ld	a4,-32(s0)
    80002d82:	6785                	lui	a5,0x1
    80002d84:	97ba                	add	a5,a5,a4
    80002d86:	2b87b683          	ld	a3,696(a5) # 12b8 <_entry-0x7fffed48>
    80002d8a:	fec46583          	lwu	a1,-20(s0)
    80002d8e:	fdc42783          	lw	a5,-36(s0)
    80002d92:	fec42703          	lw	a4,-20(s0)
    80002d96:	9fb9                	addw	a5,a5,a4
    80002d98:	2781                	sext.w	a5,a5
    80002d9a:	1782                	slli	a5,a5,0x20
    80002d9c:	9381                	srli	a5,a5,0x20
    80002d9e:	863e                	mv	a2,a5
    80002da0:	8536                	mv	a0,a3
    80002da2:	fffff097          	auipc	ra,0xfffff
    80002da6:	236080e7          	jalr	566(ra) # 80001fd8 <uvmdealloc>
    80002daa:	87aa                	mv	a5,a0
    80002dac:	fef42623          	sw	a5,-20(s0)
  }
  p->sz = sz;
    80002db0:	fec46703          	lwu	a4,-20(s0)
    80002db4:	fe043683          	ld	a3,-32(s0)
    80002db8:	6785                	lui	a5,0x1
    80002dba:	97b6                	add	a5,a5,a3
    80002dbc:	2ae7b823          	sd	a4,688(a5) # 12b0 <_entry-0x7fffed50>
  return 0;
    80002dc0:	4781                	li	a5,0
}
    80002dc2:	853e                	mv	a0,a5
    80002dc4:	70a2                	ld	ra,40(sp)
    80002dc6:	7402                	ld	s0,32(sp)
    80002dc8:	6145                	addi	sp,sp,48
    80002dca:	8082                	ret

0000000080002dcc <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002dcc:	7179                	addi	sp,sp,-48
    80002dce:	f406                	sd	ra,40(sp)
    80002dd0:	f022                	sd	s0,32(sp)
    80002dd2:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002dd4:	00000097          	auipc	ra,0x0
    80002dd8:	a22080e7          	jalr	-1502(ra) # 800027f6 <myproc>
    80002ddc:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002de0:	00000097          	auipc	ra,0x0
    80002de4:	ab0080e7          	jalr	-1360(ra) # 80002890 <allocproc>
    80002de8:	fca43c23          	sd	a0,-40(s0)
    80002dec:	fd843783          	ld	a5,-40(s0)
    80002df0:	e399                	bnez	a5,80002df6 <fork+0x2a>
    return -1;
    80002df2:	57fd                	li	a5,-1
    80002df4:	a259                	j	80002f7a <fork+0x1ae>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002df6:	fe043703          	ld	a4,-32(s0)
    80002dfa:	6785                	lui	a5,0x1
    80002dfc:	97ba                	add	a5,a5,a4
    80002dfe:	2b87b683          	ld	a3,696(a5) # 12b8 <_entry-0x7fffed48>
    80002e02:	fd843703          	ld	a4,-40(s0)
    80002e06:	6785                	lui	a5,0x1
    80002e08:	97ba                	add	a5,a5,a4
    80002e0a:	2b87b583          	ld	a1,696(a5) # 12b8 <_entry-0x7fffed48>
    80002e0e:	fe043703          	ld	a4,-32(s0)
    80002e12:	6785                	lui	a5,0x1
    80002e14:	97ba                	add	a5,a5,a4
    80002e16:	2b07b783          	ld	a5,688(a5) # 12b0 <_entry-0x7fffed50>
    80002e1a:	863e                	mv	a2,a5
    80002e1c:	8536                	mv	a0,a3
    80002e1e:	fffff097          	auipc	ra,0xfffff
    80002e22:	34a080e7          	jalr	842(ra) # 80002168 <uvmcopy>
    80002e26:	87aa                	mv	a5,a0
    80002e28:	0207d163          	bgez	a5,80002e4a <fork+0x7e>
    freeproc(np);
    80002e2c:	fd843503          	ld	a0,-40(s0)
    80002e30:	00000097          	auipc	ra,0x0
    80002e34:	c12080e7          	jalr	-1006(ra) # 80002a42 <freeproc>
    release(&np->lock);
    80002e38:	fd843783          	ld	a5,-40(s0)
    80002e3c:	853e                	mv	a0,a5
    80002e3e:	ffffe097          	auipc	ra,0xffffe
    80002e42:	4a4080e7          	jalr	1188(ra) # 800012e2 <release>
    return -1;
    80002e46:	57fd                	li	a5,-1
    80002e48:	aa0d                	j	80002f7a <fork+0x1ae>
  }
  np->sz = p->sz;
    80002e4a:	fe043703          	ld	a4,-32(s0)
    80002e4e:	6785                	lui	a5,0x1
    80002e50:	97ba                	add	a5,a5,a4
    80002e52:	2b07b703          	ld	a4,688(a5) # 12b0 <_entry-0x7fffed50>
    80002e56:	fd843683          	ld	a3,-40(s0)
    80002e5a:	6785                	lui	a5,0x1
    80002e5c:	97b6                	add	a5,a5,a3
    80002e5e:	2ae7b823          	sd	a4,688(a5) # 12b0 <_entry-0x7fffed50>

  np->parent = p;
    80002e62:	fd843783          	ld	a5,-40(s0)
    80002e66:	fe043703          	ld	a4,-32(s0)
    80002e6a:	f398                	sd	a4,32(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002e6c:	fe043703          	ld	a4,-32(s0)
    80002e70:	6785                	lui	a5,0x1
    80002e72:	97ba                	add	a5,a5,a4
    80002e74:	2c07b683          	ld	a3,704(a5) # 12c0 <_entry-0x7fffed40>
    80002e78:	fd843703          	ld	a4,-40(s0)
    80002e7c:	6785                	lui	a5,0x1
    80002e7e:	97ba                	add	a5,a5,a4
    80002e80:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80002e84:	873e                	mv	a4,a5
    80002e86:	12000793          	li	a5,288
    80002e8a:	863e                	mv	a2,a5
    80002e8c:	85b6                	mv	a1,a3
    80002e8e:	853a                	mv	a0,a4
    80002e90:	ffffe097          	auipc	ra,0xffffe
    80002e94:	774080e7          	jalr	1908(ra) # 80001604 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002e98:	fd843703          	ld	a4,-40(s0)
    80002e9c:	6785                	lui	a5,0x1
    80002e9e:	97ba                	add	a5,a5,a4
    80002ea0:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80002ea4:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002ea8:	fe042623          	sw	zero,-20(s0)
    80002eac:	a881                	j	80002efc <fork+0x130>
    if(p->ofile[i])
    80002eae:	fe043703          	ld	a4,-32(s0)
    80002eb2:	fec42783          	lw	a5,-20(s0)
    80002eb6:	26678793          	addi	a5,a5,614
    80002eba:	078e                	slli	a5,a5,0x3
    80002ebc:	97ba                	add	a5,a5,a4
    80002ebe:	679c                	ld	a5,8(a5)
    80002ec0:	cb8d                	beqz	a5,80002ef2 <fork+0x126>
      np->ofile[i] = filedup(p->ofile[i]);
    80002ec2:	fe043703          	ld	a4,-32(s0)
    80002ec6:	fec42783          	lw	a5,-20(s0)
    80002eca:	26678793          	addi	a5,a5,614
    80002ece:	078e                	slli	a5,a5,0x3
    80002ed0:	97ba                	add	a5,a5,a4
    80002ed2:	679c                	ld	a5,8(a5)
    80002ed4:	853e                	mv	a0,a5
    80002ed6:	00004097          	auipc	ra,0x4
    80002eda:	bec080e7          	jalr	-1044(ra) # 80006ac2 <filedup>
    80002ede:	86aa                	mv	a3,a0
    80002ee0:	fd843703          	ld	a4,-40(s0)
    80002ee4:	fec42783          	lw	a5,-20(s0)
    80002ee8:	26678793          	addi	a5,a5,614
    80002eec:	078e                	slli	a5,a5,0x3
    80002eee:	97ba                	add	a5,a5,a4
    80002ef0:	e794                	sd	a3,8(a5)
  for(i = 0; i < NOFILE; i++)
    80002ef2:	fec42783          	lw	a5,-20(s0)
    80002ef6:	2785                	addiw	a5,a5,1
    80002ef8:	fef42623          	sw	a5,-20(s0)
    80002efc:	fec42783          	lw	a5,-20(s0)
    80002f00:	0007871b          	sext.w	a4,a5
    80002f04:	47bd                	li	a5,15
    80002f06:	fae7d4e3          	bge	a5,a4,80002eae <fork+0xe2>
  np->cwd = idup(p->cwd);
    80002f0a:	fe043703          	ld	a4,-32(s0)
    80002f0e:	6785                	lui	a5,0x1
    80002f10:	97ba                	add	a5,a5,a4
    80002f12:	3b87b783          	ld	a5,952(a5) # 13b8 <_entry-0x7fffec48>
    80002f16:	853e                	mv	a0,a5
    80002f18:	00002097          	auipc	ra,0x2
    80002f1c:	4be080e7          	jalr	1214(ra) # 800053d6 <idup>
    80002f20:	86aa                	mv	a3,a0
    80002f22:	fd843703          	ld	a4,-40(s0)
    80002f26:	6785                	lui	a5,0x1
    80002f28:	97ba                	add	a5,a5,a4
    80002f2a:	3ad7bc23          	sd	a3,952(a5) # 13b8 <_entry-0x7fffec48>

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002f2e:	fd843703          	ld	a4,-40(s0)
    80002f32:	6785                	lui	a5,0x1
    80002f34:	3c078793          	addi	a5,a5,960 # 13c0 <_entry-0x7fffec40>
    80002f38:	00f706b3          	add	a3,a4,a5
    80002f3c:	fe043703          	ld	a4,-32(s0)
    80002f40:	6785                	lui	a5,0x1
    80002f42:	3c078793          	addi	a5,a5,960 # 13c0 <_entry-0x7fffec40>
    80002f46:	97ba                	add	a5,a5,a4
    80002f48:	4641                	li	a2,16
    80002f4a:	85be                	mv	a1,a5
    80002f4c:	8536                	mv	a0,a3
    80002f4e:	ffffe097          	auipc	ra,0xffffe
    80002f52:	7fa080e7          	jalr	2042(ra) # 80001748 <safestrcpy>

  pid = np->pid;
    80002f56:	fd843783          	ld	a5,-40(s0)
    80002f5a:	5f9c                	lw	a5,56(a5)
    80002f5c:	fcf42a23          	sw	a5,-44(s0)

  np->state = RUNNABLE;
    80002f60:	fd843783          	ld	a5,-40(s0)
    80002f64:	4709                	li	a4,2
    80002f66:	cf98                	sw	a4,24(a5)

  release(&np->lock);
    80002f68:	fd843783          	ld	a5,-40(s0)
    80002f6c:	853e                	mv	a0,a5
    80002f6e:	ffffe097          	auipc	ra,0xffffe
    80002f72:	374080e7          	jalr	884(ra) # 800012e2 <release>

  return pid;
    80002f76:	fd442783          	lw	a5,-44(s0)
}
    80002f7a:	853e                	mv	a0,a5
    80002f7c:	70a2                	ld	ra,40(sp)
    80002f7e:	7402                	ld	s0,32(sp)
    80002f80:	6145                	addi	sp,sp,48
    80002f82:	8082                	ret

0000000080002f84 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold p->lock.
void
reparent(struct proc *p)
{
    80002f84:	7179                	addi	sp,sp,-48
    80002f86:	f406                	sd	ra,40(sp)
    80002f88:	f022                	sd	s0,32(sp)
    80002f8a:	1800                	addi	s0,sp,48
    80002f8c:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002f90:	00011797          	auipc	a5,0x11
    80002f94:	70878793          	addi	a5,a5,1800 # 80014698 <proc>
    80002f98:	fef43423          	sd	a5,-24(s0)
    80002f9c:	a0b1                	j	80002fe8 <reparent+0x64>
    // this code uses pp->parent without holding pp->lock.
    // acquiring the lock first could cause a deadlock
    // if pp or a child of pp were also in exit()
    // and about to try to lock p.
    if(pp->parent == p){
    80002f9e:	fe843783          	ld	a5,-24(s0)
    80002fa2:	739c                	ld	a5,32(a5)
    80002fa4:	fd843703          	ld	a4,-40(s0)
    80002fa8:	02f71863          	bne	a4,a5,80002fd8 <reparent+0x54>
      // pp->parent can't change between the check and the acquire()
      // because only the parent changes it, and we're the parent.
      acquire(&pp->lock);
    80002fac:	fe843783          	ld	a5,-24(s0)
    80002fb0:	853e                	mv	a0,a5
    80002fb2:	ffffe097          	auipc	ra,0xffffe
    80002fb6:	2cc080e7          	jalr	716(ra) # 8000127e <acquire>
      pp->parent = initproc;
    80002fba:	00009797          	auipc	a5,0x9
    80002fbe:	05e78793          	addi	a5,a5,94 # 8000c018 <initproc>
    80002fc2:	6398                	ld	a4,0(a5)
    80002fc4:	fe843783          	ld	a5,-24(s0)
    80002fc8:	f398                	sd	a4,32(a5)
      // we should wake up init here, but that would require
      // initproc->lock, which would be a deadlock, since we hold
      // the lock on one of init's children (pp). this is why
      // exit() always wakes init (before acquiring any locks).
      release(&pp->lock);
    80002fca:	fe843783          	ld	a5,-24(s0)
    80002fce:	853e                	mv	a0,a5
    80002fd0:	ffffe097          	auipc	ra,0xffffe
    80002fd4:	312080e7          	jalr	786(ra) # 800012e2 <release>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002fd8:	fe843703          	ld	a4,-24(s0)
    80002fdc:	6785                	lui	a5,0x1
    80002fde:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    80002fe2:	97ba                	add	a5,a5,a4
    80002fe4:	fef43423          	sd	a5,-24(s0)
    80002fe8:	fe843703          	ld	a4,-24(s0)
    80002fec:	00061797          	auipc	a5,0x61
    80002ff0:	aac78793          	addi	a5,a5,-1364 # 80063a98 <pid_lock>
    80002ff4:	faf765e3          	bltu	a4,a5,80002f9e <reparent+0x1a>
    }
  }
}
    80002ff8:	0001                	nop
    80002ffa:	0001                	nop
    80002ffc:	70a2                	ld	ra,40(sp)
    80002ffe:	7402                	ld	s0,32(sp)
    80003000:	6145                	addi	sp,sp,48
    80003002:	8082                	ret

0000000080003004 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80003004:	7139                	addi	sp,sp,-64
    80003006:	fc06                	sd	ra,56(sp)
    80003008:	f822                	sd	s0,48(sp)
    8000300a:	0080                	addi	s0,sp,64
    8000300c:	87aa                	mv	a5,a0
    8000300e:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003012:	fffff097          	auipc	ra,0xfffff
    80003016:	7e4080e7          	jalr	2020(ra) # 800027f6 <myproc>
    8000301a:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    8000301e:	00009797          	auipc	a5,0x9
    80003022:	ffa78793          	addi	a5,a5,-6 # 8000c018 <initproc>
    80003026:	639c                	ld	a5,0(a5)
    80003028:	fe043703          	ld	a4,-32(s0)
    8000302c:	00f71a63          	bne	a4,a5,80003040 <exit+0x3c>
    panic("init exiting");
    80003030:	00008517          	auipc	a0,0x8
    80003034:	1a850513          	addi	a0,a0,424 # 8000b1d8 <etext+0x1d8>
    80003038:	ffffe097          	auipc	ra,0xffffe
    8000303c:	c18080e7          	jalr	-1000(ra) # 80000c50 <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80003040:	fe042623          	sw	zero,-20(s0)
    80003044:	a899                	j	8000309a <exit+0x96>
    if(p->ofile[fd]){
    80003046:	fe043703          	ld	a4,-32(s0)
    8000304a:	fec42783          	lw	a5,-20(s0)
    8000304e:	26678793          	addi	a5,a5,614
    80003052:	078e                	slli	a5,a5,0x3
    80003054:	97ba                	add	a5,a5,a4
    80003056:	679c                	ld	a5,8(a5)
    80003058:	cf85                	beqz	a5,80003090 <exit+0x8c>
      struct file *f = p->ofile[fd];
    8000305a:	fe043703          	ld	a4,-32(s0)
    8000305e:	fec42783          	lw	a5,-20(s0)
    80003062:	26678793          	addi	a5,a5,614
    80003066:	078e                	slli	a5,a5,0x3
    80003068:	97ba                	add	a5,a5,a4
    8000306a:	679c                	ld	a5,8(a5)
    8000306c:	fcf43823          	sd	a5,-48(s0)
      fileclose(f);
    80003070:	fd043503          	ld	a0,-48(s0)
    80003074:	00004097          	auipc	ra,0x4
    80003078:	ab4080e7          	jalr	-1356(ra) # 80006b28 <fileclose>
      p->ofile[fd] = 0;
    8000307c:	fe043703          	ld	a4,-32(s0)
    80003080:	fec42783          	lw	a5,-20(s0)
    80003084:	26678793          	addi	a5,a5,614
    80003088:	078e                	slli	a5,a5,0x3
    8000308a:	97ba                	add	a5,a5,a4
    8000308c:	0007b423          	sd	zero,8(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80003090:	fec42783          	lw	a5,-20(s0)
    80003094:	2785                	addiw	a5,a5,1
    80003096:	fef42623          	sw	a5,-20(s0)
    8000309a:	fec42783          	lw	a5,-20(s0)
    8000309e:	0007871b          	sext.w	a4,a5
    800030a2:	47bd                	li	a5,15
    800030a4:	fae7d1e3          	bge	a5,a4,80003046 <exit+0x42>
    }
  }

  begin_op();
    800030a8:	00003097          	auipc	ra,0x3
    800030ac:	3e6080e7          	jalr	998(ra) # 8000648e <begin_op>
  iput(p->cwd);
    800030b0:	fe043703          	ld	a4,-32(s0)
    800030b4:	6785                	lui	a5,0x1
    800030b6:	97ba                	add	a5,a5,a4
    800030b8:	3b87b783          	ld	a5,952(a5) # 13b8 <_entry-0x7fffec48>
    800030bc:	853e                	mv	a0,a5
    800030be:	00002097          	auipc	ra,0x2
    800030c2:	4f2080e7          	jalr	1266(ra) # 800055b0 <iput>
  end_op();
    800030c6:	00003097          	auipc	ra,0x3
    800030ca:	48a080e7          	jalr	1162(ra) # 80006550 <end_op>
  p->cwd = 0;
    800030ce:	fe043703          	ld	a4,-32(s0)
    800030d2:	6785                	lui	a5,0x1
    800030d4:	97ba                	add	a5,a5,a4
    800030d6:	3a07bc23          	sd	zero,952(a5) # 13b8 <_entry-0x7fffec48>
  // we might re-parent a child to init. we can't be precise about
  // waking up init, since we can't acquire its lock once we've
  // acquired any other proc lock. so wake up init whether that's
  // necessary or not. init may miss this wakeup, but that seems
  // harmless.
  acquire(&initproc->lock);
    800030da:	00009797          	auipc	a5,0x9
    800030de:	f3e78793          	addi	a5,a5,-194 # 8000c018 <initproc>
    800030e2:	639c                	ld	a5,0(a5)
    800030e4:	853e                	mv	a0,a5
    800030e6:	ffffe097          	auipc	ra,0xffffe
    800030ea:	198080e7          	jalr	408(ra) # 8000127e <acquire>
  wakeup1(initproc);
    800030ee:	00009797          	auipc	a5,0x9
    800030f2:	f2a78793          	addi	a5,a5,-214 # 8000c018 <initproc>
    800030f6:	639c                	ld	a5,0(a5)
    800030f8:	853e                	mv	a0,a5
    800030fa:	00000097          	auipc	ra,0x0
    800030fe:	562080e7          	jalr	1378(ra) # 8000365c <wakeup1>
  release(&initproc->lock);
    80003102:	00009797          	auipc	a5,0x9
    80003106:	f1678793          	addi	a5,a5,-234 # 8000c018 <initproc>
    8000310a:	639c                	ld	a5,0(a5)
    8000310c:	853e                	mv	a0,a5
    8000310e:	ffffe097          	auipc	ra,0xffffe
    80003112:	1d4080e7          	jalr	468(ra) # 800012e2 <release>
  // parent we locked. in case our parent gives us away to init while
  // we're waiting for the parent lock. we may then race with an
  // exiting parent, but the result will be a harmless spurious wakeup
  // to a dead or wrong process; proc structs are never re-allocated
  // as anything else.
  acquire(&p->lock);
    80003116:	fe043783          	ld	a5,-32(s0)
    8000311a:	853e                	mv	a0,a5
    8000311c:	ffffe097          	auipc	ra,0xffffe
    80003120:	162080e7          	jalr	354(ra) # 8000127e <acquire>
  struct proc *original_parent = p->parent;
    80003124:	fe043783          	ld	a5,-32(s0)
    80003128:	739c                	ld	a5,32(a5)
    8000312a:	fcf43c23          	sd	a5,-40(s0)
  release(&p->lock);
    8000312e:	fe043783          	ld	a5,-32(s0)
    80003132:	853e                	mv	a0,a5
    80003134:	ffffe097          	auipc	ra,0xffffe
    80003138:	1ae080e7          	jalr	430(ra) # 800012e2 <release>
  
  // we need the parent's lock in order to wake it up from wait().
  // the parent-then-child rule says we have to lock it first.
  acquire(&original_parent->lock);
    8000313c:	fd843783          	ld	a5,-40(s0)
    80003140:	853e                	mv	a0,a5
    80003142:	ffffe097          	auipc	ra,0xffffe
    80003146:	13c080e7          	jalr	316(ra) # 8000127e <acquire>

  acquire(&p->lock);
    8000314a:	fe043783          	ld	a5,-32(s0)
    8000314e:	853e                	mv	a0,a5
    80003150:	ffffe097          	auipc	ra,0xffffe
    80003154:	12e080e7          	jalr	302(ra) # 8000127e <acquire>

  // Give any children to init.
  reparent(p);
    80003158:	fe043503          	ld	a0,-32(s0)
    8000315c:	00000097          	auipc	ra,0x0
    80003160:	e28080e7          	jalr	-472(ra) # 80002f84 <reparent>

  // Parent might be sleeping in wait().
  wakeup1(original_parent);
    80003164:	fd843503          	ld	a0,-40(s0)
    80003168:	00000097          	auipc	ra,0x0
    8000316c:	4f4080e7          	jalr	1268(ra) # 8000365c <wakeup1>

  p->xstate = status;
    80003170:	fe043783          	ld	a5,-32(s0)
    80003174:	fcc42703          	lw	a4,-52(s0)
    80003178:	dbd8                	sw	a4,52(a5)
  p->state = ZOMBIE;
    8000317a:	fe043783          	ld	a5,-32(s0)
    8000317e:	4711                	li	a4,4
    80003180:	cf98                	sw	a4,24(a5)

  release(&original_parent->lock);
    80003182:	fd843783          	ld	a5,-40(s0)
    80003186:	853e                	mv	a0,a5
    80003188:	ffffe097          	auipc	ra,0xffffe
    8000318c:	15a080e7          	jalr	346(ra) # 800012e2 <release>

  // Jump into the scheduler, never to return.
  sched();
    80003190:	00000097          	auipc	ra,0x0
    80003194:	230080e7          	jalr	560(ra) # 800033c0 <sched>
  panic("zombie exit");
    80003198:	00008517          	auipc	a0,0x8
    8000319c:	05050513          	addi	a0,a0,80 # 8000b1e8 <etext+0x1e8>
    800031a0:	ffffe097          	auipc	ra,0xffffe
    800031a4:	ab0080e7          	jalr	-1360(ra) # 80000c50 <panic>

00000000800031a8 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    800031a8:	7139                	addi	sp,sp,-64
    800031aa:	fc06                	sd	ra,56(sp)
    800031ac:	f822                	sd	s0,48(sp)
    800031ae:	0080                	addi	s0,sp,64
    800031b0:	fca43423          	sd	a0,-56(s0)
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    800031b4:	fffff097          	auipc	ra,0xfffff
    800031b8:	642080e7          	jalr	1602(ra) # 800027f6 <myproc>
    800031bc:	fca43c23          	sd	a0,-40(s0)

  // hold p->lock for the whole time to avoid lost
  // wakeups from a child's exit().
  acquire(&p->lock);
    800031c0:	fd843783          	ld	a5,-40(s0)
    800031c4:	853e                	mv	a0,a5
    800031c6:	ffffe097          	auipc	ra,0xffffe
    800031ca:	0b8080e7          	jalr	184(ra) # 8000127e <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    800031ce:	fe042223          	sw	zero,-28(s0)
    for(np = proc; np < &proc[NPROC]; np++){
    800031d2:	00011797          	auipc	a5,0x11
    800031d6:	4c678793          	addi	a5,a5,1222 # 80014698 <proc>
    800031da:	fef43423          	sd	a5,-24(s0)
    800031de:	a8e9                	j	800032b8 <wait+0x110>
      // this code uses np->parent without holding np->lock.
      // acquiring the lock first would cause a deadlock,
      // since np might be an ancestor, and we already hold p->lock.
      if(np->parent == p){
    800031e0:	fe843783          	ld	a5,-24(s0)
    800031e4:	739c                	ld	a5,32(a5)
    800031e6:	fd843703          	ld	a4,-40(s0)
    800031ea:	0af71f63          	bne	a4,a5,800032a8 <wait+0x100>
        // np->parent can't change between the check and the acquire()
        // because only the parent changes it, and we're the parent.
        acquire(&np->lock);
    800031ee:	fe843783          	ld	a5,-24(s0)
    800031f2:	853e                	mv	a0,a5
    800031f4:	ffffe097          	auipc	ra,0xffffe
    800031f8:	08a080e7          	jalr	138(ra) # 8000127e <acquire>
        havekids = 1;
    800031fc:	4785                	li	a5,1
    800031fe:	fef42223          	sw	a5,-28(s0)
        if(np->state == ZOMBIE){
    80003202:	fe843783          	ld	a5,-24(s0)
    80003206:	4f9c                	lw	a5,24(a5)
    80003208:	873e                	mv	a4,a5
    8000320a:	4791                	li	a5,4
    8000320c:	08f71763          	bne	a4,a5,8000329a <wait+0xf2>
          // Found one.
          pid = np->pid;
    80003210:	fe843783          	ld	a5,-24(s0)
    80003214:	5f9c                	lw	a5,56(a5)
    80003216:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&np->xstate,
    8000321a:	fc843783          	ld	a5,-56(s0)
    8000321e:	c7b9                	beqz	a5,8000326c <wait+0xc4>
    80003220:	fd843703          	ld	a4,-40(s0)
    80003224:	6785                	lui	a5,0x1
    80003226:	97ba                	add	a5,a5,a4
    80003228:	2b87b703          	ld	a4,696(a5) # 12b8 <_entry-0x7fffed48>
    8000322c:	fe843783          	ld	a5,-24(s0)
    80003230:	03478793          	addi	a5,a5,52
    80003234:	4691                	li	a3,4
    80003236:	863e                	mv	a2,a5
    80003238:	fc843583          	ld	a1,-56(s0)
    8000323c:	853a                	mv	a0,a4
    8000323e:	fffff097          	auipc	ra,0xfffff
    80003242:	094080e7          	jalr	148(ra) # 800022d2 <copyout>
    80003246:	87aa                	mv	a5,a0
    80003248:	0207d263          	bgez	a5,8000326c <wait+0xc4>
                                  sizeof(np->xstate)) < 0) {
            release(&np->lock);
    8000324c:	fe843783          	ld	a5,-24(s0)
    80003250:	853e                	mv	a0,a5
    80003252:	ffffe097          	auipc	ra,0xffffe
    80003256:	090080e7          	jalr	144(ra) # 800012e2 <release>
            release(&p->lock);
    8000325a:	fd843783          	ld	a5,-40(s0)
    8000325e:	853e                	mv	a0,a5
    80003260:	ffffe097          	auipc	ra,0xffffe
    80003264:	082080e7          	jalr	130(ra) # 800012e2 <release>
            return -1;
    80003268:	57fd                	li	a5,-1
    8000326a:	a851                	j	800032fe <wait+0x156>
          }
          freeproc(np);
    8000326c:	fe843503          	ld	a0,-24(s0)
    80003270:	fffff097          	auipc	ra,0xfffff
    80003274:	7d2080e7          	jalr	2002(ra) # 80002a42 <freeproc>
          release(&np->lock);
    80003278:	fe843783          	ld	a5,-24(s0)
    8000327c:	853e                	mv	a0,a5
    8000327e:	ffffe097          	auipc	ra,0xffffe
    80003282:	064080e7          	jalr	100(ra) # 800012e2 <release>
          release(&p->lock);
    80003286:	fd843783          	ld	a5,-40(s0)
    8000328a:	853e                	mv	a0,a5
    8000328c:	ffffe097          	auipc	ra,0xffffe
    80003290:	056080e7          	jalr	86(ra) # 800012e2 <release>
          return pid;
    80003294:	fd442783          	lw	a5,-44(s0)
    80003298:	a09d                	j	800032fe <wait+0x156>
        }
        release(&np->lock);
    8000329a:	fe843783          	ld	a5,-24(s0)
    8000329e:	853e                	mv	a0,a5
    800032a0:	ffffe097          	auipc	ra,0xffffe
    800032a4:	042080e7          	jalr	66(ra) # 800012e2 <release>
    for(np = proc; np < &proc[NPROC]; np++){
    800032a8:	fe843703          	ld	a4,-24(s0)
    800032ac:	6785                	lui	a5,0x1
    800032ae:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    800032b2:	97ba                	add	a5,a5,a4
    800032b4:	fef43423          	sd	a5,-24(s0)
    800032b8:	fe843703          	ld	a4,-24(s0)
    800032bc:	00060797          	auipc	a5,0x60
    800032c0:	7dc78793          	addi	a5,a5,2012 # 80063a98 <pid_lock>
    800032c4:	f0f76ee3          	bltu	a4,a5,800031e0 <wait+0x38>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || p->killed){
    800032c8:	fe442783          	lw	a5,-28(s0)
    800032cc:	2781                	sext.w	a5,a5
    800032ce:	c789                	beqz	a5,800032d8 <wait+0x130>
    800032d0:	fd843783          	ld	a5,-40(s0)
    800032d4:	5b9c                	lw	a5,48(a5)
    800032d6:	cb91                	beqz	a5,800032ea <wait+0x142>
      release(&p->lock);
    800032d8:	fd843783          	ld	a5,-40(s0)
    800032dc:	853e                	mv	a0,a5
    800032de:	ffffe097          	auipc	ra,0xffffe
    800032e2:	004080e7          	jalr	4(ra) # 800012e2 <release>
      return -1;
    800032e6:	57fd                	li	a5,-1
    800032e8:	a819                	j	800032fe <wait+0x156>
    }
    
    // Wait for a child to exit.
    sleep(p, &p->lock);  //DOC: wait-sleep
    800032ea:	fd843783          	ld	a5,-40(s0)
    800032ee:	85be                	mv	a1,a5
    800032f0:	fd843503          	ld	a0,-40(s0)
    800032f4:	00000097          	auipc	ra,0x0
    800032f8:	24e080e7          	jalr	590(ra) # 80003542 <sleep>
    havekids = 0;
    800032fc:	bdc9                	j	800031ce <wait+0x26>
  }
}
    800032fe:	853e                	mv	a0,a5
    80003300:	70e2                	ld	ra,56(sp)
    80003302:	7442                	ld	s0,48(sp)
    80003304:	6121                	addi	sp,sp,64
    80003306:	8082                	ret

0000000080003308 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    80003308:	1101                	addi	sp,sp,-32
    8000330a:	ec06                	sd	ra,24(sp)
    8000330c:	e822                	sd	s0,16(sp)
    8000330e:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003310:	fffff097          	auipc	ra,0xfffff
    80003314:	4ac080e7          	jalr	1196(ra) # 800027bc <mycpu>
    80003318:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    8000331c:	fe043783          	ld	a5,-32(s0)
    80003320:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    80003324:	fffff097          	auipc	ra,0xfffff
    80003328:	28c080e7          	jalr	652(ra) # 800025b0 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    8000332c:	00011797          	auipc	a5,0x11
    80003330:	36c78793          	addi	a5,a5,876 # 80014698 <proc>
    80003334:	fef43423          	sd	a5,-24(s0)
    80003338:	a89d                	j	800033ae <scheduler+0xa6>
      acquire(&p->lock);
    8000333a:	fe843783          	ld	a5,-24(s0)
    8000333e:	853e                	mv	a0,a5
    80003340:	ffffe097          	auipc	ra,0xffffe
    80003344:	f3e080e7          	jalr	-194(ra) # 8000127e <acquire>
      if(p->state == RUNNABLE) {
    80003348:	fe843783          	ld	a5,-24(s0)
    8000334c:	4f9c                	lw	a5,24(a5)
    8000334e:	873e                	mv	a4,a5
    80003350:	4789                	li	a5,2
    80003352:	02f71f63          	bne	a4,a5,80003390 <scheduler+0x88>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    80003356:	fe843783          	ld	a5,-24(s0)
    8000335a:	470d                	li	a4,3
    8000335c:	cf98                	sw	a4,24(a5)
        c->proc = p;
    8000335e:	fe043783          	ld	a5,-32(s0)
    80003362:	fe843703          	ld	a4,-24(s0)
    80003366:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    80003368:	fe043783          	ld	a5,-32(s0)
    8000336c:	00878693          	addi	a3,a5,8
    80003370:	fe843703          	ld	a4,-24(s0)
    80003374:	6785                	lui	a5,0x1
    80003376:	2c878793          	addi	a5,a5,712 # 12c8 <_entry-0x7fffed38>
    8000337a:	97ba                	add	a5,a5,a4
    8000337c:	85be                	mv	a1,a5
    8000337e:	8536                	mv	a0,a3
    80003380:	00000097          	auipc	ra,0x0
    80003384:	5b8080e7          	jalr	1464(ra) # 80003938 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    80003388:	fe043783          	ld	a5,-32(s0)
    8000338c:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    80003390:	fe843783          	ld	a5,-24(s0)
    80003394:	853e                	mv	a0,a5
    80003396:	ffffe097          	auipc	ra,0xffffe
    8000339a:	f4c080e7          	jalr	-180(ra) # 800012e2 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    8000339e:	fe843703          	ld	a4,-24(s0)
    800033a2:	6785                	lui	a5,0x1
    800033a4:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    800033a8:	97ba                	add	a5,a5,a4
    800033aa:	fef43423          	sd	a5,-24(s0)
    800033ae:	fe843703          	ld	a4,-24(s0)
    800033b2:	00060797          	auipc	a5,0x60
    800033b6:	6e678793          	addi	a5,a5,1766 # 80063a98 <pid_lock>
    800033ba:	f8f760e3          	bltu	a4,a5,8000333a <scheduler+0x32>
    intr_on();
    800033be:	b79d                	j	80003324 <scheduler+0x1c>

00000000800033c0 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800033c0:	7179                	addi	sp,sp,-48
    800033c2:	f406                	sd	ra,40(sp)
    800033c4:	f022                	sd	s0,32(sp)
    800033c6:	ec26                	sd	s1,24(sp)
    800033c8:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    800033ca:	fffff097          	auipc	ra,0xfffff
    800033ce:	42c080e7          	jalr	1068(ra) # 800027f6 <myproc>
    800033d2:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    800033d6:	fd843783          	ld	a5,-40(s0)
    800033da:	853e                	mv	a0,a5
    800033dc:	ffffe097          	auipc	ra,0xffffe
    800033e0:	f5c080e7          	jalr	-164(ra) # 80001338 <holding>
    800033e4:	87aa                	mv	a5,a0
    800033e6:	eb89                	bnez	a5,800033f8 <sched+0x38>
    panic("sched p->lock");
    800033e8:	00008517          	auipc	a0,0x8
    800033ec:	e1050513          	addi	a0,a0,-496 # 8000b1f8 <etext+0x1f8>
    800033f0:	ffffe097          	auipc	ra,0xffffe
    800033f4:	860080e7          	jalr	-1952(ra) # 80000c50 <panic>
  if(mycpu()->noff != 1)
    800033f8:	fffff097          	auipc	ra,0xfffff
    800033fc:	3c4080e7          	jalr	964(ra) # 800027bc <mycpu>
    80003400:	87aa                	mv	a5,a0
    80003402:	5fbc                	lw	a5,120(a5)
    80003404:	873e                	mv	a4,a5
    80003406:	4785                	li	a5,1
    80003408:	00f70a63          	beq	a4,a5,8000341c <sched+0x5c>
    panic("sched locks");
    8000340c:	00008517          	auipc	a0,0x8
    80003410:	dfc50513          	addi	a0,a0,-516 # 8000b208 <etext+0x208>
    80003414:	ffffe097          	auipc	ra,0xffffe
    80003418:	83c080e7          	jalr	-1988(ra) # 80000c50 <panic>
  if(p->state == RUNNING)
    8000341c:	fd843783          	ld	a5,-40(s0)
    80003420:	4f9c                	lw	a5,24(a5)
    80003422:	873e                	mv	a4,a5
    80003424:	478d                	li	a5,3
    80003426:	00f71a63          	bne	a4,a5,8000343a <sched+0x7a>
    panic("sched running");
    8000342a:	00008517          	auipc	a0,0x8
    8000342e:	dee50513          	addi	a0,a0,-530 # 8000b218 <etext+0x218>
    80003432:	ffffe097          	auipc	ra,0xffffe
    80003436:	81e080e7          	jalr	-2018(ra) # 80000c50 <panic>
  if(intr_get())
    8000343a:	fffff097          	auipc	ra,0xfffff
    8000343e:	1a0080e7          	jalr	416(ra) # 800025da <intr_get>
    80003442:	87aa                	mv	a5,a0
    80003444:	cb89                	beqz	a5,80003456 <sched+0x96>
    panic("sched interruptible");
    80003446:	00008517          	auipc	a0,0x8
    8000344a:	de250513          	addi	a0,a0,-542 # 8000b228 <etext+0x228>
    8000344e:	ffffe097          	auipc	ra,0xffffe
    80003452:	802080e7          	jalr	-2046(ra) # 80000c50 <panic>

  intena = mycpu()->intena;
    80003456:	fffff097          	auipc	ra,0xfffff
    8000345a:	366080e7          	jalr	870(ra) # 800027bc <mycpu>
    8000345e:	87aa                	mv	a5,a0
    80003460:	5ffc                	lw	a5,124(a5)
    80003462:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    80003466:	fd843703          	ld	a4,-40(s0)
    8000346a:	6785                	lui	a5,0x1
    8000346c:	2c878793          	addi	a5,a5,712 # 12c8 <_entry-0x7fffed38>
    80003470:	00f704b3          	add	s1,a4,a5
    80003474:	fffff097          	auipc	ra,0xfffff
    80003478:	348080e7          	jalr	840(ra) # 800027bc <mycpu>
    8000347c:	87aa                	mv	a5,a0
    8000347e:	07a1                	addi	a5,a5,8
    80003480:	85be                	mv	a1,a5
    80003482:	8526                	mv	a0,s1
    80003484:	00000097          	auipc	ra,0x0
    80003488:	4b4080e7          	jalr	1204(ra) # 80003938 <swtch>
  mycpu()->intena = intena;
    8000348c:	fffff097          	auipc	ra,0xfffff
    80003490:	330080e7          	jalr	816(ra) # 800027bc <mycpu>
    80003494:	872a                	mv	a4,a0
    80003496:	fd442783          	lw	a5,-44(s0)
    8000349a:	df7c                	sw	a5,124(a4)
}
    8000349c:	0001                	nop
    8000349e:	70a2                	ld	ra,40(sp)
    800034a0:	7402                	ld	s0,32(sp)
    800034a2:	64e2                	ld	s1,24(sp)
    800034a4:	6145                	addi	sp,sp,48
    800034a6:	8082                	ret

00000000800034a8 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800034a8:	1101                	addi	sp,sp,-32
    800034aa:	ec06                	sd	ra,24(sp)
    800034ac:	e822                	sd	s0,16(sp)
    800034ae:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800034b0:	fffff097          	auipc	ra,0xfffff
    800034b4:	346080e7          	jalr	838(ra) # 800027f6 <myproc>
    800034b8:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800034bc:	fe843783          	ld	a5,-24(s0)
    800034c0:	853e                	mv	a0,a5
    800034c2:	ffffe097          	auipc	ra,0xffffe
    800034c6:	dbc080e7          	jalr	-580(ra) # 8000127e <acquire>
  p->state = RUNNABLE;
    800034ca:	fe843783          	ld	a5,-24(s0)
    800034ce:	4709                	li	a4,2
    800034d0:	cf98                	sw	a4,24(a5)
  sched();
    800034d2:	00000097          	auipc	ra,0x0
    800034d6:	eee080e7          	jalr	-274(ra) # 800033c0 <sched>
  release(&p->lock);
    800034da:	fe843783          	ld	a5,-24(s0)
    800034de:	853e                	mv	a0,a5
    800034e0:	ffffe097          	auipc	ra,0xffffe
    800034e4:	e02080e7          	jalr	-510(ra) # 800012e2 <release>
}
    800034e8:	0001                	nop
    800034ea:	60e2                	ld	ra,24(sp)
    800034ec:	6442                	ld	s0,16(sp)
    800034ee:	6105                	addi	sp,sp,32
    800034f0:	8082                	ret

00000000800034f2 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    800034f2:	1141                	addi	sp,sp,-16
    800034f4:	e406                	sd	ra,8(sp)
    800034f6:	e022                	sd	s0,0(sp)
    800034f8:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    800034fa:	fffff097          	auipc	ra,0xfffff
    800034fe:	2fc080e7          	jalr	764(ra) # 800027f6 <myproc>
    80003502:	87aa                	mv	a5,a0
    80003504:	853e                	mv	a0,a5
    80003506:	ffffe097          	auipc	ra,0xffffe
    8000350a:	ddc080e7          	jalr	-548(ra) # 800012e2 <release>

  if (first) {
    8000350e:	00008797          	auipc	a5,0x8
    80003512:	24678793          	addi	a5,a5,582 # 8000b754 <first.1683>
    80003516:	439c                	lw	a5,0(a5)
    80003518:	cf81                	beqz	a5,80003530 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    8000351a:	00008797          	auipc	a5,0x8
    8000351e:	23a78793          	addi	a5,a5,570 # 8000b754 <first.1683>
    80003522:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    80003526:	4505                	li	a0,1
    80003528:	00001097          	auipc	ra,0x1
    8000352c:	788080e7          	jalr	1928(ra) # 80004cb0 <fsinit>
  }

  usertrapret();
    80003530:	00000097          	auipc	ra,0x0
    80003534:	7fa080e7          	jalr	2042(ra) # 80003d2a <usertrapret>
}
    80003538:	0001                	nop
    8000353a:	60a2                	ld	ra,8(sp)
    8000353c:	6402                	ld	s0,0(sp)
    8000353e:	0141                	addi	sp,sp,16
    80003540:	8082                	ret

0000000080003542 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003542:	7179                	addi	sp,sp,-48
    80003544:	f406                	sd	ra,40(sp)
    80003546:	f022                	sd	s0,32(sp)
    80003548:	1800                	addi	s0,sp,48
    8000354a:	fca43c23          	sd	a0,-40(s0)
    8000354e:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003552:	fffff097          	auipc	ra,0xfffff
    80003556:	2a4080e7          	jalr	676(ra) # 800027f6 <myproc>
    8000355a:	fea43423          	sd	a0,-24(s0)
  // change p->state and then call sched.
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.
  if(lk != &p->lock){  //DOC: sleeplock0
    8000355e:	fe843783          	ld	a5,-24(s0)
    80003562:	fd043703          	ld	a4,-48(s0)
    80003566:	00f70f63          	beq	a4,a5,80003584 <sleep+0x42>
    acquire(&p->lock);  //DOC: sleeplock1
    8000356a:	fe843783          	ld	a5,-24(s0)
    8000356e:	853e                	mv	a0,a5
    80003570:	ffffe097          	auipc	ra,0xffffe
    80003574:	d0e080e7          	jalr	-754(ra) # 8000127e <acquire>
    release(lk);
    80003578:	fd043503          	ld	a0,-48(s0)
    8000357c:	ffffe097          	auipc	ra,0xffffe
    80003580:	d66080e7          	jalr	-666(ra) # 800012e2 <release>
  }

  // Go to sleep.
  p->chan = chan;
    80003584:	fe843783          	ld	a5,-24(s0)
    80003588:	fd843703          	ld	a4,-40(s0)
    8000358c:	f798                	sd	a4,40(a5)
  p->state = SLEEPING;
    8000358e:	fe843783          	ld	a5,-24(s0)
    80003592:	4705                	li	a4,1
    80003594:	cf98                	sw	a4,24(a5)

  sched();
    80003596:	00000097          	auipc	ra,0x0
    8000359a:	e2a080e7          	jalr	-470(ra) # 800033c0 <sched>

  // Tidy up.
  p->chan = 0;
    8000359e:	fe843783          	ld	a5,-24(s0)
    800035a2:	0207b423          	sd	zero,40(a5)

  // Reacquire original lock.
  if(lk != &p->lock){
    800035a6:	fe843783          	ld	a5,-24(s0)
    800035aa:	fd043703          	ld	a4,-48(s0)
    800035ae:	00f70f63          	beq	a4,a5,800035cc <sleep+0x8a>
    release(&p->lock);
    800035b2:	fe843783          	ld	a5,-24(s0)
    800035b6:	853e                	mv	a0,a5
    800035b8:	ffffe097          	auipc	ra,0xffffe
    800035bc:	d2a080e7          	jalr	-726(ra) # 800012e2 <release>
    acquire(lk);
    800035c0:	fd043503          	ld	a0,-48(s0)
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	cba080e7          	jalr	-838(ra) # 8000127e <acquire>
  }
}
    800035cc:	0001                	nop
    800035ce:	70a2                	ld	ra,40(sp)
    800035d0:	7402                	ld	s0,32(sp)
    800035d2:	6145                	addi	sp,sp,48
    800035d4:	8082                	ret

00000000800035d6 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800035d6:	7179                	addi	sp,sp,-48
    800035d8:	f406                	sd	ra,40(sp)
    800035da:	f022                	sd	s0,32(sp)
    800035dc:	1800                	addi	s0,sp,48
    800035de:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800035e2:	00011797          	auipc	a5,0x11
    800035e6:	0b678793          	addi	a5,a5,182 # 80014698 <proc>
    800035ea:	fef43423          	sd	a5,-24(s0)
    800035ee:	a889                	j	80003640 <wakeup+0x6a>
    acquire(&p->lock);
    800035f0:	fe843783          	ld	a5,-24(s0)
    800035f4:	853e                	mv	a0,a5
    800035f6:	ffffe097          	auipc	ra,0xffffe
    800035fa:	c88080e7          	jalr	-888(ra) # 8000127e <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    800035fe:	fe843783          	ld	a5,-24(s0)
    80003602:	4f9c                	lw	a5,24(a5)
    80003604:	873e                	mv	a4,a5
    80003606:	4785                	li	a5,1
    80003608:	00f71d63          	bne	a4,a5,80003622 <wakeup+0x4c>
    8000360c:	fe843783          	ld	a5,-24(s0)
    80003610:	779c                	ld	a5,40(a5)
    80003612:	fd843703          	ld	a4,-40(s0)
    80003616:	00f71663          	bne	a4,a5,80003622 <wakeup+0x4c>
      p->state = RUNNABLE;
    8000361a:	fe843783          	ld	a5,-24(s0)
    8000361e:	4709                	li	a4,2
    80003620:	cf98                	sw	a4,24(a5)
    }
    release(&p->lock);
    80003622:	fe843783          	ld	a5,-24(s0)
    80003626:	853e                	mv	a0,a5
    80003628:	ffffe097          	auipc	ra,0xffffe
    8000362c:	cba080e7          	jalr	-838(ra) # 800012e2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80003630:	fe843703          	ld	a4,-24(s0)
    80003634:	6785                	lui	a5,0x1
    80003636:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    8000363a:	97ba                	add	a5,a5,a4
    8000363c:	fef43423          	sd	a5,-24(s0)
    80003640:	fe843703          	ld	a4,-24(s0)
    80003644:	00060797          	auipc	a5,0x60
    80003648:	45478793          	addi	a5,a5,1108 # 80063a98 <pid_lock>
    8000364c:	faf762e3          	bltu	a4,a5,800035f0 <wakeup+0x1a>
  }
}
    80003650:	0001                	nop
    80003652:	0001                	nop
    80003654:	70a2                	ld	ra,40(sp)
    80003656:	7402                	ld	s0,32(sp)
    80003658:	6145                	addi	sp,sp,48
    8000365a:	8082                	ret

000000008000365c <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    8000365c:	1101                	addi	sp,sp,-32
    8000365e:	ec06                	sd	ra,24(sp)
    80003660:	e822                	sd	s0,16(sp)
    80003662:	1000                	addi	s0,sp,32
    80003664:	fea43423          	sd	a0,-24(s0)
  if(!holding(&p->lock))
    80003668:	fe843783          	ld	a5,-24(s0)
    8000366c:	853e                	mv	a0,a5
    8000366e:	ffffe097          	auipc	ra,0xffffe
    80003672:	cca080e7          	jalr	-822(ra) # 80001338 <holding>
    80003676:	87aa                	mv	a5,a0
    80003678:	eb89                	bnez	a5,8000368a <wakeup1+0x2e>
    panic("wakeup1");
    8000367a:	00008517          	auipc	a0,0x8
    8000367e:	bc650513          	addi	a0,a0,-1082 # 8000b240 <etext+0x240>
    80003682:	ffffd097          	auipc	ra,0xffffd
    80003686:	5ce080e7          	jalr	1486(ra) # 80000c50 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    8000368a:	fe843783          	ld	a5,-24(s0)
    8000368e:	779c                	ld	a5,40(a5)
    80003690:	fe843703          	ld	a4,-24(s0)
    80003694:	00f71d63          	bne	a4,a5,800036ae <wakeup1+0x52>
    80003698:	fe843783          	ld	a5,-24(s0)
    8000369c:	4f9c                	lw	a5,24(a5)
    8000369e:	873e                	mv	a4,a5
    800036a0:	4785                	li	a5,1
    800036a2:	00f71663          	bne	a4,a5,800036ae <wakeup1+0x52>
    p->state = RUNNABLE;
    800036a6:	fe843783          	ld	a5,-24(s0)
    800036aa:	4709                	li	a4,2
    800036ac:	cf98                	sw	a4,24(a5)
  }
}
    800036ae:	0001                	nop
    800036b0:	60e2                	ld	ra,24(sp)
    800036b2:	6442                	ld	s0,16(sp)
    800036b4:	6105                	addi	sp,sp,32
    800036b6:	8082                	ret

00000000800036b8 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    800036b8:	7179                	addi	sp,sp,-48
    800036ba:	f406                	sd	ra,40(sp)
    800036bc:	f022                	sd	s0,32(sp)
    800036be:	1800                	addi	s0,sp,48
    800036c0:	87aa                	mv	a5,a0
    800036c2:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    800036c6:	00011797          	auipc	a5,0x11
    800036ca:	fd278793          	addi	a5,a5,-46 # 80014698 <proc>
    800036ce:	fef43423          	sd	a5,-24(s0)
    800036d2:	a0bd                	j	80003740 <kill+0x88>
    acquire(&p->lock);
    800036d4:	fe843783          	ld	a5,-24(s0)
    800036d8:	853e                	mv	a0,a5
    800036da:	ffffe097          	auipc	ra,0xffffe
    800036de:	ba4080e7          	jalr	-1116(ra) # 8000127e <acquire>
    if(p->pid == pid){
    800036e2:	fe843783          	ld	a5,-24(s0)
    800036e6:	5f98                	lw	a4,56(a5)
    800036e8:	fdc42783          	lw	a5,-36(s0)
    800036ec:	2781                	sext.w	a5,a5
    800036ee:	02e79a63          	bne	a5,a4,80003722 <kill+0x6a>
      p->killed = 1;
    800036f2:	fe843783          	ld	a5,-24(s0)
    800036f6:	4705                	li	a4,1
    800036f8:	db98                	sw	a4,48(a5)
      if(p->state == SLEEPING){
    800036fa:	fe843783          	ld	a5,-24(s0)
    800036fe:	4f9c                	lw	a5,24(a5)
    80003700:	873e                	mv	a4,a5
    80003702:	4785                	li	a5,1
    80003704:	00f71663          	bne	a4,a5,80003710 <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    80003708:	fe843783          	ld	a5,-24(s0)
    8000370c:	4709                	li	a4,2
    8000370e:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003710:	fe843783          	ld	a5,-24(s0)
    80003714:	853e                	mv	a0,a5
    80003716:	ffffe097          	auipc	ra,0xffffe
    8000371a:	bcc080e7          	jalr	-1076(ra) # 800012e2 <release>
      return 0;
    8000371e:	4781                	li	a5,0
    80003720:	a80d                	j	80003752 <kill+0x9a>
    }
    release(&p->lock);
    80003722:	fe843783          	ld	a5,-24(s0)
    80003726:	853e                	mv	a0,a5
    80003728:	ffffe097          	auipc	ra,0xffffe
    8000372c:	bba080e7          	jalr	-1094(ra) # 800012e2 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003730:	fe843703          	ld	a4,-24(s0)
    80003734:	6785                	lui	a5,0x1
    80003736:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    8000373a:	97ba                	add	a5,a5,a4
    8000373c:	fef43423          	sd	a5,-24(s0)
    80003740:	fe843703          	ld	a4,-24(s0)
    80003744:	00060797          	auipc	a5,0x60
    80003748:	35478793          	addi	a5,a5,852 # 80063a98 <pid_lock>
    8000374c:	f8f764e3          	bltu	a4,a5,800036d4 <kill+0x1c>
  }
  return -1;
    80003750:	57fd                	li	a5,-1
}
    80003752:	853e                	mv	a0,a5
    80003754:	70a2                	ld	ra,40(sp)
    80003756:	7402                	ld	s0,32(sp)
    80003758:	6145                	addi	sp,sp,48
    8000375a:	8082                	ret

000000008000375c <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8000375c:	7139                	addi	sp,sp,-64
    8000375e:	fc06                	sd	ra,56(sp)
    80003760:	f822                	sd	s0,48(sp)
    80003762:	0080                	addi	s0,sp,64
    80003764:	87aa                	mv	a5,a0
    80003766:	fcb43823          	sd	a1,-48(s0)
    8000376a:	fcc43423          	sd	a2,-56(s0)
    8000376e:	fcd43023          	sd	a3,-64(s0)
    80003772:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80003776:	fffff097          	auipc	ra,0xfffff
    8000377a:	080080e7          	jalr	128(ra) # 800027f6 <myproc>
    8000377e:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003782:	fdc42783          	lw	a5,-36(s0)
    80003786:	2781                	sext.w	a5,a5
    80003788:	c785                	beqz	a5,800037b0 <either_copyout+0x54>
    return copyout(p->pagetable, dst, src, len);
    8000378a:	fe843703          	ld	a4,-24(s0)
    8000378e:	6785                	lui	a5,0x1
    80003790:	97ba                	add	a5,a5,a4
    80003792:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    80003796:	fc043683          	ld	a3,-64(s0)
    8000379a:	fc843603          	ld	a2,-56(s0)
    8000379e:	fd043583          	ld	a1,-48(s0)
    800037a2:	853e                	mv	a0,a5
    800037a4:	fffff097          	auipc	ra,0xfffff
    800037a8:	b2e080e7          	jalr	-1234(ra) # 800022d2 <copyout>
    800037ac:	87aa                	mv	a5,a0
    800037ae:	a839                	j	800037cc <either_copyout+0x70>
  } else {
    memmove((char *)dst, src, len);
    800037b0:	fd043783          	ld	a5,-48(s0)
    800037b4:	fc043703          	ld	a4,-64(s0)
    800037b8:	2701                	sext.w	a4,a4
    800037ba:	863a                	mv	a2,a4
    800037bc:	fc843583          	ld	a1,-56(s0)
    800037c0:	853e                	mv	a0,a5
    800037c2:	ffffe097          	auipc	ra,0xffffe
    800037c6:	d74080e7          	jalr	-652(ra) # 80001536 <memmove>
    return 0;
    800037ca:	4781                	li	a5,0
  }
}
    800037cc:	853e                	mv	a0,a5
    800037ce:	70e2                	ld	ra,56(sp)
    800037d0:	7442                	ld	s0,48(sp)
    800037d2:	6121                	addi	sp,sp,64
    800037d4:	8082                	ret

00000000800037d6 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    800037d6:	7139                	addi	sp,sp,-64
    800037d8:	fc06                	sd	ra,56(sp)
    800037da:	f822                	sd	s0,48(sp)
    800037dc:	0080                	addi	s0,sp,64
    800037de:	fca43c23          	sd	a0,-40(s0)
    800037e2:	87ae                	mv	a5,a1
    800037e4:	fcc43423          	sd	a2,-56(s0)
    800037e8:	fcd43023          	sd	a3,-64(s0)
    800037ec:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    800037f0:	fffff097          	auipc	ra,0xfffff
    800037f4:	006080e7          	jalr	6(ra) # 800027f6 <myproc>
    800037f8:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    800037fc:	fd442783          	lw	a5,-44(s0)
    80003800:	2781                	sext.w	a5,a5
    80003802:	c785                	beqz	a5,8000382a <either_copyin+0x54>
    return copyin(p->pagetable, dst, src, len);
    80003804:	fe843703          	ld	a4,-24(s0)
    80003808:	6785                	lui	a5,0x1
    8000380a:	97ba                	add	a5,a5,a4
    8000380c:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    80003810:	fc043683          	ld	a3,-64(s0)
    80003814:	fc843603          	ld	a2,-56(s0)
    80003818:	fd843583          	ld	a1,-40(s0)
    8000381c:	853e                	mv	a0,a5
    8000381e:	fffff097          	auipc	ra,0xfffff
    80003822:	b82080e7          	jalr	-1150(ra) # 800023a0 <copyin>
    80003826:	87aa                	mv	a5,a0
    80003828:	a839                	j	80003846 <either_copyin+0x70>
  } else {
    memmove(dst, (char*)src, len);
    8000382a:	fc843783          	ld	a5,-56(s0)
    8000382e:	fc043703          	ld	a4,-64(s0)
    80003832:	2701                	sext.w	a4,a4
    80003834:	863a                	mv	a2,a4
    80003836:	85be                	mv	a1,a5
    80003838:	fd843503          	ld	a0,-40(s0)
    8000383c:	ffffe097          	auipc	ra,0xffffe
    80003840:	cfa080e7          	jalr	-774(ra) # 80001536 <memmove>
    return 0;
    80003844:	4781                	li	a5,0
  }
}
    80003846:	853e                	mv	a0,a5
    80003848:	70e2                	ld	ra,56(sp)
    8000384a:	7442                	ld	s0,48(sp)
    8000384c:	6121                	addi	sp,sp,64
    8000384e:	8082                	ret

0000000080003850 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003850:	1101                	addi	sp,sp,-32
    80003852:	ec06                	sd	ra,24(sp)
    80003854:	e822                	sd	s0,16(sp)
    80003856:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003858:	00008517          	auipc	a0,0x8
    8000385c:	9f050513          	addi	a0,a0,-1552 # 8000b248 <etext+0x248>
    80003860:	ffffd097          	auipc	ra,0xffffd
    80003864:	19a080e7          	jalr	410(ra) # 800009fa <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003868:	00011797          	auipc	a5,0x11
    8000386c:	e3078793          	addi	a5,a5,-464 # 80014698 <proc>
    80003870:	fef43423          	sd	a5,-24(s0)
    80003874:	a065                	j	8000391c <procdump+0xcc>
    if(p->state == UNUSED)
    80003876:	fe843783          	ld	a5,-24(s0)
    8000387a:	4f9c                	lw	a5,24(a5)
    8000387c:	c7d9                	beqz	a5,8000390a <procdump+0xba>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8000387e:	fe843783          	ld	a5,-24(s0)
    80003882:	4f9c                	lw	a5,24(a5)
    80003884:	873e                	mv	a4,a5
    80003886:	4791                	li	a5,4
    80003888:	02e7ee63          	bltu	a5,a4,800038c4 <procdump+0x74>
    8000388c:	fe843783          	ld	a5,-24(s0)
    80003890:	4f9c                	lw	a5,24(a5)
    80003892:	00008717          	auipc	a4,0x8
    80003896:	f1e70713          	addi	a4,a4,-226 # 8000b7b0 <states.1723>
    8000389a:	1782                	slli	a5,a5,0x20
    8000389c:	9381                	srli	a5,a5,0x20
    8000389e:	078e                	slli	a5,a5,0x3
    800038a0:	97ba                	add	a5,a5,a4
    800038a2:	639c                	ld	a5,0(a5)
    800038a4:	c385                	beqz	a5,800038c4 <procdump+0x74>
      state = states[p->state];
    800038a6:	fe843783          	ld	a5,-24(s0)
    800038aa:	4f9c                	lw	a5,24(a5)
    800038ac:	00008717          	auipc	a4,0x8
    800038b0:	f0470713          	addi	a4,a4,-252 # 8000b7b0 <states.1723>
    800038b4:	1782                	slli	a5,a5,0x20
    800038b6:	9381                	srli	a5,a5,0x20
    800038b8:	078e                	slli	a5,a5,0x3
    800038ba:	97ba                	add	a5,a5,a4
    800038bc:	639c                	ld	a5,0(a5)
    800038be:	fef43023          	sd	a5,-32(s0)
    800038c2:	a039                	j	800038d0 <procdump+0x80>
    else
      state = "???";
    800038c4:	00008797          	auipc	a5,0x8
    800038c8:	98c78793          	addi	a5,a5,-1652 # 8000b250 <etext+0x250>
    800038cc:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    800038d0:	fe843783          	ld	a5,-24(s0)
    800038d4:	5f8c                	lw	a1,56(a5)
    800038d6:	fe843703          	ld	a4,-24(s0)
    800038da:	6785                	lui	a5,0x1
    800038dc:	3c078793          	addi	a5,a5,960 # 13c0 <_entry-0x7fffec40>
    800038e0:	97ba                	add	a5,a5,a4
    800038e2:	86be                	mv	a3,a5
    800038e4:	fe043603          	ld	a2,-32(s0)
    800038e8:	00008517          	auipc	a0,0x8
    800038ec:	97050513          	addi	a0,a0,-1680 # 8000b258 <etext+0x258>
    800038f0:	ffffd097          	auipc	ra,0xffffd
    800038f4:	10a080e7          	jalr	266(ra) # 800009fa <printf>
    printf("\n");
    800038f8:	00008517          	auipc	a0,0x8
    800038fc:	95050513          	addi	a0,a0,-1712 # 8000b248 <etext+0x248>
    80003900:	ffffd097          	auipc	ra,0xffffd
    80003904:	0fa080e7          	jalr	250(ra) # 800009fa <printf>
    80003908:	a011                	j	8000390c <procdump+0xbc>
      continue;
    8000390a:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    8000390c:	fe843703          	ld	a4,-24(s0)
    80003910:	6785                	lui	a5,0x1
    80003912:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    80003916:	97ba                	add	a5,a5,a4
    80003918:	fef43423          	sd	a5,-24(s0)
    8000391c:	fe843703          	ld	a4,-24(s0)
    80003920:	00060797          	auipc	a5,0x60
    80003924:	17878793          	addi	a5,a5,376 # 80063a98 <pid_lock>
    80003928:	f4f767e3          	bltu	a4,a5,80003876 <procdump+0x26>
  }
}
    8000392c:	0001                	nop
    8000392e:	0001                	nop
    80003930:	60e2                	ld	ra,24(sp)
    80003932:	6442                	ld	s0,16(sp)
    80003934:	6105                	addi	sp,sp,32
    80003936:	8082                	ret

0000000080003938 <swtch>:
    80003938:	00153023          	sd	ra,0(a0)
    8000393c:	00253423          	sd	sp,8(a0)
    80003940:	e900                	sd	s0,16(a0)
    80003942:	ed04                	sd	s1,24(a0)
    80003944:	03253023          	sd	s2,32(a0)
    80003948:	03353423          	sd	s3,40(a0)
    8000394c:	03453823          	sd	s4,48(a0)
    80003950:	03553c23          	sd	s5,56(a0)
    80003954:	05653023          	sd	s6,64(a0)
    80003958:	05753423          	sd	s7,72(a0)
    8000395c:	05853823          	sd	s8,80(a0)
    80003960:	05953c23          	sd	s9,88(a0)
    80003964:	07a53023          	sd	s10,96(a0)
    80003968:	07b53423          	sd	s11,104(a0)
    8000396c:	0005b083          	ld	ra,0(a1)
    80003970:	0085b103          	ld	sp,8(a1)
    80003974:	6980                	ld	s0,16(a1)
    80003976:	6d84                	ld	s1,24(a1)
    80003978:	0205b903          	ld	s2,32(a1)
    8000397c:	0285b983          	ld	s3,40(a1)
    80003980:	0305ba03          	ld	s4,48(a1)
    80003984:	0385ba83          	ld	s5,56(a1)
    80003988:	0405bb03          	ld	s6,64(a1)
    8000398c:	0485bb83          	ld	s7,72(a1)
    80003990:	0505bc03          	ld	s8,80(a1)
    80003994:	0585bc83          	ld	s9,88(a1)
    80003998:	0605bd03          	ld	s10,96(a1)
    8000399c:	0685bd83          	ld	s11,104(a1)
    800039a0:	8082                	ret

00000000800039a2 <r_sstatus>:
{
    800039a2:	1101                	addi	sp,sp,-32
    800039a4:	ec22                	sd	s0,24(sp)
    800039a6:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800039a8:	100027f3          	csrr	a5,sstatus
    800039ac:	fef43423          	sd	a5,-24(s0)
  return x;
    800039b0:	fe843783          	ld	a5,-24(s0)
}
    800039b4:	853e                	mv	a0,a5
    800039b6:	6462                	ld	s0,24(sp)
    800039b8:	6105                	addi	sp,sp,32
    800039ba:	8082                	ret

00000000800039bc <w_sstatus>:
{
    800039bc:	1101                	addi	sp,sp,-32
    800039be:	ec22                	sd	s0,24(sp)
    800039c0:	1000                	addi	s0,sp,32
    800039c2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800039c6:	fe843783          	ld	a5,-24(s0)
    800039ca:	10079073          	csrw	sstatus,a5
}
    800039ce:	0001                	nop
    800039d0:	6462                	ld	s0,24(sp)
    800039d2:	6105                	addi	sp,sp,32
    800039d4:	8082                	ret

00000000800039d6 <r_sip>:
{
    800039d6:	1101                	addi	sp,sp,-32
    800039d8:	ec22                	sd	s0,24(sp)
    800039da:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    800039dc:	144027f3          	csrr	a5,sip
    800039e0:	fef43423          	sd	a5,-24(s0)
  return x;
    800039e4:	fe843783          	ld	a5,-24(s0)
}
    800039e8:	853e                	mv	a0,a5
    800039ea:	6462                	ld	s0,24(sp)
    800039ec:	6105                	addi	sp,sp,32
    800039ee:	8082                	ret

00000000800039f0 <w_sip>:
{
    800039f0:	1101                	addi	sp,sp,-32
    800039f2:	ec22                	sd	s0,24(sp)
    800039f4:	1000                	addi	s0,sp,32
    800039f6:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    800039fa:	fe843783          	ld	a5,-24(s0)
    800039fe:	14479073          	csrw	sip,a5
}
    80003a02:	0001                	nop
    80003a04:	6462                	ld	s0,24(sp)
    80003a06:	6105                	addi	sp,sp,32
    80003a08:	8082                	ret

0000000080003a0a <w_sepc>:
{
    80003a0a:	1101                	addi	sp,sp,-32
    80003a0c:	ec22                	sd	s0,24(sp)
    80003a0e:	1000                	addi	s0,sp,32
    80003a10:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003a14:	fe843783          	ld	a5,-24(s0)
    80003a18:	14179073          	csrw	sepc,a5
}
    80003a1c:	0001                	nop
    80003a1e:	6462                	ld	s0,24(sp)
    80003a20:	6105                	addi	sp,sp,32
    80003a22:	8082                	ret

0000000080003a24 <r_sepc>:
{
    80003a24:	1101                	addi	sp,sp,-32
    80003a26:	ec22                	sd	s0,24(sp)
    80003a28:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003a2a:	141027f3          	csrr	a5,sepc
    80003a2e:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a32:	fe843783          	ld	a5,-24(s0)
}
    80003a36:	853e                	mv	a0,a5
    80003a38:	6462                	ld	s0,24(sp)
    80003a3a:	6105                	addi	sp,sp,32
    80003a3c:	8082                	ret

0000000080003a3e <w_stvec>:
{
    80003a3e:	1101                	addi	sp,sp,-32
    80003a40:	ec22                	sd	s0,24(sp)
    80003a42:	1000                	addi	s0,sp,32
    80003a44:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003a48:	fe843783          	ld	a5,-24(s0)
    80003a4c:	10579073          	csrw	stvec,a5
}
    80003a50:	0001                	nop
    80003a52:	6462                	ld	s0,24(sp)
    80003a54:	6105                	addi	sp,sp,32
    80003a56:	8082                	ret

0000000080003a58 <r_satp>:
{
    80003a58:	1101                	addi	sp,sp,-32
    80003a5a:	ec22                	sd	s0,24(sp)
    80003a5c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003a5e:	180027f3          	csrr	a5,satp
    80003a62:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a66:	fe843783          	ld	a5,-24(s0)
}
    80003a6a:	853e                	mv	a0,a5
    80003a6c:	6462                	ld	s0,24(sp)
    80003a6e:	6105                	addi	sp,sp,32
    80003a70:	8082                	ret

0000000080003a72 <r_scause>:
{
    80003a72:	1101                	addi	sp,sp,-32
    80003a74:	ec22                	sd	s0,24(sp)
    80003a76:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003a78:	142027f3          	csrr	a5,scause
    80003a7c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a80:	fe843783          	ld	a5,-24(s0)
}
    80003a84:	853e                	mv	a0,a5
    80003a86:	6462                	ld	s0,24(sp)
    80003a88:	6105                	addi	sp,sp,32
    80003a8a:	8082                	ret

0000000080003a8c <r_stval>:
{
    80003a8c:	1101                	addi	sp,sp,-32
    80003a8e:	ec22                	sd	s0,24(sp)
    80003a90:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003a92:	143027f3          	csrr	a5,stval
    80003a96:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a9a:	fe843783          	ld	a5,-24(s0)
}
    80003a9e:	853e                	mv	a0,a5
    80003aa0:	6462                	ld	s0,24(sp)
    80003aa2:	6105                	addi	sp,sp,32
    80003aa4:	8082                	ret

0000000080003aa6 <intr_on>:
{
    80003aa6:	1141                	addi	sp,sp,-16
    80003aa8:	e406                	sd	ra,8(sp)
    80003aaa:	e022                	sd	s0,0(sp)
    80003aac:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003aae:	00000097          	auipc	ra,0x0
    80003ab2:	ef4080e7          	jalr	-268(ra) # 800039a2 <r_sstatus>
    80003ab6:	87aa                	mv	a5,a0
    80003ab8:	0027e793          	ori	a5,a5,2
    80003abc:	853e                	mv	a0,a5
    80003abe:	00000097          	auipc	ra,0x0
    80003ac2:	efe080e7          	jalr	-258(ra) # 800039bc <w_sstatus>
}
    80003ac6:	0001                	nop
    80003ac8:	60a2                	ld	ra,8(sp)
    80003aca:	6402                	ld	s0,0(sp)
    80003acc:	0141                	addi	sp,sp,16
    80003ace:	8082                	ret

0000000080003ad0 <intr_off>:
{
    80003ad0:	1141                	addi	sp,sp,-16
    80003ad2:	e406                	sd	ra,8(sp)
    80003ad4:	e022                	sd	s0,0(sp)
    80003ad6:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003ad8:	00000097          	auipc	ra,0x0
    80003adc:	eca080e7          	jalr	-310(ra) # 800039a2 <r_sstatus>
    80003ae0:	87aa                	mv	a5,a0
    80003ae2:	9bf5                	andi	a5,a5,-3
    80003ae4:	853e                	mv	a0,a5
    80003ae6:	00000097          	auipc	ra,0x0
    80003aea:	ed6080e7          	jalr	-298(ra) # 800039bc <w_sstatus>
}
    80003aee:	0001                	nop
    80003af0:	60a2                	ld	ra,8(sp)
    80003af2:	6402                	ld	s0,0(sp)
    80003af4:	0141                	addi	sp,sp,16
    80003af6:	8082                	ret

0000000080003af8 <intr_get>:
{
    80003af8:	1101                	addi	sp,sp,-32
    80003afa:	ec06                	sd	ra,24(sp)
    80003afc:	e822                	sd	s0,16(sp)
    80003afe:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003b00:	00000097          	auipc	ra,0x0
    80003b04:	ea2080e7          	jalr	-350(ra) # 800039a2 <r_sstatus>
    80003b08:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003b0c:	fe843783          	ld	a5,-24(s0)
    80003b10:	8b89                	andi	a5,a5,2
    80003b12:	00f037b3          	snez	a5,a5
    80003b16:	0ff7f793          	andi	a5,a5,255
    80003b1a:	2781                	sext.w	a5,a5
}
    80003b1c:	853e                	mv	a0,a5
    80003b1e:	60e2                	ld	ra,24(sp)
    80003b20:	6442                	ld	s0,16(sp)
    80003b22:	6105                	addi	sp,sp,32
    80003b24:	8082                	ret

0000000080003b26 <r_tp>:
{
    80003b26:	1101                	addi	sp,sp,-32
    80003b28:	ec22                	sd	s0,24(sp)
    80003b2a:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003b2c:	8792                	mv	a5,tp
    80003b2e:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b32:	fe843783          	ld	a5,-24(s0)
}
    80003b36:	853e                	mv	a0,a5
    80003b38:	6462                	ld	s0,24(sp)
    80003b3a:	6105                	addi	sp,sp,32
    80003b3c:	8082                	ret

0000000080003b3e <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003b3e:	1141                	addi	sp,sp,-16
    80003b40:	e406                	sd	ra,8(sp)
    80003b42:	e022                	sd	s0,0(sp)
    80003b44:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003b46:	00007597          	auipc	a1,0x7
    80003b4a:	75258593          	addi	a1,a1,1874 # 8000b298 <etext+0x298>
    80003b4e:	00060517          	auipc	a0,0x60
    80003b52:	f6250513          	addi	a0,a0,-158 # 80063ab0 <tickslock>
    80003b56:	ffffd097          	auipc	ra,0xffffd
    80003b5a:	6f8080e7          	jalr	1784(ra) # 8000124e <initlock>
}
    80003b5e:	0001                	nop
    80003b60:	60a2                	ld	ra,8(sp)
    80003b62:	6402                	ld	s0,0(sp)
    80003b64:	0141                	addi	sp,sp,16
    80003b66:	8082                	ret

0000000080003b68 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003b68:	1141                	addi	sp,sp,-16
    80003b6a:	e406                	sd	ra,8(sp)
    80003b6c:	e022                	sd	s0,0(sp)
    80003b6e:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003b70:	00005797          	auipc	a5,0x5
    80003b74:	06078793          	addi	a5,a5,96 # 80008bd0 <kernelvec>
    80003b78:	853e                	mv	a0,a5
    80003b7a:	00000097          	auipc	ra,0x0
    80003b7e:	ec4080e7          	jalr	-316(ra) # 80003a3e <w_stvec>
}
    80003b82:	0001                	nop
    80003b84:	60a2                	ld	ra,8(sp)
    80003b86:	6402                	ld	s0,0(sp)
    80003b88:	0141                	addi	sp,sp,16
    80003b8a:	8082                	ret

0000000080003b8c <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003b8c:	7179                	addi	sp,sp,-48
    80003b8e:	f406                	sd	ra,40(sp)
    80003b90:	f022                	sd	s0,32(sp)
    80003b92:	ec26                	sd	s1,24(sp)
    80003b94:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003b96:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003b9a:	00000097          	auipc	ra,0x0
    80003b9e:	e08080e7          	jalr	-504(ra) # 800039a2 <r_sstatus>
    80003ba2:	87aa                	mv	a5,a0
    80003ba4:	1007f793          	andi	a5,a5,256
    80003ba8:	cb89                	beqz	a5,80003bba <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003baa:	00007517          	auipc	a0,0x7
    80003bae:	6f650513          	addi	a0,a0,1782 # 8000b2a0 <etext+0x2a0>
    80003bb2:	ffffd097          	auipc	ra,0xffffd
    80003bb6:	09e080e7          	jalr	158(ra) # 80000c50 <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003bba:	00005797          	auipc	a5,0x5
    80003bbe:	01678793          	addi	a5,a5,22 # 80008bd0 <kernelvec>
    80003bc2:	853e                	mv	a0,a5
    80003bc4:	00000097          	auipc	ra,0x0
    80003bc8:	e7a080e7          	jalr	-390(ra) # 80003a3e <w_stvec>

  struct proc *p = myproc();
    80003bcc:	fffff097          	auipc	ra,0xfffff
    80003bd0:	c2a080e7          	jalr	-982(ra) # 800027f6 <myproc>
    80003bd4:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003bd8:	fd043703          	ld	a4,-48(s0)
    80003bdc:	6785                	lui	a5,0x1
    80003bde:	97ba                	add	a5,a5,a4
    80003be0:	2c07b483          	ld	s1,704(a5) # 12c0 <_entry-0x7fffed40>
    80003be4:	00000097          	auipc	ra,0x0
    80003be8:	e40080e7          	jalr	-448(ra) # 80003a24 <r_sepc>
    80003bec:	87aa                	mv	a5,a0
    80003bee:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003bf0:	00000097          	auipc	ra,0x0
    80003bf4:	e82080e7          	jalr	-382(ra) # 80003a72 <r_scause>
    80003bf8:	872a                	mv	a4,a0
    80003bfa:	47a1                	li	a5,8
    80003bfc:	04f71363          	bne	a4,a5,80003c42 <usertrap+0xb6>
    // system call

    if(p->killed)
    80003c00:	fd043783          	ld	a5,-48(s0)
    80003c04:	5b9c                	lw	a5,48(a5)
    80003c06:	c791                	beqz	a5,80003c12 <usertrap+0x86>
      exit(-1);
    80003c08:	557d                	li	a0,-1
    80003c0a:	fffff097          	auipc	ra,0xfffff
    80003c0e:	3fa080e7          	jalr	1018(ra) # 80003004 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003c12:	fd043703          	ld	a4,-48(s0)
    80003c16:	6785                	lui	a5,0x1
    80003c18:	97ba                	add	a5,a5,a4
    80003c1a:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003c1e:	6f98                	ld	a4,24(a5)
    80003c20:	fd043683          	ld	a3,-48(s0)
    80003c24:	6785                	lui	a5,0x1
    80003c26:	97b6                	add	a5,a5,a3
    80003c28:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003c2c:	0711                	addi	a4,a4,4
    80003c2e:	ef98                	sd	a4,24(a5)

    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();
    80003c30:	00000097          	auipc	ra,0x0
    80003c34:	e76080e7          	jalr	-394(ra) # 80003aa6 <intr_on>

    syscall();
    80003c38:	00001097          	auipc	ra,0x1
    80003c3c:	8c4080e7          	jalr	-1852(ra) # 800044fc <syscall>
    80003c40:	a0b5                	j	80003cac <usertrap+0x120>
  } else if((which_dev = devintr()) != 0){
    80003c42:	00000097          	auipc	ra,0x0
    80003c46:	550080e7          	jalr	1360(ra) # 80004192 <devintr>
    80003c4a:	87aa                	mv	a5,a0
    80003c4c:	fcf42e23          	sw	a5,-36(s0)
    80003c50:	fdc42783          	lw	a5,-36(s0)
    80003c54:	2781                	sext.w	a5,a5
    80003c56:	ebb9                	bnez	a5,80003cac <usertrap+0x120>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003c58:	00000097          	auipc	ra,0x0
    80003c5c:	e1a080e7          	jalr	-486(ra) # 80003a72 <r_scause>
    80003c60:	872a                	mv	a4,a0
    80003c62:	fd043783          	ld	a5,-48(s0)
    80003c66:	5f9c                	lw	a5,56(a5)
    80003c68:	863e                	mv	a2,a5
    80003c6a:	85ba                	mv	a1,a4
    80003c6c:	00007517          	auipc	a0,0x7
    80003c70:	65450513          	addi	a0,a0,1620 # 8000b2c0 <etext+0x2c0>
    80003c74:	ffffd097          	auipc	ra,0xffffd
    80003c78:	d86080e7          	jalr	-634(ra) # 800009fa <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003c7c:	00000097          	auipc	ra,0x0
    80003c80:	da8080e7          	jalr	-600(ra) # 80003a24 <r_sepc>
    80003c84:	84aa                	mv	s1,a0
    80003c86:	00000097          	auipc	ra,0x0
    80003c8a:	e06080e7          	jalr	-506(ra) # 80003a8c <r_stval>
    80003c8e:	87aa                	mv	a5,a0
    80003c90:	863e                	mv	a2,a5
    80003c92:	85a6                	mv	a1,s1
    80003c94:	00007517          	auipc	a0,0x7
    80003c98:	65c50513          	addi	a0,a0,1628 # 8000b2f0 <etext+0x2f0>
    80003c9c:	ffffd097          	auipc	ra,0xffffd
    80003ca0:	d5e080e7          	jalr	-674(ra) # 800009fa <printf>
    p->killed = 1;
    80003ca4:	fd043783          	ld	a5,-48(s0)
    80003ca8:	4705                	li	a4,1
    80003caa:	db98                	sw	a4,48(a5)
  }

  if(p->killed)
    80003cac:	fd043783          	ld	a5,-48(s0)
    80003cb0:	5b9c                	lw	a5,48(a5)
    80003cb2:	c791                	beqz	a5,80003cbe <usertrap+0x132>
    exit(-1);
    80003cb4:	557d                	li	a0,-1
    80003cb6:	fffff097          	auipc	ra,0xfffff
    80003cba:	34e080e7          	jalr	846(ra) # 80003004 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2){
    80003cbe:	fdc42783          	lw	a5,-36(s0)
    80003cc2:	0007871b          	sext.w	a4,a5
    80003cc6:	4789                	li	a5,2
    80003cc8:	04f71763          	bne	a4,a5,80003d16 <usertrap+0x18a>
    // for mp3
    if(p->thrdstop_delay > 0){
    80003ccc:	fd043783          	ld	a5,-48(s0)
    80003cd0:	43bc                	lw	a5,64(a5)
    80003cd2:	02f05e63          	blez	a5,80003d0e <usertrap+0x182>
      p->thrdstop_ticks++;
    80003cd6:	fd043783          	ld	a5,-48(s0)
    80003cda:	5fdc                	lw	a5,60(a5)
    80003cdc:	2785                	addiw	a5,a5,1
    80003cde:	0007871b          	sext.w	a4,a5
    80003ce2:	fd043783          	ld	a5,-48(s0)
    80003ce6:	dfd8                	sw	a4,60(a5)
      if(p->thrdstop_ticks >= p->thrdstop_delay){
    80003ce8:	fd043783          	ld	a5,-48(s0)
    80003cec:	5fd8                	lw	a4,60(a5)
    80003cee:	fd043783          	ld	a5,-48(s0)
    80003cf2:	43bc                	lw	a5,64(a5)
    80003cf4:	00f74d63          	blt	a4,a5,80003d0e <usertrap+0x182>
        p->thrdstop_delay = -1;
    80003cf8:	fd043783          	ld	a5,-48(s0)
    80003cfc:	577d                	li	a4,-1
    80003cfe:	c3b8                	sw	a4,64(a5)
        p->jump_flag = 1;
    80003d00:	fd043703          	ld	a4,-48(s0)
    80003d04:	6785                	lui	a5,0x1
    80003d06:	97ba                	add	a5,a5,a4
    80003d08:	4705                	li	a4,1
    80003d0a:	28e7ac23          	sw	a4,664(a5) # 1298 <_entry-0x7fffed68>
      }
    }
    yield();
    80003d0e:	fffff097          	auipc	ra,0xfffff
    80003d12:	79a080e7          	jalr	1946(ra) # 800034a8 <yield>
  }
  usertrapret();
    80003d16:	00000097          	auipc	ra,0x0
    80003d1a:	014080e7          	jalr	20(ra) # 80003d2a <usertrapret>
}
    80003d1e:	0001                	nop
    80003d20:	70a2                	ld	ra,40(sp)
    80003d22:	7402                	ld	s0,32(sp)
    80003d24:	64e2                	ld	s1,24(sp)
    80003d26:	6145                	addi	sp,sp,48
    80003d28:	8082                	ret

0000000080003d2a <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003d2a:	711d                	addi	sp,sp,-96
    80003d2c:	ec86                	sd	ra,88(sp)
    80003d2e:	e8a2                	sd	s0,80(sp)
    80003d30:	e4a6                	sd	s1,72(sp)
    80003d32:	1080                	addi	s0,sp,96
  struct proc *p = myproc();
    80003d34:	fffff097          	auipc	ra,0xfffff
    80003d38:	ac2080e7          	jalr	-1342(ra) # 800027f6 <myproc>
    80003d3c:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003d40:	00000097          	auipc	ra,0x0
    80003d44:	d90080e7          	jalr	-624(ra) # 80003ad0 <intr_off>

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80003d48:	00006717          	auipc	a4,0x6
    80003d4c:	2b870713          	addi	a4,a4,696 # 8000a000 <_trampoline>
    80003d50:	00006797          	auipc	a5,0x6
    80003d54:	2b078793          	addi	a5,a5,688 # 8000a000 <_trampoline>
    80003d58:	8f1d                	sub	a4,a4,a5
    80003d5a:	040007b7          	lui	a5,0x4000
    80003d5e:	17fd                	addi	a5,a5,-1
    80003d60:	07b2                	slli	a5,a5,0xc
    80003d62:	97ba                	add	a5,a5,a4
    80003d64:	853e                	mv	a0,a5
    80003d66:	00000097          	auipc	ra,0x0
    80003d6a:	cd8080e7          	jalr	-808(ra) # 80003a3e <w_stvec>

  if(p->resume_flag != -1){ // handle thrdresume
    80003d6e:	fd843703          	ld	a4,-40(s0)
    80003d72:	6785                	lui	a5,0x1
    80003d74:	97ba                	add	a5,a5,a4
    80003d76:	29c7a783          	lw	a5,668(a5) # 129c <_entry-0x7fffed64>
    80003d7a:	873e                	mv	a4,a5
    80003d7c:	57fd                	li	a5,-1
    80003d7e:	04f70b63          	beq	a4,a5,80003dd4 <usertrapret+0xaa>
    // restore user context
    struct trapframe *now_thrd_context = &(p->thrdstop_context[p->resume_flag]);
    80003d82:	fd843703          	ld	a4,-40(s0)
    80003d86:	6785                	lui	a5,0x1
    80003d88:	97ba                	add	a5,a5,a4
    80003d8a:	29c7a703          	lw	a4,668(a5) # 129c <_entry-0x7fffed64>
    80003d8e:	87ba                	mv	a5,a4
    80003d90:	078e                	slli	a5,a5,0x3
    80003d92:	97ba                	add	a5,a5,a4
    80003d94:	0796                	slli	a5,a5,0x5
    80003d96:	05078793          	addi	a5,a5,80
    80003d9a:	fd843703          	ld	a4,-40(s0)
    80003d9e:	97ba                	add	a5,a5,a4
    80003da0:	07a1                	addi	a5,a5,8
    80003da2:	fcf43023          	sd	a5,-64(s0)
    memmove(p->trapframe, now_thrd_context, sizeof(struct trapframe));
    80003da6:	fd843703          	ld	a4,-40(s0)
    80003daa:	6785                	lui	a5,0x1
    80003dac:	97ba                	add	a5,a5,a4
    80003dae:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003db2:	12000613          	li	a2,288
    80003db6:	fc043583          	ld	a1,-64(s0)
    80003dba:	853e                	mv	a0,a5
    80003dbc:	ffffd097          	auipc	ra,0xffffd
    80003dc0:	77a080e7          	jalr	1914(ra) # 80001536 <memmove>
    // clear falg
    p->resume_flag = -1;
    80003dc4:	fd843703          	ld	a4,-40(s0)
    80003dc8:	6785                	lui	a5,0x1
    80003dca:	97ba                	add	a5,a5,a4
    80003dcc:	577d                	li	a4,-1
    80003dce:	28e7ae23          	sw	a4,668(a5) # 129c <_entry-0x7fffed64>
    80003dd2:	a0f5                	j	80003ebe <usertrapret+0x194>
  }else if(p->jump_flag == 1){ // handle thrdstop
    80003dd4:	fd843703          	ld	a4,-40(s0)
    80003dd8:	6785                	lui	a5,0x1
    80003dda:	97ba                	add	a5,a5,a4
    80003ddc:	2987a783          	lw	a5,664(a5) # 1298 <_entry-0x7fffed68>
    80003de0:	873e                	mv	a4,a5
    80003de2:	4785                	li	a5,1
    80003de4:	06f71b63          	bne	a4,a5,80003e5a <usertrapret+0x130>
    // save user context
    struct trapframe *now_thrd_context = &(p->thrdstop_context[p->thrdstop_context_id]);
    80003de8:	fd843783          	ld	a5,-40(s0)
    80003dec:	43f8                	lw	a4,68(a5)
    80003dee:	87ba                	mv	a5,a4
    80003df0:	078e                	slli	a5,a5,0x3
    80003df2:	97ba                	add	a5,a5,a4
    80003df4:	0796                	slli	a5,a5,0x5
    80003df6:	05078793          	addi	a5,a5,80
    80003dfa:	fd843703          	ld	a4,-40(s0)
    80003dfe:	97ba                	add	a5,a5,a4
    80003e00:	07a1                	addi	a5,a5,8
    80003e02:	fcf43423          	sd	a5,-56(s0)
    memmove(now_thrd_context, p->trapframe, sizeof(struct trapframe));
    80003e06:	fd843703          	ld	a4,-40(s0)
    80003e0a:	6785                	lui	a5,0x1
    80003e0c:	97ba                	add	a5,a5,a4
    80003e0e:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003e12:	12000613          	li	a2,288
    80003e16:	85be                	mv	a1,a5
    80003e18:	fc843503          	ld	a0,-56(s0)
    80003e1c:	ffffd097          	auipc	ra,0xffffd
    80003e20:	71a080e7          	jalr	1818(ra) # 80001536 <memmove>
    // clear flag
    p->jump_flag = 0;
    80003e24:	fd843703          	ld	a4,-40(s0)
    80003e28:	6785                	lui	a5,0x1
    80003e2a:	97ba                	add	a5,a5,a4
    80003e2c:	2807ac23          	sw	zero,664(a5) # 1298 <_entry-0x7fffed68>
    // set pc to handler function
    p->trapframe->epc = p->thrdstop_handler_pointer;
    80003e30:	fd843703          	ld	a4,-40(s0)
    80003e34:	6785                	lui	a5,0x1
    80003e36:	97ba                	add	a5,a5,a4
    80003e38:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003e3c:	fd843703          	ld	a4,-40(s0)
    80003e40:	6b38                	ld	a4,80(a4)
    80003e42:	ef98                	sd	a4,24(a5)
    p->trapframe->a0 = p->thrdstop_handler_arg;
    80003e44:	fd843703          	ld	a4,-40(s0)
    80003e48:	6785                	lui	a5,0x1
    80003e4a:	97ba                	add	a5,a5,a4
    80003e4c:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003e50:	fd843703          	ld	a4,-40(s0)
    80003e54:	6738                	ld	a4,72(a4)
    80003e56:	fbb8                	sd	a4,112(a5)
    80003e58:	a09d                	j	80003ebe <usertrapret+0x194>
  }else if(p->cancel_save_flag != -1){ // handle cancelthrdstop
    80003e5a:	fd843703          	ld	a4,-40(s0)
    80003e5e:	6785                	lui	a5,0x1
    80003e60:	97ba                	add	a5,a5,a4
    80003e62:	2a07a783          	lw	a5,672(a5) # 12a0 <_entry-0x7fffed60>
    80003e66:	873e                	mv	a4,a5
    80003e68:	57fd                	li	a5,-1
    80003e6a:	04f70a63          	beq	a4,a5,80003ebe <usertrapret+0x194>
    // save user context
    struct trapframe *now_thrd_context = &(p->thrdstop_context[p->cancel_save_flag]);
    80003e6e:	fd843703          	ld	a4,-40(s0)
    80003e72:	6785                	lui	a5,0x1
    80003e74:	97ba                	add	a5,a5,a4
    80003e76:	2a07a703          	lw	a4,672(a5) # 12a0 <_entry-0x7fffed60>
    80003e7a:	87ba                	mv	a5,a4
    80003e7c:	078e                	slli	a5,a5,0x3
    80003e7e:	97ba                	add	a5,a5,a4
    80003e80:	0796                	slli	a5,a5,0x5
    80003e82:	05078793          	addi	a5,a5,80
    80003e86:	fd843703          	ld	a4,-40(s0)
    80003e8a:	97ba                	add	a5,a5,a4
    80003e8c:	07a1                	addi	a5,a5,8
    80003e8e:	fcf43823          	sd	a5,-48(s0)
    memmove(now_thrd_context, p->trapframe, sizeof(struct trapframe));
    80003e92:	fd843703          	ld	a4,-40(s0)
    80003e96:	6785                	lui	a5,0x1
    80003e98:	97ba                	add	a5,a5,a4
    80003e9a:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003e9e:	12000613          	li	a2,288
    80003ea2:	85be                	mv	a1,a5
    80003ea4:	fd043503          	ld	a0,-48(s0)
    80003ea8:	ffffd097          	auipc	ra,0xffffd
    80003eac:	68e080e7          	jalr	1678(ra) # 80001536 <memmove>
    // clear flag
    p->cancel_save_flag = -1;
    80003eb0:	fd843703          	ld	a4,-40(s0)
    80003eb4:	6785                	lui	a5,0x1
    80003eb6:	97ba                	add	a5,a5,a4
    80003eb8:	577d                	li	a4,-1
    80003eba:	2ae7a023          	sw	a4,672(a5) # 12a0 <_entry-0x7fffed60>
  }

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003ebe:	fd843703          	ld	a4,-40(s0)
    80003ec2:	6785                	lui	a5,0x1
    80003ec4:	97ba                	add	a5,a5,a4
    80003ec6:	2c07b483          	ld	s1,704(a5) # 12c0 <_entry-0x7fffed40>
    80003eca:	00000097          	auipc	ra,0x0
    80003ece:	b8e080e7          	jalr	-1138(ra) # 80003a58 <r_satp>
    80003ed2:	87aa                	mv	a5,a0
    80003ed4:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003ed6:	fd843703          	ld	a4,-40(s0)
    80003eda:	6785                	lui	a5,0x1
    80003edc:	97ba                	add	a5,a5,a4
    80003ede:	2a87b683          	ld	a3,680(a5) # 12a8 <_entry-0x7fffed58>
    80003ee2:	fd843703          	ld	a4,-40(s0)
    80003ee6:	6785                	lui	a5,0x1
    80003ee8:	97ba                	add	a5,a5,a4
    80003eea:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003eee:	6705                	lui	a4,0x1
    80003ef0:	9736                	add	a4,a4,a3
    80003ef2:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003ef4:	fd843703          	ld	a4,-40(s0)
    80003ef8:	6785                	lui	a5,0x1
    80003efa:	97ba                	add	a5,a5,a4
    80003efc:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003f00:	00000717          	auipc	a4,0x0
    80003f04:	c8c70713          	addi	a4,a4,-884 # 80003b8c <usertrap>
    80003f08:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003f0a:	fd843703          	ld	a4,-40(s0)
    80003f0e:	6785                	lui	a5,0x1
    80003f10:	97ba                	add	a5,a5,a4
    80003f12:	2c07b483          	ld	s1,704(a5) # 12c0 <_entry-0x7fffed40>
    80003f16:	00000097          	auipc	ra,0x0
    80003f1a:	c10080e7          	jalr	-1008(ra) # 80003b26 <r_tp>
    80003f1e:	87aa                	mv	a5,a0
    80003f20:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003f22:	00000097          	auipc	ra,0x0
    80003f26:	a80080e7          	jalr	-1408(ra) # 800039a2 <r_sstatus>
    80003f2a:	faa43c23          	sd	a0,-72(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003f2e:	fb843783          	ld	a5,-72(s0)
    80003f32:	eff7f793          	andi	a5,a5,-257
    80003f36:	faf43c23          	sd	a5,-72(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003f3a:	fb843783          	ld	a5,-72(s0)
    80003f3e:	0207e793          	ori	a5,a5,32
    80003f42:	faf43c23          	sd	a5,-72(s0)
  w_sstatus(x);
    80003f46:	fb843503          	ld	a0,-72(s0)
    80003f4a:	00000097          	auipc	ra,0x0
    80003f4e:	a72080e7          	jalr	-1422(ra) # 800039bc <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003f52:	fd843703          	ld	a4,-40(s0)
    80003f56:	6785                	lui	a5,0x1
    80003f58:	97ba                	add	a5,a5,a4
    80003f5a:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80003f5e:	6f9c                	ld	a5,24(a5)
    80003f60:	853e                	mv	a0,a5
    80003f62:	00000097          	auipc	ra,0x0
    80003f66:	aa8080e7          	jalr	-1368(ra) # 80003a0a <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003f6a:	fd843703          	ld	a4,-40(s0)
    80003f6e:	6785                	lui	a5,0x1
    80003f70:	97ba                	add	a5,a5,a4
    80003f72:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    80003f76:	00c7d713          	srli	a4,a5,0xc
    80003f7a:	57fd                	li	a5,-1
    80003f7c:	17fe                	slli	a5,a5,0x3f
    80003f7e:	8fd9                	or	a5,a5,a4
    80003f80:	faf43823          	sd	a5,-80(s0)
  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80003f84:	00006717          	auipc	a4,0x6
    80003f88:	10c70713          	addi	a4,a4,268 # 8000a090 <userret>
    80003f8c:	00006797          	auipc	a5,0x6
    80003f90:	07478793          	addi	a5,a5,116 # 8000a000 <_trampoline>
    80003f94:	8f1d                	sub	a4,a4,a5
    80003f96:	040007b7          	lui	a5,0x4000
    80003f9a:	17fd                	addi	a5,a5,-1
    80003f9c:	07b2                	slli	a5,a5,0xc
    80003f9e:	97ba                	add	a5,a5,a4
    80003fa0:	faf43423          	sd	a5,-88(s0)
  
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80003fa4:	fa843703          	ld	a4,-88(s0)
    80003fa8:	fb043583          	ld	a1,-80(s0)
    80003fac:	020007b7          	lui	a5,0x2000
    80003fb0:	17fd                	addi	a5,a5,-1
    80003fb2:	00d79513          	slli	a0,a5,0xd
    80003fb6:	9702                	jalr	a4
}
    80003fb8:	0001                	nop
    80003fba:	60e6                	ld	ra,88(sp)
    80003fbc:	6446                	ld	s0,80(sp)
    80003fbe:	64a6                	ld	s1,72(sp)
    80003fc0:	6125                	addi	sp,sp,96
    80003fc2:	8082                	ret

0000000080003fc4 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003fc4:	715d                	addi	sp,sp,-80
    80003fc6:	e486                	sd	ra,72(sp)
    80003fc8:	e0a2                	sd	s0,64(sp)
    80003fca:	fc26                	sd	s1,56(sp)
    80003fcc:	0880                	addi	s0,sp,80
  int which_dev = 0;
    80003fce:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003fd2:	00000097          	auipc	ra,0x0
    80003fd6:	a52080e7          	jalr	-1454(ra) # 80003a24 <r_sepc>
    80003fda:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003fde:	00000097          	auipc	ra,0x0
    80003fe2:	9c4080e7          	jalr	-1596(ra) # 800039a2 <r_sstatus>
    80003fe6:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003fea:	00000097          	auipc	ra,0x0
    80003fee:	a88080e7          	jalr	-1400(ra) # 80003a72 <r_scause>
    80003ff2:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003ff6:	fc843783          	ld	a5,-56(s0)
    80003ffa:	1007f793          	andi	a5,a5,256
    80003ffe:	eb89                	bnez	a5,80004010 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80004000:	00007517          	auipc	a0,0x7
    80004004:	31050513          	addi	a0,a0,784 # 8000b310 <etext+0x310>
    80004008:	ffffd097          	auipc	ra,0xffffd
    8000400c:	c48080e7          	jalr	-952(ra) # 80000c50 <panic>
  if(intr_get() != 0)
    80004010:	00000097          	auipc	ra,0x0
    80004014:	ae8080e7          	jalr	-1304(ra) # 80003af8 <intr_get>
    80004018:	87aa                	mv	a5,a0
    8000401a:	cb89                	beqz	a5,8000402c <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    8000401c:	00007517          	auipc	a0,0x7
    80004020:	31c50513          	addi	a0,a0,796 # 8000b338 <etext+0x338>
    80004024:	ffffd097          	auipc	ra,0xffffd
    80004028:	c2c080e7          	jalr	-980(ra) # 80000c50 <panic>

  if((which_dev = devintr()) == 0){
    8000402c:	00000097          	auipc	ra,0x0
    80004030:	166080e7          	jalr	358(ra) # 80004192 <devintr>
    80004034:	87aa                	mv	a5,a0
    80004036:	fcf42e23          	sw	a5,-36(s0)
    8000403a:	fdc42783          	lw	a5,-36(s0)
    8000403e:	2781                	sext.w	a5,a5
    80004040:	e7b9                	bnez	a5,8000408e <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80004042:	fc043583          	ld	a1,-64(s0)
    80004046:	00007517          	auipc	a0,0x7
    8000404a:	31250513          	addi	a0,a0,786 # 8000b358 <etext+0x358>
    8000404e:	ffffd097          	auipc	ra,0xffffd
    80004052:	9ac080e7          	jalr	-1620(ra) # 800009fa <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80004056:	00000097          	auipc	ra,0x0
    8000405a:	9ce080e7          	jalr	-1586(ra) # 80003a24 <r_sepc>
    8000405e:	84aa                	mv	s1,a0
    80004060:	00000097          	auipc	ra,0x0
    80004064:	a2c080e7          	jalr	-1492(ra) # 80003a8c <r_stval>
    80004068:	87aa                	mv	a5,a0
    8000406a:	863e                	mv	a2,a5
    8000406c:	85a6                	mv	a1,s1
    8000406e:	00007517          	auipc	a0,0x7
    80004072:	2fa50513          	addi	a0,a0,762 # 8000b368 <etext+0x368>
    80004076:	ffffd097          	auipc	ra,0xffffd
    8000407a:	984080e7          	jalr	-1660(ra) # 800009fa <printf>
    panic("kerneltrap");
    8000407e:	00007517          	auipc	a0,0x7
    80004082:	30250513          	addi	a0,a0,770 # 8000b380 <etext+0x380>
    80004086:	ffffd097          	auipc	ra,0xffffd
    8000408a:	bca080e7          	jalr	-1078(ra) # 80000c50 <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING){
    8000408e:	fdc42783          	lw	a5,-36(s0)
    80004092:	0007871b          	sext.w	a4,a5
    80004096:	4789                	li	a5,2
    80004098:	06f71d63          	bne	a4,a5,80004112 <kerneltrap+0x14e>
    8000409c:	ffffe097          	auipc	ra,0xffffe
    800040a0:	75a080e7          	jalr	1882(ra) # 800027f6 <myproc>
    800040a4:	87aa                	mv	a5,a0
    800040a6:	c7b5                	beqz	a5,80004112 <kerneltrap+0x14e>
    800040a8:	ffffe097          	auipc	ra,0xffffe
    800040ac:	74e080e7          	jalr	1870(ra) # 800027f6 <myproc>
    800040b0:	87aa                	mv	a5,a0
    800040b2:	4f9c                	lw	a5,24(a5)
    800040b4:	873e                	mv	a4,a5
    800040b6:	478d                	li	a5,3
    800040b8:	04f71d63          	bne	a4,a5,80004112 <kerneltrap+0x14e>
    // for mp3
    struct proc *p = myproc();
    800040bc:	ffffe097          	auipc	ra,0xffffe
    800040c0:	73a080e7          	jalr	1850(ra) # 800027f6 <myproc>
    800040c4:	faa43c23          	sd	a0,-72(s0)

    if(p->thrdstop_delay > 0){
    800040c8:	fb843783          	ld	a5,-72(s0)
    800040cc:	43bc                	lw	a5,64(a5)
    800040ce:	02f05e63          	blez	a5,8000410a <kerneltrap+0x146>
      p->thrdstop_ticks++;
    800040d2:	fb843783          	ld	a5,-72(s0)
    800040d6:	5fdc                	lw	a5,60(a5)
    800040d8:	2785                	addiw	a5,a5,1
    800040da:	0007871b          	sext.w	a4,a5
    800040de:	fb843783          	ld	a5,-72(s0)
    800040e2:	dfd8                	sw	a4,60(a5)
      if(p->thrdstop_ticks >= p->thrdstop_delay){
    800040e4:	fb843783          	ld	a5,-72(s0)
    800040e8:	5fd8                	lw	a4,60(a5)
    800040ea:	fb843783          	ld	a5,-72(s0)
    800040ee:	43bc                	lw	a5,64(a5)
    800040f0:	00f74d63          	blt	a4,a5,8000410a <kerneltrap+0x146>
        p->jump_flag = 1;
    800040f4:	fb843703          	ld	a4,-72(s0)
    800040f8:	6785                	lui	a5,0x1
    800040fa:	97ba                	add	a5,a5,a4
    800040fc:	4705                	li	a4,1
    800040fe:	28e7ac23          	sw	a4,664(a5) # 1298 <_entry-0x7fffed68>
        p->thrdstop_delay = -1;
    80004102:	fb843783          	ld	a5,-72(s0)
    80004106:	577d                	li	a4,-1
    80004108:	c3b8                	sw	a4,64(a5)
      }
    }
    yield();
    8000410a:	fffff097          	auipc	ra,0xfffff
    8000410e:	39e080e7          	jalr	926(ra) # 800034a8 <yield>
  }

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80004112:	fd043503          	ld	a0,-48(s0)
    80004116:	00000097          	auipc	ra,0x0
    8000411a:	8f4080e7          	jalr	-1804(ra) # 80003a0a <w_sepc>
  w_sstatus(sstatus);
    8000411e:	fc843503          	ld	a0,-56(s0)
    80004122:	00000097          	auipc	ra,0x0
    80004126:	89a080e7          	jalr	-1894(ra) # 800039bc <w_sstatus>

}
    8000412a:	0001                	nop
    8000412c:	60a6                	ld	ra,72(sp)
    8000412e:	6406                	ld	s0,64(sp)
    80004130:	74e2                	ld	s1,56(sp)
    80004132:	6161                	addi	sp,sp,80
    80004134:	8082                	ret

0000000080004136 <clockintr>:

void
clockintr()
{
    80004136:	1141                	addi	sp,sp,-16
    80004138:	e406                	sd	ra,8(sp)
    8000413a:	e022                	sd	s0,0(sp)
    8000413c:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    8000413e:	00060517          	auipc	a0,0x60
    80004142:	97250513          	addi	a0,a0,-1678 # 80063ab0 <tickslock>
    80004146:	ffffd097          	auipc	ra,0xffffd
    8000414a:	138080e7          	jalr	312(ra) # 8000127e <acquire>
  ticks++;
    8000414e:	00008797          	auipc	a5,0x8
    80004152:	ed278793          	addi	a5,a5,-302 # 8000c020 <ticks>
    80004156:	439c                	lw	a5,0(a5)
    80004158:	2785                	addiw	a5,a5,1
    8000415a:	0007871b          	sext.w	a4,a5
    8000415e:	00008797          	auipc	a5,0x8
    80004162:	ec278793          	addi	a5,a5,-318 # 8000c020 <ticks>
    80004166:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    80004168:	00008517          	auipc	a0,0x8
    8000416c:	eb850513          	addi	a0,a0,-328 # 8000c020 <ticks>
    80004170:	fffff097          	auipc	ra,0xfffff
    80004174:	466080e7          	jalr	1126(ra) # 800035d6 <wakeup>
  release(&tickslock);
    80004178:	00060517          	auipc	a0,0x60
    8000417c:	93850513          	addi	a0,a0,-1736 # 80063ab0 <tickslock>
    80004180:	ffffd097          	auipc	ra,0xffffd
    80004184:	162080e7          	jalr	354(ra) # 800012e2 <release>
}
    80004188:	0001                	nop
    8000418a:	60a2                	ld	ra,8(sp)
    8000418c:	6402                	ld	s0,0(sp)
    8000418e:	0141                	addi	sp,sp,16
    80004190:	8082                	ret

0000000080004192 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    80004192:	1101                	addi	sp,sp,-32
    80004194:	ec06                	sd	ra,24(sp)
    80004196:	e822                	sd	s0,16(sp)
    80004198:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    8000419a:	00000097          	auipc	ra,0x0
    8000419e:	8d8080e7          	jalr	-1832(ra) # 80003a72 <r_scause>
    800041a2:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    800041a6:	fe843783          	ld	a5,-24(s0)
    800041aa:	0807d463          	bgez	a5,80004232 <devintr+0xa0>
     (scause & 0xff) == 9){
    800041ae:	fe843783          	ld	a5,-24(s0)
    800041b2:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    800041b6:	47a5                	li	a5,9
    800041b8:	06f71d63          	bne	a4,a5,80004232 <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    800041bc:	00005097          	auipc	ra,0x5
    800041c0:	b46080e7          	jalr	-1210(ra) # 80008d02 <plic_claim>
    800041c4:	87aa                	mv	a5,a0
    800041c6:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    800041ca:	fe442783          	lw	a5,-28(s0)
    800041ce:	0007871b          	sext.w	a4,a5
    800041d2:	47a9                	li	a5,10
    800041d4:	00f71763          	bne	a4,a5,800041e2 <devintr+0x50>
      uartintr();
    800041d8:	ffffd097          	auipc	ra,0xffffd
    800041dc:	dae080e7          	jalr	-594(ra) # 80000f86 <uartintr>
    800041e0:	a825                	j	80004218 <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    800041e2:	fe442783          	lw	a5,-28(s0)
    800041e6:	0007871b          	sext.w	a4,a5
    800041ea:	4785                	li	a5,1
    800041ec:	00f71763          	bne	a4,a5,800041fa <devintr+0x68>
      virtio_disk_intr();
    800041f0:	00005097          	auipc	ra,0x5
    800041f4:	426080e7          	jalr	1062(ra) # 80009616 <virtio_disk_intr>
    800041f8:	a005                	j	80004218 <devintr+0x86>
    } else if(irq){
    800041fa:	fe442783          	lw	a5,-28(s0)
    800041fe:	2781                	sext.w	a5,a5
    80004200:	cf81                	beqz	a5,80004218 <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    80004202:	fe442783          	lw	a5,-28(s0)
    80004206:	85be                	mv	a1,a5
    80004208:	00007517          	auipc	a0,0x7
    8000420c:	18850513          	addi	a0,a0,392 # 8000b390 <etext+0x390>
    80004210:	ffffc097          	auipc	ra,0xffffc
    80004214:	7ea080e7          	jalr	2026(ra) # 800009fa <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    80004218:	fe442783          	lw	a5,-28(s0)
    8000421c:	2781                	sext.w	a5,a5
    8000421e:	cb81                	beqz	a5,8000422e <devintr+0x9c>
      plic_complete(irq);
    80004220:	fe442783          	lw	a5,-28(s0)
    80004224:	853e                	mv	a0,a5
    80004226:	00005097          	auipc	ra,0x5
    8000422a:	b1a080e7          	jalr	-1254(ra) # 80008d40 <plic_complete>

    return 1;
    8000422e:	4785                	li	a5,1
    80004230:	a081                	j	80004270 <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    80004232:	fe843703          	ld	a4,-24(s0)
    80004236:	57fd                	li	a5,-1
    80004238:	17fe                	slli	a5,a5,0x3f
    8000423a:	0785                	addi	a5,a5,1
    8000423c:	02f71963          	bne	a4,a5,8000426e <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    80004240:	ffffe097          	auipc	ra,0xffffe
    80004244:	558080e7          	jalr	1368(ra) # 80002798 <cpuid>
    80004248:	87aa                	mv	a5,a0
    8000424a:	e789                	bnez	a5,80004254 <devintr+0xc2>
      clockintr();
    8000424c:	00000097          	auipc	ra,0x0
    80004250:	eea080e7          	jalr	-278(ra) # 80004136 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    80004254:	fffff097          	auipc	ra,0xfffff
    80004258:	782080e7          	jalr	1922(ra) # 800039d6 <r_sip>
    8000425c:	87aa                	mv	a5,a0
    8000425e:	9bf5                	andi	a5,a5,-3
    80004260:	853e                	mv	a0,a5
    80004262:	fffff097          	auipc	ra,0xfffff
    80004266:	78e080e7          	jalr	1934(ra) # 800039f0 <w_sip>

    return 2;
    8000426a:	4789                	li	a5,2
    8000426c:	a011                	j	80004270 <devintr+0xde>
  } else {
    return 0;
    8000426e:	4781                	li	a5,0
  }
}
    80004270:	853e                	mv	a0,a5
    80004272:	60e2                	ld	ra,24(sp)
    80004274:	6442                	ld	s0,16(sp)
    80004276:	6105                	addi	sp,sp,32
    80004278:	8082                	ret

000000008000427a <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    8000427a:	7179                	addi	sp,sp,-48
    8000427c:	f406                	sd	ra,40(sp)
    8000427e:	f022                	sd	s0,32(sp)
    80004280:	1800                	addi	s0,sp,48
    80004282:	fca43c23          	sd	a0,-40(s0)
    80004286:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    8000428a:	ffffe097          	auipc	ra,0xffffe
    8000428e:	56c080e7          	jalr	1388(ra) # 800027f6 <myproc>
    80004292:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80004296:	fe843703          	ld	a4,-24(s0)
    8000429a:	6785                	lui	a5,0x1
    8000429c:	97ba                	add	a5,a5,a4
    8000429e:	2b07b783          	ld	a5,688(a5) # 12b0 <_entry-0x7fffed50>
    800042a2:	fd843703          	ld	a4,-40(s0)
    800042a6:	00f77e63          	bgeu	a4,a5,800042c2 <fetchaddr+0x48>
    800042aa:	fd843783          	ld	a5,-40(s0)
    800042ae:	00878713          	addi	a4,a5,8
    800042b2:	fe843683          	ld	a3,-24(s0)
    800042b6:	6785                	lui	a5,0x1
    800042b8:	97b6                	add	a5,a5,a3
    800042ba:	2b07b783          	ld	a5,688(a5) # 12b0 <_entry-0x7fffed50>
    800042be:	00e7f463          	bgeu	a5,a4,800042c6 <fetchaddr+0x4c>
    return -1;
    800042c2:	57fd                	li	a5,-1
    800042c4:	a035                	j	800042f0 <fetchaddr+0x76>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    800042c6:	fe843703          	ld	a4,-24(s0)
    800042ca:	6785                	lui	a5,0x1
    800042cc:	97ba                	add	a5,a5,a4
    800042ce:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    800042d2:	46a1                	li	a3,8
    800042d4:	fd843603          	ld	a2,-40(s0)
    800042d8:	fd043583          	ld	a1,-48(s0)
    800042dc:	853e                	mv	a0,a5
    800042de:	ffffe097          	auipc	ra,0xffffe
    800042e2:	0c2080e7          	jalr	194(ra) # 800023a0 <copyin>
    800042e6:	87aa                	mv	a5,a0
    800042e8:	c399                	beqz	a5,800042ee <fetchaddr+0x74>
    return -1;
    800042ea:	57fd                	li	a5,-1
    800042ec:	a011                	j	800042f0 <fetchaddr+0x76>
  return 0;
    800042ee:	4781                	li	a5,0
}
    800042f0:	853e                	mv	a0,a5
    800042f2:	70a2                	ld	ra,40(sp)
    800042f4:	7402                	ld	s0,32(sp)
    800042f6:	6145                	addi	sp,sp,48
    800042f8:	8082                	ret

00000000800042fa <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    800042fa:	7139                	addi	sp,sp,-64
    800042fc:	fc06                	sd	ra,56(sp)
    800042fe:	f822                	sd	s0,48(sp)
    80004300:	0080                	addi	s0,sp,64
    80004302:	fca43c23          	sd	a0,-40(s0)
    80004306:	fcb43823          	sd	a1,-48(s0)
    8000430a:	87b2                	mv	a5,a2
    8000430c:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	4e6080e7          	jalr	1254(ra) # 800027f6 <myproc>
    80004318:	fea43423          	sd	a0,-24(s0)
  int err = copyinstr(p->pagetable, buf, addr, max);
    8000431c:	fe843703          	ld	a4,-24(s0)
    80004320:	6785                	lui	a5,0x1
    80004322:	97ba                	add	a5,a5,a4
    80004324:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    80004328:	fcc42703          	lw	a4,-52(s0)
    8000432c:	86ba                	mv	a3,a4
    8000432e:	fd843603          	ld	a2,-40(s0)
    80004332:	fd043583          	ld	a1,-48(s0)
    80004336:	853e                	mv	a0,a5
    80004338:	ffffe097          	auipc	ra,0xffffe
    8000433c:	136080e7          	jalr	310(ra) # 8000246e <copyinstr>
    80004340:	87aa                	mv	a5,a0
    80004342:	fef42223          	sw	a5,-28(s0)
  if(err < 0)
    80004346:	fe442783          	lw	a5,-28(s0)
    8000434a:	2781                	sext.w	a5,a5
    8000434c:	0007d563          	bgez	a5,80004356 <fetchstr+0x5c>
    return err;
    80004350:	fe442783          	lw	a5,-28(s0)
    80004354:	a801                	j	80004364 <fetchstr+0x6a>
  return strlen(buf);
    80004356:	fd043503          	ld	a0,-48(s0)
    8000435a:	ffffd097          	auipc	ra,0xffffd
    8000435e:	468080e7          	jalr	1128(ra) # 800017c2 <strlen>
    80004362:	87aa                	mv	a5,a0
}
    80004364:	853e                	mv	a0,a5
    80004366:	70e2                	ld	ra,56(sp)
    80004368:	7442                	ld	s0,48(sp)
    8000436a:	6121                	addi	sp,sp,64
    8000436c:	8082                	ret

000000008000436e <argraw>:

static uint64
argraw(int n)
{
    8000436e:	7179                	addi	sp,sp,-48
    80004370:	f406                	sd	ra,40(sp)
    80004372:	f022                	sd	s0,32(sp)
    80004374:	1800                	addi	s0,sp,48
    80004376:	87aa                	mv	a5,a0
    80004378:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000437c:	ffffe097          	auipc	ra,0xffffe
    80004380:	47a080e7          	jalr	1146(ra) # 800027f6 <myproc>
    80004384:	fea43423          	sd	a0,-24(s0)
    80004388:	fdc42783          	lw	a5,-36(s0)
    8000438c:	0007871b          	sext.w	a4,a5
    80004390:	4795                	li	a5,5
    80004392:	08e7e463          	bltu	a5,a4,8000441a <argraw+0xac>
    80004396:	fdc46783          	lwu	a5,-36(s0)
    8000439a:	00279713          	slli	a4,a5,0x2
    8000439e:	00007797          	auipc	a5,0x7
    800043a2:	01a78793          	addi	a5,a5,26 # 8000b3b8 <etext+0x3b8>
    800043a6:	97ba                	add	a5,a5,a4
    800043a8:	439c                	lw	a5,0(a5)
    800043aa:	0007871b          	sext.w	a4,a5
    800043ae:	00007797          	auipc	a5,0x7
    800043b2:	00a78793          	addi	a5,a5,10 # 8000b3b8 <etext+0x3b8>
    800043b6:	97ba                	add	a5,a5,a4
    800043b8:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    800043ba:	fe843703          	ld	a4,-24(s0)
    800043be:	6785                	lui	a5,0x1
    800043c0:	97ba                	add	a5,a5,a4
    800043c2:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    800043c6:	7bbc                	ld	a5,112(a5)
    800043c8:	a08d                	j	8000442a <argraw+0xbc>
  case 1:
    return p->trapframe->a1;
    800043ca:	fe843703          	ld	a4,-24(s0)
    800043ce:	6785                	lui	a5,0x1
    800043d0:	97ba                	add	a5,a5,a4
    800043d2:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    800043d6:	7fbc                	ld	a5,120(a5)
    800043d8:	a889                	j	8000442a <argraw+0xbc>
  case 2:
    return p->trapframe->a2;
    800043da:	fe843703          	ld	a4,-24(s0)
    800043de:	6785                	lui	a5,0x1
    800043e0:	97ba                	add	a5,a5,a4
    800043e2:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    800043e6:	63dc                	ld	a5,128(a5)
    800043e8:	a089                	j	8000442a <argraw+0xbc>
  case 3:
    return p->trapframe->a3;
    800043ea:	fe843703          	ld	a4,-24(s0)
    800043ee:	6785                	lui	a5,0x1
    800043f0:	97ba                	add	a5,a5,a4
    800043f2:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    800043f6:	67dc                	ld	a5,136(a5)
    800043f8:	a80d                	j	8000442a <argraw+0xbc>
  case 4:
    return p->trapframe->a4;
    800043fa:	fe843703          	ld	a4,-24(s0)
    800043fe:	6785                	lui	a5,0x1
    80004400:	97ba                	add	a5,a5,a4
    80004402:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80004406:	6bdc                	ld	a5,144(a5)
    80004408:	a00d                	j	8000442a <argraw+0xbc>
  case 5:
    return p->trapframe->a5;
    8000440a:	fe843703          	ld	a4,-24(s0)
    8000440e:	6785                	lui	a5,0x1
    80004410:	97ba                	add	a5,a5,a4
    80004412:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80004416:	6fdc                	ld	a5,152(a5)
    80004418:	a809                	j	8000442a <argraw+0xbc>
  }
  panic("argraw");
    8000441a:	00007517          	auipc	a0,0x7
    8000441e:	f9650513          	addi	a0,a0,-106 # 8000b3b0 <etext+0x3b0>
    80004422:	ffffd097          	auipc	ra,0xffffd
    80004426:	82e080e7          	jalr	-2002(ra) # 80000c50 <panic>
  return -1;
}
    8000442a:	853e                	mv	a0,a5
    8000442c:	70a2                	ld	ra,40(sp)
    8000442e:	7402                	ld	s0,32(sp)
    80004430:	6145                	addi	sp,sp,48
    80004432:	8082                	ret

0000000080004434 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
    80004434:	1101                	addi	sp,sp,-32
    80004436:	ec06                	sd	ra,24(sp)
    80004438:	e822                	sd	s0,16(sp)
    8000443a:	1000                	addi	s0,sp,32
    8000443c:	87aa                	mv	a5,a0
    8000443e:	feb43023          	sd	a1,-32(s0)
    80004442:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004446:	fec42783          	lw	a5,-20(s0)
    8000444a:	853e                	mv	a0,a5
    8000444c:	00000097          	auipc	ra,0x0
    80004450:	f22080e7          	jalr	-222(ra) # 8000436e <argraw>
    80004454:	87aa                	mv	a5,a0
    80004456:	0007871b          	sext.w	a4,a5
    8000445a:	fe043783          	ld	a5,-32(s0)
    8000445e:	c398                	sw	a4,0(a5)
  return 0;
    80004460:	4781                	li	a5,0
}
    80004462:	853e                	mv	a0,a5
    80004464:	60e2                	ld	ra,24(sp)
    80004466:	6442                	ld	s0,16(sp)
    80004468:	6105                	addi	sp,sp,32
    8000446a:	8082                	ret

000000008000446c <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int
argaddr(int n, uint64 *ip)
{
    8000446c:	1101                	addi	sp,sp,-32
    8000446e:	ec06                	sd	ra,24(sp)
    80004470:	e822                	sd	s0,16(sp)
    80004472:	1000                	addi	s0,sp,32
    80004474:	87aa                	mv	a5,a0
    80004476:	feb43023          	sd	a1,-32(s0)
    8000447a:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    8000447e:	fec42783          	lw	a5,-20(s0)
    80004482:	853e                	mv	a0,a5
    80004484:	00000097          	auipc	ra,0x0
    80004488:	eea080e7          	jalr	-278(ra) # 8000436e <argraw>
    8000448c:	872a                	mv	a4,a0
    8000448e:	fe043783          	ld	a5,-32(s0)
    80004492:	e398                	sd	a4,0(a5)
  return 0;
    80004494:	4781                	li	a5,0
}
    80004496:	853e                	mv	a0,a5
    80004498:	60e2                	ld	ra,24(sp)
    8000449a:	6442                	ld	s0,16(sp)
    8000449c:	6105                	addi	sp,sp,32
    8000449e:	8082                	ret

00000000800044a0 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800044a0:	7179                	addi	sp,sp,-48
    800044a2:	f406                	sd	ra,40(sp)
    800044a4:	f022                	sd	s0,32(sp)
    800044a6:	1800                	addi	s0,sp,48
    800044a8:	87aa                	mv	a5,a0
    800044aa:	fcb43823          	sd	a1,-48(s0)
    800044ae:	8732                	mv	a4,a2
    800044b0:	fcf42e23          	sw	a5,-36(s0)
    800044b4:	87ba                	mv	a5,a4
    800044b6:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    800044ba:	fe840713          	addi	a4,s0,-24
    800044be:	fdc42783          	lw	a5,-36(s0)
    800044c2:	85ba                	mv	a1,a4
    800044c4:	853e                	mv	a0,a5
    800044c6:	00000097          	auipc	ra,0x0
    800044ca:	fa6080e7          	jalr	-90(ra) # 8000446c <argaddr>
    800044ce:	87aa                	mv	a5,a0
    800044d0:	0007d463          	bgez	a5,800044d8 <argstr+0x38>
    return -1;
    800044d4:	57fd                	li	a5,-1
    800044d6:	a831                	j	800044f2 <argstr+0x52>
  return fetchstr(addr, buf, max);
    800044d8:	fe843783          	ld	a5,-24(s0)
    800044dc:	fd842703          	lw	a4,-40(s0)
    800044e0:	863a                	mv	a2,a4
    800044e2:	fd043583          	ld	a1,-48(s0)
    800044e6:	853e                	mv	a0,a5
    800044e8:	00000097          	auipc	ra,0x0
    800044ec:	e12080e7          	jalr	-494(ra) # 800042fa <fetchstr>
    800044f0:	87aa                	mv	a5,a0
}
    800044f2:	853e                	mv	a0,a5
    800044f4:	70a2                	ld	ra,40(sp)
    800044f6:	7402                	ld	s0,32(sp)
    800044f8:	6145                	addi	sp,sp,48
    800044fa:	8082                	ret

00000000800044fc <syscall>:
[SYS_cancelthrdstop]   sys_cancelthrdstop,
};

void
syscall(void)
{
    800044fc:	7179                	addi	sp,sp,-48
    800044fe:	f406                	sd	ra,40(sp)
    80004500:	f022                	sd	s0,32(sp)
    80004502:	ec26                	sd	s1,24(sp)
    80004504:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004506:	ffffe097          	auipc	ra,0xffffe
    8000450a:	2f0080e7          	jalr	752(ra) # 800027f6 <myproc>
    8000450e:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80004512:	fd843703          	ld	a4,-40(s0)
    80004516:	6785                	lui	a5,0x1
    80004518:	97ba                	add	a5,a5,a4
    8000451a:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    8000451e:	77dc                	ld	a5,168(a5)
    80004520:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80004524:	fd442783          	lw	a5,-44(s0)
    80004528:	2781                	sext.w	a5,a5
    8000452a:	04f05563          	blez	a5,80004574 <syscall+0x78>
    8000452e:	fd442783          	lw	a5,-44(s0)
    80004532:	873e                	mv	a4,a5
    80004534:	47e1                	li	a5,24
    80004536:	02e7ef63          	bltu	a5,a4,80004574 <syscall+0x78>
    8000453a:	00007717          	auipc	a4,0x7
    8000453e:	29e70713          	addi	a4,a4,670 # 8000b7d8 <syscalls>
    80004542:	fd442783          	lw	a5,-44(s0)
    80004546:	078e                	slli	a5,a5,0x3
    80004548:	97ba                	add	a5,a5,a4
    8000454a:	639c                	ld	a5,0(a5)
    8000454c:	c785                	beqz	a5,80004574 <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    8000454e:	00007717          	auipc	a4,0x7
    80004552:	28a70713          	addi	a4,a4,650 # 8000b7d8 <syscalls>
    80004556:	fd442783          	lw	a5,-44(s0)
    8000455a:	078e                	slli	a5,a5,0x3
    8000455c:	97ba                	add	a5,a5,a4
    8000455e:	6394                	ld	a3,0(a5)
    80004560:	fd843703          	ld	a4,-40(s0)
    80004564:	6785                	lui	a5,0x1
    80004566:	97ba                	add	a5,a5,a4
    80004568:	2c07b483          	ld	s1,704(a5) # 12c0 <_entry-0x7fffed40>
    8000456c:	9682                	jalr	a3
    8000456e:	87aa                	mv	a5,a0
    80004570:	f8bc                	sd	a5,112(s1)
    80004572:	a83d                	j	800045b0 <syscall+0xb4>
  } else {
    printf("%d %s: unknown sys call %d\n",
    80004574:	fd843783          	ld	a5,-40(s0)
    80004578:	5f8c                	lw	a1,56(a5)
            p->pid, p->name, num);
    8000457a:	fd843703          	ld	a4,-40(s0)
    8000457e:	6785                	lui	a5,0x1
    80004580:	3c078793          	addi	a5,a5,960 # 13c0 <_entry-0x7fffec40>
    80004584:	97ba                	add	a5,a5,a4
    printf("%d %s: unknown sys call %d\n",
    80004586:	fd442703          	lw	a4,-44(s0)
    8000458a:	86ba                	mv	a3,a4
    8000458c:	863e                	mv	a2,a5
    8000458e:	00007517          	auipc	a0,0x7
    80004592:	e4250513          	addi	a0,a0,-446 # 8000b3d0 <etext+0x3d0>
    80004596:	ffffc097          	auipc	ra,0xffffc
    8000459a:	464080e7          	jalr	1124(ra) # 800009fa <printf>
    p->trapframe->a0 = -1;
    8000459e:	fd843703          	ld	a4,-40(s0)
    800045a2:	6785                	lui	a5,0x1
    800045a4:	97ba                	add	a5,a5,a4
    800045a6:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    800045aa:	577d                	li	a4,-1
    800045ac:	fbb8                	sd	a4,112(a5)
  }
}
    800045ae:	0001                	nop
    800045b0:	0001                	nop
    800045b2:	70a2                	ld	ra,40(sp)
    800045b4:	7402                	ld	s0,32(sp)
    800045b6:	64e2                	ld	s1,24(sp)
    800045b8:	6145                	addi	sp,sp,48
    800045ba:	8082                	ret

00000000800045bc <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800045bc:	1101                	addi	sp,sp,-32
    800045be:	ec06                	sd	ra,24(sp)
    800045c0:	e822                	sd	s0,16(sp)
    800045c2:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    800045c4:	fec40793          	addi	a5,s0,-20
    800045c8:	85be                	mv	a1,a5
    800045ca:	4501                	li	a0,0
    800045cc:	00000097          	auipc	ra,0x0
    800045d0:	e68080e7          	jalr	-408(ra) # 80004434 <argint>
    800045d4:	87aa                	mv	a5,a0
    800045d6:	0007d463          	bgez	a5,800045de <sys_exit+0x22>
    return -1;
    800045da:	57fd                	li	a5,-1
    800045dc:	a809                	j	800045ee <sys_exit+0x32>
  exit(n);
    800045de:	fec42783          	lw	a5,-20(s0)
    800045e2:	853e                	mv	a0,a5
    800045e4:	fffff097          	auipc	ra,0xfffff
    800045e8:	a20080e7          	jalr	-1504(ra) # 80003004 <exit>
  return 0;  // not reached
    800045ec:	4781                	li	a5,0
}
    800045ee:	853e                	mv	a0,a5
    800045f0:	60e2                	ld	ra,24(sp)
    800045f2:	6442                	ld	s0,16(sp)
    800045f4:	6105                	addi	sp,sp,32
    800045f6:	8082                	ret

00000000800045f8 <sys_getpid>:

uint64
sys_getpid(void)
{
    800045f8:	1141                	addi	sp,sp,-16
    800045fa:	e406                	sd	ra,8(sp)
    800045fc:	e022                	sd	s0,0(sp)
    800045fe:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80004600:	ffffe097          	auipc	ra,0xffffe
    80004604:	1f6080e7          	jalr	502(ra) # 800027f6 <myproc>
    80004608:	87aa                	mv	a5,a0
    8000460a:	5f9c                	lw	a5,56(a5)
}
    8000460c:	853e                	mv	a0,a5
    8000460e:	60a2                	ld	ra,8(sp)
    80004610:	6402                	ld	s0,0(sp)
    80004612:	0141                	addi	sp,sp,16
    80004614:	8082                	ret

0000000080004616 <sys_fork>:

uint64
sys_fork(void)
{
    80004616:	1141                	addi	sp,sp,-16
    80004618:	e406                	sd	ra,8(sp)
    8000461a:	e022                	sd	s0,0(sp)
    8000461c:	0800                	addi	s0,sp,16
  return fork();
    8000461e:	ffffe097          	auipc	ra,0xffffe
    80004622:	7ae080e7          	jalr	1966(ra) # 80002dcc <fork>
    80004626:	87aa                	mv	a5,a0
}
    80004628:	853e                	mv	a0,a5
    8000462a:	60a2                	ld	ra,8(sp)
    8000462c:	6402                	ld	s0,0(sp)
    8000462e:	0141                	addi	sp,sp,16
    80004630:	8082                	ret

0000000080004632 <sys_wait>:

uint64
sys_wait(void)
{
    80004632:	1101                	addi	sp,sp,-32
    80004634:	ec06                	sd	ra,24(sp)
    80004636:	e822                	sd	s0,16(sp)
    80004638:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    8000463a:	fe840793          	addi	a5,s0,-24
    8000463e:	85be                	mv	a1,a5
    80004640:	4501                	li	a0,0
    80004642:	00000097          	auipc	ra,0x0
    80004646:	e2a080e7          	jalr	-470(ra) # 8000446c <argaddr>
    8000464a:	87aa                	mv	a5,a0
    8000464c:	0007d463          	bgez	a5,80004654 <sys_wait+0x22>
    return -1;
    80004650:	57fd                	li	a5,-1
    80004652:	a809                	j	80004664 <sys_wait+0x32>
  return wait(p);
    80004654:	fe843783          	ld	a5,-24(s0)
    80004658:	853e                	mv	a0,a5
    8000465a:	fffff097          	auipc	ra,0xfffff
    8000465e:	b4e080e7          	jalr	-1202(ra) # 800031a8 <wait>
    80004662:	87aa                	mv	a5,a0
}
    80004664:	853e                	mv	a0,a5
    80004666:	60e2                	ld	ra,24(sp)
    80004668:	6442                	ld	s0,16(sp)
    8000466a:	6105                	addi	sp,sp,32
    8000466c:	8082                	ret

000000008000466e <sys_sbrk>:

uint64
sys_sbrk(void)
{
    8000466e:	1101                	addi	sp,sp,-32
    80004670:	ec06                	sd	ra,24(sp)
    80004672:	e822                	sd	s0,16(sp)
    80004674:	1000                	addi	s0,sp,32
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80004676:	fe840793          	addi	a5,s0,-24
    8000467a:	85be                	mv	a1,a5
    8000467c:	4501                	li	a0,0
    8000467e:	00000097          	auipc	ra,0x0
    80004682:	db6080e7          	jalr	-586(ra) # 80004434 <argint>
    80004686:	87aa                	mv	a5,a0
    80004688:	0007d463          	bgez	a5,80004690 <sys_sbrk+0x22>
    return -1;
    8000468c:	57fd                	li	a5,-1
    8000468e:	a815                	j	800046c2 <sys_sbrk+0x54>
  addr = myproc()->sz;
    80004690:	ffffe097          	auipc	ra,0xffffe
    80004694:	166080e7          	jalr	358(ra) # 800027f6 <myproc>
    80004698:	872a                	mv	a4,a0
    8000469a:	6785                	lui	a5,0x1
    8000469c:	97ba                	add	a5,a5,a4
    8000469e:	2b07b783          	ld	a5,688(a5) # 12b0 <_entry-0x7fffed50>
    800046a2:	fef42623          	sw	a5,-20(s0)
  if(growproc(n) < 0)
    800046a6:	fe842783          	lw	a5,-24(s0)
    800046aa:	853e                	mv	a0,a5
    800046ac:	ffffe097          	auipc	ra,0xffffe
    800046b0:	656080e7          	jalr	1622(ra) # 80002d02 <growproc>
    800046b4:	87aa                	mv	a5,a0
    800046b6:	0007d463          	bgez	a5,800046be <sys_sbrk+0x50>
    return -1;
    800046ba:	57fd                	li	a5,-1
    800046bc:	a019                	j	800046c2 <sys_sbrk+0x54>
  return addr;
    800046be:	fec42783          	lw	a5,-20(s0)
}
    800046c2:	853e                	mv	a0,a5
    800046c4:	60e2                	ld	ra,24(sp)
    800046c6:	6442                	ld	s0,16(sp)
    800046c8:	6105                	addi	sp,sp,32
    800046ca:	8082                	ret

00000000800046cc <sys_sleep>:

uint64
sys_sleep(void)
{
    800046cc:	1101                	addi	sp,sp,-32
    800046ce:	ec06                	sd	ra,24(sp)
    800046d0:	e822                	sd	s0,16(sp)
    800046d2:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    800046d4:	fe840793          	addi	a5,s0,-24
    800046d8:	85be                	mv	a1,a5
    800046da:	4501                	li	a0,0
    800046dc:	00000097          	auipc	ra,0x0
    800046e0:	d58080e7          	jalr	-680(ra) # 80004434 <argint>
    800046e4:	87aa                	mv	a5,a0
    800046e6:	0007d463          	bgez	a5,800046ee <sys_sleep+0x22>
    return -1;
    800046ea:	57fd                	li	a5,-1
    800046ec:	a079                	j	8000477a <sys_sleep+0xae>
  acquire(&tickslock);
    800046ee:	0005f517          	auipc	a0,0x5f
    800046f2:	3c250513          	addi	a0,a0,962 # 80063ab0 <tickslock>
    800046f6:	ffffd097          	auipc	ra,0xffffd
    800046fa:	b88080e7          	jalr	-1144(ra) # 8000127e <acquire>
  ticks0 = ticks;
    800046fe:	00008797          	auipc	a5,0x8
    80004702:	92278793          	addi	a5,a5,-1758 # 8000c020 <ticks>
    80004706:	439c                	lw	a5,0(a5)
    80004708:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    8000470c:	a835                	j	80004748 <sys_sleep+0x7c>
    if(myproc()->killed){
    8000470e:	ffffe097          	auipc	ra,0xffffe
    80004712:	0e8080e7          	jalr	232(ra) # 800027f6 <myproc>
    80004716:	87aa                	mv	a5,a0
    80004718:	5b9c                	lw	a5,48(a5)
    8000471a:	cb99                	beqz	a5,80004730 <sys_sleep+0x64>
      release(&tickslock);
    8000471c:	0005f517          	auipc	a0,0x5f
    80004720:	39450513          	addi	a0,a0,916 # 80063ab0 <tickslock>
    80004724:	ffffd097          	auipc	ra,0xffffd
    80004728:	bbe080e7          	jalr	-1090(ra) # 800012e2 <release>
      return -1;
    8000472c:	57fd                	li	a5,-1
    8000472e:	a0b1                	j	8000477a <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    80004730:	0005f597          	auipc	a1,0x5f
    80004734:	38058593          	addi	a1,a1,896 # 80063ab0 <tickslock>
    80004738:	00008517          	auipc	a0,0x8
    8000473c:	8e850513          	addi	a0,a0,-1816 # 8000c020 <ticks>
    80004740:	fffff097          	auipc	ra,0xfffff
    80004744:	e02080e7          	jalr	-510(ra) # 80003542 <sleep>
  while(ticks - ticks0 < n){
    80004748:	00008797          	auipc	a5,0x8
    8000474c:	8d878793          	addi	a5,a5,-1832 # 8000c020 <ticks>
    80004750:	4398                	lw	a4,0(a5)
    80004752:	fec42783          	lw	a5,-20(s0)
    80004756:	40f707bb          	subw	a5,a4,a5
    8000475a:	0007871b          	sext.w	a4,a5
    8000475e:	fe842783          	lw	a5,-24(s0)
    80004762:	2781                	sext.w	a5,a5
    80004764:	faf765e3          	bltu	a4,a5,8000470e <sys_sleep+0x42>
  }
  release(&tickslock);
    80004768:	0005f517          	auipc	a0,0x5f
    8000476c:	34850513          	addi	a0,a0,840 # 80063ab0 <tickslock>
    80004770:	ffffd097          	auipc	ra,0xffffd
    80004774:	b72080e7          	jalr	-1166(ra) # 800012e2 <release>
  return 0;
    80004778:	4781                	li	a5,0
}
    8000477a:	853e                	mv	a0,a5
    8000477c:	60e2                	ld	ra,24(sp)
    8000477e:	6442                	ld	s0,16(sp)
    80004780:	6105                	addi	sp,sp,32
    80004782:	8082                	ret

0000000080004784 <sys_kill>:

uint64
sys_kill(void)
{
    80004784:	1101                	addi	sp,sp,-32
    80004786:	ec06                	sd	ra,24(sp)
    80004788:	e822                	sd	s0,16(sp)
    8000478a:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    8000478c:	fec40793          	addi	a5,s0,-20
    80004790:	85be                	mv	a1,a5
    80004792:	4501                	li	a0,0
    80004794:	00000097          	auipc	ra,0x0
    80004798:	ca0080e7          	jalr	-864(ra) # 80004434 <argint>
    8000479c:	87aa                	mv	a5,a0
    8000479e:	0007d463          	bgez	a5,800047a6 <sys_kill+0x22>
    return -1;
    800047a2:	57fd                	li	a5,-1
    800047a4:	a809                	j	800047b6 <sys_kill+0x32>
  return kill(pid);
    800047a6:	fec42783          	lw	a5,-20(s0)
    800047aa:	853e                	mv	a0,a5
    800047ac:	fffff097          	auipc	ra,0xfffff
    800047b0:	f0c080e7          	jalr	-244(ra) # 800036b8 <kill>
    800047b4:	87aa                	mv	a5,a0
}
    800047b6:	853e                	mv	a0,a5
    800047b8:	60e2                	ld	ra,24(sp)
    800047ba:	6442                	ld	s0,16(sp)
    800047bc:	6105                	addi	sp,sp,32
    800047be:	8082                	ret

00000000800047c0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    800047c0:	1101                	addi	sp,sp,-32
    800047c2:	ec06                	sd	ra,24(sp)
    800047c4:	e822                	sd	s0,16(sp)
    800047c6:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    800047c8:	0005f517          	auipc	a0,0x5f
    800047cc:	2e850513          	addi	a0,a0,744 # 80063ab0 <tickslock>
    800047d0:	ffffd097          	auipc	ra,0xffffd
    800047d4:	aae080e7          	jalr	-1362(ra) # 8000127e <acquire>
  xticks = ticks;
    800047d8:	00008797          	auipc	a5,0x8
    800047dc:	84878793          	addi	a5,a5,-1976 # 8000c020 <ticks>
    800047e0:	439c                	lw	a5,0(a5)
    800047e2:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    800047e6:	0005f517          	auipc	a0,0x5f
    800047ea:	2ca50513          	addi	a0,a0,714 # 80063ab0 <tickslock>
    800047ee:	ffffd097          	auipc	ra,0xffffd
    800047f2:	af4080e7          	jalr	-1292(ra) # 800012e2 <release>
  return xticks;
    800047f6:	fec46783          	lwu	a5,-20(s0)
}
    800047fa:	853e                	mv	a0,a5
    800047fc:	60e2                	ld	ra,24(sp)
    800047fe:	6442                	ld	s0,16(sp)
    80004800:	6105                	addi	sp,sp,32
    80004802:	8082                	ret

0000000080004804 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80004804:	1101                	addi	sp,sp,-32
    80004806:	ec06                	sd	ra,24(sp)
    80004808:	e822                	sd	s0,16(sp)
    8000480a:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    8000480c:	00007597          	auipc	a1,0x7
    80004810:	be458593          	addi	a1,a1,-1052 # 8000b3f0 <etext+0x3f0>
    80004814:	0005f517          	auipc	a0,0x5f
    80004818:	2b450513          	addi	a0,a0,692 # 80063ac8 <bcache>
    8000481c:	ffffd097          	auipc	ra,0xffffd
    80004820:	a32080e7          	jalr	-1486(ra) # 8000124e <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80004824:	0005f717          	auipc	a4,0x5f
    80004828:	2a470713          	addi	a4,a4,676 # 80063ac8 <bcache>
    8000482c:	67a1                	lui	a5,0x8
    8000482e:	97ba                	add	a5,a5,a4
    80004830:	00067717          	auipc	a4,0x67
    80004834:	50070713          	addi	a4,a4,1280 # 8006bd30 <bcache+0x8268>
    80004838:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    8000483c:	0005f717          	auipc	a4,0x5f
    80004840:	28c70713          	addi	a4,a4,652 # 80063ac8 <bcache>
    80004844:	67a1                	lui	a5,0x8
    80004846:	97ba                	add	a5,a5,a4
    80004848:	00067717          	auipc	a4,0x67
    8000484c:	4e870713          	addi	a4,a4,1256 # 8006bd30 <bcache+0x8268>
    80004850:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004854:	0005f797          	auipc	a5,0x5f
    80004858:	28c78793          	addi	a5,a5,652 # 80063ae0 <bcache+0x18>
    8000485c:	fef43423          	sd	a5,-24(s0)
    80004860:	a895                	j	800048d4 <binit+0xd0>
    b->next = bcache.head.next;
    80004862:	0005f717          	auipc	a4,0x5f
    80004866:	26670713          	addi	a4,a4,614 # 80063ac8 <bcache>
    8000486a:	67a1                	lui	a5,0x8
    8000486c:	97ba                	add	a5,a5,a4
    8000486e:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004872:	fe843783          	ld	a5,-24(s0)
    80004876:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004878:	fe843783          	ld	a5,-24(s0)
    8000487c:	00067717          	auipc	a4,0x67
    80004880:	4b470713          	addi	a4,a4,1204 # 8006bd30 <bcache+0x8268>
    80004884:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004886:	fe843783          	ld	a5,-24(s0)
    8000488a:	07c1                	addi	a5,a5,16
    8000488c:	00007597          	auipc	a1,0x7
    80004890:	b6c58593          	addi	a1,a1,-1172 # 8000b3f8 <etext+0x3f8>
    80004894:	853e                	mv	a0,a5
    80004896:	00002097          	auipc	ra,0x2
    8000489a:	00a080e7          	jalr	10(ra) # 800068a0 <initsleeplock>
    bcache.head.next->prev = b;
    8000489e:	0005f717          	auipc	a4,0x5f
    800048a2:	22a70713          	addi	a4,a4,554 # 80063ac8 <bcache>
    800048a6:	67a1                	lui	a5,0x8
    800048a8:	97ba                	add	a5,a5,a4
    800048aa:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800048ae:	fe843703          	ld	a4,-24(s0)
    800048b2:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    800048b4:	0005f717          	auipc	a4,0x5f
    800048b8:	21470713          	addi	a4,a4,532 # 80063ac8 <bcache>
    800048bc:	67a1                	lui	a5,0x8
    800048be:	97ba                	add	a5,a5,a4
    800048c0:	fe843703          	ld	a4,-24(s0)
    800048c4:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    800048c8:	fe843783          	ld	a5,-24(s0)
    800048cc:	45878793          	addi	a5,a5,1112
    800048d0:	fef43423          	sd	a5,-24(s0)
    800048d4:	00067797          	auipc	a5,0x67
    800048d8:	45c78793          	addi	a5,a5,1116 # 8006bd30 <bcache+0x8268>
    800048dc:	fe843703          	ld	a4,-24(s0)
    800048e0:	f8f761e3          	bltu	a4,a5,80004862 <binit+0x5e>
  }
}
    800048e4:	0001                	nop
    800048e6:	0001                	nop
    800048e8:	60e2                	ld	ra,24(sp)
    800048ea:	6442                	ld	s0,16(sp)
    800048ec:	6105                	addi	sp,sp,32
    800048ee:	8082                	ret

00000000800048f0 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    800048f0:	7179                	addi	sp,sp,-48
    800048f2:	f406                	sd	ra,40(sp)
    800048f4:	f022                	sd	s0,32(sp)
    800048f6:	1800                	addi	s0,sp,48
    800048f8:	87aa                	mv	a5,a0
    800048fa:	872e                	mv	a4,a1
    800048fc:	fcf42e23          	sw	a5,-36(s0)
    80004900:	87ba                	mv	a5,a4
    80004902:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80004906:	0005f517          	auipc	a0,0x5f
    8000490a:	1c250513          	addi	a0,a0,450 # 80063ac8 <bcache>
    8000490e:	ffffd097          	auipc	ra,0xffffd
    80004912:	970080e7          	jalr	-1680(ra) # 8000127e <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004916:	0005f717          	auipc	a4,0x5f
    8000491a:	1b270713          	addi	a4,a4,434 # 80063ac8 <bcache>
    8000491e:	67a1                	lui	a5,0x8
    80004920:	97ba                	add	a5,a5,a4
    80004922:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004926:	fef43423          	sd	a5,-24(s0)
    8000492a:	a095                	j	8000498e <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    8000492c:	fe843783          	ld	a5,-24(s0)
    80004930:	4798                	lw	a4,8(a5)
    80004932:	fdc42783          	lw	a5,-36(s0)
    80004936:	2781                	sext.w	a5,a5
    80004938:	04e79663          	bne	a5,a4,80004984 <bget+0x94>
    8000493c:	fe843783          	ld	a5,-24(s0)
    80004940:	47d8                	lw	a4,12(a5)
    80004942:	fd842783          	lw	a5,-40(s0)
    80004946:	2781                	sext.w	a5,a5
    80004948:	02e79e63          	bne	a5,a4,80004984 <bget+0x94>
      b->refcnt++;
    8000494c:	fe843783          	ld	a5,-24(s0)
    80004950:	43bc                	lw	a5,64(a5)
    80004952:	2785                	addiw	a5,a5,1
    80004954:	0007871b          	sext.w	a4,a5
    80004958:	fe843783          	ld	a5,-24(s0)
    8000495c:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    8000495e:	0005f517          	auipc	a0,0x5f
    80004962:	16a50513          	addi	a0,a0,362 # 80063ac8 <bcache>
    80004966:	ffffd097          	auipc	ra,0xffffd
    8000496a:	97c080e7          	jalr	-1668(ra) # 800012e2 <release>
      acquiresleep(&b->lock);
    8000496e:	fe843783          	ld	a5,-24(s0)
    80004972:	07c1                	addi	a5,a5,16
    80004974:	853e                	mv	a0,a5
    80004976:	00002097          	auipc	ra,0x2
    8000497a:	f76080e7          	jalr	-138(ra) # 800068ec <acquiresleep>
      return b;
    8000497e:	fe843783          	ld	a5,-24(s0)
    80004982:	a07d                	j	80004a30 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004984:	fe843783          	ld	a5,-24(s0)
    80004988:	6bbc                	ld	a5,80(a5)
    8000498a:	fef43423          	sd	a5,-24(s0)
    8000498e:	fe843703          	ld	a4,-24(s0)
    80004992:	00067797          	auipc	a5,0x67
    80004996:	39e78793          	addi	a5,a5,926 # 8006bd30 <bcache+0x8268>
    8000499a:	f8f719e3          	bne	a4,a5,8000492c <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8000499e:	0005f717          	auipc	a4,0x5f
    800049a2:	12a70713          	addi	a4,a4,298 # 80063ac8 <bcache>
    800049a6:	67a1                	lui	a5,0x8
    800049a8:	97ba                	add	a5,a5,a4
    800049aa:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    800049ae:	fef43423          	sd	a5,-24(s0)
    800049b2:	a8b9                	j	80004a10 <bget+0x120>
    if(b->refcnt == 0) {
    800049b4:	fe843783          	ld	a5,-24(s0)
    800049b8:	43bc                	lw	a5,64(a5)
    800049ba:	e7b1                	bnez	a5,80004a06 <bget+0x116>
      b->dev = dev;
    800049bc:	fe843783          	ld	a5,-24(s0)
    800049c0:	fdc42703          	lw	a4,-36(s0)
    800049c4:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    800049c6:	fe843783          	ld	a5,-24(s0)
    800049ca:	fd842703          	lw	a4,-40(s0)
    800049ce:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    800049d0:	fe843783          	ld	a5,-24(s0)
    800049d4:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    800049d8:	fe843783          	ld	a5,-24(s0)
    800049dc:	4705                	li	a4,1
    800049de:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800049e0:	0005f517          	auipc	a0,0x5f
    800049e4:	0e850513          	addi	a0,a0,232 # 80063ac8 <bcache>
    800049e8:	ffffd097          	auipc	ra,0xffffd
    800049ec:	8fa080e7          	jalr	-1798(ra) # 800012e2 <release>
      acquiresleep(&b->lock);
    800049f0:	fe843783          	ld	a5,-24(s0)
    800049f4:	07c1                	addi	a5,a5,16
    800049f6:	853e                	mv	a0,a5
    800049f8:	00002097          	auipc	ra,0x2
    800049fc:	ef4080e7          	jalr	-268(ra) # 800068ec <acquiresleep>
      return b;
    80004a00:	fe843783          	ld	a5,-24(s0)
    80004a04:	a035                	j	80004a30 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004a06:	fe843783          	ld	a5,-24(s0)
    80004a0a:	67bc                	ld	a5,72(a5)
    80004a0c:	fef43423          	sd	a5,-24(s0)
    80004a10:	fe843703          	ld	a4,-24(s0)
    80004a14:	00067797          	auipc	a5,0x67
    80004a18:	31c78793          	addi	a5,a5,796 # 8006bd30 <bcache+0x8268>
    80004a1c:	f8f71ce3          	bne	a4,a5,800049b4 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    80004a20:	00007517          	auipc	a0,0x7
    80004a24:	9e050513          	addi	a0,a0,-1568 # 8000b400 <etext+0x400>
    80004a28:	ffffc097          	auipc	ra,0xffffc
    80004a2c:	228080e7          	jalr	552(ra) # 80000c50 <panic>
}
    80004a30:	853e                	mv	a0,a5
    80004a32:	70a2                	ld	ra,40(sp)
    80004a34:	7402                	ld	s0,32(sp)
    80004a36:	6145                	addi	sp,sp,48
    80004a38:	8082                	ret

0000000080004a3a <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004a3a:	7179                	addi	sp,sp,-48
    80004a3c:	f406                	sd	ra,40(sp)
    80004a3e:	f022                	sd	s0,32(sp)
    80004a40:	1800                	addi	s0,sp,48
    80004a42:	87aa                	mv	a5,a0
    80004a44:	872e                	mv	a4,a1
    80004a46:	fcf42e23          	sw	a5,-36(s0)
    80004a4a:	87ba                	mv	a5,a4
    80004a4c:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004a50:	fd842703          	lw	a4,-40(s0)
    80004a54:	fdc42783          	lw	a5,-36(s0)
    80004a58:	85ba                	mv	a1,a4
    80004a5a:	853e                	mv	a0,a5
    80004a5c:	00000097          	auipc	ra,0x0
    80004a60:	e94080e7          	jalr	-364(ra) # 800048f0 <bget>
    80004a64:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004a68:	fe843783          	ld	a5,-24(s0)
    80004a6c:	439c                	lw	a5,0(a5)
    80004a6e:	ef81                	bnez	a5,80004a86 <bread+0x4c>
    virtio_disk_rw(b, 0);
    80004a70:	4581                	li	a1,0
    80004a72:	fe843503          	ld	a0,-24(s0)
    80004a76:	00005097          	auipc	ra,0x5
    80004a7a:	804080e7          	jalr	-2044(ra) # 8000927a <virtio_disk_rw>
    b->valid = 1;
    80004a7e:	fe843783          	ld	a5,-24(s0)
    80004a82:	4705                	li	a4,1
    80004a84:	c398                	sw	a4,0(a5)
  }
  return b;
    80004a86:	fe843783          	ld	a5,-24(s0)
}
    80004a8a:	853e                	mv	a0,a5
    80004a8c:	70a2                	ld	ra,40(sp)
    80004a8e:	7402                	ld	s0,32(sp)
    80004a90:	6145                	addi	sp,sp,48
    80004a92:	8082                	ret

0000000080004a94 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004a94:	1101                	addi	sp,sp,-32
    80004a96:	ec06                	sd	ra,24(sp)
    80004a98:	e822                	sd	s0,16(sp)
    80004a9a:	1000                	addi	s0,sp,32
    80004a9c:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004aa0:	fe843783          	ld	a5,-24(s0)
    80004aa4:	07c1                	addi	a5,a5,16
    80004aa6:	853e                	mv	a0,a5
    80004aa8:	00002097          	auipc	ra,0x2
    80004aac:	f04080e7          	jalr	-252(ra) # 800069ac <holdingsleep>
    80004ab0:	87aa                	mv	a5,a0
    80004ab2:	eb89                	bnez	a5,80004ac4 <bwrite+0x30>
    panic("bwrite");
    80004ab4:	00007517          	auipc	a0,0x7
    80004ab8:	96450513          	addi	a0,a0,-1692 # 8000b418 <etext+0x418>
    80004abc:	ffffc097          	auipc	ra,0xffffc
    80004ac0:	194080e7          	jalr	404(ra) # 80000c50 <panic>
  virtio_disk_rw(b, 1);
    80004ac4:	4585                	li	a1,1
    80004ac6:	fe843503          	ld	a0,-24(s0)
    80004aca:	00004097          	auipc	ra,0x4
    80004ace:	7b0080e7          	jalr	1968(ra) # 8000927a <virtio_disk_rw>
}
    80004ad2:	0001                	nop
    80004ad4:	60e2                	ld	ra,24(sp)
    80004ad6:	6442                	ld	s0,16(sp)
    80004ad8:	6105                	addi	sp,sp,32
    80004ada:	8082                	ret

0000000080004adc <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004adc:	1101                	addi	sp,sp,-32
    80004ade:	ec06                	sd	ra,24(sp)
    80004ae0:	e822                	sd	s0,16(sp)
    80004ae2:	1000                	addi	s0,sp,32
    80004ae4:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004ae8:	fe843783          	ld	a5,-24(s0)
    80004aec:	07c1                	addi	a5,a5,16
    80004aee:	853e                	mv	a0,a5
    80004af0:	00002097          	auipc	ra,0x2
    80004af4:	ebc080e7          	jalr	-324(ra) # 800069ac <holdingsleep>
    80004af8:	87aa                	mv	a5,a0
    80004afa:	eb89                	bnez	a5,80004b0c <brelse+0x30>
    panic("brelse");
    80004afc:	00007517          	auipc	a0,0x7
    80004b00:	92450513          	addi	a0,a0,-1756 # 8000b420 <etext+0x420>
    80004b04:	ffffc097          	auipc	ra,0xffffc
    80004b08:	14c080e7          	jalr	332(ra) # 80000c50 <panic>

  releasesleep(&b->lock);
    80004b0c:	fe843783          	ld	a5,-24(s0)
    80004b10:	07c1                	addi	a5,a5,16
    80004b12:	853e                	mv	a0,a5
    80004b14:	00002097          	auipc	ra,0x2
    80004b18:	e46080e7          	jalr	-442(ra) # 8000695a <releasesleep>

  acquire(&bcache.lock);
    80004b1c:	0005f517          	auipc	a0,0x5f
    80004b20:	fac50513          	addi	a0,a0,-84 # 80063ac8 <bcache>
    80004b24:	ffffc097          	auipc	ra,0xffffc
    80004b28:	75a080e7          	jalr	1882(ra) # 8000127e <acquire>
  b->refcnt--;
    80004b2c:	fe843783          	ld	a5,-24(s0)
    80004b30:	43bc                	lw	a5,64(a5)
    80004b32:	37fd                	addiw	a5,a5,-1
    80004b34:	0007871b          	sext.w	a4,a5
    80004b38:	fe843783          	ld	a5,-24(s0)
    80004b3c:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004b3e:	fe843783          	ld	a5,-24(s0)
    80004b42:	43bc                	lw	a5,64(a5)
    80004b44:	e7b5                	bnez	a5,80004bb0 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004b46:	fe843783          	ld	a5,-24(s0)
    80004b4a:	6bbc                	ld	a5,80(a5)
    80004b4c:	fe843703          	ld	a4,-24(s0)
    80004b50:	6738                	ld	a4,72(a4)
    80004b52:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004b54:	fe843783          	ld	a5,-24(s0)
    80004b58:	67bc                	ld	a5,72(a5)
    80004b5a:	fe843703          	ld	a4,-24(s0)
    80004b5e:	6b38                	ld	a4,80(a4)
    80004b60:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004b62:	0005f717          	auipc	a4,0x5f
    80004b66:	f6670713          	addi	a4,a4,-154 # 80063ac8 <bcache>
    80004b6a:	67a1                	lui	a5,0x8
    80004b6c:	97ba                	add	a5,a5,a4
    80004b6e:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004b72:	fe843783          	ld	a5,-24(s0)
    80004b76:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004b78:	fe843783          	ld	a5,-24(s0)
    80004b7c:	00067717          	auipc	a4,0x67
    80004b80:	1b470713          	addi	a4,a4,436 # 8006bd30 <bcache+0x8268>
    80004b84:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004b86:	0005f717          	auipc	a4,0x5f
    80004b8a:	f4270713          	addi	a4,a4,-190 # 80063ac8 <bcache>
    80004b8e:	67a1                	lui	a5,0x8
    80004b90:	97ba                	add	a5,a5,a4
    80004b92:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004b96:	fe843703          	ld	a4,-24(s0)
    80004b9a:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004b9c:	0005f717          	auipc	a4,0x5f
    80004ba0:	f2c70713          	addi	a4,a4,-212 # 80063ac8 <bcache>
    80004ba4:	67a1                	lui	a5,0x8
    80004ba6:	97ba                	add	a5,a5,a4
    80004ba8:	fe843703          	ld	a4,-24(s0)
    80004bac:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004bb0:	0005f517          	auipc	a0,0x5f
    80004bb4:	f1850513          	addi	a0,a0,-232 # 80063ac8 <bcache>
    80004bb8:	ffffc097          	auipc	ra,0xffffc
    80004bbc:	72a080e7          	jalr	1834(ra) # 800012e2 <release>
}
    80004bc0:	0001                	nop
    80004bc2:	60e2                	ld	ra,24(sp)
    80004bc4:	6442                	ld	s0,16(sp)
    80004bc6:	6105                	addi	sp,sp,32
    80004bc8:	8082                	ret

0000000080004bca <bpin>:

void
bpin(struct buf *b) {
    80004bca:	1101                	addi	sp,sp,-32
    80004bcc:	ec06                	sd	ra,24(sp)
    80004bce:	e822                	sd	s0,16(sp)
    80004bd0:	1000                	addi	s0,sp,32
    80004bd2:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004bd6:	0005f517          	auipc	a0,0x5f
    80004bda:	ef250513          	addi	a0,a0,-270 # 80063ac8 <bcache>
    80004bde:	ffffc097          	auipc	ra,0xffffc
    80004be2:	6a0080e7          	jalr	1696(ra) # 8000127e <acquire>
  b->refcnt++;
    80004be6:	fe843783          	ld	a5,-24(s0)
    80004bea:	43bc                	lw	a5,64(a5)
    80004bec:	2785                	addiw	a5,a5,1
    80004bee:	0007871b          	sext.w	a4,a5
    80004bf2:	fe843783          	ld	a5,-24(s0)
    80004bf6:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004bf8:	0005f517          	auipc	a0,0x5f
    80004bfc:	ed050513          	addi	a0,a0,-304 # 80063ac8 <bcache>
    80004c00:	ffffc097          	auipc	ra,0xffffc
    80004c04:	6e2080e7          	jalr	1762(ra) # 800012e2 <release>
}
    80004c08:	0001                	nop
    80004c0a:	60e2                	ld	ra,24(sp)
    80004c0c:	6442                	ld	s0,16(sp)
    80004c0e:	6105                	addi	sp,sp,32
    80004c10:	8082                	ret

0000000080004c12 <bunpin>:

void
bunpin(struct buf *b) {
    80004c12:	1101                	addi	sp,sp,-32
    80004c14:	ec06                	sd	ra,24(sp)
    80004c16:	e822                	sd	s0,16(sp)
    80004c18:	1000                	addi	s0,sp,32
    80004c1a:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004c1e:	0005f517          	auipc	a0,0x5f
    80004c22:	eaa50513          	addi	a0,a0,-342 # 80063ac8 <bcache>
    80004c26:	ffffc097          	auipc	ra,0xffffc
    80004c2a:	658080e7          	jalr	1624(ra) # 8000127e <acquire>
  b->refcnt--;
    80004c2e:	fe843783          	ld	a5,-24(s0)
    80004c32:	43bc                	lw	a5,64(a5)
    80004c34:	37fd                	addiw	a5,a5,-1
    80004c36:	0007871b          	sext.w	a4,a5
    80004c3a:	fe843783          	ld	a5,-24(s0)
    80004c3e:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004c40:	0005f517          	auipc	a0,0x5f
    80004c44:	e8850513          	addi	a0,a0,-376 # 80063ac8 <bcache>
    80004c48:	ffffc097          	auipc	ra,0xffffc
    80004c4c:	69a080e7          	jalr	1690(ra) # 800012e2 <release>
}
    80004c50:	0001                	nop
    80004c52:	60e2                	ld	ra,24(sp)
    80004c54:	6442                	ld	s0,16(sp)
    80004c56:	6105                	addi	sp,sp,32
    80004c58:	8082                	ret

0000000080004c5a <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004c5a:	7179                	addi	sp,sp,-48
    80004c5c:	f406                	sd	ra,40(sp)
    80004c5e:	f022                	sd	s0,32(sp)
    80004c60:	1800                	addi	s0,sp,48
    80004c62:	87aa                	mv	a5,a0
    80004c64:	fcb43823          	sd	a1,-48(s0)
    80004c68:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004c6c:	fdc42783          	lw	a5,-36(s0)
    80004c70:	4585                	li	a1,1
    80004c72:	853e                	mv	a0,a5
    80004c74:	00000097          	auipc	ra,0x0
    80004c78:	dc6080e7          	jalr	-570(ra) # 80004a3a <bread>
    80004c7c:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004c80:	fe843783          	ld	a5,-24(s0)
    80004c84:	05878793          	addi	a5,a5,88
    80004c88:	02000613          	li	a2,32
    80004c8c:	85be                	mv	a1,a5
    80004c8e:	fd043503          	ld	a0,-48(s0)
    80004c92:	ffffd097          	auipc	ra,0xffffd
    80004c96:	8a4080e7          	jalr	-1884(ra) # 80001536 <memmove>
  brelse(bp);
    80004c9a:	fe843503          	ld	a0,-24(s0)
    80004c9e:	00000097          	auipc	ra,0x0
    80004ca2:	e3e080e7          	jalr	-450(ra) # 80004adc <brelse>
}
    80004ca6:	0001                	nop
    80004ca8:	70a2                	ld	ra,40(sp)
    80004caa:	7402                	ld	s0,32(sp)
    80004cac:	6145                	addi	sp,sp,48
    80004cae:	8082                	ret

0000000080004cb0 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004cb0:	1101                	addi	sp,sp,-32
    80004cb2:	ec06                	sd	ra,24(sp)
    80004cb4:	e822                	sd	s0,16(sp)
    80004cb6:	1000                	addi	s0,sp,32
    80004cb8:	87aa                	mv	a5,a0
    80004cba:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004cbe:	fec42783          	lw	a5,-20(s0)
    80004cc2:	00067597          	auipc	a1,0x67
    80004cc6:	4c658593          	addi	a1,a1,1222 # 8006c188 <sb>
    80004cca:	853e                	mv	a0,a5
    80004ccc:	00000097          	auipc	ra,0x0
    80004cd0:	f8e080e7          	jalr	-114(ra) # 80004c5a <readsb>
  if(sb.magic != FSMAGIC)
    80004cd4:	00067797          	auipc	a5,0x67
    80004cd8:	4b478793          	addi	a5,a5,1204 # 8006c188 <sb>
    80004cdc:	439c                	lw	a5,0(a5)
    80004cde:	873e                	mv	a4,a5
    80004ce0:	102037b7          	lui	a5,0x10203
    80004ce4:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004ce8:	00f70a63          	beq	a4,a5,80004cfc <fsinit+0x4c>
    panic("invalid file system");
    80004cec:	00006517          	auipc	a0,0x6
    80004cf0:	73c50513          	addi	a0,a0,1852 # 8000b428 <etext+0x428>
    80004cf4:	ffffc097          	auipc	ra,0xffffc
    80004cf8:	f5c080e7          	jalr	-164(ra) # 80000c50 <panic>
  initlog(dev, &sb);
    80004cfc:	fec42783          	lw	a5,-20(s0)
    80004d00:	00067597          	auipc	a1,0x67
    80004d04:	48858593          	addi	a1,a1,1160 # 8006c188 <sb>
    80004d08:	853e                	mv	a0,a5
    80004d0a:	00001097          	auipc	ra,0x1
    80004d0e:	47a080e7          	jalr	1146(ra) # 80006184 <initlog>
}
    80004d12:	0001                	nop
    80004d14:	60e2                	ld	ra,24(sp)
    80004d16:	6442                	ld	s0,16(sp)
    80004d18:	6105                	addi	sp,sp,32
    80004d1a:	8082                	ret

0000000080004d1c <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004d1c:	7179                	addi	sp,sp,-48
    80004d1e:	f406                	sd	ra,40(sp)
    80004d20:	f022                	sd	s0,32(sp)
    80004d22:	1800                	addi	s0,sp,48
    80004d24:	87aa                	mv	a5,a0
    80004d26:	872e                	mv	a4,a1
    80004d28:	fcf42e23          	sw	a5,-36(s0)
    80004d2c:	87ba                	mv	a5,a4
    80004d2e:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004d32:	fdc42783          	lw	a5,-36(s0)
    80004d36:	fd842703          	lw	a4,-40(s0)
    80004d3a:	85ba                	mv	a1,a4
    80004d3c:	853e                	mv	a0,a5
    80004d3e:	00000097          	auipc	ra,0x0
    80004d42:	cfc080e7          	jalr	-772(ra) # 80004a3a <bread>
    80004d46:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004d4a:	fe843783          	ld	a5,-24(s0)
    80004d4e:	05878793          	addi	a5,a5,88
    80004d52:	40000613          	li	a2,1024
    80004d56:	4581                	li	a1,0
    80004d58:	853e                	mv	a0,a5
    80004d5a:	ffffc097          	auipc	ra,0xffffc
    80004d5e:	6f8080e7          	jalr	1784(ra) # 80001452 <memset>
  log_write(bp);
    80004d62:	fe843503          	ld	a0,-24(s0)
    80004d66:	00002097          	auipc	ra,0x2
    80004d6a:	a06080e7          	jalr	-1530(ra) # 8000676c <log_write>
  brelse(bp);
    80004d6e:	fe843503          	ld	a0,-24(s0)
    80004d72:	00000097          	auipc	ra,0x0
    80004d76:	d6a080e7          	jalr	-662(ra) # 80004adc <brelse>
}
    80004d7a:	0001                	nop
    80004d7c:	70a2                	ld	ra,40(sp)
    80004d7e:	7402                	ld	s0,32(sp)
    80004d80:	6145                	addi	sp,sp,48
    80004d82:	8082                	ret

0000000080004d84 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
    80004d84:	7139                	addi	sp,sp,-64
    80004d86:	fc06                	sd	ra,56(sp)
    80004d88:	f822                	sd	s0,48(sp)
    80004d8a:	0080                	addi	s0,sp,64
    80004d8c:	87aa                	mv	a5,a0
    80004d8e:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004d92:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004d96:	fe042623          	sw	zero,-20(s0)
    80004d9a:	a2b5                	j	80004f06 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004d9c:	fec42783          	lw	a5,-20(s0)
    80004da0:	41f7d71b          	sraiw	a4,a5,0x1f
    80004da4:	0137571b          	srliw	a4,a4,0x13
    80004da8:	9fb9                	addw	a5,a5,a4
    80004daa:	40d7d79b          	sraiw	a5,a5,0xd
    80004dae:	2781                	sext.w	a5,a5
    80004db0:	0007871b          	sext.w	a4,a5
    80004db4:	00067797          	auipc	a5,0x67
    80004db8:	3d478793          	addi	a5,a5,980 # 8006c188 <sb>
    80004dbc:	4fdc                	lw	a5,28(a5)
    80004dbe:	9fb9                	addw	a5,a5,a4
    80004dc0:	0007871b          	sext.w	a4,a5
    80004dc4:	fcc42783          	lw	a5,-52(s0)
    80004dc8:	85ba                	mv	a1,a4
    80004dca:	853e                	mv	a0,a5
    80004dcc:	00000097          	auipc	ra,0x0
    80004dd0:	c6e080e7          	jalr	-914(ra) # 80004a3a <bread>
    80004dd4:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004dd8:	fe042423          	sw	zero,-24(s0)
    80004ddc:	a0dd                	j	80004ec2 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004dde:	fe842703          	lw	a4,-24(s0)
    80004de2:	41f7579b          	sraiw	a5,a4,0x1f
    80004de6:	01d7d79b          	srliw	a5,a5,0x1d
    80004dea:	9f3d                	addw	a4,a4,a5
    80004dec:	8b1d                	andi	a4,a4,7
    80004dee:	40f707bb          	subw	a5,a4,a5
    80004df2:	2781                	sext.w	a5,a5
    80004df4:	4705                	li	a4,1
    80004df6:	00f717bb          	sllw	a5,a4,a5
    80004dfa:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004dfe:	fe842783          	lw	a5,-24(s0)
    80004e02:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e06:	01d7571b          	srliw	a4,a4,0x1d
    80004e0a:	9fb9                	addw	a5,a5,a4
    80004e0c:	4037d79b          	sraiw	a5,a5,0x3
    80004e10:	2781                	sext.w	a5,a5
    80004e12:	fe043703          	ld	a4,-32(s0)
    80004e16:	97ba                	add	a5,a5,a4
    80004e18:	0587c783          	lbu	a5,88(a5)
    80004e1c:	0007871b          	sext.w	a4,a5
    80004e20:	fdc42783          	lw	a5,-36(s0)
    80004e24:	8ff9                	and	a5,a5,a4
    80004e26:	2781                	sext.w	a5,a5
    80004e28:	ebc1                	bnez	a5,80004eb8 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004e2a:	fe842783          	lw	a5,-24(s0)
    80004e2e:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e32:	01d7571b          	srliw	a4,a4,0x1d
    80004e36:	9fb9                	addw	a5,a5,a4
    80004e38:	4037d79b          	sraiw	a5,a5,0x3
    80004e3c:	2781                	sext.w	a5,a5
    80004e3e:	fe043703          	ld	a4,-32(s0)
    80004e42:	973e                	add	a4,a4,a5
    80004e44:	05874703          	lbu	a4,88(a4)
    80004e48:	0187169b          	slliw	a3,a4,0x18
    80004e4c:	4186d69b          	sraiw	a3,a3,0x18
    80004e50:	fdc42703          	lw	a4,-36(s0)
    80004e54:	0187171b          	slliw	a4,a4,0x18
    80004e58:	4187571b          	sraiw	a4,a4,0x18
    80004e5c:	8f55                	or	a4,a4,a3
    80004e5e:	0187171b          	slliw	a4,a4,0x18
    80004e62:	4187571b          	sraiw	a4,a4,0x18
    80004e66:	0ff77713          	andi	a4,a4,255
    80004e6a:	fe043683          	ld	a3,-32(s0)
    80004e6e:	97b6                	add	a5,a5,a3
    80004e70:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004e74:	fe043503          	ld	a0,-32(s0)
    80004e78:	00002097          	auipc	ra,0x2
    80004e7c:	8f4080e7          	jalr	-1804(ra) # 8000676c <log_write>
        brelse(bp);
    80004e80:	fe043503          	ld	a0,-32(s0)
    80004e84:	00000097          	auipc	ra,0x0
    80004e88:	c58080e7          	jalr	-936(ra) # 80004adc <brelse>
        bzero(dev, b + bi);
    80004e8c:	fcc42683          	lw	a3,-52(s0)
    80004e90:	fec42703          	lw	a4,-20(s0)
    80004e94:	fe842783          	lw	a5,-24(s0)
    80004e98:	9fb9                	addw	a5,a5,a4
    80004e9a:	2781                	sext.w	a5,a5
    80004e9c:	85be                	mv	a1,a5
    80004e9e:	8536                	mv	a0,a3
    80004ea0:	00000097          	auipc	ra,0x0
    80004ea4:	e7c080e7          	jalr	-388(ra) # 80004d1c <bzero>
        return b + bi;
    80004ea8:	fec42703          	lw	a4,-20(s0)
    80004eac:	fe842783          	lw	a5,-24(s0)
    80004eb0:	9fb9                	addw	a5,a5,a4
    80004eb2:	2781                	sext.w	a5,a5
    80004eb4:	2781                	sext.w	a5,a5
    80004eb6:	a88d                	j	80004f28 <balloc+0x1a4>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004eb8:	fe842783          	lw	a5,-24(s0)
    80004ebc:	2785                	addiw	a5,a5,1
    80004ebe:	fef42423          	sw	a5,-24(s0)
    80004ec2:	fe842783          	lw	a5,-24(s0)
    80004ec6:	0007871b          	sext.w	a4,a5
    80004eca:	6789                	lui	a5,0x2
    80004ecc:	02f75163          	bge	a4,a5,80004eee <balloc+0x16a>
    80004ed0:	fec42703          	lw	a4,-20(s0)
    80004ed4:	fe842783          	lw	a5,-24(s0)
    80004ed8:	9fb9                	addw	a5,a5,a4
    80004eda:	2781                	sext.w	a5,a5
    80004edc:	0007871b          	sext.w	a4,a5
    80004ee0:	00067797          	auipc	a5,0x67
    80004ee4:	2a878793          	addi	a5,a5,680 # 8006c188 <sb>
    80004ee8:	43dc                	lw	a5,4(a5)
    80004eea:	eef76ae3          	bltu	a4,a5,80004dde <balloc+0x5a>
      }
    }
    brelse(bp);
    80004eee:	fe043503          	ld	a0,-32(s0)
    80004ef2:	00000097          	auipc	ra,0x0
    80004ef6:	bea080e7          	jalr	-1046(ra) # 80004adc <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004efa:	fec42703          	lw	a4,-20(s0)
    80004efe:	6789                	lui	a5,0x2
    80004f00:	9fb9                	addw	a5,a5,a4
    80004f02:	fef42623          	sw	a5,-20(s0)
    80004f06:	00067797          	auipc	a5,0x67
    80004f0a:	28278793          	addi	a5,a5,642 # 8006c188 <sb>
    80004f0e:	43d8                	lw	a4,4(a5)
    80004f10:	fec42783          	lw	a5,-20(s0)
    80004f14:	e8e7e4e3          	bltu	a5,a4,80004d9c <balloc+0x18>
  }
  panic("balloc: out of blocks");
    80004f18:	00006517          	auipc	a0,0x6
    80004f1c:	52850513          	addi	a0,a0,1320 # 8000b440 <etext+0x440>
    80004f20:	ffffc097          	auipc	ra,0xffffc
    80004f24:	d30080e7          	jalr	-720(ra) # 80000c50 <panic>
}
    80004f28:	853e                	mv	a0,a5
    80004f2a:	70e2                	ld	ra,56(sp)
    80004f2c:	7442                	ld	s0,48(sp)
    80004f2e:	6121                	addi	sp,sp,64
    80004f30:	8082                	ret

0000000080004f32 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004f32:	7179                	addi	sp,sp,-48
    80004f34:	f406                	sd	ra,40(sp)
    80004f36:	f022                	sd	s0,32(sp)
    80004f38:	1800                	addi	s0,sp,48
    80004f3a:	87aa                	mv	a5,a0
    80004f3c:	872e                	mv	a4,a1
    80004f3e:	fcf42e23          	sw	a5,-36(s0)
    80004f42:	87ba                	mv	a5,a4
    80004f44:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004f48:	fdc42683          	lw	a3,-36(s0)
    80004f4c:	fd842783          	lw	a5,-40(s0)
    80004f50:	00d7d79b          	srliw	a5,a5,0xd
    80004f54:	0007871b          	sext.w	a4,a5
    80004f58:	00067797          	auipc	a5,0x67
    80004f5c:	23078793          	addi	a5,a5,560 # 8006c188 <sb>
    80004f60:	4fdc                	lw	a5,28(a5)
    80004f62:	9fb9                	addw	a5,a5,a4
    80004f64:	2781                	sext.w	a5,a5
    80004f66:	85be                	mv	a1,a5
    80004f68:	8536                	mv	a0,a3
    80004f6a:	00000097          	auipc	ra,0x0
    80004f6e:	ad0080e7          	jalr	-1328(ra) # 80004a3a <bread>
    80004f72:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004f76:	fd842703          	lw	a4,-40(s0)
    80004f7a:	6789                	lui	a5,0x2
    80004f7c:	17fd                	addi	a5,a5,-1
    80004f7e:	8ff9                	and	a5,a5,a4
    80004f80:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004f84:	fe442703          	lw	a4,-28(s0)
    80004f88:	41f7579b          	sraiw	a5,a4,0x1f
    80004f8c:	01d7d79b          	srliw	a5,a5,0x1d
    80004f90:	9f3d                	addw	a4,a4,a5
    80004f92:	8b1d                	andi	a4,a4,7
    80004f94:	40f707bb          	subw	a5,a4,a5
    80004f98:	2781                	sext.w	a5,a5
    80004f9a:	4705                	li	a4,1
    80004f9c:	00f717bb          	sllw	a5,a4,a5
    80004fa0:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004fa4:	fe442783          	lw	a5,-28(s0)
    80004fa8:	41f7d71b          	sraiw	a4,a5,0x1f
    80004fac:	01d7571b          	srliw	a4,a4,0x1d
    80004fb0:	9fb9                	addw	a5,a5,a4
    80004fb2:	4037d79b          	sraiw	a5,a5,0x3
    80004fb6:	2781                	sext.w	a5,a5
    80004fb8:	fe843703          	ld	a4,-24(s0)
    80004fbc:	97ba                	add	a5,a5,a4
    80004fbe:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004fc2:	0007871b          	sext.w	a4,a5
    80004fc6:	fe042783          	lw	a5,-32(s0)
    80004fca:	8ff9                	and	a5,a5,a4
    80004fcc:	2781                	sext.w	a5,a5
    80004fce:	eb89                	bnez	a5,80004fe0 <bfree+0xae>
    panic("freeing free block");
    80004fd0:	00006517          	auipc	a0,0x6
    80004fd4:	48850513          	addi	a0,a0,1160 # 8000b458 <etext+0x458>
    80004fd8:	ffffc097          	auipc	ra,0xffffc
    80004fdc:	c78080e7          	jalr	-904(ra) # 80000c50 <panic>
  bp->data[bi/8] &= ~m;
    80004fe0:	fe442783          	lw	a5,-28(s0)
    80004fe4:	41f7d71b          	sraiw	a4,a5,0x1f
    80004fe8:	01d7571b          	srliw	a4,a4,0x1d
    80004fec:	9fb9                	addw	a5,a5,a4
    80004fee:	4037d79b          	sraiw	a5,a5,0x3
    80004ff2:	2781                	sext.w	a5,a5
    80004ff4:	fe843703          	ld	a4,-24(s0)
    80004ff8:	973e                	add	a4,a4,a5
    80004ffa:	05874703          	lbu	a4,88(a4)
    80004ffe:	0187169b          	slliw	a3,a4,0x18
    80005002:	4186d69b          	sraiw	a3,a3,0x18
    80005006:	fe042703          	lw	a4,-32(s0)
    8000500a:	0187171b          	slliw	a4,a4,0x18
    8000500e:	4187571b          	sraiw	a4,a4,0x18
    80005012:	fff74713          	not	a4,a4
    80005016:	0187171b          	slliw	a4,a4,0x18
    8000501a:	4187571b          	sraiw	a4,a4,0x18
    8000501e:	8f75                	and	a4,a4,a3
    80005020:	0187171b          	slliw	a4,a4,0x18
    80005024:	4187571b          	sraiw	a4,a4,0x18
    80005028:	0ff77713          	andi	a4,a4,255
    8000502c:	fe843683          	ld	a3,-24(s0)
    80005030:	97b6                	add	a5,a5,a3
    80005032:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80005036:	fe843503          	ld	a0,-24(s0)
    8000503a:	00001097          	auipc	ra,0x1
    8000503e:	732080e7          	jalr	1842(ra) # 8000676c <log_write>
  brelse(bp);
    80005042:	fe843503          	ld	a0,-24(s0)
    80005046:	00000097          	auipc	ra,0x0
    8000504a:	a96080e7          	jalr	-1386(ra) # 80004adc <brelse>
}
    8000504e:	0001                	nop
    80005050:	70a2                	ld	ra,40(sp)
    80005052:	7402                	ld	s0,32(sp)
    80005054:	6145                	addi	sp,sp,48
    80005056:	8082                	ret

0000000080005058 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit()
{
    80005058:	1101                	addi	sp,sp,-32
    8000505a:	ec06                	sd	ra,24(sp)
    8000505c:	e822                	sd	s0,16(sp)
    8000505e:	1000                	addi	s0,sp,32
  int i = 0;
    80005060:	fe042623          	sw	zero,-20(s0)
  
  initlock(&icache.lock, "icache");
    80005064:	00006597          	auipc	a1,0x6
    80005068:	40c58593          	addi	a1,a1,1036 # 8000b470 <etext+0x470>
    8000506c:	00067517          	auipc	a0,0x67
    80005070:	13c50513          	addi	a0,a0,316 # 8006c1a8 <icache>
    80005074:	ffffc097          	auipc	ra,0xffffc
    80005078:	1da080e7          	jalr	474(ra) # 8000124e <initlock>
  for(i = 0; i < NINODE; i++) {
    8000507c:	fe042623          	sw	zero,-20(s0)
    80005080:	a82d                	j	800050ba <iinit+0x62>
    initsleeplock(&icache.inode[i].lock, "inode");
    80005082:	fec42703          	lw	a4,-20(s0)
    80005086:	87ba                	mv	a5,a4
    80005088:	0792                	slli	a5,a5,0x4
    8000508a:	97ba                	add	a5,a5,a4
    8000508c:	078e                	slli	a5,a5,0x3
    8000508e:	02078713          	addi	a4,a5,32
    80005092:	00067797          	auipc	a5,0x67
    80005096:	11678793          	addi	a5,a5,278 # 8006c1a8 <icache>
    8000509a:	97ba                	add	a5,a5,a4
    8000509c:	07a1                	addi	a5,a5,8
    8000509e:	00006597          	auipc	a1,0x6
    800050a2:	3da58593          	addi	a1,a1,986 # 8000b478 <etext+0x478>
    800050a6:	853e                	mv	a0,a5
    800050a8:	00001097          	auipc	ra,0x1
    800050ac:	7f8080e7          	jalr	2040(ra) # 800068a0 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    800050b0:	fec42783          	lw	a5,-20(s0)
    800050b4:	2785                	addiw	a5,a5,1
    800050b6:	fef42623          	sw	a5,-20(s0)
    800050ba:	fec42783          	lw	a5,-20(s0)
    800050be:	0007871b          	sext.w	a4,a5
    800050c2:	03100793          	li	a5,49
    800050c6:	fae7dee3          	bge	a5,a4,80005082 <iinit+0x2a>
  }
}
    800050ca:	0001                	nop
    800050cc:	0001                	nop
    800050ce:	60e2                	ld	ra,24(sp)
    800050d0:	6442                	ld	s0,16(sp)
    800050d2:	6105                	addi	sp,sp,32
    800050d4:	8082                	ret

00000000800050d6 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
    800050d6:	7139                	addi	sp,sp,-64
    800050d8:	fc06                	sd	ra,56(sp)
    800050da:	f822                	sd	s0,48(sp)
    800050dc:	0080                	addi	s0,sp,64
    800050de:	87aa                	mv	a5,a0
    800050e0:	872e                	mv	a4,a1
    800050e2:	fcf42623          	sw	a5,-52(s0)
    800050e6:	87ba                	mv	a5,a4
    800050e8:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    800050ec:	4785                	li	a5,1
    800050ee:	fef42623          	sw	a5,-20(s0)
    800050f2:	a855                	j	800051a6 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    800050f4:	fec42783          	lw	a5,-20(s0)
    800050f8:	8391                	srli	a5,a5,0x4
    800050fa:	0007871b          	sext.w	a4,a5
    800050fe:	00067797          	auipc	a5,0x67
    80005102:	08a78793          	addi	a5,a5,138 # 8006c188 <sb>
    80005106:	4f9c                	lw	a5,24(a5)
    80005108:	9fb9                	addw	a5,a5,a4
    8000510a:	0007871b          	sext.w	a4,a5
    8000510e:	fcc42783          	lw	a5,-52(s0)
    80005112:	85ba                	mv	a1,a4
    80005114:	853e                	mv	a0,a5
    80005116:	00000097          	auipc	ra,0x0
    8000511a:	924080e7          	jalr	-1756(ra) # 80004a3a <bread>
    8000511e:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80005122:	fe043783          	ld	a5,-32(s0)
    80005126:	05878713          	addi	a4,a5,88
    8000512a:	fec42783          	lw	a5,-20(s0)
    8000512e:	8bbd                	andi	a5,a5,15
    80005130:	079a                	slli	a5,a5,0x6
    80005132:	97ba                	add	a5,a5,a4
    80005134:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80005138:	fd843783          	ld	a5,-40(s0)
    8000513c:	00079783          	lh	a5,0(a5)
    80005140:	eba1                	bnez	a5,80005190 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80005142:	04000613          	li	a2,64
    80005146:	4581                	li	a1,0
    80005148:	fd843503          	ld	a0,-40(s0)
    8000514c:	ffffc097          	auipc	ra,0xffffc
    80005150:	306080e7          	jalr	774(ra) # 80001452 <memset>
      dip->type = type;
    80005154:	fd843783          	ld	a5,-40(s0)
    80005158:	fca45703          	lhu	a4,-54(s0)
    8000515c:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80005160:	fe043503          	ld	a0,-32(s0)
    80005164:	00001097          	auipc	ra,0x1
    80005168:	608080e7          	jalr	1544(ra) # 8000676c <log_write>
      brelse(bp);
    8000516c:	fe043503          	ld	a0,-32(s0)
    80005170:	00000097          	auipc	ra,0x0
    80005174:	96c080e7          	jalr	-1684(ra) # 80004adc <brelse>
      return iget(dev, inum);
    80005178:	fec42703          	lw	a4,-20(s0)
    8000517c:	fcc42783          	lw	a5,-52(s0)
    80005180:	85ba                	mv	a1,a4
    80005182:	853e                	mv	a0,a5
    80005184:	00000097          	auipc	ra,0x0
    80005188:	136080e7          	jalr	310(ra) # 800052ba <iget>
    8000518c:	87aa                	mv	a5,a0
    8000518e:	a82d                	j	800051c8 <ialloc+0xf2>
    }
    brelse(bp);
    80005190:	fe043503          	ld	a0,-32(s0)
    80005194:	00000097          	auipc	ra,0x0
    80005198:	948080e7          	jalr	-1720(ra) # 80004adc <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    8000519c:	fec42783          	lw	a5,-20(s0)
    800051a0:	2785                	addiw	a5,a5,1
    800051a2:	fef42623          	sw	a5,-20(s0)
    800051a6:	00067797          	auipc	a5,0x67
    800051aa:	fe278793          	addi	a5,a5,-30 # 8006c188 <sb>
    800051ae:	47d8                	lw	a4,12(a5)
    800051b0:	fec42783          	lw	a5,-20(s0)
    800051b4:	f4e7e0e3          	bltu	a5,a4,800050f4 <ialloc+0x1e>
  }
  panic("ialloc: no inodes");
    800051b8:	00006517          	auipc	a0,0x6
    800051bc:	2c850513          	addi	a0,a0,712 # 8000b480 <etext+0x480>
    800051c0:	ffffc097          	auipc	ra,0xffffc
    800051c4:	a90080e7          	jalr	-1392(ra) # 80000c50 <panic>
}
    800051c8:	853e                	mv	a0,a5
    800051ca:	70e2                	ld	ra,56(sp)
    800051cc:	7442                	ld	s0,48(sp)
    800051ce:	6121                	addi	sp,sp,64
    800051d0:	8082                	ret

00000000800051d2 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    800051d2:	7179                	addi	sp,sp,-48
    800051d4:	f406                	sd	ra,40(sp)
    800051d6:	f022                	sd	s0,32(sp)
    800051d8:	1800                	addi	s0,sp,48
    800051da:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800051de:	fd843783          	ld	a5,-40(s0)
    800051e2:	4394                	lw	a3,0(a5)
    800051e4:	fd843783          	ld	a5,-40(s0)
    800051e8:	43dc                	lw	a5,4(a5)
    800051ea:	0047d79b          	srliw	a5,a5,0x4
    800051ee:	0007871b          	sext.w	a4,a5
    800051f2:	00067797          	auipc	a5,0x67
    800051f6:	f9678793          	addi	a5,a5,-106 # 8006c188 <sb>
    800051fa:	4f9c                	lw	a5,24(a5)
    800051fc:	9fb9                	addw	a5,a5,a4
    800051fe:	2781                	sext.w	a5,a5
    80005200:	85be                	mv	a1,a5
    80005202:	8536                	mv	a0,a3
    80005204:	00000097          	auipc	ra,0x0
    80005208:	836080e7          	jalr	-1994(ra) # 80004a3a <bread>
    8000520c:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005210:	fe843783          	ld	a5,-24(s0)
    80005214:	05878713          	addi	a4,a5,88
    80005218:	fd843783          	ld	a5,-40(s0)
    8000521c:	43dc                	lw	a5,4(a5)
    8000521e:	1782                	slli	a5,a5,0x20
    80005220:	9381                	srli	a5,a5,0x20
    80005222:	8bbd                	andi	a5,a5,15
    80005224:	079a                	slli	a5,a5,0x6
    80005226:	97ba                	add	a5,a5,a4
    80005228:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    8000522c:	fd843783          	ld	a5,-40(s0)
    80005230:	04479703          	lh	a4,68(a5)
    80005234:	fe043783          	ld	a5,-32(s0)
    80005238:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    8000523c:	fd843783          	ld	a5,-40(s0)
    80005240:	04679703          	lh	a4,70(a5)
    80005244:	fe043783          	ld	a5,-32(s0)
    80005248:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    8000524c:	fd843783          	ld	a5,-40(s0)
    80005250:	04879703          	lh	a4,72(a5)
    80005254:	fe043783          	ld	a5,-32(s0)
    80005258:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    8000525c:	fd843783          	ld	a5,-40(s0)
    80005260:	04a79703          	lh	a4,74(a5)
    80005264:	fe043783          	ld	a5,-32(s0)
    80005268:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    8000526c:	fd843783          	ld	a5,-40(s0)
    80005270:	47f8                	lw	a4,76(a5)
    80005272:	fe043783          	ld	a5,-32(s0)
    80005276:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80005278:	fe043783          	ld	a5,-32(s0)
    8000527c:	00c78713          	addi	a4,a5,12
    80005280:	fd843783          	ld	a5,-40(s0)
    80005284:	05078793          	addi	a5,a5,80
    80005288:	03400613          	li	a2,52
    8000528c:	85be                	mv	a1,a5
    8000528e:	853a                	mv	a0,a4
    80005290:	ffffc097          	auipc	ra,0xffffc
    80005294:	2a6080e7          	jalr	678(ra) # 80001536 <memmove>
  log_write(bp);
    80005298:	fe843503          	ld	a0,-24(s0)
    8000529c:	00001097          	auipc	ra,0x1
    800052a0:	4d0080e7          	jalr	1232(ra) # 8000676c <log_write>
  brelse(bp);
    800052a4:	fe843503          	ld	a0,-24(s0)
    800052a8:	00000097          	auipc	ra,0x0
    800052ac:	834080e7          	jalr	-1996(ra) # 80004adc <brelse>
}
    800052b0:	0001                	nop
    800052b2:	70a2                	ld	ra,40(sp)
    800052b4:	7402                	ld	s0,32(sp)
    800052b6:	6145                	addi	sp,sp,48
    800052b8:	8082                	ret

00000000800052ba <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    800052ba:	7179                	addi	sp,sp,-48
    800052bc:	f406                	sd	ra,40(sp)
    800052be:	f022                	sd	s0,32(sp)
    800052c0:	1800                	addi	s0,sp,48
    800052c2:	87aa                	mv	a5,a0
    800052c4:	872e                	mv	a4,a1
    800052c6:	fcf42e23          	sw	a5,-36(s0)
    800052ca:	87ba                	mv	a5,a4
    800052cc:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&icache.lock);
    800052d0:	00067517          	auipc	a0,0x67
    800052d4:	ed850513          	addi	a0,a0,-296 # 8006c1a8 <icache>
    800052d8:	ffffc097          	auipc	ra,0xffffc
    800052dc:	fa6080e7          	jalr	-90(ra) # 8000127e <acquire>

  // Is the inode already cached?
  empty = 0;
    800052e0:	fe043023          	sd	zero,-32(s0)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    800052e4:	00067797          	auipc	a5,0x67
    800052e8:	edc78793          	addi	a5,a5,-292 # 8006c1c0 <icache+0x18>
    800052ec:	fef43423          	sd	a5,-24(s0)
    800052f0:	a89d                	j	80005366 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800052f2:	fe843783          	ld	a5,-24(s0)
    800052f6:	479c                	lw	a5,8(a5)
    800052f8:	04f05663          	blez	a5,80005344 <iget+0x8a>
    800052fc:	fe843783          	ld	a5,-24(s0)
    80005300:	4398                	lw	a4,0(a5)
    80005302:	fdc42783          	lw	a5,-36(s0)
    80005306:	2781                	sext.w	a5,a5
    80005308:	02e79e63          	bne	a5,a4,80005344 <iget+0x8a>
    8000530c:	fe843783          	ld	a5,-24(s0)
    80005310:	43d8                	lw	a4,4(a5)
    80005312:	fd842783          	lw	a5,-40(s0)
    80005316:	2781                	sext.w	a5,a5
    80005318:	02e79663          	bne	a5,a4,80005344 <iget+0x8a>
      ip->ref++;
    8000531c:	fe843783          	ld	a5,-24(s0)
    80005320:	479c                	lw	a5,8(a5)
    80005322:	2785                	addiw	a5,a5,1
    80005324:	0007871b          	sext.w	a4,a5
    80005328:	fe843783          	ld	a5,-24(s0)
    8000532c:	c798                	sw	a4,8(a5)
      release(&icache.lock);
    8000532e:	00067517          	auipc	a0,0x67
    80005332:	e7a50513          	addi	a0,a0,-390 # 8006c1a8 <icache>
    80005336:	ffffc097          	auipc	ra,0xffffc
    8000533a:	fac080e7          	jalr	-84(ra) # 800012e2 <release>
      return ip;
    8000533e:	fe843783          	ld	a5,-24(s0)
    80005342:	a069                	j	800053cc <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80005344:	fe043783          	ld	a5,-32(s0)
    80005348:	eb89                	bnez	a5,8000535a <iget+0xa0>
    8000534a:	fe843783          	ld	a5,-24(s0)
    8000534e:	479c                	lw	a5,8(a5)
    80005350:	e789                	bnez	a5,8000535a <iget+0xa0>
      empty = ip;
    80005352:	fe843783          	ld	a5,-24(s0)
    80005356:	fef43023          	sd	a5,-32(s0)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    8000535a:	fe843783          	ld	a5,-24(s0)
    8000535e:	08878793          	addi	a5,a5,136
    80005362:	fef43423          	sd	a5,-24(s0)
    80005366:	fe843703          	ld	a4,-24(s0)
    8000536a:	00069797          	auipc	a5,0x69
    8000536e:	8e678793          	addi	a5,a5,-1818 # 8006dc50 <log>
    80005372:	f8f760e3          	bltu	a4,a5,800052f2 <iget+0x38>
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    80005376:	fe043783          	ld	a5,-32(s0)
    8000537a:	eb89                	bnez	a5,8000538c <iget+0xd2>
    panic("iget: no inodes");
    8000537c:	00006517          	auipc	a0,0x6
    80005380:	11c50513          	addi	a0,a0,284 # 8000b498 <etext+0x498>
    80005384:	ffffc097          	auipc	ra,0xffffc
    80005388:	8cc080e7          	jalr	-1844(ra) # 80000c50 <panic>

  ip = empty;
    8000538c:	fe043783          	ld	a5,-32(s0)
    80005390:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80005394:	fe843783          	ld	a5,-24(s0)
    80005398:	fdc42703          	lw	a4,-36(s0)
    8000539c:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    8000539e:	fe843783          	ld	a5,-24(s0)
    800053a2:	fd842703          	lw	a4,-40(s0)
    800053a6:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    800053a8:	fe843783          	ld	a5,-24(s0)
    800053ac:	4705                	li	a4,1
    800053ae:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    800053b0:	fe843783          	ld	a5,-24(s0)
    800053b4:	0407a023          	sw	zero,64(a5)
  release(&icache.lock);
    800053b8:	00067517          	auipc	a0,0x67
    800053bc:	df050513          	addi	a0,a0,-528 # 8006c1a8 <icache>
    800053c0:	ffffc097          	auipc	ra,0xffffc
    800053c4:	f22080e7          	jalr	-222(ra) # 800012e2 <release>

  return ip;
    800053c8:	fe843783          	ld	a5,-24(s0)
}
    800053cc:	853e                	mv	a0,a5
    800053ce:	70a2                	ld	ra,40(sp)
    800053d0:	7402                	ld	s0,32(sp)
    800053d2:	6145                	addi	sp,sp,48
    800053d4:	8082                	ret

00000000800053d6 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    800053d6:	1101                	addi	sp,sp,-32
    800053d8:	ec06                	sd	ra,24(sp)
    800053da:	e822                	sd	s0,16(sp)
    800053dc:	1000                	addi	s0,sp,32
    800053de:	fea43423          	sd	a0,-24(s0)
  acquire(&icache.lock);
    800053e2:	00067517          	auipc	a0,0x67
    800053e6:	dc650513          	addi	a0,a0,-570 # 8006c1a8 <icache>
    800053ea:	ffffc097          	auipc	ra,0xffffc
    800053ee:	e94080e7          	jalr	-364(ra) # 8000127e <acquire>
  ip->ref++;
    800053f2:	fe843783          	ld	a5,-24(s0)
    800053f6:	479c                	lw	a5,8(a5)
    800053f8:	2785                	addiw	a5,a5,1
    800053fa:	0007871b          	sext.w	a4,a5
    800053fe:	fe843783          	ld	a5,-24(s0)
    80005402:	c798                	sw	a4,8(a5)
  release(&icache.lock);
    80005404:	00067517          	auipc	a0,0x67
    80005408:	da450513          	addi	a0,a0,-604 # 8006c1a8 <icache>
    8000540c:	ffffc097          	auipc	ra,0xffffc
    80005410:	ed6080e7          	jalr	-298(ra) # 800012e2 <release>
  return ip;
    80005414:	fe843783          	ld	a5,-24(s0)
}
    80005418:	853e                	mv	a0,a5
    8000541a:	60e2                	ld	ra,24(sp)
    8000541c:	6442                	ld	s0,16(sp)
    8000541e:	6105                	addi	sp,sp,32
    80005420:	8082                	ret

0000000080005422 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005422:	7179                	addi	sp,sp,-48
    80005424:	f406                	sd	ra,40(sp)
    80005426:	f022                	sd	s0,32(sp)
    80005428:	1800                	addi	s0,sp,48
    8000542a:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    8000542e:	fd843783          	ld	a5,-40(s0)
    80005432:	c791                	beqz	a5,8000543e <ilock+0x1c>
    80005434:	fd843783          	ld	a5,-40(s0)
    80005438:	479c                	lw	a5,8(a5)
    8000543a:	00f04a63          	bgtz	a5,8000544e <ilock+0x2c>
    panic("ilock");
    8000543e:	00006517          	auipc	a0,0x6
    80005442:	06a50513          	addi	a0,a0,106 # 8000b4a8 <etext+0x4a8>
    80005446:	ffffc097          	auipc	ra,0xffffc
    8000544a:	80a080e7          	jalr	-2038(ra) # 80000c50 <panic>

  acquiresleep(&ip->lock);
    8000544e:	fd843783          	ld	a5,-40(s0)
    80005452:	07c1                	addi	a5,a5,16
    80005454:	853e                	mv	a0,a5
    80005456:	00001097          	auipc	ra,0x1
    8000545a:	496080e7          	jalr	1174(ra) # 800068ec <acquiresleep>

  if(ip->valid == 0){
    8000545e:	fd843783          	ld	a5,-40(s0)
    80005462:	43bc                	lw	a5,64(a5)
    80005464:	e7e5                	bnez	a5,8000554c <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005466:	fd843783          	ld	a5,-40(s0)
    8000546a:	4394                	lw	a3,0(a5)
    8000546c:	fd843783          	ld	a5,-40(s0)
    80005470:	43dc                	lw	a5,4(a5)
    80005472:	0047d79b          	srliw	a5,a5,0x4
    80005476:	0007871b          	sext.w	a4,a5
    8000547a:	00067797          	auipc	a5,0x67
    8000547e:	d0e78793          	addi	a5,a5,-754 # 8006c188 <sb>
    80005482:	4f9c                	lw	a5,24(a5)
    80005484:	9fb9                	addw	a5,a5,a4
    80005486:	2781                	sext.w	a5,a5
    80005488:	85be                	mv	a1,a5
    8000548a:	8536                	mv	a0,a3
    8000548c:	fffff097          	auipc	ra,0xfffff
    80005490:	5ae080e7          	jalr	1454(ra) # 80004a3a <bread>
    80005494:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005498:	fe843783          	ld	a5,-24(s0)
    8000549c:	05878713          	addi	a4,a5,88
    800054a0:	fd843783          	ld	a5,-40(s0)
    800054a4:	43dc                	lw	a5,4(a5)
    800054a6:	1782                	slli	a5,a5,0x20
    800054a8:	9381                	srli	a5,a5,0x20
    800054aa:	8bbd                	andi	a5,a5,15
    800054ac:	079a                	slli	a5,a5,0x6
    800054ae:	97ba                	add	a5,a5,a4
    800054b0:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    800054b4:	fe043783          	ld	a5,-32(s0)
    800054b8:	00079703          	lh	a4,0(a5)
    800054bc:	fd843783          	ld	a5,-40(s0)
    800054c0:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800054c4:	fe043783          	ld	a5,-32(s0)
    800054c8:	00279703          	lh	a4,2(a5)
    800054cc:	fd843783          	ld	a5,-40(s0)
    800054d0:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800054d4:	fe043783          	ld	a5,-32(s0)
    800054d8:	00479703          	lh	a4,4(a5)
    800054dc:	fd843783          	ld	a5,-40(s0)
    800054e0:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800054e4:	fe043783          	ld	a5,-32(s0)
    800054e8:	00679703          	lh	a4,6(a5)
    800054ec:	fd843783          	ld	a5,-40(s0)
    800054f0:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800054f4:	fe043783          	ld	a5,-32(s0)
    800054f8:	4798                	lw	a4,8(a5)
    800054fa:	fd843783          	ld	a5,-40(s0)
    800054fe:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    80005500:	fd843783          	ld	a5,-40(s0)
    80005504:	05078713          	addi	a4,a5,80
    80005508:	fe043783          	ld	a5,-32(s0)
    8000550c:	07b1                	addi	a5,a5,12
    8000550e:	03400613          	li	a2,52
    80005512:	85be                	mv	a1,a5
    80005514:	853a                	mv	a0,a4
    80005516:	ffffc097          	auipc	ra,0xffffc
    8000551a:	020080e7          	jalr	32(ra) # 80001536 <memmove>
    brelse(bp);
    8000551e:	fe843503          	ld	a0,-24(s0)
    80005522:	fffff097          	auipc	ra,0xfffff
    80005526:	5ba080e7          	jalr	1466(ra) # 80004adc <brelse>
    ip->valid = 1;
    8000552a:	fd843783          	ld	a5,-40(s0)
    8000552e:	4705                	li	a4,1
    80005530:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005532:	fd843783          	ld	a5,-40(s0)
    80005536:	04479783          	lh	a5,68(a5)
    8000553a:	eb89                	bnez	a5,8000554c <ilock+0x12a>
      panic("ilock: no type");
    8000553c:	00006517          	auipc	a0,0x6
    80005540:	f7450513          	addi	a0,a0,-140 # 8000b4b0 <etext+0x4b0>
    80005544:	ffffb097          	auipc	ra,0xffffb
    80005548:	70c080e7          	jalr	1804(ra) # 80000c50 <panic>
  }
}
    8000554c:	0001                	nop
    8000554e:	70a2                	ld	ra,40(sp)
    80005550:	7402                	ld	s0,32(sp)
    80005552:	6145                	addi	sp,sp,48
    80005554:	8082                	ret

0000000080005556 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005556:	1101                	addi	sp,sp,-32
    80005558:	ec06                	sd	ra,24(sp)
    8000555a:	e822                	sd	s0,16(sp)
    8000555c:	1000                	addi	s0,sp,32
    8000555e:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005562:	fe843783          	ld	a5,-24(s0)
    80005566:	c385                	beqz	a5,80005586 <iunlock+0x30>
    80005568:	fe843783          	ld	a5,-24(s0)
    8000556c:	07c1                	addi	a5,a5,16
    8000556e:	853e                	mv	a0,a5
    80005570:	00001097          	auipc	ra,0x1
    80005574:	43c080e7          	jalr	1084(ra) # 800069ac <holdingsleep>
    80005578:	87aa                	mv	a5,a0
    8000557a:	c791                	beqz	a5,80005586 <iunlock+0x30>
    8000557c:	fe843783          	ld	a5,-24(s0)
    80005580:	479c                	lw	a5,8(a5)
    80005582:	00f04a63          	bgtz	a5,80005596 <iunlock+0x40>
    panic("iunlock");
    80005586:	00006517          	auipc	a0,0x6
    8000558a:	f3a50513          	addi	a0,a0,-198 # 8000b4c0 <etext+0x4c0>
    8000558e:	ffffb097          	auipc	ra,0xffffb
    80005592:	6c2080e7          	jalr	1730(ra) # 80000c50 <panic>

  releasesleep(&ip->lock);
    80005596:	fe843783          	ld	a5,-24(s0)
    8000559a:	07c1                	addi	a5,a5,16
    8000559c:	853e                	mv	a0,a5
    8000559e:	00001097          	auipc	ra,0x1
    800055a2:	3bc080e7          	jalr	956(ra) # 8000695a <releasesleep>
}
    800055a6:	0001                	nop
    800055a8:	60e2                	ld	ra,24(sp)
    800055aa:	6442                	ld	s0,16(sp)
    800055ac:	6105                	addi	sp,sp,32
    800055ae:	8082                	ret

00000000800055b0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800055b0:	1101                	addi	sp,sp,-32
    800055b2:	ec06                	sd	ra,24(sp)
    800055b4:	e822                	sd	s0,16(sp)
    800055b6:	1000                	addi	s0,sp,32
    800055b8:	fea43423          	sd	a0,-24(s0)
  acquire(&icache.lock);
    800055bc:	00067517          	auipc	a0,0x67
    800055c0:	bec50513          	addi	a0,a0,-1044 # 8006c1a8 <icache>
    800055c4:	ffffc097          	auipc	ra,0xffffc
    800055c8:	cba080e7          	jalr	-838(ra) # 8000127e <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800055cc:	fe843783          	ld	a5,-24(s0)
    800055d0:	479c                	lw	a5,8(a5)
    800055d2:	873e                	mv	a4,a5
    800055d4:	4785                	li	a5,1
    800055d6:	06f71f63          	bne	a4,a5,80005654 <iput+0xa4>
    800055da:	fe843783          	ld	a5,-24(s0)
    800055de:	43bc                	lw	a5,64(a5)
    800055e0:	cbb5                	beqz	a5,80005654 <iput+0xa4>
    800055e2:	fe843783          	ld	a5,-24(s0)
    800055e6:	04a79783          	lh	a5,74(a5)
    800055ea:	e7ad                	bnez	a5,80005654 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800055ec:	fe843783          	ld	a5,-24(s0)
    800055f0:	07c1                	addi	a5,a5,16
    800055f2:	853e                	mv	a0,a5
    800055f4:	00001097          	auipc	ra,0x1
    800055f8:	2f8080e7          	jalr	760(ra) # 800068ec <acquiresleep>

    release(&icache.lock);
    800055fc:	00067517          	auipc	a0,0x67
    80005600:	bac50513          	addi	a0,a0,-1108 # 8006c1a8 <icache>
    80005604:	ffffc097          	auipc	ra,0xffffc
    80005608:	cde080e7          	jalr	-802(ra) # 800012e2 <release>

    itrunc(ip);
    8000560c:	fe843503          	ld	a0,-24(s0)
    80005610:	00000097          	auipc	ra,0x0
    80005614:	1fa080e7          	jalr	506(ra) # 8000580a <itrunc>
    ip->type = 0;
    80005618:	fe843783          	ld	a5,-24(s0)
    8000561c:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    80005620:	fe843503          	ld	a0,-24(s0)
    80005624:	00000097          	auipc	ra,0x0
    80005628:	bae080e7          	jalr	-1106(ra) # 800051d2 <iupdate>
    ip->valid = 0;
    8000562c:	fe843783          	ld	a5,-24(s0)
    80005630:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    80005634:	fe843783          	ld	a5,-24(s0)
    80005638:	07c1                	addi	a5,a5,16
    8000563a:	853e                	mv	a0,a5
    8000563c:	00001097          	auipc	ra,0x1
    80005640:	31e080e7          	jalr	798(ra) # 8000695a <releasesleep>

    acquire(&icache.lock);
    80005644:	00067517          	auipc	a0,0x67
    80005648:	b6450513          	addi	a0,a0,-1180 # 8006c1a8 <icache>
    8000564c:	ffffc097          	auipc	ra,0xffffc
    80005650:	c32080e7          	jalr	-974(ra) # 8000127e <acquire>
  }

  ip->ref--;
    80005654:	fe843783          	ld	a5,-24(s0)
    80005658:	479c                	lw	a5,8(a5)
    8000565a:	37fd                	addiw	a5,a5,-1
    8000565c:	0007871b          	sext.w	a4,a5
    80005660:	fe843783          	ld	a5,-24(s0)
    80005664:	c798                	sw	a4,8(a5)
  release(&icache.lock);
    80005666:	00067517          	auipc	a0,0x67
    8000566a:	b4250513          	addi	a0,a0,-1214 # 8006c1a8 <icache>
    8000566e:	ffffc097          	auipc	ra,0xffffc
    80005672:	c74080e7          	jalr	-908(ra) # 800012e2 <release>
}
    80005676:	0001                	nop
    80005678:	60e2                	ld	ra,24(sp)
    8000567a:	6442                	ld	s0,16(sp)
    8000567c:	6105                	addi	sp,sp,32
    8000567e:	8082                	ret

0000000080005680 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005680:	1101                	addi	sp,sp,-32
    80005682:	ec06                	sd	ra,24(sp)
    80005684:	e822                	sd	s0,16(sp)
    80005686:	1000                	addi	s0,sp,32
    80005688:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    8000568c:	fe843503          	ld	a0,-24(s0)
    80005690:	00000097          	auipc	ra,0x0
    80005694:	ec6080e7          	jalr	-314(ra) # 80005556 <iunlock>
  iput(ip);
    80005698:	fe843503          	ld	a0,-24(s0)
    8000569c:	00000097          	auipc	ra,0x0
    800056a0:	f14080e7          	jalr	-236(ra) # 800055b0 <iput>
}
    800056a4:	0001                	nop
    800056a6:	60e2                	ld	ra,24(sp)
    800056a8:	6442                	ld	s0,16(sp)
    800056aa:	6105                	addi	sp,sp,32
    800056ac:	8082                	ret

00000000800056ae <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
    800056ae:	7139                	addi	sp,sp,-64
    800056b0:	fc06                	sd	ra,56(sp)
    800056b2:	f822                	sd	s0,48(sp)
    800056b4:	0080                	addi	s0,sp,64
    800056b6:	fca43423          	sd	a0,-56(s0)
    800056ba:	87ae                	mv	a5,a1
    800056bc:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800056c0:	fc442783          	lw	a5,-60(s0)
    800056c4:	0007871b          	sext.w	a4,a5
    800056c8:	47ad                	li	a5,11
    800056ca:	04e7e863          	bltu	a5,a4,8000571a <bmap+0x6c>
    if((addr = ip->addrs[bn]) == 0)
    800056ce:	fc843703          	ld	a4,-56(s0)
    800056d2:	fc446783          	lwu	a5,-60(s0)
    800056d6:	07d1                	addi	a5,a5,20
    800056d8:	078a                	slli	a5,a5,0x2
    800056da:	97ba                	add	a5,a5,a4
    800056dc:	439c                	lw	a5,0(a5)
    800056de:	fef42623          	sw	a5,-20(s0)
    800056e2:	fec42783          	lw	a5,-20(s0)
    800056e6:	2781                	sext.w	a5,a5
    800056e8:	e795                	bnez	a5,80005714 <bmap+0x66>
      ip->addrs[bn] = addr = balloc(ip->dev);
    800056ea:	fc843783          	ld	a5,-56(s0)
    800056ee:	439c                	lw	a5,0(a5)
    800056f0:	853e                	mv	a0,a5
    800056f2:	fffff097          	auipc	ra,0xfffff
    800056f6:	692080e7          	jalr	1682(ra) # 80004d84 <balloc>
    800056fa:	87aa                	mv	a5,a0
    800056fc:	fef42623          	sw	a5,-20(s0)
    80005700:	fc843703          	ld	a4,-56(s0)
    80005704:	fc446783          	lwu	a5,-60(s0)
    80005708:	07d1                	addi	a5,a5,20
    8000570a:	078a                	slli	a5,a5,0x2
    8000570c:	97ba                	add	a5,a5,a4
    8000570e:	fec42703          	lw	a4,-20(s0)
    80005712:	c398                	sw	a4,0(a5)
    return addr;
    80005714:	fec42783          	lw	a5,-20(s0)
    80005718:	a0e5                	j	80005800 <bmap+0x152>
  }
  bn -= NDIRECT;
    8000571a:	fc442783          	lw	a5,-60(s0)
    8000571e:	37d1                	addiw	a5,a5,-12
    80005720:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80005724:	fc442783          	lw	a5,-60(s0)
    80005728:	0007871b          	sext.w	a4,a5
    8000572c:	0ff00793          	li	a5,255
    80005730:	0ce7e063          	bltu	a5,a4,800057f0 <bmap+0x142>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
    80005734:	fc843783          	ld	a5,-56(s0)
    80005738:	0807a783          	lw	a5,128(a5)
    8000573c:	fef42623          	sw	a5,-20(s0)
    80005740:	fec42783          	lw	a5,-20(s0)
    80005744:	2781                	sext.w	a5,a5
    80005746:	e395                	bnez	a5,8000576a <bmap+0xbc>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    80005748:	fc843783          	ld	a5,-56(s0)
    8000574c:	439c                	lw	a5,0(a5)
    8000574e:	853e                	mv	a0,a5
    80005750:	fffff097          	auipc	ra,0xfffff
    80005754:	634080e7          	jalr	1588(ra) # 80004d84 <balloc>
    80005758:	87aa                	mv	a5,a0
    8000575a:	fef42623          	sw	a5,-20(s0)
    8000575e:	fc843783          	ld	a5,-56(s0)
    80005762:	fec42703          	lw	a4,-20(s0)
    80005766:	08e7a023          	sw	a4,128(a5)
    bp = bread(ip->dev, addr);
    8000576a:	fc843783          	ld	a5,-56(s0)
    8000576e:	439c                	lw	a5,0(a5)
    80005770:	fec42703          	lw	a4,-20(s0)
    80005774:	85ba                	mv	a1,a4
    80005776:	853e                	mv	a0,a5
    80005778:	fffff097          	auipc	ra,0xfffff
    8000577c:	2c2080e7          	jalr	706(ra) # 80004a3a <bread>
    80005780:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005784:	fe043783          	ld	a5,-32(s0)
    80005788:	05878793          	addi	a5,a5,88
    8000578c:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005790:	fc446783          	lwu	a5,-60(s0)
    80005794:	078a                	slli	a5,a5,0x2
    80005796:	fd843703          	ld	a4,-40(s0)
    8000579a:	97ba                	add	a5,a5,a4
    8000579c:	439c                	lw	a5,0(a5)
    8000579e:	fef42623          	sw	a5,-20(s0)
    800057a2:	fec42783          	lw	a5,-20(s0)
    800057a6:	2781                	sext.w	a5,a5
    800057a8:	eb9d                	bnez	a5,800057de <bmap+0x130>
      a[bn] = addr = balloc(ip->dev);
    800057aa:	fc843783          	ld	a5,-56(s0)
    800057ae:	439c                	lw	a5,0(a5)
    800057b0:	853e                	mv	a0,a5
    800057b2:	fffff097          	auipc	ra,0xfffff
    800057b6:	5d2080e7          	jalr	1490(ra) # 80004d84 <balloc>
    800057ba:	87aa                	mv	a5,a0
    800057bc:	fef42623          	sw	a5,-20(s0)
    800057c0:	fc446783          	lwu	a5,-60(s0)
    800057c4:	078a                	slli	a5,a5,0x2
    800057c6:	fd843703          	ld	a4,-40(s0)
    800057ca:	97ba                	add	a5,a5,a4
    800057cc:	fec42703          	lw	a4,-20(s0)
    800057d0:	c398                	sw	a4,0(a5)
      log_write(bp);
    800057d2:	fe043503          	ld	a0,-32(s0)
    800057d6:	00001097          	auipc	ra,0x1
    800057da:	f96080e7          	jalr	-106(ra) # 8000676c <log_write>
    }
    brelse(bp);
    800057de:	fe043503          	ld	a0,-32(s0)
    800057e2:	fffff097          	auipc	ra,0xfffff
    800057e6:	2fa080e7          	jalr	762(ra) # 80004adc <brelse>
    return addr;
    800057ea:	fec42783          	lw	a5,-20(s0)
    800057ee:	a809                	j	80005800 <bmap+0x152>
  }

  panic("bmap: out of range");
    800057f0:	00006517          	auipc	a0,0x6
    800057f4:	cd850513          	addi	a0,a0,-808 # 8000b4c8 <etext+0x4c8>
    800057f8:	ffffb097          	auipc	ra,0xffffb
    800057fc:	458080e7          	jalr	1112(ra) # 80000c50 <panic>
}
    80005800:	853e                	mv	a0,a5
    80005802:	70e2                	ld	ra,56(sp)
    80005804:	7442                	ld	s0,48(sp)
    80005806:	6121                	addi	sp,sp,64
    80005808:	8082                	ret

000000008000580a <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    8000580a:	7139                	addi	sp,sp,-64
    8000580c:	fc06                	sd	ra,56(sp)
    8000580e:	f822                	sd	s0,48(sp)
    80005810:	0080                	addi	s0,sp,64
    80005812:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005816:	fe042623          	sw	zero,-20(s0)
    8000581a:	a899                	j	80005870 <itrunc+0x66>
    if(ip->addrs[i]){
    8000581c:	fc843703          	ld	a4,-56(s0)
    80005820:	fec42783          	lw	a5,-20(s0)
    80005824:	07d1                	addi	a5,a5,20
    80005826:	078a                	slli	a5,a5,0x2
    80005828:	97ba                	add	a5,a5,a4
    8000582a:	439c                	lw	a5,0(a5)
    8000582c:	cf8d                	beqz	a5,80005866 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    8000582e:	fc843783          	ld	a5,-56(s0)
    80005832:	439c                	lw	a5,0(a5)
    80005834:	0007869b          	sext.w	a3,a5
    80005838:	fc843703          	ld	a4,-56(s0)
    8000583c:	fec42783          	lw	a5,-20(s0)
    80005840:	07d1                	addi	a5,a5,20
    80005842:	078a                	slli	a5,a5,0x2
    80005844:	97ba                	add	a5,a5,a4
    80005846:	439c                	lw	a5,0(a5)
    80005848:	85be                	mv	a1,a5
    8000584a:	8536                	mv	a0,a3
    8000584c:	fffff097          	auipc	ra,0xfffff
    80005850:	6e6080e7          	jalr	1766(ra) # 80004f32 <bfree>
      ip->addrs[i] = 0;
    80005854:	fc843703          	ld	a4,-56(s0)
    80005858:	fec42783          	lw	a5,-20(s0)
    8000585c:	07d1                	addi	a5,a5,20
    8000585e:	078a                	slli	a5,a5,0x2
    80005860:	97ba                	add	a5,a5,a4
    80005862:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005866:	fec42783          	lw	a5,-20(s0)
    8000586a:	2785                	addiw	a5,a5,1
    8000586c:	fef42623          	sw	a5,-20(s0)
    80005870:	fec42783          	lw	a5,-20(s0)
    80005874:	0007871b          	sext.w	a4,a5
    80005878:	47ad                	li	a5,11
    8000587a:	fae7d1e3          	bge	a5,a4,8000581c <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    8000587e:	fc843783          	ld	a5,-56(s0)
    80005882:	0807a783          	lw	a5,128(a5)
    80005886:	cbc5                	beqz	a5,80005936 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005888:	fc843783          	ld	a5,-56(s0)
    8000588c:	4398                	lw	a4,0(a5)
    8000588e:	fc843783          	ld	a5,-56(s0)
    80005892:	0807a783          	lw	a5,128(a5)
    80005896:	85be                	mv	a1,a5
    80005898:	853a                	mv	a0,a4
    8000589a:	fffff097          	auipc	ra,0xfffff
    8000589e:	1a0080e7          	jalr	416(ra) # 80004a3a <bread>
    800058a2:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800058a6:	fe043783          	ld	a5,-32(s0)
    800058aa:	05878793          	addi	a5,a5,88
    800058ae:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    800058b2:	fe042423          	sw	zero,-24(s0)
    800058b6:	a081                	j	800058f6 <itrunc+0xec>
      if(a[j])
    800058b8:	fe842783          	lw	a5,-24(s0)
    800058bc:	078a                	slli	a5,a5,0x2
    800058be:	fd843703          	ld	a4,-40(s0)
    800058c2:	97ba                	add	a5,a5,a4
    800058c4:	439c                	lw	a5,0(a5)
    800058c6:	c39d                	beqz	a5,800058ec <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    800058c8:	fc843783          	ld	a5,-56(s0)
    800058cc:	439c                	lw	a5,0(a5)
    800058ce:	0007869b          	sext.w	a3,a5
    800058d2:	fe842783          	lw	a5,-24(s0)
    800058d6:	078a                	slli	a5,a5,0x2
    800058d8:	fd843703          	ld	a4,-40(s0)
    800058dc:	97ba                	add	a5,a5,a4
    800058de:	439c                	lw	a5,0(a5)
    800058e0:	85be                	mv	a1,a5
    800058e2:	8536                	mv	a0,a3
    800058e4:	fffff097          	auipc	ra,0xfffff
    800058e8:	64e080e7          	jalr	1614(ra) # 80004f32 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    800058ec:	fe842783          	lw	a5,-24(s0)
    800058f0:	2785                	addiw	a5,a5,1
    800058f2:	fef42423          	sw	a5,-24(s0)
    800058f6:	fe842783          	lw	a5,-24(s0)
    800058fa:	873e                	mv	a4,a5
    800058fc:	0ff00793          	li	a5,255
    80005900:	fae7fce3          	bgeu	a5,a4,800058b8 <itrunc+0xae>
    }
    brelse(bp);
    80005904:	fe043503          	ld	a0,-32(s0)
    80005908:	fffff097          	auipc	ra,0xfffff
    8000590c:	1d4080e7          	jalr	468(ra) # 80004adc <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    80005910:	fc843783          	ld	a5,-56(s0)
    80005914:	439c                	lw	a5,0(a5)
    80005916:	0007871b          	sext.w	a4,a5
    8000591a:	fc843783          	ld	a5,-56(s0)
    8000591e:	0807a783          	lw	a5,128(a5)
    80005922:	85be                	mv	a1,a5
    80005924:	853a                	mv	a0,a4
    80005926:	fffff097          	auipc	ra,0xfffff
    8000592a:	60c080e7          	jalr	1548(ra) # 80004f32 <bfree>
    ip->addrs[NDIRECT] = 0;
    8000592e:	fc843783          	ld	a5,-56(s0)
    80005932:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005936:	fc843783          	ld	a5,-56(s0)
    8000593a:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    8000593e:	fc843503          	ld	a0,-56(s0)
    80005942:	00000097          	auipc	ra,0x0
    80005946:	890080e7          	jalr	-1904(ra) # 800051d2 <iupdate>
}
    8000594a:	0001                	nop
    8000594c:	70e2                	ld	ra,56(sp)
    8000594e:	7442                	ld	s0,48(sp)
    80005950:	6121                	addi	sp,sp,64
    80005952:	8082                	ret

0000000080005954 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005954:	1101                	addi	sp,sp,-32
    80005956:	ec22                	sd	s0,24(sp)
    80005958:	1000                	addi	s0,sp,32
    8000595a:	fea43423          	sd	a0,-24(s0)
    8000595e:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005962:	fe843783          	ld	a5,-24(s0)
    80005966:	439c                	lw	a5,0(a5)
    80005968:	0007871b          	sext.w	a4,a5
    8000596c:	fe043783          	ld	a5,-32(s0)
    80005970:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005972:	fe843783          	ld	a5,-24(s0)
    80005976:	43d8                	lw	a4,4(a5)
    80005978:	fe043783          	ld	a5,-32(s0)
    8000597c:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    8000597e:	fe843783          	ld	a5,-24(s0)
    80005982:	04479703          	lh	a4,68(a5)
    80005986:	fe043783          	ld	a5,-32(s0)
    8000598a:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    8000598e:	fe843783          	ld	a5,-24(s0)
    80005992:	04a79703          	lh	a4,74(a5)
    80005996:	fe043783          	ld	a5,-32(s0)
    8000599a:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    8000599e:	fe843783          	ld	a5,-24(s0)
    800059a2:	47fc                	lw	a5,76(a5)
    800059a4:	02079713          	slli	a4,a5,0x20
    800059a8:	9301                	srli	a4,a4,0x20
    800059aa:	fe043783          	ld	a5,-32(s0)
    800059ae:	eb98                	sd	a4,16(a5)
}
    800059b0:	0001                	nop
    800059b2:	6462                	ld	s0,24(sp)
    800059b4:	6105                	addi	sp,sp,32
    800059b6:	8082                	ret

00000000800059b8 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    800059b8:	711d                	addi	sp,sp,-96
    800059ba:	ec86                	sd	ra,88(sp)
    800059bc:	e8a2                	sd	s0,80(sp)
    800059be:	e4a6                	sd	s1,72(sp)
    800059c0:	1080                	addi	s0,sp,96
    800059c2:	faa43c23          	sd	a0,-72(s0)
    800059c6:	87ae                	mv	a5,a1
    800059c8:	fac43423          	sd	a2,-88(s0)
    800059cc:	faf42a23          	sw	a5,-76(s0)
    800059d0:	87b6                	mv	a5,a3
    800059d2:	faf42823          	sw	a5,-80(s0)
    800059d6:	87ba                	mv	a5,a4
    800059d8:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    800059dc:	fb843783          	ld	a5,-72(s0)
    800059e0:	47f8                	lw	a4,76(a5)
    800059e2:	fb042783          	lw	a5,-80(s0)
    800059e6:	2781                	sext.w	a5,a5
    800059e8:	00f76e63          	bltu	a4,a5,80005a04 <readi+0x4c>
    800059ec:	fb042703          	lw	a4,-80(s0)
    800059f0:	fa442783          	lw	a5,-92(s0)
    800059f4:	9fb9                	addw	a5,a5,a4
    800059f6:	0007871b          	sext.w	a4,a5
    800059fa:	fb042783          	lw	a5,-80(s0)
    800059fe:	2781                	sext.w	a5,a5
    80005a00:	00f77463          	bgeu	a4,a5,80005a08 <readi+0x50>
    return 0;
    80005a04:	4781                	li	a5,0
    80005a06:	aa05                	j	80005b36 <readi+0x17e>
  if(off + n > ip->size)
    80005a08:	fb042703          	lw	a4,-80(s0)
    80005a0c:	fa442783          	lw	a5,-92(s0)
    80005a10:	9fb9                	addw	a5,a5,a4
    80005a12:	0007871b          	sext.w	a4,a5
    80005a16:	fb843783          	ld	a5,-72(s0)
    80005a1a:	47fc                	lw	a5,76(a5)
    80005a1c:	00e7fb63          	bgeu	a5,a4,80005a32 <readi+0x7a>
    n = ip->size - off;
    80005a20:	fb843783          	ld	a5,-72(s0)
    80005a24:	47f8                	lw	a4,76(a5)
    80005a26:	fb042783          	lw	a5,-80(s0)
    80005a2a:	40f707bb          	subw	a5,a4,a5
    80005a2e:	faf42223          	sw	a5,-92(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005a32:	fc042e23          	sw	zero,-36(s0)
    80005a36:	a0f5                	j	80005b22 <readi+0x16a>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005a38:	fb843783          	ld	a5,-72(s0)
    80005a3c:	4384                	lw	s1,0(a5)
    80005a3e:	fb042783          	lw	a5,-80(s0)
    80005a42:	00a7d79b          	srliw	a5,a5,0xa
    80005a46:	2781                	sext.w	a5,a5
    80005a48:	85be                	mv	a1,a5
    80005a4a:	fb843503          	ld	a0,-72(s0)
    80005a4e:	00000097          	auipc	ra,0x0
    80005a52:	c60080e7          	jalr	-928(ra) # 800056ae <bmap>
    80005a56:	87aa                	mv	a5,a0
    80005a58:	2781                	sext.w	a5,a5
    80005a5a:	85be                	mv	a1,a5
    80005a5c:	8526                	mv	a0,s1
    80005a5e:	fffff097          	auipc	ra,0xfffff
    80005a62:	fdc080e7          	jalr	-36(ra) # 80004a3a <bread>
    80005a66:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005a6a:	fb042783          	lw	a5,-80(s0)
    80005a6e:	3ff7f793          	andi	a5,a5,1023
    80005a72:	2781                	sext.w	a5,a5
    80005a74:	40000713          	li	a4,1024
    80005a78:	40f707bb          	subw	a5,a4,a5
    80005a7c:	0007869b          	sext.w	a3,a5
    80005a80:	fa442703          	lw	a4,-92(s0)
    80005a84:	fdc42783          	lw	a5,-36(s0)
    80005a88:	40f707bb          	subw	a5,a4,a5
    80005a8c:	2781                	sext.w	a5,a5
    80005a8e:	863e                	mv	a2,a5
    80005a90:	87b6                	mv	a5,a3
    80005a92:	0007869b          	sext.w	a3,a5
    80005a96:	0006071b          	sext.w	a4,a2
    80005a9a:	00d77363          	bgeu	a4,a3,80005aa0 <readi+0xe8>
    80005a9e:	87b2                	mv	a5,a2
    80005aa0:	fcf42623          	sw	a5,-52(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005aa4:	fd043783          	ld	a5,-48(s0)
    80005aa8:	05878713          	addi	a4,a5,88
    80005aac:	fb046783          	lwu	a5,-80(s0)
    80005ab0:	3ff7f793          	andi	a5,a5,1023
    80005ab4:	973e                	add	a4,a4,a5
    80005ab6:	fcc46683          	lwu	a3,-52(s0)
    80005aba:	fb442783          	lw	a5,-76(s0)
    80005abe:	863a                	mv	a2,a4
    80005ac0:	fa843583          	ld	a1,-88(s0)
    80005ac4:	853e                	mv	a0,a5
    80005ac6:	ffffe097          	auipc	ra,0xffffe
    80005aca:	c96080e7          	jalr	-874(ra) # 8000375c <either_copyout>
    80005ace:	87aa                	mv	a5,a0
    80005ad0:	873e                	mv	a4,a5
    80005ad2:	57fd                	li	a5,-1
    80005ad4:	00f71c63          	bne	a4,a5,80005aec <readi+0x134>
      brelse(bp);
    80005ad8:	fd043503          	ld	a0,-48(s0)
    80005adc:	fffff097          	auipc	ra,0xfffff
    80005ae0:	000080e7          	jalr	ra # 80004adc <brelse>
      tot = -1;
    80005ae4:	57fd                	li	a5,-1
    80005ae6:	fcf42e23          	sw	a5,-36(s0)
      break;
    80005aea:	a0a1                	j	80005b32 <readi+0x17a>
    }
    brelse(bp);
    80005aec:	fd043503          	ld	a0,-48(s0)
    80005af0:	fffff097          	auipc	ra,0xfffff
    80005af4:	fec080e7          	jalr	-20(ra) # 80004adc <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005af8:	fdc42703          	lw	a4,-36(s0)
    80005afc:	fcc42783          	lw	a5,-52(s0)
    80005b00:	9fb9                	addw	a5,a5,a4
    80005b02:	fcf42e23          	sw	a5,-36(s0)
    80005b06:	fb042703          	lw	a4,-80(s0)
    80005b0a:	fcc42783          	lw	a5,-52(s0)
    80005b0e:	9fb9                	addw	a5,a5,a4
    80005b10:	faf42823          	sw	a5,-80(s0)
    80005b14:	fcc46783          	lwu	a5,-52(s0)
    80005b18:	fa843703          	ld	a4,-88(s0)
    80005b1c:	97ba                	add	a5,a5,a4
    80005b1e:	faf43423          	sd	a5,-88(s0)
    80005b22:	fdc42703          	lw	a4,-36(s0)
    80005b26:	fa442783          	lw	a5,-92(s0)
    80005b2a:	2701                	sext.w	a4,a4
    80005b2c:	2781                	sext.w	a5,a5
    80005b2e:	f0f765e3          	bltu	a4,a5,80005a38 <readi+0x80>
  }
  return tot;
    80005b32:	fdc42783          	lw	a5,-36(s0)
}
    80005b36:	853e                	mv	a0,a5
    80005b38:	60e6                	ld	ra,88(sp)
    80005b3a:	6446                	ld	s0,80(sp)
    80005b3c:	64a6                	ld	s1,72(sp)
    80005b3e:	6125                	addi	sp,sp,96
    80005b40:	8082                	ret

0000000080005b42 <writei>:
// Caller must hold ip->lock.
// If user_src==1, then src is a user virtual address;
// otherwise, src is a kernel address.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005b42:	711d                	addi	sp,sp,-96
    80005b44:	ec86                	sd	ra,88(sp)
    80005b46:	e8a2                	sd	s0,80(sp)
    80005b48:	e4a6                	sd	s1,72(sp)
    80005b4a:	1080                	addi	s0,sp,96
    80005b4c:	faa43c23          	sd	a0,-72(s0)
    80005b50:	87ae                	mv	a5,a1
    80005b52:	fac43423          	sd	a2,-88(s0)
    80005b56:	faf42a23          	sw	a5,-76(s0)
    80005b5a:	87b6                	mv	a5,a3
    80005b5c:	faf42823          	sw	a5,-80(s0)
    80005b60:	87ba                	mv	a5,a4
    80005b62:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005b66:	fb843783          	ld	a5,-72(s0)
    80005b6a:	47f8                	lw	a4,76(a5)
    80005b6c:	fb042783          	lw	a5,-80(s0)
    80005b70:	2781                	sext.w	a5,a5
    80005b72:	00f76e63          	bltu	a4,a5,80005b8e <writei+0x4c>
    80005b76:	fb042703          	lw	a4,-80(s0)
    80005b7a:	fa442783          	lw	a5,-92(s0)
    80005b7e:	9fb9                	addw	a5,a5,a4
    80005b80:	0007871b          	sext.w	a4,a5
    80005b84:	fb042783          	lw	a5,-80(s0)
    80005b88:	2781                	sext.w	a5,a5
    80005b8a:	00f77463          	bgeu	a4,a5,80005b92 <writei+0x50>
    return -1;
    80005b8e:	57fd                	li	a5,-1
    80005b90:	aaa9                	j	80005cea <writei+0x1a8>
  if(off + n > MAXFILE*BSIZE)
    80005b92:	fb042703          	lw	a4,-80(s0)
    80005b96:	fa442783          	lw	a5,-92(s0)
    80005b9a:	9fb9                	addw	a5,a5,a4
    80005b9c:	2781                	sext.w	a5,a5
    80005b9e:	873e                	mv	a4,a5
    80005ba0:	000437b7          	lui	a5,0x43
    80005ba4:	00e7f463          	bgeu	a5,a4,80005bac <writei+0x6a>
    return -1;
    80005ba8:	57fd                	li	a5,-1
    80005baa:	a281                	j	80005cea <writei+0x1a8>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005bac:	fc042e23          	sw	zero,-36(s0)
    80005bb0:	a8e5                	j	80005ca8 <writei+0x166>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005bb2:	fb843783          	ld	a5,-72(s0)
    80005bb6:	4384                	lw	s1,0(a5)
    80005bb8:	fb042783          	lw	a5,-80(s0)
    80005bbc:	00a7d79b          	srliw	a5,a5,0xa
    80005bc0:	2781                	sext.w	a5,a5
    80005bc2:	85be                	mv	a1,a5
    80005bc4:	fb843503          	ld	a0,-72(s0)
    80005bc8:	00000097          	auipc	ra,0x0
    80005bcc:	ae6080e7          	jalr	-1306(ra) # 800056ae <bmap>
    80005bd0:	87aa                	mv	a5,a0
    80005bd2:	2781                	sext.w	a5,a5
    80005bd4:	85be                	mv	a1,a5
    80005bd6:	8526                	mv	a0,s1
    80005bd8:	fffff097          	auipc	ra,0xfffff
    80005bdc:	e62080e7          	jalr	-414(ra) # 80004a3a <bread>
    80005be0:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005be4:	fb042783          	lw	a5,-80(s0)
    80005be8:	3ff7f793          	andi	a5,a5,1023
    80005bec:	2781                	sext.w	a5,a5
    80005bee:	40000713          	li	a4,1024
    80005bf2:	40f707bb          	subw	a5,a4,a5
    80005bf6:	0007869b          	sext.w	a3,a5
    80005bfa:	fa442703          	lw	a4,-92(s0)
    80005bfe:	fdc42783          	lw	a5,-36(s0)
    80005c02:	40f707bb          	subw	a5,a4,a5
    80005c06:	2781                	sext.w	a5,a5
    80005c08:	863e                	mv	a2,a5
    80005c0a:	87b6                	mv	a5,a3
    80005c0c:	0007869b          	sext.w	a3,a5
    80005c10:	0006071b          	sext.w	a4,a2
    80005c14:	00d77363          	bgeu	a4,a3,80005c1a <writei+0xd8>
    80005c18:	87b2                	mv	a5,a2
    80005c1a:	fcf42623          	sw	a5,-52(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005c1e:	fd043783          	ld	a5,-48(s0)
    80005c22:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005c26:	fb046783          	lwu	a5,-80(s0)
    80005c2a:	3ff7f793          	andi	a5,a5,1023
    80005c2e:	97ba                	add	a5,a5,a4
    80005c30:	fcc46683          	lwu	a3,-52(s0)
    80005c34:	fb442703          	lw	a4,-76(s0)
    80005c38:	fa843603          	ld	a2,-88(s0)
    80005c3c:	85ba                	mv	a1,a4
    80005c3e:	853e                	mv	a0,a5
    80005c40:	ffffe097          	auipc	ra,0xffffe
    80005c44:	b96080e7          	jalr	-1130(ra) # 800037d6 <either_copyin>
    80005c48:	87aa                	mv	a5,a0
    80005c4a:	873e                	mv	a4,a5
    80005c4c:	57fd                	li	a5,-1
    80005c4e:	00f71c63          	bne	a4,a5,80005c66 <writei+0x124>
      brelse(bp);
    80005c52:	fd043503          	ld	a0,-48(s0)
    80005c56:	fffff097          	auipc	ra,0xfffff
    80005c5a:	e86080e7          	jalr	-378(ra) # 80004adc <brelse>
      n = -1;
    80005c5e:	57fd                	li	a5,-1
    80005c60:	faf42223          	sw	a5,-92(s0)
      break;
    80005c64:	a891                	j	80005cb8 <writei+0x176>
    }
    log_write(bp);
    80005c66:	fd043503          	ld	a0,-48(s0)
    80005c6a:	00001097          	auipc	ra,0x1
    80005c6e:	b02080e7          	jalr	-1278(ra) # 8000676c <log_write>
    brelse(bp);
    80005c72:	fd043503          	ld	a0,-48(s0)
    80005c76:	fffff097          	auipc	ra,0xfffff
    80005c7a:	e66080e7          	jalr	-410(ra) # 80004adc <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005c7e:	fdc42703          	lw	a4,-36(s0)
    80005c82:	fcc42783          	lw	a5,-52(s0)
    80005c86:	9fb9                	addw	a5,a5,a4
    80005c88:	fcf42e23          	sw	a5,-36(s0)
    80005c8c:	fb042703          	lw	a4,-80(s0)
    80005c90:	fcc42783          	lw	a5,-52(s0)
    80005c94:	9fb9                	addw	a5,a5,a4
    80005c96:	faf42823          	sw	a5,-80(s0)
    80005c9a:	fcc46783          	lwu	a5,-52(s0)
    80005c9e:	fa843703          	ld	a4,-88(s0)
    80005ca2:	97ba                	add	a5,a5,a4
    80005ca4:	faf43423          	sd	a5,-88(s0)
    80005ca8:	fdc42703          	lw	a4,-36(s0)
    80005cac:	fa442783          	lw	a5,-92(s0)
    80005cb0:	2701                	sext.w	a4,a4
    80005cb2:	2781                	sext.w	a5,a5
    80005cb4:	eef76fe3          	bltu	a4,a5,80005bb2 <writei+0x70>
  }

  if(n > 0){
    80005cb8:	fa442783          	lw	a5,-92(s0)
    80005cbc:	2781                	sext.w	a5,a5
    80005cbe:	c785                	beqz	a5,80005ce6 <writei+0x1a4>
    if(off > ip->size)
    80005cc0:	fb843783          	ld	a5,-72(s0)
    80005cc4:	47f8                	lw	a4,76(a5)
    80005cc6:	fb042783          	lw	a5,-80(s0)
    80005cca:	2781                	sext.w	a5,a5
    80005ccc:	00f77763          	bgeu	a4,a5,80005cda <writei+0x198>
      ip->size = off;
    80005cd0:	fb843783          	ld	a5,-72(s0)
    80005cd4:	fb042703          	lw	a4,-80(s0)
    80005cd8:	c7f8                	sw	a4,76(a5)
    // write the i-node back to disk even if the size didn't change
    // because the loop above might have called bmap() and added a new
    // block to ip->addrs[].
    iupdate(ip);
    80005cda:	fb843503          	ld	a0,-72(s0)
    80005cde:	fffff097          	auipc	ra,0xfffff
    80005ce2:	4f4080e7          	jalr	1268(ra) # 800051d2 <iupdate>
  }

  return n;
    80005ce6:	fa442783          	lw	a5,-92(s0)
}
    80005cea:	853e                	mv	a0,a5
    80005cec:	60e6                	ld	ra,88(sp)
    80005cee:	6446                	ld	s0,80(sp)
    80005cf0:	64a6                	ld	s1,72(sp)
    80005cf2:	6125                	addi	sp,sp,96
    80005cf4:	8082                	ret

0000000080005cf6 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005cf6:	1101                	addi	sp,sp,-32
    80005cf8:	ec06                	sd	ra,24(sp)
    80005cfa:	e822                	sd	s0,16(sp)
    80005cfc:	1000                	addi	s0,sp,32
    80005cfe:	fea43423          	sd	a0,-24(s0)
    80005d02:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005d06:	4639                	li	a2,14
    80005d08:	fe043583          	ld	a1,-32(s0)
    80005d0c:	fe843503          	ld	a0,-24(s0)
    80005d10:	ffffc097          	auipc	ra,0xffffc
    80005d14:	92c080e7          	jalr	-1748(ra) # 8000163c <strncmp>
    80005d18:	87aa                	mv	a5,a0
}
    80005d1a:	853e                	mv	a0,a5
    80005d1c:	60e2                	ld	ra,24(sp)
    80005d1e:	6442                	ld	s0,16(sp)
    80005d20:	6105                	addi	sp,sp,32
    80005d22:	8082                	ret

0000000080005d24 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005d24:	715d                	addi	sp,sp,-80
    80005d26:	e486                	sd	ra,72(sp)
    80005d28:	e0a2                	sd	s0,64(sp)
    80005d2a:	0880                	addi	s0,sp,80
    80005d2c:	fca43423          	sd	a0,-56(s0)
    80005d30:	fcb43023          	sd	a1,-64(s0)
    80005d34:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005d38:	fc843783          	ld	a5,-56(s0)
    80005d3c:	04479783          	lh	a5,68(a5)
    80005d40:	0007871b          	sext.w	a4,a5
    80005d44:	4785                	li	a5,1
    80005d46:	00f70a63          	beq	a4,a5,80005d5a <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005d4a:	00005517          	auipc	a0,0x5
    80005d4e:	79650513          	addi	a0,a0,1942 # 8000b4e0 <etext+0x4e0>
    80005d52:	ffffb097          	auipc	ra,0xffffb
    80005d56:	efe080e7          	jalr	-258(ra) # 80000c50 <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d5a:	fe042623          	sw	zero,-20(s0)
    80005d5e:	a849                	j	80005df0 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d60:	fd840793          	addi	a5,s0,-40
    80005d64:	fec42683          	lw	a3,-20(s0)
    80005d68:	4741                	li	a4,16
    80005d6a:	863e                	mv	a2,a5
    80005d6c:	4581                	li	a1,0
    80005d6e:	fc843503          	ld	a0,-56(s0)
    80005d72:	00000097          	auipc	ra,0x0
    80005d76:	c46080e7          	jalr	-954(ra) # 800059b8 <readi>
    80005d7a:	87aa                	mv	a5,a0
    80005d7c:	873e                	mv	a4,a5
    80005d7e:	47c1                	li	a5,16
    80005d80:	00f70a63          	beq	a4,a5,80005d94 <dirlookup+0x70>
      panic("dirlookup read");
    80005d84:	00005517          	auipc	a0,0x5
    80005d88:	77450513          	addi	a0,a0,1908 # 8000b4f8 <etext+0x4f8>
    80005d8c:	ffffb097          	auipc	ra,0xffffb
    80005d90:	ec4080e7          	jalr	-316(ra) # 80000c50 <panic>
    if(de.inum == 0)
    80005d94:	fd845783          	lhu	a5,-40(s0)
    80005d98:	c7b1                	beqz	a5,80005de4 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005d9a:	fd840793          	addi	a5,s0,-40
    80005d9e:	0789                	addi	a5,a5,2
    80005da0:	85be                	mv	a1,a5
    80005da2:	fc043503          	ld	a0,-64(s0)
    80005da6:	00000097          	auipc	ra,0x0
    80005daa:	f50080e7          	jalr	-176(ra) # 80005cf6 <namecmp>
    80005dae:	87aa                	mv	a5,a0
    80005db0:	eb9d                	bnez	a5,80005de6 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005db2:	fb843783          	ld	a5,-72(s0)
    80005db6:	c791                	beqz	a5,80005dc2 <dirlookup+0x9e>
        *poff = off;
    80005db8:	fb843783          	ld	a5,-72(s0)
    80005dbc:	fec42703          	lw	a4,-20(s0)
    80005dc0:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005dc2:	fd845783          	lhu	a5,-40(s0)
    80005dc6:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005dca:	fc843783          	ld	a5,-56(s0)
    80005dce:	439c                	lw	a5,0(a5)
    80005dd0:	fe842703          	lw	a4,-24(s0)
    80005dd4:	85ba                	mv	a1,a4
    80005dd6:	853e                	mv	a0,a5
    80005dd8:	fffff097          	auipc	ra,0xfffff
    80005ddc:	4e2080e7          	jalr	1250(ra) # 800052ba <iget>
    80005de0:	87aa                	mv	a5,a0
    80005de2:	a005                	j	80005e02 <dirlookup+0xde>
      continue;
    80005de4:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005de6:	fec42783          	lw	a5,-20(s0)
    80005dea:	27c1                	addiw	a5,a5,16
    80005dec:	fef42623          	sw	a5,-20(s0)
    80005df0:	fc843783          	ld	a5,-56(s0)
    80005df4:	47f8                	lw	a4,76(a5)
    80005df6:	fec42783          	lw	a5,-20(s0)
    80005dfa:	2781                	sext.w	a5,a5
    80005dfc:	f6e7e2e3          	bltu	a5,a4,80005d60 <dirlookup+0x3c>
    }
  }

  return 0;
    80005e00:	4781                	li	a5,0
}
    80005e02:	853e                	mv	a0,a5
    80005e04:	60a6                	ld	ra,72(sp)
    80005e06:	6406                	ld	s0,64(sp)
    80005e08:	6161                	addi	sp,sp,80
    80005e0a:	8082                	ret

0000000080005e0c <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005e0c:	715d                	addi	sp,sp,-80
    80005e0e:	e486                	sd	ra,72(sp)
    80005e10:	e0a2                	sd	s0,64(sp)
    80005e12:	0880                	addi	s0,sp,80
    80005e14:	fca43423          	sd	a0,-56(s0)
    80005e18:	fcb43023          	sd	a1,-64(s0)
    80005e1c:	87b2                	mv	a5,a2
    80005e1e:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005e22:	4601                	li	a2,0
    80005e24:	fc043583          	ld	a1,-64(s0)
    80005e28:	fc843503          	ld	a0,-56(s0)
    80005e2c:	00000097          	auipc	ra,0x0
    80005e30:	ef8080e7          	jalr	-264(ra) # 80005d24 <dirlookup>
    80005e34:	fea43023          	sd	a0,-32(s0)
    80005e38:	fe043783          	ld	a5,-32(s0)
    80005e3c:	cb89                	beqz	a5,80005e4e <dirlink+0x42>
    iput(ip);
    80005e3e:	fe043503          	ld	a0,-32(s0)
    80005e42:	fffff097          	auipc	ra,0xfffff
    80005e46:	76e080e7          	jalr	1902(ra) # 800055b0 <iput>
    return -1;
    80005e4a:	57fd                	li	a5,-1
    80005e4c:	a865                	j	80005f04 <dirlink+0xf8>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005e4e:	fe042623          	sw	zero,-20(s0)
    80005e52:	a0a1                	j	80005e9a <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005e54:	fd040793          	addi	a5,s0,-48
    80005e58:	fec42683          	lw	a3,-20(s0)
    80005e5c:	4741                	li	a4,16
    80005e5e:	863e                	mv	a2,a5
    80005e60:	4581                	li	a1,0
    80005e62:	fc843503          	ld	a0,-56(s0)
    80005e66:	00000097          	auipc	ra,0x0
    80005e6a:	b52080e7          	jalr	-1198(ra) # 800059b8 <readi>
    80005e6e:	87aa                	mv	a5,a0
    80005e70:	873e                	mv	a4,a5
    80005e72:	47c1                	li	a5,16
    80005e74:	00f70a63          	beq	a4,a5,80005e88 <dirlink+0x7c>
      panic("dirlink read");
    80005e78:	00005517          	auipc	a0,0x5
    80005e7c:	69050513          	addi	a0,a0,1680 # 8000b508 <etext+0x508>
    80005e80:	ffffb097          	auipc	ra,0xffffb
    80005e84:	dd0080e7          	jalr	-560(ra) # 80000c50 <panic>
    if(de.inum == 0)
    80005e88:	fd045783          	lhu	a5,-48(s0)
    80005e8c:	cf99                	beqz	a5,80005eaa <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005e8e:	fec42783          	lw	a5,-20(s0)
    80005e92:	27c1                	addiw	a5,a5,16
    80005e94:	2781                	sext.w	a5,a5
    80005e96:	fef42623          	sw	a5,-20(s0)
    80005e9a:	fc843783          	ld	a5,-56(s0)
    80005e9e:	47f8                	lw	a4,76(a5)
    80005ea0:	fec42783          	lw	a5,-20(s0)
    80005ea4:	fae7e8e3          	bltu	a5,a4,80005e54 <dirlink+0x48>
    80005ea8:	a011                	j	80005eac <dirlink+0xa0>
      break;
    80005eaa:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005eac:	fd040793          	addi	a5,s0,-48
    80005eb0:	0789                	addi	a5,a5,2
    80005eb2:	4639                	li	a2,14
    80005eb4:	fc043583          	ld	a1,-64(s0)
    80005eb8:	853e                	mv	a0,a5
    80005eba:	ffffc097          	auipc	ra,0xffffc
    80005ebe:	80c080e7          	jalr	-2036(ra) # 800016c6 <strncpy>
  de.inum = inum;
    80005ec2:	fbc42783          	lw	a5,-68(s0)
    80005ec6:	17c2                	slli	a5,a5,0x30
    80005ec8:	93c1                	srli	a5,a5,0x30
    80005eca:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005ece:	fd040793          	addi	a5,s0,-48
    80005ed2:	fec42683          	lw	a3,-20(s0)
    80005ed6:	4741                	li	a4,16
    80005ed8:	863e                	mv	a2,a5
    80005eda:	4581                	li	a1,0
    80005edc:	fc843503          	ld	a0,-56(s0)
    80005ee0:	00000097          	auipc	ra,0x0
    80005ee4:	c62080e7          	jalr	-926(ra) # 80005b42 <writei>
    80005ee8:	87aa                	mv	a5,a0
    80005eea:	873e                	mv	a4,a5
    80005eec:	47c1                	li	a5,16
    80005eee:	00f70a63          	beq	a4,a5,80005f02 <dirlink+0xf6>
    panic("dirlink");
    80005ef2:	00005517          	auipc	a0,0x5
    80005ef6:	62650513          	addi	a0,a0,1574 # 8000b518 <etext+0x518>
    80005efa:	ffffb097          	auipc	ra,0xffffb
    80005efe:	d56080e7          	jalr	-682(ra) # 80000c50 <panic>

  return 0;
    80005f02:	4781                	li	a5,0
}
    80005f04:	853e                	mv	a0,a5
    80005f06:	60a6                	ld	ra,72(sp)
    80005f08:	6406                	ld	s0,64(sp)
    80005f0a:	6161                	addi	sp,sp,80
    80005f0c:	8082                	ret

0000000080005f0e <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005f0e:	7179                	addi	sp,sp,-48
    80005f10:	f406                	sd	ra,40(sp)
    80005f12:	f022                	sd	s0,32(sp)
    80005f14:	1800                	addi	s0,sp,48
    80005f16:	fca43c23          	sd	a0,-40(s0)
    80005f1a:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005f1e:	a031                	j	80005f2a <skipelem+0x1c>
    path++;
    80005f20:	fd843783          	ld	a5,-40(s0)
    80005f24:	0785                	addi	a5,a5,1
    80005f26:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005f2a:	fd843783          	ld	a5,-40(s0)
    80005f2e:	0007c783          	lbu	a5,0(a5)
    80005f32:	873e                	mv	a4,a5
    80005f34:	02f00793          	li	a5,47
    80005f38:	fef704e3          	beq	a4,a5,80005f20 <skipelem+0x12>
  if(*path == 0)
    80005f3c:	fd843783          	ld	a5,-40(s0)
    80005f40:	0007c783          	lbu	a5,0(a5)
    80005f44:	e399                	bnez	a5,80005f4a <skipelem+0x3c>
    return 0;
    80005f46:	4781                	li	a5,0
    80005f48:	a06d                	j	80005ff2 <skipelem+0xe4>
  s = path;
    80005f4a:	fd843783          	ld	a5,-40(s0)
    80005f4e:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005f52:	a031                	j	80005f5e <skipelem+0x50>
    path++;
    80005f54:	fd843783          	ld	a5,-40(s0)
    80005f58:	0785                	addi	a5,a5,1
    80005f5a:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005f5e:	fd843783          	ld	a5,-40(s0)
    80005f62:	0007c783          	lbu	a5,0(a5)
    80005f66:	873e                	mv	a4,a5
    80005f68:	02f00793          	li	a5,47
    80005f6c:	00f70763          	beq	a4,a5,80005f7a <skipelem+0x6c>
    80005f70:	fd843783          	ld	a5,-40(s0)
    80005f74:	0007c783          	lbu	a5,0(a5)
    80005f78:	fff1                	bnez	a5,80005f54 <skipelem+0x46>
  len = path - s;
    80005f7a:	fd843703          	ld	a4,-40(s0)
    80005f7e:	fe843783          	ld	a5,-24(s0)
    80005f82:	40f707b3          	sub	a5,a4,a5
    80005f86:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005f8a:	fe442783          	lw	a5,-28(s0)
    80005f8e:	0007871b          	sext.w	a4,a5
    80005f92:	47b5                	li	a5,13
    80005f94:	00e7dc63          	bge	a5,a4,80005fac <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005f98:	4639                	li	a2,14
    80005f9a:	fe843583          	ld	a1,-24(s0)
    80005f9e:	fd043503          	ld	a0,-48(s0)
    80005fa2:	ffffb097          	auipc	ra,0xffffb
    80005fa6:	594080e7          	jalr	1428(ra) # 80001536 <memmove>
    80005faa:	a80d                	j	80005fdc <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005fac:	fe442783          	lw	a5,-28(s0)
    80005fb0:	863e                	mv	a2,a5
    80005fb2:	fe843583          	ld	a1,-24(s0)
    80005fb6:	fd043503          	ld	a0,-48(s0)
    80005fba:	ffffb097          	auipc	ra,0xffffb
    80005fbe:	57c080e7          	jalr	1404(ra) # 80001536 <memmove>
    name[len] = 0;
    80005fc2:	fe442783          	lw	a5,-28(s0)
    80005fc6:	fd043703          	ld	a4,-48(s0)
    80005fca:	97ba                	add	a5,a5,a4
    80005fcc:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005fd0:	a031                	j	80005fdc <skipelem+0xce>
    path++;
    80005fd2:	fd843783          	ld	a5,-40(s0)
    80005fd6:	0785                	addi	a5,a5,1
    80005fd8:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005fdc:	fd843783          	ld	a5,-40(s0)
    80005fe0:	0007c783          	lbu	a5,0(a5)
    80005fe4:	873e                	mv	a4,a5
    80005fe6:	02f00793          	li	a5,47
    80005fea:	fef704e3          	beq	a4,a5,80005fd2 <skipelem+0xc4>
  return path;
    80005fee:	fd843783          	ld	a5,-40(s0)
}
    80005ff2:	853e                	mv	a0,a5
    80005ff4:	70a2                	ld	ra,40(sp)
    80005ff6:	7402                	ld	s0,32(sp)
    80005ff8:	6145                	addi	sp,sp,48
    80005ffa:	8082                	ret

0000000080005ffc <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005ffc:	7139                	addi	sp,sp,-64
    80005ffe:	fc06                	sd	ra,56(sp)
    80006000:	f822                	sd	s0,48(sp)
    80006002:	0080                	addi	s0,sp,64
    80006004:	fca43c23          	sd	a0,-40(s0)
    80006008:	87ae                	mv	a5,a1
    8000600a:	fcc43423          	sd	a2,-56(s0)
    8000600e:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80006012:	fd843783          	ld	a5,-40(s0)
    80006016:	0007c783          	lbu	a5,0(a5)
    8000601a:	873e                	mv	a4,a5
    8000601c:	02f00793          	li	a5,47
    80006020:	00f71b63          	bne	a4,a5,80006036 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80006024:	4585                	li	a1,1
    80006026:	4505                	li	a0,1
    80006028:	fffff097          	auipc	ra,0xfffff
    8000602c:	292080e7          	jalr	658(ra) # 800052ba <iget>
    80006030:	fea43423          	sd	a0,-24(s0)
    80006034:	a85d                	j	800060ea <namex+0xee>
  else
    ip = idup(myproc()->cwd);
    80006036:	ffffc097          	auipc	ra,0xffffc
    8000603a:	7c0080e7          	jalr	1984(ra) # 800027f6 <myproc>
    8000603e:	872a                	mv	a4,a0
    80006040:	6785                	lui	a5,0x1
    80006042:	97ba                	add	a5,a5,a4
    80006044:	3b87b783          	ld	a5,952(a5) # 13b8 <_entry-0x7fffec48>
    80006048:	853e                	mv	a0,a5
    8000604a:	fffff097          	auipc	ra,0xfffff
    8000604e:	38c080e7          	jalr	908(ra) # 800053d6 <idup>
    80006052:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80006056:	a851                	j	800060ea <namex+0xee>
    ilock(ip);
    80006058:	fe843503          	ld	a0,-24(s0)
    8000605c:	fffff097          	auipc	ra,0xfffff
    80006060:	3c6080e7          	jalr	966(ra) # 80005422 <ilock>
    if(ip->type != T_DIR){
    80006064:	fe843783          	ld	a5,-24(s0)
    80006068:	04479783          	lh	a5,68(a5)
    8000606c:	0007871b          	sext.w	a4,a5
    80006070:	4785                	li	a5,1
    80006072:	00f70a63          	beq	a4,a5,80006086 <namex+0x8a>
      iunlockput(ip);
    80006076:	fe843503          	ld	a0,-24(s0)
    8000607a:	fffff097          	auipc	ra,0xfffff
    8000607e:	606080e7          	jalr	1542(ra) # 80005680 <iunlockput>
      return 0;
    80006082:	4781                	li	a5,0
    80006084:	a871                	j	80006120 <namex+0x124>
    }
    if(nameiparent && *path == '\0'){
    80006086:	fd442783          	lw	a5,-44(s0)
    8000608a:	2781                	sext.w	a5,a5
    8000608c:	cf99                	beqz	a5,800060aa <namex+0xae>
    8000608e:	fd843783          	ld	a5,-40(s0)
    80006092:	0007c783          	lbu	a5,0(a5)
    80006096:	eb91                	bnez	a5,800060aa <namex+0xae>
      // Stop one level early.
      iunlock(ip);
    80006098:	fe843503          	ld	a0,-24(s0)
    8000609c:	fffff097          	auipc	ra,0xfffff
    800060a0:	4ba080e7          	jalr	1210(ra) # 80005556 <iunlock>
      return ip;
    800060a4:	fe843783          	ld	a5,-24(s0)
    800060a8:	a8a5                	j	80006120 <namex+0x124>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    800060aa:	4601                	li	a2,0
    800060ac:	fc843583          	ld	a1,-56(s0)
    800060b0:	fe843503          	ld	a0,-24(s0)
    800060b4:	00000097          	auipc	ra,0x0
    800060b8:	c70080e7          	jalr	-912(ra) # 80005d24 <dirlookup>
    800060bc:	fea43023          	sd	a0,-32(s0)
    800060c0:	fe043783          	ld	a5,-32(s0)
    800060c4:	eb89                	bnez	a5,800060d6 <namex+0xda>
      iunlockput(ip);
    800060c6:	fe843503          	ld	a0,-24(s0)
    800060ca:	fffff097          	auipc	ra,0xfffff
    800060ce:	5b6080e7          	jalr	1462(ra) # 80005680 <iunlockput>
      return 0;
    800060d2:	4781                	li	a5,0
    800060d4:	a0b1                	j	80006120 <namex+0x124>
    }
    iunlockput(ip);
    800060d6:	fe843503          	ld	a0,-24(s0)
    800060da:	fffff097          	auipc	ra,0xfffff
    800060de:	5a6080e7          	jalr	1446(ra) # 80005680 <iunlockput>
    ip = next;
    800060e2:	fe043783          	ld	a5,-32(s0)
    800060e6:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    800060ea:	fc843583          	ld	a1,-56(s0)
    800060ee:	fd843503          	ld	a0,-40(s0)
    800060f2:	00000097          	auipc	ra,0x0
    800060f6:	e1c080e7          	jalr	-484(ra) # 80005f0e <skipelem>
    800060fa:	fca43c23          	sd	a0,-40(s0)
    800060fe:	fd843783          	ld	a5,-40(s0)
    80006102:	fbb9                	bnez	a5,80006058 <namex+0x5c>
  }
  if(nameiparent){
    80006104:	fd442783          	lw	a5,-44(s0)
    80006108:	2781                	sext.w	a5,a5
    8000610a:	cb89                	beqz	a5,8000611c <namex+0x120>
    iput(ip);
    8000610c:	fe843503          	ld	a0,-24(s0)
    80006110:	fffff097          	auipc	ra,0xfffff
    80006114:	4a0080e7          	jalr	1184(ra) # 800055b0 <iput>
    return 0;
    80006118:	4781                	li	a5,0
    8000611a:	a019                	j	80006120 <namex+0x124>
  }
  return ip;
    8000611c:	fe843783          	ld	a5,-24(s0)
}
    80006120:	853e                	mv	a0,a5
    80006122:	70e2                	ld	ra,56(sp)
    80006124:	7442                	ld	s0,48(sp)
    80006126:	6121                	addi	sp,sp,64
    80006128:	8082                	ret

000000008000612a <namei>:

struct inode*
namei(char *path)
{
    8000612a:	7179                	addi	sp,sp,-48
    8000612c:	f406                	sd	ra,40(sp)
    8000612e:	f022                	sd	s0,32(sp)
    80006130:	1800                	addi	s0,sp,48
    80006132:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80006136:	fe040793          	addi	a5,s0,-32
    8000613a:	863e                	mv	a2,a5
    8000613c:	4581                	li	a1,0
    8000613e:	fd843503          	ld	a0,-40(s0)
    80006142:	00000097          	auipc	ra,0x0
    80006146:	eba080e7          	jalr	-326(ra) # 80005ffc <namex>
    8000614a:	87aa                	mv	a5,a0
}
    8000614c:	853e                	mv	a0,a5
    8000614e:	70a2                	ld	ra,40(sp)
    80006150:	7402                	ld	s0,32(sp)
    80006152:	6145                	addi	sp,sp,48
    80006154:	8082                	ret

0000000080006156 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80006156:	1101                	addi	sp,sp,-32
    80006158:	ec06                	sd	ra,24(sp)
    8000615a:	e822                	sd	s0,16(sp)
    8000615c:	1000                	addi	s0,sp,32
    8000615e:	fea43423          	sd	a0,-24(s0)
    80006162:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80006166:	fe043603          	ld	a2,-32(s0)
    8000616a:	4585                	li	a1,1
    8000616c:	fe843503          	ld	a0,-24(s0)
    80006170:	00000097          	auipc	ra,0x0
    80006174:	e8c080e7          	jalr	-372(ra) # 80005ffc <namex>
    80006178:	87aa                	mv	a5,a0
}
    8000617a:	853e                	mv	a0,a5
    8000617c:	60e2                	ld	ra,24(sp)
    8000617e:	6442                	ld	s0,16(sp)
    80006180:	6105                	addi	sp,sp,32
    80006182:	8082                	ret

0000000080006184 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80006184:	1101                	addi	sp,sp,-32
    80006186:	ec06                	sd	ra,24(sp)
    80006188:	e822                	sd	s0,16(sp)
    8000618a:	1000                	addi	s0,sp,32
    8000618c:	87aa                	mv	a5,a0
    8000618e:	feb43023          	sd	a1,-32(s0)
    80006192:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80006196:	00005597          	auipc	a1,0x5
    8000619a:	38a58593          	addi	a1,a1,906 # 8000b520 <etext+0x520>
    8000619e:	00068517          	auipc	a0,0x68
    800061a2:	ab250513          	addi	a0,a0,-1358 # 8006dc50 <log>
    800061a6:	ffffb097          	auipc	ra,0xffffb
    800061aa:	0a8080e7          	jalr	168(ra) # 8000124e <initlock>
  log.start = sb->logstart;
    800061ae:	fe043783          	ld	a5,-32(s0)
    800061b2:	4bdc                	lw	a5,20(a5)
    800061b4:	0007871b          	sext.w	a4,a5
    800061b8:	00068797          	auipc	a5,0x68
    800061bc:	a9878793          	addi	a5,a5,-1384 # 8006dc50 <log>
    800061c0:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    800061c2:	fe043783          	ld	a5,-32(s0)
    800061c6:	4b9c                	lw	a5,16(a5)
    800061c8:	0007871b          	sext.w	a4,a5
    800061cc:	00068797          	auipc	a5,0x68
    800061d0:	a8478793          	addi	a5,a5,-1404 # 8006dc50 <log>
    800061d4:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    800061d6:	00068797          	auipc	a5,0x68
    800061da:	a7a78793          	addi	a5,a5,-1414 # 8006dc50 <log>
    800061de:	fec42703          	lw	a4,-20(s0)
    800061e2:	d798                	sw	a4,40(a5)
  recover_from_log();
    800061e4:	00000097          	auipc	ra,0x0
    800061e8:	272080e7          	jalr	626(ra) # 80006456 <recover_from_log>
}
    800061ec:	0001                	nop
    800061ee:	60e2                	ld	ra,24(sp)
    800061f0:	6442                	ld	s0,16(sp)
    800061f2:	6105                	addi	sp,sp,32
    800061f4:	8082                	ret

00000000800061f6 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    800061f6:	7139                	addi	sp,sp,-64
    800061f8:	fc06                	sd	ra,56(sp)
    800061fa:	f822                	sd	s0,48(sp)
    800061fc:	0080                	addi	s0,sp,64
    800061fe:	87aa                	mv	a5,a0
    80006200:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006204:	fe042623          	sw	zero,-20(s0)
    80006208:	a0f9                	j	800062d6 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    8000620a:	00068797          	auipc	a5,0x68
    8000620e:	a4678793          	addi	a5,a5,-1466 # 8006dc50 <log>
    80006212:	579c                	lw	a5,40(a5)
    80006214:	0007869b          	sext.w	a3,a5
    80006218:	00068797          	auipc	a5,0x68
    8000621c:	a3878793          	addi	a5,a5,-1480 # 8006dc50 <log>
    80006220:	4f9c                	lw	a5,24(a5)
    80006222:	fec42703          	lw	a4,-20(s0)
    80006226:	9fb9                	addw	a5,a5,a4
    80006228:	2781                	sext.w	a5,a5
    8000622a:	2785                	addiw	a5,a5,1
    8000622c:	2781                	sext.w	a5,a5
    8000622e:	2781                	sext.w	a5,a5
    80006230:	85be                	mv	a1,a5
    80006232:	8536                	mv	a0,a3
    80006234:	fffff097          	auipc	ra,0xfffff
    80006238:	806080e7          	jalr	-2042(ra) # 80004a3a <bread>
    8000623c:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80006240:	00068797          	auipc	a5,0x68
    80006244:	a1078793          	addi	a5,a5,-1520 # 8006dc50 <log>
    80006248:	579c                	lw	a5,40(a5)
    8000624a:	0007869b          	sext.w	a3,a5
    8000624e:	00068717          	auipc	a4,0x68
    80006252:	a0270713          	addi	a4,a4,-1534 # 8006dc50 <log>
    80006256:	fec42783          	lw	a5,-20(s0)
    8000625a:	07a1                	addi	a5,a5,8
    8000625c:	078a                	slli	a5,a5,0x2
    8000625e:	97ba                	add	a5,a5,a4
    80006260:	4b9c                	lw	a5,16(a5)
    80006262:	2781                	sext.w	a5,a5
    80006264:	85be                	mv	a1,a5
    80006266:	8536                	mv	a0,a3
    80006268:	ffffe097          	auipc	ra,0xffffe
    8000626c:	7d2080e7          	jalr	2002(ra) # 80004a3a <bread>
    80006270:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006274:	fd843783          	ld	a5,-40(s0)
    80006278:	05878713          	addi	a4,a5,88
    8000627c:	fe043783          	ld	a5,-32(s0)
    80006280:	05878793          	addi	a5,a5,88
    80006284:	40000613          	li	a2,1024
    80006288:	85be                	mv	a1,a5
    8000628a:	853a                	mv	a0,a4
    8000628c:	ffffb097          	auipc	ra,0xffffb
    80006290:	2aa080e7          	jalr	682(ra) # 80001536 <memmove>
    bwrite(dbuf);  // write dst to disk
    80006294:	fd843503          	ld	a0,-40(s0)
    80006298:	ffffe097          	auipc	ra,0xffffe
    8000629c:	7fc080e7          	jalr	2044(ra) # 80004a94 <bwrite>
    if(recovering == 0)
    800062a0:	fcc42783          	lw	a5,-52(s0)
    800062a4:	2781                	sext.w	a5,a5
    800062a6:	e799                	bnez	a5,800062b4 <install_trans+0xbe>
      bunpin(dbuf);
    800062a8:	fd843503          	ld	a0,-40(s0)
    800062ac:	fffff097          	auipc	ra,0xfffff
    800062b0:	966080e7          	jalr	-1690(ra) # 80004c12 <bunpin>
    brelse(lbuf);
    800062b4:	fe043503          	ld	a0,-32(s0)
    800062b8:	fffff097          	auipc	ra,0xfffff
    800062bc:	824080e7          	jalr	-2012(ra) # 80004adc <brelse>
    brelse(dbuf);
    800062c0:	fd843503          	ld	a0,-40(s0)
    800062c4:	fffff097          	auipc	ra,0xfffff
    800062c8:	818080e7          	jalr	-2024(ra) # 80004adc <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800062cc:	fec42783          	lw	a5,-20(s0)
    800062d0:	2785                	addiw	a5,a5,1
    800062d2:	fef42623          	sw	a5,-20(s0)
    800062d6:	00068797          	auipc	a5,0x68
    800062da:	97a78793          	addi	a5,a5,-1670 # 8006dc50 <log>
    800062de:	57d8                	lw	a4,44(a5)
    800062e0:	fec42783          	lw	a5,-20(s0)
    800062e4:	2781                	sext.w	a5,a5
    800062e6:	f2e7c2e3          	blt	a5,a4,8000620a <install_trans+0x14>
  }
}
    800062ea:	0001                	nop
    800062ec:	0001                	nop
    800062ee:	70e2                	ld	ra,56(sp)
    800062f0:	7442                	ld	s0,48(sp)
    800062f2:	6121                	addi	sp,sp,64
    800062f4:	8082                	ret

00000000800062f6 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    800062f6:	7179                	addi	sp,sp,-48
    800062f8:	f406                	sd	ra,40(sp)
    800062fa:	f022                	sd	s0,32(sp)
    800062fc:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800062fe:	00068797          	auipc	a5,0x68
    80006302:	95278793          	addi	a5,a5,-1710 # 8006dc50 <log>
    80006306:	579c                	lw	a5,40(a5)
    80006308:	0007871b          	sext.w	a4,a5
    8000630c:	00068797          	auipc	a5,0x68
    80006310:	94478793          	addi	a5,a5,-1724 # 8006dc50 <log>
    80006314:	4f9c                	lw	a5,24(a5)
    80006316:	2781                	sext.w	a5,a5
    80006318:	85be                	mv	a1,a5
    8000631a:	853a                	mv	a0,a4
    8000631c:	ffffe097          	auipc	ra,0xffffe
    80006320:	71e080e7          	jalr	1822(ra) # 80004a3a <bread>
    80006324:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80006328:	fe043783          	ld	a5,-32(s0)
    8000632c:	05878793          	addi	a5,a5,88
    80006330:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80006334:	fd843783          	ld	a5,-40(s0)
    80006338:	4398                	lw	a4,0(a5)
    8000633a:	00068797          	auipc	a5,0x68
    8000633e:	91678793          	addi	a5,a5,-1770 # 8006dc50 <log>
    80006342:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006344:	fe042623          	sw	zero,-20(s0)
    80006348:	a03d                	j	80006376 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    8000634a:	fd843703          	ld	a4,-40(s0)
    8000634e:	fec42783          	lw	a5,-20(s0)
    80006352:	078a                	slli	a5,a5,0x2
    80006354:	97ba                	add	a5,a5,a4
    80006356:	43d8                	lw	a4,4(a5)
    80006358:	00068697          	auipc	a3,0x68
    8000635c:	8f868693          	addi	a3,a3,-1800 # 8006dc50 <log>
    80006360:	fec42783          	lw	a5,-20(s0)
    80006364:	07a1                	addi	a5,a5,8
    80006366:	078a                	slli	a5,a5,0x2
    80006368:	97b6                	add	a5,a5,a3
    8000636a:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000636c:	fec42783          	lw	a5,-20(s0)
    80006370:	2785                	addiw	a5,a5,1
    80006372:	fef42623          	sw	a5,-20(s0)
    80006376:	00068797          	auipc	a5,0x68
    8000637a:	8da78793          	addi	a5,a5,-1830 # 8006dc50 <log>
    8000637e:	57d8                	lw	a4,44(a5)
    80006380:	fec42783          	lw	a5,-20(s0)
    80006384:	2781                	sext.w	a5,a5
    80006386:	fce7c2e3          	blt	a5,a4,8000634a <read_head+0x54>
  }
  brelse(buf);
    8000638a:	fe043503          	ld	a0,-32(s0)
    8000638e:	ffffe097          	auipc	ra,0xffffe
    80006392:	74e080e7          	jalr	1870(ra) # 80004adc <brelse>
}
    80006396:	0001                	nop
    80006398:	70a2                	ld	ra,40(sp)
    8000639a:	7402                	ld	s0,32(sp)
    8000639c:	6145                	addi	sp,sp,48
    8000639e:	8082                	ret

00000000800063a0 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    800063a0:	7179                	addi	sp,sp,-48
    800063a2:	f406                	sd	ra,40(sp)
    800063a4:	f022                	sd	s0,32(sp)
    800063a6:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800063a8:	00068797          	auipc	a5,0x68
    800063ac:	8a878793          	addi	a5,a5,-1880 # 8006dc50 <log>
    800063b0:	579c                	lw	a5,40(a5)
    800063b2:	0007871b          	sext.w	a4,a5
    800063b6:	00068797          	auipc	a5,0x68
    800063ba:	89a78793          	addi	a5,a5,-1894 # 8006dc50 <log>
    800063be:	4f9c                	lw	a5,24(a5)
    800063c0:	2781                	sext.w	a5,a5
    800063c2:	85be                	mv	a1,a5
    800063c4:	853a                	mv	a0,a4
    800063c6:	ffffe097          	auipc	ra,0xffffe
    800063ca:	674080e7          	jalr	1652(ra) # 80004a3a <bread>
    800063ce:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    800063d2:	fe043783          	ld	a5,-32(s0)
    800063d6:	05878793          	addi	a5,a5,88
    800063da:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    800063de:	00068797          	auipc	a5,0x68
    800063e2:	87278793          	addi	a5,a5,-1934 # 8006dc50 <log>
    800063e6:	57d8                	lw	a4,44(a5)
    800063e8:	fd843783          	ld	a5,-40(s0)
    800063ec:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    800063ee:	fe042623          	sw	zero,-20(s0)
    800063f2:	a03d                	j	80006420 <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    800063f4:	00068717          	auipc	a4,0x68
    800063f8:	85c70713          	addi	a4,a4,-1956 # 8006dc50 <log>
    800063fc:	fec42783          	lw	a5,-20(s0)
    80006400:	07a1                	addi	a5,a5,8
    80006402:	078a                	slli	a5,a5,0x2
    80006404:	97ba                	add	a5,a5,a4
    80006406:	4b98                	lw	a4,16(a5)
    80006408:	fd843683          	ld	a3,-40(s0)
    8000640c:	fec42783          	lw	a5,-20(s0)
    80006410:	078a                	slli	a5,a5,0x2
    80006412:	97b6                	add	a5,a5,a3
    80006414:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006416:	fec42783          	lw	a5,-20(s0)
    8000641a:	2785                	addiw	a5,a5,1
    8000641c:	fef42623          	sw	a5,-20(s0)
    80006420:	00068797          	auipc	a5,0x68
    80006424:	83078793          	addi	a5,a5,-2000 # 8006dc50 <log>
    80006428:	57d8                	lw	a4,44(a5)
    8000642a:	fec42783          	lw	a5,-20(s0)
    8000642e:	2781                	sext.w	a5,a5
    80006430:	fce7c2e3          	blt	a5,a4,800063f4 <write_head+0x54>
  }
  bwrite(buf);
    80006434:	fe043503          	ld	a0,-32(s0)
    80006438:	ffffe097          	auipc	ra,0xffffe
    8000643c:	65c080e7          	jalr	1628(ra) # 80004a94 <bwrite>
  brelse(buf);
    80006440:	fe043503          	ld	a0,-32(s0)
    80006444:	ffffe097          	auipc	ra,0xffffe
    80006448:	698080e7          	jalr	1688(ra) # 80004adc <brelse>
}
    8000644c:	0001                	nop
    8000644e:	70a2                	ld	ra,40(sp)
    80006450:	7402                	ld	s0,32(sp)
    80006452:	6145                	addi	sp,sp,48
    80006454:	8082                	ret

0000000080006456 <recover_from_log>:

static void
recover_from_log(void)
{
    80006456:	1141                	addi	sp,sp,-16
    80006458:	e406                	sd	ra,8(sp)
    8000645a:	e022                	sd	s0,0(sp)
    8000645c:	0800                	addi	s0,sp,16
  read_head();
    8000645e:	00000097          	auipc	ra,0x0
    80006462:	e98080e7          	jalr	-360(ra) # 800062f6 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006466:	4505                	li	a0,1
    80006468:	00000097          	auipc	ra,0x0
    8000646c:	d8e080e7          	jalr	-626(ra) # 800061f6 <install_trans>
  log.lh.n = 0;
    80006470:	00067797          	auipc	a5,0x67
    80006474:	7e078793          	addi	a5,a5,2016 # 8006dc50 <log>
    80006478:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    8000647c:	00000097          	auipc	ra,0x0
    80006480:	f24080e7          	jalr	-220(ra) # 800063a0 <write_head>
}
    80006484:	0001                	nop
    80006486:	60a2                	ld	ra,8(sp)
    80006488:	6402                	ld	s0,0(sp)
    8000648a:	0141                	addi	sp,sp,16
    8000648c:	8082                	ret

000000008000648e <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    8000648e:	1141                	addi	sp,sp,-16
    80006490:	e406                	sd	ra,8(sp)
    80006492:	e022                	sd	s0,0(sp)
    80006494:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80006496:	00067517          	auipc	a0,0x67
    8000649a:	7ba50513          	addi	a0,a0,1978 # 8006dc50 <log>
    8000649e:	ffffb097          	auipc	ra,0xffffb
    800064a2:	de0080e7          	jalr	-544(ra) # 8000127e <acquire>
  while(1){
    if(log.committing){
    800064a6:	00067797          	auipc	a5,0x67
    800064aa:	7aa78793          	addi	a5,a5,1962 # 8006dc50 <log>
    800064ae:	53dc                	lw	a5,36(a5)
    800064b0:	cf91                	beqz	a5,800064cc <begin_op+0x3e>
      sleep(&log, &log.lock);
    800064b2:	00067597          	auipc	a1,0x67
    800064b6:	79e58593          	addi	a1,a1,1950 # 8006dc50 <log>
    800064ba:	00067517          	auipc	a0,0x67
    800064be:	79650513          	addi	a0,a0,1942 # 8006dc50 <log>
    800064c2:	ffffd097          	auipc	ra,0xffffd
    800064c6:	080080e7          	jalr	128(ra) # 80003542 <sleep>
    800064ca:	bff1                	j	800064a6 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800064cc:	00067797          	auipc	a5,0x67
    800064d0:	78478793          	addi	a5,a5,1924 # 8006dc50 <log>
    800064d4:	57d8                	lw	a4,44(a5)
    800064d6:	00067797          	auipc	a5,0x67
    800064da:	77a78793          	addi	a5,a5,1914 # 8006dc50 <log>
    800064de:	539c                	lw	a5,32(a5)
    800064e0:	2785                	addiw	a5,a5,1
    800064e2:	2781                	sext.w	a5,a5
    800064e4:	86be                	mv	a3,a5
    800064e6:	87b6                	mv	a5,a3
    800064e8:	0027979b          	slliw	a5,a5,0x2
    800064ec:	9fb5                	addw	a5,a5,a3
    800064ee:	0017979b          	slliw	a5,a5,0x1
    800064f2:	2781                	sext.w	a5,a5
    800064f4:	9fb9                	addw	a5,a5,a4
    800064f6:	2781                	sext.w	a5,a5
    800064f8:	873e                	mv	a4,a5
    800064fa:	47f9                	li	a5,30
    800064fc:	00e7df63          	bge	a5,a4,8000651a <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    80006500:	00067597          	auipc	a1,0x67
    80006504:	75058593          	addi	a1,a1,1872 # 8006dc50 <log>
    80006508:	00067517          	auipc	a0,0x67
    8000650c:	74850513          	addi	a0,a0,1864 # 8006dc50 <log>
    80006510:	ffffd097          	auipc	ra,0xffffd
    80006514:	032080e7          	jalr	50(ra) # 80003542 <sleep>
    80006518:	b779                	j	800064a6 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    8000651a:	00067797          	auipc	a5,0x67
    8000651e:	73678793          	addi	a5,a5,1846 # 8006dc50 <log>
    80006522:	539c                	lw	a5,32(a5)
    80006524:	2785                	addiw	a5,a5,1
    80006526:	0007871b          	sext.w	a4,a5
    8000652a:	00067797          	auipc	a5,0x67
    8000652e:	72678793          	addi	a5,a5,1830 # 8006dc50 <log>
    80006532:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006534:	00067517          	auipc	a0,0x67
    80006538:	71c50513          	addi	a0,a0,1820 # 8006dc50 <log>
    8000653c:	ffffb097          	auipc	ra,0xffffb
    80006540:	da6080e7          	jalr	-602(ra) # 800012e2 <release>
      break;
    80006544:	0001                	nop
    }
  }
}
    80006546:	0001                	nop
    80006548:	60a2                	ld	ra,8(sp)
    8000654a:	6402                	ld	s0,0(sp)
    8000654c:	0141                	addi	sp,sp,16
    8000654e:	8082                	ret

0000000080006550 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    80006550:	1101                	addi	sp,sp,-32
    80006552:	ec06                	sd	ra,24(sp)
    80006554:	e822                	sd	s0,16(sp)
    80006556:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006558:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    8000655c:	00067517          	auipc	a0,0x67
    80006560:	6f450513          	addi	a0,a0,1780 # 8006dc50 <log>
    80006564:	ffffb097          	auipc	ra,0xffffb
    80006568:	d1a080e7          	jalr	-742(ra) # 8000127e <acquire>
  log.outstanding -= 1;
    8000656c:	00067797          	auipc	a5,0x67
    80006570:	6e478793          	addi	a5,a5,1764 # 8006dc50 <log>
    80006574:	539c                	lw	a5,32(a5)
    80006576:	37fd                	addiw	a5,a5,-1
    80006578:	0007871b          	sext.w	a4,a5
    8000657c:	00067797          	auipc	a5,0x67
    80006580:	6d478793          	addi	a5,a5,1748 # 8006dc50 <log>
    80006584:	d398                	sw	a4,32(a5)
  if(log.committing)
    80006586:	00067797          	auipc	a5,0x67
    8000658a:	6ca78793          	addi	a5,a5,1738 # 8006dc50 <log>
    8000658e:	53dc                	lw	a5,36(a5)
    80006590:	cb89                	beqz	a5,800065a2 <end_op+0x52>
    panic("log.committing");
    80006592:	00005517          	auipc	a0,0x5
    80006596:	f9650513          	addi	a0,a0,-106 # 8000b528 <etext+0x528>
    8000659a:	ffffa097          	auipc	ra,0xffffa
    8000659e:	6b6080e7          	jalr	1718(ra) # 80000c50 <panic>
  if(log.outstanding == 0){
    800065a2:	00067797          	auipc	a5,0x67
    800065a6:	6ae78793          	addi	a5,a5,1710 # 8006dc50 <log>
    800065aa:	539c                	lw	a5,32(a5)
    800065ac:	eb99                	bnez	a5,800065c2 <end_op+0x72>
    do_commit = 1;
    800065ae:	4785                	li	a5,1
    800065b0:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800065b4:	00067797          	auipc	a5,0x67
    800065b8:	69c78793          	addi	a5,a5,1692 # 8006dc50 <log>
    800065bc:	4705                	li	a4,1
    800065be:	d3d8                	sw	a4,36(a5)
    800065c0:	a809                	j	800065d2 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800065c2:	00067517          	auipc	a0,0x67
    800065c6:	68e50513          	addi	a0,a0,1678 # 8006dc50 <log>
    800065ca:	ffffd097          	auipc	ra,0xffffd
    800065ce:	00c080e7          	jalr	12(ra) # 800035d6 <wakeup>
  }
  release(&log.lock);
    800065d2:	00067517          	auipc	a0,0x67
    800065d6:	67e50513          	addi	a0,a0,1662 # 8006dc50 <log>
    800065da:	ffffb097          	auipc	ra,0xffffb
    800065de:	d08080e7          	jalr	-760(ra) # 800012e2 <release>

  if(do_commit){
    800065e2:	fec42783          	lw	a5,-20(s0)
    800065e6:	2781                	sext.w	a5,a5
    800065e8:	c3b9                	beqz	a5,8000662e <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    800065ea:	00000097          	auipc	ra,0x0
    800065ee:	134080e7          	jalr	308(ra) # 8000671e <commit>
    acquire(&log.lock);
    800065f2:	00067517          	auipc	a0,0x67
    800065f6:	65e50513          	addi	a0,a0,1630 # 8006dc50 <log>
    800065fa:	ffffb097          	auipc	ra,0xffffb
    800065fe:	c84080e7          	jalr	-892(ra) # 8000127e <acquire>
    log.committing = 0;
    80006602:	00067797          	auipc	a5,0x67
    80006606:	64e78793          	addi	a5,a5,1614 # 8006dc50 <log>
    8000660a:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    8000660e:	00067517          	auipc	a0,0x67
    80006612:	64250513          	addi	a0,a0,1602 # 8006dc50 <log>
    80006616:	ffffd097          	auipc	ra,0xffffd
    8000661a:	fc0080e7          	jalr	-64(ra) # 800035d6 <wakeup>
    release(&log.lock);
    8000661e:	00067517          	auipc	a0,0x67
    80006622:	63250513          	addi	a0,a0,1586 # 8006dc50 <log>
    80006626:	ffffb097          	auipc	ra,0xffffb
    8000662a:	cbc080e7          	jalr	-836(ra) # 800012e2 <release>
  }
}
    8000662e:	0001                	nop
    80006630:	60e2                	ld	ra,24(sp)
    80006632:	6442                	ld	s0,16(sp)
    80006634:	6105                	addi	sp,sp,32
    80006636:	8082                	ret

0000000080006638 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    80006638:	7179                	addi	sp,sp,-48
    8000663a:	f406                	sd	ra,40(sp)
    8000663c:	f022                	sd	s0,32(sp)
    8000663e:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006640:	fe042623          	sw	zero,-20(s0)
    80006644:	a86d                	j	800066fe <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80006646:	00067797          	auipc	a5,0x67
    8000664a:	60a78793          	addi	a5,a5,1546 # 8006dc50 <log>
    8000664e:	579c                	lw	a5,40(a5)
    80006650:	0007869b          	sext.w	a3,a5
    80006654:	00067797          	auipc	a5,0x67
    80006658:	5fc78793          	addi	a5,a5,1532 # 8006dc50 <log>
    8000665c:	4f9c                	lw	a5,24(a5)
    8000665e:	fec42703          	lw	a4,-20(s0)
    80006662:	9fb9                	addw	a5,a5,a4
    80006664:	2781                	sext.w	a5,a5
    80006666:	2785                	addiw	a5,a5,1
    80006668:	2781                	sext.w	a5,a5
    8000666a:	2781                	sext.w	a5,a5
    8000666c:	85be                	mv	a1,a5
    8000666e:	8536                	mv	a0,a3
    80006670:	ffffe097          	auipc	ra,0xffffe
    80006674:	3ca080e7          	jalr	970(ra) # 80004a3a <bread>
    80006678:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    8000667c:	00067797          	auipc	a5,0x67
    80006680:	5d478793          	addi	a5,a5,1492 # 8006dc50 <log>
    80006684:	579c                	lw	a5,40(a5)
    80006686:	0007869b          	sext.w	a3,a5
    8000668a:	00067717          	auipc	a4,0x67
    8000668e:	5c670713          	addi	a4,a4,1478 # 8006dc50 <log>
    80006692:	fec42783          	lw	a5,-20(s0)
    80006696:	07a1                	addi	a5,a5,8
    80006698:	078a                	slli	a5,a5,0x2
    8000669a:	97ba                	add	a5,a5,a4
    8000669c:	4b9c                	lw	a5,16(a5)
    8000669e:	2781                	sext.w	a5,a5
    800066a0:	85be                	mv	a1,a5
    800066a2:	8536                	mv	a0,a3
    800066a4:	ffffe097          	auipc	ra,0xffffe
    800066a8:	396080e7          	jalr	918(ra) # 80004a3a <bread>
    800066ac:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800066b0:	fe043783          	ld	a5,-32(s0)
    800066b4:	05878713          	addi	a4,a5,88
    800066b8:	fd843783          	ld	a5,-40(s0)
    800066bc:	05878793          	addi	a5,a5,88
    800066c0:	40000613          	li	a2,1024
    800066c4:	85be                	mv	a1,a5
    800066c6:	853a                	mv	a0,a4
    800066c8:	ffffb097          	auipc	ra,0xffffb
    800066cc:	e6e080e7          	jalr	-402(ra) # 80001536 <memmove>
    bwrite(to);  // write the log
    800066d0:	fe043503          	ld	a0,-32(s0)
    800066d4:	ffffe097          	auipc	ra,0xffffe
    800066d8:	3c0080e7          	jalr	960(ra) # 80004a94 <bwrite>
    brelse(from);
    800066dc:	fd843503          	ld	a0,-40(s0)
    800066e0:	ffffe097          	auipc	ra,0xffffe
    800066e4:	3fc080e7          	jalr	1020(ra) # 80004adc <brelse>
    brelse(to);
    800066e8:	fe043503          	ld	a0,-32(s0)
    800066ec:	ffffe097          	auipc	ra,0xffffe
    800066f0:	3f0080e7          	jalr	1008(ra) # 80004adc <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800066f4:	fec42783          	lw	a5,-20(s0)
    800066f8:	2785                	addiw	a5,a5,1
    800066fa:	fef42623          	sw	a5,-20(s0)
    800066fe:	00067797          	auipc	a5,0x67
    80006702:	55278793          	addi	a5,a5,1362 # 8006dc50 <log>
    80006706:	57d8                	lw	a4,44(a5)
    80006708:	fec42783          	lw	a5,-20(s0)
    8000670c:	2781                	sext.w	a5,a5
    8000670e:	f2e7cce3          	blt	a5,a4,80006646 <write_log+0xe>
  }
}
    80006712:	0001                	nop
    80006714:	0001                	nop
    80006716:	70a2                	ld	ra,40(sp)
    80006718:	7402                	ld	s0,32(sp)
    8000671a:	6145                	addi	sp,sp,48
    8000671c:	8082                	ret

000000008000671e <commit>:

static void
commit()
{
    8000671e:	1141                	addi	sp,sp,-16
    80006720:	e406                	sd	ra,8(sp)
    80006722:	e022                	sd	s0,0(sp)
    80006724:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006726:	00067797          	auipc	a5,0x67
    8000672a:	52a78793          	addi	a5,a5,1322 # 8006dc50 <log>
    8000672e:	57dc                	lw	a5,44(a5)
    80006730:	02f05963          	blez	a5,80006762 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006734:	00000097          	auipc	ra,0x0
    80006738:	f04080e7          	jalr	-252(ra) # 80006638 <write_log>
    write_head();    // Write header to disk -- the real commit
    8000673c:	00000097          	auipc	ra,0x0
    80006740:	c64080e7          	jalr	-924(ra) # 800063a0 <write_head>
    install_trans(0); // Now install writes to home locations
    80006744:	4501                	li	a0,0
    80006746:	00000097          	auipc	ra,0x0
    8000674a:	ab0080e7          	jalr	-1360(ra) # 800061f6 <install_trans>
    log.lh.n = 0;
    8000674e:	00067797          	auipc	a5,0x67
    80006752:	50278793          	addi	a5,a5,1282 # 8006dc50 <log>
    80006756:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    8000675a:	00000097          	auipc	ra,0x0
    8000675e:	c46080e7          	jalr	-954(ra) # 800063a0 <write_head>
  }
}
    80006762:	0001                	nop
    80006764:	60a2                	ld	ra,8(sp)
    80006766:	6402                	ld	s0,0(sp)
    80006768:	0141                	addi	sp,sp,16
    8000676a:	8082                	ret

000000008000676c <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    8000676c:	7179                	addi	sp,sp,-48
    8000676e:	f406                	sd	ra,40(sp)
    80006770:	f022                	sd	s0,32(sp)
    80006772:	1800                	addi	s0,sp,48
    80006774:	fca43c23          	sd	a0,-40(s0)
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006778:	00067797          	auipc	a5,0x67
    8000677c:	4d878793          	addi	a5,a5,1240 # 8006dc50 <log>
    80006780:	57dc                	lw	a5,44(a5)
    80006782:	873e                	mv	a4,a5
    80006784:	47f5                	li	a5,29
    80006786:	02e7c063          	blt	a5,a4,800067a6 <log_write+0x3a>
    8000678a:	00067797          	auipc	a5,0x67
    8000678e:	4c678793          	addi	a5,a5,1222 # 8006dc50 <log>
    80006792:	57d8                	lw	a4,44(a5)
    80006794:	00067797          	auipc	a5,0x67
    80006798:	4bc78793          	addi	a5,a5,1212 # 8006dc50 <log>
    8000679c:	4fdc                	lw	a5,28(a5)
    8000679e:	37fd                	addiw	a5,a5,-1
    800067a0:	2781                	sext.w	a5,a5
    800067a2:	00f74a63          	blt	a4,a5,800067b6 <log_write+0x4a>
    panic("too big a transaction");
    800067a6:	00005517          	auipc	a0,0x5
    800067aa:	d9250513          	addi	a0,a0,-622 # 8000b538 <etext+0x538>
    800067ae:	ffffa097          	auipc	ra,0xffffa
    800067b2:	4a2080e7          	jalr	1186(ra) # 80000c50 <panic>
  if (log.outstanding < 1)
    800067b6:	00067797          	auipc	a5,0x67
    800067ba:	49a78793          	addi	a5,a5,1178 # 8006dc50 <log>
    800067be:	539c                	lw	a5,32(a5)
    800067c0:	00f04a63          	bgtz	a5,800067d4 <log_write+0x68>
    panic("log_write outside of trans");
    800067c4:	00005517          	auipc	a0,0x5
    800067c8:	d8c50513          	addi	a0,a0,-628 # 8000b550 <etext+0x550>
    800067cc:	ffffa097          	auipc	ra,0xffffa
    800067d0:	484080e7          	jalr	1156(ra) # 80000c50 <panic>

  acquire(&log.lock);
    800067d4:	00067517          	auipc	a0,0x67
    800067d8:	47c50513          	addi	a0,a0,1148 # 8006dc50 <log>
    800067dc:	ffffb097          	auipc	ra,0xffffb
    800067e0:	aa2080e7          	jalr	-1374(ra) # 8000127e <acquire>
  for (i = 0; i < log.lh.n; i++) {
    800067e4:	fe042623          	sw	zero,-20(s0)
    800067e8:	a03d                	j	80006816 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
    800067ea:	00067717          	auipc	a4,0x67
    800067ee:	46670713          	addi	a4,a4,1126 # 8006dc50 <log>
    800067f2:	fec42783          	lw	a5,-20(s0)
    800067f6:	07a1                	addi	a5,a5,8
    800067f8:	078a                	slli	a5,a5,0x2
    800067fa:	97ba                	add	a5,a5,a4
    800067fc:	4b9c                	lw	a5,16(a5)
    800067fe:	0007871b          	sext.w	a4,a5
    80006802:	fd843783          	ld	a5,-40(s0)
    80006806:	47dc                	lw	a5,12(a5)
    80006808:	02f70263          	beq	a4,a5,8000682c <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    8000680c:	fec42783          	lw	a5,-20(s0)
    80006810:	2785                	addiw	a5,a5,1
    80006812:	fef42623          	sw	a5,-20(s0)
    80006816:	00067797          	auipc	a5,0x67
    8000681a:	43a78793          	addi	a5,a5,1082 # 8006dc50 <log>
    8000681e:	57d8                	lw	a4,44(a5)
    80006820:	fec42783          	lw	a5,-20(s0)
    80006824:	2781                	sext.w	a5,a5
    80006826:	fce7c2e3          	blt	a5,a4,800067ea <log_write+0x7e>
    8000682a:	a011                	j	8000682e <log_write+0xc2>
      break;
    8000682c:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    8000682e:	fd843783          	ld	a5,-40(s0)
    80006832:	47dc                	lw	a5,12(a5)
    80006834:	0007871b          	sext.w	a4,a5
    80006838:	00067697          	auipc	a3,0x67
    8000683c:	41868693          	addi	a3,a3,1048 # 8006dc50 <log>
    80006840:	fec42783          	lw	a5,-20(s0)
    80006844:	07a1                	addi	a5,a5,8
    80006846:	078a                	slli	a5,a5,0x2
    80006848:	97b6                	add	a5,a5,a3
    8000684a:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    8000684c:	00067797          	auipc	a5,0x67
    80006850:	40478793          	addi	a5,a5,1028 # 8006dc50 <log>
    80006854:	57d8                	lw	a4,44(a5)
    80006856:	fec42783          	lw	a5,-20(s0)
    8000685a:	2781                	sext.w	a5,a5
    8000685c:	02e79563          	bne	a5,a4,80006886 <log_write+0x11a>
    bpin(b);
    80006860:	fd843503          	ld	a0,-40(s0)
    80006864:	ffffe097          	auipc	ra,0xffffe
    80006868:	366080e7          	jalr	870(ra) # 80004bca <bpin>
    log.lh.n++;
    8000686c:	00067797          	auipc	a5,0x67
    80006870:	3e478793          	addi	a5,a5,996 # 8006dc50 <log>
    80006874:	57dc                	lw	a5,44(a5)
    80006876:	2785                	addiw	a5,a5,1
    80006878:	0007871b          	sext.w	a4,a5
    8000687c:	00067797          	auipc	a5,0x67
    80006880:	3d478793          	addi	a5,a5,980 # 8006dc50 <log>
    80006884:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006886:	00067517          	auipc	a0,0x67
    8000688a:	3ca50513          	addi	a0,a0,970 # 8006dc50 <log>
    8000688e:	ffffb097          	auipc	ra,0xffffb
    80006892:	a54080e7          	jalr	-1452(ra) # 800012e2 <release>
}
    80006896:	0001                	nop
    80006898:	70a2                	ld	ra,40(sp)
    8000689a:	7402                	ld	s0,32(sp)
    8000689c:	6145                	addi	sp,sp,48
    8000689e:	8082                	ret

00000000800068a0 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    800068a0:	1101                	addi	sp,sp,-32
    800068a2:	ec06                	sd	ra,24(sp)
    800068a4:	e822                	sd	s0,16(sp)
    800068a6:	1000                	addi	s0,sp,32
    800068a8:	fea43423          	sd	a0,-24(s0)
    800068ac:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    800068b0:	fe843783          	ld	a5,-24(s0)
    800068b4:	07a1                	addi	a5,a5,8
    800068b6:	00005597          	auipc	a1,0x5
    800068ba:	cba58593          	addi	a1,a1,-838 # 8000b570 <etext+0x570>
    800068be:	853e                	mv	a0,a5
    800068c0:	ffffb097          	auipc	ra,0xffffb
    800068c4:	98e080e7          	jalr	-1650(ra) # 8000124e <initlock>
  lk->name = name;
    800068c8:	fe843783          	ld	a5,-24(s0)
    800068cc:	fe043703          	ld	a4,-32(s0)
    800068d0:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    800068d2:	fe843783          	ld	a5,-24(s0)
    800068d6:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800068da:	fe843783          	ld	a5,-24(s0)
    800068de:	0207a423          	sw	zero,40(a5)
}
    800068e2:	0001                	nop
    800068e4:	60e2                	ld	ra,24(sp)
    800068e6:	6442                	ld	s0,16(sp)
    800068e8:	6105                	addi	sp,sp,32
    800068ea:	8082                	ret

00000000800068ec <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    800068ec:	1101                	addi	sp,sp,-32
    800068ee:	ec06                	sd	ra,24(sp)
    800068f0:	e822                	sd	s0,16(sp)
    800068f2:	1000                	addi	s0,sp,32
    800068f4:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800068f8:	fe843783          	ld	a5,-24(s0)
    800068fc:	07a1                	addi	a5,a5,8
    800068fe:	853e                	mv	a0,a5
    80006900:	ffffb097          	auipc	ra,0xffffb
    80006904:	97e080e7          	jalr	-1666(ra) # 8000127e <acquire>
  while (lk->locked) {
    80006908:	a819                	j	8000691e <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    8000690a:	fe843783          	ld	a5,-24(s0)
    8000690e:	07a1                	addi	a5,a5,8
    80006910:	85be                	mv	a1,a5
    80006912:	fe843503          	ld	a0,-24(s0)
    80006916:	ffffd097          	auipc	ra,0xffffd
    8000691a:	c2c080e7          	jalr	-980(ra) # 80003542 <sleep>
  while (lk->locked) {
    8000691e:	fe843783          	ld	a5,-24(s0)
    80006922:	439c                	lw	a5,0(a5)
    80006924:	f3fd                	bnez	a5,8000690a <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006926:	fe843783          	ld	a5,-24(s0)
    8000692a:	4705                	li	a4,1
    8000692c:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    8000692e:	ffffc097          	auipc	ra,0xffffc
    80006932:	ec8080e7          	jalr	-312(ra) # 800027f6 <myproc>
    80006936:	87aa                	mv	a5,a0
    80006938:	5f98                	lw	a4,56(a5)
    8000693a:	fe843783          	ld	a5,-24(s0)
    8000693e:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    80006940:	fe843783          	ld	a5,-24(s0)
    80006944:	07a1                	addi	a5,a5,8
    80006946:	853e                	mv	a0,a5
    80006948:	ffffb097          	auipc	ra,0xffffb
    8000694c:	99a080e7          	jalr	-1638(ra) # 800012e2 <release>
}
    80006950:	0001                	nop
    80006952:	60e2                	ld	ra,24(sp)
    80006954:	6442                	ld	s0,16(sp)
    80006956:	6105                	addi	sp,sp,32
    80006958:	8082                	ret

000000008000695a <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    8000695a:	1101                	addi	sp,sp,-32
    8000695c:	ec06                	sd	ra,24(sp)
    8000695e:	e822                	sd	s0,16(sp)
    80006960:	1000                	addi	s0,sp,32
    80006962:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006966:	fe843783          	ld	a5,-24(s0)
    8000696a:	07a1                	addi	a5,a5,8
    8000696c:	853e                	mv	a0,a5
    8000696e:	ffffb097          	auipc	ra,0xffffb
    80006972:	910080e7          	jalr	-1776(ra) # 8000127e <acquire>
  lk->locked = 0;
    80006976:	fe843783          	ld	a5,-24(s0)
    8000697a:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    8000697e:	fe843783          	ld	a5,-24(s0)
    80006982:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006986:	fe843503          	ld	a0,-24(s0)
    8000698a:	ffffd097          	auipc	ra,0xffffd
    8000698e:	c4c080e7          	jalr	-948(ra) # 800035d6 <wakeup>
  release(&lk->lk);
    80006992:	fe843783          	ld	a5,-24(s0)
    80006996:	07a1                	addi	a5,a5,8
    80006998:	853e                	mv	a0,a5
    8000699a:	ffffb097          	auipc	ra,0xffffb
    8000699e:	948080e7          	jalr	-1720(ra) # 800012e2 <release>
}
    800069a2:	0001                	nop
    800069a4:	60e2                	ld	ra,24(sp)
    800069a6:	6442                	ld	s0,16(sp)
    800069a8:	6105                	addi	sp,sp,32
    800069aa:	8082                	ret

00000000800069ac <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    800069ac:	7139                	addi	sp,sp,-64
    800069ae:	fc06                	sd	ra,56(sp)
    800069b0:	f822                	sd	s0,48(sp)
    800069b2:	f426                	sd	s1,40(sp)
    800069b4:	0080                	addi	s0,sp,64
    800069b6:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    800069ba:	fc843783          	ld	a5,-56(s0)
    800069be:	07a1                	addi	a5,a5,8
    800069c0:	853e                	mv	a0,a5
    800069c2:	ffffb097          	auipc	ra,0xffffb
    800069c6:	8bc080e7          	jalr	-1860(ra) # 8000127e <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    800069ca:	fc843783          	ld	a5,-56(s0)
    800069ce:	439c                	lw	a5,0(a5)
    800069d0:	cf99                	beqz	a5,800069ee <holdingsleep+0x42>
    800069d2:	fc843783          	ld	a5,-56(s0)
    800069d6:	5784                	lw	s1,40(a5)
    800069d8:	ffffc097          	auipc	ra,0xffffc
    800069dc:	e1e080e7          	jalr	-482(ra) # 800027f6 <myproc>
    800069e0:	87aa                	mv	a5,a0
    800069e2:	5f9c                	lw	a5,56(a5)
    800069e4:	8726                	mv	a4,s1
    800069e6:	00f71463          	bne	a4,a5,800069ee <holdingsleep+0x42>
    800069ea:	4785                	li	a5,1
    800069ec:	a011                	j	800069f0 <holdingsleep+0x44>
    800069ee:	4781                	li	a5,0
    800069f0:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    800069f4:	fc843783          	ld	a5,-56(s0)
    800069f8:	07a1                	addi	a5,a5,8
    800069fa:	853e                	mv	a0,a5
    800069fc:	ffffb097          	auipc	ra,0xffffb
    80006a00:	8e6080e7          	jalr	-1818(ra) # 800012e2 <release>
  return r;
    80006a04:	fdc42783          	lw	a5,-36(s0)
}
    80006a08:	853e                	mv	a0,a5
    80006a0a:	70e2                	ld	ra,56(sp)
    80006a0c:	7442                	ld	s0,48(sp)
    80006a0e:	74a2                	ld	s1,40(sp)
    80006a10:	6121                	addi	sp,sp,64
    80006a12:	8082                	ret

0000000080006a14 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006a14:	1141                	addi	sp,sp,-16
    80006a16:	e406                	sd	ra,8(sp)
    80006a18:	e022                	sd	s0,0(sp)
    80006a1a:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006a1c:	00005597          	auipc	a1,0x5
    80006a20:	b6458593          	addi	a1,a1,-1180 # 8000b580 <etext+0x580>
    80006a24:	00067517          	auipc	a0,0x67
    80006a28:	37450513          	addi	a0,a0,884 # 8006dd98 <ftable>
    80006a2c:	ffffb097          	auipc	ra,0xffffb
    80006a30:	822080e7          	jalr	-2014(ra) # 8000124e <initlock>
}
    80006a34:	0001                	nop
    80006a36:	60a2                	ld	ra,8(sp)
    80006a38:	6402                	ld	s0,0(sp)
    80006a3a:	0141                	addi	sp,sp,16
    80006a3c:	8082                	ret

0000000080006a3e <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006a3e:	1101                	addi	sp,sp,-32
    80006a40:	ec06                	sd	ra,24(sp)
    80006a42:	e822                	sd	s0,16(sp)
    80006a44:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006a46:	00067517          	auipc	a0,0x67
    80006a4a:	35250513          	addi	a0,a0,850 # 8006dd98 <ftable>
    80006a4e:	ffffb097          	auipc	ra,0xffffb
    80006a52:	830080e7          	jalr	-2000(ra) # 8000127e <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006a56:	00067797          	auipc	a5,0x67
    80006a5a:	35a78793          	addi	a5,a5,858 # 8006ddb0 <ftable+0x18>
    80006a5e:	fef43423          	sd	a5,-24(s0)
    80006a62:	a815                	j	80006a96 <filealloc+0x58>
    if(f->ref == 0){
    80006a64:	fe843783          	ld	a5,-24(s0)
    80006a68:	43dc                	lw	a5,4(a5)
    80006a6a:	e385                	bnez	a5,80006a8a <filealloc+0x4c>
      f->ref = 1;
    80006a6c:	fe843783          	ld	a5,-24(s0)
    80006a70:	4705                	li	a4,1
    80006a72:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006a74:	00067517          	auipc	a0,0x67
    80006a78:	32450513          	addi	a0,a0,804 # 8006dd98 <ftable>
    80006a7c:	ffffb097          	auipc	ra,0xffffb
    80006a80:	866080e7          	jalr	-1946(ra) # 800012e2 <release>
      return f;
    80006a84:	fe843783          	ld	a5,-24(s0)
    80006a88:	a805                	j	80006ab8 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006a8a:	fe843783          	ld	a5,-24(s0)
    80006a8e:	02878793          	addi	a5,a5,40
    80006a92:	fef43423          	sd	a5,-24(s0)
    80006a96:	00068797          	auipc	a5,0x68
    80006a9a:	2ba78793          	addi	a5,a5,698 # 8006ed50 <ftable+0xfb8>
    80006a9e:	fe843703          	ld	a4,-24(s0)
    80006aa2:	fcf761e3          	bltu	a4,a5,80006a64 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006aa6:	00067517          	auipc	a0,0x67
    80006aaa:	2f250513          	addi	a0,a0,754 # 8006dd98 <ftable>
    80006aae:	ffffb097          	auipc	ra,0xffffb
    80006ab2:	834080e7          	jalr	-1996(ra) # 800012e2 <release>
  return 0;
    80006ab6:	4781                	li	a5,0
}
    80006ab8:	853e                	mv	a0,a5
    80006aba:	60e2                	ld	ra,24(sp)
    80006abc:	6442                	ld	s0,16(sp)
    80006abe:	6105                	addi	sp,sp,32
    80006ac0:	8082                	ret

0000000080006ac2 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006ac2:	1101                	addi	sp,sp,-32
    80006ac4:	ec06                	sd	ra,24(sp)
    80006ac6:	e822                	sd	s0,16(sp)
    80006ac8:	1000                	addi	s0,sp,32
    80006aca:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80006ace:	00067517          	auipc	a0,0x67
    80006ad2:	2ca50513          	addi	a0,a0,714 # 8006dd98 <ftable>
    80006ad6:	ffffa097          	auipc	ra,0xffffa
    80006ada:	7a8080e7          	jalr	1960(ra) # 8000127e <acquire>
  if(f->ref < 1)
    80006ade:	fe843783          	ld	a5,-24(s0)
    80006ae2:	43dc                	lw	a5,4(a5)
    80006ae4:	00f04a63          	bgtz	a5,80006af8 <filedup+0x36>
    panic("filedup");
    80006ae8:	00005517          	auipc	a0,0x5
    80006aec:	aa050513          	addi	a0,a0,-1376 # 8000b588 <etext+0x588>
    80006af0:	ffffa097          	auipc	ra,0xffffa
    80006af4:	160080e7          	jalr	352(ra) # 80000c50 <panic>
  f->ref++;
    80006af8:	fe843783          	ld	a5,-24(s0)
    80006afc:	43dc                	lw	a5,4(a5)
    80006afe:	2785                	addiw	a5,a5,1
    80006b00:	0007871b          	sext.w	a4,a5
    80006b04:	fe843783          	ld	a5,-24(s0)
    80006b08:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006b0a:	00067517          	auipc	a0,0x67
    80006b0e:	28e50513          	addi	a0,a0,654 # 8006dd98 <ftable>
    80006b12:	ffffa097          	auipc	ra,0xffffa
    80006b16:	7d0080e7          	jalr	2000(ra) # 800012e2 <release>
  return f;
    80006b1a:	fe843783          	ld	a5,-24(s0)
}
    80006b1e:	853e                	mv	a0,a5
    80006b20:	60e2                	ld	ra,24(sp)
    80006b22:	6442                	ld	s0,16(sp)
    80006b24:	6105                	addi	sp,sp,32
    80006b26:	8082                	ret

0000000080006b28 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006b28:	715d                	addi	sp,sp,-80
    80006b2a:	e486                	sd	ra,72(sp)
    80006b2c:	e0a2                	sd	s0,64(sp)
    80006b2e:	0880                	addi	s0,sp,80
    80006b30:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006b34:	00067517          	auipc	a0,0x67
    80006b38:	26450513          	addi	a0,a0,612 # 8006dd98 <ftable>
    80006b3c:	ffffa097          	auipc	ra,0xffffa
    80006b40:	742080e7          	jalr	1858(ra) # 8000127e <acquire>
  if(f->ref < 1)
    80006b44:	fb843783          	ld	a5,-72(s0)
    80006b48:	43dc                	lw	a5,4(a5)
    80006b4a:	00f04a63          	bgtz	a5,80006b5e <fileclose+0x36>
    panic("fileclose");
    80006b4e:	00005517          	auipc	a0,0x5
    80006b52:	a4250513          	addi	a0,a0,-1470 # 8000b590 <etext+0x590>
    80006b56:	ffffa097          	auipc	ra,0xffffa
    80006b5a:	0fa080e7          	jalr	250(ra) # 80000c50 <panic>
  if(--f->ref > 0){
    80006b5e:	fb843783          	ld	a5,-72(s0)
    80006b62:	43dc                	lw	a5,4(a5)
    80006b64:	37fd                	addiw	a5,a5,-1
    80006b66:	0007871b          	sext.w	a4,a5
    80006b6a:	fb843783          	ld	a5,-72(s0)
    80006b6e:	c3d8                	sw	a4,4(a5)
    80006b70:	fb843783          	ld	a5,-72(s0)
    80006b74:	43dc                	lw	a5,4(a5)
    80006b76:	00f05b63          	blez	a5,80006b8c <fileclose+0x64>
    release(&ftable.lock);
    80006b7a:	00067517          	auipc	a0,0x67
    80006b7e:	21e50513          	addi	a0,a0,542 # 8006dd98 <ftable>
    80006b82:	ffffa097          	auipc	ra,0xffffa
    80006b86:	760080e7          	jalr	1888(ra) # 800012e2 <release>
    80006b8a:	a879                	j	80006c28 <fileclose+0x100>
    return;
  }
  ff = *f;
    80006b8c:	fb843783          	ld	a5,-72(s0)
    80006b90:	638c                	ld	a1,0(a5)
    80006b92:	6790                	ld	a2,8(a5)
    80006b94:	6b94                	ld	a3,16(a5)
    80006b96:	6f98                	ld	a4,24(a5)
    80006b98:	739c                	ld	a5,32(a5)
    80006b9a:	fcb43423          	sd	a1,-56(s0)
    80006b9e:	fcc43823          	sd	a2,-48(s0)
    80006ba2:	fcd43c23          	sd	a3,-40(s0)
    80006ba6:	fee43023          	sd	a4,-32(s0)
    80006baa:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006bae:	fb843783          	ld	a5,-72(s0)
    80006bb2:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006bb6:	fb843783          	ld	a5,-72(s0)
    80006bba:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006bbe:	00067517          	auipc	a0,0x67
    80006bc2:	1da50513          	addi	a0,a0,474 # 8006dd98 <ftable>
    80006bc6:	ffffa097          	auipc	ra,0xffffa
    80006bca:	71c080e7          	jalr	1820(ra) # 800012e2 <release>

  if(ff.type == FD_PIPE){
    80006bce:	fc842783          	lw	a5,-56(s0)
    80006bd2:	873e                	mv	a4,a5
    80006bd4:	4785                	li	a5,1
    80006bd6:	00f71e63          	bne	a4,a5,80006bf2 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006bda:	fd843783          	ld	a5,-40(s0)
    80006bde:	fd144703          	lbu	a4,-47(s0)
    80006be2:	2701                	sext.w	a4,a4
    80006be4:	85ba                	mv	a1,a4
    80006be6:	853e                	mv	a0,a5
    80006be8:	00000097          	auipc	ra,0x0
    80006bec:	5ca080e7          	jalr	1482(ra) # 800071b2 <pipeclose>
    80006bf0:	a825                	j	80006c28 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006bf2:	fc842783          	lw	a5,-56(s0)
    80006bf6:	873e                	mv	a4,a5
    80006bf8:	4789                	li	a5,2
    80006bfa:	00f70863          	beq	a4,a5,80006c0a <fileclose+0xe2>
    80006bfe:	fc842783          	lw	a5,-56(s0)
    80006c02:	873e                	mv	a4,a5
    80006c04:	478d                	li	a5,3
    80006c06:	02f71163          	bne	a4,a5,80006c28 <fileclose+0x100>
    begin_op();
    80006c0a:	00000097          	auipc	ra,0x0
    80006c0e:	884080e7          	jalr	-1916(ra) # 8000648e <begin_op>
    iput(ff.ip);
    80006c12:	fe043783          	ld	a5,-32(s0)
    80006c16:	853e                	mv	a0,a5
    80006c18:	fffff097          	auipc	ra,0xfffff
    80006c1c:	998080e7          	jalr	-1640(ra) # 800055b0 <iput>
    end_op();
    80006c20:	00000097          	auipc	ra,0x0
    80006c24:	930080e7          	jalr	-1744(ra) # 80006550 <end_op>
  }
}
    80006c28:	60a6                	ld	ra,72(sp)
    80006c2a:	6406                	ld	s0,64(sp)
    80006c2c:	6161                	addi	sp,sp,80
    80006c2e:	8082                	ret

0000000080006c30 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006c30:	7139                	addi	sp,sp,-64
    80006c32:	fc06                	sd	ra,56(sp)
    80006c34:	f822                	sd	s0,48(sp)
    80006c36:	0080                	addi	s0,sp,64
    80006c38:	fca43423          	sd	a0,-56(s0)
    80006c3c:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006c40:	ffffc097          	auipc	ra,0xffffc
    80006c44:	bb6080e7          	jalr	-1098(ra) # 800027f6 <myproc>
    80006c48:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006c4c:	fc843783          	ld	a5,-56(s0)
    80006c50:	439c                	lw	a5,0(a5)
    80006c52:	873e                	mv	a4,a5
    80006c54:	4789                	li	a5,2
    80006c56:	00f70963          	beq	a4,a5,80006c68 <filestat+0x38>
    80006c5a:	fc843783          	ld	a5,-56(s0)
    80006c5e:	439c                	lw	a5,0(a5)
    80006c60:	873e                	mv	a4,a5
    80006c62:	478d                	li	a5,3
    80006c64:	06f71563          	bne	a4,a5,80006cce <filestat+0x9e>
    ilock(f->ip);
    80006c68:	fc843783          	ld	a5,-56(s0)
    80006c6c:	6f9c                	ld	a5,24(a5)
    80006c6e:	853e                	mv	a0,a5
    80006c70:	ffffe097          	auipc	ra,0xffffe
    80006c74:	7b2080e7          	jalr	1970(ra) # 80005422 <ilock>
    stati(f->ip, &st);
    80006c78:	fc843783          	ld	a5,-56(s0)
    80006c7c:	6f9c                	ld	a5,24(a5)
    80006c7e:	fd040713          	addi	a4,s0,-48
    80006c82:	85ba                	mv	a1,a4
    80006c84:	853e                	mv	a0,a5
    80006c86:	fffff097          	auipc	ra,0xfffff
    80006c8a:	cce080e7          	jalr	-818(ra) # 80005954 <stati>
    iunlock(f->ip);
    80006c8e:	fc843783          	ld	a5,-56(s0)
    80006c92:	6f9c                	ld	a5,24(a5)
    80006c94:	853e                	mv	a0,a5
    80006c96:	fffff097          	auipc	ra,0xfffff
    80006c9a:	8c0080e7          	jalr	-1856(ra) # 80005556 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006c9e:	fe843703          	ld	a4,-24(s0)
    80006ca2:	6785                	lui	a5,0x1
    80006ca4:	97ba                	add	a5,a5,a4
    80006ca6:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    80006caa:	fd040713          	addi	a4,s0,-48
    80006cae:	46e1                	li	a3,24
    80006cb0:	863a                	mv	a2,a4
    80006cb2:	fc043583          	ld	a1,-64(s0)
    80006cb6:	853e                	mv	a0,a5
    80006cb8:	ffffb097          	auipc	ra,0xffffb
    80006cbc:	61a080e7          	jalr	1562(ra) # 800022d2 <copyout>
    80006cc0:	87aa                	mv	a5,a0
    80006cc2:	0007d463          	bgez	a5,80006cca <filestat+0x9a>
      return -1;
    80006cc6:	57fd                	li	a5,-1
    80006cc8:	a021                	j	80006cd0 <filestat+0xa0>
    return 0;
    80006cca:	4781                	li	a5,0
    80006ccc:	a011                	j	80006cd0 <filestat+0xa0>
  }
  return -1;
    80006cce:	57fd                	li	a5,-1
}
    80006cd0:	853e                	mv	a0,a5
    80006cd2:	70e2                	ld	ra,56(sp)
    80006cd4:	7442                	ld	s0,48(sp)
    80006cd6:	6121                	addi	sp,sp,64
    80006cd8:	8082                	ret

0000000080006cda <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006cda:	7139                	addi	sp,sp,-64
    80006cdc:	fc06                	sd	ra,56(sp)
    80006cde:	f822                	sd	s0,48(sp)
    80006ce0:	0080                	addi	s0,sp,64
    80006ce2:	fca43c23          	sd	a0,-40(s0)
    80006ce6:	fcb43823          	sd	a1,-48(s0)
    80006cea:	87b2                	mv	a5,a2
    80006cec:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006cf0:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006cf4:	fd843783          	ld	a5,-40(s0)
    80006cf8:	0087c783          	lbu	a5,8(a5)
    80006cfc:	e399                	bnez	a5,80006d02 <fileread+0x28>
    return -1;
    80006cfe:	57fd                	li	a5,-1
    80006d00:	aa1d                	j	80006e36 <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006d02:	fd843783          	ld	a5,-40(s0)
    80006d06:	439c                	lw	a5,0(a5)
    80006d08:	873e                	mv	a4,a5
    80006d0a:	4785                	li	a5,1
    80006d0c:	02f71363          	bne	a4,a5,80006d32 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006d10:	fd843783          	ld	a5,-40(s0)
    80006d14:	6b9c                	ld	a5,16(a5)
    80006d16:	fcc42703          	lw	a4,-52(s0)
    80006d1a:	863a                	mv	a2,a4
    80006d1c:	fd043583          	ld	a1,-48(s0)
    80006d20:	853e                	mv	a0,a5
    80006d22:	00000097          	auipc	ra,0x0
    80006d26:	686080e7          	jalr	1670(ra) # 800073a8 <piperead>
    80006d2a:	87aa                	mv	a5,a0
    80006d2c:	fef42623          	sw	a5,-20(s0)
    80006d30:	a209                	j	80006e32 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006d32:	fd843783          	ld	a5,-40(s0)
    80006d36:	439c                	lw	a5,0(a5)
    80006d38:	873e                	mv	a4,a5
    80006d3a:	478d                	li	a5,3
    80006d3c:	06f71863          	bne	a4,a5,80006dac <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006d40:	fd843783          	ld	a5,-40(s0)
    80006d44:	02479783          	lh	a5,36(a5)
    80006d48:	2781                	sext.w	a5,a5
    80006d4a:	0207c863          	bltz	a5,80006d7a <fileread+0xa0>
    80006d4e:	fd843783          	ld	a5,-40(s0)
    80006d52:	02479783          	lh	a5,36(a5)
    80006d56:	0007871b          	sext.w	a4,a5
    80006d5a:	47a5                	li	a5,9
    80006d5c:	00e7cf63          	blt	a5,a4,80006d7a <fileread+0xa0>
    80006d60:	fd843783          	ld	a5,-40(s0)
    80006d64:	02479783          	lh	a5,36(a5)
    80006d68:	2781                	sext.w	a5,a5
    80006d6a:	00067717          	auipc	a4,0x67
    80006d6e:	f8e70713          	addi	a4,a4,-114 # 8006dcf8 <devsw>
    80006d72:	0792                	slli	a5,a5,0x4
    80006d74:	97ba                	add	a5,a5,a4
    80006d76:	639c                	ld	a5,0(a5)
    80006d78:	e399                	bnez	a5,80006d7e <fileread+0xa4>
      return -1;
    80006d7a:	57fd                	li	a5,-1
    80006d7c:	a86d                	j	80006e36 <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006d7e:	fd843783          	ld	a5,-40(s0)
    80006d82:	02479783          	lh	a5,36(a5)
    80006d86:	2781                	sext.w	a5,a5
    80006d88:	00067717          	auipc	a4,0x67
    80006d8c:	f7070713          	addi	a4,a4,-144 # 8006dcf8 <devsw>
    80006d90:	0792                	slli	a5,a5,0x4
    80006d92:	97ba                	add	a5,a5,a4
    80006d94:	6398                	ld	a4,0(a5)
    80006d96:	fcc42783          	lw	a5,-52(s0)
    80006d9a:	863e                	mv	a2,a5
    80006d9c:	fd043583          	ld	a1,-48(s0)
    80006da0:	4505                	li	a0,1
    80006da2:	9702                	jalr	a4
    80006da4:	87aa                	mv	a5,a0
    80006da6:	fef42623          	sw	a5,-20(s0)
    80006daa:	a061                	j	80006e32 <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006dac:	fd843783          	ld	a5,-40(s0)
    80006db0:	439c                	lw	a5,0(a5)
    80006db2:	873e                	mv	a4,a5
    80006db4:	4789                	li	a5,2
    80006db6:	06f71663          	bne	a4,a5,80006e22 <fileread+0x148>
    ilock(f->ip);
    80006dba:	fd843783          	ld	a5,-40(s0)
    80006dbe:	6f9c                	ld	a5,24(a5)
    80006dc0:	853e                	mv	a0,a5
    80006dc2:	ffffe097          	auipc	ra,0xffffe
    80006dc6:	660080e7          	jalr	1632(ra) # 80005422 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006dca:	fd843783          	ld	a5,-40(s0)
    80006dce:	6f88                	ld	a0,24(a5)
    80006dd0:	fd843783          	ld	a5,-40(s0)
    80006dd4:	539c                	lw	a5,32(a5)
    80006dd6:	fcc42703          	lw	a4,-52(s0)
    80006dda:	86be                	mv	a3,a5
    80006ddc:	fd043603          	ld	a2,-48(s0)
    80006de0:	4585                	li	a1,1
    80006de2:	fffff097          	auipc	ra,0xfffff
    80006de6:	bd6080e7          	jalr	-1066(ra) # 800059b8 <readi>
    80006dea:	87aa                	mv	a5,a0
    80006dec:	fef42623          	sw	a5,-20(s0)
    80006df0:	fec42783          	lw	a5,-20(s0)
    80006df4:	2781                	sext.w	a5,a5
    80006df6:	00f05d63          	blez	a5,80006e10 <fileread+0x136>
      f->off += r;
    80006dfa:	fd843783          	ld	a5,-40(s0)
    80006dfe:	5398                	lw	a4,32(a5)
    80006e00:	fec42783          	lw	a5,-20(s0)
    80006e04:	9fb9                	addw	a5,a5,a4
    80006e06:	0007871b          	sext.w	a4,a5
    80006e0a:	fd843783          	ld	a5,-40(s0)
    80006e0e:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006e10:	fd843783          	ld	a5,-40(s0)
    80006e14:	6f9c                	ld	a5,24(a5)
    80006e16:	853e                	mv	a0,a5
    80006e18:	ffffe097          	auipc	ra,0xffffe
    80006e1c:	73e080e7          	jalr	1854(ra) # 80005556 <iunlock>
    80006e20:	a809                	j	80006e32 <fileread+0x158>
  } else {
    panic("fileread");
    80006e22:	00004517          	auipc	a0,0x4
    80006e26:	77e50513          	addi	a0,a0,1918 # 8000b5a0 <etext+0x5a0>
    80006e2a:	ffffa097          	auipc	ra,0xffffa
    80006e2e:	e26080e7          	jalr	-474(ra) # 80000c50 <panic>
  }

  return r;
    80006e32:	fec42783          	lw	a5,-20(s0)
}
    80006e36:	853e                	mv	a0,a5
    80006e38:	70e2                	ld	ra,56(sp)
    80006e3a:	7442                	ld	s0,48(sp)
    80006e3c:	6121                	addi	sp,sp,64
    80006e3e:	8082                	ret

0000000080006e40 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006e40:	715d                	addi	sp,sp,-80
    80006e42:	e486                	sd	ra,72(sp)
    80006e44:	e0a2                	sd	s0,64(sp)
    80006e46:	0880                	addi	s0,sp,80
    80006e48:	fca43423          	sd	a0,-56(s0)
    80006e4c:	fcb43023          	sd	a1,-64(s0)
    80006e50:	87b2                	mv	a5,a2
    80006e52:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006e56:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006e5a:	fc843783          	ld	a5,-56(s0)
    80006e5e:	0097c783          	lbu	a5,9(a5)
    80006e62:	e399                	bnez	a5,80006e68 <filewrite+0x28>
    return -1;
    80006e64:	57fd                	li	a5,-1
    80006e66:	a2fd                	j	80007054 <filewrite+0x214>

  if(f->type == FD_PIPE){
    80006e68:	fc843783          	ld	a5,-56(s0)
    80006e6c:	439c                	lw	a5,0(a5)
    80006e6e:	873e                	mv	a4,a5
    80006e70:	4785                	li	a5,1
    80006e72:	02f71363          	bne	a4,a5,80006e98 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006e76:	fc843783          	ld	a5,-56(s0)
    80006e7a:	6b9c                	ld	a5,16(a5)
    80006e7c:	fbc42703          	lw	a4,-68(s0)
    80006e80:	863a                	mv	a2,a4
    80006e82:	fc043583          	ld	a1,-64(s0)
    80006e86:	853e                	mv	a0,a5
    80006e88:	00000097          	auipc	ra,0x0
    80006e8c:	3d2080e7          	jalr	978(ra) # 8000725a <pipewrite>
    80006e90:	87aa                	mv	a5,a0
    80006e92:	fef42623          	sw	a5,-20(s0)
    80006e96:	aa6d                	j	80007050 <filewrite+0x210>
  } else if(f->type == FD_DEVICE){
    80006e98:	fc843783          	ld	a5,-56(s0)
    80006e9c:	439c                	lw	a5,0(a5)
    80006e9e:	873e                	mv	a4,a5
    80006ea0:	478d                	li	a5,3
    80006ea2:	06f71863          	bne	a4,a5,80006f12 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006ea6:	fc843783          	ld	a5,-56(s0)
    80006eaa:	02479783          	lh	a5,36(a5)
    80006eae:	2781                	sext.w	a5,a5
    80006eb0:	0207c863          	bltz	a5,80006ee0 <filewrite+0xa0>
    80006eb4:	fc843783          	ld	a5,-56(s0)
    80006eb8:	02479783          	lh	a5,36(a5)
    80006ebc:	0007871b          	sext.w	a4,a5
    80006ec0:	47a5                	li	a5,9
    80006ec2:	00e7cf63          	blt	a5,a4,80006ee0 <filewrite+0xa0>
    80006ec6:	fc843783          	ld	a5,-56(s0)
    80006eca:	02479783          	lh	a5,36(a5)
    80006ece:	2781                	sext.w	a5,a5
    80006ed0:	00067717          	auipc	a4,0x67
    80006ed4:	e2870713          	addi	a4,a4,-472 # 8006dcf8 <devsw>
    80006ed8:	0792                	slli	a5,a5,0x4
    80006eda:	97ba                	add	a5,a5,a4
    80006edc:	679c                	ld	a5,8(a5)
    80006ede:	e399                	bnez	a5,80006ee4 <filewrite+0xa4>
      return -1;
    80006ee0:	57fd                	li	a5,-1
    80006ee2:	aa8d                	j	80007054 <filewrite+0x214>
    ret = devsw[f->major].write(1, addr, n);
    80006ee4:	fc843783          	ld	a5,-56(s0)
    80006ee8:	02479783          	lh	a5,36(a5)
    80006eec:	2781                	sext.w	a5,a5
    80006eee:	00067717          	auipc	a4,0x67
    80006ef2:	e0a70713          	addi	a4,a4,-502 # 8006dcf8 <devsw>
    80006ef6:	0792                	slli	a5,a5,0x4
    80006ef8:	97ba                	add	a5,a5,a4
    80006efa:	6798                	ld	a4,8(a5)
    80006efc:	fbc42783          	lw	a5,-68(s0)
    80006f00:	863e                	mv	a2,a5
    80006f02:	fc043583          	ld	a1,-64(s0)
    80006f06:	4505                	li	a0,1
    80006f08:	9702                	jalr	a4
    80006f0a:	87aa                	mv	a5,a0
    80006f0c:	fef42623          	sw	a5,-20(s0)
    80006f10:	a281                	j	80007050 <filewrite+0x210>
  } else if(f->type == FD_INODE){
    80006f12:	fc843783          	ld	a5,-56(s0)
    80006f16:	439c                	lw	a5,0(a5)
    80006f18:	873e                	mv	a4,a5
    80006f1a:	4789                	li	a5,2
    80006f1c:	12f71263          	bne	a4,a5,80007040 <filewrite+0x200>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006f20:	6785                	lui	a5,0x1
    80006f22:	c007879b          	addiw	a5,a5,-1024
    80006f26:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006f2a:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006f2e:	a0c5                	j	8000700e <filewrite+0x1ce>
      int n1 = n - i;
    80006f30:	fbc42703          	lw	a4,-68(s0)
    80006f34:	fe842783          	lw	a5,-24(s0)
    80006f38:	40f707bb          	subw	a5,a4,a5
    80006f3c:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006f40:	fe442703          	lw	a4,-28(s0)
    80006f44:	fe042783          	lw	a5,-32(s0)
    80006f48:	2701                	sext.w	a4,a4
    80006f4a:	2781                	sext.w	a5,a5
    80006f4c:	00e7d663          	bge	a5,a4,80006f58 <filewrite+0x118>
        n1 = max;
    80006f50:	fe042783          	lw	a5,-32(s0)
    80006f54:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006f58:	fffff097          	auipc	ra,0xfffff
    80006f5c:	536080e7          	jalr	1334(ra) # 8000648e <begin_op>
      ilock(f->ip);
    80006f60:	fc843783          	ld	a5,-56(s0)
    80006f64:	6f9c                	ld	a5,24(a5)
    80006f66:	853e                	mv	a0,a5
    80006f68:	ffffe097          	auipc	ra,0xffffe
    80006f6c:	4ba080e7          	jalr	1210(ra) # 80005422 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006f70:	fc843783          	ld	a5,-56(s0)
    80006f74:	6f88                	ld	a0,24(a5)
    80006f76:	fe842703          	lw	a4,-24(s0)
    80006f7a:	fc043783          	ld	a5,-64(s0)
    80006f7e:	00f70633          	add	a2,a4,a5
    80006f82:	fc843783          	ld	a5,-56(s0)
    80006f86:	539c                	lw	a5,32(a5)
    80006f88:	fe442703          	lw	a4,-28(s0)
    80006f8c:	86be                	mv	a3,a5
    80006f8e:	4585                	li	a1,1
    80006f90:	fffff097          	auipc	ra,0xfffff
    80006f94:	bb2080e7          	jalr	-1102(ra) # 80005b42 <writei>
    80006f98:	87aa                	mv	a5,a0
    80006f9a:	fcf42e23          	sw	a5,-36(s0)
    80006f9e:	fdc42783          	lw	a5,-36(s0)
    80006fa2:	2781                	sext.w	a5,a5
    80006fa4:	00f05d63          	blez	a5,80006fbe <filewrite+0x17e>
        f->off += r;
    80006fa8:	fc843783          	ld	a5,-56(s0)
    80006fac:	5398                	lw	a4,32(a5)
    80006fae:	fdc42783          	lw	a5,-36(s0)
    80006fb2:	9fb9                	addw	a5,a5,a4
    80006fb4:	0007871b          	sext.w	a4,a5
    80006fb8:	fc843783          	ld	a5,-56(s0)
    80006fbc:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006fbe:	fc843783          	ld	a5,-56(s0)
    80006fc2:	6f9c                	ld	a5,24(a5)
    80006fc4:	853e                	mv	a0,a5
    80006fc6:	ffffe097          	auipc	ra,0xffffe
    80006fca:	590080e7          	jalr	1424(ra) # 80005556 <iunlock>
      end_op();
    80006fce:	fffff097          	auipc	ra,0xfffff
    80006fd2:	582080e7          	jalr	1410(ra) # 80006550 <end_op>

      if(r < 0)
    80006fd6:	fdc42783          	lw	a5,-36(s0)
    80006fda:	2781                	sext.w	a5,a5
    80006fdc:	0407c263          	bltz	a5,80007020 <filewrite+0x1e0>
        break;
      if(r != n1)
    80006fe0:	fdc42703          	lw	a4,-36(s0)
    80006fe4:	fe442783          	lw	a5,-28(s0)
    80006fe8:	2701                	sext.w	a4,a4
    80006fea:	2781                	sext.w	a5,a5
    80006fec:	00f70a63          	beq	a4,a5,80007000 <filewrite+0x1c0>
        panic("short filewrite");
    80006ff0:	00004517          	auipc	a0,0x4
    80006ff4:	5c050513          	addi	a0,a0,1472 # 8000b5b0 <etext+0x5b0>
    80006ff8:	ffffa097          	auipc	ra,0xffffa
    80006ffc:	c58080e7          	jalr	-936(ra) # 80000c50 <panic>
      i += r;
    80007000:	fe842703          	lw	a4,-24(s0)
    80007004:	fdc42783          	lw	a5,-36(s0)
    80007008:	9fb9                	addw	a5,a5,a4
    8000700a:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    8000700e:	fe842703          	lw	a4,-24(s0)
    80007012:	fbc42783          	lw	a5,-68(s0)
    80007016:	2701                	sext.w	a4,a4
    80007018:	2781                	sext.w	a5,a5
    8000701a:	f0f74be3          	blt	a4,a5,80006f30 <filewrite+0xf0>
    8000701e:	a011                	j	80007022 <filewrite+0x1e2>
        break;
    80007020:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80007022:	fe842703          	lw	a4,-24(s0)
    80007026:	fbc42783          	lw	a5,-68(s0)
    8000702a:	2701                	sext.w	a4,a4
    8000702c:	2781                	sext.w	a5,a5
    8000702e:	00f71563          	bne	a4,a5,80007038 <filewrite+0x1f8>
    80007032:	fbc42783          	lw	a5,-68(s0)
    80007036:	a011                	j	8000703a <filewrite+0x1fa>
    80007038:	57fd                	li	a5,-1
    8000703a:	fef42623          	sw	a5,-20(s0)
    8000703e:	a809                	j	80007050 <filewrite+0x210>
  } else {
    panic("filewrite");
    80007040:	00004517          	auipc	a0,0x4
    80007044:	58050513          	addi	a0,a0,1408 # 8000b5c0 <etext+0x5c0>
    80007048:	ffffa097          	auipc	ra,0xffffa
    8000704c:	c08080e7          	jalr	-1016(ra) # 80000c50 <panic>
  }

  return ret;
    80007050:	fec42783          	lw	a5,-20(s0)
}
    80007054:	853e                	mv	a0,a5
    80007056:	60a6                	ld	ra,72(sp)
    80007058:	6406                	ld	s0,64(sp)
    8000705a:	6161                	addi	sp,sp,80
    8000705c:	8082                	ret

000000008000705e <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    8000705e:	7179                	addi	sp,sp,-48
    80007060:	f406                	sd	ra,40(sp)
    80007062:	f022                	sd	s0,32(sp)
    80007064:	1800                	addi	s0,sp,48
    80007066:	fca43c23          	sd	a0,-40(s0)
    8000706a:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    8000706e:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80007072:	fd043783          	ld	a5,-48(s0)
    80007076:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    8000707a:	fd043783          	ld	a5,-48(s0)
    8000707e:	6398                	ld	a4,0(a5)
    80007080:	fd843783          	ld	a5,-40(s0)
    80007084:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80007086:	00000097          	auipc	ra,0x0
    8000708a:	9b8080e7          	jalr	-1608(ra) # 80006a3e <filealloc>
    8000708e:	872a                	mv	a4,a0
    80007090:	fd843783          	ld	a5,-40(s0)
    80007094:	e398                	sd	a4,0(a5)
    80007096:	fd843783          	ld	a5,-40(s0)
    8000709a:	639c                	ld	a5,0(a5)
    8000709c:	c3e9                	beqz	a5,8000715e <pipealloc+0x100>
    8000709e:	00000097          	auipc	ra,0x0
    800070a2:	9a0080e7          	jalr	-1632(ra) # 80006a3e <filealloc>
    800070a6:	872a                	mv	a4,a0
    800070a8:	fd043783          	ld	a5,-48(s0)
    800070ac:	e398                	sd	a4,0(a5)
    800070ae:	fd043783          	ld	a5,-48(s0)
    800070b2:	639c                	ld	a5,0(a5)
    800070b4:	c7cd                	beqz	a5,8000715e <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    800070b6:	ffffa097          	auipc	ra,0xffffa
    800070ba:	074080e7          	jalr	116(ra) # 8000112a <kalloc>
    800070be:	fea43423          	sd	a0,-24(s0)
    800070c2:	fe843783          	ld	a5,-24(s0)
    800070c6:	cfd1                	beqz	a5,80007162 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    800070c8:	fe843783          	ld	a5,-24(s0)
    800070cc:	4705                	li	a4,1
    800070ce:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    800070d2:	fe843783          	ld	a5,-24(s0)
    800070d6:	4705                	li	a4,1
    800070d8:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    800070dc:	fe843783          	ld	a5,-24(s0)
    800070e0:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    800070e4:	fe843783          	ld	a5,-24(s0)
    800070e8:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    800070ec:	fe843783          	ld	a5,-24(s0)
    800070f0:	00004597          	auipc	a1,0x4
    800070f4:	4e058593          	addi	a1,a1,1248 # 8000b5d0 <etext+0x5d0>
    800070f8:	853e                	mv	a0,a5
    800070fa:	ffffa097          	auipc	ra,0xffffa
    800070fe:	154080e7          	jalr	340(ra) # 8000124e <initlock>
  (*f0)->type = FD_PIPE;
    80007102:	fd843783          	ld	a5,-40(s0)
    80007106:	639c                	ld	a5,0(a5)
    80007108:	4705                	li	a4,1
    8000710a:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    8000710c:	fd843783          	ld	a5,-40(s0)
    80007110:	639c                	ld	a5,0(a5)
    80007112:	4705                	li	a4,1
    80007114:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80007118:	fd843783          	ld	a5,-40(s0)
    8000711c:	639c                	ld	a5,0(a5)
    8000711e:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80007122:	fd843783          	ld	a5,-40(s0)
    80007126:	639c                	ld	a5,0(a5)
    80007128:	fe843703          	ld	a4,-24(s0)
    8000712c:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    8000712e:	fd043783          	ld	a5,-48(s0)
    80007132:	639c                	ld	a5,0(a5)
    80007134:	4705                	li	a4,1
    80007136:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80007138:	fd043783          	ld	a5,-48(s0)
    8000713c:	639c                	ld	a5,0(a5)
    8000713e:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80007142:	fd043783          	ld	a5,-48(s0)
    80007146:	639c                	ld	a5,0(a5)
    80007148:	4705                	li	a4,1
    8000714a:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    8000714e:	fd043783          	ld	a5,-48(s0)
    80007152:	639c                	ld	a5,0(a5)
    80007154:	fe843703          	ld	a4,-24(s0)
    80007158:	eb98                	sd	a4,16(a5)
  return 0;
    8000715a:	4781                	li	a5,0
    8000715c:	a0b1                	j	800071a8 <pipealloc+0x14a>
    goto bad;
    8000715e:	0001                	nop
    80007160:	a011                	j	80007164 <pipealloc+0x106>
    goto bad;
    80007162:	0001                	nop

 bad:
  if(pi)
    80007164:	fe843783          	ld	a5,-24(s0)
    80007168:	c799                	beqz	a5,80007176 <pipealloc+0x118>
    kfree((char*)pi);
    8000716a:	fe843503          	ld	a0,-24(s0)
    8000716e:	ffffa097          	auipc	ra,0xffffa
    80007172:	f18080e7          	jalr	-232(ra) # 80001086 <kfree>
  if(*f0)
    80007176:	fd843783          	ld	a5,-40(s0)
    8000717a:	639c                	ld	a5,0(a5)
    8000717c:	cb89                	beqz	a5,8000718e <pipealloc+0x130>
    fileclose(*f0);
    8000717e:	fd843783          	ld	a5,-40(s0)
    80007182:	639c                	ld	a5,0(a5)
    80007184:	853e                	mv	a0,a5
    80007186:	00000097          	auipc	ra,0x0
    8000718a:	9a2080e7          	jalr	-1630(ra) # 80006b28 <fileclose>
  if(*f1)
    8000718e:	fd043783          	ld	a5,-48(s0)
    80007192:	639c                	ld	a5,0(a5)
    80007194:	cb89                	beqz	a5,800071a6 <pipealloc+0x148>
    fileclose(*f1);
    80007196:	fd043783          	ld	a5,-48(s0)
    8000719a:	639c                	ld	a5,0(a5)
    8000719c:	853e                	mv	a0,a5
    8000719e:	00000097          	auipc	ra,0x0
    800071a2:	98a080e7          	jalr	-1654(ra) # 80006b28 <fileclose>
  return -1;
    800071a6:	57fd                	li	a5,-1
}
    800071a8:	853e                	mv	a0,a5
    800071aa:	70a2                	ld	ra,40(sp)
    800071ac:	7402                	ld	s0,32(sp)
    800071ae:	6145                	addi	sp,sp,48
    800071b0:	8082                	ret

00000000800071b2 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    800071b2:	1101                	addi	sp,sp,-32
    800071b4:	ec06                	sd	ra,24(sp)
    800071b6:	e822                	sd	s0,16(sp)
    800071b8:	1000                	addi	s0,sp,32
    800071ba:	fea43423          	sd	a0,-24(s0)
    800071be:	87ae                	mv	a5,a1
    800071c0:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    800071c4:	fe843783          	ld	a5,-24(s0)
    800071c8:	853e                	mv	a0,a5
    800071ca:	ffffa097          	auipc	ra,0xffffa
    800071ce:	0b4080e7          	jalr	180(ra) # 8000127e <acquire>
  if(writable){
    800071d2:	fe442783          	lw	a5,-28(s0)
    800071d6:	2781                	sext.w	a5,a5
    800071d8:	cf99                	beqz	a5,800071f6 <pipeclose+0x44>
    pi->writeopen = 0;
    800071da:	fe843783          	ld	a5,-24(s0)
    800071de:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    800071e2:	fe843783          	ld	a5,-24(s0)
    800071e6:	21878793          	addi	a5,a5,536
    800071ea:	853e                	mv	a0,a5
    800071ec:	ffffc097          	auipc	ra,0xffffc
    800071f0:	3ea080e7          	jalr	1002(ra) # 800035d6 <wakeup>
    800071f4:	a831                	j	80007210 <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    800071f6:	fe843783          	ld	a5,-24(s0)
    800071fa:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    800071fe:	fe843783          	ld	a5,-24(s0)
    80007202:	21c78793          	addi	a5,a5,540
    80007206:	853e                	mv	a0,a5
    80007208:	ffffc097          	auipc	ra,0xffffc
    8000720c:	3ce080e7          	jalr	974(ra) # 800035d6 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80007210:	fe843783          	ld	a5,-24(s0)
    80007214:	2207a783          	lw	a5,544(a5)
    80007218:	e785                	bnez	a5,80007240 <pipeclose+0x8e>
    8000721a:	fe843783          	ld	a5,-24(s0)
    8000721e:	2247a783          	lw	a5,548(a5)
    80007222:	ef99                	bnez	a5,80007240 <pipeclose+0x8e>
    release(&pi->lock);
    80007224:	fe843783          	ld	a5,-24(s0)
    80007228:	853e                	mv	a0,a5
    8000722a:	ffffa097          	auipc	ra,0xffffa
    8000722e:	0b8080e7          	jalr	184(ra) # 800012e2 <release>
    kfree((char*)pi);
    80007232:	fe843503          	ld	a0,-24(s0)
    80007236:	ffffa097          	auipc	ra,0xffffa
    8000723a:	e50080e7          	jalr	-432(ra) # 80001086 <kfree>
    8000723e:	a809                	j	80007250 <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80007240:	fe843783          	ld	a5,-24(s0)
    80007244:	853e                	mv	a0,a5
    80007246:	ffffa097          	auipc	ra,0xffffa
    8000724a:	09c080e7          	jalr	156(ra) # 800012e2 <release>
}
    8000724e:	0001                	nop
    80007250:	0001                	nop
    80007252:	60e2                	ld	ra,24(sp)
    80007254:	6442                	ld	s0,16(sp)
    80007256:	6105                	addi	sp,sp,32
    80007258:	8082                	ret

000000008000725a <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    8000725a:	715d                	addi	sp,sp,-80
    8000725c:	e486                	sd	ra,72(sp)
    8000725e:	e0a2                	sd	s0,64(sp)
    80007260:	0880                	addi	s0,sp,80
    80007262:	fca43423          	sd	a0,-56(s0)
    80007266:	fcb43023          	sd	a1,-64(s0)
    8000726a:	87b2                	mv	a5,a2
    8000726c:	faf42e23          	sw	a5,-68(s0)
  int i;
  char ch;
  struct proc *pr = myproc();
    80007270:	ffffb097          	auipc	ra,0xffffb
    80007274:	586080e7          	jalr	1414(ra) # 800027f6 <myproc>
    80007278:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    8000727c:	fc843783          	ld	a5,-56(s0)
    80007280:	853e                	mv	a0,a5
    80007282:	ffffa097          	auipc	ra,0xffffa
    80007286:	ffc080e7          	jalr	-4(ra) # 8000127e <acquire>
  for(i = 0; i < n; i++){
    8000728a:	fe042623          	sw	zero,-20(s0)
    8000728e:	a8e1                	j	80007366 <pipewrite+0x10c>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
    80007290:	fc843783          	ld	a5,-56(s0)
    80007294:	2207a783          	lw	a5,544(a5)
    80007298:	c789                	beqz	a5,800072a2 <pipewrite+0x48>
    8000729a:	fe043783          	ld	a5,-32(s0)
    8000729e:	5b9c                	lw	a5,48(a5)
    800072a0:	cb91                	beqz	a5,800072b4 <pipewrite+0x5a>
        release(&pi->lock);
    800072a2:	fc843783          	ld	a5,-56(s0)
    800072a6:	853e                	mv	a0,a5
    800072a8:	ffffa097          	auipc	ra,0xffffa
    800072ac:	03a080e7          	jalr	58(ra) # 800012e2 <release>
        return -1;
    800072b0:	57fd                	li	a5,-1
    800072b2:	a0f5                	j	8000739e <pipewrite+0x144>
      }
      wakeup(&pi->nread);
    800072b4:	fc843783          	ld	a5,-56(s0)
    800072b8:	21878793          	addi	a5,a5,536
    800072bc:	853e                	mv	a0,a5
    800072be:	ffffc097          	auipc	ra,0xffffc
    800072c2:	318080e7          	jalr	792(ra) # 800035d6 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    800072c6:	fc843783          	ld	a5,-56(s0)
    800072ca:	21c78793          	addi	a5,a5,540
    800072ce:	fc843703          	ld	a4,-56(s0)
    800072d2:	85ba                	mv	a1,a4
    800072d4:	853e                	mv	a0,a5
    800072d6:	ffffc097          	auipc	ra,0xffffc
    800072da:	26c080e7          	jalr	620(ra) # 80003542 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    800072de:	fc843783          	ld	a5,-56(s0)
    800072e2:	21c7a703          	lw	a4,540(a5)
    800072e6:	fc843783          	ld	a5,-56(s0)
    800072ea:	2187a783          	lw	a5,536(a5)
    800072ee:	2007879b          	addiw	a5,a5,512
    800072f2:	2781                	sext.w	a5,a5
    800072f4:	f8f70ee3          	beq	a4,a5,80007290 <pipewrite+0x36>
    }
    if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    800072f8:	fe043703          	ld	a4,-32(s0)
    800072fc:	6785                	lui	a5,0x1
    800072fe:	97ba                	add	a5,a5,a4
    80007300:	2b87b503          	ld	a0,696(a5) # 12b8 <_entry-0x7fffed48>
    80007304:	fec42703          	lw	a4,-20(s0)
    80007308:	fc043783          	ld	a5,-64(s0)
    8000730c:	973e                	add	a4,a4,a5
    8000730e:	fdf40793          	addi	a5,s0,-33
    80007312:	4685                	li	a3,1
    80007314:	863a                	mv	a2,a4
    80007316:	85be                	mv	a1,a5
    80007318:	ffffb097          	auipc	ra,0xffffb
    8000731c:	088080e7          	jalr	136(ra) # 800023a0 <copyin>
    80007320:	87aa                	mv	a5,a0
    80007322:	873e                	mv	a4,a5
    80007324:	57fd                	li	a5,-1
    80007326:	04f70963          	beq	a4,a5,80007378 <pipewrite+0x11e>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8000732a:	fc843783          	ld	a5,-56(s0)
    8000732e:	21c7a783          	lw	a5,540(a5)
    80007332:	2781                	sext.w	a5,a5
    80007334:	0017871b          	addiw	a4,a5,1
    80007338:	0007069b          	sext.w	a3,a4
    8000733c:	fc843703          	ld	a4,-56(s0)
    80007340:	20d72e23          	sw	a3,540(a4)
    80007344:	1ff7f793          	andi	a5,a5,511
    80007348:	2781                	sext.w	a5,a5
    8000734a:	fdf44703          	lbu	a4,-33(s0)
    8000734e:	fc843683          	ld	a3,-56(s0)
    80007352:	1782                	slli	a5,a5,0x20
    80007354:	9381                	srli	a5,a5,0x20
    80007356:	97b6                	add	a5,a5,a3
    80007358:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    8000735c:	fec42783          	lw	a5,-20(s0)
    80007360:	2785                	addiw	a5,a5,1
    80007362:	fef42623          	sw	a5,-20(s0)
    80007366:	fec42703          	lw	a4,-20(s0)
    8000736a:	fbc42783          	lw	a5,-68(s0)
    8000736e:	2701                	sext.w	a4,a4
    80007370:	2781                	sext.w	a5,a5
    80007372:	f6f746e3          	blt	a4,a5,800072de <pipewrite+0x84>
    80007376:	a011                	j	8000737a <pipewrite+0x120>
      break;
    80007378:	0001                	nop
  }
  wakeup(&pi->nread);
    8000737a:	fc843783          	ld	a5,-56(s0)
    8000737e:	21878793          	addi	a5,a5,536
    80007382:	853e                	mv	a0,a5
    80007384:	ffffc097          	auipc	ra,0xffffc
    80007388:	252080e7          	jalr	594(ra) # 800035d6 <wakeup>
  release(&pi->lock);
    8000738c:	fc843783          	ld	a5,-56(s0)
    80007390:	853e                	mv	a0,a5
    80007392:	ffffa097          	auipc	ra,0xffffa
    80007396:	f50080e7          	jalr	-176(ra) # 800012e2 <release>
  return i;
    8000739a:	fec42783          	lw	a5,-20(s0)
}
    8000739e:	853e                	mv	a0,a5
    800073a0:	60a6                	ld	ra,72(sp)
    800073a2:	6406                	ld	s0,64(sp)
    800073a4:	6161                	addi	sp,sp,80
    800073a6:	8082                	ret

00000000800073a8 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    800073a8:	715d                	addi	sp,sp,-80
    800073aa:	e486                	sd	ra,72(sp)
    800073ac:	e0a2                	sd	s0,64(sp)
    800073ae:	0880                	addi	s0,sp,80
    800073b0:	fca43423          	sd	a0,-56(s0)
    800073b4:	fcb43023          	sd	a1,-64(s0)
    800073b8:	87b2                	mv	a5,a2
    800073ba:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    800073be:	ffffb097          	auipc	ra,0xffffb
    800073c2:	438080e7          	jalr	1080(ra) # 800027f6 <myproc>
    800073c6:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    800073ca:	fc843783          	ld	a5,-56(s0)
    800073ce:	853e                	mv	a0,a5
    800073d0:	ffffa097          	auipc	ra,0xffffa
    800073d4:	eae080e7          	jalr	-338(ra) # 8000127e <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800073d8:	a815                	j	8000740c <piperead+0x64>
    if(pr->killed){
    800073da:	fe043783          	ld	a5,-32(s0)
    800073de:	5b9c                	lw	a5,48(a5)
    800073e0:	cb91                	beqz	a5,800073f4 <piperead+0x4c>
      release(&pi->lock);
    800073e2:	fc843783          	ld	a5,-56(s0)
    800073e6:	853e                	mv	a0,a5
    800073e8:	ffffa097          	auipc	ra,0xffffa
    800073ec:	efa080e7          	jalr	-262(ra) # 800012e2 <release>
      return -1;
    800073f0:	57fd                	li	a5,-1
    800073f2:	a8f5                	j	800074ee <piperead+0x146>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    800073f4:	fc843783          	ld	a5,-56(s0)
    800073f8:	21878793          	addi	a5,a5,536
    800073fc:	fc843703          	ld	a4,-56(s0)
    80007400:	85ba                	mv	a1,a4
    80007402:	853e                	mv	a0,a5
    80007404:	ffffc097          	auipc	ra,0xffffc
    80007408:	13e080e7          	jalr	318(ra) # 80003542 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000740c:	fc843783          	ld	a5,-56(s0)
    80007410:	2187a703          	lw	a4,536(a5)
    80007414:	fc843783          	ld	a5,-56(s0)
    80007418:	21c7a783          	lw	a5,540(a5)
    8000741c:	00f71763          	bne	a4,a5,8000742a <piperead+0x82>
    80007420:	fc843783          	ld	a5,-56(s0)
    80007424:	2247a783          	lw	a5,548(a5)
    80007428:	fbcd                	bnez	a5,800073da <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000742a:	fe042623          	sw	zero,-20(s0)
    8000742e:	a051                	j	800074b2 <piperead+0x10a>
    if(pi->nread == pi->nwrite)
    80007430:	fc843783          	ld	a5,-56(s0)
    80007434:	2187a703          	lw	a4,536(a5)
    80007438:	fc843783          	ld	a5,-56(s0)
    8000743c:	21c7a783          	lw	a5,540(a5)
    80007440:	08f70263          	beq	a4,a5,800074c4 <piperead+0x11c>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    80007444:	fc843783          	ld	a5,-56(s0)
    80007448:	2187a783          	lw	a5,536(a5)
    8000744c:	2781                	sext.w	a5,a5
    8000744e:	0017871b          	addiw	a4,a5,1
    80007452:	0007069b          	sext.w	a3,a4
    80007456:	fc843703          	ld	a4,-56(s0)
    8000745a:	20d72c23          	sw	a3,536(a4)
    8000745e:	1ff7f793          	andi	a5,a5,511
    80007462:	2781                	sext.w	a5,a5
    80007464:	fc843703          	ld	a4,-56(s0)
    80007468:	1782                	slli	a5,a5,0x20
    8000746a:	9381                	srli	a5,a5,0x20
    8000746c:	97ba                	add	a5,a5,a4
    8000746e:	0187c783          	lbu	a5,24(a5)
    80007472:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    80007476:	fe043703          	ld	a4,-32(s0)
    8000747a:	6785                	lui	a5,0x1
    8000747c:	97ba                	add	a5,a5,a4
    8000747e:	2b87b503          	ld	a0,696(a5) # 12b8 <_entry-0x7fffed48>
    80007482:	fec42703          	lw	a4,-20(s0)
    80007486:	fc043783          	ld	a5,-64(s0)
    8000748a:	97ba                	add	a5,a5,a4
    8000748c:	fdf40713          	addi	a4,s0,-33
    80007490:	4685                	li	a3,1
    80007492:	863a                	mv	a2,a4
    80007494:	85be                	mv	a1,a5
    80007496:	ffffb097          	auipc	ra,0xffffb
    8000749a:	e3c080e7          	jalr	-452(ra) # 800022d2 <copyout>
    8000749e:	87aa                	mv	a5,a0
    800074a0:	873e                	mv	a4,a5
    800074a2:	57fd                	li	a5,-1
    800074a4:	02f70263          	beq	a4,a5,800074c8 <piperead+0x120>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800074a8:	fec42783          	lw	a5,-20(s0)
    800074ac:	2785                	addiw	a5,a5,1
    800074ae:	fef42623          	sw	a5,-20(s0)
    800074b2:	fec42703          	lw	a4,-20(s0)
    800074b6:	fbc42783          	lw	a5,-68(s0)
    800074ba:	2701                	sext.w	a4,a4
    800074bc:	2781                	sext.w	a5,a5
    800074be:	f6f749e3          	blt	a4,a5,80007430 <piperead+0x88>
    800074c2:	a021                	j	800074ca <piperead+0x122>
      break;
    800074c4:	0001                	nop
    800074c6:	a011                	j	800074ca <piperead+0x122>
      break;
    800074c8:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800074ca:	fc843783          	ld	a5,-56(s0)
    800074ce:	21c78793          	addi	a5,a5,540
    800074d2:	853e                	mv	a0,a5
    800074d4:	ffffc097          	auipc	ra,0xffffc
    800074d8:	102080e7          	jalr	258(ra) # 800035d6 <wakeup>
  release(&pi->lock);
    800074dc:	fc843783          	ld	a5,-56(s0)
    800074e0:	853e                	mv	a0,a5
    800074e2:	ffffa097          	auipc	ra,0xffffa
    800074e6:	e00080e7          	jalr	-512(ra) # 800012e2 <release>
  return i;
    800074ea:	fec42783          	lw	a5,-20(s0)
}
    800074ee:	853e                	mv	a0,a5
    800074f0:	60a6                	ld	ra,72(sp)
    800074f2:	6406                	ld	s0,64(sp)
    800074f4:	6161                	addi	sp,sp,80
    800074f6:	8082                	ret

00000000800074f8 <exec>:

static int loadseg(pde_t *pgdir, uint64 addr, struct inode *ip, uint offset, uint sz);

int
exec(char *path, char **argv)
{
    800074f8:	de010113          	addi	sp,sp,-544
    800074fc:	20113c23          	sd	ra,536(sp)
    80007500:	20813823          	sd	s0,528(sp)
    80007504:	20913423          	sd	s1,520(sp)
    80007508:	1400                	addi	s0,sp,544
    8000750a:	dea43423          	sd	a0,-536(s0)
    8000750e:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80007512:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007516:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    8000751a:	ffffb097          	auipc	ra,0xffffb
    8000751e:	2dc080e7          	jalr	732(ra) # 800027f6 <myproc>
    80007522:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007526:	fffff097          	auipc	ra,0xfffff
    8000752a:	f68080e7          	jalr	-152(ra) # 8000648e <begin_op>

  if((ip = namei(path)) == 0){
    8000752e:	de843503          	ld	a0,-536(s0)
    80007532:	fffff097          	auipc	ra,0xfffff
    80007536:	bf8080e7          	jalr	-1032(ra) # 8000612a <namei>
    8000753a:	faa43423          	sd	a0,-88(s0)
    8000753e:	fa843783          	ld	a5,-88(s0)
    80007542:	e799                	bnez	a5,80007550 <exec+0x58>
    end_op();
    80007544:	fffff097          	auipc	ra,0xfffff
    80007548:	00c080e7          	jalr	12(ra) # 80006550 <end_op>
    return -1;
    8000754c:	57fd                	li	a5,-1
    8000754e:	a185                	j	800079ae <exec+0x4b6>
  }
  ilock(ip);
    80007550:	fa843503          	ld	a0,-88(s0)
    80007554:	ffffe097          	auipc	ra,0xffffe
    80007558:	ece080e7          	jalr	-306(ra) # 80005422 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    8000755c:	e2840793          	addi	a5,s0,-472
    80007560:	04000713          	li	a4,64
    80007564:	4681                	li	a3,0
    80007566:	863e                	mv	a2,a5
    80007568:	4581                	li	a1,0
    8000756a:	fa843503          	ld	a0,-88(s0)
    8000756e:	ffffe097          	auipc	ra,0xffffe
    80007572:	44a080e7          	jalr	1098(ra) # 800059b8 <readi>
    80007576:	87aa                	mv	a5,a0
    80007578:	873e                	mv	a4,a5
    8000757a:	04000793          	li	a5,64
    8000757e:	3cf71263          	bne	a4,a5,80007942 <exec+0x44a>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80007582:	e2842783          	lw	a5,-472(s0)
    80007586:	873e                	mv	a4,a5
    80007588:	464c47b7          	lui	a5,0x464c4
    8000758c:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    80007590:	3af71b63          	bne	a4,a5,80007946 <exec+0x44e>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    80007594:	f9843503          	ld	a0,-104(s0)
    80007598:	ffffb097          	auipc	ra,0xffffb
    8000759c:	576080e7          	jalr	1398(ra) # 80002b0e <proc_pagetable>
    800075a0:	faa43023          	sd	a0,-96(s0)
    800075a4:	fa043783          	ld	a5,-96(s0)
    800075a8:	3a078163          	beqz	a5,8000794a <exec+0x452>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800075ac:	fc042623          	sw	zero,-52(s0)
    800075b0:	e4843783          	ld	a5,-440(s0)
    800075b4:	fcf42423          	sw	a5,-56(s0)
    800075b8:	a8e1                	j	80007690 <exec+0x198>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    800075ba:	df040793          	addi	a5,s0,-528
    800075be:	fc842683          	lw	a3,-56(s0)
    800075c2:	03800713          	li	a4,56
    800075c6:	863e                	mv	a2,a5
    800075c8:	4581                	li	a1,0
    800075ca:	fa843503          	ld	a0,-88(s0)
    800075ce:	ffffe097          	auipc	ra,0xffffe
    800075d2:	3ea080e7          	jalr	1002(ra) # 800059b8 <readi>
    800075d6:	87aa                	mv	a5,a0
    800075d8:	873e                	mv	a4,a5
    800075da:	03800793          	li	a5,56
    800075de:	36f71863          	bne	a4,a5,8000794e <exec+0x456>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    800075e2:	df042783          	lw	a5,-528(s0)
    800075e6:	873e                	mv	a4,a5
    800075e8:	4785                	li	a5,1
    800075ea:	08f71663          	bne	a4,a5,80007676 <exec+0x17e>
      continue;
    if(ph.memsz < ph.filesz)
    800075ee:	e1843703          	ld	a4,-488(s0)
    800075f2:	e1043783          	ld	a5,-496(s0)
    800075f6:	34f76e63          	bltu	a4,a5,80007952 <exec+0x45a>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    800075fa:	e0043703          	ld	a4,-512(s0)
    800075fe:	e1843783          	ld	a5,-488(s0)
    80007602:	973e                	add	a4,a4,a5
    80007604:	e0043783          	ld	a5,-512(s0)
    80007608:	34f76763          	bltu	a4,a5,80007956 <exec+0x45e>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8000760c:	e0043703          	ld	a4,-512(s0)
    80007610:	e1843783          	ld	a5,-488(s0)
    80007614:	97ba                	add	a5,a5,a4
    80007616:	863e                	mv	a2,a5
    80007618:	fb843583          	ld	a1,-72(s0)
    8000761c:	fa043503          	ld	a0,-96(s0)
    80007620:	ffffb097          	auipc	ra,0xffffb
    80007624:	8d4080e7          	jalr	-1836(ra) # 80001ef4 <uvmalloc>
    80007628:	f6a43823          	sd	a0,-144(s0)
    8000762c:	f7043783          	ld	a5,-144(s0)
    80007630:	32078563          	beqz	a5,8000795a <exec+0x462>
      goto bad;
    sz = sz1;
    80007634:	f7043783          	ld	a5,-144(s0)
    80007638:	faf43c23          	sd	a5,-72(s0)
    if(ph.vaddr % PGSIZE != 0)
    8000763c:	e0043703          	ld	a4,-512(s0)
    80007640:	6785                	lui	a5,0x1
    80007642:	17fd                	addi	a5,a5,-1
    80007644:	8ff9                	and	a5,a5,a4
    80007646:	30079c63          	bnez	a5,8000795e <exec+0x466>
      goto bad;
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    8000764a:	e0043783          	ld	a5,-512(s0)
    8000764e:	df843703          	ld	a4,-520(s0)
    80007652:	0007069b          	sext.w	a3,a4
    80007656:	e1043703          	ld	a4,-496(s0)
    8000765a:	2701                	sext.w	a4,a4
    8000765c:	fa843603          	ld	a2,-88(s0)
    80007660:	85be                	mv	a1,a5
    80007662:	fa043503          	ld	a0,-96(s0)
    80007666:	00000097          	auipc	ra,0x0
    8000766a:	35c080e7          	jalr	860(ra) # 800079c2 <loadseg>
    8000766e:	87aa                	mv	a5,a0
    80007670:	2e07c963          	bltz	a5,80007962 <exec+0x46a>
    80007674:	a011                	j	80007678 <exec+0x180>
      continue;
    80007676:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007678:	fcc42783          	lw	a5,-52(s0)
    8000767c:	2785                	addiw	a5,a5,1
    8000767e:	fcf42623          	sw	a5,-52(s0)
    80007682:	fc842783          	lw	a5,-56(s0)
    80007686:	0387879b          	addiw	a5,a5,56
    8000768a:	2781                	sext.w	a5,a5
    8000768c:	fcf42423          	sw	a5,-56(s0)
    80007690:	e6045783          	lhu	a5,-416(s0)
    80007694:	0007871b          	sext.w	a4,a5
    80007698:	fcc42783          	lw	a5,-52(s0)
    8000769c:	2781                	sext.w	a5,a5
    8000769e:	f0e7cee3          	blt	a5,a4,800075ba <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    800076a2:	fa843503          	ld	a0,-88(s0)
    800076a6:	ffffe097          	auipc	ra,0xffffe
    800076aa:	fda080e7          	jalr	-38(ra) # 80005680 <iunlockput>
  end_op();
    800076ae:	fffff097          	auipc	ra,0xfffff
    800076b2:	ea2080e7          	jalr	-350(ra) # 80006550 <end_op>
  ip = 0;
    800076b6:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    800076ba:	ffffb097          	auipc	ra,0xffffb
    800076be:	13c080e7          	jalr	316(ra) # 800027f6 <myproc>
    800076c2:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    800076c6:	f9843703          	ld	a4,-104(s0)
    800076ca:	6785                	lui	a5,0x1
    800076cc:	97ba                	add	a5,a5,a4
    800076ce:	2b07b783          	ld	a5,688(a5) # 12b0 <_entry-0x7fffed50>
    800076d2:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    800076d6:	fb843703          	ld	a4,-72(s0)
    800076da:	6785                	lui	a5,0x1
    800076dc:	17fd                	addi	a5,a5,-1
    800076de:	973e                	add	a4,a4,a5
    800076e0:	77fd                	lui	a5,0xfffff
    800076e2:	8ff9                	and	a5,a5,a4
    800076e4:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    800076e8:	fb843703          	ld	a4,-72(s0)
    800076ec:	6789                	lui	a5,0x2
    800076ee:	97ba                	add	a5,a5,a4
    800076f0:	863e                	mv	a2,a5
    800076f2:	fb843583          	ld	a1,-72(s0)
    800076f6:	fa043503          	ld	a0,-96(s0)
    800076fa:	ffffa097          	auipc	ra,0xffffa
    800076fe:	7fa080e7          	jalr	2042(ra) # 80001ef4 <uvmalloc>
    80007702:	f8a43423          	sd	a0,-120(s0)
    80007706:	f8843783          	ld	a5,-120(s0)
    8000770a:	24078e63          	beqz	a5,80007966 <exec+0x46e>
    goto bad;
  sz = sz1;
    8000770e:	f8843783          	ld	a5,-120(s0)
    80007712:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007716:	fb843703          	ld	a4,-72(s0)
    8000771a:	77f9                	lui	a5,0xffffe
    8000771c:	97ba                	add	a5,a5,a4
    8000771e:	85be                	mv	a1,a5
    80007720:	fa043503          	ld	a0,-96(s0)
    80007724:	ffffb097          	auipc	ra,0xffffb
    80007728:	b58080e7          	jalr	-1192(ra) # 8000227c <uvmclear>
  sp = sz;
    8000772c:	fb843783          	ld	a5,-72(s0)
    80007730:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    80007734:	fb043703          	ld	a4,-80(s0)
    80007738:	77fd                	lui	a5,0xfffff
    8000773a:	97ba                	add	a5,a5,a4
    8000773c:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    80007740:	fc043023          	sd	zero,-64(s0)
    80007744:	a845                	j	800077f4 <exec+0x2fc>
    if(argc >= MAXARG)
    80007746:	fc043703          	ld	a4,-64(s0)
    8000774a:	47fd                	li	a5,31
    8000774c:	20e7ef63          	bltu	a5,a4,8000796a <exec+0x472>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    80007750:	fc043783          	ld	a5,-64(s0)
    80007754:	078e                	slli	a5,a5,0x3
    80007756:	de043703          	ld	a4,-544(s0)
    8000775a:	97ba                	add	a5,a5,a4
    8000775c:	639c                	ld	a5,0(a5)
    8000775e:	853e                	mv	a0,a5
    80007760:	ffffa097          	auipc	ra,0xffffa
    80007764:	062080e7          	jalr	98(ra) # 800017c2 <strlen>
    80007768:	87aa                	mv	a5,a0
    8000776a:	2785                	addiw	a5,a5,1
    8000776c:	2781                	sext.w	a5,a5
    8000776e:	873e                	mv	a4,a5
    80007770:	fb043783          	ld	a5,-80(s0)
    80007774:	8f99                	sub	a5,a5,a4
    80007776:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    8000777a:	fb043783          	ld	a5,-80(s0)
    8000777e:	9bc1                	andi	a5,a5,-16
    80007780:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007784:	fb043703          	ld	a4,-80(s0)
    80007788:	f8043783          	ld	a5,-128(s0)
    8000778c:	1ef76163          	bltu	a4,a5,8000796e <exec+0x476>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80007790:	fc043783          	ld	a5,-64(s0)
    80007794:	078e                	slli	a5,a5,0x3
    80007796:	de043703          	ld	a4,-544(s0)
    8000779a:	97ba                	add	a5,a5,a4
    8000779c:	6384                	ld	s1,0(a5)
    8000779e:	fc043783          	ld	a5,-64(s0)
    800077a2:	078e                	slli	a5,a5,0x3
    800077a4:	de043703          	ld	a4,-544(s0)
    800077a8:	97ba                	add	a5,a5,a4
    800077aa:	639c                	ld	a5,0(a5)
    800077ac:	853e                	mv	a0,a5
    800077ae:	ffffa097          	auipc	ra,0xffffa
    800077b2:	014080e7          	jalr	20(ra) # 800017c2 <strlen>
    800077b6:	87aa                	mv	a5,a0
    800077b8:	2785                	addiw	a5,a5,1
    800077ba:	2781                	sext.w	a5,a5
    800077bc:	86be                	mv	a3,a5
    800077be:	8626                	mv	a2,s1
    800077c0:	fb043583          	ld	a1,-80(s0)
    800077c4:	fa043503          	ld	a0,-96(s0)
    800077c8:	ffffb097          	auipc	ra,0xffffb
    800077cc:	b0a080e7          	jalr	-1270(ra) # 800022d2 <copyout>
    800077d0:	87aa                	mv	a5,a0
    800077d2:	1a07c063          	bltz	a5,80007972 <exec+0x47a>
      goto bad;
    ustack[argc] = sp;
    800077d6:	fc043783          	ld	a5,-64(s0)
    800077da:	078e                	slli	a5,a5,0x3
    800077dc:	fe040713          	addi	a4,s0,-32
    800077e0:	97ba                	add	a5,a5,a4
    800077e2:	fb043703          	ld	a4,-80(s0)
    800077e6:	e8e7b423          	sd	a4,-376(a5) # ffffffffffffee88 <end+0xffffffff7ff8ce88>
  for(argc = 0; argv[argc]; argc++) {
    800077ea:	fc043783          	ld	a5,-64(s0)
    800077ee:	0785                	addi	a5,a5,1
    800077f0:	fcf43023          	sd	a5,-64(s0)
    800077f4:	fc043783          	ld	a5,-64(s0)
    800077f8:	078e                	slli	a5,a5,0x3
    800077fa:	de043703          	ld	a4,-544(s0)
    800077fe:	97ba                	add	a5,a5,a4
    80007800:	639c                	ld	a5,0(a5)
    80007802:	f3b1                	bnez	a5,80007746 <exec+0x24e>
  }
  ustack[argc] = 0;
    80007804:	fc043783          	ld	a5,-64(s0)
    80007808:	078e                	slli	a5,a5,0x3
    8000780a:	fe040713          	addi	a4,s0,-32
    8000780e:	97ba                	add	a5,a5,a4
    80007810:	e807b423          	sd	zero,-376(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007814:	fc043783          	ld	a5,-64(s0)
    80007818:	0785                	addi	a5,a5,1
    8000781a:	078e                	slli	a5,a5,0x3
    8000781c:	fb043703          	ld	a4,-80(s0)
    80007820:	40f707b3          	sub	a5,a4,a5
    80007824:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007828:	fb043783          	ld	a5,-80(s0)
    8000782c:	9bc1                	andi	a5,a5,-16
    8000782e:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007832:	fb043703          	ld	a4,-80(s0)
    80007836:	f8043783          	ld	a5,-128(s0)
    8000783a:	12f76e63          	bltu	a4,a5,80007976 <exec+0x47e>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    8000783e:	fc043783          	ld	a5,-64(s0)
    80007842:	0785                	addi	a5,a5,1
    80007844:	00379713          	slli	a4,a5,0x3
    80007848:	e6840793          	addi	a5,s0,-408
    8000784c:	86ba                	mv	a3,a4
    8000784e:	863e                	mv	a2,a5
    80007850:	fb043583          	ld	a1,-80(s0)
    80007854:	fa043503          	ld	a0,-96(s0)
    80007858:	ffffb097          	auipc	ra,0xffffb
    8000785c:	a7a080e7          	jalr	-1414(ra) # 800022d2 <copyout>
    80007860:	87aa                	mv	a5,a0
    80007862:	1007cc63          	bltz	a5,8000797a <exec+0x482>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    80007866:	f9843703          	ld	a4,-104(s0)
    8000786a:	6785                	lui	a5,0x1
    8000786c:	97ba                	add	a5,a5,a4
    8000786e:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80007872:	fb043703          	ld	a4,-80(s0)
    80007876:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    80007878:	de843783          	ld	a5,-536(s0)
    8000787c:	fcf43c23          	sd	a5,-40(s0)
    80007880:	fd843783          	ld	a5,-40(s0)
    80007884:	fcf43823          	sd	a5,-48(s0)
    80007888:	a025                	j	800078b0 <exec+0x3b8>
    if(*s == '/')
    8000788a:	fd843783          	ld	a5,-40(s0)
    8000788e:	0007c783          	lbu	a5,0(a5)
    80007892:	873e                	mv	a4,a5
    80007894:	02f00793          	li	a5,47
    80007898:	00f71763          	bne	a4,a5,800078a6 <exec+0x3ae>
      last = s+1;
    8000789c:	fd843783          	ld	a5,-40(s0)
    800078a0:	0785                	addi	a5,a5,1
    800078a2:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    800078a6:	fd843783          	ld	a5,-40(s0)
    800078aa:	0785                	addi	a5,a5,1
    800078ac:	fcf43c23          	sd	a5,-40(s0)
    800078b0:	fd843783          	ld	a5,-40(s0)
    800078b4:	0007c783          	lbu	a5,0(a5)
    800078b8:	fbe9                	bnez	a5,8000788a <exec+0x392>
  safestrcpy(p->name, last, sizeof(p->name));
    800078ba:	f9843703          	ld	a4,-104(s0)
    800078be:	6785                	lui	a5,0x1
    800078c0:	3c078793          	addi	a5,a5,960 # 13c0 <_entry-0x7fffec40>
    800078c4:	97ba                	add	a5,a5,a4
    800078c6:	4641                	li	a2,16
    800078c8:	fd043583          	ld	a1,-48(s0)
    800078cc:	853e                	mv	a0,a5
    800078ce:	ffffa097          	auipc	ra,0xffffa
    800078d2:	e7a080e7          	jalr	-390(ra) # 80001748 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    800078d6:	f9843703          	ld	a4,-104(s0)
    800078da:	6785                	lui	a5,0x1
    800078dc:	97ba                	add	a5,a5,a4
    800078de:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    800078e2:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    800078e6:	f9843703          	ld	a4,-104(s0)
    800078ea:	6785                	lui	a5,0x1
    800078ec:	97ba                	add	a5,a5,a4
    800078ee:	fa043703          	ld	a4,-96(s0)
    800078f2:	2ae7bc23          	sd	a4,696(a5) # 12b8 <_entry-0x7fffed48>
  p->sz = sz;
    800078f6:	f9843703          	ld	a4,-104(s0)
    800078fa:	6785                	lui	a5,0x1
    800078fc:	97ba                	add	a5,a5,a4
    800078fe:	fb843703          	ld	a4,-72(s0)
    80007902:	2ae7b823          	sd	a4,688(a5) # 12b0 <_entry-0x7fffed50>
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007906:	f9843703          	ld	a4,-104(s0)
    8000790a:	6785                	lui	a5,0x1
    8000790c:	97ba                	add	a5,a5,a4
    8000790e:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80007912:	e4043703          	ld	a4,-448(s0)
    80007916:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007918:	f9843703          	ld	a4,-104(s0)
    8000791c:	6785                	lui	a5,0x1
    8000791e:	97ba                	add	a5,a5,a4
    80007920:	2c07b783          	ld	a5,704(a5) # 12c0 <_entry-0x7fffed40>
    80007924:	fb043703          	ld	a4,-80(s0)
    80007928:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    8000792a:	f9043583          	ld	a1,-112(s0)
    8000792e:	f7843503          	ld	a0,-136(s0)
    80007932:	ffffb097          	auipc	ra,0xffffb
    80007936:	2a2080e7          	jalr	674(ra) # 80002bd4 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8000793a:	fc043783          	ld	a5,-64(s0)
    8000793e:	2781                	sext.w	a5,a5
    80007940:	a0bd                	j	800079ae <exec+0x4b6>
    goto bad;
    80007942:	0001                	nop
    80007944:	a825                	j	8000797c <exec+0x484>
    goto bad;
    80007946:	0001                	nop
    80007948:	a815                	j	8000797c <exec+0x484>
    goto bad;
    8000794a:	0001                	nop
    8000794c:	a805                	j	8000797c <exec+0x484>
      goto bad;
    8000794e:	0001                	nop
    80007950:	a035                	j	8000797c <exec+0x484>
      goto bad;
    80007952:	0001                	nop
    80007954:	a025                	j	8000797c <exec+0x484>
      goto bad;
    80007956:	0001                	nop
    80007958:	a015                	j	8000797c <exec+0x484>
      goto bad;
    8000795a:	0001                	nop
    8000795c:	a005                	j	8000797c <exec+0x484>
      goto bad;
    8000795e:	0001                	nop
    80007960:	a831                	j	8000797c <exec+0x484>
      goto bad;
    80007962:	0001                	nop
    80007964:	a821                	j	8000797c <exec+0x484>
    goto bad;
    80007966:	0001                	nop
    80007968:	a811                	j	8000797c <exec+0x484>
      goto bad;
    8000796a:	0001                	nop
    8000796c:	a801                	j	8000797c <exec+0x484>
      goto bad;
    8000796e:	0001                	nop
    80007970:	a031                	j	8000797c <exec+0x484>
      goto bad;
    80007972:	0001                	nop
    80007974:	a021                	j	8000797c <exec+0x484>
    goto bad;
    80007976:	0001                	nop
    80007978:	a011                	j	8000797c <exec+0x484>
    goto bad;
    8000797a:	0001                	nop

 bad:
  if(pagetable)
    8000797c:	fa043783          	ld	a5,-96(s0)
    80007980:	cb89                	beqz	a5,80007992 <exec+0x49a>
    proc_freepagetable(pagetable, sz);
    80007982:	fb843583          	ld	a1,-72(s0)
    80007986:	fa043503          	ld	a0,-96(s0)
    8000798a:	ffffb097          	auipc	ra,0xffffb
    8000798e:	24a080e7          	jalr	586(ra) # 80002bd4 <proc_freepagetable>
  if(ip){
    80007992:	fa843783          	ld	a5,-88(s0)
    80007996:	cb99                	beqz	a5,800079ac <exec+0x4b4>
    iunlockput(ip);
    80007998:	fa843503          	ld	a0,-88(s0)
    8000799c:	ffffe097          	auipc	ra,0xffffe
    800079a0:	ce4080e7          	jalr	-796(ra) # 80005680 <iunlockput>
    end_op();
    800079a4:	fffff097          	auipc	ra,0xfffff
    800079a8:	bac080e7          	jalr	-1108(ra) # 80006550 <end_op>
  }
  return -1;
    800079ac:	57fd                	li	a5,-1
}
    800079ae:	853e                	mv	a0,a5
    800079b0:	21813083          	ld	ra,536(sp)
    800079b4:	21013403          	ld	s0,528(sp)
    800079b8:	20813483          	ld	s1,520(sp)
    800079bc:	22010113          	addi	sp,sp,544
    800079c0:	8082                	ret

00000000800079c2 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    800079c2:	7139                	addi	sp,sp,-64
    800079c4:	fc06                	sd	ra,56(sp)
    800079c6:	f822                	sd	s0,48(sp)
    800079c8:	0080                	addi	s0,sp,64
    800079ca:	fca43c23          	sd	a0,-40(s0)
    800079ce:	fcb43823          	sd	a1,-48(s0)
    800079d2:	fcc43423          	sd	a2,-56(s0)
    800079d6:	87b6                	mv	a5,a3
    800079d8:	fcf42223          	sw	a5,-60(s0)
    800079dc:	87ba                	mv	a5,a4
    800079de:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  if((va % PGSIZE) != 0)
    800079e2:	fd043703          	ld	a4,-48(s0)
    800079e6:	6785                	lui	a5,0x1
    800079e8:	17fd                	addi	a5,a5,-1
    800079ea:	8ff9                	and	a5,a5,a4
    800079ec:	cb89                	beqz	a5,800079fe <loadseg+0x3c>
    panic("loadseg: va must be page aligned");
    800079ee:	00004517          	auipc	a0,0x4
    800079f2:	bea50513          	addi	a0,a0,-1046 # 8000b5d8 <etext+0x5d8>
    800079f6:	ffff9097          	auipc	ra,0xffff9
    800079fa:	25a080e7          	jalr	602(ra) # 80000c50 <panic>

  for(i = 0; i < sz; i += PGSIZE){
    800079fe:	fe042623          	sw	zero,-20(s0)
    80007a02:	a05d                	j	80007aa8 <loadseg+0xe6>
    pa = walkaddr(pagetable, va + i);
    80007a04:	fec46703          	lwu	a4,-20(s0)
    80007a08:	fd043783          	ld	a5,-48(s0)
    80007a0c:	97ba                	add	a5,a5,a4
    80007a0e:	85be                	mv	a1,a5
    80007a10:	fd843503          	ld	a0,-40(s0)
    80007a14:	ffffa097          	auipc	ra,0xffffa
    80007a18:	182080e7          	jalr	386(ra) # 80001b96 <walkaddr>
    80007a1c:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007a20:	fe043783          	ld	a5,-32(s0)
    80007a24:	eb89                	bnez	a5,80007a36 <loadseg+0x74>
      panic("loadseg: address should exist");
    80007a26:	00004517          	auipc	a0,0x4
    80007a2a:	bda50513          	addi	a0,a0,-1062 # 8000b600 <etext+0x600>
    80007a2e:	ffff9097          	auipc	ra,0xffff9
    80007a32:	222080e7          	jalr	546(ra) # 80000c50 <panic>
    if(sz - i < PGSIZE)
    80007a36:	fc042703          	lw	a4,-64(s0)
    80007a3a:	fec42783          	lw	a5,-20(s0)
    80007a3e:	40f707bb          	subw	a5,a4,a5
    80007a42:	2781                	sext.w	a5,a5
    80007a44:	873e                	mv	a4,a5
    80007a46:	6785                	lui	a5,0x1
    80007a48:	00f77b63          	bgeu	a4,a5,80007a5e <loadseg+0x9c>
      n = sz - i;
    80007a4c:	fc042703          	lw	a4,-64(s0)
    80007a50:	fec42783          	lw	a5,-20(s0)
    80007a54:	40f707bb          	subw	a5,a4,a5
    80007a58:	fef42423          	sw	a5,-24(s0)
    80007a5c:	a021                	j	80007a64 <loadseg+0xa2>
    else
      n = PGSIZE;
    80007a5e:	6785                	lui	a5,0x1
    80007a60:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007a64:	fc442703          	lw	a4,-60(s0)
    80007a68:	fec42783          	lw	a5,-20(s0)
    80007a6c:	9fb9                	addw	a5,a5,a4
    80007a6e:	2781                	sext.w	a5,a5
    80007a70:	fe842703          	lw	a4,-24(s0)
    80007a74:	86be                	mv	a3,a5
    80007a76:	fe043603          	ld	a2,-32(s0)
    80007a7a:	4581                	li	a1,0
    80007a7c:	fc843503          	ld	a0,-56(s0)
    80007a80:	ffffe097          	auipc	ra,0xffffe
    80007a84:	f38080e7          	jalr	-200(ra) # 800059b8 <readi>
    80007a88:	87aa                	mv	a5,a0
    80007a8a:	0007871b          	sext.w	a4,a5
    80007a8e:	fe842783          	lw	a5,-24(s0)
    80007a92:	2781                	sext.w	a5,a5
    80007a94:	00e78463          	beq	a5,a4,80007a9c <loadseg+0xda>
      return -1;
    80007a98:	57fd                	li	a5,-1
    80007a9a:	a005                	j	80007aba <loadseg+0xf8>
  for(i = 0; i < sz; i += PGSIZE){
    80007a9c:	fec42703          	lw	a4,-20(s0)
    80007aa0:	6785                	lui	a5,0x1
    80007aa2:	9fb9                	addw	a5,a5,a4
    80007aa4:	fef42623          	sw	a5,-20(s0)
    80007aa8:	fec42703          	lw	a4,-20(s0)
    80007aac:	fc042783          	lw	a5,-64(s0)
    80007ab0:	2701                	sext.w	a4,a4
    80007ab2:	2781                	sext.w	a5,a5
    80007ab4:	f4f768e3          	bltu	a4,a5,80007a04 <loadseg+0x42>
  }
  
  return 0;
    80007ab8:	4781                	li	a5,0
}
    80007aba:	853e                	mv	a0,a5
    80007abc:	70e2                	ld	ra,56(sp)
    80007abe:	7442                	ld	s0,48(sp)
    80007ac0:	6121                	addi	sp,sp,64
    80007ac2:	8082                	ret

0000000080007ac4 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80007ac4:	7139                	addi	sp,sp,-64
    80007ac6:	fc06                	sd	ra,56(sp)
    80007ac8:	f822                	sd	s0,48(sp)
    80007aca:	0080                	addi	s0,sp,64
    80007acc:	87aa                	mv	a5,a0
    80007ace:	fcb43823          	sd	a1,-48(s0)
    80007ad2:	fcc43423          	sd	a2,-56(s0)
    80007ad6:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80007ada:	fe440713          	addi	a4,s0,-28
    80007ade:	fdc42783          	lw	a5,-36(s0)
    80007ae2:	85ba                	mv	a1,a4
    80007ae4:	853e                	mv	a0,a5
    80007ae6:	ffffd097          	auipc	ra,0xffffd
    80007aea:	94e080e7          	jalr	-1714(ra) # 80004434 <argint>
    80007aee:	87aa                	mv	a5,a0
    80007af0:	0007d463          	bgez	a5,80007af8 <argfd+0x34>
    return -1;
    80007af4:	57fd                	li	a5,-1
    80007af6:	a8b9                	j	80007b54 <argfd+0x90>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007af8:	fe442783          	lw	a5,-28(s0)
    80007afc:	0207c963          	bltz	a5,80007b2e <argfd+0x6a>
    80007b00:	fe442783          	lw	a5,-28(s0)
    80007b04:	873e                	mv	a4,a5
    80007b06:	47bd                	li	a5,15
    80007b08:	02e7c363          	blt	a5,a4,80007b2e <argfd+0x6a>
    80007b0c:	ffffb097          	auipc	ra,0xffffb
    80007b10:	cea080e7          	jalr	-790(ra) # 800027f6 <myproc>
    80007b14:	872a                	mv	a4,a0
    80007b16:	fe442783          	lw	a5,-28(s0)
    80007b1a:	26678793          	addi	a5,a5,614 # 1266 <_entry-0x7fffed9a>
    80007b1e:	078e                	slli	a5,a5,0x3
    80007b20:	97ba                	add	a5,a5,a4
    80007b22:	679c                	ld	a5,8(a5)
    80007b24:	fef43423          	sd	a5,-24(s0)
    80007b28:	fe843783          	ld	a5,-24(s0)
    80007b2c:	e399                	bnez	a5,80007b32 <argfd+0x6e>
    return -1;
    80007b2e:	57fd                	li	a5,-1
    80007b30:	a015                	j	80007b54 <argfd+0x90>
  if(pfd)
    80007b32:	fd043783          	ld	a5,-48(s0)
    80007b36:	c791                	beqz	a5,80007b42 <argfd+0x7e>
    *pfd = fd;
    80007b38:	fe442703          	lw	a4,-28(s0)
    80007b3c:	fd043783          	ld	a5,-48(s0)
    80007b40:	c398                	sw	a4,0(a5)
  if(pf)
    80007b42:	fc843783          	ld	a5,-56(s0)
    80007b46:	c791                	beqz	a5,80007b52 <argfd+0x8e>
    *pf = f;
    80007b48:	fc843783          	ld	a5,-56(s0)
    80007b4c:	fe843703          	ld	a4,-24(s0)
    80007b50:	e398                	sd	a4,0(a5)
  return 0;
    80007b52:	4781                	li	a5,0
}
    80007b54:	853e                	mv	a0,a5
    80007b56:	70e2                	ld	ra,56(sp)
    80007b58:	7442                	ld	s0,48(sp)
    80007b5a:	6121                	addi	sp,sp,64
    80007b5c:	8082                	ret

0000000080007b5e <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007b5e:	7179                	addi	sp,sp,-48
    80007b60:	f406                	sd	ra,40(sp)
    80007b62:	f022                	sd	s0,32(sp)
    80007b64:	1800                	addi	s0,sp,48
    80007b66:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007b6a:	ffffb097          	auipc	ra,0xffffb
    80007b6e:	c8c080e7          	jalr	-884(ra) # 800027f6 <myproc>
    80007b72:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007b76:	fe042623          	sw	zero,-20(s0)
    80007b7a:	a835                	j	80007bb6 <fdalloc+0x58>
    if(p->ofile[fd] == 0){
    80007b7c:	fe043703          	ld	a4,-32(s0)
    80007b80:	fec42783          	lw	a5,-20(s0)
    80007b84:	26678793          	addi	a5,a5,614
    80007b88:	078e                	slli	a5,a5,0x3
    80007b8a:	97ba                	add	a5,a5,a4
    80007b8c:	679c                	ld	a5,8(a5)
    80007b8e:	ef99                	bnez	a5,80007bac <fdalloc+0x4e>
      p->ofile[fd] = f;
    80007b90:	fe043703          	ld	a4,-32(s0)
    80007b94:	fec42783          	lw	a5,-20(s0)
    80007b98:	26678793          	addi	a5,a5,614
    80007b9c:	078e                	slli	a5,a5,0x3
    80007b9e:	97ba                	add	a5,a5,a4
    80007ba0:	fd843703          	ld	a4,-40(s0)
    80007ba4:	e798                	sd	a4,8(a5)
      return fd;
    80007ba6:	fec42783          	lw	a5,-20(s0)
    80007baa:	a831                	j	80007bc6 <fdalloc+0x68>
  for(fd = 0; fd < NOFILE; fd++){
    80007bac:	fec42783          	lw	a5,-20(s0)
    80007bb0:	2785                	addiw	a5,a5,1
    80007bb2:	fef42623          	sw	a5,-20(s0)
    80007bb6:	fec42783          	lw	a5,-20(s0)
    80007bba:	0007871b          	sext.w	a4,a5
    80007bbe:	47bd                	li	a5,15
    80007bc0:	fae7dee3          	bge	a5,a4,80007b7c <fdalloc+0x1e>
    }
  }
  return -1;
    80007bc4:	57fd                	li	a5,-1
}
    80007bc6:	853e                	mv	a0,a5
    80007bc8:	70a2                	ld	ra,40(sp)
    80007bca:	7402                	ld	s0,32(sp)
    80007bcc:	6145                	addi	sp,sp,48
    80007bce:	8082                	ret

0000000080007bd0 <sys_dup>:

uint64
sys_dup(void)
{
    80007bd0:	1101                	addi	sp,sp,-32
    80007bd2:	ec06                	sd	ra,24(sp)
    80007bd4:	e822                	sd	s0,16(sp)
    80007bd6:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007bd8:	fe040793          	addi	a5,s0,-32
    80007bdc:	863e                	mv	a2,a5
    80007bde:	4581                	li	a1,0
    80007be0:	4501                	li	a0,0
    80007be2:	00000097          	auipc	ra,0x0
    80007be6:	ee2080e7          	jalr	-286(ra) # 80007ac4 <argfd>
    80007bea:	87aa                	mv	a5,a0
    80007bec:	0007d463          	bgez	a5,80007bf4 <sys_dup+0x24>
    return -1;
    80007bf0:	57fd                	li	a5,-1
    80007bf2:	a81d                	j	80007c28 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007bf4:	fe043783          	ld	a5,-32(s0)
    80007bf8:	853e                	mv	a0,a5
    80007bfa:	00000097          	auipc	ra,0x0
    80007bfe:	f64080e7          	jalr	-156(ra) # 80007b5e <fdalloc>
    80007c02:	87aa                	mv	a5,a0
    80007c04:	fef42623          	sw	a5,-20(s0)
    80007c08:	fec42783          	lw	a5,-20(s0)
    80007c0c:	2781                	sext.w	a5,a5
    80007c0e:	0007d463          	bgez	a5,80007c16 <sys_dup+0x46>
    return -1;
    80007c12:	57fd                	li	a5,-1
    80007c14:	a811                	j	80007c28 <sys_dup+0x58>
  filedup(f);
    80007c16:	fe043783          	ld	a5,-32(s0)
    80007c1a:	853e                	mv	a0,a5
    80007c1c:	fffff097          	auipc	ra,0xfffff
    80007c20:	ea6080e7          	jalr	-346(ra) # 80006ac2 <filedup>
  return fd;
    80007c24:	fec42783          	lw	a5,-20(s0)
}
    80007c28:	853e                	mv	a0,a5
    80007c2a:	60e2                	ld	ra,24(sp)
    80007c2c:	6442                	ld	s0,16(sp)
    80007c2e:	6105                	addi	sp,sp,32
    80007c30:	8082                	ret

0000000080007c32 <sys_read>:

uint64
sys_read(void)
{
    80007c32:	7179                	addi	sp,sp,-48
    80007c34:	f406                	sd	ra,40(sp)
    80007c36:	f022                	sd	s0,32(sp)
    80007c38:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007c3a:	fe840793          	addi	a5,s0,-24
    80007c3e:	863e                	mv	a2,a5
    80007c40:	4581                	li	a1,0
    80007c42:	4501                	li	a0,0
    80007c44:	00000097          	auipc	ra,0x0
    80007c48:	e80080e7          	jalr	-384(ra) # 80007ac4 <argfd>
    80007c4c:	87aa                	mv	a5,a0
    80007c4e:	0207c863          	bltz	a5,80007c7e <sys_read+0x4c>
    80007c52:	fe440793          	addi	a5,s0,-28
    80007c56:	85be                	mv	a1,a5
    80007c58:	4509                	li	a0,2
    80007c5a:	ffffc097          	auipc	ra,0xffffc
    80007c5e:	7da080e7          	jalr	2010(ra) # 80004434 <argint>
    80007c62:	87aa                	mv	a5,a0
    80007c64:	0007cd63          	bltz	a5,80007c7e <sys_read+0x4c>
    80007c68:	fd840793          	addi	a5,s0,-40
    80007c6c:	85be                	mv	a1,a5
    80007c6e:	4505                	li	a0,1
    80007c70:	ffffc097          	auipc	ra,0xffffc
    80007c74:	7fc080e7          	jalr	2044(ra) # 8000446c <argaddr>
    80007c78:	87aa                	mv	a5,a0
    80007c7a:	0007d463          	bgez	a5,80007c82 <sys_read+0x50>
    return -1;
    80007c7e:	57fd                	li	a5,-1
    80007c80:	a839                	j	80007c9e <sys_read+0x6c>
  return fileread(f, p, n);
    80007c82:	fe843783          	ld	a5,-24(s0)
    80007c86:	fd843703          	ld	a4,-40(s0)
    80007c8a:	fe442683          	lw	a3,-28(s0)
    80007c8e:	8636                	mv	a2,a3
    80007c90:	85ba                	mv	a1,a4
    80007c92:	853e                	mv	a0,a5
    80007c94:	fffff097          	auipc	ra,0xfffff
    80007c98:	046080e7          	jalr	70(ra) # 80006cda <fileread>
    80007c9c:	87aa                	mv	a5,a0
}
    80007c9e:	853e                	mv	a0,a5
    80007ca0:	70a2                	ld	ra,40(sp)
    80007ca2:	7402                	ld	s0,32(sp)
    80007ca4:	6145                	addi	sp,sp,48
    80007ca6:	8082                	ret

0000000080007ca8 <sys_write>:

uint64
sys_write(void)
{
    80007ca8:	7179                	addi	sp,sp,-48
    80007caa:	f406                	sd	ra,40(sp)
    80007cac:	f022                	sd	s0,32(sp)
    80007cae:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007cb0:	fe840793          	addi	a5,s0,-24
    80007cb4:	863e                	mv	a2,a5
    80007cb6:	4581                	li	a1,0
    80007cb8:	4501                	li	a0,0
    80007cba:	00000097          	auipc	ra,0x0
    80007cbe:	e0a080e7          	jalr	-502(ra) # 80007ac4 <argfd>
    80007cc2:	87aa                	mv	a5,a0
    80007cc4:	0207c863          	bltz	a5,80007cf4 <sys_write+0x4c>
    80007cc8:	fe440793          	addi	a5,s0,-28
    80007ccc:	85be                	mv	a1,a5
    80007cce:	4509                	li	a0,2
    80007cd0:	ffffc097          	auipc	ra,0xffffc
    80007cd4:	764080e7          	jalr	1892(ra) # 80004434 <argint>
    80007cd8:	87aa                	mv	a5,a0
    80007cda:	0007cd63          	bltz	a5,80007cf4 <sys_write+0x4c>
    80007cde:	fd840793          	addi	a5,s0,-40
    80007ce2:	85be                	mv	a1,a5
    80007ce4:	4505                	li	a0,1
    80007ce6:	ffffc097          	auipc	ra,0xffffc
    80007cea:	786080e7          	jalr	1926(ra) # 8000446c <argaddr>
    80007cee:	87aa                	mv	a5,a0
    80007cf0:	0007d463          	bgez	a5,80007cf8 <sys_write+0x50>
    return -1;
    80007cf4:	57fd                	li	a5,-1
    80007cf6:	a839                	j	80007d14 <sys_write+0x6c>

  return filewrite(f, p, n);
    80007cf8:	fe843783          	ld	a5,-24(s0)
    80007cfc:	fd843703          	ld	a4,-40(s0)
    80007d00:	fe442683          	lw	a3,-28(s0)
    80007d04:	8636                	mv	a2,a3
    80007d06:	85ba                	mv	a1,a4
    80007d08:	853e                	mv	a0,a5
    80007d0a:	fffff097          	auipc	ra,0xfffff
    80007d0e:	136080e7          	jalr	310(ra) # 80006e40 <filewrite>
    80007d12:	87aa                	mv	a5,a0
}
    80007d14:	853e                	mv	a0,a5
    80007d16:	70a2                	ld	ra,40(sp)
    80007d18:	7402                	ld	s0,32(sp)
    80007d1a:	6145                	addi	sp,sp,48
    80007d1c:	8082                	ret

0000000080007d1e <sys_close>:

uint64
sys_close(void)
{
    80007d1e:	1101                	addi	sp,sp,-32
    80007d20:	ec06                	sd	ra,24(sp)
    80007d22:	e822                	sd	s0,16(sp)
    80007d24:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007d26:	fe040713          	addi	a4,s0,-32
    80007d2a:	fec40793          	addi	a5,s0,-20
    80007d2e:	863a                	mv	a2,a4
    80007d30:	85be                	mv	a1,a5
    80007d32:	4501                	li	a0,0
    80007d34:	00000097          	auipc	ra,0x0
    80007d38:	d90080e7          	jalr	-624(ra) # 80007ac4 <argfd>
    80007d3c:	87aa                	mv	a5,a0
    80007d3e:	0007d463          	bgez	a5,80007d46 <sys_close+0x28>
    return -1;
    80007d42:	57fd                	li	a5,-1
    80007d44:	a035                	j	80007d70 <sys_close+0x52>
  myproc()->ofile[fd] = 0;
    80007d46:	ffffb097          	auipc	ra,0xffffb
    80007d4a:	ab0080e7          	jalr	-1360(ra) # 800027f6 <myproc>
    80007d4e:	872a                	mv	a4,a0
    80007d50:	fec42783          	lw	a5,-20(s0)
    80007d54:	26678793          	addi	a5,a5,614
    80007d58:	078e                	slli	a5,a5,0x3
    80007d5a:	97ba                	add	a5,a5,a4
    80007d5c:	0007b423          	sd	zero,8(a5)
  fileclose(f);
    80007d60:	fe043783          	ld	a5,-32(s0)
    80007d64:	853e                	mv	a0,a5
    80007d66:	fffff097          	auipc	ra,0xfffff
    80007d6a:	dc2080e7          	jalr	-574(ra) # 80006b28 <fileclose>
  return 0;
    80007d6e:	4781                	li	a5,0
}
    80007d70:	853e                	mv	a0,a5
    80007d72:	60e2                	ld	ra,24(sp)
    80007d74:	6442                	ld	s0,16(sp)
    80007d76:	6105                	addi	sp,sp,32
    80007d78:	8082                	ret

0000000080007d7a <sys_fstat>:

uint64
sys_fstat(void)
{
    80007d7a:	1101                	addi	sp,sp,-32
    80007d7c:	ec06                	sd	ra,24(sp)
    80007d7e:	e822                	sd	s0,16(sp)
    80007d80:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80007d82:	fe840793          	addi	a5,s0,-24
    80007d86:	863e                	mv	a2,a5
    80007d88:	4581                	li	a1,0
    80007d8a:	4501                	li	a0,0
    80007d8c:	00000097          	auipc	ra,0x0
    80007d90:	d38080e7          	jalr	-712(ra) # 80007ac4 <argfd>
    80007d94:	87aa                	mv	a5,a0
    80007d96:	0007cd63          	bltz	a5,80007db0 <sys_fstat+0x36>
    80007d9a:	fe040793          	addi	a5,s0,-32
    80007d9e:	85be                	mv	a1,a5
    80007da0:	4505                	li	a0,1
    80007da2:	ffffc097          	auipc	ra,0xffffc
    80007da6:	6ca080e7          	jalr	1738(ra) # 8000446c <argaddr>
    80007daa:	87aa                	mv	a5,a0
    80007dac:	0007d463          	bgez	a5,80007db4 <sys_fstat+0x3a>
    return -1;
    80007db0:	57fd                	li	a5,-1
    80007db2:	a821                	j	80007dca <sys_fstat+0x50>
  return filestat(f, st);
    80007db4:	fe843783          	ld	a5,-24(s0)
    80007db8:	fe043703          	ld	a4,-32(s0)
    80007dbc:	85ba                	mv	a1,a4
    80007dbe:	853e                	mv	a0,a5
    80007dc0:	fffff097          	auipc	ra,0xfffff
    80007dc4:	e70080e7          	jalr	-400(ra) # 80006c30 <filestat>
    80007dc8:	87aa                	mv	a5,a0
}
    80007dca:	853e                	mv	a0,a5
    80007dcc:	60e2                	ld	ra,24(sp)
    80007dce:	6442                	ld	s0,16(sp)
    80007dd0:	6105                	addi	sp,sp,32
    80007dd2:	8082                	ret

0000000080007dd4 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007dd4:	7169                	addi	sp,sp,-304
    80007dd6:	f606                	sd	ra,296(sp)
    80007dd8:	f222                	sd	s0,288(sp)
    80007dda:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007ddc:	ed040793          	addi	a5,s0,-304
    80007de0:	08000613          	li	a2,128
    80007de4:	85be                	mv	a1,a5
    80007de6:	4501                	li	a0,0
    80007de8:	ffffc097          	auipc	ra,0xffffc
    80007dec:	6b8080e7          	jalr	1720(ra) # 800044a0 <argstr>
    80007df0:	87aa                	mv	a5,a0
    80007df2:	0007cf63          	bltz	a5,80007e10 <sys_link+0x3c>
    80007df6:	f5040793          	addi	a5,s0,-176
    80007dfa:	08000613          	li	a2,128
    80007dfe:	85be                	mv	a1,a5
    80007e00:	4505                	li	a0,1
    80007e02:	ffffc097          	auipc	ra,0xffffc
    80007e06:	69e080e7          	jalr	1694(ra) # 800044a0 <argstr>
    80007e0a:	87aa                	mv	a5,a0
    80007e0c:	0007d463          	bgez	a5,80007e14 <sys_link+0x40>
    return -1;
    80007e10:	57fd                	li	a5,-1
    80007e12:	aab5                	j	80007f8e <sys_link+0x1ba>

  begin_op();
    80007e14:	ffffe097          	auipc	ra,0xffffe
    80007e18:	67a080e7          	jalr	1658(ra) # 8000648e <begin_op>
  if((ip = namei(old)) == 0){
    80007e1c:	ed040793          	addi	a5,s0,-304
    80007e20:	853e                	mv	a0,a5
    80007e22:	ffffe097          	auipc	ra,0xffffe
    80007e26:	308080e7          	jalr	776(ra) # 8000612a <namei>
    80007e2a:	fea43423          	sd	a0,-24(s0)
    80007e2e:	fe843783          	ld	a5,-24(s0)
    80007e32:	e799                	bnez	a5,80007e40 <sys_link+0x6c>
    end_op();
    80007e34:	ffffe097          	auipc	ra,0xffffe
    80007e38:	71c080e7          	jalr	1820(ra) # 80006550 <end_op>
    return -1;
    80007e3c:	57fd                	li	a5,-1
    80007e3e:	aa81                	j	80007f8e <sys_link+0x1ba>
  }

  ilock(ip);
    80007e40:	fe843503          	ld	a0,-24(s0)
    80007e44:	ffffd097          	auipc	ra,0xffffd
    80007e48:	5de080e7          	jalr	1502(ra) # 80005422 <ilock>
  if(ip->type == T_DIR){
    80007e4c:	fe843783          	ld	a5,-24(s0)
    80007e50:	04479783          	lh	a5,68(a5)
    80007e54:	0007871b          	sext.w	a4,a5
    80007e58:	4785                	li	a5,1
    80007e5a:	00f71e63          	bne	a4,a5,80007e76 <sys_link+0xa2>
    iunlockput(ip);
    80007e5e:	fe843503          	ld	a0,-24(s0)
    80007e62:	ffffe097          	auipc	ra,0xffffe
    80007e66:	81e080e7          	jalr	-2018(ra) # 80005680 <iunlockput>
    end_op();
    80007e6a:	ffffe097          	auipc	ra,0xffffe
    80007e6e:	6e6080e7          	jalr	1766(ra) # 80006550 <end_op>
    return -1;
    80007e72:	57fd                	li	a5,-1
    80007e74:	aa29                	j	80007f8e <sys_link+0x1ba>
  }

  ip->nlink++;
    80007e76:	fe843783          	ld	a5,-24(s0)
    80007e7a:	04a79783          	lh	a5,74(a5)
    80007e7e:	17c2                	slli	a5,a5,0x30
    80007e80:	93c1                	srli	a5,a5,0x30
    80007e82:	2785                	addiw	a5,a5,1
    80007e84:	17c2                	slli	a5,a5,0x30
    80007e86:	93c1                	srli	a5,a5,0x30
    80007e88:	0107971b          	slliw	a4,a5,0x10
    80007e8c:	4107571b          	sraiw	a4,a4,0x10
    80007e90:	fe843783          	ld	a5,-24(s0)
    80007e94:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007e98:	fe843503          	ld	a0,-24(s0)
    80007e9c:	ffffd097          	auipc	ra,0xffffd
    80007ea0:	336080e7          	jalr	822(ra) # 800051d2 <iupdate>
  iunlock(ip);
    80007ea4:	fe843503          	ld	a0,-24(s0)
    80007ea8:	ffffd097          	auipc	ra,0xffffd
    80007eac:	6ae080e7          	jalr	1710(ra) # 80005556 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007eb0:	fd040713          	addi	a4,s0,-48
    80007eb4:	f5040793          	addi	a5,s0,-176
    80007eb8:	85ba                	mv	a1,a4
    80007eba:	853e                	mv	a0,a5
    80007ebc:	ffffe097          	auipc	ra,0xffffe
    80007ec0:	29a080e7          	jalr	666(ra) # 80006156 <nameiparent>
    80007ec4:	fea43023          	sd	a0,-32(s0)
    80007ec8:	fe043783          	ld	a5,-32(s0)
    80007ecc:	cba5                	beqz	a5,80007f3c <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007ece:	fe043503          	ld	a0,-32(s0)
    80007ed2:	ffffd097          	auipc	ra,0xffffd
    80007ed6:	550080e7          	jalr	1360(ra) # 80005422 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007eda:	fe043783          	ld	a5,-32(s0)
    80007ede:	4398                	lw	a4,0(a5)
    80007ee0:	fe843783          	ld	a5,-24(s0)
    80007ee4:	439c                	lw	a5,0(a5)
    80007ee6:	02f71263          	bne	a4,a5,80007f0a <sys_link+0x136>
    80007eea:	fe843783          	ld	a5,-24(s0)
    80007eee:	43d8                	lw	a4,4(a5)
    80007ef0:	fd040793          	addi	a5,s0,-48
    80007ef4:	863a                	mv	a2,a4
    80007ef6:	85be                	mv	a1,a5
    80007ef8:	fe043503          	ld	a0,-32(s0)
    80007efc:	ffffe097          	auipc	ra,0xffffe
    80007f00:	f10080e7          	jalr	-240(ra) # 80005e0c <dirlink>
    80007f04:	87aa                	mv	a5,a0
    80007f06:	0007d963          	bgez	a5,80007f18 <sys_link+0x144>
    iunlockput(dp);
    80007f0a:	fe043503          	ld	a0,-32(s0)
    80007f0e:	ffffd097          	auipc	ra,0xffffd
    80007f12:	772080e7          	jalr	1906(ra) # 80005680 <iunlockput>
    goto bad;
    80007f16:	a025                	j	80007f3e <sys_link+0x16a>
  }
  iunlockput(dp);
    80007f18:	fe043503          	ld	a0,-32(s0)
    80007f1c:	ffffd097          	auipc	ra,0xffffd
    80007f20:	764080e7          	jalr	1892(ra) # 80005680 <iunlockput>
  iput(ip);
    80007f24:	fe843503          	ld	a0,-24(s0)
    80007f28:	ffffd097          	auipc	ra,0xffffd
    80007f2c:	688080e7          	jalr	1672(ra) # 800055b0 <iput>

  end_op();
    80007f30:	ffffe097          	auipc	ra,0xffffe
    80007f34:	620080e7          	jalr	1568(ra) # 80006550 <end_op>

  return 0;
    80007f38:	4781                	li	a5,0
    80007f3a:	a891                	j	80007f8e <sys_link+0x1ba>
    goto bad;
    80007f3c:	0001                	nop

bad:
  ilock(ip);
    80007f3e:	fe843503          	ld	a0,-24(s0)
    80007f42:	ffffd097          	auipc	ra,0xffffd
    80007f46:	4e0080e7          	jalr	1248(ra) # 80005422 <ilock>
  ip->nlink--;
    80007f4a:	fe843783          	ld	a5,-24(s0)
    80007f4e:	04a79783          	lh	a5,74(a5)
    80007f52:	17c2                	slli	a5,a5,0x30
    80007f54:	93c1                	srli	a5,a5,0x30
    80007f56:	37fd                	addiw	a5,a5,-1
    80007f58:	17c2                	slli	a5,a5,0x30
    80007f5a:	93c1                	srli	a5,a5,0x30
    80007f5c:	0107971b          	slliw	a4,a5,0x10
    80007f60:	4107571b          	sraiw	a4,a4,0x10
    80007f64:	fe843783          	ld	a5,-24(s0)
    80007f68:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007f6c:	fe843503          	ld	a0,-24(s0)
    80007f70:	ffffd097          	auipc	ra,0xffffd
    80007f74:	262080e7          	jalr	610(ra) # 800051d2 <iupdate>
  iunlockput(ip);
    80007f78:	fe843503          	ld	a0,-24(s0)
    80007f7c:	ffffd097          	auipc	ra,0xffffd
    80007f80:	704080e7          	jalr	1796(ra) # 80005680 <iunlockput>
  end_op();
    80007f84:	ffffe097          	auipc	ra,0xffffe
    80007f88:	5cc080e7          	jalr	1484(ra) # 80006550 <end_op>
  return -1;
    80007f8c:	57fd                	li	a5,-1
}
    80007f8e:	853e                	mv	a0,a5
    80007f90:	70b2                	ld	ra,296(sp)
    80007f92:	7412                	ld	s0,288(sp)
    80007f94:	6155                	addi	sp,sp,304
    80007f96:	8082                	ret

0000000080007f98 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007f98:	7139                	addi	sp,sp,-64
    80007f9a:	fc06                	sd	ra,56(sp)
    80007f9c:	f822                	sd	s0,48(sp)
    80007f9e:	0080                	addi	s0,sp,64
    80007fa0:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007fa4:	02000793          	li	a5,32
    80007fa8:	fef42623          	sw	a5,-20(s0)
    80007fac:	a0b1                	j	80007ff8 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007fae:	fd840793          	addi	a5,s0,-40
    80007fb2:	fec42683          	lw	a3,-20(s0)
    80007fb6:	4741                	li	a4,16
    80007fb8:	863e                	mv	a2,a5
    80007fba:	4581                	li	a1,0
    80007fbc:	fc843503          	ld	a0,-56(s0)
    80007fc0:	ffffe097          	auipc	ra,0xffffe
    80007fc4:	9f8080e7          	jalr	-1544(ra) # 800059b8 <readi>
    80007fc8:	87aa                	mv	a5,a0
    80007fca:	873e                	mv	a4,a5
    80007fcc:	47c1                	li	a5,16
    80007fce:	00f70a63          	beq	a4,a5,80007fe2 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007fd2:	00003517          	auipc	a0,0x3
    80007fd6:	64e50513          	addi	a0,a0,1614 # 8000b620 <etext+0x620>
    80007fda:	ffff9097          	auipc	ra,0xffff9
    80007fde:	c76080e7          	jalr	-906(ra) # 80000c50 <panic>
    if(de.inum != 0)
    80007fe2:	fd845783          	lhu	a5,-40(s0)
    80007fe6:	c399                	beqz	a5,80007fec <isdirempty+0x54>
      return 0;
    80007fe8:	4781                	li	a5,0
    80007fea:	a839                	j	80008008 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007fec:	fec42783          	lw	a5,-20(s0)
    80007ff0:	27c1                	addiw	a5,a5,16
    80007ff2:	2781                	sext.w	a5,a5
    80007ff4:	fef42623          	sw	a5,-20(s0)
    80007ff8:	fc843783          	ld	a5,-56(s0)
    80007ffc:	47f8                	lw	a4,76(a5)
    80007ffe:	fec42783          	lw	a5,-20(s0)
    80008002:	fae7e6e3          	bltu	a5,a4,80007fae <isdirempty+0x16>
  }
  return 1;
    80008006:	4785                	li	a5,1
}
    80008008:	853e                	mv	a0,a5
    8000800a:	70e2                	ld	ra,56(sp)
    8000800c:	7442                	ld	s0,48(sp)
    8000800e:	6121                	addi	sp,sp,64
    80008010:	8082                	ret

0000000080008012 <sys_unlink>:

uint64
sys_unlink(void)
{
    80008012:	7155                	addi	sp,sp,-208
    80008014:	e586                	sd	ra,200(sp)
    80008016:	e1a2                	sd	s0,192(sp)
    80008018:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    8000801a:	f4040793          	addi	a5,s0,-192
    8000801e:	08000613          	li	a2,128
    80008022:	85be                	mv	a1,a5
    80008024:	4501                	li	a0,0
    80008026:	ffffc097          	auipc	ra,0xffffc
    8000802a:	47a080e7          	jalr	1146(ra) # 800044a0 <argstr>
    8000802e:	87aa                	mv	a5,a0
    80008030:	0007d463          	bgez	a5,80008038 <sys_unlink+0x26>
    return -1;
    80008034:	57fd                	li	a5,-1
    80008036:	a2ed                	j	80008220 <sys_unlink+0x20e>

  begin_op();
    80008038:	ffffe097          	auipc	ra,0xffffe
    8000803c:	456080e7          	jalr	1110(ra) # 8000648e <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80008040:	fc040713          	addi	a4,s0,-64
    80008044:	f4040793          	addi	a5,s0,-192
    80008048:	85ba                	mv	a1,a4
    8000804a:	853e                	mv	a0,a5
    8000804c:	ffffe097          	auipc	ra,0xffffe
    80008050:	10a080e7          	jalr	266(ra) # 80006156 <nameiparent>
    80008054:	fea43423          	sd	a0,-24(s0)
    80008058:	fe843783          	ld	a5,-24(s0)
    8000805c:	e799                	bnez	a5,8000806a <sys_unlink+0x58>
    end_op();
    8000805e:	ffffe097          	auipc	ra,0xffffe
    80008062:	4f2080e7          	jalr	1266(ra) # 80006550 <end_op>
    return -1;
    80008066:	57fd                	li	a5,-1
    80008068:	aa65                	j	80008220 <sys_unlink+0x20e>
  }

  ilock(dp);
    8000806a:	fe843503          	ld	a0,-24(s0)
    8000806e:	ffffd097          	auipc	ra,0xffffd
    80008072:	3b4080e7          	jalr	948(ra) # 80005422 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80008076:	fc040793          	addi	a5,s0,-64
    8000807a:	00003597          	auipc	a1,0x3
    8000807e:	5be58593          	addi	a1,a1,1470 # 8000b638 <etext+0x638>
    80008082:	853e                	mv	a0,a5
    80008084:	ffffe097          	auipc	ra,0xffffe
    80008088:	c72080e7          	jalr	-910(ra) # 80005cf6 <namecmp>
    8000808c:	87aa                	mv	a5,a0
    8000808e:	16078b63          	beqz	a5,80008204 <sys_unlink+0x1f2>
    80008092:	fc040793          	addi	a5,s0,-64
    80008096:	00003597          	auipc	a1,0x3
    8000809a:	5aa58593          	addi	a1,a1,1450 # 8000b640 <etext+0x640>
    8000809e:	853e                	mv	a0,a5
    800080a0:	ffffe097          	auipc	ra,0xffffe
    800080a4:	c56080e7          	jalr	-938(ra) # 80005cf6 <namecmp>
    800080a8:	87aa                	mv	a5,a0
    800080aa:	14078d63          	beqz	a5,80008204 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    800080ae:	f3c40713          	addi	a4,s0,-196
    800080b2:	fc040793          	addi	a5,s0,-64
    800080b6:	863a                	mv	a2,a4
    800080b8:	85be                	mv	a1,a5
    800080ba:	fe843503          	ld	a0,-24(s0)
    800080be:	ffffe097          	auipc	ra,0xffffe
    800080c2:	c66080e7          	jalr	-922(ra) # 80005d24 <dirlookup>
    800080c6:	fea43023          	sd	a0,-32(s0)
    800080ca:	fe043783          	ld	a5,-32(s0)
    800080ce:	12078d63          	beqz	a5,80008208 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    800080d2:	fe043503          	ld	a0,-32(s0)
    800080d6:	ffffd097          	auipc	ra,0xffffd
    800080da:	34c080e7          	jalr	844(ra) # 80005422 <ilock>

  if(ip->nlink < 1)
    800080de:	fe043783          	ld	a5,-32(s0)
    800080e2:	04a79783          	lh	a5,74(a5)
    800080e6:	2781                	sext.w	a5,a5
    800080e8:	00f04a63          	bgtz	a5,800080fc <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    800080ec:	00003517          	auipc	a0,0x3
    800080f0:	55c50513          	addi	a0,a0,1372 # 8000b648 <etext+0x648>
    800080f4:	ffff9097          	auipc	ra,0xffff9
    800080f8:	b5c080e7          	jalr	-1188(ra) # 80000c50 <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    800080fc:	fe043783          	ld	a5,-32(s0)
    80008100:	04479783          	lh	a5,68(a5)
    80008104:	0007871b          	sext.w	a4,a5
    80008108:	4785                	li	a5,1
    8000810a:	02f71163          	bne	a4,a5,8000812c <sys_unlink+0x11a>
    8000810e:	fe043503          	ld	a0,-32(s0)
    80008112:	00000097          	auipc	ra,0x0
    80008116:	e86080e7          	jalr	-378(ra) # 80007f98 <isdirempty>
    8000811a:	87aa                	mv	a5,a0
    8000811c:	eb81                	bnez	a5,8000812c <sys_unlink+0x11a>
    iunlockput(ip);
    8000811e:	fe043503          	ld	a0,-32(s0)
    80008122:	ffffd097          	auipc	ra,0xffffd
    80008126:	55e080e7          	jalr	1374(ra) # 80005680 <iunlockput>
    goto bad;
    8000812a:	a0c5                	j	8000820a <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    8000812c:	fd040793          	addi	a5,s0,-48
    80008130:	4641                	li	a2,16
    80008132:	4581                	li	a1,0
    80008134:	853e                	mv	a0,a5
    80008136:	ffff9097          	auipc	ra,0xffff9
    8000813a:	31c080e7          	jalr	796(ra) # 80001452 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    8000813e:	fd040793          	addi	a5,s0,-48
    80008142:	f3c42683          	lw	a3,-196(s0)
    80008146:	4741                	li	a4,16
    80008148:	863e                	mv	a2,a5
    8000814a:	4581                	li	a1,0
    8000814c:	fe843503          	ld	a0,-24(s0)
    80008150:	ffffe097          	auipc	ra,0xffffe
    80008154:	9f2080e7          	jalr	-1550(ra) # 80005b42 <writei>
    80008158:	87aa                	mv	a5,a0
    8000815a:	873e                	mv	a4,a5
    8000815c:	47c1                	li	a5,16
    8000815e:	00f70a63          	beq	a4,a5,80008172 <sys_unlink+0x160>
    panic("unlink: writei");
    80008162:	00003517          	auipc	a0,0x3
    80008166:	4fe50513          	addi	a0,a0,1278 # 8000b660 <etext+0x660>
    8000816a:	ffff9097          	auipc	ra,0xffff9
    8000816e:	ae6080e7          	jalr	-1306(ra) # 80000c50 <panic>
  if(ip->type == T_DIR){
    80008172:	fe043783          	ld	a5,-32(s0)
    80008176:	04479783          	lh	a5,68(a5)
    8000817a:	0007871b          	sext.w	a4,a5
    8000817e:	4785                	li	a5,1
    80008180:	02f71963          	bne	a4,a5,800081b2 <sys_unlink+0x1a0>
    dp->nlink--;
    80008184:	fe843783          	ld	a5,-24(s0)
    80008188:	04a79783          	lh	a5,74(a5)
    8000818c:	17c2                	slli	a5,a5,0x30
    8000818e:	93c1                	srli	a5,a5,0x30
    80008190:	37fd                	addiw	a5,a5,-1
    80008192:	17c2                	slli	a5,a5,0x30
    80008194:	93c1                	srli	a5,a5,0x30
    80008196:	0107971b          	slliw	a4,a5,0x10
    8000819a:	4107571b          	sraiw	a4,a4,0x10
    8000819e:	fe843783          	ld	a5,-24(s0)
    800081a2:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800081a6:	fe843503          	ld	a0,-24(s0)
    800081aa:	ffffd097          	auipc	ra,0xffffd
    800081ae:	028080e7          	jalr	40(ra) # 800051d2 <iupdate>
  }
  iunlockput(dp);
    800081b2:	fe843503          	ld	a0,-24(s0)
    800081b6:	ffffd097          	auipc	ra,0xffffd
    800081ba:	4ca080e7          	jalr	1226(ra) # 80005680 <iunlockput>

  ip->nlink--;
    800081be:	fe043783          	ld	a5,-32(s0)
    800081c2:	04a79783          	lh	a5,74(a5)
    800081c6:	17c2                	slli	a5,a5,0x30
    800081c8:	93c1                	srli	a5,a5,0x30
    800081ca:	37fd                	addiw	a5,a5,-1
    800081cc:	17c2                	slli	a5,a5,0x30
    800081ce:	93c1                	srli	a5,a5,0x30
    800081d0:	0107971b          	slliw	a4,a5,0x10
    800081d4:	4107571b          	sraiw	a4,a4,0x10
    800081d8:	fe043783          	ld	a5,-32(s0)
    800081dc:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800081e0:	fe043503          	ld	a0,-32(s0)
    800081e4:	ffffd097          	auipc	ra,0xffffd
    800081e8:	fee080e7          	jalr	-18(ra) # 800051d2 <iupdate>
  iunlockput(ip);
    800081ec:	fe043503          	ld	a0,-32(s0)
    800081f0:	ffffd097          	auipc	ra,0xffffd
    800081f4:	490080e7          	jalr	1168(ra) # 80005680 <iunlockput>

  end_op();
    800081f8:	ffffe097          	auipc	ra,0xffffe
    800081fc:	358080e7          	jalr	856(ra) # 80006550 <end_op>

  return 0;
    80008200:	4781                	li	a5,0
    80008202:	a839                	j	80008220 <sys_unlink+0x20e>
    goto bad;
    80008204:	0001                	nop
    80008206:	a011                	j	8000820a <sys_unlink+0x1f8>
    goto bad;
    80008208:	0001                	nop

bad:
  iunlockput(dp);
    8000820a:	fe843503          	ld	a0,-24(s0)
    8000820e:	ffffd097          	auipc	ra,0xffffd
    80008212:	472080e7          	jalr	1138(ra) # 80005680 <iunlockput>
  end_op();
    80008216:	ffffe097          	auipc	ra,0xffffe
    8000821a:	33a080e7          	jalr	826(ra) # 80006550 <end_op>
  return -1;
    8000821e:	57fd                	li	a5,-1
}
    80008220:	853e                	mv	a0,a5
    80008222:	60ae                	ld	ra,200(sp)
    80008224:	640e                	ld	s0,192(sp)
    80008226:	6169                	addi	sp,sp,208
    80008228:	8082                	ret

000000008000822a <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    8000822a:	7139                	addi	sp,sp,-64
    8000822c:	fc06                	sd	ra,56(sp)
    8000822e:	f822                	sd	s0,48(sp)
    80008230:	0080                	addi	s0,sp,64
    80008232:	fca43423          	sd	a0,-56(s0)
    80008236:	87ae                	mv	a5,a1
    80008238:	8736                	mv	a4,a3
    8000823a:	fcf41323          	sh	a5,-58(s0)
    8000823e:	87b2                	mv	a5,a2
    80008240:	fcf41223          	sh	a5,-60(s0)
    80008244:	87ba                	mv	a5,a4
    80008246:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    8000824a:	fd040793          	addi	a5,s0,-48
    8000824e:	85be                	mv	a1,a5
    80008250:	fc843503          	ld	a0,-56(s0)
    80008254:	ffffe097          	auipc	ra,0xffffe
    80008258:	f02080e7          	jalr	-254(ra) # 80006156 <nameiparent>
    8000825c:	fea43423          	sd	a0,-24(s0)
    80008260:	fe843783          	ld	a5,-24(s0)
    80008264:	e399                	bnez	a5,8000826a <create+0x40>
    return 0;
    80008266:	4781                	li	a5,0
    80008268:	a2d9                	j	8000842e <create+0x204>

  ilock(dp);
    8000826a:	fe843503          	ld	a0,-24(s0)
    8000826e:	ffffd097          	auipc	ra,0xffffd
    80008272:	1b4080e7          	jalr	436(ra) # 80005422 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80008276:	fd040793          	addi	a5,s0,-48
    8000827a:	4601                	li	a2,0
    8000827c:	85be                	mv	a1,a5
    8000827e:	fe843503          	ld	a0,-24(s0)
    80008282:	ffffe097          	auipc	ra,0xffffe
    80008286:	aa2080e7          	jalr	-1374(ra) # 80005d24 <dirlookup>
    8000828a:	fea43023          	sd	a0,-32(s0)
    8000828e:	fe043783          	ld	a5,-32(s0)
    80008292:	c3ad                	beqz	a5,800082f4 <create+0xca>
    iunlockput(dp);
    80008294:	fe843503          	ld	a0,-24(s0)
    80008298:	ffffd097          	auipc	ra,0xffffd
    8000829c:	3e8080e7          	jalr	1000(ra) # 80005680 <iunlockput>
    ilock(ip);
    800082a0:	fe043503          	ld	a0,-32(s0)
    800082a4:	ffffd097          	auipc	ra,0xffffd
    800082a8:	17e080e7          	jalr	382(ra) # 80005422 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    800082ac:	fc641783          	lh	a5,-58(s0)
    800082b0:	0007871b          	sext.w	a4,a5
    800082b4:	4789                	li	a5,2
    800082b6:	02f71763          	bne	a4,a5,800082e4 <create+0xba>
    800082ba:	fe043783          	ld	a5,-32(s0)
    800082be:	04479783          	lh	a5,68(a5)
    800082c2:	0007871b          	sext.w	a4,a5
    800082c6:	4789                	li	a5,2
    800082c8:	00f70b63          	beq	a4,a5,800082de <create+0xb4>
    800082cc:	fe043783          	ld	a5,-32(s0)
    800082d0:	04479783          	lh	a5,68(a5)
    800082d4:	0007871b          	sext.w	a4,a5
    800082d8:	478d                	li	a5,3
    800082da:	00f71563          	bne	a4,a5,800082e4 <create+0xba>
      return ip;
    800082de:	fe043783          	ld	a5,-32(s0)
    800082e2:	a2b1                	j	8000842e <create+0x204>
    iunlockput(ip);
    800082e4:	fe043503          	ld	a0,-32(s0)
    800082e8:	ffffd097          	auipc	ra,0xffffd
    800082ec:	398080e7          	jalr	920(ra) # 80005680 <iunlockput>
    return 0;
    800082f0:	4781                	li	a5,0
    800082f2:	aa35                	j	8000842e <create+0x204>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    800082f4:	fe843783          	ld	a5,-24(s0)
    800082f8:	439c                	lw	a5,0(a5)
    800082fa:	fc641703          	lh	a4,-58(s0)
    800082fe:	85ba                	mv	a1,a4
    80008300:	853e                	mv	a0,a5
    80008302:	ffffd097          	auipc	ra,0xffffd
    80008306:	dd4080e7          	jalr	-556(ra) # 800050d6 <ialloc>
    8000830a:	fea43023          	sd	a0,-32(s0)
    8000830e:	fe043783          	ld	a5,-32(s0)
    80008312:	eb89                	bnez	a5,80008324 <create+0xfa>
    panic("create: ialloc");
    80008314:	00003517          	auipc	a0,0x3
    80008318:	35c50513          	addi	a0,a0,860 # 8000b670 <etext+0x670>
    8000831c:	ffff9097          	auipc	ra,0xffff9
    80008320:	934080e7          	jalr	-1740(ra) # 80000c50 <panic>

  ilock(ip);
    80008324:	fe043503          	ld	a0,-32(s0)
    80008328:	ffffd097          	auipc	ra,0xffffd
    8000832c:	0fa080e7          	jalr	250(ra) # 80005422 <ilock>
  ip->major = major;
    80008330:	fe043783          	ld	a5,-32(s0)
    80008334:	fc445703          	lhu	a4,-60(s0)
    80008338:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    8000833c:	fe043783          	ld	a5,-32(s0)
    80008340:	fc245703          	lhu	a4,-62(s0)
    80008344:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80008348:	fe043783          	ld	a5,-32(s0)
    8000834c:	4705                	li	a4,1
    8000834e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008352:	fe043503          	ld	a0,-32(s0)
    80008356:	ffffd097          	auipc	ra,0xffffd
    8000835a:	e7c080e7          	jalr	-388(ra) # 800051d2 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    8000835e:	fc641783          	lh	a5,-58(s0)
    80008362:	0007871b          	sext.w	a4,a5
    80008366:	4785                	li	a5,1
    80008368:	08f71363          	bne	a4,a5,800083ee <create+0x1c4>
    dp->nlink++;  // for ".."
    8000836c:	fe843783          	ld	a5,-24(s0)
    80008370:	04a79783          	lh	a5,74(a5)
    80008374:	17c2                	slli	a5,a5,0x30
    80008376:	93c1                	srli	a5,a5,0x30
    80008378:	2785                	addiw	a5,a5,1
    8000837a:	17c2                	slli	a5,a5,0x30
    8000837c:	93c1                	srli	a5,a5,0x30
    8000837e:	0107971b          	slliw	a4,a5,0x10
    80008382:	4107571b          	sraiw	a4,a4,0x10
    80008386:	fe843783          	ld	a5,-24(s0)
    8000838a:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    8000838e:	fe843503          	ld	a0,-24(s0)
    80008392:	ffffd097          	auipc	ra,0xffffd
    80008396:	e40080e7          	jalr	-448(ra) # 800051d2 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    8000839a:	fe043783          	ld	a5,-32(s0)
    8000839e:	43dc                	lw	a5,4(a5)
    800083a0:	863e                	mv	a2,a5
    800083a2:	00003597          	auipc	a1,0x3
    800083a6:	29658593          	addi	a1,a1,662 # 8000b638 <etext+0x638>
    800083aa:	fe043503          	ld	a0,-32(s0)
    800083ae:	ffffe097          	auipc	ra,0xffffe
    800083b2:	a5e080e7          	jalr	-1442(ra) # 80005e0c <dirlink>
    800083b6:	87aa                	mv	a5,a0
    800083b8:	0207c363          	bltz	a5,800083de <create+0x1b4>
    800083bc:	fe843783          	ld	a5,-24(s0)
    800083c0:	43dc                	lw	a5,4(a5)
    800083c2:	863e                	mv	a2,a5
    800083c4:	00003597          	auipc	a1,0x3
    800083c8:	27c58593          	addi	a1,a1,636 # 8000b640 <etext+0x640>
    800083cc:	fe043503          	ld	a0,-32(s0)
    800083d0:	ffffe097          	auipc	ra,0xffffe
    800083d4:	a3c080e7          	jalr	-1476(ra) # 80005e0c <dirlink>
    800083d8:	87aa                	mv	a5,a0
    800083da:	0007da63          	bgez	a5,800083ee <create+0x1c4>
      panic("create dots");
    800083de:	00003517          	auipc	a0,0x3
    800083e2:	2a250513          	addi	a0,a0,674 # 8000b680 <etext+0x680>
    800083e6:	ffff9097          	auipc	ra,0xffff9
    800083ea:	86a080e7          	jalr	-1942(ra) # 80000c50 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    800083ee:	fe043783          	ld	a5,-32(s0)
    800083f2:	43d8                	lw	a4,4(a5)
    800083f4:	fd040793          	addi	a5,s0,-48
    800083f8:	863a                	mv	a2,a4
    800083fa:	85be                	mv	a1,a5
    800083fc:	fe843503          	ld	a0,-24(s0)
    80008400:	ffffe097          	auipc	ra,0xffffe
    80008404:	a0c080e7          	jalr	-1524(ra) # 80005e0c <dirlink>
    80008408:	87aa                	mv	a5,a0
    8000840a:	0007da63          	bgez	a5,8000841e <create+0x1f4>
    panic("create: dirlink");
    8000840e:	00003517          	auipc	a0,0x3
    80008412:	28250513          	addi	a0,a0,642 # 8000b690 <etext+0x690>
    80008416:	ffff9097          	auipc	ra,0xffff9
    8000841a:	83a080e7          	jalr	-1990(ra) # 80000c50 <panic>

  iunlockput(dp);
    8000841e:	fe843503          	ld	a0,-24(s0)
    80008422:	ffffd097          	auipc	ra,0xffffd
    80008426:	25e080e7          	jalr	606(ra) # 80005680 <iunlockput>

  return ip;
    8000842a:	fe043783          	ld	a5,-32(s0)
}
    8000842e:	853e                	mv	a0,a5
    80008430:	70e2                	ld	ra,56(sp)
    80008432:	7442                	ld	s0,48(sp)
    80008434:	6121                	addi	sp,sp,64
    80008436:	8082                	ret

0000000080008438 <sys_open>:

uint64
sys_open(void)
{
    80008438:	7131                	addi	sp,sp,-192
    8000843a:	fd06                	sd	ra,184(sp)
    8000843c:	f922                	sd	s0,176(sp)
    8000843e:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    80008440:	f5040793          	addi	a5,s0,-176
    80008444:	08000613          	li	a2,128
    80008448:	85be                	mv	a1,a5
    8000844a:	4501                	li	a0,0
    8000844c:	ffffc097          	auipc	ra,0xffffc
    80008450:	054080e7          	jalr	84(ra) # 800044a0 <argstr>
    80008454:	87aa                	mv	a5,a0
    80008456:	fef42223          	sw	a5,-28(s0)
    8000845a:	fe442783          	lw	a5,-28(s0)
    8000845e:	2781                	sext.w	a5,a5
    80008460:	0007cd63          	bltz	a5,8000847a <sys_open+0x42>
    80008464:	f4c40793          	addi	a5,s0,-180
    80008468:	85be                	mv	a1,a5
    8000846a:	4505                	li	a0,1
    8000846c:	ffffc097          	auipc	ra,0xffffc
    80008470:	fc8080e7          	jalr	-56(ra) # 80004434 <argint>
    80008474:	87aa                	mv	a5,a0
    80008476:	0007d463          	bgez	a5,8000847e <sys_open+0x46>
    return -1;
    8000847a:	57fd                	li	a5,-1
    8000847c:	a429                	j	80008686 <sys_open+0x24e>

  begin_op();
    8000847e:	ffffe097          	auipc	ra,0xffffe
    80008482:	010080e7          	jalr	16(ra) # 8000648e <begin_op>

  if(omode & O_CREATE){
    80008486:	f4c42783          	lw	a5,-180(s0)
    8000848a:	2007f793          	andi	a5,a5,512
    8000848e:	2781                	sext.w	a5,a5
    80008490:	c795                	beqz	a5,800084bc <sys_open+0x84>
    ip = create(path, T_FILE, 0, 0);
    80008492:	f5040793          	addi	a5,s0,-176
    80008496:	4681                	li	a3,0
    80008498:	4601                	li	a2,0
    8000849a:	4589                	li	a1,2
    8000849c:	853e                	mv	a0,a5
    8000849e:	00000097          	auipc	ra,0x0
    800084a2:	d8c080e7          	jalr	-628(ra) # 8000822a <create>
    800084a6:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800084aa:	fe843783          	ld	a5,-24(s0)
    800084ae:	e7bd                	bnez	a5,8000851c <sys_open+0xe4>
      end_op();
    800084b0:	ffffe097          	auipc	ra,0xffffe
    800084b4:	0a0080e7          	jalr	160(ra) # 80006550 <end_op>
      return -1;
    800084b8:	57fd                	li	a5,-1
    800084ba:	a2f1                	j	80008686 <sys_open+0x24e>
    }
  } else {
    if((ip = namei(path)) == 0){
    800084bc:	f5040793          	addi	a5,s0,-176
    800084c0:	853e                	mv	a0,a5
    800084c2:	ffffe097          	auipc	ra,0xffffe
    800084c6:	c68080e7          	jalr	-920(ra) # 8000612a <namei>
    800084ca:	fea43423          	sd	a0,-24(s0)
    800084ce:	fe843783          	ld	a5,-24(s0)
    800084d2:	e799                	bnez	a5,800084e0 <sys_open+0xa8>
      end_op();
    800084d4:	ffffe097          	auipc	ra,0xffffe
    800084d8:	07c080e7          	jalr	124(ra) # 80006550 <end_op>
      return -1;
    800084dc:	57fd                	li	a5,-1
    800084de:	a265                	j	80008686 <sys_open+0x24e>
    }
    ilock(ip);
    800084e0:	fe843503          	ld	a0,-24(s0)
    800084e4:	ffffd097          	auipc	ra,0xffffd
    800084e8:	f3e080e7          	jalr	-194(ra) # 80005422 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    800084ec:	fe843783          	ld	a5,-24(s0)
    800084f0:	04479783          	lh	a5,68(a5)
    800084f4:	0007871b          	sext.w	a4,a5
    800084f8:	4785                	li	a5,1
    800084fa:	02f71163          	bne	a4,a5,8000851c <sys_open+0xe4>
    800084fe:	f4c42783          	lw	a5,-180(s0)
    80008502:	cf89                	beqz	a5,8000851c <sys_open+0xe4>
      iunlockput(ip);
    80008504:	fe843503          	ld	a0,-24(s0)
    80008508:	ffffd097          	auipc	ra,0xffffd
    8000850c:	178080e7          	jalr	376(ra) # 80005680 <iunlockput>
      end_op();
    80008510:	ffffe097          	auipc	ra,0xffffe
    80008514:	040080e7          	jalr	64(ra) # 80006550 <end_op>
      return -1;
    80008518:	57fd                	li	a5,-1
    8000851a:	a2b5                	j	80008686 <sys_open+0x24e>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    8000851c:	fe843783          	ld	a5,-24(s0)
    80008520:	04479783          	lh	a5,68(a5)
    80008524:	0007871b          	sext.w	a4,a5
    80008528:	478d                	li	a5,3
    8000852a:	02f71e63          	bne	a4,a5,80008566 <sys_open+0x12e>
    8000852e:	fe843783          	ld	a5,-24(s0)
    80008532:	04679783          	lh	a5,70(a5)
    80008536:	2781                	sext.w	a5,a5
    80008538:	0007cb63          	bltz	a5,8000854e <sys_open+0x116>
    8000853c:	fe843783          	ld	a5,-24(s0)
    80008540:	04679783          	lh	a5,70(a5)
    80008544:	0007871b          	sext.w	a4,a5
    80008548:	47a5                	li	a5,9
    8000854a:	00e7de63          	bge	a5,a4,80008566 <sys_open+0x12e>
    iunlockput(ip);
    8000854e:	fe843503          	ld	a0,-24(s0)
    80008552:	ffffd097          	auipc	ra,0xffffd
    80008556:	12e080e7          	jalr	302(ra) # 80005680 <iunlockput>
    end_op();
    8000855a:	ffffe097          	auipc	ra,0xffffe
    8000855e:	ff6080e7          	jalr	-10(ra) # 80006550 <end_op>
    return -1;
    80008562:	57fd                	li	a5,-1
    80008564:	a20d                	j	80008686 <sys_open+0x24e>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008566:	ffffe097          	auipc	ra,0xffffe
    8000856a:	4d8080e7          	jalr	1240(ra) # 80006a3e <filealloc>
    8000856e:	fca43c23          	sd	a0,-40(s0)
    80008572:	fd843783          	ld	a5,-40(s0)
    80008576:	cf99                	beqz	a5,80008594 <sys_open+0x15c>
    80008578:	fd843503          	ld	a0,-40(s0)
    8000857c:	fffff097          	auipc	ra,0xfffff
    80008580:	5e2080e7          	jalr	1506(ra) # 80007b5e <fdalloc>
    80008584:	87aa                	mv	a5,a0
    80008586:	fcf42a23          	sw	a5,-44(s0)
    8000858a:	fd442783          	lw	a5,-44(s0)
    8000858e:	2781                	sext.w	a5,a5
    80008590:	0207d763          	bgez	a5,800085be <sys_open+0x186>
    if(f)
    80008594:	fd843783          	ld	a5,-40(s0)
    80008598:	c799                	beqz	a5,800085a6 <sys_open+0x16e>
      fileclose(f);
    8000859a:	fd843503          	ld	a0,-40(s0)
    8000859e:	ffffe097          	auipc	ra,0xffffe
    800085a2:	58a080e7          	jalr	1418(ra) # 80006b28 <fileclose>
    iunlockput(ip);
    800085a6:	fe843503          	ld	a0,-24(s0)
    800085aa:	ffffd097          	auipc	ra,0xffffd
    800085ae:	0d6080e7          	jalr	214(ra) # 80005680 <iunlockput>
    end_op();
    800085b2:	ffffe097          	auipc	ra,0xffffe
    800085b6:	f9e080e7          	jalr	-98(ra) # 80006550 <end_op>
    return -1;
    800085ba:	57fd                	li	a5,-1
    800085bc:	a0e9                	j	80008686 <sys_open+0x24e>
  }

  if(ip->type == T_DEVICE){
    800085be:	fe843783          	ld	a5,-24(s0)
    800085c2:	04479783          	lh	a5,68(a5)
    800085c6:	0007871b          	sext.w	a4,a5
    800085ca:	478d                	li	a5,3
    800085cc:	00f71f63          	bne	a4,a5,800085ea <sys_open+0x1b2>
    f->type = FD_DEVICE;
    800085d0:	fd843783          	ld	a5,-40(s0)
    800085d4:	470d                	li	a4,3
    800085d6:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800085d8:	fe843783          	ld	a5,-24(s0)
    800085dc:	04679703          	lh	a4,70(a5)
    800085e0:	fd843783          	ld	a5,-40(s0)
    800085e4:	02e79223          	sh	a4,36(a5)
    800085e8:	a809                	j	800085fa <sys_open+0x1c2>
  } else {
    f->type = FD_INODE;
    800085ea:	fd843783          	ld	a5,-40(s0)
    800085ee:	4709                	li	a4,2
    800085f0:	c398                	sw	a4,0(a5)
    f->off = 0;
    800085f2:	fd843783          	ld	a5,-40(s0)
    800085f6:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    800085fa:	fd843783          	ld	a5,-40(s0)
    800085fe:	fe843703          	ld	a4,-24(s0)
    80008602:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    80008604:	f4c42783          	lw	a5,-180(s0)
    80008608:	8b85                	andi	a5,a5,1
    8000860a:	2781                	sext.w	a5,a5
    8000860c:	0017b793          	seqz	a5,a5
    80008610:	0ff7f793          	andi	a5,a5,255
    80008614:	873e                	mv	a4,a5
    80008616:	fd843783          	ld	a5,-40(s0)
    8000861a:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    8000861e:	f4c42783          	lw	a5,-180(s0)
    80008622:	8b85                	andi	a5,a5,1
    80008624:	2781                	sext.w	a5,a5
    80008626:	e791                	bnez	a5,80008632 <sys_open+0x1fa>
    80008628:	f4c42783          	lw	a5,-180(s0)
    8000862c:	8b89                	andi	a5,a5,2
    8000862e:	2781                	sext.w	a5,a5
    80008630:	c399                	beqz	a5,80008636 <sys_open+0x1fe>
    80008632:	4785                	li	a5,1
    80008634:	a011                	j	80008638 <sys_open+0x200>
    80008636:	4781                	li	a5,0
    80008638:	0ff7f713          	andi	a4,a5,255
    8000863c:	fd843783          	ld	a5,-40(s0)
    80008640:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    80008644:	f4c42783          	lw	a5,-180(s0)
    80008648:	4007f793          	andi	a5,a5,1024
    8000864c:	2781                	sext.w	a5,a5
    8000864e:	c385                	beqz	a5,8000866e <sys_open+0x236>
    80008650:	fe843783          	ld	a5,-24(s0)
    80008654:	04479783          	lh	a5,68(a5)
    80008658:	0007871b          	sext.w	a4,a5
    8000865c:	4789                	li	a5,2
    8000865e:	00f71863          	bne	a4,a5,8000866e <sys_open+0x236>
    itrunc(ip);
    80008662:	fe843503          	ld	a0,-24(s0)
    80008666:	ffffd097          	auipc	ra,0xffffd
    8000866a:	1a4080e7          	jalr	420(ra) # 8000580a <itrunc>
  }

  iunlock(ip);
    8000866e:	fe843503          	ld	a0,-24(s0)
    80008672:	ffffd097          	auipc	ra,0xffffd
    80008676:	ee4080e7          	jalr	-284(ra) # 80005556 <iunlock>
  end_op();
    8000867a:	ffffe097          	auipc	ra,0xffffe
    8000867e:	ed6080e7          	jalr	-298(ra) # 80006550 <end_op>

  return fd;
    80008682:	fd442783          	lw	a5,-44(s0)
}
    80008686:	853e                	mv	a0,a5
    80008688:	70ea                	ld	ra,184(sp)
    8000868a:	744a                	ld	s0,176(sp)
    8000868c:	6129                	addi	sp,sp,192
    8000868e:	8082                	ret

0000000080008690 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008690:	7135                	addi	sp,sp,-160
    80008692:	ed06                	sd	ra,152(sp)
    80008694:	e922                	sd	s0,144(sp)
    80008696:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    80008698:	ffffe097          	auipc	ra,0xffffe
    8000869c:	df6080e7          	jalr	-522(ra) # 8000648e <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800086a0:	f6840793          	addi	a5,s0,-152
    800086a4:	08000613          	li	a2,128
    800086a8:	85be                	mv	a1,a5
    800086aa:	4501                	li	a0,0
    800086ac:	ffffc097          	auipc	ra,0xffffc
    800086b0:	df4080e7          	jalr	-524(ra) # 800044a0 <argstr>
    800086b4:	87aa                	mv	a5,a0
    800086b6:	0207c163          	bltz	a5,800086d8 <sys_mkdir+0x48>
    800086ba:	f6840793          	addi	a5,s0,-152
    800086be:	4681                	li	a3,0
    800086c0:	4601                	li	a2,0
    800086c2:	4585                	li	a1,1
    800086c4:	853e                	mv	a0,a5
    800086c6:	00000097          	auipc	ra,0x0
    800086ca:	b64080e7          	jalr	-1180(ra) # 8000822a <create>
    800086ce:	fea43423          	sd	a0,-24(s0)
    800086d2:	fe843783          	ld	a5,-24(s0)
    800086d6:	e799                	bnez	a5,800086e4 <sys_mkdir+0x54>
    end_op();
    800086d8:	ffffe097          	auipc	ra,0xffffe
    800086dc:	e78080e7          	jalr	-392(ra) # 80006550 <end_op>
    return -1;
    800086e0:	57fd                	li	a5,-1
    800086e2:	a821                	j	800086fa <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800086e4:	fe843503          	ld	a0,-24(s0)
    800086e8:	ffffd097          	auipc	ra,0xffffd
    800086ec:	f98080e7          	jalr	-104(ra) # 80005680 <iunlockput>
  end_op();
    800086f0:	ffffe097          	auipc	ra,0xffffe
    800086f4:	e60080e7          	jalr	-416(ra) # 80006550 <end_op>
  return 0;
    800086f8:	4781                	li	a5,0
}
    800086fa:	853e                	mv	a0,a5
    800086fc:	60ea                	ld	ra,152(sp)
    800086fe:	644a                	ld	s0,144(sp)
    80008700:	610d                	addi	sp,sp,160
    80008702:	8082                	ret

0000000080008704 <sys_mknod>:

uint64
sys_mknod(void)
{
    80008704:	7135                	addi	sp,sp,-160
    80008706:	ed06                	sd	ra,152(sp)
    80008708:	e922                	sd	s0,144(sp)
    8000870a:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    8000870c:	ffffe097          	auipc	ra,0xffffe
    80008710:	d82080e7          	jalr	-638(ra) # 8000648e <begin_op>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008714:	f6840793          	addi	a5,s0,-152
    80008718:	08000613          	li	a2,128
    8000871c:	85be                	mv	a1,a5
    8000871e:	4501                	li	a0,0
    80008720:	ffffc097          	auipc	ra,0xffffc
    80008724:	d80080e7          	jalr	-640(ra) # 800044a0 <argstr>
    80008728:	87aa                	mv	a5,a0
    8000872a:	0607c263          	bltz	a5,8000878e <sys_mknod+0x8a>
     argint(1, &major) < 0 ||
    8000872e:	f6440793          	addi	a5,s0,-156
    80008732:	85be                	mv	a1,a5
    80008734:	4505                	li	a0,1
    80008736:	ffffc097          	auipc	ra,0xffffc
    8000873a:	cfe080e7          	jalr	-770(ra) # 80004434 <argint>
    8000873e:	87aa                	mv	a5,a0
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008740:	0407c763          	bltz	a5,8000878e <sys_mknod+0x8a>
     argint(2, &minor) < 0 ||
    80008744:	f6040793          	addi	a5,s0,-160
    80008748:	85be                	mv	a1,a5
    8000874a:	4509                	li	a0,2
    8000874c:	ffffc097          	auipc	ra,0xffffc
    80008750:	ce8080e7          	jalr	-792(ra) # 80004434 <argint>
    80008754:	87aa                	mv	a5,a0
     argint(1, &major) < 0 ||
    80008756:	0207cc63          	bltz	a5,8000878e <sys_mknod+0x8a>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    8000875a:	f6442783          	lw	a5,-156(s0)
    8000875e:	0107971b          	slliw	a4,a5,0x10
    80008762:	4107571b          	sraiw	a4,a4,0x10
    80008766:	f6042783          	lw	a5,-160(s0)
    8000876a:	0107969b          	slliw	a3,a5,0x10
    8000876e:	4106d69b          	sraiw	a3,a3,0x10
    80008772:	f6840793          	addi	a5,s0,-152
    80008776:	863a                	mv	a2,a4
    80008778:	458d                	li	a1,3
    8000877a:	853e                	mv	a0,a5
    8000877c:	00000097          	auipc	ra,0x0
    80008780:	aae080e7          	jalr	-1362(ra) # 8000822a <create>
    80008784:	fea43423          	sd	a0,-24(s0)
     argint(2, &minor) < 0 ||
    80008788:	fe843783          	ld	a5,-24(s0)
    8000878c:	e799                	bnez	a5,8000879a <sys_mknod+0x96>
    end_op();
    8000878e:	ffffe097          	auipc	ra,0xffffe
    80008792:	dc2080e7          	jalr	-574(ra) # 80006550 <end_op>
    return -1;
    80008796:	57fd                	li	a5,-1
    80008798:	a821                	j	800087b0 <sys_mknod+0xac>
  }
  iunlockput(ip);
    8000879a:	fe843503          	ld	a0,-24(s0)
    8000879e:	ffffd097          	auipc	ra,0xffffd
    800087a2:	ee2080e7          	jalr	-286(ra) # 80005680 <iunlockput>
  end_op();
    800087a6:	ffffe097          	auipc	ra,0xffffe
    800087aa:	daa080e7          	jalr	-598(ra) # 80006550 <end_op>
  return 0;
    800087ae:	4781                	li	a5,0
}
    800087b0:	853e                	mv	a0,a5
    800087b2:	60ea                	ld	ra,152(sp)
    800087b4:	644a                	ld	s0,144(sp)
    800087b6:	610d                	addi	sp,sp,160
    800087b8:	8082                	ret

00000000800087ba <sys_chdir>:

uint64
sys_chdir(void)
{
    800087ba:	7135                	addi	sp,sp,-160
    800087bc:	ed06                	sd	ra,152(sp)
    800087be:	e922                	sd	s0,144(sp)
    800087c0:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800087c2:	ffffa097          	auipc	ra,0xffffa
    800087c6:	034080e7          	jalr	52(ra) # 800027f6 <myproc>
    800087ca:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800087ce:	ffffe097          	auipc	ra,0xffffe
    800087d2:	cc0080e7          	jalr	-832(ra) # 8000648e <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800087d6:	f6040793          	addi	a5,s0,-160
    800087da:	08000613          	li	a2,128
    800087de:	85be                	mv	a1,a5
    800087e0:	4501                	li	a0,0
    800087e2:	ffffc097          	auipc	ra,0xffffc
    800087e6:	cbe080e7          	jalr	-834(ra) # 800044a0 <argstr>
    800087ea:	87aa                	mv	a5,a0
    800087ec:	0007ce63          	bltz	a5,80008808 <sys_chdir+0x4e>
    800087f0:	f6040793          	addi	a5,s0,-160
    800087f4:	853e                	mv	a0,a5
    800087f6:	ffffe097          	auipc	ra,0xffffe
    800087fa:	934080e7          	jalr	-1740(ra) # 8000612a <namei>
    800087fe:	fea43023          	sd	a0,-32(s0)
    80008802:	fe043783          	ld	a5,-32(s0)
    80008806:	e799                	bnez	a5,80008814 <sys_chdir+0x5a>
    end_op();
    80008808:	ffffe097          	auipc	ra,0xffffe
    8000880c:	d48080e7          	jalr	-696(ra) # 80006550 <end_op>
    return -1;
    80008810:	57fd                	li	a5,-1
    80008812:	a895                	j	80008886 <sys_chdir+0xcc>
  }
  ilock(ip);
    80008814:	fe043503          	ld	a0,-32(s0)
    80008818:	ffffd097          	auipc	ra,0xffffd
    8000881c:	c0a080e7          	jalr	-1014(ra) # 80005422 <ilock>
  if(ip->type != T_DIR){
    80008820:	fe043783          	ld	a5,-32(s0)
    80008824:	04479783          	lh	a5,68(a5)
    80008828:	0007871b          	sext.w	a4,a5
    8000882c:	4785                	li	a5,1
    8000882e:	00f70e63          	beq	a4,a5,8000884a <sys_chdir+0x90>
    iunlockput(ip);
    80008832:	fe043503          	ld	a0,-32(s0)
    80008836:	ffffd097          	auipc	ra,0xffffd
    8000883a:	e4a080e7          	jalr	-438(ra) # 80005680 <iunlockput>
    end_op();
    8000883e:	ffffe097          	auipc	ra,0xffffe
    80008842:	d12080e7          	jalr	-750(ra) # 80006550 <end_op>
    return -1;
    80008846:	57fd                	li	a5,-1
    80008848:	a83d                	j	80008886 <sys_chdir+0xcc>
  }
  iunlock(ip);
    8000884a:	fe043503          	ld	a0,-32(s0)
    8000884e:	ffffd097          	auipc	ra,0xffffd
    80008852:	d08080e7          	jalr	-760(ra) # 80005556 <iunlock>
  iput(p->cwd);
    80008856:	fe843703          	ld	a4,-24(s0)
    8000885a:	6785                	lui	a5,0x1
    8000885c:	97ba                	add	a5,a5,a4
    8000885e:	3b87b783          	ld	a5,952(a5) # 13b8 <_entry-0x7fffec48>
    80008862:	853e                	mv	a0,a5
    80008864:	ffffd097          	auipc	ra,0xffffd
    80008868:	d4c080e7          	jalr	-692(ra) # 800055b0 <iput>
  end_op();
    8000886c:	ffffe097          	auipc	ra,0xffffe
    80008870:	ce4080e7          	jalr	-796(ra) # 80006550 <end_op>
  p->cwd = ip;
    80008874:	fe843703          	ld	a4,-24(s0)
    80008878:	6785                	lui	a5,0x1
    8000887a:	97ba                	add	a5,a5,a4
    8000887c:	fe043703          	ld	a4,-32(s0)
    80008880:	3ae7bc23          	sd	a4,952(a5) # 13b8 <_entry-0x7fffec48>
  return 0;
    80008884:	4781                	li	a5,0
}
    80008886:	853e                	mv	a0,a5
    80008888:	60ea                	ld	ra,152(sp)
    8000888a:	644a                	ld	s0,144(sp)
    8000888c:	610d                	addi	sp,sp,160
    8000888e:	8082                	ret

0000000080008890 <sys_exec>:

uint64
sys_exec(void)
{
    80008890:	7161                	addi	sp,sp,-432
    80008892:	f706                	sd	ra,424(sp)
    80008894:	f322                	sd	s0,416(sp)
    80008896:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    80008898:	f6840793          	addi	a5,s0,-152
    8000889c:	08000613          	li	a2,128
    800088a0:	85be                	mv	a1,a5
    800088a2:	4501                	li	a0,0
    800088a4:	ffffc097          	auipc	ra,0xffffc
    800088a8:	bfc080e7          	jalr	-1028(ra) # 800044a0 <argstr>
    800088ac:	87aa                	mv	a5,a0
    800088ae:	0007cd63          	bltz	a5,800088c8 <sys_exec+0x38>
    800088b2:	e6040793          	addi	a5,s0,-416
    800088b6:	85be                	mv	a1,a5
    800088b8:	4505                	li	a0,1
    800088ba:	ffffc097          	auipc	ra,0xffffc
    800088be:	bb2080e7          	jalr	-1102(ra) # 8000446c <argaddr>
    800088c2:	87aa                	mv	a5,a0
    800088c4:	0007d463          	bgez	a5,800088cc <sys_exec+0x3c>
    return -1;
    800088c8:	57fd                	li	a5,-1
    800088ca:	a249                	j	80008a4c <sys_exec+0x1bc>
  }
  memset(argv, 0, sizeof(argv));
    800088cc:	e6840793          	addi	a5,s0,-408
    800088d0:	10000613          	li	a2,256
    800088d4:	4581                	li	a1,0
    800088d6:	853e                	mv	a0,a5
    800088d8:	ffff9097          	auipc	ra,0xffff9
    800088dc:	b7a080e7          	jalr	-1158(ra) # 80001452 <memset>
  for(i=0;; i++){
    800088e0:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    800088e4:	fec42783          	lw	a5,-20(s0)
    800088e8:	873e                	mv	a4,a5
    800088ea:	47fd                	li	a5,31
    800088ec:	10e7e463          	bltu	a5,a4,800089f4 <sys_exec+0x164>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    800088f0:	fec42783          	lw	a5,-20(s0)
    800088f4:	00379713          	slli	a4,a5,0x3
    800088f8:	e6043783          	ld	a5,-416(s0)
    800088fc:	97ba                	add	a5,a5,a4
    800088fe:	e5840713          	addi	a4,s0,-424
    80008902:	85ba                	mv	a1,a4
    80008904:	853e                	mv	a0,a5
    80008906:	ffffc097          	auipc	ra,0xffffc
    8000890a:	974080e7          	jalr	-1676(ra) # 8000427a <fetchaddr>
    8000890e:	87aa                	mv	a5,a0
    80008910:	0e07c463          	bltz	a5,800089f8 <sys_exec+0x168>
      goto bad;
    }
    if(uarg == 0){
    80008914:	e5843783          	ld	a5,-424(s0)
    80008918:	eb95                	bnez	a5,8000894c <sys_exec+0xbc>
      argv[i] = 0;
    8000891a:	fec42783          	lw	a5,-20(s0)
    8000891e:	078e                	slli	a5,a5,0x3
    80008920:	ff040713          	addi	a4,s0,-16
    80008924:	97ba                	add	a5,a5,a4
    80008926:	e607bc23          	sd	zero,-392(a5)
      break;
    8000892a:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    8000892c:	e6840713          	addi	a4,s0,-408
    80008930:	f6840793          	addi	a5,s0,-152
    80008934:	85ba                	mv	a1,a4
    80008936:	853e                	mv	a0,a5
    80008938:	fffff097          	auipc	ra,0xfffff
    8000893c:	bc0080e7          	jalr	-1088(ra) # 800074f8 <exec>
    80008940:	87aa                	mv	a5,a0
    80008942:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008946:	fe042623          	sw	zero,-20(s0)
    8000894a:	a059                	j	800089d0 <sys_exec+0x140>
    argv[i] = kalloc();
    8000894c:	ffff8097          	auipc	ra,0xffff8
    80008950:	7de080e7          	jalr	2014(ra) # 8000112a <kalloc>
    80008954:	872a                	mv	a4,a0
    80008956:	fec42783          	lw	a5,-20(s0)
    8000895a:	078e                	slli	a5,a5,0x3
    8000895c:	ff040693          	addi	a3,s0,-16
    80008960:	97b6                	add	a5,a5,a3
    80008962:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008966:	fec42783          	lw	a5,-20(s0)
    8000896a:	078e                	slli	a5,a5,0x3
    8000896c:	ff040713          	addi	a4,s0,-16
    80008970:	97ba                	add	a5,a5,a4
    80008972:	e787b783          	ld	a5,-392(a5)
    80008976:	c3d9                	beqz	a5,800089fc <sys_exec+0x16c>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008978:	e5843703          	ld	a4,-424(s0)
    8000897c:	fec42783          	lw	a5,-20(s0)
    80008980:	078e                	slli	a5,a5,0x3
    80008982:	ff040693          	addi	a3,s0,-16
    80008986:	97b6                	add	a5,a5,a3
    80008988:	e787b783          	ld	a5,-392(a5)
    8000898c:	6605                	lui	a2,0x1
    8000898e:	85be                	mv	a1,a5
    80008990:	853a                	mv	a0,a4
    80008992:	ffffc097          	auipc	ra,0xffffc
    80008996:	968080e7          	jalr	-1688(ra) # 800042fa <fetchstr>
    8000899a:	87aa                	mv	a5,a0
    8000899c:	0607c263          	bltz	a5,80008a00 <sys_exec+0x170>
  for(i=0;; i++){
    800089a0:	fec42783          	lw	a5,-20(s0)
    800089a4:	2785                	addiw	a5,a5,1
    800089a6:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    800089aa:	bf2d                	j	800088e4 <sys_exec+0x54>
    kfree(argv[i]);
    800089ac:	fec42783          	lw	a5,-20(s0)
    800089b0:	078e                	slli	a5,a5,0x3
    800089b2:	ff040713          	addi	a4,s0,-16
    800089b6:	97ba                	add	a5,a5,a4
    800089b8:	e787b783          	ld	a5,-392(a5)
    800089bc:	853e                	mv	a0,a5
    800089be:	ffff8097          	auipc	ra,0xffff8
    800089c2:	6c8080e7          	jalr	1736(ra) # 80001086 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800089c6:	fec42783          	lw	a5,-20(s0)
    800089ca:	2785                	addiw	a5,a5,1
    800089cc:	fef42623          	sw	a5,-20(s0)
    800089d0:	fec42783          	lw	a5,-20(s0)
    800089d4:	873e                	mv	a4,a5
    800089d6:	47fd                	li	a5,31
    800089d8:	00e7eb63          	bltu	a5,a4,800089ee <sys_exec+0x15e>
    800089dc:	fec42783          	lw	a5,-20(s0)
    800089e0:	078e                	slli	a5,a5,0x3
    800089e2:	ff040713          	addi	a4,s0,-16
    800089e6:	97ba                	add	a5,a5,a4
    800089e8:	e787b783          	ld	a5,-392(a5)
    800089ec:	f3e1                	bnez	a5,800089ac <sys_exec+0x11c>

  return ret;
    800089ee:	fe842783          	lw	a5,-24(s0)
    800089f2:	a8a9                	j	80008a4c <sys_exec+0x1bc>
      goto bad;
    800089f4:	0001                	nop
    800089f6:	a031                	j	80008a02 <sys_exec+0x172>
      goto bad;
    800089f8:	0001                	nop
    800089fa:	a021                	j	80008a02 <sys_exec+0x172>
      goto bad;
    800089fc:	0001                	nop
    800089fe:	a011                	j	80008a02 <sys_exec+0x172>
      goto bad;
    80008a00:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008a02:	fe042623          	sw	zero,-20(s0)
    80008a06:	a01d                	j	80008a2c <sys_exec+0x19c>
    kfree(argv[i]);
    80008a08:	fec42783          	lw	a5,-20(s0)
    80008a0c:	078e                	slli	a5,a5,0x3
    80008a0e:	ff040713          	addi	a4,s0,-16
    80008a12:	97ba                	add	a5,a5,a4
    80008a14:	e787b783          	ld	a5,-392(a5)
    80008a18:	853e                	mv	a0,a5
    80008a1a:	ffff8097          	auipc	ra,0xffff8
    80008a1e:	66c080e7          	jalr	1644(ra) # 80001086 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008a22:	fec42783          	lw	a5,-20(s0)
    80008a26:	2785                	addiw	a5,a5,1
    80008a28:	fef42623          	sw	a5,-20(s0)
    80008a2c:	fec42783          	lw	a5,-20(s0)
    80008a30:	873e                	mv	a4,a5
    80008a32:	47fd                	li	a5,31
    80008a34:	00e7eb63          	bltu	a5,a4,80008a4a <sys_exec+0x1ba>
    80008a38:	fec42783          	lw	a5,-20(s0)
    80008a3c:	078e                	slli	a5,a5,0x3
    80008a3e:	ff040713          	addi	a4,s0,-16
    80008a42:	97ba                	add	a5,a5,a4
    80008a44:	e787b783          	ld	a5,-392(a5)
    80008a48:	f3e1                	bnez	a5,80008a08 <sys_exec+0x178>
  return -1;
    80008a4a:	57fd                	li	a5,-1
}
    80008a4c:	853e                	mv	a0,a5
    80008a4e:	70ba                	ld	ra,424(sp)
    80008a50:	741a                	ld	s0,416(sp)
    80008a52:	615d                	addi	sp,sp,432
    80008a54:	8082                	ret

0000000080008a56 <sys_pipe>:

uint64
sys_pipe(void)
{
    80008a56:	7139                	addi	sp,sp,-64
    80008a58:	fc06                	sd	ra,56(sp)
    80008a5a:	f822                	sd	s0,48(sp)
    80008a5c:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008a5e:	ffffa097          	auipc	ra,0xffffa
    80008a62:	d98080e7          	jalr	-616(ra) # 800027f6 <myproc>
    80008a66:	fea43423          	sd	a0,-24(s0)

  if(argaddr(0, &fdarray) < 0)
    80008a6a:	fe040793          	addi	a5,s0,-32
    80008a6e:	85be                	mv	a1,a5
    80008a70:	4501                	li	a0,0
    80008a72:	ffffc097          	auipc	ra,0xffffc
    80008a76:	9fa080e7          	jalr	-1542(ra) # 8000446c <argaddr>
    80008a7a:	87aa                	mv	a5,a0
    80008a7c:	0007d463          	bgez	a5,80008a84 <sys_pipe+0x2e>
    return -1;
    80008a80:	57fd                	li	a5,-1
    80008a82:	aa1d                	j	80008bb8 <sys_pipe+0x162>
  if(pipealloc(&rf, &wf) < 0)
    80008a84:	fd040713          	addi	a4,s0,-48
    80008a88:	fd840793          	addi	a5,s0,-40
    80008a8c:	85ba                	mv	a1,a4
    80008a8e:	853e                	mv	a0,a5
    80008a90:	ffffe097          	auipc	ra,0xffffe
    80008a94:	5ce080e7          	jalr	1486(ra) # 8000705e <pipealloc>
    80008a98:	87aa                	mv	a5,a0
    80008a9a:	0007d463          	bgez	a5,80008aa2 <sys_pipe+0x4c>
    return -1;
    80008a9e:	57fd                	li	a5,-1
    80008aa0:	aa21                	j	80008bb8 <sys_pipe+0x162>
  fd0 = -1;
    80008aa2:	57fd                	li	a5,-1
    80008aa4:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008aa8:	fd843783          	ld	a5,-40(s0)
    80008aac:	853e                	mv	a0,a5
    80008aae:	fffff097          	auipc	ra,0xfffff
    80008ab2:	0b0080e7          	jalr	176(ra) # 80007b5e <fdalloc>
    80008ab6:	87aa                	mv	a5,a0
    80008ab8:	fcf42623          	sw	a5,-52(s0)
    80008abc:	fcc42783          	lw	a5,-52(s0)
    80008ac0:	0207c063          	bltz	a5,80008ae0 <sys_pipe+0x8a>
    80008ac4:	fd043783          	ld	a5,-48(s0)
    80008ac8:	853e                	mv	a0,a5
    80008aca:	fffff097          	auipc	ra,0xfffff
    80008ace:	094080e7          	jalr	148(ra) # 80007b5e <fdalloc>
    80008ad2:	87aa                	mv	a5,a0
    80008ad4:	fcf42423          	sw	a5,-56(s0)
    80008ad8:	fc842783          	lw	a5,-56(s0)
    80008adc:	0407d063          	bgez	a5,80008b1c <sys_pipe+0xc6>
    if(fd0 >= 0)
    80008ae0:	fcc42783          	lw	a5,-52(s0)
    80008ae4:	0007cc63          	bltz	a5,80008afc <sys_pipe+0xa6>
      p->ofile[fd0] = 0;
    80008ae8:	fcc42783          	lw	a5,-52(s0)
    80008aec:	fe843703          	ld	a4,-24(s0)
    80008af0:	26678793          	addi	a5,a5,614
    80008af4:	078e                	slli	a5,a5,0x3
    80008af6:	97ba                	add	a5,a5,a4
    80008af8:	0007b423          	sd	zero,8(a5)
    fileclose(rf);
    80008afc:	fd843783          	ld	a5,-40(s0)
    80008b00:	853e                	mv	a0,a5
    80008b02:	ffffe097          	auipc	ra,0xffffe
    80008b06:	026080e7          	jalr	38(ra) # 80006b28 <fileclose>
    fileclose(wf);
    80008b0a:	fd043783          	ld	a5,-48(s0)
    80008b0e:	853e                	mv	a0,a5
    80008b10:	ffffe097          	auipc	ra,0xffffe
    80008b14:	018080e7          	jalr	24(ra) # 80006b28 <fileclose>
    return -1;
    80008b18:	57fd                	li	a5,-1
    80008b1a:	a879                	j	80008bb8 <sys_pipe+0x162>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008b1c:	fe843703          	ld	a4,-24(s0)
    80008b20:	6785                	lui	a5,0x1
    80008b22:	97ba                	add	a5,a5,a4
    80008b24:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    80008b28:	fe043703          	ld	a4,-32(s0)
    80008b2c:	fcc40613          	addi	a2,s0,-52
    80008b30:	4691                	li	a3,4
    80008b32:	85ba                	mv	a1,a4
    80008b34:	853e                	mv	a0,a5
    80008b36:	ffff9097          	auipc	ra,0xffff9
    80008b3a:	79c080e7          	jalr	1948(ra) # 800022d2 <copyout>
    80008b3e:	87aa                	mv	a5,a0
    80008b40:	0207c763          	bltz	a5,80008b6e <sys_pipe+0x118>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008b44:	fe843703          	ld	a4,-24(s0)
    80008b48:	6785                	lui	a5,0x1
    80008b4a:	97ba                	add	a5,a5,a4
    80008b4c:	2b87b703          	ld	a4,696(a5) # 12b8 <_entry-0x7fffed48>
    80008b50:	fe043783          	ld	a5,-32(s0)
    80008b54:	0791                	addi	a5,a5,4
    80008b56:	fc840613          	addi	a2,s0,-56
    80008b5a:	4691                	li	a3,4
    80008b5c:	85be                	mv	a1,a5
    80008b5e:	853a                	mv	a0,a4
    80008b60:	ffff9097          	auipc	ra,0xffff9
    80008b64:	772080e7          	jalr	1906(ra) # 800022d2 <copyout>
    80008b68:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008b6a:	0407d663          	bgez	a5,80008bb6 <sys_pipe+0x160>
    p->ofile[fd0] = 0;
    80008b6e:	fcc42783          	lw	a5,-52(s0)
    80008b72:	fe843703          	ld	a4,-24(s0)
    80008b76:	26678793          	addi	a5,a5,614
    80008b7a:	078e                	slli	a5,a5,0x3
    80008b7c:	97ba                	add	a5,a5,a4
    80008b7e:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80008b82:	fc842783          	lw	a5,-56(s0)
    80008b86:	fe843703          	ld	a4,-24(s0)
    80008b8a:	26678793          	addi	a5,a5,614
    80008b8e:	078e                	slli	a5,a5,0x3
    80008b90:	97ba                	add	a5,a5,a4
    80008b92:	0007b423          	sd	zero,8(a5)
    fileclose(rf);
    80008b96:	fd843783          	ld	a5,-40(s0)
    80008b9a:	853e                	mv	a0,a5
    80008b9c:	ffffe097          	auipc	ra,0xffffe
    80008ba0:	f8c080e7          	jalr	-116(ra) # 80006b28 <fileclose>
    fileclose(wf);
    80008ba4:	fd043783          	ld	a5,-48(s0)
    80008ba8:	853e                	mv	a0,a5
    80008baa:	ffffe097          	auipc	ra,0xffffe
    80008bae:	f7e080e7          	jalr	-130(ra) # 80006b28 <fileclose>
    return -1;
    80008bb2:	57fd                	li	a5,-1
    80008bb4:	a011                	j	80008bb8 <sys_pipe+0x162>
  }
  return 0;
    80008bb6:	4781                	li	a5,0
}
    80008bb8:	853e                	mv	a0,a5
    80008bba:	70e2                	ld	ra,56(sp)
    80008bbc:	7442                	ld	s0,48(sp)
    80008bbe:	6121                	addi	sp,sp,64
    80008bc0:	8082                	ret
	...

0000000080008bd0 <kernelvec>:
    80008bd0:	7111                	addi	sp,sp,-256
    80008bd2:	e006                	sd	ra,0(sp)
    80008bd4:	e40a                	sd	sp,8(sp)
    80008bd6:	e80e                	sd	gp,16(sp)
    80008bd8:	ec12                	sd	tp,24(sp)
    80008bda:	f016                	sd	t0,32(sp)
    80008bdc:	f41a                	sd	t1,40(sp)
    80008bde:	f81e                	sd	t2,48(sp)
    80008be0:	fc22                	sd	s0,56(sp)
    80008be2:	e0a6                	sd	s1,64(sp)
    80008be4:	e4aa                	sd	a0,72(sp)
    80008be6:	e8ae                	sd	a1,80(sp)
    80008be8:	ecb2                	sd	a2,88(sp)
    80008bea:	f0b6                	sd	a3,96(sp)
    80008bec:	f4ba                	sd	a4,104(sp)
    80008bee:	f8be                	sd	a5,112(sp)
    80008bf0:	fcc2                	sd	a6,120(sp)
    80008bf2:	e146                	sd	a7,128(sp)
    80008bf4:	e54a                	sd	s2,136(sp)
    80008bf6:	e94e                	sd	s3,144(sp)
    80008bf8:	ed52                	sd	s4,152(sp)
    80008bfa:	f156                	sd	s5,160(sp)
    80008bfc:	f55a                	sd	s6,168(sp)
    80008bfe:	f95e                	sd	s7,176(sp)
    80008c00:	fd62                	sd	s8,184(sp)
    80008c02:	e1e6                	sd	s9,192(sp)
    80008c04:	e5ea                	sd	s10,200(sp)
    80008c06:	e9ee                	sd	s11,208(sp)
    80008c08:	edf2                	sd	t3,216(sp)
    80008c0a:	f1f6                	sd	t4,224(sp)
    80008c0c:	f5fa                	sd	t5,232(sp)
    80008c0e:	f9fe                	sd	t6,240(sp)
    80008c10:	bb4fb0ef          	jal	ra,80003fc4 <kerneltrap>
    80008c14:	6082                	ld	ra,0(sp)
    80008c16:	6122                	ld	sp,8(sp)
    80008c18:	61c2                	ld	gp,16(sp)
    80008c1a:	7282                	ld	t0,32(sp)
    80008c1c:	7322                	ld	t1,40(sp)
    80008c1e:	73c2                	ld	t2,48(sp)
    80008c20:	7462                	ld	s0,56(sp)
    80008c22:	6486                	ld	s1,64(sp)
    80008c24:	6526                	ld	a0,72(sp)
    80008c26:	65c6                	ld	a1,80(sp)
    80008c28:	6666                	ld	a2,88(sp)
    80008c2a:	7686                	ld	a3,96(sp)
    80008c2c:	7726                	ld	a4,104(sp)
    80008c2e:	77c6                	ld	a5,112(sp)
    80008c30:	7866                	ld	a6,120(sp)
    80008c32:	688a                	ld	a7,128(sp)
    80008c34:	692a                	ld	s2,136(sp)
    80008c36:	69ca                	ld	s3,144(sp)
    80008c38:	6a6a                	ld	s4,152(sp)
    80008c3a:	7a8a                	ld	s5,160(sp)
    80008c3c:	7b2a                	ld	s6,168(sp)
    80008c3e:	7bca                	ld	s7,176(sp)
    80008c40:	7c6a                	ld	s8,184(sp)
    80008c42:	6c8e                	ld	s9,192(sp)
    80008c44:	6d2e                	ld	s10,200(sp)
    80008c46:	6dce                	ld	s11,208(sp)
    80008c48:	6e6e                	ld	t3,216(sp)
    80008c4a:	7e8e                	ld	t4,224(sp)
    80008c4c:	7f2e                	ld	t5,232(sp)
    80008c4e:	7fce                	ld	t6,240(sp)
    80008c50:	6111                	addi	sp,sp,256
    80008c52:	10200073          	sret
    80008c56:	00000013          	nop
    80008c5a:	00000013          	nop
    80008c5e:	0001                	nop

0000000080008c60 <timervec>:
    80008c60:	34051573          	csrrw	a0,mscratch,a0
    80008c64:	e10c                	sd	a1,0(a0)
    80008c66:	e510                	sd	a2,8(a0)
    80008c68:	e914                	sd	a3,16(a0)
    80008c6a:	6d0c                	ld	a1,24(a0)
    80008c6c:	7110                	ld	a2,32(a0)
    80008c6e:	6194                	ld	a3,0(a1)
    80008c70:	96b2                	add	a3,a3,a2
    80008c72:	e194                	sd	a3,0(a1)
    80008c74:	4589                	li	a1,2
    80008c76:	14459073          	csrw	sip,a1
    80008c7a:	6914                	ld	a3,16(a0)
    80008c7c:	6510                	ld	a2,8(a0)
    80008c7e:	610c                	ld	a1,0(a0)
    80008c80:	34051573          	csrrw	a0,mscratch,a0
    80008c84:	30200073          	mret
	...

0000000080008c8a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008c8a:	1141                	addi	sp,sp,-16
    80008c8c:	e422                	sd	s0,8(sp)
    80008c8e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008c90:	0c0007b7          	lui	a5,0xc000
    80008c94:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008c98:	4705                	li	a4,1
    80008c9a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008c9c:	0c0007b7          	lui	a5,0xc000
    80008ca0:	0791                	addi	a5,a5,4
    80008ca2:	4705                	li	a4,1
    80008ca4:	c398                	sw	a4,0(a5)
}
    80008ca6:	0001                	nop
    80008ca8:	6422                	ld	s0,8(sp)
    80008caa:	0141                	addi	sp,sp,16
    80008cac:	8082                	ret

0000000080008cae <plicinithart>:

void
plicinithart(void)
{
    80008cae:	1101                	addi	sp,sp,-32
    80008cb0:	ec06                	sd	ra,24(sp)
    80008cb2:	e822                	sd	s0,16(sp)
    80008cb4:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008cb6:	ffffa097          	auipc	ra,0xffffa
    80008cba:	ae2080e7          	jalr	-1310(ra) # 80002798 <cpuid>
    80008cbe:	87aa                	mv	a5,a0
    80008cc0:	fef42623          	sw	a5,-20(s0)
  
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80008cc4:	fec42783          	lw	a5,-20(s0)
    80008cc8:	0087979b          	slliw	a5,a5,0x8
    80008ccc:	2781                	sext.w	a5,a5
    80008cce:	873e                	mv	a4,a5
    80008cd0:	0c0027b7          	lui	a5,0xc002
    80008cd4:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008cd8:	97ba                	add	a5,a5,a4
    80008cda:	873e                	mv	a4,a5
    80008cdc:	40200793          	li	a5,1026
    80008ce0:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008ce2:	fec42783          	lw	a5,-20(s0)
    80008ce6:	00d7979b          	slliw	a5,a5,0xd
    80008cea:	2781                	sext.w	a5,a5
    80008cec:	873e                	mv	a4,a5
    80008cee:	0c2017b7          	lui	a5,0xc201
    80008cf2:	97ba                	add	a5,a5,a4
    80008cf4:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008cf8:	0001                	nop
    80008cfa:	60e2                	ld	ra,24(sp)
    80008cfc:	6442                	ld	s0,16(sp)
    80008cfe:	6105                	addi	sp,sp,32
    80008d00:	8082                	ret

0000000080008d02 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008d02:	1101                	addi	sp,sp,-32
    80008d04:	ec06                	sd	ra,24(sp)
    80008d06:	e822                	sd	s0,16(sp)
    80008d08:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008d0a:	ffffa097          	auipc	ra,0xffffa
    80008d0e:	a8e080e7          	jalr	-1394(ra) # 80002798 <cpuid>
    80008d12:	87aa                	mv	a5,a0
    80008d14:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008d18:	fec42783          	lw	a5,-20(s0)
    80008d1c:	00d7979b          	slliw	a5,a5,0xd
    80008d20:	2781                	sext.w	a5,a5
    80008d22:	873e                	mv	a4,a5
    80008d24:	0c2017b7          	lui	a5,0xc201
    80008d28:	0791                	addi	a5,a5,4
    80008d2a:	97ba                	add	a5,a5,a4
    80008d2c:	439c                	lw	a5,0(a5)
    80008d2e:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008d32:	fe842783          	lw	a5,-24(s0)
}
    80008d36:	853e                	mv	a0,a5
    80008d38:	60e2                	ld	ra,24(sp)
    80008d3a:	6442                	ld	s0,16(sp)
    80008d3c:	6105                	addi	sp,sp,32
    80008d3e:	8082                	ret

0000000080008d40 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008d40:	7179                	addi	sp,sp,-48
    80008d42:	f406                	sd	ra,40(sp)
    80008d44:	f022                	sd	s0,32(sp)
    80008d46:	1800                	addi	s0,sp,48
    80008d48:	87aa                	mv	a5,a0
    80008d4a:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008d4e:	ffffa097          	auipc	ra,0xffffa
    80008d52:	a4a080e7          	jalr	-1462(ra) # 80002798 <cpuid>
    80008d56:	87aa                	mv	a5,a0
    80008d58:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008d5c:	fec42783          	lw	a5,-20(s0)
    80008d60:	00d7979b          	slliw	a5,a5,0xd
    80008d64:	2781                	sext.w	a5,a5
    80008d66:	873e                	mv	a4,a5
    80008d68:	0c2017b7          	lui	a5,0xc201
    80008d6c:	0791                	addi	a5,a5,4
    80008d6e:	97ba                	add	a5,a5,a4
    80008d70:	873e                	mv	a4,a5
    80008d72:	fdc42783          	lw	a5,-36(s0)
    80008d76:	c31c                	sw	a5,0(a4)
}
    80008d78:	0001                	nop
    80008d7a:	70a2                	ld	ra,40(sp)
    80008d7c:	7402                	ld	s0,32(sp)
    80008d7e:	6145                	addi	sp,sp,48
    80008d80:	8082                	ret

0000000080008d82 <virtio_disk_init>:
  
} __attribute__ ((aligned (PGSIZE))) disk;

void
virtio_disk_init(void)
{
    80008d82:	7179                	addi	sp,sp,-48
    80008d84:	f406                	sd	ra,40(sp)
    80008d86:	f022                	sd	s0,32(sp)
    80008d88:	1800                	addi	s0,sp,48
  uint32 status = 0;
    80008d8a:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    80008d8e:	00003597          	auipc	a1,0x3
    80008d92:	91258593          	addi	a1,a1,-1774 # 8000b6a0 <etext+0x6a0>
    80008d96:	00068517          	auipc	a0,0x68
    80008d9a:	39250513          	addi	a0,a0,914 # 80071128 <disk+0x2128>
    80008d9e:	ffff8097          	auipc	ra,0xffff8
    80008da2:	4b0080e7          	jalr	1200(ra) # 8000124e <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008da6:	100017b7          	lui	a5,0x10001
    80008daa:	439c                	lw	a5,0(a5)
    80008dac:	2781                	sext.w	a5,a5
    80008dae:	873e                	mv	a4,a5
    80008db0:	747277b7          	lui	a5,0x74727
    80008db4:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008db8:	04f71063          	bne	a4,a5,80008df8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80008dbc:	100017b7          	lui	a5,0x10001
    80008dc0:	0791                	addi	a5,a5,4
    80008dc2:	439c                	lw	a5,0(a5)
    80008dc4:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008dc6:	873e                	mv	a4,a5
    80008dc8:	4785                	li	a5,1
    80008dca:	02f71763          	bne	a4,a5,80008df8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008dce:	100017b7          	lui	a5,0x10001
    80008dd2:	07a1                	addi	a5,a5,8
    80008dd4:	439c                	lw	a5,0(a5)
    80008dd6:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80008dd8:	873e                	mv	a4,a5
    80008dda:	4789                	li	a5,2
    80008ddc:	00f71e63          	bne	a4,a5,80008df8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008de0:	100017b7          	lui	a5,0x10001
    80008de4:	07b1                	addi	a5,a5,12
    80008de6:	439c                	lw	a5,0(a5)
    80008de8:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008dea:	873e                	mv	a4,a5
    80008dec:	554d47b7          	lui	a5,0x554d4
    80008df0:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008df4:	00f70a63          	beq	a4,a5,80008e08 <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    80008df8:	00003517          	auipc	a0,0x3
    80008dfc:	8b850513          	addi	a0,a0,-1864 # 8000b6b0 <etext+0x6b0>
    80008e00:	ffff8097          	auipc	ra,0xffff8
    80008e04:	e50080e7          	jalr	-432(ra) # 80000c50 <panic>
  }
  
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008e08:	fe842783          	lw	a5,-24(s0)
    80008e0c:	0017e793          	ori	a5,a5,1
    80008e10:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008e14:	100017b7          	lui	a5,0x10001
    80008e18:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008e1c:	fe842703          	lw	a4,-24(s0)
    80008e20:	c398                	sw	a4,0(a5)

  status |= VIRTIO_CONFIG_S_DRIVER;
    80008e22:	fe842783          	lw	a5,-24(s0)
    80008e26:	0027e793          	ori	a5,a5,2
    80008e2a:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008e2e:	100017b7          	lui	a5,0x10001
    80008e32:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008e36:	fe842703          	lw	a4,-24(s0)
    80008e3a:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80008e3c:	100017b7          	lui	a5,0x10001
    80008e40:	07c1                	addi	a5,a5,16
    80008e42:	439c                	lw	a5,0(a5)
    80008e44:	2781                	sext.w	a5,a5
    80008e46:	1782                	slli	a5,a5,0x20
    80008e48:	9381                	srli	a5,a5,0x20
    80008e4a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008e4e:	fe043783          	ld	a5,-32(s0)
    80008e52:	fdf7f793          	andi	a5,a5,-33
    80008e56:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008e5a:	fe043783          	ld	a5,-32(s0)
    80008e5e:	f7f7f793          	andi	a5,a5,-129
    80008e62:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008e66:	fe043703          	ld	a4,-32(s0)
    80008e6a:	77fd                	lui	a5,0xfffff
    80008e6c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ff8d7ff>
    80008e70:	8ff9                	and	a5,a5,a4
    80008e72:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008e76:	fe043703          	ld	a4,-32(s0)
    80008e7a:	77fd                	lui	a5,0xfffff
    80008e7c:	17fd                	addi	a5,a5,-1
    80008e7e:	8ff9                	and	a5,a5,a4
    80008e80:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008e84:	fe043703          	ld	a4,-32(s0)
    80008e88:	f80007b7          	lui	a5,0xf8000
    80008e8c:	17fd                	addi	a5,a5,-1
    80008e8e:	8ff9                	and	a5,a5,a4
    80008e90:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008e94:	fe043703          	ld	a4,-32(s0)
    80008e98:	e00007b7          	lui	a5,0xe0000
    80008e9c:	17fd                	addi	a5,a5,-1
    80008e9e:	8ff9                	and	a5,a5,a4
    80008ea0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008ea4:	fe043703          	ld	a4,-32(s0)
    80008ea8:	f00007b7          	lui	a5,0xf0000
    80008eac:	17fd                	addi	a5,a5,-1
    80008eae:	8ff9                	and	a5,a5,a4
    80008eb0:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008eb4:	100017b7          	lui	a5,0x10001
    80008eb8:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    80008ebc:	fe043703          	ld	a4,-32(s0)
    80008ec0:	2701                	sext.w	a4,a4
    80008ec2:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008ec4:	fe842783          	lw	a5,-24(s0)
    80008ec8:	0087e793          	ori	a5,a5,8
    80008ecc:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008ed0:	100017b7          	lui	a5,0x10001
    80008ed4:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008ed8:	fe842703          	lw	a4,-24(s0)
    80008edc:	c398                	sw	a4,0(a5)

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    80008ede:	fe842783          	lw	a5,-24(s0)
    80008ee2:	0047e793          	ori	a5,a5,4
    80008ee6:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008eea:	100017b7          	lui	a5,0x10001
    80008eee:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008ef2:	fe842703          	lw	a4,-24(s0)
    80008ef6:	c398                	sw	a4,0(a5)

  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80008ef8:	100017b7          	lui	a5,0x10001
    80008efc:	02878793          	addi	a5,a5,40 # 10001028 <_entry-0x6fffefd8>
    80008f00:	6705                	lui	a4,0x1
    80008f02:	c398                	sw	a4,0(a5)

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008f04:	100017b7          	lui	a5,0x10001
    80008f08:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    80008f0c:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008f10:	100017b7          	lui	a5,0x10001
    80008f14:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    80008f18:	439c                	lw	a5,0(a5)
    80008f1a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008f1e:	fdc42783          	lw	a5,-36(s0)
    80008f22:	2781                	sext.w	a5,a5
    80008f24:	eb89                	bnez	a5,80008f36 <virtio_disk_init+0x1b4>
    panic("virtio disk has no queue 0");
    80008f26:	00002517          	auipc	a0,0x2
    80008f2a:	7aa50513          	addi	a0,a0,1962 # 8000b6d0 <etext+0x6d0>
    80008f2e:	ffff8097          	auipc	ra,0xffff8
    80008f32:	d22080e7          	jalr	-734(ra) # 80000c50 <panic>
  if(max < NUM)
    80008f36:	fdc42783          	lw	a5,-36(s0)
    80008f3a:	0007871b          	sext.w	a4,a5
    80008f3e:	479d                	li	a5,7
    80008f40:	00e7ea63          	bltu	a5,a4,80008f54 <virtio_disk_init+0x1d2>
    panic("virtio disk max queue too short");
    80008f44:	00002517          	auipc	a0,0x2
    80008f48:	7ac50513          	addi	a0,a0,1964 # 8000b6f0 <etext+0x6f0>
    80008f4c:	ffff8097          	auipc	ra,0xffff8
    80008f50:	d04080e7          	jalr	-764(ra) # 80000c50 <panic>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80008f54:	100017b7          	lui	a5,0x10001
    80008f58:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    80008f5c:	4721                	li	a4,8
    80008f5e:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80008f60:	6609                	lui	a2,0x2
    80008f62:	4581                	li	a1,0
    80008f64:	00066517          	auipc	a0,0x66
    80008f68:	09c50513          	addi	a0,a0,156 # 8006f000 <disk>
    80008f6c:	ffff8097          	auipc	ra,0xffff8
    80008f70:	4e6080e7          	jalr	1254(ra) # 80001452 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80008f74:	00066797          	auipc	a5,0x66
    80008f78:	08c78793          	addi	a5,a5,140 # 8006f000 <disk>
    80008f7c:	00c7d713          	srli	a4,a5,0xc
    80008f80:	100017b7          	lui	a5,0x10001
    80008f84:	04078793          	addi	a5,a5,64 # 10001040 <_entry-0x6fffefc0>
    80008f88:	2701                	sext.w	a4,a4
    80008f8a:	c398                	sw	a4,0(a5)

  // desc = pages -- num * virtq_desc
  // avail = pages + 0x40 -- 2 * uint16, then num * uint16
  // used = pages + 4096 -- 2 * uint16, then num * vRingUsedElem

  disk.desc = (struct virtq_desc *) disk.pages;
    80008f8c:	00066717          	auipc	a4,0x66
    80008f90:	07470713          	addi	a4,a4,116 # 8006f000 <disk>
    80008f94:	6789                	lui	a5,0x2
    80008f96:	97ba                	add	a5,a5,a4
    80008f98:	00066717          	auipc	a4,0x66
    80008f9c:	06870713          	addi	a4,a4,104 # 8006f000 <disk>
    80008fa0:	e398                	sd	a4,0(a5)
  disk.avail = (struct virtq_avail *)(disk.pages + NUM*sizeof(struct virtq_desc));
    80008fa2:	00066717          	auipc	a4,0x66
    80008fa6:	0de70713          	addi	a4,a4,222 # 8006f080 <disk+0x80>
    80008faa:	00066697          	auipc	a3,0x66
    80008fae:	05668693          	addi	a3,a3,86 # 8006f000 <disk>
    80008fb2:	6789                	lui	a5,0x2
    80008fb4:	97b6                	add	a5,a5,a3
    80008fb6:	e798                	sd	a4,8(a5)
  disk.used = (struct virtq_used *) (disk.pages + PGSIZE);
    80008fb8:	00067717          	auipc	a4,0x67
    80008fbc:	04870713          	addi	a4,a4,72 # 80070000 <disk+0x1000>
    80008fc0:	00066697          	auipc	a3,0x66
    80008fc4:	04068693          	addi	a3,a3,64 # 8006f000 <disk>
    80008fc8:	6789                	lui	a5,0x2
    80008fca:	97b6                	add	a5,a5,a3
    80008fcc:	eb98                	sd	a4,16(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80008fce:	fe042623          	sw	zero,-20(s0)
    80008fd2:	a015                	j	80008ff6 <virtio_disk_init+0x274>
    disk.free[i] = 1;
    80008fd4:	00066717          	auipc	a4,0x66
    80008fd8:	02c70713          	addi	a4,a4,44 # 8006f000 <disk>
    80008fdc:	fec42783          	lw	a5,-20(s0)
    80008fe0:	97ba                	add	a5,a5,a4
    80008fe2:	6709                	lui	a4,0x2
    80008fe4:	97ba                	add	a5,a5,a4
    80008fe6:	4705                	li	a4,1
    80008fe8:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x7fffdfe8>
  for(int i = 0; i < NUM; i++)
    80008fec:	fec42783          	lw	a5,-20(s0)
    80008ff0:	2785                	addiw	a5,a5,1
    80008ff2:	fef42623          	sw	a5,-20(s0)
    80008ff6:	fec42783          	lw	a5,-20(s0)
    80008ffa:	0007871b          	sext.w	a4,a5
    80008ffe:	479d                	li	a5,7
    80009000:	fce7dae3          	bge	a5,a4,80008fd4 <virtio_disk_init+0x252>

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    80009004:	0001                	nop
    80009006:	0001                	nop
    80009008:	70a2                	ld	ra,40(sp)
    8000900a:	7402                	ld	s0,32(sp)
    8000900c:	6145                	addi	sp,sp,48
    8000900e:	8082                	ret

0000000080009010 <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    80009010:	1101                	addi	sp,sp,-32
    80009012:	ec22                	sd	s0,24(sp)
    80009014:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    80009016:	fe042623          	sw	zero,-20(s0)
    8000901a:	a081                	j	8000905a <alloc_desc+0x4a>
    if(disk.free[i]){
    8000901c:	00066717          	auipc	a4,0x66
    80009020:	fe470713          	addi	a4,a4,-28 # 8006f000 <disk>
    80009024:	fec42783          	lw	a5,-20(s0)
    80009028:	97ba                	add	a5,a5,a4
    8000902a:	6709                	lui	a4,0x2
    8000902c:	97ba                	add	a5,a5,a4
    8000902e:	0187c783          	lbu	a5,24(a5)
    80009032:	cf99                	beqz	a5,80009050 <alloc_desc+0x40>
      disk.free[i] = 0;
    80009034:	00066717          	auipc	a4,0x66
    80009038:	fcc70713          	addi	a4,a4,-52 # 8006f000 <disk>
    8000903c:	fec42783          	lw	a5,-20(s0)
    80009040:	97ba                	add	a5,a5,a4
    80009042:	6709                	lui	a4,0x2
    80009044:	97ba                	add	a5,a5,a4
    80009046:	00078c23          	sb	zero,24(a5)
      return i;
    8000904a:	fec42783          	lw	a5,-20(s0)
    8000904e:	a831                	j	8000906a <alloc_desc+0x5a>
  for(int i = 0; i < NUM; i++){
    80009050:	fec42783          	lw	a5,-20(s0)
    80009054:	2785                	addiw	a5,a5,1
    80009056:	fef42623          	sw	a5,-20(s0)
    8000905a:	fec42783          	lw	a5,-20(s0)
    8000905e:	0007871b          	sext.w	a4,a5
    80009062:	479d                	li	a5,7
    80009064:	fae7dce3          	bge	a5,a4,8000901c <alloc_desc+0xc>
    }
  }
  return -1;
    80009068:	57fd                	li	a5,-1
}
    8000906a:	853e                	mv	a0,a5
    8000906c:	6462                	ld	s0,24(sp)
    8000906e:	6105                	addi	sp,sp,32
    80009070:	8082                	ret

0000000080009072 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    80009072:	1101                	addi	sp,sp,-32
    80009074:	ec06                	sd	ra,24(sp)
    80009076:	e822                	sd	s0,16(sp)
    80009078:	1000                	addi	s0,sp,32
    8000907a:	87aa                	mv	a5,a0
    8000907c:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    80009080:	fec42783          	lw	a5,-20(s0)
    80009084:	0007871b          	sext.w	a4,a5
    80009088:	479d                	li	a5,7
    8000908a:	00e7da63          	bge	a5,a4,8000909e <free_desc+0x2c>
    panic("free_desc 1");
    8000908e:	00002517          	auipc	a0,0x2
    80009092:	68250513          	addi	a0,a0,1666 # 8000b710 <etext+0x710>
    80009096:	ffff8097          	auipc	ra,0xffff8
    8000909a:	bba080e7          	jalr	-1094(ra) # 80000c50 <panic>
  if(disk.free[i])
    8000909e:	00066717          	auipc	a4,0x66
    800090a2:	f6270713          	addi	a4,a4,-158 # 8006f000 <disk>
    800090a6:	fec42783          	lw	a5,-20(s0)
    800090aa:	97ba                	add	a5,a5,a4
    800090ac:	6709                	lui	a4,0x2
    800090ae:	97ba                	add	a5,a5,a4
    800090b0:	0187c783          	lbu	a5,24(a5)
    800090b4:	cb89                	beqz	a5,800090c6 <free_desc+0x54>
    panic("free_desc 2");
    800090b6:	00002517          	auipc	a0,0x2
    800090ba:	66a50513          	addi	a0,a0,1642 # 8000b720 <etext+0x720>
    800090be:	ffff8097          	auipc	ra,0xffff8
    800090c2:	b92080e7          	jalr	-1134(ra) # 80000c50 <panic>
  disk.desc[i].addr = 0;
    800090c6:	00066717          	auipc	a4,0x66
    800090ca:	f3a70713          	addi	a4,a4,-198 # 8006f000 <disk>
    800090ce:	6789                	lui	a5,0x2
    800090d0:	97ba                	add	a5,a5,a4
    800090d2:	6398                	ld	a4,0(a5)
    800090d4:	fec42783          	lw	a5,-20(s0)
    800090d8:	0792                	slli	a5,a5,0x4
    800090da:	97ba                	add	a5,a5,a4
    800090dc:	0007b023          	sd	zero,0(a5) # 2000 <_entry-0x7fffe000>
  disk.desc[i].len = 0;
    800090e0:	00066717          	auipc	a4,0x66
    800090e4:	f2070713          	addi	a4,a4,-224 # 8006f000 <disk>
    800090e8:	6789                	lui	a5,0x2
    800090ea:	97ba                	add	a5,a5,a4
    800090ec:	6398                	ld	a4,0(a5)
    800090ee:	fec42783          	lw	a5,-20(s0)
    800090f2:	0792                	slli	a5,a5,0x4
    800090f4:	97ba                	add	a5,a5,a4
    800090f6:	0007a423          	sw	zero,8(a5) # 2008 <_entry-0x7fffdff8>
  disk.desc[i].flags = 0;
    800090fa:	00066717          	auipc	a4,0x66
    800090fe:	f0670713          	addi	a4,a4,-250 # 8006f000 <disk>
    80009102:	6789                	lui	a5,0x2
    80009104:	97ba                	add	a5,a5,a4
    80009106:	6398                	ld	a4,0(a5)
    80009108:	fec42783          	lw	a5,-20(s0)
    8000910c:	0792                	slli	a5,a5,0x4
    8000910e:	97ba                	add	a5,a5,a4
    80009110:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[i].next = 0;
    80009114:	00066717          	auipc	a4,0x66
    80009118:	eec70713          	addi	a4,a4,-276 # 8006f000 <disk>
    8000911c:	6789                	lui	a5,0x2
    8000911e:	97ba                	add	a5,a5,a4
    80009120:	6398                	ld	a4,0(a5)
    80009122:	fec42783          	lw	a5,-20(s0)
    80009126:	0792                	slli	a5,a5,0x4
    80009128:	97ba                	add	a5,a5,a4
    8000912a:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>
  disk.free[i] = 1;
    8000912e:	00066717          	auipc	a4,0x66
    80009132:	ed270713          	addi	a4,a4,-302 # 8006f000 <disk>
    80009136:	fec42783          	lw	a5,-20(s0)
    8000913a:	97ba                	add	a5,a5,a4
    8000913c:	6709                	lui	a4,0x2
    8000913e:	97ba                	add	a5,a5,a4
    80009140:	4705                	li	a4,1
    80009142:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    80009146:	00068517          	auipc	a0,0x68
    8000914a:	ed250513          	addi	a0,a0,-302 # 80071018 <disk+0x2018>
    8000914e:	ffffa097          	auipc	ra,0xffffa
    80009152:	488080e7          	jalr	1160(ra) # 800035d6 <wakeup>
}
    80009156:	0001                	nop
    80009158:	60e2                	ld	ra,24(sp)
    8000915a:	6442                	ld	s0,16(sp)
    8000915c:	6105                	addi	sp,sp,32
    8000915e:	8082                	ret

0000000080009160 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    80009160:	7179                	addi	sp,sp,-48
    80009162:	f406                	sd	ra,40(sp)
    80009164:	f022                	sd	s0,32(sp)
    80009166:	1800                	addi	s0,sp,48
    80009168:	87aa                	mv	a5,a0
    8000916a:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    8000916e:	00066717          	auipc	a4,0x66
    80009172:	e9270713          	addi	a4,a4,-366 # 8006f000 <disk>
    80009176:	6789                	lui	a5,0x2
    80009178:	97ba                	add	a5,a5,a4
    8000917a:	6398                	ld	a4,0(a5)
    8000917c:	fdc42783          	lw	a5,-36(s0)
    80009180:	0792                	slli	a5,a5,0x4
    80009182:	97ba                	add	a5,a5,a4
    80009184:	00c7d783          	lhu	a5,12(a5) # 200c <_entry-0x7fffdff4>
    80009188:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    8000918c:	00066717          	auipc	a4,0x66
    80009190:	e7470713          	addi	a4,a4,-396 # 8006f000 <disk>
    80009194:	6789                	lui	a5,0x2
    80009196:	97ba                	add	a5,a5,a4
    80009198:	6398                	ld	a4,0(a5)
    8000919a:	fdc42783          	lw	a5,-36(s0)
    8000919e:	0792                	slli	a5,a5,0x4
    800091a0:	97ba                	add	a5,a5,a4
    800091a2:	00e7d783          	lhu	a5,14(a5) # 200e <_entry-0x7fffdff2>
    800091a6:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    800091aa:	fdc42783          	lw	a5,-36(s0)
    800091ae:	853e                	mv	a0,a5
    800091b0:	00000097          	auipc	ra,0x0
    800091b4:	ec2080e7          	jalr	-318(ra) # 80009072 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    800091b8:	fec42783          	lw	a5,-20(s0)
    800091bc:	8b85                	andi	a5,a5,1
    800091be:	2781                	sext.w	a5,a5
    800091c0:	c791                	beqz	a5,800091cc <free_chain+0x6c>
      i = nxt;
    800091c2:	fe842783          	lw	a5,-24(s0)
    800091c6:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    800091ca:	b755                	j	8000916e <free_chain+0xe>
    else
      break;
    800091cc:	0001                	nop
  }
}
    800091ce:	0001                	nop
    800091d0:	70a2                	ld	ra,40(sp)
    800091d2:	7402                	ld	s0,32(sp)
    800091d4:	6145                	addi	sp,sp,48
    800091d6:	8082                	ret

00000000800091d8 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    800091d8:	7139                	addi	sp,sp,-64
    800091da:	fc06                	sd	ra,56(sp)
    800091dc:	f822                	sd	s0,48(sp)
    800091de:	f426                	sd	s1,40(sp)
    800091e0:	0080                	addi	s0,sp,64
    800091e2:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    800091e6:	fc042e23          	sw	zero,-36(s0)
    800091ea:	a895                	j	8000925e <alloc3_desc+0x86>
    idx[i] = alloc_desc();
    800091ec:	fdc42783          	lw	a5,-36(s0)
    800091f0:	078a                	slli	a5,a5,0x2
    800091f2:	fc843703          	ld	a4,-56(s0)
    800091f6:	00f704b3          	add	s1,a4,a5
    800091fa:	00000097          	auipc	ra,0x0
    800091fe:	e16080e7          	jalr	-490(ra) # 80009010 <alloc_desc>
    80009202:	87aa                	mv	a5,a0
    80009204:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80009206:	fdc42783          	lw	a5,-36(s0)
    8000920a:	078a                	slli	a5,a5,0x2
    8000920c:	fc843703          	ld	a4,-56(s0)
    80009210:	97ba                	add	a5,a5,a4
    80009212:	439c                	lw	a5,0(a5)
    80009214:	0407d063          	bgez	a5,80009254 <alloc3_desc+0x7c>
      for(int j = 0; j < i; j++)
    80009218:	fc042c23          	sw	zero,-40(s0)
    8000921c:	a015                	j	80009240 <alloc3_desc+0x68>
        free_desc(idx[j]);
    8000921e:	fd842783          	lw	a5,-40(s0)
    80009222:	078a                	slli	a5,a5,0x2
    80009224:	fc843703          	ld	a4,-56(s0)
    80009228:	97ba                	add	a5,a5,a4
    8000922a:	439c                	lw	a5,0(a5)
    8000922c:	853e                	mv	a0,a5
    8000922e:	00000097          	auipc	ra,0x0
    80009232:	e44080e7          	jalr	-444(ra) # 80009072 <free_desc>
      for(int j = 0; j < i; j++)
    80009236:	fd842783          	lw	a5,-40(s0)
    8000923a:	2785                	addiw	a5,a5,1
    8000923c:	fcf42c23          	sw	a5,-40(s0)
    80009240:	fd842703          	lw	a4,-40(s0)
    80009244:	fdc42783          	lw	a5,-36(s0)
    80009248:	2701                	sext.w	a4,a4
    8000924a:	2781                	sext.w	a5,a5
    8000924c:	fcf749e3          	blt	a4,a5,8000921e <alloc3_desc+0x46>
      return -1;
    80009250:	57fd                	li	a5,-1
    80009252:	a831                	j	8000926e <alloc3_desc+0x96>
  for(int i = 0; i < 3; i++){
    80009254:	fdc42783          	lw	a5,-36(s0)
    80009258:	2785                	addiw	a5,a5,1
    8000925a:	fcf42e23          	sw	a5,-36(s0)
    8000925e:	fdc42783          	lw	a5,-36(s0)
    80009262:	0007871b          	sext.w	a4,a5
    80009266:	4789                	li	a5,2
    80009268:	f8e7d2e3          	bge	a5,a4,800091ec <alloc3_desc+0x14>
    }
  }
  return 0;
    8000926c:	4781                	li	a5,0
}
    8000926e:	853e                	mv	a0,a5
    80009270:	70e2                	ld	ra,56(sp)
    80009272:	7442                	ld	s0,48(sp)
    80009274:	74a2                	ld	s1,40(sp)
    80009276:	6121                	addi	sp,sp,64
    80009278:	8082                	ret

000000008000927a <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    8000927a:	7139                	addi	sp,sp,-64
    8000927c:	fc06                	sd	ra,56(sp)
    8000927e:	f822                	sd	s0,48(sp)
    80009280:	0080                	addi	s0,sp,64
    80009282:	fca43423          	sd	a0,-56(s0)
    80009286:	87ae                	mv	a5,a1
    80009288:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    8000928c:	fc843783          	ld	a5,-56(s0)
    80009290:	47dc                	lw	a5,12(a5)
    80009292:	0017979b          	slliw	a5,a5,0x1
    80009296:	2781                	sext.w	a5,a5
    80009298:	1782                	slli	a5,a5,0x20
    8000929a:	9381                	srli	a5,a5,0x20
    8000929c:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    800092a0:	00068517          	auipc	a0,0x68
    800092a4:	e8850513          	addi	a0,a0,-376 # 80071128 <disk+0x2128>
    800092a8:	ffff8097          	auipc	ra,0xffff8
    800092ac:	fd6080e7          	jalr	-42(ra) # 8000127e <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    800092b0:	fd040793          	addi	a5,s0,-48
    800092b4:	853e                	mv	a0,a5
    800092b6:	00000097          	auipc	ra,0x0
    800092ba:	f22080e7          	jalr	-222(ra) # 800091d8 <alloc3_desc>
    800092be:	87aa                	mv	a5,a0
    800092c0:	cf91                	beqz	a5,800092dc <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    800092c2:	00068597          	auipc	a1,0x68
    800092c6:	e6658593          	addi	a1,a1,-410 # 80071128 <disk+0x2128>
    800092ca:	00068517          	auipc	a0,0x68
    800092ce:	d4e50513          	addi	a0,a0,-690 # 80071018 <disk+0x2018>
    800092d2:	ffffa097          	auipc	ra,0xffffa
    800092d6:	270080e7          	jalr	624(ra) # 80003542 <sleep>
    if(alloc3_desc(idx) == 0) {
    800092da:	bfd9                	j	800092b0 <virtio_disk_rw+0x36>
      break;
    800092dc:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    800092de:	fd042783          	lw	a5,-48(s0)
    800092e2:	20078793          	addi	a5,a5,512
    800092e6:	00479713          	slli	a4,a5,0x4
    800092ea:	00066797          	auipc	a5,0x66
    800092ee:	d1678793          	addi	a5,a5,-746 # 8006f000 <disk>
    800092f2:	97ba                	add	a5,a5,a4
    800092f4:	0a878793          	addi	a5,a5,168
    800092f8:	fef43023          	sd	a5,-32(s0)

  if(write)
    800092fc:	fc442783          	lw	a5,-60(s0)
    80009300:	2781                	sext.w	a5,a5
    80009302:	c791                	beqz	a5,8000930e <virtio_disk_rw+0x94>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80009304:	fe043783          	ld	a5,-32(s0)
    80009308:	4705                	li	a4,1
    8000930a:	c398                	sw	a4,0(a5)
    8000930c:	a029                	j	80009316 <virtio_disk_rw+0x9c>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    8000930e:	fe043783          	ld	a5,-32(s0)
    80009312:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80009316:	fe043783          	ld	a5,-32(s0)
    8000931a:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    8000931e:	fe043783          	ld	a5,-32(s0)
    80009322:	fe843703          	ld	a4,-24(s0)
    80009326:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    80009328:	00066717          	auipc	a4,0x66
    8000932c:	cd870713          	addi	a4,a4,-808 # 8006f000 <disk>
    80009330:	6789                	lui	a5,0x2
    80009332:	97ba                	add	a5,a5,a4
    80009334:	6398                	ld	a4,0(a5)
    80009336:	fd042783          	lw	a5,-48(s0)
    8000933a:	0792                	slli	a5,a5,0x4
    8000933c:	97ba                	add	a5,a5,a4
    8000933e:	fe043703          	ld	a4,-32(s0)
    80009342:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80009344:	00066717          	auipc	a4,0x66
    80009348:	cbc70713          	addi	a4,a4,-836 # 8006f000 <disk>
    8000934c:	6789                	lui	a5,0x2
    8000934e:	97ba                	add	a5,a5,a4
    80009350:	6398                	ld	a4,0(a5)
    80009352:	fd042783          	lw	a5,-48(s0)
    80009356:	0792                	slli	a5,a5,0x4
    80009358:	97ba                	add	a5,a5,a4
    8000935a:	4741                	li	a4,16
    8000935c:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    8000935e:	00066717          	auipc	a4,0x66
    80009362:	ca270713          	addi	a4,a4,-862 # 8006f000 <disk>
    80009366:	6789                	lui	a5,0x2
    80009368:	97ba                	add	a5,a5,a4
    8000936a:	6398                	ld	a4,0(a5)
    8000936c:	fd042783          	lw	a5,-48(s0)
    80009370:	0792                	slli	a5,a5,0x4
    80009372:	97ba                	add	a5,a5,a4
    80009374:	4705                	li	a4,1
    80009376:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[0]].next = idx[1];
    8000937a:	fd442683          	lw	a3,-44(s0)
    8000937e:	00066717          	auipc	a4,0x66
    80009382:	c8270713          	addi	a4,a4,-894 # 8006f000 <disk>
    80009386:	6789                	lui	a5,0x2
    80009388:	97ba                	add	a5,a5,a4
    8000938a:	6398                	ld	a4,0(a5)
    8000938c:	fd042783          	lw	a5,-48(s0)
    80009390:	0792                	slli	a5,a5,0x4
    80009392:	97ba                	add	a5,a5,a4
    80009394:	03069713          	slli	a4,a3,0x30
    80009398:	9341                	srli	a4,a4,0x30
    8000939a:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.desc[idx[1]].addr = (uint64) b->data;
    8000939e:	fc843783          	ld	a5,-56(s0)
    800093a2:	05878693          	addi	a3,a5,88
    800093a6:	00066717          	auipc	a4,0x66
    800093aa:	c5a70713          	addi	a4,a4,-934 # 8006f000 <disk>
    800093ae:	6789                	lui	a5,0x2
    800093b0:	97ba                	add	a5,a5,a4
    800093b2:	6398                	ld	a4,0(a5)
    800093b4:	fd442783          	lw	a5,-44(s0)
    800093b8:	0792                	slli	a5,a5,0x4
    800093ba:	97ba                	add	a5,a5,a4
    800093bc:	8736                	mv	a4,a3
    800093be:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    800093c0:	00066717          	auipc	a4,0x66
    800093c4:	c4070713          	addi	a4,a4,-960 # 8006f000 <disk>
    800093c8:	6789                	lui	a5,0x2
    800093ca:	97ba                	add	a5,a5,a4
    800093cc:	6398                	ld	a4,0(a5)
    800093ce:	fd442783          	lw	a5,-44(s0)
    800093d2:	0792                	slli	a5,a5,0x4
    800093d4:	97ba                	add	a5,a5,a4
    800093d6:	40000713          	li	a4,1024
    800093da:	c798                	sw	a4,8(a5)
  if(write)
    800093dc:	fc442783          	lw	a5,-60(s0)
    800093e0:	2781                	sext.w	a5,a5
    800093e2:	cf99                	beqz	a5,80009400 <virtio_disk_rw+0x186>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    800093e4:	00066717          	auipc	a4,0x66
    800093e8:	c1c70713          	addi	a4,a4,-996 # 8006f000 <disk>
    800093ec:	6789                	lui	a5,0x2
    800093ee:	97ba                	add	a5,a5,a4
    800093f0:	6398                	ld	a4,0(a5)
    800093f2:	fd442783          	lw	a5,-44(s0)
    800093f6:	0792                	slli	a5,a5,0x4
    800093f8:	97ba                	add	a5,a5,a4
    800093fa:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
    800093fe:	a839                	j	8000941c <virtio_disk_rw+0x1a2>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009400:	00066717          	auipc	a4,0x66
    80009404:	c0070713          	addi	a4,a4,-1024 # 8006f000 <disk>
    80009408:	6789                	lui	a5,0x2
    8000940a:	97ba                	add	a5,a5,a4
    8000940c:	6398                	ld	a4,0(a5)
    8000940e:	fd442783          	lw	a5,-44(s0)
    80009412:	0792                	slli	a5,a5,0x4
    80009414:	97ba                	add	a5,a5,a4
    80009416:	4709                	li	a4,2
    80009418:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8000941c:	00066717          	auipc	a4,0x66
    80009420:	be470713          	addi	a4,a4,-1052 # 8006f000 <disk>
    80009424:	6789                	lui	a5,0x2
    80009426:	97ba                	add	a5,a5,a4
    80009428:	6398                	ld	a4,0(a5)
    8000942a:	fd442783          	lw	a5,-44(s0)
    8000942e:	0792                	slli	a5,a5,0x4
    80009430:	97ba                	add	a5,a5,a4
    80009432:	00c7d703          	lhu	a4,12(a5) # 200c <_entry-0x7fffdff4>
    80009436:	00066697          	auipc	a3,0x66
    8000943a:	bca68693          	addi	a3,a3,-1078 # 8006f000 <disk>
    8000943e:	6789                	lui	a5,0x2
    80009440:	97b6                	add	a5,a5,a3
    80009442:	6394                	ld	a3,0(a5)
    80009444:	fd442783          	lw	a5,-44(s0)
    80009448:	0792                	slli	a5,a5,0x4
    8000944a:	97b6                	add	a5,a5,a3
    8000944c:	00176713          	ori	a4,a4,1
    80009450:	1742                	slli	a4,a4,0x30
    80009452:	9341                	srli	a4,a4,0x30
    80009454:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].next = idx[2];
    80009458:	fd842683          	lw	a3,-40(s0)
    8000945c:	00066717          	auipc	a4,0x66
    80009460:	ba470713          	addi	a4,a4,-1116 # 8006f000 <disk>
    80009464:	6789                	lui	a5,0x2
    80009466:	97ba                	add	a5,a5,a4
    80009468:	6398                	ld	a4,0(a5)
    8000946a:	fd442783          	lw	a5,-44(s0)
    8000946e:	0792                	slli	a5,a5,0x4
    80009470:	97ba                	add	a5,a5,a4
    80009472:	03069713          	slli	a4,a3,0x30
    80009476:	9341                	srli	a4,a4,0x30
    80009478:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    8000947c:	fd042783          	lw	a5,-48(s0)
    80009480:	00066717          	auipc	a4,0x66
    80009484:	b8070713          	addi	a4,a4,-1152 # 8006f000 <disk>
    80009488:	20078793          	addi	a5,a5,512
    8000948c:	0792                	slli	a5,a5,0x4
    8000948e:	97ba                	add	a5,a5,a4
    80009490:	577d                	li	a4,-1
    80009492:	02e78823          	sb	a4,48(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80009496:	fd042783          	lw	a5,-48(s0)
    8000949a:	20078793          	addi	a5,a5,512
    8000949e:	00479713          	slli	a4,a5,0x4
    800094a2:	00066797          	auipc	a5,0x66
    800094a6:	b5e78793          	addi	a5,a5,-1186 # 8006f000 <disk>
    800094aa:	97ba                	add	a5,a5,a4
    800094ac:	03078693          	addi	a3,a5,48
    800094b0:	00066717          	auipc	a4,0x66
    800094b4:	b5070713          	addi	a4,a4,-1200 # 8006f000 <disk>
    800094b8:	6789                	lui	a5,0x2
    800094ba:	97ba                	add	a5,a5,a4
    800094bc:	6398                	ld	a4,0(a5)
    800094be:	fd842783          	lw	a5,-40(s0)
    800094c2:	0792                	slli	a5,a5,0x4
    800094c4:	97ba                	add	a5,a5,a4
    800094c6:	8736                	mv	a4,a3
    800094c8:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    800094ca:	00066717          	auipc	a4,0x66
    800094ce:	b3670713          	addi	a4,a4,-1226 # 8006f000 <disk>
    800094d2:	6789                	lui	a5,0x2
    800094d4:	97ba                	add	a5,a5,a4
    800094d6:	6398                	ld	a4,0(a5)
    800094d8:	fd842783          	lw	a5,-40(s0)
    800094dc:	0792                	slli	a5,a5,0x4
    800094de:	97ba                	add	a5,a5,a4
    800094e0:	4705                	li	a4,1
    800094e2:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    800094e4:	00066717          	auipc	a4,0x66
    800094e8:	b1c70713          	addi	a4,a4,-1252 # 8006f000 <disk>
    800094ec:	6789                	lui	a5,0x2
    800094ee:	97ba                	add	a5,a5,a4
    800094f0:	6398                	ld	a4,0(a5)
    800094f2:	fd842783          	lw	a5,-40(s0)
    800094f6:	0792                	slli	a5,a5,0x4
    800094f8:	97ba                	add	a5,a5,a4
    800094fa:	4709                	li	a4,2
    800094fc:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[2]].next = 0;
    80009500:	00066717          	auipc	a4,0x66
    80009504:	b0070713          	addi	a4,a4,-1280 # 8006f000 <disk>
    80009508:	6789                	lui	a5,0x2
    8000950a:	97ba                	add	a5,a5,a4
    8000950c:	6398                	ld	a4,0(a5)
    8000950e:	fd842783          	lw	a5,-40(s0)
    80009512:	0792                	slli	a5,a5,0x4
    80009514:	97ba                	add	a5,a5,a4
    80009516:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8000951a:	fc843783          	ld	a5,-56(s0)
    8000951e:	4705                	li	a4,1
    80009520:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    80009522:	fd042783          	lw	a5,-48(s0)
    80009526:	00066717          	auipc	a4,0x66
    8000952a:	ada70713          	addi	a4,a4,-1318 # 8006f000 <disk>
    8000952e:	20078793          	addi	a5,a5,512
    80009532:	0792                	slli	a5,a5,0x4
    80009534:	97ba                	add	a5,a5,a4
    80009536:	fc843703          	ld	a4,-56(s0)
    8000953a:	f798                	sd	a4,40(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    8000953c:	fd042603          	lw	a2,-48(s0)
    80009540:	00066717          	auipc	a4,0x66
    80009544:	ac070713          	addi	a4,a4,-1344 # 8006f000 <disk>
    80009548:	6789                	lui	a5,0x2
    8000954a:	97ba                	add	a5,a5,a4
    8000954c:	6794                	ld	a3,8(a5)
    8000954e:	00066717          	auipc	a4,0x66
    80009552:	ab270713          	addi	a4,a4,-1358 # 8006f000 <disk>
    80009556:	6789                	lui	a5,0x2
    80009558:	97ba                	add	a5,a5,a4
    8000955a:	679c                	ld	a5,8(a5)
    8000955c:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009560:	2781                	sext.w	a5,a5
    80009562:	8b9d                	andi	a5,a5,7
    80009564:	2781                	sext.w	a5,a5
    80009566:	03061713          	slli	a4,a2,0x30
    8000956a:	9341                	srli	a4,a4,0x30
    8000956c:	0786                	slli	a5,a5,0x1
    8000956e:	97b6                	add	a5,a5,a3
    80009570:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009574:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    80009578:	00066717          	auipc	a4,0x66
    8000957c:	a8870713          	addi	a4,a4,-1400 # 8006f000 <disk>
    80009580:	6789                	lui	a5,0x2
    80009582:	97ba                	add	a5,a5,a4
    80009584:	679c                	ld	a5,8(a5)
    80009586:	0027d703          	lhu	a4,2(a5) # 2002 <_entry-0x7fffdffe>
    8000958a:	00066697          	auipc	a3,0x66
    8000958e:	a7668693          	addi	a3,a3,-1418 # 8006f000 <disk>
    80009592:	6789                	lui	a5,0x2
    80009594:	97b6                	add	a5,a5,a3
    80009596:	679c                	ld	a5,8(a5)
    80009598:	2705                	addiw	a4,a4,1
    8000959a:	1742                	slli	a4,a4,0x30
    8000959c:	9341                	srli	a4,a4,0x30
    8000959e:	00e79123          	sh	a4,2(a5) # 2002 <_entry-0x7fffdffe>

  __sync_synchronize();
    800095a2:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    800095a6:	100017b7          	lui	a5,0x10001
    800095aa:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    800095ae:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    800095b2:	a819                	j	800095c8 <virtio_disk_rw+0x34e>
    sleep(b, &disk.vdisk_lock);
    800095b4:	00068597          	auipc	a1,0x68
    800095b8:	b7458593          	addi	a1,a1,-1164 # 80071128 <disk+0x2128>
    800095bc:	fc843503          	ld	a0,-56(s0)
    800095c0:	ffffa097          	auipc	ra,0xffffa
    800095c4:	f82080e7          	jalr	-126(ra) # 80003542 <sleep>
  while(b->disk == 1) {
    800095c8:	fc843783          	ld	a5,-56(s0)
    800095cc:	43dc                	lw	a5,4(a5)
    800095ce:	873e                	mv	a4,a5
    800095d0:	4785                	li	a5,1
    800095d2:	fef701e3          	beq	a4,a5,800095b4 <virtio_disk_rw+0x33a>
  }

  disk.info[idx[0]].b = 0;
    800095d6:	fd042783          	lw	a5,-48(s0)
    800095da:	00066717          	auipc	a4,0x66
    800095de:	a2670713          	addi	a4,a4,-1498 # 8006f000 <disk>
    800095e2:	20078793          	addi	a5,a5,512
    800095e6:	0792                	slli	a5,a5,0x4
    800095e8:	97ba                	add	a5,a5,a4
    800095ea:	0207b423          	sd	zero,40(a5)
  free_chain(idx[0]);
    800095ee:	fd042783          	lw	a5,-48(s0)
    800095f2:	853e                	mv	a0,a5
    800095f4:	00000097          	auipc	ra,0x0
    800095f8:	b6c080e7          	jalr	-1172(ra) # 80009160 <free_chain>

  release(&disk.vdisk_lock);
    800095fc:	00068517          	auipc	a0,0x68
    80009600:	b2c50513          	addi	a0,a0,-1236 # 80071128 <disk+0x2128>
    80009604:	ffff8097          	auipc	ra,0xffff8
    80009608:	cde080e7          	jalr	-802(ra) # 800012e2 <release>
}
    8000960c:	0001                	nop
    8000960e:	70e2                	ld	ra,56(sp)
    80009610:	7442                	ld	s0,48(sp)
    80009612:	6121                	addi	sp,sp,64
    80009614:	8082                	ret

0000000080009616 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80009616:	1101                	addi	sp,sp,-32
    80009618:	ec06                	sd	ra,24(sp)
    8000961a:	e822                	sd	s0,16(sp)
    8000961c:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    8000961e:	00068517          	auipc	a0,0x68
    80009622:	b0a50513          	addi	a0,a0,-1270 # 80071128 <disk+0x2128>
    80009626:	ffff8097          	auipc	ra,0xffff8
    8000962a:	c58080e7          	jalr	-936(ra) # 8000127e <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000962e:	100017b7          	lui	a5,0x10001
    80009632:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    80009636:	439c                	lw	a5,0(a5)
    80009638:	0007871b          	sext.w	a4,a5
    8000963c:	100017b7          	lui	a5,0x10001
    80009640:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    80009644:	8b0d                	andi	a4,a4,3
    80009646:	2701                	sext.w	a4,a4
    80009648:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    8000964a:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    8000964e:	a855                	j	80009702 <virtio_disk_intr+0xec>
    __sync_synchronize();
    80009650:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    80009654:	00066717          	auipc	a4,0x66
    80009658:	9ac70713          	addi	a4,a4,-1620 # 8006f000 <disk>
    8000965c:	6789                	lui	a5,0x2
    8000965e:	97ba                	add	a5,a5,a4
    80009660:	6b98                	ld	a4,16(a5)
    80009662:	00066697          	auipc	a3,0x66
    80009666:	99e68693          	addi	a3,a3,-1634 # 8006f000 <disk>
    8000966a:	6789                	lui	a5,0x2
    8000966c:	97b6                	add	a5,a5,a3
    8000966e:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009672:	2781                	sext.w	a5,a5
    80009674:	8b9d                	andi	a5,a5,7
    80009676:	2781                	sext.w	a5,a5
    80009678:	078e                	slli	a5,a5,0x3
    8000967a:	97ba                	add	a5,a5,a4
    8000967c:	43dc                	lw	a5,4(a5)
    8000967e:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    80009682:	00066717          	auipc	a4,0x66
    80009686:	97e70713          	addi	a4,a4,-1666 # 8006f000 <disk>
    8000968a:	fec42783          	lw	a5,-20(s0)
    8000968e:	20078793          	addi	a5,a5,512
    80009692:	0792                	slli	a5,a5,0x4
    80009694:	97ba                	add	a5,a5,a4
    80009696:	0307c783          	lbu	a5,48(a5)
    8000969a:	cb89                	beqz	a5,800096ac <virtio_disk_intr+0x96>
      panic("virtio_disk_intr status");
    8000969c:	00002517          	auipc	a0,0x2
    800096a0:	09450513          	addi	a0,a0,148 # 8000b730 <etext+0x730>
    800096a4:	ffff7097          	auipc	ra,0xffff7
    800096a8:	5ac080e7          	jalr	1452(ra) # 80000c50 <panic>

    struct buf *b = disk.info[id].b;
    800096ac:	00066717          	auipc	a4,0x66
    800096b0:	95470713          	addi	a4,a4,-1708 # 8006f000 <disk>
    800096b4:	fec42783          	lw	a5,-20(s0)
    800096b8:	20078793          	addi	a5,a5,512
    800096bc:	0792                	slli	a5,a5,0x4
    800096be:	97ba                	add	a5,a5,a4
    800096c0:	779c                	ld	a5,40(a5)
    800096c2:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    800096c6:	fe043783          	ld	a5,-32(s0)
    800096ca:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    800096ce:	fe043503          	ld	a0,-32(s0)
    800096d2:	ffffa097          	auipc	ra,0xffffa
    800096d6:	f04080e7          	jalr	-252(ra) # 800035d6 <wakeup>

    disk.used_idx += 1;
    800096da:	00066717          	auipc	a4,0x66
    800096de:	92670713          	addi	a4,a4,-1754 # 8006f000 <disk>
    800096e2:	6789                	lui	a5,0x2
    800096e4:	97ba                	add	a5,a5,a4
    800096e6:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    800096ea:	2785                	addiw	a5,a5,1
    800096ec:	03079713          	slli	a4,a5,0x30
    800096f0:	9341                	srli	a4,a4,0x30
    800096f2:	00066697          	auipc	a3,0x66
    800096f6:	90e68693          	addi	a3,a3,-1778 # 8006f000 <disk>
    800096fa:	6789                	lui	a5,0x2
    800096fc:	97b6                	add	a5,a5,a3
    800096fe:	02e79023          	sh	a4,32(a5) # 2020 <_entry-0x7fffdfe0>
  while(disk.used_idx != disk.used->idx){
    80009702:	00066717          	auipc	a4,0x66
    80009706:	8fe70713          	addi	a4,a4,-1794 # 8006f000 <disk>
    8000970a:	6789                	lui	a5,0x2
    8000970c:	97ba                	add	a5,a5,a4
    8000970e:	0207d683          	lhu	a3,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009712:	00066717          	auipc	a4,0x66
    80009716:	8ee70713          	addi	a4,a4,-1810 # 8006f000 <disk>
    8000971a:	6789                	lui	a5,0x2
    8000971c:	97ba                	add	a5,a5,a4
    8000971e:	6b9c                	ld	a5,16(a5)
    80009720:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009724:	0006871b          	sext.w	a4,a3
    80009728:	2781                	sext.w	a5,a5
    8000972a:	f2f713e3          	bne	a4,a5,80009650 <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    8000972e:	00068517          	auipc	a0,0x68
    80009732:	9fa50513          	addi	a0,a0,-1542 # 80071128 <disk+0x2128>
    80009736:	ffff8097          	auipc	ra,0xffff8
    8000973a:	bac080e7          	jalr	-1108(ra) # 800012e2 <release>
}
    8000973e:	0001                	nop
    80009740:	60e2                	ld	ra,24(sp)
    80009742:	6442                	ld	s0,16(sp)
    80009744:	6105                	addi	sp,sp,32
    80009746:	8082                	ret

0000000080009748 <sys_thrdstop>:
#include "proc.h"

// for mp3
uint64
sys_thrdstop(void)
{
    80009748:	7139                	addi	sp,sp,-64
    8000974a:	fc06                	sd	ra,56(sp)
    8000974c:	f822                	sd	s0,48(sp)
    8000974e:	0080                	addi	s0,sp,64
  int delay, context_id;
  uint64 context_id_ptr;
  uint64 handler, handler_arg;
  if (argint(0, &delay) < 0)
    80009750:	fdc40793          	addi	a5,s0,-36
    80009754:	85be                	mv	a1,a5
    80009756:	4501                	li	a0,0
    80009758:	ffffb097          	auipc	ra,0xffffb
    8000975c:	cdc080e7          	jalr	-804(ra) # 80004434 <argint>
    80009760:	87aa                	mv	a5,a0
    80009762:	0007d463          	bgez	a5,8000976a <sys_thrdstop+0x22>
    return -1;
    80009766:	57fd                	li	a5,-1
    80009768:	aa89                	j	800098ba <sys_thrdstop+0x172>
  if (argaddr(1, &context_id_ptr) < 0)
    8000976a:	fd040793          	addi	a5,s0,-48
    8000976e:	85be                	mv	a1,a5
    80009770:	4505                	li	a0,1
    80009772:	ffffb097          	auipc	ra,0xffffb
    80009776:	cfa080e7          	jalr	-774(ra) # 8000446c <argaddr>
    8000977a:	87aa                	mv	a5,a0
    8000977c:	0007d463          	bgez	a5,80009784 <sys_thrdstop+0x3c>
    return -1;
    80009780:	57fd                	li	a5,-1
    80009782:	aa25                	j	800098ba <sys_thrdstop+0x172>
  if (argaddr(2, &handler) < 0)
    80009784:	fc840793          	addi	a5,s0,-56
    80009788:	85be                	mv	a1,a5
    8000978a:	4509                	li	a0,2
    8000978c:	ffffb097          	auipc	ra,0xffffb
    80009790:	ce0080e7          	jalr	-800(ra) # 8000446c <argaddr>
    80009794:	87aa                	mv	a5,a0
    80009796:	0007d463          	bgez	a5,8000979e <sys_thrdstop+0x56>
    return -1;
    8000979a:	57fd                	li	a5,-1
    8000979c:	aa39                	j	800098ba <sys_thrdstop+0x172>
  if (argaddr(3, &handler_arg) < 0)
    8000979e:	fc040793          	addi	a5,s0,-64
    800097a2:	85be                	mv	a1,a5
    800097a4:	450d                	li	a0,3
    800097a6:	ffffb097          	auipc	ra,0xffffb
    800097aa:	cc6080e7          	jalr	-826(ra) # 8000446c <argaddr>
    800097ae:	87aa                	mv	a5,a0
    800097b0:	0007d463          	bgez	a5,800097b8 <sys_thrdstop+0x70>
    return -1;
    800097b4:	57fd                	li	a5,-1
    800097b6:	a211                	j	800098ba <sys_thrdstop+0x172>

  struct proc *proc = myproc();
    800097b8:	ffff9097          	auipc	ra,0xffff9
    800097bc:	03e080e7          	jalr	62(ra) # 800027f6 <myproc>
    800097c0:	fea43023          	sd	a0,-32(s0)
  if (copyin(proc->pagetable, (char *)&context_id, context_id_ptr, sizeof(int)) == -1) {
    800097c4:	fe043703          	ld	a4,-32(s0)
    800097c8:	6785                	lui	a5,0x1
    800097ca:	97ba                	add	a5,a5,a4
    800097cc:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    800097d0:	fd043603          	ld	a2,-48(s0)
    800097d4:	fd840713          	addi	a4,s0,-40
    800097d8:	4691                	li	a3,4
    800097da:	85ba                	mv	a1,a4
    800097dc:	853e                	mv	a0,a5
    800097de:	ffff9097          	auipc	ra,0xffff9
    800097e2:	bc2080e7          	jalr	-1086(ra) # 800023a0 <copyin>
    800097e6:	87aa                	mv	a5,a0
    800097e8:	873e                	mv	a4,a5
    800097ea:	57fd                	li	a5,-1
    800097ec:	00f71463          	bne	a4,a5,800097f4 <sys_thrdstop+0xac>
    return -1;
    800097f0:	57fd                	li	a5,-1
    800097f2:	a0e1                	j	800098ba <sys_thrdstop+0x172>
  }

  if (context_id < 0) {
    800097f4:	fd842783          	lw	a5,-40(s0)
    800097f8:	0607d063          	bgez	a5,80009858 <sys_thrdstop+0x110>
    for (int i = 0; i < MAX_THRD_NUM; i++) {
    800097fc:	fe042623          	sw	zero,-20(s0)
    80009800:	a83d                	j	8000983e <sys_thrdstop+0xf6>
      if (proc->thrdstop_context_used[i] == 0) {
    80009802:	fe043703          	ld	a4,-32(s0)
    80009806:	fec42783          	lw	a5,-20(s0)
    8000980a:	49478793          	addi	a5,a5,1172
    8000980e:	078a                	slli	a5,a5,0x2
    80009810:	97ba                	add	a5,a5,a4
    80009812:	479c                	lw	a5,8(a5)
    80009814:	e385                	bnez	a5,80009834 <sys_thrdstop+0xec>
        proc->thrdstop_context_used[i] = 1;
    80009816:	fe043703          	ld	a4,-32(s0)
    8000981a:	fec42783          	lw	a5,-20(s0)
    8000981e:	49478793          	addi	a5,a5,1172
    80009822:	078a                	slli	a5,a5,0x2
    80009824:	97ba                	add	a5,a5,a4
    80009826:	4705                	li	a4,1
    80009828:	c798                	sw	a4,8(a5)
        context_id = i;
    8000982a:	fec42783          	lw	a5,-20(s0)
    8000982e:	fcf42c23          	sw	a5,-40(s0)
        break;
    80009832:	a829                	j	8000984c <sys_thrdstop+0x104>
    for (int i = 0; i < MAX_THRD_NUM; i++) {
    80009834:	fec42783          	lw	a5,-20(s0)
    80009838:	2785                	addiw	a5,a5,1
    8000983a:	fef42623          	sw	a5,-20(s0)
    8000983e:	fec42783          	lw	a5,-20(s0)
    80009842:	0007871b          	sext.w	a4,a5
    80009846:	47bd                	li	a5,15
    80009848:	fae7dde3          	bge	a5,a4,80009802 <sys_thrdstop+0xba>
      }
    }

    if (context_id < 0) {
    8000984c:	fd842783          	lw	a5,-40(s0)
    80009850:	0007d463          	bgez	a5,80009858 <sys_thrdstop+0x110>
      return -1;
    80009854:	57fd                	li	a5,-1
    80009856:	a095                	j	800098ba <sys_thrdstop+0x172>
    }
  }

  if (copyout(proc->pagetable, context_id_ptr, (char *)&context_id, sizeof(int)) == -1) {
    80009858:	fe043703          	ld	a4,-32(s0)
    8000985c:	6785                	lui	a5,0x1
    8000985e:	97ba                	add	a5,a5,a4
    80009860:	2b87b783          	ld	a5,696(a5) # 12b8 <_entry-0x7fffed48>
    80009864:	fd043703          	ld	a4,-48(s0)
    80009868:	fd840613          	addi	a2,s0,-40
    8000986c:	4691                	li	a3,4
    8000986e:	85ba                	mv	a1,a4
    80009870:	853e                	mv	a0,a5
    80009872:	ffff9097          	auipc	ra,0xffff9
    80009876:	a60080e7          	jalr	-1440(ra) # 800022d2 <copyout>
    8000987a:	87aa                	mv	a5,a0
    8000987c:	873e                	mv	a4,a5
    8000987e:	57fd                	li	a5,-1
    80009880:	00f71463          	bne	a4,a5,80009888 <sys_thrdstop+0x140>
    return -1;
    80009884:	57fd                	li	a5,-1
    80009886:	a815                	j	800098ba <sys_thrdstop+0x172>
  }

  proc->thrdstop_context_id = context_id;
    80009888:	fd842703          	lw	a4,-40(s0)
    8000988c:	fe043783          	ld	a5,-32(s0)
    80009890:	c3f8                	sw	a4,68(a5)
  proc->thrdstop_delay = delay;
    80009892:	fdc42703          	lw	a4,-36(s0)
    80009896:	fe043783          	ld	a5,-32(s0)
    8000989a:	c3b8                	sw	a4,64(a5)
  proc->thrdstop_handler_pointer = handler;
    8000989c:	fc843703          	ld	a4,-56(s0)
    800098a0:	fe043783          	ld	a5,-32(s0)
    800098a4:	ebb8                	sd	a4,80(a5)
  proc->thrdstop_ticks = 0;
    800098a6:	fe043783          	ld	a5,-32(s0)
    800098aa:	0207ae23          	sw	zero,60(a5)
  proc->thrdstop_handler_arg = handler_arg;
    800098ae:	fc043703          	ld	a4,-64(s0)
    800098b2:	fe043783          	ld	a5,-32(s0)
    800098b6:	e7b8                	sd	a4,72(a5)

  return 0;
    800098b8:	4781                	li	a5,0
}
    800098ba:	853e                	mv	a0,a5
    800098bc:	70e2                	ld	ra,56(sp)
    800098be:	7442                	ld	s0,48(sp)
    800098c0:	6121                	addi	sp,sp,64
    800098c2:	8082                	ret

00000000800098c4 <sys_cancelthrdstop>:

// for mp3
uint64
sys_cancelthrdstop(void)
{
    800098c4:	7179                	addi	sp,sp,-48
    800098c6:	f406                	sd	ra,40(sp)
    800098c8:	f022                	sd	s0,32(sp)
    800098ca:	1800                	addi	s0,sp,48
  int context_id, is_exit;
  if (argint(0, &context_id) < 0)
    800098cc:	fe040793          	addi	a5,s0,-32
    800098d0:	85be                	mv	a1,a5
    800098d2:	4501                	li	a0,0
    800098d4:	ffffb097          	auipc	ra,0xffffb
    800098d8:	b60080e7          	jalr	-1184(ra) # 80004434 <argint>
    800098dc:	87aa                	mv	a5,a0
    800098de:	0007d463          	bgez	a5,800098e6 <sys_cancelthrdstop+0x22>
    return -1;
    800098e2:	57fd                	li	a5,-1
    800098e4:	a859                	j	8000997a <sys_cancelthrdstop+0xb6>
  if (argint(1, &is_exit) < 0)
    800098e6:	fdc40793          	addi	a5,s0,-36
    800098ea:	85be                	mv	a1,a5
    800098ec:	4505                	li	a0,1
    800098ee:	ffffb097          	auipc	ra,0xffffb
    800098f2:	b46080e7          	jalr	-1210(ra) # 80004434 <argint>
    800098f6:	87aa                	mv	a5,a0
    800098f8:	0007d463          	bgez	a5,80009900 <sys_cancelthrdstop+0x3c>
    return -1;
    800098fc:	57fd                	li	a5,-1
    800098fe:	a8b5                	j	8000997a <sys_cancelthrdstop+0xb6>

  if (context_id < 0 || context_id >= MAX_THRD_NUM) {
    80009900:	fe042783          	lw	a5,-32(s0)
    80009904:	0007c863          	bltz	a5,80009914 <sys_cancelthrdstop+0x50>
    80009908:	fe042783          	lw	a5,-32(s0)
    8000990c:	873e                	mv	a4,a5
    8000990e:	47bd                	li	a5,15
    80009910:	00e7d463          	bge	a5,a4,80009918 <sys_cancelthrdstop+0x54>
    return -1;
    80009914:	57fd                	li	a5,-1
    80009916:	a095                	j	8000997a <sys_cancelthrdstop+0xb6>
  }

  struct proc *proc = myproc();
    80009918:	ffff9097          	auipc	ra,0xffff9
    8000991c:	ede080e7          	jalr	-290(ra) # 800027f6 <myproc>
    80009920:	fea43423          	sd	a0,-24(s0)

  // cancel previous thrdstop
  int consume_tick = proc->thrdstop_ticks;
    80009924:	fe843783          	ld	a5,-24(s0)
    80009928:	5fdc                	lw	a5,60(a5)
    8000992a:	fef42223          	sw	a5,-28(s0)
  proc->thrdstop_delay = -1;
    8000992e:	fe843783          	ld	a5,-24(s0)
    80009932:	577d                	li	a4,-1
    80009934:	c3b8                	sw	a4,64(a5)

  if (is_exit == 0) {
    80009936:	fdc42783          	lw	a5,-36(s0)
    8000993a:	eb91                	bnez	a5,8000994e <sys_cancelthrdstop+0x8a>
    proc->cancel_save_flag = context_id;
    8000993c:	fe042703          	lw	a4,-32(s0)
    80009940:	fe843683          	ld	a3,-24(s0)
    80009944:	6785                	lui	a5,0x1
    80009946:	97b6                	add	a5,a5,a3
    80009948:	2ae7a023          	sw	a4,672(a5) # 12a0 <_entry-0x7fffed60>
    8000994c:	a02d                	j	80009976 <sys_cancelthrdstop+0xb2>
  } else if (context_id >= 0 && context_id < MAX_THRD_NUM) {
    8000994e:	fe042783          	lw	a5,-32(s0)
    80009952:	0207c263          	bltz	a5,80009976 <sys_cancelthrdstop+0xb2>
    80009956:	fe042783          	lw	a5,-32(s0)
    8000995a:	873e                	mv	a4,a5
    8000995c:	47bd                	li	a5,15
    8000995e:	00e7cc63          	blt	a5,a4,80009976 <sys_cancelthrdstop+0xb2>
    proc->thrdstop_context_used[context_id] = 0;
    80009962:	fe042783          	lw	a5,-32(s0)
    80009966:	fe843703          	ld	a4,-24(s0)
    8000996a:	49478793          	addi	a5,a5,1172
    8000996e:	078a                	slli	a5,a5,0x2
    80009970:	97ba                	add	a5,a5,a4
    80009972:	0007a423          	sw	zero,8(a5)
  }

  return consume_tick;
    80009976:	fe442783          	lw	a5,-28(s0)
}
    8000997a:	853e                	mv	a0,a5
    8000997c:	70a2                	ld	ra,40(sp)
    8000997e:	7402                	ld	s0,32(sp)
    80009980:	6145                	addi	sp,sp,48
    80009982:	8082                	ret

0000000080009984 <sys_thrdresume>:

// for mp3
uint64
sys_thrdresume(void)
{
    80009984:	1101                	addi	sp,sp,-32
    80009986:	ec06                	sd	ra,24(sp)
    80009988:	e822                	sd	s0,16(sp)
    8000998a:	1000                	addi	s0,sp,32
  int context_id;
  if (argint(0, &context_id) < 0)
    8000998c:	fe440793          	addi	a5,s0,-28
    80009990:	85be                	mv	a1,a5
    80009992:	4501                	li	a0,0
    80009994:	ffffb097          	auipc	ra,0xffffb
    80009998:	aa0080e7          	jalr	-1376(ra) # 80004434 <argint>
    8000999c:	87aa                	mv	a5,a0
    8000999e:	0007d463          	bgez	a5,800099a6 <sys_thrdresume+0x22>
    return -1;
    800099a2:	57fd                	li	a5,-1
    800099a4:	a825                	j	800099dc <sys_thrdresume+0x58>

  struct proc *proc = myproc();
    800099a6:	ffff9097          	auipc	ra,0xffff9
    800099aa:	e50080e7          	jalr	-432(ra) # 800027f6 <myproc>
    800099ae:	fea43423          	sd	a0,-24(s0)

  if (context_id < 0 || context_id >= MAX_THRD_NUM)
    800099b2:	fe442783          	lw	a5,-28(s0)
    800099b6:	0007c863          	bltz	a5,800099c6 <sys_thrdresume+0x42>
    800099ba:	fe442783          	lw	a5,-28(s0)
    800099be:	873e                	mv	a4,a5
    800099c0:	47bd                	li	a5,15
    800099c2:	00e7d463          	bge	a5,a4,800099ca <sys_thrdresume+0x46>
    return -1;
    800099c6:	57fd                	li	a5,-1
    800099c8:	a811                	j	800099dc <sys_thrdresume+0x58>

  proc->resume_flag = context_id;
    800099ca:	fe442703          	lw	a4,-28(s0)
    800099ce:	fe843683          	ld	a3,-24(s0)
    800099d2:	6785                	lui	a5,0x1
    800099d4:	97b6                	add	a5,a5,a3
    800099d6:	28e7ae23          	sw	a4,668(a5) # 129c <_entry-0x7fffed64>

  return 0;
    800099da:	4781                	li	a5,0
}
    800099dc:	853e                	mv	a0,a5
    800099de:	60e2                	ld	ra,24(sp)
    800099e0:	6442                	ld	s0,16(sp)
    800099e2:	6105                	addi	sp,sp,32
    800099e4:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051573          	csrrw	a0,sscratch,a0
    8000a004:	02153423          	sd	ra,40(a0)
    8000a008:	02253823          	sd	sp,48(a0)
    8000a00c:	02353c23          	sd	gp,56(a0)
    8000a010:	04453023          	sd	tp,64(a0)
    8000a014:	04553423          	sd	t0,72(a0)
    8000a018:	04653823          	sd	t1,80(a0)
    8000a01c:	04753c23          	sd	t2,88(a0)
    8000a020:	f120                	sd	s0,96(a0)
    8000a022:	f524                	sd	s1,104(a0)
    8000a024:	fd2c                	sd	a1,120(a0)
    8000a026:	e150                	sd	a2,128(a0)
    8000a028:	e554                	sd	a3,136(a0)
    8000a02a:	e958                	sd	a4,144(a0)
    8000a02c:	ed5c                	sd	a5,152(a0)
    8000a02e:	0b053023          	sd	a6,160(a0)
    8000a032:	0b153423          	sd	a7,168(a0)
    8000a036:	0b253823          	sd	s2,176(a0)
    8000a03a:	0b353c23          	sd	s3,184(a0)
    8000a03e:	0d453023          	sd	s4,192(a0)
    8000a042:	0d553423          	sd	s5,200(a0)
    8000a046:	0d653823          	sd	s6,208(a0)
    8000a04a:	0d753c23          	sd	s7,216(a0)
    8000a04e:	0f853023          	sd	s8,224(a0)
    8000a052:	0f953423          	sd	s9,232(a0)
    8000a056:	0fa53823          	sd	s10,240(a0)
    8000a05a:	0fb53c23          	sd	s11,248(a0)
    8000a05e:	11c53023          	sd	t3,256(a0)
    8000a062:	11d53423          	sd	t4,264(a0)
    8000a066:	11e53823          	sd	t5,272(a0)
    8000a06a:	11f53c23          	sd	t6,280(a0)
    8000a06e:	140022f3          	csrr	t0,sscratch
    8000a072:	06553823          	sd	t0,112(a0)
    8000a076:	00853103          	ld	sp,8(a0)
    8000a07a:	02053203          	ld	tp,32(a0)
    8000a07e:	01053283          	ld	t0,16(a0)
    8000a082:	00053303          	ld	t1,0(a0)
    8000a086:	18031073          	csrw	satp,t1
    8000a08a:	12000073          	sfence.vma
    8000a08e:	8282                	jr	t0

000000008000a090 <userret>:
    8000a090:	18059073          	csrw	satp,a1
    8000a094:	12000073          	sfence.vma
    8000a098:	07053283          	ld	t0,112(a0)
    8000a09c:	14029073          	csrw	sscratch,t0
    8000a0a0:	02853083          	ld	ra,40(a0)
    8000a0a4:	03053103          	ld	sp,48(a0)
    8000a0a8:	03853183          	ld	gp,56(a0)
    8000a0ac:	04053203          	ld	tp,64(a0)
    8000a0b0:	04853283          	ld	t0,72(a0)
    8000a0b4:	05053303          	ld	t1,80(a0)
    8000a0b8:	05853383          	ld	t2,88(a0)
    8000a0bc:	7120                	ld	s0,96(a0)
    8000a0be:	7524                	ld	s1,104(a0)
    8000a0c0:	7d2c                	ld	a1,120(a0)
    8000a0c2:	6150                	ld	a2,128(a0)
    8000a0c4:	6554                	ld	a3,136(a0)
    8000a0c6:	6958                	ld	a4,144(a0)
    8000a0c8:	6d5c                	ld	a5,152(a0)
    8000a0ca:	0a053803          	ld	a6,160(a0)
    8000a0ce:	0a853883          	ld	a7,168(a0)
    8000a0d2:	0b053903          	ld	s2,176(a0)
    8000a0d6:	0b853983          	ld	s3,184(a0)
    8000a0da:	0c053a03          	ld	s4,192(a0)
    8000a0de:	0c853a83          	ld	s5,200(a0)
    8000a0e2:	0d053b03          	ld	s6,208(a0)
    8000a0e6:	0d853b83          	ld	s7,216(a0)
    8000a0ea:	0e053c03          	ld	s8,224(a0)
    8000a0ee:	0e853c83          	ld	s9,232(a0)
    8000a0f2:	0f053d03          	ld	s10,240(a0)
    8000a0f6:	0f853d83          	ld	s11,248(a0)
    8000a0fa:	10053e03          	ld	t3,256(a0)
    8000a0fe:	10853e83          	ld	t4,264(a0)
    8000a102:	11053f03          	ld	t5,272(a0)
    8000a106:	11853f83          	ld	t6,280(a0)
    8000a10a:	14051573          	csrrw	a0,sscratch,a0
    8000a10e:	10200073          	sret
	...
