`include "types.sv"

module controller(controls, game, gridupdate, updatesignal, pause);
    input golcontrols controls;
    input golmachine game;
    output grid_t gridupdate;
    output bit updatesignal;
    output bit pause;

    int x, y;

    bit flipflop;
    grid_t gridzero;

    always_ff @(posedge controls.pause) begin
        pause = ~pause;
    end

    always_ff @(posedge controls.clk) begin
        if (pause) begin
            if (flipflop) begin
                if (!(controls.moveleft | controls.moveright | controls.moveup | controls.movedown | controls.toggle | controls.reset)) begin
                    flipflop <= 0'b0;
                    updatesignal <= 1'b0;
                end
            end
            else begin
                x = x + controls.moveright - controls.moveleft;
                x = x < 0 ? `GRID_SIZE - 1 : (x == `GRID_SIZE ? 0 : x);

                y = y + controls.movedown - controls.moveup;
                y = y < 0 ? `GRID_SIZE - 1 : (y == `GRID_SIZE ? 0 : y);
                
                if (controls.toggle) begin
                    gridupdate[x + y * `GRID_SIZE] <= ~gridupdate[x + y * `GRID_SIZE];
                    updatesignal <= 1'b1;
                end

                if (controls.reset) begin
                    gridupdate <= gridzero;
                    updatesignal <= 1'b1;
                end

                flipflop <= controls.moveleft | controls.moveright | controls.moveup | controls.movedown | controls.toggle | controls.reset;
            end
        end else begin
            gridupdate <= game.grid;
        end
    end
endmodule