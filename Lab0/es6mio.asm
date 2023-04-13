.data
DIM = 5;
wRes: .space 4
message_in: .asciiz "Inserire numeri:\n"
message_out: .asciiz "Numeri inseriti:\n"
message_space: .ascii " - "

.text
.globl main
.ent main
main:

stampami:	li $v0, 4
			la $a0, message_in
			syscall
			
			li $t1, 0
			la $t0, wRes
	
numberin:	li $v0, 5
			syscall
			sw $v0, ($t0)
			add $t1, $t1, 1
			add $t0, $t0, 4
			beq $t1, DIM, stampamo
			j numberin
			
stampamo:	li $v0, 4
			la $a0, message_out
			syscall
			
			li $t1, 0
			la $t0, wRes
			
stampa:		li $v0, 1
			lw $a0, ($t0)					#usiamo 'lw' e non 'move' perchè 'lw' mantiene il decimale
			syscall
			add $t0, $t0, 4
			add $t1, $t1, 1
			beq $t1, DIM, fine
			li $v0, 4
			la $a0, message_space
			syscall
			j stampa
			
			
fine:		li $v0, 10
			syscall
	
.end main