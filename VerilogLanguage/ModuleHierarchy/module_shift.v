module top_module ( input clk, input d, output q );
    wire dff1_dff2, dff2_dff3;
    my_dff dff1(
        .clk(clk),
        .d(d),
        .q(dff1_dff2)
    );
    
    my_dff dff2(
        .clk(clk),
        .d(dff1_dff2),
        .q(dff2_dff3)
    );
    
    my_dff dff3(
        .clk(clk),
        .d(dff2_dff3),
        .q(q)
    );
endmodule
