;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Oct 31 22:59:10 2018
;--------------------------------------------------------
	.module murcia
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sfx_start_psg
	.globl _sfx_shirt_psg
	.globl _sfx_select_psg
	.globl _sfx_kill_psg
	.globl _sfx_jump_psg
	.globl _sfx_fanty_psg
	.globl _sfx_coins_psg
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
_sfx_coins_psg:
	.db #0xC5	; 197
	.db #0x4D	; 77	'M'
	.db #0xD0	; 208
	.db #0x39	; 57	'9'
	.db #0xC9	; 201
	.db #0x4A	; 74	'J'
	.db #0x39	; 57	'9'
	.db #0xC0	; 192
	.db #0x4A	; 74	'J'
	.db #0x39	; 57	'9'
	.db #0xC7	; 199
	.db #0x44	; 68	'D'
	.db #0x39	; 57	'9'
	.db #0xC0	; 192
	.db #0x45	; 69	'E'
	.db #0x3B	; 59
	.db #0xC0	; 192
	.db #0x40	; 64
	.db #0xDF	; 223
	.db #0x39	; 57	'9'
	.db #0x00	; 0
_sfx_fanty_psg:
	.db #0xCA	; 202
	.db #0x43	; 67	'C'
	.db #0xD0	; 208
	.db #0x38	; 56	'8'
	.db #0xC2	; 194
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCA	; 202
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCB	; 203
	.db #0x43	; 67	'C'
	.db #0xD1	; 209
	.db #0x38	; 56	'8'
	.db #0xC3	; 195
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCB	; 203
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCC	; 204
	.db #0x43	; 67	'C'
	.db #0xD2	; 210
	.db #0x38	; 56	'8'
	.db #0xC4	; 196
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCC	; 204
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCD	; 205
	.db #0x43	; 67	'C'
	.db #0xD3	; 211
	.db #0x38	; 56	'8'
	.db #0xC5	; 197
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCD	; 205
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCE	; 206
	.db #0x43	; 67	'C'
	.db #0xD4	; 212
	.db #0x38	; 56	'8'
	.db #0xC6	; 198
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCE	; 206
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCF	; 207
	.db #0x43	; 67	'C'
	.db #0xD5	; 213
	.db #0x38	; 56	'8'
	.db #0xC7	; 199
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xCF	; 207
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xC0	; 192
	.db #0x44	; 68	'D'
	.db #0xD6	; 214
	.db #0x38	; 56	'8'
	.db #0xC8	; 200
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xC0	; 192
	.db #0x45	; 69	'E'
	.db #0x38	; 56	'8'
	.db #0xC1	; 193
	.db #0x44	; 68	'D'
	.db #0xD7	; 215
	.db #0x38	; 56	'8'
	.db #0xC9	; 201
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xC1	; 193
	.db #0x45	; 69	'E'
	.db #0x0B	; 11
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xC2	; 194
	.db #0x45	; 69	'E'
	.db #0x38	; 56	'8'
	.db #0xC3	; 195
	.db #0x44	; 68	'D'
	.db #0xD9	; 217
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0xC3	; 195
	.db #0x45	; 69	'E'
	.db #0x0B	; 11
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x45	; 69	'E'
	.db #0x0B	; 11
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x08	; 8
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xDB	; 219
	.db #0x0A	; 10
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x0B	; 11
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0xDD	; 221
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0xC3	; 195
	.db #0x45	; 69	'E'
	.db #0x0B	; 11
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x45	; 69	'E'
	.db #0x38	; 56	'8'
	.db #0xC4	; 196
	.db #0x44	; 68	'D'
	.db #0xDE	; 222
	.db #0x08	; 8
	.db #0x1A	; 26
	.db #0x00	; 0
	.db #0xC4	; 196
	.db #0x45	; 69	'E'
	.db #0x38	; 56	'8'
	.db #0xC0	; 192
	.db #0x40	; 64
	.db #0xDF	; 223
	.db #0x38	; 56	'8'
	.db #0xC8	; 200
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0xC0	; 192
	.db #0x41	; 65	'A'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
_sfx_jump_psg:
	.db #0xCA	; 202
	.db #0x46	; 70	'F'
	.db #0xD0	; 208
	.db #0x39	; 57	'9'
	.db #0xC4	; 196
	.db #0x46	; 70	'F'
	.db #0xD1	; 209
	.db #0x38	; 56	'8'
	.db #0xCF	; 207
	.db #0x45	; 69	'E'
	.db #0xD2	; 210
	.db #0x38	; 56	'8'
	.db #0xC9	; 201
	.db #0x45	; 69	'E'
	.db #0xD3	; 211
	.db #0x38	; 56	'8'
	.db #0xC4	; 196
	.db #0x45	; 69	'E'
	.db #0xD4	; 212
	.db #0x38	; 56	'8'
	.db #0xC0	; 192
	.db #0x45	; 69	'E'
	.db #0xD5	; 213
	.db #0x39	; 57	'9'
	.db #0xCB	; 203
	.db #0x44	; 68	'D'
	.db #0xD6	; 214
	.db #0x38	; 56	'8'
	.db #0xC7	; 199
	.db #0x44	; 68	'D'
	.db #0xD7	; 215
	.db #0x38	; 56	'8'
	.db #0xC3	; 195
	.db #0x44	; 68	'D'
	.db #0xD8	; 216
	.db #0x38	; 56	'8'
	.db #0xCF	; 207
	.db #0x43	; 67	'C'
	.db #0xD9	; 217
	.db #0x38	; 56	'8'
	.db #0xCB	; 203
	.db #0x43	; 67	'C'
	.db #0xDA	; 218
	.db #0x39	; 57	'9'
	.db #0xC8	; 200
	.db #0x43	; 67	'C'
	.db #0x38	; 56	'8'
	.db #0xC0	; 192
	.db #0x40	; 64
	.db #0xDF	; 223
	.db #0x38	; 56	'8'
	.db #0x00	; 0
_sfx_kill_psg:
	.db #0xC3	; 195
	.db #0x51	; 81	'Q'
	.db #0xD0	; 208
	.db #0x3A	; 58
	.db #0xC5	; 197
	.db #0x68	; 104	'h'
	.db #0x3A	; 58
	.db #0xC5	; 197
	.db #0x49	; 73	'I'
	.db #0x3A	; 58
	.db #0xC1	; 193
	.db #0x4C	; 76	'L'
	.db #0x3A	; 58
	.db #0xCC	; 204
	.db #0x5F	; 95
	.db #0x3A	; 58
	.db #0xC0	; 192
	.db #0x68	; 104	'h'
	.db #0x3A	; 58
	.db #0xC3	; 195
	.db #0x55	; 85	'U'
	.db #0x3A	; 58
	.db #0xCF	; 207
	.db #0x47	; 71	'G'
	.db #0xD3	; 211
	.db #0x3A	; 58
	.db #0xC0	; 192
	.db #0x4A	; 74	'J'
	.db #0xD5	; 213
	.db #0x3A	; 58
	.db #0xC0	; 192
	.db #0x68	; 104	'h'
	.db #0xD7	; 215
	.db #0x3A	; 58
	.db #0xC9	; 201
	.db #0x78	; 120	'x'
	.db #0xDD	; 221
	.db #0x3A	; 58
	.db #0xC0	; 192
	.db #0x40	; 64
	.db #0xDF	; 223
	.db #0x3A	; 58
	.db #0x00	; 0
_sfx_select_psg:
	.db #0xC5	; 197
	.db #0x4D	; 77	'M'
	.db #0xD0	; 208
	.db #0x3B	; 59
	.db #0xCE	; 206
	.db #0x48	; 72	'H'
	.db #0x3B	; 59
	.db #0xC7	; 199
	.db #0x44	; 68	'D'
	.db #0xD5	; 213
	.db #0x3A	; 58
	.db #0xCA	; 202
	.db #0x46	; 70	'F'
	.db #0x3B	; 59
	.db #0xC5	; 197
	.db #0x4D	; 77	'M'
	.db #0xDA	; 218
	.db #0x3A	; 58
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xDB	; 219
	.db #0x3B	; 59
	.db #0xCA	; 202
	.db #0x46	; 70	'F'
	.db #0xDD	; 221
	.db #0x3A	; 58
	.db #0xC0	; 192
	.db #0x40	; 64
	.db #0xDF	; 223
	.db #0x38	; 56	'8'
	.db #0x00	; 0
_sfx_shirt_psg:
	.db #0xC5	; 197
	.db #0x4D	; 77	'M'
	.db #0xD0	; 208
	.db #0x3B	; 59
	.db #0xC0	; 192
	.db #0x4A	; 74	'J'
	.db #0x3B	; 59
	.db #0xC7	; 199
	.db #0x49	; 73	'I'
	.db #0x3B	; 59
	.db #0xCE	; 206
	.db #0x48	; 72	'H'
	.db #0xD5	; 213
	.db #0x3B	; 59
	.db #0xC5	; 197
	.db #0x4D	; 77	'M'
	.db #0x3B	; 59
	.db #0xC0	; 192
	.db #0x4A	; 74	'J'
	.db #0x3B	; 59
	.db #0xC7	; 199
	.db #0x49	; 73	'I'
	.db #0xDA	; 218
	.db #0x3B	; 59
	.db #0xCE	; 206
	.db #0x48	; 72	'H'
	.db #0x3B	; 59
	.db #0xC0	; 192
	.db #0x49	; 73	'I'
	.db #0x3B	; 59
	.db #0xC0	; 192
	.db #0x40	; 64
	.db #0xDF	; 223
	.db #0x3B	; 59
	.db #0x00	; 0
_sfx_start_psg:
	.db #0xC5	; 197
	.db #0x4D	; 77	'M'
	.db #0xD0	; 208
	.db #0x3B	; 59
	.db #0xCE	; 206
	.db #0x48	; 72	'H'
	.db #0x3B	; 59
	.db #0xC7	; 199
	.db #0x47	; 71	'G'
	.db #0x3B	; 59
	.db #0xCA	; 202
	.db #0x46	; 70	'F'
	.db #0x3B	; 59
	.db #0xC5	; 197
	.db #0x4D	; 77	'M'
	.db #0xD3	; 211
	.db #0x0A	; 10
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xD5	; 213
	.db #0x0A	; 10
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0xD7	; 215
	.db #0x0A	; 10
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xDA	; 218
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x40	; 64
	.db #0xDF	; 223
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
