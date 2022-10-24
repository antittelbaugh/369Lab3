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

module IDEXReg(Clk, Reset, ID_WB_Ctrl, ID_MEM_Ctrl, ID_PCAddResult, ID_EX_Ctrl, ID_SignExtend, ID_SignExtend_10_6, ID_Read1, ID_Read2, ID_Instruction16_20, ID_Instruction5_11, EX_WBCtrl, EX_MEMCtrl, EX_RegDst, EX_ALUOp, EX_ALUSrc, EX_halfbyte, EX_PCAddResult, EX_Read1, EX_Read2, EX_SignExtend,EX_SignExtend_10_6,EX_Instruction16_20, EX_Instruction5_11, ID_jump, EX_jump, ID_offset, EX_offset);
    
    input Clk;
    input Reset;
    input ID_jump;
    input [25:0] ID_offset;
    input [3:0] ID_WB_Ctrl;
    input  [4:0] ID_MEM_Ctrl;
    input  [8:0] ID_EX_Ctrl;
    input  [31:0] ID_PCAddResult, ID_SignExtend_10_6, ID_SignExtend, ID_Read1, ID_Read2;
    input [4:0]  ID_Instruction16_20, ID_Instruction5_11;


    output reg EX_jump;
    output reg [25:0] EX_offset;
    output reg [3:0] EX_WBCtrl;
    output reg [4:0] EX_MEMCtrl;
    output reg [1:0] EX_RegDst;
    output reg [3:0] EX_ALUOp;
    output reg EX_ALUSrc;
    output reg [1:0] EX_halfbyte;
    output reg [31:0] EX_PCAddResult, EX_Read1, EX_Read2, EX_SignExtend,EX_SignExtend_10_6;
    output reg [4:0] EX_Instruction16_20, EX_Instruction5_11;
	
	
	always @(posedge Clk, posedge Reset) begin
    if (Reset == 1) begin
        EX_WBCtrl <= 0;
        EX_jump <= 0;
        EX_offset <= 0;
    EX_MEMCtrl <= 0;
    
    EX_RegDst <= 0;
    EX_ALUSrc<= 0;
    EX_ALUOp <= 0;
    EX_halfbyte <= 0;
    
    EX_PCAddResult <= 0;
    EX_Read1 <= 0;
    EX_Read2 <= 0;
    EX_SignExtend <= 0;
    EX_SignExtend_10_6 <= 0;
    EX_Instruction16_20 <= 0;
    EX_Instruction5_11 <= 0;
    end
    else begin
    EX_WBCtrl <= ID_WB_Ctrl;
    EX_jump <= ID_jump;
        EX_offset <= ID_offset;
    EX_MEMCtrl <= ID_MEM_Ctrl;
    
    EX_RegDst <= ID_EX_Ctrl[1:0];
    EX_ALUSrc<= ID_EX_Ctrl[2];
    EX_ALUOp <= ID_EX_Ctrl[6:3];
    EX_halfbyte <= ID_EX_Ctrl[8:7];
    
    EX_PCAddResult <= ID_PCAddResult;
    EX_Read1 <= ID_Read1;
    EX_Read2 <= ID_Read2;
    EX_SignExtend <= ID_SignExtend;
    EX_SignExtend_10_6 <= ID_SignExtend_10_6;
    EX_Instruction16_20 <= ID_Instruction16_20;
    EX_Instruction5_11 <= ID_Instruction5_11;
    end

 end
endmodule
