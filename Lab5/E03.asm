# Esercizio 3

.data
msg_ina:	.asciiz "Inserisci a:"
msg_inb:	.asciiz "Inserisci b:"
msg_inc:	.asciiz "Inserisci c:"

msg_sol1:	.asciiz "Le soluzioni dell'equazione coincidono"
msg_sol2:	.asciiz "L'equazione ha 2 soluzioni"
msg_nsol:	.asciiz "L'equezione inserita non ha soluzioni reali"

.text
.globl main
.ent main
main:
			li $t0, 0		# valore a
			li $t1, 0 		# valore b
			li $t2, 0		# valore c
			li $t3, 4		# temporaneo
			li $t4, 0		# valore completo 
			
			li $v0, 4
			la $a0, msg_ina
			syscall
			li $v0, 5
			syscall
			move $t0, $v0
			
			li $v0, 4
			la $a0, msg_inb
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
			
			li $v0, 4
			la $a0, msg_inc
			syscall
			li $v0, 5
			syscall
			move $t2, $v0

			mul $t4, $t1, $t1		# b*b
			mul $t3, $t0, $t3		# 4*a
			mul $t3, $t3, $t2		# *c
			sub $t4, $t4, $t3		# b*b - 4*a*c
			
			li $t3, 0
			beq $t4, 0, sol1
			slt $t3, $t4, $t3
			beq $t3, 1, nosol
			j sol2

sol1:		li $v0, 4
			la $a0, msg_sol1
			syscall
			j fine
			
sol2:		li $v0, 4
			la $a0, msg_sol2
			syscall
			j fine
			
nosol:		li $v0, 4
			la $a0, msg_nsol
			syscall
			j fine
			
fine:		li $v0, 10
			syscall
.end main