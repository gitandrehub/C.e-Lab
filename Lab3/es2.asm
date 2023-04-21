# Esercizio 2

.data
valore:	.space 4
iin:	.word 48
ifin:	.word 58
bi:		.word 0
bf:		.word 4294967295
sin:	.asciiz "\nInserire valore:"
sst:	.asciiz " -> valore inserito:"
srap:	.asciiz " ; rappresentabile su 4 byte"
notn:	.asciiz " -> no numero"
.text
.globl main
.ent main

main:       
			la $t0, valore
			lw $t3, iin
			lw $t4, ifin
			lw $t5, bi
			lw $t6, bf
			
lettura:	li $v0, 4
			la $a0, sin
			syscall
			li $v0, 12
			syscall
			move $t0, $v0
			j controllo

controllo:  bgeu $t0, $t3, num			#numero
			beq $t0, '\n', fine
			li $v0, 4
			la $a0, notn
			syscall
			j lettura

num:		slt $t1, $t0, $t4
			beq $t1, 1, stampan
			li $v0, 4
			la $a0, notn
			syscall
			j lettura

stampan:	li $v0, 4
			la $a0, sst
			syscall
			li $v0, 1
			move $a0, $t0
			syscall
			bgeu $t0, $t5, rapp4b
			j lettura
			
rapp4b:		slt $t1, $t0, $t6
			beq $t1, 1, rapp
			j lettura		

rapp:		li $v0, 4
			la $a0, srap
			syscall
			j lettura
			
fine:		li $v0, 10
			syscall
			
.end main