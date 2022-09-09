module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output reg Z ); 

    reg[0:7] sr;
    always @(posedge clk) begin
        if(enable) begin
            sr <= {S, sr[0:6]}; 
        end
    end

    always @(*) begin
        case({A, B, C})
            3'd0: Z = sr[0];
            3'd1: Z = sr[1];
            3'd2: Z = sr[2];
            3'd3: Z = sr[3];
            3'd4: Z = sr[4];
            3'd5: Z = sr[5];
            3'd6: Z = sr[6];
            3'd7: Z = sr[7];
        endcase
    end

endmodule
