module traffic_light_controller (
input wire clk, reset,
output reg green, yellow, red
);

parameter GREEN  = 2'b00;
parameter YELLOW = 2'b01;
parameter RED    = 2'b10;

reg [1:0] current_state, next_state;

parameter GREEN_TIME  = 15;
parameter YELLOW_TIME = 5;
parameter RED_TIME    = 20;

reg [7:0] timer;

always @(*) begin
    next_state = current_state;
    case (current_state)
        GREEN:  if (timer == GREEN_TIME)  next_state = YELLOW;
        YELLOW: if (timer == YELLOW_TIME) next_state = RED;
        RED:    if (timer == RED_TIME)    next_state = GREEN;
        default: next_state = GREEN;
    endcase
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= GREEN;
        timer <= 0;
    end else begin
        if (timer == ((current_state == GREEN) ? GREEN_TIME :
                     (current_state == YELLOW) ? YELLOW_TIME :
                     (current_state == RED) ? RED_TIME : 0))
            timer <= 0;
        else
            timer <= timer + 1;

        current_state <= next_state;
    end
end

always @(*) begin
    green = 0;
    yellow = 0;
    red = 0;
    case (current_state)
        GREEN:  green = 1;
        YELLOW: yellow = 1;
        RED:    red = 1;
    endcase
end

endmodule

