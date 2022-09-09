module top_module (
    input[31:0] a, b,
    output [31:0]sum
);

    wire [15:0]w;
    wire w1, w2;

    // genvar i;
    // generate
    //     for(i = 0; i < 16; i = i + 1) begin: gen
    //         add1 add1_inst(a[i], b[i], i == 0 ? 1'b0 : w[i-1], sum[i], w[i]);
    //     end
    // endgenerate
    add16 add16_inst0(a[15-:16], b[15-:16], 1'b0, sum[15-:16], w1);
    add16 add16_inst1(a[31-:16], b[31-:16], w1, sum[31-:16], w2);
    
endmodule


module add1 (
    input a, b, cin,
    output sum, cout
);
    assign sum = a^b^cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule