;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module player
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _player_move
	.globl _bullets_move
	.globl _bullets_destroy
	.globl _fire_bullet
	.globl _player_process_tile
	.globl _player_kill
	.globl _player_to_pixels
	.globl _player_render
	.globl _player_init
	.globl _player_stop
	.globl _breakable_break
	.globl _update_cycle
	.globl _cm_two_points
	.globl _map_set
	.globl _PSGSFXPlay
	.globl _SG_setStp
	.globl _SG_addMetaSprite1x1
	.globl _SG_addSprite
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
;./engine/player.c:49: pfacing = CELL_FACING_DOWN;
	ld	hl,#_pfacing + 0
	ld	(hl), #0x06
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
;./engine/player.c:78: pammo = MAX_AMMO;
	ld	hl,#_pammo + 0
	ld	(hl), #0x63
;./engine/player.c:86: pflickering = pbouncing = 0;
	ld	hl,#_pbouncing + 0
	ld	(hl), #0x00
	ld	hl,#_pflickering + 0
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
	ld	iy,#_psprid
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_spr_player
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;./engine/player.c:121: prx - 4, pry + SPRITE_ADJUST, 
	ld	a,(#_pry + 0)
	add	a, #0xf7
	ld	e,a
	ld	a,(#_prx + 0)
	add	a,#0xfc
	ld	d,a
	push	bc
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
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
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_s_05_phit3_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./engine/player.c:139: if (plife) -- plife; else game_over = 1;
	ld	iy,#_plife
	ld	a,0 (iy)
	or	a, a
	jr	Z,00102$
	dec	0 (iy)
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
;./engine/../engine/playermods/process_tile.h:4: void player_process_tile (unsigned char at, unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1) {
;	---------------------------------
; Function player_process_tile
; ---------------------------------
_player_process_tile::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./engine/../engine/playermods/process_tile.h:5: if (y0) -- y0;
	ld	a,6 (ix)
	or	a, a
	jr	Z,00102$
	dec	6 (ix)
00102$:
;./engine/../engine/playermods/process_tile.h:9: if (y1) -- y1;
	ld	a,8 (ix)
	or	a, a
	jr	Z,00104$
	dec	8 (ix)
00104$:
;./engine/../engine/playermods/process_tile.h:29: _x = x0; _y = y0; _t = PUSH_ERASE;  map_set ();
	ld	c,5 (ix)
	ld	a,6 (ix)
	ld	-1 (ix),a
;./engine/../engine/playermods/process_tile.h:13: && b_button
	ld	a,4 (ix)
	sub	a, #0x0b
	jp	NZ,00112$
	ld	iy,#_b_button
	ld	a,0 (iy)
	or	a, a
	jp	Z,00112$
;./engine/../engine/playermods/process_tile.h:16: b_button = 0;
	ld	0 (iy),#0x00
;./engine/../engine/playermods/process_tile.h:19: x0 > 0 && x0 < 15 && y0 > 0 && y0 < 11 &&
	ld	a,5 (ix)
	or	a, a
	jr	Z,00112$
	ld	a,5 (ix)
	sub	a, #0x0f
	jr	NC,00112$
	ld	a,6 (ix)
	or	a, a
	jr	Z,00112$
	ld	a,6 (ix)
	sub	a, #0x0b
	jr	NC,00112$
;./engine/../engine/playermods/process_tile.h:20: ATTR (x1, y1) == 0
	ld	l,8 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, 7 (ix)
	ld	d, #0x00
	or	a, l
	ld	e,a
	ld	a,d
	or	a, h
	ld	d,a
	ld	hl,#_map_buff
	add	hl,de
	ld	e,(hl)
	ld	iy,(_c_behs)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jr	NZ,00112$
;./engine/../engine/playermods/process_tile.h:28: PSGSFXPlay (SFX_TILE, 2);
	push	bc
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#_s_01_tile3_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
	pop	bc
;./engine/../engine/playermods/process_tile.h:29: _x = x0; _y = y0; _t = PUSH_ERASE;  map_set ();
	ld	hl,#__x + 0
	ld	(hl), c
	ld	a,-1 (ix)
	ld	(#__y + 0),a
	ld	hl,#__t + 0
	ld	(hl), #0x1a
	push	bc
	call	_map_set
	pop	bc
;./engine/../engine/playermods/process_tile.h:30: _x = x1; _y = y1; _t = 14; map_set ();
	ld	a,7 (ix)
	ld	(#__x + 0),a
	ld	a,8 (ix)
	ld	(#__y + 0),a
	ld	hl,#__t + 0
	ld	(hl), #0x0e
	push	bc
	call	_map_set
	pop	bc
00112$:
;./engine/../engine/playermods/process_tile.h:46: at == 10 &&
	ld	a,4 (ix)
	sub	a, #0x0a
	jp	NZ,00123$
;./engine/../engine/playermods/process_tile.h:47: pkeys
	ld	a,(#_pkeys + 0)
	or	a, a
	jp	Z,00123$
;./engine/../engine/playermods/process_tile.h:49: _x = x0; _y = y0; _t = 0; map_set ();
	ld	5 (ix),c
	ld	hl,#__x + 0
	ld	(hl), c
	ld	a,-1 (ix)
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
00117$:
	ld	iy,#_gpit
	ld	e,0 (iy)
	dec	0 (iy)
	ld	a,e
	or	a, a
	jr	Z,00119$
;./engine/../engine/playermods/process_tile.h:54: rda = *gp_gen ++; rdb = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	iy,#_gp_gen
	inc	0 (iy)
	jr	NZ,00189$
	inc	1 (iy)
00189$:
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdb + 0),a
	ld	iy,#_gp_gen
	inc	0 (iy)
	jr	NZ,00190$
	inc	1 (iy)
00190$:
;./engine/../engine/playermods/process_tile.h:55: if (n_pant == rda && COORDS (x0, y0) == rdb) {
	ld	a,(#_n_pant + 0)
	ld	iy,#_rda
	sub	a, 0 (iy)
	jr	NZ,00117$
	ld	l,6 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, 5 (ix)
	ld	b, #0x00
	or	a, l
	ld	c,a
	ld	a,b
	or	a, h
	ld	b,a
	ld	hl,#_rdb + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	a,c
	sub	a, e
	jr	NZ,00117$
	ld	a,b
	sub	a, d
	jr	NZ,00117$
;./engine/../engine/playermods/process_tile.h:56: lkact [gpit] = 0;
	ld	a,#<(_lkact)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_lkact)
	adc	a, #0x00
	ld	b,a
	xor	a, a
	ld	(bc),a
	jr	00117$
00119$:
;./engine/../engine/playermods/process_tile.h:60: -- pkeys;
	ld	hl, #_pkeys+0
	dec	(hl)
;./engine/../engine/playermods/process_tile.h:61: PSGSFXPlay (SFX_TILE, 2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#_s_01_tile3_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
00123$:
	inc	sp
	pop	ix
	ret
;./engine/../engine/playermods/bullets.h:4: void fire_bullet (void) {
;	---------------------------------
; Function fire_bullet
; ---------------------------------
_fire_bullet::
	dec	sp
;./engine/../engine/playermods/bullets.h:6: if (!pammo) return;
	ld	a,(#_pammo + 0)
	or	a, a
	jp	Z,00110$
;./engine/../engine/playermods/bullets.h:7: -- pammo;
	ld	hl, #_pammo+0
	dec	(hl)
;./engine/../engine/playermods/bullets.h:12: if (b_slots_i == 0) return;
	ld	a,(#_b_slots_i + 0)
	or	a, a
	jp	Z,00110$
;./engine/../engine/playermods/bullets.h:13: -- b_slots_i; bi = b_slots [b_slots_i];
	ld	hl, #_b_slots_i+0
	dec	(hl)
	ld	bc,#_b_slots+0
	ld	hl,(_b_slots_i)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	(#_bi + 0),a
;./engine/../engine/playermods/bullets.h:18: bst [bi] = 1;
	ld	bc,#_bst+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x01
;./engine/../engine/playermods/bullets.h:25: switch (pfacing) {
	ld	iy,#_pfacing
	ld	a,0 (iy)
	or	a, a
	jr	Z,00106$
	ld	a,0 (iy)
	sub	a, #0x02
	jr	Z,00105$
;./engine/../engine/playermods/bullets.h:40: bx [bi] = prx + PLAYER_BULLET_X_OFFSET;
	ld	a,(#_prx + 0)
	ld	iy,#0
	add	iy,sp
	ld	0 (iy),a
;./engine/../engine/playermods/bullets.h:25: switch (pfacing) {
	ld	iy,#_pfacing
	ld	a,0 (iy)
	sub	a, #0x04
	jp	Z,00108$
	ld	a,0 (iy)
	sub	a, #0x06
	jr	Z,00107$
	jp	00109$
;./engine/../engine/playermods/bullets.h:26: case CELL_FACING_LEFT:
00105$:
;./engine/../engine/playermods/bullets.h:27: bx [bi] = prx - 8;
	ld	a,(#_bi + 0)
	add	a, #<(_bx)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_bx)
	ld	b,a
	ld	a,(#_prx + 0)
	add	a,#0xf8
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:28: bmx [bi] = -PLAYER_BULLET_SPEED;
	ld	bc,#_bmx+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0xfc
;./engine/../engine/playermods/bullets.h:29: by [bi] = pry + PLAYER_BULLET_Y_OFFSET;
	ld	a,(#_bi + 0)
	add	a, #<(_by)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_by)
	ld	b,a
	ld	a,(#_pry + 0)
	add	a, #0x06
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:30: bmy [bi] = 0;
	ld	bc,#_bmy+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x00
;./engine/../engine/playermods/bullets.h:31: break;	
	jp	00109$
;./engine/../engine/playermods/bullets.h:32: case CELL_FACING_RIGHT:
00106$:
;./engine/../engine/playermods/bullets.h:33: bx [bi] = prx + 8;
	ld	a,(#_bi + 0)
	add	a, #<(_bx)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_bx)
	ld	b,a
	ld	a,(#_prx + 0)
	add	a, #0x08
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:34: bmx [bi] = PLAYER_BULLET_SPEED;
	ld	bc,#_bmx+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x04
;./engine/../engine/playermods/bullets.h:35: by [bi] = pry + PLAYER_BULLET_Y_OFFSET;
	ld	a,(#_bi + 0)
	add	a, #<(_by)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_by)
	ld	b,a
	ld	a,(#_pry + 0)
	add	a, #0x06
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:36: bmy [bi] = 0;
	ld	bc,#_bmy+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x00
;./engine/../engine/playermods/bullets.h:37: break;
	jr	00109$
;./engine/../engine/playermods/bullets.h:39: case CELL_FACING_DOWN:
00107$:
;./engine/../engine/playermods/bullets.h:40: bx [bi] = prx + PLAYER_BULLET_X_OFFSET;
	ld	a,(#_bi + 0)
	add	a, #<(_bx)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_bx)
	ld	b,a
	ld	hl, #0+0
	add	hl, sp
	ld	a, (hl)
	add	a, #0xfd
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:41: by [bi] = pry + 12;
	ld	a,(#_bi + 0)
	add	a, #<(_by)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_by)
	ld	b,a
	ld	a,(#_pry + 0)
	add	a, #0x0c
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:42: bmy [bi] = PLAYER_BULLET_SPEED;
	ld	bc,#_bmy+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x04
;./engine/../engine/playermods/bullets.h:43: bmx [bi] = 0;
	ld	bc,#_bmx+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x00
;./engine/../engine/playermods/bullets.h:44: break;
	jr	00109$
;./engine/../engine/playermods/bullets.h:45: case CELL_FACING_UP:
00108$:
;./engine/../engine/playermods/bullets.h:46: bx [bi] = prx - PLAYER_BULLET_X_OFFSET;
	ld	a,(#_bi + 0)
	add	a, #<(_bx)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_bx)
	ld	b,a
	ld	hl, #0+0
	add	hl, sp
	ld	a, (hl)
	add	a,#0x03
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:47: by [bi] = pry - 4;
	ld	a,(#_bi + 0)
	add	a, #<(_by)
	ld	c,a
	ld	a,#0x00
	adc	a, #>(_by)
	ld	b,a
	ld	a,(#_pry + 0)
	add	a,#0xfc
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:48: bmy [bi] = -PLAYER_BULLET_SPEED;
	ld	bc,#_bmy+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0xfc
;./engine/../engine/playermods/bullets.h:49: bmx [bi] = 0;
	ld	bc,#_bmx+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x00
;./engine/../engine/playermods/bullets.h:52: }	
00109$:
;./engine/../engine/playermods/bullets.h:85: PSGSFXPlay (SFX_BULLET, 2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#_s_09_bullet2_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
00110$:
	inc	sp
	ret
;./engine/../engine/playermods/bullets.h:88: void bullets_destroy (void) {
;	---------------------------------
; Function bullets_destroy
; ---------------------------------
_bullets_destroy::
;./engine/../engine/playermods/bullets.h:89: bst [bi] = 0;
	ld	bc,#_bst+0
	ld	hl,(_bi)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x00
;./engine/../engine/playermods/bullets.h:90: b_slots [b_slots_i] = bi; ++ b_slots_i;
	ld	bc,#_b_slots+0
	ld	hl,(_b_slots_i)
	ld	h,#0x00
	add	hl,bc
	ld	a,(#_bi + 0)
	ld	(hl),a
	ld	hl, #_b_slots_i+0
	inc	(hl)
;./engine/../engine/playermods/bullets.h:91: PSGSFXPlay (SFX_DUMMY1, 2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#_s_06_dummy13_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
	ret
;./engine/../engine/playermods/bullets.h:94: void bullets_move (void) {
;	---------------------------------
; Function bullets_move
; ---------------------------------
_bullets_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;./engine/../engine/playermods/bullets.h:95: for (bi = 0; bi < MAX_BULLETS; bi ++) {
	ld	hl,#_bi + 0
	ld	(hl), #0x00
00113$:
;./engine/../engine/playermods/bullets.h:96: if (bst [bi]) {
	ld	iy,#_bst
	ld	de,(_bi)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jp	Z,00114$
;./engine/../engine/playermods/bullets.h:97: bx [bi] += bmx [bi];
	ld	a,#<(_bx)
	ld	hl,#_bi
	add	a, (hl)
	ld	c,a
	ld	a,#>(_bx)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	-2 (ix),a
	ld	a,#<(_bmx)
	ld	hl,#_bi
	add	a, (hl)
	ld	e,a
	ld	a,#>(_bmx)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	e,a
	ld	a, -2 (ix)
	add	a, e
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:98: by [bi] += bmy [bi];
	ld	a,#<(_by)
	ld	hl,#_bi
	add	a, (hl)
	ld	c,a
	ld	a,#>(_by)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	-2 (ix),a
	ld	a,#<(_bmy)
	ld	hl,#_bi
	add	a, (hl)
	ld	e,a
	ld	a,#>(_bmy)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	e,a
	ld	a, -2 (ix)
	add	a, e
	ld	(bc),a
;./engine/../engine/playermods/bullets.h:104: bx [bi], SPRITE_ADJUST + by [bi], 
	ld	a,#<(_by)
	ld	hl,#_bi
	add	a, (hl)
	ld	c,a
	ld	a,#>(_by)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	add	a, #0xf7
	ld	b,a
	ld	a,#<(_bx)
	ld	hl,#_bi
	add	a, (hl)
	ld	l, a
	ld	a, #>(_bx)
	adc	a, #0x00
	ld	h, a
	ld	d,(hl)
	ld	hl,#0x0fa4
	push	hl
	ld	c, d
	push	bc
	call	_SG_addSprite
	pop	af
	pop	af
;./engine/../engine/playermods/bullets.h:108: cx1 = ((bx [bi] + 4) >> 4);
	ld	iy,#_bx
	ld	de,(_bi)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	ld	-2 (ix), a
	ld	c, a
	ld	b,#0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl,#_cx1 + 0
	ld	(hl), c
;./engine/../engine/playermods/bullets.h:109: cy1 = ((by [bi] + 4 - 16) >> 4);
	ld	iy,#_by
	ld	de,(_bi)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	ld	-1 (ix), a
	ld	c, a
	ld	b,#0x00
	ld	hl,#0xfff4
	add	hl,bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
;./engine/../engine/playermods/bullets.h:110: rdm = ATTR (cx1, cy1);
	ld	hl,#_cy1 + 0
	ld	(hl),l
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl,#_cx1 + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	a,c
	or	a, e
	ld	c,a
	ld	a,b
	or	a, d
	ld	b,a
	ld	hl,#_map_buff
	add	hl,bc
	ld	c,(hl)
	ld	hl,(_c_behs)
	ld	b,#0x00
	add	hl, bc
	ld	a,(hl)
	ld	iy,#_rdm
	ld	0 (iy),a
;./engine/../engine/playermods/bullets.h:118: if (rdm & 16) {
	bit	4, 0 (iy)
	jr	Z,00108$
;./engine/../engine/playermods/bullets.h:119: breakable_break (cx1, cy1);
	ld	a,(_cy1)
	push	af
	inc	sp
	ld	a,(_cx1)
	push	af
	inc	sp
	call	_breakable_break
	pop	af
;./engine/../engine/playermods/bullets.h:120: bullets_destroy ();
	call	_bullets_destroy
	jr	00114$
00108$:
;./engine/../engine/playermods/bullets.h:124: bx [bi] < PLAYER_BULLET_SPEED ||
	ld	a,-2 (ix)
	sub	a, #0x04
	jr	C,00101$
;./engine/../engine/playermods/bullets.h:125: bx [bi] > 255 - PLAYER_BULLET_SPEED ||
	ld	a,#0xfb
	sub	a, -2 (ix)
	jr	C,00101$
;./engine/../engine/playermods/bullets.h:126: by [bi] < PLAYER_BULLET_SPEED ||
	ld	a,-1 (ix)
	sub	a, #0x04
	jr	C,00101$
;./engine/../engine/playermods/bullets.h:127: by [bi] > 207 - PLAYER_BULLET_SPEED ||
	ld	a,#0xcb
	sub	a, -1 (ix)
	jr	C,00101$
;./engine/../engine/playermods/bullets.h:128: (rdm & 8)
	ld	hl,#_rdm+0
	bit	3, (hl)
	jr	Z,00114$
00101$:
;./engine/../engine/playermods/bullets.h:129: ) bullets_destroy (); 
	call	_bullets_destroy
00114$:
;./engine/../engine/playermods/bullets.h:95: for (bi = 0; bi < MAX_BULLETS; bi ++) {
	ld	iy,#_bi
	inc	0 (iy)
	ld	a,0 (iy)
	sub	a, #0x04
	jp	C,00113$
	ld	sp, ix
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
;./engine/player.c:189: if (pflickering) -- pflickering;
	ld	iy,#_pflickering
	ld	a,0 (iy)
	or	a, a
	jr	Z,00102$
	dec	0 (iy)
00102$:
;./engine/player.c:190: if (pbouncing) -- pbouncing;
	ld	iy,#_pbouncing
	ld	a,0 (iy)
	or	a, a
	jr	Z,00104$
	dec	0 (iy)
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
;./engine/player.c:268: oppossee = ppossee;
	ld	a,(#_ppossee + 0)
	ld	(#_oppossee + 0),a
;./engine/player.c:269: ppossee = 0;
	ld	hl,#_ppossee + 0
	ld	(hl), #0x00
;./engine/player.c:278: if (!(pad0 & PAD_UP || pad0 & PAD_DOWN)) {
	ld	iy,#_pad0
	ld	a,0 (iy)
	and	a, #0x01
	ld	b,a
	ld	a,0 (iy)
	and	a, #0x02
	ld	c,a
	ld	a,b
	or	a,a
	jr	NZ,00115$
	or	a,c
	jr	NZ,00115$
;./engine/player.c:279: pfacingv = 0xff;
	ld	hl,#_pfacingv + 0
	ld	(hl), #0xff
;./engine/player.c:280: if (pvy > 0) {
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00487$
	xor	a, #0x80
00487$:
	jp	P,00112$
;./engine/player.c:281: pvy -= PLAYER_RX;
	ld	hl,#_pvy
	ld	a,(hl)
	add	a,#0xe0
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
;./engine/player.c:282: if (pvy < 0)
	ld	a,(#_pvy + 1)
	bit	7,a
	jr	Z,00115$
;./engine/player.c:283: pvy = 0;
	ld	hl,#0x0000
	ld	(_pvy),hl
	jr	00115$
00112$:
;./engine/player.c:284: } else if (pvy < 0) {
	ld	iy,#_pvy
	bit	7,1 (iy)
	jr	Z,00115$
;./engine/player.c:285: pvy += PLAYER_RX;
	ld	hl,#_pvy
	ld	a,(hl)
	add	a, #0x20
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;./engine/player.c:286: if (pvy > 0)
	xor	a, a
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00488$
	xor	a, #0x80
00488$:
	jp	P,00115$
;./engine/player.c:287: pvy = 0;
	ld	hl,#0x0000
	ld	(_pvy),hl
00115$:
;./engine/player.c:291: if (pad0 & PAD_UP) {
	ld	a,b
	or	a, a
	jr	Z,00120$
;./engine/player.c:292: pfacingv = CELL_FACING_UP;
	ld	hl,#_pfacingv + 0
	ld	(hl), #0x04
;./engine/player.c:293: if (pvy > -PLAYER_VX_MAX) {
	ld	a,#0x80
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	a,#0xff
	sbc	a, 1 (iy)
	jp	PO, 00489$
	xor	a, #0x80
00489$:
	jp	P,00120$
;./engine/player.c:294: pvy -= PLAYER_AX;
	ld	hl,#_pvy
	ld	a,(hl)
	add	a,#0xe8
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
00120$:
;./engine/player.c:298: if (pad0 & PAD_DOWN) {
	ld	a,c
	or	a, a
	jr	Z,00124$
;./engine/player.c:299: pfacingv = CELL_FACING_DOWN;
	ld	hl,#_pfacingv + 0
	ld	(hl), #0x06
;./engine/player.c:300: if (pvy < PLAYER_VX_MAX) {
	ld	iy,#_pvy
	ld	a,0 (iy)
	sub	a, #0x80
	ld	a,1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00124$
;./engine/player.c:301: pvy += PLAYER_AX;
	ld	hl,#_pvy
	ld	a,(hl)
	add	a, #0x18
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
00124$:
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
	bit	7,1 (iy)
	jr	Z,00126$
	ld	hl,#0x0000
	ld	(_py),hl
00126$:
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
	and	a,#0x0f
	ld	(#_cx1 + 0),a
;./engine/player.c:409: cx2 = (prx + 7) >> 4;
	ld	hl,#_prx + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	hl,#0x0007
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
;./engine/player.c:418: cy1 = cy2 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;			
	ld	a,(#_pry + 0)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
;./engine/player.c:412: if (pvy < 0)
	ld	a,(#_pvy + 1)
	bit	7,a
	jp	Z,00161$
;./engine/player.c:418: cy1 = cy2 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;			
	ld	a,-2 (ix)
	add	a,#0x08
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b,a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl,#_cy2 + 0
	ld	(hl), c
	ld	hl,#_cy1 + 0
	ld	(hl), c
;./engine/player.c:419: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:421: if ((at1 & 12) || (at2 & 12)) 
	ld	a,(#_at1 + 0)
	and	a, #0x0c
	jr	NZ,00136$
	ld	a,(#_at2 + 0)
	and	a, #0x0c
	jp	Z,00137$
00136$:
;./engine/player.c:426: pry = ((cy1 + 1) << 4) + PLAYER_COLLISION_VSTRETCH_BG;
	ld	a,(#_cy1 + 0)
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xf0
	ld	hl,#_pry
	add	a, #0xf8
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
	ld	hl,#_pgotten + 0
	ld	(hl), #0x00
;./engine/player.c:429: pfiring = 1;
	ld	hl,#_pfiring + 0
	ld	(hl), #0x01
;./engine/player.c:432: if (at1 & 2) player_process_tile (at1, cx1, cy1, cx1, cy1 - 1);
	ld	hl,#_at1+0
	bit	1, (hl)
	jr	Z,00128$
	ld	hl,#_cy1 + 0
	ld	b, (hl)
	dec	b
	push	bc
	inc	sp
	ld	a,(_cx1)
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
00128$:
;./engine/player.c:433: if (cx1 != cx2) if (at2 & 2) player_process_tile (at2, cx2, cy1, cx2, cy1 - 1);
	ld	a,(#_cx1 + 0)
	ld	iy,#_cx2
	sub	a, 0 (iy)
	jp	Z,00162$
	ld	hl,#_at2+0
	bit	1, (hl)
	jp	Z,00162$
	ld	hl,#_cy1 + 0
	ld	b, (hl)
	dec	b
	push	bc
	inc	sp
	ld	a,(_cx2)
	push	af
	inc	sp
	ld	a,(_cy1)
	push	af
	inc	sp
	ld	a,(_cx2)
	push	af
	inc	sp
	ld	a,(_at2)
	push	af
	inc	sp
	call	_player_process_tile
	pop	af
	pop	af
	inc	sp
	jp	00162$
00137$:
;./engine/player.c:435: } else if ((at1 & 1) || (at2 & 1)) {
	ld	hl,#_at1+0
	bit	0, (hl)
	jr	NZ,00133$
	ld	hl,#_at2+0
	bit	0, (hl)
	jp	Z,00162$
00133$:
;./engine/player.c:436: hitv = 1;
	ld	hl,#_hitv + 0
	ld	(hl), #0x01
	jp	00162$
00161$:
;./engine/player.c:445: } else if (pvy > 0)
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00499$
	xor	a, #0x80
00499$:
	jp	P,00162$
;./engine/player.c:450: cy1 = cy2 = (pry + 16) >> 4; 
	ld	a,-2 (ix)
	add	a, #0x10
	ld	c,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	b,a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl,#_cy2 + 0
	ld	(hl), c
	ld	hl,#_cy1 + 0
	ld	(hl), c
;./engine/player.c:451: cm_two_points (); 
	call	_cm_two_points
;./engine/player.c:453: if ((at1 & 12) || (at2 & 12)) 
	ld	a,(#_at1 + 0)
	and	a, #0x0c
	jr	NZ,00154$
	ld	a,(#_at2 + 0)
	and	a, #0x0c
	jp	Z,00155$
00154$:
;./engine/player.c:466: pvy = 0; pry = ((cy1 - 1) << 4);py = pry << FIXBITS;
	ld	hl,#0x0000
	ld	(_pvy),hl
	ld	hl,#_cy1 + 0
	ld	c, (hl)
	dec	c
	ld	a,c
	rlca
	rlca
	rlca
	rlca
	and	a,#0xf0
	ld	hl,#_pry + 0
	ld	(hl),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_py),hl
;./engine/player.c:467: pgotten = 0;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x00
;./engine/player.c:468: pfiring = 1;
	ld	hl,#_pfiring + 0
	ld	(hl), #0x01
;./engine/player.c:469: ppossee = 1;
	ld	hl,#_ppossee + 0
	ld	(hl), #0x01
;./engine/player.c:472: if (at1 & 2) player_process_tile (at1, cx1, cy1, cx1, cy1 + 1);
	ld	hl,#_at1+0
	bit	1, (hl)
	jr	Z,00141$
	ld	hl,#_cy1 + 0
	ld	b, (hl)
	inc	b
	push	bc
	inc	sp
	ld	a,(_cx1)
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
00141$:
;./engine/player.c:473: if (cx1 != cx2) if (at2 & 2) player_process_tile (at2, cx2, cy1, cx2, cy1 + 1);			
	ld	a,(#_cx1 + 0)
	ld	iy,#_cx2
	sub	a, 0 (iy)
	jr	Z,00145$
	ld	hl,#_at2+0
	bit	1, (hl)
	jr	Z,00145$
	ld	hl,#_cy1 + 0
	ld	b, (hl)
	inc	b
	push	bc
	inc	sp
	ld	a,(_cx2)
	push	af
	inc	sp
	ld	a,(_cy1)
	push	af
	inc	sp
	ld	a,(_cx2)
	push	af
	inc	sp
	ld	a,(_at2)
	push	af
	inc	sp
	call	_player_process_tile
	pop	af
	pop	af
	inc	sp
00145$:
;./engine/player.c:503: if ((at1 & 1) || (at2 & 1)) pnotsafe = 1; 
	ld	hl,#_at1+0
	bit	0, (hl)
	jr	NZ,00146$
	ld	hl,#_at2+0
	bit	0, (hl)
	jr	Z,00162$
00146$:
	ld	hl,#_pnotsafe + 0
	ld	(hl), #0x01
	jr	00162$
00155$:
;./engine/player.c:509: if ((at1 & 1) || (at2 & 1)) {
	ld	hl,#_at1+0
	bit	0, (hl)
	jr	NZ,00151$
	ld	hl,#_at2+0
	bit	0, (hl)
	jr	Z,00162$
00151$:
;./engine/player.c:510: if ((pry & 15) > 4) hitv = 1;
	ld	a,(#_pry + 0)
	and	a, #0x0f
	ld	c,a
	ld	a,#0x04
	sub	a, c
	jr	NC,00162$
	ld	hl,#_hitv + 0
	ld	(hl), #0x01
00162$:
;./engine/player.c:672: if (!(pad0 & PAD_LEFT || pad0 & PAD_RIGHT)) {
	ld	iy,#_pad0
	ld	a,0 (iy)
	and	a, #0x04
	ld	b,a
	ld	a,0 (iy)
	and	a, #0x08
	ld	c,a
	ld	a,b
	or	a,a
	jr	NZ,00173$
	or	a,c
	jr	NZ,00173$
;./engine/player.c:674: pfacingh = 0xff;
	ld	hl,#_pfacingh + 0
	ld	(hl), #0xff
;./engine/player.c:680: if (pvx > 0) {
	xor	a, a
	ld	iy,#_pvx
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00512$
	xor	a, #0x80
00512$:
	jp	P,00170$
;./engine/player.c:685: pvx -= PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a,#0xe0
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
;./engine/player.c:688: if (pvx < 0) pvx = 0;
	ld	a,(#_pvx + 1)
	bit	7,a
	jr	Z,00173$
	ld	hl,#0x0000
	ld	(_pvx),hl
	jr	00173$
00170$:
;./engine/player.c:689: } else if (pvx < 0) {
	ld	iy,#_pvx
	bit	7,1 (iy)
	jr	Z,00173$
;./engine/player.c:694: pvx += PLAYER_RX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, #0x20
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;./engine/player.c:697: if (pvx > 0) pvx = 0;
	xor	a, a
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00513$
	xor	a, #0x80
00513$:
	jp	P,00173$
	ld	hl,#0x0000
	ld	(_pvx),hl
00173$:
;./engine/player.c:702: if (pad0 & PAD_LEFT) {
	ld	a,b
	or	a, a
	jr	Z,00178$
;./engine/player.c:704: pfacingh = CELL_FACING_LEFT;
	ld	hl,#_pfacingh + 0
	ld	(hl), #0x02
;./engine/player.c:709: if (pvx > -PLAYER_VX_MAX) {
	ld	a,#0x80
	ld	iy,#_pvx
	cp	a, 0 (iy)
	ld	a,#0xff
	sbc	a, 1 (iy)
	jp	PO, 00514$
	xor	a, #0x80
00514$:
	jp	P,00178$
;./engine/player.c:714: pvx -= PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a,#0xe8
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
00178$:
;./engine/player.c:719: if (pad0 & PAD_RIGHT) {
	ld	a,c
	or	a, a
	jr	Z,00182$
;./engine/player.c:721: pfacingh = CELL_FACING_RIGHT;
	ld	hl,#_pfacingh + 0
	ld	(hl), #0x00
;./engine/player.c:726: if (pvx < PLAYER_VX_MAX) {
	ld	iy,#_pvx
	ld	a,0 (iy)
	sub	a, #0x80
	ld	a,1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00182$
;./engine/player.c:731: pvx += PLAYER_AX;
	ld	hl,#_pvx
	ld	a,(hl)
	add	a, #0x18
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
00182$:
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
;./engine/player.c:742: if (px < (4<<FIXBITS)) { px = 4 << FIXBITS; prx = 4;}
	ld	a,1 (iy)
	xor	a, #0x80
	sub	a, #0x81
	jr	NC,00187$
	ld	hl,#0x0100
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0x04
	jr	00188$
00187$:
;./engine/player.c:743: else if (px > (244<<FIXBITS)) { px = 244 << FIXBITS; prx = 244; }
	xor	a, a
	ld	iy,#_px
	cp	a, 0 (iy)
	ld	a,#0x3d
	sbc	a, 1 (iy)
	jp	PO, 00515$
	xor	a, #0x80
00515$:
	jp	P,00184$
	ld	hl,#0x3d00
	ld	(_px),hl
	ld	hl,#_prx + 0
	ld	(hl), #0xf4
	jr	00188$
00184$:
;./engine/player.c:744: else player_to_pixels ();
	call	_player_to_pixels
00188$:
;./engine/player.c:749: cy1 = (pry - PLAYER_COLLISION_VSTRETCH_BG) >> 4;
	ld	hl,#_pry + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	a,c
	add	a,#0x08
	ld	e,a
	ld	a,b
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
	ld	hl,#_cy1 + 0
	ld	(hl), e
;./engine/player.c:750: cy2 = (pry + 15) >> 4;
	ld	hl,#0x000f
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
;./engine/player.c:753: rds16 = pvx + pgtmx;
	ld	hl,#_pgtmx
	push	de
	ld	de,#_rds16
	ld	iy,#_pvx
	ld	a,0 (iy)
	add	a, (hl)
	ld	(de),a
	ld	a,1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de),a
	pop	de
;./engine/player.c:754: if (rds16) 	{
	ld	iy,#_rds16
	ld	a,1 (iy)
	or	a,0 (iy)
	jp	Z,00205$
;./engine/player.c:755: if (rds16 < 0) {
	bit	7,1 (iy)
	jr	Z,00190$
;./engine/player.c:756: cx1 = cx2 = prx >> 4; 
	ld	a,(#_prx + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0f
	ld	(#_cx2 + 0),a
	ld	iy,#_cx1
	ld	0 (iy),a
;./engine/player.c:757: rda = (cx1 + 1) << 4;
	ld	a,0 (iy)
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xf0
	ld	(#_rda + 0),a
;./engine/player.c:758: rdm = cx1 - 1;
	ld	hl,#_rdm
	ld	a,(#_cx1 + 0)
	add	a,#0xff
	ld	(hl),a
	jr	00191$
00190$:
;./engine/player.c:760: cx1 = cx2 = (prx + 8) >> 4;
	ld	hl,#_prx + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	hl,#0x0008
	add	hl,bc
	ld	c,l
	sra	h
	rr	c
	sra	h
	rr	c
	sra	h
	rr	c
	sra	h
	rr	c
	ld	hl,#_cx2 + 0
	ld	(hl), c
	ld	iy,#_cx1
	ld	0 (iy),c
;./engine/player.c:761: rda = ((cx1 - 1) << 4) + 8;
	ld	c,0 (iy)
	dec	c
	ld	a,c
	rlca
	rlca
	rlca
	rlca
	and	a,#0xf0
	ld	hl,#_rda
	add	a, #0x08
	ld	(hl),a
;./engine/player.c:762: rdm = cx1 + 1;
	ld	hl,#_rdm
	ld	a,0 (iy)
	inc	a
	ld	(hl),a
00191$:
;./engine/player.c:783: cm_two_points ();
	call	_cm_two_points
;./engine/player.c:785: if ((at1 & 12) || (at2 & 12)) 
	ld	a,(#_at1 + 0)
	and	a, #0x0c
	jr	NZ,00198$
	ld	a,(#_at2 + 0)
	and	a, #0x0c
	jr	Z,00199$
00198$:
;./engine/player.c:790: pvx = 0; prx = rda; px = prx << FIXBITS; pfiring = 1;
	ld	hl,#0x0000
	ld	(_pvx),hl
	ld	a,(#_rda + 0)
	ld	hl,#_prx + 0
	ld	(hl),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_px),hl
	ld	hl,#_pfiring + 0
	ld	(hl), #0x01
;./engine/player.c:794: if (at1 & 2) player_process_tile (at1, cx1, cy1, rdm, cy1);
	ld	hl,#_at1+0
	bit	1, (hl)
	jr	Z,00193$
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
00193$:
;./engine/player.c:795: if (cy1 != cy2) if (at2 & 2) player_process_tile (at2, cx1, cy2, rdm, cy2);
	ld	a,(#_cy1 + 0)
	ld	iy,#_cy2
	sub	a, 0 (iy)
	jr	Z,00200$
	ld	hl,#_at2+0
	bit	1, (hl)
	jr	Z,00200$
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
	jr	00200$
00199$:
;./engine/player.c:802: hith = ((at1 & 1) || (at2 & 1));
	ld	hl,#_at1+0
	bit	0, (hl)
	jr	NZ,00229$
	ld	hl,#_at2+0
	bit	0, (hl)
	jr	NZ,00229$
	ld	c,#0x00
	jr	00230$
00229$:
	ld	c,#0x01
00230$:
	ld	hl,#_hith + 0
	ld	(hl), c
00200$:
;./engine/player.c:805: if (pvy > 0) hith &= ((pry & 15) > 4);
	xor	a, a
	ld	iy,#_pvy
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00526$
	xor	a, #0x80
00526$:
	jp	P,00205$
	ld	a,(#_pry + 0)
	and	a, #0x0f
	ld	c,a
	ld	a,#0x04
	sub	a, c
	ld	a,#0x00
	rla
	ld	c,a
	ld	iy,#_hith
	ld	a,0 (iy)
	and	a, c
	ld	0 (iy),a
00205$:
;./engine/player.c:811: if (pfacingv != 0xff) {
	ld	iy,#_pfacingv
	ld	a,0 (iy)
	inc	a
	jr	Z,00209$
;./engine/player.c:812: pfacing = pfacingv; 
	ld	a,0 (iy)
	ld	(#_pfacing + 0),a
	jr	00210$
00209$:
;./engine/player.c:813: } else if (pfacingh != 0xff) {
	ld	iy,#_pfacingh
	ld	a,0 (iy)
	inc	a
	jr	Z,00210$
;./engine/player.c:814: pfacing = pfacingh;
	ld	a,0 (iy)
	ld	(#_pfacing + 0),a
00210$:
;./engine/player.c:833: phit = 0;
	ld	hl,#_phit + 0
	ld	(hl), #0x00
;./engine/player.c:835: if (pgotten == 0) {
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00221$
;./engine/player.c:843: if (hitv) { phit = 1; pvy = ADD_SIGN (-pvy, PLAYER_V_REBOUND); pry = pcy; py = pry << FIXBITS; } 
	ld	a,(#_hitv + 0)
	or	a, a
	jr	Z,00212$
	ld	hl,#_phit + 0
	ld	(hl), #0x01
	xor	a, a
	ld	iy,#_pvy
	sub	a, 0 (iy)
	ld	c,a
	ld	a, #0x00
	sbc	a, 1 (iy)
	ld	b,a
	or	a,c
	jr	Z,00231$
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00529$
	xor	a, #0x80
00529$:
	jp	P,00233$
	ld	hl,#0x00e0
	jr	00232$
00233$:
	ld	hl,#0xff20
	jr	00232$
00231$:
	ld	hl,#0x0000
00232$:
	ld	(_pvy),hl
	ld	a,(#_pcy + 0)
	ld	hl,#_pry + 0
	ld	(hl),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_py),hl
00212$:
;./engine/player.c:847: if (hith) { phit = 1; pvx = ADD_SIGN (-pvx, PLAYER_V_REBOUND); prx = pcx; px = prx << FIXBITS; }
	ld	a,(#_hith + 0)
	or	a, a
	jr	Z,00214$
	ld	hl,#_phit + 0
	ld	(hl), #0x01
	xor	a, a
	ld	iy,#_pvx
	sub	a, 0 (iy)
	ld	c,a
	ld	a, #0x00
	sbc	a, 1 (iy)
	ld	b,a
	or	a,c
	jr	Z,00235$
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00530$
	xor	a, #0x80
00530$:
	jp	P,00237$
	ld	hl,#0x00e0
	jr	00236$
00237$:
	ld	hl,#0xff20
	jr	00236$
00235$:
	ld	hl,#0x0000
00236$:
	ld	(_pvx),hl
	ld	a,(#_pcx + 0)
	ld	hl,#_prx + 0
	ld	(hl),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_px),hl
00214$:
;./engine/player.c:857: if (!pflickering && !pbouncing) if (phit) { 
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00221$
	ld	a,(#_pbouncing + 0)
	or	a, a
	jr	NZ,00221$
	ld	a,(#_phit + 0)
	or	a, a
	jr	Z,00221$
;./engine/player.c:858: player_to_pixels ();
	call	_player_to_pixels
;./engine/player.c:859: en_sg_2 = 1;
	ld	hl,#_en_sg_2 + 0
	ld	(hl), #0x01
;./engine/player.c:866: pkill = en_sg_2;
	ld	hl,#_pkill + 0
	ld	(hl), #0x01
00221$:
;./engine/player.c:924: b_button
	ld	iy,#_b_button
	ld	a,0 (iy)
	or	a, a
	jr	Z,00225$
;./engine/player.c:939: if (b_button) fire_bullet ();
	ld	a,0 (iy)
	or	a, a
	jr	Z,00225$
	call	_fire_bullet
00225$:
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
