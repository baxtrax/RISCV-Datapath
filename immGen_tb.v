/* A test bench to test the functionality of
 * a IMM Generator Module.
 *
 * Author: Bradley Gathers
*/
module immGen_tb();

	// I/O and Parameters
	reg [31:0] inInstr;
	reg [1:0] sl;
	wire [31:0] outIMM;

	immGen DUT(inInstr, outIMM, sl);
	
	// Test
	initial begin     //    33222222222211111111119876543210 
		#10;           //    1098765432109876543210 
		sl = 2'b00;
		inInstr = 32'b11111111111100000000000000000000;
		#10;
		sl = 2'b01;
		inInstr = 32'b11111110000000000000111110000000;
		#10;
		sl = 2'b10;
		inInstr = 32'b01111110000000000000111110000000;
		#100 $stop;
	end
endmodule