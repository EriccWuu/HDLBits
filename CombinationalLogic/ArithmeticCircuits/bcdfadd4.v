module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0]w;
    
    genvar i;
    generate
        for(i = 0; i < 4; i = i + 1) begin: bcd_fadd
            bcd_fadd1 bcd_fadd(a[4*i+:4], b[4*i+:4], i ? w[i-1] : cin, w[i], sum[4*i+:4]);
        end
    endgenerate
    assign cout = w[3];
    
endmodule

module bcd_fadd1 (
    input [3:0] a, b,
    input cin,
    output cout,
    output [3:0] sum
);
    // must be 5'b01001, or carry-bit of (a + b + cin) will be discarded(truncated).
    assign {cout, sum} = (a + b + cin > 5'b01001) ? {1'b1, a + b + cin + 4'b0110} : {1'b0, a + b + cin}; 
    // or delcare a wire[4:0] to store sum of (a + b + cin), which is recommended
    // wire [4:0]w;
    // assign w = a + b + cin;
    // assign {cout, sum} = (w > 5'b01001) ? {1'b1, w + 4'b0110} : {1'b0, w};
endmodule
