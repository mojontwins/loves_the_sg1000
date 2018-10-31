// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// printer.c
// Draw map, print text, etcetera.

#include "../lib/SGlib.h"

#include "../definitions.h"
#include "../config.h"
#include "../autodefs.h"

#include "../ram/global_externs.h"

#include "../utils/rand.h"
#include "../utils/memfill.h"
#include "../engine/propellers.h"
#include "../engine/tile_chac_chac.h"

#include "printer.h"

// Clear update list
void clear_update_list (void) {
	memfill (update_list, 0, UPDATE_LIST_SIZE*3);
	update_index = 0;
}

void cls (void) {
	SG_setNextTileatXY (0, 0);
	SG_fillTile (0, 768);
}

// Needs gp_addr, _n set.
void ul_putc (void) {
	update_list [update_index++] = MSB (gp_addr);
	update_list [update_index++] = LSB (gp_addr++);
	update_list [update_index++] = _n;
}

// Needs _x, _y, _n set.
void p_t (void) {
	rda = _n; gp_addr = (_y << 5) + _x + PNTADDRESS;
	_n = ((rda/10)+16); ul_putc ();
	_n = ((rda%10)+16); ul_putc ();
}

void p_tf (void) {
	SG_setTileatXY (_x, _y, (_n / 10) + 16);
	SG_setTile ((_n % 10) + 16);
}

// Needs _x, _y, _t set.
// Call during vblank or with screen off
void draw_tile (void) {
	// _y = TOP_ADJUST writes only bottom half.
	// _y = TOP_ADJUST + 22 writes only top half.

	gp_tmap = c_ts_tmaps + (_t << 2);
	gp_addr = (_y << 5) + _x + PNTADDRESS;

	if (_y == TOP_ADJUST) {
		gp_tmap += 2;		
	} else {
		VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
		VDPDataPort = *gp_tmap ++;
		VDPDataPort = *gp_tmap ++;
	}

	if (_y < TOP_ADJUST + 22) {
		gp_addr += 32;
		VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
		VDPDataPort = *gp_tmap ++;
		VDPDataPort = *gp_tmap ++;
	}
}

// Needs _x, _y, _t set.
// Adds tiles to update list.
void update_list_tile (void) {
	gp_tmap = c_ts_tmaps + (_t << 2);
	gp_addr = ((_y << 5) + _x + PNTADDRESS);
	
	_n = *gp_tmap ++; ul_putc ();
	_n = *gp_tmap ++; ul_putc ();
	gp_addr += 30;
	
	_n = *gp_tmap ++; ul_putc ();
	_n = *gp_tmap   ; ul_putc ();
}

// Needs _x, _y, _t set.
// Destroys _x, _y!.
void map_set (void) {
	map_buff [COORDS (_x, _y)] = _t;
	#ifndef SG1000
		map_attr [COORDS (_x, _y)] = c_behs [_t];
	#endif
	_x = _x << 1; _y = TOP_ADJUST + (_y << 1);
	update_list_tile (); 
}

unsigned char get_byte (void) {
	-- rdit; return *gp_gen ++;
}

#ifdef MAP_RENDERER_COMPLEX
	#include "../engine/mapmods/map_renderer_complex.h"
#else
	#include "../engine/mapmods/map_renderer_fast.h"
#endif

// Needs _x, _y set.
void pr_str (const unsigned char *s) {
	SG_setNextTileatXY (_x, _y);
	while (gpit = *s++) {
		if (gpit == '%') {
			++ _y; SG_setNextTileatXY (_x, _y);
		}
		else SG_setTile (gpit - 32); 
	}
}

#ifdef ENABLE_UL_PRINTER
	// Needs _x, _y set and gp_gen pointing to the string
	void pr_ul_str () {
		update_cycle ();
		gp_addr = PNTADDRESS + ((_y << 5) | _x);
		while (_n = *gp_gen ++) { _n -= 32; ul_putc (); }
		update_cycle ();
	}
#endif

#ifdef DEBUG
unsigned char get_hex_digit (unsigned char n) {
	if (n < 10) return n + 16;
	return n + 23;
}

void debug_print_hex_16_dl (unsigned char x, unsigned char y, unsigned int n) {
	clear_update_list ();

	gp_addr = (y << 5) + x + PNTADDRESS;
	_n = get_hex_digit (n >> 12); 			ul_putc ();
	_n = get_hex_digit ((n >> 8) & 0xf); 	ul_putc ();
	_n = get_hex_digit ((n >> 4) & 0xf); 	ul_putc ();
	_n = get_hex_digit ((n & 0xf)); 		ul_putc ();

	update_cycle ();
}
#endif

