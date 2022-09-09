module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    always @(posedge clk) begin
        if(load)
            q <= data;
        else if(ena) begin
            case(amount)
                2'b00: q <= {q[0+:63], 1'b0};            // left shift 1-bit
                2'b01: q <= {q[0+:56], 8'b0};            // left shift 8-bit
                2'b10: q <= {q[63], q[63-:63]};          // right shift 1-bit
                2'b11: q <= {{8{q[63]}}, q[63-:56]};     // right shift 8-bit
            endcase
        end
    end
endmodule
