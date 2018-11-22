# AGSG1000 Requirements

Or better said, things which are different from AGNES 1.0 (note that this is a port of AGNES 1.0 and may not be updated).

- Initially, sprites are 16x16, or layer or two-layer (defined as metasprites).
- Except for projectiles, which are one-layer (defined as pattern offsets in the sprite pattern table).
- ~~No support for complex breakable tiles (with several shoots per tile).~~ 
- ~~No support for persistent tile get~~.
- ~~No support for persistent enemies~~.

### TODO:

Checked [X] is no longer "TODO".

- [X] Reimplement `PERSISTENT_ENEMS`. Use space in VRAM @ $1B80 ($480 bytes!)
- [X] Implement `PERSISTENT_TILE_GET`. Use space in VRAM @ $1B80 ($480 bytes!)
- [X] Implement complex breakables using space in VRAM @ $1B80 ($480 bytes!)
- [ ] Using metasprites (for constructions bigger than 16x16).

# General changes in config.h AGNES->AGSG1000

- Generally, substitute this block

```c
    //#define GAME_AREA_TOP
    //#define GAME_AREA_MIDDLE
    //#define GAME_AREA_BOTTOM
    #define GAME_AREA_CUSTOM
```

with

```c
    // For a topmost two-lines status bar

    #define TOP_ADJUST              1       
    #define SPRITE_ADJUST           -9
```

- Rename constant, `SHINES_PALETTE` becomes `SHINES_COLOUR`

- Resonators no longer have a sprite-based counter, but a hud-based counter instead. So substitute this block

```c
    #define RESONATOR_BASE_PATTERN          0
    #define RESONATOR_PALETTE               3
    #define RESONATOR_COUNTER_OFFS_X        4
    #define RESONATOR_COUNTER_OFFS_Y        7
```

with

```c
    #define RESONATOR_COUNTER_X             29
    #define RESONATOR_COUNTER_Y             1
```

- Rename constant, `COCO_PALETTE` becomes `COCO_COLOUR`

- Rename constant, `BULLET_PALETTE` becomes `BULLET_COLOUR`

- Change `SFX_*` block from

```c
    #define SFX_START               0
    #define SFX_TILE                1
    #define SFX_OBJECT              2
    #define SFX_USE                 3
    #define SFX_TRAMPOLINE          3
    #define SFX_PHIT                4
    #define SFX_DUMMY1              5
    #define SFX_ENHIT               6
    #define SFX_DUMMY2              7
    #define SFX_JUMP                8
    #define SFX_BULLET              9
    #define SFX_COCO                10
    #define SFX_SPRING              11
    #define SFX_COUNT               12
    #define SFX_BREAKH              13
    #define SFX_HITTER              14
    #define SFX_STEPON              15
    #define SFX_FLOAT               16
    #define SFX_BREAKB              17
    #define SFX_RING                18
    #define SFX_FANFARE             19
```

with 

```c
    #define SFX_START               s_00_start2_psg
    #define SFX_TILE                s_01_tile3_psg
    #define SFX_OBJECT              s_02_object2_psg
    #define SFX_USE                 s_03_use2_psg
    #define SFX_TRAMPOLINE          s_04_trampoline2_psg
    #define SFX_PHIT                s_05_phit3_psg
    #define SFX_DUMMY1              s_06_dummy13_psg
    #define SFX_ENHIT               s_05_phit3_psg
    #define SFX_DUMMY2              s_07_dummy22_psg
    #define SFX_JUMP                s_08_jump2_psg
    #define SFX_BULLET              s_09_bullet2_psg
    #define SFX_COCO                s_10_coco2_psg
    #define SFX_SPRING              s_11_spring2_psg
    #define SFX_COUNT               s_12_count2_psg
    #define SFX_BREAKH              s_13_breakh3_psg
    #define SFX_HITTER              s_14_hitter3_psg
    #define SFX_STEPON              s_15_stepon3_psg
    #define SFX_FLOAT               s_16_float3_psg
    #define SFX_BREAKB              s_17_breakb3_psg
    #define SFX_RING                s_18_ring2_psg
    #define SFX_FANFARE             s_19_fanfare2_psg
```

