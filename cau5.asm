#Bai thuc hanh lab7
#Cau1
#24/11/2004
#MSSV:522H0148
#Tacgia:ThanhTrung
.data
tb: .asciiz "Nhap so luong phan tu cua mang:"
msg1: .asciiz "Nhap cac phan tu cua mang:"
ms2: .asciiz "Mang Xuat:"
am: "a["
ad: "]:"
mangA: .space 40
length: .word 10
trong: .asciiz "      "
n: .word 0
.text
.globl main
main:

li $v0,4
la $a0,tb
syscall
li $v0,5
syscall
sw $v0,n
lw $a0,n
li $t0,0

addi $sp,$sp,-16
sw $ra,($sp)
sw $s1,4($sp)
sw $s0,8($sp)
sw $t0,12($sp)
move $s1,$a0
li $t0,0
la $s0,mangA
lapnhap:
li $v0,4
la $a0,am
syscall
	
li $v0,1
move $a0,$t0
syscall
	
li $v0,4
la $a0,ad
syscall
	
li $v0,5
syscall

sw $v0,($s0)
addi $t0,$t0,1
addi $s0,$s0,4
blt $t0,$s1,lapnhap

lw $ra,($sp)
lw $s1,4($sp)
lw $s0,8($sp)
lw $t0,12($sp)
addi $sp,$sp,16


lw $a0,n
jal sapxep
lw $a0,n
jal xuat


sapxep:	
	addi $sp,$sp,-32
	sw $ra,($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $s4,12($sp)
	sw $s0,16($sp)
	sw $s1,20($sp)
	sw $s2,24($sp)
	sw $s3,28($sp)
	move $s1,$a0
	li $t0,0
	la $s0,mangA
	la $s2,mangA
lap2: 	
	addi $t1,$t0,1
	lw $s3,($s0)

lap1:
	lw $s4,4($s2)
	ble $s3,$s4,nhay
	sw $s4,($s0)
	sw $s3,4($s2)
	move $s3,$s4
nhay:
	addi $t1,$t1,1
	addi $s2,$s2,4
	blt $t1,$s1,lap1
	addi $t1,$t1,-1
	addi $t0,$t0,1
lp:
	addi $t1,$t1,-1
	addi $s2,$s2,-4
	bgt $t1,$t0,lp
	addi $s0,$s0,4
	blt $t0,$s1,lap2
	
	sw $ra,($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $s4,12($sp)
	sw $s0,16($sp)
	sw $s1,20($sp)
	sw $s2,24($sp)
	sw $s3,28($sp)
	addi $sp,$sp,32
	jr $ra
Ketthuc:
xuat:
	addi $sp,$sp,-16
	sw $ra,($sp)
	sw $s1,4($sp)
	sw $s0,8($sp)
	sw $t0,12($sp)
	move $s1,$a0
	li $t0,0
	la $s0,mangA
Lapxuat:
	li $v0,1
	lw $a0,($s0)
	syscall
	li $v0,11
	li $a0,32
	syscall
	addi $s0,$s0,4
	addi $t0,$t0,1
	blt $t0,$s1,Lapxuat
	lw $ra,($sp)
	lw $s1,4($sp)
	lw $s0,8($sp)
	lw $t0,12($sp)
	addi $sp,$sp,16
	jr $ra