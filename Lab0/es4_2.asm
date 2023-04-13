.data
DIM = 5
wVett: .word 2, 5, 16, 12, 34
wResult: .space 4

.text
.globl main
.ent main

main:
		li $t1, 0
		li $t3, 0
		la $t0, wVett
	
ciclo:	lw $t2, ($t0)
		add $t1, $t1, $t2
		add $t3, $t3, 1
		add $t0, $t0, 4
		beq $t3, DIM, fine
		j ciclo

fine:	sw $t1, wResult

		li $v0, 1
		move $a0, $t1			# devo mettere il contenuto il $a0 quindi uso il comando 'move'
		syscall
		
		li $v0, 10
		syscall
.end main