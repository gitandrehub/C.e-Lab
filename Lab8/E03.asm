# Esercizio 3

.data
NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 0

prezzi: 		.word 39, 1880, 2394, 1000, 1590
scontati: 		.space DIM

.text
.globl main
.ent main

main:
		la $a0, prezzi
		la $a1, scontati
		li $a2, NUM
		li $a3, SCONTO
		li $t0, ARROTONDA
		subu $sp, 4	
		sw $t0, ($sp)
		
		jal calcola_sconto
		li $t0, 0
		move $t0, $v0
		addi $sp, $sp, 4
		li $v0, 1
		move $a0, $t0
		syscall
		li $v0, 10
		syscall
.end main

.globl calcola_sconto
.ent calcola_sconto
calcola_sconto:
		li $t0, 0			# indice
		li $t1, 0			# elemento
		li $t2, 100
		li $t3, 0			# per l'operazione intermedia
		li $t4, 0
		add $t5, $0, $a1
		li $t6, 0
		lw $t7, ($sp)		# arrotondamento
		
ciclo:	beq $t0, $a2, torna
		lw $t1, ($a0)
		mul $t3, $t1, $a3	# *sconto
		mul $t4, $t1, $t2	# *100
		sub $t3, $t4, $t3
		div $t3, $t2
		mfhi $t3			# parte decimale
		mflo $t4			# parte prima della virgola
		beq $t7, 1, up
		j salva

up:		bge $t3, 50, plus
		j salva
		
plus:	addi $t4, $t4, 1
		j salva
		
salva:	sub $t1, $t1, $t4		# calcolo dello sconto totale
		add $t6, $t6, $t1
		sw $t4, ($t5)
		addi $t0, $t0, 1
		addi $a0, $a0, 4
		addi $t5, $t5, 4
		j ciclo
				
torna:	move $v0, $t6
		jr $ra

.end calcola_sconto