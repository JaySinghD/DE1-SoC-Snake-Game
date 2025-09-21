module movement (input clk50, clk, input [1:0] direction, output reg [3:0] headLocX, headLocY, output reg gameOver);
    reg [3:0] headLocXnew, headLocYnew;
	 reg gameOverPrev;
    //moveSnake ms(direction, headLocX, headLocY, gameOver, headLocXnew, headLocYnew);
    initial begin
        headLocX = 7; headLocY = 7; headLocXnew = 7; headLocYnew = 7;
    end
    always @ (posedge clk50) begin
        headLocX <= headLocXnew;
        headLocY <= headLocYnew;
		  gameOverPrev <= gameOver;
		  if(clk) begin
			   case (direction) //Convention: left, up, down, right
                0: begin headLocXnew = headLocX - 1; headLocYnew = headLocY; end
                1: begin headLocYnew = headLocY - 1; headLocXnew = headLocX; end
                2: begin headLocYnew = headLocY + 1; headLocXnew = headLocX; end
                3: begin headLocXnew = headLocX + 1; headLocYnew = headLocY; end
            endcase
	     end
		  if(headLocXnew == 15 || headLocYnew == 15  || headLocX == 15 || headLocY == 15 || gameOverPrev) gameOver = 1; //no need to compare for < 0 because underflow
        else gameOver = 0;
	 end
endmodule