#include "types.h"
#include "stat.h"
#include "user.h"
#include "wmap.h"

int main(void) {

	wmap(0x60000000, 8192, MAP_SHARED | MAP_ANONYMOUS | MAP_FIXED, -1);
	struct pgdirinfo *pinfo = malloc(sizeof(struct pgdirinfo));
	if (getpgdirinfo(pinfo) == -1) {
		printf(1, "getpgdirinfo failed\n");
	} else {
		printf(1, "num pages: %d\n", pinfo->n_upages);
		printf(1, "pinfo[0]: va %x pa %x\n", pinfo->va[0], pinfo->pa[0]);
	}
	exit();
}

