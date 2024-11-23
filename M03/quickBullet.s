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
	.file	"quickBullet.c"
	.text
	.align	2
	.global	initQuickBullets
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initQuickBullets, %function
initQuickBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #2
	mov	r2, #12
	mov	r1, #0
	push	{r4, lr}
	ldr	r4, .L6
	ldr	r3, .L6+4
	ldr	ip, [r4]
	str	ip, [r3]
	add	lr, ip, ip, lsl r0
	ldr	r3, .L6+8
	add	lr, ip, lr, lsl #1
	add	r3, r3, lr, lsl r0
.L2:
	str	r2, [r3, #36]
	add	r2, r2, #1
	cmp	r2, #32
	str	r1, [r3]
	str	r1, [r3, #4]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #40]
	add	r3, r3, #44
	bne	.L2
	add	ip, ip, #20
	str	ip, [r4]
	pop	{r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	currNumBulls
	.word	qb_index
	.word	bullets
	.size	initQuickBullets, .-initQuickBullets
	.align	2
	.global	drawQuickBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawQuickBullet, %function
drawQuickBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #288
	ldr	r2, .L10
	ldr	ip, .L10+4
	ldr	r3, [r0, #8]
	ldr	r1, [r2]
	ldr	r4, [ip]
	ldr	r2, [r0, #12]
	ldr	ip, .L10+8
	sub	r3, r3, r1
	ldr	r1, [r0, #36]
	sub	r2, r2, r4
	lsl	r3, r3, #23
	add	r0, ip, r1, lsl #3
	lsr	r3, r3, #23
	lsl	r1, r1, #3
	and	r2, r2, #255
	strh	lr, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [ip, r1]	@ movhi
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawQuickBullet, .-drawQuickBullet
	.align	2
	.global	moveQuickBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveQuickBullet, %function
moveQuickBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L12
.L15:
	.word	.L18
	.word	.L17
	.word	.L16
	.word	.L14
.L14:
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #16]
	add	r3, r3, r2
	str	r3, [r0, #8]
.L12:
	bx	lr
.L18:
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #20]
	sub	r3, r3, r2
	str	r3, [r0, #12]
	bx	lr
.L17:
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #20]
	add	r3, r3, r2
	str	r3, [r0, #12]
	bx	lr
.L16:
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #16]
	sub	r3, r3, r2
	str	r3, [r0, #8]
	bx	lr
	.size	moveQuickBullet, .-moveQuickBullet
	.align	2
	.global	updateQuickBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateQuickBullets, %function
updateQuickBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #288
	ldr	r2, .L21
	ldr	ip, .L21+4
	ldr	r3, [r0, #8]
	ldr	lr, [r2]
	ldr	ip, [ip]
	ldr	r2, [r0, #12]
	ldr	r1, [r0, #36]
	sub	r3, r3, lr
	ldr	lr, .L21+8
	sub	r2, r2, ip
	lsl	r3, r3, #23
	add	ip, lr, r1, lsl #3
	lsr	r3, r3, #23
	lsl	r1, r1, #3
	and	r2, r2, #255
	strh	r2, [lr, r1]	@ movhi
	strh	r4, [ip, #4]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	pop	{r4, lr}
	b	moveQuickBullet
.L22:
	.align	2
.L21:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	updateQuickBullets, .-updateQuickBullets
	.align	2
	.global	spawnQuickBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnQuickBullet, %function
spawnQuickBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	push	{r4, lr}
	ldr	r3, [r3]
	ldr	r0, .L33+4
	add	r2, r3, r3, lsl #2
	add	r2, r3, r2, lsl #1
	add	r2, r0, r2, lsl #2
	add	ip, r3, #19
.L25:
	ldr	r1, [r2]
	cmp	r1, #0
	bne	.L32
.L24:
	mov	lr, #3
	ldr	r1, .L33+8
	add	r2, r3, r3, lsl #2
	ldr	ip, [r1, #28]
	ldr	r4, [r1, #4]
	add	r3, r3, r2, lsl #1
	add	r2, r0, r3, lsl #2
	cmp	ip, lr
	str	r4, [r2, #12]
	ldr	r4, [r1]
	ldreq	r1, [r1, #20]
	str	r4, [r2, #8]
	addeq	r4, r1, r4
	str	lr, [r2, #16]
	str	lr, [r2, #20]
	streq	r4, [r2, #8]
	str	ip, [r2, #32]
	mov	r2, #1
	lsl	r3, r3, #2
	str	r2, [r0, r3]
	pop	{r4, lr}
	bx	lr
.L32:
	add	r1, r3, #1
	cmp	r1, ip
	add	r2, r2, #44
	bgt	.L24
	mov	r3, r1
	b	.L25
.L34:
	.align	2
.L33:
	.word	qb_index
	.word	bullets
	.word	player
	.size	spawnQuickBullet, .-spawnQuickBullet
	.comm	qb_index,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
