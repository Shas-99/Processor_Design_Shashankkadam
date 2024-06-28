`timescale 1ns / 1ps
`include "define.v"

module pipelined_3stage(clk, rst, aluout);

input clk;				
											
input rst;

output [`DSIZE-1:0] aluout;	

wire [`ASIZE-1:0] PCount;
wire [`ISIZE-1:0] Mem_data_output;
wire [`ISIZE-1:0] IFID_output;



PC1 PC0(
       .clk(clk),
		 .rst(rst),       
		 .nextPC(PCount),		 
		 .currPC(PCount)
		 );
		 
memory M0 ( .clk(clk), .rst(rst), .addr(PCount),.fileid(0), .data_out(Mem_data_output)

           );
   
IF_ID_stage ID0(
    //inputs
    .clk(clk),
    .rst(rst),
    .instruction_in(Mem_data_output),
    
    //output
    .instruction_out(IFID_output)
    );
    
datapath_mux D0(
	// inputs
	.clk(clk),
	.rst(rst),
	.inst(IFID_output),

	//outputs
	.aluout(aluout)
);

 
endmodule


