module top_module (input x, input y, output z);
    wire za, zb;
    assign za = x & ~y;
    assign zb = ~(x ^ y);
    assign z = (za | zb) ^ (za & zb);
endmodule
