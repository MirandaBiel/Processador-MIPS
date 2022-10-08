module mux2
(e0,e1,ch,saida);

input e0, e1, ch;
output reg saida;

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