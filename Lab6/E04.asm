# Esercizio 4

.data
DIM = 7
vettore:		.word 3, 4, 5, 6, 8, 5, 5
stringa_max:	.asciiz "Il numero massimo è:"

.text
.globl main
.ent main
main:
			la $a0, vettore
			li $a1, DIM
			jal ricerca
			li $v0, 1
			move $a0, $t0
			syscall
			li $v0, 10
			syscall
	
.end main

ricerca:
		li $t0, 0		# dove metto il massimo
		li $t1, 0		# dove conto i cicli		
		li $t3, 0		# dove salvo l'elemento
		
cont:	lw $t3, ($a0)
		bgt $t3, $t0, new
		addi $a0, $a0, 4
		addi $t1, $t1, 1
		bne $t1, DIM, cont
		j $ra

new:	move $t0, $t3
		addi $t1, $t1, 1
		addi $a0, $a0, 4
		bne $t1, DIM, cont
		j $ra

.end ricerca