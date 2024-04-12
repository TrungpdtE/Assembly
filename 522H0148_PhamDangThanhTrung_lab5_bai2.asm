#Bai thuc hanh lab5
#Cau1
#24/11/2004
#MSSV:522H0148
#Tacgia:ThanhTrung
.data
msg: .asciiz "Nhap 2 so nguyen de tinh tong: \n"
.text
.globl main
main:
li $v0, 4
la $a0, msg
syscall
# Nhap so nguyen thu nhat
li $v0, 5 
syscall
move $t1, $v0 
#Nhao so nguyen thu hai
li $v0, 5 
syscall 
move $t2, $v0 
# Tính hieu
sub $t3, $t1, $t2 # $t3 = $t1+$t2
# Tinh tich
mult $t4,$t1,$t2 # $t4 = $t1 * $t2
#in so ra man hinh 
li $v0, 1 # Load code=1 ?? h? th?ng nh?n bi?t print a integer
move $a0, $t3 # Di chuy?n giá tr? trong $t3 vào $a0 ?? xu?t ra
move $a0, $t4
syscall # G?i h? th?ng ?? xu?t giá tr? trong $a0 ra ngoài
# Thoát
li $v0, 10
syscall