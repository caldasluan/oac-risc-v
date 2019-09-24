.data
TEXT_AREA: .asciz "Area="

.text
AREA:
addi t0, a0, 0

la a0, TEXT_AREA
li a1, 0
li a2, 0
li a3, 0xff
li a4, 0
li a7, 104
ecall

addi a0, t0, 0
li a1, 40
li a2, 0
li a3, 0xff
li a4, 0
li a7, 101
ecall

ret