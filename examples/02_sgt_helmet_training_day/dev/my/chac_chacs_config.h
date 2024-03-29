// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Configure custom chac chacs here. You must define:

// - The CHAC_CHAC_BOUM_STATE constant. 
//   Tells the engine on which state it should play the BOUM sound.
// - The CHAC_CHAC_MAX_STATES constant.
//   Tells the engine how many different states
// - chac_chacs_initial_times
//   Time for state zero upon tile number in map. See docs. 
// - chac_chacs_times
//   How many frames to wait per state change. State 0 (IDLE) time is 
//   defined in ponedor, so the value in the array will be ignored.
// - chac_chacs_t1, chac_chacs_t2, chac_chacs_t3
//   The actual tiles used to draw the three tiles high structures.

// Don't forget to edit my/extra_declarations.h and add defines for
// CHAC_CHAC_BOUM_STATE 3
// CHAC_CHAC_MAX_STATES 6
// there!
/*
const unsigned char chac_chacs_initial_times [] = {
	25, 50, 100
};

const unsigned char chac_chacs_times [] = {
	0, 1, 1, 100, 16, 16
};

const unsigned char chac_chacs_t1 [] = {
	16, 17, 18, 18, 18, 17
};

const unsigned char chac_chacs_t2 [] = {
	 0,  0, 17, 18, 17,  0
};

const unsigned char chac_chacs_t3 [] = {
	 0,  0,  0, 17,  0,  0
};
*/