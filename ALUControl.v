`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2022 02:35:49 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(ALUOp,func,jr,shift,ALUcon);
    input [3:0] ALUOp;
    input  [5:0] func; 
    output reg [3:0] ALUcon; // 4 Branch, 3 MemREad, 2  MemWrite, 1 specBranch, 0 BNE
    output reg  jr;// 3 lhlb, [2:1] Mem to Reg, 0Reg Write
    output reg shift; // 1 jump
    
    always@(ALUOp) begin
        case(ALUOp)
        //R-type
        4'b0000:begin
            case(func)
                //SLL
                6'b000000:begin
                    ALUcon <= 4'b1100;
                    jr <= 0;
                    shift <= 1;
                end
                //srl
                6'b000010:begin
                    ALUcon <= 4'b1101;
                    jr <= 0;
                    shift <= 1;
                end
                //jr
                6'b001000:begin
                    ALUcon <= 4'bxxxx;
                    jr <= 1;
                    shift <= 0;
                end
                //add
                6'b100000:begin
                    ALUcon <= 4'b0000;
                    jr <= 0;
                    shift <= 0;
                end
                //sub
                6'b100010:begin
                    ALUcon <= 4'b0001;
                    jr <= 0;
                    shift <= 0;
                end
                //and
                6'b100100:begin
                    ALUcon <= 4'b1000;
                    jr <= 0;
                    shift <= 0;
                end
                //or
                6'b100101:begin
                    ALUcon <= 4'b1001;
                    jr <= 0;
                    shift <= 0;
                end
                //xor
                6'b100110:begin
                    ALUcon <= 4'b1011;
                    jr <= 0;
                    shift <= 0;
                end
                //nor
                6'b100111:begin
                    ALUcon <= 4'b1010;
                    jr <= 0;
                    shift <= 0;
                end
                //slt
                6'b101010:begin
                    ALUcon <= 4'b1110;
                    jr <= 0;
                    shift <= 0;
                end
            endcase
        end
        //sub
        4'b0001:begin
           ALUcon <= 4'b0001;
           jr <= 0;
           shift <= 0; 
        end
        //special branch
        4'b0010:begin
           ALUcon <= 4'b0011;
           jr <= 0;
           shift <= 0;
        end
        //BLEZ
        4'b0011:begin
           ALUcon <= 4'b0101;
           jr <= 0;
           shift <= 0;
        end
        //BGTZ
        4'b0100:begin
           ALUcon <= 4'b0100;
           jr <= 0;
           shift <= 0;
        end
        //add
        4'b0101:begin
           ALUcon <= 4'b0000;
           jr <= 0;
           shift <= 0;
        end
        //slt
        4'b0111:begin
           ALUcon <= 4'b1110;
           jr <= 0;
           shift <= 0;
        end
        //and
        4'b1000:begin
           ALUcon <= 4'b1000;
           jr <= 0;
           shift <= 0;
        end
        //or
        4'b1001:begin
           ALUcon <= 4'b1001;
           jr <= 0;
           shift <= 0;
        end
        //or
        4'b1010:begin
           ALUcon <= 4'b1011;
           jr <= 0;
           shift <= 0;
        end
        //mul
        4'b1011:begin
           ALUcon <= 4'b0010;
           jr <= 0;
           shift <= 0;
        end
      
                
                    
     endcase           
  end      
endmodule
