module separador7
(ent_32,saida_12);
input [31:0] ent_32;
output wire [11:0] saida_12;
assign saida_12 = ent_32[13:2];
endmodule
