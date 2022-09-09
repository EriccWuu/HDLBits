module top_module(
    input [31:0] a,
    input [31:0] b,
    output reg[31:0] sum
);
    wire w_cout;
    wire [15:0]w_sum1 , w_sum2;
    add16 add16_inst0(a[15-:16], b[15-:16], 1'b0, sum[15-:16], w_cout);
    add16 add16_inst1(a[31-:16], b[31-:16], 1'b0, w_sum1);
    add16 add16_inst2(a[31-:16], b[31-:16], 1'b1, w_sum2);
    
    always@(*) begin
        case(w_cout)
            1'b0: sum[31-:16] = w_sum1;
            1'b1: sum[31-:16] = w_sum2;
        endcase
    end


endmodule
