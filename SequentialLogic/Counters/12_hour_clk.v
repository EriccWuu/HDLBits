`timescale 1ms/1ns

module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
    ); 

    wire [3:0] h[1:0], m[1:0], s[1:0];
    wire [1:0] en_h, en_m, en_s;
    wire [1:0] rst_s, rst_m, rst_h;
    wire rst_h2;
    
    // reset signal of each byte
    assign rst_s[0] = reset;
    assign rst_s[1] = (s[1] == 4'd5 && s[0] == 4'd9) | reset;
    
    assign rst_m[0] = reset;
    assign rst_m[1] = (m[1] == 4'd5 && m[0] == 4'd9 && rst_s[1]) | reset;

    assign rst_h[0] = reset;
    assign rst_h[1] = (h[1] == 4'd1 && h[0] == 4'd2 && m[1] == 4'd5 && m[0] == 4'd9 && s[1] == 4'd5 && s[0] == 4'd9);
    assign rst_h2 = (h[1] == 4'd1 && h[0] == 4'd2 && rst_m[1]);
    
    // en signal of each byte
    assign en_s[0] = ena;
    assign en_s[1] = (s[0] == 4'd9) & ena;

    assign en_m[0] = (s[1] == 4'd5) & en_s[1] & ena;
    assign en_m[1] = (m[0] == 4'd9) & en_m[0] & ena;
    
    assign en_h[0] = (m[1] == 4'd5) & en_m[1] & ena;
    assign en_h[1] = (h[0] == 4'd9) & en_h[0] & ena;
    
    // second
    counter0to9 s0(clk, rst_s[0], en_s[0], s[0]);
    counter0to9 s1(clk, rst_s[1], en_s[1], s[1]);
    
    // minute
    counter0to9 m0(clk, rst_m[0], en_m[0], m[0]);
    counter0to9 m1(clk, rst_m[1], en_m[1], m[1]);
    
    // hour
    counter_h0 h0(clk, rst_h[0], rst_h2, en_h[0], h[0]);
    counter4 h1(clk, rst_h[1], reset, en_h[1], 4'd1, h[1]);

    assign ss = {s[1], s[0]};
    assign mm = {m[1], m[0]};
    assign hh = {h[1], h[0]};
    
    // pm
    always @(posedge clk) begin
        if(reset)
            pm <= 1'b0;
            else if(hh == 8'b0001_0001 && mm == 8'b0101_1001 && ss == 8'b0101_1001)
            pm <= ~pm;
    end

endmodule

module counter_h0 (
    input clk,
    input reset1, reset2,        // Synchronous active-high reset
    input ena,
    output reg [3:0] q);
    
    always @(posedge clk) begin 
        if(reset1)
            q <= 4'd2;
        else if(ena) begin
            if(q == 4'd9)
                q <= 4'd0;
            else if(reset2)
                q <= 4'd1;
            else
                q <= q + 1'b1;
        end
    end

endmodule

module counter4 (
    input clk,
    input reset,        // Synchronous active-high reset
    input set,          // Synchronous active-high set
    input ena,
    input [3:0]d,
    output reg [3:0] q);
    
    always @(posedge clk) begin 
        if(reset)
            q <= 4'd0;
        else if(set)
            q <= d;
        else if(ena) begin
            if(q == 4'd9)
                q <= 4'd0;
            else
                q <= q + 1'b1;
        end
    end

endmodule

module counter0to9 (
    input clk,
    input reset,        // Synchronous active-high reset
    input ena,
    output reg [3:0] q);
    
    always @(posedge clk) begin 
        if(reset)
            q <= 4'b0;
        else if(ena) begin
            if(q == 4'd9)
                q <= 4'b0;
            else
                q <= q + 1'b1;
        end
    end

endmodule