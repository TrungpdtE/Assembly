#Cau1
#24/11/2004
#MSSV:522H0148
#Tacgia:ThanhTrung
.data
msg: .asciiz "Nhap 2 so thuc de tinh hieu va tích: \n"
.text
.globl main
main:
li $v0, 4
la $a0, msg
syscall
# Nhap so nguyen thu nhat
li $v0, 6
syscall
mov.s $f1, $f0 
#Nhao so nguyen thu hai
li $v0, 6
syscall 
mov.s $f2, $f0 
#tinh tong
add.s  $f3,$f1,$f2
#inra
li $v0, 2
mov.s $f12,$f3
syscall
#thoat
li $v0,10
syscall

