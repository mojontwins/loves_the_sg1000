// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

#include "../lib/SGlib.h"
#include "../ram/extern_globals.h"

void unrle_adv (void) {
	VDPDataPort = rdb;
	rds16 ++;
}

void unrle (void) {
	VDPControlPort = LO (PNTADDRESS); VDPControlPort = HI (PNTADDRESS) | 0x40;

	rdc = *gp_gen ++; 	// run code
	rds16 = 0; while (rds16 < 768) {
		rda = *gp_gen ++;
		if (rda == rdc) {
			rda = *gp_gen ++;
			if (rda == 0) break;
			while (rda --) unrle_adv ();
		} else {
			rdb = rda;
			unrle_adv ();
		}
	}
}

