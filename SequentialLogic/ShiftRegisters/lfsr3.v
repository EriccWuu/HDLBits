module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output reg [2:0] LEDR);  // Q

    // solution 1
    // always @(posedge KEY[0])begin 
    //     LEDR[0] <= KEY[1] ? SW[0] : LEDR[2];
    //     LEDR[1] <= KEY[1] ? SW[1] : LEDR[0];
    //     LEDR[2] <= KEY[1] ? SW[2] : LEDR[2] ^ LEDR[1]; 
    // end

    // solution 2
    reg [2:0]ledr_next;

    always @(*) begin
        ledr_next = {LEDR[1:0], 1'b0};
        ledr_next[0] = KEY[1] ? SW[0] : LEDR[2];
        ledr_next[1] = KEY[1] ? SW[1] : LEDR[0];
        ledr_next[2] = KEY[1] ? SW[2] : (LEDR[2] ^ LEDR[1]);
    end

    always @(posedge KEY[0]) begin
        LEDR <= ledr_next;
    end

endmodule
