# Esercizio 4 e 5

.data
wVett: .word 5, 7, 3, 4 		# definisco il vettore
wResult: .space 4				# definisco la variabile dove ci sarà il risultato

.text
.globl main
.ent main

main:
		la $t1, wVett			# prendo l'indirizzo del vettore
		and $t3, $0, $0			# metto a zero i due accumulatori che userò:
		and $t4, $0, $0			# t3 per il ciclo e t4 per la somma
lab1:	lw $t0, ($t1)			# prendo il valore in t1 e lo salvo in t4
		add $t4, $t4, $t0		# sommo alla somma il valore appena letto
		addi $t3, $t3, 1		# aggiungo 1 per aumentare il parametro del ciclo
		addi $t1, $t1, 4		# aggiungo 4 perchè ogni casella ha 5 bit quindi aggiungo 4 
		bne $t3, 5, lab1		# se t3 != 5 allora vai a lab1 -> ciclo for
		
		sw $t4, wResult			# salvo la somma nella variabile wResult

		li $v0, 10
		syscall
.end main