module ExtSinal_8(sinal_8,sinal_32);
input [7:0] sinal_8;
output wire [31:0] sinal_32;
wire [31:0] comp_1, comp_0; // completa com 1's e completa com 0's (32 bits)
assign comp_1 = {24'hffffff,sinal_8};
assign comp_0 = {24'h000000,sinal_8};
assign sinal_32 = (sinal_8[7]) ? comp_1 : comp_0; // analisa e extende o sinal dependendo de signal[15], o ultimo bit 
endmodule
