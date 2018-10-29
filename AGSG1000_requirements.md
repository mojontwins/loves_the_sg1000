# AGSG1000 Requirements

Or better said, things which are different from AGNES 1.0 (note that this is a port of AGNES 1.0 and may not be updated).

- Initially, sprites are 16x16, two-layer.
- Except for projectiles, which are one-layer.
- No support for persistent enemies.
- No support for complex breakable tiles (with several shoots per tile).


TODO:

- Reimplement `PERSISTENT_ENEMS`. Use space in VRAM @ $1B80 ($480 bytes!)
- Implement `PERSISTENT_TILE_GET`. Use space in VRAM @ $1B80 ($480 bytes!)

