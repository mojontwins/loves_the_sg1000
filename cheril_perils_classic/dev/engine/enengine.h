// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// enengine.h
// Enemies Engine & stuff

#ifdef ENABLE_CHAC_CHAC
	void enems_draw_chac_chac (unsigned char a1, unsigned char a2, unsigned char a3);
#endif

#ifdef PERSISTENT_ENEMIES
	void enems_persistent_load (void);
	void enems_persistent_update (void);
#endif

#ifdef PERSISTENT_DEATHS
	void enems_persistent_deaths_load (void);
#endif

void enems_update_unsigned_char_arrays (void);
void enems_facing (void);
void enems_init_fp (void);

#ifdef ENABLE_BOIOIONG
	void enems_boioiong_init (void);
#endif

void enems_load (void);

#ifdef ENEMS_MAY_DIE
	void enems_kill (void);
	void enems_hit (void);
#endif

void enems_move (void);
