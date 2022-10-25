`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2022 02:29:23 PM
// Design Name: 
// Module Name: TopLevel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopLevel(Reset, Clk, out7, en_out);
    input Reset, Clk;
    output [6:0] out7;
    output wire [7:0] en_out;
    wire ClkOut;
    wire [31:0] Instruction;
    ClkDiv clk(Clk, Reset, ClkOut);
    InstructionFetchUnit fetch(Instruction, Reset, ClkOut);
    Two4DigitDisplay(Clk, Instruction[15:0], Instruction[31:16], out7, en_out);
    
    
    
endmodule
