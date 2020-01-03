`timescale 1ns/1ns;

module REG12(input[11:0] in, input ld, clk, output reg[11:0] out);
	always@(posedge clk)
		if (ld)
			out <= in;
endmodule