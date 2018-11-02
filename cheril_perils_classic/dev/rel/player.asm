;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Fri Nov 02 19:01:16 2018
;--------------------------------------------------------
	.module player
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _player_move
	.globl _player_process_tile
	.globl _player_kill
	.globl _player_to_pixels
	.globl _player_render
	.globl _player_init
	.globl _player_stop
	.globl _player_register_safe_spot
	.globl _update_cycle
	.globl _jump_start
	.globl _cm_two_points
	.globl _map_set
	.globl _delay
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
;engine/player.c:24: void player_register_safe_spot (void) {
;	---------------------------------
; Function player_register_safe_spot
; ---------------------------------
_player_register_safe_spot::
;engine/player.c:25: px_safe = px;
	ld	hl,(_px)
	ld	(_px_safe),hl
;engine/player.c:26: py_safe = py;
	ld	hl,(_py)
	ld	(_py_safe),hl
;engine/player.c:27: n_pant_safe = n_pant;
	ld	a,(#_n_pant + 0)
	ld	(#_n_pant_safe + 0),a
	ret
;engine/player.c:31: void player_stop (void) {
;	---------------------------------
; Function player_stop
; ---------------------------------
_player_stop::
;engine/player.c:32: pvx = pvy = 0;
	ld	hl,#0x0000
	ld	(_pvy),hl
	ld	l, #0x00
	ld	(_pvx),hl
	ret
;engine/player.c:35: void player_init (void) {
;	---------------------------------
; Function player_init
; ---------------------------------
_player_init::
;engine/player.c:38: if (!warp_to_level) player_stop ();
	ld	a,(#_warp_to_level + 0)
	or	a, a
	jr	NZ,00102$
	call	_player_stop
00102$:
;engine/player.c:43: pfacing = 0;
	ld	hl,#_pfacing + 0
	ld	(hl), #0x00
;engine/player.c:46: pfr = pctfr = 0;
	ld	hl,#_pctfr + 0
	ld	(hl), #0x00
	ld	hl,#_pfr + 0
	ld	(hl), #0x00
;engine/player.c:47: pj = pctj = 0;
	ld	hl,#_pctj + 0
	ld	(hl), #0x00
	ld	hl,#_pj + 0
	ld	(hl), #0x00
;engine/player.c:48: psprid = 0;
	ld	hl,#_psprid + 0
	ld	(hl), #0x00
;engine/player.c:55: pkeys = 0;
	ld	hl,#_pkeys + 0
	ld	(hl), #0x00
;engine/player.c:58: pgotten = 0;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x00
;engine/player.c:59: pfiring = 0;
	ld	hl,#_pfiring + 0
	ld	(hl), #0x00
;engine/player.c:62: pkilled = 0;
	ld	hl,#_pkilled + 0
	ld	(hl), #0x00
;engine/player.c:78: pflickering = pbouncing = 0;
	ld	hl,#_pbouncing + 0
	ld	(hl), #0x00
	ld	hl,#_pflickering + 0
	ld	(hl), #0x00
;engine/player.c:81: player_register_safe_spot ();
	call	_player_register_safe_spot
;engine/player.c:91: vertical_engine_type = ENGINE_TYPE_JUMP;
	ld	hl,#_vertical_engine_type + 0
	ld	(hl), #0x00
	ret
;engine/player.c:110: void player_render (void) {
;	---------------------------------
; Function player_render
; ---------------------------------
_player_render::
;engine/player.c:111: if (0 == pflickering || half_life) 
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	Z,00101$
	ld	a,(#_half_life + 0)
	or	a, a
	ret	Z
00101$:
;engine/player.c:114: spr_player [psprid]
	ld	de,#_spr_player+0
	ld	iy,#_psprid
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;engine/player.c:113: prx - 4, pry + SPRITE_ADJUST, 
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
;engine/player.c:118: void player_to_pixels (void) {
;	---------------------------------
; Function player_to_pixels
; ---------------------------------
_player_to_pixels::
;engine/player.c:119: prx = px >> FIXBITS;
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
;engine/player.c:120: pry = py >> FIXBITS;
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
;engine/player.c:123: void player_kill (void) {
;	---------------------------------
; Function player_kill
; ---------------------------------
_player_kill::
;engine/player.c:124: SG_setStp (cur_stp);
	ld	hl,(_cur_stp)
	push	hl
	call	_SG_setStp
	pop	af
;engine/player.c:125: player_render ();
	call	_player_render
;engine/player.c:126: update_cycle ();
	call	_update_cycle
;engine/player.c:128: pkill = phit = 0;
	ld	hl,#_phit + 0
	ld	(hl), #0x00
	ld	hl,#_pkill + 0
	ld	(hl), #0x00
;engine/player.c:129: PSGSFXPlay (SFX_PHIT, 2);
	ld	de,#_s_05_phit3_psg+0
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;engine/player.c:131: if (plife) -- plife; else game_over = 1;
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
;engine/player.c:134: pflickering = PLAYER_FLICKERS;
	ld	hl,#_pflickering + 0
	ld	(hl), #0x64
;engine/player.c:147: delay (60);
	ld	a,#0x3C
	push	af
	inc	sp
	call	_delay
	inc	sp
;engine/player.c:152: px = px_safe; 
	ld	hl,(_px_safe)
	ld	(_px),hl
;engine/player.c:153: py = py_safe; 
	ld	hl,(_py_safe)
	ld	(_py),hl
;engine/player.c:154: player_to_pixels ();
	call	_player_to_pixels
;engine/player.c:155: n_pant = n_pant_safe;		
	ld	a,(#_n_pant_safe + 0)
	ld	(#_n_pant + 0),a
;engine/player.c:156: player_stop ();
	jp  _player_stop
;engine/../engine/playermods/process_tile.h:4: void player_process_tile (unsigned char at, unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1) {
;	---------------------------------
; Function player_process_tile
; ---------------------------------
_player_process_tile::
	push	ix
	ld	ix,#0
	add	ix,sp
;engine/../engine/playermods/process_tile.h:5: if (y0) -- y0;
	ld	a,6 (ix)
	or	a, a
	jr	Z,00102$
	dec	6 (ix)
00102$:
;engine/../engine/playermods/process_tile.h:46: at == 10 &&
	ld	a,4 (ix)
	sub	a, #0x0A
	jp	NZ,00110$
;engine/../engine/playermods/process_tile.h:47: pkeys
	ld	a,(#_pkeys + 0)
	or	a, a
	jp	Z,00110$
;engine/../engine/playermods/process_tile.h:49: _x = x0; _y = y0; _t = 0; map_set ();
	ld	a,5 (ix)
	ld	(#__x + 0),a
	ld	a,6 (ix)
	ld	(#__y + 0),a
	ld	hl,#__t + 0
	ld	(hl), #0x00
	call	_map_set
;engine/../engine/playermods/process_tile.h:52: gp_gen = (unsigned char *) c_locks;
	ld	hl,(_c_locks)
	ld	(_gp_gen),hl
;engine/../engine/playermods/process_tile.h:53: gpit = c_max_bolts; while (gpit --) {
	ld	a,(#_c_max_bolts + 0)
	ld	(#_gpit + 0),a
00106$:
	ld	hl,#_gpit + 0
	ld	e, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,e
	or	a, a
	jr	Z,00108$
;engine/../engine/playermods/process_tile.h:54: rda = *gp_gen ++; rdb = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00145$
	ld	hl, #_gp_gen+1
	inc	(hl)
00145$:
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdb + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00146$
	ld	hl, #_gp_gen+1
	inc	(hl)
00146$:
;engine/../engine/playermods/process_tile.h:55: if (n_pant == rda && COORDS (x0, y0) == rdb) {
	ld	a,(#_n_pant + 0)
	ld	iy,#_rda
	sub	a, 0 (iy)
	jr	NZ,00106$
	ld	l,6 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, 5 (ix)
	ld	d, #0x00
	or	a, l
	ld	e,a
	ld	a,d
	or	a, h
	ld	d,a
	ld	hl,#_rdb + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	a,e
	sub	a, c
	jr	NZ,00106$
	ld	a,d
	sub	a, b
	jr	NZ,00106$
;engine/../engine/playermods/process_tile.h:56: lkact [gpit] = 0;
	ld	a,#<(_lkact)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_lkact)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
	jr	00106$
00108$:
;engine/../engine/playermods/process_tile.h:60: -- pkeys;
	ld	hl, #_pkeys+0
	dec	(hl)
;engine/../engine/playermods/process_tile.h:61: PSGSFXPlay (SFX_TILE, 2);
	ld	de,#_s_01_tile3_psg+0
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
	jr	00113$
00110$:
;engine/../engine/playermods/process_tile.h:64: no_ct = 100;
	ld	hl,#_no_ct + 0
	ld	(hl), #0x64
00113$:
	pop	ix
	ret
;engine/player.c:179: void player_move (void) {
;	---------------------------------
; Function player_move
; ---------------------------------
_player_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;engine/player.c:180: if (pflickering) -- pflickering;
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	Z,00102$
	ld	hl, #_pflickering+0
	dec	(hl)
00102$:
;engine/player.c:181: if (pbouncing) -- pbouncing;
	ld	a,(#_pbouncing + 0)
	or	a, a
	jr	Z,00104$
	ld	hl, #_pbouncing+0
	dec	(hl)
00104$:
;engine/player.c:217: hitv = hith = 0;
	ld	hl,#_hith + 0
	ld	(hl), #0x00
	ld	hl,#_hitv + 0
	ld	(hl), #0x00
;engine/player.c:218: pcx = prx; pcy = pry;
	ld	a,(#_prx + 0)
	ld	(#_pcx + 0),a
	ld	a,(#_pry + 0)
	ld	(#_pcy + 0),a
;engine/player.c:219: pnotsafe = 0;
	ld	hl,#_pnotsafe + 0
	ld	(hl), #0x00
;engine/player.c:229: cx1 = prx >> 4; cx2 = (prx + 7) >> 4;
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
;engine/player.c:230: cy1 = cy2 = (pry + 15) >> 4;
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
;engine/player.c:231: cm_two_points ();
	call	_cm_two_points
;engine/player.c:246: if (springs_on && cy1 < 12) {
	ld	a,(#_springs_on + 0)
	or	a, a
	jp	Z,00116$
;engine/player.c:247: if (cy1) -- cy1;
	ld	a,(#_cy1 + 0)
	cp	a,#0x0C
	jp	NC,00116$
	or	a, a
	jr	Z,00106$
	ld	hl, #_cy1+0
	dec	(hl)
00106$:
;engine/player.c:248: _t = SPRING_SPIKE_TILE; 
	ld	hl,#__t + 0
	ld	(hl), #0x0A
;engine/player.c:250: if (ppossee)
	ld	a,(#_ppossee + 0)
	or	a, a
	jp	Z,00116$
;engine/player.c:253: if (QTILE (cx1, cy1 + 1) == SPRING_TILE && QTILE (cx1, cy1) != SPRING_SPIKE_TILE) { _x = cx1; _y = cy1; map_set (); PSGSFXPlay (SFX_SPRING, 1); }
	ld	a,(#_cy1 + 0)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	d,l
	ld	e,h
	ld	a,(#_cx1 + 0)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	a,-4 (ix)
	or	a, d
	ld	l,a
	ld	a,-3 (ix)
	or	a, e
	ld	h,a
	ld	de,#_map_buff
	add	hl,de
	ld	a,(hl)
	sub	a, #0x1F
	jr	NZ,00108$
	pop	bc
	pop	hl
	push	hl
	push	bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,l
	or	a, -4 (ix)
	ld	l,a
	ld	a,h
	or	a, -3 (ix)
	ld	h,a
	ld	de,#_map_buff
	add	hl,de
	ld	a,(hl)
	sub	a, #0x0A
	jr	Z,00108$
	ld	a,(#_cx1 + 0)
	ld	(#__x + 0),a
	ld	a,(#_cy1 + 0)
	ld	(#__y + 0),a
	call	_map_set
	ld	de,#_s_11_spring2_psg+0
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
00108$:
;engine/player.c:254: if (QTILE (cx2, cy1 + 1) == SPRING_TILE && QTILE (cx2, cy1) != SPRING_SPIKE_TILE) { _x = cx2; _y = cy1; map_set (); PSGSFXPlay (SFX_SPRING, 1);	}
	ld	iy,#_cy1
	ld	e,0 (iy)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	(sp), hl
	ld	hl,#_cx2 + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	a,c
	or	a, -4 (ix)
	ld	l,a
	ld	a,b
	or	a, -3 (ix)
	ld	h,a
	ld	a,#<(_map_buff)
	add	a, l
	ld	l,a
	ld	a,#>(_map_buff)
	adc	a, h
	ld	h,a
	ld	a,(hl)
	sub	a, #0x1F
	jr	NZ,00116$
	ex	de,hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,l
	or	a, c
	ld	l,a
	ld	a,h
	or	a, b
	ld	h,a
	ld	de,#_map_buff
	add	hl,de
	ld	a,(hl)
	sub	a, #0x0A
	jr	Z,00116$
	ld	a,(#_cx2 + 0)
	ld	(#__x + 0),a
	ld	a,(#_cy1 + 0)
	ld	(#__y + 0),a
	call	_map_set
	ld	de,#_s_11_spring2_psg+0
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
00116$:
;engine/player.c:259: oppossee = ppossee;
	ld	a,(#_ppossee + 0)
	ld	(#_oppossee + 0),a
;engine/player.c:260: ppossee = 0;
	ld	hl,#_ppossee + 0
	ld	(hl), #0x00
;engine/player.c:332: if (vertical_engine_type != ENGINE_TYPE_SWIM) {
	ld	a,(#_vertical_engine_type + 0)
	sub	a, #0x02
	jr	Z,00123$
;engine/player.c:343: if (!pj) {
	ld	a,(#_pj + 0)
	or	a, a
	jr	NZ,00123$
;engine/player.c:344: pvy += PLAYER_G;
	ld	hl,#_pvy
	ld	a,(hl)
	add	a, #0x08
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;engine/player.c:345: if (pvy > PLAYER_VY_FALLING_MAX) pvy = PLAYER_VY_FALLING_MAX; 
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	a,#0x01
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00584$
	xor	a, #0x80
00584$:
	jp	P,00123$
	ld	hl,#0x0100
	ld	(_pvy),hl
00123$:
;engine/player.c:352: if (pgotten) pvy = 0;			
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00125$
	ld	hl,#0x0000
	ld	(_pvy),hl
00125$:
;engine/player.c:389: py += pvy;
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
;engine/player.c:390: if (py < 0) py = 0;
	ld	a,(#_py + 1)
	bit	7,a
	jr	Z,00127$
	ld	hl,#0x0000
	ld	(_py),hl
00127$:
;engine/player.c:391: pry = py >> FIXBITS;
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
;engine/player.c:394: player_to_pixels ();
	call	_player_to_pixels
;engine/player.c:396: cx1 = prx >> 4;
	ld	a,(#_prx + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx1 + 0),a
;engine/player.c:397: cx2 = (prx + 7) >> 4;
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
;engine/player.c:402: rds16 = pvy + pgtmy;
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
;engine/player.c:230: cy1 = cy2 = (pry + 15) >> 4;
	ld	iy,#_pry
	ld	e,0 (iy)
	ld	d,#0x00
;engine/player.c:403: if (rds16 < 0)
	ld	a,(#_rds16 + 1)
	bit	7,a
	jp	Z,00163$
;engine/player.c:406: cy1 = cy2 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;			
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
;engine/player.c:407: cm_two_points ();
	call	_cm_two_points
;engine/player.c:408: if ((at1 & 8) || (at2 & 8)) {
	ld	iy,#_at1
	bit	3, 0 (iy)
	jr	NZ,00131$
	ld	iy,#_at2
	bit	3, 0 (iy)
	jr	Z,00132$
00131$:
;engine/player.c:409: pry = ((cy1 + 1) << 4) + PLAYER_COLLISION_VSTRETCH_BG;
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
;engine/player.c:410: pvy = 0; py = pry << FIXBITS;
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
;engine/player.c:411: pgotten = 0;
	ld	iy,#_pgotten
	ld	0 (iy),#0x00
;engine/player.c:412: pfiring = 1;
	ld	iy,#_pfiring
	ld	0 (iy),#0x01
	jp	00164$
00132$:
;engine/player.c:418: } else if ((at1 & 1) || (at2 & 1)) {
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00128$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jp	Z,00164$
00128$:
;engine/player.c:419: hitv = 1;
	ld	iy,#_hitv
	ld	0 (iy),#0x01
	jp	00164$
00163$:
;engine/player.c:430: } else if (rds16 > 0)
	xor	a, a
	ld	iy,#_rds16
	cp	a, 0 (iy)
	ld	iy,#_rds16
	sbc	a, 1 (iy)
	jp	PO, 00591$
	xor	a, #0x80
00591$:
	jp	P,00164$
;engine/player.c:433: cy1 = cy2 = (pry + 16) >> 4; 
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
;engine/player.c:434: cm_two_points (); 
	call	_cm_two_points
;engine/player.c:439: pry < ((cy1 - 1) << 4) + 4 && 
	ld	iy,#_cy1
	ld	l,0 (iy)
	ld	h,#0x00
	dec	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a,(#_pry + 0)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
;engine/player.c:418: } else if ((at1 & 1) || (at2 & 1)) {
	ld	a,(#_at1 + 0)
	and	a, #0x01
	ld	c,a
	ld	iy,#_at2
	ld	a,0 (iy)
	and	a, #0x01
	ld	-2 (ix),a
;engine/player.c:439: pry < ((cy1 - 1) << 4) + 4 && 
	ld	a,-4 (ix)
	sub	a, e
	ld	a,-3 (ix)
	sbc	a, d
	jp	PO, 00592$
	xor	a, #0x80
00592$:
	jp	P,00156$
;engine/player.c:441: (at1 & 12) || (at2 & 12)
	ld	a,(#_at1 + 0)
	and	a, #0x0C
	jr	NZ,00155$
	ld	a,(#_at2 + 0)
	and	a, #0x0C
	jp	Z,00156$
00155$:
;engine/player.c:449: pvy = 0; pry = ((cy1 - 1) << 4);py = pry << FIXBITS;
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
;engine/player.c:450: pgotten = 0;
	ld	iy,#_pgotten
	ld	0 (iy),#0x00
;engine/player.c:451: pfiring = 1;
	ld	iy,#_pfiring
	ld	0 (iy),#0x01
;engine/player.c:452: ppossee = 1;
	ld	iy,#_ppossee
	ld	0 (iy),#0x01
;engine/player.c:476: cfx = 0;
	ld	iy,#_cfx
	ld	0 (iy),#0x00
;engine/player.c:477: if ((at1 & 40) == 40) { if (at1 & 1) cfx = pgtmx = PLAYER_VX_CONVEYORS; else cfx = pgtmx = -PLAYER_VX_CONVEYORS; pgotten = 1; } 
	ld	a,(#_at1 + 0)
	and	a, #0x28
	sub	a,#0x28
	jr	NZ,00139$
	or	a,c
	jr	Z,00136$
	ld	hl,#0x0030
	ld	(_pgtmx),hl
	ld	iy,#_cfx
	ld	0 (iy),#0x30
	jr	00137$
00136$:
	ld	hl,#0xFFD0
	ld	(_pgtmx),hl
	ld	iy,#_cfx
	ld	0 (iy),#0xD0
00137$:
	ld	iy,#_pgotten
	ld	0 (iy),#0x01
00139$:
;engine/player.c:478: if (cx1 != cx2) if ((at2 & 40) == 40) { if (at2 & 1) cfx = pgtmx = PLAYER_VX_CONVEYORS; else cfx = pgtmx = -PLAYER_VX_CONVEYORS; pgotten = 1; } 
	ld	a,(#_cx1 + 0)
	ld	iy,#_cx2
	sub	a, 0 (iy)
	jr	Z,00146$
	ld	a,(#_at2 + 0)
	and	a, #0x28
	sub	a, #0x28
	jr	NZ,00146$
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00141$
	ld	hl,#0x0030
	ld	(_pgtmx),hl
	ld	iy,#_cfx
	ld	0 (iy),#0x30
	jr	00142$
00141$:
	ld	hl,#0xFFD0
	ld	(_pgtmx),hl
	ld	iy,#_cfx
	ld	0 (iy),#0xD0
00142$:
	ld	iy,#_pgotten
	ld	0 (iy),#0x01
00146$:
;engine/player.c:486: if ((at1 & 1) || (at2 & 1)) pnotsafe = 1; 
	ld	a,c
	or	a, a
	jr	NZ,00147$
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00164$
00147$:
	ld	iy,#_pnotsafe
	ld	0 (iy),#0x01
	jr	00164$
00156$:
;engine/player.c:487: } else if ((at1 & 1) || (at2 & 1)) {
	ld	a,c
	or	a, a
	jr	NZ,00152$
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00164$
00152$:
;engine/player.c:488: if ((pry & 15) > 4) hitv = 1;
	ld	a,(#_pry + 0)
	and	a, #0x0F
	ld	h,a
	ld	a,#0x04
	sub	a, h
	jr	NC,00164$
	ld	iy,#_hitv
	ld	0 (iy),#0x01
00164$:
;engine/player.c:505: if (vertical_engine_type == ENGINE_TYPE_JUMP) {
	ld	a,(#_vertical_engine_type + 0)
	or	a, a
	jp	NZ,00187$
;engine/player.c:551: a_button 
	ld	a,(#_a_button + 0)
	or	a, a
	jr	Z,00170$
;engine/player.c:552: && !pj
	ld	a,(#_pj + 0)
	or	a, a
	jr	NZ,00170$
;engine/player.c:554: pgotten || ppossee || hitv
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	NZ,00169$
	ld	a,(#_ppossee + 0)
	or	a, a
	jr	NZ,00169$
	ld	a,(#_hitv + 0)
	or	a, a
	jr	Z,00170$
00169$:
;engine/player.c:560: jump_start ();
	call	_jump_start
;engine/player.c:563: if (!(pgotten || hitv || pnotsafe)) {
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	NZ,00170$
	ld	a,(#_hitv + 0)
	or	a, a
	jr	NZ,00170$
	ld	a,(#_pnotsafe + 0)
	or	a, a
	jr	NZ,00170$
;engine/player.c:564: player_register_safe_spot ();
	call	_player_register_safe_spot
00170$:
;engine/player.c:583: if (pad0 & PAD_A) {
	ld	iy,#_pad0
	bit	5, 0 (iy)
	jr	Z,00184$
;engine/player.c:584: if (pj) {
	ld	a,(#_pj + 0)
	or	a, a
	jr	Z,00187$
;engine/player.c:585: if (pctj < PLAYER_AY_JUMP) pvy -= (PLAYER_AY_JUMP - (pctj));
	ld	a,(#_pctj + 0)
	sub	a, #0x0C
	jr	NC,00176$
	ld	hl,#_pctj + 0
	ld	h, (hl)
	ld	l,#0x00
	ld	a,#0x0C
	sub	a, h
	ld	d,a
	ld	a,#0x00
	sbc	a, l
	ld	e,a
	ld	hl,#_pvy
	ld	a,(hl)
	sub	a, d
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	sbc	a, e
	ld	(hl),a
00176$:
;engine/player.c:586: if (pvy < -PLAYER_VY_JUMP_MAX) pvy = -PLAYER_VY_JUMP_MAX;
	ld	a,(#_pvy + 0)
	sub	a, #0x60
	ld	a,(#_pvy + 1)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00178$
	ld	hl,#0xFF60
	ld	(_pvy),hl
00178$:
;engine/player.c:587: ++ pctj; if (pctj == 16) pj = 0;	
	ld	iy,#_pctj
	inc	0 (iy)
	ld	a,(#_pctj + 0)
	sub	a, #0x10
	jr	NZ,00187$
	ld	iy,#_pj
	ld	0 (iy),#0x00
	jr	00187$
00184$:
;engine/player.c:590: pj = 0; 
	ld	iy,#_pj
	ld	0 (iy),#0x00
00187$:
;engine/player.c:642: if (!(pad0 & PAD_LEFT || pad0 & PAD_RIGHT)) {
	ld	a,(#_pad0 + 0)
	and	a, #0x04
	ld	d,a
	ld	e,#0x00
	ld	a,(#_pad0 + 0)
	and	a, #0x08
	ld	b,a
	ld	c,#0x00
	ld	a,e
	or	a,d
	jr	NZ,00198$
	ld	a,c
	or	a,b
	jr	NZ,00198$
;engine/player.c:650: if (pvx > 0) {
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00604$
	xor	a, #0x80
00604$:
	jp	P,00195$
;engine/player.c:655: pvx -= PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a,#0xF4
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
;engine/player.c:658: if (pvx < 0) pvx = 0;
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00198$
	ld	hl,#0x0000
	ld	(_pvx),hl
	jr	00198$
00195$:
;engine/player.c:659: } else if (pvx < 0) {
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00198$
;engine/player.c:664: pvx += PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, #0x0C
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;engine/player.c:667: if (pvx > 0) pvx = 0;
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00605$
	xor	a, #0x80
00605$:
	jp	P,00198$
	ld	hl,#0x0000
	ld	(_pvx),hl
00198$:
;engine/player.c:672: if (pad0 & PAD_LEFT) {
	ld	a,e
	or	a,d
	jr	Z,00203$
;engine/player.c:676: pfacing = CELL_FACING_LEFT;		
	ld	iy,#_pfacing
	ld	0 (iy),#0x08
;engine/player.c:679: if (pvx > -PLAYER_VX_MAX) {
	ld	a,#0x90
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	a,#0xFF
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00606$
	xor	a, #0x80
00606$:
	jp	P,00203$
;engine/player.c:684: pvx -= PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a,#0xF4
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
00203$:
;engine/player.c:689: if (pad0 & PAD_RIGHT) {
	ld	a,c
	or	a,b
	jr	Z,00207$
;engine/player.c:693: pfacing = CELL_FACING_RIGHT;
	ld	hl,#_pfacing + 0
	ld	(hl), #0x00
;engine/player.c:696: if (pvx < PLAYER_VX_MAX) {
	ld	a,(#_pvx + 0)
	sub	a, #0x70
	ld	a,(#_pvx + 1)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00207$
;engine/player.c:701: pvx += PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, #0x0C
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
00207$:
;engine/player.c:707: px += pvx;
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
;engine/player.c:709: if (pgotten) px += pgtmx;
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00209$
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
00209$:
;engine/player.c:712: if (px < (4<<FIXBITS)) { px = 4 << FIXBITS; prx = 4;}
	ld	a,(#_px + 1)
	xor	a, #0x80
	sub	a, #0x81
	jr	NC,00214$
	ld	hl,#0x0100
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0x04
	jr	00215$
00214$:
;engine/player.c:713: else if (px > (244<<FIXBITS)) { px = 244 << FIXBITS; prx = 244; }
	xor	a, a
	ld	iy,#_px
	cp	a, 0 (iy)
	ld	a,#0x3D
	ld	iy,#_px
	sbc	a, 1 (iy)
	jp	PO, 00607$
	xor	a, #0x80
00607$:
	jp	P,00211$
	ld	hl,#0x3D00
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0xF4
	jr	00215$
00211$:
;engine/player.c:714: else player_to_pixels ();
	call	_player_to_pixels
00215$:
;engine/player.c:719: cy1 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;
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
;engine/player.c:720: cy2 = (pry + 15) >> 4;
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
;engine/player.c:723: rds16 = pvx + pgtmx;
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
;engine/player.c:724: if (rds16) 	{
	ld	a,(#_rds16 + 1)
	ld	iy,#_rds16
	or	a,0 (iy)
	jp	Z,00232$
;engine/player.c:725: if (rds16 < 0) {
	ld	a,(#_rds16 + 1)
	bit	7,a
	jr	Z,00217$
;engine/player.c:726: cx1 = cx2 = prx >> 4; 
	ld	a,(#_prx + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx2 + 0),a
;engine/player.c:727: rda = (cx1 + 1) << 4;
	ld	(#_cx1 + 0),a
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_rda + 0),a
;engine/player.c:728: rdm = cx1 - 1;
	ld	hl,#_rdm
	ld	a,(#_cx1 + 0)
	add	a,#0xFF
	ld	(hl),a
	jr	00218$
00217$:
;engine/player.c:730: cx1 = cx2 = (prx + 8) >> 4;
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
;engine/player.c:731: rda = ((cx1 - 1) << 4) + 8;
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
;engine/player.c:732: rdm = cx1 + 1;
	ld	hl,#_rdm
	ld	a,(#_cx1 + 0)
	inc	a
	ld	(hl),a
00218$:
;engine/player.c:748: cm_two_points ();
	call	_cm_two_points
;engine/player.c:749: if ((at1 & 8) || (at2 & 8)) {
	ld	iy,#_at1
	bit	3, 0 (iy)
	jr	NZ,00225$
	ld	iy,#_at2
	bit	3, 0 (iy)
	jp	Z,00226$
00225$:
;engine/player.c:750: pvx = 0; prx = rda; px = prx << FIXBITS; pfiring = 1;
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
;engine/player.c:754: if (at1 & 2) player_process_tile (at1, cx1, cy1, rdm, cy1);
	ld	iy,#_at1
	bit	1, 0 (iy)
	jr	Z,00220$
	ld	a,(_cy1)
	push	af
	inc	sp
	ld	a,(_rdm)
	push	af
	inc	sp
	ld	a,(_cy1)
	push	af
	inc	sp
	ld	a,(_cx1)
	push	af
	inc	sp
	ld	a,(_at1)
	push	af
	inc	sp
	call	_player_process_tile
	pop	af
	pop	af
	inc	sp
00220$:
;engine/player.c:755: if (cy1 != cy2) if (at2 & 2) player_process_tile (at2, cx1, cy2, rdm, cy2);
	ld	a,(#_cy1 + 0)
	ld	iy,#_cy2
	sub	a, 0 (iy)
	jr	Z,00227$
	ld	iy,#_at2
	bit	1, 0 (iy)
	jr	Z,00227$
	ld	a,(_cy2)
	push	af
	inc	sp
	ld	a,(_rdm)
	push	af
	inc	sp
	ld	a,(_cy2)
	push	af
	inc	sp
	ld	a,(_cx1)
	push	af
	inc	sp
	ld	a,(_at2)
	push	af
	inc	sp
	call	_player_process_tile
	pop	af
	pop	af
	inc	sp
	jr	00227$
00226$:
;engine/player.c:758: hith = ((at1 & 1) || (at2 & 1));
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00259$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jr	NZ,00259$
	ld	a,#0x00
	jr	00260$
00259$:
	ld	a,#0x01
00260$:
	ld	iy,#_hith
	ld	0 (iy),a
00227$:
;engine/player.c:761: if (pvy > 0) hith &= ((pry & 15) > 4);
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00618$
	xor	a, #0x80
00618$:
	jp	P,00232$
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
;engine/player.c:789: phit = 0;
	ld	(#_hith + 0),a
00232$:
	ld	iy,#_phit
	ld	0 (iy),#0x00
;engine/player.c:791: if (pgotten == 0) {
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00247$
;engine/player.c:799: if (hitv) { phit = 1; pvy = ADD_SIGN (-pvy, PLAYER_V_REBOUND); pry = pcy; py = pry << FIXBITS; } 
	ld	a,(#_hitv + 0)
	or	a, a
	jr	Z,00236$
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
	jr	Z,00261$
	xor	a, a
	cp	a, h
	sbc	a, l
	jp	PO, 00619$
	xor	a, #0x80
00619$:
	jp	P,00263$
	ld	hl,#0x00E0
	jr	00262$
00263$:
	ld	hl,#0xFF20
	jr	00262$
00261$:
	ld	hl,#0x0000
00262$:
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
	jr	00237$
00236$:
;engine/player.c:803: if (hith) { phit = 1; pvx = ADD_SIGN (-pvx, PLAYER_V_REBOUND); prx = pcx; px = prx << FIXBITS; }
	ld	a,(#_hith + 0)
	or	a, a
	jr	Z,00237$
	ld	hl,#_phit + 0
	ld	(hl), #0x01
	xor	a, a
	ld	iy,#_pvx
	sub	a, 0 (iy)
	ld	h,a
	ld	a, #0x00
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	ld	l,a
	or	a,h
	jr	Z,00265$
	xor	a, a
	cp	a, h
	sbc	a, l
	jp	PO, 00620$
	xor	a, #0x80
00620$:
	jp	P,00267$
	ld	hl,#0x00E0
	jr	00266$
00267$:
	ld	hl,#0xFF20
	jr	00266$
00265$:
	ld	hl,#0x0000
00266$:
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
00237$:
;engine/player.c:807: cx1 = cx2 = (prx + 4) >> 4;
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
;engine/player.c:808: cy1 = pry >> 4; cy2 = (pry + 15) >> 4;
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
;engine/player.c:809: cm_two_points ();
	call	_cm_two_points
;engine/player.c:810: if ((at1 & 1) || (at2 & 1)) phit = 1;
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00238$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jr	Z,00239$
00238$:
	ld	iy,#_phit
	ld	0 (iy),#0x01
00239$:
;engine/player.c:813: if (!pflickering && !pbouncing) if (phit) { 
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00247$
	ld	a,(#_pbouncing + 0)
	or	a, a
	jr	NZ,00247$
	ld	a,(#_phit + 0)
	or	a, a
	jr	Z,00247$
;engine/player.c:814: player_to_pixels ();
	call	_player_to_pixels
;engine/player.c:815: en_sg_2 = 1;
	ld	iy,#_en_sg_2
	ld	0 (iy),#0x01
;engine/player.c:822: pkill = en_sg_2;
	ld	iy,#_pkill
	ld	0 (iy),#0x01
00247$:
;engine/../my/player_frame_selector.h:37: if (ppossee || pgotten) {
	ld	a,(#_ppossee + 0)
	or	a, a
	jr	NZ,00252$
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00253$
00252$:
;engine/../my/player_frame_selector.h:39: if (pvx > PLAYER_VX_MIN || pvx < -PLAYER_VX_MIN) {
	ld	a,#0x18
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00624$
	xor	a, #0x80
00624$:
	jp	M,00248$
	ld	a,(#_pvx + 0)
	sub	a, #0xE8
	ld	a,(#_pvx + 1)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00249$
00248$:
;engine/../my/player_frame_selector.h:40: psprid = CELL_WALK_CYCLE + ((prx >> 3) & 3);
	ld	a,(#_prx + 0)
	rrca
	rrca
	rrca
	and	a,#0x1F
	and	a, #0x03
	ld	hl,#_psprid
	inc	a
	ld	(hl),a
	jr	00254$
00249$:
;engine/../my/player_frame_selector.h:42: psprid = CELL_IDLE;
	ld	hl,#_psprid + 0
	ld	(hl), #0x00
	jr	00254$
00253$:
;engine/../my/player_frame_selector.h:45: psprid = CELL_AIRBORNE;
	ld	hl,#_psprid + 0
	ld	(hl), #0x05
00254$:
;engine/../my/player_frame_selector.h:55: psprid += pfacing;
	ld	hl,#_pfacing
	push	de
	ld	iy,#_psprid
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	pop	de
;engine/player.c:942: prx_old = prx;
	ld	a,(#_prx + 0)
	ld	(#_prx_old + 0),a
;engine/player.c:943: pry_old = pry;
	ld	a,(#_pry + 0)
	ld	(#_pry_old + 0),a
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
