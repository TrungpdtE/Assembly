;Lap chuong trinh nhap vao 1 so kieu word in ra man hinh ma Hexa tuong ung cua so do
.model tiny
.stack 100h
.data
st1 db "nhap so kieu word:$"
st2 db 13,10,"so do duoi dang hecxa:$"
a dw 0
.code

mov ax,@data
mov ds,ax

lea dx,st1
mov ah,9
int 21h
nhap:
mov ah,1
int 21h
cmp al,13
je inso
mov ah,0
sub al,30h
mov cx,ax
mov ax,a
mov bx,10
mul bx
add ax,cx
mov a,ax
jmp nhap
inso:
lea dx,st2
mov ah,9
int 21h
mov bx,16
mov ax,a
mov cx,0
chia:
mov dx,0
div bx
cmp dx,10
jae doi
add dx,30h
jmp cat
doi: 
add dx,37h
cat:
push dx
inc cx
cmp ax,0
je hienra
jmp chia
hienra:
pop dx
mov ah,2
int 21h
loop hienra

mov ah,4ch
int 21h

end