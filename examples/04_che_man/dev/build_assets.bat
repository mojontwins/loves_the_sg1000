@echo off

cd ..\gfx
..\..\..\src\utils\mkts_om.exe platform=sg1000 mode=scripted in=cut_patterns.spt silent

cd ..\enems
..\..\..\src\utils\eneexp3.exe level0.ene ..\dev\assets\enems0 0 1 gencounter cwithheader
..\..\..\src\utils\eneexp3.exe level1.ene ..\dev\assets\enems1 1 1 gencounter cwithheader

cd ..\map
..\..\..\src\utils\rle53mapMK1.exe ..\map\level0.map ..\dev\assets\map0 5 4 15 0 1 scrsizes nodecos cwithheader
..\..\..\src\utils\rle53mapMK1.exe ..\map\level1.map ..\dev\assets\map1 4 5 15 1 0 scrsizes nodecos cwithheader

cd ..\dev

if [%1]==[pal] goto :pal
..\..\..\src\utils\folder2c.exe ..\ogt\ntsc murcia "NTSC version"
goto :end
:pal
..\..\..\src\utils\folder2c.exe ..\ogt\pal murcia "PAL version"

:end
echo DONE!
