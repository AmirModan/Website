// Test Bench for Comparator Unit
`timescale 1ns / 1ps
module ComparatorTest;
	// Inputs
	reg clock;
	reg CompStart; // goes high when distortion calculation start
   reg [8*16-1:0] PEout; // outputs of PEs as one long vector
   reg [15:0] PEready; // goes high when that PE has a new distortion
   reg [3:0] vectorX, vectorY; // motion vector being evaluated
	// Outputs
   wire [7:0] BestDist; // best distortion vector so far
   wire [3:0] motionX, motionY; // best motion vector so far
	// Instantiate the Design Under Test (DUT)
	Comparator dut (clock, CompStart, PEout, PEready, vectorX, vectorY, BestDist, motionX, motionY);
	initial begin
		// Stimulus
		CompStart = 0; vectorX = 0; vectorY = 0; PEready = 16'b0000000000000001;
		PEout = 128'h00FFFFFFFFFFFFFFFFFFFFFF050203FE;
		// 1 Clock Cycle with Period 10ns
		clock = 0; #5; clock = 1; #5;
		
		CompStart = 1; vectorX = 3; vectorY = 2;
		clock = 0; #5; clock = 1; #5;
		
		PEready = 16'b0000000000000010; vectorX = 10; vectorY = 8;
		clock = 0; #5; clock = 1; #5;
		
		PEready = 16'b0000000000000100; vectorX = 3; vectorY = 5;
		clock = 0; #5; clock = 1; #5;

		PEready = 16'b0000000000001000; vectorX = 1; vectorY = 1;
		clock = 0; #5; clock = 1; #5;
	end
endmodule

