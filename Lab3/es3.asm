#Esercizio 3

.data
g:		.byte 10
o:		.byte 4
m:		.byte 45
risultato:	.word 0

.text
.globl main
.ent main
main:
	lbu $t0, g
	mul $t1, $t0, 24
	lbu $t0, o
	addu $t1, $t1, $t0
	mul $t1, $t1, 60
	lbu $t0, m
	addu $t0, $t0, $t1

	sw $t0, risultato

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 10
	syscall
.end main