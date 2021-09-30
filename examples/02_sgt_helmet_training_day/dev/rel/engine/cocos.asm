;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module cocos
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cocos_do
	.globl _cocos_destroy
	.globl _cocos_shoot_linear
	.globl _cocos_shoot_aimed
	.globl _cocos_init
	.globl _distance
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
	ld	bc,#_coco_slots+0
00101$:
	ld	iy,#_coco_it
	ld	e,0 (iy)
	dec	0 (iy)
	ld	a,e
	or	a, a
	jr	Z,00103$
;./engine/cocos.c:31: coco_slots [coco_it] = coco_it;
	ld	hl,(_coco_it)
	ld	h,#0x00
	add	hl,bc
	ld	a,0 (iy)
	ld	(hl),a
;./engine/cocos.c:32: coco_on [coco_it] = 0;
	ld	a,#<(_coco_on)
	ld	hl,#_coco_it
	add	a, (hl)
	ld	e,a
	ld	a,#>(_coco_on)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
	jr	00101$
00103$:
;./engine/cocos.c:34: coco_slots_i = COCOS_MAX;
	ld	hl,#_coco_slots_i + 0
	ld	(hl), #0x04
	ret
;./engine/cocos.c:40: void cocos_shoot_aimed (void) {		
;	---------------------------------
; Function cocos_shoot_aimed
; ---------------------------------
_cocos_shoot_aimed::
;./engine/cocos.c:41: rdct = distance ();
	call	_distance
	ld	iy,#_rdct
	ld	0 (iy),l
;./engine/cocos.c:44: if (rdct > COCO_FAIR_D && coco_slots_i) 
	ld	a,#0x20
	sub	a, 0 (iy)
	ret	NC
	ld	iy,#_coco_slots_i
	ld	a,0 (iy)
	or	a, a
	ret	Z
;./engine/cocos.c:49: -- coco_slots_i; coco_it = coco_slots [coco_slots_i];
	dec	0 (iy)
	ld	bc,#_coco_slots+0
	ld	hl,(_coco_slots_i)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
;./engine/cocos.c:51: coco_x [coco_it] = rdx << 6;
	ld	hl,#_coco_it + 0
	ld	(hl),a
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	ld	bc,#_coco_x
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	iy,#_rdx
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	a,e
	ld	(bc),a
	inc	bc
	ld	a,d
	ld	(bc),a
;./engine/cocos.c:52: coco_y [coco_it] = rdy << 6;
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	bc,#_coco_y
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	iy,#_rdy
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	a,e
	ld	(bc),a
	inc	bc
	ld	a,d
	ld	(bc),a
;./engine/cocos.c:55: rds16 = COCO_V * rda / rdct; coco_vx [coco_it] = ADD_SIGN2 (px, coco_x [coco_it], rds16);
	ld	hl,#_rda + 0
	ld	b, (hl)
	ld	c,#0x00
	ld	hl,#_rdct + 0
	ld	e, (hl)
	ld	d,#0x00
	push	de
	push	bc
	call	__divsint
	pop	af
	pop	af
	ld	(_rds16),hl
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ex	de,hl
	ld	hl,#_coco_vx
	add	hl,de
	ld	c,l
	ld	b,h
	ld	hl,#_coco_x
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	iy,#_px
	ld	a,0 (iy)
	sub	a, e
	jr	NZ,00106$
	ld	a,1 (iy)
	sub	a, d
	jr	NZ,00106$
	ld	de,#0x0000
	jr	00107$
00106$:
	ld	a,e
	ld	iy,#_px
	sub	a, 0 (iy)
	ld	a,d
	sbc	a, 1 (iy)
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	P,00108$
	ld	de,(_rds16)
	jr	00109$
00108$:
	xor	a, a
	ld	iy,#_rds16
	sub	a, 0 (iy)
	ld	e,a
	ld	a, #0x00
	sbc	a, 1 (iy)
	ld	d,a
00109$:
00107$:
	ld	a,e
	ld	(bc),a
	inc	bc
	ld	a,d
	ld	(bc),a
;./engine/cocos.c:56: rds16 = COCO_V * rdb / rdct; coco_vy [coco_it] = ADD_SIGN2 (py, coco_y [coco_it], rds16);
	ld	hl,#_rdb + 0
	ld	b, (hl)
	ld	c,#0x00
	ld	hl,#_rdct + 0
	ld	e, (hl)
	ld	d,#0x00
	push	de
	push	bc
	call	__divsint
	pop	af
	pop	af
	ld	(_rds16),hl
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ex	de,hl
	ld	hl,#_coco_vy
	add	hl,de
	ld	c,l
	ld	b,h
	ld	hl,#_coco_y
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	iy,#_py
	ld	a,0 (iy)
	sub	a, e
	jr	NZ,00110$
	ld	a,1 (iy)
	sub	a, d
	jr	NZ,00110$
	ld	de,#0x0000
	jr	00111$
00110$:
	ld	a,e
	ld	iy,#_py
	sub	a, 0 (iy)
	ld	a,d
	sbc	a, 1 (iy)
	jp	PO, 00143$
	xor	a, #0x80
00143$:
	jp	P,00112$
	ld	de,(_rds16)
	jr	00113$
00112$:
	xor	a, a
	ld	iy,#_rds16
	sub	a, 0 (iy)
	ld	e,a
	ld	a, #0x00
	sbc	a, 1 (iy)
	ld	d,a
00113$:
00111$:
	ld	a,e
	ld	(bc),a
	inc	bc
	ld	a,d
	ld	(bc),a
;./engine/cocos.c:58: coco_on [coco_it] = 1;
	ld	bc,#_coco_on+0
	ld	hl,(_coco_it)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x01
;./engine/cocos.c:60: PSGSFXPlay (SFX_COCO, 1);
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#_s_10_coco2_psg
	push	hl
	call	_PSGSFXPlay
	pop	af
	inc	sp
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
	ld	bc,#_coco_slots+0
	ld	hl,(_coco_slots_i)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_coco_it
	ld	0 (iy),a
;./engine/cocos.c:73: coco_x [coco_it] = rdx << 6;
	ld	bc,#_coco_x+0
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	iy,#_rdx
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	a,e
	ld	(bc),a
	inc	bc
	ld	a,d
	ld	(bc),a
;./engine/cocos.c:74: coco_y [coco_it] = rdy << 6;
	ld	bc,#_coco_y+0
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	iy,#_rdy
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	a,e
	ld	(bc),a
	inc	bc
	ld	a,d
	ld	(bc),a
;./engine/cocos.c:76: coco_vx [coco_it] = coco_dx [rda];
	ld	bc,#_coco_vx+0
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	de,#_coco_dx+0
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	ld	(bc),a
	inc	bc
	ld	a,d
	ld	(bc),a
;./engine/cocos.c:77: coco_vy [coco_it] = coco_dy [rda];
	ld	bc,#_coco_vy+0
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	de,#_coco_dy+0
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	ld	(bc),a
	inc	bc
	ld	a,d
	ld	(bc),a
;./engine/cocos.c:79: coco_on [coco_it] = 1;
	ld	bc,#_coco_on+0
	ld	hl,(_coco_it)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x01
;./engine/cocos.c:81: PSGSFXPlay (SFX_COCO, 1);
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#_s_10_coco2_psg
	push	hl
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
	ld	bc,#_coco_on+0
	ld	hl,(_coco_it)
	ld	h,#0x00
	add	hl,bc
	ld	(hl),#0x00
;./engine/cocos.c:87: coco_slots [coco_slots_i] = coco_it; coco_slots_i ++;
	ld	bc,#_coco_slots+0
	ld	hl,(_coco_slots_i)
	ld	h,#0x00
	add	hl,bc
	ld	a,(#_coco_it + 0)
	ld	(hl),a
	ld	hl, #_coco_slots_i+0
	inc	(hl)
;./engine/cocos.c:88: PSGSFXPlay (SFX_DUMMY1, 3);
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_s_06_dummy13_psg
	push	hl
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
	ld	iy,#_coco_it
	ld	a,0 (iy)
	ld	-1 (ix),a
	dec	0 (iy)
	ld	a,-1 (ix)
	or	a, a
	jp	Z,00119$
	ld	a,#<(_coco_on)
	ld	hl,#_coco_it
	add	a, (hl)
	ld	-3 (ix),a
	ld	a,#>(_coco_on)
	adc	a, #0x00
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	-3 (ix), a
	or	a, a
	jr	Z,00116$
;./engine/cocos.c:94: coco_x [coco_it] += coco_vx [coco_it];
	ld	a,0 (iy)
	ld	-3 (ix),a
	ld	-2 (ix),#0x00
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	sla	e
	rl	d
	ld	iy,#_coco_x
	add	iy, de
	ld	c,0 (iy)
	ld	b,1 (iy)
	ld	hl,#_coco_vx
	add	hl,de
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	0 (iy),l
	ld	1 (iy),h
;./engine/cocos.c:95: coco_y [coco_it] += coco_vy [coco_it];
	ld	iy,#_coco_it
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ex	de,hl
	ld	iy,#_coco_y
	add	iy, de
	ld	c,0 (iy)
	ld	b,1 (iy)
	ld	hl,#_coco_vy
	add	hl,de
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,bc
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
	ld	a,#0x3e
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
	ld	iy,#_rdy
	ld	0 (iy),c
;./engine/cocos.c:107: HW_addSprite (rdx, rdy + SPRITE_ADJUST, COCO_PATTERN, COCO_COLOUR);
	ld	a,0 (iy)
	add	a, #0xf7
	ld	b,a
	ld	hl,#0x0fa4
	push	hl
	push	bc
	inc	sp
	ld	a,(_rdx)
	push	af
	inc	sp
	call	_SG_addSprite
	pop	af
	pop	af
;./engine/cocos.c:111: rdm = c_behs [map_buff [((rdx + 4) >> 4) | ((rdy + 4 - 16) & 0xf0)]];
	ld	a,(#_rdx + 0)
	ld	-3 (ix),a
	ld	-2 (ix),#0x00
	ld	a,-3 (ix)
	add	a, #0x04
	ld	c,a
	ld	a,-2 (ix)
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
	ld	a,(#_rdy + 0)
	ld	-5 (ix),a
	ld	-4 (ix),#0x00
	ld	a,-5 (ix)
	add	a, #0xf4
	ld	e,a
	ld	a,-4 (ix)
	adc	a, #0xff
	ld	a,e
	and	a, #0xf0
	ld	e,a
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
;./engine/cocos.c:115: if (rdm & 8) {
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
	ld	a,-3 (ix)
	add	a, #0x07
	ld	-7 (ix),a
	ld	a,-2 (ix)
	adc	a, #0x00
	ld	-6 (ix),a
	ld	a,(#_prx + 0)
	ld	-9 (ix),a
	ld	-8 (ix),#0x00
	ld	a,-7 (ix)
	sub	a, -9 (ix)
	ld	a,-6 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00174$
	xor	a, #0x80
00174$:
	jp	M,00116$
;./engine/cocos.c:123: rdx <= prx + 7 && 
	ld	a,-9 (ix)
	add	a, #0x07
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	a,-9 (ix)
	sub	a, -3 (ix)
	ld	a,-8 (ix)
	sbc	a, -2 (ix)
	jp	PO, 00175$
	xor	a, #0x80
00175$:
	jp	M,00116$
;./engine/cocos.c:124: rdy + 7 + PLAYER_COLLISION_VSTRETCH_FG >= pry && 
	ld	a,-5 (ix)
	add	a, #0x03
	ld	-9 (ix),a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	a,(#_pry + 0)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	a,-9 (ix)
	sub	a, -7 (ix)
	ld	a,-8 (ix)
	sbc	a, -6 (ix)
	jp	PO, 00176$
	xor	a, #0x80
00176$:
	jp	M,00116$
;./engine/cocos.c:125: rdy <= pry + 12
	ld	a,-7 (ix)
	add	a, #0x0c
	ld	-9 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	a,-9 (ix)
	sub	a, -5 (ix)
	ld	a,-8 (ix)
	sbc	a, -4 (ix)
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
