module main(input CLOCK_50, input [3:0] KEY, output [9:0] LEDR, output [7:0] VGA_R, VGA_G, VGA_B, output VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK, output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

	wire [2:0] colour, objclr;
	wire [7:0] x;
	wire [6:0] y;
	
	wire [3:0] headX, headY, tailRmX, tailRmY, objX, objY;
	wire [7:0] headXVGA, tailRmXVGA, objXVGA;
	wire [6:0] headYVGA, tailRmYVGA, objYVGA;
	
	hex_adapter xHead (headX, HEX5);
	hex_adapter yHead (headY, HEX4);
	hex_adapter xTail (tailRmX, HEX3);
	hex_adapter yTail (tailRmY, HEX2);
	hex_adapter scoreDisp1 (score[7:4], HEX1);
	hex_adapter scoreDisp0 (score[3:0], HEX0);
	
	assign LEDR[8] = gameClock;

	wire itemEaten, newItemEaten; //This will have implemented in the game logic, indicating that the item has been eaten.
	wire [7:0] snakeLength; //length of snake, max 225
	reg [7:0] score; //actual score, taking into consideration the brokennes of our logic.
	wire [1:0] gameClockSelect, direction;
	
	always @ (posedge CLOCK_50) score = snakeLength + 3;
	
	wire clkHalfSec, clkSlow, clkFast, gameClock, snakeTouchesSelf, snakeOutOfBounds, gameOver;
	assign gameOver = snakeOutOfBounds | snakeTouchesSelf;
	//assign gameOver = 0;
	
	wire [14:0] hasSnake [14:0];
	
	halfSecCounter h0 (CLOCK_50, clkHalfSec, gameOver);
	slowCounter s0 (CLOCK_50, clkSlow, gameOver);
	fastCounter f0 (CLOCK_50, clkFast, gameOver);
	
	mux3to1 clkMux(gameClockSelect, clkHalfSec, clkSlow, clkFast, gameClock);
	//assign gameClock = clkHalfSec;
	
	wire plot;
    
   //note: disabled reset on VGA
   vga_adapter VGA( .resetn(~gameOver), .clock(CLOCK_50), .colour(colour), .x(x), .y(y), .plot(plot), .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS), .VGA_BLANK_N(VGA_BLANK_N), .VGA_SYNC_N(VGA_SYNC_N), .VGA_CLK(VGA_CLK));
	defparam VGA.RESOLUTION = "160x120";
	defparam VGA.MONOCHROME = "FALSE";
	defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
	defparam VGA.BACKGROUND_IMAGE = "image.colour.mif";
	//defparam VGA.USING_DE1 = "TRUE";
	
	//Gets user input
	getUserInput userinput(CLOCK_50, KEY, LEDR[4:0], direction);
	
	//itemSpawn Logic
    itemSpawn spawnItem(CLOCK_50, headX, headY, objX, objY, snakeLength, gameClockSelect, objclr);
    
	 wire doneHead, doneTail, doneObj;
    //module movement (input clk50, clk, input [1:0] direction, output reg [3:0] headLocX, headLocY, output gameOver);
    movement moveSnk (CLOCK_50, gameClock, direction, headX, headY, snakeOutOfBounds);
    
    //module fillGridSq(input [3:0] x, y, input[2:0] clr, input enable, clk50, output reg done, output [7:0] hpos, vpos);
    fillGridSq DrawNewHead(headX, headY, 3'b010, drawingHead, CLOCK_50, doneHead, headXVGA, headYVGA);
    fillGridSq RmOldTail(tailRmX, tailRmY, 3'b001, removingTail, CLOCK_50, doneTail, tailRmXVGA, tailRmYVGA);
    fillGridSq DrawObj(objX, objY, objclr, drawingObj, CLOCK_50, doneObj, objXVGA, objYVGA);
    
    //module rememberSnake(input clk, input [3:0] headX, headY, input [7:0] len, output [14:0] hasSnake0, hasSnake1, hasSnake2, hasSnake3, hasSnake4, hasSnake5, hasSnake6, hasSnake7, hasSnake8, hasSnake9, hasSnake10, hasSnake11, hasSnake12, hasSnake13, hasSnake14, output reg [3:0] snakeLeftX, snakeLeftY);
    rememberSnake memBoard(gameClock, headX, headY, snakeLength, hasSnake[0], hasSnake[1], hasSnake[2], hasSnake[3], hasSnake[4], hasSnake[5], hasSnake[6], hasSnake[7], hasSnake[8], hasSnake[9], hasSnake[10], hasSnake[11], hasSnake[12], hasSnake[13], hasSnake[14], tailRmX, tailRmY, snakeTouchesSelf);
    
    //manageDraw(input clk50, gameClk, doneHead, doneTail, doneObj, input [7:0] headXVGA, tailRmXVGA, objXVGA, input [6:0] headYVGA, tailRmYVGA, objYVGA, input[2:0] objColour, output [7:0] xVGA, output reg [6:0] yVGA, output reg [2:0] colour, output reg plot, ERROR);
    //Yes I know that's a fuckton of ports, I couldn't think of a better way of doing it.
    manageDraw draw(CLOCK_50, gameClock, doneHead, doneTail, doneObj, headXVGA, tailRmXVGA, objXVGA, headYVGA, tailRmYVGA, objYVGA, objclr, drawingHead, removingTail, drawingObj, x, y, colour, plot, LEDR[9]);
    
endmodule
