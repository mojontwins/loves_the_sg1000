# Sgt. Helmet: Training Day

A port of the MTE MK1 NES / AGNES "top-down tester" plus the extra level found in the MK2 version (from Mojonian Tales). Also, the game logic is not controlled via scripting but code injection, that's why I'm adding a 

## How I did this

First of all, I add a new custom variable `bombs_set` which I need to zero at the beginning of each level. So:

**my/extra_vars**: 

```c
	unsigned char bombs_set;
```

**my/extra_inits**:

```c
	bombs_set = 0;
```

When entering screen 0, first we draw the evil computer (`my/on_entering_screen.h`). The evil computer is 6 metatile or 24 patterns to update, so we can use one update cycle:

```c
	if (n_pant == 0) {
	// There may be stuff in the update list, so flush:
	do_update_list_and_wait ();
	
	// Always: draw evil computer
	clear_update_list ();
	rdx = 6; rdy = 4; rdt = 16; gpit = 6; while (gpit --) {
		_x = rdx; _y = rdy; _t = rdt; map_set ();
		rdt ++; rdx ++; if (rdx == 9) { rdx = 6; rdy ++; }
	}

	do_update_list_and_wait ();
	clear_update_list ();

	// Leave list empty and screen initialized when exiting.
}
```

Adding code to draw the bombs if `bombs_set` is set (!) is easy. Just put this new block before the last flush/clear cycle:

```c
	// Draw 5 bombs? 
	if (bombs_set) {
		do_update_list_and_wait ();
		clear_update_list ();
		_x = 4; _y = 5; _t = 24; map_set ();
		_x = 4; _y = 3; _t = 24; map_set ();
		_x = 7; _y = 2; _t = 24; map_set ();
		_x = 10; _y = 3; _t = 24; map_set ();
		_x = 10; _y = 5; _t = 24; map_set ();
	}
```

Last thing to do is the "set bombs" animation when approaching the computer. This is detected when `pry` goes below 128. Then, the bombs are set with delays and sounds after each one. We can do this in `extra_routines.h`:

```c
	if (n_pant == 0 && bombs_set == 0 && pry < 128) {
		_x = 4; _y = 5; _t = 24; map_set (); do_update_list_and_wait (); clear_update_list (); PSGSFXPlay (SFX_HITTER, 3); delay (20); 
		_x = 4; _y = 3; _t = 24; map_set (); do_update_list_and_wait (); clear_update_list (); PSGSFXPlay (SFX_HITTER, 3); delay (20);
		_x = 7; _y = 2; _t = 24; map_set (); do_update_list_and_wait (); clear_update_list (); PSGSFXPlay (SFX_HITTER, 3); delay (20);
		_x = 10; _y = 3; _t = 24; map_set (); do_update_list_and_wait (); clear_update_list (); PSGSFXPlay (SFX_HITTER, 3); delay (20);
		_x = 10; _y = 5; _t = 24; map_set (); do_update_list_and_wait (); clear_update_list (); PSGSFXPlay (SFX_HITTER, 3); delay (20);

		bombs_set = 1;
	}

```

Finally, the game ends when you enter screen 23 with the bombs set. A delay is great for this. Edit `my/extra_checks.h`.

```c
	if (n_pant == 23 && bombs_set) {
		PSGSFXPlay (SFX_FANFARE, 2);
		delay (120);
		win_level = 1;
	}
```

To save some bytes, let's create two arrays with the position of the bombs to iterate. `my/extra_vars.h`:

```c 
	const unsigned char bombs_x [] = { 4, 4, 7, 10, 10 };
	const unsigned char bombs_y [] = { 5, 3, 2, 3, 5 };
```

And modify the code we wrote in `my/on_entering_screen.h` and `extra_routines.h`:

```c 
	// Draw 5 bombs? 
	if (bombs_set) {
		do_update_list_and_wait ();
		clear_update_list ();
		for (gpit = 0; gpit < 5; gpit ++) {
			_x = bombs_x [gpit]; _y = bombs_y [gpit]; _t = 24; map_set ();
		}
	}
```

```c
	if (n_pant == 0 && bombs_set == 0 && pry < 128) {
		for (gpit = 0; gpit < 5; gpit ++) {
			_x = bombs_x [gpit]; _y = bombs_y [gpit]; _t = 24; map_set ();	
			do_update_list_and_wait (); 
			clear_update_list (); 
			PSGSFXPlay (SFX_HITTER, 3); 
			delay (20); 
		}
		
		bombs_set = 1;
	}
```

