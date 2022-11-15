`include "render.sv"

`define DISPLAY_CONTROL_UPDATES 0

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
    end

endmodule


module display_tga(controls, game);
    input golcontrols controls;
    input golmachine game;

    int img;
    string fname;

    int controlcounter;

    always_ff @(posedge game.updatesignal, posedge game.controlsignal)
    begin
        if ((game.controlsignal && `DISPLAY_CONTROL_UPDATES) || !game.controlsignal) begin
            if (game.controlsignal) begin
                $sformat(fname, "renders/control%0d.tga", ++controlcounter);
                img = $fopen(fname, "wb");
            end
            else begin
                $sformat(fname, "renders/gen%0d.tga", game.generation);
                img = $fopen(fname, "wb");
            end

            tgarender(game, img);

            $fclose(img);
        end
    end
endmodule


module stimulus();
    golcontrols controls;
    golmachine game;

    gameoflife gamecontroller(controls, game);

    display_tb tbdisplay(controls, game);
    display_tga tgadisplay(controls, game);

    always_ff @(posedge game.updatesignal)
        if (game.generation == `TEST_GENERATIONS) $finish;

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