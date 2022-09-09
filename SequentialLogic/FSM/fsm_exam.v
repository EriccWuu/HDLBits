module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
); 

    // state space define
    parameter HIGH = 1, LOW = 0;
    reg cstate, nstate;

    // state transition logic
    always @(*) begin
        case(cstate)
            HIGH: nstate = (s == 3'b001) ? LOW : HIGH;
            LOW: nstate = (s == 3'b011) ? HIGH : LOW;
        endcase
    end

    // state flip-flops with synchronous reset
    always @(posedge clk) begin
        if(reset)
            ;
        else
            cstate <= nstate;
    end

    // output logic
    always @(posedge clk) begin
        {fr1, fr2, fr3} = ~s;
    end
     

endmodule
