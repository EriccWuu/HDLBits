module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0]sr;
    always @(posedge clk) begin
        if(!resetn)
            sr <= 0;
        else
            sr <= {in, sr[3:1]};
    end
    assign out = sr[0];
endmodule
