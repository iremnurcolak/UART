`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2021 10:42:46 AM
// Design Name: 
// Module Name: UART
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


//buadrate=115200
//you can change baudrate in UART_receiver and UART_transmitter;
module UART_top(
    input           system_clk      ,
    input           system_rst      ,
    input           RX              ,
    output          TX                     

  
    );
    

    wire   busy   ;
    wire [7:0]data_o_w;
    wire  data_en_o_w;
    wire corrupted_w;
    
    UART_transmitter uut(system_clk,system_rst,data_o_w,data_en_o_w,TX,busy);
    UART_receiver uut2 (system_clk,system_rst,RX,data_o_w,data_en_o_w,corrupted_w);


endmodule
