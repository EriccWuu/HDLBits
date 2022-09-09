module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire[15:0] w_o1, w_o2;
    wire w_cin;
    add16 add16_1(a[15-:16], b[15-:16], 1'b0, w_o1, w_cin);
    add16 add16_2(a[31-:16], b[31-:16], w_cin, w_o2);
    assign sum = {w_o2, w_o1};

endmodule
