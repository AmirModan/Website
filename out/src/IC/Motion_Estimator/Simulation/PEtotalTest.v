// Test Bench for Total 16 Processing Elements (PEtotal)
`timescale 1ns / 1ps
module PEtotalTest;
	// Inputs
	reg clock;
	reg [7:0] R, S1, S2; // memory inputs
   reg [15:0] S1S2mux, newDist; // control input
	// Output
   wire [127:0] Accumulate;
	integer i;
	// Instantiate the Design Under Test (DUT)
	PEtotal dut (clock, R, S1, S2, S1S2mux, newDist, Accumulate);
	initial begin
		// Stimulus
		R = 3; S1 = 2; S2 = 8;
		S1S2mux = 16'b1111010100110001;
		newDist = 16'b1111111111111111;
		// 16 Clock Cycles with Period 10ns
		for (i = 0; i < 16; i=i+1)
		begin
			clock = 0; #5; clock = 1; #5;
		end
		
		S1S2mux = 16'b0110001101110110;
		newDist = 16'b0101101110110011;
		for (i = 0; i < 16; i=i+1)
		begin
			clock = 0; #5; clock = 1; #5;
		end
	end
endmodule

