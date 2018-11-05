;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Sun Nov 04 15:04:43 2018
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
	.globl _enems_persistent_update
	.globl _enems_persistent_load
	.globl _jump_start
	.globl _distance
	.globl _collide
	.globl _cm_two_points
	.globl _memfill
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
;engine/enengine.c:32: void enems_persistent_load (void) {
;	---------------------------------
; Function enems_persistent_load
; ---------------------------------
_enems_persistent_load::
;engine/enengine.c:33: DISABLE_INTERRUPTS;
	di 
;engine/enengine.c:36: VDPControlPort = 0x80;
	ld	a,#0x80
	out	(_VDPControlPort),a
;engine/enengine.c:37: VDPControlPort = 0x1B | 0x40;
	ld	a,#0x5B
	out	(_VDPControlPort),a
;engine/enengine.c:40: gp_gen = (unsigned char *) (c_enems);
	ld	hl,(_c_enems)
	ld	(_gp_gen),hl
;engine/enengine.c:41: for (gpjt = 0; gpjt < 3 * MAP_SIZE; gpjt ++) {
	ld	hl,#_gpjt + 0
	ld	(hl), #0x00
00104$:
;engine/enengine.c:42: gp_gen ++;									// Skip t
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00144$
	ld	hl, #_gp_gen+1
	inc	(hl)
00144$:
;engine/enengine.c:44: rda = *gp_gen ++;							// Read YX1
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00145$
	ld	hl, #_gp_gen+1
	inc	(hl)
00145$:
;engine/enengine.c:45: VDPDataPort = rdx = rda << 4;				// Write x
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_rdx + 0),a
	out	(_VDPDataPort),a
;engine/enengine.c:46: VDPDataPort = rdy = rda & 0xf0;				// Write y
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#_rdy + 0),a
	out	(_VDPDataPort),a
;engine/enengine.c:48: rda = *gp_gen ++;							// Read YX2
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00146$
	ld	hl, #_gp_gen+1
	inc	(hl)
00146$:
;engine/enengine.c:49: rdb = rda << 4;
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_rdb + 0),a
;engine/enengine.c:50: rdc = rda & 0xf0;
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#_rdc + 0),a
;engine/enengine.c:52: rda = (*gp_gen ++) & 0x0f;					// Read P
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
;engine/enengine.c:53: if (rda > 1) rda >>= 1;						// Store converted
	ld	a,#0x01
	ld	iy,#_rda
	sub	a, 0 (iy)
	jr	NC,00102$
	ld	a,(#_rda + 0)
	srl	a
	ld	(#_rda + 0),a
00102$:
;engine/enengine.c:54: VDPDataPort = ADD_SIGN2 (rdb, rdx, rda);	// Write mx
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
;engine/enengine.c:55: VDPDataPort = ADD_SIGN2 (rdc, rdy, rda); 	// Write my 
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
;engine/enengine.c:41: for (gpjt = 0; gpjt < 3 * MAP_SIZE; gpjt ++) {
	ld	hl, #_gpjt+0
	inc	(hl)
	ld	a,(#_gpjt + 0)
	sub	a, #0x48
	jp	C,00104$
;engine/enengine.c:58: ENABLE_INTERRUPTS;
	ei 
	ret
;engine/enengine.c:61: void enems_persistent_update (void) {
;	---------------------------------
; Function enems_persistent_update
; ---------------------------------
_enems_persistent_update::
;engine/enengine.c:62: DISABLE_INTERRUPTS;
	di 
;engine/enengine.c:64: if (on_pant != 99) {
	ld	a,(#_on_pant + 0)
	sub	a, #0x63
	jr	Z,00103$
;engine/enengine.c:66: gp_addr = 0x1b80 + (on_pant << 3) + (on_pant << 2);
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
;engine/enengine.c:67: VDPControlPort = LO (gp_addr);
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
;engine/enengine.c:68: VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;engine/enengine.c:71: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	de,#_en_my+0
00104$:
;engine/enengine.c:72: VDPDataPort = en_x [gpit];				// Write x
	ld	a,#<(_en_x)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_en_x)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	out	(_VDPDataPort),a
;engine/enengine.c:73: VDPDataPort = en_y [gpit]; 				// Write y
	ld	a,#<(_en_y)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_en_y)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	out	(_VDPDataPort),a
;engine/enengine.c:74: VDPDataPort = en_mx [gpit];				// Write mx
	ld	a,#<(_en_mx)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_en_mx)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	out	(_VDPDataPort),a
;engine/enengine.c:75: VDPDataPort = en_my [gpit];				// Write my
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	out	(_VDPDataPort),a
;engine/enengine.c:71: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x03
	jr	C,00104$
00103$:
;engine/enengine.c:79: ENABLE_INTERRUPTS;
	ei 
	ret
;engine/enengine.c:84: void enems_persistent_deaths_load (void) {
;	---------------------------------
; Function enems_persistent_deaths_load
; ---------------------------------
_enems_persistent_deaths_load::
;engine/enengine.c:85: memfill (ep_dead, 0, MAP_SIZE * 3);
	ld	de,#_ep_dead
	ld	hl,#0x0048
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
;engine/enengine.c:89: void enems_update_unsigned_char_arrays (void) {
;	---------------------------------
; Function enems_update_unsigned_char_arrays
; ---------------------------------
_enems_update_unsigned_char_arrays::
;engine/enengine.c:90: en_t [gpit] = _en_t;
	ld	de,#_en_t+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_t + 0)
	ld	(hl),a
;engine/enengine.c:91: en_s [gpit] = _en_s;
	ld	de,#_en_s+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_s + 0)
	ld	(hl),a
;engine/enengine.c:92: en_x [gpit] = _en_x; en_y [gpit] = _en_y;
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
;engine/enengine.c:93: en_x1 [gpit] = _en_x1; en_y1 [gpit] = _en_y1;
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
;engine/enengine.c:94: en_x2 [gpit] = _en_x2; en_y2 [gpit] = _en_y2;
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
;engine/enengine.c:95: en_mx [gpit] = _en_mx; en_my [gpit] = _en_my;
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
;engine/enengine.c:96: en_ct [gpit] = _en_ct;
	ld	de,#_en_ct+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_ct + 0)
	ld	(hl),a
;engine/enengine.c:97: en_facing [gpit] = _en_facing;
	ld	de,#_en_facing+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_facing + 0)
	ld	(hl),a
;engine/enengine.c:98: en_state [gpit] = _en_state;
	ld	de,#_en_state+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(#__en_state + 0)
	ld	(hl),a
;engine/enengine.c:101: enf_x [gpit] = _enf_x; enf_vx [gpit] = _enf_vx;
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_enf_x
	add	hl,de
	ld	a,(#__enf_x + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#__enf_x + 1)
	ld	(hl),a
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_enf_vx
	add	hl,de
	ld	a,(#__enf_vx + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#__enf_vx + 1)
	ld	(hl),a
;engine/enengine.c:102: enf_y [gpit] = _enf_y; enf_vy [gpit] = _enf_vy;
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_enf_y
	add	hl,de
	ld	a,(#__enf_y + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#__enf_y + 1)
	ld	(hl),a
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_enf_vy
	add	hl,de
	ld	a,(#__enf_vy + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#__enf_vy + 1)
	ld	(hl),a
	ret
;engine/enengine.c:106: void enems_facing (void) {
;	---------------------------------
; Function enems_facing
; ---------------------------------
_enems_facing::
;engine/enengine.c:107: _en_facing = rda << 2;
	ld	a,(#_rda + 0)
	add	a, a
	add	a, a
	ld	(#__en_facing + 0),a
	ret
;engine/enengine.c:110: void enems_init_fp (void) {
;	---------------------------------
; Function enems_init_fp
; ---------------------------------
_enems_init_fp::
;engine/enengine.c:111: _enf_x = _en_x << 6;
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
;engine/enengine.c:112: _enf_y = _en_y << 6;
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
;engine/enengine.c:115: void enems_boioiong_init (void) {
;	---------------------------------
; Function enems_boioiong_init
; ---------------------------------
_enems_boioiong_init::
;engine/enengine.c:116: enems_init_fp ();
	call	_enems_init_fp
;engine/enengine.c:117: _enf_vy = 0; 
	ld	hl,#0x0000
	ld	(__enf_vy),hl
;engine/enengine.c:118: _enf_vx = ADD_SIGN2 (_en_x2, _en_x1, rdm << FIXBITS);
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
;engine/enengine.c:122: _en_ct = 0;
	ld	hl,#__en_ct + 0
	ld	(hl), #0x00
	ret
;engine/enengine.c:126: void enems_load (void) {
;	---------------------------------
; Function enems_load
; ---------------------------------
_enems_load::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;engine/enengine.c:127: gp_gen = (unsigned char *) (c_enems + (n_pant << 2) + (n_pant << 3));
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
;engine/enengine.c:130: en_offs = rdc = (n_pant << 1) + n_pant;
	ld	a,(#_n_pant + 0)
	add	a, a
	ld	hl,#_n_pant
	add	a, (hl)
	ld	(#_rdc + 0),a
	ld	(#_en_offs + 0),a
;engine/enengine.c:135: gp_addr = 0x1b80 + (n_pant << 3) + (n_pant << 2);
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
;engine/enengine.c:136: VDPControlPort = LO (gp_addr);
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
;engine/enengine.c:137: VDPControlPort = HI (gp_addr);	// Set up for reading. Note there's no | 0x40!
	ld	a,(#_gp_addr + 1)
	out	(_VDPControlPort),a
;engine/enengine.c:140: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	bc,#_ep_dead+0
00118$:
;engine/enengine.c:144: if (ep_dead [rdc]) {
	ld	hl,(_rdc)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	or	a, a
	jr	Z,00115$
;engine/enengine.c:145: _en_t = 0;
	ld	hl,#__en_t + 0
	ld	(hl), #0x00
;engine/enengine.c:146: gp_gen += 4;
	ld	hl,#_gp_gen
	ld	a,(hl)
	add	a, #0x04
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;engine/enengine.c:149: rda = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#_rda + 0),a
;engine/enengine.c:150: rdb = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#_rdb + 0),a
;engine/enengine.c:151: rdm = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#_rdm + 0),a
;engine/enengine.c:152: rdt = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#_rdt + 0),a
	jp	00116$
00115$:
;engine/enengine.c:158: _en_t = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#__en_t + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00166$
	ld	hl, #_gp_gen+1
	inc	(hl)
00166$:
;engine/enengine.c:161: _en_state = 0;
	ld	hl,#__en_state + 0
	ld	(hl), #0x00
;engine/enengine.c:164: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00167$
	ld	hl, #_gp_gen+1
	inc	(hl)
00167$:
;engine/enengine.c:165: _en_y1 = rda & 0xf0;
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#__en_y1 + 0),a
;engine/enengine.c:166: _en_x1 = rda << 4;
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#__en_x1 + 0),a
;engine/enengine.c:169: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00168$
	ld	hl, #_gp_gen+1
	inc	(hl)
00168$:
;engine/enengine.c:170: _en_y2 = rda & 0xf0;
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#__en_y2 + 0),a
;engine/enengine.c:171: _en_x2 = rda << 4;
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#__en_x2 + 0),a
;engine/enengine.c:174: rda = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00169$
	ld	hl, #_gp_gen+1
	inc	(hl)
00169$:
;engine/enengine.c:177: rdd = rda & 0xf0; 	// Used for respawn speed!
	ld	a,(#_rda + 0)
	and	a, #0xF0
	ld	(#_rdd + 0),a
;engine/enengine.c:178: rdm = rda & 0x0f; 	// Actual speed.
	ld	a,(#_rda + 0)
	and	a, #0x0F
	ld	(#_rdm + 0),a
;engine/enengine.c:182: _en_x = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#__en_x + 0),a
;engine/enengine.c:183: _en_y = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#__en_y + 0),a
;engine/enengine.c:184: _en_mx = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#__en_mx + 0),a
;engine/enengine.c:185: _en_my = VDPDataPort;
	in	a,(_VDPDataPort)
	ld	(#__en_my + 0),a
;engine/enengine.c:192: switch (_en_t & 0x3f) {
	ld	a,(#__en_t + 0)
	and	a, #0x3F
	ld	h,a
	dec	a
	jr	Z,00104$
	ld	a,h
	cp	a,#0x02
	jr	Z,00104$
	cp	a,#0x03
	jr	Z,00104$
	cp	a,#0x04
	jr	Z,00104$
	sub	a, #0x06
	jr	Z,00112$
	jp	00113$
;engine/enengine.c:196: case 4:
00104$:
;engine/enengine.c:199: _en_ct = 0;			
	ld	hl,#__en_ct + 0
	ld	(hl), #0x00
;engine/enengine.c:200: _en_s = (_en_t - 1) << 3;
	ld	a,(#__en_t + 0)
	add	a,#0xFF
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	(#__en_s + 0),a
;engine/enengine.c:217: en_status [gpit] = 1; 
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	d,a
;engine/enengine.c:216: if (rdm == 1) {
	ld	a,(#_rdm + 0)
	dec	a
	jr	NZ,00106$
;engine/enengine.c:217: en_status [gpit] = 1; 
	ld	a,#0x01
	ld	(de),a
	jr	00107$
00106$:
;engine/enengine.c:219: en_status [gpit] = 0;
	xor	a, a
	ld	(de),a
00107$:
;engine/enengine.c:227: if (_en_x1 > _en_x2) { rda = _en_x1; _en_x1 = _en_x2; _en_x2 = rda; }
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
;engine/enengine.c:228: if (_en_y1 > _en_y2) { rda = _en_y1; _en_y1 = _en_y2; _en_y2 = rda; }
	ld	a,(#__en_y2)
	ld	iy,#__en_y1
	sub	a, 0 (iy)
	jr	NC,00113$
	ld	a,(#__en_y1 + 0)
	ld	(#_rda + 0),a
	ld	a,(#__en_y2 + 0)
	ld	(#__en_y1 + 0),a
	ld	a,(#_rda + 0)
	ld	(#__en_y2 + 0),a
;engine/enengine.c:238: break;
	jr	00113$
;engine/enengine.c:255: case 6:
00112$:
;engine/enengine.c:257: enems_init_fp ();
	push	bc
	call	_enems_init_fp
	pop	bc
;engine/enengine.c:258: _enf_vx = _enf_vy = 0;
	ld	hl,#0x0000
	ld	(__enf_vy),hl
	ld	l, #0x00
	ld	(__enf_vx),hl
;engine/enengine.c:263: _en_s = FANTY_BASE_SPRID;
	ld	hl,#__en_s + 0
	ld	(hl), #0x20
;engine/enengine.c:384: }
00113$:
;engine/enengine.c:394: en_cttouched [gpit] = 0;
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
;engine/enengine.c:395: en_flags [gpit] = 0;
	ld	a,#<(_en_flags)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_flags)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
00116$:
;engine/enengine.c:398: ++ rdc;
	ld	hl, #_rdc+0
	inc	(hl)
;engine/enengine.c:401: enems_update_unsigned_char_arrays ();
	push	bc
	call	_enems_update_unsigned_char_arrays
	pop	bc
;engine/enengine.c:140: for (gpit = 0; gpit < 3; gpit ++) {
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x03
	jp	C,00118$
	ld	sp, ix
	pop	ix
	ret
;engine/enengine.c:406: void enems_kill () {
;	---------------------------------
; Function enems_kill
; ---------------------------------
_enems_kill::
;engine/enengine.c:407: en_flags [gpit] |= EN_STATE_DEAD;
	ld	de,#_en_flags+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	set	0, (hl)
	ld	a, (hl)
;engine/enengine.c:413: ep_dead [en_offs + gpit] = 1;
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
;engine/enengine.c:424: ++ pkilled;
	ld	hl, #_pkilled+0
	inc	(hl)
	ret
;engine/enengine.c:431: void enems_hit (void) {
;	---------------------------------
; Function enems_hit
; ---------------------------------
_enems_hit::
;engine/enengine.c:432: _en_facing = ((_en_x < prx) ? 0 : 4);
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
;engine/enengine.c:433: en_cttouched [gpit] = ENEMS_TOUCHED_FRAMES;
	ld	de,#_en_cttouched+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x08
;engine/enengine.c:449: enems_kill ();
	jp  _enems_kill
;engine/enengine.c:455: void enems_move (void) {
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
;engine/enengine.c:457: pgotten = pgtmx = pgtmy = 0;
	ld	hl,#0x0000
	ld	(_pgtmy),hl
	ld	l, #0x00
	ld	(_pgtmx),hl
	ld	hl,#_pgotten + 0
	ld	(hl), #0x00
;engine/enengine.c:461: touched = 0;
	ld	hl,#_touched + 0
	ld	(hl), #0x00
;engine/enengine.c:462: ++ en_initial; if (en_initial >= 3) en_initial = 0;
	ld	hl, #_en_initial+0
	inc	(hl)
	ld	a,(#_en_initial + 0)
	sub	a, #0x03
	jr	C,00102$
	ld	hl,#_en_initial + 0
	ld	(hl), #0x00
00102$:
;engine/enengine.c:463: gpit = en_initial;
	ld	a,(#_en_initial + 0)
	ld	(#_gpit + 0),a
;engine/enengine.c:464: gpjt = 3; while (gpjt --) {
	ld	hl,#_gpjt + 0
	ld	(hl), #0x03
00233$:
	ld	hl,#_gpjt + 0
	ld	d, (hl)
	ld	hl, #_gpjt+0
	dec	(hl)
	ld	a,d
	or	a, a
	jp	Z,00236$
;engine/enengine.c:465: gpit += 2; if (gpit > 2) gpit -=3;
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
;engine/enengine.c:468: _en_t = en_t [gpit];
	ld	a,#<(_en_t)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_t)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_t + 0),a
;engine/enengine.c:469: _en_s = en_s [gpit];
	ld	a,#<(_en_s)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_s)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_s + 0),a
;engine/enengine.c:470: _en_x = en_x [gpit]; _en_y = en_y [gpit];
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
;engine/enengine.c:471: _en_x1 = en_x1 [gpit]; _en_y1 = en_y1 [gpit];
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
;engine/enengine.c:472: _en_x2 = en_x2 [gpit]; _en_y2 = en_y2 [gpit];
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
;engine/enengine.c:473: _en_mx = en_mx [gpit]; _en_my = en_my [gpit];
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
;engine/enengine.c:474: _en_ct = en_ct [gpit];
	ld	a,#<(_en_ct)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_ct)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_ct + 0),a
;engine/enengine.c:475: _en_facing = en_facing [gpit];
	ld	a,#<(_en_facing)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_facing)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_facing + 0),a
;engine/enengine.c:476: _en_state = en_state [gpit];
	ld	a,#<(_en_state)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_state)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#__en_state + 0),a
;engine/enengine.c:479: _enf_x = enf_x [gpit]; _enf_vx = enf_vx [gpit];
	ld	iy,#_gpit
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ex	de,hl
	ld	hl,#_enf_x
	add	hl,de
	ld	a,(hl)
	ld	iy,#__enf_x
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#__enf_x + 1),a
	ld	hl,#_enf_vx
	add	hl,de
	ld	a,(hl)
	ld	iy,#__enf_vx
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#__enf_vx + 1),a
;engine/enengine.c:480: _enf_y = enf_y [gpit]; _enf_vy = enf_vy [gpit];
	ld	hl,#_enf_y
	add	hl,de
	ld	a,(hl)
	ld	iy,#__enf_y
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#__enf_y + 1),a
	ld	hl,#_enf_vy
	add	hl,de
	ld	a,(hl)
	ld	iy,#__enf_vy
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#__enf_vy + 1),a
;engine/enengine.c:483: if (_en_t == 0) continue;
	ld	a,(#__en_t + 0)
	or	a, a
	jp	Z,00233$
;engine/enengine.c:484: en_is_alive = !(en_flags [gpit] & EN_STATE_DEAD);
	ld	iy,#_en_flags
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
	and	a, #0x01
	ld	d,a
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	(#_en_is_alive + 0),a
;engine/enengine.c:488: en_spr = 0xff;
	ld	hl,#_en_spr + 0
	ld	(hl), #0xFF
;engine/enengine.c:491: en_spr_x_mod = 0;
	ld	hl,#_en_spr_x_mod + 0
	ld	(hl), #0x00
;engine/enengine.c:494: if (en_cttouched [gpit]) {
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
	jp	Z,00228$
;engine/enengine.c:495: -- en_cttouched [gpit];
	ld	d,-3 (ix)
	dec	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),d
;engine/enengine.c:511: rda = frame_counter & 0xf;
	ld	a,(#_frame_counter + 0)
	and	a, #0x0F
	ld	(#_rda + 0),a
;engine/enengine.c:515: spr_enems [ENEMS_EXPLODING_CELL]
	ld	hl,(_spr_enems)
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0050
	add	hl, de
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
;engine/enengine.c:514: _en_y + jitter [15 - rda] + SPRITE_ADJUST, 
	ld	a,(#_rda + 0)
	ld	-5 (ix),a
	ld	-4 (ix),#0x00
	ld	a,#0x0F
	sub	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,#0x00
	sbc	a, -4 (ix)
	ld	-4 (ix),a
	ld	a,#<(_jitter)
	add	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,#>(_jitter)
	adc	a, -4 (ix)
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	h,(hl)
	ld	a,(#__en_y + 0)
	add	a, h
	ld	-5 (ix), a
	add	a, #0xF7
	ld	-5 (ix),a
;engine/enengine.c:513: _en_x + jitter [rda],
	ld	a,#<(_jitter)
	ld	hl,#_rda
	add	a, (hl)
	ld	-7 (ix),a
	ld	a,#>(_jitter)
	adc	a, #0x00
	ld	-6 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	h,(hl)
	ld	a,(#__en_x + 0)
	add	a, h
	ld	d,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	a,-5 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_SG_addMetaSprite1x1
	pop	af
	pop	af
	jp	00230$
00228$:
;engine/enengine.c:534: if (en_is_alive) {
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00230$
;engine/enengine.c:537: pregotten = (prx + 7 >= _en_x && prx <= _en_x + 15);
	ld	a,(#_prx + 0)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	a,-7 (ix)
	add	a, #0x07
	ld	-5 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	iy,#__en_x
	ld	a,0 (iy)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-5 (ix)
	sub	a, -2 (ix)
	ld	a,-4 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00569$
	xor	a, #0x80
00569$:
	jp	M,00238$
	ld	a,-2 (ix)
	add	a, #0x0F
	ld	-5 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	a,-5 (ix)
	sub	a, -7 (ix)
	ld	a,-4 (ix)
	sbc	a, -6 (ix)
	jp	PO, 00570$
	xor	a, #0x80
00570$:
	jp	P,00239$
00238$:
	ld	-7 (ix),#0x00
	jr	00240$
00239$:
	ld	-7 (ix),#0x01
00240$:
	ld	a,-7 (ix)
	ld	(#_pregotten + 0),a
;engine/enengine.c:540: en_fr = ((((_en_mx) ? _en_x : _en_y)+4) >> 3) & 1;
	ld	a,(#__en_x + 0)
	ld	-7 (ix),a
	ld	a,(#__en_y + 0)
	ld	-5 (ix),a
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00241$
	ld	a,-7 (ix)
	ld	-3 (ix),a
	jr	00242$
00241$:
	ld	a,-5 (ix)
	ld	-3 (ix),a
00242$:
	ld	a,-3 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	add	a, #0x04
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	ld	a,-2 (ix)
	and	a, #0x01
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	ld	(#_en_fr + 0),a
;engine/enengine.c:543: if (res_on 
	ld	a,(#_res_on + 0)
	or	a, a
	jr	Z,00172$
;engine/enengine.c:556: ) {
	ld	a,(#__en_t + 0)
	sub	a, #0x04
	jr	Z,00172$
;engine/enengine.c:557: en_spr = en_spr_id [gpit];
	ld	a,#<(_en_spr_id)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_spr_id)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_en_spr + 0),a
	jp	00173$
00172$:
;engine/enengine.c:561: switch (_en_t & 63) {
	ld	a,(#__en_t + 0)
	and	a, #0x3F
	ld	h,a
	dec	a
	jr	Z,00110$
	ld	a,h
	cp	a,#0x02
	jr	Z,00110$
	cp	a,#0x03
	jr	Z,00110$
	cp	a,#0x04
	jr	Z,00110$
	sub	a, #0x06
	jp	Z,00122$
	jp	00170$
;engine/enengine.c:565: case 4:
00110$:
;engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	or	a, a
	jr	Z,00119$
	ld	a,(#_half_life + 0)
	or	a, a
	jp	Z,00120$
00119$:
;engine/../engine/enemmods/enem_linear.h:15: _en_x += _en_mx;
	ld	a,(#__en_x + 0)
	ld	hl,#__en_mx
	ld	iy,#__en_x
	add	a, (hl)
	ld	0 (iy),a
;engine/../engine/enemmods/enem_linear.h:32: _en_y += _en_my;
	ld	a,(#__en_y + 0)
	ld	hl,#__en_my
	ld	iy,#__en_y
	add	a, (hl)
	ld	0 (iy),a
;engine/../engine/enemmods/enem_linear.h:53: if (_en_x == _en_x1 || _en_x == _en_x2) _en_mx = -_en_mx;
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
;engine/../engine/enemmods/enem_linear.h:60: if (_en_y <= _en_y1) { _en_y = _en_y1; _en_my = ABS (_en_my); }
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
	ld	c,a
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	d,a
	ld	hl,#__en_my + 0
	ld	e, (hl)
	ld	a,(#__en_y1)
	ld	iy,#__en_y
	sub	a, 0 (iy)
	jr	C,00117$
	ld	a,(#__en_y1 + 0)
	ld	(#__en_y + 0),a
	ld	a,c
	or	a, a
	jr	Z,00243$
	ld	e,d
00243$:
	ld	hl,#__en_my + 0
	ld	(hl), e
	jr	00120$
00117$:
;engine/../engine/enemmods/enem_linear.h:61: else if (_en_y >= _en_y2) { _en_y = _en_y2; _en_my = -ABS (_en_my); }
	ld	hl,#__en_y2
	ld	a,(#__en_y + 0)
	sub	a, (hl)
	jr	C,00120$
	ld	a,(#__en_y2 + 0)
	ld	(#__en_y + 0),a
	ld	a,c
	or	a, a
	jr	NZ,00246$
	ld	d,e
00246$:
	xor	a, a
	sub	a, d
	ld	(#__en_my + 0),a
00120$:
;engine/../engine/enemmods/enem_linear.h:77: rda = _en_mx ? (_en_mx < 0) : (_en_my < 0); enems_facing ();
	ld	a,(#__en_mx + 0)
	or	a, a
	jr	Z,00247$
	ld	a,(#__en_mx + 0)
	rlca
	and	a,#0x01
	jr	00248$
00247$:
	ld	a,(#__en_my + 0)
	rlca
	and	a,#0x01
00248$:
	ld	(#_rda + 0),a
	call	_enems_facing
;engine/../engine/enemmods/enem_linear.h:79: en_spr = _en_s + en_fr + _en_facing;
	ld	hl,#_en_fr
	ld	a,(#__en_s + 0)
	add	a, (hl)
	ld	hl,#__en_facing
	ld	iy,#_en_spr
	add	a, (hl)
	ld	0 (iy),a
;engine/enengine.c:574: break;
	jp	00170$
;engine/enengine.c:589: case 6:
00122$:
;engine/../engine/enemmods/enem_homing_fanty.h:7: rdx = _en_x; rdy = _en_y; rdt = distance ();
	ld	a,-7 (ix)
	ld	(#_rdx + 0),a
	ld	a,-5 (ix)
	ld	(#_rdy + 0),a
	call	_distance
	ld	iy,#_rdt
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:35: _enf_y = _en_y << FIXBITS;
	ld	a,(#__en_y + 0)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
;engine/../engine/enemmods/enem_homing_fanty.h:11: switch (_en_state) {
	ld	a,(#__en_state + 0)
	or	a, a
	jr	Z,00123$
	ld	a,(#__en_state + 0)
	dec	a
	jr	Z,00126$
	jp	00143$
;engine/../engine/enemmods/enem_homing_fanty.h:12: case 0:
00123$:
;engine/../engine/enemmods/enem_homing_fanty.h:14: _enf_vx = ADD_SIGN2 (_en_x1, _en_x, FANTY_V_RETREAT);
	ld	a,(#__en_x1 + 0)
	ld	iy,#__en_x
	sub	a, 0 (iy)
	jr	NZ,00249$
	ld	a,#0x00
	jr	00250$
00249$:
	ld	a,(#__en_x)
	ld	iy,#__en_x1
	sub	a, 0 (iy)
	jr	NC,00251$
	ld	a,#0x10
	jr	00252$
00251$:
	ld	a,#0xF0
00252$:
00250$:
	ld	(#__enf_vx + 0),a
	rla
	sbc	a, a
	ld	(#__enf_vx + 1),a
;engine/../engine/enemmods/enem_homing_fanty.h:15: _enf_vy = ADD_SIGN2 (_en_y1, _en_y, FANTY_V_RETREAT);
	ld	a,(#__en_y1 + 0)
	ld	iy,#__en_y
	sub	a, 0 (iy)
	jr	NZ,00253$
	ld	a,#0x00
	jr	00254$
00253$:
	ld	a,(#__en_y)
	ld	iy,#__en_y1
	sub	a, 0 (iy)
	jr	NC,00255$
	ld	a,#0x10
	jr	00256$
00255$:
	ld	a,#0xF0
00256$:
00254$:
	ld	(#__enf_vy + 0),a
	rla
	sbc	a, a
	ld	(#__enf_vy + 1),a
;engine/../engine/enemmods/enem_homing_fanty.h:16: if (rdt < FANTY_DISTANCE) _en_state = 1;
	ld	a,(#_rdt + 0)
	sub	a, #0x60
	jp	NC,00143$
	ld	hl,#__en_state + 0
	ld	(hl), #0x01
;engine/../engine/enemmods/enem_homing_fanty.h:17: break;
	jp	00143$
;engine/../engine/enemmods/enem_homing_fanty.h:18: case 1:
00126$:
;engine/../engine/enemmods/enem_homing_fanty.h:20: if (px < _enf_x) {
	ld	hl,#__enf_x
	ld	a,(#_px + 0)
	sub	a, (hl)
	ld	iy,#_px
	ld	a,1 (iy)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00586$
	xor	a, #0x80
00586$:
	jp	P,00132$
;engine/../engine/enemmods/enem_homing_fanty.h:21: _enf_vx -= FANTY_A; if (_enf_vx < -FANTY_MAXV) _enf_vx = -FANTY_MAXV;
	ld	hl,(__enf_vx)
	dec	hl
	dec	hl
	ld	(__enf_vx),hl
	ld	a,(#__enf_vx + 0)
	sub	a, #0xE0
	ld	a,(#__enf_vx + 1)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00133$
	ld	hl,#0xFFE0
	ld	(__enf_vx),hl
	jr	00133$
00132$:
;engine/../engine/enemmods/enem_homing_fanty.h:23: _enf_vx += FANTY_A; if (_enf_vx > FANTY_MAXV) _enf_vx = FANTY_MAXV;
	ld	hl,#__enf_vx
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	a,#0x20
	ld	iy,#__enf_vx
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#__enf_vx
	sbc	a, 1 (iy)
	jp	PO, 00587$
	xor	a, #0x80
00587$:
	jp	P,00133$
	ld	hl,#0x0020
	ld	(__enf_vx),hl
00133$:
;engine/../engine/enemmods/enem_homing_fanty.h:26: if (py < _enf_y) {
	ld	hl,#__enf_y
	ld	a,(#_py + 0)
	sub	a, (hl)
	ld	iy,#_py
	ld	a,1 (iy)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00588$
	xor	a, #0x80
00588$:
	jp	P,00139$
;engine/../engine/enemmods/enem_homing_fanty.h:27: _enf_vy -= FANTY_A; if (_enf_vy < -FANTY_MAXV) _enf_vy = -FANTY_MAXV;
	ld	hl,(__enf_vy)
	dec	hl
	dec	hl
	ld	(__enf_vy),hl
	ld	a,(#__enf_vy + 0)
	sub	a, #0xE0
	ld	a,(#__enf_vy + 1)
	rla
	ccf
	rra
	sbc	a, #0x7F
	jr	NC,00140$
	ld	hl,#0xFFE0
	ld	(__enf_vy),hl
	jr	00140$
00139$:
;engine/../engine/enemmods/enem_homing_fanty.h:29: _enf_vy += FANTY_A; if (_enf_vy > FANTY_MAXV) _enf_vy = FANTY_MAXV;
	ld	hl,#__enf_vy
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	a,#0x20
	ld	iy,#__enf_vy
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#__enf_vy
	sbc	a, 1 (iy)
	jp	PO, 00589$
	xor	a, #0x80
00589$:
	jp	P,00140$
	ld	hl,#0x0020
	ld	(__enf_vy),hl
00140$:
;engine/../engine/enemmods/enem_homing_fanty.h:32: if (rdt > FANTY_DISTANCE) {
	ld	a,#0x60
	ld	iy,#_rdt
	sub	a, 0 (iy)
	jr	NC,00143$
;engine/../engine/enemmods/enem_homing_fanty.h:34: _enf_x = _en_x << FIXBITS;
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
;engine/../engine/enemmods/enem_homing_fanty.h:35: _enf_y = _en_y << FIXBITS;
	ld	a,-7 (ix)
	ld	(#__enf_y + 0),a
	ld	a,-6 (ix)
	ld	(#__enf_y + 1),a
	ld	a,#0x06+1
	jr	00591$
00590$:
	ld	iy,#__enf_y
	sla	0 (iy)
	ld	iy,#__enf_y
	rl	1 (iy)
00591$:
	dec	a
	jr	NZ,00590$
;engine/../engine/enemmods/enem_homing_fanty.h:36: _en_state = 0;
	ld	hl,#__en_state + 0
	ld	(hl), #0x00
;engine/../engine/enemmods/enem_homing_fanty.h:39: }
00143$:
;engine/../engine/enemmods/enem_homing_fanty.h:43: _enf_x += _enf_vx; 
	ld	hl,#__enf_vx
	push	de
	ld	iy,#__enf_x
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
;engine/../engine/enemmods/enem_homing_fanty.h:44: if (_enf_x < 0) _enf_x = 0;
	ld	a,(#__enf_x + 1)
	bit	7,a
	jr	Z,00145$
	ld	hl,#0x0000
	ld	(__enf_x),hl
00145$:
;engine/../engine/enemmods/enem_homing_fanty.h:45: if (_enf_x > 15360) _enf_x = 15360;
	xor	a, a
	ld	iy,#__enf_x
	cp	a, 0 (iy)
	ld	a,#0x3C
	ld	iy,#__enf_x
	sbc	a, 1 (iy)
	jp	PO, 00592$
	xor	a, #0x80
00592$:
	jp	P,00147$
	ld	hl,#0x3C00
	ld	(__enf_x),hl
00147$:
;engine/../engine/enemmods/enem_homing_fanty.h:46: _en_x = _enf_x >> 6;
	ld	hl,(__enf_x)
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
	ld	iy,#__en_x
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:50: if (_enf_vx) {
	ld	a,(#__enf_vx + 1)
	ld	hl,#__enf_vx + 0
	or	a,(hl)
	jp	Z,00155$
;engine/../engine/enemmods/enem_homing_fanty.h:51: cy1 = (_en_y + 4) >> 4;
	ld	a,-7 (ix)
	add	a, #0x04
	ld	h,a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	l,a
	sra	l
	rr	h
	sra	l
	rr	h
	sra	l
	rr	h
	sra	l
	rr	h
	ld	iy,#_cy1
	ld	0 (iy),h
;engine/../engine/enemmods/enem_homing_fanty.h:52: cy2 = (_en_y + 11) >> 4;
	ld	a,-7 (ix)
	add	a, #0x0B
	ld	h,a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	l,a
	sra	l
	rr	h
	sra	l
	rr	h
	sra	l
	rr	h
	sra	l
	rr	h
	ld	iy,#_cy2
	ld	0 (iy),h
;engine/enengine.c:537: pregotten = (prx + 7 >= _en_x && prx <= _en_x + 15);
	ld	iy,#__en_x
	ld	c,0 (iy)
	ld	b,#0x00
;engine/../engine/enemmods/enem_homing_fanty.h:54: if (_enf_vx > 0) {
	xor	a, a
	ld	iy,#__enf_vx
	cp	a, 0 (iy)
	ld	iy,#__enf_vx
	sbc	a, 1 (iy)
	jp	PO, 00593$
	xor	a, #0x80
00593$:
	jp	P,00149$
;engine/../engine/enemmods/enem_homing_fanty.h:55: cx1 = cx2 = (_en_x + 11) >> 4;
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
	ld	(#_cx1 + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:56: rda = ((cx2 - 1) << 4) + 4;
	ld	a,(#_cx2 + 0)
	add	a,#0xFF
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a, #0x04
	ld	(hl),a
	jr	00150$
00149$:
;engine/../engine/enemmods/enem_homing_fanty.h:58: cx1 = cx2 = (_en_x + 4) >> 4;
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
;engine/../engine/enemmods/enem_homing_fanty.h:59: rda = ((cx1 + 1) << 4) - 4;
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
00150$:
;engine/../engine/enemmods/enem_homing_fanty.h:61: cm_two_points ();
	call	_cm_two_points
;engine/../engine/enemmods/enem_homing_fanty.h:62: if ((at1 & 8) || (at2 & 8)) {
	ld	hl,#_at1+0
	bit	3, (hl)
	jr	NZ,00151$
	ld	hl,#_at2+0
	bit	3, (hl)
	jr	Z,00155$
00151$:
;engine/../engine/enemmods/enem_homing_fanty.h:63: _enf_vx = -_enf_vx;
	xor	a, a
	ld	iy,#__enf_vx
	sub	a, 0 (iy)
	ld	(#__enf_vx + 0),a
	ld	a, #0x00
	ld	iy,#__enf_vx
	sbc	a, 1 (iy)
	ld	(#__enf_vx + 1),a
;engine/../engine/enemmods/enem_homing_fanty.h:64: _en_x = rda; 
	ld	a,(#_rda + 0)
	ld	(#__en_x + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:65: _enf_x = rda << FIXBITS;
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(__enf_x),hl
00155$:
;engine/../engine/enemmods/enem_homing_fanty.h:73: _enf_y += _enf_vy; 
	ld	hl,#__enf_vy
	push	de
	ld	iy,#__enf_y
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
;engine/../engine/enemmods/enem_homing_fanty.h:74: if (_enf_y < 0) _enf_y = 0;
	ld	a,(#__enf_y + 1)
	bit	7,a
	jr	Z,00157$
	ld	hl,#0x0000
	ld	(__enf_y),hl
00157$:
;engine/../engine/enemmods/enem_homing_fanty.h:75: if (_enf_y > 11264) _enf_y = 11264;
	xor	a, a
	ld	iy,#__enf_y
	cp	a, 0 (iy)
	ld	a,#0x2C
	ld	iy,#__enf_y
	sbc	a, 1 (iy)
	jp	PO, 00597$
	xor	a, #0x80
00597$:
	jp	P,00159$
	ld	hl,#0x2C00
	ld	(__enf_y),hl
00159$:
;engine/../engine/enemmods/enem_homing_fanty.h:76: _en_y = _enf_y >> 6;
	ld	hl,(__enf_y)
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
	ld	iy,#__en_y
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:80: if (_enf_vy) {
	ld	a,(#__enf_vy + 1)
	ld	hl,#__enf_vy + 0
	or	a,(hl)
	jp	Z,00167$
;engine/../engine/enemmods/enem_homing_fanty.h:81: cx1 = (_en_x + 4) >> 4;
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
;engine/../engine/enemmods/enem_homing_fanty.h:82: cx2 = (_en_x + 11) >> 4;
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
;engine/../engine/enemmods/enem_homing_fanty.h:35: _enf_y = _en_y << FIXBITS;
	ld	iy,#__en_y
	ld	c,0 (iy)
	ld	b,#0x00
;engine/../engine/enemmods/enem_homing_fanty.h:84: if (_enf_vy > 0) {
	xor	a, a
	ld	iy,#__enf_vy
	cp	a, 0 (iy)
	ld	iy,#__enf_vy
	sbc	a, 1 (iy)
	jp	PO, 00598$
	xor	a, #0x80
00598$:
	jp	P,00161$
;engine/../engine/enemmods/enem_homing_fanty.h:85: rdb = 12;
	ld	hl,#_rdb + 0
	ld	(hl), #0x0C
;engine/../engine/enemmods/enem_homing_fanty.h:86: cy1 = cy2 = (_en_y + 11) >> 4;
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
	ld	(#_cy2 + 0),a
	ld	(#_cy1 + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:87: rda = ((cy2 - 1) << 4) + 4;
	ld	a,(#_cy2 + 0)
	add	a,#0xFF
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a, #0x04
	ld	(hl),a
	jr	00162$
00161$:
;engine/../engine/enemmods/enem_homing_fanty.h:89: rdb = 8;
	ld	hl,#_rdb + 0
	ld	(hl), #0x08
;engine/../engine/enemmods/enem_homing_fanty.h:90: cy1 = cy2 = (_en_y + 4) >> 4;
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
	ld	hl,#_cy2 + 0
	ld	(hl), c
	ld	hl,#_cy1 + 0
	ld	(hl), c
;engine/../engine/enemmods/enem_homing_fanty.h:91: rda = ((cy1 + 1) << 4) - 4;
	ld	a,(#_cy1 + 0)
	inc	a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_rda
	add	a,#0xFC
	ld	(hl),a
00162$:
;engine/../engine/enemmods/enem_homing_fanty.h:94: cm_two_points ();
	call	_cm_two_points
;engine/../engine/enemmods/enem_homing_fanty.h:95: if ((at1 & rdb) || (at2 & rdb)) {
	ld	a,(#_at1 + 0)
	ld	iy,#_rdb
	and	a, 0 (iy)
	or	a, a
	jr	NZ,00163$
	ld	a,(#_at2 + 0)
	ld	iy,#_rdb
	and	a, 0 (iy)
	or	a, a
	jr	Z,00167$
00163$:
;engine/../engine/enemmods/enem_homing_fanty.h:96: _enf_vy = -_enf_vy;
	xor	a, a
	ld	iy,#__enf_vy
	sub	a, 0 (iy)
	ld	(#__enf_vy + 0),a
	ld	a, #0x00
	ld	iy,#__enf_vy
	sbc	a, 1 (iy)
	ld	(#__enf_vy + 1),a
;engine/../engine/enemmods/enem_homing_fanty.h:97: _en_y = rda;
	ld	a,(#_rda + 0)
	ld	(#__en_y + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:98: _enf_y = rda << FIXBITS;
	ld	iy,#_rda
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(__enf_y),hl
00167$:
;engine/../engine/enemmods/enem_homing_fanty.h:105: cx1 = (_en_x + 8) >> 4;
	ld	iy,#__en_x
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
	ld	iy,#_cx1
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:106: cy1 = (_en_y + 8) >> 4;
	ld	iy,#__en_y
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
	ld	iy,#_cy1
	ld	0 (iy),l
;engine/../engine/enemmods/enem_homing_fanty.h:107: cm_two_points ();
	call	_cm_two_points
;engine/../engine/enemmods/enem_homing_fanty.h:108: if (at1 & 1) {
	ld	hl,#_at1+0
	bit	0, (hl)
	jr	Z,00169$
;engine/../engine/enemmods/enem_homing_fanty.h:109: en_cttouched [gpit] = 8;
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	l, a
	ld	a, #>(_en_cttouched)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0x08
;engine/../engine/enemmods/enem_homing_fanty.h:110: enems_kill ();
	call	_enems_kill
00169$:
;engine/../engine/enemmods/enem_homing_fanty.h:117: en_fr = (_en_x >> 3) & 1;
	ld	a,(#__en_x + 0)
	rrca
	rrca
	rrca
	and	a,#0x1F
	and	a, #0x01
	ld	(#_en_fr + 0),a
;engine/../engine/enemmods/enem_homing_fanty.h:122: rda = (prx < _en_x); enems_facing ();
	ld	hl,#__en_x
	push	de
	ld	iy,#_rda
	push	iy
	pop	de
	ld	a,(#_prx + 0)
	sub	a, (hl)
	ld	a,#0x00
	rla
	ld	(de),a
	pop	de
	call	_enems_facing
;engine/../engine/enemmods/enem_homing_fanty.h:123: en_spr = _en_s + en_fr + _en_facing;
	ld	hl,#_en_fr
	ld	a,(#__en_s + 0)
	add	a, (hl)
	ld	hl,#__en_facing
	ld	iy,#_en_spr
	add	a, (hl)
	ld	0 (iy),a
;engine/enengine.c:653: }
00170$:
;engine/enengine.c:657: en_spr_id [gpit] = en_spr;
	ld	a,#<(_en_spr_id)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_spr_id)
	adc	a, #0x00
	ld	d,a
	ld	a,(#_en_spr + 0)
	ld	(de),a
00173$:
;engine/enengine.c:556: ) {
	ld	a,(#__en_t + 0)
	sub	a, #0x04
	jr	NZ,00600$
	ld	a,#0x01
	jr	00601$
00600$:
	xor	a,a
00601$:
	ld	-7 (ix),a
;engine/../engine/enemmods/enem_homing_fanty.h:35: _enf_y = _en_y << FIXBITS;
	ld	hl,#__en_y + 0
	ld	b, (hl)
	ld	c,#0x00
;engine/enengine.c:694: if (_en_t == 4 && pregotten && !pgotten && !pj) {
	ld	a,-7 (ix)
	or	a, a
	jp	Z,00188$
	ld	a,(#_pregotten + 0)
	or	a, a
	jp	Z,00188$
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00188$
	ld	a,(#_pj + 0)
	or	a, a
	jp	NZ,00188$
;engine/../engine/enemmods/enem_linear.h:11: if (!en_status [gpit] || half_life) {
	ld	a,#<(_en_status)
	ld	hl,#_gpit
	add	a, (hl)
	ld	-5 (ix),a
	ld	a,#>(_en_status)
	adc	a, #0x00
	ld	-4 (ix),a
;engine/enengine.c:702: py = (_en_y - 16) << 6; pry = py >> 6;
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
	ld	-2 (ix),l
	ld	-1 (ix),h
;engine/enengine.c:698: if (_en_mx) {
	ld	a,(#__en_mx + 0)
	or	a, a
	jp	Z,00179$
;engine/enengine.c:699: if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
	ld	iy,#_pry
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#0x0010
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00602$
	xor	a, #0x80
00602$:
	jp	M,00179$
	ld	hl,#0x000C
	add	hl,de
	ld	a,b
	sub	a, l
	ld	a,c
	sbc	a, h
	jp	PO, 00603$
	xor	a, #0x80
00603$:
	jp	M,00179$
;engine/enengine.c:700: pgotten = 1;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x01
;engine/enengine.c:701: pgtmx = _en_mx << (6 - en_status [gpit]);
	ld	hl,#__en_mx + 0
	ld	d, (hl)
	ld	a,(#__en_mx + 0)
	rla
	sbc	a, a
	ld	e,a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
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
	jr	00605$
00604$:
	ld	iy,#_pgtmx
	sla	0 (iy)
	ld	iy,#_pgtmx
	rl	1 (iy)
00605$:
	dec	a
	jr	NZ,00604$
;engine/enengine.c:702: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
00179$:
;engine/enengine.c:699: if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
	ld	hl,#_pry + 0
	ld	e, (hl)
	ld	d,#0x00
;engine/enengine.c:710: (_en_my > 0 && pry + 16 + _en_my >= _en_y && pry + 12 <= _en_y)
	ld	a,(#__en_my + 0)
	ld	-9 (ix),a
	ld	iy,#__en_my
	ld	a,0 (iy)
	rla
	sbc	a, a
	ld	-8 (ix),a
;engine/enengine.c:709: (_en_my < 0 && pry + 17 >= _en_y && pry + 12 <= _en_y) ||
	ld	hl,#0x000C
	add	hl,de
	ld	a,b
	sub	a, l
	ld	a,c
	sbc	a, h
	jp	PO, 00606$
	xor	a, #0x80
00606$:
	rlca
	and	a,#0x01
	ld	-3 (ix),a
	ld	iy,#__en_my
	bit	7,0 (iy)
	jr	Z,00186$
	ld	hl,#0x0011
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00607$
	xor	a, #0x80
00607$:
	jp	M,00186$
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00180$
00186$:
;engine/enengine.c:710: (_en_my > 0 && pry + 16 + _en_my >= _en_y && pry + 12 <= _en_y)
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	jp	PO, 00608$
	xor	a, #0x80
00608$:
	jp	P,00188$
	ld	hl,#0x0010
	add	hl,de
	pop	de
	push	de
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00609$
	xor	a, #0x80
00609$:
	jp	M,00188$
	ld	a,-3 (ix)
	or	a, a
	jr	NZ,00188$
00180$:
;engine/enengine.c:712: pgotten = 1;
	ld	hl,#_pgotten + 0
	ld	(hl), #0x01
;engine/enengine.c:713: pgtmy = _en_my << (6 - en_status [gpit]);
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,#0x06
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	push	af
	ld	a,-9 (ix)
	ld	iy,#_pgtmy
	ld	0 (iy),a
	ld	a,-8 (ix)
	ld	iy,#_pgtmy
	ld	1 (iy),a
	pop	af
	inc	l
	jr	00611$
00610$:
	ld	iy,#_pgtmy
	sla	0 (iy)
	ld	iy,#_pgtmy
	rl	1 (iy)
00611$:
	dec	l
	jr	NZ,00610$
;engine/enengine.c:714: py = (_en_y - 16) << 6; pry = py >> 6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
;engine/enengine.c:715: pvy = 0;
	ld	hl,#0x0000
	ld	(_pvy),hl
00188$:
;engine/enengine.c:727: en_is_alive == 0	// General condition.
	ld	a,(#_en_is_alive + 0)
	or	a, a
	jp	Z,00230$
;engine/enengine.c:729: || en_cttouched [gpit]
	ld	a,#<(_en_cttouched)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_en_cttouched)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	or	a, a
	jp	NZ,00230$
;engine/enengine.c:755: ) goto skipdo;
	ld	a,-7 (ix)
	or	a, a
	jp	NZ,00230$
;engine/enengine.c:763: pregotten && 
	ld	a,(#_pregotten + 0)
	or	a, a
	jp	Z,00216$
;engine/enengine.c:764: pry < _en_y && 
	ld	hl,#__en_y
	ld	a,(#_pry + 0)
	sub	a, (hl)
	jp	NC,00216$
;engine/enengine.c:765: pry + 15 + ENEMS_COLLISION_VSTRETCH_FG >= _en_y &&
	ld	iy,#_pry
	ld	l,0 (iy)
	ld	h,#0x00
	ld	de,#0x000D
	add	hl,de
	ld	a,l
	sub	a, b
	ld	a,h
	sbc	a, c
	jp	PO, 00612$
	xor	a, #0x80
00612$:
	jp	M,00216$
;engine/enengine.c:766: pgotten == 0 &&	ppossee == 0
	ld	a,(#_pgotten + 0)
	or	a, a
	jp	NZ,00216$
	ld	a,(#_ppossee + 0)
	or	a, a
	jp	NZ,00216$
;engine/enengine.c:779: ) {
	ld	a,#0x20
	ld	iy,#_pvy
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_pvy
	sbc	a, 1 (iy)
	jp	PO, 00613$
	xor	a, #0x80
00613$:
	jp	P,00216$
;engine/enengine.c:782: if (res_on || res_disable)
	ld	a,(#_res_on + 0)
	or	a, a
	jr	NZ,00196$
	ld	a,(#_res_disable + 0)
	or	a, a
	jr	Z,00197$
00196$:
;engine/enengine.c:787: enems_hit ();
	call	_enems_hit
00197$:
;engine/enengine.c:790: if (_en_my < 0) _en_my = -_en_my;
	ld	a,(#__en_my + 0)
	bit	7,a
	jr	Z,00200$
	xor	a, a
	ld	iy,#__en_my
	sub	a, 0 (iy)
	ld	(#__en_my + 0),a
00200$:
;engine/enengine.c:794: if (pad0 & PAD_A) {
	ld	hl,#_pad0+0
	bit	5, (hl)
	jr	Z,00202$
;engine/enengine.c:795: jump_start ();
	call	_jump_start
	jr	00203$
00202$:
;engine/enengine.c:799: pvy = -PLAYER_VY_JUMP_INITIAL << 1;
	ld	hl,#0xFF80
	ld	(_pvy),hl
00203$:
;engine/enengine.c:801: PSGSFXPlay (SFX_STEPON, 3);
	ld	de,#_s_15_stepon3_psg
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
;engine/enengine.c:807: if (pry > _en_y - ENEMS_UPPER_COLLISION_BOUND) { pry = _en_y - ENEMS_UPPER_COLLISION_BOUND; py = pry << FIXBITS; }
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
	jp	PO, 00615$
	xor	a, #0x80
00615$:
	jp	P,00205$
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
00205$:
;engine/enengine.c:809: touched = 1;
	ld	hl,#_touched + 0
	ld	(hl), #0x01
	jr	00230$
00216$:
;engine/enengine.c:817: touched == 0 &&
	ld	a,(#_touched + 0)
	or	a, a
	jr	NZ,00230$
;engine/enengine.c:818: collide ()
	call	_collide
	ld	a,l
	or	a, a
	jr	Z,00230$
;engine/enengine.c:824: en_sg_1 = 0;
	ld	hl,#_en_sg_1 + 0
	ld	(hl), #0x00
;engine/enengine.c:828: en_sg_2 = (pflickering == 0);
	ld	a,(#_pflickering + 0)
	or	a, a
	jr	NZ,00616$
	ld	a,#0x01
	jr	00617$
00616$:
	xor	a,a
00617$:
	ld	(#_en_sg_2 + 0),a
;engine/enengine.c:837: ) en_sg_2 = 0;
	ld	a,(#_res_on + 0)
	dec	a
	jr	NZ,00207$
	ld	hl,#_en_sg_2 + 0
	ld	(hl), #0x00
00207$:
;engine/enengine.c:861: if (en_sg_1) enems_hit ();
	ld	a,(#_en_sg_1 + 0)
	or	a, a
	jr	Z,00209$
	call	_enems_hit
00209$:
;engine/enengine.c:863: if (en_sg_2) { 
	ld	a,(#_en_sg_2 + 0)
	or	a, a
	jr	Z,00211$
;engine/enengine.c:864: pkill = 1; 
	ld	hl,#_pkill + 0
	ld	(hl), #0x01
00211$:
;engine/enengine.c:879: touched = 1; 
	ld	hl,#_touched + 0
	ld	(hl), #0x01
;engine/enengine.c:1000: skipdo: 
00230$:
;engine/enengine.c:1003: if (en_spr != 0xff) {
	ld	a,(#_en_spr + 0)
	inc	a
	jr	Z,00232$
;engine/enengine.c:1006: spr_enems [en_spr]
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
;engine/enengine.c:1005: _en_x + en_spr_x_mod, _en_y + SPRITE_ADJUST, 
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
00232$:
;engine/enengine.c:1012: enems_update_unsigned_char_arrays ();
	call	_enems_update_unsigned_char_arrays
	jp	00233$
00236$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
