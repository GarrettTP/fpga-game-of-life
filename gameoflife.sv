
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
        initial begin	
            game.clk = 1'b1;
            forever #10 game.clk = ~game.clk;
        end
    `else
        clk_div div(controls.clk, game.paused, game.clk);
    `endif

    // Connect datapath to grid
    datapath dp (game.grid, game.gridevolve);

    always_ff @(posedge controls.clk) begin
        if (game.paused) game.state <= PAUSED;
        else game.state <= game.nextstate;
    end

    always_comb begin
        case (game.state)
        PAUSED: begin
            game.grid <= gridupdate;
            game.generation <= 1;
            game.updatesignal <= 1'b0;

            // Set state to update
            if (game.clk) game.nextstate <= PAUSED;
            else game.nextstate <= UPDATE;
        end
        STEP: begin
            game.grid <= game.updatesignal ? game.gridevolve : game.grid;
            game.updatesignal <= 1'b0;
            game.generation <= game.lastgeneration + 1;
            
            // Set state to update
            if (game.clk) game.nextstate <= STEP;
            else game.nextstate <= UPDATE;
        end
        UPDATE: begin
            game.updatesignal <= 1'b1;
            game.lastgeneration <= game.generation;

            // Set state to step
            if (game.clk) game.nextstate <= STEP;
            else game.nextstate <= UPDATE;
        end
        default: begin
            game.lastgeneration <= 0;
            
            if (game.clk) game.nextstate <= STEP;
        end
        endcase
    end

endmodule