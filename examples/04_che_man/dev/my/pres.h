// SG-1000 MK1 v0.4
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

/*
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
*/
void title (void) {
	unpack_bg_patterns (tsT_patterns_c, tsT_colours_c, 72*8, 7);
	gp_gen = title_rle; unrle ();
	
	_x = 7; _y = 12; pr_str ("SELECT AND PUSH 1!");

	_x = 12; _y = 16; pr_str ("MISSION 1");
	         _y = 18; pr_str ("MISSION 2");

	_x = 5; _y = 23; pr_str ("@ 2019 THE MOJON TWINS");

	bat_in ();

	//PSGPlay (MUSIC_TITLE);
	while (1) {
		update_cycle ();
		SG_addMetaSprite (82, 122 + (level << 4), ss_pl_00);
		SG_addMetaSprite (140, 55, ss_pl_09);
		pad_read ();
		rda = level;
		if (pad_this_frame & PAD_DOWN) {
			++ level; if (level == 2) level = 0;
		}
		if (pad_this_frame & PAD_UP) {
			if (level) -- level; else level = 1;
		}
		if (level != rda) PSGSFXPlay (SFX_USE, 1);
		if (pad_this_frame & PAD_1) break;
	}
	
	PSGSFXPlay (SFX_START, 1); delay (20);
	bat_out ();
}

void scr_game_over (void) {
	_x = 11; _y = 15; pr_str ("GAME OVER!");
}

void scr_the_end (void) {
	unpack_bg_patterns (tsE_patterns_c, tsE_colours_c, 72*8, 7);
	gp_gen = ending_rle; unrle ();
	_x =3; _y = 13; switch (lang_offs) {
		case 0:
			pr_str ("PUTOS BATUCADAS, PENSE QUE%%NO LLEGABA AL CONCIERTO DE%%LOS MAS GRANDES, CAGUEN...%%A VER SI ESTOS SE PORTAN!!");
			break;
		case 4:
			pr_str ("BLOODY BATUCADAS, THEY%%ALMOST MADE ME LATE FOR%%THE GREATEST BAND ON EARTH%%I HOPE THEY ROCK DA PLACE!");
			break;
		case 8:
			pr_str ("KACK BATUCADAS, ICH DACHTE,%%ICH KAEM NICHT ZUM KONZERT%%DER ALLERGROESSTEN, YEAH!!%%MAL SEHEN OB SIE ROCKEN!");
			break;
	}
}

void credits (void) {
	cls ();

	_x = 0; _y = 0; if (ntsc) pr_str ("NTSC"); else pr_str ("PAL");

	rds16 = 0; rdy = 240;
	_x = 0; _y = 18; 
	pr_str ("     CHEMAN PUTAS BATUCADAS%%         ORIGINAL GAME%     @ 2018 THE MOJON TWINS%       REPROGRAMMED GAME%     @ 2019 THE MOJON TWINS");
	
	SG_displayOn ();
	
	while (!(SG_getKeysStatus () & PAD_START) && rds16 < 300) {
		/*oam_meta_spr (102, rdy, 0, logo_00);
		if (rdy > 112) rdy --;*/
		update_cycle ();
		rds16 ++;
	};
	
	SG_displayOff ();
}

void language_select (void) {
	gp_gen = language_rle; unrle ();
	lang_offs = 0;

	bat_in ();

	while (1) {
		update_cycle ();
		SG_addMetaSprite1x1 (80, 9*8 + (lang_offs << 2), ss_it_06);
		pad_read ();

		if (pad_this_frame & PAD_UP) {
			if (lang_offs) lang_offs -= 4; else lang_offs = 8;
		}
		if (pad_this_frame & PAD_DOWN) {
			if (lang_offs < 8) lang_offs += 4; else lang_offs = 0;
		}

		if (pad_this_frame & (PAD_1|PAD_2)) break;
	}

	bat_out ();	
}
