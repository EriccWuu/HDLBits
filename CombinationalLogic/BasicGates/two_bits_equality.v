module top_module ( input [1:0] A, input [1:0] B, output z ); 
    // two ways to implement the EQ circurt, but circurts synthesized are diffenent.
    // assign z = A == B ? 1'b1 : 1'b0;
    assign z = &(~(A ^ B));
endmodule
