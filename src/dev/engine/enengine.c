// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// enengine.c
// Enemies Engine & stuff

#include "../lib/SGlib.h"
#include "../lib/PSGlib.h"
#include "../murcia.h"

#include "../definitions.h"
#include "../config.h"
#include "../autodefs.h"
#include "../my/extra_declarations.h"

#include "../ram/extern_globals.h"
#include "../engine/extern_precalcs.h"
#include "../engine/extern_metasprites.h"
#include "../utils/memfill.h"
#include "../utils/rand.h"

#include "../engine/player.h"
#include "../engine/general.h"
#include "../engine/cocos.h"

#ifdef ENABLE_CHAC_CHAC
	void enems_draw_chac_chac (unsigned char a1, unsigned char a2, unsigned char a3) {
		_x = en_x [gpit]; _y = en_y [gpit]    ; _t = a1; map_set ();
		_x = en_x [gpit]; _y = en_y [gpit] + 1; _t = a2; map_set ();
		_x = en_x [gpit]; _y = en_y [gpit] + 2; _t = a3; map_set ();
	}
#endif

#ifdef PERSISTENT_ENEMIES
	void enems_persistent_load (void) {
		DISABLE_INTERRUPTS;

		// Point to free VRAM @ $1B80
		VDPControlPort = 0x80;
		VDPControlPort = 0x1B | 0x40;

		// Populate with all enemies
		gp_gen = (unsigned char *) (c_enems);
		for (gpjt = 0; gpjt < 3 * MAP_SIZE; gpjt ++) {
			gp_gen ++;									// Skip t

			rda = *gp_gen ++;							// Read YX1
			VDPDataPort = rdx = rda << 4;				// Write x
			VDPDataPort = rdy = rda & 0xf0;				// Write y
			
			rda = *gp_gen ++;							// Read YX2
			rdb = rda << 4;
			rdc = rda & 0xf0;
			
			rda = (*gp_gen ++) & 0x0f;					// Read P
			if (rda > 1) rda >>= 1;						// Store converted
			VDPDataPort = ADD_SIGN2 (rdb, rdx, rda);	// Write mx
			VDPDataPort = ADD_SIGN2 (rdc, rdy, rda); 	// Write my 
		}

		ENABLE_INTERRUPTS;
	}

	void enems_persistent_update (void) {
		DISABLE_INTERRUPTS;

		if (on_pant != 99) {
			// Point to VRAM @ 1B80 + on_pant * 12
			gp_addr = 0x1b80 + (on_pant << 3) + (on_pant << 2);
			VDPControlPort = LO (gp_addr);
			VDPControlPort = HI (gp_addr) | 0x40;

			// Update three enemies
			for (gpit = 0; gpit < 3; gpit ++) {
				VDPDataPort = en_x [gpit];				// Write x
				VDPDataPort = en_y [gpit]; 				// Write y
				VDPDataPort = en_mx [gpit];				// Write mx
				VDPDataPort = en_my [gpit];				// Write my
			}
		}

		ENABLE_INTERRUPTS;
	}
#endif

#ifdef PERSISTENT_DEATHS
	void enems_persistent_deaths_load (void) {
		memfill (ep_dead, 0, MAP_SIZE * 3);
	}
#endif

void enems_update_unsigned_char_arrays (void) {
	en_t [gpit] = _en_t;
	en_s [gpit] = _en_s;
	en_x [gpit] = _en_x; en_y [gpit] = _en_y;
	en_x1 [gpit] = _en_x1; en_y1 [gpit] = _en_y1;
	en_x2 [gpit] = _en_x2; en_y2 [gpit] = _en_y2;
	en_mx [gpit] = _en_mx; en_my [gpit] = _en_my;
	en_ct [gpit] = _en_ct;
	en_facing [gpit] = _en_facing;
	en_state [gpit] = _en_state;

	#ifdef ENEMS_NEED_FP
		enf_x [gpit] = _enf_x; enf_vx [gpit] = _enf_vx;
		enf_y [gpit] = _enf_y; enf_vy [gpit] = _enf_vy;
	#endif
}

void enems_facing (void) {
	_en_facing = rda << 2;
}

void enems_init_fp (void) {
	_enf_x = _en_x << 6;
	_enf_y = _en_y << 6;
}

void enems_boioiong_init (void) {
	enems_init_fp ();
	_enf_vy = 0; 
	_enf_vx = ADD_SIGN2 (_en_x2, _en_x1, rdm << FIXBITS);
	#ifdef BOIOIONG_ACTIVE_BY_DEFAULT
		_en_ct = BOIOIONG_INITIAL_TIMER;
	#else
		_en_ct = 0;
	#endif
}

void enems_load (void) {
	gp_gen = (unsigned char *) (c_enems + (n_pant << 2) + (n_pant << 3));

	#if defined (PERSISTENT_DEATHS) 
		en_offs = rdc = (n_pant << 1) + n_pant;
	#endif

	#ifdef PERSISTENT_ENEMIES
		// Point to VRAM @ 1B80 + n_pant * 12
		gp_addr = 0x1b80 + (n_pant << 3) + (n_pant << 2);
		VDPControlPort = LO (gp_addr);
		VDPControlPort = HI (gp_addr);	// Set up for reading. Note there's no | 0x40!
	#endif

	for (gpit = 0; gpit < 3; gpit ++) {
		
		#ifdef PERSISTENT_DEATHS	
			// Fast hack. If enemy is dead, change for type 0 and skip data.
			if (ep_dead [rdc]) {
				_en_t = 0;
				gp_gen += 4;
				#ifdef PERSISTENT_ENEMIES
					// Skip in VRAM as well
					rda = VDPDataPort;
					rdb = VDPDataPort;
					rdm = VDPDataPort;
					rdt = VDPDataPort;
				#endif
			} else 
		#endif
		{
			// First get T, then do whatever I need
			_en_t = *gp_gen ++;
			
			// General...
			_en_state = 0;

			// YX1
			rda = *gp_gen ++;
			_en_y1 = rda & 0xf0;
			_en_x1 = rda << 4;

			// YX2
			rda = *gp_gen ++;
			_en_y2 = rda & 0xf0;
			_en_x2 = rda << 4;
		
			// P, here used for speed
			rda = *gp_gen ++;
						
			// clean nibbles
			rdd = rda & 0xf0; 	// Used for respawn speed!
			rdm = rda & 0x0f; 	// Actual speed.
		
			#ifdef PERSISTENT_ENEMIES
				// Read x, y from VRAM
				_en_x = VDPDataPort;
				_en_y = VDPDataPort;
				_en_mx = VDPDataPort;
				_en_my = VDPDataPort;
			#else
				// Initialize position from ROM
				_en_x = _en_x1;
				_en_y = _en_y1;
			#endif
			
			switch (_en_t & 0x3f) {
				case 1:
				case 2:
				case 3:
				case 4:
					// Linear enems.
					
					_en_ct = 0;			
					_en_s = (_en_t - 1) << 3;

					#ifdef ENABLE_PUNCHIES
						if (_en_t & 0x40) _en_s += PUNCHIES_BASE_SPRID;
					#endif					
					#ifdef ENABLE_SHOOTIES
						if (_en_t & 0x80) _en_s += SHOOTIES_BASE_SPRID;
					#endif

					#ifndef PERSISTENT_ENEMIES
						_en_mx = ADD_SIGN2 (_en_x2, _en_x1, rdm);
						_en_my = ADD_SIGN2 (_en_y2, _en_y1, rdm);
					#endif
					
					// HL conversion		

					if (rdm == 1) {
						en_status [gpit] = 1; 
					} else {
						en_status [gpit] = 0;
						#ifndef PERSISTENT_ENEMIES
							_en_mx >>= 1;
							_en_my >>= 1;					
						#endif	
					}

					// Fix limits so 1 < 2 always.
					if (_en_x1 > _en_x2) { rda = _en_x1; _en_x1 = _en_x2; _en_x2 = rda; }
					if (_en_y1 > _en_y2) { rda = _en_y1; _en_y1 = _en_y2; _en_y2 = rda; }

					#ifdef ENEMS_CAN_RESPAWN
						en_respawn [gpit] = rdd;
						en_resx [gpit] = _en_x;
						en_resy [gpit] = _en_y;
						en_resmx [gpit] = _en_mx;
						en_resmy [gpit] = _en_my;
					#endif

					break;

				#ifdef ENABLE_STEADY_SHOOTERS
					case 5:
						// _en_my = direction (LEFT UP RIGHT DOWN)
						if (_en_x2 > _en_x1) _en_my = 2;
						else if (_en_x2 < _en_x1) _en_my = 0;
						else if (_en_y2 > _en_y1) _en_my = 3;
						else _en_my = 1;
						_en_s = STEADY_SHOOTERS_BASE_SPRID + _en_my;

						// _en_mx = frequency from the attr
						_en_ct = _en_mx = rda;
						break;
				#endif

				#if defined (ENABLE_FANTY) || defined (ENABLE_HOMING_FANTY) || defined (ENABLE_TIMED_FANTY)
					case 6:
						// Fantys
						enems_init_fp ();
						_enf_vx = _enf_vy = 0;
						#ifdef ENABLE_TIMED_FANTY
							_en_ct = FANTY_BASE_TIMER;
						#endif

						_en_s = FANTY_BASE_SPRID;
						break;
				#endif

				#ifdef ENABLE_PURSUERS
					case 7:
						// Pursuers
						_en_ct = DEATH_COUNT_EXPRESSION;	
						#ifdef ENABLE_GENERATORS
							en_generator_life [gpit] = GENERATOR_LIFE_GAUGE;
							gen_was_hit [gpit] = 0;
						#endif	
						_en_s = ((TYPE_7_FIXED_SPRITE - 1) << 3);
						break;
				#endif	

				#ifdef ENABLE_SAW
					case 8:
						// Saws
						#ifdef PERSISTENT_ENEMIES
							// Initialize position from ROM
							_en_x = _en_x1;
							_en_y = _en_y1;							
						#endif

						_en_mx = ADD_SIGN2 (_en_x2, _en_x1, rdm);
						_en_my = ADD_SIGN2 (_en_y2, _en_y1, rdm);

						// emerging sense
						rda = ABS (_en_mx); if (!rda) rda = ABS (_en_my);
						-- rda;

						// Sense
						rdb = (_en_x1 != _en_x2) ? 
							SGNC (_en_x2, _en_x1, SAW_V_DISPL) :
							SGNC (_en_y2, _en_y1, SAW_V_DISPL);

						// Store:
						_en_my = rda; // EMERGING SENSE
						_en_mx = rdb; // MOVING SENSE

						_en_state = 1;
						_en_ct = SAW_EMERGING_STEPS;

						break;
				#endif		

				#ifdef ENABLE_PEZONS
					case 9:
						// Pezones

						// Initialize
						_en_my = PEZON_WAIT + (rda << 3);	// Speed in colocador defines idle time! (x8)
						_en_mx = _en_my;

						_en_s = PEZONS_BASE_SPRID;
						break;
				#endif

				#ifdef ENABLE_CHAC_CHAC
					case 10:
						// Cuchillas Chac Chac

						_en_my = (rda << 4);	// IDLE_1
						_en_x = _en_x1 >> 4;
						_en_y = (_en_y1 >> 4) - 1;
						_en_mx = _en_my;

						break;
				#endif

				#ifdef ENABLE_MONOCOCOS
					case 11:
						// Monococos
						_en_state = 0; _en_ct = MONOCOCO_BASE_TIME_HIDDEN - (rand8 () & 0x15);
						_en_s = MONOCOCO_BASE_SPRID;
						break;
				#endif

				#ifdef ENABLE_CATACROCKS
					case 12:
						// Catacrocks
						enems_init_fp ();
						_en_state = 0;
						CATACROCK_WAIT = _en_ct = rdm << 5;
						break;
				#endif

				#ifdef ENABLE_BOIOIONG
					case 13:
						// Boioiongs
						#ifdef PERSISTENT_ENEMIES
							// Initialize position from ROM
							_en_x = _en_x1;
							_en_y = _en_y1;							
						#endif
						enems_boioiong_init ();
						_en_mx = rdm; // Store
						_en_s = BOIOIONG_BASE_SPRID;
						break;
				#endif

				#ifdef ENABLE_COMPILED_ENEMS
					case 20:
						#ifdef PERSISTENT_ENEMIES
							// Initialize position from ROM
							_en_x = _en_x1;
							_en_y = _en_y1;							
						#endif
						_en_ct = 0;
						en_rawv [gpit] = _en_s = COMPILED_ENEMS_BASE_SPRID;
						en_behptr [gpit] = en_behptrs [rda];
						_en_x1 = 1; 	// Repurpose for speed
						break;
				#endif

				#ifdef ENABLE_SIMPLE_WARPERS
					case 0x3f:
						_en_mx = rda;
						break;
				#endif				
			}

			#ifdef NEEDS_LIFE_GAUGE_LOGIC
				#if (defined (ENABLE_FANTY) || defined (ENABLE_HOMING_FANTY)) && defined (FANTY_LIFE_GAUGE)
					en_life [gpit] = _en_t == 6 ? FANTY_LIFE_GAUGE : ENEMS_LIFE_GAUGE;
				#else
					en_life [gpit] = ENEMS_LIFE_GAUGE;
				#endif
			#endif
			
			en_cttouched [gpit] = 0;
			en_flags [gpit] = 0;
		}
		#if defined (PERSISTENT_DEATHS)
			++ rdc;
		#endif

		enems_update_unsigned_char_arrays ();
	}
}

#ifdef ENEMS_MAY_DIE
	void enems_kill () {
		en_flags [gpit] |= EN_STATE_DEAD;
		#ifdef ENEMS_CAN_RESPAWN
			if (en_respawn [gpit]) _en_ct = en_respawn [gpit];
		#endif

		#ifdef PERSISTENT_DEATHS
			ep_dead [en_offs + gpit] = 1;
		#endif

		#ifdef ACTIVATE_SCRIPTING
			run_script (2 * MAP_SIZE + 5);
		#endif

		#if defined (ENABLE_STEADY_SHOOTERS) && !(defined (STEADY_SHOOTER_KILLABLE) && defined (STEADY_SHOOTER_COUNT))
			if (_en_t != 5)
		#endif
		{
			++ pkilled;
			#ifdef COUNT_KILLED_IN_FLAG
				++ flags [COUNT_KILLED_IN_FLAG];
			#endif
		}
	}

	void enems_hit (void) {
		_en_facing = ((_en_x < prx) ? 0 : 4);
		en_cttouched [gpit] = ENEMS_TOUCHED_FRAMES;
		#ifdef NEEDS_LIFE_GAUGE_LOGIC
			-- en_life [gpit]; 
			if (en_life [gpit] == 0) 
		#endif
		{
			#ifdef ENABLE_PURSUERS
				if (_en_t == 7) {
					_en_state = 0;
					_en_ct = DEATH_COUNT_EXPRESSION;
					#ifdef NEEDS_LIFE_GAUGE_LOGIC
						en_life [gpit] = ENEMS_LIFE_GAUGE;	
					#endif
				} else 
			#endif
			{
				enems_kill ();
			}
		}
	}
#endif

void enems_move (void) {
#ifndef PLAYER_TOP_DOWN	
	pgotten = pgtmx = pgtmy = 0;
#endif
	
	// Updates sprites
	touched = 0;
	++ en_initial; if (en_initial >= 3) en_initial = 0;
	gpit = en_initial;
	gpjt = 3; while (gpjt --) {
		gpit += 2; if (gpit > 2) gpit -=3;
		
		// Copy arrays -> temporal vars in ZP
		_en_t = en_t [gpit];
		_en_s = en_s [gpit];
		_en_x = en_x [gpit]; _en_y = en_y [gpit];
		_en_x1 = en_x1 [gpit]; _en_y1 = en_y1 [gpit];
		_en_x2 = en_x2 [gpit]; _en_y2 = en_y2 [gpit];
		_en_mx = en_mx [gpit]; _en_my = en_my [gpit];
		_en_ct = en_ct [gpit];
		_en_facing = en_facing [gpit];
		_en_state = en_state [gpit];

		#ifdef ENEMS_NEED_FP
			_enf_x = enf_x [gpit]; _enf_vx = enf_vx [gpit];
			_enf_y = enf_y [gpit]; _enf_vy = enf_vy [gpit];
		#endif		

		if (_en_t == 0) continue;
		en_is_alive = !(en_flags [gpit] & EN_STATE_DEAD);
	
		// Clear selected sprite
		// Means don't render (can/will be overwritten):
		en_spr = 0xff;

		// "touched" state control
		en_spr_x_mod = 0;

		#ifdef ENEMS_MAY_DIE
			if (en_cttouched [gpit]) {
				-- en_cttouched [gpit];
				#ifdef ENEMS_FLICKER
					if (
						half_life
						#ifdef ENEMS_FLICKER_ONLY_ON_DYING
						|| !en_flags [gpit]
						#endif
					) {
						#ifdef ENEMS_ENABLE_DYING_FRAME
							rda = _en_s + _en_facing + 3;
							if (spr_enems [rda]) en_spr = rda; 
							else
						#endif
						en_spr = en_spr_id [gpit];	
					} 
				#else
					rda = frame_counter & 0xf;
					SG_addMetaSprite1x1 (
						_en_x + jitter [rda],
						_en_y + jitter [15 - rda] + SPRITE_ADJUST, 
						spr_enems [ENEMS_EXPLODING_CELL]
					);
					#ifndef ENEMS_EXPLODING_CELLS_HIDES
						if (en_life [gpit]) en_spr = en_spr_id [gpit];
					#endif
				#endif

				#ifdef ENEMS_TREMBLE
					en_spr_x_mod = half_life;
				#endif

				#ifdef ENEMS_RECOIL_ON_HIT
					#include "../engine/enemmods/enems_recoiling.h"
				#endif
			} else
		#endif
		
		// Enemy is considered active if...

		if (en_is_alive) {

			// Gotten preliminary:
			pregotten = (prx + 7 >= _en_x && prx <= _en_x + 15);

			// Select frame upon screen position:
			en_fr = ((((_en_mx) ? _en_x : _en_y)+4) >> 3) & 1;
			
			#ifdef ENABLE_RESONATORS
				if (res_on 
					#ifndef PLAYER_TOP_DOWN
						&& _en_t != 4
					#endif
					#ifdef ENABLE_STEADY_SHOOTERS
						&& _en_t != 5
					#endif
					#ifdef ENABLE_SAW
						&& _en_t != 8 
					#endif
					#ifdef ENABLE_CHAC_CHAC
						&& _en_t != 10
					#endif
				) {
					en_spr = en_spr_id [gpit];
				} else
			#endif
			{
				switch (_en_t & 63) {
					case 1:
					case 2:
					case 3:
					case 4:
					
						#include "../engine/enemmods/enem_linear.h"
						#ifdef ENABLE_SHOOTIES
							#include "../engine/enemmods/enem_shooty.h"
						#endif				
						#ifdef ENABLE_PUNCHIES
							#include "../engine/enemmods/enem_punchy.h"
						#endif
						break;

					#ifdef ENABLE_STEADY_SHOOTERS
						case 5:
							#include "../engine/enemmods/enem_steady_shooter.h"
							break;
					#endif

					#ifdef ENABLE_FANTY					
						case 6:
							#include "../engine/enemmods/enem_fanty.h"
							break;
					#endif

					#ifdef ENABLE_HOMING_FANTY
						case 6:
							#include "../engine/enemmods/enem_homing_fanty.h"
							break;
					#endif

					#ifdef ENABLE_TIMED_FANTY
						case 6:
							#include "../engine/enemmods/enem_timed_fanty.h"
							break;
					#endif

					#ifdef ENABLE_PURSUERS					
						case 7:					
							#include "../engine/enemmods/enem_pursuers.h"
							break;
					#endif

					#ifdef ENABLE_SAW					
						case 8:
							#include "../engine/enemmods/enem_saw.h"
							break;
					#endif		

					#ifdef ENABLE_PEZONS
						case 9:
							#include "../engine/enemmods/enem_pezon.h"
							break;
					#endif

					#ifdef ENABLE_CHAC_CHAC
						case 10:
							#include "../engine/enemmods/enem_chac_chac.h"
							break;
					#endif

					#ifdef ENABLE_MONOCOCOS
						case 11:
							#include "../engine/enemmods/enem_monococo.h"
							break;
					#endif	

					#ifdef ENABLE_CATACROCKS
						case 12:
							#include "../engine/enemmods/enem_catacrock.h"
							break;
					#endif

					#ifdef ENABLE_BOIOIONG
						case 13:
							#include "../engine/enemmods/enem_boioiong.h"
							break;
					#endif

					#ifdef ENABLE_SIMPLE_WARPERS
						case 0x3f:
							en_spr = SIMPLE_WARPERS_BASE_SPRID;
							break;
					#endif

					#ifdef ENABLE_COMPILED_ENEMS
						case 20:
							#include "../engine/enemmods/enem_compiled.h"
							break;
					#endif
				}

				// Store corrent sprite frame as calculated
				
				en_spr_id [gpit] = en_spr;
			}

			// Warp player?

			#ifdef ENABLE_SIMPLE_WARPERS
				if (_en_t == 0xff) {
					if (collide ()
					#ifdef SIMPLE_WARPERS_FIRE_BUTTON
						&& (pad_this_frame & PAD_B)
					#endif
					) {
						n_pant = _en_mx; on_pant = 0xff;
						prx = _en_x2; px = prx << FIXBITS;
						pry = _en_y2; py = pry << FIXBITS;
						player_stop ();

						#if defined (SIMPLE_WARPERS_FIRE_BUTTON) && (defined (PLAYER_PUNCHES) || defined (PLAYER_KICKS))
							phitteract = 0;
							#ifdef PLAYER_PUNCHES
								ppunching = 0;
							#endif
							#ifdef PLAYER_KICKS
								pkicking = 0;
							#endif
						#endif

						b_button = 0;
						break;
					}
					goto skipdo;
				}
			#endif

			// Moving platforms

			#ifndef PLAYER_TOP_DOWN
				if (_en_t == 4 && pregotten && !pgotten && !pj) {
					
					// Horizontal moving platforms
					
					if (_en_mx) {
						if (pry + 16 >= _en_y && pry + 12 <= _en_y) {
							pgotten = 1;
							pgtmx = _en_mx << (6 - en_status [gpit]);
							py = (_en_y - 16) << 6; pry = py >> 6;
						}
					}
					
					// Vertical moving platforms
					
					if (
						(_en_my < 0 && pry + 17 >= _en_y && pry + 12 <= _en_y) ||
						(_en_my > 0 && pry + 16 + _en_my >= _en_y && pry + 12 <= _en_y)
					) {
						pgotten = 1;
						pgtmy = _en_my << (6 - en_status [gpit]);
						py = (_en_y - 16) << 6; pry = py >> 6;
						pvy = 0;
					}
				}

				#ifdef PLAYER_SPINS
					if (pgotten) pspin = 0;
				#endif
			#endif

			// Is enemy collidable? If not, exit

			if (
					en_is_alive == 0	// General condition.
				#ifdef ENEMS_MAY_DIE
					|| en_cttouched [gpit]
				#endif
				#ifndef PLAYER_TOP_DOWN				
					|| _en_t == 4
				#endif
				#ifdef ENABLE_PURSUERS
					|| (_en_t == 7 && _en_state != 2)
				#endif
				#ifdef ENABLE_SAW
					|| (_en_t == 8 && _en_state != 2)
				#endif
				#ifdef ENABLE_PEZONS
					|| (_en_t == 9 && _en_state == 0)
				#endif
				#ifdef ENABLE_CHAC_CHAC
					|| _en_t == 10
				#endif
				#ifdef ENABLE_MONOCOCOS
					|| (_en_t == 11 && _en_mx != 2)
				#endif
				#ifdef ENABLE_CATACROCKS
					|| (_en_t == 12 && _en_state != 1)
				#endif
				#ifdef ENABLE_BOIOIONG
					|| (_en_t == 13 && _en_ct == 0)
				#endif
			) goto skipdo;

			// Collide with player (includes step over enemy)

			// Step over enemy?
			#if (defined (PLAYER_HAS_JUMP) || defined (PLAYER_AUTO_JUMP)) && defined (PLAYER_STEPS_ON_ENEMS)

				if (
					pregotten && 
					pry < _en_y && 
					pry + 15 + ENEMS_COLLISION_VSTRETCH_FG >= _en_y &&
					pgotten == 0 &&	ppossee == 0
					#if defined (ENABLE_RESONATORS) && !defined (PLAYER_STEPS_STRICT)
						&& pvy > 0
					#endif
					#ifdef PLAYER_STEPS_STRICT
						&& pvy > PLAYER_VY_FALLING_MIN
					#endif
					#ifndef STEADY_SHOOTER_KILLABLE
						&& _en_t != 5
					#endif	
					#ifdef ENABLE_SAW
						&& _en_t != 8
					#endif
				) {
				
					#ifdef ENABLE_RESONATORS
						if (res_on || res_disable)
					#endif
					#ifdef PLAYER_STEPS_MIN_KILLABLE
						if (_en_t >= PLAYER_STEPS_MIN_KILLABLE)
					#endif
					enems_hit ();
				
					#ifdef PLAYER_SAFE_LANDING
						if (_en_my < 0) _en_my = -_en_my;
					#endif

					#ifdef PLAYER_HAS_JUMP
						if (pad0 & PAD_A) {
							jump_start ();
						} else 
					#endif						
					{
						pvy = -PLAYER_VY_JUMP_INITIAL << 1;
					}
					PSGSFXPlay (SFX_STEPON, 3);

					#ifdef PLAYER_AUTO_JUMP
						jump_start ();
					#endif

					if (pry > _en_y - ENEMS_UPPER_COLLISION_BOUND) { pry = _en_y - ENEMS_UPPER_COLLISION_BOUND; py = pry << FIXBITS; }

					touched = 1;
				} else
			#endif

			if (
				#if defined (ENABLE_STEADY_SHOOTERS) && defined (STEADY_SHOOTERS_HARMLESS)
					_en_t != 5 &&
				#endif
				touched == 0 &&
				collide ()
			) {
				// en_sg_1 => kill enemy
				#ifdef ENEMIES_SUFFER_ON_PLAYER_COLLISION
					en_sg_1 = 1;
				#else
					en_sg_1 = 0;
				#endif
				
				// en_sg_2 => kill player.
				en_sg_2 = (pflickering == 0);

				#ifdef ENABLE_RESONATORS
					// If resonators are on and not a saw, don't kill player
					if (
						res_on == 1
						#ifdef ENABLE_SAW
						&& _en_t != 8
						#endif
					) en_sg_2 = 0;
				#endif

				#ifdef PLAYER_SPINS
					// If spinning and not a saw or a steady shooter 
					// kill enemy, don't kill player
					if (pspin
						#ifndef STEADY_SHOOTER_KILLABLE
							&& _en_t != 5
						#endif	
						#ifdef ENABLE_SAW
							&& _en_t != 8
						#endif
					) {
						en_sg_2 = 0;
						en_sg_1 = 1;
						pvy = -pvy;
						PSGSFXPlay (SFX_STEPON, 3);
					}
				#endif				

				#include "../my/on_player_hit.h"

#pragma save
#pragma disable_warning 126
				#ifdef ENEMS_MAY_DIE
					if (en_sg_1) enems_hit ();
				#endif
#pragma restore
					
				if (en_sg_2) { 
					pkill = 1; 
					#if defined (PLAYER_BOUNCES) && !defined (DIE_AND_RESPAWN)
						pvx = ADD_SIGN (_en_mx, PLAYER_V_REBOUND); 
						pvy = ADD_SIGN (_en_my, PLAYER_V_REBOUND); 
						
						#ifdef ENABLE_COMPILED_ENEMS
						if (_en_t != 20)
						#endif
						{
							if (!_en_mx) _en_my = ADD_SIGN (_en_y - pry, ABS (_en_my));
							_en_mx = ADD_SIGN (_en_x - prx, ABS (_en_mx));
						}

					#endif	
				}
				touched = 1; 
			}

			// Is enemy killable? If not, exit
			// Compile may complain for if (touched || blah).
#pragma save
#pragma less_pedantic
#pragma disable_warning 110
			if (
				touched
				#ifndef STEADY_SHOOTER_KILLABLE
					|| _en_t == 5
				#endif					
				#ifdef ENABLE_SAW
					|| _en_t == 8
				#endif
			) goto skipdo;
#pragma restore
			// Hit enemy

			#if defined (PLAYER_PUNCHES) || defined (PLAYER_KICKS)
				if (phitteract) {
					if (
						phitterx + 6 >= _en_x &&
						phitterx <= _en_x + 14 &&
						phittery + 7 + ENEMS_COLLISION_VSTRETCH_FG >= _en_y &&
						phittery <= _en_y + 12
					) {
						enems_hit ();
						PSGSFXPlay (SFX_STEPON, 3);
						phitteract = 0;
						pfrozen = PLAYER_FROZEN_FRAMES;
						#ifdef ENEMS_RECOIL_ON_HIT
							if (_en_t != 5 && _en_t != 9 && _en_t != 11) {
								#ifdef PLAYER_TOP_DOWN
									if (bmx [bi]) {
										en_rmy [gpit] = 0;
								#endif
									en_rmx [gpit] = ENEMS_RECOIL_X;
								#ifdef PLAYER_TOP_DOWN
									} else {
										en_rmx [gpit] = 0;
										en_rmy [gpit] = ENEMS_RECOIL_Y;
									}
								#endif
							}
						#endif
					}
				} 
			#endif

			#ifdef PLAYER_CAN_FIRE
				// Bullets
				bi = MAX_BULLETS; while (bi --) if (bst [bi]) {
					#ifdef ENABLE_PURSUERS
						if (_en_t != 7 || _en_state == 2)
					#endif
					
					if (collide_in (bx [bi] + 3, by [bi] + 3, _en_x, _en_y)) {
						PSGSFXPlay (SFX_ENHIT, 3);
						
						#ifdef BULLETS_DONT_KILL
							en_cttouched [gpit] = ENEMS_TOUCHED_FRAMES;
						#else
							#ifdef PLAYER_BULLETS_MIN_KILLABLE
								if (_en_t >= PLAYER_BULLETS_MIN_KILLABLE)
							#endif
							enems_hit ();
						#endif

						#ifdef ENEMS_RECOIL_ON_HIT
							if (_en_t != 5 && _en_t != 9 && _en_t != 11) {
								#ifdef PLAYER_TOP_DOWN
									if (bmx [bi]) {
										en_rmy [gpit] = 0;
								#endif
									en_rmx [gpit] = ENEMS_RECOIL_X;
								#ifdef PLAYER_TOP_DOWN
									} else {
										en_rmx [gpit] = 0;
										en_rmy [gpit] = ENEMS_RECOIL_Y;
									}
								#endif
							}
						#endif

						bullets_destroy ();
						break;
					}
				}
			#endif
		} 

		#ifdef ENEMS_CAN_RESPAWN
			else {
				if (en_respawn [gpit]) {
					if (_en_ct ) -- _en_ct; else {
						// Respawn
						
						_en_x = en_resx [gpit]; _en_mx = en_resmx [gpit];
						_en_y = en_resy [gpit]; _en_my = en_resmy [gpit];
						
						#if (defined (ENABLE_FANTY) || defined (ENABLE_HOMING_FANTY))
							enems_init_fp ();
							#ifdef NEEDS_LIFE_GAUGE_LOGIC
								en_life [gpit] = _en_t == 6 ? FANTY_LIFE_GAUGE : ENEMS_LIFE_GAUGE;
							#endif
						#else
							#ifdef NEEDS_LIFE_GAUGE_LOGIC
								en_life [gpit] = ENEMS_LIFE_GAUGE;
							#endif
						#endif

						en_cttouched [gpit] = 50;
						en_rmx [gpit] = 0;
						en_flags [gpit] = EN_STATE_SPAWNING;
					}
				}
			}
		#endif

skipdo: 
		// Render enemy metasprite en_spr

		if (en_spr != 0xff) {
			SG_addMetaSprite1x1 (
				_en_x + en_spr_x_mod, _en_y + SPRITE_ADJUST, 
				spr_enems [en_spr]
			);
		}

		// Update arrays

		enems_update_unsigned_char_arrays ();
	}	
}
