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
	.file	"states.c"
	.text
	.align	2
	.global	runState
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	runState, %function
runState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L13
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L1
.L4:
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L5
	.word	.L3
.L5:
	ldr	r3, .L13+4
	mov	lr, pc
	bx	r3
.L1:
	pop	{r4, lr}
	bx	lr
.L3:
	ldr	r3, .L13+8
	mov	lr, pc
	bx	r3
.L8:
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	ldr	r3, .L13+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L7:
	ldr	r3, .L13+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L6:
	ldr	r3, .L13+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L10:
	ldr	r3, .L13+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	state
	.word	updateWin
	.word	updateInstructions
	.word	updatePause
	.word	updateStart
	.word	updateGame
	.word	updateLose
	.word	updateCutscene
	.size	runState, .-runState
	.align	2
	.global	enterState
	.syntax unified
	.arm
	.fpu softvfp
	.type	enterState, %function
enterState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r1, .L27
	ldr	r2, .L27+4
	push	{r4, lr}
	str	r3, [r1]
	str	r3, [r2]
	cmp	r0, #6
	ldrls	pc, [pc, r0, asl #2]
	b	.L15
.L18:
	.word	.L24
	.word	.L23
	.word	.L25
	.word	.L21
	.word	.L20
	.word	.L19
	.word	.L17
.L25:
	ldr	r4, .L27+8
.L22:
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	mov	r3, #2
	strb	r3, [r4]
.L15:
	pop	{r4, lr}
	bx	lr
.L21:
	ldr	r3, .L27+16
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L27+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r3, .L27+20
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L27+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r3, .L27+24
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L27+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L17:
	ldr	r3, .L27+28
	mov	lr, pc
	bx	r3
	mov	r3, #6
	ldr	r4, .L27+8
	strb	r3, [r4]
	b	.L22
.L24:
	ldr	r3, .L27+32
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L27+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L23:
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L27+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	hOff
	.word	vOff
	.word	state
	.word	innitPause
	.word	initGame
	.word	innitLose
	.word	innitWin
	.word	initIntructions
	.word	initCutscene
	.word	initStart
	.size	enterState, .-enterState
	.align	2
	.global	resumeState
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeState, %function
resumeState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #3
	bxne	lr
	push	{r4, lr}
	mov	r4, r0
	ldr	r3, .L35
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+4
	strb	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	resumeGame
	.word	state
	.size	resumeState, .-resumeState
	.comm	state,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
