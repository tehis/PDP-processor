`timescale 1ns/1ns;

module ACC(input [11:0] data_in, input ld, clr, clk, output reg[11:0] data_out);
	always@(posedge  clk)
		if (clr)
			data_out <= 12'b0;
		else if (ld)
			data_out <= data_in;
endmodule