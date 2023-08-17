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
	.file	"test_PRM.c"
	.text
	.align	2
	.global	setCoord
	.type	setCoord, %function
setCoord:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #8]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	setCoord, .-setCoord
	.align	2
	.global	getGPSData
	.type	getGPSData, %function
getGPSData:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	sub	r0, fp, #20
	stmia	r0, {r1, r2, r3}
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	ldr	ip, [fp, #-16]
	ldr	lr, [fp, #-12]
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	mov	r3, lr
	bl	setCoord
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #4]
	str	r3, [r2, #12]
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	getGPSData, .-getGPSData
	.section	.rodata
	.align	2
	.type	__PRETTY_FUNCTION__.1957, %object
	.size	__PRETTY_FUNCTION__.1957, 5
__PRETTY_FUNCTION__.1957:
	.ascii	"main\000"
	.align	2
.LC0:
	.ascii	"./test_gen.txt\000"
	.align	2
.LC1:
	.ascii	"r\000"
	.align	2
.LC2:
	.ascii	"Error opening this file\000"
	.align	2
.LC3:
	.ascii	"%d %d %d %d %d\000"
	.align	2
.LC4:
	.ascii	"sscanf(line, \"%d %d %d %d %d\", &satellite_id[i], "
	.ascii	"&X_gen[i], &Y_gen[i], &Z_gen[i], &time_gen[i]) == 5"
	.ascii	"\000"
	.align	2
.LC5:
	.ascii	"test_PRM.c\000"
	.align	2
.LC6:
	.ascii	"\012*Benchmarking enabled*\012\000"
	.align	2
.LC7:
	.ascii	"benchmark timestamps:\000"
	.align	2
.LC8:
	.ascii	"%d\012\000"
	.align	2
.LC9:
	.ascii	"PRM complete in %d nanoseconds\012\000"
	.align	2
.LC10:
	.ascii	"\012Emitter calculated coords: \012\000"
	.align	2
.LC11:
	.ascii	"\011 x: %10d\012\000"
	.align	2
.LC12:
	.ascii	"\011 y: %10d\012\000"
	.align	2
.LC13:
	.ascii	"\011 z: %10d\012\000"
	.align	2
.LC14:
	.ascii	"\012Emitter true coords: \012\000"
	.align	2
.LC15:
	.ascii	"\012Emitter coords absolute error: \012\000"
	.align	2
.LC16:
	.ascii	"\012--------------END--------------\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 1800
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #1808
	sub	sp, sp, #12
	ldr	r0, .L17
	ldr	r1, .L17+4
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L6
	ldr	r0, .L17+8
	bl	perror
	mov	r0, #1
	str	r0, [fp, #-1808]
	b	.L7
.L6:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L8
.L10:
	sub	r3, fp, #1248
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	strlen
	mov	r3, r0
	cmp	r3, #10
	bls	.L8
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	sub	ip, fp, #1152
	sub	ip, ip, #12
	sub	ip, ip, #8
	add	ip, ip, r3
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	sub	lr, fp, #372
	add	lr, lr, r3
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	sub	r0, fp, #572
	add	r0, r0, r3
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	sub	r1, fp, #772
	add	r1, r1, r3
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	sub	r2, fp, #972
	add	r2, r2, r3
	sub	r3, fp, #1248
	sub	r3, r3, #12
	sub	r3, r3, #12
	str	r0, [sp, #0]
	str	r1, [sp, #4]
	str	r2, [sp, #8]
	mov	r0, r3
	ldr	r1, .L17+12
	mov	r2, ip
	mov	r3, lr
	bl	sscanf
	mov	r3, r0
	cmp	r3, #5
	beq	.L9
	ldr	r0, .L17+16
	ldr	r1, .L17+20
	mov	r2, #65
	ldr	r3, .L17+24
	bl	__assert_fail
.L9:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L8:
	sub	r3, fp, #1248
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, #100
	ldr	r2, [fp, #-36]
	bl	fgets
	mov	r3, r0
	cmp	r3, #0
	bne	.L10
	ldr	r0, [fp, #-36]
	bl	fclose
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L11
.L15:
	ldr	r2, [fp, #-28]
	mov	r3, #-1509949440
	mov	r3, r3, asr #22
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-28]
	mov	r3, #-1174405120
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	lr, [r3, #0]
	ldr	r2, [fp, #-28]
	mov	r3, #-1593835520
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	ip, [r3, #0]
	sub	r3, fp, #108
	mov	r0, r3
	mov	r2, lr
	mov	r3, ip
	bl	setCoord
	ldr	r3, [fp, #-28]
	add	r2, r3, #1
	mov	r3, #-1509949440
	mov	r3, r3, asr #22
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r2, r3, #1
	mov	r3, #-1174405120
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r4, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r2, r3, #1
	mov	r3, #-1593835520
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	ip, [r3, #0]
	sub	r3, fp, #108
	add	r3, r3, #12
	mov	r0, r3
	mov	r2, r4
	mov	r3, ip
	bl	setCoord
	ldr	r3, [fp, #-28]
	add	r2, r3, #2
	mov	r3, #-1509949440
	mov	r3, r3, asr #22
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r2, r3, #2
	mov	r3, #-1174405120
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r4, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r2, r3, #2
	mov	r3, #-1593835520
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	ip, [r3, #0]
	sub	r3, fp, #108
	add	r3, r3, #24
	mov	r0, r3
	mov	r2, r4
	mov	r3, ip
	bl	setCoord
	ldr	r3, [fp, #-28]
	add	r2, r3, #3
	mov	r3, #-1509949440
	mov	r3, r3, asr #22
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r2, r3, #3
	mov	r3, #-1174405120
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r4, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r2, r3, #3
	mov	r3, #-1593835520
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	ip, [r3, #0]
	sub	r3, fp, #108
	add	r3, r3, #36
	mov	r0, r3
	mov	r2, r4
	mov	r3, ip
	bl	setCoord
	ldr	r3, [fp, #-28]
	add	r2, r3, #4
	mov	r3, #-1509949440
	mov	r3, r3, asr #22
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r2, r3, #4
	mov	r3, #-1174405120
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r4, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r2, r3, #4
	mov	r3, #-1593835520
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	ip, [r3, #0]
	sub	r3, fp, #60
	mov	r0, r3
	mov	r2, r4
	mov	r3, ip
	bl	setCoord
	ldr	r2, [fp, #-28]
	mov	r3, #-2013265920
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	sub	r2, fp, #172
	str	r3, [sp, #0]
	mov	r0, r2
	sub	r3, fp, #108
	ldmia	r3, {r1, r2, r3}
	bl	getGPSData
	ldr	r3, [fp, #-28]
	add	r2, r3, #1
	mov	r3, #-2013265920
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3
	sub	r3, fp, #172
	add	r3, r3, #16
	str	r2, [sp, #0]
	mov	r0, r3
	sub	r3, fp, #96
	ldmia	r3, {r1, r2, r3}
	bl	getGPSData
	ldr	r3, [fp, #-28]
	add	r2, r3, #2
	mov	r3, #-2013265920
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3
	sub	r3, fp, #172
	add	r3, r3, #32
	str	r2, [sp, #0]
	mov	r0, r3
	sub	r3, fp, #84
	ldmia	r3, {r1, r2, r3}
	bl	getGPSData
	ldr	r3, [fp, #-28]
	add	r2, r3, #3
	mov	r3, #-2013265920
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3
	sub	r3, fp, #172
	add	r3, r3, #48
	str	r2, [sp, #0]
	mov	r0, r3
	sub	r3, fp, #72
	ldmia	r3, {r1, r2, r3}
	bl	getGPSData
	sub	r3, fp, #1776
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r2, #512
	mov	r0, r3
	mov	r1, #0
	bl	memset
	ldr	r0, .L17+28
	bl	puts
	sub	r3, fp, #1264
	sub	r3, r3, #12
	sub	r3, r3, #4
	mov	r0, #1
	mov	r1, r3
	bl	clock_gettime
	sub	r2, fp, #48
	sub	r1, fp, #172
	sub	r3, fp, #1776
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r2
	mov	r2, r3
	bl	PRM
	sub	r3, fp, #1264
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, #1
	mov	r1, r3
	bl	clock_gettime
	ldr	r2, [fp, #-1284]
	ldr	r3, [fp, #-1276]
	rsb	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r0, .L17+32
	bl	puts
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L12
.L14:
	ldr	r2, [fp, #-20]
	mvn	r3, #1776
	sub	r3, r3, #7
	mov	r2, r2, asl #3
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-1276]
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r0, .L17+36
	ldr	r1, [fp, #-16]
	bl	printf
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L12:
	ldr	r3, [fp, #-20]
	cmp	r3, #63
	bgt	.L13
	ldr	r2, [fp, #-20]
	mvn	r3, #1776
	sub	r3, r3, #7
	mov	r2, r2, asl #3
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L14
.L13:
	ldr	r0, .L17+40
	ldr	r1, [fp, #-24]
	bl	printf
	ldr	r0, .L17+44
	bl	puts
	ldr	r3, [fp, #-48]
	ldr	r0, .L17+48
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-44]
	ldr	r0, .L17+52
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-40]
	ldr	r0, .L17+56
	mov	r1, r3
	bl	printf
	ldr	r0, .L17+60
	bl	puts
	ldr	r3, [fp, #-60]
	ldr	r0, .L17+48
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-56]
	ldr	r0, .L17+52
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-52]
	ldr	r0, .L17+56
	mov	r1, r3
	bl	printf
	ldr	r0, .L17+64
	bl	puts
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-60]
	rsb	r3, r3, r2
	ldr	r0, .L17+48
	mov	r1, r3
	bl	printf
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-56]
	rsb	r3, r3, r2
	ldr	r0, .L17+52
	mov	r1, r3
	bl	printf
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	rsb	r3, r3, r2
	ldr	r0, .L17+56
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-28]
	add	r3, r3, #5
	str	r3, [fp, #-28]
.L11:
	ldr	r3, [fp, #-28]
	cmp	r3, #49
	ble	.L15
	ldr	r0, .L17+68
	bl	puts
	mov	r1, #0
	str	r1, [fp, #-1808]
.L7:
	ldr	r3, [fp, #-1808]
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	__PRETTY_FUNCTION__.1957
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
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
