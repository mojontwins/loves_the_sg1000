;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Thu Nov 01 21:39:35 2018
;--------------------------------------------------------
	.module tile_chac_chac
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _map_set
	.globl _chac_chacs_add
	.globl _chac_chacs_do
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
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
;engine/tile_chac_chac.c:18: void chac_chacs_add (void) {
;	---------------------------------
; Function chac_chacs_add
; ---------------------------------
_chac_chacs_add::
;engine/tile_chac_chac.c:20: if (max_chac_chacs == MAX_CHAC_CHACS) return;
	ld	a,(#_max_chac_chacs + 0)
	sub	a, #0x04
	ret	Z
	jr	00102$
00102$:
;engine/tile_chac_chac.c:21: rda = 1 + (rdt - CHAC_CHAC_DETECT_TILE);
	ld	hl,#_rda
	ld	a,(#_rdt + 0)
	add	a, #0xDA
	ld	(hl),a
;engine/tile_chac_chac.c:22: rdb = rda << 4;
	ld	a,(#_rda + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
;engine/tile_chac_chac.c:23: rdc = (rdb << 1) + rdb;
	ld	(#_rdb + 0),a
	add	a, a
	ld	hl,#_rdb
	ld	iy,#_rdc
	add	a, (hl)
	ld	0 (iy),a
;engine/tile_chac_chac.c:25: chac_chacs_yx [max_chac_chacs] = rdm;
	ld	de,#_chac_chacs_yx+0
	ld	hl,(_max_chac_chacs)
	ld	h,#0x00
	add	hl,de
	ld	a,(#_rdm + 0)
	ld	(hl),a
;engine/tile_chac_chac.c:26: chac_chacs_state [max_chac_chacs] = 0;
	ld	de,#_chac_chacs_state+0
	ld	hl,(_max_chac_chacs)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x00
;engine/tile_chac_chac.c:27: chac_chacs_idlewait [max_chac_chacs] = rdc;
	ld	de,#_chac_chacs_idlewait+0
	ld	hl,(_max_chac_chacs)
	ld	h,#0x00
	add	hl,de
	ld	a,(#_rdc + 0)
	ld	(hl),a
;engine/tile_chac_chac.c:28: chac_chacs_ct [max_chac_chacs] = rdc;
	ld	de,#_chac_chacs_ct+0
	ld	hl,(_max_chac_chacs)
	ld	h,#0x00
	add	hl,de
	ld	a,(#_rdc + 0)
	ld	(hl),a
;engine/tile_chac_chac.c:30: ++ max_chac_chacs;
	ld	hl, #_max_chac_chacs+0
	inc	(hl)
	ret
;engine/tile_chac_chac.c:33: void chac_chacs_do (void) {
;	---------------------------------
; Function chac_chacs_do
; ---------------------------------
_chac_chacs_do::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;engine/tile_chac_chac.c:34: gpit = max_chac_chacs; while (gpit --) {
	ld	a,(#_max_chac_chacs + 0)
	ld	(#_gpit + 0),a
00106$:
	ld	iy,#_gpit
	ld	d,0 (iy)
	ld	iy,#_gpit
	dec	0 (iy)
	ld	a,d
	or	a, a
	jp	Z,00108$
;engine/tile_chac_chac.c:35: if (chac_chacs_ct [gpit]) -- chac_chacs_ct [gpit]; else {
	ld	a,(#_gpit + 0)
	add	a, #<(_chac_chacs_ct)
	ld	-2 (ix),a
	ld	a,#0x00
	adc	a, #>(_chac_chacs_ct)
	ld	-1 (ix),a
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00104$
	add	a,#0xFF
	pop	hl
	push	hl
	ld	(hl),a
	jr	00106$
00104$:
;engine/tile_chac_chac.c:36: ++ chac_chacs_state [gpit];
	ld	a,#<(_chac_chacs_state)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_chac_chacs_state)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	inc	a
	ld	(de),a
;engine/tile_chac_chac.c:37: if (chac_chacs_state [gpit] == 6) chac_chacs_state [gpit] = 0;
	ld	a,#<(_chac_chacs_state)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_chac_chacs_state)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	sub	a, #0x06
	jr	NZ,00102$
	xor	a, a
	ld	(de),a
00102$:
;engine/tile_chac_chac.c:38: chac_chacs_ct [gpit] = chac_chacs_state [gpit] ? 
	ld	a,#<(_chac_chacs_ct)
	ld	hl,#_gpit
	add	a, (hl)
	ld	c,a
	ld	a,#>(_chac_chacs_ct)
	adc	a, #0x00
	ld	b,a
	ld	iy,#_chac_chacs_state
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	e, 0 (iy)
	ld	a,e
	or	a, a
	jr	Z,00115$
;engine/tile_chac_chac.c:39: (chac_chacs_times [chac_chacs_state [gpit]]) :
	ld	hl,#_chac_chacs_times
	ld	d,#0x00
	add	hl, de
	ld	a,(hl)
	jr	00116$
00115$:
;engine/tile_chac_chac.c:40: chac_chacs_idlewait [gpit];
	ld	iy,#_chac_chacs_idlewait
	ld	de,(_gpit)
	ld	d,#0x00
	add	iy, de
	ld	a, 0 (iy)
00116$:
	ld	(bc),a
;engine/tile_chac_chac.c:43: chac_chacs_queue [chac_chacs_queue_write] = gpit;
	ld	a,#<(_chac_chacs_queue)
	ld	hl,#_chac_chacs_queue_write
	add	a, (hl)
	ld	e,a
	ld	a,#>(_chac_chacs_queue)
	adc	a, #0x00
	ld	d,a
	ld	a,(#_gpit + 0)
	ld	(de),a
;engine/tile_chac_chac.c:44: chac_chacs_queue_write = (chac_chacs_queue_write + 1) & (MAX_CHAC_CHACKS_QUEUED-1);
	ld	a,(#_chac_chacs_queue_write + 0)
	inc	a
	and	a, #0x0F
	ld	iy,#_chac_chacs_queue_write
	ld	0 (iy),a
	jp	00106$
00108$:
;engine/tile_chac_chac.c:48: if (chac_chacs_queue_write != chac_chacs_queue_read) {
	ld	a,(#_chac_chacs_queue_write + 0)
	ld	iy,#_chac_chacs_queue_read
	sub	a, 0 (iy)
	jp	Z,00113$
;engine/tile_chac_chac.c:49: gpit = chac_chacs_queue [chac_chacs_queue_read];
	ld	a,#<(_chac_chacs_queue)
	ld	hl,#_chac_chacs_queue_read
	add	a, (hl)
	ld	e,a
	ld	a,#>(_chac_chacs_queue)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	(#_gpit + 0),a
;engine/tile_chac_chac.c:50: chac_chacs_queue_read = (chac_chacs_queue_read + 1) & (MAX_CHAC_CHACKS_QUEUED-1);
	ld	a,(#_chac_chacs_queue_read + 0)
	inc	a
	and	a, #0x0F
	ld	(#_chac_chacs_queue_read + 0),a
;engine/tile_chac_chac.c:51: rdm = chac_chacs_state [gpit];
	ld	a,#<(_chac_chacs_state)
	ld	hl,#_gpit
	add	a, (hl)
	ld	e,a
	ld	a,#>(_chac_chacs_state)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
;engine/tile_chac_chac.c:52: if (rdm == 3) { 
	ld	(#_rdm + 0),a
	sub	a, #0x03
	jr	NZ,00110$
;engine/tile_chac_chac.c:53: shaker_ct = 8; 
	ld	hl,#_shaker_ct + 0
	ld	(hl), #0x08
00110$:
;engine/tile_chac_chac.c:56: rdx = chac_chacs_yx [gpit]; rdy = rdx >> 4; rdx &= 0xf;
	ld	de,#_chac_chacs_yx+0
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(#_rdx + 0),a
	rlca
	rlca
	rlca
	rlca
	and	a,#0x0F
	ld	(#_rdy + 0),a
	ld	a,(#_rdx + 0)
	and	a, #0x0F
;engine/tile_chac_chac.c:57: _x = rdx; _y = rdy    ; _t = chac_chacs_t1 [rdm]; map_set ();
	ld	(#_rdx + 0),a
	ld	(#__x + 0),a
	ld	a,(#_rdy + 0)
	ld	(#__y + 0),a
	ld	de,#_chac_chacs_t1+0
	ld	hl,(_rdm)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(#__t + 0),a
	call	_map_set
;engine/tile_chac_chac.c:58: _x = rdx; _y = rdy + 1; _t = chac_chacs_t2 [rdm]; map_set ();
	ld	a,(#_rdx + 0)
	ld	(#__x + 0),a
	ld	hl,#__y
	ld	a,(#_rdy + 0)
	inc	a
	ld	(hl),a
	ld	de,#_chac_chacs_t2+0
	ld	hl,(_rdm)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(#__t + 0),a
	call	_map_set
;engine/tile_chac_chac.c:59: _x = rdx; _y = rdy + 2; _t = chac_chacs_t3 [rdm]; map_set ();
	ld	a,(#_rdx + 0)
	ld	(#__x + 0),a
	ld	hl,#__y
	ld	a,(#_rdy + 0)
	add	a, #0x02
	ld	(hl),a
	ld	de,#_chac_chacs_t3+0
	ld	hl,(_rdm)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(#__t + 0),a
	call	_map_set
00113$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
