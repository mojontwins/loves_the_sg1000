;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Fri Sep 13 13:08:06 2019
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
	.globl _collide
	.globl _cm_two_points
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
	sub	a, #0x69
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
00114$:
;./engine/enengine.c:167: _en_t = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#__en_t + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00146$
	ld	hl, #_gp_gen+1
	inc	(hl)
00146$:
;./engine/enengine.c:170: _en_state = 0;
	ld	hl,#__en_state + 0
	ld	(hl), #0x00
;./engine/enengine.c:173: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00147$
	ld	hl, #_gp_gen+1
	inc	(hl)
00147$:
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
	jr	NZ,00148$
	ld	hl, #_gp_gen+1
	inc	(hl)
00148$:
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
	jr	NZ,00149$
	ld	hl, #_gp_gen+1
	inc	(hl)
00149$:
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
	jp	C,00112$
	ld	a,#0x04
	sub	a, e
	jr	C,00112$
	dec	e
	ld	d,#0x00
	ld	hl,#00150$
	add	hl,de
	add	hl,de
;./engine/enengine.c:202: case 1:
	jp	(hl)
00150$:
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
	jr	NC,00112$
	ld	a,(#__en_y1 + 0)
	ld	(#_rda + 0),a
	ld	a,(#__en_y2 + 0)
	ld	(#__en_y1 + 0),a
	ld	a,(#_rda + 0)
	ld	(#__en_y2 + 0),a
;./engine/enengine.c:395: }
00112$:
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
	jp	C,00114$
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
	jr	NC,00103$
	ld	a,#0x00
	jr	00104$
00103$:
	ld	a,#0x04
00104$:
	ld	(#__en_facing + 0),a
;./engine/enengine.c:444: en_cttouched [gpit] = ENEMS_TOUCHED_FRAMES;
	ld	de,#_en_cttouched+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x08
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
	ld	hl,#-11
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
	ld	-8 (ix),a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-11 (ix), a
	or	a, a
	jp	Z,00172$
;./engine/enengine.c:506: -- en_cttouched [gpit];
	ld	d,-11 (ix)
	dec	d
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),d
;./engine/enengine.c:522: rda = frame_counter & 0xf;
	ld	a,(#_frame_counter + 0)
	and	a, #0x0F
	ld	(#_rda + 0),a
;./engine/enengine.c:526: spr_enems [ENEMS_EXPLODING_CELL]
	ld	hl,(_spr_enems)
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	de, #0x0040
	add	hl, de
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix),a
;./engine/enengine.c:525: _en_y + jitter [15 - rda] + SPRITE_ADJUST, 
	ld	a,(#_rda + 0)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,#0x0F
	sub	a, -6 (ix)
	ld	-6 (ix),a
	ld	a,#0x00
	sbc	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,#<(_jitter)
	add	a, -6 (ix)
	ld	-6 (ix),a
	ld	a,#>(_jitter)
	adc	a, -5 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	c, d
	push	bc
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
;./engine/../engine/enemmods/enems_recoiling.h:14: rdx = _en_x; _en_x += en_rmx [gpit];
	ld	a,(#__en_x + 0)
	ld	(#_rdx + 0),a
	ld	iy,#_en_rmx
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	ld	-6 (ix),a
	ld	a,(#__en_x + 0)
	ld	hl,#__en_x
	add	a, -6 (ix)
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
	ld	-8 (ix),a
	ld	-7 (ix),#0x00
	ld	a,-8 (ix)
	add	a, #0x0F
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	sra	-7 (ix)
	rr	-8 (ix)
	sra	-7 (ix)
	rr	-8 (ix)
	sra	-7 (ix)
	rr	-8 (ix)
	sra	-7 (ix)
	rr	-8 (ix)
	ld	a,-8 (ix)
	ld	(#_cy2 + 0),a
;./engine/../engine/enemmods/enems_recoiling.h:19: if (en_rmx [gpit] < 0) {
	bit	7, -6 (ix)
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
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,-6 (ix)
	add	a, #0x0F
	ld	-6 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	sra	-5 (ix)
	rr	-6 (ix)
	sra	-5 (ix)
	rr	-6 (ix)
	sra	-5 (ix)
	rr	-6 (ix)
	sra	-5 (ix)
	rr	-6 (ix)
	ld	a,-6 (ix)
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
	jr	NC,00110$
	ld	hl,#__en_x2
	ld	a,(#__en_x + 0)
	sub	a, (hl)
	jr	NC,00110$
;./engine/../engine/enemmods/enems_recoiling.h:45: || en_collx
	ld	a,(#_en_collx + 0)
	or	a, a
	jp	Z,00174$
00110$:
;./engine/../engine/enemmods/enems_recoiling.h:47: ) _en_x = rdx;
	ld	a,(#_rdx + 0)
	ld	(#__en_x + 0),a
	jp	00174$
00172$:
;./engine/enengine.c:545: if (en_is_alive) {
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00174$
;./engine/enengine.c:548: pregotten = (prx + 7 >= _en_x && prx <= _en_x + 15);
	ld	hl,#_prx + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	hl,#0x0007
	add	hl,bc
	ld	d,l
	ld	e,h
	ld	iy,#__en_x
	ld	a,0 (iy)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,d
	sub	a, -6 (ix)
	ld	a,e
	sbc	a, -5 (ix)
	jp	PO, 00427$
	xor	a, #0x80
00427$:
	jp	M,00182$
	ld	a,-6 (ix)
	add	a, #0x0F
	ld	h,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	l,a
	ld	a,h
	sub	a, c
	ld	a,l
	sbc	a, b
	jp	PO, 00428$
	xor	a, #0x80
00428$:
	jp	P,00183$
00182$:
	ld	a,#0x00
	jr	00184$
00183$:
	ld	a,#0x01
00184$:
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
	jp	C,00135$
	ld	a,#0x04
	sub	a, e
	jp	C,00135$
	dec	e
	ld	d,#0x00
	ld	hl,#00429$
	add	hl,de
	add	hl,de
;./engine/enengine.c:573: case 1:
	jp	(hl)
00429$:
	jr	00114$
	jr	00115$
	jr	00116$
	jr	00117$
00114$:
;./engine/enengine.c:574: case 2:
00115$:
;./engine/enengine.c:575: case 3:
00116$:
;./engine/enengine.c:576: case 4:
00117$:
;./engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	iy,#_en_status
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00132$
	ld	a,(#_half_life + 0)
	or	a, a
	jp	Z,00133$
00132$:
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
	jr	Z,00119$
;./engine/../engine/enemmods/enem_linear.h:22: cx1 = cx2 = _en_x >> 4;
	ld	a,(#__en_x + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cx2 + 0),a
	ld	(#_cx1 + 0),a
	jr	00120$
00119$:
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
00120$:
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
	jr	Z,00122$
;./engine/../engine/enemmods/enem_linear.h:39: cy1 = cy2 = _en_y >> 4;
	ld	a,(#__en_y + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_cy2 + 0),a
	ld	(#_cy1 + 0),a
	jr	00123$
00122$:
;./engine/../engine/enemmods/enem_linear.h:41: cy1 = cy2 = (_en_y + 15) >> 4;
	ld	a,(#__en_y + 0)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,-6 (ix)
	add	a, #0x0F
	ld	e,a
	ld	a,-5 (ix)
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
	ld	hl,#_cy2 + 0
	ld	(hl), e
	ld	hl,#_cy1 + 0
	ld	(hl), e
00123$:
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
	jr	Z,00124$
	ld	a,(#__en_x + 0)
	ld	iy,#__en_x2
	sub	a, 0 (iy)
	jr	Z,00124$
	ld	a,(#_en_collx + 0)
	or	a, a
	jr	Z,00125$
00124$:
	xor	a, a
	ld	iy,#__en_mx
	sub	a, 0 (iy)
	ld	(#__en_mx + 0),a
00125$:
;./engine/../engine/enemmods/enem_linear.h:66: if (_en_y == _en_y1 || _en_y == _en_y2 || en_colly) _en_my = -_en_my;
	ld	a,(#__en_y + 0)
	ld	iy,#__en_y1
	sub	a, 0 (iy)
	jr	Z,00128$
	ld	a,(#__en_y + 0)
	ld	iy,#__en_y2
	sub	a, 0 (iy)
	jr	Z,00128$
	ld	a,(#_en_colly + 0)
	or	a, a
	jr	Z,00133$
00128$:
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	(#__en_my + 0),a
00133$:
;./engine/../engine/enemmods/enem_linear.h:77: rda = _en_mx ? (_en_mx < 0) : (_en_my < 0); enems_facing ();
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00187$
	ld	a,(#__en_mx + 0)
	rlca
	and	a,#0x01
	jr	00188$
00187$:
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
00188$:
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
00135$:
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
	jr	NZ,00434$
	ld	a,#0x01
	jr	00435$
00434$:
	xor	a,a
00435$:
	ld	-6 (ix), a
	or	a, a
	jp	Z,00149$
	ld	a,(#_pregotten + 0)
	or	a, a
	jp	Z,00149$
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00149$
	ld	a,(#_pj + 0)
	or	a, a
	jp	NZ,00149$
;./engine/../engine/enemmods/enems_recoiling.h:17: cy2 = (_en_y + 15) >> 4;
	ld	a,(#__en_y + 0)
	ld	-8 (ix),a
	ld	-7 (ix),#0x00
;./engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-10 (ix),a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	-9 (ix),a
;./engine/enengine.c:713: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	a,-8 (ix)
	add	a,#0xF0
	ld	l,a
	ld	a,-7 (ix)
	adc	a,#0xFF
	ld	h,a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-4 (ix),l
	ld	-3 (ix),h
;./engine/enengine.c:709: if (_en_mx) {
	ld	a,(#__en_mx + 0)
	or	a, a
	jp	Z,00140$
;./engine/enengine.c:710: if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
	ld	iy,#_pry
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#0x0010
	add	hl,de
	ld	a,l
	sub	a, -8 (ix)
	ld	a,h
	sbc	a, -7 (ix)
	jp	PO, 00436$
	xor	a, #0x80
00436$:
	jp	M,00140$
	ld	hl,#0x000C
	add	hl,de
	ld	a,-8 (ix)
	sub	a, l
	ld	a,-7 (ix)
	sbc	a, h
	jp	PO, 00437$
	xor	a, #0x80
00437$:
	jp	M,00140$
;./engine/enengine.c:711: pgotten = 1;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x01
;./engine/enengine.c:712: pgtmx = _en_mx << (6 - en_status [gpit]);
	ld	hl,#__en_mx + 0
	ld	e, (hl)
	ld	a,(#__en_mx + 0)
	rla
	sbc	a, a
	ld	d,a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	h,(hl)
	ld	l,#0x00
	ld	a,#0x06
	sub	a, h
	ld	c,a
	ld	a,#0x00
	sbc	a, l
	ld	a,c
	push	af
	ld	hl,#_pgtmx + 0
	ld	(hl), e
	ld	hl,#_pgtmx + 1
	ld	(hl), d
	pop	af
	inc	a
	jr	00439$
00438$:
	ld	iy,#_pgtmx
	sla	0 (iy)
	ld	iy,#_pgtmx
	rl	1 (iy)
00439$:
	dec	a
	jr	NZ,00438$
;./engine/enengine.c:713: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
00140$:
;./engine/enengine.c:710: if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
	ld	hl,#_pry + 0
	ld	e, (hl)
	ld	d,#0x00
;./engine/enengine.c:721: (_en_my > 0 && pry + 16 + _en_my >= _en_y && pry + 12 <= _en_y)
	ld	hl,#__en_my + 0
	ld	c, (hl)
	ld	iy,#__en_my
	ld	a,0 (iy)
	rla
	sbc	a, a
	ld	b,a
;./engine/enengine.c:720: (_en_my < 0 && pry + 17 >= _en_y && pry + 12 <= _en_y) ||
	ld	hl,#0x000C
	add	hl,de
	ld	a,-8 (ix)
	sub	a, l
	ld	a,-7 (ix)
	sbc	a, h
	jp	PO, 00440$
	xor	a, #0x80
00440$:
	rlca
	and	a,#0x01
	ld	-11 (ix),a
	ld	iy,#__en_my
	bit	7,0 (iy)
	jr	Z,00147$
	ld	hl,#0x0011
	add	hl,de
	ld	a,l
	sub	a, -8 (ix)
	ld	a,h
	sbc	a, -7 (ix)
	jp	PO, 00441$
	xor	a, #0x80
00441$:
	jp	M,00147$
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00141$
00147$:
;./engine/enengine.c:721: (_en_my > 0 && pry + 16 + _en_my >= _en_y && pry + 12 <= _en_y)
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	jp	PO, 00442$
	xor	a, #0x80
00442$:
	jp	P,00149$
	ld	hl,#0x0010
	add	hl,de
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	sub	a, -8 (ix)
	ld	a,-1 (ix)
	sbc	a, -7 (ix)
	jp	PO, 00443$
	xor	a, #0x80
00443$:
	jp	M,00149$
	ld	a,-11 (ix)
	or	a, a
	jr	NZ,00149$
00141$:
;./engine/enengine.c:723: pgotten = 1;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x01
;./engine/enengine.c:724: pgtmy = _en_my << (6 - en_status [gpit]);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,#0x06
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	ld	a,l
	push	af
	ld	hl,#_pgtmy + 0
	ld	(hl), c
	ld	hl,#_pgtmy + 1
	ld	(hl), b
	pop	af
	inc	a
	jr	00445$
00444$:
	ld	iy,#_pgtmy
	sla	0 (iy)
	ld	iy,#_pgtmy
	rl	1 (iy)
00445$:
	dec	a
	jr	NZ,00444$
;./engine/enengine.c:725: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
00149$:
;./engine/enengine.c:738: en_is_alive == 0	// General condition.
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00174$
;./engine/enengine.c:740: || en_cttouched [gpit]
	ld	iy,#_en_cttouched
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	or	a, a
	jp	NZ,00174$
;./engine/enengine.c:766: ) goto skipdo;
	ld	a,-6 (ix)
	or	a, a
	jp	NZ,00174$
;./engine/enengine.c:828: touched == 0 &&
	ld	a,(#_touched + 0)
	or	a, a
	jp	NZ,00174$
;./engine/enengine.c:829: collide ()
	call	_collide
	ld	a,l
	or	a, a
	jp	Z,00174$
;./engine/enengine.c:835: en_sg_1 = 0;
	ld	iy,#_en_sg_1
	ld	0 (iy),#0x00
;./engine/enengine.c:839: en_sg_2 = (pflickering == 0);
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00446$
	ld	a,#0x01
	jr	00447$
00446$:
	xor	a,a
00447$:
	ld	iy,#_en_sg_2
	ld	0 (iy),a
;./engine/enengine.c:878: if (en_sg_2) { 
	ld	a,(#_en_sg_2 + 0)
	or	a, a
	jp	Z,00162$
;./engine/enengine.c:879: pkill = 1; 
	ld	iy,#_pkill
	ld	0 (iy),#0x01
;./engine/enengine.c:881: pvx = ADD_SIGN (_en_mx, PLAYER_V_REBOUND); 
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00189$
	xor	a, a
	ld	iy,#__en_mx
	sub	a, 0 (iy)
	jp	PO, 00448$
	xor	a, #0x80
00448$:
	jp	P,00191$
	ld	de,#0x00E0
	jr	00190$
00191$:
	ld	de,#0xFF20
	jr	00190$
00189$:
	ld	de,#0x0000
00190$:
	ld	(_pvx),de
;./engine/enengine.c:882: pvy = ADD_SIGN (_en_my, PLAYER_V_REBOUND); 
	ld	a,(#__en_my + 0)
	or	a, a
	jr	Z,00193$
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	jp	PO, 00449$
	xor	a, #0x80
00449$:
	jp	P,00195$
	ld	hl,#0x00E0
	jr	00194$
00195$:
	ld	hl,#0xFF20
	jr	00194$
00193$:
	ld	hl,#0x0000
00194$:
	ld	(_pvy),hl
;./engine/enengine.c:888: if (!_en_mx) _en_my = ADD_SIGN (_en_y - pry, ABS (_en_my));
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	NZ,00160$
	ld	hl,#__en_y + 0
	ld	d, (hl)
	ld	e,#0x00
	ld	hl,#_pry + 0
	ld	h, (hl)
	ld	l,#0x00
	ld	a,d
	sub	a, h
	ld	-2 (ix),a
	ld	a,e
	sbc	a, l
	ld	-1 (ix), a
	or	a,-2 (ix)
	jr	Z,00197$
;./engine/../engine/enemmods/enem_linear.h:38: if (_en_my < 0) {
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
	ld	c,a
;./engine/../engine/enemmods/enem_linear.h:66: if (_en_y == _en_y1 || _en_y == _en_y2 || en_colly) _en_my = -_en_my;
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	d,a
;./engine/enengine.c:888: if (!_en_mx) _en_my = ADD_SIGN (_en_y - pry, ABS (_en_my));
	ld	iy,#__en_my
	ld	e,0 (iy)
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00450$
	xor	a, #0x80
00450$:
	jp	P,00199$
	ld	a,c
	or	a, a
	jr	NZ,00198$
	ld	d,e
	jr	00198$
00199$:
	ld	a,c
	or	a, a
	jr	Z,00203$
	ld	e,d
00203$:
	xor	a, a
	sub	a, e
	ld	d,a
	jr	00198$
00197$:
	ld	d,#0x00
00198$:
	ld	hl,#__en_my + 0
	ld	(hl), d
00160$:
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
	jr	Z,00205$
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
;./engine/enengine.c:889: _en_mx = ADD_SIGN (_en_x - prx, ABS (_en_mx));
	ld	iy,#__en_mx
	ld	e,0 (iy)
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00451$
	xor	a, #0x80
00451$:
	jp	P,00207$
	ld	a,c
	or	a, a
	jr	NZ,00206$
	ld	d,e
	jr	00206$
00207$:
	ld	a,c
	or	a, a
	jr	Z,00211$
	ld	e,d
00211$:
	xor	a, a
	sub	a, e
	ld	d,a
	jr	00206$
00205$:
	ld	d,#0x00
00206$:
	ld	hl,#__en_mx + 0
	ld	(hl), d
00162$:
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
	call	_SG_addMetaSprite1x1
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
