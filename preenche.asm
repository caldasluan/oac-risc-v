PREENCHE:
li t0, 320
mul t0, a1, t0
add a0, t0, a0
li t0, 0xff000000
add a0, a0, t0

RECURSIVO:
	addi sp, sp, -8	
	sw ra, 4(sp) 	#Guarda ra
	sw a0, 0(sp)	#Guarda coordenada
	esquerda:	lbu t0, -1(a0)		#Carrega cor da coordenada a esquerda
			beq t0, a3, abaixo 	#Verifica se é linha
			beq t0, a2, abaixo	#Verifica se é já foi pintado
			addi a0, a0, -1		#Vai para esquerda 
			sb a2, 0(a0)		#Pinta de vermelho
			addi a4, a4, 1
			jal RECURSIVO
		
	abaixo:		lbu t0, 320(a0)
			beq t0, a3, direita
			beq t0, a2, direita
			addi a0, a0, 320
			sb a2, 0(a0)
			addi a4, a4, 1
			jal RECURSIVO
		
	direita:	lbu t0, 1(a0)
			beq t0, a3, acima
			beq t0, a2, acima
			addi a0, a0, 1	
			sb a2, 0(a0)
			addi a4, a4, 1
			jal RECURSIVO
		 
	acima:		lbu t0, -320(a0)
			beq t0, a3, voltar
			beq t0, a2, voltar
			addi a0, a0, -320
			sb a2, 0(a0)
			addi a4, a4, 1
			jal RECURSIVO
		
	voltar:		lw a0, 0(sp)		# devolve o valor da coordenada
			lw ra, 4(sp)		# devolve o valor de ra
			addi sp, sp, 8		
			ret
