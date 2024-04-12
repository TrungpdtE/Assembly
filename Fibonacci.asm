`; MACRO
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
 
.MODEL SMALL
 ORG 100h
.DATA
 count DB ?
 Enter DB 0Ah, 0Dh, '?'
 ten DW 10
.CODE
 ScanNum
 MOV count, AL
  
 XOR DX, DX
  
 ; In dau Enter
 MOV AH, 2
 MOV DL, 0Ah
 INT 21h
 MOV DL, 0Dh
 INT 21h
  
 CMP count, 1
 JE in1
 CMP count, 2
 JE in11
  
 OR BX, 1
 PUSH BX
 PUSH BX
 ; In ra '1 1'
 MOV DL, '1'
  INT 21h
  MOV DL, ' '
  INT 21h
  MOV DL, '1'
  INT 21h
   
 SUB count, 2
 ; Dung stack de luu mang cac so Fibonacy
 next:
  MOV AH, 2
  MOV DL, ' '
  INT 21h
  MOV BP, SP
  MOV BX, [BP]
  ADD BX, [BP+2]
  PUSH BX
  MOV AX, BX
  PrintNums
   
  PUSH AX
  MOV AL, count
  DEC AL
  CMP AL, 0
  JE exit
  MOV count, AL
  POP AX
 JMP next
   
 JMP exit
 ; In so Fibonacy
 in1:
  MOV DL, '1'
  INT 21h 
  JMP exit 
 ; In 2 so dau trong day
 in11:
  MOV DL, '1'
  INT 21h
  MOV DL, ' '
  INT 21h
  MOV DL, '1'
  INT 21h
 exit:  
  
mov ah,4ch 
int 21h
  
end