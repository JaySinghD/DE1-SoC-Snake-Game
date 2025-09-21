module halfSecCounter(clk50, clk, gameOver);
    input clk50, gameOver;
    output reg clk;
    reg [24:0] counter;
    always @(posedge clk50) begin
        counter <= counter + 1;
        if(counter == 25000000-1 || gameOver) begin counter <= 0; clk <= 1; end
        else clk <= 0;
    end
endmodule

module fastCounter(clk50, clk, gameOver);
    input clk50, gameOver;
    output reg clk;
    reg [23:0] counter;
    always @(posedge clk50) begin
        counter <= counter + 1;
        if(counter == 12500000-1 || gameOver) begin counter <= 0; clk <= 1; end
        else clk <= 0;
    end
endmodule

module slowCounter(clk50, clk, gameOver);
    input clk50, gameOver;
    output reg clk;
    reg [25:0] counter;
    always @(posedge clk50) begin
        counter <= counter + 1;
        if(counter == 50000000-1 || gameOver) begin counter <= 0; clk <= 1; end
        else clk <= 0;
    end
endmodule