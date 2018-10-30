// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// player.h
// Player movement & stuff

#ifdef DIE_AND_RESPAWN
	void player_register_safe_spot (void);
#endif
void player_stop (void);
void player_init (void);
void player_render (void);
void player_to_pixels (void);
void player_kill (void);

#if defined(PLAYER_PUSH_BOXES) || !defined(DEACTIVATE_KEYS)
	void player_process_tile (unsigned char at, unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1);

#endif

#ifdef PLAYER_CAN_FIRE
	void fire_bullet (void);
	void bullets_destroy (void);
	void bullets_move (void);
#endif

void player_move (void);
