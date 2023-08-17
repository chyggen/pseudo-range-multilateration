	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"PRM_opt.c"
	.text
	.align	2
	.global	putTimestamp
	.type	putTimestamp, %function
putTimestamp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	mov	r0, #1
	mov	r1, r3
	bl	clock_gettime
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-12]
	str	r2, [r3, #0]
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	putTimestamp, .-putTimestamp
	.global	__aeabi_ldivmod
	.align	2
	.global	calcDiTerm2
	.type	calcDiTerm2, %function
calcDiTerm2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #28
	str	r0, [fp, #-40]
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, r0, asr #31
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	mov	r4, r3, asr #31
	mul	r2, r3, r1
	mul	ip, r0, r4
	add	r2, r2, ip
	umull	r5, r6, r0, r3
	mov	r3, r5
	mov	r4, r6
	add	r2, r2, r4
	mov	r4, r2
	mov	r2, r4, asl #30
	mov	r5, r3, lsr #2
	orr	r5, r2, r5
	mov	r6, r4, asr #2
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	mov	r4, r3, asr #31
	mul	r0, r3, r2
	mul	ip, r1, r4
	add	r0, r0, ip
	umull	r7, r8, r1, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #30
	mov	r3, r1, lsr #2
	orr	r3, r0, r3
	mov	r4, r2, asr #2
	adds	r5, r5, r3
	adc	r6, r6, r4
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	mov	r4, r3, asr #31
	mul	r0, r3, r2
	mul	ip, r1, r4
	add	r0, r0, ip
	umull	r7, r8, r1, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #30
	mov	r3, r1, lsr #2
	orr	r3, r0, r3
	mov	r4, r2, asr #2
	mov	r1, r5
	mov	r2, r6
	adds	r1, r1, r3
	adc	r2, r2, r4
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #12]
	mov	r4, #0
	adds	r3, r3, r3
	adc	r4, r4, r4
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	mov	r1, r3
	mov	r2, r4
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	subs	r3, r3, r1
	sbc	r4, r4, r2
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	ldr	r2, [fp, #-32]
	mov	r3, #9856
	add	r3, r3, #36
	mul	r0, r3, r2
	ldr	r2, [fp, #-36]
	mov	r3, #0
	mul	r3, r2, r3
	add	r0, r0, r3
	ldr	r2, [fp, #-36]
	mov	r3, #9856
	add	r3, r3, #36
	umull	r4, r5, r2, r3
	mov	r1, r4
	mov	r2, r5
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #14
	mov	r3, r1, lsr #18
	orr	r3, r0, r3
	mov	r4, r2, asr #18
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	bx	lr
	.size	calcDiTerm2, .-calcDiTerm2
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
	@ args = 0, pretend = 0, frame = 168
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #172
	str	r0, [fp, #-184]
	str	r1, [fp, #-188]
	str	r2, [fp, #-192]
	mov	r3, #0
	str	r3, [fp, #-116]
	sub	r3, fp, #116
	ldr	r0, [fp, #-192]
	mov	r1, r3
	bl	putTimestamp
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	str	r3, [fp, #-104]
	sub	r3, fp, #116
	ldr	r0, [fp, #-192]
	mov	r1, r3
	bl	putTimestamp
	ldr	r3, [fp, #-188]
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	add	r3, r3, #16
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-112]
	rsb	r3, r3, r2
	str	r3, [fp, #-152]
	ldr	r3, [fp, #-188]
	add	r3, r3, #32
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	add	r3, r3, #32
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-112]
	rsb	r3, r3, r2
	str	r3, [fp, #-140]
	ldr	r3, [fp, #-188]
	add	r3, r3, #48
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	add	r3, r3, #48
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-112]
	rsb	r3, r3, r2
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-188]
	add	r3, r3, #16
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	add	r3, r3, #16
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-108]
	rsb	r3, r3, r2
	str	r3, [fp, #-148]
	ldr	r3, [fp, #-188]
	add	r3, r3, #32
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	add	r3, r3, #32
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-108]
	rsb	r3, r3, r2
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-188]
	add	r3, r3, #48
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	add	r3, r3, #48
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-108]
	rsb	r3, r3, r2
	str	r3, [fp, #-124]
	ldr	r3, [fp, #-188]
	add	r3, r3, #16
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	add	r3, r3, #16
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-104]
	rsb	r3, r3, r2
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-188]
	add	r3, r3, #32
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	add	r3, r3, #32
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-104]
	rsb	r3, r3, r2
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-188]
	add	r3, r3, #48
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-188]
	add	r3, r3, #48
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-104]
	rsb	r3, r3, r2
	str	r3, [fp, #-120]
	sub	r3, fp, #116
	ldr	r0, [fp, #-192]
	mov	r1, r3
	bl	putTimestamp
	ldr	r3, [fp, #-188]
	add	r3, r3, #16
	ldr	r3, [r3, #12]
	mov	r1, r3
	mov	r2, #0
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #12]
	mov	r4, #0
	subs	r1, r1, r3
	sbc	r2, r2, r4
	mov	r3, #11075584
	add	r3, r3, #30208
	add	r3, r3, #230
	mul	r0, r3, r2
	mov	r3, #0
	mul	r3, r1, r3
	add	r0, r0, r3
	mov	r3, #11075584
	add	r3, r3, #30208
	add	r3, r3, #230
	umull	r5, r6, r1, r3
	mov	r3, r5
	mov	r4, r6
	add	r0, r0, r4
	mov	r4, r0
	str	r3, [fp, #-100]
	str	r4, [fp, #-96]
	str	r3, [fp, #-100]
	str	r4, [fp, #-96]
	ldr	r3, [fp, #-188]
	add	r3, r3, #32
	ldr	r3, [r3, #12]
	mov	r1, r3
	mov	r2, #0
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #12]
	mov	r4, #0
	subs	r1, r1, r3
	sbc	r2, r2, r4
	mov	r3, #11075584
	add	r3, r3, #30208
	add	r3, r3, #230
	mul	r0, r3, r2
	mov	r3, #0
	mul	r3, r1, r3
	add	r0, r0, r3
	mov	r3, #11075584
	add	r3, r3, #30208
	add	r3, r3, #230
	umull	r6, r7, r1, r3
	mov	r3, r6
	mov	r4, r7
	add	r0, r0, r4
	mov	r4, r0
	str	r3, [fp, #-92]
	str	r4, [fp, #-88]
	str	r3, [fp, #-92]
	str	r4, [fp, #-88]
	ldr	r3, [fp, #-188]
	add	r3, r3, #48
	ldr	r3, [r3, #12]
	mov	r1, r3
	mov	r2, #0
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #12]
	mov	r4, #0
	subs	r1, r1, r3
	sbc	r2, r2, r4
	mov	r3, #11075584
	add	r3, r3, #30208
	add	r3, r3, #230
	mul	r0, r3, r2
	mov	r3, #0
	mul	r3, r1, r3
	add	r0, r0, r3
	mov	r3, #11075584
	add	r3, r3, #30208
	add	r3, r3, #230
	umull	r7, r8, r1, r3
	mov	r3, r7
	mov	r4, r8
	add	r0, r0, r4
	mov	r4, r0
	str	r3, [fp, #-84]
	str	r4, [fp, #-80]
	str	r3, [fp, #-84]
	str	r4, [fp, #-80]
	sub	r3, fp, #116
	ldr	r0, [fp, #-192]
	mov	r1, r3
	bl	putTimestamp
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, r0, asr #31
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #0]
	mov	r4, r3, asr #31
	mul	r2, r3, r1
	mul	ip, r0, r4
	add	r2, r2, ip
	umull	r5, r6, r0, r3
	mov	r3, r5
	mov	r4, r6
	add	r2, r2, r4
	mov	r4, r2
	mov	r2, r4, asl #30
	mov	r5, r3, lsr #2
	orr	r5, r2, r5
	mov	r6, r4, asr #2
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #4]
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #4]
	mov	r4, r3, asr #31
	mul	r0, r3, r2
	mul	ip, r1, r4
	add	r0, r0, ip
	umull	r7, r8, r1, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #30
	mov	r3, r1, lsr #2
	orr	r3, r0, r3
	mov	r4, r2, asr #2
	adds	r5, r5, r3
	adc	r6, r6, r4
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #8]
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #8]
	mov	r4, r3, asr #31
	mul	r0, r3, r2
	mul	ip, r1, r4
	add	r0, r0, ip
	umull	r7, r8, r1, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #30
	mov	r3, r1, lsr #2
	orr	r3, r0, r3
	mov	r4, r2, asr #2
	mov	r1, r5
	mov	r2, r6
	adds	r1, r1, r3
	adc	r2, r2, r4
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #12]
	mov	r4, #0
	adds	r3, r3, r3
	adc	r4, r4, r4
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-76]
	str	r4, [fp, #-72]
	ldr	r3, [fp, #-188]
	add	r3, r3, #16
	mov	r0, r3
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	calcDiTerm2
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-68]
	str	r4, [fp, #-64]
	ldr	r3, [fp, #-188]
	add	r3, r3, #32
	mov	r0, r3
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	calcDiTerm2
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	ldr	r3, [fp, #-188]
	add	r3, r3, #48
	mov	r0, r3
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	calcDiTerm2
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	sub	r3, fp, #116
	ldr	r0, [fp, #-192]
	mov	r1, r3
	bl	putTimestamp
	sub	r2, fp, #100
	ldmia	r2, {r1-r2}
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-180]
	str	r4, [fp, #-176]
	sub	r2, fp, #92
	ldmia	r2, {r1-r2}
	sub	r4, fp, #60
	ldmia	r4, {r3-r4}
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-172]
	str	r4, [fp, #-168]
	sub	r2, fp, #84
	ldmia	r2, {r1-r2}
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-164]
	str	r4, [fp, #-160]
	sub	r3, fp, #116
	ldr	r0, [fp, #-192]
	mov	r1, r3
	bl	putTimestamp
	ldr	r3, [fp, #-116]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-192]
	add	r3, r3, r2
	mov	r0, #1
	mov	r1, r3
	bl	clock_gettime
	ldr	r3, [fp, #-116]
	add	r3, r3, #1
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-140]
	mov	r1, r3
	mov	r2, r1, asr #31
	mov	r0, r1, lsr #16
	mov	r4, r2, asl #16
	orr	r4, r0, r4
	mov	r3, r1, asl #16
	ldr	r2, [fp, #-152]
	mov	r5, r2
	mov	r6, r5, asr #31
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-140]
	ldr	r3, [fp, #-136]
	mov	ip, r3
	ldr	r3, [fp, #-148]
	mov	r4, r3, asr #31
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r5, r6, r2, r3
	mov	r1, r5
	mov	r2, r6
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	rsb	r3, r3, ip
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-132]
	mov	ip, r3
	ldr	r3, [fp, #-144]
	mov	r4, r3, asr #31
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r6, r7, r2, r3
	mov	r1, r6
	mov	r2, r7
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	rsb	r3, r3, ip
	str	r3, [fp, #-132]
	sub	r6, fp, #172
	ldmia	r6, {r5-r6}
	sub	r4, fp, #180
	ldmia	r4, {r3-r4}
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r7, r8, r2, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	subs	r3, r5, r3
	sbc	r4, r6, r4
	str	r3, [fp, #-172]
	str	r4, [fp, #-168]
	ldr	r3, [fp, #-128]
	mov	r1, r3
	mov	r2, r1, asr #31
	mov	r0, r1, lsr #16
	mov	r4, r2, asl #16
	orr	r4, r0, r4
	mov	r3, r1, asl #16
	ldr	r2, [fp, #-152]
	mov	r5, r2
	mov	r6, r5, asr #31
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-124]
	mov	ip, r3
	ldr	r3, [fp, #-148]
	mov	r4, r3, asr #31
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r5, r6, r2, r3
	mov	r1, r5
	mov	r2, r6
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	rsb	r3, r3, ip
	str	r3, [fp, #-124]
	ldr	r3, [fp, #-120]
	mov	ip, r3
	ldr	r3, [fp, #-144]
	mov	r4, r3, asr #31
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r6, r7, r2, r3
	mov	r1, r6
	mov	r2, r7
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	rsb	r3, r3, ip
	str	r3, [fp, #-120]
	sub	r6, fp, #164
	ldmia	r6, {r5-r6}
	sub	r4, fp, #180
	ldmia	r4, {r3-r4}
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r7, r8, r2, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	subs	r3, r5, r3
	sbc	r4, r6, r4
	str	r3, [fp, #-164]
	str	r4, [fp, #-160]
	ldr	r3, [fp, #-148]
	mov	r1, r3
	mov	r2, r1, asr #31
	mov	r0, r1, lsr #16
	mov	r4, r2, asl #16
	orr	r4, r0, r4
	mov	r3, r1, asl #16
	ldr	r2, [fp, #-136]
	mov	r5, r2
	mov	r6, r5, asr #31
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-148]
	ldr	r3, [fp, #-144]
	mov	ip, r3
	ldr	r3, [fp, #-132]
	mov	r4, r3, asr #31
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r5, r6, r2, r3
	mov	r1, r5
	mov	r2, r6
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	rsb	r3, r3, ip
	str	r3, [fp, #-144]
	sub	r6, fp, #180
	ldmia	r6, {r5-r6}
	sub	r4, fp, #172
	ldmia	r4, {r3-r4}
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r7, r8, r2, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	subs	r3, r5, r3
	sbc	r4, r6, r4
	str	r3, [fp, #-180]
	str	r4, [fp, #-176]
	ldr	r3, [fp, #-124]
	mov	r1, r3
	mov	r2, r1, asr #31
	mov	r0, r1, lsr #16
	mov	r4, r2, asl #16
	orr	r4, r0, r4
	mov	r3, r1, asl #16
	ldr	r2, [fp, #-136]
	mov	r5, r2
	mov	r6, r5, asr #31
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-148]
	ldr	r3, [fp, #-120]
	mov	ip, r3
	ldr	r3, [fp, #-132]
	mov	r4, r3, asr #31
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r5, r6, r2, r3
	mov	r1, r5
	mov	r2, r6
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	rsb	r3, r3, ip
	str	r3, [fp, #-120]
	sub	r6, fp, #164
	ldmia	r6, {r5-r6}
	sub	r4, fp, #172
	ldmia	r4, {r3-r4}
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r7, r8, r2, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	subs	r3, r5, r3
	sbc	r4, r6, r4
	str	r3, [fp, #-164]
	str	r4, [fp, #-160]
	ldr	r3, [fp, #-144]
	mov	r1, r3
	mov	r2, r1, asr #31
	mov	r0, r1, lsr #16
	mov	r4, r2, asl #16
	orr	r4, r0, r4
	mov	r3, r1, asl #16
	ldr	r2, [fp, #-120]
	mov	r5, r2
	mov	r6, r5, asr #31
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	sub	r6, fp, #180
	ldmia	r6, {r5-r6}
	sub	r4, fp, #164
	ldmia	r4, {r3-r4}
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r7, r8, r2, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	subs	r3, r5, r3
	sbc	r4, r6, r4
	str	r3, [fp, #-180]
	str	r4, [fp, #-176]
	ldr	r3, [fp, #-132]
	mov	r1, r3
	mov	r2, r1, asr #31
	mov	r0, r1, lsr #16
	mov	r4, r2, asl #16
	orr	r4, r0, r4
	mov	r3, r1, asl #16
	ldr	r2, [fp, #-120]
	mov	r5, r2
	mov	r6, r5, asr #31
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	sub	r6, fp, #172
	ldmia	r6, {r5-r6}
	sub	r4, fp, #164
	ldmia	r4, {r3-r4}
	ldr	r2, [fp, #-44]
	mul	r0, r4, r2
	ldr	r2, [fp, #-40]
	mul	r2, r3, r2
	add	r0, r0, r2
	ldr	r2, [fp, #-44]
	umull	r7, r8, r2, r3
	mov	r1, r7
	mov	r2, r8
	add	r0, r0, r2
	mov	r2, r0
	mov	r0, r2, asl #16
	mov	r3, r1, lsr #16
	orr	r3, r0, r3
	mov	r4, r2, asr #16
	subs	r3, r5, r3
	sbc	r4, r6, r4
	str	r3, [fp, #-172]
	str	r4, [fp, #-168]
	ldr	r3, [fp, #-116]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-192]
	add	r3, r3, r2
	mov	r0, #1
	mov	r1, r3
	bl	clock_gettime
	ldr	r3, [fp, #-116]
	add	r3, r3, #1
	str	r3, [fp, #-116]
	sub	r2, fp, #180
	ldmia	r2, {r1-r2}
	ldr	r3, [fp, #-152]
	mov	r4, r3, asr #31
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	rsb	r2, r3, #0
	ldr	r3, [fp, #-184]
	str	r2, [r3, #0]
	sub	r2, fp, #172
	ldmia	r2, {r1-r2}
	ldr	r3, [fp, #-136]
	mov	r4, r3, asr #31
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	rsb	r2, r3, #0
	ldr	r3, [fp, #-184]
	str	r2, [r3, #4]
	sub	r2, fp, #164
	ldmia	r2, {r1-r2}
	ldr	r3, [fp, #-120]
	mov	r4, r3, asr #31
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	rsb	r2, r3, #0
	ldr	r3, [fp, #-184]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-116]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-192]
	add	r3, r3, r2
	mov	r0, #1
	mov	r1, r3
	bl	clock_gettime
	ldr	r3, [fp, #-116]
	add	r3, r3, #1
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, r0, asr #31
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #0]
	mov	r4, r3, asr #31
	mul	r2, r3, r1
	mul	ip, r0, r4
	add	r2, r2, ip
	umull	r5, r6, r0, r3
	add	r2, r2, r6
	mov	r6, r2
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #4]
	mov	r0, r3
	mov	r1, r0, asr #31
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #4]
	mov	r4, r3, asr #31
	mul	r2, r3, r1
	mul	ip, r0, r4
	add	r2, r2, ip
	umull	r7, r8, r0, r3
	mov	r3, r7
	mov	r4, r8
	add	r2, r2, r4
	mov	r4, r2
	adds	r5, r5, r3
	adc	r6, r6, r4
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #8]
	mov	r0, r3
	mov	r1, r0, asr #31
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #8]
	mov	r4, r3, asr #31
	mul	r2, r3, r1
	mul	ip, r0, r4
	add	r2, r2, ip
	umull	r7, r8, r0, r3
	mov	r3, r7
	mov	r4, r8
	add	r2, r2, r4
	mov	r4, r2
	adds	r3, r3, r5
	adc	r4, r4, r6
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_l2d
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	sqrt
	mov	r5, r0
	mov	r6, r1
	adr	r4, .L7
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	sub	r6, fp, #36
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2iz
	mov	r2, r0
	ldr	r3, [fp, #-184]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	sub	r6, fp, #36
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2iz
	mov	r2, r0
	ldr	r3, [fp, #-184]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #8]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	sub	r6, fp, #36
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2iz
	mov	r2, r0
	ldr	r3, [fp, #-184]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-116]
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-192]
	add	r3, r3, r2
	mov	r0, #1
	mov	r1, r3
	bl	clock_gettime
	ldr	r3, [fp, #-116]
	add	r3, r3, #1
	str	r3, [fp, #-116]
	sub	sp, fp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	402653184
	.word	1103372372
	.size	PRM, .-PRM
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
