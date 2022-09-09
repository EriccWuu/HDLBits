module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);
    always @(posedge clk) begin
        if(!resetn) begin // synchronous reset
            q <= 16'b0;
        end
        else begin
            if(byteena) begin
                q[15-:8] <= byteena[1] ? d[15-:8] : q[15-:8];
                q[7-:8] <= byteena[0] ? d[7-:8] : q[7-:8];
            end
            else
                q <= q;
        end
    end
endmodule
