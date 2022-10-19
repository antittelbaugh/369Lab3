`timescale 1ns / 1ps

module Data_Path();
    input Reset, Clk;
    output [6:0] out7;
    output wire [7:0] en_out;
    wire ClkOut;
    wire [31:0] Instruction;
    
    ClkDiv clk(Clk, Reset, ClkOut);
    
endmodule
