// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// extra_vars.h
// If your customs need extra variables (in BSS) define them here

#define CELL_PACO			0
#define CELL_PURI 			10
unsigned char game_puri;			// Will equal CELL_PACO or CELL_PURI.

// This will help animate puri using 3 cycled frames
unsigned char ol_prx;

unsigned char __player_vy_falling_max;
unsigned char __player_g;
unsigned char __player_ay_jetpac;
unsigned char __player_vy_jetpac_max;
unsigned char __player_vx_max;
unsigned char __player_ax;
unsigned char __player_rx;
