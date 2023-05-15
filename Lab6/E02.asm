# Esercizio 2

.data
stampa_triangolo:	.asciiz "Stampa del triangolo:"
stampa_quadrato:	.asciiz "Stampa quadrato:"
richiesta:			.asciiz "Inserire la dimensione del lato:"
carattere:			.ascii "*"

.text
.globl main
.ent main
main:
		li $v0, 4
		la $a0, richiesta
		syscall
		li $v0, 5
		syscall
		subu $sp, $sp, 4
		sw $v0, ($sp)
		
		li $t0, 0		# per controllare quante righe
		li $t1, 0		# per controllare quante colonne
		li $t2, 0		# va a controllare di essere uguale a t2
	
		li $v0, 11
		li $a0, '\n'
		syscall	
		li $v0, 4
		la $a0, stampa_triangolo
		syscall
		jal triangolo
		li $v0, 11
		li $a0, '\n'
		syscall	
		li $v0, 4
		la $a0, stampa_quadrato
		syscall
		li $t0, 0
		li $t1, 0
		jal quadrato
		add $sp, $sp, 4
		li $v0, 10
		syscall
		
.end main

triangolo:		lw $t4, ($sp)

stampa_row:		beq $t0, $t4, salta
				addi $t1, $t1, 1
				addi $t0, $t0, 1
				li $t2, 0
				li $v0, 11
				li $a0, '\n'
				syscall

stampa_col:		li $v0, 4
				la $a0, carattere
				syscall
				addi $t2, $t2, 1
				beq $t2, $t1, stampa_row
				j stampa_col
			
salta:			j $ra

.end triangolo

quadrato:       

stampa_rowq:	beq $t0, $t4, saltaq
				addi $t0, $t0, 1
				li $t2, 0
				li $v0, 11
				li $a0, '\n'
				syscall

stampa_colq:	li $v0, 4
				la $a0, carattere
				syscall
				addi $t2, $t2, 1
				beq $t2, $t4, stampa_rowq
				j stampa_colq

saltaq:			j $ra
.end quadrato