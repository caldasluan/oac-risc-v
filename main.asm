.eqv N 10

.data
Vazio: .word 0, 0, 0, 0, 0, 0 ,0 ,0 ,0, 0, 0, 0	#vetor de tamnanho 12 (maximo)
maxcoord: .word 0x013f00ef

.text

MAIN:
la tp,exceptionHandling	# carrega em tp o endere�o base das rotinas do sistema ECALL
csrrw zero,5,tp 	# seta utvec (reg 5) para o endere�o tp
csrrsi zero,0,1 	# seta o bit de habilita��o de interrup��o em ustatus (reg 0)

li a0, N
jal SORTEIA

li a0, 7
addi a1, sp, 0
jal POLIGONO		#imprime poligono nao ordenado

addi a0, sp, 4		#pega o elemento 1 do vetor para ordenar
li a1, N		#numero de elementos
la a2, Vazio		
jal ORDENA

#########################################################################Teste para ordenacao########################################################################
SLEEP:	li t0,1
LOOPHMS:li a0,1000   # 1 segundo
	li a7,132
	ecall
	addi t0,t0,-1
	bne t0,zero,LOOPHMS	
#######################################################################Fim Teste para ordenacao#########################################################################

li a0, 0xFF
addi a1, sp, 0
jal POLIGONO

li a0, 510
jal AREA

li a7, 10
ecall

.include "ordena.asm"
.include "area.asm"
.include "sorteia.asm"
.include "poligono.asm"
.include "include/SYSTEMv15.s"
