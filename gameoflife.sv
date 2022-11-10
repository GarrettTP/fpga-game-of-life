
/*
    Features
        - Button to start and stop simulation
        - Button to reset simulation
        - Buttons to set initial state
            - Left, right, up, down button to select cells
            - Toggle button to toggle state of selected cell
        - LCD visualizer and command prompt visualizer (testing)
*/

`include "types.sv"
`include "clk_div.sv"

module gameoflife(controls, game);
    input golcontrols controls;
    output golmachine game;

    grid_t gridupdate;
    logic ctrlupdatesignal;
    controller ctrl (controls, game, gridupdate, ctrlupdatesignal, game.paused);

    // Set up game clock
    `ifdef TESTBENCH
    initial begin
	    game.clk = 1'b1;
	    forever #20 game.clk = ~game.clk;
    end
    `else
    clk_div div(controls.clk, game.paused, game.clk);
    `endif

    datapath dp (game.grid, game.gridevolve);

    always_ff @(posedge controls.clk) begin
        if (game.paused) game.state <= UPDATE;
        else game.state <= game.nextstate;
    end

    // logic simupdatesignal;
    // assign game.updatesignal = simupdatesignal;

    always_comb begin
        if (ctrlupdatesignal) begin
            game.generation = 1;
            game.grid <= gridupdate; // Use the updated grid when simulation is paused
            game.updatesignal <= 1'b1;
        end
        else if (game.paused) begin
            game.updatesignal <= 1'b0;
        end
        else begin
            case (game.state)
                UPDATE: begin
                    game.updatesignal <= 1'b1;

                    if (game.clk) game.nextstate <= UPDATE;
                    else game.nextstate <= STEP;
                end
                STEP: begin
                    if (game.updatesignal) begin
                        game.grid <= game.gridevolve; // Evolve grid
                        game.generation += 1;
                    end
                    game.updatesignal <= 1'b0; // Reset update signal

                    if (game.clk) game.nextstate <= UPDATE;
                    else game.nextstate <= STEP;
                end
                default: begin
                    game.generation = 1;
                    game.nextstate <= UPDATE;
                end
            endcase
        end
    end
endmodule