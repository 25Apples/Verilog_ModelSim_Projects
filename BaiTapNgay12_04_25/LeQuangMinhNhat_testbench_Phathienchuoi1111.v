`timescale 1ns / 1ps

module LeQuangMinhNhat_testbench_Phat_hien_chuoi_1111;

reg clk, reset, w;
wire y;

Phat_hien_chuoi_1111 uut (
.clk(clk), .reset(reset), .w(w),
.y(y)
);

always #5 clk = ~clk;

initial begin
	clk = 0;
	reset = 1;
	w = 0;
        #10 reset = 0;
        #10 w = 1;
        #10 w = 1;
        #10 w = 1;
        #10 w = 1; 
        #10 w = 0;
        #10 w = 1;
        #10 w = 1;
        #10 w = 1;
        #10 w = 1;  
        #20 $finish;
    end

endmodule

