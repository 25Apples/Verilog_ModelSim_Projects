module D_FF_with_PRE_CLR(
input wire PRE, CLR, CLK, D,
output reg Q,
output wire Qn
);

assign Qn = ~Q;

always @(posedge CLK or posedge PRE or posedge CLR) begin
	if (PRE && CLR)
		Q <= 1'bx;
	else if (PRE)
		Q <= 1'b1;
	else if (CLR)
		Q <= 1'b0;
	else
		Q <= D;
end

endmodule

