/* A test bench to test the functionality of
 * a Program Counter Module.
 *
 * Author: Bradley Gathers
*/
module pc_tb();

	// I/O and Parameters
	reg rst, clk; 
	reg[6:0] in;
	wire [6:0] out;
	integer i;

	
	// Initial Setup
	initial begin
		rst = 1'h0;
		clk = 1'h0;
		in = 7'h0;
		
	end
	
	pc DUT(.in(in), .out(out), .rst(rst), .clk(clk));
	
	always #5 clk = !clk;
	
	// Test
	initial begin
		$display("Starting simulation! :)");
		rst = 1'h1;
		#10;
		rst = 1'h0;
		
		$display("Incrementing PC");  
		for (i = 0; i < 125; i = i + 4) begin
			in = i;
			$display("Next Address: %d Incoming Address: %d", out, in);
			#10;
		end
		
		rst = 1'h1;
		$display("Incrementng PC w/ reset");  
		for (i = 0; i < 125; i = i + 4) begin
			in = i;
			$display("Next Address: %d Incoming Address: %d", out, in);
			#10;
		end
		
		$display("Done simulation! :)");
		#100 $stop;
	end
endmodule