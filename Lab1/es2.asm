# Esercizio 2

.data
var1: .byte 'm'
var2: .byte 'i'
var3: .byte 'p'
var4: .byte 's'
var5: .byte 0

.text
.globl main
.ent main
main:
	lb $t0, var1
	addi $t0, $t0, -32
	sb $t0, var1
	
	lb $t0, var2
	addi $t0, $t0, -32
	sb $t0, var2
	
	lb $t0, var3
	addi $t0, $t0, -32
	sb $t0, var3
	
	lb $t0, var4
	addi $t0, $t0, -32
	sb $t0, var4
	
	li $v0, 4
	la $a0,var1
	syscall
	
	li $v0, 10
	syscall
.end main