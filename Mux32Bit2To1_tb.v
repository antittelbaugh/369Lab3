`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 02:05:57 PM
// Design Name: 
// Module Name: Mux32BitTo1_tb
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


module Mux32Bit2To1_tb(

    );
    reg	[31:0] inA;
	reg	[31:0] inB;
	reg	sel;
    
	wire [31:0]	out;

	Mux32Bit2To1 u0(
        .out(out), 
        .inA(inA), 
        .inB(inB), 
        .sel(sel)
    );
        
	initial begin

        #100 inA <= 32'h00000001; inB <= 32'h00000002; sel <= 1'b0;
       

        #100 inA <= 32'h00000001; inB <= 32'h00000002; sel <= 1'b1;
        
        
        #100 inA <= 32'hF0000001; inB <= 32'hF0000002; sel <= 1'b0;
        

        #100 inA <= 32'hF0000001; inB <= 32'hF0000002; sel <= 1'b1;
        
        
	end
        
endmodule
