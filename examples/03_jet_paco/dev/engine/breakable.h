// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// breakable.h
// Manages breakable blocks and animations

#ifdef BREAKABLE_ANIM
	void breakable_do_anim (void);
#endif

void breakable_break (unsigned char x, unsigned char y);
