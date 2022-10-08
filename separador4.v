module separador4
(entrada,funct,offset);
input [15:0] entrada;
output wire [15:0] offset;
output wire [5:0] funct;
assign funct = entrada[5:0];
assign offset = entrada;
endmodule
