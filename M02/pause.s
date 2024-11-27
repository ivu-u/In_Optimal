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
	.file	"pause.c"
	.text
	.align	2
	.global	innitPause
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	innitPause, %function
innitPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	100698112
	.word	pauseBGMap
	.size	innitPause, .-innitPause
	.align	2
	.global	updatePause
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L13+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L13+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L6
	ldr	r3, .L13+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L12
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	mov	r0, #3
	ldr	r3, .L13+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	resumeState
	.size	updatePause, .-updatePause
	.align	2
	.global	drawPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPause, %function
drawPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawPause, .-drawPause
	.ident	"GCC: (devkitARM release 53) 9.1.0"
