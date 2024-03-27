#include "param.h"
#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"
#include "proc.h"
#include "vm.h"

/* NTU OS 2024 */
/* Allocate eight consecutive disk blocks. */
/* Save the content of the physical page in the pte */
/* to the disk blocks and save the block-id into the */
/* pte. */
char *swap_page_from_pte(pte_t *pte) {
  char *pa = (char*) PTE2PA(*pte);
  uint dp = balloc_page(ROOTDEV);

  write_page_to_disk(ROOTDEV, pa, dp); // write this page to disk
  *pte = (BLOCKNO2PTE(dp) | PTE_FLAGS(*pte) | PTE_S) & ~PTE_V;

  return pa;
}

/* NTU OS 2024 */
/* Page fault handler */
int handle_pgfault() {
  /* TODO */
  /* Find the address that caused the fault */
  uint64 base = PGROUNDDOWN(r_stval());
  // pagetable_t pagetable = myproc()->pagetable;
  // char *pa = kalloc();
  // memset(pa, 0, PGSIZE);
  // mappages(pagetable, base, PGSIZE, (uint64)pa, PTE_U|PTE_R|PTE_W|PTE_X);
  madvise(base, PGSIZE, MADV_WILLNEED);
  return 0;
}