;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module enems1
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hotspots_1
	.globl _enems_1
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
_enems_1:
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
	.db #0x07	; 7
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x69	; 105	'i'
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x31	; 49	'1'
	.db #0x07	; 7
	.db #0x37	; 55	'7'
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x7a	; 122	'z'
	.db #0x6a	; 106	'j'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xb7	; 183
	.db #0xb6	; 182
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x47	; 71	'G'
	.db #0x37	; 55	'7'
	.db #0x11	; 17
	.db #0x07	; 7
	.db #0xbd	; 189
	.db #0xad	; 173
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x2e	; 46
	.db #0x3e	; 62
	.db #0x11	; 17
	.db #0x07	; 7
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x8b	; 139
	.db #0x7b	; 123
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x59	; 89	'Y'
	.db #0x49	; 73	'I'
	.db #0x31	; 49	'1'
	.db #0x07	; 7
	.db #0x72	; 114	'r'
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x22	; 34
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x5b	; 91
	.db #0x6b	; 107	'k'
	.db #0x31	; 49	'1'
	.db #0x07	; 7
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x6a	; 106	'j'
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x62	; 98	'b'
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xac	; 172
	.db #0xab	; 171
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xa7	; 167
	.db #0xa6	; 166
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x11	; 17
	.db #0x07	; 7
	.db #0x61	; 97	'a'
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x6e	; 110	'n'
	.db #0x6d	; 109	'm'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x69	; 105	'i'
	.db #0x59	; 89	'Y'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x4b	; 75	'K'
	.db #0x3b	; 59
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x81	; 129
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x37	; 55	'7'
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x56	; 86	'V'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x56	; 86	'V'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x7e	; 126
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x58	; 88	'X'
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x68	; 104	'h'
	.db #0x47	; 71	'G'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x49	; 73	'I'
	.db #0x47	; 71	'G'
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x97	; 151
	.db #0x99	; 153
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x97	; 151
	.db #0x87	; 135
	.db #0x31	; 49	'1'
	.db #0x02	; 2
	.db #0x28	; 40
	.db #0x68	; 104	'h'
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x6d	; 109	'm'
	.db #0x2d	; 45
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x75	; 117	'u'
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x6d	; 109	'm'
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x8c	; 140
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x8a	; 138
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x7b	; 123
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xb8	; 184
	.db #0xb7	; 183
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x2a	; 42
	.db #0x4a	; 74	'J'
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x46	; 70	'F'
	.db #0x26	; 38
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x31	; 49	'1'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x2a	; 42
	.db #0xbb	; 187
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x2e	; 46
	.db #0xad	; 173
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x53	; 83	'S'
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x5e	; 94
	.db #0x5c	; 92
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x77	; 119	'w'
	.db #0x67	; 103	'g'
	.db #0x31	; 49	'1'
	.db #0x07	; 7
	.db #0x5c	; 92
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x73	; 115	's'
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x44	; 68	'D'
	.db #0x4b	; 75	'K'
	.db #0x08	; 8
_hotspots_1:
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0xad	; 173
	.db #0x02	; 2
	.db #0x2d	; 45
	.db #0x01	; 1
	.db #0x79	; 121	'y'
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x8e	; 142
	.db #0x01	; 1
	.db #0xac	; 172
	.db #0x01	; 1
	.db #0x62	; 98	'b'
	.db #0x02	; 2
	.db #0x64	; 100	'd'
	.db #0x02	; 2
	.db #0x64	; 100	'd'
	.db #0x02	; 2
	.db #0x66	; 102	'f'
	.db #0x02	; 2
	.db #0x4b	; 75	'K'
	.db #0x02	; 2
	.db #0xb1	; 177
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x04	; 4
	.db #0x59	; 89	'Y'
	.db #0x04	; 4
	.db #0xb3	; 179
	.db #0x01	; 1
	.db #0xb3	; 179
	.db #0x04	; 4
	.db #0x23	; 35
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x2b	; 43
	.db #0x04	; 4
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x10	; 16
	.area _INITIALIZER
	.area _CABS (ABS)
