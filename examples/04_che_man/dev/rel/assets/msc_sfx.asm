;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 14:34:48 2019
;--------------------------------------------------------
	.module msc_sfx
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _msc_sfx
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
	.area _CODE
_msc_sfx:
	.dw _s_00_start2_psg
	.dw _s_01_tile3_psg
	.dw _s_02_object2_psg
	.dw _s_03_use2_psg
	.dw _s_04_trampoline2_psg
	.dw _s_05_phit3_psg
	.dw _s_06_dummy13_psg
	.dw _s_07_dummy22_psg
	.dw _s_08_jump2_psg
	.dw _s_09_bullet2_psg
	.dw _s_10_coco2_psg
	.dw _s_11_spring2_psg
	.dw _s_12_count2_psg
	.dw _s_13_breakh3_psg
	.dw _s_14_hitter3_psg
	.dw _s_15_stepon3_psg
	.dw _s_16_float3_psg
	.dw _s_17_breakb3_psg
	.dw _s_18_ring2_psg
	.dw _s_19_fanfare2_psg
	.area _INITIALIZER
	.area _CABS (ABS)
