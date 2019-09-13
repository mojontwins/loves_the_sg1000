@echo off
..\..\..\..\environment\sdcc-sg1000\bin\sdcc -c -mz80 --peep-file peep-rules.txt SGlib.c
..\..\..\..\environment\sdcc-sg1000\bin\sdcc -c -mz80 --peep-file peep-rules.txt PSGlib.c
..\..\..\..\environment\sdcc-sg1000\bin\sdcc -c -mz80 --peep-file peep-rules.txt aPLib.c
..\..\..\..\environment\sdcc-sg1000\bin\sdasz80 -g -o crt0_sg.s
del *.asm > nul
del *.lst > nul
del *.sym > nul
