module multiplicador(Entrada_01, Entrada_02, hi_in, lo_in, op_cop, hi_out,lo_out, Result);
	
		//Entradas
		input [2:0]op_cop;//Codigo que vai indicar qual operação o cooprocessador vai realizar
		//00 multiplicação simples
		//01 multiplicação com soma
		//10 multiplicação com subtração
		//11 divisão simples
		
		input [31:0]hi_in; //Valor armazenado no bloco hi
		input [31:0]lo_in;//Valor armazenado no bloco lo
		input [31:0] Entrada_01;
		input [31:0] Entrada_02;
		
		//Variaveis auxiliares
		
		reg [63:0]aux_01;
		reg [31:0]aux_02;
		reg [63:0]aux_03;
		reg [63:0]Result_parcial;
		reg [31:0]Result_int;
		reg sinal;
		reg [31:0]E1; //Valor de entrada_01 que pode ser modificado
		reg [31:0]E2; //Valor de entrada_02 que pode ser modificado
		
		//Saidas
		output reg [31:0]hi_out;
		output reg [31:0]lo_out;
		output reg [31:0]Result;
		
		//inteiros auxiliares
		
		integer i; 
		
		//auxiliares para multiplicacao
		
		reg [31:0] Parte_A; // Refetente a A
		reg Parte_Q; // Referente a Q-1
		reg [30:0]temp;//auxilia no deslocamento para a esquerda(na parte da divisão)

		
	
	always@(*) begin
		
		temp = 31'd0;
		i = 0;
		Parte_A = 32'd0;
		Parte_Q = 1'b0;
		E1= Entrada_01;
		E2= Entrada_02;
		aux_01 = 63'd0;
		aux_02 = 32'd0;
		aux_03 = 63'd0;
		Result_parcial = 63'd0;
		Result_int = 31'd0;
		sinal = 1'b0;
		hi_out = 32'b0;
		lo_out = 32'b0;
		Result = 32'b0;
		
		if(op_cop != 2'b011) begin //multiplicação
			
			//Realizando a multiplicação
			//A = 00000000000000000000000000000000
			//Q = entrada_01
			//Q-1 = 0
			//M = entrada_02
			//Se o ultimo bit de Q for 1 e Q-1 for zero, então, A = A - M, se Q for zero e Q-1 for 1, então, A = A + M.
			//Deslocar todos os bits para a direita
			//Repetir 32 vezes esse processo
			
	
			
			
			//O ciclo para a multiplicação se repete 32 vezes(Quantidade de Bits)
			for(i =0; i < 32 ; i = i +1) begin 
				
				//Verificando de A = A - M ou A = A + M
				
				if(E1[0] != Parte_Q)begin
					if(E1[0] == 1)begin
						
						//Parte_A = Parte_A - Entrada_02
						
						Parte_A = Parte_A - E2;
					end
					
					if(E1[0] == 1'b0)begin
						//Parte_A = Parte_A + Entrada_02
						Parte_A = Parte_A + E2;
					end	
				end
				
				//Realizar deslocamento para a direita 
				
				Parte_Q = E1[0];
				aux_01 = {Parte_A[31], Parte_A[31:1],Parte_A[0],E1[31:1]};
				Parte_A = aux_01[63:32]; //Os 32 bits mais significativos estão em Parte_A, enquanto os outros estão em Entrada_01
				E1 = aux_01[31:0];
				
			
			end
			
			Result_parcial = {Parte_A, E1}; 
			Result = E1;
			
			
			//Verificando se o resultado vai somar com os valores de hi e lo
			
			if(op_cop == 2'b000) begin
				hi_out = Parte_A;
				lo_out = E1;
			end
			
			else if (op_cop == 2'b001) begin
				
				aux_03 = {hi_in,lo_in};
				aux_01 = aux_03 + Result_parcial;
				hi_out = aux_01[63:32];
				lo_out = aux_01[31:0];
			end
			else if (op_cop == 2'b010) begin
				
				aux_03 = {hi_in,lo_in};
				aux_01 = aux_03 - Result_parcial;
				hi_out = aux_01[63:32];
				lo_out = aux_01[31:0];
			end
		end	
		
		
		
		
		
		
		
		
		
		else if (op_cop == 2'b011)begin //divisão
		
			i = 31;
			
			//Verificando se entrada_01 é negativa, se for, transformar em positiva
			if(Entrada_01[31] == 1'b1)begin
				
				E1 = (- Entrada_01);
				
				sinal = 1'b1; //Sinal é negativo
 
				
			end
			
			
			//Verificando se Entrada_02 é negativa, se for, transformar em positiva
			if(Entrada_02[31] == 1'b1)begin
				
				E2 = (- Entrada_02);
				
				if(sinal == 1'b1)begin
					sinal = 1'b0; //Sinal é positivo
				end
			end
			
			
			//Meu "i" começa em 1 porque o primeiro bit é reservado para o sinal
			for (i = 31; i >= 0; i= i - 1) begin
				
				
				//Adicionando os valores de E1 em aux_02
				temp = aux_02[30:0];
				aux_02 = {temp, E1[i]};
				
				//Verificando se aux_02 é maior que o divisor
				
				if(aux_02 >= E2)begin
					
					//concatenar '1' em result_int (parte inteira do resultado)
					temp = Result_int[30:0];
					Result_int = {temp, 1'b1};
					
					//subtrair  aux_02 = aux_02 - Entrada_02
					
					aux_02 = aux_02 - E2;
				end
				
				else begin
					//concatenar '0' em result_int (parte inteira do resultado)
					temp = Result_int[30:0];
					Result_int = {temp, 1'b0};
				end	
			end 
			
			//Se o resultado tiver que ser negativo, convertemos Result_int para seu negativo em complemento a 2
			if(sinal == 1'b1)	begin
			
				Result_int = - Result_int;
				aux_02 = (-aux_02);
				
			end
					
			lo_out = Result_int; //Parte inteira
			hi_out = aux_02; //Resto da duivisao
		end
	
	end
	
endmodule