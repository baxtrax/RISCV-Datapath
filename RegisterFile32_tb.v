/* A test bench to test the functionality of
 * a 32-bit Register File.
 *
 * Author: Bradley Gathers
 * Date: 2/13/2022
*/
module RegisterFile32_tb();

	// I/O and Parameters
	reg [31:0]dataIn;
	reg [4:0]rs1, rs2, rd;
	reg r, writeEn;
	wire [31:0]dataA, dataB;
	
	// Initial Setup
	initial begin
		r = 0;
		writeEn = 0;
		rs1 = 0;
		rs2 = 0;
		rd = 0;
		dataIn = 0;
	end
	
	RegisterFile32 DUT (.dataIn(dataIn), .dataA(dataA), .dataB(dataB), 
	                    .rs1(rs1), .rs2(rs2), .rd(rd), .r(r), .writeEn(writeEn));
	
	// Test series list
	initial begin
		r = 1;
		#10;
		r = 0;
		#10;
		
		$display("Starting simulation! :)");
		//Show wont work unless writeEn is needed
		dataIn = 32'h28111172;
		rd = 5'b00001;
		#10;
		writeEn = 1;
		#10;
		writeEn = 0;
		#50;

		dataIn = 32'h22857572;
		rd = 5'b00010;
		#10;
		writeEn = 1;
		#10;
		writeEn = 0;
		#50;


		rs1 = 5'b00001;
		rs2 = 5'b00010;
		#10;

		r = 1;
		#10
		r = 0;
		#10
		
		$display("Done simulation! :)");
		#100 $stop;
	end
endmodule

