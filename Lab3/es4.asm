# Esercizio 4

.data
DIM = 5
sin:	.asciiz "Inserire numero:"
sfin:	.asciiz "Media:"

.text
.globl main
.ent main
main:	add $t1, $0, $0			# somma
		add $t2, $0, $0			# contatore
		add $t3, $0, $0			# media
		
lettura:	li $v0, 4
			la $a0, sin
			syscall
			li $v0, 5
			syscall
			add $t0, $v0, $0
			add $t1, $t1, $t0
			add $t2, $t2, 1
			beq $t2, DIM, calcolo
			j lettura
			
calcolo:	divu $t3, $t1, DIM
			li $v0, 4
			la $a0, sfin
			syscall
			
			li $v0, 1
			move $a0, $t3
			syscall
			j fine
		
fine:		li $v0, 10
			syscall
.end main