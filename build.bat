@echo off
echo `define GRID_SIZE %1 > macros.sv
echo `define TEST_GENERATIONS %2 >> macros.sv
py gendatapath.py %1
echo Generated datapath