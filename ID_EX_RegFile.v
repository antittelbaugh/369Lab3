`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: ID_EX_RegFile
//
// 
//////////////////////////////////////////////////////////////////////////////////

module IDEXReg(Clk, ID_WB_Ctrl, ID_MEM_Ctrl, ID_PCAddResult, ID_SignExtend, ID_Read1, ID_Read2, ID_Instruction16_20, ID_Instruction5_11, EX_WBCtrl, EX_MEMCtrl, EX_RegDst, EX_ALUOp, EX_ALUSrc, EX_halfbyte, EX_PCAddResult, EX_Read1, EX_Read2, EX_SignExtend,EX_SignExtend_10_6,EX_Instruction16_20, EX_Instruction5_11);
    
    input Clk;
    input [3:0] ID_WB_Ctrl;
    input [4:0] ID_MEM_Ctrl;
    input [8:0] ID_EX_Ctrl;
    input [31:0] ID_PCAddResult, ID_SignExtend_10_6, ID_SignExtend, ID_Read1, ID_Read2;
    input [4:0]  ID_Instruction16_20, ID_Instruction5_11;

    output reg [3:0] EX_WBCtrl;
    output reg [4:0] EX_MEMCtrl;
    output reg [1:0] EX_RegDst;
    output reg [3:0] EX_ALUOp;
    output reg EX_ALUSrc;
    output reg [1:0] EX_halfbyte;
    output reg [31:0] EX_PCAddResult, EX_Read1, EX_Read2, EX_SignExtend,EX_SignExtend_10_6;
    output reg [4:0] EX_Instruction16_20, EX_Instruction5_11;
	
	
always @(posedge Clk) begin

    EX_WBCtrl <= ID_WB_Ctrl;

    EX_MEMCtrl <= ID_MEM_Ctrl;
    
    EX_RegDst <= ID_EX_Ctrl[1:0];
    EX_ALUSrc<= ID_EX_Ctrl[2];
    EX_ALUOp <= ID_EX_Ctrl[6:3];
    EX_halfByte <= ID_EX_Ctrl[8:7];
    
    EX_PCAddResult <= ID_PCAddResult;
    EX_Read1 <= ID_Read1;
    EX_Read2 <= ID_Read2;
    EX_SignExtend <= ID_SignExtend;
    EX_SignExtend_10_6 <= ID_SignExtend_10_6;
    EX_Instruction16_20 <= ID_Instruction16_20;
    EX_Instruction_5_11 <= ID_Instruction5_11;

 end
endmodule
