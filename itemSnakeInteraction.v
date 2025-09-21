module itemSnakeInteraction(input clk, input [3:0] itemPositionX, input [3:0] itemPositionY, input [3:0] snakePositionX, input [3:0] snakePositionY, output reg itemEaten, output reg [7:0] snakeLength);

    //idea, when head of snake has the same coordinates as item, itemEaten becomes 1, and snakeLength increases

    wire done;

    initial begin
        snakeLength = 0;
    end

    //THERE MUST BE SOME INITAL BLOCK IN SOME MODULE MAKING SNAKELENGTH START AT 0

    always @(posedge clk) begin //THIS MUST BE AMMENDED WITH CODE GIVING THE GAME SPEED

        if ((itemPositionX == snakePositionX) && (itemPositionY == snakePositionY)) begin
            
            //MODULE HERE WILL REMOVE THE COLOURING OF THE ITEM SQUARE
            //fillGridSq(itemPositionX, itemPositionY, b'001, 1, CLOCK_50, done)

            itemEaten <= 1;
            snakeLength <= snakeLength + 1;

        end
    

    end



endmodule
