/* **************************************************
	 SGlib - C programming library for the SEGA SG-1000
	 ( part of devkitSMS - github.com/sverx/devkitSMS )
	 code: na_th_an, sverx
	 ************************************************** */

// WARNING! Modified, trimmed, cut-downversion for this project.
// Please download the full version from github.com/sverx/devkitSMS

#define AUTOCYCLE_SPRITES				// Sprites cycle automaticly
#define AUTOCYCLE_PRIME			7		// Prime to 32.
#define AUTODETECT_ONE_COLOUR			// Detect 1 colour sprites in SG_addMetaSprite1x1

#include "SGlib.h"

//#include <stdbool.h>
#define true 1
#define false 0
#define bool _Bool
#define __bool_true_false_are_defined 1

/* define VDPControlPort (SDCC z80 syntax) */
__sfr __at 0xBF VDPControlPort;
/* define VDPStatusPort */
__sfr __at 0xBF VDPStatusPort;
/* define VDPDataPort */
__sfr __at 0xBE VDPDataPort;
/* define VDPVcounter */
__sfr __at 0x7E VDPVCounterPort;
/* define VDPHcounter */
__sfr __at 0x7F VDPHCounterPort;
/* define IOPort (joypad) */
__sfr __at 0xDC IOPortL;
/* define IOPort (joypad) */
__sfr __at 0xDD IOPortH;

#define HI(x)					((x)>>8)
#define LO(x)					((x)&0xFF)

#ifndef MAXSPRITES
#define MAXSPRITES 				32
#endif

#define DISABLE_INTERRUPTS		__asm di __endasm
#define ENABLE_INTERRUPTS		__asm ei __endasm

#define WAIT_VRAM				__asm 	nop \
										nop \
										nop __endasm

/*
    SG1000 VRAM memory map:

        $0000   +--------+
                |   PG   |  ($1800 bytes, pattern generator table)
        $1800   +--------+
                |   PN   |  ($0300 bytes, nametable)
        $1B00   +--------+
                |   SA   |  ($0080 bytes, sprite attribute table)
        $1B80   +--------+
                |        |  ($0480 bytes free)
        $2000   +--------+
                |   CT   |  ($1800 bytes, colour table)
        $3800   +--------+
                |   SG   |  ($0800 bytes, sprite generator table)
                +--------+
*/

#define PNTADDRESS			0x1800
#define SATADDRESS 			0x1B00
#define PGTADDRESS 			0x0000
#define CGTADDRESS			0x2000
#define SGTADDRESS			0x3800

/* the VDP registers initialization value */
const unsigned char VDPReg_init [8] = {
	0x02,	// Mode2
	0xa0,	// 16KB, screen off, VBlank IRQ, sprite 8x8, no zoom
	0x06,	// PN bits 13-10 = 0 1 1 0			(address = $1800)
	0xff,	// CT bits 13-7	= 1 x x x x x x x	(address = $2000)
	0x03,	// PG bits 13-11 = 0 x x			(address = $0000)
	0x36,	// SA bits 13-7	= 0 1 1 0 1 1 0		(address = $1B00)
	0x07,	// SG bits 13-11 = 1 1 1			(address = $3800)
	0x01	// text color (unused in Mode2) / backdrop (black)
};

/* the VDP registers #0 and #1 'shadow' RAM */
unsigned char	VDPReg [2] = {0x02, 0xa0};

volatile bool	VDPBlank;			// used by INTerrupt
volatile bool 	PauseRequested; 	// used by NMI

#ifdef AUTODETECT_SPRITE_OVERFLOW
unsigned char	spriteOverflowFlipflop = 0;
unsigned char	spriteOverflowCounter;
volatile bool	VDPSpriteCollision = false;
volatile bool	VDPSpriteOverflow = false;
#endif

volatile unsigned int KeysStatus, PreviousKeysStatus;

#if MAXSPRITES == 32
unsigned char	SpriteTable [MAXSPRITES * 4];
#else
unsigned char	SpriteTable [(MAXSPRITES + 1) * 4];
#endif
//unsigned char	SpriteNextFree;
unsigned char   *stp;

#ifdef AUTOCYCLE_SPRITES
unsigned char   *SpriteTableEnd;
unsigned char   first_sprite;
#endif

unsigned char   gpit;
unsigned char   VDPType;

#ifndef NESTED_DI_EI_SUPPORT
/* macro definitions (no nested DI/EI support) */
#define SG_write_to_VDPRegister(VDPReg,value)	{ DISABLE_INTERRUPTS; VDPControlPort= (value); VDPControlPort = (VDPReg) | 0x80; ENABLE_INTERRUPTS; }
#define SG_set_address_VRAM(address)			{ DISABLE_INTERRUPTS; VDPControlPort = LO (address); VDPControlPort = HI (address) | 0x40; ENABLE_INTERRUPTS; }
#else
/* inline __critical functions (nested DI/EI supported!) */
inline void SG_write_to_VDPRegister (unsigned char VDPReg, unsigned char value) {
	/* INTERNAL FUNCTION */
	__critical {
		VDPControlPort = value;
		VDPControlPort = VDPReg | 0x80;
	}
}

inline void SG_set_address_VRAM (unsigned int address) {
	/* INTERNAL FUNCTION */
	__critical {
		VDPControlPort = LO (address);
		VDPControlPort = HI (address) | 0x40;
	}
}
#endif

inline void SG_byte_to_VDP_data (unsigned char data) {
	/* INTERNAL FUNCTION */
	VDPDataPort = data;
}

inline void SG_byte_array_to_VDP_data (const unsigned char *data, unsigned int size) {
	/* INTERNAL FUNCTION */
	do {
		VDPDataPort = *(data ++);
	} while (-- size);
}

inline void SG_byte_brief_array_to_VDP_data (const unsigned char *data, unsigned char size) {
	/* INTERNAL FUNCTION */
	do {
		VDPDataPort = *(data ++);
	} while (-- size);
}

inline void SG_word_to_VDP_data (unsigned int data) {
	/* INTERNAL FUNCTION */
	VDPDataPort = LO (data);
	WAIT_VRAM;				/* ensure we're not pushing data too fast */
	VDPDataPort = HI (data);
}

void SG_setReg (unsigned char reg, unsigned char v) {
	VDPReg [reg] = v;
	SG_write_to_VDPRegister (reg, v);
}

void SG_VDPturnOnFeature (unsigned int feature) {
	/* turns on a VDP feature */
	VDPReg [HI (feature)] |= LO (feature);
	SG_write_to_VDPRegister (HI (feature), VDPReg [HI (feature)]);
}

void SG_VDPturnOffFeature (unsigned int feature) {
	/* turns off a VDP feature */
	VDPReg [HI (feature)] &= ~LO (feature);
	SG_write_to_VDPRegister (HI (feature), VDPReg [HI (feature)]);
}

inline void SMS_detect_VDP_type (void) {
  // INTERNAL FUNCTION
  unsigned char old_value,new_value;
  while (VDPVCounterPort!=0x80);      // wait for line 0x80
  new_value=VDPVCounterPort;
  do {
    old_value=new_value;              // wait until VCounter 'goes back'
    new_value=VDPVCounterPort;
  } while (old_value<=new_value);
  if (old_value>=0xE7)
    VDPType=VDP_PAL;                  // old value should be 0xF2
  else
    VDPType=VDP_NTSC;                 // old value should be 0xDA
}

void SG_init (void) {
	for (gpit = 0; gpit < 8; gpit++)
		SG_write_to_VDPRegister (gpit, VDPReg_init [gpit]);

	#ifdef AUTOCYCLE_SPRITES
		first_sprite = 0;
		SpriteTableEnd = SpriteTable + 128;
	#endif

	SG_initSprites ();
	SG_finalizeSprites ();
	UNSAFE_SG_copySpritestoSAT ();

	SMS_detect_VDP_type();
}

void SG_setBackdropColor (unsigned char entry) {
	SG_write_to_VDPRegister (0x07, entry & 0x0f);
}

void SG_setSpriteMode (unsigned char mode) {
	if (mode & SG_SPRITEMODE_LARGE) {
		SG_VDPturnOnFeature (SG_VDPFEATURE_USELARGESPRITES);
	} else {
		SG_VDPturnOffFeature (SG_VDPFEATURE_USELARGESPRITES);
	}
	if (mode & SG_SPRITEMODE_ZOOMED) {
		SG_VDPturnOnFeature (SG_VDPFEATURE_ZOOMSPRITES);
	} else {
		SG_VDPturnOffFeature (SG_VDPFEATURE_ZOOMSPRITES);
	}
}


void SG_loadTilePatterns (void *src, unsigned int tilefrom, unsigned int size) {
	SG_set_address_VRAM (PGTADDRESS + (tilefrom << 3));
	SG_byte_array_to_VDP_data (src, size);
}

void SG_loadTileColours (void *src, unsigned int tilefrom, unsigned int size) {
	SG_set_address_VRAM (CGTADDRESS + (tilefrom << 3));
	SG_byte_array_to_VDP_data (src, size);
}

void SG_loadSpritePatterns (void *src, unsigned int tilefrom, unsigned int size) {
	SG_set_address_VRAM (SGTADDRESS + (tilefrom << 3));
	SG_byte_array_to_VDP_data (src, size);
}

void SG_setTileatXY (unsigned char x, unsigned char y, unsigned char tile) {
	SG_set_address_VRAM (PNTADDRESS + (y << 5) + x);
	SG_byte_to_VDP_data (tile);
}

void SG_setNextTileatXY (unsigned char x, unsigned char y) {
	SG_set_address_VRAM (PNTADDRESS + (y << 5) + x);
}

void SG_setTile (unsigned char tile) {
	SG_byte_to_VDP_data (tile);
}

void SG_fillTile (unsigned char tile, unsigned char count) {
	while (count --) SG_byte_to_VDP_data (tile);
}

void SG_loadTileMapArea (unsigned char x, unsigned char y,	void *src, unsigned char width, unsigned char height) {
	for (gpit = y; gpit < (y + height); gpit ++) {
		SG_set_address_VRAM (PNTADDRESS+ (gpit << 5) + x);
		SG_byte_brief_array_to_VDP_data (src, width);
		src = (unsigned char *) src + width;
	}
}

#ifdef AUTOCYCLE_SPRITES
	void SG_initSprites (void) { 
		for (gpit = 0; gpit < 128; gpit += 4) SpriteTable [gpit] = 0xd0;
		stp = SpriteTable + (first_sprite << 2);
		++ first_sprite; first_sprite &= 31;
	}

	void SG_addSprite (unsigned char x, unsigned char y, unsigned char tile, unsigned char attr) {
		*stp ++ = y;
		*stp ++ = x;
		*stp ++ = tile;
		*stp ++ = attr;
		stp += 4 * AUTOCYCLE_PRIME; if (stp > SpriteTableEnd) stp -= 128;
	}

	void SG_addMetaSprite1x1 (unsigned char x, unsigned char y, const unsigned char *mt) {
		mt += 2; 
		*stp ++ = y;
		*stp ++ = x;
		*stp ++ = *mt ++;
		*stp ++ = *mt ++;
		stp += 4 * AUTOCYCLE_PRIME; if (stp > SpriteTableEnd) stp -= 128;
		#ifdef AUTODETECT_ONE_COLOUR
			if (*mt == 0x80) return;
		#endif
		mt += 2; 
		*stp ++ = y;
		*stp ++ = x;
		*stp ++ = *mt ++;
		*stp ++ = *mt ++;
		stp += 4 * AUTOCYCLE_PRIME; if (stp > SpriteTableEnd) stp -= 128;
	}

	void SG_addMetaSprite (unsigned char x, unsigned char y, const unsigned char *mt) {
		while (0x80 != (*stp = *mt ++)) {
			*stp += y; stp ++;
			*stp ++ = x + *mt++;
			*stp ++ = *mt ++;
			*stp ++ = *mt ++;
			stp += 4 * AUTOCYCLE_PRIME; if (stp > SpriteTableEnd) stp -= 128;
		}
	}	

	void SG_finalizeSprites (void) {
		// NOP
	}
	
	unsigned char *SG_getStp (void) {
		return stp;
	}

	void SG_setStp (unsigned char *s) {
		stp = s;
	}
#else

	void SG_initSprites (void) {
		stp = SpriteTable;
	}

	void SG_addSprite (unsigned char x, unsigned char y, unsigned char tile, unsigned char attr) {
		*stp ++ = y;
		*stp ++ = x;
		*stp ++ = tile;
		*stp ++ = attr;
	}

	void SG_addMetaSprite1x1 (unsigned char x, unsigned char y, const unsigned char *mt) {
		mt += 2; 
		*stp ++ = y;
		*stp ++ = x;
		*stp ++ = *mt ++;
		*stp ++ = *mt ++;
		mt += 2; 
		*stp ++ = y;
		*stp ++ = x;
		*stp ++ = *mt ++;
		*stp ++ = *mt ++;
	}

	void SG_addMetaSprite (unsigned char x, unsigned char y, const unsigned char *mt) {
		while (0x80 != (*stp = *mt ++)) {
			*stp += y; stp ++;
			*stp ++ = x + *mt++;
			*stp ++ = *mt ++;
			*stp ++ = *mt ++;
		}
	}

	void SG_finalizeSprites (void) {
		*stp = 0xd0;
	}
#endif

void SG_copySpritestoSAT (void) {
	SG_set_address_VRAM (SATADDRESS);
	SG_byte_brief_array_to_VDP_data (SpriteTable, MAXSPRITES*4);
}

void SG_waitForVBlank (void) {
	VDPBlank = false;
	while (!VDPBlank);
}

unsigned int SG_getKeysStatus (void) {
	return (KeysStatus);
}

_Bool SG_queryPauseRequested (void) {
	return (PauseRequested);
}

void SG_resetPauseRequest (void) {
	PauseRequested = false;
}

/* low level functions, just to be used for dirty tricks ;) */
void SG_VRAMmemset (unsigned int dst, unsigned char value, unsigned int size) {
	SG_set_address_VRAM (dst);
	while (size>0) {
		SG_byte_to_VDP_data (value);
		size--;
	}
}

#pragma save
#pragma disable_warning 85
/* VRAM unsafe functions. Fast, but dangerous! */
void UNSAFE_SG_copySpritestoSAT (void) {
	SG_set_address_VRAM (SATADDRESS);
	__asm
		ld c,#_VDPDataPort
		ld hl,#_SpriteTable
#if MAXSPRITES == 32
		call _outi_block-MAXSPRITES*4*2
#else
		call _outi_block- (MAXSPRITES+1)*4*2
#endif
	__endasm;
}

void UNSAFE_SG_VRAMmemcpy128 (unsigned int dst, void *src) {
	SG_set_address_VRAM (dst);
	__asm
		ld c,#_VDPDataPort
		ld l, 2 (iy)
		ld h, 3 (iy)
		call _outi_block-128*2
	__endasm;
}
#pragma restore

/* Interrupt Service Routines */
void SG_isr (void) __interrupt {
	volatile unsigned char VDPStatus = VDPStatusPort;	/* this also aknowledge interrupt at VDP */
#ifdef AUTODETECT_SPRITE_OVERFLOW
	VDPSpriteOverflow= (VDPStatus & 0x40);
	VDPSpriteCollision= (VDPStatus & 0x20);
#endif
	if (VDPStatus & 0x80) {
		VDPBlank = true;				 /* frame interrupt */
		/* read key input */
		PreviousKeysStatus = KeysStatus;
		KeysStatus = ~ (( (IOPortH)<<8)|IOPortL);
	}
	/* Z80 disable the interrupts on ISR, so we should re-enable them explicitly */
	ENABLE_INTERRUPTS;
}

void SG_nmi_isr (void) __critical __interrupt {		/* this is for NMI */
	PauseRequested = true;
}

unsigned char SMS_VDPType (void) {
  return VDPType;
}

