# Esercizio 1

.data
sin:	.asciiz "\nInserire valore:"
notn:	.asciiz " -> no numero"
.text
.globl main
.ent main

main:       
			
lettura:	li $v0, 4
			la $a0, sin
			syscall
			li $v0, 12
			syscall
			add $t0, $v0, $0
			j controllo

controllo:  bge $t0, '0', num			#numero
			beq $t0, '\n', fine
			li $v0, 4
			la $a0, notn
			syscall
			j lettura

num:		slt $t1, $t0, '9'
			beq $t1, 1, lettura
			li $v0, 4
			la $a0, notn
			syscall
			j lettura
			
fine:		li $v0, 10
			syscall
			
.end main