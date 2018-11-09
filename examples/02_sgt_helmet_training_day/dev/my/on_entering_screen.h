// SG-1000 MK1 v0.2
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Add here your code. Just entered n_pant.
// Background is rendered, everything initialized.
// Screen is ON.

if (n_pant == 0) {
	// There may be stuff in the update list, so flush:
	do_update_list_and_wait ();
	
	// Always: draw evil computer
	clear_update_list ();
	rdx = 6; rdy = 4; rdt = 16; gpit = 6; while (gpit --) {
		_x = rdx; _y = rdy; _t = rdt; map_set ();
		rdt ++; rdx ++; if (rdx == 9) { rdx = 6; rdy ++; }
	}

	// Draw 5 bombs? 
	if (bombs_set) {
		do_update_list_and_wait ();
		clear_update_list ();
		for (gpit = 0; gpit < 5; gpit ++) {
			_x = bombs_x [gpit]; _y = bombs_y [gpit]; _t = 24; map_set ();
		}
	}

	do_update_list_and_wait ();
	clear_update_list ();

	// Leave list empty and screen initialized when exiting.
}