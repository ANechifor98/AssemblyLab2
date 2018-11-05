ORG C0
DB "EUPHORIA" ;put word into VDU
DB 1 ;stopper
ORG 0 ;go to code
MOV BL, C0 ;put reader into bl
MOV DL, 0

Loopy:
CMP AL, 1 ;if at end go to end
JZ ResetBL

MOV AL, [BL] ;put the char in bl in al

CMP AL, 41 ;compare char to vowel "a"
JZ Pushy
CMP AL, 45 ;compare char to vowel "e"
JZ Pushy
CMP AL, 49 ;compare char to vowel "i"
JZ Pushy
CMP AL, 4F ;compare char to vowel "o"
JZ Pushy
CMP AL, 55 ;compare char to vowel "u"
JZ Pushy
INC BL
JNZ Loopy

Pushy:
MOV CL, [BL] ;move bl char to cl
push CL
INC DL
MOV [A0], DL
INC BL ;go next char
JMP Loopy

ResetBL:
MOV DL, 0
MOV BL, C0
JMP Newvdu

Newvdu:
MOV AL, [BL]
CMP AL, 1
JZ ResetBL2
MOV [BL], DL
INC BL
JMP Newvdu

ResetBL2:
MOV AL, [A0]
MOV BL, C0
JMP Newstring

Newstring: ;[40] is count for pop
CMP AL, 0
JZ Endy
pop DL
dec AL
mov [BL], DL
INC BL
JMP Newstring

Endy: ;holy fucking shit i cannot believe i did this by myself
END