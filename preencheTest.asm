
################################################################################################################################################
TESTEPREENCHE:
li t6, -1
li t5, 1

mv s0, a0	
li s1, 0xff000000
looppreenche:	beq a0, a1, fimlooppreenche	#se endereço atual = endereço final termina
		lbu t0, 0(a0)
		beq t0, a3, loopBranco		#não pinta se for linha
		sb a2, 0(a0)
		addi a0, a0, 1
		j looppreenche
		loopBranco:
				addi a0, a0, 1
				lbu t0, 0(a0)
				beq t0, a3, loopBranco	
				mul t5, t5, t6
				bge t5, zero, looppreenche
				
		loopFora:	addi a0, a0, 1
				beq a0, a1, fimlooppreenche
				lbu t0, 0(a0)
				bne t0 a3, loopFora
				beq t0, a3, loopBranco 
fimlooppreenche:

			 
li s1, 0xff000000
mv a0, s0
li t5, 1

looppreenche1:	beq a0, s1, fimlooppreenche1	#se endereço atual = endereço final termina
		lbu t0, 0(a0)
		beq t0, a3, loopBranco1		#não pinta se for linha
		sb a2, 0(a0)
		addi a0, a0, -1
		j looppreenche1
		loopBranco1:
				addi a0, a0, -1
				lbu t0, 0(a0)
				beq t0, a3, loopBranco1	
				mul t5, t5, t6
				bge t5, zero, looppreenche1
				
		loopFora1:	addi a0, a0, -1
				beq a0, s1, fimlooppreenche1
				lbu t0, 0(a0)
				bne t0 a3, loopFora1
				beq t0, a3, loopBranco1 
fimlooppreenche1:
ret
				 