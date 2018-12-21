.PHONY: clean 

CC = sdcc.exe
CFLAGS = -c -mz80 --peep-file lib/peep-rules.txt --peep-asm
SOURCES = engine/breakable.c engine/cocos.c engine/enengine.c engine/general.c engine/player.c engine/printer.c engine/propellers.c engine/tile_chac_chac.c lib/aPLib.c lib/PSGlib.c utils/delay.c utils/memfill.c utils/rand.c utils/unpacker.c utils/unrle.c game.c murcia.c

all: cart.sg

cart.sg: cart.ihx 
	../../../src/utils/ihx2sms.exe cart.ihx cart.sg

cart.ihx: rel/game.rel rel/utils/rand.rel rel/utils/delay.rel rel/utils/memfill.rel rel/utils/unpacker.rel rel/utils/unrle.rel rel/engine/propellers.rel rel/engine/tile_chac_chac.rel rel/engine/printer.rel rel/engine/general.rel rel/engine/breakable.rel rel/engine/player.rel rel/engine/cocos.rel rel/engine/enengine.rel rel/assets/enems0.rel rel/assets/enems1.rel rel/assets/map0.rel rel/assets/map1.rel rel/assets/tileset.rel rel/assets/spriteset.rel rel/assets/mscsg1000.rel rel/assets/msc_sfx.rel rel/murcia.rel lib/PSGlib.rel lib/SGlib.rel lib/aPLib.rel lib/crt0_sg.rel
	$(CC) -o cart.ihx -mz80 --no-std-crt0 --data-loc 0xC000 lib/crt0_sg.rel rel/game.rel rel/utils/rand.rel rel/utils/delay.rel rel/utils/memfill.rel rel/utils/unpacker.rel rel/utils/unrle.rel rel/engine/propellers.rel rel/engine/tile_chac_chac.rel rel/engine/printer.rel rel/engine/general.rel rel/engine/breakable.rel rel/engine/player.rel rel/engine/cocos.rel rel/engine/enengine.rel rel/assets/enems0.rel rel/assets/enems1.rel rel/assets/map0.rel rel/assets/map1.rel rel/assets/tileset.rel rel/assets/spriteset.rel rel/assets/mscsg1000.rel rel/assets/msc_sfx.rel rel/murcia.rel lib/PSGlib.rel lib/SGlib.rel lib/aPLib.rel

lib/crt0_sg.rel:  lib/crt0_sg.s
	sdasz80 -g -o lib/crt0_sg.rel lib/crt0_sg.s
	
lib/PSGlib.rel: lib/PSGlib.c
	$(CC) -c -mz80 --peep-file lib/peep-rules.txt lib/PSGlib.c -o lib/PSGlib.rel

lib/SGlib.rel: lib/SGlib.c
	$(CC) -c -mz80 --peep-file lib/peep-rules.txt lib/SGlib.c -o lib/SGlib.rel

lib/aPLib.rel: lib/aPLib.c
	$(CC) -c -mz80 --peep-file lib/peep-rules.txt lib/aPLib.c -o lib/aPLib.rel

rel/assets/enems0.rel: assets/enems0.c
	$(CC) $(CFLAGS) assets/enems0.c -o rel/assets/enems0.rel

rel/assets/enems1.rel: assets/enems1.c
	$(CC) $(CFLAGS) assets/enems1.c -o rel/assets/enems1.rel

rel/assets/map0.rel: assets/map0.c
	$(CC) $(CFLAGS) assets/map0.c -o rel/assets/map0.rel 

rel/assets/map1.rel: assets/map1.c
	$(CC) $(CFLAGS) assets/map1.c -o rel/assets/map1.rel 

rel/assets/tileset.rel: assets/tileset.c
	$(CC) $(CFLAGS) assets/tileset.c -o rel/assets/tileset.rel

rel/assets/spriteset.rel: assets/spriteset.c
	$(CC) $(CFLAGS) assets/spriteset.c -o rel/assets/spriteset.rel

rel/assets/mscsg1000.rel: assets/mscsg1000.c
	$(CC) $(CFLAGS) assets/mscsg1000.c -o rel/assets/mscsg1000.rel

rel/assets/msc_sfx.rel: assets/msc_sfx.c
	$(CC) $(CFLAGS) assets/msc_sfx.c -o rel/assets/msc_sfx.rel	

rel/murcia.rel: murcia.c
	$(CC) $(CFLAGS) murcia.c -o rel/murcia.rel

rel/utils/rand.rel: utils/rand.c
	$(CC) $(CFLAGS) utils/rand.c -o rel/utils/rand.rel

rel/utils/delay.rel: utils/delay.c
	$(CC) $(CFLAGS) utils/delay.c -o rel/utils/delay.rel

rel/utils/memfill.rel: utils/memfill.c
	$(CC) $(CFLAGS) utils/memfill.c -o rel/utils/memfill.rel

rel/utils/unpacker.rel: utils/unpacker.c
	$(CC) $(CFLAGS) utils/unpacker.c -o rel/utils/unpacker.rel

rel/utils/unrle.rel: utils/unrle.c
	$(CC) $(CFLAGS) utils/unrle.c -o rel/utils/unrle.rel

rel/engine/printer.rel: engine/printer.c
	$(CC) $(CFLAGS) engine/printer.c -o rel/engine/printer.rel

rel/engine/propellers.rel: engine/propellers.c
	$(CC) $(CFLAGS) engine/propellers.c -o rel/engine/propellers.rel

rel/engine/tile_chac_chac.rel: engine/tile_chac_chac.c
	$(CC) $(CFLAGS) engine/tile_chac_chac.c -o rel/engine/tile_chac_chac.rel

rel/engine/player.rel: engine/player.c
	$(CC) $(CFLAGS) engine/player.c -o rel/engine/player.rel

rel/engine/enengine.rel: engine/enengine.c
	$(CC) $(CFLAGS) engine/enengine.c -o rel/engine/enengine.rel

rel/engine/general.rel: engine/general.c
	$(CC) $(CFLAGS) engine/general.c -o rel/engine/general.rel

rel/engine/cocos.rel: engine/cocos.c
	$(CC) $(CFLAGS) engine/cocos.c -o rel/engine/cocos.rel

rel/engine/breakable.rel: engine/breakable.c
	$(CC) $(CFLAGS) engine/breakable.c -o rel/engine/breakable.rel

rel/game.rel: game.c
	$(CC) $(CFLAGS) game.c -o rel/game.rel 

depend:
	makedepend -o.rel -prel/ -- $(CFLAGS) -- $(SOURCES)

clean: 
	-rm -f rel/*.rel lib/*.rel rel/assets/*.rel rel/engine/*.rel rel/utils/*.rel cart.sg
# DO NOT DELETE

rel/engine/breakable.rel: lib/SGlib.h lib/PSGlib.h definitions.h config.h
rel/engine/breakable.rel: autodefs.h murcia.h my/extra_declarations.h
rel/engine/cocos.rel: lib/SGlib.h lib/PSGlib.h murcia.h definitions.h
rel/engine/cocos.rel: config.h autodefs.h my/extra_declarations.h
rel/engine/enengine.rel: lib/SGlib.h lib/PSGlib.h murcia.h definitions.h
rel/engine/enengine.rel: config.h autodefs.h my/extra_declarations.h
rel/engine/enengine.rel: ram/extern_globals.h engine/extern_precalcs.h
rel/engine/enengine.rel: engine/extern_metasprites.h utils/memfill.h
rel/engine/enengine.rel: utils/rand.h engine/player.h engine/general.h
rel/engine/enengine.rel: engine/cocos.h
rel/engine/general.rel: lib/SGlib.h lib/PSGlib.h definitions.h config.h
rel/engine/general.rel: autodefs.h my/extra_declarations.h
rel/engine/general.rel: ram/extern_globals.h engine/extern_precalcs.h
rel/engine/general.rel: engine/printer.h murcia.h
rel/engine/player.rel: lib/SGlib.h lib/PSGlib.h murcia.h definitions.h
rel/engine/player.rel: config.h autodefs.h my/extra_declarations.h
rel/engine/player.rel: ram/extern_globals.h engine/extern_precalcs.h
rel/engine/player.rel: engine/extern_metasprites.h utils/delay.h
rel/engine/player.rel: engine/printer.h engine/general.h engine/breakable.h
rel/engine/printer.rel: lib/SGlib.h definitions.h config.h autodefs.h
rel/engine/printer.rel: my/extra_declarations.h ram/extern_globals.h
rel/engine/printer.rel: engine/extern_precalcs.h utils/rand.h utils/memfill.h
rel/engine/printer.rel: utils/delay.h engine/propellers.h
rel/engine/printer.rel: engine/tile_chac_chac.h engine/printer.h
rel/engine/propellers.rel: lib/SGlib.h definitions.h config.h autodefs.h
rel/engine/propellers.rel: my/extra_declarations.h
rel/engine/tile_chac_chac.rel: lib/PSGlib.h murcia.h definitions.h config.h
rel/engine/tile_chac_chac.rel: autodefs.h my/extra_declarations.h
rel/lib/PSGlib.rel: lib/PSGlib.h
rel/utils/delay.rel: lib/SGlib.h
rel/utils/unpacker.rel: lib/aPLib.h lib/SGlib.h
rel/utils/unrle.rel: lib/SGlib.h ram/extern_globals.h
rel/game.rel: lib/SGlib.h lib/PSGlib.h lib/aPLib.h utils/rand.h utils/delay.h
rel/game.rel: utils/memfill.h utils/unpacker.h utils/unrle.h definitions.h
rel/game.rel: config.h autodefs.h my/extra_declarations.h murcia.h
rel/game.rel: assets/behs.h assets/map0.h assets/enems0.h assets/map1.h
rel/game.rel: assets/enems1.h assets/spriteset.h assets/tileset.h
rel/game.rel: assets/metasprites.h assets/custom_texts.h engine/prototypes.h
rel/game.rel: engine/printer.h engine/general.h my/extra_modules.h
rel/game.rel: engine/hotspots.h engine/player.h engine/enengine.h
rel/game.rel: engine/frame.h my/game_frame.h my/extra_hud_update.h my/pres.h
rel/game.rel: mainloop/flickscreen.h mainloop.h
