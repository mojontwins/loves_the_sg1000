// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Tile based chac chacs

#ifdef SMS
	#include "../hw_sms.h"
	#include "../lib/SMSlib.h"
#else
	#include "../hw_sg1000.h"
	#include "../lib/SGlib.h"	
#endif
#include "../lib/PSGlib.h"
#include "../murcia.h"

#include "../definitions.h"
#include "../config.h"
#include "../autodefs.h"
#include "../my/extra_declarations.h"

#ifdef ENABLE_TILE_CHAC_CHAC

	#include "../ram/extern_globals.h"
	#include "../engine/extern_precalcs.h"

	#include "../engine/printer.h"
	#include "../engine/tile_chac_chac.h"

	#ifndef CHAC_CHAC_BOUM_STATE
		#define CHAC_CHAC_BOUM_STATE 3
	#endif
	#ifndef CHAC_CHAC_MAX_STATES
		#define CHAC_CHAC_MAX_STATES 6
	#endif

	void chac_chacs_add (void) {
		// Adds chac chac @ YX = rdm
		if (max_chac_chacs == MAX_CHAC_CHACS) return;
		rdc = chac_chacs_initial_times [rdt - CHAC_CHAC_DETECT_TILE];

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
				if (chac_chacs_state [gpit] == CHAC_CHAC_MAX_STATES) chac_chacs_state [gpit] = 0;
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
			if (rdm == CHAC_CHAC_BOUM_STATE) { 
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
