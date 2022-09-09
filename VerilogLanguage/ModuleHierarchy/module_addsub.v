module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire w_cout;
    wire [31:0]w_b;
    assign w_b = b ^ {32{sub}}; // b XOR with sub. whenever sub is 1, invert b.


    add16 add16_inst0(a[15-:16], w_b[15-:16], sub, sum[15-:16], w_cout);
    add16 add16_inst1(a[31-:16], w_b[31-:16], w_cout, sum[31-:16]);
endmodule 