// SG-1000 MK1 v0.2
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Cutscenes, title screen, etc.

void bat_in (void) {
	SG_displayOn ();
	while (SG_getKeysStatus ());
}

void bat_out (void) {
	PSGStop ();
	SG_displayOff ();
	SG_initSprites ();
	SG_copySpritestoSAT ();	
}

void pres (void (*func) (void), unsigned char *music) {
	cls ();
	(*func) ();
	bat_in ();
	if (music) PSGPlay (music);
	while (1) {
		pad_read ();
		if (pad_this_frame & (PAD_A|PAD_B|PAD_START)) break;
	}
	bat_out ();
}

void title (void) {	
	gp_gen = title_rle; unrle ();

	_x = 5; _y = 23; pr_str ("@ 2018 THE MOJON TWINS");

	bat_in ();

	PSGPlay (MUSIC_TITLE);
	while (1) {
		update_cycle ();
		SG_addMetaSprite1x1 (80, 108 + (level << 4), ss_pl_00);
		pad_read ();
		rda = level;
		if (pad_this_frame & PAD_DOWN) {
			++ level; if (level == 3) level = 0;
		}
		if (pad_this_frame & PAD_UP) {
			if (level) -- level; else level = 2;
		}
		if (level != rda) PSGSFXPlay (SFX_USE, 1);
		if (pad_this_frame & PAD_1) break;
	}
	
	PSGSFXPlay (SFX_START, 1); delay (20);
	
	bat_out ();
}

void scr_game_over (void) {
	gp_gen = cuts_rle; unrle ();
	_x = 10; _y = 8; pr_str ("GAME OVER!");
	_x =  4; _y = 10; pr_str ("NICE TRY, BUT NO BANANA!");
	_x =  5; _y = 12; pr_str ("DO IT BETTER NEXT TIME");
	_x =  9; _y = 14; pr_str ("MISSION FAILED");
}

void scr_the_end (void) {
	gp_gen = cuts_rle; unrle ();
	_x = 9; _y = 8; pr_str ("CONGRATULATIONS!");
	_x = 2; _y = 10; pr_str ("YOU MANAGED TO SET THE BOMBS");
	_x = 4; _y = 12; pr_str ("AND DESTROY THE COMPUTER");
	_x = 5; _y = 14; pr_str ("MISSION ACCOMPLISHED!!");	
}

void credits (void) {
	cls ();

	_x = 0; _y = 0; if (ntsc) pr_str ("NTSC"); else pr_str ("PAL");

	rds16 = 0; rdy = 240;
	_x = 0; _y = 18; 
	pr_str ("   SGT. HELMET - TRAINING DAY%%         ORIGINAL GAME:%     @ 2013 THE MOJON TWINS%       REPROGRAMMED GAME:%     @ 2018 THE MOJON TWINS");
	
	SG_displayOn ();
	
	while (!(SG_getKeysStatus () & PAD_START) && rds16 < 300) {
		/*oam_meta_spr (102, rdy, 0, logo_00);
		if (rdy > 112) rdy --;*/
		update_cycle ();
		rds16 ++;
	};
	
	SG_displayOff ();
}
