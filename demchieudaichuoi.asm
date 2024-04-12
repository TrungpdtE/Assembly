;Viet chuong trinh nhap vao mot chuoi. dem chieu dai cua chuoi nhap vao.
.MODEL small
.STACK
.DATA
tb1 DB 'Nhap vao 1 chuoi: $'
tb2 DB 10,13,'Tong chieu dai cua chuoi: $'
s DB 100,?,101 dup('$')
.CODE
BEGIN:
MOV AX, @DATA
MOV DS,AX
;xuat chuoi tb1
MOV AH,09h
LEA DX,tb1
INT 21h
;nhap chuoi s
MOV AH,0AH
LEA DX,s
INT 21h
;xuat chuoi tb2
MOV AH,09h
LEA DX,tb2
INT 21h
;Tinh chieu dai chuoi
XOR AX,AX
MOV AL,s+1 ;Chuyen chieu dai chuoi vao ax
MOV CX,0 ;Khoi tao bien dem
MOV BX,10
LapDem1:
MOV DX,0
DIV BX
PUSH DX
INC CX
CMP AX,0
JNZ LapDem1
;xuat chieu dai chuoi
MOV AH,2
LapDem2:
POP DX
OR DL,'0' ;chuyen chu so -> so
INT 21H
LOOP LapDem2
MOV AH,4ch
INT 21h
END BEGIN