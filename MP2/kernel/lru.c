#include "lru.h"

#include "param.h"
#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"
#include "proc.h"

void lru_traversal(lru_t *q, uint64* pgtbl, int level){
	for (int i = 0; i < 512; i++){
		if (lru_full(q)) lru_pop(q, 0);
		pte_t *pte = &pgtbl[i];
		if (!*pte) continue;
		if (level != 2) {
			lru_traversal(q, (uint64 *)PTE2PA(*pte), level+1);
			break;
		}
		else if (i < 3 || !(*pte & PTE_V) || lru_find(q, (uint64 *)pte) != -1) continue; // avoid the first 3 ptes and duplicated ptes
		else {
			lru_push(q, pte);
		}
	}
}

void lru_init(lru_t *lru, uint64 *pgtbl){
	lru_traversal(lru, pgtbl, 0);
}

int lru_push(lru_t *lru, uint64 *e){
	if (lru_full(lru)) return -1;
	lru->bucket[lru->size++] = e;
	return 0;
}

uint64* lru_pop(lru_t *lru, int idx){
	if (idx>=lru->size || idx<0) return 0;
	while (*lru->bucket[idx] & PTE_P) idx++;
	uint64 *e = lru->bucket[idx];
	for (int i = idx; i < lru->size-1; i++){
		lru->bucket[i] = lru->bucket[i+1];
	}
	lru->size--;
	return e;
}

int lru_empty(lru_t *lru){
	return lru->size == 0;
}

int lru_full(lru_t *lru){
	return lru->size == PG_BUF_SIZE;
}

int lru_clear(lru_t *lru){
	lru->size = 0;
	for (int i = 0; i < PG_BUF_SIZE; i++){
		lru->bucket[i] = 0;
	}
	return 0;
}

int lru_find(lru_t *lru, uint64 *e){
	if (lru_empty(lru)) return -1;
	for (int i = 0; i < lru->size; i++){
		if (lru->bucket[i] == e) return i;
	}
	return -1;
}
