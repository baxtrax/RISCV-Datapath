/* A test bench to test the functionality of
 * 5x32 encoder.
 *
 * Author: Bradley Gathers
 * Date: 2/9/2022
*/
module decoder5x32_tb();

	// I/O and Parameters
	reg en;
	reg [4:0] sl;
	wire [31:0] out;
	integer i;
	
	// Initial Setup
	initial begin
		en = 0;
		sl = 0;
	end
	
	decoder5x32 DUT (sl, en, out);
	
	// Test Loop
	initial begin
		//These can be any combination, these are just for a simple check.
		$display("Starting simulation! :)");		
		en = 1;
		#10
		for (i = 0; i < 32; i = i + 1) begin
			sl = i;
			#10;
		end
		$display("Done simulation! :)");
		#100 $stop;
	end
endmodule