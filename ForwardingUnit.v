`timescale 1ns / 1ps

module ForwardingUnit(ID_RegRs, ID_RegRt, EX_RegRs, EX_RegRt, MEM_Rd, MEM_RegWrite, WB_Rd, WB_RegWrite, ForwardA, ForwardB);
	input [4:0] ID_RegRs, ID_RegRt, EX_RegRs, EX_RegRt, MEM_Rd, WB_Rd;
	input MEM_RegWrite, WB_RegWrite;

	output [1:0] ForwardA;
	output [1:0] ForwardB;



	
	
	always @(ID_RegRs, ID_RegRt, EX_RegRs, EX_RegRt, MEM_Rd, WB_Rd, MEM_RegWrite, WB_RegWrite) begin
           
			ForwardA<= 2'b00;
			ForwardB<=2b'00;
	
        //FORWARDING TO EXECUTE RS
		if (EX_RegRs == MEM_Rd && MEM_RegWrite == 1) begin

			ForwardA <= 2'b01;

		end 
		else if (EX_RegRs == WB_Rd && WB_RegWrite == 1) begin

			ForwardA <= 2'b10;

		end 
		else begin

			ForwardA <= 2'b00;
		end

		//FORWARDING TO EXECUTE RT
		if (EX_RegRt == MEM_Rd && MEM_RegWrite == 1) begin

			ForwardB <= 2'b01;
		end 
		else if (EX_RegRt == WB_Rd && WB_RegWrite == 1) begin

			ForwardB <= 2'b10
		end 
		else begin

			ForwardB <= 2'b00;
		end
		
		// FORWARDING TO DECODE
		if (ID_RegRs == MEM_Rd && MEM_RegWrite == 1 && MEM_Rd != 0) begin
			ForwardA <= 2'b01;
        	end 
		else if (ID_RegRs == WB_Rd && WB_RegWrite == 1 && WB_Rd != 0) begin
			ForwardA <= 2'b10;
		end 
		else begin
			ForwardA <= 2'b00;
		end
		
		if (ID_RegRt == MEM_Rd && MEM_RegWrite == 1 && MEM_Rd != 0) begin
			ForwardB <= 2'b01;
        	end 
		else if (ID_RegRt == WB_Rd && WB_RegWrite == 1 && WB_Rd != 0) begin
			ForwardB <= 2'b10;
		end 
		else begin
			ForwardB <= 2'b00;
		end
		

	end
	
	
	
endmodule
