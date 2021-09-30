;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module unrle
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _unrle
	.globl _unrle_adv
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
;./utils/unrle.c:13: void unrle_adv (void) {
;	---------------------------------
; Function unrle_adv
; ---------------------------------
_unrle_adv::
;./utils/unrle.c:14: VDPDataPort = rdb;
	ld	a,(#_rdb + 0)
	out	(_VDPDataPort),a
;./utils/unrle.c:15: rds16 ++;
	ld	iy,#_rds16
	inc	0 (iy)
	ret	NZ
	inc	1 (iy)
	ret
;./utils/unrle.c:18: void unrle (void) {
;	---------------------------------
; Function unrle
; ---------------------------------
_unrle::
;./utils/unrle.c:19: VDPControlPort = LO (PNTADDRESS); VDPControlPort = HI (PNTADDRESS) | 0x40;
	ld	a,#0x00
	out	(_VDPControlPort),a
	ld	a,#0x58
	out	(_VDPControlPort),a
;./utils/unrle.c:21: rdc = *gp_gen ++; 	// run code
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdc + 0),a
	ld	iy,#_gp_gen
	inc	0 (iy)
	jr	NZ,00134$
	inc	1 (iy)
00134$:
;./utils/unrle.c:22: rds16 = 0; while (rds16 < 768) {
	ld	hl,#0x0000
	ld	(_rds16),hl
00109$:
	ld	a,(#_rds16 + 1)
	xor	a, #0x80
	sub	a, #0x83
	ret	NC
;./utils/unrle.c:23: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	iy,#_gp_gen
	inc	0 (iy)
	jr	NZ,00135$
	inc	1 (iy)
00135$:
;./utils/unrle.c:24: if (rda == rdc) {
	ld	a,(#_rda + 0)
	ld	iy,#_rdc
	sub	a, 0 (iy)
	jr	NZ,00107$
;./utils/unrle.c:25: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	iy,#_gp_gen
	inc	0 (iy)
	jr	NZ,00138$
	inc	1 (iy)
00138$:
;./utils/unrle.c:26: if (rda == 0) break;
	ld	a,(#_rda + 0)
	or	a, a
	ret	Z
;./utils/unrle.c:27: while (rda --) unrle_adv ();
00103$:
	ld	iy,#_rda
	ld	c,0 (iy)
	dec	0 (iy)
	ld	a,c
	or	a, a
	jr	Z,00109$
	call	_unrle_adv
	jr	00103$
00107$:
;./utils/unrle.c:29: rdb = rda;
	ld	a,(#_rda + 0)
	ld	(#_rdb + 0),a
;./utils/unrle.c:30: unrle_adv ();
	call	_unrle_adv
	jr	00109$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
