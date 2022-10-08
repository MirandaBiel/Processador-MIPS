module PC
(pc_in,pc_out,clock,reset);

input [31:0] pc_in;
input clock, reset;
output reg [31:0] pc_out;
	
initial begin
	pc_out = 32'b00000000000000000000000000000000;
end
always@(posedge clock)
begin
if (reset)
	pc_out = 32'b00000000000000000000000000000000;
else
	pc_out = pc_in;
end
endmodule
