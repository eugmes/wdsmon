
; xbus area
LEDS	=	$7f00
; Leds are turned on by accessing various expansion areas
LED0	=	$00
LED1	=	$20
LED2	=	$40
LED3	=	$60

	.segment "STARTUP"
	sei
	cld
	ldx	#$FF
	txs
	jmp	main

	.code
.proc	main: near
@loop:
	ldx	#LED0
	jsr	show_led
	ldx	#LED1
	jsr	show_led
	ldx	#LED2
	jsr	show_led
	ldx	#LED3
	jsr	show_led
	bra	@loop
.endproc

.proc	show_led: near
	lda	#255
@loop1:	xba
	lda	#255
@loop2:	sta	LEDS, X
	dec	a
	bne	@loop2
	xba
	dec	a
	bne	@loop1
	rts
.endproc
