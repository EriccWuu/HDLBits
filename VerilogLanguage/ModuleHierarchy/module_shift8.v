module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);
    wire [7:0]w[2:0];
    my_dff8 dff1(clk, d, w[0]);
    my_dff8 dff2(clk, w[0], w[1]);
    my_dff8 dff3(clk, w[1], w[2]);
    
    always@(*) begin
        case(sel)
            2'd0: q = d;
            2'd1: q = w[0];
            2'd2: q = w[1];
            2'd3: q = w[2];
        endcase
    end

endmodule
