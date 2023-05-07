# Esercizio 4

.data
DIM = 4
DIMi = 4*20
matrix:	.word 1 0 0 0
		.word 0 2 0 0
		.word 0 0 3 0
		.word 0 0 0 4
		
vett:	.space 4			# vettore dove salvo 
	
msg_diag:	.asciiz "La matrice è diagonale"
msg_simm:	.asciiz "La matrice è simmetrica"
msg_nsim:	.asciiz "La matrice non è simmetrica"

.text
.globl main
.ent main
main:
		li $t0, 0 		# valore all'angolo - elemento
		li $t1, 0		# somma simmetrie
		li $t2, 0		# somma zeri
		li $t3, 0		# somma elementi su diagonale		
		la $t4, matrix	# matrice
		li $t5, 0		# operazione a cui sono - i
		la $t6, vett	# vettore dove salvare gli elementi da confrontare
		li $t7, 0		# j
		
		li $s0, 20		# passaggi per diagonale, colonna e riga
		li $s1, 16
		li $s2, 4
		sub $sp, $sp, 12
		sw $s0, ($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		
		beq $t6, DIMi, fine
			lw $t0, ($t4)
			
			beq $t7, 
		
		addi $t4, $t4, 20
		addi $t6, $t6, 20
		
fine:		li $v0, 10
			syscall
.end main