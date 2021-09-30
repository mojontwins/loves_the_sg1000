// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

#ifdef SMS
	#include "../hw_sms.h"
	#include "../lib/SMSlib.h"
#else
	#include "../hw_sg1000.h"
	#include "../lib/SGlib.h"	
#endif
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

