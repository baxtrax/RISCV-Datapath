/* A Program Counter Module.
 * Used to store the next address of instruction 
 * to compute.
 *
 * Author: Bradley Gathers
*/
module pc(in, out, rst, clk);

	// I/O and Parameters
	input rst, clk;
	input [6:0] in;
	output reg [6:0] out;
	
	always @(posedge clk or posedge rst) begin
		if (rst) out <= 7'h0;
		else out <= in; 
	end

endmodule