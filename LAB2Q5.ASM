ORG C0
DB "EUPHORIA";put word into VDU
DB 1 ;stopper
ORG F0
DB 0
DB 0
DB 0
DB 0
DB 0
ORG 0 ;go to code
MOV BL, C0 ;put reader into bl
MOV DL, 0

Loopy:
CMP AL, 1 ;if at end go to end
JZ ResetBL

MOV AL, [BL] ;put the char in bl in al

CMP AL, 41 ;compare char to vowel "a"
JZ CountyA
CMP AL, 45 ;compare char to vowel "e"
JZ CountyE
CMP AL, 49 ;compare char to vowel "i"
JZ CountyI
CMP AL, 4F ;compare char to vowel "o"
JZ CountyO
CMP AL, 55 ;compare char to vowel "u"
JZ CountyU
INC BL
JNZ Loopy

CountyA:
MOV CL, [BL] ;move bl char to cl
MOV DL, [F0]
INC DL
MOV [F0], DL
INC BL ;go next char
JMP Loopy

CountyE:
MOV CL, [BL] ;move bl char to cl
MOV DL, [F1]
INC DL
MOV [F1], DL
INC BL ;go next char
JMP Loopy

CountyI:
MOV CL, [BL] ;move bl char to cl
MOV DL, [F2]
INC DL
MOV [F2], DL
INC BL ;go next char
JMP Loopy

CountyO:
MOV CL, [BL] ;move bl char to cl
MOV DL, [F3]
INC DL
MOV [F3], DL
INC BL ;go next char
JMP Loopy

CountyU:
MOV CL, [BL] ;move bl char to cl
MOV DL, [F4]
INC DL
MOV [F4], DL
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
MOV AL, 41
MOV CL, 3A
MOV BL, C0
MOV DL, F0
JMP Newstring

Newstring: ;[F0-F4] is count for A,E,I,O,U
;

END 
