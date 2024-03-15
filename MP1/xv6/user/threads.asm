
user/_threads:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <thread_create>:
static struct thread* current_thread = NULL;
static int id = 1;
static jmp_buf env_st;
static jmp_buf env_tmp;

struct thread *thread_create(void (*f)(void *), void *arg){
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
  10:	8a2a                	mv	s4,a0
  12:	89ae                	mv	s3,a1
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
  14:	6921                	lui	s2,0x8
  16:	ab090513          	addi	a0,s2,-1360 # 7ab0 <__global_pointer$+0x6587>
  1a:	00001097          	auipc	ra,0x1
  1e:	b9a080e7          	jalr	-1126(ra) # bb4 <malloc>
  22:	84aa                	mv	s1,a0
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
  24:	6505                	lui	a0,0x1
  26:	80050513          	addi	a0,a0,-2048 # 800 <getpid+0x2>
  2a:	00001097          	auipc	ra,0x1
  2e:	b8a080e7          	jalr	-1142(ra) # bb4 <malloc>
    new_stack_p = new_stack + 0x100*8-0x2*8;
    t->fp = f;
  32:	0144b023          	sd	s4,0(s1)
    t->arg = arg;
  36:	0134b423          	sd	s3,8(s1)
    t->ID  = id;
  3a:	00001997          	auipc	s3,0x1
  3e:	cf298993          	addi	s3,s3,-782 # d2c <id>
  42:	0009a783          	lw	a5,0(s3)
  46:	08f4aa23          	sw	a5,148(s1)
    t->buf_set = 0;
  4a:	0804a823          	sw	zero,144(s1)
    t->stack = (void*) new_stack;
  4e:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack + 0x100*8-0x2*8;
  50:	7f050513          	addi	a0,a0,2032
    t->stack_p = (void*) new_stack_p;
  54:	ec88                	sd	a0,24(s1)

    t->task_id = 0;
  56:	9926                	add	s2,s2,s1
  58:	aa092423          	sw	zero,-1368(s2)
    memset(t->task_sets, 0, sizeof(t->task_sets));
  5c:	20000613          	li	a2,512
  60:	4581                	li	a1,0
  62:	651d                	lui	a0,0x7
  64:	0a850513          	addi	a0,a0,168 # 70a8 <__global_pointer$+0x5b7f>
  68:	9526                	add	a0,a0,s1
  6a:	00000097          	auipc	ra,0x0
  6e:	510080e7          	jalr	1296(ra) # 57a <memset>
    id++;
  72:	0009a783          	lw	a5,0(s3)
  76:	2785                	addiw	a5,a5,1
  78:	00f9a023          	sw	a5,0(s3)
    return t;
}
  7c:	8526                	mv	a0,s1
  7e:	70a2                	ld	ra,40(sp)
  80:	7402                	ld	s0,32(sp)
  82:	64e2                	ld	s1,24(sp)
  84:	6942                	ld	s2,16(sp)
  86:	69a2                	ld	s3,8(sp)
  88:	6a02                	ld	s4,0(sp)
  8a:	6145                	addi	sp,sp,48
  8c:	8082                	ret

000000000000008e <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
  8e:	1141                	addi	sp,sp,-16
  90:	e422                	sd	s0,8(sp)
  92:	0800                	addi	s0,sp,16
    if(current_thread == NULL){
  94:	00001797          	auipc	a5,0x1
  98:	c9c7b783          	ld	a5,-868(a5) # d30 <current_thread>
  9c:	cb89                	beqz	a5,ae <thread_add_runqueue+0x20>
        current_thread->next = current_thread;
        current_thread->previous = current_thread;
    }
    else{
        // TODO
        struct thread *prevoius_thread = current_thread->previous;
  9e:	6fd8                	ld	a4,152(a5)
        t->next = current_thread;
  a0:	f15c                	sd	a5,160(a0)
        t->previous = prevoius_thread;
  a2:	ed58                	sd	a4,152(a0)
        prevoius_thread->next = t;
  a4:	f348                	sd	a0,160(a4)
        current_thread->previous = t;
  a6:	efc8                	sd	a0,152(a5)
    }
}
  a8:	6422                	ld	s0,8(sp)
  aa:	0141                	addi	sp,sp,16
  ac:	8082                	ret
        current_thread = t;
  ae:	00001797          	auipc	a5,0x1
  b2:	c8a7b123          	sd	a0,-894(a5) # d30 <current_thread>
        current_thread->next = current_thread;
  b6:	f148                	sd	a0,160(a0)
        current_thread->previous = current_thread;
  b8:	ed48                	sd	a0,152(a0)
  ba:	b7fd                	j	a8 <thread_add_runqueue+0x1a>

00000000000000bc <schedule>:
        current_thread->env->sp = env_tmp->sp;
        current_thread->fp(current_thread->arg);
    }
    thread_exit();
}
void schedule(void){
  bc:	1141                	addi	sp,sp,-16
  be:	e422                	sd	s0,8(sp)
  c0:	0800                	addi	s0,sp,16
    // TODO
    current_thread = current_thread->next;
  c2:	00001797          	auipc	a5,0x1
  c6:	c6e78793          	addi	a5,a5,-914 # d30 <current_thread>
  ca:	6398                	ld	a4,0(a5)
  cc:	7358                	ld	a4,160(a4)
  ce:	e398                	sd	a4,0(a5)
}
  d0:	6422                	ld	s0,8(sp)
  d2:	0141                	addi	sp,sp,16
  d4:	8082                	ret

00000000000000d6 <thread_exit>:
void thread_exit(void){
  d6:	1101                	addi	sp,sp,-32
  d8:	ec06                	sd	ra,24(sp)
  da:	e822                	sd	s0,16(sp)
  dc:	e426                	sd	s1,8(sp)
  de:	e04a                	sd	s2,0(sp)
  e0:	1000                	addi	s0,sp,32
    if(current_thread->next != current_thread){
  e2:	00001497          	auipc	s1,0x1
  e6:	c4e4b483          	ld	s1,-946(s1) # d30 <current_thread>
  ea:	70dc                	ld	a5,160(s1)
  ec:	06f48f63          	beq	s1,a5,16a <thread_exit+0x94>
        // TODO
        struct thread *tmp = current_thread;
        struct thread *prevoius_thread = current_thread->previous;
  f0:	6cd8                	ld	a4,152(s1)
        struct thread *next_thread = current_thread->next;

        prevoius_thread->next = next_thread;
  f2:	f35c                	sd	a5,160(a4)
        next_thread->previous = prevoius_thread;
  f4:	efd8                	sd	a4,152(a5)
        current_thread = next_thread;
  f6:	00001917          	auipc	s2,0x1
  fa:	c3a90913          	addi	s2,s2,-966 # d30 <current_thread>
  fe:	00f93023          	sd	a5,0(s2)
        
        free(tmp->stack);
 102:	6888                	ld	a0,16(s1)
 104:	00001097          	auipc	ra,0x1
 108:	a28080e7          	jalr	-1496(ra) # b2c <free>
        free(tmp);
 10c:	8526                	mv	a0,s1
 10e:	00001097          	auipc	ra,0x1
 112:	a1e080e7          	jalr	-1506(ra) # b2c <free>

        if (current_thread->task_id){
 116:	00093503          	ld	a0,0(s2)
 11a:	67a1                	lui	a5,0x8
 11c:	97aa                	add	a5,a5,a0
 11e:	aa87a703          	lw	a4,-1368(a5) # 7aa8 <__global_pointer$+0x657f>
 122:	cb15                	beqz	a4,156 <thread_exit+0x80>
            current_thread->stack_p = (void*)current_thread->task_envs[current_thread->task_id]->sp;
 124:	00371793          	slli	a5,a4,0x3
 128:	40e786b3          	sub	a3,a5,a4
 12c:	0692                	slli	a3,a3,0x4
 12e:	96aa                	add	a3,a3,a0
 130:	1106b683          	ld	a3,272(a3)
 134:	ed14                	sd	a3,24(a0)
            longjmp(current_thread->task_envs[current_thread->task_id], 1);
 136:	8f99                	sub	a5,a5,a4
 138:	0792                	slli	a5,a5,0x4
 13a:	0a878793          	addi	a5,a5,168
 13e:	4585                	li	a1,1
 140:	953e                	add	a0,a0,a5
 142:	00001097          	auipc	ra,0x1
 146:	b8e080e7          	jalr	-1138(ra) # cd0 <longjmp>
        free(current_thread->stack);
        free(current_thread);
        current_thread = NULL;
        longjmp(env_st, 1);
    }
}
 14a:	60e2                	ld	ra,24(sp)
 14c:	6442                	ld	s0,16(sp)
 14e:	64a2                	ld	s1,8(sp)
 150:	6902                	ld	s2,0(sp)
 152:	6105                	addi	sp,sp,32
 154:	8082                	ret
            current_thread->stack_p = (void*)current_thread->env->sp;
 156:	655c                	ld	a5,136(a0)
 158:	ed1c                	sd	a5,24(a0)
            longjmp(current_thread->env, 1); // jump to next thread
 15a:	4585                	li	a1,1
 15c:	02050513          	addi	a0,a0,32
 160:	00001097          	auipc	ra,0x1
 164:	b70080e7          	jalr	-1168(ra) # cd0 <longjmp>
 168:	b7cd                	j	14a <thread_exit+0x74>
        free(current_thread->stack);
 16a:	6888                	ld	a0,16(s1)
 16c:	00001097          	auipc	ra,0x1
 170:	9c0080e7          	jalr	-1600(ra) # b2c <free>
        free(current_thread);
 174:	00001497          	auipc	s1,0x1
 178:	bbc48493          	addi	s1,s1,-1092 # d30 <current_thread>
 17c:	6088                	ld	a0,0(s1)
 17e:	00001097          	auipc	ra,0x1
 182:	9ae080e7          	jalr	-1618(ra) # b2c <free>
        current_thread = NULL;
 186:	0004b023          	sd	zero,0(s1)
        longjmp(env_st, 1);
 18a:	4585                	li	a1,1
 18c:	00001517          	auipc	a0,0x1
 190:	bb450513          	addi	a0,a0,-1100 # d40 <env_st>
 194:	00001097          	auipc	ra,0x1
 198:	b3c080e7          	jalr	-1220(ra) # cd0 <longjmp>
}
 19c:	b77d                	j	14a <thread_exit+0x74>

000000000000019e <dispatch>:
void dispatch(void){
 19e:	1101                	addi	sp,sp,-32
 1a0:	ec06                	sd	ra,24(sp)
 1a2:	e822                	sd	s0,16(sp)
 1a4:	1000                	addi	s0,sp,32
    if (current_thread->task_id){
 1a6:	00001717          	auipc	a4,0x1
 1aa:	b8a73703          	ld	a4,-1142(a4) # d30 <current_thread>
 1ae:	67a1                	lui	a5,0x8
 1b0:	97ba                	add	a5,a5,a4
 1b2:	aa87a683          	lw	a3,-1368(a5) # 7aa8 <__global_pointer$+0x657f>
 1b6:	fed43423          	sd	a3,-24(s0)
 1ba:	cec1                	beqz	a3,252 <dispatch+0xb4>
        if (current_thread->task_sets[current_task_id]){ // if the task has been set
 1bc:	6789                	lui	a5,0x2
 1be:	c2878793          	addi	a5,a5,-984 # 1c28 <__global_pointer$+0x6ff>
 1c2:	97b6                	add	a5,a5,a3
 1c4:	078a                	slli	a5,a5,0x2
 1c6:	97ba                	add	a5,a5,a4
 1c8:	479c                	lw	a5,8(a5)
 1ca:	eff9                	bnez	a5,2a8 <dispatch+0x10a>
        current_thread->task_sets[current_task_id] = 1; // set the task
 1cc:	6789                	lui	a5,0x2
 1ce:	c2878793          	addi	a5,a5,-984 # 1c28 <__global_pointer$+0x6ff>
 1d2:	fe843703          	ld	a4,-24(s0)
 1d6:	97ba                	add	a5,a5,a4
 1d8:	078a                	slli	a5,a5,0x2
 1da:	00001717          	auipc	a4,0x1
 1de:	b5673703          	ld	a4,-1194(a4) # d30 <current_thread>
 1e2:	97ba                	add	a5,a5,a4
 1e4:	4705                	li	a4,1
 1e6:	c798                	sw	a4,8(a5)
        if (setjmp(env_tmp) == 0){
 1e8:	00001517          	auipc	a0,0x1
 1ec:	bc850513          	addi	a0,a0,-1080 # db0 <env_tmp>
 1f0:	00001097          	auipc	ra,0x1
 1f4:	aa8080e7          	jalr	-1368(ra) # c98 <setjmp>
 1f8:	cd69                	beqz	a0,2d2 <dispatch+0x134>
            current_thread->task_envs[current_task_id]->sp = env_tmp->sp;
 1fa:	00001797          	auipc	a5,0x1
 1fe:	b367b783          	ld	a5,-1226(a5) # d30 <current_thread>
 202:	fe843703          	ld	a4,-24(s0)
 206:	00371693          	slli	a3,a4,0x3
 20a:	40e68733          	sub	a4,a3,a4
 20e:	0712                	slli	a4,a4,0x4
 210:	973e                	add	a4,a4,a5
 212:	00001617          	auipc	a2,0x1
 216:	c0663603          	ld	a2,-1018(a2) # e18 <env_tmp+0x68>
 21a:	10c73823          	sd	a2,272(a4)
            void (*task)(void *) = current_thread->tasks[current_task_id];
 21e:	97b6                	add	a5,a5,a3
            void *task_arg = current_thread->task_args[current_task_id];
 220:	671d                	lui	a4,0x7
 222:	97ba                	add	a5,a5,a4
            task(task_arg);
 224:	2a87b703          	ld	a4,680(a5)
 228:	6a87b503          	ld	a0,1704(a5)
 22c:	9702                	jalr	a4
        longjmp(current_thread->task_envs[current_task_id], 1);
 22e:	fe843703          	ld	a4,-24(s0)
 232:	00371793          	slli	a5,a4,0x3
 236:	8f99                	sub	a5,a5,a4
 238:	0792                	slli	a5,a5,0x4
 23a:	0a878793          	addi	a5,a5,168
 23e:	4585                	li	a1,1
 240:	00001517          	auipc	a0,0x1
 244:	af053503          	ld	a0,-1296(a0) # d30 <current_thread>
 248:	953e                	add	a0,a0,a5
 24a:	00001097          	auipc	ra,0x1
 24e:	a86080e7          	jalr	-1402(ra) # cd0 <longjmp>
    if (current_thread->buf_set){ // if the jmp_buf has been set
 252:	00001517          	auipc	a0,0x1
 256:	ade53503          	ld	a0,-1314(a0) # d30 <current_thread>
 25a:	09052783          	lw	a5,144(a0)
 25e:	efc9                	bnez	a5,2f8 <dispatch+0x15a>
    current_thread->buf_set = 1; // set the jmp_buf
 260:	00001797          	auipc	a5,0x1
 264:	ad07b783          	ld	a5,-1328(a5) # d30 <current_thread>
 268:	4705                	li	a4,1
 26a:	08e7a823          	sw	a4,144(a5)
    if (setjmp(env_tmp) == 0){
 26e:	00001517          	auipc	a0,0x1
 272:	b4250513          	addi	a0,a0,-1214 # db0 <env_tmp>
 276:	00001097          	auipc	ra,0x1
 27a:	a22080e7          	jalr	-1502(ra) # c98 <setjmp>
 27e:	c559                	beqz	a0,30c <dispatch+0x16e>
        current_thread->env->sp = env_tmp->sp;
 280:	00001797          	auipc	a5,0x1
 284:	ab07b783          	ld	a5,-1360(a5) # d30 <current_thread>
 288:	00001717          	auipc	a4,0x1
 28c:	b9073703          	ld	a4,-1136(a4) # e18 <env_tmp+0x68>
 290:	e7d8                	sd	a4,136(a5)
        current_thread->fp(current_thread->arg);
 292:	6398                	ld	a4,0(a5)
 294:	6788                	ld	a0,8(a5)
 296:	9702                	jalr	a4
    thread_exit();
 298:	00000097          	auipc	ra,0x0
 29c:	e3e080e7          	jalr	-450(ra) # d6 <thread_exit>
}
 2a0:	60e2                	ld	ra,24(sp)
 2a2:	6442                	ld	s0,16(sp)
 2a4:	6105                	addi	sp,sp,32
 2a6:	8082                	ret
            current_thread->stack_p = (void*)current_thread->task_envs[current_task_id]->sp;
 2a8:	00369793          	slli	a5,a3,0x3
 2ac:	8f95                	sub	a5,a5,a3
 2ae:	0792                	slli	a5,a5,0x4
 2b0:	97ba                	add	a5,a5,a4
 2b2:	1107b783          	ld	a5,272(a5)
 2b6:	ef1c                	sd	a5,24(a4)
            longjmp(current_thread->task_envs[current_task_id], 1);
 2b8:	00369513          	slli	a0,a3,0x3
 2bc:	8d15                	sub	a0,a0,a3
 2be:	0512                	slli	a0,a0,0x4
 2c0:	0a850513          	addi	a0,a0,168
 2c4:	4585                	li	a1,1
 2c6:	953a                	add	a0,a0,a4
 2c8:	00001097          	auipc	ra,0x1
 2cc:	a08080e7          	jalr	-1528(ra) # cd0 <longjmp>
 2d0:	bdf5                	j	1cc <dispatch+0x2e>
            env_tmp->sp = (unsigned long)current_thread->stack_p; // set the stack pointer
 2d2:	00001797          	auipc	a5,0x1
 2d6:	a5e7b783          	ld	a5,-1442(a5) # d30 <current_thread>
 2da:	6f9c                	ld	a5,24(a5)
 2dc:	00001717          	auipc	a4,0x1
 2e0:	b2f73e23          	sd	a5,-1220(a4) # e18 <env_tmp+0x68>
            longjmp(env_tmp, 1);
 2e4:	4585                	li	a1,1
 2e6:	00001517          	auipc	a0,0x1
 2ea:	aca50513          	addi	a0,a0,-1334 # db0 <env_tmp>
 2ee:	00001097          	auipc	ra,0x1
 2f2:	9e2080e7          	jalr	-1566(ra) # cd0 <longjmp>
 2f6:	bf25                	j	22e <dispatch+0x90>
        current_thread->stack_p = (void*)current_thread->env->sp;
 2f8:	655c                	ld	a5,136(a0)
 2fa:	ed1c                	sd	a5,24(a0)
        longjmp(current_thread->env, 1);
 2fc:	4585                	li	a1,1
 2fe:	02050513          	addi	a0,a0,32
 302:	00001097          	auipc	ra,0x1
 306:	9ce080e7          	jalr	-1586(ra) # cd0 <longjmp>
 30a:	bf99                	j	260 <dispatch+0xc2>
        env_tmp->sp = (unsigned long)current_thread->stack_p; // set the stack pointer
 30c:	00001797          	auipc	a5,0x1
 310:	a247b783          	ld	a5,-1500(a5) # d30 <current_thread>
 314:	6f9c                	ld	a5,24(a5)
 316:	00001717          	auipc	a4,0x1
 31a:	b0f73123          	sd	a5,-1278(a4) # e18 <env_tmp+0x68>
        longjmp(env_tmp, 1);
 31e:	4585                	li	a1,1
 320:	00001517          	auipc	a0,0x1
 324:	a9050513          	addi	a0,a0,-1392 # db0 <env_tmp>
 328:	00001097          	auipc	ra,0x1
 32c:	9a8080e7          	jalr	-1624(ra) # cd0 <longjmp>
 330:	b7a5                	j	298 <dispatch+0xfa>

0000000000000332 <thread_start_threading>:
void thread_start_threading(void){
 332:	1141                	addi	sp,sp,-16
 334:	e406                	sd	ra,8(sp)
 336:	e022                	sd	s0,0(sp)
 338:	0800                	addi	s0,sp,16
    // TODO
    if (setjmp(env_st) == 0){
 33a:	00001517          	auipc	a0,0x1
 33e:	a0650513          	addi	a0,a0,-1530 # d40 <env_st>
 342:	00001097          	auipc	ra,0x1
 346:	956080e7          	jalr	-1706(ra) # c98 <setjmp>
 34a:	c509                	beqz	a0,354 <thread_start_threading+0x22>
        dispatch();
    }    
}
 34c:	60a2                	ld	ra,8(sp)
 34e:	6402                	ld	s0,0(sp)
 350:	0141                	addi	sp,sp,16
 352:	8082                	ret
        dispatch();
 354:	00000097          	auipc	ra,0x0
 358:	e4a080e7          	jalr	-438(ra) # 19e <dispatch>
}
 35c:	bfc5                	j	34c <thread_start_threading+0x1a>

000000000000035e <push>:
    push(t);
    t->tasks[t->task_id] = f;
    t->task_args[t->task_id] = arg; 
}

void push(struct thread *t) {
 35e:	1141                	addi	sp,sp,-16
 360:	e422                	sd	s0,8(sp)
 362:	0800                	addi	s0,sp,16
    // printf("Thread%d pushing\n", t->ID);
    t->stack_p -= 0x2*8;
 364:	6d1c                	ld	a5,24(a0)
 366:	17c1                	addi	a5,a5,-16
 368:	ed1c                	sd	a5,24(a0)
    t->task_id++;
 36a:	67a1                	lui	a5,0x8
 36c:	953e                	add	a0,a0,a5
 36e:	aa852783          	lw	a5,-1368(a0)
 372:	2785                	addiw	a5,a5,1
 374:	aaf52423          	sw	a5,-1368(a0)
}
 378:	6422                	ld	s0,8(sp)
 37a:	0141                	addi	sp,sp,16
 37c:	8082                	ret

000000000000037e <thread_assign_task>:
void thread_assign_task(struct thread *t, void (*f)(void *), void *arg){
 37e:	7179                	addi	sp,sp,-48
 380:	f406                	sd	ra,40(sp)
 382:	f022                	sd	s0,32(sp)
 384:	ec26                	sd	s1,24(sp)
 386:	e84a                	sd	s2,16(sp)
 388:	e44e                	sd	s3,8(sp)
 38a:	1800                	addi	s0,sp,48
 38c:	84aa                	mv	s1,a0
 38e:	89ae                	mv	s3,a1
 390:	8932                	mv	s2,a2
    push(t);
 392:	00000097          	auipc	ra,0x0
 396:	fcc080e7          	jalr	-52(ra) # 35e <push>
    t->tasks[t->task_id] = f;
 39a:	67a1                	lui	a5,0x8
 39c:	97a6                	add	a5,a5,s1
 39e:	aa87a503          	lw	a0,-1368(a5) # 7aa8 <__global_pointer$+0x657f>
 3a2:	050e                	slli	a0,a0,0x3
 3a4:	94aa                	add	s1,s1,a0
 3a6:	651d                	lui	a0,0x7
 3a8:	94aa                	add	s1,s1,a0
 3aa:	2b34b423          	sd	s3,680(s1)
    t->task_args[t->task_id] = arg; 
 3ae:	6b24b423          	sd	s2,1704(s1)
}
 3b2:	70a2                	ld	ra,40(sp)
 3b4:	7402                	ld	s0,32(sp)
 3b6:	64e2                	ld	s1,24(sp)
 3b8:	6942                	ld	s2,16(sp)
 3ba:	69a2                	ld	s3,8(sp)
 3bc:	6145                	addi	sp,sp,48
 3be:	8082                	ret

00000000000003c0 <pop>:

void pop(struct thread *t) {
 3c0:	1141                	addi	sp,sp,-16
 3c2:	e422                	sd	s0,8(sp)
 3c4:	0800                	addi	s0,sp,16
    // printf("Thread%d popping\n", t->ID);
    t->stack_p += 0x2*8;
 3c6:	6d1c                	ld	a5,24(a0)
 3c8:	07c1                	addi	a5,a5,16
 3ca:	ed1c                	sd	a5,24(a0)
    t->task_sets[t->task_id] = 0;
 3cc:	6721                	lui	a4,0x8
 3ce:	972a                	add	a4,a4,a0
 3d0:	aa872683          	lw	a3,-1368(a4) # 7aa8 <__global_pointer$+0x657f>
 3d4:	6789                	lui	a5,0x2
 3d6:	c2878793          	addi	a5,a5,-984 # 1c28 <__global_pointer$+0x6ff>
 3da:	97b6                	add	a5,a5,a3
 3dc:	078a                	slli	a5,a5,0x2
 3de:	953e                	add	a0,a0,a5
 3e0:	00052423          	sw	zero,8(a0) # 7008 <__global_pointer$+0x5adf>
    t->task_id--;
 3e4:	36fd                	addiw	a3,a3,-1
 3e6:	aad72423          	sw	a3,-1368(a4)
 3ea:	6422                	ld	s0,8(sp)
 3ec:	0141                	addi	sp,sp,16
 3ee:	8082                	ret

00000000000003f0 <thread_yield>:
void thread_yield(void){
 3f0:	1141                	addi	sp,sp,-16
 3f2:	e406                	sd	ra,8(sp)
 3f4:	e022                	sd	s0,0(sp)
 3f6:	0800                	addi	s0,sp,16
    if (current_thread->task_id){
 3f8:	00001517          	auipc	a0,0x1
 3fc:	93853503          	ld	a0,-1736(a0) # d30 <current_thread>
 400:	67a1                	lui	a5,0x8
 402:	97aa                	add	a5,a5,a0
 404:	aa87a703          	lw	a4,-1368(a5) # 7aa8 <__global_pointer$+0x657f>
 408:	c749                	beqz	a4,492 <thread_yield+0xa2>
        if (setjmp(current_thread->task_envs[current_thread->task_id]) == 0){ 
 40a:	00371793          	slli	a5,a4,0x3
 40e:	8f99                	sub	a5,a5,a4
 410:	0792                	slli	a5,a5,0x4
 412:	0a878793          	addi	a5,a5,168
 416:	953e                	add	a0,a0,a5
 418:	00001097          	auipc	ra,0x1
 41c:	880080e7          	jalr	-1920(ra) # c98 <setjmp>
 420:	c509                	beqz	a0,42a <thread_yield+0x3a>
}
 422:	60a2                	ld	ra,8(sp)
 424:	6402                	ld	s0,0(sp)
 426:	0141                	addi	sp,sp,16
 428:	8082                	ret
            schedule(); // schedule the next thread
 42a:	00000097          	auipc	ra,0x0
 42e:	c92080e7          	jalr	-878(ra) # bc <schedule>
            if (setjmp(current_thread->task_envs[current_thread->task_id]) == 0){ // if the current thread has task
 432:	00001517          	auipc	a0,0x1
 436:	8fe53503          	ld	a0,-1794(a0) # d30 <current_thread>
 43a:	67a1                	lui	a5,0x8
 43c:	97aa                	add	a5,a5,a0
 43e:	aa87a703          	lw	a4,-1368(a5) # 7aa8 <__global_pointer$+0x657f>
 442:	00371793          	slli	a5,a4,0x3
 446:	8f99                	sub	a5,a5,a4
 448:	0792                	slli	a5,a5,0x4
 44a:	0a878793          	addi	a5,a5,168
 44e:	953e                	add	a0,a0,a5
 450:	00001097          	auipc	ra,0x1
 454:	848080e7          	jalr	-1976(ra) # c98 <setjmp>
 458:	e505                	bnez	a0,480 <thread_yield+0x90>
                if (current_thread->task_id){
 45a:	00001797          	auipc	a5,0x1
 45e:	8d67b783          	ld	a5,-1834(a5) # d30 <current_thread>
 462:	6721                	lui	a4,0x8
 464:	97ba                	add	a5,a5,a4
 466:	aa87a783          	lw	a5,-1368(a5)
 46a:	e791                	bnez	a5,476 <thread_yield+0x86>
            dispatch(); // dispatch the thread
 46c:	00000097          	auipc	ra,0x0
 470:	d32080e7          	jalr	-718(ra) # 19e <dispatch>
 474:	b77d                	j	422 <thread_yield+0x32>
                    dispatch();
 476:	00000097          	auipc	ra,0x0
 47a:	d28080e7          	jalr	-728(ra) # 19e <dispatch>
 47e:	b7fd                	j	46c <thread_yield+0x7c>
                pop(current_thread);
 480:	00001517          	auipc	a0,0x1
 484:	8b053503          	ld	a0,-1872(a0) # d30 <current_thread>
 488:	00000097          	auipc	ra,0x0
 48c:	f38080e7          	jalr	-200(ra) # 3c0 <pop>
 490:	bff1                	j	46c <thread_yield+0x7c>
        if (setjmp(current_thread->env) == 0){ 
 492:	02050513          	addi	a0,a0,32
 496:	00001097          	auipc	ra,0x1
 49a:	802080e7          	jalr	-2046(ra) # c98 <setjmp>
 49e:	f151                	bnez	a0,422 <thread_yield+0x32>
            schedule(); // schedule the next thread
 4a0:	00000097          	auipc	ra,0x0
 4a4:	c1c080e7          	jalr	-996(ra) # bc <schedule>
            if (setjmp(current_thread->task_envs[current_thread->task_id]) == 0){ // if the current thread has task
 4a8:	00001517          	auipc	a0,0x1
 4ac:	88853503          	ld	a0,-1912(a0) # d30 <current_thread>
 4b0:	67a1                	lui	a5,0x8
 4b2:	97aa                	add	a5,a5,a0
 4b4:	aa87a703          	lw	a4,-1368(a5) # 7aa8 <__global_pointer$+0x657f>
 4b8:	00371793          	slli	a5,a4,0x3
 4bc:	8f99                	sub	a5,a5,a4
 4be:	0792                	slli	a5,a5,0x4
 4c0:	0a878793          	addi	a5,a5,168
 4c4:	953e                	add	a0,a0,a5
 4c6:	00000097          	auipc	ra,0x0
 4ca:	7d2080e7          	jalr	2002(ra) # c98 <setjmp>
 4ce:	e505                	bnez	a0,4f6 <thread_yield+0x106>
                if (current_thread->task_id){
 4d0:	00001797          	auipc	a5,0x1
 4d4:	8607b783          	ld	a5,-1952(a5) # d30 <current_thread>
 4d8:	6721                	lui	a4,0x8
 4da:	97ba                	add	a5,a5,a4
 4dc:	aa87a783          	lw	a5,-1368(a5)
 4e0:	e791                	bnez	a5,4ec <thread_yield+0xfc>
            dispatch(); // dispatch the thread
 4e2:	00000097          	auipc	ra,0x0
 4e6:	cbc080e7          	jalr	-836(ra) # 19e <dispatch>
}
 4ea:	bf25                	j	422 <thread_yield+0x32>
                    dispatch();
 4ec:	00000097          	auipc	ra,0x0
 4f0:	cb2080e7          	jalr	-846(ra) # 19e <dispatch>
 4f4:	b7fd                	j	4e2 <thread_yield+0xf2>
                pop(current_thread);
 4f6:	00001517          	auipc	a0,0x1
 4fa:	83a53503          	ld	a0,-1990(a0) # d30 <current_thread>
 4fe:	00000097          	auipc	ra,0x0
 502:	ec2080e7          	jalr	-318(ra) # 3c0 <pop>
 506:	bff1                	j	4e2 <thread_yield+0xf2>

0000000000000508 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 508:	1141                	addi	sp,sp,-16
 50a:	e422                	sd	s0,8(sp)
 50c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 50e:	87aa                	mv	a5,a0
 510:	0585                	addi	a1,a1,1
 512:	0785                	addi	a5,a5,1
 514:	fff5c703          	lbu	a4,-1(a1)
 518:	fee78fa3          	sb	a4,-1(a5)
 51c:	fb75                	bnez	a4,510 <strcpy+0x8>
    ;
  return os;
}
 51e:	6422                	ld	s0,8(sp)
 520:	0141                	addi	sp,sp,16
 522:	8082                	ret

0000000000000524 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 524:	1141                	addi	sp,sp,-16
 526:	e422                	sd	s0,8(sp)
 528:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 52a:	00054783          	lbu	a5,0(a0)
 52e:	cb91                	beqz	a5,542 <strcmp+0x1e>
 530:	0005c703          	lbu	a4,0(a1)
 534:	00f71763          	bne	a4,a5,542 <strcmp+0x1e>
    p++, q++;
 538:	0505                	addi	a0,a0,1
 53a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 53c:	00054783          	lbu	a5,0(a0)
 540:	fbe5                	bnez	a5,530 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 542:	0005c503          	lbu	a0,0(a1)
}
 546:	40a7853b          	subw	a0,a5,a0
 54a:	6422                	ld	s0,8(sp)
 54c:	0141                	addi	sp,sp,16
 54e:	8082                	ret

0000000000000550 <strlen>:

uint
strlen(const char *s)
{
 550:	1141                	addi	sp,sp,-16
 552:	e422                	sd	s0,8(sp)
 554:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 556:	00054783          	lbu	a5,0(a0)
 55a:	cf91                	beqz	a5,576 <strlen+0x26>
 55c:	0505                	addi	a0,a0,1
 55e:	87aa                	mv	a5,a0
 560:	4685                	li	a3,1
 562:	9e89                	subw	a3,a3,a0
 564:	00f6853b          	addw	a0,a3,a5
 568:	0785                	addi	a5,a5,1
 56a:	fff7c703          	lbu	a4,-1(a5)
 56e:	fb7d                	bnez	a4,564 <strlen+0x14>
    ;
  return n;
}
 570:	6422                	ld	s0,8(sp)
 572:	0141                	addi	sp,sp,16
 574:	8082                	ret
  for(n = 0; s[n]; n++)
 576:	4501                	li	a0,0
 578:	bfe5                	j	570 <strlen+0x20>

000000000000057a <memset>:

void*
memset(void *dst, int c, uint n)
{
 57a:	1141                	addi	sp,sp,-16
 57c:	e422                	sd	s0,8(sp)
 57e:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 580:	ce09                	beqz	a2,59a <memset+0x20>
 582:	87aa                	mv	a5,a0
 584:	fff6071b          	addiw	a4,a2,-1
 588:	1702                	slli	a4,a4,0x20
 58a:	9301                	srli	a4,a4,0x20
 58c:	0705                	addi	a4,a4,1
 58e:	972a                	add	a4,a4,a0
    cdst[i] = c;
 590:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 594:	0785                	addi	a5,a5,1
 596:	fee79de3          	bne	a5,a4,590 <memset+0x16>
  }
  return dst;
}
 59a:	6422                	ld	s0,8(sp)
 59c:	0141                	addi	sp,sp,16
 59e:	8082                	ret

00000000000005a0 <strchr>:

char*
strchr(const char *s, char c)
{
 5a0:	1141                	addi	sp,sp,-16
 5a2:	e422                	sd	s0,8(sp)
 5a4:	0800                	addi	s0,sp,16
  for(; *s; s++)
 5a6:	00054783          	lbu	a5,0(a0)
 5aa:	cb99                	beqz	a5,5c0 <strchr+0x20>
    if(*s == c)
 5ac:	00f58763          	beq	a1,a5,5ba <strchr+0x1a>
  for(; *s; s++)
 5b0:	0505                	addi	a0,a0,1
 5b2:	00054783          	lbu	a5,0(a0)
 5b6:	fbfd                	bnez	a5,5ac <strchr+0xc>
      return (char*)s;
  return 0;
 5b8:	4501                	li	a0,0
}
 5ba:	6422                	ld	s0,8(sp)
 5bc:	0141                	addi	sp,sp,16
 5be:	8082                	ret
  return 0;
 5c0:	4501                	li	a0,0
 5c2:	bfe5                	j	5ba <strchr+0x1a>

00000000000005c4 <gets>:

char*
gets(char *buf, int max)
{
 5c4:	711d                	addi	sp,sp,-96
 5c6:	ec86                	sd	ra,88(sp)
 5c8:	e8a2                	sd	s0,80(sp)
 5ca:	e4a6                	sd	s1,72(sp)
 5cc:	e0ca                	sd	s2,64(sp)
 5ce:	fc4e                	sd	s3,56(sp)
 5d0:	f852                	sd	s4,48(sp)
 5d2:	f456                	sd	s5,40(sp)
 5d4:	f05a                	sd	s6,32(sp)
 5d6:	ec5e                	sd	s7,24(sp)
 5d8:	1080                	addi	s0,sp,96
 5da:	8baa                	mv	s7,a0
 5dc:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5de:	892a                	mv	s2,a0
 5e0:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 5e2:	4aa9                	li	s5,10
 5e4:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 5e6:	89a6                	mv	s3,s1
 5e8:	2485                	addiw	s1,s1,1
 5ea:	0344d863          	bge	s1,s4,61a <gets+0x56>
    cc = read(0, &c, 1);
 5ee:	4605                	li	a2,1
 5f0:	faf40593          	addi	a1,s0,-81
 5f4:	4501                	li	a0,0
 5f6:	00000097          	auipc	ra,0x0
 5fa:	1a0080e7          	jalr	416(ra) # 796 <read>
    if(cc < 1)
 5fe:	00a05e63          	blez	a0,61a <gets+0x56>
    buf[i++] = c;
 602:	faf44783          	lbu	a5,-81(s0)
 606:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 60a:	01578763          	beq	a5,s5,618 <gets+0x54>
 60e:	0905                	addi	s2,s2,1
 610:	fd679be3          	bne	a5,s6,5e6 <gets+0x22>
  for(i=0; i+1 < max; ){
 614:	89a6                	mv	s3,s1
 616:	a011                	j	61a <gets+0x56>
 618:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 61a:	99de                	add	s3,s3,s7
 61c:	00098023          	sb	zero,0(s3)
  return buf;
}
 620:	855e                	mv	a0,s7
 622:	60e6                	ld	ra,88(sp)
 624:	6446                	ld	s0,80(sp)
 626:	64a6                	ld	s1,72(sp)
 628:	6906                	ld	s2,64(sp)
 62a:	79e2                	ld	s3,56(sp)
 62c:	7a42                	ld	s4,48(sp)
 62e:	7aa2                	ld	s5,40(sp)
 630:	7b02                	ld	s6,32(sp)
 632:	6be2                	ld	s7,24(sp)
 634:	6125                	addi	sp,sp,96
 636:	8082                	ret

0000000000000638 <stat>:

int
stat(const char *n, struct stat *st)
{
 638:	1101                	addi	sp,sp,-32
 63a:	ec06                	sd	ra,24(sp)
 63c:	e822                	sd	s0,16(sp)
 63e:	e426                	sd	s1,8(sp)
 640:	e04a                	sd	s2,0(sp)
 642:	1000                	addi	s0,sp,32
 644:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 646:	4581                	li	a1,0
 648:	00000097          	auipc	ra,0x0
 64c:	176080e7          	jalr	374(ra) # 7be <open>
  if(fd < 0)
 650:	02054563          	bltz	a0,67a <stat+0x42>
 654:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 656:	85ca                	mv	a1,s2
 658:	00000097          	auipc	ra,0x0
 65c:	17e080e7          	jalr	382(ra) # 7d6 <fstat>
 660:	892a                	mv	s2,a0
  close(fd);
 662:	8526                	mv	a0,s1
 664:	00000097          	auipc	ra,0x0
 668:	142080e7          	jalr	322(ra) # 7a6 <close>
  return r;
}
 66c:	854a                	mv	a0,s2
 66e:	60e2                	ld	ra,24(sp)
 670:	6442                	ld	s0,16(sp)
 672:	64a2                	ld	s1,8(sp)
 674:	6902                	ld	s2,0(sp)
 676:	6105                	addi	sp,sp,32
 678:	8082                	ret
    return -1;
 67a:	597d                	li	s2,-1
 67c:	bfc5                	j	66c <stat+0x34>

000000000000067e <atoi>:

int
atoi(const char *s)
{
 67e:	1141                	addi	sp,sp,-16
 680:	e422                	sd	s0,8(sp)
 682:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 684:	00054603          	lbu	a2,0(a0)
 688:	fd06079b          	addiw	a5,a2,-48
 68c:	0ff7f793          	andi	a5,a5,255
 690:	4725                	li	a4,9
 692:	02f76963          	bltu	a4,a5,6c4 <atoi+0x46>
 696:	86aa                	mv	a3,a0
  n = 0;
 698:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 69a:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 69c:	0685                	addi	a3,a3,1
 69e:	0025179b          	slliw	a5,a0,0x2
 6a2:	9fa9                	addw	a5,a5,a0
 6a4:	0017979b          	slliw	a5,a5,0x1
 6a8:	9fb1                	addw	a5,a5,a2
 6aa:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 6ae:	0006c603          	lbu	a2,0(a3)
 6b2:	fd06071b          	addiw	a4,a2,-48
 6b6:	0ff77713          	andi	a4,a4,255
 6ba:	fee5f1e3          	bgeu	a1,a4,69c <atoi+0x1e>
  return n;
}
 6be:	6422                	ld	s0,8(sp)
 6c0:	0141                	addi	sp,sp,16
 6c2:	8082                	ret
  n = 0;
 6c4:	4501                	li	a0,0
 6c6:	bfe5                	j	6be <atoi+0x40>

00000000000006c8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6c8:	1141                	addi	sp,sp,-16
 6ca:	e422                	sd	s0,8(sp)
 6cc:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 6ce:	02b57663          	bgeu	a0,a1,6fa <memmove+0x32>
    while(n-- > 0)
 6d2:	02c05163          	blez	a2,6f4 <memmove+0x2c>
 6d6:	fff6079b          	addiw	a5,a2,-1
 6da:	1782                	slli	a5,a5,0x20
 6dc:	9381                	srli	a5,a5,0x20
 6de:	0785                	addi	a5,a5,1
 6e0:	97aa                	add	a5,a5,a0
  dst = vdst;
 6e2:	872a                	mv	a4,a0
      *dst++ = *src++;
 6e4:	0585                	addi	a1,a1,1
 6e6:	0705                	addi	a4,a4,1
 6e8:	fff5c683          	lbu	a3,-1(a1)
 6ec:	fed70fa3          	sb	a3,-1(a4) # 7fff <__global_pointer$+0x6ad6>
    while(n-- > 0)
 6f0:	fee79ae3          	bne	a5,a4,6e4 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 6f4:	6422                	ld	s0,8(sp)
 6f6:	0141                	addi	sp,sp,16
 6f8:	8082                	ret
    dst += n;
 6fa:	00c50733          	add	a4,a0,a2
    src += n;
 6fe:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 700:	fec05ae3          	blez	a2,6f4 <memmove+0x2c>
 704:	fff6079b          	addiw	a5,a2,-1
 708:	1782                	slli	a5,a5,0x20
 70a:	9381                	srli	a5,a5,0x20
 70c:	fff7c793          	not	a5,a5
 710:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 712:	15fd                	addi	a1,a1,-1
 714:	177d                	addi	a4,a4,-1
 716:	0005c683          	lbu	a3,0(a1)
 71a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 71e:	fee79ae3          	bne	a5,a4,712 <memmove+0x4a>
 722:	bfc9                	j	6f4 <memmove+0x2c>

0000000000000724 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 724:	1141                	addi	sp,sp,-16
 726:	e422                	sd	s0,8(sp)
 728:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 72a:	ca05                	beqz	a2,75a <memcmp+0x36>
 72c:	fff6069b          	addiw	a3,a2,-1
 730:	1682                	slli	a3,a3,0x20
 732:	9281                	srli	a3,a3,0x20
 734:	0685                	addi	a3,a3,1
 736:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 738:	00054783          	lbu	a5,0(a0)
 73c:	0005c703          	lbu	a4,0(a1)
 740:	00e79863          	bne	a5,a4,750 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 744:	0505                	addi	a0,a0,1
    p2++;
 746:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 748:	fed518e3          	bne	a0,a3,738 <memcmp+0x14>
  }
  return 0;
 74c:	4501                	li	a0,0
 74e:	a019                	j	754 <memcmp+0x30>
      return *p1 - *p2;
 750:	40e7853b          	subw	a0,a5,a4
}
 754:	6422                	ld	s0,8(sp)
 756:	0141                	addi	sp,sp,16
 758:	8082                	ret
  return 0;
 75a:	4501                	li	a0,0
 75c:	bfe5                	j	754 <memcmp+0x30>

000000000000075e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 75e:	1141                	addi	sp,sp,-16
 760:	e406                	sd	ra,8(sp)
 762:	e022                	sd	s0,0(sp)
 764:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 766:	00000097          	auipc	ra,0x0
 76a:	f62080e7          	jalr	-158(ra) # 6c8 <memmove>
}
 76e:	60a2                	ld	ra,8(sp)
 770:	6402                	ld	s0,0(sp)
 772:	0141                	addi	sp,sp,16
 774:	8082                	ret

0000000000000776 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 776:	4885                	li	a7,1
 ecall
 778:	00000073          	ecall
 ret
 77c:	8082                	ret

000000000000077e <exit>:
.global exit
exit:
 li a7, SYS_exit
 77e:	4889                	li	a7,2
 ecall
 780:	00000073          	ecall
 ret
 784:	8082                	ret

0000000000000786 <wait>:
.global wait
wait:
 li a7, SYS_wait
 786:	488d                	li	a7,3
 ecall
 788:	00000073          	ecall
 ret
 78c:	8082                	ret

000000000000078e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 78e:	4891                	li	a7,4
 ecall
 790:	00000073          	ecall
 ret
 794:	8082                	ret

0000000000000796 <read>:
.global read
read:
 li a7, SYS_read
 796:	4895                	li	a7,5
 ecall
 798:	00000073          	ecall
 ret
 79c:	8082                	ret

000000000000079e <write>:
.global write
write:
 li a7, SYS_write
 79e:	48c1                	li	a7,16
 ecall
 7a0:	00000073          	ecall
 ret
 7a4:	8082                	ret

00000000000007a6 <close>:
.global close
close:
 li a7, SYS_close
 7a6:	48d5                	li	a7,21
 ecall
 7a8:	00000073          	ecall
 ret
 7ac:	8082                	ret

00000000000007ae <kill>:
.global kill
kill:
 li a7, SYS_kill
 7ae:	4899                	li	a7,6
 ecall
 7b0:	00000073          	ecall
 ret
 7b4:	8082                	ret

00000000000007b6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 7b6:	489d                	li	a7,7
 ecall
 7b8:	00000073          	ecall
 ret
 7bc:	8082                	ret

00000000000007be <open>:
.global open
open:
 li a7, SYS_open
 7be:	48bd                	li	a7,15
 ecall
 7c0:	00000073          	ecall
 ret
 7c4:	8082                	ret

00000000000007c6 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 7c6:	48c5                	li	a7,17
 ecall
 7c8:	00000073          	ecall
 ret
 7cc:	8082                	ret

00000000000007ce <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 7ce:	48c9                	li	a7,18
 ecall
 7d0:	00000073          	ecall
 ret
 7d4:	8082                	ret

00000000000007d6 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 7d6:	48a1                	li	a7,8
 ecall
 7d8:	00000073          	ecall
 ret
 7dc:	8082                	ret

00000000000007de <link>:
.global link
link:
 li a7, SYS_link
 7de:	48cd                	li	a7,19
 ecall
 7e0:	00000073          	ecall
 ret
 7e4:	8082                	ret

00000000000007e6 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 7e6:	48d1                	li	a7,20
 ecall
 7e8:	00000073          	ecall
 ret
 7ec:	8082                	ret

00000000000007ee <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 7ee:	48a5                	li	a7,9
 ecall
 7f0:	00000073          	ecall
 ret
 7f4:	8082                	ret

00000000000007f6 <dup>:
.global dup
dup:
 li a7, SYS_dup
 7f6:	48a9                	li	a7,10
 ecall
 7f8:	00000073          	ecall
 ret
 7fc:	8082                	ret

00000000000007fe <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 7fe:	48ad                	li	a7,11
 ecall
 800:	00000073          	ecall
 ret
 804:	8082                	ret

0000000000000806 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 806:	48b1                	li	a7,12
 ecall
 808:	00000073          	ecall
 ret
 80c:	8082                	ret

000000000000080e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 80e:	48b5                	li	a7,13
 ecall
 810:	00000073          	ecall
 ret
 814:	8082                	ret

0000000000000816 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 816:	48b9                	li	a7,14
 ecall
 818:	00000073          	ecall
 ret
 81c:	8082                	ret

000000000000081e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 81e:	1101                	addi	sp,sp,-32
 820:	ec06                	sd	ra,24(sp)
 822:	e822                	sd	s0,16(sp)
 824:	1000                	addi	s0,sp,32
 826:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 82a:	4605                	li	a2,1
 82c:	fef40593          	addi	a1,s0,-17
 830:	00000097          	auipc	ra,0x0
 834:	f6e080e7          	jalr	-146(ra) # 79e <write>
}
 838:	60e2                	ld	ra,24(sp)
 83a:	6442                	ld	s0,16(sp)
 83c:	6105                	addi	sp,sp,32
 83e:	8082                	ret

0000000000000840 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 840:	7139                	addi	sp,sp,-64
 842:	fc06                	sd	ra,56(sp)
 844:	f822                	sd	s0,48(sp)
 846:	f426                	sd	s1,40(sp)
 848:	f04a                	sd	s2,32(sp)
 84a:	ec4e                	sd	s3,24(sp)
 84c:	0080                	addi	s0,sp,64
 84e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 850:	c299                	beqz	a3,856 <printint+0x16>
 852:	0805c863          	bltz	a1,8e2 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 856:	2581                	sext.w	a1,a1
  neg = 0;
 858:	4881                	li	a7,0
 85a:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 85e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 860:	2601                	sext.w	a2,a2
 862:	00000517          	auipc	a0,0x0
 866:	4b650513          	addi	a0,a0,1206 # d18 <digits>
 86a:	883a                	mv	a6,a4
 86c:	2705                	addiw	a4,a4,1
 86e:	02c5f7bb          	remuw	a5,a1,a2
 872:	1782                	slli	a5,a5,0x20
 874:	9381                	srli	a5,a5,0x20
 876:	97aa                	add	a5,a5,a0
 878:	0007c783          	lbu	a5,0(a5)
 87c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 880:	0005879b          	sext.w	a5,a1
 884:	02c5d5bb          	divuw	a1,a1,a2
 888:	0685                	addi	a3,a3,1
 88a:	fec7f0e3          	bgeu	a5,a2,86a <printint+0x2a>
  if(neg)
 88e:	00088b63          	beqz	a7,8a4 <printint+0x64>
    buf[i++] = '-';
 892:	fd040793          	addi	a5,s0,-48
 896:	973e                	add	a4,a4,a5
 898:	02d00793          	li	a5,45
 89c:	fef70823          	sb	a5,-16(a4)
 8a0:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 8a4:	02e05863          	blez	a4,8d4 <printint+0x94>
 8a8:	fc040793          	addi	a5,s0,-64
 8ac:	00e78933          	add	s2,a5,a4
 8b0:	fff78993          	addi	s3,a5,-1
 8b4:	99ba                	add	s3,s3,a4
 8b6:	377d                	addiw	a4,a4,-1
 8b8:	1702                	slli	a4,a4,0x20
 8ba:	9301                	srli	a4,a4,0x20
 8bc:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 8c0:	fff94583          	lbu	a1,-1(s2)
 8c4:	8526                	mv	a0,s1
 8c6:	00000097          	auipc	ra,0x0
 8ca:	f58080e7          	jalr	-168(ra) # 81e <putc>
  while(--i >= 0)
 8ce:	197d                	addi	s2,s2,-1
 8d0:	ff3918e3          	bne	s2,s3,8c0 <printint+0x80>
}
 8d4:	70e2                	ld	ra,56(sp)
 8d6:	7442                	ld	s0,48(sp)
 8d8:	74a2                	ld	s1,40(sp)
 8da:	7902                	ld	s2,32(sp)
 8dc:	69e2                	ld	s3,24(sp)
 8de:	6121                	addi	sp,sp,64
 8e0:	8082                	ret
    x = -xx;
 8e2:	40b005bb          	negw	a1,a1
    neg = 1;
 8e6:	4885                	li	a7,1
    x = -xx;
 8e8:	bf8d                	j	85a <printint+0x1a>

00000000000008ea <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 8ea:	7119                	addi	sp,sp,-128
 8ec:	fc86                	sd	ra,120(sp)
 8ee:	f8a2                	sd	s0,112(sp)
 8f0:	f4a6                	sd	s1,104(sp)
 8f2:	f0ca                	sd	s2,96(sp)
 8f4:	ecce                	sd	s3,88(sp)
 8f6:	e8d2                	sd	s4,80(sp)
 8f8:	e4d6                	sd	s5,72(sp)
 8fa:	e0da                	sd	s6,64(sp)
 8fc:	fc5e                	sd	s7,56(sp)
 8fe:	f862                	sd	s8,48(sp)
 900:	f466                	sd	s9,40(sp)
 902:	f06a                	sd	s10,32(sp)
 904:	ec6e                	sd	s11,24(sp)
 906:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 908:	0005c903          	lbu	s2,0(a1)
 90c:	18090f63          	beqz	s2,aaa <vprintf+0x1c0>
 910:	8aaa                	mv	s5,a0
 912:	8b32                	mv	s6,a2
 914:	00158493          	addi	s1,a1,1
  state = 0;
 918:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 91a:	02500a13          	li	s4,37
      if(c == 'd'){
 91e:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 922:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 926:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 92a:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 92e:	00000b97          	auipc	s7,0x0
 932:	3eab8b93          	addi	s7,s7,1002 # d18 <digits>
 936:	a839                	j	954 <vprintf+0x6a>
        putc(fd, c);
 938:	85ca                	mv	a1,s2
 93a:	8556                	mv	a0,s5
 93c:	00000097          	auipc	ra,0x0
 940:	ee2080e7          	jalr	-286(ra) # 81e <putc>
 944:	a019                	j	94a <vprintf+0x60>
    } else if(state == '%'){
 946:	01498f63          	beq	s3,s4,964 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 94a:	0485                	addi	s1,s1,1
 94c:	fff4c903          	lbu	s2,-1(s1)
 950:	14090d63          	beqz	s2,aaa <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 954:	0009079b          	sext.w	a5,s2
    if(state == 0){
 958:	fe0997e3          	bnez	s3,946 <vprintf+0x5c>
      if(c == '%'){
 95c:	fd479ee3          	bne	a5,s4,938 <vprintf+0x4e>
        state = '%';
 960:	89be                	mv	s3,a5
 962:	b7e5                	j	94a <vprintf+0x60>
      if(c == 'd'){
 964:	05878063          	beq	a5,s8,9a4 <vprintf+0xba>
      } else if(c == 'l') {
 968:	05978c63          	beq	a5,s9,9c0 <vprintf+0xd6>
      } else if(c == 'x') {
 96c:	07a78863          	beq	a5,s10,9dc <vprintf+0xf2>
      } else if(c == 'p') {
 970:	09b78463          	beq	a5,s11,9f8 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 974:	07300713          	li	a4,115
 978:	0ce78663          	beq	a5,a4,a44 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 97c:	06300713          	li	a4,99
 980:	0ee78e63          	beq	a5,a4,a7c <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 984:	11478863          	beq	a5,s4,a94 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 988:	85d2                	mv	a1,s4
 98a:	8556                	mv	a0,s5
 98c:	00000097          	auipc	ra,0x0
 990:	e92080e7          	jalr	-366(ra) # 81e <putc>
        putc(fd, c);
 994:	85ca                	mv	a1,s2
 996:	8556                	mv	a0,s5
 998:	00000097          	auipc	ra,0x0
 99c:	e86080e7          	jalr	-378(ra) # 81e <putc>
      }
      state = 0;
 9a0:	4981                	li	s3,0
 9a2:	b765                	j	94a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 9a4:	008b0913          	addi	s2,s6,8
 9a8:	4685                	li	a3,1
 9aa:	4629                	li	a2,10
 9ac:	000b2583          	lw	a1,0(s6)
 9b0:	8556                	mv	a0,s5
 9b2:	00000097          	auipc	ra,0x0
 9b6:	e8e080e7          	jalr	-370(ra) # 840 <printint>
 9ba:	8b4a                	mv	s6,s2
      state = 0;
 9bc:	4981                	li	s3,0
 9be:	b771                	j	94a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 9c0:	008b0913          	addi	s2,s6,8
 9c4:	4681                	li	a3,0
 9c6:	4629                	li	a2,10
 9c8:	000b2583          	lw	a1,0(s6)
 9cc:	8556                	mv	a0,s5
 9ce:	00000097          	auipc	ra,0x0
 9d2:	e72080e7          	jalr	-398(ra) # 840 <printint>
 9d6:	8b4a                	mv	s6,s2
      state = 0;
 9d8:	4981                	li	s3,0
 9da:	bf85                	j	94a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 9dc:	008b0913          	addi	s2,s6,8
 9e0:	4681                	li	a3,0
 9e2:	4641                	li	a2,16
 9e4:	000b2583          	lw	a1,0(s6)
 9e8:	8556                	mv	a0,s5
 9ea:	00000097          	auipc	ra,0x0
 9ee:	e56080e7          	jalr	-426(ra) # 840 <printint>
 9f2:	8b4a                	mv	s6,s2
      state = 0;
 9f4:	4981                	li	s3,0
 9f6:	bf91                	j	94a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 9f8:	008b0793          	addi	a5,s6,8
 9fc:	f8f43423          	sd	a5,-120(s0)
 a00:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 a04:	03000593          	li	a1,48
 a08:	8556                	mv	a0,s5
 a0a:	00000097          	auipc	ra,0x0
 a0e:	e14080e7          	jalr	-492(ra) # 81e <putc>
  putc(fd, 'x');
 a12:	85ea                	mv	a1,s10
 a14:	8556                	mv	a0,s5
 a16:	00000097          	auipc	ra,0x0
 a1a:	e08080e7          	jalr	-504(ra) # 81e <putc>
 a1e:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 a20:	03c9d793          	srli	a5,s3,0x3c
 a24:	97de                	add	a5,a5,s7
 a26:	0007c583          	lbu	a1,0(a5)
 a2a:	8556                	mv	a0,s5
 a2c:	00000097          	auipc	ra,0x0
 a30:	df2080e7          	jalr	-526(ra) # 81e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 a34:	0992                	slli	s3,s3,0x4
 a36:	397d                	addiw	s2,s2,-1
 a38:	fe0914e3          	bnez	s2,a20 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 a3c:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 a40:	4981                	li	s3,0
 a42:	b721                	j	94a <vprintf+0x60>
        s = va_arg(ap, char*);
 a44:	008b0993          	addi	s3,s6,8
 a48:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 a4c:	02090163          	beqz	s2,a6e <vprintf+0x184>
        while(*s != 0){
 a50:	00094583          	lbu	a1,0(s2)
 a54:	c9a1                	beqz	a1,aa4 <vprintf+0x1ba>
          putc(fd, *s);
 a56:	8556                	mv	a0,s5
 a58:	00000097          	auipc	ra,0x0
 a5c:	dc6080e7          	jalr	-570(ra) # 81e <putc>
          s++;
 a60:	0905                	addi	s2,s2,1
        while(*s != 0){
 a62:	00094583          	lbu	a1,0(s2)
 a66:	f9e5                	bnez	a1,a56 <vprintf+0x16c>
        s = va_arg(ap, char*);
 a68:	8b4e                	mv	s6,s3
      state = 0;
 a6a:	4981                	li	s3,0
 a6c:	bdf9                	j	94a <vprintf+0x60>
          s = "(null)";
 a6e:	00000917          	auipc	s2,0x0
 a72:	2a290913          	addi	s2,s2,674 # d10 <longjmp_1+0x6>
        while(*s != 0){
 a76:	02800593          	li	a1,40
 a7a:	bff1                	j	a56 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 a7c:	008b0913          	addi	s2,s6,8
 a80:	000b4583          	lbu	a1,0(s6)
 a84:	8556                	mv	a0,s5
 a86:	00000097          	auipc	ra,0x0
 a8a:	d98080e7          	jalr	-616(ra) # 81e <putc>
 a8e:	8b4a                	mv	s6,s2
      state = 0;
 a90:	4981                	li	s3,0
 a92:	bd65                	j	94a <vprintf+0x60>
        putc(fd, c);
 a94:	85d2                	mv	a1,s4
 a96:	8556                	mv	a0,s5
 a98:	00000097          	auipc	ra,0x0
 a9c:	d86080e7          	jalr	-634(ra) # 81e <putc>
      state = 0;
 aa0:	4981                	li	s3,0
 aa2:	b565                	j	94a <vprintf+0x60>
        s = va_arg(ap, char*);
 aa4:	8b4e                	mv	s6,s3
      state = 0;
 aa6:	4981                	li	s3,0
 aa8:	b54d                	j	94a <vprintf+0x60>
    }
  }
}
 aaa:	70e6                	ld	ra,120(sp)
 aac:	7446                	ld	s0,112(sp)
 aae:	74a6                	ld	s1,104(sp)
 ab0:	7906                	ld	s2,96(sp)
 ab2:	69e6                	ld	s3,88(sp)
 ab4:	6a46                	ld	s4,80(sp)
 ab6:	6aa6                	ld	s5,72(sp)
 ab8:	6b06                	ld	s6,64(sp)
 aba:	7be2                	ld	s7,56(sp)
 abc:	7c42                	ld	s8,48(sp)
 abe:	7ca2                	ld	s9,40(sp)
 ac0:	7d02                	ld	s10,32(sp)
 ac2:	6de2                	ld	s11,24(sp)
 ac4:	6109                	addi	sp,sp,128
 ac6:	8082                	ret

0000000000000ac8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 ac8:	715d                	addi	sp,sp,-80
 aca:	ec06                	sd	ra,24(sp)
 acc:	e822                	sd	s0,16(sp)
 ace:	1000                	addi	s0,sp,32
 ad0:	e010                	sd	a2,0(s0)
 ad2:	e414                	sd	a3,8(s0)
 ad4:	e818                	sd	a4,16(s0)
 ad6:	ec1c                	sd	a5,24(s0)
 ad8:	03043023          	sd	a6,32(s0)
 adc:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 ae0:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 ae4:	8622                	mv	a2,s0
 ae6:	00000097          	auipc	ra,0x0
 aea:	e04080e7          	jalr	-508(ra) # 8ea <vprintf>
}
 aee:	60e2                	ld	ra,24(sp)
 af0:	6442                	ld	s0,16(sp)
 af2:	6161                	addi	sp,sp,80
 af4:	8082                	ret

0000000000000af6 <printf>:

void
printf(const char *fmt, ...)
{
 af6:	711d                	addi	sp,sp,-96
 af8:	ec06                	sd	ra,24(sp)
 afa:	e822                	sd	s0,16(sp)
 afc:	1000                	addi	s0,sp,32
 afe:	e40c                	sd	a1,8(s0)
 b00:	e810                	sd	a2,16(s0)
 b02:	ec14                	sd	a3,24(s0)
 b04:	f018                	sd	a4,32(s0)
 b06:	f41c                	sd	a5,40(s0)
 b08:	03043823          	sd	a6,48(s0)
 b0c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 b10:	00840613          	addi	a2,s0,8
 b14:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 b18:	85aa                	mv	a1,a0
 b1a:	4505                	li	a0,1
 b1c:	00000097          	auipc	ra,0x0
 b20:	dce080e7          	jalr	-562(ra) # 8ea <vprintf>
}
 b24:	60e2                	ld	ra,24(sp)
 b26:	6442                	ld	s0,16(sp)
 b28:	6125                	addi	sp,sp,96
 b2a:	8082                	ret

0000000000000b2c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b2c:	1141                	addi	sp,sp,-16
 b2e:	e422                	sd	s0,8(sp)
 b30:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b32:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b36:	00000797          	auipc	a5,0x0
 b3a:	2027b783          	ld	a5,514(a5) # d38 <freep>
 b3e:	a805                	j	b6e <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 b40:	4618                	lw	a4,8(a2)
 b42:	9db9                	addw	a1,a1,a4
 b44:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 b48:	6398                	ld	a4,0(a5)
 b4a:	6318                	ld	a4,0(a4)
 b4c:	fee53823          	sd	a4,-16(a0)
 b50:	a091                	j	b94 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 b52:	ff852703          	lw	a4,-8(a0)
 b56:	9e39                	addw	a2,a2,a4
 b58:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 b5a:	ff053703          	ld	a4,-16(a0)
 b5e:	e398                	sd	a4,0(a5)
 b60:	a099                	j	ba6 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b62:	6398                	ld	a4,0(a5)
 b64:	00e7e463          	bltu	a5,a4,b6c <free+0x40>
 b68:	00e6ea63          	bltu	a3,a4,b7c <free+0x50>
{
 b6c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b6e:	fed7fae3          	bgeu	a5,a3,b62 <free+0x36>
 b72:	6398                	ld	a4,0(a5)
 b74:	00e6e463          	bltu	a3,a4,b7c <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b78:	fee7eae3          	bltu	a5,a4,b6c <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 b7c:	ff852583          	lw	a1,-8(a0)
 b80:	6390                	ld	a2,0(a5)
 b82:	02059713          	slli	a4,a1,0x20
 b86:	9301                	srli	a4,a4,0x20
 b88:	0712                	slli	a4,a4,0x4
 b8a:	9736                	add	a4,a4,a3
 b8c:	fae60ae3          	beq	a2,a4,b40 <free+0x14>
    bp->s.ptr = p->s.ptr;
 b90:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 b94:	4790                	lw	a2,8(a5)
 b96:	02061713          	slli	a4,a2,0x20
 b9a:	9301                	srli	a4,a4,0x20
 b9c:	0712                	slli	a4,a4,0x4
 b9e:	973e                	add	a4,a4,a5
 ba0:	fae689e3          	beq	a3,a4,b52 <free+0x26>
  } else
    p->s.ptr = bp;
 ba4:	e394                	sd	a3,0(a5)
  freep = p;
 ba6:	00000717          	auipc	a4,0x0
 baa:	18f73923          	sd	a5,402(a4) # d38 <freep>
}
 bae:	6422                	ld	s0,8(sp)
 bb0:	0141                	addi	sp,sp,16
 bb2:	8082                	ret

0000000000000bb4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bb4:	7139                	addi	sp,sp,-64
 bb6:	fc06                	sd	ra,56(sp)
 bb8:	f822                	sd	s0,48(sp)
 bba:	f426                	sd	s1,40(sp)
 bbc:	f04a                	sd	s2,32(sp)
 bbe:	ec4e                	sd	s3,24(sp)
 bc0:	e852                	sd	s4,16(sp)
 bc2:	e456                	sd	s5,8(sp)
 bc4:	e05a                	sd	s6,0(sp)
 bc6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bc8:	02051493          	slli	s1,a0,0x20
 bcc:	9081                	srli	s1,s1,0x20
 bce:	04bd                	addi	s1,s1,15
 bd0:	8091                	srli	s1,s1,0x4
 bd2:	0014899b          	addiw	s3,s1,1
 bd6:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 bd8:	00000517          	auipc	a0,0x0
 bdc:	16053503          	ld	a0,352(a0) # d38 <freep>
 be0:	c515                	beqz	a0,c0c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 be2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 be4:	4798                	lw	a4,8(a5)
 be6:	02977f63          	bgeu	a4,s1,c24 <malloc+0x70>
 bea:	8a4e                	mv	s4,s3
 bec:	0009871b          	sext.w	a4,s3
 bf0:	6685                	lui	a3,0x1
 bf2:	00d77363          	bgeu	a4,a3,bf8 <malloc+0x44>
 bf6:	6a05                	lui	s4,0x1
 bf8:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 bfc:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c00:	00000917          	auipc	s2,0x0
 c04:	13890913          	addi	s2,s2,312 # d38 <freep>
  if(p == (char*)-1)
 c08:	5afd                	li	s5,-1
 c0a:	a88d                	j	c7c <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 c0c:	00000797          	auipc	a5,0x0
 c10:	21478793          	addi	a5,a5,532 # e20 <base>
 c14:	00000717          	auipc	a4,0x0
 c18:	12f73223          	sd	a5,292(a4) # d38 <freep>
 c1c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 c1e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 c22:	b7e1                	j	bea <malloc+0x36>
      if(p->s.size == nunits)
 c24:	02e48b63          	beq	s1,a4,c5a <malloc+0xa6>
        p->s.size -= nunits;
 c28:	4137073b          	subw	a4,a4,s3
 c2c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 c2e:	1702                	slli	a4,a4,0x20
 c30:	9301                	srli	a4,a4,0x20
 c32:	0712                	slli	a4,a4,0x4
 c34:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 c36:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 c3a:	00000717          	auipc	a4,0x0
 c3e:	0ea73f23          	sd	a0,254(a4) # d38 <freep>
      return (void*)(p + 1);
 c42:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 c46:	70e2                	ld	ra,56(sp)
 c48:	7442                	ld	s0,48(sp)
 c4a:	74a2                	ld	s1,40(sp)
 c4c:	7902                	ld	s2,32(sp)
 c4e:	69e2                	ld	s3,24(sp)
 c50:	6a42                	ld	s4,16(sp)
 c52:	6aa2                	ld	s5,8(sp)
 c54:	6b02                	ld	s6,0(sp)
 c56:	6121                	addi	sp,sp,64
 c58:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 c5a:	6398                	ld	a4,0(a5)
 c5c:	e118                	sd	a4,0(a0)
 c5e:	bff1                	j	c3a <malloc+0x86>
  hp->s.size = nu;
 c60:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 c64:	0541                	addi	a0,a0,16
 c66:	00000097          	auipc	ra,0x0
 c6a:	ec6080e7          	jalr	-314(ra) # b2c <free>
  return freep;
 c6e:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 c72:	d971                	beqz	a0,c46 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c74:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 c76:	4798                	lw	a4,8(a5)
 c78:	fa9776e3          	bgeu	a4,s1,c24 <malloc+0x70>
    if(p == freep)
 c7c:	00093703          	ld	a4,0(s2)
 c80:	853e                	mv	a0,a5
 c82:	fef719e3          	bne	a4,a5,c74 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 c86:	8552                	mv	a0,s4
 c88:	00000097          	auipc	ra,0x0
 c8c:	b7e080e7          	jalr	-1154(ra) # 806 <sbrk>
  if(p == (char*)-1)
 c90:	fd5518e3          	bne	a0,s5,c60 <malloc+0xac>
        return 0;
 c94:	4501                	li	a0,0
 c96:	bf45                	j	c46 <malloc+0x92>

0000000000000c98 <setjmp>:
 c98:	e100                	sd	s0,0(a0)
 c9a:	e504                	sd	s1,8(a0)
 c9c:	01253823          	sd	s2,16(a0)
 ca0:	01353c23          	sd	s3,24(a0)
 ca4:	03453023          	sd	s4,32(a0)
 ca8:	03553423          	sd	s5,40(a0)
 cac:	03653823          	sd	s6,48(a0)
 cb0:	03753c23          	sd	s7,56(a0)
 cb4:	05853023          	sd	s8,64(a0)
 cb8:	05953423          	sd	s9,72(a0)
 cbc:	05a53823          	sd	s10,80(a0)
 cc0:	05b53c23          	sd	s11,88(a0)
 cc4:	06153023          	sd	ra,96(a0)
 cc8:	06253423          	sd	sp,104(a0)
 ccc:	4501                	li	a0,0
 cce:	8082                	ret

0000000000000cd0 <longjmp>:
 cd0:	6100                	ld	s0,0(a0)
 cd2:	6504                	ld	s1,8(a0)
 cd4:	01053903          	ld	s2,16(a0)
 cd8:	01853983          	ld	s3,24(a0)
 cdc:	02053a03          	ld	s4,32(a0)
 ce0:	02853a83          	ld	s5,40(a0)
 ce4:	03053b03          	ld	s6,48(a0)
 ce8:	03853b83          	ld	s7,56(a0)
 cec:	04053c03          	ld	s8,64(a0)
 cf0:	04853c83          	ld	s9,72(a0)
 cf4:	05053d03          	ld	s10,80(a0)
 cf8:	05853d83          	ld	s11,88(a0)
 cfc:	06053083          	ld	ra,96(a0)
 d00:	06853103          	ld	sp,104(a0)
 d04:	c199                	beqz	a1,d0a <longjmp_1>
 d06:	852e                	mv	a0,a1
 d08:	8082                	ret

0000000000000d0a <longjmp_1>:
 d0a:	4505                	li	a0,1
 d0c:	8082                	ret
