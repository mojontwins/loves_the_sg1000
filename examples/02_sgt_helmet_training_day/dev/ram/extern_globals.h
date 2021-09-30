// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Global externs for including in all modules.

// Avoid parameters using these in critical functions.

extern unsigned char _x, _y, _n, _t;

// General, all-purpose variables

extern unsigned char pad0;                     // (sglib) pad 0 read.
extern unsigned char pad_this_frame;           // (sglib) pad 0 read, current frame presses.
extern unsigned char gpit, gpjt;               // General purpose iterators.
extern signed int rds16;                       // General purpose 16 bit extern signed variable.

extern const unsigned char *gp_gen;            // General purpose pointer to read data in ROM.
extern const unsigned char *gp_tmap;           // Pointers used to read map data in ROM.
extern unsigned char *gp_ram;                  // General purpose pointers to read / write data in RAM.
extern unsigned int gp_addr;                   // General purpose address, used for PPU addresses.
extern unsigned char rdx, rdy;                 // General purpose coordinates
extern unsigned char rdt;                      // General purpose "type"
extern unsigned char rdit;                     // General purpose iterator
extern unsigned char rda, rdb, rdc, rdd, rdm;  // General purpose temporal value holders.
extern signed char rds;                        // General purpose temporal value holder, signed.
extern unsigned char rdct;                     // General purpose counter
extern unsigned char ticker;                   // Ticker. 0 for a frame every second.

// Used for two-points collision

extern unsigned char at1, at2;                 // Temporally store tile attributes at the checked collision points
extern unsigned char cx1, cx2;                 // Check those collision points, X coordinates.
extern unsigned char cy1, cy2;                 // Check those collision points, Y coordinates.
extern unsigned char caux;                     // Auxiliar variable

#if PLAYER_COLLISION_VSTRETCH_BG > 0
    extern unsigned char cy3, at3;             // If player collision box is > 16 pixels, a third point is used
#endif

// Sprite related (neslib)

extern unsigned char *cur_stp;                 // Copy of the (Internal) pointer to the SAT copy

// Enemies

extern unsigned char en_initial;               // First enemy to process in current screen, current frame (cycles 0, 1, 2, ...)
extern unsigned char en_offs;                  // Precalculated value: n_pant * 3; used to index data related to enemy persistence

extern unsigned char en_fr;                    // (Temporal) enemies frame number
extern unsigned char en_collx, en_colly;       // (Temporal) collision flags
extern unsigned char en_spr;                   // Current enemy sprite index
extern unsigned char touched;                  // (Temporal) an enemy collided with the player
extern unsigned char en_is_alive;              // (Temporal) current enemy is alive, used when enemies respawning is on.
extern unsigned char pregotten;                // (Temporal) player <-> current enemy horizontal overlap flag.

#ifdef ENEMS_RECOIL_ON_HIT
    extern signed char en_rmx [];             // If recoiling, recoil direction in the X axis.
    #ifdef PLAYER_TOP_DOWN
        extern signed char en_rmy [];         // If recoiling, recoil direction in the Y axis.
    #endif
#endif

#ifdef ENABLE_COMPILED_ENEMS
    extern const unsigned char *en_behptr []; // A pointer to curren enemy script for compiled enemies.
#endif

// Those variables are used as temporal copies of general arrays defined in BSS (check bss.h)

extern unsigned char _en_t, _en_s;
extern unsigned char _en_x, _en_y;
extern unsigned char _en_x1, _en_y1, _en_x2, _en_y2;
extern signed char _en_mx, _en_my;
extern unsigned char _en_ct, _en_facing, _en_state;
extern signed int _enf_x, _enf_y, _enf_vx, _enf_vy;

// Signals, all purpose, for enemies

extern unsigned char en_sg_1, en_sg_2;

// Main player

extern unsigned char vertical_engine_type;     // Player engine type. Se ENGINE_TYPE_* constants in definitions.h
extern signed int px, py;                      // Player X, Y coordinates, fixed point 10.6
extern signed int pvx, pvy;                    // Player VX, VY velocities, fixed point 10.6
extern unsigned char prx, pry;                 // Player pixel coordinates, calculated from px, py.
extern unsigned char pcx, pcy;                 // Coordinates prior to movement.
extern unsigned char pfacing;                  // Player facing left, right
extern unsigned char pfr;                      // Player frame
extern unsigned char psprid;                   // Player sprite ID set in my/player_frame_selector.h
extern unsigned char a_button, b_button;       // True if A or B have been pressed *this* frame, respectively

#ifdef PLAYER_TOP_DOWN
    extern unsigned char pfacinghlast;         // Last horizontal direction registered
#endif

extern unsigned char pj;                       // "Player is jumping" flag
extern unsigned char pjb;                      // "Player is pressing JUMP button"
extern unsigned char pctj;                     // "Player is jumping" counter
extern unsigned char pgotten;                  // "Player is on moving platform or similiar" flag
extern unsigned char ppossee;                  // "Player is on walkable scenery" flag
extern unsigned char oppossee;                 // Same, but prev. frame
extern unsigned char pflickering;              // "Player is flickering", also a frame counter.
extern unsigned char pbouncing;                // "Player is bouncing", also a frame counter.
extern unsigned char phit;                     // "Player was hit by killing tile" flag
extern signed int pgtmx, pgtmy;                // X, Y components of velocity in "player is being moved by external entity" conditions

#if defined (ENABLE_EASY_OBJECTS) || defined (ENABLE_ONLY_ONE_OBJECT)
    extern unsigned char pinv, opinv;          // Player inventory (which object is being carried) & last frame copy.
#endif

#ifdef ENABLE_LADDERS
    extern unsigned char ponladder;            // True if player is on a ladder.
    extern unsigned char phalfladder;          // True if player's feet are on a ladder.
    extern unsigned char ponladderctr;         // Counter used for animation when player is on ladders in my/player_frame_selector.h
#endif

#ifdef ENABLE_TRAMPOLINES
    extern unsigned char ptrampoline;          // "Player got propelled by a trampoline" flag
#endif

#ifdef PLAYER_SPINS 
    extern unsigned char pspin;                // "Player is spinning" flag
#endif  

#ifdef PLAYER_TOP_DOWN
    extern unsigned char pfacingv, pfacingh;   // Player facing variables in each axis for top-down games
#endif

extern unsigned char hitv, hith;               // True if the player collided with a killing tile vertically or horizontally

#ifdef PLAYER_CAN_FLOAT
    extern unsigned char pfloating;            // Player is floating (for example, when on a propeller)
#endif

extern unsigned char prx_old, pry_old;

extern unsigned char pkill;                    // Set to 1 to kill player
extern unsigned char pice;                     // Player is walking on ice
extern unsigned char pnotsafe;                 // Player is walking a non safe (for example, breakable) tile 

extern unsigned char pcontinues;               // Number of continues
extern unsigned char plife;                    // Player life gauge
#ifndef DEACTIVATE_KEYS
    extern unsigned char pkeys;                // Player # of collected keys
#endif
extern unsigned char pobjs;                    // Player # of collected (collectible) items
extern unsigned char pammo;                    // Player ammo
#if defined (ENEMS_MAY_DIE)
    extern unsigned char pkilled;              // Player # of killed enemies
#endif

extern unsigned char pfiring;                  // Flag to control actions spawned by the B button

#ifdef DIE_AND_RESPAWN
    extern unsigned char n_pant_safe;
    extern signed int px_safe, py_safe;        // Screen (room) number and coordinates to respawn player
#endif

#ifdef PLAYER_PUNCHES
    extern unsigned char ppunching;            // "Player is punching" flag
#endif

#ifdef PLAYER_KICKS
    extern unsigned char pkicking;             // "Player is kicking" flag
#endif

#if defined (PLAYER_PUNCHES) || defined (PLAYER_KICKS)
    extern unsigned char phitterx, phittery;   // If player is punching or kicking, hitbox coordinates
    extern unsigned char phitteract;           // True if hitbox is active
    extern unsigned char pfrozen;              // != 0 if player is frozen (after landing a hit). Invalidate input & decrement
#endif

// Bullets

#ifdef PLAYER_CAN_FIRE
    extern unsigned char bi;                   // Iterator for player bullets (projectiles shot by the player)
#endif

// Cocos

#ifdef ENABLE_COCOS
    extern unsigned char coco_it;              // Iterator for cocos (projectiles shot by enemies)
#endif

// Hotspots
extern unsigned char hrx, hry, hrt;            // Current screen hotspot X, Y coordinates and type, respectively

// Process breakable?
#ifdef BREAKABLE_ANIM
    extern unsigned char do_process_breakable; // There's animation of tiles breaking, check next frame.
#endif

extern unsigned char ft;                       // "This is the first time rendering a screen" flag, 
                                        // used internally to control fading in/out of rooms

// Current level

extern unsigned char c_map_w;                  // Map width for current level
extern unsigned char c_map_h;                  // Map height for current level
extern unsigned char c_map_size;               // Map size for current level

extern const unsigned char *c_ts_pals;         // Pointer to metatile palettes array
extern const unsigned char *c_ts_tmaps;        // Pointer to metatile tilemaps array
extern const unsigned char *c_behs;            // Pointer to metatile behaviours (attributes) array

extern const unsigned char * const *spr_enems; // Pointer to metasprite array for enemies

extern const unsigned char *c_pal_bg;          // Pointer to current background palette
extern const unsigned char *c_pal_fg;          // Pointer to current foreground palette (sprites)

// Pointer to current map, several formats:

#ifdef MAP_FORMAT_PACKED
    extern const unsigned char *c_map;         
#endif
#if defined (MAP_FORMAT_RLE16) || defined (MAP_FORMAT_RLE53) || defined (MAP_FORMAT_RLE44)
    extern const unsigned char * const *c_map;
#endif
#if defined (MAP_FORMAT_RLE53_CHRROM) || defined (MAP_FORMAT_RLE44_CHRROM)
    extern const unsigned int *c_map;
    extern unsigned char c_map_chr_rom_bank;
#endif
    
// Pointer to decorations, several formats:

#ifdef MAP_WITH_DECORATIONS
    #if defined (MAP_FORMAT_RLE16) || defined (MAP_FORMAT_PACKED)
        extern const unsigned char * const *c_decos;
    #else
        extern unsigned char c_decos;
    #endif
#endif

extern const unsigned char *c_locks;           // Pointer to current level list of locks in ROM

// Pointers to enemies & hotspots data structures, different formats (CHR-ROM or PRG-ROM based)

#ifdef ENEMS_IN_CHRROM
    extern unsigned int c_enems;
    extern unsigned int c_hotspots;
#else
    extern const unsigned char *c_enems;
    extern const unsigned char *c_hotspots;
#endif

extern unsigned char c_max_bolts;              // Number of locks in current level

// Scripting system interpreter internal variables.

#ifdef ACTIVATE_SCRIPTING
    extern unsigned char sc_x, sc_y, sc_n, sc_c;
    extern const unsigned char *next_script;
    extern const unsigned char *script;
    extern unsigned char script_result, sc_terminado, sc_continuar;
#endif

extern unsigned char ntsc, ntsc_frame;

// Update list (neslib)

#define UPDATE_LIST_SIZE 32
extern unsigned char update_index;
extern unsigned char update_list [];

// Fader (neslib)

extern signed  char fader;                      // Brightness level
extern unsigned char fade_delay;               // # of frames per brightness level in fades

// Current screen

#ifndef SG1000
    extern unsigned char map_attr [];       // Current screen (room) tile behaviours
#endif    
extern unsigned char map_buff [];           // Current screen (room) tile numbers

// Game flow

extern unsigned char first_game;               // True if it's the first time the game runs

extern unsigned char level;                    // Current level number

extern unsigned char c_max_enems;              // Number of killable enems. in current level.

extern unsigned char n_pant;                   // Current screen (room) number.
extern unsigned char on_pant;                  // Current screen (room) numberm last frame value (used to detect changes)

extern unsigned char half_life;                // 1-0 flip flop (each game frame)
extern unsigned char frame_counter;            // Game grame counter, wraps 255->0

extern unsigned char paused;                   // True if the game is paused.
extern unsigned char win_level;                // If WIN_LEVEL_CUSTOM is defined, set to true to win the level.
extern unsigned char game_over;                // True if the player lost the game.
extern unsigned char warp_to_level;            // True if the player is jumping to a different level 
extern unsigned char level_reset;              // True if the level should be reset.
extern unsigned char flick_override;           // If set, code to flick screen is overriden for current frame

// General player values, last frame copies

extern unsigned char olife;                    // Player life, last frame value (used to detect changes)
extern unsigned char okeys;                    // Player keys, last frame value (used to detect changes)
extern unsigned char oobjs;                    // Player items, last frame value (used to detect changes) 
extern unsigned char oammo;                    // Player ammo, last frame value (used to detect changes)
extern unsigned char okilled;                  // Player # of killed enems., last frame value (used to detect changes)

extern unsigned char oam_index_player;         // Index copy

// Custom hotspot type star (used as an extra collectible).

#ifdef HOTSPOT_TYPE_STAR
    extern unsigned char pstars;               // Player # of collected stars
    extern unsigned char opstars;              // Player # of collected stars, last frame value (used to detect changes) 
#endif
    
// Player "use" animation values.

#ifdef ENABLE_USE_ANIM
    extern unsigned char use_ct;               // General counter, serves as a state indicator.
    extern unsigned char use_sub_ct;           // Subcounter.
    #ifdef ACTIVATE_SCRIPTING
        extern unsigned char run_fire_script_do;   
                                        // If true, the PRESS_FIRE scripts should be run.
    #endif
    extern unsigned char use_type;             // Action type. May be USE_TYPE_HOTSPOT, USE_TYPE_INTERACTIVE or USE_TYPE_SCRIPTING
#endif

// A small sprite showing a text balloon with the NO! word,
// Of course, may be repurposed for other uses.

#ifdef ENABLE_NO
    extern unsigned char no_ct;                // General counter. When != 0, display sprite & decrement.
#endif

// Bullets (projectiles shot by the player)

#ifdef PLAYER_CAN_FIRE
    extern unsigned char b_slots [];
    extern unsigned char b_slots_i;            // Array of free slots for active bullets & index.
    extern unsigned char bst [];    // Bullets states
    
    extern unsigned char bx [];     // Bullets, X coordinates.
    extern unsigned char by [];     // Bullets, Y coordinates.
    extern signed  char bmx [];      // Bullets, direction + speed in the X axis.
    extern signed  char bmy [];      // Bullets, direction + speed in the Y axis.

    #ifdef PLAYER_CHARGE_AND_FIRE
        extern unsigned char pfiregauge;       // Fire gauge 
        extern unsigned char opfiregauge;      // Fire gauge, last frame value (used to detect changes)
    #endif

    #ifdef PLAYER_FIRE_RELOAD
        extern unsigned char pfirereload;      // Reload time. When != 0, block B_BUTTON & decrement.
    #endif	
#endif

extern unsigned char pctfr;                    // Frame subcounter        

// Cocos (projectiles shot by enemies)

#ifdef ENABLE_COCOS
    extern unsigned char coco_slots [];
    extern unsigned char coco_slots_i;         // Array of free slots for active cocos & index.

    extern unsigned char coco_on [];  // Cocos states
    
    extern signed  int coco_x [];      // Cocos, X coordinates (fixed point 10.6)
    extern signed  int coco_y [];      // Cocos, Y coordinates (fixed point 10.6)
    extern signed  int coco_vx [];     // Cocos, direction + speed in the X axis.
    extern signed  int coco_vy [];     // Cocos, direction + speed in the Y axis.
#endif  

// Breakable walls

#ifdef ENABLE_BREAKABLE
    #ifdef BREAKABLE_ANIM
        extern unsigned char brkf [];
        extern unsigned char brkx [];
        extern unsigned char brky [];
                                        // List of tiles to update when BREAKABLE_ANIM is set
    #endif
    extern unsigned char pmayneedrelocation;   // If 1, check if the coordinates to respawn the player are safe, relocate if not.
#endif

// Hotspots

#if defined (HOTSPOTS_DYNAMIC) || defined (ENEMS_IN_CHRROM)       
                                        // If HOTSPOTS_DYNAMIC is defined, hotspots are copied to RAM and may be modified
                                        // Otherwise they are read from ROM when entering each screen.
    extern unsigned char hyx [];       // Hotspot position per screen (room), packed 0xYX
    extern unsigned char ht [];        // Hotspot type per screen (room)
#endif

extern unsigned char hact [];          // Hotspots active per screen (room)

// Bolts (locks, unlockable with keys)

#ifndef DEACTIVATE_KEYS
    extern unsigned char lkact [];    // If lkact [], lock #N is "locked"
#endif

// Scripting system

#ifdef ACTIVATE_SCRIPTING
    extern void msc_clear_flags (void);
    extern void run_script (unsigned char whichs);

    #if defined (ENABLE_FIRE_ZONE) || defined (ENABLE_FAST_FIRE_ZONE)
        extern unsigned char f_zone_ac;        // "Fire zone" is active in current screen (room)
        extern unsigned char fzx1;
        extern unsigned char fzx2;
        extern unsigned char fzy1;
        extern unsigned char fzy2;             // Coordinates of the "fire zone" rectangle's opposite corners.
    #endif

    #if defined (ENABLE_PUSHED_SCRIPT)
        extern unsigned char just_pushed;      // True if a pushable has just been pushed. Used by the interpreter.
    #endif

    extern unsigned char fire_script_success;  // True if the command section of a clausule in a PRESS_FIRE script was run.

    #if defined (ENABLE_INTERACTIVES)
        extern unsigned char just_interacted;  // True if the player just interacted. Used by the interpreter.
        extern unsigned char script_arg;       // Identifier of the interactive the used interacted with. Used by the interpreter.
    #endif
#endif

// Flags

extern unsigned char flags [];        // Array of flags used by interactives, the scripting system, etc.

// Interactives

#ifdef ENABLE_INTERACTIVES
    extern unsigned char interactives_interact_with;
                                        // The player pressed B on which interactive?
    extern unsigned char interactives_index;
                                        // Index of active interactives on current screen (room) (when creating),
                                        // Number of active interactives (in the game loop)
    extern unsigned char interactives_f [];
                                        // Flag bound to the interactive | 0x80 (if container) or sprite number (if sprite).
                                        // If this value & 0x80 => container. Sprite otherwise.
    extern unsigned char interactives_yx [];
    #ifdef INTERACTIVES_FROM_CODE
        const extern unsigned char *c_interactives;
                                        // Pointer to current level's interactive definitions array
    #endif
#endif

// More globals for baddies (for current screen)

extern unsigned char en_t [];                 // Enemy types.

extern unsigned char en_x [];                 // Enemy X coordinates.
extern unsigned char en_y [];                 // Enemy Y coordinates.

extern unsigned char en_x1 [];
extern unsigned char en_y1 [];                // Enemy starting point coordinates (for patrollers, repurposed for other types)

extern unsigned char en_x2 [];
extern unsigned char en_y2 [];                // Enemy ending point coordinates (for patrollers, repurposed for other types)

extern signed  char en_mx [];                  // Enemy direction + speed in the X axis.
extern signed  char en_my [];                  // Enemy direction + speed in the Y axis.

extern unsigned char en_s [];                 // Enemy base sprite index in spr_enems.
extern unsigned char en_facing [];            // Generally, 0 = facing right, 4 = facing left.

extern unsigned char en_state [];             // Enemy State
extern unsigned char en_flags [];             // Enemies flags

extern unsigned char en_cttouched [];         // Counters used to show explosions / flickering
extern unsigned char en_life [];              // Enemies life gauges
extern unsigned char en_status [];            // Enemies statused, repurposed per enemy type
extern unsigned char en_ct [];                // Enemies General repurposeable counter

#if defined (ENABLE_COMPILED_ENEMS) || defined ENABLE_PURSUERS
    extern unsigned char en_rawv [];           // Speed, used for pursuer-type enemies
#endif

extern unsigned char en_spr_x_mod;             // Modifier to X position of sprite (for effects)

#ifdef ENEMS_CAN_RESPAWN
    extern unsigned char en_respawn [];       // If true, enems can respawn.
    extern unsigned char en_resx [];
    extern unsigned char en_resy [];          // Respawn coordinates.
    extern signed  char en_resmx [];
    extern signed  char en_resmy [];           // Respawn mx, my.
#endif

// Fixed point variables (coordiantes, velocity) for some kinds of enemies.

#ifdef ENEMS_NEED_FP
    extern signed  int enf_x [];
    extern signed  int enf_vx [];
    extern signed  int enf_y [];
    extern signed  int enf_vy [];
#endif

// Generator for PURSUER type enemies.

#ifdef ENABLE_GENERATORS
    extern unsigned char en_generator_life [];
                                        // Generators life gauge.
    extern unsigned char gen_was_hit [];      // True if generator was hit.
#endif

extern unsigned char en_spr_id [];

// Temporal invincibility

#ifdef ENEMS_INVINCIBILITY
    extern unsigned char en_invincible [];
#endif

// Persistent enemies (position / movement is remembered)

#ifdef PERSISTENT_ENEMIES
    extern unsigned char ep_x [];  // Buffer for X coordinates.
    extern unsigned char ep_y [];  // Buffer for Y coordinates.
    extern signed  char ep_mx [];   // Buffer for direction + speed in the X axis.
    extern signed  char ep_my [];   // Buffer for direction + speed in the Y axis.
#endif

// Persistent deaths (death enemies stay dead in current level)

#ifdef PERSISTENT_DEATHS
    extern unsigned char ep_dead [];
                                        // Buffer for dead enemies (true if dead).
#endif

// Propellers

#ifdef ENABLE_PROPELLERS
    extern unsigned char prp_idx;              // Index of active propellers on current screen (room) (when creating)
                                        // Number of active propellers on current screen (room) (in the game loop)
    extern unsigned char prp_yx [];
                                        // Coordinates of active propellers, packed 0xYX
    extern unsigned char propellers_on;        // Propellers are on (animate & affect player)
#endif

// Shines

#ifdef ENABLE_SHINES
    extern unsigned char max_shines;           // Index of active shines on current screen (room) (when creating)
                                        // Number of active shines on current screen (room) (in the game loop)

    extern unsigned char shines [];  // Coordinates of active shines, packed 0xYX

    extern unsigned char shine_active_x;
    extern unsigned char shine_active_y;       // Animating shine X and Y coordinates.
    extern unsigned char shine_active_ct;      // Animation frame counter. 
#endif

// Tile Chac Chacs

#ifdef ENABLE_TILE_CHAC_CHAC
    extern unsigned char max_chac_chacs;       // Index of active chac-chac blades on current screen (room) (when creating)
                                        // Number of active chac-chac blades on current screen (room) (in the game loop)
    extern unsigned char chac_chacs_yx [];
                                        // Coordinates of active chac-chac blades, packed 0xYX
    extern unsigned char chac_chacs_state [];
                                        // States of active chac-chac blades
    extern unsigned char chac_chacs_idlewait [];
                                        // # of frames to wait in state 0 (idle)
    extern unsigned char chac_chacs_ct [];
                                        // Frame counters
    
    // Those are used to implement a "update queue" to send changes to VRAM.
    // Changes are sent "one entity per frame", therefore this queue is needed.
    extern unsigned char chac_chacs_queue [];
    extern unsigned char chac_chacs_queue_read, chac_chacs_queue_write;
#endif

// Resonators

#ifdef ENABLE_RESONATORS
    extern unsigned char res_disable;          // If true, resonators don't work (but show!)
    extern unsigned char res_on;               // Resonators are "on" (player pressed one)
    extern unsigned char res_ct;               // This holds resonators' count down
    extern unsigned char res_subct;            // Frame counter for each "tick"
#endif

// More conveyors

#ifdef ENABLE_CONVEYORS
    extern signed  char cfx;                    // Auxiliary variable, copy of the added speed when the player is on a conveyor,
                                        // used to detect if the player is pushed out of the screen while on a conveyor belt.
#endif

// Timer

#ifdef ENABLE_TIMER
    extern unsigned char timer;                // Timer, current value.
    extern unsigned char otimer;               // Timer, current value, last frame (to detect changes).
    extern unsigned char timer_frames;         // Timer, frame counter for each "ticke"
    extern unsigned char timer_zero;           // Set to true when timer == 0; must be reset manually!
    extern unsigned char timer_on;             // If true, timer is running.
#endif

// Springs

#ifdef ENABLE_SPRINGS
    extern unsigned char springs_on;           // Springs are ON, level-wide setting.
#endif

// Shaker

#ifdef ENABLE_SHAKER
    extern unsigned char shaker_ct;            // If != 0, shake the screen & decrement.
#endif

// Collectible map tiles

#ifdef ENABLE_TILE_GET
    #ifdef PERSISTENT_TILE_GET
        extern unsigned char tile_got [];    // Buffer for current screen
    #endif
#endif

