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

module MEM_WB_RegFile(Clk, Reset, MEM_WB_Ctrl, MEM_Read, PCAddResult, MEM_ALUResult, MEM_RegDst, WB_halfbyte, WB_MemToReg, WB_RegWrite, WB_PCAddResult, WB_Read, WB_ALUResult, WB_RegDst, M_jr, WB_jr);
    
    input Clk;
    input Reset;
    input [3:0] MEM_WB_Ctrl;
    input [31:0] MEM_Read, PCAddResult, MEM_ALUResult;
    input [4:0] MEM_RegDst;
    input M_jr;
    
    output reg WB_halfbyte;
    output reg [1:0] WB_MemToReg;
    output reg WB_RegWrite;
    output reg [31:0] WB_PCAddResult, WB_Read, WB_ALUResult;
    output reg [4:0] WB_RegDst;
     output reg WB_jr;
    
	
always @(posedge Clk) begin
    if (Reset == 1) begin
    WB_RegWrite <= 0;
    WB_MemToReg <= 0;
    WB_halfbyte <= 0;
    WB_PCAddResult <= 0;
    WB_Read <= 0;
    WB_ALUResult <= 0;
    WB_RegDst <= 0;
    WB_jr <= 0;
    end
    else begin
    WB_RegWrite <= MEM_WB_Ctrl [0];
    WB_MemToReg <= MEM_WB_Ctrl [2:1];
    WB_halfbyte <= MEM_WB_Ctrl [3];
    WB_PCAddResult <= PCAddResult;
    WB_Read <= MEM_Read;
    WB_ALUResult <= MEM_ALUResult;
    WB_RegDst <= MEM_RegDst;
    WB_jr <= M_jr;
    end
    
 end
endmodule
