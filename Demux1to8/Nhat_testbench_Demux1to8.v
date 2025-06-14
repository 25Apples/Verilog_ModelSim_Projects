`timescale 1ns/1ps
module Nhat_testbench_Demux1to8();
reg in;
reg [2:0] sel;
wire [7:0] out;

Demux1to8 uut(.out(out), .in(in), .sel(sel));

initial begin
in = 1'b1;
sel = 3'b000;
end

always begin
	#50 sel = sel + 1;
	if (sel == 3'b111)
		#50 sel = 0;
end

endmodule

