;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 15:05:51 2019
;--------------------------------------------------------
	.module unpacker
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _unpack_bg_patterns
	.globl _aPLib_depack_VRAM
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_VDPControlPort	=	0x00bf
_VDPStatusPort	=	0x00bf
_VDPDataPort	=	0x00be
_VDPVCounterPort	=	0x007e
_VDPHCounterPort	=	0x007f
_IOPortL	=	0x00dc
_IOPortH	=	0x00dd
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
;./utils/unpacker.c:16: void unpack_bg_patterns (const unsigned char *c_pgt, const unsigned char *c_cgt, unsigned int byte_offset, unsigned char banks_flag) {
;	---------------------------------
; Function unpack_bg_patterns
; ---------------------------------
_unpack_bg_patterns::
	push	ix
	ld	ix,#0
	add	ix,sp
;./utils/unpacker.c:18: aPLib_depack_VRAM (PGT_BASE + PATTERN_DATA_BANK_A + byte_offset, c_pgt);
	ld	l,4 (ix)
	ld	h,5 (ix)
;./utils/unpacker.c:19: aPLib_depack_VRAM (CGT_BASE + PATTERN_DATA_BANK_A + byte_offset, c_cgt);
	ld	e,6 (ix)
	ld	d,7 (ix)
;./utils/unpacker.c:17: if (banks_flag & 1) {
	bit	0, 10 (ix)
	jr	Z,00102$
;./utils/unpacker.c:18: aPLib_depack_VRAM (PGT_BASE + PATTERN_DATA_BANK_A + byte_offset, c_pgt);
	push	hl
	push	de
	push	hl
	ld	c,8 (ix)
	ld	b,9 (ix)
	push	bc
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
	pop	de
	pop	hl
;./utils/unpacker.c:19: aPLib_depack_VRAM (CGT_BASE + PATTERN_DATA_BANK_A + byte_offset, c_cgt);
	ld	a,8 (ix)
	add	a, #0x00
	ld	c,a
	ld	a,9 (ix)
	adc	a, #0x20
	ld	b,a
	push	hl
	push	de
	push	de
	push	bc
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
	pop	de
	pop	hl
00102$:
;./utils/unpacker.c:21: if (banks_flag & 2) {
	bit	1, 10 (ix)
	jr	Z,00104$
;./utils/unpacker.c:22: aPLib_depack_VRAM (PGT_BASE + PATTERN_DATA_BANK_B + byte_offset, c_pgt);
	ld	a,8 (ix)
	add	a, #0x00
	ld	c,a
	ld	a,9 (ix)
	adc	a, #0x08
	ld	b,a
	push	hl
	push	de
	push	hl
	push	bc
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
	pop	de
	pop	hl
;./utils/unpacker.c:23: aPLib_depack_VRAM (CGT_BASE + PATTERN_DATA_BANK_B + byte_offset, c_cgt);
	ld	a,8 (ix)
	add	a, #0x00
	ld	c,a
	ld	a,9 (ix)
	adc	a, #0x28
	ld	b,a
	push	hl
	push	de
	push	de
	push	bc
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
	pop	de
	pop	hl
00104$:
;./utils/unpacker.c:25: if (banks_flag & 4) {
	bit	2, 10 (ix)
	jr	Z,00107$
;./utils/unpacker.c:26: aPLib_depack_VRAM (CGT_BASE + PATTERN_DATA_BANK_C + byte_offset, c_cgt);
	ld	a,8 (ix)
	add	a, #0x00
	ld	c,a
	ld	a,9 (ix)
	adc	a, #0x30
	ld	b,a
	push	hl
	push	de
	push	bc
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
	pop	hl
;./utils/unpacker.c:27: aPLib_depack_VRAM (PGT_BASE + PATTERN_DATA_BANK_C + byte_offset, c_pgt);
	ld	a,8 (ix)
	add	a, #0x00
	ld	e,a
	ld	a,9 (ix)
	adc	a, #0x10
	ld	d,a
	push	hl
	push	de
	call	_aPLib_depack_VRAM
	pop	af
	pop	af
00107$:
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
