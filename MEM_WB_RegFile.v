`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: MEM_WB_RegFile
//
// 
//////////////////////////////////////////////////////////////////////////////////

module MEM_WB_RegFile(Clk, MEM_WB_Ctrl, MEM_Read, PCAddResult, MEM_ALUResult, MEM_RegDst, WB_halfbyte, WB_MemToReg, WB_RegWrite, WB_PCAddResult, WB_Read, WB_ALUResult, WB_RegDst);
    
    input Clk;
    input reg [3:0] MEM_WB_Ctrl;
    input reg [31:0] MEM_Read, PCAddResult, MEM_ALUResult, MEM_RegDst;
    
    output reg WB_halfbyte;
    output reg [1:0] WB_MemToReg;
    output reg WB_RegWrite;
    output reg [31:0] WB_PCAddResult, WB_Read, WB_ALUResult, WB_RegDst;
    
	
always @(posedge Clk) begin

    
    WB_RegWrite <= MEM_WB_Ctrl [0];
    WB_MemToReg <= MEM_WB_Ctrl [2:1];
    WB_halfbyte <= MEM_WB_Ctrl [3];
    WB_PCAddResult <= PCAddResult;
    WB_Read <= MEM_Read;
    WB_ALUResult <= MEM_ALUResult;
    WB_RegDst <= MEM_RegDst
    
 end
endmodule
