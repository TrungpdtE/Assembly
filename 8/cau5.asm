#bt thuc hanh tuan 8
#Pham Dang Thanh Trung
#522H0148
#version 1.0
#ngay 5 thang 1
.data
	msg: .asciiz "nhap vao con so n: "
	msg1: .asciiz "day la so nguyen to"
	msg2: .asciiz "day khong phai la so nguyen to"
.text
.globl main
main:

	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	
	
	jal cp
	li $t5,1	
	beq $t4,$t5,tra1
	tra:
		li $v0,4
		la $a0,msg2
		syscall
		j exit
	tra1:
		li $v0,4
		la $a0,msg1
		syscall
	exit:
	li $v0,10
	syscall
	
.globl cp
cp:
	li $t2,0
	loop:
		addi $t2,$t2,1
		bgt $t2,$t1,thoat
		hello:
			mul $t3,$t2,$t2
			beq $t3,$t1,tl
			t2:
				j loop
			tl:
				li $t4,0
				jr $ra
		thoat:
			li $t5,2
			blt $t1,$t5,kq
			li $t4,1
			jr $ra
			kq:
				li $t4,0
				jr $ra
.end cp