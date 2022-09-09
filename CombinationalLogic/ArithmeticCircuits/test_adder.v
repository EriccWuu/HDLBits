module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire [3:0]w;
    genvar i;
    generate
        for(i = 0; i < 4; i = i + 1) begin: fadd1
            fadd1 fadd1(x[i], y[i], i ? w[i-1] : 1'b0, sum[i], w[i]);
        end
    endgenerate
    assign sum[4] = w[3];
     
endmodule

module fadd1 (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule
