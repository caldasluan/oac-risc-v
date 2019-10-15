.text
# a0 = n�mero de itens
SORTEIA:
addi t5, s0, 0				# Salva valores de s0 e s1
addi t6, s1, 0

addi s0, a0, 0				# Salva o n�mero de itens

addi s1, sp, 0				# Salva endere�o atual da pilha

slli t0, s0, 2				# Tamanho da estrutura
addi t0, t0, 4
sub sp, sp, t0				# Reserva o espa�o em pilha

sw s0, (sp)				# Salva o n�mero de itens na estrutura

addi s0, sp, 4				# Obt�m endere�o para itens da estrutura

SORTEIA_FOR:
beq s0, s1, SORTEIA_FOR_EXIT

li a7, 41				# Obt�m n�mero aleat�rio
ecall
li t0, 320				# Prepara n�mero para mod
remu t1, a0, t0				# Rand() % 320
slli t1, t1, 16				# Coloca X nos primeiros 16 bits

li a7, 41				# Obt�m n�mero aleat�rio
ecall
li t0, 240				# Prepara n�mero para mod
remu t2, a0, t0				# Rand() % 240

or t0, t1, t2				# Junta os n�meros
sw t0, (s0)				# Salva os n�meros

addi s0, s0, 4

j SORTEIA_FOR
SORTEIA_FOR_EXIT:

addi a0, sp, 0				# Endere�o para retornar

addi s0, t5, 0				# Devolve valores de s0 e s1
addi s1, t6, 0
ret