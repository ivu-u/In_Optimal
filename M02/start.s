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
	.file	"start.c"
	.text
	.align	2
	.global	initStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStart, %function
initStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #3936
	mov	r0, #3
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	DMANow
	.word	100679680
	.word	mainMenuBGTiles
	.word	mainMenuBGPal
	.word	100698112
	.word	mainMenuBGMap
	.size	initStart, .-initStart
	.align	2
	.global	updateStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L18
	ldr	r5, .L18+4
	ldr	r3, [r4]
	ldrh	r2, [r5]
	add	r3, r3, #1
	tst	r2, #4
	str	r3, [r4]
	beq	.L7
	ldr	r3, .L18+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L16
.L7:
	tst	r2, #8
	beq	.L6
	ldr	r3, .L18+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L17
.L6:
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	ldr	r0, [r4]
	ldr	r3, .L18+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r3, .L18+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L16:
	mov	r0, #6
	ldr	r3, .L18+16
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	b	.L7
.L19:
	.align	2
.L18:
	.word	rSeed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	enterState
	.size	updateStart, .-updateStart
	.ident	"GCC: (devkitARM release 53) 9.1.0"
