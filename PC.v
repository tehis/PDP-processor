`timescale 1ns/1ns
module PC(input clk, rst, load_pc, incr_pc, input[11:0] input_address, output[11:0] output_address);
    always @(posedge clk, posedge rst) begin
        if (rst)
            output_address <= 0;
        else if (load_pd)
            output_adress <= input_address;
        else if (incr_pc)
            pc_out <= pc_out+1;
    end
endmodule


