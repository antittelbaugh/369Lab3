`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: IF_ID_RegFile
//
// 
//////////////////////////////////////////////////////////////////////////////////

module IF_ID_RegFile(Clk, PCAddResult, Instruction, ID_PCAddResult, ID_Instruction);
    
    input Clk;
    input reg [31:0] PCAddResult, Instruction;
    outpur reg[31:0] ID_PCAddResult, ID_Instruction;
    
   
always @(posedge Clk) begin

    
    ID_PCAddResult <= PCAddResult;
    ID_Instruction <= Instruction; 
    
 end
endmodule
