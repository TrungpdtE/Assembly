;Nhap vao 2 so 16bit roi in ra UCLN cua chung:
	; MACRO
; MACRO khong lam thay doi gia tri cua bien vao, chi thay doi gia tri thanh ghi
Nhan MACRO reg, num
 LOCAL next, continue, exit
 PUSH AX
 PUSH DX
 PUSH CX
  
 MOV AX, reg
 MOV CX, num
 XOR DX, DX
 next:
  CMP CX, 0
  JE exit
  TEST CX, 1b  ; Ky tu cuoi cua AL = 1=> ZF = 0
  JZ continue  ; ZF = 1
  ADD DX, AX
  continue:
   SHL AX, 1
   SHR CX, 1
  JMP next
 exit:
  MOV reg, DX
  
 POP CX
 POP DX
 POP AX
ENDM

 
; Nhap so, luu vao AX
ScanNum MACRO
 local Nhap, exit
 PUSH BX
 MOV AH, 1
 XOR BX, BX  ; Tuong duong mov bx, 0
 Nhap:
  INT 21h
  CMP AL, 13
  JE exit
  AND AL, 0Fh
  Nhan BX, 10
  ADD BL, AL
  JMP Nhap
 exit:
  MOV AX, BX
 POP BX
ENDM
 
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
 

 
; Tim uoc chung lon nhat, xuat ket qua vao DX
UCLN MACRO m, n
 PUSH AX
 PUSH BX
  
 MOV AX, m
 MOV BX, n
 next:
  CMP AX, BX
  JE exit
  JB less
  SUB AX, BX
  JMP next
 less:
  SUB BX, AX
  JMP next
 exit:
  MOV DX, AX
   
 POP BX
 POP AX
ENDM
 
; Chuong trinh chinh
.MODEL small
ORG 100h
.DATA
 TB1 DB 'NHAP SO THU 1: $' 
 TB2 DB 0Dh, 0Ah, 'NHAP SO THU 2: $'
 TB3 DB 0Dh, 0Ah, 'UOC SO CHUNG LON NHAT CUA 2 SO LA: $'
 num1 DW ?
 num2 DW ?
.CODE

              
 PUSH AX
 MOV AH, 9
 LEA DX, TB1
 INT 21h
 POP AX 
              
 ScanNum  ; Xuat ra AL
 MOV num1, AX
  
 PUSH AX
 MOV AH, 9
 LEA DX, TB2
 INT 21h
 POP AX 
  
 ScanNum 
 MOV num2, AX
  
  
 PUSH AX
 MOV AH, 9
 LEA DX, TB3
 INT 21h
 POP AX 
  
 XOR DX, DX
 UCLN num1, num2
 MOV AX, DX
 PrintNums 
                
 mov ah, 4ch
 int 20h
 end              