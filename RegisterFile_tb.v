`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk, Rst;
    reg [4:0] i;
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2),
		.Rst(Rst)
	);

	initial begin
	   Rst<=0;
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	#100
    RegWrite <= 1;                    
        for (i=8; i<25; i=i+1) begin           
           WriteRegister <= i; 
           WriteData <= i*3;
           #100;
        end
    
   
    RegWrite <= 0;                
        for (i=8; i<25; i=i+2) begin           
            ReadRegister1 <= i;
            ReadRegister2 <= i+1; 
            #100;
        end    
        
	end
	

endmodule
