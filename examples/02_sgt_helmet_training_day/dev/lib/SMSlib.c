// Custom SMSlib.c

// I need a drop-in replacement for my modified SG-lib, so I made this.
// This is *NOT* sverx official SMSlib from DevkitSMS *but* it contains
// code from it.

// Please, for the real thing, head to https://github.com/sverx/devkitSMS

// Configuration

#define AUTOCYCLE_SPRITES				// Sprites cycle automaticly
#define AUTOCYCLE_PRIME			3		// Prime to 32.
#define AUTOCYCLE_INIT_PRIME 	3		// Prime to 32.
#define AUTODETECT_ONE_COLOUR			// Detect 1 colour sprites in SMS_addMetaSprite1x1
#define AUTOMUSIC						// ISR calls PSGPlay and PSGSFXPlay
#define ONLY_ONE_CONTROLLER

#include "SMSlib.h"

#ifdef AUTOMUSIC
	#include "PSGlib.h"
#endif

#define true 1
#define false 0
#define bool _Bool
#define __bool_true_false_are_defined 1

#define MAXSPRITES 				64

#define DISABLE_INTERRUPTS		__asm di __endasm
#define ENABLE_INTERRUPTS		__asm ei __endasm

#define WAIT_VRAM				__asm 	nop \
										nop \
										nop __endasm

// the VDP registers initialization value (ROM)
const unsigned char VDPReg_init[11]={
	0x04, 	// reg0: Mode 4 
	0x20,	// reg1: display OFF - frame int (vblank) ON 
	0xFF,	// reg2: PNT at 0x3800 
	0xFF,	// reg3: no effect (when in mode 4) 
	0xFF,	// reg4: no effect (when in mode 4) 
	0xFF,	// reg5: SAT at 0x3F00 
	0xFF,	// reg6: Sprite tiles at 0x2000 
	0x00,	// reg7: backdrop color (zero) 
	0x00,	// reg8: scroll X (zero) 
	0x00,	// reg9: scroll Y (zero) 
	0xFF 	// regA: line interrupt count (offscreen) 
};

// the VDP registers #0 and #1 'shadow' RAM 
unsigned char	VDPReg [2] = {0x04, 0x20};

volatile bool	VDPBlank;				// used by INTerrupt
volatile unsigned char SMS_VDPFlags;	// sprite overflow et al
volatile bool 	PauseRequested; 		// used by NMI

#ifdef ONLY_ONE_CONTROLLER
	volatile unsigned char KeysStatus;
#else
	volatile unsigned int KeysStatus;
#endif

unsigned char SpriteTableY[MAXSPRITES];
unsigned char SpriteTableXN[MAXSPRITES*2];

unsigned char *stpY, *stpXN 			// Pointers to spritetables

#ifdef AUTOCYCLE_SPRITES
	unsigned char *SpriteTableYEnd;
	unsigned char *SpriteTableXNEnd;	// Pointers to the end of spriteables
	unsigned char first_sprite 			// First sprite slot for each loop
#endif

unsigned char   libgpit;
unsigned char   VDPType;

#ifdef AUTOMUSIC
	unsigned char music_on;
#endif

#ifndef NESTED_DI_EI_SUPPORT
	// macro definitions (no nested DI/EI support)
	#define SMS_write_to_VDPRegister(VDPReg,value)	{ DISABLE_INTERRUPTS; VDPControlPort = (value); VDPControlPort = (VDPReg) | 0x80; ENABLE_INTERRUPTS; }
	#define SMS_set_address_VRAM(address)			{ DISABLE_INTERRUPTS; VDPControlPort = LO (address); VDPControlPort = HI (address) | 0x40; ENABLE_INTERRUPTS; }
	#define SMS_set_address_CRAM(address)			{ DISABLE_INTERRUPTS; VDPControlPort = (a); VDPControlPort = 0xC0; ENABLE_INTERRUPTS; }
#else
	// inline __critical functions (nested DI/EI supported!) */
	inline void SMS_write_to_VDPRegister (unsigned char VDPReg, unsigned char value) {
		__critical {
			VDPControlPort = value;
			VDPControlPort = VDPReg | 0x80;
		}
	}

	inline void SMS_set_address_VRAM (unsigned int address) {
		__critical {
			VDPControlPort = LO (address);
			VDPControlPort = HI (address) | 0x40;
		}
	}
#endif

inline void SMS_byte_to_VDP_data (unsigned char data) {
	VDPDataPort = data;
}

inline void SMS_byte_array_to_VDP_data (const unsigned char *data, unsigned int size) {
	do {
		VDPDataPort = *(data ++);
	} while (-- size);
}

inline void SMS_byte_brief_array_to_VDP_data (const unsigned char *data, unsigned char size) {
	do {
		VDPDataPort = *(data ++);
	} while (-- size);
}

inline void SMS_word_to_VDP_data (unsigned int data) {
	VDPDataPort = LO (data);
	WAIT_VRAM;
	VDPDataPort = HI (data);
}

inline void SMS_detect_VDP_type (void) {
  // INTERNAL FUNCTION
  unsigned char old_value;
  while (VDPVCounterPort>0x80);       // wait next frame starts
  while (VDPVCounterPort<0x80);       // wait next half frame
  do {
    old_value=VDPVCounterPort;        // wait until VCounter 'goes back'
  } while (old_value<=VDPVCounterPort);
  if (old_value>=0xE7)
    VDPType=VDP_PAL;                  // old value should be 0xF2
  else
    VDPType=VDP_NTSC;                 // old value should be 0xDA
}

void SMS_setReg (unsigned char reg, unsigned char v) {
	VDPReg [reg] = v;
	SMS_write_to_VDPRegister (reg, v);
}

void SMS_VDPturnOnFeature (unsigned int feature) __z88dk_fastcall {
  // turns on a VDP feature
  VDPReg[HI(feature)]|=LO(feature);
  SMS_write_to_VDPRegister (HI(feature),VDPReg[HI(feature)]);
}

void SMS_VDPturnOffFeature (unsigned int feature) __z88dk_fastcall {
  // turns off a VDP feature
  unsigned char val=~LO(feature);
  VDPReg[HI(feature)]&=val;
  SMS_write_to_VDPRegister (HI(feature),VDPReg[HI(feature)]);
}

void SMS_init (void) {
	for (libgpit = 0; libgpit < 11; libgpit++)
		SMS_write_to_VDPRegister (libgpit, VDPReg_init [libgpit]);

	#ifdef AUTOCYCLE_SPRITES
		first_sprite = 0;
		SpriteTableYEnd = SpriteTableY + 64;
		SpriteTableXNEnd = SpriteTableXN + 128;
	#endif

	SMS_initSprites ();
	SMS_finalizeSprites ();
	SMS_copySpritestoSAT ();

	SMS_resetPauseRequest();
	SMS_detect_VDP_type();

	#ifdef AUTOMUSIC
		music_on = 1;
	#endif
}

void SMS_setBackdropColor (unsigned char entry) {
  SMS_write_to_VDPRegister (0x07, entry);
}

void SMS_setSpriteMode (unsigned char mode) {
  if (mode & SPRITEMODE_TALL) {
    SMS_VDPturnOnFeature (VDPFEATURE_USETALLSPRITES);
  } else {
    SMS_VDPturnOffFeature (VDPFEATURE_USETALLSPRITES);
  }
  if (mode & SPRITEMODE_ZOOMED) {
    SMS_VDPturnOnFeature (VDPFEATURE_ZOOMSPRITES);
  } else {
    SMS_VDPturnOffFeature (VDPFEATURE_ZOOMSPRITES);
  }
}

void SMS_setBGPaletteColor (unsigned char entry, unsigned char color) {
  SMS_set_address_CRAM (entry);
  SMS_byte_to_VDP_data (color);
}

void SMS_setSpritePaletteColor (unsigned char entry, unsigned char color) {
  SMS_set_address_CRAM (entry|0x10);
  SMS_byte_to_VDP_data (color);
}

void SMS_loadTiles (void *src, unsigned int tilefrom, unsigned int size) {
  SMS_set_address_VRAM (tilefrom << 5);
  SMS_byte_array_to_VDP_data (src,size);
}


/* ************************************************************************************ */
// NEW CODE
#define ASM_HL_TO_VDP_CONTROL  \
  __asm                        \
    ld c,#_VDPControlPort      \
    di                         \
    out (c),l                  \
    out (c),h                  \
    ei                         \
  __endasm
  // writes a control word to VDP
  // it's INTerrupt safe (DI/EI around control port writes)
  // controlword in HL

#define ASM_DE_TO_VDP_CONTROL  \
  __asm                        \
    ld c,#_VDPControlPort      \
    di                         \
    out (c),e                  \
    out (c),d                  \
    ei                         \
  __endasm
  // writes a control word to VDP
  // it's INTerrupt safe (DI/EI around control port writes)
  // controlword in DE

#define ASM_HL_TO_VDP_DATA                                \
  __asm                                                   \
    ld a,l                                                \
    out (_VDPDataPort),a      ; 11                        \
    ld a,h                    ; 4                         \
    sub #0                    ; 7                         \
    nop                       ; 4 = 26 *VRAM SAFE*        \
    out (_VDPDataPort),a                                  \
  __endasm
  // writes two bytes (a word) to VDP
  // it's VRAM safe (at least 26 cycles between writes)
  // word will be passed in HL
  
#define ASM_L_TO_VDP_DATA                                 \
  __asm                                                   \
    ld a,l                                                \
    out (_VDPDataPort),a      ; 11                        \
  __endasm
  // writes one byte to VDP
  // it's VRAM safe since it's used by SMS_setColor which adds enough overhead (call/ret)
  // byte will be passed in L

#define ASM_SHORT_XFER_TO_VDP_DATA                                \
  __asm                                                           \
    ld c,#_VDPDataPort                                            \
1$: outi                       ; 16                               \
    jr nz,1$                   ; 12 = 28 *VRAM SAFE*              \
  __endasm
  // writes B bytes from (HL) on to VDP
  // it's VRAM safe (at least 26 cycles between writes)

#define ASM_LD_DE_IMM(imm)            \
  __asm                               \
    ld de,imm                         \
  __endasm

#define ASM_LD_B_IMM(imm)             \
  __asm                               \
    ld b,imm                          \
  __endasm

#pragma save
#pragma disable_warning 85
  void SMS_setAddr (unsigned int addr) __z88dk_fastcall __preserves_regs(a,b,d,e,h,l,iyh,iyl) {
  // addr will be in HL
  ASM_HL_TO_VDP_CONTROL;
}

void SMS_setTile (unsigned int tile) __z88dk_fastcall __preserves_regs(b,c,d,e,h,l,iyh,iyl) {
  // tile will be in HL
  ASM_HL_TO_VDP_DATA;
}

void SMS_loadBGPalette (void *palette) __z88dk_fastcall {
  // *palette will be in HL
  ASM_LD_DE_IMM(#SMS_CRAMAddress);
  ASM_DE_TO_VDP_CONTROL;
  ASM_LD_B_IMM(#16);
  ASM_SHORT_XFER_TO_VDP_DATA;
}

void SMS_loadSpritePalette (void *palette) __z88dk_fastcall {
  // *palette will be in HL
  ASM_LD_DE_IMM(#SMS_CRAMAddress+0x10);
  ASM_DE_TO_VDP_CONTROL;
  ASM_LD_B_IMM(#16);
  ASM_SHORT_XFER_TO_VDP_DATA;
}

void SMS_setColor (unsigned char color) __z88dk_fastcall __preserves_regs(b,c,d,e,h,l,iyh,iyl) {
  // color will be in L
  ASM_L_TO_VDP_DATA;
}
#pragma restore

#ifdef AUTOCYCLE_SPRITES
	// Just add sprites via SMS_sddSprite after a call to
	// SMS_initSprites and the sprites will be inserted in a
	// different order for each game frame.

	// This is very useful on the SG as it will make sprites
	// blink instead of disappearing.

	void SMS_initSprites (void) { 		
		__asm
			ld hl, #_SpriteTableY
			ld de, #_SpriteTableY
			ld (hl), #0xc0
			inc de
			ld bc, #128
			ldir
		__endasm;
		stpY = SpriteTableY + first_sprite;
		sptXN = SpriteTableXN + (first_sprite << 1);
		first_sprite = (first_sprite + AUTOCYCLE_INIT_PRIME) & 63;
	}

	inline void nextSprite (void) {
		libgpit = AUTOCYCLE_PRIME-1;
		stpY += libgpit; stpXN += libgpit << 1;
		if (stpY >= SpriteTableEnd) {
			stpY -= 64; 
			stpXN -= 128;
		}
	}

	void SMS_addSprite (unsigned char x, unsigned char y, unsigned char tile) {
		*stpY ++ = y;
		*stpXN ++ = x;
		*stpXN ++ = tile;
		nextSprite ();
	}

	unsigned char _lgpx, _lgpx0, _lgpy, _lgpw, _lgph, _lgpw0, _lgph0
	void SMS_addMetaSprite (unsigned char x, unsigned char y, const unsigned char *mt) {
		// x0, y0, w, h, data
		_lgpx0 = x + *mt ++;
		_lgpy = y + *mt ++;
		_lgpw0 = *mt ++; 
		_lgph = *mt ++;
		while (_lgph) { -- _lgph;
			_lgpx = _lgpx0;
			_lgpw = _lgpw0;
			while (_lgpw) { -- lgpw;
				*stpY ++ = lgpy;
				*stpXN ++ = lgpx;
				*stpXN ++ = *mt ++;
				nextSprite ();
				_lgpx += 8;
			}
			_lgpy += 8;
		}
	}

	void SMS_finalizeSprites (void) {
		// NOP
	}

	unsigned char *SMS_getStpY (void) {
		return stpY;
	}

	void SMS_setStpY (unsigned char *s) {
		stpY = s;
	}

	unsigned char *SMS_getStpXN (void) {
		return stpY;
	}

	void SMS_setStpXN (unsigned char *s) {
		stpY = s;
	}
#else	