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
	.file	"instructions.c"
	.text
	.align	2
	.global	initIntructions
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initIntructions, %function
initIntructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.size	initIntructions, .-initIntructions
	.align	2
	.global	updateInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateInstructions, %function
updateInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L13
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L6
	ldr	r3, .L13+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L12
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	mov	r0, #1
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	enterState
	.size	updateInstructions, .-updateInstructions
	.align	2
	.global	drawInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawInstructions, %function
drawInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawInstructions, .-drawInstructions
	.ident	"GCC: (devkitARM release 53) 9.1.0"
