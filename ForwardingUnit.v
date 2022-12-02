`timescale 1ns / 1ps

module ForwardingUnit(ID_RegRs, ID_RegRt, EX_RegRs, EX_RegRt, MEM_Rd, MEM_RegWrite, WB_Rd, WB_RegWrite, EX_ReadData1MEM, EX_ReadData2MEM, EX_ReadData1WB, EX_ReadData2WB, ID_ReadData1MEM, ID_ReadData2MEM, ID_ReadData1WB, ID_ReadData2WB);

	input [4:0] ID_RegRs, ID_RegRt, EX_RegRs, EX_RegRt, MEM_Rd, WB_Rd;
	input MEM_RegWrite, WB_RegWrite;

	output ID_ReadData1MEM, ID_ReadData2MEM;
	output ID_ReadData1WB, ID_ReadData2WB; 
	output EX_ReadData1MEM, EX_ReadData2MEM; 
	output EX_ReadData1WB, EX_ReadData2WB; 

	
	
	always @(ID_RegRs, ID_RegRt, EX_RegRs, EX_RegRt, MEM_Rd, WB_Rd, MEM_RegWrite, WB_RegWrite) begin
            EX_ReadData1MEM <= 0;
            EX_ReadData2MEM <= 0;
            ID_ReadData1Overwrite <= 0;
            ID_ReadData2Overwrite <= 0;

        //FORWARDING TO EXECUTE RS
		if (EX_RegRs == MEM_Rd && MEM_RegWrite == 1) begin
			EX_ReadData1MEM <= 1; //forward from MEM to EX
			EX_ReadData1WB <= 0; 
		end 
		else if (EX_RegRs == WB_Rd && WB_RegWrite == 1) begin
			EX_ReadData1WB <= 1; //forward from WB to EX
			EX_ReadData1MEM <= 0;
		end 
		else begin
			EX_ReadData1MEM <= 0;
			EX_ReadData1WB <= 0; 
		end

		//FORWARDING TO EXECUTE RT
		if (EX_RegRt == MEM_Rd && MEM_RegWrite == 1) begin
			EX_ReadData2MEM <= 1;
      EX_ReadData2WB <= 0; 
    end 
    else if (EX_RegRt == WB_Rd && WB_RegWrite == 1) begin
			EX_ReadData2WB <= 1;
			EX_ReadDate2MEM <= 0;
		end 
    else begin
			EX_ReadData2MEM <= 0;
			EX_ReadData2WB <= 0;
		end
		
		// FORWARDING TO DECODE
		if (ID_RegRs == MEM_Rd && MEM_RegWrite == 1 && MEM_Rd != 0) begin
			ID_ReadData1MEM <= 1;
			ID_ReadData1WB<= 0;
    end 
    else if (ID_RegRs == WB_Rd && WB_RegWrite == 1 && WB_Rd != 0) begin
      ID_ReadData1WB <= 1;
			ID_ReadData1MEM <= 0;
		end 
    else begin
			ID_ReadData1MEM <= 0;
      ID_ReadData1WB <= 0;
		end
		
		if (ID_RegRt == MEM_Rd && MEM_RegWrite == 1 && MEM_Rd != 0) begin
			ID_ReadData2MEM <= 1;
      ID_ReadData2WB<= 0;
    end 
    else if (ID_RegRt == WB_Rd && WB_RegWrite == 1 && WB_Rd != 0) begin
      ID_ReadData2WB <= 1;
			ID_ReadData2MEM <= 0;
		end 
    else begin
			ID_ReadData2MEM<= 0;
      ID_ReadData2WB <= 0;
		end
		

	end
	
	
	
endmodule
