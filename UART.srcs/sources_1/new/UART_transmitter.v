`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 10:23:39 AM
// Design Name: 
// Module Name: UART_transmitter
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

module UART_transmitter(
    input           system_clk      ,
    input           system_rst      ,
    input   [7:0]   data            ,
    input           data_en         ,


    output    reg   TX=1            ,
    output    reg   bitti=0    
    );
    reg [20:0]cycles_per_bit=868;
    reg mesgul=1'b0;
    reg [3:0] index=4'b0;
    integer num_of_cycles=0;
    wire  parity_bit  = data[7]^data[6]^data[5]^data[4]^data[3]^data[2]^data[1]^data[0];

    
    wire [10:0] frame= {1'b1,parity_bit,data,1'b0};
    

    always @ (posedge system_clk ) begin
           
            if(!system_rst)begin
                if(data_en && !mesgul && index==0) begin

                        if(num_of_cycles==cycles_per_bit-1)begin
                            num_of_cycles<=0;
                            bitti        <= 1'b0;
                            mesgul      <= 1'b1;
                            TX          <= frame[index] ;  
                            index       <= index + 1;
                        end
                        else begin
                            num_of_cycles<= num_of_cycles+1;
                            bitti        <= 1'b0;
                            mesgul      <= 1'b1;
                            TX          <= frame[index] ;  
                        
                        end
                end
                if(mesgul)begin
                    if (index < 12) begin
                        if(num_of_cycles==cycles_per_bit-1)begin
                            num_of_cycles<=0;
                            
                            if(index==11)begin
                                index       <= 1'b0;
                                bitti        <= 1'b1;
                                mesgul      <= 1'b0;
                                TX          <= 1'b1;  
                            end
                            else begin
                                TX          <= frame[index] ;
                                index       <= index + 1;
                            
                            end
                        end
                        else begin
                            
                            
                            if(index==11)begin
                                index       <= 1'b0;
                                bitti        <= 1'b1;
                                mesgul      <= 1'b0;
                                TX          <= 1'b1;  
                                num_of_cycles<= 0;
                            end
                            else begin
                                TX          <= frame[index] ;
                                num_of_cycles<= num_of_cycles+1;
                            end
                        end
                       
                    end
  
                
                
                end
            end
            
            else if ( system_rst) begin
                bitti        <= 1'b0;
                mesgul      <= 1'b0;
                TX          <= 1'b1;
                index       <= 4'd0;
                num_of_cycles<=0;
            end
            
           

    end
    
  
    
endmodule
