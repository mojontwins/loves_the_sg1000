// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Simple multidirectional fixed point cocos

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

#ifdef ENABLE_COCOS

	#include "../ram/extern_globals.h"
	#include "../engine/extern_precalcs.h"
	#include "../engine/extern_metasprites.h"
	#include "../engine/general.h"

	void cocos_init (void) {
		coco_it = COCOS_MAX; while (coco_it --) {
			coco_slots [coco_it] = coco_it;
			coco_on [coco_it] = 0;
		}
		coco_slots_i = COCOS_MAX;
	}

	#ifdef COCOS_ENABLE_AIMED
		// Create a coco @ (rdx, rdy), shoot towards player

		void cocos_shoot_aimed (void) {		
			rdct = distance ();

		#ifdef COCO_FAIR_D
			if (rdct > COCO_FAIR_D && coco_slots_i) 
		#else
			if (coco_slots_i)
		#endif
			{
				-- coco_slots_i; coco_it = coco_slots [coco_slots_i];

				coco_x [coco_it] = rdx << 6;
				coco_y [coco_it] = rdy << 6;

				// Apply formula. Looks awkward but it's optimized for space and shitty compiler
				rds16 = COCO_V * rda / rdct; coco_vx [coco_it] = ADD_SIGN2 (px, coco_x [coco_it], rds16);
				rds16 = COCO_V * rdb / rdct; coco_vy [coco_it] = ADD_SIGN2 (py, coco_y [coco_it], rds16);

				coco_on [coco_it] = 1;

				PSGSFXPlay (SFX_COCO, 1);
			}	
		}
	#endif

	#ifdef COCOS_ENABLE_LINEAR
		// Create a coco @ (rdx, rdy), direction rda. LEFT UP RIGHT DOWN

		void cocos_shoot_linear (void) {
			if (coco_slots_i == 0) return;

			-- coco_slots_i; coco_it = coco_slots [coco_slots_i];

			coco_x [coco_it] = rdx << 6;
			coco_y [coco_it] = rdy << 6;

			coco_vx [coco_it] = coco_dx [rda];
			coco_vy [coco_it] = coco_dy [rda];

			coco_on [coco_it] = 1;

			PSGSFXPlay (SFX_COCO, 1);
		}
	#endif

	void cocos_destroy (void) {
		coco_on [coco_it] = 0;
		coco_slots [coco_slots_i] = coco_it; coco_slots_i ++;
		PSGSFXPlay (SFX_DUMMY1, 3);
	}

	void cocos_do (void) {
		coco_it = COCOS_MAX; while (coco_it --) if (coco_on [coco_it]) {
			// Move
			coco_x [coco_it] += coco_vx [coco_it];
			coco_y [coco_it] += coco_vy [coco_it];

			// Out of bounds
			if (coco_x [coco_it] < 0 || coco_x [coco_it] > 248<<FIXBITS || coco_y [coco_it] < 16<<FIXBITS || coco_y [coco_it] > 200<<FIXBITS) {
				cocos_destroy ();
				continue;
			}

			rdx = coco_x [coco_it] >> 6;
			rdy = coco_y [coco_it] >> 6;

			// Render
			HW_addSprite (rdx, rdy + SPRITE_ADJUST, COCO_PATTERN, COCO_COLOUR);

			#ifdef COCO_COLLIDES
				#ifdef SG1000
					rdm = c_behs [map_buff [((rdx + 4) >> 4) | ((rdy + 4 - 16) & 0xf0)]];
				#else
					rdm = map_attr [((rdx + 4) >> 4) | ((rdy + 4 - 16) & 0xf0)];
				#endif
				if (rdm & 8) {
					cocos_destroy (); continue;
				}
			#endif

			// Collide w/player
			if (pflickering == 0 && 
				rdx + 7 >= prx && 
				rdx <= prx + 7 && 
				rdy + 7 + PLAYER_COLLISION_VSTRETCH_FG >= pry && 
				rdy <= pry + 12
			) {
				en_sg_2 = 1;
				#include "../my/on_player_coco.h"
				pkill = en_sg_2;
				cocos_destroy ();
			}		
		}
	}

#endif
	