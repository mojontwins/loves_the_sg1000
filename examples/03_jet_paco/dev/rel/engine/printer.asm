;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Tue Nov 13 17:35:20 2018
;--------------------------------------------------------
	.module printer
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _add_tile
	.globl _chac_chacs_add
	.globl _memfill
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
;engine/printer.c:26: void clear_update_list (void) {
;	---------------------------------
; Function clear_update_list
; ---------------------------------
_clear_update_list::
;engine/printer.c:27: memfill (update_list, 0, UPDATE_LIST_SIZE*3);
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
;engine/printer.c:28: update_index = 0;
	ld	hl,#_update_index + 0
	ld	(hl), #0x00
	ret
;engine/printer.c:31: void cls (void) {
;	---------------------------------
; Function cls
; ---------------------------------
_cls::
;engine/printer.c:32: SG_setNextTileatXY (0, 0);
	ld	hl,#0x0000
	push	hl
	call	_SG_setNextTileatXY
;engine/printer.c:33: SG_fillTile (0, 768);
	ld	hl, #0x0300
	ex	(sp),hl
	xor	a, a
	push	af
	inc	sp
	call	_SG_fillTile
	pop	af
	inc	sp
	ret
;engine/printer.c:37: void ul_putc (void) {
;	---------------------------------
; Function ul_putc
; ---------------------------------
_ul_putc::
;engine/printer.c:38: update_list [update_index++] = MSB (gp_addr);
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
;engine/printer.c:39: update_list [update_index++] = LSB (gp_addr++);
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
;engine/printer.c:40: update_list [update_index++] = _n;
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
;engine/printer.c:44: void p_t (void) {
;	---------------------------------
; Function p_t
; ---------------------------------
_p_t::
;engine/printer.c:45: rda = _n; gp_addr = (_y << 5) + _x + PNTADDRESS;
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
;engine/printer.c:46: _n = ((rda/10)+16); ul_putc ();
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
;engine/printer.c:47: _n = ((rda%10)+16); ul_putc ();
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
;engine/printer.c:50: void p_tf (void) {
;	---------------------------------
; Function p_tf
; ---------------------------------
_p_tf::
;engine/printer.c:51: SG_setTileatXY (_x, _y, (_n / 10) + 16);
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
;engine/printer.c:52: SG_setTile ((_n % 10) + 16);
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
;engine/printer.c:57: void draw_tile (void) {
;	---------------------------------
; Function draw_tile
; ---------------------------------
_draw_tile::
;engine/printer.c:61: gp_tmap = c_ts_tmaps + (_t << 2);
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
;engine/printer.c:62: gp_addr = (_y << 5) + _x + PNTADDRESS;
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
;engine/printer.c:64: if (_y == TOP_ADJUST) {
	ld	a,(#__y + 0)
	dec	a
	jr	NZ,00102$
;engine/printer.c:65: gp_tmap += 2;		
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
;engine/printer.c:67: VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;engine/printer.c:68: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00118$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00118$:
;engine/printer.c:69: VDPDataPort = *gp_tmap ++;
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
;engine/printer.c:72: if (_y < TOP_ADJUST + 22) {
	ld	a,(#__y + 0)
	sub	a, #0x17
	ret	NC
;engine/printer.c:73: gp_addr += 32;
	ld	hl,#_gp_addr
	ld	a,(hl)
	add	a, #0x20
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;engine/printer.c:74: VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
	ld	a,(#_gp_addr + 0)
	out	(_VDPControlPort),a
	ld	a,(#_gp_addr + 1)
	set	6, a
	out	(_VDPControlPort),a
;engine/printer.c:75: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	jr	NZ,00120$
	ld	hl, #_gp_tmap+1
	inc	(hl)
00120$:
;engine/printer.c:76: VDPDataPort = *gp_tmap ++;
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	out	(_VDPDataPort),a
	ld	hl, #_gp_tmap+0
	inc	(hl)
	ret	NZ
	ld	hl, #_gp_tmap+1
	inc	(hl)
	ret
;engine/printer.c:82: void update_list_tile (void) {
;	---------------------------------
; Function update_list_tile
; ---------------------------------
_update_list_tile::
;engine/printer.c:83: gp_tmap = c_ts_tmaps + (_t << 2);
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
;engine/printer.c:84: gp_addr = ((_y << 5) + _x + PNTADDRESS);
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
;engine/printer.c:86: _n = *gp_tmap ++; ul_putc ();
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
;engine/printer.c:87: _n = *gp_tmap ++; ul_putc ();
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
;engine/printer.c:88: gp_addr += 30;
	ld	hl,#_gp_addr
	ld	a,(hl)
	add	a, #0x1E
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;engine/printer.c:90: _n = *gp_tmap ++; ul_putc ();
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
;engine/printer.c:91: _n = *gp_tmap   ; ul_putc ();
	ld	hl,(_gp_tmap)
	ld	a,(hl)
	ld	(#__n + 0),a
	jp  _ul_putc
;engine/printer.c:96: void map_set (void) {
;	---------------------------------
; Function map_set
; ---------------------------------
_map_set::
;engine/printer.c:97: map_buff [COORDS (_x, _y)] = _t;
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
;engine/printer.c:101: _x = _x << 1; _y = TOP_ADJUST + (_y << 1);
	ld	iy,#__x
	sla	0 (iy)
	ld	a,(#__y + 0)
	add	a, a
	ld	hl,#__y
	inc	a
	ld	(hl),a
;engine/printer.c:102: update_list_tile (); 
	jp  _update_list_tile
;engine/printer.c:105: unsigned char get_byte (void) {
;	---------------------------------
; Function get_byte
; ---------------------------------
_get_byte::
;engine/printer.c:106: -- rdit; return *gp_gen ++;
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
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
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
	ld	(#_gp_gen + 1),a
;engine/../engine/mapmods/map_renderer_complex.h:88: while (rdm < 192) {
00104$:
;engine/../engine/mapmods/map_renderer_complex.h:89: rdt = *gp_gen ++;
	ld	de,(_gp_gen)
	ld	bc,(_gp_gen)
	inc	bc
;engine/../engine/mapmods/map_renderer_complex.h:88: while (rdm < 192) {
	ld	a,(#_rdm + 0)
	sub	a, #0xC0
	jr	NC,00106$
;engine/../engine/mapmods/map_renderer_complex.h:89: rdt = *gp_gen ++;
	ld	a,(de)
	ld	(#_rdt + 0),a
	ld	(_gp_gen),bc
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
;engine/../engine/mapmods/map_renderer_complex.h:140: if (c_decos) {
	ld	a,(#_c_decos + 0)
	or	a, a
	jr	Z,00117$
;engine/../engine/mapmods/map_renderer_complex.h:162: while (rda = *gp_gen ++) {
00113$:
	ld	a,(de)
	ld	d,a
	ld	(_gp_gen),bc
	ld	hl,#_rda + 0
	ld	(hl), d
	ld	a,d
	or	a, a
	jr	Z,00117$
;engine/../engine/mapmods/map_renderer_complex.h:163: if (rda & 0x80) {
	ld	hl,#_rda+0
	bit	7, (hl)
	jr	Z,00108$
;engine/../engine/mapmods/map_renderer_complex.h:164: rda &= 0x7F;
	ld	a,(#_rda + 0)
	res	7, a
	ld	(#_rda + 0),a
;engine/../engine/mapmods/map_renderer_complex.h:165: rdct = 1;
	ld	hl,#_rdct + 0
	ld	(hl), #0x01
	jr	00110$
00108$:
;engine/../engine/mapmods/map_renderer_complex.h:167: rdct = *gp_gen ++;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdct + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00196$
	ld	hl, #_gp_gen+1
	inc	(hl)
00196$:
;engine/../engine/mapmods/map_renderer_complex.h:169: while (rdct --) {
00110$:
	ld	a,(#_rdct + 0)
	ld	-1 (ix),a
	ld	hl, #_rdct+0
	dec	(hl)
;engine/../engine/mapmods/map_renderer_complex.h:89: rdt = *gp_gen ++;
	ld	de,(_gp_gen)
	ld	bc,(_gp_gen)
	inc	bc
;engine/../engine/mapmods/map_renderer_complex.h:169: while (rdct --) {
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00113$
;engine/../engine/mapmods/map_renderer_complex.h:170: rdm = *gp_gen ++;
	ld	a,(de)
	ld	(#_rdm + 0),a
	ld	(_gp_gen),bc
;engine/../engine/mapmods/map_renderer_complex.h:171: add_tile ();
	call	_add_tile
	jr	00110$
00117$:
;engine/../engine/mapmods/map_renderer_complex.h:198: _x = 0; _y = TOP_ADJUST; gp_ram = map_buff;
	ld	hl,#__x + 0
	ld	(hl), #0x00
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	de,#_map_buff+0
	ld	(_gp_ram),de
;engine/../engine/mapmods/map_renderer_complex.h:199: for (rdm = 0; rdm < 192; rdm ++) {
	ld	hl,#_rdm + 0
	ld	(hl), #0x00
00127$:
;engine/../engine/mapmods/map_renderer_complex.h:200: rdt = *gp_ram ++;
	ld	hl,(_gp_ram)
	ld	a,(hl)
	ld	(#_rdt + 0),a
	ld	hl, #_gp_ram+0
	inc	(hl)
	jr	NZ,00197$
	ld	hl, #_gp_ram+1
	inc	(hl)
00197$:
;engine/../engine/mapmods/../../engine/mapmods/map_detectors.h:43: if (rdt >= CHAC_CHAC_DETECT_TILE && rdt <= CHAC_CHAC_DETECT_TILE + CHAC_CHAC_DETECT_TILES-1) {
	ld	a,(#_rdt + 0)
	sub	a, #0x18
	jr	C,00119$
	ld	a,#0x1A
	ld	iy,#_rdt
	sub	a, 0 (iy)
	jr	C,00119$
;engine/../engine/mapmods/../../engine/mapmods/map_detectors.h:44: chac_chacs_add ();
	push	de
	call	_chac_chacs_add
	pop	de
;engine/../engine/mapmods/../../engine/mapmods/map_detectors.h:46: rdt = map_buff [rdm] = 0;
	ld	hl,(_rdm)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x00
	ld	hl,#_rdt + 0
	ld	(hl), #0x00
00119$:
;engine/../engine/mapmods/map_renderer_complex.h:213: DISABLE_INTERRUPTS;
	di 
;engine/../engine/mapmods/map_renderer_complex.h:220: _t = rdt; draw_tile ();
	ld	a,(#_rdt + 0)
	ld	(#__t + 0),a
	push	de
	call	_draw_tile
	pop	de
;engine/../engine/mapmods/map_renderer_complex.h:221: _x = (_x + 2) & 0x1f; if (!_x) _y += 2;
	ld	a,(#__x + 0)
	add	a, #0x02
	and	a, #0x1F
	ld	(#__x + 0),a
	or	a, a
	jr	NZ,00122$
	ld	hl, #__y+0
	inc	(hl)
	ld	hl, #__y+0
	inc	(hl)
00122$:
;engine/../engine/mapmods/map_renderer_complex.h:222: ENABLE_INTERRUPTS;
	ei 
;engine/../engine/mapmods/map_renderer_complex.h:199: for (rdm = 0; rdm < 192; rdm ++) {
	ld	hl, #_rdm+0
	inc	(hl)
	ld	a,(#_rdm + 0)
	sub	a, #0xC0
	jr	C,00127$
;engine/../engine/mapmods/map_renderer_complex.h:237: gpit = max_chac_chacs; while (gpit --) {
	ld	a,(#_max_chac_chacs + 0)
	ld	(#_gpit + 0),a
00124$:
	ld	hl,#_gpit + 0
	ld	e, (hl)
	ld	hl, #_gpit+0
	dec	(hl)
	ld	a,e
	or	a, a
	jr	Z,00126$
;engine/../engine/mapmods/map_renderer_complex.h:238: _x = (chac_chacs_yx [gpit] & 0xf) << 1;
	ld	iy,#_chac_chacs_yx
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	l, 0 (iy)
	ld	a,l
	and	a, #0x0F
	add	a, a
	ld	iy,#__x
	ld	0 (iy),a
;engine/../engine/mapmods/map_renderer_complex.h:239: _y = ((chac_chacs_yx [gpit] & 0xf0) >> 3) + TOP_ADJUST;
	ld	a,l
	and	a, #0xF0
	rrca
	rrca
	rrca
	and	a,#0x1F
	ld	hl,#__y
	inc	a
	ld	(hl),a
;engine/../engine/mapmods/map_renderer_complex.h:240: _t = chac_chacs_t1 [0];
	ld	a,(#_chac_chacs_t1 + 0)
	ld	(#__t + 0),a
;engine/../engine/mapmods/map_renderer_complex.h:241: draw_tile ();
	call	_draw_tile
;engine/../engine/mapmods/map_renderer_complex.h:242: _t = chac_chacs_t2 [0];
	ld	a,(#_chac_chacs_t2 + 0)
	ld	(#__t + 0),a
;engine/../engine/mapmods/map_renderer_complex.h:243: _y += 2;
	ld	hl, #__y+0
	inc	(hl)
	ld	hl, #__y+0
	inc	(hl)
;engine/../engine/mapmods/map_renderer_complex.h:244: draw_tile ();
	call	_draw_tile
;engine/../engine/mapmods/map_renderer_complex.h:245: _t = chac_chacs_t3 [0];
	ld	a,(#_chac_chacs_t3 + 0)
	ld	(#__t + 0),a
;engine/../engine/mapmods/map_renderer_complex.h:246: _y += 2;
	ld	hl, #__y+0
	inc	(hl)
	ld	hl, #__y+0
	inc	(hl)
;engine/../engine/mapmods/map_renderer_complex.h:247: draw_tile ();
	call	_draw_tile
	jr	00124$
00126$:
;engine/../engine/mapmods/map_renderer_complex.h:251: ENABLE_INTERRUPTS;
	ei 
	inc	sp
	pop	ix
	ret
;engine/printer.c:116: void pr_str (const unsigned char *s) {
;	---------------------------------
; Function pr_str
; ---------------------------------
_pr_str::
;engine/printer.c:117: SG_setNextTileatXY (_x, _y);
	ld	a,(__y)
	push	af
	inc	sp
	ld	a,(__x)
	push	af
	inc	sp
	call	_SG_setNextTileatXY
	pop	af
;engine/printer.c:118: while (gpit = *s++) {
	pop	bc
	pop	de
	push	de
	push	bc
00104$:
	ld	a,(de)
	inc	de
;engine/printer.c:119: if (gpit == '%') {
	ld	(#_gpit + 0),a
	or	a,a
	ret	Z
	sub	a, #0x25
	jr	NZ,00102$
;engine/printer.c:120: ++ _y; SG_setNextTileatXY (_x, _y);
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
;engine/printer.c:122: else SG_setTile (gpit - 32); 
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
