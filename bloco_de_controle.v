module bloco_de_controle
(opcode,funct,bit20,MemRead,ALUop,Memwrite,RegWrite,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,chaves);
input [5:0] opcode;
input [5:0] funct;
input bit20;
output reg [2:0] chaves;
output reg MemRead,Memwrite,RegWrite,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11;
output reg [4:0] ALUop;
always @(*)
begin

	case(opcode)
		6'b100011: //lw
			begin
				 ALUop = 5'b00000;
				 MemRead = 1'b1;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'b0;
				 m2 = 1'b1;
				 m3 = 1'b1;
				 m4 = 1'b1;
				 m5 = 1'b0;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		6'b000000: //varias operacoes
			begin
				case(funct)
					6'b100000: //add
						begin
							 ALUop = 5'b00001;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b100010: //sub
						begin
							 ALUop = 5'b00010;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b100100: //and
						begin
							 ALUop = 5'b00011;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b100001: //addu
						begin
							 ALUop = 5'b00000;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b101010: //slt
						begin
							 ALUop = 5'b00110;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b110100: //teq
						begin
							 ALUop = 5'b00100;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'b0;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'b0;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'bx;
							 m10 = 1'b0;
							 m11 = 1'bx;
							 chaves = 3'b100;
						end
					6'b100101: //or
						begin
							 ALUop = 5'b00111;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b100111: //nor
						begin
							 ALUop = 5'b01000;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b100110: //xor
						begin
							 ALUop = 5'b01001;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b001000: //jr
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b010;
						end
					6'b100011: //subu
						begin
							 ALUop = 5'b01010;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b000000: //sll
						begin
							 ALUop = 5'b01011;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b000010: //srl
						begin
							 ALUop = 5'b01100;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b011000: //mult
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'bx;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'bx;
							 m10 = 1'b0;
							 m11 = 1'bx;
							 chaves = 3'b000;
						end
					6'b011010: //div
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'bx;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'bx;
							 m10 = 1'b0;
							 m11 = 1'bx;
							 chaves = 3'b000;
						end
					6'b010000: //mfhi
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'bx;
							 m7 = 1'b1;
							 m8 = 1'b0;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b010010: //mflo
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'bx;
							 m7 = 1'b1;
							 m8 = 1'b1;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b000111: //srav
						begin
							 ALUop = 5'b01111;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b000011: //sra
						begin
							 ALUop = 5'b10000;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b001001: //jalr
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'b0;
							 m5 = 1'b0;
							 m6 = 1'bx;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b010;
						end
					6'b001011: //movn
						begin
							 ALUop = 5'b10001;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b1;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					6'b101011: //sltu
						begin
							 ALUop = 5'b10010;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'b0;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					default:
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'bx;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'bx;
							 m10 = 1'b0;
							 m11 = 1'bx;
							 chaves = 3'b100;
						end
				endcase
			end
		6'b101011: //sw
			begin
				 ALUop = 5'b00000;
				 MemRead = 1'b1;
				 Memwrite = 1'b0;
				 RegWrite = 1'b0;
				 m1 = 1'bx;
				 m2 = 1'b1;
				 m3 = 1'bx;
				 m4 = 1'bx;
				 m5 = 1'b0;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		6'b000010: //j
			begin
				 ALUop = 5'bxxxxx;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b0;
				 m1 = 1'bx;
				 m2 = 1'bx;
				 m3 = 1'bx;
				 m4 = 1'bx;
				 m5 = 1'b0;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b001;
			end
		6'b000100: //beq
			begin
				 ALUop = 5'b00100;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b0;
				 m1 = 1'bx;
				 m2 = 1'b0;
				 m3 = 1'bx;
				 m4 = 1'bx;
				 m5 = 1'bx;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b011;
			end
		6'b000101: //bne
			begin
				 ALUop = 5'b00101;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b0;
				 m1 = 1'bx;
				 m2 = 1'b0;
				 m3 = 1'bx;
				 m4 = 1'bx;
				 m5 = 1'bx;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b011;
			end
		6'b001000: //addi
			begin
				 ALUop = 5'b00001;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'b0;
				 m2 = 1'b1;
				 m3 = 1'b0;
				 m4 = 1'b1;
				 m5 = 1'b0;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		6'b000011: //jal
			begin
				 ALUop = 5'bxxxxx;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'bx;
				 m2 = 1'bx;
				 m3 = 1'bx;
				 m4 = 1'b0;
				 m5 = 1'b1;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b001;
			end
		6'b001111: //lui
			begin
				 ALUop = 5'b10011;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'b0;
				 m2 = 1'b1;
				 m3 = 1'b0;
				 m4 = 1'b1;
				 m5 = 1'b0;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		6'b001100: //andi
			begin
				 ALUop = 5'b00011;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'b0;
				 m2 = 1'bx;
				 m3 = 1'b0;
				 m4 = 1'b1;
				 m5 = 1'b0;
				 m6 = 1'b1;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		6'b001101: //ori
			begin
				 ALUop = 5'b00111;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'b0;
				 m2 = 1'bx;
				 m3 = 1'b0;
				 m4 = 1'b1;
				 m5 = 1'b0;
				 m6 = 1'b1;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		6'b001110: //xori
			begin
				 ALUop = 5'b01001;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'b0;
				 m2 = 1'bx;
				 m3 = 1'b0;
				 m4 = 1'b1;
				 m5 = 1'b0;
				 m6 = 1'b1;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		6'b000001: //gbez e bgezal
			begin
				case(bit20)
					1'b0: //bgez
						begin
							 ALUop = 5'b01101;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b011;
						end
					1'b1: //bgezal
						begin
							 ALUop = 5'b01101;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'b0;
							 m5 = 1'b1;
							 m6 = 1'b0;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b011;
						end
					default:
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'bx;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'bx;
							 m10 = 1'b0;
							 m11 = 1'bx;
							 chaves = 3'b100;
						end
				endcase
			end
		6'b011100: //msubu, madd e mul
			begin
				case(funct)
					6'b000101: //msubu
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'bx;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'bx;
							 m10 = 1'b0;
							 m11 = 1'bx;
							 chaves = 3'b000;
						end
					6'b000000: //madd
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'bx;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'bx;
							 m10 = 1'b0;
							 m11 = 1'bx;
							 chaves = 3'b000;
						end
					6'b000010: //mul
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'bx;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'bx;
							 m10 = 1'b0;
							 m11 = 1'bx;
							 chaves = 3'b000;
						end
					6'b100001: //clo
						begin
							 ALUop = 5'b01110;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b1;
							 m1 = 1'b1;
							 m2 = 1'bx;
							 m3 = 1'b0;
							 m4 = 1'b1;
							 m5 = 1'b0;
							 m6 = 1'bx;
							 m7 = 1'b0;
							 m8 = 1'bx;
							 m9 = 1'b0;
							 m10 = 1'b0;
							 m11 = 1'b0;
							 chaves = 3'b000;
						end
					default:
						begin
							 ALUop = 5'bxxxxx;
							 MemRead = 1'bx;
							 Memwrite = 1'b0;
							 RegWrite = 1'b0;
							 m1 = 1'bx;
							 m2 = 1'bx;
							 m3 = 1'bx;
							 m4 = 1'bx;
							 m5 = 1'bx;
							 m6 = 1'bx;
							 m7 = 1'bx;
							 m8 = 1'bx;
							 m9 = 1'bx;
							 m10 = 1'b0;
							 m11 = 1'bx;
							 chaves = 3'b100;
						end
				endcase
			end
		6'b001001: //addiu
			begin
				 ALUop = 5'b00000;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'b0;
				 m2 = 1'b1;
				 m3 = 1'b0;
				 m4 = 1'b1;
				 m5 = 1'b0;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		6'b100000: //lb
			begin
				 ALUop = 5'b00000;
				 MemRead = 1'b1;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'b0;
				 m2 = 1'b1;
				 m3 = 1'bx;
				 m4 = 1'b1;
				 m5 = 1'b0;
				 m6 = 1'b0;
				 m7 = 1'bx;
				 m8 = 1'bx;
				 m9 = 1'b1;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		6'b101000: //sb
			begin
				 ALUop = 5'b00000;
				 MemRead = 1'b0;
				 Memwrite = 1'b1;
				 RegWrite = 1'b0;
				 m1 = 1'bx;
				 m2 = 1'b1;
				 m3 = 1'bx;
				 m4 = 1'bx;
				 m5 = 1'bx;
				 m6 = 1'b0;
				 m7 = 1'bx;
				 m8 = 1'bx;
				 m9 = 1'bx;
				 m10 = 1'b0;
				 m11 = 1'b1;
				 chaves = 3'b000;
			end
		6'b001010: //slti
			begin
				 ALUop = 5'b00110;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b1;
				 m1 = 1'b0;
				 m2 = 1'b1;
				 m3 = 1'b0;
				 m4 = 1'b1;
				 m5 = 1'b0;
				 m6 = 1'b0;
				 m7 = 1'b0;
				 m8 = 1'bx;
				 m9 = 1'b0;
				 m10 = 1'b0;
				 m11 = 1'b0;
				 chaves = 3'b000;
			end
		default:
			begin
				 ALUop = 5'bxxxxx;
				 MemRead = 1'bx;
				 Memwrite = 1'b0;
				 RegWrite = 1'b0;
				 m1 = 1'bx;
				 m2 = 1'bx;
				 m3 = 1'bx;
				 m4 = 1'bx;
				 m5 = 1'bx;
				 m6 = 1'bx;
				 m7 = 1'bx;
				 m8 = 1'bx;
				 m9 = 1'bx;
				 m10 = 1'b0;
				 m11 = 1'bx;
				 chaves = 3'b100;
			end
	endcase	
end
endmodule
