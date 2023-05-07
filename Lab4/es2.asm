# Esercizio 2

.data
opa:	.word 2043
opb:	.word 5
res:	.space 4
inp:	.asciiz "Inserire l'operazione da eseguire:"
s_r:	.asciiz "Il risultato è:"

.text
.globl main
.ent main
main:
		li $t0, 0
		lw $t1, opa
		lw $t2, opb
		
		li $v0, 4
		la $a0, inp
		syscall
		li $v0, 5
		syscall
		move $t0, $v0
		li $v0, 4
		la $a0, s_r
		syscall
		
		beq $t0, 0, plus
		beq $t0, 1, sott
		beq $t0, 2, molt
		beq $t0, 3, divi
		j fine
		
plus:	add $t0, $t1, $t2		#2048
		li $v0, 1
		move $a0, $t0
		syscall
		j fine
		
sott:	sub $t0, $t1, $t2		#2038
		li $v0, 1
		move $a0, $t0
		syscall
		j fine
		
molt:	mul $t0, $t1, $t2		#10215
		li $v0, 1
		move $a0, $t0
		syscall
		j fine

divi:	div $t0, $t1, $t2		#408
		li $v0, 1
		move $a0, $t0
		syscall
		j fine	

fine:	li $v0, 10
		syscall
.end main