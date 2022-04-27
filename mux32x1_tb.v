/* A test bench to test the functionality of
 * 32x1 mux.
 *
 * Author: Bradley Gathers
 * Date: 2/9/2022
*/
module mux32x1_tb();

	// I/O and Parameters
	reg [4:0] sl;
	reg [31:0] in0,  in1,  in2,  in3, 
					in4,  in5,  in6,  in7, 
					in8,  in9,  in10, in11, 
					in12, in13, in14, in15,
					in16, in17, in18, in19,
					in20, in21, in22, in23,
					in24, in25, in26, in27,
					in28, in29, in30, in31;
	wire [31:0]	out;
	integer i;
	
	// Initial Setup
	initial begin
		sl = 0;
		in0 = 32'h1;  
		in1 = 32'h2;
		in2 = 32'h3;  
		in3 = 32'h4;
		in4 = 32'h5;  
		in5 = 32'h6;  
		in6 = 32'h7;  
		in7 = 32'h8; 
		in8 = 32'h9;  
		in9 = 32'ha;  
		in10 = 32'hb;
		in11 = 32'hc;
		in12 = 32'hd;
		in13 = 32'he;
		in14 = 32'hf;
		in15 = 32'h10;
		in16 = 32'h11;
		in17 = 32'h12;
		in18 = 32'h13;
		in19 = 32'h14;
		in20 = 32'h15;
		in21 = 32'h16;
		in22 = 32'h17;
		in23 = 32'h18;
		in24 = 32'h19;
		in25 = 32'h1a;
		in26 = 32'h1b;
		in27 = 32'h1c;
		in28 = 32'h1d;
		in29 = 32'h1e;
		in30 = 32'h1f;
		in31 = 32'h20;
	end
	
	mux32x1 DUT (sl,
					in0,  in1,  in2,  in3, 
					in4,  in5,  in6,  in7, 
					in8,  in9,  in10, in11, 
					in12, in13, in14, in15,
					in16, in17, in18, in19,
					in20, in21, in22, in23,
					in24, in25, in26, in27,
					in28, in29, in30, in31,	
					out);
	
	// Test Loop
	initial begin
		//These can be any combination, these are just for a simple check.
		$display("Starting simulation! :)");
		#10
		for (i = 0; i < 5; i = i + 1) begin
			sl = i;
			#10;
		end
		$display("Done simulation! :)");
		#100 $stop;
	end
endmodule