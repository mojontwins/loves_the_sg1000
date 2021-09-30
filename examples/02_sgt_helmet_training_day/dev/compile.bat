@echo off
if [%1]==[pal] goto :pal
call build_assets.bat ntsc
make clean
make TARGET=NTSC
if [%1]==[ntsc] goto :clean
:pal
call build_assets.bat pal
make clean
make TARGET=PAL
:clean
rem del *.asm /a /s > nul 2> nul
del *.lst /a /s > nul 2> nul
del *.sym /a /s > nul 2> nul
del *.lk /a /s > nul 2> nul
rem del *.map > nul 2> nul
del *.noi /a /s > nul 2> nul
del *.ihx /a /s > nul 2> nul

echo DONE!
echo Remember: compile.bat does a FULL BUILD. If you are dev'ing use make
echo Remember: compile.bat [ntsc|pal] compiles BOTH if ommited.
