/* A N bit Register that can specified to
 * any bit width.
 *
 * Author: Bradley Gathers
 * Date: 2/13/2022
*/
module RegisterNBit(Q,D,L,R);
	// I/O and Parameters
	parameter N = 32;
	
	output reg [N-1:0]Q;
	input [N-1:0]D;
	input L;
	input R;
	
	//Synchronous Logic Loop
	always @(*) begin
		if (R) Q = 0;
		else if (L) Q= D;
		else Q = Q;
	end
endmodule