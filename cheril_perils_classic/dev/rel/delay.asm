;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Thu Oct 25 10:16:53 2018
;--------------------------------------------------------
	.module delay
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delay
	.globl _SG_waitForVBlank
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;utils/delay.c:8: void delay (unsigned char frames) {
;	---------------------------------
; Function delay
; ---------------------------------
_delay::
;utils/delay.c:9: while (frames --) SG_waitForVBlank ();
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
00101$:
	ld	e,d
	dec	d
	ld	a,e
	or	a, a
	ret	Z
	push	de
	call	_SG_waitForVBlank
	pop	de
	jr	00101$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
