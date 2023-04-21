# Esercizio 2

.data
sin:	.asciiz "\nInserire valore:"
snum:	.asciiz " -> valore inserito:"
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

num:		slt $t1, $t0, ':'
			beq $t1, 1, stnum
			li $v0, 4
			la $a0, notn
			syscall
			j lettura

stnum:		addi $t2, $0, 48
			sub $t1, $t0, $t2
			li $v0, 4
			la $a0, snum
			syscall
			li $v0, 1
			move $a0, $t1
			syscall
			j lettura
		
fine:		li $v0, 10
			syscall
			
.end main