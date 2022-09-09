module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    assign {cout[0], sum} = a[0]+ b[0]+ cin;
    assign {cout[1], sum} = a[1]+ b[1]+ cout[0];
    assign {cout[2], sum} = a[2]+ b[2]+ cout[1];
    
    wire [2:0]w;
    genvar i;
    generate
        for(i = 0; i < 3; i = i + 1) begin: fadd1
            fadd1 fadd1(a[i], b[i], i ? w[i-1] : cin, sum[i], w[i]);
        end
    endgenerate
    assign cout = w;
     
endmodule

module fadd1 (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule