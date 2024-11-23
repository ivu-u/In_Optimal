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
	.file	"level1.c"
	.text
	.align	2
	.global	update_lvl1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	update_lvl1, %function
update_lvl1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	update_lvl1, .-update_lvl1
	.align	2
	.global	drawMaps_lvl1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMaps_lvl1, %function
drawMaps_lvl1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L9
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bxne	lr
	push	{r4, lr}
	mov	r3, #1024
	ldr	r4, .L9+4
	mov	r0, #3
	ldr	r2, .L9+8
	ldr	r1, .L9+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	currRoom
	.word	DMANow
	.word	100698112
	.word	greenTestMap
	.size	drawMaps_lvl1, .-drawMaps_lvl1
	.align	2
	.global	init_lvl1_room1
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_lvl1_room1, %function
init_lvl1_room1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L13
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L13+4
	ldr	r4, .L13+8
	mov	lr, pc
	bx	r4
	mov	r1, #256
	ldr	r3, .L13+12
	mov	r0, r1
	mov	lr, pc
	bx	r3
	mov	r1, #112
	ldr	r3, .L13+16
	mov	r0, r1
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r1, #120
	mov	r0, r2
	ldr	r3, .L13+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	100698112
	.word	greenTestMap
	.word	DMANow
	.word	setMapDimensions
	.word	setPlayerPos
	.word	setArrowPos
	.size	init_lvl1_room1, .-init_lvl1_room1
	.align	2
	.global	initLevel1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLevel1, %function
initLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #0
	ldr	ip, .L17
	ldr	r4, .L17+4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L17+8
	ldr	r1, .L17+12
	strb	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L17+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	init_lvl1_room1
.L18:
	.align	2
.L17:
	.word	currRoom
	.word	DMANow
	.word	100679680
	.word	lvl1_tilesetTiles
	.word	lvl1_tilesetPal
	.size	initLevel1, .-initLevel1
	.align	2
	.global	draw_lvl1_room1
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw_lvl1_room1, %function
draw_lvl1_room1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #1024
	ldr	r4, .L21
	mov	r0, #3
	ldr	r2, .L21+4
	ldr	r1, .L21+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	DMANow
	.word	100698112
	.word	greenTestMap
	.size	draw_lvl1_room1, .-draw_lvl1_room1
	.align	2
	.global	room1
	.syntax unified
	.arm
	.fpu softvfp
	.type	room1, %function
room1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	room1, .-room1
	.align	2
	.global	room2
	.syntax unified
	.arm
	.fpu softvfp
	.type	room2, %function
room2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	room2, .-room2
	.align	2
	.global	winLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	winLevel, %function
winLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	winLevel, .-winLevel
	.comm	currRoom,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
