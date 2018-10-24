// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018
// SG1000 Version

// definitions.h
// Main definitions

#define FIXBITS					6

// Player states

#define EST_NORMAL 				0
#define EST_PARP 				2
#define EST_MUR 				4
#define EST_REBOUND				8

// Macros

#define COORDS(x,y) 			((x) | ((y) << 4))
#define MSB(x)					(((x) >> 8))
#define LSB(x)					(((x) & 0xff))
#define SGNI(n)					((n) < 0 ? -1 : 1)
#define SGNC(a,b,c)				((a) < (b) ? -(c) : (c))
#define SATURATE_Z(n)			((n) < 0 ? 0 : (n))
#define ABS(n)					((n) < 0 ? -(n) : (n))
#define ADD_SIGN2(a,b,v)		((a)==(b))?(0):(((a)>(b))?(v):(-(v)))
#define ADD_SIGN(a,v) 			((a)?(((a)>0)?(v):(-(v))):(0))
#define DELTA(a,b)				((a) < (b) ? (b) - (a) : (a) - (b))
#define ATTR(x,y)				(map_attr [COORDS((x),(y))])
#define QTILE(x,y)				(map_buff [COORDS((x),(y))])
#define ENEMS_RECOIL_X 			((_en_t == 5 || _en_t == 9 || _en_t == 11) ? 0 : ADD_SIGN2 (_en_x, prx, ENEMS_RECOIL_ON_HIT))
#define ENEMS_RECOIL_Y 			((_en_t == 5 || _en_t == 9 || _en_t == 11) ? 0 : ADD_SIGN2 (_en_y, pry, ENEMS_RECOIL_ON_HIT))
#define VRAM_READ				(*((unsigned char *) (0x2007)))
#define SET_FROM_PTR(v,p)		{__asm__("ldy #0");__asm__("lda (%v),y",p);__asm__("sta %v",v);}
#define IF_PLAYER_TOUCHES(x,y)	rdx=(x)<<4;rdy=16+((y)<<4);if(prx+7>=rdx&&prx<=rdx+15&&pry+15>=rdt&&pry<=rdy+15)

// Wall hits

#define WTOP 					1
#define WBOTTOM 				2
#define WLEFT 					3
#define WRIGHT 					4

// Use types

#define USE_TYPE_HOTSPOT		1
#define USE_TYPE_INTERACTIVE	2
#define USE_TYPE_SCRIPTING		3

// Enemy states / flags

#define EN_STATE_DEAD			1
#define EN_STATE_SPAWNING		2

// Vertical engine type for side_view

#define ENGINE_TYPE_JUMP		0
#define ENGINE_TYPE_JET_PAC 	1
#define ENGINE_TYPE_SWIM 		2
#define ENGINE_TYPE_AUTO_JUMP	3

// SG1000

#define PAD_UP 0x01
#define PAD_DOWN 0x02
#define PAD_LEFT 0x04
#define PAD_RIGHT 0x08
#define PAD_1 0x10
#define PAD_2 0x20
#define PAD_A 0x10
#define PAD_B 0x20
#define PAD_START 0x10
#define PAD_SELECT 0x20
