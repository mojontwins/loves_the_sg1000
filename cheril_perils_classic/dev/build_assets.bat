@echo off

cd ..\gfx
..\utils\mkts_om.exe platform=sg1000 mode=scripted in=cut_patterns.spt silent

cd ..\enems
..\utils\eneexp3.exe level0.ene ..\dev\assets\enems0 0 1 gencounter cwithheader
..\utils\eneexp3.exe level1.ene ..\dev\assets\enems1 1 1 gencounter cwithheader
..\utils\eneexp3.exe level2.ene ..\dev\assets\enems2 2 1 gencounter cwithheader

cd ..\map
..\utils\rle44mapMK1.exe ..\map\level0.map ..\dev\assets\map0 4 6 15 0 1 scrsizes nodecos cwithheader
..\utils\rle44mapMK1.exe ..\map\level1.map ..\dev\assets\map1 4 6 15 1 1 scrsizes cwithheader
..\utils\rle44mapMK1.exe ..\map\level2.map ..\dev\assets\map2 8 3 15 2 0 scrsizes cwithheader

cd ..\dev

if [%1]==[pal] goto :pal
..\utils\folder2c.exe ..\ogt\ntsc murcia "NTSC version"
goto :end
:pal
..\utils\folder2c.exe ..\ogt\pal murcia "PAL version"

:end
echo DONE!
