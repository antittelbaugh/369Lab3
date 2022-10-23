module Data_Path_tb();
reg Reset, Clk;

    
    Data_Path d1(
    .Reset(Reset), 
    .Clk(Clk)
    );
    
   
	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin
	    Reset <=1;
	    #30
        Reset <= 0;
        #30
        Reset <= 1;
        #30
        Reset <= 0;

	end
endmodule