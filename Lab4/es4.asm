# Esercizio 4

.data
DIM = 10*10*4
mat:	.space 10*10
ss:		.asciiz " - "

.text
.globl main
.ent main
main:
			li $t0, 1		# valore riga
			li $t1, 1		# valore colonna
			li $t2, 0		# conteggio matrice
			la $t3, mat		# matrice
			li $t4, 0		# valore corrente
		
contr:		beq $t2, DIM, pres
			
riga:		beq $t0, 10, contr

col:		beq $t1, 10, nullo
			mul $t4, $t1, $t0
			sw $t4, mat($t2)
			addi $t2, $t2, 4
			addi $t1, $t1, 1 
			j col

nullo:		li $t1, 0
			addi $t0, $t0, 1
			j riga

pres:		li $t2, 0
			
stampa:		beq $t2, DIM, fine
			li $v0, 1
			la $a0, mat($t2)
			syscall
			li $v0, 4
			la $a0, ss
			syscall
			addi $t2, $t2, 4
			j stampa

fine:		li $v0, 10
			syscall
		
.end main