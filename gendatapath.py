import sys

# Generates datapath_autogen.sv
# Creates a proper datapath module body for the given input grid size

out = ""
gridSize = int(sys.argv[1])

def GetNeighboringCells(inx, iny):
    cells = []
    for x in range(inx-1, inx+2):
        for y in range(iny-1, iny+2):
            if x >= 0 and y >= 0 and x < gridSize and y < gridSize and not (x == inx and y == iny):
                cells.append([x, y])
    return cells

for y in range(gridSize):
    for x in range(gridSize):
        neighborCells = GetNeighboringCells(x, y)
        index = y*gridSize + x

        out += (
            "evolve" +
            str(len(neighborCells)) +
            f" e{x}_{y} " +
            f"(grid_evolve[{index}]"
        )

        for cell in neighborCells:
            cellIndex = cell[0] + cell[1]*gridSize
            out += f", grid[{cellIndex}]"
        
        out += f", grid[{index}]);\n"
    
    out += "\n"

f = open("datapath_autogen.sv", "w")
f.write(out)