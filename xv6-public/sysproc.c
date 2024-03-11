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
	}

	cprintf("addr %d, length %d, flags %d, fd %d\n", addr, length, flags, fd);
    cprintf("priv %d, shared %d, anon %d, fixed %d\n", priv, shared, anon, fixed);

    // map the pages of memory
	int numPages = (length + 4095) / 4096;
	char *mem;
	
	for (int i = 0; i < numPages; i++) {
		mem = kalloc();
		mappages(currProc->pgdir, (void*)addr, 4096, V2P(mem), PTE_W | PTE_U);
		addr += 4096;
	}

	if(currProc->total_wmaps >= 16) {
		cprintf("already 16 wmaps\n");
		return -1;
	}

	int startAddr = addr - numPages * 4096;
	for (int i = 0; i < currProc->total_wmaps; i++) {
		if (startAddr >= currProc->wmaps[i].addr && startAddr <= currProc->wmaps[i].addr + currProc->wmaps[i].size) {
			cprintf("Invalid wmap\n");
			return -1;
		}
	} 
    currProc->wmaps[currProc->total_wmaps].addr = startAddr;
   	currProc->wmaps[currProc->total_wmaps].size = numPages * 4096;
    cprintf("%d\n", currProc->wmaps[currProc->total_wmaps].addr);
   	cprintf("%d\n", currProc->wmaps[currProc->total_wmaps].size);
   	currProc->total_wmaps += 1;
   	cprintf("%d\n", currProc->total_wmaps);
	return 0;
}

int 
sys_wunmap(void)
{
	uint addr;
	if (argint(0, (int*)&addr) < 0) {
		return -1;
	}
	cprintf("addr %d\n", addr);
	
	return 0;
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
