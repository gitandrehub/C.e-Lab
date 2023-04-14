# Esercizio 3 - senza vettore

.data
var1:	.word 3
var2:	.word 11
var3:	.word 10
sf:		.asciiz "I numeri in ordine crescente: "
ss: 	.ascii " - "

.text
.globl main
.ent main
main:
			lw $t0, var1
			lw $t1, var2
			lw $t2, var3
		
			bgt $t0, $t1, s1
			j c
		
c:			bgt $t0, $t2, s2
			j c2
			
c2:			bgt $t1, $t2, s3
			j fine
			
s1:			move $t3, $t0
			move $t0, $t1
			move $t1, $t3
			j c

s2:			move $t3, $t0
			move $t0, $t2
			move $t1, $t3
			j c2
			
s3:			move $t3, $t1
			move $t1, $t2
			move $t2, $t3
			j fine

fine:		li $v0, 4
			la $a0, sf
			syscall
			
			li $v0, 1
			move $a0, $t0
			syscall
			li $v0, 4
			la $a0, ss
			syscall
			li $v0, 1
			move $a0, $t1
			syscall
			li $v0, 4
			la $a0, ss
			syscall
			li $v0, 1
			move $a0, $t2
			syscall
			
			li $v0, 10
			syscall
.end main