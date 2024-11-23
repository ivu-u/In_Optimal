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
	.file	"bulletManager.c"
	.text
	.align	2
	.global	initBulletManager
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBulletManager, %function
initBulletManager:
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
	.word	initQuickBullets
	.size	initBulletManager, .-initBulletManager
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L18
	add	r6, r4, #2192
	ldr	r8, .L18+4
	ldr	r7, .L18+8
	ldr	r5, .L18+12
	add	r6, r6, #8
	b	.L14
.L9:
	ldr	r3, [r4, #8]
	cmn	r3, #10
	blt	.L10
	ldr	r2, [r7]
	add	r2, r2, #10
	cmp	r3, r2
	ble	.L11
.L10:
	mov	r3, #0
	str	r3, [r4]
.L11:
	ldr	r3, [r4, #12]
	cmn	r3, #10
	blt	.L12
	ldr	r2, [r8]
	add	r2, r2, #10
	cmp	r3, r2
	ble	.L8
.L12:
	mov	r3, #0
	str	r3, [r4]
.L8:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L17
.L14:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L8
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bne	.L9
	mov	r0, r4
	mov	lr, pc
	bx	r5
	b	.L9
.L17:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	bullets
	.word	MapHeight
	.word	MapWidth
	.word	updateQuickBullets
	.size	updateBullets, .-updateBullets
	.align	2
	.global	checkRemoveBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkRemoveBullet, %function
checkRemoveBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	cmn	r3, #10
	blt	.L21
	ldr	r2, .L25
	ldr	r2, [r2]
	add	r2, r2, #10
	cmp	r3, r2
	bgt	.L21
.L22:
	ldr	r3, [r0, #12]
	cmn	r3, #10
	blt	.L23
	ldr	r2, .L25+4
	ldr	r2, [r2]
	add	r2, r2, #10
	cmp	r3, r2
	bxle	lr
.L23:
	mov	r3, #0
	str	r3, [r0]
	bx	lr
.L21:
	mov	r3, #0
	str	r3, [r0]
	b	.L22
.L26:
	.align	2
.L25:
	.word	MapWidth
	.word	MapHeight
	.size	checkRemoveBullet, .-checkRemoveBullet
	.align	2
	.global	spawnBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnBullet, %function
spawnBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	ldr	r3, [r3, #36]
	cmp	r3, #0
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L33+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	player
	.word	spawnQuickBullet
	.size	spawnBullet, .-spawnBullet
	.global	currNumBulls
	.comm	bullets,2200,4
	.bss
	.align	2
	.type	currNumBulls, %object
	.size	currNumBulls, 4
currNumBulls:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
