/*
 
 Conway's Game of Life modeled in SVerilog
 
*/

`include "types.sv"

module datapath ( grid, grid_evolve );

   input grid_t grid;
   output grid_t grid_evolve;

   `include "datapath_autogen.sv"
 
endmodule // top


module evolve3 (next_state, vector1, vector2, vector3, current_state);
	
   input logic  vector1;
   input logic  vector2;
   input logic  vector3;
   input logic  current_state;
   output logic next_state;
   
   logic [3:0] 	sum;
   
   assign sum = vector1 + vector2 + vector3;
   rules r1 (sum, current_state, next_state);
   
endmodule // evolve3

module evolve5 (next_state, vector1, vector2, vector3, 
		vector4, vector5, current_state);
   
   input logic   vector1;
   input logic 	 vector2;
   input logic 	 vector3;
   input logic 	 vector4;
   input logic 	 vector5;
   input logic 	 current_state;
   output logic  next_state;
   
   logic [3:0] 	 sum;
   
   assign sum = vector1 + vector2 + vector3 + vector4 + vector5;
   rules r1 (sum, current_state, next_state);
   
endmodule // evolve5


module evolve8 (next_state, vector1, vector2, vector3, 
		vector4, vector5, vector6, 
		vector7, vector8, current_state);
   
   input logic 	vector1;
   input logic 	vector2;
   input logic 	vector3;
   input logic 	vector4;
   input logic 	vector5;
	
   input logic 	vector6;
   input logic 	vector7;
   input logic 	vector8;
   input logic 	current_state;
   output logic next_state;
   
   logic [3:0] 	sum;
   
   assign sum = vector1 + vector2 + vector3 + vector4 + 
		vector5 + vector6 + vector7 + vector8;
   rules r1 (sum, current_state, next_state);
   
endmodule // evolve8


module rules (pop_count, current_state, next_state);
   
   input logic [3:0] pop_count;
   input logic 	     current_state;
   output logic      next_state;
   
   assign next_state = (pop_count == 2 & current_state) | pop_count == 3;
   
endmodule // rules