// SG-1000 MK1 v0.4
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

if (level == 1) {
	gpit = 192; while (gpit --) {
		rda = map_buff [gpit];
		rdb = map_buff [gpit - 1];
		rdc = map_buff [gpit + 1];
		rdd = rand8();
		switch (rda) {
			case 7:
				if (rdb != 7) rda = 24;
				else if (rdc != 7 && rdc != 25) rda = 25;
				break;
			case 8:
				if (rdb != 8) rda = 26;
				else if (rdc != 8 && rdc != 27) rda = 27;
				break;
			case 14:
				rda = 30 + (rdd & 1);
				break;
			case 2:
				if (rand8 () & 1) rda = 21 + (rdd & 1);
				break;
			case 29:
				if (rdd & 1) rda = 16;
				break;
		}
		map_buff [gpit] = rda;
	}
}
