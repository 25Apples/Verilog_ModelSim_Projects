module DenGiaoThong
input wire clk, reset,
output reg red, yellow, green
);

typedef enum reg [1:0]{
	S0 = 2'b00;	//GREEN
	S0 = 2'b01;	//RED
	S0 = 2'b10;	//YELLOW
}state_t;




reg [3:0] timer;

endCasz