/* A test bench to test the functionality of
 * the 32bit ALU.
 *
 * Author: Bradley Gathers
 * Date: 3/3/2022
*/

//ALUSRC
// 0 is IMM value
// 1 is B Value

//WB
// 0 Bypass RAM
// 1 Result from RAM
module datapath_tb();
	//rst, clk, instr, regRW, ALUsrc, immsrc, ALUop, status, mRW, wb, pcsrc
	// I/O and Parameters
	reg rst, clk, regRW, ALUsrc, mRW, wb, pcsrc;
	reg [1:0] immsrc;
	reg [4:0] ALUop;
	wire [31:0] instr;
	wire [3:0] status;
	
		// Initial Setup
	initial begin
		rst = 1'b0;
		clk = 1'b0;
	end
	
	always #5 clk = !clk;
	
	// Initialize the DUT
	datapath DUT(.rst(rst), 
					 .clk(clk), 
					 .instr(instr), 
					 .regRW(regRW), 
					 .ALUsrc(ALUsrc), 
					 .immsrc(immsrc), 
					 .ALUop(ALUop), 
					 .status(status), 
					 .mRW(mRW), 
					 .wb(wb), 
					 .pcsrc(pcsrc));
					 

	// Initial Setup
	initial begin
	
	   regRW = 1'b0; 
		ALUsrc = 1'b0; 
		mRW = 1'b0;
		wb = 1'b1;
		pcsrc = 1'b0;
		
		immsrc = 1'b0;
		ALUsrc = 1'b0;
		ALUop = 5'b00000;
		wb = 1'b0;  
		rst = 1'b1;
		#10;
		rst = 1'b0;		
		
		#100 $stop;
	end
endmodule