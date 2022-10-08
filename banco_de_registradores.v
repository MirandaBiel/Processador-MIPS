module banco_de_registradores
(clock, wren, end_reg_d, end_reg_1, end_reg_2, data_in, reg_d_out, reg_1_out, reg_2_out);
input clock;
input wren;
input [4:0] end_reg_d;
input [4:0] end_reg_1;
input [4:0] end_reg_2;
input [31:0] data_in;
output [31:0] reg_d_out;
output [31:0] reg_1_out;
output [31:0] reg_2_out;
reg [31:0] registradores[31:0];
initial begin // todos os registradores são inicialmente zerados
	for (int i = 0; i < $size(registradores); i++)
		registradores[i] = 32'b00000000000000000000000000000000;
end
always @(posedge clock) // quando o clock descer...
begin
if (wren) // se wren (write enable estiver ativado)
	if (end_reg_d != 0) // se o endereco de escrita nao for do $zero
		registradores[end_reg_d] <= data_in; // escreve o dado de entrada no registrador
end
//definindo o que aparece em cada saída
assign reg_d_out = registradores[end_reg_d];
assign reg_1_out = registradores[end_reg_1];
assign reg_2_out = registradores[end_reg_2];
endmodule