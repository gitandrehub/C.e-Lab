# Esercizio 4

.data
vett: 	.word 5, 7, 3, 4
result: .space 4

.text
.globl main
.ent main

main:
			la 		$t1, vett				# prendo l'indirizzo del vettore
			and 	$t3, $0, $0				# metto a 0 i due registri accumulatori
			and 	$t4, $0, $0
	
lettvett:	lw 		$t0, ($t1)				# leggo casella per casella
			add 	$t4, $t4, $t0			# faccio la somma e la salvo in t4
			addi 	$t3, $t3, 1			# incremento per leggere i 4 valori
			addi 	$t1, $t1, 4			# incremento per la prossima casella
			bne 	$t3, 4, levett			# faccio il for fino a quando non ho letto tutti i valori
			
			sw 		$t4, result
			
			li 		$v0, 10
			syscall
.end main