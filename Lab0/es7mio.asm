#esercizio 7

.data
DIM = 4
numero: .space 4
message_in:  .asciiz "Inserire numeri:\n"
message_min: .ascii "\nNumero minimo: "

.text
.globl main
.ent main

main:
				li $v0, 4
				la $a0, message_in
				syscall
				
				li $t1, 0						#t1 contatote
				la $t2, numero
				
enternumb:		li $v0, 5
				syscall
				sw $v0, ($t2)					#t2 numero
				add $t1, $t1, 1
				beq $t1, DIM, fine
				beq $t1, 1, minimo
				blt $t2, $t0, minimo
				j enternumb
				
minimo: 		lw $t0, ($t2)					#t0 minimo
				j enternumb				
				
fine:			li $v0, 4
				la $a0, message_min
				syscall
				
				li $v0, 1
				lw $a0, ($t0)
				syscall
				
				li $v0, 10
				syscall
.end main