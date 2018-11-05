// SG-1000 MK1 v0.1
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Tile based chac chacs

#include "../lib/PSGlib.h"
#include "../murcia.h"

#include "../definitions.h"
#include "../config.h"
#include "../autodefs.h"

#ifdef ENABLE_TILE_CHAC_CHAC

#include "../ram/extern_globals.h"
#include "../engine/extern_precalcs.h"

#include "../engine/printer.h"
#include "../engine/tile_chac_chac.h"

void chac_chacs_add (void) {
	// Adds chac chac @ YX = rdm
	if (max_chac_chacs == MAX_CHAC_CHACS) return;
	rda = 1 + (rdt - CHAC_CHAC_DETECT_TILE);
	rdb = rda << 4;
	rdc = (rdb << 1) + rdb;

	chac_chacs_yx [max_chac_chacs] = rdm;
	chac_chacs_state [max_chac_chacs] = 0;
	chac_chacs_idlewait [max_chac_chacs] = rdc;
	chac_chacs_ct [max_chac_chacs] = rdc;
	
	++ max_chac_chacs;
}

void chac_chacs_do (void) {
	gpit = max_chac_chacs; while (gpit --) {
		if (chac_chacs_ct [gpit]) -- chac_chacs_ct [gpit]; else {
			++ chac_chacs_state [gpit];
			if (chac_chacs_state [gpit] == 6) chac_chacs_state [gpit] = 0;
			chac_chacs_ct [gpit] = chac_chacs_state [gpit] ? 
				(chac_chacs_times [chac_chacs_state [gpit]]) :
				chac_chacs_idlewait [gpit];

			// Add to update list
			chac_chacs_queue [chac_chacs_queue_write] = gpit;
			chac_chacs_queue_write = (chac_chacs_queue_write + 1) & (MAX_CHAC_CHACKS_QUEUED-1);
		}
	}

	if (chac_chacs_queue_write != chac_chacs_queue_read) {
		gpit = chac_chacs_queue [chac_chacs_queue_read];
		chac_chacs_queue_read = (chac_chacs_queue_read + 1) & (MAX_CHAC_CHACKS_QUEUED-1);
		rdm = chac_chacs_state [gpit];
		if (rdm == 3) { 
			shaker_ct = 8; 
			PSGSFXPlay (SFX_STEPON, 2); 
		}
		rdx = chac_chacs_yx [gpit]; rdy = rdx >> 4; rdx &= 0xf;
		_x = rdx; _y = rdy    ; _t = chac_chacs_t1 [rdm]; map_set ();
		_x = rdx; _y = rdy + 1; _t = chac_chacs_t2 [rdm]; map_set ();
		_x = rdx; _y = rdy + 2; _t = chac_chacs_t3 [rdm]; map_set ();
	}
}

#endif
