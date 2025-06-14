module T_FF(
	input wire T, CLK,
	output reg Q
);

always @(posedge CLK)
    if (T)
        Q <= ~Q;

endmodule

module SynchronousCounter8bit(
	input wire CLK,
	output wire [7:0] Q
);

wire [6:0] T;

assign T[0] = Q[0];               
assign T[1] = Q[0] & Q[1];       
assign T[2] = Q[0] & Q[1] & Q[2];
assign T[3] = Q[0] & Q[1] & Q[2] & Q[3];
assign T[4] = Q[0] & Q[1] & Q[2] & Q[3] & Q[4];
assign T[5] = Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5];
assign T[6] = Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6];

T_FF ff0(.T(1'b1), .CLK(CLK), .Q(Q[0]));      
T_FF ff1(.T(T[0]), .CLK(CLK), .Q(Q[1]));
T_FF ff2(.T(T[1]), .CLK(CLK), .Q(Q[2]));
T_FF ff3(.T(T[2]), .CLK(CLK), .Q(Q[3]));
T_FF ff4(.T(T[3]), .CLK(CLK), .Q(Q[4]));
T_FF ff5(.T(T[4]), .CLK(CLK), .Q(Q[5]));
T_FF ff6(.T(T[5]), .CLK(CLK), .Q(Q[6]));
T_FF ff7(.T(T[6]), .CLK(CLK), .Q(Q[7]));

endmodule

