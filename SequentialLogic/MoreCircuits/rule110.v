module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q ); 

    wire[511:0] q_ln, q_rn;
    assign q_rn = {q[510:0], 1'b0};
    assign q_ln = {1'b0, q[511:1]};
    always @(posedge clk) begin
        if(load)
            q = data;
        else
            q = q&~q_rn | q&~q_ln | ~q&q_rn;
    end

endmodule