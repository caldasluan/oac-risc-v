.text
# B Cor a pintar = a0
# A Cor limite = a1
# X = a2
# Y = a3


PREENCHE:
addi s0, a0, 0	# Cor a pintar
addi s1, a1, 0	# Cor das linhas
addi s2, a2, 0	# coordenada x
addi s3, a3, 0	# coordenada y


jal ENDERECO_COORD
sw ra, 4(sp) 	# guarda ra
sw a2, 0(sp)	# guarda coordenada

sw s0, 0(a2) 	#Pinta primeira coordenada

PINTE:
	addi a2, s2, -1	# coordenada a esquerda
	addi a3, s3, 0
	jal ENDERECO_COORD
	lw t0, 0(a2)	# Carrega a cor da coordenada
	beq t0, s1, ABAIXO # Se for for linha verifica abaixo
	addi s2, s2, -1 ##############################################
	jal N_LINHA
	
ABAIXO:	addi a2, s2, 0
	addi a3, s3, -1 # coordenada abaixo
	jal ENDERECO_COORD
	lw t0, 0(a2)	# Carrega a cor da coordenada
	beq t0, s1, DIREITA
	addi s3, s3, -1 ###############################################
	jal N_LINHA
	
DIREITA:addi a2, s2, 1 	# coordenada a direita
	addi a3, s3, 0
	jal ENDERECO_COORD
	lw t0, 0(a2)	# Carrega a cor da coordenada
	beq t0, s1, ACIMA
	addi s2, s2, 1 ###################################################
	jal N_LINHA
	
ACIMA:	addi a2, s2, 0
	addi a3, s3, 1 	# coordenada acima
	jal ENDERECO_COORD
	lw t0, 0(a2)	# Carrega a cor da coordenada
	beq t0, s1, FIM
	addi s3, s3, 1 ##################################################
	jal N_LINHA
	
FIM:	lw a2, 0(sp)	# devolve o valor da coordenada
	lw ra, 4(sp)	# devolve o valor de ra
	addi sp, sp, 8	
	ret
	
	

N_LINHA:
	beq t0, s0, PINTADO
	addi sp, sp, -8	# abre espaço na pilha
	sw ra, 4(sp) 	# guarda ra
	sw a2, 0(sp)	# guarda coordenada
	sw s0, 0(a2)	# pinta endereço atual
	jal PINTE
	

PINTADO:
	ret




# a2 x
# a3 y
ENDERECO_COORD:
li t0, 320
mul a3, a3, t0 				# Y * 320

li t0, 0xFF000000			# Endereço base


add a2, a2, a3				# X + Y * 320
slli a2, a2, 2				# word = 4 bits
#mul a2, a2, t1
add a2, a2, t0				# 0xFF000000 + X + Y * 320
ret #retorna e a2 é a coordenada
