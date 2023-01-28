// Test Bench for Processing Element (PE)
`timescale 1ns / 1ps
module PETest;
	// Inputs
	reg clock;
	reg [7:0] R, S1, S2; // memory inputs
   reg S1S2mux, newDist; // control input	
	// Outputs
   wire [7:0] Accumulate, Rpipe;
	// Instantiate the Design Under Test (DUT)
	PE dut (clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe);
	initial begin
		// Stimulus
		R = 3; S1 = 0; S2 = 5; S1S2mux = 0; newDist = 1;
		// 2 Clock Cycles with Period 10ns
		clock = 0; #5; clock = 1; #5; clock = 0; #5; clock = 1; #5;
		
		S1S2mux = 1; newDist = 0;
		clock = 0; #5; clock = 1; #5; clock = 0; #5; clock = 1; #5; clock = 0; #5; clock = 1; #5;
		
		R = 250;
		clock = 0; #5; clock = 1; #5; clock = 0; #5; clock = 1; #5; clock = 0; #5; clock = 1; #5;
	end
endmodule

