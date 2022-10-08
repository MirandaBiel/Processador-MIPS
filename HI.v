module HI
(hi_in,hi_out,clock,reset);

input [31:0] hi_in;
input clock, reset;
output reg [31:0] hi_out;
	
initial begin
	hi_out = 32'b00000000000000000000000000000000;
end
always@(posedge clock)
begin
if (reset)
	hi_out = 32'b00000000000000000000000000000000;
else
	hi_out = hi_in;
end
endmodule