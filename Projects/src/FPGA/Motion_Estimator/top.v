// Include the top-level pin ip file
`include "../hdl/pin_ip.v"

// GUI is DE10-Lite, but actual FPGA is DE0-CV

module top( input CYCLONEV_CLK_50 );
	
	// Peripheral interconnect wires
		
		// Use these wires to feed outputs to LED widgets
		wire [9:0] 	LEDR;
		// Use these wires as 8-bit active-low 7-segment
		// outputs, where the 8th bit is the decimal point
		wire [7:0] 	HEX0, HEX1, HEX2,
				HEX3, HEX4, HEX5;
		// Use these wires as slide switch inputs
		wire [9:0] 	SW;
		// Use these wires as active low, push-button inputs
		wire [1:0]	KEY;
		// These function as programmable register inputs to a
		// design, useful for adjusting inputs using a keyboard
		wire [31:0] param1, param2, param3;
	
	// User instantiates design below
											
		/*
		**
		**	Instantiated design connects to pin_ip connected wires
		** these wires function as memory-mapped i/o which is
		** translated to widgets on the GUI
		**
		*/
		
		reg [7:0] Number[0:15];
		
		//Starts Motion Estimation using Slide Switch
		reg start;
		
		//Shift Memory Addresses up or down using two pushbuttons, analogous to shifting pixels in a frame left or right
		reg [7:0] shiftR;
		reg [9:0] shiftS;
		
		reg [9:0] SWTemp, SWSync;
		reg [1:0] KEYTemp, KEYSync, KEYSyncD;
		wire [1:0] KEYSp;
		
		//Outputs
		wire [7:0] BestDist;
		wire [3:0] motionX, motionY;
		wire [7:0] R, S1, S2;
		wire [7:0] AddressR;
		wire [9:0] AddressS1, AddressS2;
		
		//Memory Instantiations
		ROM_R memR_u(CYCLONEV_CLK_50, AddressR, shiftR, R);

		ROM_S memS_u(CYCLONEV_CLK_50, AddressS1, AddressS2, shiftS, S1, S2);
		
		//Design Under Test (DUT)
		MotionEstimator dut(CYCLONEV_CLK_50, start, R, S1, S2, BestDist, motionX, motionY, AddressR, AddressS1, AddressS2);
		
		//Initialize Inputs
		initial
		begin
			shiftR = 0;
			shiftS = 0;
			start = 0;
		
			// Look-Up Table for Seven-Segment Display
			Number[0] = 8'b11000000;
			Number[1] = 8'b11111001;
			Number[2] = 8'b10100100;
			Number[3] = 8'b10110000;
			Number[4] = 8'b10011001;
			Number[5] = 8'b10010010;
			Number[6] = 8'b10000011;
			Number[7] = 8'b11111000;
			Number[8] = 8'b10000000;
			Number[9] = 8'b10011000;
			Number[10] = 8'b10001000;
			Number[11] = 8'b10000011;
			Number[12] = 8'b11000110;
			Number[13] = 8'b10100001;
			Number[14] = 8'b10000110;
			Number[15] = 8'b10001110;
		end
		
		always @(posedge CYCLONEV_CLK_50)
		begin
			// Debounce and Synchronize Inputs
			SWTemp <= SW;
			SWSync <= SWSync;
			KEYTemp <= KEY;
			KEYSync <= KEYTemp;
			KEYSyncD <= KEYSync;
			
			if(SW[9])	start <= 1;
			else			start <= 0;
			
			case({SW[0], KEYSp})
				3'b001:	shiftR <= shiftR + 1;
				3'b010:	shiftR <= shiftR - 1;
				3'b101:	shiftS <= shiftS + 1;
				3'b110:	shiftS <= shiftS - 1;
			endcase
			
		end
		
		// Generate Single Pulsers
		assign KEYSp = KEYTemp & ~KEY;
		
		// Assign Displays using LUT
		assign HEX0 = Number[motionX];
		assign HEX1 = Number[motionY];
		assign HEX2 = Number[BestDist[3:0]];
		assign HEX3 = Number[BestDist[7:4]];
		assign HEX4 = SW[0] ? Number[shiftS[3:0]] : Number[shiftR[3:0]];
		assign HEX5 = SW[0] ? Number[shiftS[7:4]] : Number[shiftR[7:4]];
		
		
	// IP to allow simple user design interfacing with developent kit			
											

		
		pin_ip			platform_designer_pin_ip(	.CYCLONEV_CLK_50(CYCLONEV_CLK_50),
																.LEDR(LEDR),
																.HEX0(HEX0), 
																.HEX1(HEX1), 
																.HEX2(HEX2),
																.HEX3(HEX3), 
																.HEX4(HEX4), 
																.HEX5(HEX5),
																.SW(SW),
																.KEY(KEY),
																.param1(param1),
																.param2(param2),
																.param3(param3));
	
endmodule
