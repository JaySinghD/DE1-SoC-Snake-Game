module getUserInput(CLOCK_50, KEY, LEDR, direction);//LEDR becomes dirre4ciotm, //KEY is Key
    input CLOCK_50;    
    input [3:0] KEY;

    //clock stuff
    reg [25:0] clkCounter;
    reg [3:0] decCounter;
    wire [3:0] lastInput;
    reg [3:0] curInput; //current input
    output reg [3:0] LEDR;
    output reg [1:0] direction;

    //assign clkCounter = 0;
   // assign decCounter = 0;    

    always @(posedge CLOCK_50) begin

        //if UP is pressed, and last cycle UP wasn't pressed, current is up 
        if (~(KEY[3]) && (lastInput[3] != 0) && (direction != 3)) begin
            curInput <= 4'b1000; 
            LEDR <= 4'b1000;
            direction <= 2'b00;
        end
        else if (~(KEY[2]) && (lastInput[2] != 0) && (direction != 2)) begin
            curInput <= 4'b0100;
            LEDR <= 4'b0100;
            direction <= 2'b01;
        end
        else if (~(KEY[1]) && (lastInput[1] != 0) && (direction != 1)) begin
            curInput <= 4'b0010;
            LEDR <= 4'b0010; 
            direction <= 2'b10;
        end 
        else if (~(KEY[0]) && (lastInput[0] != 0) && (direction != 0)) begin
            curInput <= 4'b0001; 
            LEDR <= 4'b0001;
            direction <= 2'b11;
        end               
        else begin
            curInput <= 4'b0000; //IE do noting.
            LEDR <= 4'b0000;    
        end
       
				/*
            clkCounter <= clkCounter + 1;
            if(clkCounter == 49999999) begin
                clkCounter <= 0; //sets the clock counter to 0
               // decCounter <= decCounter + 1;
               // if(decCounter == 9) decCounter <= 0;
            end
        //end
    end
	 */
	 end
	 
        //Latches depending storing if the key is pressed
        dFlipFlop DUp(~CLOCK_50, ~KEY[3], lastInput[3]); 
        dFlipFlop DLeft(~CLOCK_50, ~KEY[2], lastInput[2]);
        dFlipFlop DRight(~CLOCK_50, ~KEY[1], lastInput[1]);
        dFlipFlop DDown(~CLOCK_50, ~KEY[0], lastInput[0]);   	 

endmodule


//positive edge flipflop
module dFlipFlop(Clk, D, Q);
    input Clk, D;
    output Q;
    wire Qm;

    D_latch l0(~Clk, D, Qm, );
    D_latch l1(Clk, Qm, Q, );
endmodule

module D_latch (Clk, D, Qa, Qb);
    input Clk, D;
    output Qa, Qb;
    wire R_g, S_g;
    
    assign R_g = ~(~D & Clk);
    assign S_g = ~(D & Clk);
    assign Qa = ~(S_g & Qb);
    assign Qb = ~(R_g & Qa);
endmodule

