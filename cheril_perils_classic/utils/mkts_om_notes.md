# `mkts_om_notes.md`

Notes about the implementation of the SG-1000 platform in `mkts_om`. 

## General stuff

I'm adding methods to output tilemaps and metasprites to a .h file. First of all you

```
	mapfile file.h
```

Then you can

```
	write tmaps ts0
	write metasprites ss_player
```

Specifying the label name for the C array generated.

Also you can

```
	reset metasprites
```

You may have to reset patterns

```
	reset patterns
```

But they go to the main bin!

Also

```
	set patterns n
	set tmaps n
	set metasprites n
```

By the way

```
	output patterns file_bitmaps file_colours
	write patterns label_bitmaps label_colours
```

And (needs apack.exe!)

```
	output patterns file_bitmaps file_colours packed
	write patterns label_bitmaps label_colours packed
```

## Pattern format

The pattern () arrays are 16 bytes big, containing 8 bytes of bitmap and 8 bytes of colour map, not interleaved.

Helper functions to extract a pattern are:

- `TMS9918GetAttr (x0, y0, img, c1, c2)` returns the byte attribute of the 8 pixels line from x0, y0.
- `TMS9918GetBitmapFrom (x0, y0, c1, img)` returns the byte containing the bitmap of the 8 pixels line from x0, y0. Needs c1, which is one of the colours extracted by `TMS9918GetAttr`

`extractPatternFrom (x0, y0, img, pattern (), attr)` will fill the 16 bytes array `pattern` with the bitmap and colour contents of the 8x8 pixels square at x0, y0 (pixel coordinates). `attr` makes no sense for this platform.

Patterns are split into `mainBin` and `colourBin` using two self-explanatory subs:

- `copyFirstBytesOfArrayToMainBin (pattern (), bytes)`
- `copyArrayToColourBinFrom (pattern (), from)`

## Sprite format

Metasprites are gridded maps of 16x16 chunks of stacked sprites (one per found colour). Metasprite format is thus a collection of 4 bytes chunks, each chunk being:

```
	yOffset
	xOffset
	patterOffset
	colour
```

