module top_module (
    input clk,
    input d,
    output q
);
    // solution 1
    reg q1, q2;
    always @(posedge clk) begin
        q1 <= d;
    end

    always @(negedge clk) begin
        q2 <= d;
    end

    assign q = clk ? q1 : q2;

    // solution 2, recommanded
    // reg q1,q2;
    // 
    // always @(posedge clk) begin
    //     q1<= d ^ q2;
    // end
    // 
    // always @(negedge clk) begin
    //     q2<= d ^ q1;
    // end
    // 
    // assign q = q1 ^ q2; 

endmodule
