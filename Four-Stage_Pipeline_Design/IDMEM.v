`include "define.v"
`timescale 1ns / 1ps


module ID_IMEM_stage(
    //inputs
    clk,
    rst,
    waddr,
    alures,
    //output
    waddr_out,
    alures_out,
    );
    
    input clk,rst;
    input [`ASIZE-1:0] waddr;
    input [`DSIZE-1:0] alures;
    output reg [`ASIZE-1:0] waddr_out;
    output reg [`DSIZE-1:0] alures_out;
    
    always @(posedge clk)
    begin
        if(rst)
            begin
                waddr_out<=0;
                alures_out<=0;
            end
     else
        begin
            waddr_out<=waddr;
            alures_out<=alures;
        
        
        end
     end

    
endmodule
