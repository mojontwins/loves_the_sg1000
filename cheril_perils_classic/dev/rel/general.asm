;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Oct 31 22:58:49 2018
;--------------------------------------------------------
	.module general
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _do_update_list_and_wait
	.globl _update_cycle
	.globl _jump_start
	.globl _distance
	.globl _pad_read
	.globl _add_sign
	.globl _collide
	.globl _collide_in
	.globl _cm_two_points
	.globl _clear_update_list
	.globl _SG_doUpdateList
	.globl _UNSAFE_SG_copySpritestoSAT
	.globl _SG_getKeysStatus
	.globl _SG_finalizeSprites
	.globl _SG_initSprites
	.globl _SG_waitForVBlank
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
;engine/general.c:20: void cm_two_points (void) {
;	---------------------------------
; Function cm_two_points
; ---------------------------------
_cm_two_points::
;engine/general.c:22: if (cy1 > 12 || cy2 > 12) { at1 = at2 = 0; return; }
	ld	a,#0x0C
	ld	iy,#_cy1
	sub	a, 0 (iy)
	jr	C,00101$
	ld	a,#0x0C
	ld	iy,#_cy2
	sub	a, 0 (iy)
	jr	NC,00102$
00101$:
	ld	hl,#_at2 + 0
	ld	(hl), #0x00
	ld	hl,#_at1 + 0
	ld	(hl), #0x00
	ret
00102$:
;engine/general.c:23: at1 = ATTR (cx1, cy1 ? cy1 - 1 : 0);
	ld	bc,#_map_buff+0
	ld	a,(#_cy1 + 0)
	or	a, a
	jr	Z,00106$
	ld	iy,#_cy1
	ld	l,0 (iy)
	ld	h,#0x00
	dec	hl
	jr	00107$
00106$:
	ld	hl,#0x0000
00107$:
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	d,l
	ld	e,h
	ld	a,(#_cx1 + 0)
	ld	h, #0x00
	or	a, d
	ld	l,a
	ld	a,h
	or	a, e
	ld	h,a
	add	hl,bc
	ld	d,(hl)
	ld	a,(#_c_behs + 0)
	add	a, d
	ld	e,a
	ld	a,(#_c_behs + 1)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_at1 + 0),a
;engine/general.c:24: at2 = ATTR (cx2, cy2 ? cy2 - 1 : 0);
	ld	a,(#_cy2 + 0)
	or	a, a
	jr	Z,00108$
	ld	iy,#_cy2
	ld	l,0 (iy)
	ld	h,#0x00
	dec	hl
	jr	00109$
00108$:
	ld	hl,#0x0000
00109$:
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	a,(#_cx2 + 0)
	ld	h, #0x00
	or	a, e
	ld	l,a
	ld	a,h
	or	a, d
	ld	h,a
	add	hl,bc
	ld	e,(hl)
	ld	hl,(_c_behs)
	ld	d,#0x00
	add	hl, de
	ld	a,(hl)
	ld	(#_at2 + 0),a
	ret
;engine/general.c:39: unsigned char collide_in (unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1) {
;	---------------------------------
; Function collide_in
; ---------------------------------
_collide_in::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;engine/general.c:40: return (x0 >= x1 && x0 <= x1 + 15 && y0 >= y1 && y0 <= y1 + 15);	
	ld	a,4 (ix)
	sub	a, 6 (ix)
	jr	C,00103$
	ld	l,6 (ix)
	ld	h,#0x00
	ld	bc,#0x000F
	add	hl,bc
	ld	d,4 (ix)
	ld	e,#0x00
	ld	a,l
	sub	a, d
	ld	a,h
	sbc	a, e
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	M,00103$
	ld	a,5 (ix)
	sub	a, 7 (ix)
	jr	C,00103$
	ld	l,7 (ix)
	ld	h,#0x00
	ld	bc,#0x000F
	add	hl,bc
	ld	d,5 (ix)
	ld	e,#0x00
	ld	a,l
	sub	a, d
	ld	a,h
	sbc	a, e
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	P,00104$
00103$:
	ld	l,#0x00
	jr	00105$
00104$:
	ld	l,#0x01
00105$:
	inc	sp
	pop	ix
	ret
;engine/general.c:43: unsigned char collide (void) {
;	---------------------------------
; Function collide
; ---------------------------------
_collide::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;engine/general.c:53: prx + 3 >= _en_x && 
	ld	hl,#_prx + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	iy,#__en_x
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	M,00103$
;engine/general.c:54: prx <= _en_x + 11 && 
	ld	bc,#0x000B
	add	hl,bc
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	M,00103$
;engine/general.c:55: pry + 13 + ENEMS_COLLISION_VSTRETCH_FG >= _en_y &&
	ld	hl,#_pry + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	hl,#0x000B
	add	hl,de
	ld	c,l
	ld	b,h
	ld	iy,#__en_y
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	M,00103$
;engine/general.c:56: pry <= _en_y + 13 + PLAYER_COLLISION_VSTRETCH_FG
	ld	bc,#0x0009
	add	hl,bc
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P,00104$
00103$:
	ld	l,#0x00
	jr	00105$
00104$:
	ld	l,#0x01
00105$:
	inc	sp
	pop	ix
	ret
;engine/general.c:61: signed int add_sign (signed int sign, signed int value) {
;	---------------------------------
; Function add_sign
; ---------------------------------
_add_sign::
;engine/general.c:62: return sign == 0 ? 0 : sign < 0 ? -value : value;
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00103$
	ld	hl,#0x0000
	ret
00103$:
	ld	hl, #2+1
	add	hl, sp
	bit	7,(hl)
	jr	Z,00105$
	xor	a, a
	ld	iy,#4
	add	iy,sp
	sub	a, 0 (iy)
	ld	l,a
	ld	a, #0x00
	sbc	a, 1 (iy)
	ld	h,a
	ret
00105$:
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ret
;engine/general.c:83: void pad_read (void) {
;	---------------------------------
; Function pad_read
; ---------------------------------
_pad_read::
;engine/general.c:86: pad_this_frame = pad0;
	ld	hl,(_pad0)
	ld	(_pad_this_frame),hl
;engine/general.c:87: pad0 = SG_getKeysStatus ();			// Read pads here.
	call	_SG_getKeysStatus
	ld	(_pad0),hl
;engine/general.c:88: pad_this_frame = (pad_this_frame ^ pad0) & pad0;
	ld	a,(#_pad_this_frame + 0)
	ld	iy,#_pad0
	xor	a, 0 (iy)
	ld	d,a
	ld	a,(#_pad_this_frame + 1)
	ld	iy,#_pad0
	xor	a, 1 (iy)
	ld	e,a
	ld	a,d
	ld	iy,#_pad0
	and	a, 0 (iy)
	ld	(#_pad_this_frame + 0),a
	ld	a,e
	ld	iy,#_pad0
	and	a, 1 (iy)
	ld	(#_pad_this_frame + 1),a
	ret
;engine/general.c:94: unsigned char distance (void) {
;	---------------------------------
; Function distance
; ---------------------------------
_distance::
;engine/general.c:95: rda = DELTA (prx, rdx); // dx
	ld	hl,#_rdx
	ld	a,(#_prx + 0)
	sub	a, (hl)
	jr	NC,00103$
	ld	hl,#_prx
	ld	a,(#_rdx + 0)
	sub	a, (hl)
	jr	00104$
00103$:
	ld	hl,#_rdx
	ld	a,(#_prx + 0)
	sub	a, (hl)
00104$:
	ld	(#_rda + 0),a
;engine/general.c:96: rdb = DELTA (pry, rdy); // dy
	ld	hl,#_rdy
	ld	a,(#_pry + 0)
	sub	a, (hl)
	jr	NC,00105$
	ld	hl,#_pry
	ld	a,(#_rdy + 0)
	sub	a, (hl)
	jr	00106$
00105$:
	ld	hl,#_rdy
	ld	a,(#_pry + 0)
	sub	a, (hl)
00106$:
	ld	(#_rdb + 0),a
;engine/general.c:97: rdc = MIN (rda, rdb);
	ld	hl,#_rdb
	ld	a,(#_rda + 0)
	cp	a,(hl)
	jr	C,00108$
	ld	a,(#_rdb + 0)
00108$:
	ld	(#_rdc + 0),a
;engine/general.c:98: return (rda + rdb - (rdc >> 1) - (rdc >> 2) + (rdc >> 4));
	ld	hl,#_rdb
	ld	a,(#_rda + 0)
	add	a, (hl)
	ld	d,a
	ld	iy,#_rdc
	ld	e,0 (iy)
	srl	e
	ld	a,d
	sub	a, e
	ld	d,a
	ld	iy,#_rdc
	ld	e,0 (iy)
	srl	e
	srl	e
	ld	a,d
	sub	a, e
	ld	c,a
	ld	a,(#_rdc + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	l,a
	add	hl, bc
	ret
;engine/general.c:103: void jump_start (void) {
;	---------------------------------
; Function jump_start
; ---------------------------------
_jump_start::
;engine/general.c:104: pj = 1; pctj = 0; 
	ld	hl,#_pj + 0
	ld	(hl), #0x01
	ld	hl,#_pctj + 0
	ld	(hl), #0x00
;engine/general.c:120: pvy = -PLAYER_VY_JUMP_INITIAL;
	ld	hl,#0xFFC0
	ld	(_pvy),hl
	ret
;engine/general.c:126: void update_cycle (void) {
;	---------------------------------
; Function update_cycle
; ---------------------------------
_update_cycle::
;engine/general.c:127: SG_finalizeSprites ();
	call	_SG_finalizeSprites
;engine/general.c:128: SG_waitForVBlank ();
	call	_SG_waitForVBlank
;engine/general.c:129: UNSAFE_SG_copySpritestoSAT ();
	call	_UNSAFE_SG_copySpritestoSAT
;engine/general.c:130: update_list [update_index] = 0xff;
	ld	de,#_update_list+0
	ld	hl,(_update_index)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0xFF
;engine/general.c:131: SG_doUpdateList ();
	call	_SG_doUpdateList
;engine/general.c:132: SG_initSprites ();
	call	_SG_initSprites
;engine/general.c:133: clear_update_list ();
	jp  _clear_update_list
;engine/general.c:136: void do_update_list_and_wait (void) {
;	---------------------------------
; Function do_update_list_and_wait
; ---------------------------------
_do_update_list_and_wait::
;engine/general.c:137: SG_waitForVBlank ();
	call	_SG_waitForVBlank
;engine/general.c:138: update_list [update_index] = 0xff;
	ld	de,#_update_list+0
	ld	hl,(_update_index)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0xFF
;engine/general.c:139: SG_doUpdateList ();
	jp  _SG_doUpdateList
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
