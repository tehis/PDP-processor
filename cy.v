`timescale 1ns/1ns;

module ACC(input in, input ld, clk, output reg out);
	always@(posedge  clk)
		if (ld)
			out <= in;
endmodule