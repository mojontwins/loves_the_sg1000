// SG-1000 MK1 v0.3
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Avoid parameters using these in critical functions.

unsigned char _x, _y, _n, _t;

// General, all-purpose variables

unsigned char pad0;                     // (sglib) pad 0 read.
unsigned char pad_this_frame;           // (sglib) pad 0 read, current frame presses.
unsigned char gpit, gpjt;               // General purpose iterators.
signed int rds16;                       // General purpose 16 bit signed variable.

const unsigned char *gp_gen;            // General purpose pointer to read data in ROM.
const unsigned char *gp_tmap;           // Pointers used to read map data in ROM.
unsigned char *gp_ram;                  // General purpose pointers to read / write data in RAM.
unsigned int gp_addr;                   // General purpose address, used for PPU addresses.
unsigned char rdx, rdy;                 // General purpose coordinates
unsigned char rdt;                      // General purpose "type"
unsigned char rdit;                     // General purpose iterator
unsigned char rda, rdb, rdc, rdd, rdm;  // General purpose temporal value holders.
signed char rds;                        // General purpose temporal value holder, signed.
unsigned char rdct;                     // General purpose counter
unsigned char ticker;                   // Ticker. 0 for a frame every second.

// Used for two-points collision

unsigned char at1, at2;                 // Temporally store tile attributes at the checked collision points
unsigned char cx1, cx2;                 // Check those collision points, X coordinates.
unsigned char cy1, cy2;                 // Check those collision points, Y coordinates.
unsigned char caux;                     // Auxiliar variable

#if PLAYER_COLLISION_VSTRETCH_BG > 0
    unsigned char cy3, at3;             // If player collision box is > 16 pixels, a third point is used
#endif

// Sprite related (neslib)

unsigned char *cur_stp;                 // Copy of the (Internal) pointer to the SAT copy

// Enemies

unsigned char en_initial;               // First enemy to process in current screen, current frame (cycles 0, 1, 2, ...)
unsigned char en_offs;                  // Precalculated value: n_pant * 3; used to index data related to enemy persistence

unsigned char en_fr;                    // (Temporal) enemies frame number
unsigned char en_collx, en_colly;       // (Temporal) collision flags
unsigned char en_spr;                   // Current enemy sprite index
unsigned char touched;                  // (Temporal) an enemy collided with the player
unsigned char en_is_alive;              // (Temporal) current enemy is alive, used when enemies respawning is on.
unsigned char pregotten;                // (Temporal) player <-> current enemy horizontal overlap flag.

#ifdef ENEMS_RECOIL_ON_HIT
    signed char en_rmx [3];             // If recoiling, recoil direction in the X axis.
    #ifdef PLAYER_TOP_DOWN
        signed char en_rmy [3];         // If recoiling, recoil direction in the Y axis.
    #endif
#endif

#ifdef ENABLE_COMPILED_ENEMS
    const unsigned char *en_behptr [3]; // A pointer to curren enemy script for compiled enemies.
#endif

// Those variables are used as temporal copies of general arrays 

unsigned char _en_t, _en_s;
unsigned char _en_x, _en_y;
unsigned char _en_x1, _en_y1, _en_x2, _en_y2;
signed char _en_mx, _en_my;
unsigned char _en_ct, _en_facing, _en_state;
signed int _enf_x, _enf_y, _enf_vx, _enf_vy;

// Signals, all purpose, for enemies

volatile unsigned char en_sg_1, en_sg_2;

// Main player

unsigned char vertical_engine_type;     // Player engine type. Se ENGINE_TYPE_* constants in definitions.h
signed int px, py;                      // Player X, Y coordinates, fixed point 10.6
signed int pvx, pvy;                    // Player VX, VY velocities, fixed point 10.6
unsigned char prx, pry;                 // Player pixel coordinates, calculated from px, py.
unsigned char pcx, pcy;                 // Coordinates prior to movement.
unsigned char pfacing;                  // Player facing left, right
unsigned char pfr;                      // Player frame
unsigned char psprid;                   // Player sprite ID set in my/player_frame_selector.h
unsigned char a_button, b_button;       // True if A or B have been pressed *this* frame, respectively

#ifdef PLAYER_TOP_DOWN
    unsigned char pfacinghlast;         // Last horizontal direction registered
#endif

unsigned char pj;                       // "Player is jumping" flag
unsigned char pjb;                      // "Player is pressing JUMP button"
unsigned char pctj;                     // "Player is jumping" counter
unsigned char pgotten;                  // "Player is on moving platform or similiar" flag
unsigned char ppossee;                  // "Player is on walkable scenery" flag
unsigned char oppossee;                 // Same, but prev. frame
unsigned char pflickering;              // "Player is flickering", also a frame counter.
unsigned char pbouncing;                // "Player is bouncing", also a frame counter.
unsigned char phit;                     // "Player was hit by killing tile" flag
signed int pgtmx, pgtmy;                // X, Y components of velocity in "player is being moved by external entity" conditions

#if defined (ENABLE_EASY_OBJECTS) || defined (ENABLE_ONLY_ONE_OBJECT)
    unsigned char pinv, opinv;          // Player inventory (which object is being carried) & last frame copy.
#endif

#ifdef ENABLE_LADDERS
    unsigned char ponladder;            // True if player is on a ladder.
    unsigned char phalfladder;          // True if player's feet are on a ladder.
    unsigned char ponladderctr;         // Counter used for animation when player is on ladders in my/player_frame_selector.h
#endif

#ifdef ENABLE_TRAMPOLINES
    unsigned char ptrampoline;          // "Player got propelled by a trampoline" flag
#endif

#ifdef PLAYER_SPINS 
    unsigned char pspin;                // "Player is spinning" flag
#endif  

#ifdef PLAYER_TOP_DOWN
    unsigned char pfacingv, pfacingh;   // Player facing variables in each axis for top-down games
#endif

unsigned char hitv, hith;               // True if the player collided with a killing tile vertically or horizontally

#ifdef PLAYER_CAN_FLOAT
    unsigned char pfloating;            // Player is floating (for example, when on a propeller)
#endif

unsigned char prx_old, pry_old;

unsigned char pkill;                    // Set to 1 to kill player
unsigned char pice;                     // Player is walking on ice
unsigned char pnotsafe;                 // Player is walking a non safe (for example, breakable) tile 

unsigned char pcontinues;               // Number of continues
unsigned char plife;                    // Player life gauge
#ifndef DEACTIVATE_KEYS
    unsigned char pkeys;                // Player # of collected keys
#endif
unsigned char pobjs;                    // Player # of collected (collectible) items
unsigned char pammo;                    // Player ammo
#if defined (ENEMS_MAY_DIE)
    unsigned char pkilled;              // Player # of killed enemies
#endif

unsigned char pfiring;                  // Flag to control actions spawned by the B button

#ifdef DIE_AND_RESPAWN
    unsigned char n_pant_safe;
    signed int px_safe, py_safe;        // Screen (room) number and coordinates to respawn player
#endif

#ifdef PLAYER_PUNCHES
    unsigned char ppunching;            // "Player is punching" flag
#endif

#ifdef PLAYER_KICKS
    unsigned char pkicking;             // "Player is kicking" flag
#endif

#if defined (PLAYER_PUNCHES) || defined (PLAYER_KICKS)
    unsigned char phitterx, phittery;   // If player is punching or kicking, hitbox coordinates
    unsigned char phitteract;           // True if hitbox is active
    unsigned char pfrozen;              // != 0 if player is frozen (after landing a hit). Invalidate input & decrement
#endif

// Bullets

#ifdef PLAYER_CAN_FIRE
    unsigned char bi;                   // Iterator for player bullets (projectiles shot by the player)
#endif

// Cocos

#ifdef ENABLE_COCOS
    unsigned char coco_it;              // Iterator for cocos (projectiles shot by enemies)
#endif

// Hotspots
unsigned char hrx, hry, hrt;            // Current screen hotspot X, Y coordinates and type, respectively

// Process breakable?
#ifdef BREAKABLE_ANIM
    unsigned char do_process_breakable; // There's animation of tiles breaking, check next frame.
#endif

unsigned char ft;                       // "This is the first time rendering a screen" flag, 
                                        // used internally to control fading in/out of rooms

// Current level

unsigned char c_map_w;                  // Map width for current level
unsigned char c_map_h;                  // Map height for current level
unsigned char c_map_size;               // Map size for current level

const unsigned char *c_ts_tmaps;        // Pointer to metatile tilemaps array
const unsigned char *c_behs;            // Pointer to metatile behaviours (attributes) array

const unsigned char * const *spr_enems; // Pointer to metasprite array for enemies

// Pointer to current map, several formats:

#ifdef MAP_FORMAT_PACKED
    const unsigned char *c_map;         
#endif
#if defined (MAP_FORMAT_RLE16) || defined (MAP_FORMAT_RLE53) || defined (MAP_FORMAT_RLE44)
    const unsigned char * const *c_map;
#endif
#if defined (MAP_FORMAT_RLE53_CHRROM) || defined (MAP_FORMAT_RLE44_CHRROM)
    const unsigned int *c_map;
    unsigned char c_map_chr_rom_bank;
#endif
    
// Pointer to decorations, several formats:

#ifdef MAP_WITH_DECORATIONS
    #if defined (MAP_FORMAT_RLE16) || defined (MAP_FORMAT_PACKED)
        const unsigned char * const *c_decos;
    #else
        unsigned char c_decos;
    #endif
#endif

const unsigned char *c_locks;           // Pointer to current level list of locks in ROM

// Pointers to enemies & hotspots data structures, different formats (CHR-ROM or PRG-ROM based)

#ifdef ENEMS_IN_CHRROM
    unsigned int c_enems;
    unsigned int c_hotspots;
#else
    const unsigned char *c_enems;
    const unsigned char *c_hotspots;
#endif

unsigned char c_max_bolts;              // Number of locks in current level

// Scripting system interpreter internal variables.

#ifdef ACTIVATE_SCRIPTING
    unsigned char sc_x, sc_y, sc_n, sc_c;
    unsigned char *next_script;
    unsigned char *script;
    unsigned char script_result, sc_terminado, sc_continuar;
#endif
    
// NTSC system

unsigned char ntsc, ntsc_frame;

// Update list (neslib)

#define UPDATE_LIST_SIZE 32
unsigned char update_index;
unsigned char update_list [UPDATE_LIST_SIZE * 3];

// Fader (neslib)

signed char fader;                      // Brightness level
unsigned char fade_delay;               // # of frames per brightness level in fades

// Current screen

#ifndef SG1000
    unsigned char map_attr [192];       // Current screen (room) tile behaviours
#endif    
unsigned char map_buff [192];           // Current screen (room) tile numbers

// Game flow

unsigned char first_game;               // True if it's the first time the game runs

unsigned char level;                    // Current level number

unsigned char c_max_enems;              // Number of killable enems. in current level.

unsigned char n_pant;                   // Current screen (room) number.
unsigned char on_pant;                  // Current screen (room) numberm last frame value (used to detect changes)

unsigned char half_life;                // 1-0 flip flop (each game frame)
unsigned char frame_counter;            // Game grame counter, wraps 255->0

unsigned char paused;                   // True if the game is paused.
unsigned char win_level;                // If WIN_LEVEL_CUSTOM is defined, set to true to win the level.
unsigned char game_over;                // True if the player lost the game.
unsigned char warp_to_level;            // True if the player is jumping to a different level 
unsigned char level_reset;              // True if the level should be reset.
unsigned char flick_override;           // If set, code to flick screen is overriden for current frame

// General player values, last frame copies

unsigned char olife;                    // Player life, last frame value (used to detect changes)
unsigned char okeys;                    // Player keys, last frame value (used to detect changes)
unsigned char oobjs;                    // Player items, last frame value (used to detect changes) 
unsigned char oammo;                    // Player ammo, last frame value (used to detect changes)
unsigned char okilled;                  // Player # of killed enems., last frame value (used to detect changes)

unsigned char oam_index_player;         // Index copy

// Custom hotspot type star (used as an extra collectible).

#ifdef HOTSPOT_TYPE_STAR
    unsigned char pstars;               // Player # of collected stars
    unsigned char opstars;              // Player # of collected stars, last frame value (used to detect changes) 
#endif
    
// Player "use" animation values.

#ifdef ENABLE_USE_ANIM
    unsigned char use_ct;               // General counter, serves as a state indicator.
    unsigned char use_sub_ct;           // Subcounter.
    #ifdef ACTIVATE_SCRIPTING
        unsigned char run_fire_script_do;   
                                        // If true, the PRESS_FIRE scripts should be run.
    #endif
    unsigned char use_type;             // Action type. May be USE_TYPE_HOTSPOT, USE_TYPE_INTERACTIVE or USE_TYPE_SCRIPTING
#endif

// A small sprite showing a text balloon with the NO! word,
// Of course, may be repurposed for other uses.

#ifdef ENABLE_NO
    unsigned char no_ct;                // General counter. When != 0, display sprite & decrement.
#endif

// Bullets (projectiles shot by the player)

#ifdef PLAYER_CAN_FIRE
    unsigned char b_slots [MAX_BULLETS];
    unsigned char b_slots_i;            // Array of free slots for active bullets & index.

    unsigned char bst [MAX_BULLETS];    // Bullets states
    
    unsigned char bx [MAX_BULLETS];     // Bullets, X coordinates.
    unsigned char by [MAX_BULLETS];     // Bullets, Y coordinates.
    signed char bmx [MAX_BULLETS];      // Bullets, direction + speed in the X axis.
    signed char bmy [MAX_BULLETS];      // Bullets, direction + speed in the Y axis.

    #ifdef PLAYER_CHARGE_AND_FIRE
        unsigned char pfiregauge;       // Fire gauge 
        unsigned char opfiregauge;      // Fire gauge, last frame value (used to detect changes)
    #endif

    #ifdef PLAYER_FIRE_RELOAD
        unsigned char pfirereload;      // Reload time. When != 0, block B_BUTTON & decrement.
    #endif  
#endif

unsigned char pctfr;                    // Frame subcounter        

// Cocos (projectiles shot by enemies)

#ifdef ENABLE_COCOS
    unsigned char coco_slots [COCOS_MAX];
    unsigned char coco_slots_i;         // Array of free slots for active cocos & index.

    unsigned char coco_on [COCOS_MAX];  // Cocos states
    
    signed int coco_x [COCOS_MAX];      // Cocos, X coordinates (fixed point 10.6)
    signed int coco_y [COCOS_MAX];      // Cocos, Y coordinates (fixed point 10.6)
    signed int coco_vx [COCOS_MAX];     // Cocos, direction + speed in the X axis.
    signed int coco_vy [COCOS_MAX];     // Cocos, direction + speed in the Y axis.
#endif  

// Breakable walls

#ifdef ENABLE_BREAKABLE
    #ifdef BREAKABLE_ANIM
        unsigned char brkf [BREAKABLE_MAX];
        unsigned char brkx [BREAKABLE_MAX];
        unsigned char brky [BREAKABLE_MAX];
                                        // List of tiles to update when BREAKABLE_ANIM is set
    #endif
    unsigned char pmayneedrelocation;   // If 1, check if the coordinates to respawn the player are safe, relocate if not.
#endif

// Hotspots

#if defined (HOTSPOTS_DYNAMIC) || defined (ENEMS_IN_CHRROM)       
                                        // If HOTSPOTS_DYNAMIC is defined, hotspots are copied to RAM and may be modified
                                        // Otherwise they are read from ROM when entering each screen.
    unsigned char hyx [MAP_SIZE];       // Hotspot position per screen (room), packed 0xYX
    unsigned char ht [MAP_SIZE];        // Hotspot type per screen (room)
#endif

unsigned char hact [MAP_SIZE];          // Hotspots active per screen (room)

// Bolts (locks, unlockable with keys)

#ifndef DEACTIVATE_KEYS
    unsigned char lkact [MAX_BOLTS];    // If lkact [N], lock #N is "locked"
#endif

// Scripting system

#ifdef ACTIVATE_SCRIPTING
    void msc_clear_flags (void);
    void run_script (unsigned char whichs);

    #if defined (ENABLE_FIRE_ZONE) || defined (ENABLE_FAST_FIRE_ZONE)
        unsigned char f_zone_ac;        // "Fire zone" is active in current screen (room)
        unsigned char fzx1;
        unsigned char fzx2;
        unsigned char fzy1;
        unsigned char fzy2;             // Coordinates of the "fire zone" rectangle's opposite corners.
    #endif

    #if defined (ENABLE_PUSHED_SCRIPT)
        unsigned char just_pushed;      // True if a pushable has just been pushed. Used by the interpreter.
    #endif

    unsigned char fire_script_success;  // True if the command section of a clausule in a PRESS_FIRE script was run.

    #if defined (ENABLE_INTERACTIVES)
        unsigned char just_interacted;  // True if the player just interacted. Used by the interpreter.
        unsigned char script_arg;       // Identifier of the interactive the used interacted with. Used by the interpreter.
    #endif
#endif

// Flags

unsigned char flags [MAX_FLAGS];        // Array of flags used by interactives, the scripting system, etc.

// Interactives

#ifdef ENABLE_INTERACTIVES
    unsigned char interactives_interact_with;
                                        // The player pressed B on which interactive?
    unsigned char interactives_index;
                                        // Index of active interactives on current screen (room) (when creating),
                                        // Number of active interactives (in the game loop)
    unsigned char interactives_f [INTERACTIVES_MAX];
                                        // Flag bound to the interactive | 0x80 (if container) or sprite number (if sprite).
                                        // If this value & 0x80 => container. Sprite otherwise.
    unsigned char interactives_yx [INTERACTIVES_MAX];
    #ifdef INTERACTIVES_FROM_CODE
        const unsigned char *c_interactives;
                                        // Pointer to current level's interactive definitions array
    #endif
#endif

// More globals for baddies (for current screen)

unsigned char en_t [3];                 // Enemy types.

unsigned char en_x [3];                 // Enemy X coordinates.
unsigned char en_y [3];                 // Enemy Y coordinates.

unsigned char en_x1 [3];
unsigned char en_y1 [3];                // Enemy starting point coordinates (for patrollers, repurposed for other types)

unsigned char en_x2 [3];
unsigned char en_y2 [3];                // Enemy ending point coordinates (for patrollers, repurposed for other types)

signed char en_mx [3];                  // Enemy direction + speed in the X axis.
signed char en_my [3];                  // Enemy direction + speed in the Y axis.

unsigned char en_s [3];                 // Enemy base sprite index in spr_enems.
unsigned char en_facing [3];            // Generally, 0 = facing right, 4 = facing left.

unsigned char en_state [3];             // Enemy State
unsigned char en_flags [3];             // Enemies flags

unsigned char en_cttouched [3];         // Counters used to show explosions / flickering
unsigned char en_life [3];              // Enemies life gauges
unsigned char en_status [3];            // Enemies statused, repurposed per enemy type
unsigned char en_ct [3];                // Enemies General repurposeable counter

#if defined (ENABLE_COMPILED_ENEMS) || defined ENABLE_PURSUERS
    unsigned char en_rawv [3];           // Speed, used for pursuer-type enemies
#endif

unsigned char en_spr_x_mod;             // Modifier to X position of sprite (for effects)

#ifdef ENEMS_CAN_RESPAWN
    unsigned char en_respawn [3];       // If true, enems can respawn.
    unsigned char en_resx [3];
    unsigned char en_resy [3];          // Respawn coordinates.
    signed char en_resmx [3];
    signed char en_resmy [3];           // Respawn mx, my.
#endif

// Fixed point variables (coordiantes, velocity) for some kinds of enemies.

#ifdef ENEMS_NEED_FP
    signed int enf_x [3];
    signed int enf_vx [3];
    signed int enf_y [3];
    signed int enf_vy [3];
#endif

// Generator for PURSUER type enemies.

#ifdef ENABLE_GENERATORS
    unsigned char en_generator_life [3];
                                        // Generators life gauge.
    unsigned char gen_was_hit [3];      // True if generator was hit.
#endif

unsigned char en_spr_id [3];

// Temporal invincibility

#ifdef ENEMS_INVINCIBILITY
    unsigned char en_invincible [3];
#endif

// Persistent deaths (death enemies stay dead in current level)

#ifdef PERSISTENT_DEATHS
    unsigned char ep_dead [3 * MAP_SIZE];
                                        // Buffer for dead enemies (true if dead).
#endif

// Propellers

#ifdef ENABLE_PROPELLERS
    unsigned char prp_idx;              // Index of active propellers on current screen (room) (when creating)
                                        // Number of active propellers on current screen (room) (in the game loop)
    unsigned char prp_yx [PROPELLERS_MAX];
                                        // Coordinates of active propellers, packed 0xYX
    unsigned char propellers_on;        // Propellers are on (animate & affect player)
#endif

// Shines

#ifdef ENABLE_SHINES
    unsigned char max_shines;           // Index of active shines on current screen (room) (when creating)
                                        // Number of active shines on current screen (room) (in the game loop)

    unsigned char shines [SHINES_MAX];  // Coordinates of active shines, packed 0xYX

    unsigned char shine_active_x;
    unsigned char shine_active_y;       // Animating shine X and Y coordinates.
    unsigned char shine_active_ct;      // Animation frame counter. 
#endif

// Tile Chac Chacs

#ifdef ENABLE_TILE_CHAC_CHAC
    unsigned char max_chac_chacs;       // Index of active chac-chac blades on current screen (room) (when creating)
                                        // Number of active chac-chac blades on current screen (room) (in the game loop)
    unsigned char chac_chacs_yx [MAX_CHAC_CHACS];
                                        // Coordinates of active chac-chac blades, packed 0xYX
    unsigned char chac_chacs_state [MAX_CHAC_CHACS];
                                        // States of active chac-chac blades
    unsigned char chac_chacs_idlewait [MAX_CHAC_CHACS];
                                        // # of frames to wait in state 0 (idle)
    unsigned char chac_chacs_ct [MAX_CHAC_CHACS];
                                        // Frame counters
    
    // Those are used to implement a "update queue" to send changes to VRAM.
    // Changes are sent "one entity per frame", therefore this queue is needed.
    unsigned char chac_chacs_queue [MAX_CHAC_CHACKS_QUEUED];
    unsigned char chac_chacs_queue_read, chac_chacs_queue_write;
#endif

// Resonators

#ifdef ENABLE_RESONATORS
    unsigned char res_disable;          // If true, resonators don't work (but show!)
    unsigned char res_on;               // Resonators are "on" (player pressed one)
    unsigned char res_ct;               // This holds resonators' count down
    unsigned char res_subct;            // Frame counter for each "tick"
#endif

// More conveyors

#ifdef ENABLE_CONVEYORS
    signed char cfx;                    // Auxiliary variable, copy of the added speed when the player is on a conveyor,
                                        // used to detect if the player is pushed out of the screen while on a conveyor belt.
#endif

// Timer

#ifdef ENABLE_TIMER
    unsigned char timer;                // Timer, current value.
    unsigned char otimer;               // Timer, current value, last frame (to detect changes).
    unsigned char timer_frames;         // Timer, frame counter for each "ticke"
    unsigned char timer_zero;           // Set to true when timer == 0; must be reset manually!
    unsigned char timer_on;             // If true, timer is running.
#endif

// Springs

#ifdef ENABLE_SPRINGS
    unsigned char springs_on;           // Springs are ON, level-wide setting.
#endif

// Shaker

#ifdef ENABLE_SHAKER
    unsigned char shaker_ct;            // If != 0, shake the screen & decrement.
#endif

// Collectible map tiles

#ifdef ENABLE_TILE_GET
    #ifdef PERSISTENT_TILE_GET
        unsigned char tile_got [24];    // Buffer for current screen
    #endif
#endif

#include "../my/extra_vars.h"           // Custom extra variables
