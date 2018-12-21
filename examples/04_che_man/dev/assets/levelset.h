// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Initial screen & position, per level

const unsigned char l_scr_ini [] = 				{ 19, 18 };
const unsigned char l_ini_x [] = 				{ 13, 9 };
const unsigned char l_ini_y [] = 				{ 3, 3 };
const unsigned char l_map_w [] = 				{ 5, 4 };
const unsigned char l_map_h [] =				{ 4, 5 };

// Ending screen & position, per level (comment if N/A)

/*
const unsigned char l_scr_end [] = 				{ 0, 0 };
const unsigned char l_end_x [] = 				{ 3, 3 };
const unsigned char l_end_y [] = 				{ 3, 3 };
*/

// # of objects. 

const unsigned char l_player_max_objects [] =	{ MAX_HOTSPOTS_TYPE_1_0, MAX_HOTSPOTS_TYPE_1_1 };

// # of killable enemies 

const unsigned char l_player_max_enems [] = 	{ KILLABLE_ENEMS_0, KILLABLE_ENEMS_1 };

// Metatiles

const unsigned char * const l_ts_patterns [] =  { ts0_patterns_c, ts1_patterns_c };
const unsigned char * const l_ts_colours [] =   { ts0_colours_c, ts1_colours_c };
const unsigned char * const l_ts_tmaps [] = 	{ ts0_tmaps, ts1_tmaps };
const unsigned char * const l_behs [] = 		{ behs0, behs1 };

// Enemy spriteset

//const unsigned char * const l_spr_patterns [] = { ss_en_0_patterns_c, ss_en_1_patterns_c, 0 };
const unsigned char * const * const l_spr_enems [] =
												{ spr_enems0, spr_enems0 };

// Map data

#ifdef MAP_FORMAT_PACKED
	const unsigned char * const l_map [] =		{ map_0, map_1 };
#endif
#if defined (MAP_FORMAT_RLE16) || defined (MAP_FORMAT_RLE53) || defined (MAP_FORMAT_RLE44)
	const unsigned char * const * const l_map [] =	
												{ map_0, map_1 };
#endif

#ifdef MAP_WITH_DECORATIONS
	#if defined (MAP_FORMAT_PACKED) || defined (MAP_FORMAT_RLE16) 
		const unsigned char * const * const l_decos [] =
												{ map_0_decos, map_1_decos };
	#else
		// 0 = no decos in this level's map, 1 = decos.
		const unsigned char l_decos [] = 		{ 0, 0 };												
	#endif
#endif

#ifndef DEACTIVATE_KEYS
	const unsigned char * const l_locks [] = 	{ map_0_locks, 0 };
	const unsigned char l_n_bolts [] = 			{ N_BOLTS_0, 0 };
#endif

// Objects

const unsigned char * const l_enems [] = 		{ enems_0, enems_1 };
const unsigned char * const l_hotspots [] = 	{ hotspots_0, hotspots_1 };

// Interactives

#if defined (ENABLE_INTERACTIVES) && defined (INTERACTIVES_FROM_CODE)
	const unsigned char * const l_interactives [] = 
												{ interactives0, interactives1 };
#endif

// Music track

const unsigned char * const l_music [] = 		{ MUSIC_INGAME1, MUSIC_INGAME1 };
