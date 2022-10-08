module separador5
(ent_32,saida_8);
input [31:0] ent_32;
output wire [7:0] saida_8;
assign saida_8 = ent_32[7:0];
endmodule
