@echo off
cd ..\script
..\..\..\src\utils\mscmk1.exe script.spt ..\dev\assets\mscsg1000.c 20 sg1000
cd ..\dev
make
rem del *.asm /a /s > nul 2> nul
del *.lst /a /s > nul 2> nul
del *.sym /a /s > nul 2> nul
del *.lk /a /s > nul 2> nul
rem del *.map > nul 2> nul
del *.noi /a /s > nul 2> nul
del *.ihx /a /s > nul 2> nul

