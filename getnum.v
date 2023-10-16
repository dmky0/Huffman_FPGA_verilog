`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/08 17:05:31
// Design Name: 
// Module Name: getnum
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

//getnum module is used to count the frequency of numbers
module getnum(
    Clk_in,
    nRst,
    Start,
    Data_in,
    Num0,//count appearing times of 0 
    Num1,
    Num2,
    Num3,
    Num4,
    Num5,
    Num6,
    Num7,
    Num8,
    Num9,
    Fin
    );
    //input signal
    input Clk_in;
    input nRst;
    input Start;
    input wire [3:0]Data_in;
    //output signal
    output reg [8:0]Num0;
    output reg [8:0]Num1;
    output reg [8:0]Num2;
    output reg [8:0]Num3;
    output reg [8:0]Num4;
    output reg [8:0]Num5;
    output reg [8:0]Num6;
    output reg [8:0]Num7;
    output reg [8:0]Num8;
    output reg [8:0]Num9;
    output reg Fin;
    //inner signal
    reg [7:0]Num_time;//use 256 cycles to input data at most
    reg Gn_en;//enable signal of getnum

    always @(negedge Start) begin
        Gn_en<=1;
    end

    always @(posedge Clk_in or negedge nRst) begin
        if(~nRst)//initial the number
            begin
                Fin<=0;
                Num0<=9'b00;
                Num1<=9'b00;
                Num2<=9'b00;
                Num3<=9'b00;
                Num4<=9'b00;
                Num5<=9'b00;
                Num6<=9'b00;
                Num7<=9'b00;
                Num8<=9'b00;
                Num9<=9'b00;
                Num_time<=8'h00;
                Gn_en<=0;
            end
        else if(Gn_en)
            begin
                case(Data_in)
                    4'h0:Num0<=Num0+1;
                    4'h1:Num1<=Num1+1;
                    4'h2:Num2<=Num2+1;
                    4'h3:Num3<=Num3+1;
                    4'h4:Num4<=Num4+1;
                    4'h5:Num5<=Num5+1;
                    4'h6:Num6<=Num6+1;
                    4'h7:Num7<=Num7+1;
                    4'h8:Num8<=Num8+1;
                    4'h9:Num9<=Num9+1;
                    default: Gn_en<=0;//if Data_in == Ha or Hb or Hc or Hd or He or Hf, end counting
                endcase
            end
    end

    always @(posedge Clk_in or negedge nRst) begin
            if(&Num_time)begin
                Gn_en<=0;//end counting                
                Fin=1;
            end//Num_time == 8'Hff
        end

    always @(posedge Clk_in or negedge nRst) begin
            if(Gn_en)
                Num_time<=Num_time+1;
        end

endmodule
