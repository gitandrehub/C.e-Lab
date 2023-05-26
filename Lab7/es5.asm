# Esercizio 5

.data
wmat:	.word 1, 41, 42, 13, 56, 23, 73, 9, 50
out:	.asciiz "\nIl determinante della matrice 3x3 è:"

.text
.globl main
.ent main

main:
		subu $sp, $sp, 28
		la $t0, wmat
		lw $a0, ($t0)			# a1
		lw $a1, 4($t0)			# b1
		lw $a2, 8($t0)			# c1
		lw $a3, 12($t0)			# a2
		
		lw $t1, 16($t0)
		sw $t1, ($sp)			# b2
		lw $t1, 20($t0)
		sw $t1, 4($sp)			# c2
		lw $t1, 24($t0)
		sw $t1, 8($sp)			# a3
		lw $t1, 28($t0)
		sw $t1, 12($sp)			# b3
		lw $t1, 32($t0)
		sw $t1, 16($sp)			# c3
		
		jal determinante
		
		lw $t0, 20($sp)
		lw $t1, 24($sp)
		lw $t2, 28($sp)
		
		li $v0, 4
		la $a0, out
		syscall
		
		sub $t0, $t0, $t1
		addu $a0, $t0, $t2
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
.end main

determinante:
			li $t1, 0
			li $t2, 0
			j primo

primo:		lw $t3, 0($sp)
			lw $t4, 16($sp)
			lw $t5, 4($sp)
			lw $t6, 12($sp)
			multu $t3, $t4
			mflo $t1
			multu $t5, $t6
			mflo $t2
			subu $t3, $t1, $t2
			multu $t3, $a0
			mflo $t6
			sw $t6, 20($sp)
			j secondo

secondo:	lw $t3, 16($sp)
			lw $t4, 8($sp)
			lw $t5, 4($sp)
			lw $t6, 0($sp)
			multu $a3, $t3
			mflo $t1
			multu $t4, $t5
			mflo $t2
			subu $t6, $t1, $t2
			multu $t6, $a1
			mflo $t3
			sw $t3, 24($sp)
			j terzo

terzo:		lw $t3, 12($sp)
			lw $t4, 0($sp)
			lw $t5, 8($sp)
			lw $t6, 0($sp)
			multu $a3, $t3
			mflo $t1
			multu $t4, $t5
			mflo $t2
			subu $t6, $t1, $t2
			multu $t6, $a2
			mflo $t3
			sw $t3, 28($sp)
			jr $ra
.end determinante