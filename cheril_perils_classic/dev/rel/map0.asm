;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Sun Nov 04 13:35:12 2018
;--------------------------------------------------------
	.module map0
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _map_0_locks
	.globl _map_0
	.globl _scr_0_17
	.globl _scr_0_16
	.globl _scr_0_15
	.globl _scr_0_14
	.globl _scr_0_13
	.globl _scr_0_12
	.globl _scr_0_11
	.globl _scr_0_10
	.globl _scr_0_0f
	.globl _scr_0_0e
	.globl _scr_0_0d
	.globl _scr_0_0c
	.globl _scr_0_0b
	.globl _scr_0_0a
	.globl _scr_0_09
	.globl _scr_0_08
	.globl _scr_0_07
	.globl _scr_0_06
	.globl _scr_0_05
	.globl _scr_0_04
	.globl _scr_0_03
	.globl _scr_0_02
	.globl _scr_0_01
	.globl _scr_0_00
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
_scr_0_00:
	.db #0x05	; 5
	.db #0x50	; 80	'P'
	.db #0x84	; 132
	.db #0x05	; 5
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x50	; 80	'P'
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x52	; 82	'R'
	.db #0x15	; 21
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x1D	; 29
	.db #0x1C	; 28
	.db #0x15	; 21
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x42	; 66	'B'
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x7D	; 125
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x70	; 112	'p'
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x0F	; 15
	.db #0x70	; 112	'p'
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1D	; 29
	.db #0xA4	; 164
_scr_0_01:
	.db #0xA4	; 164
	.db #0x40	; 64
	.db #0x32	; 50	'2'
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x32	; 50	'2'
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x10	; 16
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x17	; 23
	.db #0x05	; 5
	.db #0x27	; 39
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x0C	; 12
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x42	; 66	'B'
	.db #0x6D	; 109	'm'
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x47	; 71	'G'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0xA4	; 164
	.db #0x47	; 71	'G'
_scr_0_02:
	.db #0xD0	; 208
	.db #0x12	; 18
	.db #0xB0	; 176
	.db #0x32	; 50	'2'
	.db #0x90	; 144
	.db #0x22	; 34
	.db #0x27	; 39
	.db #0x70	; 112	'p'
	.db #0x72	; 114	'r'
	.db #0x70	; 112	'p'
	.db #0x82	; 130
	.db #0x70	; 112	'p'
	.db #0x27	; 39
	.db #0x52	; 82	'R'
	.db #0x60	; 96
	.db #0x72	; 114	'r'
	.db #0x80	; 128
	.db #0x52	; 82	'R'
	.db #0x27	; 39
	.db #0x80	; 128
	.db #0x37	; 55	'7'
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0xA0	; 160
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0xA7	; 167
	.db #0x30	; 48	'0'
	.db #0x09	; 9
_scr_0_03:
	.db #0x22	; 34
	.db #0x40	; 64
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x59	; 89	'Y'
	.db #0x42	; 66	'B'
	.db #0x10	; 16
	.db #0x19	; 25
	.db #0x58	; 88	'X'
	.db #0x06	; 6
	.db #0x37	; 55	'7'
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x68	; 104	'h'
	.db #0x09	; 9
	.db #0x32	; 50	'2'
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x18	; 24
	.db #0x49	; 73	'I'
	.db #0x06	; 6
	.db #0x42	; 66	'B'
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x68	; 104	'h'
	.db #0x06	; 6
	.db #0x52	; 82	'R'
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x68	; 104	'h'
	.db #0x09	; 9
	.db #0x62	; 98	'b'
	.db #0x19	; 25
	.db #0x58	; 88	'X'
	.db #0x09	; 9
	.db #0x62	; 98	'b'
	.db #0x06	; 6
	.db #0x49	; 73	'I'
	.db #0x18	; 24
	.db #0x09	; 9
	.db #0x57	; 87	'W'
	.db #0x19	; 25
	.db #0x68	; 104	'h'
	.db #0x09	; 9
	.db #0x40	; 64
	.db #0x19	; 25
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x48	; 72	'H'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x30	; 48	'0'
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x48	; 72	'H'
	.db #0x29	; 41
	.db #0x36	; 54	'6'
	.db #0x19	; 25
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x27	; 39
	.db #0x18	; 24
	.db #0x09	; 9
_scr_0_04:
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x94	; 148
	.db #0x05	; 5
	.db #0x17	; 23
	.db #0xC0	; 192
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x2D	; 45
	.db #0x20	; 32
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x15	; 21
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x1D	; 29
	.db #0x60	; 96
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x50	; 80	'P'
	.db #0x22	; 34
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x09	; 9
	.db #0x22	; 34
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x22	; 34
	.db #0x15	; 21
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x19	; 25
	.db #0x12	; 18
	.db #0x15	; 21
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x64	; 100	'd'
_scr_0_05:
	.db #0x94	; 148
	.db #0x05	; 5
	.db #0x47	; 71	'G'
	.db #0x60	; 96
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x42	; 66	'B'
	.db #0x60	; 96
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x4D	; 77	'M'
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x0D	; 13
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x70	; 112	'p'
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x6D	; 109	'm'
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x94	; 148
	.db #0x05	; 5
	.db #0x1D	; 29
	.db #0x00	; 0
	.db #0x1D	; 29
_scr_0_06:
	.db #0xA7	; 167
	.db #0x30	; 48	'0'
	.db #0x09	; 9
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0xB2	; 178
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x47	; 71	'G'
	.db #0x52	; 82	'R'
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0xA2	; 162
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x17	; 23
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x52	; 82	'R'
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x52	; 82	'R'
	.db #0x09	; 9
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x27	; 39
	.db #0x22	; 34
	.db #0x09	; 9
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x47	; 71	'G'
	.db #0x12	; 18
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0xBD	; 189
	.db #0x09	; 9
_scr_0_07:
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x89	; 137
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x18	; 24
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x88	; 136
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x16	; 22
	.db #0x98	; 152
	.db #0x09	; 9
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0x48	; 72	'H'
	.db #0x19	; 25
	.db #0x28	; 40
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x98	; 152
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0x98	; 152
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x19	; 25
	.db #0x08	; 8
	.db #0x8D	; 141
	.db #0x09	; 9
	.db #0x18	; 24
	.db #0x29	; 41
	.db #0xD8	; 216
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0xD8	; 216
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0xA8	; 168
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x88	; 136
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x19	; 25
	.db #0x18	; 24
	.db #0x87	; 135
	.db #0x19	; 25
_scr_0_08:
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x2A	; 42
	.db #0x64	; 100	'd'
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x19	; 25
	.db #0x7A	; 122	'z'
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x3A	; 58
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x1A	; 26
	.db #0x09	; 9
	.db #0x6A	; 106	'j'
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x0A	; 10
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x6A	; 106	'j'
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x94	; 148
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x1A	; 26
	.db #0x74	; 116	't'
_scr_0_09:
	.db #0x94	; 148
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x07	; 7
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x2A	; 42
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x4A	; 74	'J'
	.db #0x05	; 5
	.db #0x3A	; 58
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x4A	; 74	'J'
	.db #0x05	; 5
	.db #0x2A	; 42
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x4A	; 74	'J'
	.db #0x05	; 5
	.db #0x3A	; 58
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x74	; 116	't'
	.db #0x1A	; 26
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x8A	; 138
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x94	; 148
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x07	; 7
_scr_0_0a:
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0xBD	; 189
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0x37	; 55	'7'
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x10	; 16
	.db #0x17	; 23
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x30	; 48	'0'
	.db #0x62	; 98	'b'
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x72	; 114	'r'
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x27	; 39
	.db #0x22	; 34
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0xA2	; 162
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0xB2	; 178
	.db #0x09	; 9
	.db #0x57	; 87	'W'
	.db #0x10	; 16
	.db #0x67	; 103	'g'
	.db #0x09	; 9
_scr_0_0b:
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x06	; 6
	.db #0x49	; 73	'I'
	.db #0x06	; 6
	.db #0x39	; 57	'9'
	.db #0x98	; 152
	.db #0x39	; 57	'9'
	.db #0x06	; 6
	.db #0xC8	; 200
	.db #0x29	; 41
	.db #0x18	; 24
	.db #0x09	; 9
	.db #0xA8	; 168
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x09	; 9
	.db #0x0C	; 12
	.db #0x88	; 136
	.db #0x19	; 25
	.db #0x38	; 56	'8'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0xA8	; 168
	.db #0x09	; 9
	.db #0x0C	; 12
	.db #0x29	; 41
	.db #0x0C	; 12
	.db #0xA8	; 168
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0C	; 12
	.db #0x38	; 56	'8'
	.db #0x59	; 89	'Y'
	.db #0x18	; 24
	.db #0x29	; 41
	.db #0x07	; 7
	.db #0x0C	; 12
	.db #0xA8	; 168
	.db #0x39	; 57	'9'
	.db #0x07	; 7
	.db #0x0C	; 12
	.db #0x98	; 152
	.db #0x19	; 25
	.db #0x06	; 6
	.db #0x19	; 25
	.db #0x77	; 119	'w'
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x09	; 9
_scr_0_0c:
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x1A	; 26
	.db #0x74	; 116	't'
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x1A	; 26
	.db #0x20	; 32
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x0D	; 13
	.db #0x0A	; 10
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x50	; 80	'P'
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x1D	; 29
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0xB0	; 176
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x0E	; 14
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0x52	; 82	'R'
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x2A	; 42
	.db #0x05	; 5
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0x5A	; 90	'Z'
	.db #0x04	; 4
	.db #0x2A	; 42
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x04	; 4
	.db #0x4C	; 76	'L'
	.db #0x14	; 20
	.db #0x1A	; 26
	.db #0x04	; 4
_scr_0_0d:
	.db #0x94	; 148
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x22	; 34
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x1D	; 29
	.db #0x10	; 16
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x5D	; 93
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x60	; 96
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x70	; 112	'p'
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x90	; 144
	.db #0x12	; 18
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x7A	; 122	'z'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x6A	; 106	'j'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0xA4	; 164
	.db #0x47	; 71	'G'
_scr_0_0e:
	.db #0x57	; 87	'W'
	.db #0x10	; 16
	.db #0x67	; 103	'g'
	.db #0x09	; 9
	.db #0xE0	; 224
	.db #0x09	; 9
	.db #0x50	; 80	'P'
	.db #0x77	; 119	'w'
	.db #0x16	; 22
	.db #0x70	; 112	'p'
	.db #0x52	; 82	'R'
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x30	; 48	'0'
	.db #0x52	; 82	'R'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x37	; 55	'7'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0xA2	; 162
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0xA2	; 162
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x20	; 32
	.db #0x67	; 103	'g'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x06	; 6
	.db #0xB7	; 183
	.db #0x22	; 34
	.db #0x09	; 9
_scr_0_0f:
	.db #0xA9	; 169
	.db #0x06	; 6
	.db #0x18	; 24
	.db #0x09	; 9
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0xC8	; 200
	.db #0x16	; 22
	.db #0xB8	; 184
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0xB8	; 184
	.db #0x39	; 57	'9'
	.db #0xB8	; 184
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0xD8	; 216
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0xD8	; 216
	.db #0x19	; 25
	.db #0xD8	; 216
	.db #0x19	; 25
	.db #0xD8	; 216
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0xC8	; 200
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x07	; 7
	.db #0xA8	; 168
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x28	; 40
	.db #0x67	; 103	'g'
	.db #0x16	; 22
	.db #0x09	; 9
_scr_0_10:
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0x1A	; 26
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x8A	; 138
	.db #0x15	; 21
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x7A	; 122	'z'
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x15	; 21
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0x8A	; 138
	.db #0x15	; 21
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0x8A	; 138
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x8A	; 138
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x8A	; 138
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x8A	; 138
	.db #0x15	; 21
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x8A	; 138
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0xA4	; 164
_scr_0_11:
	.db #0xA4	; 164
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0x05	; 5
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x4A	; 74	'J'
	.db #0x4D	; 77	'M'
	.db #0x47	; 71	'G'
	.db #0x05	; 5
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x2D	; 45
	.db #0x5A	; 90	'Z'
	.db #0x01	; 1
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x1A	; 26
	.db #0x4D	; 77	'M'
	.db #0x1A	; 26
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0xA4	; 164
	.db #0x20	; 32
	.db #0x17	; 23
_scr_0_12:
	.db #0xB7	; 183
	.db #0x22	; 34
	.db #0x09	; 9
	.db #0x32	; 50	'2'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x67	; 103	'g'
	.db #0x20	; 32
	.db #0x22	; 34
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x52	; 82	'R'
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x47	; 71	'G'
	.db #0x06	; 6
	.db #0x52	; 82	'R'
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x30	; 48	'0'
	.db #0x57	; 87	'W'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x12	; 18
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x16	; 22
	.db #0x19	; 25
	.db #0x97	; 151
	.db #0x59	; 89	'Y'
_scr_0_13:
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x69	; 105	'i'
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0xB8	; 184
	.db #0x19	; 25
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x18	; 24
	.db #0x09	; 9
	.db #0x98	; 152
	.db #0x19	; 25
	.db #0x38	; 56	'8'
	.db #0x09	; 9
	.db #0x88	; 136
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x48	; 72	'H'
	.db #0x59	; 89	'Y'
	.db #0x28	; 40
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0xA8	; 168
	.db #0x09	; 9
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0xD8	; 216
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0xC8	; 200
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x68	; 104	'h'
	.db #0x39	; 57	'9'
	.db #0x28	; 40
	.db #0x19	; 25
	.db #0x0C	; 12
	.db #0xC8	; 200
	.db #0x19	; 25
	.db #0x07	; 7
	.db #0x1C	; 28
	.db #0x88	; 136
	.db #0x0C	; 12
	.db #0x07	; 7
	.db #0x29	; 41
	.db #0x67	; 103	'g'
	.db #0x18	; 24
	.db #0x27	; 39
	.db #0x19	; 25
_scr_0_14:
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0xA4	; 164
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x9A	; 154
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0xA4	; 164
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x9A	; 154
	.db #0x24	; 36
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x9A	; 154
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x5A	; 90	'Z'
	.db #0xF7	; 247
	.db #0xF8	; 248
	.db #0x38	; 56	'8'
_scr_0_15:
	.db #0xA4	; 164
	.db #0x20	; 32
	.db #0x17	; 23
	.db #0x9A	; 154
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x9A	; 154
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x27	; 39
	.db #0x9A	; 154
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x22	; 34
	.db #0xA4	; 164
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x9A	; 154
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x10	; 16
	.db #0x9A	; 154
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0xD7	; 215
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xD8	; 216
	.db #0x17	; 23
	.db #0xF8	; 248
_scr_0_16:
	.db #0x97	; 151
	.db #0x59	; 89	'Y'
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x58	; 88	'X'
	.db #0x72	; 114	'r'
	.db #0x09	; 9
	.db #0x48	; 72	'H'
	.db #0x19	; 25
	.db #0x27	; 39
	.db #0x42	; 66	'B'
	.db #0x06	; 6
	.db #0x68	; 104	'h'
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x68	; 104	'h'
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x19	; 25
	.db #0x0C	; 12
	.db #0x38	; 56	'8'
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x19	; 25
	.db #0x0C	; 12
	.db #0x19	; 25
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x09	; 9
	.db #0x38	; 56	'8'
	.db #0x09	; 9
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x09	; 9
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x0F	; 15
	.db #0x88	; 136
	.db #0x87	; 135
	.db #0xF8	; 248
	.db #0x67	; 103	'g'
_scr_0_17:
	.db #0x89	; 137
	.db #0x18	; 24
	.db #0x49	; 73	'I'
	.db #0xD8	; 216
	.db #0x49	; 73	'I'
	.db #0x68	; 104	'h'
	.db #0x06	; 6
	.db #0x38	; 56	'8'
	.db #0x09	; 9
	.db #0x28	; 40
	.db #0x09	; 9
	.db #0x58	; 88	'X'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x38	; 56	'8'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x0C	; 12
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x38	; 56	'8'
	.db #0x06	; 6
	.db #0x29	; 41
	.db #0x48	; 72	'H'
	.db #0x06	; 6
	.db #0x58	; 88	'X'
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x09	; 9
	.db #0xA8	; 168
	.db #0x06	; 6
	.db #0x38	; 56	'8'
	.db #0x09	; 9
	.db #0x48	; 72	'H'
	.db #0x0C	; 12
	.db #0x09	; 9
	.db #0x28	; 40
	.db #0x06	; 6
	.db #0x48	; 72	'H'
	.db #0x59	; 89	'Y'
	.db #0x38	; 56	'8'
	.db #0x06	; 6
	.db #0xD8	; 216
	.db #0x19	; 25
	.db #0xB8	; 184
	.db #0x0C	; 12
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0xD7	; 215
	.db #0x19	; 25
_map_0:
	.dw _scr_0_00
	.dw _scr_0_01
	.dw _scr_0_02
	.dw _scr_0_03
	.dw _scr_0_04
	.dw _scr_0_05
	.dw _scr_0_06
	.dw _scr_0_07
	.dw _scr_0_08
	.dw _scr_0_09
	.dw _scr_0_0a
	.dw _scr_0_0b
	.dw _scr_0_0c
	.dw _scr_0_0d
	.dw _scr_0_0e
	.dw _scr_0_0f
	.dw _scr_0_10
	.dw _scr_0_11
	.dw _scr_0_12
	.dw _scr_0_13
	.dw _scr_0_14
	.dw _scr_0_15
	.dw _scr_0_16
	.dw _scr_0_17
_map_0_locks:
	.db #0x00	; 0
	.db #0xA7	; 167
	.db #0x16	; 22
	.db #0x96	; 150
	.area _INITIALIZER
	.area _CABS (ABS)
