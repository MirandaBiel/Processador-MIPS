module mux2_32
(e0,e1,ch,saida);

input [31:0] e0, e1;
input ch;
output reg [31:0] saida;

always @(*)
begin
	if(ch == 1'b0)
		begin
		saida = e0;
		end
	else
		begin
		saida = e1;
		end
end
endmodule