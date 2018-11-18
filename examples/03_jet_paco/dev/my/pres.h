// SG-1000 MK1 v0.3
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

void snip (void) {
	// Point gp_tmap to the data you need to snip :-)
	// rda = number of lines
	// rdy = offset

	gp_addr = PNTADDRESS + (rdy << 5);
	VDPControlPort = LO (gp_addr); VDPControlPort = HI (gp_addr) | 0x40;
	while (rda --) {
		SG_waitForVBlank ();
		gpit = 32; while (gpit --) {
			VDPDataPort = *gp_tmap ++;
		}
	}
}

void logo (void) {
	rda = 5; rdy = 3; 
	gp_tmap = game_puri ? title_cutout_puri : title_cutout_paco;
	snip ();
}

void title (void) {	
	gp_gen = title_rle; unrle ();

	logo ();

	_x = 5; _y = 23; pr_str ("@ 2018 THE MOJON TWINS");

	for (gpit = 0; gpit < 3; gpit ++) 
		if (level_done [gpit]) SG_setTileatXY (21, (gpit << 1) + 15, 10);

	bat_in ();

	PSGPlay (MUSIC_TITLE);
	while (1) {
		update_cycle ();
		SG_addMetaSprite1x1 (80, 116 + (level << 4), spr_player [game_puri]);
		pad_read ();
		rda = level;
		if (pad_this_frame & PAD_DOWN) {
			++ level; if (level == 3) level = 0;
		}
		if (pad_this_frame & PAD_UP) {
			if (level) -- level; else level = 2;
		}
		if (pad_this_frame & (PAD_LEFT|PAD_RIGHT)) {
			game_puri = CELL_PURI - game_puri;
			logo ();
		}
		if (level != rda) PSGSFXPlay (SFX_USE, 1);
		if (pad_this_frame & PAD_1) break;
	}
	
	PSGSFXPlay (SFX_START, 1); delay (20);
	
	bat_out ();

	// Set player values upon choice
	if (game_puri) {
		__player_vy_falling_max = 48;
		__player_g              = 4;
		__player_ay_jetpac      = 16;
		__player_vy_jetpac_max  = 72;
		__player_vx_max         = 128;
		__player_ax             = 8;
		__player_rx             = 12;
	} else {
		__player_vy_falling_max = 64;
		__player_g              = 4;
		__player_ay_jetpac      = 12;
		__player_vy_jetpac_max  = 64;
		__player_vx_max         = 112;
		__player_ax             = 16;
		__player_rx             = 16;
	}
}

void scr_game_over (void) {
	gp_gen = cuts_rle; unrle ();
	_x = 10; _y = 8; pr_str ("GAME OVER!");
	_x =  4; _y = 10; pr_str ("NICE TRY, BUT NO BANANA!");
	_x =  5; _y = 12; pr_str ("DO IT BETTER NEXT TIME");
	_x =  9; _y = 14; pr_str ("MISSION FAILED");
}

void scr_sclear (void) {
	gp_gen = cuts_rle; unrle ();
	_x = 9; _y = 8; pr_str ("CONGRATULATIONS!");
	_x = 3; _y = 10; pr_str ("ALL CRISTALS ARE RECOVERED");
	_x = 2; _y = 12; pr_str ("NOW YOU CAN GET BACK TO YOUR");
	_x = 3; _y = 14; pr_str ("BASE AND HAVE A GOOD REST!");	
}

void scr_the_end (void) {
	gp_gen = cuts_rle; unrle ();
	_x = 9; _y = 8; pr_str ("AQUI VA EL FINAL!");
	_x = 2; _y = 10; pr_str ("");
	_x = 4; _y = 12; pr_str ("");
	_x = 5; _y = 14; pr_str ("");	
}

void credits (void) {
	cls ();

	_x = 0; _y = 0; if (ntsc) pr_str ("NTSC"); else pr_str ("PAL");

	rds16 = 0; rdy = 240;
	_x = 0; _y = 18; 
	pr_str ("       JET PACO & JET PURI%%         ORIGINAL GAME:%     @ 2013 THE MOJON TWINS%       REPROGRAMMED GAME:%     @ 2018 THE MOJON TWINS");
	
	SG_displayOn ();
	
	while (!(SG_getKeysStatus () & PAD_START) && rds16 < 300) {
		/*oam_meta_spr (102, rdy, 0, logo_00);
		if (rdy > 112) rdy --;*/
		update_cycle ();
		rds16 ++;
	};
	
	SG_displayOff ();
}
