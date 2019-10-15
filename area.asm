.data
TEXT_AREA: .asciz "Area="

.text
AREA:
addi t0, a0, 0

la a0, TEXT_AREA	#endereço string
li a1, 0		#coluna
li a2, 0		#linha
li a3, 0xff		#cores
li a4, 0		#frame
li a7, 104		#print string
ecall

addi a0, t0, 0		#inteiro
li a1, 40		#coluna
li a2, 0		#linha
li a3, 0xff		#cores
li a4, 0		#frame
li a7, 101		#print integer
ecall

ret
