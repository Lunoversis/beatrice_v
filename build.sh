#!/bin/bash

# Compile the Pascal source file
fpc ./src/test.pas

# Remove object files and compiled unit files
rm ./src/*.o
rm ./src/*.ppu