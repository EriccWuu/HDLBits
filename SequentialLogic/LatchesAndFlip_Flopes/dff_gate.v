module top_module (
    input clk,
    input in, 
    output reg out);
    wire w;
    assign w = in ^ out;
    always @(posedge clk) begin
        out <= w;
    end
endmodule
