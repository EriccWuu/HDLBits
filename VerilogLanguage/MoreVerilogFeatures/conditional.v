module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0]interm_res[2:0];
    // assign intermediate_result1 = compare? true: false;
    assign interm_res[0] = a > b ? b : a;
    assign interm_res[1] = interm_res[0] > c ? c : interm_res[0];
    assign interm_res[2] = interm_res[1] > d ? d : interm_res[1];
    assign min = interm_res[2];
endmodule