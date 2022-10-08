module ExtSinal(sinal_16,sinal_32);
input [15:0] sinal_16;
output wire [31:0] sinal_32;
wire [31:0] comp_1, comp_0; // completa com 1's e completa com 0's (32 bits)
assign comp_1 = {16'hffff,sinal_16};
assign comp_0 = {16'h0000,sinal_16};
assign sinal_32 = (sinal_16[15]) ? comp_1 : comp_0; // analisa e extende o sinal dependendo de signal[15], o ultimo bit 
endmodule
