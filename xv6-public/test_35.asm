
_test_35:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
        printf(1, "Cause: expected Virt.Addr. 0x%x to %s in the list of user pages\n", va, expected ? "exist" : "not exist");
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
  11:	81 ec 3c 06 00 00    	sub    $0x63c,%esp
    printf(1, "\n\n%s\n", test_name);
  17:	ff 35 9c 13 00 00    	push   0x139c
  1d:	68 65 0c 00 00       	push   $0xc65
  22:	6a 01                	push   $0x1
  24:	e8 e7 08 00 00       	call   910 <printf>

    // validate initial state
    struct wmapinfo winfo1;
    get_n_validate_wmap_info(&winfo1, 0);
  29:	8d 85 cc f9 ff ff    	lea    -0x634(%ebp),%eax
  2f:	5e                   	pop    %esi
  30:	5f                   	pop    %edi
  31:	6a 00                	push   $0x0
  33:	50                   	push   %eax
  34:	e8 37 03 00 00       	call   370 <get_n_validate_wmap_info>
    //
    // 1. create a anonymous MAP 1
    //
    uint map1addr1 = MMAPBASE + PGSIZE * N_PAGES;
    int map1len1 = PGSIZE * N_PAGES;
    uint map1v1 = wmap(map1addr1, map1len1, fixed_anon, fd);
  39:	6a ff                	push   $0xffffffff
  3b:	6a 0d                	push   $0xd
  3d:	68 00 30 00 00       	push   $0x3000
  42:	68 00 30 00 60       	push   $0x60003000
  47:	e8 e7 07 00 00       	call   833 <wmap>
    if (map1v1 == FAILED) {
  4c:	83 c4 20             	add    $0x20,%esp
  4f:	83 f8 ff             	cmp    $0xffffffff,%eax
  52:	0f 84 83 02 00 00    	je     2db <main+0x2db>
        printf(1, "Cause: `wmap()` returned 0x%x\n", map1v1);
        failed();
    }
    printf(1, "Map 1 placed at 0x%x (length 0x%x)\n", map1v1, map1len1);
  58:	68 00 30 00 00       	push   $0x3000
  5d:	89 c6                	mov    %eax,%esi
  5f:	50                   	push   %eax
  60:	68 44 0e 00 00       	push   $0xe44
  65:	6a 01                	push   $0x1
  67:	e8 a4 08 00 00       	call   910 <printf>
    //
    // 2. create another anonymous MAP 2
    //
    uint map2addr1 = map1addr1 - PGSIZE * N_PAGES;
    int map2len1 = PGSIZE * N_PAGES;
    uint map2v1 = wmap(map2addr1, map2len1, fixed_anon, fd);
  6c:	6a ff                	push   $0xffffffff
  6e:	6a 0d                	push   $0xd
  70:	68 00 30 00 00       	push   $0x3000
  75:	68 00 00 00 60       	push   $0x60000000
  7a:	e8 b4 07 00 00       	call   833 <wmap>
    if (map2v1 == FAILED) {
  7f:	83 c4 20             	add    $0x20,%esp
    uint map2v1 = wmap(map2addr1, map2len1, fixed_anon, fd);
  82:	89 c3                	mov    %eax,%ebx
    if (map2v1 == FAILED) {
  84:	83 f8 ff             	cmp    $0xffffffff,%eax
  87:	0f 84 3b 02 00 00    	je     2c8 <main+0x2c8>
        printf(1, "\tCause:\tmem2 failed\n");
        failed();
    }
    printf(1, "Map 2 placed at 0x%x (length 0x%x)\n", map2v1, map2len1);
  8d:	68 00 30 00 00       	push   $0x3000

    // validate mid state
    struct wmapinfo winfo2;
    get_n_validate_wmap_info(&winfo2, 2); // 2 maps exist
  92:	8d bd 90 fa ff ff    	lea    -0x570(%ebp),%edi
    printf(1, "Map 2 placed at 0x%x (length 0x%x)\n", map2v1, map2len1);
  98:	50                   	push   %eax
  99:	68 68 0e 00 00       	push   $0xe68
  9e:	6a 01                	push   $0x1
  a0:	e8 6b 08 00 00       	call   910 <printf>
    get_n_validate_wmap_info(&winfo2, 2); // 2 maps exist
  a5:	58                   	pop    %eax
  a6:	5a                   	pop    %edx
  a7:	6a 02                	push   $0x2
  a9:	57                   	push   %edi
  aa:	e8 c1 02 00 00       	call   370 <get_n_validate_wmap_info>
    map_exists(&winfo2, map1v1, map1len1, TRUE);
  af:	6a 01                	push   $0x1
  b1:	68 00 30 00 00       	push   $0x3000
  b6:	56                   	push   %esi
  b7:	57                   	push   %edi
  b8:	e8 03 03 00 00       	call   3c0 <map_exists>
  bd:	83 c4 10             	add    $0x10,%esp
    map_exists(&winfo2, map2v1, map2len1, TRUE);
  c0:	6a 01                	push   $0x1
  c2:	68 00 30 00 00       	push   $0x3000
  c7:	53                   	push   %ebx
  c8:	57                   	push   %edi
  c9:	8d bb 00 30 00 00    	lea    0x3000(%ebx),%edi
  cf:	e8 ec 02 00 00       	call   3c0 <map_exists>
    printf(1, "Validated two maps. \tOkay\n");
  d4:	83 c4 18             	add    $0x18,%esp
  d7:	68 80 0c 00 00       	push   $0xc80
  dc:	6a 01                	push   $0x1
  de:	e8 2d 08 00 00       	call   910 <printf>
    //
    // 3. write to map 2
    //
    char *arr = (char *)map2v1;
    int value = 'y';
    for (int i = 0; i < map2len1; i++)
  e3:	83 c4 10             	add    $0x10,%esp
    printf(1, "Validated two maps. \tOkay\n");
  e6:	89 d8                	mov    %ebx,%eax
  e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop
        arr[i] = value;
  f0:	c6 00 79             	movb   $0x79,(%eax)
    for (int i = 0; i < map2len1; i++)
  f3:	83 c0 01             	add    $0x1,%eax
  f6:	39 c7                	cmp    %eax,%edi
  f8:	75 f6                	jne    f0 <main+0xf0>
    // validate page in the user pages
    struct pgdirinfo pinfo;
    get_n_validate_pgdirinfo(&pinfo);
  fa:	83 ec 0c             	sub    $0xc,%esp
  fd:	8d 85 dc fc ff ff    	lea    -0x324(%ebp),%eax
 103:	50                   	push   %eax
 104:	e8 37 03 00 00       	call   440 <get_n_validate_pgdirinfo>
 109:	83 c4 10             	add    $0x10,%esp
 10c:	89 d8                	mov    %ebx,%eax
    for (int i = 0; i < map2len1; i += PGSIZE)
        va_exists(&pinfo, map2v1 + i, TRUE);
 10e:	83 ec 04             	sub    $0x4,%esp
 111:	89 85 c4 f9 ff ff    	mov    %eax,-0x63c(%ebp)
 117:	6a 01                	push   $0x1
 119:	50                   	push   %eax
 11a:	8d 85 dc fc ff ff    	lea    -0x324(%ebp),%eax
 120:	50                   	push   %eax
 121:	e8 aa 03 00 00       	call   4d0 <va_exists>
    for (int i = 0; i < map2len1; i += PGSIZE)
 126:	8b 85 c4 f9 ff ff    	mov    -0x63c(%ebp),%eax
        va_exists(&pinfo, map2v1 + i, TRUE);
 12c:	83 c4 10             	add    $0x10,%esp
    for (int i = 0; i < map2len1; i += PGSIZE)
 12f:	05 00 10 00 00       	add    $0x1000,%eax
 134:	39 f8                	cmp    %edi,%eax
 136:	75 d6                	jne    10e <main+0x10e>

    //
    // 4. expand map2 that requires moving, with moving flag (allow_move)
    //
    int map2len2 = map2len1 + PGSIZE;
    uint map2v2 = wremap(map2v1, map2len1, map2len2, allow_move);
 138:	6a 01                	push   $0x1
 13a:	68 00 40 00 00       	push   $0x4000
 13f:	68 00 30 00 00       	push   $0x3000
 144:	53                   	push   %ebx
 145:	e8 f9 06 00 00       	call   843 <wremap>
    if (map2v2 == FAILED) {
 14a:	83 c4 10             	add    $0x10,%esp
    uint map2v2 = wremap(map2v1, map2len1, map2len2, allow_move);
 14d:	89 85 c4 f9 ff ff    	mov    %eax,-0x63c(%ebp)
    if (map2v2 == FAILED) {
 153:	83 c0 01             	add    $0x1,%eax
 156:	0f 84 b9 01 00 00    	je     315 <main+0x315>
        printf(1, "Cause: `wremap` returned 0x%x\n", map2v2);
        failed();
    }
    if (map2v2 == map2v1) {
 15c:	3b 9d c4 f9 ff ff    	cmp    -0x63c(%ebp),%ebx
 162:	0f 84 9a 01 00 00    	je     302 <main+0x302>
        printf(1, "Cause: Map 2 did not move\n");
        failed();
    }
    // validate mid state
    struct wmapinfo winfo3;
    get_n_validate_wmap_info(&winfo3, 2);        // still 2 maps
 168:	50                   	push   %eax
 169:	50                   	push   %eax
 16a:	8d 85 54 fb ff ff    	lea    -0x4ac(%ebp),%eax
 170:	6a 02                	push   $0x2
 172:	50                   	push   %eax
 173:	e8 f8 01 00 00       	call   370 <get_n_validate_wmap_info>
    map_exists(&winfo3, map1v1, map1len1, TRUE); // Map 1 exists
 178:	8d 85 54 fb ff ff    	lea    -0x4ac(%ebp),%eax
 17e:	6a 01                	push   $0x1
 180:	68 00 30 00 00       	push   $0x3000
 185:	56                   	push   %esi
 186:	50                   	push   %eax
 187:	e8 34 02 00 00       	call   3c0 <map_exists>
    map_exists(&winfo3, map2v2, map2len2, TRUE); // Map 2 exists but at a different address
 18c:	8b b5 c4 f9 ff ff    	mov    -0x63c(%ebp),%esi
    map_exists(&winfo3, map1v1, map1len1, TRUE); // Map 1 exists
 192:	83 c4 10             	add    $0x10,%esp
    map_exists(&winfo3, map2v2, map2len2, TRUE); // Map 2 exists but at a different address
 195:	8d 85 54 fb ff ff    	lea    -0x4ac(%ebp),%eax
 19b:	6a 01                	push   $0x1
 19d:	68 00 40 00 00       	push   $0x4000
 1a2:	56                   	push   %esi
 1a3:	50                   	push   %eax
 1a4:	e8 17 02 00 00       	call   3c0 <map_exists>
 1a9:	83 c4 10             	add    $0x10,%esp
    map_exists(&winfo3, map2v1, map2len1, FALSE);
 1ac:	8d 85 54 fb ff ff    	lea    -0x4ac(%ebp),%eax
 1b2:	6a 00                	push   $0x0
 1b4:	68 00 30 00 00       	push   $0x3000
 1b9:	53                   	push   %ebx
 1ba:	50                   	push   %eax
 1bb:	e8 00 02 00 00       	call   3c0 <map_exists>
 1c0:	83 c4 10             	add    $0x10,%esp
    printf(1, "Map 2 moved to 0x%x (length 0x%x). \tOkay\n", map2v2, map2len2);
 1c3:	68 00 40 00 00       	push   $0x4000
 1c8:	56                   	push   %esi
    // validate the old VA does not exist in the user pages
    struct pgdirinfo pinfo2;
    get_n_validate_pgdirinfo(&pinfo2);
 1c9:	8d b5 e0 fd ff ff    	lea    -0x220(%ebp),%esi
    printf(1, "Map 2 moved to 0x%x (length 0x%x). \tOkay\n", map2v2, map2len2);
 1cf:	68 ac 0e 00 00       	push   $0xeac
 1d4:	6a 01                	push   $0x1
 1d6:	e8 35 07 00 00       	call   910 <printf>
    get_n_validate_pgdirinfo(&pinfo2);
 1db:	83 c4 14             	add    $0x14,%esp
 1de:	56                   	push   %esi
 1df:	e8 5c 02 00 00       	call   440 <get_n_validate_pgdirinfo>
 1e4:	83 c4 10             	add    $0x10,%esp
    for (int i = 0; i < map2len1; i += PGSIZE)
        va_exists(&pinfo2, map2v1 + i, FALSE);
 1e7:	83 ec 04             	sub    $0x4,%esp
 1ea:	6a 00                	push   $0x0
 1ec:	53                   	push   %ebx
    for (int i = 0; i < map2len1; i += PGSIZE)
 1ed:	81 c3 00 10 00 00    	add    $0x1000,%ebx
        va_exists(&pinfo2, map2v1 + i, FALSE);
 1f3:	56                   	push   %esi
 1f4:	e8 d7 02 00 00       	call   4d0 <va_exists>
 1f9:	83 c4 10             	add    $0x10,%esp
    for (int i = 0; i < map2len1; i += PGSIZE)
 1fc:	39 fb                	cmp    %edi,%ebx
 1fe:	75 e7                	jne    1e7 <main+0x1e7>
    printf(1, "Validated the old VA does not exist in the user pages. \tOkay\n");
 200:	50                   	push   %eax
 201:	50                   	push   %eax
 202:	68 d8 0e 00 00       	push   $0xed8
 207:	6a 01                	push   $0x1
 209:	e8 02 07 00 00       	call   910 <printf>
    // validate the new VA exists in the user pages
    for (int i = 0; i < map2len1; i += PGSIZE)
 20e:	8b bd c4 f9 ff ff    	mov    -0x63c(%ebp),%edi
 214:	83 c4 10             	add    $0x10,%esp
 217:	8d 9f 00 30 00 00    	lea    0x3000(%edi),%ebx
        va_exists(&pinfo2, map2v2 + i, TRUE);
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	6a 01                	push   $0x1
 222:	57                   	push   %edi
    for (int i = 0; i < map2len1; i += PGSIZE)
 223:	81 c7 00 10 00 00    	add    $0x1000,%edi
        va_exists(&pinfo2, map2v2 + i, TRUE);
 229:	56                   	push   %esi
 22a:	e8 a1 02 00 00       	call   4d0 <va_exists>
 22f:	83 c4 10             	add    $0x10,%esp
    for (int i = 0; i < map2len1; i += PGSIZE)
 232:	39 df                	cmp    %ebx,%edi
 234:	75 e7                	jne    21d <main+0x21d>
    printf(1, "Validated the new VA exists in the user pages. \tOkay\n");
 236:	56                   	push   %esi
 237:	56                   	push   %esi
 238:	68 18 0f 00 00       	push   $0xf18
 23d:	6a 01                	push   $0x1
 23f:	e8 cc 06 00 00       	call   910 <printf>

    //
    // 5. Unmap the Map 2
    //
    int ret = wunmap(map2v2);
 244:	5f                   	pop    %edi
 245:	ff b5 c4 f9 ff ff    	push   -0x63c(%ebp)
 24b:	e8 eb 05 00 00       	call   83b <wunmap>
    if (ret < 0) {
 250:	83 c4 10             	add    $0x10,%esp
 253:	85 c0                	test   %eax,%eax
 255:	0f 88 94 00 00 00    	js     2ef <main+0x2ef>
        printf(1, "Cause: `wunmap()` returned %d\n", ret);
        failed();
    }
    // validate final state
    struct wmapinfo winfo4;
    get_n_validate_wmap_info(&winfo4, 1);         // 1 map exists
 25b:	8d 9d 18 fc ff ff    	lea    -0x3e8(%ebp),%ebx
 261:	51                   	push   %ecx
    map_exists(&winfo4, map2v2, map2len2, FALSE); // Map 2 does not exist
    // validate the VA does not exist in the user pages
    struct pgdirinfo pinfo3;
    get_n_validate_pgdirinfo(&pinfo3);
 262:	8d b5 e4 fe ff ff    	lea    -0x11c(%ebp),%esi
    get_n_validate_wmap_info(&winfo4, 1);         // 1 map exists
 268:	51                   	push   %ecx
 269:	6a 01                	push   $0x1
 26b:	53                   	push   %ebx
 26c:	e8 ff 00 00 00       	call   370 <get_n_validate_wmap_info>
    map_exists(&winfo4, map2v2, map2len2, FALSE); // Map 2 does not exist
 271:	6a 00                	push   $0x0
 273:	68 00 40 00 00       	push   $0x4000
 278:	ff b5 c4 f9 ff ff    	push   -0x63c(%ebp)
 27e:	53                   	push   %ebx
    for (int i = 0; i < map2len2; i += PGSIZE)
 27f:	31 db                	xor    %ebx,%ebx
    map_exists(&winfo4, map2v2, map2len2, FALSE); // Map 2 does not exist
 281:	e8 3a 01 00 00       	call   3c0 <map_exists>
    get_n_validate_pgdirinfo(&pinfo3);
 286:	83 c4 14             	add    $0x14,%esp
 289:	56                   	push   %esi
 28a:	e8 b1 01 00 00       	call   440 <get_n_validate_pgdirinfo>
 28f:	83 c4 10             	add    $0x10,%esp
        va_exists(&pinfo3, map2v2 + i, FALSE);
 292:	8b 85 c4 f9 ff ff    	mov    -0x63c(%ebp),%eax
 298:	52                   	push   %edx
 299:	6a 00                	push   $0x0
 29b:	01 d8                	add    %ebx,%eax
    for (int i = 0; i < map2len2; i += PGSIZE)
 29d:	81 c3 00 10 00 00    	add    $0x1000,%ebx
        va_exists(&pinfo3, map2v2 + i, FALSE);
 2a3:	50                   	push   %eax
 2a4:	56                   	push   %esi
 2a5:	e8 26 02 00 00       	call   4d0 <va_exists>
 2aa:	83 c4 10             	add    $0x10,%esp
    for (int i = 0; i < map2len2; i += PGSIZE)
 2ad:	81 fb 00 40 00 00    	cmp    $0x4000,%ebx
 2b3:	75 dd                	jne    292 <main+0x292>
    printf(1, "Validated the VA does not exist in the user pages. \tOkay\n");
 2b5:	50                   	push   %eax
 2b6:	50                   	push   %eax
 2b7:	68 70 0f 00 00       	push   $0xf70
 2bc:	6a 01                	push   $0x1
 2be:	e8 4d 06 00 00       	call   910 <printf>

    // test ends
    success();
 2c3:	e8 68 00 00 00       	call   330 <success>
        printf(1, "\tCause:\tmem2 failed\n");
 2c8:	51                   	push   %ecx
 2c9:	51                   	push   %ecx
 2ca:	68 6b 0c 00 00       	push   $0xc6b
 2cf:	6a 01                	push   $0x1
 2d1:	e8 3a 06 00 00       	call   910 <printf>
        failed();
 2d6:	e8 75 00 00 00       	call   350 <failed>
        printf(1, "Cause: `wmap()` returned 0x%x\n", map1v1);
 2db:	53                   	push   %ebx
 2dc:	6a ff                	push   $0xffffffff
 2de:	68 24 0e 00 00       	push   $0xe24
 2e3:	6a 01                	push   $0x1
 2e5:	e8 26 06 00 00       	call   910 <printf>
        failed();
 2ea:	e8 61 00 00 00       	call   350 <failed>
        printf(1, "Cause: `wunmap()` returned %d\n", ret);
 2ef:	53                   	push   %ebx
 2f0:	50                   	push   %eax
 2f1:	68 50 0f 00 00       	push   $0xf50
 2f6:	6a 01                	push   $0x1
 2f8:	e8 13 06 00 00       	call   910 <printf>
        failed();
 2fd:	e8 4e 00 00 00       	call   350 <failed>
        printf(1, "Cause: Map 2 did not move\n");
 302:	50                   	push   %eax
 303:	50                   	push   %eax
 304:	68 9b 0c 00 00       	push   $0xc9b
 309:	6a 01                	push   $0x1
 30b:	e8 00 06 00 00       	call   910 <printf>
        failed();
 310:	e8 3b 00 00 00       	call   350 <failed>
        printf(1, "Cause: `wremap` returned 0x%x\n", map2v2);
 315:	50                   	push   %eax
 316:	6a ff                	push   $0xffffffff
 318:	68 8c 0e 00 00       	push   $0xe8c
 31d:	6a 01                	push   $0x1
 31f:	e8 ec 05 00 00       	call   910 <printf>
        failed();
 324:	e8 27 00 00 00       	call   350 <failed>
 329:	66 90                	xchg   %ax,%ax
 32b:	66 90                	xchg   %ax,%ax
 32d:	66 90                	xchg   %ax,%ax
 32f:	90                   	nop

00000330 <success>:
void success() {
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\nWMMAP\t SUCCESS\n\n");
 336:	68 38 0c 00 00       	push   $0xc38
 33b:	6a 01                	push   $0x1
 33d:	e8 ce 05 00 00       	call   910 <printf>
    exit();
 342:	e8 4c 04 00 00       	call   793 <exit>
 347:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34e:	66 90                	xchg   %ax,%ax

00000350 <failed>:
void failed() {
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\nWMMAP\t FAILED\n\n");
 356:	68 4a 0c 00 00       	push   $0xc4a
 35b:	6a 01                	push   $0x1
 35d:	e8 ae 05 00 00       	call   910 <printf>
    exit();
 362:	e8 2c 04 00 00       	call   793 <exit>
 367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36e:	66 90                	xchg   %ax,%ax

00000370 <get_n_validate_wmap_info>:
void get_n_validate_wmap_info(struct wmapinfo *info, int expected_total_mmaps) {
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	83 ec 10             	sub    $0x10,%esp
 377:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int ret = getwmapinfo(info);
 37a:	53                   	push   %ebx
 37b:	e8 d3 04 00 00       	call   853 <getwmapinfo>
    if (ret < 0) {
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	78 0c                	js     393 <get_n_validate_wmap_info+0x23>
    if (info->total_mmaps != expected_total_mmaps) {
 387:	8b 03                	mov    (%ebx),%eax
 389:	3b 45 0c             	cmp    0xc(%ebp),%eax
 38c:	75 18                	jne    3a6 <get_n_validate_wmap_info+0x36>
}
 38e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 391:	c9                   	leave  
 392:	c3                   	ret    
        printf(1, "Cause: `getwmapinfo()` returned %d\n", ret);
 393:	52                   	push   %edx
 394:	50                   	push   %eax
 395:	68 c0 0c 00 00       	push   $0xcc0
 39a:	6a 01                	push   $0x1
 39c:	e8 6f 05 00 00       	call   910 <printf>
        failed();
 3a1:	e8 aa ff ff ff       	call   350 <failed>
        printf(1, "Cause: expected %d maps, but found %d\n", expected_total_mmaps, info->total_mmaps);
 3a6:	50                   	push   %eax
 3a7:	ff 75 0c             	push   0xc(%ebp)
 3aa:	68 e4 0c 00 00       	push   $0xce4
 3af:	6a 01                	push   $0x1
 3b1:	e8 5a 05 00 00       	call   910 <printf>
        failed();
 3b6:	e8 95 ff ff ff       	call   350 <failed>
 3bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop

000003c0 <map_exists>:
void map_exists(struct wmapinfo *info, uint addr, int length, int expected) {
 3c0:	55                   	push   %ebp
    for (int i = 0; i < info->total_mmaps; i++) {
 3c1:	31 c0                	xor    %eax,%eax
void map_exists(struct wmapinfo *info, uint addr, int length, int expected) {
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	56                   	push   %esi
 3c6:	8b 55 08             	mov    0x8(%ebp),%edx
 3c9:	8b 75 10             	mov    0x10(%ebp),%esi
 3cc:	53                   	push   %ebx
 3cd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    for (int i = 0; i < info->total_mmaps; i++) {
 3d0:	8b 0a                	mov    (%edx),%ecx
 3d2:	85 c9                	test   %ecx,%ecx
 3d4:	7f 11                	jg     3e7 <map_exists+0x27>
 3d6:	eb 20                	jmp    3f8 <map_exists+0x38>
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop
 3e0:	83 c0 01             	add    $0x1,%eax
 3e3:	39 c8                	cmp    %ecx,%eax
 3e5:	74 21                	je     408 <map_exists+0x48>
        if (info->addr[i] == addr && info->length[i] == length) {
 3e7:	39 5c 82 04          	cmp    %ebx,0x4(%edx,%eax,4)
 3eb:	75 f3                	jne    3e0 <map_exists+0x20>
 3ed:	39 74 82 44          	cmp    %esi,0x44(%edx,%eax,4)
 3f1:	75 ed                	jne    3e0 <map_exists+0x20>
            found = 1;
 3f3:	b8 01 00 00 00       	mov    $0x1,%eax
    if (found != expected) {
 3f8:	3b 45 14             	cmp    0x14(%ebp),%eax
 3fb:	75 0f                	jne    40c <map_exists+0x4c>
}
 3fd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 400:	5b                   	pop    %ebx
 401:	5e                   	pop    %esi
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int found = 0;
 408:	31 c0                	xor    %eax,%eax
 40a:	eb ec                	jmp    3f8 <map_exists+0x38>
        printf(1, "Cause: expected 0x%x with length %d to %s in the list of maps\n", addr, length, expected ? "exist" : "not exist");
 40c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 410:	ba 5b 0c 00 00       	mov    $0xc5b,%edx
 415:	b8 5f 0c 00 00       	mov    $0xc5f,%eax
 41a:	0f 44 c2             	cmove  %edx,%eax
 41d:	83 ec 0c             	sub    $0xc,%esp
 420:	50                   	push   %eax
 421:	56                   	push   %esi
 422:	53                   	push   %ebx
 423:	68 0c 0d 00 00       	push   $0xd0c
 428:	6a 01                	push   $0x1
 42a:	e8 e1 04 00 00       	call   910 <printf>
        failed();
 42f:	83 c4 20             	add    $0x20,%esp
 432:	e8 19 ff ff ff       	call   350 <failed>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax

00000440 <get_n_validate_pgdirinfo>:
void get_n_validate_pgdirinfo(struct pgdirinfo *info) {
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	53                   	push   %ebx
 444:	83 ec 10             	sub    $0x10,%esp
 447:	8b 5d 08             	mov    0x8(%ebp),%ebx
    info->n_upages = -1;
 44a:	c7 03 ff ff ff ff    	movl   $0xffffffff,(%ebx)
    int ret = getpgdirinfo(info);
 450:	53                   	push   %ebx
 451:	e8 f5 03 00 00       	call   84b <getpgdirinfo>
    if (ret < 0) {
 456:	83 c4 10             	add    $0x10,%esp
 459:	85 c0                	test   %eax,%eax
 45b:	78 51                	js     4ae <get_n_validate_pgdirinfo+0x6e>
    if (info->n_upages < 1) {
 45d:	8b 0b                	mov    (%ebx),%ecx
 45f:	85 c9                	test   %ecx,%ecx
 461:	74 37                	je     49a <get_n_validate_pgdirinfo+0x5a>
    for (int i = 0; i < info->n_upages; i++) {
 463:	31 c0                	xor    %eax,%eax
 465:	8d 76 00             	lea    0x0(%esi),%esi
        if (info->va[i] < 0 || info->va[i] >= KERNBASE) {
 468:	8b 54 83 04          	mov    0x4(%ebx,%eax,4),%edx
 46c:	85 d2                	test   %edx,%edx
 46e:	78 0c                	js     47c <get_n_validate_pgdirinfo+0x3c>
    for (int i = 0; i < info->n_upages; i++) {
 470:	83 c0 01             	add    $0x1,%eax
 473:	39 c1                	cmp    %eax,%ecx
 475:	75 f1                	jne    468 <get_n_validate_pgdirinfo+0x28>
}
 477:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 47a:	c9                   	leave  
 47b:	c3                   	ret    
            printf(1, "Cause: `info.va[%d]` is 0x%x. It should be within [0, 0x%x)\n", i, info->va[i], KERNBASE);
 47c:	83 ec 0c             	sub    $0xc,%esp
 47f:	68 00 00 00 80       	push   $0x80000000
 484:	52                   	push   %edx
 485:	50                   	push   %eax
 486:	68 a0 0d 00 00       	push   $0xda0
 48b:	6a 01                	push   $0x1
 48d:	e8 7e 04 00 00       	call   910 <printf>
            failed();
 492:	83 c4 20             	add    $0x20,%esp
 495:	e8 b6 fe ff ff       	call   350 <failed>
        printf(1, "Cause: At least one user page expected.\n", info->n_upages);
 49a:	50                   	push   %eax
 49b:	6a 00                	push   $0x0
 49d:	68 74 0d 00 00       	push   $0xd74
 4a2:	6a 01                	push   $0x1
 4a4:	e8 67 04 00 00       	call   910 <printf>
        failed();
 4a9:	e8 a2 fe ff ff       	call   350 <failed>
        printf(1, "Cause: `getpgdirinfo()` returned %d\n", ret);
 4ae:	52                   	push   %edx
 4af:	50                   	push   %eax
 4b0:	68 4c 0d 00 00       	push   $0xd4c
 4b5:	6a 01                	push   $0x1
 4b7:	e8 54 04 00 00       	call   910 <printf>
        failed();
 4bc:	e8 8f fe ff ff       	call   350 <failed>
 4c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cf:	90                   	nop

000004d0 <va_exists>:
void va_exists(struct pgdirinfo *info, uint va, int expected) {
 4d0:	55                   	push   %ebp
    for (int i = 0; i < info->n_upages; i++) {
 4d1:	31 c0                	xor    %eax,%eax
void va_exists(struct pgdirinfo *info, uint va, int expected) {
 4d3:	89 e5                	mov    %esp,%ebp
 4d5:	53                   	push   %ebx
 4d6:	83 ec 04             	sub    $0x4,%esp
 4d9:	8b 55 08             	mov    0x8(%ebp),%edx
 4dc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    for (int i = 0; i < info->n_upages; i++) {
 4df:	8b 0a                	mov    (%edx),%ecx
 4e1:	85 c9                	test   %ecx,%ecx
 4e3:	75 12                	jne    4f7 <va_exists+0x27>
 4e5:	eb 1b                	jmp    502 <va_exists+0x32>
 4e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ee:	66 90                	xchg   %ax,%ax
 4f0:	83 c0 01             	add    $0x1,%eax
 4f3:	39 c1                	cmp    %eax,%ecx
 4f5:	74 19                	je     510 <va_exists+0x40>
        if (info->va[i] == va) {
 4f7:	39 5c 82 04          	cmp    %ebx,0x4(%edx,%eax,4)
 4fb:	75 f3                	jne    4f0 <va_exists+0x20>
            found = 1;
 4fd:	b8 01 00 00 00       	mov    $0x1,%eax
    if (found != expected) {
 502:	3b 45 10             	cmp    0x10(%ebp),%eax
 505:	75 0d                	jne    514 <va_exists+0x44>
}
 507:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 50a:	c9                   	leave  
 50b:	c3                   	ret    
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int found = 0;
 510:	31 c0                	xor    %eax,%eax
 512:	eb ee                	jmp    502 <va_exists+0x32>
        printf(1, "Cause: expected Virt.Addr. 0x%x to %s in the list of user pages\n", va, expected ? "exist" : "not exist");
 514:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 518:	ba 5b 0c 00 00       	mov    $0xc5b,%edx
 51d:	b8 5f 0c 00 00       	mov    $0xc5f,%eax
 522:	0f 44 c2             	cmove  %edx,%eax
 525:	50                   	push   %eax
 526:	53                   	push   %ebx
 527:	68 e0 0d 00 00       	push   $0xde0
 52c:	6a 01                	push   $0x1
 52e:	e8 dd 03 00 00       	call   910 <printf>
        failed();
 533:	e8 18 fe ff ff       	call   350 <failed>
 538:	66 90                	xchg   %ax,%ax
 53a:	66 90                	xchg   %ax,%ax
 53c:	66 90                	xchg   %ax,%ax
 53e:	66 90                	xchg   %ax,%ax

00000540 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 540:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 541:	31 c0                	xor    %eax,%eax
{
 543:	89 e5                	mov    %esp,%ebp
 545:	53                   	push   %ebx
 546:	8b 4d 08             	mov    0x8(%ebp),%ecx
 549:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 550:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 554:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 557:	83 c0 01             	add    $0x1,%eax
 55a:	84 d2                	test   %dl,%dl
 55c:	75 f2                	jne    550 <strcpy+0x10>
    ;
  return os;
}
 55e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 561:	89 c8                	mov    %ecx,%eax
 563:	c9                   	leave  
 564:	c3                   	ret    
 565:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000570 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	53                   	push   %ebx
 574:	8b 55 08             	mov    0x8(%ebp),%edx
 577:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 57a:	0f b6 02             	movzbl (%edx),%eax
 57d:	84 c0                	test   %al,%al
 57f:	75 17                	jne    598 <strcmp+0x28>
 581:	eb 3a                	jmp    5bd <strcmp+0x4d>
 583:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 587:	90                   	nop
 588:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 58c:	83 c2 01             	add    $0x1,%edx
 58f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 592:	84 c0                	test   %al,%al
 594:	74 1a                	je     5b0 <strcmp+0x40>
    p++, q++;
 596:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 598:	0f b6 19             	movzbl (%ecx),%ebx
 59b:	38 c3                	cmp    %al,%bl
 59d:	74 e9                	je     588 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 59f:	29 d8                	sub    %ebx,%eax
}
 5a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5a4:	c9                   	leave  
 5a5:	c3                   	ret    
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 5b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 5b4:	31 c0                	xor    %eax,%eax
 5b6:	29 d8                	sub    %ebx,%eax
}
 5b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5bb:	c9                   	leave  
 5bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 5bd:	0f b6 19             	movzbl (%ecx),%ebx
 5c0:	31 c0                	xor    %eax,%eax
 5c2:	eb db                	jmp    59f <strcmp+0x2f>
 5c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop

000005d0 <strlen>:

uint
strlen(const char *s)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 5d6:	80 3a 00             	cmpb   $0x0,(%edx)
 5d9:	74 15                	je     5f0 <strlen+0x20>
 5db:	31 c0                	xor    %eax,%eax
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
 5e0:	83 c0 01             	add    $0x1,%eax
 5e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 5e7:	89 c1                	mov    %eax,%ecx
 5e9:	75 f5                	jne    5e0 <strlen+0x10>
    ;
  return n;
}
 5eb:	89 c8                	mov    %ecx,%eax
 5ed:	5d                   	pop    %ebp
 5ee:	c3                   	ret    
 5ef:	90                   	nop
  for(n = 0; s[n]; n++)
 5f0:	31 c9                	xor    %ecx,%ecx
}
 5f2:	5d                   	pop    %ebp
 5f3:	89 c8                	mov    %ecx,%eax
 5f5:	c3                   	ret    
 5f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi

00000600 <memset>:

void*
memset(void *dst, int c, uint n)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 607:	8b 4d 10             	mov    0x10(%ebp),%ecx
 60a:	8b 45 0c             	mov    0xc(%ebp),%eax
 60d:	89 d7                	mov    %edx,%edi
 60f:	fc                   	cld    
 610:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 612:	8b 7d fc             	mov    -0x4(%ebp),%edi
 615:	89 d0                	mov    %edx,%eax
 617:	c9                   	leave  
 618:	c3                   	ret    
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000620 <strchr>:

char*
strchr(const char *s, char c)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	8b 45 08             	mov    0x8(%ebp),%eax
 626:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 62a:	0f b6 10             	movzbl (%eax),%edx
 62d:	84 d2                	test   %dl,%dl
 62f:	75 12                	jne    643 <strchr+0x23>
 631:	eb 1d                	jmp    650 <strchr+0x30>
 633:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 637:	90                   	nop
 638:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 63c:	83 c0 01             	add    $0x1,%eax
 63f:	84 d2                	test   %dl,%dl
 641:	74 0d                	je     650 <strchr+0x30>
    if(*s == c)
 643:	38 d1                	cmp    %dl,%cl
 645:	75 f1                	jne    638 <strchr+0x18>
      return (char*)s;
  return 0;
}
 647:	5d                   	pop    %ebp
 648:	c3                   	ret    
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 650:	31 c0                	xor    %eax,%eax
}
 652:	5d                   	pop    %ebp
 653:	c3                   	ret    
 654:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop

00000660 <gets>:

char*
gets(char *buf, int max)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 665:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 668:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 669:	31 db                	xor    %ebx,%ebx
{
 66b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 66e:	eb 27                	jmp    697 <gets+0x37>
    cc = read(0, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	6a 01                	push   $0x1
 675:	57                   	push   %edi
 676:	6a 00                	push   $0x0
 678:	e8 2e 01 00 00       	call   7ab <read>
    if(cc < 1)
 67d:	83 c4 10             	add    $0x10,%esp
 680:	85 c0                	test   %eax,%eax
 682:	7e 1d                	jle    6a1 <gets+0x41>
      break;
    buf[i++] = c;
 684:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 688:	8b 55 08             	mov    0x8(%ebp),%edx
 68b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 68f:	3c 0a                	cmp    $0xa,%al
 691:	74 1d                	je     6b0 <gets+0x50>
 693:	3c 0d                	cmp    $0xd,%al
 695:	74 19                	je     6b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 697:	89 de                	mov    %ebx,%esi
 699:	83 c3 01             	add    $0x1,%ebx
 69c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 69f:	7c cf                	jl     670 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 6a1:	8b 45 08             	mov    0x8(%ebp),%eax
 6a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 6a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ab:	5b                   	pop    %ebx
 6ac:	5e                   	pop    %esi
 6ad:	5f                   	pop    %edi
 6ae:	5d                   	pop    %ebp
 6af:	c3                   	ret    
  buf[i] = '\0';
 6b0:	8b 45 08             	mov    0x8(%ebp),%eax
 6b3:	89 de                	mov    %ebx,%esi
 6b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 6b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bc:	5b                   	pop    %ebx
 6bd:	5e                   	pop    %esi
 6be:	5f                   	pop    %edi
 6bf:	5d                   	pop    %ebp
 6c0:	c3                   	ret    
 6c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop

000006d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	56                   	push   %esi
 6d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6d5:	83 ec 08             	sub    $0x8,%esp
 6d8:	6a 00                	push   $0x0
 6da:	ff 75 08             	push   0x8(%ebp)
 6dd:	e8 f1 00 00 00       	call   7d3 <open>
  if(fd < 0)
 6e2:	83 c4 10             	add    $0x10,%esp
 6e5:	85 c0                	test   %eax,%eax
 6e7:	78 27                	js     710 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 6e9:	83 ec 08             	sub    $0x8,%esp
 6ec:	ff 75 0c             	push   0xc(%ebp)
 6ef:	89 c3                	mov    %eax,%ebx
 6f1:	50                   	push   %eax
 6f2:	e8 f4 00 00 00       	call   7eb <fstat>
  close(fd);
 6f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 6fa:	89 c6                	mov    %eax,%esi
  close(fd);
 6fc:	e8 ba 00 00 00       	call   7bb <close>
  return r;
 701:	83 c4 10             	add    $0x10,%esp
}
 704:	8d 65 f8             	lea    -0x8(%ebp),%esp
 707:	89 f0                	mov    %esi,%eax
 709:	5b                   	pop    %ebx
 70a:	5e                   	pop    %esi
 70b:	5d                   	pop    %ebp
 70c:	c3                   	ret    
 70d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 710:	be ff ff ff ff       	mov    $0xffffffff,%esi
 715:	eb ed                	jmp    704 <stat+0x34>
 717:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71e:	66 90                	xchg   %ax,%ax

00000720 <atoi>:

int
atoi(const char *s)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	53                   	push   %ebx
 724:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 727:	0f be 02             	movsbl (%edx),%eax
 72a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 72d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 730:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 735:	77 1e                	ja     755 <atoi+0x35>
 737:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 740:	83 c2 01             	add    $0x1,%edx
 743:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 746:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 74a:	0f be 02             	movsbl (%edx),%eax
 74d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 750:	80 fb 09             	cmp    $0x9,%bl
 753:	76 eb                	jbe    740 <atoi+0x20>
  return n;
}
 755:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 758:	89 c8                	mov    %ecx,%eax
 75a:	c9                   	leave  
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000760 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	8b 45 10             	mov    0x10(%ebp),%eax
 767:	8b 55 08             	mov    0x8(%ebp),%edx
 76a:	56                   	push   %esi
 76b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 76e:	85 c0                	test   %eax,%eax
 770:	7e 13                	jle    785 <memmove+0x25>
 772:	01 d0                	add    %edx,%eax
  dst = vdst;
 774:	89 d7                	mov    %edx,%edi
 776:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 780:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 781:	39 f8                	cmp    %edi,%eax
 783:	75 fb                	jne    780 <memmove+0x20>
  return vdst;
}
 785:	5e                   	pop    %esi
 786:	89 d0                	mov    %edx,%eax
 788:	5f                   	pop    %edi
 789:	5d                   	pop    %ebp
 78a:	c3                   	ret    

0000078b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 78b:	b8 01 00 00 00       	mov    $0x1,%eax
 790:	cd 40                	int    $0x40
 792:	c3                   	ret    

00000793 <exit>:
SYSCALL(exit)
 793:	b8 02 00 00 00       	mov    $0x2,%eax
 798:	cd 40                	int    $0x40
 79a:	c3                   	ret    

0000079b <wait>:
SYSCALL(wait)
 79b:	b8 03 00 00 00       	mov    $0x3,%eax
 7a0:	cd 40                	int    $0x40
 7a2:	c3                   	ret    

000007a3 <pipe>:
SYSCALL(pipe)
 7a3:	b8 04 00 00 00       	mov    $0x4,%eax
 7a8:	cd 40                	int    $0x40
 7aa:	c3                   	ret    

000007ab <read>:
SYSCALL(read)
 7ab:	b8 05 00 00 00       	mov    $0x5,%eax
 7b0:	cd 40                	int    $0x40
 7b2:	c3                   	ret    

000007b3 <write>:
SYSCALL(write)
 7b3:	b8 10 00 00 00       	mov    $0x10,%eax
 7b8:	cd 40                	int    $0x40
 7ba:	c3                   	ret    

000007bb <close>:
SYSCALL(close)
 7bb:	b8 15 00 00 00       	mov    $0x15,%eax
 7c0:	cd 40                	int    $0x40
 7c2:	c3                   	ret    

000007c3 <kill>:
SYSCALL(kill)
 7c3:	b8 06 00 00 00       	mov    $0x6,%eax
 7c8:	cd 40                	int    $0x40
 7ca:	c3                   	ret    

000007cb <exec>:
SYSCALL(exec)
 7cb:	b8 07 00 00 00       	mov    $0x7,%eax
 7d0:	cd 40                	int    $0x40
 7d2:	c3                   	ret    

000007d3 <open>:
SYSCALL(open)
 7d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 7d8:	cd 40                	int    $0x40
 7da:	c3                   	ret    

000007db <mknod>:
SYSCALL(mknod)
 7db:	b8 11 00 00 00       	mov    $0x11,%eax
 7e0:	cd 40                	int    $0x40
 7e2:	c3                   	ret    

000007e3 <unlink>:
SYSCALL(unlink)
 7e3:	b8 12 00 00 00       	mov    $0x12,%eax
 7e8:	cd 40                	int    $0x40
 7ea:	c3                   	ret    

000007eb <fstat>:
SYSCALL(fstat)
 7eb:	b8 08 00 00 00       	mov    $0x8,%eax
 7f0:	cd 40                	int    $0x40
 7f2:	c3                   	ret    

000007f3 <link>:
SYSCALL(link)
 7f3:	b8 13 00 00 00       	mov    $0x13,%eax
 7f8:	cd 40                	int    $0x40
 7fa:	c3                   	ret    

000007fb <mkdir>:
SYSCALL(mkdir)
 7fb:	b8 14 00 00 00       	mov    $0x14,%eax
 800:	cd 40                	int    $0x40
 802:	c3                   	ret    

00000803 <chdir>:
SYSCALL(chdir)
 803:	b8 09 00 00 00       	mov    $0x9,%eax
 808:	cd 40                	int    $0x40
 80a:	c3                   	ret    

0000080b <dup>:
SYSCALL(dup)
 80b:	b8 0a 00 00 00       	mov    $0xa,%eax
 810:	cd 40                	int    $0x40
 812:	c3                   	ret    

00000813 <getpid>:
SYSCALL(getpid)
 813:	b8 0b 00 00 00       	mov    $0xb,%eax
 818:	cd 40                	int    $0x40
 81a:	c3                   	ret    

0000081b <sbrk>:
SYSCALL(sbrk)
 81b:	b8 0c 00 00 00       	mov    $0xc,%eax
 820:	cd 40                	int    $0x40
 822:	c3                   	ret    

00000823 <sleep>:
SYSCALL(sleep)
 823:	b8 0d 00 00 00       	mov    $0xd,%eax
 828:	cd 40                	int    $0x40
 82a:	c3                   	ret    

0000082b <uptime>:
SYSCALL(uptime)
 82b:	b8 0e 00 00 00       	mov    $0xe,%eax
 830:	cd 40                	int    $0x40
 832:	c3                   	ret    

00000833 <wmap>:
SYSCALL(wmap)
 833:	b8 16 00 00 00       	mov    $0x16,%eax
 838:	cd 40                	int    $0x40
 83a:	c3                   	ret    

0000083b <wunmap>:
SYSCALL(wunmap)
 83b:	b8 17 00 00 00       	mov    $0x17,%eax
 840:	cd 40                	int    $0x40
 842:	c3                   	ret    

00000843 <wremap>:
SYSCALL(wremap)
 843:	b8 18 00 00 00       	mov    $0x18,%eax
 848:	cd 40                	int    $0x40
 84a:	c3                   	ret    

0000084b <getpgdirinfo>:
SYSCALL(getpgdirinfo)
 84b:	b8 19 00 00 00       	mov    $0x19,%eax
 850:	cd 40                	int    $0x40
 852:	c3                   	ret    

00000853 <getwmapinfo>:
SYSCALL(getwmapinfo)
 853:	b8 1a 00 00 00       	mov    $0x1a,%eax
 858:	cd 40                	int    $0x40
 85a:	c3                   	ret    
 85b:	66 90                	xchg   %ax,%ax
 85d:	66 90                	xchg   %ax,%ax
 85f:	90                   	nop

00000860 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	57                   	push   %edi
 864:	56                   	push   %esi
 865:	53                   	push   %ebx
 866:	83 ec 3c             	sub    $0x3c,%esp
 869:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 86c:	89 d1                	mov    %edx,%ecx
{
 86e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 871:	85 d2                	test   %edx,%edx
 873:	0f 89 7f 00 00 00    	jns    8f8 <printint+0x98>
 879:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 87d:	74 79                	je     8f8 <printint+0x98>
    neg = 1;
 87f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 886:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 888:	31 db                	xor    %ebx,%ebx
 88a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 88d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 890:	89 c8                	mov    %ecx,%eax
 892:	31 d2                	xor    %edx,%edx
 894:	89 cf                	mov    %ecx,%edi
 896:	f7 75 c4             	divl   -0x3c(%ebp)
 899:	0f b6 92 0c 10 00 00 	movzbl 0x100c(%edx),%edx
 8a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8a3:	89 d8                	mov    %ebx,%eax
 8a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 8b1:	76 dd                	jbe    890 <printint+0x30>
  if(neg)
 8b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 8b6:	85 c9                	test   %ecx,%ecx
 8b8:	74 0c                	je     8c6 <printint+0x66>
    buf[i++] = '-';
 8ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 8bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 8c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 8c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 8c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 8cd:	eb 07                	jmp    8d6 <printint+0x76>
 8cf:	90                   	nop
    putc(fd, buf[i]);
 8d0:	0f b6 13             	movzbl (%ebx),%edx
 8d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 8d6:	83 ec 04             	sub    $0x4,%esp
 8d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 8dc:	6a 01                	push   $0x1
 8de:	56                   	push   %esi
 8df:	57                   	push   %edi
 8e0:	e8 ce fe ff ff       	call   7b3 <write>
  while(--i >= 0)
 8e5:	83 c4 10             	add    $0x10,%esp
 8e8:	39 de                	cmp    %ebx,%esi
 8ea:	75 e4                	jne    8d0 <printint+0x70>
}
 8ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ef:	5b                   	pop    %ebx
 8f0:	5e                   	pop    %esi
 8f1:	5f                   	pop    %edi
 8f2:	5d                   	pop    %ebp
 8f3:	c3                   	ret    
 8f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 8f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 8ff:	eb 87                	jmp    888 <printint+0x28>
 901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 908:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90f:	90                   	nop

00000910 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 919:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 91c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 91f:	0f b6 13             	movzbl (%ebx),%edx
 922:	84 d2                	test   %dl,%dl
 924:	74 6a                	je     990 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 926:	8d 45 10             	lea    0x10(%ebp),%eax
 929:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 92c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 92f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 931:	89 45 d0             	mov    %eax,-0x30(%ebp)
 934:	eb 36                	jmp    96c <printf+0x5c>
 936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93d:	8d 76 00             	lea    0x0(%esi),%esi
 940:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 943:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 948:	83 f8 25             	cmp    $0x25,%eax
 94b:	74 15                	je     962 <printf+0x52>
  write(fd, &c, 1);
 94d:	83 ec 04             	sub    $0x4,%esp
 950:	88 55 e7             	mov    %dl,-0x19(%ebp)
 953:	6a 01                	push   $0x1
 955:	57                   	push   %edi
 956:	56                   	push   %esi
 957:	e8 57 fe ff ff       	call   7b3 <write>
 95c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 95f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 962:	0f b6 13             	movzbl (%ebx),%edx
 965:	83 c3 01             	add    $0x1,%ebx
 968:	84 d2                	test   %dl,%dl
 96a:	74 24                	je     990 <printf+0x80>
    c = fmt[i] & 0xff;
 96c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 96f:	85 c9                	test   %ecx,%ecx
 971:	74 cd                	je     940 <printf+0x30>
      }
    } else if(state == '%'){
 973:	83 f9 25             	cmp    $0x25,%ecx
 976:	75 ea                	jne    962 <printf+0x52>
      if(c == 'd'){
 978:	83 f8 25             	cmp    $0x25,%eax
 97b:	0f 84 07 01 00 00    	je     a88 <printf+0x178>
 981:	83 e8 63             	sub    $0x63,%eax
 984:	83 f8 15             	cmp    $0x15,%eax
 987:	77 17                	ja     9a0 <printf+0x90>
 989:	ff 24 85 b4 0f 00 00 	jmp    *0xfb4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 990:	8d 65 f4             	lea    -0xc(%ebp),%esp
 993:	5b                   	pop    %ebx
 994:	5e                   	pop    %esi
 995:	5f                   	pop    %edi
 996:	5d                   	pop    %ebp
 997:	c3                   	ret    
 998:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99f:	90                   	nop
  write(fd, &c, 1);
 9a0:	83 ec 04             	sub    $0x4,%esp
 9a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 9a6:	6a 01                	push   $0x1
 9a8:	57                   	push   %edi
 9a9:	56                   	push   %esi
 9aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9ae:	e8 00 fe ff ff       	call   7b3 <write>
        putc(fd, c);
 9b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 9b7:	83 c4 0c             	add    $0xc,%esp
 9ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 9bd:	6a 01                	push   $0x1
 9bf:	57                   	push   %edi
 9c0:	56                   	push   %esi
 9c1:	e8 ed fd ff ff       	call   7b3 <write>
        putc(fd, c);
 9c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9c9:	31 c9                	xor    %ecx,%ecx
 9cb:	eb 95                	jmp    962 <printf+0x52>
 9cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 9d0:	83 ec 0c             	sub    $0xc,%esp
 9d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9d8:	6a 00                	push   $0x0
 9da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9dd:	8b 10                	mov    (%eax),%edx
 9df:	89 f0                	mov    %esi,%eax
 9e1:	e8 7a fe ff ff       	call   860 <printint>
        ap++;
 9e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 9ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9ed:	31 c9                	xor    %ecx,%ecx
 9ef:	e9 6e ff ff ff       	jmp    962 <printf+0x52>
 9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 9f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9fb:	8b 10                	mov    (%eax),%edx
        ap++;
 9fd:	83 c0 04             	add    $0x4,%eax
 a00:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a03:	85 d2                	test   %edx,%edx
 a05:	0f 84 8d 00 00 00    	je     a98 <printf+0x188>
        while(*s != 0){
 a0b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 a0e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 a10:	84 c0                	test   %al,%al
 a12:	0f 84 4a ff ff ff    	je     962 <printf+0x52>
 a18:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 a1b:	89 d3                	mov    %edx,%ebx
 a1d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 a20:	83 ec 04             	sub    $0x4,%esp
          s++;
 a23:	83 c3 01             	add    $0x1,%ebx
 a26:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a29:	6a 01                	push   $0x1
 a2b:	57                   	push   %edi
 a2c:	56                   	push   %esi
 a2d:	e8 81 fd ff ff       	call   7b3 <write>
        while(*s != 0){
 a32:	0f b6 03             	movzbl (%ebx),%eax
 a35:	83 c4 10             	add    $0x10,%esp
 a38:	84 c0                	test   %al,%al
 a3a:	75 e4                	jne    a20 <printf+0x110>
      state = 0;
 a3c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 a3f:	31 c9                	xor    %ecx,%ecx
 a41:	e9 1c ff ff ff       	jmp    962 <printf+0x52>
 a46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a4d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a50:	83 ec 0c             	sub    $0xc,%esp
 a53:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a58:	6a 01                	push   $0x1
 a5a:	e9 7b ff ff ff       	jmp    9da <printf+0xca>
 a5f:	90                   	nop
        putc(fd, *ap);
 a60:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 a63:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a66:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 a68:	6a 01                	push   $0x1
 a6a:	57                   	push   %edi
 a6b:	56                   	push   %esi
        putc(fd, *ap);
 a6c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a6f:	e8 3f fd ff ff       	call   7b3 <write>
        ap++;
 a74:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 a78:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a7b:	31 c9                	xor    %ecx,%ecx
 a7d:	e9 e0 fe ff ff       	jmp    962 <printf+0x52>
 a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 a88:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 a8b:	83 ec 04             	sub    $0x4,%esp
 a8e:	e9 2a ff ff ff       	jmp    9bd <printf+0xad>
 a93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a97:	90                   	nop
          s = "(null)";
 a98:	ba aa 0f 00 00       	mov    $0xfaa,%edx
        while(*s != 0){
 a9d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 aa0:	b8 28 00 00 00       	mov    $0x28,%eax
 aa5:	89 d3                	mov    %edx,%ebx
 aa7:	e9 74 ff ff ff       	jmp    a20 <printf+0x110>
 aac:	66 90                	xchg   %ax,%ax
 aae:	66 90                	xchg   %ax,%ax

00000ab0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ab0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab1:	a1 a0 13 00 00       	mov    0x13a0,%eax
{
 ab6:	89 e5                	mov    %esp,%ebp
 ab8:	57                   	push   %edi
 ab9:	56                   	push   %esi
 aba:	53                   	push   %ebx
 abb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 abe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ac8:	89 c2                	mov    %eax,%edx
 aca:	8b 00                	mov    (%eax),%eax
 acc:	39 ca                	cmp    %ecx,%edx
 ace:	73 30                	jae    b00 <free+0x50>
 ad0:	39 c1                	cmp    %eax,%ecx
 ad2:	72 04                	jb     ad8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ad4:	39 c2                	cmp    %eax,%edx
 ad6:	72 f0                	jb     ac8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ad8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 adb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ade:	39 f8                	cmp    %edi,%eax
 ae0:	74 30                	je     b12 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 ae2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 ae5:	8b 42 04             	mov    0x4(%edx),%eax
 ae8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 aeb:	39 f1                	cmp    %esi,%ecx
 aed:	74 3a                	je     b29 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 aef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 af1:	5b                   	pop    %ebx
  freep = p;
 af2:	89 15 a0 13 00 00    	mov    %edx,0x13a0
}
 af8:	5e                   	pop    %esi
 af9:	5f                   	pop    %edi
 afa:	5d                   	pop    %ebp
 afb:	c3                   	ret    
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b00:	39 c2                	cmp    %eax,%edx
 b02:	72 c4                	jb     ac8 <free+0x18>
 b04:	39 c1                	cmp    %eax,%ecx
 b06:	73 c0                	jae    ac8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 b08:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b0b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b0e:	39 f8                	cmp    %edi,%eax
 b10:	75 d0                	jne    ae2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 b12:	03 70 04             	add    0x4(%eax),%esi
 b15:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b18:	8b 02                	mov    (%edx),%eax
 b1a:	8b 00                	mov    (%eax),%eax
 b1c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 b1f:	8b 42 04             	mov    0x4(%edx),%eax
 b22:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 b25:	39 f1                	cmp    %esi,%ecx
 b27:	75 c6                	jne    aef <free+0x3f>
    p->s.size += bp->s.size;
 b29:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 b2c:	89 15 a0 13 00 00    	mov    %edx,0x13a0
    p->s.size += bp->s.size;
 b32:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 b35:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 b38:	89 0a                	mov    %ecx,(%edx)
}
 b3a:	5b                   	pop    %ebx
 b3b:	5e                   	pop    %esi
 b3c:	5f                   	pop    %edi
 b3d:	5d                   	pop    %ebp
 b3e:	c3                   	ret    
 b3f:	90                   	nop

00000b40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	57                   	push   %edi
 b44:	56                   	push   %esi
 b45:	53                   	push   %ebx
 b46:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b49:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b4c:	8b 3d a0 13 00 00    	mov    0x13a0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b52:	8d 70 07             	lea    0x7(%eax),%esi
 b55:	c1 ee 03             	shr    $0x3,%esi
 b58:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b5b:	85 ff                	test   %edi,%edi
 b5d:	0f 84 9d 00 00 00    	je     c00 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b63:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 b65:	8b 4a 04             	mov    0x4(%edx),%ecx
 b68:	39 f1                	cmp    %esi,%ecx
 b6a:	73 6a                	jae    bd6 <malloc+0x96>
 b6c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b71:	39 de                	cmp    %ebx,%esi
 b73:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b76:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 b7d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b80:	eb 17                	jmp    b99 <malloc+0x59>
 b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b88:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b8a:	8b 48 04             	mov    0x4(%eax),%ecx
 b8d:	39 f1                	cmp    %esi,%ecx
 b8f:	73 4f                	jae    be0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b91:	8b 3d a0 13 00 00    	mov    0x13a0,%edi
 b97:	89 c2                	mov    %eax,%edx
 b99:	39 d7                	cmp    %edx,%edi
 b9b:	75 eb                	jne    b88 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 b9d:	83 ec 0c             	sub    $0xc,%esp
 ba0:	ff 75 e4             	push   -0x1c(%ebp)
 ba3:	e8 73 fc ff ff       	call   81b <sbrk>
  if(p == (char*)-1)
 ba8:	83 c4 10             	add    $0x10,%esp
 bab:	83 f8 ff             	cmp    $0xffffffff,%eax
 bae:	74 1c                	je     bcc <malloc+0x8c>
  hp->s.size = nu;
 bb0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 bb3:	83 ec 0c             	sub    $0xc,%esp
 bb6:	83 c0 08             	add    $0x8,%eax
 bb9:	50                   	push   %eax
 bba:	e8 f1 fe ff ff       	call   ab0 <free>
  return freep;
 bbf:	8b 15 a0 13 00 00    	mov    0x13a0,%edx
      if((p = morecore(nunits)) == 0)
 bc5:	83 c4 10             	add    $0x10,%esp
 bc8:	85 d2                	test   %edx,%edx
 bca:	75 bc                	jne    b88 <malloc+0x48>
        return 0;
  }
}
 bcc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bcf:	31 c0                	xor    %eax,%eax
}
 bd1:	5b                   	pop    %ebx
 bd2:	5e                   	pop    %esi
 bd3:	5f                   	pop    %edi
 bd4:	5d                   	pop    %ebp
 bd5:	c3                   	ret    
    if(p->s.size >= nunits){
 bd6:	89 d0                	mov    %edx,%eax
 bd8:	89 fa                	mov    %edi,%edx
 bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 be0:	39 ce                	cmp    %ecx,%esi
 be2:	74 4c                	je     c30 <malloc+0xf0>
        p->s.size -= nunits;
 be4:	29 f1                	sub    %esi,%ecx
 be6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 be9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 bec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 bef:	89 15 a0 13 00 00    	mov    %edx,0x13a0
}
 bf5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 bf8:	83 c0 08             	add    $0x8,%eax
}
 bfb:	5b                   	pop    %ebx
 bfc:	5e                   	pop    %esi
 bfd:	5f                   	pop    %edi
 bfe:	5d                   	pop    %ebp
 bff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 c00:	c7 05 a0 13 00 00 a4 	movl   $0x13a4,0x13a0
 c07:	13 00 00 
    base.s.size = 0;
 c0a:	bf a4 13 00 00       	mov    $0x13a4,%edi
    base.s.ptr = freep = prevp = &base;
 c0f:	c7 05 a4 13 00 00 a4 	movl   $0x13a4,0x13a4
 c16:	13 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c19:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 c1b:	c7 05 a8 13 00 00 00 	movl   $0x0,0x13a8
 c22:	00 00 00 
    if(p->s.size >= nunits){
 c25:	e9 42 ff ff ff       	jmp    b6c <malloc+0x2c>
 c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c30:	8b 08                	mov    (%eax),%ecx
 c32:	89 0a                	mov    %ecx,(%edx)
 c34:	eb b9                	jmp    bef <malloc+0xaf>
