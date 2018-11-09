// SG-1000 MK1 v0.1
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

#define SG1000

// definitions.h
// Main definitions

#define FIXBITS                 6

// Player states

#define EST_NORMAL              0
#define EST_PARP                2
#define EST_MUR                 4
#define EST_REBOUND             8

// Macros

#define MAX(x1,x2)              ((x1)<(x2)?(x2):(x1))
#define MIN(x1,x2)              ((x1)<(x2)?(x1):(x2))
#define COORDS(x,y)             ((x) | ((y) << 4))
#define MSB(x)                  (((x) >> 8))
#define LSB(x)                  (((x) & 0xff))
#define SGNI(n)                 ((n) < 0 ? -1 : 1)
#define SGNC(a,b,c)             ((a) < (b) ? -(c) : (c))
#define SATURATE_Z(n)           ((n) < 0 ? 0 : (n))
#define ABS(n)                  ((n) < 0 ? -(n) : (n))
#define ADD_SIGN2(a,b,v)        ((a)==(b))?(0):(((a)>(b))?(v):(-(v)))
#define ADD_SIGN(a,v)           ((a)?(((a)>0)?(v):(-(v))):(0))
#define DELTA(a,b)              ((a) < (b) ? (b) - (a) : (a) - (b))
#define QTILE(x,y)              (map_buff [COORDS((x),(y))])
#ifdef SG1000
	#define ATTR(x,y)           (c_behs [QTILE((x),(y))])
#else
	#define ATTR(x,y)           (map_attr [COORDS((x),(y))])
#endif
#define ENEMS_RECOIL_X          ((_en_t == 5 || _en_t == 9 || _en_t == 11) ? 0 : ADD_SIGN2 (_en_x, prx, ENEMS_RECOIL_ON_HIT))
#define ENEMS_RECOIL_Y          ((_en_t == 5 || _en_t == 9 || _en_t == 11) ? 0 : ADD_SIGN2 (_en_y, pry, ENEMS_RECOIL_ON_HIT))
#define IF_PLAYER_TOUCHES(x,y)  rdx=(x)<<4;rdy=16+((y)<<4);if(prx+7>=rdx&&prx<=rdx+15&&pry+15>=rdt&&pry<=rdy+15)
#define DISABLE_INTERRUPTS		__asm di __endasm
#define ENABLE_INTERRUPTS		__asm ei __endasm

// Wall hits

#define WTOP                    1
#define WBOTTOM                 2
#define WLEFT                   3
#define WRIGHT                  4

// Use types

#define USE_TYPE_HOTSPOT        1
#define USE_TYPE_INTERACTIVE    2
#define USE_TYPE_SCRIPTING      3

// Enemy states / flags

#define EN_STATE_DEAD           1
#define EN_STATE_SPAWNING       2

// Vertical engine type for side_view

#define ENGINE_TYPE_JUMP        0
#define ENGINE_TYPE_JET_PAC     1
#define ENGINE_TYPE_SWIM        2
#define ENGINE_TYPE_AUTO_JUMP   3

// SG1000

#define PAD_UP 					PORT_A_KEY_UP
#define PAD_DOWN 				PORT_A_KEY_DOWN
#define PAD_LEFT 				PORT_A_KEY_LEFT
#define PAD_RIGHT 				PORT_A_KEY_RIGHT
#define PAD_1 					PORT_A_KEY_1
#define PAD_2 					PORT_A_KEY_2
#define PAD_A 					PORT_A_KEY_2
#define PAD_B 					PORT_A_KEY_1
#define PAD_START 				PORT_A_KEY_1
#define PAD_SELECT 				PORT_A_KEY_2
