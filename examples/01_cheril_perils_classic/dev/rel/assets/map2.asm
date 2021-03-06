;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 15:07:01 2019
;--------------------------------------------------------
	.module map2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _map_2_locks
	.globl _map_2
	.globl _scr_2_17
	.globl _scr_2_16
	.globl _scr_2_15
	.globl _scr_2_14
	.globl _scr_2_13
	.globl _scr_2_12
	.globl _scr_2_11
	.globl _scr_2_10
	.globl _scr_2_0f
	.globl _scr_2_0e
	.globl _scr_2_0d
	.globl _scr_2_0c
	.globl _scr_2_0b
	.globl _scr_2_0a
	.globl _scr_2_09
	.globl _scr_2_08
	.globl _scr_2_07
	.globl _scr_2_06
	.globl _scr_2_05
	.globl _scr_2_04
	.globl _scr_2_03
	.globl _scr_2_02
	.globl _scr_2_01
	.globl _scr_2_00
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
_scr_2_00:
	.db #0xF6	; 246
	.db #0xA6	; 166
	.db #0x19	; 25
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x19	; 25
	.db #0x28	; 40
	.db #0x06	; 6
	.db #0x29	; 41
	.db #0x38	; 56	'8'
	.db #0x19	; 25
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x48	; 72	'H'
	.db #0x19	; 25
	.db #0x48	; 72	'H'
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x78	; 120	'x'
	.db #0x09	; 9
	.db #0x28	; 40
	.db #0x39	; 57	'9'
	.db #0xD8	; 216
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x0A	; 10
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x28	; 40
	.db #0x06	; 6
	.db #0xE8	; 232
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0xD8	; 216
	.db #0x26	; 38
	.db #0x68	; 104	'h'
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x4C	; 76	'L'
	.db #0x06	; 6
	.db #0x19	; 25
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x18	; 24
	.db #0x06	; 6
	.db #0x67	; 103	'g'
	.db #0x39	; 57	'9'
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x00	; 0
_scr_2_01:
	.db #0x16	; 22
	.db #0x29	; 41
	.db #0x02	; 2
	.db #0x90	; 144
	.db #0x08	; 8
	.db #0x29	; 41
	.db #0x08	; 8
	.db #0x12	; 18
	.db #0x80	; 128
	.db #0x18	; 24
	.db #0x09	; 9
	.db #0x28	; 40
	.db #0x02	; 2
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x50	; 80	'P'
	.db #0x58	; 88	'X'
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x18	; 24
	.db #0x22	; 34
	.db #0x50	; 80	'P'
	.db #0x68	; 104	'h'
	.db #0x32	; 50	'2'
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x32	; 50	'2'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x42	; 66	'B'
	.db #0x20	; 32
	.db #0x88	; 136
	.db #0x42	; 66	'B'
	.db #0x10	; 16
	.db #0x88	; 136
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x1C	; 28
	.db #0x32	; 50	'2'
	.db #0xF7	; 247
	.db #0x00	; 0
_scr_2_02:
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x16	; 22
	.db #0xD0	; 208
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x70	; 112	'p'
	.db #0x0B	; 11
	.db #0x40	; 64
	.db #0x09	; 9
	.db #0x90	; 144
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x50	; 80	'P'
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0xF0	; 240
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x60	; 96
	.db #0x32	; 50	'2'
	.db #0xB0	; 176
	.db #0x32	; 50	'2'
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0x30	; 48	'0'
	.db #0x0B	; 11
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x50	; 80	'P'
	.db #0x1C	; 28
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0xF7	; 247
	.db #0x27	; 39
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x89	; 137
	.db #0x28	; 40
	.db #0x02	; 2
	.db #0x87	; 135
	.db #0x8D	; 141
	.db #0x00	; 0
_scr_2_03:
	.db #0xB0	; 176
	.db #0x32	; 50	'2'
	.db #0xB0	; 176
	.db #0x32	; 50	'2'
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x90	; 144
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x70	; 112	'p'
	.db #0x12	; 18
	.db #0xE0	; 224
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0x02	; 2
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x1B	; 27
	.db #0x20	; 32
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x1B	; 27
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x42	; 66	'B'
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x62	; 98	'b'
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x62	; 98	'b'
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0xF7	; 247
	.db #0x27	; 39
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x8D	; 141
	.db #0x28	; 40
	.db #0x02	; 2
	.db #0x83	; 131
	.db #0x8C	; 140
	.db #0x00	; 0
_scr_2_04:
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0x12	; 18
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0x60	; 96
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x42	; 66	'B'
	.db #0xA0	; 160
	.db #0x42	; 66	'B'
	.db #0xB0	; 176
	.db #0x22	; 34
	.db #0x50	; 80	'P'
	.db #0x0B	; 11
	.db #0xD0	; 208
	.db #0x0B	; 11
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0x30	; 48	'0'
	.db #0x1B	; 27
	.db #0x30	; 48	'0'
	.db #0x0B	; 11
	.db #0xF0	; 240
	.db #0x50	; 80	'P'
	.db #0x12	; 18
	.db #0xC0	; 192
	.db #0x32	; 50	'2'
	.db #0x80	; 128
	.db #0xF7	; 247
	.db #0x27	; 39
	.db #0x03	; 3
	.db #0x82	; 130
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0xA9	; 169
	.db #0x8D	; 141
	.db #0x00	; 0
_scr_2_05:
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x0B	; 11
	.db #0x22	; 34
	.db #0x0B	; 11
	.db #0xB0	; 176
	.db #0x32	; 50	'2'
	.db #0x60	; 96
	.db #0x0B	; 11
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0x60	; 96
	.db #0x1B	; 27
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x0C	; 12
	.db #0x02	; 2
	.db #0x50	; 80	'P'
	.db #0x0B	; 11
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0xC4	; 196
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x2D	; 45
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x40	; 64
	.db #0x12	; 18
	.db #0x60	; 96
	.db #0x12	; 18
	.db #0x40	; 64
	.db #0x1C	; 28
	.db #0x60	; 96
	.db #0x1C	; 28
	.db #0x40	; 64
	.db #0x11	; 17
	.db #0x60	; 96
	.db #0x11	; 17
	.db #0x30	; 48	'0'
	.db #0x0E	; 14
	.db #0x11	; 17
	.db #0x0E	; 14
	.db #0x40	; 64
	.db #0x0E	; 14
	.db #0x11	; 17
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0xF7	; 247
	.db #0xA7	; 167
	.db #0x26	; 38
	.db #0xA8	; 168
	.db #0x2A	; 42
	.db #0x00	; 0
_scr_2_06:
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0xE0	; 224
	.db #0x01	; 1
	.db #0xE0	; 224
	.db #0x01	; 1
	.db #0x0C	; 12
	.db #0x50	; 80	'P'
	.db #0x1C	; 28
	.db #0x30	; 48	'0'
	.db #0xF4	; 244
	.db #0x20	; 32
	.db #0x15	; 21
	.db #0x62	; 98	'b'
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x1B	; 27
	.db #0x62	; 98	'b'
	.db #0x1B	; 27
	.db #0x70	; 112	'p'
	.db #0x42	; 66	'B'
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x40	; 64
	.db #0xF7	; 247
	.db #0x27	; 39
	.db #0x04	; 4
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x8C	; 140
	.db #0x8D	; 141
	.db #0x00	; 0
_scr_2_07:
	.db #0x30	; 48	'0'
	.db #0x62	; 98	'b'
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x62	; 98	'b'
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x22	; 34
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x01	; 1
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x01	; 1
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE4	; 228
	.db #0x0B	; 11
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x1C	; 28
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0xC7	; 199
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
_scr_2_08:
	.db #0x26	; 38
	.db #0x0B	; 11
	.db #0x74	; 116	't'
	.db #0x0B	; 11
	.db #0x24	; 36
	.db #0x16	; 22
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x42	; 66	'B'
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x06	; 6
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x40	; 64
	.db #0x0B	; 11
	.db #0x22	; 34
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x70	; 112	'p'
	.db #0x12	; 18
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x90	; 144
	.db #0x0B	; 11
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x0B	; 11
	.db #0x34	; 52	'4'
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x0B	; 11
	.db #0x34	; 52	'4'
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x62	; 98	'b'
	.db #0x0A	; 10
	.db #0x05	; 5
	.db #0x38	; 56	'8'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x38	; 56	'8'
	.db #0x06	; 6
	.db #0x22	; 34
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x0B	; 11
	.db #0x38	; 56	'8'
	.db #0x19	; 25
	.db #0x47	; 71	'G'
	.db #0x26	; 38
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x37	; 55	'7'
	.db #0x16	; 22
	.db #0x19	; 25
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x39	; 57	'9'
	.db #0x27	; 39
	.db #0xA9	; 169
	.db #0x3C	; 60
	.db #0xA7	; 167
	.db #0x74	; 116	't'
	.db #0xA8	; 168
	.db #0x77	; 119	'w'
	.db #0x00	; 0
_scr_2_09:
	.db #0xF4	; 244
	.db #0x22	; 34
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x50	; 80	'P'
	.db #0x22	; 34
	.db #0x50	; 80	'P'
	.db #0x02	; 2
	.db #0x50	; 80	'P'
	.db #0x22	; 34
	.db #0x70	; 112	'p'
	.db #0x0B	; 11
	.db #0x40	; 64
	.db #0x12	; 18
	.db #0x70	; 112	'p'
	.db #0x1B	; 27
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x60	; 96
	.db #0x54	; 84	'T'
	.db #0x0B	; 11
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x40	; 64
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x1B	; 27
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x2B	; 43
	.db #0x20	; 32
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x3B	; 59
	.db #0x10	; 16
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x4B	; 75	'K'
	.db #0x00	; 0
	.db #0xF7	; 247
	.db #0x28	; 40
	.db #0x02	; 2
	.db #0x12	; 18
	.db #0x23	; 35
	.db #0x00	; 0
_scr_2_0a:
	.db #0xF4	; 244
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x40	; 64
	.db #0x32	; 50	'2'
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x0B	; 11
	.db #0x5A	; 90	'Z'
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0x1A	; 26
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x2A	; 42
	.db #0x0B	; 11
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x0B	; 11
	.db #0x90	; 144
	.db #0x0B	; 11
	.db #0xF0	; 240
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x60	; 96
	.db #0x32	; 50	'2'
	.db #0x30	; 48	'0'
	.db #0x42	; 66	'B'
	.db #0x10	; 16
	.db #0x52	; 82	'R'
	.db #0x20	; 32
	.db #0xF7	; 247
	.db #0xA8	; 168
	.db #0x82	; 130
	.db #0xA7	; 167
	.db #0x8D	; 141
	.db #0x00	; 0
_scr_2_0b:
	.db #0xF4	; 244
	.db #0x52	; 82	'R'
	.db #0x30	; 48	'0'
	.db #0xA2	; 162
	.db #0x60	; 96
	.db #0x52	; 82	'R'
	.db #0x0B	; 11
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x05	; 5
	.db #0x0B	; 11
	.db #0xA0	; 160
	.db #0x03	; 3
	.db #0x1A	; 26
	.db #0x05	; 5
	.db #0xB0	; 176
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x0B	; 11
	.db #0xB0	; 176
	.db #0x03	; 3
	.db #0xE0	; 224
	.db #0x03	; 3
	.db #0xE0	; 224
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0xF7	; 247
	.db #0xA7	; 167
	.db #0x82	; 130
	.db #0x00	; 0
_scr_2_0c:
	.db #0xF4	; 244
	.db #0xF2	; 242
	.db #0x62	; 98	'b'
	.db #0x80	; 128
	.db #0x32	; 50	'2'
	.db #0xB0	; 176
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x90	; 144
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0xD0	; 208
	.db #0x03	; 3
	.db #0xB0	; 176
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x92	; 146
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x52	; 82	'R'
	.db #0x1C	; 28
	.db #0x12	; 18
	.db #0xF7	; 247
	.db #0x00	; 0
_scr_2_0d:
	.db #0xF4	; 244
	.db #0xA0	; 160
	.db #0x23	; 35
	.db #0xC0	; 192
	.db #0x23	; 35
	.db #0xB0	; 176
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x23	; 35
	.db #0x0B	; 11
	.db #0x2A	; 42
	.db #0x0B	; 11
	.db #0x70	; 112	'p'
	.db #0x23	; 35
	.db #0x10	; 16
	.db #0x52	; 82	'R'
	.db #0x40	; 64
	.db #0x23	; 35
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x23	; 35
	.db #0x10	; 16
	.db #0x62	; 98	'b'
	.db #0x30	; 48	'0'
	.db #0x23	; 35
	.db #0x10	; 16
	.db #0x82	; 130
	.db #0x10	; 16
	.db #0x23	; 35
	.db #0x10	; 16
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x10	; 16
	.db #0xF7	; 247
	.db #0x00	; 0
_scr_2_0e:
	.db #0xF4	; 244
	.db #0x40	; 64
	.db #0x15	; 21
	.db #0x32	; 50	'2'
	.db #0x90	; 144
	.db #0x1B	; 27
	.db #0x22	; 34
	.db #0xC0	; 192
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x0E	; 14
	.db #0x0A	; 10
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x50	; 80	'P'
	.db #0x17	; 23
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x50	; 80	'P'
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0x26	; 38
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x2C	; 44
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x49	; 73	'I'
	.db #0x77	; 119	'w'
	.db #0x29	; 41
	.db #0x02	; 2
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
_scr_2_0f:
	.db #0xB4	; 180
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x62	; 98	'b'
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0A	; 10
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x30	; 48	'0'
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xB0	; 176
	.db #0x0F	; 15
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x8A	; 138
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x1A	; 26
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x22	; 34
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x50	; 80	'P'
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x32	; 50	'2'
	.db #0x20	; 32
	.db #0x0F	; 15
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xB7	; 183
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x28	; 40
	.db #0x02	; 2
	.db #0x19	; 25
	.db #0x89	; 137
	.db #0x00	; 0
_scr_2_10:
	.db #0x89	; 137
	.db #0x26	; 38
	.db #0x29	; 41
	.db #0x26	; 38
	.db #0x59	; 89	'Y'
	.db #0x16	; 22
	.db #0x58	; 88	'X'
	.db #0x26	; 38
	.db #0x29	; 41
	.db #0x16	; 22
	.db #0x78	; 120	'x'
	.db #0x16	; 22
	.db #0x49	; 73	'I'
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x68	; 104	'h'
	.db #0x09	; 9
	.db #0x16	; 22
	.db #0x19	; 25
	.db #0x36	; 54	'6'
	.db #0x68	; 104	'h'
	.db #0x49	; 73	'I'
	.db #0x06	; 6
	.db #0x19	; 25
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0x18	; 24
	.db #0x79	; 121	'y'
	.db #0x16	; 22
	.db #0x18	; 24
	.db #0x09	; 9
	.db #0x28	; 40
	.db #0x69	; 105	'i'
	.db #0x26	; 38
	.db #0x58	; 88	'X'
	.db #0x09	; 9
	.db #0x36	; 54	'6'
	.db #0x29	; 41
	.db #0x16	; 22
	.db #0x07	; 7
	.db #0x48	; 72	'H'
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x59	; 89	'Y'
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x38	; 56	'8'
	.db #0x09	; 9
	.db #0x36	; 54	'6'
	.db #0x39	; 57	'9'
	.db #0x26	; 38
	.db #0x07	; 7
	.db #0x28	; 40
	.db #0x16	; 22
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x49	; 73	'I'
	.db #0x16	; 22
	.db #0x27	; 39
	.db #0x00	; 0
_scr_2_11:
	.db #0x59	; 89	'Y'
	.db #0x26	; 38
	.db #0x39	; 57	'9'
	.db #0x26	; 38
	.db #0x48	; 72	'H'
	.db #0x09	; 9
	.db #0x16	; 22
	.db #0x19	; 25
	.db #0x26	; 38
	.db #0x08	; 8
	.db #0x16	; 22
	.db #0x58	; 88	'X'
	.db #0x29	; 41
	.db #0x16	; 22
	.db #0x28	; 40
	.db #0x16	; 22
	.db #0x68	; 104	'h'
	.db #0x19	; 25
	.db #0x06	; 6
	.db #0x48	; 72	'H'
	.db #0x06	; 6
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0x38	; 56	'8'
	.db #0x09	; 9
	.db #0x58	; 88	'X'
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x09	; 9
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x88	; 136
	.db #0x06	; 6
	.db #0x48	; 72	'H'
	.db #0x09	; 9
	.db #0x88	; 136
	.db #0x06	; 6
	.db #0xE8	; 232
	.db #0x06	; 6
	.db #0x78	; 120	'x'
	.db #0x09	; 9
	.db #0x28	; 40
	.db #0x0E	; 14
	.db #0x18	; 24
	.db #0x06	; 6
	.db #0xF7	; 247
	.db #0x00	; 0
_scr_2_12:
	.db #0x0B	; 11
	.db #0xE4	; 228
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x52	; 82	'R'
	.db #0x05	; 5
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x2A	; 42
	.db #0x60	; 96
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x70	; 112	'p'
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x12	; 18
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x0E	; 14
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x52	; 82	'R'
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x32	; 50	'2'
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x7C	; 124
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0xF7	; 247
	.db #0x00	; 0
_scr_2_13:
	.db #0xF4	; 244
	.db #0x20	; 32
	.db #0x15	; 21
	.db #0x0B	; 11
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x2B	; 43
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xB0	; 176
	.db #0x32	; 50	'2'
	.db #0xA0	; 160
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0xA7	; 167
	.db #0x20	; 32
	.db #0x17	; 23
	.db #0xA1	; 161
	.db #0x10	; 16
	.db #0x0E	; 14
	.db #0x90	; 144
	.db #0x03	; 3
	.db #0xE0	; 224
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x0E	; 14
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x0E	; 14
	.db #0x30	; 48	'0'
	.db #0x2E	; 46
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0xF1	; 241
	.db #0xA9	; 169
	.db #0x25	; 37
	.db #0xA7	; 167
	.db #0x33	; 51	'3'
	.db #0xA8	; 168
	.db #0x34	; 52	'4'
	.db #0x00	; 0
_scr_2_14:
	.db #0xF4	; 244
	.db #0x10	; 16
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x12	; 18
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x12	; 18
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x1B	; 27
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0xF7	; 247
	.db #0xF1	; 241
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x1D	; 29
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x22	; 34
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0xF1	; 241
	.db #0x27	; 39
	.db #0x03	; 3
	.db #0x17	; 23
	.db #0x22	; 34
	.db #0x2D	; 45
	.db #0xA8	; 168
	.db #0x18	; 24
	.db #0x00	; 0
_scr_2_15:
	.db #0xF4	; 244
	.db #0x30	; 48	'0'
	.db #0x0B	; 11
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x42	; 66	'B'
	.db #0x60	; 96
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x22	; 34
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0xF7	; 247
	.db #0x31	; 49	'1'
	.db #0x0B	; 11
	.db #0x41	; 65	'A'
	.db #0x0B	; 11
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x28	; 40
	.db #0x02	; 2
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x0B	; 11
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0xF1	; 241
	.db #0x28	; 40
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x2A	; 42
	.db #0x27	; 39
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x7A	; 122	'z'
	.db #0x00	; 0
_scr_2_16:
	.db #0x0B	; 11
	.db #0xD1	; 209
	.db #0x0B	; 11
	.db #0x01	; 1
	.db #0xD8	; 216
	.db #0x11	; 17
	.db #0xE8	; 232
	.db #0x01	; 1
	.db #0x1A	; 26
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x98	; 152
	.db #0x01	; 1
	.db #0xC8	; 200
	.db #0x21	; 33
	.db #0x28	; 40
	.db #0x0E	; 14
	.db #0x98	; 152
	.db #0x11	; 17
	.db #0xD8	; 216
	.db #0x11	; 17
	.db #0x68	; 104	'h'
	.db #0x0E	; 14
	.db #0x58	; 88	'X'
	.db #0x01	; 1
	.db #0x48	; 72	'H'
	.db #0x0E	; 14
	.db #0x88	; 136
	.db #0x01	; 1
	.db #0xE8	; 232
	.db #0x11	; 17
	.db #0xDC	; 220
	.db #0x01	; 1
	.db #0x0B	; 11
	.db #0xD1	; 209
	.db #0x0B	; 11
	.db #0x00	; 0
_scr_2_17:
	.db #0xB4	; 180
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x60	; 96
	.db #0x0A	; 10
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x70	; 112	'p'
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x22	; 34
	.db #0x80	; 128
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x0A	; 10
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x22	; 34
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x32	; 50	'2'
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x40	; 64
	.db #0x32	; 50	'2'
	.db #0x0E	; 14
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x42	; 66	'B'
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x42	; 66	'B'
	.db #0x30	; 48	'0'
	.db #0x12	; 18
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x42	; 66	'B'
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x29	; 41
	.db #0x16	; 22
	.db #0x47	; 71	'G'
	.db #0x29	; 41
	.db #0x26	; 38
	.db #0x29	; 41
	.db #0x16	; 22
	.db #0x00	; 0
_map_2:
	.dw _scr_2_00
	.dw _scr_2_01
	.dw _scr_2_02
	.dw _scr_2_03
	.dw _scr_2_04
	.dw _scr_2_05
	.dw _scr_2_06
	.dw _scr_2_07
	.dw _scr_2_08
	.dw _scr_2_09
	.dw _scr_2_0a
	.dw _scr_2_0b
	.dw _scr_2_0c
	.dw _scr_2_0d
	.dw _scr_2_0e
	.dw _scr_2_0f
	.dw _scr_2_10
	.dw _scr_2_11
	.dw _scr_2_12
	.dw _scr_2_13
	.dw _scr_2_14
	.dw _scr_2_15
	.dw _scr_2_16
	.dw _scr_2_17
_map_2_locks:
	.db #0x0F	; 15
	.db #0x3C	; 60
	.db #0x0F	; 15
	.db #0xAC	; 172
	.area _INITIALIZER
	.area _CABS (ABS)
