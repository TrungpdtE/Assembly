#Bai thuc hanh lab5
#Cau1
#24/11/2004
#MSSV:522H0148
#Tacgia:ThanhTrung
.data
msg: .asciiz "Nhap 2 so nguyen de tinh binh phuong: \n"
.text
.globl main
main:
li $v0, 4
la $a0, msg
syscall
# Nhap so nguyen 
li $v0, 5 
syscall
move $t1, $v0
#tinh binh phuong
mul $t3,$t1,$t1
#insoramanhinh
li $v0,1
move $a0,$t3
syscall
#thoat
li $v0,10
syscall
