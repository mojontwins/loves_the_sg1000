// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Check if the player needs to be relocated after respawning.

	#if defined (DIE_AND_RESPAWN) && defined (ENABLE_BREAKABLE)
		if (pmayneedrelocation) {
			pmayneedrelocation = 0;
			gpit = 16;
			while (gpit --) {
				cx1 = prx >> 4; cx2 = (prx + 7) >> 4;
				cy1 = cy2 = (pry + 15) >> 4;
				cm_two_points ();
				if ((at1 & 8) == 0 && (at2 & 8) == 0) break;
				prx += 16;	// Try next cell
			}
			px = prx << FIXBITS;
		}
	#endif