`timescale 1ns/1ps
module Nhat_testbench_Mux8to1();
reg [7:0] in;
reg [2:0] sel;
wire out;

Mux8to1 uut(.in(in), .sel(sel), .out(out));

initial begin
in = 8'b10101010;
sel = 3'b000;
end

always begin
    #50 sel = sel + 1;
    if (sel == 3'b111)
        #50 sel = 0;
end

endmodule
