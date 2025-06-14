module Phat_hien_chuoi_1111(
input wire w, clk, reset,
output wire y
);

reg [1:0] state, n_state;
parameter S0 = 2'b00, S1=2'b01, S2=2'b10, S3=2'b11;

always@(posedge clk)
if (reset)
	state <= S0;
else
	state <= n_state;

always@(state or w)
	case(state)
	S0:n_state = w? S1: S0;
	S1:n_state = w? S2: S0;
	S2:n_state = w? S3: S0;
	S3:n_state = w? S3: S0;
	default: n_state = S0;
endcase

assign y = (state == S3) && (w == 1);
endmodule

