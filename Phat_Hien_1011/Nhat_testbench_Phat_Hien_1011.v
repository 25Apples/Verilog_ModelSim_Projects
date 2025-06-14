`timescale 1ns/1ns
module Nhat_testbench_Phat_hien_1011();
reg [3:0] shift_reg;
reg w, clk, rs;
wire y;

Phat_hien_1011 uut (.w(w), .clk(clk), .rs(rs), .y(y));

always @(posedge clk)
    if (rs)
        shift_reg <= 4'bxxxx;
    else
        shift_reg <= {shift_reg[2:0], w};

initial begin
	rs = 1;
	clk = 0;
	w = 0;
	#10 rs = 0;
	//Gui chuoi 1011, y = 1
	#10 w = 1;
	#10 w = 0;
	#10 w = 1;
	#10 w = 1;
	//Phat hien chong, y = 1
	#10 w = 0;
	#10 w = 1;
	#10 w = 1;
	//Chuoi loi
	#10 w = 1;
	#10 w = 1;
	#10 w = 1;
	#10 w = 1;
	//Chuoi loi
	#10 w = 0;
	#10 w = 0;
	#10 w = 0;
	#10 w = 0;
	//Chuoi loi
	#10 w = 1;
	#10 w = 1;
	#10 w = 0;
	#10 w = 0;
end

always forever #5 clk = ~clk;

endmodule
