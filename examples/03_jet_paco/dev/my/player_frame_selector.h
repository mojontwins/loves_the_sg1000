// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// player_frame_selector.h
// Selects the correct metasprite upon player state

// You may (will) need to tinker with this for your game.
// Use player variables p* and end up with a correct value
// in psprid.

// game_puri == 0 for Paco and == 10 for Puri.
// pfacing == 0 for Right and == 5 for Left (as defined in config.h)

if (ppossee || pgotten) {
	// On the floor
	if (pvx > PLAYER_VX_MIN || pvx < -PLAYER_VX_MIN) {
		if (game_puri) {
			if ((prx >> 3) != ol_prx) { 
				pfr ++; if (pfr == 3) pfr = 0;
				ol_prx = prx >> 3;
			}

			psprid = pfr;
		} else {
			psprid = CELL_WALK_CYCLE + ((prx >> 3) & 3);
		}
	} else { psprid = CELL_IDLE; pfr = 0; }
} else psprid = CELL_AIRBORNE;

psprid += pfacing + game_puri;
