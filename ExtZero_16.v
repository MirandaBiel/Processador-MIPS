module ExtZero_16(sinal_16,sinal_32);
input [15:0] sinal_16;
output wire [31:0] sinal_32;
wire [31:0] comp_0;
assign comp_0 = {16'h0000,sinal_16};
assign sinal_32 = comp_0;
endmodule
