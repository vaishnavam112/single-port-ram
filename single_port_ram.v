`timescale 1ns/1ps

module single_port_ram #(
                         parameter data_width =8,
                         parameter addr_size=4,
                         parameter mem_depth=16
                        )
                        (
                         input clk,wr_rd,cs,out_en,
                         input [addr_size-1:0] address,
                         input [data_width-1:0] data_in,
                         output [data_width-1:0] data_out
                        );

reg [data_width-1:0] memory [0:mem_depth-1];
reg [data_width-1:0] temp_data_out;

//memory write (wr_rd = 1)
always@(posedge clk) begin
    if(wr_rd && cs)
        memory[address] <= data_in;
end

//memory read (wr_rd = 0)
always@(posedge clk) begin
    if(cs && !wr_rd)
        temp_data_out <= memory[address];
end

assign data_out = (cs && !wr_rd && out_en)? temp_data_out:'hz;
                    
endmodule