`timescale 1ns / 1ps


module Controller_tb(); 
reg [5:0] OpCode;
wire [8:0] EX;
wire [4:0] M;
wire [3:0] WB;
wire ID;

 Controller u0(
        .OpCode(OpCode), 
        .EX(EX), 
        .M(M), 
        .WB(WB), 
        .ID(ID)
    );

	initial begin

	OpCode <= 6'b000000;
  	#100
	OpCode <= 6'b000001;
  	#100
	OpCode <= 6'b000010;
  	#100
	OpCode <= 6'b000011;
  	#100
	OpCode <= 6'b000100;
  	#100
	OpCode <= 6'b000101;
  	#100
	OpCode <= 6'b000110;
  	#100
	OpCode <= 6'b000111;
  	#100
	OpCode <= 6'b001000;
  	#100
	OpCode <= 6'b001010;
  	#100
	OpCode <= 6'b001100;
  	#100
	OpCode <= 6'b001101;
  	#100
	OpCode <= 6'b001110;
  	#100
	OpCode <= 6'b011100;
  	#100
	OpCode <= 6'b100000;
  	#100
	OpCode <= 6'b100001;
  	#100
	OpCode <= 6'b100011;
  	#100
	OpCode <= 6'b101000;
  	#100
	OpCode <= 6'b101001;
  	#100
	OpCode <= 6'b101011;
  	#100

	end
endmodule
