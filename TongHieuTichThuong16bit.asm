; nhap vao 2 so nguyen  16 bit
; tinh tong, hieu,tich,thuong     

; nhap 1 so bat ky trong bx
nhapso macro
    local nhap,ketthuc
    push ax
    mov bx,0
 nhap:
    mov ah,1
    int 21h
    cmp al,13
    je ketthuc
    push ax
    mov ax,bx
    mul t
    mov bx,ax
    pop ax
    and al,0fh
    add bl,al
    jmp nhap
 ketthuc:
    pop ax
   
endm  
; In 1 so bat ky o AX
PrintNums MACRO
 LOCAL next, exit, print
 PUSH BX   ; Cat cac gia tri vao stack
 PUSH CX 
 PUSH DX
  
 MOV BX, 10  ; So chia
 XOR CX, CX  ; MOV CX, 0
 next:
  CMP AX, 0
  JE exit  ; Neu AX = 0 thi dung lai
  XOR DX, DX ; MOV DX, 0
  DIV BX
  PUSH DX  ; DX la so du cua phep chia
  INC CX  ; Tang CX
  JMP next ; Lap lai
 exit:
  MOV AH, 2
   
 print:
  XOR DL, DL ; MOV DL, 0
  POP DX  
  OR DL, 30h ; Chuyen so thanh ma ASCII tuong ung
  INT 21h
  LOOP print ; Lap den khi nao CX = 0
   
 POP DX 
 POP CX 
 POP BX
ENDM


.model small
.code    
org 100h

jmp Main
    a dw ?
    b dw ?
    kq dw ?  
    sd dw ? 
    t dw 10
    tb1 db 'Nhap so a: $'
    tb2 db 'Nhap so b: $'
    tb3 db 'Tong hai so: $' 
    tb4 db 'Hieu hai so: $'
    tb5 db 'Tich hai so: $' 
    tb6 db 'Thuong hai so: $'  
    tb7 db 'So du: $'
    xdvdd db 13,10,'$' 
    
; chuong trinh chinh
Main Proc
         ; in ra tb3
    mov ah,9
    lea dx,tb1
    int 21h 
    nhapso
    mov a, bx
    call XD
    mov ah,9
    lea dx,tb2
    int 21h 
    nhapso
    mov b, bx
    call XD
    call Tong  
    call Hieu 
    ;call Tich  
    ;call thuong
    ;tro ve dos 
    mov ah,4CH              
    int 20h
Main endp

; xuong dong va ve dau dong

XD Proc
    
    ; Xuong dong
    mov ah,9
    lea dx,xdvdd
    int 21h  
    
   Ret       



 Tong Proc
    
     ; tinh tong
    mov ax,a
    add ax,b
    mov kq,ax
    
    Call XD  
    
    ; in ra tb3
    mov ah,9
    lea dx,tb3
    int 21h
    
    mov ax,kq
    PrintNums
    
    Ret
Hieu Proc
    
     ; tinh hieu
    mov ax,a
    sub ax,b
    mov kq,ax
    
    Call XD    
    
    ; in ra tb
    mov ah,9
    lea dx,tb4
    int 21h
    
    ; in ra ket qua        
    mov ax,kq
    PrintNums  
    
    Ret
Tich Proc
    
     ; tinh tich hai so 
    mov dx,0
    mov ax,a 
    mov bx,b
    mul bx
    mov kq,ax
    
    Call XD    
    
    ; in ra tb
    mov ah,9
    lea dx,tb5
    int 21h
    
    ; in ra ket qua        
    mov ax,kq
    PrintNums   
    
    Ret    
    
Thuong Proc
    
     ; tinh thuong 
    mov dx,0 
    mov ax,a
    mov bx,b
    div bx
    mov kq,ax  
    mov sd,dx
    
    Call XD    
    
    ; in ra tb
    mov ah,9
    lea dx,tb6
    int 21h
    
    ; in ra ket qua        
    mov ax,kq
    PrintNums     
                
     Call XD    
    
    ; in ra tb
    mov ah,9
    lea dx,tb7
    int 21h
    
    ; in ra ket qua        
    mov ax,sd
    PrintNums
    Ret