`define GRID_SIZE 8 
`define TEST_GENERATIONS 10 

`define RESOLUTION_X 400
`define RESOLUTION_Y 400
`define DIVIDER_THICKNESS 1

typedef byte pixelbuffer[`RESOLUTION_X*`RESOLUTION_Y*3];

typedef struct packed {
    logic pause;
    bit moveleft, moveright, moveup, movedown, toggle, reset;
    logic clk; // Input clock from device or testbench
} golcontrols;

typedef enum logic [1:0] {PAUSED, STEP, UPDATE} machinestate;
typedef bit[`GRID_SIZE*`GRID_SIZE-1:0] grid_t;

typedef struct packed {
    bit paused;
    grid_t grid;
    grid_t gridevolve;
    int generation;
    int lastgeneration;
    int selectedx, selectedy;
    bit currentcellalive;
    machinestate state;
    machinestate nextstate;
    logic clk; // Game clock used to update the state of the game
    logic updatesignal;
    logic controlsignal;
} golmachine;


// Handles all input to the game
module controller(controls, game, gridupdate, updatesignal, pause, x, y, currentcellalive);
    input golcontrols controls;
    input golmachine game;
    output grid_t gridupdate;
    output bit updatesignal;
    output bit pause;
    output int x, y;
    output bit currentcellalive;

    bit flipflop;
    grid_t emptygrid;

    // always_ff @(posedge controls.pause) begin
    //     pause = ~pause;
    //     updatesignal = pause;
    // end
    // logic paused;
    // always_ff @(posedge controls.clk) begin
    //     if (controls.pause & ~paused) begin
    //         pause <= ~pause;
    //         paused <= 1'b1;
    //     end
    //     else if (~controls.pause & paused) begin
    //         paused = 1'b0;
    //     end
    // end
    assign pause = controls.pause;

    always_ff @(posedge controls.clk) begin
        if (pause) begin
            if (flipflop) begin
                if (!(controls.moveleft | controls.moveright | controls.moveup | controls.movedown | controls.toggle | controls.reset)) begin
                    flipflop = 0'b0;
                    updatesignal = 1'b0;
                end
            end
            else begin
                x = x + controls.moveright - controls.moveleft;
                x = x < 0 ? `GRID_SIZE - 1 : (x == `GRID_SIZE ? 0 : x);

                y = y + controls.movedown - controls.moveup;
                y = y < 0 ? `GRID_SIZE - 1 : (y == `GRID_SIZE ? 0 : y);
                
                if (controls.toggle) begin
                    currentcellalive = ~gridupdate[x + y * `GRID_SIZE];
                    gridupdate[x + y * `GRID_SIZE] = currentcellalive;
                end
                else
                    currentcellalive = 1'b0;

                if (controls.reset) begin
                    gridupdate = emptygrid;
                end

                flipflop = controls.moveleft | controls.moveright | controls.moveup | controls.movedown | controls.toggle | controls.reset;
                updatesignal = flipflop;
            end
        end
        else begin
            gridupdate <= game.grid;
        end
    end
endmodule