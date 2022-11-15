`include "types.sv"

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

    always_ff @(posedge controls.pause) begin
        pause = ~pause;
        updatesignal = pause;
    end

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