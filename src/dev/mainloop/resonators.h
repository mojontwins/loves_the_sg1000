// SG-1000 MK1 v0.1
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Resonators code.
if (res_on) {

	gp_addr = ((RESONATOR_COUNTER_Y << 5) | RESONATOR_COUNTER_X) + PNTADDRESS;
	_n = 16 + res_ct; 
	ul_putc ();

	// Resonator logic
	if (res_subct) -- res_subct; else {
		res_subct = 50;
		if (res_ct) { 
			-- res_ct; 
			if (res_ct <= 5) PSGSFXPlay (SFX_COUNT, 1);
		} else {
			res_on = 0;
			PSGSFXPlay (SFX_SPRING, 1); 
		}
	}
}
