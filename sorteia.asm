.text
# a0 = número de itens
SORTEIA:
addi t5, s0, 0				# Salva valores de s0 e s1
addi t6, s1, 0

addi s0, a0, 0				# Salva o número de itens

addi s1, sp, 0				# Salva endereço atual da pilha

slli t0, s0, 2				# Tamanho da estrutura
addi t0, t0, 4
sub sp, sp, t0				# Reserva o espaço em pilha

sw s0, (sp)				# Salva o número de itens na estrutura

addi s0, sp, 4				# Obtém endereço para itens da estrutura

SORTEIA_FOR:
beq s0, s1, SORTEIA_FOR_EXIT

li a7, 41				# Obtém número aleatório
ecall
li t0, 320				# Prepara número para mod
remu t1, a0, t0				# Rand() % 320
slli t1, t1, 16				# Coloca X nos primeiros 16 bits

li a7, 41				# Obtém número aleatório
ecall
li t0, 240				# Prepara número para mod
remu t2, a0, t0				# Rand() % 240

or t0, t1, t2				# Junta os números
sw t0, (s0)				# Salva os números

addi s0, s0, 4

j SORTEIA_FOR
SORTEIA_FOR_EXIT:

addi a0, sp, 0				# Endereço para retornar

addi s0, t5, 0				# Devolve valores de s0 e s1
addi s1, t6, 0
ret