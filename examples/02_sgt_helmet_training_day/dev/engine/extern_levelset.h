// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

extern const unsigned char l_scr_ini [];
extern const unsigned char l_ini_x [];
extern const unsigned char l_ini_y [];
extern const unsigned char l_map_w [];
extern const unsigned char l_map_h [];
extern const unsigned char l_player_max_objects [];
extern const unsigned char l_player_max_enems [];
extern const unsigned char * const l_ts_patterns [];
extern const unsigned char * const l_ts_colours [];
extern const unsigned char * const l_ts_tmaps [];
extern const unsigned char * const l_behs [];
extern const unsigned char * const l_spr_patterns [];
extern const unsigned char * const * const l_spr_enems [];
#ifdef MAP_FORMAT_PACKED
	extern const unsigned char * const l_map [];
#endif
#if defined (MAP_FORMAT_RLE16) || defined (MAP_FORMAT_RLE53) || defined (MAP_FORMAT_RLE44)
	extern const unsigned char * const * const l_map [];
#endif
#ifdef MAP_WITH_DECORATIONS
	#if defined (MAP_FORMAT_PACKED) || defined (MAP_FORMAT_RLE16) 
		extern const unsigned char * const * const l_decos [];
	#else
		extern const unsigned char l_decos [];
	#endif
#endif
#ifndef DEACTIVATE_KEYS
	extern const unsigned char * const l_locks [];
	extern const unsigned char l_n_bolts [];
#endif
extern const unsigned char * const l_enems [];
extern const unsigned char * const l_hotspots [];
#if defined (ENABLE_INTERACTIVES) && defined (INTERACTIVES_FROM_CODE)
	extern const unsigned char * const l_interactives [];
#endif
extern const unsigned char l_music [];
