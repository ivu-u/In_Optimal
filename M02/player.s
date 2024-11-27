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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	push	{r4, lr}
	mov	r1, #0
	mov	lr, #15
	mov	r2, #3
	mov	ip, #20
	ldr	r3, .L4
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	ldr	r0, .L4+4
	str	lr, [r3, #20]
	str	ip, [r3, #16]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	mov	lr, pc
	bx	r0
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	initPlayerAnim
	.word	initBulletManager
	.size	initPlayer, .-initPlayer
	.align	2
	.global	setPlayerPos
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPlayerPos, %function
setPlayerPos:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L7
	stm	r3, {r0, r1}
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.size	setPlayerPos, .-setPlayerPos
	.align	2
	.global	playerMovement
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerMovement, %function
playerMovement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L50
	ldr	r3, .L50+4
	ldrh	r1, [r2]
	ldr	ip, [r3]
	lsr	r2, r1, #5
	eor	r2, r2, #1
	cmp	ip, #0
	movle	r2, #0
	andgt	r2, r2, #1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r0, [r3, #20]
	ldr	r5, [r3, #4]
	ldr	r6, [r3, #16]
	cmp	r2, #0
	add	lr, ip, r0
	add	r2, r6, r5
	sub	lr, lr, #1
	sub	r4, r2, #1
	bne	.L47
.L11:
	tst	r1, #16
	bne	.L14
	ldr	r7, .L50+8
	ldr	r8, [r3]
	ldr	r2, [r7]
	add	r0, r0, r8
	cmp	r0, r2
	ble	.L48
.L14:
	lsr	r2, r1, #6
	eor	r2, r2, #1
	cmp	r5, #0
	movle	r2, #0
	andgt	r2, r2, #1
	cmp	r2, #0
	bne	.L49
.L17:
	tst	r1, #128
	bne	.L9
	ldr	r1, .L50+12
	ldr	r5, [r3, #4]
	ldr	r0, [r1]
	add	r1, r6, r5
	cmp	r1, r0
	bgt	.L9
	mov	r7, #1
	ldr	r2, .L50+8
	ldr	r6, [r3, #12]
	ldr	r2, [r2]
	add	r1, r6, r4
	mul	r1, r2, r1
	ldr	r0, .L50+16
	add	r2, ip, r1
	ldrb	r2, [r2, r0]	@ zero_extendqisi2
	cmp	r2, #0
	str	r7, [r3, #28]
	beq	.L9
	add	r1, lr, r1
	ldrb	r2, [r1, r0]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r2, r5, r6
	strne	r2, [r3, #4]
.L9:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L48:
	mov	r10, #3
	ldr	r9, [r3, #8]
	add	r7, r9, lr
	mla	fp, r5, r2, r7
	ldr	r0, .L50+16
	ldrb	fp, [fp, r0]	@ zero_extendqisi2
	cmp	fp, #0
	str	r10, [r3, #28]
	beq	.L14
	mla	r2, r4, r2, r7
	ldrb	r2, [r2, r0]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r2, r8, r9
	strne	r2, [r3]
	b	.L14
.L49:
	mov	r7, #0
	ldr	r2, .L50+8
	ldr	r0, [r3, #12]
	ldr	r2, [r2]
	sub	r5, r5, r0
	mul	r2, r5, r2
	ldr	r0, .L50+16
	add	r8, ip, r2
	ldrb	r8, [r8, r0]	@ zero_extendqisi2
	cmp	r8, r7
	str	r7, [r3, #28]
	beq	.L17
	add	r2, lr, r2
	ldrb	r2, [r2, r0]	@ zero_extendqisi2
	cmp	r2, r7
	strne	r5, [r3, #4]
	b	.L17
.L47:
	mov	r9, #2
	ldr	r7, .L50+8
	ldr	r2, [r3, #8]
	ldr	r7, [r7]
	sub	r2, ip, r2
	mla	r10, r7, r5, r2
	ldr	r8, .L50+16
	ldrb	r10, [r10, r8]	@ zero_extendqisi2
	cmp	r10, #0
	str	r9, [r3, #28]
	beq	.L11
	mla	r7, r4, r7, r2
	ldrb	r7, [r7, r8]	@ zero_extendqisi2
	cmp	r7, #0
	strne	r2, [r3]
	b	.L11
.L51:
	.align	2
.L50:
	.word	buttons
	.word	player
	.word	MapWidth
	.word	MapHeight
	.word	pathwayBitmapBitmap
	.size	playerMovement, .-playerMovement
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	playerMovement
	ldr	r3, .L59
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L53
	ldr	r3, .L59+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L58
.L53:
	ldr	r3, .L59+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L58:
	ldr	r3, .L59+16
	mov	lr, pc
	bx	r3
	b	.L53
.L60:
	.align	2
.L59:
	.word	oldButtons
	.word	buttons
	.word	drawPlayer
	.word	updateBullets
	.word	spawnBullet
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	playerSkills
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerSkills, %function
playerSkills:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L70
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L70+4
	ldrh	r3, [r3]
	tst	r3, #1
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L70+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	oldButtons
	.word	buttons
	.word	spawnBullet
	.size	playerSkills, .-playerSkills
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"dmg\000"
	.text
	.align	2
	.global	playerTakeDamage
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerTakeDamage, %function
playerTakeDamage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, r0
	push	{r4, lr}
	ldr	r4, .L76
	ldr	r3, [r4, #32]
	ldr	r0, .L76+4
	sub	r3, r3, r2
	ldr	r2, .L76+8
	str	r3, [r4, #32]
	mov	lr, pc
	bx	r2
	ldr	r3, [r4, #32]
	cmp	r3, #0
	ble	.L75
	pop	{r4, lr}
	bx	lr
.L75:
	ldr	r3, .L76+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	player
	.word	.LC0
	.word	mgba_printf
	.word	gameOver
	.size	playerTakeDamage, .-playerTakeDamage
	.comm	player,40,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
