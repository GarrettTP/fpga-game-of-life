import sys
import os

# Generates setup based on input file

out = ""
gridSize = int(sys.argv[1])

for x in range(gridSize):
    for y in range(gridSize):
        out += "0  "
    out += "\n"

f = open("setup.txt", "r")
contents = f.read()
if len(out) != len(contents):
    f.close()
    f = open("setup.txt", "w")
    f.write(out)
    print("Grid size change detected! rebuilding setup.txt")
    print("Edit 'setup.txt' by setting 0's to 1's for the initial setup, then")
    f.close()
    os.system("pause")

setup = "#5 controls.pause = 1'b1;\n"
with open('setup.txt', 'r') as file:
    for line in file:     
        for word in line.split():
            if word == "1":
                setup += "#5 controls.toggle = 1'b1; #5 controls.toggle = 1'b0;\n"
            setup += "#5 controls.moveright = 1'b1; #5 controls.moveright = 1'b0;\n"
        setup += "#5 controls.movedown = 1'b1; #5 controls.movedown = 1'b0;\n"

setup += "#5 controls.pause = 1'b0;\n"

f = open("setup_autogen.sv", "w")
f.write(setup)
f.close()