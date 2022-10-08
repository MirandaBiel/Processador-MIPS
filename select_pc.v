module select_pc
(pc_mais_4,jump_jal,jr_jalr,beq_bne_bgez_bgezal,pc,chaves,zero,prox_pc);

input [31:0] pc_mais_4, jump_jal, jr_jalr, beq_bne_bgez_bgezal,pc;
input [2:0] chaves;
input zero;
output reg [31:0] prox_pc;

always @(*)
begin
	if(chaves == 2'b000)
		begin
			prox_pc = pc_mais_4;
		end
	else if (chaves == 2'b001)
		begin
			prox_pc = jump_jal;
		end
	else if (chaves == 2'b010)
		begin
			prox_pc = jr_jalr;
		end
	else if (chaves == 2'b011)
		begin
		if (zero == 1'b1)
			begin
				prox_pc = beq_bne_bgez_bgezal;
			end
		else
			begin
				prox_pc = pc_mais_4;
			end
		end
	else
		begin
			prox_pc = pc;
		end
end
endmodule
