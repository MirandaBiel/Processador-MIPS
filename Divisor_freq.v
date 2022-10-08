module Divisor_freq
(clock_in,clock_out);
input clock_in;
output reg clock_out;

always @(posedge clock_in)
begin
 clock_out <= (clock_out)? 1'b0:1'b1;
end
endmodule