// SG-1000 MK1 v0.2
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
