;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Fri Sep 13 13:00:25 2019
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
	.globl _enems_persistent_update
	.globl _enems_persistent_load
	.globl _cocos_shoot_linear
	.globl _cocos_shoot_aimed
	.globl _add_sign
	.globl _collide
	.globl _collide_in
	.globl _cm_two_points
	.globl _bullets_destroy
	.globl _rand8
	.globl _PSGSFXPlay
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
;./engine/enengine.c:41: void enems_persistent_load (void) {
;	---------------------------------
; Function enems_persistent_load
; ---------------------------------
_enems_persistent_load::
;./engine/enengine.c:42: DISABLE_INTERRUPTS;
	di 
;./engine/enengine.c:45: VDPControlPort = 0x80;
	ld	a,#0x80
	out	(_VDPControlPort),a
;./engine/enengine.c:46: VDPControlPort = 0x1B | 0x40;
	ld	a,#0x5B
	out	(_VDPControlPort),a
;./engine/enengine.c:49: gp_gen = (unsigned char *) (c_enems);
	ld	hl,(_c_enems)
	ld	(_gp_gen),hl
;./engine/enengine.c:50: for (gpjt = 0; gpjt < 3 * MAP_SIZE; gpjt ++) {
	ld	hl,#_gpjt + 0
	ld	(hl), #0x00
00104$:
;./engine/enengine.c:51: gp_gen ++;									// Skip t
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00144$
	ld	hl, #_gp_gen+1
	inc	(hl)
00144$:
;./engine/enengine.c:53: rda = *gp_gen ++;							// Read YX1
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00145$
	ld	hl, #_gp_gen+1
	inc	(hl)
00145$:
;./engine/enengine.c:54: VDPDataPort = rdx = rda << 4;				// Write x
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_rdx + 0),a
	out	(_VDPDataPort),a
;./engine/enengine.c:55: VDPDataPort = rdy = rda & 0xf0;				// Write y
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#_rdy + 0),a
	out	(_VDPDataPort),a
;./engine/enengine.c:57: rda = *gp_gen ++;							// Read YX2
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00146$
	ld	hl, #_gp_gen+1
	inc	(hl)
00146$:
;./engine/enengine.c:58: rdb = rda << 4;
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_rdb + 0),a
;./engine/enengine.c:59: rdc = rda & 0xf0;
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#_rdc + 0),a
;./engine/enengine.c:61: rda = (*gp_gen ++) & 0x0f;					// Read P
	ld	hl,(_gp_gen)
	ld	d,(hl)
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00147$
	ld	hl, #_gp_gen+1
	inc	(hl)
00147$:
	ld	a,d
	and	a, #0x0F
	ld	(#_rda + 0),a
;./engine/enengine.c:62: if (rda > 1) rda >>= 1;						// Store converted
	ld	a,#0x01
	ld	iy,#_rda
	sub	a, 0 (iy)
	jr	NC,00102$
	ld	a,(#_rda + 0)
	srl	a
	ld	(#_rda + 0),a
00102$:
;./engine/enengine.c:63: VDPDataPort = ADD_SIGN2 (rdb, rdx, rda);	// Write mx
	ld	hl,#_rda + 0
	ld	d, (hl)
	xor	a, a
	ld	iy,#_rda
	sub	a, 0 (iy)
	ld	e,a
	ld	a,(#_rdb + 0)
	ld	iy,#_rdx
	sub	a, 0 (iy)
	jr	NZ,00108$
	ld	a,#0x00
	jr	00109$
00108$:
	ld	a,(#_rdx)
	ld	iy,#_rdb
	sub	a, 0 (iy)
	jr	NC,00110$
	ld	a,d
	jr	00111$
00110$:
	ld	a,e
00111$:
00109$:
	out	(_VDPDataPort),a
;./engine/enengine.c:64: VDPDataPort = ADD_SIGN2 (rdc, rdy, rda); 	// Write my 
	ld	a,(#_rdc + 0)
	ld	iy,#_rdy
	sub	a, 0 (iy)
	jr	NZ,00112$
	ld	a,#0x00
	jr	00113$
00112$:
	ld	a,(#_rdy)
	ld	iy,#_rdc
	sub	a, 0 (iy)
	jr	NC,00114$
	ld	a,d
	jr	00115$
00114$:
	ld	a,e
00115$:
00113$:
	out	(_VDPDataPort),a
;./engine/enengine.c:50: for (gpjt = 0; gpjt < 3 * MAP_SIZE; gpjt ++) {
	ld	hl, #_gpjt+0
	inc	(hl)
	ld	a,(#_gpjt + 0)
	sub	a, #0x48
	jp	C,00104$
;./engine/enengine.c:67: ENABLE_INTERRUPTS;
	ei 
	ret
;./engine/enengine.c:70: void enems_persistent_update (void) {
;	---------------------------------
; Function enems_persistent_update
; ---------------------------------
_enems_persistent_update::
;./engine/enengine.c:71: DISABLE_INTERRUPTS;
	di 
;./engine/enengine.c:73: if (on_pant != 99) {
	ld	a,(#_on_pant + 0)
	sub	a, #0x63
	jr	Z,00103$
;./engine/enengine.c:75: gp_addr = 0x1b80 + (on_pant << 3) + (on_pant << 2);
	ld	hl,#_on_pant + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,l
	add	a, #0x80
	ld	d,a
	ld	a,h
	adc	a, #0x1B
	ld	e,a
	sla	c
	rl	b
	sla	c
	rl	b
	ld	a,d
	ld	hl,#_gp_addr
	add	a, c
	ld	(hl),a
	ld	a,e
	adc	a, b
	inc	hl
	ld	(hl),a
;./engine/enengine.c:76: VDPControlPort = LO (gp_addr);
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
;./engine/enengine.c:77: VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;./engine/enengine.c:80: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	de,#_en_my+0
00104$:
;./engine/enengine.c:81: VDPDataPort = en_x [gpit];				// Write x
	ld	a,#<(_en_x)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_en_x)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	out	(_VDPDataPort),a
;./engine/enengine.c:82: VDPDataPort = en_y [gpit]; 				// Write y
	ld	a,#<(_en_y)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_en_y)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	out	(_VDPDataPort),a
;./engine/enengine.c:83: VDPDataPort = en_mx [gpit];				// Write mx
	ld	a,#<(_en_mx)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_en_mx)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	out	(_VDPDataPort),a
;./engine/enengine.c:84: VDPDataPort = en_my [gpit];				// Write my
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	out	(_VDPDataPort),a
;./engine/enengine.c:80: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x03
	jr	C,00104$
00103$:
;./engine/enengine.c:88: ENABLE_INTERRUPTS;
	ei 
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
	ld	d,c
	ld	e,b
	sla	d
	rl	e
	sla	d
	rl	e
	ld	a,(#_c_enems + 0)
	add	a, d
	ld	-2 (ix),a
	ld	a,(#_c_enems + 1)
	adc	a, e
	ld	-1 (ix),a
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	a,-2 (ix)
	ld	hl,#_gp_gen
	add	a, c
	ld	(hl),a
	ld	a,-1 (ix)
	adc	a, b
	inc	hl
	ld	(hl),a
;./engine/enengine.c:144: gp_addr = 0x1b80 + (n_pant << 3) + (n_pant << 2);
	ld	hl,#0x1B80
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,c
	ld	hl,#_gp_addr
	add	a, d
	ld	(hl),a
	ld	a,b
	adc	a, e
	inc	hl
	ld	(hl),a
;./engine/enengine.c:145: VDPControlPort = LO (gp_addr);
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
;./engine/enengine.c:146: VDPControlPort = HI (gp_addr);	// Set up for reading. Note there's no | 0x40!
	ld	a,(#_gp_addr + 1)
	out	(_VDPControlPort),a
;./engine/enengine.c:149: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
00125$:
;./engine/enengine.c:167: _en_t = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#__en_t + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00175$
	ld	hl, #_gp_gen+1
	inc	(hl)
00175$:
;./engine/enengine.c:170: _en_state = 0;
	ld	hl,#__en_state + 0
	ld	(hl), #0x00
;./engine/enengine.c:173: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00176$
	ld	hl, #_gp_gen+1
	inc	(hl)
00176$:
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
	jr	NZ,00177$
	ld	hl, #_gp_gen+1
	inc	(hl)
00177$:
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
	jr	NZ,00178$
	ld	hl, #_gp_gen+1
	inc	(hl)
00178$:
;./engine/enengine.c:186: rdd = rda & 0xf0; 	// Used for respawn speed!
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#_rdd + 0),a
;./engine/enengine.c:187: rdm = rda & 0x0f; 	// Actual speed.
	ld	a,(#_rda + 0)
	and	a, #0x0F
	ld	(#_rdm + 0),a
;./engine/enengine.c:191: _en_x = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#__en_x + 0),a
;./engine/enengine.c:192: _en_y = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#__en_y + 0),a
;./engine/enengine.c:193: _en_mx = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#__en_mx + 0),a
;./engine/enengine.c:194: _en_my = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#__en_my + 0),a
;./engine/enengine.c:201: switch (_en_t & 0x3f) {
	ld	iy,#__en_t
	ld	a,0 (iy)
	and	a, #0x3F
	ld	e,a
	sub	a, #0x01
	jp	C,00123$
	ld	a,#0x07
	sub	a, e
	jp	C,00123$
	dec	e
	ld	d,#0x00
	ld	hl,#00179$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00179$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00112$
	jp	00123$
	jp	00122$
;./engine/enengine.c:202: case 1:
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
;./engine/enengine.c:226: en_status [gpit] = 1; 
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	d,a
;./engine/enengine.c:225: if (rdm == 1) {
	ld	a,(#_rdm + 0)
	dec	a
	jr	NZ,00106$
;./engine/enengine.c:226: en_status [gpit] = 1; 
	ld	a,#0x01
	ld	(de),a
	jr	00107$
00106$:
;./engine/enengine.c:228: en_status [gpit] = 0;
	xor	a, a
	ld	(de),a
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
	jp	NC,00123$
	ld	a,(#__en_y1 + 0)
	ld	(#_rda + 0),a
	ld	a,(#__en_y2 + 0)
	ld	(#__en_y1 + 0),a
	ld	a,(#_rda + 0)
	ld	(#__en_y2 + 0),a
;./engine/enengine.c:247: break;
	jp	00123$
;./engine/enengine.c:250: case 5:
00112$:
;./engine/enengine.c:252: if (_en_x2 > _en_x1) _en_my = 2;
	ld	a,(#__en_x1)
	ld	iy,#__en_x2
	sub	a, 0 (iy)
	jr	NC,00120$
	ld	hl,#__en_my + 0
	ld	(hl), #0x02
	jr	00121$
00120$:
;./engine/enengine.c:253: else if (_en_x2 < _en_x1) _en_my = 0;
	ld	hl,#__en_x1
	ld	a,(#__en_x2 + 0)
	sub	a, (hl)
	jr	NC,00117$
	ld	hl,#__en_my + 0
	ld	(hl), #0x00
	jr	00121$
00117$:
;./engine/enengine.c:254: else if (_en_y2 > _en_y1) _en_my = 3;
	ld	a,(#__en_y1)
	ld	iy,#__en_y2
	sub	a, 0 (iy)
	jr	NC,00114$
	ld	hl,#__en_my + 0
	ld	(hl), #0x03
	jr	00121$
00114$:
;./engine/enengine.c:255: else _en_my = 1;
	ld	hl,#__en_my + 0
	ld	(hl), #0x01
00121$:
;./engine/enengine.c:256: _en_s = STEADY_SHOOTERS_BASE_SPRID + _en_my;
	ld	hl,#__en_s
	ld	a,(#__en_my + 0)
	add	a, #0x29
	ld	(hl),a
;./engine/enengine.c:259: _en_ct = _en_mx = rda;
	ld	a,(#_rda + 0)
	ld	-2 (ix), a
	ld	(#__en_mx + 0),a
	ld	a,-2 (ix)
	ld	(#__en_ct + 0),a
;./engine/enengine.c:260: break;
	jr	00123$
;./engine/enengine.c:277: case 7:
00122$:
;./engine/enengine.c:279: _en_ct = DEATH_COUNT_EXPRESSION;	
	call	_rand8
	ld	a,l
	and	a, #0x3F
	ld	hl,#__en_ct
	add	a, #0x32
	ld	(hl),a
;./engine/enengine.c:284: _en_s = ((TYPE_7_FIXED_SPRITE - 1) << 3);
	ld	a,(#__en_x2 + 0)
	or	a, a
	jr	Z,00129$
	ld	a,#0x05
	jr	00130$
00129$:
	ld	a,#0x04
00130$:
	add	a,#0xFF
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	(#__en_s + 0),a
;./engine/enengine.c:285: _en_x2 = rdm;     // != 0 means "spawned enemy fires"
	ld	a,(#_rdm + 0)
	ld	(#__en_x2 + 0),a
;./engine/enengine.c:286: _en_y2 = rdd|0xf; // Frequency
	ld	a,(#_rdd + 0)
	or	a, #0x0F
	ld	(#__en_y2 + 0),a
;./engine/enengine.c:395: }
00123$:
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
	ld	iy,#_en_flags
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	0 (iy), #0x00
;./engine/enengine.c:412: enems_update_unsigned_char_arrays ();
	call	_enems_update_unsigned_char_arrays
;./engine/enengine.c:149: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x03
	jp	C,00125$
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
;./engine/enengine.c:432: if (_en_t != 5)
	ld	a,(#__en_t + 0)
	sub	a, #0x05
	ret	Z
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
	jr	NC,00108$
	ld	a,#0x00
	jr	00109$
00108$:
	ld	a,#0x04
00109$:
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
;./engine/enengine.c:451: if (_en_t == 7) {
	ld	a,(#__en_t + 0)
	sub	a, #0x07
	jp	NZ,_enems_kill
;./engine/enengine.c:452: _en_state = 0;
	ld	hl,#__en_state + 0
	ld	(hl), #0x00
;./engine/enengine.c:453: _en_ct = DEATH_COUNT_EXPRESSION;
	push	de
	call	_rand8
	ld	a,l
	pop	de
	and	a, #0x3F
	ld	hl,#__en_ct
	add	a, #0x32
	ld	(hl),a
;./engine/enengine.c:455: en_life [gpit] = ENEMS_LIFE_GAUGE;	
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x02
	ret
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
00243$:
	ld	hl,#_gpjt + 0
	ld	d, (hl)
	ld	hl, #_gpjt+0
	dec	(hl)
	ld	a,d
	or	a, a
	jp	Z,00246$
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
	jp	Z,00243$
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
	ld	-5 (ix),a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-3 (ix), a
	or	a, a
	jp	Z,00238$
;./engine/enengine.c:506: -- en_cttouched [gpit];
	ld	d,-3 (ix)
	dec	d
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),d
;./engine/enengine.c:522: rda = frame_counter & 0xf;
	ld	a,(#_frame_counter + 0)
	and	a, #0x0F
	ld	(#_rda + 0),a
;./engine/enengine.c:526: spr_enems [ENEMS_EXPLODING_CELL]
	ld	hl,(_spr_enems)
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	de, #0x0050
	add	hl, de
	ld	a,(hl)
	ld	-5 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-4 (ix),a
;./engine/enengine.c:525: _en_y + jitter [15 - rda] + SPRITE_ADJUST, 
	ld	a,(#_rda + 0)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	a,#0x0F
	sub	a, -7 (ix)
	ld	-7 (ix),a
	ld	a,#0x00
	sbc	a, -6 (ix)
	ld	-6 (ix),a
	ld	a,#<(_jitter)
	add	a, -7 (ix)
	ld	-7 (ix),a
	ld	a,#>(_jitter)
	adc	a, -6 (ix)
	ld	-6 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	h,(hl)
	ld	a,(#__en_y + 0)
	add	a, h
	ld	-7 (ix), a
	add	a, #0xF7
	ld	-7 (ix),a
;./engine/enengine.c:524: _en_x + jitter [rda],
	ld	a,#<(_jitter)
	ld	hl,#_rda
	add	a, (hl)
	ld	-9 (ix),a
	ld	a,#>(_jitter)
	adc	a, #0x00
	ld	-8 (ix),a
	pop	hl
	push	hl
	ld	h,(hl)
	ld	a,(#__en_x + 0)
	add	a, h
	ld	d,a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	ld	a,-7 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
;./engine/../engine/enemmods/enems_recoiling.h:7: if (en_life [gpit]) 
	ld	iy,#_en_life
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jp	Z,00240$
;./engine/../engine/enemmods/enems_recoiling.h:11: if (en_rmx [gpit])
	ld	iy,#_en_rmx
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	ld	-9 (ix), a
	or	a, a
	jp	Z,00116$
;./engine/../engine/enemmods/enems_recoiling.h:14: rdx = _en_x; _en_x += en_rmx [gpit];
	ld	a,(#__en_x + 0)
	ld	(#_rdx + 0),a
	ld	a,(#__en_x + 0)
	ld	hl,#__en_x
	add	a, -9 (ix)
	ld	(hl),a
;./engine/../engine/enemmods/enems_recoiling.h:16: cy1 = _en_y >> 4;
	ld	a,(#__en_y + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cy1 + 0),a
;./engine/../engine/enemmods/enems_recoiling.h:17: cy2 = (_en_y + 15) >> 4;
	ld	a,(#__en_y + 0)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	a,-7 (ix)
	add	a, #0x0F
	ld	-7 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	-6 (ix),a
	sra	-6 (ix)
	rr	-7 (ix)
	sra	-6 (ix)
	rr	-7 (ix)
	sra	-6 (ix)
	rr	-7 (ix)
	sra	-6 (ix)
	rr	-7 (ix)
	ld	a,-7 (ix)
	ld	(#_cy2 + 0),a
;./engine/../engine/enemmods/enems_recoiling.h:19: if (en_rmx [gpit] < 0) {
	bit	7, -9 (ix)
	jr	Z,00108$
;./engine/../engine/enemmods/enems_recoiling.h:20: cx1 = cx2 = _en_x >> 4;
	ld	a,(#__en_x + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx2 + 0),a
	ld	(#_cx1 + 0),a
	jr	00109$
00108$:
;./engine/../engine/enemmods/enems_recoiling.h:22: cx1 = cx2 = (_en_x + 15) >> 4;
	ld	a,(#__en_x + 0)
	ld	-9 (ix),a
	ld	-8 (ix),#0x00
	ld	a,-9 (ix)
	add	a, #0x0F
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	sra	-8 (ix)
	rr	-9 (ix)
	sra	-8 (ix)
	rr	-9 (ix)
	sra	-8 (ix)
	rr	-9 (ix)
	sra	-8 (ix)
	rr	-9 (ix)
	ld	a,-9 (ix)
	ld	(#_cx2 + 0),a
	ld	(#_cx1 + 0),a
00109$:
;./engine/../engine/enemmods/enems_recoiling.h:24: cm_two_points ();
	call	_cm_two_points
;./engine/../engine/enemmods/enems_recoiling.h:25: en_collx = at1 | at2;
	ld	a,(#_at1 + 0)
	ld	hl,#_at2 + 0
	or	a,(hl)
	ld	(#_en_collx + 0),a
;./engine/../engine/enemmods/enems_recoiling.h:32: (_en_x <= _en_x1 || _en_x >= _en_x2)
	ld	a,(#__en_x1)
	ld	iy,#__en_x
	sub	a, 0 (iy)
	jr	NC,00113$
	ld	hl,#__en_x2
	ld	a,(#__en_x + 0)
	sub	a, (hl)
	jr	C,00114$
00113$:
;./engine/../engine/enemmods/enems_recoiling.h:42: )	
	ld	a,(#__en_t + 0)
	sub	a, #0x07
	jr	NZ,00110$
00114$:
;./engine/../engine/enemmods/enems_recoiling.h:45: || en_collx
	ld	a,(#_en_collx + 0)
	or	a, a
	jr	Z,00116$
00110$:
;./engine/../engine/enemmods/enems_recoiling.h:47: ) _en_x = rdx;
	ld	a,(#_rdx + 0)
	ld	(#__en_x + 0),a
00116$:
;./engine/../engine/enemmods/enems_recoiling.h:51: if (en_rmy [gpit]) {
	ld	iy,#_en_rmy
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	ld	-9 (ix), a
	or	a, a
	jp	Z,00240$
;./engine/../engine/enemmods/enems_recoiling.h:52: rdy = _en_y; _en_y += en_rmy [gpit];
	ld	a,(#__en_y + 0)
	ld	(#_rdy + 0),a
	ld	a,(#__en_y + 0)
	ld	hl,#__en_y
	add	a, -9 (ix)
	ld	(hl),a
;./engine/../engine/enemmods/enems_recoiling.h:54: cx1 = _en_x >> 4;
	ld	a,(#__en_x + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx1 + 0),a
;./engine/../engine/enemmods/enems_recoiling.h:55: cy1 = (_en_y + 15) >> 4;
	ld	a,(#__en_y + 0)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	a,-7 (ix)
	add	a, #0x0F
	ld	-7 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	-6 (ix),a
	sra	-6 (ix)
	rr	-7 (ix)
	sra	-6 (ix)
	rr	-7 (ix)
	sra	-6 (ix)
	rr	-7 (ix)
	sra	-6 (ix)
	rr	-7 (ix)
	ld	d,-7 (ix)
	ld	hl,#_cy1 + 0
	ld	(hl), d
;./engine/../engine/enemmods/enems_recoiling.h:57: if (en_rmy [gpit] < 0) {
	bit	7, -9 (ix)
	jr	Z,00118$
;./engine/../engine/enemmods/enems_recoiling.h:58: cy1 = cy2 = _en_y >> 4;
	ld	a,(#__en_y + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cy2 + 0),a
	ld	(#_cy1 + 0),a
	jr	00119$
00118$:
;./engine/../engine/enemmods/enems_recoiling.h:60: cy1 = cy2 = (_en_y + 15) >> 4;
	ld	hl,#_cy2 + 0
	ld	(hl), d
	ld	hl,#_cy1 + 0
	ld	(hl), d
00119$:
;./engine/../engine/enemmods/enems_recoiling.h:62: cm_two_points ();
	call	_cm_two_points
;./engine/../engine/enemmods/enems_recoiling.h:63: en_colly = at1 | at2;
	ld	a,(#_at1 + 0)
	ld	hl,#_at2 + 0
	or	a,(hl)
	ld	(#_en_colly + 0),a
;./engine/../engine/enemmods/enems_recoiling.h:70: (_en_y <= _en_y1 || _en_y >= _en_y2)
	ld	a,(#__en_y1)
	ld	iy,#__en_y
	sub	a, 0 (iy)
	jr	NC,00123$
	ld	hl,#__en_y2
	ld	a,(#__en_y + 0)
	sub	a, (hl)
	jr	C,00124$
00123$:
;./engine/../engine/enemmods/enems_recoiling.h:80: )
	ld	a,(#__en_t + 0)
	sub	a, #0x07
	jr	NZ,00120$
00124$:
;./engine/../engine/enemmods/enems_recoiling.h:83: || en_colly
	ld	a,(#_en_colly + 0)
	or	a, a
	jp	Z,00240$
00120$:
;./engine/../engine/enemmods/enems_recoiling.h:85: ) _en_y = rdy;
	ld	a,(#_rdy + 0)
	ld	(#__en_y + 0),a
	jp	00240$
00238$:
;./engine/enengine.c:545: if (en_is_alive) {
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00240$
;./engine/enengine.c:548: pregotten = (prx + 7 >= _en_x && prx <= _en_x + 15);
	ld	hl,#_prx + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	hl,#0x0007
	add	hl,de
	ld	b,l
	ld	c,h
;./engine/../engine/enemmods/enems_recoiling.h:22: cx1 = cx2 = (_en_x + 15) >> 4;
	ld	iy,#__en_x
	ld	a,0 (iy)
	ld	-9 (ix),a
	ld	-8 (ix),#0x00
;./engine/enengine.c:548: pregotten = (prx + 7 >= _en_x && prx <= _en_x + 15);
	ld	a,b
	sub	a, -9 (ix)
	ld	a,c
	sbc	a, -8 (ix)
	jp	PO, 00656$
	xor	a, #0x80
00656$:
	jp	M,00248$
	ld	a,-9 (ix)
	add	a, #0x0F
	ld	h,a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	l,a
	ld	a,h
	sub	a, e
	ld	a,l
	sbc	a, d
	jp	PO, 00657$
	xor	a, #0x80
00657$:
	jp	P,00249$
00248$:
	ld	a,#0x00
	jr	00250$
00249$:
	ld	a,#0x01
00250$:
	ld	(#_pregotten + 0),a
;./engine/enengine.c:551: en_fr = ((((_en_mx) ? _en_x : _en_y)+4) >> 3) & 1;
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00251$
	ld	hl,#__en_x + 0
	ld	e, (hl)
	jr	00252$
00251$:
	ld	hl,#__en_y + 0
	ld	e, (hl)
00252$:
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
	ld	a,(#__en_t + 0)
	and	a, #0x3F
	ld	e,a
	sub	a, #0x01
	jp	C,00197$
	ld	a,#0x07
	sub	a, e
	jp	C,00197$
	dec	e
;./engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-7 (ix),a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	-6 (ix),a
;./engine/../engine/enemmods/enem_steady_shooter.h:7: if (_en_ct) -- _en_ct; else {
	ld	iy,#__en_ct
	ld	b,0 (iy)
	dec	b
;./engine/enengine.c:572: switch (_en_t & 63) {
	ld	d,#0x00
	ld	hl,#00658$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00658$:
	jp	00129$
	jp	00130$
	jp	00131$
	jp	00132$
	jp	00150$
	jp	00197$
	jp	00156$
;./engine/enengine.c:573: case 1:
00129$:
;./engine/enengine.c:574: case 2:
00130$:
;./engine/enengine.c:575: case 3:
00131$:
;./engine/enengine.c:576: case 4:
00132$:
;./engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a, (hl)
	or	a, a
	jr	Z,00147$
	ld	a,(#_half_life + 0)
	or	a, a
	jp	Z,00148$
00147$:
;./engine/../engine/enemmods/enem_linear.h:15: _en_x += _en_mx;
	ld	a,(#__en_x + 0)
	ld	hl,#__en_mx
	ld	iy,#__en_x
	add	a, (hl)
	ld	0 (iy),a
;./engine/../engine/enemmods/enem_linear.h:18: cy1 = _en_y >> 4;
	ld	a,(#__en_y + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cy1 + 0),a
;./engine/../engine/enemmods/enem_linear.h:19: cy2 = (_en_y + 15) >> 4;
	ld	iy,#__en_y
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
;./engine/../engine/enemmods/enem_linear.h:21: if (_en_mx < 0) {
	ld	a,(#__en_mx + 0)
	bit	7,a
	jr	Z,00134$
;./engine/../engine/enemmods/enem_linear.h:22: cx1 = cx2 = _en_x >> 4;
	ld	a,(#__en_x + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx2 + 0),a
	ld	(#_cx1 + 0),a
	jr	00135$
00134$:
;./engine/../engine/enemmods/enem_linear.h:24: cx1 = cx2 = (_en_x + 15) >> 4;
	ld	iy,#__en_x
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
	ld	(#_cx2 + 0),a
	ld	(#_cx1 + 0),a
00135$:
;./engine/../engine/enemmods/enem_linear.h:26: cm_two_points ();
	call	_cm_two_points
;./engine/../engine/enemmods/enem_linear.h:27: en_collx = (at1 | at2) & 13;
	ld	a,(#_at1 + 0)
	ld	hl,#_at2 + 0
	or	a,(hl)
	and	a, #0x0D
	ld	(#_en_collx + 0),a
;./engine/../engine/enemmods/enem_linear.h:32: _en_y += _en_my;
	ld	a,(#__en_y + 0)
	ld	hl,#__en_my
	ld	iy,#__en_y
	add	a, (hl)
	ld	0 (iy),a
;./engine/../engine/enemmods/enem_linear.h:35: cx1 = _en_x >> 4;
	ld	a,(#__en_x + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx1 + 0),a
;./engine/../engine/enemmods/enem_linear.h:36: cx2 = (_en_x + 15) >> 4;
	ld	iy,#__en_x
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
	ld	iy,#_cx2
	ld	0 (iy),l
;./engine/../engine/enemmods/enem_linear.h:38: if (_en_my < 0) {
	ld	a,(#__en_my + 0)
	bit	7,a
	jr	Z,00137$
;./engine/../engine/enemmods/enem_linear.h:39: cy1 = cy2 = _en_y >> 4;
	ld	a,(#__en_y + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cy2 + 0),a
	ld	(#_cy1 + 0),a
	jr	00138$
00137$:
;./engine/../engine/enemmods/enem_linear.h:41: cy1 = cy2 = (_en_y + 15) >> 4;
	ld	iy,#__en_y
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
00138$:
;./engine/../engine/enemmods/enem_linear.h:43: cm_two_points ();
	call	_cm_two_points
;./engine/../engine/enemmods/enem_linear.h:44: en_colly = (at1 | at2) & 13;
	ld	a,(#_at1 + 0)
	ld	hl,#_at2 + 0
	or	a,(hl)
	and	a, #0x0D
	ld	(#_en_colly + 0),a
;./engine/../engine/enemmods/enem_linear.h:65: if (_en_x == _en_x1 || _en_x == _en_x2 || en_collx) _en_mx = -_en_mx;
	ld	a,(#__en_x + 0)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	Z,00139$
	ld	a,(#__en_x + 0)
	ld	iy,#__en_x2
	sub	a, 0 (iy)
	jr	Z,00139$
	ld	a,(#_en_collx + 0)
	or	a, a
	jr	Z,00140$
00139$:
	xor	a, a
	ld	iy,#__en_mx
	sub	a, 0 (iy)
	ld	(#__en_mx + 0),a
00140$:
;./engine/../engine/enemmods/enem_linear.h:66: if (_en_y == _en_y1 || _en_y == _en_y2 || en_colly) _en_my = -_en_my;
	ld	a,(#__en_y + 0)
	ld	iy,#__en_y1
	sub	a, 0 (iy)
	jr	Z,00143$
	ld	a,(#__en_y + 0)
	ld	iy,#__en_y2
	sub	a, 0 (iy)
	jr	Z,00143$
	ld	a,(#_en_colly + 0)
	or	a, a
	jr	Z,00148$
00143$:
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	(#__en_my + 0),a
00148$:
;./engine/../engine/enemmods/enem_linear.h:77: rda = _en_mx ? (_en_mx < 0) : (_en_my < 0); enems_facing ();
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00253$
	ld	a,(#__en_mx + 0)
	rlca
	and	a,#0x01
	jr	00254$
00253$:
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
00254$:
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
;./engine/enengine.c:585: break;
	jp	00197$
;./engine/enengine.c:588: case 5:
00150$:
;./engine/../engine/enemmods/enem_steady_shooter.h:6: if (ticker == 0) {
	ld	a,(#_ticker + 0)
	or	a, a
	jr	NZ,00155$
;./engine/../engine/enemmods/enem_steady_shooter.h:7: if (_en_ct) -- _en_ct; else {
	ld	a,(#__en_ct + 0)
	or	a, a
	jr	Z,00152$
	ld	hl,#__en_ct + 0
	ld	(hl), b
	jr	00155$
00152$:
;./engine/../engine/enemmods/enem_steady_shooter.h:8: _en_ct = _en_mx;	// reset counter
	ld	a,(#__en_mx + 0)
	ld	(#__en_ct + 0),a
;./engine/../engine/enemmods/enem_steady_shooter.h:9: rda = _en_my; 		// direction
	ld	a,(#__en_my + 0)
	ld	(#_rda + 0),a
;./engine/../engine/enemmods/enem_steady_shooter.h:10: rdx = _en_x + 4;
	ld	hl,#_rdx
	ld	a,(#__en_x + 0)
	add	a, #0x04
	ld	(hl),a
;./engine/../engine/enemmods/enem_steady_shooter.h:11: rdy = _en_y + 4;
	ld	hl,#_rdy
	ld	a,(#__en_y + 0)
	add	a, #0x04
	ld	(hl),a
;./engine/../engine/enemmods/enem_steady_shooter.h:12: cocos_shoot_linear ();
	call	_cocos_shoot_linear
00155$:
;./engine/../engine/enemmods/enem_steady_shooter.h:16: en_spr = _en_s;
	ld	a,(#__en_s + 0)
	ld	(#_en_spr + 0),a
;./engine/enengine.c:590: break;
	jp	00197$
;./engine/enengine.c:612: case 7:					
00156$:
;./engine/../engine/enemmods/enem_pursuers.h:6: switch (_en_state) {
	ld	a,#0x02
	ld	iy,#__en_state
	sub	a, 0 (iy)
	jp	C,00196$
;./engine/../engine/enemmods/enem_pursuers.h:16: en_rawv [gpit] = 1 << (rand8 () % 5);
	ld	a,#<(_en_rawv)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-5 (ix),a
	ld	a,#>(_en_rawv)
	adc	a, #0x00
	ld	-4 (ix),a
;./engine/../engine/enemmods/enem_pursuers.h:6: switch (_en_state) {
	ld	iy,#__en_state
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#00663$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00663$:
	jp	00157$
	jp	00166$
	jp	00170$
;./engine/../engine/enemmods/enem_pursuers.h:7: case 0:
00157$:
;./engine/../engine/enemmods/enem_pursuers.h:10: if (_en_ct) {
	ld	a,(#__en_ct + 0)
	or	a, a
	jr	Z,00164$
;./engine/../engine/enemmods/enem_pursuers.h:11: -- _en_ct; _en_y = 240;
	ld	hl,#__en_ct + 0
	ld	(hl), b
	ld	hl,#__en_y + 0
	ld	(hl), #0xF0
	jp	00196$
00164$:
;./engine/../engine/enemmods/enem_pursuers.h:13: _en_state = 1;
	ld	hl,#__en_state + 0
	ld	(hl), #0x01
;./engine/../engine/enemmods/enem_pursuers.h:14: _en_x = _en_x1;
	ld	a,(#__en_x1 + 0)
	ld	(#__en_x + 0),a
;./engine/../engine/enemmods/enem_pursuers.h:15: _en_y = _en_y1;
	ld	a,(#__en_y1 + 0)
	ld	(#__en_y + 0),a
;./engine/../engine/enemmods/enem_pursuers.h:16: en_rawv [gpit] = 1 << (rand8 () % 5);
	call	_rand8
	ld	d,l
	ld	a,#0x05
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	push	af
	ld	d,#0x01
	pop	af
	inc	l
	jr	00665$
00664$:
	sla	d
00665$:
	dec	l
	jr	NZ,00664$
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),d
;./engine/../engine/enemmods/enem_pursuers.h:17: if (en_rawv [gpit] > 4) en_rawv [gpit] = 1;
	ld	a,#<(_en_rawv)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_rawv)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	h,a
	ld	a,#0x04
	sub	a, h
	jr	NC,00159$
	ld	a,#0x01
	ld	(de),a
00159$:
;./engine/../engine/enemmods/enem_pursuers.h:18: if (en_rawv [gpit] == 1) en_status [gpit] = 1; else en_rawv [gpit] >>= 1;
	ld	a,#<(_en_rawv)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_en_rawv)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	ld	a,d
	dec	a
	jr	NZ,00161$
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	l, a
	ld	a, #>(_en_status)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0x01
	jr	00162$
00161$:
	srl	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
00162$:
;./engine/../engine/enemmods/enem_pursuers.h:19: _en_ct = 50 + (rand8 () & 31);
	call	_rand8
	ld	a,l
	and	a, #0x1F
	ld	hl,#__en_ct
	add	a, #0x32
	ld	(hl),a
;./engine/../engine/enemmods/enem_pursuers.h:21: break;
	jp	00196$
;./engine/../engine/enemmods/enem_pursuers.h:22: case 1:
00166$:
;./engine/../engine/enemmods/enem_pursuers.h:24: en_spr = ENEMS_EXPLODING_CELL;
	ld	hl,#_en_spr + 0
	ld	(hl), #0x28
;./engine/../engine/enemmods/enem_pursuers.h:25: if (_en_ct) -- _en_ct; else _en_state = 2;
	ld	a,(#__en_ct + 0)
	or	a, a
	jr	Z,00168$
	ld	hl,#__en_ct + 0
	ld	(hl), b
	jp	00196$
00168$:
	ld	hl,#__en_state + 0
	ld	(hl), #0x02
;./engine/../engine/enemmods/enem_pursuers.h:26: break;
	jp	00196$
;./engine/../engine/enemmods/enem_pursuers.h:27: case 2:
00170$:
;./engine/../engine/enemmods/enem_pursuers.h:30: if (pflickering == 0 && pbouncing == 0 && (!en_status [gpit] || half_life)) {
	ld	a,(#_pflickering + 0)
	or	a, a
	jp	NZ,00192$
	ld	a,(#_pbouncing + 0)
	or	a, a
	jp	NZ,00192$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00191$
	ld	a,(#_half_life + 0)
	or	a, a
	jp	Z,00192$
00191$:
;./engine/../engine/enemmods/enem_pursuers.h:31: _en_mx = add_sign (((prx >> 2) << 2) - _en_x, en_rawv [gpit]);
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	ld	d,#0x00
	ld	iy,#_prx
	ld	l,0 (iy)
	srl	l
	srl	l
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	ld	a,l
	sub	a, -9 (ix)
	ld	l,a
	ld	a,h
	sbc	a, -8 (ix)
	ld	h,a
	push	de
	push	hl
	call	_add_sign
	pop	af
;./engine/../engine/enemmods/enem_pursuers.h:32: _en_my = add_sign (((pry >> 2) << 2) - _en_y, en_rawv [gpit]);
	ld	a,l
	ld	(#__en_mx + 0),a
	pop	af
	ld	iy,#_en_rawv
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	e, 0 (iy)
	ld	d,#0x00
	ld	iy,#_pry
	ld	l,0 (iy)
	srl	l
	srl	l
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	ld	b,l
	ld	c,h
	ld	iy,#__en_y
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,b
	sub	a, l
	ld	l,a
	ld	a,c
	sbc	a, h
	ld	h,a
	push	de
	push	hl
	call	_add_sign
	pop	af
	pop	af
	ld	iy,#__en_my
	ld	0 (iy),l
;./engine/../engine/enemmods/enem_pursuers.h:36: _en_y += _en_my;
	ld	a,(#__en_y + 0)
	ld	hl,#__en_my
	ld	iy,#__en_y
	add	a, (hl)
	ld	0 (iy),a
;./engine/../engine/enemmods/enem_pursuers.h:41: if (_en_my) {
	ld	a,(#__en_my + 0)
	or	a, a
	jp	Z,00178$
;./engine/../engine/enemmods/enem_pursuers.h:42: cx1 = (_en_x + 4) >> 4;
	ld	hl,#__en_x + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	hl,#0x0004
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	iy,#_cx1
	ld	0 (iy),l
;./engine/../engine/enemmods/enem_pursuers.h:43: cx2 = (_en_x + 11) >> 4;
	ld	hl,#0x000B
	add	hl,de
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
;./engine/../engine/enemmods/enems_recoiling.h:17: cy2 = (_en_y + 15) >> 4;
	ld	hl,#__en_y + 0
	ld	c, (hl)
	ld	b,#0x00
;./engine/../engine/enemmods/enem_pursuers.h:45: if (_en_my < 0) {
	ld	a,(#__en_my + 0)
	bit	7,a
	jr	Z,00172$
;./engine/../engine/enemmods/enem_pursuers.h:46: cy1 = cy2 = (_en_y + 8) >> 4;
	ld	hl,#0x0008
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
;./engine/../engine/enemmods/enem_pursuers.h:47: rda = ((cy1 + 1) << 4) - 8;
	ld	(#_cy1 + 0),a
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a,#0xF8
	ld	(hl),a
	jr	00173$
00172$:
;./engine/../engine/enemmods/enem_pursuers.h:49: cy1 = cy2 = (_en_y + 15) >> 4;
	ld	hl,#0x000F
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
;./engine/../engine/enemmods/enem_pursuers.h:50: rda = (cy1 - 1) << 4;
	ld	(#_cy1 + 0),a
	add	a,#0xFF
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_rda + 0),a
00173$:
;./engine/../engine/enemmods/enem_pursuers.h:53: cm_two_points ();
	call	_cm_two_points
;./engine/../engine/enemmods/enem_pursuers.h:54: if (at1 || at2) {
	ld	a,(#_at1 + 0)
	or	a, a
	jr	NZ,00174$
	ld	a,(#_at2 + 0)
	or	a, a
	jr	Z,00178$
00174$:
;./engine/../engine/enemmods/enem_pursuers.h:55: _en_y = rda;
	ld	a,(#_rda + 0)
	ld	(#__en_y + 0),a
00178$:
;./engine/../engine/enemmods/enem_pursuers.h:62: _en_x += _en_mx;
	ld	a,(#__en_x + 0)
	ld	hl,#__en_mx
	ld	iy,#__en_x
	add	a, (hl)
	ld	0 (iy),a
;./engine/../engine/enemmods/enem_pursuers.h:67: if (_en_mx) {
	ld	a,(#__en_mx + 0)
	or	a, a
	jp	Z,00186$
;./engine/../engine/enemmods/enem_pursuers.h:68: cy1 = (_en_y + 8) >> 4;
	ld	hl,#__en_y + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	hl,#0x0008
	add	hl,de
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
;./engine/../engine/enemmods/enem_pursuers.h:69: cy2 = (_en_y + 15) >> 4;
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
;./engine/../engine/enemmods/enems_recoiling.h:22: cx1 = cx2 = (_en_x + 15) >> 4;
	ld	hl,#__en_x + 0
	ld	c, (hl)
	ld	b,#0x00
;./engine/../engine/enemmods/enem_pursuers.h:71: if (_en_mx < 0) {
	ld	a,(#__en_mx + 0)
	bit	7,a
	jr	Z,00180$
;./engine/../engine/enemmods/enem_pursuers.h:72: cx1 = cx2 = (_en_x + 4) >> 4;
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
	ld	hl,#_cx2 + 0
	ld	(hl), c
	ld	hl,#_cx1 + 0
	ld	(hl), c
;./engine/../engine/enemmods/enem_pursuers.h:73: rda = ((cx1 + 1) << 4) - 4;
	ld	a,(#_cx1 + 0)
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a,#0xFC
	ld	(hl),a
	jr	00181$
00180$:
;./engine/../engine/enemmods/enem_pursuers.h:75: cx1 = cx2 = (_en_x + 11) >> 4;
	ld	hl,#0x000B
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
;./engine/../engine/enemmods/enem_pursuers.h:76: rda = ((cx1 - 1) << 4) + 4;
	ld	(#_cx1 + 0),a
	add	a,#0xFF
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a, #0x04
	ld	(hl),a
00181$:
;./engine/../engine/enemmods/enem_pursuers.h:79: cm_two_points ();
	call	_cm_two_points
;./engine/../engine/enemmods/enem_pursuers.h:80: if (at1 || at2) {
	ld	a,(#_at1 + 0)
	or	a, a
	jr	NZ,00182$
	ld	a,(#_at2 + 0)
	or	a, a
	jr	Z,00186$
00182$:
;./engine/../engine/enemmods/enem_pursuers.h:81: _en_x = rda;
	ld	a,(#_rda + 0)
	ld	(#__en_x + 0),a
00186$:
;./engine/../engine/enemmods/enem_pursuers.h:88: if (_en_x2) {
	ld	a,(#__en_x2 + 0)
	or	a, a
	jr	Z,00192$
;./engine/../engine/enemmods/enem_pursuers.h:89: if ((rand8() & _en_y2) == 1) {
	call	_rand8
	ld	a,l
	ld	iy,#__en_y2
	and	a, 0 (iy)
	dec	a
	jr	NZ,00192$
;./engine/../engine/enemmods/enem_pursuers.h:90: rdx = _en_x + 4;
	ld	hl,#_rdx
	ld	a,(#__en_x + 0)
	add	a, #0x04
	ld	(hl),a
;./engine/../engine/enemmods/enem_pursuers.h:91: rdy = _en_y + 4;
	ld	hl,#_rdy
	ld	a,(#__en_y + 0)
	add	a, #0x04
	ld	(hl),a
;./engine/../engine/enemmods/enem_pursuers.h:92: cocos_shoot_aimed ();
	call	_cocos_shoot_aimed
00192$:
;./engine/../engine/enemmods/enem_pursuers.h:99: en_spr = ((TYPE_7_FIXED_SPRITE - 1) << 3) + en_fr;
	ld	a,(#__en_x2 + 0)
	or	a, a
	jr	Z,00255$
	ld	a,#0x05
	jr	00256$
00255$:
	ld	a,#0x04
00256$:
	add	a,#0xFF
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	hl,#_en_fr
	ld	iy,#_en_spr
	add	a, (hl)
	ld	0 (iy),a
;./engine/../engine/enemmods/enem_pursuers.h:101: }					
00196$:
;./engine/../engine/enemmods/enem_pursuers.h:103: _en_facing = 0;
	ld	hl,#__en_facing + 0
	ld	(hl), #0x00
;./engine/enengine.c:664: }
00197$:
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
;./engine/enengine.c:738: en_is_alive == 0	// General condition.
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00240$
;./engine/enengine.c:740: || en_cttouched [gpit]
	ld	iy,#_en_cttouched
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jp	NZ,00240$
;./engine/enengine.c:746: || (_en_t == 7 && _en_state != 2)
	ld	a,(#__en_t + 0)
	sub	a, #0x07
	jr	NZ,00199$
	ld	a,(#__en_state + 0)
	sub	a, #0x02
	jp	NZ,00240$
;./engine/enengine.c:766: ) goto skipdo;
00199$:
;./engine/enengine.c:826: _en_t != 5 &&
	ld	a,(#__en_t + 0)
	sub	a, #0x05
	jp	Z,00210$
;./engine/enengine.c:828: touched == 0 &&
	ld	a,(#_touched + 0)
	or	a, a
	jp	NZ,00210$
;./engine/enengine.c:829: collide ()
	call	_collide
	ld	a,l
	or	a, a
	jp	Z,00210$
;./engine/enengine.c:835: en_sg_1 = 0;
	ld	iy,#_en_sg_1
	ld	0 (iy),#0x00
;./engine/enengine.c:839: en_sg_2 = (pflickering == 0);
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00675$
	ld	a,#0x01
	jr	00676$
00675$:
	xor	a,a
00676$:
	ld	iy,#_en_sg_2
	ld	0 (iy),a
;./engine/enengine.c:878: if (en_sg_2) { 
	ld	a,(#_en_sg_2 + 0)
	or	a, a
	jp	Z,00208$
;./engine/enengine.c:879: pkill = 1; 
	ld	iy,#_pkill
	ld	0 (iy),#0x01
;./engine/enengine.c:881: pvx = ADD_SIGN (_en_mx, PLAYER_V_REBOUND); 
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00257$
	xor	a, a
	ld	iy,#__en_mx
	sub	a, 0 (iy)
	jp	PO, 00677$
	xor	a, #0x80
00677$:
	jp	P,00259$
	ld	de,#0x00E0
	jr	00258$
00259$:
	ld	de,#0xFF20
	jr	00258$
00257$:
	ld	de,#0x0000
00258$:
	ld	(_pvx),de
;./engine/enengine.c:882: pvy = ADD_SIGN (_en_my, PLAYER_V_REBOUND); 
	ld	a,(#__en_my + 0)
	or	a, a
	jr	Z,00261$
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	jp	PO, 00678$
	xor	a, #0x80
00678$:
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
;./engine/enengine.c:888: if (!_en_mx) _en_my = ADD_SIGN (_en_y - pry, ABS (_en_my));
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	NZ,00206$
	ld	hl,#__en_y + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	b,a
	ld	a,d
	sbc	a, h
	ld	d,a
	or	a,b
	jr	Z,00265$
;./engine/../engine/enemmods/enem_linear.h:38: if (_en_my < 0) {
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
	ld	-2 (ix),a
;./engine/../engine/enemmods/enem_linear.h:66: if (_en_y == _en_y1 || _en_y == _en_y2 || en_colly) _en_my = -_en_my;
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	e,a
;./engine/../engine/enemmods/enem_steady_shooter.h:9: rda = _en_my; 		// direction
	ld	iy,#__en_my
	ld	a,0 (iy)
	ld	-9 (ix),a
;./engine/enengine.c:888: if (!_en_mx) _en_my = ADD_SIGN (_en_y - pry, ABS (_en_my));
	xor	a, a
	cp	a, b
	sbc	a, d
	jp	PO, 00679$
	xor	a, #0x80
00679$:
	jp	P,00267$
	ld	a,-2 (ix)
	or	a, a
	jr	NZ,00266$
	ld	e,-9 (ix)
	jr	00266$
00267$:
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00271$
	ld	-2 (ix),e
	jr	00272$
00271$:
	ld	a,-9 (ix)
	ld	-2 (ix),a
00272$:
	xor	a, a
	sub	a, -2 (ix)
	ld	e,a
	jr	00266$
00265$:
	ld	e,#0x00
00266$:
	ld	hl,#__en_my + 0
	ld	(hl), e
00206$:
;./engine/enengine.c:889: _en_mx = ADD_SIGN (_en_x - prx, ABS (_en_mx));
	ld	hl,#__en_x + 0
	ld	d, (hl)
	ld	e,#0x00
	ld	iy,#_prx
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,d
	sub	a, l
	ld	-2 (ix),a
	ld	a,e
	sbc	a, h
	ld	-1 (ix), a
	or	a,-2 (ix)
	jr	Z,00273$
;./engine/../engine/enemmods/enem_linear.h:21: if (_en_mx < 0) {
	ld	a,(#__en_mx + 0)
	rlca
	and	a,#0x01
	ld	c,a
;./engine/../engine/enemmods/enem_linear.h:65: if (_en_x == _en_x1 || _en_x == _en_x2 || en_collx) _en_mx = -_en_mx;
	xor	a, a
	ld	iy,#__en_mx
	sub	a, 0 (iy)
	ld	d,a
;./engine/../engine/enemmods/enem_steady_shooter.h:8: _en_ct = _en_mx;	// reset counter
	ld	iy,#__en_mx
	ld	e,0 (iy)
;./engine/enengine.c:889: _en_mx = ADD_SIGN (_en_x - prx, ABS (_en_mx));
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00680$
	xor	a, #0x80
00680$:
	jp	P,00275$
	ld	a,c
	or	a, a
	jr	NZ,00274$
	ld	d,e
	jr	00274$
00275$:
	ld	a,c
	or	a, a
	jr	Z,00279$
	ld	e,d
00279$:
	xor	a, a
	sub	a, e
	ld	d,a
	jr	00274$
00273$:
	ld	d,#0x00
00274$:
	ld	hl,#__en_mx + 0
	ld	(hl), d
00208$:
;./engine/enengine.c:894: touched = 1; 
	ld	hl,#_touched + 0
	ld	(hl), #0x01
00210$:
;./engine/enengine.c:903: touched
	ld	a,(#_touched + 0)
	or	a, a
	jp	NZ,00240$
;./engine/enengine.c:910: ) goto skipdo;
	ld	a,(#__en_t + 0)
	sub	a, #0x05
	jp	Z,00240$
;./engine/enengine.c:947: bi = MAX_BULLETS; while (bi --) if (bst [bi]) {
	ld	hl,#_bi + 0
	ld	(hl), #0x04
00232$:
	ld	hl,#_bi + 0
	ld	d, (hl)
	ld	hl, #_bi+0
	dec	(hl)
	ld	a,d
	or	a, a
	jp	Z,00240$
	ld	a,#<(_bst)
	ld	hl,#_bi
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_bst)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-2 (ix), a
	or	a, a
	jr	Z,00232$
;./engine/enengine.c:949: if (_en_t != 7 || _en_state == 2)
	ld	a,(#__en_t + 0)
	sub	a, #0x07
	jr	NZ,00227$
	ld	a,(#__en_state + 0)
	sub	a, #0x02
	jr	NZ,00232$
00227$:
;./engine/enengine.c:952: if (collide_in (bx [bi] + 3, by [bi] + 3, _en_x, _en_y)) {
	ld	a,#<(_by)
	ld	hl,#_bi
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_by)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-2 (ix), a
	add	a, #0x03
	ld	-2 (ix),a
	ld	a,#<(_bx)
	ld	hl,#_bi
	add	a, (hl)
	ld	-9 (ix),a
	ld	a,#>(_bx)
	adc	a, #0x00
	ld	-8 (ix),a
	pop	hl
	push	hl
	ld	a,(hl)
	ld	-9 (ix), a
	add	a, #0x03
	ld	-9 (ix),a
	ld	a,(__en_y)
	push	af
	inc	sp
	ld	a,(__en_x)
	push	af
	inc	sp
	ld	h,-2 (ix)
	ld	l,-9 (ix)
	push	hl
	call	_collide_in
	pop	af
	pop	af
	ld	-2 (ix), l
	ld	a, l
	or	a, a
	jp	Z,00232$
;./engine/enengine.c:953: PSGSFXPlay (SFX_ENHIT, 3);
	ld	de,#_s_05_phit3_psg
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;./engine/enengine.c:959: if (_en_t >= PLAYER_BULLETS_MIN_KILLABLE)
	ld	a,(#__en_t + 0)
	sub	a, #0x03
	jr	C,00217$
;./engine/enengine.c:961: enems_hit ();
	call	_enems_hit
00217$:
;./engine/enengine.c:965: if (_en_t != 5 && _en_t != 9 && _en_t != 11) {
	ld	a,(#__en_t + 0)
	cp	a,#0x05
	jp	Z,00222$
	cp	a,#0x09
	jp	Z,00222$
	sub	a, #0x0B
	jp	Z,00222$
;./engine/enengine.c:967: if (bmx [bi]) {
	ld	iy,#_bmx
	ld	de,(_bi)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00219$
;./engine/enengine.c:968: en_rmy [gpit] = 0;
	ld	a,#<(_en_rmy)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_rmy)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
;./engine/enengine.c:970: en_rmx [gpit] = ENEMS_RECOIL_X;
	ld	a,#<(_en_rmx)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_en_rmx)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	a,(#__en_t + 0)
	cp	a,#0x05
	jr	Z,00284$
	cp	a,#0x09
	jr	Z,00284$
	sub	a, #0x0B
	jr	NZ,00281$
00284$:
	ld	a,#0x00
	jr	00282$
00281$:
	ld	a,(#__en_x + 0)
	ld	iy,#_prx
	sub	a, 0 (iy)
	jr	NZ,00289$
	ld	a,#0x00
	jr	00290$
00289$:
	ld	a,(#_prx)
	ld	iy,#__en_x
	sub	a, 0 (iy)
	jr	NC,00291$
	ld	a,#0x01
	jr	00292$
00291$:
	ld	a,#0xFF
00292$:
00290$:
00282$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
	jr	00222$
00219$:
;./engine/enengine.c:973: en_rmx [gpit] = 0;
	ld	a,#<(_en_rmx)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_rmx)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
;./engine/enengine.c:974: en_rmy [gpit] = ENEMS_RECOIL_Y;
	ld	a,#<(_en_rmy)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-2 (ix),a
	ld	a,#>(_en_rmy)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	a,(#__en_t + 0)
	cp	a,#0x05
	jr	Z,00296$
	cp	a,#0x09
	jr	Z,00296$
	sub	a, #0x0B
	jr	NZ,00293$
00296$:
	ld	a,#0x00
	jr	00294$
00293$:
	ld	a,(#__en_y + 0)
	ld	iy,#_pry
	sub	a, 0 (iy)
	jr	NZ,00301$
	ld	a,#0x00
	jr	00302$
00301$:
	ld	a,(#_pry)
	ld	iy,#__en_y
	sub	a, 0 (iy)
	jr	NC,00303$
	ld	a,#0x01
	jr	00304$
00303$:
	ld	a,#0xFF
00304$:
00302$:
00294$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
00222$:
;./engine/enengine.c:980: bullets_destroy ();
	call	_bullets_destroy
;./engine/enengine.c:1015: skipdo: 
00240$:
;./engine/enengine.c:1018: if (en_spr != 0xff) {
	ld	a,(#_en_spr + 0)
	inc	a
	jr	Z,00242$
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
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
00242$:
;./engine/enengine.c:1027: enems_update_unsigned_char_arrays ();
	call	_enems_update_unsigned_char_arrays
	jp	00243$
00246$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
