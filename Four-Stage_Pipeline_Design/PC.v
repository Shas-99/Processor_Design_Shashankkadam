`include "define.v"


module PC1(
       clk,
		 rst,       
		 nextPC,		 
		 currPC);
		 
		  
		 input clk,rst;		 
		 input [`ASIZE - 1:0]nextPC;		 //instruction address is 16 bit as it can address more memory locations
		 output reg [`ASIZE - 1:0]currPC;

		always @(posedge clk or posedge rst)
	 begin
    	if (rst) begin
        // Reset PC to 0 when rst is high
       	 	currPC <= 0;
    	end else begin
        // Load the next PC value on each clock cycle
        	 currPC <= nextPC+1; 
    end
	end
		 
		 
		 

endmodule	

