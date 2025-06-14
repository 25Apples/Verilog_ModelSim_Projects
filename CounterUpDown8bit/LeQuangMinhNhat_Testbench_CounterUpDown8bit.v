`timescale 1ns/1ps
module LeQuangMinhNhat_Testbench_CounterUpDown8bit();

reg clk, reset, ud;
wire [7:0] q;

CounterUpDown8bit uut(
.clk(clk), .reset(reset), .ud(ud),
.q(q)
);

initial begin
	clk = 0;
	reset = 1;
	ud = 0;
end

always forever #5 clk = ~clk;
always forever #20  reset = ~reset;
always forever #100 ud = ~ ud;

endmodule 
 