`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux3To1_5bit(out, inA, inB,inC, sel);

    output reg [4:0] out;
    
    input [4:0] inA;
    input [4:0] inB;
    input [4:0] inC;
    input [1:0] sel;

    always @(*) begin
    if(sel==0)begin
        out <= inA;
    end
    else if( sel ==1)begin
        out <= inB;
    end
    else begin
        out <= inC;
    end
        
end


endmodule
