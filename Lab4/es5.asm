# Esercizio 5

.data
DIM = 6*4*4

mat: 	.word 154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0
ssomma:	.asciiz "La somma è:"
srow: 	.asciiz "RIGHE\n"
scol: 	.asciiz "\nCOLONNE\n"
ss: 	.asciiz " - "
scapo: 	.asciiz "\n"

.text
.globl main
.ent main
main:
			li $t4, 0		#somma su righe (0) e somma su colonne (1)
start:		li $t0, 0		#indice riga
			li $t1, 0		#somma
			li $t2, 0		#valore corrente
			li $t3, 0 		#indice matrice totale
			
			beq $t4, 0, p_righe
			beq $t4, 1, p_col


p_righe:	li $t5,  DIM
			j righe

p_col:		li $t5,  DIM
			li $t6, 72
			j col

col:		beq $t3, $t5, presc
			j cont_c
			
cont_c:		beq $t0, $t6, plus_c
			lw $t2, mat($t0)
			addu $t1, $t1, $t2
			addi $t0, $t0, 24
			addi $t3, $t3, 4
			j cont_c

plus_c:		sw $t1, mat($t0)
			li $t1, 0
			li $t0, 0
			addi $t3, $t3, 4
			addi $t6, $t6, 4
			sub $t0, $t6, 72
			j col

presc:		li $t0, 0
			li $v0, 4
			la $a0, scol
			syscall
			j stampa

righe:		beq $t3, $t5, presr
			j cont_r

cont_r:		beq $t0, 20, plus_r
			lw $t2, mat($t3)
			add $t1, $t1, $t2
			addi $t0, $t0, 4
			addi $t3, $t3, 4
			j cont_r
			
plus_r:		sw $t1, mat($t3)
			addi $t3, $t3, 4
			li $t1, 0
			li $t0, 0
			j righe

presr:		li $t0, 0
			li $v0, 4
			la $a0, srow
			syscall
			li $t4, 0
			j stampa

stampa:		beq $t0, $t5, fine
			li $v0, 1
			lw $a0, mat($t0)
			syscall
			li $v0, 4
			la $a0, ss
			syscall
			addi $t0, $t0, 4
			j stampa
		
fine:		addi $t4, $t4, 1
			beq $t4, 1, start
			li $v0, 10
			syscall
.end main