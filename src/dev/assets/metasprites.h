// SG-1000 MK1 v0.2
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// spritesets

// Player metasprites
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

// Enemy metasprites
// Framesets are right {anim1, anim2, attacking, dying}, right {anim1, anim2, attacking, dying}.
// Not every kind of enemy has every cell, just use 0 when N/A. dying cell will be used only if ENEMS_ENABLE_DYING_FRAME
const unsigned char * const spr_enems0 [] = {
	// Linear enems and platforms (ids 1-4)
	ss_en_0_00, ss_en_0_01, 0, 0, ss_en_0_02, ss_en_0_03, 0, 0, // 1
	ss_en_0_04, ss_en_0_05, 0, 0, ss_en_0_06, ss_en_0_07, 0, 0, // 1
	ss_en_0_08, ss_en_0_09, 0, 0, ss_en_0_0a, ss_en_0_0b, 0, 0, // 3
	ss_plat_00, ss_plat_01, 0, 0, ss_plat_00, ss_plat_01, 0, 0, // Platform (4)

	ss_fanty_00, ss_fanty_01, 0, 0, ss_fanty_02, ss_fanty_03, 0, 0, // Fanty (offset 32)

	// Explosion (offset 40)
	ss_it_04
};

const unsigned char * const spr_enems1 [] = {
	// Linear enems and platforms (ids 1-4)
	ss_en_1_00, ss_en_1_01, 0, 0, ss_en_1_02, ss_en_1_03, 0, 0, // 1
	ss_en_1_04, ss_en_1_05, 0, 0, ss_en_1_06, ss_en_1_07, 0, 0, // 1
	ss_en_1_08, ss_en_1_09, 0, 0, ss_en_1_0a, ss_en_1_0b, 0, 0, // 3
	ss_plat_00, ss_plat_01, 0, 0, ss_plat_00, ss_plat_01, 0, 0, // Platform (4)

	ss_fanty_00, ss_fanty_01, 0, 0, ss_fanty_02, ss_fanty_03, 0, 0, // Fanty (offset 32)

	// Explosion (offset 40)
	ss_it_04
};

const unsigned char * const spr_enems2 [] = {
	// Linear enems and platforms (ids 1-4)
	ss_en_2_00, ss_en_2_01, 0, 0, ss_en_2_02, ss_en_2_03, 0, 0, // 1
	ss_en_2_04, ss_en_2_05, 0, 0, ss_en_2_06, ss_en_2_07, 0, 0, // 1
	ss_en_2_08, ss_en_2_09, 0, 0, ss_en_2_08, ss_en_2_09, 0, 0, // 3
	ss_plat_00, ss_plat_01, 0, 0, ss_plat_00, ss_plat_01, 0, 0, // Platform (4)

	ss_fanty_00, ss_fanty_01, 0, 0, ss_fanty_02, ss_fanty_03, 0, 0, // Fanty (offset 32)

	// Explosion (offset 40)
	ss_it_04
};

// Item metasprites
// nothing, nothing, key, refill, res_on, res_off
const unsigned char * const spr_hs [] = {
	0, 0, ss_it_01, ss_it_00, ss_it_02, ss_it_03
};

