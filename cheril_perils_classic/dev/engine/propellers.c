// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Simple propellers

#include "../definitions.h"
#include "../config.h"
#include "../autodefs.h"

#ifdef ENABLE_PROPELLERS

#include "../ram/global_externs.h"

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
		gp_addr = 0x2000 + (
			((rda & 0xf) << 1) | 
			((((rda >> 3) & 0xfe) + TOP_ADJUST) << 5)
		);
		_n = rdb + PROPELLERS_BASE_PATTERN; ul_putc ();
		++ _n; ul_putc ();
	}
}

#endif
