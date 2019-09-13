// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Win level condition. Note the precedence if severan items are
// #defined: first, WIN_LEVEL_CUSTOM, then ACTIVATE_SCRIPTING (by WIN LEVEL),
// then, ponjs == PLAYER_MAX_OBJECTS, then "ending location"

	if (
	#if defined (WIN_LEVEL_CUSTOM)
		win_level
	#elif defined (ACTIVATE_SCRIPTING)
		script_result == 1
	#elif defined (PLAYER_MAX_OBJECTS)
		pobjs == PLAYER_MAX_OBJECTS
	#elif defined (SCR_END)
		(
			n_pant == SCR_END && 
			((prx + 8) >> 4) == PLAYER_END_X &&
			((pry + 8) >> 4) == PLAYER_END_Y
		) 
	#endif
	) {
		PSGStop ();
		delay (50);
		break;
	}
