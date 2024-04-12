#Bai thuc hanh lab5
#24/11/2022
#MSV:522H0248
#Tac gia: Pham Dang Thanh Trung
.data
msg: 	.asciiz	 "Nhap 2 so nguyen x,y de tinh tong \n"
.text
.globl main
main:
# Print string msg
li $v0, 4
la $a0, msg
syscall
# Nhap so nguyen thu nhat
li $v0, 5 # Load code =5 vào thanh ghi $v0 để hệ thống biết là nhập số nguyên
syscall # Gọi hệ thống để cho phép nhập số nguyên, và lưu số vừa nhập vào $v0
move $t1, $v0 # Di chuyển giá trị của thanh ghi $v0 vào $t1 ($t1 = số thứ 1)
#Nhao so nguyen thu hai
li $v0, 5 # Load code =5 vào thanh ghi $v0 để hệ thống biết là nhập số nguyên
syscall # Gọi hệ thống để cho phép nhập số nguyên, và lưu số vừa nhập vào $v0
move $t2, $v0 # Di chuyển giá trị của thanh ghi $v0 vào $t2 ($t2=số thứ 2)
# Tính 
mtc1 $t1, $f1 # switch register $t1 to $f1
mtc1 $t2, $f2 # switch register $t2 to $f2
cvt.s.w $f1, $f1 # convert integer $f1 to float $f1
cvt.s.w $f2, $f2 # convert integer $f2 to float $f2
div.s $f3, $f2, $f1 # Divide float $f3 = x/y
#in ra so thuc
li $v0, 2 # Load code=1 để hệ thống nhận biết print a integer
mov.s $f12, $f3 # Di chuyển giá trị trong $t3 vào $a0 để xuất ra
syscall # Gọi hệ thống để xuất giá trị trong $a0 ra ngoài
# Thoát
li $v0, 10
syscall