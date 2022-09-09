module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    // solution 1
    reg [31:0]temp_in;

    integer i;
    always @(posedge clk) begin
        temp_in <= in;
        for(i = 0; i < 32; i = i + 1) begin
            case({temp_in[i] & ~in[i], reset})
                2'b10: out[i] <= 1'b1; // detect negetive edge
                2'b11: out[i] <= 1'b0; // synchronous reset of precedence, case blow is the same.
                2'b01: out[i] <= 1'b0;
                default: out[i] <= out[i]; // latch(capture)
            endcase
        end
    end
    
    // solution 2
    // reg [31:0] temp_in;
    // 
    // always @(posedge clk) begin
    //     temp_in <= in;
    // end
    // 
    // always @(posedge clk) begin
    //     if(reset)begin
    //         out <= 32'b0;
    //     end
    //     else begin
    //         out <= temp_in & ~in | out; // latch
    //     end
    // end
 
endmodule
