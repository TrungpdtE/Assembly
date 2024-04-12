#Bai thuc hanh lab5
#24/11/2022
#MSV:522H0248
#Tac gia: Pham Dang Thanh Trung
.data
msg: .asciiz "Nhap 2 so nguyen de tinh dien tich va chu vi, so nhap tuong ung la chieu dai va chieu rong \n"
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
# Tính tổng
mul $t3, $t1, $t2 # $t3 = $t1+$t2
#print a interger
li $v0, 1 # Load code=1 để hệ thống nhận biết print a integer
move $a0, $t3 # Di chuyển giá trị trong $t3 vào $a0 để xuất ra
syscall # Gọi hệ thống để xuất giá trị trong $a0 ra ngoài
add $t4,$t1,$t2
lw $t5,2
mul $t4,$t4,$t5
li $v0, 1 # Load code=1 để hệ thống nhận biết print a integer
move $a0, $t4 # Di chuyển giá trị trong $t3 vào $a0 để xuất ra
syscall # Gọi hệ thống để xuất giá trị trong $a0 ra ngoài
# Thoát
li $v0, 10
syscall