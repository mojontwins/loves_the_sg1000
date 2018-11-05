@echo off

cd ..\gfx
..\utils\mkts_om.exe platform=sg1000 mode=scripted in=cut_patterns.spt silent

cd ..\enems
..\utils\eneexp3.exe level0.ene ..\dev\assets\enems0 0 1 gencounter cwithheader

cd ..\map
..\utils\rle44mapMK1.exe ..\map\level0.map ..\dev\assets\map0 1 24 15 0 1 scrsizes nodecos cwithheader

cd ..\dev

if [%1]==[pal] goto :pal
..\utils\folder2c.exe ..\ogt\ntsc murcia "NTSC version"
goto :end
:pal
..\utils\folder2c.exe ..\ogt\pal murcia "PAL version"

:end
echo DONE!
