.data
	msg: .asciiz "nhap vao con so x: "
	msg1: .asciiz "nhap vao con so y: "
	msg2: .asciiz "\n so min la:"
	msg3: .asciiz "\n so max la:"
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
	
	jal min
		
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,msg3
	syscall
	
	jal max 
		
	li $v0,1
	move $a0,$t4
	syscall
	
	li $v0,10
	syscall
	
.globl min
min:
	bgt $t1,$t2,be
	be1:
		move $t3,$t1
		jr $ra
	be:
		move $t3,$t2
		jr $ra
.end min

.globl max
max:
	bgt $t1,$t2,lon
	lon1:
		move $t4,$t2
		jr $ra
	lon:
		move $t4,$t1
		jr $ra
.end max
		
