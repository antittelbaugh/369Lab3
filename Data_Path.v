

`timescale 1ns / 1ps

module Data_Path(Reset, Clk);
    input Reset, Clk;
    
    wire [31:0] PCAddResult, Instruction;
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
    wire [31:0]  ID_Instruction;
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
    wire [31:0] MEM_Read, MEM_ALUResult, MEM_RegDst;
    wire WB_halfbyte;
    wire [1:0] WB_MemToReg;
    wire WB_RegWrite;
    wire [31:0] WB_PCAddResult, WB_Read, WB_ALUResult, WB_RegDst;
    
    wire jr;
    wire shift;
    wire [3:0]ALUCon;
    wire [31:0] ALUSrcResult;
    wire [31:0]ALUB;
    wire [31:0]storeHalf;
    wire [31:0]storeByte;
    wire [31:0] shiftedImmeadiate;
    wire [31:0] MEM_PCAddResult;
    wire BranchSatsified;
    wire BEQ_sat;
    wire BNE_sat;
    wire PCSrc;
    wire [31:0]  loadByte;
    wire [31:0]  loadhalf;
    wire [31:0] WriteData;
    wire [31:0] Address;       
    wire [31:0] mem [127:0];
    wire [31:0] Instruction;
    wire [31:0] PCResult;
    wire [31:0] Address_mux;
    wire [27:0] Shifted_jr;
    wire ID_jump;
    

    Mux32Bit2To1 PCSrc(Address_mux, PCAddResult,  M_BranchAddResult, WB_PCsrc);
    InstructionMemory IMEM(Address, Instruction); 
    PCAdder PCA(PCResult, PCAddResult);
    ProgramCounter PCount(Address, PCResult, Reset, Clk);
    Mux32Bit2To1 jrSrc(Read1_Result, Address_mux, EX_Read1, jr);
    Mux32Bit2To1 jrResult(Address, Read1_Result, {ID_PCAddResult[31:27],Shifted_jr}, ID_jump);


	
    IF_ID_RegFile IFID(Clk, PCAddResult, Instruction, ID_PCAddResult, ID_Instruction);

    IDEXReg IDEX(Clk, ID_WB_Ctrl, ID_MEM_Ctrl, ID_PCAddResult, ID_EX_Ctrl, ID_SignExtend, ID_SignExtend_10_6, ID_Read1, ID_Read2, ID_Instruction16_20, ID_Instruction5_11, EX_WBCtrl, EX_MEMCtrl, EX_RegDst, EX_ALUOp, EX_ALUSrc, EX_halfbyte, EX_PCAddResult, EX_Read1, EX_Read2, EX_SignExtend,EX_SignExtend_10_6,EX_Instruction16_20, EX_Instruction5_11);
        
    Mux32Bit3To1 REGDST(EX_WriteRegData, EX_Instruction16_20, EX_Instruction5_11,31, EX_RegDst);  
    ALUControl ALUCON(EX_ALUOp,EX_SignExtend,jr,shift,ALUcon); 
    Mux32Bit2To1 ALUSrc(ALUSrcResult, EX_Read2, EX_SignExtend, EX_ALUSrc);
    Mux32Bit2To1 Shift(ALUB, ALUSrcResult, EX_SignExtend_10_6, shift);
    ALU32Bit ALU(ALUCon, EX_Read1, ALUB, EX_ALUResult, EX_ZeroFlag);
    SignExtension_8 sb(EX_Read2[7:0], storeByte);
    SignExtension sh(EX_Read2[15:0], storeHalf);
    Mux32Bit3To1 shsb(EX_WriteMemData, EX_Read2, storeHalf,storeByte, EX_halfbyte);
    ShiftLeftBy2 branchad(EX_SignExtend, shiftedImmeadiate);
    Adder branchadd(EX_BranchAddResult, shiftedImmeadiate, EX_PCAddResult);
     
        
    EX_MEM EXMEM(EX_WBCtrl, EX_MEMCtrl, EX_PCAddResult, EX_BranchAddResult, EX_ZeroFlag, EX_ALUResult, EX_WriteMemData, EX_WriteRegData,Clk,MEM_WB_Ctrl, M_BranchCon,M_MemRead, M_Branch, M_MemWrite, M_BNE,MEM_PCAddResult, M_BranchAddResult, M_ZeroFlag, M_ALUResult, M_WriteMemData,MEM_RegDst); 

    Mux1bit2To1 specBranch(BranchSatsified, M_ZeroFlag, M_ALUResult[0],  M_BranchCon);
    and testAnd( BEQ_sat,M_Branch, BranchSatsified);
    and BNEand(BNE_sat, M_BNE, ~BranchSatsified);
    or branchOr( PCSrc,  BNE_sat, BEQ_sat);
    DataMemory(M_ALUResult, M_WriteMemData, Clk, M_MemWrite, M_MemRead, MEM_Read);
    
    
    MEM_WB_RegFile MEMWB(Clk, MEM_WB_Ctrl, MEM_Read, MEM_PCAddResult, M_ALUResult, MEM_RegDst, WB_halfbyte, WB_MemToReg, WB_RegWrite, WB_PCAddResult, WB_Read, WB_ALUResult, WB_RegDst);
    SignExtension_8 lb(WB_Read[7:0], loadByte);
    SignExtension lh(WB_Read[15:0], loadHalf);
    Mux32Bit2To1 lhlb(lhlbResult, loadByte, loadHalf, WB_halfbyt);
    Mux32Bit4To1 MemtoReg(WriteData, WB_Read, WB_ALUResult,inC,inD, WB_MemToReg);

   
endmodule
