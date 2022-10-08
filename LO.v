module LO
(lo_in,lo_out,clock,reset);

input [31:0] lo_in;
input clock, reset;
output reg [31:0] lo_out;
	
initial begin
	lo_out = 32'b00000000000000000000000000000000;
end
always@(posedge clock)
begin
if (reset)
	lo_out = 32'b00000000000000000000000000000000;
else
	lo_out = lo_in;
end
endmodule