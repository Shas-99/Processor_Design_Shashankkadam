`include"define.v"
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////////
//// Company: IIT Goa
//// Author: Shashank Kadam
////////////////////////////////////////////////////////////////////////////////////

module datapath_mux (
	// inputs
	clk,
	rst,
	inst,

	//outputs
	aluout
);

// inputs
input		  clk;
input		  rst;
input  [`ISIZE-1:0] inst;


// outputs
output  [`DSIZE-1:0] aluout;

wire [2:0]	aluop;
wire alusrc;
wire [2:0]	aluop_output;
wire alusrc_output;
wire regDST;
wire wen;
wire [`DSIZE-1:0] rdata1;
wire [`DSIZE-1:0] rdata2;
wire [`DSIZE-1:0] wdata_out_in;
wire [`DSIZE-1:0] rdata1_output;
wire [`DSIZE-1:0] rdata2_output;
wire [`DSIZE-1:0] wdata_out;
wire [`ASIZE-1:0] waddr_out;
wire [15:0] signextend_input = inst[15:0];
wire [31:0] signextend_output;
wire [31:0] signextend2_output;

wire [`DSIZE-1:0]rdata2_imm=alusrc_output ? signextend2_output : rdata2_output;//Multiplexer to select the immediate value or rdata2 based on alusrc.
//when alusrc is 1 then connect immediate data to output else connect rdata2 to output

wire [`ASIZE-1:0]waddr_regDST=regDST ? inst[15:11] : inst[20:16];//Multiplexer to select the inst[15:11] or inst[20:16] as the waddr based on regDST.
//when regDST is 1 then connect inst[15:11] to output else connect inst[20:16] to output

//instantiate the control , Alu , regfile and the delay registers 


control C0
(.inst_cntrl(inst[31:26]),.wen_cntrl(wen),.alusrc_cntrl(alusrc),.regdst_cntrl(regDST),.aluop_cntrl(aluop));

regfile RF0
(.clk(clk),.rst(rst),.wen(wen),.raddr1(inst[25:21]),.raddr2(inst[20:16]),.waddr(waddr_out),.wdata(aluout),.rdata1(rdata1),.rdata2(rdata2));

signextender S0(
     .input_16(signextend_input),
     .output_32(signextend_output)
);



ID_EXE_stage IE0 (
	
.clk(clk),  .rst(rst), .aluop_cntrl(aluop),.rdata1(rdata1),.rdata2(rdata2),.signextender(signextend_output), .waddr(waddr_regDST), .aluop_cntrl_out(aluop_output), .alusrc_cntrl(alusrc), 
.alusrc_cntrl_out(alusrc_output),
.rdata1_out(rdata1_output) , .rdata2_out(rdata2_output), .signextender_out(signextend2_output), .waddr_out(waddr_out) 
);

alu ALU0
(.a(rdata1_output),.b(rdata2_imm),.op(aluop_output),.out(aluout));


endmodule // end of datapath module

