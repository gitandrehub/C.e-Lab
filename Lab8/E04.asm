# Esercizio 4

DIM = 5
.data
vet1: 		.word 56, 12, 98, 129, 58
vet2: 		.word 1, 0, 245, 129, 12
risultato: 	.space DIM
astampa:	.asciiz "distanza: "

.text
.globl main
.ent main
main: 
		la $a0, vet1
		la $a1, vet2
		la $a2, risultato
		li $a3, DIM
		
		jal CalcolaDistanzaH		
		
		li $v0, 10
		syscall
.end main

.globl CalcolaDistanzaH
.ent CalcolaDistanzaH
CalcolaDistanzaH:
		li $t0, 0			# elemento del primo vettore
		li $t1, 0			# elemento del secondo vettore
		li $t2, 0			# indice
		add $t3, $0, $a0	# primo vettore
		add $t4, $0, $a1	# secondo vettore
		add $t5, $0, $a2	# risultato
		li $t6, 0			# per i bit
		
		
		sub $sp, $sp, 8
		
ciclo:	beq $t2, $a3, torna
		li $t7, 16
		lw $t0, ($t3)
		lw $t1, ($t4)
		sw $t0, ($sp)
		sw $t1, 4($sp)
		
bit:	beq $t7, -1, stampa
		lw $t0, ($sp)
		srl $t6, $t0, $t7
		andi $t0, $t6, 1
		lw $t1, 4($sp)
		srl $t6, $t1, $t7
		andi $t1, $t6, 1
		beq $t0, $t1, c_bit
		j up
		
up:		lb $t0, ($t5)
		addi $t0, $t0, 1
		sb $t0, ($t5)
		j c_bit
	
c_bit:	addi $t7, $t7, -1
		j bit
				
stampa:	li $v0, 4
		la $a0, astampa
		syscall
		li $v0, 1
		lb $a0, ($t5)
		syscall
		li $v0, 11
		li $a0, '\n'
		syscall
		j last

last:	addi $t2, $t2, 1
		addi $t3, $t3, 4
		addi $t4, $t4, 4
		addi $t5, $t5, 1
		j ciclo	
		
torna:	addi $sp, $sp, 8
		move $v0, $t5
		jr $ra
.end CalcolaDistanzaH