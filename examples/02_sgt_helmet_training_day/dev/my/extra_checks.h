// SG-1000 MK1 v0.2
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Add here your code.  This gets run right before checking
// for the level's end condition. The previous frame is on
// screen. 

// Do whatever you need. Everything you add here gets executed
// each frame!

// Whenever you want to WIN the game just set win_level = 1
// (Don't forget to define WIN_LEVEL_CUSTOM in config.h)

if (n_pant == 23 && bombs_set) {
	update_cycle ();
	PSGSFXPlay (SFX_FANFARE, 2);
	delay (120);
	win_level = 1;
}
