;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Sun Nov 04 13:35:14 2018
;--------------------------------------------------------
	.module aPLib
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _aPLib_depack_VRAM
	.globl _aPLib_R0
	.globl _aPLib_LWM
	.globl _aPLib_bits
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_aPLib_bits::
	.ds 2
_aPLib_LWM::
	.ds 1
_aPLib_R0::
	.ds 2
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
;lib/aPLib.c:25: void aPLib_depack_VRAM (unsigned int dest, void *src) {
;	---------------------------------
; Function aPLib_depack_VRAM
; ---------------------------------
_aPLib_depack_VRAM::
;lib/aPLib.c:269: __endasm;
	pop bc
	pop de
	pop hl
	push hl
	push de
	push bc
	jp vram_depack
	ap_VRAMToDE_write:
	push af
	ld a,e
	di
	out (0xbf),a
	ld a,d
	or #0x40
	_minus1:
	out (0xbf),a
	ei
	pop af
	ret
	ap_VRAMToHL_read:
	push af
	ld a,l
	di
	out (0xbf),a
	ld a,h
	jr _minus1 ; space optimisation
	ap_VRAM_ldi_src_to_dest:
	call ap_VRAMToDE_write
	push bc
	ld c,#0xbe
	outi
	pop bc
	dec bc
	inc de
	ret
	ap_VRAM_ldir_dest_to_dest:
; This may be a major speed bottleneck
; possibly could take some stack space for a buffer? but that would need a lot more code space
; if it uses overlapping source/dest then a buffer will break it
	push af
	_minus2:
	call ap_VRAMToHL_read
	in a,(0xbe)
	call ap_VRAMToDE_write
	out (0xbe),a
	dec bc
	inc de
	inc hl
	ld a,b
	or c
	jr nz,_minus2
	pop af
	ret
	_vram_apbranch2:
;use a gamma code * 256 for offset, another gamma code for length
	call ap_getgamma
	dec bc
	dec bc
	ld a,(_aPLib_LWM)
	or a
	jr nz,_vram_ap_not_LWM
;bc = 2? ; Maxim: I think he means 0
	ld a,b
	or c
	jr nz,_vram_ap_not_zero_gamma
;if gamma code is 2, use old R0 offset, and a new gamma code for length
	call ap_getgamma
	push hl
	ld h,d
	ld l,e
	push bc
	ld bc,(_aPLib_R0)
	sbc hl,bc
	pop bc
	call ap_VRAM_ldir_dest_to_dest
	pop hl
	jr _vram_ap_finishup
	_vram_ap_not_zero_gamma:
	dec bc
	_vram_ap_not_LWM:
;do I even need this code? ; Maxim: seems so, it is broken without it
;bc=bc*256+(hl), lazy 16bit way
	ld b,c
	ld c,(hl)
	inc hl
	ld (_aPLib_R0),bc
	push bc
	call ap_getgamma
	ex (sp),hl
;bc = len, hl=offs
	push de
	ex de,hl
;some comparison junk for some reason
; Maxim: optimised to use add instead of sbc
	ld hl,#-32000
	add hl,de
	jr nc,_plus5
	inc bc
	_plus5:
	ld hl,#-1280
	add hl,de
	jr nc,_plus6
	inc bc
	_plus6:
	ld hl,#-128
	add hl,de
	jr c,_plus7
	inc bc
	inc bc
	_plus7:
;bc = len, de = offs, hl=junk
	pop hl
	push hl
	or a
	sbc hl,de
	pop de
;hl=dest-offs, bc=len, de = dest
	call ap_VRAM_ldir_dest_to_dest
	pop hl
	_vram_ap_finishup:
	ld a,#1
	ld (_aPLib_LWM),a
	jr _vram_aploop
	_vram_apbranch1:
; Maxim: moved this one closer to where it is jumped from to allow jr to work and save 2 bytes
	call ap_VRAM_ldi_src_to_dest
	xor a
	ld (_aPLib_LWM),a
	jr _vram_aploop
	vram_depack:
;hl = source
;de = dest (in VRAM)
;VRAM addresses are assumed to be stable (ie. di/ei around it)
	call ap_VRAM_ldi_src_to_dest ; first byte is always uncompressed
	xor a
	ld (_aPLib_LWM),a
	inc a
	ld (_aPLib_bits),a
	_vram_aploop:
	call ap_getbit
	jr z, _vram_apbranch1
	call ap_getbit
	jr z, _vram_apbranch2
	call ap_getbit
	jr z, _vram_apbranch3
;LWM = 0
	xor a
	ld (_aPLib_LWM),a
;get an offset
	ld bc,#0
	call ap_getbitbc
	call ap_getbitbc
	call ap_getbitbc
	call ap_getbitbc
	ld a,b
	or c
	jr nz,_vram_apbranch4
; xor a ;write a 0 ; Maxim: a is zero already (just failed nz test), optimise this line away
	_WriteAToVRAMAndLoop:
	call ap_VRAMToDE_write
	out (0xbe),a
	inc de
	jr _vram_aploop
	_vram_apbranch4:
	ex de,hl ;write a previous bit (1-15 away from dest)
	push hl
	sbc hl,bc
	call ap_VRAMToHL_read
	in a,(0xbe)
	pop hl
	ex de,hl
	jr _WriteAToVRAMAndLoop
	_vram_apbranch3:
;use 7 bit offset, length = 2 or 3
;if a zero is encountered here, it is EOF
	ld c,(hl)
	inc hl
	rr c
	ret z
	ld b,#2
	jr nc,_plus8
	inc b
	_plus8:
;LWM = 1
	ld a,#1
	ld (_aPLib_LWM),a
	push hl
	ld a,b
	ld b,#0
;R0 = c
	ld (_aPLib_R0),bc
	ld h,d
	ld l,e
	or a
	sbc hl,bc
	ld c,a
	call ap_VRAM_ldir_dest_to_dest
	pop hl
	jr _vram_aploop
	ap_getbit:
	push bc
	ld bc,(_aPLib_bits)
	rrc c
	jr nc,_plus9
	ld b,(hl)
	inc hl
	_plus9:
	ld a,c
	and b
	ld (_aPLib_bits),bc
	pop bc
	ret
	ap_getbitbc:
;doubles BC and adds the read bit
	sla c
	rl b
	call ap_getbit
	ret z
	inc bc
	ret
	ap_getgamma:
	ld bc,#1
	_minus3:
	call ap_getbitbc
	call ap_getbit
	jr nz,_minus3
	ret
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
