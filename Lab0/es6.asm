# Lettura di valori da tastiera

.data
				DIM = 4
wRes: 			.space 4
message_in: 	.asciiz "Inserire numeri:\n"			# .asciiz mette il carattere NULL di fine riga alla fine
message_out: 	.asciiz "Numeri inseriti:\n"
space: 			.ascii " ; "							# .ascii non mette il carattere NULL di fine riga

.text
.globl main
.ent main

main:
		la $a0, message_in						#le 3 righe per printare la stringa di message_in
		li $v0, 4
		syscall
	
		la $t0, wRes							#dove costruiamo la stringa
		li $t1, 0
		
uno:			li $v0, 5						#lettura di un'intero e lo salva poi in t0, la stringa
				syscall
				sw $v0, ($t0)					#per stampare poi i numeri in decimale li salvo in t0
				beq $t1, DIM, print_num			#se ho inserito tutti i numeri richiesti
				add $t1, $t1, 1					#aggiorno il conteggio
				add $t0, $t0, 4					#sposto di una casella
				j uno
		
print_num:		la $a0, message_out				#stampa della scritta di fine input
				li $v0, 4
				syscall
				
				#Preparazione alla print della stringa
				la $t0, wRes					#dove costruiamo la stringa
				li $t1, 0						#azzero il contatore per poterlo riusare senza aggiungere un'altro registro

ciclo_print:	li $v0, 1						#stampa del prima casella
				lw $a0, ($t0)
				syscall
				beq $t1, DIM, fine				#se sono stati stampati tutti i valori
				la $a0, space					#stampa del ';' tra ogni numero				
				li $v0, 4
				syscall
				add $t1, $t1, 1					#aggiornamento contatore
				add $t0, $t0, 4					#prossima casella
				j ciclo_print
				
fine:			nop

				li $v0, 10
				syscall
.end main