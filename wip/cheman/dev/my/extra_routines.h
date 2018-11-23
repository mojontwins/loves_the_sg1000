// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Extra routines.
// Add here calls to routines which need to update sprites and/or bg.

if ( 
	(level == 0 && (n_pant == 2 || n_pant == 7 || n_pant == 12 || n_pant == 17)) ||
	(level == 1 && n_pant == 18)
) {
	if (flags [ONLY_ONE_OBJECT_FLAG] && (half_life)) {
		SG_addMetaSprite1x1 (
			112, level == 1 ? 103 : 151,  
			ss_it_04
		);
	}
}

if (first_game) {
	gp_gen = 0;

	if (ppossee && first_text) {
		first_text = 0;
		gp_gen = custom_texts [lang_offs];
	}

	if (pkilled && first_batucada) {
		first_batucada = 0;
		gp_gen = custom_texts [lang_offs + 1];
	}

	if (flags [ONLY_ONE_OBJECT_FLAG] && first_medallion) {
		first_medallion = 0;
		gp_gen = custom_texts [lang_offs + 2];
	}

	if (pobjs && first_totem) {
		first_totem = 0;
		gp_gen = custom_texts [lang_offs + 3];
	}

	if (gp_gen) {
		
		SG_initSprites ();
		player_render ();
		SG_waitForVBlank ();
		SG_copySpritestoSAT ();
		
		textbox_do ();	
	}
}
