/* A test bench to test the functionality of
 * a Instruction Memory Module.
 *
 * Author: Bradley Gathers
*/
module instrMem_tb();

	// I/O and Parameters
	reg[6:0] readAdrs; 
	wire [4:0] rd;
	wire [4:0] rs1;
	wire [4:0] rs2;
	wire [31:0] instr;
	integer i;

	
	// Initial Setup
	initial begin
		readAdrs = 7'h0;
	end
	
	instrMem DUT(.readAdrs(readAdrs), .rd(rd), .rs1(rs1), .rs2(rs2), .instr(instr));
	
	// Test
	initial begin
		$display("Starting simulation! :)");
		#10;
		
		$display("Incrementing Read Address");  
		for (i = 0; i < 125; i = i + 4) begin
			readAdrs = i;
			$display("Address %d: RD: %d, RS1: %d, RS2: %d, IMM: %d", readAdrs, rd, rs1, rs2, instr);
			#10;
		end
		
		$display("Done simulation! :)");
		#100 $stop;
	end
endmodule