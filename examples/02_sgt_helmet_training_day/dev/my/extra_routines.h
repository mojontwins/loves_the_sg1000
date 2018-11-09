// SG-1000 MK1 v0.2
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Extra routines.
// Add here calls to routines which need to update sprites and/or bg.
	
	if (n_pant == 0 && bombs_set == 0 && pry < 128) {
		for (gpit = 0; gpit < 5; gpit ++) {
			_x = bombs_x [gpit]; _y = bombs_y [gpit]; _t = 24; map_set ();	
			do_update_list_and_wait (); 
			clear_update_list (); 
			PSGSFXPlay (SFX_HITTER, 3); 
			delay (20); 
		}
		
		bombs_set = 1;
	}
