/* A 31x1 multiplexer.
 *
 * Author: Bradley Gathers
 * Date: 2/13/2022
*/
module mux32x1(sl,
					in0,  in1,  in2,  in3, 
					in4,  in5,  in6,  in7, 
					in8,  in9,  in10, in11, 
					in12, in13, in14, in15,
					in16, in17, in18, in19,
					in20, in21, in22, in23,
					in24, in25, in26, in27,
					in28, in29, in30, in31,	
					out);
	// I/O and Parameters
	// Normally set to 32, but for testing
	// and simulation set it to 8 to save inputs.
	parameter N = 32;
	input [4:0] sl;
	input [N-1:0]  in0,  in1,  in2,  in3, 
						in4,  in5,  in6,  in7, 
						in8,  in9,  in10, in11, 
						in12, in13, in14, in15,
						in16, in17, in18, in19,
						in20, in21, in22, in23,
						in24, in25, in26, in27,
						in28, in29, in30, in31;
	output reg [N-1:0] out;
	
	//Case Loop for output swapping
	always @(*) begin
		case(sl)
			5'h0  : out <= in0;
			5'h1  : out <= in1;
			5'h2  : out <= in2;
			5'h3  : out <= in3;
			5'h4  : out <= in4;
			5'h5  : out <= in5;
			5'h6  : out <= in6;
			5'h7  : out <= in7;
			5'h8  : out <= in8;
			5'h9  : out <= in9;
			5'ha  : out <= in10;
			5'hb  : out <= in11;
			5'hc  : out <= in12;
			5'hd  : out <= in13;
			5'he  : out <= in14;
			5'hf  : out <= in15;
			5'h10 : out <= in16;
			5'h11 : out <= in17;
			5'h12 : out <= in18;
			5'h13 : out <= in19;
			5'h14 : out <= in20;
			5'h15 : out <= in21;
			5'h16 : out <= in22;
			5'h17 : out <= in23;
			5'h18 : out <= in24;
			5'h19 : out <= in25;
			5'h1a : out <= in26;
			5'h1b : out <= in27;
			5'h1c : out <= in28;
			5'h1d : out <= in29;
			5'h1e : out <= in30;
			5'h1f : out <= in31;
			default: out <= 0;
		endcase
	end				
endmodule