module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output reg [7:0] q
);  
    always @ (posedge clk or posedge areset) begin // when use @(posedge areset), use if(areset). Or errors will occur.
        if (areset) begin
            q <= 8'b0;
        end
        else begin
            q <= d;
        end
    end
endmodule
