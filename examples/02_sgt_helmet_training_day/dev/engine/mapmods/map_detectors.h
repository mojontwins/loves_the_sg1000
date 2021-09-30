// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

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
			#ifdef SG1000
				if (c_behs [map_buff [rda]]) break; else {
					map_buff [rda] = PROPELLER_FLOATABLE_TILE;
				}
			#else
				if (map_attr [rda]) break; else {
					map_attr [rda] = 64;				
				}
			#endif
		}
	}
#endif

#ifdef ENABLE_SHINES
	if (rdt == SHINING_TILE) shines_add ();
#endif

#ifdef ENABLE_TILE_CHAC_CHAC
	#ifndef CHAC_CHAC_DETECT_TILES
	#define CHAC_CHAC_DETECT_TILES 3
	#endif
	if (rdt >= CHAC_CHAC_DETECT_TILE && rdt <= CHAC_CHAC_DETECT_TILE + CHAC_CHAC_DETECT_TILES-1) {
		chac_chacs_add ();
		#ifdef SG1000
			rdt = map_buff [rdm] = 0;
		#else
			rdt = map_attr [rdm] = 0;
		#endif
	}
#endif
