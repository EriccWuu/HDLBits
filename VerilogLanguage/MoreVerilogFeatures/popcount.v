module top_module( 
    input [254:0] in,
    output reg [7:0] out );
    integer i;
    always @(*) begin
        out = 8'b0; // remember to set a explicit value to avoid latches!
        for(i = 0; i < 255; i = i + 1)
            out = out + in[i];
    end
endmodule
