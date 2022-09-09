module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    // // method 1: one-hot code
    // parameter A = 0, B = 1, C = 2, D = 3;
    // reg[3:0] cstate, nstate;
    // // State transition logic
    // always @(*) begin
    //     nstate[A] = (cstate[A] & ~in) | (cstate[C] & ~in);
    //     nstate[B] = (cstate[A] & in) | (cstate[B] & in) | (cstate[D] & in);
    //     nstate[C] = (cstate[B] & ~in) | (cstate[D] & ~in);
    //     nstate[D] = (cstate[C] & in);    
    // end
    

    // // State flip-flops with synchronous reset
    // always @(posedge clk) begin
    //     if(reset)
    //         cstate <= 4'b0001;
    //     else
    //         cstate <= nstate;
    // end

    // // Output logic
    // assign out = cstate[D];

    // method 2: none-one-hot code
    parameter A = 0, B = 1, C = 2, D = 3;
    reg[1:0] cstate, nstate;

    // state transition
    always @(*) begin
        case(cstate)
            A: nstate <= in ? B : A;
            B: nstate <= in ? B : C;
            C: nstate <= in ? D : A;
            D: nstate <= in ? B : C;
        endcase
    end

    // state flip-flops with synchronous reset
    always @(posedge clk) begin
        if(reset)
            cstate <= A;
        else
            cstate <= nstate; 
    end
    
    // output login
    assign out = (cstate == D);

endmodule
