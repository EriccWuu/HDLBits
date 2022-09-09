module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
);
    wire w_heater, w_aircon;
    assign w_heater = mode & too_cold;
    assign w_aircon = ~mode & too_hot;
    assign heater = w_heater;
    assign aircon = w_aircon;
    assign fan = w_heater | w_aircon | fan_on;
endmodule
