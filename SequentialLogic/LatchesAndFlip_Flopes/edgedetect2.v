module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
    reg [7:0]Q;
    always@(posedge clk) begin
        Q <= in;
        anyedge <= Q ^ in;
    end
endmodule
