####################################################################################################################################
#Algoritmo vai ordenar os pontos da esquerda para a direita por meio de um simples bubble sort primeiramente, em seguida, vai pegar
#o primeiro ponto apos o ordenamento e pegara a altura dele, em seguida, separara os pontos com altura maior que a dele dos menores
#e ordenara os de altura maior da esquerda para a direita e os de altura menor da direita para a esquerda. Porem, se todos os pontos
#forem maiores, o algoritmo vai pegar o ponto mais baixo dentre eles e o fara o ultimo ponto.
####################################################################################################################################
.text
ORDENA:
addi sp, sp, -20
sw s0, 0(sp)
sw s1, 4(sp)
sw s10, 8(sp)
sw s11, 12(sp)
sw ra, 16(sp)
jal sort		#ordena os pontos da esquerda para a direita

li t0, 0		#i = 0
slli t1, t0, 2
add t1, t1, a0
lw t2, 0(t1)		#v[i]
andi t1, t2, 0x7ff	#pega apenas a altura do ponto 0, armazenando em t1
li s0, N

loopordena1:
beq t0, a1, fimloopordena1
addi t0, t0, 1
slli t3, t0, 2
add t3, t3, a0
lw t4, 0(t3)		#v[++i]
andi t5, t4, 0x7ff
blt t5, t1, naoabaixo	#se for mais alto que v[0], mantem sua posicao (vai para naoabaixo)
slli t6, s0, 2
add t6, t6, a2
sw t4, 0(t6)
la s1, maxcoord
sw s1, 0(t3)
addi s0, s0, -1 
naoabaixo:
j loopordena1
fimloopordena1:
add s1, ra, zero
jal sort
add ra, s1, zero

la t1, maxcoord
lw t0, 4(a0)		#primeiro ponto
li t2, 0
count:
beq t0, t1, fim
addi t2, t2, 1		#quantidade de pontos mais altos que o primeiro
slli t3, t2, 2
add t3, t3, a0
lw t0, 0(t3)
j count
fim:

li t6, N
#addi t2, t2, 1
concat:
beq s0, t6, endconcat
addi s0, s0, 1
slli t0, s0, 2
add t0, t0, a2
lw t1, 0(t0)
slli t3, t2, 2
add t3, t3, a0
sw t1, 0(t3)
addi t2, t2, 1
j concat
endconcat:
lw ra, 16(sp)
lw s11, 12(sp)
lw s10, 8(sp)
lw s1, 4(sp)
lw s0, 0(sp)
addi sp, sp, 20
ret
######################################################################funcao sort##############################################################
swap:
slli t0, t2, 2
add t0, t0, a0
lw t5, 0(t0)
lw t4, 4(t0)
sw t4, 0(t0)
sw t5, 4(t0)
jalr zero, t6, 0

sort:			#bubble sort
mv t1, a0		#t1 = v
li t0, 1		#t = 1
addi t3, a1, -1 	#t3 = n-1
while:
beq t0, zero, endwhile
li t0, 0		#t = 0
li t2, 0		#i = 0
for:
bge t2, t3, endfor	#se i>=n-1, nao executa o for
slli t4, t2, 2
add t4, t4, t1
lw s10, 0(t4)		#v[i]
lw s11, 4(t4)		#v[i+1]
ble s10, s11, L1	#vai para L1 se v[i]<=v[i+1]
mv a0, t1

jal t6 swap
li t0, 1
L1:
addi t2, t2, 1		#i++
j for
endfor:
j while
endwhile:
ret
