`timescale 1ns/1ps
module Nhat_testbench_FullAdder();
reg A, B, Cin;
wire S, Cout;

FullAdder uut(.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

initial begin
A = 0;
B = 0;
Cin = 0;
end

always begin
#10 A = ~A;
#20 B = ~B;
#30 Cin = ~Cin;
end

endmodule
