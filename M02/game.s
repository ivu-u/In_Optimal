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
	.file	"game.c"
	.text
	.align	2
	.global	setMapDimensions
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setMapDimensions, %function
setMapDimensions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L3
	ldr	r3, .L3+4
	str	r0, [r2]
	str	r1, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	MapWidth
	.word	MapHeight
	.size	setMapDimensions, .-setMapDimensions
	.align	2
	.global	drawMaps
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMaps, %function
drawMaps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L7
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L7+4
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L7+8
	ldr	r1, .L7+12
	mov	lr, pc
	bx	r4
	mov	r3, #6912
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L7+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L7+20
	ldr	r1, .L7+24
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L7+28
	ldr	r1, .L7+32
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L7+36
	ldr	r1, .L7+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	DMANow
	.word	gametilesetPal
	.word	100679680
	.word	gametilesetTiles
	.word	redBGTiles
	.word	100696064
	.word	redBGMap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.size	drawMaps, .-drawMaps
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L11
	mov	lr, pc
	bx	r3
	bl	drawMaps
	ldr	r3, .L11+4
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L11+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L11+12
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L11+16
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L11+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	hideSprites
	.word	initLevelManager
	.word	enterLevel
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.word	initPlayer
	.word	initCamera
	.word	initGui
	.word	initEnemies
	.size	initGame, .-initGame
	.align	2
	.global	resumeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeGame, %function
resumeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawMaps
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	ldr	r4, .L15+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L15+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L15+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	drawLevelMaps
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.size	resumeGame, .-resumeGame
	.global	__aeabi_fadd
	.global	__aeabi_fcmpge
	.global	__aeabi_fsub
	.align	2
	.global	drawMovingBG
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMovingBG, %function
drawMovingBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L25
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, [r3]	@ float
	ldr	r6, .L25+4
	ldr	r5, .L25+8
	ldr	r1, [r6]	@ float
	mov	r0, r7
	mov	lr, pc
	bx	r5
	mov	r4, r0
	ldr	r1, [r6, #4]	@ float
	mov	r0, r7
	str	r4, [r6]	@ float
	mov	lr, pc
	bx	r5
	mov	r7, r0
	mov	r1, #1065353216
	mov	r0, r4
	ldr	r8, .L25+12
	str	r7, [r6, #4]	@ float
	mov	lr, pc
	bx	r8
	ldr	r3, .L25+16
	cmp	r0, #0
	ldr	r5, [r3]
	beq	.L18
	add	r5, r5, #1
	str	r5, [r3]
	mov	r0, r4
	mov	r1, #1065353216
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	str	r0, [r6]	@ float
.L18:
	mov	r1, #1065353216
	mov	r0, r7
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldr	r4, [r6, #8]
	beq	.L20
	add	r4, r4, #1
	mov	r0, r7
	mov	r1, #1065353216
	ldr	r3, .L25+20
	str	r4, [r6, #8]
	mov	lr, pc
	bx	r3
	str	r0, [r6, #4]	@ float
.L20:
	mov	r1, #67108864
	lsl	r2, r5, #16
	lsl	r3, r4, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r1, #16]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r3, [r1, #18]	@ movhi
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	__aeabi_fadd
	.word	__aeabi_fcmpge
	.word	hOff_scroll
	.word	__aeabi_fsub
	.size	drawMovingBG, .-drawMovingBG
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L28
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L33
.L28:
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L34+24
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L34+28
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+32
	mov	lr, pc
	bx	r3
	bl	drawMovingBG
	ldr	r3, .L34+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L33:
	mov	r0, #2
	ldr	r3, .L34+40
	mov	lr, pc
	bx	r3
	b	.L28
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	runLevel
	.word	updatePlayer
	.word	updateCamera
	.word	updateEnemies
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.word	drawGui
	.word	enterState
	.size	updateGame, .-updateGame
	.global	scrollSpeed
	.global	vOffsetAccumulator
	.global	hOffsetAccumulator
	.global	vOff_scroll
	.comm	hOff_scroll,4,4
	.comm	MapHeight,4,4
	.comm	MapWidth,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	scrollSpeed, %object
	.size	scrollSpeed, 4
scrollSpeed:
	.word	1034147594
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	hOffsetAccumulator, %object
	.size	hOffsetAccumulator, 4
hOffsetAccumulator:
	.space	4
	.type	vOffsetAccumulator, %object
	.size	vOffsetAccumulator, 4
vOffsetAccumulator:
	.space	4
	.type	vOff_scroll, %object
	.size	vOff_scroll, 4
vOff_scroll:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
