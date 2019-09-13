;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Fri Sep 13 13:00:04 2019
;--------------------------------------------------------
	.module breakable
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _breakable_break
	.globl _breakable_do_anim
	.globl _map_set
	.globl _PSGSFXPlay
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
;./engine/breakable.c:30: void breakable_do_anim (void) {
;	---------------------------------
; Function breakable_do_anim
; ---------------------------------
_breakable_do_anim::
;./engine/breakable.c:31: do_process_breakable = 0;
	ld	hl,#_do_process_breakable + 0
	ld	(hl), #0x00
;./engine/breakable.c:32: gpit = BREAKABLE_MAX; while (gpit --) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x04
	ld	bc,#_brkx+0
00106$:
	ld	hl,#_gpit + 0
	ld	e, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,e
	or	a, a
	ret	Z
;./engine/breakable.c:33: if (brkf [gpit]) {
	ld	a,#<(_brkf)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_brkf)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	or	a, a
	jr	Z,00106$
;./engine/breakable.c:34: ++ brkf [gpit];
	inc	a
	ld	(de),a
;./engine/breakable.c:35: if (brkf [gpit] == BREAKABLE_MAX_FRAMES) {
	ld	a,#<(_brkf)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_brkf)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	sub	a, #0x08
	jr	NZ,00102$
;./engine/breakable.c:36: brkf [gpit] = 0;
	xor	a, a
	ld	(de),a
;./engine/breakable.c:37: _x = brkx [gpit]; _y = brky [gpit]; _t = BREAKABLE_ERASE;
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	(#__x + 0),a
	ld	a,#<(_brky)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_brky)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__y + 0),a
	ld	hl,#__t + 0
	ld	(hl), #0x1A
;./engine/breakable.c:38: map_set ();
	push	bc
	call	_map_set
	pop	bc
	jr	00106$
00102$:
;./engine/breakable.c:40: do_process_breakable = 1;
	ld	hl,#_do_process_breakable + 0
	ld	(hl), #0x01
	jr	00106$
;./engine/breakable.c:47: void breakable_break (unsigned char x, unsigned char y) {
;	---------------------------------
; Function breakable_break
; ---------------------------------
_breakable_break::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;./engine/breakable.c:49: gp_addr = BREAKABLE_VRAM_ADDR + COORDS (x, y);
	ld	l,5 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, 4 (ix)
	ld	b, #0x00
	or	a, l
	ld	e,a
	ld	a,b
	or	a, h
	ld	d,a
	ld	hl,#0x1F40
	add	hl,de
	ld	(_gp_addr),hl
;./engine/breakable.c:50: DISABLE_INTERRUPTS;
	di 
;./engine/breakable.c:51: VDPControlPort = LO (gp_addr);
	ld	hl,#_gp_addr + 0
	ld	h, (hl)
	ld	-1 (ix), h
	ld	a, h
	out	(_VDPControlPort),a
;./engine/breakable.c:52: VDPControlPort = HI (gp_addr);	// Set up for reading. Note there's no | 0x40!
	ld	a,(#_gp_addr + 1)
	ld	-3 (ix),a
	ld	-2 (ix),#0x00
	ld	a,-3 (ix)
	out	(_VDPControlPort),a
;./engine/breakable.c:53: rda = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#_rda + 0),a
;./engine/breakable.c:54: ENABLE_INTERRUPTS;
	ei 
;./engine/breakable.c:56: if (rda < BREAKABLE_LIFE) {
	ld	a,(#_rda + 0)
	sub	a, #0x02
	jr	NC,00107$
;./engine/breakable.c:57: ++ rda;
	ld	hl, #_rda+0
	inc	(hl)
;./engine/breakable.c:58: DISABLE_INTERRUPTS;
	di 
;./engine/breakable.c:59: VDPControlPort = LO (gp_addr);
	ld	a,-1 (ix)
	out	(_VDPControlPort),a
;./engine/breakable.c:60: VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,-3 (ix)
	set	6, a
	out	(_VDPControlPort),a
;./engine/breakable.c:61: VDPDataPort = rda;
	ld	a,(#_rda + 0)
	out	(_VDPDataPort),a
;./engine/breakable.c:62: ENABLE_INTERRUPTS;
	ei 
	jp	00109$
00107$:
;./engine/breakable.c:66: PSGSFXPlay (SFX_BREAKH, 2);
	ld	de,#_s_13_breakh3_psg
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./engine/breakable.c:69: gpit = BREAKABLE_MAX; while (gpit --) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x04
00103$:
	ld	a,(#_gpit + 0)
	ld	-3 (ix),a
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00109$
;./engine/breakable.c:70: if (!brkf [gpit]) {
	ld	a,#<(_brkf)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-3 (ix),a
	ld	a,#>(_brkf)
	adc	a, #0x00
	ld	-2 (ix),a
	pop	hl
	push	hl
	ld	a,(hl)
	ld	-1 (ix), a
	or	a, a
	jr	NZ,00103$
;./engine/breakable.c:71: do_process_breakable = 1;
	ld	hl,#_do_process_breakable + 0
	ld	(hl), #0x01
;./engine/breakable.c:72: brkf [gpit] = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;./engine/breakable.c:73: _x = brkx [gpit] = x;
	ld	de,#_brkx+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,4 (ix)
	ld	(hl),a
	ld	a,4 (ix)
	ld	(#__x + 0),a
;./engine/breakable.c:74: _y = brky [gpit] = y;
	ld	de,#_brky+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,5 (ix)
	ld	(hl),a
	ld	a,5 (ix)
	ld	(#__y + 0),a
;./engine/breakable.c:75: _t = BREAKABLE_BREAKING;
	ld	hl,#__t + 0
	ld	(hl), #0x1C
;./engine/breakable.c:76: map_set ();					// Break tile!
	call	_map_set
;./engine/breakable.c:77: PSGSFXPlay (SFX_BREAKB, 2);
	ld	de,#_s_17_breakb3_psg
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./engine/breakable.c:78: break;						// HA HA HA
00109$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
