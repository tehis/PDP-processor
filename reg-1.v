`timescale 1ns/1ns;

module REG1(input in, input ld, clk, output reg out);
	always@(posedge  clk)
		if (ld)
			out <= in;
endmodule