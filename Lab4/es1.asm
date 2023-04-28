# Esercizio 1

.data
DIM = 20
Vett:		.space DIM
valore:		.word 0
i_v:		.word 0
stringa:	.asciiz "Serie al passaggio:"
strf:		.asciiz "\n"

.text
.globl main
.ent main
main:
				li $t0, 0				#indice qta elementi
				lw $t2, valore			#valore da salvare
				lw $t3, i_v				#indice per vettore
		
lettura:		beq $t0, 0, primo
				beq $t0, 1, secondo
				beq $t0, DIM, fine
				j normale

primo:			li $t2, 1
				sw $t2, Vett
				j modifica

secondo:		li $t2, 1
				sw $t2, Vett($t3)
				j modifica

normale:		sub $t4, $t3, 4
				sub $t5, $t3, 8
				lw $t4, Vett($t4)
				lw $t5, Vett($t5)
				add $t2, $t4, $t5
				sw $t2, Vett($t3)
				j modifica	
				
modifica:		li $v0, 1
				lw $a0, Vett($t3)
				syscall
				li $v0, 4
				la $a0, strf
				syscall
				addi $t0, $t0, 1
				addi $t3, $t3, 4
				j lettura

fine:			li $v0, 10
				syscall
				
.end main