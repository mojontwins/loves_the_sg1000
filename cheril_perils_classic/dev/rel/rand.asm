;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Thu Oct 25 10:16:02 2018
;--------------------------------------------------------
	.module rand
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
;utils/rand.c:10: unsigned char rand8 (void) {
;	---------------------------------
; Function rand8
; ---------------------------------
_rand8::
;utils/rand.c:35: __endasm;
	  rnd:
	ld hl, #0xa280
	ld de, #0xc0de
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
	ld (rnd+1),hl
	ld (rnd+4),de
	ld (_randres), a
;utils/rand.c:36: return randres;
	ld	iy,#_randres
	ld	l,0 (iy)
	ret
;utils/rand.c:39: void srand (void) {
;	---------------------------------
; Function srand
; ---------------------------------
_srand::
;utils/rand.c:45: __endasm;
	ld hl, (_seed1)
	ld (rnd+1), hl
	ld hl, (_seed2)
	ld (rnd+4), hl
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
