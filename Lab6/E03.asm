# Esercizio 3

.data
ADD = 32
DIM = 9
stringa:	.ascii "maiuscoli"

.text
.globl main
.ent main
main:
			li $t0, 0
			
stampa:		beq $t0, DIM, fine		
			lbu $a0, stringa($t0)		# trasforma il carattere il codice ascii
			li $v0, ADD
			sub $v0, $a0, $v0			# tolgo 32
			sb $v0, stringa($t0)		# salva il codice ascii
			addi $t0, $t0, 1
			j stampa
		
fine:		li $v0, 4
			la $a0, stringa
			syscall

			li $v0, 10
			syscall
.end main