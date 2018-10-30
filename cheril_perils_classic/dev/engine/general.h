// NES MK1 v1.0
// Copyleft Mojon Twins 2013, 2015, 2017, 2018
// SG1000 Version

// general.h
// General functions, vars & buffers

void cm_two_points (void);
void cm_three_points (void);
unsigned char collide_in (unsigned char x0, unsigned char y0, unsigned char x1, unsigned char y1);
unsigned char collide (void);
signed int add_sign (signed int sign, signed int value);

#ifdef ACTIVATE_SCRIPTING
	void run_fire_script (void);
#endif

inline signed int saturate (signed int v, signed int max);
void pad_read (void);

#if defined (ENABLE_HOMING_FANTY) || defined (ENABLE_COCOS)
	unsigned char distance (void);
#endif

#ifndef PLAYER_TOP_DOWN
	void jump_start (void);
#endif

void update_cycle (void);
void do_update_list_and_wait (void);
