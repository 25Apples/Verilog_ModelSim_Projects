`timescale 1ns/1ps
module Nhat_testbench_T_FF();
reg CLK, T;
wire Q, Qn;

T_FF uut (.CLK(CLK), .T(T), .Q(Q), .Qn(Qn));

initial begin
	CLK = 0;
	T = 0;
	force uut.Q = 1'b0;
	#1 release uut.Q;
end

always forever #10 CLK = ~CLK;
always forever #50 T = ~T;

endmodule
