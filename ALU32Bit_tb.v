`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [4:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs
    wire [31:0] ALUResultHi;
	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .ALUResultHi(ALUResultHi),
        .Zero(Zero)
    );

	initial begin
	
        ALUControl <= 4'b0000;
        A <= 1;
        B <= 2;
        #100
        A <= 1;
        B <= -1;
        #100
	    ALUControl <= 4'b0001;
        #100
        A <= 2;
        B <= 2;
        #100
        ALUControl <= 4'b0010;
        #100
        A <= 0;
        B <= 2;
        #100
        A <= -1;
        B <= 2;
        #100
        ALUControl <= 4'b0011;
        #100
        A <= 0;
        #100
        A <= 1;
        #100
        ALUControl <= 4'b0101;
        #100
        A <= 0;
        #100
        A <= -1;
        #100
        ALUControl <= 4'b1000;
        A <= 1;
        B <= 0;
        #100
        A <= 1;
        B <= 1;
        #100
        A <= 2;
        B <= 1;
        #100
        ALUControl <= 4'b1001;
        #100
        ALUControl <= 4'b1010;
        #100
        ALUControl <= 4'b1011;
        #100
        A <= 1;
        B <= 3;
        #100
        ALUControl <= 4'b1100;
        #100
        A <= 1;
        B <= 0;
        #100
        A <= 1;
        B <= 1;
        #100
        ALUControl <= 4'b1101;
        #100
        A <= 2;
        B <= 1;
        #100
        A <= 4;
        B <= 2;
        #100
        ALUControl <= 4'b1110;
        #100
        A <= 1;
        B <= 6;
        
	end

endmodule

