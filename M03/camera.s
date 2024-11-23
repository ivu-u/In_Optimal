	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"camera.c"
	.text
	.align	2
	.global	initCamera
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCamera, %function
initCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L3
	ldrh	r1, [r2]
	ldr	r2, .L3+4
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	hOff
	.word	vOff
	.size	initCamera, .-initCamera
	.align	2
	.global	updateCamera
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCamera, %function
updateCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L17
	ldr	r4, .L17+4
	ldrh	r2, [r5]
	ldr	r0, .L17+8
	strh	r2, [r3, #20]	@ movhi
	ldrh	r2, [r4]
	ldr	lr, [r0, #20]
	strh	r2, [r3, #22]	@ movhi
	ldr	r2, [r0]
	cmp	r2, #0
	movlt	r7, #0
	ldr	r6, [r0, #4]
	rsb	r1, lr, #240
	add	r1, r1, r1, lsr #31
	sub	r1, r2, r1, asr #1
	strlt	r7, [r0]
	movlt	r2, lr
	addge	r2, r2, lr
	cmp	r6, #0
	movlt	r7, #0
	ldr	ip, [r0, #16]
	rsb	r3, ip, #160
	add	r3, r3, r3, lsr #31
	sub	r3, r6, r3, asr #1
	movlt	r6, ip
	strlt	r7, [r0, #4]
	ldr	r7, .L17+12
	ldr	r7, [r7]
	addge	r6, r6, ip
	cmp	r7, r2
	ldr	r2, .L17+16
	sublt	lr, r7, lr
	strlt	lr, [r0]
	ldr	lr, [r2]
	cmp	lr, r6
	sublt	ip, lr, ip
	strlt	ip, [r0, #4]
	cmp	r1, #0
	movlt	r2, #0
	str	r1, [r5]
	strlt	r2, [r5]
	movlt	r1, r2
	cmp	r3, #0
	movlt	r2, #0
	str	r3, [r4]
	movlt	r3, r2
	strlt	r2, [r4]
	sub	r2, r7, #239
	cmp	r2, r1
	suble	r2, r7, #240
	strle	r2, [r5]
	sub	r2, lr, #159
	cmp	r2, r3
	suble	r3, lr, #160
	strle	r3, [r4]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	hOff
	.word	vOff
	.word	player
	.word	MapWidth
	.word	MapHeight
	.size	updateCamera, .-updateCamera
	.ident	"GCC: (devkitARM release 53) 9.1.0"
