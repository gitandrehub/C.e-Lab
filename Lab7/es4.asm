# Esercizio 4

.data
mat:	.word 2, 4, 8, 10
out:	.asciiz "Il determinante della matrice 2x2 vale:"

.text
.globl main
.ent main
main:
		la $t0, mat
		lw $a0, ($t0)
		addi $t0, $t0, 4
		lw $a1, ($t0)
		addi $t0, $t0, 4
		lw $a2, ($t0)
		addi $t0, $t0, 4
		lw $a3, ($t0)
		jal determinante
		move $a1, $v0
		
		li $v0, 4
		la $a0, out
		syscall
		li $v0, 1
		move $a0, $a1
		syscall
		li $v0, 10
		syscall
.end main

determinante:
		mul $a0, $a0, $a3
		mul $a1, $a1, $a2
		sub $v0, $a0, $a1
		j $ra
.end determinante