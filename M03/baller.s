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
	.file	"baller.c"
	.text
	.align	2
	.global	initBaller
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBaller, %function
initBaller:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L7
	str	lr, [sp, #-4]!
	ldr	lr, [r3, #4]
	cmp	lr, #0
	ble	.L1
	mov	r2, #0
	mov	r0, #12
	mov	r1, #1
	ldr	r3, .L7+4
.L3:
	add	ip, r2, #51
	add	r2, r2, #1
	cmp	r2, #10
	cmpne	r2, lr
	str	r0, [r3, #8]
	str	r0, [r3, #40]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	strb	ip, [r3, #44]
	add	r3, r3, #48
	blt	.L3
.L1:
	ldr	lr, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	enemy_manager
	.word	ballers
	.size	initBaller, .-initBaller
	.align	2
	.global	drawBaller
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBaller, %function
drawBaller:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r2, .L11
	ldr	r3, [r0, #16]
	ldr	r2, [r2]
	ldr	r1, .L11+4
	sub	r3, r3, r2
	ldr	lr, [r1]
	ldr	r2, [r0, #20]
	ldrb	r1, [r0, #44]	@ zero_extendqisi2
	ldr	ip, .L11+8
	lsl	r3, r3, #23
	sub	r2, r2, lr
	lsr	r3, r3, #23
	ldr	lr, .L11+12
	add	r0, ip, r1, lsl #3
	orr	r3, r3, #16384
	lsl	r1, r1, #3
	and	r2, r2, #255
	strh	lr, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [ip, r1]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	4448
	.size	drawBaller, .-drawBaller
	.align	2
	.global	randomizeDirection
	.syntax unified
	.arm
	.fpu softvfp
	.type	randomizeDirection, %function
randomizeDirection:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L18
	mov	r5, r0
	mov	lr, pc
	bx	r6
	ldr	r4, .L18+4
	smull	r3, r4, r0, r4
	sub	r4, r4, r0, asr #31
	add	r4, r4, r4, lsl #1
	sub	r4, r0, r4
	mov	lr, pc
	bx	r6
	tst	r0, #1
	mvnne	r3, r4
	addeq	r3, r4, #1
	str	r3, [r5, #24]
	mov	lr, pc
	bx	r6
	ldr	r4, .L18+4
	smull	r3, r4, r0, r4
	sub	r4, r4, r0, asr #31
	add	r4, r4, r4, lsl #1
	sub	r4, r0, r4
	mov	lr, pc
	bx	r6
	mvn	r3, r4
	tst	r0, #1
	addeq	r3, r4, #1
	str	r3, [r5, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	rand
	.word	1431655766
	.size	randomizeDirection, .-randomizeDirection
	.align	2
	.global	moveBaller
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveBaller, %function
moveBaller:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r2, [r0, #16]
	ldr	r0, [r0, #24]
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #28]
	add	r2, r2, r0
	add	r3, r3, r1
	cmp	r2, #0
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	ble	.L21
	ldr	r1, .L26
	ldr	r1, [r1]
	sub	r1, r1, #12
	cmp	r2, r1
	bge	.L21
.L22:
	cmp	r3, #0
	ble	.L23
	ldr	r2, .L26+4
	ldr	r2, [r2]
	add	r2, r2, #11
	cmp	r2, r3
	bge	.L20
.L23:
	mov	r0, r4
	pop	{r4, lr}
	b	randomizeDirection
.L21:
	mov	r0, r4
	bl	randomizeDirection
	ldr	r3, [r4, #20]
	b	.L22
.L20:
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	MapWidth
	.word	MapHeight
	.size	moveBaller, .-moveBaller
	.align	2
	.global	setBallerPos
	.syntax unified
	.arm
	.fpu softvfp
	.type	setBallerPos, %function
setBallerPos:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L35
	mov	r3, #0
	mov	ip, r2
	str	lr, [sp, #-4]!
.L30:
	ldr	lr, [ip]
	cmp	lr, #0
	bne	.L34
	mov	lr, #1
	add	r3, r3, r3, lsl lr
	add	ip, r2, r3, lsl #4
	str	lr, [ip, #12]
	str	lr, [r2, r3, lsl #4]
	str	r0, [ip, #16]
	str	r1, [ip, #20]
	ldr	lr, [sp], #4
	bx	lr
.L34:
	add	r3, r3, #1
	cmp	r3, #10
	add	ip, ip, #48
	bne	.L30
	ldr	lr, [sp], #4
	bx	lr
.L36:
	.align	2
.L35:
	.word	ballers
	.size	setBallerPos, .-setBallerPos
	.align	2
	.global	checkBallerCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBallerCollision, %function
checkBallerCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #12
	push	{r4, r5, lr}
	ldr	r2, .L44
	ldr	r5, [r2, #32]
	ldr	lr, [r2, #20]
	ldm	r2, {r2, ip}
	sub	sp, sp, #20
	mov	r4, r0
	add	r0, r0, #16
	ldm	r0, {r0, r1}
	stm	sp, {r2, ip, lr}
	str	r5, [sp, #12]
	mov	r2, r3
	ldr	r5, .L44+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L43
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L43:
	mov	r0, #1
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	mov	r0, #0
	mov	r1, #512
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	ldr	r2, .L44+12
	lsl	r3, r3, #3
	str	r0, [r4]
	strh	r1, [r2, r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	player
	.word	collision
	.word	playerTakeDamage
	.word	shadowOAM
	.size	checkBallerCollision, .-checkBallerCollision
	.align	2
	.global	updateBallers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBallers, %function
updateBallers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L54
	ldr	r5, .L54+4
	ldr	r7, .L54+8
	ldr	r6, .L54+12
	add	r8, r4, #480
.L48:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L47
	mov	r0, r4
	bl	moveBaller
	ldr	r1, [r6]
	ldr	r3, [r4, #16]
	sub	r3, r3, r1
	ldr	r0, [r7]
	ldrb	r1, [r4, #44]	@ zero_extendqisi2
	ldr	r2, [r4, #20]
	lsl	r3, r3, #23
	ldr	lr, .L54+16
	lsr	r3, r3, #23
	add	ip, r5, r1, lsl #3
	sub	r2, r2, r0
	orr	r3, r3, #16384
	lsl	r1, r1, #3
	and	r2, r2, #255
	mov	r0, r4
	strh	r3, [ip, #2]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	strh	r2, [r5, r1]	@ movhi
	bl	checkBallerCollision
.L47:
	add	r4, r4, #48
	cmp	r4, r8
	bne	.L48
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	ballers
	.word	shadowOAM
	.word	vOff
	.word	hOff
	.word	4448
	.size	updateBallers, .-updateBallers
	.align	2
	.global	eraseBaller
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseBaller, %function
eraseBaller:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	mov	r1, #512
	ldrb	r3, [r0, #44]	@ zero_extendqisi2
	ldr	r2, .L57
	lsl	r3, r3, #3
	str	ip, [r0]
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L58:
	.align	2
.L57:
	.word	shadowOAM
	.size	eraseBaller, .-eraseBaller
	.ident	"GCC: (devkitARM release 53) 9.1.0"
