#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "wmap.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int
sys_wmap(void)
{
	// parse arguments
	uint addr;
	int length, flags, fd;
	struct proc *currProc = myproc();
	
	if (argint(0, (int*)&addr) < 0) {
		return -1;
	}
	
	if (argint(1, &length) < 0 || argint(2, &flags) < 0 || argint(3, &fd) < 0) {
		return -1;
	}

	// check flags using bits, set to 1 if flag is set
	int priv = 0, shared = 0, anon = 0, fixed = 0;
	if ((flags & (1 << 0)) != 0) {
		priv = 1;
	}
	if ((flags & (1 << 1)) != 0) {
		shared = 1;
	}
	if ((flags & (1 << 2)) != 0) {
		anon = 1;
	}
	if ((flags & (1 << 3)) != 0) {
		fixed = 1;
	} else {
	  // find address with free space
	}

	cprintf("addr 0x%x, length %d, flags %d, fd %d\n", addr, length, flags, fd);
    cprintf("priv %d, shared %d, anon %d, fixed %d\n", priv, shared, anon, fixed);

	int numPages = (length + 4095) / 4096;

	if(currProc->total_wmaps >= 16) {
		cprintf("already 16 wmaps\n");
		return -1;
	}

	int startAddr = addr;
	for (int i = 0; i < currProc->total_wmaps; i++) {
		if (startAddr >= currProc->wmaps[i].addr && startAddr <= currProc->wmaps[i].addr + currProc->wmaps[i].size) {
			cprintf("Invalid wmap\n");
			return -1;
		}
	}

	// map the pages of memory
	char *mem;
	for (int i = 0; i < numPages; i++) {
		mem = kalloc();
		mappages(currProc->pgdir, (void*)addr, 4096, V2P(mem), PTE_W | PTE_U);
		addr += 4096;
	}
	
    currProc->wmaps[currProc->total_wmaps].addr = startAddr;
   	currProc->wmaps[currProc->total_wmaps].size = numPages * 4096;
    cprintf("%d\n", currProc->wmaps[currProc->total_wmaps].addr);
   	cprintf("%d\n", currProc->wmaps[currProc->total_wmaps].size);
   	currProc->total_wmaps += 1;
   	cprintf("%d\n", currProc->total_wmaps);
	return startAddr;
}

int 
sys_wunmap(void)
{
	uint addr;
	if (argint(0, (int*)&addr) < 0 || addr%4096 != 0) {
		cprintf("wunmap: Invalid address\n");
		return FAILED;
	}
	
	struct proc *currProc = myproc();

	int numPages = 0;
	int match = 0;
	for (int i = 0; i < currProc->total_wmaps; i++) {
		if (currProc->wmaps[i].addr == addr) {
			match = 1;
			numPages = currProc->wmaps[i].size / 4096;
			for (int j = i; j < currProc->total_wmaps-1; j++) {
				currProc->wmaps[j].addr = currProc->wmaps[j+1].addr;
				currProc->wmaps[j].size = currProc->wmaps[j+1].size;
			}
			currProc->total_wmaps--;
		}
	}
	
	if (match == 0) {
		cprintf("wunmap: Not an existing wmap\n");
		return FAILED;
	}
	
	for (int k = 0; k < numPages; k++) {
		pte_t *pte = walkpgdir(currProc->pgdir, (void*)addr, 0);
		uint physical_address = PTE_ADDR(*pte);
		kfree(P2V(physical_address));
		addr += 4096;
		*pte = 0;
	}
	
	cprintf("unmap success\n");
	return addr;
}

uint
sys_wremap(void)
{
	uint oldaddr;
	int oldsize, newsize, flags;

	if (argint(0, (int*)&oldaddr) < 0) {
		return -1;
	}
	if (argint(1, &oldsize) < 0 || argint(2, &newsize) < 0 || argint(3, &flags) < 0) {
		return -1;
	}
	cprintf("oldaddr %d, oldsize %d, newsize %d, flags %d\n", oldaddr, oldsize, newsize, flags);
	return 0;
}

int 
sys_getpgdirinfo(void)
{
	struct pgdirinfo *pdinfo;
	if (argptr(0, (void*)&pdinfo, sizeof(*pdinfo)) < 0) {
		return -1;
	}
	return 0;
}

int 
sys_getwmapinfo(void)
{
	struct wmapinfo *wminfo;
	if (argptr(0, (void*)&wminfo, sizeof(*wminfo)) < 0) {
		return -1;
	}
	return 0;
}
