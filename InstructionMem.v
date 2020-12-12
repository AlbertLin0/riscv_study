`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/05 09:15:03
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem(
	input clk,
	input res_n,
	input[7:0] i_addr,
	output[31:0] i_data
    );
reg[7:0] instruction_mem[0:255];  //以字节为单位

initial $readmemh ("Instuction.data", InstuctionMem);

always @ (posedge clk or negedge res_n) begin
	if(~res_n)begin
		i_data <= 32'h0000_0000;
	end
	else begin
		i_data <= {instruction_mem[i_addr],instruction_mem[i_addr+1],instruction_mem[i_addr+2],instruction_mem[i_addr+3]};
	end
end
endmodule
