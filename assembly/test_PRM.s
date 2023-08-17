	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"test_PRM.c"
@ GNU C (Sourcery G++ Lite 2008q3-72) version 4.3.2 (arm-none-linux-gnueabi)
@	compiled by GNU C version 3.4.4, GMP version 4.2.2, MPFR version 2.3.1.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -imultilib armv4t -iprefix
@ /opt/arm/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/ -isysroot
@ /opt/arm/4.3.2/bin/../arm-none-linux-gnueabi/libc test_PRM.c
@ -march=armv4t -O3 -fverbose-asm
@ options enabled:  -falign-loops -fargument-alias -fauto-inc-dec
@ -fbranch-count-reg -fcaller-saves -fcommon -fcprop-registers
@ -fcrossjumping -fcse-follow-jumps -fdefer-pop
@ -fdelete-null-pointer-checks -fearly-inlining
@ -feliminate-unused-debug-types -fexpensive-optimizations
@ -fforward-propagate -ffunction-cse -fgcse -fgcse-after-reload -fgcse-lm
@ -fguess-branch-probability -fident -fif-conversion -fif-conversion2
@ -finline-functions -finline-functions-called-once
@ -finline-small-functions -fipa-pure-const -fipa-reference -fivopts
@ -fkeep-static-consts -fleading-underscore -fmath-errno -fmerge-constants
@ -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
@ -foptimize-register-move -foptimize-sibling-calls -fpeephole -fpeephole2
@ -fpredictive-commoning -freg-struct-return -fregmove -freorder-blocks
@ -freorder-functions -frerun-cse-after-loop -fsched-interblock
@ -fsched-spec -fsched-stalled-insns-dep -fschedule-insns -fschedule-insns2
@ -fsection-anchors -fsigned-zeros -fsplit-ivs-in-unroller
@ -fsplit-wide-types -fstrict-aliasing -fstrict-overflow -fthread-jumps
@ -ftoplevel-reorder -ftrapping-math -ftree-ccp -ftree-ch -ftree-copy-prop
@ -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
@ -ftree-dse -ftree-fre -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-pre -ftree-reassoc
@ -ftree-salias -ftree-scev-cprop -ftree-sink -ftree-sra -ftree-store-ccp
@ -ftree-ter -ftree-vect-loop-version -ftree-vectorize -ftree-vrp
@ -funit-at-a-time -funswitch-loops -fverbose-asm -fzero-initialized-in-bss
@ -mglibc -mlittle-endian -msched-prolog -mthumb-interwork

@ Compiler executable checksum: d3429b3d44dc83ee8ef5b80b6a06f8ca

	.text
	.align	2
	.global	setCoord
	.type	setCoord, %function
setCoord:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmia	r0, {r1, r2, r3}	@ phole stm
	bx	lr	@
	.size	setCoord, .-setCoord
	.align	2
	.global	getGPSData
	.type	getGPSData, %function
getGPSData:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16	@,,
	add	ip, sp, #4	@ tmp136,,
	stmia	ip, {r1, r2, r3}	@ tmp136,,,
	ldr	r3, [sp, #16]	@ time, time
	add	r1, sp, #8
	ldmia	r1, {r1, ip}	@ phole ldm
	ldr	r2, [sp, #4]	@ coords.x, coords.x
	str	r3, [r0, #12]	@ time, <variable>.time
	str	r2, [r0, #0]	@ coords.x, <variable>.coord.x
	stmib	r0, {r1, ip}	@ phole stm
	add	sp, sp, #16	@,,
	bx	lr
	.size	getGPSData, .-getGPSData
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 1744
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}	@,
	sub	sp, sp, #1760	@,,
	sub	sp, sp, #4	@,,
	ldr	r0, .L22	@,
	ldr	r1, .L22+4	@,
	bl	fopen	@
	subs	r7, r0, #0	@ file,
	addne	r8, sp, #576	@ tmp313,,
	subne	r8, r8, #8	@ tmp313, tmp313,
	movne	r5, #0	@ ivtmp.185,
	addne	r6, sp, #1568	@ tmp292,,
	beq	.L20	@,
.L18:
	mov	r0, r6	@, tmp292
	mov	r1, #100	@,
	mov	r2, r7	@, file
	bl	fgets	@
	subs	r4, r0, #0	@ D.2347,
	beq	.L21	@,
	mov	r0, r6	@, tmp292
	bl	strlen	@
	cmp	r0, #10	@,
	bls	.L18	@,
	add	r1, sp, #1168	@,,
	add	ip, r1, r5	@ tmp223,, ivtmp.185
	add	r1, sp, #1360	@,,
	add	r2, sp, #968	@,,
	add	r3, sp, #768	@,,
	add	r1, r1, #8	@,,
	add	lr, r2, r5	@ tmp225,, ivtmp.185
	add	r4, r3, r5	@ tmp227,, ivtmp.185
	add	r2, r8, r5	@, tmp313, ivtmp.185
	add	r3, r1, r5	@,, ivtmp.185
	mov	r0, r6	@, tmp292
	ldr	r1, .L22+8	@,
	stmia	sp, {ip, lr}	@ phole stm
	str	r4, [sp, #8]	@ tmp227,
	bl	sscanf	@
	cmp	r0, #5	@,
	add	r5, r5, #4	@ ivtmp.185, ivtmp.185,
	beq	.L18	@,
	ldr	r0, .L22+12	@,
	ldr	r1, .L22+16	@,
	mov	r2, #65	@,
	ldr	r3, .L22+20	@,
	bl	__assert_fail	@
.L21:
	mov	r0, r7	@, file
	bl	fclose	@
	add	r2, sp, #768	@,,
	add	fp, sp, #64	@ tmp303,,
	add	r7, sp, #1360	@ ivtmp.160,,
	str	r2, [sp, #52]	@, ivtmp.176
	mov	r9, r4	@ ivtmp.156, D.2347
	sub	fp, fp, #8	@ tmp303, tmp303,
	add	r7, r7, #8	@ ivtmp.160, ivtmp.160,
	add	r8, sp, #1168	@ ivtmp.162,,
	add	sl, sp, #968	@ ivtmp.164,,
.L13:
	add	r3, sp, #1168	@,,
	ldr	r2, [r3, r9]	@ D.2350, Y_gen
	add	r3, sp, #768	@,,
	ldr	r0, [r3, r9]	@ D.2369, time_gen
	ldr	r3, [sl, #8]	@, Z_gen
	str	r3, [sp, #24]	@, D.2359
	ldr	r3, [r7, #12]	@, X_gen
	str	r3, [sp, #28]	@, D.2361
	ldr	r3, [r8, #12]	@, Y_gen
	str	r3, [sp, #32]	@, D.2362
	ldr	r3, [sl, #12]	@, Z_gen
	add	ip, sp, #968	@,,
	str	r3, [sp, #36]	@, D.2363
	ldr	r3, [r7, #16]	@, X_gen
	ldr	r1, [ip, r9]	@ D.2351, Z_gen
	add	ip, sp, #1360	@,,
	str	r3, [sp, #40]	@, D.2365
	add	ip, ip, #8	@,,
	ldr	r3, [r8, #16]	@, Y_gen
	ldr	ip, [ip, r9]	@, X_gen
	str	r3, [sp, #44]	@, D.2366
	ldr	r3, [sl, #16]	@, Z_gen
	str	ip, [sp, #20]	@,
	str	r3, [sp, #48]	@, D.2367
	ldr	r3, [sp, #20]	@,
	ldr	lr, [r8, #4]	@ D.2354, Y_gen
	ldr	r5, [r7, #8]	@ D.2357, X_gen
	ldr	r6, [r8, #8]	@ D.2358, Y_gen
	ldr	ip, [r7, #4]	@ D.2353, X_gen
	ldr	r4, [sl, #4]	@ D.2355, Z_gen
	str	r2, [sp, #1672]	@ D.2350, <variable>.coord.y
	str	r1, [sp, #1676]	@ D.2351, <variable>.coord.z
	str	r0, [sp, #1680]	@ D.2369, <variable>.time
	ldr	r1, [sp, #52]	@, ivtmp.176
	str	r3, [sp, #1668]	@, <variable>.coord.x
	ldr	r3, [r1, #4]	@ D.2371, time_gen
	str	lr, [sp, #1688]	@ D.2354, <variable>.coord.y
	str	ip, [sp, #1684]	@ D.2353, <variable>.coord.x
	str	r4, [sp, #1692]	@ D.2355, <variable>.coord.z
	str	r3, [sp, #1696]	@ D.2371, <variable>.time
	ldr	r3, [sp, #24]	@, D.2359
	ldr	r2, [r1, #8]	@ D.2373, time_gen
	ldr	ip, [sp, #28]	@, D.2361
	str	r5, [sp, #1700]	@ D.2357, <variable>.coord.x
	str	r6, [sp, #1704]	@ D.2358, <variable>.coord.y
	str	r2, [sp, #1712]	@ D.2373, <variable>.time
	str	r3, [sp, #1708]	@, <variable>.coord.z
	ldr	r3, [r1, #12]	@ D.2375, time_gen
	str	ip, [sp, #1716]	@, <variable>.coord.x
	ldr	ip, [sp, #32]	@, D.2362
	str	ip, [sp, #1720]	@, <variable>.coord.y
	ldr	ip, [sp, #36]	@, D.2363
	mov	r2, #512	@,
	mov	r1, #0	@,
	mov	r0, fp	@, tmp303
	str	ip, [sp, #1724]	@, <variable>.coord.z
	str	r3, [sp, #1728]	@ D.2375, <variable>.time
	bl	memset	@
	ldr	r0, .L22+24	@,
	bl	puts	@
	add	r1, sp, #1744	@,,
	add	r1, r1, #8	@,,
	mov	r0, #1	@,
	bl	clock_gettime	@
	add	r0, sp, #1728	@,,
	add	r1, sp, #1664	@,,
	mov	r2, fp	@, tmp303
	add	r0, r0, #4	@,,
	add	r1, r1, #4	@,,
	bl	PRM	@
	add	r1, sp, #1744	@,,
	mov	r0, #1	@,
	bl	clock_gettime	@
	ldr	r0, .L22+28	@,
	ldr	r6, [sp, #1748]	@ D.2376, end.tv_nsec
	ldr	r5, [sp, #1756]	@ D.2377, start.tv_nsec
	mov	r4, #0	@ ivtmp.147,
	bl	puts	@
	b	.L10	@
.L12:
	ldr	r1, [sp, #1756]	@ start.tv_nsec, start.tv_nsec
	add	r4, r4, #8	@ ivtmp.147, ivtmp.147,
	rsb	r1, r1, r3	@, start.tv_nsec, D.2379
	ldr	r0, .L22+32	@,
	bl	printf	@
	cmp	r4, #512	@ ivtmp.147,
	beq	.L11	@,
.L10:
	add	r3, fp, r4	@ tmp257, tmp303, ivtmp.147
	ldr	r3, [r3, #4]	@ D.2379, <variable>.tv_nsec
	cmp	r3, #0	@ D.2379,
	bne	.L12	@,
.L11:
	rsb	r1, r5, r6	@, D.2377, D.2376
	ldr	r0, .L22+36	@,
	bl	printf	@
	ldr	r0, .L22+40	@,
	bl	puts	@
	ldr	r1, [sp, #1732]	@, emitter_PRM_coords.x
	ldr	r0, .L22+44	@,
	bl	printf	@
	ldr	r1, [sp, #1736]	@, emitter_PRM_coords.y
	ldr	r0, .L22+48	@,
	bl	printf	@
	ldr	r1, [sp, #1740]	@, emitter_PRM_coords.z
	ldr	r0, .L22+52	@,
	bl	printf	@
	ldr	r0, .L22+56	@,
	bl	puts	@
	ldr	r1, [sp, #40]	@, D.2365
	ldr	r0, .L22+44	@,
	bl	printf	@
	ldr	r1, [sp, #44]	@, D.2366
	ldr	r0, .L22+48	@,
	bl	printf	@
	ldr	r1, [sp, #48]	@, D.2367
	ldr	r0, .L22+52	@,
	bl	printf	@
	ldr	r0, .L22+60	@,
	bl	puts	@
	ldr	r2, [sp, #40]	@, D.2365
	ldr	r1, [sp, #1732]	@ emitter_PRM_coords.x, emitter_PRM_coords.x
	ldr	r0, .L22+44	@,
	rsb	r1, r2, r1	@,, emitter_PRM_coords.x
	bl	printf	@
	ldr	r3, [sp, #44]	@, D.2366
	ldr	r1, [sp, #1736]	@ emitter_PRM_coords.y, emitter_PRM_coords.y
	ldr	r0, .L22+48	@,
	rsb	r1, r3, r1	@,, emitter_PRM_coords.y
	bl	printf	@
	ldr	r1, [sp, #1740]	@ emitter_PRM_coords.z, emitter_PRM_coords.z
	ldr	ip, [sp, #48]	@, D.2367
	ldr	r0, .L22+52	@,
	rsb	r1, ip, r1	@,, emitter_PRM_coords.z
	bl	printf	@
	ldr	r1, [sp, #52]	@, ivtmp.176
	add	r9, r9, #20	@ ivtmp.156, ivtmp.156,
	add	r1, r1, #20	@,,
	cmp	r9, #200	@ ivtmp.156,
	add	r7, r7, #20	@ ivtmp.160, ivtmp.160,
	add	r8, r8, #20	@ ivtmp.162, ivtmp.162,
	add	sl, sl, #20	@ ivtmp.164, ivtmp.164,
	str	r1, [sp, #52]	@, ivtmp.176
	bne	.L13	@,
	ldr	r0, .L22+64	@,
	bl	puts	@
	mov	r0, #0	@ D.2337,
.L7:
	add	sp, sp, #740	@,,
	add	sp, sp, #1024	@,
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L20:
	ldr	r0, .L22+68	@,
	bl	perror	@
	mov	r0, #1	@ D.2337,
	b	.L7	@
.L23:
	.align	2
.L22:
	.word	.LC0
	.word	.LC1
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LANCHOR0
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC2
	.size	main, .-main
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__PRETTY_FUNCTION__.2320, %object
	.size	__PRETTY_FUNCTION__.2320, 5
__PRETTY_FUNCTION__.2320:
	.ascii	"main\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"./test_gen.txt\000"
	.space	1
.LC1:
	.ascii	"r\000"
	.space	2
.LC2:
	.ascii	"Error opening this file\000"
.LC3:
	.ascii	"%d %d %d %d %d\000"
	.space	1
.LC4:
	.ascii	"sscanf(line, \"%d %d %d %d %d\", &satellite_id[i], "
	.ascii	"&X_gen[i], &Y_gen[i], &Z_gen[i], &time_gen[i]) == 5"
	.ascii	"\000"
	.space	3
.LC5:
	.ascii	"test_PRM.c\000"
	.space	1
.LC6:
	.ascii	"\012*Benchmarking enabled*\012\000"
	.space	3
.LC7:
	.ascii	"benchmark timestamps:\000"
	.space	2
.LC8:
	.ascii	"%d\012\000"
.LC9:
	.ascii	"PRM complete in %d nanoseconds\012\000"
.LC10:
	.ascii	"\012Emitter calculated coords: \012\000"
	.space	2
.LC11:
	.ascii	"\011 x: %10d\012\000"
	.space	1
.LC12:
	.ascii	"\011 y: %10d\012\000"
	.space	1
.LC13:
	.ascii	"\011 z: %10d\012\000"
	.space	1
.LC14:
	.ascii	"\012Emitter true coords: \012\000"
.LC15:
	.ascii	"\012Emitter coords absolute error: \012\000"
	.space	2
.LC16:
	.ascii	"\012--------------END--------------\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
