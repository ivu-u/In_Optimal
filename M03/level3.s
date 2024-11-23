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
	.file	"level3.c"
	.text
	.align	2
	.global	init_lvl3_room1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_lvl3_room1, %function
init_lvl3_room1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L4
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L4+4
	ldr	r4, .L4+8
	mov	lr, pc
	bx	r4
	mov	r1, #256
	ldr	r3, .L4+12
	mov	r0, r1
	mov	lr, pc
	bx	r3
	mov	r0, #112
	mov	r1, #232
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	mov	r1, #4
	ldr	r2, .L4+20
	ldr	r3, .L4+24
	str	r1, [r2, #4]
	ldr	r4, .L4+28
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r0, #40
	mov	lr, pc
	bx	r4
	mov	r1, #144
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r1, #10
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r1, #100
	mov	r0, r1
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	100698112
	.word	pathwayMap
	.word	DMANow
	.word	setMapDimensions
	.word	setPlayerPos
	.word	enemy_manager
	.word	initEnemies
	.word	m_setBallerPos
	.size	init_lvl3_room1, .-init_lvl3_room1
	.align	2
	.global	draw_lvl3_room1
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw_lvl3_room1, %function
draw_lvl3_room1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #1024
	ldr	r4, .L8
	mov	r0, #3
	ldr	r2, .L8+4
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	100698112
	.word	pathwayMap
	.size	draw_lvl3_room1, .-draw_lvl3_room1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
