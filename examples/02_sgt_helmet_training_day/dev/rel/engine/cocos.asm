;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 14:10:15 2019
;--------------------------------------------------------
	.module cocos
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cocos_do
	.globl _cocos_destroy
	.globl _cocos_shoot_linear
	.globl _cocos_init
	.globl _PSGSFXPlay
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
;./engine/cocos.c:29: void cocos_init (void) {
;	---------------------------------
; Function cocos_init
; ---------------------------------
_cocos_init::
;./engine/cocos.c:30: coco_it = COCOS_MAX; while (coco_it --) {
	ld	hl,#_coco_it + 0
	ld	(hl), #0x04
	ld	de,#_coco_on+0
00101$:
	ld	hl,#_coco_it + 0
	ld	b, (hl)
	ld	hl, #_coco_it+0
	dec	(hl)
	ld	a,b
	or	a, a
	jr	Z,00103$
;./engine/cocos.c:31: coco_slots [coco_it] = coco_it;
	ld	a,#<(_coco_slots)
	ld	hl,#_coco_it
	add	a, (hl)
	ld	c,a
	ld	a,#>(_coco_slots)
	adc	a, #0x00
	ld	b,a
	ld	a,(#_coco_it + 0)
	ld	(bc),a
;./engine/cocos.c:32: coco_on [coco_it] = 0;
	ld	hl,(_coco_it)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x00
	jr	00101$
00103$:
;./engine/cocos.c:34: coco_slots_i = COCOS_MAX;
	ld	hl,#_coco_slots_i + 0
	ld	(hl), #0x04
	ret
;./engine/cocos.c:68: void cocos_shoot_linear (void) {
;	---------------------------------
; Function cocos_shoot_linear
; ---------------------------------
_cocos_shoot_linear::
;./engine/cocos.c:69: if (coco_slots_i == 0) return;
	ld	a,(#_coco_slots_i + 0)
	or	a, a
	ret	Z
;./engine/cocos.c:71: -- coco_slots_i; coco_it = coco_slots [coco_slots_i];
	ld	hl, #_coco_slots_i+0
	dec	(hl)
	ld	de,#_coco_slots+0
	ld	hl,(_coco_slots_i)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(#_coco_it + 0),a
;./engine/cocos.c:73: coco_x [coco_it] = rdx << 6;
	ld	bc,#_coco_x+0
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	d,l
	ld	e,h
	ld	iy,#_rdx
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l, d
	ld	h, e
	ld	(hl),c
	inc	hl
	ld	(hl),b
;./engine/cocos.c:74: coco_y [coco_it] = rdy << 6;
	ld	bc,#_coco_y+0
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	d,l
	ld	e,h
	ld	iy,#_rdy
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l, d
	ld	h, e
	ld	(hl),c
	inc	hl
	ld	(hl),b
;./engine/cocos.c:76: coco_vx [coco_it] = coco_dx [rda];
	ld	de,#_coco_vx+0
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ex	de,hl
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	bc,#_coco_dx
	add	hl,bc
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
	ld	a,b
	ld	(de),a
	inc	de
	ld	a,c
	ld	(de),a
;./engine/cocos.c:77: coco_vy [coco_it] = coco_dy [rda];
	ld	de,#_coco_vy+0
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ex	de,hl
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	bc,#_coco_dy
	add	hl,bc
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
	ld	a,b
	ld	(de),a
	inc	de
	ld	a,c
	ld	(de),a
;./engine/cocos.c:79: coco_on [coco_it] = 1;
	ld	de,#_coco_on+0
	ld	hl,(_coco_it)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x01
;./engine/cocos.c:81: PSGSFXPlay (SFX_COCO, 1);
	ld	de,#_s_10_coco2_psg
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
	ret
;./engine/cocos.c:85: void cocos_destroy (void) {
;	---------------------------------
; Function cocos_destroy
; ---------------------------------
_cocos_destroy::
;./engine/cocos.c:86: coco_on [coco_it] = 0;
	ld	de,#_coco_on+0
	ld	hl,(_coco_it)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x00
;./engine/cocos.c:87: coco_slots [coco_slots_i] = coco_it; coco_slots_i ++;
	ld	de,#_coco_slots+0
	ld	hl,(_coco_slots_i)
	ld	h,#0x00
	add	hl,de
	ld	a,(#_coco_it + 0)
	ld	(hl),a
	ld	hl, #_coco_slots_i+0
	inc	(hl)
;./engine/cocos.c:88: PSGSFXPlay (SFX_DUMMY1, 3);
	ld	de,#_s_06_dummy13_psg
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
	ret
;./engine/cocos.c:91: void cocos_do (void) {
;	---------------------------------
; Function cocos_do
; ---------------------------------
_cocos_do::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;./engine/cocos.c:92: coco_it = COCOS_MAX; while (coco_it --) if (coco_on [coco_it]) {
	ld	hl,#_coco_it + 0
	ld	(hl), #0x04
00116$:
	ld	a,(#_coco_it + 0)
	ld	-9 (ix),a
	ld	hl, #_coco_it+0
	dec	(hl)
	ld	a,-9 (ix)
	or	a, a
	jp	Z,00119$
	ld	a,#<(_coco_on)
	ld	hl,#_coco_it
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_coco_on)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-2 (ix), a
	or	a, a
	jr	Z,00116$
;./engine/cocos.c:94: coco_x [coco_it] += coco_vx [coco_it];
	ld	a,(#_coco_it + 0)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	sla	c
	rl	b
	ld	iy,#_coco_x
	add	iy, bc
	ld	e,0 (iy)
	ld	d,1 (iy)
	ld	hl,#_coco_vx
	add	hl,bc
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	0 (iy),l
	ld	1 (iy),h
;./engine/cocos.c:95: coco_y [coco_it] += coco_vy [coco_it];
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	iy,#_coco_y
	add	iy, bc
	ld	e,0 (iy)
	ld	d,1 (iy)
	ld	hl,#_coco_vy
	add	hl,bc
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	0 (iy),l
	ld	1 (iy),h
;./engine/cocos.c:98: if (coco_x [coco_it] < 0 || coco_x [coco_it] > 248<<FIXBITS || coco_y [coco_it] < 16<<FIXBITS || coco_y [coco_it] > 200<<FIXBITS) {
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl,#_coco_x
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	bit	7, d
	jr	NZ,00101$
	xor	a, a
	cp	a, e
	ld	a,#0x3E
	sbc	a, d
	jp	PO, 00171$
	xor	a, #0x80
00171$:
	jp	M,00101$
	ld	hl,#_coco_y
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,b
	xor	a, #0x80
	sub	a, #0x84
	jr	C,00101$
	xor	a, a
	cp	a, c
	ld	a,#0x32
	sbc	a, b
	jp	PO, 00172$
	xor	a, #0x80
00172$:
	jp	P,00102$
00101$:
;./engine/cocos.c:99: cocos_destroy ();
	call	_cocos_destroy
;./engine/cocos.c:100: continue;
	jp	00116$
00102$:
;./engine/cocos.c:103: rdx = coco_x [coco_it] >> 6;
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	hl,#_rdx + 0
	ld	(hl), e
;./engine/cocos.c:104: rdy = coco_y [coco_it] >> 6;
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl,#_rdy + 0
	ld	(hl), c
;./engine/cocos.c:107: HW_addSprite (rdx, rdy + SPRITE_ADJUST, COCO_PATTERN, COCO_COLOUR);
	ld	a,(#_rdy + 0)
	add	a, #0xF7
	ld	d,a
	ld	hl,#0x0FA4
	push	hl
	push	de
	inc	sp
	ld	a,(_rdx)
	push	af
	inc	sp
	call	_SG_addSprite
	pop	af
	pop	af
;./engine/cocos.c:111: rdm = c_behs [map_buff [((rdx + 4) >> 4) | ((rdy + 4 - 16) & 0xf0)]];
	ld	a,(#_rdx + 0)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	add	a, #0x04
	ld	e,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	d,a
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a,(#_rdy + 0)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,-6 (ix)
	add	a, #0xF4
	ld	h,a
	ld	a,-5 (ix)
	adc	a, #0xFF
	ld	a,h
	and	a, #0xF0
	ld	c,a
	ld	b,#0x00
	ld	a,e
	or	a, c
	ld	l,a
	ld	a,d
	or	a, b
	ld	h,a
	ld	de,#_map_buff
	add	hl,de
	ld	e,(hl)
	ld	hl,(_c_behs)
	ld	d,#0x00
	add	hl, de
	ld	a,(hl)
	ld	iy,#_rdm
	ld	0 (iy),a
;./engine/cocos.c:115: if (rdm & 8) {
	ld	iy,#_rdm
	bit	3, 0 (iy)
	jr	Z,00107$
;./engine/cocos.c:116: cocos_destroy (); continue;
	call	_cocos_destroy
	jp	00116$
00107$:
;./engine/cocos.c:121: if (pflickering == 0 && 
	ld	a,(#_pflickering + 0)
	or	a, a
	jp	NZ,00116$
;./engine/cocos.c:122: rdx + 7 >= prx && 
	ld	a,-2 (ix)
	add	a, #0x07
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	iy,#_prx
	ld	a,0 (iy)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	a,-8 (ix)
	sub	a, -4 (ix)
	ld	a,-7 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00174$
	xor	a, #0x80
00174$:
	jp	M,00116$
;./engine/cocos.c:123: rdx <= prx + 7 && 
	ld	a,-4 (ix)
	add	a, #0x07
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	a,-4 (ix)
	sub	a, -2 (ix)
	ld	a,-3 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00175$
	xor	a, #0x80
00175$:
	jp	M,00116$
;./engine/cocos.c:124: rdy + 7 + PLAYER_COLLISION_VSTRETCH_FG >= pry && 
	ld	a,-6 (ix)
	add	a, #0x03
	ld	-4 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	iy,#_pry
	ld	a,0 (iy)
	ld	-8 (ix),a
	ld	-7 (ix),#0x00
	ld	a,-4 (ix)
	sub	a, -8 (ix)
	ld	a,-3 (ix)
	sbc	a, -7 (ix)
	jp	PO, 00176$
	xor	a, #0x80
00176$:
	jp	M,00116$
;./engine/cocos.c:125: rdy <= pry + 12
	ld	a,-8 (ix)
	add	a, #0x0C
	ld	-4 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	a,-4 (ix)
	sub	a, -6 (ix)
	ld	a,-3 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00177$
	xor	a, #0x80
00177$:
	jp	M,00116$
;./engine/cocos.c:127: en_sg_2 = 1;
	ld	hl,#_en_sg_2 + 0
	ld	(hl), #0x01
;./engine/cocos.c:129: pkill = en_sg_2;
	ld	hl,#_pkill + 0
	ld	(hl), #0x01
;./engine/cocos.c:130: cocos_destroy ();
	call	_cocos_destroy
	jp	00116$
00119$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
