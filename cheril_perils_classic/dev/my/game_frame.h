// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// game_frame.h
// Custom code to draw the frame around your HUD

void draw_game_frame (void) {
	gp_gen = hud_rle; unrle ();
}
