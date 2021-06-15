`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2021 12:18:59 PM
// Design Name: 
// Module Name: tb_UART_top
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


module tb_UART_top(

    );
    reg           system_clk      ;
    reg           system_rst      ;
    reg   RX       ; 
    wire TX          ;

    
    UART_top uut(system_clk,system_rst,RX,TX);
    
    always begin
        system_clk = ~system_clk; #5;
    end
    
    initial begin
       RX=1;
        system_clk=1;
        system_rst=0;
        #20;
  RX=0; #20; RX=1; #20;  RX=0; #20;  RX=1; #20;  RX=0; #20;  RX=1; #20;  RX=0; #20;  RX=1; #20;  RX=0; #20;  RX=0; #20;  RX=1;       
  
    
    end
    
endmodule
