
.MODEL SMALL   ; KHAI BAO CHE DO BO NHO
.CODE
 
   ORG 100h
JMP MAIN  
   
   TB DB 'Chao cac ban $'

MAIN: 

MOV AH,9       
LEA DX,TB                          
INT 21H 
                
MOV AH,4CH              
INT 20H

RET                          
