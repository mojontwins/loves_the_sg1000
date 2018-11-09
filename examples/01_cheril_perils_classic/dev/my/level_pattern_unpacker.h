// Unpack your patterns here

unpack_bg_patterns (l_ts_patterns [level], l_ts_colours [level], 64*8, 7);
aPLib_depack_VRAM (SGT_BASE + 160*8, l_spr_patterns [level]);
