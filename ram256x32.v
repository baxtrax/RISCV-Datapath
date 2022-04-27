/* A 256x32-bit RAM Module.
 * The Chipselect needs to be low to activate memory.
 * rw = 0 : Read 
 * rw = 1 : Write
 *
 * Author: Bradley Gathers
 * Date: 3/23/2022
*/
module ram256x32(data_in, data_out, adrs, cs, rw);

	// I/O and Parameters
	input cs; // Enable / Disable data lines
	input rw;
	input [7:0] adrs;
	input [31:0] data_in;
	output reg [31:0] data_out;
	reg [31:0] mem[255:0];
	
	always @(*) begin
		if (!cs) begin
			if (rw) begin
			mem[adrs] <= data_in; // Write
			end 
			else begin
			data_out <= mem[adrs]; // Read
			end
		end
	end

endmodule