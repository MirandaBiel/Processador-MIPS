module ExtSinal_18(sinal_18,sinal_32);
input [17:0] sinal_18;
output wire [31:0] sinal_32;
wire [31:0] comp_1, comp_0; // completa com 1's e completa com 0's (32 bits)
assign comp_1 = {14'b11111111111111,sinal_18};
assign comp_0 = {14'b00000000000000,sinal_18};
assign sinal_32 = (sinal_18[17]) ? comp_1 : comp_0; // analisa e extende o sinal dependendo de signal[15], o ultimo bit 
endmodule
