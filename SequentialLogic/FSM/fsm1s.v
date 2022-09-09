// // Note the Verilog-1995 module declaration syntax here:
// module top_module(clk, reset, in, out);
//     input clk;
//     input reset;    // Synchronous reset to state B
//     input in;
//     output out;//  
//     reg out;
// 
//     // Fill in state name declarations
//     parameter A = 0, B = 1;
// 
//     reg present_state, next_state;
// 
//     always @(posedge clk) begin
//         if (reset) begin  
//             // Fill in reset logic
//             present_state <= B;
//             out <= 1'b1;
//         end 
//         else begin
//             case (present_state)
//                 // Fill in state transition logic
//                 A: next_state <= in ? A : B;
//                 B: next_state <= in ? B : A; 
//             endcase
// 
//             // State flip-flops
//             present_state = next_state;   
// 
//             case (present_state)
//                 // Fill in output logic
//                 A: out <= 1'b0;
//                 B: out <= 1'b1;
//             endcase
//         end
//     end
// 
// endmodule

module top_module(
    input clk,
    input reset,    // Synchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case (state)
            A: begin
                next_state = in ? A : B;
            end
            B: begin
                next_state = in ? B : A;
            end
            default: state = state;
        endcase
    end

    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(reset)
            state <= B;
        else
            state <= next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == B);

endmodule
