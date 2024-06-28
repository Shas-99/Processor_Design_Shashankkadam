`include "define.v"
`timescale 1ns / 1ps


module IF_ID_stage(
    //inputs
    clk,
    rst,
    instruction_in,
    
    //output
    instruction_out
    );
    
    input clk,rst;
    input [`ISIZE-1:0] instruction_in;
    output reg [`ISIZE-1:0] instruction_out;
    
    always @(posedge clk)
    begin
        if(rst)
            begin
                instruction_out<=0;
            end
     else
        begin
            instruction_out<=instruction_in;
        
        
        end
     end

    
endmodule
