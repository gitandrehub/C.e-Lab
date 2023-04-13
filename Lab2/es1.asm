# Esercizio 1

.data
val2: 	.byte 2
val: 	.space 1
spar: 	.asciiz "L'elemento è pari\n"
sdis: 	.asciiz "L'elemento è dispari\n"
sin: 	.asciiz "Inserire il numero: "

.text
.globl main
.ent main
main:
	li $v0, 4
	la $a0, sin
	syscall
	
	la $t0, val
	li $v0, 5
	syscall
	move $t0, $v0
	
	lb $t1, val2
	div $t0, $t1
	mfhi $t2
	beq $t2, 0, pari
	j disp

pari: 	li $v0, 4
		la $a0, spar
		syscall
		j fine

disp: 	li $v0, 4
		la $a0, sdis
		syscall
		j fine
		
fine:	li $v0, 10
		syscall
.end main