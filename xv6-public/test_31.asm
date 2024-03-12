
_test_31:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
        printf(1, "Cause: expected 0x%x with length %d to %s in the list of maps\n", addr, length, expected ? "exist" : "not exist");
        failed();
    }
}

int main() {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec 6c 02 00 00    	sub    $0x26c,%esp
    printf(1, "\n\n%s\n", test_name);
  17:	ff 35 ac 0f 00 00    	push   0xfac
  1d:	68 35 0a 00 00       	push   $0xa35
  22:	6a 01                	push   $0x1
  24:	e8 b7 06 00 00       	call   6e0 <printf>

    // validate initial state
    struct wmapinfo winfo1;
    get_n_validate_wmap_info(&winfo1, 0);
  29:	58                   	pop    %eax
  2a:	8d 85 9c fd ff ff    	lea    -0x264(%ebp),%eax
  30:	5a                   	pop    %edx
  31:	6a 00                	push   $0x0
  33:	50                   	push   %eax
  34:	e8 07 02 00 00       	call   240 <get_n_validate_wmap_info>
    //
    // 1. create a anonymous MAP 1
    //
    uint map1addr1 = MMAPBASE + PGSIZE * N_PAGES;
    int map1len1 = PGSIZE * N_PAGES;
    uint map1v1 = wmap(map1addr1, map1len1, fixed_anon, fd);
  39:	6a ff                	push   $0xffffffff
  3b:	6a 0d                	push   $0xd
  3d:	68 00 a0 00 00       	push   $0xa000
  42:	68 00 a0 00 60       	push   $0x6000a000
  47:	e8 b7 05 00 00       	call   603 <wmap>
    if (map1v1 == FAILED) {
  4c:	83 c4 20             	add    $0x20,%esp
  4f:	83 f8 ff             	cmp    $0xffffffff,%eax
  52:	0f 84 c1 00 00 00    	je     119 <main+0x119>
        printf(1, "Cause: `wmap()` returned 0x%x\n", map1v1);
        failed();
    }
    printf(1, "Map 1 placed at 0x%x (length 0x%x)\n", map1v1, map1len1);
  58:	68 00 a0 00 00       	push   $0xa000
  5d:	89 c3                	mov    %eax,%ebx
  5f:	50                   	push   %eax
  60:	68 3c 0b 00 00       	push   $0xb3c
  65:	6a 01                	push   $0x1
  67:	e8 74 06 00 00       	call   6e0 <printf>
    //
    // 2. create another anonymous MAP 2
    //
    uint map2addr1 = map1addr1 - PGSIZE * N_PAGES;
    int map2len1 = PGSIZE * N_PAGES;
    uint map2v1 = wmap(map2addr1, map2len1, fixed_anon, fd);
  6c:	6a ff                	push   $0xffffffff
  6e:	6a 0d                	push   $0xd
  70:	68 00 a0 00 00       	push   $0xa000
  75:	68 00 00 00 60       	push   $0x60000000
  7a:	e8 84 05 00 00       	call   603 <wmap>
    if (map2v1 == FAILED) {
  7f:	83 c4 20             	add    $0x20,%esp
    uint map2v1 = wmap(map2addr1, map2len1, fixed_anon, fd);
  82:	89 c6                	mov    %eax,%esi
    if (map2v1 == FAILED) {
  84:	83 f8 ff             	cmp    $0xffffffff,%eax
  87:	74 7d                	je     106 <main+0x106>
        printf(1, "\tCause:\tmem2 failed\n");
        failed();
    }
    printf(1, "Map 2 placed at 0x%x (length 0x%x)\n", map2v1, map2len1);
  89:	68 00 a0 00 00       	push   $0xa000
  8e:	50                   	push   %eax
  8f:	68 60 0b 00 00       	push   $0xb60
  94:	6a 01                	push   $0x1
  96:	e8 45 06 00 00       	call   6e0 <printf>

    // validate mid state
    struct wmapinfo winfo2;
    get_n_validate_wmap_info(&winfo2, 2); // 2 maps exist
  9b:	59                   	pop    %ecx
  9c:	5f                   	pop    %edi
  9d:	8d bd 60 fe ff ff    	lea    -0x1a0(%ebp),%edi
  a3:	6a 02                	push   $0x2
  a5:	57                   	push   %edi
  a6:	e8 95 01 00 00       	call   240 <get_n_validate_wmap_info>
    map_exists(&winfo2, map1v1, map1len1, TRUE);
  ab:	6a 01                	push   $0x1
  ad:	68 00 a0 00 00       	push   $0xa000
  b2:	53                   	push   %ebx
  b3:	57                   	push   %edi
  b4:	e8 d7 01 00 00       	call   290 <map_exists>
  b9:	83 c4 10             	add    $0x10,%esp
    map_exists(&winfo2, map2v1, map2len1, TRUE);
  bc:	6a 01                	push   $0x1
  be:	68 00 a0 00 00       	push   $0xa000
  c3:	56                   	push   %esi
  c4:	57                   	push   %edi
  c5:	e8 c6 01 00 00       	call   290 <map_exists>
    printf(1, "Validated two maps. \tOkay\n");
  ca:	83 c4 18             	add    $0x18,%esp
  cd:	68 50 0a 00 00       	push   $0xa50
  d2:	6a 01                	push   $0x1
  d4:	e8 07 06 00 00       	call   6e0 <printf>

    //
    // 3. expand Map 2 that requires moving, without moving flag (dont_move)
    //
    int map2len2 = PGSIZE * (N_PAGES + 2);
    uint map2v2 = wremap(map2v1, map2len1, map2len2, dont_move);
  d9:	6a 00                	push   $0x0
  db:	68 00 c0 00 00       	push   $0xc000
  e0:	68 00 a0 00 00       	push   $0xa000
  e5:	56                   	push   %esi
  e6:	e8 28 05 00 00       	call   613 <wremap>
    if (map2v2 != FAILED) {
  eb:	83 c4 20             	add    $0x20,%esp
  ee:	83 f8 ff             	cmp    $0xffffffff,%eax
  f1:	74 3a                	je     12d <main+0x12d>
        printf(1, "Cause: `wremap` returned 0x%x\n", map2v2);
  f3:	52                   	push   %edx
  f4:	50                   	push   %eax
  f5:	68 84 0b 00 00       	push   $0xb84
  fa:	6a 01                	push   $0x1
  fc:	e8 df 05 00 00       	call   6e0 <printf>
        failed();
 101:	e8 1a 01 00 00       	call   220 <failed>
        printf(1, "\tCause:\tmem2 failed\n");
 106:	50                   	push   %eax
 107:	50                   	push   %eax
 108:	68 3b 0a 00 00       	push   $0xa3b
 10d:	6a 01                	push   $0x1
 10f:	e8 cc 05 00 00       	call   6e0 <printf>
        failed();
 114:	e8 07 01 00 00       	call   220 <failed>
        printf(1, "Cause: `wmap()` returned 0x%x\n", map1v1);
 119:	50                   	push   %eax
 11a:	6a ff                	push   $0xffffffff
 11c:	68 1c 0b 00 00       	push   $0xb1c
 121:	6a 01                	push   $0x1
 123:	e8 b8 05 00 00       	call   6e0 <printf>
        failed();
 128:	e8 f3 00 00 00       	call   220 <failed>
    }
    printf(1, "Map 2 failed to move as the dont_move flag was set. \tOkay\n");
 12d:	57                   	push   %edi
 12e:	57                   	push   %edi
 12f:	68 a4 0b 00 00       	push   $0xba4
 134:	6a 01                	push   $0x1
 136:	e8 a5 05 00 00       	call   6e0 <printf>

    //
    // 4. expand map2 that requires moving, with moving flag (allow_move)
    //
    int map2len3 = map2len2;
    uint map2v3 = wremap(map2v1, map2len1, map2len3, allow_move);
 13b:	6a 01                	push   $0x1
 13d:	68 00 c0 00 00       	push   $0xc000
 142:	68 00 a0 00 00       	push   $0xa000
 147:	56                   	push   %esi
 148:	e8 c6 04 00 00       	call   613 <wremap>
    if (map2v3 == FAILED) {
 14d:	83 c4 20             	add    $0x20,%esp
 150:	83 f8 ff             	cmp    $0xffffffff,%eax
 153:	0f 84 86 00 00 00    	je     1df <main+0x1df>
        printf(1, "Cause: `wremap` returned 0x%x\n", map2v3);
        failed();
    }
    if (map2v3 == map2v1) {
 159:	39 c6                	cmp    %eax,%esi
 15b:	74 6f                	je     1cc <main+0x1cc>
        printf(1, "Cause: Map 2 did not move\n");
        failed();
    }
    // validate final state
    struct wmapinfo winfo3;
    get_n_validate_wmap_info(&winfo3, 2);        // still 2 maps
 15d:	8d bd 24 ff ff ff    	lea    -0xdc(%ebp),%edi
 163:	89 85 94 fd ff ff    	mov    %eax,-0x26c(%ebp)
 169:	50                   	push   %eax
 16a:	50                   	push   %eax
 16b:	6a 02                	push   $0x2
 16d:	57                   	push   %edi
 16e:	e8 cd 00 00 00       	call   240 <get_n_validate_wmap_info>
    map_exists(&winfo3, map1v1, map1len1, TRUE); // Map 1 exists
 173:	6a 01                	push   $0x1
 175:	68 00 a0 00 00       	push   $0xa000
 17a:	53                   	push   %ebx
 17b:	57                   	push   %edi
 17c:	e8 0f 01 00 00       	call   290 <map_exists>
    map_exists(&winfo3, map2v3, map2len3, TRUE); // Map 2 exists but at a different address
 181:	8b 85 94 fd ff ff    	mov    -0x26c(%ebp),%eax
    map_exists(&winfo3, map1v1, map1len1, TRUE); // Map 1 exists
 187:	83 c4 10             	add    $0x10,%esp
    map_exists(&winfo3, map2v3, map2len3, TRUE); // Map 2 exists but at a different address
 18a:	6a 01                	push   $0x1
 18c:	68 00 c0 00 00       	push   $0xc000
 191:	50                   	push   %eax
 192:	57                   	push   %edi
 193:	e8 f8 00 00 00       	call   290 <map_exists>
 198:	83 c4 10             	add    $0x10,%esp
    map_exists(&winfo3, map2v1, map2len1, FALSE);
 19b:	6a 00                	push   $0x0
 19d:	68 00 a0 00 00       	push   $0xa000
 1a2:	56                   	push   %esi
 1a3:	57                   	push   %edi
 1a4:	e8 e7 00 00 00       	call   290 <map_exists>
    printf(1, "Map 2 moved to 0x%x (length 0x%x). \tOkay\n", map2v3, map2len3);
 1a9:	8b 85 94 fd ff ff    	mov    -0x26c(%ebp),%eax
    map_exists(&winfo3, map2v1, map2len1, FALSE);
 1af:	83 c4 10             	add    $0x10,%esp
    printf(1, "Map 2 moved to 0x%x (length 0x%x). \tOkay\n", map2v3, map2len3);
 1b2:	68 00 c0 00 00       	push   $0xc000
 1b7:	50                   	push   %eax
 1b8:	68 e0 0b 00 00       	push   $0xbe0
 1bd:	6a 01                	push   $0x1
 1bf:	e8 1c 05 00 00       	call   6e0 <printf>

    // test ends
    success();
 1c4:	83 c4 20             	add    $0x20,%esp
 1c7:	e8 34 00 00 00       	call   200 <success>
        printf(1, "Cause: Map 2 did not move\n");
 1cc:	52                   	push   %edx
 1cd:	52                   	push   %edx
 1ce:	68 6b 0a 00 00       	push   $0xa6b
 1d3:	6a 01                	push   $0x1
 1d5:	e8 06 05 00 00       	call   6e0 <printf>
        failed();
 1da:	e8 41 00 00 00       	call   220 <failed>
        printf(1, "Cause: `wremap` returned 0x%x\n", map2v3);
 1df:	51                   	push   %ecx
 1e0:	6a ff                	push   $0xffffffff
 1e2:	68 84 0b 00 00       	push   $0xb84
 1e7:	6a 01                	push   $0x1
 1e9:	e8 f2 04 00 00       	call   6e0 <printf>
        failed();
 1ee:	e8 2d 00 00 00       	call   220 <failed>
 1f3:	66 90                	xchg   %ax,%ax
 1f5:	66 90                	xchg   %ax,%ax
 1f7:	66 90                	xchg   %ax,%ax
 1f9:	66 90                	xchg   %ax,%ax
 1fb:	66 90                	xchg   %ax,%ax
 1fd:	66 90                	xchg   %ax,%ax
 1ff:	90                   	nop

00000200 <success>:
void success() {
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\nWMMAP\t SUCCESS\n\n");
 206:	68 08 0a 00 00       	push   $0xa08
 20b:	6a 01                	push   $0x1
 20d:	e8 ce 04 00 00       	call   6e0 <printf>
    exit();
 212:	e8 4c 03 00 00       	call   563 <exit>
 217:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21e:	66 90                	xchg   %ax,%ax

00000220 <failed>:
void failed() {
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\nWMMAP\t FAILED\n\n");
 226:	68 1a 0a 00 00       	push   $0xa1a
 22b:	6a 01                	push   $0x1
 22d:	e8 ae 04 00 00       	call   6e0 <printf>
    exit();
 232:	e8 2c 03 00 00       	call   563 <exit>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax

00000240 <get_n_validate_wmap_info>:
void get_n_validate_wmap_info(struct wmapinfo *info, int expected_total_mmaps) {
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	83 ec 10             	sub    $0x10,%esp
 247:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int ret = getwmapinfo(info);
 24a:	53                   	push   %ebx
 24b:	e8 d3 03 00 00       	call   623 <getwmapinfo>
    if (ret < 0) {
 250:	83 c4 10             	add    $0x10,%esp
 253:	85 c0                	test   %eax,%eax
 255:	78 0c                	js     263 <get_n_validate_wmap_info+0x23>
    if (info->total_mmaps != expected_total_mmaps) {
 257:	8b 03                	mov    (%ebx),%eax
 259:	3b 45 0c             	cmp    0xc(%ebp),%eax
 25c:	75 18                	jne    276 <get_n_validate_wmap_info+0x36>
}
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	c9                   	leave  
 262:	c3                   	ret    
        printf(1, "Cause: `getwmapinfo()` returned %d\n", ret);
 263:	52                   	push   %edx
 264:	50                   	push   %eax
 265:	68 90 0a 00 00       	push   $0xa90
 26a:	6a 01                	push   $0x1
 26c:	e8 6f 04 00 00       	call   6e0 <printf>
        failed();
 271:	e8 aa ff ff ff       	call   220 <failed>
        printf(1, "Cause: expected %d maps, but found %d\n", expected_total_mmaps, info->total_mmaps);
 276:	50                   	push   %eax
 277:	ff 75 0c             	push   0xc(%ebp)
 27a:	68 b4 0a 00 00       	push   $0xab4
 27f:	6a 01                	push   $0x1
 281:	e8 5a 04 00 00       	call   6e0 <printf>
        failed();
 286:	e8 95 ff ff ff       	call   220 <failed>
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop

00000290 <map_exists>:
void map_exists(struct wmapinfo *info, uint addr, int length, int expected) {
 290:	55                   	push   %ebp
    for (int i = 0; i < info->total_mmaps; i++) {
 291:	31 c0                	xor    %eax,%eax
void map_exists(struct wmapinfo *info, uint addr, int length, int expected) {
 293:	89 e5                	mov    %esp,%ebp
 295:	56                   	push   %esi
 296:	8b 55 08             	mov    0x8(%ebp),%edx
 299:	8b 75 10             	mov    0x10(%ebp),%esi
 29c:	53                   	push   %ebx
 29d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    for (int i = 0; i < info->total_mmaps; i++) {
 2a0:	8b 0a                	mov    (%edx),%ecx
 2a2:	85 c9                	test   %ecx,%ecx
 2a4:	7f 11                	jg     2b7 <map_exists+0x27>
 2a6:	eb 20                	jmp    2c8 <map_exists+0x38>
 2a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop
 2b0:	83 c0 01             	add    $0x1,%eax
 2b3:	39 c8                	cmp    %ecx,%eax
 2b5:	74 21                	je     2d8 <map_exists+0x48>
        if (info->addr[i] == addr && info->length[i] == length) {
 2b7:	39 5c 82 04          	cmp    %ebx,0x4(%edx,%eax,4)
 2bb:	75 f3                	jne    2b0 <map_exists+0x20>
 2bd:	39 74 82 44          	cmp    %esi,0x44(%edx,%eax,4)
 2c1:	75 ed                	jne    2b0 <map_exists+0x20>
            found = 1;
 2c3:	b8 01 00 00 00       	mov    $0x1,%eax
    if (found != expected) {
 2c8:	3b 45 14             	cmp    0x14(%ebp),%eax
 2cb:	75 0f                	jne    2dc <map_exists+0x4c>
}
 2cd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d0:	5b                   	pop    %ebx
 2d1:	5e                   	pop    %esi
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    
 2d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int found = 0;
 2d8:	31 c0                	xor    %eax,%eax
 2da:	eb ec                	jmp    2c8 <map_exists+0x38>
        printf(1, "Cause: expected 0x%x with length %d to %s in the list of maps\n", addr, length, expected ? "exist" : "not exist");
 2dc:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 2e0:	ba 2b 0a 00 00       	mov    $0xa2b,%edx
 2e5:	b8 2f 0a 00 00       	mov    $0xa2f,%eax
 2ea:	0f 44 c2             	cmove  %edx,%eax
 2ed:	83 ec 0c             	sub    $0xc,%esp
 2f0:	50                   	push   %eax
 2f1:	56                   	push   %esi
 2f2:	53                   	push   %ebx
 2f3:	68 dc 0a 00 00       	push   $0xadc
 2f8:	6a 01                	push   $0x1
 2fa:	e8 e1 03 00 00       	call   6e0 <printf>
        failed();
 2ff:	83 c4 20             	add    $0x20,%esp
 302:	e8 19 ff ff ff       	call   220 <failed>
 307:	66 90                	xchg   %ax,%ax
 309:	66 90                	xchg   %ax,%ax
 30b:	66 90                	xchg   %ax,%ax
 30d:	66 90                	xchg   %ax,%ax
 30f:	90                   	nop

00000310 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 310:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 311:	31 c0                	xor    %eax,%eax
{
 313:	89 e5                	mov    %esp,%ebp
 315:	53                   	push   %ebx
 316:	8b 4d 08             	mov    0x8(%ebp),%ecx
 319:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 320:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 324:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 327:	83 c0 01             	add    $0x1,%eax
 32a:	84 d2                	test   %dl,%dl
 32c:	75 f2                	jne    320 <strcpy+0x10>
    ;
  return os;
}
 32e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 331:	89 c8                	mov    %ecx,%eax
 333:	c9                   	leave  
 334:	c3                   	ret    
 335:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
 344:	8b 55 08             	mov    0x8(%ebp),%edx
 347:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 34a:	0f b6 02             	movzbl (%edx),%eax
 34d:	84 c0                	test   %al,%al
 34f:	75 17                	jne    368 <strcmp+0x28>
 351:	eb 3a                	jmp    38d <strcmp+0x4d>
 353:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 357:	90                   	nop
 358:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 35c:	83 c2 01             	add    $0x1,%edx
 35f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 362:	84 c0                	test   %al,%al
 364:	74 1a                	je     380 <strcmp+0x40>
    p++, q++;
 366:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 368:	0f b6 19             	movzbl (%ecx),%ebx
 36b:	38 c3                	cmp    %al,%bl
 36d:	74 e9                	je     358 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 36f:	29 d8                	sub    %ebx,%eax
}
 371:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 374:	c9                   	leave  
 375:	c3                   	ret    
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 380:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 384:	31 c0                	xor    %eax,%eax
 386:	29 d8                	sub    %ebx,%eax
}
 388:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38b:	c9                   	leave  
 38c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 38d:	0f b6 19             	movzbl (%ecx),%ebx
 390:	31 c0                	xor    %eax,%eax
 392:	eb db                	jmp    36f <strcmp+0x2f>
 394:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <strlen>:

uint
strlen(const char *s)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3a6:	80 3a 00             	cmpb   $0x0,(%edx)
 3a9:	74 15                	je     3c0 <strlen+0x20>
 3ab:	31 c0                	xor    %eax,%eax
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
 3b0:	83 c0 01             	add    $0x1,%eax
 3b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3b7:	89 c1                	mov    %eax,%ecx
 3b9:	75 f5                	jne    3b0 <strlen+0x10>
    ;
  return n;
}
 3bb:	89 c8                	mov    %ecx,%eax
 3bd:	5d                   	pop    %ebp
 3be:	c3                   	ret    
 3bf:	90                   	nop
  for(n = 0; s[n]; n++)
 3c0:	31 c9                	xor    %ecx,%ecx
}
 3c2:	5d                   	pop    %ebp
 3c3:	89 c8                	mov    %ecx,%eax
 3c5:	c3                   	ret    
 3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi

000003d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3da:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dd:	89 d7                	mov    %edx,%edi
 3df:	fc                   	cld    
 3e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3e5:	89 d0                	mov    %edx,%eax
 3e7:	c9                   	leave  
 3e8:	c3                   	ret    
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003f0 <strchr>:

char*
strchr(const char *s, char c)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	8b 45 08             	mov    0x8(%ebp),%eax
 3f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3fa:	0f b6 10             	movzbl (%eax),%edx
 3fd:	84 d2                	test   %dl,%dl
 3ff:	75 12                	jne    413 <strchr+0x23>
 401:	eb 1d                	jmp    420 <strchr+0x30>
 403:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 407:	90                   	nop
 408:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 40c:	83 c0 01             	add    $0x1,%eax
 40f:	84 d2                	test   %dl,%dl
 411:	74 0d                	je     420 <strchr+0x30>
    if(*s == c)
 413:	38 d1                	cmp    %dl,%cl
 415:	75 f1                	jne    408 <strchr+0x18>
      return (char*)s;
  return 0;
}
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 420:	31 c0                	xor    %eax,%eax
}
 422:	5d                   	pop    %ebp
 423:	c3                   	ret    
 424:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <gets>:

char*
gets(char *buf, int max)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 435:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 438:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 439:	31 db                	xor    %ebx,%ebx
{
 43b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 43e:	eb 27                	jmp    467 <gets+0x37>
    cc = read(0, &c, 1);
 440:	83 ec 04             	sub    $0x4,%esp
 443:	6a 01                	push   $0x1
 445:	57                   	push   %edi
 446:	6a 00                	push   $0x0
 448:	e8 2e 01 00 00       	call   57b <read>
    if(cc < 1)
 44d:	83 c4 10             	add    $0x10,%esp
 450:	85 c0                	test   %eax,%eax
 452:	7e 1d                	jle    471 <gets+0x41>
      break;
    buf[i++] = c;
 454:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 458:	8b 55 08             	mov    0x8(%ebp),%edx
 45b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 45f:	3c 0a                	cmp    $0xa,%al
 461:	74 1d                	je     480 <gets+0x50>
 463:	3c 0d                	cmp    $0xd,%al
 465:	74 19                	je     480 <gets+0x50>
  for(i=0; i+1 < max; ){
 467:	89 de                	mov    %ebx,%esi
 469:	83 c3 01             	add    $0x1,%ebx
 46c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 46f:	7c cf                	jl     440 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 471:	8b 45 08             	mov    0x8(%ebp),%eax
 474:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 478:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47b:	5b                   	pop    %ebx
 47c:	5e                   	pop    %esi
 47d:	5f                   	pop    %edi
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    
  buf[i] = '\0';
 480:	8b 45 08             	mov    0x8(%ebp),%eax
 483:	89 de                	mov    %ebx,%esi
 485:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 489:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48c:	5b                   	pop    %ebx
 48d:	5e                   	pop    %esi
 48e:	5f                   	pop    %edi
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret    
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	56                   	push   %esi
 4a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4a5:	83 ec 08             	sub    $0x8,%esp
 4a8:	6a 00                	push   $0x0
 4aa:	ff 75 08             	push   0x8(%ebp)
 4ad:	e8 f1 00 00 00       	call   5a3 <open>
  if(fd < 0)
 4b2:	83 c4 10             	add    $0x10,%esp
 4b5:	85 c0                	test   %eax,%eax
 4b7:	78 27                	js     4e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4b9:	83 ec 08             	sub    $0x8,%esp
 4bc:	ff 75 0c             	push   0xc(%ebp)
 4bf:	89 c3                	mov    %eax,%ebx
 4c1:	50                   	push   %eax
 4c2:	e8 f4 00 00 00       	call   5bb <fstat>
  close(fd);
 4c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ca:	89 c6                	mov    %eax,%esi
  close(fd);
 4cc:	e8 ba 00 00 00       	call   58b <close>
  return r;
 4d1:	83 c4 10             	add    $0x10,%esp
}
 4d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4d7:	89 f0                	mov    %esi,%eax
 4d9:	5b                   	pop    %ebx
 4da:	5e                   	pop    %esi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret    
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4e5:	eb ed                	jmp    4d4 <stat+0x34>
 4e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ee:	66 90                	xchg   %ax,%ax

000004f0 <atoi>:

int
atoi(const char *s)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	53                   	push   %ebx
 4f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4f7:	0f be 02             	movsbl (%edx),%eax
 4fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 500:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 505:	77 1e                	ja     525 <atoi+0x35>
 507:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 510:	83 c2 01             	add    $0x1,%edx
 513:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 516:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 51a:	0f be 02             	movsbl (%edx),%eax
 51d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 520:	80 fb 09             	cmp    $0x9,%bl
 523:	76 eb                	jbe    510 <atoi+0x20>
  return n;
}
 525:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 528:	89 c8                	mov    %ecx,%eax
 52a:	c9                   	leave  
 52b:	c3                   	ret    
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000530 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	8b 45 10             	mov    0x10(%ebp),%eax
 537:	8b 55 08             	mov    0x8(%ebp),%edx
 53a:	56                   	push   %esi
 53b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 53e:	85 c0                	test   %eax,%eax
 540:	7e 13                	jle    555 <memmove+0x25>
 542:	01 d0                	add    %edx,%eax
  dst = vdst;
 544:	89 d7                	mov    %edx,%edi
 546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 550:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 551:	39 f8                	cmp    %edi,%eax
 553:	75 fb                	jne    550 <memmove+0x20>
  return vdst;
}
 555:	5e                   	pop    %esi
 556:	89 d0                	mov    %edx,%eax
 558:	5f                   	pop    %edi
 559:	5d                   	pop    %ebp
 55a:	c3                   	ret    

0000055b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 55b:	b8 01 00 00 00       	mov    $0x1,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <exit>:
SYSCALL(exit)
 563:	b8 02 00 00 00       	mov    $0x2,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <wait>:
SYSCALL(wait)
 56b:	b8 03 00 00 00       	mov    $0x3,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <pipe>:
SYSCALL(pipe)
 573:	b8 04 00 00 00       	mov    $0x4,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <read>:
SYSCALL(read)
 57b:	b8 05 00 00 00       	mov    $0x5,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <write>:
SYSCALL(write)
 583:	b8 10 00 00 00       	mov    $0x10,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <close>:
SYSCALL(close)
 58b:	b8 15 00 00 00       	mov    $0x15,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <kill>:
SYSCALL(kill)
 593:	b8 06 00 00 00       	mov    $0x6,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <exec>:
SYSCALL(exec)
 59b:	b8 07 00 00 00       	mov    $0x7,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <open>:
SYSCALL(open)
 5a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <mknod>:
SYSCALL(mknod)
 5ab:	b8 11 00 00 00       	mov    $0x11,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <unlink>:
SYSCALL(unlink)
 5b3:	b8 12 00 00 00       	mov    $0x12,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <fstat>:
SYSCALL(fstat)
 5bb:	b8 08 00 00 00       	mov    $0x8,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <link>:
SYSCALL(link)
 5c3:	b8 13 00 00 00       	mov    $0x13,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <mkdir>:
SYSCALL(mkdir)
 5cb:	b8 14 00 00 00       	mov    $0x14,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <chdir>:
SYSCALL(chdir)
 5d3:	b8 09 00 00 00       	mov    $0x9,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <dup>:
SYSCALL(dup)
 5db:	b8 0a 00 00 00       	mov    $0xa,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <getpid>:
SYSCALL(getpid)
 5e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <sbrk>:
SYSCALL(sbrk)
 5eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <sleep>:
SYSCALL(sleep)
 5f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <uptime>:
SYSCALL(uptime)
 5fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <wmap>:
SYSCALL(wmap)
 603:	b8 16 00 00 00       	mov    $0x16,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <wunmap>:
SYSCALL(wunmap)
 60b:	b8 17 00 00 00       	mov    $0x17,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <wremap>:
SYSCALL(wremap)
 613:	b8 18 00 00 00       	mov    $0x18,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <getpgdirinfo>:
SYSCALL(getpgdirinfo)
 61b:	b8 19 00 00 00       	mov    $0x19,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <getwmapinfo>:
SYSCALL(getwmapinfo)
 623:	b8 1a 00 00 00       	mov    $0x1a,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    
 62b:	66 90                	xchg   %ax,%ax
 62d:	66 90                	xchg   %ax,%ax
 62f:	90                   	nop

00000630 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 3c             	sub    $0x3c,%esp
 639:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 63c:	89 d1                	mov    %edx,%ecx
{
 63e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 641:	85 d2                	test   %edx,%edx
 643:	0f 89 7f 00 00 00    	jns    6c8 <printint+0x98>
 649:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 64d:	74 79                	je     6c8 <printint+0x98>
    neg = 1;
 64f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 656:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 658:	31 db                	xor    %ebx,%ebx
 65a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 65d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 660:	89 c8                	mov    %ecx,%eax
 662:	31 d2                	xor    %edx,%edx
 664:	89 cf                	mov    %ecx,%edi
 666:	f7 75 c4             	divl   -0x3c(%ebp)
 669:	0f b6 92 6c 0c 00 00 	movzbl 0xc6c(%edx),%edx
 670:	89 45 c0             	mov    %eax,-0x40(%ebp)
 673:	89 d8                	mov    %ebx,%eax
 675:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 678:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 67b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 67e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 681:	76 dd                	jbe    660 <printint+0x30>
  if(neg)
 683:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 686:	85 c9                	test   %ecx,%ecx
 688:	74 0c                	je     696 <printint+0x66>
    buf[i++] = '-';
 68a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 68f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 691:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 696:	8b 7d b8             	mov    -0x48(%ebp),%edi
 699:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 69d:	eb 07                	jmp    6a6 <printint+0x76>
 69f:	90                   	nop
    putc(fd, buf[i]);
 6a0:	0f b6 13             	movzbl (%ebx),%edx
 6a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6a6:	83 ec 04             	sub    $0x4,%esp
 6a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6ac:	6a 01                	push   $0x1
 6ae:	56                   	push   %esi
 6af:	57                   	push   %edi
 6b0:	e8 ce fe ff ff       	call   583 <write>
  while(--i >= 0)
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	39 de                	cmp    %ebx,%esi
 6ba:	75 e4                	jne    6a0 <printint+0x70>
}
 6bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5f                   	pop    %edi
 6c2:	5d                   	pop    %ebp
 6c3:	c3                   	ret    
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6cf:	eb 87                	jmp    658 <printint+0x28>
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop

000006e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 6ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 6ef:	0f b6 13             	movzbl (%ebx),%edx
 6f2:	84 d2                	test   %dl,%dl
 6f4:	74 6a                	je     760 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 6f6:	8d 45 10             	lea    0x10(%ebp),%eax
 6f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 6fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 701:	89 45 d0             	mov    %eax,-0x30(%ebp)
 704:	eb 36                	jmp    73c <printf+0x5c>
 706:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70d:	8d 76 00             	lea    0x0(%esi),%esi
 710:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 713:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 718:	83 f8 25             	cmp    $0x25,%eax
 71b:	74 15                	je     732 <printf+0x52>
  write(fd, &c, 1);
 71d:	83 ec 04             	sub    $0x4,%esp
 720:	88 55 e7             	mov    %dl,-0x19(%ebp)
 723:	6a 01                	push   $0x1
 725:	57                   	push   %edi
 726:	56                   	push   %esi
 727:	e8 57 fe ff ff       	call   583 <write>
 72c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 72f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 732:	0f b6 13             	movzbl (%ebx),%edx
 735:	83 c3 01             	add    $0x1,%ebx
 738:	84 d2                	test   %dl,%dl
 73a:	74 24                	je     760 <printf+0x80>
    c = fmt[i] & 0xff;
 73c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 73f:	85 c9                	test   %ecx,%ecx
 741:	74 cd                	je     710 <printf+0x30>
      }
    } else if(state == '%'){
 743:	83 f9 25             	cmp    $0x25,%ecx
 746:	75 ea                	jne    732 <printf+0x52>
      if(c == 'd'){
 748:	83 f8 25             	cmp    $0x25,%eax
 74b:	0f 84 07 01 00 00    	je     858 <printf+0x178>
 751:	83 e8 63             	sub    $0x63,%eax
 754:	83 f8 15             	cmp    $0x15,%eax
 757:	77 17                	ja     770 <printf+0x90>
 759:	ff 24 85 14 0c 00 00 	jmp    *0xc14(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 760:	8d 65 f4             	lea    -0xc(%ebp),%esp
 763:	5b                   	pop    %ebx
 764:	5e                   	pop    %esi
 765:	5f                   	pop    %edi
 766:	5d                   	pop    %ebp
 767:	c3                   	ret    
 768:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
  write(fd, &c, 1);
 770:	83 ec 04             	sub    $0x4,%esp
 773:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 776:	6a 01                	push   $0x1
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 77e:	e8 00 fe ff ff       	call   583 <write>
        putc(fd, c);
 783:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 787:	83 c4 0c             	add    $0xc,%esp
 78a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 78d:	6a 01                	push   $0x1
 78f:	57                   	push   %edi
 790:	56                   	push   %esi
 791:	e8 ed fd ff ff       	call   583 <write>
        putc(fd, c);
 796:	83 c4 10             	add    $0x10,%esp
      state = 0;
 799:	31 c9                	xor    %ecx,%ecx
 79b:	eb 95                	jmp    732 <printf+0x52>
 79d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7a0:	83 ec 0c             	sub    $0xc,%esp
 7a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7a8:	6a 00                	push   $0x0
 7aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7ad:	8b 10                	mov    (%eax),%edx
 7af:	89 f0                	mov    %esi,%eax
 7b1:	e8 7a fe ff ff       	call   630 <printint>
        ap++;
 7b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7bd:	31 c9                	xor    %ecx,%ecx
 7bf:	e9 6e ff ff ff       	jmp    732 <printf+0x52>
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7cb:	8b 10                	mov    (%eax),%edx
        ap++;
 7cd:	83 c0 04             	add    $0x4,%eax
 7d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7d3:	85 d2                	test   %edx,%edx
 7d5:	0f 84 8d 00 00 00    	je     868 <printf+0x188>
        while(*s != 0){
 7db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 7de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 7e0:	84 c0                	test   %al,%al
 7e2:	0f 84 4a ff ff ff    	je     732 <printf+0x52>
 7e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7eb:	89 d3                	mov    %edx,%ebx
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7f3:	83 c3 01             	add    $0x1,%ebx
 7f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7f9:	6a 01                	push   $0x1
 7fb:	57                   	push   %edi
 7fc:	56                   	push   %esi
 7fd:	e8 81 fd ff ff       	call   583 <write>
        while(*s != 0){
 802:	0f b6 03             	movzbl (%ebx),%eax
 805:	83 c4 10             	add    $0x10,%esp
 808:	84 c0                	test   %al,%al
 80a:	75 e4                	jne    7f0 <printf+0x110>
      state = 0;
 80c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 80f:	31 c9                	xor    %ecx,%ecx
 811:	e9 1c ff ff ff       	jmp    732 <printf+0x52>
 816:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 820:	83 ec 0c             	sub    $0xc,%esp
 823:	b9 0a 00 00 00       	mov    $0xa,%ecx
 828:	6a 01                	push   $0x1
 82a:	e9 7b ff ff ff       	jmp    7aa <printf+0xca>
 82f:	90                   	nop
        putc(fd, *ap);
 830:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 833:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 836:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 838:	6a 01                	push   $0x1
 83a:	57                   	push   %edi
 83b:	56                   	push   %esi
        putc(fd, *ap);
 83c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 83f:	e8 3f fd ff ff       	call   583 <write>
        ap++;
 844:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 848:	83 c4 10             	add    $0x10,%esp
      state = 0;
 84b:	31 c9                	xor    %ecx,%ecx
 84d:	e9 e0 fe ff ff       	jmp    732 <printf+0x52>
 852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 858:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 85b:	83 ec 04             	sub    $0x4,%esp
 85e:	e9 2a ff ff ff       	jmp    78d <printf+0xad>
 863:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 867:	90                   	nop
          s = "(null)";
 868:	ba 0a 0c 00 00       	mov    $0xc0a,%edx
        while(*s != 0){
 86d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 870:	b8 28 00 00 00       	mov    $0x28,%eax
 875:	89 d3                	mov    %edx,%ebx
 877:	e9 74 ff ff ff       	jmp    7f0 <printf+0x110>
 87c:	66 90                	xchg   %ax,%ax
 87e:	66 90                	xchg   %ax,%ax

00000880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 880:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 881:	a1 b0 0f 00 00       	mov    0xfb0,%eax
{
 886:	89 e5                	mov    %esp,%ebp
 888:	57                   	push   %edi
 889:	56                   	push   %esi
 88a:	53                   	push   %ebx
 88b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 88e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 891:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 898:	89 c2                	mov    %eax,%edx
 89a:	8b 00                	mov    (%eax),%eax
 89c:	39 ca                	cmp    %ecx,%edx
 89e:	73 30                	jae    8d0 <free+0x50>
 8a0:	39 c1                	cmp    %eax,%ecx
 8a2:	72 04                	jb     8a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a4:	39 c2                	cmp    %eax,%edx
 8a6:	72 f0                	jb     898 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ae:	39 f8                	cmp    %edi,%eax
 8b0:	74 30                	je     8e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8b5:	8b 42 04             	mov    0x4(%edx),%eax
 8b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8bb:	39 f1                	cmp    %esi,%ecx
 8bd:	74 3a                	je     8f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8c1:	5b                   	pop    %ebx
  freep = p;
 8c2:	89 15 b0 0f 00 00    	mov    %edx,0xfb0
}
 8c8:	5e                   	pop    %esi
 8c9:	5f                   	pop    %edi
 8ca:	5d                   	pop    %ebp
 8cb:	c3                   	ret    
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d0:	39 c2                	cmp    %eax,%edx
 8d2:	72 c4                	jb     898 <free+0x18>
 8d4:	39 c1                	cmp    %eax,%ecx
 8d6:	73 c0                	jae    898 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 8d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8de:	39 f8                	cmp    %edi,%eax
 8e0:	75 d0                	jne    8b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 8e2:	03 70 04             	add    0x4(%eax),%esi
 8e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e8:	8b 02                	mov    (%edx),%eax
 8ea:	8b 00                	mov    (%eax),%eax
 8ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ef:	8b 42 04             	mov    0x4(%edx),%eax
 8f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8f5:	39 f1                	cmp    %esi,%ecx
 8f7:	75 c6                	jne    8bf <free+0x3f>
    p->s.size += bp->s.size;
 8f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 8fc:	89 15 b0 0f 00 00    	mov    %edx,0xfb0
    p->s.size += bp->s.size;
 902:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 905:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 908:	89 0a                	mov    %ecx,(%edx)
}
 90a:	5b                   	pop    %ebx
 90b:	5e                   	pop    %esi
 90c:	5f                   	pop    %edi
 90d:	5d                   	pop    %ebp
 90e:	c3                   	ret    
 90f:	90                   	nop

00000910 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 919:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 91c:	8b 3d b0 0f 00 00    	mov    0xfb0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 922:	8d 70 07             	lea    0x7(%eax),%esi
 925:	c1 ee 03             	shr    $0x3,%esi
 928:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 92b:	85 ff                	test   %edi,%edi
 92d:	0f 84 9d 00 00 00    	je     9d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 933:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 935:	8b 4a 04             	mov    0x4(%edx),%ecx
 938:	39 f1                	cmp    %esi,%ecx
 93a:	73 6a                	jae    9a6 <malloc+0x96>
 93c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 941:	39 de                	cmp    %ebx,%esi
 943:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 946:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 94d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 950:	eb 17                	jmp    969 <malloc+0x59>
 952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 958:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 95a:	8b 48 04             	mov    0x4(%eax),%ecx
 95d:	39 f1                	cmp    %esi,%ecx
 95f:	73 4f                	jae    9b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 961:	8b 3d b0 0f 00 00    	mov    0xfb0,%edi
 967:	89 c2                	mov    %eax,%edx
 969:	39 d7                	cmp    %edx,%edi
 96b:	75 eb                	jne    958 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 96d:	83 ec 0c             	sub    $0xc,%esp
 970:	ff 75 e4             	push   -0x1c(%ebp)
 973:	e8 73 fc ff ff       	call   5eb <sbrk>
  if(p == (char*)-1)
 978:	83 c4 10             	add    $0x10,%esp
 97b:	83 f8 ff             	cmp    $0xffffffff,%eax
 97e:	74 1c                	je     99c <malloc+0x8c>
  hp->s.size = nu;
 980:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 983:	83 ec 0c             	sub    $0xc,%esp
 986:	83 c0 08             	add    $0x8,%eax
 989:	50                   	push   %eax
 98a:	e8 f1 fe ff ff       	call   880 <free>
  return freep;
 98f:	8b 15 b0 0f 00 00    	mov    0xfb0,%edx
      if((p = morecore(nunits)) == 0)
 995:	83 c4 10             	add    $0x10,%esp
 998:	85 d2                	test   %edx,%edx
 99a:	75 bc                	jne    958 <malloc+0x48>
        return 0;
  }
}
 99c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 99f:	31 c0                	xor    %eax,%eax
}
 9a1:	5b                   	pop    %ebx
 9a2:	5e                   	pop    %esi
 9a3:	5f                   	pop    %edi
 9a4:	5d                   	pop    %ebp
 9a5:	c3                   	ret    
    if(p->s.size >= nunits){
 9a6:	89 d0                	mov    %edx,%eax
 9a8:	89 fa                	mov    %edi,%edx
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9b0:	39 ce                	cmp    %ecx,%esi
 9b2:	74 4c                	je     a00 <malloc+0xf0>
        p->s.size -= nunits;
 9b4:	29 f1                	sub    %esi,%ecx
 9b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9bf:	89 15 b0 0f 00 00    	mov    %edx,0xfb0
}
 9c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9c8:	83 c0 08             	add    $0x8,%eax
}
 9cb:	5b                   	pop    %ebx
 9cc:	5e                   	pop    %esi
 9cd:	5f                   	pop    %edi
 9ce:	5d                   	pop    %ebp
 9cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 9d0:	c7 05 b0 0f 00 00 b4 	movl   $0xfb4,0xfb0
 9d7:	0f 00 00 
    base.s.size = 0;
 9da:	bf b4 0f 00 00       	mov    $0xfb4,%edi
    base.s.ptr = freep = prevp = &base;
 9df:	c7 05 b4 0f 00 00 b4 	movl   $0xfb4,0xfb4
 9e6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 9eb:	c7 05 b8 0f 00 00 00 	movl   $0x0,0xfb8
 9f2:	00 00 00 
    if(p->s.size >= nunits){
 9f5:	e9 42 ff ff ff       	jmp    93c <malloc+0x2c>
 9fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a00:	8b 08                	mov    (%eax),%ecx
 a02:	89 0a                	mov    %ecx,(%edx)
 a04:	eb b9                	jmp    9bf <malloc+0xaf>
