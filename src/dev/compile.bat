@echo off
make
del *.asm > nul 2> nul
del *.lst > nul 2> nul
del *.sym > nul 2> nul
del *.lk > nul 2> nul
rem del *.map > nul 2> nul
del *.noi > nul 2> nul
del *.ihx > nul 2> nul
del lib\*.asm > nul 2> nul
del lib\*.lst > nul 2> nul
del lib\*.sym > nul 2> nul
del rel\*.asm > nul 2> nul
del rel\*.lst > nul 2> nul
del rel\*.sym > nul 2> nul
del rel\assets\*.asm > nul 2> nul
del rel\assets\*.lst > nul 2> nul
del rel\assets\*.sym > nul 2> nul
del rel\engine\*.asm > nul 2> nul
del rel\engine\*.lst > nul 2> nul
del rel\engine\*.sym > nul 2> nul
del rel\utils\*.asm > nul 2> nul
del rel\utils\*.lst > nul 2> nul
del rel\utils\*.sym > nul 2> nul
