`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:49 06/20/2020 
// Design Name: 
// Module Name:    Full_Adder 
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
module Full_Adder(
	output Sum,
	output Cout,
	input A,
	input B,
	input Cin
    );
	
	wire s1 , c1 , c2;
	xor (s1 , A , B);
	xor (Sum , s1 , Cin);
	and (c1 , A , B);
	and (c2 , Cin , s1);
	or (Cout , c1 , c2);


endmodule
