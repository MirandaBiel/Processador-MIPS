module banco_de_registradores_visual
(clock, wren, end_reg_d, end_reg_1, end_reg_2, data_in, reg_1_out, reg_2_out, reg_v1, reg_v2, reg_v3, reg_v4, reg_v5,
reg_v6, end_reg_v1, end_reg_v2, end_reg_v3, end_reg_v4, end_reg_v5, end_reg_v6);
input clock;
input wren;
input [4:0] end_reg_d;
input [4:0] end_reg_1;
input [4:0] end_reg_2;
input [31:0] data_in;
input [4:0] end_reg_v1, end_reg_v2, end_reg_v3, end_reg_v4, end_reg_v5, end_reg_v6;
output [31:0] reg_1_out;
output [31:0] reg_2_out;
output [31:0] reg_v1, reg_v2, reg_v3, reg_v4, reg_v5, reg_v6;
reg [31:0] registradores[31:0];

initial begin // todos os registradores são inicialmente zerados
	for (int i = 0; i < $size(registradores); i++)
		if (i==29)
			begin
				registradores[i] = 32'h7fffeffc;
			end
		else
			begin
				registradores[i] = 32'b00000000000000000000000000000000;
			end
end
always @(posedge clock) // quando o clock descer...
begin
if (wren) // se wren (write enable estiver ativado)
	if (end_reg_d != 0) // se o endereco de escrita nao for do $zero
		registradores[end_reg_d] <= data_in; // escreve o dado de entrada no registrador
end
//definindo o que aparece em cada saída
assign reg_1_out = registradores[end_reg_1];
assign reg_2_out = registradores[end_reg_2];
//para visualizar os registradores
assign reg_v1 = registradores[end_reg_v1];
assign reg_v2 = registradores[end_reg_v2];
assign reg_v3 = registradores[end_reg_v3];
assign reg_v4 = registradores[end_reg_v4];
assign reg_v5 = registradores[end_reg_v5];
assign reg_v6 = registradores[end_reg_v6];

endmodule