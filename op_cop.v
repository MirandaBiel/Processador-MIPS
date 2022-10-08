//Responsavel por dar a informação para o cooprocessador de qual operação realizar
module op_cop(funct, sinal_mux_11,sinal_mux_13,sinal_mux_14, op, opcod);

	input [5:0]funct; //Informação de 6 bits que vem do separador 1
	input [5:0] opcod;
	
	output sinal_mux_11;
	output sinal_mux_13;
	output sinal_mux_14;
	output [2:0]op; //operação para o cooprocessador
	
	reg [2:0]aux_op;
	reg aux_sinal_mux_11;
	reg aux_sinal_mux_13;
	reg aux_sinal_mux_14;
	
	
	always@* begin
		aux_op = 3'b111;
		aux_sinal_mux_11 = 1'b0;
		aux_sinal_mux_13 = 1'b0;
		aux_sinal_mux_14 = 1'b0;
		
		if(opcod == 6'b000000) begin
			
			if(funct == 6'b011010) begin //DIV
				
				aux_op = 2'b011;
				aux_sinal_mux_13 = 1'b1;
				aux_sinal_mux_14 = 1'b1;
			end
			
			else if(funct == 6'b011000) begin //MULT
				
				aux_op = 2'b000;
				aux_sinal_mux_13 = 1'b1;
				aux_sinal_mux_14 = 1'b1;
			end
		
		end
		
		else if(opcod == 6'b011100) begin
			
			if(funct == 6'b000010) begin //MUL
				
				aux_op = 2'b000;
				aux_sinal_mux_11 = 1'b1;
			end
			
			else if(funct == 6'b000000) begin //MADD
				
				aux_op = 2'b001;
				aux_sinal_mux_13 = 1'b1;
				aux_sinal_mux_14 = 1'b1;
			end
			
			else if(funct == 6'b000101) begin //MSUBU
				
				aux_op = 2'b010;
				aux_sinal_mux_13 = 1'b1;
				aux_sinal_mux_14 = 1'b1;
			end		
		end			
	end	
	assign op = aux_op;
	assign sinal_mux_11 = aux_sinal_mux_11;
	assign sinal_mux_13 = aux_sinal_mux_13;
	assign sinal_mux_14 = aux_sinal_mux_14;
	
endmodule