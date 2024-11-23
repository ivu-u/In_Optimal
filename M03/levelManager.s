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
	.file	"levelManager.c"
	.text
	.align	2
	.global	initLevelManager
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLevelManager, %function
initLevelManager:
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
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	initArrowSprites
	.word	arrowsON
	.size	initLevelManager, .-initLevelManager
	.align	2
	.global	runLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	runLevel, %function
runLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L10
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L9
.L7:
	ldr	r3, .L10+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	ldr	r3, .L10+8
	mov	lr, pc
	bx	r3
	b	.L7
.L11:
	.align	2
.L10:
	.word	currLevel
	.word	updateArrows
	.word	update_lvl1
	.size	runLevel, .-runLevel
	.align	2
	.global	enterLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	enterLevel, %function
enterLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L18
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	initLevel1
	.size	enterLevel, .-enterLevel
	.align	2
	.global	allEnemiesCleared
	.syntax unified
	.arm
	.fpu softvfp
	.type	allEnemiesCleared, %function
allEnemiesCleared:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	allEnemiesCleared, .-allEnemiesCleared
	.align	2
	.global	drawLevelMaps
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLevelMaps, %function
drawLevelMaps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L27
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	currLevel
	.word	drawMaps_lvl1
	.size	drawLevelMaps, .-drawLevelMaps
	.comm	currLevel,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
