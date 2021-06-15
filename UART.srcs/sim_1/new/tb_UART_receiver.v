`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2021 10:07:01
// Design Name: 
// Module Name: tb_UART_receiver
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


module tb_UART_receiver(

    );
    reg system_clk;
    reg system_rst;
    reg RX;
    wire [7:0] data;
    wire data_en;
    wire corrupted;
    
    UART_receiver uut(system_clk,system_rst,RX,data,data_en,corrupted);
    
    always begin
        system_clk = ~system_clk; #5;
    end
    
    initial begin
        system_clk=1;
        system_rst=0;
        RX=0; #20; RX=1; #20;RX=1; #20;RX=1; #20;RX=1; #20;RX=0; #20;RX=0; #20;RX=0; #20;RX=0; #20;RX=0; #20;RX=1; #20;
    
    
    end
endmodule
