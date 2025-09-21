module mux3to1(input [1:0] s, input x, y, z, output reg m);
    always @(*) begin
        case (s)
            1: m = y; 
            2: m = z;
            default: m = x;
        endcase
    end
endmodule

module mux3to1_8b(input [1:0] s, input [7:0] x, y, z, output reg [7:0] m);
    always @(*) begin
        case (s)
            1: m = y; 
            2: m = z;
            default: m = x;
        endcase
    end
endmodule

module mux3to1_7b(input [1:0] s, input [6:0] x, y, z, output reg [6:0] m);
    always @(*) begin
        case (s)
            1: m = y; 
            2: m = z;
            default: m = x;
        endcase
    end
endmodule