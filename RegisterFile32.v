/* A 32-bit Register File. Contains
 * 32, 32-bit registers which are indivually
 * addressable.
 *
 * Author: Bradley Gathers
 * Date: 2/13/2022
*/
module RegisterFile32(dataIn, dataA, dataB, rs1, rs2, rd, r, writeEn);

	// I/O and Parameters
	input [31:0]dataIn;
	input [4:0]rs1, rs2, rd;
	input r, writeEn;
	output wire [31:0]dataA, dataB;
	
	wire [31:0]de_out;
	
	wire [31:0]reg_out_0;
	wire [31:0]reg_out_1;
	wire [31:0]reg_out_2;
	wire [31:0]reg_out_3;
	wire [31:0]reg_out_4;
	wire [31:0]reg_out_5;
	wire [31:0]reg_out_6;
	wire [31:0]reg_out_7;
	wire [31:0]reg_out_8;
	wire [31:0]reg_out_9;
	wire [31:0]reg_out_10;
	wire [31:0]reg_out_11;
	wire [31:0]reg_out_12;
	wire [31:0]reg_out_13;
	wire [31:0]reg_out_14;
	wire [31:0]reg_out_15;
	wire [31:0]reg_out_16;
	wire [31:0]reg_out_17;
	wire [31:0]reg_out_18;
	wire [31:0]reg_out_19;
	wire [31:0]reg_out_20;
	wire [31:0]reg_out_21;
	wire [31:0]reg_out_22;
	wire [31:0]reg_out_23;
	wire [31:0]reg_out_24;
	wire [31:0]reg_out_25;
	wire [31:0]reg_out_26;
	wire [31:0]reg_out_27;
	wire [31:0]reg_out_28;
	wire [31:0]reg_out_29;
	wire [31:0]reg_out_30;
	wire [31:0]reg_out_31;
	
	//Setup decoder for rd
	decoder5x32 d1 (.sl(rd), .en(writeEn), .out(de_out));
	
	//Setup transfer of decoder to Registers
	RegisterNBit r0 (.Q(reg_out_0), .D(dataIn), .L(de_out[0]), .R(r));
	RegisterNBit r1 (.Q(reg_out_1), .D(dataIn), .L(de_out[1]), .R(r));
	RegisterNBit r2 (.Q(reg_out_2), .D(dataIn), .L(de_out[2]), .R(r));
	RegisterNBit r3 (.Q(reg_out_3), .D(dataIn), .L(de_out[3]), .R(r));
	RegisterNBit r4 (.Q(reg_out_4), .D(dataIn), .L(de_out[4]), .R(r));
	RegisterNBit r5 (.Q(reg_out_5), .D(dataIn), .L(de_out[5]), .R(r));
	RegisterNBit r6 (.Q(reg_out_6), .D(dataIn), .L(de_out[6]), .R(r));
	RegisterNBit r7 (.Q(reg_out_7), .D(dataIn), .L(de_out[7]), .R(r));
	RegisterNBit r8 (.Q(reg_out_8), .D(dataIn), .L(de_out[8]), .R(r));
	RegisterNBit r9 (.Q(reg_out_9), .D(dataIn), .L(de_out[9]), .R(r));
	RegisterNBit r10 (.Q(reg_out_10), .D(dataIn), .L(de_out[10]), .R(r));
	RegisterNBit r11 (.Q(reg_out_11), .D(dataIn), .L(de_out[11]), .R(r));
	RegisterNBit r12 (.Q(reg_out_12), .D(dataIn), .L(de_out[12]), .R(r));
	RegisterNBit r13 (.Q(reg_out_13), .D(dataIn), .L(de_out[13]), .R(r));
	RegisterNBit r14 (.Q(reg_out_14), .D(dataIn), .L(de_out[14]), .R(r));
	RegisterNBit r15 (.Q(reg_out_15), .D(dataIn), .L(de_out[15]), .R(r));
	RegisterNBit r16 (.Q(reg_out_16), .D(dataIn), .L(de_out[16]), .R(r));
	RegisterNBit r17 (.Q(reg_out_17), .D(dataIn), .L(de_out[17]), .R(r));
	RegisterNBit r18 (.Q(reg_out_18), .D(dataIn), .L(de_out[18]), .R(r));
	RegisterNBit r19 (.Q(reg_out_19), .D(dataIn), .L(de_out[19]), .R(r));
	RegisterNBit r20 (.Q(reg_out_20), .D(dataIn), .L(de_out[20]), .R(r));
	RegisterNBit r21 (.Q(reg_out_21), .D(dataIn), .L(de_out[21]), .R(r));
	RegisterNBit r22 (.Q(reg_out_22), .D(dataIn), .L(de_out[22]), .R(r));
	RegisterNBit r23 (.Q(reg_out_23), .D(dataIn), .L(de_out[23]), .R(r));
	RegisterNBit r24 (.Q(reg_out_24), .D(dataIn), .L(de_out[24]), .R(r));
	RegisterNBit r25 (.Q(reg_out_25), .D(dataIn), .L(de_out[25]), .R(r));
	RegisterNBit r26 (.Q(reg_out_26), .D(dataIn), .L(de_out[26]), .R(r));
	RegisterNBit r27 (.Q(reg_out_27), .D(dataIn), .L(de_out[27]), .R(r));
	RegisterNBit r28 (.Q(reg_out_28), .D(dataIn), .L(de_out[28]), .R(r));
	RegisterNBit r29 (.Q(reg_out_29), .D(dataIn), .L(de_out[29]), .R(r));
	RegisterNBit r30 (.Q(reg_out_30), .D(dataIn), .L(de_out[30]), .R(r));
	RegisterNBit r31 (.Q(reg_out_31), .D(dataIn), .L(de_out[31]), .R(r));
	
	//Registers to Mux
	mux32x1 muxA (.sl(rs1),
					.in0(reg_out_0),  .in1(reg_out_1),  .in2(reg_out_2),  .in3(reg_out_3), 
					.in4(reg_out_4),  .in5(reg_out_5),  .in6(reg_out_6),  .in7(reg_out_7), 
					.in8(reg_out_8),  .in9(reg_out_9),  .in10(reg_out_10), .in11(reg_out_11), 
					.in12(reg_out_12), .in13(reg_out_13), .in14(reg_out_14), .in15(reg_out_15),
					.in16(reg_out_16), .in17(reg_out_17), .in18(reg_out_18), .in19(reg_out_19),
					.in20(reg_out_20), .in21(reg_out_21), .in22(reg_out_22), .in23(reg_out_23),
					.in24(reg_out_24), .in25(reg_out_25), .in26(reg_out_26), .in27(reg_out_27),
					.in28(reg_out_28), .in29(reg_out_29), .in30(reg_out_30), .in31(reg_out_31),	
					.out(dataA));
					
	mux32x1 muxB (.sl(rs2),
					.in0(reg_out_0),  .in1(reg_out_1),  .in2(reg_out_2),  .in3(reg_out_3), 
					.in4(reg_out_4),  .in5(reg_out_5),  .in6(reg_out_6),  .in7(reg_out_7), 
					.in8(reg_out_8),  .in9(reg_out_9),  .in10(reg_out_10), .in11(reg_out_11), 
					.in12(reg_out_12), .in13(reg_out_13), .in14(reg_out_14), .in15(reg_out_15),
					.in16(reg_out_16), .in17(reg_out_17), .in18(reg_out_18), .in19(reg_out_19),
					.in20(reg_out_20), .in21(reg_out_21), .in22(reg_out_22), .in23(reg_out_23),
					.in24(reg_out_24), .in25(reg_out_25), .in26(reg_out_26), .in27(reg_out_27),
					.in28(reg_out_28), .in29(reg_out_29), .in30(reg_out_30), .in31(reg_out_31),	
					.out(dataB));
endmodule