;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module general
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _do_update_list_and_wait
	.globl _update_cycle
	.globl _distance
	.globl _pad_read
	.globl _add_sign
	.globl _collide
	.globl _collide_in
	.globl _cm_two_points
	.globl _clear_update_list
	.globl _SG_doUpdateList
	.globl _SG_copySpritestoSAT
	.globl _SG_getKeysStatus
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
;./engine/general.c:28: void cm_two_points (void) {
;	---------------------------------
; Function cm_two_points
; ---------------------------------
_cm_two_points::
;./engine/general.c:30: if (cy1 > 12 || cy2 > 12) { at1 = at2 = 0; return; }
	ld	a,#0x0c
	ld	iy,#_cy1
	sub	a, 0 (iy)
	jr	C,00101$
	ld	a,#0x0c
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
;./engine/general.c:31: at1 = ATTR (cx1, cy1 ? cy1 - 1 : 0);
	ld	bc,#_map_buff+0
	ld	iy,#_cy1
	ld	a,0 (iy)
	or	a, a
	jr	Z,00106$
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
	ex	de,hl
	ld	a,(#_cx1 + 0)
	ld	h, #0x00
	or	a, e
	ld	l,a
	ld	a,h
	or	a, d
	ld	h,a
	add	hl,bc
	ld	e,(hl)
	ld	iy,#_c_behs
	ld	a,0 (iy)
	add	a, e
	ld	e,a
	ld	a,1 (iy)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_at1 + 0),a
;./engine/general.c:32: at2 = ATTR (cx2, cy2 ? cy2 - 1 : 0);
	ld	iy,#_cy2
	ld	a,0 (iy)
	or	a, a
	jr	Z,00108$
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
	ld	c,(hl)
	ld	hl,(_c_behs)
	ld	b,#0x00
	add	hl, bc
	ld	a,(hl)
	ld	(#_at2 + 0),a
	ret
;./engine/general.c:47: unsigned char collide_in (unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1) {
;	---------------------------------
; Function collide_in
; ---------------------------------
_collide_in::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./engine/general.c:48: return (x0 >= x1 && x0 <= x1 + 15 && y0 >= y1 && y0 <= y1 + 15);	
	ld	a,4 (ix)
	sub	a, 6 (ix)
	jr	C,00103$
	ld	c,6 (ix)
	ld	b,#0x00
	ld	hl,#0x000f
	add	hl,bc
	ld	c,4 (ix)
	ld	b,#0x00
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	M,00103$
	ld	a,5 (ix)
	sub	a, 7 (ix)
	jr	C,00103$
	ld	c,7 (ix)
	ld	b,#0x00
	ld	hl,#0x000f
	add	hl,bc
	ld	c,5 (ix)
	ld	b,#0x00
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
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
;./engine/general.c:51: unsigned char collide (void) {
;	---------------------------------
; Function collide
; ---------------------------------
_collide::
	push	ix
	dec	sp
;./engine/general.c:61: prx + 3 >= _en_x && 
	ld	hl,#_prx + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	iy,#__en_x
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	M,00103$
;./engine/general.c:62: prx <= _en_x + 11 && 
	ld	de,#0x000b
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	M,00103$
;./engine/general.c:63: pry + 13 + ENEMS_COLLISION_VSTRETCH_FG >= _en_y &&
	ld	hl,#_pry + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	hl,#0x000d
	add	hl,bc
	ex	de,hl
	ld	iy,#__en_y
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	M,00103$
;./engine/general.c:64: pry <= _en_y + 13 + PLAYER_COLLISION_VSTRETCH_FG
	ld	de,#0x0009
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
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
;./engine/general.c:69: signed int add_sign (signed int sign, signed int value) {
;	---------------------------------
; Function add_sign
; ---------------------------------
_add_sign::
;./engine/general.c:70: return sign == 0 ? 0 : sign < 0 ? -value : value;
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
;./engine/general.c:91: void pad_read (void) {
;	---------------------------------
; Function pad_read
; ---------------------------------
_pad_read::
;./engine/general.c:94: pad_this_frame = pad0;
	ld	a,(#_pad0 + 0)
	ld	(#_pad_this_frame + 0),a
;./engine/general.c:95: pad0 = HW_getKeysStatus ();			// Read pads here.
	call	_SG_getKeysStatus
	ld	iy,#_pad0
	ld	0 (iy),l
;./engine/general.c:96: pad_this_frame = (pad_this_frame ^ pad0) & pad0;
	ld	a,(#_pad_this_frame + 0)
	ld	iy,#_pad0
	xor	a, 0 (iy)
	and	a, 0 (iy)
	ld	(#_pad_this_frame + 0),a
	ret
;./engine/general.c:102: unsigned char distance (void) {
;	---------------------------------
; Function distance
; ---------------------------------
_distance::
;./engine/general.c:103: rda = DELTA (prx, rdx); // dx
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
;./engine/general.c:104: rdb = DELTA (pry, rdy); // dy
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
;./engine/general.c:105: rdc = MIN (rda, rdb);
	ld	hl,#_rdb
	ld	iy,#_rda
	ld	a,0 (iy)
	sub	a, (hl)
	jr	NC,00107$
	ld	c,0 (iy)
	jr	00108$
00107$:
	ld	hl,#_rdb + 0
	ld	c, (hl)
00108$:
	ld	hl,#_rdc + 0
	ld	(hl), c
;./engine/general.c:106: return (rda + rdb - (rdc >> 1) - (rdc >> 2) + (rdc >> 4));
	ld	hl,#_rdb
	ld	a,(#_rda + 0)
	add	a, (hl)
	ld	c,a
	ld	iy,#_rdc
	ld	b,0 (iy)
	srl	b
	ld	a,c
	sub	a, b
	ld	c,a
	ld	b,0 (iy)
	srl	b
	srl	b
	ld	a,c
	sub	a, b
	ld	c,a
	ld	a,0 (iy)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0f
	ld	l,a
	add	hl, bc
	ret
;./engine/general.c:134: void update_cycle (void) {
;	---------------------------------
; Function update_cycle
; ---------------------------------
_update_cycle::
;./engine/general.c:136: HW_waitForVBlank ();
	call	_SG_waitForVBlank
;./engine/general.c:137: HW_copySpritestoSAT ();
	call	_SG_copySpritestoSAT
;./engine/general.c:138: update_list [update_index] = 0xff;
	ld	bc,#_update_list+0
	ld	hl,(_update_index)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0xff
;./engine/general.c:139: HW_doUpdateList ();
	call	_SG_doUpdateList
;./engine/general.c:140: HW_initSprites ();
	call	_SG_initSprites
;./engine/general.c:141: clear_update_list ();
	jp  _clear_update_list
;./engine/general.c:144: void do_update_list_and_wait (void) {
;	---------------------------------
; Function do_update_list_and_wait
; ---------------------------------
_do_update_list_and_wait::
;./engine/general.c:145: update_list [update_index] = 0xff;
	ld	bc,#_update_list+0
	ld	hl,(_update_index)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0xff
;./engine/general.c:146: HW_waitForVBlank ();	
	call	_SG_waitForVBlank
;./engine/general.c:147: HW_doUpdateList ();
	jp  _SG_doUpdateList
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
