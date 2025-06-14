`timescale 1ns/1ps
module Nhat_testbench_SynchronousCounter8bit();

reg CLK;
wire [7:0] Q;

SynchronousCounter8bit uut (.CLK(CLK), .Q(Q));

initial begin
    CLK = 0;
    forever #10 CLK = ~CLK;
end
endmodule
