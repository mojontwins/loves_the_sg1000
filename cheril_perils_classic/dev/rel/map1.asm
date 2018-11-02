;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Fri Nov 02 19:01:33 2018
;--------------------------------------------------------
	.module map1
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _map_1_locks
	.globl _map_1
	.globl _scr_1_17
	.globl _scr_1_16
	.globl _scr_1_15
	.globl _scr_1_14
	.globl _scr_1_13
	.globl _scr_1_12
	.globl _scr_1_11
	.globl _scr_1_10
	.globl _scr_1_0f
	.globl _scr_1_0e
	.globl _scr_1_0d
	.globl _scr_1_0c
	.globl _scr_1_0b
	.globl _scr_1_0a
	.globl _scr_1_09
	.globl _scr_1_08
	.globl _scr_1_07
	.globl _scr_1_06
	.globl _scr_1_05
	.globl _scr_1_04
	.globl _scr_1_03
	.globl _scr_1_02
	.globl _scr_1_01
	.globl _scr_1_00
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
_scr_1_00:
	.db #0xF4	; 244
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0xB0	; 176
	.db #0x02	; 2
	.db #0x0E	; 14
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0xD0	; 208
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0xD0	; 208
	.db #0x14	; 20
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0xC0	; 192
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x27	; 39
	.db #0x90	; 144
	.db #0x04	; 4
	.db #0x00	; 0
_scr_1_01:
	.db #0xF4	; 244
	.db #0x14	; 20
	.db #0x0B	; 11
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x1D	; 29
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x0E	; 14
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x25	; 37
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x74	; 116	't'
	.db #0x10	; 16
	.db #0x64	; 100	'd'
	.db #0x5B	; 91
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x4B	; 75	'K'
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0A	; 10
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x34	; 52	'4'
	.db #0x40	; 64
	.db #0x9F	; 159
	.db #0x77	; 119	'w'
	.db #0x00	; 0
_scr_1_02:
	.db #0xF4	; 244
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x94	; 148
	.db #0x00	; 0
	.db #0x1B	; 27
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x7B	; 123
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x0A	; 10
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x70	; 112	'p'
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x34	; 52	'4'
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x9F	; 159
	.db #0x36	; 54	'6'
	.db #0x00	; 0
_scr_1_03:
	.db #0xF4	; 244
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xC0	; 192
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x15	; 21
	.db #0x70	; 112	'p'
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x25	; 37
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x1D	; 29
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x5E	; 94
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0A	; 10
	.db #0x0E	; 14
	.db #0xA0	; 160
	.db #0x07	; 7
	.db #0x34	; 52	'4'
	.db #0x37	; 55	'7'
	.db #0x59	; 89	'Y'
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x1F	; 31
	.db #0x02	; 2
	.db #0x88	; 136
	.db #0x8A	; 138
	.db #0x00	; 0
_scr_1_04:
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0xC0	; 192
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x44	; 68	'D'
	.db #0x27	; 39
	.db #0x40	; 64
	.db #0x27	; 39
	.db #0x14	; 20
	.db #0x03	; 3
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x44	; 68	'D'
	.db #0xA0	; 160
	.db #0x24	; 36
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x47	; 71	'G'
	.db #0x44	; 68	'D'
	.db #0xA0	; 160
	.db #0x14	; 20
	.db #0x03	; 3
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x5D	; 93
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x20	; 32
	.db #0x0D	; 13
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x0E	; 14
	.db #0x30	; 48	'0'
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x00	; 0
_scr_1_05:
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x34	; 52	'4'
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x90	; 144
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x5A	; 90	'Z'
	.db #0x34	; 52	'4'
	.db #0x40	; 64
	.db #0xA4	; 164
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x70	; 112	'p'
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x37	; 55	'7'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
_scr_1_06:
	.db #0x10	; 16
	.db #0x34	; 52	'4'
	.db #0x70	; 112	'p'
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x04	; 4
	.db #0xB0	; 176
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x8A	; 138
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0xD4	; 212
	.db #0x07	; 7
	.db #0xD0	; 208
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0xF0	; 240
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0xED	; 237
	.db #0x1F	; 31
	.db #0x03	; 3
	.db #0xB3	; 179
	.db #0xB7	; 183
	.db #0xBB	; 187
	.db #0x00	; 0
_scr_1_07:
	.db #0xC4	; 196
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xA0	; 160
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0xC0	; 192
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0xC0	; 192
	.db #0x24	; 36
	.db #0x90	; 144
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x1D	; 29
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x6A	; 106	'j'
	.db #0x24	; 36
	.db #0x1D	; 29
	.db #0xA4	; 164
	.db #0x3D	; 61
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x90	; 144
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xA0	; 160
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x8D	; 141
	.db #0x64	; 100	'd'
	.db #0x1F	; 31
	.db #0x03	; 3
	.db #0xB3	; 179
	.db #0xB5	; 181
	.db #0xB7	; 183
	.db #0x00	; 0
_scr_1_08:
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x10	; 16
	.db #0x0D	; 13
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x0B	; 11
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x0B	; 11
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x30	; 48	'0'
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x94	; 148
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0xB0	; 176
	.db #0x06	; 6
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0xB0	; 176
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x70	; 112	'p'
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
_scr_1_09:
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x54	; 84	'T'
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x60	; 96
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x70	; 112	'p'
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x70	; 112	'p'
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x00	; 0
_scr_1_0a:
	.db #0xF4	; 244
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0xF0	; 240
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x5D	; 93
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x1D	; 29
	.db #0x1E	; 30
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x20	; 32
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x50	; 80	'P'
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x0E	; 14
	.db #0xA0	; 160
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x0D	; 13
	.db #0x1E	; 30
	.db #0x6D	; 109	'm'
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x0D	; 13
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x1D	; 29
	.db #0x0E	; 14
	.db #0x2D	; 45
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x14	; 20
	.db #0x1E	; 30
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0xD4	; 212
	.db #0x0E	; 14
	.db #0x14	; 20
	.db #0x1F	; 31
	.db #0x02	; 2
	.db #0x88	; 136
	.db #0x8B	; 139
	.db #0x00	; 0
_scr_1_0b:
	.db #0xF4	; 244
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x2E	; 46
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x2D	; 45
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x0E	; 14
	.db #0x70	; 112	'p'
	.db #0x04	; 4
	.db #0xA0	; 160
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x3D	; 61
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x1D	; 29
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
_scr_1_0c:
	.db #0x04	; 4
	.db #0xD0	; 208
	.db #0x14	; 20
	.db #0x0E	; 14
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0xB0	; 176
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x70	; 112	'p'
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0xB0	; 176
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x7A	; 122	'z'
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x76	; 118	'v'
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x0D	; 13
	.db #0x15	; 21
	.db #0x90	; 144
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x2D	; 45
	.db #0x0E	; 14
	.db #0x1D	; 29
	.db #0x0E	; 14
	.db #0x24	; 36
	.db #0x00	; 0
_scr_1_0d:
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x60	; 96
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x60	; 96
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x2E	; 46
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0xB0	; 176
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x0D	; 13
	.db #0xA4	; 164
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x0D	; 13
	.db #0x60	; 96
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0D	; 13
	.db #0x1A	; 26
	.db #0x0D	; 13
	.db #0xB0	; 176
	.db #0x0E	; 14
	.db #0x1D	; 29
	.db #0x2E	; 46
	.db #0x3D	; 61
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x2E	; 46
	.db #0x9F	; 159
	.db #0xB7	; 183
	.db #0x00	; 0
_scr_1_0e:
	.db #0xF4	; 244
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0xF0	; 240
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x30	; 48	'0'
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x2E	; 46
	.db #0x0D	; 13
	.db #0x2E	; 46
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x40	; 64
	.db #0x0E	; 14
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x2E	; 46
	.db #0x10	; 16
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x2E	; 46
	.db #0x0D	; 13
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x60	; 96
	.db #0x0E	; 14
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x0E	; 14
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x0E	; 14
	.db #0x2D	; 45
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x2D	; 45
	.db #0x2E	; 46
	.db #0x0D	; 13
	.db #0x1E	; 30
	.db #0x1F	; 31
	.db #0x02	; 2
	.db #0x52	; 82	'R'
	.db #0x5B	; 91
	.db #0x00	; 0
_scr_1_0f:
	.db #0x44	; 68	'D'
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x70	; 112	'p'
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0xA4	; 164
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0xB0	; 176
	.db #0x2A	; 42
	.db #0x04	; 4
	.db #0x1D	; 29
	.db #0x1E	; 30
	.db #0x6D	; 109	'm'
	.db #0x0E	; 14
	.db #0x34	; 52	'4'
	.db #0x00	; 0
_scr_1_10:
	.db #0x1D	; 29
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x1E	; 30
	.db #0x34	; 52	'4'
	.db #0x0E	; 14
	.db #0x0B	; 11
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x24	; 36
	.db #0x0B	; 11
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x0E	; 14
	.db #0x54	; 84	'T'
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x64	; 100	'd'
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0B	; 11
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x60	; 96
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x34	; 52	'4'
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x14	; 20
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x20	; 32
	.db #0x25	; 37
	.db #0x14	; 20
	.db #0x25	; 37
	.db #0x10	; 16
	.db #0xF4	; 244
	.db #0x9F	; 159
	.db #0x4D	; 77	'M'
	.db #0x00	; 0
_scr_1_11:
	.db #0x04	; 4
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0xC4	; 196
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xF0	; 240
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xF0	; 240
	.db #0x60	; 96
	.db #0x0E	; 14
	.db #0x5A	; 90	'Z'
	.db #0x1E	; 30
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0xF4	; 244
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x46	; 70	'F'
	.db #0x0B	; 11
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x46	; 70	'F'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x46	; 70	'F'
	.db #0xF4	; 244
	.db #0x9F	; 159
	.db #0x53	; 83	'S'
	.db #0x00	; 0
_scr_1_12:
	.db #0xF4	; 244
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0xF0	; 240
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x0C	; 12
	.db #0xB0	; 176
	.db #0x36	; 54	'6'
	.db #0x38	; 56	'8'
	.db #0x49	; 73	'I'
	.db #0x0A	; 10
	.db #0x16	; 22
	.db #0xF4	; 244
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x36	; 54	'6'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0x70	; 112	'p'
	.db #0x46	; 70	'F'
	.db #0x10	; 16
	.db #0xF4	; 244
	.db #0x9F	; 159
	.db #0x42	; 66	'B'
	.db #0x00	; 0
_scr_1_13:
	.db #0xF4	; 244
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0x16	; 22
	.db #0xC0	; 192
	.db #0x14	; 20
	.db #0x0E	; 14
	.db #0x2D	; 45
	.db #0x17	; 23
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x1D	; 29
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x36	; 54	'6'
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x0E	; 14
	.db #0x02	; 2
	.db #0x1D	; 29
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x36	; 54	'6'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x30	; 48	'0'
	.db #0x36	; 54	'6'
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0x94	; 148
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x27	; 39
	.db #0x04	; 4
	.db #0x9F	; 159
	.db #0x6C	; 108	'l'
	.db #0x00	; 0
_scr_1_14:
	.db #0xF4	; 244
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x4E	; 78	'N'
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0xE0	; 224
	.db #0x06	; 6
	.db #0x60	; 96
	.db #0x16	; 22
	.db #0x50	; 80	'P'
	.db #0xF6	; 246
	.db #0xF4	; 244
	.db #0x1F	; 31
	.db #0x02	; 2
	.db #0x97	; 151
	.db #0x99	; 153
	.db #0x00	; 0
_scr_1_15:
	.db #0xF4	; 244
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xF0	; 240
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0xB7	; 183
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0xF0	; 240
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0xF0	; 240
	.db #0x40	; 64
	.db #0x0D	; 13
	.db #0x1E	; 30
	.db #0x1D	; 29
	.db #0x1A	; 26
	.db #0x2D	; 45
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x0E	; 14
	.db #0x06	; 6
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x16	; 22
	.db #0x0E	; 14
	.db #0x1D	; 29
	.db #0x06	; 6
	.db #0x0E	; 14
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x0E	; 14
	.db #0x34	; 52	'4'
	.db #0x1E	; 30
	.db #0x34	; 52	'4'
	.db #0x1F	; 31
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x9B	; 155
	.db #0x00	; 0
_scr_1_16:
	.db #0xF4	; 244
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xF0	; 240
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0xF0	; 240
	.db #0x30	; 48	'0'
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x6E	; 110	'n'
	.db #0x3D	; 61
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0E	; 14
	.db #0x01	; 1
	.db #0x0E	; 14
	.db #0x02	; 2
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x34	; 52	'4'
	.db #0xB0	; 176
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x0C	; 12
	.db #0x70	; 112	'p'
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x16	; 22
	.db #0x28	; 40
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0xF4	; 244
	.db #0x1F	; 31
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0x5A	; 90	'Z'
	.db #0x5D	; 93
	.db #0x00	; 0
_scr_1_17:
	.db #0x94	; 148
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0x58	; 88	'X'
	.db #0x0A	; 10
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x0D	; 13
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x1E	; 30
	.db #0x0D	; 13
	.db #0x0E	; 14
	.db #0x0D	; 13
	.db #0x2E	; 46
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x0D	; 13
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x02	; 2
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0xD0	; 208
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x6A	; 106	'j'
	.db #0x06	; 6
	.db #0x30	; 48	'0'
	.db #0xF4	; 244
	.db #0x04	; 4
	.db #0x00	; 0
_map_1:
	.dw _scr_1_00
	.dw _scr_1_01
	.dw _scr_1_02
	.dw _scr_1_03
	.dw _scr_1_04
	.dw _scr_1_05
	.dw _scr_1_06
	.dw _scr_1_07
	.dw _scr_1_08
	.dw _scr_1_09
	.dw _scr_1_0a
	.dw _scr_1_0b
	.dw _scr_1_0c
	.dw _scr_1_0d
	.dw _scr_1_0e
	.dw _scr_1_0f
	.dw _scr_1_10
	.dw _scr_1_11
	.dw _scr_1_12
	.dw _scr_1_13
	.dw _scr_1_14
	.dw _scr_1_15
	.dw _scr_1_16
	.dw _scr_1_17
_map_1_locks:
	.db #0x10	; 16
	.db #0x59	; 89	'Y'
	.area _INITIALIZER
	.area _CABS (ABS)
