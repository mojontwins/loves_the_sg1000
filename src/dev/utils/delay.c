// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// delay.c

#include "../lib/SGlib.h"

void delay (unsigned char frames) {
	while (frames --) SG_waitForVBlank ();
}
