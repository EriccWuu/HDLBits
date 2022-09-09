module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);
    wire w_in[1:0];
    assign w_in[0] = E ? w : Q;
    assign w_in[1] = L ? R : w_in[0];
    always @(posedge clk) begin
        Q <= w_in[1];
    end

    // always @(posedge clk) begin
    //     case({E,L})
    //         2'b00:Q<=Q;
    //         2'b01:Q<=R;
    //         2'b10:Q<=w;
    //         2'b11:Q<=R;
    //     endcase
    // end
 
endmodule
