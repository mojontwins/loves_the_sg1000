// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Make stuff shine

void shines_add (void) {
	if (max_shines == SHINES_MAX) return;
	shines [max_shines ++] = rdm;
}

void shines_do (void) {
	if (shine_active_ct) {
		-- shine_active_ct;
		if (shine_active_ct >= 48) {
			HW_addSprite (
				shine_active_x, 
				shine_active_y, 
				SHINES_BASE_PATTERN + (rand8() & 1), 
				SHINES_COLOUR
			);
		}
	} else {
		gpit = rand8 () & (SHINES_MAX - 1);
		if (gpit < max_shines) {
			shine_active_ct = 64;
			rda = shines [gpit];
			shine_active_y = (rda & 0xf0) + (rand8 () & 7) + SPRITE_ADJUST + 16;
			shine_active_x = ((rda & 0x0f) << 4) + (rand8 () & 7);
		}
	}
}
