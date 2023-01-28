// Test Bench for Top Module
`timescale 1ns / 1ps
module MotionEstimatorTest;
	reg clock, start;
	wire [7:0] BestDist;
   wire [3:0] motionX, motionY;
	wire [7:0] R, S1, S2;
   wire [7:0] AddressR;
   wire [9:0] AddressS1, AddressS2;
	integer i;

	
	ROM_R memR_u(clock, AddressR, R);

	ROM_S memS_u(clock, AddressS1, AddressS2, S1, S2);
	// Instantiate the Design Under Test (DUT)
	MotionEstimator dut (clock, start, R, S1, S2, BestDist, motionX, motionY, AddressR, AddressS1, AddressS2);
	
	initial begin
		start = 0;
		// 2 Clock Cycles with Period 10ns
		clock = 0; #1; clock = 1; #1; clock = 0; #1; clock = 1; #1;
	
		// Stimulus
				
		start = 1;
		for (i = 0; i < 4112; i=i+1)
		begin
			clock = 0; #1; clock = 1; #1;
		end
	end
endmodule

