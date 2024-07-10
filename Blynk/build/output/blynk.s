	.file	"blynk.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	__vector_11
	.type	__vector_11, @function
__vector_11:
	push r1
	push r0
	lds r0,95
	push r0
	clr __zero_reg__
	push r18
	push r19
	push r24
	push r25
	push r30
	push r31
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 11 */
.L__stack_usage = 11
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(37)
	ldi r19,0
	movw r30,r18
	ld r19,Z
	ldi r18,lo8(32)
	eor r18,r19
	movw r30,r24
	st Z,r18
	ldi r24,lo8(54)
	ldi r25,0
	ldi r18,lo8(54)
	ldi r19,0
	movw r30,r18
	ld r19,Z
	ldi r18,lo8(2)
	eor r18,r19
	movw r30,r24
	st Z,r18
	nop
/* epilogue start */
	pop r29
	pop r28
	pop r31
	pop r30
	pop r25
	pop r24
	pop r19
	pop r18
	pop r0
	sts 95,r0
	pop r0
	pop r1
	reti
	.size	__vector_11, .-__vector_11
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
	ldi r24,lo8(-124)
	ldi r25,0
	movw r30,r24
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	ldi r24,lo8(-128)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	ldi r24,lo8(-127)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	ldi r24,lo8(-120)
	ldi r25,0
	ldi r18,lo8(8)
	movw r30,r24
	st Z,r18
	ldi r24,lo8(-119)
	ldi r25,0
	ldi r18,lo8(61)
	movw r30,r24
	st Z,r18
	ldi r24,lo8(54)
	ldi r25,0
	ldi r18,lo8(54)
	ldi r19,0
	movw r30,r18
	ld r19,Z
	ldi r18,lo8(2)
	eor r18,r19
	movw r30,r24
	st Z,r18
	ldi r24,lo8(-127)
	ldi r25,0
	ldi r18,lo8(-127)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(4)
	movw r30,r24
	st Z,r18
	ldi r24,lo8(36)
	ldi r25,0
	ldi r18,lo8(36)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(32)
	movw r30,r24
	st Z,r18
/* #APP */
 ;  98 "build/blynk.c" 1
	cli
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(111)
	ldi r25,0
	ldi r18,lo8(2)
	movw r30,r24
	st Z,r18
/* #APP */
 ;  102 "build/blynk.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(37)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(32)
	movw r30,r24
	st Z,r18
.L3:
	rjmp .L3
	.size	main, .-main
	.ident	"GCC: (GNU) 5.4.0"
