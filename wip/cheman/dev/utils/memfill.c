// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// memfill.c

#pragma save
#pragma disable_warning 85
void memfill (void *ptr, unsigned char value, unsigned int length) {
	__asm
		ld  hl, #2
		add hl, sp
		ld  e, (hl)
		inc hl 
		ld  d, (hl)    ; DE = *ptr
		inc hl
		ld  a, (hl)    ; A  = value
		inc hl
		ld  c, (hl)
		inc hl 
		ld  b, (hl)    ; BC = length
		
		ld  h, d 
		ld  l, e
		inc de 
		ld  (hl), a
		ldir
	__endasm;
}
#pragma restore
