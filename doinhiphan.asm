; Lap chuong trinh nhap vao 1 so kieu word in ra man hinh ma nhi phan tuong ung cua so da nhap
.model tiny
.stack 100h
.data
st1 db "Nhap so kieu WORD :$"
st2 db 13,10,"Ma nhi phan tuong ung:$"
so dw 0
.code

mov ax,@data
mov ds,ax
lea dx,st1
mov ah,9
int 21h ;In xau st1
nhap:
mov ah,1
int 21h
cmp al,13
je nhiphan
sub al,30h
mov ah,0
mov cx,ax
mov bx,10
mov ax,so
mul bx
add ax,cx
mov so,ax
jmp nhap
nhiphan:
lea dx,st2
mov ah,9
int 21h
mov cx,0
mov bx,2
mov ax,so
chia:
mov dx,0
div bx
add dx,30h
push dx
inc cx
cmp ax,0
je inso
jmp chia
inso:
pop dx
mov ah,2
int 21h
loop inso

mov ah,4ch
int 21h

end