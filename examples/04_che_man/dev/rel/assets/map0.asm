;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Sep 11 14:34:42 2019
;--------------------------------------------------------
	.module map0
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _map_0_locks
	.globl _map_0
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
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0xB0	; 176
	.db #0x25	; 37
	.db #0x20	; 32
	.db #0xE1	; 225
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x08	; 8
	.db #0x25	; 37
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x25	; 37
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xE0	; 224
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xC0	; 192
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x66	; 102	'f'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0x02	; 2
	.db #0x13	; 19
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x22	; 34
_scr_0_01:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0xB0	; 176
	.db #0x0E	; 14
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x26	; 38
	.db #0x0C	; 12
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0xE4	; 228
	.db #0x64	; 100	'd'
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x44	; 68	'D'
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x0A	; 10
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x0A	; 10
	.db #0x10	; 16
	.db #0x0A	; 10
	.db #0x10	; 16
	.db #0x0A	; 10
	.db #0x10	; 16
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_02:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xF0	; 240
	.db #0xB0	; 176
	.db #0x0E	; 14
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0xA4	; 164
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0xA4	; 164
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0xA4	; 164
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x40	; 64
	.db #0xA4	; 164
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0xBE	; 190
	.db #0x63	; 99	'c'
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x24	; 36
	.db #0xB0	; 176
	.db #0x80	; 128
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x24	; 36
	.db #0xA0	; 160
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x24	; 36
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x0A	; 10
	.db #0x40	; 64
	.db #0x24	; 36
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x0B	; 11
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x9E	; 158
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x42	; 66	'B'
_scr_0_03:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x90	; 144
	.db #0x0E	; 14
	.db #0x25	; 37
	.db #0x20	; 32
	.db #0x61	; 97	'a'
	.db #0x20	; 32
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x82	; 130
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x82	; 130
	.db #0x05	; 5
	.db #0x70	; 112	'p'
	.db #0x1A	; 26
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0xD0	; 208
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xE0	; 224
	.db #0xC0	; 192
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xE0	; 224
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x07	; 7
	.db #0x60	; 96
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_04:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x90	; 144
	.db #0x0E	; 14
	.db #0x25	; 37
	.db #0x20	; 32
	.db #0x61	; 97	'a'
	.db #0x20	; 32
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x82	; 130
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0x62	; 98	'b'
	.db #0x05	; 5
	.db #0x90	; 144
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x1B	; 27
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0xC0	; 192
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_05:
	.db #0xE2	; 226
	.db #0x22	; 34
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x30	; 48	'0'
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x0D	; 13
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x0A	; 10
	.db #0x09	; 9
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x4A	; 74	'J'
	.db #0xE0	; 224
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xE2	; 226
	.db #0x42	; 66	'B'
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0xE0	; 224
	.db #0x60	; 96
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x0D	; 13
	.db #0x40	; 64
	.db #0x2D	; 45
	.db #0x40	; 64
	.db #0x0D	; 13
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x29	; 41
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x4A	; 74	'J'
	.db #0x00	; 0
	.db #0x2A	; 42
	.db #0x09	; 9
	.db #0x40	; 64
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_06:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x20	; 32
	.db #0x61	; 97	'a'
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0xE2	; 226
	.db #0x62	; 98	'b'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x1B	; 27
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE0	; 224
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xC0	; 192
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_07:
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x24	; 36
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x83	; 131
	.db #0x9E	; 158
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x90	; 144
	.db #0x15	; 21
	.db #0x64	; 100	'd'
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x60	; 96
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x24	; 36
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x24	; 36
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x24	; 36
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x9E	; 158
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x42	; 66	'B'
_scr_0_08:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0xB0	; 176
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0xE0	; 224
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x82	; 130
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0xA2	; 162
	.db #0x90	; 144
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x1B	; 27
	.db #0xD0	; 208
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xE0	; 224
	.db #0x40	; 64
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xA0	; 160
	.db #0x07	; 7
	.db #0x60	; 96
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xA0	; 160
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_09:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0xB0	; 176
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x40	; 64
	.db #0x07	; 7
	.db #0xE0	; 224
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x20	; 32
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0xC0	; 192
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xA2	; 162
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x82	; 130
	.db #0xB0	; 176
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x1B	; 27
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0xC0	; 192
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_0a:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x90	; 144
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE4	; 228
	.db #0xC4	; 196
	.db #0x05	; 5
	.db #0xE4	; 228
	.db #0xC4	; 196
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0xC4	; 196
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0x05	; 5
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0xE4	; 228
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE4	; 228
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE4	; 228
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x64	; 100	'd'
	.db #0x0D	; 13
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x25	; 37
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x04	; 4
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0x62	; 98	'b'
	.db #0x10	; 16
	.db #0x42	; 66	'B'
_scr_0_0b:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xF0	; 240
	.db #0xB0	; 176
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0x60	; 96
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x0D	; 13
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x40	; 64
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x13	; 19
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0xC2	; 194
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x90	; 144
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE0	; 224
	.db #0xC0	; 192
	.db #0x05	; 5
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x26	; 38
	.db #0xA0	; 160
	.db #0x07	; 7
	.db #0xA0	; 160
	.db #0x05	; 5
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0xE2	; 226
	.db #0xC2	; 194
	.db #0x05	; 5
_scr_0_0c:
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x0E	; 14
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x24	; 36
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x0C	; 12
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x9E	; 158
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x80	; 128
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0xE0	; 224
	.db #0x24	; 36
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x22	; 34
	.db #0x40	; 64
	.db #0x24	; 36
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x10	; 16
	.db #0x62	; 98	'b'
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x9E	; 158
	.db #0x15	; 21
	.db #0x70	; 112	'p'
	.db #0x05	; 5
_scr_0_0d:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x70	; 112	'p'
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x2D	; 45
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x20	; 32
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0x13	; 19
	.db #0xE0	; 224
	.db #0xC0	; 192
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0xC2	; 194
_scr_0_0e:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x70	; 112	'p'
	.db #0x0E	; 14
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x60	; 96
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x0F	; 15
	.db #0xE0	; 224
	.db #0x40	; 64
	.db #0x0B	; 11
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x05	; 5
	.db #0x82	; 130
	.db #0x16	; 22
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x82	; 130
	.db #0xB0	; 176
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xC0	; 192
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE0	; 224
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_0f:
	.db #0xE2	; 226
	.db #0x62	; 98	'b'
	.db #0x10	; 16
	.db #0x42	; 66	'B'
	.db #0x05	; 5
	.db #0xD0	; 208
	.db #0x0E	; 14
	.db #0x05	; 5
	.db #0xB0	; 176
	.db #0x05	; 5
	.db #0xC4	; 196
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x64	; 100	'd'
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x05	; 5
	.db #0x64	; 100	'd'
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x05	; 5
	.db #0x64	; 100	'd'
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x0D	; 13
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x26	; 38
	.db #0x04	; 4
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0xA0	; 160
	.db #0x05	; 5
	.db #0x26	; 38
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x64	; 100	'd'
	.db #0x0F	; 15
	.db #0x40	; 64
	.db #0x0C	; 12
	.db #0x20	; 32
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_10:
	.db #0xE2	; 226
	.db #0xC2	; 194
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0xB0	; 176
	.db #0x0E	; 14
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x61	; 97	'a'
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE0	; 224
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE0	; 224
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE0	; 224
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x0D	; 13
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0xE0	; 224
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_11:
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x84	; 132
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x64	; 100	'd'
	.db #0x40	; 64
	.db #0x0E	; 14
	.db #0x25	; 37
	.db #0x60	; 96
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x60	; 96
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x24	; 36
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x60	; 96
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0x62	; 98	'b'
	.db #0x13	; 19
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x50	; 80	'P'
	.db #0x0E	; 14
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x44	; 68	'D'
	.db #0x50	; 80	'P'
	.db #0x09	; 9
	.db #0xE0	; 224
	.db #0x24	; 36
	.db #0x11	; 17
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x0A	; 10
	.db #0x09	; 9
	.db #0x0A	; 10
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x12	; 18
	.db #0x24	; 36
	.db #0x0A	; 10
	.db #0x09	; 9
	.db #0x0A	; 10
	.db #0x09	; 9
	.db #0x20	; 32
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_12:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0x90	; 144
	.db #0x0E	; 14
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x0C	; 12
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xC2	; 194
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0xA2	; 162
	.db #0xB0	; 176
	.db #0x0E	; 14
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0xB0	; 176
	.db #0x05	; 5
	.db #0xC0	; 192
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x61	; 97	'a'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x08	; 8
	.db #0x0B	; 11
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0xE2	; 226
_scr_0_13:
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0x05	; 5
	.db #0xF0	; 240
	.db #0xB0	; 176
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0xE0	; 224
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x0F	; 15
	.db #0xA0	; 160
	.db #0x0D	; 13
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x13	; 19
	.db #0x16	; 22
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0xA0	; 160
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xE2	; 226
	.db #0xE2	; 226
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
_map_0_locks:
	.db #0x01	; 1
	.db #0xAE	; 174
	.db #0x0E	; 14
	.db #0x50	; 80	'P'
	.db #0x13	; 19
	.db #0x70	; 112	'p'
	.db #0x0F	; 15
	.db #0xA9	; 169
	.area _INITIALIZER
	.area _CABS (ABS)
