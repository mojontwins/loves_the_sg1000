;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Thu Oct 25 09:58:32 2018
;--------------------------------------------------------
	.module SGlib
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SG_setReg
	.globl _VDPReg
	.globl _VDPType
	.globl _gpit
	.globl _first_sprite
	.globl _SpriteTableEnd
	.globl _stp
	.globl _SpriteTable
	.globl _PreviousKeysStatus
	.globl _KeysStatus
	.globl _PauseRequested
	.globl _VDPBlank
	.globl _VDPReg_init
	.globl _SG_VDPturnOnFeature
	.globl _SG_VDPturnOffFeature
	.globl _SG_init
	.globl _SG_setBackdropColor
	.globl _SG_setSpriteMode
	.globl _SG_loadTilePatterns
	.globl _SG_loadTileColours
	.globl _SG_loadSpritePatterns
	.globl _SG_setTileatXY
	.globl _SG_setNextTileatXY
	.globl _SG_setTile
	.globl _SG_fillTile
	.globl _SG_loadTileMapArea
	.globl _SG_initSprites
	.globl _SG_addSprite
	.globl _SG_addMetaSprite1x1
	.globl _SG_addMetaSprite
	.globl _SG_finalizeSprites
	.globl _SG_getStp
	.globl _SG_setStp
	.globl _SG_copySpritestoSAT
	.globl _SG_waitForVBlank
	.globl _SG_getKeysStatus
	.globl _SG_queryPauseRequested
	.globl _SG_resetPauseRequest
	.globl _SG_VRAMmemset
	.globl _UNSAFE_SG_copySpritestoSAT
	.globl _UNSAFE_SG_VRAMmemcpy128
	.globl _SG_isr
	.globl _SG_nmi_isr
	.globl _SMS_VDPType
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_VDPControlPort	=	0x00bf
_VDPStatusPort	=	0x00bf
_VDPDataPort	=	0x00be
_VDPVCounterPort	=	0x007e
_VDPHCounterPort	=	0x007f
_IOPortL	=	0x00dc
_IOPortH	=	0x00dd
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_VDPBlank::
	.ds 1
_PauseRequested::
	.ds 1
_KeysStatus::
	.ds 2
_PreviousKeysStatus::
	.ds 2
_SpriteTable::
	.ds 128
_stp::
	.ds 2
_SpriteTableEnd::
	.ds 2
_first_sprite::
	.ds 1
_gpit::
	.ds 1
_VDPType::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_VDPReg::
	.ds 2
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
;lib/SGlib.c:167: void SG_setReg (unsigned char reg, unsigned char v) {
;	---------------------------------
; Function SG_setReg
; ---------------------------------
_SG_setReg::
;lib/SGlib.c:168: VDPReg [reg] = v;
	ld	a,#<(_VDPReg)
	ld	hl,#2
	add	hl,sp
	add	a, (hl)
	ld	e,a
	ld	a,#>(_VDPReg)
	adc	a, #0x00
	ld	d,a
	ld	iy,#3
	add	iy,sp
	ld	a,0 (iy)
	ld	(de),a
;lib/SGlib.c:169: SG_write_to_VDPRegister (reg, v);
	di 
	ld	a,0 (iy)
	out	(_VDPControlPort),a
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	set	7, a
	out	(_VDPControlPort),a
	ei 
	ret
_VDPReg_init:
	.db #0x02	; 2
	.db #0xA0	; 160
	.db #0x06	; 6
	.db #0xFF	; 255
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0x07	; 7
	.db #0x01	; 1
;lib/SGlib.c:172: void SG_VDPturnOnFeature (unsigned int feature) {
;	---------------------------------
; Function SG_VDPturnOnFeature
; ---------------------------------
_SG_VDPturnOnFeature::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;lib/SGlib.c:174: VDPReg [HI (feature)] |= LO (feature);
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#_VDPReg
	add	hl,de
	ld	c,(hl)
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	b,#0x00
	ld	a,c
	or	a, -2 (ix)
	ld	c,a
	ld	a,b
	or	a, -1 (ix)
	ld	b,a
	ld	(hl),c
;lib/SGlib.c:175: SG_write_to_VDPRegister (HI (feature), VDPReg [HI (feature)]);
	di 
	ld	a,c
	out	(_VDPControlPort),a
	ld	a,e
	set	7, a
	ld	h,a
	out	(_VDPControlPort),a
	ei 
	ld	sp, ix
	pop	ix
	ret
;lib/SGlib.c:178: void SG_VDPturnOffFeature (unsigned int feature) {
;	---------------------------------
; Function SG_VDPturnOffFeature
; ---------------------------------
_SG_VDPturnOffFeature::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;lib/SGlib.c:180: VDPReg [HI (feature)] &= ~LO (feature);
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#_VDPReg
	add	hl,de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	b,(hl)
	ld	a, 4 (ix)
	cpl
	ld	c,a
	ld	a,b
	and	a, c
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),b
;lib/SGlib.c:181: SG_write_to_VDPRegister (HI (feature), VDPReg [HI (feature)]);
	di 
	ld	a,b
	out	(_VDPControlPort),a
	ld	a,e
	set	7, a
	ld	h,a
	out	(_VDPControlPort),a
	ei 
	ld	sp, ix
	pop	ix
	ret
;lib/SGlib.c:199: void SG_init (void) {
;	---------------------------------
; Function SG_init
; ---------------------------------
_SG_init::
;lib/SGlib.c:200: for (gpit = 0; gpit < 8; gpit++)
	ld	iy,#_gpit
	ld	0 (iy),#0x00
	ld	de,#_VDPReg_init+0
00112$:
;lib/SGlib.c:201: SG_write_to_VDPRegister (gpit, VDPReg_init [gpit]);
	di 
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	out	(_VDPControlPort),a
	ld	iy,#_gpit
	ld	a,0 (iy)
	set	7, a
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:200: for (gpit = 0; gpit < 8; gpit++)
	ld	iy,#_gpit
	inc	0 (iy)
	ld	iy,#_gpit
	ld	a,0 (iy)
	sub	a, #0x08
	jr	C,00112$
;lib/SGlib.c:204: first_sprite = 0;
	ld	hl,#_first_sprite + 0
	ld	(hl), #0x00
;lib/SGlib.c:205: SpriteTableEnd = SpriteTable + 128;
	ld	hl,#_SpriteTable+128
	ld	(_SpriteTableEnd),hl
;lib/SGlib.c:208: SG_initSprites ();
	call	_SG_initSprites
;lib/SGlib.c:209: SG_finalizeSprites ();
	call	_SG_finalizeSprites
;lib/SGlib.c:210: UNSAFE_SG_copySpritestoSAT ();
	call	_UNSAFE_SG_copySpritestoSAT
;lib/SGlib.c:187: while (VDPVCounterPort!=0x80);      // wait for line 0x80
00102$:
	in	a,(_VDPVCounterPort)
	sub	a, #0x80
	jr	NZ,00102$
;lib/SGlib.c:188: new_value=VDPVCounterPort;
	in	a,(_VDPVCounterPort)
	ld	h,a
;lib/SGlib.c:189: do {
00105$:
;lib/SGlib.c:190: old_value=new_value;              // wait until VCounter 'goes back'
	ld	d,h
;lib/SGlib.c:191: new_value=VDPVCounterPort;
	in	a,(_VDPVCounterPort)
;lib/SGlib.c:192: } while (old_value<=new_value);
	ld	h,a
	sub	a, d
	jr	NC,00105$
;lib/SGlib.c:193: if (old_value>=0xE7)
	ld	a,d
	sub	a, #0xE7
	jr	C,00109$
;lib/SGlib.c:194: VDPType=VDP_PAL;                  // old value should be 0xF2
	ld	hl,#_VDPType + 0
	ld	(hl), #0x80
	ret
00109$:
;lib/SGlib.c:196: VDPType=VDP_NTSC;                 // old value should be 0xDA
	ld	hl,#_VDPType + 0
	ld	(hl), #0x40
;lib/SGlib.c:212: SMS_detect_VDP_type();
	ret
;lib/SGlib.c:215: void SG_setBackdropColor (unsigned char entry) {
;	---------------------------------
; Function SG_setBackdropColor
; ---------------------------------
_SG_setBackdropColor::
;lib/SGlib.c:216: SG_write_to_VDPRegister (0x07, entry & 0x0f);
	di 
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	and	a, #0x0F
	out	(_VDPControlPort),a
	ld	a,#0x87
	out	(_VDPControlPort),a
	ei 
	ret
;lib/SGlib.c:219: void SG_setSpriteMode (unsigned char mode) {
;	---------------------------------
; Function SG_setSpriteMode
; ---------------------------------
_SG_setSpriteMode::
;lib/SGlib.c:220: if (mode & SG_SPRITEMODE_LARGE) {
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	rrca
	jr	NC,00102$
;lib/SGlib.c:221: SG_VDPturnOnFeature (SG_VDPFEATURE_USELARGESPRITES);
	ld	hl,#0x0102
	push	hl
	call	_SG_VDPturnOnFeature
	pop	af
	jr	00103$
00102$:
;lib/SGlib.c:223: SG_VDPturnOffFeature (SG_VDPFEATURE_USELARGESPRITES);
	ld	hl,#0x0102
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
00103$:
;lib/SGlib.c:225: if (mode & SG_SPRITEMODE_ZOOMED) {
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x02
	jr	Z,00105$
;lib/SGlib.c:226: SG_VDPturnOnFeature (SG_VDPFEATURE_ZOOMSPRITES);
	ld	hl,#0x0101
	push	hl
	call	_SG_VDPturnOnFeature
	pop	af
	ret
00105$:
;lib/SGlib.c:228: SG_VDPturnOffFeature (SG_VDPFEATURE_ZOOMSPRITES);
	ld	hl,#0x0101
	push	hl
	call	_SG_VDPturnOffFeature
	pop	af
	ret
;lib/SGlib.c:233: void SG_loadTilePatterns (void *src, unsigned int tilefrom, unsigned int size) {
;	---------------------------------
; Function SG_loadTilePatterns
; ---------------------------------
_SG_loadTilePatterns::
	push	ix
	ld	ix,#0
	add	ix,sp
;lib/SGlib.c:234: SG_set_address_VRAM (PGTADDRESS + (tilefrom << 3));
	di 
	ld	a,6 (ix)
	rlca
	rlca
	rlca
	and	a,#0xF8
	out	(_VDPControlPort),a
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	d,#0x00
	ld	a,h
	set	6, a
	ld	l,a
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:235: SG_byte_array_to_VDP_data (src, size);
	ld	c,8 (ix)
	ld	b,9 (ix)
	ld	e,4 (ix)
	ld	d,5 (ix)
;lib/SGlib.c:148: do {
00101$:
;lib/SGlib.c:149: VDPDataPort = *(data ++);
	ld	a,(de)
	out	(_VDPDataPort),a
	inc	de
;lib/SGlib.c:150: } while (-- size);
	ld	l,c
	ld	h,b
	dec	hl
	ld	c, l
	ld	a,h
	ld	b,a
	or	a,l
	jr	NZ,00101$
;lib/SGlib.c:235: SG_byte_array_to_VDP_data (src, size);
	pop	ix
	ret
;lib/SGlib.c:238: void SG_loadTileColours (void *src, unsigned int tilefrom, unsigned int size) {
;	---------------------------------
; Function SG_loadTileColours
; ---------------------------------
_SG_loadTileColours::
	push	ix
	ld	ix,#0
	add	ix,sp
;lib/SGlib.c:239: SG_set_address_VRAM (CGTADDRESS + (tilefrom << 3));
	di 
	ld	a,6 (ix)
	rlca
	rlca
	rlca
	and	a,#0xF8
	out	(_VDPControlPort),a
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#0x2000
	add	hl,bc
	ld	d,#0x00
	ld	a,h
	set	6, a
	ld	l,a
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:240: SG_byte_array_to_VDP_data (src, size);
	ld	c,8 (ix)
	ld	b,9 (ix)
	ld	e,4 (ix)
	ld	d,5 (ix)
;lib/SGlib.c:148: do {
00101$:
;lib/SGlib.c:149: VDPDataPort = *(data ++);
	ld	a,(de)
	out	(_VDPDataPort),a
	inc	de
;lib/SGlib.c:150: } while (-- size);
	ld	l,c
	ld	h,b
	dec	hl
	ld	c, l
	ld	a,h
	ld	b,a
	or	a,l
	jr	NZ,00101$
;lib/SGlib.c:240: SG_byte_array_to_VDP_data (src, size);
	pop	ix
	ret
;lib/SGlib.c:243: void SG_loadSpritePatterns (void *src, unsigned int tilefrom, unsigned int size) {
;	---------------------------------
; Function SG_loadSpritePatterns
; ---------------------------------
_SG_loadSpritePatterns::
	push	ix
	ld	ix,#0
	add	ix,sp
;lib/SGlib.c:244: SG_set_address_VRAM (SGTADDRESS + (tilefrom << 3));
	di 
	ld	a,6 (ix)
	rlca
	rlca
	rlca
	and	a,#0xF8
	out	(_VDPControlPort),a
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#0x3800
	add	hl,bc
	ld	d,#0x00
	ld	a,h
	set	6, a
	ld	l,a
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:245: SG_byte_array_to_VDP_data (src, size);
	ld	c,8 (ix)
	ld	b,9 (ix)
	ld	e,4 (ix)
	ld	d,5 (ix)
;lib/SGlib.c:148: do {
00101$:
;lib/SGlib.c:149: VDPDataPort = *(data ++);
	ld	a,(de)
	out	(_VDPDataPort),a
	inc	de
;lib/SGlib.c:150: } while (-- size);
	ld	l,c
	ld	h,b
	dec	hl
	ld	c, l
	ld	a,h
	ld	b,a
	or	a,l
	jr	NZ,00101$
;lib/SGlib.c:245: SG_byte_array_to_VDP_data (src, size);
	pop	ix
	ret
;lib/SGlib.c:248: void SG_setTileatXY (unsigned char x, unsigned char y, unsigned char tile) {
;	---------------------------------
; Function SG_setTileatXY
; ---------------------------------
_SG_setTileatXY::
	push	ix
	ld	ix,#0
	add	ix,sp
;lib/SGlib.c:249: SG_set_address_VRAM (PNTADDRESS + (y << 5) + x);
	di 
	ld	a,5 (ix)
	rrca
	rrca
	rrca
	and	a,#0xE0
	add	a, 4 (ix)
	out	(_VDPControlPort),a
	ld	l,5 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#0x1800
	add	hl,bc
	ld	e,4 (ix)
	ld	d,#0x00
	add	hl,de
	ld	e, h
	ld	a,e
	rlc	a
	sbc	a, a
	ld	d,a
	ld	a,e
	set	6, a
	ld	h,a
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:250: SG_byte_to_VDP_data (tile);
	ld	a,6 (ix)
	out	(_VDPDataPort),a
	pop	ix
	ret
;lib/SGlib.c:253: void SG_setNextTileatXY (unsigned char x, unsigned char y) {
;	---------------------------------
; Function SG_setNextTileatXY
; ---------------------------------
_SG_setNextTileatXY::
	push	ix
	ld	ix,#0
	add	ix,sp
;lib/SGlib.c:254: SG_set_address_VRAM (PNTADDRESS + (y << 5) + x);
	di 
	ld	a,5 (ix)
	rrca
	rrca
	rrca
	and	a,#0xE0
	add	a, 4 (ix)
	out	(_VDPControlPort),a
	ld	l,5 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#0x1800
	add	hl,bc
	ld	e,4 (ix)
	ld	d,#0x00
	add	hl,de
	ld	e, h
	ld	a,e
	rlc	a
	sbc	a, a
	ld	d,a
	ld	a,e
	set	6, a
	ld	h,a
	out	(_VDPControlPort),a
	ei 
	pop	ix
	ret
;lib/SGlib.c:257: void SG_setTile (unsigned char tile) {
;	---------------------------------
; Function SG_setTile
; ---------------------------------
_SG_setTile::
;lib/SGlib.c:258: SG_byte_to_VDP_data (tile);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	out	(_VDPDataPort),a
	ret
;lib/SGlib.c:261: void SG_fillTile (unsigned char tile, unsigned char count) {
;	---------------------------------
; Function SG_fillTile
; ---------------------------------
_SG_fillTile::
;lib/SGlib.c:262: while (count --) SG_byte_to_VDP_data (tile);
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
	ld	hl, #3+0
	add	hl, sp
	ld	e, (hl)
00101$:
	ld	b,e
	dec	e
	ld	a,b
	or	a, a
	ret	Z
;lib/SGlib.c:143: VDPDataPort = data;
	ld	a,d
	out	(_VDPDataPort),a
;lib/SGlib.c:262: while (count --) SG_byte_to_VDP_data (tile);
	jr	00101$
;lib/SGlib.c:265: void SG_loadTileMapArea (unsigned char x, unsigned char y,	void *src, unsigned char width, unsigned char height) {
;	---------------------------------
; Function SG_loadTileMapArea
; ---------------------------------
_SG_loadTileMapArea::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;lib/SGlib.c:266: for (gpit = y; gpit < (y + height); gpit ++) {
	ld	a,5 (ix)
	ld	(#_gpit + 0),a
	ld	a,8 (ix)
	ld	-2 (ix),a
00107$:
	ld	l,5 (ix)
	ld	h,#0x00
	ld	e,9 (ix)
	ld	d,#0x00
	add	hl,de
	ld	e,l
	ld	d,h
	ld	iy,#_gpit
	ld	c,0 (iy)
	ld	b,#0x00
	ld	a,c
	sub	a, e
	ld	a,b
	sbc	a, d
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	jp	P,00109$
;lib/SGlib.c:267: SG_set_address_VRAM (PNTADDRESS+ (gpit << 5) + x);
	di 
	ld	iy,#_gpit
	ld	a,0 (iy)
	rrca
	rrca
	rrca
	and	a,#0xE0
	add	a, 4 (ix)
	out	(_VDPControlPort),a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#0x1800
	add	hl,bc
	ld	e,4 (ix)
	ld	d,#0x00
	add	hl,de
	ld	e, h
	ld	a,e
	rlc	a
	sbc	a, a
	ld	d,a
	ld	a,e
	set	6, a
	ld	h,a
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:268: SG_byte_brief_array_to_VDP_data (src, width);
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	e, c
	ld	d, b
	ld	a,-2 (ix)
	ld	-1 (ix),a
;lib/SGlib.c:155: do {
00102$:
;lib/SGlib.c:156: VDPDataPort = *(data ++);
	ld	a,(de)
	out	(_VDPDataPort),a
	inc	de
;lib/SGlib.c:157: } while (-- size);
	ld	a,-1 (ix)
	add	a,#0xFF
	ld	-1 (ix),a
	or	a, a
	jr	NZ,00102$
;lib/SGlib.c:269: src = (unsigned char *) src + width;
	ld	l,-2 (ix)
	ld	h,#0x00
	add	hl,bc
	ld	6 (ix),l
	ld	7 (ix),h
;lib/SGlib.c:266: for (gpit = y; gpit < (y + height); gpit ++) {
	ld	hl, #_gpit+0
	inc	(hl)
	jp	00107$
00109$:
	ld	sp, ix
	pop	ix
	ret
;lib/SGlib.c:274: void SG_initSprites (void) { 
;	---------------------------------
; Function SG_initSprites
; ---------------------------------
_SG_initSprites::
;lib/SGlib.c:275: for (gpit = 0; gpit < 128; gpit += 4) SpriteTable [gpit] = 0xd0;
	ld	hl,#_gpit + 0
	ld	(hl), #0x00
	ld	de,#_SpriteTable+0
00102$:
	ld	hl,(_gpit)
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0xD0
	ld	hl, #_gpit+0
	inc	(hl)
	ld	hl, #_gpit+0
	inc	(hl)
	ld	hl, #_gpit+0
	inc	(hl)
	ld	hl, #_gpit+0
	inc	(hl)
	ld	a,(#_gpit + 0)
	sub	a, #0x80
	jr	C,00102$
;lib/SGlib.c:276: stp = SpriteTable + (first_sprite << 2);
	ld	iy,#_first_sprite
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl,de
	ld	(_stp),hl
;lib/SGlib.c:277: ++ first_sprite; first_sprite &= 31;
	ld	hl, #_first_sprite+0
	inc	(hl)
	ld	a,(#_first_sprite + 0)
	and	a, #0x1F
	ld	(#_first_sprite + 0),a
	ret
;lib/SGlib.c:280: void SG_addSprite (unsigned char x, unsigned char y, unsigned char tile, unsigned char attr) {
;	---------------------------------
; Function SG_addSprite
; ---------------------------------
_SG_addSprite::
;lib/SGlib.c:281: *stp ++ = y;
	ld	hl,(_stp)
	ld	iy,#3
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00109$
	ld	hl, #_stp+1
	inc	(hl)
00109$:
;lib/SGlib.c:282: *stp ++ = x;
	ld	hl,(_stp)
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00110$
	ld	hl, #_stp+1
	inc	(hl)
00110$:
;lib/SGlib.c:283: *stp ++ = tile;
	ld	hl,(_stp)
	ld	iy,#4
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00111$
	ld	hl, #_stp+1
	inc	(hl)
00111$:
;lib/SGlib.c:284: *stp ++ = attr;
	ld	hl,(_stp)
	ld	iy,#5
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00112$
	ld	hl, #_stp+1
	inc	(hl)
00112$:
;lib/SGlib.c:285: stp += 4 * AUTOCYCLE_PRIME; if (stp > SpriteTableEnd) stp -= 128;
	ld	hl,#_stp
	ld	a,(hl)
	add	a, #0x1C
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	hl,#_SpriteTableEnd
	ld	a,(hl)
	ld	iy,#_stp
	sub	a, 0 (iy)
	inc	hl
	ld	a,(hl)
	ld	iy,#_stp
	sbc	a, 1 (iy)
	ret	NC
	ld	hl,#_stp
	ld	a,(hl)
	add	a,#0x80
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
	ret
;lib/SGlib.c:288: void SG_addMetaSprite1x1 (unsigned char x, unsigned char y, const unsigned char *mt) {
;	---------------------------------
; Function SG_addMetaSprite1x1
; ---------------------------------
_SG_addMetaSprite1x1::
	push	ix
	ld	ix,#0
	add	ix,sp
;lib/SGlib.c:289: mt += 2; 
	ld	a,6 (ix)
	add	a, #0x02
	ld	6 (ix),a
	ld	a,7 (ix)
	adc	a, #0x00
	ld	7 (ix),a
;lib/SGlib.c:290: *stp ++ = y;
	ld	hl,(_stp)
	ld	a,5 (ix)
	ld	(hl),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00121$
	ld	hl, #_stp+1
	inc	(hl)
00121$:
;lib/SGlib.c:291: *stp ++ = x;
	ld	hl,(_stp)
	ld	a,4 (ix)
	ld	(hl),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00122$
	ld	hl, #_stp+1
	inc	(hl)
00122$:
;lib/SGlib.c:292: *stp ++ = *mt ++;
	ld	de,(_stp)
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	b,(hl)
	inc	hl
	ld	6 (ix),l
	ld	7 (ix),h
	ld	a,b
	ld	(de),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00123$
	ld	hl, #_stp+1
	inc	(hl)
00123$:
;lib/SGlib.c:293: *stp ++ = *mt ++;
	ld	de,(_stp)
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	b,(hl)
	inc	hl
	ld	6 (ix),l
	ld	7 (ix),h
	ld	a,b
	ld	(de),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00124$
	ld	hl, #_stp+1
	inc	(hl)
00124$:
;lib/SGlib.c:294: stp += 4 * AUTOCYCLE_PRIME; if (stp > SpriteTableEnd) stp -= 128;
	ld	hl,#_stp
	ld	a,(hl)
	add	a, #0x1C
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	hl,#_SpriteTableEnd
	ld	a,(hl)
	ld	iy,#_stp
	sub	a, 0 (iy)
	inc	hl
	ld	a,(hl)
	ld	iy,#_stp
	sbc	a, 1 (iy)
	jr	NC,00102$
	ld	hl,#_stp
	ld	a,(hl)
	add	a,#0x80
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
00102$:
;lib/SGlib.c:296: if (*mt == 0x80) return;
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	a,(hl)
	sub	a, #0x80
	jp	Z,00107$
	jr	00104$
	jp	00107$
00104$:
;lib/SGlib.c:298: mt += 2; 
	inc	hl
	inc	hl
	ld	6 (ix),l
	ld	7 (ix),h
;lib/SGlib.c:299: *stp ++ = y;
	ld	hl,(_stp)
	ld	a,5 (ix)
	ld	(hl),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00127$
	ld	hl, #_stp+1
	inc	(hl)
00127$:
;lib/SGlib.c:300: *stp ++ = x;
	ld	hl,(_stp)
	ld	a,4 (ix)
	ld	(hl),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00128$
	ld	hl, #_stp+1
	inc	(hl)
00128$:
;lib/SGlib.c:301: *stp ++ = *mt ++;
	ld	de,(_stp)
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	b,(hl)
	inc	hl
	ld	6 (ix),l
	ld	7 (ix),h
	ld	a,b
	ld	(de),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00129$
	ld	hl, #_stp+1
	inc	(hl)
00129$:
;lib/SGlib.c:302: *stp ++ = *mt ++;
	ld	de,(_stp)
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	a,(hl)
	ld	(de),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00130$
	ld	hl, #_stp+1
	inc	(hl)
00130$:
;lib/SGlib.c:303: stp += 4 * AUTOCYCLE_PRIME; if (stp > SpriteTableEnd) stp -= 128;
	ld	hl,#_stp
	ld	a,(hl)
	add	a, #0x1C
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	hl,#_SpriteTableEnd
	ld	a,(hl)
	ld	iy,#_stp
	sub	a, 0 (iy)
	inc	hl
	ld	a,(hl)
	ld	iy,#_stp
	sbc	a, 1 (iy)
	jr	NC,00107$
	ld	hl,#_stp
	ld	a,(hl)
	add	a,#0x80
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
00107$:
	pop	ix
	ret
;lib/SGlib.c:306: void SG_addMetaSprite (unsigned char x, unsigned char y, const unsigned char *mt) {
;	---------------------------------
; Function SG_addMetaSprite
; ---------------------------------
_SG_addMetaSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
;lib/SGlib.c:307: while (0x80 != (*stp = *mt ++)) {
00103$:
	ld	de,(_stp)
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	b,(hl)
	inc	hl
	ld	6 (ix),l
	ld	7 (ix),h
	ld	a,b
	ld	(de),a
	ld	a,b
	sub	a, #0x80
	jp	Z,00106$
	ld	hl,(_stp)
;lib/SGlib.c:308: *stp += y; stp ++;
	ld	a, (hl)
	add	a, 5 (ix)
	ld	(hl),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00121$
	ld	hl, #_stp+1
	inc	(hl)
00121$:
;lib/SGlib.c:309: *stp ++ = x + *mt++;
	ld	de,(_stp)
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	b,(hl)
	inc	hl
	ld	6 (ix),l
	ld	7 (ix),h
	ld	a,4 (ix)
	add	a, b
	ld	(de),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00122$
	ld	hl, #_stp+1
	inc	(hl)
00122$:
;lib/SGlib.c:310: *stp ++ = *mt ++;
	ld	de,(_stp)
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	b,(hl)
	inc	hl
	ld	6 (ix),l
	ld	7 (ix),h
	ld	a,b
	ld	(de),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00123$
	ld	hl, #_stp+1
	inc	(hl)
00123$:
;lib/SGlib.c:311: *stp ++ = *mt ++;
	ld	de,(_stp)
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	b,(hl)
	inc	hl
	ld	6 (ix),l
	ld	7 (ix),h
	ld	a,b
	ld	(de),a
	ld	hl, #_stp+0
	inc	(hl)
	jr	NZ,00124$
	ld	hl, #_stp+1
	inc	(hl)
00124$:
;lib/SGlib.c:312: stp += 4 * AUTOCYCLE_PRIME; if (stp > SpriteTableEnd) stp -= 128;
	ld	hl,#_stp
	ld	a,(hl)
	add	a, #0x1C
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
	ld	hl,#_SpriteTableEnd
	ld	a,(hl)
	ld	iy,#_stp
	sub	a, 0 (iy)
	inc	hl
	ld	a,(hl)
	ld	iy,#_stp
	sbc	a, 1 (iy)
	jp	NC,00103$
	ld	hl,#_stp
	ld	a,(hl)
	add	a,#0x80
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
	jp	00103$
00106$:
	pop	ix
	ret
;lib/SGlib.c:316: void SG_finalizeSprites (void) {
;	---------------------------------
; Function SG_finalizeSprites
; ---------------------------------
_SG_finalizeSprites::
;lib/SGlib.c:318: }
	ret
;lib/SGlib.c:320: unsigned char *SG_getStp (void) {
;	---------------------------------
; Function SG_getStp
; ---------------------------------
_SG_getStp::
;lib/SGlib.c:321: return stp;
	ld	hl,(_stp)
	ret
;lib/SGlib.c:324: void SG_setStp (unsigned char *s) {
;	---------------------------------
; Function SG_setStp
; ---------------------------------
_SG_setStp::
;lib/SGlib.c:325: stp = s;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	(#_stp + 0),a
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_stp + 1),a
	ret
;lib/SGlib.c:367: void SG_copySpritestoSAT (void) {
;	---------------------------------
; Function SG_copySpritestoSAT
; ---------------------------------
_SG_copySpritestoSAT::
;lib/SGlib.c:368: SG_set_address_VRAM (SATADDRESS);
	di 
	ld	a,#0x00
	out	(_VDPControlPort),a
	ld	a,#0x5B
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:369: SG_byte_brief_array_to_VDP_data (SpriteTable, MAXSPRITES*4);
	ld	de,#_SpriteTable
	ld	b,#0x80
;lib/SGlib.c:155: do {
00101$:
;lib/SGlib.c:156: VDPDataPort = *(data ++);
	ld	a,(de)
	out	(_VDPDataPort),a
	inc	de
;lib/SGlib.c:157: } while (-- size);
	djnz	00101$
;lib/SGlib.c:369: SG_byte_brief_array_to_VDP_data (SpriteTable, MAXSPRITES*4);
	ret
;lib/SGlib.c:372: void SG_waitForVBlank (void) {
;	---------------------------------
; Function SG_waitForVBlank
; ---------------------------------
_SG_waitForVBlank::
;lib/SGlib.c:373: VDPBlank = false;
	ld	hl,#_VDPBlank + 0
	ld	(hl), #0x00
;lib/SGlib.c:374: while (!VDPBlank);
00101$:
	ld	hl,#_VDPBlank+0
	bit	0, (hl)
	jr	Z,00101$
	ret
;lib/SGlib.c:377: unsigned int SG_getKeysStatus (void) {
;	---------------------------------
; Function SG_getKeysStatus
; ---------------------------------
_SG_getKeysStatus::
;lib/SGlib.c:378: return (KeysStatus);
	ld	hl,(_KeysStatus)
	ret
;lib/SGlib.c:381: _Bool SG_queryPauseRequested (void) {
;	---------------------------------
; Function SG_queryPauseRequested
; ---------------------------------
_SG_queryPauseRequested::
;lib/SGlib.c:382: return (PauseRequested);
	ld	iy,#_PauseRequested
	ld	l,0 (iy)
	ret
;lib/SGlib.c:385: void SG_resetPauseRequest (void) {
;	---------------------------------
; Function SG_resetPauseRequest
; ---------------------------------
_SG_resetPauseRequest::
;lib/SGlib.c:386: PauseRequested = false;
	ld	hl,#_PauseRequested + 0
	ld	(hl), #0x00
	ret
;lib/SGlib.c:390: void SG_VRAMmemset (unsigned int dst, unsigned char value, unsigned int size) {
;	---------------------------------
; Function SG_VRAMmemset
; ---------------------------------
_SG_VRAMmemset::
;lib/SGlib.c:391: SG_set_address_VRAM (dst);
	di 
	ld	iy,#2
	add	iy,sp
	ld	a, 0 (iy)
	out	(_VDPControlPort),a
	ld	a, 1 (iy)
	ld	l, #0x00
	set	6, a
	ld	h,a
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:392: while (size>0) {
	ld	hl, #4+0
	add	hl, sp
	ld	d, (hl)
	ld	hl, #5
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
00101$:
	ld	a,b
	or	a,c
	ret	Z
;lib/SGlib.c:143: VDPDataPort = data;
	ld	a,d
	out	(_VDPDataPort),a
;lib/SGlib.c:394: size--;
	dec	bc
	jr	00101$
;lib/SGlib.c:401: void UNSAFE_SG_copySpritestoSAT (void) {
;	---------------------------------
; Function UNSAFE_SG_copySpritestoSAT
; ---------------------------------
_UNSAFE_SG_copySpritestoSAT::
;lib/SGlib.c:402: SG_set_address_VRAM (SATADDRESS);
	di 
	ld	a,#0x00
	out	(_VDPControlPort),a
	ld	a,#0x5B
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:411: __endasm;
	ld c,#_VDPDataPort
	ld hl,#_SpriteTable
	call _outi_block-32*4*2
	ret
;lib/SGlib.c:414: void UNSAFE_SG_VRAMmemcpy128 (unsigned int dst, void *src) {
;	---------------------------------
; Function UNSAFE_SG_VRAMmemcpy128
; ---------------------------------
_UNSAFE_SG_VRAMmemcpy128::
;lib/SGlib.c:415: SG_set_address_VRAM (dst);
	di 
	ld	iy,#2
	add	iy,sp
	ld	a, 0 (iy)
	out	(_VDPControlPort),a
	ld	a, 1 (iy)
	ld	l, #0x00
	set	6, a
	ld	h,a
	out	(_VDPControlPort),a
	ei 
;lib/SGlib.c:421: __endasm;
	ld c,#_VDPDataPort
	ld l, 2 (iy)
	ld h, 3 (iy)
	call _outi_block-128*2
	ret
;lib/SGlib.c:426: void SG_isr (void) __interrupt {
;	---------------------------------
; Function SG_isr
; ---------------------------------
_SG_isr::
	push	af
	push	bc
	push	de
	push	hl
	push	iy
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;lib/SGlib.c:427: volatile unsigned char VDPStatus = VDPStatusPort;	/* this also aknowledge interrupt at VDP */
	in	a,(_VDPStatusPort)
	ld	-1 (ix),a
;lib/SGlib.c:432: if (VDPStatus & 0x80) {
	bit	7, -1 (ix)
	jr	Z,00102$
;lib/SGlib.c:433: VDPBlank = true;				 /* frame interrupt */
	ld	hl,#_VDPBlank + 0
	ld	(hl), #0x01
;lib/SGlib.c:435: PreviousKeysStatus = KeysStatus;
	ld	hl,(_KeysStatus)
	ld	(_PreviousKeysStatus),hl
;lib/SGlib.c:436: KeysStatus = ~ (( (IOPortH)<<8)|IOPortL);
	in	a,(_IOPortH)
	ld	b,a
	ld	c,#0x00
	in	a,(_IOPortL)
	ld	l,a
	ld	h,#0x00
	ld	a,c
	or	a, l
	ld	d,a
	ld	a,b
	or	a, h
	ld	e,a
	ld	a,d
	cpl
	ld	iy,#_KeysStatus
	ld	0 (iy),a
	ld	a,e
	cpl
	ld	iy,#_KeysStatus
	ld	1 (iy),a
00102$:
;lib/SGlib.c:439: ENABLE_INTERRUPTS;
	ei 
	inc	sp
	pop	ix
	pop	iy
	pop	hl
	pop	de
	pop	bc
	pop	af
	reti
;lib/SGlib.c:442: void SG_nmi_isr (void) __critical __interrupt {		/* this is for NMI */
;	---------------------------------
; Function SG_nmi_isr
; ---------------------------------
_SG_nmi_isr::
	push	af
	push	bc
	push	de
	push	hl
	push	iy
;lib/SGlib.c:443: PauseRequested = true;
	ld	hl,#_PauseRequested + 0
	ld	(hl), #0x01
	pop	iy
	pop	hl
	pop	de
	pop	bc
	pop	af
	retn
;lib/SGlib.c:446: unsigned char SMS_VDPType (void) {
;	---------------------------------
; Function SMS_VDPType
; ---------------------------------
_SMS_VDPType::
;lib/SGlib.c:447: return VDPType;
	ld	iy,#_VDPType
	ld	l,0 (iy)
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__VDPReg:
	.db #0x02	; 2
	.db #0xA0	; 160
	.area _CABS (ABS)
