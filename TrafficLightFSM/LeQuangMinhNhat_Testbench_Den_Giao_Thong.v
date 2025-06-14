`timescale 1ns/1ps

module LeQuangMinhNhat_testbench_Den_Giao_Thong();
reg clk, reset;
wire A_green, A_yellow, A_red, B_green, B_yellow, B_red;

two_way_traffic_light_controller uut(
    .clk(clk), .reset(reset),
    .A_green(A_green), .A_yellow(A_yellow), .A_red(A_red), 
    .B_green(B_green), .B_yellow(B_yellow), .B_red(B_red)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    #10;
    reset = 0;
end

endmodule

