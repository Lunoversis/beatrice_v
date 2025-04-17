#!/bin/bash

# Compile the Pascal source file
fpc ./src/beatrice_v.front.lib.pas
fpc ./src/beatrice_v.engine.lib.pas
fpc ./src/beatrice_v.net.lib.pas

# Remove object files and compiled unit files
rm ./src/*.o
rm ./src/*.ppu