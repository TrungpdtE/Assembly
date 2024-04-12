#bt thuc hanh tuan 8
#Pham Dang Thanh Trung
#522H0148
#version 1.0
#ngay 5 thang 1
.data
	msg: .asciiz "nhap vao con so n: "
	msg1: .asciiz "n! =  "
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
	
	jal gt
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,10
	syscall

.globl gt
gt:
		li $t0,1
		li $t2,1
	loop:
		bgt $t2,$t1,exit
		hehe:
		mul $t0,$t0,$t2
		addi $t2,$t2,1
		j loop
		exit:
		jr $ra
.end gt