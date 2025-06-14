module Shift_SIPO(
input wire clk, s_in,
output wire [7:0] q_out
);

reg [7:0] r_reg;
wire [7:0] r_next;

always@(posedge clk)
	r_reg<=r_next;
assign r_next = {s_in,r_reg[7:1]};
assign q_out= r_reg;

endmodule

