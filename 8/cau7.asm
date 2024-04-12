.data
	msg: .asciiz "nhap vao con so x: "
	msg1: .asciiz "nhap vao con so y: "
	msg2: .asciiz "UCLN("
	msg3: .asciiz ","
	msg4: .asciiz ")="
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
	
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,4
	la $a0,msg3
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall
	
	li $v0,4
	la $a0,msg4
	syscall
	
	jal ucln
	
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,10
	syscall
	
	
	
.globl ucln
ucln:
	beq $t1,$zero,out
	on:
		beq $t2,$zero,out1
		on1:
			j loop
		out1:
			add $t1,$t1,$t2
			jr $ra
	out:
		add $t1,$t1,$t2
		jr $ra
loop:
	beq $t2,$zero,thoat
		rem $t4,$t1,$t2
		move $t1,$t2
		move $t2,$t4
		j loop
	thoat:
		jr $ra
	