
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    }
    close(fd);
    return N_PAGES * PGSIZE;
}

int main() {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx

    // validate initial state
    struct wmapinfo winfo1;
    get_n_validate_wmap_info(&winfo1, 0); // no maps exist
    struct pgdirinfo pinfo1;
    get_n_validate_pgdirinfo(&pinfo1);
   f:	8d 9d ec fc ff ff    	lea    -0x314(%ebp),%ebx
int main() {
  15:	81 ec 64 05 00 00    	sub    $0x564,%esp
    printf(1, "\n\n%s\n", test_name);
  1b:	ff 35 48 14 00 00    	push   0x1448
  21:	68 75 0c 00 00       	push   $0xc75
  26:	6a 01                	push   $0x1
  28:	e8 f3 08 00 00       	call   920 <printf>
    get_n_validate_wmap_info(&winfo1, 0); // no maps exist
  2d:	58                   	pop    %eax
  2e:	8d 85 a0 fa ff ff    	lea    -0x560(%ebp),%eax
  34:	5a                   	pop    %edx
  35:	6a 00                	push   $0x0
  37:	50                   	push   %eax
  38:	e8 e3 01 00 00       	call   220 <get_n_validate_wmap_info>
    get_n_validate_pgdirinfo(&pinfo1);
  3d:	89 1c 24             	mov    %ebx,(%esp)
  40:	e8 2b 02 00 00       	call   270 <get_n_validate_pgdirinfo>
    no_mmaps_in_pgdir(&pinfo1); // no maps in the mmap range in pgdir
  45:	89 1c 24             	mov    %ebx,(%esp)
  48:	e8 b3 02 00 00       	call   300 <no_mmaps_in_pgdir>
    printf(1, "Initially 0 maps. \tOkay.\n");
  4d:	59                   	pop    %ecx
  4e:	5b                   	pop    %ebx
  4f:	68 7b 0c 00 00       	push   $0xc7b
  54:	6a 01                	push   $0x1
  56:	e8 c5 08 00 00       	call   920 <printf>
    //
    int N_PAGES = 3;
    int fixed_anon = MAP_FIXED | MAP_ANONYMOUS | MAP_PRIVATE;
    uint addr = MMAPBASE;
    int length = PGSIZE * N_PAGES;
    uint map = wmap(addr, length, fixed_anon, 0);
  5b:	6a 00                	push   $0x0
  5d:	6a 0d                	push   $0xd
  5f:	68 00 30 00 00       	push   $0x3000
  64:	68 00 00 00 60       	push   $0x60000000
  69:	e8 d5 07 00 00       	call   843 <wmap>
    if (map != addr) {
  6e:	83 c4 20             	add    $0x20,%esp
  71:	3d 00 00 00 60       	cmp    $0x60000000,%eax
  76:	74 17                	je     8f <main+0x8f>
        printf(1, "Cause: Expected 0x%x, but `wmap()` returned %d\n", addr, map);
  78:	50                   	push   %eax
  79:	68 00 00 00 60       	push   $0x60000000
  7e:	68 04 0f 00 00       	push   $0xf04
  83:	6a 01                	push   $0x1
  85:	e8 96 08 00 00       	call   920 <printf>
        failed();
  8a:	e8 71 01 00 00       	call   200 <failed>
    }
    // validate mid state
    struct wmapinfo winfo2;
    get_n_validate_wmap_info(&winfo2, 1); // one map exists
  8f:	8d 9d 64 fb ff ff    	lea    -0x49c(%ebp),%ebx
  95:	51                   	push   %ecx
  96:	51                   	push   %ecx
  97:	6a 01                	push   $0x1
  99:	53                   	push   %ebx
  9a:	e8 81 01 00 00       	call   220 <get_n_validate_wmap_info>
    printf(1, "Map placed at 0x%x. \tOkay.\n", map);
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 00 00 00 60       	push   $0x60000000
  a7:	68 95 0c 00 00       	push   $0xc95
  ac:	6a 01                	push   $0x1
  ae:	e8 6d 08 00 00       	call   920 <printf>

    //
    // checks for lazy allocation
    //
    map_allocated(&winfo2, map, length, 0); // no pages loaded yet
  b3:	6a 00                	push   $0x0
  b5:	68 00 30 00 00       	push   $0x3000
  ba:	68 00 00 00 60       	push   $0x60000000
  bf:	53                   	push   %ebx
    printf(1, "No page allocated yet. \tOkay.\n");
    struct pgdirinfo pinfo2;
    get_n_validate_pgdirinfo(&pinfo2);
  c0:	8d 9d f0 fd ff ff    	lea    -0x210(%ebp),%ebx
    map_allocated(&winfo2, map, length, 0); // no pages loaded yet
  c6:	e8 f5 02 00 00       	call   3c0 <map_allocated>
    printf(1, "No page allocated yet. \tOkay.\n");
  cb:	83 c4 18             	add    $0x18,%esp
  ce:	68 34 0f 00 00       	push   $0xf34
  d3:	6a 01                	push   $0x1
  d5:	e8 46 08 00 00       	call   920 <printf>
    get_n_validate_pgdirinfo(&pinfo2);
  da:	89 1c 24             	mov    %ebx,(%esp)
  dd:	e8 8e 01 00 00       	call   270 <get_n_validate_pgdirinfo>
    for (int i = 0; i < N_PAGES; i++) {
        va_exists(&pinfo2, map + PGSIZE * i, FALSE); // no page is mapped yet in pgdir
  e2:	83 c4 0c             	add    $0xc,%esp
  e5:	6a 00                	push   $0x0
  e7:	68 00 00 00 60       	push   $0x60000000
  ec:	53                   	push   %ebx
  ed:	e8 5e 02 00 00       	call   350 <va_exists>
  f2:	83 c4 0c             	add    $0xc,%esp
  f5:	6a 00                	push   $0x0
  f7:	68 00 10 00 60       	push   $0x60001000
  fc:	53                   	push   %ebx
  fd:	e8 4e 02 00 00       	call   350 <va_exists>
 102:	83 c4 0c             	add    $0xc,%esp
 105:	6a 00                	push   $0x0
 107:	68 00 20 00 60       	push   $0x60002000
 10c:	53                   	push   %ebx
 10d:	e8 3e 02 00 00       	call   350 <va_exists>
 112:	5b                   	pop    %ebx
 113:	58                   	pop    %eax
    }
    printf(1, "No page have entry in pgdir yet. \tOkay.\n");
 114:	68 54 0f 00 00       	push   $0xf54
 119:	6a 01                	push   $0x1
 11b:	e8 00 08 00 00       	call   920 <printf>
 120:	83 c4 10             	add    $0x10,%esp

    //
    // 2. read from the second page of the mapping, causing page fault
    //
    char *arr = (char *)map;
    for (int i = 0; i < PGSIZE; i++) {
 123:	31 c0                	xor    %eax,%eax
 125:	eb 13                	jmp    13a <main+0x13a>
 127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12e:	66 90                	xchg   %ax,%ax
 130:	83 c0 01             	add    $0x1,%eax
 133:	3d 00 10 00 00       	cmp    $0x1000,%eax
 138:	74 23                	je     15d <main+0x15d>
        if (arr[PGSIZE + i] != 0) {
 13a:	80 b8 00 10 00 60 00 	cmpb   $0x0,0x60001000(%eax)
 141:	74 ed                	je     130 <main+0x130>
            printf(1, "Cause: Expected the page to be zero initialized\n", arr[i]);
 143:	52                   	push   %edx
 144:	0f be 80 00 00 00 60 	movsbl 0x60000000(%eax),%eax
 14b:	50                   	push   %eax
 14c:	68 80 0f 00 00       	push   $0xf80
 151:	6a 01                	push   $0x1
 153:	e8 c8 07 00 00       	call   920 <printf>
            failed();
 158:	e8 a3 00 00 00       	call   200 <failed>
        }
    }
    printf(1, "Read from the second page. \tOkay.\n");
 15d:	50                   	push   %eax

    // validate final state
    struct wmapinfo winfo3;
    get_n_validate_wmap_info(&winfo3, 1); // one map exists
 15e:	8d 9d 28 fc ff ff    	lea    -0x3d8(%ebp),%ebx
    printf(1, "Read from the second page. \tOkay.\n");
 164:	50                   	push   %eax
 165:	68 b4 0f 00 00       	push   $0xfb4
 16a:	6a 01                	push   $0x1
 16c:	e8 af 07 00 00       	call   920 <printf>
    get_n_validate_wmap_info(&winfo3, 1); // one map exists
 171:	5a                   	pop    %edx
 172:	59                   	pop    %ecx
 173:	6a 01                	push   $0x1
 175:	53                   	push   %ebx
 176:	e8 a5 00 00 00       	call   220 <get_n_validate_wmap_info>

    //
    // checks for lazy allocation
    //
    map_allocated(&winfo3, map, length, 1); // 1 page loaded
 17b:	6a 01                	push   $0x1
 17d:	68 00 30 00 00       	push   $0x3000
 182:	68 00 00 00 60       	push   $0x60000000
 187:	53                   	push   %ebx
    printf(1, "Allocated 1 page. \tOkay.\n");
    struct pgdirinfo pinfo3;
    get_n_validate_pgdirinfo(&pinfo3);
 188:	8d 9d f4 fe ff ff    	lea    -0x10c(%ebp),%ebx
    map_allocated(&winfo3, map, length, 1); // 1 page loaded
 18e:	e8 2d 02 00 00       	call   3c0 <map_allocated>
    printf(1, "Allocated 1 page. \tOkay.\n");
 193:	83 c4 18             	add    $0x18,%esp
 196:	68 b1 0c 00 00       	push   $0xcb1
 19b:	6a 01                	push   $0x1
 19d:	e8 7e 07 00 00       	call   920 <printf>
    get_n_validate_pgdirinfo(&pinfo3);
 1a2:	89 1c 24             	mov    %ebx,(%esp)
 1a5:	e8 c6 00 00 00       	call   270 <get_n_validate_pgdirinfo>
    va_exists(&pinfo3, map, FALSE);         // first page is not allocated
 1aa:	83 c4 0c             	add    $0xc,%esp
 1ad:	6a 00                	push   $0x0
 1af:	68 00 00 00 60       	push   $0x60000000
 1b4:	53                   	push   %ebx
 1b5:	e8 96 01 00 00       	call   350 <va_exists>
 1ba:	83 c4 0c             	add    $0xc,%esp
    va_exists(&pinfo3, map + PGSIZE, TRUE); // second page is allocatedˇ
 1bd:	6a 01                	push   $0x1
 1bf:	68 00 10 00 60       	push   $0x60001000
 1c4:	53                   	push   %ebx
 1c5:	e8 86 01 00 00       	call   350 <va_exists>
 1ca:	5b                   	pop    %ebx
 1cb:	58                   	pop    %eax
    printf(1, "Allocated page have entry in pgdir. \tOkay.\n");
 1cc:	68 d8 0f 00 00       	push   $0xfd8
 1d1:	6a 01                	push   $0x1
 1d3:	e8 48 07 00 00       	call   920 <printf>

    // test ends
    success();
 1d8:	e8 03 00 00 00       	call   1e0 <success>
 1dd:	66 90                	xchg   %ax,%ax
 1df:	90                   	nop

000001e0 <success>:
void success() {
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\nWMMAP\t SUCCESS\n\n");
 1e6:	68 48 0c 00 00       	push   $0xc48
 1eb:	6a 01                	push   $0x1
 1ed:	e8 2e 07 00 00       	call   920 <printf>
    exit();
 1f2:	e8 ac 05 00 00       	call   7a3 <exit>
 1f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fe:	66 90                	xchg   %ax,%ax

00000200 <failed>:
void failed() {
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\nWMMAP\t FAILED\n\n");
 206:	68 5a 0c 00 00       	push   $0xc5a
 20b:	6a 01                	push   $0x1
 20d:	e8 0e 07 00 00       	call   920 <printf>
    exit();
 212:	e8 8c 05 00 00       	call   7a3 <exit>
 217:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21e:	66 90                	xchg   %ax,%ax

00000220 <get_n_validate_wmap_info>:
void get_n_validate_wmap_info(struct wmapinfo *info, int expected_total_mmaps) {
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	83 ec 10             	sub    $0x10,%esp
 227:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int ret = getwmapinfo(info);
 22a:	53                   	push   %ebx
 22b:	e8 33 06 00 00       	call   863 <getwmapinfo>
    if (ret < 0) {
 230:	83 c4 10             	add    $0x10,%esp
 233:	85 c0                	test   %eax,%eax
 235:	78 0c                	js     243 <get_n_validate_wmap_info+0x23>
    if (info->total_mmaps != expected_total_mmaps) {
 237:	8b 03                	mov    (%ebx),%eax
 239:	3b 45 0c             	cmp    0xc(%ebp),%eax
 23c:	75 18                	jne    256 <get_n_validate_wmap_info+0x36>
}
 23e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 241:	c9                   	leave  
 242:	c3                   	ret    
        printf(1, "Cause: `getwmapinfo()` returned %d\n", ret);
 243:	52                   	push   %edx
 244:	50                   	push   %eax
 245:	68 d4 0c 00 00       	push   $0xcd4
 24a:	6a 01                	push   $0x1
 24c:	e8 cf 06 00 00       	call   920 <printf>
        failed();
 251:	e8 aa ff ff ff       	call   200 <failed>
        printf(1, "Cause: expected %d maps, but found %d\n", expected_total_mmaps, info->total_mmaps);
 256:	50                   	push   %eax
 257:	ff 75 0c             	push   0xc(%ebp)
 25a:	68 f8 0c 00 00       	push   $0xcf8
 25f:	6a 01                	push   $0x1
 261:	e8 ba 06 00 00       	call   920 <printf>
        failed();
 266:	e8 95 ff ff ff       	call   200 <failed>
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <get_n_validate_pgdirinfo>:
void get_n_validate_pgdirinfo(struct pgdirinfo *info) {
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	83 ec 10             	sub    $0x10,%esp
 277:	8b 5d 08             	mov    0x8(%ebp),%ebx
    info->n_upages = -1;
 27a:	c7 03 ff ff ff ff    	movl   $0xffffffff,(%ebx)
    int ret = getpgdirinfo(info);
 280:	53                   	push   %ebx
 281:	e8 d5 05 00 00       	call   85b <getpgdirinfo>
    if (ret < 0) {
 286:	83 c4 10             	add    $0x10,%esp
 289:	85 c0                	test   %eax,%eax
 28b:	78 51                	js     2de <get_n_validate_pgdirinfo+0x6e>
    if (info->n_upages < 1) {
 28d:	8b 0b                	mov    (%ebx),%ecx
 28f:	85 c9                	test   %ecx,%ecx
 291:	74 37                	je     2ca <get_n_validate_pgdirinfo+0x5a>
    for (int i = 0; i < info->n_upages; i++) {
 293:	31 c0                	xor    %eax,%eax
 295:	8d 76 00             	lea    0x0(%esi),%esi
        if (info->va[i] < 0 || info->va[i] >= KERNBASE) {
 298:	8b 54 83 04          	mov    0x4(%ebx,%eax,4),%edx
 29c:	85 d2                	test   %edx,%edx
 29e:	78 0c                	js     2ac <get_n_validate_pgdirinfo+0x3c>
    for (int i = 0; i < info->n_upages; i++) {
 2a0:	83 c0 01             	add    $0x1,%eax
 2a3:	39 c1                	cmp    %eax,%ecx
 2a5:	75 f1                	jne    298 <get_n_validate_pgdirinfo+0x28>
}
 2a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2aa:	c9                   	leave  
 2ab:	c3                   	ret    
            printf(1, "Cause: `info.va[%d]` is 0x%x. It should be within [0, 0x%x)\n", i, info->va[i], KERNBASE);
 2ac:	83 ec 0c             	sub    $0xc,%esp
 2af:	68 00 00 00 80       	push   $0x80000000
 2b4:	52                   	push   %edx
 2b5:	50                   	push   %eax
 2b6:	68 74 0d 00 00       	push   $0xd74
 2bb:	6a 01                	push   $0x1
 2bd:	e8 5e 06 00 00       	call   920 <printf>
            failed();
 2c2:	83 c4 20             	add    $0x20,%esp
 2c5:	e8 36 ff ff ff       	call   200 <failed>
        printf(1, "Cause: At least one user page expected.\n", info->n_upages);
 2ca:	50                   	push   %eax
 2cb:	6a 00                	push   $0x0
 2cd:	68 48 0d 00 00       	push   $0xd48
 2d2:	6a 01                	push   $0x1
 2d4:	e8 47 06 00 00       	call   920 <printf>
        failed();
 2d9:	e8 22 ff ff ff       	call   200 <failed>
        printf(1, "Cause: `getpgdirinfo()` returned %d\n", ret);
 2de:	52                   	push   %edx
 2df:	50                   	push   %eax
 2e0:	68 20 0d 00 00       	push   $0xd20
 2e5:	6a 01                	push   $0x1
 2e7:	e8 34 06 00 00       	call   920 <printf>
        failed();
 2ec:	e8 0f ff ff ff       	call   200 <failed>
 2f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop

00000300 <no_mmaps_in_pgdir>:
void no_mmaps_in_pgdir(struct pgdirinfo *info) {
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
 305:	8b 5d 08             	mov    0x8(%ebp),%ebx
    for (int i = 0; i < info->n_upages; i++) {
 308:	8b 33                	mov    (%ebx),%esi
 30a:	85 f6                	test   %esi,%esi
 30c:	74 1b                	je     329 <no_mmaps_in_pgdir+0x29>
 30e:	31 c0                	xor    %eax,%eax
        if (info->va[i] >= MMAPBASE && info->va[i] < KERNBASE) {
 310:	8b 54 83 04          	mov    0x4(%ebx,%eax,4),%edx
 314:	8d 8a 00 00 00 a0    	lea    -0x60000000(%edx),%ecx
 31a:	81 f9 ff ff ff 1f    	cmp    $0x1fffffff,%ecx
 320:	76 0e                	jbe    330 <no_mmaps_in_pgdir+0x30>
    for (int i = 0; i < info->n_upages; i++) {
 322:	83 c0 01             	add    $0x1,%eax
 325:	39 f0                	cmp    %esi,%eax
 327:	75 e7                	jne    310 <no_mmaps_in_pgdir+0x10>
}
 329:	8d 65 f8             	lea    -0x8(%ebp),%esp
 32c:	5b                   	pop    %ebx
 32d:	5e                   	pop    %esi
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    
            printf(1, "Cause: Virt.Addr. 0x%x should not exist in the list of user pages\n", info->va[i]);
 330:	83 ec 04             	sub    $0x4,%esp
 333:	52                   	push   %edx
 334:	68 b4 0d 00 00       	push   $0xdb4
 339:	6a 01                	push   $0x1
 33b:	e8 e0 05 00 00       	call   920 <printf>
            failed();
 340:	e8 bb fe ff ff       	call   200 <failed>
 345:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000350 <va_exists>:
void va_exists(struct pgdirinfo *info, uint va, int expected) {
 350:	55                   	push   %ebp
    for (int i = 0; i < info->n_upages; i++) {
 351:	31 c0                	xor    %eax,%eax
void va_exists(struct pgdirinfo *info, uint va, int expected) {
 353:	89 e5                	mov    %esp,%ebp
 355:	53                   	push   %ebx
 356:	83 ec 04             	sub    $0x4,%esp
 359:	8b 55 08             	mov    0x8(%ebp),%edx
 35c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    for (int i = 0; i < info->n_upages; i++) {
 35f:	8b 0a                	mov    (%edx),%ecx
 361:	85 c9                	test   %ecx,%ecx
 363:	75 12                	jne    377 <va_exists+0x27>
 365:	eb 1b                	jmp    382 <va_exists+0x32>
 367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36e:	66 90                	xchg   %ax,%ax
 370:	83 c0 01             	add    $0x1,%eax
 373:	39 c1                	cmp    %eax,%ecx
 375:	74 19                	je     390 <va_exists+0x40>
        if (info->va[i] == va) {
 377:	39 5c 82 04          	cmp    %ebx,0x4(%edx,%eax,4)
 37b:	75 f3                	jne    370 <va_exists+0x20>
            found = 1;
 37d:	b8 01 00 00 00       	mov    $0x1,%eax
    if (found != expected) {
 382:	3b 45 10             	cmp    0x10(%ebp),%eax
 385:	75 0d                	jne    394 <va_exists+0x44>
}
 387:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38a:	c9                   	leave  
 38b:	c3                   	ret    
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int found = 0;
 390:	31 c0                	xor    %eax,%eax
 392:	eb ee                	jmp    382 <va_exists+0x32>
        printf(1, "Cause: expected Virt.Addr. 0x%x to %s in the list of user pages\n", va, expected ? "exist" : "not exist");
 394:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 398:	ba 6b 0c 00 00       	mov    $0xc6b,%edx
 39d:	b8 6f 0c 00 00       	mov    $0xc6f,%eax
 3a2:	0f 44 c2             	cmove  %edx,%eax
 3a5:	50                   	push   %eax
 3a6:	53                   	push   %ebx
 3a7:	68 f8 0d 00 00       	push   $0xdf8
 3ac:	6a 01                	push   $0x1
 3ae:	e8 6d 05 00 00       	call   920 <printf>
        failed();
 3b3:	e8 48 fe ff ff       	call   200 <failed>
 3b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop

000003c0 <map_allocated>:
void map_allocated(struct wmapinfo *info, uint addr, int length, int n_loaded_pages) {
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	8b 55 08             	mov    0x8(%ebp),%edx
 3c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3ca:	53                   	push   %ebx
 3cb:	8b 75 10             	mov    0x10(%ebp),%esi
    for (int i = 0; i < info->total_mmaps; i++) {
 3ce:	8b 1a                	mov    (%edx),%ebx
 3d0:	85 db                	test   %ebx,%ebx
 3d2:	7e 32                	jle    406 <map_allocated+0x46>
 3d4:	31 c0                	xor    %eax,%eax
 3d6:	eb 0f                	jmp    3e7 <map_allocated+0x27>
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop
 3e0:	83 c0 01             	add    $0x1,%eax
 3e3:	39 d8                	cmp    %ebx,%eax
 3e5:	74 1f                	je     406 <map_allocated+0x46>
        if (info->addr[i] == addr && info->length[i] == length) {
 3e7:	39 4c 82 04          	cmp    %ecx,0x4(%edx,%eax,4)
 3eb:	75 f3                	jne    3e0 <map_allocated+0x20>
 3ed:	39 74 82 44          	cmp    %esi,0x44(%edx,%eax,4)
 3f1:	75 ed                	jne    3e0 <map_allocated+0x20>
            if (info->n_loaded_pages[i] != n_loaded_pages) {
 3f3:	8b 84 82 84 00 00 00 	mov    0x84(%edx,%eax,4),%eax
 3fa:	3b 45 14             	cmp    0x14(%ebp),%eax
 3fd:	75 1a                	jne    419 <map_allocated+0x59>
}
 3ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
 402:	5b                   	pop    %ebx
 403:	5e                   	pop    %esi
 404:	5d                   	pop    %ebp
 405:	c3                   	ret    
        printf(1, "Cause: expected 0x%x with length %d to exist in the list of maps\n", addr, length);
 406:	56                   	push   %esi
 407:	51                   	push   %ecx
 408:	68 74 0e 00 00       	push   $0xe74
 40d:	6a 01                	push   $0x1
 40f:	e8 0c 05 00 00       	call   920 <printf>
        failed();
 414:	e8 e7 fd ff ff       	call   200 <failed>
                printf(1, "Cause: expected %d pages to be loaded, but found %d\n", n_loaded_pages, info->n_loaded_pages[i]);
 419:	50                   	push   %eax
 41a:	ff 75 14             	push   0x14(%ebp)
 41d:	68 3c 0e 00 00       	push   $0xe3c
 422:	6a 01                	push   $0x1
 424:	e8 f7 04 00 00       	call   920 <printf>
                failed();
 429:	e8 d2 fd ff ff       	call   200 <failed>
 42e:	66 90                	xchg   %ax,%ax

00000430 <create_big_file>:
int create_big_file(char *filename, int N_PAGES) {
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 20             	sub    $0x20,%esp
 439:	8b 5d 08             	mov    0x8(%ebp),%ebx
    printf(1, "\n\n%s\n", test_name);
 43c:	ff 35 48 14 00 00    	push   0x1448
 442:	68 75 0c 00 00       	push   $0xc75
 447:	6a 01                	push   $0x1
 449:	e8 d2 04 00 00       	call   920 <printf>
    char buff[bufflen + 1];
 44e:	83 c4 10             	add    $0x10,%esp
 451:	89 e0                	mov    %esp,%eax
 453:	39 c4                	cmp    %eax,%esp
 455:	74 12                	je     469 <create_big_file+0x39>
 457:	81 ec 00 10 00 00    	sub    $0x1000,%esp
 45d:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
 464:	00 
 465:	39 c4                	cmp    %eax,%esp
 467:	75 ee                	jne    457 <create_big_file+0x27>
 469:	81 ec 10 02 00 00    	sub    $0x210,%esp
 46f:	83 8c 24 0c 02 00 00 	orl    $0x0,0x20c(%esp)
 476:	00 
 477:	89 e6                	mov    %esp,%esi
    int fd = open(filename, O_CREATE | O_RDWR);
 479:	83 ec 08             	sub    $0x8,%esp
 47c:	68 02 02 00 00       	push   $0x202
 481:	53                   	push   %ebx
 482:	e8 5c 03 00 00       	call   7e3 <open>
    if (fd < 0) {
 487:	89 f4                	mov    %esi,%esp
    int fd = open(filename, O_CREATE | O_RDWR);
 489:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if (fd < 0) {
 48c:	85 c0                	test   %eax,%eax
 48e:	0f 88 9f 00 00 00    	js     533 <create_big_file+0x103>
    for (int i = 0; i < N_PAGES; i++) {
 494:	8b 55 0c             	mov    0xc(%ebp),%edx
 497:	8d 9e 00 02 00 00    	lea    0x200(%esi),%ebx
 49d:	89 f7                	mov    %esi,%edi
 49f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 4a6:	89 de                	mov    %ebx,%esi
 4a8:	85 d2                	test   %edx,%edx
 4aa:	7e 59                	jle    505 <create_big_file+0xd5>
 4ac:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
        for (int k = 0; k < m; k++) {
 4b0:	31 d2                	xor    %edx,%edx
 4b2:	8d 58 61             	lea    0x61(%eax),%ebx
            for (int j = 0; j < bufflen; j++) {
 4b5:	89 f8                	mov    %edi,%eax
 4b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4be:	66 90                	xchg   %ax,%ax
                buff[j] = c;
 4c0:	88 18                	mov    %bl,(%eax)
            for (int j = 0; j < bufflen; j++) {
 4c2:	83 c0 01             	add    $0x1,%eax
 4c5:	39 f0                	cmp    %esi,%eax
 4c7:	75 f7                	jne    4c0 <create_big_file+0x90>
            if (write(fd, buff, bufflen) != bufflen) {
 4c9:	83 ec 04             	sub    $0x4,%esp
            buff[bufflen] = '\0';
 4cc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 4cf:	c6 87 00 02 00 00 00 	movb   $0x0,0x200(%edi)
            if (write(fd, buff, bufflen) != bufflen) {
 4d6:	68 00 02 00 00       	push   $0x200
 4db:	57                   	push   %edi
 4dc:	ff 75 e0             	push   -0x20(%ebp)
 4df:	e8 df 02 00 00       	call   7c3 <write>
 4e4:	83 c4 10             	add    $0x10,%esp
 4e7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4ea:	3d 00 02 00 00       	cmp    $0x200,%eax
 4ef:	75 2d                	jne    51e <create_big_file+0xee>
        for (int k = 0; k < m; k++) {
 4f1:	83 c2 01             	add    $0x1,%edx
 4f4:	83 fa 08             	cmp    $0x8,%edx
 4f7:	75 bc                	jne    4b5 <create_big_file+0x85>
    for (int i = 0; i < N_PAGES; i++) {
 4f9:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
 4fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
 500:	39 45 0c             	cmp    %eax,0xc(%ebp)
 503:	75 a7                	jne    4ac <create_big_file+0x7c>
    close(fd);
 505:	83 ec 0c             	sub    $0xc,%esp
 508:	ff 75 e0             	push   -0x20(%ebp)
 50b:	e8 bb 02 00 00       	call   7cb <close>
    return N_PAGES * PGSIZE;
 510:	8b 45 0c             	mov    0xc(%ebp),%eax
}
 513:	8d 65 f4             	lea    -0xc(%ebp),%esp
 516:	5b                   	pop    %ebx
 517:	5e                   	pop    %esi
    return N_PAGES * PGSIZE;
 518:	c1 e0 0c             	shl    $0xc,%eax
}
 51b:	5f                   	pop    %edi
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret    
                printf(1, "Error: Write to file FAILED (%d, %d)\n", i, k);
 51e:	52                   	push   %edx
 51f:	ff 75 dc             	push   -0x24(%ebp)
 522:	68 dc 0e 00 00       	push   $0xedc
 527:	6a 01                	push   $0x1
 529:	e8 f2 03 00 00       	call   920 <printf>
                failed();
 52e:	e8 cd fc ff ff       	call   200 <failed>
        printf(1, "\tCause:\tFailed to create file %s\n", filename);
 533:	50                   	push   %eax
 534:	53                   	push   %ebx
 535:	68 b8 0e 00 00       	push   $0xeb8
 53a:	6a 01                	push   $0x1
 53c:	e8 df 03 00 00       	call   920 <printf>
        failed();
 541:	e8 ba fc ff ff       	call   200 <failed>
 546:	66 90                	xchg   %ax,%ax
 548:	66 90                	xchg   %ax,%ax
 54a:	66 90                	xchg   %ax,%ax
 54c:	66 90                	xchg   %ax,%ax
 54e:	66 90                	xchg   %ax,%ax

00000550 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 550:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 551:	31 c0                	xor    %eax,%eax
{
 553:	89 e5                	mov    %esp,%ebp
 555:	53                   	push   %ebx
 556:	8b 4d 08             	mov    0x8(%ebp),%ecx
 559:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 560:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 564:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 567:	83 c0 01             	add    $0x1,%eax
 56a:	84 d2                	test   %dl,%dl
 56c:	75 f2                	jne    560 <strcpy+0x10>
    ;
  return os;
}
 56e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 571:	89 c8                	mov    %ecx,%eax
 573:	c9                   	leave  
 574:	c3                   	ret    
 575:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000580 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	8b 55 08             	mov    0x8(%ebp),%edx
 587:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 58a:	0f b6 02             	movzbl (%edx),%eax
 58d:	84 c0                	test   %al,%al
 58f:	75 17                	jne    5a8 <strcmp+0x28>
 591:	eb 3a                	jmp    5cd <strcmp+0x4d>
 593:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 597:	90                   	nop
 598:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 59c:	83 c2 01             	add    $0x1,%edx
 59f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 5a2:	84 c0                	test   %al,%al
 5a4:	74 1a                	je     5c0 <strcmp+0x40>
    p++, q++;
 5a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 5a8:	0f b6 19             	movzbl (%ecx),%ebx
 5ab:	38 c3                	cmp    %al,%bl
 5ad:	74 e9                	je     598 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 5af:	29 d8                	sub    %ebx,%eax
}
 5b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5b4:	c9                   	leave  
 5b5:	c3                   	ret    
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 5c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 5c4:	31 c0                	xor    %eax,%eax
 5c6:	29 d8                	sub    %ebx,%eax
}
 5c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5cb:	c9                   	leave  
 5cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 5cd:	0f b6 19             	movzbl (%ecx),%ebx
 5d0:	31 c0                	xor    %eax,%eax
 5d2:	eb db                	jmp    5af <strcmp+0x2f>
 5d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <strlen>:

uint
strlen(const char *s)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 5e6:	80 3a 00             	cmpb   $0x0,(%edx)
 5e9:	74 15                	je     600 <strlen+0x20>
 5eb:	31 c0                	xor    %eax,%eax
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
 5f0:	83 c0 01             	add    $0x1,%eax
 5f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 5f7:	89 c1                	mov    %eax,%ecx
 5f9:	75 f5                	jne    5f0 <strlen+0x10>
    ;
  return n;
}
 5fb:	89 c8                	mov    %ecx,%eax
 5fd:	5d                   	pop    %ebp
 5fe:	c3                   	ret    
 5ff:	90                   	nop
  for(n = 0; s[n]; n++)
 600:	31 c9                	xor    %ecx,%ecx
}
 602:	5d                   	pop    %ebp
 603:	89 c8                	mov    %ecx,%eax
 605:	c3                   	ret    
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi

00000610 <memset>:

void*
memset(void *dst, int c, uint n)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 617:	8b 4d 10             	mov    0x10(%ebp),%ecx
 61a:	8b 45 0c             	mov    0xc(%ebp),%eax
 61d:	89 d7                	mov    %edx,%edi
 61f:	fc                   	cld    
 620:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 622:	8b 7d fc             	mov    -0x4(%ebp),%edi
 625:	89 d0                	mov    %edx,%eax
 627:	c9                   	leave  
 628:	c3                   	ret    
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000630 <strchr>:

char*
strchr(const char *s, char c)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 63a:	0f b6 10             	movzbl (%eax),%edx
 63d:	84 d2                	test   %dl,%dl
 63f:	75 12                	jne    653 <strchr+0x23>
 641:	eb 1d                	jmp    660 <strchr+0x30>
 643:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 647:	90                   	nop
 648:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 64c:	83 c0 01             	add    $0x1,%eax
 64f:	84 d2                	test   %dl,%dl
 651:	74 0d                	je     660 <strchr+0x30>
    if(*s == c)
 653:	38 d1                	cmp    %dl,%cl
 655:	75 f1                	jne    648 <strchr+0x18>
      return (char*)s;
  return 0;
}
 657:	5d                   	pop    %ebp
 658:	c3                   	ret    
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 660:	31 c0                	xor    %eax,%eax
}
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop

00000670 <gets>:

char*
gets(char *buf, int max)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 675:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 678:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 679:	31 db                	xor    %ebx,%ebx
{
 67b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 67e:	eb 27                	jmp    6a7 <gets+0x37>
    cc = read(0, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	6a 01                	push   $0x1
 685:	57                   	push   %edi
 686:	6a 00                	push   $0x0
 688:	e8 2e 01 00 00       	call   7bb <read>
    if(cc < 1)
 68d:	83 c4 10             	add    $0x10,%esp
 690:	85 c0                	test   %eax,%eax
 692:	7e 1d                	jle    6b1 <gets+0x41>
      break;
    buf[i++] = c;
 694:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 698:	8b 55 08             	mov    0x8(%ebp),%edx
 69b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 69f:	3c 0a                	cmp    $0xa,%al
 6a1:	74 1d                	je     6c0 <gets+0x50>
 6a3:	3c 0d                	cmp    $0xd,%al
 6a5:	74 19                	je     6c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 6a7:	89 de                	mov    %ebx,%esi
 6a9:	83 c3 01             	add    $0x1,%ebx
 6ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 6af:	7c cf                	jl     680 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 6b1:	8b 45 08             	mov    0x8(%ebp),%eax
 6b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 6b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bb:	5b                   	pop    %ebx
 6bc:	5e                   	pop    %esi
 6bd:	5f                   	pop    %edi
 6be:	5d                   	pop    %ebp
 6bf:	c3                   	ret    
  buf[i] = '\0';
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	89 de                	mov    %ebx,%esi
 6c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 6c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cc:	5b                   	pop    %ebx
 6cd:	5e                   	pop    %esi
 6ce:	5f                   	pop    %edi
 6cf:	5d                   	pop    %ebp
 6d0:	c3                   	ret    
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop

000006e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	56                   	push   %esi
 6e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6e5:	83 ec 08             	sub    $0x8,%esp
 6e8:	6a 00                	push   $0x0
 6ea:	ff 75 08             	push   0x8(%ebp)
 6ed:	e8 f1 00 00 00       	call   7e3 <open>
  if(fd < 0)
 6f2:	83 c4 10             	add    $0x10,%esp
 6f5:	85 c0                	test   %eax,%eax
 6f7:	78 27                	js     720 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 6f9:	83 ec 08             	sub    $0x8,%esp
 6fc:	ff 75 0c             	push   0xc(%ebp)
 6ff:	89 c3                	mov    %eax,%ebx
 701:	50                   	push   %eax
 702:	e8 f4 00 00 00       	call   7fb <fstat>
  close(fd);
 707:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 70a:	89 c6                	mov    %eax,%esi
  close(fd);
 70c:	e8 ba 00 00 00       	call   7cb <close>
  return r;
 711:	83 c4 10             	add    $0x10,%esp
}
 714:	8d 65 f8             	lea    -0x8(%ebp),%esp
 717:	89 f0                	mov    %esi,%eax
 719:	5b                   	pop    %ebx
 71a:	5e                   	pop    %esi
 71b:	5d                   	pop    %ebp
 71c:	c3                   	ret    
 71d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 720:	be ff ff ff ff       	mov    $0xffffffff,%esi
 725:	eb ed                	jmp    714 <stat+0x34>
 727:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72e:	66 90                	xchg   %ax,%ax

00000730 <atoi>:

int
atoi(const char *s)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	53                   	push   %ebx
 734:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 737:	0f be 02             	movsbl (%edx),%eax
 73a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 73d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 740:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 745:	77 1e                	ja     765 <atoi+0x35>
 747:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 750:	83 c2 01             	add    $0x1,%edx
 753:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 756:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 75a:	0f be 02             	movsbl (%edx),%eax
 75d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 760:	80 fb 09             	cmp    $0x9,%bl
 763:	76 eb                	jbe    750 <atoi+0x20>
  return n;
}
 765:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 768:	89 c8                	mov    %ecx,%eax
 76a:	c9                   	leave  
 76b:	c3                   	ret    
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000770 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	8b 45 10             	mov    0x10(%ebp),%eax
 777:	8b 55 08             	mov    0x8(%ebp),%edx
 77a:	56                   	push   %esi
 77b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 77e:	85 c0                	test   %eax,%eax
 780:	7e 13                	jle    795 <memmove+0x25>
 782:	01 d0                	add    %edx,%eax
  dst = vdst;
 784:	89 d7                	mov    %edx,%edi
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 790:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 791:	39 f8                	cmp    %edi,%eax
 793:	75 fb                	jne    790 <memmove+0x20>
  return vdst;
}
 795:	5e                   	pop    %esi
 796:	89 d0                	mov    %edx,%eax
 798:	5f                   	pop    %edi
 799:	5d                   	pop    %ebp
 79a:	c3                   	ret    

0000079b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 79b:	b8 01 00 00 00       	mov    $0x1,%eax
 7a0:	cd 40                	int    $0x40
 7a2:	c3                   	ret    

000007a3 <exit>:
SYSCALL(exit)
 7a3:	b8 02 00 00 00       	mov    $0x2,%eax
 7a8:	cd 40                	int    $0x40
 7aa:	c3                   	ret    

000007ab <wait>:
SYSCALL(wait)
 7ab:	b8 03 00 00 00       	mov    $0x3,%eax
 7b0:	cd 40                	int    $0x40
 7b2:	c3                   	ret    

000007b3 <pipe>:
SYSCALL(pipe)
 7b3:	b8 04 00 00 00       	mov    $0x4,%eax
 7b8:	cd 40                	int    $0x40
 7ba:	c3                   	ret    

000007bb <read>:
SYSCALL(read)
 7bb:	b8 05 00 00 00       	mov    $0x5,%eax
 7c0:	cd 40                	int    $0x40
 7c2:	c3                   	ret    

000007c3 <write>:
SYSCALL(write)
 7c3:	b8 10 00 00 00       	mov    $0x10,%eax
 7c8:	cd 40                	int    $0x40
 7ca:	c3                   	ret    

000007cb <close>:
SYSCALL(close)
 7cb:	b8 15 00 00 00       	mov    $0x15,%eax
 7d0:	cd 40                	int    $0x40
 7d2:	c3                   	ret    

000007d3 <kill>:
SYSCALL(kill)
 7d3:	b8 06 00 00 00       	mov    $0x6,%eax
 7d8:	cd 40                	int    $0x40
 7da:	c3                   	ret    

000007db <exec>:
SYSCALL(exec)
 7db:	b8 07 00 00 00       	mov    $0x7,%eax
 7e0:	cd 40                	int    $0x40
 7e2:	c3                   	ret    

000007e3 <open>:
SYSCALL(open)
 7e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 7e8:	cd 40                	int    $0x40
 7ea:	c3                   	ret    

000007eb <mknod>:
SYSCALL(mknod)
 7eb:	b8 11 00 00 00       	mov    $0x11,%eax
 7f0:	cd 40                	int    $0x40
 7f2:	c3                   	ret    

000007f3 <unlink>:
SYSCALL(unlink)
 7f3:	b8 12 00 00 00       	mov    $0x12,%eax
 7f8:	cd 40                	int    $0x40
 7fa:	c3                   	ret    

000007fb <fstat>:
SYSCALL(fstat)
 7fb:	b8 08 00 00 00       	mov    $0x8,%eax
 800:	cd 40                	int    $0x40
 802:	c3                   	ret    

00000803 <link>:
SYSCALL(link)
 803:	b8 13 00 00 00       	mov    $0x13,%eax
 808:	cd 40                	int    $0x40
 80a:	c3                   	ret    

0000080b <mkdir>:
SYSCALL(mkdir)
 80b:	b8 14 00 00 00       	mov    $0x14,%eax
 810:	cd 40                	int    $0x40
 812:	c3                   	ret    

00000813 <chdir>:
SYSCALL(chdir)
 813:	b8 09 00 00 00       	mov    $0x9,%eax
 818:	cd 40                	int    $0x40
 81a:	c3                   	ret    

0000081b <dup>:
SYSCALL(dup)
 81b:	b8 0a 00 00 00       	mov    $0xa,%eax
 820:	cd 40                	int    $0x40
 822:	c3                   	ret    

00000823 <getpid>:
SYSCALL(getpid)
 823:	b8 0b 00 00 00       	mov    $0xb,%eax
 828:	cd 40                	int    $0x40
 82a:	c3                   	ret    

0000082b <sbrk>:
SYSCALL(sbrk)
 82b:	b8 0c 00 00 00       	mov    $0xc,%eax
 830:	cd 40                	int    $0x40
 832:	c3                   	ret    

00000833 <sleep>:
SYSCALL(sleep)
 833:	b8 0d 00 00 00       	mov    $0xd,%eax
 838:	cd 40                	int    $0x40
 83a:	c3                   	ret    

0000083b <uptime>:
SYSCALL(uptime)
 83b:	b8 0e 00 00 00       	mov    $0xe,%eax
 840:	cd 40                	int    $0x40
 842:	c3                   	ret    

00000843 <wmap>:
SYSCALL(wmap)
 843:	b8 16 00 00 00       	mov    $0x16,%eax
 848:	cd 40                	int    $0x40
 84a:	c3                   	ret    

0000084b <wunmap>:
SYSCALL(wunmap)
 84b:	b8 17 00 00 00       	mov    $0x17,%eax
 850:	cd 40                	int    $0x40
 852:	c3                   	ret    

00000853 <wremap>:
SYSCALL(wremap)
 853:	b8 18 00 00 00       	mov    $0x18,%eax
 858:	cd 40                	int    $0x40
 85a:	c3                   	ret    

0000085b <getpgdirinfo>:
SYSCALL(getpgdirinfo)
 85b:	b8 19 00 00 00       	mov    $0x19,%eax
 860:	cd 40                	int    $0x40
 862:	c3                   	ret    

00000863 <getwmapinfo>:
SYSCALL(getwmapinfo)
 863:	b8 1a 00 00 00       	mov    $0x1a,%eax
 868:	cd 40                	int    $0x40
 86a:	c3                   	ret    
 86b:	66 90                	xchg   %ax,%ax
 86d:	66 90                	xchg   %ax,%ax
 86f:	90                   	nop

00000870 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	53                   	push   %ebx
 876:	83 ec 3c             	sub    $0x3c,%esp
 879:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 87c:	89 d1                	mov    %edx,%ecx
{
 87e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 881:	85 d2                	test   %edx,%edx
 883:	0f 89 7f 00 00 00    	jns    908 <printint+0x98>
 889:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 88d:	74 79                	je     908 <printint+0x98>
    neg = 1;
 88f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 896:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 898:	31 db                	xor    %ebx,%ebx
 89a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 89d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 8a0:	89 c8                	mov    %ecx,%eax
 8a2:	31 d2                	xor    %edx,%edx
 8a4:	89 cf                	mov    %ecx,%edi
 8a6:	f7 75 c4             	divl   -0x3c(%ebp)
 8a9:	0f b6 92 64 10 00 00 	movzbl 0x1064(%edx),%edx
 8b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8b3:	89 d8                	mov    %ebx,%eax
 8b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 8c1:	76 dd                	jbe    8a0 <printint+0x30>
  if(neg)
 8c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 8c6:	85 c9                	test   %ecx,%ecx
 8c8:	74 0c                	je     8d6 <printint+0x66>
    buf[i++] = '-';
 8ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 8cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 8d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 8d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 8d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 8dd:	eb 07                	jmp    8e6 <printint+0x76>
 8df:	90                   	nop
    putc(fd, buf[i]);
 8e0:	0f b6 13             	movzbl (%ebx),%edx
 8e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 8e6:	83 ec 04             	sub    $0x4,%esp
 8e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 8ec:	6a 01                	push   $0x1
 8ee:	56                   	push   %esi
 8ef:	57                   	push   %edi
 8f0:	e8 ce fe ff ff       	call   7c3 <write>
  while(--i >= 0)
 8f5:	83 c4 10             	add    $0x10,%esp
 8f8:	39 de                	cmp    %ebx,%esi
 8fa:	75 e4                	jne    8e0 <printint+0x70>
}
 8fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ff:	5b                   	pop    %ebx
 900:	5e                   	pop    %esi
 901:	5f                   	pop    %edi
 902:	5d                   	pop    %ebp
 903:	c3                   	ret    
 904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 908:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 90f:	eb 87                	jmp    898 <printint+0x28>
 911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 918:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91f:	90                   	nop

00000920 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	57                   	push   %edi
 924:	56                   	push   %esi
 925:	53                   	push   %ebx
 926:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 929:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 92c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 92f:	0f b6 13             	movzbl (%ebx),%edx
 932:	84 d2                	test   %dl,%dl
 934:	74 6a                	je     9a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 936:	8d 45 10             	lea    0x10(%ebp),%eax
 939:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 93c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 93f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 941:	89 45 d0             	mov    %eax,-0x30(%ebp)
 944:	eb 36                	jmp    97c <printf+0x5c>
 946:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 94d:	8d 76 00             	lea    0x0(%esi),%esi
 950:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 953:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 958:	83 f8 25             	cmp    $0x25,%eax
 95b:	74 15                	je     972 <printf+0x52>
  write(fd, &c, 1);
 95d:	83 ec 04             	sub    $0x4,%esp
 960:	88 55 e7             	mov    %dl,-0x19(%ebp)
 963:	6a 01                	push   $0x1
 965:	57                   	push   %edi
 966:	56                   	push   %esi
 967:	e8 57 fe ff ff       	call   7c3 <write>
 96c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 96f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 972:	0f b6 13             	movzbl (%ebx),%edx
 975:	83 c3 01             	add    $0x1,%ebx
 978:	84 d2                	test   %dl,%dl
 97a:	74 24                	je     9a0 <printf+0x80>
    c = fmt[i] & 0xff;
 97c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 97f:	85 c9                	test   %ecx,%ecx
 981:	74 cd                	je     950 <printf+0x30>
      }
    } else if(state == '%'){
 983:	83 f9 25             	cmp    $0x25,%ecx
 986:	75 ea                	jne    972 <printf+0x52>
      if(c == 'd'){
 988:	83 f8 25             	cmp    $0x25,%eax
 98b:	0f 84 07 01 00 00    	je     a98 <printf+0x178>
 991:	83 e8 63             	sub    $0x63,%eax
 994:	83 f8 15             	cmp    $0x15,%eax
 997:	77 17                	ja     9b0 <printf+0x90>
 999:	ff 24 85 0c 10 00 00 	jmp    *0x100c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9a3:	5b                   	pop    %ebx
 9a4:	5e                   	pop    %esi
 9a5:	5f                   	pop    %edi
 9a6:	5d                   	pop    %ebp
 9a7:	c3                   	ret    
 9a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9af:	90                   	nop
  write(fd, &c, 1);
 9b0:	83 ec 04             	sub    $0x4,%esp
 9b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 9b6:	6a 01                	push   $0x1
 9b8:	57                   	push   %edi
 9b9:	56                   	push   %esi
 9ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9be:	e8 00 fe ff ff       	call   7c3 <write>
        putc(fd, c);
 9c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 9c7:	83 c4 0c             	add    $0xc,%esp
 9ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 9cd:	6a 01                	push   $0x1
 9cf:	57                   	push   %edi
 9d0:	56                   	push   %esi
 9d1:	e8 ed fd ff ff       	call   7c3 <write>
        putc(fd, c);
 9d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9d9:	31 c9                	xor    %ecx,%ecx
 9db:	eb 95                	jmp    972 <printf+0x52>
 9dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 9e0:	83 ec 0c             	sub    $0xc,%esp
 9e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9e8:	6a 00                	push   $0x0
 9ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9ed:	8b 10                	mov    (%eax),%edx
 9ef:	89 f0                	mov    %esi,%eax
 9f1:	e8 7a fe ff ff       	call   870 <printint>
        ap++;
 9f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 9fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9fd:	31 c9                	xor    %ecx,%ecx
 9ff:	e9 6e ff ff ff       	jmp    972 <printf+0x52>
 a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 a08:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a0b:	8b 10                	mov    (%eax),%edx
        ap++;
 a0d:	83 c0 04             	add    $0x4,%eax
 a10:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a13:	85 d2                	test   %edx,%edx
 a15:	0f 84 8d 00 00 00    	je     aa8 <printf+0x188>
        while(*s != 0){
 a1b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 a1e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 a20:	84 c0                	test   %al,%al
 a22:	0f 84 4a ff ff ff    	je     972 <printf+0x52>
 a28:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 a2b:	89 d3                	mov    %edx,%ebx
 a2d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 a30:	83 ec 04             	sub    $0x4,%esp
          s++;
 a33:	83 c3 01             	add    $0x1,%ebx
 a36:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a39:	6a 01                	push   $0x1
 a3b:	57                   	push   %edi
 a3c:	56                   	push   %esi
 a3d:	e8 81 fd ff ff       	call   7c3 <write>
        while(*s != 0){
 a42:	0f b6 03             	movzbl (%ebx),%eax
 a45:	83 c4 10             	add    $0x10,%esp
 a48:	84 c0                	test   %al,%al
 a4a:	75 e4                	jne    a30 <printf+0x110>
      state = 0;
 a4c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 a4f:	31 c9                	xor    %ecx,%ecx
 a51:	e9 1c ff ff ff       	jmp    972 <printf+0x52>
 a56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a5d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a60:	83 ec 0c             	sub    $0xc,%esp
 a63:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a68:	6a 01                	push   $0x1
 a6a:	e9 7b ff ff ff       	jmp    9ea <printf+0xca>
 a6f:	90                   	nop
        putc(fd, *ap);
 a70:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 a73:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a76:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 a78:	6a 01                	push   $0x1
 a7a:	57                   	push   %edi
 a7b:	56                   	push   %esi
        putc(fd, *ap);
 a7c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a7f:	e8 3f fd ff ff       	call   7c3 <write>
        ap++;
 a84:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 a88:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a8b:	31 c9                	xor    %ecx,%ecx
 a8d:	e9 e0 fe ff ff       	jmp    972 <printf+0x52>
 a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 a98:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 a9b:	83 ec 04             	sub    $0x4,%esp
 a9e:	e9 2a ff ff ff       	jmp    9cd <printf+0xad>
 aa3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 aa7:	90                   	nop
          s = "(null)";
 aa8:	ba 04 10 00 00       	mov    $0x1004,%edx
        while(*s != 0){
 aad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 ab0:	b8 28 00 00 00       	mov    $0x28,%eax
 ab5:	89 d3                	mov    %edx,%ebx
 ab7:	e9 74 ff ff ff       	jmp    a30 <printf+0x110>
 abc:	66 90                	xchg   %ax,%ax
 abe:	66 90                	xchg   %ax,%ax

00000ac0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ac0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac1:	a1 4c 14 00 00       	mov    0x144c,%eax
{
 ac6:	89 e5                	mov    %esp,%ebp
 ac8:	57                   	push   %edi
 ac9:	56                   	push   %esi
 aca:	53                   	push   %ebx
 acb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 ace:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ad8:	89 c2                	mov    %eax,%edx
 ada:	8b 00                	mov    (%eax),%eax
 adc:	39 ca                	cmp    %ecx,%edx
 ade:	73 30                	jae    b10 <free+0x50>
 ae0:	39 c1                	cmp    %eax,%ecx
 ae2:	72 04                	jb     ae8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ae4:	39 c2                	cmp    %eax,%edx
 ae6:	72 f0                	jb     ad8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ae8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 aeb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 aee:	39 f8                	cmp    %edi,%eax
 af0:	74 30                	je     b22 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 af2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 af5:	8b 42 04             	mov    0x4(%edx),%eax
 af8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 afb:	39 f1                	cmp    %esi,%ecx
 afd:	74 3a                	je     b39 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 aff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 b01:	5b                   	pop    %ebx
  freep = p;
 b02:	89 15 4c 14 00 00    	mov    %edx,0x144c
}
 b08:	5e                   	pop    %esi
 b09:	5f                   	pop    %edi
 b0a:	5d                   	pop    %ebp
 b0b:	c3                   	ret    
 b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b10:	39 c2                	cmp    %eax,%edx
 b12:	72 c4                	jb     ad8 <free+0x18>
 b14:	39 c1                	cmp    %eax,%ecx
 b16:	73 c0                	jae    ad8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 b18:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b1b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b1e:	39 f8                	cmp    %edi,%eax
 b20:	75 d0                	jne    af2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 b22:	03 70 04             	add    0x4(%eax),%esi
 b25:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b28:	8b 02                	mov    (%edx),%eax
 b2a:	8b 00                	mov    (%eax),%eax
 b2c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 b2f:	8b 42 04             	mov    0x4(%edx),%eax
 b32:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 b35:	39 f1                	cmp    %esi,%ecx
 b37:	75 c6                	jne    aff <free+0x3f>
    p->s.size += bp->s.size;
 b39:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 b3c:	89 15 4c 14 00 00    	mov    %edx,0x144c
    p->s.size += bp->s.size;
 b42:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 b45:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 b48:	89 0a                	mov    %ecx,(%edx)
}
 b4a:	5b                   	pop    %ebx
 b4b:	5e                   	pop    %esi
 b4c:	5f                   	pop    %edi
 b4d:	5d                   	pop    %ebp
 b4e:	c3                   	ret    
 b4f:	90                   	nop

00000b50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	57                   	push   %edi
 b54:	56                   	push   %esi
 b55:	53                   	push   %ebx
 b56:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b59:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b5c:	8b 3d 4c 14 00 00    	mov    0x144c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b62:	8d 70 07             	lea    0x7(%eax),%esi
 b65:	c1 ee 03             	shr    $0x3,%esi
 b68:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b6b:	85 ff                	test   %edi,%edi
 b6d:	0f 84 9d 00 00 00    	je     c10 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b73:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 b75:	8b 4a 04             	mov    0x4(%edx),%ecx
 b78:	39 f1                	cmp    %esi,%ecx
 b7a:	73 6a                	jae    be6 <malloc+0x96>
 b7c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b81:	39 de                	cmp    %ebx,%esi
 b83:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b86:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 b8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b90:	eb 17                	jmp    ba9 <malloc+0x59>
 b92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b98:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b9a:	8b 48 04             	mov    0x4(%eax),%ecx
 b9d:	39 f1                	cmp    %esi,%ecx
 b9f:	73 4f                	jae    bf0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ba1:	8b 3d 4c 14 00 00    	mov    0x144c,%edi
 ba7:	89 c2                	mov    %eax,%edx
 ba9:	39 d7                	cmp    %edx,%edi
 bab:	75 eb                	jne    b98 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 bad:	83 ec 0c             	sub    $0xc,%esp
 bb0:	ff 75 e4             	push   -0x1c(%ebp)
 bb3:	e8 73 fc ff ff       	call   82b <sbrk>
  if(p == (char*)-1)
 bb8:	83 c4 10             	add    $0x10,%esp
 bbb:	83 f8 ff             	cmp    $0xffffffff,%eax
 bbe:	74 1c                	je     bdc <malloc+0x8c>
  hp->s.size = nu;
 bc0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 bc3:	83 ec 0c             	sub    $0xc,%esp
 bc6:	83 c0 08             	add    $0x8,%eax
 bc9:	50                   	push   %eax
 bca:	e8 f1 fe ff ff       	call   ac0 <free>
  return freep;
 bcf:	8b 15 4c 14 00 00    	mov    0x144c,%edx
      if((p = morecore(nunits)) == 0)
 bd5:	83 c4 10             	add    $0x10,%esp
 bd8:	85 d2                	test   %edx,%edx
 bda:	75 bc                	jne    b98 <malloc+0x48>
        return 0;
  }
}
 bdc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bdf:	31 c0                	xor    %eax,%eax
}
 be1:	5b                   	pop    %ebx
 be2:	5e                   	pop    %esi
 be3:	5f                   	pop    %edi
 be4:	5d                   	pop    %ebp
 be5:	c3                   	ret    
    if(p->s.size >= nunits){
 be6:	89 d0                	mov    %edx,%eax
 be8:	89 fa                	mov    %edi,%edx
 bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 bf0:	39 ce                	cmp    %ecx,%esi
 bf2:	74 4c                	je     c40 <malloc+0xf0>
        p->s.size -= nunits;
 bf4:	29 f1                	sub    %esi,%ecx
 bf6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 bf9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 bfc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 bff:	89 15 4c 14 00 00    	mov    %edx,0x144c
}
 c05:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c08:	83 c0 08             	add    $0x8,%eax
}
 c0b:	5b                   	pop    %ebx
 c0c:	5e                   	pop    %esi
 c0d:	5f                   	pop    %edi
 c0e:	5d                   	pop    %ebp
 c0f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 c10:	c7 05 4c 14 00 00 50 	movl   $0x1450,0x144c
 c17:	14 00 00 
    base.s.size = 0;
 c1a:	bf 50 14 00 00       	mov    $0x1450,%edi
    base.s.ptr = freep = prevp = &base;
 c1f:	c7 05 50 14 00 00 50 	movl   $0x1450,0x1450
 c26:	14 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c29:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 c2b:	c7 05 54 14 00 00 00 	movl   $0x0,0x1454
 c32:	00 00 00 
    if(p->s.size >= nunits){
 c35:	e9 42 ff ff ff       	jmp    b7c <malloc+0x2c>
 c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c40:	8b 08                	mov    (%eax),%ecx
 c42:	89 0a                	mov    %ecx,(%edx)
 c44:	eb b9                	jmp    bff <malloc+0xaf>
