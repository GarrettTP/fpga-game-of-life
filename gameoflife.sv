
/*
    Features
        - Button to start and stop simulation
        - Button to reset simulation
        - Buttons to set initial state
            - Left, right, up, down button to select cells
            - Toggle button to toggle state of selected cell
        - LCD visualizer and command prompt visualizer (testing)
        - .tga rendering output just because
*/

`include "types.sv"
`include "clk_div.sv"

module gameoflife(controls, game);
    input golcontrols controls;
    output golmachine game;

    grid_t gridupdate; // The next updated version of the grid
    logic ctrlupdatesignal; // posedge when control input changes
    int selectedx, selectedy; // The x and y coordinates of the currently selected cell
    bit currentcellalive; // Whether or not the cell that is selected is alive
    controller ctrl (controls, game, gridupdate, ctrlupdatesignal, game.paused, selectedx, selectedy, currentcellalive);

    assign game.selectedx = selectedx;
    assign game.selectedy = selectedy;
    assign game.controlsignal = ctrlupdatesignal;
    assign game.currentcellalive = currentcellalive;

    // Set up game clock
    `ifdef TESTBENCH
        assign game.clk = controls.clk;
    `else
        clk_div div(controls.clk, game.paused, game.clk);
    `endif

    // Connect datapath to grid
    datapath dp (game.grid, game.gridevolve);

    // Build state machine and update signals
    always_ff @(posedge game.clk, posedge game.controlsignal) begin
        if (game.paused) begin
            game.grid = gridupdate;
            game.generation = 1;
        end
        else if (game.state == UPDATE) begin
            game.updatesignal = 1'b1;
            game.state = STEP;
        end
        else begin
            game.grid = game.gridevolve;
            game.generation++;
            game.state = UPDATE;
        end
    end

    always_ff @(negedge game.clk) begin
        game.updatesignal = 1'b0;
    end

endmodule