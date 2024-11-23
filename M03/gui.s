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
	.file	"gui.c"
	.text
	.align	2
	.global	initGui
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGui, %function
initGui:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	mov	r1, #3
	mov	r0, #44
	ldr	r3, .L10
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	cmp	r2, ip
	stmib	r3, {r1, ip}
	str	r1, [r3]
	strb	r0, [r3, #12]
	bxle	lr
	mov	r1, #45
	ldr	r3, .L10+8
	cmp	r2, #1
	str	r1, [r3]
	bxeq	lr
	cmp	r2, #2
	mov	r1, #46
	movne	r2, #47
	str	r1, [r3, #4]
	strne	r2, [r3, #8]
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	gui
	.word	heartOams
	.size	initGui, .-initGui
	.align	2
	.global	drawGui
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGui, %function
drawGui:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r3, .L18
	ldr	r2, .L18+4
	push	{r4, r5, r6, r7, r8, lr}
	ldrb	r7, [r3, #4]	@ zero_extendqisi2
	ldr	r8, [r2, #32]
	ldrh	r3, [r3]
	ldr	r4, .L18+8
	ldr	lr, .L18+12
	ldr	r6, .L18+16
.L14:
	cmp	r8, r1
	movle	r5, #130
	movgt	r5, #128
	ldr	r2, [r4], #4
	and	r0, r3, r6
	add	r1, r1, #1
	add	r3, r3, #17
	add	ip, lr, r2, lsl #3
	orr	r0, r0, #16384
	lsl	r2, r2, #3
	lsl	r3, r3, #16
	cmp	r1, #3
	strh	r5, [ip, #4]	@ movhi
	strh	r7, [lr, r2]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	lsr	r3, r3, #16
	bne	.L14
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	gui
	.word	player
	.word	heartOams
	.word	shadowOAM
	.word	511
	.size	drawGui, .-drawGui
	.comm	heartOams,12,4
	.comm	gui,16,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
