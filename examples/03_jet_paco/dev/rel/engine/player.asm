;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Tue Nov 13 17:35:21 2018
;--------------------------------------------------------
	.module player
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _player_move
	.globl _player_kill
	.globl _player_to_pixels
	.globl _player_render
	.globl _player_init
	.globl _player_stop
	.globl _update_cycle
	.globl _cm_two_points
	.globl _PSGSFXPlay
	.globl _SG_setStp
	.globl _SG_addMetaSprite1x1
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
;engine/player.c:33: void player_stop (void) {
;	---------------------------------
; Function player_stop
; ---------------------------------
_player_stop::
;engine/player.c:34: pvx = pvy = 0;
	ld	hl,#0x0000
	ld	(_pvy),hl
	ld	l, #0x00
	ld	(_pvx),hl
	ret
;engine/player.c:37: void player_init (void) {
;	---------------------------------
; Function player_init
; ---------------------------------
_player_init::
;engine/player.c:40: if (!warp_to_level) player_stop ();
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00102$
	call	_player_stop
00102$:
;engine/player.c:45: pfacing = 0;
	ld	hl,#_pfacing + 0
	ld	(hl), #0x00
;engine/player.c:48: pfr = pctfr = 0;
	ld	hl,#_pctfr + 0
	ld	(hl), #0x00
	ld	hl,#_pfr + 0
	ld	(hl), #0x00
;engine/player.c:49: pj = pctj = 0;
	ld	hl,#_pctj + 0
	ld	(hl), #0x00
	ld	hl,#_pj + 0
	ld	(hl), #0x00
;engine/player.c:50: psprid = 0;
	ld	hl,#_psprid + 0
	ld	(hl), #0x00
;engine/player.c:53: pobjs = 0;
	ld	hl,#_pobjs + 0
	ld	(hl), #0x00
;engine/player.c:60: pgotten = 0;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x00
;engine/player.c:61: pfiring = 0;
	ld	hl,#_pfiring + 0
	ld	(hl), #0x00
;engine/player.c:64: pkilled = 0;
	ld	hl,#_pkilled + 0
	ld	(hl), #0x00
;engine/player.c:80: pflickering = pbouncing = 0;
	ld	hl,#_pbouncing + 0
	ld	(hl), #0x00
	ld	hl,#_pflickering + 0
	ld	(hl), #0x00
;engine/player.c:95: vertical_engine_type = ENGINE_TYPE_JET_PAC;
	ld	hl,#_vertical_engine_type + 0
	ld	(hl), #0x01
	ret
;engine/player.c:112: void player_render (void) {
;	---------------------------------
; Function player_render
; ---------------------------------
_player_render::
;engine/player.c:113: if (0 == pflickering || half_life) 
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	Z,00101$
	ld	a,(#_half_life + 0)
	or	a, a
	ret	Z
00101$:
;engine/player.c:116: spr_player [psprid]
	ld	de,#_spr_player+0
	ld	iy,#_psprid
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;engine/player.c:115: prx - 4, pry + SPRITE_ADJUST, 
	ld	a,(#_pry + 0)
	add	a, #0xF7
	ld	b,a
	ld	a,(#_prx + 0)
	add	a,#0xFC
	ld	c,a
	push	de
	push	bc
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
	ret
;engine/player.c:120: void player_to_pixels (void) {
;	---------------------------------
; Function player_to_pixels
; ---------------------------------
_player_to_pixels::
;engine/player.c:121: prx = px >> FIXBITS;
	ld	hl,(_px)
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_prx
	ld	0 (iy),l
;engine/player.c:122: pry = py >> FIXBITS;
	ld	hl,(_py)
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_pry
	ld	0 (iy),l
	ret
;engine/player.c:125: void player_kill (void) {
;	---------------------------------
; Function player_kill
; ---------------------------------
_player_kill::
;engine/player.c:126: SG_setStp (cur_stp);
	ld	hl,(_cur_stp)
	push	hl
	call	_SG_setStp
	pop	af
;engine/player.c:127: player_render ();
	call	_player_render
;engine/player.c:128: update_cycle ();
	call	_update_cycle
;engine/player.c:130: pkill = phit = 0;
	ld	hl,#_phit + 0
	ld	(hl), #0x00
	ld	hl,#_pkill + 0
	ld	(hl), #0x00
;engine/player.c:131: PSGSFXPlay (SFX_PHIT, 2);
	ld	de,#_s_05_phit3_psg+0
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;engine/player.c:133: if (plife) -- plife; else game_over = 1;
	ld	a,(#_plife + 0)
	or	a, a
	jr	Z,00102$
	ld	hl, #_plife+0
	dec	(hl)
	jr	00103$
00102$:
	ld	hl,#_game_over + 0
	ld	(hl), #0x01
00103$:
;engine/player.c:136: pflickering = PLAYER_FLICKERS;
	ld	hl,#_pflickering + 0
	ld	(hl), #0x64
;engine/player.c:140: pbouncing = PLAYER_BOUNCES;
	ld	hl,#_pbouncing + 0
	ld	(hl), #0x10
	ret
;engine/player.c:181: void player_move (void) {
;	---------------------------------
; Function player_move
; ---------------------------------
_player_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;engine/player.c:182: if (pflickering) -- pflickering;
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	Z,00102$
	ld	hl, #_pflickering+0
	dec	(hl)
00102$:
;engine/player.c:183: if (pbouncing) -- pbouncing;
	ld	a,(#_pbouncing + 0)
	or	a, a
	jr	Z,00104$
	ld	hl, #_pbouncing+0
	dec	(hl)
00104$:
;engine/player.c:219: hitv = hith = 0;
	ld	hl,#_hith + 0
	ld	(hl), #0x00
	ld	hl,#_hitv + 0
	ld	(hl), #0x00
;engine/player.c:220: pcx = prx; pcy = pry;
	ld	a,(#_prx + 0)
	ld	(#_pcx + 0),a
	ld	a,(#_pry + 0)
	ld	(#_pcy + 0),a
;engine/player.c:221: pnotsafe = 0;
	ld	hl,#_pnotsafe + 0
	ld	(hl), #0x00
;engine/player.c:261: oppossee = ppossee;
	ld	a,(#_ppossee + 0)
	ld	(#_oppossee + 0),a
;engine/player.c:262: ppossee = 0;
	ld	hl,#_ppossee + 0
	ld	(hl), #0x00
;engine/player.c:334: if (vertical_engine_type != ENGINE_TYPE_SWIM) {
	ld	a,(#_vertical_engine_type + 0)
	sub	a, #0x02
	jr	Z,00110$
;engine/player.c:345: if (!pj) {
	ld	a,(#_pj + 0)
	or	a, a
	jr	NZ,00110$
;engine/player.c:346: pvy += PLAYER_G;
	ld	hl,#_pvy
	ld	a,(hl)
	add	a, #0x08
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;engine/player.c:347: if (pvy > PLAYER_VY_FALLING_MAX) pvy = PLAYER_VY_FALLING_MAX; 
	ld	a,#0x30
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00410$
	xor	a, #0x80
00410$:
	jp	P,00110$
	ld	hl,#0x0030
	ld	(_pvy),hl
00110$:
;engine/player.c:354: if (pgotten) pvy = 0;			
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00112$
	ld	hl,#0x0000
	ld	(_pvy),hl
00112$:
;engine/player.c:360: if (vertical_engine_type == ENGINE_TYPE_JET_PAC) {
	ld	a,(#_vertical_engine_type + 0)
	dec	a
	jr	NZ,00118$
;engine/player.c:361: if (pad0 & PAD_A) {
	ld	hl,#_pad0+0
	bit	5, (hl)
	jr	Z,00118$
;engine/player.c:362: pvy -= PLAYER_AY_JETPAC;
	ld	hl,#_pvy
	ld	a,(hl)
	add	a,#0xF4
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
;engine/player.c:363: if (pvy < -PLAYER_VY_JETPAC_MAX) pvy = -PLAYER_VY_JETPAC_MAX;
	ld	a,(#_pvy + 0)
	sub	a, #0xC0
	ld	a,(#_pvy + 1)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00118$
	ld	hl,#0xFFC0
	ld	(_pvy),hl
00118$:
;engine/player.c:391: py += pvy;
	ld	hl,#_pvy
	push	de
	ld	iy,#_py
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	pop	de
;engine/player.c:392: if (py < 0) py = 0;
	ld	a,(#_py + 1)
	bit	7,a
	jr	Z,00120$
	ld	hl,#0x0000
	ld	(_py),hl
00120$:
;engine/player.c:393: pry = py >> FIXBITS;
	ld	hl,(_py)
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_pry
	ld	0 (iy),l
;engine/player.c:396: player_to_pixels ();
	call	_player_to_pixels
;engine/player.c:398: cx1 = prx >> 4;
	ld	a,(#_prx + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx1 + 0),a
;engine/player.c:399: cx2 = (prx + 7) >> 4;
	ld	iy,#_prx
	ld	l,0 (iy)
	ld	h,#0x00
	ld	bc,#0x0007
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cx2
	ld	0 (iy),l
;engine/player.c:404: rds16 = pvy + pgtmy;
	ld	hl,#_pgtmy
	push	de
	ld	iy,#_rds16
	push	iy
	pop	de
	ld	a,(#_pvy + 0)
	add	a, (hl)
	ld	(de),a
	ld	a,(#_pvy + 1)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
;engine/player.c:408: cy1 = cy2 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;			
	ld	iy,#_pry
	ld	c,0 (iy)
	ld	b,#0x00
;engine/player.c:405: if (rds16 < 0)
	ld	a,(#_rds16 + 1)
	bit	7,a
	jp	Z,00144$
;engine/player.c:408: cy1 = cy2 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;			
	ld	a,c
	add	a,#0x08
	ld	d,a
	ld	a,b
	adc	a,#0x00
	ld	h,a
	sra	h
	rr	d
	sra	h
	rr	d
	sra	h
	rr	d
	sra	h
	rr	d
	ld	hl,#_cy2 + 0
	ld	(hl), d
	ld	hl,#_cy1 + 0
	ld	(hl), d
;engine/player.c:409: cm_two_points ();
	call	_cm_two_points
;engine/player.c:413: if ((at1 & 8) || (at2 & 8)) 
	ld	iy,#_at1
	bit	3, 0 (iy)
	jr	NZ,00124$
	ld	iy,#_at2
	bit	3, 0 (iy)
	jr	Z,00125$
00124$:
;engine/player.c:416: pry = ((cy1 + 1) << 4) + PLAYER_COLLISION_VSTRETCH_BG;
	ld	a,(#_cy1 + 0)
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_pry
	add	a, #0xF8
	ld	(hl),a
;engine/player.c:417: pvy = 0; py = pry << FIXBITS;
	ld	hl,#0x0000
	ld	(_pvy),hl
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_py),hl
;engine/player.c:418: pgotten = 0;
	ld	iy,#_pgotten
	ld	0 (iy),#0x00
;engine/player.c:419: pfiring = 1;
	ld	iy,#_pfiring
	ld	0 (iy),#0x01
	jp	00145$
00125$:
;engine/player.c:425: } else if ((at1 & 1) || (at2 & 1)) {
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00121$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jp	Z,00145$
00121$:
;engine/player.c:426: hitv = 1;
	ld	iy,#_hitv
	ld	0 (iy),#0x01
	jp	00145$
00144$:
;engine/player.c:437: } else if (rds16 > 0)
	xor	a, a
	ld	iy,#_rds16
	cp	a, 0 (iy)
	ld	iy,#_rds16
	sbc	a, 1 (iy)
	jp	PO, 00420$
	xor	a, #0x80
00420$:
	jp	P,00145$
;engine/player.c:440: cy1 = cy2 = (pry + 16) >> 4; 
	ld	hl,#0x0010
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a,l
	ld	(#_cy2 + 0),a
	ld	(#_cy1 + 0),a
;engine/player.c:441: cm_two_points (); 
	call	_cm_two_points
;engine/player.c:446: pry < ((cy1 - 1) << 4) + 4 && 
	ld	iy,#_cy1
	ld	l,0 (iy)
	ld	h,#0x00
	dec	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(#_pry + 0)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
;engine/player.c:425: } else if ((at1 & 1) || (at2 & 1)) {
	ld	a,(#_at1 + 0)
	and	a, #0x01
	ld	e,a
	ld	iy,#_at2
	ld	a,0 (iy)
	and	a, #0x01
	ld	d,a
;engine/player.c:446: pry < ((cy1 - 1) << 4) + 4 && 
	ld	a,-2 (ix)
	sub	a, c
	ld	a,-1 (ix)
	sbc	a, b
	jp	PO, 00421$
	xor	a, #0x80
00421$:
	jp	P,00137$
;engine/player.c:448: (at1 & 12) || (at2 & 12)
	ld	a,(#_at1 + 0)
	and	a, #0x0C
	jr	NZ,00136$
	ld	a,(#_at2 + 0)
	and	a, #0x0C
	jr	Z,00137$
00136$:
;engine/player.c:456: pvy = 0; pry = ((cy1 - 1) << 4);py = pry << FIXBITS;
	ld	hl,#0x0000
	ld	(_pvy),hl
	ld	a,(#_cy1 + 0)
	add	a,#0xFF
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_pry + 0),a
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_py),hl
;engine/player.c:457: pgotten = 0;
	ld	iy,#_pgotten
	ld	0 (iy),#0x00
;engine/player.c:458: pfiring = 1;
	ld	iy,#_pfiring
	ld	0 (iy),#0x01
;engine/player.c:459: ppossee = 1;
	ld	iy,#_ppossee
	ld	0 (iy),#0x01
;engine/player.c:493: if ((at1 & 1) || (at2 & 1)) pnotsafe = 1; 
	ld	a,e
	or	a,a
	jr	NZ,00128$
	or	a,d
	jr	Z,00145$
00128$:
	ld	iy,#_pnotsafe
	ld	0 (iy),#0x01
	jr	00145$
00137$:
;engine/player.c:494: } else if ((at1 & 1) || (at2 & 1)) {
	ld	a,e
	or	a,a
	jr	NZ,00133$
	or	a,d
	jr	Z,00145$
00133$:
;engine/player.c:495: if ((pry & 15) > 4) hitv = 1;
	ld	a,(#_pry + 0)
	and	a, #0x0F
	ld	h,a
	ld	a,#0x04
	sub	a, h
	jr	NC,00145$
	ld	iy,#_hitv
	ld	0 (iy),#0x01
00145$:
;engine/player.c:653: if (!(pad0 & PAD_LEFT || pad0 & PAD_RIGHT)) {
	ld	a,(#_pad0 + 0)
	and	a, #0x04
	ld	e,a
	ld	a,(#_pad0 + 0)
	and	a, #0x08
	ld	d,a
	ld	a,e
	or	a,a
	jr	NZ,00156$
	or	a,d
	jr	NZ,00156$
;engine/player.c:661: if (pvx > 0) {
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00425$
	xor	a, #0x80
00425$:
	jp	P,00153$
;engine/player.c:666: pvx -= PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a,#0xF8
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
;engine/player.c:669: if (pvx < 0) pvx = 0;
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00156$
	ld	hl,#0x0000
	ld	(_pvx),hl
	jr	00156$
00153$:
;engine/player.c:670: } else if (pvx < 0) {
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00156$
;engine/player.c:675: pvx += PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, #0x08
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;engine/player.c:678: if (pvx > 0) pvx = 0;
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00426$
	xor	a, #0x80
00426$:
	jp	P,00156$
	ld	hl,#0x0000
	ld	(_pvx),hl
00156$:
;engine/player.c:683: if (pad0 & PAD_LEFT) {
	ld	a,e
	or	a, a
	jr	Z,00161$
;engine/player.c:687: pfacing = CELL_FACING_LEFT;		
	ld	iy,#_pfacing
	ld	0 (iy),#0x05
;engine/player.c:690: if (pvx > -PLAYER_VX_MAX) {
	ld	a,#0x80
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	a,#0xFF
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00427$
	xor	a, #0x80
00427$:
	jp	P,00161$
;engine/player.c:695: pvx -= PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a,#0xF8
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
00161$:
;engine/player.c:700: if (pad0 & PAD_RIGHT) {
	ld	a,d
	or	a, a
	jr	Z,00165$
;engine/player.c:704: pfacing = CELL_FACING_RIGHT;
	ld	hl,#_pfacing + 0
	ld	(hl), #0x00
;engine/player.c:707: if (pvx < PLAYER_VX_MAX) {
	ld	a,(#_pvx + 0)
	sub	a, #0x80
	ld	a,(#_pvx + 1)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00165$
;engine/player.c:712: pvx += PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, #0x08
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
00165$:
;engine/player.c:718: px += pvx;
	ld	hl,#_pvx
	push	de
	ld	iy,#_px
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	pop	de
;engine/player.c:720: if (pgotten) px += pgtmx;
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00167$
	ld	hl,#_pgtmx
	push	de
	ld	iy,#_px
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
	pop	de
00167$:
;engine/player.c:723: if (px < (4<<FIXBITS)) { px = 4 << FIXBITS; prx = 4;}
	ld	a,(#_px + 1)
	xor	a, #0x80
	sub	a, #0x81
	jr	NC,00172$
	ld	hl,#0x0100
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0x04
	jr	00173$
00172$:
;engine/player.c:724: else if (px > (244<<FIXBITS)) { px = 244 << FIXBITS; prx = 244; }
	xor	a, a
	ld	iy,#_px
	cp	a, 0 (iy)
	ld	a,#0x3D
	ld	iy,#_px
	sbc	a, 1 (iy)
	jp	PO, 00428$
	xor	a, #0x80
00428$:
	jp	P,00169$
	ld	hl,#0x3D00
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0xF4
	jr	00173$
00169$:
;engine/player.c:725: else player_to_pixels ();
	call	_player_to_pixels
00173$:
;engine/player.c:730: cy1 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;
	ld	hl,#_pry + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	a,e
	add	a,#0x08
	ld	l,a
	ld	a,d
	adc	a,#0x00
	ld	h,a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cy1
	ld	0 (iy),l
;engine/player.c:731: cy2 = (pry + 15) >> 4;
	ld	hl,#0x000F
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cy2
	ld	0 (iy),l
;engine/player.c:734: rds16 = pvx + pgtmx;
	ld	hl,#_pgtmx
	push	de
	ld	iy,#_rds16
	push	iy
	pop	de
	ld	a,(#_pvx + 0)
	add	a, (hl)
	ld	(de),a
	ld	a,(#_pvx + 1)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
;engine/player.c:735: if (rds16) 	{
	ld	a,(#_rds16 + 1)
	ld	iy,#_rds16
	or	a,0 (iy)
	jp	Z,00184$
;engine/player.c:736: if (rds16 < 0) {
	ld	a,(#_rds16 + 1)
	bit	7,a
	jr	Z,00175$
;engine/player.c:737: cx1 = cx2 = prx >> 4; 
	ld	a,(#_prx + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx2 + 0),a
;engine/player.c:738: rda = (cx1 + 1) << 4;
	ld	(#_cx1 + 0),a
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_rda + 0),a
;engine/player.c:739: rdm = cx1 - 1;
	ld	hl,#_rdm
	ld	a,(#_cx1 + 0)
	add	a,#0xFF
	ld	(hl),a
	jr	00176$
00175$:
;engine/player.c:741: cx1 = cx2 = (prx + 8) >> 4;
	ld	iy,#_prx
	ld	l,0 (iy)
	ld	h,#0x00
	ld	bc,#0x0008
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a,l
	ld	(#_cx2 + 0),a
;engine/player.c:742: rda = ((cx1 - 1) << 4) + 8;
	ld	(#_cx1 + 0),a
	add	a,#0xFF
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a, #0x08
	ld	(hl),a
;engine/player.c:743: rdm = cx1 + 1;
	ld	hl,#_rdm
	ld	a,(#_cx1 + 0)
	inc	a
	ld	(hl),a
00176$:
;engine/player.c:764: cm_two_points ();
	call	_cm_two_points
;engine/player.c:768: if ((at1 & 8) || (at2 & 8)) 
	ld	iy,#_at1
	bit	3, 0 (iy)
	jr	NZ,00177$
	ld	iy,#_at2
	bit	3, 0 (iy)
	jr	Z,00178$
00177$:
;engine/player.c:771: pvx = 0; prx = rda; px = prx << FIXBITS; pfiring = 1;
	ld	hl,#0x0000
	ld	(_pvx),hl
	ld	a,(#_rda + 0)
	ld	(#_prx + 0),a
	ld	iy,#_prx
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_px),hl
	ld	iy,#_pfiring
	ld	0 (iy),#0x01
	jr	00179$
00178$:
;engine/player.c:779: hith = ((at1 & 1) || (at2 & 1));
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00203$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jr	NZ,00203$
	ld	a,#0x00
	jr	00204$
00203$:
	ld	a,#0x01
00204$:
	ld	iy,#_hith
	ld	0 (iy),a
00179$:
;engine/player.c:782: if (pvy > 0) hith &= ((pry & 15) > 4);
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00436$
	xor	a, #0x80
00436$:
	jp	P,00184$
	ld	a,(#_pry + 0)
	and	a, #0x0F
	ld	h,a
	ld	a,#0x04
	sub	a, h
	ld	a,#0x00
	rla
	ld	d,a
	ld	a,(#_hith + 0)
	and	a, d
;engine/player.c:810: phit = 0;
	ld	(#_hith + 0),a
00184$:
	ld	iy,#_phit
	ld	0 (iy),#0x00
;engine/player.c:812: if (pgotten == 0) {
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00199$
;engine/player.c:820: if (hitv) { phit = 1; pvy = ADD_SIGN (-pvy, PLAYER_V_REBOUND); pry = pcy; py = pry << FIXBITS; } 
	ld	a,(#_hitv + 0)
	or	a, a
	jr	Z,00188$
	ld	hl,#_phit + 0
	ld	(hl), #0x01
	xor	a, a
	ld	iy,#_pvy
	sub	a, 0 (iy)
	ld	h,a
	ld	a, #0x00
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	ld	l,a
	or	a,h
	jr	Z,00205$
	xor	a, a
	cp	a, h
	sbc	a, l
	jp	PO, 00437$
	xor	a, #0x80
00437$:
	jp	P,00207$
	ld	hl,#0x00E0
	jr	00206$
00207$:
	ld	hl,#0xFF20
	jr	00206$
00205$:
	ld	hl,#0x0000
00206$:
	ld	(_pvy),hl
	ld	a,(#_pcy + 0)
	ld	(#_pry + 0),a
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_py),hl
	jr	00189$
00188$:
;engine/player.c:824: if (hith) { phit = 1; pvx = ADD_SIGN (-pvx, PLAYER_V_REBOUND); prx = pcx; px = prx << FIXBITS; }
	ld	a,(#_hith + 0)
	or	a, a
	jr	Z,00189$
	ld	iy,#_phit
	ld	0 (iy),#0x01
	xor	a, a
	ld	iy,#_pvx
	sub	a, 0 (iy)
	ld	c,a
	ld	a, #0x00
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	ld	b,a
	or	a,c
	jr	Z,00209$
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00438$
	xor	a, #0x80
00438$:
	jp	P,00211$
	ld	hl,#0x00E0
	jr	00210$
00211$:
	ld	hl,#0xFF20
	jr	00210$
00209$:
	ld	hl,#0x0000
00210$:
	ld	(_pvx),hl
	ld	a,(#_pcx + 0)
	ld	(#_prx + 0),a
	ld	iy,#_prx
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_px),hl
00189$:
;engine/player.c:828: cx1 = cx2 = (prx + 4) >> 4;
	ld	hl,#_prx + 0
	ld	e, (hl)
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	hl,#_cx2 + 0
	ld	(hl), e
	ld	hl,#_cx1 + 0
	ld	(hl), e
;engine/player.c:829: cy1 = pry >> 4; cy2 = (pry + 15) >> 4;
	ld	a,(#_pry + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cy1 + 0),a
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	ld	bc,#0x000F
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cy2
	ld	0 (iy),l
;engine/player.c:830: cm_two_points ();
	call	_cm_two_points
;engine/player.c:831: if ((at1 & 1) || (at2 & 1)) phit = 1;
	ld	hl,#_at1+0
	bit	0, (hl)
	jr	NZ,00190$
	ld	hl,#_at2+0
	bit	0, (hl)
	jr	Z,00191$
00190$:
	ld	hl,#_phit + 0
	ld	(hl), #0x01
00191$:
;engine/player.c:834: if (!pflickering && !pbouncing) if (phit) { 
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00199$
	ld	a,(#_pbouncing + 0)
	or	a, a
	jr	NZ,00199$
	ld	a,(#_phit + 0)
	or	a, a
	jr	Z,00199$
;engine/player.c:835: player_to_pixels ();
	call	_player_to_pixels
;engine/player.c:836: en_sg_2 = 1;
	ld	hl,#_en_sg_2 + 0
	ld	(hl), #0x01
;engine/player.c:843: pkill = en_sg_2;
	ld	hl,#_pkill + 0
	ld	(hl), #0x01
00199$:
;engine/player.c:958: prx_old = prx;
	ld	a,(#_prx + 0)
	ld	(#_prx_old + 0),a
;engine/player.c:959: pry_old = pry;
	ld	a,(#_pry + 0)
	ld	(#_pry_old + 0),a
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
