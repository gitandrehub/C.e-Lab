# Esercizio 2

.data
DIM = 6
wanni:	.word 1945, 2008, 1800, 2006, 1748, 1600
wres:	.byte 0, 0, 0, 0, 0, 0

.text
.globl main
.ent main
main:
		la $a0, wanni
		la $a1, wres
		li $a2, DIM
		
		jal bisestile
		
		la $a1, wres
		li $t3, 0
		
stampa:	beq $t3, DIM, fine
		lb $a0, ($a1)
		li $v0, 1
		syscall
		
		addi $a1, $a1, 1
		addi $t3, $t3, 1
		li $v0, 11
		li $a0, '\n'
		syscall
		j stampa

		
fine:	li $v0, 10
		syscall
.end main

bisestile:
		li $t0, 100
		li $t1, 400
		li $t2, 4
		li $t3, 0			# indice
		li $t4, 0			# elemento del vettore
		li $t5, 0			# per vedere il resto
		
ciclo:	beq $t3, DIM, close
		lw $t4, ($a0)
		div $t4, $t0
		mfhi $t5
		beq $t5, 0, try1
		j try2
		
try1:	div $t4, $t1
		mfhi $t5
		beq $t5, 0, yes
		j passo

try2:	div $t4, $t2
		mfhi $t5
		beq $t5, 0, yes
		j passo

yes:	addi $t4, $0, 1
		sb $t4, ($a1)
		j passo
	
passo:	addi $a0, $a0, 4
		addi $a1, $a1, 1
		addi $t3, $t3, 1
		j ciclo
		
close:	jr $ra
		
.end bisestile