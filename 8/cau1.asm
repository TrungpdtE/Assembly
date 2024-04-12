.data
	msg: .asciiz "nhap vao con so x: "
	msg1: .asciiz "nhap vao con so y: "
	msg2: .asciiz "ket qua cua x^y la:"
	kq: .word 
.text
.globl main
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	
	li $v0,4
	la $a0,msg2
	syscall
	
	jal mu 
	sw $v0,kq
		
	li $v0,1
	lw $a0,kq
	syscall
	
	li $v0,10
	syscall
	
.globl mu
mu:
	li $t0,0
	li $v0,1
	
	loop:
		mul $v0,$v0,$t1
		addi $t0,$t0,1
		blt $t0,$t2,loop
		jr $ra
.end mu
		










	
	
	
	