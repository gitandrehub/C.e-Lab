# Esercizio 5

.data
message_t1: .asciiz "Inserire $t1:\n"
message_t2: .asciiz "Inserire $t2:\n"
.text
.globl main
.ent main
main:
			li $v0, 4					# Inserisco i due numeri
			la $a0, message_t1
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
			
			li $v0, 4
			la $a0, message_t2
			syscall
			li $v0, 5
			syscall
			move $t2, $v0
			
			mul $t1, $t1, $t2			# li giro
			div $t2, $t1, $t2
			div $t1, $t1, $t2
			
			li $v0, 10
			syscall
.end main