module pin_ip(	input 			CYCLONEV_CLK_50,
					input  [9:0] 	LEDR,
					input  [7:0] 	HEX0, HEX1, HEX2,
							HEX3, HEX4, HEX5,
					output [9:0] 	SW,
					output [1:0]	KEY,
					output [31:0]   param1, param2, param3);
	
	
	//Reset makes time to connect to JTAG lower
	parameter reset_timeout = 2**8-1;
	reg [7:0] reset_count = 8'b0;

	//Allow device reset to be active for many clock cycles			
	always@(posedge CYCLONEV_CLK_50)
		if(reset_count != (reset_timeout))
			reset_count = reset_count + 8'd1;

	internal_pin_if   		i1(	.clk_clk(CYCLONEV_CLK_50),
											.ledr31_to_0_export({HEX1, HEX0, 6'b0, LEDR}),
											.reset_reset_n(reset_count == reset_timeout),
											.key11_to_10_sw9_to_0_export({KEY, SW}),
											.ledr63_to_32_export({HEX5, HEX4, HEX3, HEX2}),
											.param1_export(param1),
											.param2_export(param2),
											.param3_export(param3)   );						
endmodule
	