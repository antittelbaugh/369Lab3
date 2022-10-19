`timescale 1ns / 1ps

module Data_Path(Reset, Clk);
    input Reset, Clk;
    
    wire [31:0] PCAddResult, Instruction;
    wire [3:0] EX_WB;
    wire [4:0] EX_M;
    wire [31:0] EX_PCinc;
    wire [31:0] EX_BranchAddResult;
    wire EX_ZeroFlag;
    wire [31:0] EX_ALUResult;
    wire [31:0] EX_WriteMemData;
    wire [31:0] EX_WriteRegData;
    wire [3:0] ID_WB_Ctrl;
    wire  [4:0] ID_MEM_Ctrl;
    wire  [8:0] ID_EX_Ctrl;
    wire  [31:0] ID_PCAddResult, ID_SignExtend_10_6, ID_SignExtend, ID_Read1, ID_Read2;
    wire [4:0]  ID_Instruction16_20, ID_Instruction5_11;
    wire [31:0] Instruction;
    wire [31:0] ID_PCAddResult, ID_Instruction;
    wire [3:0] M_WB;
    wire M_BranchCon;
    wire M_MemRead;
    wire M_Branch;
    wire M_MemWrite;
    wire M_BNE;
    wire [31:0] M_PCinc;
    wire [31:0] M_BranchAddResult;
    wire M_ZeroFlag;
    wire [31:0] M_ALUResult;
    wire [31:0] M_WriteMemData;
    wire [31:0] M_WriteRegData;
    wire [3:0] EX_WBCtrl;
    wire [4:0] EX_MEMCtrl;
    wire [1:0] EX_RegDst;
    wire [3:0] EX_ALUOp;
    wire EX_ALUSrc;
    wire [1:0] EX_halfbyte;
    wire [31:0] EX_PCAddResult, EX_Read1, EX_Read2, EX_SignExtend,EX_SignExtend_10_6;
    wire [4:0] EX_Instruction16_20, EX_Instruction5_11;
    wire [3:0] MEM_WB_Ctrl;
    wire [31:0] MEM_Read, PCAddResult, MEM_ALUResult, MEM_RegDst;
    wire WB_halfbyte;
    wire [1:0] WB_MemToReg;
    wire WB_RegWrite;
    wire [31:0] WB_PCAddResult, WB_Read, WB_ALUResult, WB_RegDst;

    
    ClkDiv clk(Clk, Reset, ClkOut);
    IF_ID_RegFile(Clk, PCAddResult, Instruction, ID_PCAddResult, ID_Instruction);

    IDEXReg(Clk, ID_WB_Ctrl, ID_MEM_Ctrl, ID_PCAddResult, ID_EX_Ctrl, ID_SignExtend, ID_SignExtend_10_6, ID_Read1, ID_Read2, ID_Instruction16_20, ID_Instruction5_11, EX_WBCtrl, EX_MEMCtrl, EX_RegDst, EX_ALUOp, EX_ALUSrc, EX_halfbyte, EX_PCAddResult, EX_Read1, EX_Read2, EX_SignExtend,EX_SignExtend_10_6,EX_Instruction16_20, EX_Instruction5_11);

    EX_MEM(EX_WB, EX_M, EX_PCinc, EX_BranchAddResult, EX_ZeroFlag, EX_ALUResult, EX_WriteMemData, EX_WriteRegData,Clk,M_WB, M_BranchCon,M_MemRead, M_Branch, M_MemWrite, M_BNE,M_PCinc, M_BranchAddResult, M_ZeroFlag, M_ALUResult, M_WriteMemData, M_WriteRegData); 

MEM_WB_RegFile(Clk, MEM_WB_Ctrl, MEM_Read, PCAddResult, MEM_ALUResult, MEM_RegDst, WB_halfbyte, WB_MemToReg, WB_RegWrite, WB_PCAddResult, WB_Read, WB_ALUResult, WB_RegDst);


   
endmodule
