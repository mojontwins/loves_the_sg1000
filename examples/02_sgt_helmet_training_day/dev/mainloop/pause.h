// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Pause?
if (HW_queryPauseRequested ()) {
	HW_resetPauseRequest ();
	paused ^= 1;
	music_pause (paused);
}
