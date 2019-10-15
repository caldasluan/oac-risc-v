.eqv A 0x0c0		#cor da linha
.eqv C 0x03f		#cor a pintar

.data
.include "engrenagem.data"

.text

MAIN:
la tp,exceptionHandling	# carrega em tp o endere�o base das rotinas do sistema ECALL
csrrw zero,5,tp 	# seta utvec (reg 5) para o endere�o tp
csrrsi zero,0,1 	# seta o bit de habilita��o de interrup��o em ustatus (reg 0)

li a7, 48
li a0, 0
li a1, 0
ecall			#clear screen

# Carrega a imagem1
FORA:	li t1,0xFF000000	# endereco inicial da Memoria VGA - Frame 0
	li t2,0xFF012C00	# endereco final 
	la s1,engrenagem		# endere�o dos dados da tela na memoria
	addi s1,s1,8		# primeiro pixels depois das informa��es de nlin ncol
LOOP1: 	beq t1,t2,FORA1		# Se for o �ltimo endere�o ent�o sai do loop
	lw t3,0(s1)		# le um conjunto de 4 pixels : word
	sw t3,0(t1)		# escreve a word na mem�ria VGA
	addi t1,t1,4		# soma 4 ao endere�o
	addi s1,s1,4
	j LOOP1			# volta a verificar
FORA1:

li a4, 0		#area
li a0, 160		#x
li a1, 30		#y
li a2, C		#cor a pintar
li a3, A		#cor da linha
jal PREENCHE

mv a0, a4		#quantidade de pixels que foram pintados
jal AREA

li a7, 10
ecall

.include "poligono.asm"
.include "include/SYSTEMv15.s"
.include "preenche.asm"
.include "area.asm"
