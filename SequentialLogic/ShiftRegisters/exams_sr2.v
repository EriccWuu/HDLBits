module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    wire clk, w, E, L;
    wire [3:0]r;
    wire [3:0]w_q;

    assign clk = KEY[0];
    assign w = KEY[3];
    assign E = KEY[1];
    assign L = KEY[2];
    assign r = SW;

    genvar i;
    generate
        for(i = 3; i > -1; i = i - 1) begin: muxdff
            MUXDFF muxdff(
                .clk(clk), 
                .w(i==3 ? w : w_q[i+1]),
                .r(r[i]),
                .E(E),
                .L(L),
                .q(w_q[i]) 
            );
        end
    endgenerate
    assign LEDR = w_q;
endmodule

module MUXDFF (
    input clk, 
    input w, r,
    input E, L,
    output reg q, qn
);

    wire d;
    assign d = L ? r : (E ? w : q);
    always @(posedge clk) begin
        q <= d;
        qn <= ~d;
    end

endmodule
