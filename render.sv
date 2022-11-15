`include "types.sv"

function void tgarender(input golmachine game, int img);
    typedef enum bit[1:0] {CELL, DIV, OFFSET} pmode;

    int width, height;
    
    pmode xstate, ystate; // State switched between CELL, DIV (divider), and OFFSET
    int gridx, gridy; // The physical x and y coordinates of the grid cells
    int dx, dy; // Change in x and y since last state change
    bit iscell; // Set to true if the x and y states are both CELL
    bit isselected; // Set to true if the game is in edit mode and the current physical cell is selected
    bit cellalive; // True if the current cell is alive
    byte color[3]; // RGB truecolor of the current pixel

    static int cellsize, offsetx, offsety;
    cellsize = (`RESOLUTION_Y - `GRID_SIZE * (`DIVIDER_THICKNESS + 1)) / `GRID_SIZE;
    offsetx = (`RESOLUTION_X - (`DIVIDER_THICKNESS * (`GRID_SIZE + 1) + cellsize * `GRID_SIZE)) / 2;
    offsety = (`RESOLUTION_Y - (`DIVIDER_THICKNESS * (`GRID_SIZE + 1) + cellsize * `GRID_SIZE)) / 2;

    width = `RESOLUTION_X;
    height = `RESOLUTION_Y;
    // .tga header
    $fwrite(img, "%c", 0);                      // Length of image id field
    $fwrite(img, "%c", 0);                      // No color map
    $fwrite(img, "%c", 2);                      // Image type (truecolor no-encoding)
    $fwrite(img, "%c%c%c%c%c", 0, 0, 0, 0, 0);  // Colormap specification
    $fwrite(img, "%c%c", 0, 0);                 // X offset
    $fwrite(img, "%c%c", 0, 0);                 // Y offset
    $fwrite(img, "%c%c", width[7:0], width[15:8]); // Width
    $fwrite(img, "%c%c", height[7:0], height[15:8]); // Height
    $fwrite(img, "%c", 24);                     // Pixel depth; bits per pixel
    $fwrite(img, "%c", 8'b00100000);             // Image descriptor; set image origin to top left corner

    dy = 0;
    ystate = OFFSET;
    gridx = 0; gridy = 0;

    for (int y = 0; y < `RESOLUTION_Y; y++) begin
        if (ystate == OFFSET && dy == offsety) begin
            ystate = DIV;
            dy = 0;
        end
        
        if (ystate == DIV && dy == `DIVIDER_THICKNESS) begin
            ystate = gridy == `GRID_SIZE ? OFFSET : CELL;
            dy = 0;
        end
        else if (ystate == CELL && dy == cellsize) begin
            gridy++;
            ystate = DIV;
            dy = 0;
        end

        dy++;

        dx = 0;
        xstate = OFFSET;
        gridx = 0;

        for (int x = 0; x < `RESOLUTION_X; x++) begin
            if (xstate == OFFSET && dx == offsetx) begin
                xstate = DIV;
                dx = 0;
            end

            if ((xstate == DIV) & (dx == `DIVIDER_THICKNESS)) begin
                xstate = gridx == `GRID_SIZE ? OFFSET : CELL;
                dx = 0;
            end
            else if ((xstate == CELL) & (dx == cellsize)) begin
                gridx++;
                xstate = DIV;
                dx = 0;
            end

            dx++;
            
            iscell = xstate == CELL && ystate == CELL;
            isselected = game.controlsignal && game.selectedx == gridx && game.selectedy == gridy;
            if (iscell) begin
                cellalive = game.grid[gridy*`GRID_SIZE+gridx];
                color = {
                    game.currentcellselected & isselected ? 8'h80 : isselected ? 8'h80 : cellalive ? 8'h00 : 8'hff,
                    game.currentcellselected & isselected ? 8'hff : isselected ? 8'h80 : cellalive ? 8'h80 : 8'hff,
                    game.currentcellselected & isselected ? 8'hff : isselected ? 8'h80 : cellalive ? 8'hff : 8'hff
                };
            end
            else begin
                color = {8'h00, 8'h00, 8'h00};
            end
            
            $fwrite(img, "%c%c%c", color[2], color[1], color[0]);
        end
    end
endfunction