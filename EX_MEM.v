`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2022 11:45:47 AM
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(EX_WB, EX_M, EX_PCinc, EX_BranchAddResult, EX_ZeroFlag, EX_ALUResult, EX_WriteMemData, EX_WriteRegData,Clk, Reset, M_WB, M_BranchCon,M_MemRead, M_Branch, M_MemWrite, M_BNE,M_PCinc, M_BranchAddResult, M_ZeroFlag, M_ALUResult, M_WriteMemData, M_WriteRegData, EX_jump, EX_offset, EX_Read1, EX_jr, M_jump, M_offset, M_Read1, M_jr);
    input [3:0] EX_WB;
    input [4:0] EX_M;
    input [31:0] EX_PCinc;
    input [31:0] EX_BranchAddResult;
    input EX_ZeroFlag;
    input [31:0] EX_ALUResult;
    input [31:0] EX_WriteMemData;
    input [4:0] EX_WriteRegData;
    input Clk;
    input Reset;
   input EX_jump;
    input [25:0] EX_offset;
    input [31:0] EX_Read1;
    input EX_jr;
    
    output reg [3:0] M_WB;
    output reg M_BranchCon;
    output reg M_MemRead;
    output reg M_Branch;
    output reg M_MemWrite;
    output reg M_BNE;
    output reg [31:0] M_PCinc;
    output reg [31:0] M_BranchAddResult;
    output reg M_ZeroFlag;
    output reg [31:0] M_ALUResult;
    output reg [31:0] M_WriteMemData;
    output reg [4:0] M_WriteRegData;
    output reg M_jump;
    output reg [25:0] M_offset;
    output reg [31:0] M_Read1;
    output reg M_jr;
    
    always @(posedge Clk) begin
    if (Reset == 1) begin
    
    M_jump <= 0;
    M_offset <= 0;
     M_Read1 <= 0;
     M_jr <= 0;
     M_WB <= 0;
     M_BranchCon <= 0;
     M_MemRead <= 0;
     M_Branch<= 0;
     M_MemWrite<= 0;
     M_BNE<= 0;
     M_PCinc <= 0;
     M_BranchAddResult <= 0;
     M_ZeroFlag <= 0;
     M_ALUResult <= 0;
     M_WriteMemData <= 0;
     M_WriteRegData <= 0;
    end
    else begin
     M_WB <= EX_WB ;
     M_BranchCon <= EX_M[1];
     M_MemRead <= EX_M[3];
     M_Branch<= EX_M[4];
     M_MemWrite<= EX_M[2];
     M_BNE<= EX_M[0];
     M_PCinc <= EX_PCinc;
     M_BranchAddResult <= EX_BranchAddResult;
     M_ZeroFlag <= EX_ZeroFlag;
     M_ALUResult <= EX_ALUResult;
     M_WriteMemData <= EX_WriteMemData;
     M_WriteRegData <= EX_WriteRegData;
     
     M_jump <= EX_jump;
    M_offset <= EX_offset;
     M_Read1 <= EX_Read1;
     M_jr <= EX_jr;
    end
    
    end
endmodule
