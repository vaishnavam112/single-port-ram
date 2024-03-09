`timescale 1ns / 1ps
module ram_16x8bit(data_in , ram_address,write_enable,clk,data_out);
input [7:0]data_in;
input [4:0] ram_address;
input write_enable;
input clk;
output [7:0]data_out;

reg [7:0] ram_memory[16:0];   
reg [4:0] address_register;

always @(posedge clk)
begin
if (write_enable)  
  ram_memory[ram_address] <= data_in;
else 
  address_register <= ram_address;
end

assign data_out = ram_memory[address_register];

endmodule
