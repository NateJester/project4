#include "types.h"
#include "stat.h"
#include "user.h"
#include "wmap.h"

int main(void) {

	wmap(0x60000000, 8192, MAP_SHARED | MAP_ANONYMOUS | MAP_FIXED, -1);
	uint test = wmap(0, 4096, MAP_SHARED | MAP_ANONYMOUS, -1);
	struct wmapinfo *wminfo = malloc(sizeof(struct wmapinfo));
	getwmapinfo(wminfo);
	printf(1, "total_mmaps %d\n", wminfo->total_mmaps);
	wunmap(test);
	wunmap(0x60000000);
	
	exit();
}

