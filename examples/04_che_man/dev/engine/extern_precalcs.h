// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// LUT exports

#ifdef ENABLE_MONOCOCOS
	extern const unsigned char monococo_state_times [];
#endif

#if defined (ENABLE_COCOS) && defined(COCOS_ENABLE_LINEAR)
	extern const signed int coco_dx [];
	extern const signed int coco_dy [];
#endif

#if defined (ENABLE_COMPILED_ENEMS)
	extern const signed char endx [];
	extern const signed char endy [];
#endif

#if defined (ENABLE_TILE_CHAC_CHAC) 
	extern const unsigned char chac_chacs_times [];
	extern const unsigned char chac_chacs_t1 [];
	extern const unsigned char chac_chacs_t2 [];
	extern const unsigned char chac_chacs_t3 [];
	extern const unsigned char chac_chacs_initial_times [];
#endif

extern const unsigned char bits [];

#ifdef ENEMS_MAY_DIE
	extern const unsigned char jitter [];
#endif
