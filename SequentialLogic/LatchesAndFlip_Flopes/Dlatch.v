module top_module (
    input d, 
    input ena,
    output reg q);
    // assign q = ena ? d : q;
    always @(*) begin
        if(ena)
            q = d;
    end
endmodule
