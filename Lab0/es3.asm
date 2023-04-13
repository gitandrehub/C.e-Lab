# Esercizio 4

.data
op1: .word 10
op2: .word 24
result: .space 4

.text
.globl main
.ent main
main:
	lw $t0, op1
	lw $t1, op2
	add $t2, $t1, $t0
	sw $t2, result
	
	li $v0, 10
	syscall
.end main