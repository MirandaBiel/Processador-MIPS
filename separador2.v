module separador2
(bus_32,bus_4);
input [31:0] bus_32;
output wire [3:0] bus_4;
assign bus_4 = bus_32[31:28];
endmodule
