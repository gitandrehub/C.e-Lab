# Esercizio 3

.data
enter_text:	.asciiz "Inserisci il primo numero:"
succ_text: 	.asciiz " \n> il successivo è:"
N_text:		.asciiz "\nPassi necessari:"

.text
.globl main
.ent main
main:
				li $v0, 4
				la $a0, enter_text
				syscall
					
				li $v0, 5
				syscall
				move $a0, $v0
				
				li $t0, 1
		
controllo:		beq $a0, 1, stampa
				jal calcolaSuccessivo
				li $v0, 4
				la $a0, succ_text
				syscall
				
				li $v0, 1
				move $a0, $a1
				syscall
				addi $t0, $t0, 1
				j controllo

stampa:			li $v0, 11
				li $a0, '\n'
				syscall
				li $v0, 4
				la $a0, N_text
				syscall
				
				li $v0, 1
				move $a0, $t0
				syscall
				
				li $v0, 10
				syscall
.end

calcolaSuccessivo:
			li $t1, 2
			li $t2, 3
			div $t3, $a0, $t1
			mfhi $t3
			beq $t3, 0, pari
			j dispari

pari:		div $a1, $a0, $t1
			j fine
		
dispari:	mul $a0, $a0, $t2
			addi $a1, $a0, 1
			j fine
		
fine:		j $ra
.end calcolaSuccessivo