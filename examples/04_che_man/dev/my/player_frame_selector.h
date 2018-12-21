// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// player_frame_selector.h
// Selects the correct metasprite upon player state

// You may (will) need to tinker with this for your game.
// Use player variables p* and end up with a correct value
// in psprid.


if (ppossee || pgotten) {
	// On the floor
	if (pvx > PLAYER_VX_MIN || pvx < -PLAYER_VX_MIN) {
		if ((prx >> 3) != ol_prx) { 
			pfr ++; if (pfr == 3) pfr = 0;
			ol_prx = prx >> 3;
		}
		psprid = CELL_WALK_CYCLE + pfr;
	} else { psprid = CELL_IDLE; pfr = 0; }
} else psprid = CELL_AIRBORNE;

psprid += pfacing;
