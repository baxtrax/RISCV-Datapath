/* A 32bit ALU.
 *
 * Author: Bradley Gathers
 * Date: 3/3/2022
*/
module alu32(a,b,opCode,out,S);

	// I/O and Parameters
	parameter N = 32;

	input [N-1:0] a,b;                
	input [4:0] opCode;
	output [N-1:0] out; 
	output [3:0] S;
	 
	reg [N-1:0] ALU_Result;
	reg [N-2:0] tmpA;
	reg [N-2:0] tmpB;
	
	//Statuses
	wire co, neg, over, zero;
	
	// Assign Statements for Statuses
	assign neg = a[N-1] ^ b[N-1]; // Negative
	assign co = ALU_Result[N-1];  // Carryout
	assign over = ((a[N-1] & b[N-1]) | (~a[N-1] & ~b[N-1])); // Overflow
	assign zero = (ALU_Result[N-2:0] == 0) ? 1'b1 : 1'b0; // Zero
	assign S = {co, neg, over, zero};
	
	// Output Assignment
	assign out = {neg, ALU_Result[N-2:0]}; // ALU out
	
	always @(*) begin
		tmpA = a[N-2:0];
		tmpB = b[N-2:0];
		if (a[N-1]) tmpA = ~tmpA+1'b1;
		if (b[N-1]) tmpB = ~tmpB+1'b1;
	
		case(opCode)
			5'b00000: ALU_Result = tmpA + tmpB;    // Addition
			5'b00001: ALU_Result = tmpA - tmpB;    // Subtraction
			5'b00010: ALU_Result = tmpA ^ tmpB;    // Logical xor 
			5'b00011: ALU_Result = tmpA & tmpB;    // Logical and 
			5'b00100: ALU_Result = tmpA | tmpB;    // Logical or
			5'b00101: ALU_Result = ~(tmpA | tmpB); // Logical nor
			5'b00110: ALU_Result = tmpA<<tmpB;     // Logical shift left
			5'b00111: ALU_Result = tmpA>>tmpB;     // Logical shift right
			default: ALU_Result = tmpA + tmpB;    // Default is add 
		endcase
		
		if (neg) ALU_Result = ~ALU_Result+1'b1;
	end
endmodule