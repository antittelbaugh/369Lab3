`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2022 04:28:33 PM
// Design Name: 
// Module Name: ShiftLeftBy2
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


module ShiftLeftBy2(in, out);
    input [31:0] in;
    output reg [31:0] out;
    always @(in)begin
        out <= {in[31:2], 2'b00};
    end
endmodule
