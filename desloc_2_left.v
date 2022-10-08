module desloc_2_left
(entrada,saida);
input [25:0] entrada;
output wire [27:0] saida;
//concatenação com 00
assign saida = {entrada,2'b00};
endmodule
