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

module IF_ID_RegFile(Clk, Reset, PCAddResult, Instruction, ID_PCAddResult, ID_Instruction);
    
    input Clk;
    input Reset;
    input [31:0] PCAddResult, Instruction;
    output reg[31:0] ID_PCAddResult, ID_Instruction;
    
   
    always @(posedge Clk) begin

    if (Reset == 1) begin
    ID_PCAddResult <= 0;
    ID_Instruction <= 0;
    end
    else begin
    ID_PCAddResult <= PCAddResult;
    ID_Instruction <= Instruction;
    end 
    
 end
endmodule
