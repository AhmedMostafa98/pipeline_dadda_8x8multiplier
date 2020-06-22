`timescale 1ns / 1ps

module Dadda_8x8Multiplier(
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
	
	

	//****************************level 2**********************************
	assign op_04 = operand2[0] & operand1[4];
	assign op_13 = operand2[1] & operand1[3];	
	Half_Adder H4 (.Sum(S_04_13) , .Cout(C_04_13) , .A(op_04) , .B(op_13));
	
	assign op_05 = operand2[0] & operand1[5];
	assign op_14 = operand2[1] & operand1[4];
	assign op_23 = operand2[2] & operand1[3];
	Full_Adder F4 (.Sum(S_05_14_23) , .Cout(C_05_14_23) , .A(op_05) , .B(op_14) , .Cin(op_23));
	
	assign op_32 = operand2[3] & operand1[2];
	assign op_41 = operand2[4] & operand1[1];	
	Half_Adder H5 (.Sum(S_32_41) , .Cout(C_32_41) , .A(op_32) , .B(op_41));

	assign op_24 = operand2[2] & operand1[4];
	assign op_33 = operand2[3] & operand1[3];
	Full_Adder F5 (.Sum(S_0) , .Cout(C_0) , .A(S_6_15) , .B(op_24) , .Cin(op_33));

	assign op_42 = operand2[4] & operand1[2];
	assign op_51 = operand2[5] & operand1[1];
	assign op_60 = operand2[6] & operand1[0];
	Full_Adder F6 (.Sum(S_42_51_60) , .Cout(C_42_51_60) , .A(op_42) , .B(op_51) , .Cin(op_60));

	Full_Adder F7 (.Sum(S_1) , .Cout(C_1) , .A(S_7_16_25) , .B(C_6_15) , .Cin(S_34_43));

	assign op_52 = operand2[5] & operand1[2];
	assign op_61 = operand2[6] & operand1[1];
	assign op_70 = operand2[7] & operand1[0];
	Full_Adder F8 (.Sum(S_52_61_70) , .Cout(C_52_61_70) , .A(op_52) , .B(op_61) , .Cin(op_70));


	Full_Adder F9 (.Sum(S_2) , .Cout(C_2) , .A(S_17_26_35) , .B(S_44_53) , .Cin(C_7_16_25));
	
	assign op_62 = operand2[6] & operand1[2];
	assign op_71 = operand2[7] & operand1[1];
	Full_Adder F10 (.Sum(S_3443_62_71) , .Cout(C_3443_62_71) , .A(C_34_43) , .B(op_62) , .Cin(op_71));

	Full_Adder F11 (.Sum(S_3) , .Cout(C_3) , .A(S_27_36_45) , .B(C_17_26_35) , .Cin(C_44_53));
	
	assign op_54 = operand2[5] & operand1[4];
	assign op_63 = operand2[6] & operand1[3];
	assign op_72 = operand2[7] & operand1[2];
	Full_Adder F12 (.Sum(S_54_63_72) , .Cout(C_54_63_72) , .A(op_54) , .B(op_63) , .Cin(op_72));

	assign op_37 = operand2[3] & operand1[7];
	assign op_46 = operand2[4] & operand1[6];
	assign op_55 = operand2[5] & operand1[5];
	Full_Adder F13 (.Sum(S_37_46_55) , .Cout(C_37_46_55) , .A(op_37) , .B(op_46) , .Cin(op_55));

	assign op_64 = operand2[6] & operand1[4];
	assign op_73 = operand2[7] & operand1[3];
	Full_Adder F14 (.Sum(S_4) , .Cout(C_4) , .A(op_64) , .B(op_73) , .Cin(C_27_36_45));

	assign op_47 = operand2[4] & operand1[7];
	assign op_56 = operand2[5] & operand1[6];
	assign op_65 = operand2[6] & operand1[5];
	Full_Adder F15 (.Sum(S_47_56_65) , .Cout(C_47_56_65) , .A(op_47) , .B(op_56) , .Cin(op_65));
	


	//*******************************level 3****************************************
	assign op_03 = operand2[0] & operand1[3];
	assign op_12 = operand2[1] & operand1[2];
	Half_Adder H6 (.Sum(S_3_12) , .Cout(C_3_12) , .A(op_03) , .B(op_12));

	assign op_22 = operand2[2] & operand1[2];
	assign op_31 = operand2[3] & operand1[1];
	Full_Adder F16 (.Sum(S_5) , .Cout(C_5) , .A(op_22) , .B(op_31) , .Cin(S_04_13));

	Full_Adder F17 (.Sum(S_6) , .Cout(C_6) , .A(S_05_14_23) , .B(C_04_13) , .Cin(S_32_41));

	Full_Adder F18 (.Sum(S_7) , .Cout(C_7) , .A(S_0) , .B(C_05_14_23) , .Cin(S_42_51_60));

	Full_Adder F19 (.Sum(S_8) , .Cout(C_8) , .A(S_1) , .B(C_0) , .Cin(S_52_61_70));
	
	Full_Adder F20 (.Sum(S_9) , .Cout(C_9) , .A(S_2) , .B(C_1) , .Cin(S_3443_62_71));
	
	Full_Adder F21 (.Sum(S_10) , .Cout(C_10) , .A(S_3) , .B(C_2) , .Cin(S_54_63_72));

	Full_Adder F22 (.Sum(S_11) , .Cout(C_11) , .A(S_4) , .B(C_3) , .Cin(S_37_46_55));

	Full_Adder F23 (.Sum(S_12) , .Cout(C_12) , .A(S_47_56_65) , .B(C_37_46_55) , .Cin(C_4));

	assign op_57 = operand2[5] & operand1[7];
	assign op_66 = operand2[6] & operand1[6];
	assign op_75 = operand2[7] & operand1[5];
	Full_Adder F24 (.Sum(S_57_66_75) , .Cout(C_57_66_75) , .A(op_57) , .B(op_66) , .Cin(op_75));
	
	

	//**********************************level 4************************************
	assign op_02 = operand2[0] & operand1[2];
	assign op_11 = operand2[1] & operand1[1];
	Half_Adder H7 (.Sum(S01) , .Cout(C01) , .A(op_02) , .B(op_11));

	assign op_21 = operand2[2] & operand1[1];
	assign op_30 = operand2[3] & operand1[0];
	Full_Adder F25 (.Sum(S02) , .Cout(C02) , .A(op_21) , .B(op_30) , .Cin(S_3_12));

	assign op_40 = operand2[4] & operand1[0];
	Full_Adder F26 (.Sum(S03) , .Cout(C03) , .A(S_5) , .B(op_40) , .Cin(C_3_12));

	assign op_50 = operand2[5] & operand1[0];
	Full_Adder F27 (.Sum(S04) , .Cout(C04) , .A(S_6) , .B(op_50) , .Cin(C_5));

	Full_Adder F28 (.Sum(S05) , .Cout(C05) , .A(S_7) , .B(C_6) , .Cin(C_32_41));
	
	Full_Adder F29 (.Sum(S06) , .Cout(C06) , .A(S_8) , .B(C_7) , .Cin(C_42_51_60));

	Full_Adder F30 (.Sum(S07) , .Cout(C07) , .A(S_9) , .B(C_8) , .Cin(C_52_61_70));
	
	Full_Adder F31 (.Sum(S08) , .Cout(C08) , .A(S_10) , .B(C_9) , .Cin(C_3443_62_71));

	Full_Adder F32 (.Sum(S09) , .Cout(C09) , .A(S_11) , .B(C_10) , .Cin(C_54_63_72));
	
	assign op_74 = operand2[7] & operand1[4];
	Full_Adder F33 (.Sum(S010) , .Cout(C010) , .A(S_12) , .B(op_74) , .Cin(C_11));

	Full_Adder F34 (.Sum(S011) , .Cout(C011) , .A(S_57_66_75) , .B(C_47_56_65) , .Cin(C_12));
	
	assign op_67 = operand2[6] & operand1[7];
	assign op_76 = operand2[7] & operand1[6];
	Full_Adder F35 (.Sum(S012) , .Cout(C012) , .A(op_67) , .B(C_57_66_75) , .Cin(op_76));



	//*****************************************last level************************
	assign op_01 = operand2[0] & operand1[1];
	assign op_00 = operand2[0] & operand1[0];
	assign op_10 = operand2[1] & operand1[0];
	assign op_20 = operand2[2] & operand1[0];
	assign op_77 = operand2[7] & operand1[7];


	assign Floor1 = {C012 , C011 , C010 , C09 , C08 , C07 
							, C06 , C05 , C04 , C03 , C02 , C01 
							, op_20 , op_10 , 1'b0};
	assign Floor2 = {op_77 , S012 , S011 , S010 , S09 , S08 , 
							S07 , S06 , S05 , S04 , S03 , S02
							, S01 , op_01 , op_00};
	
	assign Result = Floor1 + Floor2;
	
endmodule