# Jet Paco & Jet Puri

This is a enhaced port of the original Jet Paco and / or Jet Puri 2 with a few additions. This game is interesting as I'm abusing the `#defines` in an ugly way to have different movement values for Paco and Puri.

## First step: instead of numbers, use variables.

```c
	// config.h

	#define PLAYER_VY_FALLING_MAX	__player_vy_falling_max	// Max. velocity when falling
	[...]
	#define PLAYER_G				__player_g				// Gravity
	[...]
	#define PLAYER_AY_JETPAC		__player_ay_jetpac		// Jetpac increment
	#define PLAYER_VY_JETPAC_MAX	__player_vy_jetpac_max	// Max jetpac vertical speed
	[...]
	#define PLAYER_VX_MAX			__player_vx_max			// Max. horizontal speed
	[...]
	#define PLAYER_AX				__player_ax 			// Horizontal acceleration
	[...]
	#define PLAYER_RX				__player_rx				// Horizontal 
```

## Those variables need to be defined.

That is done at `my/extra_vars.h`. As they will be used in the `player.c`module, you have to make them extern in `my/extra_declarations.h`:

```c
	// extra_vars.h
	unsigned char __player_vy_falling_max;
	unsigned char __player_g;
	unsigned char __player_ay_jetpac;
	unsigned char __player_vy_jetpac_max;
	unsigned char __player_vx_max;
	unsigned char __player_ax;
	unsigned char __player_rx;
```

```c
	// extra_declarations.h
	extern unsigned char __player_vy_falling_max;
	extern unsigned char __player_g;
	extern unsigned char __player_ay_jetpac;
	extern unsigned char __player_vy_jetpac_max;
	extern unsigned char __player_vx_max;
	extern unsigned char __player_ax;
	extern unsigned char __player_rx;
```

## Assign values depending on game mode.

We can make this, for example, at the end of `title` in `my/pres.h`:

```c
	// pres.h

	// Select player values
	if (game_puri) {
		__player_vy_falling_max = 48;
		__player_g              = 8; 
		__player_ay_jetpac      = 16;
		__player_vy_jetpac_max  = 72;
		__player_vx_max         = 128;
		__player_ax             = 8;
		__player_rx             = 8;
	} else {
		__player_vy_falling_max = 64;
		__player_g              = 4; 
		__player_ay_jetpac      = 12;
		__player_vy_jetpac_max  = 64;
		__player_vx_max         = 112;
		__player_ax             = 16;
		__player_rx             = 16;
	}
```

## A custom chac-chac

To create a custom chac-chac, just define `USE_CUSTOM_CHAC_CHAC` at `config.h`, then populate the values at `my/chac_chacs_config.h`. Don't forget to add the required defines in `my/extra_declarations.h`.

```c
	// config.h

	// Chac chacs

	#define ENABLE_CHAC_CHAC
	/*
	#define CHAC_CHAC_BASE_TILE				16
	#define CHAC_CHAC_IDLE_2				16
	#define CHAC_CHAC_IDLE_3				1
	#define CHAC_CHAC_IDLE_4				50
	*/

	#define CHAC_CHAC_FROM_MAP				// Chac chacs are not placed as enemies but as tiles
	#define MAX_CHAC_CHACS					4
	#define MAX_CHAC_CHACKS_QUEUED			16 // Make the closest power of 2 >= (MAX_CHAC_CHACS*4)
	#define CHAC_CHAC_DETECT_TILE			24
	#define CHAC_CHACS_CLEAR				0 // You are placing chac chacks from map but need the path to be clear

	#define USE_CUSTOM_CHAC_CHAC			// Implement your own chac chac (see notes)
```

```c
	// extra_declarations.h

	#define CHAC_CHAC_BOUM_STATE 3
	#define CHAC_CHAC_MAX_STATES 6
	#define CHAC_CHAC_DETECT_TILES 3
```

```c
	// chac_chacs_config.h

	const unsigned char chac_chacs_initial_times [] = {
		25, 50, 100
	};

	const unsigned char chac_chacs_times [] = {
		0, 1, 1, 100, 16, 16
	};

	const unsigned char chac_chacs_t1 [] = {
		16, 17, 18, 18, 18, 17
	};

	const unsigned char chac_chacs_t2 [] = {
		 0,  0, 17, 18, 17,  0
	};

	const unsigned char chac_chacs_t3 [] = {
		 0,  0,  0, 17,  0,  0
	};
```
