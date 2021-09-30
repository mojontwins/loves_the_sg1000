// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// delay.c

#ifdef SMS
	#include "../hw_sms.h"
	#include "../lib/SMSlib.h"
#else
	#include "../hw_sg1000.h"
	#include "../lib/SGlib.h"	
#endif

void delay (unsigned char frames) {
	while (frames --) HW_waitForVBlank ();
}
