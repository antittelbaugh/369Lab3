`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit4To1(out, inA, inB,inC,inD, sel);

    output reg [31:0] out;
    
    input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;
    input [31:0] inD;
    input sel;

    always @(*) begin
    if(sel==0)begin
        out <= inA;
    end
    else if( sel ==1)begin
        out <= inB;
    end
    else if( sel ==2)begin
        out <= inC;
    end
    else begin
        out <= inD;
    end
        
end


endmodule
