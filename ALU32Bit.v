`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, ALUResultHi, Zero);

	input [4:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs
    reg [63:0] tmp;
	output reg [31:0] ALUResult;
	output reg [31:0] ALUResultHi;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0
	
	always@(ALUResult) begin
	   if(ALUResult == 0)begin
	       Zero <= 1;
	   end
	   else begin
	       Zero <= 0;
	   end
	end
	always@(A,B, ALUControl) begin
	   case(ALUControl)
	       //ADD
	       4'b0000 : ALUResult <= A + B;
	       //Subtract
	       4'b0001 : ALUResult <= A - B;
	       //MUL
	       4'b0010 : begin
	                   {ALUResultHi,ALUResult} <= (A*B);
	                end
	       //bgez
	       4'b0011 : begin
	                   if(A >= 0)begin
	                   ALUResult <= 1;
	                   end
	                   else begin
	                   ALUResult <= 0;
	                   end
	                  end

	       //blez
	       4'b0101 : begin
	                   if(A <= 0)begin
	                   ALUResult <= 1;
	                   end
	                   else begin
	                   ALUResult <= 0;
	                   end
	                  end

	       //and
	       4'b1000 : ALUResult <= A & B;
	       //or
	       4'b1001 : ALUResult <= A | B;
	       //nor
	       4'b1010 : ALUResult <= ~(A|B);
	       //xor
	       4'b1011 : ALUResult <= A ^ B;
	       //sll
	       4'b1100 : ALUResult <= A << B;
	       //srl
	       4'b1101 : ALUResult <= A >> B;
	       //slt
	       4'b1110 :begin
	                   if(A < B)begin
	                    ALUResult <= 1;
	                    end
	                    else begin
	                    ALUResult <= 0;
	                    end
	                 end
	       default: ALUResult <= -1;
    endcase
    end
    /* Please fill in the implementation here... */

endmodule

