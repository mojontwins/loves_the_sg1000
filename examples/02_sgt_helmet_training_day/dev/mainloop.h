// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Main loop & helpers

void player_frame_selector (void) {
	#include "my/player_frame_selector.h"
}

void game_init (void) {

	win_level = game_over = 0;

	// Assets setup. Selects tileset, map, palettes, etc.
	#include "mainloop/asset_setup.h"

	// Load patterns
	#include "my/level_pattern_unpacker.h"

	cls ();

	draw_game_frame ();
	//clean_gauge ();

	hotspots_load ();
	#ifndef DEACTIVATE_KEYS		
		// bolts_load
		memfill (lkact, 1, c_max_bolts);
	#endif		

	if (!warp_to_level)	{
		n_pant = SCR_INI;
		px = (4 + (PLAYER_INI_X << 4)) << FIXBITS;
		py = (PLAYER_INI_Y << 4) << FIXBITS;
	}
	player_to_pixels ();
	player_init ();
		
	#ifdef PERSISTENT_ENEMIES
		enems_persistent_load ();
	#endif		

	#ifdef PERSISTENT_DEATHS
		enems_persistent_deaths_load ();
	#endif

	#ifndef DEACTIVATE_OBJECTS
		pobjs = 0;
	#endif

	#ifdef HOTSPOT_TYPE_STAR
		pstars = 0;
	#endif

	#ifndef DEACTIVATE_KEYS	
		pkeys = 0;
	#endif

	#ifdef ENABLE_RESONATORS
		res_on = 0;
		res_disable = 0;
	#endif

	#ifdef ENABLE_USE_ANIM
		if (!warp_to_level) use_ct = 0;
	#endif

	#ifdef ENABLE_NO
		no_ct = 0;
	#endif	

	#ifdef ENABLE_PROPELLERS
		#ifdef PROPELLERS_ON_BY_DEFAULT
			propellers_on = 1;
		#else
			propellers_on = 0;
		#endif
	#endif

	#ifdef ENABLE_SPRINGS
		#ifdef SPRINGS_ON_BY_DEFAULT
			springs_on = 1;
		#else
			springs_on = 0;
		#endif
	#endif

	#ifdef ENABLE_TIMER
		#ifndef TIMER_RESET_ON_ENTER
			timer = TIMER_INITIAL;
			timer_frames = 50;
			timer_zero = 0;
			otimer = 0xff;
		#endif
		#ifdef TIMER_START_ON
			timer_on = 1;
		#else
			timer_on = 0;
		#endif
	#endif

	#if defined (ENABLE_TILE_GET) && defined (PERSISTENT_TILE_GET)
		// Clear tile_got persistence
		// Point to VRAM @ PERSISTENT_TILE_GET_ADDR + n_pant * 24
		rda = n_pant << 3;
		gp_addr = PERSISTENT_TILE_GET_ADDR + (rda << 1) + rda;

		DISABLE_INTERRUPTS;

		VDPControlPort = LO (PERSISTENT_TILE_GET_ADDR);
		VDPControlPort = HI (PERSISTENT_TILE_GET_ADDR) | 0x40;

		// Write MAP_SIZE*24 zeroes
		for (rds16 = 0; rds16 < MAP_SIZE*24; rds16 ++) VDPDataPort = 0;
			
		ENABLE_INTERRUPTS;
	#endif

	half_life = 0;
	frame_counter = 0;
	olife = oammo = oobjs = okeys = 0xff;
	okilled = 0xff;

	#include "my/extra_inits.h"

	#if defined (ENABLE_INTERACTIVES) && defined (INTERACTIVES_FROM_CODE)
		#include "my/interactives_setup.h"
	#endif

// Tester
	/*
	n_pant = 2; pkeys = 2; pobjs = 5;
	py = 10<<10;px = 7<<10;
	*/
}

void prepare_scr (void) {
	if (!ft) {
		HW_displayOff ();

		#if defined (ENABLE_TILE_GET) && defined (PERSISTENT_TILE_GET)
			// Update tile_got persistence
			// Point to VRAM @ PERSISTENT_TILE_GET_ADDR + on_pant * 24
			rda = on_pant << 3;
			gp_addr = PERSISTENT_TILE_GET_ADDR + (rda << 1) + rda;

			DISABLE_INTERRUPTS;

			VDPControlPort = LO (gp_addr);
			VDPControlPort = HI (gp_addr) | 0x40;

			// Write 24 bytes
			for (gpit = 0; gpit < 24; gpit ++) VDPDataPort = tile_got [gpit];

			ENABLE_INTERRUPTS;		
		#endif
	}

	ft = 0;

	update_list [update_index] = 0xff;
	HW_doUpdateList ();
	clear_update_list ();

	#ifdef ENABLE_PROPELLERS
		// Clear propellers
		prp_idx = 0;
	#endif

	#ifdef PERSISTENT_ENEMIES
		// Preserve enems
		enems_persistent_update ();
	#endif

	enems_load ();
	hotspots_create ();	

	#ifdef ENABLE_COCOS
		cocos_init ();
	#endif	

	#if defined (ACTIVATE_SCRIPTING) && defined (ENABLE_FIRE_ZONE)
		f_zone_ac = 0;
		fzx1 = fzx2 = fzy1 = fzy2 = 240;
	#endif

	#ifdef ENABLE_SHINES
		shine_active_ct = 0;
		max_shines = 0;
	#endif

	#ifdef ENABLE_TILE_CHAC_CHAC
		chac_chacs_queue_write = chac_chacs_queue_read = 0;
		max_chac_chacs = 0;
	#endif

	#if defined (ENABLE_TILE_GET) && defined (PERSISTENT_TILE_GET)
		// Read tile_got persistence
		// Point to VRAM @ PERSISTENT_TILE_GET_ADDR + n_pant * 24
		rda = n_pant << 3;
		gp_addr = PERSISTENT_TILE_GET_ADDR + (rda << 1) + rda;

		DISABLE_INTERRUPTS;

		VDPControlPort = LO (gp_addr);
		VDPControlPort = HI (gp_addr);

		// Read 24 bytes
		for (gpit = 0; gpit < 24; gpit ++) tile_got [gpit] = VDPDataPort;

		ENABLE_INTERRUPTS;
	#endif

		draw_scr ();

	#if defined (ENABLE_BREAKABLE) && defined (BREAKABLE_ANIM)
		do_process_breakable = 0;
		gpit = BREAKABLE_MAX; while (gpit --) brkf [gpit] = 0;
	#endif

	#ifdef LINE_OF_TEXT
		_x = LINE_OF_TEXT_X; _y = LINE_OF_TEXT;
		pr_str ("                              ");
	#endif

	#if defined (DIE_AND_RESPAWN) && (defined (PLAYER_SWIMS) || defined (PLAYER_TOP_DOWN))
		player_register_safe_spot ();
	#endif

	#ifdef PLAYER_CAN_FIRE
		for (gpit = 0; gpit < MAX_BULLETS; gpit ++) {
			b_slots [gpit] = gpit; 
			bst [gpit] = 0;
		}
		b_slots_i = MAX_BULLETS;
	#endif

	#ifdef ENABLE_INTERACTIVES
		#ifdef INTERACTIVES_FROM_CODE
			interactives_create ();
		#else
			interactives_index = 0;
		#endif

		interactives_interact_with = 0xff;
	#endif
	
	// Reenable sprites and tiles now we are finished.
	#ifdef CNROM
		// bankswitch (l_chr_rom_bank [level]);
	#endif

	HW_initSprites ();

	#ifdef ACTIVATE_SCRIPTING
		#if defined (ENABLE_PUSHED_SCRIPT)
			just_pushed = 0;
		#endif
		#if defined (ENABLE_INTERACTIVES)
			just_interacted = 0;
		#endif
		// Entering any script
		run_script (2 * MAP_SIZE + 1);
		// This room script
		run_script (n_pant << 1);
	#endif

	#include "my/on_entering_screen.h"

	gpit = 3; while (gpit --) en_spr_id [gpit] = en_s [gpit];

	prx = px >> FIXBITS; pry = py >> FIXBITS;
	#if defined (PLAYER_PUNCHES) || defined (PLAYER_KICKS)
		phitteract = 0;
	#endif	

	player_move ();
	player_frame_selector ();

	enems_move ();

	if (hrt) hotspots_paint ();
	
	#ifdef ENABLE_INTERACTIVES	
		interactives_paint ();
	#endif

	#ifdef ENABLE_TIMER
		#ifdef TIMER_RESET_ON_ENTER
			timer = TIMER_INITIAL;
			timer_frames = 50;
			timer_zero = 0;
			otimer = 0xff;
		#endif
	#endif

	hud_update ();
	HW_copySpritestoSAT ();
	update_list [update_index] = 0xff;
	HW_doUpdateList ();
	clear_update_list ();	
	HW_displayOn ();

	pad0 = 0;
}

void game_loop (void) {
	clear_update_list ();

	on_pant = 99; ft = 1; fade_delay = 1;

	// MAIN LOOP
	
	#ifdef ACTIVATE_SCRIPTING
		#ifdef CLEAR_FLAGS
			msc_clear_flags ();
		#endif
		
		// Entering game script
		run_script (2 * MAP_SIZE);
	#endif

	ntsc_frame = level_reset = warp_to_level = 0; 
	ticker = 50;

	#ifdef MULTI_LEVEL
		PSGPlay (l_music [level]);
	#else
		PSGPlay (MUSIC_INGAME);
	#endif

	paused = 0; HW_resetPauseRequest ();

	while (1) {

		// Update hud

		#ifdef ACTIVATE_SCRIPTING
			if (n_pant != 0xfe && on_pant != 0xfe) 
		#endif
			hud_update ();

		// Finish him

		if (pkill) player_kill ();
		if (game_over || level_reset) break;			

		// Flick the screen

#pragma save
#pragma disable_warning 110
		flick_override = 0;
		#include "my/custom_flickscreen.h"
		if (flick_override == 0) {
			flickscreen_do_horizontal ();
			flickscreen_do_vertical ();
		}
#pragma restore
		
		// Change screen ?

		if (on_pant != n_pant) {
			prepare_scr ();
			on_pant = n_pant;
		}

		// Relocate player if spawned on a broken tile

		#include "mainloop/relocate_player.h"

		// Shake the screen ? 

		#ifdef ENABLE_SHAKER
			#include "mainloop/shaker.h"
		#endif

		// Effects

		#include "my/effects.h"

		// Finish frame and wait for NMI

		HW_waitForVBlank ();
		HW_copySpritestoSAT ();
		update_list [update_index] = 0xff;
		HW_doUpdateList ();
		clear_update_list ();

		// Poll pads

		pad_read ();
		a_button = (pad_this_frame & PAD_A);
		b_button = (pad_this_frame & PAD_B);

		// Update actors if not paused...

		ntsc_frame ++; if (ntsc_frame == 6) ntsc_frame = 0;

		if (paused == 0 && (ntsc == 0 || ntsc_frame)) {
			HW_initSprites ();
			
			// Count frames		
			if (ticker) -- ticker; else ticker = 50;
			half_life ^= 1;
			++ frame_counter;

			// Detect interactions

			#ifdef ENABLE_INTERACTIVES
				#include "mainloop/interactives.h"
			#endif	

			// Update / collide hotspots

			#include "mainloop/hotspots.h"

			// Automatic scripting calls (USE_ANIM & fire zone)

			#ifdef ACTIVATE_SCRIPTING
				#include "mainloop/scripting.h"
			#endif
			
			// Update player

			if (!warp_to_level) {
				player_move ();
				player_frame_selector ();
			}

			// Timer

			#ifdef ENABLE_TIMER
				#include "mainloop/timer.h"
			#endif

			// Extra checks

			#include "my/extra_checks.h"

			// Win level condition

			#include "mainloop/win_level_condition.h"

			// Update propellers

			#ifdef ENABLE_PROPELLERS
				if (propellers_on) propellers_do ();
			#endif

			// Update bullets

			#ifdef PLAYER_CAN_FIRE
				bullets_move ();
			#endif

			// Update cocos

			#ifdef ENABLE_COCOS
				cocos_do ();
			#endif

			// Paint player

			cur_stp = HW_getStp (); 
			if (!warp_to_level)	player_render ();

			// Update enemies
		
			enems_move ();

			// Warp to level

			if (warp_to_level) {
				update_cycle (); PSGStop (); break;
			}

			// Do resonators

			#ifdef ENABLE_RESONATORS
				#include "mainloop/resonators.h"
			#endif

			// Paint hotspots

			if (hrt) hotspots_paint ();

			// Paint interactives

			#ifdef ENABLE_INTERACTIVES
				interactives_paint ();
			#endif

			// Do breakable tiles

			#if defined (ENABLE_BREAKABLE) && defined (BREAKABLE_ANIM)
				if (do_process_breakable) breakable_do_anim ();
			#endif

			// Update shines

			#ifdef ENABLE_SHINES
				shines_do ();
			#endif

			// Update no

			#ifdef ENABLE_NO
				#include "mainloop/no.h"
			#endif

			// Update chac-chacs

			#ifdef ENABLE_TILE_CHAC_CHAC
				chac_chacs_do ();
			#endif

			#include "my/extra_routines.h"
		}

		// Cheat to skip level

		#include "mainloop/cheat.h"

		// Pause

		#include "mainloop/pause.h"
	}

	PSGStop ();
	PSGSFXStop ();
	HW_displayOff ();
	HW_initSprites ();
	HW_copySpritestoSAT ();	
}
