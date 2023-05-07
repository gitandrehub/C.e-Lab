#  Esercizio 4 ottimizzato

.data
tab:	.word somma, sottrazione, divisione, moltiplicazione	
opa:	.word 2043
opb:	.word 5
res:	.space 4
inp:	.asciiz "Inserire l'operazione da eseguire:"
s_r:	.asciiz "Il risultato è:"

.text
.globl main
.ent main
main:
			li $v0, 4
			la $a0, inp
			syscall
			li $v0, 5
			syscall
			
			sll $t1, $v0, 2				# moltiplico per 4 per cercare la posizione nel vettore
			lw $t2, tab($t1)
			j $t2
somma:		
sottrazione:
divisione:
moltiplicazione:
.end main