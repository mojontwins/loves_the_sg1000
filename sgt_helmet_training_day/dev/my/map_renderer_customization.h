// SG-1000 MK1 v0.1
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Use this alongisde map_renderer_complex.h
// (#define MAP_RENDERER_COMPLEX)

// Reaching this point, map_buff has the decompressed map screen.
// You can write as many modifications as you like here:

/*
	// Example for ref
	
	set_rand (1 + n_pant);
	gpit = 192; while (gpit --) {
		if (rand8 () & 1) {
			rda = map_buff [gpit];
			if (rda < 15) rda += 16;
			map_buff [gpit] = rda;
		}
	}
*/

	set_rand (1 + n_pant);
	gpit = 192; while (gpit --) {
		rda = map_buff [gpit];

		// General:
		if (rda == 0) {
			rdb = map_buff [gpit - 16];
			//if (gpit >= 16 && rdb && rdb != 2 && rdb < 14 && !(rdb > 7 && rdb < 9) && rdb != 4)
			if (gpit >= 16 && c_behs [rdb] == 8)
				rda = 25;
			else if ((rand8 () & 7) == 1) rda = 27;
		} else if (rda == 8) {
			rdc = map_buff [gpit + 1]; rdb = map_buff [gpit - 1];
			if (rdc != 8 && rdb != 8) {
				// Isolated. Do nothing
			} else {
				if (rdc != 8 && rdc != 9) rda = 9;
				if (rdb != 8) rda = 7;
			}
		}

		// Not for level 2
		if (level < 2) {
			if (rda == 0) rda = rand8 () & 1;
		}

		map_buff [gpit] = rda;
	}