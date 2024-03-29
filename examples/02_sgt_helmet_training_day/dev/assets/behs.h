// SG-1000 MK1 v0.2
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Tile behaviours

// Add these:
// + 1 kills      (useless if + 8 obstacle)
// + 4 platform   (side view)
// + 8 obstacle   (nullifies + 1 & + 2, see bellow)
// +16 breakable
// +32 conveyor   (pushes left, + 1 pushes right)
// +64 slippery

// Special values (= nonsensical combinations):
//  2 quicksands ( " , needs ENABLE_QUICKSANDS)
//  9 not safe block (safe spot not saved when jumping off this)
// 10 lock
// 11 pushable
// 32 ladder   (== 32, no obstacle!)
// 34 tile_get (== 34, no obstacle!)
// 64 float    (== 64, no obstacle!)
// 74 trampol. (== 74,    obstacle!)

const unsigned char behs0 [] = {
	0, 0, 4, 8, 8, 8, 8, 4,17, 4, 8, 8, 8, 8,11,10,
	8, 8, 8, 8, 8, 8, 4, 4, 8, 0, 0, 0, 1, 0, 0, 0
};

// behs1 = behs0

const unsigned char behs2 [] = {
	0, 8, 0, 4, 1, 4, 8, 4,17, 4, 8, 8, 8, 8,11,10,
	8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 1, 0, 0, 0
};

// 68 = 4 + 64, slippery platform
// 24 = 8 + 16, breakable obstacle
// 40 = 8 + 32, conveyor platform, pushes left.
