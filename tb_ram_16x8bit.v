`timescale 1ns / 1ps
module tb_ram_16x8bit();

reg [7:0]data_in;
reg [4:0] ram_address;
reg write_enable;
reg clk;
wire [7:0]data_out;

ram_16x8bit  ram1(data_in , ram_address,write_enable,clk,data_out);

initial begin // clock initialization
clk =1'b1;
forever #10 clk=~clk;
end

initial
begin
// writing data into the memory
write_enable =1'b1;
#20;
ram_address=4'd0;
data_in = 8'h10;
#20;

ram_address=4'd2;
data_in = 8'h11;
#20;

ram_address=4'd7;
data_in = 8'haf;
#20;

//reading data from the memory
write_enable = 1'b0;

ram_address=4'd0;
#20;

ram_address=4'd2;
#20;

ram_address=4'd7;
#20;

$finish;
end
endmodule
    
