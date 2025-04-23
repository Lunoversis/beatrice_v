#!/bin/bash

# Compile the Pascal source file
fpc ./src/beatrice_v.net.lib.pas
fpc ./src/beatrice_v.back.lib.pas
fpc ./src/beatrice_v.mgmt.lib.pas
fpc ./src/beatrice_v.math.lib.pas
fpc ./src/beatrice_v.front.lib.pas

# Remove object files and compiled unit files
rm ./src/*.o
rm ./src/*.ppu