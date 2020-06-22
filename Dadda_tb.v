`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:44:45 06/22/2020
// Design Name:   Dadda_8x8Multiplier
// Module Name:   F:/Xilinx/Work/Dadda/Dadda_tb.v
// Project Name:  Dadda
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dadda_8x8Multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Dadda_tb;

	// Inputs
	reg clock;
	reg reset_n;
	reg [7:0] operand1;
	reg [7:0] operand2;

	// Outputs
	wire [15:0] Result;
	integer i;
	// Instantiate the Unit Under Test (UUT)
	Dadda_8x8Multiplier uut (
		.clock(clock), 
		.reset_n(reset_n), 
		.operand1(operand1), 
		.operand2(operand2), 
		.Result(Result)
	);

	always #10 clock = ~clock;
	
	initial begin
		// Initialize Inputs
		clock = 0;
		reset_n = 0;
		#5 reset_n = 1;
		operand1 = 0;
		operand2 = 255;
		#5;
		for (i = 0; i < 255; i = i+1)
		begin
			@(posedge clock);
			@(negedge clock);
			operand1 = operand1 + 1;
			operand2 = operand2 - 1;
			#5;
		end


			#5 $finish;
		// Add stimulus here

	end
      
endmodule

