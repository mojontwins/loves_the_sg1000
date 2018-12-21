// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Simple propellers

#include "../lib/SGlib.h"
#include "../definitions.h"
#include "../config.h"
#include "../autodefs.h"
#include "../my/extra_declarations.h"

#ifdef ENABLE_PROPELLERS

	#include "../ram/extern_globals.h"

	#include "printer.h"
	#include "propellers.h"

	void propellers_add (void) {
		// Store YX for animation
		prp_yx [prp_idx ++] = rdm;
	}

	void propellers_do (void) {
		rdb = half_life << 1;
		gpit = prp_idx; while (gpit --) {
			rda = prp_yx [gpit];
			gp_addr = PNTADDRESS + (
				((rda & 0xf) << 1) | 
				((((rda >> 3) & 0xfe) + TOP_ADJUST) << 5)
			);
			_n = rdb + PROPELLERS_BASE_PATTERN; ul_putc ();
			++ _n; ul_putc ();
		}
	}

#endif
