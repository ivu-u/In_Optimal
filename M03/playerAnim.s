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
	.file	"playerAnim.c"
	.text
	.align	2
	.global	initPlayerAnim
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayerAnim, %function
initPlayerAnim:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #32768
	mov	r0, #10
	mov	r1, #1
	ldr	r3, .L3
	str	ip, [r3]
	str	ip, [r3, #4]
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	strb	r2, [r3, #32]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	bx	lr
.L4:
	.align	2
.L3:
	.word	playerSprite
	.size	initPlayerAnim, .-initPlayerAnim
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, #0
	ldr	r0, .L8
	ldr	r2, .L8+4
	ldr	r3, [r0]
	ldr	r1, [r2]
	ldr	r4, .L8+8
	ldr	ip, .L8+12
	ldr	r2, [r0, #4]
	ldr	r7, [r4]
	sub	r3, r3, r1
	ldrh	r6, [ip, #4]
	ldrb	r1, [ip, #32]	@ zero_extendqisi2
	ldr	r4, [ip]
	ldr	r5, [r0, #28]
	ldr	ip, .L8+16
	lsl	r3, r3, #23
	sub	r2, r2, r7
	lsr	r3, r3, #23
	orr	r3, r3, r6
	add	r0, ip, r1, lsl #3
	cmp	r5, #3
	and	r2, r2, #255
	strh	r3, [r0, #2]	@ movhi
	orr	r2, r2, r4
	lsl	r1, r1, #3
	orreq	r3, r3, #4096
	strh	lr, [r0, #4]	@ movhi
	strh	r2, [ip, r1]	@ movhi
	strheq	r3, [r0, #2]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	hOff
	.word	vOff
	.word	playerSprite
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	playerSprite,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
