#Bai thuc hanh lab7
#Cau1
#24/11/2004
#MSSV:522H0148
#Tacgia:ThanhTrung
.data
msg: .asciiz "Nhap so luong phan tu cua mang:"
msg1: .asciiz "Nhap cac phan tu cua mang:"
ms2: .asciiz "Mang Xuat:"
ms3: .asciiz "     Tong cac so chan la:"
ms4: .asciiz "     Tong cac so le la:"
mangA: .word 
length: .word 10
trong: .asciiz "| "
.text
.globl main
main:
li $t2,1
li $t4,0
li $t5,0
li $v0, 4
la $a0, msg
syscall
li $v0, 5 
syscall
move $s2, $v0
la $s0, mangA 
li $s1, 0 
readLoop:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5 
	Syscall
	sw $v0, ($s0)
	addi $s1,$s1,1 
	rem $t3,$v0,2
	bne $t3,$t2,sochan
	add $t5,$t5,$v0 
	j Loop
	sochan:
	add $t4, $t4, $v0
	Loop:
	addi $s0,$s0, 4 
	blt $s1, $s2, readLoop
	
li $v0, 4
la $a0, ms2
syscall
la $s0, mangA
li $s1,0
printLoop:
	li $v0,1
	lw $a0,($s0)
	syscall
	li $v0,4
	la $a0,trong
	syscall
	addi $s1,$s1,1
	addi $s0 ,$s0 ,4
	bne $s1,$s2,printLoop
	Exit:
li $v0, 4
la $a0, ms4
syscall
li $v0,1
move $a0,$t5
syscall
li $v0,4
la $a0,ms3
syscall
li $v0,1
move $a0,$t4
syscall
	li $v0,10
	syscall
.end main