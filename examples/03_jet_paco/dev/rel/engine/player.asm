;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Fri Sep 13 13:08:10 2019
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
;./engine/player.c:39: void player_stop (void) {
;	---------------------------------
; Function player_stop
; ---------------------------------
_player_stop::
;./engine/player.c:40: pvx = pvy = 0;
	ld	hl,#0x0000
	ld	(_pvy),hl
	ld	l, #0x00
	ld	(_pvx),hl
	ret
;./engine/player.c:43: void player_init (void) {
;	---------------------------------
; Function player_init
; ---------------------------------
_player_init::
;./engine/player.c:46: if (!warp_to_level) player_stop ();
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00102$
	call	_player_stop
00102$:
;./engine/player.c:51: pfacing = 0;
	ld	hl,#_pfacing + 0
	ld	(hl), #0x00
;./engine/player.c:54: pfr = pctfr = 0;
	ld	hl,#_pctfr + 0
	ld	(hl), #0x00
	ld	hl,#_pfr + 0
	ld	(hl), #0x00
;./engine/player.c:55: pj = pctj = 0;
	ld	hl,#_pctj + 0
	ld	(hl), #0x00
	ld	hl,#_pj + 0
	ld	(hl), #0x00
;./engine/player.c:56: psprid = 0;
	ld	hl,#_psprid + 0
	ld	(hl), #0x00
;./engine/player.c:59: pobjs = 0;
	ld	hl,#_pobjs + 0
	ld	(hl), #0x00
;./engine/player.c:66: pgotten = 0;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x00
;./engine/player.c:67: pfiring = 0;
	ld	hl,#_pfiring + 0
	ld	(hl), #0x00
;./engine/player.c:70: pkilled = 0;
	ld	hl,#_pkilled + 0
	ld	(hl), #0x00
;./engine/player.c:86: pflickering = pbouncing = 0;
	ld	hl,#_pbouncing + 0
	ld	(hl), #0x00
	ld	hl,#_pflickering + 0
	ld	(hl), #0x00
;./engine/player.c:101: vertical_engine_type = ENGINE_TYPE_JET_PAC;
	ld	hl,#_vertical_engine_type + 0
	ld	(hl), #0x01
	ret
;./engine/player.c:118: void player_render (void) {
;	---------------------------------
; Function player_render
; ---------------------------------
_player_render::
;./engine/player.c:119: if (0 == pflickering || half_life) 
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	Z,00101$
	ld	a,(#_half_life + 0)
	or	a, a
	ret	Z
00101$:
;./engine/player.c:122: spr_player [psprid]
	ld	de,#_spr_player+0
	ld	iy,#_psprid
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;./engine/player.c:121: prx - 4, pry + SPRITE_ADJUST, 
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
;./engine/player.c:126: void player_to_pixels (void) {
;	---------------------------------
; Function player_to_pixels
; ---------------------------------
_player_to_pixels::
;./engine/player.c:127: prx = px >> FIXBITS;
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
;./engine/player.c:128: pry = py >> FIXBITS;
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
;./engine/player.c:131: void player_kill (void) {
;	---------------------------------
; Function player_kill
; ---------------------------------
_player_kill::
;./engine/player.c:132: HW_setStp (cur_stp);
	ld	hl,(_cur_stp)
	push	hl
	call	_SG_setStp
	pop	af
;./engine/player.c:133: player_render ();
	call	_player_render
;./engine/player.c:134: update_cycle ();
	call	_update_cycle
;./engine/player.c:136: pkill = phit = 0;
	ld	hl,#_phit + 0
	ld	(hl), #0x00
	ld	hl,#_pkill + 0
	ld	(hl), #0x00
;./engine/player.c:137: PSGSFXPlay (SFX_PHIT, 3);
	ld	de,#_s_05_phit3_psg+0
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./engine/player.c:139: if (plife) -- plife; else game_over = 1;
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
;./engine/player.c:142: pflickering = PLAYER_FLICKERS;
	ld	hl,#_pflickering + 0
	ld	(hl), #0x64
;./engine/player.c:146: pbouncing = PLAYER_BOUNCES;
	ld	hl,#_pbouncing + 0
	ld	(hl), #0x10
	ret
;./engine/player.c:188: void player_move (void) {
;	---------------------------------
; Function player_move
; ---------------------------------
_player_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;./engine/player.c:189: if (pflickering) -- pflickering;
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	Z,00102$
	ld	hl, #_pflickering+0
	dec	(hl)
00102$:
;./engine/player.c:190: if (pbouncing) -- pbouncing;
	ld	a,(#_pbouncing + 0)
	or	a, a
	jr	Z,00104$
	ld	hl, #_pbouncing+0
	dec	(hl)
00104$:
;./engine/player.c:226: hitv = hith = 0;
	ld	hl,#_hith + 0
	ld	(hl), #0x00
	ld	hl,#_hitv + 0
	ld	(hl), #0x00
;./engine/player.c:227: pcx = prx; pcy = pry;
	ld	a,(#_prx + 0)
	ld	(#_pcx + 0),a
	ld	a,(#_pry + 0)
	ld	(#_pcy + 0),a
;./engine/player.c:228: pnotsafe = 0;
	ld	hl,#_pnotsafe + 0
	ld	(hl), #0x00
;./engine/player.c:238: cx1 = prx >> 4; cx2 = (prx + 7) >> 4;
	ld	a,(#_prx + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx1 + 0),a
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
;./engine/player.c:239: cy1 = cy2 = (pry + 15) >> 4;
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
	ld	a,l
	ld	(#_cy2 + 0),a
	ld	(#_cy1 + 0),a
;./engine/player.c:240: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:249: rda = pfloating;
	ld	a,(#_pfloating + 0)
	ld	(#_rda + 0),a
;./engine/player.c:250: pfloating = (at1 == 64 || at2 == 64);
	ld	a,(#_at1 + 0)
	sub	a, #0x40
	jr	Z,00212$
	ld	a,(#_at2 + 0)
	sub	a, #0x40
	jr	Z,00212$
	ld	a,#0x00
	jr	00213$
00212$:
	ld	a,#0x01
00213$:
	ld	(#_pfloating + 0),a
;./engine/player.c:251: if (rda != pfloating) PSGSFXPlay (SFX_FLOAT, 2);
	ld	a,(#_rda + 0)
	ld	iy,#_pfloating
	sub	a, 0 (iy)
	jr	Z,00106$
	ld	de,#_s_16_float3_psg
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
00106$:
;./engine/player.c:268: oppossee = ppossee;
	ld	a,(#_ppossee + 0)
	ld	(#_oppossee + 0),a
;./engine/player.c:269: ppossee = 0;
	ld	hl,#_ppossee + 0
	ld	(hl), #0x00
;./engine/player.c:335: if (pfloating) {
	ld	a,(#_pfloating + 0)
	or	a, a
	jr	Z,00116$
;./engine/player.c:336: pvy -= PLAYER_AY_FLOAT; 
	ld	hl,#_pvy
	ld	a,(hl)
	add	a,#0xF0
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
;./engine/player.c:337: if (pvy < -PLAYER_VY_FLOAT_MAX) pvy = -PLAYER_VY_FLOAT_MAX;
	ld	a,(#_pvy + 1)
	xor	a, #0x80
	sub	a, #0x7F
	jr	NC,00117$
	ld	hl,#0xFF00
	ld	(_pvy),hl
	jr	00117$
00116$:
;./engine/player.c:341: if (vertical_engine_type != ENGINE_TYPE_SWIM) {
	ld	a,(#_vertical_engine_type + 0)
	sub	a, #0x02
	jr	Z,00117$
;./engine/player.c:352: if (!pj) {
	ld	a,(#_pj + 0)
	or	a, a
	jr	NZ,00117$
;./engine/player.c:353: pvy += PLAYER_G;
	ld	hl,#___player_g + 0
	ld	d, (hl)
	ld	e,#0x00
	ld	hl,#_pvy
	ld	a,(hl)
	add	a, d
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, e
	ld	(hl),a
;./engine/player.c:354: if (pvy > PLAYER_VY_FALLING_MAX) pvy = PLAYER_VY_FALLING_MAX; 
	ld	iy,#___player_vy_falling_max
	ld	e,0 (iy)
	ld	d,#0x00
	ld	a,e
	ld	iy,#_pvy
	sub	a, 0 (iy)
	ld	a,d
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00449$
	xor	a, #0x80
00449$:
	jp	P,00117$
	ld	(_pvy),de
00117$:
;./engine/player.c:361: if (pgotten) pvy = 0;			
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00119$
	ld	hl,#0x0000
	ld	(_pvy),hl
00119$:
;./engine/player.c:367: if (vertical_engine_type == ENGINE_TYPE_JET_PAC) {
	ld	a,(#_vertical_engine_type + 0)
	dec	a
	jr	NZ,00127$
;./engine/player.c:368: if (pad0 & PAD_A) {
	ld	hl,#_pad0+0
	bit	5, (hl)
	jr	Z,00127$
;./engine/player.c:369: pvy -= PLAYER_AY_JETPAC;
	ld	hl,#___player_ay_jetpac + 0
	ld	d, (hl)
	ld	e,#0x00
	ld	hl,#_pvy
	ld	a,(hl)
	sub	a, d
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	sbc	a, e
	ld	(hl),a
;./engine/player.c:371: if (!pfloating)
	ld	a,(#_pfloating + 0)
	or	a, a
	jr	NZ,00127$
;./engine/player.c:373: if (pvy < -PLAYER_VY_JETPAC_MAX) pvy = -PLAYER_VY_JETPAC_MAX;
	ld	hl,#___player_vy_jetpac_max + 0
	ld	h, (hl)
	ld	l,#0x00
	xor	a, a
	sub	a, h
	ld	e,a
	ld	a, #0x00
	sbc	a, l
	ld	d,a
	ld	a,(#_pvy + 0)
	sub	a, e
	ld	iy,#_pvy
	ld	a,1 (iy)
	sbc	a, d
	jp	PO, 00453$
	xor	a, #0x80
00453$:
	jp	P,00127$
	ld	(_pvy),de
00127$:
;./engine/player.c:401: py += pvy;
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
;./engine/player.c:402: if (py < 0) py = 0;
	ld	a,(#_py + 1)
	bit	7,a
	jr	Z,00129$
	ld	hl,#0x0000
	ld	(_py),hl
00129$:
;./engine/player.c:403: pry = py >> FIXBITS;
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
;./engine/player.c:406: player_to_pixels ();
	call	_player_to_pixels
;./engine/player.c:408: cx1 = prx >> 4;
	ld	a,(#_prx + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx1 + 0),a
;./engine/player.c:409: cx2 = (prx + 7) >> 4;
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
;./engine/player.c:414: rds16 = pvy + pgtmy;
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
;./engine/player.c:239: cy1 = cy2 = (pry + 15) >> 4;
	ld	iy,#_pry
	ld	e,0 (iy)
	ld	d,#0x00
;./engine/player.c:415: if (rds16 < 0)
	ld	a,(#_rds16 + 1)
	bit	7,a
	jp	Z,00153$
;./engine/player.c:418: cy1 = cy2 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;			
	ld	a,e
	add	a,#0x04
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	d,a
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	hl,#_cy2 + 0
	ld	(hl), e
	ld	hl,#_cy1 + 0
	ld	(hl), e
;./engine/player.c:419: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:423: if ((at1 & 8) || (at2 & 8)) 
	ld	iy,#_at1
	bit	3, 0 (iy)
	jr	NZ,00133$
	ld	iy,#_at2
	bit	3, 0 (iy)
	jr	Z,00134$
00133$:
;./engine/player.c:426: pry = ((cy1 + 1) << 4) + PLAYER_COLLISION_VSTRETCH_BG;
	ld	a,(#_cy1 + 0)
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_pry
	add	a, #0xFC
	ld	(hl),a
;./engine/player.c:427: pvy = 0; py = pry << FIXBITS;
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
;./engine/player.c:428: pgotten = 0;
	ld	iy,#_pgotten
	ld	0 (iy),#0x00
;./engine/player.c:429: pfiring = 1;
	ld	iy,#_pfiring
	ld	0 (iy),#0x01
	jp	00154$
00134$:
;./engine/player.c:435: } else if ((at1 & 1) || (at2 & 1)) {
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00130$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jp	Z,00154$
00130$:
;./engine/player.c:436: hitv = 1;
	ld	iy,#_hitv
	ld	0 (iy),#0x01
	jp	00154$
00153$:
;./engine/player.c:447: } else if (rds16 > 0)
	xor	a, a
	ld	iy,#_rds16
	cp	a, 0 (iy)
	ld	iy,#_rds16
	sbc	a, 1 (iy)
	jp	PO, 00460$
	xor	a, #0x80
00460$:
	jp	P,00154$
;./engine/player.c:450: cy1 = cy2 = (pry + 16) >> 4; 
	ld	hl,#0x0010
	add	hl,de
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
;./engine/player.c:451: cm_two_points (); 
	call	_cm_two_points
;./engine/player.c:456: pry < ((cy1 - 1) << 4) + 4 && 
	ld	iy,#_cy1
	ld	l,0 (iy)
	ld	h,#0x00
	dec	hl
	add	hl, hl
	add	hl, hl
	inc	hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	iy,#_pry
	ld	h,0 (iy)
	ld	l,#0x00
	ld	a,h
	sub	a, e
	ld	a,l
	sbc	a, d
	jp	PO, 00461$
	xor	a, #0x80
00461$:
	jp	P,00146$
;./engine/player.c:458: (at1 & 12) || (at2 & 12)
	ld	a,(#_at1 + 0)
	and	a, #0x0C
	jr	NZ,00145$
	ld	a,(#_at2 + 0)
	and	a, #0x0C
	jr	Z,00146$
00145$:
;./engine/player.c:466: pvy = 0; pry = ((cy1 - 1) << 4);py = pry << FIXBITS;
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
;./engine/player.c:467: pgotten = 0;
	ld	iy,#_pgotten
	ld	0 (iy),#0x00
;./engine/player.c:468: pfiring = 1;
	ld	iy,#_pfiring
	ld	0 (iy),#0x01
;./engine/player.c:469: ppossee = 1;
	ld	iy,#_ppossee
	ld	0 (iy),#0x01
;./engine/player.c:503: if ((at1 & 1) || (at2 & 1)) pnotsafe = 1; 
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00137$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jr	Z,00154$
00137$:
	ld	iy,#_pnotsafe
	ld	0 (iy),#0x01
	jr	00154$
00146$:
;./engine/player.c:506: cy2 = pry + 15 - PLAYER_SPIKES_BOTTOM_ALLOW;
	ld	hl,#_cy2
	ld	a,(#_pry + 0)
	add	a, #0x0D
	ld	(hl),a
;./engine/player.c:507: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:509: if ((at1 & 1) || (at2 & 1)) {
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00142$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jr	Z,00154$
00142$:
;./engine/player.c:510: if ((pry & 15) > 4) hitv = 1;
	ld	a,(#_pry + 0)
	and	a, #0x0F
	ld	h,a
	ld	a,#0x04
	sub	a, h
	jr	NC,00154$
	ld	iy,#_hitv
	ld	0 (iy),#0x01
00154$:
;./engine/player.c:672: if (!(pad0 & PAD_LEFT || pad0 & PAD_RIGHT)) {
	ld	a,(#_pad0 + 0)
	and	a, #0x04
	ld	b,a
	ld	a,(#_pad0 + 0)
	and	a, #0x08
	ld	-3 (ix),a
	ld	a,b
	or	a, a
	jr	NZ,00165$
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00165$
;./engine/player.c:685: pvx -= PLAYER_RX;
	ld	iy,#___player_rx
	ld	d,0 (iy)
	ld	e,#0x00
;./engine/player.c:680: if (pvx > 0) {
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00471$
	xor	a, #0x80
00471$:
	jp	P,00162$
;./engine/player.c:685: pvx -= PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	sub	a, d
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	sbc	a, e
	ld	(hl),a
;./engine/player.c:688: if (pvx < 0) pvx = 0;
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00165$
	ld	hl,#0x0000
	ld	(_pvx),hl
	jr	00165$
00162$:
;./engine/player.c:689: } else if (pvx < 0) {
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00165$
;./engine/player.c:694: pvx += PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, d
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, e
	ld	(hl),a
;./engine/player.c:697: if (pvx > 0) pvx = 0;
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00472$
	xor	a, #0x80
00472$:
	jp	P,00165$
	ld	hl,#0x0000
	ld	(_pvx),hl
00165$:
;./engine/player.c:709: if (pvx > -PLAYER_VX_MAX) {
	ld	a,(#___player_vx_max + 0)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
;./engine/player.c:714: pvx -= PLAYER_AX;
	ld	iy,#___player_ax
	ld	e,0 (iy)
	ld	d,#0x00
;./engine/player.c:702: if (pad0 & PAD_LEFT) {
	ld	a,b
	or	a, a
	jr	Z,00170$
;./engine/player.c:706: pfacing = CELL_FACING_LEFT;		
	ld	iy,#_pfacing
	ld	0 (iy),#0x05
;./engine/player.c:709: if (pvx > -PLAYER_VX_MAX) {
	xor	a, a
	sub	a, -2 (ix)
	ld	c,a
	ld	a, #0x00
	sbc	a, -1 (ix)
	ld	b,a
	ld	a,c
	ld	iy,#_pvx
	sub	a, 0 (iy)
	ld	a,b
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00473$
	xor	a, #0x80
00473$:
	jp	P,00170$
;./engine/player.c:714: pvx -= PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	sub	a, e
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	sbc	a, d
	ld	(hl),a
00170$:
;./engine/player.c:719: if (pad0 & PAD_RIGHT) {
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00174$
;./engine/player.c:723: pfacing = CELL_FACING_RIGHT;
	ld	iy,#_pfacing
	ld	0 (iy),#0x00
;./engine/player.c:726: if (pvx < PLAYER_VX_MAX) {
	ld	a,(#_pvx + 0)
	sub	a, -2 (ix)
	ld	iy,#_pvx
	ld	a,1 (iy)
	sbc	a, -1 (ix)
	jp	PO, 00474$
	xor	a, #0x80
00474$:
	jp	P,00174$
;./engine/player.c:731: pvx += PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, e
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, d
	ld	(hl),a
00174$:
;./engine/player.c:737: px += pvx;
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
;./engine/player.c:739: if (pgotten) px += pgtmx;
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00176$
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
00176$:
;./engine/player.c:742: if (px < (4<<FIXBITS)) { px = 4 << FIXBITS; prx = 4;}
	ld	a,(#_px + 1)
	xor	a, #0x80
	sub	a, #0x81
	jr	NC,00181$
	ld	hl,#0x0100
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0x04
	jr	00182$
00181$:
;./engine/player.c:743: else if (px > (244<<FIXBITS)) { px = 244 << FIXBITS; prx = 244; }
	xor	a, a
	ld	iy,#_px
	cp	a, 0 (iy)
	ld	a,#0x3D
	ld	iy,#_px
	sbc	a, 1 (iy)
	jp	PO, 00475$
	xor	a, #0x80
00475$:
	jp	P,00178$
	ld	hl,#0x3D00
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0xF4
	jr	00182$
00178$:
;./engine/player.c:744: else player_to_pixels ();
	call	_player_to_pixels
00182$:
;./engine/player.c:749: cy1 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;
	ld	hl,#_pry + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	a,e
	add	a,#0x04
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
;./engine/player.c:750: cy2 = (pry + 15) >> 4;
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
;./engine/player.c:753: rds16 = pvx + pgtmx;
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
;./engine/player.c:754: if (rds16) 	{
	ld	a,(#_rds16 + 1)
	ld	iy,#_rds16
	or	a,0 (iy)
	jp	Z,00193$
;./engine/player.c:755: if (rds16 < 0) {
	ld	a,(#_rds16 + 1)
	bit	7,a
	jr	Z,00184$
;./engine/player.c:756: cx1 = cx2 = prx >> 4; 
	ld	a,(#_prx + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx2 + 0),a
;./engine/player.c:757: rda = (cx1 + 1) << 4;
	ld	(#_cx1 + 0),a
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_rda + 0),a
;./engine/player.c:758: rdm = cx1 - 1;
	ld	hl,#_rdm
	ld	a,(#_cx1 + 0)
	add	a,#0xFF
	ld	(hl),a
	jr	00185$
00184$:
;./engine/player.c:760: cx1 = cx2 = (prx + 8) >> 4;
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
;./engine/player.c:761: rda = ((cx1 - 1) << 4) + 8;
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
;./engine/player.c:762: rdm = cx1 + 1;
	ld	hl,#_rdm
	ld	a,(#_cx1 + 0)
	inc	a
	ld	(hl),a
00185$:
;./engine/player.c:783: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:787: if ((at1 & 8) || (at2 & 8)) 
	ld	hl,#_at1+0
	bit	3, (hl)
	jr	NZ,00186$
	ld	hl,#_at2+0
	bit	3, (hl)
	jr	Z,00187$
00186$:
;./engine/player.c:790: pvx = 0; prx = rda; px = prx << FIXBITS; pfiring = 1;
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
	jr	00188$
00187$:
;./engine/player.c:799: cy2 = pry + 15 - PLAYER_SPIKES_BOTTOM_ALLOW;
	ld	hl,#_cy2
	ld	a,(#_pry + 0)
	add	a, #0x0D
	ld	(hl),a
;./engine/player.c:800: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:802: hith = ((at1 & 1) || (at2 & 1));
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00215$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jr	NZ,00215$
	ld	a,#0x00
	jr	00216$
00215$:
	ld	a,#0x01
00216$:
	ld	iy,#_hith
	ld	0 (iy),a
00188$:
;./engine/player.c:805: if (pvy > 0) hith &= ((pry & 15) > 4);
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00483$
	xor	a, #0x80
00483$:
	jp	P,00193$
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
;./engine/player.c:833: phit = 0;
	ld	(#_hith + 0),a
00193$:
	ld	iy,#_phit
	ld	0 (iy),#0x00
;./engine/player.c:835: if (pgotten == 0) {
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00208$
;./engine/player.c:843: if (hitv) { phit = 1; pvy = ADD_SIGN (-pvy, PLAYER_V_REBOUND); pry = pcy; py = pry << FIXBITS; } 
	ld	a,(#_hitv + 0)
	or	a, a
	jr	Z,00197$
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
	jr	Z,00217$
	xor	a, a
	cp	a, h
	sbc	a, l
	jp	PO, 00484$
	xor	a, #0x80
00484$:
	jp	P,00219$
	ld	hl,#0x00E0
	jr	00218$
00219$:
	ld	hl,#0xFF20
	jr	00218$
00217$:
	ld	hl,#0x0000
00218$:
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
	jr	00198$
00197$:
;./engine/player.c:847: if (hith) { phit = 1; pvx = ADD_SIGN (-pvx, PLAYER_V_REBOUND); prx = pcx; px = prx << FIXBITS; }
	ld	a,(#_hith + 0)
	or	a, a
	jr	Z,00198$
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
	jr	Z,00221$
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00485$
	xor	a, #0x80
00485$:
	jp	P,00223$
	ld	hl,#0x00E0
	jr	00222$
00223$:
	ld	hl,#0xFF20
	jr	00222$
00221$:
	ld	hl,#0x0000
00222$:
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
00198$:
;./engine/player.c:851: cx1 = cx2 = (prx + 4) >> 4;
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
;./engine/player.c:852: cy1 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4; cy2 = (pry + 15) >> 4;
	ld	hl,#_pry + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	a,e
	add	a,#0x04
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
;./engine/player.c:853: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:854: if ((at1 & 1) || (at2 & 1)) phit = 1;
	ld	hl,#_at1+0
	bit	0, (hl)
	jr	NZ,00199$
	ld	hl,#_at2+0
	bit	0, (hl)
	jr	Z,00200$
00199$:
	ld	hl,#_phit + 0
	ld	(hl), #0x01
00200$:
;./engine/player.c:857: if (!pflickering && !pbouncing) if (phit) { 
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00208$
	ld	a,(#_pbouncing + 0)
	or	a, a
	jr	NZ,00208$
	ld	a,(#_phit + 0)
	or	a, a
	jr	Z,00208$
;./engine/player.c:858: player_to_pixels ();
	call	_player_to_pixels
;./engine/player.c:859: en_sg_2 = 1;
	ld	hl,#_en_sg_2 + 0
	ld	(hl), #0x01
;./engine/player.c:866: pkill = en_sg_2;
	ld	hl,#_pkill + 0
	ld	(hl), #0x01
00208$:
;./engine/player.c:981: prx_old = prx;
	ld	a,(#_prx + 0)
	ld	(#_prx_old + 0),a
;./engine/player.c:982: pry_old = pry;
	ld	a,(#_pry + 0)
	ld	(#_pry_old + 0),a
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
