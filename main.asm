.data
V: .word 4, 0x00100015, 0x01000020, 0x013F000F, 0x005000EF

.text

MAIN:
la tp,exceptionHandling	# carrega em tp o endere�o base das rotinas do sistema ECALL
csrrw zero,5,tp 	# seta utvec (reg 5) para o endere�o tp
csrrsi zero,0,1 	# seta o bit de habilita��o de interrup��o em ustatus (reg 0)
 	
li a0, 0x00FF
la a1, V
jal POLIGONO

li a0, 0x00FF
li a1,0x07070707
li a2, 160	#x
li a3, 120 	#y
jal PREENCHE

li a7, 10
ecall

.include "poligono.asm"
.include "include/SYSTEMv15.s"
.include "preenche.asm"
