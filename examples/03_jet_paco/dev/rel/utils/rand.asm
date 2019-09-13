;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Tue Sep 10 14:21:01 2019
;--------------------------------------------------------
	.module rand
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_rand
	.globl _srand
	.globl _rand8
	.globl _randres
	.globl _seed2
	.globl _seed1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_seed1::
	.ds 2
_seed2::
	.ds 2
_randres::
	.ds 1
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
;./utils/rand.c:14: unsigned char rand8 (void) {
;	---------------------------------
; Function rand8
; ---------------------------------
_rand8::
;./utils/rand.c:39: __endasm;
	  rnd:
	ld hl, (_seed1)
	ld de, (_seed2)
	ld a,h ; t = x ^ (x << 1)
	add a,a
	xor h
	ld h,l ; x = y
	ld l,d ; y = z
	ld d,e ; z = w
	ld e,a
	rra ; t = t ^ (t >> 1)
	xor e
	ld e,a
	ld a,d ; w = w ^ ( w << 3 ) ^ t
	add a,a
	add a,a
	add a,a
	xor d
	xor e
	ld e,a
	ld (_seed1),hl
	ld (_seed2),de
	ld (_randres), a
;./utils/rand.c:40: return randres;
	ld	iy,#_randres
	ld	l,0 (iy)
	ret
;./utils/rand.c:43: void srand (void) {
;	---------------------------------
; Function srand
; ---------------------------------
_srand::
;./utils/rand.c:49: __endasm;
	ld hl, (_seed1)
	ld (rnd+1), hl
	ld hl, (_seed2)
	ld (rnd+4), hl
	ret
;./utils/rand.c:53: void set_rand (unsigned char rdum) {
;	---------------------------------
; Function set_rand
; ---------------------------------
_set_rand::
;./utils/rand.c:54: seed1 = rdum; seed2 = 0xff00 & rdum;
	ld	hl, #2+0
	add	hl, sp
	ld	e, (hl)
	ld	d,#0x00
	ld	(_seed1),de
	ld	hl,#_seed2 + 0
	ld	(hl), #0x00
	ld	hl,#_seed2 + 1
	ld	(hl), d
;./utils/rand.c:55: srand ();
	jp  _srand
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
