/* A Instruction Memory Module.
 * Has ROM that has Instruction stored. Also
 * decodes instruction into its components.
 *
 * Author: Bradley Gathers
*/
module instrMem(readAdrs, rd, rs1, rs2, instr);

	// I/O and Parameters
	input [6:0] readAdrs;
	output [4:0] rd;
	output [4:0] rs1;
	output [4:0] rs2;
	output [31:0] instr;
	
	// Connection between ROM and Instruction Decoder
	wire [31:0] instrToDecode;
	
	// Initilize ROM
	rom32x32 rom(.data_out(instrToDecode), .adrs(readAdrs), .cs(1'h0));
	
	// Decode Instruction
	assign rd = instrToDecode[11:7];
	assign rs1 = instrToDecode[19:15];
	assign rs2 = instrToDecode[24:20];
	assign instr = instrToDecode;

endmodule

/* A 32x32-bit ROM Module.
 * The Chipselect needs to be low to activate memory.
 *
 * Author: Bradley Gathers
 * Date: 3/23/2022
*/
module rom32x32(data_out, adrs, cs);

	// I/O and Parameters
	input cs; // Enable / Disable data lines
	input [6:0] adrs;
	output reg [31:0] data_out;
	reg [7:0] mem[127:0];
	
	always @(*) begin                                                             //#                |         rs2   rs1   fc3 rd    Opcode  |
		if (!cs) begin                                                             //#  | Data        | Binary                                |Instruction
			mem[0]   = 8'h00; mem[1]   = 8'h45; mem[2]   = 8'h06; mem[3]   = 8'h93; //0  | 00 45 06 93 | 0000000 00100 01010 000 01101 0010011 |addi a3,a0,4
			mem[4]   = 8'h00; mem[5]   = 8'h10; mem[6]   = 8'h07; mem[7]   = 8'h13; //1  | 00 10 07 13 | 0000000 00001 00000 000 01110 0010011 |addi a4,x0,1
			mem[8]   = 8'h00; mem[9]   = 8'hb7; mem[10]  = 8'h64; mem[11]  = 8'h63; //2  | 00 b7 64 63 | 0000000 01011 01110 110 01000 1100011 |bltu a4,a1,10
			mem[12]  = 8'h00; mem[13]  = 8'h00; mem[14]  = 8'h80; mem[15]  = 8'h67; //3  | 00 00 80 67 | 0000000 00000 00001 000 00000 1100111 |jalr x0,x1,0
			mem[16]  = 8'h00; mem[17]  = 8'h06; mem[18]  = 8'ha8; mem[19]  = 8'h03; //4  | 00 06 a8 03 | 0000000 00000 01101 010 10000 0000011 |lw   a6,0(a3)
			mem[20]  = 8'h00; mem[21]  = 8'h06; mem[22]  = 8'h86; mem[23]  = 8'h13; //5  | 00 06 86 13 | 0000000 00000 01101 000 01100 0010011 |addi a2,a3,0
			mem[24]  = 8'h00; mem[25]  = 8'h07; mem[26]  = 8'h07; mem[27]  = 8'h93; //6  | 00 07 07 93 | 0000000 00000 01110 000 01111 0010011 |addi a5,a4,0
			mem[28]  = 8'hff; mem[29]  = 8'hc6; mem[30]  = 8'h28; mem[31]  = 8'h83; //7  | ff c6 28 83 | 1111111 11100 01100 010 10001 0000011 |lw   a7,-4(a2)
			mem[32]  = 8'h01; mem[33]  = 8'h18; mem[34]  = 8'h5a; mem[35]  = 8'h63; //8  | 01 18 5a 63 | 0000000 10001 10000 101 10100 1100011 |bge  a6,a7,34
			mem[36]  = 8'h01; mem[37]  = 8'h16; mem[38]  = 8'h20; mem[39]  = 8'h23; //9  | 01 16 20 23 | 0000000 10001 01100 010 00000 0100011 |sw   a7,0(a2)
			mem[40]  = 8'hff; mem[41]  = 8'hf7; mem[42]  = 8'h87; mem[43]  = 8'h93; //10 | ff f7 87 93 | 1111111 11111 01111 000 01111 0010011 |addi a5,a5,-1
			mem[44]  = 8'hff; mem[45]  = 8'hc6; mem[46]  = 8'h06; mem[47]  = 8'h13; //11 | ff c6 06 13 | 1111111 11100 01100 000 01100 0010011 |addi a2,a2,-4
			mem[48]  = 8'hfe; mem[49]  = 8'h07; mem[50]  = 8'h96; mem[51]  = 8'he3; //12 | fe 07 96 e3 | 1111111 00000 01111 001 01101 1100011 |bne  a5,x0,1c
			mem[52]  = 8'h00; mem[53]  = 8'h27; mem[54]  = 8'h97; mem[55]  = 8'h93; //13 | 00 27 97 93 | 0000000 00010 01111 001 01111 0010011 |slli a5,a5,0x2
			mem[56]  = 8'h00; mem[57]  = 8'hf5; mem[58]  = 8'h07; mem[59]  = 8'hb3; //14 | 00 f5 07 b3 | 0000000 01111 01010 000 01111 0110011 |add  a5,a0,a5
			mem[60]  = 8'h01; mem[61]  = 8'h07; mem[62]  = 8'ha0; mem[63]  = 8'h23; //15 | 01 07 a0 23 | 0000000 10000 01111 010 00000 0100011 |sw   a6,0(a5)
			mem[64]  = 8'h00; mem[65]  = 8'h17; mem[66]  = 8'h07; mem[67]  = 8'h13; //16 | 00 17 07 13 | 0000000 00001 01110 000 01110 0010011 |addi a4,a4,1
			mem[68]  = 8'h00; mem[69]  = 8'h46; mem[70]  = 8'h86; mem[71]  = 8'h93; //17 | 00 46 86 93 | 0000000 00100 01101 000 01101 0010011 |addi a3,a3,4
			mem[72]  = 8'hfc; mem[73]  = 8'h1f; mem[74]  = 8'hf0; mem[75]  = 8'h6f; //18 | fc 1f f0 6f | 1111110 00001 11111 111 00000 1101111 |jal  x0, 8
			mem[76]  = 8'h00; mem[77]  = 8'h00; mem[78]  = 8'h00; mem[79]  = 8'h00; //19 | 00 00 00 00 |
			mem[80]  = 8'h00; mem[81]  = 8'h00; mem[82]  = 8'h00; mem[83]  = 8'h00; //20 | 00 00 00 00 |
			mem[84]  = 8'h00; mem[85]  = 8'h00; mem[86]  = 8'h00; mem[87]  = 8'h00; //21 | 00 00 00 00 |
			mem[88]  = 8'h00; mem[89]  = 8'h00; mem[90]  = 8'h00; mem[91]  = 8'h00; //22 | 00 00 00 00 |
			mem[92]  = 8'h00; mem[93]  = 8'h00; mem[94]  = 8'h00; mem[95]  = 8'h00; //23 | 00 00 00 00 |
			mem[96]  = 8'h00; mem[97]  = 8'h00; mem[98]  = 8'h00; mem[99]  = 8'h00; //24 | 00 00 00 00 |
			mem[100] = 8'h00; mem[101] = 8'h00; mem[102] = 8'h00; mem[103] = 8'h00; //25 | 00 00 00 00 |
			mem[104] = 8'h00; mem[105] = 8'h00; mem[106] = 8'h00; mem[107] = 8'h00; //26 | 00 00 00 00 |
			mem[108] = 8'h00; mem[109] = 8'h00; mem[110] = 8'h00; mem[111] = 8'h00; //27 | 00 00 00 00 |
			mem[112] = 8'h00; mem[113] = 8'h00; mem[114] = 8'h00; mem[115] = 8'h00; //28 | 00 00 00 00 |
			mem[116] = 8'h00; mem[117] = 8'h00; mem[118] = 8'h00; mem[119] = 8'h00; //29 | 00 00 00 00 |
			mem[120] = 8'h00; mem[121] = 8'h00; mem[122] = 8'h00; mem[123] = 8'h00; //30 | 00 00 00 00 |
			mem[124] = 8'h00; mem[125] = 8'h00; mem[126] = 8'h00; mem[127] = 8'h00; //31 | 00 00 00 00 |
			data_out = {mem[adrs], mem[adrs+1], mem[adrs+2], mem[adrs+3]};
		end
	end

endmodule