#bt thuc hanh tuan 8
#Pham Dang Thanh Trung
#522H0148
#version 1.0
#ngay 5 thang 1
.data
	msg: .asciiz "nhap vao con so n: "
	msg1: .asciiz "day la so hoan thien"
	msg2: .asciiz "day khong phai la so hoan thien"
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
	li $t0,0
	li $t7,0
	loop:
		addi $t2,$t2,1
		bge $t2,$t1,thoat
		hello:
			rem $t6,$t1,$t2
			bne $t6,$t0,tl
			t2:
				add $t7,$t7,$t2
				j loop
			tl:
				j loop
		thoat:
			bne $t1,$t7,kq2
			kq1:
				li $t4,1
				jr $ra
			kq2:
				li $t4,0
				jr $ra
.end cp