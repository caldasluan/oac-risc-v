.eqv N 4		#numero de pontos
.eqv A 0x0ff		#cor da linha
.eqv C 0x0f8		#cor a pintar

.data
Vazio: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0	#vetor de tamnanho 12 (maximo)
maxcoord: .word 0x013f00ef

.text

MAIN:
la tp,exceptionHandling	# carrega em tp o endere�o base das rotinas do sistema ECALL
csrrw zero,5,tp 	# seta utvec (reg 5) para o endere�o tp
csrrsi zero,0,1 	# seta o bit de habilita��o de interrup��o em ustatus (reg 0)

li a7, 48
li a0, 0
li a1, 0
ecall			#clear screen

li a0, N
jal SORTEIA

#########################################################################Teste para ordenacao########################################################################
li a0, 7
addi a1, sp, 0
jal POLIGONO		#imprime poligono nao ordenado

SLEEP:	li t0,1
LOOPHMS:li a0,1000   # 1 segundo
	li a7,132
	ecall
	addi t0,t0,-1
	bne t0,zero,LOOPHMS	
#######################################################################Fim Teste para ordenacao#########################################################################
li a7, 48
li a0, 0
li a1, 0
ecall			#clear screen

li t0, N
li t1, 3
beq t0, t1, naoordena	#se a quantidade de pontos for 3, nao precisa ordenar
addi a0, sp, 4		#pega o elemento 1 do vetor para ordenar
li a1, N		#numero de elementos
la a2, Vazio		
jal ORDENA
naoordena:

li a0, A
addi a1, sp, 0
jal POLIGONO

#########################################################################Teste para ordenacao########################################################################
SLEEP2:	li t0,1
LOOPHMS2:li a0,1000   # 1 segundo
	li a7,132
	ecall
	addi t0,t0,-1
	bne t0,zero,LOOPHMS2	
#######################################################################Fim Teste para ordenacao#########################################################################

mv a7, sp
li a0, 0		#somatorio x
li a1, 0		#somatorio y
li t0, 0
li t1, N
jal pontocentral

li a4, 0		#vai receber a area 
li a2, C		#cor a pintar
li a3, A		#cor da linha
jal PREENCHE

mv a0, a4		#quantidade de pixels que foram pintados
jal AREA

li a7, 10
ecall

pontocentral:	beq t0, t1, fimptcntx
		slli t2, t0, 2
		add t2, t2, a7
		lw t3, 4(t2)
		srli t3, t3, 16
		add a0, a0, t3
		addi t0, t0, 1
		j pontocentral
		
fimptcntx:	li t0, 0
		div a0, a0, t1
pontocentraly:	beq t0, t1, fimptcnty
		slli t2, t0, 2
		add t2, t2, a7
		lw t3, 4(t2)
		slli t3, t3, 16
		srli t3, t3, 16
		add a1, a1, t3
		addi t0, t0, 1
		j pontocentraly

fimptcnty:	div a1, a1, t1
		ret

.include "ordena.asm"
.include "area.asm"
.include "sorteia.asm"
.include "poligono.asm"
.include "preenche.asm"
.include "include/SYSTEMv15.s"
