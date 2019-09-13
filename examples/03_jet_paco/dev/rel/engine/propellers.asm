;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Tue Sep 10 14:20:23 2019
;--------------------------------------------------------
	.module propellers
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ul_putc
	.globl _propellers_add
	.globl _propellers_do
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
;./engine/propellers.c:25: void propellers_add (void) {
;	---------------------------------
; Function propellers_add
; ---------------------------------
_propellers_add::
;./engine/propellers.c:27: prp_yx [prp_idx ++] = rdm;
	ld	hl,#_prp_idx + 0
	ld	e, (hl)
	ld	hl, #_prp_idx+0
	inc	(hl)
	ld	hl,#_prp_yx
	ld	d,#0x00
	add	hl, de
	ld	a,(#_rdm + 0)
	ld	(hl),a
	ret
;./engine/propellers.c:30: void propellers_do (void) {
;	---------------------------------
; Function propellers_do
; ---------------------------------
_propellers_do::
;./engine/propellers.c:31: rdb = half_life << 1;
	ld	a,(#_half_life + 0)
	add	a, a
	ld	(#_rdb + 0),a
;./engine/propellers.c:32: gpit = prp_idx; while (gpit --) {
	ld	a,(#_prp_idx + 0)
	ld	(#_gpit + 0),a
00101$:
	ld	hl,#_gpit + 0
	ld	d, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,d
	or	a, a
	ret	Z
;./engine/propellers.c:33: rda = prp_yx [gpit];
	ld	a,#<(_prp_yx)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_prp_yx)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
;./engine/propellers.c:35: ((rda & 0xf) << 1) | 
	ld	(#_rda + 0),a
	and	a, #0x0F
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ex	de,hl
;./engine/propellers.c:36: ((((rda >> 3) & 0xfe) + TOP_ADJUST) << 5)
	ld	a,(#_rda + 0)
	rrca
	rrca
	rrca
	and	a,#0x1F
	and	a, #0xFE
	ld	l,a
	ld	h,#0x00
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,e
	or	a, l
	ld	e,a
	ld	a,d
	or	a, h
	ld	d,a
	ld	hl,#0x1800
	add	hl,de
	ld	(_gp_addr),hl
;./engine/propellers.c:38: _n = rdb + PROPELLERS_BASE_PATTERN; ul_putc ();
	ld	hl,#__n
	ld	a,(#_rdb + 0)
	add	a, #0x3C
	ld	(hl),a
	call	_ul_putc
;./engine/propellers.c:39: ++ _n; ul_putc ();
	ld	hl, #__n+0
	inc	(hl)
	call	_ul_putc
	jr	00101$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
