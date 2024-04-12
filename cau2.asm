#Bai thuc hanh lab7
#Cau2
#24/11/2004 
#MSSV:522H0148
#Tacgia:ThanhTrung
.data
msg: .asciiz "Nhap so luong phan tu cua mang:"
msg1: .asciiz "Nhap cac phan tu cua mang:"
msg2: .asciiz "Tong la:"
mgs3: .asciiz "           Trung binh cong la:"
mangA: .word 
length: .word 10
trong: .asciiz "  "
.text
.globl main
main:
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
add $s3,$s3,$v0
addi $s0,$s0, 4 
blt $s1, $s2, readLoop
Exit:
li $v0, 4
la $a0, msg2
syscall
li $v0, 1
move $a0, $s3 
syscall 
li $v0, 4
la $a0, mgs3
syscall
div $s3,$s3,$s2
li $v0, 1
move $a0, $s3 
syscall 
li $v0,10

.end main