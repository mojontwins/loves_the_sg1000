;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 14:35:26 2019
;--------------------------------------------------------
	.module printer
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _add_tile
	.globl _memfill
	.globl _set_rand
	.globl _rand8
	.globl _SG_fillTile
	.globl _SG_setTile
	.globl _SG_setTileatXY
	.globl _SG_setNextTileatXY
	.globl _clear_update_list
	.globl _cls
	.globl _ul_putc
	.globl _p_t
	.globl _p_tf
	.globl _draw_tile
	.globl _update_list_tile
	.globl _map_set
	.globl _get_byte
	.globl _draw_scr
	.globl _pr_str
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
;./engine/printer.c:32: void clear_update_list (void) {
;	---------------------------------
; Function clear_update_list
; ---------------------------------
_clear_update_list::
;./engine/printer.c:33: memfill (update_list, 0, UPDATE_LIST_SIZE*3);
	ld	de,#_update_list
	ld	hl,#0x0060
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_memfill
	pop	af
	pop	af
	inc	sp
;./engine/printer.c:34: update_index = 0;
	ld	hl,#_update_index + 0
	ld	(hl), #0x00
	ret
;./engine/printer.c:37: void cls (void) {
;	---------------------------------
; Function cls
; ---------------------------------
_cls::
;./engine/printer.c:38: HW_setNextTileatXY (0, 0);
	ld	hl,#0x0000
	push	hl
	call	_SG_setNextTileatXY
;./engine/printer.c:39: HW_fillTile (0, 768);
	ld	hl, #0x0300
	ex	(sp),hl
	xor	a, a
	push	af
	inc	sp
	call	_SG_fillTile
	pop	af
	inc	sp
	ret
;./engine/printer.c:43: void ul_putc (void) {
;	---------------------------------
; Function ul_putc
; ---------------------------------
_ul_putc::
;./engine/printer.c:44: update_list [update_index++] = MSB (gp_addr);
	ld	hl,#_update_index + 0
	ld	e, (hl)
	ld	hl, #_update_index+0
	inc	(hl)
	ld	hl,#_update_list
	ld	d,#0x00
	add	hl, de
	ld	iy,#_gp_addr
	ld	d,1 (iy)
	ld	(hl),d
;./engine/printer.c:45: update_list [update_index++] = LSB (gp_addr++);
	ld	hl,#_update_index + 0
	ld	d, (hl)
	ld	hl, #_update_index+0
	inc	(hl)
	ld	a,#<(_update_list)
	add	a, d
	ld	e,a
	ld	a,#>(_update_list)
	adc	a, #0x00
	ld	d,a
	ld	bc,(_gp_addr)
	ld	hl, #_gp_addr+0
	inc	(hl)
	jr	NZ,00103$
	ld	hl, #_gp_addr+1
	inc	(hl)
00103$:
	ld	a,c
	ld	(de),a
;./engine/printer.c:46: update_list [update_index++] = _n;
	ld	hl,#_update_index + 0
	ld	e, (hl)
	ld	hl, #_update_index+0
	inc	(hl)
	ld	hl,#_update_list
	ld	d,#0x00
	add	hl, de
	ld	a,(#__n + 0)
	ld	(hl),a
	ret
;./engine/printer.c:50: void p_t (void) {
;	---------------------------------
; Function p_t
; ---------------------------------
_p_t::
;./engine/printer.c:51: rda = _n; gp_addr = (_y << 5) + _x + PNTADDRESS;
	ld	a,(#__n + 0)
	ld	(#_rda + 0),a
	ld	iy,#__y
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	iy,#__x
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl,de
	ex	de,hl
	ld	hl,#0x1800
	add	hl,de
	ld	(_gp_addr),hl
;./engine/printer.c:52: _n = ((rda/10)+16); ul_putc ();
	ld	a,#0x0A
	push	af
	inc	sp
	ld	a,(_rda)
	push	af
	inc	sp
	call	__divuchar
	pop	af
	ld	a,l
	ld	hl,#__n
	add	a, #0x10
	ld	(hl),a
	call	_ul_putc
;./engine/printer.c:53: _n = ((rda%10)+16); ul_putc ();
	ld	a,#0x0A
	push	af
	inc	sp
	ld	a,(_rda)
	push	af
	inc	sp
	call	__moduchar
	pop	af
	ld	a,l
	ld	hl,#__n
	add	a, #0x10
	ld	(hl),a
	jp  _ul_putc
;./engine/printer.c:56: void p_tf (void) {
;	---------------------------------
; Function p_tf
; ---------------------------------
_p_tf::
;./engine/printer.c:57: HW_setTileatXY (_x, _y, (_n / 10) + 16);
	ld	a,#0x0A
	push	af
	inc	sp
	ld	a,(__n)
	push	af
	inc	sp
	call	__divuchar
	pop	af
	ld	a,l
	add	a, #0x10
	push	af
	inc	sp
	ld	a,(__y)
	push	af
	inc	sp
	ld	a,(__x)
	push	af
	inc	sp
	call	_SG_setTileatXY
	pop	af
	inc	sp
;./engine/printer.c:58: HW_setTile ((_n % 10) + 16);
	ld	a,#0x0A
	push	af
	inc	sp
	ld	a,(__n)
	push	af
	inc	sp
	call	__moduchar
	pop	af
	ld	a,l
	add	a, #0x10
	push	af
	inc	sp
	call	_SG_setTile
	inc	sp
	ret
;./engine/printer.c:63: void draw_tile (void) {
;	---------------------------------
; Function draw_tile
; ---------------------------------
_draw_tile::
;./engine/printer.c:67: gp_tmap = c_ts_tmaps + (_t << 2);
	ld	iy,#__t
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	ld	d,l
	ld	e,h
	ld	hl,#_gp_tmap
	ld	a,(#_c_ts_tmaps + 0)
	add	a, d
	ld	(hl),a
	ld	a,(#_c_ts_tmaps + 1)
	adc	a, e
	inc	hl
	ld	(hl),a
;./engine/printer.c:68: gp_addr = (_y << 5) + _x + PNTADDRESS;
	ld	iy,#__y
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	iy,#__x
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl,de
	ex	de,hl
	ld	hl,#0x1800
	add	hl,de
	ld	(_gp_addr),hl
;./engine/printer.c:70: if (_y == TOP_ADJUST) {
	ld	a,(#__y + 0)
	dec	a
	jr	NZ,00102$
;./engine/printer.c:71: gp_tmap += 2;		
	ld	hl,#_gp_tmap
	ld	a,(hl)
	add	a, #0x02
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	jr	00103$
00102$:
;./engine/printer.c:73: VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;./engine/printer.c:74: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00118$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00118$:
;./engine/printer.c:75: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00119$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00119$:
00103$:
;./engine/printer.c:78: if (_y < TOP_ADJUST + 22) {
	ld	a,(#__y + 0)
	sub	a, #0x17
	ret	NC
;./engine/printer.c:79: gp_addr += 32;
	ld	hl,#_gp_addr
	ld	a,(hl)
	add	a, #0x20
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;./engine/printer.c:80: VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;./engine/printer.c:81: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00120$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00120$:
;./engine/printer.c:82: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	ret	NZ
	ld	hl, #_gp_tmap+1
	inc	(hl)
	ret
;./engine/printer.c:88: void update_list_tile (void) {
;	---------------------------------
; Function update_list_tile
; ---------------------------------
_update_list_tile::
;./engine/printer.c:89: gp_tmap = c_ts_tmaps + (_t << 2);
	ld	iy,#__t
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	ld	d,l
	ld	e,h
	ld	hl,#_gp_tmap
	ld	a,(#_c_ts_tmaps + 0)
	add	a, d
	ld	(hl),a
	ld	a,(#_c_ts_tmaps + 1)
	adc	a, e
	inc	hl
	ld	(hl),a
;./engine/printer.c:90: gp_addr = ((_y << 5) + _x + PNTADDRESS);
	ld	iy,#__y
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	iy,#__x
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl,de
	ex	de,hl
	ld	hl,#0x1800
	add	hl,de
	ld	(_gp_addr),hl
;./engine/printer.c:92: _n = *gp_tmap ++; ul_putc ();
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	ld	(#__n + 0),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00103$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00103$:
	call	_ul_putc
;./engine/printer.c:93: _n = *gp_tmap ++; ul_putc ();
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	ld	(#__n + 0),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00104$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00104$:
	call	_ul_putc
;./engine/printer.c:94: gp_addr += 30;
	ld	hl,#_gp_addr
	ld	a,(hl)
	add	a, #0x1E
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;./engine/printer.c:96: _n = *gp_tmap ++; ul_putc ();
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	ld	(#__n + 0),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00105$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00105$:
	call	_ul_putc
;./engine/printer.c:97: _n = *gp_tmap   ; ul_putc ();
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	ld	(#__n + 0),a
	jp  _ul_putc
;./engine/printer.c:102: void map_set (void) {
;	---------------------------------
; Function map_set
; ---------------------------------
_map_set::
;./engine/printer.c:103: map_buff [COORDS (_x, _y)] = _t;
	ld	de,#_map_buff+0
	ld	iy,#__y
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	a,(#__x + 0)
	ld	h, #0x00
	or	a, c
	ld	l,a
	ld	a,h
	or	a, b
	ld	h,a
	add	hl,de
	ld	a,(#__t + 0)
	ld	(hl),a
;./engine/printer.c:107: _x = _x << 1; _y = TOP_ADJUST + (_y << 1);
	ld	iy,#__x
	sla	0 (iy)
	ld	a,(#__y + 0)
	add	a, a
	ld	hl,#__y
	inc	a
	ld	(hl),a
;./engine/printer.c:108: update_list_tile (); 
	jp  _update_list_tile
;./engine/printer.c:111: unsigned char get_byte (void) {
;	---------------------------------
; Function get_byte
; ---------------------------------
_get_byte::
;./engine/printer.c:112: -- rdit; return *gp_gen ++;
	ld	hl, #_rdit+0
	dec	(hl)
	ld	hl,(_gp_gen)
	ld	d,(hl)
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00103$
	ld	hl, #_gp_gen+1
	inc	(hl)
00103$:
	ld	l,d
	ret
;./engine/../engine/mapmods/map_renderer_complex.h:11: void add_tile (void) {
;	---------------------------------
; Function add_tile
; ---------------------------------
_add_tile::
;./engine/../engine/mapmods/map_renderer_complex.h:12: map_buff [rdm] = rda;
	ld	de,#_map_buff+0
	ld	hl,(_rdm)
	ld	h,#0x00
	add	hl,de
	ld	a,(#_rda + 0)
	ld	(hl),a
;./engine/../engine/mapmods/map_renderer_complex.h:13: ++ rdm;
	ld	hl, #_rdm+0
	inc	(hl)
	ret
;./engine/../engine/mapmods/map_renderer_complex.h:16: void draw_scr (void) {
;	---------------------------------
; Function draw_scr
; ---------------------------------
_draw_scr::
;./engine/../engine/mapmods/map_renderer_complex.h:20: rdm = 0;
	ld	hl,#_rdm + 0
	ld	(hl), #0x00
;./engine/../engine/mapmods/map_renderer_complex.h:70: gp_gen = c_map [n_pant];
	ld	iy,#_n_pant
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ex	de,hl
	ld	hl,(_c_map)
	add	hl,de
	ld	a,(hl)
	ld	iy,#_gp_gen
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_gp_gen
	ld	1 (iy),a
;./engine/../engine/mapmods/map_renderer_complex.h:72: while (rdm < 192) {
00104$:
	ld	a,(#_rdm + 0)
	sub	a, #0xC0
	jr	NC,00106$
;./engine/../engine/mapmods/map_renderer_complex.h:73: rdt = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdt + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00268$
	ld	hl, #_gp_gen+1
	inc	(hl)
00268$:
;./engine/../engine/mapmods/map_renderer_complex.h:74: rda = rdt & 0x1f;
	ld	a,(#_rdt + 0)
	and	a, #0x1F
	ld	(#_rda + 0),a
;./engine/../engine/mapmods/map_renderer_complex.h:76: rdct = rdt;
	ld	a,(#_rdt + 0)
	ld	(#_rdct + 0),a
;./engine/../engine/mapmods/map_renderer_complex.h:77: while (rdct >= 32) {
00101$:
	ld	a,(#_rdct + 0)
	sub	a, #0x20
	jr	C,00103$
;./engine/../engine/mapmods/map_renderer_complex.h:78: add_tile (); rdct -= 32;
	call	_add_tile
	ld	hl,#_rdct
	ld	a,(hl)
	add	a,#0xE0
	ld	(hl),a
	jr	00101$
00103$:
;./engine/../engine/mapmods/map_renderer_complex.h:79: } add_tile ();
	call	_add_tile
	jr	00104$
00106$:
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:23: set_rand (1 + n_pant);
	ld	iy,#_n_pant
	ld	h,0 (iy)
	inc	h
	push	hl
	inc	sp
	call	_set_rand
	inc	sp
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:25: if (level == 1) {
	ld	a,(#_level + 0)
	dec	a
	jp	NZ,00133$
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:26: gpit = 192; while (gpit --) {
	ld	hl,#_gpit + 0
	ld	(hl), #0xC0
00129$:
	ld	hl,#_gpit + 0
	ld	d, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,d
	or	a, a
	jp	Z,00133$
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:27: rda = map_buff [gpit];
	ld	a,#<(_map_buff)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_map_buff)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_rda + 0),a
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:28: rdb = map_buff [gpit - 1];
	ld	hl,#_gpit + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	l,e
	ld	h,d
	ld	bc,#_map_buff-1
	add	hl,bc
	ld	a,(hl)
	ld	(#_rdb + 0),a
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:29: rdc = map_buff [gpit + 1];
	inc	de
	ld	hl,#_map_buff
	add	hl,de
	ld	a,(hl)
	ld	(#_rdc + 0),a
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:30: rdd = rand8();
	call	_rand8
	ld	iy,#_rdd
	ld	0 (iy),l
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:31: switch (rda) {
	ld	a,(#_rda + 0)
	cp	a,#0x02
	jr	Z,00122$
	cp	a,#0x07
	jr	Z,00107$
	sub	a, #0x08
	jr	Z,00114$
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:41: rda = 30 + (rdd & 1);
	ld	a,(#_rdd + 0)
	and	a, #0x01
	ld	d,a
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:31: switch (rda) {
	ld	a,(#_rda + 0)
	cp	a,#0x0E
	jr	Z,00121$
	sub	a, #0x1D
	jr	Z,00125$
	jr	00128$
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:32: case 7:
00107$:
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:33: if (rdb != 7) rda = 24;
	ld	a,(#_rdb + 0)
	sub	a, #0x07
	jr	Z,00112$
	ld	hl,#_rda + 0
	ld	(hl), #0x18
	jr	00128$
00112$:
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:34: else if (rdc != 7 && rdc != 25) rda = 25;
	ld	a,(#_rdc + 0)
	cp	a,#0x07
	jr	Z,00128$
	sub	a, #0x19
	jr	Z,00128$
	ld	hl,#_rda + 0
	ld	(hl), #0x19
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:35: break;
	jr	00128$
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:36: case 8:
00114$:
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:37: if (rdb != 8) rda = 26;
	ld	a,(#_rdb + 0)
	sub	a, #0x08
	jr	Z,00119$
	ld	hl,#_rda + 0
	ld	(hl), #0x1A
	jr	00128$
00119$:
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:38: else if (rdc != 8 && rdc != 27) rda = 27;
	ld	a,(#_rdc + 0)
	cp	a,#0x08
	jr	Z,00128$
	sub	a, #0x1B
	jr	Z,00128$
	ld	hl,#_rda + 0
	ld	(hl), #0x1B
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:39: break;
	jr	00128$
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:40: case 14:
00121$:
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:41: rda = 30 + (rdd & 1);
	ld	a,d
	ld	hl,#_rda
	add	a, #0x1E
	ld	(hl),a
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:42: break;
	jr	00128$
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:43: case 2:
00122$:
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:44: if (rand8 () & 1) rda = 21 + (rdd & 1);
	call	_rand8
	ld	a,l
	rrca
	jr	NC,00128$
	ld	a,(#_rdd + 0)
	and	a, #0x01
	ld	hl,#_rda
	add	a, #0x15
	ld	(hl),a
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:45: break;
	jr	00128$
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:46: case 29:
00125$:
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:47: if (rdd & 1) rda = 16;
	ld	a,d
	or	a, a
	jr	Z,00128$
	ld	hl,#_rda + 0
	ld	(hl), #0x10
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:49: }
00128$:
;./engine/../engine/mapmods/../../my/map_renderer_customization.h:50: map_buff [gpit] = rda;
	ld	a,#<(_map_buff)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_map_buff)
	adc	a, #0x00
	ld	d,a
	ld	a,(#_rda + 0)
	ld	(de),a
	jp	00129$
00133$:
;./engine/../engine/mapmods/map_renderer_complex.h:147: gp_gen = c_locks; rda = 0;
	ld	hl,(_c_locks)
	ld	(_gp_gen),hl
	ld	hl,#_rda + 0
	ld	(hl), #0x00
;./engine/../engine/mapmods/map_renderer_complex.h:148: gpit = c_max_bolts; while (gpit --) {
	ld	a,(#_c_max_bolts + 0)
	ld	(#_gpit + 0),a
	ld	de,#_lkact+0
00138$:
	ld	hl,#_gpit + 0
	ld	b, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,b
	or	a, a
	jr	Z,00140$
;./engine/../engine/mapmods/map_renderer_complex.h:149: rdb = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdb + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00283$
	ld	hl, #_gp_gen+1
	inc	(hl)
00283$:
;./engine/../engine/mapmods/map_renderer_complex.h:150: rdm = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdm + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00284$
	ld	hl, #_gp_gen+1
	inc	(hl)
00284$:
;./engine/../engine/mapmods/map_renderer_complex.h:151: if (n_pant == rdb) {
	ld	a,(#_n_pant + 0)
	ld	iy,#_rdb
	sub	a, 0 (iy)
	jr	NZ,00138$
;./engine/../engine/mapmods/map_renderer_complex.h:152: if (!lkact [gpit]) add_tile ();
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	or	a, a
	jr	NZ,00138$
	push	de
	call	_add_tile
	pop	de
	jr	00138$
00140$:
;./engine/../engine/mapmods/map_renderer_complex.h:160: rdd = 0;
	ld	hl,#_rdd + 0
	ld	(hl), #0x00
;./engine/../engine/mapmods/map_renderer_complex.h:163: _x = 0; _y = TOP_ADJUST; gp_ram = map_buff;
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	hl,#_map_buff+0
	ld	(_gp_ram),hl
;./engine/../engine/mapmods/map_renderer_complex.h:164: for (rdm = 0; rdm < 192; rdm ++) {
	ld	hl,#_rdm + 0
	ld	(hl), #0x00
00148$:
;./engine/../engine/mapmods/map_renderer_complex.h:165: rdt = *gp_ram ++;
	ld	hl,(_gp_ram)
	ld	a,(hl)
	ld	(#_rdt + 0),a
	ld	hl, #_gp_ram+0
	inc	(hl)
	jr	NZ,00287$
	ld	hl, #_gp_ram+1
	inc	(hl)
00287$:
;./engine/../engine/mapmods/map_renderer_complex.h:168: if (tile_got [rdd] & bits [rdm & 7]) rdt = 0;
	ld	iy,#_tile_got
	ld	de,(_rdd)
	ld	d,#0x00
	add	iy, de
	ld	b, 0 (iy)
	ld	a,(#_rdm + 0)
	and	a, #0x07
	ld	e,a
	ld	hl,#_bits
	ld	d,#0x00
	add	hl, de
	ld	a,(hl)
	and	a,b
	jr	Z,00142$
	ld	hl,#_rdt + 0
	ld	(hl), #0x00
00142$:
;./engine/../engine/mapmods/map_renderer_complex.h:169: if ((rdm & 7) == 7) ++ rdd;
	ld	a,e
	sub	a, #0x07
	jr	NZ,00144$
	ld	hl, #_rdd+0
	inc	(hl)
00144$:
;./engine/../engine/mapmods/map_renderer_complex.h:178: DISABLE_INTERRUPTS;
	di 
;./engine/../engine/mapmods/map_renderer_complex.h:179: _t = rdt; draw_tile ();
	ld	a,(#_rdt + 0)
	ld	(#__t + 0),a
	call	_draw_tile
;./engine/../engine/mapmods/map_renderer_complex.h:180: _x = (_x + 2) & 0x1f; if (!_x) _y += 2;
	ld	a,(#__x + 0)
	add	a, #0x02
	and	a, #0x1F
	ld	(#__x + 0),a
	or	a, a
	jr	NZ,00146$
	ld	hl, #__y+0
	inc	(hl)
	ld	hl, #__y+0
	inc	(hl)
00146$:
;./engine/../engine/mapmods/map_renderer_complex.h:181: ENABLE_INTERRUPTS;
	ei 
;./engine/../engine/mapmods/map_renderer_complex.h:164: for (rdm = 0; rdm < 192; rdm ++) {
	ld	hl, #_rdm+0
	inc	(hl)
	ld	a,(#_rdm + 0)
	sub	a, #0xC0
	jr	C,00148$
;./engine/../engine/mapmods/map_renderer_complex.h:210: ENABLE_INTERRUPTS;
	ei 
	ret
;./engine/printer.c:122: void pr_str (const unsigned char *s) {
;	---------------------------------
; Function pr_str
; ---------------------------------
_pr_str::
;./engine/printer.c:123: HW_setNextTileatXY (_x, _y);
	ld	a,(__y)
	push	af
	inc	sp
	ld	a,(__x)
	push	af
	inc	sp
	call	_SG_setNextTileatXY
	pop	af
;./engine/printer.c:124: while (gpit = *s++) {
	pop	bc
	pop	de
	push	de
	push	bc
00104$:
	ld	a,(de)
	inc	de
;./engine/printer.c:125: if (gpit == '%') {
	ld	(#_gpit + 0),a
	or	a,a
	ret	Z
	sub	a, #0x25
	jr	NZ,00102$
;./engine/printer.c:126: ++ _y; HW_setNextTileatXY (_x, _y);
	ld	hl, #__y+0
	inc	(hl)
	push	de
	ld	a,(__y)
	push	af
	inc	sp
	ld	a,(__x)
	push	af
	inc	sp
	call	_SG_setNextTileatXY
	pop	af
	pop	de
	jr	00104$
00102$:
;./engine/printer.c:128: else HW_setTile (gpit - 32); 
	ld	a,(#_gpit + 0)
	add	a,#0xE0
	push	de
	push	af
	inc	sp
	call	_SG_setTile
	inc	sp
	pop	de
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
