;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module memfill
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memfill
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
;./utils/memfill.c:8: void memfill (void *ptr, unsigned char value, unsigned int length) {
;	---------------------------------
; Function memfill
; ---------------------------------
_memfill::
;./utils/memfill.c:9: if (length) {
	ld	hl, #5+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	ret	Z
;./utils/memfill.c:28: __endasm;
	ld	hl, #2
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl) ; DE = *ptr
	inc	hl
	ld	a, (hl) ; A = value
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl) ; BC = length
	ld	h, d
	ld	l, e
	inc	de
	ld	(hl), a
	ldir
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
