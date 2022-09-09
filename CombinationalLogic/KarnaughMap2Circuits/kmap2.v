module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = b&d&c | ~a&~d | ~b&~c&d |a&~b&~c | a&~b&d;
    assign out = (~a | ~b | c) & (~b | c | ~d) & (a | b | ~c | ~d) & (~a | ~c | d);
endmodule
