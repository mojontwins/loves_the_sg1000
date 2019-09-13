;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 14:35:13 2019
;--------------------------------------------------------
	.module enengine
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _enems_move
	.globl _enems_hit
	.globl _enems_kill
	.globl _enems_load
	.globl _enems_boioiong_init
	.globl _enems_init_fp
	.globl _enems_facing
	.globl _enems_update_unsigned_char_arrays
	.globl _enems_persistent_deaths_load
	.globl _jump_start
	.globl _collide
	.globl _memfill
	.globl _run_script
	.globl _PSGSFXPlay
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
;./engine/enengine.c:93: void enems_persistent_deaths_load (void) {
;	---------------------------------
; Function enems_persistent_deaths_load
; ---------------------------------
_enems_persistent_deaths_load::
;./engine/enengine.c:94: memfill (ep_dead, 0, MAP_SIZE * 3);
	ld	de,#_ep_dead
	ld	hl,#0x003C
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_memfill
	pop	af
	pop	af
	inc	sp
	ret
;./engine/enengine.c:98: void enems_update_unsigned_char_arrays (void) {
;	---------------------------------
; Function enems_update_unsigned_char_arrays
; ---------------------------------
_enems_update_unsigned_char_arrays::
;./engine/enengine.c:99: en_t [gpit] = _en_t;
	ld	de,#_en_t+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_t + 0)
	ld	(hl),a
;./engine/enengine.c:100: en_s [gpit] = _en_s;
	ld	de,#_en_s+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_s + 0)
	ld	(hl),a
;./engine/enengine.c:101: en_x [gpit] = _en_x; en_y [gpit] = _en_y;
	ld	de,#_en_x+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_x + 0)
	ld	(hl),a
	ld	de,#_en_y+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_y + 0)
	ld	(hl),a
;./engine/enengine.c:102: en_x1 [gpit] = _en_x1; en_y1 [gpit] = _en_y1;
	ld	de,#_en_x1+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_x1 + 0)
	ld	(hl),a
	ld	de,#_en_y1+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_y1 + 0)
	ld	(hl),a
;./engine/enengine.c:103: en_x2 [gpit] = _en_x2; en_y2 [gpit] = _en_y2;
	ld	de,#_en_x2+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_x2 + 0)
	ld	(hl),a
	ld	de,#_en_y2+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_y2 + 0)
	ld	(hl),a
;./engine/enengine.c:104: en_mx [gpit] = _en_mx; en_my [gpit] = _en_my;
	ld	de,#_en_mx+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_mx + 0)
	ld	(hl),a
	ld	de,#_en_my+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_my + 0)
	ld	(hl),a
;./engine/enengine.c:105: en_ct [gpit] = _en_ct;
	ld	de,#_en_ct+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_ct + 0)
	ld	(hl),a
;./engine/enengine.c:106: en_facing [gpit] = _en_facing;
	ld	de,#_en_facing+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_facing + 0)
	ld	(hl),a
;./engine/enengine.c:107: en_state [gpit] = _en_state;
	ld	de,#_en_state+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_state + 0)
	ld	(hl),a
	ret
;./engine/enengine.c:115: void enems_facing (void) {
;	---------------------------------
; Function enems_facing
; ---------------------------------
_enems_facing::
;./engine/enengine.c:116: _en_facing = rda << 2;
	ld	a,(#_rda + 0)
	add	a, a
	add	a, a
	ld	(#__en_facing + 0),a
	ret
;./engine/enengine.c:119: void enems_init_fp (void) {
;	---------------------------------
; Function enems_init_fp
; ---------------------------------
_enems_init_fp::
;./engine/enengine.c:120: _enf_x = _en_x << 6;
	ld	iy,#__en_x
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(__enf_x),hl
;./engine/enengine.c:121: _enf_y = _en_y << 6;
	ld	iy,#__en_y
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(__enf_y),hl
	ret
;./engine/enengine.c:124: void enems_boioiong_init (void) {
;	---------------------------------
; Function enems_boioiong_init
; ---------------------------------
_enems_boioiong_init::
;./engine/enengine.c:125: enems_init_fp ();
	call	_enems_init_fp
;./engine/enengine.c:126: _enf_vy = 0; 
	ld	hl,#0x0000
	ld	(__enf_vy),hl
;./engine/enengine.c:127: _enf_vx = ADD_SIGN2 (_en_x2, _en_x1, rdm << FIXBITS);
	ld	a,(#__en_x2 + 0)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	NZ,00103$
	ld	de,#0x0000
	jr	00104$
00103$:
	ld	iy,#_rdm
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	a,(#__en_x1)
	ld	iy,#__en_x2
	sub	a, 0 (iy)
	jr	C,00106$
	xor	a, a
	sub	a, e
	ld	e,a
	ld	a, #0x00
	sbc	a, d
	ld	d,a
00106$:
00104$:
	ld	(__enf_vx),de
;./engine/enengine.c:131: _en_ct = 0;
	ld	hl,#__en_ct + 0
	ld	(hl), #0x00
	ret
;./engine/enengine.c:135: void enems_load (void) {
;	---------------------------------
; Function enems_load
; ---------------------------------
_enems_load::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;./engine/enengine.c:136: gp_gen = (unsigned char *) (c_enems + (n_pant << 2) + (n_pant << 3));
	ld	hl,#_n_pant + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	e, c
	ld	d, b
	sla	e
	rl	d
	sla	e
	rl	d
	ld	a,(#_c_enems + 0)
	add	a, e
	ld	e,a
	ld	a,(#_c_enems + 1)
	adc	a, d
	ld	d,a
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	a,e
	ld	hl,#_gp_gen
	add	a, c
	ld	(hl),a
	ld	a,d
	adc	a, b
	inc	hl
	ld	(hl),a
;./engine/enengine.c:139: en_offs = rdc = (n_pant << 1) + n_pant;
	ld	a,(#_n_pant + 0)
	add	a, a
	ld	hl,#_n_pant
	add	a, (hl)
	ld	(#_rdc + 0),a
	ld	(#_en_offs + 0),a
;./engine/enengine.c:149: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
00117$:
;./engine/enengine.c:153: if (ep_dead [rdc]) {
	ld	iy,#_ep_dead
	ld	de,(_rdc)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00114$
;./engine/enengine.c:154: _en_t = 0;
	ld	hl,#__en_t + 0
	ld	(hl), #0x00
;./engine/enengine.c:155: gp_gen += 4;
	ld	hl,#_gp_gen
	ld	a,(hl)
	add	a, #0x04
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	jp	00115$
00114$:
;./engine/enengine.c:167: _en_t = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#__en_t + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00177$
	ld	hl, #_gp_gen+1
	inc	(hl)
00177$:
;./engine/enengine.c:170: _en_state = 0;
	ld	hl,#__en_state + 0
	ld	(hl), #0x00
;./engine/enengine.c:173: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00178$
	ld	hl, #_gp_gen+1
	inc	(hl)
00178$:
;./engine/enengine.c:174: _en_y1 = rda & 0xf0;
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#__en_y1 + 0),a
;./engine/enengine.c:175: _en_x1 = rda << 4;
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#__en_x1 + 0),a
;./engine/enengine.c:178: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00179$
	ld	hl, #_gp_gen+1
	inc	(hl)
00179$:
;./engine/enengine.c:179: _en_y2 = rda & 0xf0;
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#__en_y2 + 0),a
;./engine/enengine.c:180: _en_x2 = rda << 4;
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#__en_x2 + 0),a
;./engine/enengine.c:183: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00180$
	ld	hl, #_gp_gen+1
	inc	(hl)
00180$:
;./engine/enengine.c:186: rdd = rda & 0xf0; 	// Used for respawn speed!
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#_rdd + 0),a
;./engine/enengine.c:187: rdm = rda & 0x0f; 	// Actual speed.
	ld	a,(#_rda + 0)
	and	a, #0x0F
	ld	(#_rdm + 0),a
;./engine/enengine.c:197: _en_x = _en_x1;
	ld	a,(#__en_x1 + 0)
	ld	(#__en_x + 0),a
;./engine/enengine.c:198: _en_y = _en_y1;
	ld	a,(#__en_y1 + 0)
	ld	(#__en_y + 0),a
;./engine/enengine.c:201: switch (_en_t & 0x3f) {
	ld	iy,#__en_t
	ld	a,0 (iy)
	and	a, #0x3F
	ld	e,a
	sub	a, #0x01
	jp	C,00112$
	ld	a,#0x04
	sub	a, e
	jp	C,00112$
	dec	e
	ld	d,#0x00
	ld	hl,#00181$
	add	hl,de
	add	hl,de
;./engine/enengine.c:202: case 1:
	jp	(hl)
00181$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;./engine/enengine.c:203: case 2:
00102$:
;./engine/enengine.c:204: case 3:
00103$:
;./engine/enengine.c:205: case 4:
00104$:
;./engine/enengine.c:208: _en_ct = 0;			
	ld	hl,#__en_ct + 0
	ld	(hl), #0x00
;./engine/enengine.c:209: _en_s = (_en_t - 1) << 3;
	ld	a,(#__en_t + 0)
	add	a,#0xFF
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	(#__en_s + 0),a
;./engine/enengine.c:219: _en_mx = ADD_SIGN2 (_en_x2, _en_x1, rdm);
	ld	hl,#_rdm + 0
	ld	d, (hl)
	xor	a, a
	ld	iy,#_rdm
	sub	a, 0 (iy)
	ld	c,a
	ld	a,(#__en_x2 + 0)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	NZ,00121$
	ld	e,#0x00
	jr	00122$
00121$:
	ld	a,(#__en_x1)
	ld	iy,#__en_x2
	sub	a, 0 (iy)
	jr	NC,00123$
	ld	e,d
	jr	00124$
00123$:
	ld	e,c
00124$:
00122$:
	ld	hl,#__en_mx + 0
	ld	(hl), e
;./engine/enengine.c:220: _en_my = ADD_SIGN2 (_en_y2, _en_y1, rdm);
	ld	a,(#__en_y2 + 0)
	ld	iy,#__en_y1
	sub	a, 0 (iy)
	jr	NZ,00125$
	ld	c,#0x00
	jr	00126$
00125$:
	ld	a,(#__en_y1)
	ld	iy,#__en_y2
	sub	a, 0 (iy)
	jr	NC,00127$
	ld	c,d
00127$:
00126$:
	ld	hl,#__en_my + 0
	ld	(hl), c
;./engine/enengine.c:226: en_status [gpit] = 1; 
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	-1 (ix),a
;./engine/enengine.c:225: if (rdm == 1) {
	ld	a,(#_rdm + 0)
	dec	a
	jr	NZ,00106$
;./engine/enengine.c:226: en_status [gpit] = 1; 
	pop	hl
	push	hl
	ld	(hl),#0x01
	jr	00107$
00106$:
;./engine/enengine.c:228: en_status [gpit] = 0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;./engine/enengine.c:230: _en_mx >>= 1;
	ld	a,(#__en_mx + 0)
	sra	a
	ld	(#__en_mx + 0),a
;./engine/enengine.c:231: _en_my >>= 1;					
	ld	a,(#__en_my + 0)
	sra	a
	ld	(#__en_my + 0),a
00107$:
;./engine/enengine.c:236: if (_en_x1 > _en_x2) { rda = _en_x1; _en_x1 = _en_x2; _en_x2 = rda; }
	ld	a,(#__en_x2)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	NC,00109$
	ld	a,(#__en_x1 + 0)
	ld	(#_rda + 0),a
	ld	a,(#__en_x2 + 0)
	ld	(#__en_x1 + 0),a
	ld	a,(#_rda + 0)
	ld	(#__en_x2 + 0),a
00109$:
;./engine/enengine.c:237: if (_en_y1 > _en_y2) { rda = _en_y1; _en_y1 = _en_y2; _en_y2 = rda; }
	ld	a,(#__en_y2)
	ld	iy,#__en_y1
	sub	a, 0 (iy)
	jr	NC,00112$
	ld	a,(#__en_y1 + 0)
	ld	(#_rda + 0),a
	ld	a,(#__en_y2 + 0)
	ld	(#__en_y1 + 0),a
	ld	a,(#_rda + 0)
	ld	(#__en_y2 + 0),a
;./engine/enengine.c:395: }
00112$:
;./engine/enengine.c:401: en_life [gpit] = ENEMS_LIFE_GAUGE;
	ld	a,#<(_en_life)
	ld	hl,#_gpit
	add	a, (hl)
	ld	l, a
	ld	a, #>(_en_life)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0x02
;./engine/enengine.c:405: en_cttouched [gpit] = 0;
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
;./engine/enengine.c:406: en_flags [gpit] = 0;
	ld	a,#<(_en_flags)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_flags)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
00115$:
;./engine/enengine.c:409: ++ rdc;
	ld	hl, #_rdc+0
	inc	(hl)
;./engine/enengine.c:412: enems_update_unsigned_char_arrays ();
	call	_enems_update_unsigned_char_arrays
;./engine/enengine.c:149: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x03
	jp	C,00117$
	ld	sp, ix
	pop	ix
	ret
;./engine/enengine.c:417: void enems_kill () {
;	---------------------------------
; Function enems_kill
; ---------------------------------
_enems_kill::
;./engine/enengine.c:418: en_flags [gpit] |= EN_STATE_DEAD;
	ld	de,#_en_flags+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	set	0, (hl)
	ld	a, (hl)
;./engine/enengine.c:424: ep_dead [en_offs + gpit] = 1;
	ld	hl,#_en_offs + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl,de
	ld	de,#_ep_dead
	add	hl,de
	ld	(hl),#0x01
;./engine/enengine.c:428: run_script (2 * MAP_SIZE + 5);
	ld	a,#0x2D
	push	af
	inc	sp
	call	_run_script
	inc	sp
;./engine/enengine.c:435: ++ pkilled;
	ld	hl, #_pkilled+0
	inc	(hl)
	ret
;./engine/enengine.c:442: void enems_hit (void) {
;	---------------------------------
; Function enems_hit
; ---------------------------------
_enems_hit::
;./engine/enengine.c:443: _en_facing = ((_en_x < prx) ? 0 : 4);
	ld	hl,#_prx
	ld	a,(#__en_x + 0)
	sub	a, (hl)
	jr	NC,00105$
	ld	a,#0x00
	jr	00106$
00105$:
	ld	a,#0x04
00106$:
	ld	(#__en_facing + 0),a
;./engine/enengine.c:444: en_cttouched [gpit] = ENEMS_TOUCHED_FRAMES;
	ld	de,#_en_cttouched+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x08
;./engine/enengine.c:446: -- en_life [gpit]; 
	ld	de,#_en_life+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	b,(hl)
	dec	b
	ld	(hl),b
;./engine/enengine.c:447: if (en_life [gpit] == 0) 
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	or	a, a
	ret	NZ
;./engine/enengine.c:460: enems_kill ();
	jp  _enems_kill
;./engine/enengine.c:466: void enems_move (void) {
;	---------------------------------
; Function enems_move
; ---------------------------------
_enems_move::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;./engine/enengine.c:468: pgotten = pgtmx = pgtmy = 0;
	ld	hl,#0x0000
	ld	(_pgtmy),hl
	ld	l, #0x00
	ld	(_pgtmx),hl
	ld	hl,#_pgotten + 0
	ld	(hl), #0x00
;./engine/enengine.c:472: touched = 0;
	ld	hl,#_touched + 0
	ld	(hl), #0x00
;./engine/enengine.c:473: ++ en_initial; if (en_initial >= 3) en_initial = 0;
	ld	hl, #_en_initial+0
	inc	(hl)
	ld	a,(#_en_initial + 0)
	sub	a, #0x03
	jr	C,00102$
	ld	hl,#_en_initial + 0
	ld	(hl), #0x00
00102$:
;./engine/enengine.c:474: gpit = en_initial;
	ld	a,(#_en_initial + 0)
	ld	(#_gpit + 0),a
;./engine/enengine.c:475: gpjt = 3; while (gpjt --) {
	ld	hl,#_gpjt + 0
	ld	(hl), #0x03
00177$:
	ld	hl,#_gpjt + 0
	ld	d, (hl)
	ld	hl, #_gpjt+0
	dec	(hl)
	ld	a,d
	or	a, a
	jp	Z,00180$
;./engine/enengine.c:476: gpit += 2; if (gpit > 2) gpit -=3;
	ld	hl, #_gpit+0
	inc	(hl)
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,#0x02
	ld	iy,#_gpit
	sub	a, 0 (iy)
	jr	NC,00104$
	ld	hl,#_gpit
	ld	a,(hl)
	add	a,#0xFD
	ld	(hl),a
00104$:
;./engine/enengine.c:479: _en_t = en_t [gpit];
	ld	a,#<(_en_t)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_t)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_t + 0),a
;./engine/enengine.c:480: _en_s = en_s [gpit];
	ld	a,#<(_en_s)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_s)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_s + 0),a
;./engine/enengine.c:481: _en_x = en_x [gpit]; _en_y = en_y [gpit];
	ld	a,#<(_en_x)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_x)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_x + 0),a
	ld	a,#<(_en_y)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_y)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_y + 0),a
;./engine/enengine.c:482: _en_x1 = en_x1 [gpit]; _en_y1 = en_y1 [gpit];
	ld	a,#<(_en_x1)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_x1)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_x1 + 0),a
	ld	a,#<(_en_y1)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_y1)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_y1 + 0),a
;./engine/enengine.c:483: _en_x2 = en_x2 [gpit]; _en_y2 = en_y2 [gpit];
	ld	a,#<(_en_x2)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_x2)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_x2 + 0),a
	ld	a,#<(_en_y2)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_y2)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_y2 + 0),a
;./engine/enengine.c:484: _en_mx = en_mx [gpit]; _en_my = en_my [gpit];
	ld	a,#<(_en_mx)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_mx)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_mx + 0),a
	ld	a,#<(_en_my)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_my)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_my + 0),a
;./engine/enengine.c:485: _en_ct = en_ct [gpit];
	ld	a,#<(_en_ct)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_ct)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_ct + 0),a
;./engine/enengine.c:486: _en_facing = en_facing [gpit];
	ld	a,#<(_en_facing)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_facing)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_facing + 0),a
;./engine/enengine.c:487: _en_state = en_state [gpit];
	ld	a,#<(_en_state)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_state)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_state + 0),a
;./engine/enengine.c:494: if (_en_t == 0) continue;
	ld	a,(#__en_t + 0)
	or	a, a
	jp	Z,00177$
;./engine/enengine.c:495: en_is_alive = !(en_flags [gpit] & EN_STATE_DEAD);
	ld	iy,#_en_flags
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	and	a,#0x01
	xor	a,#0x01
	ld	(#_en_is_alive + 0),a
;./engine/enengine.c:499: en_spr = 0xff;
	ld	hl,#_en_spr + 0
	ld	(hl), #0xFF
;./engine/enengine.c:502: en_spr_x_mod = 0;
	ld	hl,#_en_spr_x_mod + 0
	ld	(hl), #0x00
;./engine/enengine.c:505: if (en_cttouched [gpit]) {
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-3 (ix), a
	or	a, a
	jp	Z,00172$
;./engine/enengine.c:506: -- en_cttouched [gpit];
	ld	d,-3 (ix)
	dec	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;./engine/enengine.c:522: rda = frame_counter & 0xf;
	ld	a,(#_frame_counter + 0)
	and	a, #0x0F
	ld	(#_rda + 0),a
;./engine/enengine.c:526: spr_enems [ENEMS_EXPLODING_CELL]
	ld	hl,(_spr_enems)
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0040
	add	hl, de
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
;./engine/enengine.c:525: _en_y + jitter [15 - rda] + SPRITE_ADJUST, 
	ld	a,(#_rda + 0)
	ld	-9 (ix),a
	ld	-8 (ix),#0x00
	ld	a,#0x0F
	sub	a, -9 (ix)
	ld	-9 (ix),a
	ld	a,#0x00
	sbc	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,#<(_jitter)
	add	a, -9 (ix)
	ld	-9 (ix),a
	ld	a,#>(_jitter)
	adc	a, -8 (ix)
	ld	-8 (ix),a
	pop	hl
	push	hl
	ld	h,(hl)
	ld	a,(#__en_y + 0)
	add	a, h
	add	a, #0xF7
	ld	b,a
;./engine/enengine.c:524: _en_x + jitter [rda],
	ld	a,#<(_jitter)
	ld	hl,#_rda
	add	a, (hl)
	ld	e,a
	ld	a,#>(_jitter)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	h,a
	ld	a,(#__en_x + 0)
	add	a, h
	ld	d,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	c, d
	push	bc
	call	_SG_addMetaSprite
	pop	af
	pop	af
	jp	00174$
00172$:
;./engine/enengine.c:545: if (en_is_alive) {
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00174$
;./engine/enengine.c:548: pregotten = (prx + 7 >= _en_x && prx <= _en_x + 15);
	ld	a,(#_prx + 0)
	ld	-9 (ix),a
	ld	-8 (ix),#0x00
	ld	a,-9 (ix)
	add	a, #0x07
	ld	d,a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	e,a
	ld	iy,#__en_x
	ld	a,0 (iy)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,d
	sub	a, -2 (ix)
	ld	a,e
	sbc	a, -1 (ix)
	jp	PO, 00374$
	xor	a, #0x80
00374$:
	jp	M,00182$
	ld	a,-2 (ix)
	add	a, #0x0F
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	a,-2 (ix)
	sub	a, -9 (ix)
	ld	a,-1 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00375$
	xor	a, #0x80
00375$:
	jp	P,00183$
00182$:
	ld	-9 (ix),#0x00
	jr	00184$
00183$:
	ld	-9 (ix),#0x01
00184$:
	ld	a,-9 (ix)
	ld	(#_pregotten + 0),a
;./engine/enengine.c:551: en_fr = ((((_en_mx) ? _en_x : _en_y)+4) >> 3) & 1;
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00185$
	ld	hl,#__en_x + 0
	ld	e, (hl)
	jr	00186$
00185$:
	ld	hl,#__en_y + 0
	ld	e, (hl)
00186$:
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
	ld	a,e
	and	a, #0x01
	ld	h,a
	ld	iy,#_en_fr
	ld	0 (iy),h
;./engine/enengine.c:572: switch (_en_t & 63) {
	ld	iy,#__en_t
	ld	a,0 (iy)
	and	a, #0x3F
	ld	e,a
	sub	a, #0x01
	jp	C,00122$
	ld	a,#0x04
	sub	a, e
	jp	C,00122$
	dec	e
	ld	d,#0x00
	ld	hl,#00376$
	add	hl,de
	add	hl,de
;./engine/enengine.c:573: case 1:
	jp	(hl)
00376$:
	jr	00107$
	jr	00108$
	jr	00109$
	jr	00110$
00107$:
;./engine/enengine.c:574: case 2:
00108$:
;./engine/enengine.c:575: case 3:
00109$:
;./engine/enengine.c:576: case 4:
00110$:
;./engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	iy,#_en_status
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00119$
	ld	a,(#_half_life + 0)
	or	a, a
	jp	Z,00120$
00119$:
;./engine/../engine/enemmods/enem_linear.h:15: _en_x += _en_mx;
	ld	a,(#__en_x + 0)
	ld	hl,#__en_mx
	ld	iy,#__en_x
	add	a, (hl)
	ld	0 (iy),a
;./engine/../engine/enemmods/enem_linear.h:32: _en_y += _en_my;
	ld	a,(#__en_y + 0)
	ld	hl,#__en_my
	ld	iy,#__en_y
	add	a, (hl)
	ld	0 (iy),a
;./engine/../engine/enemmods/enem_linear.h:53: if (_en_x == _en_x1 || _en_x == _en_x2) _en_mx = -_en_mx;
	ld	a,(#__en_x + 0)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	Z,00111$
	ld	a,(#__en_x + 0)
	ld	iy,#__en_x2
	sub	a, 0 (iy)
	jr	NZ,00112$
00111$:
	xor	a, a
	ld	iy,#__en_mx
	sub	a, 0 (iy)
	ld	(#__en_mx + 0),a
00112$:
;./engine/../engine/enemmods/enem_linear.h:60: if (_en_y <= _en_y1) { _en_y = _en_y1; _en_my = ABS (_en_my); }
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
	ld	-9 (ix),a
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	e,a
	ld	a,(#__en_my + 0)
	ld	-3 (ix),a
	ld	a,(#__en_y1)
	ld	iy,#__en_y
	sub	a, 0 (iy)
	jr	C,00117$
	ld	a,(#__en_y1 + 0)
	ld	(#__en_y + 0),a
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00187$
	ld	-2 (ix),e
	jr	00188$
00187$:
	ld	a,-3 (ix)
	ld	-2 (ix),a
00188$:
	ld	a,-2 (ix)
	ld	(#__en_my + 0),a
	jr	00120$
00117$:
;./engine/../engine/enemmods/enem_linear.h:61: else if (_en_y >= _en_y2) { _en_y = _en_y2; _en_my = -ABS (_en_my); }
	ld	hl,#__en_y2
	ld	a,(#__en_y + 0)
	sub	a, (hl)
	jr	C,00120$
	ld	a,(#__en_y2 + 0)
	ld	(#__en_y + 0),a
	ld	a,-9 (ix)
	or	a, a
	jr	NZ,00190$
	ld	e,-3 (ix)
00190$:
	xor	a, a
	sub	a, e
	ld	(#__en_my + 0),a
00120$:
;./engine/../engine/enemmods/enem_linear.h:77: rda = _en_mx ? (_en_mx < 0) : (_en_my < 0); enems_facing ();
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00191$
	ld	a,(#__en_mx + 0)
	rlca
	and	a,#0x01
	jr	00192$
00191$:
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
00192$:
	ld	(#_rda + 0),a
	call	_enems_facing
;./engine/../engine/enemmods/enem_linear.h:79: en_spr = _en_s + en_fr + _en_facing;
	ld	hl,#_en_fr
	ld	a,(#__en_s + 0)
	add	a, (hl)
	ld	hl,#__en_facing
	ld	iy,#_en_spr
	add	a, (hl)
	ld	0 (iy),a
;./engine/enengine.c:664: }
00122$:
;./engine/enengine.c:668: en_spr_id [gpit] = en_spr;
	ld	a,#<(_en_spr_id)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_spr_id)
	adc	a, #0x00
	ld	d,a
	ld	a,(#_en_spr + 0)
	ld	(de),a
;./engine/enengine.c:705: if (_en_t == 4 && pregotten && !pgotten && !pj) {
	ld	a,(#__en_t + 0)
	sub	a, #0x04
	jr	NZ,00380$
	ld	a,#0x01
	jr	00381$
00380$:
	xor	a,a
00381$:
	ld	-9 (ix),a
;./engine/enengine.c:710: if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
	ld	hl,#__en_y + 0
	ld	b, (hl)
	ld	c,#0x00
;./engine/enengine.c:705: if (_en_t == 4 && pregotten && !pgotten && !pj) {
	ld	a,-9 (ix)
	or	a, a
	jp	Z,00136$
	ld	a,(#_pregotten + 0)
	or	a, a
	jp	Z,00136$
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00136$
	ld	a,(#_pj + 0)
	or	a, a
	jp	NZ,00136$
;./engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	-1 (ix),a
;./engine/enengine.c:713: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	a,b
	add	a,#0xF0
	ld	l,a
	ld	a,c
	adc	a,#0xFF
	ld	h,a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-5 (ix),l
	ld	-4 (ix),h
;./engine/enengine.c:709: if (_en_mx) {
	ld	a,(#__en_mx + 0)
	or	a, a
	jp	Z,00127$
;./engine/enengine.c:710: if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
	ld	iy,#_pry
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#0x0010
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00382$
	xor	a, #0x80
00382$:
	jp	M,00127$
	ld	hl,#0x000C
	add	hl,de
	ld	a,b
	sub	a, l
	ld	a,c
	sbc	a, h
	jp	PO, 00383$
	xor	a, #0x80
00383$:
	jp	M,00127$
;./engine/enengine.c:711: pgotten = 1;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x01
;./engine/enengine.c:712: pgtmx = _en_mx << (6 - en_status [gpit]);
	ld	hl,#__en_mx + 0
	ld	d, (hl)
	ld	a,(#__en_mx + 0)
	rla
	sbc	a, a
	ld	e,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,#0x06
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	ld	a,l
	push	af
	ld	hl,#_pgtmx + 0
	ld	(hl), d
	ld	hl,#_pgtmx + 1
	ld	(hl), e
	pop	af
	inc	a
	jr	00385$
00384$:
	ld	iy,#_pgtmx
	sla	0 (iy)
	ld	iy,#_pgtmx
	rl	1 (iy)
00385$:
	dec	a
	jr	NZ,00384$
;./engine/enengine.c:713: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(_py),hl
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
00127$:
;./engine/enengine.c:710: if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
	ld	hl,#_pry + 0
	ld	e, (hl)
	ld	d,#0x00
;./engine/enengine.c:721: (_en_my > 0 && pry + 16 + _en_my >= _en_y && pry + 12 <= _en_y)
	ld	a,(#__en_my + 0)
	ld	-7 (ix),a
	ld	iy,#__en_my
	ld	a,0 (iy)
	rla
	sbc	a, a
	ld	-6 (ix),a
;./engine/enengine.c:720: (_en_my < 0 && pry + 17 >= _en_y && pry + 12 <= _en_y) ||
	ld	hl,#0x000C
	add	hl,de
	ld	a,b
	sub	a, l
	ld	a,c
	sbc	a, h
	jp	PO, 00386$
	xor	a, #0x80
00386$:
	rlca
	and	a,#0x01
	ld	-3 (ix),a
	ld	iy,#__en_my
	bit	7,0 (iy)
	jr	Z,00134$
	ld	hl,#0x0011
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00387$
	xor	a, #0x80
00387$:
	jp	M,00134$
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00128$
00134$:
;./engine/enengine.c:721: (_en_my > 0 && pry + 16 + _en_my >= _en_y && pry + 12 <= _en_y)
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	jp	PO, 00388$
	xor	a, #0x80
00388$:
	jp	P,00136$
	ld	hl,#0x0010
	add	hl,de
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00389$
	xor	a, #0x80
00389$:
	jp	M,00136$
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00136$
00128$:
;./engine/enengine.c:723: pgotten = 1;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x01
;./engine/enengine.c:724: pgtmy = _en_my << (6 - en_status [gpit]);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,#0x06
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	push	af
	ld	a,-7 (ix)
	ld	iy,#_pgtmy
	ld	0 (iy),a
	ld	a,-6 (ix)
	ld	iy,#_pgtmy
	ld	1 (iy),a
	pop	af
	inc	l
	jr	00391$
00390$:
	ld	iy,#_pgtmy
	sla	0 (iy)
	ld	iy,#_pgtmy
	rl	1 (iy)
00391$:
	dec	l
	jr	NZ,00390$
;./engine/enengine.c:725: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(_py),hl
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
;./engine/enengine.c:726: pvy = 0;
	ld	hl,#0x0000
	ld	(_pvy),hl
00136$:
;./engine/enengine.c:738: en_is_alive == 0	// General condition.
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00174$
;./engine/enengine.c:740: || en_cttouched [gpit]
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	or	a, a
	jp	NZ,00174$
;./engine/enengine.c:766: ) goto skipdo;
	ld	a,-9 (ix)
	or	a, a
	jp	NZ,00174$
;./engine/enengine.c:774: pregotten && 
	ld	a,(#_pregotten + 0)
	or	a, a
	jp	Z,00161$
;./engine/enengine.c:775: pry < _en_y && 
	ld	hl,#__en_y
	ld	a,(#_pry + 0)
	sub	a, (hl)
	jp	NC,00161$
;./engine/enengine.c:776: pry + 15 + ENEMS_COLLISION_VSTRETCH_FG >= _en_y &&
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	ld	de,#0x0013
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00392$
	xor	a, #0x80
00392$:
	jp	M,00161$
;./engine/enengine.c:777: pgotten == 0 &&	ppossee == 0
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00161$
	ld	a,(#_ppossee + 0)
	or	a, a
	jp	NZ,00161$
;./engine/enengine.c:796: if (_en_t >= PLAYER_STEPS_MIN_KILLABLE)
	ld	a,(#__en_t + 0)
	sub	a, #0x03
	jr	C,00145$
;./engine/enengine.c:798: enems_hit ();
	call	_enems_hit
00145$:
;./engine/enengine.c:801: if (_en_my < 0) _en_my = -_en_my;
	ld	a,(#__en_my + 0)
	bit	7,a
	jr	Z,00147$
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	(#__en_my + 0),a
00147$:
;./engine/enengine.c:805: if (pad0 & PAD_A) {
	ld	hl,#_pad0+0
	bit	5, (hl)
	jr	Z,00149$
;./engine/enengine.c:806: jump_start ();
	call	_jump_start
	jr	00150$
00149$:
;./engine/enengine.c:810: pvy = -PLAYER_VY_JUMP_INITIAL << 1;
	ld	hl,#0xFF80
	ld	(_pvy),hl
00150$:
;./engine/enengine.c:812: PSGSFXPlay (SFX_STEPON, 3);
	ld	de,#_s_15_stepon3_psg
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./engine/enengine.c:818: if (pry > _en_y - ENEMS_UPPER_COLLISION_BOUND) { pry = _en_y - ENEMS_UPPER_COLLISION_BOUND; py = pry << FIXBITS; }
	ld	a,(#__en_y + 0)
	ld	l, #0x00
	add	a,#0xF4
	ld	e,a
	ld	a,l
	adc	a,#0xFF
	ld	d,a
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00394$
	xor	a, #0x80
00394$:
	jp	P,00152$
	ld	hl,#_pry
	ld	a,(#__en_y + 0)
	add	a,#0xF4
	ld	(hl),a
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
00152$:
;./engine/enengine.c:820: touched = 1;
	ld	hl,#_touched + 0
	ld	(hl), #0x01
	jr	00174$
00161$:
;./engine/enengine.c:828: touched == 0 &&
	ld	a,(#_touched + 0)
	or	a, a
	jr	NZ,00174$
;./engine/enengine.c:829: collide ()
	call	_collide
	ld	a,l
	or	a, a
	jr	Z,00174$
;./engine/enengine.c:835: en_sg_1 = 0;
	ld	hl,#_en_sg_1 + 0
	ld	(hl), #0x00
;./engine/enengine.c:839: en_sg_2 = (pflickering == 0);
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00395$
	ld	a,#0x01
	jr	00396$
00395$:
	xor	a,a
00396$:
;./engine/enengine.c:878: if (en_sg_2) { 
	ld	(#_en_sg_2 + 0),a
	or	a, a
	jr	Z,00156$
;./engine/enengine.c:879: pkill = 1; 
	ld	hl,#_pkill + 0
	ld	(hl), #0x01
00156$:
;./engine/enengine.c:894: touched = 1; 
	ld	hl,#_touched + 0
	ld	(hl), #0x01
;./engine/enengine.c:1015: skipdo: 
00174$:
;./engine/enengine.c:1018: if (en_spr != 0xff) {
	ld	a,(#_en_spr + 0)
	inc	a
	jr	Z,00176$
;./engine/enengine.c:1021: spr_enems [en_spr]
	ld	iy,#_en_spr
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ex	de,hl
	ld	hl,(_spr_enems)
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;./engine/enengine.c:1020: _en_x + en_spr_x_mod, _en_y + SPRITE_ADJUST, 
	ld	a,(#__en_y + 0)
	add	a, #0xF7
	ld	d,a
	ld	hl,#_en_spr_x_mod
	ld	a,(#__en_x + 0)
	add	a, (hl)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_SG_addMetaSprite
	pop	af
	pop	af
00176$:
;./engine/enengine.c:1027: enems_update_unsigned_char_arrays ();
	call	_enems_update_unsigned_char_arrays
	jp	00177$
00180$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
