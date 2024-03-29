// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Simple text box which works with ppu_on.
#define TEXTBOX_TOP 8

// Use the correct metatile values for your game!
// Remember that the frame is 12 tiles wide. 
// Please respect the 0xff byte padding.
const unsigned char box_buff [] = {
	0xff, 0xff, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0xff, 0xff,
	0xff, 0xff, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x05, 0xff, 0xff, 
	0xff, 0xff, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x05, 0xff, 0xff, 
	0xff, 0xff, 0x06, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x08, 0xff, 0xff,
};

void textbox_frame (void) {
	// Draws or clears the frame upon the value of rdm
	rdct = 0; _x = 0; _y = TEXTBOX_TOP;
	gp_ram = rdm ? ((unsigned char *) box_buff) : (map_buff + (((_y - TOP_ADJUST) >> 1) << 4));
	if (!rdm) {_y --; gpit = 80; } else gpit = 64; 
	while (gpit --) {
		rdt = *gp_ram ++; 
		if (rdct == 0) clear_update_list ();
		if (rdt != 0xff) { 
			_t = rdt + rdm;
			update_list_tile (); 
		}
		_x = (_x + 2) & 0x1f; if (_x == 0) _y += 2;
		++ rdct; if (rdct == 4) { do_update_list_and_wait (); rdct = 0; }
	}
}

void textbox_draw_text (void) {
	// Paints text inside the frame.
	// Text must be pointed at by gp_gen.
	// Text lines can be broken by %. 
	// If a line is more than 20 chars wide, ¡BUM!
	// Max is 6 lines.

	rda = 1; // New line marker!
	rdy = TEXTBOX_TOP+1;
	while (rdt = *gp_gen ++) {
		#ifdef TEXT_BOX_WITH_PORTRAITS
			if (rda) { clear_update_list (); rda = 0; gp_addr = PNTADDRESS + rdm + (rdy << 5); }
		#else
			if (rda) { clear_update_list (); rda = 0; gp_addr = PNTADDRESS + 6 + (rdy << 5); }
		#endif
		if (rdt == '%') rda = 1; else { _n = rdt - 32; ul_putc (); }
		if (rda) { do_update_list_and_wait (); ++ rdy; }
	}	
}

void textbox_do (void) {
	// Textbox example, simple.
	// Text must be pointed at by gp_gen.
	// if defined TEXT_BOX_WITH_PORTRAITS, portrait # is in rdd
	// rdd == 0 means no portrait.
	rdm = TEXT_BOX_FRAME_TILE_OFFSET; textbox_frame ();
#ifdef TEXT_BOX_WITH_PORTRAITS
	if (rdd) {
		HW_initSprites ();
		HW_addMetaSprite1x1 (
			44, 103,
			spr_hs [rdd]);
		rdm = 8;
	} else rdm = 6;
#endif	
	textbox_draw_text ();
	while (1) {
		do_update_list_and_wait ();
		pad_read (); if (pad_this_frame & (PAD_A|PAD_B)) break;
	}

	rdm = 0; textbox_frame ();
	clear_update_list ();

	HW_resetPauseRequest ();
}

#ifdef TEXT_BOX_DIALOGUES
	void textbox_dialogue_do (unsigned char dfrom, unsigned char dto) {
		for (gpjt = dfrom; gpjt <= dto; gpjt ++) {
			rdd = dialogue_portraits [gpjt];
			gp_gen = dialogue_texts [gpjt];
			textbox_do ();
		}
	}
#endif
