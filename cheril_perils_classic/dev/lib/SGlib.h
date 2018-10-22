/* **************************************************
   SGlib - C programming library for the SEGA SG-1000
   ( part of devkitSMS - github.com/sverx/devkitSMS )
   code: na_th_an, sverx
   ************************************************** */

/* library initialization. you don't need to call this if you use devkitSMS crt0_sg.rel */
void SG_init (void);

/* VDP operative mode handling functions */
void SG_VDPturnOnFeature (unsigned int feature);
void SG_VDPturnOffFeature (unsigned int feature);
/* turns on/off a VDP feature */
/* feature can be one of the following: */
#define SG_VDPFEATURE_SHOWDISPLAY      0x0140
#define SG_VDPFEATURE_FRAMEIRQ         0x0120
#define SG_VDPFEATURE_USELARGESPRITES  0x0102
#define SG_VDPFEATURE_ZOOMSPRITES      0x0101
/* (it's possible to combine (OR) them if they belong to the same group) */

/* handy macros :) */
#define SG_displayOn()   SG_VDPturnOnFeature(SG_VDPFEATURE_SHOWDISPLAY)   /* turns on display */
#define SG_displayOff()  SG_VDPturnOffFeature(SG_VDPFEATURE_SHOWDISPLAY)  /* turns off display */

void SG_setSpriteMode (unsigned char mode);
#define SG_SPRITEMODE_NORMAL	       0x00
#define SG_SPRITEMODE_LARGE 	       0x01
#define SG_SPRITEMODE_ZOOMED           0x02
#define SG_SPRITEMODE_LARGE_ZOOMED     0x03

void SG_setBackdropColor (unsigned char entry);
#define SG_COLOR_TRANSPARENT           0x00
#define SG_COLOR_BLACK                 0x01
#define SG_COLOR_MEDIUM_GREEN          0x02
#define SG_COLOR_LIGHT_GREEN           0x03
#define SG_COLOR_DARK_BLUE             0x04
#define SG_COLOR_LIGHT_BLUE            0x05
#define SG_COLOR_DARK_RED              0x06
#define SG_COLOR_CYAN                  0x07
#define SG_COLOR_MEDIUM_RED            0x08
#define SG_COLOR_LIGHT_RED             0x09
#define SG_COLOR_DARK_YELLOW           0x0A
#define SG_COLOR_LIGHT_YELLOW          0x0B
#define SG_COLOR_DARK_GREEN            0x0C
#define SG_COLOR_MAGENTA               0x0D
#define SG_COLOR_GRAY                  0x0E
#define SG_COLOR_WHITE                 0x0F

/* wait until next VBlank starts */
void SG_waitForVBlank (void);

/* functions to load tiles into VRAM */
void SG_loadTilePatterns (void *src, unsigned int tilefrom, unsigned int size);
void SG_loadTileColours (void *src, unsigned int tilefrom, unsigned int size);
void SG_loadSpritePatterns (void *src, unsigned int tilefrom, unsigned int size);

/* functions for the tilemap */
void SG_loadTileMapArea (unsigned char x, unsigned char y, void *src, unsigned char width, unsigned char height);
void SG_setNextTileatXY (unsigned char x, unsigned char y);
void SG_setTileatXY (unsigned char x, unsigned char y, unsigned char tile);
void SG_setTile (unsigned char tile);
void SG_fillTile (unsigned char tile, unsigned char count);

/* functions for sprites handling */
void SG_initSprites (void);
void SG_addSprite (unsigned char x, unsigned char y, unsigned char tile, unsigned char attr);
void SG_addMetaSprite1x1 (unsigned char x, unsigned char y, const unsigned char *mt);
void SG_addMetaSprite (unsigned char x, unsigned char y, const unsigned char *mt);
void SG_finalizeSprites (void);
void SG_copySpritestoSAT (void);

/* functions to read joypad(s) */
unsigned int SG_getKeysStatus (void);

/* handy defines for joypad(s) handling */
#ifndef CONTROLLER_PORTS
#define CONTROLLER_PORTS
#define PORT_A_KEY_UP		0x0001
#define PORT_A_KEY_DOWN 	0x0002
#define PORT_A_KEY_LEFT 	0x0004
#define PORT_A_KEY_RIGHT	0x0008
#define PORT_A_KEY_1		0x0010
#define PORT_A_KEY_2		0x0020
#define PORT_A_KEY_START	PORT_A_KEY_1  /* handy alias */

#define PORT_B_KEY_UP		0x0040
#define PORT_B_KEY_DOWN 	0x0080
#define PORT_B_KEY_LEFT 	0x0100
#define PORT_B_KEY_RIGHT	0x0200
#define PORT_B_KEY_1		0x0400
#define PORT_B_KEY_2		0x0800
#define PORT_B_KEY_START	PORT_B_KEY_1  /* handy alias */

#define RESET_KEY_NOT		0x1000        /* 0 = pressed */
#define CARTRIDGE_SLOT		0x2000        /* ??? */
#define PORT_A_TH		0x4000        /* for light gun */
#define PORT_B_TH		0x8000        /* for light gun */
#endif

_Bool SG_queryPauseRequested (void);          /* true if the pause key has been pressed */
void SG_resetPauseRequest (void);             /* reset/acknowledge pause requests */

/* low level functions */
void SG_VRAMmemset (unsigned int dst, unsigned char value, unsigned int size);

/* VRAM unsafe functions. Fast, but dangerous! */
void UNSAFE_SG_copySpritestoSAT (void);
void UNSAFE_SG_VRAMmemcpy128 (unsigned int dst, void *src);

/* the Interrupt Service Routines (do not modify) */
void SG_isr (void) __interrupt;
void SG_nmi_isr (void) __critical __interrupt;

/* Handy when loading patterns */
#define PATTERN_DATA_BANK_A 0x0000
#define PATTERN_DATA_BANK_B 0x0800
#define PATTERN_DATA_BANK_C 0x1000
#define PGT_BASE 0x0000
#define CGT_BASE 0x2000
#define SGT_BASE 0x3800
