`include "macros.sv"

typedef struct packed {
    logic pause;
    bit reset;
    bit moveleft, moveright, moveup, movedown, toggle;
    logic clk; // Input clock from device or testbench
} golcontrols;

typedef enum logic [0:0] {STEP, UPDATE} machinestate;
typedef bit[`GRID_SIZE*`GRID_SIZE-1:0] grid_t;
typedef struct packed {
    bit paused;
    grid_t grid;
    grid_t gridevolve;
    int generation;
    machinestate state;
    machinestate nextstate;
    logic clk; // Game clock used to update the state of the game
    logic updatesignal;
} golmachine;