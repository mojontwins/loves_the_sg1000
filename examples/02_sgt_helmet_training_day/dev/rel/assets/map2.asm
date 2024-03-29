;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
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
	.db #0x0c	; 12
	.db #0xd6	; 214
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0xd1	; 209
	.db #0x16	; 22
	.db #0xd0	; 208
	.db #0x16	; 22
	.db #0xd0	; 208
	.db #0x16	; 22
	.db #0xd0	; 208
	.db #0x16	; 22
	.db #0xd0	; 208
	.db #0x16	; 22
	.db #0xc0	; 192
	.db #0x0d	; 13
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x16	; 22
	.db #0x33	; 51	'3'
	.db #0x60	; 96
	.db #0x2d	; 45
	.db #0x76	; 118	'v'
	.db #0x10	; 16
	.db #0xd6	; 214
	.db #0x10	; 16
	.db #0xd6	; 214
	.db #0x10	; 16
	.db #0x66	; 102	'f'
_scr_2_01:
	.db #0x66	; 102	'f'
	.db #0x10	; 16
	.db #0xd6	; 214
	.db #0x10	; 16
	.db #0xa6	; 166
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0x21	; 33
	.db #0x76	; 118	'v'
	.db #0x0c	; 12
	.db #0x50	; 80	'P'
	.db #0x0c	; 12
	.db #0x76	; 118	'v'
	.db #0x0c	; 12
	.db #0x50	; 80	'P'
	.db #0x0c	; 12
	.db #0x76	; 118	'v'
	.db #0x0c	; 12
	.db #0x50	; 80	'P'
	.db #0x0c	; 12
	.db #0xa6	; 166
	.db #0x10	; 16
	.db #0xd6	; 214
	.db #0x10	; 16
	.db #0xd6	; 214
	.db #0x10	; 16
	.db #0x76	; 118	'v'
	.db #0x51	; 81	'Q'
	.db #0x10	; 16
	.db #0x51	; 81	'Q'
	.db #0x16	; 22
	.db #0xd0	; 208
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0xb6	; 182
	.db #0x00	; 0
	.db #0x06	; 6
_scr_2_02:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x51	; 81	'Q'
	.db #0x06	; 6
	.db #0x41	; 65	'A'
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x24	; 36
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x16	; 22
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x16	; 22
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x16	; 22
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x16	; 22
	.db #0x51	; 81	'Q'
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x16	; 22
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x60	; 96
	.db #0x16	; 22
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x40	; 64
	.db #0x16	; 22
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x60	; 96
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x10	; 16
	.db #0x26	; 38
_scr_2_03:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x3c	; 60
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x30	; 48	'0'
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x30	; 48	'0'
	.db #0x34	; 52	'4'
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x30	; 48	'0'
	.db #0x34	; 52	'4'
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x30	; 48	'0'
	.db #0x34	; 52	'4'
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x90	; 144
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x46	; 70	'F'
_scr_2_04:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x31	; 49	'1'
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x16	; 22
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x16	; 22
	.db #0x31	; 49	'1'
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x16	; 22
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x50	; 80	'P'
	.db #0x16	; 22
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x16	; 22
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x16	; 22
	.db #0x60	; 96
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x16	; 22
	.db #0x50	; 80	'P'
	.db #0x15	; 21
	.db #0x50	; 80	'P'
	.db #0x16	; 22
	.db #0x60	; 96
	.db #0x26	; 38
	.db #0x0f	; 15
	.db #0x36	; 54	'6'
_scr_2_05:
	.db #0x06	; 6
	.db #0x60	; 96
	.db #0x06	; 6
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x26	; 38
	.db #0x60	; 96
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x26	; 38
	.db #0x60	; 96
	.db #0x06	; 6
	.db #0x48	; 72	'H'
	.db #0x26	; 38
	.db #0x60	; 96
	.db #0x06	; 6
	.db #0x48	; 72	'H'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x60	; 96
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x60	; 96
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x13	; 19
	.db #0x10	; 16
	.db #0x23	; 35
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0xb6	; 182
_scr_2_06:
	.db #0x06	; 6
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x96	; 150
	.db #0x50	; 80	'P'
	.db #0x86	; 134
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x96	; 150
	.db #0x50	; 80	'P'
	.db #0x86	; 134
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x81	; 129
	.db #0x16	; 22
	.db #0xd0	; 208
	.db #0x16	; 22
	.db #0xd0	; 208
	.db #0x16	; 22
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x11	; 17
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x2b	; 43
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x21	; 33
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x50	; 80	'P'
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x50	; 80	'P'
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x4a	; 74	'J'
_scr_2_07:
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x0b	; 11
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x3b	; 59
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x20	; 32
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x54	; 84	'T'
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x54	; 84	'T'
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x24	; 36
_scr_2_08:
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x24	; 36
_scr_2_09:
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x24	; 36
_scr_2_0a:
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x20	; 32
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x02	; 2
	.db #0x24	; 36
_scr_2_0b:
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x02	; 2
	.db #0x54	; 84	'T'
	.db #0x02	; 2
	.db #0x54	; 84	'T'
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x44	; 68	'D'
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x2b	; 43
	.db #0x0c	; 12
	.db #0x1b	; 27
	.db #0x0a	; 10
	.db #0x3b	; 59
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x50	; 80	'P'
	.db #0x0a	; 10
	.db #0x60	; 96
	.db #0x1a	; 26
	.db #0x50	; 80	'P'
	.db #0x0a	; 10
	.db #0x60	; 96
	.db #0x1a	; 26
	.db #0x50	; 80	'P'
	.db #0x0a	; 10
	.db #0x60	; 96
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x4a	; 74	'J'
	.db #0x40	; 64
	.db #0x1a	; 26
	.db #0x28	; 40
	.db #0x8b	; 139
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0xb0	; 176
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0xb0	; 176
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
_scr_2_0c:
	.db #0x0a	; 10
	.db #0xab	; 171
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x70	; 112	'p'
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x28	; 40
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x10	; 16
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x30	; 48	'0'
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x30	; 48	'0'
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x10	; 16
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x30	; 48	'0'
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x8b	; 139
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x90	; 144
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x70	; 112	'p'
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x9a	; 154
_scr_2_0d:
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x8b	; 139
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x90	; 144
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x9b	; 155
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0xb0	; 176
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x04	; 4
	.db #0xd0	; 208
	.db #0x14	; 20
	.db #0xc0	; 192
	.db #0x34	; 52	'4'
	.db #0xb0	; 176
	.db #0x64	; 100	'd'
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x44	; 68	'D'
_scr_2_0e:
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x44	; 68	'D'
_scr_2_0f:
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x84	; 132
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x84	; 132
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0xd0	; 208
	.db #0x1a	; 26
	.db #0xd0	; 208
	.db #0x1a	; 26
	.db #0xd0	; 208
	.db #0x1a	; 26
	.db #0xd0	; 208
	.db #0x0a	; 10
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0xb6	; 182
_scr_2_10:
	.db #0x06	; 6
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x51	; 81	'Q'
	.db #0x06	; 6
	.db #0x11	; 17
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x70	; 112	'p'
	.db #0x0d	; 13
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x30	; 48	'0'
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x16	; 22
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x70	; 112	'p'
	.db #0x16	; 22
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x51	; 81	'Q'
	.db #0x0e	; 14
	.db #0x11	; 17
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x76	; 118	'v'
_scr_2_11:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x40	; 64
	.db #0x16	; 22
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x51	; 81	'Q'
	.db #0x0c	; 12
	.db #0x20	; 32
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x90	; 144
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x64	; 100	'd'
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x90	; 144
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x86	; 134
	.db #0x20	; 32
	.db #0x06	; 6
_scr_2_12:
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x81	; 129
	.db #0x20	; 32
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0x40	; 64
	.db #0x0b	; 11
	.db #0x70	; 112	'p'
	.db #0x1a	; 26
	.db #0x58	; 88	'X'
	.db #0x70	; 112	'p'
	.db #0x1a	; 26
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x1a	; 26
	.db #0x40	; 64
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x0a	; 10
	.db #0x28	; 40
	.db #0x1a	; 26
	.db #0x30	; 48	'0'
	.db #0x58	; 88	'X'
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x1a	; 26
	.db #0x90	; 144
	.db #0x0a	; 10
	.db #0x20	; 32
	.db #0x1a	; 26
	.db #0x60	; 96
	.db #0x25	; 37
	.db #0x0a	; 10
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x70	; 112	'p'
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x30	; 48	'0'
	.db #0x0a	; 10
	.db #0x90	; 144
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x96	; 150
	.db #0x10	; 16
	.db #0x0c	; 12
_scr_2_13:
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x41	; 65	'A'
	.db #0x06	; 6
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x44	; 68	'D'
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x44	; 68	'D'
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0x44	; 68	'D'
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x26	; 38
_scr_2_14:
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x71	; 113	'q'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x10	; 16
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x06	; 6
_scr_2_15:
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x21	; 33
	.db #0x06	; 6
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x21	; 33
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x58	; 88	'X'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x58	; 88	'X'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x13	; 19
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x06	; 6
_scr_2_16:
	.db #0x06	; 6
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x21	; 33
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x21	; 33
	.db #0x0f	; 15
	.db #0x11	; 17
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x61	; 97	'a'
	.db #0x0a	; 10
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x1e	; 30
	.db #0x50	; 80	'P'
	.db #0x1a	; 26
	.db #0x40	; 64
	.db #0x06	; 6
	.db #0x70	; 112	'p'
	.db #0x1a	; 26
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0x10	; 16
	.db #0x1a	; 26
	.db #0xd0	; 208
	.db #0x1a	; 26
	.db #0xd0	; 208
	.db #0x7a	; 122	'z'
	.db #0x10	; 16
	.db #0x6a	; 106	'j'
_scr_2_17:
	.db #0x6a	; 106	'j'
	.db #0x10	; 16
	.db #0x7a	; 122	'z'
	.db #0x5b	; 91
	.db #0x10	; 16
	.db #0x5b	; 91
	.db #0x1a	; 26
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x20	; 32
	.db #0x1a	; 26
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x80	; 128
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x1a	; 26
	.db #0x05	; 5
	.db #0xc0	; 192
	.db #0x1a	; 26
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x24	; 36
	.db #0x30	; 48	'0'
	.db #0x1a	; 26
	.db #0x54	; 84	'T'
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x1a	; 26
	.db #0x34	; 52	'4'
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x34	; 52	'4'
	.db #0x10	; 16
	.db #0x5a	; 90	'Z'
	.db #0x30	; 48	'0'
	.db #0x1a	; 26
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x1a	; 26
	.db #0x80	; 128
	.db #0x0a	; 10
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0xda	; 218
	.db #0x0c	; 12
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
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0xbb	; 187
	.db #0x06	; 6
	.db #0x73	; 115	's'
	.db #0x06	; 6
	.db #0x93	; 147
	.db #0x0b	; 11
	.db #0x3c	; 60
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x15	; 21
	.db #0x34	; 52	'4'
	.db #0x16	; 22
	.db #0x33	; 51	'3'
	.area _INITIALIZER
	.area _CABS (ABS)
