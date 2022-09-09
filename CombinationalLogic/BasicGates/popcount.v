module top_module( 
    input [2:0] in,
    output [1:0] out );
    // Apparently, always-for can solve the problem, but solution blow is more elegent.
    assign out = ^in ? (&in ? 2'd3 : 2'd1) : (|in ? 2'd2 : 2'd0);
endmodule
