module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    wire [99:0]w;

    genvar i;
    generate
        for(i = 0; i < 100; i = i + 1) begin: adder1
            fadd1 fadd1(a[i], b[i], i ? w[i-1] : cin, sum[i], w[i]);
        end
    endgenerate
    assign cout = w[99];

    // or simply add two inputs
    // assign {cout, sum} = a + b + cin;

endmodule

module fadd1 (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule