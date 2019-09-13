// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// unpacker.c

#include "../lib/aPLib.h"
#ifdef SMS
	#include "../hw_sms.h"
	#include "../lib/SMSlib.h"
#else
	#include "../hw_sg1000.h"
	#include "../lib/SGlib.h"	
#endif

// Use banks_flag = 7 for all three banks (111).
void unpack_bg_patterns (const unsigned char *c_pgt, const unsigned char *c_cgt, unsigned int byte_offset, unsigned char banks_flag) {
	if (banks_flag & 1) {
		aPLib_depack_VRAM (PGT_BASE + PATTERN_DATA_BANK_A + byte_offset, c_pgt);
		aPLib_depack_VRAM (CGT_BASE + PATTERN_DATA_BANK_A + byte_offset, c_cgt);
	}
	if (banks_flag & 2) {
		aPLib_depack_VRAM (PGT_BASE + PATTERN_DATA_BANK_B + byte_offset, c_pgt);
		aPLib_depack_VRAM (CGT_BASE + PATTERN_DATA_BANK_B + byte_offset, c_cgt);
	}
	if (banks_flag & 4) {
		aPLib_depack_VRAM (CGT_BASE + PATTERN_DATA_BANK_C + byte_offset, c_cgt);
		aPLib_depack_VRAM (PGT_BASE + PATTERN_DATA_BANK_C + byte_offset, c_pgt);
	}
}
