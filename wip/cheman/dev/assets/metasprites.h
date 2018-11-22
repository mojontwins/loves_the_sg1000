// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// spritesets

// Player metasprites

const unsigned char * const spr_player [] = {
	// Facing right (offset 0)
	ss_pl_00,										// Standing (offset 0)
	ss_pl_01, ss_pl_02, ss_pl_03,					// Walk cycle (offset 1)
	ss_pl_04, 										// Airborne (offset 4)

	// Facing left (offset 5)
	ss_pl_00,										// Standing (offset 0)
	ss_pl_05, ss_pl_06, ss_pl_07,					// Walk cycle (offset 1)
	ss_pl_08, 										// Airborne (offset 4)
	
};

/*
// Top-down very basic character (2 frames per facing)
const unsigned char * const spr_player [] = {
	ss_pl_00, ss_pl_01, 							// Right
	ss_pl_02, ss_pl_03,								// Left
	ss_pl_04, ss_pl_05,								// Up
	ss_pl_06, ss_pl_07								// Down
};
*/

// Side-view very basic character (4 frames per facing)
// For this game, this contains two characters with different
// walk cycles (see my/player_frame_selector.h)
/*
const unsigned char * const spr_player [] = {
	// Jet Paco
	// Facing right (offset 0)
	ss_pl_00, ss_pl_01, ss_pl_02, ss_pl_01,			// Walk cycle. offset 1 is also standing
	ss_pl_03,										// Airborne
	// Facing left (offset 5)
	ss_pl_04, ss_pl_05, ss_pl_06, ss_pl_05,			// Walk cycle. offset 1 is also standing
	ss_pl_07,										// Airborne

	// Jet Puri
	// Facing right (offset 10)
	ss_pl_08, ss_pl_09, ss_pl_0a, 0,				// Walk cycle. offset 1 is also standing
	ss_pl_0b,										// Airborne
	// Facing left (offset 15)
	ss_pl_0c, ss_pl_0d, ss_pl_0e, 0,				// Walk cycle. offset 1 is also standing
	ss_pl_0f										// Airborne
};
*/

// Enemy metasprites
// Framesets are right {anim1, anim2, attacking, dying}, right {anim1, anim2, attacking, dying}.
// Not every kind of enemy has every cell, just use 0 when N/A. dying cell will be used only if ENEMS_ENABLE_DYING_FRAME
const unsigned char * const spr_enems0 [] = {
	// Linear enems and platforms (ids 1-4)
	ss_ena_00, ss_ena_01, 0, 0, ss_ena_00, ss_ena_01, 0, 0, // 1
	ss_enb_00, ss_enb_01, 0, 0, ss_enb_00, ss_enb_01, 0, 0, // 1
	ss_enc_00, ss_enc_01, 0, 0, ss_enc_00, ss_enc_01, 0, 0, // 3
	ss_plat_00, ss_plat_00, 0, 0, ss_plat_00, ss_plat_00, 0, 0, // Platform (4)

	// Explosion (offset 40)
	ss_it_03
};

// Item metasprites
// empty, item, key, refill
const unsigned char * const spr_hs [] = {
	ss_it_05, ss_it_00, ss_it_01, ss_it_02 
};

