module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire w[99:0];
    genvar i;
    generate
        for(i = 0; i < 100; i = i + 1) begin: bcdadd100
            bcd_fadd bcd_fadd(a[4*i+3-:4], b[4*i+3-:4], i ? w[i-1] : cin, w[i], sum[4*i+3-:4]);
        end
        assign cout = w[99]; // remember to drive cout by w[99]
    endgenerate
endmodule
