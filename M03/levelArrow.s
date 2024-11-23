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
	.file	"levelArrow.c"
	.text
	.align	2
	.global	initArrowSprites
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initArrowSprites, %function
initArrowSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	r2, #16384
	ldr	r3, .L3
	str	r1, [r3, #16]
	str	r1, [r3, #40]
	str	r1, [r3, #64]
	str	r1, [r3, #88]
	str	r2, [r3, #20]
	str	r2, [r3, #44]
	str	r2, [r3, #68]
	str	r2, [r3, #92]
	bx	lr
.L4:
	.align	2
.L3:
	.word	arrow_data
	.size	initArrowSprites, .-initArrowSprites
	.align	2
	.global	updateArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateArrows, %function
updateArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateArrows, .-updateArrows
	.align	2
	.global	arrowsON
	.syntax unified
	.arm
	.fpu softvfp
	.type	arrowsON, %function
arrowsON:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	arrowsON, .-arrowsON
	.align	2
	.global	arrowsOFF
	.syntax unified
	.arm
	.fpu softvfp
	.type	arrowsOFF, %function
arrowsOFF:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	arrowsOFF, .-arrowsOFF
	.align	2
	.global	setArrowPos
	.syntax unified
	.arm
	.fpu softvfp
	.type	setArrowPos, %function
setArrowPos:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	setArrowPos, .-setArrowPos
	.align	2
	.global	drawArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawArrows, %function
drawArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawArrows, .-drawArrows
	.global	arrowsActive
	.comm	arrow_data,96,4
	.bss
	.align	2
	.type	arrowsActive, %object
	.size	arrowsActive, 4
arrowsActive:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
