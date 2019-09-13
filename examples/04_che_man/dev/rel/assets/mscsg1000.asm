;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 14:34:52 2019
;--------------------------------------------------------
	.module mscsg1000
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _readxy
	.globl _read_vbyte
	.globl _read_byte
	.globl _PSGSFXPlay
	.globl _script_pool
	.globl _script_pool_1
	.globl _script_pool_0
	.globl _run_script
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
;./assets/mscsg1000.c:55: unsigned char read_byte (void) {
;	---------------------------------
; Function read_byte
; ---------------------------------
_read_byte::
;./assets/mscsg1000.c:56: return *script ++;
	ld	hl,(_script)
	ld	d,(hl)
	ld	hl, #_script+0
	inc	(hl)
	jr	NZ,00103$
	ld	hl, #_script+1
	inc	(hl)
00103$:
	ld	l,d
	ret
_script_pool_0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5C	; 92
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5C	; 92
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5C	; 92
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5C	; 92
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6E	; 110	'n'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x0A	; 10
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x06	; 6
	.db #0xF0	; 240
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
_script_pool_1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5C	; 92
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6E	; 110	'n'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x06	; 6
	.db #0xF0	; 240
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
_script_pool:
	.dw _script_pool_0
	.dw _script_pool_1
;./assets/mscsg1000.c:59: unsigned char read_vbyte (void) {
;	---------------------------------
; Function read_vbyte
; ---------------------------------
_read_vbyte::
;./assets/mscsg1000.c:60: sc_c = *script ++;
	ld	hl,(_script)
	ld	a,(hl)
	ld	(#_sc_c + 0),a
	ld	hl, #_script+0
	inc	(hl)
	jr	NZ,00109$
	ld	hl, #_script+1
	inc	(hl)
00109$:
;./assets/mscsg1000.c:61: if (sc_c & 128) return flags [sc_c & 127];
	ld	hl,#_sc_c+0
	bit	7, (hl)
	jr	Z,00102$
	ld	hl,#_sc_c + 0
	ld	e, (hl)
	res	7, e
	ld	hl,#_flags
	ld	d,#0x00
	add	hl, de
	ld	l,(hl)
	ret
00102$:
;./assets/mscsg1000.c:62: return sc_c;
	ld	iy,#_sc_c
	ld	l,0 (iy)
	ret
;./assets/mscsg1000.c:65: void readxy (void) {
;	---------------------------------
; Function readxy
; ---------------------------------
_readxy::
;./assets/mscsg1000.c:66: sc_x = read_vbyte ();
	call	_read_vbyte
	ld	iy,#_sc_x
	ld	0 (iy),l
;./assets/mscsg1000.c:67: sc_y = read_vbyte ();
	call	_read_vbyte
	ld	iy,#_sc_y
	ld	0 (iy),l
	ret
;./assets/mscsg1000.c:70: void run_script (unsigned char whichs) {
;	---------------------------------
; Function run_script
; ---------------------------------
_run_script::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;./assets/mscsg1000.c:72: gp_gen = (unsigned char *) script_pool [level] + (whichs << 1);
	ld	iy,#_level
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_script_pool
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,4 (ix)
	ld	h,#0x00
	add	hl, hl
	ld	d,l
	ld	e,h
	ld	a,c
	ld	hl,#_gp_gen
	add	a, d
	ld	(hl),a
	ld	a,b
	adc	a, e
	inc	hl
	ld	(hl),a
;./assets/mscsg1000.c:73: rda = *gp_gen ++; rdb = *gp_gen;
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rda + 0),a
	ld	hl, #_gp_gen+0
	inc	(hl)
	jr	NZ,00209$
	ld	hl, #_gp_gen+1
	inc	(hl)
00209$:
	ld	hl,(_gp_gen)
	ld	a,(hl)
	ld	(#_rdb + 0),a
;./assets/mscsg1000.c:74: script_result = 0;
	ld	hl,#_script_result + 0
	ld	(hl), #0x00
;./assets/mscsg1000.c:75: if (!(rda | rdb)) return;
	ld	a,(#_rda + 0)
	ld	hl,#_rdb + 0
	or	a,(hl)
	jp	Z,00124$
;./assets/mscsg1000.c:76: script = (unsigned char *) script_pool [level] + rda + (rdb << 8);
	ld	a,(#_rda + 0)
	add	a, c
	ld	e,a
	ld	a,#0x00
	adc	a, b
	ld	d,a
	ld	hl,#_rdb + 0
	ld	b, (hl)
	ld	c,#0x00
	ld	a,e
	ld	hl,#_script
	add	a, c
	ld	(hl),a
	ld	a,d
	adc	a, b
	inc	hl
	ld	(hl),a
;./assets/mscsg1000.c:78: while ((sc_c = read_byte ()) != 0xff) {
00121$:
	call	_read_byte
	ld	a,l
	ld	(#_sc_c + 0),a
	inc	a
	jp	Z,00124$
;./assets/mscsg1000.c:79: next_script = script + sc_c;
	ld	hl,#_sc_c
	push	de
	ld	iy,#_next_script
	push	iy
	pop	de
	ld	a,(#_script + 0)
	add	a, (hl)
	ld	(de),a
	ld	a,(#_script + 1)
	adc	a, #0x00
	inc	de
	ld	(de),a
	pop	de
;./assets/mscsg1000.c:80: sc_terminado = sc_continuar = 0;
	ld	hl,#_sc_continuar + 0
	ld	(hl), #0x00
	ld	hl,#_sc_terminado + 0
	ld	(hl), #0x00
;./assets/mscsg1000.c:81: while (!sc_terminado) {
00108$:
	ld	a,(#_sc_terminado + 0)
	or	a, a
	jp	NZ,00110$
;./assets/mscsg1000.c:82: switch (read_byte ()) {
	call	_read_byte
	ld	c,l
	ld	a,c
	cp	a,#0x10
	jr	Z,00103$
	cp	a,#0x20
	jr	Z,00104$
	sub	a, #0xF0
	jr	Z,00108$
	inc	c
	jp	Z,00106$
	jr	00108$
;./assets/mscsg1000.c:83: case 0x10: readxy (); sc_terminado = (flags [sc_x] != sc_y); break;
00103$:
	call	_readxy
	ld	iy,#_flags
	ld	de,(_sc_x)
	ld	d,#0x00
	add	iy, de
	ld	d, 0 (iy)
	ld	a,(#_sc_y + 0)
	sub	a, d
	jr	NZ,00215$
	xor	a,a
	jr	00216$
00215$:
	ld	a,#0x01
00216$:
	ld	(#_sc_terminado + 0),a
	jr	00108$
;./assets/mscsg1000.c:84: case 0x20: readxy (); sc_x <<= 4; sc_y = 16 + (sc_y << 4); sc_terminado = (!(prx + 7 >= sc_x && prx <= sc_x + 15 && pry + 15 >= sc_y && pry <= sc_y + 15)); break;
00104$:
	call	_readxy
	ld	a,(#_sc_x + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	(#_sc_x + 0),a
	ld	a,(#_sc_y + 0)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	hl,#_sc_y
	add	a, #0x10
	ld	(hl),a
	ld	a,(#_prx + 0)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	add	a, #0x07
	ld	d,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	e,a
	ld	iy,#_sc_x
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,d
	sub	a, l
	ld	a,e
	sbc	a, h
	jp	PO, 00217$
	xor	a, #0x80
00217$:
	jp	M,00126$
	ld	bc,#0x000F
	add	hl,bc
	ld	a,l
	sub	a, -2 (ix)
	ld	a,h
	sbc	a, -1 (ix)
	jp	PO, 00218$
	xor	a, #0x80
00218$:
	jp	M,00126$
	ld	hl,#_pry + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	hl,#0x000F
	add	hl,de
	ld	b,l
	ld	c,h
	ld	iy,#_sc_y
	ld	l,0 (iy)
	ld	h,#0x00
	ld	a,b
	sub	a, l
	ld	a,c
	sbc	a, h
	jp	PO, 00219$
	xor	a, #0x80
00219$:
	jp	M,00126$
	ld	bc,#0x000F
	add	hl,bc
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00220$
	xor	a, #0x80
00220$:
	jp	P,00127$
00126$:
	ld	e,#0x00
	jr	00128$
00127$:
	ld	e,#0x01
00128$:
	ld	a,e
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	(#_sc_terminado + 0),a
	jp	00108$
;./assets/mscsg1000.c:86: case 0xff: sc_terminado = sc_continuar = 1; break;
00106$:
	ld	hl,#_sc_continuar + 0
	ld	(hl), #0x01
	ld	hl,#_sc_terminado + 0
	ld	(hl), #0x01
;./assets/mscsg1000.c:87: }
	jp	00108$
00110$:
;./assets/mscsg1000.c:90: if (sc_continuar) {
	ld	a,(#_sc_continuar + 0)
	or	a, a
	jr	Z,00120$
;./assets/mscsg1000.c:91: fire_script_success = 1;
	ld	hl,#_fire_script_success + 0
	ld	(hl), #0x01
;./assets/mscsg1000.c:92: sc_terminado = 0;
	ld	hl,#_sc_terminado + 0
	ld	(hl), #0x00
;./assets/mscsg1000.c:93: while (!sc_terminado) {
00116$:
	ld	a,(#_sc_terminado + 0)
	or	a, a
	jr	NZ,00120$
;./assets/mscsg1000.c:94: switch (read_byte ()) {
	call	_read_byte
	ld	a,l
	dec	a
	jr	Z,00111$
	ld	a,l
	cp	a,#0x40
	jr	Z,00112$
	sub	a, #0xE0
	jr	Z,00113$
	inc	l
	jr	Z,00114$
	jr	00116$
;./assets/mscsg1000.c:95: case 0x01: readxy (); flags [sc_x] = sc_y; break;
00111$:
	call	_readxy
	ld	a,#<(_flags)
	ld	hl,#_sc_x
	add	a, (hl)
	ld	e,a
	ld	a,#>(_flags)
	adc	a, #0x00
	ld	d,a
	ld	a,(#_sc_y + 0)
	ld	(de),a
	jr	00116$
;./assets/mscsg1000.c:96: case 0x40: pobjs += read_vbyte (); break;
00112$:
	call	_read_vbyte
	ld	d,l
	ld	hl,#_pobjs
	ld	a,(hl)
	add	a, d
	ld	(hl),a
	jr	00116$
;./assets/mscsg1000.c:97: case 0xe0: PSGSFXPlay (msc_sfx [read_vbyte ()], read_vbyte ()); break;
00113$:
	call	_read_vbyte
	ld	c,l
	push	bc
	call	_read_vbyte
	pop	bc
	ld	h,#0x00
	add	hl, hl
	ld	de,#_msc_sfx
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	push	af
	inc	sp
	push	de
	call	_PSGSFXPlay
	pop	af
	inc	sp
	jr	00116$
;./assets/mscsg1000.c:98: case 0xff: sc_terminado = 1; break;
00114$:
	ld	hl,#_sc_terminado + 0
	ld	(hl), #0x01
;./assets/mscsg1000.c:99: }
	jr	00116$
00120$:
;./assets/mscsg1000.c:102: script = next_script;
	ld	hl,(_next_script)
	ld	(_script),hl
	jp	00121$
00124$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
