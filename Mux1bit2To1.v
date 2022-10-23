`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux1bit2To1(out, inA, inB, sel);

    output reg  out;
    
    input  inA;
    input  inB;
    input sel;

    always @(*) begin
    if(sel==0)
        out <= inA;
    else
        out <= inB;
end


endmodule
