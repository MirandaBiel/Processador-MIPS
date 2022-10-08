module mux4_32
(e0,e1,e2,e3,ch,saida);

input [31:0] e0, e1, e2, e3;
input [1:0] ch;
output reg [31:0] saida;

always @(*)
begin
	if(ch == 2'b00)
		begin
		saida = e0;
		end
	else if (ch == 2'b01)
		begin
		saida = e1;
		end
	else if (ch == 2'b10)
		begin
		saida = e2;
		end
	else
		begin
		saida = e3;
		end
end
endmodule
