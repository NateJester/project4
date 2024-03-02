
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      17:	90                   	nop
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 91 00 00 00    	jg     b2 <main+0xb2>
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 49 13 00 00       	push   $0x1349
      2b:	e8 33 0e 00 00       	call   e63 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      40:	80 3d e2 19 00 00 20 	cmpb   $0x20,0x19e2
      47:	0f 84 88 00 00 00    	je     d5 <main+0xd5>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
      50:	e8 c6 0d 00 00       	call   e1b <fork>
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
      5e:	85 c0                	test   %eax,%eax
      60:	74 5e                	je     c0 <main+0xc0>
      62:	e8 c4 0d 00 00       	call   e2b <wait>
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 a8 12 00 00       	push   $0x12a8
      6f:	6a 02                	push   $0x2
      71:	e8 0a 0f 00 00       	call   f80 <printf>
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 e0 19 00 00       	push   $0x19e0
      82:	e8 09 0c 00 00       	call   c90 <memset>
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 e0 19 00 00       	push   $0x19e0
      90:	e8 5b 0c 00 00       	call   cf0 <gets>
      95:	0f b6 05 e0 19 00 00 	movzbl 0x19e0,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 77                	je     11a <main+0x11a>
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d e1 19 00 00 64 	cmpb   $0x64,0x19e1
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
      b2:	83 ec 0c             	sub    $0xc,%esp
      b5:	50                   	push   %eax
      b6:	e8 90 0d 00 00       	call   e4b <close>
      bb:	83 c4 10             	add    $0x10,%esp
      be:	eb a7                	jmp    67 <main+0x67>
      c0:	83 ec 0c             	sub    $0xc,%esp
      c3:	68 e0 19 00 00       	push   $0x19e0
      c8:	e8 93 0a 00 00       	call   b60 <parsecmd>
      cd:	89 04 24             	mov    %eax,(%esp)
      d0:	e8 db 00 00 00       	call   1b0 <runcmd>
      d5:	83 ec 0c             	sub    $0xc,%esp
      d8:	68 e0 19 00 00       	push   $0x19e0
      dd:	e8 7e 0b 00 00       	call   c60 <strlen>
      e2:	c7 04 24 e3 19 00 00 	movl   $0x19e3,(%esp)
      e9:	c6 80 df 19 00 00 00 	movb   $0x0,0x19df(%eax)
      f0:	e8 9e 0d 00 00       	call   e93 <chdir>
      f5:	83 c4 10             	add    $0x10,%esp
      f8:	85 c0                	test   %eax,%eax
      fa:	0f 89 67 ff ff ff    	jns    67 <main+0x67>
     100:	51                   	push   %ecx
     101:	68 e3 19 00 00       	push   $0x19e3
     106:	68 51 13 00 00       	push   $0x1351
     10b:	6a 02                	push   $0x2
     10d:	e8 6e 0e 00 00       	call   f80 <printf>
     112:	83 c4 10             	add    $0x10,%esp
     115:	e9 4d ff ff ff       	jmp    67 <main+0x67>
     11a:	e8 04 0d 00 00       	call   e23 <exit>
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 ab 12 00 00       	push   $0x12ab
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	56                   	push   %esi
     134:	53                   	push   %ebx
     135:	8b 75 0c             	mov    0xc(%ebp),%esi
     138:	8b 5d 08             	mov    0x8(%ebp),%ebx
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	68 a8 12 00 00       	push   $0x12a8
     143:	6a 02                	push   $0x2
     145:	e8 36 0e 00 00       	call   f80 <printf>
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 3a 0b 00 00       	call   c90 <memset>
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 91 0b 00 00       	call   cf0 <gets>
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
     165:	19 c0                	sbb    %eax,%eax
     167:	8d 65 f8             	lea    -0x8(%ebp),%esp
     16a:	5b                   	pop    %ebx
     16b:	5e                   	pop    %esi
     16c:	5d                   	pop    %ebp
     16d:	c3                   	ret    
     16e:	66 90                	xchg   %ax,%ax

00000170 <panic>:
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
     176:	ff 75 08             	push   0x8(%ebp)
     179:	68 45 13 00 00       	push   $0x1345
     17e:	6a 02                	push   $0x2
     180:	e8 fb 0d 00 00       	call   f80 <printf>
     185:	e8 99 0c 00 00       	call   e23 <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <fork1>:
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 08             	sub    $0x8,%esp
     196:	e8 80 0c 00 00       	call   e1b <fork>
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
     1a0:	c9                   	leave  
     1a1:	c3                   	ret    
     1a2:	83 ec 0c             	sub    $0xc,%esp
     1a5:	68 ab 12 00 00       	push   $0x12ab
     1aa:	e8 c1 ff ff ff       	call   170 <panic>
     1af:	90                   	nop

000001b0 <runcmd>:
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 14             	sub    $0x14,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 42                	je     200 <runcmd+0x50>
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 e3 00 00 00    	ja     2aa <runcmd+0xfa>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 60 13 00 00 	jmp    *0x1360(,%eax,4)
     1d0:	8b 43 04             	mov    0x4(%ebx),%eax
     1d3:	85 c0                	test   %eax,%eax
     1d5:	74 29                	je     200 <runcmd+0x50>
     1d7:	8d 53 04             	lea    0x4(%ebx),%edx
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	52                   	push   %edx
     1dd:	50                   	push   %eax
     1de:	e8 78 0c 00 00       	call   e5b <exec>
     1e3:	83 c4 0c             	add    $0xc,%esp
     1e6:	ff 73 04             	push   0x4(%ebx)
     1e9:	68 b7 12 00 00       	push   $0x12b7
     1ee:	6a 02                	push   $0x2
     1f0:	e8 8b 0d 00 00       	call   f80 <printf>
     1f5:	83 c4 10             	add    $0x10,%esp
     1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ff:	90                   	nop
     200:	e8 1e 0c 00 00       	call   e23 <exit>
     205:	e8 86 ff ff ff       	call   190 <fork1>
     20a:	85 c0                	test   %eax,%eax
     20c:	75 f2                	jne    200 <runcmd+0x50>
     20e:	e9 8c 00 00 00       	jmp    29f <runcmd+0xef>
     213:	83 ec 0c             	sub    $0xc,%esp
     216:	8d 45 f0             	lea    -0x10(%ebp),%eax
     219:	50                   	push   %eax
     21a:	e8 14 0c 00 00       	call   e33 <pipe>
     21f:	83 c4 10             	add    $0x10,%esp
     222:	85 c0                	test   %eax,%eax
     224:	0f 88 a2 00 00 00    	js     2cc <runcmd+0x11c>
     22a:	e8 61 ff ff ff       	call   190 <fork1>
     22f:	85 c0                	test   %eax,%eax
     231:	0f 84 a2 00 00 00    	je     2d9 <runcmd+0x129>
     237:	e8 54 ff ff ff       	call   190 <fork1>
     23c:	85 c0                	test   %eax,%eax
     23e:	0f 84 c3 00 00 00    	je     307 <runcmd+0x157>
     244:	83 ec 0c             	sub    $0xc,%esp
     247:	ff 75 f0             	push   -0x10(%ebp)
     24a:	e8 fc 0b 00 00       	call   e4b <close>
     24f:	58                   	pop    %eax
     250:	ff 75 f4             	push   -0xc(%ebp)
     253:	e8 f3 0b 00 00       	call   e4b <close>
     258:	e8 ce 0b 00 00       	call   e2b <wait>
     25d:	e8 c9 0b 00 00       	call   e2b <wait>
     262:	83 c4 10             	add    $0x10,%esp
     265:	eb 99                	jmp    200 <runcmd+0x50>
     267:	e8 24 ff ff ff       	call   190 <fork1>
     26c:	85 c0                	test   %eax,%eax
     26e:	74 2f                	je     29f <runcmd+0xef>
     270:	e8 b6 0b 00 00       	call   e2b <wait>
     275:	83 ec 0c             	sub    $0xc,%esp
     278:	ff 73 08             	push   0x8(%ebx)
     27b:	e8 30 ff ff ff       	call   1b0 <runcmd>
     280:	83 ec 0c             	sub    $0xc,%esp
     283:	ff 73 14             	push   0x14(%ebx)
     286:	e8 c0 0b 00 00       	call   e4b <close>
     28b:	58                   	pop    %eax
     28c:	5a                   	pop    %edx
     28d:	ff 73 10             	push   0x10(%ebx)
     290:	ff 73 08             	push   0x8(%ebx)
     293:	e8 cb 0b 00 00       	call   e63 <open>
     298:	83 c4 10             	add    $0x10,%esp
     29b:	85 c0                	test   %eax,%eax
     29d:	78 18                	js     2b7 <runcmd+0x107>
     29f:	83 ec 0c             	sub    $0xc,%esp
     2a2:	ff 73 04             	push   0x4(%ebx)
     2a5:	e8 06 ff ff ff       	call   1b0 <runcmd>
     2aa:	83 ec 0c             	sub    $0xc,%esp
     2ad:	68 b0 12 00 00       	push   $0x12b0
     2b2:	e8 b9 fe ff ff       	call   170 <panic>
     2b7:	51                   	push   %ecx
     2b8:	ff 73 08             	push   0x8(%ebx)
     2bb:	68 c7 12 00 00       	push   $0x12c7
     2c0:	6a 02                	push   $0x2
     2c2:	e8 b9 0c 00 00       	call   f80 <printf>
     2c7:	e8 57 0b 00 00       	call   e23 <exit>
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	68 d7 12 00 00       	push   $0x12d7
     2d4:	e8 97 fe ff ff       	call   170 <panic>
     2d9:	83 ec 0c             	sub    $0xc,%esp
     2dc:	6a 01                	push   $0x1
     2de:	e8 68 0b 00 00       	call   e4b <close>
     2e3:	58                   	pop    %eax
     2e4:	ff 75 f4             	push   -0xc(%ebp)
     2e7:	e8 af 0b 00 00       	call   e9b <dup>
     2ec:	58                   	pop    %eax
     2ed:	ff 75 f0             	push   -0x10(%ebp)
     2f0:	e8 56 0b 00 00       	call   e4b <close>
     2f5:	58                   	pop    %eax
     2f6:	ff 75 f4             	push   -0xc(%ebp)
     2f9:	e8 4d 0b 00 00       	call   e4b <close>
     2fe:	5a                   	pop    %edx
     2ff:	ff 73 04             	push   0x4(%ebx)
     302:	e8 a9 fe ff ff       	call   1b0 <runcmd>
     307:	83 ec 0c             	sub    $0xc,%esp
     30a:	6a 00                	push   $0x0
     30c:	e8 3a 0b 00 00       	call   e4b <close>
     311:	5a                   	pop    %edx
     312:	ff 75 f0             	push   -0x10(%ebp)
     315:	e8 81 0b 00 00       	call   e9b <dup>
     31a:	59                   	pop    %ecx
     31b:	ff 75 f0             	push   -0x10(%ebp)
     31e:	e8 28 0b 00 00       	call   e4b <close>
     323:	58                   	pop    %eax
     324:	ff 75 f4             	push   -0xc(%ebp)
     327:	e8 1f 0b 00 00       	call   e4b <close>
     32c:	58                   	pop    %eax
     32d:	ff 73 08             	push   0x8(%ebx)
     330:	e8 7b fe ff ff       	call   1b0 <runcmd>
     335:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <execcmd>:
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
     347:	6a 54                	push   $0x54
     349:	e8 62 0e 00 00       	call   11b0 <malloc>
     34e:	83 c4 0c             	add    $0xc,%esp
     351:	6a 54                	push   $0x54
     353:	89 c3                	mov    %eax,%ebx
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 33 09 00 00       	call   c90 <memset>
     35d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
     363:	89 d8                	mov    %ebx,%eax
     365:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     368:	c9                   	leave  
     369:	c3                   	ret    
     36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <redircmd>:
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	53                   	push   %ebx
     374:	83 ec 10             	sub    $0x10,%esp
     377:	6a 18                	push   $0x18
     379:	e8 32 0e 00 00       	call   11b0 <malloc>
     37e:	83 c4 0c             	add    $0xc,%esp
     381:	6a 18                	push   $0x18
     383:	89 c3                	mov    %eax,%ebx
     385:	6a 00                	push   $0x0
     387:	50                   	push   %eax
     388:	e8 03 09 00 00       	call   c90 <memset>
     38d:	8b 45 08             	mov    0x8(%ebp),%eax
     390:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
     396:	89 43 04             	mov    %eax,0x4(%ebx)
     399:	8b 45 0c             	mov    0xc(%ebp),%eax
     39c:	89 43 08             	mov    %eax,0x8(%ebx)
     39f:	8b 45 10             	mov    0x10(%ebp),%eax
     3a2:	89 43 0c             	mov    %eax,0xc(%ebx)
     3a5:	8b 45 14             	mov    0x14(%ebp),%eax
     3a8:	89 43 10             	mov    %eax,0x10(%ebx)
     3ab:	8b 45 18             	mov    0x18(%ebp),%eax
     3ae:	89 43 14             	mov    %eax,0x14(%ebx)
     3b1:	89 d8                	mov    %ebx,%eax
     3b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3b6:	c9                   	leave  
     3b7:	c3                   	ret    
     3b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3bf:	90                   	nop

000003c0 <pipecmd>:
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 10             	sub    $0x10,%esp
     3c7:	6a 0c                	push   $0xc
     3c9:	e8 e2 0d 00 00       	call   11b0 <malloc>
     3ce:	83 c4 0c             	add    $0xc,%esp
     3d1:	6a 0c                	push   $0xc
     3d3:	89 c3                	mov    %eax,%ebx
     3d5:	6a 00                	push   $0x0
     3d7:	50                   	push   %eax
     3d8:	e8 b3 08 00 00       	call   c90 <memset>
     3dd:	8b 45 08             	mov    0x8(%ebp),%eax
     3e0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
     3e6:	89 43 04             	mov    %eax,0x4(%ebx)
     3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ec:	89 43 08             	mov    %eax,0x8(%ebx)
     3ef:	89 d8                	mov    %ebx,%eax
     3f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3f4:	c9                   	leave  
     3f5:	c3                   	ret    
     3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <listcmd>:
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 10             	sub    $0x10,%esp
     407:	6a 0c                	push   $0xc
     409:	e8 a2 0d 00 00       	call   11b0 <malloc>
     40e:	83 c4 0c             	add    $0xc,%esp
     411:	6a 0c                	push   $0xc
     413:	89 c3                	mov    %eax,%ebx
     415:	6a 00                	push   $0x0
     417:	50                   	push   %eax
     418:	e8 73 08 00 00       	call   c90 <memset>
     41d:	8b 45 08             	mov    0x8(%ebp),%eax
     420:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
     426:	89 43 04             	mov    %eax,0x4(%ebx)
     429:	8b 45 0c             	mov    0xc(%ebp),%eax
     42c:	89 43 08             	mov    %eax,0x8(%ebx)
     42f:	89 d8                	mov    %ebx,%eax
     431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     434:	c9                   	leave  
     435:	c3                   	ret    
     436:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <backcmd>:
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
     447:	6a 08                	push   $0x8
     449:	e8 62 0d 00 00       	call   11b0 <malloc>
     44e:	83 c4 0c             	add    $0xc,%esp
     451:	6a 08                	push   $0x8
     453:	89 c3                	mov    %eax,%ebx
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 33 08 00 00       	call   c90 <memset>
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
     460:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
     466:	89 43 04             	mov    %eax,0x4(%ebx)
     469:	89 d8                	mov    %ebx,%eax
     46b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     46e:	c9                   	leave  
     46f:	c3                   	ret    

00000470 <gettoken>:
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	57                   	push   %edi
     474:	56                   	push   %esi
     475:	53                   	push   %ebx
     476:	83 ec 0c             	sub    $0xc,%esp
     479:	8b 45 08             	mov    0x8(%ebp),%eax
     47c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     47f:	8b 75 10             	mov    0x10(%ebp),%esi
     482:	8b 38                	mov    (%eax),%edi
     484:	39 df                	cmp    %ebx,%edi
     486:	72 0f                	jb     497 <gettoken+0x27>
     488:	eb 25                	jmp    4af <gettoken+0x3f>
     48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     490:	83 c7 01             	add    $0x1,%edi
     493:	39 fb                	cmp    %edi,%ebx
     495:	74 18                	je     4af <gettoken+0x3f>
     497:	0f be 07             	movsbl (%edi),%eax
     49a:	83 ec 08             	sub    $0x8,%esp
     49d:	50                   	push   %eax
     49e:	68 cc 19 00 00       	push   $0x19cc
     4a3:	e8 08 08 00 00       	call   cb0 <strchr>
     4a8:	83 c4 10             	add    $0x10,%esp
     4ab:	85 c0                	test   %eax,%eax
     4ad:	75 e1                	jne    490 <gettoken+0x20>
     4af:	85 f6                	test   %esi,%esi
     4b1:	74 02                	je     4b5 <gettoken+0x45>
     4b3:	89 3e                	mov    %edi,(%esi)
     4b5:	0f b6 07             	movzbl (%edi),%eax
     4b8:	3c 3c                	cmp    $0x3c,%al
     4ba:	0f 8f d0 00 00 00    	jg     590 <gettoken+0x120>
     4c0:	3c 3a                	cmp    $0x3a,%al
     4c2:	0f 8f b4 00 00 00    	jg     57c <gettoken+0x10c>
     4c8:	84 c0                	test   %al,%al
     4ca:	75 44                	jne    510 <gettoken+0xa0>
     4cc:	31 f6                	xor    %esi,%esi
     4ce:	8b 55 14             	mov    0x14(%ebp),%edx
     4d1:	85 d2                	test   %edx,%edx
     4d3:	74 05                	je     4da <gettoken+0x6a>
     4d5:	8b 45 14             	mov    0x14(%ebp),%eax
     4d8:	89 38                	mov    %edi,(%eax)
     4da:	39 df                	cmp    %ebx,%edi
     4dc:	72 09                	jb     4e7 <gettoken+0x77>
     4de:	eb 1f                	jmp    4ff <gettoken+0x8f>
     4e0:	83 c7 01             	add    $0x1,%edi
     4e3:	39 fb                	cmp    %edi,%ebx
     4e5:	74 18                	je     4ff <gettoken+0x8f>
     4e7:	0f be 07             	movsbl (%edi),%eax
     4ea:	83 ec 08             	sub    $0x8,%esp
     4ed:	50                   	push   %eax
     4ee:	68 cc 19 00 00       	push   $0x19cc
     4f3:	e8 b8 07 00 00       	call   cb0 <strchr>
     4f8:	83 c4 10             	add    $0x10,%esp
     4fb:	85 c0                	test   %eax,%eax
     4fd:	75 e1                	jne    4e0 <gettoken+0x70>
     4ff:	8b 45 08             	mov    0x8(%ebp),%eax
     502:	89 38                	mov    %edi,(%eax)
     504:	8d 65 f4             	lea    -0xc(%ebp),%esp
     507:	89 f0                	mov    %esi,%eax
     509:	5b                   	pop    %ebx
     50a:	5e                   	pop    %esi
     50b:	5f                   	pop    %edi
     50c:	5d                   	pop    %ebp
     50d:	c3                   	ret    
     50e:	66 90                	xchg   %ax,%ax
     510:	79 5e                	jns    570 <gettoken+0x100>
     512:	39 fb                	cmp    %edi,%ebx
     514:	77 34                	ja     54a <gettoken+0xda>
     516:	8b 45 14             	mov    0x14(%ebp),%eax
     519:	be 61 00 00 00       	mov    $0x61,%esi
     51e:	85 c0                	test   %eax,%eax
     520:	75 b3                	jne    4d5 <gettoken+0x65>
     522:	eb db                	jmp    4ff <gettoken+0x8f>
     524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     528:	0f be 07             	movsbl (%edi),%eax
     52b:	83 ec 08             	sub    $0x8,%esp
     52e:	50                   	push   %eax
     52f:	68 c4 19 00 00       	push   $0x19c4
     534:	e8 77 07 00 00       	call   cb0 <strchr>
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
     53e:	75 22                	jne    562 <gettoken+0xf2>
     540:	83 c7 01             	add    $0x1,%edi
     543:	39 fb                	cmp    %edi,%ebx
     545:	74 cf                	je     516 <gettoken+0xa6>
     547:	0f b6 07             	movzbl (%edi),%eax
     54a:	83 ec 08             	sub    $0x8,%esp
     54d:	0f be f0             	movsbl %al,%esi
     550:	56                   	push   %esi
     551:	68 cc 19 00 00       	push   $0x19cc
     556:	e8 55 07 00 00       	call   cb0 <strchr>
     55b:	83 c4 10             	add    $0x10,%esp
     55e:	85 c0                	test   %eax,%eax
     560:	74 c6                	je     528 <gettoken+0xb8>
     562:	be 61 00 00 00       	mov    $0x61,%esi
     567:	e9 62 ff ff ff       	jmp    4ce <gettoken+0x5e>
     56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     570:	3c 26                	cmp    $0x26,%al
     572:	74 08                	je     57c <gettoken+0x10c>
     574:	8d 48 d8             	lea    -0x28(%eax),%ecx
     577:	80 f9 01             	cmp    $0x1,%cl
     57a:	77 96                	ja     512 <gettoken+0xa2>
     57c:	0f be f0             	movsbl %al,%esi
     57f:	83 c7 01             	add    $0x1,%edi
     582:	e9 47 ff ff ff       	jmp    4ce <gettoken+0x5e>
     587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     58e:	66 90                	xchg   %ax,%ax
     590:	3c 3e                	cmp    $0x3e,%al
     592:	75 1c                	jne    5b0 <gettoken+0x140>
     594:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     598:	8d 47 01             	lea    0x1(%edi),%eax
     59b:	74 1c                	je     5b9 <gettoken+0x149>
     59d:	89 c7                	mov    %eax,%edi
     59f:	be 3e 00 00 00       	mov    $0x3e,%esi
     5a4:	e9 25 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5b0:	3c 7c                	cmp    $0x7c,%al
     5b2:	74 c8                	je     57c <gettoken+0x10c>
     5b4:	e9 59 ff ff ff       	jmp    512 <gettoken+0xa2>
     5b9:	83 c7 02             	add    $0x2,%edi
     5bc:	be 2b 00 00 00       	mov    $0x2b,%esi
     5c1:	e9 08 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5cd:	8d 76 00             	lea    0x0(%esi),%esi

000005d0 <peek>:
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	57                   	push   %edi
     5d4:	56                   	push   %esi
     5d5:	53                   	push   %ebx
     5d6:	83 ec 0c             	sub    $0xc,%esp
     5d9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5dc:	8b 75 0c             	mov    0xc(%ebp),%esi
     5df:	8b 1f                	mov    (%edi),%ebx
     5e1:	39 f3                	cmp    %esi,%ebx
     5e3:	72 12                	jb     5f7 <peek+0x27>
     5e5:	eb 28                	jmp    60f <peek+0x3f>
     5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ee:	66 90                	xchg   %ax,%ax
     5f0:	83 c3 01             	add    $0x1,%ebx
     5f3:	39 de                	cmp    %ebx,%esi
     5f5:	74 18                	je     60f <peek+0x3f>
     5f7:	0f be 03             	movsbl (%ebx),%eax
     5fa:	83 ec 08             	sub    $0x8,%esp
     5fd:	50                   	push   %eax
     5fe:	68 cc 19 00 00       	push   $0x19cc
     603:	e8 a8 06 00 00       	call   cb0 <strchr>
     608:	83 c4 10             	add    $0x10,%esp
     60b:	85 c0                	test   %eax,%eax
     60d:	75 e1                	jne    5f0 <peek+0x20>
     60f:	89 1f                	mov    %ebx,(%edi)
     611:	0f be 03             	movsbl (%ebx),%eax
     614:	31 d2                	xor    %edx,%edx
     616:	84 c0                	test   %al,%al
     618:	75 0e                	jne    628 <peek+0x58>
     61a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     61d:	89 d0                	mov    %edx,%eax
     61f:	5b                   	pop    %ebx
     620:	5e                   	pop    %esi
     621:	5f                   	pop    %edi
     622:	5d                   	pop    %ebp
     623:	c3                   	ret    
     624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     628:	83 ec 08             	sub    $0x8,%esp
     62b:	50                   	push   %eax
     62c:	ff 75 10             	push   0x10(%ebp)
     62f:	e8 7c 06 00 00       	call   cb0 <strchr>
     634:	83 c4 10             	add    $0x10,%esp
     637:	31 d2                	xor    %edx,%edx
     639:	85 c0                	test   %eax,%eax
     63b:	0f 95 c2             	setne  %dl
     63e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     641:	5b                   	pop    %ebx
     642:	89 d0                	mov    %edx,%eax
     644:	5e                   	pop    %esi
     645:	5f                   	pop    %edi
     646:	5d                   	pop    %ebp
     647:	c3                   	ret    
     648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     64f:	90                   	nop

00000650 <parseredirs>:
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 2c             	sub    $0x2c,%esp
     659:	8b 75 0c             	mov    0xc(%ebp),%esi
     65c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     65f:	90                   	nop
     660:	83 ec 04             	sub    $0x4,%esp
     663:	68 f9 12 00 00       	push   $0x12f9
     668:	53                   	push   %ebx
     669:	56                   	push   %esi
     66a:	e8 61 ff ff ff       	call   5d0 <peek>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	0f 84 f6 00 00 00    	je     770 <parseredirs+0x120>
     67a:	6a 00                	push   $0x0
     67c:	6a 00                	push   $0x0
     67e:	53                   	push   %ebx
     67f:	56                   	push   %esi
     680:	e8 eb fd ff ff       	call   470 <gettoken>
     685:	89 c7                	mov    %eax,%edi
     687:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     68a:	50                   	push   %eax
     68b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     68e:	50                   	push   %eax
     68f:	53                   	push   %ebx
     690:	56                   	push   %esi
     691:	e8 da fd ff ff       	call   470 <gettoken>
     696:	83 c4 20             	add    $0x20,%esp
     699:	83 f8 61             	cmp    $0x61,%eax
     69c:	0f 85 d9 00 00 00    	jne    77b <parseredirs+0x12b>
     6a2:	83 ff 3c             	cmp    $0x3c,%edi
     6a5:	74 69                	je     710 <parseredirs+0xc0>
     6a7:	83 ff 3e             	cmp    $0x3e,%edi
     6aa:	74 05                	je     6b1 <parseredirs+0x61>
     6ac:	83 ff 2b             	cmp    $0x2b,%edi
     6af:	75 af                	jne    660 <parseredirs+0x10>
     6b1:	83 ec 0c             	sub    $0xc,%esp
     6b4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6b7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
     6ba:	6a 18                	push   $0x18
     6bc:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6bf:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
     6c2:	e8 e9 0a 00 00       	call   11b0 <malloc>
     6c7:	83 c4 0c             	add    $0xc,%esp
     6ca:	6a 18                	push   $0x18
     6cc:	89 c7                	mov    %eax,%edi
     6ce:	6a 00                	push   $0x0
     6d0:	50                   	push   %eax
     6d1:	e8 ba 05 00 00       	call   c90 <memset>
     6d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
     6dc:	8b 45 08             	mov    0x8(%ebp),%eax
     6df:	83 c4 10             	add    $0x10,%esp
     6e2:	89 47 04             	mov    %eax,0x4(%edi)
     6e5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6e8:	89 4f 08             	mov    %ecx,0x8(%edi)
     6eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
     6ee:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
     6f5:	89 57 0c             	mov    %edx,0xc(%edi)
     6f8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
     6ff:	89 7d 08             	mov    %edi,0x8(%ebp)
     702:	e9 59 ff ff ff       	jmp    660 <parseredirs+0x10>
     707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     70e:	66 90                	xchg   %ax,%ax
     710:	83 ec 0c             	sub    $0xc,%esp
     713:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     716:	8b 4d e0             	mov    -0x20(%ebp),%ecx
     719:	6a 18                	push   $0x18
     71b:	89 55 d0             	mov    %edx,-0x30(%ebp)
     71e:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
     721:	e8 8a 0a 00 00       	call   11b0 <malloc>
     726:	83 c4 0c             	add    $0xc,%esp
     729:	6a 18                	push   $0x18
     72b:	89 c7                	mov    %eax,%edi
     72d:	6a 00                	push   $0x0
     72f:	50                   	push   %eax
     730:	e8 5b 05 00 00       	call   c90 <memset>
     735:	8b 45 08             	mov    0x8(%ebp),%eax
     738:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     73b:	89 7d 08             	mov    %edi,0x8(%ebp)
     73e:	8b 55 d0             	mov    -0x30(%ebp),%edx
     741:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
     747:	83 c4 10             	add    $0x10,%esp
     74a:	89 47 04             	mov    %eax,0x4(%edi)
     74d:	89 4f 08             	mov    %ecx,0x8(%edi)
     750:	89 57 0c             	mov    %edx,0xc(%edi)
     753:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
     75a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
     761:	e9 fa fe ff ff       	jmp    660 <parseredirs+0x10>
     766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     76d:	8d 76 00             	lea    0x0(%esi),%esi
     770:	8b 45 08             	mov    0x8(%ebp),%eax
     773:	8d 65 f4             	lea    -0xc(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5f                   	pop    %edi
     779:	5d                   	pop    %ebp
     77a:	c3                   	ret    
     77b:	83 ec 0c             	sub    $0xc,%esp
     77e:	68 dc 12 00 00       	push   $0x12dc
     783:	e8 e8 f9 ff ff       	call   170 <panic>
     788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     78f:	90                   	nop

00000790 <parseexec>:
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	83 ec 30             	sub    $0x30,%esp
     799:	8b 75 08             	mov    0x8(%ebp),%esi
     79c:	8b 7d 0c             	mov    0xc(%ebp),%edi
     79f:	68 fc 12 00 00       	push   $0x12fc
     7a4:	57                   	push   %edi
     7a5:	56                   	push   %esi
     7a6:	e8 25 fe ff ff       	call   5d0 <peek>
     7ab:	83 c4 10             	add    $0x10,%esp
     7ae:	85 c0                	test   %eax,%eax
     7b0:	0f 85 aa 00 00 00    	jne    860 <parseexec+0xd0>
     7b6:	83 ec 0c             	sub    $0xc,%esp
     7b9:	89 c3                	mov    %eax,%ebx
     7bb:	6a 54                	push   $0x54
     7bd:	e8 ee 09 00 00       	call   11b0 <malloc>
     7c2:	83 c4 0c             	add    $0xc,%esp
     7c5:	6a 54                	push   $0x54
     7c7:	6a 00                	push   $0x0
     7c9:	50                   	push   %eax
     7ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7cd:	e8 be 04 00 00       	call   c90 <memset>
     7d2:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7d5:	83 c4 0c             	add    $0xc,%esp
     7d8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
     7de:	57                   	push   %edi
     7df:	56                   	push   %esi
     7e0:	50                   	push   %eax
     7e1:	e8 6a fe ff ff       	call   650 <parseredirs>
     7e6:	83 c4 10             	add    $0x10,%esp
     7e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     7ec:	eb 15                	jmp    803 <parseexec+0x73>
     7ee:	66 90                	xchg   %ax,%ax
     7f0:	83 ec 04             	sub    $0x4,%esp
     7f3:	57                   	push   %edi
     7f4:	56                   	push   %esi
     7f5:	ff 75 d4             	push   -0x2c(%ebp)
     7f8:	e8 53 fe ff ff       	call   650 <parseredirs>
     7fd:	83 c4 10             	add    $0x10,%esp
     800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     803:	83 ec 04             	sub    $0x4,%esp
     806:	68 13 13 00 00       	push   $0x1313
     80b:	57                   	push   %edi
     80c:	56                   	push   %esi
     80d:	e8 be fd ff ff       	call   5d0 <peek>
     812:	83 c4 10             	add    $0x10,%esp
     815:	85 c0                	test   %eax,%eax
     817:	75 5f                	jne    878 <parseexec+0xe8>
     819:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     81c:	50                   	push   %eax
     81d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     820:	50                   	push   %eax
     821:	57                   	push   %edi
     822:	56                   	push   %esi
     823:	e8 48 fc ff ff       	call   470 <gettoken>
     828:	83 c4 10             	add    $0x10,%esp
     82b:	85 c0                	test   %eax,%eax
     82d:	74 49                	je     878 <parseexec+0xe8>
     82f:	83 f8 61             	cmp    $0x61,%eax
     832:	75 62                	jne    896 <parseexec+0x106>
     834:	8b 45 e0             	mov    -0x20(%ebp),%eax
     837:	8b 55 d0             	mov    -0x30(%ebp),%edx
     83a:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
     83e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     841:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
     845:	83 c3 01             	add    $0x1,%ebx
     848:	83 fb 0a             	cmp    $0xa,%ebx
     84b:	75 a3                	jne    7f0 <parseexec+0x60>
     84d:	83 ec 0c             	sub    $0xc,%esp
     850:	68 05 13 00 00       	push   $0x1305
     855:	e8 16 f9 ff ff       	call   170 <panic>
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     860:	89 7d 0c             	mov    %edi,0xc(%ebp)
     863:	89 75 08             	mov    %esi,0x8(%ebp)
     866:	8d 65 f4             	lea    -0xc(%ebp),%esp
     869:	5b                   	pop    %ebx
     86a:	5e                   	pop    %esi
     86b:	5f                   	pop    %edi
     86c:	5d                   	pop    %ebp
     86d:	e9 ae 01 00 00       	jmp    a20 <parseblock>
     872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     878:	8b 45 d0             	mov    -0x30(%ebp),%eax
     87b:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     882:	00 
     883:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     88a:	00 
     88b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     88e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     891:	5b                   	pop    %ebx
     892:	5e                   	pop    %esi
     893:	5f                   	pop    %edi
     894:	5d                   	pop    %ebp
     895:	c3                   	ret    
     896:	83 ec 0c             	sub    $0xc,%esp
     899:	68 fe 12 00 00       	push   $0x12fe
     89e:	e8 cd f8 ff ff       	call   170 <panic>
     8a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008b0 <parsepipe>:
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	57                   	push   %edi
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	83 ec 14             	sub    $0x14,%esp
     8b9:	8b 75 08             	mov    0x8(%ebp),%esi
     8bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
     8bf:	57                   	push   %edi
     8c0:	56                   	push   %esi
     8c1:	e8 ca fe ff ff       	call   790 <parseexec>
     8c6:	83 c4 0c             	add    $0xc,%esp
     8c9:	68 18 13 00 00       	push   $0x1318
     8ce:	89 c3                	mov    %eax,%ebx
     8d0:	57                   	push   %edi
     8d1:	56                   	push   %esi
     8d2:	e8 f9 fc ff ff       	call   5d0 <peek>
     8d7:	83 c4 10             	add    $0x10,%esp
     8da:	85 c0                	test   %eax,%eax
     8dc:	75 12                	jne    8f0 <parsepipe+0x40>
     8de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e1:	89 d8                	mov    %ebx,%eax
     8e3:	5b                   	pop    %ebx
     8e4:	5e                   	pop    %esi
     8e5:	5f                   	pop    %edi
     8e6:	5d                   	pop    %ebp
     8e7:	c3                   	ret    
     8e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8ef:	90                   	nop
     8f0:	6a 00                	push   $0x0
     8f2:	6a 00                	push   $0x0
     8f4:	57                   	push   %edi
     8f5:	56                   	push   %esi
     8f6:	e8 75 fb ff ff       	call   470 <gettoken>
     8fb:	58                   	pop    %eax
     8fc:	5a                   	pop    %edx
     8fd:	57                   	push   %edi
     8fe:	56                   	push   %esi
     8ff:	e8 ac ff ff ff       	call   8b0 <parsepipe>
     904:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     90b:	89 c7                	mov    %eax,%edi
     90d:	e8 9e 08 00 00       	call   11b0 <malloc>
     912:	83 c4 0c             	add    $0xc,%esp
     915:	6a 0c                	push   $0xc
     917:	89 c6                	mov    %eax,%esi
     919:	6a 00                	push   $0x0
     91b:	50                   	push   %eax
     91c:	e8 6f 03 00 00       	call   c90 <memset>
     921:	89 5e 04             	mov    %ebx,0x4(%esi)
     924:	83 c4 10             	add    $0x10,%esp
     927:	89 f3                	mov    %esi,%ebx
     929:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
     92f:	89 d8                	mov    %ebx,%eax
     931:	89 7e 08             	mov    %edi,0x8(%esi)
     934:	8d 65 f4             	lea    -0xc(%ebp),%esp
     937:	5b                   	pop    %ebx
     938:	5e                   	pop    %esi
     939:	5f                   	pop    %edi
     93a:	5d                   	pop    %ebp
     93b:	c3                   	ret    
     93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <parseline>:
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	57                   	push   %edi
     944:	56                   	push   %esi
     945:	53                   	push   %ebx
     946:	83 ec 24             	sub    $0x24,%esp
     949:	8b 75 08             	mov    0x8(%ebp),%esi
     94c:	8b 7d 0c             	mov    0xc(%ebp),%edi
     94f:	57                   	push   %edi
     950:	56                   	push   %esi
     951:	e8 5a ff ff ff       	call   8b0 <parsepipe>
     956:	83 c4 10             	add    $0x10,%esp
     959:	89 c3                	mov    %eax,%ebx
     95b:	eb 3b                	jmp    998 <parseline+0x58>
     95d:	8d 76 00             	lea    0x0(%esi),%esi
     960:	6a 00                	push   $0x0
     962:	6a 00                	push   $0x0
     964:	57                   	push   %edi
     965:	56                   	push   %esi
     966:	e8 05 fb ff ff       	call   470 <gettoken>
     96b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     972:	e8 39 08 00 00       	call   11b0 <malloc>
     977:	83 c4 0c             	add    $0xc,%esp
     97a:	6a 08                	push   $0x8
     97c:	6a 00                	push   $0x0
     97e:	50                   	push   %eax
     97f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     982:	e8 09 03 00 00       	call   c90 <memset>
     987:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     98a:	83 c4 10             	add    $0x10,%esp
     98d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
     993:	89 5a 04             	mov    %ebx,0x4(%edx)
     996:	89 d3                	mov    %edx,%ebx
     998:	83 ec 04             	sub    $0x4,%esp
     99b:	68 1a 13 00 00       	push   $0x131a
     9a0:	57                   	push   %edi
     9a1:	56                   	push   %esi
     9a2:	e8 29 fc ff ff       	call   5d0 <peek>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	85 c0                	test   %eax,%eax
     9ac:	75 b2                	jne    960 <parseline+0x20>
     9ae:	83 ec 04             	sub    $0x4,%esp
     9b1:	68 16 13 00 00       	push   $0x1316
     9b6:	57                   	push   %edi
     9b7:	56                   	push   %esi
     9b8:	e8 13 fc ff ff       	call   5d0 <peek>
     9bd:	83 c4 10             	add    $0x10,%esp
     9c0:	85 c0                	test   %eax,%eax
     9c2:	75 0c                	jne    9d0 <parseline+0x90>
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	89 d8                	mov    %ebx,%eax
     9c9:	5b                   	pop    %ebx
     9ca:	5e                   	pop    %esi
     9cb:	5f                   	pop    %edi
     9cc:	5d                   	pop    %ebp
     9cd:	c3                   	ret    
     9ce:	66 90                	xchg   %ax,%ax
     9d0:	6a 00                	push   $0x0
     9d2:	6a 00                	push   $0x0
     9d4:	57                   	push   %edi
     9d5:	56                   	push   %esi
     9d6:	e8 95 fa ff ff       	call   470 <gettoken>
     9db:	58                   	pop    %eax
     9dc:	5a                   	pop    %edx
     9dd:	57                   	push   %edi
     9de:	56                   	push   %esi
     9df:	e8 5c ff ff ff       	call   940 <parseline>
     9e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     9eb:	89 c7                	mov    %eax,%edi
     9ed:	e8 be 07 00 00       	call   11b0 <malloc>
     9f2:	83 c4 0c             	add    $0xc,%esp
     9f5:	6a 0c                	push   $0xc
     9f7:	89 c6                	mov    %eax,%esi
     9f9:	6a 00                	push   $0x0
     9fb:	50                   	push   %eax
     9fc:	e8 8f 02 00 00       	call   c90 <memset>
     a01:	89 5e 04             	mov    %ebx,0x4(%esi)
     a04:	83 c4 10             	add    $0x10,%esp
     a07:	89 f3                	mov    %esi,%ebx
     a09:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
     a0f:	89 d8                	mov    %ebx,%eax
     a11:	89 7e 08             	mov    %edi,0x8(%esi)
     a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a17:	5b                   	pop    %ebx
     a18:	5e                   	pop    %esi
     a19:	5f                   	pop    %edi
     a1a:	5d                   	pop    %ebp
     a1b:	c3                   	ret    
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a20 <parseblock>:
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	83 ec 10             	sub    $0x10,%esp
     a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
     a2f:	68 fc 12 00 00       	push   $0x12fc
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	e8 95 fb ff ff       	call   5d0 <peek>
     a3b:	83 c4 10             	add    $0x10,%esp
     a3e:	85 c0                	test   %eax,%eax
     a40:	74 4a                	je     a8c <parseblock+0x6c>
     a42:	6a 00                	push   $0x0
     a44:	6a 00                	push   $0x0
     a46:	56                   	push   %esi
     a47:	53                   	push   %ebx
     a48:	e8 23 fa ff ff       	call   470 <gettoken>
     a4d:	58                   	pop    %eax
     a4e:	5a                   	pop    %edx
     a4f:	56                   	push   %esi
     a50:	53                   	push   %ebx
     a51:	e8 ea fe ff ff       	call   940 <parseline>
     a56:	83 c4 0c             	add    $0xc,%esp
     a59:	68 38 13 00 00       	push   $0x1338
     a5e:	89 c7                	mov    %eax,%edi
     a60:	56                   	push   %esi
     a61:	53                   	push   %ebx
     a62:	e8 69 fb ff ff       	call   5d0 <peek>
     a67:	83 c4 10             	add    $0x10,%esp
     a6a:	85 c0                	test   %eax,%eax
     a6c:	74 2b                	je     a99 <parseblock+0x79>
     a6e:	6a 00                	push   $0x0
     a70:	6a 00                	push   $0x0
     a72:	56                   	push   %esi
     a73:	53                   	push   %ebx
     a74:	e8 f7 f9 ff ff       	call   470 <gettoken>
     a79:	83 c4 0c             	add    $0xc,%esp
     a7c:	56                   	push   %esi
     a7d:	53                   	push   %ebx
     a7e:	57                   	push   %edi
     a7f:	e8 cc fb ff ff       	call   650 <parseredirs>
     a84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a87:	5b                   	pop    %ebx
     a88:	5e                   	pop    %esi
     a89:	5f                   	pop    %edi
     a8a:	5d                   	pop    %ebp
     a8b:	c3                   	ret    
     a8c:	83 ec 0c             	sub    $0xc,%esp
     a8f:	68 1c 13 00 00       	push   $0x131c
     a94:	e8 d7 f6 ff ff       	call   170 <panic>
     a99:	83 ec 0c             	sub    $0xc,%esp
     a9c:	68 27 13 00 00       	push   $0x1327
     aa1:	e8 ca f6 ff ff       	call   170 <panic>
     aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     aad:	8d 76 00             	lea    0x0(%esi),%esi

00000ab0 <nulterminate>:
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	53                   	push   %ebx
     ab4:	83 ec 04             	sub    $0x4,%esp
     ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
     aba:	85 db                	test   %ebx,%ebx
     abc:	0f 84 8e 00 00 00    	je     b50 <nulterminate+0xa0>
     ac2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ac5:	77 61                	ja     b28 <nulterminate+0x78>
     ac7:	8b 03                	mov    (%ebx),%eax
     ac9:	ff 24 85 78 13 00 00 	jmp    *0x1378(,%eax,4)
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	push   0x4(%ebx)
     ad6:	e8 d5 ff ff ff       	call   ab0 <nulterminate>
     adb:	58                   	pop    %eax
     adc:	ff 73 08             	push   0x8(%ebx)
     adf:	e8 cc ff ff ff       	call   ab0 <nulterminate>
     ae4:	83 c4 10             	add    $0x10,%esp
     ae7:	89 d8                	mov    %ebx,%eax
     ae9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aec:	c9                   	leave  
     aed:	c3                   	ret    
     aee:	66 90                	xchg   %ax,%ax
     af0:	83 ec 0c             	sub    $0xc,%esp
     af3:	ff 73 04             	push   0x4(%ebx)
     af6:	e8 b5 ff ff ff       	call   ab0 <nulterminate>
     afb:	89 d8                	mov    %ebx,%eax
     afd:	83 c4 10             	add    $0x10,%esp
     b00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b03:	c9                   	leave  
     b04:	c3                   	ret    
     b05:	8d 76 00             	lea    0x0(%esi),%esi
     b08:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b0b:	8d 43 08             	lea    0x8(%ebx),%eax
     b0e:	85 c9                	test   %ecx,%ecx
     b10:	74 16                	je     b28 <nulterminate+0x78>
     b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b18:	8b 50 24             	mov    0x24(%eax),%edx
     b1b:	83 c0 04             	add    $0x4,%eax
     b1e:	c6 02 00             	movb   $0x0,(%edx)
     b21:	8b 50 fc             	mov    -0x4(%eax),%edx
     b24:	85 d2                	test   %edx,%edx
     b26:	75 f0                	jne    b18 <nulterminate+0x68>
     b28:	89 d8                	mov    %ebx,%eax
     b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b2d:	c9                   	leave  
     b2e:	c3                   	ret    
     b2f:	90                   	nop
     b30:	83 ec 0c             	sub    $0xc,%esp
     b33:	ff 73 04             	push   0x4(%ebx)
     b36:	e8 75 ff ff ff       	call   ab0 <nulterminate>
     b3b:	8b 43 0c             	mov    0xc(%ebx),%eax
     b3e:	83 c4 10             	add    $0x10,%esp
     b41:	c6 00 00             	movb   $0x0,(%eax)
     b44:	89 d8                	mov    %ebx,%eax
     b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b49:	c9                   	leave  
     b4a:	c3                   	ret    
     b4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b4f:	90                   	nop
     b50:	31 c0                	xor    %eax,%eax
     b52:	eb 95                	jmp    ae9 <nulterminate+0x39>
     b54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b5f:	90                   	nop

00000b60 <parsecmd>:
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
     b65:	8d 7d 08             	lea    0x8(%ebp),%edi
     b68:	53                   	push   %ebx
     b69:	83 ec 18             	sub    $0x18,%esp
     b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b6f:	53                   	push   %ebx
     b70:	e8 eb 00 00 00       	call   c60 <strlen>
     b75:	59                   	pop    %ecx
     b76:	5e                   	pop    %esi
     b77:	01 c3                	add    %eax,%ebx
     b79:	53                   	push   %ebx
     b7a:	57                   	push   %edi
     b7b:	e8 c0 fd ff ff       	call   940 <parseline>
     b80:	83 c4 0c             	add    $0xc,%esp
     b83:	68 c6 12 00 00       	push   $0x12c6
     b88:	89 c6                	mov    %eax,%esi
     b8a:	53                   	push   %ebx
     b8b:	57                   	push   %edi
     b8c:	e8 3f fa ff ff       	call   5d0 <peek>
     b91:	8b 45 08             	mov    0x8(%ebp),%eax
     b94:	83 c4 10             	add    $0x10,%esp
     b97:	39 d8                	cmp    %ebx,%eax
     b99:	75 13                	jne    bae <parsecmd+0x4e>
     b9b:	83 ec 0c             	sub    $0xc,%esp
     b9e:	56                   	push   %esi
     b9f:	e8 0c ff ff ff       	call   ab0 <nulterminate>
     ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba7:	89 f0                	mov    %esi,%eax
     ba9:	5b                   	pop    %ebx
     baa:	5e                   	pop    %esi
     bab:	5f                   	pop    %edi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret    
     bae:	52                   	push   %edx
     baf:	50                   	push   %eax
     bb0:	68 3a 13 00 00       	push   $0x133a
     bb5:	6a 02                	push   $0x2
     bb7:	e8 c4 03 00 00       	call   f80 <printf>
     bbc:	c7 04 24 fe 12 00 00 	movl   $0x12fe,(%esp)
     bc3:	e8 a8 f5 ff ff       	call   170 <panic>
     bc8:	66 90                	xchg   %ax,%ax
     bca:	66 90                	xchg   %ax,%ax
     bcc:	66 90                	xchg   %ax,%ax
     bce:	66 90                	xchg   %ax,%ax

00000bd0 <strcpy>:
     bd0:	55                   	push   %ebp
     bd1:	31 c0                	xor    %eax,%eax
     bd3:	89 e5                	mov    %esp,%ebp
     bd5:	53                   	push   %ebx
     bd6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     bd9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     be0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     be4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     be7:	83 c0 01             	add    $0x1,%eax
     bea:	84 d2                	test   %dl,%dl
     bec:	75 f2                	jne    be0 <strcpy+0x10>
     bee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bf1:	89 c8                	mov    %ecx,%eax
     bf3:	c9                   	leave  
     bf4:	c3                   	ret    
     bf5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c00 <strcmp>:
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	53                   	push   %ebx
     c04:	8b 55 08             	mov    0x8(%ebp),%edx
     c07:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     c0a:	0f b6 02             	movzbl (%edx),%eax
     c0d:	84 c0                	test   %al,%al
     c0f:	75 17                	jne    c28 <strcmp+0x28>
     c11:	eb 3a                	jmp    c4d <strcmp+0x4d>
     c13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c17:	90                   	nop
     c18:	0f b6 42 01          	movzbl 0x1(%edx),%eax
     c1c:	83 c2 01             	add    $0x1,%edx
     c1f:	8d 59 01             	lea    0x1(%ecx),%ebx
     c22:	84 c0                	test   %al,%al
     c24:	74 1a                	je     c40 <strcmp+0x40>
     c26:	89 d9                	mov    %ebx,%ecx
     c28:	0f b6 19             	movzbl (%ecx),%ebx
     c2b:	38 c3                	cmp    %al,%bl
     c2d:	74 e9                	je     c18 <strcmp+0x18>
     c2f:	29 d8                	sub    %ebx,%eax
     c31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c34:	c9                   	leave  
     c35:	c3                   	ret    
     c36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c3d:	8d 76 00             	lea    0x0(%esi),%esi
     c40:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c44:	31 c0                	xor    %eax,%eax
     c46:	29 d8                	sub    %ebx,%eax
     c48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c4b:	c9                   	leave  
     c4c:	c3                   	ret    
     c4d:	0f b6 19             	movzbl (%ecx),%ebx
     c50:	31 c0                	xor    %eax,%eax
     c52:	eb db                	jmp    c2f <strcmp+0x2f>
     c54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c5f:	90                   	nop

00000c60 <strlen>:
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	8b 55 08             	mov    0x8(%ebp),%edx
     c66:	80 3a 00             	cmpb   $0x0,(%edx)
     c69:	74 15                	je     c80 <strlen+0x20>
     c6b:	31 c0                	xor    %eax,%eax
     c6d:	8d 76 00             	lea    0x0(%esi),%esi
     c70:	83 c0 01             	add    $0x1,%eax
     c73:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c77:	89 c1                	mov    %eax,%ecx
     c79:	75 f5                	jne    c70 <strlen+0x10>
     c7b:	89 c8                	mov    %ecx,%eax
     c7d:	5d                   	pop    %ebp
     c7e:	c3                   	ret    
     c7f:	90                   	nop
     c80:	31 c9                	xor    %ecx,%ecx
     c82:	5d                   	pop    %ebp
     c83:	89 c8                	mov    %ecx,%eax
     c85:	c3                   	ret    
     c86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c8d:	8d 76 00             	lea    0x0(%esi),%esi

00000c90 <memset>:
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	57                   	push   %edi
     c94:	8b 55 08             	mov    0x8(%ebp),%edx
     c97:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c9d:	89 d7                	mov    %edx,%edi
     c9f:	fc                   	cld    
     ca0:	f3 aa                	rep stos %al,%es:(%edi)
     ca2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     ca5:	89 d0                	mov    %edx,%eax
     ca7:	c9                   	leave  
     ca8:	c3                   	ret    
     ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cb0 <strchr>:
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	8b 45 08             	mov    0x8(%ebp),%eax
     cb6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
     cba:	0f b6 10             	movzbl (%eax),%edx
     cbd:	84 d2                	test   %dl,%dl
     cbf:	75 12                	jne    cd3 <strchr+0x23>
     cc1:	eb 1d                	jmp    ce0 <strchr+0x30>
     cc3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cc7:	90                   	nop
     cc8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     ccc:	83 c0 01             	add    $0x1,%eax
     ccf:	84 d2                	test   %dl,%dl
     cd1:	74 0d                	je     ce0 <strchr+0x30>
     cd3:	38 d1                	cmp    %dl,%cl
     cd5:	75 f1                	jne    cc8 <strchr+0x18>
     cd7:	5d                   	pop    %ebp
     cd8:	c3                   	ret    
     cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ce0:	31 c0                	xor    %eax,%eax
     ce2:	5d                   	pop    %ebp
     ce3:	c3                   	ret    
     ce4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ceb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cef:	90                   	nop

00000cf0 <gets>:
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	57                   	push   %edi
     cf4:	56                   	push   %esi
     cf5:	8d 7d e7             	lea    -0x19(%ebp),%edi
     cf8:	53                   	push   %ebx
     cf9:	31 db                	xor    %ebx,%ebx
     cfb:	83 ec 1c             	sub    $0x1c,%esp
     cfe:	eb 27                	jmp    d27 <gets+0x37>
     d00:	83 ec 04             	sub    $0x4,%esp
     d03:	6a 01                	push   $0x1
     d05:	57                   	push   %edi
     d06:	6a 00                	push   $0x0
     d08:	e8 2e 01 00 00       	call   e3b <read>
     d0d:	83 c4 10             	add    $0x10,%esp
     d10:	85 c0                	test   %eax,%eax
     d12:	7e 1d                	jle    d31 <gets+0x41>
     d14:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d18:	8b 55 08             	mov    0x8(%ebp),%edx
     d1b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
     d1f:	3c 0a                	cmp    $0xa,%al
     d21:	74 1d                	je     d40 <gets+0x50>
     d23:	3c 0d                	cmp    $0xd,%al
     d25:	74 19                	je     d40 <gets+0x50>
     d27:	89 de                	mov    %ebx,%esi
     d29:	83 c3 01             	add    $0x1,%ebx
     d2c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d2f:	7c cf                	jl     d00 <gets+0x10>
     d31:	8b 45 08             	mov    0x8(%ebp),%eax
     d34:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
     d38:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d3b:	5b                   	pop    %ebx
     d3c:	5e                   	pop    %esi
     d3d:	5f                   	pop    %edi
     d3e:	5d                   	pop    %ebp
     d3f:	c3                   	ret    
     d40:	8b 45 08             	mov    0x8(%ebp),%eax
     d43:	89 de                	mov    %ebx,%esi
     d45:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
     d49:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d4c:	5b                   	pop    %ebx
     d4d:	5e                   	pop    %esi
     d4e:	5f                   	pop    %edi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret    
     d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d5f:	90                   	nop

00000d60 <stat>:
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	56                   	push   %esi
     d64:	53                   	push   %ebx
     d65:	83 ec 08             	sub    $0x8,%esp
     d68:	6a 00                	push   $0x0
     d6a:	ff 75 08             	push   0x8(%ebp)
     d6d:	e8 f1 00 00 00       	call   e63 <open>
     d72:	83 c4 10             	add    $0x10,%esp
     d75:	85 c0                	test   %eax,%eax
     d77:	78 27                	js     da0 <stat+0x40>
     d79:	83 ec 08             	sub    $0x8,%esp
     d7c:	ff 75 0c             	push   0xc(%ebp)
     d7f:	89 c3                	mov    %eax,%ebx
     d81:	50                   	push   %eax
     d82:	e8 f4 00 00 00       	call   e7b <fstat>
     d87:	89 1c 24             	mov    %ebx,(%esp)
     d8a:	89 c6                	mov    %eax,%esi
     d8c:	e8 ba 00 00 00       	call   e4b <close>
     d91:	83 c4 10             	add    $0x10,%esp
     d94:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d97:	89 f0                	mov    %esi,%eax
     d99:	5b                   	pop    %ebx
     d9a:	5e                   	pop    %esi
     d9b:	5d                   	pop    %ebp
     d9c:	c3                   	ret    
     d9d:	8d 76 00             	lea    0x0(%esi),%esi
     da0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     da5:	eb ed                	jmp    d94 <stat+0x34>
     da7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dae:	66 90                	xchg   %ax,%ax

00000db0 <atoi>:
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	53                   	push   %ebx
     db4:	8b 55 08             	mov    0x8(%ebp),%edx
     db7:	0f be 02             	movsbl (%edx),%eax
     dba:	8d 48 d0             	lea    -0x30(%eax),%ecx
     dbd:	80 f9 09             	cmp    $0x9,%cl
     dc0:	b9 00 00 00 00       	mov    $0x0,%ecx
     dc5:	77 1e                	ja     de5 <atoi+0x35>
     dc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dce:	66 90                	xchg   %ax,%ax
     dd0:	83 c2 01             	add    $0x1,%edx
     dd3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     dd6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
     dda:	0f be 02             	movsbl (%edx),%eax
     ddd:	8d 58 d0             	lea    -0x30(%eax),%ebx
     de0:	80 fb 09             	cmp    $0x9,%bl
     de3:	76 eb                	jbe    dd0 <atoi+0x20>
     de5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     de8:	89 c8                	mov    %ecx,%eax
     dea:	c9                   	leave  
     deb:	c3                   	ret    
     dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000df0 <memmove>:
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	57                   	push   %edi
     df4:	8b 45 10             	mov    0x10(%ebp),%eax
     df7:	8b 55 08             	mov    0x8(%ebp),%edx
     dfa:	56                   	push   %esi
     dfb:	8b 75 0c             	mov    0xc(%ebp),%esi
     dfe:	85 c0                	test   %eax,%eax
     e00:	7e 13                	jle    e15 <memmove+0x25>
     e02:	01 d0                	add    %edx,%eax
     e04:	89 d7                	mov    %edx,%edi
     e06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e0d:	8d 76 00             	lea    0x0(%esi),%esi
     e10:	a4                   	movsb  %ds:(%esi),%es:(%edi)
     e11:	39 f8                	cmp    %edi,%eax
     e13:	75 fb                	jne    e10 <memmove+0x20>
     e15:	5e                   	pop    %esi
     e16:	89 d0                	mov    %edx,%eax
     e18:	5f                   	pop    %edi
     e19:	5d                   	pop    %ebp
     e1a:	c3                   	ret    

00000e1b <fork>:
     e1b:	b8 01 00 00 00       	mov    $0x1,%eax
     e20:	cd 40                	int    $0x40
     e22:	c3                   	ret    

00000e23 <exit>:
     e23:	b8 02 00 00 00       	mov    $0x2,%eax
     e28:	cd 40                	int    $0x40
     e2a:	c3                   	ret    

00000e2b <wait>:
     e2b:	b8 03 00 00 00       	mov    $0x3,%eax
     e30:	cd 40                	int    $0x40
     e32:	c3                   	ret    

00000e33 <pipe>:
     e33:	b8 04 00 00 00       	mov    $0x4,%eax
     e38:	cd 40                	int    $0x40
     e3a:	c3                   	ret    

00000e3b <read>:
     e3b:	b8 05 00 00 00       	mov    $0x5,%eax
     e40:	cd 40                	int    $0x40
     e42:	c3                   	ret    

00000e43 <write>:
     e43:	b8 10 00 00 00       	mov    $0x10,%eax
     e48:	cd 40                	int    $0x40
     e4a:	c3                   	ret    

00000e4b <close>:
     e4b:	b8 15 00 00 00       	mov    $0x15,%eax
     e50:	cd 40                	int    $0x40
     e52:	c3                   	ret    

00000e53 <kill>:
     e53:	b8 06 00 00 00       	mov    $0x6,%eax
     e58:	cd 40                	int    $0x40
     e5a:	c3                   	ret    

00000e5b <exec>:
     e5b:	b8 07 00 00 00       	mov    $0x7,%eax
     e60:	cd 40                	int    $0x40
     e62:	c3                   	ret    

00000e63 <open>:
     e63:	b8 0f 00 00 00       	mov    $0xf,%eax
     e68:	cd 40                	int    $0x40
     e6a:	c3                   	ret    

00000e6b <mknod>:
     e6b:	b8 11 00 00 00       	mov    $0x11,%eax
     e70:	cd 40                	int    $0x40
     e72:	c3                   	ret    

00000e73 <unlink>:
     e73:	b8 12 00 00 00       	mov    $0x12,%eax
     e78:	cd 40                	int    $0x40
     e7a:	c3                   	ret    

00000e7b <fstat>:
     e7b:	b8 08 00 00 00       	mov    $0x8,%eax
     e80:	cd 40                	int    $0x40
     e82:	c3                   	ret    

00000e83 <link>:
     e83:	b8 13 00 00 00       	mov    $0x13,%eax
     e88:	cd 40                	int    $0x40
     e8a:	c3                   	ret    

00000e8b <mkdir>:
     e8b:	b8 14 00 00 00       	mov    $0x14,%eax
     e90:	cd 40                	int    $0x40
     e92:	c3                   	ret    

00000e93 <chdir>:
     e93:	b8 09 00 00 00       	mov    $0x9,%eax
     e98:	cd 40                	int    $0x40
     e9a:	c3                   	ret    

00000e9b <dup>:
     e9b:	b8 0a 00 00 00       	mov    $0xa,%eax
     ea0:	cd 40                	int    $0x40
     ea2:	c3                   	ret    

00000ea3 <getpid>:
     ea3:	b8 0b 00 00 00       	mov    $0xb,%eax
     ea8:	cd 40                	int    $0x40
     eaa:	c3                   	ret    

00000eab <sbrk>:
     eab:	b8 0c 00 00 00       	mov    $0xc,%eax
     eb0:	cd 40                	int    $0x40
     eb2:	c3                   	ret    

00000eb3 <sleep>:
     eb3:	b8 0d 00 00 00       	mov    $0xd,%eax
     eb8:	cd 40                	int    $0x40
     eba:	c3                   	ret    

00000ebb <uptime>:
     ebb:	b8 0e 00 00 00       	mov    $0xe,%eax
     ec0:	cd 40                	int    $0x40
     ec2:	c3                   	ret    
     ec3:	66 90                	xchg   %ax,%ax
     ec5:	66 90                	xchg   %ax,%ax
     ec7:	66 90                	xchg   %ax,%ax
     ec9:	66 90                	xchg   %ax,%ax
     ecb:	66 90                	xchg   %ax,%ax
     ecd:	66 90                	xchg   %ax,%ax
     ecf:	90                   	nop

00000ed0 <printint>:
     ed0:	55                   	push   %ebp
     ed1:	89 e5                	mov    %esp,%ebp
     ed3:	57                   	push   %edi
     ed4:	56                   	push   %esi
     ed5:	53                   	push   %ebx
     ed6:	83 ec 3c             	sub    $0x3c,%esp
     ed9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
     edc:	89 d1                	mov    %edx,%ecx
     ede:	89 45 b8             	mov    %eax,-0x48(%ebp)
     ee1:	85 d2                	test   %edx,%edx
     ee3:	0f 89 7f 00 00 00    	jns    f68 <printint+0x98>
     ee9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     eed:	74 79                	je     f68 <printint+0x98>
     eef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
     ef6:	f7 d9                	neg    %ecx
     ef8:	31 db                	xor    %ebx,%ebx
     efa:	8d 75 d7             	lea    -0x29(%ebp),%esi
     efd:	8d 76 00             	lea    0x0(%esi),%esi
     f00:	89 c8                	mov    %ecx,%eax
     f02:	31 d2                	xor    %edx,%edx
     f04:	89 cf                	mov    %ecx,%edi
     f06:	f7 75 c4             	divl   -0x3c(%ebp)
     f09:	0f b6 92 f0 13 00 00 	movzbl 0x13f0(%edx),%edx
     f10:	89 45 c0             	mov    %eax,-0x40(%ebp)
     f13:	89 d8                	mov    %ebx,%eax
     f15:	8d 5b 01             	lea    0x1(%ebx),%ebx
     f18:	8b 4d c0             	mov    -0x40(%ebp),%ecx
     f1b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
     f1e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     f21:	76 dd                	jbe    f00 <printint+0x30>
     f23:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     f26:	85 c9                	test   %ecx,%ecx
     f28:	74 0c                	je     f36 <printint+0x66>
     f2a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
     f2f:	89 d8                	mov    %ebx,%eax
     f31:	ba 2d 00 00 00       	mov    $0x2d,%edx
     f36:	8b 7d b8             	mov    -0x48(%ebp),%edi
     f39:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     f3d:	eb 07                	jmp    f46 <printint+0x76>
     f3f:	90                   	nop
     f40:	0f b6 13             	movzbl (%ebx),%edx
     f43:	83 eb 01             	sub    $0x1,%ebx
     f46:	83 ec 04             	sub    $0x4,%esp
     f49:	88 55 d7             	mov    %dl,-0x29(%ebp)
     f4c:	6a 01                	push   $0x1
     f4e:	56                   	push   %esi
     f4f:	57                   	push   %edi
     f50:	e8 ee fe ff ff       	call   e43 <write>
     f55:	83 c4 10             	add    $0x10,%esp
     f58:	39 de                	cmp    %ebx,%esi
     f5a:	75 e4                	jne    f40 <printint+0x70>
     f5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f5f:	5b                   	pop    %ebx
     f60:	5e                   	pop    %esi
     f61:	5f                   	pop    %edi
     f62:	5d                   	pop    %ebp
     f63:	c3                   	ret    
     f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f68:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     f6f:	eb 87                	jmp    ef8 <printint+0x28>
     f71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f7f:	90                   	nop

00000f80 <printf>:
     f80:	55                   	push   %ebp
     f81:	89 e5                	mov    %esp,%ebp
     f83:	57                   	push   %edi
     f84:	56                   	push   %esi
     f85:	53                   	push   %ebx
     f86:	83 ec 2c             	sub    $0x2c,%esp
     f89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     f8c:	8b 75 08             	mov    0x8(%ebp),%esi
     f8f:	0f b6 13             	movzbl (%ebx),%edx
     f92:	84 d2                	test   %dl,%dl
     f94:	74 6a                	je     1000 <printf+0x80>
     f96:	8d 45 10             	lea    0x10(%ebp),%eax
     f99:	83 c3 01             	add    $0x1,%ebx
     f9c:	8d 7d e7             	lea    -0x19(%ebp),%edi
     f9f:	31 c9                	xor    %ecx,%ecx
     fa1:	89 45 d0             	mov    %eax,-0x30(%ebp)
     fa4:	eb 36                	jmp    fdc <printf+0x5c>
     fa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fad:	8d 76 00             	lea    0x0(%esi),%esi
     fb0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
     fb3:	b9 25 00 00 00       	mov    $0x25,%ecx
     fb8:	83 f8 25             	cmp    $0x25,%eax
     fbb:	74 15                	je     fd2 <printf+0x52>
     fbd:	83 ec 04             	sub    $0x4,%esp
     fc0:	88 55 e7             	mov    %dl,-0x19(%ebp)
     fc3:	6a 01                	push   $0x1
     fc5:	57                   	push   %edi
     fc6:	56                   	push   %esi
     fc7:	e8 77 fe ff ff       	call   e43 <write>
     fcc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     fcf:	83 c4 10             	add    $0x10,%esp
     fd2:	0f b6 13             	movzbl (%ebx),%edx
     fd5:	83 c3 01             	add    $0x1,%ebx
     fd8:	84 d2                	test   %dl,%dl
     fda:	74 24                	je     1000 <printf+0x80>
     fdc:	0f b6 c2             	movzbl %dl,%eax
     fdf:	85 c9                	test   %ecx,%ecx
     fe1:	74 cd                	je     fb0 <printf+0x30>
     fe3:	83 f9 25             	cmp    $0x25,%ecx
     fe6:	75 ea                	jne    fd2 <printf+0x52>
     fe8:	83 f8 25             	cmp    $0x25,%eax
     feb:	0f 84 07 01 00 00    	je     10f8 <printf+0x178>
     ff1:	83 e8 63             	sub    $0x63,%eax
     ff4:	83 f8 15             	cmp    $0x15,%eax
     ff7:	77 17                	ja     1010 <printf+0x90>
     ff9:	ff 24 85 98 13 00 00 	jmp    *0x1398(,%eax,4)
    1000:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1003:	5b                   	pop    %ebx
    1004:	5e                   	pop    %esi
    1005:	5f                   	pop    %edi
    1006:	5d                   	pop    %ebp
    1007:	c3                   	ret    
    1008:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    100f:	90                   	nop
    1010:	83 ec 04             	sub    $0x4,%esp
    1013:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1016:	6a 01                	push   $0x1
    1018:	57                   	push   %edi
    1019:	56                   	push   %esi
    101a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    101e:	e8 20 fe ff ff       	call   e43 <write>
    1023:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
    1027:	83 c4 0c             	add    $0xc,%esp
    102a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    102d:	6a 01                	push   $0x1
    102f:	57                   	push   %edi
    1030:	56                   	push   %esi
    1031:	e8 0d fe ff ff       	call   e43 <write>
    1036:	83 c4 10             	add    $0x10,%esp
    1039:	31 c9                	xor    %ecx,%ecx
    103b:	eb 95                	jmp    fd2 <printf+0x52>
    103d:	8d 76 00             	lea    0x0(%esi),%esi
    1040:	83 ec 0c             	sub    $0xc,%esp
    1043:	b9 10 00 00 00       	mov    $0x10,%ecx
    1048:	6a 00                	push   $0x0
    104a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    104d:	8b 10                	mov    (%eax),%edx
    104f:	89 f0                	mov    %esi,%eax
    1051:	e8 7a fe ff ff       	call   ed0 <printint>
    1056:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    105a:	83 c4 10             	add    $0x10,%esp
    105d:	31 c9                	xor    %ecx,%ecx
    105f:	e9 6e ff ff ff       	jmp    fd2 <printf+0x52>
    1064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1068:	8b 45 d0             	mov    -0x30(%ebp),%eax
    106b:	8b 10                	mov    (%eax),%edx
    106d:	83 c0 04             	add    $0x4,%eax
    1070:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1073:	85 d2                	test   %edx,%edx
    1075:	0f 84 8d 00 00 00    	je     1108 <printf+0x188>
    107b:	0f b6 02             	movzbl (%edx),%eax
    107e:	31 c9                	xor    %ecx,%ecx
    1080:	84 c0                	test   %al,%al
    1082:	0f 84 4a ff ff ff    	je     fd2 <printf+0x52>
    1088:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    108b:	89 d3                	mov    %edx,%ebx
    108d:	8d 76 00             	lea    0x0(%esi),%esi
    1090:	83 ec 04             	sub    $0x4,%esp
    1093:	83 c3 01             	add    $0x1,%ebx
    1096:	88 45 e7             	mov    %al,-0x19(%ebp)
    1099:	6a 01                	push   $0x1
    109b:	57                   	push   %edi
    109c:	56                   	push   %esi
    109d:	e8 a1 fd ff ff       	call   e43 <write>
    10a2:	0f b6 03             	movzbl (%ebx),%eax
    10a5:	83 c4 10             	add    $0x10,%esp
    10a8:	84 c0                	test   %al,%al
    10aa:	75 e4                	jne    1090 <printf+0x110>
    10ac:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    10af:	31 c9                	xor    %ecx,%ecx
    10b1:	e9 1c ff ff ff       	jmp    fd2 <printf+0x52>
    10b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    10c0:	83 ec 0c             	sub    $0xc,%esp
    10c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    10c8:	6a 01                	push   $0x1
    10ca:	e9 7b ff ff ff       	jmp    104a <printf+0xca>
    10cf:	90                   	nop
    10d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    10d3:	83 ec 04             	sub    $0x4,%esp
    10d6:	8b 00                	mov    (%eax),%eax
    10d8:	6a 01                	push   $0x1
    10da:	57                   	push   %edi
    10db:	56                   	push   %esi
    10dc:	88 45 e7             	mov    %al,-0x19(%ebp)
    10df:	e8 5f fd ff ff       	call   e43 <write>
    10e4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    10e8:	83 c4 10             	add    $0x10,%esp
    10eb:	31 c9                	xor    %ecx,%ecx
    10ed:	e9 e0 fe ff ff       	jmp    fd2 <printf+0x52>
    10f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10f8:	88 55 e7             	mov    %dl,-0x19(%ebp)
    10fb:	83 ec 04             	sub    $0x4,%esp
    10fe:	e9 2a ff ff ff       	jmp    102d <printf+0xad>
    1103:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1107:	90                   	nop
    1108:	ba 90 13 00 00       	mov    $0x1390,%edx
    110d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1110:	b8 28 00 00 00       	mov    $0x28,%eax
    1115:	89 d3                	mov    %edx,%ebx
    1117:	e9 74 ff ff ff       	jmp    1090 <printf+0x110>
    111c:	66 90                	xchg   %ax,%ax
    111e:	66 90                	xchg   %ax,%ax

00001120 <free>:
    1120:	55                   	push   %ebp
    1121:	a1 44 1a 00 00       	mov    0x1a44,%eax
    1126:	89 e5                	mov    %esp,%ebp
    1128:	57                   	push   %edi
    1129:	56                   	push   %esi
    112a:	53                   	push   %ebx
    112b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    112e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1138:	89 c2                	mov    %eax,%edx
    113a:	8b 00                	mov    (%eax),%eax
    113c:	39 ca                	cmp    %ecx,%edx
    113e:	73 30                	jae    1170 <free+0x50>
    1140:	39 c1                	cmp    %eax,%ecx
    1142:	72 04                	jb     1148 <free+0x28>
    1144:	39 c2                	cmp    %eax,%edx
    1146:	72 f0                	jb     1138 <free+0x18>
    1148:	8b 73 fc             	mov    -0x4(%ebx),%esi
    114b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    114e:	39 f8                	cmp    %edi,%eax
    1150:	74 30                	je     1182 <free+0x62>
    1152:	89 43 f8             	mov    %eax,-0x8(%ebx)
    1155:	8b 42 04             	mov    0x4(%edx),%eax
    1158:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    115b:	39 f1                	cmp    %esi,%ecx
    115d:	74 3a                	je     1199 <free+0x79>
    115f:	89 0a                	mov    %ecx,(%edx)
    1161:	5b                   	pop    %ebx
    1162:	89 15 44 1a 00 00    	mov    %edx,0x1a44
    1168:	5e                   	pop    %esi
    1169:	5f                   	pop    %edi
    116a:	5d                   	pop    %ebp
    116b:	c3                   	ret    
    116c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1170:	39 c2                	cmp    %eax,%edx
    1172:	72 c4                	jb     1138 <free+0x18>
    1174:	39 c1                	cmp    %eax,%ecx
    1176:	73 c0                	jae    1138 <free+0x18>
    1178:	8b 73 fc             	mov    -0x4(%ebx),%esi
    117b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    117e:	39 f8                	cmp    %edi,%eax
    1180:	75 d0                	jne    1152 <free+0x32>
    1182:	03 70 04             	add    0x4(%eax),%esi
    1185:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1188:	8b 02                	mov    (%edx),%eax
    118a:	8b 00                	mov    (%eax),%eax
    118c:	89 43 f8             	mov    %eax,-0x8(%ebx)
    118f:	8b 42 04             	mov    0x4(%edx),%eax
    1192:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1195:	39 f1                	cmp    %esi,%ecx
    1197:	75 c6                	jne    115f <free+0x3f>
    1199:	03 43 fc             	add    -0x4(%ebx),%eax
    119c:	89 15 44 1a 00 00    	mov    %edx,0x1a44
    11a2:	89 42 04             	mov    %eax,0x4(%edx)
    11a5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    11a8:	89 0a                	mov    %ecx,(%edx)
    11aa:	5b                   	pop    %ebx
    11ab:	5e                   	pop    %esi
    11ac:	5f                   	pop    %edi
    11ad:	5d                   	pop    %ebp
    11ae:	c3                   	ret    
    11af:	90                   	nop

000011b0 <malloc>:
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
    11b5:	53                   	push   %ebx
    11b6:	83 ec 1c             	sub    $0x1c,%esp
    11b9:	8b 45 08             	mov    0x8(%ebp),%eax
    11bc:	8b 3d 44 1a 00 00    	mov    0x1a44,%edi
    11c2:	8d 70 07             	lea    0x7(%eax),%esi
    11c5:	c1 ee 03             	shr    $0x3,%esi
    11c8:	83 c6 01             	add    $0x1,%esi
    11cb:	85 ff                	test   %edi,%edi
    11cd:	0f 84 9d 00 00 00    	je     1270 <malloc+0xc0>
    11d3:	8b 17                	mov    (%edi),%edx
    11d5:	8b 4a 04             	mov    0x4(%edx),%ecx
    11d8:	39 f1                	cmp    %esi,%ecx
    11da:	73 6a                	jae    1246 <malloc+0x96>
    11dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
    11e1:	39 de                	cmp    %ebx,%esi
    11e3:	0f 43 de             	cmovae %esi,%ebx
    11e6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    11ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    11f0:	eb 17                	jmp    1209 <malloc+0x59>
    11f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11f8:	8b 02                	mov    (%edx),%eax
    11fa:	8b 48 04             	mov    0x4(%eax),%ecx
    11fd:	39 f1                	cmp    %esi,%ecx
    11ff:	73 4f                	jae    1250 <malloc+0xa0>
    1201:	8b 3d 44 1a 00 00    	mov    0x1a44,%edi
    1207:	89 c2                	mov    %eax,%edx
    1209:	39 d7                	cmp    %edx,%edi
    120b:	75 eb                	jne    11f8 <malloc+0x48>
    120d:	83 ec 0c             	sub    $0xc,%esp
    1210:	ff 75 e4             	push   -0x1c(%ebp)
    1213:	e8 93 fc ff ff       	call   eab <sbrk>
    1218:	83 c4 10             	add    $0x10,%esp
    121b:	83 f8 ff             	cmp    $0xffffffff,%eax
    121e:	74 1c                	je     123c <malloc+0x8c>
    1220:	89 58 04             	mov    %ebx,0x4(%eax)
    1223:	83 ec 0c             	sub    $0xc,%esp
    1226:	83 c0 08             	add    $0x8,%eax
    1229:	50                   	push   %eax
    122a:	e8 f1 fe ff ff       	call   1120 <free>
    122f:	8b 15 44 1a 00 00    	mov    0x1a44,%edx
    1235:	83 c4 10             	add    $0x10,%esp
    1238:	85 d2                	test   %edx,%edx
    123a:	75 bc                	jne    11f8 <malloc+0x48>
    123c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    123f:	31 c0                	xor    %eax,%eax
    1241:	5b                   	pop    %ebx
    1242:	5e                   	pop    %esi
    1243:	5f                   	pop    %edi
    1244:	5d                   	pop    %ebp
    1245:	c3                   	ret    
    1246:	89 d0                	mov    %edx,%eax
    1248:	89 fa                	mov    %edi,%edx
    124a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1250:	39 ce                	cmp    %ecx,%esi
    1252:	74 4c                	je     12a0 <malloc+0xf0>
    1254:	29 f1                	sub    %esi,%ecx
    1256:	89 48 04             	mov    %ecx,0x4(%eax)
    1259:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    125c:	89 70 04             	mov    %esi,0x4(%eax)
    125f:	89 15 44 1a 00 00    	mov    %edx,0x1a44
    1265:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1268:	83 c0 08             	add    $0x8,%eax
    126b:	5b                   	pop    %ebx
    126c:	5e                   	pop    %esi
    126d:	5f                   	pop    %edi
    126e:	5d                   	pop    %ebp
    126f:	c3                   	ret    
    1270:	c7 05 44 1a 00 00 48 	movl   $0x1a48,0x1a44
    1277:	1a 00 00 
    127a:	bf 48 1a 00 00       	mov    $0x1a48,%edi
    127f:	c7 05 48 1a 00 00 48 	movl   $0x1a48,0x1a48
    1286:	1a 00 00 
    1289:	89 fa                	mov    %edi,%edx
    128b:	c7 05 4c 1a 00 00 00 	movl   $0x0,0x1a4c
    1292:	00 00 00 
    1295:	e9 42 ff ff ff       	jmp    11dc <malloc+0x2c>
    129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12a0:	8b 08                	mov    (%eax),%ecx
    12a2:	89 0a                	mov    %ecx,(%edx)
    12a4:	eb b9                	jmp    125f <malloc+0xaf>
