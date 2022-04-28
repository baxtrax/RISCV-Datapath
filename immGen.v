/* A IMM Generator Module.
 * Extends the decoded IMM to a 32-bit number.
 *
 * Author: Bradley Gathers
*/
module immGen(inInstr, outIMM, sl);

	// I/O and Parameters
	input [31:0] inInstr;
	input [1:0] sl;
	output reg [31:0] outIMM;
	
	always @(*) begin
		case(sl)
			2'b00: begin
				outIMM[11:0] = inInstr[31:20]; // I-Type
				outIMM[31:12] = {20{inInstr[31]}};
			end
			2'b01: begin
				outIMM[11:0] = {inInstr[31:25], inInstr[11:7]}; // S-Type
				outIMM[31:12] = {20{inInstr[31]}};
			end
			2'b10: begin
				outIMM[11:0] = {{inInstr[7],inInstr[30:25],inInstr[11:8],1'b0}}; // B-Type
				outIMM[31:12] = {20{inInstr[7]}};
			end
		endcase
	end

endmodule