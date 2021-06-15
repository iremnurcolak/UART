`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 10:23:04 AM
// Design Name: 
// Module Name: UART_receiver
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


module UART_receiver(
    input           system_clk      ,
    input           system_rst      ,
    input           RX              ,
  
    
    output  reg [7:0]   data            ,
    output  reg     data_en=0,
    output  reg     corrupted
    );
 
    reg[20:0] cycles_per_bit =868;
    reg [3:0] index=4'd0;
    integer num_of_cycles=0;
    reg mesgul=0;
    reg parity_bit=0;
    reg stop_bit=0;

    always @(posedge system_clk) begin
        if( system_rst )begin
            data_en<=0;
            index<=4'd0;
            num_of_cycles<=0;
            mesgul<=0;
        end
        else if ( !system_rst ) begin
            if(!mesgul)data_en<=0;
            if(!mesgul && RX==0&& num_of_cycles ==(cycles_per_bit-1)/2)begin
                data_en<=0;
                mesgul <=1;
                num_of_cycles <=  num_of_cycles+1;
                
            end
            else if(mesgul&& num_of_cycles ==(cycles_per_bit-1)/2 ) begin
                           
                if(index <8) begin     
                    data[index] <= RX;
                    index <= index+1;
                end
                if(index==8)begin
                    index <= index+1;
                    parity_bit <= RX;
                end
                if(index==9) begin
                    
                    stop_bit <= RX;
                    index <= index+1;
  
                        if(parity_bit==(data[7]^data[6]^data[5]^data[4]^data[3]^data[2]^data[1]^data[0]))begin
                            corrupted <=0;
                        end
                        else begin 
                            corrupted <=1;
                        end
                        
                end
                if(index==10)begin
                    index <=0;
                    mesgul<=0;
                    data_en<=1;
                   
                end
            end
        end
        
        
        if (!system_rst && num_of_cycles<cycles_per_bit-1) begin
             num_of_cycles <=  num_of_cycles+1;

        end
        else if (!system_rst) begin
            num_of_cycles <=0;
        end
    end
endmodule
