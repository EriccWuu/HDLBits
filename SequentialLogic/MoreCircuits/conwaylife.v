module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q ); 
    
    reg [2:0]cnt;
    integer i;

    always @(posedge clk) begin
        if(load)
            q <= data;
        else begin
            for(i = 0; i < 256; i = i + 1) begin
                if( i == 0 )
                    cnt = ( q[i+1] + q[i+15] ) + ( q[i+16] + q[i+17] +q[i+31] ) + ( q[i+240] + q[i+241] + q[i+255] );
                else if( i == 240)
                    cnt = ( q[i+1] + q[i+15] ) + ( q[i-16] + q[i-15] +q[i-1] ) + ( q[i-240] + q[i-239] + q[i-225] );
                else if( i == 15 )
                    cnt = ( q[i-1] + q[i-15] ) + ( q[i+16] + q[i+15] +q[i+1] ) + ( q[i+240] + q[i+239] + q[i+225] );
                else if( i == 255 )
                    cnt = ( q[i-1] + q[i-15] ) + ( q[i-16] + q[i-17] +q[i-31] ) + ( q[i-240] + q[i-241] + q[i-255] );
                else if( i < 15 && i > 0 )
                    cnt = ( q[i+1] + q[i-1] ) + ( q[i+16] + q[i+15] +q[i+17] ) + ( q[i+240] + q[i+239] + q[i+241] );
                else if( i < 255 && i > 240 )
                    cnt = ( q[i+1] + q[i-1] ) + ( q[i-16] + q[i-15] +q[i-17] ) + ( q[i-240] + q[i-239] + q[i-241] );
                else if( i%16 == 0 )
                    cnt = ( q[i+1] + q[i+15] ) + ( q[i+16] + q[i+31] +q[i+17] ) + ( q[i-16] + q[i-15] + q[i-1] );
                else if( i%16 == 15 )
                    cnt = ( q[i-1] + q[i-15] ) + ( q[i+16] + q[i+1] +q[i+15] ) + ( q[i-16] + q[i-17] + q[i-31] );
                else
                    cnt = ( q[i+1] + q[i-1] ) + ( q[i+16] + q[i+15] +q[i+17] ) + ( q[i-16] + q[i-15] + q[i-17] );

                case(cnt)
                    3'd2: q[i] <= q[i];
                    3'd3: q[i] <= 1'b1;
                    default: q[i] <= 1'b0;
                endcase
            end
        end     
    end

endmodule
