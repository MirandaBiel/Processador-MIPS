module separador6
(ent_32,saida_14);
input [31:0] ent_32;
output wire [13:0] saida_14;
assign saida_14 = ent_32[15:2];
endmodule
