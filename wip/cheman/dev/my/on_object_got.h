// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Add here your code. An object has just been got.
// You may add checks and set variables and stuff.

// Player got object rda.

pjewels ++;
if (pjewels == 50) {
	plife ++; pjewels = 0;
	PSGSFXPlay (SFX_FANFARE, 2);
}
