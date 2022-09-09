module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
//    genvar i;    
//    generate
//        for(i = 0; i < 3; i = i + 1) begin: gen
//            assign out_both[i] = in[i] & in[i+1];
//            assign out_any[i+1] = in[i] | in[i+1];
//            assign out_different[i] = (in[i] ^ in[i+1]);
//        end
//    endgenerate 
//    assign out_different[3] = (in[0] ^ in[3]);
    assign out_both = in[3:1] & in[2:0];
    assign out_any = in[3:1] | in[2:0];
    assign out_different = in ^ {in[0], in[3:1]};

endmodule
