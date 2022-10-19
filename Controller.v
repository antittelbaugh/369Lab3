`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2022 02:58:29 PM
// Design Name: 
// Module Name: Controller
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


module Controller(OpCode,EX, M, WB, ID);
    input [5:0] OpCode;
    output reg [8:0] EX; //[8:7] shsb, [6:3] ALUOP, [2] ALU Src, [1:0] RegDst
    output reg [4:0] M; // 4 Branch, 3 MemREad, 2  MemWrite, 1 specBranch, 0 BNE
    output reg [3:0] WB;// 3 lhlb, [2:1] Mem to Reg, 0Reg Write
    output reg ID; // 1 jump
    
    always@(OpCode) begin
	   case(OpCode) 
	       //R-type
	       6'b000000: begin
	           EX[8:7] <= 0; //shsb
	           EX[6:3] <= 3'b0000;// ALUOP
	           EX[2] <= 0; // ALUSrc
	           EX[1:0] <= 1;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 1'bx; //lblh
               WB[2:1] <= 1;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end
           //BGEZ or BLTZ
           6'b000001: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0010;//[3:2] ALUOP
	           EX[2] <= 3; // ALUSrc
	           EX[1:0] <= 2'bx;//RegDst
	           M[4] <= 1;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 1;//specBranch
	           M[0] <= 0;//BNE
               WB[2:1] <= 'bX;//MemtoReg
               WB[3] <= 'bX; //lblh
               WB[0] <= 0;//RegWrite
               ID <= 0; //jump
           end
           //jump
           6'b000010: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 'bX;//[3:2] ALUOP
	           EX[2] <= 'bX; // ALUSrc
	           EX[1:0] <= 'bX;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
               WB[2:1] <= 'bX;//MemtoReg
               WB[3] <= 'bX; //lblh
               WB[0] <= 0;//RegWrite
               ID <= 1; //jump
           end
           //jump and link
           6'b000011: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 'bX;//[3:2] ALUOP
	           EX[2] <= 'bX; // ALUSrc
	           EX[1:0] <= 2;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 2;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 1; //jump
           end
                      //BEQ
           6'b000100: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0001;//[3:2] ALUOP
	           EX[2] <= 0; // ALUSrc
	           EX[1:0] <= 'bX;//RegDst
	           M[4] <= 1;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 'bX;//MemtoReg
               WB[0] <= 0;//RegWrite
               ID <= 0; //jump
           end
           //BNE
           6'b000101: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0001;//[3:2] ALUOP
	           EX[2] <= 0; // ALUSrc
	           EX[1:0] <= 'bX;//RegDst
	           M[4] <= 1;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 1;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 'bX;//MemtoReg
               WB[0] <= 0;//RegWrite
               ID <= 0; //jump
           end
           //BLEZ
           6'b000110: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0011;//[3:2] ALUOP
	           EX[2] <= 'bX; // ALUSrc
	           EX[1:0] <= 'bX;//RegDst
	           M[4] <= 1;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 1;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 'bX;//MemtoReg
               WB[0] <= 0;//RegWrite
               ID <= 0; //jump
           end 
           //BGTZ
           6'b000111: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0100;//[3:2] ALUOP
	           EX[2] <='bX; // ALUSrc
	           EX[1:0] <= 'bX;//RegDst
	           M[4] <= 1;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 1;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 'bX;//MemtoReg
               WB[0] <= 0;//RegWrite
               ID <= 0; //jump
           end
           //ADDI
           6'b001000: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0101;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 0;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 1;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end  
            //SLTI
           6'b001010: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0111;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 0;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 1;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end
          //ANDI
           6'b001100: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b1000;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 0;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 1;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end
          //ORI
           6'b001101: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b1001;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 0;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 1;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end
          //XORI
           6'b001110: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b1010;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 0;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 1;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end
          //MUL
           6'b011100: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b1011;//[3:2] ALUOP
	           EX[2] <=0; // ALUSrc
	           EX[1:0] <= 1;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 1;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end
          //LB
           6'b100000: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0101;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 0;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 1;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 0; //lblh
               WB[2:1] <= 3;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end
              //LH
           6'b100001: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0101;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 0;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 1;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 1; //lblh
               WB[2:1] <= 3;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end
           //LW
           6'b100011: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0101;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 0;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 1;//MemRead
	           M[2] <= 0;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 0;//MemtoReg
               WB[0] <= 1;//RegWrite
               ID <= 0; //jump
           end
           //SB
           6'b101000: begin
               EX[8:7] <= 2; //shsb
	           EX[6:3] <= 4'b0101;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 2'bxx;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 1;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 1'bx; //lblh
               WB[2:1] <= 'bX;//MemtoReg
               WB[0] <= 0;//RegWrite
               ID <= 0; //jump
           end
           //SH
           6'b101001: begin
               EX[8:7] <= 1; //shsb
	           EX[6:3] <= 4'b0101;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 'bX;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 1;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 'bX;//MemtoReg
               WB[0] <= 0;//RegWrite
               ID <= 0; //jump
           end
           //SW
           6'b101001: begin
               EX[8:7] <= 0; //shsb
	           EX[6:3] <= 4'b0101;//[3:2] ALUOP
	           EX[2] <=1; // ALUSrc
	           EX[1:0] <= 'bX;//RegDst
	           M[4] <= 0;//Branch
	           M[3] <= 0;//MemRead
	           M[2] <= 1;//MemWrite
	           M[1] <= 0;//specBranch
	           M[0] <= 0;//BNE
	           WB[3] <= 'bX; //lblh
               WB[2:1] <= 'bX;//MemtoReg
               WB[0] <= 0;//RegWrite
               ID <= 0; //jump
           end

 endcase          
   end        
               
               
	           
	           
    
endmodule
