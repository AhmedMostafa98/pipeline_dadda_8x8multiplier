`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:30 06/20/2020 
// Design Name: 
// Module Name:    Half_Adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Half_Adder(
		output Sum,
		output Cout,
		input A,
		input B
    );

	xor (Sum , A , B);
	and (Cout , A , B);

endmodule
