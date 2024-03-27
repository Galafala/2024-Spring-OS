#include "fifo.h"
#include "param.h"
#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"
#include "proc.h"

void q_traversal(queue_t *q, uint64* pgtbl, int level){
	for (int i = 0; i < 512; i++){
		if (q_full(q)) q_pop_idx(q, 0);
		pte_t *pte = &pgtbl[i];
		if (!*pte) continue;
		if (level != 2) {
			q_traversal(q, (uint64 *)PTE2PA(*pte), level+1);
			break;
		}
		else if (i < 3 || !(*pte & PTE_V) || q_find(q, (uint64 *)pte) != -1) continue; // avoid the first 3 ptes and duplicated ptes
		else {
			q_push(q, pte);
		}
	}
}

void q_init(queue_t *q, uint64 *pgtbl){
	q_traversal(q, pgtbl, 0);
}

int q_push(queue_t *q, uint64 *e){
	if (q_full(q)) return -1;
	q->bucket[q->size++] = e;
	return 0;
}

uint64* q_pop_idx(queue_t *q, int idx){
	if (idx >= q->size || idx < 0) return 0;
	while (*q->bucket[idx] & PTE_P) idx++;
	uint64 *e = q->bucket[idx];
	for (int i = idx; i < q->size-1; i++){
		q->bucket[i] = q->bucket[i+1];
	}
	q->size--;
	return e;
}

int q_empty(queue_t *q){
	return q->size == 0;
}

int q_full(queue_t *q){
	return q->size == PG_BUF_SIZE;
}

int q_clear(queue_t *q){
	q->size = 0;
	for (int i = 0; i < PG_BUF_SIZE; i++){
		q->bucket[i] = 0;
	}
	return 0;
}

int q_find(queue_t *q, uint64 *e){
	if (q_empty(q)) return -1;
	for (int i=0; i < q->size; i++){
		if (q->bucket[i] == e) return i;
	}
	return -1;
}
