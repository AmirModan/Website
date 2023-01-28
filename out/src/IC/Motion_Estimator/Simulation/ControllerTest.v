// Test Bench for Control Unit
`timescale 1ns / 1ps
module controlTest;
	reg clock;
   reg start; // = 1 when going
   wire [15:0] S1S2mux, newDist, PEready;
   wire CompStart;
   wire [3:0] VectorX, VectorY;
   wire [7:0] AddressR;
   wire [9:0] AddressS1, AddressS2;
	integer i;
	// Instantiate the Design Under Test (DUT)
	control dut (clock, start, S1S2mux, newDist, CompStart, PEready, VectorX, VectorY, AddressR, AddressS1, AddressS2);
	initial begin
		// Stimulus
		start = 0;
		// 2 Clock Cycles with Period 10ns
		clock = 0; #1; clock = 1; #1; clock = 0; #1; clock = 1; #1;
		
		start = 1;
		for (i = 0; i < 4112; i=i+1)
		begin
			clock = 0; #1; clock = 1; #1;
		end
	end
endmodule

