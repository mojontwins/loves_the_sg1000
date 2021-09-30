// Custom SMSlib.h

// I need a drop-in replacement for my modified SG-lib, so I made this.
// This is *NOT* sverx official SMSlib from DevkitSMS *but* it contains
// code from it.

// Please, for the real thing, head to https://github.com/sverx/devkitSMS

/* library initialization. you don't need to call this if you use devkitSMS crt0_sg.rel */
void SMS_init (void);

/* VDP operative mode handling functions */
void SMS_VDPturnOnFeature (unsigned int feature);
void SMS_VDPturnOffFeature (unsigned int feature);
/* turns on/off a VDP feature */
/* feature can be one of the following: */

/* group 0 */
#define VDPFEATURE_EXTRAHEIGHT      0x0002
#define VDPFEATURE_SHIFTSPRITES     0x0008
#define VDPFEATURE_HIDEFIRSTCOL     0x0020
#define VDPFEATURE_LEFTCOLBLANK     0x0020     /* a better name */
#define VDPFEATURE_LOCKHSCROLL      0x0040
#define VDPFEATURE_LOCKVSCROLL      0x0080

/* group 1 */
#define VDPFEATURE_ZOOMSPRITES      0x0101
#define VDPFEATURE_USETALLSPRITES   0x0102
#define VDPFEATURE_240LINES         0x0108
#define VDPFEATURE_224LINES         0x0110
#define VDPFEATURE_FRAMEIRQ         0x0120
#define VDPFEATURE_SHOWDISPLAY      0x0140

/* handy macros :) */
#define SMS_displayOn()   SMS_VDPturnOnFeature(VDPFEATURE_SHOWDISPLAY)   /* turns on display */
#define SMS_displayOff()  SMS_VDPturnOffFeature(VDPFEATURE_SHOWDISPLAY)  /* turns off display */

void SMS_setBackdropColor (unsigned char entry);
void SMS_useFirstHalfTilesforSprites (_Bool usefirsthalf);
void SMS_setSpriteMode (unsigned char mode);
#define SPRITEMODE_NORMAL         0x00
#define SPRITEMODE_TALL           0x01
#define SPRITEMODE_ZOOMED         0x02
#define SPRITEMODE_TALL_ZOOMED    0x03

volatile __at (0xffff) unsigned char ROM_bank_to_be_mapped_on_slot2;
#define SMS_mapROMBank(n)       ROM_bank_to_be_mapped_on_slot2=(n)

/* wait until next VBlank starts */
void SMS_waitForVBlank (void);

/* SMS_CRAMAddress define (has address and VDP flags) */
#define SMS_CRAMAddress                    0xC000

/* SMS functions to set a color / load a palette */
void SMS_setBGPaletteColor (unsigned char entry, unsigned char color);
void SMS_setSpritePaletteColor (unsigned char entry, unsigned char color);
void SMS_loadBGPalette (void *palette) __z88dk_fastcall;
void SMS_loadSpritePalette (void *palette) __z88dk_fastcall;
#define SMS_setNextBGColoratIndex(i)       SMS_setAddr(SMS_CRAMAddress|(i))
#define SMS_setNextSpriteColoratIndex(i)   SMS_setAddr(SMS_CRAMAddress|0x10|(i))
void SMS_setColor (unsigned char color) __z88dk_fastcall __preserves_regs(b,c,d,e,h,l,iyh,iyl);

/* SMS macros for colors */
#define RGB(r,g,b)        ((r)|((g)<<2)|((b)<<4))
#define RGB8(r,g,b)       (((r)>>6)|(((g)>>6)<<2)|(((b)>>6)<<4))
#define RGBHTML(RGB24bit) (((RGB24bit)>>22)|((((RGB24bit)&0xFFFF)>>14)<<2)|((((RGB24bit)&0xFF)>>6)<<4))

/* functions to load tiles into VRAM */
void SMS_loadTiles (void *src, unsigned int tilefrom, unsigned int size);

/* functions for the tilemap */
void SMS_loadTileMap (unsigned char x, unsigned char y, void *src, unsigned int size);
void SMS_loadTileMapArea (unsigned char x, unsigned char y, void *src, unsigned char width, unsigned char height);

/* function for setting tiles/moving 'cursor' */
void SMS_setTile (unsigned int tile) __z88dk_fastcall __preserves_regs(b,c,d,e,h,l,iyh,iyl);
void SMS_setAddr (unsigned int addr) __z88dk_fastcall __preserves_regs(a,b,d,e,h,l,iyh,iyl);

/* PNT define (has address and VDP flags) */
#define SMS_SATAddress    	((unsigned int)0x3F00)
#define SMS_PNTAddress		0x7800
/* macro for turning x,y into VRAM addr */
#define XYtoADDR(x,y)             (SMS_PNTAddress|((unsigned int)(y)<<6)|((unsigned char)(x)<<1))
#define SMS_setNextTileatXY(x,y)  SMS_setAddr(XYtoADDR((x),(y)))
#define SMS_setNextTileatLoc(loc) SMS_setAddr(SMS_PNTAddress|((unsigned int)(loc)<<1))
#define SMS_setNextTileatAddr(a)  SMS_setAddr(a)
#define SMS_setTileatXY(x,y,tile) {SMS_setAddr(XYtoADDR((x),(y)));SMS_setTile(tile);}

/* handy defines for tilemaps entry */
#define TILE_FLIPPED_X			0x0200
#define TILE_FLIPPED_Y			0x0400
#define TILE_USE_SPRITE_PALETTE	0x0800
#define TILE_PRIORITY			0x1000

/* functions for sprites handling */
void SMS_initSprites (void);
void SMS_addSprite (unsigned char x, unsigned char y, unsigned char tile);
void SMS_addMetaSprite (unsigned char x, unsigned char y, const unsigned char *mt);
void SMS_finalizeSprites (void);
void SMS_copySpritestoSAT (void);
unsigned char *SMS_getStp (void);
void SMS_setStp (unsigned char *s);

/* functions to read joypad(s) */
unsigned char SMS_getKeysStatus (void);

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
#define PORT_A_TH			0x4000        /* for light gun */
#define PORT_B_TH			0x8000        /* for light gun */
#endif

_Bool SMS_queryPauseRequested (void);          /* true if the pause key has been pressed */
void SMS_resetPauseRequest (void);             /* reset/acknowledge pause requests */

/* low level functions */
void SMS_VRAMmemset (unsigned int dst, unsigned char value, unsigned int size);

/* VRAM unsafe functions. Fast, but dangerous! */
void SMS_copySpritestoSAT (void);
void SMS_VRAMmemcpy128 (unsigned int dst, void *src);

/* the Interrupt Service Routines (do not modify) */
void SMS_isr (void) __interrupt;
void SMS_nmi_isr (void) __critical __interrupt;

/* VDPType handling (SMS only) */
unsigned char SMS_VDPType (void);
/* WARNING: these constants may change value later, please use defines */
#define VDP_PAL                 0x80
#define VDP_NTSC                0x40

extern volatile unsigned char SMS_VDPFlags;
#define VDPFLAG_SPRITEOVERFLOW  0x40
#define VDPFLAG_SPRITECOLLISION 0x20

/* "SMS Export" (32KB) */
#define SMS_EMBED_SEGA_ROM_HEADER_REGION_CODE  0x4C


#define SMS_EMBED_SEGA_ROM_HEADER(productCode,revision)                                        \
 const __at (0x7ff0) unsigned char __SMS__SEGA_signature[16]={'T','M','R',' ','S','E','G','A', \
                                                                          0xFF,0xFF,0xFF,0xFF, \
                  SMS_BYTE_TO_BCD((productCode)%100),SMS_BYTE_TO_BCD(((productCode)/100)%100), \
           (((productCode)/10000)<<4)|((revision)&0x0f),SMS_EMBED_SEGA_ROM_HEADER_REGION_CODE}

#define SMS_EMBED_SDSC_HEADER(verMaj,verMin,dateYear,dateMonth,dateDay,author,name,descr)      \
                          const __at (0x7fe0-sizeof(author)) char __SMS__SDSC_author[]=author; \
                 const __at (0x7fe0-sizeof(author)-sizeof(name)) char __SMS__SDSC_name[]=name; \
 const __at (0x7fe0-sizeof(author)-sizeof(name)-sizeof(descr)) char __SMS__SDSC_descr[]=descr; \
                          const __at (0x7fe0) char __SMS__SDSC_signature[16]={'S','D','S','C', \
                                              SMS_BYTE_TO_BCD(verMaj),SMS_BYTE_TO_BCD(verMin), \
                                          SMS_BYTE_TO_BCD(dateDay),SMS_BYTE_TO_BCD(dateMonth), \
                              SMS_BYTE_TO_BCD((dateYear)%100),SMS_BYTE_TO_BCD((dateYear)/100), \
                                                                  (0x7fe0-sizeof(author))%256, \
                                                                   (0x7fe0-sizeof(author))>>8, \
                                                     (0x7fe0-sizeof(author)-sizeof(name))%256, \
                                                      (0x7fe0-sizeof(author)-sizeof(name))>>8, \
                                       (0x7fe0-sizeof(author)-sizeof(name)-sizeof(descr))%256, \
                                        (0x7fe0-sizeof(author)-sizeof(name)-sizeof(descr))>>8}
/* pretty nice, isn't it? :) */

/* to set SDSC header date to 0000-00-00 so that ihx2sms updates that with compilation date */
#define SMS_EMBED_SDSC_HEADER_AUTO_DATE(verMaj,verMin,author,name,descr)                       \
                        SMS_EMBED_SDSC_HEADER((verMaj),(verMin),0,0,0,(author),(name),(descr))


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


#define HI(x)				((x)>>8)
#define LO(x)				((x)&0xFF)

void SMS_setUpdateList (unsigned char *ul);
void SMS_doUpdateList (void);

void music_pause (unsigned char p);
