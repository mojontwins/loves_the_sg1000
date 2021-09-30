;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module enems0
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hotspots_0
	.globl _enems_0
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
_enems_0:
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x53	; 83	'S'
	.db #0x94	; 148
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x5b	; 91
	.db #0x59	; 89	'Y'
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0xab	; 171
	.db #0x8b	; 139
	.db #0x31	; 49	'1'
	.db #0x07	; 7
	.db #0x3e	; 62
	.db #0x5e	; 94
	.db #0x31	; 49	'1'
	.db #0x07	; 7
	.db #0x31	; 49	'1'
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x85	; 133
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x45	; 69	'E'
	.db #0x47	; 71	'G'
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x85	; 133
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x45	; 69	'E'
	.db #0x49	; 73	'I'
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x69	; 105	'i'
	.db #0x65	; 101	'e'
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x85	; 133
	.db #0x89	; 137
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x4b	; 75	'K'
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x3d	; 61
	.db #0x4d	; 77	'M'
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x9c	; 156
	.db #0x99	; 153
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x4d	; 77	'M'
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x96	; 150
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x94	; 148
	.db #0x84	; 132
	.db #0x31	; 49	'1'
	.db #0x03	; 3
	.db #0x8a	; 138
	.db #0xaa	; 170
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x43	; 67	'C'
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x9b	; 155
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x47	; 71	'G'
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xaa	; 170
	.db #0x88	; 136
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x43	; 67	'C'
	.db #0x45	; 69	'E'
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x54	; 84	'T'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x5a	; 90	'Z'
	.db #0x3a	; 58
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x77	; 119	'w'
	.db #0x97	; 151
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x5a	; 90	'Z'
	.db #0x9a	; 154
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x75	; 117	'u'
	.db #0x73	; 115	's'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x31	; 49	'1'
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x31	; 49	'1'
	.db #0x35	; 53	'5'
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x3e	; 62
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0xa8	; 168
	.db #0xa7	; 167
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x56	; 86	'V'
	.db #0x58	; 88	'X'
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x33	; 51	'3'
	.db #0x53	; 83	'S'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x3c	; 60
	.db #0x5c	; 92
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x23	; 35
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x2c	; 44
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x38	; 56	'8'
	.db #0x36	; 54	'6'
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x62	; 98	'b'
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x9e	; 158
	.db #0x9d	; 157
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x63	; 99	'c'
	.db #0x83	; 131
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x66	; 102	'f'
	.db #0x86	; 134
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x8a	; 138
	.db #0x6a	; 106	'j'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x61	; 97	'a'
	.db #0x63	; 99	'c'
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x3e	; 62
	.db #0x4e	; 78	'N'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x6e	; 110	'n'
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x29	; 41
	.db #0x39	; 57	'9'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x7d	; 125
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x3b	; 59
	.db #0x3a	; 58
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x91	; 145
	.db #0x93	; 147
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x9c	; 156
	.db #0x9e	; 158
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x47	; 71	'G'
	.db #0x47	; 71	'G'
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x42	; 66	'B'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x4b	; 75	'K'
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x94	; 148
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0x71	; 113	'q'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x88	; 136
	.db #0x8a	; 138
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x21	; 33
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x38	; 56	'8'
	.db #0x3a	; 58
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x63	; 99	'c'
	.db #0x65	; 101	'e'
	.db #0x00	; 0
_hotspots_0:
	.db #0x02	; 2
	.db #0xb5	; 181
	.db #0x04	; 4
	.db #0x39	; 57	'9'
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x3d	; 61
	.db #0x04	; 4
	.db #0xae	; 174
	.db #0x04	; 4
	.db #0x74	; 116	't'
	.db #0x04	; 4
	.db #0x67	; 103	'g'
	.db #0x01	; 1
	.db #0x45	; 69	'E'
	.db #0x02	; 2
	.db #0x6a	; 106	'j'
	.db #0x01	; 1
	.db #0x5e	; 94
	.db #0x04	; 4
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0x76	; 118	'v'
	.db #0x01	; 1
	.db #0x57	; 87	'W'
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x6c	; 108	'l'
	.db #0x02	; 2
	.db #0x49	; 73	'I'
	.db #0x04	; 4
	.db #0x85	; 133
	.db #0x04	; 4
	.db #0x7a	; 122	'z'
	.db #0x01	; 1
	.db #0x36	; 54	'6'
	.db #0x02	; 2
	.db #0x6e	; 110	'n'
	.db #0x04	; 4
	.db #0x5a	; 90	'Z'
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x10	; 16
	.area _INITIALIZER
	.area _CABS (ABS)
