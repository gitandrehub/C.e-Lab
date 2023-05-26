# Esercizio 2

.data
enter_text:	.asciiz "Inserisci il numero:"
fine_text: 	.asciiz "il successivo è:"

.text
.globl main
.end main
main:
		li $v0, 4
		la $a0, enter_text
		syscall
		
		li $v0, 5
		syscall
		move $a0, $v0
		
		jal calcolaSuccessivo
		
		li $v0, 4
		la $a0, fine_text
		syscall
		
		li $v0, 1
		move $a0, $a1
		syscall
		
		li $v0, 10
		syscall
.end main

calcolaSuccessivo:
		li $t0, 2
		li $t1, 3
		div $t2, $a0, $t0
		mfhi $t2
		beq $t2, 0, pari
		j dispari

pari:		div $a1, $a0, $t0
			j fine
			
dispari:	mul $a0, $a0, $t1
			addi $a1, $a0, 1
			j fine
			
fine:		j $ra
.end calcolaSuccessivo