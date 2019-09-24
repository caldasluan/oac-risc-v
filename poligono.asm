.text
POLIGONO:
addi sp, sp, -12
sw s0, (sp)
sw s1, 4(sp)
sw s2, 8(sp)

lw s0, (a1)
slli s0, s0, 2			# Obtém tamanho do vetor multiplicado por 4

addi s1, a1, 4			# Obtém endereço do primeiro item do vetor

add s0, a1, s0			# Obtém o endereço do último item do vetor

addi s2, a0, 0			# Guarda a cor do polígono

li t1, 0x0000FFFF
lw t0, (s1)
and a1, t0, t1			# Pega o valor de Y0
srli a0, t0, 16
and a0, a0, t1			# Pega o valor de X0

lw t0, (s0)
and a3, t0, t1			# Pega o valor de Y1
srli a2, t0, 16
and a2, a2, t1			# Pega o valor de X1

addi a4, s2, 0			# Pega o valor da cor
li a5, 0			# Escolhe frame
li a7, 147			# Draw Line

ecall

POLIGONO_FOR:
beq s1, s0, POLIGONO_FOR_EXIT	# Se o vetor estiver no último elemento, encerra o for

li t1, 0x0000FFFF
lw t0, (s1)
and a1, t0, t1		# Pega o valor de Y0
srli a0, t0, 16
and a0, a0, t1		# Pega o valor de X0

lw t0, 4(s1)
and a3, t0, t1		# Pega o valor de Y1
srli a2, t0, 16
and a2, a2, t1		# Pega o valor de X1

addi a4, s2, 0			# Pega o valor da cor
li a5, 0			# Escolhe frame
li a7, 147			# Draw Line

ecall

addi s1, s1, 4			# Passa para o próximo item do vetor
j POLIGONO_FOR

POLIGONO_FOR_EXIT:
lw s0, (sp)
lw s1, 4(sp)
lw s2, 8(sp)
addi sp, sp, 12
ret
