// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// To generate a PAL version, 
// 1.- build_assets.bat pal
// 2.- make clean
// 3.- uncoment:
//#define PAL
// 4.- compile.bat

/*
// Comment this when you are done
#define DEBUG
#define DEBUG_LEVEL		0
#define DEBUG_SCR_INI	20
#define DEBUG_INI_X		14
#define DEBUG_INI_Y		5
//
*/

#define MAX_BOLTS 16 // max 32, make it as small as possible.

/*	Beware!

	SG-1000 MK1 v0.1 needs the custom SGlib-MT configured with
	#define AUTOCYCLE_SPRITES				// Sprites cycle automaticly
	#define AUTOCYCLE_PRIME			3		// Prime to 32.
	#define AUTOCYCLE_INIT_PRIME 	3		// Prime to 32.
	#define AUTODETECT_ONE_COLOUR			// Detect 1 colour sprites in SG_addMetaSprite1x1
	#define AUTOMUSIC						// ISR calls PSGPlay and PSGSFXPlay
	#define ONLY_ONE_CONTROLLER
*/

#include "lib/SGlib.h"
#include "lib/PSGlib.h"
#include "lib/aPLib.h"

#include "utils/rand.h"
#include "utils/delay.h"
#include "utils/memfill.h"
#include "utils/unpacker.h"
#include "utils/unrle.h"

#include "definitions.h"
#include "config.h"
#include "autodefs.h"
#include "my/extra_defines.h"

// **************
// * const data *
// **************

#include "murcia.h"					// Music + SFX
#include "engine/precalcs.h"
#include "assets/behs.h"
#include "assets/map0.h"
#include "assets/enems0.h"
#include "assets/map1.h"
#include "assets/enems1.h"
#include "assets/map2.h"
#include "assets/enems2.h"
#include "assets/spriteset.h"
#include "assets/tileset.h"
#include "assets/metasprites.h"
#include "assets/custom_texts.h"
#ifdef ENABLE_COMPILED_ENEMS
	#include "assets/compiled_enems.h"
#endif
#if defined (ENABLE_INTERACTIVES) && defined (INTERACTIVES_FROM_CODE)
	#include "assets/interactives.h"
#endif
#ifdef MULTI_LEVEL
	#include "assets/levelset.h"
#endif
//#include "assets/title_rle.h"
//#include "assets/hud_rle.h"

// RAM (make fit!)
#include "ram/globals.h"

// *************
// Main includes
// *************

#include "engine/prototypes.h"
#include "engine/printer.h"
#include "engine/general.h"
#ifdef ENABLE_TEXT_BOX
	#include "engine/textbox.h"
#endif
#include "my/extra_modules.h"
#ifdef ENABLE_BREAKABLE
	#include "engine/breakable.h"
#endif
#include "engine/hotspots.h"
#ifdef ENABLE_PROPELLERS
	#include "engine/propellers.h"
#endif
#ifdef ENABLE_TILE_CHAC_CHAC
	#include "engine/tile_chac_chac.h"
#endif
#ifdef ENABLE_SHINES
	#include "engine/shines.h"
#endif
#ifdef ENABLE_INTERACTIVES
	#include "engine/interactives.h"
#endif
#ifdef ENABLE_COCOS
	#include "engine/cocos.h"
#endif
#include "engine/player.h"
#include "engine/enengine.h"
#if (defined (ACTIVATE_SCRIPTING) && defined (ENABLE_EXTERN_CODE)) || defined (ENABLE_COMPILED_ENEMS)
	#include "my/extern.h"
#endif
#include "engine/frame.h"
#include "my/pres.h"
#ifdef ACTIVATE_SCRIPTING
	#include "assets/mscnes.h"
#endif
#include "mainloop/flickscreen.h"
#include "mainloop.h"

// *************
// Main function
// *************

void main(void) {
	SG_displayOff ();
	SG_setSpriteMode (SG_SPRITEMODE_LARGE);
	SG_setUpdateList (update_list);
	first_game = 1;

	#ifdef PAL
		ntsc = 0;
	#else
		ntsc = 1;
	#endif

	// Unpack font
	unpack_bg_patterns (tsfont_patterns_c, tsfont_colours_c, 0, 7);

	credits ();

	// Unpack fixed sprites
	aPLib_depack_VRAM (SGT_BASE, ss_fixed_patterns_c);
	
	mode_no_resonators = 0;
	while (1) {	
		title ();
		
		level = 0;
		plife = PLAYER_LIFE;

		// Game loop

		while (1) {
			pres (scr_level, 0);
			game_init (); 
			game_loop ();

			if (game_over) {
				pres (scr_game_over, MUSIC_GOVER);
				break;
			} else {
				level ++;
				if (level == MAX_LEVELS) {
					pres (scr_the_end, 0);
					break;
				}
			}
		}

		first_game = 0;
	}
}
