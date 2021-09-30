// SG-1000 MK1 v0.2
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Initial screen & position, per level

const unsigned char l_scr_ini [] = 				{ 23, 23, 23 };
const unsigned char l_ini_x [] = 				{ 12, 12, 7 };
const unsigned char l_ini_y [] = 				{ 9, 9, 10 };
const unsigned char l_map_w [] = 				{ 1, 1, 1 };
const unsigned char l_map_h [] =				{ 24, 24, 24 };

// Ending screen & position, per level (comment if N/A)

/*
const unsigned char l_scr_end [] = 				{ 0, 0 };
const unsigned char l_end_x [] = 				{ 3, 3 };
const unsigned char l_end_y [] = 				{ 3, 3 };
*/

// # of objects. 

const unsigned char l_player_max_objects [] =	{ MAX_HOTSPOTS_TYPE_1_0, MAX_HOTSPOTS_TYPE_1_1, MAX_HOTSPOTS_TYPE_1_2 };

// # of killable enemies 

const unsigned char l_player_max_enems [] = 	{ KILLABLE_ENEMS_0, KILLABLE_ENEMS_1, KILLABLE_ENEMS_2 };

// Metatiles

//const unsigned char * const l_ts_patterns [] =  { ts0_patterns_c, ts1_patterns_c, ts2_patterns_c };
//const unsigned char * const l_ts_colours [] =   { ts0_colours_c, ts1_colours_c, ts2_colours_c };
const unsigned char * const l_ts_tmaps [] = 	{ ts0_tmaps, ts1_tmaps, ts2_tmaps };
const unsigned char * const l_behs [] = 		{ behs0, behs0, behs2 };

// Enemy spriteset

//const unsigned char * const l_spr_patterns [] = { ss_en_0_patterns_c, ss_en_1_patterns_c, ss_en_2_patterns_c };
const unsigned char * const * const l_spr_enems [] =
												{ spr_enems0, spr_enems0, spr_enems0 };

// Map data

#ifdef MAP_FORMAT_PACKED
	const unsigned char * const l_map [] =		{ map_0, map_1, map_2 };
#endif
#if defined (MAP_FORMAT_RLE16) || defined (MAP_FORMAT_RLE53) || defined (MAP_FORMAT_RLE44)
	const unsigned char * const * const l_map [] =	
												{ map_0, map_1, map_2 };
#endif

#ifdef MAP_WITH_DECORATIONS
	#if defined (MAP_FORMAT_PACKED) || defined (MAP_FORMAT_RLE16) 
		const unsigned char * const * const l_decos [] =
												{ map_0_decos, map_1_decos };
	#else
		// 0 = no decos in this level's map, 1 = decos.
		const unsigned char l_decos [] = 		{ 0, 1, 1 };												
	#endif
#endif

#ifndef DEACTIVATE_KEYS
	const unsigned char * const l_locks [] = 	{ map_0_locks, map_1_locks, map_2_locks };
	const unsigned char l_n_bolts [] = 			{ N_BOLTS_0, N_BOLTS_1, N_BOLTS_2 };
#endif

// Objects

const unsigned char * const l_enems [] = 		{ enems_0, enems_1, enems_2 };
const unsigned char * const l_hotspots [] = 	{ hotspots_0, hotspots_1, hotspots_2 };

// Interactives

#if defined (ENABLE_INTERACTIVES) && defined (INTERACTIVES_FROM_CODE)
	const unsigned char * const l_interactives [] = 
												{ interactives0, interactives1 };
#endif

// Music track

const unsigned char * const l_music [] = 		{ MUSIC_INGAME1, MUSIC_INGAME2, MUSIC_INGAME3 };
