#include "types.h"
#include "stat.h"
#include "user.h"
#include "wmap.h"

int main(void) {
   	uint test = wmap(0x60000000, 8192, MAP_FIXED | MAP_SHARED | MAP_ANONYMOUS, -1);
	wunmap(test);
	wmap(0x60001000, 8192, MAP_FIXED | MAP_SHARED | MAP_ANONYMOUS, -1);
	wunmap(0x60001000);
	exit();
}

