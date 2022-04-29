/* A Datapath module that can
 * be used along with a Control
 * unit to create a CPU.
 *
 * Author: Bradley Gathers
*/
module datapath(rst, clk, instr, regRW, ALUsrc, immsrc, ALUop, status, mRW, wb, pcsrc);

	// I/O and Parameters
	input rst, clk, regRW, ALUsrc, mRW, wb, pcsrc;
	input [1:0] immsrc;
	input [4:0] ALUop;
	output [31:0] instr;
	output [3:0] status;
	
	//PC and Beq Handling
	wire [6:0] pc_out, pc4, pcbranch, finalPCMUXout;
	
	// To Register File
	wire [4:0] rd, rs1, rs2;
	wire [31:0] final_out;
	
	//ALUsrc MUX
	wire [31:0] inB_inmux, inIMM_inmux;
	
	// To ALU
	wire [31:0] inA, inB_outmux;
	
	// To RAM
	wire [31:0] toRAMadrs;
	
	// To WB MUX
	wire [31:0] outRAM;
	
	assign pc4 = pc_out + 7'd4;
	assign pcbranch = pc_out + inIMM_inmux;
	
	pc u1(.in(finalPCMUXout), .out(pc_out), .rst(rst), .clk(clk));
	
	instrMem u2(.readAdrs(pc_out), .rd(rd), .rs1(rs1), .rs2(rs2), .instr(instr));
	
	immGen u3(.inInstr(instr), .outIMM(inIMM_inmux), .sl(immsrc));
	
	RegisterFile32 u4(.dataIn(final_out), .dataA(inA), .dataB(inB_inmux), .rs1(rs1), .rs2(rs2), .rd(rd), .r(r), .writeEn(regRW));
	
	mux2x1 u5(.in1(inB_inmux), .in2(inIMM_inmux), .out(inB_outmux), .sl(ALUsrc));
	
	alu32 u6(.a(inA), .b(inB_outmux), .opCode(ALUop), .out(toRAMadrs), .S(status));
	
	ram256x32 u7(.data_in(inB_inmux), .data_out(outRAM), .adrs(toRAMadrs[7:0]), .cs(1'b0), .rw(mRW));
	
	mux2x1 u8(.in1(outRAM), .in2(toRAMadrs), .out(final_out), .sl(wb));
	
	mux2x1x7b u9(.in1(pc4), .in2(pcbranch), .out(finalPCMUXout), .sl(pcsrc));
	
	always@(posedge clk) begin
	
	$display("====LOOP=============================");
	$display("====PROGRAM COUNTER====");
	$display("pc_out: %b", pc_out);
	$display("pc4: %b", pc4);
	$display("pcbranch: %b", pcbranch);
	$display("finalPCMUXout: %b", finalPCMUXout);
	
	$display("====IMM Gen====");
	$display("inIMM_inmux: %b", inIMM_inmux);
	
	$display("====REGISTER FILE====");
	$display("rd: %b", rd);
	$display("rs1: %b", rs1);
	$display("rs2: %b", rs2);
	$display("inA: %b", inA);
	$display("inB_inmux: %b", inB_inmux);
	$display("final_out: %b", final_out);
	
	$display("====ALU====");
	$display("inA: %b", inA);
	$display("inB_outmux: %b", inB_outmux);
	$display("toRAMadrs: %b", toRAMadrs);
	
	$display("====RAM====");
	$display("toRAMadrs: %b", toRAMadrs);
	$display("outRAM: %b", outRAM);
	$display("=====================================");
	end
	

endmodule

module mux2x1(in1, in2, out, sl);
input sl;
input[31:0] in1, in2;
output[31:0] out;

assign out = sl ? in1 : in2;
endmodule

module mux2x1x7b(in1, in2, out, sl);
input sl;
input[6:0] in1, in2;
output[6:0] out;

assign out = sl ? in1 : in2;
endmodule