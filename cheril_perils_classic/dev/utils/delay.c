// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// delay.c

#include "../lib/SGlib.h"

void delay (unsigned char frames) {
	while (frames --) SG_waitForVBlank ();
}
