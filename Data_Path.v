//ECE 369A Group 3
//Julia Otto, Ashley Tittelbaugh, Mario Weiler
//Group Effort %: 33,33,33 each
//Note: Must rerun synthesis when updating instructions
`timescale 1ns / 1ps


module Data_Path(Reset, Clk, WriteData, WB_PCAddResult, v0,v1);
    input Reset, Clk;
    (* mark_debug = "true" *) wire [31:0] PCResult;
    output wire [31:0] WriteData;
    output wire [31:0]  WB_PCAddResult;
    output wire [31:0] v0, v1;
    wire [31:0] PCAddResult, Instruction;
    wire [31:0] EX_BranchAddResult;
    wire EX_ZeroFlag;
    wire [31:0] EX_ALUResult;
    wire [31:0] EX_WriteMemData;
    wire [4:0] EX_WriteRegData;
    wire [3:0] ID_WB_Ctrl;
    wire  [1:0] ID_MEM_Ctrl;
    wire  [8:0] ID_EX_Ctrl;
    
    wire [3:0] IDWB_Ctrl;
    wire  [1:0] IDMEM_Ctrl;
    wire  [8:0] IDEX_Ctrl;
    
    wire  [31:0] ID_PCAddResult, ID_SignExtend_10_6, ID_SignExtend, ID_Read1, ID_Read2;
    wire [4:0]  ID_Instruction16_20, ID_Instruction5_11;
    wire [31:0]  ID_Instruction;
    wire [3:0] M_WB;
    
    wire M_MemRead;
    wire M_MemWrite;
    wire M_BNE;
    wire [31:0] M_PCinc;
    wire [31:0] M_BranchAddResult;
    wire [31:0] M_ALUResult;
    wire [31:0] M_WriteMemData;
    wire [31:0] M_WriteRegData;
    wire [3:0] EX_WBCtrl;
    wire [1:0] EX_MEMCtrl;
    wire [1:0] EX_RegDst;
    wire [3:0] EX_ALUOp;
    wire EX_ALUSrc;
    wire [1:0] EX_halfbyte;
    wire [31:0] EX_PCAddResult, EX_Read1, EX_Read2, EX_SignExtend,EX_SignExtend_10_6;
    wire [4:0] EX_Instruction16_20, EX_Instruction5_11;
    wire [3:0] MEM_WB_Ctrl;
    wire [31:0] MEM_Read;
    wire [4:0] MEM_RegDst;
    wire WB_halfbyte;
    wire [1:0] WB_MemToReg;
    wire WB_RegWrite;
	
    wire [31:0]WB_Read, WB_ALUResult;
    wire [4:0] WB_RegDst;
    
    wire jr;
    wire shift;
    wire [3:0]ALUCon;
    wire [31:0]ALUB;
    wire [31:0]ALUA;
    wire [31:0]storeHalf;
    wire [31:0]storeByte;
    wire [31:0] shiftedImmeadiate;
    wire [31:0] MEM_PCAddResult;
    wire BranchSatsified;
    wire BEQ_sat;
    wire BNE_sat;
    (*mark_debug = "true" *)wire PCSrc;
    wire [31:0]  loadByte;
    wire [31:0]  loadHalf;
    
    wire [31:0] Address;       
    wire [31:0] mem [127:0];
    wire [31:0] Address_mux;
    wire [27:0] Shifted_jr;
    wire [6:0] ID;
    wire [31:0] Read1_Result;
    wire [31:0] lhlbResult;
    wire [25:0] EX_offset;
    wire  EX_jump;
    
    wire [25:0] M_offset;
    wire [31:0] M_Read1;
    wire [31:0] specBext;
    wire Reg_Write;
    wire [31:0] WriteDataint;
    wire eqflag;
    wire less;
    wire equal;
    wire BGTZ_sat;
    wire BLEZ_sat;
    wire lessorequal;
    wire specBflag;
    wire [31:0] ID_BranchAddResult;
    wire PCWrite;
    wire IF_ID_Write;
    wire flush;
    wire control;
    wire ForwardA, ForwardB;

    Mux32Bit2To1 PCSrc1(Address_mux, PCAddResult,  ID_BranchAddResult, PCSrc);
    InstructionMemory IMEM(PCResult, Instruction); 
    PCAdder PCA(PCResult, PCAddResult);
    ProgramCounter PCount(Address, PCResult, Reset, Clk,PCWrite);
    Mux32Bit2To1 jrSrc(Read1_Result, Address_mux, ID_Read1, ID[0]);
    Mux32Bit2To1 jrResult(Address, Read1_Result, {ID_PCAddResult[31:28],Shifted_jr}, ID[1]);
    
    


	
    IF_ID_RegFile IFID(Clk, Reset, PCAddResult, Instruction, ID_PCAddResult, ID_Instruction, IF_ID_Write,IF_ID_flush);
    
    HazardDetectionUnit haz(Reset,ID_Instruction[25:21], ID_Instruction[20:16], EX_WriteRegData, MEM_RegDst, WB_RegDst,ID[0], ID[1], EX_WBCtrl[0],  MEM_WB_Ctrl[0], WB_RegWrite, PCSrc,PCWrite,IF_ID_Write, control, IF_ID_flush);
	
    RegisterFile RegFile1(ID_Instruction[25:21], ID_Instruction[20:16], WB_RegDst, WriteData, WB_RegWrite, ID_Read1, ID_Read2, Clk, Reset,v0,v1);
    SignExtension Sign1(ID_Instruction[15:0], ID_SignExtend);
    Controller  Con1(ID_Instruction[31:26],IDEX_Ctrl, IDMEM_Ctrl, IDWB_Ctrl, ID, ID_Instruction[5:0]);
    Mux9Bit2To1 conex(ID_EX_Ctrl,0, IDEX_Ctrl, control);
    Mux2Bit2To1 conmem(ID_MEM_Ctrl,0, IDMEM_Ctrl, control);
    Mux4Bit2To1 conwb(ID_WB_Ctrl, 0,IDWB_Ctrl, control);
    SignExtension_5  SignEX1(ID_Instruction[10:6], ID_SignExtend_10_6);
    Equal eq(ID_Read1, ID_Read2, eqflag);
    compTo0 com(ID_Read1, less, equal);
    specBranch s(less, equal, ID[5], ID_Instruction[20:16], specBflag);
    and testAnd( BEQ_sat,eqflag, ID[6]);
    and BNEand(BNE_sat, ID[4], ~eqflag);
    and BGTZAnd(BGTZ_sat, ID[3], ~less);
    or BLEZOr(lessorequal, less, equal);
    and BLEZAnd(BLEZ_sat, ID[2], lessorequal);
    or branchOr( PCSrc, BLEZ_sat, BGTZ_sat,BNE_sat,BEQ_sat,specBflag );
    ShiftLeft2_26_28 SignEX2(ID_Instruction[25:0], Shifted_jr);
    ShiftLeftBy2 branchad(ID_SignExtend, shiftedImmeadiate);
    Adder branchadd(ID_BranchAddResult, shiftedImmeadiate, ID_PCAddResult);

    IDEXReg IDEX(Clk,Reset, ID_WB_Ctrl, ID_MEM_Ctrl, ID_PCAddResult, ID_EX_Ctrl, ID_SignExtend, ID_SignExtend_10_6, ID_Read1, ID_Read2, ID_Instruction[20:16], ID_Instruction[15:11], EX_WBCtrl, EX_MEMCtrl, EX_RegDst, EX_ALUOp, EX_ALUSrc, EX_halfbyte, EX_PCAddResult, EX_Read1, EX_Read2, EX_SignExtend,EX_SignExtend_10_6,EX_Instruction16_20, EX_Instruction5_11);
    ForwardingUnit FWD(ID_Instruction16_20, ID_Instruction5_11, EX_Instruction16_20, EX_Instruction5_11, MEM_RegDst, Reg_Write, WB_RegDst, WB_RegWrite, ForwardA, ForwardB);
	Mux3To1_5bit REGDST(EX_WriteRegData, EX_Instruction16_20, EX_Instruction5_11,5'b11111, EX_RegDst);
    ALUControl ALUCON(EX_ALUOp,EX_SignExtend[5:0],shift,ALUCon); 
    Mux32Bit2To1 ALUSrc(ALUB, EX_Read2, EX_SignExtend, EX_ALUSrc);
    SignExtension_5  SignEXB(EX_Instruction16_20, specBext);
    Mux32Bit2To1 Shift(ALUA, EX_Read1, EX_SignExtend_10_6, shift);
    
    Mux32Bit3To1 ALUMux1(ALUInput1, ALUA, MEM_Read, WB_Read, ForwardA);
    Mux32Bit3To1 ALUMux2(ALUInput2, ALUB, MEM_Read, WB_Read, ForwardB);

    ALU32Bit ALU(ALUCon, ALUA, ALUB, EX_ALUResult, EX_ZeroFlag);
    SignExtension_8 sb(EX_Read2[7:0], storeByte);
    SignExtension sh(EX_Read2[15:0], storeHalf);
    Mux32Bit3To1 shsb(EX_WriteMemData, EX_Read2, storeHalf,storeByte, EX_halfbyte);
   
            
    EX_MEM EXMEM(EX_WBCtrl, EX_MEMCtrl, EX_PCAddResult, EX_ALUResult, EX_WriteMemData, EX_WriteRegData,Clk, Reset, MEM_WB_Ctrl,M_MemRead, M_MemWrite,MEM_PCAddResult, M_ALUResult, M_WriteMemData,MEM_RegDst); 

    DataMemory dat(M_ALUResult, M_WriteMemData, Clk, M_MemWrite, M_MemRead, MEM_Read,Reset);

    
    
    MEM_WB_RegFile MEMWB(Clk, Reset, MEM_WB_Ctrl, MEM_Read, MEM_PCAddResult, M_ALUResult, MEM_RegDst, WB_halfbyte, WB_MemToReg, WB_RegWrite, WB_PCAddResult, WB_Read, WB_ALUResult, WB_RegDst);
    SignExtension_8 lb(WB_Read[7:0], loadByte);
    SignExtension lh(WB_Read[15:0], loadHalf);
    Mux32Bit2To1 lhlb(lhlbResult, loadByte, loadHalf, WB_halfbyte);
    Mux32Bit4To1 MemtoReg(WriteDataint, WB_Read, WB_ALUResult,WB_PCAddResult,lhlbResult, WB_MemToReg);
    Mux32Bit2To1 writeDisplay(WriteData, 0, WriteDataint, WB_RegWrite);

   
endmodule
