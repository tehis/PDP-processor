`timescale 1ns/1ns
module PC(input clk, rst, load_pc, incr_pc, input[11:0] input_address, output reg[11:0] output_address);
    always @(posedge clk, posedge rst) begin
        if (rst)
            output_address <= 0;
        else if (load_pc)
            output_address <= input_address;
        else if (incr_pc)
            output_address <= output_address+1;
    end
endmodule


