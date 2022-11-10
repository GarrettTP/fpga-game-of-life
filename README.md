# fpga-game-of-life
Game of life written in HDL using SystemVerilog.

## Required utilities
- Python
- SystemVerilog/ModelSim
- Windows

## How to use
1. `run.bat (grid_size) (test_generations)` where grid_size is the number of rows and columns on the grid and test_generations is the number of generations to simluate. If asked to edit the 'setup.txt' file, modify and save the file before continuing.

Running `build.bat (grid_size)` will generate the necessary utility files without running a simulation.

If you do not have Python you can run the current implementation using `vsim -do run.do -c` but you will not be able to change the grid size or number of test generations.
