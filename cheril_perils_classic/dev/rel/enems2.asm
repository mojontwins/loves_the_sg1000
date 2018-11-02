;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Fri Nov 02 11:34:18 2018
;--------------------------------------------------------
	.module enems2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hotspots_2
	.globl _enems_2
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
_enems_2:
	.db #0x01	; 1
	.db #0xA3	; 163
	.db #0xA7	; 167
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x27	; 39
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xBD	; 189
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x19	; 25
	.db #0x7A	; 122	'z'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x59	; 89	'Y'
	.db #0x5B	; 91
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x35	; 53	'5'
	.db #0x33	; 51	'3'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xB4	; 180
	.db #0xBB	; 187
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0xB2	; 178
	.db #0xBD	; 189
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x5D	; 93
	.db #0x72	; 114	'r'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x95	; 149
	.db #0xAB	; 171
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x5B	; 91
	.db #0x5D	; 93
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x54	; 84	'T'
	.db #0x59	; 89	'Y'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x85	; 133
	.db #0x9B	; 155
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x24	; 36
	.db #0x4A	; 74	'J'
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x72	; 114	'r'
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xAA	; 170
	.db #0xA3	; 163
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x64	; 100	'd'
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xAC	; 172
	.db #0x8C	; 140
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0xB9	; 185
	.db #0x79	; 121	'y'
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0x5D	; 93
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xA2	; 162
	.db #0xA5	; 165
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x37	; 55	'7'
	.db #0x3C	; 60
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x68	; 104	'h'
	.db #0x64	; 100	'd'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x39	; 57	'9'
	.db #0x37	; 55	'7'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x6C	; 108	'l'
	.db #0x6E	; 110	'n'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x61	; 97	'a'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x46	; 70	'F'
	.db #0x48	; 72	'H'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x76	; 118	'v'
	.db #0x78	; 120	'x'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x92	; 146
	.db #0xBE	; 190
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x4B	; 75	'K'
	.db #0x43	; 67	'C'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0xB3	; 179
	.db #0xBA	; 186
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x39	; 57	'9'
	.db #0x69	; 105	'i'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x35	; 53	'5'
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xB7	; 183
	.db #0xB2	; 178
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xB9	; 185
	.db #0xBB	; 187
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x33	; 51	'3'
	.db #0x35	; 53	'5'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xB9	; 185
	.db #0xBD	; 189
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x5D	; 93
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x53	; 83	'S'
	.db #0x56	; 86	'V'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x5C	; 92
	.db #0x59	; 89	'Y'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xB5	; 181
	.db #0xBA	; 186
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x52	; 82	'R'
	.db #0x5D	; 93
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x95	; 149
	.db #0xA9	; 169
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x28	; 40
	.db #0x78	; 120	'x'
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x59	; 89	'Y'
	.db #0x5D	; 93
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x63	; 99	'c'
	.db #0xA3	; 163
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x51	; 81	'Q'
	.db #0x5D	; 93
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0xB8	; 184
	.db #0xB1	; 177
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xAB	; 171
	.db #0xA9	; 169
	.db #0x01	; 1
_hotspots_2:
	.db #0x04	; 4
	.db #0x6B	; 107	'k'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x37	; 55	'7'
	.db #0x04	; 4
	.db #0xB7	; 183
	.db #0x04	; 4
	.db #0x77	; 119	'w'
	.db #0x04	; 4
	.db #0x32	; 50	'2'
	.db #0x04	; 4
	.db #0xB2	; 178
	.db #0x04	; 4
	.db #0xB6	; 182
	.db #0x04	; 4
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x32	; 50	'2'
	.db #0x04	; 4
	.db #0x5E	; 94
	.db #0x02	; 2
	.db #0x3B	; 59
	.db #0x04	; 4
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x43	; 67	'C'
	.db #0x04	; 4
	.db #0x4A	; 74	'J'
	.db #0x04	; 4
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x10	; 16
	.area _INITIALIZER
	.area _CABS (ABS)
