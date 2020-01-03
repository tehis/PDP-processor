`timescale 1ns/1ns
module MEMORY(input clk, mem_read, mem_write, input[11:0] write_data, address, output reg [11:0] read_data);
 reg[11:0] data[4096:0];

 // in this section data must be filled
 initial begin
    // Instructions
    data[0] = 001001111101;


    // First array
    data [1000] = 12'b000000000000; // 0
    data [1001] = 12'b000000000000; // 0
    data [1002] = 12'b000000000000; // 0
    data [1003] = 12'b000000000000; // 0
    data [1004] = 12'b000000000001; // 1
    data [1005] = 12'b000000000000; // 0
    data [1006] = 12'b000000000010; // 2
    data [1007] = 12'b000000000100; // 4
    data [1008] = 12'b000000000000; // 0 
    data [1009] = 12'b000000000001; // 1
    // Second array
    data[2000] = 12'b000000000000; // 0
    data[2001] = 12'b000000000000; // 0
    data[2002] = 12'b000000000000; // 0
    data[2003] = 12'b000000000000; // 0
    data[2004] = 12'b000000000001; // 1
    data[2005] = 12'b000000000000; // 0
    data[2006] = 12'b000000000010; // 2
    data[2007] = 12'b000000000100; // 4
    data[2008] = 12'b000000000000; // 0
    data[2009] = 12'b000000000001; // 1


 end
 always @(posedge clk) begin
    if (mem_read)
        read_data <= data[address];
    else if (mem_write)
        data[address] <= write_data;
 end

endmodule
