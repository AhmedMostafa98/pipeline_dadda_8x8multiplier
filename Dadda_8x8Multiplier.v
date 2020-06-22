`timescale 1ns / 1ps

module Dadda_8x8Multiplier(
		input clock, reset_n,
		input [7:0] operand1,
		input [7:0] operand2,
		output [15:0] Result
    );

	wire S_6_15 , C_6_15 , op_06 , op_15;
	wire S_34_43, C_34_43 , op_34 , op_43;
	wire S_44_53, C_44_53 , op_44 , op_53;
	wire S_7_16_25, C_7_16_25, op_07, op_16, op_25;
	wire S_17_26_35, C_17_26_35, op_17, op_26, op_35;
	wire S_27_36_45, C_27_36_45, op_27, op_36, op_45;
	wire S_04_13, C_04_13, op_04, op_13;
	wire S_05_14_23, C_05_14_23, op_05, op_14, op_23;
	wire S_32_41, C_32_41, op_32, op_41;
	wire S_0, C_0, op_24, op_33;
	wire S_42_51_60, C_42_51_60, op_42, op_51, op_60;
	wire S_1, C_1;
	wire S_52_61_70, C_52_61_70, op_52, op_61, op_70;
	wire S_2, C_2;
	wire S_3443_62_71, C_3443_62_71, op_62, op_71;
	wire S_3, C_3;
	wire S_54_63_72, C_54_63_72, op_54, op_63, op_72;
	wire S_37_46_55, C_37_46_55, op_37, op_46, op_55;
	wire S_4, C_4, op_64, op_73;
	wire S_47_56_65, C_47_56_65, op_47, op_56, op_65;
	wire S_3_12, C_3_12, op_03, op_12;
	wire S_5, C_5, op_22, op_31;
	wire S_6, C_6;
	wire S_7, C_7;
	wire S_8, C_8;
	wire S_9, C_9;
	wire S_10, C_10;
	wire S_11, C_11;
	wire S_12, C_12;
	wire S_57_66_75, C_57_66_75, op_57, op_66, op_75;
	
	wire S01,C01,op_02,op_11;
	wire S02,C02,op_21,op_30;
	wire S03,C03,op_40;
	wire S04,C04,op_50;
	wire S05,C05;
	wire S06,C06;
	wire S07,C07;
	wire S08,C08;
	wire S09,C09;
	wire S010,C010,op_74;
	wire S011,C011;
	wire S012,C012,op_67,op_76;
	wire op_00,op_01,op_10,op_20,op_77;
	wire[14:0] Floor1,Floor2;
	
	//pipeline registers
	wire [27:0] Level_1;
	wire [43:0] Level_2;
	wire [41:0] Level_3;
	wire [39:0] Level_4;
	
	reg [27:0] Level_1_reg;
	reg [43:0] Level_2_reg;
	reg [41:0] Level_3_reg;
	reg [39:0] Level_4_reg;

	//************************level 1***********************************
	assign op_06 = operand2[0] & operand1[6];
	assign op_15 = operand2[1] & operand1[5];
	Half_Adder H1 (.Sum(S_6_15) , .Cout(C_6_15) , .A(op_06) , .B(op_15));
	
	assign op_34 = operand2[3] & operand1[4];
	assign op_43 = operand2[4] & operand1[3];
	Half_Adder H2 (.Sum(S_34_43) , .Cout(C_34_43) , .A(op_34) , .B(op_43));

	assign op_44 = operand2[4] & operand1[4];
	assign op_53 = operand2[5] & operand1[3];
	Half_Adder H3 (.Sum(S_44_53) , .Cout(C_44_53) , .A(op_44) , .B(op_53));

	assign op_07 = operand2[0] & operand1[7];
	assign op_16 = operand2[1] & operand1[6];
	assign op_25 = operand2[2] & operand1[5];
	Full_Adder F1 (.Sum(S_7_16_25) , .Cout(C_7_16_25) , .A(op_07) , .B(op_16) , .Cin(op_25));
	
	assign op_17 = operand2[1] & operand1[7];
	assign op_26 = operand2[2] & operand1[6];
	assign op_35 = operand2[3] & operand1[5];
	Full_Adder F2 (.Sum(S_17_26_35) , .Cout(C_17_26_35) , .A(op_17) , .B(op_26) , .Cin(op_35));

	assign op_27 = operand2[2] & operand1[7];
	assign op_36 = operand2[3] & operand1[6];
	assign op_45 = operand2[4] & operand1[5];
	Full_Adder F3 (.Sum(S_27_36_45) , .Cout(C_27_36_45) , .A(op_27) , .B(op_36) , .Cin(op_45));
	

	assign Level_1 = {operand1 , operand2 , S_6_15 , S_34_43 , S_44_53 , S_7_16_25 , S_17_26_35 , S_27_36_45 ,
														 C_6_15 , C_34_43 , C_44_53 , C_7_16_25 , C_17_26_35 , C_27_36_45};
	
	always @(posedge clock or negedge reset_n)
	begin
		if (!reset_n)
		begin
			Level_1_reg <= 28'b0;
		end
		else
		begin
			Level_1_reg <= Level_1;
		end
	end

	//****************************level 2**********************************
	assign op_04 = Level_1_reg[12] & Level_1_reg[24];
	assign op_13 = Level_1_reg[13] & Level_1_reg[23];	
	Half_Adder H4 (.Sum(S_04_13) , .Cout(C_04_13) , .A(op_04) , .B(op_13));
	
	assign op_05 = Level_1_reg[12] & Level_1_reg[25];
	assign op_14 = Level_1_reg[13] & Level_1_reg[24];
	assign op_23 = Level_1_reg[14] & Level_1_reg[23];
	Full_Adder F4 (.Sum(S_05_14_23) , .Cout(C_05_14_23) , .A(op_05) , .B(op_14) , .Cin(op_23));
	
	assign op_32 = Level_1_reg[15] & Level_1_reg[22];
	assign op_41 = Level_1_reg[16] & Level_1_reg[21];	
	Half_Adder H5 (.Sum(S_32_41) , .Cout(C_32_41) , .A(op_32) , .B(op_41));

	assign op_24 = Level_1_reg[14] & Level_1_reg[24];
	assign op_33 = Level_1_reg[15] & Level_1_reg[23];
	Full_Adder F5 (.Sum(S_0) , .Cout(C_0) , .A(Level_1_reg[11]) , .B(op_24) , .Cin(op_33));

	assign op_42 = Level_1_reg[16] & Level_1_reg[22];
	assign op_51 = Level_1_reg[17] & Level_1_reg[21];
	assign op_60 = Level_1_reg[18] & Level_1_reg[20];
	Full_Adder F6 (.Sum(S_42_51_60) , .Cout(C_42_51_60) , .A(op_42) , .B(op_51) , .Cin(op_60));

	Full_Adder F7 (.Sum(S_1) , .Cout(C_1) , .A(Level_1_reg[8]) , .B(Level_1_reg[5]) , .Cin(Level_1_reg[10]));

	assign op_52 = Level_1_reg[17] & Level_1_reg[22];
	assign op_61 = Level_1_reg[18] & Level_1_reg[21];
	assign op_70 = Level_1_reg[19] & Level_1_reg[20];
	Full_Adder F8 (.Sum(S_52_61_70) , .Cout(C_52_61_70) , .A(op_52) , .B(op_61) , .Cin(op_70));


	Full_Adder F9 (.Sum(S_2) , .Cout(C_2) , .A(Level_1_reg[7]) , .B(Level_1_reg[9]) , .Cin(Level_1_reg[2]));
	
	assign op_62 = Level_1_reg[18] & Level_1_reg[22];
	assign op_71 = Level_1_reg[19] & Level_1_reg[21];
	Full_Adder F10 (.Sum(S_3443_62_71) , .Cout(C_3443_62_71) , .A(Level_1_reg[4]) , .B(op_62) , .Cin(op_71));

	Full_Adder F11 (.Sum(S_3) , .Cout(C_3) , .A(Level_1_reg[6]) , .B(Level_1_reg[1]) , .Cin(Level_1_reg[3]));
	
	assign op_54 = Level_1_reg[17] & Level_1_reg[24];
	assign op_63 = Level_1_reg[18] & Level_1_reg[23];
	assign op_72 = Level_1_reg[19] & Level_1_reg[22];
	Full_Adder F12 (.Sum(S_54_63_72) , .Cout(C_54_63_72) , .A(op_54) , .B(op_63) , .Cin(op_72));

	assign op_37 = Level_1_reg[14] & Level_1_reg[27];
	assign op_46 = Level_1_reg[16] & Level_1_reg[26];
	assign op_55 = Level_1_reg[17] & Level_1_reg[25];
	Full_Adder F13 (.Sum(S_37_46_55) , .Cout(C_37_46_55) , .A(op_37) , .B(op_46) , .Cin(op_55));

	assign op_64 = Level_1_reg[18] & Level_1_reg[24];
	assign op_73 = Level_1_reg[19] & Level_1_reg[23];
	Full_Adder F14 (.Sum(S_4) , .Cout(C_4) , .A(op_64) , .B(op_73) , .Cin(Level_1_reg[0]));

	assign op_47 = Level_1_reg[16] & Level_1_reg[27];
	assign op_56 = Level_1_reg[17] & Level_1_reg[26];
	assign op_65 = Level_1_reg[18] & Level_1_reg[25];
	Full_Adder F15 (.Sum(S_47_56_65) , .Cout(C_47_56_65) , .A(op_47) , .B(op_56) , .Cin(op_65));
	
	
	assign Level_2 = {Level_1_reg[27:20] , Level_1_reg[19:12] , S_04_13 , S_05_14_23 , S_32_41 , S_0 , S_42_51_60 , S_1 , S_52_61_70 , S_2
							, S_3443_62_71 , S_3 , S_54_63_72 , S_37_46_55 , S_4 , S_47_56_65 , 
							C_04_13 , C_05_14_23 , C_32_41 , C_0 , C_42_51_60 , C_1 , C_52_61_70 , C_2
							, C_3443_62_71, C_3 , C_54_63_72 , C_37_46_55 , C_4 , C_47_56_65 };
							
	always @(posedge clock or negedge reset_n)
	begin
		if (!reset_n)
		begin
			Level_2_reg <= 44'b0;
		end
		else
		begin
			Level_2_reg <= Level_2;
		end
	end


	//*******************************level 3****************************************
	assign op_03 = Level_2_reg[28] & Level_2_reg[39];
	assign op_12 = Level_2_reg[29] & Level_2_reg[38];
	Half_Adder H6 (.Sum(S_3_12) , .Cout(C_3_12) , .A(op_03) , .B(op_12));

	assign op_22 = Level_2_reg[30] & Level_2_reg[38];
	assign op_31 = Level_2_reg[31] & Level_2_reg[37];
	Full_Adder F16 (.Sum(S_5) , .Cout(C_5) , .A(op_22) , .B(op_31) , .Cin(Level_2_reg[27]));

	Full_Adder F17 (.Sum(S_6) , .Cout(C_6) , .A(Level_2_reg[26]) , .B(Level_2_reg[13]) , .Cin(Level_2_reg[25]));

	Full_Adder F18 (.Sum(S_7) , .Cout(C_7) , .A(Level_2_reg[24]) , .B(Level_2_reg[12]) , .Cin(Level_2_reg[23]));

	Full_Adder F19 (.Sum(S_8) , .Cout(C_8) , .A(Level_2_reg[22]) , .B(Level_2_reg[10]) , .Cin(Level_2_reg[21]));
	
	Full_Adder F20 (.Sum(S_9) , .Cout(C_9) , .A(Level_2_reg[20]) , .B(Level_2_reg[8]) , .Cin(Level_2_reg[19]));
	
	Full_Adder F21 (.Sum(S_10) , .Cout(C_10) , .A(Level_2_reg[18]) , .B(Level_2_reg[6]) , .Cin(Level_2_reg[17]));

	Full_Adder F22 (.Sum(S_11) , .Cout(C_11) , .A(Level_2_reg[15]) , .B(Level_2_reg[4]) , .Cin(Level_2_reg[16]));

	Full_Adder F23 (.Sum(S_12) , .Cout(C_12) , .A(Level_2_reg[14]) , .B(Level_2_reg[2]) , .Cin(Level_2_reg[1]));

	assign op_57 = Level_2_reg[33] & Level_2_reg[43];
	assign op_66 = Level_2_reg[34] & Level_2_reg[42];
	assign op_75 = Level_2_reg[35] & Level_2_reg[41];
	Full_Adder F24 (.Sum(S_57_66_75) , .Cout(C_57_66_75) , .A(op_57) , .B(op_66) , .Cin(op_75));
	
	
	assign Level_3 = {Level_2_reg[43:36] , Level_2_reg[35:28] , S_57_66_75 , C_57_66_75 , S_3_12 , S_5 , S_6 , S_7 , S_8 , S_9 , S_10 
							, S_11 , S_12 ,C_3_12 , C_5 , C_6 , C_7 , C_8 , C_9 , C_10 , C_11 , C_12 ,
							Level_2_reg[11] , Level_2_reg[9] , Level_2_reg[7] , Level_2_reg[5] , Level_2_reg[3] , Level_2_reg[0]};
	
	always @(posedge clock or negedge reset_n)
	begin
		if (!reset_n)
		begin
			Level_3_reg <= 42'b0;
		end
		else
		begin
			Level_3_reg <= Level_3;
		end
	end

	//**********************************level 4************************************
	assign op_02 = Level_3_reg[26] & Level_3_reg[36];
	assign op_11 = Level_3_reg[27] & Level_3_reg[35];
	Half_Adder H7 (.Sum(S01) , .Cout(C01) , .A(op_02) , .B(op_11));

	assign op_21 = Level_3_reg[28] & Level_3_reg[35];
	assign op_30 = Level_3_reg[29] & Level_3_reg[34];
	Full_Adder F25 (.Sum(S02) , .Cout(C02) , .A(op_21) , .B(op_30) , .Cin(Level_3_reg[23]));

	assign op_40 = Level_3_reg[30] & Level_3_reg[34];
	Full_Adder F26 (.Sum(S03) , .Cout(C03) , .A(Level_3_reg[22]) , .B(op_40) , .Cin(Level_3_reg[14]));

	assign op_50 = Level_3_reg[31] & Level_3_reg[34];
	Full_Adder F27 (.Sum(S04) , .Cout(C04) , .A(Level_3_reg[21]) , .B(op_50) , .Cin(Level_3_reg[13]));

	Full_Adder F28 (.Sum(S05) , .Cout(C05) , .A(Level_3_reg[20]) , .B(Level_3_reg[12]) , .Cin(Level_3_reg[5]));
	
	Full_Adder F29 (.Sum(S06) , .Cout(C06) , .A(Level_3_reg[19]) , .B(Level_3_reg[11]) , .Cin(Level_3_reg[4]));

	Full_Adder F30 (.Sum(S07) , .Cout(C07) , .A(Level_3_reg[18]) , .B(Level_3_reg[10]) , .Cin(Level_3_reg[3]));
	
	Full_Adder F31 (.Sum(S08) , .Cout(C08) , .A(Level_3_reg[17]) , .B(Level_3_reg[9]) , .Cin(Level_3_reg[2]));

	Full_Adder F32 (.Sum(S09) , .Cout(C09) , .A(Level_3_reg[16]) , .B(Level_3_reg[8]) , .Cin(Level_3_reg[1]));
	
	assign op_74 = Level_3_reg[33] & Level_3_reg[38];
	Full_Adder F33 (.Sum(S010) , .Cout(C010) , .A(Level_3_reg[15]) , .B(op_74) , .Cin(Level_3_reg[7]));

	Full_Adder F34 (.Sum(S011) , .Cout(C011) , .A(Level_3_reg[25]) , .B(Level_3_reg[0]) , .Cin(Level_3_reg[6]));
	
	assign op_67 = Level_3_reg[32] & Level_3_reg[41];
	assign op_76 = Level_3_reg[32] & Level_3_reg[40];
	Full_Adder F35 (.Sum(S012) , .Cout(C012) , .A(op_67) , .B(Level_3_reg[24]) , .Cin(op_76));


	assign Level_4 = {Level_3_reg[41:34] , Level_3_reg[33:26] , S01 , S02 , S03 , S04 , S05 , S06 , S07 , S08 , S09 ,
																					S010 , S011 , S012 ,
							C01 , C02 , C03 , C04 , C05 , C06 , C07 , C08 , C09 , C010 , C011 , C012 };
				  
	always @(posedge clock or negedge reset_n)
	begin
		if (!reset_n)
		begin
			Level_4_reg <= 40'b0;
		end
		else
		begin
			Level_4_reg <= Level_4;
		end
	end

	//*****************************************last level*********************************
	assign op_01 = Level_4_reg[24] & Level_4_reg[33];
	assign op_00 = Level_4_reg[24] & Level_4_reg[32];
	assign op_10 = Level_4_reg[25] & Level_4_reg[32];
	assign op_20 = Level_4_reg[26] & Level_4_reg[32];
	assign op_77 = Level_4_reg[31] & Level_4_reg[39];


	assign Floor1 = {Level_4_reg[0] , Level_4_reg[1] , Level_4_reg[2] , Level_4_reg[3] , Level_4_reg[4] , Level_4_reg[5] 
							, Level_4_reg[6] , Level_4_reg[7] , Level_4_reg[8] , Level_4_reg[9] , Level_4_reg[10] , Level_4_reg[11] 
							, op_20 , op_10 , 1'b0};
	assign Floor2 = {op_77 , Level_4_reg[12] , Level_4_reg[13] , Level_4_reg[14] , Level_4_reg[15] , Level_4_reg[16] , 
							Level_4_reg[17] , Level_4_reg[18] , Level_4_reg[19] , Level_4_reg[20] , Level_4_reg[21] , Level_4_reg[22]
							, Level_4_reg[23] , op_01 , op_00};
	
	assign Result = Floor1 + Floor2;
	
endmodule