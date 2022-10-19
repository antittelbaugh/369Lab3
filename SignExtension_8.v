`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension_8(in, out);

    /* A 16-Bit input word */
    input [7:0] in;
    
    /* A 32-Bit output word */
    output reg[31:0] out;
    
	always @(*)
	begin
		out <= {{24{in[7]}}, in};
	end

endmodule
