module ula_01(E1, E2, E3, opar, zero, Result, overflow);

//Entradas
input [31:0] E1;
input [31:0] E2;
input [4:0] E3;
input [4:0] opar; 

//Saida
output reg [31:0]Result;
output reg zero;
output reg overflow;

//Variaveia auxiliares

integer i = 0,temp;

reg [30:0]aux_01;
reg [4:0]aux_02;
reg [31:0]deslocado;
reg [5:0]j; //Contador em binário
reg one;
reg [15:0]aux_03;


//Identificando qual operação realizar;
	always@(*) begin
		
		Result = 32'd0;
		overflow = 1'b0;
		zero = 1'b0;
		deslocado = 32'b0;
		temp = 0;
		i = 0;
		one = 1'b0;
		aux_03 = 16'd0;
		
		//E1 + E2 (Sem overflow) //LW//ADDU
		if(opar == 5'b00000)begin
			
			Result = E1 + E2;
			
		end
		
		//E1 + E2 (Com overflow) //ADD//ADDI
		if(opar == 5'b00001)begin
			
			Result = E1 + E2;
			
			//Overflow
			
			if(E1[31] == E2[31])begin
				if(Result[31] != E1[31])begin
					
					overflow = 1'b1;
					
				end
			end
			
		end
		
		//E1 - E2 //SUB(Com overflow)
		else if (opar == 5'b00010)begin
			
			Result = E1 - E2; 
			
			//adicionar overflow
			
			one = (-E2[31]); //Invertendo para virar uma soma
			
			if(E1[31] == one)begin
				if(Result[31] != E1[31])begin
					
					overflow = 1'b1;
					
				end
			end
			
		end
		
		//E1 AND E2 //AND
		else if (opar == 5'b00011)begin
			
			Result = E1 & E2;
		end
		
		//E1 FOR IGUAL A E2, ZERO =1 //BEQ
		else if (opar == 5'b00100)begin
			
			if (E1 == E2) begin
				zero = 1'b1;
			end
			
			else begin 
				Result = 32'd0; //Apenas para o Result não ficar vazio
				zero = 1'b0;
			end
		end
		
		
		//E1 FOR DIFERENTE DE E2, ZERO =1 //BNE
		else if (opar == 5'b00101) begin
			
			if (E1 != E2) begin
				zero = 1'b1;
			end
		end
		
		//se E1 for menor que E2 retorna "1", "zero" caso o contrário //SLT
		else if (opar == 5'b00110) begin
			
			if(E1 < E2)begin
				
				Result = 32'd1;
			end
		end
		//se rt for maior que rs retorna "1", "zero" caso o contrário //TEQ
		else if (opar == 5'b10100) begin
			
			if(E1 == E2)begin
				
				overflow = 1'b1; //Realizar a exeção 
			end
		end
		//E1 OR E2 //OR
		else if (opar == 5'b00111) begin
			
			Result = E1 | E2;
		
		end
		
		//E1 NOR E2 // NOR //
		else if (opar == 5'b01000) begin
			
			Result = ~(E1 | E2);
			
		end
		
		//E1 XOR E2//XOR //Testado
		else if (opar == 5'b01001) begin 
			
			Result = E1 ^ E2;
		
		end
			

		//E1 - E2 (ignorando o sinal) //SEM OVErflow //SUBU //Testado
		else if(opar == 5'b01010) begin
			
			Result = E1 - E2;
		
		end
		
		//Deslocar para a esquerda e adicionar zeros //SLL //Testado
		else if(opar == 5'b01011) begin 
		
			
			deslocado = 32'b00000000000000000000000000000000;
					
			
			if(E3 == 5'b00001)begin
				deslocado[31:1] = E2[30:0];
				Result = deslocado;
			end
			else if(E3 == 5'b00010)begin
				deslocado[31:2] = E2[29:0];
				Result = deslocado;
			end
			else if(E3 == 5'b00011)begin
				deslocado[31:3] = E2[28:0];
				Result = deslocado;
			end
			else if(E3 == 5'b00100)begin
				deslocado[31:4] = E2[27:0];
				Result = deslocado;
			end
			else if(E3 == 5'b00101)begin
				deslocado[31:5] = E2[26:0];
				Result = deslocado;
			end
			else if(E3 == 5'b00110)begin
				deslocado[31:6] = E2[25:0];
				Result = deslocado;
			end
			else if(E3 == 5'b00111)begin
				deslocado[31:7] = E2[24:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01000)begin
				deslocado[31:8] = E2[22:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01001)begin
				deslocado[31:9] = E2[21:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01010)begin
				deslocado[31:10] = E2[20:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01011)begin
				deslocado[31:11] = E2[19:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01100)begin
				deslocado[31:12] = E2[18:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01101)begin
				deslocado[31:13] = E2[17:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01110)begin
				deslocado[31:14] = E2[16:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01111)begin
				deslocado[31:15] = E2[15:0];
				Result = deslocado;
			end
			else if(E3 == 5'b10000)begin
				deslocado[31:16] = E2[14:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01001)begin
				deslocado[31:17] = E2[13:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01010)begin
				deslocado[31:18] = E2[12:0];
				Result = deslocado;
			end
			else if(E3 == 5'b01011)begin
				deslocado[31:19] = E2[11:0];
				Result = deslocado;
			end
			else if(E3 == 5'b10100)begin
				deslocado[31:20] = E2[10:0];
				Result = deslocado;
			end
			else if(E3 == 5'b10101)begin
				deslocado[31:21] = E2[9:0];
				Result = deslocado;
			end
			else if(E3 == 5'b10110)begin
				deslocado[31:22] = E2[8:0];
				Result = deslocado;
			end
			else if(E3 == 5'b10111)begin
				deslocado[31:23] = E2[7:0];
				Result = deslocado;
			end
			else if(E3 == 5'b11000)begin
				deslocado[31:24] = E2[6:0];
				Result = deslocado;
			end
			else if(E3 == 5'b11001)begin
				deslocado[31:25] = E2[5:0];
				Result = deslocado;
			end
			else if(E3 == 5'b11010)begin
				deslocado[31:26] = E2[4:0];
				Result = deslocado;
			end
			else if(E3 == 5'b11011)begin
				deslocado[31:27] = E2[3:0];
				Result = deslocado;
			end
			else if(E3 == 5'b11100)begin
				deslocado[31:28] = E2[2:0];
				Result = deslocado;
			end
			else if(E3 == 5'b11101)begin
				deslocado[31:29] = E2[1:0];
				Result = deslocado;
			end
			else if(E3 == 5'b11110)begin
				deslocado[31:30] = E2[0:0];
				Result = deslocado;
			end
			else if(E3 == 5'b11111)begin
				deslocado[31:8] = E2[22:0];
				Result = deslocado;
			end
		
			
		end
		
		
		//Deslocar para a direita e adicionar zeros //SRL // //Testado
		else if(opar == 5'b01100) begin 
			
			deslocado = 32'b00000000000000000000000000000000;
			
			if(E3 == 5'b00001)begin
				deslocado[30:0] = E2[31:1];
				Result = deslocado;
			end
			else if(E3 == 5'b00010)begin
				deslocado[29:0] = E2[31:2];
				Result = deslocado;
			end
			else if(E3 == 5'b00011)begin
				deslocado[28:0] = E2[31:3];
				Result = deslocado;
			end
			else if(E3 == 5'b00100)begin
				deslocado[27:0] = E2[31:4];
				Result = deslocado;
			end
			else if(E3 == 5'b00101)begin
				deslocado[26:0] = E2[31:5];
				Result = deslocado;
			end
			else if(E3 == 5'b00110)begin
				deslocado[25:0] = E2[31:6];
				Result = deslocado;
			end
			else if(E3 == 5'b00111)begin
				deslocado[24:0] = E2[31:7];
				Result = deslocado;
			end
			else if(E3 == 5'b01000)begin
				deslocado[23:0] = E2[31:8];
				Result = deslocado;
			end
			else if(E3 == 5'b01001)begin
				deslocado[22:0] = E2[31:9];
				Result = deslocado;
			end
			else if(E3 == 5'b01010)begin
				deslocado[21:0] = E2[31:10];
				Result = deslocado;
			end
			else if(E3 == 5'b01011)begin
				deslocado[20:0] = E2[31:11];
				Result = deslocado;
			end
			else if(E3 == 5'b01100)begin
				deslocado[19:0] = E2[31:12];
				Result = deslocado;
			end
			else if(E3 == 5'b01101)begin
				deslocado[18:0] = E2[31:13];
				Result = deslocado;
			end
			else if(E3 == 5'b01110)begin
				deslocado[17:0] = E2[31:14];
				Result = deslocado;
			end
			else if(E3 == 5'b01111)begin
				deslocado[16:0] = E2[31:15];
				Result = deslocado;
			end
			else if(E3 == 5'b10000)begin
				deslocado[15:0] = E2[31:16];
				Result = deslocado;
			end
			else if(E3 == 5'b01001)begin
				deslocado[14:0] = E2[31:17];
				Result = deslocado;
			end
			else if(E3 == 5'b01010)begin
				deslocado[13:0] = E2[31:18];
				Result = deslocado;
			end
			else if(E3 == 5'b01011)begin
				deslocado[12:0] = E2[31:19];
				Result = deslocado;
			end
			else if(E3 == 5'b10100)begin
				deslocado[11:0] = E2[31:20];
				Result = deslocado;
			end
			else if(E3 == 5'b10101)begin
				deslocado[10:0] = E2[31:21];
				Result = deslocado;
			end
			else if(E3 == 5'b10110)begin
				deslocado[9:0] = E2[31:22];
				Result = deslocado;
			end
			else if(E3 == 5'b10111)begin
				deslocado[8:0] = E2[31:23];
				Result = deslocado;
			end
			else if(E3 == 5'b11000)begin
				deslocado[7:0] = E2[31:24];
				Result = deslocado;
			end
			else if(E3 == 5'b11001)begin
				deslocado[6:0] = E2[31:25];
				Result = deslocado;
			end
			else if(E3 == 5'b11010)begin
				deslocado[5:0] = E2[31:26];
				Result = deslocado;
			end
			else if(E3 == 5'b11011)begin
				deslocado[4:0] = E2[31:27];
				Result = deslocado;
			end
			else if(E3 == 5'b11100)begin
				deslocado[3:0] = E2[31:28];
				Result = deslocado;
			end
			else if(E3 == 5'b11101)begin
				deslocado[2:0] = E2[31:29];
				Result = deslocado;
			end
			else if(E3 == 5'b11110)begin
				deslocado[1:0] = E2[31:30];
				Result = deslocado;
			end
			else if(E3 == 5'b11111)begin
				deslocado[0] = E2[31];
				Result = deslocado;
			end
		
			
		end
		
		//se E1 for maior igual a 0, zero = 1; //BGEZ //Testado
		else if (opar == 5'b01101) begin
			
			if(E1 >= 0)begin
				
				zero = 1'b1;
			end
			
		end
		
		
		else if (opar == 5'b01110) begin //CLO
			temp =  32;
			for(i = 31; i >= 0; i = i - 1)begin
				
				if(E1[i] == 0)begin
					
					temp = 31 - i;
					break;
				end
			end
			Result = temp;
		end
	
		
		
		//Deslocar para a direita e repere o bit[31] //SRAV //Testado
		else if(opar == 5'b01111) begin 
			
			if(E2[31] == 1'b1)begin
				
				deslocado = 32'b11111111111111111111111111111111;
				
			end
			
			if(E2[31] == 1'b0)begin
				
				deslocado = 32'd0;
				
			end
			
			if(E1 == 5'b00001)begin
				deslocado[30:0] = E2[31:1];
				Result = deslocado;
			end
			else if(E1 == 5'b00010)begin
				deslocado[29:0] = E2[31:2];
				Result = deslocado;
			end
			else if(E1 == 5'b00011)begin
				deslocado[28:0] = E2[31:3];
				Result = deslocado;
			end
			else if(E1 == 5'b00100)begin
				deslocado[27:0] = E2[31:4];
				Result = deslocado;
			end
			else if(E1 == 5'b00101)begin
				deslocado[26:0] = E2[31:5];
				Result = deslocado;
			end
			else if(E1 == 5'b00110)begin
				deslocado[25:0] = E2[31:6];
				Result = deslocado;
			end
			else if(E1 == 5'b00111)begin
				deslocado[24:0] = E2[31:7];
				Result = deslocado;
			end
			else if(E1 == 5'b01000)begin
				deslocado[23:0] = E2[31:8];
				Result = deslocado;
			end
			else if(E1 == 5'b01001)begin
				deslocado[22:0] = E2[31:9];
				Result = deslocado;
			end
			else if(E1 == 5'b01010)begin
				deslocado[21:0] = E2[31:10];
				Result = deslocado;
			end
			else if(E1 == 5'b01011)begin
				deslocado[20:0] = E2[31:11];
				Result = deslocado;
			end
			else if(E1 == 5'b01100)begin
				deslocado[19:0] = E2[31:12];
				Result = deslocado;
			end
			else if(E1 == 5'b01101)begin
				deslocado[18:0] = E2[31:13];
				Result = deslocado;
			end
			else if(E1 == 5'b01110)begin
				deslocado[17:0] = E2[31:14];
				Result = deslocado;
			end
			else if(E1 == 5'b01111)begin
				deslocado[16:0] = E2[31:15];
				Result = deslocado;
			end
			else if(E1 == 5'b10000)begin
				deslocado[15:0] = E2[31:16];
				Result = deslocado;
			end
			else if(E1 == 5'b01001)begin
				deslocado[14:0] = E2[31:17];
				Result = deslocado;
			end
			else if(E1 == 5'b01010)begin
				deslocado[13:0] = E2[31:18];
				Result = deslocado;
			end
			else if(E1 == 5'b01011)begin
				deslocado[12:0] = E2[31:19];
				Result = deslocado;
			end
			else if(E1 == 5'b10100)begin
				deslocado[11:0] = E2[31:20];
				Result = deslocado;
			end
			else if(E1 == 5'b10101)begin
				deslocado[10:0] = E2[31:21];
				Result = deslocado;
			end
			else if(E1 == 5'b10110)begin
				deslocado[9:0] = E2[31:22];
				Result = deslocado;
			end
			else if(E1 == 5'b10111)begin
				deslocado[8:0] = E2[31:23];
				Result = deslocado;
			end
			else if(E1 == 5'b11000)begin
				deslocado[7:0] = E2[31:24];
				Result = deslocado;
			end
			else if(E1 == 5'b11001)begin
				deslocado[6:0] = E2[31:25];
				Result = deslocado;
			end
			else if(E1 == 5'b11010)begin
				deslocado[5:0] = E2[31:26];
				Result = deslocado;
			end
			else if(E1 == 5'b11011)begin
				deslocado[4:0] = E2[31:27];
				Result = deslocado;
			end
			else if(E1 == 5'b11100)begin
				deslocado[3:0] = E2[31:28];
				Result = deslocado;
			end
			else if(E1 == 5'b11101)begin
				deslocado[2:0] = E2[31:29];
				Result = deslocado;
			end
			else if(E1 == 5'b11110)begin
				deslocado[1:0] = E2[31:30];
				Result = deslocado;
			end
			else if(E1 == 5'b11111)begin
				deslocado[0] = E2[31];
				Result = deslocado;
			end
			
			
			
		end
		
		
		//Deslocar para a direita e repere o bit[31] //SRA //Testado
		else if(opar == 5'b10000) begin 
			
			if(E2[31] == 1'b1)begin
				
				deslocado = 32'b11111111111111111111111111111111;
				
			end
			
			if(E2[31] == 1'b0)begin
				
				deslocado = 32'd0;
				
			end
			
			if(E3 == 5'b00001)begin
				deslocado[30:0] = E2[31:1];
				Result = deslocado;
			end
			else if(E3 == 5'b00010)begin
				deslocado[29:0] = E2[31:2];
				Result = deslocado;
			end
			else if(E3 == 5'b00011)begin
				deslocado[28:0] = E2[31:3];
				Result = deslocado;
			end
			else if(E3 == 5'b00100)begin
				deslocado[27:0] = E2[31:4];
				Result = deslocado;
			end
			else if(E3 == 5'b00101)begin
				deslocado[26:0] = E2[31:5];
				Result = deslocado;
			end
			else if(E3 == 5'b00110)begin
				deslocado[25:0] = E2[31:6];
				Result = deslocado;
			end
			else if(E3 == 5'b00111)begin
				deslocado[24:0] = E2[31:7];
				Result = deslocado;
			end
			else if(E3 == 5'b01000)begin
				deslocado[23:0] = E2[31:8];
				Result = deslocado;
			end
			else if(E3 == 5'b01001)begin
				deslocado[22:0] = E2[31:9];
				Result = deslocado;
			end
			else if(E3 == 5'b01010)begin
				deslocado[21:0] = E2[31:10];
				Result = deslocado;
			end
			else if(E3 == 5'b01011)begin
				deslocado[20:0] = E2[31:11];
				Result = deslocado;
			end
			else if(E3 == 5'b01100)begin
				deslocado[19:0] = E2[31:12];
				Result = deslocado;
			end
			else if(E3 == 5'b01101)begin
				deslocado[18:0] = E2[31:13];
				Result = deslocado;
			end
			else if(E3 == 5'b01110)begin
				deslocado[17:0] = E2[31:14];
				Result = deslocado;
			end
			else if(E3 == 5'b01111)begin
				deslocado[16:0] = E2[31:15];
				Result = deslocado;
			end
			else if(E3 == 5'b10000)begin
				deslocado[15:0] = E2[31:16];
				Result = deslocado;
			end
			else if(E3 == 5'b01001)begin
				deslocado[14:0] = E2[31:17];
				Result = deslocado;
			end
			else if(E3 == 5'b01010)begin
				deslocado[13:0] = E2[31:18];
				Result = deslocado;
			end
			else if(E3 == 5'b01011)begin
				deslocado[12:0] = E2[31:19];
				Result = deslocado;
			end
			else if(E3 == 5'b10100)begin
				deslocado[11:0] = E2[31:20];
				Result = deslocado;
			end
			else if(E3 == 5'b10101)begin
				deslocado[10:0] = E2[31:21];
				Result = deslocado;
			end
			else if(E3 == 5'b10110)begin
				deslocado[9:0] = E2[31:22];
				Result = deslocado;
			end
			else if(E3 == 5'b10111)begin
				deslocado[8:0] = E2[31:23];
				Result = deslocado;
			end
			else if(E3 == 5'b11000)begin
				deslocado[7:0] = E2[31:24];
				Result = deslocado;
			end
			else if(E3 == 5'b11001)begin
				deslocado[6:0] = E2[31:25];
				Result = deslocado;
			end
			else if(E3 == 5'b11010)begin
				deslocado[5:0] = E2[31:26];
				Result = deslocado;
			end
			else if(E3 == 5'b11011)begin
				deslocado[4:0] = E2[31:27];
				Result = deslocado;
			end
			else if(E3 == 5'b11100)begin
				deslocado[3:0] = E2[31:28];
				Result = deslocado;
			end
			else if(E3 == 5'b11101)begin
				deslocado[2:0] = E2[31:29];
				Result = deslocado;
			end
			else if(E3 == 5'b11110)begin
				deslocado[1:0] = E2[31:30];
				Result = deslocado;
			end
			else if(E3 == 5'b11111)begin
				deslocado[0] = E2[31];
				Result = deslocado;
			end
		
			
		end
		
		//MOVN, SE E2 FOR DIFERENTE DE 0, RESULT É IGUAL A E1
		else if (opar == 5'b10001)begin
		
			if(E2 != 5'b00000)begin
			
				Result = E1;
			
			end
		
		end
		
		//sltu //Testado
		else if (opar == 5'b10010)begin
		
			if(E1 < E2)begin
			
				Result = 32'd1;
			
			end
			
			else begin
				
				Result = 32'd0;
			end
		end
		
		else if(opar == 5'b10011)begin
			
			aux_03 = E2[15:0];
			Result = {aux_03, 16'd0};
		
		end
		
	end

endmodule