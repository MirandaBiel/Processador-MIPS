module separador1
(entrada,bus_25_0,bus_25_21,bus_20_16,bus_15_11,bus_15_0,bus_20,bus_31_26,bus_10_6);
input [31:0] entrada;
output wire [25:0] bus_25_0;
output wire [4:0] bus_25_21, bus_20_16, bus_15_11, bus_10_6;
output wire [15:0] bus_15_0;
output wire bus_20;
output wire [5:0] bus_31_26;

assign bus_25_0 = entrada[25:0];
assign bus_25_21 = entrada[25:21];
assign bus_20_16 = entrada[20:16];
assign bus_15_11 = entrada[15:11];
assign bus_15_0 = entrada[15:0];
assign bus_20 = entrada[20];
assign bus_31_26 = entrada[31:26];
assign bus_10_6 = entrada[10:6];

endmodule
