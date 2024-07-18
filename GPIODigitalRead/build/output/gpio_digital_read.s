	.file	"gpio_digital_read.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	ldi r24,lo8(36)
	ldi r25,0
	ldi r18,lo8(36)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(32)
	movw r30,r24
	st Z,r18
	ldi r24,lo8(42)
	ldi r25,0
	ldi r18,lo8(42)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	andi r18,lo8(127)
	movw r30,r24
	st Z,r18
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(37)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	andi r18,lo8(-33)
	movw r30,r24
	st Z,r18
.L4:
	ldi r24,lo8(41)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	tst r24
	brge .L2
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(37)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(32)
	movw r30,r24
	st Z,r18
	rjmp .L4
.L2:
	ldi r24,lo8(41)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	mov r24,r24
	ldi r25,0
	andi r24,223
	or r24,r25
	breq .L4
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(37)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	andi r18,lo8(-33)
	movw r30,r24
	st Z,r18
	rjmp .L4
	.size	main, .-main
	.ident	"GCC: (GNU) 5.4.0"
