CC=sdcc.exe
CFLAGS=-c -mz80 --peep-file lib/peep-rules.txt --peep-asm

all: cart.sg

cart.sg: cart.ihx 
	../utils/ihx2sms.exe cart.ihx cart.sg

cart.ihx: rel/game.rel rel/rand.rel rel/delay.rel rel/enems0.rel rel/enems1.rel rel/enems2.rel rel/map0.rel rel/map1.rel rel/map2.rel rel/tileset.rel rel/spriteset.rel rel/murcia.rel lib/PSGlib.rel lib/SGlib.rel lib/aPLib.rel lib/crt0_sg.rel
	$(CC) -o cart.ihx -mz80 --no-std-crt0 --data-loc 0xC000 lib/crt0_sg.rel rel/game.rel rel/rand.rel rel/enems0.rel rel/enems1.rel rel/enems2.rel rel/map0.rel rel/map1.rel rel/map2.rel rel/tileset.rel rel/spriteset.rel rel/murcia.rel lib/PSGlib.rel lib/SGlib.rel lib/aPLib.rel

lib/PSGlib.rel: lib/PSGlib.c
	$(CC) -c -mz80 --peep-file lib/peep-rules.txt lib/PSGlib.c -o lib/PSGlib.rel

lib/SGlib.rel: lib/SGlib.c
	$(CC) -c -mz80 --peep-file lib/peep-rules.txt lib/SGlib.c -o lib/SGlib.rel

lib/aPLib.rel: lib/aPLib.c
	$(CC) -c -mz80 --peep-file lib/peep-rules.txt lib/aPLib.c -o lib/aPLib.rel

lib/crt0_sg.rel:  lib/crt0_sg.s
	sdasz80 -g -o lib/crt0_sg.rel lib/crt0_sg.s

rel/enems0.rel: assets/enems0.c
	$(CC) $(CFLAGS) assets/enems0.c -o rel/enems0.rel

rel/enems1.rel: assets/enems1.c
	$(CC) $(CFLAGS) assets/enems1.c -o rel/enems1.rel

rel/enems2.rel: assets/enems2.c
	$(CC) $(CFLAGS) assets/enems2.c -o rel/enems2.rel 

rel/map0.rel: assets/map0.c
	$(CC) $(CFLAGS) assets/map0.c -o rel/map0.rel 

rel/map1.rel: assets/map1.c
	$(CC) $(CFLAGS) assets/map1.c -o rel/map1.rel 

rel/map2.rel: assets/map2.c
	$(CC) $(CFLAGS) assets/map2.c -o rel/map2.rel

rel/tileset.rel: assets/tileset.c
	$(CC) $(CFLAGS) assets/tileset.c -o rel/tileset.rel

rel/spriteset.rel: assets/spriteset.c
	$(CC) $(CFLAGS) assets/spriteset.c -o rel/spriteset.rel

rel/murcia.rel: murcia.c
	$(CC) $(CFLAGS) murcia.c -o rel/murcia.rel

rel/rand.rel: utils/rand.c
	$(CC) $(CFLAGS) utils/rand.c -o rel/rand.rel

rel/delay.rel: utils/delay.c
	$(CC) $(CFLAGS) utils/delay.c -o rel/delay.rel

rel/game.rel: game.c
	$(CC) $(CFLAGS) void.c -o rel/game.rel 

