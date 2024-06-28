`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2024 16:32:48
// Design Name: 
// Module Name: signextender
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


module signextender(
    input [15:0] input_16,
    output reg [31:0] output_32
);

always @(*) begin
    if (input_16[15] == 1'b1) // if MSB of input is 1 (negative number)
        output_32 = {16'b11111111_11111111, input_16}; // sign extend by duplicating MSB
    else // if MSB of input is 0 (positive number)
        output_32 = {16'b00000000_00000000, input_16}; // sign extend with zeros
end

endmodule
