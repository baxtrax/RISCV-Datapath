/* A test bench to test the functionality of
 * the 32bit ALU.
 *
 * Author: Bradley Gathers
 * Date: 3/3/2022
*/
module alu32_tb();

	// I/O and Parameters
	parameter N = 32;
	reg [N-1:0] a,b;               
	reg [5:0] opCode;
	wire [N-1:0] out;
	wire [3:0] S;
	
	integer i;
	
	// Initialize the DUT
	alu32 DUT(.a(a),.b(b),.opCode(opCode),.out(out),.S(S));

	// Initial Setup
	initial begin
		//Test Opcodes
		a = 32'h7;
		b = 32'h2;
		opCode = 5'h0;
		#10;
		for (i=0; i<8; i=i+1) begin
			opCode = opCode + 1'b1;
			#10;
		end
		#20;
		opCode = 5'h0;
		
		// Test co & overflow
		a = 32'hffffffff;
		b = 32'hffffffff;
		#10;
		// Test zero condition
		a = 32'h00000000;
		b = 32'h00000000;
		#10;
		//Test negative flag
		a = 32'h80000004;
		b = 32'h00000001;
		#10;
		
		#100 $stop;
	end
endmodule