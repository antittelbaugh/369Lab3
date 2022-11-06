`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 02:05:57 PM
// Design Name: 
// Module Name: HazardDetectionUnit
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
module HazardDetectionUnit();

	input [4:0] IF_ID_Rs, IF_ID_Rt, ID_EX_Rd, EX_MEM_Rd, MEM_WB_Rd;
	input jumpReg, jump,  IF_ID_MemWrite, ID_EX_RegWrite, ID_EX_MemRead, EX_MEM_MemRead, MEM_WB_RegWrite, MEM_WB_MemToReg, branch;
	output reg PCWrite,IF_ID_Write, control, IF_ID_flush;

	always @(*) begin
		if(jumpReg==1) && ((MEM_WB_Rd==IF_ID_Rs)||(ID_EX_Rd==IF_ID_Rs)||(EX_MEM_Rd==IF_ID_Rs)){
			PCWrite<=0;
			IF_ID_Write<=0;
			control<=0;
		}
		else{
			IF_ID_flush<=1;
		}
		if(jump==1){
			IF_ID_flush<=1;
		}
		if (branch == 1){
			IF_ID_flush<=1;
		}

		if((MEM_WB_RegWrite==1)&&((MEM_WB_Rd==IF_ID_Rs) || (MEM_WB_Rd==IF_ID_Rt)){
			PCWrite<=0;
			IF_ID_Write<=0;
			control<=0;
		}
		if((MEM_WB_MemToReg==1)&&((MEM_WB_Rd==IF_ID_Rs) || (MEM_WB_Rd==IF_ID_Rt)){
			PCWrite<=0;
			IF_ID_Write<=0;
			control<=0;
		}
		if((EX_MEM_MemRead==1) && ((EX_MEM_Rd==IF_ID_Rs)||(EX_MEM_Rd==IF_ID_Rt))){
			PCWrite<=0;
			IF_ID_Write<=0;
			control<=0;
		}
		if((ID_EX_RegWrite==1) &&((ID_EX_Rd==IF_ID_Rs)||(ID_EX_Rd==IF_ID_Rt)){
			PCWrite<=0;
			IF_ID_Write<=0;
			control<=0;
		}
		if((ID_EX_MemWrite==1) &&((ID_EX_Rd==IF_ID_Rs)||(ID_EX_Rd==IF_ID_Rt)){
			PCWrite<=0;
			IF_ID_Write<=0;
			control<=0;
		}

endmodule
