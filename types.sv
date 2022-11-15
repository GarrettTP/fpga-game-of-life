`include "macros.sv"

`define RESOLUTION_X 400
`define RESOLUTION_Y 400
`define DIVIDER_THICKNESS 1

typedef byte pixelbuffer[`RESOLUTION_X*`RESOLUTION_Y*3];

typedef struct packed {
    logic pause;
    bit moveleft, moveright, moveup, movedown, toggle, reset;
    logic clk; // Input clock from device or testbench
} golcontrols;

typedef enum bit [0:0] {STEP, UPDATE} machinestate;
typedef bit[`GRID_SIZE*`GRID_SIZE-1:0] grid_t;

typedef struct packed {
    bit paused;
    grid_t grid;
    grid_t gridevolve;
    int generation;
    int selectedx, selectedy;
    bit currentcellalive;
    machinestate state;
    machinestate nextstate;
    logic clk; // Game clock used to update the state of the game
    logic updatesignal;
    logic controlsignal;
} golmachine;