module top_module (
    input [7:0] a,
    input [7:0] b, 
    output [7:0] s,
    output overflow
    );

    wire [7:0]w;
    genvar i;
    generate
        for(i = 0; i < 8; i = i + 1) begin: fadd1
            fadd1 fadd1(a[i], b[i], i ? w[i-1] : 1'b0, s[i], w[i]);
        end
    endgenerate
    // two ways to implement check of overflow, 
    // method 1: sign-bit of inputs are 1 and sum is 0, result overflowed. sign-bit of inputs are 0 and sum is 1, result overflow.
    // assign overflow = (a[7] & b[7] & ~s[7]) | ((~a[7]) & (~b[7]) & s[7]);
    // methid 2: carry-bits of sign-bit and heighest-bit are different, result overflowed.
    assign overflow = w[7] ^ w[6];
     
endmodule

module fadd1 (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule
