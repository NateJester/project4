
_test_33:     file format elf32-i386


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
  11:	81 ec 7c 04 00 00    	sub    $0x47c,%esp
    printf(1, "\n\n%s\n", test_name);
  17:	ff 35 70 13 00 00    	push   0x1370
  1d:	68 25 0c 00 00       	push   $0xc25
  22:	6a 01                	push   $0x1
  24:	e8 a7 08 00 00       	call   8d0 <printf>

    // validate initial state
    struct wmapinfo winfo1;
    get_n_validate_wmap_info(&winfo1, 0);
  29:	8d 85 94 fb ff ff    	lea    -0x46c(%ebp),%eax
  2f:	5e                   	pop    %esi
  30:	5f                   	pop    %edi
  31:	6a 00                	push   $0x0
  33:	50                   	push   %eax
  34:	e8 f7 02 00 00       	call   330 <get_n_validate_wmap_info>
    //
    // 1. create a anonymous MAP 1 (obstacle to MAP 2's expansion)
    //
    uint map1addr1 = MMAPBASE + PGSIZE * N_PAGES;
    int map1len1 = PGSIZE * N_PAGES;
    uint map1v1 = wmap(map1addr1, map1len1, fixed_anon, fd);
  39:	6a ff                	push   $0xffffffff
  3b:	6a 0d                	push   $0xd
  3d:	68 00 40 00 00       	push   $0x4000
  42:	68 00 40 00 60       	push   $0x60004000
  47:	e8 a7 07 00 00       	call   7f3 <wmap>
    if (map1v1 == FAILED) {
  4c:	83 c4 20             	add    $0x20,%esp
  4f:	83 f8 ff             	cmp    $0xffffffff,%eax
  52:	0f 84 c1 01 00 00    	je     219 <main+0x219>
        printf(1, "Cause: `wmap()` returned 0x%x\n", map1v1);
        failed();
    }
    printf(1, "Map 1 placed at 0x%x (length 0x%x)\n", map1v1, map1len1);
  58:	68 00 40 00 00       	push   $0x4000
  5d:	89 c6                	mov    %eax,%esi
  5f:	50                   	push   %eax
  60:	68 18 0e 00 00       	push   $0xe18
  65:	6a 01                	push   $0x1
  67:	e8 64 08 00 00       	call   8d0 <printf>
    //
    // 2. create another anonymous MAP 2
    //
    uint map2addr1 = map1addr1 - PGSIZE * N_PAGES;
    int map2len1 = PGSIZE * N_PAGES;
    uint map2v1 = wmap(map2addr1, map2len1, fixed_anon, fd);
  6c:	6a ff                	push   $0xffffffff
  6e:	6a 0d                	push   $0xd
  70:	68 00 40 00 00       	push   $0x4000
  75:	68 00 00 00 60       	push   $0x60000000
  7a:	e8 74 07 00 00       	call   7f3 <wmap>
    if (map2v1 == FAILED) {
  7f:	83 c4 20             	add    $0x20,%esp
    uint map2v1 = wmap(map2addr1, map2len1, fixed_anon, fd);
  82:	89 c3                	mov    %eax,%ebx
    if (map2v1 == FAILED) {
  84:	83 f8 ff             	cmp    $0xffffffff,%eax
  87:	0f 84 79 01 00 00    	je     206 <main+0x206>
        printf(1, "\tCause:\tmem2 failed\n");
        failed();
    }
    printf(1, "Map 2 placed at 0x%x (length 0x%x)\n", map2v1, map2len1);
  8d:	68 00 40 00 00       	push   $0x4000
    // validate mid state 1
    struct wmapinfo winfo2;
    get_n_validate_wmap_info(&winfo2, 2);        // 2 maps exist
  92:	8d bd 58 fc ff ff    	lea    -0x3a8(%ebp),%edi
    printf(1, "Map 2 placed at 0x%x (length 0x%x)\n", map2v1, map2len1);
  98:	50                   	push   %eax
  99:	68 3c 0e 00 00       	push   $0xe3c
  9e:	6a 01                	push   $0x1
  a0:	e8 2b 08 00 00       	call   8d0 <printf>
    get_n_validate_wmap_info(&winfo2, 2);        // 2 maps exist
  a5:	58                   	pop    %eax
  a6:	5a                   	pop    %edx
  a7:	6a 02                	push   $0x2
  a9:	57                   	push   %edi
  aa:	e8 81 02 00 00       	call   330 <get_n_validate_wmap_info>
    map_exists(&winfo2, map1v1, map1len1, TRUE); // Map 1 exists
  af:	6a 01                	push   $0x1
  b1:	68 00 40 00 00       	push   $0x4000
  b6:	56                   	push   %esi
  b7:	57                   	push   %edi
  b8:	e8 c3 02 00 00       	call   380 <map_exists>
  bd:	83 c4 10             	add    $0x10,%esp
    map_exists(&winfo2, map2v1, map2len1, TRUE); // Map 2 exists
  c0:	6a 01                	push   $0x1
  c2:	68 00 40 00 00       	push   $0x4000
  c7:	53                   	push   %ebx
  c8:	57                   	push   %edi
  c9:	e8 b2 02 00 00       	call   380 <map_exists>
    printf(1, "Validated two maps. \tOkay\n");
  ce:	83 c4 18             	add    $0x18,%esp
  d1:	68 40 0c 00 00       	push   $0xc40
  d6:	6a 01                	push   $0x1
  d8:	e8 f3 07 00 00       	call   8d0 <printf>
    // 3. write in the second and third page of MAP 2
    //
    char *arr = (char *)map2v1;
    int value = 'y';
    int offset = PGSIZE;
    for (int i = 0; i < PGSIZE * 2; i++)
  dd:	8d 8b 00 10 00 00    	lea    0x1000(%ebx),%ecx
  e3:	8d 93 00 30 00 00    	lea    0x3000(%ebx),%edx
  e9:	83 c4 10             	add    $0x10,%esp
    printf(1, "Validated two maps. \tOkay\n");
  ec:	89 c8                	mov    %ecx,%eax
  ee:	66 90                	xchg   %ax,%ax
        arr[offset + i] = value;
  f0:	c6 00 79             	movb   $0x79,(%eax)
    for (int i = 0; i < PGSIZE * 2; i++)
  f3:	83 c0 01             	add    $0x1,%eax
  f6:	39 c2                	cmp    %eax,%edx
  f8:	75 f6                	jne    f0 <main+0xf0>
    // validate page in the user pages
    struct pgdirinfo pinfo;
    get_n_validate_pgdirinfo(&pinfo);
  fa:	83 ec 0c             	sub    $0xc,%esp
  fd:	8d bd e0 fd ff ff    	lea    -0x220(%ebp),%edi
 103:	89 8d 84 fb ff ff    	mov    %ecx,-0x47c(%ebp)
 109:	57                   	push   %edi
 10a:	e8 f1 02 00 00       	call   400 <get_n_validate_pgdirinfo>
    va_exists(&pinfo, map2v1 + offset, TRUE);          // second page of Map 2 exists
 10f:	8b 8d 84 fb ff ff    	mov    -0x47c(%ebp),%ecx
 115:	83 c4 0c             	add    $0xc,%esp
 118:	6a 01                	push   $0x1
 11a:	51                   	push   %ecx
 11b:	57                   	push   %edi
 11c:	e8 6f 03 00 00       	call   490 <va_exists>
 121:	83 c4 0c             	add    $0xc,%esp
    va_exists(&pinfo, map2v1 + offset + PGSIZE, TRUE); // third page of Map 2 exists
 124:	8d 83 00 20 00 00    	lea    0x2000(%ebx),%eax
 12a:	6a 01                	push   $0x1
 12c:	50                   	push   %eax
 12d:	57                   	push   %edi
 12e:	e8 5d 03 00 00       	call   490 <va_exists>
 133:	83 c4 0c             	add    $0xc,%esp
    printf(1, "Wrote '%c' at the second and third pages of Map 2. \tOkay\n", value);
 136:	6a 79                	push   $0x79
 138:	68 60 0e 00 00       	push   $0xe60
 13d:	6a 01                	push   $0x1
 13f:	e8 8c 07 00 00       	call   8d0 <printf>

    //
    // 4. expand map2 that requires moving, with moving flag (allow_move)
    //
    int map2len2 = PGSIZE * (N_PAGES + 1);
    uint map2v2 = wremap(map2v1, map2len1, map2len2, allow_move);
 144:	6a 01                	push   $0x1
 146:	68 00 50 00 00       	push   $0x5000
 14b:	68 00 40 00 00       	push   $0x4000
 150:	53                   	push   %ebx
 151:	e8 ad 06 00 00       	call   803 <wremap>
    if (map2v2 == FAILED) {
 156:	83 c4 20             	add    $0x20,%esp
 159:	83 f8 ff             	cmp    $0xffffffff,%eax
 15c:	0f 84 de 00 00 00    	je     240 <main+0x240>
        printf(1, "Cause: `wremap` returned 0x%x\n", map2v2);
        failed();
    }
    if (map2v2 == map2v1) {
 162:	39 c3                	cmp    %eax,%ebx
 164:	0f 84 c3 00 00 00    	je     22d <main+0x22d>
        printf(1, "Cause: Map 2 did not move\n");
        failed();
    }
    // validate final state
    struct wmapinfo winfo3;
    get_n_validate_wmap_info(&winfo3, 2);        // still 2 maps
 16a:	8d bd 1c fd ff ff    	lea    -0x2e4(%ebp),%edi
 170:	89 85 84 fb ff ff    	mov    %eax,-0x47c(%ebp)
 176:	50                   	push   %eax
 177:	50                   	push   %eax
 178:	6a 02                	push   $0x2
 17a:	57                   	push   %edi
 17b:	e8 b0 01 00 00       	call   330 <get_n_validate_wmap_info>
    map_exists(&winfo3, map1v1, map1len1, TRUE); // Map 1 exists
 180:	6a 01                	push   $0x1
 182:	68 00 40 00 00       	push   $0x4000
 187:	56                   	push   %esi
 188:	57                   	push   %edi
 189:	e8 f2 01 00 00       	call   380 <map_exists>
    map_exists(&winfo3, map2v2, map2len2, TRUE); // Map 2 exists but at a different address
 18e:	8b 8d 84 fb ff ff    	mov    -0x47c(%ebp),%ecx
    map_exists(&winfo3, map1v1, map1len1, TRUE); // Map 1 exists
 194:	83 c4 10             	add    $0x10,%esp
    map_exists(&winfo3, map2v2, map2len2, TRUE); // Map 2 exists but at a different address
 197:	6a 01                	push   $0x1
 199:	68 00 50 00 00       	push   $0x5000
 19e:	51                   	push   %ecx
 19f:	57                   	push   %edi
 1a0:	e8 db 01 00 00       	call   380 <map_exists>
 1a5:	83 c4 10             	add    $0x10,%esp
    map_exists(&winfo3, map2v1, map2len1, FALSE);
 1a8:	6a 00                	push   $0x0
 1aa:	68 00 40 00 00       	push   $0x4000
 1af:	53                   	push   %ebx
 1b0:	57                   	push   %edi
 1b1:	e8 ca 01 00 00       	call   380 <map_exists>
    printf(1, "Map 2 moved. \tOkay\n");
 1b6:	83 c4 18             	add    $0x18,%esp
 1b9:	68 76 0c 00 00       	push   $0xc76
 1be:	6a 01                	push   $0x1
 1c0:	e8 0b 07 00 00       	call   8d0 <printf>
 1c5:	8b 8d 84 fb ff ff    	mov    -0x47c(%ebp),%ecx
 1cb:	83 c4 10             	add    $0x10,%esp
 1ce:	b8 00 10 00 00       	mov    $0x1000,%eax
 1d3:	eb 0d                	jmp    1e2 <main+0x1e2>
 1d5:	8d 76 00             	lea    0x0(%esi),%esi

    // check page contents are correct in the moved MAP2
    char *arr2 = (char *)map2v2;
    for (int i = 0; i < PGSIZE; i++) {
 1d8:	83 c0 01             	add    $0x1,%eax
 1db:	3d 00 20 00 00       	cmp    $0x2000,%eax
 1e0:	74 72                	je     254 <main+0x254>
        if (arr2[offset + i] != value) {
 1e2:	0f be 14 08          	movsbl (%eax,%ecx,1),%edx
 1e6:	80 fa 79             	cmp    $0x79,%dl
 1e9:	74 ed                	je     1d8 <main+0x1d8>
            printf(1, "\tCause:\tArr2[%d] = Map2[%x] = %d. Should be %d\n", offset + i, offset + i, arr2[offset + i], value);
 1eb:	57                   	push   %edi
 1ec:	57                   	push   %edi
 1ed:	6a 79                	push   $0x79
 1ef:	52                   	push   %edx
 1f0:	50                   	push   %eax
 1f1:	50                   	push   %eax
 1f2:	68 bc 0e 00 00       	push   $0xebc
 1f7:	6a 01                	push   $0x1
 1f9:	e8 d2 06 00 00       	call   8d0 <printf>
            failed();
 1fe:	83 c4 20             	add    $0x20,%esp
 201:	e8 0a 01 00 00       	call   310 <failed>
        printf(1, "\tCause:\tmem2 failed\n");
 206:	51                   	push   %ecx
 207:	51                   	push   %ecx
 208:	68 2b 0c 00 00       	push   $0xc2b
 20d:	6a 01                	push   $0x1
 20f:	e8 bc 06 00 00       	call   8d0 <printf>
        failed();
 214:	e8 f7 00 00 00       	call   310 <failed>
        printf(1, "Cause: `wmap()` returned 0x%x\n", map1v1);
 219:	53                   	push   %ebx
 21a:	6a ff                	push   $0xffffffff
 21c:	68 f8 0d 00 00       	push   $0xdf8
 221:	6a 01                	push   $0x1
 223:	e8 a8 06 00 00       	call   8d0 <printf>
        failed();
 228:	e8 e3 00 00 00       	call   310 <failed>
        printf(1, "Cause: Map 2 did not move\n");
 22d:	50                   	push   %eax
 22e:	50                   	push   %eax
 22f:	68 5b 0c 00 00       	push   $0xc5b
 234:	6a 01                	push   $0x1
 236:	e8 95 06 00 00       	call   8d0 <printf>
        failed();
 23b:	e8 d0 00 00 00       	call   310 <failed>
        printf(1, "Cause: `wremap` returned 0x%x\n", map2v2);
 240:	50                   	push   %eax
 241:	6a ff                	push   $0xffffffff
 243:	68 9c 0e 00 00       	push   $0xe9c
 248:	6a 01                	push   $0x1
 24a:	e8 81 06 00 00       	call   8d0 <printf>
        failed();
 24f:	e8 bc 00 00 00       	call   310 <failed>
        }
    }
    printf(1, "Page contents in the moved Map 2 are intact. \tOkay\n");
 254:	50                   	push   %eax

    struct pgdirinfo pinfo2;
    get_n_validate_pgdirinfo(&pinfo2);
 255:	8d 9d e4 fe ff ff    	lea    -0x11c(%ebp),%ebx
    printf(1, "Page contents in the moved Map 2 are intact. \tOkay\n");
 25b:	50                   	push   %eax
 25c:	68 ec 0e 00 00       	push   $0xeec
 261:	6a 01                	push   $0x1
 263:	89 8d 84 fb ff ff    	mov    %ecx,-0x47c(%ebp)
 269:	e8 62 06 00 00       	call   8d0 <printf>
    get_n_validate_pgdirinfo(&pinfo2);
 26e:	89 1c 24             	mov    %ebx,(%esp)
 271:	e8 8a 01 00 00       	call   400 <get_n_validate_pgdirinfo>
    // validate the old VA does not exist in the user pages
    va_exists(&pinfo2, map1v1 + offset, FALSE);
 276:	8d 86 00 10 00 00    	lea    0x1000(%esi),%eax
 27c:	83 c4 0c             	add    $0xc,%esp
    va_exists(&pinfo2, map1v1 + offset + PGSIZE, FALSE);
 27f:	81 c6 00 20 00 00    	add    $0x2000,%esi
    va_exists(&pinfo2, map1v1 + offset, FALSE);
 285:	6a 00                	push   $0x0
 287:	50                   	push   %eax
 288:	53                   	push   %ebx
 289:	e8 02 02 00 00       	call   490 <va_exists>
 28e:	83 c4 0c             	add    $0xc,%esp
    va_exists(&pinfo2, map1v1 + offset + PGSIZE, FALSE);
 291:	6a 00                	push   $0x0
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
 295:	e8 f6 01 00 00       	call   490 <va_exists>
 29a:	5a                   	pop    %edx
 29b:	59                   	pop    %ecx
    printf(1, "The old VA does not exist in the user pages. \tOkay\n");
 29c:	68 20 0f 00 00       	push   $0xf20
 2a1:	6a 01                	push   $0x1
 2a3:	e8 28 06 00 00       	call   8d0 <printf>
    // validate the new VA exists in the user pages
    va_exists(&pinfo2, map2v2 + offset, TRUE);
 2a8:	8b 8d 84 fb ff ff    	mov    -0x47c(%ebp),%ecx
 2ae:	83 c4 0c             	add    $0xc,%esp
 2b1:	6a 01                	push   $0x1
 2b3:	8d 81 00 10 00 00    	lea    0x1000(%ecx),%eax
 2b9:	50                   	push   %eax
 2ba:	53                   	push   %ebx
 2bb:	e8 d0 01 00 00       	call   490 <va_exists>
    va_exists(&pinfo2, map2v2 + offset + PGSIZE, TRUE);
 2c0:	8b 8d 84 fb ff ff    	mov    -0x47c(%ebp),%ecx
    va_exists(&pinfo2, map2v2 + offset, TRUE);
 2c6:	83 c4 0c             	add    $0xc,%esp
    va_exists(&pinfo2, map2v2 + offset + PGSIZE, TRUE);
 2c9:	6a 01                	push   $0x1
 2cb:	81 c1 00 20 00 00    	add    $0x2000,%ecx
 2d1:	51                   	push   %ecx
 2d2:	53                   	push   %ebx
 2d3:	e8 b8 01 00 00       	call   490 <va_exists>
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
    printf(1, "The new VA exists in the user pages. \tOkay\n");
 2da:	68 54 0f 00 00       	push   $0xf54
 2df:	6a 01                	push   $0x1
 2e1:	e8 ea 05 00 00       	call   8d0 <printf>

    // test ends
    success();
 2e6:	e8 05 00 00 00       	call   2f0 <success>
 2eb:	66 90                	xchg   %ax,%ax
 2ed:	66 90                	xchg   %ax,%ax
 2ef:	90                   	nop

000002f0 <success>:
void success() {
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\nWMMAP\t SUCCESS\n\n");
 2f6:	68 f8 0b 00 00       	push   $0xbf8
 2fb:	6a 01                	push   $0x1
 2fd:	e8 ce 05 00 00       	call   8d0 <printf>
    exit();
 302:	e8 4c 04 00 00       	call   753 <exit>
 307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30e:	66 90                	xchg   %ax,%ax

00000310 <failed>:
void failed() {
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\nWMMAP\t FAILED\n\n");
 316:	68 0a 0c 00 00       	push   $0xc0a
 31b:	6a 01                	push   $0x1
 31d:	e8 ae 05 00 00       	call   8d0 <printf>
    exit();
 322:	e8 2c 04 00 00       	call   753 <exit>
 327:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32e:	66 90                	xchg   %ax,%ax

00000330 <get_n_validate_wmap_info>:
void get_n_validate_wmap_info(struct wmapinfo *info, int expected_total_mmaps) {
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	83 ec 10             	sub    $0x10,%esp
 337:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int ret = getwmapinfo(info);
 33a:	53                   	push   %ebx
 33b:	e8 d3 04 00 00       	call   813 <getwmapinfo>
    if (ret < 0) {
 340:	83 c4 10             	add    $0x10,%esp
 343:	85 c0                	test   %eax,%eax
 345:	78 0c                	js     353 <get_n_validate_wmap_info+0x23>
    if (info->total_mmaps != expected_total_mmaps) {
 347:	8b 03                	mov    (%ebx),%eax
 349:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34c:	75 18                	jne    366 <get_n_validate_wmap_info+0x36>
}
 34e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 351:	c9                   	leave  
 352:	c3                   	ret    
        printf(1, "Cause: `getwmapinfo()` returned %d\n", ret);
 353:	52                   	push   %edx
 354:	50                   	push   %eax
 355:	68 94 0c 00 00       	push   $0xc94
 35a:	6a 01                	push   $0x1
 35c:	e8 6f 05 00 00       	call   8d0 <printf>
        failed();
 361:	e8 aa ff ff ff       	call   310 <failed>
        printf(1, "Cause: expected %d maps, but found %d\n", expected_total_mmaps, info->total_mmaps);
 366:	50                   	push   %eax
 367:	ff 75 0c             	push   0xc(%ebp)
 36a:	68 b8 0c 00 00       	push   $0xcb8
 36f:	6a 01                	push   $0x1
 371:	e8 5a 05 00 00       	call   8d0 <printf>
        failed();
 376:	e8 95 ff ff ff       	call   310 <failed>
 37b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <map_exists>:
void map_exists(struct wmapinfo *info, uint addr, int length, int expected) {
 380:	55                   	push   %ebp
    for (int i = 0; i < info->total_mmaps; i++) {
 381:	31 c0                	xor    %eax,%eax
void map_exists(struct wmapinfo *info, uint addr, int length, int expected) {
 383:	89 e5                	mov    %esp,%ebp
 385:	56                   	push   %esi
 386:	8b 55 08             	mov    0x8(%ebp),%edx
 389:	8b 75 10             	mov    0x10(%ebp),%esi
 38c:	53                   	push   %ebx
 38d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    for (int i = 0; i < info->total_mmaps; i++) {
 390:	8b 0a                	mov    (%edx),%ecx
 392:	85 c9                	test   %ecx,%ecx
 394:	7f 11                	jg     3a7 <map_exists+0x27>
 396:	eb 20                	jmp    3b8 <map_exists+0x38>
 398:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop
 3a0:	83 c0 01             	add    $0x1,%eax
 3a3:	39 c8                	cmp    %ecx,%eax
 3a5:	74 21                	je     3c8 <map_exists+0x48>
        if (info->addr[i] == addr && info->length[i] == length) {
 3a7:	39 5c 82 04          	cmp    %ebx,0x4(%edx,%eax,4)
 3ab:	75 f3                	jne    3a0 <map_exists+0x20>
 3ad:	39 74 82 44          	cmp    %esi,0x44(%edx,%eax,4)
 3b1:	75 ed                	jne    3a0 <map_exists+0x20>
            found = 1;
 3b3:	b8 01 00 00 00       	mov    $0x1,%eax
    if (found != expected) {
 3b8:	3b 45 14             	cmp    0x14(%ebp),%eax
 3bb:	75 0f                	jne    3cc <map_exists+0x4c>
}
 3bd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3c0:	5b                   	pop    %ebx
 3c1:	5e                   	pop    %esi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int found = 0;
 3c8:	31 c0                	xor    %eax,%eax
 3ca:	eb ec                	jmp    3b8 <map_exists+0x38>
        printf(1, "Cause: expected 0x%x with length %d to %s in the list of maps\n", addr, length, expected ? "exist" : "not exist");
 3cc:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3d0:	ba 1b 0c 00 00       	mov    $0xc1b,%edx
 3d5:	b8 1f 0c 00 00       	mov    $0xc1f,%eax
 3da:	0f 44 c2             	cmove  %edx,%eax
 3dd:	83 ec 0c             	sub    $0xc,%esp
 3e0:	50                   	push   %eax
 3e1:	56                   	push   %esi
 3e2:	53                   	push   %ebx
 3e3:	68 e0 0c 00 00       	push   $0xce0
 3e8:	6a 01                	push   $0x1
 3ea:	e8 e1 04 00 00       	call   8d0 <printf>
        failed();
 3ef:	83 c4 20             	add    $0x20,%esp
 3f2:	e8 19 ff ff ff       	call   310 <failed>
 3f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fe:	66 90                	xchg   %ax,%ax

00000400 <get_n_validate_pgdirinfo>:
void get_n_validate_pgdirinfo(struct pgdirinfo *info) {
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
 404:	83 ec 10             	sub    $0x10,%esp
 407:	8b 5d 08             	mov    0x8(%ebp),%ebx
    info->n_upages = -1;
 40a:	c7 03 ff ff ff ff    	movl   $0xffffffff,(%ebx)
    int ret = getpgdirinfo(info);
 410:	53                   	push   %ebx
 411:	e8 f5 03 00 00       	call   80b <getpgdirinfo>
    if (ret < 0) {
 416:	83 c4 10             	add    $0x10,%esp
 419:	85 c0                	test   %eax,%eax
 41b:	78 51                	js     46e <get_n_validate_pgdirinfo+0x6e>
    if (info->n_upages < 1) {
 41d:	8b 0b                	mov    (%ebx),%ecx
 41f:	85 c9                	test   %ecx,%ecx
 421:	74 37                	je     45a <get_n_validate_pgdirinfo+0x5a>
    for (int i = 0; i < info->n_upages; i++) {
 423:	31 c0                	xor    %eax,%eax
 425:	8d 76 00             	lea    0x0(%esi),%esi
        if (info->va[i] < 0 || info->va[i] >= KERNBASE) {
 428:	8b 54 83 04          	mov    0x4(%ebx,%eax,4),%edx
 42c:	85 d2                	test   %edx,%edx
 42e:	78 0c                	js     43c <get_n_validate_pgdirinfo+0x3c>
    for (int i = 0; i < info->n_upages; i++) {
 430:	83 c0 01             	add    $0x1,%eax
 433:	39 c1                	cmp    %eax,%ecx
 435:	75 f1                	jne    428 <get_n_validate_pgdirinfo+0x28>
}
 437:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 43a:	c9                   	leave  
 43b:	c3                   	ret    
            printf(1, "Cause: `info.va[%d]` is 0x%x. It should be within [0, 0x%x)\n", i, info->va[i], KERNBASE);
 43c:	83 ec 0c             	sub    $0xc,%esp
 43f:	68 00 00 00 80       	push   $0x80000000
 444:	52                   	push   %edx
 445:	50                   	push   %eax
 446:	68 74 0d 00 00       	push   $0xd74
 44b:	6a 01                	push   $0x1
 44d:	e8 7e 04 00 00       	call   8d0 <printf>
            failed();
 452:	83 c4 20             	add    $0x20,%esp
 455:	e8 b6 fe ff ff       	call   310 <failed>
        printf(1, "Cause: At least one user page expected.\n", info->n_upages);
 45a:	50                   	push   %eax
 45b:	6a 00                	push   $0x0
 45d:	68 48 0d 00 00       	push   $0xd48
 462:	6a 01                	push   $0x1
 464:	e8 67 04 00 00       	call   8d0 <printf>
        failed();
 469:	e8 a2 fe ff ff       	call   310 <failed>
        printf(1, "Cause: `getpgdirinfo()` returned %d\n", ret);
 46e:	52                   	push   %edx
 46f:	50                   	push   %eax
 470:	68 20 0d 00 00       	push   $0xd20
 475:	6a 01                	push   $0x1
 477:	e8 54 04 00 00       	call   8d0 <printf>
        failed();
 47c:	e8 8f fe ff ff       	call   310 <failed>
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <va_exists>:
void va_exists(struct pgdirinfo *info, uint va, int expected) {
 490:	55                   	push   %ebp
    for (int i = 0; i < info->n_upages; i++) {
 491:	31 c0                	xor    %eax,%eax
void va_exists(struct pgdirinfo *info, uint va, int expected) {
 493:	89 e5                	mov    %esp,%ebp
 495:	53                   	push   %ebx
 496:	83 ec 04             	sub    $0x4,%esp
 499:	8b 55 08             	mov    0x8(%ebp),%edx
 49c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    for (int i = 0; i < info->n_upages; i++) {
 49f:	8b 0a                	mov    (%edx),%ecx
 4a1:	85 c9                	test   %ecx,%ecx
 4a3:	75 12                	jne    4b7 <va_exists+0x27>
 4a5:	eb 1b                	jmp    4c2 <va_exists+0x32>
 4a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ae:	66 90                	xchg   %ax,%ax
 4b0:	83 c0 01             	add    $0x1,%eax
 4b3:	39 c1                	cmp    %eax,%ecx
 4b5:	74 19                	je     4d0 <va_exists+0x40>
        if (info->va[i] == va) {
 4b7:	39 5c 82 04          	cmp    %ebx,0x4(%edx,%eax,4)
 4bb:	75 f3                	jne    4b0 <va_exists+0x20>
            found = 1;
 4bd:	b8 01 00 00 00       	mov    $0x1,%eax
    if (found != expected) {
 4c2:	3b 45 10             	cmp    0x10(%ebp),%eax
 4c5:	75 0d                	jne    4d4 <va_exists+0x44>
}
 4c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ca:	c9                   	leave  
 4cb:	c3                   	ret    
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int found = 0;
 4d0:	31 c0                	xor    %eax,%eax
 4d2:	eb ee                	jmp    4c2 <va_exists+0x32>
        printf(1, "Cause: expected Virt.Addr. 0x%x to %s in the list of user pages\n", va, expected ? "exist" : "not exist");
 4d4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 4d8:	ba 1b 0c 00 00       	mov    $0xc1b,%edx
 4dd:	b8 1f 0c 00 00       	mov    $0xc1f,%eax
 4e2:	0f 44 c2             	cmove  %edx,%eax
 4e5:	50                   	push   %eax
 4e6:	53                   	push   %ebx
 4e7:	68 b4 0d 00 00       	push   $0xdb4
 4ec:	6a 01                	push   $0x1
 4ee:	e8 dd 03 00 00       	call   8d0 <printf>
        failed();
 4f3:	e8 18 fe ff ff       	call   310 <failed>
 4f8:	66 90                	xchg   %ax,%ax
 4fa:	66 90                	xchg   %ax,%ax
 4fc:	66 90                	xchg   %ax,%ax
 4fe:	66 90                	xchg   %ax,%ax

00000500 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 500:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 501:	31 c0                	xor    %eax,%eax
{
 503:	89 e5                	mov    %esp,%ebp
 505:	53                   	push   %ebx
 506:	8b 4d 08             	mov    0x8(%ebp),%ecx
 509:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 510:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 514:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 517:	83 c0 01             	add    $0x1,%eax
 51a:	84 d2                	test   %dl,%dl
 51c:	75 f2                	jne    510 <strcpy+0x10>
    ;
  return os;
}
 51e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 521:	89 c8                	mov    %ecx,%eax
 523:	c9                   	leave  
 524:	c3                   	ret    
 525:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000530 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
 534:	8b 55 08             	mov    0x8(%ebp),%edx
 537:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 53a:	0f b6 02             	movzbl (%edx),%eax
 53d:	84 c0                	test   %al,%al
 53f:	75 17                	jne    558 <strcmp+0x28>
 541:	eb 3a                	jmp    57d <strcmp+0x4d>
 543:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 547:	90                   	nop
 548:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 54c:	83 c2 01             	add    $0x1,%edx
 54f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 552:	84 c0                	test   %al,%al
 554:	74 1a                	je     570 <strcmp+0x40>
    p++, q++;
 556:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 558:	0f b6 19             	movzbl (%ecx),%ebx
 55b:	38 c3                	cmp    %al,%bl
 55d:	74 e9                	je     548 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 55f:	29 d8                	sub    %ebx,%eax
}
 561:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 564:	c9                   	leave  
 565:	c3                   	ret    
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 570:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 574:	31 c0                	xor    %eax,%eax
 576:	29 d8                	sub    %ebx,%eax
}
 578:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 57b:	c9                   	leave  
 57c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 57d:	0f b6 19             	movzbl (%ecx),%ebx
 580:	31 c0                	xor    %eax,%eax
 582:	eb db                	jmp    55f <strcmp+0x2f>
 584:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop

00000590 <strlen>:

uint
strlen(const char *s)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 596:	80 3a 00             	cmpb   $0x0,(%edx)
 599:	74 15                	je     5b0 <strlen+0x20>
 59b:	31 c0                	xor    %eax,%eax
 59d:	8d 76 00             	lea    0x0(%esi),%esi
 5a0:	83 c0 01             	add    $0x1,%eax
 5a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 5a7:	89 c1                	mov    %eax,%ecx
 5a9:	75 f5                	jne    5a0 <strlen+0x10>
    ;
  return n;
}
 5ab:	89 c8                	mov    %ecx,%eax
 5ad:	5d                   	pop    %ebp
 5ae:	c3                   	ret    
 5af:	90                   	nop
  for(n = 0; s[n]; n++)
 5b0:	31 c9                	xor    %ecx,%ecx
}
 5b2:	5d                   	pop    %ebp
 5b3:	89 c8                	mov    %ecx,%eax
 5b5:	c3                   	ret    
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi

000005c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 5cd:	89 d7                	mov    %edx,%edi
 5cf:	fc                   	cld    
 5d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5d2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 5d5:	89 d0                	mov    %edx,%eax
 5d7:	c9                   	leave  
 5d8:	c3                   	ret    
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005e0 <strchr>:

char*
strchr(const char *s, char c)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5ea:	0f b6 10             	movzbl (%eax),%edx
 5ed:	84 d2                	test   %dl,%dl
 5ef:	75 12                	jne    603 <strchr+0x23>
 5f1:	eb 1d                	jmp    610 <strchr+0x30>
 5f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5f7:	90                   	nop
 5f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 5fc:	83 c0 01             	add    $0x1,%eax
 5ff:	84 d2                	test   %dl,%dl
 601:	74 0d                	je     610 <strchr+0x30>
    if(*s == c)
 603:	38 d1                	cmp    %dl,%cl
 605:	75 f1                	jne    5f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 607:	5d                   	pop    %ebp
 608:	c3                   	ret    
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 610:	31 c0                	xor    %eax,%eax
}
 612:	5d                   	pop    %ebp
 613:	c3                   	ret    
 614:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop

00000620 <gets>:

char*
gets(char *buf, int max)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 625:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 628:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 629:	31 db                	xor    %ebx,%ebx
{
 62b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 62e:	eb 27                	jmp    657 <gets+0x37>
    cc = read(0, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	6a 01                	push   $0x1
 635:	57                   	push   %edi
 636:	6a 00                	push   $0x0
 638:	e8 2e 01 00 00       	call   76b <read>
    if(cc < 1)
 63d:	83 c4 10             	add    $0x10,%esp
 640:	85 c0                	test   %eax,%eax
 642:	7e 1d                	jle    661 <gets+0x41>
      break;
    buf[i++] = c;
 644:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 648:	8b 55 08             	mov    0x8(%ebp),%edx
 64b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 64f:	3c 0a                	cmp    $0xa,%al
 651:	74 1d                	je     670 <gets+0x50>
 653:	3c 0d                	cmp    $0xd,%al
 655:	74 19                	je     670 <gets+0x50>
  for(i=0; i+1 < max; ){
 657:	89 de                	mov    %ebx,%esi
 659:	83 c3 01             	add    $0x1,%ebx
 65c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 65f:	7c cf                	jl     630 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 661:	8b 45 08             	mov    0x8(%ebp),%eax
 664:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 668:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66b:	5b                   	pop    %ebx
 66c:	5e                   	pop    %esi
 66d:	5f                   	pop    %edi
 66e:	5d                   	pop    %ebp
 66f:	c3                   	ret    
  buf[i] = '\0';
 670:	8b 45 08             	mov    0x8(%ebp),%eax
 673:	89 de                	mov    %ebx,%esi
 675:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 679:	8d 65 f4             	lea    -0xc(%ebp),%esp
 67c:	5b                   	pop    %ebx
 67d:	5e                   	pop    %esi
 67e:	5f                   	pop    %edi
 67f:	5d                   	pop    %ebp
 680:	c3                   	ret    
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop

00000690 <stat>:

int
stat(const char *n, struct stat *st)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	56                   	push   %esi
 694:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 695:	83 ec 08             	sub    $0x8,%esp
 698:	6a 00                	push   $0x0
 69a:	ff 75 08             	push   0x8(%ebp)
 69d:	e8 f1 00 00 00       	call   793 <open>
  if(fd < 0)
 6a2:	83 c4 10             	add    $0x10,%esp
 6a5:	85 c0                	test   %eax,%eax
 6a7:	78 27                	js     6d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 6a9:	83 ec 08             	sub    $0x8,%esp
 6ac:	ff 75 0c             	push   0xc(%ebp)
 6af:	89 c3                	mov    %eax,%ebx
 6b1:	50                   	push   %eax
 6b2:	e8 f4 00 00 00       	call   7ab <fstat>
  close(fd);
 6b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 6ba:	89 c6                	mov    %eax,%esi
  close(fd);
 6bc:	e8 ba 00 00 00       	call   77b <close>
  return r;
 6c1:	83 c4 10             	add    $0x10,%esp
}
 6c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6c7:	89 f0                	mov    %esi,%eax
 6c9:	5b                   	pop    %ebx
 6ca:	5e                   	pop    %esi
 6cb:	5d                   	pop    %ebp
 6cc:	c3                   	ret    
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 6d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 6d5:	eb ed                	jmp    6c4 <stat+0x34>
 6d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6de:	66 90                	xchg   %ax,%ax

000006e0 <atoi>:

int
atoi(const char *s)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	53                   	push   %ebx
 6e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6e7:	0f be 02             	movsbl (%edx),%eax
 6ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 6ed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 6f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 6f5:	77 1e                	ja     715 <atoi+0x35>
 6f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fe:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 700:	83 c2 01             	add    $0x1,%edx
 703:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 706:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 70a:	0f be 02             	movsbl (%edx),%eax
 70d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 710:	80 fb 09             	cmp    $0x9,%bl
 713:	76 eb                	jbe    700 <atoi+0x20>
  return n;
}
 715:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 718:	89 c8                	mov    %ecx,%eax
 71a:	c9                   	leave  
 71b:	c3                   	ret    
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000720 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	8b 45 10             	mov    0x10(%ebp),%eax
 727:	8b 55 08             	mov    0x8(%ebp),%edx
 72a:	56                   	push   %esi
 72b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 72e:	85 c0                	test   %eax,%eax
 730:	7e 13                	jle    745 <memmove+0x25>
 732:	01 d0                	add    %edx,%eax
  dst = vdst;
 734:	89 d7                	mov    %edx,%edi
 736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 740:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 741:	39 f8                	cmp    %edi,%eax
 743:	75 fb                	jne    740 <memmove+0x20>
  return vdst;
}
 745:	5e                   	pop    %esi
 746:	89 d0                	mov    %edx,%eax
 748:	5f                   	pop    %edi
 749:	5d                   	pop    %ebp
 74a:	c3                   	ret    

0000074b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 74b:	b8 01 00 00 00       	mov    $0x1,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <exit>:
SYSCALL(exit)
 753:	b8 02 00 00 00       	mov    $0x2,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <wait>:
SYSCALL(wait)
 75b:	b8 03 00 00 00       	mov    $0x3,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <pipe>:
SYSCALL(pipe)
 763:	b8 04 00 00 00       	mov    $0x4,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <read>:
SYSCALL(read)
 76b:	b8 05 00 00 00       	mov    $0x5,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <write>:
SYSCALL(write)
 773:	b8 10 00 00 00       	mov    $0x10,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <close>:
SYSCALL(close)
 77b:	b8 15 00 00 00       	mov    $0x15,%eax
 780:	cd 40                	int    $0x40
 782:	c3                   	ret    

00000783 <kill>:
SYSCALL(kill)
 783:	b8 06 00 00 00       	mov    $0x6,%eax
 788:	cd 40                	int    $0x40
 78a:	c3                   	ret    

0000078b <exec>:
SYSCALL(exec)
 78b:	b8 07 00 00 00       	mov    $0x7,%eax
 790:	cd 40                	int    $0x40
 792:	c3                   	ret    

00000793 <open>:
SYSCALL(open)
 793:	b8 0f 00 00 00       	mov    $0xf,%eax
 798:	cd 40                	int    $0x40
 79a:	c3                   	ret    

0000079b <mknod>:
SYSCALL(mknod)
 79b:	b8 11 00 00 00       	mov    $0x11,%eax
 7a0:	cd 40                	int    $0x40
 7a2:	c3                   	ret    

000007a3 <unlink>:
SYSCALL(unlink)
 7a3:	b8 12 00 00 00       	mov    $0x12,%eax
 7a8:	cd 40                	int    $0x40
 7aa:	c3                   	ret    

000007ab <fstat>:
SYSCALL(fstat)
 7ab:	b8 08 00 00 00       	mov    $0x8,%eax
 7b0:	cd 40                	int    $0x40
 7b2:	c3                   	ret    

000007b3 <link>:
SYSCALL(link)
 7b3:	b8 13 00 00 00       	mov    $0x13,%eax
 7b8:	cd 40                	int    $0x40
 7ba:	c3                   	ret    

000007bb <mkdir>:
SYSCALL(mkdir)
 7bb:	b8 14 00 00 00       	mov    $0x14,%eax
 7c0:	cd 40                	int    $0x40
 7c2:	c3                   	ret    

000007c3 <chdir>:
SYSCALL(chdir)
 7c3:	b8 09 00 00 00       	mov    $0x9,%eax
 7c8:	cd 40                	int    $0x40
 7ca:	c3                   	ret    

000007cb <dup>:
SYSCALL(dup)
 7cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 7d0:	cd 40                	int    $0x40
 7d2:	c3                   	ret    

000007d3 <getpid>:
SYSCALL(getpid)
 7d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 7d8:	cd 40                	int    $0x40
 7da:	c3                   	ret    

000007db <sbrk>:
SYSCALL(sbrk)
 7db:	b8 0c 00 00 00       	mov    $0xc,%eax
 7e0:	cd 40                	int    $0x40
 7e2:	c3                   	ret    

000007e3 <sleep>:
SYSCALL(sleep)
 7e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 7e8:	cd 40                	int    $0x40
 7ea:	c3                   	ret    

000007eb <uptime>:
SYSCALL(uptime)
 7eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 7f0:	cd 40                	int    $0x40
 7f2:	c3                   	ret    

000007f3 <wmap>:
SYSCALL(wmap)
 7f3:	b8 16 00 00 00       	mov    $0x16,%eax
 7f8:	cd 40                	int    $0x40
 7fa:	c3                   	ret    

000007fb <wunmap>:
SYSCALL(wunmap)
 7fb:	b8 17 00 00 00       	mov    $0x17,%eax
 800:	cd 40                	int    $0x40
 802:	c3                   	ret    

00000803 <wremap>:
SYSCALL(wremap)
 803:	b8 18 00 00 00       	mov    $0x18,%eax
 808:	cd 40                	int    $0x40
 80a:	c3                   	ret    

0000080b <getpgdirinfo>:
SYSCALL(getpgdirinfo)
 80b:	b8 19 00 00 00       	mov    $0x19,%eax
 810:	cd 40                	int    $0x40
 812:	c3                   	ret    

00000813 <getwmapinfo>:
SYSCALL(getwmapinfo)
 813:	b8 1a 00 00 00       	mov    $0x1a,%eax
 818:	cd 40                	int    $0x40
 81a:	c3                   	ret    
 81b:	66 90                	xchg   %ax,%ax
 81d:	66 90                	xchg   %ax,%ax
 81f:	90                   	nop

00000820 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 3c             	sub    $0x3c,%esp
 829:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 82c:	89 d1                	mov    %edx,%ecx
{
 82e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 831:	85 d2                	test   %edx,%edx
 833:	0f 89 7f 00 00 00    	jns    8b8 <printint+0x98>
 839:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 83d:	74 79                	je     8b8 <printint+0x98>
    neg = 1;
 83f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 846:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 848:	31 db                	xor    %ebx,%ebx
 84a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 84d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 850:	89 c8                	mov    %ecx,%eax
 852:	31 d2                	xor    %edx,%edx
 854:	89 cf                	mov    %ecx,%edi
 856:	f7 75 c4             	divl   -0x3c(%ebp)
 859:	0f b6 92 e0 0f 00 00 	movzbl 0xfe0(%edx),%edx
 860:	89 45 c0             	mov    %eax,-0x40(%ebp)
 863:	89 d8                	mov    %ebx,%eax
 865:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 868:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 86b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 86e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 871:	76 dd                	jbe    850 <printint+0x30>
  if(neg)
 873:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 876:	85 c9                	test   %ecx,%ecx
 878:	74 0c                	je     886 <printint+0x66>
    buf[i++] = '-';
 87a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 87f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 881:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 886:	8b 7d b8             	mov    -0x48(%ebp),%edi
 889:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 88d:	eb 07                	jmp    896 <printint+0x76>
 88f:	90                   	nop
    putc(fd, buf[i]);
 890:	0f b6 13             	movzbl (%ebx),%edx
 893:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 896:	83 ec 04             	sub    $0x4,%esp
 899:	88 55 d7             	mov    %dl,-0x29(%ebp)
 89c:	6a 01                	push   $0x1
 89e:	56                   	push   %esi
 89f:	57                   	push   %edi
 8a0:	e8 ce fe ff ff       	call   773 <write>
  while(--i >= 0)
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	39 de                	cmp    %ebx,%esi
 8aa:	75 e4                	jne    890 <printint+0x70>
}
 8ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8af:	5b                   	pop    %ebx
 8b0:	5e                   	pop    %esi
 8b1:	5f                   	pop    %edi
 8b2:	5d                   	pop    %ebp
 8b3:	c3                   	ret    
 8b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 8b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 8bf:	eb 87                	jmp    848 <printint+0x28>
 8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop

000008d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 8dc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 8df:	0f b6 13             	movzbl (%ebx),%edx
 8e2:	84 d2                	test   %dl,%dl
 8e4:	74 6a                	je     950 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 8e6:	8d 45 10             	lea    0x10(%ebp),%eax
 8e9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 8ec:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 8ef:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 8f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8f4:	eb 36                	jmp    92c <printf+0x5c>
 8f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fd:	8d 76 00             	lea    0x0(%esi),%esi
 900:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 903:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 908:	83 f8 25             	cmp    $0x25,%eax
 90b:	74 15                	je     922 <printf+0x52>
  write(fd, &c, 1);
 90d:	83 ec 04             	sub    $0x4,%esp
 910:	88 55 e7             	mov    %dl,-0x19(%ebp)
 913:	6a 01                	push   $0x1
 915:	57                   	push   %edi
 916:	56                   	push   %esi
 917:	e8 57 fe ff ff       	call   773 <write>
 91c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 91f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 922:	0f b6 13             	movzbl (%ebx),%edx
 925:	83 c3 01             	add    $0x1,%ebx
 928:	84 d2                	test   %dl,%dl
 92a:	74 24                	je     950 <printf+0x80>
    c = fmt[i] & 0xff;
 92c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 92f:	85 c9                	test   %ecx,%ecx
 931:	74 cd                	je     900 <printf+0x30>
      }
    } else if(state == '%'){
 933:	83 f9 25             	cmp    $0x25,%ecx
 936:	75 ea                	jne    922 <printf+0x52>
      if(c == 'd'){
 938:	83 f8 25             	cmp    $0x25,%eax
 93b:	0f 84 07 01 00 00    	je     a48 <printf+0x178>
 941:	83 e8 63             	sub    $0x63,%eax
 944:	83 f8 15             	cmp    $0x15,%eax
 947:	77 17                	ja     960 <printf+0x90>
 949:	ff 24 85 88 0f 00 00 	jmp    *0xf88(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 950:	8d 65 f4             	lea    -0xc(%ebp),%esp
 953:	5b                   	pop    %ebx
 954:	5e                   	pop    %esi
 955:	5f                   	pop    %edi
 956:	5d                   	pop    %ebp
 957:	c3                   	ret    
 958:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 95f:	90                   	nop
  write(fd, &c, 1);
 960:	83 ec 04             	sub    $0x4,%esp
 963:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 966:	6a 01                	push   $0x1
 968:	57                   	push   %edi
 969:	56                   	push   %esi
 96a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 96e:	e8 00 fe ff ff       	call   773 <write>
        putc(fd, c);
 973:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 977:	83 c4 0c             	add    $0xc,%esp
 97a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 97d:	6a 01                	push   $0x1
 97f:	57                   	push   %edi
 980:	56                   	push   %esi
 981:	e8 ed fd ff ff       	call   773 <write>
        putc(fd, c);
 986:	83 c4 10             	add    $0x10,%esp
      state = 0;
 989:	31 c9                	xor    %ecx,%ecx
 98b:	eb 95                	jmp    922 <printf+0x52>
 98d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 990:	83 ec 0c             	sub    $0xc,%esp
 993:	b9 10 00 00 00       	mov    $0x10,%ecx
 998:	6a 00                	push   $0x0
 99a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 99d:	8b 10                	mov    (%eax),%edx
 99f:	89 f0                	mov    %esi,%eax
 9a1:	e8 7a fe ff ff       	call   820 <printint>
        ap++;
 9a6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 9aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9ad:	31 c9                	xor    %ecx,%ecx
 9af:	e9 6e ff ff ff       	jmp    922 <printf+0x52>
 9b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 9b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9bb:	8b 10                	mov    (%eax),%edx
        ap++;
 9bd:	83 c0 04             	add    $0x4,%eax
 9c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 9c3:	85 d2                	test   %edx,%edx
 9c5:	0f 84 8d 00 00 00    	je     a58 <printf+0x188>
        while(*s != 0){
 9cb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 9ce:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 9d0:	84 c0                	test   %al,%al
 9d2:	0f 84 4a ff ff ff    	je     922 <printf+0x52>
 9d8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 9db:	89 d3                	mov    %edx,%ebx
 9dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 9e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 9e3:	83 c3 01             	add    $0x1,%ebx
 9e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9e9:	6a 01                	push   $0x1
 9eb:	57                   	push   %edi
 9ec:	56                   	push   %esi
 9ed:	e8 81 fd ff ff       	call   773 <write>
        while(*s != 0){
 9f2:	0f b6 03             	movzbl (%ebx),%eax
 9f5:	83 c4 10             	add    $0x10,%esp
 9f8:	84 c0                	test   %al,%al
 9fa:	75 e4                	jne    9e0 <printf+0x110>
      state = 0;
 9fc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 9ff:	31 c9                	xor    %ecx,%ecx
 a01:	e9 1c ff ff ff       	jmp    922 <printf+0x52>
 a06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a0d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a10:	83 ec 0c             	sub    $0xc,%esp
 a13:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a18:	6a 01                	push   $0x1
 a1a:	e9 7b ff ff ff       	jmp    99a <printf+0xca>
 a1f:	90                   	nop
        putc(fd, *ap);
 a20:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 a23:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a26:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 a28:	6a 01                	push   $0x1
 a2a:	57                   	push   %edi
 a2b:	56                   	push   %esi
        putc(fd, *ap);
 a2c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a2f:	e8 3f fd ff ff       	call   773 <write>
        ap++;
 a34:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 a38:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a3b:	31 c9                	xor    %ecx,%ecx
 a3d:	e9 e0 fe ff ff       	jmp    922 <printf+0x52>
 a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 a48:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 a4b:	83 ec 04             	sub    $0x4,%esp
 a4e:	e9 2a ff ff ff       	jmp    97d <printf+0xad>
 a53:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a57:	90                   	nop
          s = "(null)";
 a58:	ba 80 0f 00 00       	mov    $0xf80,%edx
        while(*s != 0){
 a5d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 a60:	b8 28 00 00 00       	mov    $0x28,%eax
 a65:	89 d3                	mov    %edx,%ebx
 a67:	e9 74 ff ff ff       	jmp    9e0 <printf+0x110>
 a6c:	66 90                	xchg   %ax,%ax
 a6e:	66 90                	xchg   %ax,%ax

00000a70 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a70:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a71:	a1 74 13 00 00       	mov    0x1374,%eax
{
 a76:	89 e5                	mov    %esp,%ebp
 a78:	57                   	push   %edi
 a79:	56                   	push   %esi
 a7a:	53                   	push   %ebx
 a7b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 a7e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a88:	89 c2                	mov    %eax,%edx
 a8a:	8b 00                	mov    (%eax),%eax
 a8c:	39 ca                	cmp    %ecx,%edx
 a8e:	73 30                	jae    ac0 <free+0x50>
 a90:	39 c1                	cmp    %eax,%ecx
 a92:	72 04                	jb     a98 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a94:	39 c2                	cmp    %eax,%edx
 a96:	72 f0                	jb     a88 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a98:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a9b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a9e:	39 f8                	cmp    %edi,%eax
 aa0:	74 30                	je     ad2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 aa2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 aa5:	8b 42 04             	mov    0x4(%edx),%eax
 aa8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 aab:	39 f1                	cmp    %esi,%ecx
 aad:	74 3a                	je     ae9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 aaf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 ab1:	5b                   	pop    %ebx
  freep = p;
 ab2:	89 15 74 13 00 00    	mov    %edx,0x1374
}
 ab8:	5e                   	pop    %esi
 ab9:	5f                   	pop    %edi
 aba:	5d                   	pop    %ebp
 abb:	c3                   	ret    
 abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ac0:	39 c2                	cmp    %eax,%edx
 ac2:	72 c4                	jb     a88 <free+0x18>
 ac4:	39 c1                	cmp    %eax,%ecx
 ac6:	73 c0                	jae    a88 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 ac8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 acb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ace:	39 f8                	cmp    %edi,%eax
 ad0:	75 d0                	jne    aa2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 ad2:	03 70 04             	add    0x4(%eax),%esi
 ad5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ad8:	8b 02                	mov    (%edx),%eax
 ada:	8b 00                	mov    (%eax),%eax
 adc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 adf:	8b 42 04             	mov    0x4(%edx),%eax
 ae2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 ae5:	39 f1                	cmp    %esi,%ecx
 ae7:	75 c6                	jne    aaf <free+0x3f>
    p->s.size += bp->s.size;
 ae9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 aec:	89 15 74 13 00 00    	mov    %edx,0x1374
    p->s.size += bp->s.size;
 af2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 af5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 af8:	89 0a                	mov    %ecx,(%edx)
}
 afa:	5b                   	pop    %ebx
 afb:	5e                   	pop    %esi
 afc:	5f                   	pop    %edi
 afd:	5d                   	pop    %ebp
 afe:	c3                   	ret    
 aff:	90                   	nop

00000b00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	57                   	push   %edi
 b04:	56                   	push   %esi
 b05:	53                   	push   %ebx
 b06:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b09:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b0c:	8b 3d 74 13 00 00    	mov    0x1374,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b12:	8d 70 07             	lea    0x7(%eax),%esi
 b15:	c1 ee 03             	shr    $0x3,%esi
 b18:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b1b:	85 ff                	test   %edi,%edi
 b1d:	0f 84 9d 00 00 00    	je     bc0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b23:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 b25:	8b 4a 04             	mov    0x4(%edx),%ecx
 b28:	39 f1                	cmp    %esi,%ecx
 b2a:	73 6a                	jae    b96 <malloc+0x96>
 b2c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b31:	39 de                	cmp    %ebx,%esi
 b33:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b36:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 b3d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b40:	eb 17                	jmp    b59 <malloc+0x59>
 b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b48:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b4a:	8b 48 04             	mov    0x4(%eax),%ecx
 b4d:	39 f1                	cmp    %esi,%ecx
 b4f:	73 4f                	jae    ba0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b51:	8b 3d 74 13 00 00    	mov    0x1374,%edi
 b57:	89 c2                	mov    %eax,%edx
 b59:	39 d7                	cmp    %edx,%edi
 b5b:	75 eb                	jne    b48 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 b5d:	83 ec 0c             	sub    $0xc,%esp
 b60:	ff 75 e4             	push   -0x1c(%ebp)
 b63:	e8 73 fc ff ff       	call   7db <sbrk>
  if(p == (char*)-1)
 b68:	83 c4 10             	add    $0x10,%esp
 b6b:	83 f8 ff             	cmp    $0xffffffff,%eax
 b6e:	74 1c                	je     b8c <malloc+0x8c>
  hp->s.size = nu;
 b70:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b73:	83 ec 0c             	sub    $0xc,%esp
 b76:	83 c0 08             	add    $0x8,%eax
 b79:	50                   	push   %eax
 b7a:	e8 f1 fe ff ff       	call   a70 <free>
  return freep;
 b7f:	8b 15 74 13 00 00    	mov    0x1374,%edx
      if((p = morecore(nunits)) == 0)
 b85:	83 c4 10             	add    $0x10,%esp
 b88:	85 d2                	test   %edx,%edx
 b8a:	75 bc                	jne    b48 <malloc+0x48>
        return 0;
  }
}
 b8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b8f:	31 c0                	xor    %eax,%eax
}
 b91:	5b                   	pop    %ebx
 b92:	5e                   	pop    %esi
 b93:	5f                   	pop    %edi
 b94:	5d                   	pop    %ebp
 b95:	c3                   	ret    
    if(p->s.size >= nunits){
 b96:	89 d0                	mov    %edx,%eax
 b98:	89 fa                	mov    %edi,%edx
 b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 ba0:	39 ce                	cmp    %ecx,%esi
 ba2:	74 4c                	je     bf0 <malloc+0xf0>
        p->s.size -= nunits;
 ba4:	29 f1                	sub    %esi,%ecx
 ba6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ba9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 bac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 baf:	89 15 74 13 00 00    	mov    %edx,0x1374
}
 bb5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 bb8:	83 c0 08             	add    $0x8,%eax
}
 bbb:	5b                   	pop    %ebx
 bbc:	5e                   	pop    %esi
 bbd:	5f                   	pop    %edi
 bbe:	5d                   	pop    %ebp
 bbf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 bc0:	c7 05 74 13 00 00 78 	movl   $0x1378,0x1374
 bc7:	13 00 00 
    base.s.size = 0;
 bca:	bf 78 13 00 00       	mov    $0x1378,%edi
    base.s.ptr = freep = prevp = &base;
 bcf:	c7 05 78 13 00 00 78 	movl   $0x1378,0x1378
 bd6:	13 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bd9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 bdb:	c7 05 7c 13 00 00 00 	movl   $0x0,0x137c
 be2:	00 00 00 
    if(p->s.size >= nunits){
 be5:	e9 42 ff ff ff       	jmp    b2c <malloc+0x2c>
 bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 bf0:	8b 08                	mov    (%eax),%ecx
 bf2:	89 0a                	mov    %ecx,(%edx)
 bf4:	eb b9                	jmp    baf <malloc+0xaf>
