module SynchronousCounter8bit_2(
input wire clk, reset,
output wire [7:0] q
);

reg [7:0] r_reg;
wire [7:0] r_next;

always @(posedge clk, posedge reset)
if (reset)
	r_reg <= 0;
else
	r_reg <= r_next;

assign r_next = r_reg + 1;
assign q = r_reg;

endmodule

