`timescale 1ns/1ns

module ALU(input[11:0] in1, in2, cin, input[1:0] alu_op, output reg[11:0] alu_out);
    
    always @(alu_op, in1, in1)
        case(alu_op)
            0: alu_out = in1+in2;
            1: alu_out = in1 & in2;
            default alu_out = 11'bz;
        endcase
endmodule
