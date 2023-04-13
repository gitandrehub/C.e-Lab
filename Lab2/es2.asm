# Esercizio 2

.data
max:	.byte 128
sin:	.asciiz "Inserire il numero: "
sfine:	.asciiz "Errore nell'inserimento dei parametri"
sop: 	.asciiz "Il risultato dell'operazione è: "

.text
.globl main
.ent main
main:		lbu $t2, max

			li $v0, 4
			la $a0, sin
			syscall
			li $v0, 5
			syscall
			move $t0, $v0				#A

			li $v0, 4
			la $a0, sin
			syscall
			li $v0, 5
			syscall
			move $t1, $v0				#B
			
			blt $t0, $t2, prova2
			j errore

prova2:		blt $t1, $t2, op
			j errore

errore:		li $v0, 4
			la $a0, sfine
			syscall
			j fine
			
op:			not $t3, $t1
			and $t2, $t0, $t3
			not $t2, $t2
			xor $t3, $t0, $t1
			or $t4, $t2, $t3			#C
			
			li $v0, 4
			la $a0, sop
			syscall
			li $v0, 1
			move $a0, $t4
			syscall
			j fine
			
fine:		li $v0, 10
			syscall
.end main