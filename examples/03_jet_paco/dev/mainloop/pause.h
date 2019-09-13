// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Pause?
if (HW_queryPauseRequested ()) {
	HW_resetPauseRequest ();
	paused ^= 1;
	//music_pause (paused);
}
