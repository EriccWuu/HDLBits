module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    reg [7:0]Q;
    always @(posedge clk) begin
        Q <= in;
        pedge <= ~Q & in;
    end

endmodule
