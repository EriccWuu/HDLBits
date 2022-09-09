`default_nettype none
module top_module(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out,
    output wire out_n   ); 
    
    wire end_o1, end_o2, or_o;
    
    assign end_o1 = a & b;
    assign end_o2 = c & d;
    assign out = end_o1 | end_o2;
    assign out_n = ~(end_o1 | end_o2);

endmodule