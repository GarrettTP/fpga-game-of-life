`include "types.sv"

module display_tb(controls, game);
    input golcontrols controls;
    input golmachine game;

    always_ff @(posedge game.updatesignal)
    begin
        for (int y = 0; y < `GRID_SIZE; y++) begin
            for (int x = 0; x < `GRID_SIZE; x++) begin
                $write("%d  ", game.grid[x+y*`GRID_SIZE]);
            end
            $write("\n");
        end
        $display("---------------------------------------------------------");
        $display("Paused: %s;\tGeneration: %d;", game.paused ? "true" : "false", game.generation);
        $display("---------------------------------------------------------");

        if (game.generation == `TEST_GENERATIONS) begin
            $finish;
        end
    end

endmodule

module stimulus();
    golcontrols controls;
    golmachine game;

    gameoflife gamecontroller(controls, game);
    display_tb display(controls, game);

    // Setup the clock to toggle every 1 time units 
    initial begin	
        controls.pause = 1'b0;
        controls.moveleft = 1'b0;
        controls.moveright = 1'b0;
        controls.moveup = 1'b0;
        controls.movedown = 1'b0;
	    controls.clk = 1'b1;
	    forever #1 controls.clk = ~controls.clk;
    end

    initial begin
        `include "setup_autogen.sv"
    end
endmodule