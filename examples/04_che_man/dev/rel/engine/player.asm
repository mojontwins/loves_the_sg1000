;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 14:35:22 2019
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
	.globl _run_fire_script
	.globl _cm_two_points
	.globl _map_set
	.globl _delay
	.globl _PSGSFXPlay
	.globl _music_pause
	.globl _SG_resetPauseRequest
	.globl _SG_setStp
	.globl _SG_addMetaSprite
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
;./engine/player.c:32: void player_register_safe_spot (void) {
;	---------------------------------
; Function player_register_safe_spot
; ---------------------------------
_player_register_safe_spot::
;./engine/player.c:33: px_safe = px;
	ld	hl,(_px)
	ld	(_px_safe),hl
;./engine/player.c:34: py_safe = py;
	ld	hl,(_py)
	ld	(_py_safe),hl
;./engine/player.c:35: n_pant_safe = n_pant;
	ld	a,(#_n_pant + 0)
	ld	(#_n_pant_safe + 0),a
	ret
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
;./engine/player.c:63: pkeys = 0;
	ld	hl,#_pkeys + 0
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
;./engine/player.c:89: player_register_safe_spot ();
	call	_player_register_safe_spot
;./engine/player.c:99: vertical_engine_type = ENGINE_TYPE_JUMP;
	ld	hl,#_vertical_engine_type + 0
	ld	(hl), #0x00
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
	call	_SG_addMetaSprite
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
;./engine/player.c:154: music_pause (1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_music_pause
	inc	sp
;./engine/player.c:155: delay (60);
	ld	a,#0x3C
	push	af
	inc	sp
	call	_delay
	inc	sp
;./engine/player.c:160: px = px_safe; 
	ld	hl,(_px_safe)
	ld	(_px),hl
;./engine/player.c:161: py = py_safe; 
	ld	hl,(_py_safe)
	ld	(_py),hl
;./engine/player.c:162: player_to_pixels ();
	call	_player_to_pixels
;./engine/player.c:163: n_pant = n_pant_safe;		
	ld	a,(#_n_pant_safe + 0)
	ld	(#_n_pant + 0),a
;./engine/player.c:164: player_stop ();
	call	_player_stop
;./engine/player.c:165: music_pause (0);
	xor	a, a
	push	af
	inc	sp
	call	_music_pause
	inc	sp
;./engine/player.c:167: HW_resetPauseRequest ();
	jp  _SG_resetPauseRequest
;./engine/../engine/playermods/process_tile.h:4: void player_process_tile (unsigned char at, unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1) {
;	---------------------------------
; Function player_process_tile
; ---------------------------------
_player_process_tile::
	push	ix
	ld	ix,#0
	add	ix,sp
;./engine/../engine/playermods/process_tile.h:5: if (y0) -- y0;
	ld	a,6 (ix)
	or	a, a
	jr	Z,00102$
	dec	6 (ix)
00102$:
;./engine/../engine/playermods/process_tile.h:46: at == 10 &&
	ld	a,4 (ix)
	sub	a, #0x0A
	jp	NZ,00112$
;./engine/../engine/playermods/process_tile.h:47: pkeys
	ld	a,(#_pkeys + 0)
	or	a, a
	jp	Z,00112$
;./engine/../engine/playermods/process_tile.h:49: _x = x0; _y = y0; _t = 0; map_set ();
	ld	a,5 (ix)
	ld	(#__x + 0),a
	ld	a,6 (ix)
	ld	(#__y + 0),a
	ld	hl,#__t + 0
	ld	(hl), #0x00
	call	_map_set
;./engine/../engine/playermods/process_tile.h:52: gp_gen = (unsigned char *) c_locks;
	ld	hl,(_c_locks)
	ld	(_gp_gen),hl
;./engine/../engine/playermods/process_tile.h:53: gpit = c_max_bolts; while (gpit --) {
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
;./engine/../engine/playermods/process_tile.h:54: rda = *gp_gen ++; rdb = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00144$
	ld	hl, #_gp_gen+1
	inc	(hl)
00144$:
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdb + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00145$
	ld	hl, #_gp_gen+1
	inc	(hl)
00145$:
;./engine/../engine/playermods/process_tile.h:55: if (n_pant == rda && COORDS (x0, y0) == rdb) {
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
;./engine/../engine/playermods/process_tile.h:56: lkact [gpit] = 0;
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
;./engine/../engine/playermods/process_tile.h:60: -- pkeys;
	ld	hl, #_pkeys+0
	dec	(hl)
;./engine/../engine/playermods/process_tile.h:61: PSGSFXPlay (SFX_TILE, 2);
	ld	de,#_s_01_tile3_psg+0
	ld	a,#0x02
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
00112$:
	pop	ix
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
	push	af
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
;./engine/player.c:255: if (springs_on && cy1 < 12) {
	ld	a,(#_springs_on + 0)
	or	a, a
	jp	Z,00116$
;./engine/player.c:256: if (cy1) -- cy1;
	ld	a,(#_cy1 + 0)
	cp	a,#0x0C
	jp	NC,00116$
	or	a, a
	jr	Z,00106$
	ld	hl, #_cy1+0
	dec	(hl)
00106$:
;./engine/player.c:257: _t = SPRING_SPIKE_TILE; 
	ld	hl,#__t + 0
	ld	(hl), #0x0D
;./engine/player.c:259: if (ppossee)
	ld	a,(#_ppossee + 0)
	or	a, a
	jp	Z,00116$
;./engine/player.c:262: if (QTILE (cx1, cy1 + 1) == SPRING_TILE && QTILE (cx1, cy1) != SPRING_SPIKE_TILE) { _x = cx1; _y = cy1; map_set (); PSGSFXPlay (SFX_SPRING, 1); }
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
	sub	a, #0x17
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
	sub	a, #0x0D
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
;./engine/player.c:263: if (QTILE (cx2, cy1 + 1) == SPRING_TILE && QTILE (cx2, cy1) != SPRING_SPIKE_TILE) { _x = cx2; _y = cy1; map_set (); PSGSFXPlay (SFX_SPRING, 1);	}
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
	sub	a, #0x17
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
	sub	a, #0x0D
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
;./engine/player.c:268: oppossee = ppossee;
	ld	a,(#_ppossee + 0)
	ld	(#_oppossee + 0),a
;./engine/player.c:269: ppossee = 0;
	ld	hl,#_ppossee + 0
	ld	(hl), #0x00
;./engine/player.c:341: if (vertical_engine_type != ENGINE_TYPE_SWIM) {
	ld	a,(#_vertical_engine_type + 0)
	sub	a, #0x02
	jr	Z,00123$
;./engine/player.c:352: if (!pj) {
	ld	a,(#_pj + 0)
	or	a, a
	jr	NZ,00123$
;./engine/player.c:353: pvy += PLAYER_G;
	ld	hl,#_pvy
	ld	a,(hl)
	add	a, #0x10
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;./engine/player.c:354: if (pvy > PLAYER_VY_FALLING_MAX) pvy = PLAYER_VY_FALLING_MAX; 
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	a,#0x01
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00565$
	xor	a, #0x80
00565$:
	jp	P,00123$
	ld	hl,#0x0100
	ld	(_pvy),hl
00123$:
;./engine/player.c:361: if (pgotten) pvy = 0;			
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	Z,00125$
	ld	hl,#0x0000
	ld	(_pvy),hl
00125$:
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
	jr	Z,00127$
	ld	hl,#0x0000
	ld	(_py),hl
00127$:
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
	jp	Z,00151$
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
	jr	NZ,00131$
	ld	iy,#_at2
	bit	3, 0 (iy)
	jr	Z,00132$
00131$:
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
	jp	00152$
00132$:
;./engine/player.c:435: } else if ((at1 & 1) || (at2 & 1)) {
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00128$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jp	Z,00152$
00128$:
;./engine/player.c:436: hitv = 1;
	ld	iy,#_hitv
	ld	0 (iy),#0x01
	jp	00152$
00151$:
;./engine/player.c:447: } else if (rds16 > 0)
	xor	a, a
	ld	iy,#_rds16
	cp	a, 0 (iy)
	ld	iy,#_rds16
	sbc	a, 1 (iy)
	jp	PO, 00572$
	xor	a, #0x80
00572$:
	jp	P,00152$
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
;./engine/player.c:435: } else if ((at1 & 1) || (at2 & 1)) {
	ld	a,(#_at1 + 0)
	and	a, #0x01
	ld	c,a
	ld	iy,#_at2
	ld	a,0 (iy)
	and	a, #0x01
	ld	-2 (ix),a
;./engine/player.c:456: pry < ((cy1 - 1) << 4) + 4 && 
	ld	a,-4 (ix)
	sub	a, e
	ld	a,-3 (ix)
	sbc	a, d
	jp	PO, 00573$
	xor	a, #0x80
00573$:
	jp	P,00144$
;./engine/player.c:458: (at1 & 12) || (at2 & 12)
	ld	a,(#_at1 + 0)
	and	a, #0x0C
	jr	NZ,00143$
	ld	a,(#_at2 + 0)
	and	a, #0x0C
	jr	Z,00144$
00143$:
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
	ld	a,c
	or	a, a
	jr	NZ,00135$
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00152$
00135$:
	ld	iy,#_pnotsafe
	ld	0 (iy),#0x01
	jr	00152$
00144$:
;./engine/player.c:509: if ((at1 & 1) || (at2 & 1)) {
	ld	a,c
	or	a, a
	jr	NZ,00140$
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00152$
00140$:
;./engine/player.c:510: if ((pry & 15) > 4) hitv = 1;
	ld	a,(#_pry + 0)
	and	a, #0x0F
	ld	h,a
	ld	a,#0x04
	sub	a, h
	jr	NC,00152$
	ld	iy,#_hitv
	ld	0 (iy),#0x01
00152$:
;./engine/player.c:528: if (vertical_engine_type == ENGINE_TYPE_JUMP) {
	ld	a,(#_vertical_engine_type + 0)
	or	a, a
	jp	NZ,00178$
;./engine/player.c:576: if (pad0 & PAD_A) {
	ld	iy,#_pad0
	bit	5, 0 (iy)
	jr	Z,00164$
;./engine/player.c:578: !pjb  
	ld	a,(#_pjb + 0)
	or	a, a
	jr	NZ,00158$
;./engine/player.c:579: && !pj
	ld	a,(#_pj + 0)
	or	a, a
	jr	NZ,00158$
;./engine/player.c:581: pgotten || ppossee || hitv
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	NZ,00157$
	ld	a,(#_ppossee + 0)
	or	a, a
	jr	NZ,00157$
	ld	a,(#_hitv + 0)
	or	a, a
	jr	Z,00158$
00157$:
;./engine/player.c:587: jump_start ();
	call	_jump_start
;./engine/player.c:590: if (!(pgotten || hitv || pnotsafe)) {
	ld	a,(#_pgotten + 0)
	or	a, a
	jr	NZ,00158$
	ld	a,(#_hitv + 0)
	or	a, a
	jr	NZ,00158$
	ld	a,(#_pnotsafe + 0)
	or	a, a
	jr	NZ,00158$
;./engine/player.c:591: player_register_safe_spot ();
	call	_player_register_safe_spot
00158$:
;./engine/player.c:603: pjb = 1;
	ld	iy,#_pjb
	ld	0 (iy),#0x01
	jr	00165$
00164$:
;./engine/player.c:604: } else pjb = 0;
	ld	iy,#_pjb
	ld	0 (iy),#0x00
00165$:
;./engine/player.c:613: if (pad0 & PAD_A) {
	ld	iy,#_pad0
	bit	5, 0 (iy)
	jr	Z,00175$
;./engine/player.c:614: if (pj) {
	ld	a,(#_pj + 0)
	or	a, a
	jr	Z,00178$
;./engine/player.c:615: if (pctj < PLAYER_AY_JUMP) pvy -= (PLAYER_AY_JUMP - (pctj));
	ld	a,(#_pctj + 0)
	sub	a, #0x10
	jr	NC,00167$
	ld	hl,#_pctj + 0
	ld	h, (hl)
	ld	l,#0x00
	ld	a,#0x10
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
00167$:
;./engine/player.c:616: if (pvy < -PLAYER_VY_JUMP_MAX) pvy = -PLAYER_VY_JUMP_MAX;
	ld	a,(#_pvy + 1)
	xor	a, #0x80
	sub	a, #0x7F
	jr	NC,00169$
	ld	hl,#0xFF00
	ld	(_pvy),hl
00169$:
;./engine/player.c:617: ++ pctj; if (pctj == 16) pj = 0;	
	ld	iy,#_pctj
	inc	0 (iy)
	ld	a,(#_pctj + 0)
	sub	a, #0x10
	jr	NZ,00178$
	ld	iy,#_pj
	ld	0 (iy),#0x00
	jr	00178$
00175$:
;./engine/player.c:620: pj = 0; 
	ld	iy,#_pj
	ld	0 (iy),#0x00
00178$:
;./engine/player.c:672: if (!(pad0 & PAD_LEFT || pad0 & PAD_RIGHT)) {
	ld	a,(#_pad0 + 0)
	and	a, #0x04
	ld	d,a
	ld	a,(#_pad0 + 0)
	and	a, #0x08
	ld	e,a
	ld	a,d
	or	a,a
	jr	NZ,00189$
	or	a,e
	jr	NZ,00189$
;./engine/player.c:680: if (pvx > 0) {
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00581$
	xor	a, #0x80
00581$:
	jp	P,00186$
;./engine/player.c:685: pvx -= PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a,#0xF8
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
;./engine/player.c:688: if (pvx < 0) pvx = 0;
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00189$
	ld	hl,#0x0000
	ld	(_pvx),hl
	jr	00189$
00186$:
;./engine/player.c:689: } else if (pvx < 0) {
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00189$
;./engine/player.c:694: pvx += PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, #0x08
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;./engine/player.c:697: if (pvx > 0) pvx = 0;
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00582$
	xor	a, #0x80
00582$:
	jp	P,00189$
	ld	hl,#0x0000
	ld	(_pvx),hl
00189$:
;./engine/player.c:702: if (pad0 & PAD_LEFT) {
	ld	a,d
	or	a, a
	jr	Z,00194$
;./engine/player.c:706: pfacing = CELL_FACING_LEFT;		
	ld	iy,#_pfacing
	ld	0 (iy),#0x05
;./engine/player.c:709: if (pvx > -PLAYER_VX_MAX) {
	ld	a,#0x80
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	a,#0xFF
	ld	iy,#_pvx
	sbc	a, 1 (iy)
	jp	PO, 00583$
	xor	a, #0x80
00583$:
	jp	P,00194$
;./engine/player.c:714: pvx -= PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a,#0xF0
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
00194$:
;./engine/player.c:719: if (pad0 & PAD_RIGHT) {
	ld	a,e
	or	a, a
	jr	Z,00198$
;./engine/player.c:723: pfacing = CELL_FACING_RIGHT;
	ld	hl,#_pfacing + 0
	ld	(hl), #0x00
;./engine/player.c:726: if (pvx < PLAYER_VX_MAX) {
	ld	a,(#_pvx + 0)
	sub	a, #0x80
	ld	a,(#_pvx + 1)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00198$
;./engine/player.c:731: pvx += PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, #0x10
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
00198$:
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
	jr	Z,00200$
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
00200$:
;./engine/player.c:742: if (px < (4<<FIXBITS)) { px = 4 << FIXBITS; prx = 4;}
	ld	a,(#_px + 1)
	xor	a, #0x80
	sub	a, #0x81
	jr	NC,00205$
	ld	hl,#0x0100
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0x04
	jr	00206$
00205$:
;./engine/player.c:743: else if (px > (244<<FIXBITS)) { px = 244 << FIXBITS; prx = 244; }
	xor	a, a
	ld	iy,#_px
	cp	a, 0 (iy)
	ld	a,#0x3D
	ld	iy,#_px
	sbc	a, 1 (iy)
	jp	PO, 00584$
	xor	a, #0x80
00584$:
	jp	P,00202$
	ld	hl,#0x3D00
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0xF4
	jr	00206$
00202$:
;./engine/player.c:744: else player_to_pixels ();
	call	_player_to_pixels
00206$:
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
	ld	hl,#_rds16 + 0
	or	a,(hl)
	jp	Z,00223$
;./engine/player.c:755: if (rds16 < 0) {
	ld	a,(#_rds16 + 1)
	bit	7,a
	jr	Z,00208$
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
	jr	00209$
00208$:
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
00209$:
;./engine/player.c:783: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:787: if ((at1 & 8) || (at2 & 8)) 
	ld	iy,#_at1
	bit	3, 0 (iy)
	jr	NZ,00216$
	ld	iy,#_at2
	bit	3, 0 (iy)
	jp	Z,00217$
00216$:
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
;./engine/player.c:794: if (at1 & 2) player_process_tile (at1, cx1, cy1, rdm, cy1);
	ld	iy,#_at1
	bit	1, 0 (iy)
	jr	Z,00211$
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
00211$:
;./engine/player.c:795: if (cy1 != cy2) if (at2 & 2) player_process_tile (at2, cx1, cy2, rdm, cy2);
	ld	a,(#_cy1 + 0)
	ld	iy,#_cy2
	sub	a, 0 (iy)
	jr	Z,00218$
	ld	iy,#_at2
	bit	1, 0 (iy)
	jr	Z,00218$
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
	jr	00218$
00217$:
;./engine/player.c:802: hith = ((at1 & 1) || (at2 & 1));
	ld	iy,#_at1
	bit	0, 0 (iy)
	jr	NZ,00248$
	ld	iy,#_at2
	bit	0, 0 (iy)
	jr	NZ,00248$
	ld	a,#0x00
	jr	00249$
00248$:
	ld	a,#0x01
00249$:
	ld	iy,#_hith
	ld	0 (iy),a
00218$:
;./engine/player.c:805: if (pvy > 0) hith &= ((pry & 15) > 4);
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00595$
	xor	a, #0x80
00595$:
	jp	P,00223$
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
	ld	(#_hith + 0),a
00223$:
;./engine/player.c:833: phit = 0;
	ld	hl,#_phit + 0
	ld	(hl), #0x00
;./engine/player.c:835: if (pgotten == 0) {
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00235$
;./engine/player.c:843: if (hitv) { phit = 1; pvy = ADD_SIGN (-pvy, PLAYER_V_REBOUND); pry = pcy; py = pry << FIXBITS; } 
	ld	a,(#_hitv + 0)
	or	a, a
	jr	Z,00227$
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
	jr	Z,00250$
	xor	a, a
	cp	a, h
	sbc	a, l
	jp	PO, 00596$
	xor	a, #0x80
00596$:
	jp	P,00252$
	ld	hl,#0x00E0
	jr	00251$
00252$:
	ld	hl,#0xFF20
	jr	00251$
00250$:
	ld	hl,#0x0000
00251$:
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
	jr	00228$
00227$:
;./engine/player.c:847: if (hith) { phit = 1; pvx = ADD_SIGN (-pvx, PLAYER_V_REBOUND); prx = pcx; px = prx << FIXBITS; }
	ld	a,(#_hith + 0)
	or	a, a
	jr	Z,00228$
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
	jr	Z,00254$
	xor	a, a
	cp	a, h
	sbc	a, l
	jp	PO, 00597$
	xor	a, #0x80
00597$:
	jp	P,00256$
	ld	hl,#0x00E0
	jr	00255$
00256$:
	ld	hl,#0xFF20
	jr	00255$
00254$:
	ld	hl,#0x0000
00255$:
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
00228$:
;./engine/player.c:857: if (!pflickering && !pbouncing) if (phit) { 
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00235$
	ld	a,(#_pbouncing + 0)
	or	a, a
	jr	NZ,00235$
	ld	a,(#_phit + 0)
	or	a, a
	jr	Z,00235$
;./engine/player.c:858: player_to_pixels ();
	call	_player_to_pixels
;./engine/player.c:859: en_sg_2 = 1;
	ld	hl,#_en_sg_2 + 0
	ld	(hl), #0x01
;./engine/player.c:866: pkill = en_sg_2;
	ld	hl,#_pkill + 0
	ld	(hl), #0x01
00235$:
;./engine/player.c:879: cx1 = cx2 = (prx + 4) >> 4;
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
;./engine/player.c:880: cy1 = cy2 = (pry + 8) >> 4;
	ld	iy,#_pry
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
	ld	(#_cy2 + 0),a
	ld	(#_cy1 + 0),a
;./engine/player.c:881: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:887: if (cy1 && at1 == 34) {
	ld	a,(#_cy1 + 0)
	or	a, a
	jr	Z,00237$
	ld	a,(#_at1 + 0)
	sub	a, #0x22
	jr	NZ,00237$
;./engine/player.c:888: -- cy1;
	ld	hl, #_cy1+0
	dec	(hl)
;./engine/player.c:890: _x = cx1; _y = cy1; _t = 0; map_set ();
	ld	a,(#_cx1 + 0)
	ld	(#__x + 0),a
	ld	a,(#_cy1 + 0)
	ld	(#__y + 0),a
	ld	hl,#__t + 0
	ld	(hl), #0x00
	call	_map_set
;./engine/player.c:891: PSGSFXPlay (SFX_RING, 1);
	ld	de,#_s_18_ring2_psg+0
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./engine/player.c:896: tile_got [(cy1 << 1) | (cx1 > 7)] |= bits [cx1 & 7];
	ld	de,#_tile_got+0
	ld	iy,#_cy1
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	a,#0x07
	ld	iy,#_cx1
	sub	a, 0 (iy)
	ld	a,#0x00
	rla
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	ld	a,l
	or	a, c
	ld	l,a
	ld	a,h
	or	a, b
	ld	h,a
	add	hl,de
	ex	de,hl
	ld	a,(de)
	ld	b,a
	ld	a,(#_cx1 + 0)
	and	a, #0x07
	add	a,#<(_bits)
	ld	l,a
	ld	a,#>(_bits)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	or	a, b
	ld	(de),a
00237$:
;./engine/player.c:924: b_button
	ld	a,(#_b_button + 0)
	or	a, a
	jr	Z,00244$
;./engine/../engine/playermods/scripting.h:14: if (b_button) {
	ld	a,(#_b_button + 0)
	or	a, a
	jr	Z,00244$
;./engine/../engine/playermods/scripting.h:15: run_fire_script ();
	call	_run_fire_script
;./engine/../engine/playermods/scripting.h:16: if (fire_script_success) b_button = 0;
	ld	a,(#_fire_script_success + 0)
	or	a, a
	jr	Z,00244$
	ld	hl,#_b_button + 0
	ld	(hl), #0x00
00244$:
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
