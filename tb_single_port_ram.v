`timescale 1ns / 1ps
module tb_single_port_ram#(
                         parameter data_width =8,
                         parameter addr_size=4,
                         parameter mem_depth=16
                        )
                        ();
                        
      reg clk,wr_rd,cs,out_en;
      reg [addr_size-1:0] address;
      reg [data_width-1:0] data_in;
      wire [data_width-1:0] data_out;
      
      
      single_port_ram RAM(.clk(clk), .wr_rd(wr_rd), .cs(cs), .out_en(out_en), .address(address), .data_in(data_in), .data_out(data_out));
      always #5 clk=~clk;
      
      initial
      begin
      clk=0;#5
      
      wr_rd=1'h1;cs=1;out_en=0;#10;
      address=4'd0;
      data_in=8'b00110111;
      #20
      
      address=4'd4;
      data_in=8'b10001000;
      #20
      
      address=4'd7;
      data_in=8'b01010101;
      #20
      
      wr_rd=1'h0;cs=1; out_en=1;#10
      address=4'd0;
      #20
      
      address=4'd4;
      #20
      
      address=4'd7;
      #20
      $finish;
      end
                        
endmodule
