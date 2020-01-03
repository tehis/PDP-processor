`timescale 1ns/1ns
module MEMORY(input clk, mem_read, mem_write, input[11:0] write_data, address, output reg [11:0] read_data);
 reg[11:0] data[4096:0];

 // in this section data must be filled
 initial begin


 end
 always @(posedge clk) begin
    if (mem_read)
        read_data <= data[address];
    else if (mem_write)
        data[address] <= write_data;
 end

endmodule
