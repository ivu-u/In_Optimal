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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #4864
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	strh	r0, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	mov	r0, #0
	ldr	r2, .L4+12
	strh	r1, [r3, #10]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r2, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	4097
	.word	4356
	.word	enterState
	.word	rSeed
	.size	initialize, .-initialize
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L9
	mov	lr, pc
	bx	r3
	ldr	r7, .L9+4
	ldr	r4, .L9+8
	ldr	r6, .L9+12
	ldr	r5, .L9+16
.L7:
	ldrh	r3, [r4]
	strh	r3, [r7]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r6
	b	.L7
.L10:
	.align	2
.L9:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	runState
	.word	67109120
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	rSeed,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
