@echo off
echo Start Compiling Beatrice V for Windows!
fpc ./src/beatrice_v.front.lib.pas
fpc ./src/beatrice_v.engine.lib.pas
fpc ./src/beatrice_v.net.lib.pas
fpc ./src/test.pas

rm ./src/*.o
rm ./src/*.ppu
echo Finished Compiling Beatrice V for Windows!