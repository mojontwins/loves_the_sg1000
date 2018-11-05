// SG-1000 MK1 v0.1
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Pause?
if (SG_queryPauseRequested ()) {
	SG_resetPauseRequest ();
	paused ^= 1;
	//music_pause (paused);
}
