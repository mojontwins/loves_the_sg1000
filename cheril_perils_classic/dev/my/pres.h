// NES MK1 v1.0
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
	UNSAFE_SG_copySpritestoSAT ();	
}

void pres (void (*func) (void)) {
	cls ();
	(*func) ();
	bat_in ();
	while (1) {
		pad_read ();
		if (pad_this_frame & (PAD_A|PAD_B|PAD_START)) break;
	}
	bat_out ();
}

void title (void) {
	unpack_bg_patterns (tstitle_patterns_c, tstitle_colours_c, 64*8, 7);
	gp_gen = title_rle; unrle ();
	
	_x = 7; _y = 12; pr_str ("SELECT AND PUSH 1!");

	_x = 12; _y = 16; pr_str ("RESONATORS");
	         _y = 18; pr_str ("EASY MODE");

	_x = 5; _y = 23; pr_str ("@ 2018 THE MOJON TWINS");

	bat_in ();

	while (1) {
		update_cycle ();
		SG_addMetaSprite1x1 (82, 122 + (mode_no_resonators << 4), ss_pl_00);
		pad_read ();
		rda = mode_no_resonators;
		if (pad_this_frame & PAD_DOWN) {
			++ mode_no_resonators; if (mode_no_resonators == 2) mode_no_resonators = 0;
		}
		if (pad_this_frame & PAD_UP) {
			if (mode_no_resonators) -- mode_no_resonators; else mode_no_resonators = 1;
		}
		//if (mode_no_resonators != rda) PSGSFXPlay (SFX_USE, 0);
		if (pad_this_frame & PAD_1) break;
	}
	
	//PSGSFXPlay (SFX_START, 0); delay (20);
	//level = game_mode & 1;
	//mode_no_resonators = (game_mode > 1);
	plife = mode_no_resonators ? 5 : 3;

	bat_out ();
}

void scr_game_over (void) {
	_x = 11; _y = 15; pr_str ("GAME OVER!");
}

void scr_the_end (void) {
	_x = 6; _y = 6; pr_str (" CHERIL VANQUISHED%    ALL ZOMBIES%AND RETURNED SAFELY%   TO THE BOSQUE");
	//oam_meta_spr (100, 80, 0, ssending_00);
	_x = 12; _y = 25; pr_str ("THE  END");
}

const unsigned char level0name [] = "  THE CITY";
const unsigned char level1name [] = "THE FACTORY";
const unsigned char level2name [] = " THE FOREST";
const unsigned char *const levelnames [] = { level0name, level1name, level2name };

void scr_level (void) {
	_x = 12; _y = 14; pr_str ("LEVEL 0"); SG_setTile (17+level);
	_x = 10; _y = 16; pr_str (levelnames [level]);
}

void credits (void) {
	cls ();
	rds16 = 0; rdy = 240;

	_x = 0; _y = 19; 
	pr_str ("     CHERIL PERIL CLASSIC%%         ORIGINAL GAME%   @ 2011 BY THE MOJON TWINS%       REPROGRAMMED GAME%@ 2014, 2018 BY THE MOJON TWINS");
	
	SG_displayOn ();
	
	while (!(SG_getKeysStatus () & PAD_START) && rds16 < 300) {
		/*oam_meta_spr (102, rdy, 0, logo_00);
		if (rdy > 112) rdy --;*/
		update_cycle ();
		rds16 ++;
	};
	
	SG_displayOff ();
}
