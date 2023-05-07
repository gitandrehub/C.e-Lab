# Esercizio 2

.data
msg_let:	.asciiz "Inserire parola:"
msg_pal:	.asciiz "\nla parola inserita è palindroma"
msg_npal:	.asciiz "\nla parola inserita non è palindroma"

.text
.globl main
.ent main
main:
			li $t0, 0			# conteggio lettere
			li $t1, 0			# primo carattere
			li $t2, 0			# secondo carattere
			li $t3, 0			# operazione
			li $t4, 0			# per finire il ciclo
			li $t5, 0			# palindroma o meno
			li $t6, 2			# costante per la divisione
			li $t7, 1			# costante per togliere 1
						
lettura:	
			li $v0, 4			# messaggio d'ingresso
			la $a0, msg_let
			syscall
			li $v0, 12
			syscall
			beq $v0, '\n', pr_cont
			subu $sp, $sp, 4
			sw $v0, ($sp)
			addi $t0, $t0, 1
			li $v0, 11
			li $a0, '\n'
			syscall
			j lettura

pr_cont:	beq $t0, 1, pali
			div $t0, $t6
			mflo $t4
			sub $t1, $t0, $t3
			sub $t1, $t0, $t1
			mul $t1, $t3, 4			#N-(N-operazione) * 4
			add $sp, $t1, $0
			lw $t1, ($sp)
			
			sub $t0, $t0, $t6		#N-operazione*4 ($sp)
			mul $t2, $t0, 4
			add $sp, $sp, $t2
			lw $t2, ($sp)
			j fine
			
pali:		li $v0, 4
			la $a0, msg_pal
			syscall
						
fine:		li $v0, 10
			syscall
.end main