module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    wire w[99:0];
    genvar i;
    generate
        for(i = 0; i < 100; i = i + 1) begin: gen
            assign {cout[i], sum[i]} = i ? (a[i] + b[i] + cout[i-1]) : (a[0] + b[0] + cin);
        end
    endgenerate
endmodule


