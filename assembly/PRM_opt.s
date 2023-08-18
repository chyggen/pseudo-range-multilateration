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
	.file	"PRM_opt.c"
@ GNU C (Sourcery G++ Lite 2008q3-72) version 4.3.2 (arm-none-linux-gnueabi)
@	compiled by GNU C version 3.4.4, GMP version 4.2.2, MPFR version 2.3.1.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -imultilib armv4t -iprefix
@ /opt/arm/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/ -isysroot
@ /opt/arm/4.3.2/bin/../arm-none-linux-gnueabi/libc PRM_opt.c -march=armv4t
@ -O3 -fverbose-asm
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

	.global	__aeabi_ldivmod
	.text
	.align	2
	.global	calcDiTerm2
	.type	calcDiTerm2, %function
calcDiTerm2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}	@,
	ldr	r6, [r0, #0]	@ <variable>.coord.x, <variable>.coord.x
	ldr	r4, [r0, #4]	@ <variable>.coord.y, <variable>.coord.y
	mov	r7, r6, asr #31	@ D.2426
	mov	r5, r4, asr #31	@ D.2430
	umull	sl, fp, r4, r4	@ tmp145, D.2430, D.2430
	mul	ip, r4, r5	@ tmp143, D.2430, D.2430
	umull	r4, r5, r6, r6	@, D.2426, D.2426
	ldr	r8, [r0, #8]	@ <variable>.coord.z, <variable>.coord.z
	sub	sp, sp, #20	@,,
	mov	r9, r8, asr #31	@ D.2435
	str	r4, [sp, #8]	@,
	str	r5, [sp, #12]	@,
	umull	r4, r5, r8, r8	@, D.2435, D.2435
	mul	r1, r8, r9	@ tmp156, D.2435, D.2435
	mul	lr, r6, r7	@ tmp149, D.2426, D.2426
	stmia	sp, {r4-r5}	@,
	mov	ip, ip, asl #1	@ tmp143, tmp143,
	add	fp, ip, fp	@, tmp143,
	ldr	ip, [sp, #4]	@,
	mov	r1, r1, asl #1	@ tmp156, tmp156,
	add	ip, r1, ip	@, tmp156,
	add	r1, sp, #8
	ldmia	r1, {r1, r5}	@ phole ldm
	mov	r4, r1, lsr #2	@ tmp153,,
	ldr	r1, [sp, #0]	@,
	mov	lr, lr, asl #1	@ tmp149, tmp149,
	str	ip, [sp, #4]	@,
	add	r5, lr, r5	@, tmp149,
	mov	r8, sl, lsr #2	@ tmp147, tmp145,
	mov	r6, r1, lsr #2	@ tmp160,,
	ldr	r1, [r0, #12]	@ <variable>.time, <variable>.time
	ldr	r0, [sp, #4]	@,
	orr	r4, r4, r5, asl #30	@, tmp153, tmp153, tmp12,
	orr	r8, r8, fp, asl #30	@, tmp147, tmp147,,
	adds	r8, r8, r4	@ tmp147, tmp147, tmp153
	str	r5, [sp, #12]	@,
	mov	r9, fp, asr #2	@,,
	mov	r5, r5, asr #2	@, tmp12,
	orr	r6, r6, r0, asl #30	@, tmp160, tmp160,,
	adc	r9, r9, r5	@,,
	mov	r7, r0, asr #2	@, tmp12,
	mov	r4, r1	@ <variable>.time, <variable>.time
	mov	r5, #0	@ <variable>.time
	adds	r0, r8, r6	@,, tmp160
	adc	r1, r9, r7	@, tmp1,
	mov	r7, r2	@ D_sat0_term2, D_sat0_term2
	adds	r2, r4, r4	@, tmp2, <variable>.time
	mov	r8, r3	@ D_sat0_term2, D_sat0_term2
	adc	r3, r5, r5	@, tmp3, <variable>.time
	bl	__aeabi_ldivmod	@
	mov	r5, r7	@ tmp170, D_sat0_term2
	mov	r6, r8	@, D_sat0_term2
	mov	r2, #9856	@ tmp173,
	subs	r5, r5, r0	@ tmp170, tmp170,
	sbc	r6, r6, r1	@ tmp170, tmp170,
	add	r2, r2, #36	@ tmp172, tmp173,
	umull	r3, r4, r2, r5	@ tmp176, tmp172, tmp170
	mla	r4, r2, r6, r4	@, tmp172,,
	mov	r0, r3, lsr #18	@ tmp182, tmp176,
	orr	r0, r0, r4, asl #14	@,, tmp182,,
	mov	r1, r4, asr #18	@,,
	add	sp, sp, #20	@,,
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	calcDiTerm2, .-calcDiTerm2
	.align	2
	.global	putTimestamp
	.type	putTimestamp, %function
putTimestamp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1, #0]	@ tmp136,* timestamp_count
	mov	r3, r3, asl #3	@ tmp135, tmp136,
	stmfd	sp!, {r4, lr}	@,
	mov	r4, r1	@ timestamp_count, timestamp_count
	add	r1, r0, r3	@ tmp137, timestamps, tmp135
	mov	r0, #1	@,
	bl	clock_gettime	@
	ldr	r3, [r4, #0]	@ tmp138,* timestamp_count
	add	r3, r3, #1	@ tmp139, tmp138,
	str	r3, [r4, #0]	@ tmp139,* timestamp_count
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	putTimestamp, .-putTimestamp
	.global	__aeabi_uidiv
	.global	__aeabi_l2d
	.global	__aeabi_ddiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.align	2
	.global	PRM
	.type	PRM, %function
PRM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 304
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}	@,
	sub	sp, sp, #308	@,,
	mov	sl, r1	@ sats, sats
	str	r0, [sp, #168]	@ emitter_coords, emitter_coords
	mov	r1, r2	@, timestamps
	mov	r0, #1	@,
	str	r2, [sp, #164]	@ timestamps, timestamps
	bl	clock_gettime	@
	ldr	r4, [sl, #12]	@ D.2467, <variable>.time
	ldr	r0, [sl, #0]	@, <variable>.coord.x
	mov	r1, r4	@, D.2467
	bl	__aeabi_uidiv	@
	mov	r1, r4	@, D.2467
	mov	r6, r0	@ tmp198,
	ldr	r0, [sl, #4]	@, <variable>.coord.y
	bl	__aeabi_uidiv	@
	mov	r1, r4	@, D.2467
	mov	r8, r0	@ tmp202,
	ldr	r0, [sl, #8]	@, <variable>.coord.z
	bl	__aeabi_uidiv	@
	mov	r9, r0	@ tmp206,
	ldr	r0, [sp, #164]	@, timestamps
	add	fp, sl, #16	@ D.2475, sats,
	add	r1, r0, #8	@,,
	mov	r0, #1	@,
	bl	clock_gettime	@
	ldr	r7, [fp, #12]	@ D.2478, <variable>.time
	ldr	r0, [sl, #16]	@, <variable>.coord.x
	mov	r1, r7	@, D.2478
	bl	__aeabi_uidiv	@
	add	r1, sl, #32	@, sats,
	ldr	r5, [r1, #12]	@ D.2486, <variable>.time
	rsb	r0, r6, r0	@, tmp198,
	str	r1, [sp, #176]	@, D.2483
	str	r0, [sp, #172]	@, D.2482
	mov	r1, r5	@, D.2486
	ldr	r0, [sl, #32]	@, <variable>.coord.x
	bl	__aeabi_uidiv	@
	add	r2, sl, #48	@, sats,
	ldr	r4, [r2, #12]	@ D.2493, <variable>.time
	rsb	r0, r6, r0	@, tmp198,
	str	r0, [sp, #180]	@, D.2489
	mov	r1, r4	@, D.2493
	ldr	r0, [sl, #48]	@, <variable>.coord.x
	str	r2, [sp, #184]	@, D.2490
	bl	__aeabi_uidiv	@
	mov	r1, r7	@, D.2478
	rsb	r6, r6, r0	@, tmp198,
	ldr	r0, [fp, #4]	@, <variable>.coord.y
	str	r6, [sp, #188]	@, D.2496
	bl	__aeabi_uidiv	@
	ldr	r3, [sp, #176]	@, D.2483
	rsb	r0, r8, r0	@, tmp202,
	str	r0, [sp, #192]	@, D.2502
	mov	r1, r5	@, D.2486
	ldr	r0, [r3, #4]	@, <variable>.coord.y
	bl	__aeabi_uidiv	@
	ldr	r6, [sp, #184]	@, D.2490
	rsb	r0, r8, r0	@, tmp202,
	str	r0, [sp, #196]	@, D.2506
	mov	r1, r4	@, D.2493
	ldr	r0, [r6, #4]	@, <variable>.coord.y
	bl	__aeabi_uidiv	@
	mov	r1, r7	@, D.2478
	rsb	r8, r8, r0	@, tmp202,
	ldr	r0, [fp, #8]	@, <variable>.coord.z
	str	r8, [sp, #200]	@, D.2511
	bl	__aeabi_uidiv	@
	ldr	r8, [sp, #176]	@, D.2483
	rsb	r0, r9, r0	@, tmp206,
	mov	r1, r5	@, D.2486
	str	r0, [sp, #204]	@, D.2517
	ldr	r0, [r8, #8]	@, <variable>.coord.z
	bl	__aeabi_uidiv	@
	rsb	r0, r9, r0	@, tmp206,
	mov	r1, r4	@, D.2493
	str	r0, [sp, #208]	@, D.2522
	ldr	r0, [r6, #8]	@, <variable>.coord.z
	bl	__aeabi_uidiv	@
	rsb	r9, r9, r0	@, tmp206,
	str	r9, [sp, #212]	@, D.2527
	ldr	r9, [sp, #164]	@, timestamps
	mov	r0, #1	@,
	add	r1, r9, #16	@,,
	bl	clock_gettime	@
	ldr	ip, [sp, #184]	@, D.2490
	ldr	r8, [sp, #176]	@, D.2483
	ldr	r1, [sl, #12]	@ <variable>.time, <variable>.time
	ldr	r6, [fp, #12]	@ <variable>.time, <variable>.time
	ldr	r4, [ip, #12]	@ <variable>.time, <variable>.time
	ldr	r8, [r8, #12]	@ <variable>.time, <variable>.time
	mov	r3, #11075584	@ tmp260,
	mov	r2, #0	@ D.2530
	mov	r7, #0	@ tmp257
	add	r3, r3, #30208	@ tmp261, tmp260,
	add	r3, r3, #230	@ tmp259, tmp261,
	subs	r6, r6, r1	@ tmp257, tmp257, D.2530
	sbc	r7, r7, r2	@ tmp257, tmp257, D.2530
	mov	r9, #0	@ tmp269
	mov	r5, #0	@ tmp281
	subs	r4, r4, r1	@ tmp281, tmp281, D.2530
	sbc	r5, r5, r2	@ tmp281, tmp281, D.2530
	subs	r8, r8, r1	@ tmp269, tmp269, D.2530
	sbc	r9, r9, r2	@ tmp269, tmp269, D.2530
	umull	r0, r1, r3, r6	@, tmp259, tmp257
	str	r0, [sp, #280]	@, D0_term1
	str	r1, [sp, #284]	@, D0_term1
	umull	r1, r2, r3, r8	@, tmp259, tmp269
	str	r1, [sp, #288]	@, D1_term1
	str	r2, [sp, #292]	@, D1_term1
	umull	r0, r1, r3, r4	@, tmp259, tmp281
	ldr	r2, [sp, #164]	@, timestamps
	str	r0, [sp, #296]	@, D2_term1
	str	r1, [sp, #300]	@, D2_term1
	ldr	ip, [sp, #300]	@, D2_term1
	ldr	lr, [sp, #284]	@, D0_term1
	add	r1, r2, #24	@,,
	ldr	r2, [sp, #292]	@, D1_term1
	mla	ip, r3, r5, ip	@, tmp259,,
	mla	lr, r3, r7, lr	@, tmp259,,
	mla	r2, r3, r9, r2	@, tmp259,,
	mov	r0, #1	@,
	str	ip, [sp, #300]	@, D2_term1
	str	lr, [sp, #284]	@, D0_term1
	str	r2, [sp, #292]	@, D1_term1
	bl	clock_gettime	@
	ldmia	sl, {r1, r3}	@ phole ldm
	mov	r2, r1, asr #31	@ D.2536
	mov	r4, r3, asr #31	@ D.2539
	umull	r8, r9, r3, r3	@, D.2539, D.2539
	mul	ip, r3, r4	@ tmp295, D.2539, D.2539
	umull	r3, r4, r1, r1	@, D.2536, D.2536
	mul	r7, r1, r2	@ tmp301, D.2536, D.2536
	ldr	r5, [sl, #8]	@ <variable>.coord.z, <variable>.coord.z
	mov	r6, r5, asr #31	@ D.2543
	str	r3, [sp, #144]	@,
	str	r4, [sp, #148]	@,
	mul	r3, r5, r6	@ tmp308, D.2543, D.2543
	umull	r0, r1, r5, r5	@ tmp310, D.2543, D.2543
	mov	r7, r7, asl #1	@ tmp301, tmp301,
	str	r8, [sp, #152]	@,
	str	r9, [sp, #156]	@,
	add	r4, r7, r4	@, tmp301,
	str	r4, [sp, #148]	@,
	ldr	r6, [sp, #144]	@,
	ldr	r4, [sp, #152]	@,
	ldr	lr, [sp, #148]	@,
	mov	ip, ip, asl #1	@ tmp295, tmp295,
	add	r9, ip, r9	@, tmp295,
	mov	r3, r3, asl #1	@ tmp308, tmp308,
	mov	r8, r4, lsr #2	@ tmp299,,
	mov	r4, r6, lsr #2	@ tmp305,,
	add	r1, r3, r1	@, tmp308,
	orr	r4, r4, lr, asl #30	@, tmp305, tmp305,,
	ldr	r2, [sl, #12]	@ <variable>.time, <variable>.time
	orr	r8, r8, r9, asl #30	@, tmp299, tmp299, tmp12,
	mov	r6, r0, lsr #2	@ tmp312, tmp310,
	mov	r5, lr, asr #2	@, tmp3,
	adds	r8, r8, r4	@ tmp299, tmp299, tmp305
	str	r9, [sp, #156]	@,
	orr	r6, r6, r1, asl #30	@, tmp312, tmp312,,
	mov	r9, r9, asr #2	@, tmp2,
	adc	r9, r9, r5	@,,
	mov	r7, r1, asr #2	@,,
	adds	r0, r8, r6	@,, tmp312
	mov	r3, #0	@ <variable>.time
	adc	r1, r9, r7	@, tmp1,
	adds	r2, r2, r2	@, <variable>.time, <variable>.time
	adc	r3, r3, r3	@, <variable>.time, <variable>.time
	bl	__aeabi_ldivmod	@
	ldr	r3, [fp, #4]	@ <variable>.coord.y, <variable>.coord.y
	str	r0, [sp, #136]	@,
	str	r1, [sp, #140]	@,
	ldr	r1, [sl, #16]	@ <variable>.coord.x, <variable>.coord.x
	mov	r4, r3, asr #31	@ D.2776
	mov	r2, r1, asr #31	@ D.2772
	umull	r8, r9, r3, r3	@, D.2776, D.2776
	mul	ip, r3, r4	@ tmp324, D.2776, D.2776
	umull	r3, r4, r1, r1	@, D.2772, D.2772
	mul	r7, r1, r2	@ tmp330, D.2772, D.2772
	ldr	r5, [fp, #8]	@ <variable>.coord.z, <variable>.coord.z
	mov	r6, r5, asr #31	@ D.2781
	str	r3, [sp, #120]	@,
	str	r4, [sp, #124]	@,
	mul	r3, r5, r6	@ tmp337, D.2781, D.2781
	umull	r0, r1, r5, r5	@ tmp339, D.2781, D.2781
	mov	r7, r7, asl #1	@ tmp330, tmp330,
	str	r8, [sp, #128]	@,
	str	r9, [sp, #132]	@,
	add	r4, r7, r4	@, tmp330,
	str	r4, [sp, #124]	@,
	ldr	r6, [sp, #120]	@,
	ldr	r4, [sp, #128]	@,
	ldr	lr, [sp, #124]	@,
	mov	ip, ip, asl #1	@ tmp324, tmp324,
	add	r9, ip, r9	@, tmp324,
	mov	r3, r3, asl #1	@ tmp337, tmp337,
	mov	r8, r4, lsr #2	@ tmp328,,
	mov	r4, r6, lsr #2	@ tmp334,,
	add	r1, r3, r1	@, tmp337,
	orr	r4, r4, lr, asl #30	@, tmp334, tmp334,,
	ldr	r2, [fp, #12]	@ <variable>.time, <variable>.time
	orr	r8, r8, r9, asl #30	@, tmp328, tmp328, tmp12,
	mov	r6, r0, lsr #2	@ tmp341, tmp339,
	mov	r5, lr, asr #2	@, tmp3,
	adds	r8, r8, r4	@ tmp328, tmp328, tmp334
	str	r9, [sp, #132]	@,
	orr	r6, r6, r1, asl #30	@, tmp341, tmp341,,
	mov	r9, r9, asr #2	@, tmp2,
	adc	r9, r9, r5	@,,
	mov	r7, r1, asr #2	@,,
	adds	r0, r8, r6	@,, tmp341
	mov	r3, #0	@ <variable>.time
	adc	r1, r9, r7	@, tmp1,
	adds	r2, r2, r2	@, <variable>.time, <variable>.time
	adc	r3, r3, r3	@, <variable>.time, <variable>.time
	bl	__aeabi_ldivmod	@
	add	r5, sp, #136	@,,
	ldmia	r5, {r4-r5}	@,
	subs	r4, r4, r0	@,,
	sbc	r5, r5, r1	@,,
	str	r4, [sp, #16]	@,
	str	r5, [sp, #20]	@,
	ldr	fp, [sp, #176]	@, D.2483
	ldr	r9, [sp, #16]	@,
	mov	r8, #9856	@,
	add	r8, r8, #36	@,,
	umull	r5, r6, r8, r9	@,,
	ldr	r1, [sl, #32]	@ <variable>.coord.x, <variable>.coord.x
	ldr	r3, [fp, #4]	@ <variable>.coord.y, <variable>.coord.y
	mov	r2, r1, asr #31	@ D.2796
	mov	r4, r3, asr #31	@ D.2800
	umull	r8, r9, r3, r3	@, D.2800, D.2800
	mul	ip, r3, r4	@ tmp364, D.2800, D.2800
	umull	r3, r4, r1, r1	@, D.2796, D.2796
	str	r5, [sp, #112]	@,
	str	r6, [sp, #116]	@,
	ldr	r5, [fp, #8]	@ <variable>.coord.z, <variable>.coord.z
	mul	r7, r1, r2	@ tmp370, D.2796, D.2796
	mov	r6, r5, asr #31	@ D.2805
	str	r3, [sp, #96]	@,
	str	r4, [sp, #100]	@,
	umull	r0, r1, r5, r5	@ tmp379, D.2805, D.2805
	mul	r3, r5, r6	@ tmp377, D.2805, D.2805
	ldr	r4, [sp, #20]	@,
	ldr	r6, [sp, #116]	@,
	mov	r5, #9856	@,
	add	r5, r5, #36	@,,
	mla	r4, r5, r4, r6	@,,,
	str	r8, [sp, #104]	@,
	str	r9, [sp, #108]	@,
	ldr	r8, [sp, #100]	@,
	mov	ip, ip, asl #1	@ tmp364, tmp364,
	mov	r7, r7, asl #1	@ tmp370, tmp370,
	add	r9, ip, r9	@, tmp364,
	add	r8, r7, r8	@, tmp370,
	ldr	ip, [sp, #96]	@,
	str	r8, [sp, #100]	@,
	add	r2, sp, #100
	ldmia	r2, {r2, fp}	@ phole ldm
	str	r4, [sp, #116]	@,
	mov	r4, ip, lsr #2	@ tmp374,,
	ldr	ip, [sp, #176]	@, D.2483
	ldr	lr, [sp, #112]	@,
	mov	r3, r3, asl #1	@ tmp377, tmp377,
	mov	r8, fp, lsr #2	@ tmp368,,
	add	r1, r3, r1	@, tmp377,
	orr	r4, r4, r2, asl #30	@, tmp374, tmp374,,
	ldr	r3, [sp, #116]	@,
	mov	r5, r2, asr #2	@, tmp11,
	orr	r8, r8, r9, asl #30	@, tmp368, tmp368, tmp14,
	ldr	r2, [ip, #12]	@ <variable>.time, <variable>.time
	mov	r6, r0, lsr #2	@ tmp381, tmp379,
	adds	r8, r8, r4	@ tmp368, tmp368, tmp374
	str	r9, [sp, #108]	@,
	mov	ip, lr, lsr #18	@ D0_term2,,
	orr	r6, r6, r1, asl #30	@, tmp381, tmp381,,
	mov	r9, r9, asr #2	@, tmp3,
	adc	r9, r9, r5	@,,
	orr	ip, ip, r3, asl #14	@, D0_term2, D0_term2,,
	adds	r0, r8, r6	@,, tmp381
	mov	r4, r3, asr #18	@ D0_term2, tmp5,
	mov	r7, r1, asr #2	@,,
	mov	r3, #0	@ <variable>.time
	adc	r1, r9, r7	@, tmp1,
	adds	r2, r2, r2	@, <variable>.time, <variable>.time
	adc	r3, r3, r3	@, <variable>.time, <variable>.time
	mov	fp, ip	@ D.2551, D0_term2
	mov	ip, r4	@ D.2551, D0_term2
	str	fp, [sp, #216]	@ D.2551, D.2551
	str	ip, [sp, #220]	@, D.2551
	bl	__aeabi_ldivmod	@
	add	r9, sp, #136	@,,
	ldmia	r9, {r8-r9}	@, tmp391
	mov	lr, #9856	@,
	add	lr, lr, #36	@,,
	subs	r8, r8, r0	@ tmp391, tmp391,
	sbc	r9, r9, r1	@ tmp391, tmp391,
	umull	fp, ip, lr, r8	@,, tmp391
	ldr	r0, [sp, #184]	@, D.2490
	ldr	r1, [sl, #48]	@ <variable>.coord.x, <variable>.coord.x
	ldr	r3, [r0, #4]	@ <variable>.coord.y, <variable>.coord.y
	mov	r2, r1, asr #31	@ D.2820
	mov	r4, r3, asr #31	@ D.2824
	str	fp, [sp, #88]	@,
	str	ip, [sp, #92]	@,
	umull	sl, fp, r3, r3	@ tmp406, D.2824, D.2824
	mul	ip, r3, r4	@ tmp404, D.2824, D.2824
	umull	r3, r4, r1, r1	@, D.2820, D.2820
	ldr	r5, [r0, #8]	@ <variable>.coord.z, <variable>.coord.z
	mov	r6, r5, asr #31	@ D.2829
	str	r3, [sp, #80]	@,
	str	r4, [sp, #84]	@,
	ldr	r4, [sp, #92]	@,
	mul	r3, r5, r6	@ tmp417, D.2829, D.2829
	mul	r7, r1, r2	@ tmp410, D.2820, D.2820
	umull	r0, r1, r5, r5	@ tmp419, D.2829, D.2829
	mla	r4, lr, r9, r4	@,,,
	ldr	r5, [sp, #84]	@,
	ldr	r6, [sp, #80]	@,
	mov	r3, r3, asl #1	@ tmp417, tmp417,
	add	r1, r3, r1	@, tmp417,
	mov	ip, ip, asl #1	@ tmp404, tmp404,
	ldr	r3, [sp, #184]	@, D.2490
	mov	r7, r7, asl #1	@ tmp410, tmp410,
	str	r4, [sp, #92]	@,
	add	fp, ip, fp	@, tmp404,
	add	r5, r7, r5	@, tmp410,
	mov	r8, sl, lsr #2	@ tmp408, tmp406,
	mov	r4, r6, lsr #2	@ tmp414,,
	ldr	sl, [sp, #88]	@,
	orr	r4, r4, r5, asl #30	@, tmp414, tmp414, tmp12,
	orr	r8, r8, fp, asl #30	@, tmp408, tmp408,,
	mov	r6, r0, lsr #2	@ tmp421, tmp419,
	ldr	r2, [r3, #12]	@ <variable>.time, <variable>.time
	adds	r8, r8, r4	@ tmp408, tmp408, tmp414
	str	r5, [sp, #84]	@,
	orr	r6, r6, r1, asl #30	@, tmp421, tmp421,,
	mov	r9, fp, asr #2	@,,
	mov	r5, r5, asr #2	@, tmp14,
	ldr	fp, [sp, #92]	@,
	adc	r9, r9, r5	@,,
	mov	ip, sl, lsr #18	@ D1_term2,,
	adds	r0, r8, r6	@,, tmp421
	mov	r7, r1, asr #2	@,,
	mov	r3, #0	@ <variable>.time
	orr	ip, ip, fp, asl #14	@, D1_term2, D1_term2,,
	adc	r1, r9, r7	@, tmp1,
	mov	sl, fp, asr #18	@ D1_term2, tmp14,
	adds	r2, r2, r2	@, <variable>.time, <variable>.time
	mov	r4, ip	@ D.2586, D1_term2
	adc	r3, r3, r3	@, <variable>.time, <variable>.time
	mov	r5, sl	@ D.2586, D1_term2
	str	r4, [sp, #232]	@ D.2586, D.2586
	str	r5, [sp, #236]	@, D.2586
	bl	__aeabi_ldivmod	@
	add	r6, sp, #136	@,,
	ldmia	r6, {r5-r6}	@, tmp431
	subs	r5, r5, r0	@ tmp431, tmp431,
	sbc	r6, r6, r1	@ tmp431, tmp431,
	mov	r0, #9856	@,
	add	r0, r0, #36	@,,
	umull	r3, r4, r0, r5	@ tmp437,, tmp431
	mla	r4, r0, r6, r4	@,,,
	mov	r2, r3, lsr #18	@ D2_term2, tmp437,
	orr	r2, r2, r4, asl #14	@, D2_term2, D2_term2,,
	mov	r1, r4, asr #18	@ D2_term2,,
	ldr	r4, [sp, #164]	@, timestamps
	mov	r3, r1	@ D.2617, D2_term2
	mov	r0, #1	@,
	add	r1, r4, #32	@,,
	str	r2, [sp, #240]	@ D.2617, D.2617
	str	r3, [sp, #244]	@, D.2617
	bl	clock_gettime	@
	add	r1, r4, #40	@,,
	mov	r0, #1	@,
	bl	clock_gettime	@
	add	r1, r4, #48	@,,
	mov	r0, #1	@,
	bl	clock_gettime	@
	ldr	r5, [sp, #180]	@, D.2489
	ldr	r9, [sp, #172]	@, D.2482
	mov	r3, r5	@ D.2489,
	mov	r4, r3, asr #31	@ D.2489
	mov	r8, r9	@,
	mov	r9, r8, asr #31	@
	mov	r1, r4, asl #16	@ tmp645, D.2489,
	mov	r2, r8	@,
	orr	r1, r1, r3, lsr #16	@, tmp645, tmp645, D.2489,
	mov	r0, r3, asl #16	@ tmp644, D.2489,
	mov	r3, r9	@,
	str	r8, [sp, #256]	@, D.2627
	str	r9, [sp, #260]	@, D.2627
	bl	__aeabi_ldivmod	@
	add	fp, sp, #216	@,,
	ldmia	fp, {sl-fp}	@,
	mov	r6, r0	@ tmp450,
	mov	r7, r1	@,
	add	r1, sp, #280	@,,
	ldmia	r1, {r0-r1}	@,
	mov	r3, r7	@ tmp453,
	adds	sl, sl, r0	@,,
	mul	r3, sl, r3	@ tmp453,, tmp453
	adc	fp, fp, r1	@,,
	str	sl, [sp, #216]	@, D.2551
	str	fp, [sp, #220]	@, D.2551
	add	r1, sp, #216
	ldmia	r1, {r1, r2}	@ phole ldm
	umull	r4, r5, r1, r6	@ tmp454,, ratio
	mla	r2, r6, r2, r3	@ tmp452, ratio, tmp452, tmp453
	ldr	r3, [sp, #188]	@, D.2496
	mov	r8, r3	@ D.2496,
	mov	r9, r8, asr #31	@ D.2496
	ldr	ip, [sp, #192]	@, D.2502
	mov	r1, r9, asl #16	@ tmp647, D.2496,
	add	r5, r2, r5	@, tmp452,
	orr	r1, r1, r8, lsr #16	@, tmp647, tmp647, D.2496,
	add	r3, sp, #256	@,,
	ldmia	r3, {r2-r3}	@,
	mov	r0, r8, asl #16	@ tmp646, D.2496,
	mov	sl, ip	@ D.2600,
	mov	fp, sl, asr #31	@ D.2600
	str	r7, [sp, #24]	@,
	bl	__aeabi_ldivmod	@
	mul	r2, r6, fp	@ tmp466, ratio, D.2600
	str	r0, [sp, #72]	@,
	str	r1, [sp, #76]	@,
	ldr	r1, [sp, #24]	@ tmp465,
	mov	r8, r4, lsr #16	@ tmp456, tmp454,
	mla	r1, sl, r1, r2	@ tmp465, D.2600, tmp465, tmp466
	umull	r3, r4, r6, sl	@ tmp467, ratio, D.2600
	ldr	lr, [sp, #196]	@, D.2506
	add	r4, r1, r4	@, tmp465,
	mov	r2, r3, lsr #16	@ tmp618, tmp467,
	orr	r2, r2, r4, asl #16	@, tmp618, tmp618,,
	rsb	r0, r2, lr	@ tmp471, tmp618,
	mov	r2, r0	@, tmp471
	mov	r3, r2, asr #31	@
	str	r2, [sp, #264]	@, D.2631
	str	r3, [sp, #268]	@, D.2631
	ldr	r3, [sp, #72]	@,
	mov	r1, fp, asl #16	@ tmp649, D.2600,
	str	r3, [sp, #28]	@,
	orr	r1, r1, sl, lsr #16	@, tmp649, tmp649, D.2600,
	add	r3, sp, #264	@,,
	ldmia	r3, {r2-r3}	@,
	mov	r0, sl, asl #16	@ tmp648, D.2600,
	bl	__aeabi_ldivmod	@
	orr	r8, r8, r5, asl #16	@, tmp456, tmp456,,
	mov	r9, r5, asr #16	@,,
	ldr	r2, [sp, #28]	@ tmp486,
	ldr	r5, [sp, #204]	@, D.2517
	mul	r2, fp, r2	@ tmp486, D.2600, tmp486
	mov	r4, r5	@,
	mov	r5, r4, asr #31	@
	str	r4, [sp, #224]	@, D.2576
	str	r5, [sp, #228]	@, D.2576
	ldr	ip, [sp, #228]	@ tmp479, D.2576
	mul	ip, r6, ip	@ tmp479, ratio, tmp479
	ldr	r7, [sp, #76]	@ ratio.106,
	ldr	lr, [sp, #28]	@,
	mla	r5, r7, sl, r2	@ tmp485, ratio.106, D.2600, tmp486
	umull	r3, r4, lr, sl	@ tmp487,, D.2600
	str	r0, [sp, #64]	@,
	str	r1, [sp, #68]	@,
	ldr	r2, [sp, #224]	@, D.2576
	ldr	r0, [sp, #24]	@,
	ldr	sl, [sp, #224]	@ tmp478, D.2576
	mla	sl, r0, sl, ip	@ tmp478,, tmp478, tmp479
	umull	r0, r1, r6, r2	@ tmp480, ratio,
	add	r4, r5, r4	@, tmp485,
	mov	r2, r3, lsr #16	@ tmp622, tmp487,
	orr	r2, r2, r4, asl #16	@, tmp622, tmp622,,
	ldr	r4, [sp, #200]	@, D.2511
	rsb	r3, r2, r4	@ tmp491, tmp622,
	mov	r4, r3	@ tmp492, tmp491
	mov	r5, r4, asr #31	@ tmp492
	ldr	r6, [sp, #208]	@, D.2522
	add	r1, sl, r1	@, tmp478,
	mov	r3, r0, lsr #16	@ tmp620, tmp480,
	orr	r3, r3, r1, asl #16	@, tmp620, tmp620,,
	ldr	ip, [sp, #68]	@,
	rsb	r3, r3, r6	@ tmp484, tmp620,
	mov	r1, r5, asl #16	@ D.2614,,
	mov	sl, r3	@, tmp484
	mov	fp, sl, asr #31	@
	orr	r1, r1, r4, lsr #16	@, D.2614, D.2614, tmp492,
	add	r3, sp, #264	@,,
	ldmia	r3, {r2-r3}	@,
	mov	r0, r4, asl #16	@ D.2614, tmp492,
	str	sl, [sp, #248]	@, D.2624
	str	fp, [sp, #252]	@, D.2624
	str	ip, [sp, #32]	@,
	ldr	fp, [sp, #64]	@ ratio.115,
	bl	__aeabi_ldivmod	@
	ldr	r2, [sp, #252]	@ tmp512, D.2624
	mul	r2, fp, r2	@ tmp512, ratio.115, tmp512
	add	r6, sp, #288	@,,
	ldmia	r6, {r5-r6}	@,
	add	r4, sp, #232	@,,
	ldmia	r4, {r3-r4}	@,
	adds	r3, r3, r5	@,,
	adc	r4, r4, r6	@,,
	str	r3, [sp, #232]	@, D.2586
	str	r4, [sp, #236]	@, D.2586
	add	r5, sp, #232	@,,
	ldmia	r5, {r4-r5}	@,
	ldr	r6, [sp, #28]	@,
	ldr	r3, [sp, #228]	@ tmp521, D.2576
	subs	r4, r4, r8	@,, tmp456
	sbc	r5, r5, r9	@,, tmp456
	str	r4, [sp, #232]	@, D.2586
	str	r5, [sp, #236]	@, D.2586
	mul	r3, r6, r3	@ tmp521,, tmp521
	ldr	r5, [sp, #248]	@, D.2624
	ldr	r6, [sp, #32]	@,
	mla	r5, r6, r5, r2	@,,, tmp512
	ldr	r6, [sp, #248]	@, D.2624
	str	r5, [sp, #36]	@,
	ldr	sl, [sp, #252]	@ tmp528, D.2624
	umull	r4, r5, fp, r6	@, ratio.115,
	mul	sl, r0, sl	@ tmp528, ratio.116, tmp528
	str	r4, [sp, #8]	@,
	str	r5, [sp, #12]	@,
	ldr	r4, [sp, #248]	@, D.2624
	ldr	r9, [sp, #236]	@ tmp506, D.2586
	mla	r4, r1, r4, sl	@, ratio.116,, tmp528
	mul	r9, r0, r9	@ tmp506, ratio.116, tmp506
	ldr	lr, [sp, #224]	@ tmp520, D.2576
	ldr	r8, [sp, #216]	@ tmp499, D.2551
	mla	lr, r7, lr, r3	@ tmp520, ratio.106, tmp520, tmp521
	ldr	r2, [sp, #28]	@,
	ldr	r3, [sp, #224]	@, D.2576
	str	r4, [sp, #4]	@,
	mul	r8, r7, r8	@ tmp499, ratio.106, tmp499
	ldr	r4, [sp, #232]	@, D.2586
	umull	r6, r7, r2, r3	@ tmp522,,
	mov	r3, r1	@ ratio.116,
	mla	r4, r3, r4, r9	@, ratio.116,, tmp506
	ldr	r5, [sp, #248]	@, D.2624
	mov	ip, r0	@ ratio.116, tmp496
	umull	r1, r2, ip, r5	@ tmp529, ratio.116,
	ldr	r0, [sp, #28]	@,
	add	r5, sp, #216
	ldmia	r5, {r5, sl}	@ phole ldm
	mla	sl, r0, sl, r8	@ tmp498,, tmp498, tmp499
	umull	r8, r9, r5, r0	@ tmp500,,
	ldr	r5, [sp, #232]	@, D.2586
	str	r4, [sp, #60]	@,
	umull	r3, r4, ip, r5	@, ratio.116,
	ldr	r0, [sp, #12]	@,
	str	r3, [sp, #48]	@,
	str	r4, [sp, #52]	@,
	ldr	ip, [sp, #36]	@,
	ldr	r4, [sp, #8]	@,
	add	r0, ip, r0	@,,
	add	r7, lr, r7	@, tmp520,
	ldr	ip, [sp, #4]	@,
	ldr	lr, [sp, #204]	@, D.2517
	mov	r3, r4, lsr #16	@ tmp624,,
	orr	r3, r3, r0, asl #16	@, tmp624, tmp624, tmp5,
	add	r2, ip, r2	@,,
	ldr	r4, [sp, #52]	@,
	rsb	ip, r3, lr	@ tmp517, tmp624,
	ldr	r3, [sp, #60]	@,
	add	r4, r3, r4	@,,
	str	r0, [sp, #12]	@,
	str	r4, [sp, #52]	@,
	mov	r0, r6, lsr #16	@ tmp626, tmp522,
	ldr	r5, [sp, #212]	@, D.2527
	orr	r0, r0, r7, asl #16	@, tmp626, tmp626,,
	mov	r3, r1, lsr #16	@ tmp628, tmp529,
	rsb	r0, r0, r5	@ tmp526, tmp626,
	orr	r3, r3, r2, asl #16	@, tmp628, tmp628,,
	ldr	r2, [sp, #164]	@, timestamps
	mov	r6, ip	@ tmp518, tmp517
	mov	r7, r6, asr #31	@ tmp518
	rsb	ip, r3, r0	@ tmp533, tmp628, tmp526
	add	r9, sl, r9	@, tmp498,
	add	r1, r2, #56	@,,
	ldr	sl, [sp, #48]	@,
	mov	r2, ip	@, tmp533
	mov	r3, r2, asr #31	@
	ldr	r0, [sp, #52]	@,
	str	r2, [sp, #272]	@, D.2635
	str	r3, [sp, #276]	@, D.2635
	ldr	r3, [sp, #52]	@,
	mov	sl, sl, lsr #16	@,,
	orr	lr, sl, r0, asl #16	@,, tmp14,,
	mov	r3, r3, asr #16	@,,
	mov	r0, #1	@,
	str	sl, [sp, #40]	@,
	str	r3, [sp, #44]	@,
	str	lr, [sp, #40]	@,
	bl	clock_gettime	@
	ldr	r3, [sp, #236]	@ tmp536, D.2586
	mul	r3, fp, r3	@ tmp536, ratio.115, tmp536
	mov	sl, r7, asl #16	@ D.2619,,
	ldr	ip, [sp, #232]	@, D.2586
	orr	sl, sl, r6, lsr #16	@, D.2619, D.2619, tmp518,
	mov	r7, r6, asl #16	@ D.2619, tmp518,
	ldr	r2, [sp, #232]	@ tmp535, D.2586
	ldr	r6, [sp, #32]	@,
	mov	r4, r8, lsr #16	@ tmp502, tmp500,
	orr	r4, r4, r9, asl #16	@, tmp502, tmp502,,
	mov	r5, r9, asr #16	@,,
	mla	r2, r6, r2, r3	@ tmp535,, tmp535, tmp536
	umull	r8, r9, fp, ip	@ tmp537, ratio.115,
	add	r1, sp, #240	@,,
	ldmia	r1, {r0-r1}	@,
	add	r9, r2, r9	@, tmp535,
	add	r3, sp, #296	@,,
	ldmia	r3, {r2-r3}	@,
	adds	r0, r0, r2	@,,
	adc	r1, r1, r3	@,,
	subs	r0, r0, r4	@,, tmp502
	sbc	r1, r1, r5	@,, tmp502
	str	r0, [sp, #240]	@, D.2617
	str	r1, [sp, #244]	@, D.2617
	add	r5, sp, #240	@,,
	ldmia	r5, {r4-r5}	@,
	mov	r1, sl	@, D.2619
	add	fp, sp, #40	@,,
	ldmia	fp, {sl-fp}	@,
	add	r3, sp, #272	@,,
	ldmia	r3, {r2-r3}	@,
	subs	r4, r4, sl	@,,
	sbc	r5, r5, fp	@,,
	mov	r0, r7	@, D.2619
	str	r4, [sp, #240]	@, D.2617
	str	r5, [sp, #244]	@, D.2617
	bl	__aeabi_ldivmod	@
	ldr	r4, [sp, #244]	@ tmp547, D.2617
	mul	r4, r0, r4	@ tmp547, tmp545, tmp547
	ldr	fp, [sp, #240]	@, D.2617
	mov	ip, fp	@ tmp546,
	mla	ip, r1, ip, r4	@ tmp546,, tmp546, tmp547
	umull	r2, r3, r0, fp	@ tmp548, tmp545,
	mov	r6, r8, lsr #16	@ tmp539, tmp537,
	add	r1, sp, #216	@,,
	ldmia	r1, {r0-r1}	@,
	add	r3, ip, r3	@, tmp546,
	orr	r6, r6, r9, asl #16	@, tmp539, tmp539,,
	mov	r7, r9, asr #16	@,,
	mov	r4, r2, lsr #16	@ tmp550, tmp548,
	subs	r0, r0, r6	@,, tmp539
	sbc	r1, r1, r7	@,, tmp539
	orr	r4, r4, r3, asl #16	@, tmp550, tmp550,,
	mov	r5, r3, asr #16	@,,
	str	r0, [sp, #216]	@, D.2551
	str	r1, [sp, #220]	@, D.2551
	add	r3, sp, #256	@,,
	ldmia	r3, {r2-r3}	@,
	subs	r0, r0, r4	@,, tmp550
	sbc	r1, r1, r5	@,, tmp550
	bl	__aeabi_ldivmod	@
	ldr	r2, [sp, #252]	@, D.2624
	ldr	r3, [sp, #248]	@, D.2624
	ldr	r5, [sp, #168]	@, emitter_coords
	mov	r1, r2, asl #16	@ tmp651,,
	rsb	r0, r0, #0	@ tmp557,
	orr	r1, r1, r3, lsr #16	@, tmp651, tmp651,,
	mov	r3, r3, asl #16	@ tmp650, tmp4,
	str	r0, [r5, #0]	@ tmp557, <variable>.x
	mov	r0, r3	@, tmp650
	add	r3, sp, #272	@,,
	ldmia	r3, {r2-r3}	@,
	bl	__aeabi_ldivmod	@
	ldr	r4, [sp, #244]	@ tmp566, D.2617
	mul	r4, r0, r4	@ tmp566, tmp564, tmp566
	ldr	r6, [sp, #240]	@, D.2617
	mov	ip, r6	@ tmp565,
	mla	ip, r1, ip, r4	@ tmp565,, tmp565, tmp566
	umull	r2, r3, r0, r6	@ tmp567, tmp564,
	add	r1, sp, #232	@,,
	ldmia	r1, {r0-r1}	@,
	add	r3, ip, r3	@, tmp565,
	mov	r4, r2, lsr #16	@ tmp569, tmp567,
	orr	r4, r4, r3, asl #16	@, tmp569, tmp569,,
	mov	r5, r3, asr #16	@,,
	subs	r0, r0, r4	@,, tmp569
	sbc	r1, r1, r5	@,, tmp569
	add	r3, sp, #264	@,,
	ldmia	r3, {r2-r3}	@,
	bl	__aeabi_ldivmod	@
	ldr	r8, [sp, #168]	@, emitter_coords
	rsb	r0, r0, #0	@ tmp576,
	add	r3, sp, #272	@,,
	ldmia	r3, {r2-r3}	@,
	str	r0, [r8, #4]	@ tmp576, <variable>.y
	add	r1, sp, #240	@,,
	ldmia	r1, {r0-r1}	@,
	bl	__aeabi_ldivmod	@
	ldr	r9, [sp, #164]	@, timestamps
	rsb	r0, r0, #0	@ tmp581,
	str	r0, [r8, #8]	@ tmp581, <variable>.z
	add	r1, r9, #64	@,,
	mov	r0, #1	@,
	bl	clock_gettime	@
	ldmia	r8, {r1, r3, r5}	@ phole ldm
	mov	r2, r1, asr #31	@ D.2640
	mov	r4, r3, asr #31	@ D.2643
	mov	r6, r5, asr #31	@ D.2647
	mul	ip, r1, r2	@ tmp589, D.2640, D.2640
	mul	r0, r3, r4	@ tmp586, D.2643, D.2643
	umull	r9, sl, r1, r1	@ tmp591, D.2640, D.2640
	umull	r7, r8, r3, r3	@ tmp588, D.2643, D.2643
	mul	r2, r5, r6	@ tmp593, D.2647, D.2647
	umull	r3, r4, r5, r5	@ tmp595, D.2647, D.2647
	mov	ip, ip, asl #1	@ tmp589, tmp589,
	mov	r0, r0, asl #1	@ tmp586, tmp586,
	add	sl, ip, sl	@, tmp589,
	mov	r2, r2, asl #1	@ tmp593, tmp593,
	adds	r7, r7, r9	@ tmp588, tmp588, tmp591
	add	r8, r0, r8	@, tmp586,
	add	r4, r2, r4	@, tmp593,
	adc	r8, r8, sl	@,,
	adds	r0, r7, r3	@,, tmp595
	adc	r1, r8, r4	@, tmp1,
	bl	__aeabi_l2d	@
	bl	sqrt	@
	mov	r2, r0	@ D.2651,
	mov	r3, r1	@ D.2651,
	mov	r0, #402653184	@,
	ldr	r1, .L7	@,
	bl	__aeabi_ddiv	@
	ldr	sl, [sp, #168]	@, emitter_coords
	mov	r4, r0	@ tmp599,
	mov	r5, r1	@,
	ldr	r0, [sl, #0]	@, <variable>.x
	bl	__aeabi_i2d	@
	mov	r2, r4	@, tmp599
	mov	r3, r5	@,
	bl	__aeabi_dmul	@
	bl	__aeabi_d2iz	@
	str	r0, [sl, #0]	@, <variable>.x
	ldr	r0, [sl, #4]	@, <variable>.y
	bl	__aeabi_i2d	@
	mov	r2, r4	@, tmp599
	mov	r3, r5	@,
	bl	__aeabi_dmul	@
	bl	__aeabi_d2iz	@
	str	r0, [sl, #4]	@, <variable>.y
	ldr	r0, [sl, #8]	@, <variable>.z
	bl	__aeabi_i2d	@
	mov	r2, r4	@, tmp599
	mov	r3, r5	@,
	bl	__aeabi_dmul	@
	bl	__aeabi_d2iz	@
	ldr	fp, [sp, #164]	@, timestamps
	str	r0, [sl, #8]	@, <variable>.z
	add	r1, fp, #72	@,,
	mov	r0, #1	@,
	bl	clock_gettime	@
	add	sp, sp, #308	@,,
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	1103372372
	.size	PRM, .-PRM
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
