`timescale 1ns/1ns
module MUX_4_1(input[11:0] in1, in2, in3, in4, input[1:0] select, output[11:0] out);
    assign out = (select == 0)? in1 : (select == 1) ? in2 : (select == 2) ? in3 : (select == 3) ? in4 : 12'bz; 
endmodule

module MUX_2_1(input[11:0] in1, in2, input select, output[11:0] out);
    assign out = (select == 0)? in1 : (select == 1)? in2 : 12'bz;
endmodule

module MUX_3_1(input[11:0] in1, in2, in3, input[1:0] select, output[11:0] out);
    assign out = (select == 0)? in1 : (select == 1)? in2 : (select == 2)? in3 : 12'bz;
endmodule
