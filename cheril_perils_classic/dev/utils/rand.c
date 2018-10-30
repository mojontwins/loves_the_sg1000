// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// rand.c

// Code by Patrick Rack, adapted by na_th_an
// SDCC version.

unsigned int seed1, seed2;
unsigned char randres;

#pragma save
#pragma disable_warning 85
unsigned char rand8 (void) {
	__asm
		rnd:
			ld  hl, (_seed1)
			ld  de, (_seed2)
	        ld  a,h         ; t = x ^ (x << 1)
	        add a,a
	        xor h
	        ld  h,l         ; x = y
	        ld  l,d         ; y = z
	        ld  d,e         ; z = w
	        ld  e,a
	        rra             ; t = t ^ (t >> 1)
	        xor e
	        ld  e,a
	        ld  a,d         ; w = w ^ ( w << 3 ) ^ t
	        add a,a
	        add a,a
	        add a,a
	        xor d
	        xor e
	        ld  e,a
	        ld  (_seed1),hl
	        ld  (_seed2),de
	        ld	(_randres), a
	__endasm;
	return randres;
}

void srand (void) {
	__asm
		ld hl, (_seed1)
		ld (rnd+1), hl
		ld hl, (_seed2)
		ld (rnd+4), hl
	__endasm;
}
#pragma restore

void set_rand (unsigned char rdum) {
	seed1 = rdum; seed2 = 0xff00 & rdum;
	srand ();
}
