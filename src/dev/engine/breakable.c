// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// breakable.c
// Manages breakable blocks and animations

#include "../lib/SGlib.h"
#include "../lib/PSGlib.h"

#include "../definitions.h"
#include "../config.h"
#include "../autodefs.h"
#include "../murcia.h"
#include "../my/extra_declarations.h"

#ifdef ENABLE_BREAKABLE

	#include "../ram/extern_globals.h"
	#include "../engine/extern_precalcs.h"

	#include "../engine/printer.h"

	#ifdef BREAKABLE_ANIM
		void breakable_do_anim (void) {
			do_process_breakable = 0;
			gpit = BREAKABLE_MAX; while (gpit --) {
				if (brkf [gpit]) {
					++ brkf [gpit];
					if (brkf [gpit] == BREAKABLE_MAX_FRAMES) {
						brkf [gpit] = 0;
						_x = brkx [gpit]; _y = brky [gpit]; _t = BREAKABLE_ERASE;
						map_set ();
					} else {
						do_process_breakable = 1;
					}
				}
			}
		}
	#endif

	void breakable_break (unsigned char x, unsigned char y) {
		#ifndef BREAKABLES_SOFT
			gp_addr = BREAKABLE_VRAM_ADDR + COORDS (x, y);
			DISABLE_INTERRUPTS;
			VDPControlPort = LO (gp_addr);
			VDPControlPort = HI (gp_addr);	// Set up for reading. Note there's no | 0x40!
			rda = VDPDataPort;
			ENABLE_INTERRUPTS;

			if (rda < BREAKABLE_LIFE) {
				++ rda;
				DISABLE_INTERRUPTS;
				VDPControlPort = LO (gp_addr);
				VDPControlPort = HI (gp_addr) | 0x40;
				VDPDataPort = rda;
				ENABLE_INTERRUPTS;
			} else 
		#endif
		{
			PSGSFXPlay (SFX_BREAKH, 2);
	#ifdef BREAKABLE_ANIM
			// Unsafe but short & fast. Adjust BREAKABLE_MAX if this breaks your game
			gpit = BREAKABLE_MAX; while (gpit --) {
				if (!brkf [gpit]) {
					do_process_breakable = 1;
					brkf [gpit] = 1;
					_x = brkx [gpit] = x;
					_y = brky [gpit] = y;
					_t = BREAKABLE_BREAKING;
					map_set ();					// Break tile!
					PSGSFXPlay (SFX_BREAKB, 2);
					break;						// HA HA HA
				}
			}
	#else
			_x = x; _y = y; _t = BREAKABLE_ERASE;
			map_set ();
	#endif		
		}
	}

#endif