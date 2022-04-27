/* A 5x32 decoder that can be dynamically scaled
 * to any N-bit value.
 *
 * Author: Bradley Gathers
 * Date: 2/13/2022
*/
module decoder5x32(sl, en, out);
	// I/O and Parameters
	parameter inN = 5;
	parameter outN = 32;
	input en;
	input [inN-1:0] sl;
	output wire [outN-1:0] out;
	
	/* Simple 1 line command to shift
	* output by the select ammount
	* this results in a perfect
	* Truthtable of a decoder!
	*/
	assign out = en ? (1 << sl) : 0;
endmodule