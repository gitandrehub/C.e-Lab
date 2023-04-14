# Esercizio 3 con vettore

.data
var1:	.word 3
var2:	.word 11
var3:	.word 10
vett: 	.space 4
sf:		.asciiz "I numeri in ordine crescente: "
ss: 	.ascii " - "
.text
.globl main
.ent main
main:
		la $t0, vett		#vettore in cui salvare i numeri in ordine
		lw $t1, var1
		lw $t2, var2
		lw $t3, var3
		
		
		
.end main