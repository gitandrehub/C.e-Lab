# Esercizio 1

.data
ingresso:	.byte 12, 47
uscita:		.byte 18, 14
X:			.byte 1
Y:			.byte 40
costo:		.asciiz "Il costo del parcheggio è:"

.text
.globl main
.ent main

main:
			la $a0, ingresso
			la $a1, uscita
			lbu $a2, X
			lbu $a3, Y
			
			jal costoParcheggio
			
			move $t0, $v0
			
			li $v0, 4
			la $a0, costo
			syscall
			
			li $v0, 1
			move $a0, $t0
			syscall
			
			li $v0, 10
			syscall
.end main

costoParcheggio:
			lb $t0, ($a0)			# ore in ingresso
			lb $t1, 1($a0)			# minuti in ingresso
			
			lb $t2, ($a1)			# ore in uscita
			lb $t3, 1($a1)			# minuti in uscita
			
			li $t4, 0				# costo totale del parcheggio
			li $t5, 60
			
ciclo:	    add $t1, $t1, $a3
			addi $t4, $t4, 1
			bge $t1, $t5, resto
			j controllo
			
resto:		sub $t1, $t1, $t5
			addi $t0, $t0, 1
			j controllo

controllo:	bge $t0, $t2, cont2
			j ciclo

cont2:		bge $t1, $t3, fine
			j ciclo

fine:		subu $t4, $t4, 1
			move $v0, $t4
			jr $ra			

.end costoParcheggio