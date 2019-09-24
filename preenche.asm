.text
# B Cor a pintar = a0
# A Cor limite = a1
# X = a2
# Y = a3
PREENCHE:
addi s0, a0, 0
addi s1, a1, 0
addi s2, a2, 0
addi s3, a3, 0




# a0 x
# a1 y
ENDERECO_COORD:
li t0, 320
mul a1, a1, t0 				# Y * 320

li t0, 0xFF000000			# Endereço base

add a0, a0, a1				# X + Y * 320
add a0, a0, t0				# 0xFF000000 + X + Y * 320

ret
