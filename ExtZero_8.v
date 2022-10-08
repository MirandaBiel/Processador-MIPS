module ExtZero_8(sinal_8,sinal_32);
input [7:0] sinal_8;
output wire [31:0] sinal_32;
wire [31:0] comp_0;
assign comp_0 = {24'h000000,sinal_8};
assign sinal_32 = comp_0;
endmodule
