# Esercizio 1

.data
valore:	.word 3141592653

.text
.globl main
.ent main

main:
			li $t0, 0 				# numero di cifre
			li $t1, 10				# costante
			li $t3, 1
			lw $t2, valore			# valore attuale
			
lettura:	beq $t2, 0, stampa
			divu $t2, $t1
			mfhi $t2
			addi $t0, $t0, 1
			subu $sp, $sp, 4		# faccio spazio per il valore da mettre nello stack
			sw $t2, ($sp)			# salvo il valore nello stack
			mflo $t2
			j lettura

stampa:		beq $t0, 0, fine		# stampa del valore
			li $v0, 1
			lw $a0, ($sp)
			syscall
			sub $t0, $t0, $t3
			addi $sp, $sp, 4
			j stampa

fine:		li $v0, 10
			syscall
		
.end main