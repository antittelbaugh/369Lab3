`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux2Bit2To1(out, inA, inB, sel);

  output reg [1:0] out;
    
  input [1:0] inA;
  input [1:0] inB;

    input sel;

    always @(*) begin
    if(sel==0)begin
        out <= inA;
    end
    else if( sel ==1)begin
        out <= inB;
    end
   
end


endmodule
