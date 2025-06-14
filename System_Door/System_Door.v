module System_Door (
input wire clk, rs,
input wire [4:1] btn, // btn[1]=1, btn[2]=2, btn[3]=3, btn[4]=4
output reg Led_Green, Led_Red
);

reg [2:0] Current_State, Next_State;
reg [3:0] timer;
reg [11:0] seq; // luu day nhap vao: 4 so * 3 bit = 12 bit
reg [3:0] counter_3s; // dem thoi gian LED xanh hoac chop do
reg [1:0] blink_count; // so lan chop do
reg blinking; // trang thai chop

parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, SUCCESS = 5, ERROR = 6;
parameter Time_Out = 10;

// FSM trang thai tiep theo
always @(*) begin
	case (Current_State)
		S0: if (btn[1]) 
			Next_State = S1; 
		else if (btn[2] || btn[3] || btn[4]) 
			Next_State = ERROR; 
		else 
			Next_State = S0;
		S1: if (btn[3]) 
			Next_State = S2; 
		else if (btn[1] || btn[2] || btn[4]) 
			Next_State = ERROR; 
		else 
			Next_State = S1;
		S2: if (btn[2]) 
			Next_State = S3; 
		else if (btn[1] || btn[3] || btn[4]) 
			Next_State = ERROR; 
		else 
			Next_State = S2;
		S3: if (btn[4]) 
			Next_State = S4; 
		else if (btn[1] || btn[2] || btn[3]) 
			Next_State = ERROR; 
		else 
			Next_State = S3;
		S4: Next_State = (seq == 12'b100_010_011_001) ? SUCCESS : ERROR;
		SUCCESS: Next_State = (counter_3s >= 3) ? S0 : SUCCESS;
		ERROR: Next_State = (blink_count >= 3) ? S0 : ERROR;
	default: Next_State = S0;
        endcase
end

// FSM cap nhat trang thai
always @(posedge clk or posedge rs) begin
	if (rs) begin
		Current_State <= S0;
		seq <= 12'b0;
		timer <= 0;
		Led_Green <= 0;
		Led_Red <= 0;
		counter_3s <= 0;
		blink_count <= 0;
		blinking <= 0;
	end else begin
		Current_State <= Next_State;
		case (Next_State)
			S1: seq[2:0] <= 3'b001; // 1
			S2: seq[5:3] <= 3'b011; // 3
			S3: seq[8:6] <= 3'b010; // 2
                	S4: seq[11:9] <= 3'b100; // 4
                	default: ; //Treo
            	endcase

            	// Timeout dem khi khong bam
		if (btn != 0)
                	timer <= 0;
		else if (Current_State >= S0 && Current_State <= S4 && timer < Time_Out)
			timer <= timer + 1;

            	// RESET neu timeout
            	if (timer >= Time_Out)
                	Current_State <= ERROR;

           	 // Den xanh giu 3s
		if (Current_State == SUCCESS) begin
			if (counter_3s < 3) begin
				Led_Green <= 1;
				counter_3s <= counter_3s + 1;
			end else begin
				Led_Green <= 0;
			end
		end else begin
			Led_Green <= 0;
			counter_3s <= 0;
		end

            	// Den do nhap nhay 3 lan
            	if (Current_State == ERROR) begin
                	blinking <= ~blinking;
                	if (blinking)
                    		blink_count <= blink_count + 1;
                		Led_Red <= blinking;
            	end else begin
                	Led_Red <= 0;
                	blinking <= 0;
                	blink_count <= 0;
            	end
        end
end

endmodule

