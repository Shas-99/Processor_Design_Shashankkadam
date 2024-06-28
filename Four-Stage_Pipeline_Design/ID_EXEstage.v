`include "define.v"

module ID_EXE_stage (
	
clk,  rst, aluop_cntrl,rdata1,rdata2,signextender, waddr, aluop_cntrl_out, alusrc_cntrl, 
alusrc_cntrl_out,
rdata1_out , rdata2_out, signextender_out, waddr_out 
);

    input clk, rst;
    input [2:0] aluop_cntrl;
    input [0:0] alusrc_cntrl;
    input [`DSIZE-1:0] rdata1;
    input [`DSIZE-1:0] rdata2;
    input [`DSIZE-1:0] signextender;
    input [`ASIZE-1:0] waddr;
    
    output reg [2:0] aluop_cntrl_out;
    output reg [0:0] alusrc_cntrl_out;
    output reg [`DSIZE-1:0] rdata1_out;
    output reg [`DSIZE-1:0] rdata2_out;
    output reg [`DSIZE-1:0] signextender_out; 
    output reg [`ASIZE-1:0] waddr_out;

//Here we need not take write enable (wen) as it is always 1 for R and I type instructions.
//ID_EXE register to save the values.

always @(posedge clk)
    begin
        if(rst)
            begin
                aluop_cntrl_out <=0;
                alusrc_cntrl_out <=0;
                rdata1_out <=0;
                rdata2_out <=0;
                signextender_out <=0;
                waddr_out <=0;
            end
     else
        begin
            aluop_cntrl_out <=aluop_cntrl;
            alusrc_cntrl_out <=alusrc_cntrl;
            rdata1_out <=rdata1;
            rdata2_out <=rdata2;
            signextender_out <=signextender;
            waddr_out <=waddr;
        
        
        end
     end


endmodule


