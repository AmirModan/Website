
module internal_pin_if (
	clk_clk,
	ledr31_to_0_export,
	ledr63_to_32_export,
	param1_export,
	param2_export,
	param3_export,
	key11_to_10_sw9_to_0_export,
	reset_reset_n);	

	input		clk_clk;
	input	[31:0]	ledr31_to_0_export;
	input	[31:0]	ledr63_to_32_export;
	output	[31:0]	param1_export;
	output	[31:0]	param2_export;
	output	[31:0]	param3_export;
	output	[11:0]	key11_to_10_sw9_to_0_export;
	input		reset_reset_n;
endmodule
