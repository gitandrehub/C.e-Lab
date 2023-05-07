# Esercizio 3

.data
DIM = 4
vet1:	.word 1, 2, 3, 4
vet2:	.word 1, 2, 3, 4
matr:	.space DIM*DIM
sn:		.asciiz " - "

.text
.globl main
.ent main
main:
			li $t0, 0		# op vettore 1
			li $t1, 0		# op vettore 2
			li $t2, 0		# indice matrice
			li $t3, 0		# la moltiplicazione
			li $t4, 0		# primo indice del for
			li $t5, 0		# secondo indice del for
		
primo:		beq $t4, 16, nullo
			lw $t1, vet1($t4)
			j secondo
			
secondo:	beq $t5, 16, plus1
			lw $t0, vet2($t5)
			mul $t3, $t1, $t0
			sw $t3, matr($t2)
			addi $t5, $t5, 4
			addi $t2, $t2, 4
			j secondo

plus1:		addi $t4, $t4, 4
			li $t5, 0
			j primo
			
nullo:		li $t3, 0
			li $t2, 0
			
stampa:		li $v0, 1
			lw $a0, matr($t2)
			syscall
			li $v0, 4
			la $a0, sn
			syscall
			addi $t2, $t2, 4
			addi $t3, $t3, 1
			beq $t3, 16, fine
			j stampa
				
fine:		li $v0, 10
			syscall
.end main