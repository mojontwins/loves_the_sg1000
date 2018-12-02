
// Initial screen & position, per level

const unsigned char l_scr_ini [] = 				{ 20, 20, 8, 12 };
const unsigned char l_ini_x [] = 				{ 2, 2, 2, 2 };
const unsigned char l_ini_y [] = 				{ 7, 10, 3, 5 };
const unsigned char l_map_w [] = 				{ 4, 4, 8, 12 };
const unsigned char l_map_h [] =				{ 6, 6, 3, 2 };

// Ending screen & position, per level (comment if N/A)

/*
const unsigned char l_scr_end [] = 				{ 0, 0 };
const unsigned char l_end_x [] = 				{ 3, 3 };
const unsigned char l_end_y [] = 				{ 3, 3 };
*/

// # of objects. 

const unsigned char l_player_max_objects [] =	{ MAX_HOTSPOTS_TYPE_1_0, MAX_HOTSPOTS_TYPE_1_1, MAX_HOTSPOTS_TYPE_1_2, MAX_HOTSPOTS_TYPE_1_3 };

// # of killable enemies 

const unsigned char l_player_max_enems [] = 	{ KILLABLE_ENEMS_0, KILLABLE_ENEMS_1, KILLABLE_ENEMS_2, KILLABLE_ENEMS_3 };

// Metatiles

const unsigned char * const l_ts_patterns [] =  { ts0_patterns_c, ts1_patterns_c, ts2_patterns_c, ts3_patterns_c };
const unsigned char * const l_ts_colours [] =   { ts0_colours_c, ts1_colours_c, ts2_colours_c, ts3_colours_c };
const unsigned char * const l_ts_tmaps [] = 	{ ts0_tmaps, ts1_tmaps, ts2_tmaps, ts3_tmaps };
const unsigned char * const l_behs [] = 		{ behs0, behs1, behs2, behs3 };

// Enemy spriteset

const unsigned char * const l_spr_patterns [] = { ss_en_0_patterns_c, ss_en_1_patterns_c, ss_en_2_patterns_c, ss_en_1_patterns_c };
const unsigned char * const * const l_spr_enems [] =
												{ spr_enems0, spr_enems1, spr_enems2, spr_enems1 };

// Map data

#ifdef MAP_FORMAT_PACKED
	const unsigned char * const l_map [] =		{ map_0, map_1, map_2, map_3 };
#endif
#if defined (MAP_FORMAT_RLE16) || defined (MAP_FORMAT_RLE53) || defined (MAP_FORMAT_RLE44)
	const unsigned char * const * const l_map [] =	
												{ map_0, map_1, map_2, map_3 };
#endif

#ifdef MAP_WITH_DECORATIONS
	#if defined (MAP_FORMAT_PACKED) || defined (MAP_FORMAT_RLE16) 
		const unsigned char * const * const l_decos [] =
												{ map_0_decos, map_1_decos };
	#else
		// 0 = no decos in this level's map, 1 = decos.
		const unsigned char l_decos [] = 		{ 0, 1, 1, 0 };
	#endif
#endif

#ifndef DEACTIVATE_KEYS
	const unsigned char * const l_locks [] = 	{ map_0_locks, map_1_locks, map_2_locks, map_3_locks };
	const unsigned char l_n_bolts [] = 			{ N_BOLTS_0, N_BOLTS_1, N_BOLTS_2, N_BOLTS_3 };
#endif

// Objects

const unsigned char * const l_enems [] = 		{ enems_0, enems_1, enems_2, enems_3 };
const unsigned char * const l_hotspots [] = 	{ hotspots_0, hotspots_1, hotspots_2, hotspots_3 };

// Interactives

#if defined (ENABLE_INTERACTIVES) && defined (INTERACTIVES_FROM_CODE)
	const unsigned char * const l_interactives [] = 
												{ interactives0, interactives1 };
#endif

// Music track

const unsigned char * const l_music [] = 		{ MUSIC_INGAME1, MUSIC_INGAME2, MUSIC_INGAME3, MUSIC_INGAME4 };
