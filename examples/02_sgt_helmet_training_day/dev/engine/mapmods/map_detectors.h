// SG-1000 MK1 v0.2
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Map detectors.
// Detect tiles and modify map.

// Index in buffer is rdm. Current tile index is rdt

#ifdef ENABLE_PROPELLERS
	// Detect propeller tile and make tiles above "floaty"
	// stops on obstacles.

	if (rdt == PROPELLER_TILE && propellers_on) {
		propellers_add ();
		rda = rdm; 
		#ifdef PROPELLERS_MAX_LENGTH
			rdc = PROPELLERS_MAX_LENGTH;
			while (rda >= 16 && rdc --)
		#else
			while (rda >= 16)
		#endif
		{
			rda -= 16;
			if (map_attr [rda]) break; else {
				#ifdef SG1000
					map_buff [rda] = PROPELLER_FLOATABLE_TILE;
				#else
					map_attr [rda] = 64;
				#endif
			}
		}
	}
#endif

#ifdef ENABLE_SHINES
	if (rdt == SHINING_TILE) shines_add ();
#endif

#ifdef ENABLE_TILE_CHAC_CHAC
	if (rdt >= CHAC_CHAC_DETECT_TILE && rdt <= CHAC_CHAC_DETECT_TILE + 2) {
		chac_chacs_add ();
		#ifdef SG1000
			rdt = map_buff [rdm] = 0;
		#else
			rdt = map_attr [rdm] = 0;
		#endif
	}
#endif
