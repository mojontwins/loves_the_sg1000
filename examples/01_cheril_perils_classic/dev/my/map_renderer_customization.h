// SG-1000 MK1 v0.1
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Use this alongisde map_renderer_complex.h
// (#define MAP_RENDERER_COMPLEX)

// Reaching this point, map_buff has the decompressed map screen.
// You can write as many modifications as you like here:

set_rand (1 + n_pant);
gpit = 192; while (gpit --) {
	rda = map_buff [gpit]; 
	rdb = rand8 () & 1;	
	if (level < 3) {
		if (rdb && rda < 15) rda += 16;
	} else {
		switch (rda) {
			case 3: if (rdb) rda = 4; break;
			case 13: if (map_buff [gpit - 16] != 13) rda = 14; break;
		}
		
	}
	map_buff [gpit] = rda;
}
