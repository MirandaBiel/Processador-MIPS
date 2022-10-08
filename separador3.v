module separador3
(ent_4,ent_28,saida);
input [3:0] ent_4;
input [27:0] ent_28;
output wire [31:0] saida;
assign saida = {ent_4,ent_28};
endmodule
