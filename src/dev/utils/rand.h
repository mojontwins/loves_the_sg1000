// SG-1000 MK1 v0.1
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// rand.h

extern unsigned int seed1, seed2;
extern unsigned char randres;

unsigned char rand8 (void);
void srand (void);
void set_rand (unsigned char rdum);	// Wrapper for AGNES
