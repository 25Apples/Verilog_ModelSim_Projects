`timescale 1ns/1ps
module Nhat_testbench_SisoShiftRegister8bit();

reg data_in, CLK; 
wire Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7; 

SISOShiftRegister8bit uut(
.in(data_in), .CLK(CLK),
.Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4), .Q5(Q5), .Q6(Q6), .Q7(Q7)
);

initial begin
	CLK = 0;
end

initial begin
	data_in = 1'b1;
	#20 data_in = 1'b0;
end

always forever #10 CLK = ~CLK;

endmodule

