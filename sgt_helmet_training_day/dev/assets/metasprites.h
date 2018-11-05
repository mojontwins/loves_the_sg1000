// SG-1000 MK1 v0.1
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// spritesets

// Player metasprites
/*
const unsigned char * const spr_player [] = {
	// Facing right (offset 0)
	ss_pl_00,										// Standing (offset 0)
	ss_pl_00, ss_pl_01, ss_pl_00, ss_pl_02,			// Walk cycle (offset 1)
	ss_pl_03, 										// Airborne (offset 5)
	0, 0,											// I like powers of two
	

	// Facing left (offset 8)
	ss_pl_04,										// Standing (offset 0)
	ss_pl_04, ss_pl_06, ss_pl_04, ss_pl_05,			// Walk cycle (offset 1)
	ss_pl_07, 										// Airborne (offset 5)
	0, 0,											// I like powers of two
	
};
*/

// Top-down very basic character (2 frames per facing)
const unsigned char * const spr_player [] = {
	ss_pl_00, ss_pl_01, 							// Right
	ss_pl_02, ss_pl_03,								// Left
	ss_pl_04, ss_pl_05,								// Up
	ss_pl_06, ss_pl_07								// Down
};

// Enemy metasprites
// Framesets are right {anim1, anim2, attacking, dying}, right {anim1, anim2, attacking, dying}.
// Not every kind of enemy has every cell, just use 0 when N/A. dying cell will be used only if ENEMS_ENABLE_DYING_FRAME
const unsigned char * const spr_enems0 [] = {
	// Linear enems and platforms (ids 1-4)
	ss_en_00, ss_en_01, 0, 0, ss_en_00, ss_en_01, 0, 0, // 1
	ss_en_02, ss_en_03, 0, 0, ss_en_02, ss_en_03, 0, 0, // 2
	ss_en_04, ss_en_05, 0, 0, ss_en_04, ss_en_05, 0, 0, // 3
	ss_en_06, ss_en_07, 0, 0, ss_en_06, ss_en_07, 0, 0,	// 4

	// Explosion (offset 32)
	ss_it_00,

	// Steady shooter (offset 33)
	ss_ss_00, ss_ss_01, ss_ss_02, ss_ss_03
};

// Item metasprites
// nothing, object, key, refill, ammo
const unsigned char * const spr_hs [] = {
	0, ss_it_01, ss_it_02, ss_it_03, ss_it_04
};

