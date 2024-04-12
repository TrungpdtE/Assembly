; Lap chuong trinh nhap vao 2 so kieu byte,in ra man hinh tich 2 so v?a nh?p

.model tiny
.stack 100h
.data
tb1 db 'nhap a=$'
tb2 db 13,10,'nhap b=$'
tb3 db 13,10,'tich 2 so la:$'
so1 db 0
so2 db 0
.code
main proc
Mov ax,@Data
Mov ds,ax
Mov ah,9
;in thong bao nhap so thu 1
Lea dx,tb1
int 21h
nhap1:
mov ah,1
int 21h
cmp al,13 ;so sanh al voi 13
je nhap2 ;neu bang thi nhay den nhap 2
sub al,30h ; chuyen ky tu thanh so
mov dl,al ;cat al vao dl
mov al,so1 ; dua so vua nhap ve kieu byte
mov bl,10 ;gan bl =10
mul bl ;nhan al voi 10
add al,dl ;lay ket qua vua nhan cong voi so vua nhap
mov so1,al ;cat ket qua sau khi doi vao bien so1
jmp nhap1 ;nhay den nhan nhap 1
nhap2:
lea dx,tb2; in thong bao nhap so thu 2
mov ah,9
int 21h
nhap: 
mov ah,1
int 21h
cmp al,13 ; so sanh so vua nhap voi enter
je tinhtich ;neu bang thi tinh tich
sub al,30h ; chuyen xau vua nhap thanh so
mov dl,al ;cat so vua nhap vao dl
mov al,so2 ;dua so vua nhap ve kieu byte
mov bl,10 ;gan bl=10
mul bl ; lay so ban dau nhan voi 10
add al,dl ;lay ket qua vua nhan cong voi so vua nhap
mov so2,al ;cat ket qua sau khi doi vao bien so2
jmp nhap
tinhtich:
mov al,so1 ;dua so vua nhap ra thanh ghi al
mul so2 ;nhan voi so 2
mov bx,ax ;lay ket qua vua tinh chuyen vao thanh ghi bx
;in tich
mov ah,9 ;hien thong bao in tich
lea dx,tb3
int 21h
mov ax,bx ;chuyen ket qua ra thanh ghi ax
mov bx,10 ;gan bx=10
xor cx,cx ;khoi tao bien dem
chia: 
xor dx,dx ;xoa bit cao
div bx ;lay ket qua chia cho 10 du dat dx,thuong dat ax
push dx ;day du trong dx vao ngan xep
inc cx ;tang bien dem
cmp ax,0 ;so sanh thuong voi 0
ja chia ;neu lon hon thi chia
mov ah,2 ;lay chuc nang in ky tu ra man hinh
layra: 
pop dx ;lay du trong stasck khoi dx
add dl,30h ;chuyen so vua nhap sang dang ky tu
int 21h ;thuc hien in ky tu nam trong dl ra man hinh
loop layra: 
mov ah,4ch
int 21h
Main endp
End main