@echo off
sdcc -c -mz80 --peep-file peep-rules.txt SGlib.c
sdcc -c -mz80 --peep-file peep-rules.txt PSGlib.c
sdcc -c -mz80 --peep-file peep-rules.txt aPLib.c
sdasz80 -g -o crt0_sg.s
del *.asm > nul
del *.lst > nul
del *.sym > nul
