# Esercizio 2

.data
wVar: .word 3

.text
.globl main
.ent main

main:
	lw $t0, wVar
	
	li $v0, 10
	syscall
.end main