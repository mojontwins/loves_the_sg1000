;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Oct 31 22:58:49 2018
;--------------------------------------------------------
	.module printer
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _add_tile
	.globl _chac_chacs_add
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
;engine/printer.c:23: void clear_update_list (void) {
;	---------------------------------
; Function clear_update_list
; ---------------------------------
_clear_update_list::
;engine/printer.c:24: memfill (update_list, 0, UPDATE_LIST_SIZE*3);
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
;engine/printer.c:25: update_index = 0;
	ld	hl,#_update_index + 0
	ld	(hl), #0x00
	ret
;engine/printer.c:28: void cls (void) {
;	---------------------------------
; Function cls
; ---------------------------------
_cls::
;engine/printer.c:29: SG_setNextTileatXY (0, 0);
	ld	hl,#0x0000
	push	hl
	call	_SG_setNextTileatXY
;engine/printer.c:30: SG_fillTile (0, 768);
	ld	hl, #0x0300
	ex	(sp),hl
	xor	a, a
	push	af
	inc	sp
	call	_SG_fillTile
	pop	af
	inc	sp
	ret
;engine/printer.c:34: void ul_putc (void) {
;	---------------------------------
; Function ul_putc
; ---------------------------------
_ul_putc::
;engine/printer.c:35: update_list [update_index++] = MSB (gp_addr);
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
;engine/printer.c:36: update_list [update_index++] = LSB (gp_addr++);
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
;engine/printer.c:37: update_list [update_index++] = _n;
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
;engine/printer.c:41: void p_t (void) {
;	---------------------------------
; Function p_t
; ---------------------------------
_p_t::
;engine/printer.c:42: rda = _n; gp_addr = (_y << 5) + _x + PNTADDRESS;
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
;engine/printer.c:43: _n = ((rda/10)+16); ul_putc ();
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
;engine/printer.c:44: _n = ((rda%10)+16); ul_putc ();
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
;engine/printer.c:47: void p_tf (void) {
;	---------------------------------
; Function p_tf
; ---------------------------------
_p_tf::
;engine/printer.c:48: SG_setTileatXY (_x, _y, (_n / 10) + 16);
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
;engine/printer.c:49: SG_setTile ((_n % 10) + 16);
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
;engine/printer.c:54: void draw_tile (void) {
;	---------------------------------
; Function draw_tile
; ---------------------------------
_draw_tile::
;engine/printer.c:58: gp_tmap = c_ts_tmaps + (_t << 2);
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
;engine/printer.c:59: gp_addr = (_y << 5) + _x + PNTADDRESS;
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
;engine/printer.c:61: if (_y == TOP_ADJUST) {
	ld	a,(#__y + 0)
	dec	a
	jr	NZ,00102$
;engine/printer.c:62: gp_tmap += 2;		
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
;engine/printer.c:64: VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;engine/printer.c:65: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00118$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00118$:
;engine/printer.c:66: VDPDataPort = *gp_tmap ++;
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
;engine/printer.c:69: if (_y < TOP_ADJUST + 22) {
	ld	a,(#__y + 0)
	sub	a, #0x17
	ret	NC
;engine/printer.c:70: gp_addr += 32;
	ld	hl,#_gp_addr
	ld	a,(hl)
	add	a, #0x20
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;engine/printer.c:71: VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;engine/printer.c:72: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00120$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00120$:
;engine/printer.c:73: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	ret	NZ
	ld	hl, #_gp_tmap+1
	inc	(hl)
	ret
;engine/printer.c:79: void update_list_tile (void) {
;	---------------------------------
; Function update_list_tile
; ---------------------------------
_update_list_tile::
;engine/printer.c:80: gp_tmap = c_ts_tmaps + (_t << 2);
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
;engine/printer.c:81: gp_addr = ((_y << 5) + _x + PNTADDRESS);
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
;engine/printer.c:83: _n = *gp_tmap ++; ul_putc ();
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
;engine/printer.c:84: _n = *gp_tmap ++; ul_putc ();
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
;engine/printer.c:85: gp_addr += 30;
	ld	hl,#_gp_addr
	ld	a,(hl)
	add	a, #0x1E
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;engine/printer.c:87: _n = *gp_tmap ++; ul_putc ();
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
;engine/printer.c:88: _n = *gp_tmap   ; ul_putc ();
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	ld	(#__n + 0),a
	jp  _ul_putc
;engine/printer.c:93: void map_set (void) {
;	---------------------------------
; Function map_set
; ---------------------------------
_map_set::
;engine/printer.c:94: map_buff [COORDS (_x, _y)] = _t;
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
;engine/printer.c:98: _x = _x << 1; _y = TOP_ADJUST + (_y << 1);
	ld	iy,#__x
	sla	0 (iy)
	ld	a,(#__y + 0)
	add	a, a
	ld	hl,#__y
	inc	a
	ld	(hl),a
;engine/printer.c:99: update_list_tile (); 
	jp  _update_list_tile
;engine/printer.c:102: unsigned char get_byte (void) {
;	---------------------------------
; Function get_byte
; ---------------------------------
_get_byte::
;engine/printer.c:103: -- rdit; return *gp_gen ++;
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
;engine/../engine/mapmods/map_renderer_complex.h:11: void add_tile (void) {
;	---------------------------------
; Function add_tile
; ---------------------------------
_add_tile::
;engine/../engine/mapmods/map_renderer_complex.h:12: map_buff [rdm] = rda;
	ld	de,#_map_buff+0
	ld	hl,(_rdm)
	ld	h,#0x00
	add	hl,de
	ld	a,(#_rda + 0)
	ld	(hl),a
;engine/../engine/mapmods/map_renderer_complex.h:13: ++ rdm;
	ld	hl, #_rdm+0
	inc	(hl)
	ret
;engine/../engine/mapmods/map_renderer_complex.h:16: void draw_scr (void) {
;	---------------------------------
; Function draw_scr
; ---------------------------------
_draw_scr::
;engine/../engine/mapmods/map_renderer_complex.h:20: rdm = 0;
	ld	hl,#_rdm + 0
	ld	(hl), #0x00
;engine/../engine/mapmods/map_renderer_complex.h:86: gp_gen = c_map [n_pant];
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
;engine/../engine/mapmods/map_renderer_complex.h:88: while (rdm < 192) {
00104$:
	ld	a,(#_rdm + 0)
	sub	a, #0xC0
	jr	NC,00106$
;engine/../engine/mapmods/map_renderer_complex.h:89: rdt = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdt + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00241$
	ld	hl, #_gp_gen+1
	inc	(hl)
00241$:
;engine/../engine/mapmods/map_renderer_complex.h:90: rda = rdt & 0x0f;
	ld	a,(#_rdt + 0)
	and	a, #0x0F
	ld	(#_rda + 0),a
;engine/../engine/mapmods/map_renderer_complex.h:92: rdct = rdt;
	ld	a,(#_rdt + 0)
	ld	(#_rdct + 0),a
;engine/../engine/mapmods/map_renderer_complex.h:93: while (rdct >= 16) {
00101$:
	ld	a,(#_rdct + 0)
	sub	a, #0x10
	jr	C,00103$
;engine/../engine/mapmods/map_renderer_complex.h:94: add_tile (); rdct -= 16;
	call	_add_tile
	ld	hl,#_rdct
	ld	a,(hl)
	add	a,#0xF0
	ld	(hl),a
	jr	00101$
00103$:
;engine/../engine/mapmods/map_renderer_complex.h:95: } add_tile ();
	call	_add_tile
	jr	00104$
00106$:
;engine/../engine/mapmods/../../my/map_renderer_customization.h:10: set_rand (1 + n_pant);
	ld	iy,#_n_pant
	ld	h,0 (iy)
	inc	h
	push	hl
	inc	sp
	call	_set_rand
	inc	sp
;engine/../engine/mapmods/../../my/map_renderer_customization.h:11: gpit = 192; while (gpit --) {
	ld	hl,#_gpit + 0
	ld	(hl), #0xC0
00111$:
	ld	hl,#_gpit + 0
	ld	d, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,d
	or	a, a
	jr	Z,00113$
;engine/../engine/mapmods/../../my/map_renderer_customization.h:12: if (rand8 () & 1) {
	call	_rand8
	ld	a,l
	rrca
	jr	NC,00111$
;engine/../engine/mapmods/../../my/map_renderer_customization.h:13: rda = map_buff [gpit];
	ld	a,#<(_map_buff)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_map_buff)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
;engine/../engine/mapmods/../../my/map_renderer_customization.h:14: if (rda < 15) rda += 16;
	ld	(#_rda + 0),a
	sub	a, #0x0F
	jr	NC,00108$
	ld	hl,#_rda
	ld	a,(hl)
	add	a, #0x10
	ld	(hl),a
00108$:
;engine/../engine/mapmods/../../my/map_renderer_customization.h:15: map_buff [gpit] = rda;
	ld	a,(#_rda + 0)
	ld	(de),a
	jr	00111$
00113$:
;engine/../engine/mapmods/map_renderer_complex.h:140: if (c_decos) {
	ld	a,(#_c_decos + 0)
	or	a, a
	jr	Z,00124$
;engine/../engine/mapmods/map_renderer_complex.h:162: while (rda = *gp_gen ++) {
00120$:
	ld	hl,(_gp_gen)
	ld	d,(hl)
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00243$
	ld	hl, #_gp_gen+1
	inc	(hl)
00243$:
	ld	hl,#_rda + 0
	ld	(hl), d
	ld	a,d
	or	a, a
	jr	Z,00124$
;engine/../engine/mapmods/map_renderer_complex.h:163: if (rda & 0x80) {
	ld	hl,#_rda+0
	bit	7, (hl)
	jr	Z,00115$
;engine/../engine/mapmods/map_renderer_complex.h:164: rda &= 0x7F;
	ld	a,(#_rda + 0)
	res	7, a
	ld	(#_rda + 0),a
;engine/../engine/mapmods/map_renderer_complex.h:165: rdct = 1;
	ld	hl,#_rdct + 0
	ld	(hl), #0x01
	jr	00117$
00115$:
;engine/../engine/mapmods/map_renderer_complex.h:167: rdct = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdct + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00245$
	ld	hl, #_gp_gen+1
	inc	(hl)
00245$:
;engine/../engine/mapmods/map_renderer_complex.h:169: while (rdct --) {
00117$:
	ld	hl,#_rdct + 0
	ld	d, (hl)
	ld	hl, #_rdct+0
	dec	(hl)
	ld	a,d
	or	a, a
	jr	Z,00120$
;engine/../engine/mapmods/map_renderer_complex.h:170: rdm = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdm + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00246$
	ld	hl, #_gp_gen+1
	inc	(hl)
00246$:
;engine/../engine/mapmods/map_renderer_complex.h:171: add_tile ();
	call	_add_tile
	jr	00117$
00124$:
;engine/../engine/mapmods/map_renderer_complex.h:182: gp_gen = c_locks; rda = 0;
	ld	hl,(_c_locks)
	ld	(_gp_gen),hl
	ld	hl,#_rda + 0
	ld	(hl), #0x00
;engine/../engine/mapmods/map_renderer_complex.h:183: gpit = c_max_bolts; while (gpit --) {
	ld	a,(#_c_max_bolts + 0)
	ld	(#_gpit + 0),a
00129$:
	ld	hl,#_gpit + 0
	ld	d, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,d
	or	a, a
	jr	Z,00131$
;engine/../engine/mapmods/map_renderer_complex.h:184: rdb = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdb + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00247$
	ld	hl, #_gp_gen+1
	inc	(hl)
00247$:
;engine/../engine/mapmods/map_renderer_complex.h:185: rdm = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdm + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00248$
	ld	hl, #_gp_gen+1
	inc	(hl)
00248$:
;engine/../engine/mapmods/map_renderer_complex.h:186: if (n_pant == rdb) {
	ld	a,(#_n_pant + 0)
	ld	iy,#_rdb
	sub	a, 0 (iy)
	jr	NZ,00129$
;engine/../engine/mapmods/map_renderer_complex.h:187: if (!lkact [gpit]) add_tile ();
	ld	a,#<(_lkact)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_lkact)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	or	a, a
	jr	NZ,00129$
	call	_add_tile
	jr	00129$
00131$:
;engine/../engine/mapmods/map_renderer_complex.h:198: _x = 0; _y = TOP_ADJUST; gp_ram = map_buff;
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	hl,#_map_buff
	ld	(_gp_ram),hl
;engine/../engine/mapmods/map_renderer_complex.h:199: for (rdm = 0; rdm < 192; rdm ++) {
	ld	hl,#_rdm + 0
	ld	(hl), #0x00
00141$:
;engine/../engine/mapmods/map_renderer_complex.h:200: rdt = *gp_ram ++;
	ld	hl,(_gp_ram)
	ld	a,(hl)
	ld	(#_rdt + 0),a
	ld	hl, #_gp_ram+0
	inc	(hl)
	jr	NZ,00251$
	ld	hl, #_gp_ram+1
	inc	(hl)
00251$:
;engine/../engine/mapmods/../../engine/mapmods/map_detectors.h:40: if (rdt >= CHAC_CHAC_DETECT_TILE && rdt <= CHAC_CHAC_DETECT_TILE + 2) {
	ld	a,(#_rdt + 0)
	sub	a, #0x27
	jr	C,00133$
	ld	a,#0x29
	ld	iy,#_rdt
	sub	a, 0 (iy)
	jr	C,00133$
;engine/../engine/mapmods/../../engine/mapmods/map_detectors.h:41: chac_chacs_add ();
	call	_chac_chacs_add
;engine/../engine/mapmods/../../engine/mapmods/map_detectors.h:43: rdt = map_buff [rdm] = 0;
	ld	a,(#_rdm + 0)
	add	a, #<(_map_buff)
	ld	e,a
	ld	a,#0x00
	adc	a, #>(_map_buff)
	ld	d,a
	xor	a, a
	ld	(de),a
	ld	hl,#_rdt + 0
	ld	(hl), #0x00
00133$:
;engine/../engine/mapmods/map_renderer_complex.h:217: _t = rdt; draw_tile ();
	ld	a,(#_rdt + 0)
	ld	(#__t + 0),a
	call	_draw_tile
;engine/../engine/mapmods/map_renderer_complex.h:218: _x = (_x + 2) & 0x1f; if (!_x) _y += 2;
	ld	a,(#__x + 0)
	add	a, #0x02
	and	a, #0x1F
	ld	iy,#__x
	ld	0 (iy),a
	ld	a,(#__x + 0)
	or	a, a
	jr	NZ,00142$
	ld	iy,#__y
	inc	0 (iy)
	ld	iy,#__y
	inc	0 (iy)
00142$:
;engine/../engine/mapmods/map_renderer_complex.h:199: for (rdm = 0; rdm < 192; rdm ++) {
	ld	iy,#_rdm
	inc	0 (iy)
	ld	a,(#_rdm + 0)
	sub	a, #0xC0
	jr	C,00141$
;engine/../engine/mapmods/map_renderer_complex.h:222: gpit = max_chac_chacs; while (gpit --) {
	ld	a,(#_max_chac_chacs + 0)
	ld	(#_gpit + 0),a
00138$:
	ld	iy,#_gpit
	ld	e,0 (iy)
	ld	iy,#_gpit
	dec	0 (iy)
	ld	a,e
	or	a, a
	ret	Z
;engine/../engine/mapmods/map_renderer_complex.h:223: _t = CHAC_CHAC_BASE_TILE + 6;
	ld	iy,#__t
	ld	0 (iy),#0x26
;engine/../engine/mapmods/map_renderer_complex.h:224: _x = (chac_chacs_yx [gpit] & 0xf) << 1;
	ld	a,(#_gpit + 0)
	add	a, #<(_chac_chacs_yx)
	ld	e,a
	ld	a,#0x00
	adc	a, #>(_chac_chacs_yx)
	ld	d,a
	ld	a,(de)
	ld	l,a
	and	a, #0x0F
	add	a, a
	ld	iy,#__x
	ld	0 (iy),a
;engine/../engine/mapmods/map_renderer_complex.h:225: _y = ((chac_chacs_yx [gpit] & 0xf0) >> 3) + TOP_ADJUST;
	ld	a,l
	and	a, #0xF0
	rrca
	rrca
	rrca
	and	a,#0x1F
	ld	hl,#__y
	inc	a
	ld	(hl),a
;engine/../engine/mapmods/map_renderer_complex.h:226: draw_tile ();
	call	_draw_tile
;engine/../engine/mapmods/map_renderer_complex.h:227: _y += 2;
	ld	hl, #__y+0
	inc	(hl)
	ld	hl, #__y+0
	inc	(hl)
;engine/../engine/mapmods/map_renderer_complex.h:228: draw_tile ();
	call	_draw_tile
;engine/../engine/mapmods/map_renderer_complex.h:229: _y += 2;
	ld	hl, #__y+0
	inc	(hl)
	ld	hl, #__y+0
	inc	(hl)
;engine/../engine/mapmods/map_renderer_complex.h:230: draw_tile ();
	call	_draw_tile
	jr	00138$
;engine/printer.c:113: void pr_str (const unsigned char *s) {
;	---------------------------------
; Function pr_str
; ---------------------------------
_pr_str::
;engine/printer.c:114: SG_setNextTileatXY (_x, _y);
	ld	a,(__y)
	push	af
	inc	sp
	ld	a,(__x)
	push	af
	inc	sp
	call	_SG_setNextTileatXY
	pop	af
;engine/printer.c:115: while (gpit = *s++) {
	pop	bc
	pop	de
	push	de
	push	bc
00104$:
	ld	a,(de)
	inc	de
;engine/printer.c:116: if (gpit == '%') {
	ld	(#_gpit + 0),a
	or	a,a
	ret	Z
	sub	a, #0x25
	jr	NZ,00102$
;engine/printer.c:117: ++ _y; SG_setNextTileatXY (_x, _y);
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
;engine/printer.c:119: else SG_setTile (gpit - 32); 
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
